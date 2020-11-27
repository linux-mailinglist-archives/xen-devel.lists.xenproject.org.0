Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A92C6C6D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 21:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39757.72767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kik3s-0000hj-VP; Fri, 27 Nov 2020 20:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39757.72767; Fri, 27 Nov 2020 20:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kik3s-0000hK-Rm; Fri, 27 Nov 2020 20:09:44 +0000
Received: by outflank-mailman (input) for mailman id 39757;
 Fri, 27 Nov 2020 20:09:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwIZ=FB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kik3r-0000hE-SA
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 20:09:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33d1c58d-1310-46dc-875c-ebd9ed746a41;
 Fri, 27 Nov 2020 20:09:43 +0000 (UTC)
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
X-Inumbo-ID: 33d1c58d-1310-46dc-875c-ebd9ed746a41
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606507782;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+EFxz8/rmX57fBxC+oYo5RiAUokwIeN+tlcej19CYOs=;
  b=JMS6JVkvH4NcQWFJfD6Jo18aW1RhN/unHuX2szVFBoyb1fq8SWOUrra2
   bRjGDPo5vLMQW605PYWZRWn4guiJemW+TmUrQu47lV0rFtgobyfmtiQ84
   LRhYWL4erPcmVHS5Gm5lyexPs46zwXGWlHnacu/UNQ8jR//bfE2gIjz53
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Hr1ouXEySYZQ9z7Q1ynnKpRuzi2sB2wC7r6ybx3qESg8K5zGj9PuT/aCcECRkYgDFjWg0C7buC
 df5m2AnLRvkAvCiSavOKWpGwDB7SFsx57I6OHeJBARgRvsm8/uHokGNc+7bhfaW8lUEvn/hSw8
 6aEFZ/serhdwZC7c1GvbX7/jWfNimrHwujFlS7wALU9/OGcpY4fB6rgtrtNj41slRQJc/i6WRT
 84wBVbOtzyC+0zkYyIpeTA/biimmkr0Ns5bluM6+BclbIMmiERbUIboP9Xm5EeX0ZulsOFfsJL
 7tY=
X-SBRS: None
X-MesageID: 32036501
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,375,1599537600"; 
   d="scan'208";a="32036501"
Subject: Re: [PATCH v4 0/3] xen/arm: Make PCI passthrough code non-x86
 specific
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1606326929.git.rahul.singh@arm.com>
 <44df65a3-b23d-7dee-e6aa-28101b39ab21@citrix.com>
Message-ID: <c576d1f3-f9c8-9051-c5e3-83b704aac499@citrix.com>
Date: Fri, 27 Nov 2020 20:09:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <44df65a3-b23d-7dee-e6aa-28101b39ab21@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 27/11/2020 20:04, Andrew Cooper wrote:
> On 25/11/2020 18:16, Rahul Singh wrote:
>> This patch series is v4 of preparatory work to make PCI passthrough code
>> non-x86 specific.
>>
>> Rahul Singh (3):
>>   xen/pci: Move x86 specific code to x86 directory.
>>   xen/pci: solve compilation error on ARM with HAS_PCI enabled.
>>   ns16550: Gate all PCI code with CONFIG_X86
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/222243396
>
> There was an ARM randconfig failure which looks relevant to the content
> in this series.

Sorry - this randconfig failure was also seen against a second series,
so probably is collateral damage from elsewhere.

~Andrew

