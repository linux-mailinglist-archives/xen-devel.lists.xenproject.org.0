Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0019AA318
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 15:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824179.1238262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Etf-000168-U3; Tue, 22 Oct 2024 13:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824179.1238262; Tue, 22 Oct 2024 13:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Etf-00014P-QL; Tue, 22 Oct 2024 13:26:03 +0000
Received: by outflank-mailman (input) for mailman id 824179;
 Tue, 22 Oct 2024 13:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Etd-00014J-V2
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 13:26:02 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c086b70-9079-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 15:25:57 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a3da96a8aso880418566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 06:25:57 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9159a27bsm339463566b.211.2024.10.22.06.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 06:25:56 -0700 (PDT)
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
X-Inumbo-ID: 2c086b70-9079-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729603557; x=1730208357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ATXiZzRWbPiuw605p6sYWcYlbxwWRSQL+4+7ZCBI11M=;
        b=V1xJoe/8nS/IRe1KTV8k0sA1W7FJifR5kXGOB7a8OrQQUnofTNDC0AlTGiBSrE3oVj
         C2lBbOjkfIOow8YjP4/STJTP2VPJ4ukMLbSZNnjnwgXvI4Pbg1c019tuMutxIzMEtHXP
         3Tp0VuOcGgNFu1ost4AaTLD2V8SD+bQ5A3hMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729603557; x=1730208357;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATXiZzRWbPiuw605p6sYWcYlbxwWRSQL+4+7ZCBI11M=;
        b=bRRyUzagSFkkwGxlTjpMqWUKIQzGuQqbLhVc9M/dzY7Mps3XWKKuAB/hEyCGFETLGN
         dVmqew+GPWuu4QK4lVMIqrocSf8PHrt8O78UGgz8DR+MIE3yaNPooYrZEolFz817LTvz
         djLAkMx4Udc9QKHxOh9yJ+e3IPaCTj/BlZB6vEMMcnmJMssxc827tqZeT27aAWFz/ne0
         7yIOPYEblzaqUvwNT/9PqH7qRfg/OicYFhskkYLV87vD4XsYjyPC/C8KzDmEZ0LC+N6i
         ABqlWAwmjrIEkGQOdoMywIvYmaEg74daETTSMmaV/uFlpcwaYX4XfEaKeTWhizk/HsJZ
         UyYQ==
X-Gm-Message-State: AOJu0YzilktSdPesajOqtXDQhqdlLQx2ovx+pPagwQ+UFve/OV12Kgtw
	C757ybvITroPGGyTa4yy9Rjd3w21fbhh8/u0Bs7zeirmfgUPLU1aS3Lk9baqe58=
X-Google-Smtp-Source: AGHT+IGLpilGPNJ8X45KvD9UaJCgfCD7zfhpPnhbxY6vPrFUSw+rxbl1DUVxObyyr8/zyLGeC9W/AA==
X-Received: by 2002:a17:907:e8b:b0:a9a:7b3d:705 with SMTP id a640c23a62f3a-a9aaa669749mr265540666b.30.1729603557020;
        Tue, 22 Oct 2024 06:25:57 -0700 (PDT)
Message-ID: <60833e8e-47bd-4b75-a263-f3b88ae40b6d@citrix.com>
Date: Tue, 22 Oct 2024 14:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] CI: Add {adl,zen3p}-pvshim-* tests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
 <20241021143539.3898995-4-andrew.cooper3@citrix.com>
 <78116f34-2448-4b08-9eb3-50d70a18074e@citrix.com>
 <5d02722a-eccd-43f9-9d6e-2e845d9757d9@citrix.com>
 <alpine.DEB.2.22.394.2410211524170.3833@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2410211524170.3833@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 11:28 pm, Stefano Stabellini wrote:
> On Mon, 21 Oct 2024, Andrew Cooper wrote:
>> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
>> index 76fbafac84..95090eb12c 100755
>> --- a/automation/scripts/qubes-x86-64.sh
>> +++ b/automation/scripts/qubes-x86-64.sh
>> @@ -44,6 +45,11 @@ echo \"${passed}\"
>>  
>>          if [ "${test_variant}" = "dom0pvh-hvm" ]; then
>>              domU_type="hvm"
>> +        elif [ "${test_variant}" = "pvshim" ]; then
>> +            domU_type="pvh"
> This is not necessary since PVH is already the default. In theory, it is
> harmless, but it caused me to do a double-take because I initially
> thought I was missing something, given that PVH is expected to be the
> default at this point.

That was more fallout of refactoring.

My first attempt (which worked) involved writing a whole domU_config=
block, and then I decided that was a bad thing.

Selecting PVShim without also forcing type to PVH is a little fragile if
anyone changes the domU_type default.  I think it's cleaner to keep both
together, even if it happens to be re-selecting the default.

>> +            domU_extra_config='
>> +pvshim = 1
>> +'
> Is there a reason this cannot be:
>
>     domU_extra_config='pvshim = 1'
>
> ?
>
> These are just minor cosmetics.

Again, refactoring from before pulling out domU_type.

I'm not fussed - I can shrink this to one line.

~Andrew

