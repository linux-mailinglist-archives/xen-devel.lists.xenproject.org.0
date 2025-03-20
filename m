Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A964A6A5FF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 13:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921923.1325717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvEkv-0007Ud-J2; Thu, 20 Mar 2025 12:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921923.1325717; Thu, 20 Mar 2025 12:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvEkv-0007RV-G6; Thu, 20 Mar 2025 12:12:13 +0000
Received: by outflank-mailman (input) for mailman id 921923;
 Thu, 20 Mar 2025 12:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvEkt-0007RP-Ul
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 12:12:11 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c34ef49-0584-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 13:12:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so4636715e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 05:12:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4870ee71sm30376915e9.30.2025.03.20.05.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 05:12:08 -0700 (PDT)
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
X-Inumbo-ID: 8c34ef49-0584-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742472729; x=1743077529; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uo/nKMQWfHp8sRFheYd6zo6IMpwdXsnNPYCSox5bIcI=;
        b=Rc+TDWJwcF1XRZilfNxnVPS+MVkoI+VT5lvzi/M1cbEc8VBBJODy1WhLrErt9lghsD
         4NTO8I2twHi/4kiWfZ5KZP8I2pLqy9X9pw9v5IZJSFVeAFUIaMr33BXsG/8ibx0fmYJ+
         PRuQoQLGQCdYcJGmhFkLhkgncW8grsWoA1eheEt1P5lD/SUVxbZPdmDF1AWsH9+dGQxO
         YPlt2mYZ3+6jum8StP9nY+ha6WsC4LgtXcl2k8iqP9eG9QMn5TSWsKhg7pxlDg2053/6
         Mi0D0YzrI7sEj8I1Dow1DunVaNaL/auQPPUbFJwYWjfJyZxfu/CY/e5jepCfLdH6fVXG
         AODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742472729; x=1743077529;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uo/nKMQWfHp8sRFheYd6zo6IMpwdXsnNPYCSox5bIcI=;
        b=cRbbEiqnKGeE89MocT21sfGPTmI5RP9KXlt7sLLowLuig8W/sNBc4wRozksj0fpodD
         CfZqfKObc7giCt+mjBU2S/CRtXYNFXSE7KipJtWnFvj2W+IdD31bSBD3jyj+kh7PgLX0
         MVpt5FxmbDbcd6PAj6OqF8VviOl8RKRJ29YasSEbFcrvVstHJWqEDReEX28B2eDhEGUV
         1RE1CNCjR1LxvQ8RrXZ41HUoSwzaj6ICG/lG3Fo+Wr+zf/YMFy06uATg8OUdT8+9NFRC
         kr48zT+kKItXG+0/dPhjE3+JTAAHvUlfmpv9OptyoVWJ7M3wwfGTQfqOG5dFzdoCXJFa
         YwWQ==
X-Gm-Message-State: AOJu0YyaSeG8FJHcCNrQOiQRZvQdHf6qoPfeZKeMI3s1WNepaLDFUQSx
	bMLyWMRj31V9sgHqJhYd3Mnub8v+ltk3KeTXawAnGxCzplW/fWm7w32FkE3o6d8gyJyrYBZ1iRA
	=
X-Gm-Gg: ASbGncu19OaXcGqSTPfjJpm5nXDblUe/NSLDC2eAMBboxU5/ZisKb7bfHcMIZtJrCvg
	rEwrIcHPv6Sb8rhqOYCvsJtPZWsYYhHiQTE++EsA9JmQq4AqDbZPMbxFdybgMu/BUkMrXhl2+U2
	v3mpQwjYeYzPEWdII2/Kwk7hbkZBoWbbRor6y8Eb4AuMnERzMpMJh5bB0/7Yam+pEdTptDKbhCo
	y5wXAD1hDlKbG5i2IphmBrFj8BBsWp1dMUWsUXPqbmW6VF12G7WpwhxXr+Vuak8uX6KDmcUzbtj
	W7NoLUJ4xjKao2vkNjhPU15s5mGuQZcaQlUfwUUuOlnKXsuojFmhG2atnfVwT4gJmc4ptXz8/Sb
	yj5C5uT00AdP8SxicRvzxMCymOiaFdA==
X-Google-Smtp-Source: AGHT+IF9xo84/lKcBX3kDHsJbaDwiqtvP7XYjIciQ2kIWXnQz4s8lfiOCSXqxZIIGYRgmN+tGKorCA==
X-Received: by 2002:a05:600c:5248:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d495893d4mr25343755e9.23.1742472728977;
        Thu, 20 Mar 2025 05:12:08 -0700 (PDT)
Message-ID: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
Date: Thu, 20 Mar 2025 13:12:07 +0100
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
Subject: [PATCH] process/release: mention MAINTAINER adjustments
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

For many major releases I've been updating ./MAINTAINERS _after_ the
respective branch was handed over to me. That update, however, is
relevant not only from the .1 minor release onwards, but right from the
.0 release. Hence it ought to be done as one of the last things before
tagging the tree for the new major release.

See the seemingly unrelated parts (as far as the commit subject goes) of
e.g. 9d465658b405 ("update Xen version to 4.20.1-pre") for an example.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As can also be seen from the referenced commit, the document already
saying "drop any references to the specific commits, e.g. date or title"
hasn't been honored in recent releases, at least as far as
QEMU_TRADITIONAL_REVISION goes.

--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -53,6 +53,9 @@ t=RELEASE-$r
     - "Xen 4.5-unstable" on unstable
     - "Xen 4.5-rc" for release candidate
 
+* for major releases, drop staging-only text from MAINTAINERS and add stable
+  maintainer(s) there
+
 * change xen-unstable Config.mk
 #   QEMU_UPSTREAM_REVISION,
 #   QEMU_TRADITIONAL_REVISION

