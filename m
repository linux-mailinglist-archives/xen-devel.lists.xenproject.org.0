Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A8DC70944
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 19:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166288.1492858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmcZ-00053u-2R; Wed, 19 Nov 2025 18:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166288.1492858; Wed, 19 Nov 2025 18:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmcY-00051m-Vo; Wed, 19 Nov 2025 18:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1166288;
 Wed, 19 Nov 2025 18:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1IC=53=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1vLmcX-00051g-T3
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 18:09:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5c3e919-c572-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 19:09:33 +0100 (CET)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-c6rs5NeAOPKbS9c-50oZUQ-1; Wed, 19 Nov 2025 13:09:28 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-882529130acso440216d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 10:09:28 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e445b1csm262086d6.9.2025.11.19.10.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:09:26 -0800 (PST)
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
X-Inumbo-ID: e5c3e919-c572-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763575771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0DCGaHtOp5reLxorwEtMOeyn9iP1bnDso8ubGDPMiBA=;
	b=XgTOtcgdexDfsJ+X+OqqJ5+8V78uzi7WHn09zmWXL2TJrrZAO3SjToWTHSkfo6ZC/dcDQc
	XUm1f+tIK5oqF1ceh53R0uqeGZH0GMjDvc9tnEjckaSskJ/x4OugxayQpFl63jsl7Zer3K
	5pgXzsDngndfFvZKhIZ8jr8MCeccIZI=
X-MC-Unique: c6rs5NeAOPKbS9c-50oZUQ-1
X-Mimecast-MFC-AGG-ID: c6rs5NeAOPKbS9c-50oZUQ_1763575768
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575768; x=1764180568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DCGaHtOp5reLxorwEtMOeyn9iP1bnDso8ubGDPMiBA=;
        b=CbhebfLanbDRhenhQ7NZC2UViX+BEjzq5aYo25tLusXtoewIDe5ZBciYx9xUOsXh4r
         sipc4+neSTFfECdQIwaBw9t3dSUUu9ri1NMaRGS56E38o15unLrqardGw7cNQ5ncd0Md
         pTVunWd8h4tEtAf9kowm09asrGmTgpcBRchXYfMPOJV76qq8qPiuGxWH8e8ZY5I0iozu
         JtE0spwigI5TavqXWde93Y6Yv+Wj/jNBE4/27uTiE0Qzz+QzBSMHogE4dvr2lMOP5XHB
         4aPQvrBr8kCk5FqKc8KOh+fJjfKj5C/+CcvokQwOVQXiDHffZnuED3+b6nxnVP9yjhmx
         tn1g==
X-Forwarded-Encrypted: i=1; AJvYcCVqMkyE7ufwupVGSrjOvR8rqTn2KlbJzOVb2FRBQMP5I9dUwSPQSboTa7c0SYqCCiwwGtdVaBWx8/Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsZMmnNJuM0AuIm++3uguLLsRbXTdBmm4I/WYSVHcJe3YrncrK
	hTQ5zj3+o8Llst2do0nNDPGPkgzGL+86dMRQklsQixBmFNisXq4d4QGnY80oEtJ4vzxKmNCTLJb
	5P6jNjbdjKKaxZxualaIxoGcwNx1Ql0snZiH9Zcv8B0Ixrsks884BZdcG4S/MhS4pypG7
X-Gm-Gg: ASbGnctfQRM1ftwuQw2OvLG8qXnJO6iO4qiqySS+/HiL0v8h3eXbcepgdVtfeKZevnu
	rygBoU4jG+HtvO8fW9Lf8hvOlyHyOQSsD0jLWqV/jAihARZvLmF1xZgJm9kROXjozcHu0520roP
	6NqnJC5EXRH+AZJmZEReKAGCDtZSVk3lXgxx/BXKMJvZlL+MXav6YU8o4YTP/sJnIhHLUsTRqUm
	Ficy7q/uWQSruwLLiEbkP811FPU+RraXy+tvajtEFV/3qv5TxIoO3sjGW3UjoVlRZ9yuRirOczS
	pglr8jWYD90dcwn07K4kNLQSLb8TKqKJLQ8g/I8NkjjHxiXnuCA8cNnEXYPyrPdr13FTTOJL7uE
	VsRg=
X-Received: by 2002:a05:6214:3a85:b0:880:5730:d3db with SMTP id 6a1803df08f44-8846e054d65mr2568586d6.21.1763575767602;
        Wed, 19 Nov 2025 10:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhcLsZHPo01FYGgTUQih5BLapAokqbeuAA+4Y54wTxOgNgHkwNxLSBBg1nI3YTS9Sdt0XpFw==
X-Received: by 2002:a05:6214:3a85:b0:880:5730:d3db with SMTP id 6a1803df08f44-8846e054d65mr2567856d6.21.1763575767173;
        Wed, 19 Nov 2025 10:09:27 -0800 (PST)
Date: Wed, 19 Nov 2025 13:09:24 -0500
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
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler
 error reporting
Message-ID: <aR4H1FyafbvOUw2c@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-3-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8cCZSjKimj-rYEN4VaL6sHu068gSDL3X8p1ncAZeOxk_1763575768
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 19, 2025 at 02:08:52PM +0100, Markus Armbruster wrote:
> bbram_bdrv_error() interpolates a "detail" string into a template with
> error_setg_errno(), then reports the result with error_report().
> Produces error messages with an unwanted '.':
> 
>     BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
> 
> Replace both calls of bbram_bdrv_error() by straightforward
> error_report(), and drop the function.  This is less code, easier to
> read, and the error message is more greppable.
> 
> Also delete the unwanted '.'.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


