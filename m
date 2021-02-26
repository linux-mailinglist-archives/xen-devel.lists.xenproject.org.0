Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8460325F70
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 09:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90130.170492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYpB-0005yt-UG; Fri, 26 Feb 2021 08:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90130.170492; Fri, 26 Feb 2021 08:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYpB-0005yY-RC; Fri, 26 Feb 2021 08:50:13 +0000
Received: by outflank-mailman (input) for mailman id 90130;
 Fri, 26 Feb 2021 08:50:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFYpA-0005yT-D5
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 08:50:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 593772d0-45b7-45ec-bdc2-e78ff85fe4ac;
 Fri, 26 Feb 2021 08:50:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA752AAAE;
 Fri, 26 Feb 2021 08:50:10 +0000 (UTC)
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
X-Inumbo-ID: 593772d0-45b7-45ec-bdc2-e78ff85fe4ac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614329410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMTWP7CPpEzU78kPeUn3urXfusHO6i/meLXqHpCmV2U=;
	b=REhURiPkBh3+TBwGE7ccQaAMo1Lvtmn/tA41JbNsRUkWo2vFGw5JhEGsCXZUt6zr9SlRqT
	p5WutVSOjnc67+6fowghDDCW7f61Hz8KF6+OONow44D8aaFPbqH0rfq/lTtLE46MJSmIVw
	vTAeguqU4mrmKJqvskbkEAi8sF2LW+U=
Subject: Re: [PATCH for-4.15] dmop: Add XEN_DMOP_nr_vcpus
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210225170946.4297-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfdb04dd-f7ce-59f2-1dd8-532c5be8222f@suse.com>
Date: Fri, 26 Feb 2021 09:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225170946.4297-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 18:09, Andrew Cooper wrote:
> Curiously absent from the stable API/ABIs is an ability to query the number of
> vcpus which a domain has.  Emulators need to know this information in
> particular to know how many stuct ioreq's live in the ioreq server mappings.
> 
> In practice, this forces all userspace to link against libxenctrl to use
> xc_domain_getinfo(), which rather defeats the purpose of the stable libraries.
> 
> Introduce a DMOP to retrieve this information and surface it in
> libxendevicemodel to help emulators shed their use of unstable interfaces.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Hypervisor part
Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one small adjustment:

> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -107,6 +107,7 @@
>  ?	dm_op_set_pci_intx_level	hvm/dm_op.h
>  ?	dm_op_set_pci_link_route	hvm/dm_op.h
>  ?	dm_op_track_dirty_vram		hvm/dm_op.h
> +?	dm_op_nr_vcpus			hvm/dm_op.h

We try to keep these sorted alphabetically, so please move the
insertion up a few lines.

Jan

