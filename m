Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039929AC92
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 13:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12833.33227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXOVb-0005as-0T; Tue, 27 Oct 2020 12:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12833.33227; Tue, 27 Oct 2020 12:55:26 +0000
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
	id 1kXOVa-0005aT-TJ; Tue, 27 Oct 2020 12:55:26 +0000
Received: by outflank-mailman (input) for mailman id 12833;
 Tue, 27 Oct 2020 12:55:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6MOI=EC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kXOVZ-0005aN-6O
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 12:55:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c019ee49-a27b-4477-85d6-67db177819c8;
 Tue, 27 Oct 2020 12:55:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6MOI=EC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kXOVZ-0005aN-6O
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 12:55:25 +0000
X-Inumbo-ID: c019ee49-a27b-4477-85d6-67db177819c8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c019ee49-a27b-4477-85d6-67db177819c8;
	Tue, 27 Oct 2020 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603803323;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jvMo3zUlhHZ29FEKKWNDQj4STOsiBHNcqKK1MMK43MI=;
  b=L72JS1c85Zh8o/wx2hIobHjMjpjU4hguhGAu1kXEB7milt0AGK3SXJvT
   I6Fbs2mpM+OqFnUcMjdU47B9QZvIUPw+3WNEv4A+QnfgCxAVpmfyumMtD
   P6V/NdepBHyQNsG9obTxv9SvCMoeAxhZD4jh2yPRlvXRiSmLfmJoXWIF/
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 32gkcY/iNEG3GZUbD/HLoFeKkw4FHN9Sbu6kEQCjR83MsBU7zyjm2xgYA/c3agVklHCNJ2eGH6
 NSl79jTFppVsPxa2PBh0DQCnwpirlyW2+K4zcebGHKwrRa73egMzoY+cbOdaGYj1Fld1jDX7vn
 VeY3vxzO373bVhOVQ5qrGuLtLPeuBcxU6hZvRl3VhjYcGQtDN04rSQDuqB4s9YtHUwwd3SHwzB
 Fd5TFwIAmwaZb/xFFesbLvb9GFTQdpHB4p3iNM9SgD4VrrRHfP8hDQZ0axFPqoka9ZfM8OkGsh
 V+A=
X-SBRS: None
X-MesageID: 29915959
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,423,1596513600"; 
   d="scan'208";a="29915959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUrGLgvKryT1EAxN0dfP9qnFLQvKNhCamcHFgpbydXIBdqKT1YDvfmfMXpMi2HMIoHnX6WnRHytGUjZ2wdViVnTWPq91QR5VwvkNqfVyqIVDIZplEaBNvRWsB+4HD8EKq2/iJjrLWRV0ITeWPEntXnLFUDGkQ4AvR0UwxvW3YWu75eXLxcPB/44b8MTgehQJo/3xyqSRIObn7BTcnPDR5O9aHIcb+yA9GsDLrW8Q+4uBj9wLqijKiYMZ02/sVo8jLlY2EZLeRgUyt0fa0oskNrRg6B8tez7iEIH5BRFNd5TGy84LS9WyF79SD3VLjp4+uHqRx9LQg8wcOYp9ebIliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SQer9U+hp0ru/DBwTtroRhttF7NK6NWubEMpGsj8BA=;
 b=IfdjjMCDO2CBLz2ovB5E1GH0XxjDja0jptdGquj2tPdhK5605SyZLjTWCiSmRbBF4D1cqD/heQ3CULXhXF/Ektu2TccD9cLwz5k+djFhUsxL9T5HHFomRycYlHBYhvTCZxT+JmPlA2WnHg+vxWvb8l881QVUEQDhHAHFJuuwquzV9LUqAqYCVu6hdQMz7HLuZu6OQabPonelp4GcCRVxNQj1iZLh8Uk4ivr+SA6bWzWR64MMZ5o0DulShOTkRkeDx+b9Uf8ObcBt9d08m3h4o3ITnl2tl1pfN35EBc1Y1DXiMsUQ48fME9zHH0XYproU2SkqX119vvDE4duCf+hOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SQer9U+hp0ru/DBwTtroRhttF7NK6NWubEMpGsj8BA=;
 b=dFMMc0rGPTayUQ3SeACooSqk7RvZb2ijxLGbGxe50frVg61ZITKFvCDadRYl+IKzdrPZ3KvmsAs8e8ja+XhZl0JYFIDwei75jpoLxBOF9uozYkwhzeUIxhIN+rhWKTf3d4xnGadOAvpsXt4Ju3f+MQXz6/kW+ilTXOaTVKPmxRg=
Date: Tue, 27 Oct 2020 13:55:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>, "paul@xen.org"
	<paul@xen.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Message-ID: <20201027125104.axv26kdqljqsvufn@Air-de-Roger>
