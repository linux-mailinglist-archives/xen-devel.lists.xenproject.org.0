Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8C71F1A61
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiIA2-0006fP-JM; Mon, 08 Jun 2020 13:49:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmkZ=7V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jiIA1-0006fK-01
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:49:57 +0000
X-Inumbo-ID: ef9c3a9c-a98e-11ea-b27b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef9c3a9c-a98e-11ea-b27b-12813bfff9fa;
 Mon, 08 Jun 2020 13:49:56 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FE3uNW5AMbiXUKICNDdUiyoUkrCM+b+NXV6lAAvez7rOMkGIju0X7zh39qiW7FQjIAVfJYbxSW
 xjx6XSKDbdQ27BiEOub+6Xh8lZMb7bCTV39KUAds5aNdWAGNd99w8ePbho0BeFyZIrOlzCCTbu
 RzT/EP5aT/QbfBphcLPnU4ltr2xbZ8pNtZGwoBgK6RjS2jt6LVgf3Dz0OoXveI0Ca2J55KiGI5
 1ELbq1rKLnOD7OB/2+gqQ+SNNV/1H/sUBnfz/TkKOHDAw4rUMVZlXaVjxCbmp8l0EJf0R0jZNz
 DgA=
X-SBRS: 2.7
X-MesageID: 19827471
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19827471"
Subject: Re: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
To: Jan Beulich <jbeulich@suse.com>
References: <20200608133433.23659-1-andrew.cooper3@citrix.com>
 <b406f85b-7a5c-ebb3-cab7-6eb282a4a553@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cdb3f634-29bc-035c-3022-63179778b9f2@citrix.com>
Date: Mon, 8 Jun 2020 14:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b406f85b-7a5c-ebb3-cab7-6eb282a4a553@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/06/2020 14:41, Jan Beulich wrote:
> On 08.06.2020 15:34, Andrew Cooper wrote:
>> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
>> while.  commitish_version() pulls an old version of xen/Makefile out of
>> history, and uses the xenversion rule.
>>
>> Currently, this fails with:
>>
>>   tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory
>>
>> which is because the Makefile legitimately references Kbuild.include with a
>> relative rather than absolute path.
>>
>> Rework support-matrix-generate to use sed to extract the major/minor, rather
>> than expecting xen/Makefile to be usable in a different tree.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Ian Jackson <ian.jackson@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>> CC: Paul Durrant <paul@xen.org>
>>
>> v2:
>>  * Use sed rather than fixing up the makefile environment
>>
>> This needs backporting to all trees with the support matrix logic, to unbreak
>> docs rendering
> Did I understand the earlier discussion wrong then that the breakage
> was connected to the introduction of xen/scripts/Kbuild.include?

The xendocs cron email has been broken for an unknown period of time,
hence the issue going unnoticed.

The first of at least 3 breakages in the current docs rendering
manifests like this.

It may be that xen/scripts/Kbuild.include was the first thing to
actually break this script, but I haven't checked, and its not relevant
to the fragility of the old logic.

~Andrew

