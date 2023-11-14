Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A47EAF73
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 12:46:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632335.986600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2rrN-0001Hh-6f; Tue, 14 Nov 2023 11:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632335.986600; Tue, 14 Nov 2023 11:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2rrN-0001Ew-3M; Tue, 14 Nov 2023 11:45:37 +0000
Received: by outflank-mailman (input) for mailman id 632335;
 Tue, 14 Nov 2023 11:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iys2=G3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r2rrL-0001Eq-O1
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 11:45:35 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 511b388a-82e3-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 12:45:32 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso8409264a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 03:45:32 -0800 (PST)
Received: from [192.168.107.1] ([31.94.60.175])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d15a000000b0053dfd3519f4sm4889822edo.22.2023.11.14.03.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 03:45:31 -0800 (PST)
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
X-Inumbo-ID: 511b388a-82e3-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699962332; x=1700567132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpQQsir1SLTTXqXdqk6uCNlz7TmVUitenDwxo2FyaZo=;
        b=j50ONaanYuXKk45RJBGqmCCiPmu1viQP63B7H/Qzdm4a3Y45BQQa44fM+IZI9bZwZo
         NIGGDpXFC4ysjUl9fxn9LM+rRZtalBvFbq1TkwF0A7wJLEdm7UftbVkxwrv3hlHLDrxn
         qCFkgiCuFc/RuXGQjdX3gaKTEqthc4o14Qeio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699962332; x=1700567132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpQQsir1SLTTXqXdqk6uCNlz7TmVUitenDwxo2FyaZo=;
        b=QAfgRMYpqpHU8XndhKDPitgPExwf7r4UWCCv0BDGaxxtC7bmyYa6gecEBt9hrF3YRF
         lfZH4nBSoXx+R3MzkLaGdfvMESuCV3e5lvcB+iOFWXKwKw0R+7v/jLymWdtQKhzvOVQ3
         fPZ0aejuRaQbQXag+A8uPupFHo72h2I1KlXXfnyCo+cqvJrbwKS9KKuSFc0fmgVkJv/b
         4eIQY/f/71iNS5xzXtEU3LKaQ332DL5dLLSFnKx5vK/AF2tRoyWrVS4coraTtSK8x1y9
         O/0YtEc4lt17zyRDholnr3MO9J3P+Cfdq9t+nILb6WMrjVTouLtpQ8Mjz1rWvKOlVmnW
         6sfg==
X-Gm-Message-State: AOJu0YwkL+VDez9S/aorP7RpfLtEd6ZG32vQd1hLaNQxeYwdaG5kTlcp
	BY792jH4OqvRGS2Ph0xB1nYPsQ==
X-Google-Smtp-Source: AGHT+IH6PRH16JDn2V+es8tw5bidcJfUuzb3Z8oeryGHOeDAazKRkrFdQFep57V3SgfDkxuvtreFTA==
X-Received: by 2002:aa7:dcc7:0:b0:53e:343a:76bf with SMTP id w7-20020aa7dcc7000000b0053e343a76bfmr7179992edu.1.1699962332172;
        Tue, 14 Nov 2023 03:45:32 -0800 (PST)
Message-ID: <f77f85f1-5205-418a-b28f-f6104894718a@citrix.com>
Date: Tue, 14 Nov 2023 11:45:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2023 10:14 am, Jan Beulich wrote:
> On 13.11.2023 18:53, Roger Pau Monné wrote:
>> On Mon, Nov 13, 2023 at 04:50:23PM +0000, Alejandro Vallejo wrote:
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> I do wonder whether we need to take any precautions with guests being
>> able to trigger an APIC reset, and thus seeing a changed LDR register
>> if the guest happens to be migrated from an older hypervisor version
>> that doesn't have this fix.  IOW: I wonder whether Xen should keep the
>> previous bogus LDR value across APIC resets for guests that have
>> already seen it.
> That earlier change deliberately fixed up any bogus values. I wonder
> whether what you suggest will do more good or more harm than going
> even farther and once again fixing up bad values in lapic_load_fixup().
> After all LDR being wrong affects vlapic_match_logical_addr()'s outcome.
> I think one of the two wants adding to the change, though.

OS software doesn't reset the APIC at runtime.

Most OS software doesn't reset the APIC ever because it was impossible
to recover from on the first two generations of APIC.  (It required a
full platform reset and model-specific logic.)

On capable APIC versions you still lose interrupts by resetting, which
is why a reset will only ever occur prior to setting up IRQs on boot. 
Linux does now reset the APIC (where possible) on boot in order to clear
out any prior state.  This also translates to resetting on kexec/etc.

A guest which does reset the APIC Is never going to care what the old
value was.  Only a test case is liable to notice, and we're clearly not
running one of those or we'd have found this bug already.

So no, I really don't think we need to keep a breakage around in the
APIC emulation forevermore to work around a theoretical-only problem. 
We should however discuss this in the commit message, just in case
someone in another 9y is trying to figure out a bug...

~Andrew

