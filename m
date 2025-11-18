Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D6C6B11A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 18:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165260.1492042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLPyM-0001M7-EU; Tue, 18 Nov 2025 17:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165260.1492042; Tue, 18 Nov 2025 17:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLPyM-0001KY-B0; Tue, 18 Nov 2025 17:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1165260;
 Tue, 18 Nov 2025 17:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kq2N=52=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vLPyK-0001KN-Uh
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 17:58:33 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7cb282-c4a8-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 18:58:21 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64180bd67b7so8028904a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 09:58:21 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12d55sm1398077166b.33.2025.11.18.09.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 09:58:20 -0800 (PST)
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
X-Inumbo-ID: 2b7cb282-c4a8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763488701; x=1764093501; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFp0af3WUDxFK7fL09lex7RW8M9QnpS9B6bt9KztMhQ=;
        b=HImLwVdnRYM1b7E3lKuacrTZ31dzl/gNcwAqB/pxR5wJR7Jezk/IRXiktx2x9jl1qo
         Xl6zirOfRbYiXYUcINQ6jGBnQNVgrMHOqPgb0DQbo9Wz0qddARgfwa+rAGkT3qW5eX9i
         w8iXayklidttic+jWbe30I6EIKoH7Q+AchoVa+mWKeEGh156MmC7v0+PXQLxJh61Ir5Y
         MkdIsWnXInpxwsxuJK5uZSOM/3ViqCkk2wuT19XGidfk/EriTzMvAy5m9xcsIaFk3Hd3
         eZgjtpUYGmgzmFuot4qKGwz5b33fBEQnkpHKHUIK9c6KSCEllUEv/AhxnmsLKKruV4k/
         FhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488701; x=1764093501;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFp0af3WUDxFK7fL09lex7RW8M9QnpS9B6bt9KztMhQ=;
        b=gIBt4nA35dZ25rzMmiSTToeRg5B8iVUURWi3PchB0S7zpvOMiXkPdbyLyOWWCEmEoh
         Q0S9p9IyQqcl701DTuacjYhdTs/RNci7OUFgJ+KrYrPSlquwk2eo/gGx4RiEtc20v9Ql
         XkmHVbCa0aGmrq3KtqYR7x3XqOYKqYDcFOh8SEpF3G8ncHGd9GMC2N3xkB6P5PRZIEMz
         u4Et+/GR4E1MXxt7bszbmXNkoqUvDhJIoPDJdvUukRP86nMgTXqc6cPs0/893t8FXIfG
         Qr616IsYc1Dah1CnJRrBJrcVDbx7UIX6VR3UVZtyfGttHOby7dCvDTXa7zYw0ir9dLbz
         ep/w==
X-Forwarded-Encrypted: i=1; AJvYcCVqgQFT+/jkqYaigBd/dYB4lNw7iJJrpXnSotCZhKqkDnmrBeYzWz2MJIssLahM14f4fv4+JQ+zYno=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywomw/4RQZIkQRDZXZGGWLEsKkDHo+MW20QimMLLTvoN5fECoSC
	rv7LmiPUoQcjf2TPDU0hL7tKO5FDmdP19y8FdYqxSdV8riPZ4leCjoe2
X-Gm-Gg: ASbGncvWuPKe8b9ZR18lgv+AR5xz3Yox3+L/yuuIvIwI1XnsjqugJKp7iDXZ7DthQnY
	3lnYfyVeLL+ssKZK6zvQwgYWH++xP7VBh/15Nr1PxYI0BAmrDJ3nLfUNOyEB8TKhJY5Kl8vU21U
	SHzNQYJsjyA+QLsYZGKoYkmmmHV3MjVSOzXkCZdPcD+bWW3Vdhyo6LhVUyhiOac1dzoF+apFH4j
	JGcv5J2C8X6F1Q5Ssp651GcBfNpJWV39wVdaHUW1ZxTijtOuog5bxb3+zUFsa64WHNbzbgd/3Pl
	BmPPEIC2fgnVeG40RknK3OS4KrH6/e8tGpeoOh8r5+qgIXKbtU1qeqruImHQxRR80wVlUVD4upa
	4v3eHakLI+i1VQqyC9mcqzLclDTlKJSqoCfIyAjQb5DIynZiXiMP5NZ/23DqSVMrfrYiabKDJKi
	072zXtTn4dXQa/bxB2L+4qQDzsDYOuE+b8QBKoZDvno7XeKXWTICNZvgajuqbvov1t/8xLHEA=
X-Google-Smtp-Source: AGHT+IH+9FU8sEofnYv8nWnAKBjYKuxX4lHUIlv6xBcUVNpYZ0QDcgW6T8xGG1JlXOl8lw5knbUMkw==
X-Received: by 2002:a17:906:f105:b0:b73:7652:ef9e with SMTP id a640c23a62f3a-b737652f76bmr1138755266b.55.1763488700453;
        Tue, 18 Nov 2025 09:58:20 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------590qd5gvnSXjggih0WnwLrqx"
Message-ID: <81030d67-ddc2-4d20-a0c8-8a73c6afa801@gmail.com>
Date: Tue, 18 Nov 2025 18:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] SUPPORT.md: Define support lifetime
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251118165022.476308-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251118165022.476308-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------590qd5gvnSXjggih0WnwLrqx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/18/25 5:50 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
>   SUPPORT.md | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 491f9ecd1bbb..3099225c77f4 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
>   
>   # Release Support
>   
> -    Xen-Version: 4.21-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.21
> +    Initial-Release: 2025-11-19
> +    Supported-Until: 2027-05-19
> +    Security-Support-Until: 2028-11-19
>   
>   Release Notes
> -: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
> +: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes">RN</a>
>   
>   # Feature Support

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------590qd5gvnSXjggih0WnwLrqx
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
    <div class="moz-cite-prefix">On 11/18/25 5:50 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251118165022.476308-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 SUPPORT.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 491f9ecd1bbb..3099225c77f4 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.21-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.21
+    Initial-Release: 2025-11-19
+    Supported-Until: 2027-05-19
+    Security-Support-Until: 2028-11-19
 
 Release Notes
-: &lt;a href=<a class="moz-txt-link-rfc2396E" href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">"https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes"</a>&gt;RN&lt;/a&gt;
+: &lt;a href=<a class="moz-txt-link-rfc2396E" href="https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes">"https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes"</a>&gt;RN&lt;/a&gt;
 
 # Feature Support</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------590qd5gvnSXjggih0WnwLrqx--

