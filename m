Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA74B84F4E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 16:04:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126126.1467796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFFB-0001Fg-28; Thu, 18 Sep 2025 14:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126126.1467796; Thu, 18 Sep 2025 14:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzFFA-0001Du-UR; Thu, 18 Sep 2025 14:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1126126;
 Thu, 18 Sep 2025 14:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j8y1=35=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1uzFF9-0001Do-0D
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 14:04:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ac96565-9498-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 16:04:13 +0200 (CEST)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-ebReSU0YM8uN14Z_M_oQJA-1; Thu, 18 Sep 2025 10:04:10 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8217df6d44cso161433985a.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 07:04:09 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8363344e970sm165242485a.61.2025.09.18.07.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 07:04:07 -0700 (PDT)
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
X-Inumbo-ID: 5ac96565-9498-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758204252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oylp830QgzWCxYygQPu4YXMnJbTIkCEHwCADQS7PoK8=;
	b=gb8YW2X6GyTHcq1cYm9jVcVGeCa+yqlAiKn/xqomi54Dxmk2yuoFbKTY0wwBOSLxuH70Ac
	tlCSUPlWjhMLfhXDDS90e9EFeRdEuPl1TkJ8DPyO8aWB6SNR/IY1MxJtw9Cw1qH4dHr4lB
	7g1NuEAFfVsU0fkegsC4Z/K8+ANvC88=
X-MC-Unique: ebReSU0YM8uN14Z_M_oQJA-1
X-Mimecast-MFC-AGG-ID: ebReSU0YM8uN14Z_M_oQJA_1758204249
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204249; x=1758809049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oylp830QgzWCxYygQPu4YXMnJbTIkCEHwCADQS7PoK8=;
        b=jsREnOp90QPDW4YD7U2ENjWtjnnHmIAb8SY68NrMPR3WGz5sq5QSVhjqtvE9hmHo2W
         39XLXb2gqPHtSZ/UjFoUkIfeAJLhOapersXKsVPtbDfAWE/v4HW4fws/swhhdqJtTiLa
         7fDXrOsRBxDPM2gHpHWhXYJtzFPEzrBUn0+Mt6hk6KQPvNWBdFHe6595a8XHEbb7P9uz
         q3pDVakvlo+L2GWJOL/phO5oJihvRzFB7bUUAP5cOv99nkg04Y+Pl3nUiYYfvpYogRno
         v04Q0w/Y4VW1YJOc3dPZUnmtPtPzo8GTBSPnbWEVb14MWKNA80zY51U1VrYHUlpyXw/r
         hKaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOjvrwS0XyfuM/silX6iGtR1V6bhj9LOW5iZYaAg0Md2bfs7EKRXZgb0LbLKnZmfx2+bOKH0e1vj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG1ozzr1nZU3TEiaiPG36CPM1oSMg6nMFW+vTlPKi327cHx1WZ
	8pBqnaImsRS7rATHrVPlJ9KrYVg43Wo0r4g7I4ja8T/j72wMon6BYhvt27Q3s08boXvSULk+5n1
	c/3HdNSX6pnexXiYsNeAdOHZhdWEpOX7001SSiRRpR4auoOmOoPJU332sO8xqJsaIB0GB
X-Gm-Gg: ASbGncvuiN8v3RVMLBTN3SQUnDvLau/8W3H1xLNB74yUtEWUWIg5Il8nJG5HugXzM9V
	eOvnekWcZN3TDw9q41Pwp66AdOsY22Za4X2Nmv+6fEdlDvmxZ+Kj7nuzvpyB7pWZeIGW4m3i+i5
	avJSnDv55EjwqM2yiThN4lEBG+WsPtpopY8vomHg1enbbXhoPbBvHY8oIflLCjTlGx0celM2Fnu
	10zU+5fI1jhHbrq3mHj7ZP9g6sJ4yJZFQUKF6fjgEGOpEdbKH0imDBX/wWHGgoSYSQHi20O1Otl
	dRlOnwMJp1DuoA19NefwOrjj3//ew0+J
X-Received: by 2002:a05:620a:2a07:b0:822:f45b:a5ef with SMTP id af79cd13be357-8310a6416admr643808985a.29.1758204249165;
        Thu, 18 Sep 2025 07:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa8HlWVxiunhxh9YQWqVYN7oHdznhotjK4AQbo42C9SFdIf9dV/mPRmaLtfzCAOkZHoqjgOw==
X-Received: by 2002:a05:620a:2a07:b0:822:f45b:a5ef with SMTP id af79cd13be357-8310a6416admr643799885a.29.1758204248504;
        Thu, 18 Sep 2025 07:04:08 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:03:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
Message-ID: <aMwRSpezxmIwIHrU@x1.local>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
In-Reply-To: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OfzqKQY38lv-94LIVMChFHDyTkZx_b917uRkBfTOWWw_1758204249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
> Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
> ("[PATCH v2 00/14] hw/pci-host/raven clean ups")

Could I ask why this is a dependency?

-- 
Peter Xu


