Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCFAD6C7A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012714.1391217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeTQ-0007Ml-2W; Thu, 12 Jun 2025 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012714.1391217; Thu, 12 Jun 2025 09:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPeTP-0007KI-V2; Thu, 12 Jun 2025 09:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1012714;
 Thu, 12 Jun 2025 09:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPeTO-0007KC-Sa
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:43:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be139a1c-4771-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:43:49 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so829474f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 02:43:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e706d7csm9791305ad.190.2025.06.12.02.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:43:48 -0700 (PDT)
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
X-Inumbo-ID: be139a1c-4771-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749721429; x=1750326229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r82Bc6hEDA4FmTQLSbP9SNcLWdrlNLy3fOXKt2SKpXM=;
        b=aFyveRTjuizmPD+cE1uLuc75KTf+VCl8ndiDAGWaC4y83shKezuYzpjMP2Eqj0YDqE
         Q9fbmeVdlBmHaLtuQJc1Ydp2o4FhUjJtinjf4XFPegPQO5yPmQTc+U7NOVJCw24wvoz2
         RTCiFfpKGG6KVjvE+cdfXaTXIvDs6Ra6J0NMPm6typMqBP2zL+GjgssZgiPavWdNO29g
         d1/PNDqnOKwyseH6EUvqNQON8kc4WsX/GgOhTwfIFsGVlnKENsV/HI//GLP7Iz08B4GA
         /KUO3/KSd5EvoMOeP6PwFiN7guKuQQ8+y/zBNqrUI+JISDmitf2mqWT0/LLC/qGagvKL
         LY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721429; x=1750326229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r82Bc6hEDA4FmTQLSbP9SNcLWdrlNLy3fOXKt2SKpXM=;
        b=YbXaXWqFfEoF6cqSLnfOO9EsYt1rOzVKUPXlLOt9UdR2Yrl1TFBcQlHtjV30c6QGv0
         FzbUJof06Pl5c5Kp05JYBCthL8PMJzMmW+D7EJfrj3GDfwPo1p8mAmCN/peFY2OcGAHx
         9kchK162X5cGXNcLvz4TpHi1769+Er7+0A4+ILSgeac0rx1IrQOcL/I3rq4I+M+WVDkV
         VEXOts7ABOEIr8DDdwe32Iz4Ipdqq2e/uOyNr6h1CK/ousC5fBBPpnQ+L8txNKkQv7ci
         DPzkH9nnFql9sYrHJKSYeM9tPv11ZUZ8oPzC9yMgXVkKNn3+kI9xY6l+JE5Ap47bWU19
         MMRA==
X-Gm-Message-State: AOJu0YzVe2LFL+UjKr/N7dt8iCPsjshsCDQeFeEwZexBlGDH1tfndY+l
	awxg59LYQkd0tJWXdHanQ/Eq+ycQdcQLP4/cuGvwgVRae6Vme+EBRFhP3AYXe3RQyw==
X-Gm-Gg: ASbGncsxMAgiP2CfmD3+F/ADi53PwqRRn6907e2N2kcYcY+/QNnRmhmZLrbRVFMJYHm
	P2NqyNHVCWvbg1Sw8H81FjNrVz3Ev4GEaRNIoaD7+X/Bm9Tf9K4sghiY36Xhqp/hNJnRAwYX/NV
	UFUtsitBl2Wt6i9xcC+wMhB96w/dp4orVn7yDrEM/BDJLAxZOtLDNyd8LKHPmJq2zrQCJMh2eT7
	Q2RRldi7P1D8kC5vzFbtZVJ8RXVVx+IfgcXQB7Tx1N3j0I+UZ2vtrkE2PYHROfX9f70kvSipJ7r
	ccdoTjX3F/IYXHpF2+RAo4ZVT/d+xXEqCKSm2KDdX0TJBsIP6i9FqCt1ckt3nZO1MA2bbb9Zgoq
	Fm5w1NDEr4WA/msRfmgsFtb3SOBdhnixevpapzSmqesEDspg=
X-Google-Smtp-Source: AGHT+IGpJP0QUJbAJInA4NkGyw10yOd3Hd1icqD86ckGaBr10nycu5otnF51IqKPcxRjPp/d9E9g8Q==
X-Received: by 2002:a05:6000:1a8e:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a5612db2admr2021951f8f.36.1749721428932;
        Thu, 12 Jun 2025 02:43:48 -0700 (PDT)
Message-ID: <d5d4dcc4-835f-47a4-921d-4f292ab28655@suse.com>
Date: Thu, 12 Jun 2025 11:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Trammell Hudson <hudson@trmm.net>,
 Ross Lagerwall <ross.lagerwall@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <aEqGzm1zdccj-drZ@mail-itl>
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
In-Reply-To: <aEqGzm1zdccj-drZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 09:50, Marek Marczykowski-Górecki wrote:
> On Thu, Jun 12, 2025 at 12:58:51AM +0100, Andrew Cooper wrote:
>> Several things are hard to express and want further discussion.  Suggestions
>> welcome:
>>
>> 1) Content of CONFIG_CMDLINE and the various CONFIG_*_DEFAULT options.  Xen is
>> not going to be issuing XSAs for "downstream chose an unsafe configuration,
>> then signed and deployed the result", yet Xen probably should be on the hook
>> for bad "default ..." settings in Kconfig.
> 
> Should there be some guidelines what values are/aren't safe for UEFI SB?
> I don't think there can be a simple list, for example some things may
> depend on other settings and/or whether UKI is involved. But some
> comment about relation to UEFI SB (in Kconfig help?) would be useful.
> As for CONFIG_CMDLINE, IIUC the current implementation does cover it too
> (as in, lockdown mode will filter built-in cmdline too).

For command line options I think the doc ought to include some form of
annotation, at least in one direction (permitted or not permitted).

For Kconfig it's less clear to me what an "insecure default" could be.

Jan

