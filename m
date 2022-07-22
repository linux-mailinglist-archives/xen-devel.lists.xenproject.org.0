Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAAB57E4F3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 19:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373403.605606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEw35-0004IU-Pp; Fri, 22 Jul 2022 17:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373403.605606; Fri, 22 Jul 2022 17:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEw35-0004Gg-MR; Fri, 22 Jul 2022 17:02:47 +0000
Received: by outflank-mailman (input) for mailman id 373403;
 Fri, 22 Jul 2022 17:02:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEw34-0004GY-Ax
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 17:02:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aafa069-09e0-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 19:02:44 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id m17so7040882wrw.7
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 10:02:44 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 x3-20020adff0c3000000b0021deba99142sm4790720wro.40.2022.07.22.10.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:02:43 -0700 (PDT)
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
X-Inumbo-ID: 1aafa069-09e0-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s+KqLdn0dK89A+5Nw7DWkEcVYPRUvYjP2NFooCkwCWY=;
        b=A6pk2/c3YvMcQrCnD6qzBM3PL/Q+2HGq9XKixlNG8lgtnyFm4Q2uqbLN+blKawVFMZ
         sAzXVM68Z1NREhajX3d0jwExy4nHtTg5j2/QZozdDbbl3bAnZHJU8OLNQVgQAt/MhgI1
         5CUMsDLKdcQrH4XBntwd6k3NchdySrPNijG7IGnO5LWAGbyIozMbMAMcv2DzkfX7ICi/
         OVyTUtj93lzR0cqc/ZddJ1QczHVIY2hco2byLoslginpiK4EPaJ7mPOf8e/2Fcb7673M
         GpOv/viO3sHtmbE5JRcmxVBwLx8DG4Gf5VTqaOvcOyH8zklkpgtg9OI8lG7If1B9D7U1
         bTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s+KqLdn0dK89A+5Nw7DWkEcVYPRUvYjP2NFooCkwCWY=;
        b=y2Q0P4/ADJOsIBXyGpaikELu7nKisEbic4cYOtGjZGBTqCG6mbFE6lDogmlE886E/4
         gltwq/t8Lm31fSJu8h5MLhlZEv1d+eW8Ya30ofxaN4xBXrWFhzyMctSX9h/TDayM0FxG
         nif32B7xirDf1QrELfcB2lOcCRdLPDv2VzLYHQPdTI/SinDxL9K1WgG3CSxse9ofGbLH
         c1flsjLjcbvplRZYe2Amx8QIBMnprllgeTK62ZH2YaJCo8PHl5j60EscDJyniuM074rU
         RFF7rTheDEX7o/DztzWZ0FqCTO7n649wg3+hQ/7OVNITbWuWhfBnsVCeSrYyxq/crtCP
         1uCA==
X-Gm-Message-State: AJIora+CrECbfhef8NuNec8AFotixLMjCVizSECXCjliBzIRTRqFb5iK
	761rdU74JD4I9a0qxjnW/r8=
X-Google-Smtp-Source: AGRyM1so3uj6f907n8hM6XImJDl2zrekwBTh9rS+coQ/uU7/jA8rlE5VqZged9ExBQvGdRQap49ywA==
X-Received: by 2002:a5d:470b:0:b0:21e:47f4:9a8b with SMTP id y11-20020a5d470b000000b0021e47f49a8bmr569535wrq.173.1658509364487;
        Fri, 22 Jul 2022 10:02:44 -0700 (PDT)
Message-ID: <67765d28-a4e7-2461-8c4b-87e039e113ff@gmail.com>
Date: Fri, 22 Jul 2022 18:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 11/14] AMD/IOMMU: replace all-contiguous page tables by
 superpage mappings
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <718906a5-8c18-530a-89f5-02e2a2efb211@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <718906a5-8c18-530a-89f5-02e2a2efb211@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:48, Jan Beulich wrote:
> When a page table ends up with all contiguous entries (including all
> identical attributes), it can be replaced by a superpage entry at the
> next higher level. The page table itself can then be scheduled for
> freeing.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

