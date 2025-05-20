Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6EABD2F4
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990555.1374497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ3R-0005wh-FO; Tue, 20 May 2025 09:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990555.1374497; Tue, 20 May 2025 09:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJ3R-0005tq-CU; Tue, 20 May 2025 09:14:33 +0000
Received: by outflank-mailman (input) for mailman id 990555;
 Tue, 20 May 2025 09:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHJ3P-0005tk-9B
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:14:31 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d54fd376-355a-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 11:14:29 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-601470b6e93so7501423a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:14:29 -0700 (PDT)
Received: from [10.10.4.69] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e637dsm7015811a12.43.2025.05.20.02.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 02:14:28 -0700 (PDT)
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
X-Inumbo-ID: d54fd376-355a-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747732468; x=1748337268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAh8Wykk7n22DlOu/qE8677hSqyYu+D/iCZyVk1ts/Y=;
        b=G+CbIOmqylIybzUFAHywOpn+fuJb99j70u5KjbbESAf+yl0v34MCp4sB2hHS4JmyY3
         iOIDqo5YVbNavpJyW0R8qtxrOnK10cMkO3xfgMXUL/nMt82I4+Dzi94V0C1dDxyPZREL
         YvNbUCP1i7c9jKYHsz8goUqTGI+NZy/4plBZFnjfq8FGpXzIXqELFlkJon1Tyk/+RcA2
         W0ZOVEpKS+O0TqZWX8rlMzpMeTDxa4ddRKSoEABSt7JmjYNM6/aRp6jI4PB4AlABZPrU
         mscj8FUguHORkHgXaK1BPaelgqbKSJgYsCelAl3UWyb0IaDAfnO/Y2PGHoysNEvTUbX/
         OwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732469; x=1748337269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAh8Wykk7n22DlOu/qE8677hSqyYu+D/iCZyVk1ts/Y=;
        b=wbKGqVVh0b3tSZFuplkH0RzaV5Lr6TDoRGFmtbcJUk89HYOIDizJgpj/0lTCNf6BHm
         ZfqAodJ072IxKp8V9blSN92j+36bk1nzdc/krd06xMf7yppzTwcKqGgYYqSgyGjW3TJ9
         DNjWulrCY0Vn3QnJBmRVNT/TkXOn5TQXvmxUrLu5lPblq85GPA800cQjEFmfc5oS32pT
         q+ap5V3Zf2Q2uMWsvu+hEKa6zyYX4CfCgQEHBDvuzeNa480zvZ4R2p5rDtguu8Vke6EB
         noG9yDjGlekJRlr/xRh520zqydno08mehgBeoYbiC+Oxzfa0hAjYadiK6/p7H8H7jBRf
         7Iwg==
X-Forwarded-Encrypted: i=1; AJvYcCWU65UxWhQTsoOg2N6jfbCPkyOwljA0PZhQ8DlrOjX7g6aRSyb5GGmp8JbTtd/rlY0XU9CLW4avxv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw78VB+8NwghUWDe/B786eifUino6c85mXOD5Oy4sQ970Fefy6g
	AaRz3sL+QwHfZjoaNKwSOP/CiyMPRyNFCDfpW00Csscv31yQIrUAJd/JMvcevzlHlQ==
X-Gm-Gg: ASbGncsvVcElTq9oPEGnrgjFNplO3dPQtNSqQPdcnPQFYwo6IBEYFpf6FZXznElbb2b
	I19B0e84o8cYecn2u2vXrz7lT8S3+d3RBEeQwryFljLPEnkZt1Bz+f9DXyvF4Mm6eGCb2+hbfEP
	pJ80XWjQzo2gp5q1dEGExp+Ct0ZlNAu5NpuCVeBK5MszfXqZhAn+87F6rCf2c26A5AD2ostHNQm
	jtSwbUIIPOX5Q021ChIDfVC5AYotlRfZwdSDRKMrhJIbGjvvZNq7IeCeR2SRga4HIbO2EPu2up5
	3Ihx43qCTFD0E0vqaGQWMIRYsL5tLdfSxWvlY5ppRX2EZFWj0NzxO6GHlCxw2dGkeeoBDLtJRTq
	wbonp
X-Google-Smtp-Source: AGHT+IG/uMbo7VPCfwmbZGaAfym6NOwly06m5p4hLSWdzE0PqkRFwwsJk3ipjKp5dH50wnOnzLEDKg==
X-Received: by 2002:a05:6402:2742:b0:5fc:97e6:ec6a with SMTP id 4fb4d7f45d1cf-60090068697mr14664802a12.13.1747732468591;
        Tue, 20 May 2025 02:14:28 -0700 (PDT)
Message-ID: <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com>
Date: Tue, 20 May 2025 11:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com> <aCxGwSl_UuCWPf6B@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aCxGwSl_UuCWPf6B@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.2025 11:09, Roger Pau Monné wrote:
> On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>> When init_msi() fails, the previous new changes will hide MSI
>>> capability, it can't rely on vpci_deassign_device() to remove
>>> all MSI related resources anymore, those resources must be
>>> removed in cleanup function of MSI.
>>
>> That's because vpci_deassign_device() simply isn't called anymore?
>> Could do with wording along these lines then. But (also applicable
>> to the previous patch) - doesn't this need to come earlier? And is
>> it sufficient to simply remove the register intercepts? Don't you
>> need to put in place ones dropping all writes and making all reads
>> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
>> this may already be the case by default behavior)?
> 
> For domUs this is already the default behavior.
> 
> For dom0 I think it should be enough to hide the capability from the
> linked list, but not hide all the capability related
> registers.  IMO a well behaved dom0 won't try to access capabilities
> disconnected from the linked list,

Just that I've seen drivers knowing where their device has certain
capabilities, thus not bothering to look up the respective
capability.

> and in general we allow dom0 access
> to as much as possible.
> 
> For dom0 Xen could drop writes to the MSI(-X) enable bit, thus forcing
> MSI(-X) to stay disabled.  I however don't see this as a mandatory
> step for the work here.

You're the maintainer, so you have the final say.

Jan

