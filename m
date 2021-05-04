Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7D372D3A
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 17:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122537.231116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxGJ-0000cT-FB; Tue, 04 May 2021 15:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122537.231116; Tue, 04 May 2021 15:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxGJ-0000bp-Bo; Tue, 04 May 2021 15:47:03 +0000
Received: by outflank-mailman (input) for mailman id 122537;
 Tue, 04 May 2021 15:47:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldxGH-0000ZL-Rm
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 15:47:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d36ea5-fa61-4ef7-bed3-36c7949a9bf2;
 Tue, 04 May 2021 15:46:56 +0000 (UTC)
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
X-Inumbo-ID: 69d36ea5-fa61-4ef7-bed3-36c7949a9bf2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620143216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=34vg3/jZvUrCWPff6Y7VRYmZB2dC0EvCkOqX+rXqM+k=;
  b=GrQ3WjIW3v+OVpbuK73wy+mkWI2SUrw+oXWGZX6wIxFIQkLZBcNb5Nhk
   ITQ4Fx4zaNKWxgNI5pvsPf+1d6IMDWUwF27EBckq0wDbxqAKW0BmlfIPU
   MsWarmV9VW5DPYFVX9ADrpIhiCylLDjGdQSMFO7fIKLuobKmf5WhkBsoD
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4y+ckJVHAPYofB4ReZke1LKLqakm3hKYjN7R5M3/QPb1OdMSh0uMBFTxcS2oaMNJo3t7a0U1F7
 R7b+7c6a6Q5XiKEAhG8JEJ6r4KhthBcg9xV4lipLCzAA3WqdxZcn9wWwgLOyDDrXgQeePzsIdA
 hhitXHqZHBQkUxBHzA/VNgOTfsUhWcskFyMFM/6Av7rD47DqdldkmMzQG8wh/AwzCvoIjned2P
 iFI4jnduAdzK6MmV5PA9Ij+Z5a5Tel5S2N6VRaPsTwNTiuhcZrFE14oRHYaeeI3FT3EsRmj+MB
 /Es=
X-SBRS: 5.1
X-MesageID: 44559840
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qC5JJa171fIOgaHmDVxmswqjBJskLtp033Aq2lEZdDV+dMuEm8
 ey2MkKzBOcslcscVwphNzoAsK9aFzG85od2+MsFJODeCWjh2eyNoFl6uLZrQHIPyHl7OZS2e
 NBXsFFZOHYNlRxgcbk7ATQKb9J/PC87Kuqie3Cpk0DcShWbchbgjtENg==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="44559840"
Date: Tue, 4 May 2021 16:46:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <george.dunlap@citrix.com>, "Nick
 Rosbrook" <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC v2 0/7] add function support to IDL
Message-ID: <YJFsbHruoGA6aGMY@perard>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>

On Tue, Mar 02, 2021 at 08:46:12PM -0500, Nick Rosbrook wrote:
> At a Xen Summit design session for the golang bindings (see [1]), we
> agreed that it would be beneficial to expand the libxl IDL with function
> support. In addition to benefiting libxl itself, this would allow other
> language bindings to easily generate function wrappers.
> 
> The first version of this RFC is quite old [1]. I did address comments
> on the original RFC, but also expanded the scope a bit. As a way to
> evaluate function support, I worked on using this addition to the IDL to
> generate device add/remove/destroy functions, and removing the
> corresponding macros in libxl_internal.h. However, I stopped short of
> actually completing a build with this in place, as I thought it made
> sense to get feedback on the idea before working on the next step.

The series looks good to me, beside a few detail.

Cheers,

-- 
Anthony PERARD

