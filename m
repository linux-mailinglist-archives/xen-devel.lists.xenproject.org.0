Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEDFA12369
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872379.1283343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY27Q-0008Pe-N9; Wed, 15 Jan 2025 12:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872379.1283343; Wed, 15 Jan 2025 12:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY27Q-0008OR-Je; Wed, 15 Jan 2025 12:03:32 +0000
Received: by outflank-mailman (input) for mailman id 872379;
 Wed, 15 Jan 2025 12:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tY27P-0008OL-3D
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:03:31 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1b8e0f-d338-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:03:30 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso1257976266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 04:03:30 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab33d6254ffsm184939966b.6.2025.01.15.04.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:03:26 -0800 (PST)
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
X-Inumbo-ID: bc1b8e0f-d338-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736942609; x=1737547409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oMdOmaOjPflgDDMUOURG61lsCfEO1OuZP7nTavK4yu0=;
        b=my91PUnS26QML+KTK6GJbiZB6Z6jslPKoevvfD9XVJq8HrLrDrtiH5dXHivkSE8HpL
         UA/bOAT0nO/twK6u4mkaJn6umJsWgBAKRq7bemevDPHrNDBT6/Kw9P5e1Q6Bdk/nPro6
         ByorVB7gDzRSPmPPGvhFrjO9CCI3C+6jTUBOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942609; x=1737547409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMdOmaOjPflgDDMUOURG61lsCfEO1OuZP7nTavK4yu0=;
        b=vLxCvEfyWqmGshnlGzerkf86YTTaCJxSL28cRsNOQh/PNIrhVtV++bS0k1Rs80HGWu
         +nZDGq4pajc950TSFtGlL3UeTJUvLZvv9DlvYzX3utWATQrJQHnsIH03pEzEMUqI6wHZ
         8IOYQ/dSz6TaIDgyRcXOemrc8GRy43IxsNgSKfhTm2peMwN5sKhZ5qd9jxX3Nllny/Nm
         R6J3PjpQG2woLsJ9nAld/ozPDVHP3YU0ZQGdirQRtL0sHxl4wffvksRLwJL1DT4wBvvR
         pUFVrOmKW2rMz80qmZh+seRDHes1oqhgeSiiyR9HNtNmqzOjjHrfCFHY3uOb0hJfTznC
         IcqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPXJqsvHAfzgLE6OvIe7X9uMScJcB0/1KYT2XnMY3IGQykdnsl+pS+EA2liTixjYHWNamY1Toq7v4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/+E6AE+IBM7XQpXR0fuOLSpHMyLGwpmgBGWpQ/pXMnmd6Z36t
	xPyWNSK3SSI5ILbHfC6xigVnj1k+fr2c8kC0uAeP/pI1g27tZ6tqW1vpJTv3RnA=
X-Gm-Gg: ASbGncvfFA7SQ/cuYFMfxO8UlD/EuE7E8wykg0f32bh93NE+oN3aQiR8BLj98CrYzXp
	JKPCYnydTaEPZC815BF7kcGWUwgsunaOF2psML0N88YbWIcotRb4s7kJCWVyGZk6RoPhYTR1/Vz
	yleNI+rIOAM3ZjJ2vcK/wiw4HP+h9sQoPjnTdXanvKpX26gsicfPu1w6YUjvfXLtcaB0U81acaW
	oF22LAriXANELFHa9Esa2S4kqDllej2yQQl+pkpeR7mleMBsaopJpph6HRAxBRtpGc=
X-Google-Smtp-Source: AGHT+IEv1zTUXDm95B/lXkAxOHGy1GFixgbas1bls0SsG65khNtsFLCMNbtvt3yUTamHmir7DqLmkg==
X-Received: by 2002:a17:907:36c8:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-ab2abc92570mr2928342866b.42.1736942606745;
        Wed, 15 Jan 2025 04:03:26 -0800 (PST)
Message-ID: <b3d8bdf3-96ee-418a-b053-355138a71564@citrix.com>
Date: Wed, 15 Jan 2025 12:03:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Improve spelling of few cases in the documentation
To: Jan Beulich <jbeulich@suse.com>,
 Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <504170a4a195551072c14141e28ef554ac1cad2c.1736937491.git.bernhard.kaindl@cloud.com>
 <2658a15b-16dc-4953-97c0-94bec5283f10@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2658a15b-16dc-4953-97c0-94bec5283f10@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/01/2025 11:27 am, Jan Beulich wrote:
> On 15.01.2025 11:42, Bernhard Kaindl wrote:
>> --- a/docs/admin-guide/microcode-loading.rst
>> +++ b/docs/admin-guide/microcode-loading.rst
>> @@ -20,7 +20,7 @@ distro guidance for microcode loading.
>>  Microcode can make almost arbitrary changes to the processor, including to
>>  software visible features.  This includes removing features (e.g. the Haswell
>>  TSX errata which necessitated disabling the feature entirely), or the addition
>> -of brand new features (e.g. the Spectre v2 controls to work around speculative
>> +of brand-new features (e.g. the Spectre v2 controls to work around speculative
>>  execution vulnerabilities).
> This having been written by a native speaker, I'm uncertain of the strict need
> for a dash (also in one or two further places you touch).

Both are fine, but without a dash is more common.  I'd leave it as it was.

>
>> @@ -40,7 +40,7 @@ Xen will report during boot if it performed a microcode update::
>>    (XEN) microcode: CPU6 updated from revision 0x1a to 0x25, date = 2018-04-02
>>  
>>  The exact details printed are system and microcode specific.  After boot, the
>> -current microcode version can obtained from with dom0::
>> +current microcode version can be obtained from with dom0::
> Pretty certainly then also s/with/within/ ?

Oh, this is slightly stale now we print the BSP microcode version on
boot, and also since xen-ucode can be used to find the revision.

I'll do a larger update to this paragraph, including both fixes on this
line.

~Andrew

