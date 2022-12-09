Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37F647DB2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 07:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457627.715590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Wfq-0001VG-AP; Fri, 09 Dec 2022 06:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457627.715590; Fri, 09 Dec 2022 06:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Wfq-0001Sm-7p; Fri, 09 Dec 2022 06:15:54 +0000
Received: by outflank-mailman (input) for mailman id 457627;
 Fri, 09 Dec 2022 06:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cKCu=4H=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p3Wfo-0001Se-Ka
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 06:15:53 +0000
Received: from mail.zlw.email (unknown [112.49.95.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e544d45f-7788-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 07:15:48 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id E47B9173F38
 for <xen-devel@lists.xenproject.org>; Fri,  9 Dec 2022 06:15:56 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwgq-QIBed5l for <xen-devel@lists.xenproject.org>;
 Fri,  9 Dec 2022 14:15:53 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id A36B514D318
 for <xen-devel@lists.xenproject.org>; Fri,  9 Dec 2022 14:15:53 +0800 (CST)
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
X-Inumbo-ID: e544d45f-7788-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	content-transfer-encoding:content-type:content-type:to:subject
	:subject:from:from:content-language:user-agent:mime-version:date
	:date:message-id; s=dkim; t=1670566553; x=1673158554; bh=nA7R47t
	Tdl20TIHEF7c8v7tdlyG43QOy63SNKNJo4co=; b=Bbqc1k+VIuoJkwHJoEnbLAF
	uDFOYFrqHP57n6xo0YGvXH0p2FejFZMdfxWJMNbVyMsSE86ULo11VCtjwprEdtVx
	hcC663wQwgA8DfaTeR1x6/IC50xTZR4bjTEQoLTftpSOoHLYkEVazRo60s1zNlWs
	WCqAdSBCV30oVV/2jH9I=
X-Virus-Scanned: amavisd-new at zlw.email
Message-ID: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
Date: Fri, 9 Dec 2022 14:15:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
From: sisyphean <sisyphean@zlw.email>
Subject: [BUG]Add PCIE devie to SMMUv3 fail
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I try to run XEN on my ARM board(Sorry, for some commercial reasons, I 
can't tell you
on which platform I run XEN)  and add PCIE device passthrough to 
DomU.But an error
occurred while adding the PCIE device to SMMUv3.

Through reading the code and tracing debugging, the error is found in 
the function
arm_smmu_add_device, which will obtain and determine whether the fwspec 
of the
device to be added to SMMU exists.But for the XEN of arm, the fwspec of 
the device is
created and added by judging whether the iommu field exists in the 
device node when
XEN parses the device tree.However, the PCIE device does not appear in 
the device tree,
so there will be no fwspec for all PCIE devices. When attempting to add 
a PCIE device to
SMMU, a ENODEV error will be returned.

In addition, the code at xen/drivers/passthrough/pci.c also verifies the 
above view.
For PCIE devices, pdev is alloc in function pci_add_device by 
alloc_pdev.However,
the function alloc_pdev does not create and add fwspec to the PCIE 
device.Therefore,
when function pci_add_device executes to iommu_add_device,it will get 
the error
return of ENODEV.

How can I resolve the above errors?

The XEN version I am running is RELEASE-4.16.2.

English is not my native language; please excuse typing errors.

Cheers,

-- 
Sisyphean


