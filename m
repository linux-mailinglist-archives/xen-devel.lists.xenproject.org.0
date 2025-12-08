Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A903CAD098
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180399.1503585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZxZ-0005Rh-Da; Mon, 08 Dec 2025 12:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180399.1503585; Mon, 08 Dec 2025 12:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZxZ-0005PR-9a; Mon, 08 Dec 2025 12:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1180399;
 Mon, 08 Dec 2025 12:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSZxY-0005PH-4s
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:03:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e147e3aa-d42d-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 13:03:16 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e2e445dbbso2027758f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 04:03:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee66sm25162486f8f.11.2025.12.08.04.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 04:03:15 -0800 (PST)
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
X-Inumbo-ID: e147e3aa-d42d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765195396; x=1765800196; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cCn67rOq2p4N0VNzfut6dBvhV6iWLAk0xFW3EA43SVw=;
        b=MhjLPKJGtrVLNXH8XORHAvxKSz5xmxvp0RZDacNStEjbeiHgBRdmQkH+goYXA2Ao/W
         MaBAVbQ4+WPNc8kTf4Yivh9CLil2u95Jaco8gGTrCteou/ftN3CsT/D3N1I/ocPaEvFV
         qAW+cDlb+mY+Y/b/YBAhSD2uRkQQ7yVBXufyp5J8PhkoFFW0pD5NyOJU8UnJwqZ/j2Ba
         7X3zmlWPppeav9UmDrEmJ6U0EUFrzYEDe14F5H3wXYshL1TS+tD5c2v+eoWCl+sMIeDL
         JefIhz6sJzklDcJFJzjjci1IwaXaY7qYbb9l+oipaJZT73D662izWBvGn6kxoTIRX9IG
         O+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765195396; x=1765800196;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCn67rOq2p4N0VNzfut6dBvhV6iWLAk0xFW3EA43SVw=;
        b=FDQQ4vK2gYzq95mWdpxeBpUFfVJg/DmQyZJYIHISwJmotrhEYHq15ZTsThZJgaigIE
         o9GcxcE2WpibwNj0DJ74QoZjLhyiwm7Vc2LyZ1o1+0dQPd2mdpQnk3y5+Bp3L4N+0hQa
         M1yIaZ59dXN2Su1J9NaTHg6nRFz6+DZWJmuh39Q894BsVv8Ak6du7IegLOy/HGPI/kWs
         Ke/hYneeE9q0JZWV6nQ6umZSwJ7cMleIK3y7E++C2IXvDrjWXELW7MWNUC0tB7bR5pcU
         SpUmLXLgiAzKOqPTlZ2oy1cx/LVHV5TlgFIH7SX397PjXok7wKqOrkK2ef4I9Z/tHvqm
         2/6w==
X-Gm-Message-State: AOJu0YxTG6NMJshpzWEVgjV91V5wpE0hK28p0hEwzCTurUCgDW+NLv3w
	9LOJpLY/nDXbxQBe2H9SeGee4GxvbYdtlwUiW9r2fujuFNo7ExF9ZvZUeMLLYfBpc3E2wqFlGkO
	sSlo=
X-Gm-Gg: ASbGncuLKkz23oVznDknqpM/Lj1DEi19iK7b2pRx4IPDYBZujY8RlxUx9mF/sQC8LnY
	Ufs0Z5kEL9XbhOKf+xRl0lP49dc0O+qGtR8cITfIXR2Byc/LPri3YjUNDpdtFCfLJjz+6bfU0Z/
	YlcgUpIXxkYvXXtee1cv8IncEgwcl3qxLpx2cLtwBUQ0UVbAoxc7R9c0WSPcw/2xA+NYFDfJ4Jk
	pu2dlb+CmoGeAPszB1oPjQFHlPGnxFYT8Wh0Gw7d6ctpRyNO5fUz5CWOkmCC150oLEiLcqkmN6U
	f3tysu3Y0soUYBrJfAggpQggOYFD9B4NFsnYS5zJ9YZ1WelGt0Ig487COPTbFf/7a42ZpEzdjQe
	nK270g0Y1HVCvy8qZpAJY3V6iGiVRRWvxGrjJpGKeKMf7/QygmDiwYyw4KtTQ5h2K1fsJsCtPEQ
	cxD4Im4nwF/OZ0XNKZWXK7MIMLw2V3ykMtv9CUdyCouB5PXq2XTZzOWQaZrqU9JddQKhr5GiY2k
	oUCCWXN9poFKA==
X-Google-Smtp-Source: AGHT+IHaXm1ovxrhDlQGD0iYKLY0e3cc5XAOJFS395V/UdGspUsn7wbrxdfFIcS/laMuyt6XHI3BmA==
X-Received: by 2002:a05:6000:250a:b0:42b:3ad7:fdb3 with SMTP id ffacd0b85a97d-42f89f0f37amr8175723f8f.4.1765195396219;
        Mon, 08 Dec 2025 04:03:16 -0800 (PST)
Message-ID: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
Date: Mon, 8 Dec 2025 13:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] arch-specific libraries
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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

1: x86: move arch_generic_hweightl() to arch-specific library
2: x86: move / split usercopy.c to / into arch-specific library
3: Arm: actually put library code in a library

Jan

