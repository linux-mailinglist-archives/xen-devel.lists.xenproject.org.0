Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB2274957
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:42:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKoAx-0000iz-Dt; Tue, 22 Sep 2020 19:42:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKoAw-0000ii-Kh
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:42:06 +0000
X-Inumbo-ID: e9d0cf41-bc73-4645-972d-0cb175bd987b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9d0cf41-bc73-4645-972d-0cb175bd987b;
 Tue, 22 Sep 2020 19:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600803726;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9xyC2WWswKckbro7NWlqZ4ONZMp+v/eT/n4821KWiP0=;
 b=e4o2GAeIx+DyG6IgVsKgW4CoPxr95B7JtShmPad96rDiWZ49yGQb+C7x
 zqsUCr+G57Y3P3O1pOqPkEgfB2Meh9Z67U7fmoO4UNfdzKowBu2QuKIph
 OMkFQsAaa6ij5CvLFVWys8TGFkfg5bH2chpRV4b4rawyb1NkqGXt1u0h6 E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pdXX3BWzCvikiWB/cs8o9IxhXb/mxI2mMnUAvN3+prlUCmEe1D5bqrHBVNhqBHGw96tmDgdI9i
 batOsqiqXP7wSywPH9gZp3xq79oKm+lxZqNRsQvObnt8axS54GedKsvHgyE9T7f0IvpSoRZF9u
 wPYscFkChrrGqOqP/7epVMm/erCHnrSOQQFK1w+U2j9jqJf42G84whyLGTXh5U7e+BMRklbE2h
 dlBNaIIRwrH3u5SxDEE3DzpgZ2M0r2dGiO6wkrKWdyPj1kD8roLQlNPEOX2aS0Nd9qlv1AdUtm
 oII=
X-SBRS: 2.7
X-MesageID: 27638908
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27638908"
Subject: Re: [PATCH 5/9] lib: move parse_size_and_unit()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <823c1802-9a61-4059-c6a8-61f5c2fad12c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <91879555-30cd-3bcc-8f63-c8a2bbe6ef6d@citrix.com>
Date: Tue, 22 Sep 2020 20:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <823c1802-9a61-4059-c6a8-61f5c2fad12c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/09/2020 11:17, Jan Beulich wrote:
> ... into its own CU, to build it into an archive.

CU?

Irrespective, it seems very weird to carve this out, seeing as it is
called from a number of core locations, and depends on other core
functions which aren't split out.

~Andrew

