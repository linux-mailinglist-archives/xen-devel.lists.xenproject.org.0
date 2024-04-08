Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1389C0CA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701967.1096650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtonH-0005er-DS; Mon, 08 Apr 2024 13:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701967.1096650; Mon, 08 Apr 2024 13:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtonH-0005cS-A9; Mon, 08 Apr 2024 13:12:15 +0000
Received: by outflank-mailman (input) for mailman id 701967;
 Mon, 08 Apr 2024 13:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+ji=LN=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rtonF-0005b6-UK
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:12:13 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c725b10-f5a9-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 15:12:12 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-434a6024e2fso5648221cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 06:12:12 -0700 (PDT)
Received: from [10.95.144.96] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 ir13-20020a05622a6dcd00b00434c25cb61bsm185792qtb.73.2024.04.08.06.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:12:11 -0700 (PDT)
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
X-Inumbo-ID: 9c725b10-f5a9-11ee-b7f7-5d6b493b22b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712581931; x=1713186731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pgrFrBQO78cdY9i+K0Diy27ZfHZVfkTPqTJibFJRfuk=;
        b=maK9MBDGnsglbNrFqCV1HU8nduXO/ioR/QcXRNI8TbQcOXhnUIluFn+Dv1PdU3ypm4
         B1cDeTunwGDWWmt9rza4Rp8Ixw14D16Lbu0E2i1BAxE8SEZs1wsAIAJKltHWXN2tgTWM
         S1z8524Ufw5ubSUapnn/4XLpNP3znuubKhPEWrL75X7uqD7k9ypviDdxWGIWtDULxVLT
         v7YjvPcn4uPlOAdNx/DSchzOyj80v4BeGBTGRSP7rkNPSlmeHfYpkpFRt4RY7HTZ2Udi
         Pfhm13qHi/t3ZPY8p5ertK6JfMZkb/FAYezgMyhFXUnUsaYZm/eYibJkDz1OZvR25mlz
         Qf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581931; x=1713186731;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgrFrBQO78cdY9i+K0Diy27ZfHZVfkTPqTJibFJRfuk=;
        b=r1JqA28+8JnEXGEAFe6hq06LUCshGQBasHMRrp9yd5xhSrkZLCVGHlJJ2L2EF5pJV6
         /OS2dtJhTtRJSokKpNLLkSO/iU/1cTCzlwfteT5IOCsGB+tu3uYQfNEJZ9ZDRoPFD0cx
         NG2m42pV9GAPWuqdA8rzr2AT3k9myJAhxKaEyiiKu4oD5o0+m5+MemXYB48WF+XlG/LC
         XClxZQd44ibGlrRVdztQtCaUnXS6AiV388UhtVC/mkhgjyinEi6ngtS9MNGBg7OqWJx8
         hfPBizN2MZv+ZjEUalVxMa4B/qdQCpFyd+wpa066ZKcyYBsIxYjpj9uz74A5Tzt7UQ3G
         EW+w==
X-Gm-Message-State: AOJu0YxvgTEhCJhXPxfzpL67aS2iRSvKO5z3++fZhTsm6ok7nqHBWAH4
	6THPSP+y1MxgsXb38epCmxX0XbFABxSM0F6UHfjV1OzrA2zn8Wjn
X-Google-Smtp-Source: AGHT+IFzyKXfFNcAq7GRRtXhaHFGIb+ScU/yAlMXeV1+dY/ujzqnSZbIVS4TeYP5N5o0569KsZkwVQ==
X-Received: by 2002:a05:622a:118c:b0:434:ae42:caef with SMTP id m12-20020a05622a118c00b00434ae42caefmr3054245qtk.10.1712581931265;
        Mon, 08 Apr 2024 06:12:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <90398ca3-6866-4e88-b16d-48eb3a47a9a5@xen.org>
Date: Mon, 8 Apr 2024 14:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2024 15:08, Ross Lagerwall wrote:
> A malicious or buggy guest may generated buffered ioreqs faster than
> QEMU can process them in handle_buffered_iopage(). The result is a
> livelock - QEMU continuously processes ioreqs on the main thread without
> iterating through the main loop which prevents handling other events,
> processing timers, etc. Without QEMU handling other events, it often
> results in the guest becoming unsable and makes it difficult to stop the
> source of buffered ioreqs.
> 
> To avoid this, if we process a full page of buffered ioreqs, stop and
> reschedule an immediate timer to continue processing them. This lets
> QEMU go back to the main loop and catch up.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>   hw/xen/xen-hvm-common.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


