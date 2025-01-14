Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3567CA105F2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871280.1282313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfS9-0002NH-Iw; Tue, 14 Jan 2025 11:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871280.1282313; Tue, 14 Jan 2025 11:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXfS9-0002Lb-FK; Tue, 14 Jan 2025 11:51:25 +0000
Received: by outflank-mailman (input) for mailman id 871280;
 Tue, 14 Jan 2025 11:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXfS7-0002LV-Jz
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:51:23 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00d9f9e-d26d-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:51:22 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54024aa9febso4708520e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:51:22 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be53e86sm1695744e87.62.2025.01.14.03.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:51:21 -0800 (PST)
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
X-Inumbo-ID: e00d9f9e-d26d-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736855482; x=1737460282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlCVUO5UPH5SMzxPMXud7BtfaNUcpBzGyRU6JqESZCs=;
        b=McPaEp49sfVuRwSnXFegyHSH85RQrUS+AxYCNFUZ6ulCDyGQ7Z+hMSdLGOErar/tHw
         gP+H+J0+NtscmZzsPxvyT0hfSHQLANPZ25QkctKTxgAkx16YomFOmPhomU+4FMFDSEYe
         fKue5ZUn17nPvQ7DKdydCZbqlmuUNO9gG3YHtAMCtDu1k2mfJ923T7INEK2o1O8hvpyL
         DTYXLTHnmx+OJma37C64Xjg8staPFbkRFyhrt4J2j1YGfs5dG1WBGJMOBJEDWAcocdeG
         BmzHrbOEYwnV6zo911SgMRxLAevnoIeUKgMSQNnIbEy+mPBNEclRgFz7jZLn53AFCPx8
         6meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855482; x=1737460282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlCVUO5UPH5SMzxPMXud7BtfaNUcpBzGyRU6JqESZCs=;
        b=iqda0ze5v8EK+mfjGVuIhAmPLuT84gohZchihW4wwMzs5VLExeWxmQm3Ml6WBo+Vji
         OwQlvCVtSSvtl/lsn3EYUKpmh6MLu3cSnrWjGxbYE5+C/031w2flFg6jEEd7qM3XldV+
         A11t+9wLuVFTpfPtJYSIDJVYqTh+/NaQwl8kcXtS1juc9gBO49BQDpxRBEOH7/CK+2Ol
         rsehu2UrqowSaEkAC0Iee+0YkHh/P/VnBZXfdnmOLhSUDp9wmmFKghoNeLL1RdEm9jHk
         b1oGPMrOUK9hzS/H1BxC2jd4+PRwGJkNxohGXmDIHLtbFS+J8do6+z/dB+QOFiIap2DP
         4Ubw==
X-Gm-Message-State: AOJu0YxX5qn0iZKkn1y52PDHsBowwKy+vVSH6R5Omi/xdjU2pwdcWS/1
	RGpGx/uQMV/mgmd1Jcj37LXRB5qFbBCmBKSu/ogDaUWQAav806JGvZebKw==
X-Gm-Gg: ASbGncv9K90fDg9+PFDLaeRM+sBGlHUNrcIVuJU8rSLSj4FPE3yVEi4eBIcFicupzJA
	MPzKwvI7wlMtTsMpnDtIBuHZgh0GhnjW0M95/kvOupyPY0XWvDJWcDirl8VS1Cm9h4xOszNzeE5
	JLu1/6lPds1y+j1kBk4DNjex1J5wVUy6MsD2C43WyVW/P4mgLi7IfKzraUjJV4yKK66iTQAHoZF
	3txVGjP82lPoKy31g/EBzP4a45XZ7ZXtFwxk+s73hO4nvFWWrIQxdftwXiwj33bxKRuYA==
X-Google-Smtp-Source: AGHT+IELxc2eP8I67QmpikBV7z9BRyJ/WqiixOQhwKv4VmY88ClXjqLLlWEaMQof7T/+mbWnNNJbYA==
X-Received: by 2002:a05:6512:318d:b0:540:2223:9b0b with SMTP id 2adb3069b0e04-54284801dbemr7505398e87.35.1736855481572;
        Tue, 14 Jan 2025 03:51:21 -0800 (PST)
Message-ID: <19dd80e1-deb2-45fa-93e1-3b5952a8ff80@gmail.com>
Date: Tue, 14 Jan 2025 12:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] automation/eclair: make Misra rule 20.7 blocking
 for x86 also
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-3-roger.pau@citrix.com> <Z4ZI-WfUv73iQLI1@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z4ZI-WfUv73iQLI1@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 1/14/25 12:22 PM, Roger Pau Monné wrote:
> Hello Oleksii,
>
> This is in principle ready to go in now (I'm currently running a
> private Eclair scan to ensure the patch is still OK against current
> staging).  I would like to ask for a release Ack.

R-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


>
> Thanks, Roger.
>
> On Tue, Nov 26, 2024 at 10:35:08AM +0100, Roger Pau Monne wrote:
>> There are no violations left, make the rule globally blocking for both x86 and
>> ARM.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>>   automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> index 755ea3271fc9..cb4e233e838d 100644
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -80,6 +80,7 @@ MC3R1.R20.2||
>>   MC3R1.R20.3||
>>   MC3R1.R20.4||
>>   MC3R1.R20.6||
>> +MC3R1.R20.7||
>>   MC3R1.R20.9||
>>   MC3R1.R20.11||
>>   MC3R1.R20.12||
>> @@ -116,7 +117,7 @@ if(string_equal(target,"x86_64"),
>>   )
>>   
>>   if(string_equal(target,"arm64"),
>> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
>> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6"})
>>   )
>>   
>>   -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
>> -- 
>> 2.46.0
>>

