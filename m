Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6714C653D03
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 09:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468291.727355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8GzG-00082u-6F; Thu, 22 Dec 2022 08:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468291.727355; Thu, 22 Dec 2022 08:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8GzG-000818-2S; Thu, 22 Dec 2022 08:31:34 +0000
Received: by outflank-mailman (input) for mailman id 468291;
 Thu, 22 Dec 2022 08:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obCC=4U=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1p8GzE-000812-Uj
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 08:31:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0925590a-81d3-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 09:31:32 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-NCtM2xvdNiuJUrLzVln4zA-1; Thu, 22 Dec 2022 03:31:23 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 v4-20020a056402348400b0046cbbc786bdso1033148edc.7
 for <xen-devel@lists.xenproject.org>; Thu, 22 Dec 2022 00:31:23 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906244100b007b2a58e31dasm8256467ejb.145.2022.12.22.00.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 00:31:22 -0800 (PST)
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
X-Inumbo-ID: 0925590a-81d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671697890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=H3xH+MtukyCyGSyvDWcAyuyw1FCiAQPWtpErq5NpbCaPh6wNQR/IbiaWKpYWFMWMl4kzps
	BGj6dKmgPWPo4LPfX/TCHwNJ3yLhs2W1Mtbm58n68KjdBFwJRG1TQPI6gxnR79E1iuLq65
	Z9BLQbctDExxXrxFFbrk1M/+eKe7W9o=
X-MC-Unique: NCtM2xvdNiuJUrLzVln4zA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=ZbxEpijTxZgk9nuoE1jLHFrfOwsQNvXzAWl/uCn/mHWv4jxMN5gyQwrSIjZ6/m2knj
         7x1BMAuCxCc+6gordktUUGHR/hupbO5oKAr+ShZcsj/x58lA0BtyIIRmchBlHSSnlWwd
         7dlnFTmr+TpybQ3Vq3HMQh8cQ5VWrvIjIuWSRqr+Wx0THBxNmQlTisYSWQ237Bbidq18
         W8ViuELK64ERGYwTXS8Hertt/6B7p+87yIrd2/iIBTKHnntKNYy6F8LkshLOLF3QXoW1
         fDLoPrr0qbgKYQgP+RGmZ1DpSqOo5UEhWVaHvxZfIH89CWaTtM5aLTiSDHOwfL9HgD3b
         YCIg==
X-Gm-Message-State: AFqh2kpkkF+vQyiLNgTKhTwEBKsM2Q7FatB0vemrdEOEweBg2fhqVJLp
	vRIPcFc4tD2fkFedwgLEEhwO6obHJV0Mp/ePlkjaeKLupvvw8BOLIkVI7Z1y4PJJKXvGAsC4iPq
	lClTsUH979SqF9vEhlKLQY/bri4s=
X-Received: by 2002:a05:6402:1592:b0:462:7b87:c6d with SMTP id c18-20020a056402159200b004627b870c6dmr4000363edv.2.1671697882819;
        Thu, 22 Dec 2022 00:31:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwZkeFL8OUz6ZUFNTs1DiHZ5yLUmzSas8pfZy4kn1qQLxx2bSmeMBGwO1lgmt+9zSvqFM8Ow==
X-Received: by 2002:a05:6402:1592:b0:462:7b87:c6d with SMTP id c18-20020a056402159200b004627b870c6dmr4000340edv.2.1671697882646;
        Thu, 22 Dec 2022 00:31:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/6] enforce use of G_GNUC_PRINTF annotations
Date: Thu, 22 Dec 2022 09:31:19 +0100
Message-Id: <20221222083119.860606-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Queued, thanks.

Paolo


