Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E832780E4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 08:51:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLhZn-00011L-U4; Fri, 25 Sep 2020 06:51:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLhZn-00011G-9l
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 06:51:27 +0000
X-Inumbo-ID: 0931068a-e63d-4b2a-aabb-9865dbad803e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0931068a-e63d-4b2a-aabb-9865dbad803e;
 Fri, 25 Sep 2020 06:51:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601016685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dEVjCZMELgtDiG1r+HTZ1owugKfyBFJmDWnF3hPnOs=;
 b=k+feRLpelOz4uOrZATO5qGV3KddIRzommIH6GecIa/NKk6X/lk9JZzIGv3c0Meq66egLcM
 mi3nw76Shj+yZ1eH/1ptB9PoyY4OYE40m3ytHgf4qT040h3/H+BshNflAoHJxFmog5NZIA
 eE8FvVJrlpEDv2hkMMfyWpl/zZeLpnM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEBC6AD52;
 Fri, 25 Sep 2020 06:51:25 +0000 (UTC)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
 <ffe5148a-e366-d1f1-0a32-2e385ac1934e@gmail.com>
 <a039e213-d25b-1819-3a37-8ed858fa17b8@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42aea418-a8f4-e2c0-fc08-b0c504da31bb@suse.com>
Date: Fri, 25 Sep 2020 08:51:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a039e213-d25b-1819-3a37-8ed858fa17b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.09.2020 20:02, Oleksandr wrote:
> On 24.09.20 19:02, Oleksandr wrote:
> Julien, I noticed that three fields mmio* are not used within current 
> series on Arm. Do we expect them to be used later on?
> I would rather not add fields which are not used. We could add them when 
> needed.
> 
> Would be the following acceptable?
> 1. Both fields "io_completion" and "io_req" (which seems to be the only 
> fields used in common/ioreq.c) are moved to common struct vcpu as part 
> of struct vcpu_io,
>      enum hvm_io_completion is also moved (and renamed).
> 2. We remove everything related to hvm_vcpu* from the Arm header.
> 3. x86's struct hvm_vcpu_io stays as it is (but without two fields 
> "io_completion" and "io_req").
>      I think, this way we separate a common part and reduce Xen changes 
> (which are getting bigger).

If this works, it would be my preference too. So far I was left
under the impression that you did move / mention further fields
for a reason.

Jan

