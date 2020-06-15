Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A81F9B06
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:55:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqVn-0004H3-39; Mon, 15 Jun 2020 14:54:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqVl-0004Gy-UK
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:54:57 +0000
X-Inumbo-ID: 2dac61e8-af18-11ea-8496-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dac61e8-af18-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 14:54:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: l1fclsBTfHR/StnfDRWourWOGq9MJluDdFLK5ZduVpRg7b4MLYtKtIbu/g5QDP+xu9+hNt4Rr6
 cyEok8Wd9Moc6JPaQdLr3ljNXjfP4NLsL27lK16esa5kQ/8Z9KWSkk3JovQhgos+VPQS9TYNaA
 R45788FpvlmFoGYu3tK5GEuNRAR/7o2YjrMy8emW9r65LoAH3C92OU2hFyRbXPgh/ni0LxGNQq
 8r0uFee8UX/h0pzw8T/ghhTZgYlkz98G/kfYTLmBGadLlUGxTP9z4pyc978LyNktf22rp+VlYc
 4/U=
X-SBRS: 2.7
X-MesageID: 20083622
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20083622"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35771.662354.527867@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:54:51 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/9] tools/libx[cl]: Move processing loop down into
 xc_cpuid_set()
In-Reply-To: <20200615141532.1927-4-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-4-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH 3/9] tools/libx[cl]: Move processing loop down into xc_cpuid_set()"):
> Currently, libxl__cpuid_legacy() passes each element of the policy list to
> xc_cpuid_set() individually.  This is wasteful both in terms of the number of
> hypercalls made, and the quantity of repeated merging/auditing work performed
> by Xen.
> 
> Move the loop processing down into xc_cpuid_set(), which allows us to do one
> set of hypercalls, rather than one per list entry.
> 
> In xc_cpuid_set(), obtain the full host, guest max and current policies to
> begin with, and loop over the xend array, processing one leaf at a time.
> Replace the linear search with a binary search, seeing as the serialised
> leaves are sorted.
> 
> No change in behaviour from the guests point of view.

This is not my area of expertise.  Ideally at this stage of the
release I would like an ack from a 2nd hypervisor maintainer.

The processing code in libxc looks OK to me.

Ian.

