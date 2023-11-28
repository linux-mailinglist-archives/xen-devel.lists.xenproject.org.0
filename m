Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18207FBBD2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643185.1003152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yPI-0002jw-IA; Tue, 28 Nov 2023 13:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643185.1003152; Tue, 28 Nov 2023 13:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yPI-0002gj-En; Tue, 28 Nov 2023 13:45:44 +0000
Received: by outflank-mailman (input) for mailman id 643185;
 Tue, 28 Nov 2023 13:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7yPH-0002gd-0b
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:45:43 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c2eee6f-8df4-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 14:45:42 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so73144861fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 05:45:42 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j7-20020adfb307000000b00332e7f9e2a8sm13078868wrd.68.2023.11.28.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 05:45:41 -0800 (PST)
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
X-Inumbo-ID: 6c2eee6f-8df4-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701179142; x=1701783942; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3rUWUcdB+WQweqZXYQTQrCKKFGe23g2y7ByGOVDn7ME=;
        b=giGxnKNvmqgfsPTC5wgo6wxZcZ9AL+bbICvlpCkGgvKHXVeNfW8Hk49K3MjRaOOebz
         2NfcP9yJhgOBaZBQTzC5GjFswhHuQkSfjatNQMhE1UqtzO4fXfwTrO4rkqYZkI2XMjW9
         SdWDQ43UPLnG77BSXZNvFPF4KBGqFCsJecK3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701179142; x=1701783942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rUWUcdB+WQweqZXYQTQrCKKFGe23g2y7ByGOVDn7ME=;
        b=T7yCXrqUXHvxYMP2Z7rnAV7gbs4lGv59iUFHJnhT8zTj0rmD9V6oWD7dM+DAe6vQjZ
         K48vQBPzgVdxwEKXLrsII56YvxnZ4DVDFArde00DYoc8oP7ntkrVmCfxj+U+dfmBoBNf
         Tm3cmKeIIQcgtIV93lxCRHhXANmkjljUX7AtIpdVMBglv6qwSl4frM/zG+7Yc4Jx0P4b
         PV+DTQwQZr1eIuplraUjoDbTU+HS3w+jit5RMfdv2eu9PFf+uk9wFHeKRyd6uTt6YRFT
         VExs9yaAhi1cJfwcVGBOOOmudjuO7fL8V6/lL4LUgf6zGpkZwmDJIU5mSnRiDtffoJui
         lpDw==
X-Gm-Message-State: AOJu0Yzo3oiNY7es6niKmX+Xv+fR30gi7rxfgn+dPelkdlUOdOtxyp74
	nloKO3w46ESaJ+clePE4IESZ+Q==
X-Google-Smtp-Source: AGHT+IG6D8Qy6gaB4FUb0SPHvXncstWn2vLfAbxXfk0upCgFrCU4UcZY+yhJLRGEYfYXCt+3K9pQJA==
X-Received: by 2002:a2e:bb0f:0:b0:2c9:9584:4e4a with SMTP id v15-20020a2ebb0f000000b002c995844e4amr6043440lje.10.1701179141802;
        Tue, 28 Nov 2023 05:45:41 -0800 (PST)
Date: Tue, 28 Nov 2023 14:45:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+freebsd@m5p.com>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>,
	Mario Marietto <marietto2008@gmail.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Message-ID: <ZWXvBMaRJ5Lbb5S9@macbook>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
 <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>

On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrote:
> BTW Roger Pau Monné, now that Xen 4.18 is out, take a look at the
> "royger" branch?

I've pushed a bunch of those, there are still some, I've made comments
on the branch.

I think there isn't much left after the swept I've done.

If you can rebase and reply to the comments I will take a look at
what's remaining.

Regards, Roger.

