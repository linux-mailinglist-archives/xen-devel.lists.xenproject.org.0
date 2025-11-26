Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD4C89FF9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172657.1497773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFVR-00004v-6u; Wed, 26 Nov 2025 13:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172657.1497773; Wed, 26 Nov 2025 13:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFVR-0008Tm-44; Wed, 26 Nov 2025 13:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1172657;
 Wed, 26 Nov 2025 13:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFVP-0008TQ-J0
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:24:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38782667-cacb-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:24:22 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso4257472f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:24:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7ec454csm38910350f8f.0.2025.11.26.05.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:24:21 -0800 (PST)
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
X-Inumbo-ID: 38782667-cacb-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764163462; x=1764768262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nlHOnQrHr5hFqW9CzOxRC1AMxbclROfqHHfmDBpXia0=;
        b=GjcZkRLp2xCky+iZ+d+gTDvASd1VXc7Dd4q6csuyqrk3clUWedHgNZ3UUVW9Ud7zY+
         OYt+psu5P+NIhp2UuFI7CQJhYrxnXHenTyh0Oy+yQMYFd1GIN6oqati3M4xa6EZcs0qj
         7uuB7aQCT8Xner7tvVUQ09ls6uZ8Bv1dcQHQ+q1S8Uutat4euDKHNAuy28fSn8woWbj8
         o5aAFpXJOh1+imgZeJNLnjy13kTTBrnsCgs6tlNGRoAW/v/vdkYjT0SSkJ6flU23mLpX
         8bE5Pa3E/bOeZlchxJ/vCeBCh4vg3VXBkz2TAhL+GJ6dmDRSzepXiGXdbtLXILN/A+K6
         SfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163462; x=1764768262;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlHOnQrHr5hFqW9CzOxRC1AMxbclROfqHHfmDBpXia0=;
        b=PqrFxk2xKi35Eq3SbujWZP3djZZ/UCu4E51qAFf0zFwGHt2MynKk5kTpR0tfyUt+A5
         DA2l9kC33pTyHm0iLj0Ih09MHkR1/P4y3T5rrsd7nd//Nv6DRaU9ckLtOzkQ6gL5lvs5
         dWafdRVftynLKJnppSikmuzjwq95AOB/FoagpXYUCqosy4KHpyxH179+VWWBlGA/jPPp
         46ZkbO0a5nY8aLBrNfbWi+vxsco7pDdSuAUsDHGGaA+E+3FBGUacc9Qh8ACyqDvwfkdH
         fFNVSDQVdMdVmDheBLJM/UMaiNfb5Ig4PE1GZX8foPcuQYxbPHzoN46cUmKgeW1jkE9w
         R8wg==
X-Gm-Message-State: AOJu0YwFGzdIuywb8zA89fHFyjIAuHMLzGVaeTP+UjiDnIrZvLr6QEd7
	l5UXI/Ump/QZOB5Z03gVLOfNpg+aVKK7+a/R6h7q2FpjZ/aNShfIEo8Tcz+8ZrZgMmevoHoDeWe
	GWNw=
X-Gm-Gg: ASbGncu8KSoFXJftwiipNTxLYm03gtitLuJCuHzVJ/M9o/g3/QHnHzDLNw8hV0XZ0M5
	kpdXBlvzAVcR4gMYNtWFtFAIRdaXNhsLVQkvCL39i+cx1qoqY2KljLQSHDc0W8/q0jttzr2ejNt
	5M+VTmQ6Uu4L+6id06e1DkIKnTA4tGp+C2GuPI8Bu5Y5X1mj+sb1nTqNYO6aed6C8u/uzSDIWzO
	TqoKhfEpVEjJyph8KaQ33b6GJHhDkGVhxRJ161LTAbLh/DMOcOuWF5aIQYmgycjvu4sSREfDqsa
	wuusAFr4L+LtWUeNPN1cXiqYFYRFGdrU678QHkO183Jhs202jbznhw4aO3B3fVHe11iYS0Xf57o
	y0gppTOyIu+FebmY96PSRLvsXHoaSRFRMNOlVueosfXtCtxsnedvUneLpzLtEZboBVIWAK/G+QH
	taqQlZxTf6oWTzDsFh1C32RTDz0p5i90ka8mGF5bFIKwsWCw8JIOD5M7Ee5DacgzDEg/0PWF1NI
	Jc=
X-Google-Smtp-Source: AGHT+IHxEfPeawbS+4wqxwoA21jucZZY0t+kEkN5B0kWC32FUB/1iThFoRvk7NxMdXfabH3P4gEWnw==
X-Received: by 2002:a05:6000:2411:b0:42b:3131:542f with SMTP id ffacd0b85a97d-42cc1cbcfd6mr22146533f8f.24.1764163461856;
        Wed, 26 Nov 2025 05:24:21 -0800 (PST)
Message-ID: <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
Date: Wed, 26 Nov 2025 14:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86: move arch_generic_hweightl() to arch-specific
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Introduce arch/x86/lib/, and make it the home for the somewhat misplaced
x86-specific file that lived in the arch-independent lib/.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Makefile                                           | 1 +
 xen/arch/x86/arch.mk                                            | 2 ++
 xen/arch/x86/lib/Makefile                                       | 1 +
 .../x86-generic-hweightl.c => arch/x86/lib/generic-hweightl.c}  | 0
 xen/lib/Makefile                                                | 1 -
 5 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/lib/Makefile
 rename xen/{lib/x86-generic-hweightl.c => arch/x86/lib/generic-hweightl.c} (100%)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 300cc67407e9..61e2293a467e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -5,6 +5,7 @@ obj-y += efi/
 obj-y += genapic/
 obj-$(CONFIG_GUEST) += guest/
 obj-$(CONFIG_HVM) += hvm/
+obj-y += lib/
 obj-y += mm/
 obj-$(CONFIG_XENOPROF) += oprofile/
 obj-$(CONFIG_PV) += pv/
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 16368a498bb7..a0ee050c931b 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,6 +3,8 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
+ALL_LIBS-y += arch/x86/lib/lib.a
+
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
new file mode 100644
index 000000000000..ddf7e19bdc1d
--- /dev/null
+++ b/xen/arch/x86/lib/Makefile
@@ -0,0 +1 @@
+lib-y += generic-hweightl.o
diff --git a/xen/lib/x86-generic-hweightl.c b/xen/arch/x86/lib/generic-hweightl.c
similarity index 100%
rename from xen/lib/x86-generic-hweightl.c
rename to xen/arch/x86/lib/generic-hweightl.c
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 5ccb1e5241c5..38c1c7d6845c 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -38,7 +38,6 @@ lib-y += strtol.o
 lib-y += strtoll.o
 lib-y += strtoul.o
 lib-y += strtoull.o
-lib-$(CONFIG_X86) += x86-generic-hweightl.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 


