Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF359C156
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 16:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391447.629287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ858-0002D7-Ko; Mon, 22 Aug 2022 14:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391447.629287; Mon, 22 Aug 2022 14:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ858-0002A9-HB; Mon, 22 Aug 2022 14:07:10 +0000
Received: by outflank-mailman (input) for mailman id 391447;
 Mon, 22 Aug 2022 14:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xx4=Y2=redhat.com=mprivozn@srs-se1.protection.inumbo.net>)
 id 1oQ857-00029W-IW
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 14:07:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e6304a-2223-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 16:07:08 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-SqPEQTVTNP-sDQAp-TskAQ-1; Mon, 22 Aug 2022 10:07:05 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso6996077edd.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Aug 2022 07:07:05 -0700 (PDT)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 fr17-20020a170906891100b0073d757cd1cesm2385168ejc.169.2022.08.22.07.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 07:07:03 -0700 (PDT)
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
X-Inumbo-ID: b4e6304a-2223-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661177227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRFBf5IAyfsWo9ah7usXDAFcy4ho52QTwXRhbHpE/js=;
	b=buzdMfrhznBnSVMC8Gb2ppTBGc/sfbnq3XW4jdL7wlqKXJBM4e0ZOuMqlnbDs/MXVXEoeo
	WqqXFSR7p91GHLIL3Z6sPTco9CWm3I0IW87i48VZHj6yxivNng/I8Gcj2IqiXdOoIzbqfc
	lmSoDLkmYyKbxsoAgojFchWrn78Ox6E=
X-MC-Unique: SqPEQTVTNP-sDQAp-TskAQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZRFBf5IAyfsWo9ah7usXDAFcy4ho52QTwXRhbHpE/js=;
        b=0/GhV5F9NkACshF6jfpRlu5R8KX0tV4jr4r+vBAWSG2K/rnrUMlKeZwK4QoFIgCXW8
         +RODbzSoC/EpPmJJgyvm66JR5E1e/bX2DiBMjcB8z5olHrPEBmOE7oyCiwBLVhtxHsWw
         yQnlYeLsFrQqgdYp31Wiv9vwYwj30cPNQTl5QeABTNv/uVB5j3CPSqL5/o6LNNXFw8YI
         OI9WPiBXIXeCjt2J/idnizRiFCih7Ng6XhvQnrARhmNi6CpHbn2ULfG4Aktff2H9JHKR
         4vN4VWYVdD3sLaqJvwz4rh0xvSdGeecjmQKe6IWu48le9gvbtifP9IN1mb3TU+BKXkDx
         mJrA==
X-Gm-Message-State: ACgBeo1vx58VKog0He3ss1t1WkDxX8DkXPFlRrz79ZbimWU4vexadP3F
	AQ10C826w1leSX4N8GsgaVDHGXy0O8uobw2aymbgcbhlL5y+rZN2nrJKxEBddac7/NpT9kposm1
	1YzrYf7RL8uUMUk7e89vbk+iu3KE=
X-Received: by 2002:a17:907:2889:b0:73d:7f7b:8380 with SMTP id em9-20020a170907288900b0073d7f7b8380mr3539026ejc.553.1661177224541;
        Mon, 22 Aug 2022 07:07:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7z2CeRhot2vEJbDgZbe2bMLUQwRg0yeRIIBWBdcsz2eJMzut7DiW5lJ8i4IVCjuHvAgVqxXg==
X-Received: by 2002:a17:907:2889:b0:73d:7f7b:8380 with SMTP id em9-20020a170907288900b0073d7f7b8380mr3539010ejc.553.1661177224311;
        Mon, 22 Aug 2022 07:07:04 -0700 (PDT)
Message-ID: <797f344e-49a4-2f1b-638e-5b44f9729441@redhat.com>
Date: Mon, 22 Aug 2022 16:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, libvir-list@redhat.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <Yv9elYoCbkUP0pzX@perard.uk.xensource.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <Yv9elYoCbkUP0pzX@perard.uk.xensource.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/19/22 11:57, Anthony PERARD wrote:
> On Mon, Aug 01, 2022 at 10:23:48AM +0200, Michal Prívozník wrote:
>> Ah, I couldn't find the commit in master, and it's simply because it's
>> not there yet. It's in staging:
>>
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;f=tools/libs/light/libxl_types.idl;h=66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>
>> The patch looks correct. Do you have any estimate when it can be merged
>> into master? I'm not sure what our, libvirt, rules about xen staging
>> are, but for qemu we require master (even unreleased yet).
> 
> Hi Michal,
> 
> Now that the commit is "master", do you think this libvirt patch could
> be committed?

Indeed. Let me do that right now.

Michal


