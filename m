Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C237223C35
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 15:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwQH9-0008G4-5m; Fri, 17 Jul 2020 13:19:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jwQH8-0008Fw-C4
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 13:19:42 +0000
X-Inumbo-ID: 2aefe192-c830-11ea-95fc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2aefe192-c830-11ea-95fc-12813bfff9fa;
 Fri, 17 Jul 2020 13:19:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 556FAB7CA;
 Fri, 17 Jul 2020 13:19:43 +0000 (UTC)
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
Date: Fri, 17 Jul 2020 15:19:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.07.2020 15:14, Bertrand Marquis wrote:
>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.07.2020 19:10, Rahul Singh wrote:
>>> # Emulated PCI device tree node in libxl:
>>>
>>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
>>
>> I support Stefano's suggestion for this to be an optional thing, i.e.
>> there to be no need for it when there are PCI devices assigned to the
>> guest anyway. I also wonder about the pci_ prefix here - isn't
>> vpci="ecam" as unambiguous?
> 
> This could be a problem as we need to know that this is required for a guest upfront so that PCI devices can be assigned after using xl. 

I'm afraid I don't understand: When there are no PCI device that get
handed to a guest when it gets created, but it is supposed to be able
to have some assigned while already running, then we agree the option
is needed (afaict). When PCI devices get handed to the guest while it
gets constructed, where's the problem to infer this option from the
presence of PCI devices in the guest configuration?

Jan

