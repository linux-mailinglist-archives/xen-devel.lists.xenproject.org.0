Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BBC8BE5F5
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718227.1120806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lqn-00018o-UC; Tue, 07 May 2024 14:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718227.1120806; Tue, 07 May 2024 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Lqn-00017H-RT; Tue, 07 May 2024 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 718227;
 Tue, 07 May 2024 14:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4Lqm-00017B-LQ
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:31:24 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ace0fc-0c7e-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 16:31:22 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-23f55e2e908so1342863fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 07:31:22 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ez7-20020a05622a4c8700b0043496744c5dsm6510755qtb.52.2024.05.07.07.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 07:31:21 -0700 (PDT)
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
X-Inumbo-ID: 79ace0fc-0c7e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715092281; x=1715697081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j0BTVGvHEKyiBbxz3RZmU5S9st2y1z9qXUwG+d5JHcE=;
        b=tPK52cHsNEudlPHtFREIqfgq1mNyWQYZBvSpkyfgbrTFq59hRi6yKmY3jqsQ/a6idZ
         l5umflP0LO2kCvlwZdtsfQOejyhWWBSsHI9vMPNpGEiA0pt/gSYuYYTpV87VVYKWxOsd
         K/ha3W6bv9pYy+2ECNEbbsysPciE80XyaXbfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092281; x=1715697081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0BTVGvHEKyiBbxz3RZmU5S9st2y1z9qXUwG+d5JHcE=;
        b=WMKnc+izrpfiH9TCk3jGAqRxIvRyThUo2e09VN1PA07Xaq0OQBGyPosMlrktGxc/8Y
         L5YuRBR6Nd90CGcaXKex9JHzNKHhUzdp09bzpoEA9ypngeu6CxgzrM6gwaeW+MQp9SN4
         6aypG2JR6M9rxhYBfOvUM8isEDzvOA8hpRt7CW7jCaYIPzbJFqknvY+S/udSFsgVIRin
         BFWE66CIaWt0+q9nvDQS8evlG6brT5m8J7yyp0LDKq4dQQXueY21lwi1g2e5ftn8nvZM
         yM3KTPvO0ffPTS2acdmxReR+brAtMm3FpjbATXWXyj0zczT0ScSg2vHpphHl+gzrwxzg
         JQvg==
X-Gm-Message-State: AOJu0Yws9axnc2pPKlu7hkR4N6li3T6MpLjUdATSK4NL+imhlNyiZqcG
	I8vev6G55ZEDMIVUv8YGlHfN3OpBlOw5w6B8S10ARUf6FnGHLEpDvnSDxLuITSE=
X-Google-Smtp-Source: AGHT+IHkP42kZ17vHRLPYZ1ANwuxu48Jg7HK/BVc4n6dZ2+mqkyEUiMxMtAWcmhCUh4l06m+Iw6xfg==
X-Received: by 2002:a05:6870:2b0a:b0:229:e6c6:1f13 with SMTP id ld10-20020a0568702b0a00b00229e6c61f13mr15348545oab.14.1715092281354;
        Tue, 07 May 2024 07:31:21 -0700 (PDT)
Message-ID: <f0272d79-7c59-42b2-b185-2aaf84f1b196@citrix.com>
Date: Tue, 7 May 2024 15:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpu-policy: Fix migration from Ice Lake to Cascade
 Lake
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
 <20240507134540.1714274-1-andrew.cooper3@citrix.com>
 <Zjo5iwmEvD3RWtsx@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zjo5iwmEvD3RWtsx@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 3:24 pm, Roger Pau Monné wrote:
> On Tue, May 07, 2024 at 02:45:40PM +0100, Andrew Cooper wrote:
>> Ever since Xen 4.14, there has been a latent bug with migration.
>>
>> While some toolstacks can level the features properly, they don't shink
>> feat.max_subleaf when all features have been dropped.  This is because
>> we *still* have not completed the toolstack side work for full CPU Policy
>> objects.
>>
>> As a consequence, even when properly feature levelled, VMs can't migrate
>> "backwards" across hardware which reduces feat.max_subleaf.  One such example
>> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
>>
>> Extend the max policies feat.max_subleaf to the hightest number Xen knows
>> about, but leave the default policies matching the host.  This will allow VMs
>> with a higher feat.max_subleaf than strictly necessary to migrate in.
>>
>> Eventually we'll manage to teach the toolstack how to avoid creating such VMs
>> in the first place, but there's still more work to do there.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
> Even if we have just found one glitch with PSFD and Ice Lake vs
> Cascade Lack, wouldn't it be safer to always extend the max policies
> max leafs and subleafs to match the known array sizes?

This is the final max leaf (containing feature information) to gain
custom handling, I think?

~Andrew

