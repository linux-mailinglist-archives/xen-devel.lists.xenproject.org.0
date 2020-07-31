Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281A234477
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:21:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1T6J-0004HE-PP; Fri, 31 Jul 2020 11:21:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1T6I-0004H9-Ot
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:21:22 +0000
X-Inumbo-ID: f5d6ab58-d31f-11ea-8e24-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d6ab58-d31f-11ea-8e24-bc764e2007e4;
 Fri, 31 Jul 2020 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596194481;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+P1KIq/6Ywxtu4pyKU6IAI26bhhPg71MBoPm2a6aTl4=;
 b=XDsBhj0D5p64Qfq8zOAY+o0ThNqjLavS8XD0YpO5JfJ30/Ed8rxfZdFY
 OnZsNunxIhCHL+KQiP2/T7gZVKb0tL0lbrjgK2zE9sJggEVG7Kt4YqkhV
 J97RLrItIVg5cTSfS3A9n9Nw0SKhMKSH2816ZSa3N6X1O/Jj/d6mBUCw0 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uphDXr02WgtTe1GvOXKeVMjNOgwYLd2gH0NC1Vc5TBbEzCsHctGsV4rui27Z52AJGMyC+pNrsq
 MDorvIzNOkt6vWz/pU11LWx+qXRG2M/2ypVSHxCckwRAXWgU96MGgZwZw3i5p4EN8Xcvdl5Odg
 1cD+89pcZcjv18Gr9n1Srx279TCT6mM8mddPFbghyrsRrLtKGrj6dE6euuhSyWCszb7h+Rjtxm
 ttha+qKUtaJc8UeffoVnTxbqruQ1INNAKCK+QBs3OpgYOBHCKPEJ5zN65CgWgoCAOO0lxl5xym
 a4g=
X-SBRS: 3.7
X-MesageID: 23633986
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23633986"
Subject: Re: [PATCH] x86/hvm: set 'ipat' in EPT for special pages
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200731104644.20906-1-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dba8c4c4-dfdd-9935-2d59-7bcee7615361@citrix.com>
Date: Fri, 31 Jul 2020 12:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731104644.20906-1-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 11:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> All non-MMIO ranges (i.e those not mapping real device MMIO regions) that
> map valid MFNs are normally marked MTRR_TYPE_WRBACK and 'ipat' is set. Hence
> when PV drivers running in a guest populate the BAR space of the Xen Platform
> PCI Device with pages such as the Shared Info page or Grant Table pages,
> accesses to these pages will be cachable.
>
> However, should IOMMU mappings be enabled be enabled for the guest then these
> accesses become uncachable. This has a substantial negative effect on I/O
> throughput of PV devices. Arguably PV drivers should bot be using BAR space to
> host the Shared Info and Grant Table pages but it is currently commonplace for
> them to do this and so this problem needs mitigation. Hence this patch makes
> sure the 'ipat' bit is set for any special page regardless of where in GFN
> space it is mapped.
>
> NOTE: Clearly this mitigation only applies to Intel EPT. It is not obvious
>       that there is any similar mitigation possible for AMD NPT. Downstreams
>       such as Citrix XenServer have been carrying a patch similar to this for
>       several releases though.

https://github.com/xenserver/xen.pg/blob/XS-8.2.x/master/xen-override-caching-cp-26562.patch

(Yay for internal ticket references escaping into the wild.)


However, it is very important to be aware that this is just papering
over the problem, and it will cease to function as soon as we get MKTME
support.  When we hit that point, iPAT cannot be used, as it will cause
data corruption in guests.

The only correct way to fix this is to not (mis)use BAR space for RAM
mappings.

~Andrew

