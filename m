Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C95AFB71F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035663.1408012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYndA-00018h-7u; Mon, 07 Jul 2025 15:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035663.1408012; Mon, 07 Jul 2025 15:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYndA-00015g-4w; Mon, 07 Jul 2025 15:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1035663;
 Mon, 07 Jul 2025 15:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uof1=ZU=bounce.vates.tech=bounce-md_30504962.686be58b.v1-f78e2875b72942ccbd874b6763acab5b@srs-se1.protection.inumbo.net>)
 id 1uYnd8-00015K-SY
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:19:42 +0000
Received: from mail124.us4.mandrillapp.com (mail124.us4.mandrillapp.com
 [205.201.136.124]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd4d8b6f-5b45-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 17:19:41 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail124.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bbSZz5VmXzKsbrtl
 for <xen-devel@lists.xenproject.org>; Mon,  7 Jul 2025 15:19:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f78e2875b72942ccbd874b6763acab5b; Mon, 07 Jul 2025 15:19:39 +0000
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
X-Inumbo-ID: cd4d8b6f-5b45-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751901579; x=1752171579;
	bh=MjlBDi7q8oAzhpuB7HxrqrsUIOvt9qPPpe+xr6zQDF0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZU7EMMFZ3Ly9Dtln17Ala3xEjYEvrTxSj6/BcDnr/xIu8wA3iJi17iodKJdHdx6IZ
	 ntLllnWwaxke3VD+z+jn0vMyzXDzM18kSftsbo+E5TLdVUS9FZ4ogtnK3Wzlp9NVLZ
	 S3SHkm4NrOTJdwTGTI71BNfY87aGZcQXP3LTFHhhHYClb8nmtTsaT2Azj+OMhvEIrW
	 WVpLABQYup7XA3oeK7qyFY+MJMJFXRbmGDxmptqOGo4JyZjeHQp8Qv5NHYZLU1zp4n
	 /4HQitm1rV8o7Vc5h0doqORVEbJbNpNjJADG/8j+2cFkzcMgFNnLBgN4Vvp4hI3elF
	 ng9euGVNQ9Rgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751901579; x=1752162079; i=anthony.perard@vates.tech;
	bh=MjlBDi7q8oAzhpuB7HxrqrsUIOvt9qPPpe+xr6zQDF0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AxtnvOwARNlUSJ4o6sWc0qhvn5JlN3JA8b5tx5hGJEnBzx97L/L4FShfc7QLBOGGl
	 omQeaHP+Tbscd8ZM3hLTXNLpUu7Ej41W49CsXYPhuiDrVBH9jsHQ+PJLmR+oLlkquW
	 t50/+JooWiX5n5Mdhz9XqYIChA7GY/b/xI/xEVj4O7+vr41TnKSBTQ29SXSOoxtdt5
	 RmcnCG/qc0QVNB3RZt8JwLfDlwPGY7lvzrk1zu9o1uayRg4nwp9/uKiQqK3Pbkcv6y
	 ZI/BfO+WFOXQkmS+wsIkkGzv1hjHmHqipTWtSIXHSGdQWo4CrTYnbbqxw7zygTNhJW
	 KmccVlZz1XRQg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6]=20automation/eclair:=20update=20configuration=20of=20D4.10?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751901577706
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com, federico.serafini@bugseng.com, "Nicola Vetrini" <nicola.vetrini@bugseng.com>
Message-Id: <aGvliTiOQCBl1t0v@l14>
References: <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop> <aGvCAbCGfQ8Vzcp2@l14>
In-Reply-To: <aGvCAbCGfQ8Vzcp2@l14>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f78e2875b72942ccbd874b6763acab5b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250707:md
Date: Mon, 07 Jul 2025 15:19:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 07, 2025 at 12:48:06PM +0000, Anthony PERARD wrote:
> On Mon, Jun 23, 2025 at 06:19:27PM -0700, Stefano Stabellini wrote:
> > diff --git a/xen/include/xen/compile.h.in b/xen/include/xen/compile.h.in
> > index 3151d1e7d1..9206341ba6 100644
> > --- a/xen/include/xen/compile.h.in
> > +++ b/xen/include/xen/compile.h.in
> > @@ -1,3 +1,6 @@
> > +#ifndef XEN_COMPILE_H
> > +#define XEN_COMPILE_H
> > +
> >  #define XEN_COMPILE_DATE	"@@date@@"
> >  #define XEN_COMPILE_TIME	"@@time@@"
> >  #define XEN_COMPILE_BY		"@@whoami@@"
> > diff --git a/xen/tools/process-banner.sed b/xen/tools/process-banner.sed
> > index 56c76558bc..4cf3f9a116 100755
> > --- a/xen/tools/process-banner.sed
> > +++ b/xen/tools/process-banner.sed
> > @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
> >  
> >  # Trailing \ on all but the final line.
> >  $!s_$_ \\_
> > +
> > +# Append closing header guard
> > +$a\
> > +\
> > +#endif /* XEN_COMPILE_H */
> 
> Is it wise to put the closing header guard in a file call
> "process-banner" ? It's not call compile.h-footer.sed.
> 
> There's a few way to make this better:
> - simple add the header guard from the Makefile, both opening and
>   closing.
> - Do some more sed with something like:
>   sed -rf process-banner.sed < .banner >> .banner.processed.tmp
>   sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
>       ... \
>       -e '/XEN_BANNER/r .banner.processed.tmp'
>   # and having the closing header guard in "compile.h.in"
>   This will add the outpot of process-banner.sed in the lines after
>   "#define XEN_BANNER", and so before the closing header guard.
> - rename the sed command file
> (- a forth option would be to use filechk make macro, but the check for
>  if [ ! -r $@ -o -O $@ ] would be annoying to reproduce.)
> 
> Another thing, this could be done in a patch that isn't called
> "automation/eclair: update configuration of D4.10".

Sorry, I failed to notice the patch was already commited. I guess it's
good enough like that.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



