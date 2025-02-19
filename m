Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E7A3BB03
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 11:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892551.1301517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgsa-00075H-WF; Wed, 19 Feb 2025 10:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892551.1301517; Wed, 19 Feb 2025 10:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkgsa-00072Z-Ru; Wed, 19 Feb 2025 10:00:32 +0000
Received: by outflank-mailman (input) for mailman id 892551;
 Wed, 19 Feb 2025 10:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkgsZ-00072L-Ef
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 10:00:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 593d9294-eea8-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 11:00:30 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abb79af88afso731451066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 02:00:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbdac1015dsm77931966b.127.2025.02.19.02.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 02:00:28 -0800 (PST)
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
X-Inumbo-ID: 593d9294-eea8-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739959229; x=1740564029; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q54kk/YpdGy7079R78TQsMLAvnDD4zErmsQgZMVm6KI=;
        b=RgrjhMxanAdjjuNCwLV/Wju1gEk1NOAsw0bE1NjzZN65tEGsSLQ54HakisaYqszgeD
         d9jsWo1HmpfkQlQ3Z7QbBR0XoxdSfZAY3voCLAUJSmX2rCktznrGFKq0+Nw9JtzsNAOg
         5/+7ImRpVTj0HY149TvLHHC4XQqtHw4Ju+LRyRHuBwMnKtYK81VTw1rxSkDdGAgS0Uim
         kxv7oQsjQ+r8jdV791qyTkjU8+ycpHMsgJ5vPsrTthCsrzaIlBzIzh+atDg0HpXMKkRN
         KQ32ie85G1M6Pghpu5UK+WTLumCtJzmO4HbR6kZ020vQ7QTUFPk/eTygdraOtd8GpZqe
         axlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739959229; x=1740564029;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q54kk/YpdGy7079R78TQsMLAvnDD4zErmsQgZMVm6KI=;
        b=WpJzQF9ly/gjX7PHgZGm707cpPoniQPHGi6AkI8eE66X3d14mkhQ9HpZ2gTljQuHzR
         1oTcLRhG1pb2EvME2RKlfjP63KqZJFYNNQyvV+gy6PV+24X73PrQJnCVAa0fEvaZuHQd
         Uf7dg00/v3yJaFL1wNXoaIW0kmSkmzFIISobIzuajaElXaXJ1vV8nWKsvES2e2M7/R6Z
         vHT884iA5C2mIC2MRswJ8uvj4F9loaFqRSKC5lAGlwP/+lSXkWU3F9b++OQ2B2MfYRgB
         pGjBLLmLRtc3k9rnhDfN16wy7gzzOljI3TLvLuhxMDlUKjTwvm6BE3iyfxNPu83alawR
         YYKw==
X-Gm-Message-State: AOJu0YwHSbjcw5S0kA496nXCDEMUTUhtWiESurNTEotv3Kv3STbD0yhH
	uExeOHPwwNmZ4Y6FJ3wJKEF+/uM66e3Mj37OWQ5b1jTs2z8KRd9EuyIme/XlY58jr7Tqj90W2ec
	=
X-Gm-Gg: ASbGncsgKSMpRQCumTOKNfsVCJGnyONiqrHgpVxHsA/Q71YiC0gxoXsB/6A82paDlG5
	NHdJVcEwK5TyVs4Rft6+yC07NRsbLYOKU78UDzL/18RkvSlhhyHcW2M5xe/aYyCpaJ/WuBtH1bd
	X6ZrPjujuAQ+kE3i8B7ST0D/Yiujsqe+K9HU57u6+FGJr/n/T+DNp4yh0fO3Ml7HU5ghL0T7wcJ
	AKoIa8LD+7oGscCoi+dXnjnMAaiHtP+emZjnkISBSz9KPrhwKP6JIvrMwiOnrubnIAqa0MWVSWe
	fMhnBfCdLFyh3jtsWlC2HcE6+omL6fci1uzcNBrzpIwfTBdGgeSHz0s1Ss1GVIgDn7sTBTynsnD
	E
X-Google-Smtp-Source: AGHT+IHj7RM7oYv8CAP9L6kG4UojxzqPS9rmiKaglu6TUVx/+oFVELO0Qo+ExyfHVWSfF8eNh49yVQ==
X-Received: by 2002:a17:906:6a0c:b0:ab6:621a:f87e with SMTP id a640c23a62f3a-abb70de28e8mr1750521766b.41.1739959228636;
        Wed, 19 Feb 2025 02:00:28 -0800 (PST)
Message-ID: <bd74b357-b254-4c43-a417-f26434361340@suse.com>
Date: Wed, 19 Feb 2025 11:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano@stabellini.net>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE-telem: adjust cookie definition
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

struct mctelem_ent is opaque outside of mcetelem.c; the cookie
abstraction exists - afaict - just to achieve this opaqueness. Then it
is irrelevant though which kind of pointer mctelem_cookie_t resolves to.
IOW we can as well use struct mctelem_ent there, allowing to remove the
casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
pointer to an incomplete type and any other type") violations.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -64,8 +64,8 @@ struct mctelem_ent {
 
 #define MC_NENT (MC_URGENT_NENT + MC_NONURGENT_NENT)
 
-#define	COOKIE2MCTE(c)		((struct mctelem_ent *)(c))
-#define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(tep))
+#define	COOKIE2MCTE(c)		(c)
+#define	MCTE2COOKIE(tep)	(tep)
 
 static struct mc_telem_ctl {
 	/* Linked lists that thread the array members together.
--- a/xen/arch/x86/cpu/mcheck/mctelem.h
+++ b/xen/arch/x86/cpu/mcheck/mctelem.h
@@ -52,7 +52,7 @@
  * the element from the processing list.
  */
 
-typedef struct mctelem_cookie *mctelem_cookie_t;
+typedef struct mctelem_ent *mctelem_cookie_t;
 
 typedef enum mctelem_class {
     MC_URGENT,

