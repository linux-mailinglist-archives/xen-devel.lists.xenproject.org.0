Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D3231467
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 23:02:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0WjE-0006t6-Lo; Tue, 28 Jul 2020 21:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0WjD-0006t1-14
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 21:01:39 +0000
X-Inumbo-ID: 86a91aec-d115-11ea-a945-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86a91aec-d115-11ea-a945-12813bfff9fa;
 Tue, 28 Jul 2020 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595970098;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=i031syynmeL6Zsizw4CYlaroB+FVuMeN3cNPF18XDto=;
 b=Sm9jrWBBK5Ao8hHjUADCC3soflhmWyAqHBjuWt9WX7tTVMenYFNRZAhn
 SRja8sZskYwSST/qvMwNOThnPZiO4M10L0Lhckqak/+7k2Zcsj7yWConP
 bYaR3xV14y/XMtIPV3lcxkz8/BtACr/LEPkrV8B3tdcq6Z0xpQn/4xdoL 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dOjogrFoiwK0EjOIQEmM6WCIhV55c7wkfHSZGRm/eaHMRWvh0soA2pC+3y3CAg22U0klhsKdMH
 uQk509QW63fTAAbAmn4XVoiM/bp6nkpeuLceasB1H6nQt1SQWCFw4SSYnCAhxXdgVuqy8J9bcE
 SJsTdHddQkpn/0W1KlsB2WovVYkaLuy2rycJOOq9GXXyhLiMMGIRdHpeFPOI18EJDuGjkX9VQA
 CHN5YwjN+yl4T26SknO1gBNeG93X6/7c9hJ0Mrm0+Ey4P/ZmmNrOBs9nu+y++5Y3t+SWt2pzNq
 dXw=
X-SBRS: 2.7
X-MesageID: 23383797
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,407,1589256000"; d="scan'208";a="23383797"
Subject: Re: fwupd support under Xen - firmware updates with the UEFI capsule
To: Jan Beulich <jbeulich@suse.com>, Norbert Kaminski
 <norbert.kaminski@3mdeb.com>
References: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
 <39be665c-b6c8-23e3-b18b-d38cfe5c1286@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bbe85f76-0999-1150-3d48-c7f9e1796dac@citrix.com>
Date: Tue, 28 Jul 2020 22:01:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <39be665c-b6c8-23e3-b18b-d38cfe5c1286@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com,
 marmarek@invisiblethingslab.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 21:00, Jan Beulich wrote:
> On 28.07.2020 09:41, Norbert Kaminski wrote:
>> I'm trying to add support for the firmware updates with the UEFI
>> capsule in
>> Qubes OS. I've got the troubles with reading ESRT (EFI System
>> Resource Table)
>> in the dom0, which is based on the EFI memory map. The EFI_MEMMAP is not
>> enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT) and
>> kernel
>> cmdline parameters (add_efi_memmap):
>>
>> ```
>> [    3.451249] efi: EFI_MEMMAP is not enabled.
>> ```
>
> It is, according to my understanding, a layering violation to expose
> the EFI memory map to Dom0. It's not supposed to make use of this
> information in any way. Hence any functionality depending on its use
> also needs to be implemented in the hypervisor, with Dom0 making a
> suitable hypercall to access this functionality. (And I find it
> quite natural to expect that Xen gets involved in an update of the
> firmware of a system.)

ERST is a table (read only by the looks of things) which is a catalogue
of various bits of firmware in the system, including GUIDs for
identification, and version information.

It is the kind of data which the hardware domain should have access to,
and AFAICT, behaves just like a static ACPI table.

Presumably it wants to an E820 reserved region so dom0 gets indent
access, and something in the EFI subsystem needs extending to pass the
ERST address to dom0.

~Andrew

