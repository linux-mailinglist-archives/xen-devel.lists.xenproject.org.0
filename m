Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E684F175
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 09:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678574.1055972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMPb-0001nV-8g; Fri, 09 Feb 2024 08:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678574.1055972; Fri, 09 Feb 2024 08:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMPb-0001lz-61; Fri, 09 Feb 2024 08:39:07 +0000
Received: by outflank-mailman (input) for mailman id 678574;
 Fri, 09 Feb 2024 08:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYMPZ-0001lt-PH
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 08:39:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adf4c6ff-c726-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 09:39:03 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a383016f428so70404866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 00:39:03 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 vu6-20020a170907a64600b00a3be92b07d8sm382430ejc.24.2024.02.09.00.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 00:39:02 -0800 (PST)
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
X-Inumbo-ID: adf4c6ff-c726-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707467943; x=1708072743; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=whpypgL+BiX1yO/akrzi74w+kAMRpN7Y3hHHdPuVD90=;
        b=KPxXDwsIJsPmyr7PLSXOFI0sTtsJgwbjYFYjlBH0H9bcPSZL1nubW0jb0OMV6LY9E4
         QSgGkX1uTyx4XcrTAVuempd63O+HBAY204znIqhOFxxlu8m2WWlY+3jKhzWKu4TNoUC8
         FFb76u92LrUJOCBW5dmunewq8q58ptwTupKrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707467943; x=1708072743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whpypgL+BiX1yO/akrzi74w+kAMRpN7Y3hHHdPuVD90=;
        b=xG/dMyzKWRfJmsZCRdRdvZ/QYqb45K1Rx2wnbs2lTxdU7PythbGpzJJkt1yITGc1sN
         eHBboVv6NKjm3JJS4pVWukEqN+Da7uGQ/SS2N1q6YT+2GX64acbi1nhMcZ91B4nzmh79
         CI4+M2j3p21U32wokBV5eMSAAkYCvuOiENbjQRn5d9Ro0NkzktsCnXdhlvgtdG8my5Wi
         mr9bjPXT/C4vd9E4AOcpuhZFaEiTs3BaIRfxaFAqKS1M6Sbf/jiDYCtWwka121xHuaFz
         wSN3BJNhY08/WgudQe9NT/B/ZBK/HJcrlp3tkCcMlTFMy5K7bXj1LPwjmSJ5KgvMrBFg
         UF8w==
X-Gm-Message-State: AOJu0Yy6KlTgYUf9TRAV3AYWBykvtQsfKmsZdoDpOGdwshNczvrg+r3i
	bK30y4MDcavu38OltsARq3Pb2dBfXWwrTwlWEMnaJFnhvNvTWiU+weKeIDwqV2U=
X-Google-Smtp-Source: AGHT+IH36LU0raEjis0t2n221WWmXo0G3jf7Y934NTrgX4sLL3nvvjhqBZlatxXXplYJp0E9+fc2iQ==
X-Received: by 2002:a17:906:4717:b0:a37:b91c:8a4e with SMTP id y23-20020a170906471700b00a37b91c8a4emr635326ejq.60.1707467943110;
        Fri, 09 Feb 2024 00:39:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuD3kQ57Tz3pd5HwQpw5j+KwUJcQe7ZmvcgX1needhogh/3CGR0DbKzHpLH1cq9LsOvTZNLK0KP0YA9Da+ppS9DQIfMC3z5cOSy79EJlSXnZQm
Date: Fri, 9 Feb 2024 09:39:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 7/7] VT-d: move {,un}map_vtd_domain_page()
Message-ID: <ZcXkpk8XxJmGO1EM@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <22e7036c-cf49-4160-bd26-fbba6b67ff5d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22e7036c-cf49-4160-bd26-fbba6b67ff5d@suse.com>

On Mon, Feb 05, 2024 at 02:57:30PM +0100, Jan Beulich wrote:
> ..., thus allowing them to become static. There's nothing x86-specific
> about these functions anyway.
> 
> Since only the "iommu_inclusive_mapping" parameter declaration would be
> left in the file, move that as well. There's nothing VT-d specific about
> it (anymore?): "dom0-iommu=map-inclusive" is similarly generic, and
> documentation also doesn't say anything.

Hm, I guess documentation should at least say that
iommu_inclusive_mapping is x86 specific, because it's not parsed on
Arm and hence might give the wrong impression that it's actually
acknowledged there.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I think it would be better to put the parsing in generic
iommu.c, so that the option gets parsed on Arm and
arch_iommu_hwdom_init() can print a warning message about it not
supported on Arm.

Thanks, Roger.

