Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DEB6A53E8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503057.775197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWujf-0004Ta-2K; Tue, 28 Feb 2023 07:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503057.775197; Tue, 28 Feb 2023 07:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuje-0004QK-VS; Tue, 28 Feb 2023 07:49:18 +0000
Received: by outflank-mailman (input) for mailman id 503057;
 Tue, 28 Feb 2023 07:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mcKI=6Y=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pWuje-0004Na-8D
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:49:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b48419-b73c-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 08:49:16 +0100 (CET)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-7KtwQ4vlPKyPno3V31Z4dA-1; Tue, 28 Feb 2023 02:49:12 -0500
Received: by mail-wr1-f72.google.com with SMTP id
 k6-20020adfc706000000b002c716981a1fso1296575wrg.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 23:49:12 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 l16-20020a5d6690000000b002c559626a50sm8844011wru.13.2023.02.27.23.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:49:10 -0800 (PST)
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
X-Inumbo-ID: 65b48419-b73c-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677570554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
	b=AqMs+jXASDuvRsYLsm9vBqXOpqG+VFdEHzoQWsyAx9ppo20el6MZPJi2oqcm5zOHvklxTJ
	JR1DwG/YdOGeblzPz+bTZG8Tr7ioz5y6C4unb237VaoNBsqbmwDJ121XAsUpX3b2brnbQi
	yOp/YY9d1h7FLuQVvueYPO3CVNHHqYE=
X-MC-Unique: 7KtwQ4vlPKyPno3V31Z4dA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiUfsADUzruFZXpDB4J4uXPtM0A/YxNLYWsjw+1AOZ4=;
        b=gYPm+5zvQlQW/cjn4ETBzPR+SgIfeKeqT8X4btrFC4lt08AKtpcjwStRBDd/poiYda
         X36NlFZnW2hBznm163UEhrzjIcoCaWQmhuWv5UH1paLf2aqUCEY7rtX0hz8eOnjVE4D4
         7osxB1G8Vtag5qqu7m1L3aR+Oj+oCr/CTVY/Kn8zFoL1x0VMSBU5lG1bNhplMnDteuCw
         GsBt6Lk5vPIZFGvgHbj92J8UnudMRhnOw/eUDQwXa3jUxpAFSmEvhg7N1YwoJDpFKJoh
         Koyut1C0HiIXB3sHpR4uhP1ZPsuy/JrM1Y7czi1YjpM8pQ6RyJQuC5e11t5Y1Y2MwaTD
         gF7Q==
X-Gm-Message-State: AO0yUKWl28RdNoKuzHWd/pPxaVq6FVHq1fk64DGkRT0vGc21oLrJzdPv
	Itmka9qsXxhk13R56fFpdfbvuuE+PvexRC/X8ob+IGMJZ9fmOQOvqVudQpJ3GmvTtl6NgPUfWXy
	/0UwegATR+1LxcBraTiuopwhZpMI=
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id m38-20020a05600c3b2600b003eaf05b50ccmr1676002wms.8.1677570551837;
        Mon, 27 Feb 2023 23:49:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9+Lj7WQrfp82VEPq525cyJkv1tNUqBhsPtcg5W6a+r1jgDEKuIymCq/mXAXSpAaDp6fX67sQ==
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id m38-20020a05600c3b2600b003eaf05b50ccmr1675985wms.8.1677570551536;
        Mon, 27 Feb 2023 23:49:11 -0800 (PST)
Message-ID: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
Date: Tue, 28 Feb 2023 08:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.
> 
> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.

Note: We're talking about 32-bit *x86* hosts here. Do you really think that 
someone is still using QEMU usermode emulation
to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!

> In fact, keeping this support around forces correct use of
> posix APIs such as e.g. PRIx64 which makes the code base
> more future-proof.

If you're concerned about PRIx64 and friends: We still continue to do 
compile testing with 32-bit MIPS cross-compilers and Windows 32-bit 
cross-compilers for now. The only thing we'd lose is the 32-bit "make check" 
run in the CI.

  Thomas


