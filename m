Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6C927CD1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 20:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753947.1162222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPQr4-0004DN-Gu; Thu, 04 Jul 2024 18:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753947.1162222; Thu, 04 Jul 2024 18:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPQr4-0004Bs-E3; Thu, 04 Jul 2024 18:06:50 +0000
Received: by outflank-mailman (input) for mailman id 753947;
 Thu, 04 Jul 2024 18:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU9=OE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPQr2-0004BW-KD
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 18:06:48 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d441604-3a30-11ef-bbfa-fd08da9f4363;
 Thu, 04 Jul 2024 20:06:46 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ee75ffce77so10916221fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 11:06:46 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm568850366b.140.2024.07.04.11.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 11:06:45 -0700 (PDT)
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
X-Inumbo-ID: 2d441604-3a30-11ef-bbfa-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720116406; x=1720721206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tM0HL8E8Z38QJguA49EEBzuKyC8O3mtfm0XbZ+mw21U=;
        b=rGMmW2PTzycmgp0vERaDXtLqnZsyot7ZGZ5FT7B9YAMg7fhLOi6dYRdK4lvfnU/nm3
         WIi1hVUc9pYNeRgQjTsvuJJb1DMWLHuASbp453GJ1e2ERpjZBpI8mcmy6c5c4rJMSm4W
         Z5WGOvn+WQ/dXQ9Hv6oT7ZGv+/pqS5fK14oSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116406; x=1720721206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tM0HL8E8Z38QJguA49EEBzuKyC8O3mtfm0XbZ+mw21U=;
        b=uJWuUMK3Wj1uVtdgLJe3M6UHGcUjqXDDwEqeBAu39gN6lETIHQu52qoYRh1Nk5xqHf
         rI3OhkO/o8CrOPbELDHEtLE6i2F1jMmZrbPUsaO5LbYuE0e0/Sphx7ShE2y4kcZUGVRV
         WeIwNOfeAvV0XJ3iIeW/r0wpx9ER0+sI4WfZW4i+EfCcZp3J1U/bBw1AGT56rzqBhyQA
         ul0ixIViYi7MNU5EzmTMhZhmvwktuafToPO3FaKlooh33rEMfY8VGOnGALpyydiXpu7Z
         umhqSQv5nRg5y9v0JgCBK8K4RJ/TiCvsVJZoMxDCMJdui0JNSmWTTKZQmTS2LpIdHjvu
         phyw==
X-Forwarded-Encrypted: i=1; AJvYcCXobBQFIXRZZxLiU13wx3qUDrL409zexYAVrNXECjbApx+hrrwBwb89QVWF3tdZ3K90DjriCGwDVHrtx3tM3/u3sFNKE/KadHZEDVC7arI=
X-Gm-Message-State: AOJu0YxXR3NmRadpuFjLJD2Htg5+oPW8MqyMy1Ea7qvBSqUwakCJr7e9
	N7UiOk9FEToE5y3sfwrrOt9tjEOWoN+EZ/By4NQ7d8O0Ux6ZpRvpmNbJ/X5VniM=
X-Google-Smtp-Source: AGHT+IGsGwqU0zrnIT2Kcas+CDBRfosfPX6YhSATjxgB8W+C9OakX3LvUNdYId5pfQ3EVkcDlbJEtw==
X-Received: by 2002:a2e:6a18:0:b0:2ed:59af:ecb4 with SMTP id 38308e7fff4ca-2ee8ee0e975mr19824441fa.41.1720116405906;
        Thu, 04 Jul 2024 11:06:45 -0700 (PDT)
Message-ID: <d3b0c081-d197-4c18-adcb-a6cdfca22826@citrix.com>
Date: Thu, 4 Jul 2024 19:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 3/4] CI: Drop bin86/dev86 from archlinux
 container
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
 <20240703142002.1662874-4-andrew.cooper3@citrix.com>
 <ZoVjg-HBZdoa-B5A@macbook.local>
 <6b05b04d-e2a8-42ba-b040-78638fa7b51f@citrix.com> <ZoV5+RT0JOqFCW7d@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZoV5+RT0JOqFCW7d@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/07/2024 5:19 pm, Anthony PERARD wrote:
> On Wed, Jul 03, 2024 at 03:52:48PM +0100, Andrew Cooper wrote:
>> Also, Archlinux is nonblocking because it's a rolling distro and
>> periodically breaks older trees because of an updated GCC.
> Correction: It should be nonblocking, it's not at the moment ;-).

And it turns out to explode in stubdom because newlib has K&R functions
which the new GCC doesn't tolerate.

I'll need to do a prep patch before this rebuild is safe.

~Andrew

