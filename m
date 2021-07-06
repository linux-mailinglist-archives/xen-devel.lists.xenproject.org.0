Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5575D3BD289
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 13:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151139.279350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jU3-0000E4-OR; Tue, 06 Jul 2021 11:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151139.279350; Tue, 06 Jul 2021 11:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jU3-0000AX-L0; Tue, 06 Jul 2021 11:43:23 +0000
Received: by outflank-mailman (input) for mailman id 151139;
 Tue, 06 Jul 2021 11:43:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4CK=L6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1m0jU2-0000AQ-Bn
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 11:43:22 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fdbce40-64e2-442b-b210-3467cea16f59;
 Tue, 06 Jul 2021 11:43:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so2036407wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 04:43:21 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:8ded:51e8:71ae:2d44?
 ([2a00:23c5:5785:9a01:8ded:51e8:71ae:2d44])
 by smtp.gmail.com with ESMTPSA id h14sm18478762wro.32.2021.07.06.04.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 04:43:20 -0700 (PDT)
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
X-Inumbo-ID: 4fdbce40-64e2-442b-b210-3467cea16f59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9RHEiyp7VvAXpOO84jbvH6uqtnFQPgtG9Yetjb51KW8=;
        b=lmL7IzUhmP1i7fTCBJEno71okFu6k+r4ms2C+GYjKd6c1Ry15VRiTKDC4gxfT1ruaC
         77wFJLzrRbg2mGhUwInmI780s28W2SGusQFnpArpvHPudU+vy6hk1AsUdIzD9M0pdMgb
         w2Wk9Pa7bE2zN/vILC3WhZSdfnxn5qUBFVwrv2yYsvpZBExZmviRYoR+ZwVQusG70qyX
         FltXrhccf8XGF5uqDgs3170vtGnVi4vnRgAKTX83XoTai/+9B51G7mBRAUrjJWijPGk/
         cjfnAT8AyBkOP28BWM7UajoySCu57VEfKJFv6ABndw463K3MtjG0aALHRkhA1xnU0jMJ
         ua3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9RHEiyp7VvAXpOO84jbvH6uqtnFQPgtG9Yetjb51KW8=;
        b=fw1Kttcnnljqn+8idCZi9ifSA51GUr6oc1LgJBd4YZSstn5IUvCnrQ+LLH+Yr1J13Y
         Jy0ctmVtVm1xJARstcxEvLybISTR9uhqE4D/ehQ+1T9QJ/y1GA3zl4U/9uR2fI9y8itD
         hJ+yruQh/0y49v0n9xz5c3SRpH22bvttJCNiiQCRoCmC3yaoeMAhiR6IG4Bx55rcullT
         wopkFgsbWOvo2PQ8mXNhRdXbnN+BbcPCZ7JqiPotpXpVmlpYqoFpr4l+smO6Bv6ySHAR
         yrQGbtHlvfsqKbTh1MpLrSaGeS5kOUmwUFhWGAfKKWjc6KY3NPJ1Krja4rq5rqI8aLNT
         j4DQ==
X-Gm-Message-State: AOAM531qJOQiPsQ3Yj+0WZ3sEXwWz2KnTvDf26ZDTUJAI4hvX7jvXBCE
	4uv2BSTFSmJesgGkIAYdM5o=
X-Google-Smtp-Source: ABdhPJzakmYogrVwphx12G12F6mQItH/4WuGAM8/VrSMC/6id7xv88WkBX+l6qeAA1Wg5TtrExgQWA==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr19930688wml.59.1625571800878;
        Tue, 06 Jul 2021 04:43:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH v5] IOMMU: make DMA containment of quarantined devices
 optional
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <e1f30ef7-6631-609d-6948-e9b1f3fa3b37@suse.com>
Message-ID: <c4293a9b-14f0-2fc5-6e04-988cfef2deda@xen.org>
Date: Tue, 6 Jul 2021 12:43:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e1f30ef7-6631-609d-6948-e9b1f3fa3b37@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26/05/2021 09:19, Jan Beulich wrote:
> IOMMU: make DMA containment of quarantined devices optional
> 
> Containing still in flight DMA was introduced to work around certain
> devices / systems hanging hard upon hitting a "not-present" IOMMU fault.
> Passing through (such) devices (on such systems) is inherently insecure
> (as guests could easily arrange for IOMMU faults of any kind to occur).
> Defaulting to a mode where admins may not even become aware of issues
> with devices can be considered undesirable. Therefore convert this mode
> of operation to an optional one, not one enabled by default.
> 
> This involves resurrecting code commit ea38867831da ("x86 / iommu: set
> up a scratch page in the quarantine domain") did remove, in a slightly
> extended and abstracted fashion. Here, instead of reintroducing a pretty
> pointless use of "goto" in domain_context_unmap(), and instead of making
> the function (at least temporarily) inconsistent, take the opportunity
> and replace the other similarly pointless "goto" as well.
> 
> In order to key the re-instated bypasses off of there (not) being a root
> page table this further requires moving the allocate_domain_resources()
> invocation from reassign_device() to amd_iommu_setup_domain_device() (or
> else reassign_device() would allocate a root page table anyway); this is
> benign to the second caller of the latter function.
> 
> In VT-d's domain_context_unmap(), instead of adding yet another
> "goto out" when all that's wanted is a "return", eliminate the "out"
> label at the same time.
> 
> Take the opportunity and also limit the control to builds supporting
> PCI.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

