Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174141E297B
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 19:58:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jddph-00033C-4t; Tue, 26 May 2020 17:57:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9/=7I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jddpf-000337-Qh
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 17:57:43 +0000
X-Inumbo-ID: 650e7ce6-9f7a-11ea-81bc-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 650e7ce6-9f7a-11ea-81bc-bc764e2007e4;
 Tue, 26 May 2020 17:57:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NjSlT6lCFbs4DsndjP2AVVVWYUbhekmkov3gNnsNRRqog9kA6FV7rTCzkPNduU+D82ECQIYEbm
 thbB9Yka+1OvqcN/hjPVEcs4I2pMp4/IG6Gfo+IlLahN2WX5GdPpoUt+7BdoXxkYm97zu0coLe
 PoCz2tekGqFt2GZkqP9f3jLOdugN4+0QOGIxLPI143bgDGiLDfBToeo6++nEiZPtHEpNMZZUju
 Ce/ueXEwn3Z90mkMzGwKA8erJIClHfBPOZYiRuwJ1IF2f19nEOyuXDwP3O1R2kGhkT7aq48Rfj
 Aj4=
X-SBRS: 2.7
X-MesageID: 18775426
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="18775426"
Date: Tue, 26 May 2020 19:57:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [BUG] PVH ACPI XSDT table construction
Message-ID: <20200526175734.GF38408@Air-de-Roger>
References: <17251f968dd.b28c8ebe731955.2247348003729398828@apertussolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17251f968dd.b28c8ebe731955.2247348003729398828@apertussolutions.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 01:13:19PM -0400, Daniel Smith wrote:
> Greetings,
> 
> 
> 
> I was reviewing the ACPI construction for PVH and discovered what I believe is a flaw in the logic for selecting the XSDT tables. The current logic is,
> 
> 
> 
> static bool __init pvh_acpi_xsdt_table_allowed(const char *sig,
> 
>                                                unsigned long address,
> 
>                                                unsigned long size)
> 
> {
> 
>     /*
> 
>      * DSDT and FACS are pointed to from FADT and thus don't belong
> 
>      * in XSDT.
> 
>      */
> 
>     return (pvh_acpi_table_allowed(sig, address, size) &&
> 
>             strncmp(sig, ACPI_SIG_DSDT, ACPI_NAME_SIZE) &&
> 
>             strncmp(sig, ACPI_SIG_FACS, ACPI_NAME_SIZE));
> 
> }
> 
> 
> 
> Unless I am mistaken, the boolean logic in the return statement will always return false resulting in an empty XSDT table. I believe based on the comment what was intended here was,
> 
> 
> 
>     return (pvh_acpi_table_allowed(sig, address, size) &&
> 
>             !(strncmp(sig, ACPI_SIG_DSDT, ACPI_NAME_SIZE) ||
> 
>               strncmp(sig, ACPI_SIG_FACS, ACPI_NAME_SIZE)));

Keep in mind that strncmp will return 0 if the signature matches, and
hence doing this won't allow any table, as it would require a
signature to match both the DSDT and the FACS one (you would require
strncmp to return 0 in both cases).

The code is correct AFAICT, as it won't add DSDT or FACS to the XSDT
(because strncmp will return 0 in that case).

Roger.

