Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF42B3BECC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 17:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101553.1454576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us0cV-0005CB-I8; Fri, 29 Aug 2025 15:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101553.1454576; Fri, 29 Aug 2025 15:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us0cV-000592-Ep; Fri, 29 Aug 2025 15:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1101553;
 Fri, 29 Aug 2025 15:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1us0cU-00058w-42
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 15:02:26 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bf53702-84e9-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 17:02:25 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so13247205e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 08:02:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b66f2041fsm77290215e9.5.2025.08.29.08.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 08:02:23 -0700 (PDT)
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
X-Inumbo-ID: 2bf53702-84e9-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756479744; x=1757084544; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ST6YNRFELq/hjQgJY634VvpZZNEM0BlNvbA1PsxLPws=;
        b=tZLfGY3lh2L+c4so/4z13O7tgA67uZnkCSStVkEbE4r/qN7/x+0MjZpeRWpyqkS/ig
         xmnFt9Ye70l968zrZe0l81aEaz9SK5gRcFGx8bNusKGJT/nHjLX+nX0yALKpgLwgGTyo
         rl2BX7hRzb89Eg0tjNpnXocq7FhmR3CrccuoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756479744; x=1757084544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ST6YNRFELq/hjQgJY634VvpZZNEM0BlNvbA1PsxLPws=;
        b=Sv0axPTauxRhCOsEXaAYLsa+evhNNviwLsqTnAl0Ducp6nmW9fOjwni4mGVR0X6YRj
         Nskc1wjO81ZPk8/y9RijoQSwGRMyeSAG/baPm8EFlMfbOIKH85MaWPq/anrImfSNIUiw
         +hdjxL3hlwc4nEZDZHo0xB82LR+TNTKVrcrPTCaLSa+qqhWa6MmasM6RI4g6mlfVx6l/
         x6GkNVBnyIOYAfjtluaiL9MuyeXH594CzvbqOxkiWMqtAtq+2xmUVRB/bAe1b5DUIcEb
         AeNAYKCUwyhi2tfNKwViQ9UUjnzhTs3r8iYB+6Ita3HcGkofrlgFYtdAr6gChK2yPjRS
         GKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnE3htIFF27D7gkeAkkIdahGucUYCJBWl1NwzBurWER0cQFn9IrHAMon0nJbfTBDwWh6uM0WXipNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBAd/PSMojB0yzhffv9Itkay2RKLXS/L2hHTFELn8zz7JN9rkC
	zIyQUGLLjNap3ApIxxTA0cGx6cJa5DK+T+tAMFlQGV0lnI6AelVB1E9sO5o2Fwsu8Lg=
X-Gm-Gg: ASbGncsSRCyYDpThosnHODlyRDV+W7W0g3RAXTNFiaGA8x+/evvcIzDH4z2Iex8PC7X
	T13xs8xV4cpL+C+QFPaVk8uKmm3oELbrQgZe8NN2V5I1Vnp0nCqCIrJMw30u8nEAD53Y9i7sjJh
	M5QZ5Kf7UsLsBMpRPk4cUPkL7LoedAoiC8VgAa+iPnVKtZSuXevJuW1x+QNfxtt/+moNCU3h2ai
	nqRMOSMcOx1LOplWIruu7s6z1LicAFSNjUAkRSwtjpUuL0DmDqiUYNMW+stZb8+L/4uVku7jXOS
	NH8lj1sPYx3KX4NvD5zBI9iTIW58A/mYy9K62kQaYfmhDPWrrKdfHQo/6oemwKl3sLa32xdAsdQ
	/UlLe/WFCpuYudtKZhiWq2oDrXDcGyOH+l3gDpCWFaKppcUF/msDj9jSQH6+xhJUGvQ==
X-Google-Smtp-Source: AGHT+IESjg3c2yY+iw56fE5HMoRUnAu0wS8fYnTCMNu+gitNHQOsgAThzDuk10C6mpT7k7DHWtQ4CA==
X-Received: by 2002:a05:600c:a49:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-45b517ad6b4mr237168965e9.11.1756479744324;
        Fri, 29 Aug 2025 08:02:24 -0700 (PDT)
Date: Fri, 29 Aug 2025 17:02:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 4/5] symbols: centralize and re-arrange $(all_symbols)
 calculation
Message-ID: <aLHA_uhVW8FUedvf@Mac.lan>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <5a77bb51-22d1-4956-8e45-c2412c413766@suse.com>
 <f44709be-62a9-4932-b550-cf5446d4bf1c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f44709be-62a9-4932-b550-cf5446d4bf1c@amd.com>

On Wed, Aug 27, 2025 at 09:05:59PM -0400, Jason Andryuk wrote:
> On 2025-04-02 09:59, Jan Beulich wrote:
> > For one there's no need for each architecture to have the same logic.
> > Move to the root Makefile, also to calculate just once.
> > 
> > And then re-arrange to permit FAST_SYMBOL_LOOKUP to be independent of
> > LIVEPATCH, which may be useful in (at least) debugging.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

