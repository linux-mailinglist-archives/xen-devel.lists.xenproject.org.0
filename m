Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF835969B77
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788980.1198507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRaN-00033x-W4; Tue, 03 Sep 2024 11:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788980.1198507; Tue, 03 Sep 2024 11:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRaN-00032O-Sc; Tue, 03 Sep 2024 11:20:35 +0000
Received: by outflank-mailman (input) for mailman id 788980;
 Tue, 03 Sep 2024 11:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN9y=QB=bounce.vates.tech=bounce-md_30504962.66d6f0ff.v1-beec7d44dda04b26860493b8028df676@srs-se1.protection.inumbo.net>)
 id 1slRaM-00032I-2p
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:20:34 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88243aef-69e6-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 13:20:32 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4Wyjpl2WW5zRKLhtV
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 11:20:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 beec7d44dda04b26860493b8028df676; Tue, 03 Sep 2024 11:20:31 +0000
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
X-Inumbo-ID: 88243aef-69e6-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725362431; x=1725622931;
	bh=DuQy8JknslS+kn0/bIFrfJKbV22kgVwu00erMszGcQ8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TfSrGWIaYUgNdfYBsDenKpuU/R1l1+TYCPxF1Pb3csifVvzcRvVyrKl3nDdgAAZjO
	 VtI/tHlJYTz1MXE4S9UmjGbAjKw3VAb5KUoO/uXJU3i4o2Cghm5Bd8tPUtkkJ5sT4G
	 ZRrnvBKoQ1y4EnsZy3JCqGjOk7I9YFF2PNPbRrW32UdxD14/TgFosY9q3yvYSVakm5
	 5PUvsyiJX51l/AaWrjqHDe+I4K19xc51xDeA7iU9W469ocqq6sHivtjGQYVeYdGd72
	 i+EabDseRqHeaL35Gnm9733OIHB/AguC9FbYVCFQ9KE1eL19Hys4hIZi5Kj+QkZxSH
	 xqsZFy7fX0p9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725362431; x=1725622931; i=anthony.perard@vates.tech;
	bh=DuQy8JknslS+kn0/bIFrfJKbV22kgVwu00erMszGcQ8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=z/sYF6Whpmj5FKJi1vE2sMrY6Q6Ka+2iINzcew69N2ZTD92YajyPvEX9bWQn98H3K
	 JuW9ISy99WUwZUfykr5OgXNK6GlS5ZccbwlKLfefh4xEqBdsyK6wqmaqjHXiLdG2z7
	 zcrVbAARNEzuysqDGjCEh/Na68EYCIqIcJ9pDq3UMu3DKa71xcZXXoxsrxO0eKpxUQ
	 YEDTlb5E/mvodvIm8fnmbrLnwldfUL9rlaSdk71BqfsKfVGZ8xt5JbDtjlaocshOqD
	 ez8MIBf4whf0kl1CjvHhQMq4AHWuzG2xw+XVUFMjBByB3tH+bswROjO9KOKNZCa0cd
	 SdpJqqx24oeQA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/boot:=20Reinstate=20-nostdinc=20for=20CFLAGS=5Fx86=5F32?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725362430278
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <Ztbw/QwIvgQNcmoo@l14>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.beec7d44dda04b26860493b8028df676?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 11:20:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 11:49:40AM +0100, Andrew Cooper wrote:
> Most of Xen is build using -nostdinc and a fully specified include path.
> However, the makefile line:
> 
>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> 
> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> 
> Reinstate -nostdinc, and add the arch include path to the command line.  This
> is a latent bug for now, but it breaks properly with subsequent include
> changes.
> 
> Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")

I disagree with this. I'm pretty sure I've check that no command line
have changed.

Also, this commit shows that CFLAGS was only coming from root's
Config.mk:
> diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot
> deleted file mode 100644
> index e90680cd9f..0000000000
> --- a/xen/arch/x86/boot/build32.mk
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -override XEN_TARGET_ARCH=x86_32
> -CFLAGS =
> -include $(XEN_ROOT)/Config.mk

So, I'm pretty sure, -nostdinc was never used before. But happy to be
told that I've come to the wrong conclusion. (We would need to check by
building with an old version without this commit to be sure.)

"xen/arch/x86/boot" as it's own sets of CFLAGS, which is annoying and I
haven't really tried to change that. This is also why XEN_CFLAGS is been
discarded.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

