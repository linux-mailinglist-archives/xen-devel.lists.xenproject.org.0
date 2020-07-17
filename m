Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD9223D4A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQjl-0002qU-Bb; Fri, 17 Jul 2020 13:49:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwQjj-0002qK-1f
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:49:15 +0000
X-Inumbo-ID: 4bde736a-c834-11ea-9606-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bde736a-c834-11ea-9606-12813bfff9fa;
 Fri, 17 Jul 2020 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YE6DBSEQEIn+3sn8+Xy9OlDLHar9Uf+a2hkRZnMCq1s=; b=CXX0QJZXuqvDKSXetCm592Xg4f
 7R+pXkoW0c3iy3GsqdhoANELoGet5aQjY9SqEzWZFUCODP4L95JhgifLw4uG5fPgO+Y0CCdeBFHmW
 8/WWHZk15ao7SXNq68FfRT4bUFtpSvzds/LOzHsvHdVGvM9tUnoqTkkp6ZP+Ya0JqLYM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwQjf-0006zW-AZ; Fri, 17 Jul 2020 13:49:11 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwQjf-0007di-3m; Fri, 17 Jul 2020 13:49:11 +0000
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <339df023-7844-b998-81bd-8c00baad3b04@xen.org>
 <F91FCC13-D591-4A57-9840-220614174F02@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <239b5114-9e23-ab55-41b9-c02a2018e4ab@xen.org>
Date: Fri, 17 Jul 2020 14:49:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <F91FCC13-D591-4A57-9840-220614174F02@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/07/2020 14:44, Bertrand Marquis wrote:
> 
> 
>> On 17 Jul 2020, at 15:29, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 17/07/2020 14:22, Bertrand Marquis wrote:
>>>>> # Emulated PCI device tree node in libxl:
>>>>>
>>>>> Libxl is creating a virtual PCI device tree node in the device tree
>>>>> to enable the guest OS to discover the virtual PCI during guest
>>>>> boot. We introduced the new config option [vpci="pci_ecam"] for
>>>>> guests. When this config option is enabled in a guest configuration,
>>>>> a PCI device tree node will be created in the guest device tree.
>>>>>
>>>>> A new area has been reserved in the arm guest physical map at which
>>>>> the VPCI bus is declared in the device tree (reg and ranges
>>>>> parameters of the node). A trap handler for the PCI ECAM access from
>>>>> guest has been registered at the defined address and redirects
>>>>> requests to the VPCI driver in Xen.
>>>>
>>>> Can't you deduce the requirement of such DT node based on the presence
>>>> of a 'pci=' option in the same config file?
>>>>
>>>> Also I wouldn't discard that in the future you might want to use
>>>> different emulators for different devices, so it might be helpful to
>>>> introduce something like:
>>>>
>>>> pci = [ '08:00.0,backend=vpci', '09:00.0,backend=xenpt', '0a:00.0,backend=qemu', ... ]
>>
>> I like this idea :).
>>
>>>>
>>>> For the time being Arm will require backend=vpci for all the passed
>>>> through devices, but I wouldn't rule out this changing in the future.
>>> We need it for the case where no device is declared in the config file and the user
>>> wants to add devices using xl later. In this case we must have the DT node for it
>>> to work.
>>
>> Are you suggesting that you plan to implement PCI hotplug?
> 
> No this is not in the current plan but we should not prevent this to be supported some day :-)

I agree that we don't want to prevent extension. But I fail to see why 
this would be an issue if we don't introduce the option "vcpi" today.

Cheers,

-- 
Julien Grall

