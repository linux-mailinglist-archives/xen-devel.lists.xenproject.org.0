Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BADAE69F8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023821.1399891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU59s-0006MH-RI; Tue, 24 Jun 2025 15:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023821.1399891; Tue, 24 Jun 2025 15:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU59s-0006K9-OG; Tue, 24 Jun 2025 15:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1023821;
 Tue, 24 Jun 2025 15:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtPk=ZH=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1uU59r-0006K3-Un
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:01:59 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d15389d-510c-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 17:01:58 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45363645a8eso5027195e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:01:58 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453646cb641sm150663495e9.3.2025.06.24.08.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 08:01:55 -0700 (PDT)
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
X-Inumbo-ID: 2d15389d-510c-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750777318; x=1751382118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DRLfF/kocBaDAEM7U/BwU1Gq5xTvw2xL8sslj/yveaY=;
        b=fpd8IDYWZ/L7RyPnGgvnTXECeKP2rWGvJADCCE8PzKTJt/RYOFYSa9TQ/8hk5VJxJm
         HHr4S7VM5rqgCooH8K7JPKc1xtYvsekXS5nQbnC5lqJNW782ujt+5rTzmaYbREF25tAx
         a5HQaO+Kv1vHymBQSmDOsaVVFQDlPzO92S5H8epmC6NcUOMUr/n739SM1yCBWy5Mgr1p
         6EJHsatS67rRWp+EzHwPyfhNgVluWkPHa15VTfS6Uaj50Yw6dIIAoDlpzs7ZU6uDX+p0
         ReiKYmkVwQEdE6hl7K9PtSGwvh7AAw8GgD+CeTNeUTj42GoUV8DayZucsyk2wGOwEnYS
         htJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777318; x=1751382118;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRLfF/kocBaDAEM7U/BwU1Gq5xTvw2xL8sslj/yveaY=;
        b=Nk3fX/ApokZeKLAoGJA5ZU6fjsxixWCrLPxslfrS6bBubvKGVB/cq8jmiYYChuxfNV
         Uim9MsXTBy30fKn/tBcw6YYKwu85hIjdjADivpylobN4WDTqRrc4MNt0PXPu/wBZToRw
         a7vC0Kfdd85Nu4+Qry8ntWdDwxXI1xXlotPx4ZmPoHVaCyT2AfhwwL15OnQmfMxkasXW
         uAn1Ay3gIeV+MsVxw38NjX0l91loCs0AcusybaCJpRyP2EmbuU/EeSussDs1XCAVIx+u
         QPQE4kMS7Iev02gXzCiGFadGdmhpcpSHIjf5T6WMgtLXi14ZgHd+iOBsDpQQC/Sd6cFH
         0xbw==
X-Gm-Message-State: AOJu0YyW3MS89LeUH1Zn4w2O+BEmwGmUE+BB+64IxSV41xctV/gOxO6A
	T1rToSqE3F76qMcal/aPG96NZmciTTr/C+RnohNRzV+YPkbpvL5Ditn4Ew8M6Ht0
X-Gm-Gg: ASbGnctHKUjcxQestPyIHOeoBExcu4WqEoxKytzHjxMkvMW00HvtebYbyCCSM+8wXy8
	oFo1eGEeIqfzwZizGMf167i41av/wLzVemTsjHjJMO1PU04yKk2OnVYRrMksqDyDg4E77slU+Bx
	kTtuKrErQCOIbjDu/6x/uqpqvi9CdSMV08Brtn6QBcz+GHPQ6bZNCpbkEHmrdb2cPt8grO9vi2Z
	f/LIZn9vVcYe4NUxd/tjj4GyQj/+GP8IIvbsOUn2sNSiDDNkWnqANo2TwADcASCnLo0b1qydGzC
	6kRqKmDjIGJFjm73jgdrGHzKSd/tB9JVOmM4iDRz5zkGZvdMRTo7bDzHpPvTl13dFG4q+LzE2Ds
	czodK/TmYX92KR0iG3cPlsMt17aXWXbm1kvS9haYzg1/xxS9bhmhE
X-Google-Smtp-Source: AGHT+IFwjYI/GcfbhxAZzCJ5I1wiPfO5E5T60zHAQSyftHEAITc7wNbF01dSrpZBYnUx2giURmhsGQ==
X-Received: by 2002:a05:600c:1392:b0:44a:b793:9e4f with SMTP id 5b1f17b1804b1-453659aef47mr127097385e9.19.1750777315761;
        Tue, 24 Jun 2025 08:01:55 -0700 (PDT)
Message-ID: <b27dae37-f395-4be5-98ad-41f97e8cf05d@gmail.com>
Date: Tue, 24 Jun 2025 16:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xenstore - Suggestion of batching watch events
From: Andriy Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech, Christian Lindig <christian.lindig@citrix.com>
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
Content-Language: en-US
In-Reply-To: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/25 3:51 PM, Andriy Sultanov wrote:

> Suggestion:
> WATCH_EVENT's req_id and tx_id are currently 0. Could it be possible, for
> example, to modify this such that watch events coming as a result of a
> transaction commit (a "batch") have tx_id of the corresponding 
> transaction
> and req_id of, say, 2 if it's the last such watch event of a batch and 1
> otherwise? Old clients would still ignore these values, but it would 
> allow
> some others to detect if an update is part of a logical batch that 
> doesn't end
> until its last event. 

Come to think of it, since clients could watch arbitrary parts of
what the transaction touched, this wouldn't be as simple, xenstored
would have to issue the "batch ended" packet per token, tracking
that somehow internally... Perhaps transaction_start and transaction_end
could produce WATCH_EVENT (or some other similar packet) as well so
that this tracking could be done client-side? (standard WATCH_EVENT
would still need their tx_id to be modified)


