Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB16A0687
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500194.771455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV96n-0000xS-HY; Thu, 23 Feb 2023 10:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500194.771455; Thu, 23 Feb 2023 10:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV96n-0000uX-Ee; Thu, 23 Feb 2023 10:45:53 +0000
Received: by outflank-mailman (input) for mailman id 500194;
 Thu, 23 Feb 2023 10:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPya=6T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pV96m-0000uR-8y
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:45:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d7b3a59-b367-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 11:45:51 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id ec43so39972765edb.8
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 02:45:51 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.233])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a17090629cf00b008caaae1f1e1sm5857318eje.110.2023.02.23.02.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:45:50 -0800 (PST)
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
X-Inumbo-ID: 3d7b3a59-b367-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvjCARKLUcPKfLYYHrxGWbRWCyOn7rquXvabIExVMuQ=;
        b=HBhmfSTbPuTt58aiEkqpzet9aUHpvdzyDmtMbatfaUo4iFcKq7BaMWHhUHNulOXsuw
         V116rKGGZE5eyeUDlOFYzOWsbdrnS2Kn03pGpT/0GTPuTV/a80k5cUQzqDQwF0grpnss
         f/rhOapCAVp6VEgHwpAl1s4jk6dJyVMLSC7Z5U9Rj8GN8T0o05QE1JGv2JFftMDK2DUf
         3uYxyuioXrAT2KGoWDW+3qLobbuTF2rVe1EAH8vSmqiF3JX9351vjvYJ1PwlSGM6pzSg
         l9o2rxZ6u4Q5e4gV8OphSwNGGwS88edVVqiGLd5gbodv7xVuKoI4DU84JQkRDn21ysef
         4hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvjCARKLUcPKfLYYHrxGWbRWCyOn7rquXvabIExVMuQ=;
        b=nsa/NyLVeavrhEmwC+Bigntx+W9mBOHoXNAPpt2rtlmPr1OxanITT9zGo1kIBHB3+d
         O3BASktadM4mUeh+OBKNfCMqcw/slb975St2Ji1KR45fHuKsaF3Zyd2qJBnMKd8TG7qI
         0xhEC4YjBH8Z76tvbF4Wsp+R9sUbtrmKKTSSgHpgRbswlZMGucU5eKVksqt/Jk4ZRT6k
         DE0T6c15khbd0MGV08f+w3i9Adx7rpsH8E0a5IyytOuGdF2n0p+Vaj5a68KLuIBy+5jl
         xzB2twZvqTd0bax2g9zhSZpERcEjs3tp25MY9+mKczdhm24olcWThCYHqfnHDzJTTpeP
         3H8Q==
X-Gm-Message-State: AO0yUKVSSy/uAOeGvqr8662Xjlg6ZyX86upKswtaYOnc+Hglno9ayksh
	72cxGf1ctIArSZvZTBOk62c=
X-Google-Smtp-Source: AK7set/ZMz6txW9hP/Bfwq6oca4d/fM2+CwqA0vZUqy+c3uMA+Q+X8nvwPIK3MgiVcJFX9gFFvHjeA==
X-Received: by 2002:a17:907:8c07:b0:8e9:65b5:aa10 with SMTP id ta7-20020a1709078c0700b008e965b5aa10mr5250335ejc.28.1677149150966;
        Thu, 23 Feb 2023 02:45:50 -0800 (PST)
Message-ID: <19079d03-748a-fe5b-9941-84ede2bf8554@gmail.com>
Date: Thu, 23 Feb 2023 12:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/9] x86/vmx: reduce scope of GAS_VMX_OP definition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-6-burzalodowa@gmail.com>
 <f9841c7d-c9aa-7754-1a90-4a069c94f3c2@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <f9841c7d-c9aa-7754-1a90-4a069c94f3c2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/23/23 12:31, Jan Beulich wrote:
> On 22.02.2023 13:00, Xenia Ragiadakou wrote:
>> Since GAS_VMX_OP is used only by vm{read,write}_safe, move its definition
>> just above those functions and undefine it after use.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> This can easily be done as part of the next patch, with less code churn
> overall.

Sure. I ve spotted a bug anyway in the next patch (I should not have 
deleted the #include <asm/hvm/vmx/vmcs.h>) so I will squeeze them in v3.

> 
> Jan

-- 
Xenia

