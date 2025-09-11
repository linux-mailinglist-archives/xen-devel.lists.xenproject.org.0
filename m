Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DAB52A81
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 09:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119517.1464845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc5G-0004Zc-O1; Thu, 11 Sep 2025 07:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119517.1464845; Thu, 11 Sep 2025 07:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwc5G-0004Y9-L8; Thu, 11 Sep 2025 07:51:10 +0000
Received: by outflank-mailman (input) for mailman id 1119517;
 Thu, 11 Sep 2025 07:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8rd=3W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uwc5E-0004Y3-Hm
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 07:51:08 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 128e78f6-8ee4-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 09:51:06 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-62221568039so528741a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 00:51:06 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33ad2d6sm658964a12.18.2025.09.11.00.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 00:51:05 -0700 (PDT)
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
X-Inumbo-ID: 128e78f6-8ee4-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757577066; x=1758181866; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MofUxMIU3nSs2OBHcSvaghiWRwiNziBj+Blr4k+xrA=;
        b=GiyhDVeJ82pBweA1axtprl/6hm9K2NYprZYBQZcDMHXZM/LsZXsnYAR8eBBgkPXM/f
         ywdCP5IuzbDIBvqQ8aa6s27rXuYCa5U5kOArohtQUl/vV9EJMPND7CbJ+fjNXmsSYC4v
         6/MRUdNdsAFhKOxqOXknWXN4j7fMkqvmh2JGZKMSXocMoPIn7slRGkFHW4/YfNLa61XI
         zLnSAMuGQuG0khJmkKMQ17VKjr4OD/i4sjHWfPN6RmE6srU2iAo2rogT6v8nftRPSHVh
         1PwK60wvfpSCtHgLkv/PTGjG9XaZpioq73//Kxxb4o7i76FaNjedCcRJZ0uLuCmZBrhP
         bTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577066; x=1758181866;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MofUxMIU3nSs2OBHcSvaghiWRwiNziBj+Blr4k+xrA=;
        b=OjkZrPjLyh1rmdvHJAEkywcxtpCcL7CPV4ANl1u8GhKdnnGB4Rr0DT2nwIuGNwkFNP
         A3iWsUguWrODQIc4nLqb/vhJHQhMjNFrmkuUN1B1CCR4heU6VixoVyGkmGd/lUH7wnto
         AnF0gBJzLGcOzwE45/+dQWvYoT1fE80ydSehKkplRyg39rvb7+aHAjQVYUvRV36oWlx9
         sY/XClCeMZfjVeJZvcCndsUtOr+rQEZW7Ju4dpmgCwgzcClUebUg4X7ehp3Vo+WxXhpE
         ltIbCNCkcfWcUoy//ouY4bdJII0Hf5kwPJz5UMguLh5MOeBFn75zQkJGxxw5MI6C36Vx
         bJCg==
X-Forwarded-Encrypted: i=1; AJvYcCWdVIm3JWr21AJFrEDKQtAR100VWWNvpE6wwRU/3V0cqsFLRRVccFtadselTCLUFx/Du6DhrrN7miA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqjeTu1ldByCm7aN2sW5izQAhdpRYCneJejTRFIYciWdf8lPRB
	rNXw7qHRn0m7V7o+9ZZDycQV+DW1wvhmxhbUi5/Oco5eFDFXlVkfVUgTxNEKEQ==
X-Gm-Gg: ASbGncu/+Bh6Pk8KdIaODo9atP4lsqlWx/FJTeSkcKJ0ijp9zMyYMqFPg4RxH+OEKfb
	ucwfUjtpsK50hSdBjvr5k2hVIbAvm95e7sXTleYkVEaludPJvTjflIJFdk8YLhV+2Rn8l79IXrc
	sH2wF5NHck2GFEY6DX+Gtq04zOQA4MWbWH2i+Hmho8lGe5Wf9FtfZdoY88cRO37qs76sakKDaZV
	Dx9me/GCzFdSp0i4T0oM6FzpYeP6yJovuEvvx6N40H4dlRAo/c5OWUqSuosKJsak/9vpIIdNdAS
	/8JDdz1X4PAavadp6w2AIpAAs7n5BvyGdhKKbPxklbruhbW0AMMj5T7Cr6oqmyV3b7+81dQ8lwi
	WC+fE2wqmkQgUMuQPY1f3z6dZg2mmuTKmlzi2DkJHtsWNGBzU65CPIfEZr211p7nrkXZrkAf2
X-Google-Smtp-Source: AGHT+IGxDQcg2tUf8709VzIaMOZF5znxCRYuOQOgbOKN+HvF/61Sjz01pp9iy48Xvh5Cp/zwyNtWPQ==
X-Received: by 2002:a05:6402:2806:b0:627:1120:f824 with SMTP id 4fb4d7f45d1cf-6271120fc43mr14310224a12.17.1757577065682;
        Thu, 11 Sep 2025 00:51:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------DXL1HUsGUfi9OKC3KFyjjzdG"
Message-ID: <fb7137de-cf5c-48ad-a742-e6ebf0ca72f5@gmail.com>
Date: Thu, 11 Sep 2025 09:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] CHANGELOG: Notes about distro changes in CI
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
 <20250910222313.1858941-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250910222313.1858941-4-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------DXL1HUsGUfi9OKC3KFyjjzdG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/11/25 12:23 AM, Andrew Cooper wrote:
> Also state the RISC-V baseline now it's been set, as it's the reason why
> RISC-V Bullseye got dropped.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>

LGTM: Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> v2:
>   * New
> ---
>   CHANGELOG.md | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7bd96ac09d14..ca1b43b940d2 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -10,6 +10,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - The minimum toolchain requirements have increased for some architectures:
>      - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>      - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
> +   - For RISC-V, GCC 12.2 and Binutils 2.39
> + - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
> +   to the baseline change.
>    - Linux based device model stubdomains are now fully supported.
>   
>    - On x86:
--------------DXL1HUsGUfi9OKC3KFyjjzdG
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
    <div class="moz-cite-prefix">On 9/11/25 12:23 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250910222313.1858941-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Also state the RISC-V baseline now it's been set, as it's the reason why
RISC-V Bullseye got dropped.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250910222313.1858941-4-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

v2:
 * New
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7bd96ac09d14..ca1b43b940d2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - The minimum toolchain requirements have increased for some architectures:
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
+   - For RISC-V, GCC 12.2 and Binutils 2.39
+ - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
+   to the baseline change.
  - Linux based device model stubdomains are now fully supported.
 
  - On x86:
</pre>
    </blockquote>
  </body>
</html>

--------------DXL1HUsGUfi9OKC3KFyjjzdG--

