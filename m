Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0B295B7B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10289.27314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWf9-000163-7o; Thu, 22 Oct 2020 09:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10289.27314; Thu, 22 Oct 2020 09:13:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWf9-00015e-4i; Thu, 22 Oct 2020 09:13:35 +0000
Received: by outflank-mailman (input) for mailman id 10289;
 Thu, 22 Oct 2020 09:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVWf8-00015Z-90
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:13:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6d671e3-151e-465f-a228-4bba560ce2f8;
 Thu, 22 Oct 2020 09:13:33 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVWf6-0003jb-0d; Thu, 22 Oct 2020 09:13:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVWf5-0000It-Oj; Thu, 22 Oct 2020 09:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVWf8-00015Z-90
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:13:34 +0000
X-Inumbo-ID: d6d671e3-151e-465f-a228-4bba560ce2f8
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d6d671e3-151e-465f-a228-4bba560ce2f8;
	Thu, 22 Oct 2020 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=eVX4KsOWO0VfBR4o9B+a/URh7DqYVZ4bWqLYe2Rt4WE=; b=KKQJmGHgOP/aWsqkQmfpNGhzOz
	Pkpt4311Ke0/+b0CgyH+hPgvJnEsH9Zq+wnku8uRkpvv5zItOeBSgY4OtYY+V9cjIYivm0kQacXqy
	sm5H8On5hOuESwPzNTf5SVdCNux8I3/KfeEcOUpOJJuOATuj/dbhKEELyjq+HyvHqe+o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVWf6-0003jb-0d; Thu, 22 Oct 2020 09:13:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVWf5-0000It-Oj; Thu, 22 Oct 2020 09:13:31 +0000
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
Date: Thu, 22 Oct 2020 10:13:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022014310.GA70872@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 22/10/2020 02:43, Elliott Mitchell wrote:
> Linux requires UEFI support to be enabled on ARM64 devices.  While many
> ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
> potentially taking over.  Some common devices may need ACPI table
> support.
> 
> Presently I think it is worth removing the dependancy on CONFIG_EXPERT.

The idea behind EXPERT is to gate any feature that is not considered to 
be stable/complete enough to be used in production.

I don't consider the ACPI complete because the parsing of the IORT (used 
to discover SMMU and GICv3 ITS) is not there yet.

I vaguely remember some issues on system using SMMU (e.g. Thunder-X) 
because Dom0 will try to use the IOMMU and this would break PV drivers.

Therefore I think we at least want to consider to hide SMMUs from dom0 
before removing EXPERT. Ideally, I would also like the feature to be 
tested in Osstest.

The good news is Xen Project already has systems (e.g. Thunder-X, 
Softiron) that can supported ACPI. So it should hopefully be a matter to 
tell them to boot with ACPI rather than DT.

Cheers,

-- 
Julien Grall

