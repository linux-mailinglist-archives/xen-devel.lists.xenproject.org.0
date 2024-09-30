Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42698A5A6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 15:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807412.1218856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGgD-0005IG-ES; Mon, 30 Sep 2024 13:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807412.1218856; Mon, 30 Sep 2024 13:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGgD-0005GJ-BO; Mon, 30 Sep 2024 13:43:13 +0000
Received: by outflank-mailman (input) for mailman id 807412;
 Mon, 30 Sep 2024 13:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1RI=Q4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1svGgB-0005Fd-Nf
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 13:43:11 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edfef1ea-7f31-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 15:43:09 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso732960266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 06:43:09 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776de0sm537733666b.2.2024.09.30.06.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:43:08 -0700 (PDT)
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
X-Inumbo-ID: edfef1ea-7f31-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727703789; x=1728308589; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dz+uFfNB/BF9suA/r+paSHxtfck/SbbQozHu9sD1gNg=;
        b=g8jwewBm4eV9TQHxuhJtyRmeuLC7IynnVp931NRafqPDXqrdz+00N26ISSm9yKkHPr
         bGnclu5/YAuDJBEbbM3xRM0gmRRsLIM4fypW3Xw+3XH9yqsHyH7fprxB5QHNiHRbzApK
         5B9zylS4y5Qh9d/HIG6I/twRkUvMpH7L8k1oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727703789; x=1728308589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dz+uFfNB/BF9suA/r+paSHxtfck/SbbQozHu9sD1gNg=;
        b=Hx1y/xXTYzlxidlpgJTeRXjOkCg7GVBsfbkkAd1DD+/ojAZvsJ2LBFBt2mU0W+qVwS
         vmEkMgTbDBDNgZUdo1X5l7wE3qmqBVy6Lnkm+jdwYNbv+99IXM5wMrUqy3czWDwuOOZo
         O/zPgDwlbx6RBnutSb1Q+5jxtYU7j/pB1T0ccs4eXIdF60w4TeO+1TaHCHhQBYKuLRCt
         keum4wX2CiPX5/oYGq3bhEBLeEw+UNAWD8fe9Bw17g0a8Np0GjgEpTp3wM8dljWkp/kA
         uXZsE9kYXPSD4tJbRMVxxFnMma/cn9Zt8Z6gZCNwQiIiuPsK0cTkvFwbAqaXf4EbPL/Z
         HPgw==
X-Forwarded-Encrypted: i=1; AJvYcCWhdMbrYQCejBA3v+FiazmCFfNkHEgL/4Rrili18s+6d92ZpT46EANtVBa0J9BIiU2eaLhRzuAGLOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGHyM//HhOnP7esUUs3kRKiYEXY0Zl2ry45XpgR6oipkjNxgXt
	BTUKOLBLUDMQzKOj/3TzL9NJMrRdTFZPG9UIV6Q+hg+3jVisW38Ddt+5Z2i9KceY0Nu1v27rIsE
	2
X-Google-Smtp-Source: AGHT+IGwlUE09cZ8eHS3tVeMmGqxvTjR4rmp7AANv9Y+gQ2TW+VCGvom6UK+LuWhdjkG8Vn3Od+9XQ==
X-Received: by 2002:a17:907:9706:b0:a8d:1774:eb73 with SMTP id a640c23a62f3a-a93c4aab95emr1405542166b.57.1727703789000;
        Mon, 30 Sep 2024 06:43:09 -0700 (PDT)
Date: Mon, 30 Sep 2024 15:43:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: make IOMMU list ro after init
Message-ID: <Zvqq699md9MzitbP@macbook.local>
References: <20240930102849.18309-1-roger.pau@citrix.com>
 <df77ceb2-b0fc-41f9-91f9-f61c3073f28a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df77ceb2-b0fc-41f9-91f9-f61c3073f28a@suse.com>

On Mon, Sep 30, 2024 at 12:33:56PM +0200, Jan Beulich wrote:
> On 30.09.2024 12:28, Roger Pau Monne wrote:
> > The only functions to modify the list, amd_iommu_detect_one_acpi() and
> > amd_iommu_init_cleanup(), are already init.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Surely the same can be said for VT-d's acpi_*_units? And likely other
> globals there and here?

Possibly, I wasn't explicitly looking for stuff in IOMMU code to
convert from read_mostly to ro_after_init, just came across this one
while looking at something in the area.

Thanks, Roger.

