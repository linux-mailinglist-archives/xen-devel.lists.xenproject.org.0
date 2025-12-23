Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E245DCDA089
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192743.1511880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5qy-0003ZJ-91; Tue, 23 Dec 2025 17:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192743.1511880; Tue, 23 Dec 2025 17:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5qy-0003Wr-5A; Tue, 23 Dec 2025 17:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1192743;
 Tue, 23 Dec 2025 17:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY5nF-0000rG-8g
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:03:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9ee29c-e021-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 18:03:27 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso2465613f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:03:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea227e0sm29616357f8f.17.2025.12.23.09.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 09:03:26 -0800 (PST)
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
X-Inumbo-ID: 4c9ee29c-e021-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766509407; x=1767114207; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFnPD6cgmdtsDqxiJGsETNIDZdUNRvNHPgixmMEAxLU=;
        b=fXbTDJw642hbUb+yU0Sg7tSTq9gRf2hyhhtOXTNDtt+A54yG+2EtX3xXHxQrka10QG
         xsHQp32Dn7HO8OVWQuuf6/Z2NV1lnsjRH7M8qfI8JnQlHOYtnapQ0BtEFDVK0VGRVnjO
         t+7WZCIferGsRoU6MPiJP7PoSiahKLgW9rbXJPGabmPHPjyBFPPZXPxii1NQZonFfbds
         z+2qOF9QIrnPcIqzZgSIwhwXRyoODYG9eF0kTxqxkLD6/2po5NR2+X33E3ZLs9y9n3bz
         CbQ3FJYh/RBleK7RrEgs3tGoJTvfUEcaWwpqtDSx65QEgp8LYMnsfL2XvgySsSCZGJJe
         74EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509407; x=1767114207;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFnPD6cgmdtsDqxiJGsETNIDZdUNRvNHPgixmMEAxLU=;
        b=YITfcwF6z1p5i2AP2LMlK8lSfaixtS68gAdHygAM1MfPV2Zts9tT7SJuHIhUand5Ws
         DPnCu7hhnXEMXr6n9xNEPcyJN9oYJThWguehV8Un7oziPGwCAICGU6IqJeszsBqjrXEY
         8MH1D+Xrr6l67hI2B8fIlKoF9ayNVWptfjjBNAkQOwJJnjx3Apn1OGBhgCpXmA+PLWFE
         HJayiP8jPWZyoeojK35sarowS5qVRiAoOjxE6RczFmOau8x9R7oMlGP+aD7S5+Fi061n
         c5S5rmCFgfTPrGENFSnKwZOmfo8YbLqCHf9cSw1sIeHHNqs3NISsROsOHRnm1zQy3UnN
         KTVA==
X-Gm-Message-State: AOJu0YyD1fLzA/f8A0UTjVq2tPFIB786CgFk6BkEgExEPN8E6zmgCWrw
	3esucYDaxQdDmR+pdCoS+w0dtTLpkhrQxqQGvZKDB6TLy+Khul2miqiJ2Yn+BSiIJN23esw+/oc
	GM8Q=
X-Gm-Gg: AY/fxX7i2eWQ713ASu43UnecmZqQ6Fo0xEZu0qKP54b52ZoJGonADjv+M8dUil2VU0l
	e9ppSZJn2VgjyvAbmUQ/IkgRuJw528zrV8UxAtF4zWw3Y+bzav/26P1lqSkW1SB1rpwZKDluh7A
	wBT6oAAObV9bs/6N8uAQiW4efjXiWIDtPTxKfuar7CYNZrlxInyjg0gsgtixfF/o3LaFWOq7NXw
	pUJVCTryK0e3r8enZSrvXJ4DXtUQOvDPkOFbr7Q8aelZLnqRMulk2DdtwVY4JXbGp9aDuK1G8F1
	vZNZdmTRy2Ljc35+hoyz7s0mC9IEm+Mdx99wvsdUk6wPVeGI8DnAUyqyBjeM5Ixe5dKDqaso9lj
	oMWwW/1IybXJA7E/+v7vnrvZN0pPD4aLSdpHP6BXMVk3niHX3pjF68Zy188zaXzsuJj8sGUAg5l
	72dUBZlpNtOTwd0Os4O46wViKfvaPMrV6avjvU8VO3ykNMY3StW0eGRf5W4ARlBap0jxlAufBVZ
	Z0=
X-Google-Smtp-Source: AGHT+IFxwWc/AWCBV2CWEN3qHDK4cb6VCTMRN35Bo3jX5hHim9OaAeSTLpPyqz+lntfG0G1H9q7ZYg==
X-Received: by 2002:a05:6000:1acc:b0:431:327:5dc2 with SMTP id ffacd0b85a97d-4324e50a6acmr17751233f8f.51.1766509406738;
        Tue, 23 Dec 2025 09:03:26 -0800 (PST)
Message-ID: <93718ef5-bb60-4476-9936-039f11a945ad@suse.com>
Date: Tue, 23 Dec 2025 18:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][security policy] embargo control and crediting of discoverer
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

This is as per discussion at an earlier Community Call.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Btw, what does "(b)-(f)" refer to under "Specific Process", item 3, sub-
item 5?

--- content/about/security-policy.md
+++ content/about/security-policy.md
@@ -103,6 +103,8 @@ Vulnerabilities reported against other X
 
     At this stage the advisory will be clearly marked with the embargo date.
 
+    Unless requested otherwise, the discoverer will be credited already with the pre-release.
+
 5.  **Advisory public release:**At the embargo date we will publish the advisory, and push bugfix changesets to public revision control trees.Public advisories will be posted to xen-devel, xen-users and xen-annnounce and will be added to the [Security Announcements Page](http://xenbits.xen.org/xsa/) (note that Advisories before XSA-26 were published [here](http://wiki.xenproject.org/wiki/Security_Announcements_%28Historical%29)) . Copies will also be sent to the pre-disclosure list.
 6.  **Updates**If new information or better patches become available, or we discover mistakes, we may issue an amended (revision 2 or later) public advisory. This will also be sent to the pre-disclosure list.
 7.  **Post embargo transparency:**During an embargo period the Security Response Team may be required to make potentially controverial decisions in private, since they cannot confer with the community without breaking the embargo. The Security Response Team will attempt to make such decisions following the guidance of this document and where necessary their own best judgement. Following the embargo period any such decisions will be disclosed to the community in the interests of transparency and to help provide guidance should a similar decision be required in the future.
@@ -118,6 +120,8 @@ As discussed, we will negotiate with dis
 
 When a discoverer reports a problem to us and requests longer delays than we would consider ideal, we will honour such a request if reasonable. If a discoverer wants an accelerated disclosure compared to what we would prefer, we naturally do not have the power to insist that a discoverer waits for us to be ready and will honour the date specified by the discoverer.
 
+In any event at the time of pre-disclosure control over a possible late change of the public disclosure date moves from the discoverer to the Security Response Team. This is to avoid pre-disclosure list members putting pressure on the individual to extend or shorten the embargo.
+
 Naturally, if a vulnerability is being exploited in the wild we will make immediately public release of the advisory and patch(es) and expect others to do likewise.
 
 ## Pre-disclosure list
@@ -297,6 +301,7 @@ This is a list of organisations on the p
 
 ## Change History
 
+-   **v3.26 Dec 23rd 2025:** Changed embargo control
 -   **v3.25 Dec 23rd 2025:** Removed iWeb Technologies Inc.
 -   **v3.24 Dec 5th 2024:** Added NixOS
 -   **v3.23 Aug 8th 2019:** Added DornerWorks Ltd

