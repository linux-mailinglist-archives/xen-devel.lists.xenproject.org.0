Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FD281124
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1969.5863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJA9-0003Np-70; Fri, 02 Oct 2020 11:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1969.5863; Fri, 02 Oct 2020 11:23:45 +0000
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
	id 1kOJA9-0003NT-3q; Fri, 02 Oct 2020 11:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1969;
 Fri, 02 Oct 2020 11:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOJA8-0003NO-39
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:23:44 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edbac935-f7f8-4281-9afb-ad06861a9622;
 Fri, 02 Oct 2020 11:23:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOJA8-0003NO-39
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:23:44 +0000
X-Inumbo-ID: edbac935-f7f8-4281-9afb-ad06861a9622
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id edbac935-f7f8-4281-9afb-ad06861a9622;
	Fri, 02 Oct 2020 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601637824;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=r52eNszNUG5QuCOdbKV4ykZ4CTpHi/cpnRL2ZcKCQQ0=;
  b=GyV0g45M3mJ7ztvjdCqEi+BSkDyureHfoWK7PQcqeSBXk03qATyQjxl9
   h3IrbkK+6yrn7xYtodkiRbDYs8pU9po71IcApF/1XvardYjTkpYxSgxva
   gs18jBsZAuhso3EKawv8pHsKklJGuHnXf02UI2SunlTl/1/pn1/2loqb0
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EgwAj4Uoxcnso4oYxvx+hPzAfj28TInscbiawn2N8SXzRlRThilRKWcCtEZU2/Fer+pljT5c8e
 O6eylcsT3gwU7MgoQ/mnKluyFej/MG/yGqU0nxM2PPdpxFHuA1xB5qMWG1IDNM7X6lB5RRoXGG
 2dag17paIhioFO9v7/T3D6lV6Sf8KNqXRRw8VLXkDYkVdYtVf14giGT89kNx8zj/OFvtWAt+Hb
 oVp8GMK1KnIQYn1lp2cHTKz+9D6vauYskdKy0BH8HXRiNBLKNKtTbcYuRIPaUYf/lkRRMWwuu6
 7GI=
X-SBRS: None
X-MesageID: 28129791
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="28129791"
Subject: Re: [PATCH 3/3] x86/vLAPIC: vlapic_init() runs only once for a vCPU
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
 <3735eb75-76ef-abff-1b05-aa89ddc39fcc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <03ab138c-5608-ba4e-90ae-5d7bcdfd6bd9@citrix.com>
Date: Fri, 2 Oct 2020 12:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3735eb75-76ef-abff-1b05-aa89ddc39fcc@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 11:31, Jan Beulich wrote:
> Hence there's no need to guard allocation / mapping by checks whether
> the same action has been done before. I assume this was a transient
> change which should have been undone before 509529e99148 ("x86 hvm: Xen
> interface and implementation for virtual S3") got committed.
>
> While touching this code, switch dprintk()-s to use %pv.

Logging ENOMEM, especially without actually saying ENOMEM, is quite
pointless.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably with
the printk()s dropped.

