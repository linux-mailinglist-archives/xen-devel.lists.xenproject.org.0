Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3C905058
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739139.1146087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLAw-0007Ra-A2; Wed, 12 Jun 2024 10:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739139.1146087; Wed, 12 Jun 2024 10:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLAw-0007Pf-5s; Wed, 12 Jun 2024 10:25:54 +0000
Received: by outflank-mailman (input) for mailman id 739139;
 Wed, 12 Jun 2024 10:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKT8=NO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sHLAu-0007PZ-Ei
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:25:52 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2332f224-28a6-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:25:49 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-440655e64bdso19671241cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:25:49 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4404f5bc3edsm44095061cf.54.2024.06.12.03.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 03:25:48 -0700 (PDT)
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
X-Inumbo-ID: 2332f224-28a6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718187949; x=1718792749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qtihfR1s1QsEGhiNOU25jC8KetGBf6NK2giC6XWhyZk=;
        b=vQVQZzV8x1VDehUQp/ixeokeSJqvZITFx1PAHTXGFSX+jrsiC188NSVHWz8LeTn12T
         jDOTG3m2JQeXJoS9WDxe9ax1/Egtu5qDIz4Ephb7t3de/5iosqlfD51CtGTFDS1W8Okw
         CmHLwTfH2mVtqTi8QuD9j6t39LdryT7nmT/uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718187949; x=1718792749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtihfR1s1QsEGhiNOU25jC8KetGBf6NK2giC6XWhyZk=;
        b=gaLqWGiCnih3pla7oiZXoFwb4tMVm9L6KfFSFY1n5HTuqyAwIYHsI1P5Mc6pROl7yg
         1LN/dYRNyTvi03l++JrWXR3WIiQms3vy925/bRti2tit43OWbuTOPk2kf1ve0wB+w2pA
         P38b3UGQ50zUwiy0/lo9MXOBN8O2pzQVZ1I6mOL7wPzNWWuzJzBnJgh+QLhbwIsOZkbL
         3EAUfUYEUEHiSFBAEHY64hZpgRlruOw/E2QPVbm8LE7FckudnlRh8zsimf8RpFhZeD1a
         JP2T3anTpU+9jiOMVCbDhoU91FihFiyOTC6QaCz/X5poZqf/GaEv4ePHhAWbjjgp1y9a
         YlrA==
X-Forwarded-Encrypted: i=1; AJvYcCXzi3e257jcXr6kEMEj0z9AwAQpgCw1Zu9d2YCD5Xjy2CSk1/I2Vqm+ul5uQAPetlLjBxG/ASx9S9km5HTqtqvhweHz7TYtMdpQDixO/yE=
X-Gm-Message-State: AOJu0YwjC2cHUk14c6ab+jPqhJkP9YO9jrLoqw+8/VntnWmfEwvg7Skg
	3CS+JWv7ZdzJC84bAv0xraWYgS2hwE6nVt9GYHKRJtmCpIChAvhpY3sSrptkjKY=
X-Google-Smtp-Source: AGHT+IFT4OIASyZBSKf/NhczPNuJX6UGmXkr+edVkgfwefBbDOVMFKVS2HOgGVKJvOobyRyYSq/pqA==
X-Received: by 2002:ac8:5f49:0:b0:441:2998:3e7b with SMTP id d75a77b69052e-4415abeac4bmr17517471cf.30.1718187948555;
        Wed, 12 Jun 2024 03:25:48 -0700 (PDT)
