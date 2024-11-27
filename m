Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076969DACD1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 19:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845043.1260540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMOH-0007VK-3x; Wed, 27 Nov 2024 18:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845043.1260540; Wed, 27 Nov 2024 18:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMOH-0007Sc-0i; Wed, 27 Nov 2024 18:03:53 +0000
Received: by outflank-mailman (input) for mailman id 845043;
 Wed, 27 Nov 2024 18:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k0uU=SW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGMOF-0007SS-Qc
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 18:03:51 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f24db905-ace9-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 19:03:46 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df1e0641fso987194e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 10:03:46 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f0ebfsm730211466b.52.2024.11.27.10.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 10:03:45 -0800 (PST)
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
X-Inumbo-ID: f24db905-ace9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyNGRiOTA1LWFjZTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzMwNjI2LjU0NzkyNSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732730626; x=1733335426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DZqwZPyMlQBYajamrm7edqHvtJ4AI1FlvEr5Qgjg2q0=;
        b=FaqNPHGM1PA9AB2iWx9Ugr9rHhb5cTi9VTizDJzb4+4sXl5ePsmHBXxY0LIRuEIbUe
         4GVKCij7iK+tK87BYWmOIbXW0w2Xz5YJimL2xJHBjlzQyn0BBaDnw3G0pOBBUvF4F/Ij
         UrROUZA+GzZcojQ8Erx9LqQbCvhntF4MlH798=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732730626; x=1733335426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZqwZPyMlQBYajamrm7edqHvtJ4AI1FlvEr5Qgjg2q0=;
        b=KXreIWfCcit4Phos0XPii4o1t+P0n97dDoSov1PH0OHhbcjUqRfVvoaDtUAFwkR8x0
         XHLLSlLmTtnfix55bss17wBmDRlW8NXrNYv0y9CerXVGrONKoF+PD+GTRRvyrKqTkYBF
         tScDJ9g0WUM+nTSC7++gj59S2ygMb1bDtDi+9VHYyf0VCC9XipV9qI3OQT+o/H2Yu6Dy
         i+sT/TzGMwhNs9bvDwB506PkbYHmlmnk+XNQtnKOG/+TQnUPbFO6XMRthMOIY0kkLEoj
         oprOJQEDB6hgj6zw53dnPkJKklkXO6NdDiofAgvrVe29UrZHIr1RWMnEZEsTZkzG6M96
         oOFg==
X-Gm-Message-State: AOJu0YyZG6xVJN0AQIyBUSgyMRSn7MBrxxQfvrIl8pqKmYj2SpHJKO8V
	mTHIdjM8CeqStVUzBw5O3VAnXlyzdzppy7vfFuw1RZOxcE/cRP88u7AJXIIspeY=
X-Gm-Gg: ASbGncv+7Q7WZKrdt8D3WqoeUQddrYC9wOn/E0+fA9iGxPQZKJSOMlmbahPmd0EqBST
	F5eVocyyo0YuPee7HSld5vDb64G1JtfaOQ8WGC8G3g7XqEoVCjsa8cJGblpPhcnVNoF4H3KAhUG
	/F/+N9ZG7x+GySgKXuQv71NevG0hMADrSNcXZ2qAky24q2YybvSniEeGxoNSSEzRfQljCHIXKaS
	dxPPUvknmDXyI2yz/zEDKQDtcSLnULCpAazvDsVBpREkTaoh5gy+veSkVk6D/8=
X-Google-Smtp-Source: AGHT+IE69zGi1v/VssdvbkvWD1TPio3LKKbst0mDUQmfiGDNhATg4ObEpIIvO2ZTxPOZoYvy4aV7EQ==
X-Received: by 2002:a05:6512:3d24:b0:53d:ab0d:b9ef with SMTP id 2adb3069b0e04-53df0106c38mr2514897e87.43.1732730625743;
        Wed, 27 Nov 2024 10:03:45 -0800 (PST)
Message-ID: <814813b6-f3f5-41eb-ba97-18e373670ef9@citrix.com>
Date: Wed, 27 Nov 2024 18:03:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Javi Merino <javi.merino@cloud.com>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <20241126205859.23090-1-andrew.cooper3@citrix.com> <Z0bajveZYoKu3qE4@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z0bajveZYoKu3qE4@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2024 8:38 am, Roger Pau Monné wrote:
> On Tue, Nov 26, 2024 at 08:58:59PM +0000, Andrew Cooper wrote:
>> The SDM instructs software to write 0 to ESR prior to reading it.  However,
>> due to an original Pentium erratum, most logic skips the write based on there
>> being more than 3 LVTs; a stand-in to identify the Pentium.
>>
>> Xen, being 64bit, doesn't need compatibility for i586 processors.
>>
>> Introduce a new apic_read_esr() helper, quoting the SDM to explain why a
>> function named apic_read_esr() has a write in it too.
>>
>> Use the new helper throughout apic.c and smpboot.c, which allows us to remove
>> some useless reads of APIC_LVR.  This in turn removes the external callers of
>> get_maxlvt(), so make it local to apic.c
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
> Just a couple of nits.

Thanks, but I'm going to intentionally defer the ancillary cleanup for
later.

Yes it should be done, but; while I'm very confident about the fix, if
it does turn out to break something then I don't want to be "was it a
different errata, or was it an integer handling change" because both
will be nasty.

~Andrew

