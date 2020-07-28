Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2D23135A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 22:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Vln-0001sV-Qw; Tue, 28 Jul 2020 20:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0Vlm-0001sQ-Sd
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 20:00:14 +0000
X-Inumbo-ID: f2f3220a-d10c-11ea-8bd2-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2f3220a-d10c-11ea-8bd2-bc764e2007e4;
 Tue, 28 Jul 2020 20:00:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DCE0ABD2;
 Tue, 28 Jul 2020 20:00:24 +0000 (UTC)
Subject: Re: fwupd support under Xen - firmware updates with the UEFI capsule
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
References: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39be665c-b6c8-23e3-b18b-d38cfe5c1286@suse.com>
Date: Tue, 28 Jul 2020 22:00:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 09:41, Norbert Kaminski wrote:
> I'm trying to add support for the firmware updates with the UEFI capsule in
> Qubes OS. I've got the troubles with reading ESRT (EFI System Resource Table)
> in the dom0, which is based on the EFI memory map. The EFI_MEMMAP is not
> enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT) and kernel
> cmdline parameters (add_efi_memmap):
> 
> ```
> [    3.451249] efi: EFI_MEMMAP is not enabled.
> ```

It is, according to my understanding, a layering violation to expose
the EFI memory map to Dom0. It's not supposed to make use of this
information in any way. Hence any functionality depending on its use
also needs to be implemented in the hypervisor, with Dom0 making a
suitable hypercall to access this functionality. (And I find it
quite natural to expect that Xen gets involved in an update of the
firmware of a system.)

Jan

