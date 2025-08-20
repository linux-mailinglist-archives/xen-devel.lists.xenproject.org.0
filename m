Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1BAB2DC37
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 14:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087368.1445428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohim-0001Qk-8f; Wed, 20 Aug 2025 12:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087368.1445428; Wed, 20 Aug 2025 12:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uohim-0001PA-5v; Wed, 20 Aug 2025 12:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1087368;
 Wed, 20 Aug 2025 12:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P/AY=3A=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uohik-0001P4-MC
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 12:15:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52647be9-7dbf-11f0-b898-0df219b8e170;
 Wed, 20 Aug 2025 14:15:12 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9d41bea3cso6526473f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Aug 2025 05:15:12 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0777892basm7434090f8f.56.2025.08.20.05.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:15:11 -0700 (PDT)
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
X-Inumbo-ID: 52647be9-7dbf-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755692112; x=1756296912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdTpd0xC9bZO8pMljVY4p/HrOIrDchM9WABXRf7m9k4=;
        b=Va9cW18ihf/JVk0cTL1Dwu4Nrc+GC05gLTYUH4c2k+3JvHG+jJkmXY1m89nYaqS/F5
         bez4RvhrX7qZQZwDl/XNZQZ/zl3JrsohDvlHtdzBAGIiDuXJXJb/c39VEM4XlUj6SdC0
         lnOEEl0y9IG90BKDjxwXsaiBCyh1tTC7eHZQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692112; x=1756296912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdTpd0xC9bZO8pMljVY4p/HrOIrDchM9WABXRf7m9k4=;
        b=HJnJ8Mpaf57KhuCnB8rImbnD7rZK1yS9ED9VEJvMBTZKprB807EEXqWR1qQG/qX3Xg
         3+opqF9l8YULMU1dwezTd3CJuNO/koBF9vRZK7NuBVEoeqX5GXnuSNkdEppptFahPjR8
         bZdtUa/ZmJ6VHoakGI/EWUikMn9nPD/fUQO/NgICqUGkiItEuMyheWY74GJyVLN6XGdx
         /QldZ585h0Jia0578ZySV/pRk4InSIMpvRB3U0Z+V2lNDkb5RJxVRse0XFpNuo/YtVkr
         QYTGedTtAzGg3hwlZgoOiw9t32O+mwXQKhqGoOccIbZVaqQqdY0W7PrG9rtyILf8snkB
         fobA==
X-Forwarded-Encrypted: i=1; AJvYcCWLTVE3kUvVm12qHDdXyPpaO1SPF6GQxGMSS9vlJnDkGu11L3cDuvmPx74pYqDOYfs3NljCxdiU8b4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMR35OZvcQL4Piv4Q9t/7ukaPTLLH/PVTABpEywYFu8qlOXu4e
	hyiaulUPYBpFbcFvz8cpR9y7gAFbSIO48Bi2MevJEOzIMy2sJuvL20OunQL4zbud+/k=
X-Gm-Gg: ASbGncuhazR38U1mkkBP+KqLWiXtup2zkJbTWHoXNOycJg5E4j2UKj0LNN/r4rgqECi
	DmEDUGFDb/HaNf15I5PIQ+L9p2xjnNgBAx7MvgkJXOPwRFxiNHb8eB6oSKhgqZ48gP/3Eyi/+fc
	TFQ5+CRSEnT7fCSr/56SjWH6+wAeSNa+d/1xVqDacbWv3Gu5rZyBme9blMgS2ToZMWyvh75hyZ2
	PKrmwISK1hAAL3MCrs1lDnzLzQ/AOpSniDrW29rSdNKFhWZDht2wu+gqD9KKwlDIEpSx6BCHjQF
	45pEmrotRO1w8T3Tt2C+BBfU3rRdHVWqML6dWTunizLzmredAKqVSSyQBcUn9+i6erJ18f5GzRu
	IhZkzj9edt8sc2JskWPFtQu8PViwIfUWIpQIfn7/0nCIK2unJlvwJuqz/dJkW5FyFK7Eq
