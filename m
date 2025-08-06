Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D8B1C701
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 15:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071787.1435154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujeVV-0000JW-Ry; Wed, 06 Aug 2025 13:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071787.1435154; Wed, 06 Aug 2025 13:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujeVV-0000GU-Ou; Wed, 06 Aug 2025 13:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1071787;
 Wed, 06 Aug 2025 13:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujeVU-0000GO-PY
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 13:48:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e1d7268-72cc-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 15:48:38 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so4436942f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 06:48:38 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459c58ececdsm88196085e9.1.2025.08.06.06.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 06:48:37 -0700 (PDT)
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
X-Inumbo-ID: 0e1d7268-72cc-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754488118; x=1755092918; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwjYNfrhNxwfvUl3nWgGhrOpkF7qtjSx02o5Z/rAA9A=;
        b=MnjziP2HkCxNft/Zahor97mpYEVAd3shgFcoWfDLSwpjJye+DMvB3i2XLuuk0qP5XA
         Mf1sSmWPA/laA2JFtB0TVhuxl99XQlU11VhOT1xPI2nv01IU1ebgU1BGFyn9kw44SHBd
         9Wj3/ATw+6m76kRVfm7i4RQV+HdJgz4/nYDjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488118; x=1755092918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwjYNfrhNxwfvUl3nWgGhrOpkF7qtjSx02o5Z/rAA9A=;
        b=SfMzwFlpzQoGyeaoflNivtpJjkLVQ0uvngSnxx+5Swf3kogz6igdMohxq3VTh8vLJl
         TP/Dm31M1N48JjYH/Y4LpeE/f05BOxhuMdDj+oGZW2sldanZUMY3IyoCNf1tDv3VryD0
         0e0EYh0P9Pf9XVokpk0DKtm9PGDM+hXddtaC83YugCNPg5FeJDkU70urV36cykh1C9W1
         fJ33rU2LKC5dMrGHNiUDdhAbLjvh6RpJIAyPtrB1zAbaz9xcZqrHLiHI5qe5Odw4V6U9
         7972hhBWG+f/ENtNpPIgHqq4tU0JRGIWl/KxvYcGJYeXeogvv+Zeans8UH5NdEBUgVwU
         MkXg==
X-Gm-Message-State: AOJu0YzMmL/qOrV/p2zBR8gLQJZ0YLYrSOovWGu+qnNzl4ps22SsnOcJ
	1H/IfCspFZ4FsSnscPCU6YEBxHcSWuDp16HSSTBhUtNqmA1f/FTERBdNg3kZwKWoV7s=
X-Gm-Gg: ASbGncvXTGCdW4r2losHNrER6w+8YwpZh6CeQ6nt+gLmgfT8jGDUgGS3gvktSOR0Be0
	PNyy/ojyad8W6hxML55w6+97L1nYMDXcRkV2Bpu+8JZZHNu3evfgignPwlff7CKTvsI9MpSM23P
	jfwDyPWiv/BohGq3mJ38j7MAkeF3uOxCXkg2vYFrQx9z4CI2safH6yfOkvgPM1pvVYhFbpmwt4x
	U2UbYFYbduOLJKtwHITRUw3V3sf39TxbFBZfv0CSd5+uoA6SePnWuM4/kWRTw96Fu33Qxd2jh0E
	ifqGdyqMEfQD2scY26d49zRKtEk/5EK/8kpbGOg8GkaePFnBw7XXtslqmeMwZrk5G3/Q2HvCzGz
	3X9egnBHek4HsOfTARvDtYsSUTYFxxhqS02qxVZT74A5omXao3rpO+gVSZCcJrmqegQ==
X-Google-Smtp-Source: AGHT+IF4sPMyKHriRBNm45A6/0pKloHFhM/OWo8S3I4qwk63PSXoQzdRgCN/2HXKYVVJlX3IEBOckA==
X-Received: by 2002:a05:6000:4387:b0:3b7:78c8:937f with SMTP id ffacd0b85a97d-3b8f4197fe9mr2324736f8f.20.1754488117922;
        Wed, 06 Aug 2025 06:48:37 -0700 (PDT)
Date: Wed, 6 Aug 2025 15:48:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4 0/8] x86: introduce NS16550-compatible UART emulator
Message-ID: <aJNdNEgCf3QFK_VX@macbook.local>
References: <20250731192130.3948419-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>

On Thu, Jul 31, 2025 at 07:21:37PM +0000, dmkhn@proton.me wrote:
> x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
> guest OS bring up in the embedded setups.
> 
> This patch series introduces initial in-hypervisor emulator for
> NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16550.
> 
> In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
> early guest firmware and OS bringup debugging, because it eliminates
> dependency on the external emulator (qemu) being operational by the time
> domains are created.
> 
> The emulator also allows to forward the physical console input to the x86
> domain which is useful when a system has only one physical UART for early
> debugging and this UART is owned by Xen.
> 
> By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O port
> 0x3f8, IRQ#4 in guest OS (legacy COM1). But all legacy COM resources can be
> selected at built-time (no per-domain configuration yet).
> 
> The NS16550 emulator is disabled in default x86 configuration and goes under
> CONFIG_EXPERT in menuconfig.
> 
> Limitations
> ===========
> - Only x86;
> - Only HVM domains support (build-time), PVH domains are not supported yet;

I'm confused by the above statement, HVM domains always have an
emulated serial provided by QEMU if needed, so I think you got this
backwards, and it should instead be:

- Only PVH domains supported, PV and HVM domains are not supported yet.

?

Thanks, Roger.

