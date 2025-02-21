Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF89A3F1F7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 11:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894363.1303081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlQFM-0002FM-8k; Fri, 21 Feb 2025 10:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894363.1303081; Fri, 21 Feb 2025 10:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlQFM-0002D6-6E; Fri, 21 Feb 2025 10:27:04 +0000
Received: by outflank-mailman (input) for mailman id 894363;
 Fri, 21 Feb 2025 10:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQ+l=VM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tlQFK-0002D0-Cx
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 10:27:02 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 608a4e1c-f03e-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 11:26:57 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7483b9bf7so306240766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 02:26:57 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231fd5sm1620344666b.26.2025.02.21.02.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 02:26:56 -0800 (PST)
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
X-Inumbo-ID: 608a4e1c-f03e-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740133616; x=1740738416; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3xh+hO2QqN0eWVD7DJcPR8MIwFjNxQwzgazJj1It5uk=;
        b=L1X88BFTD1VglY0rPwS72khR+w4EnxYnsB0yfrOLqfM3YUYWYDNZxB3nhgZUhb1ZiJ
         5ZEyDbfHAS0R6x3prpN/Y2kNTuSbns3tdQRcgpyEX8p5ZjI7M4wLjjRal/akB+M5COg8
         5opt9jsmbnCMRmYruIqXwNW7kCPKAvEDqvTN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740133616; x=1740738416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xh+hO2QqN0eWVD7DJcPR8MIwFjNxQwzgazJj1It5uk=;
        b=AnHjDrVRXzrY45mup5h7Td3PbrVUAmZg6Xpf/UtDAGe40cRj+Q7ZO552ovd1DHhpkV
         vs06fCQ7OiJo0+uPTZcOEuHTBP1ITOhtpp9AoATEaUF0GWOSjbWhEJaaX2KYIc5aEmeA
         /UWdO8VTAdjwl67CcfANvsxZuVeO4xe0BuXTGkIcA4v6krIWhsfUQmjS5XQGDgcd/q2h
         ArNEMkgD/+y9CmAhBUruboqU/xa8qL0EIbtsxPVSgVRTrek1hUrbWwumq+BkpABJFqHl
         EzfZaWMJuWMuhgGjCIlKy6Uhe7mnt/wyoUYdqteWk/Etpdw8ONWCHjgU7D1hvWvsaYoI
         1kfg==
X-Gm-Message-State: AOJu0YzTsk/170aQoU2PDl2tHs4blsJyJ+oMpfIadcEJNWSMCtt5Ipbb
	3FrW7aNrPte29icRbYob2MCJ7arJx8g3U/BRT2x5UgknLvZO1T4bVGsm3f8C5f/rxsAG7Z6Czz3
	+
X-Gm-Gg: ASbGncs4Tt/8jrp3P7/CLEE8rXfv4UMi0Hwrar9wzZDM9Ouc8qr2TSRjYfDUZwU1P2W
	uqoaPzcHE2PyRyyIvczJAklenBQT3r54i9ZNMUZRiCih4TlA4CH/JKZlDG63ltJkYtrFj6GqrlN
	6coIapHkplHgpMdibRczihBg6yijEsgr0FFupqi3Y3KFuODYLqQKTZu92YrhphgwquTOgaRm8m0
	34CIYxlstE8+fHgWrjxI8G8JhDh4KeygTVCYS6iCfcu+pGA1hqYxgTlKeLjs0l7ORr+TJ2Pm/XS
	ur2Nny4DuOcNr07NP5YZZu/gV+4jiHc=
X-Google-Smtp-Source: AGHT+IEM5au6Mb+tS/2GdiYI7dsZoGrti/IhoaEXEn/OPrCdyDE0/R+FNXhKvHj+PTmrIrGCqGuBmw==
X-Received: by 2002:a17:907:7851:b0:ab6:fee1:60e0 with SMTP id a640c23a62f3a-abc096c2593mr258023466b.0.1740133616617;
        Fri, 21 Feb 2025 02:26:56 -0800 (PST)
Date: Fri, 21 Feb 2025 11:26:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] automation: upgrade arm32 kernel from bullseye to
 bookworm
Message-ID: <Z7hU79ZB2UdtGcMP@macbook.local>
References: <alpine.DEB.2.22.394.2502201453560.1791669@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2502201453560.1791669@ubuntu-linux-20-04-desktop>

On Thu, Feb 20, 2025 at 02:56:20PM -0800, Stefano Stabellini wrote:
> automation: upgrade arm32 kernel from bullseye to bookworm
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

