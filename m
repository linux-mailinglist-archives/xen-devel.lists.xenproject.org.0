Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788462DD9B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 15:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445243.700336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfay-0001gZ-IT; Thu, 17 Nov 2022 14:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445243.700336; Thu, 17 Nov 2022 14:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfay-0001eb-Fo; Thu, 17 Nov 2022 14:10:24 +0000
Received: by outflank-mailman (input) for mailman id 445243;
 Thu, 17 Nov 2022 14:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rqd=3R=citrix.com=prvs=313e1da35=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ovfax-0001eV-T2
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 14:10:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c02177-6681-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 15:10:21 +0100 (CET)
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
X-Inumbo-ID: 91c02177-6681-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668694221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NbBL91ryQ3jGTOa6OG3JK7kUICBAy7tmxRa0YCaTLEE=;
  b=UogpPJc9cdwfEWmYhf3o6C3ZrUGAPXPpBdbkLV1IXyHsVpjhV7nE5PIJ
   1WTKzHWmz2hHwfj8dmDbviKMEhWe2j2liVmgJcv4nkOjegjzvQP6rFUjc
   t3kIeDlnDsreV8TaLv14xYH1Ej662x50VkjBj0M74hQzlZYtMqzUZW8op
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84614549
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xUV/yKL52nx9KfIpFE+RJpUlxSXFcZb7ZxGr2PjKsXjdYENS0WRRy
 DEaDDvTMqrbYmejet4lPI7i8U0FvZ6Gx4BnSgFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c53WVwW8
 L8VMgsqTRDTp+Cm/YP8c+Bj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozWG5wJwxrJz
 o7A13zIAQAhO/yf8DaA6nT22NLUoyHVV41HQdVU8dY12QbOlwT/EiY+V0a/oPS/ol6zXZRYM
 UN80jE1saE4+UivT9/8dx61uniJulgbQdU4O9M97AaB26/F+TGzD2IPTiNCQNE+vcpwTjsvv
 nepktXzFHpQubuaYXuH8/GfqjbaESIYN3MYbCkICw4M+cD+oZobhwjKCN1kFcadntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJiYXzAjKWmOu7itieZWoIYev7DDz8vJoPIufCF6bs
 xA5d9O2tb5US8vXzWrUHbtLTOrBC+u53CP0gQZSR5xi+i6W3F2jLaBS8AxPY35gPZNREdP2W
 3P7tQRU7Z5VGXKla65rfo68Y/gXIbjc+cfNDa6NMIcXCnRlXErepXw1OxbMt4z4uBJ0+ZzTL
 6t3ZipF4ZwyLa18hAS7SO4GuVPA7nBvnDiDLXwXIvnO7FZ/WJJ3Ye1bWLdtRrpjhE9hnOky2
 4g3Cidy408DONASmwGOmWPTRHhTRZTBObj4qtZMasmIKRd8FWcqBpf5mO1/K9I/xPgKzLmXp
 BlRv3O0LnKk3BUrzi3TNBhehE7HB84j/RrXwwRxVbpX55TTSdn2t/pOH3fGVbIm6PZi3ZZJo
 wotIq297zUmYmqvxgnxmrGn/dA8K0n23lrUV8dnCRBmF6Ndq8Xy0oeMVmPSGOMmVEJbaeNWT
 2Wc6z7m
IronPort-HdrOrdr: A9a23:DmDCm6FWL5ODQ/5UpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="84614549"
Date: Thu, 17 Nov 2022 14:10:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 1/4] xen: Introduce non-broken hypercalls for the paging
 mempool size
Message-ID: <Y3ZAuiZM6gD+I7Xj@perard.uk.xensource.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221117010804.9384-2-andrew.cooper3@citrix.com>

On Thu, Nov 17, 2022 at 01:08:01AM +0000, Andrew Cooper wrote:
> The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:
> 
>  * All set_allocation() flavours have an overflow-before-widen bug when
>    calculating "sc->mb << (20 - PAGE_SHIFT)".
>  * All flavours have a granularity of 1M.  This was tolerable when the size of
>    the pool could only be set at the same granularity, but is broken now that
>    ARM has a 16-page stopgap allocation in use.
>  * All get_allocation() flavours round up, and in particular turn 0 into 1,
>    meaning the get op returns junk before a successful set op.
>  * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
>    despite the pool size being a domain property.
>  * Even the hypercall names are long-obsolete.
> 
> Implement a better interface, which can be first used to unit test the
> behaviour, and subsequently correct a broken implementation.  The old
> interface will be retired in due course.
> 
> The unit of bytes (as opposed pages) is a deliberate API/ABI improvement to
> more easily support multiple page granularities.
> 
> This is part of XSA-409 / CVE-2022-33747.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

