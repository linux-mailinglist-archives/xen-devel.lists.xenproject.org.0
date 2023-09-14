Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637017A0546
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 15:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602277.938744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmCN-0007bo-PM; Thu, 14 Sep 2023 13:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602277.938744; Thu, 14 Sep 2023 13:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmCN-0007ZO-Mh; Thu, 14 Sep 2023 13:15:59 +0000
Received: by outflank-mailman (input) for mailman id 602277;
 Thu, 14 Sep 2023 13:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgmCM-0007Z9-86
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 13:15:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6ac1270-5300-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 15:15:56 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31f853f2f3aso1392044f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 06:15:56 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r10-20020adfdc8a000000b0031aeca90e1fsm1775995wrj.70.2023.09.14.06.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 06:15:55 -0700 (PDT)
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
X-Inumbo-ID: d6ac1270-5300-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694697356; x=1695302156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QLvdeLJFaVHjTuDoy38D6XQS7QdszFti2O5CeB4RYlA=;
        b=moghdWVaodMkolqt4agbXCmD92fvBgrC3x0EB7Te9X+qd5egEeciJ948OKLFb4Xrvp
         YxxRA2eJQHa3o7ajIlOnqSUvw56X1dnj4R+blPH+/JPXsikycPKTNJ+Dl1n8cUwmV0E4
         FeVKVSuZ7Ay/DWRgbzvCMC+pi7NdFlow+KEuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694697356; x=1695302156;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLvdeLJFaVHjTuDoy38D6XQS7QdszFti2O5CeB4RYlA=;
        b=fXfqu8M0Kvl9j+2gIyUCkphDUaw0Rf6yIySlvKoVEASoDrKHUVKoZAEO4Nz9y/83KB
         TaVQCkOWLAxs0o0RGpX7LHaVSjTq6pPi4h4qCwNlQhlFvgZusAECxjeEDYwJeduUnBy3
         Ik9GO3kDHzSBFVWh5xA3b1KpOsd3uXqMf9c9iZmaUNJUQ/7yWbHD3PzGETbUyR4Fi3iL
         McYkkrUFWh5ROdkJXICCek15affyTwgJ1BiBn6QQCAWj3b3Z4sE6GBEZB5P6luyo2T+B
         SbJeDKVC8lEPHypdf4d+uvcmiyaljSBxK3zbsLC/WSq7McPgDMT/To5zAYte6l9HipXY
         Gp2A==
X-Gm-Message-State: AOJu0YxGJBfHI6kyX/qM7hay4upm/l63cDwJsDjloOL6lDKARjATkZAZ
	wK9qvADXvWzMdT/pwx/maqfKCw==
X-Google-Smtp-Source: AGHT+IEIu7wWXsXFgmC0TpcZPq12QhcsescNI+urHKtYHceqhxoChsC2ACdOD0NH7oyI9K+8uKKgUg==
X-Received: by 2002:a05:6000:4013:b0:319:735f:92c5 with SMTP id cp19-20020a056000401300b00319735f92c5mr1634592wrb.32.1694697355769;
        Thu, 14 Sep 2023 06:15:55 -0700 (PDT)
Message-ID: <7d907488-d626-0801-3d4b-af42d00a5537@citrix.com>
Date: Thu, 14 Sep 2023 14:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 08/38] x86/cpufeatures: Add the cpu feature bit for
 FRED
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com,
 Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-9-xin3.li@intel.com>
 <d98a362d-d806-4458-9473-be5bea254db7@suse.com>
 <77ca8680-02e2-cdaa-a919-61058e2d5245@suse.com>
In-Reply-To: <77ca8680-02e2-cdaa-a919-61058e2d5245@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 7:09 am, Jan Beulich wrote:
> On 14.09.2023 08:03, Juergen Gross wrote:
>> On 14.09.23 06:47, Xin Li wrote:
>>> From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
>>>
>>> Any FRED CPU will always have the following features as its baseline:
>>>    1) LKGS, load attributes of the GS segment but the base address into
>>>       the IA32_KERNEL_GS_BASE MSR instead of the GS segment’s descriptor
>>>       cache.
>>>    2) WRMSRNS, non-serializing WRMSR for faster MSR writes.
>>>
>>> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
>>> Tested-by: Shan Kang <shan.kang@intel.com>
>>> Signed-off-by: Xin Li <xin3.li@intel.com>
>> In order to avoid having to add paravirt support for FRED I think
>> xen_init_capabilities() should gain:
>>
>> +    setup_clear_cpu_cap(X86_FEATURE_FRED);
> I don't view it as very likely that Xen would expose FRED to PV guests
> (Andrew?), at which point such a precaution may not be necessary.

PV guests are never going to see FRED (or LKGS for that matter) because
it advertises too much stuff which simply traps because the kernel is in
CPL3.

That said, the 64bit PV ABI is a whole lot closer to FRED than it is to
IDT delivery.  (Almost as if we decided 15 years ago that giving the PV
guest kernel a good stack and GSbase was the right thing to do...)

In some copious free time, I think we ought to provide a
minorly-paravirt FRED to PV guests because there are still some
improvements available as low hanging fruit.

My plan was to have a PV hypervisor leaf advertising paravirt versions
of hardware features, so a guest could see "I don't have architectural
FRED, but I do have paravirt-FRED which is as similar as we can
reasonably make it".  The same goes for a whole bunch of other features.

~Andrew

