Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AEAB94ED5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 10:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128273.1468685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0y5J-0005aa-8k; Tue, 23 Sep 2025 08:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128273.1468685; Tue, 23 Sep 2025 08:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0y5J-0005YO-61; Tue, 23 Sep 2025 08:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1128273;
 Tue, 23 Sep 2025 08:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiXw=4C=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1v0y5G-0005YF-WD
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 08:09:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 905a4096-9854-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 10:09:02 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-0Qnh4dR9N_yVTwvC7su1nA-1; Tue, 23 Sep 2025 04:08:59 -0400
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b07cc3f115aso472526666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 01:08:59 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-633148d2df3sm4465772a12.30.2025.09.23.01.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 01:08:57 -0700 (PDT)
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
X-Inumbo-ID: 905a4096-9854-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758614941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=HHzI4akrgCC51lUxlU6IJ39vedVTf3gBdJBOX2YNY/n7M9iiYo1OiCFznxC5U9qaOFbEMv
	KwwWwaA9Y8abP1I1+mIirvJFLnev4Q164HA7yqZ94EacsxOP+PCGL81Q72DC23ogkqaCJ2
	C4eDHsKhWtAYExkE+hC1RC9+DZle020=
X-MC-Unique: 0Qnh4dR9N_yVTwvC7su1nA-1
X-Mimecast-MFC-AGG-ID: 0Qnh4dR9N_yVTwvC7su1nA_1758614939
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758614938; x=1759219738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=oGNw8+fKOH6iCdBgEx6L7jjUTI41VA69ZIzT/svM7bmoUsbnI9KVZkrQIpgQjZlx/l
         7vIPSYUJjP6jAM/q58pQwghLoIFlvCKl9dw8EeWsLrwtzCmDMTTZHOH88HemIyf9Xuju
         Uo5Y/YJk0PP18CAFu1+6TuOBzb+JgRNf3LWkfU6JZW0kHHAzbnKe4M7bYOAIBy5F+M1O
         bChWABV9HY1LAW9oopG3e1Xn/BF1lfSTMHMWOqdY5I5xvDe39+AZcEba+OeUSQXI7RbO
         XwH8gWCKIjCk8P2kLIoENPZEgb4ArcEGhkoo9ogJO5JmolR+K3vmlS3ivIFd8MlrEwpv
         MGTA==
X-Forwarded-Encrypted: i=1; AJvYcCWy8urwFn/G958/oKtW2AtO532HbnVPj//OmYYnFXZj5iDHXY56Lad6zOa8dhF/enXn1jLlYnY3d6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdc50jEZpivugilJcIDVqIlmiDld7SUag9gtv086A/eM32/5qq
	fFh2ZWEPtqlfd2XAj5tz9wGMHzb9wf8G1UbUwPYxaPKK/sl76WSVsPRPzcl+4d4LRWxnBFa09fA
	ciAvDtxUdM0vCd1+wvUCt/SDkaR0dRbXJAQ5/0KeuGyUuPdWk7spudo3scXrGmepq4GOm
X-Gm-Gg: ASbGncsR7+xyDVhV19GdCwBGqHcdah031x2Hak+YSYyGeR3QcUz1tGmv+5OL7uvFWKK
	WWLzk9YRUVmiZGAKay0KwDkXZNQPg1aB2O+d81MLyu7so7ptddQibs9ZDC2/qcLmh91rJIOqnz3
	l/bNrOJkfXJ22va/eF3Onc6OeLSGd2IUZ7As2/GnFmW4A44WOrdnBNH3lymJKX4HsqX2YDcYylt
	OH8cezRhsWgoByCfeQ0alhpdl9SfxVcFvCR+rzSP95Pe9UFhdWxNSmbA6UqgS5NDYgFEnfV48hS
	vMDCfVM/FgtJcVx4igz91ZRrUjMOhTUxNrS3lXplfZ2nHKLkVPf0HaVz3s+CuQWlwRXYbfW9ydx
	0TRhl3tM5WK+OWtyjeK88Nnu5ZBMlHOugpvxZb9nWCa5RmQ==
X-Received: by 2002:a05:6402:5041:b0:633:9e:4036 with SMTP id 4fb4d7f45d1cf-6346778e1b9mr1374753a12.11.1758614938530;
        Tue, 23 Sep 2025 01:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfEVzMzlegsS8RRRWXf5AuMiTyV3RuuZ4ChXwgv3Yn5mo7kYPCIJoERh+giB7/42ECgMCO6g==
X-Received: by 2002:a05:6402:5041:b0:633:9e:4036 with SMTP id 4fb4d7f45d1cf-6346778e1b9mr1374717a12.11.1758614938103;
        Tue, 23 Sep 2025 01:08:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org,
	Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-ppc@nongnu.org,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
Date: Tue, 23 Sep 2025 10:08:53 +0200
Message-ID: <20250923080853.94322-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dCc1UqQ-JHwdxpzX4-S8mTl9fAEMLxv9d_RO7Uq6qR0_1758614939
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Queued, thanks.

Paolo


