Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C119BF194F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146383.1478818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAq89-00076Q-85; Mon, 20 Oct 2025 13:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146383.1478818; Mon, 20 Oct 2025 13:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAq89-000745-4T; Mon, 20 Oct 2025 13:40:57 +0000
Received: by outflank-mailman (input) for mailman id 1146383;
 Mon, 20 Oct 2025 13:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAq87-00073x-CW
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:40:55 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6643f369-adba-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:40:54 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso15003675e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:40:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c34sm15309410f8f.17.2025.10.20.06.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 06:40:53 -0700 (PDT)
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
X-Inumbo-ID: 6643f369-adba-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760967653; x=1761572453; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNJ/evPhOSp1+zEtF/q+JX8VqH873wcKiQbrlqKzHtE=;
        b=Ag8l1B2D5MYNmyTQEtLFv4Ovg7dz23UGxVNpSERLNhtdxefB7SDFtr9hTH/WC3Mihd
         bUKI61C5uieGNMYQKuunJPdOian74juhDZ96O5BoLswv1FNqox1dFa3zuu5rIm4+fVaG
         7lyk/rXbE7ghl1/P6AzGyDAGTFpNAEU/7IqvtHK886kiW6uJszl26+QRoHXyScLkS7Wn
         PLAfa6NdZFgQw/232ibMp5yTJO9FKPETy50YamD4Jtyw2QqkR6MI9+1ZWnB9WcLeIF4H
         bhR12CjlgHChngnjS6ljGxOc0ldnmExYfR/UMaQdhqn5iDhVQvaH3k1uMDr2w3QsV6fJ
         BAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967653; x=1761572453;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNJ/evPhOSp1+zEtF/q+JX8VqH873wcKiQbrlqKzHtE=;
        b=J4NAIZYtqQ5pr0BHdG1P1eJPttUXjb131zDmjhT9uguGGtPnnrmA/CyT8NLUSk4QPX
         ekyYJQvRZlF+b7XmmIorhzDQLUhP64cpaez5TiZjLceNyVDZdOw0gQ6+iaSHFNbkNqJ1
         6Lir7EUPn6UIaH8s7YhgJRAy8YNP7vUROx8RFBKgc4Wzb01UYqjlYZbFfCVNJ160cXpZ
         DuaxSsNPjy6BAtLiW7QWYpMKRCqdek1jxujK4axGrFe8Y6uyYz/sPepWPKntXmkRbhG3
         ElrZYxXTtX90MZBn0w8VGlXVM9JnOdhfpakwedwzWRx9lSvDfaEzSZyNeMMlJbDhziJh
         Ynqg==
X-Gm-Message-State: AOJu0YwLRpcWXCraDD7TXC2brhz5iJfT5TXeC7TxQ40sBtPPSP0HwMlT
	q86o0d3Zd7epp+kVo8c0uV4IggRdh1+NW6x8bNspxXVWdtiDNclVjcczdFqWl6x/TmNAIid4o6s
	gsRE=
X-Gm-Gg: ASbGncvoy41Vrqpn4o/e3iPqXyayePGtsm/1sZ3UApzm+8qfbxwhiVXgiHolmaIDAVz
	JKn3hoevOoDVRos6jppLb1KG4NnO/i+alcOdGGpYrdB/QaOeAoFguEDvh1BNeRrKEJNu8kscyYr
	UJyhIUTT3KHtu7az2psYXfS6kpR4MMkODjXyVi34cC9FMP94TmVnw4nRyAz3FRy3Sv08Rbybono
	SAApQprCLHqSMvoPcJskMH4xxu0Ku4Z2GHjJq9hVehtf541rSy3ffkJSeYIRkuVCI7LLvTTiM63
	aoWfePq0S+4AW4fbQhK0nN6egJkEiv5NozxhxUAgK4Y3XmFxDk7mHfwp8E8BY9IYRHA64KURisM
	uJyu9t3gKyiEH5+AlIHnPROtkTof6gZpMeqt9EcHHvsLOYHeGkBbvF/SHsyp52yUhgaWbu+xpUv
	9UXypbXnRqPUIoitXSyRdGXb1PPh8vV7RMTPw2S4iuM5UIEP+5MZbtiQnk70fQPsrmFoYeaw4=
X-Google-Smtp-Source: AGHT+IEVtdBYctifmpuwnOwc1fw8vW+k3MYI2eFKEyzcpaYWCGnk8n9xQejsgQu7Bx6yWs5nb1ZseA==
X-Received: by 2002:a05:600c:540d:b0:45c:b53f:ad9 with SMTP id 5b1f17b1804b1-4711791d215mr105301435e9.33.1760967653536;
        Mon, 20 Oct 2025 06:40:53 -0700 (PDT)
Message-ID: <d385addc-ada1-4a75-b210-38146a1fad2f@suse.com>
Date: Mon, 20 Oct 2025 15:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Denis Mukhin <dmukhin@ford.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21] tools/tests/domid: don't pass -E to sed
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

Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
doesn't name -E as a standard option; only Issue 8 [2] does. As we can
easily avoid anything "extended" about the expression used, drop the -E,
escape the parentheses, and replace the sole + by *.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/
[2] https://pubs.opengroup.org/onlinepubs/9799919799/

Fixes: b3d31533a047 ("tools/tests: introduce unit tests for domain ID allocator")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -10,8 +10,8 @@ include $(XEN_ROOT)/tools/Rules.mk
 TESTS := test-domid
 
 define list-c-headers
-$(shell sed -n -E \
-    's/^[ \t]*# *include[ \t]*[<"]([^">]+)[">].*/\1/p' $(1) 2>/dev/null)
+$(shell sed -n \
+    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
 endef
 
 # NB: $1 cannot be a list

