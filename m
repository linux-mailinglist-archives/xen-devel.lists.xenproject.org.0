Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4EF59C157
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 16:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391446.629277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ855-0001x4-Bj; Mon, 22 Aug 2022 14:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391446.629277; Mon, 22 Aug 2022 14:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ855-0001u9-8f; Mon, 22 Aug 2022 14:07:07 +0000
Received: by outflank-mailman (input) for mailman id 391446;
 Mon, 22 Aug 2022 14:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xx4=Y2=redhat.com=mprivozn@srs-se1.protection.inumbo.net>)
 id 1oQ853-0001u3-C3
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 14:07:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2112173-2223-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 16:07:03 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-UD-Bu1lgNmGI687j6rL2vw-1; Mon, 22 Aug 2022 10:07:01 -0400
Received: by mail-ej1-f69.google.com with SMTP id
 ho13-20020a1709070e8d00b00730a655e173so2750123ejc.8
 for <xen-devel@lists.xenproject.org>; Mon, 22 Aug 2022 07:07:00 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a1709066dd400b007314a01766asm6226395ejt.211.2022.08.22.07.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 07:06:59 -0700 (PDT)
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
X-Inumbo-ID: b2112173-2223-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661177222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzd+yFpmXKessEmYd6mSJD6MR3Z1HQ7dfhPJoA87LPM=;
	b=afHXhJ/QTfL4zTK5iV/ZIVhS3GT1FVUbHyuSJTdKzzGkvIKL2vqI41J32+zvZyXGQmKX37
	B0MG3x75yRQr82CiCNSknw7Lh14SbpKJLRoXYz7IrtEHLBkL0Y9pJMdiKHlzj7t0+HRvoF
	zufum12dNE+D8tQtfD7oPGAo6ZcsXGE=
X-MC-Unique: UD-Bu1lgNmGI687j6rL2vw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dzd+yFpmXKessEmYd6mSJD6MR3Z1HQ7dfhPJoA87LPM=;
        b=b+NqYSOiZHRNP4eD7tb544WxZemSnrGlr6X+QJXRhRWmVtaqVxYYAVz3qV7Rxc5iEO
         mex7HrBazfWuDqEBoS6HoTSDLHEf5GqGJeuLno2pbb4Ep9YAB3rt+1ck9JI8frz4Q1aK
         3bn4yfMpvvrqmER/IPa9U/jRbRvz0ogAWvFXj7Tl3lO849prdsv33pQGKfujsE9RFAYB
         EQL5hA8axjKql9U5aJmjlhJRqbBe+iIKtROkRIdTG5qQmRNz82mFH57Bghr8WviFGBBV
         ZeC1lPsDKHcW/OAQoAIHjXSueiT/JYQkCK2j9pbSK23ILPsB8eDTD740RKToJmej8kiS
         dbfg==
X-Gm-Message-State: ACgBeo0A5eCiRrGC8RDdHTSp1/fOAn0HDuwA70O5SDdziuTewPPQAtlR
	GqkyvM6zYg3l30gMYcA+CeVUbUwQ9LTUrFRjkuyyELW/uR9C9SH3sLFoCIS6KOYjbAh3vQeyODH
	PVb5I9GqAh1otAMnkwHt8VXi1Z2o=
X-Received: by 2002:a05:6402:26cb:b0:43e:6fab:11c6 with SMTP id x11-20020a05640226cb00b0043e6fab11c6mr15854121edd.272.1661177219853;
        Mon, 22 Aug 2022 07:06:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4oMr6vQOJPVoTzKcDHnUiLk/bCQAw8SfK1RO1cmNhAIPSJkoQmu8crcInTDtILuRWRdwuiZQ==
X-Received: by 2002:a05:6402:26cb:b0:43e:6fab:11c6 with SMTP id x11-20020a05640226cb00b0043e6fab11c6mr15854103edd.272.1661177219621;
        Mon, 22 Aug 2022 07:06:59 -0700 (PDT)
Message-ID: <224f4e92-1651-cb44-9bca-92ef023d32dc@redhat.com>
Date: Mon, 22 Aug 2022 16:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, libvir-list@redhat.com
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220729155024.3327364-1-olekstysh@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/22 17:50, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Xen toolstack has gained basic Virtio support recently which becides
> adding various virtio related stuff introduces new disk backend type
> LIBXL_DISK_BACKEND_STANDALONE [1].
> 
> Unfortunately, this caused a regression in libvirt build with Xen support
> enabled, reported by the osstest today [2]:
> 
> CC       libxl/libvirt_driver_libxl_impl_la-xen_xl.lo
> ../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
> ../../src/libxl/xen_xl.c:779:17: error: enumeration value 'LIBXL_DISK_BACKEND_STANDALONE'
>    not handled in switch [-Werror=switch-enum]
>                  switch (libxldisk->backend) {
>                  ^~~~~~
> cc1: all warnings being treated as errors
> 
> The interesting fact is that switch already has a default branch (which ought
> to cover such new addition), but the error is triggered as -Wswitch-enum
> gives a warning about an omitted enumeration code even if there is a default
> label.
> 
> Also there is a similar issue in libxlUpdateDiskDef() which I have reproduced
> after fixing the first one, but it that case the corresponding switch doesn't
> have a default branch.
> 
> Fix both issues by inserting required enumeration item to make the compiler
> happy and adding ifdef guard to be able to build against old Xen libraries
> as well (without LIBXL_HAVE_DEVICE_DISK_SPECIFICATION). Also add a default
> branch to switch in libxlUpdateDiskDef().
> 
> Please note, that current patch doesn't implement the proper handling of
> LIBXL_DISK_BACKEND_STANDALONE and friends, it is just intended to fix
> the regression immediately to unblock the osstest.  Also it worth mentioning
> that current patch won't solve the possible additions in the future.
> 
> [1] https://lore.kernel.org/xen-devel/20220716163745.28712-1-olekstysh@gmail.com/
> [2] https://lore.kernel.org/xen-devel/E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org/
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Cc: Julien Grall <julien@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>
> 
> Please note, the patch is tested on:
> https://xenbits.xen.org/gitweb/?p=libvirt.git;a=shortlog;h=refs/heads/xen-tested-master
> but should work on the master as well (as the same code is present here).
> ---
>  src/libxl/libxl_conf.c | 4 ++++
>  src/libxl/xen_xl.c     | 3 +++
>  2 files changed, 7 insertions(+)

Now that the libxl patch is merged into the master:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=66dd1c62b2a3c707bd5c55750d10a8223fbd577f

I can merge this.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


