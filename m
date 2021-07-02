Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EAA3BA2F1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 17:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149208.275853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLSD-0003Sw-7O; Fri, 02 Jul 2021 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149208.275853; Fri, 02 Jul 2021 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLSD-0003QD-3d; Fri, 02 Jul 2021 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 149208;
 Fri, 02 Jul 2021 15:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GKt=L2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lzLSB-0003Q3-ED
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 15:51:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c74e55fe-1ce7-4883-84a5-2eb606b27198;
 Fri, 02 Jul 2021 15:51:42 +0000 (UTC)
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
X-Inumbo-ID: c74e55fe-1ce7-4883-84a5-2eb606b27198
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625241102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BjTqGy4abhKp1gc8m9BKzlsOJmsOYRUY/uoo8dZsolQ=;
  b=EQqDyzzQPjL0k+7ZjWEExH0mNVwd4haNuq07kAD01UMQQUrEMhAajjug
   IKyZdJRHgZqCFSWrqc57Qg1F5gdGKKy3qzLzJFDbXY64Dj+OsvX51mUD+
   VCGzp6gxp2cXs88nSa5JTsgUfjtGMcKvERurc5jFtqvik39+3U/Ngejql
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5FoqbxpJvQGHXpeWq5UWrpKAmtCthWJJNpCeswrd1d7pWx0OOKa/ZXTwLhcwOGYxOAQ+gSgXs6
 8ux9AbSoaLOnQNXjAUTfpYGka1zRj1uNydN8tUF/CRJUxaUya8W4ebsI57CaAlUcQqhpuER9O0
 t3lJBz851hpY/cRinxO/dy0kyeLyg/dwoVggGwozafZ3HkrhxZoGynJqNcCY9n7IMDbvTiftAG
 DZi1TYerS3BMJEnTsVcB2xpL/6SLsWl643LwV92jQ5ypxZNEjr3bNnW190dmRYmnRZQYg+2kpZ
 3Ak=
X-SBRS: 5.1
X-MesageID: 49104571
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PmKBF6iKTgOr8h62UT8Hcq/G4nBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.83,317,1616472000"; 
   d="scan'208";a="49104571"
Date: Fri, 2 Jul 2021 16:51:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxl/x86: check return value of
 SHADOW_OP_SET_ALLOCATION domctl
Message-ID: <YN82Cns3v7OouqTE@perard>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
 <YN2Mujj8jKGv7tik@perard> <4913d3f6-cd16-1865-9c19-99f7db615ded@suse.com>
 <YN8m4BBYrb++fEYN@perard> <89ccd8b7-42e1-0e86-5929-2a33fa1b9c4b@suse.com>
 <61f96b68-cd29-84c2-33ca-e114a6fc7714@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <61f96b68-cd29-84c2-33ca-e114a6fc7714@suse.com>

On Fri, Jul 02, 2021 at 05:14:40PM +0200, Jan Beulich wrote:
> On 02.07.2021 17:12, Jan Beulich wrote:
> > On 02.07.2021 16:46, Anthony PERARD wrote:
> >> On Fri, Jul 02, 2021 at 02:29:31PM +0200, Jan Beulich wrote:
> >>> On 01.07.2021 11:36, Anthony PERARD wrote:
> >>>> On Mon, Jun 28, 2021 at 01:47:03PM +0200, Jan Beulich wrote:
> >>>>> --- a/tools/libs/light/libxl_x86.c
> >>>>> +++ b/tools/libs/light/libxl_x86.c
> >>>>> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
> >>>>>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
> >>>>>          unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
> >>>>>                                             1024);
> >>>>> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> >>>>> -                          NULL, 0, &shadow, 0, NULL);
> >>>>> +        int rc = xc_shadow_control(ctx->xch, domid,
> >>>>
> >>>> Could you use 'r' instead of 'rc' ? The later is reserved for libxl
> >>>> error codes while the former is for system and libxc calls.
> >>>
> >>> Of course I can, but I did look at the rest of the function and
> >>> found that it uses "ret" for the purpose of what you now say
> >>> "rc" ought to be used for. Seeing "ret", I decided to avoid it
> >>> (knowing you use different names for different kinds of return
> >>> values). While I've switched to "r" for now, I'd be rather
> >>> inclined to re-use "ret" instead. (Or actually, as per the
> >>> remark further down, I can get away without any local variable
> >>> then.)
> >>
> >> I know there's quite a few (many?) coding style issue in libxl. I'm
> >> trying to prevent new issue without asking to fix the existing one.
> >> The use of "ret" is an already existing issue, so I'm fine with it been
> >> use in this patch for libxl error code in the function.
> >>
> >> BTW, you still need to store the return value of xc_shadow_control()
> >> into a "r" variable before checking it for error.
> > 
> > Are you saying that
> > 
> >         if (xc_shadow_control(ctx->xch, domid,
> >                               XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> >                               NULL, 0, &shadow_mb, 0, NULL)) {
> > 
> > is not acceptable, style-wise?
> 
> Oh, there is indeed such a rule under "ERROR HANDLING". Which means ...
> 
> > If indeed you are, please disambiguate
> > your statement above regarding the use of "ret": May I or may I not
> > use it? IOW do I need to introduce "r", or can I get away with the
> > existing local variables.
> 
> ... I need this to be clarified.

You need to introduce the "r" local variable, to store xc_shadow_control
return value.
Then, set "ret" to ERROR_FAIL before "goto out;".

Hope that's clearer.

Cheers,

-- 
Anthony PERARD

