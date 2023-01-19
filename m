Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2167895C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483219.749239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4D7-0008KF-0p; Mon, 23 Jan 2023 21:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483219.749239; Mon, 23 Jan 2023 21:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4D6-0008HT-Th; Mon, 23 Jan 2023 21:18:36 +0000
Received: by outflank-mailman (input) for mailman id 483219;
 Mon, 23 Jan 2023 21:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbAi=5U=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pK4D4-0008HL-RP
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 21:18:34 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c99bd64-9b63-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 22:18:32 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id jl3so12738928plb.8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 13:18:32 -0800 (PST)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056a00179400b0058dbd7a5e0esm41148pfg.89.2023.01.23.13.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 13:18:29 -0800 (PST)
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
X-Inumbo-ID: 7c99bd64-9b63-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvP9ePGiLeIZbacBX9f8fdS0Vg9jpqMmwkb1uVgjCts=;
        b=UDNpBpONiaB9zcbgLJizT2LLfBkdM91UiNorkXXmdm2ov6CsWj8AEoq3IplXmSuw0R
         HQpPDhIIWI5wmAtVLCt9irzNLHnuRXJ5EJ72jAQXN79NXb2bvEpJy6ONHKbddwdNZGVF
         socue5HfVuhHf65wjhKM/vfz9eXVZyGwGV6OWBLdrMQ5fBYA2IsuX3rnKz+07dpyIbpV
         FLG2DB9gqyMRguVIunopxVF/vNTDCyOp2B3WeFGZ5iZWzYoZNeD3TCTZQkyelgNsquOA
         PMt+u9qaJxOpcMpKirEHunELchXB8qs7lEHAd5bgpXXcbAj5nnYTL8vfrkY88uB5W3Rj
         lOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvP9ePGiLeIZbacBX9f8fdS0Vg9jpqMmwkb1uVgjCts=;
        b=VfYa9TX38vbRD2jVunaq9CEbw/bQCY7BHzBw+QjB8hQAYRpPDO2Wo6OL6DGeBxhWBz
         XTKNjjut1aIc/lgBwW/rZkHGiIhPeEGavwigQ8EJOEntSBAqV1CuV1Y66jFZR/gUD1Uq
         TzS1p0PrnrXBVcwUSlLlkCpO+kz0VD0DhsZdhxgALLEdLpfVArreUjpfM34gnvgAU33u
         4rngciuO7hh0Fygk2b5rSE9KvyMDj6OpbrZbvAUOW3Fet/MBsXu4YgjpdpGBLRT7GgU9
         /3unj3xU5umLcP17APZpkY/Me3xReQRMgJIS3Ypnt6KGEQE3i2xFPntToc+jv++a0W/g
         eZBg==
X-Gm-Message-State: AFqh2kq456nanPClrvuPp0+mX7C5hbcoaDYYkc/KyPdJGaDY4dg3T+x8
	QMDqReqk1McbADx4w4Ky96C0rUJ7Zsykc0fT
X-Google-Smtp-Source: AMrXdXtIsVq55xFM1TXfauRZ0Olcu8Fh2eUd4zV2fCWxhsPdeK/jj/SDi8p/SzbMV25wS+yjJqEoiQ==
X-Received: by 2002:a05:6a20:1611:b0:b4:6f9:ef7d with SMTP id l17-20020a056a20161100b000b406f9ef7dmr33569889pzj.35.1674508710356;
        Mon, 23 Jan 2023 13:18:30 -0800 (PST)
Date: Thu, 19 Jan 2023 13:05:09 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [RISC-V] Switch  to H-mode
Message-ID: <Y8lABYJoQ5Qt4DAt@bullseye>
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>

On Mon, Jan 23, 2023 at 06:56:19PM +0200, Oleksii wrote:
> Hi Alistair and community,
> 
> I am working on RISC-V support upstream for Xen based on your and Bobby
> patches.
> 
> Adding the RISC-V support I realized that Xen is ran in S-mode. Output
> of OpenSBI:
>     ...
>     Domain0 Next Mode         : S-mode
>     ...
> So the first my question is shouldn't it be in H-mode?
> 
> If I am right than it looks like we have to do a patch to OpenSBI to
> add support of H-mode as it is not supported now:
> [1]
> https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_domain.c#L380
> [2]
> https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/riscv_encoding.h#L110
> Please correct me if I am wrong.
> 
> The other option I see is to switch to H-mode in U-boot as I understand
> the classical boot flow is:
>     OpenSBI -> U-boot -> Xen -> Domain{0,...}
> If it is at all possible since U-boot will be in S mode after OpenSBI.
> 
> Thanks in advance.
> 
> ~ Oleksii
> 

Ah, what you are seeing there is that the openSBI's Next Mode excludes
the virtualization mode (it treats HS and S synonymously) and it is only
used for setting the mstatus MPP. The code also has next_virt for
setting the MPV but I don't think that is exposed via the device tree
yet. For Xen, you'd want next_mode = PRIV_S and next_virt = 0 (HS mode,
not VS mode). The relevant setup prior to mret is here for interested
readers:
https://github.com/riscv-software-src/opensbi/blob/001106d19b21cd6443ae7f7f6d4d048d80e9ecac/lib/sbi/sbi_hart.c#L759

As long as the next_mode and next_virt are set correctly, then Xen
should be launching in HS mode. I do believe this should be default for
the stock build too for Domain0, unless something has changed.

Thanks,
Bobby

