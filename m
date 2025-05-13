Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E21AB5034
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 11:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982713.1369061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEmDS-00047Z-7u; Tue, 13 May 2025 09:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982713.1369061; Tue, 13 May 2025 09:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEmDS-000469-5L; Tue, 13 May 2025 09:46:26 +0000
Received: by outflank-mailman (input) for mailman id 982713;
 Tue, 13 May 2025 09:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEmDR-000463-CF
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 09:46:25 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208370c2-2fdf-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 11:46:22 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad241baf856so511348666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 02:46:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2521cc56bsm337359766b.109.2025.05.13.02.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 02:46:21 -0700 (PDT)
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
X-Inumbo-ID: 208370c2-2fdf-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747129581; x=1747734381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QMpSJiPGpkMcX/gDwnPI92nY1CMxR2KUxdfji6SX404=;
        b=biJ8sgBASnnezP+unJOMIEbnaP9+zbRSF/wqe2Rls89pa0cVSm/A8Pss5tGlV/wpm9
         u/v7y16BYrvZPg7hiTXgSfgPQ+cGa4iwQ50plfK1UrYqRXDOB9+NyC+56ahZZvdU/pD/
         53GyNIdIp9N52G5GOY07DOId+jZeicKzxw3mO1TXNvDXIrU+/+iTYXBFmWGgvF/emIwb
         QKmno63gDsH37ZEotJ2KPTMrqAIwHMN6u8NGcdU5wB1DjIoX+XQ0OjF/39XcEQM8sAZE
         jdeCo2fihlUWSYPOOG5/KNrn5iMoadfqXrxq3iiE9/P7+wrURQJ9BAq7zGp7AwG0PWyi
         yqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129581; x=1747734381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMpSJiPGpkMcX/gDwnPI92nY1CMxR2KUxdfji6SX404=;
        b=W7ZQ0uVRErQvfsRMihOE6s30Abri/bCq82qt3Jug4Ls04M09/L1nbMA/e5HWQ1eSUn
         XK+n0TC9XrUttjLFdEWiQWbpaR8xxHMTpp5QH2TdIXUtU7SmXaLs/FXYbaP590/DvXyq
         cWnjZsgITTfyaw8WMsQchNbndoGj67FOCKPbCY4fwJuoYEwiQBosak1Ftlmc7DF/Zd7o
         XFLUADrG0QSCVQPSDh5aya2skqAcNR7ORgz44tsxsOF/3I2cV0nxGmRzgmbISC26/Gw0
         ewoYWKIuK0hehApmmO6iUVFAtNJKKOpNdGGOry8cMehaCJdLMMmThWnsyYBEJjnTQ/nh
         jcOg==
X-Forwarded-Encrypted: i=1; AJvYcCVoGWRMRzgMhZdEoCfIyBOnkJgP5Hp18+ssJva6EVNdXUgd4gmgNAGUdQv0JFjIVy/T5miSoOBcnxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypcIMtm+rEG+nEvRivoPEU7eJVhHFEiDydzORMtlup/IuuNBWa
	5X2CeOPA/v5PcV9NVlu/b4LcKGOOUHk21BVQO8qk62kpr4a0HYuzdyt0j3VoUg==
X-Gm-Gg: ASbGncvOEIpgapYaNRo93prtTSVE1eRu9BaN4v2Z9oGZbzir3YQ4thBcI35svlLTxkd
	hKbS6K0YOAj65b5QLzhZlA+IzUgd6u3cOcxeDKEwaGDSfvb6zRN5A6C+aukHxsaZuQ8p0RTQDZn
	ZxBab2eX/fnLep5Zx5EDZKFAtBK/50vd/N8sI5kFTs6gkvs5JNsBm7weA1/ADsRJZ7rGtICOTRC
	aUaEbiQm2oQ5dL3TeKN5cJeGq2g3j/gI26dcdQnhFvjnNjWxVYc0quSDf1MUiarD7v8c2SnCYGV
	eeJuD3wuvyaVN5vQhOeILtrJUkTyXZaS1xcmAnMkyJ7oZDwFiZkCNsQq7nhRdEy4mkvH1IUK0kG
	1RM/SbnAc2eI3V6FSgQ/HmlnGifT6bZMHyAc1
X-Google-Smtp-Source: AGHT+IGMT9hyW6I6BK/wRB6ENseb9YyICJZFA8KXTT2iOrZq8xFunCIv4/UKil4Fq3vrz8/IdEp9+Q==
X-Received: by 2002:a17:906:f5a2:b0:ad2:3e15:844 with SMTP id a640c23a62f3a-ad4d527304fmr238841666b.22.1747129581340;
        Tue, 13 May 2025 02:46:21 -0700 (PDT)
Message-ID: <573b8a77-86d1-4e02-8b22-a36fcd2c1ff6@suse.com>
Date: Tue, 13 May 2025 11:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] docs: Introduce live patch signing
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250509161846.45851-1-ross.lagerwall@citrix.com>
 <5e3a8054-53aa-490f-a60e-44ed34cbc74b@suse.com>
 <CAG7k0EpfJURuuV55XTC3Xny9STYiaGsy16VG+Ly1Wr9LvJiMpA@mail.gmail.com>
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
In-Reply-To: <CAG7k0EpfJURuuV55XTC3Xny9STYiaGsy16VG+Ly1Wr9LvJiMpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2025 11:04, Ross Lagerwall wrote:
> On Mon, May 12, 2025 at 1:19 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 09.05.2025 18:18, Ross Lagerwall wrote:
>>> --- a/docs/misc/livepatch.pandoc
>>> +++ b/docs/misc/livepatch.pandoc
>>> @@ -917,6 +917,58 @@ The normal sequence of events is to:
>>>   3. *XEN_SYSCTL_LIVEPATCH_ACTION* with *LIVEPATCH_ACTION_APPLY* to apply the patch.
>>>   4. *XEN_SYSCTL_LIVEPATCH_GET* to check the `->rc`. If in *-XEN_EAGAIN* spin. If zero exit with success.
>>>
>>> +## Signature Checking
>>> +
>>> +While loading live patches would generally be restricted to a privileged
>>> +process in dom0, in certain cases signature checking in Xen may be required.
>>> +For example, when Secure Boot is enabled live patches need to be verified
>>> +before being loaded.
>>> +
>>> +Xen live patches are ELF binaries but there is no standardized mechanism for
>>> +signing ELF binaries. One approach used by Linux is to append a signature to
>>> +the end of the binary, outside of the ELF container. While this works, it tends
>>> +to be fragile since tools that handle ELF binaries do not correctly handle the
>>> +signature. Instead, the approach taken here is to use an ELF note for the
>>> +signature.
>>> +
>>> +The ELF note section name shall be `.note.Xen.signature` with note name `Xen`
>>> +and type `0`.
>>> +
>>> +The note data shall contain a header followed by the signature data:
>>> +
>>> +    #define SIGNATURE_SUPPORTED_VERION 1
>>
>> I don't think this is a good name (leaving aside the typo); conceptually
>> multiple versions could be supported. Otoh live patches are hypervisor
>> build specific anyway, so it's hard to see why a version would be needed
>> in the first place. Alternatively should version or ...
> 
> How about LIVEPATCH_SIGNATURE_VERSION (analogous to
> LIVEPATCH_PAYLOAD_VERSION)?

Fine with me.

Jan

