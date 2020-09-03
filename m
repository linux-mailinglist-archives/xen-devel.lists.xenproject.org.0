Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFC25BCFB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 10:17:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDkPL-0007CS-2w; Thu, 03 Sep 2020 08:15:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP6q=CM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kDkPJ-0007CN-FY
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 08:15:45 +0000
X-Inumbo-ID: de320057-b441-41b4-8fc1-8c6145a53830
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de320057-b441-41b4-8fc1-8c6145a53830;
 Thu, 03 Sep 2020 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599120944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VjwptlLFdmjOA316+0lctWjIVuC9966OP2Cd6juf8C8=;
 b=SyKKwsnh16pfSkGUPYBYJAeZrBc/NpJabPrN9ckpiK7Wz/BKVoNpXXD3
 VozxK+mn8XQEJJ6oATCBCeA+mwtHfgUVno0rmKmbkDq8mRXR7YsTl92/e
 SS/nQrj5O3G8lf9fHvEv/MpWKje8ljGMGBNUAJxwCmKrqJKZ+GI1FHx3a 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8Q8i1MWT6hIskMtEOLfLSpFUnvFmV/oOqvTAqLU/Qthoawk9lXvYaG2tRXJideoevy/PUWmuVL
 Eos+UtMkZv91JPYjFQz3JFpKeKJQesxbgblSX24p5n91XGlfdJqvaWwcn1ws0/DoP+DkhkQ29q
 7SM8tdO5lNo1pNaei7VcjkWqGsEN6zs9UmnimN/DQJ30y9zg00obk+DQvN6DoBIJJOM3rT5Ggj
 dGjV9qWgschootmzZs7Jx1XY7+t0+fY0IKxORirKVFv0PlBOOwe2oPYMrl/vZ859EHCcxLLMAu
 lGA=
X-SBRS: 2.7
X-MesageID: 25909845
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,385,1592884800"; d="scan'208";a="25909845"
Date: Thu, 3 Sep 2020 10:15:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH v3 4/8] x86/svm: handle BU_CFG and BU_CFG2 with cases
Message-ID: <20200903080657.GJ753@Air-de-Roger>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-5-roger.pau@citrix.com>
 <6f7a8f21-008f-8b16-fc81-655a58338869@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6f7a8f21-008f-8b16-fc81-655a58338869@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 02, 2020 at 10:02:33PM +0100, Andrew Cooper wrote:
> On 01/09/2020 11:54, Roger Pau Monne wrote:
> > @@ -1942,19 +1966,6 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >      default:
> >          if ( rdmsr_safe(msr, *msr_content) == 0 )
> >              break;
> > -
> > -        if ( boot_cpu_data.x86 == 0xf && msr == MSR_F10_BU_CFG )
> > -        {
> > -            /* Win2k8 x64 reads this MSR on revF chips, where it
> > -             * wasn't publically available; it uses a magic constant
> > -             * in %rdi as a password, which we don't have in
> > -             * rdmsr_safe().  Since we'll ignore the later writes,
> > -             * just use a plausible value here (the reset value from
> > -             * rev10h chips) if the real CPU didn't provide one. */
> > -            *msr_content = 0x0000000010200020ull;
> > -            break;
> > -        }
> > -
> >          goto gpf;
> >      }
> >  
> > @@ -2110,6 +2121,12 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> >          nsvm->ns_msr_hsavepa = msr_content;
> >          break;
> >  
> > +    case MSR_F10_BU_CFG:
> > +    case MSR_F10_BU_CFG2:
> > +        if ( rdmsr_safe(msr, msr_content) )
> > +            goto gpf;
> 
> The comment you've moved depends on this not having this behaviour, as
> you'll now hand #GP back to Win2k8 on its write.

Oh, unless I'm very confused the comment was already wrong, since
svm_msr_write_intercept previous to this patch would return a #GP when
trying to write to BU_CFG if the underlying MSR is not readable, so
this just keeps the previous behavior.

Looking at the original commit (338db98dd8d) it seems the intention
was to only handle reads and let writes return a #GP?

Maybe Win2k8 would only read the MSR?

> Honestly, given that how obsolete both Win2k8 and K10's are, I'm
> seriously tempted to suggest dropping this workaround entirely.

I'm fine to just drop the workaround, but it seems quite trivial to
just keep it as is (reads returns a know value, writes #GP). I can
adjust the comment to be clearer.

Thanks, Roger.

