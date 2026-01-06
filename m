Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38918CF8945
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196077.1513948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7OG-0003wh-1g; Tue, 06 Jan 2026 13:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196077.1513948; Tue, 06 Jan 2026 13:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7OF-0003uf-Ug; Tue, 06 Jan 2026 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 1196077;
 Tue, 06 Jan 2026 13:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7OE-0003uZ-Jg
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:46:26 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d39554-eb06-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:46:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477770019e4so8360295e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:46:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e199bsm4612328f8f.16.2026.01.06.05.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:46:24 -0800 (PST)
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
X-Inumbo-ID: 17d39554-eb06-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707184; x=1768311984; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nm6Bd5AlYJkO2GSMSZ5vUgv9i+yeuKEXMRTc4L+c/S0=;
        b=drXhM85uvJjZKP1eCuB5tnZKW+Un1lwPHX7ucKYW2/U56xU4EvRQ36bY7I0nIRZbV+
         Ao/5PL83xZeeNW/9yefz/zGNtZ4UKRX9jbBrrmqLFy8TXWogLOEc4Ea2aT6lGEDRQLnw
         5ztfw3zVoE7NTGjp9HTTC66p0rz7+ZIcDTErlY/cYVwUyyAKlBnCHV/ITWRZV5zHg6r5
         Gw9kus2DBOvDsdrkjBmh0K+gbC+x4W/QqDaPSs7UzHS+umz2DsVVYGl2qzzj2t9QnBLW
         R1yd+JzJ/XQMkyDTV+L1UgjanYVH8rqq0n+PD/tDDi6OcOVOpnSmSR2qwAOSLKVA9Cxo
         AfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707184; x=1768311984;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nm6Bd5AlYJkO2GSMSZ5vUgv9i+yeuKEXMRTc4L+c/S0=;
        b=MOt5uOAuW9hKT1qW333kX34o/R38QnqzKVOz4gHDTqFtZke9aHm+xgfyrOtUOqO1N6
         D72XjFP1XS65HaFw5I5uF06B3peSzR852ThXVA5VCx2vfcmW3GWGq8Yo/dJkOJzHucAT
         PIeeOi33+WEPrR4uCbmkshX/YhYgZRYLiuc1fDAcLVP7Y2TQbQJ0W7LAdsItikcLJ/JI
         RdXIn+CirWUyFUAdWZ4allcze74FKd1XOJaUo5oZZzmePrQBXMz5NTuTGkyPYxMRH23a
         7gc+2hPmjmuScHWP/o1LamSDRiq+kPcySWqNAYobf8KnXwUifZTdlHmNua/YRa7zY9/F
         1QLA==
X-Gm-Message-State: AOJu0Yzjuse8TiLTHyDoVZoXfS2ZPbUdeD/Q282RENMYnyc4SE3H1f2U
	5/0yHf/qwMc7wlgDx5FXNbZgskp3arXRULFskR5BKCcHL4QgPN2NGQENIN2/aPo7aYFA9WE1SUa
	OSwE=
X-Gm-Gg: AY/fxX49KbdTo32lKCsjQ2tGafPM+ujHt+/HdYkfNatibTdDnLtAeF96Wl6tw2sSb3j
	5h2y0m+2FY2HmmqmDJUccTcFfl7lZcEMuB6ZCPyKk7x4+YVlVCQjA4JtcRt/SLxFW6dnen6Mufg
	ulGwJfvVkj7Hknfl002BOoLOB/5myc2V+Ao8ukIZqZ9wuq20uvognOi+P/XZTQBocsuUEKj0f8n
	XE1ncLDoT1aiPSvkTUssD78hQVW7KnEHKbfoLdlzQtD1yS02hlDcKqaTHs+EPb4L6bM5t/ef4F7
	TdJyGNOnpDWgDUKic2QZpL49tZDIFONO/OQclMSS7WmcbESfD/1741I0eyLjLjQ8gWSIyLGDshh
	FrHgvKUeColONDxqB/++Qb8wdi13kdCyXs2dElVXFjnIO6IcGtMTVztv3d1Ce4Jbr74zZcIg70L
	UAUjGXX5WjgjI0GPwcJ7VAqckrmMzvMwU01FTHcwdyqLh77PduOW0xyf5cPUDGqT/LEEhWRAos9
	VQ=
X-Google-Smtp-Source: AGHT+IH3UrQMVtEI+W2iH8Gvg3XFXjUg3iiqF8d0gc2sOHP618+xC/zwBWOGjBzn1BJ4AdYRhx5vZg==
X-Received: by 2002:a05:600c:4f0e:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-47d7f0a0023mr33364995e9.29.1767707184611;
        Tue, 06 Jan 2026 05:46:24 -0800 (PST)
Message-ID: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
Date: Tue, 6 Jan 2026 14:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] (v)PCI: extended capability handling
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

This is a follow-on to 'vPCI: avoid bogus "overlap in extended cap list"
warnings', addressing further issues noted there.

1: PCI: determine whether a device has extended config space
2: PCI: pass pdev to pci_ats_{device,enabled}()
3: x86/MSI: pass pdev to read_pci_mem_bar()
4: PCI: pass pdev to pci_find_{,next_}ext_capability()
5: PCI: don't look for ext-caps when there's no extended cfg space
6: vPCI/DomU: really no ext-caps without extended config space

Jan

