Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25825821F0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 10:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375966.608507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGcGc-0008MP-Df; Wed, 27 Jul 2022 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375966.608507; Wed, 27 Jul 2022 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGcGc-0008Jk-AZ; Wed, 27 Jul 2022 08:19:42 +0000
Received: by outflank-mailman (input) for mailman id 375966;
 Wed, 27 Jul 2022 08:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apwo=YA=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1oGcGa-0008Je-Ow
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 08:19:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db020544-0d84-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 10:19:39 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-t_pY58LBOLGN__e3qCx1Ew-1; Wed, 27 Jul 2022 04:19:33 -0400
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020a056402280f00b0043bd8412fe0so7425651ede.16
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 01:19:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170906310b00b00722fc0779e3sm7213889ejx.85.2022.07.27.01.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:19:31 -0700 (PDT)
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
X-Inumbo-ID: db020544-0d84-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658909977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuT/qe1DCcJGnSW38Ka6ZQWh4Y3+XNV+VTCNVSBHbvs=;
	b=JO/xzLkPL1mgBIijC3VerS/zd8NHw9yAP7EwB/ihu59HI2z5Rk9raKc6zp8fC5XJaoiWoi
	8tHIOw4ztDD0r0fNU8Dr41H2FstiFtHsK5T1G7AZGw0GkcavZN53GCTj3wbOA6Cfm8do94
	PrG33k4y8dsfk2m/acf0FWmgbQNGc9c=
X-MC-Unique: t_pY58LBOLGN__e3qCx1Ew-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZuT/qe1DCcJGnSW38Ka6ZQWh4Y3+XNV+VTCNVSBHbvs=;
        b=QMdN+Xwl62UYgBl1aVR863G0DVcRwPRCpfrTyRH2XKFW3hdA97/HPYwHMb0qoaMaIS
         Rm+NCRVPzv1I/iJKjL5OZ74+LMltEmuwgFP6pe7A8VfqWu56ZV8JCdfY9mOJ83F9TNf5
         9Rjxrg9H2gpd3PDTlcf5zd8iO/w3eTUA81im+N8z2REt2Z6XUoHGstvjtkzZqhsQzf4t
         cil1ZtihrVZ69x2j1tBe8g/Vrm/HFAq1TxJUFxoodK42pQn/MptakgrQtsQKyvMoBger
         fAeYtBt46iOxWjOOGT0UdPB86gkGier6JjDfSQpxBcVNNxCm4W2+zohUNpDhkzHBapjT
         NtNA==
X-Gm-Message-State: AJIora+Ew6gdlKjZr+Ay/BsTVTxAv+Au7++Ss92Lo25fqVUlBVkmDWSA
	cTVlm+NXusGDv8yUABq6xwVTKsFs2QhBhJCdkp8fJulOtw/offY4MwvTBlgN5cBsLm+kV9jEXZ/
	qgZ/lsUThhdEzs7BaRwmfCpbzxcQ=
X-Received: by 2002:a05:6402:354c:b0:43c:2cd0:49bc with SMTP id f12-20020a056402354c00b0043c2cd049bcmr10446058edd.48.1658909972338;
        Wed, 27 Jul 2022 01:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1KG8ZK0GVys0wHa72IOIPmOKk2BY6xOgr/8AEf2x+4dmdaKNHM/PcWIuoPQ+mfc3SsNuwpw==
X-Received: by 2002:a05:6402:354c:b0:43c:2cd0:49bc with SMTP id f12-20020a056402354c00b0043c2cd049bcmr10446040edd.48.1658909972039;
        Wed, 27 Jul 2022 01:19:32 -0700 (PDT)
Date: Wed, 27 Jul 2022 10:19:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Huang Rui <ray.huang@amd.com>
Cc: anthony.perard@citrix.com, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Trigger Huang <Trigger.Huang@amd.com>
Subject: Re: Question to mem-path support at QEMU for Xen
Message-ID: <20220727101930.66ed56e1@redhat.com>
In-Reply-To: <Yt+XS81vmsWoJA5y@amd.com>
References: <Yt+XS81vmsWoJA5y@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Jul 2022 15:27:07 +0800
Huang Rui <ray.huang@amd.com> wrote:

> Hi Anthony and other Qemu/Xen guys,
> 
> We are trying to enable venus on Xen virtualization platform. And we would
> like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
> options on QEMU, however, the QEMU will tell us the "-mem-path" is not
> supported with Xen. I verified the same function on KVM.
> 
> qemu-system-i386: -mem-path not supported with Xen
> 
> So may I know whether Xen has any limitation that support
> memory-backend-memfd in QEMU or just implementation is not done yet?

Currently Xen doesn't use guest RAM allocation the way the rest of
accelerators do. (it has hacks in memory_region/ramblock API,
that divert RAM allocation calls to Xen specific API)

The sane way would extend Xen to accept RAM regions (whatever they are
ram or fd based) QEMU allocates instead of going its own way. This way
it could reuse all memory backends that QEMU provides for the rest of
the non-Xen world. (not to mention that we could drop non trivial
Xen hacks so that guest RAM handling would be consistent with other
accelerators)

> Looking forward to your reply!
> 
> Thanks a lot,
> Ray
> 


