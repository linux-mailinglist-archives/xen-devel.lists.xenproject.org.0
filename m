Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C09311C43
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 09:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82089.151719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8JFT-0001WN-4g; Sat, 06 Feb 2021 08:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82089.151719; Sat, 06 Feb 2021 08:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8JFT-0001Vz-1V; Sat, 06 Feb 2021 08:47:23 +0000
Received: by outflank-mailman (input) for mailman id 82089;
 Sat, 06 Feb 2021 08:47:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l8JFR-0001Vu-Cm
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 08:47:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8JFR-0004fo-33; Sat, 06 Feb 2021 08:47:21 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8JFQ-0000Lx-Qn; Sat, 06 Feb 2021 08:47:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=aCHl8+f/ltmkEPWqrrxaCuzIovfzdfgo+iOfS+H6FX8=; b=XAly+ESxphs9pxEN4sBDCEYAPX
	nPqlY+uopvgyMMdkpri+QX5Zv2b4zVUsii8pG+1qGIW+vhrdNxD6gkcqRVKnSjT2bUzhE2RHln69p
	G0UDn8/kiAg6JJmqzJyFDsolcXmSRSBxNShy5fKurF3ndB/pFtIIWbtXD+YBzZ7qPwGU=;
Subject: Re: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid
 addresses
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 Elliott Mitchell <ehem+xen@m5p.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com>
 <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
 <b6d342f8-c833-db88-9808-cdc946999300@xen.org>
 <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s>
 <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org>
 <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com>
 <alpine.DEB.2.21.2102031519540.29047@sstabellini-ThinkPad-T480s>
 <9b97789b-5560-0186-642a-0501789830e5@xen.org>
 <alpine.DEB.2.21.2102041435300.29047@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <f87cd0dc-fb01-bf4e-b8f9-66fceb1884f3@xen.org>
Date: Sat, 6 Feb 2021 08:47:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102041435300.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/02/2021 22:39, Stefano Stabellini wrote:
> After the discussion with Rob, it is clear that we have to add a check
> on the node name for "pcie" in dt_bus_pci_match. However, that wouldn't
> solve the problem reported by Elliot, because in this case the node name
> is "pci" not "pcie".

I'd like to point out that in the Linux case, the problem was in the 
hostbridge and not the PCI device.

> 
> I suggest that we add a check for "pci" too in dt_bus_pci_match,
> although that means that our check will be slightly different from the
> equivalent Linux check. The "pci" check should come with an in-code
> comment to explain the situation and the reasons for it to be.

I'd like to follow the same approach as a Linux commit:

commit d1ac0002dd297069bb8448c2764c9c31c4668441
Author: Marc Zyngier <maz@kernel.org>
Date:   Wed Aug 19 10:42:55 2020 +0100

     of: address: Work around missing device_type property in pcie nodes

This means a warning should also be added.

Cheers,

-- 
Julien Grall

