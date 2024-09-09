Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D399713D6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794081.1202775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snan7-0006zN-7y; Mon, 09 Sep 2024 09:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794081.1202775; Mon, 09 Sep 2024 09:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snan7-0006xD-5C; Mon, 09 Sep 2024 09:34:37 +0000
Received: by outflank-mailman (input) for mailman id 794081;
 Mon, 09 Sep 2024 09:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snan5-0006x7-Py
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:34:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8dbc681-6e8e-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 11:34:33 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso311183866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:34:33 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25831875sm319652066b.11.2024.09.09.02.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 02:34:31 -0700 (PDT)
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
X-Inumbo-ID: b8dbc681-6e8e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725874473; x=1726479273; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NRyh/aGyQgoWXnQtvFJ1nwvJaqSBbLKFDoZvenzm3cI=;
        b=ezxtg666buFs+pOOoUEJMG8EpJAB0vLBt7TfJMgx2hhdfXPUTpEHgL6O69qM+ltRmy
         hm9MW7Od46PlCzuZj/5ZPKWw/PzJVXJk7cXsHsRysfEfqKA0HbjuD2RUs5aDLJr70oOL
         13DPshZR/maN9GZVv2dgCbhkImJwFBbsoOLuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874473; x=1726479273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRyh/aGyQgoWXnQtvFJ1nwvJaqSBbLKFDoZvenzm3cI=;
        b=g9kaRHgGLIcKTEETJ0rbCZlKoe4i+CQ+o1r5E0ZFQYN/QCnfAragt8MQHQi7EEEzYo
         H66IV0m2Q3O3PHX0Ev226Xt9f4BQcSmgD7NV0/arM2xxC9cd7MV0BSQ5Zm5kBloKWOdD
         mSDu3qAYT50heybbXNjyLyotYAzk5CYPkbd3n/kNTXa/ORDtpTpa7AeBJz2UuQl83oUf
         DhxD3805ePm8Rfk3GRmYQ/kAZkw9DQ983fHz9XtKukidxzLAFwe8pfrhKSfsu2tbsyBm
         +/5O7D8bhQdE1SAl1ZV6QeLT+Bs9FXClMBJRF8EGcOvv4nsUzkV8XM4Dal3aPpv/O992
         b0Sw==
X-Gm-Message-State: AOJu0Yxvf0TRTg3tF+TNlmbbKYbr2XvkPpD39Rpz/SvJiJe8rPm8hTb5
	zwci4QcYdxwpsH9ssnjGYiaUFk0rj1uDOeLw/DNsD8M8BWdZdUEU0nwd4BqdFGU=
X-Google-Smtp-Source: AGHT+IGFzVrQrFII+vFg/p4MIfMjsjiB/jGlR9yJpjOqHBpAg/q3eaaNP3bbp92V58xEzE9IcukbVw==
X-Received: by 2002:a17:907:3207:b0:a8a:7f08:97a6 with SMTP id a640c23a62f3a-a8a88601b8bmr891330766b.24.1725874473012;
        Mon, 09 Sep 2024 02:34:33 -0700 (PDT)
Date: Mon, 9 Sep 2024 11:34:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v14 1/5] xen/pci: Add hypercall to support reset of
 pcidev
Message-ID: <Zt7BJrgZ_KY3NVGf@macbook.local>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com>
 <20240903070424.982218-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903070424.982218-2-Jiqian.Chen@amd.com>

On Tue, Sep 03, 2024 at 03:04:20PM +0800, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the Xen hypervisor
> doesn't get notification, so the cached state in vpci is all
> out of date compare with the real device state.
> 
> To solve that problem, add a new hypercall to support the reset
> of pcidev and clear the vpci state of device. So that once the
> state of device is reset on dom0 side, dom0 can call this
> hypercall to notify hypervisor.
> 
> The behavior of different reset types may be different in the
> future, so divide them now so that they can be easily modified
> in the future without affecting the hypercall interface.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

