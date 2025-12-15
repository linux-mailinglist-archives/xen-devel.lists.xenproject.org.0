Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A680FCBD780
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186828.1508256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6XF-0003x8-JR; Mon, 15 Dec 2025 11:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186828.1508256; Mon, 15 Dec 2025 11:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6XF-0003vh-Gi; Mon, 15 Dec 2025 11:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1186828;
 Mon, 15 Dec 2025 11:14:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV6XD-0003Bh-KX
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:14:35 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf7a7f5-d9a7-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:14:33 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso33258705e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:14:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f38a4b7sm183059865e9.3.2025.12.15.03.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:14:33 -0800 (PST)
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
X-Inumbo-ID: 3bf7a7f5-d9a7-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765797273; x=1766402073; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmAt/U7s8ajYKUtdK3YePFRZxAxQbYMNfJ6Il/WbG1g=;
        b=IbKHbKl20u2UI0+J1loBI+rWzHib9GwRLDbcae73ClcNN0X7EZ7tj5Zj5d0wbupXH7
         ius1zoedkuzRSmvfMn1mHIVdvOWOotOUmkjCcoTeMW/6imsBIXzjvEFdjytscu74VlFF
         Y45vFFd8fBRjx//3HE6ylC5eOEaFuSiTZzOkQFYB9/F+Pvzwbd+heA4BHRlFKB2CXlRD
         oXjm2mo39q8F+hETJ+nQxCIyF+DylODU1Exfcua2AmlyHkgjmKQWTPOGw10L5ch4xyfo
         a3WtYHA3T+u0RPdo9CVUbtsc00Gg9KRxbPCKwgf4FkX5oDIeUpfg6q9z2txfavXIlNTp
         JeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797273; x=1766402073;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmAt/U7s8ajYKUtdK3YePFRZxAxQbYMNfJ6Il/WbG1g=;
        b=hoXNo4Wob1j8k5R0zYqiL4hqvCKZCH9LsUn5oA82Xz+pwo9hdrPsXv41UoPM0kflTT
         naR7uH7GpwSAPYAfFPLZJ9OpnfXpvj73NzdFFGubT3XaM1hTRIrKDVZJLzGR7aPjddzq
         O91VNM9M86XCIO3fhrA4FmPqE6b7Sk02/gHytsP3FE4TocBqarH+4Bum3NOQJK3L8xdq
         H6Q/X7nZ7oJi1hFFmgDtEsXxNViu2GMSLf7w2Cymdkb8TTnh007ylqiCD2bm2NOLWLDr
         f2h+5udEOuilIxZoi5D6EPAw/okC7EZpBIbt2lRDc+GhNkGS9DI0plOt63hgB0baGVTZ
         ou4g==
X-Gm-Message-State: AOJu0YxsWYYx/09cBgxFwNIFQclOoCOLgNAPimTDd/UQAi3gpAvsNX/N
	WiqvQvXkanp8BbEmt3OPn3pk8kpE66wxBfKDG6HqTRO4XCXxA+NQkN9RL+UXxlcXABmAJvoQQ6U
	BIsE=
X-Gm-Gg: AY/fxX4mxwXVOxidLrZGQsIun/siZf/E58pvo6hzgf8y0yIhqnCfRAOeDLrIyMoP8sa
	PxCfguNdRsL41gx0SO6Qtq8JduXvYXofzvbQ6kBa/SBBJVpnGNoKZmpUHQDZLHPRS8YAu9syLru
	/CKRFvIqUIrTgKPh1QnOMllQyQVsz+XKR3w+Qs7JQTn4KP21jpI3c2GqqafJwD0T4lQb9Z1oyFw
	chrtJ5v9BVhfSAhqX9r5eGrNS0Yd4ByriWxEEmLkIR9jVwQeUS/XCK4KszuKYsMan0eIvwwGqk6
	j3K0k6B5te7wLY2ZTlnP54lhoi0HeWh0hrVTsNCuk9gsEVq7KPOA19bkPSXSzCz+KVf9mrFw1jp
	uyw5oLFM20ECJjzyqW3RHqkj6Pd+nrnRCq+p3ShRWfKZePPFkJPlx5/VBQnAqsqTu3yoBSKQGv4
	/zpJSEXrEasGima4zNkI+vv3yQM1BTVQhxXK7hEkge1XhVrgs/Go90Cr/EWkKL2oissdiyubxIw
	ME=
X-Google-Smtp-Source: AGHT+IHGqqNaRNA2IYV7APZVS4yndWsBWRa2PdRykLtTL7GBOhMQ3kXbVU4PzZAZ7+hn44bVzXe2Gw==
X-Received: by 2002:a05:600c:c0d2:10b0:477:9cec:c83e with SMTP id 5b1f17b1804b1-47a89d9c2f9mr114007055e9.1.1765797273320;
        Mon, 15 Dec 2025 03:14:33 -0800 (PST)
Message-ID: <6706eff3-bdb2-452c-8ed9-131d6bc9b8da@suse.com>
Date: Mon, 15 Dec 2025 12:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] bump default SeaBIOS version to 1.17.0
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

It has been around for a while.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -218,7 +218,7 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.x
 MINIOS_UPSTREAM_REVISION ?= 6732fd42d8eb8d0af9f5eb54aca17f4c250213a8
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
-SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
+SEABIOS_UPSTREAM_REVISION ?= rel-1.17.0
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 

