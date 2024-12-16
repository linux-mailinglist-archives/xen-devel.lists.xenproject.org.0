Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D209F2F70
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857797.1270005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Mn-00048q-49; Mon, 16 Dec 2024 11:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857797.1270005; Mon, 16 Dec 2024 11:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9Mn-00047N-1W; Mon, 16 Dec 2024 11:34:25 +0000
Received: by outflank-mailman (input) for mailman id 857797;
 Mon, 16 Dec 2024 11:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ylfk=TJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tN9Mm-00047H-7z
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:34:24 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a785f9-bba1-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:34:22 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-436202dd730so28104365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:34:22 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a8a5sm7905787f8f.48.2024.12.16.03.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:34:20 -0800 (PST)
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
X-Inumbo-ID: b1a785f9-bba1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734348861; x=1734953661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UqayyQBfpUPr/Pj7P6Vd6jPsK74AdpD5wXNC7i5RUjE=;
        b=UIl+Hteck/cVwx4HLiEqA2WlvggXvUoVezQZOEr0AVO+m+0VnLROG142lknZ8avLTD
         N0faOBcAbs4EE8ZfNu9yDoNuLSAhz2caTFxrXV2tH8ZyXqC49Pf91xzkfiPy6UpKe2OJ
         QxTNkIUZ/G4SZl50oytDi6Sioaooa4rWtZ84Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348861; x=1734953661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqayyQBfpUPr/Pj7P6Vd6jPsK74AdpD5wXNC7i5RUjE=;
        b=COTuorajyMkCY7c4DhHgXx6TcJ8gZ3wcHtNp1EcZrG2D7cHpCjs2FHaLkuWU0d+3La
         CpD+f+g92XLtz8MD5gJgQOh32Zaiaxgc18o364BKHfgrDMQXvNolMuJmCR0fbySkAKuD
         YsEoAcghAeK1SsvtFLOO8dy6r8sh0YMyHdw8dEDZqn9uWe1uGEUozEETkOgPTz4iEziJ
         6gmGXl4W7SpmR6mOPwC4OCu5cTdmSHwe2kYYnk2AQN9wMwXj149ugUQRB2Y1WyY7B6qe
         UP2xrU4MqQNwntrjAucoNmzSCiJDqI2igrwhuKDMru7bLnGwtSaQWyswGWpaj3FTdd1e
         shjg==
X-Forwarded-Encrypted: i=1; AJvYcCXaz98x6HrGu1HSscaGdyIOYSoXuUK4nqVW2JzIWS9H7sqN6PyPXJdU6KgkjfIj7QYRGcv4vbc7oj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwR01yCyn5VUoVSfuEwRCELedHQxnLCcuSaOoLY2jJK/Dte1aJG
	pSRxLGXRfsHuHTvNE4RC+jwuVG0j3NgvR2RxFL3DcaSN8/uVpg3O4bJdYxehjYk=
X-Gm-Gg: ASbGncvu9IYnRYspHMpRjA+xfBxILGN6jg/c8RO+ZOzsVb/8DHYuo0adrFc0AOqfihN
	0F+ZTsm0OmTerfOH6OZCr1o4lceBwpYCMCUyW1XMQGrkA9sOs9L/8S6fvcJCWuRJQ92+Ak1SIwE
	/6uXjGQqXgPAJWv2PO8vVZwhAE0mqe4WC8dUuCtcoW8bYNOOS1GGxslgcTXPiDg3m7rTIFYPdtV
	vek3t/cJq1eWXSiAtO2PR1VWOQPVKU4NGSEDCS3gUj/EsVGnJdR0ElY2celFS3iWa6sGFmctbGx
	3QVgQHH5X5ieUkULVTp0
X-Google-Smtp-Source: AGHT+IHfBysp6ty+ixBfM3lu7atblP7Wy3Ma/a4GMiza1zKVjeIsFTWmc6RsNIE7jUQWvjKHLQ9wYw==
X-Received: by 2002:a05:600c:5248:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-4362aa34e58mr123821265e9.3.1734348861106;
        Mon, 16 Dec 2024 03:34:21 -0800 (PST)
Message-ID: <49497f8c-a2e4-49a1-aac0-96d704834f0f@citrix.com>
Date: Mon, 16 Dec 2024 11:34:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools, xen/scripts: clear out Python syntax warnings
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, nthony PERARD
 <anthony.perard@vates.tech>, Luca Fancellu <luca.fancellu@arm.com>
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241214161350.70515-3-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241214161350.70515-3-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/12/2024 4:09 pm, Ariel Otilibili wrote:
> * since 3.12 invalid escape sequences generate SyntaxWarning
> * in the future, these invalid sequences will generate SyntaxError
> * therefore changed syntax to raw string notation.
>
> Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-changes
> Fixes: e45e8f69047 ("bitkeeper revision 1.803 (4056f51d2UjBnn9uwzC9Vu3LspnUCg)")
> Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new commands in menuentry")
> Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default entry in string format")
> Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppcheck version check")
>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> ---
>  tools/misc/xensymoops                         | 4 ++--
>  tools/pygrub/src/GrubConf.py                  | 4 ++--
>  tools/pygrub/src/pygrub                       | 6 +++---
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/tools/misc/xensymoops b/tools/misc/xensymoops
> index 835d187e90..bec75cae93 100755
> --- a/tools/misc/xensymoops
> +++ b/tools/misc/xensymoops
> @@ -17,7 +17,7 @@ def read_oops():
>      stack_addrs is a dictionary mapping potential code addresses in the stack
>        to their order in the stack trace.
>      """
> -    stackaddr_ptn = "\[([a-z,0-9]*)\]"
> +    stackaddr_ptn = r"\[([a-z,0-9]*)\]"
>      stackaddr_re  = re.compile(stackaddr_ptn)
>  
>      eip_ptn = ".*EIP:.*<([a-z,0-9]*)>.*"

Oh wow.  I've not come across this script before, and it's not
referenced in the build system.

Also, it's hard-coded to 32bit Xen which was deleted in Xen 4.13 more
than a decade ago, and there are other errors in the regexes such as
including a comma in stackaddr_ptn

Worse however, it escaped the Py2->3 conversion and is still using raw
print statements.

I'll submit a patch deleting it entirely.

> diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
> index 580c9628ca..7cd2bc9aeb 100644
> --- a/tools/pygrub/src/GrubConf.py
> +++ b/tools/pygrub/src/GrubConf.py
> @@ -320,7 +320,7 @@ class GrubConfigFile(_GrubConfigFile):
>  def grub2_handle_set(arg):
>      (com,arg) = grub_split(arg,2)
>      com="set:" + com
> -    m = re.match("([\"\'])(.*)\\1", arg)
> +    m = re.match(r"([\"\'])(.*)\\1", arg)

Doesn't this \\1 want to turn into just \1 now it's a raw string?

> diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
> index 9d51f96070..58b088d285 100755
> --- a/tools/pygrub/src/pygrub
> +++ b/tools/pygrub/src/pygrub
> @@ -1104,7 +1104,7 @@ if __name__ == "__main__":
>      if chosencfg["args"]:
>          zfsinfo = xenfsimage.getbootstring(fs)
>          if zfsinfo is not None:
> -            e = re.compile("zfs-bootfs=[\w\-\.\:@/]+" )
> +            e = re.compile(r"zfs-bootfs=[\w\-\.\:@/]+" )

Related, this string looks dodgy.  The \- is correct (I think, to not
have it interpreted as a range), but I'm pretty sure a literal . and :
don't need escaping inside a [], and the result here would be for a
literal \ to be included.

~Andrew

