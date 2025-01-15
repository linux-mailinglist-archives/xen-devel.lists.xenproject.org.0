Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C00A11C87
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 09:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872245.1283203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzCB-00071f-Pj; Wed, 15 Jan 2025 08:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872245.1283203; Wed, 15 Jan 2025 08:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXzCB-0006zM-Mb; Wed, 15 Jan 2025 08:56:15 +0000
Received: by outflank-mailman (input) for mailman id 872245;
 Wed, 15 Jan 2025 08:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZm5=UH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXzC9-0006zG-EJ
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 08:56:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91da539e-d31e-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 09:56:12 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1283013366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 00:56:12 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c913804esm723625766b.84.2025.01.15.00.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:56:11 -0800 (PST)
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
X-Inumbo-ID: 91da539e-d31e-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736931372; x=1737536172; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fioy/FUik1U4ok29Gy4Oa9UKfgKtHdmTQoTlkcW/IFY=;
        b=t4BYtyg9PC/qeTAjVAJzjQ4X4FgiadLO4cgAwyrd7l7F/5NFyVR35lmhI7LppfzmI4
         9Q4/L+I3/1mVyVdcLVIT0iV7IEBhaXamsm21VDZhfVjzrBJd1h2nIGL/sDTALukjn696
         lqAMwYsC1Awy38Nr1RGlLofVlyZUQYVq4PqBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931372; x=1737536172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fioy/FUik1U4ok29Gy4Oa9UKfgKtHdmTQoTlkcW/IFY=;
        b=hF328OHEXJ4k54qWdEmZX1Ad+tMW6nSAun07uW5q/E1sT8u/M+/PLQ886lvtiEQGi+
         X1KKqASwbRvpWd9UM7CY48hUPhQk4d29DuzJfn4Gv1+TxJhBumszumdA1VkwVE43jkXN
         9Ai6PiBTX1+jW9IRmeD6M22FSDOTG1sL1j7m29YSfwtUoSuO15Or7aReUhimBF2NUwYo
         n/Yf9LJ9L35zNoHtxJ3xjjKWVLkjEKJ9v3ozSoCDKV8jBprBR9eOqx+61Ph9VwZxVczD
         xthsZPJIrXzSRzJCdVUwiK49mN2ca917B6sNxk79kW0YlubqoZt/uO/mEdUuxd9cMRpA
         0rng==
X-Forwarded-Encrypted: i=1; AJvYcCUoaH+I8nP+urRWMMQ+Mi63hAw+Y4V6KwZ0oLN5GPEwuG2X2SX1NZbDtgneRyF4veKuG0E9hdaur4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK6M8B425eRb67KahWyCkcr3N6I62JE0xZMh5AIqtx5OWTUbqk
	TsEKw0rAJlnrZQ9JIOGp8EcmgnShqP3lfaE04Yd6fQg+XnCKDA+vq3JF4l+sh9Q=
X-Gm-Gg: ASbGncurwfVHfTuc2gO4+/JIOISvshBPJKk2o2NueN3pTufRHYgJ+G9UCUJUY3LqmL4
	j0/SeL9GYCOXbcc+U60UgZJCBwPC9K8qKMvMhRdQqmlBYO5bo17ooj+G68p3NXILy2vfS7IbUix
	6KEzqK8tfxsOVXOZrjfH4ayq+Ca0ezNuGn9IANQZf1VNNw0XZEAPIcXw9KET60i3YAweLAQ1KH/
	mMRqeb4216qMnhbfhyPcPhcNntOKAP+NPwaChCGSCn8PuTj8dy6CwaOOecKI0MZQDI=
X-Google-Smtp-Source: AGHT+IGe8uDXQGcM0q4llbxcAFJnfhNSgJoCzWBFrsNg0mtR2DuuDm3DrzGUnjQUh3j+tRSzyWYuBQ==
X-Received: by 2002:a17:907:2dac:b0:aa6:7785:5485 with SMTP id a640c23a62f3a-ab2abc6e1c7mr2466889066b.38.1736931371685;
        Wed, 15 Jan 2025 00:56:11 -0800 (PST)
Date: Wed, 15 Jan 2025 09:56:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
Message-ID: <Z4d4KXMOtmfOOq8i@macbook.local>
References: <20250114174345.60887-1-roger.pau@citrix.com>
 <e55b8b77-e97d-4952-a995-b566e7974da6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e55b8b77-e97d-4952-a995-b566e7974da6@suse.com>

On Wed, Jan 15, 2025 at 09:19:29AM +0100, Jan Beulich wrote:
> On 14.01.2025 18:43, Roger Pau Monne wrote:
> > If randconfig enables coverage support the build times out due to GNU LD
> > taking too long.  For the time being prevent coverage from being enabled in
> > clang randconfig job.
> 
> Just curious: How long is "too long" in this case?

Left it for >30min stuck on the final linker invocation IIRC and it
hadn't finished, so no idea really.  This was also running on a docker
x86-64 container on my ARM mac, so there was an extra layer of
emulation.

Thanks, Roger.

