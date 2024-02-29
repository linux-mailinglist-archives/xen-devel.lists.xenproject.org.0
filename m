Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09686C889
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 12:53:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686957.1069599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfewy-0003Kx-Iu; Thu, 29 Feb 2024 11:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686957.1069599; Thu, 29 Feb 2024 11:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfewy-0003J4-Fx; Thu, 29 Feb 2024 11:51:44 +0000
Received: by outflank-mailman (input) for mailman id 686957;
 Thu, 29 Feb 2024 11:51:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfewx-0003Iy-52
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 11:51:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfeww-0002oJ-LQ; Thu, 29 Feb 2024 11:51:42 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfeww-0007UP-Dh; Thu, 29 Feb 2024 11:51:42 +0000
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
	bh=K6VjbTW6Jv+NExibT1D+zXR6Evxh9PaZtfdIcQv1kss=; b=XHRuc1fSjBKi0UE1ALQKQT9XDO
	DW7bxB4Ys6L4EhfZPbeP0Icz9bMpHWf2F8SqOzk+iT46uWCnuWJ78KvReWSzbUhn8jxGF47W7IBg8
	BdTG+/5uR3z6b5pZ0yx38zWs98zsmuXLt4HTGrf39d+OV7Z4RMEccj00vBpCp/1RguD4=;
Message-ID: <4778822e-582f-4e0d-9933-86d8d49ea3a5@xen.org>
Date: Thu, 29 Feb 2024 11:51:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IMPORTANT - : Need help on USB port virtualization with Xen
 hypervisor
Content-Language: en-GB
To: LARRIEU Dominique <dominique.larrieu@thalesgroup.com>
Cc: GOURLOT Francois <francois.gourlot@thalesgroup.com>,
 GRUO Nicolas <nicolas-n.gruo@thalesgroup.com>,
 Cc <xen-devel@lists.xenproject.org>, Kelly Choi <kelly.choi@cloud.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 WILLEMS Louis <louis.willems@thalesgroup.com>
References: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com>
 <bb2485e5-7818-435b-8d9c-dda88100979f@xen.org>
 <a46ac2e14fa2410eafc26a37a00a442f@thalesgroup.com>
 <427d2ecb865648b7a459c592c208c0be@thalesgroup.com>
 <673b2bc630d748e8af0a15d4b553906e@thalesgroup.com>
 <3ee3659afff645cabed86bcc22c44686@thalesgroup.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3ee3659afff645cabed86bcc22c44686@thalesgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dominique,

On 29/02/2024 10:33, LARRIEU Dominique wrote:
> Thank you for your quick answer.
> 
> You will find below our answers (in red) to your questions.
> 
> To summarize our request : what we would like is to use USB 3.0 driver with high speed configuration.
> Today, it is not possible to do that.
> The driver stay in full speed mode, and more often in USB 1.0 or 2.0 configuration.
> 
> Is it possible to configure the XEN USB 3.0 driver with the high speed mode ?
> (read in our answers below the reference to the driver)

Looking at what you provided below, it is still unclear what you mean by 
"Xen USB 3.0 driver". By any chance, are you confused with the "x" in xhci?

The drivers "xhci_hcd" and "xhci_pci" are generic and not 
provided/maintained by Xen. So far, with the information provided, it is 
unclear whether the problem is actually in the driver itself. I have a 
few more questions. See below.

>>      We are detecting several issues with USB port virtualization with the
> 
>>      Xen hypervisor.
> 
> 
> 
> Just to clarify, you are assigning the PCI USB bus (rather than just the USB device) to the guest. Is that correct?
> 
> 
> 
> If so...
> 
> 
> 
> [Thales] : we are using the USB chipset of the mother board (see below the references)

Thanks for the clarification. IIUC, you said you are having problem in 
the guest itself. Have you tried to access the same USB device from 
dom0? Or better without any Xen involved (i.e. booting Debian on baremetal).

This would help to narrow down the issue.

>>
> 
>>      We needyour helpto find a solution for these problems.
> 
>>
> 
>>      The Software used are :
> 
> 
> 
> Can you share some details of the HW you are using ?
> 
> 
> 
> [Thales] : HW :
> 
> [Thales] : We are using a GETAC X500 using the Mobile Intel QM175 Chipset
> 
> [Thales] : USB controller: Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller (rev 31)
> 
> [Thales] : Subsystem: Mitac 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller
> 
> 
> 
> [Thales] : SW :
> 
> [Thales] : Kernel driver in use: xhci_hcd
> 
> [Thales] : Kernel modules : xhci_pci
> 
> 
> 
>>
> 
>>      -Debian 11 version5.10.0-20

IIUC, before you said you had problem with Windows. So is this the 
software in dom0? Or did you actually try with Debian and still see the 
same issue?

Regarding the configuration, given you are using the official Debian 
package. Are you using 'xl' to create your guest?

The ideal would be if you can paste the full configuration. If you can't 
can you tell us if you are using any of these options: 'pci', 'usbdev', 
'usbctrl'?

[...]

>>      -Xen version4.14
> 
> 
> 
> Are minor version of Xen 4.14 are you using ? Any patches on top ?
> 
> 
> 
> Xen 4.14 has also been out of support for a few months now. If that’s possible, I would recommend to try a new Xen version (the last stable is
> 
> 4.18) just in case your issue as been fixed in newer release.
> 
> 
> 
> [Thales] : we have to use Xen release that are downloaded from the Debian official repository  (requested by our customer)
> 
> [Thales] : the last one is version 4.14, but we would like to know if there is one more recent that is compatible with Linux Debian 11 ?

Newer Xen releases should be compatible with Debian 11. But I am not 
aware of any "official" package for that specific version.

Cheers,

-- 
Julien Grall

