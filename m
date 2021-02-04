Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04930F239
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 12:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81263.149842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ctz-00054x-Gs; Thu, 04 Feb 2021 11:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81263.149842; Thu, 04 Feb 2021 11:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ctz-00054Y-DJ; Thu, 04 Feb 2021 11:34:23 +0000
Received: by outflank-mailman (input) for mailman id 81263;
 Thu, 04 Feb 2021 11:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gM/o=HG=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1l7ctx-00054D-AC
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:34:21 +0000
Received: from know-smtprelay-omc-8.server.virginmedia.net (unknown
 [80.0.253.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 672b21cb-7e7b-4d2d-bb82-3284626e35a3;
 Thu, 04 Feb 2021 11:34:19 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.38.249.212]) by cmsmtp with ESMTPA
 id 7ctslcLipCZ837ctslSVv4; Thu, 04 Feb 2021 11:34:17 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 62266308D68;
 Thu,  4 Feb 2021 11:34:15 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id y8lExBB9cpw0; Thu,  4 Feb 2021 11:34:15 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 1E61E308D65;
 Thu,  4 Feb 2021 11:34:15 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 074DE5AA; Thu,  4 Feb 2021 11:34:15 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 672b21cb-7e7b-4d2d-bb82-3284626e35a3
X-Originating-IP: [82.38.249.212]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=HNHt6Llv c=1 sm=1 tr=0 a=gXUefieqlD6GaZBkXOTlrw==:117
 a=gXUefieqlD6GaZBkXOTlrw==:17 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=qa6Q16uM49sA:10 a=5IRWAbXhAAAA:8 a=iox4zFpeAAAA:8 a=OcvHiVVtRz9wdHm9D6gA:9
 a=CjuIK1q_8ugA:10 a=xo7gz2vLY8DhO4BdlxfM:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Thu, 4 Feb 2021 11:34:15 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	James Dingwall <james-xen@dingwall.me.uk>
Subject: Re: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
Message-ID: <20210204113415.GA1293808@dingwall.me.uk>
References: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
X-CMAE-Envelope: MS4wfDUH5sCO75autlK1GoiV1JoOySY9hMjLWzgvPEPwVCssC8THxMce8kEXKMIBxm60f6B3SyOuNwgIKuwLP0rX0aOCEDei8ojO64CQgi+XjLv5O2h/9hWl
 9uivZ6nriPp9Hsn7FdN/r9SiOYp73VZ/uxwU/Wb4YliijKvnxNdeovEXilA+AtJCLPvwj6HJbQFn59xXl111G+elDkM56srEKLR/b1DLtVRUFpulFLyppC9f
 odR1Jbku5j6wzIpoUqgT7D8+tjwCw2XfpnPSpgJArSv7td3Lw52hFVqhhsO5NyGoFMKRc6hhSzLyeZlGMZB8Ug==

Hi Jan,

On Thu, Feb 04, 2021 at 10:36:06AM +0100, Jan Beulich wrote:
> X86_VENDOR_* aren't bit masks in the older trees.
> 
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -226,7 +226,8 @@ int guest_rdmsr(const struct vcpu *v, ui
>           */
>      case MSR_IA32_PERF_STATUS:
>      case MSR_IA32_PERF_CTL:
> -        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
> +        if ( cp->x86_vendor != X86_VENDOR_INTEL &&
> +             cp->x86_vendor != X86_VENDOR_CENTAUR )
>              goto gp_fault;
>  
>          *val = 0;

Thanks for this patch, I've applied it and the Windows guest no longer crashes.

Regards,
James

