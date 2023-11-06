Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A57E294A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628185.979368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r022b-0004Zm-QB; Mon, 06 Nov 2023 16:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628185.979368; Mon, 06 Nov 2023 16:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r022b-0004Wi-NM; Mon, 06 Nov 2023 16:01:29 +0000
Received: by outflank-mailman (input) for mailman id 628185;
 Mon, 06 Nov 2023 16:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jw9=GT=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r022a-0004WZ-Dl
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:01:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdf8ac37-7cbd-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 17:01:27 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso2692238f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 08:01:27 -0800 (PST)
Received: from [10.95.110.31] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a5d5043000000b0032dba85ea1bsm9838958wrt.75.2023.11.06.08.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 08:01:24 -0800 (PST)
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
X-Inumbo-ID: bdf8ac37-7cbd-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286487; x=1699891287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuSTMH9ud0jYjriaosHkWWyigJusFLw9itadu/Ef8us=;
        b=JgkfHWDroRTgYtyz025MUkLawCxbPatDY9M3ncIsqZ61SBqCTUbmx525lRQdiLn8xP
         9PgUxD1bBFeCzYdMUws5O1RhOMU+EXyHzq+AvHs91mpiVrmvqkScP8JdWqLuThQXgHhs
         ujEcN04/62Q5gwaKp/0tAJzpP5BXvpjMCOqXYuZpMxtethSq7WTpczBqiBMolO+lE4gz
         SQu6xr4nGbNnUXG52fhQDyBWJT6+Toa9tezrxAWqWNXbRQStbJGO5b5LJPKYFrpj8Mjy
         j65A/6e8PzwRsHWMXO1D5DE0+UpGSCEJbX/xpP2P1zxTydPyzWwbC6ffANCrvR+ldzO4
         lVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286487; x=1699891287;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuSTMH9ud0jYjriaosHkWWyigJusFLw9itadu/Ef8us=;
        b=A4d7VFXAf+Zmlx63HGY0S5qNWFBgXWAxXk6Qe9idUoNHvwuDAaxN2AmwCzUJTOcJgE
         ipHStsoC7IZJZzSTwtm/kiUiln1Xrj4kx/pXTuRzUVxaHeNixRUhUXG9W9M2wYXKpop4
         Y/470GDg5lLo3EK451KMu1lAJ0Fy8nuYBJa40LV6ySMWBQ0t8rrSy3eV5rrZVvlt0725
         +dQXocSHLCJtBTpJ31O6fEWcmeMGykfeW+ywOjV1xw4rnJhiCpSDyIUaTg8uvSravN3q
         8fpg68EWIt5t9ZRluSIXQg69POkrqwhZgJfcNzwAz8XJRAmmAfgpqEgOHn4h9QHAx51j
         ZSkA==
X-Gm-Message-State: AOJu0YzBP3QysbUSrqjUtcjLU/JIvLdcWvBSImRzjFG8mUGvKSz6JGho
	61KN4oQhTtWSl7vfDW3t6SQ=
X-Google-Smtp-Source: AGHT+IE+3PRRsyWElc9zPvKSrIuMWGE4WXTjXvI2QsMrBJiC6CPa5U2EB5CV13HsYIol7JDB6fOz+Q==
X-Received: by 2002:a5d:6485:0:b0:32f:a7d5:4ef with SMTP id o5-20020a5d6485000000b0032fa7d504efmr11943384wri.44.1699286486710;
        Mon, 06 Nov 2023 08:01:26 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <71dc2018-9840-458e-8ca6-3cb8ab86666d@xen.org>
Date: Mon, 6 Nov 2023 16:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v4 13/17] hw/i386/pc: support '-nic' for xen-net-device
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231106143507.1060610-1-dwmw2@infradead.org>
 <20231106143507.1060610-14-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231106143507.1060610-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2023 14:35, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The default NIC creation seems a bit hackish to me. I don't understand
> why each platform has to call pci_nic_init_nofail() from a point in the
> code where it actually has a pointer to the PCI bus, and then we have
> the special cases for things like ne2k_isa.
> 
> If qmp_device_add() can *find* the appropriate bus and instantiate
> the device on it, why can't we just do that from generic code for
> creating the default NICs too?
> 
> But that isn't a yak I want to shave today. Add a xenbus field to the
> PCMachineState so that it can make its way from pc_basic_device_init()
> to pc_nic_init() and be handled as a special case like ne2k_isa is.
> 
> Now we can launch emulated Xen guests with '-nic user'.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/pc.c             | 11 ++++++++---
>   hw/i386/pc_piix.c        |  2 +-
>   hw/i386/pc_q35.c         |  2 +-
>   hw/xen/xen-bus.c         |  4 +++-
>   include/hw/i386/pc.h     |  4 +++-
>   include/hw/xen/xen-bus.h |  2 +-
>   6 files changed, 17 insertions(+), 8 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


