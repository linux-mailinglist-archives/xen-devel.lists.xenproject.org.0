Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EC9E1231
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 05:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847243.1262361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIKFU-0002jc-KM; Tue, 03 Dec 2024 04:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847243.1262361; Tue, 03 Dec 2024 04:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIKFU-0002hB-HE; Tue, 03 Dec 2024 04:10:56 +0000
Received: by outflank-mailman (input) for mailman id 847243;
 Tue, 03 Dec 2024 04:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NTCP=S4=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tIKFS-0002h5-Dj
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 04:10:54 +0000
Received: from mail.zytor.com (torg.zytor.com [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 945db2ef-b12c-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 05:10:51 +0100 (CET)
Received: from [192.168.7.205] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 4B349oNB230762
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 2 Dec 2024 20:09:51 -0800
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
X-Inumbo-ID: 945db2ef-b12c-11ef-99a3-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 4B349oNB230762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024111601; t=1733198993;
	bh=sHPXdo6p8K0elhJ6IE0XDTGTz2zzDKVVPgjp1vb9is4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RDSHn9YgbMj/SGP9f25WYjgOkPbspINuSTcqQC3Xn+QMx9ncZZeAsFmGs09JHNZtN
	 6IeBjOt9WIiegvHcSkw/6rp+CwdoraHSEI8mISCic+C6z7LhE6UEIUMC9fjJJPpL3u
	 dU7IxTRlEhh73Pwh1BsbLXECyGA7jocz2SR47GxukMlxWavs5sH9kGA/dcrqNggUAA
	 /1X4gR402tHq67Cb5GPgcMexk9W8p63VCgtmRZGkc4STwEneVaK/sdxH8ZiszXd2iu
	 6dm3uvrouJ8CeaUYvDMH3hAJtNISHNOO2X0feQTYDC1eCHKD4CzX/oROXoD6QksjbP
	 j4ykXHguONibg==
Message-ID: <bc4a4095-d8bd-4d97-a623-be35ef81aad0@zytor.com>
Date: Mon, 2 Dec 2024 20:09:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] x86, lib, xenpv: Add WBNOINVD helper functions
To: Kevin Loughlin <kevinloughlin@google.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Cc: linux-kernel@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        kvm@vger.kernel.org, thomas.lendacky@amd.com, pgonda@google.com,
        sidtelang@google.com, mizhang@google.com,
        virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20241203005921.1119116-1-kevinloughlin@google.com>
 <20241203005921.1119116-2-kevinloughlin@google.com>
 <a9560e97-478d-4e03-b936-cf6f663279a4@citrix.com>
 <CAGdbjmLRA5g+Rgiq-fRbWaNqXK51+naNBi0b3goKxsN-79wpaw@mail.gmail.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <CAGdbjmLRA5g+Rgiq-fRbWaNqXK51+naNBi0b3goKxsN-79wpaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/2/2024 5:44 PM, Kevin Loughlin wrote:
> On Mon, Dec 2, 2024 at 5:28 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 03/12/2024 12:59 am, Kevin Loughlin wrote:
>>> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
>>> index d4eb9e1d61b8..c040af2d8eff 100644
>>> --- a/arch/x86/include/asm/paravirt.h
>>> +++ b/arch/x86/include/asm/paravirt.h
>>> @@ -187,6 +187,13 @@ static __always_inline void wbinvd(void)
>>>        PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
>>>   }
>>>
>>> +extern noinstr void pv_native_wbnoinvd(void);
>>> +
>>> +static __always_inline void wbnoinvd(void)
>>> +{
>>> +     PVOP_ALT_VCALL0(cpu.wbnoinvd, "wbnoinvd", ALT_NOT_XEN);
>>> +}
>>
>> Given this, ...
>>
>>> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
>>> index fec381533555..a66b708d8a1e 100644
>>> --- a/arch/x86/kernel/paravirt.c
>>> +++ b/arch/x86/kernel/paravirt.c
>>> @@ -149,6 +154,7 @@ struct paravirt_patch_template pv_ops = {
>>>        .cpu.write_cr0          = native_write_cr0,
>>>        .cpu.write_cr4          = native_write_cr4,
>>>        .cpu.wbinvd             = pv_native_wbinvd,
>>> +     .cpu.wbnoinvd           = pv_native_wbnoinvd,
>>>        .cpu.read_msr           = native_read_msr,
>>>        .cpu.write_msr          = native_write_msr,
>>>        .cpu.read_msr_safe      = native_read_msr_safe,
>>
>> this, and ...
>>
>>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
>>> index d6818c6cafda..a5c76a6f8976 100644
>>> --- a/arch/x86/xen/enlighten_pv.c
>>> +++ b/arch/x86/xen/enlighten_pv.c
>>> @@ -1162,6 +1162,7 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
>>>                .write_cr4 = xen_write_cr4,
>>>
>>>                .wbinvd = pv_native_wbinvd,
>>> +             .wbnoinvd = pv_native_wbnoinvd,
>>>
>>>                .read_msr = xen_read_msr,
>>>                .write_msr = xen_write_msr,
>>
>> this, what is the point having a paravirt hook which is wired to
>> native_wbnoinvd() in all cases?
>>
>> That just seems like overhead for overhead sake.
> 
> I'm mirroring what's done for WBINVD here, which was changed to a
> paravirt hook in 10a099405fdf ("cpuidle, xenpv: Make more PARAVIRT_XXL
> noinstr clean") in order to avoid calls out to instrumented code as
> described in the commit message in more detail. I believe a hook is
> similarly required for WBNOINVD, but please let me know if you
> disagree. Thanks!

Then the question is why we need to add WBINVD/WBNOINVD to the paravirt
hooks.

