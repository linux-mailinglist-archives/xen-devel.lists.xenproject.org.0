Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72497CBEFD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618160.961470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgIp-0006Zm-DD; Tue, 17 Oct 2023 09:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618160.961470; Tue, 17 Oct 2023 09:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgIp-0006Wy-AJ; Tue, 17 Oct 2023 09:23:51 +0000
Received: by outflank-mailman (input) for mailman id 618160;
 Tue, 17 Oct 2023 09:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbBI=F7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qsgIn-0006Wo-MC
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:23:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfe71b30-6cce-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 11:23:47 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99357737980so896375566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 02:23:47 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g12-20020a170906198c00b009a1a653770bsm862314ejd.87.2023.10.17.02.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 02:23:46 -0700 (PDT)
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
X-Inumbo-ID: dfe71b30-6cce-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697534627; x=1698139427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XqKkBbs+dHik9eEPedzVWercGOkFupP478hB+3xFLH8=;
        b=BbFkKYoqF2Cgu2H/GcFmrO2jt2Nemmsbijd8h76nFFn7CnTyr+Z9x5AWcsW51XIle+
         xDGYQEW0g/gkUCpcudZmlVL/itGAkoaa7E78gxqnKBKdLSn7ffxOGKiUkPNog2jBQNHS
         5pjuqWOkuV9mHDrbW6gYi9bFg8JdyzUVJD6sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534627; x=1698139427;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqKkBbs+dHik9eEPedzVWercGOkFupP478hB+3xFLH8=;
        b=d2dl+l9618BmklY75cEl/gTV5G15n5ODTO7Af1Xl6eHfQqxzPoBWwgXZ1aXQ04hT4Y
         RNmdbn+nWT/7DBHCg0Wnt0OxkoU037XBAwNf1PHV6/fOSzvCrLbxyTGhfRXkuNFgtn4e
         9zDIgrOKGMJMfti1+d2LHnFj44FPqduoLggsUYKJzJAAnZeysdWT4vv9CTPihwt1/9Hw
         fYlEAV3hPy+tQHb/cJUmGgnobAv1Wej2MnO1lCHznGoTzwUiu34XEadBbXKVrMo8xpO3
         CgOcwcwqgWQwyBSiPamPfQgmfkD9r3bQAZ29SCmf61ZdYQwn4RV+OqFK2cnAsucQykho
         0Ubw==
X-Gm-Message-State: AOJu0Yw6YhEVkGWdkpz71LSU7OkK9JshVrwUHcm7B+yAY5Vn7VHL+uPJ
	AYbyztsn7rVXRhhCMuiSMwf90g==
X-Google-Smtp-Source: AGHT+IGl9OB+aAj5ncav4VdzAmubHVBX9tu7A6l5oQk4FFd3xadOdzGgtKqCveL2ja+dfQy9nbvaLQ==
X-Received: by 2002:a17:906:dacb:b0:9ba:8ed:eab8 with SMTP id xi11-20020a170906dacb00b009ba08edeab8mr1222613ejb.45.1697534626728;
        Tue, 17 Oct 2023 02:23:46 -0700 (PDT)
Message-ID: <0afad6d3-cde3-4b72-8328-62dfc19d8f39@citrix.com>
Date: Tue, 17 Oct 2023 10:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/amd: Address AMD erratum #1485
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
 <ca7a8bad-4d6f-1da4-b48d-7acbb5db401e@suse.com>
 <ac366b7c-497f-4a9e-873d-a961970c4ad8@citrix.com> <ZS5QQ8icFa-EQD4H@macbook>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZS5QQ8icFa-EQD4H@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2023 10:13 am, Roger Pau Monné wrote:
> On Tue, Oct 17, 2023 at 08:50:45AM +0100, Andrew Cooper wrote:
>> On 17/10/2023 8:44 am, Jan Beulich wrote:
>>> On 13.10.2023 17:38, Alejandro Vallejo wrote:
>>>> Fix adapted off Linux's mailing list:
>>>>   https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u
>>> Why reference the bug report when there's a proper commit (f454b18e07f5) now?
>>> Plus in any event a short summary of the erratum would help if put right here
>>> (without needing to look up any documents or follow any links).
>> That is not public information yet.  The erratum number alone is the
>> best we can do at this juncture.
>>>> --- a/xen/arch/x86/cpu/amd.c
>>>> +++ b/xen/arch/x86/cpu/amd.c
>>>> @@ -1004,6 +1004,28 @@ static void cf_check zen2_disable_c6(void *arg)
>>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>>>  }
>>>>  
>>>> +static void amd_check_erratum_1485(void)
>>>> +{
>>>> +	uint64_t val, chickenbit = (1 << 5);
>>> Linux gives the bit a name. Any reason you don't?
>> There are multiple different names depending on where you look, and none
>> are particularly relevant here.
> Could we make chickenbit const static?

Why would we want to force something that's optimised to an instruction
immediate into a .data variable?

~Andrew

