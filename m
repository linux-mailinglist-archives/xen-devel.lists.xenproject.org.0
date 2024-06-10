Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12852901B5C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736892.1142941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYg6-0007KG-Lv; Mon, 10 Jun 2024 06:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736892.1142941; Mon, 10 Jun 2024 06:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYg6-0007I8-IE; Mon, 10 Jun 2024 06:38:50 +0000
Received: by outflank-mailman (input) for mailman id 736892;
 Mon, 10 Jun 2024 06:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGYg5-0007I2-7c
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:38:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 170a0994-26f4-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 08:38:47 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so305456866b.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:38:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c5d21517dsm4990879a12.69.2024.06.09.23.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 23:38:46 -0700 (PDT)
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
X-Inumbo-ID: 170a0994-26f4-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718001527; x=1718606327; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3481wDw6uVUVzHCqP2CpdcoJMJKK9Rm15AkwHAnuUE=;
        b=INHQOAU09u6oplfU13WKhQSpaPl2yLsDyD7Q3JdDxSHkpDx6clCLUqCj5WJ/PKgO6Y
         qZoVXLPVBa3CIJ/8BTWlUHL49Xaszpt9EeSYq7J1lTaTTclzwsSww3Om1xMkXWljvexy
         fgRTHfybVWfbLVwAAuhIWp0JA08LktWzQbyCVtTkzVLYMbALqBYXTW1Ig2GFr36u0cdN
         Kbv2m0YWJVrmxBNU/hiqWYVwOilVWlvKzkujrcGGr5Fa50cRSLluPF57HJBNQPBcVJOl
         Cz2H2bv7YVxqZgWOxtOJI4jbtfSXt1lNOw/1bfVbyg6jPMVjR+M27IpgM9wrpMLt4O9q
         wqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718001527; x=1718606327;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3481wDw6uVUVzHCqP2CpdcoJMJKK9Rm15AkwHAnuUE=;
        b=TZ2LfAexPOwIg3rWe1DesLCNWO9fIfj8ae+YGnXIY1Yv+Xmu00e7zZZfyPV9F/UJFk
         Gfi+DndYDzTYeuHTk0mqOzxp8F7mWJid7M3igNZvT9XNJBsJITBGNLDM2JZHE08yMK0r
         9h2CiVpkdaPiu1BABUf2DG7FOM5gfs3pxXz7GRtJUmKgE0GJPrQOawoak+SOBp1F7eLZ
         fz9OIWgh0rcocL9FyFXGgRUMkl0qEImxCh7g6wCe+FlmKQHPRyEvw3R/TrMek5q2lL+6
         7fkp2480clqx3n6p+By5HG63UzFoYuNNxmAPrpCbCVwwBNMyqhrklHp0i2WqFnfZgvWI
         iMXw==
X-Gm-Message-State: AOJu0YwWn305y9PPN0HLiniFsJIYjm8MHIYwpxPp+lCbcArCn8tOY855
	2w5JoljSNzdbQGR7SWTkzrWWuHHCJIe6IBx+hcSwCYfABYLD6KtTGTa3m8i6aro2wfZn70LNXTU
	=
X-Google-Smtp-Source: AGHT+IFfSibWKFizkFzc5f03K+R4eMM/yllM5gZw32omBTCqlxCOK4JmT7NL/fOb/ulgVUzEYbmvBQ==
X-Received: by 2002:a17:906:71c1:b0:a6a:6ed0:fbd7 with SMTP id a640c23a62f3a-a6cd7891aeemr528066266b.37.1718001526666;
        Sun, 09 Jun 2024 23:38:46 -0700 (PDT)
Message-ID: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>
Date: Mon, 10 Jun 2024 08:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: alter EFI section
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
Content-Transfer-Encoding: 8bit

To get past the recurring friction on the approach to take wrt
workarounds needed for various firmware flaws, I'm stepping down as the
maintainer of our code interfacing with EFI firmware. Two new
maintainers are being introduced in my place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For the new maintainers, here's a 1st patch to consider right away:
https://lists.xen.org/archives/html/xen-devel/2024-03/msg00931.html.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -308,7 +308,9 @@ F:	automation/eclair_analysis/
 F:	automation/scripts/eclair
 
 EFI
-M:	Jan Beulich <jbeulich@suse.com>
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
+M:	Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
+R:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
 F:	xen/arch/x86/efi/
 F:	xen/arch/x86/include/asm/efi*.h

