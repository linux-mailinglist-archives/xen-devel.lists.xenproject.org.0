Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EED1F1A3C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:42:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiI2P-0006Jw-El; Mon, 08 Jun 2020 13:42:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiI2O-0006Jr-MY
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:42:04 +0000
X-Inumbo-ID: d4d48562-a98d-11ea-b277-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4d48562-a98d-11ea-b277-12813bfff9fa;
 Mon, 08 Jun 2020 13:42:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 16227AC2D;
 Mon,  8 Jun 2020 13:42:04 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200608133433.23659-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b406f85b-7a5c-ebb3-cab7-6eb282a4a553@suse.com>
Date: Mon, 8 Jun 2020 15:41:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200608133433.23659-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 08.06.2020 15:34, Andrew Cooper wrote:
> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
> while.  commitish_version() pulls an old version of xen/Makefile out of
> history, and uses the xenversion rule.
> 
> Currently, this fails with:
> 
>   tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory
> 
> which is because the Makefile legitimately references Kbuild.include with a
> relative rather than absolute path.
> 
> Rework support-matrix-generate to use sed to extract the major/minor, rather
> than expecting xen/Makefile to be usable in a different tree.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> 
> v2:
>  * Use sed rather than fixing up the makefile environment
> 
> This needs backporting to all trees with the support matrix logic, to unbreak
> docs rendering

Did I understand the earlier discussion wrong then that the breakage
was connected to the introduction of xen/scripts/Kbuild.include?

Jan

