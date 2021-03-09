Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0D332ABD
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 16:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95590.180505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJeSG-0000u0-Vc; Tue, 09 Mar 2021 15:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95590.180505; Tue, 09 Mar 2021 15:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJeSG-0000te-S6; Tue, 09 Mar 2021 15:39:28 +0000
Received: by outflank-mailman (input) for mailman id 95590;
 Tue, 09 Mar 2021 15:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FLA=IH=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJeSF-0000tZ-KR
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 15:39:27 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b0e38db-5cdf-48f5-aa3d-bcd6901f06ef;
 Tue, 09 Mar 2021 15:39:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v2so14758355lft.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Mar 2021 07:39:26 -0800 (PST)
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
X-Inumbo-ID: 3b0e38db-5cdf-48f5-aa3d-bcd6901f06ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l58xmmVOujUcw8TlSSVOH7vDnqxBI6hJIhiBvOHQ3Tk=;
        b=bsisIYh6Qra+bnUKUlVJ4KB22EmyrjLM/7CDHGuRv9o5pLPVwxFuV/L9d9A/Jeq/9x
         DgXYw24CdpC3yvyPVQPJbhQZgY5IW9dt1L6zK0OqDxVDv7YDk9gqmVD4wXdGIYUZ+Wjc
         aR8Th8BOQDWO4LYndjH1KxglUD2zTuMEohfnmAYFftqvLvUghjpoiLBBWu4n5batpZLF
         Hh+BHCUV4r2cRI03aIqsaAD3/NEq4hMnCLYIVTL59ibXM2c4egQ0ODmsif2bRAWthLx+
         jo/BhSEngrFhOU/NkAYCFyka/5olyJQYRRQfTVgXEtfkSV0z/AdXiCivGkfubQ/fRGmI
         cxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l58xmmVOujUcw8TlSSVOH7vDnqxBI6hJIhiBvOHQ3Tk=;
        b=HYlemSoutksq+Nxlx7h1MY1nNLEkmF4faGYYcvW3vEyQ9CLIBtxlvLKEsMmooZHMfh
         BEujDMp/X+5keuhHr3Q0bSq6HdKXWdPaevPsGUiGNpnlfdI6IamD1a23bM2WgCkMv+Wv
         iTUu0PLTDy6/uGA+zAMyUvjdhe1y1NiWoC6qwmxhqkJwKlId54qo/XYRE1B7tizKILVP
         9oZ2XZb5on4vATEiiu9jVYKcQeLqRR1iXXt5VRLOB//Y3hELUBlhIN0yCR/rfueDld17
         k6Q/TXskI6bvjKl7bq0RRxxL8pcNWFzOWd7SBg8Q7T0Tuj2DhY9CWFqyZpBdNn9R0FCt
         dd/Q==
X-Gm-Message-State: AOAM533h1P0WC17C2QSaZgZd4ZZfZz+HX2g1MJ20YOBeCZJvVOTKcAyr
	EwJkNXK+UFunv7AVUNl1KpB+ZK35+72LrnObzYE=
X-Google-Smtp-Source: ABdhPJwujjv8+xAbRl5wwIBuE0bkomGV2eFE7SvJB7axQ5lqRnUS3QH9t4Z4GESiRYiYe3Z5fEnD7CjwaCC1/oqQ5n8=
X-Received: by 2002:a05:6512:370f:: with SMTP id z15mr6872274lfr.562.1615304365529;
 Tue, 09 Mar 2021 07:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20210309145002.30359-1-iwj@xenproject.org> <20210309145002.30359-4-iwj@xenproject.org>
In-Reply-To: <20210309145002.30359-4-iwj@xenproject.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Mar 2021 10:39:14 -0500
Message-ID: <CAKf6xps8wgo0=Nkh0Kt3bKpHtuHAOrKh77y+wn+RofVoW_qwQA@mail.gmail.com>
Subject: Re: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from SUPPORT.md
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 9, 2021 at 9:50 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>  CHANGELOG.md | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 4ecd157a35..ccdbb82c2e 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,16 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>
>  ## [Unreleased](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog)
>
> +## Added / support upgraded
> + - Linux device model stubdomains (Tech Preview)

This is inaccurate. Linux device model stubdomains went into 4.14, but
SUPPORT.md was only updated in 4.15.  Patch 2/3 removed "libxl support
for running qemu-xen device model in a linux stubdomain."

Regards,
Jason

