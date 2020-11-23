Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40762C0DA2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34567.65704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCzj-0001f9-TK; Mon, 23 Nov 2020 14:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34567.65704; Mon, 23 Nov 2020 14:39:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCzj-0001ek-PU; Mon, 23 Nov 2020 14:39:07 +0000
Received: by outflank-mailman (input) for mailman id 34567;
 Mon, 23 Nov 2020 14:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dDmC=E5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1khCzi-0001ef-CR
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:39:06 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e5f8726-d788-4e7b-9752-7eb3fed2083d;
 Mon, 23 Nov 2020 14:39:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id f24so5368441ljk.13
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 06:39:05 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x123sm1406452lfa.154.2020.11.23.06.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 06:39:03 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dDmC=E5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1khCzi-0001ef-CR
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:39:06 +0000
X-Inumbo-ID: 3e5f8726-d788-4e7b-9752-7eb3fed2083d
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3e5f8726-d788-4e7b-9752-7eb3fed2083d;
	Mon, 23 Nov 2020 14:39:05 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id f24so5368441ljk.13
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 06:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iLACVdXQ9kDpgteS7S8jPt+5lGYTIBzruTxQ2C6tPk4=;
        b=cZspmf3cAjT2CaNqU0iYH10U+2vKhvKKP3HIwFLrjha4cCoJ4eLEeAEwGfeQwxf+8y
         qTzCEvKUf2+/8aUBslnRxM2e8ehO7sndTTHcUlL2Pvd7WHIQjA5pojs8XmEtvN++eN8v
         bN2/YCDhDXtLVr6F1Y6k7GfRPlWdnSwrkInbfiJRuwjXFtJ2zn0x6u1pbUuQHrxRKVeo
         J6+mz4O9Ovfx2r6aC40oXqo0tLY8Y6wLXvYNhK6TblBLJKSdE54benqHa5yX+sy8QKMi
         +FLCpIVHEVKls5Q3LOkLM0sR2fT3SHYKWqxV5h7jL9JXevrp7WjTpu6PM4k8sx4BdsfB
         x8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iLACVdXQ9kDpgteS7S8jPt+5lGYTIBzruTxQ2C6tPk4=;
        b=KFcd1XFssBzmOkXtvit7S0OS96Ksz6X2kgb2PAHybOmI1O3nKhZj6BlEMUyrRtTSSC
         81VPTlxBBKtQg7erSVVPPCUYvX23olkRG00yHP/sqCnjnbsNes+mEZsSN0chKqWd+CjF
         y7WGJvdS2osQKBbtHNTs5WhbpM+W5Erufrxd6Usz7EZiAuBizx7JS7Hw3wG03Lb7ZOEh
         1lLtS2Uw4jq2BZ2gf8dPlCxWt6K2yqWlbAk8aFpXQkfCQDtPe+LkIt7R+FBEK7amIsa9
         ZwCb2cUV8CJxs82UnAm2bViawqs3KzZNFa2ew4TKgruf3781rqu64ecrjx2Jr/rdvTtP
         K95Q==
X-Gm-Message-State: AOAM532jnTNP3uaHdRf/L+cwhx7+02x7T6NKMbSHT62SFyCaVicPlcK1
	/Ke/9fV3YHHg1Qy+DWoSBC8e1wmZGcY/Ew==
X-Google-Smtp-Source: ABdhPJwXhfHRhMozPV7Sw/jeg7YKbhyp1adzES0tsdUvg/Qi0enhQC6m/0NiGSD2mdTPUoVWJ6MqOg==
X-Received: by 2002:a2e:b536:: with SMTP id z22mr13626210ljm.177.1606142343916;
        Mon, 23 Nov 2020 06:39:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id x123sm1406452lfa.154.2020.11.23.06.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:39:03 -0800 (PST)
Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved
 function names
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-13-git-send-email-olekstysh@gmail.com>
 <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
 <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com>
Message-ID: <04a81b7e-213a-968b-048c-dfa68b6e3b0d@gmail.com>
Date: Mon, 23 Nov 2020 16:39:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3b6623c-683d-2845-78c3-a114193b0ce4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Jan.


As it was agreed, below the list of proposed renaming (naming) within 
current series.

If there are no objections I will follow the proposed renaming. If any 
please let me know.


1. Global (existing):
hvm_map_mem_type_to_ioreq_server     -> ioreq_server_map_mem_type
hvm_select_ioreq_server              -> ioreq_server_select
hvm_send_ioreq                       -> ioreq_send
hvm_ioreq_init                       -> ioreq_init
hvm_destroy_all_ioreq_servers        -> ioreq_server_destroy_all
hvm_all_ioreq_servers_add_vcpu       -> ioreq_server_add_vcpu_all
hvm_all_ioreq_servers_remove_vcpu    -> ioreq_server_remove_vcpu_all
hvm_broadcast_ioreq                  -> ioreq_broadcast
hvm_create_ioreq_server              -> ioreq_server_create
hvm_get_ioreq_server_info            -> ioreq_server_get_info
hvm_map_io_range_to_ioreq_server     -> ioreq_server_map_io_range
hvm_unmap_io_range_from_ioreq_server -> ioreq_server_unmap_io_range
hvm_set_ioreq_server_state           -> ioreq_server_set_state
hvm_destroy_ioreq_server             -> ioreq_server_destroy
hvm_get_ioreq_server_frame           -> ioreq_server_get_frame
hvm_ioreq_needs_completion           -> ioreq_needs_completion
hvm_mmio_first_byte                  -> ioreq_mmio_first_byte
hvm_mmio_last_byte                   -> ioreq_mmio_last_byte
send_invalidate_req                  -> ioreq_signal_mapcache_invalidate

handle_hvm_io_completion             -> handle_io_completion
hvm_io_pending                       -> io_pending


2. Global (new):
arch_io_completion
arch_ioreq_server_map_pages
arch_ioreq_server_unmap_pages
arch_ioreq_server_enable
arch_ioreq_server_disable
arch_ioreq_server_destroy
arch_ioreq_server_map_mem_type
arch_ioreq_server_destroy_all
arch_ioreq_server_get_type_addr
arch_ioreq_init
domain_has_ioreq_server


3. Local (existing) in common ioreq.c:
hvm_alloc_ioreq_mfn               -> ioreq_alloc_mfn
hvm_free_ioreq_mfn                -> ioreq_free_mfn
hvm_update_ioreq_evtchn           -> ioreq_update_evtchn
hvm_ioreq_server_add_vcpu         -> ioreq_server_add_vcpu
hvm_ioreq_server_remove_vcpu      -> ioreq_server_remove_vcpu
hvm_ioreq_server_remove_all_vcpus -> ioreq_server_remove_all_vcpus
hvm_ioreq_server_alloc_pages      -> ioreq_server_alloc_pages
hvm_ioreq_server_free_pages       -> ioreq_server_free_pages
hvm_ioreq_server_free_rangesets   -> ioreq_server_free_rangesets
hvm_ioreq_server_alloc_rangesets  -> ioreq_server_alloc_rangesets
hvm_ioreq_server_enable           -> ioreq_server_enable
hvm_ioreq_server_disable          -> ioreq_server_disable
hvm_ioreq_server_init             -> ioreq_server_init
hvm_ioreq_server_deinit           -> ioreq_server_deinit
hvm_send_buffered_ioreq           -> ioreq_send_buffered

hvm_wait_for_io                   -> wait_for_io

4. Local (existing) in x86 ioreq.c:
Everything related to legacy interface (hvm_alloc_legacy_ioreq_gfn, etc) 
are going
to remain as is.



-- 
Regards,

Oleksandr Tyshchenko


