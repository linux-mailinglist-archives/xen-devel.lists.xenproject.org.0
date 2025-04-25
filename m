Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB60A9C796
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967725.1357459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HEw-0003Me-V7; Fri, 25 Apr 2025 11:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967725.1357459; Fri, 25 Apr 2025 11:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HEw-0003KO-SU; Fri, 25 Apr 2025 11:29:06 +0000
Received: by outflank-mailman (input) for mailman id 967725;
 Fri, 25 Apr 2025 11:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snHQ=XL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u8HEu-0003KI-SC
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:29:04 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dcf0ce7-21c8-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 13:29:03 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso325455366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 04:29:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf82f9sm119532966b.88.2025.04.25.04.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 04:29:02 -0700 (PDT)
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
X-Inumbo-ID: 7dcf0ce7-21c8-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745580543; x=1746185343; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+SAy5snn6/GCaaOhHtZ4cE3/CrQZuOkyWlRx197FXQ=;
        b=L9QCbxm3p+JV0abb6Uwsu1P6m35OdHY/SzyEJ4Lysv+guyeQUF69mT6Dj1SXugBuli
         N7ijKmdWqu5b40qlaS6PFtkEopVg7PRcuCdnmitwEp9BHESML8T6Zbtb0/TG6hSm5lAR
         uhB8eeHzKXXGQ/yGEqUygBaXNRbHp2nJeJNKusZO1lWWALbrE+JjSu0WR/XUPxYPfBrn
         qQv3VZ06Jyk4lAypxLTpNd5fDm1Ze9Eex6Qj9cx0vj4nMmQzKLVzR12WSDuxGDWvPwOn
         KEA7XZU3+1ygxThFHAS0rzHRiBitmjbFLdAVaU3bLuWWK1X7A9ICikxNf1HqpSgZ5iSd
         CIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580543; x=1746185343;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+SAy5snn6/GCaaOhHtZ4cE3/CrQZuOkyWlRx197FXQ=;
        b=sIZyaM0emrivldDel2lJLGU9FcWzgr0AoU9ld9CAANrlFIsDiuuNF78NKEpIoVJLG4
         j6B/E7m1RCB9SDrSgSX4ubsTPJOuCkUjnsm2JCTAwkhpqpaDI2y9JcVsknrCIvIHUlMg
         Xy9xtLqDZ5C6HoXomndKbQzZ/W2qQuQZS+IGNLq6OGjAxjFbo8DZq4MoQxoFceoiwhof
         cmksm0w5u6G59vX3h8InvRKRlsQViy6dsJtknK7ZVsRddQpf2gfT0GFxdSXbpZc9+gc6
         3IEFF22Tfy5y+0Rj+dYyS81zk4KfLOPsmqy11XOwqYHbvXEB4y3E5eDlN0KpbjA8YDdE
         wL0A==
X-Forwarded-Encrypted: i=1; AJvYcCUEJoH+64n/AN/edtzHfsu8BU0TEI482Gnve0vGMnXck/g+pCXSjoYXtn7zGAr5tIF9IvfYB63TS1A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGh9HfNLDOBevEdv+XE2c7bjKisHQCqGXt5dzyyHihy5LfMQke
	2h6Ip4bMucSZuHMwKKJW38FgAS53mN+awBg5sdP6X45p17MUu+KE
X-Gm-Gg: ASbGncuSTz84qJBLLp5oXWoZYYiuE0AL8A2UUoVhCZfGy+6ym4e3AbqA1VuSWwgi6Dh
	E7zhiQAuwf4qo4QQqEzevVJeevSuf4ljNyh+NERfLc3qygDHZp45qeTncoFEULFlTL6GCOaybXN
	qhWR7fmgfqfh5r0i9JkPJ5hr0aQt0yp7LtsKzp9iPvtcMdUWgEAitqM0quRiWOK45tfyu2P6fCi
	9Jv8hERtwXLt54sfhpjLxuTuaEpHy7toAskkZBib8bXwtfDlVdEtBYvAzEcLEio+U/FuyMe7Ibw
	LBnGRwUjSsYiWD/ZZ0f5l+4hffZhnnI/OFMb1tEr3JxeEH5MeDotRvM5jwqImdgemuOwT28XEip
	RmXn0fbieb8iTD2Gm
