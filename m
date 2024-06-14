Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C190848E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 09:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740438.1147533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI1G7-0005E5-Ty; Fri, 14 Jun 2024 07:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740438.1147533; Fri, 14 Jun 2024 07:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI1G7-0005Bn-RL; Fri, 14 Jun 2024 07:22:03 +0000
Received: by outflank-mailman (input) for mailman id 740438;
 Fri, 14 Jun 2024 07:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HBj=NQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sI1G6-0005Bh-Df
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 07:22:02 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9f74736-2a1e-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 09:22:00 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-795502843ccso109971485a.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 00:22:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc7f3sm120444685a.43.2024.06.14.00.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 00:21:58 -0700 (PDT)
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
X-Inumbo-ID: c9f74736-2a1e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718349719; x=1718954519; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnoCCgRLyUWwUMYn4tudG1mI7YQwgMQiGD4YRa1Vi9o=;
        b=q2Vnj45uMtUipqyJgEmysKNfb0PT4SrkCMSLGnG+oS5QL6ICAjoiJG6gX+apR77osi
         ZE9Z2pLNzRYgpgRv6UR2p/SULRUXrPx7z1Vwj1sOmo6LIH+ejm23A+2GSHpL1oDh9kPl
         l0N8RTxtyqhVrO0B77HYnaGNPOnn/cx8YHeKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349719; x=1718954519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnoCCgRLyUWwUMYn4tudG1mI7YQwgMQiGD4YRa1Vi9o=;
        b=JuDv8wF3r7AzIANqrwwk2QTfdj3D2wy8CKBE0775zli7ZXg0+uUsqtHu/MIqQCA6Sf
         dNkVQ44y6bymP9fXWNaDI0sizETEboV5v95UQ3VZIp8Lg0/jXx2w80N/uUx1Mj33zFXO
         MlE2by0FSkATekvyD3TWAIts3ER+FmlAn/alKo4b7pZHCGvJzU6SgONl3T7JPbJR1J4F
         77+iPoJLKfTHNttsvYFz0ucq6AWNUa4oUFJmMWqfNYWmVvvXZUC2NN1UqX894gysShvj
         oo7FpVCvChMorQY7V24FwiY3zqfUADbShy4465cITqTiCGk+jRzkv3qDda/Xlrmc45fP
         TWbg==
X-Forwarded-Encrypted: i=1; AJvYcCVxgJmoGLp2WFKW9obw7phj4ICubvVMk4p/CdtrUp2rQ/wg3fyLuZeObdPou45pncj1ppc/WVmPYxYlCyrs/Z20XqxWhgFaHOqfbE9Q+Ug=
X-Gm-Message-State: AOJu0YxDOAtJgpWRKVjV37vGIi9VI3dznTkWVsKvd5CoUbHadJfML2bc
	MyizQthKMEzS7WHFbkS0VOMsqKig5zt1AA02R1JoEBYFuIcSjLMjeez7qhSka3A=
X-Google-Smtp-Source: AGHT+IHzw1zT/HmxBawCcIN4QJBKG3tS7vWSqr0CxQK7aIDCn4R1d0MSgfhp4uh2oDx99x237P0VtQ==
X-Received: by 2002:a05:620a:1919:b0:797:b1ea:953b with SMTP id af79cd13be357-798d23e6988mr192231985a.4.1718349719003;
        Fri, 14 Jun 2024 00:21:59 -0700 (PDT)
Date: Fri, 14 Jun 2024 09:21:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZmvvlF0gpqFB7UC9@macbook>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>

On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> > GPU acceleration requires that pageable host memory be able to be mapped
> > into a guest.
> 
> I'm sure it was explained in the session, which sadly I couldn't attend.
> I've been asking Ray and Xenia the same before, but I'm afraid it still
> hasn't become clear to me why this is a _requirement_. After all that's
> against what we're doing elsewhere (i.e. so far it has always been
> guest memory that's mapped in the host). I can appreciate that it might
> be more difficult to implement, but avoiding to violate this fundamental
> (kind of) rule might be worth the price (and would avoid other
> complexities, of which there may be lurking more than what you enumerate
> below).

My limited understanding (please someone correct me if wrong) is that
the GPU buffer (or context I think it's also called?) is always
allocated from dom0 (the owner of the GPU).  The underling memory
addresses of such buffer needs to be mapped into the guest.  The
buffer backing memory might be GPU MMIO from the device BAR(s) or
system RAM, and such buffer can be paged by the dom0 kernel at any
time (iow: changing the backing memory from MMIO to RAM or vice
versa).  Also, the buffer must be contiguous in physical address
space.

I'm not sure it's possible to ensure that when using system RAM such
memory comes from the guest rather than the host, as it would likely
require some very intrusive hooks into the kernel logic, and
negotiation with the guest to allocate the requested amount of
memory and hand it over to dom0.  If the maximum size of the buffer is
known in advance maybe dom0 can negotiate with the guest to allocate
such a region and grant it access to dom0 at driver attachment time.

One aspect that I'm lacking clarity is better understanding of how the
process of allocating and assigning a GPU buffer to a guest is
performed (I think this is the key to how GPU VirtIO native contexts
work?).

Another question I have, are guest expected to have a single GPU
buffer, or they can have multiple GPU buffers simultaneously
allocated?

Regards, Roger.

