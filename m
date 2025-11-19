Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF9C70911
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 19:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166248.1492827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmYP-0003P9-3f; Wed, 19 Nov 2025 18:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166248.1492827; Wed, 19 Nov 2025 18:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmYP-0003N4-0u; Wed, 19 Nov 2025 18:05:17 +0000
Received: by outflank-mailman (input) for mailman id 1166248;
 Wed, 19 Nov 2025 18:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1IC=53=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1vLmYN-0003My-LD
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 18:05:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489ca1a0-c572-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 19:05:09 +0100 (CET)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-vH0WEA8aOsCUOknBTVlAdA-1; Wed, 19 Nov 2025 13:05:06 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8805c2acd64so309086d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 10:05:06 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88286595ea2sm138610226d6.51.2025.11.19.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:04:58 -0800 (PST)
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
X-Inumbo-ID: 489ca1a0-c572-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763575508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sLup+W7pa6WZ/k6QZNaZVOA124clRvPAt6nyoZoANYk=;
	b=L0N67id8V25htQxH0WGWIxf0RUU4x+gtpNZPXNdGyqkySZEfhYK8gLsg7ai1qQsMF9D1Or
	0nKBNxMVMApCvBeq3pt58KhCOOMp6KqmFuXjbYgdwc1GJOi1ebFvMyiG/Ydq9ftRuIly+x
	JwqhPmlgqdpsRwENFb3QUR8r+pyZhW8=
X-MC-Unique: vH0WEA8aOsCUOknBTVlAdA-1
X-Mimecast-MFC-AGG-ID: vH0WEA8aOsCUOknBTVlAdA_1763575505
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575505; x=1764180305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLup+W7pa6WZ/k6QZNaZVOA124clRvPAt6nyoZoANYk=;
        b=H7wgLFc8bRdiabETAdiek3CZbeofCIC70hT8lMqdKRrqBTz5J3w/K3O1je23YUp5zo
         CA7D3RHrptBL9eVenO6TM1C2RuWVPpMBIAUetEJSuUk7edV9qnzJV8qAfMj8AosPaAqR
         a95pcyscbA2a3fegXpMj5j4JV4yI5H2UzchxLBU4dQrv4pBhVUeVwxxskfdzHbnjMAW5
         Y4yMH7fiVm7khorZfqI1tajKtEweyJCsElnyRfuCRoCZyhsMIeGSnfpDXeMRc4EJe6tG
         M1LA1YaTSezMJtT6Pgmt79bErehmBmI97v3CqVu3zRhbn1xk4t8Q9QwfvpkHHRPABhSm
         qSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmElgFj0DV1qbLm4uVX3aTA2cnDeVTl6mFcO4SVh32yDN+cUOTfeI97jhPmIJPq/wfC650amooj/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp0zFX488h1ps+Xmr+mkYyxsvAX8zV0fVKdkl4HvHvUJCGS4eT
	yEVIkSVzerzbv8j1CWkbFcI6uWeG/D1Tnbi4hXWZz3R4xuSiy7M26IcpzRPGnqjk+ikPsqDCZ+K
	8A7fvrNRfG9SQqAqwvYSSNQPpWOjVTw6PGNWsJnUlYkRk4HOPEAnNgWKiMyGZAfdHUwkY
X-Gm-Gg: ASbGncvhPbQqflt+vT88bYDef+e29V5HnAq828X9MzxF32Ze5SpVN1ZwW56NOulwh5b
	SlfH+LlsOv/d44Jep1Va2Zq/lDQ/j0wLz2rns1FAilDQJXUOw3go3WqB/Mho8eyjIdEtH5HlhKP
	SR0pjbLsLUZp6plu78xBUio+Vxp14LUTxNotMsDYvhX4GAFO7FL78KkwTWUcB49tofRIP0s7Zim
	DWnK4Rg71vLOVS3DzjMurLJAc6jIxOlheRMVDliis1ZYFBUxE4STYfmSfWMxOQ97Q5VfixqLPkz
	whC5XyBeqw5X3mp1dcuAx/Qi0QSUb7PpkKmBYh7Ts5ycNMPj3sQKOIz30p68wG28C//YnvW6I7v
	MTWI=
X-Received: by 2002:a05:622a:1915:b0:4ed:8fa:6fc4 with SMTP id d75a77b69052e-4ee4971d531mr1625091cf.78.1763575505162;
        Wed, 19 Nov 2025 10:05:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyg2JyzSrFhB2LMApC4ECHgD7juQRduC9UIz0/PCIU7u2oBKhMX1CSoSw3khRb1Qff2CShKQ==
X-Received: by 2002:a05:622a:1915:b0:4ed:8fa:6fc4 with SMTP id d75a77b69052e-4ee4971d531mr1616981cf.78.1763575499123;
        Wed, 19 Nov 2025 10:04:59 -0800 (PST)
Date: Wed, 19 Nov 2025 13:04:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
	gengdongjiu1@gmail.com, peter.maydell@linaro.org,
	alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
	harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
	dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
	vsementsov@yandex-team.ru, eduardo@habkost.net,
	marcel.apfelbaum@gmail.com, philmd@linaro.org,
	wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/5] error: error_free(NULL) is safe, drop unnecessary
 conditionals
Message-ID: <aR4GyA3nfvelqr7i@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-5-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DQLnCQFG-dR6bzry34mA41i5Bnie-aBcj6dJWi3xYL4_1763575505
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 19, 2025 at 02:08:54PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


