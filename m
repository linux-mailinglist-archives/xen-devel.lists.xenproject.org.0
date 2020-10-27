Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0329B2E9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12948.33436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQFG-00006H-2r; Tue, 27 Oct 2020 14:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12948.33436; Tue, 27 Oct 2020 14:46:42 +0000
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
	id 1kXQFF-00005r-VY; Tue, 27 Oct 2020 14:46:41 +0000
Received: by outflank-mailman (input) for mailman id 12948;
 Tue, 27 Oct 2020 14:46:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXQFE-00005m-IM
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:46:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1628e3d-cefe-47c8-8b30-5c28c5dbc2df;
 Tue, 27 Oct 2020 14:46:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB152AC12;
 Tue, 27 Oct 2020 14:46:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXQFE-00005m-IM
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:46:40 +0000
X-Inumbo-ID: e1628e3d-cefe-47c8-8b30-5c28c5dbc2df
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e1628e3d-cefe-47c8-8b30-5c28c5dbc2df;
	Tue, 27 Oct 2020 14:46:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603809998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9EcKYoS6cmVmpnnZMHPyeShlA8v+Qt0BsL8pYm3jpY=;
	b=CDIt1Tl7RcMZ4X208cYP2htGM5RJRGFz2FktCT22qopdHyq9Oatzjynif2WI3ErPz+WhMT
	dgR116FQGp/ddfOQ6B6AkVBJ0gAzbu8YVKiS/Sl6zkXu8ZVNnAKtpjzmx0qWy8Hve4qXjL
	GHpnZ6g2pCYEW9RHjw8JN1vGLpkc7vw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CB152AC12;
	Tue, 27 Oct 2020 14:46:38 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] x86/pv: Flush TLB in response to paging structure
 changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201027141037.27357-1-andrew.cooper3@citrix.com>
 <20201027141037.27357-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0cd065e3-47ae-8a98-92ed-f67a575949b8@suse.com>
Date: Tue, 27 Oct 2020 15:46:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027141037.27357-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 15:10, Andrew Cooper wrote:
> With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
> is safe from Xen's point of view (as the update only affects guest mappings),
> and the guest is required to flush (if necessary) after making updates.
> 
> However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
> writeable pagetables, etc.) is an implementation detail outside of the
> API/ABI.
> 
> Changes in the paging structure require invalidations in the linear pagetable
> range for subsequent accesses into the linear pagetables to access non-stale
> mappings.  Xen must provide suitable flushing to prevent intermixed guest
> actions from accidentally accessing/modifying the wrong pagetable.
> 
> For all L2 and higher modifications, flush the TLB.  PV guests cannot create
> L2 or higher entries with the Global bit set, so no mappings established in
> the linear range can be global.

Perhaps "..., so no guest controlled mappings ..."?

> @@ -4177,19 +4184,61 @@ long do_mmu_update(
>      if ( va )
>          unmap_domain_page(va);
>  
> -    if ( sync_guest )
> +    /*
> +     * Perform required TLB maintenance.
> +     *
> +     * This logic currently depend on flush_linear_pt being a superset of the
> +     * flush_root_pt_* conditions.
> +     *
> +     * pt_owner may not be current->domain.  This may occur during
> +     * construction of 32bit PV guests, or debugging of PV guests.  The
> +     * behaviour cannot be correct with domain unpaused.  We therefore expect
> +     * pt_owner->dirty_cpumask to be empty, but it is a waste of effort to
> +     * explicitly check for an exclude this corner case.

Nit: s/ an / and /

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

