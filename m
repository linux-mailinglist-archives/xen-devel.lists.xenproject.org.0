Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353271D5651
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 18:40:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZdNn-0000hJ-Ng; Fri, 15 May 2020 16:40:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iw4X=65=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jZdNl-0000hE-MM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 16:40:21 +0000
X-Inumbo-ID: c337ac1a-96ca-11ea-a599-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c337ac1a-96ca-11ea-a599-12813bfff9fa;
 Fri, 15 May 2020 16:40:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w64so3344242wmg.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2020 09:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wXiT8A/j8/brRNzY3NCxwEiCp+yIyHWy013b1kekcVE=;
 b=UBhG1TVi52CZx79fK1f7HHujMKtqrhG5qVPWuHYU8+FjuXY5zdkAjmki1pm3x3/CqD
 KfUw8jTczVeJc4OuiU9Y9YAptbYN81nARm25S+zm1tRl9X+3GOOFAjeR/PUmd6U35oQY
 sqIh2fbmhAynR+TFt17139L411wNQKvLWQ5+RV8baosjFjCd40msi/MVQdNP2qctTB2q
 haRZ7uZBJAmChSTb3ceOqQ32YCCvCdgoOohYOMwq2/z6DR/PK1n7t7JrSVb24DEb8/NJ
 wuq6sgJNUYA95BsHkIaVdCNsYjY+F10l4zqPGpYidgs7SgB+bcWyVL2UTZES2Q7ldwAD
 vl7Q==
X-Gm-Message-State: AOAM533XbG1s2AciEc7fteiMdD2UGh/9oZSeGunmpwwW8q1gBlFg0kKA
 zseU8YB1qeOfOhN2nTO6fVQ=
X-Google-Smtp-Source: ABdhPJzMfM+xGPeotI/kLGAKRdGSeS0WJG6IdZjVyZPhMNCboy92/SIIs+jwFireDIQ+DETcaI+1cg==
X-Received: by 2002:a1c:990d:: with SMTP id b13mr4772822wme.179.1589560818737; 
 Fri, 15 May 2020 09:40:18 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u127sm4440006wme.8.2020.05.15.09.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 09:40:18 -0700 (PDT)
Date: Fri, 15 May 2020 16:40:16 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
Message-ID: <20200515164016.ipftrwdykjd4j2yf@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <43811c95-aa41-a34a-06ce-7d344cb1411d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43811c95-aa41-a34a-06ce-7d344cb1411d@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 10:38:18AM +0200, Jan Beulich wrote:
> While it should have been this way from the beginning, not doing so will
> become an actual problem with PVH Dom0. The interface change is binary
> compatible, but requires tools side producers to be re-built.
> 
> Drop the bogus/unnecessary page alignment restriction on the input
> buffer at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

> ---
> v2: Use HANDLE_64() instead of HANDLE_PARAM() for function parameter.
> ---
> Is there really no way to avoid the buffer copying in libxc?

The buffer is managed by the caller. There is no good way for libxc to
know its properties as far as I can tell.

Wei.