References: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
X-ClientProxiedBy: LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 153f476a-2f98-431c-f715-08d87a778ef0
X-MS-TrafficTypeDiagnostic: DM6PR03MB4842:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4842BD5CACF77895298560038F160@DM6PR03MB4842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8WkXJGOS2TMoDt7rBjLBVe7lIK+almkvnu12kKCl4zd8nJpfDJWR3W9dqTtVXGk9Rxk0c+10BfyN+nuqB5O7ZoJdoAkEYYRbWqqfpRY73ijUbJq9WCGKIdb+FNijgsvsalJO/l3J1aU4tM9ZvzNlb1+bs/T15aFmhwFpHqOuVFCCfehcHzVXvSz0mGsdSqoH7MZjoErYG8M6LZ4OJfKIkjfQFP/aNYO3YLvJAjBmSkif4CBPm+vzm/PQ/OWkzOqAH0I8q0SyxsKsiwDB+T2RTjhpzRcOJJKPUMs3+GwHStb2Q0JoRenUzndlQSrdbrlQp+gPglyx5FFymPtq6IC3Dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(316002)(956004)(66476007)(54906003)(86362001)(26005)(66556008)(6916009)(33716001)(2906002)(16526019)(66946007)(9686003)(4326008)(6496006)(5660300002)(186003)(6666004)(1076003)(8936002)(85182001)(7416002)(8676002)(6486002)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TMc9ccQ8iUuqx7owJxlBzDZHcd5sDJD/2vRZrUHEG3pHNDkXcbvlK7x1E5w5KtvkE9MK/ZvQhK8XZNtpuScAEELxW3vYoZtgE+stLhAsafdrJaYotWZBWio3NquxK+jlq4MEqMPtSbq3YSukxGeEfvAEbD7PUEQOMuFKfCXbmBHR5PVGshq68mKoR7rG1LKE6Lz5ztJF4G9qpoyYk0AYZs+Z7o9O1nwUjjq3Ilfp9OyGuPi7c2cONcOpbBM+/wyKliG4kf7yom/Sk4mkv1fwPXqWPR2/ZRUCJYGagujztukAn3wSL7/7YJkNiI8GaRa21llWbA8+pRoN85lTxTjEVQeZI65EsR/HOH9+qYcMonfW5hvEaLCJGLKPliUJNkulkS+tsmdtgMlZv2qaQjykN40uZn9Cs+/yBJHIl5dYu9IzcdXO/sb7KGP0fC0zZFN0RSWvPDcezG6GWGAEdRnmlrkaFWWT8gnJ2Ce9tr0kk6S36/Z6hKXTC9ucmYJdVN33nQx1JC+jZ1haju7kFxvYMZZOaiFLIEL5I8fc6+NQ9DwYKqa2eZTAefhljLC2ztCeu7yyns+TviYZDaih3+NtxCmshqmIjgLGiIxocSwzfOMpX0Jt2pFRv1dobc1GFw2LcLmVkR5g5AuJh/2zoG/vwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 153f476a-2f98-431c-f715-08d87a778ef0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 12:55:19.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPmdH4dz0GmC6A4APdaOTr+hEJZW3QFlfFhTNqJbLCBVCQidVufwB/36JtYQBTYXYcQTV335PdYAuI9THUJg1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4842
X-OriginatorOrg: citrix.com

On Tue, Oct 27, 2020 at 09:59:05AM +0000, Oleksandr Andrushchenko wrote:
> Hello, all!
> 
> While working on PCI passthrough on ARM (partial RFC was published by ARM
> earlier this year) I tried to implement some related changes in the toolstack.
> One of the obstacles for ARM is PCI backend’s related code presence: ARM is
> going to fully emulate an ECAM host bridge in Xen, so no PCI backend/frontend
> pair is going to be used.
> 
> If my understanding correct the functionality which is implemented by the
> pciback and toolstack and which is relevant/needed for ARM:
> 
>   1. pciback is used as a database for assignable PCI devices, e.g. xl
>      pci-assignable-{add|remove|list} manipulates that list. So, whenever the
>      toolstack needs to know which PCI devices can be passed through it reads
>      that from the relevant sysfs entries of the pciback.
> 
>   2. pciback is used to hold the unbound PCI devices, e.g. when passing through a
>      PCI device it needs to be unbound from the relevant device driver and bound
>      to pciback (strictly speaking it is not required that the device is bound to
>      pciback, but pciback is again used as a database of the passed through PCI
>      devices, so we can re-bind the devices back to their original drivers when
>      guest domain shuts down)
> 
>   3. toolstack depends on Domain-0 for discovering PCI device resources which are
>      then permitted for the guest domain, e.g MMIO ranges, IRQs. are read from
>      the sysfs
> 
>   4. toolstack is responsible for resetting PCI devices being passed through via
>      sysfs/reset of the Domain-0’s PCI bus subsystem
> 
>   5. toolstack is responsible for the devices are passed with all relevant
>      functions, e.g. so for multifunction devices all the functions are passed to
>      a domain and no partial passthrough is done
> 
>   6. toolstack cares about SR-IOV devices (am I correct here?)

