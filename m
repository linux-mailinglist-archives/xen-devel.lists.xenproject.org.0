Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908DA4C8F5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 18:14:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900518.1308398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp9MO-0006sF-UH; Mon, 03 Mar 2025 17:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900518.1308398; Mon, 03 Mar 2025 17:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp9MO-0006qm-QQ; Mon, 03 Mar 2025 17:13:44 +0000
Received: by outflank-mailman (input) for mailman id 900518;
 Mon, 03 Mar 2025 17:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZaqW=VW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tp9MO-0006qN-0p
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 17:13:44 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db511229-f852-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 18:13:42 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e033c2f106so5316475a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 09:13:42 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c43a668dsm6985544a12.70.2025.03.03.09.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 09:13:40 -0800 (PST)
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
X-Inumbo-ID: db511229-f852-11ef-9ab2-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741022022; x=1741626822; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEfseZrk7mZRoKfz15v2qnIqoNj1JYC/Q28w6CSmyfo=;
        b=lPETb8atHbPFu9NaZcRyZL2Q4SW4MIRhxOqSsFwCyZUgSxGo2rv8BMgimLm84hFmeI
         Z8DsKYnwmjLv3PK2Kx4uTqcdaHXvjp6PPvX5+Zf3FpDgBRVpKW+/kX1YIys3A1qY40FJ
         /R7FfJC3O7dXOZrjNPujJRjtxBxzpJXGHGAUxyVWM6k8PJbwPe4T8q0zoohzn4yDsRKp
         ZiKdRfA3Q4uxIeggJ7XdB2S7vtjfU9LIOtGiyOG5xMHcTHPX9VRHT3TY8ZbpSLp9F+9b
         eQKWipaJ+th2/5PCjum6Or1eFTDPnIq2no1yVMUQCCp8rEHTCWSNIHL4v8TWo3PHJopP
         D4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022022; x=1741626822;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEfseZrk7mZRoKfz15v2qnIqoNj1JYC/Q28w6CSmyfo=;
        b=XGQWozUUa+XNOa5/QhsvPTArtFcNVnHurV3aovd3rmeR1DGbP5b+R+e/OeGzkkmaBO
         mSQxUjbuzWrr3zZlmkRztSB/D31/gK8TfDVq+Wsk1H0ysv49v7aGTS3zPPLKjZ5Cr7zA
         aDO0tjSQM9gepTBP9a0HbY70jDkW+zJQRENhGPpBF6rWfOSNuCl7ULyDjCOPTJoG4v1f
         eR7lUdhoZKPBQoer6cRB77NpsjhMsbFd7xuI4LdfR6zxYdYSnANjFOlmbJZDtjjJOWMr
         G47oud+DYN3fTpmBx18Y/S2nyXbztnsygRRJ5IMXyekOKtS5B5P9nnu5WxN7N4D6QHz3
         WMYg==
X-Forwarded-Encrypted: i=1; AJvYcCV0aTMI/IasB9DmtbOIy5LprUehWBi/JXGmPHB3W4NiqmryUZABQ+TNQ3osLTVKdjt9p5f9/Dkus2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNjqqKfDqyB+QsKkjQL06kODk/sXnuIC47WgKPDEJ8tlqYUSxe
	dKDP8LCyjZqLTcaULhf0hqWcy0XLUvXV2UHHjm+TEu338Zd6i1S3
X-Gm-Gg: ASbGncsQoMjYfB9cqM43oT8Mlmg7q1uM0hXt3d0tmqV3NG4tBaGNwP7uFX+KGK/raWj
	47Li39BH8S5fvQas8J2cT3CQOhxoKVO0ZweMGkbksZvG7/q1or0BHjZJwrNlfA4vxkq6unadpyG
	f3J7MmOvnauSrq55WjtNyFwjokJ6c1j8GNuuL3uWboRJJrVPs6GS1bO/yQOZxo9O5s9BHgG/uMd
	cxW53OFYq/dC5nUrOESR2Tp97/LrRRZNYItw8WmQ4p8hGlbOxqIm+Z9uMZtCXXmCzuUHYMWpr18
	ATNZ7ru+BWQne12AvAqqOWSTl0E4WbC/TtJzbKNDbDwjEmpN3Wp0eA==
X-Google-Smtp-Source: AGHT+IHzSRpM8+xDJ0AJY/WZ9JlDsfomOp19d1RXhnQLXizQNk3zLnagLsSg6gde7snLaHP6gF2/1Q==
X-Received: by 2002:a05:6402:358f:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5e4d6af1677mr35683972a12.15.1741022021387;
        Mon, 03 Mar 2025 09:13:41 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------g6woauVvpo3VjQYm89MR9ffa"
Message-ID: <63d2bd9b-0d4d-4ddd-a819-498aa151c34c@gmail.com>
Date: Mon, 3 Mar 2025 18:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] CHANGELOG.md: Set release date for 4.20
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250303141754.26452-1-andrew.cooper3@citrix.com>
 <20250303141754.26452-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250303141754.26452-2-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------g6woauVvpo3VjQYm89MR9ffa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/3/25 3:17 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> Backport to 4.20 too.
> ---
>   CHANGELOG.md | 2 +-

LGTM: Acked-by:Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c10df7d969ef..2b9ba4922533 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
>   
>   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
> -## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +## [4.20.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0) - 2025-03-05
>   
>   ### Changed
>    - Fixed blkif protocol specification for sector sizes different than 512b.
--------------g6woauVvpo3VjQYm89MR9ffa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/3/25 3:17 PM, Andrew Cooper wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250303141754.26452-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Backport to 4.20 too.
---
 CHANGELOG.md | 2 +-</pre>
    </blockquote>
    <pre>LGTM: Acked-by: <span style="white-space: pre-wrap">Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></span></pre>
    <pre><span style="white-space: pre-wrap">~ Oleksii
</span></pre>
    <br>
    <blockquote type="cite"
      cite="mid:20250303141754.26452-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c10df7d969ef..2b9ba4922533 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 
-## [4.20.0 UNRELEASED](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging</a>) - TBD
+## [4.20.0](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.20.0</a>) - 2025-03-05
 
 ### Changed
  - Fixed blkif protocol specification for sector sizes different than 512b.
</pre>
    </blockquote>
  </body>
</html>

--------------g6woauVvpo3VjQYm89MR9ffa--

