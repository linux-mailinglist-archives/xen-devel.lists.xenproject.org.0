Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7206B58664C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 10:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378546.611778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQiX-0004Eq-9M; Mon, 01 Aug 2022 08:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378546.611778; Mon, 01 Aug 2022 08:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIQiX-0004BS-5v; Mon, 01 Aug 2022 08:24:01 +0000
Received: by outflank-mailman (input) for mailman id 378546;
 Mon, 01 Aug 2022 08:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0wp=YF=redhat.com=mprivozn@srs-se1.protection.inumbo.net>)
 id 1oIQiU-0003v5-Db
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 08:23:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48bab43f-1173-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 10:23:57 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-05jKX2-hOR64yGZMb_Z4cg-1; Mon, 01 Aug 2022 04:23:51 -0400
Received: by mail-ej1-f70.google.com with SMTP id
 jg29-20020a170907971d00b0072b5acf30e7so2701790ejc.8
 for <xen-devel@lists.xenproject.org>; Mon, 01 Aug 2022 01:23:51 -0700 (PDT)
Received: from [10.43.2.88] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a1709063c5700b007306ae5bb1esm1609916ejg.82.2022.08.01.01.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 01:23:49 -0700 (PDT)
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
X-Inumbo-ID: 48bab43f-1173-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659342235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMTELn9ab6+BDLW6VAWqoAU6j1a+vQbb+26p9hBa/Fk=;
	b=SdWvsETP36trFBrt+pHdLBSkgvOO+/QflpMBYWf5R34xp8Zuy1GEkUjL0XboSd4u7+7AOW
	lv3REf2yay+IAAQB6+yLxkfzpXss2ZFylcqhNo+Uy7+rufOuy/rr1454kcBF1vgLxqS1vV
	OJmMrp1J3xI2UGxgwgqa3MS7lPonJZg=
X-MC-Unique: 05jKX2-hOR64yGZMb_Z4cg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kMTELn9ab6+BDLW6VAWqoAU6j1a+vQbb+26p9hBa/Fk=;
        b=s3PLEphlIpiiiYTqgxSfUnc0RCVKxRCZv2uuflWux6IKhKMOourHBhe/E7CnjU3Qkt
         zDrP00Tk5NatehDPIAChwN44djiPXc3BMUX688sUjxhURL63eU3yJtjrm+MHVEq5F8WJ
         RhXVkJliwwnQ2uu6rHoHF1teSJBLAR4he5nni8jjHG+c6K941OJ3/GY9UvSfStzxLzlj
         1q8vqHGG9D6WkmEI5aWGhjomOcMNPnTmGCPZ2D5h1ojmaESqDcRzHKjp8I/uZ0/Q2NPC
         3Z7ZuhyVHqhFD48AdBFVXSaJKsvCNdvD3JwYx70Lmd6csK2NZ3G0MVb41hWkfYzrlHPM
         zWPA==
X-Gm-Message-State: ACgBeo1f8nr16r62mL76BddKPDtjqZpdofW71toMqsP+6H6VGyuexTay
	U2XAlAPAgaNaIcnyA7cNYp6o9y6qJFi+iwAHPrhtTIJoXgDdFGwckOJCXhAhg8kAMiLSYVEVhaM
	rJAfLJFehOJidopQlj0oeMbbrtAQ=
X-Received: by 2002:aa7:de18:0:b0:43d:30e2:d22b with SMTP id h24-20020aa7de18000000b0043d30e2d22bmr12508395edv.224.1659342230743;
        Mon, 01 Aug 2022 01:23:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Cy8ahha4aOOY55MkaIlnpdducGMeE2Et5rOc9u7XrKkLcG9XnieyoqipC0XQVab+yJm3BQw==
X-Received: by 2002:aa7:de18:0:b0:43d:30e2:d22b with SMTP id h24-20020aa7de18000000b0043d30e2d22bmr12508385edv.224.1659342230503;
        Mon, 01 Aug 2022 01:23:50 -0700 (PDT)
Message-ID: <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
Date: Mon, 1 Aug 2022 10:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, libvir-list@redhat.com
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220729155024.3327364-1-olekstysh@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
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

This is expected and in fact working correctly. We want compiler to warn
us about enum members that are not handled in a switch() statement. The
'default' case exists in some places because we suspect the value might
not have been validated before. For instance:

libxl_disk_backend x = atoi(argv[1]); /* or parse something from XML */

switch(x) {
case LIBXL_DISK_BACKEND_UNKNOWN:
case LIBXL_DISK_BACKEND_PHY:
case LIBXL_DISK_BACKEND_TAP:
case LIBXL_DISK_BACKEND_QDISK:
  // Neither of these might be exectuted ..
default:
  // .. in which case this will.
}


But we are not very consistent in putting 'default' case, sadly.

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

Ah, I couldn't find the commit in master, and it's simply because it's
not there yet. It's in staging:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;f=tools/libs/light/libxl_types.idl;h=66dd1c62b2a3c707bd5c55750d10a8223fbd577f

The patch looks correct. Do you have any estimate when it can be merged
into master? I'm not sure what our, libvirt, rules about xen staging
are, but for qemu we require master (even unreleased yet).

Michal


