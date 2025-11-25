Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE70C847BC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 11:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171815.1496846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqHo-0000zB-Nf; Tue, 25 Nov 2025 10:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171815.1496846; Tue, 25 Nov 2025 10:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqHo-0000wm-KJ; Tue, 25 Nov 2025 10:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1171815;
 Tue, 25 Nov 2025 10:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNqHm-0000uX-Vq
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 10:28:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8149bbf1-c9e9-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 11:28:38 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so8958386a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 02:28:38 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d3bfcesm1536852566b.15.2025.11.25.02.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:28:37 -0800 (PST)
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
X-Inumbo-ID: 8149bbf1-c9e9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764066518; x=1764671318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1upGUE7YIUICVmJUED5d5whRme8CL9poQ2KbESMmuo=;
        b=ixg+ubF0L/7rd7Mbk8VZQTFtm+rDCqHsKU+XXQ7Vce4GpSYzWKw33KrXAoHq0vMW6W
         RUE7+cbeI0mN44AI27pk3TImDaCckOrGCquiQFnc8kM3WDZGrog/h962WcbSoVW1M+WI
         GcWNuKRnxWlOwsnNn6bCiV/2wZKNO1IMJwsGm4oU58s4MTw8TeB7EaJ+jDDcimLfdv/m
         vdng9ZbPaCWRPD3paZvZ+9l4Vlq8k+eq7FOBKUYJ7Nw8+/oPan9FkrJ8RkDPIKUGknbZ
         nXSXk7jPVEjfkPPJ3q9Pz7GFbyrTo0cNHzw7xohrT1XNu9u6T1YoxOsFJtdFT6SKsyl6
         +ApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066518; x=1764671318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1upGUE7YIUICVmJUED5d5whRme8CL9poQ2KbESMmuo=;
        b=rXImzzr/Xa3gkOPYGTyijj0dRyG9+3QCM6+nO8PQiju1fqcU2fwHYtyaapTcIX2Uj+
         ripJmMc39h6q8aC1ENUqH58gKgWtva/QiURD17BnAD46KVaU4sHVlXaUrHwQLyj2AXbj
         RtWU45vRENc6NLU9ymdLnkDPHolkK1IruAm8uN/T8B9LsADcM3EpPrH4TY3mHOKS27VU
         +qZCnA++xYsc+5pjzu1X71xy0SWpPK0GepqpQkl9OSwJKvz/NtNxcJ0xuAGnfqmbIBJ5
         vEEPMXSMJ8e8xR3pHN4byhI8GVvc2Wsqnf5JxWoOpuJdJ7micnh0K53odPcSMa392mTR
         39AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1CSvi6rAw1fI0luRryAAZURsJ6QLqM6SgfnxYniXDArP0KUNxzhZkoAOtVDWyr8dEXCcZWJ5b5y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOwkERfXLcrdo+kH2wsaiUvFuAvClanyb6jTjbWrD9JDREEhbJ
	F4ytz/uCCI3Ek5ffYBQ37YkzoORdpJR6PYw3LEWKbeFukf5XtVAnghia6PxbCsw/+dA=
X-Gm-Gg: ASbGncumwkaTDI+AlwqkuW0pHLW7bm+UYixfAPaqQC0IlLJgis0GA4KIVqK/rTvWklP
	72TEA/szcyy9f/QV3AXdNk9adoVpshAJTMkhBrBS6hBK+eGmBXfSkH/KP7WgSu1yyNmjo74jrDZ
	y+sHZBHxYJxe35qyTfmepBsNoaVjjiei5ohxG59s9OU1oUrrIY8BlIUSm6K8T8g+7UPII0bdl4+
	suWNEl0fl/OiGo+5n6qGHjwlHC7lbVKg6fTi1DrGFJ4qwT5LiOgnMVJi5lzeYjoEmLhU8Rn+9jd
	8OZHE2uhbACm7zaVeMu2F3Ts5OOJjkYdTvQR2A3q/SVMUyOF02oHWJOdrmS7zg+L1906QcNsEtn
	3Trhwzbudg4TvYCWGHnTHFgLDgetJylEU03wB4qcNcam1+4xXlIP1QdSR5KzVocXXsx0kFZoc7Y
	sN3qc17HGCLNvZOv8FJVhTlTqzmvMjj1iLz1TrHLRxDqQyBMMuACyM/g==
X-Google-Smtp-Source: AGHT+IF59L37GgnGAgNCiHvqRTLRI2aTvHyr6yOsdF3ewgBPJ+5ZCFL6F0XLm22Mv4gcL1oVkiKNmQ==
X-Received: by 2002:a17:906:fe0a:b0:b73:8bd4:8fb with SMTP id a640c23a62f3a-b76717322d4mr1729884566b.42.1764066517609;
        Tue, 25 Nov 2025 02:28:37 -0800 (PST)
Message-ID: <b9cd0110-4a91-4ef5-a139-2dcd45b2a0cc@linaro.org>
Date: Tue, 25 Nov 2025 11:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] blkdebug: Use error_setg_file_open() for a
 better error message
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      Could not read blkdebug config file: REASON
> 
> to
> 
>      Could not open 'FNAME': REASON
> 
> I think the exact file name is more useful to know than the file's
> purpose.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/blkdebug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


