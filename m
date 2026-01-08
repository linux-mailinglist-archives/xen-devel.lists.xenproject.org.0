Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B258BD04039
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 16:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197776.1515211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdsEV-00080C-0t; Thu, 08 Jan 2026 15:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197776.1515211; Thu, 08 Jan 2026 15:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdsEU-0007yl-Tr; Thu, 08 Jan 2026 15:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1197776;
 Thu, 08 Jan 2026 15:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdsET-0007yf-6K
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 15:47:29 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530a9ecd-eca9-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 16:47:23 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so1709292f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 07:47:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacd1sm16800969f8f.4.2026.01.08.07.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 07:47:22 -0800 (PST)
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
X-Inumbo-ID: 530a9ecd-eca9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767887243; x=1768492043; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L7DVyOTXsb3+CaG7eTe4cood4tHN4Xx26Uj7rq+UfWw=;
        b=Vs/6eNC5etK7k9PomdeUxiN9qA0MV4L3knklnS25POvK0T12bl+NgQzC7qrRpsgtnC
         oEPlcjF1mythLoK6AIQjAgDxyFBIwENSaz+1Jgw9L5TYHcRlilVhsLuKqJ/MCfq5so6L
         noY1dUVbF7josbM5t++cGoiQdmEU6ZemB9ulwTVB0DFEKO1vw1bdmaoLVP0BKbd8j2hF
         cj80rOcvspZDA48EzzdhGiQCEvhGE/JPZxx7Kpo1FSdzFIuJYyz/OZw5NFJyo0IOxrsy
         /uMH62ERCZFXRrTCYiza9eHnXK2sXed9pNXRkCiTVYBAyPu4xd+bi69osaiA505MO66f
         v8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887243; x=1768492043;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7DVyOTXsb3+CaG7eTe4cood4tHN4Xx26Uj7rq+UfWw=;
        b=ntISgs1q7nZUzdY2s36m3zbTBS0ExY7PaugVfaIpwpX8uFo3zvYiTkLbh9uSowvMBm
         21G/oCLJM5ip1bnq8XA95IiOxL3JcT01fLJ21EPEq1p2vk9Us73eP209PcAY2W9bvepY
         VaM1WWmRQdUSKe9ws6nyRM9JvQ4oe4CRS2rBi0o/O1oN8GTSytV/TQ0/jAa4KqqwctVo
         8w1SptNH2RUHVnMI8BQekf+qTUqnK/U2NNVA2cWwAX+BQA54a9h9VDq0XgOvsQ+w+J9K
         BckiMeCGEw4dOXYyyuCHZnfkguUWF9Q5bWkvxrWi8TqlYZg6cY5Zd+4a3/dLlyCgqvJ1
         sKNA==
X-Gm-Message-State: AOJu0YxWptDX2MG+d6puE6BCbpXMcBU0KwyQPbPCNLnhfT+NyVGQeXrG
	vCOAg/6q8yh3wPLELsN8O0SRT70IepYsyeQgMuL9oxrgEf0JDpxqiat638kwPCW2pr2snTZk2/+
	MLns=
X-Gm-Gg: AY/fxX5aKLZGLUiakWDoNJw7zstJ/ZuBky4hi8JpS8NOfLMYAXlsTrUniYhR0rAwdhF
	QOHePuYNPB9XxVOL4bKXlDzQsWv9EjGN3rq26HQx3qv0rAYiQqfSemUtbPvxtM8r7+Qx6iY7gp/
	9oVj8EMkft5pyZMlMPwn/laHr4qjLQYTrfDvN/tPg+gkiUy+1ACOKfMBEJOXEAnkrCoDtnUjgDw
	QO/DpNWv9UenHJBTb5m5H5oQbg4VyrQ68YQ38DasgL7YmkDFXUg0Ppc2pQ20UaWYxnFEQncDaBI
	6gdlIRLtTADlafx/tK74HqIzUDgrpphHb9zg0gB+NTb/d2B+7tB/EWO6ZXPDrnPf2QUzFvuff75
	0lB97H/55f0tvwE2Rh/E4yJm877tsw2njMx45+T8ZVAMIyiwMcbMcFCNgzvqUwyrfd1F1JKBn/f
	ivZ8bk405V/reN+So6qSE7GnS7gslvhyWvgPmUk9V+3H7k/QXXBdgQkHlMglJEiN52oTPTQDccr
	G8=
X-Google-Smtp-Source: AGHT+IHBdud8VfeLIWdYQtlXU3fvvyYEZA0MIfKCjdZcaMoUAvuWLyv7caRmi9dajyAkDee4jPCmTQ==
X-Received: by 2002:a05:6000:4013:b0:432:8585:6830 with SMTP id ffacd0b85a97d-432c3760f78mr8434273f8f.45.1767887243079;
        Thu, 08 Jan 2026 07:47:23 -0800 (PST)
Message-ID: <b93fd713-c24b-4aab-a24e-1b69b4c7e233@suse.com>
Date: Thu, 8 Jan 2026 16:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][security policy] move past team members
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While this information doesn't appear on the rendered page, it probably
would nevertheless better be accurate.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/content/about/security-policy.md
+++ b/content/about/security-policy.md
@@ -39,10 +39,6 @@ asidePosition: before
 #       - icon: fa-star
 #         name: Andrew Cooper
 #       - icon: fa-star
-#         name: George Dunlap
-#       - icon: fa-star
-#         name: Ian Jackson
-#       - icon: fa-star
 #         name: Jan Beulich
 #       - icon: fa-star
 #         name: Julien Grall
@@ -51,18 +47,22 @@ asidePosition: before
 #       - icon: fa-star
 #         name: Stefano Stabellini
 #       - icon: fa-star
-#         name: Wei Liu
-#       - icon: fa-star
 #         name: Roger Pau Monné
 #   - type: members-list
 #     name: Emeritus Team Members
 #     items:
 #       - icon: fa-star
+#         name: George Dunlap
+#       - icon: fa-star
 #         name: Ian Campbell
 #       - icon: fa-star
+#         name: Ian Jackson
+#       - icon: fa-star
 #         name: Konrad R Wilk
 #       - icon: fa-star
 #         name: Tim Deegan
+#       - icon: fa-star
+#         name: Wei Liu
 ---
 
 {{<section md="true" class="content-markdown mg-neg-2rem">}}
@@ -301,6 +301,7 @@ This is a list of organisations on the p
 
 ## Change History
 
+-   **v3.27 Jan  9th 2026:** Move three people to Emeritus Team Members
 -   **v3.26 Jan  8th 2026:** Changed embargo control
 -   **v3.25 Dec 23rd 2025:** Removed iWeb Technologies Inc.
 -   **v3.24 Dec 5th 2024:** Added NixOS

