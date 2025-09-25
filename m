Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AAB9EC8A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 12:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130345.1469940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jTk-00055D-H0; Thu, 25 Sep 2025 10:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130345.1469940; Thu, 25 Sep 2025 10:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1jTk-00052B-Dz; Thu, 25 Sep 2025 10:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1130345;
 Thu, 25 Sep 2025 10:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1jTi-00051i-Mk
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 10:45:34 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3348513-99fc-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 12:45:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so126284966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 03:45:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545a98300sm138765266b.106.2025.09.25.03.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:45:32 -0700 (PDT)
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
X-Inumbo-ID: c3348513-99fc-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758797133; x=1759401933; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pd/akF4fVwQ7syFrc17Agl01p6IeVAe0WtHVGjlR85w=;
        b=W1dzOOhTOUluY/y4lqlMGJSwXySefLkOEQcBdW2O/G5Eat/zxjvfFJgE7uf9HOdyS2
         RfewlffFvuOLNEurX1n23pNM+QVCNN8R+ktkh2kUSSMN7La7NMHqnIL5oviHQ83Cr3vB
         U2VU98rjPigv/CacXs39b48/DiS0Ka57MjW5ZkFqrmr0K81uQGjWehfI0fJkPQ3MDnQN
         wSlq8YZyMKLnm+i+mZJCpSIe0HlrBIm8K+z6xQBvCllcNmkKEi9yIYi5TX1hvalRgkEA
         I8y7dzBF9BS6l/nt5+ApqMgrBHJPDC0Kxb03D0mer4m6zl+8kqPkT4kF+j9D6pRHWVbm
         2Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797133; x=1759401933;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd/akF4fVwQ7syFrc17Agl01p6IeVAe0WtHVGjlR85w=;
        b=tUeti7zhdx9pmHmy9Mh7BDwo55F155cXsqcl1NxihuheTaIR7qKWt5xpP1lmDF4kKK
         iI5ipIDrTgjQr3oae4p+qS6I8n42Go5EMiBRCNgfmMxzWZsVAkr9GwNGiiBpz34KOMCA
         zVw0HHs3Gs7MpW3eZsPdUe21XXZ7yg1e03JjF5cMV3maJu9MBRAIqySHLeci86j7lCKv
         8g7+xKxSo1PTKf3iZD/qAUzcV7kR/3K5ctWkIr3Mb8MvvZR3GpEexMa4ItNV4dwWw9od
         9gBYvOExkTfsMMeSy36KUzPOSsEVvqMKlW6/fh5E6dwuLqK83FJ/RK9KpMjPRHO0QAjI
         B0wQ==
X-Gm-Message-State: AOJu0YwdVKV0NuaYfZK1RvRdkqU93qux3BUXAAqNvN9cliVpUR8i1J4j
	8h5Y0QxYuflePaiBliXrf1IZwUdx+tg9QyHjNxFvudlG/WGwNuZP9425cRvz+oh4yLgIk7hzGbW
	l3Wo=
X-Gm-Gg: ASbGnctv5Ey2GOZVs7n1HAONTIbXNin8IWNCOzJeCNh/7l63B6ZjRhx7OfUt255v8Vw
	M4kHxUyoCS89mBCqdD58LU6xnYkQmBTMtwwzkJlbH1irD81ZqqE5//yc113CxAGIIkVGQsTa2Zy
	wJoksRSqezoQ5I3SdtE/yBLE9Qav/D+lU0O/oSKxcq0a6JwYZUleznAlrjPZLoTTV+OLb7BFKmA
	UIaPuK5J9A4qWHOIVcms2uwana2Da/0vvf7s7xXEepIsMeEM8A2ydIuD2Hn6rb6RbOAcatDCGVx
	yySu38mJx1Dmq9MhrK+TfT2o+35EqtDZWTaZJ9Gcj9hrLyThzeWAh67qHYrJvrrPEOEl3yOA/Eb
	xDlFBbA26gbCS5VzB2zmhdK6EjUcH8vBaof6nH3Wn+R/BsPM2Ih/yAQiGAFb6QKichUtGBzRckM
	ujgGN4cs8=
X-Google-Smtp-Source: AGHT+IHNtWncJZsgjHcmNtNir/KdI4G/5BqfYa0uQvBMy6Fmmq3SGnxHumcGsWOiSUc+dkGqjYjpRg==
X-Received: by 2002:a17:907:9628:b0:b2f:e1df:1b52 with SMTP id a640c23a62f3a-b34bc67b048mr284843566b.47.1758797132787;
        Thu, 25 Sep 2025 03:45:32 -0700 (PDT)
Message-ID: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
Date: Thu, 25 Sep 2025 12:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: ERMS follow-on
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

Patch 1 is definitely intended for 4.21, to limit possible performance fallout
from the ERMS series. Patch 2 may be too intrusive to consider taking at this
point.

1: x86/AMD: avoid REP MOVSB for Zen3/4
2: x86: guard synthetic feature and bug enumerators

Jan

