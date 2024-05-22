Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507898CC1AB
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 14:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727583.1132093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lXg-0001Xg-EI; Wed, 22 May 2024 12:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727583.1132093; Wed, 22 May 2024 12:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lXg-0001WA-B4; Wed, 22 May 2024 12:58:04 +0000
Received: by outflank-mailman (input) for mailman id 727583;
 Wed, 22 May 2024 12:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9lXf-0001W4-6G
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 12:58:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb7eace8-183a-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 14:58:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso958822266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 05:58:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a5c033afasm1433727366b.156.2024.05.22.05.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 05:58:00 -0700 (PDT)
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
X-Inumbo-ID: eb7eace8-183a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716382680; x=1716987480; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejHjN77I6205aI9N+tr1vAfoGHfyt+oSRb0cin8tAFI=;
        b=dY3qUnx1gu3j2vMbD28fbsyjm+Pm6K8dNy3/SsNmcVK4KespojRFVT+s/7qoRuLY38
         /a03Uzr6Wkzwh2UbpmI4Q8Kc6iVgITPZjEs2zOUV5MNTw7Sko6G8zFF2VqfejRp44czB
         Ht4ltHvf6JsS11uCEN08vBNC31r+90PFgiwHsLEc+msqDFteJiy6R5q5+LfPz1GAd1pJ
         xMzhi9dK8deckBIFAYRUiPPSR8fx5S745fu/MUz5E0/HSIRwr49SnEvovRe6IhOkZbP6
         SxYHw6juMwGmafDKlLjB0kXuCJQomZQVIJCMtu55tGJTbjSeBd6VSaFH45RgZacQnSga
         fGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382680; x=1716987480;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejHjN77I6205aI9N+tr1vAfoGHfyt+oSRb0cin8tAFI=;
        b=iv4qJJiJV6KB4WmuIBjtoBtfpTnfkefRZZkTUIXLu3evPLZA7PwSY3gs2koQ0ceRIZ
         PBFsNkZY+OYgXX89i3TSHYx0+FsLThZepfxzH0GioCdBJpUiAvqjf5+EZ1G8cFQ9Mx3E
         nG+6Pr0Mc+upIy9h2TfYba7/DiYSiD6vRYB+6zKl/Rfe8XUUgCkwPB25YEC4v6+wAByI
         x6xibUTPy7kEOtVDzw28S5ryArxQ81r8iIiLBCFK6Bd5X9NzDS3lVvNQ1rMy+68yZ+bJ
         fgikLA9C9mVv4czsU1imAdXTUApqWRe2s3HDrhJB58qyJ/zLyK4orzwP9q3ByrZFP/LX
         M2BA==
X-Gm-Message-State: AOJu0Ywhf9cVvHY/ubSWNIzc5sK/CDx6g1jL3nab48GUaG2SfzTJE2mD
	Yi9cEJrVCKO/s9rGm93/CL8OObC8+T4tV/FUvP0KR5bvL7nWceNfQlYwN9VNuV+PPLeTSR2JLsQ
	=
X-Google-Smtp-Source: AGHT+IGyfMEOvJdPNDLFJjA7oHtW9RZok+yOaZGxf7dJCdQHGStGpZiS50mD25kIFWpOw8QilXzVQQ==
X-Received: by 2002:a17:906:a1d4:b0:a59:a033:3e2 with SMTP id a640c23a62f3a-a622820b853mr176348566b.74.1716382680584;
        Wed, 22 May 2024 05:58:00 -0700 (PDT)
Message-ID: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
Date: Wed, 22 May 2024 14:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2] x86: detect PIT aliasing on ports other than 0x4[0-3]
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

1: PIT: supply and use #define-s
2: detect PIT aliasing on ports other than 0x4[0-3]

No functional change from v2, just the introduction of the new prereq
patch to help overall readability.

Jan