X-Google-Smtp-Source: AGHT+IGmmwD8h5lpcuVFh3hHoKewPV1m0J5GXZOy8SMRQPII96arNnEhd0yAlW4qF55iyN5tMZYw4Q==
X-Received: by 2002:a5d:5d0a:0:b0:3b7:9c35:bb7 with SMTP id ffacd0b85a97d-3c32e6fe9f0mr1780572f8f.46.1755692111616;
        Wed, 20 Aug 2025 05:15:11 -0700 (PDT)
Message-ID: <f2105411-ac78-4283-a7d7-45f5b1bc0bfe@citrix.com>
Date: Wed, 20 Aug 2025 13:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] releases: use newer compression methods for tarballs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <fdd60576-c852-4ce9-921d-9e77a86a3e66@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fdd60576-c852-4ce9-921d-9e77a86a3e66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/07/2025 7:33 am, Jan Beulich wrote:
> Other projects have long switched to xz and/or lzip.
>
> In the mktarball script, don't rely on the tar used supporting the -J
> (xz) or --lzip (lzip) options.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Question (to the release technicians) is whether this would be adding
> undue overhead, primarily as a result of anything done outside of the
> build system.

I'm happy with this.

>
> It's unclear to me why we have git create a tarball, extract that, just
> to then make a tarball again (without any special options, like to
> override owner or timestamps;

That's because in c5be91eb8140 you deleted the intermediate step of
merging qemus


> in this context I notice that tarballs
> created by Andrew have file ownership of andrew/andrew, while ones made
> by Julien use root/root).

Ownership where exactly?  the tarball itself (which will be down to
accounts on downloads.xenproject.org) or the tarball contents itself?

>
> Without passing -9, I observe lzip to compress worse than xz; the win
> of passing -9 to xz isn't overly big anyway (about 100k, compared to
> about 250k with lzip).

As these are created once and downloaded many times, we should always do
max compression.  Even if it takes minutes extra to create, that's still
a win overall.

>
> lzip, unlike the other two tools, doesn't really show a progress
> indicator with -v. Merely having final statistics may make the use of
> the option here questionable.

I can't say I find any of the stats relevant.

> --- a/docs/process/xen-release-management.pandoc
> +++ b/docs/process/xen-release-management.pandoc
> @@ -274,10 +274,10 @@ Xen X.Y rcZ is tagged. You can check tha
>  https://xenbits.xen.org/git-http/xen.git X.Y.0-rcZ
>  
>  For your convenience there is also a tarball at:
> -https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz
> +https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.[glx]z
>  
>  And the signature is at:
> -https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz.sig
> +https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.[glx]z.sig
>  
>  Please send bug reports and test reports to xen-devel@lists.xenproject.org.
>  When sending bug reports, please CC relevant maintainers and me
> --- a/tools/misc/mktarball
> +++ b/tools/misc/mktarball
> @@ -31,4 +31,14 @@ git_archive_into $xen_root $tdir/xen-$de
>  
>  GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
>  
> -echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
> +if [ -n "$(command -v xz)" ]
> +then
> +  tar c -C $tdir xen-$desc | $(command -v xz) -v -9 >$xen_root/dist/xen-$desc.tar.xz
> +fi
> +
> +if [ -n "$(command -v lzip)" ]
> +then
> +  tar c -C $tdir xen-$desc | $(command -v lzip) -v -9 >$xen_root/dist/xen-$desc.tar.lz
> +fi
> +
> +echo "Source tarball in $xen_root/dist/xen-$desc".tar.[glx]z

If we're deciding to use multiple compressions, they want to not be
optional here.  I'd far rather have a reminder to install the package,
than for it to simply be omitted.

We don't want to be re-tar-ing now that the qemu's are gone, so I think
the structure wants to end up as:

git archive --format=tar HEAD > tmp.tar
gzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.gz &
zx -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.xz &
lzip -9 < tmp.tar > $xen_root/dist/xen-$desc.tar.lz &
wait

Might as well use the multiple cores better...

~Andrew

