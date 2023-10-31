Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D460B7DCDA8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625693.975218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxodD-0000Cx-Gw; Tue, 31 Oct 2023 13:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625693.975218; Tue, 31 Oct 2023 13:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxodD-00009N-DT; Tue, 31 Oct 2023 13:18:07 +0000
Received: by outflank-mailman (input) for mailman id 625693;
 Tue, 31 Oct 2023 13:18:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxodC-00009G-3l
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:18:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxod7-0003KF-2P; Tue, 31 Oct 2023 13:18:01 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.9.249]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxod6-0006VA-SQ; Tue, 31 Oct 2023 13:18:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=gERv1XqFn0hMvu6UdueVArG61XDoNGu00oD5C9uauTc=; b=x4EwJGjPEMkRfZ2hMgG23bqWSE
	IcSINfBHE7cbKLy5nt1tx1HyysbO5j6bfnnhDeGFHkWB5PVNMHLDgy0btxKKffKljdTIQaog8zVIT
	wzHex/+9c3xOUNXqpOIB6r+0wMKyVPvL8HNOVWR+0/U6QXCsAl6I784jRXlU6LqTYh/g=;
Message-ID: <784fa30f-cdce-4d0b-97d1-a22ac52aa8c9@xen.org>
Date: Tue, 31 Oct 2023 13:17:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <20231030235240.106998-5-stewart.hildebrand@amd.com>
 <2f828bd2-e6f8-15b5-b226-33e2b33ebba8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2f828bd2-e6f8-15b5-b226-33e2b33ebba8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/10/2023 11:03, Jan Beulich wrote:
> On 31.10.2023 00:52, Stewart Hildebrand wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1618,6 +1618,16 @@ int iommu_do_pci_domctl(
>>           bus = PCI_BUS(machine_sbdf);
>>           devfn = PCI_DEVFN(machine_sbdf);
>>   
>> +        if ( IS_ENABLED(CONFIG_ARM) &&
>> +             !is_hardware_domain(d) &&
>> +             !is_system_domain(d) &&
>> +             (!IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) || !has_vpci(d)) )
> 
> I don't think you need the explicit ARM check; that's redundant with
> checking !HAS_VPCI_GUEST_SUPPORT. It's also not really clear why you
> need to check for the system domain here.

I might be missing but I wouldn't expect the domain to have vPCI enabled 
if CONFIG_HAVE_VPCI_GUEST_SUPPORT=n. So why can't this simply be:

if ( !has_vcpi(d) )
{
    ...
}

Cheers,

-- 
Julien Grall

