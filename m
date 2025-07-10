Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD7B00126
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 14:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039437.1411283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpzz-0004yV-Vn; Thu, 10 Jul 2025 12:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039437.1411283; Thu, 10 Jul 2025 12:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpzz-0004wx-Sc; Thu, 10 Jul 2025 12:03:35 +0000
Received: by outflank-mailman (input) for mailman id 1039437;
 Thu, 10 Jul 2025 12:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZpzy-0004wk-6V
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 12:03:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e68de6fc-5d85-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 14:03:33 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so702243f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 05:03:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c301d9e07sm5115828a91.43.2025.07.10.05.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 05:03:31 -0700 (PDT)
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
X-Inumbo-ID: e68de6fc-5d85-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752149012; x=1752753812; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E9s1NtRo6+IErA6eabhhK2sBH5w9YPmLOiShA0w4lLg=;
        b=gh2KNeh7glaePgLuCSy2gtw5rLMLPuuZqycrMnjdGh3W/WjEgg5tuNElPcGcaagox3
         yKS9lzd6m8oizloXZTR7UmCyR+2pTafJerWCpyk8/3FbSx5GEPZzobS2wHax9kXZ1foG
         vV82h4Co6WRdh5tPEE7RypihpSDUkBFBGQjxeUTMEaXO2kYxDpHQ9fvNuvRyeRywA8go
         mQnpDIxGzXDKQ2QzcelyeLErK8vs5qFNfhjXI88RYVFDfvs+NipZxc5LhhPKnHaymehb
         uBvWmsXJjXBn+oRkf5m/oF6N2zhsnf+U2CJsO6XvNoDyTahiF5CDFQ7fd7MhBWujnIBt
         3Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752149012; x=1752753812;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9s1NtRo6+IErA6eabhhK2sBH5w9YPmLOiShA0w4lLg=;
        b=SvBNqwyKSZFU3ucgRhDI54i3SmQIIQgIzhm+HYxNALJxyY8W7jiPOignhfxQSG0WS2
         rb11E2AFQIdFfkck/OAE/nEvahntJtKCh9yfkaRi0VVYizXJkKI70iOWJ1QhPss+UHcg
         CRhrZNt0aAGct1pQthgiNvjR9rshLy058eryMSnT94E7M1nyKYPie3U/30iS16FMx0Tq
         Jv5dS0dUYL2PnqNvJiaJTjWacUfqP4eqS1wuYLEXZ3QRbJugHKRxTf7xv07OWCT/bCmg
         Y+RsZwikNWiL0tRZoZ2r6vIw5KxXrwOE1lSZE9b8oApeT/rYIw3fPaM+EG2O4mf0DIMv
         Yc8g==
X-Gm-Message-State: AOJu0Yy9NR/Hveyqvhbv3zU9EIbMIot9J0EVt6wiX84d9C6sUDZ7UzEv
	uBAuldozzTq6WKKhPOrckrKkwDyK8jxj3Wp3Pixu+Nxyhu8Yt44k+ZM1y5ITr1mz2hGOjvfT8AR
	/E18=
X-Gm-Gg: ASbGncu/7gbJNt+tfjwyjAaIwJZcXacXvX6t8W0ooj/XsiMsSDjqk6eHh6UWDRIDp2f
	8/sbs7mHfQxdN5qeXmr7QIJw/lF49np6q/mph0WTm7BVlA4355b3SuBtWMsWEtXk3m2Pz6GTB1E
	E/rybbJ9wYOmXgzxjSZaRjfd6q/K2KSBZUlWMP/O+NrjyETrI1L/UhNZhNVltdyhR3CnxW+8Z2m
	iZ7bcBejn+Kmfg0rzLbhDmAOh+A8joSpBUTFS+NCocnviiVEiSTxHTm86bMmPGbK+19x16qn8dX
	3OJ74tKgFH8Ezgmjii2CaDOEoWRpRm43xl8O5rhJ6/tzAQOqtiiKAzLVKrqAYbxKcBYYW3cBviM
	aLMaHioLj3aUog1r302GlIjV+Mes28o1dX07UJAxfBNm29ELq/sEEyn0GvQ==
X-Google-Smtp-Source: AGHT+IFRDLx2gaQqVClqO4B7ug+5J8RzSyJgcI7dOJeRT0H3Wp9CMTwUX/riPP0YAQ/9hNgXX9poxg==
X-Received: by 2002:a05:6000:2085:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3b5e86d22fdmr2341732f8f.48.1752149012146;
        Thu, 10 Jul 2025 05:03:32 -0700 (PDT)
Message-ID: <3e26dc1a-5764-4296-bfe2-9e84e637414a@suse.com>
Date: Thu, 10 Jul 2025 14:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.20.1 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
Content-Transfer-Encoding: 7bit

All,

we're pleased to announce release of another bug fixing Xen version.

Xen 4.20.1 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.20
(tag RELEASE-4.20.1) or from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.20 stable series to update to this
initial point release.

Regards, Jan

