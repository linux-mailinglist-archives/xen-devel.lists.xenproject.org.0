Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E32D77D3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 15:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50663.89401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knjQN-0000cT-Bh; Fri, 11 Dec 2020 14:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50663.89401; Fri, 11 Dec 2020 14:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knjQN-0000c7-88; Fri, 11 Dec 2020 14:29:35 +0000
Received: by outflank-mailman (input) for mailman id 50663;
 Fri, 11 Dec 2020 14:29:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knjQL-0000bz-Na
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 14:29:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knjQH-0007YB-VR; Fri, 11 Dec 2020 14:29:29 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knjQH-0006jH-Nv; Fri, 11 Dec 2020 14:29:29 +0000
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
	bh=QAvuEyVoXxjXe/JQfwr5Wkh2jPuI7x0e83APCvioKjY=; b=CnplNqXsDHJwa2Dh5oeDrTlf3J
	Wee/RRdilYzOSJd9RXDtXPw2Gu+a6zqhUvWmIrav8/E64/eKjdHOJ+Ba2ENrf6JaZm4uhXN0egqpq
	59zmG4T2h2KI67Pp68BwIuWRta2Pp4S7Q7AXmqWtld/iODgw1Mh8CCu6mQPzI9/JBvPY=;
Subject: Re: [PATCH v3 0/8] xen/arm: Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1607617848.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ea121c23-4deb-c566-4d1d-bb9dd4959015@xen.org>
Date: Fri, 11 Dec 2020 14:29:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1607617848.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 10/12/2020 16:56, Rahul Singh wrote:
> This patch series is v3 of the work to add support for the SMMUv3 driver.
> 
> Approach taken is to first merge the Linux copy of the SMMUv3 driver
> (tag v5.8.18) and then modify the driver to build on XEN.
> 
> MSI and PCI ATS functionality are not supported. Code is not tested and
> compiled. Code is guarded by the flag CONFIG_PCI_ATS and CONFIG_MSI to compile
> the driver.
> 
> Code specific to Linux is removed from the driver to avoid dead code.
> 
> Driver is currently supported as tech preview.
> 
> Following functionality should be supported before driver is out for tech
> preview
> 1. Investigate the timing analysis of using spin lock in place of mutex when
>     attaching a  device to SMMU.
> 2. Merged the latest Linux SMMUv3 driver code once atomic operation is
>     available in XEN.
> 3. PCI ATS and MSI interrupts should be supported.
> 4. Investigate side-effect of using tasklet in place of threaded IRQ and fix
>     if any.
In your last e-mail, you wrote that you would investigate and then come 
back to use. It wasn't clear that this meant you will not deal with it 
in this series.

> 5. fallthorugh keyword should be supported.

This one should really be done now... It is not a complicated one...

> 6. Implement the ffsll function in bitops.h file.

... same here.

Cheers,

-- 
Julien Grall