X-Google-Smtp-Source: AGHT+IHBNRzqsgKYcfK3ojGJeheZ2vOkqmR1y1BFISRYVf6PdJ0VPuyJY2fdEuBs2qaYIilIDziQjQ==
X-Received: by 2002:a17:907:7d89:b0:ac8:14ad:f3cf with SMTP id a640c23a62f3a-ace710951b9mr201173566b.23.1745580542546;
        Fri, 25 Apr 2025 04:29:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------E2FUEUj2sfNWNJrxaWVk0hsc"
Message-ID: <b2883538-8cea-4fde-b42b-55455fa810ca@gmail.com>
Date: Fri, 25 Apr 2025 13:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250425112415.245585-2-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------E2FUEUj2sfNWNJrxaWVk0hsc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/25/25 1:24 PM, Andrew Cooper wrote:
> The type used for pagetable attributes/permissions is currently unsigned int,
> but needs to become architecture dependent as PPC needs unsigned long.

Not only PPC, RISC-V needs it too.

>
> Introduce mm-types.h to house pte_attr_t.

Do we really want a separate mm-types.h?
If yes then:
  Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> Given the new toolchain baseline, we can use __has_include() now to remove the
> need for boilerplate on most architectures.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
>
> __has_include() was one of the justifications for the new toolchain baseline,
> and is included inhttps://gitlab.com/xen-project/xen/-/issues/201
> ---
>   xen/include/xen/mm-types.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 xen/include/xen/mm-types.h
>
> diff --git a/xen/include/xen/mm-types.h b/xen/include/xen/mm-types.h
> new file mode 100644
> index 000000000000..19f692e9aaa4
> --- /dev/null
> +++ b/xen/include/xen/mm-types.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_MM_TYPES_H
> +#define XEN_MM_TYPES_H
> +
> +/*
> + * Types used to abstract away architecture-specific details in the memory
> + * management code.
> + *
> + * Architectures need only provide their own asm/mm-types.h if they want to
> + * override the defaults given here.
> + */
> +#if __has_include(<asm/mm-types.h>)
> +# include <asm/mm-types.h>
> +#else /* !__has_include(<asm/mm-types.h>) */
> +
> +typedef unsigned int pte_attr_t;
> +
> +#endif /* !__has_include(<asm/mm-types.h>) */
> +#endif /* XEN_MM_TYPES_H */
--------------E2FUEUj2sfNWNJrxaWVk0hsc
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
    <div class="moz-cite-prefix">On 4/25/25 1:24 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">The type used for pagetable attributes/permissions is currently unsigned int,
but needs to become architecture dependent as PPC needs unsigned long.</pre>
    </blockquote>
    <pre>Not only PPC, RISC-V needs it too.

</pre>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Introduce mm-types.h to house pte_attr_t.</pre>
    </blockquote>
    <pre>Do we really want a separate mm-types.h?
If yes then:
 Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250425112415.245585-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Given the new toolchain baseline, we can use __has_include() now to remove the
need for boilerplate on most architectures.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>

__has_include() was one of the justifications for the new toolchain baseline,
and is included in <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/issues/201">https://gitlab.com/xen-project/xen/-/issues/201</a>
---
 xen/include/xen/mm-types.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 xen/include/xen/mm-types.h

diff --git a/xen/include/xen/mm-types.h b/xen/include/xen/mm-types.h
new file mode 100644
index 000000000000..19f692e9aaa4
--- /dev/null
+++ b/xen/include/xen/mm-types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_MM_TYPES_H
+#define XEN_MM_TYPES_H
+
+/*
+ * Types used to abstract away architecture-specific details in the memory
+ * management code.
+ *
+ * Architectures need only provide their own asm/mm-types.h if they want to
+ * override the defaults given here.
+ */
+#if __has_include(&lt;asm/mm-types.h&gt;)
+# include &lt;asm/mm-types.h&gt;
+#else /* !__has_include(&lt;asm/mm-types.h&gt;) */
+
+typedef unsigned int pte_attr_t;
+
+#endif /* !__has_include(&lt;asm/mm-types.h&gt;) */
+#endif /* XEN_MM_TYPES_H */
</pre>
    </blockquote>
  </body>
</html>

--------------E2FUEUj2sfNWNJrxaWVk0hsc--

