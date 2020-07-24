Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA622CE36
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 21:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2wH-0000Cv-V1; Fri, 24 Jul 2020 19:01:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tno1=BD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jz2wG-0000Cn-Pb
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 19:01:00 +0000
X-Inumbo-ID: 02b4ea46-cde0-11ea-a461-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02b4ea46-cde0-11ea-a461-12813bfff9fa;
 Fri, 24 Jul 2020 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595617259;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qDLpyFG01JuszQaIrW57+Qe/R3/LrJ9ztBtSJyWamN4=;
 b=XSBKHQjqlXlW3wtfRC7Mcc2djxD1iPhxzOECSyxLZuVAx4LCkIJWxMbo
 +6+ldzmSJ5ys/ZFZmUmxnplDfOrYEJJkx3UzilP/nkS58K51eiTwWdmS4
 QAhxmkqACHYrkd4HnM1WRCc2fUXrtDjUwXdc7m9TOjim3FfuHKi2zGdnV s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1OYxkBD80Rr28m8mNtIUCswqXFa3S86bTbd6VugChtaqn/c52UmfSarczN4KqV/O86qGd9aEJ1
 tbghh/tQvRA2OIw8F0TCCSNXzHNg0BvYZFmJ/0Vbia/djOi5e0bj4vdtnalajBUKVGzPAPNzYl
 Om3UO2DjzK/+DD6uBqsqYlaO/8X2TdcgqY6lkXihKBYTd6xJHCBgCpfWkDMnWTMK9mcZENAgBH
 uwPkeMn6Fdp95AZgvnGKSd/1dnjT6ONtAP2rzDj6m+OLDiud3ufeY3XPDMkFHYeO5LQolUw5ve
 OJQ=
X-SBRS: 2.7
X-MesageID: 23481107
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23481107"
Subject: Re: [PATCH 5/6] iommu: remove the share_p2m operation
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-6-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0e3d1914-2bf0-0b14-721e-7694f3657523@citrix.com>
Date: Fri, 24 Jul 2020 20:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-6-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/07/2020 17:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> Sharing of HAP tables is VT-d specific so the operation is never defined for
> AMD IOMMU.

It's not VT-d specific, and Xen really did used to share on AMD.

In fact, a remnant of this logic is still present in the form of the
comment for p2m_type_t explaining why p2m_ram_rw needs to be 0.

That said, I agree it shouldn't be a hook, because it is statically
known at domain create time based on flags and hardware properties.

>  There's also no need to pro-actively set vtd.pgd_maddr when using
> shared EPT as it is straightforward to simply define a helper function to
> return the appropriate value in the shared and non-shared cases.

It occurs to me that vtd.pgd_maddr and amd.root_table really are the
same thing, and furthermore are common to all IOMMU implementations on
any architecture.  Is it worth trying to make them common, rather than
continuing to let each implementation handle them differently?

~Andrew

