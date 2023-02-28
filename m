Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024F6A5887
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503301.775531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWyRn-0004LN-JQ; Tue, 28 Feb 2023 11:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503301.775531; Tue, 28 Feb 2023 11:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWyRn-0004JF-Fd; Tue, 28 Feb 2023 11:47:07 +0000
Received: by outflank-mailman (input) for mailman id 503301;
 Tue, 28 Feb 2023 11:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWyRl-0004J4-Ic
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:47:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e974491-b75d-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 12:47:04 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-QdWUnX42MhqW4g7QYVcPDg-1; Tue, 28 Feb 2023 06:46:59 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so6797429wms.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 03:46:59 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 z22-20020a1c4c16000000b003e206cc7237sm15096859wmf.24.2023.02.28.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:46:57 -0800 (PST)
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
X-Inumbo-ID: 9e974491-b75d-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
	b=LZcVtMTMbi7uCv+Ju068nGDwPtVKjKa7RDG5cJudDyRFYDc2nbSXlrtPd4xPstYmyvYqZ0
	EGlYk3AItHQ3UTeHElaweZWmyc5J3x2/OzZE3H3Q0//EW/1mZ2bSXeQlIiWOgVxGKyye/N
	z9ZNSEKsDn/K263Fr9H2p6nT13G6ZqY=
X-MC-Unique: QdWUnX42MhqW4g7QYVcPDg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677584818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nS0+RyN/H1npg0C1JIbWHZZ4SfeTHMMRyD4io5maU0=;
        b=5rrzPJrduvyZ6UjlksAtFwQRilWbb5vv5KgfTosH9g3zRfeDuskALFqcWV5W7CVz5s
         gQC2DiUk9CCctwxQwbKyhpwTBfFrhVGzfeDv2hwJ26C6Ii49UtoH9s99oD9q7LEJKtzl
         mNFBJYxQVfzi8p4hYHBt3BM8acNmlD6afPI2AGrIRIXCU0PAbdLnIvTB1ADFCopDd0Ba
         Jd/QZxJRhaalXqoXqJ+ncuQshP51PX+IcExa4RuleA9xamjdwmCAx+Mwue4Mnp60hpT9
         KZXLS0Sa/xmJTzAZZxSBYDnLRSzJRjOj5hxi57ZPfoC78jtMaYPvX4MDpq/67wAGtH2+
         jiCw==
X-Gm-Message-State: AO0yUKXjGt+E3jF0R+1IYsEzJgFEPM1P69Vmu3T1VP11xFsZXMvwcWRV
	BK/xuXVlZGNx49d2evL8UUE7Jg7SeR6ZnWLeX/FaCHCto5oe2IPv00wP073cN1kDeVw/mdl2G4u
	1dYPIMuFmyepS8my6LodTgo0hwX0=
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id bi15-20020a05600c3d8f00b003e200d3b2b6mr2040466wmb.14.1677584818556;
        Tue, 28 Feb 2023 03:46:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9ukiJbDLLjbemAixbK8z9WCSaGKL85GygHLoDtlbZPMi8Ymp2kS5Em1Gh+o1UHoeYLychN2Q==
X-Received: by 2002:a05:600c:3d8f:b0:3e2:d3:b2b6 with SMTP id bi15-20020a05600c3d8f00b003e200d3b2b6mr2040437wmb.14.1677584818147;
        Tue, 28 Feb 2023 03:46:58 -0800 (PST)
Date: Tue, 28 Feb 2023 06:46:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <20230228064623-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
 <Y/3C+jC3Lk5MJxfu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/3C+jC3Lk5MJxfu@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 28, 2023 at 09:01:46AM +0000, Daniel P. Berrangé wrote:
> If we're merely wanting to drop CI support, we can do that any time and
> deprecation is not required/expected.  We should only be using deprecation
> where we're explicitly intending that the code will cease to work.

Good point, IMO.

-- 
MST


