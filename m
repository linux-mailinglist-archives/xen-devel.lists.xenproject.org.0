Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9986A0444E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866537.1277827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBTj-00044K-KR; Tue, 07 Jan 2025 15:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866537.1277827; Tue, 07 Jan 2025 15:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBTj-00041L-HN; Tue, 07 Jan 2025 15:26:47 +0000
Received: by outflank-mailman (input) for mailman id 866537;
 Tue, 07 Jan 2025 15:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnJ5=T7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVBTi-00041F-0i
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:26:46 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd92fc5e-cd0b-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:26:44 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso15692017e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:26:44 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c5bsm5281792e87.274.2025.01.07.07.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:26:43 -0800 (PST)
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
X-Inumbo-ID: cd92fc5e-cd0b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736263604; x=1736868404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfWHKG3Q+5nnzH6s/mruPyyMaUe48IHjTRpPOsXc/U0=;
        b=WObiU2LUV9ko5/YWGsqKn0GItH7uBCExBulKlTbmRCMJtMRqTHqCe1OXcZdt8Jtkz8
         XBk6729H5xELxgfDSiXRHfRLbe+LCwmEvEHhlrUn/I237yFA+Izm1D3yjV/S1F5q38z7
         yDGwl2yLL1XrdVEvBU+IL0eoYbL5oqp6On0fvxG6m7hPL3ya6AWIruJhSyx5GTvFu0Lo
         EMmKg68ILKJ165VvltA83j63cudoTn75NqnM7hu7U8io0Jh+6AcLHA5S+n65n7vIBLKY
         EkxvhOq7sc5voqARY2oaENE2kGWI0Lg0lErJMQguMEESMyX6/o9Dzs8zSYbPSnaLjPZk
         kVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736263604; x=1736868404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfWHKG3Q+5nnzH6s/mruPyyMaUe48IHjTRpPOsXc/U0=;
        b=GX0+GHpRUkSsYgQ792lBpA1HHNFYL5d5it+s4LYwPOyD3kI2fv5W35l0HEKELOn2db
         uyoHSajKF1fnNUGI1+F6z58KK0j766xCsKuHUmQreoQiUxlUg+ktZUPriPwjG/Edn4FV
         3jg/yD/8EbFP7GT+7YtLSDpRjGOSK3j1wzWxpe1o6hzJ4sg2guEufl2eik7GNzYR9eGN
         ACvFy85pAJ62pxdxK1WLaU1eEUbVRMiH3cNXcUVOf2pAqlv184x4ET5dtq3Dy+19kUUh
         z3VbZcexLeSmQhHDH3nX1v3ama3RdzoKOhL0LBTGGyANoP+P2++wAyoKbZbAVvJbcMZu
         gDAw==
X-Forwarded-Encrypted: i=1; AJvYcCV3dqEyGl2KojME2zEEnrvJgntGb6OYceqpVoaYyo0KxeVsPZs7g70NVfY3C9a8nWSwPD/HVqOH5Vo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSTWXI/P5INcdAXCwpm78HRjn+VtpkqxV4iq9WJfalQ2e61cOh
	BJXXnYbCz3f/Dbme8fxQWBXy9kEapBrccw0ppFaYoKUDZTqQEITb
X-Gm-Gg: ASbGnctenJLyaMrZmv0TjkYxw8yldCxejl1vuZ7rgIp/5nVhcRIisbmHcS97Ku2F4uC
	yOIY5EdYmq+DOtkrWmdaH40cSSy2BY7uQDJo9r9itKdZRRSr+CDf7ak7WATTwhS1jNjTqoAjqyV
	CIfVAy+YnL9wWcM4TtpCvDS5OFV1o2ozxdnnwOzeiEHAyzeXr5ReK3jJfVp6GnJlH4RfZlV+Y8Y
	H6iBpRrNRbeAv9Wdp7kbBZ0c+F9j7hlKaKTWhtnL/2/y1B/CMFns8XpEvdlH4reg93TvQ==
X-Google-Smtp-Source: AGHT+IFMoIyECy0Qy4dvRveiz13MZ7Mnn0Wa0mm26zf0+2KdVh1GYwXmA6reqKSZdbnn1X+gLfK1oQ==
X-Received: by 2002:a05:6512:334f:b0:53e:389d:8ce6 with SMTP id 2adb3069b0e04-5422953d2e0mr14281693e87.28.1736263603983;
        Tue, 07 Jan 2025 07:26:43 -0800 (PST)
Message-ID: <03215adc-3b42-463b-8d3c-74e6d1b28f12@gmail.com>
Date: Tue, 7 Jan 2025 16:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 0/3] xen/flask: Wire up missing hypercalls
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250107092719.26401-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250107092719.26401-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 1/7/25 10:27 AM, Michal Orzel wrote:
> It's been noted by Juergen that recently added XEN_DOMCTL_set_llc_colors
> is not wired up in FLASK. While preparing a fix, I noticed two other Arm
> hypercalls from the past that were missing the linking as well. These two
> are latent bugs while the LLC one is a release blocker for 4.20.

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>


Thanks.


~ Oleksii

>
> Michal Orzel (3):
>    xen/flask: Wire up XEN_DOMCTL_vuart_op
>    xen/flask: Wire up XEN_DOMCTL_dt_overlay
>    xen/flask: Wire up XEN_DOMCTL_set_llc_colors
>
>   tools/flask/policy/modules/dom0.te  | 2 +-
>   tools/flask/policy/modules/xen.if   | 4 ++--
>   xen/xsm/flask/hooks.c               | 9 +++++++++
>   xen/xsm/flask/policy/access_vectors | 6 ++++++
>   4 files changed, 18 insertions(+), 3 deletions(-)
>

