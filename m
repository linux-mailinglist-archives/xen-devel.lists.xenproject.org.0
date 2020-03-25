Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C10193241
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 22:01:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHD6a-00087q-Mc; Wed, 25 Mar 2020 20:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3jc=5K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHD6Y-00087l-PG
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 20:58:26 +0000
X-Inumbo-ID: 5e90ba0c-6edb-11ea-bec1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e90ba0c-6edb-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 20:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585169906;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0MV9rK8SGc3yWgXwX94hJ990O9OxTcbVzKeb89AKEoE=;
 b=SqDwOVNfOyQkFXUmJg7NmbKtwxpddD2R2IlVOK3kIaqF/ayrKYQN92/q
 0VAoS4Iwl92r/QX3sXR0Jn/B7Ne8Hs24n2Weq4KopwfX6ARyjNScpSR/R
 owG0tZnw9Mb5my3GtvdGZzUx7MJXqTFyVpcEPE4GKxuWtb8cn35LmMkWs U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PfvNIeqJypYEqufXUGh4VswgdVCT5btEx2Pu1NDBtemkA0m2qjZJyo4BHtLXafDZOi7WlGUjnN
 hJxASghOtmpp6xrcUM1RGWJNfaKY5sRYR1mxi8TupGvtnRV8JW3XqtP7tsW9Qdssg4kM2Sw8dM
 EL0jRLqIbH+Ya9egxRuGgECpoAtCwPgb93aHFmB6KgfEl7GGBMYsse0RZYa7hZjZbvAFokF0Ds
 xdW97bpKoSpMo3kegZ/lg2e7lo/xMDU9GPMPptju6H6qtg7v87rxvYf6i9IVZ5yaE4OlEd/cXN
 RsA=
X-SBRS: 2.7
X-MesageID: 14622382
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,305,1580792400"; d="scan'208";a="14622382"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <01414205-1157-9d50-8d45-3e833b430c8e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f3ccdba4-736e-4e30-028f-2b571724cdf6@citrix.com>
Date: Wed, 25 Mar 2020 20:58:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <01414205-1157-9d50-8d45-3e833b430c8e@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 02/10] x86emul: support MOVDIRI insn
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/03/2020 12:29, Jan Beulich wrote:
> Note that SDM revision 070 doesn't specify exception behavior for
> ModRM.mod == 0b11; assuming #UD here.

Didn't I confirm this behaviour for you last time around?

> @@ -10075,6 +10079,14 @@ x86_emulate(
>                              : "0" ((uint32_t)src.val), "rm" (_regs.edx) );
>          break;
>  
> +    case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
> +        vcpu_must_have(movdiri);
> +        generate_exception_if(dst.type != OP_MEM, EXC_UD);
> +        /* Ignore the non-temporal behavior for now. */
> +        dst.val = src.val;
> +        sfence = true;

Looking again at the SDM, I'm not entirely sure this is good enough.

Even on top of WB/WP mappings, it needs to have WC properties, knock
aliasing lines out of the cache, and ending up as a bus transaction.

Also, I'm not convinced the current chunking algorithm for qemu which
repeatedly subdivides down to 1, is compatible with the misaligned
behaviour described, guaranteeing a split of two.

~Andrew

