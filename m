Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5E257B74
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 16:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCl3k-0001Ld-Oz; Mon, 31 Aug 2020 14:45:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWhU=CJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kCl3j-0001LY-Co
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 14:45:23 +0000
X-Inumbo-ID: 84d0df6a-d6f0-4339-96a9-abbf7b5fdf4a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84d0df6a-d6f0-4339-96a9-abbf7b5fdf4a;
 Mon, 31 Aug 2020 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598885122;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wiGyrzHCPYOvxlZXiwQIoSmAdRyj60E8owM2kvpnABo=;
 b=S38ct+UWVWyJ76W37HkEWT0W4gHuA9EKoQ9EXNRVxXpmvSVvzc5QsJ08
 joxuNYril2z6cnNGkklT2oUTgmD4oA0aipCMC9N93Oeo268Y36ZBAuYHN
 zywte9e1THU2Fr1K3/qYEeA++hG5vdKFxkDkmS0L92D0OxtXQBlEAD4// Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PMasA22eX3nB5Mnou8/O56kLHX494EAC/gJieZvJ50smn8yfRPY+mSO8eZHf6uEUUxYOt+iOjd
 VW3pQ2W8AmD2E3i77PVp/ZGC1x6Ziy9yfugiWGV5+GbBVbMqkxW4mL2HFuQIwBVI0m7odPWqe4
 OLjcqufadJnt+9FPTgubxkPyXPakU0PQE3NxmDS8XBY1P+yr2IayYEIB+P8GVxHBzEtskC0ave
 lWpVk7PzwFe2j8/gXI2TqvgwvwPs++66trdamOLWaV+gaBv6dQEXGjxv3GIpdv0J2SVEisEXkr
 gUo=
X-SBRS: 2.7
X-MesageID: 25669126
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,375,1592884800"; d="scan'208";a="25669126"
Date: Mon, 31 Aug 2020 16:45:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/8] x86/svm: silently drop writes to SYSCFG and
 related MSRs
Message-ID: <20200831144445.GE753@Air-de-Roger>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-3-roger.pau@citrix.com>
 <52cde027-e7c2-3ca7-3d7e-7abfe19198da@suse.com>
 <20200831143747.GD753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200831143747.GD753@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Mon, Aug 31, 2020 at 04:37:47PM +0200, Roger Pau Monné wrote:
> On Thu, Aug 27, 2020 at 05:03:50PM +0200, Jan Beulich wrote:
> > On 20.08.2020 17:08, Roger Pau Monne wrote:
> > > --- a/xen/arch/x86/hvm/svm/svm.c
> > > +++ b/xen/arch/x86/hvm/svm/svm.c
> > > @@ -1917,6 +1917,21 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> > >              goto gpf;
> > >          break;
> > >  
> > > +    case MSR_K8_TOP_MEM1:
> > > +    case MSR_K8_TOP_MEM2:
> > > +        *msr_content = 0;
> > > +        break;
> > 
> > Any reason you don't fold this with ...
> > 
> > > +    case MSR_K8_SYSCFG:
> > > +        /*
> > > +         * Return MtrrFixDramEn: albeit the current emulated MTRR
> > > +         * implementation doesn't support the Extended Type-Field Format having
> > > +         * such bit set is common on AMD hardware and is harmless as long as
> > > +         * MtrrFixDramModEn isn't set.
> > > +         */
> > > +        *msr_content = K8_MTRRFIXRANGE_DRAM_ENABLE;

On the previous version you commented that returning 0 here would be
more correct, do you still think so?

I agree it seems better to not report any of those MTRR AMD specific
features, since we don't implement them in our emulated MTRR code.

Thanks, Roger.

