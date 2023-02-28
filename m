Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443036A572C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 11:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503242.775460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxaN-0002Jl-0U; Tue, 28 Feb 2023 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503242.775460; Tue, 28 Feb 2023 10:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxaM-0002HU-Tx; Tue, 28 Feb 2023 10:51:54 +0000
Received: by outflank-mailman (input) for mailman id 503242;
 Tue, 28 Feb 2023 10:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWxaL-0002HO-AC
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 10:51:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7590541-b755-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 11:51:50 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-VmCFpQZtN6y7_lMqE39ELw-1; Tue, 28 Feb 2023 05:51:48 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso6735859wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 02:51:48 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003dc1d668866sm15589805wmi.10.2023.02.28.02.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:51:45 -0800 (PST)
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
X-Inumbo-ID: e7590541-b755-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677581509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
	b=c3F+tksk3HY/zISIbUWNOP3IvpOgZgua9PY8CkgAFTWCpqTNwb6pzWxdbs+eTWhk2Dp9J1
	LDd/4lqwBLM+keI4k5vhpAkousMXo8jsAZo2LcrYsmZjmU8M8nl1dcWwQ2xxoKrRAyRvgu
	AL8p0p4yl7Xdkd/MKcLO2pJN6zpQhm4=
X-MC-Unique: VmCFpQZtN6y7_lMqE39ELw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677581507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIARw/Eg/FHCbkTqHcE3f9NxhqHaLUkccjhqbNiCijE=;
        b=Y+R44rWTTW4JjGNHEr0KCkAlR0pPfca2M2dRku5Xzd5Ilp9iPRwSaZpRXdH69J+r/V
         X3OvVHXP742gk9Hmfsr/h4CnVgfXeP5RAxgpmE6lcEEzcflDDRUGdsLMFbkyu2pB0a46
         qlmFKU+RVIr0hVV7HzZpm8xB6G/AhN9tX720xoBysDViGTQKXgR5VP5+737QZvFGbtTZ
         rWkv4hxgXG+nKKNzkUDKRLSaCu2eOCM1W/MglYyAuYwsf9DzwcVZ0kg8Z0/wR1abrzYq
         /l0OMzGWky9p2QcjWhnDsQSGqHg9u6Dq1jyUVHBRMCWrnTZYIIglLKZ85nNYL5jpYJEQ
         2VJg==
X-Gm-Message-State: AO0yUKVlU3CHCkdxEX+BN/M3SR1TZKYzU6QlHbanW2f6AdasRh8OmXp+
	xwp56vIZ2QCs/5mjlDw0c/pF5Za9KUPBwXgl1P5jBXB3ViEH+5hDyahfp4xlIV0oyymVs7TABgn
	s8XlUeAwt0WFRYW+eLrNVvcgNjy4=
X-Received: by 2002:a05:600c:331b:b0:3df:fbd5:690 with SMTP id q27-20020a05600c331b00b003dffbd50690mr1723654wmp.17.1677581507231;
        Tue, 28 Feb 2023 02:51:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8cQlDBvAlJdAHtDjB/GY2t5VT2TFTWjVV6lyCTysKtoQJ8w5SKvyN5sJMgC80hVK24t3HvYw==
X-Received: by 2002:a05:600c:331b:b0:3df:fbd5:690 with SMTP id q27-20020a05600c331b00b003dffbd50690mr1723636wmp.17.1677581506970;
        Tue, 28 Feb 2023 02:51:46 -0800 (PST)
Date: Tue, 28 Feb 2023 05:51:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228055016-mutt-send-email-mst@kernel.org>
References: <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87cz5uhy50.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> The question to answer: Is 32 bit x86 worth its upkeep?  Two
> sub-questions: 1. Is it worth the human attention?  2. Is it worth
> (scarce!) CI minutes?

3. Is it worth arguing about?

-- 
MST


