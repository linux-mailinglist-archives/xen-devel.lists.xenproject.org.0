Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6EC20EE6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153788.1484054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUaM-0000nr-9A; Thu, 30 Oct 2025 15:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153788.1484054; Thu, 30 Oct 2025 15:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUaM-0000lg-6P; Thu, 30 Oct 2025 15:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1153788;
 Thu, 30 Oct 2025 15:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEUaK-0000lZ-SW
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:29:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a09684-b5a5-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 16:29:00 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so11929895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 08:29:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289b0dbesm46140025e9.5.2025.10.30.08.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:28:59 -0700 (PDT)
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
X-Inumbo-ID: 28a09684-b5a5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761838140; x=1762442940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CZOA5DB5CaYZMRdRBphTt0LIFeNChazp6jCWj+UrrlE=;
        b=Tey1wgc3MMECPAVqG2EhTXzZQenkBKigRd/D2Rsc4fk1NKNZj0g/C+4aPH2Kqbi/IA
         U+62dVRpVDCCA/AYZc6y8idvQkw+jHXHTJlbbA/TGdCO/kbaeTAkdEPjW0BINuRbadCt
         EJSjDCNPaIE+Y5wcY/evcI3AFAD2ZSVr/0j7tVGCadynDzHRdG5SNSWqW+rXECGk28tn
         ieCnD4sfZyN33DC9MNyicawfIQSP3KwA7+6iZMWR4geVNcBj0TTziri9wD2JAQg4SlDq
         KtzN3p/Pzvagq3njtQbNp1koLJWgA/LP0IpRx4HAV+AMdigWr8aa7RZzbiKnde6I8wmg
         /0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838140; x=1762442940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZOA5DB5CaYZMRdRBphTt0LIFeNChazp6jCWj+UrrlE=;
        b=L5F3V46/8Z+KwDS92s3OuehcE0LFuhSWyfG6cvp0GsNPoOg1nAJp0dHTVkU78vnGhT
         K0cMaa0KMVfQVK3EX+e/yLFWCq07pFbcyuP++LfFgKByiN+wZn1GktBO3UxL1M44ojlV
         4AscpAOH1fA25lEUtap/khf6ZLbPXtetM7WwsVfMIOmfufp/NE/vMB/80TH1HnZuLKHM
         VCZijSPYuDM4p09OoZh86ZI45HX/FMzt3malRBnPkl3/YWQHlsz36CkLG+EAWeeO7s6B
         6Re17F9mnh9NRtI4+cLkrTlKlg4kfHanD8gW87ZMyFFED1X2WAKMSxtMiZnmy+nip4QG
         HCDA==
X-Gm-Message-State: AOJu0YwtuNg0f+p6a1I4WJyrRZhXAWjSY/KhE9gSNwGVmDY+J/h/Lpnc
	gna4RDUHuHGQE030bvxBYBeq/uRRuQQN0dGhoLvd9SCAdMhK/k6fLW3CLDqBHoKRng==
X-Gm-Gg: ASbGncsfGP+WBbiHgibHZGggMWQXlB7UdtlEDhYYBDluPeHrxZqI3LDJ6qz6SeprC9i
	JJXn/HMdfgnHXPCJKYmrnj0EM84dpw4ltZsw/fW2ViLS3t/tcvXntpPo9255rDZ/lcg4WZeadvi
	Gpqt33/83yQqPlK/Wvr9OqkjbXZQSCefGhoUtihL+A5PzSzFwP0Ubl/SztfD8oEd0cbGFYzFCVT
	QkqOEMjQ7EN1FCPd0r25P6oW9/wPPnLwi+lafcMp9MFBinPXV5bXieFS8/K1/lF6RXuJzs7F+Ka
	ihhGyrri83OpS5eFPylGsASpMhfNjXd9+oLWhRo0mLxaNM71Pwl2ZtTkH6nKZ3BiLUd2WwLMZl8
	nIpBri3iSsomrCbQ01Q5ztLbsQA1NnprC9mP3LO3sXKiJ2S57ltpW9xOnykZy2XL5TLm48jP1cu
	ZnO8uW2n9YGuFerFYr8QSPdKOS2d5mXVddD1MNnr0cCEztyTWbmVJv1BkPk3CH
X-Google-Smtp-Source: AGHT+IGml2iWga7q9/8dIUbdQ38xYYG8uEtd8/YbYL3JbXtjvkmMdwwUNpshGoLd0yFjhp4EyONk3Q==
X-Received: by 2002:a05:600c:8b6f:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-477307e3ec4mr969645e9.17.1761838139854;
        Thu, 30 Oct 2025 08:28:59 -0700 (PDT)
Message-ID: <8b4b5561-af7f-4917-aea1-4ed65a0f3023@suse.com>
Date: Thu, 30 Oct 2025 16:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64
 maintainer
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, shawn <shawn@anastas.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com>
 <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop>
 <35b2e61b-d1c1-47c0-90e2-7efa1f45243f@suse.com>
 <1788041210.6163.1761836977190.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <1788041210.6163.1761836977190.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2025 16:09, Timothy Pearson wrote:
> ----- Original Message -----
>> From: "Jan Beulich" <jbeulich@suse.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> 
>> On 29.10.2025 20:38, Stefano Stabellini wrote:
>>> On Wed, 29 Oct 2025, Timothy Pearson wrote:
>>>> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
>>>> reviewer.
>>>>
>>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>> ---
>>>>  MAINTAINERS | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index ecd3f40df8..c8764a8c5f 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
>>>>  F:	xen/include/acpi/cpufreq/
>>>>  
>>>>  PPC64
>>>> -M:	Shawn Anastasio <sanastasio@raptorengineering.com>
>>>> +M:	Timothy Pearson <tpearson@raptorengineering.com>
>>>>  F:	xen/arch/ppc/
>>>
>>> The "R" letter is used for reviewers. The change can be done while
>>> committing.
>>
>> And with that change:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Just to mention: I can't see what you used as basis to compose the Cc list.
>> George's
>> email address has been out of use for quite a while, and he isn't with the
>> project
>> anymore. Wei had turned to other activities yet longer ago. And with Shawn
>> having
>> left Raptor (as you indicated), I expect his email address there would now also
>> bounce. I have, therefore, heavily edited the Cc list of this reply.
> 
> I had pulled the CC list from the "Rest" in the MAINTAINERS file in the root of the GIT tree.  Should I have been looking elsewhere?

That's the right place, but did you perhaps look at a (very) stale version?

Jan

