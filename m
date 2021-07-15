Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF73CA052
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 16:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156637.289055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m423q-0007tH-3C; Thu, 15 Jul 2021 14:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156637.289055; Thu, 15 Jul 2021 14:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m423q-0007r8-0B; Thu, 15 Jul 2021 14:09:58 +0000
Received: by outflank-mailman (input) for mailman id 156637;
 Thu, 15 Jul 2021 14:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0p9=MH=redhat.com=vkuznets@srs-us1.protection.inumbo.net>)
 id 1m423p-0007r2-3Z
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 14:09:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id aecea5ce-d0ff-42bb-af0a-7015bb6e4a1a;
 Thu, 15 Jul 2021 14:09:56 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-TjYoHJKJPN-PJw60Hx0iVw-1; Thu, 15 Jul 2021 10:09:54 -0400
Received: by mail-ej1-f72.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso2263020ejp.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jul 2021 07:09:52 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id n11sm1941466ejg.43.2021.07.15.07.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 07:09:51 -0700 (PDT)
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
X-Inumbo-ID: aecea5ce-d0ff-42bb-af0a-7015bb6e4a1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626358196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFJXZGV7aNAREnh89TW34RE/5AHLlwB5DBQieYCgIYY=;
	b=bikQqXnXiU5CAAP5YwOwgVOTB0gJYSJonfBSJfTPJORC0sVeYA6R7xb5fllN8U8onvFOh9
	0Pc7FJephXBoNeICZfT9ZB9TfvuLzwDTEsTWu1Sjrt4Pc09XWuvv+AS5oxac/LzHI2nK52
	0jLWxQvCmiQ1l1xj37CUCM/87Y+gfTg=
X-MC-Unique: TjYoHJKJPN-PJw60Hx0iVw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=tFJXZGV7aNAREnh89TW34RE/5AHLlwB5DBQieYCgIYY=;
        b=jbpDQU8vIVE7RE1XI1fiMJUINR3KkQ3Xr9A5KQaC5L3YWZ5PMMOJTqbR+Fdv1KckDW
         vCF+cNFmweHqC2uUiwB2KApJuys/d0it1xisyMLMAUy+DKk49NljaSotCD2J2b8UTBLs
         n04uG3tw8mTHAnJiFwazosV540zHvmuFe56ZKDN8+QoZI8oilJYbul4/3jiSyTpO3HHb
         sa7cXJQZha8R/Nid6Eoxne+9lKXvsLY4ColHsz37q66/YvEMI4RAaxIQboRMnMSnBN1O
         6fIkLTno3tbAaBPLxABFn2dWt2riA7soxxiPMBqx2Pw8n9Fz08l9ZR1ZydPk9TtDWnH0
         KfDw==
X-Gm-Message-State: AOAM532HnZeHs/sbPwZE7BkKZz0D0bl7RGQ3ESOcbS6lwczloNiatDfA
	hO+dK64Uw8woUbLJCr/pVrIrYBQLd0SYl/KC1ZljI/6Ra5ctokYBqzLj+EcW31rlvGmFuRd+f1T
	VoayFTvSOOFS7d9Ug+D6KG0fSZK8=
X-Received: by 2002:aa7:d991:: with SMTP id u17mr7226993eds.240.1626358191952;
        Thu, 15 Jul 2021 07:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4KCo5yWB3CUiMiCx4bNhZEE9IvvOeUpFd2/S/H0MMsvN7gNqlBpEaA1BuPjpWA2rCZTWo6g==
X-Received: by 2002:aa7:d991:: with SMTP id u17mr7226968eds.240.1626358191806;
        Thu, 15 Jul 2021 07:09:51 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [BUG report] Deadlock in xen-blkfront upon device hot-unplug
In-Reply-To: <20210715134656.GA4167@lst.de>
References: <87pmvk0wep.fsf@vitty.brq.redhat.com>
 <20210715124622.GA32693@lst.de> <87k0lr1zta.fsf@vitty.brq.redhat.com>
 <20210715134656.GA4167@lst.de>
Date: Thu, 15 Jul 2021 16:09:49 +0200
Message-ID: <87eebz1xea.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Christoph Hellwig <hch@lst.de> writes:

> On Thu, Jul 15, 2021 at 03:17:37PM +0200, Vitaly Kuznetsov wrote:
>> Christoph Hellwig <hch@lst.de> writes:
>> 
>> > On Thu, Jul 15, 2021 at 11:16:30AM +0200, Vitaly Kuznetsov wrote:
>> >> I'm observing a deadlock every time I try to unplug a xen-blkfront
>> >> device. With 5.14-rc1+ the deadlock looks like:
>> >
>> > I did actually stumble over this a few days ago just from code
>> > inspection.  Below is what I come up with, can you give it a spin?
>> 
>> This eliminates the deadlock, thanks! Unfortunately, this reveals the
>> same issue I observed when I just dropped taking the mutex from
>> blkfront_closing():
>
> Yeah, this still left too much cruft in blkfront_closing.  Can you
> try this version instead?
>

This one seems to work fine for me! Feel free to throw

Tested-by: Vitaly Kuznetsov <vkuznets@redhat.com>

in. Thanks a lot!

-- 
Vitaly


