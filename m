Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F823CBA9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 17:15:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3L8d-0008RH-57; Wed, 05 Aug 2020 15:15:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3L8b-0008RC-Oi
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 15:15:29 +0000
X-Inumbo-ID: 058fdea1-78f5-49ec-ab22-bb62daa0f237
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 058fdea1-78f5-49ec-ab22-bb62daa0f237;
 Wed, 05 Aug 2020 15:15:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CEC44ACA2;
 Wed,  5 Aug 2020 15:15:44 +0000 (UTC)
Subject: Re: Unified Xen executable for UEFI Secure Boot support
To: Trammell Hudson <hudson@trmm.net>
References: <mFb-G5X8XaNz-i_kdJKwVPYaZxrnQJj52XN6TiXVR_Y02k-6ozrOhVqBePpiev8UNy6Koe-aXWxAvzcnQq2Ur_0LsIqhgYBR4qupMhnN5GY=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6834aeb-1997-3148-1964-bfeed1e9efab@suse.com>
Date: Wed, 5 Aug 2020 17:15:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <mFb-G5X8XaNz-i_kdJKwVPYaZxrnQJj52XN6TiXVR_Y02k-6ozrOhVqBePpiev8UNy6Koe-aXWxAvzcnQq2Ur_0LsIqhgYBR4qupMhnN5GY=@trmm.net>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.08.2020 13:29, Trammell Hudson wrote:
> I have preliminary patches to support bundling the Xen hypervisor, xen.cfg, the Linux kernel, initrd and XSM into a single "unified" EFI executable that can be signed by sbsigntool for verification by UEFI Secure Boot.  It is inspired by systemd-boot's unified kernel technique and borrows the function to locate PE sections from systemd's LGPL'ed code.
> 
> The configuration, kernel, etc are added after building using objcopy to add named sections for each input file.  This allows an administrator to update the components independently without requiring rebuilding xen. During EFI boot, Xen looks at its own loaded image to locate the PE sections and, if secure boot is enabled, only allows use of the unified components.
> 
> The resulting EFI executable can be invoked directly from the UEFI Boot Manager, removing the need to use a separate loader like grub. Unlike the shim based verification, the signature covers the entire Xen+config+kernel+initrd unified file. This also ensures that properly configured platforms will measure the entire runtime into the TPM for unsealing secrets or remote attestation.
> 
> I've tested it on qemu OVMF with Secure Boot enabled, as well as on real Thinkpad hardware.  The EFI console is very slow, although it works and is able to boot into dom0.
> 
> The current patch set is here, and I'd appreciate suggestions on the technique or cleanup for submission:
> https://github.com/osresearch/xen/tree/secureboot

Sounds quite interesting, thanks, but please post the Xen patches here
for commenting, perhaps with an RFC tag for now.

Jan