I'm not sure I fully understand what this means. Toolstack cares about
SR-IOV as it cares about other PCI devices, but the SR-IOV
functionality is managed by the (dom0) kernel.

> 
> 
> I have implemented a really dirty POC for that which I would need to clean up
> before showing, but before that I would like to get some feedback and advice on
> how to proceed with the above. I suggest we:
> 
>   1. Move all pciback related code (which seems to become x86 code only) into a
>      dedicated file, something like tools/libxl/libxl_pci_x86.c
> 
>   2. Make the functionality now provided by pciback architecture dependent, so
>      tools/libxl/libxl_pci.c delegates actual assignable device list handling to
>      that arch code and uses some sort of “ops”, e.g.
>      arch->ops.get_all_assignable, arch->ops.add_assignable etc. (This can also
>      be done with “#ifdef CONFIG_PCIBACK”, but seems to be not cute). Introduce
>      tools/libxl/libxl_pci_arm.c to provide ARM implementation.

To be fair this is arch and OS dependent, since it's currently based
on sysfs which is Linux specific. So it should really be
libxl_pci_linux_x86.c or similar.

> 
>   3. ARM only: As we do not have pciback on ARM we need to have some storage for
>      assignable device list: move that into Xen by extending struct pci_dev with
>      “bool assigned” and providing sysctls for manipulating that, e.g.
>      XEN_SYSCTL_pci_device_{set|get}_assigned,
>      XEN_SYSCTL_pci_device_enum_assigned (to enumerate/get the list of
>      assigned/not-assigned PCI devices). Can this also be interesting for x86? At
>      the moment it seems that x86 does rely on pciback presence, so probably this
>      change might not be interesting for x86 world, but may allow stripping
>      pciback functionality a bit and making the code common to both ARM and x86.

How are you going to perform the device reset then? Will you assign
the device to dom0 after removing it from the guest so that dom0 can
perform the reset? You will need to use logic currently present in
pciback to do so IIRC.

It doesn't seem like a bad approach, but there are more consequences
than just how assignable devices are listed.

Also Xen doesn't currently know about IOMMU groups, so Xen would have
to gain this knowledge in order to know the minimal set of PCI devices
that can be assigned to a guest.

> 
>   4. ARM only: It is not clear how to handle re-binding of the PCI driver on
>      guest shutdown: we need to store the sysfs path of the original driver the
>      device was bound to. Do we also want to store that in struct pci_dev?

I'm not sure I follow you here. On shutdown the device would be
handled back to Xen?

Most certainly we don't want to store a sysfs (Linux private
information) inside of a Xen specific struct (pci_dev).

>   5. An alternative route for 3-4 could be to store that data in XenStore, e.g.
>      MMIOs, IRQ, bind sysfs path etc. This would require more code on Xen side to
>      access XenStore and won’t work if MMIOs/IRQs are passed via device tree/ACPI
>      tables by the bootloaders.

As above, I think I need more context to understand what and why you
need to save such information.

> 
> Another big question is with respect to Domain-0 and PCI bus sysfs use. The
> existing code for querying PCI device resources/IRQs and resetting those via
> sysfs of Domain-0 is more than OK if Domain-0 is present and owns PCI HW. But,
> there are at least two cases when this is not going to work on ARM: Dom0less
> setups and when there is a hardware domain owning PCI devices.
> 
> In our case we have a dedicated guest which is a sort of hardware domain (driver
> domain DomD) which owns all the hardware of the platform, so we are interested
> in implementing something that fits our design as well: DomD/hardware domain
> makes it not possible to access the relevant PCI bus sysfs entries from Domain-0
> as those live in DomD/hwdom. This is also true for Dom0less setups as there is
> no entity that can provide the same.

You need some kind of channel to transfer this information from the
hardware domain to the toolstack domain. Some kind of protocol over
libvchan might be an option.

> For that reason in my POC I have introduced the following: extended struct
> pci_dev to hold an array of PCI device’s MMIO ranges and IRQ:
> 
>   1. Provide internal API for accessing the array of MMIO ranges and IRQ. This
>      can be used in both Dom0less and Domain-0 setups to manipulate the relevant
>      data. The actual data can be read from a device tree/ACPI tables if
>      enumeration is done by bootloaders.

I would be against storing this data inside of Xen if Xen doesn't have
to make any use of it. Does Xen need to know the MMIO ranges and IRQs
to perform it's task?

If not, then there's no reason to store those in Xen. The hypervisor
is not the right place to implement a database like mechanism for PCI
devices.

Roger.

