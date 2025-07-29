Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68913B14C7D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 12:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062408.1428073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ught1-0005x6-A5; Tue, 29 Jul 2025 10:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062408.1428073; Tue, 29 Jul 2025 10:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ught1-0005ug-7I; Tue, 29 Jul 2025 10:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1062408;
 Tue, 29 Jul 2025 10:48:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ught0-0005ua-5S
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 10:48:46 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98eaa180-6c69-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 12:48:44 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so1924413f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 03:48:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2403de1b7f8sm35895275ad.34.2025.07.29.03.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 03:48:43 -0700 (PDT)
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
X-Inumbo-ID: 98eaa180-6c69-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753786124; x=1754390924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9m29Dn6JXbViKIs99WG2Nb/wB8r0BIRGHrJi1dniU98=;
        b=MBE5BOdi6+EyprTWplor7NAP3UJvO1Bpp0fgwS+xqMycwGsIPu6/3DK+Az6crnVapT
         yFyURVgT9b8UHRI+z9PTh4Op/qX9lm2NsaEaTI5D+vMMqcv+2xZHXifmxQ8TZSWwX8H5
         Xy3mJf/T4iKWYy/jU8pXftz9yf+EOdoXhO+NEMcmtNBqnyV5S/BrC34LlxMkp5PEpIQ0
         84AciBGf1ZGsSlG1sQmRpxNX1czQzQdMbQlrv1ZT6l8TJTHSBMdAQ+ZYbWlfFNaGZ5j/
         r3uiNyGL6y/X/IQq6R9n3ntdIBOphnjcMsJaZB8zD6bRTaKH/9QQla1Mo6NSGr+SGA4c
         mvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786124; x=1754390924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m29Dn6JXbViKIs99WG2Nb/wB8r0BIRGHrJi1dniU98=;
        b=I5xQ6Z9Oj8j2jPe9vWtZRc4aSQE7XmP75TjDQAU6+hDxaMI1WiCk6SPjxnlwd6J9lB
         sbsZ1UPUou5JQr+/+hrR9mS1YsLx+xHWGmCHBTyV1/LO4seX9DIb5/I066jYaEXcuVDS
         +MPhwaRh34RZ0h/9Q/iWwBYnsj1jAW5VKCkPhD1DSJFIeWo/b4g6znO3+dcQcqnv3O74
         fQSuhW8VZxHLA1bm+VSnloqd6FZ/RWgfErs4qsUk1jebkaP4gFvu1J0JFLOE7nL1v89+
         mSf65zmPONyaNDmD/4/5o0DsPuEiSFFj/cOeKPxrVZMc6hYyTV54X6NSSVsB0EYK4EX1
         sFDw==
X-Forwarded-Encrypted: i=1; AJvYcCVkbQ9TS1hdWkTlACrYRkiB2Ov1/hVn0T7VCGpvWZ9vP4bfTgVw1ErVG371lZORCt4JvPBAHBhfjt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv4w+KfA+EJs4lbd+FXB+GmixKBgiS4X5UqAmd+TYQJQb2+9tp
	DVbDmwhT64iZggcZ+B1Hx4MBZE+Lu4Ro3F8llaVOvELlVN9iYYJFK63u13NPplIqaw==
X-Gm-Gg: ASbGncuz9qAqhiPIHao4Yf3nw8L4xgyXMgbMwDBE1eHCpXEMVIAo3Wa3B3yq+pMVVRm
	wShZDGEpMwrNIEafIRy1tPi7gkP1qq+xks47/3ck8tOWZro/W0BSLdDSbu81Kra7G6l9z+sLJt+
	QXKVtFNAKkkJjpFVL9wKlznhPvGD0rkRZpmAa+wplsKQU/dnSdFMzQ8hcpUkFUD9NZxOi/KiGSy
	Q5gS3pKydqYUf458Eto759sN13dx95IgiH7spk0MQ4TZpM2vo/LuyqGbE+ubseWzPLZkliHz4Gl
	1dKw0EETDWr9qRP/1CscoAEWVx77/e2NPofycMkFhMT0c0+tn9VqK5hx1ZeyXQpzzAB0eLEiJy2
	htM4wvcWs9JHSA2W3ueFDhziLOy+ro9j9Xw9faRCC94ymefDbBn4Q2ssbaQ6435GSauRQ4RFURB
	VEwpPxeGI=
X-Google-Smtp-Source: AGHT+IH57CKroCmQNoRgiT5HRiuPxKmY8aDVk4cwV4zUHOAGaLtX0n7REYn8gQuUixwyurv0n5VvRw==
X-Received: by 2002:a05:6000:22c3:b0:3a6:d255:7eda with SMTP id ffacd0b85a97d-3b776645336mr10879620f8f.28.1753786123719;
        Tue, 29 Jul 2025 03:48:43 -0700 (PDT)
Message-ID: <f58ad086-33e4-45ca-b320-60a8d9e7841e@suse.com>
Date: Tue, 29 Jul 2025 12:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config: update Mini-OS commit id
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250729104600.592-1-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250729104600.592-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 12:46, Juergen Gross wrote:
> Use the newest Mini-OS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


