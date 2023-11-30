Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC87FFC00
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 21:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645122.1006997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8nLJ-0008Cp-VA; Thu, 30 Nov 2023 20:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645122.1006997; Thu, 30 Nov 2023 20:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8nLJ-0008BA-SG; Thu, 30 Nov 2023 20:09:01 +0000
Received: by outflank-mailman (input) for mailman id 645122;
 Thu, 30 Nov 2023 20:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k41O=HL=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1r8nLH-00089e-VL
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 20:08:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1760c5-8fbc-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 21:08:58 +0100 (CET)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-kvMiOI0lN1ikNiNaCsWQyA-1; Thu, 30 Nov 2023 15:08:55 -0500
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-58dc1a18554so210158eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 12:08:55 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 qr13-20020a05620a390d00b0077d5e1e4edesm790071qkn.57.2023.11.30.12.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 12:08:54 -0800 (PST)
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
X-Inumbo-ID: 4b1760c5-8fbc-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701374936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQ5m3o7+UqdtWYSDU6QubOO0VIH9lcTK3EaDyGHvbxw=;
	b=Mtct1fO/ctWsHPFB+5wB3YkKWIi/8kY27OjH8kRwmuhYOoj/9W0NoGoJs1A18gtogaCYUD
	vRffEee1eUh+KlaA+W6L6CSktX+K5UIEAVyUr+LBUSgmdRbz278lk3afFfDrj6OZVBpOpg
	eBP1oeEHCSNxEordsBYKyhvdgJ8WBVU=
X-MC-Unique: kvMiOI0lN1ikNiNaCsWQyA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701374935; x=1701979735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ5m3o7+UqdtWYSDU6QubOO0VIH9lcTK3EaDyGHvbxw=;
        b=R7+RZnmTs5JEfhUDDzWKPI49nlH91gFwHfc+vO6sP/Mfg/IMTV9rmJgtp4OQmB5qVe
         dY9OmzwihdmTdBBxNQkICAAw52IYHwS4kuWle8fLfmXKyiO2A2lfBljBfJWxedfALESY
         XE2H4SCAVtVDiZjJZJfRm08AgDb09mRWIfaFmTIAJtYzuEL+/cxCfu9XugKdSqAWRiXj
         CJRVfz3HLxWY/2y687NssERPICjT74jMUbWgtXWM7O5hhCyCayuj0M4EkzOX6z1Snstp
         2ux56DwMedYxf6aTUsSV7nP6cSfK6Vk/YXnge/E1jQp+GLk7nleuKfifaVnqpYNoqziS
         Pyxg==
X-Gm-Message-State: AOJu0Yxsdbuu1lHDIWwqrU3F9vsiw1k7QWJubPZ7ONYxUtG1ouwxr6W1
	+9gJh8v5ynfhg5bUan9lAeyrHJVGEAWaFhgiPzLOca0cLM0brgwbKPxsabKND8NVW+xw2q8yivh
	3i37JyP+Ss2yBwrxCOILeeuJjxU8=
X-Received: by 2002:a05:6820:a8f:b0:58d:e3d3:ec72 with SMTP id de15-20020a0568200a8f00b0058de3d3ec72mr3219669oob.0.1701374934934;
        Thu, 30 Nov 2023 12:08:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFrVwMaTOwUyaQhegCiYW255oqkz3A1nA2DFXZquNCGnC+wsIvv9V9+I7etJ6uoaw71Bi5Lw==
X-Received: by 2002:a05:6820:a8f:b0:58d:e3d3:ec72 with SMTP id de15-20020a0568200a8f00b0058de3d3ec72mr3219606oob.0.1701374934634;
        Thu, 30 Nov 2023 12:08:54 -0800 (PST)
Date: Thu, 30 Nov 2023 15:08:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Huacai Chen <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@csgraf.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>, Eric Farman <farman@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	John Snow <jsnow@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Michael Roth <michael.roth@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
	qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Message-ID: <ZWjr0TKxihlpd1jm@x1n>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231129212625.1051502-2-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 29, 2023 at 04:26:20PM -0500, Stefan Hajnoczi wrote:
> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
> 
> The "iothread" name is historic and comes from when the main thread was
> split into into KVM vcpu threads and the "iothread" (now called the main
> loop thread). I have contributed to the confusion myself by introducing
> a separate --object iothread, a separate concept unrelated to the BQL.
> 
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void qemu_bql_lock(void)
> - void qemu_bql_unlock(void)
> - bool qemu_bql_locked(void)
> 
> There are more APIs with "iothread" in their names. Subsequent patches
> will rename them. There are also comments and documentation that will be
> updated in later patches.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

Two nickpicks:

  - BQL contains "QEMU" as the 2nd character, so maybe easier to further
    rename qemu_bql into bql_?

  - Could we keep the full spell of BQL at some places, so people can still
    reference it if not familiar?  IIUC most of the BQL helpers will root
    back to the major three functions (_lock, _unlock, _locked), perhaps
    add a comment of "BQL stands for..." over these three functions as
    comment?

Please take or ignore these nitpicks; my ACK will stand irrelevant.

Thanks,

-- 
Peter Xu


