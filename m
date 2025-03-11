Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6156A5D32F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 00:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909539.1316465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts99c-00046g-F6; Tue, 11 Mar 2025 23:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909539.1316465; Tue, 11 Mar 2025 23:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts99c-00043g-BM; Tue, 11 Mar 2025 23:36:56 +0000
Received: by outflank-mailman (input) for mailman id 909539;
 Tue, 11 Mar 2025 23:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts99a-00043Y-GK
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 23:36:54 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3dc1478-fed1-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 00:36:49 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so2067922f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 16:36:49 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bee262esm19298021f8f.0.2025.03.11.16.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 16:36:47 -0700 (PDT)
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
X-Inumbo-ID: b3dc1478-fed1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741736208; x=1742341008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QE6JOMNccSR32yRQAyfqaeBa0yFpZt5itSd6nBN2X2g=;
        b=eQS2t+akVDonDDqoP2LES+v5U7K9AIA0jIXGM2suFK6zLIfFRqTsW5oboedvBcKPbH
         dbKmO9eJ3MsuEh77BwqJzhmnvjncWS1940HNg/tXFzbYwyrGzo/NnHTE56yYRRWQEHDz
         6bozFlxbC2Huaog7ejq1ZaJUoM6jGhSM0PAdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741736208; x=1742341008;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE6JOMNccSR32yRQAyfqaeBa0yFpZt5itSd6nBN2X2g=;
        b=DM/jlH0dgHZ5C+2y1+oIN56QSLyt235jYVrmayf+K9uWiy/x1gP8A5/7MbP1GC6SrE
         EPEzbLN3kXrPpZqg9N/2Q2DFcQuvuyAF/JAyu/sF/7C0Grpigx9bPjiixlxizx4dED5J
         held7KQVwh0c8NL9AU3wulZy2jWACGT6iETVkMxZzRoeN8nGSEmL6a3LnENvsryiGEpm
         vFATDonym/pYVYCw4eDO776h/I5vOigP0E5Fczx+PpwzQPjOiAH8jhdpGvbwHNu8T8Z6
         Md1bNRZGWnLrTbjwYGwcflrvw8q1FukUtfyFRiMa3ZWkLK7PE6CctF/tCOtKv4JVOokA
         zW6g==
X-Gm-Message-State: AOJu0Yy5vRY8nt8RIKwBWaoiCXueQS8mcWQQS/NaZmSmir2YcKen26d/
	BW6BXYz0WmjcNLbqjAxzkHRLuOEIA2W7WUIkiIpEt9LGZ6gmbjJVjsO6VAnnQPcCLwnVTDdPx9w
	3
X-Gm-Gg: ASbGnct8Y7hTx7rMZvy+ILk2hu81TUnn3tAJ7r4bYveesEjSKcfH213kgZxqvQKVQPq
	iyQuLsGi1NwYeeb9YSEtEodEh1AWH8tnYWBLvz+1atNR59r2ZUGd0ZgV8kPl0AzlU1GCWCpF+vn
	IdiNm9fEWVObs42ZhOSLtESOWvJYbbTT6PxSM4nvdyp+L+YIENipMLzq4nV2mMAh05rPR+u4wcO
	doXEwLzMSdYdnn/eTgSaJmkmVwKC8RHxSnxTmZYSfOyd1gXjTKaWfgfN0faUZ8SqmQT0rNyC6y5
	GF8dsKp5KKii0xVagnQbyLfMU50J0nd5sZSGqZAhpN0FUVkVAoMmqNcBNH31eE0J9+2J8jSdovy
	AcPTlzKY0
X-Google-Smtp-Source: AGHT+IFvIZTswHu61twpGYiO2y/o9XmbZfKb8LCbQexZp9W6XVke4HgMyKmUx6iTwetCSG2wnYnkng==
X-Received: by 2002:adf:a29a:0:b0:391:3aaf:1d57 with SMTP id ffacd0b85a97d-3913aaf1e5dmr9798764f8f.18.1741736208225;
        Tue, 11 Mar 2025 16:36:48 -0700 (PDT)
Message-ID: <79b3e775-5996-4d31-80cf-0f29d56d9633@citrix.com>
Date: Tue, 11 Mar 2025 23:36:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/IDT: Fix IDT generation for INT $0x80
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250311212248.3630583-1-andrew.cooper3@citrix.com>
 <cdae37d8-a01d-412c-a48b-f4e27d7d898e@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cdae37d8-a01d-412c-a48b-f4e27d7d898e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2025 9:27 pm, Andrew Cooper wrote:
> On 11/03/2025 9:22 pm, Andrew Cooper wrote:
>> When PV is enabled, entry_int80 needs to be DPL3, not DPL0.
>>
>> This causes the XSA-259 PoC to fail with:
>>
>>   --- Xen Test Framework ---
>>   Environment: PV 64bit (Long mode 4 levels)
>>   XSA-259 PoC
>>   Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
>>   Test result: ERROR
>>
>> (Clearly I have a bug in XTF's rendering of the error code too.)

Nope, it's a QEMU bug.  Under QEMU, we get:

--- Xen Test Framework ---
Environment: PV 64bit (Long mode 4 levels)
XSA-259 PoC
(XEN) [    3.982447] *** #GP/IDT ec 00000802
(XEN) [    3.982668] *** #GP/IDT ec 00000802, not permitted
(XEN) [    3.982849] *** #GP inject ec 00000802
Error: Unexpected fault 0x800d0802, #GP[IDT[256]]
Test result: ERROR


On real hardware:

(d1) --- Xen Test Framework ---
(d1) Environment: PV 64bit (Long mode 4 levels)
(d1) XSA-259 PoC
(XEN) *** #GP/IDT ec 00000402
(XEN) *** #GP/IDT ec 00000402, not permitted
(XEN) *** #GP inject ec 00000402
(d1) Success: Not vulnerable to XSA-259
(d1) Test result: SUCCESS

So it's by chance that Luca's testing even picked up this failure.  The
XSA-259 PoC can't distinguish between the #GP INT emulation path and the
INT80 fastpath's error path which injects #GP.

~Andrew

