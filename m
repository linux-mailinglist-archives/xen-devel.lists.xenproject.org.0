Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E999B7C90
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828729.1243721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Vz8-00031y-3H; Thu, 31 Oct 2024 14:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828729.1243721; Thu, 31 Oct 2024 14:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Vz7-00030P-V3; Thu, 31 Oct 2024 14:17:13 +0000
Received: by outflank-mailman (input) for mailman id 828729;
 Thu, 31 Oct 2024 14:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=35SK=R3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6Vz7-00030J-4g
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:17:13 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d116edf6-9792-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 15:17:10 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cb615671acso618076a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:17:10 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5663d3f7sm73679666b.146.2024.10.31.07.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:17:07 -0700 (PDT)
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
X-Inumbo-ID: d116edf6-9792-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQxMTZlZGY2LTk3OTItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg0MjMwLjIzMzk0OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730384230; x=1730989030; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rtUDKr30bxi4YmQ24DyvStSXJ3uyydsDun3k1F5D9w=;
        b=WTwNJMc+VOXrRuJ1DfM8w19UVbceAJC/vpEliWFJj+PlZmzKeBFrRyQ6fdgB8tdRpC
         nUUxDaHC9HbjkNHtr2t61KxQ5Lf5A5jcmxRsysmJR8rT3aQdeCKjXbrSFtzO8dy/FQaW
         Td6g/v0+fzsN3nUGS1czZpQm507oHRgsO0b1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384230; x=1730989030;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6rtUDKr30bxi4YmQ24DyvStSXJ3uyydsDun3k1F5D9w=;
        b=uxx+6nyueN9w/vlLZ4UEJSInQY0wTyfJ2Q4GS2i8bEDPIkenQH+Ue8DXtfV+Mo/ykf
         OUUPY1JFLAon67O1ClciHE7/7C49REYfpHSUIzCbMyzUvJDw7iPUV84+WBMGDJPHI/W+
         B8eQk5O978mjXGpRFkWpT/fFNGIQzq5f8SL00I83AGrj/EOLXd/tPHegYe8086m9hcxZ
         2TnJgy9AG8EYQDrLL0zNSN/oHBzhi38bWNx91G0IslkK0dJeHFNpbDrcJLEFshAOdA4m
         5RSOQtH0AMWhu5g7HoWl6vUj5rAQ+2yQA/5xe4FqHB9Tvdxncz4OeTrUZU+oA7wsC7q5
         PPZg==
X-Forwarded-Encrypted: i=1; AJvYcCUIdhLF3crZAA4KoWBK9c6xR2BtvIxBtCIA46hHOyoV28Gu5Srg37Gaa0zt00C/gJoUsZai0ZbeULM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yym8iVYLBlV0JBfTsU59e41msJlc7s9TIi9+dy4igUijk0MYC2z
	DDeSChlJeF3x0JD49mIfxRkYCJBk2/7r8ztqGdUohnD0AOrc9fd78BgryysSwCc=
X-Google-Smtp-Source: AGHT+IF4jfbUZ37P80z83ulS9GSPTHBiLdKHJCTmJh6vDg2rMrSZmnSUkN5GRVqPfA9+2IGdNzKUAA==
X-Received: by 2002:a05:6402:278e:b0:5c9:5745:de9a with SMTP id 4fb4d7f45d1cf-5cbbf8a40c4mr17446581a12.9.1730384228085;
        Thu, 31 Oct 2024 07:17:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 14:17:06 +0000
Message-Id: <D5A20JD5PC3G.22TWXL5RY7PQD@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>
Subject: Re: [PATCH] scripts: Refine git-checkout.sh change for different
 branches
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241031134702.2913536-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241031134702.2913536-1-andrew.cooper3@citrix.com>

On Thu Oct 31, 2024 at 1:47 PM GMT, Andrew Cooper wrote:
> The change works for divergent branches, but doesn't work for explicit SH=
As.
>
> Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we want =
after
> cloning.
>
> Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branches =
other than master")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
>
> Speculative fix, pending CI:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/152184752=
9
> ---
>  scripts/git-checkout.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
> index 3796cbfe39a7..9f8f2bd04fca 100755
> --- a/scripts/git-checkout.sh
> +++ b/scripts/git-checkout.sh
> @@ -14,9 +14,10 @@ set -e
>  if test \! -d $DIR-remote; then
>  	rm -rf $DIR-remote $DIR-remote.tmp
>  	mkdir -p $DIR-remote.tmp; rmdir $DIR-remote.tmp
> -	$GIT clone -b $TAG $TREE $DIR-remote.tmp
> +	$GIT clone $TREE $DIR-remote.tmp

Can this be shallow (--depth 1) clone instead to avoid pulling for whole
history in CI? There's probably some ENV variable that  could be recovered
from.

>  	if test "$TAG" ; then
>  		cd $DIR-remote.tmp
> +                $GIT fetch origin $TAG
>  		$GIT branch -D dummy >/dev/null 2>&1 ||:
>  		$GIT checkout -b dummy $TAG
>  		cd -
>
> base-commit: 9a2a50d5de7647bfb529867fdce47ec64b07f06a
> prerequisite-patch-id: ef7a8f78a2a3bfb35a2835ce8c2ec97d95f1267e
> prerequisite-patch-id: 8c25962203bdb283a9c95328fb0867ffa3da8b95


