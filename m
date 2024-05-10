Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D038C2154
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719648.1122492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Mwn-00007A-GC; Fri, 10 May 2024 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719648.1122492; Fri, 10 May 2024 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Mwn-0008Ur-DV; Fri, 10 May 2024 09:53:49 +0000
Received: by outflank-mailman (input) for mailman id 719648;
 Fri, 10 May 2024 09:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvKo=MN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s5Mwl-0008TE-Rb
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:53:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31a79322-0eb3-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 11:53:46 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a157a1cd1so445915066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 02:53:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c?
 (p200300e5873ca5006aafb7a77c29ae5c.dip0.t-ipconnect.de.
 [2003:e5:873c:a500:6aaf:b7a7:7c29:ae5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01968sm164814366b.166.2024.05.10.02.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 02:53:46 -0700 (PDT)
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
X-Inumbo-ID: 31a79322-0eb3-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715334826; x=1715939626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgDr/j3I45aVQZVCtriHh098OsnX9VLTCcgYdnyh5r0=;
        b=G1oOVFy0LWVpm7QSBPsjlwoIHh/vZMdmF7oy4kPcfSniWTs30q8mRraGW4ZfigEmTZ
         XQFsGNmof1tp1NngQu+T1p27SuBm7k4dcbMogotIheAvOoDgYcr5Z1GZr6pUZNEuxiD0
         mL2AH8Dg0Eue6tbMvayYK6Egk2xuLgD/j8dnWiWaDQ3xxHsdfjiqqzvxkvu0DUlA5lg/
         xkFqR0AbpOaYcJidiErgHPMjZLv63BAVUWOfrXaJk1yTCLoOWF8e2cuBTWtla93tp73o
         8LEAKDz0adnMlDhY6a9VpnMP9LTl9HXjlfRofYejYnv2tiN2xjFsQ9vjItBNqlInJlbC
         KUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715334826; x=1715939626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgDr/j3I45aVQZVCtriHh098OsnX9VLTCcgYdnyh5r0=;
        b=ZXbY/hEoY/zANWyFOnfMu8+MbdEjacf6vmJ46kPSnYdDfcU55Jvg5Stc7MUSakZs9x
         E3NBs6PD4CpvlDoGCb/Appi47SR1+IybSKq+Vp5COkDb/RQmEP6KpLkfX2U+PqLOmWNs
         3ffzke03+Q9PnVDu2TQbAVkrCnLPTHGNL6TGVEwcRTOAjuO54e2xgKnFg1IQOJnGX+3h
         jXYlvfoBPG0YDBk+feKfGXyyins+CscKy37nfsfK766dIbzoZMjK4usZnhRWXQAmaQX2
         CS7oEQo2L9C+t0aiwZhFqhetProGV7ATkrjrTJ8+wXobITDRrLKJWceXSFq0mrK9GFby
         CD5A==
X-Forwarded-Encrypted: i=1; AJvYcCW5zK7Qld1EbqpSamQgCkEH7AAUDcJhFi/IdiPAnSPdqCXfHygFFSGPnptDPYTrsCxXoJzF8lNE6iD/QBDYiCbJj/l/EahsmipJ9jTQoIg=
X-Gm-Message-State: AOJu0Yw5hhrAnH6LFjARDOPVP3CFg6g7NE24Vz30ktycLsagxGXdgLz5
	OopnJY0qgcoXtBqgNTW/Ww+ApHO7rpM8qhKc76b5+rv8GCayGH7pA4k40Bldh0k=
X-Google-Smtp-Source: AGHT+IEKz31JvWqjAEmRomlfNgaF8EqP2HQK8r73XnIs3tomW69Tn3zJ4arHD6nbkZkJnphFIwRQPg==
X-Received: by 2002:a17:906:134d:b0:a59:9eab:162b with SMTP id a640c23a62f3a-a5a2d5d01abmr136503366b.35.1715334826351;
        Fri, 10 May 2024 02:53:46 -0700 (PDT)
Message-ID: <c30ebad2-1ad3-4b58-afaf-e6dc32c091fc@suse.com>
Date: Fri, 10 May 2024 11:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC KERNEL PATCH v6 3/3] xen/privcmd: Add new syscall to get gsi
 from irq
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20240419033616.607889-1-Jiqian.Chen@amd.com>
 <20240419033616.607889-4-Jiqian.Chen@amd.com>
 <79666084-fc2f-4637-8f0b-3846285601b8@suse.com>
 <BL1PR12MB58493D17E23751A06FC931DDE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <BL1PR12MB58493D17E23751A06FC931DDE7E72@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10.05.24 11:06, Chen, Jiqian wrote:
> Hi,
> 
> On 2024/5/10 14:46, Jürgen Groß wrote:
>> On 19.04.24 05:36, Jiqian Chen wrote:
>>> +
>>> +    info->type = IRQT_PIRQ;
> I am considering whether I need to use a new type(like IRQT_GSI) here to distinguish with IRQT_PIRQ, because function restore_pirqs will process all IRQT_PIRQ.

restore_pirqs() already considers gsi == 0 to be not GSI related. Isn't this
enough?


Juergen

