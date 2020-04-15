Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388981AA987
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOio0-0000oa-BS; Wed, 15 Apr 2020 14:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOinz-0000oQ-BE
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:14:19 +0000
X-Inumbo-ID: 64fcb74e-7f23-11ea-8a58-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64fcb74e-7f23-11ea-8a58-12813bfff9fa;
 Wed, 15 Apr 2020 14:14:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DCE3AAA7C;
 Wed, 15 Apr 2020 14:14:16 +0000 (UTC)
Subject: Re: [XEN PATCH v5] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: Harsha Shamsundara Havanur <havanur@amazon.com>
References: <9cfd038719fee7fcb01b8967ffcb23802bb75a0b.1586953651.git.havanur@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf008c26-3c06-9b1a-d022-3d0c16867c28@suse.com>
Date: Wed, 15 Apr 2020 16:14:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9cfd038719fee7fcb01b8967ffcb23802bb75a0b.1586953651.git.havanur@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 14:27, Harsha Shamsundara Havanur wrote:
> It was observed that PCI MMIO and/or IO BARs were programmed with
> memory and I/O decodes (bits 0 and 1 of PCI COMMAND register) enabled,
> during PCI setup phase. This resulted in incorrect memory mapping as
> soon as the lower half of the 64 bit bar is programmed.
> This displaced any RAM mappings under 4G. After the
> upper half is programmed PCI memory mapping is restored to its
> intended high mem location, but the RAM displaced is not restored.
> The OS then continues to boot and function until it tries to access
> the displaced RAM at which point it suffers a page fault and crashes.
> 
> This patch address the issue by deferring enablement of memory and
> I/O decode in command register until all the resources, like interrupts
> I/O and/or MMIO BARs for all the PCI device functions are programmed,
> in the descending order of memory requested.
> 
> Signed-off-by: Harsha Shamsundara Havanur <havanur@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further adjustment:

> @@ -120,6 +121,13 @@ void pci_setup(void)
>       */
>      bool allow_memory_relocate = 1;
>  
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
> +            PCI_COMMAND_IO);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MEMORY !=
> +            PCI_COMMAND_MEMORY);
> +    BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_MASTER !=
> +            PCI_COMMAND_MASTER);

Indentation here still looks wrong, despite me having given you
the precise form to use in reply to v4. This can be taken care
of while committing (if no other need for a v6 arises), but it
would have been nice if you had done this as indicated.

Jan

