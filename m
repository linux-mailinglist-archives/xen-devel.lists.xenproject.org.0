Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C886A5884
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503297.775521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWyQb-0003oq-8K; Tue, 28 Feb 2023 11:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503297.775521; Tue, 28 Feb 2023 11:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWyQb-0003mg-5L; Tue, 28 Feb 2023 11:45:53 +0000
Received: by outflank-mailman (input) for mailman id 503297;
 Tue, 28 Feb 2023 11:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWyQZ-0003ma-7x
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:45:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ea5226-b75d-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 12:45:48 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-zIc_6bwwPlG02ejcKylEJA-1; Tue, 28 Feb 2023 06:45:43 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so4160454wme.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 03:45:43 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 q5-20020adff505000000b002c70a0e2cd0sm9735429wro.101.2023.02.28.03.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:45:41 -0800 (PST)
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
X-Inumbo-ID: 70ea5226-b75d-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
	b=GHp8c86vuLXFSmMRvYCaSE9hXHiikhhQf2LubHTvZIrsqh1iBMFTx0jgv0XfV/TmyT9p3/
	3YdX8t2ZYPB/ElnsAYrIpxmoD3qxSjAtSaEoH04HCI3HS5EPzS/IFaFY4mEr+l4GxL3SnI
	/ToyPzmVVaLcyAB7/tjvvfGxFIitptE=
X-MC-Unique: zIc_6bwwPlG02ejcKylEJA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677584742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpIC6p+UT+rHFct1wlfMFpw0g6TQL7FZQoQ34DKLJ2E=;
        b=YwsAffsQbr6KB6xrAxuVLGD5eeZUptiA/IZblJWeJDfVDcKB934pFT+9Lg6gnV/LIV
         1VYtNu+yddj2b2MwyAMqzEv0WTzuYFBRIKT/vtAYlK0ODOD2EvYxci7luoTGdwH9QQFq
         f8goHFhyv4DOaMlhNkSV0Wu/nKBtWNtvB52rtCQZvsRAkXrWi3WdZC/gn0CeDxj/o24X
         aXeq4TKdBzw8+GMjmNAbvhy0Uqvr3GzumltY2if6x2XglvFjYbdeBTeykOmcwRhsrgR8
         2ITHR4XeED0JHCk5dZcynmXlKR3SEkCCfQ6qdZbEPIdJMdXPFP+M2I+0foBCA07/RH1f
         4R/A==
X-Gm-Message-State: AO0yUKWHKHuTjvaVUgFActbgPYLEsbgDJEEuPSWCiiQCydzFc73GFOXO
	qncxmBq5Ivj5OXZMPrM11NaNO3YQ+wjTnhafQPnXDiJrJaWetxi8ME14S76+N/BkH38a4QRIuxt
	BFToLEKeReSrJHjQZK2GhP+U1+QI=
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id i13-20020a5d558d000000b002c70694aa18mr1645851wrv.15.1677584742661;
        Tue, 28 Feb 2023 03:45:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+48ZPIQtY97ItwCko/7jlopFQGD3BDNuOTQkv4JN9Zc5UzfllSrQJsmeRBXNl/Z16nZ9kf+Q==
X-Received: by 2002:a5d:558d:0:b0:2c7:694:aa18 with SMTP id i13-20020a5d558d000000b002c70694aa18mr1645837wrv.15.1677584742358;
        Tue, 28 Feb 2023 03:45:42 -0800 (PST)
Date: Tue, 28 Feb 2023 06:45:37 -0500
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
Message-ID: <20230228064105-mutt-send-email-mst@kernel.org>
References: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <87h6v6gh1g.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h6v6gh1g.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 12:34:19PM +0100, Markus Armbruster wrote:
> If it's not worth arguing, then we merge Thomas's patch.

I don't mind but it's just a doc patch isn't it? If what we want to do
is to stop doing make check on a 32 bit container and just to do
make then let's patch the relevant yaml.  I'd ack this, easy.

-- 
MST


