Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900BAA21E33
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 14:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879169.1289388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8Uh-000120-GM; Wed, 29 Jan 2025 13:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879169.1289388; Wed, 29 Jan 2025 13:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td8Uh-0000z2-DJ; Wed, 29 Jan 2025 13:52:39 +0000
Received: by outflank-mailman (input) for mailman id 879169;
 Wed, 29 Jan 2025 13:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td8Uf-0000yw-Un
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 13:52:37 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b6375e7-de48-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 14:52:36 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5db689a87cbso13474134a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 05:52:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760b76acsm975243866b.113.2025.01.29.05.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 05:52:34 -0800 (PST)
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
X-Inumbo-ID: 4b6375e7-de48-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738158755; x=1738763555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8eKaDXN8nT3fRF/O7B9dAo9AcUGAfO6x7aOxDrfogQM=;
        b=N2MS66/eNBF25Gwc3el3bDG+dWwUyjrKZ96QnOlQxEMAyvi94BdFkDePqI7s8vbKTP
         KUNMXdgEsz4a9sCe3cpz8NUeUZ3vMYvjSX7SLx0AmhziToTNXIlr4AtGPIu45Dzr7LeO
         me5J8qP2bGc6uak54/xrwDxe6eaU5UCum3wiS3O4DpXHQbMSX0ILyiHOf3Z2W/chdY/o
         klCY/QwegoLTRocBoL6FLAN12sX8a6vRNKQ5t2+7+vq1X/Zspix5QZNp5vpLgbqNnz6s
         mg/tvPAkVY0ufhsQx03UKgz2Zm/V2R6TEmbVoVR5MrN9fkxAyP/4k+oDpfN7yKCZcwh7
         4fMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158755; x=1738763555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eKaDXN8nT3fRF/O7B9dAo9AcUGAfO6x7aOxDrfogQM=;
        b=UqycMrmSKtqSU/67FTchi+j0wPwKVdZtHUgaaYwsvJoJNt9QVv46CvVAqbWFU/crae
         uymgzzzEptWKejyPMl4BiN2DvgjXodKAuLBVPmtTrcrTU1G7yDakqvQRKFYPq0Ynfoq6
         B2fjLHhd6btlWin1gMbz0VYhYoUt2eDgZlC7dvlpOZHyaqadezHZLzEKnHe2j4s+i3jE
         s/l8FG3fdOcq81V2R0MvgIjeBr2/jR2q7UitQ/HF9p5P6VgYNEY8TTwVbEE7TOGu5MF8
         1E2xNxnSD2KUa4KGWJgDifEMvRK+q1B/DWQ/f3OHSJiDoBiWfD9hKcZazJkMlVvW06wc
         JT+A==
X-Forwarded-Encrypted: i=1; AJvYcCVL2Pq6VXU0FbYLHZzxk3Fc3P7Ht3CDRp6/66zAIqPf0oFj3BSisFVFJKzp8g+JPcTZh7RtqkQPVfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBhsC12dlM8uanZl1/OLrHywDY+dL5KNyW867233iLysghFmHS
	M6XTOdpfmnHMJyYP7FXhw392VeVpwwB/Yu5A5ePE8BUH+OwleEC6w/Lx72VoAGIwWjoavAJmuyU
	=
X-Gm-Gg: ASbGncskPUykFAHEQFaQRCuLVqE8LsWx7wYmkcn9yRlOPCidkjF+CgMYSSfsXmY0wTk
	32+j1DiBso4puiB9RGs0ghXZhhHhp2VYWQnPHo47SDtHI7pj8BSntP+QAOc4cT1eX5VgkCWKld5
	mPlIEZ1bJzU/6CC9cBgKwev6meJcLPvod8bdSUQRLW5+UEsCE04oXkqniP42/G7pXb9HzpkvuB1
	hIX7/aHHCC3h2cXNyCLsug+Qs5FNnmxa7SBINc2+ahOr6Btc4SDtGv2SnCXTS2S4hlMYUF4/634
	jah2jFMC3Ewx6DKemmciIlXonFLIdNSNOWMwTuB/3keT/+YMPk0LIHUBBqOFM4y8gZEAtHpTqIh
	L
X-Google-Smtp-Source: AGHT+IHcgMv7g287Jp7sQNzuwSuVOp0aN6zu3mmbpSWX1c3/xC3MYcqnhyGJQi8cda92/TBxiW4uDQ==
X-Received: by 2002:a17:907:2d0c:b0:aa6:995d:9ef1 with SMTP id a640c23a62f3a-ab6cfcb39e9mr349160266b.12.1738158754501;
        Wed, 29 Jan 2025 05:52:34 -0800 (PST)
Message-ID: <841e1793-4635-4f06-b0c9-37530215c08b@suse.com>
Date: Wed, 29 Jan 2025 14:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250129133252.GA451735@bhelgaas>
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
In-Reply-To: <20250129133252.GA451735@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.01.2025 14:32, Bjorn Helgaas wrote:
> On Wed, Jan 29, 2025 at 04:47:28AM +0100, Marek Marczykowski-Górecki wrote:
>> On Tue, Jan 28, 2025 at 09:40:18PM -0600, Bjorn Helgaas wrote:
>>> I guess the code at [2] is running in user mode and uses Linux
>>> syscalls for config access?  Is it straceable?
>>
>> Nope, it's running as the hypervisor and mediates Linux's access to the
>> hardware. In fact, Linux PV kernel (which dom0 is by default under Xen)
>> is running in ring 3...
>>
>> But I can add some more logging there.
> 
> So I guess the hypervisor performs the config access on behalf of the
> Linux PV kernel?  Obviously Linux thinks CRS/RRS SV is enabled, but I
> suppose all the lspci output is similarly based on whatever the
> hypervisor does, so how do we know the actual hardware config?

The hypervisor only intercepts config space writes; reads, particularly
when going via mmcfg, ought to be unaffected, and hence what lspci shows
should be "the actual hardware config".

Jan

