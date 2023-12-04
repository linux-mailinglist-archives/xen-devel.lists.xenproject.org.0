Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C09A803616
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646998.1009664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9eV-00007B-IL; Mon, 04 Dec 2023 14:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646998.1009664; Mon, 04 Dec 2023 14:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9eV-00005P-FT; Mon, 04 Dec 2023 14:10:27 +0000
Received: by outflank-mailman (input) for mailman id 646998;
 Mon, 04 Dec 2023 14:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA9eU-00005J-DV
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:10:26 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de86ef46-92ae-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 15:10:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso16075425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:10:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 ay31-20020a05600c1e1f00b004080f0376a0sm15156173wmb.42.2023.12.04.06.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:10:24 -0800 (PST)
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
X-Inumbo-ID: de86ef46-92ae-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701699024; x=1702303824; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+1JIDq/jNQnEDgf7q5xQmXB2HwG4wjc80W59a30rXM=;
        b=fxUCAVgK8z0bG68dbWQWUTl5UjBBcufjrAkgJdoLGKBGYVB9ufsShWKL8ovnA38onh
         iL5dx4LXm3i5jT6ClmWxC4NPoS1t/sqZAsy9Sjtt2cCXd84FrDVvZ0q7NfCAZDeJcb9p
         GSAB2tMyiKr7fbFjUaz4i7xE4QBjRMV58MAik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699024; x=1702303824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+1JIDq/jNQnEDgf7q5xQmXB2HwG4wjc80W59a30rXM=;
        b=rw404Z2MVU/U2dHvDu0fMv1oPGqJ2CQVAEc6eBmc5854uv3qWYh7tiSU7vw9S/8Ng7
         t3d1ZYA6AMAu8RJn13hY3YviNycH9gcP2+BtzA1msnY0rFTw+gdG0it+hUYB333vjOkT
         DKYrjSg38/SKUbcngre8YepZ7RR+vbfwn7SuepXoNdGjqso+9WvbZ2ielNBzp/xoRbhk
         /LOoM6C2v2HmJrNvLwz7YP4tbOU61KtN2X0znm/Jm9nXcZ3/MZL1I/+hGQqhjTSBAt5O
         pLaFGgibCUukkeYUapZooVSm4FMw9JluUfyh8OIcEjxHeHKxRR0poELNYHz0a38Tuzm0
         xq8w==
X-Gm-Message-State: AOJu0Yzu2VzQE4HKEQoh1O5c0i83/pJBa+lptt1kZoFxuc6auXpZfeGv
	AKR/wfOduhtkS4esC5Z5BMhzhg==
X-Google-Smtp-Source: AGHT+IFyfcNdvBS35vsoa+AawHejHbNi8vcBQUlxsSUA7VjPZltlc5eVmQVE3764IgNIFwbze2aN1w==
X-Received: by 2002:a05:600c:4746:b0:40b:5e59:ccb2 with SMTP id w6-20020a05600c474600b0040b5e59ccb2mr2761284wmo.147.1701699024637;
        Mon, 04 Dec 2023 06:10:24 -0800 (PST)
Date: Mon, 4 Dec 2023 15:10:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v9 1/2] xen/vpci: header: status register handler
Message-ID: <ZW3dzyMsZKOClZNZ@macbook>
References: <20231201154552.3066321-1-stewart.hildebrand@amd.com>
 <20231201154552.3066321-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231201154552.3066321-2-stewart.hildebrand@amd.com>

On Fri, Dec 01, 2023 at 10:45:49AM -0500, Stewart Hildebrand wrote:
> Introduce a handler for the PCI status register, with ability to mask
> the capabilities bit. The status register contains RsvdZ bits,
> read-only bits, and write-1-to-clear bits. Additionally, we use RsvdP to
> mask the capabilities bit. Introduce bitmasks to handle these in vPCI.
> If a bit in the bitmask is set, then the special meaning applies:
> 
>   ro_mask: read normal, guest write ignore (preserve on write to hardware)
>   rw1c_mask: read normal, write 1 to clear
>   rsvdp_mask: read as zero, guest write ignore (preserve on write to hardware)
>   rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
> 
> The RO/RW1C/RsvdP/RsvdZ naming and definitions were borrowed from the
> PCI Express Base 6.1 specification. RsvdP/RsvdZ bits help Xen enforce
> our view of the world. Xen preserves the value of read-only bits on
> write to hardware, discarding the guests write value. This is done in
> case hardware wrongly implements R/O bits as R/W.
> 
> The mask_cap_list flag will be set in a follow-on patch.
                                                    ^ s/patch/change/

> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

