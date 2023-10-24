Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735537D57C7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 18:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622166.969441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvK5M-0005eZ-Pt; Tue, 24 Oct 2023 16:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622166.969441; Tue, 24 Oct 2023 16:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvK5M-0005bg-Ld; Tue, 24 Oct 2023 16:16:52 +0000
Received: by outflank-mailman (input) for mailman id 622166;
 Tue, 24 Oct 2023 16:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvK5K-0005ba-Mo
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 16:16:50 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbba0ed1-7288-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 18:16:48 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32dbbf3c782so3362879f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 09:16:48 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe7d0000000b0032db8f7f378sm10249114wrn.71.2023.10.24.09.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 09:16:47 -0700 (PDT)
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
X-Inumbo-ID: bbba0ed1-7288-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698164208; x=1698769008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcongjLqzWg/eaT6MU2YnNd1mAYK2XTOvuPPmT1yxec=;
        b=Qcga8RIkP3GuB84D1jDf/CE8XW6ejr+P655pgEpGv1ZRRhCmEwPJqRPZSP5s3B/ani
         dRkm/SVqBjGIzSCcdwD6NzM6EAAvlhKz7m4MM/DvDJzNs9py7OattuFXn+qJv2Iw+zDV
         UGtCJKYmCcHZBeU7KPHULFdEIbqwX8lyLJKrFUu6X8i/z1fADcnvp1gw1bY3PGRcZrtH
         yTZoVxROAL10VmcY2RCwXtyk1LtdgbH2SIGa4vKFlnjXLWSeUyuF38lNNfNtSscFKBLB
         IEh2TxKe1MwfyWBbzBEU4FF9qUrEkRKEWStw67XfNwGTtQihmCd5A/5TCWqJMPtYQo4a
         FSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164208; x=1698769008;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcongjLqzWg/eaT6MU2YnNd1mAYK2XTOvuPPmT1yxec=;
        b=H/LSp+Xg2uz7Y2W/I2xMiBSM304FTzLq641NNdifaYTlqZAvW4Qkmxv5kTHluvoEoF
         1ZB1fQXcZqRQdPIDQm0rd/2ELE0uS10jDkIHsRTCjLrILlByv3V18OV70Snm8ZI/XNni
         1LHaLmOE8NBVleE114sqM4wZNQoyOKtWdPRF2VuxV6KF8zpT5nQyIA0lpma66Gz3mCIu
         re6FIqrvUOIII8IonkTaXz7rJLq3wV8AkVQzKsMQNl7jVE6wP8U5SEqiF/bCpx/dLLq/
         ZAJ6Ajdnys7onchP2KVEkMof0z81NLWa/QvISHscvgGOukPOtp+0UeLegEJwgtSX3prY
         MsBw==
X-Gm-Message-State: AOJu0Yxup1fNUQofUwbI8K9TrmFuffyodIrYi/wvjdDNX4fZJroTHcas
	scbJGwXENbY7+VXmQkHCtjg=
X-Google-Smtp-Source: AGHT+IFyYoxCffK4vqNocIJcq/bwK4C7n6go0YOsNpyudOwqbZGUABlQoetDH9qYu8zxPmI97nOj5g==
X-Received: by 2002:adf:8b97:0:b0:32d:a3cb:4059 with SMTP id o23-20020adf8b97000000b0032da3cb4059mr14684996wra.24.1698164207951;
        Tue, 24 Oct 2023 09:16:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2e174934-afca-440b-9edc-a5225d2510ea@xen.org>
Date: Tue, 24 Oct 2023 17:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/4] hw/xen: update Xen PV NIC to XenDevice model
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Jason Wang
 <jasowang@redhat.com>, xen-devel@lists.xenproject.org
References: <20231017182545.97973-1-dwmw2@infradead.org>
 <20231017182545.97973-3-dwmw2@infradead.org>
 <53e3e3e3-7bdc-4102-b833-bcacd496a31f@xen.org>
 <72ea536333fc9942f3c39acee571fc8f5ad98ba6.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <72ea536333fc9942f3c39acee571fc8f5ad98ba6.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2023 16:17, David Woodhouse wrote:
[snip]
>>
>> I don't think that's really a valid state for a network frontend. Linux
>> netback just ignores it.
> 
> Must we? I was thinking of making the ->frontend_changed() methods
> optional and allowing backends to just provide ->connect() and
> ->disconnect() methods instead if they wanted to. Because we have three
> identical ->frontend_changed() methods now...
> 

Now maybe... Not sure things will look so common when other backends are 
converted. I'd prefer to maintain fidelity with Linux xen-netback as it 
is generally considered to be the canonical implementation.

   Paul


