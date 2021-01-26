Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4E304212
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75188.135319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Q6U-0004js-7n; Tue, 26 Jan 2021 15:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75188.135319; Tue, 26 Jan 2021 15:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Q6U-0004jT-44; Tue, 26 Jan 2021 15:18:02 +0000
Received: by outflank-mailman (input) for mailman id 75188;
 Tue, 26 Jan 2021 15:18:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Q6T-0004jO-7d
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:18:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3329ae8-56c8-4a3e-89b8-6058a6b58bfa;
 Tue, 26 Jan 2021 15:18:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39ED4AF13;
 Tue, 26 Jan 2021 15:17:59 +0000 (UTC)
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
X-Inumbo-ID: f3329ae8-56c8-4a3e-89b8-6058a6b58bfa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611674279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azpZx+AWrUWlx7wpEQj+VS8fx/307YdVLngxpBJYoGE=;
	b=QkQ/rdGM7afJpbST/CuegOrbcVnqA4ttW4IHnpzap2lKT7PMkHGSvmn0QlD9WKTLQhDVMr
	IPxNBJbx7EJuESd47BpTr+53FbxDg5PlOVAFz/SLljXYVplalXbTZbpgsqzAmzGAzQiGwD
	9ef/cejnklNs0fhhGxPALLH8iT1RBrU=
Subject: Re: [PATCH 3/3] x86/vmsi: tolerate unsupported MSI address/data
 fields
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fead705-5d36-72df-981f-04d0c47175c3@suse.com>
Date: Tue, 26 Jan 2021 16:17:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126110606.21741-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 12:06, Roger Pau Monne wrote:
> Plain MSI doesn't allow caching the MSI address and data fields while
> the capability is enabled and not masked, hence we need to allow any
> changes to those fields to update the binding of the interrupt. For
> reference, the same doesn't apply to MSI-X that is allowed to cache
> the data and address fields while the entry is unmasked, see section
> 6.8.3.5 of the PCI Local Bus Specification 3.0.
> 
> Allowing such updates means that a guest can write an invalid address
> (ie: all zeros) and then a valid one, so the PIRQs shouldn't be
> unmapped when the interrupt cannot be bound to the guest, since
> further updates to the address or data fields can result in the
> binding succeeding.

IOW the breakage from the other patch was because rubbish was
written first, and suitable data was written later on? I didn't
think core PCI code in Linux would do such, which would make me
suspect a driver having custom MSI handling code ...

> Modify the vPCI MSI arch helpers to track whether the interrupt is
> bound, and make failures in vpci_msi_update not unmap the PIRQ, so
> that further calls can attempt to bind the PIRQ again.
> 
> Note this requires some modifications to the MSI-X handlers, but there
> shouldn't be any functional changes in that area.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Am I understanding correctly that this change is independent of
the initial 2 patches (where I have reservations), and hence
it could go in ahead of them (or all alone)?

Jan

