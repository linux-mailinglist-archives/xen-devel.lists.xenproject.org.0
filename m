Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF54431FA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220374.381629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvz4-0003Jx-Lc; Tue, 02 Nov 2021 15:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220374.381629; Tue, 02 Nov 2021 15:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvz4-0003HO-IW; Tue, 02 Nov 2021 15:45:58 +0000
Received: by outflank-mailman (input) for mailman id 220374;
 Tue, 02 Nov 2021 15:45:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a05+=PV=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mhvz3-0003HH-IR
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:45:57 +0000
Received: from mail-qt1-x82a.google.com (unknown [2607:f8b0:4864:20::82a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c12ecff-fef3-444d-9355-ba569bcfdc39;
 Tue, 02 Nov 2021 15:45:56 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id n2so19262107qta.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Nov 2021 08:45:56 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y8sm12807287qko.36.2021.11.02.08.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:45:55 -0700 (PDT)
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
X-Inumbo-ID: 7c12ecff-fef3-444d-9355-ba569bcfdc39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oBZS+B5OI/pNOurVNUNmHTLzU1LJ6vGeGI0SMtDtTqA=;
        b=ZxvXyZ8G6um96czYq5NWq0JwiA0h3KQZiPg6jRZHGNFHRPslxY+VDPyuTaCEHNUULy
         +pkbJHwaI9jQjaIW8qRyVebYqe2MOnXFruS8bmWxt5KLy3IZ+0AFirfA/DLeUcEl4HIX
         TRgpSA0mp0MdbHJSKO7qkEMITA6Dw2dfICBp3n7qqNf/sBb+gB8edfdhV911nOhAOwHH
         B6snqjnx7hhz3hn1quZHjYRnFA8fZTSIRSu4V/8qL24ItahLZWErZc2Foql8ePgzC/Vz
         +nYzVDZGlH30T0pNHhnmKVJBhUCmIs7aHmo7nDOe0zezTbMGPCuSmMyaFmLIFYCq83rR
         pJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oBZS+B5OI/pNOurVNUNmHTLzU1LJ6vGeGI0SMtDtTqA=;
        b=DSjSeT+cJZXE+4FHRNwxHRj6CPk8L4y1jlmVXw9xKGJo2XjYLadmU3Ksisp7EgbZNj
         uPftHC14QA81yre0WjEUza4syRT5dTm+tqef/7TslUvDLv/U7twVWwE7ldUnTpYnpH/s
         BJ8MuDoKikUCbGg1kXPGHyedGmSl8Yyfbss0bqtxdqu/2BBA+5Wbvf7BqU9TOWNAnZiT
         oYZExxEramiKRH4ZcewfL4Ggjym8t3VdJGW3iojCotO3i05iMYqoEBuLQ5zGwBBh5OfS
         vLCk2PRJ4N1SswT6Sve3eNax0YU7YfLgwxBswcEFWucOwgV1P7+QUdJMaLt8VoBMh1aC
         OMuQ==
X-Gm-Message-State: AOAM532nmRRg3xbffY1e4fHx9q1xoe9lksoBHEXXXb274k3//0uhStia
	OxLy+j+qwFecM3nPqAscMiGNhg==
X-Google-Smtp-Source: ABdhPJx7asEmjavQwNXvLHtTNJJ4FS8uJKsNMq8MaQoG0lRsFCuUBJcFIhC2E0gsV2D1s47hX+9AHg==
X-Received: by 2002:ac8:7f11:: with SMTP id f17mr31747889qtk.389.1635867956240;
        Tue, 02 Nov 2021 08:45:56 -0700 (PDT)
Subject: Re: [PULL 00/20] Migration 20211031 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake
 <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, kvm@vger.kernel.org, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20211101220912.10039-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <709cabc0-95c3-27dd-e2ae-8834fc7b36b3@linaro.org>
Date: Tue, 2 Nov 2021 11:45:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/1/21 6:08 PM, Juan Quintela wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/juanquintela/qemu.git tags/migration-20211031-pull-request
> 
> for you to fetch changes up to 826b8bc80cb191557a4ce7cf0e155b436d2d1afa:
> 
>    migration/dirtyrate: implement dirty-bitmap dirtyrate calculation (2021-11-01 22:56:44 +0100)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> this includes pending bits of migration patches.
> 
> - virtio-mem support by David Hildenbrand
> - dirtyrate improvements by Hyman Huang
> - fix rdma wrid by Li Zhijian
> - dump-guest-memory fixes by Peter Xu
> 
> Pleas apply.
> 
> Thanks, Juan.
> 
> ----------------------------------------------------------------
> 
> David Hildenbrand (8):
>    memory: Introduce replay_discarded callback for RamDiscardManager
>    virtio-mem: Implement replay_discarded RamDiscardManager callback
>    migration/ram: Handle RAMBlocks with a RamDiscardManager on the
>      migration source
>    virtio-mem: Drop precopy notifier
>    migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the
>      destination
>    migration: Simplify alignment and alignment checks
>    migration/ram: Factor out populating pages readable in
>      ram_block_populate_pages()
>    migration/ram: Handle RAMBlocks with a RamDiscardManager on background
>      snapshots
> 
> Hyman Huang(é»„å‹‡) (6):
>    KVM: introduce dirty_pages and kvm_dirty_ring_enabled
>    memory: make global_dirty_tracking a bitmask
>    migration/dirtyrate: introduce struct and adjust DirtyRateStat
>    migration/dirtyrate: adjust order of registering thread
>    migration/dirtyrate: move init step of calculation to main thread
>    migration/dirtyrate: implement dirty-ring dirtyrate calculation
> 
> Hyman Huang(黄勇) (2):
>    memory: introduce total_dirty_pages to stat dirty pages
>    migration/dirtyrate: implement dirty-bitmap dirtyrate calculation
> 
> Li Zhijian (1):
>    migration/rdma: Fix out of order wrid
> 
> Peter Xu (3):
>    migration: Make migration blocker work for snapshots too
>    migration: Add migrate_add_blocker_internal()
>    dump-guest-memory: Block live migration
> 
>   qapi/migration.json            |  48 ++++-
>   include/exec/memory.h          |  41 +++-
>   include/exec/ram_addr.h        |  13 +-
>   include/hw/core/cpu.h          |   1 +
>   include/hw/virtio/virtio-mem.h |   3 -
>   include/migration/blocker.h    |  16 ++
>   include/sysemu/kvm.h           |   1 +
>   migration/dirtyrate.h          |  21 +-
>   migration/ram.h                |   1 +
>   accel/kvm/kvm-all.c            |   7 +
>   accel/stubs/kvm-stub.c         |   5 +
>   dump/dump.c                    |  19 ++
>   hw/i386/xen/xen-hvm.c          |   4 +-
>   hw/virtio/virtio-mem.c         |  92 ++++++---
>   migration/dirtyrate.c          | 367 ++++++++++++++++++++++++++++++---
>   migration/migration.c          |  30 +--
>   migration/postcopy-ram.c       |  40 +++-
>   migration/ram.c                | 180 ++++++++++++++--
>   migration/rdma.c               | 138 +++++++++----
>   softmmu/memory.c               |  43 +++-
>   hmp-commands.hx                |   8 +-
>   migration/trace-events         |   2 +
>   softmmu/trace-events           |   1 +
>   23 files changed, 909 insertions(+), 172 deletions(-)

Applied, thanks.

r~