Message-ID: <1eaed8c1-981f-4c16-a2f6-e783fa43963f@citrix.com>
Date: Wed, 12 Jun 2024 11:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BlueIris error on Xen 4.17
To: Damien Thenot <damien.thenot@vates.tech>, xen-devel@lists.xenproject.org
References: <ced16fca-3b55-40a1-a7e2-ffadd9707394@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ced16fca-3b55-40a1-a7e2-ffadd9707394@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/06/2024 10:40 am, Damien Thenot wrote:
> Hello,
>
> A XCP-ng 8.3 user that use Blue Iris Software encountered a crash with 
> Xen upgraded to version 4.17.
> It worked correctly when XCP-ng 8.3 used Xen 4.13.
> It is happening on Intel Xeon E-2378 CPU @ 2.60GHz CPUs and it seems 
> more recent Intel CPUs.
> His guests are Windows with a NVIDIA GPU given to the guest.
>
> The user added:
>  > On an older box with i9-9900K CPU it does not happen and the VM works 
> as expected. Also working on an older
>  > Xeon Intel Xeon E-2146G and a E-2276G. Anything newer than that 
> however the VM will just BSOD.
>
> You can find more information in the XCP-ng forum post: 
> https://xcp-ng.org/forum/topic/8873/windows-blue-iris-xcp-ng-8-3
>
> The user tried enabling `msr-relaxed` following notes in Xen 4.15 
> documentation.
> But it didn't change the behavior and the guest still crashes.
>
> Has someone else observed such behavior?
>
> Here is a Xen dmesg output with the error that the user was able to obtain:
>
> ```
>
> (d1) [  132.028963] xen|BUGCHECK: ====>
> (d1) [  132.029008] xen|BUGCHECK: SYSTEM_SERVICE_EXCEPTION: 
> 00000000C0000096 FFFFF80418A21E27 FFFFAC009F27B900 0000000000000000
> (d1) [  132.029057] xen|BUGCHECK: EXCEPTION (FFFFF80418A21E27):
> (d1) [  132.029096] xen|BUGCHECK: - Code = 8589320F
> (d1) [  132.029134] xen|BUGCHECK: - Flags = 000000A8
> (d1) [  132.029174] xen|BUGCHECK: - Address = 8589320F008EECE9
> (d1) [  132.029214] xen|BUGCHECK: - Parameter[0] = 0F000001D9B90000
> (d1) [  132.029255] xen|BUGCHECK: - Parameter[1] = 4166300FFCE08332
> (d1) [  132.029297] xen|BUGCHECK: - Parameter[2] = 0355000002C881F7
> (d1) [  132.029338] xen|BUGCHECK: - Parameter[3] = 0002A0818B497B74
> (d1) [  132.029379] xen|BUGCHECK: - Parameter[4] = 000002A8918B4900
> (d1) [  132.029421] xen|BUGCHECK: - Parameter[5] = 8B49CA230FC0230F
> (d1) [  132.029462] xen|BUGCHECK: - Parameter[6] = 918B49000002B081
> (d1) [  132.029502] xen|BUGCHECK: - Parameter[7] = 0FD0230F000002B8
> (d1) [  132.029544] xen|BUGCHECK: - Parameter[8] = 0002C8918B49DA23
> (d1) [  132.029585] xen|BUGCHECK: - Parameter[9] = 230FF0230FC03300
> (d1) [  132.029626] xen|BUGCHECK: - Parameter[10] = 008AE22504F665FA
> (d1) [  132.029667] xen|BUGCHECK: - Parameter[11] = 00C2F76639740200
> (d1) [  132.029709] xen|BUGCHECK: - Parameter[12] = 81342405F7327403
> (d1) [  132.029753] xen|BUGCHECK: - Parameter[13] = 6626750000000200
> (d1) [  132.029794] xen|BUGCHECK: - Parameter[14] = C88303740200C2F7
> (d1) [  132.029835] xen|BUGCHECK: EXCEPTION (0D8B000000AC9589):
> (d1) [  132.029888] xen|BUGCHECK: CONTEXT (FFFFAC009F27B900):
> (d1) [  132.029925] xen|BUGCHECK: - GS = 002B
> (d1) [  132.029959] xen|BUGCHECK: - FS = 0053
> (d1) [  132.029994] xen|BUGCHECK: - ES = 002B
> (d1) [  132.030028] xen|BUGCHECK: - DS = 002B
> (d1) [  132.030056] xen|BUGCHECK: - SS = 0018
> (d1) [  132.030089] xen|BUGCHECK: - CS = 0010
> (d1) [  132.030123] xen|BUGCHECK: - EFLAGS = 00040046
> (d1) [  132.030160] xen|BUGCHECK: - RDI = 00000000000002C4
> (d1) [  132.030199] xen|BUGCHECK: - RSI = 00000000005FFA48
> (d1) [  132.030237] xen|BUGCHECK: - RBX = 00000000426ED080
> (d1) [  132.030275] xen|BUGCHECK: - RDX = 0000000000000000
> (d1) [  132.030312] xen|BUGCHECK: - RCX = 00000000000001DD
> (d1) [  132.030349] xen|BUGCHECK: - RAX = 0000000000000000
> (d1) [  132.030386] xen|BUGCHECK: - RBP = 00000000E4427520
> (d1) [  132.030424] xen|BUGCHECK: - RIP = 0000000018A21E27
> (d1) [  132.030463] xen|BUGCHECK: - RSP = 00000000E4427498
> (d1) [  132.030504] xen|BUGCHECK: - R8 = 0000000000000000
> (d1) [  132.030543] xen|BUGCHECK: - R9 = 000000009F25A000
> (d1) [  132.030580] xen|BUGCHECK: - R10 = 00000000000002C4
> (d1) [  132.030618] xen|BUGCHECK: - R11 = 0000000000000246
> (d1) [  132.030657] xen|BUGCHECK: - R12 = 0000000002CEB528
> (d1) [  132.030696] xen|BUGCHECK: - R13 = 00000000A81E3A80
> (d1) [  132.030735] xen|BUGCHECK: - R14 = 00000000000002C4
> (d1) [  132.030775] xen|BUGCHECK: - R15 = 0000000000000000
> (d1) [  132.030812] xen|BUGCHECK: STACK:
> (d1) [  132.030858] xen|BUGCHECK: 00000000E44274A0: (00000000426ED080 
> 00000000005FF898 0000000000000000 0000000000000000) ntoskrnl.exe + 
> 000000000043667A
> (d1) [  132.030935] xen|BUGCHECK: 00000000005FFA18: (00000000A74AD76E 
> 0000000000000000 00000000A81E3A80 000000000000000E) 00007FFBA9BFF4D4
> (d1) [  132.031010] xen|BUGCHECK: 00000000005FFA20: (0000000000000000 
> 00000000A81E3A80 000000000000000E 0000000000000003) 00007FFBA74AD76E
> (d1) [  132.031086] xen|BUGCHECK: 00000000005FFA28: (00000000A81E3A80 
> 000000000000000E 0000000000000003 00000000005FFB10) 0000000000000000
> (d1) [  132.031151] xen|BUGCHECK: <====
> (XEN) [  132.040828] memory_map:remove: dom1 gfn=f60c0 mfn=a3080 nr=4
> (XEN) [  132.040975] memory_map:remove: dom1 gfn=f5000 mfn=a2000 nr=1000
> (XEN) [  132.041124] memory_map:remove: dom1 gfn=e0000 mfn=4000000 nr=10000
> (XEN) [  132.041463] memory_map:remove: dom1 gfn=e8000 mfn=4008000 nr=8000
> (XEN) [  132.041905] memory_map:remove: dom1 gfn=f8000 mfn=4010000 nr=2000
> (XEN) [  132.042072] ioport_map:remove: dom1 gport=c100 mport=6000 nr=80
> ```

There was a #GP fault accessing MSR 0x1DD

You'll need to investigate how that MSR is supposed to behave on real
hardware, and see if Xen's behaviour matches or not.

~Andrew

