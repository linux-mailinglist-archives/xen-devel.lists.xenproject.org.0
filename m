Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED985F654
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 11:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684329.1064103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6nA-00045J-1p; Thu, 22 Feb 2024 10:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684329.1064103; Thu, 22 Feb 2024 10:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6n9-000433-Uy; Thu, 22 Feb 2024 10:59:03 +0000
Received: by outflank-mailman (input) for mailman id 684329;
 Thu, 22 Feb 2024 10:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gCR=J7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rd6n8-00042x-Ga
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 10:59:02 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62f10988-d171-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 11:59:01 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d23a22233fso50312511fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 02:59:01 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 lb7-20020a056214318700b0068f11ceb309sm1379613qvb.128.2024.02.22.02.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:59:00 -0800 (PST)
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
X-Inumbo-ID: 62f10988-d171-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708599541; x=1709204341; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yrRVt+FqIt1XO7ECPMcpBijREWcbS9Su+cJM3EM6zJ4=;
        b=A2tPpPz2LYhvV/NdFavv9pQlqZWBw/O4G9yj14vSIk0UxHLoLRqMweyYwaX0YHOdya
         KJmH8Xq3fPRKciz3dgLU/Wv2UxmaWFDvNorAn/JrVASTaRI83+a3wCVjar+tEmOI86qa
         yevRVb9b/In9hY3fiX0AHEo0NnZamhhla3+M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599541; x=1709204341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrRVt+FqIt1XO7ECPMcpBijREWcbS9Su+cJM3EM6zJ4=;
        b=Ijv4qQiK3oHX+BAer60dRpuGEU4HZFBLNCwyrkXOBcOGmvSIHhYgUUUfjRlsQNb2Nj
         VJ8LasCA7G7h6HallJtw+iV5rCv49ymReEYRt31CIIfiSdCAPJVUFMvLp6u5HfwB+lnB
         fDSKqVoST+D/4ETaEi9cKfqASvzgpy9OBaL5R17+Gp3Qdy/dw+8siuLBLY9pkZ00GycV
         UsygIVTeEIjnU4HD3MKRREDKwLs0/gFHvF5GOiEUH4QJOFUMlgzXiuB47RHFol5nTbnA
         hzuxjHDhZWScQtBTgQfyA9olK620hHL0jL96P7tMb4Jqc6cBdDkEiNxVo4udk26KZBfz
         bWqg==
X-Forwarded-Encrypted: i=1; AJvYcCUIpMo6rkodga3vwMVyMxH/dHiVbmEx7LBo6h0yq8AGf7QEWb4lSpSDmZKyTbQrHoGEuYxvuQYIfvosS4rAsjA68c8HMuA1u4JBMpSt7TE=
X-Gm-Message-State: AOJu0YzmeeKLa0IUtr7YxZDM4l/tgoe0fabl0U/otR3EzrYC5AWo7HWs
	CqaLqI7fFxid7hQmC9OBmfW7zi3Nv+Bv7dJvAZRLKappa0e17GoURkzp7ht3XN8=
X-Google-Smtp-Source: AGHT+IGOGez26HBWMgpC2gmOJYPEEoH2zUil/w2k/Z1ofT8g18Ynzm2Rm56n99MBDV8ZVfhf/2Xkng==
X-Received: by 2002:a05:6512:4cd:b0:512:c802:7a9 with SMTP id w13-20020a05651204cd00b00512c80207a9mr4756736lfq.38.1708599541199;
        Thu, 22 Feb 2024 02:59:01 -0800 (PST)
Date: Thu, 22 Feb 2024 11:58:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hpet: use an atomic add instead of a cmpxchg loop
Message-ID: <Zdco8nMu2N4WDWwx@macbook>
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-3-roger.pau@citrix.com>
 <d37335f7-ae3c-4dc8-854a-625df275f5da@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d37335f7-ae3c-4dc8-854a-625df275f5da@suse.com>

On Thu, Feb 22, 2024 at 11:10:54AM +0100, Jan Beulich wrote:
> On 22.02.2024 10:05, Roger Pau Monne wrote:
> > The usage of a cmpxchg loop in hpet_get_channel() is unnecessary, as the same
> > can be achieved with an atomic increment, which is both simpler to read, and
> > avoid any need for a loop.
> > 
> > Note there can be a small divergence in the channel returned if next_channel
> > overflows, but returned channel will always be in the [0, num_hpets_used)
> > range, and that's fine for the purpose of balancing HPET channels across CPUs.
> > This is also theoretical, as there's no system currently with 2^32 CPUs (as
> > long as next_channel is 32bit width).
> 
> The code change looks good to me, but I fail to see the connection to
> 2^32 CPUs. So it feels like I'm missing something, in which case I'd
> rather not offer any R-b.

The purpose of hpet_get_channel() is to distribute HPET channels
across CPUs, so that each CPU gets assigned an HPET channel, balancing
the number of CPUs that use each channel.

This is done by (next_channel++ % num_hpets_used), so the value of
next_channel after this change can be > num_hpets_used, which
previously wasn't.  This can lead to a different channel returned for
the 2^32 call to the function, as the counter would overflow.  Note
calls to the function are restricted to the number of CPUs in the
host, as per-CPU channel assignment is done only once (and the channel
is then stored in a per-cpu variable).

Feel free to adjust the commit message if you think all this is too
much data, or too confusing.

Thanks, Roger.

