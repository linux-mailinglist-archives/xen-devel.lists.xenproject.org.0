Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FF598869
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 18:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389678.626767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiAj-00076d-3q; Thu, 18 Aug 2022 16:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389678.626767; Thu, 18 Aug 2022 16:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiAj-00074t-0m; Thu, 18 Aug 2022 16:15:05 +0000
Received: by outflank-mailman (input) for mailman id 389678;
 Thu, 18 Aug 2022 16:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6Qq=YW=citrix.com=prvs=222213ea0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOiAh-00074n-EO
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 16:15:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e855d525-1f10-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 18:15:01 +0200 (CEST)
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
X-Inumbo-ID: e855d525-1f10-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660839301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gri3MvPbgfl7cI9dRT1xhkuvRarOs0m7ELMQIrz2GkE=;
  b=DxubGOR1InGGY9GF6OdHYqBi0LRXLm0rcU95toVSpsCQ9uAjgTDT8CZ3
   mHryW8DbS48MaIHZUpTpb4+ZREosd2/uYC9y2x0PTQKiixiKD9SMpsYnA
   1SIO0F755q9Api47nXz2sgelY1TfU+3MU2iwP7bN3Uj8n4/787kFLwNls
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78411177
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AlL/D66vRNPJGRxRLjWJ1qWxQJefnOphVZsZKJ?=
 =?us-ascii?q?smfNk3eNXix3RfKay+QfFakzPnuH4fhePpUhzShtGjaYWPAbuTZfVBMRd9am?=
 =?us-ascii?q?F36WO5As2H2EY7O/LAOr6O2LxVlbeFmEEAeofEN7L0BlDFnloQm7waH9WG89?=
 =?us-ascii?q?KSo7thphodbAmtSxXtCHCObvTUg0HPpZRQwE3djsloTHGEg8aifjAQp7RFS9?=
 =?us-ascii?q?QBxZqTfWMuBe9Uix1tqBj4wnf5/WvX6KdPaqHDlfkO/tnO8PBmWQWGoc3+6I?=
 =?us-ascii?q?tZlJQayNY9dzsYvSAaY1Qidy0e3uIvN/o78vOlA3NWrMkDvbLhP3AU4qJyG6?=
 =?us-ascii?q?22UseDzs6qhiBt+22FB5xXBAxx1yNgDGnA6Gu93n8RSaBQeDbdBmtTVm5d7d?=
 =?us-ascii?q?pWxP4urH5yxdUObhA0J/nw7YhO1gTiczoFWl/5eOWrhEkwnXuryTHW+Fux9P?=
 =?us-ascii?q?5lgpZTAmc+j2AGBCPPtrMJp88+9Uzc64hdjEt1UhkNBierkNm+EgCLib7pId?=
 =?us-ascii?q?mGCHkqpgeZj/OauCXUCudKx390+YtOR+rcFc+0Syp6W6dDDdEuv5dZaV/FOM?=
 =?us-ascii?q?P+w3mAKs3pHK/yFz0g3hjMTAoDEMSXcU/gC0rCslzJh9F8CX4hBbrjgX7kAc?=
 =?us-ascii?q?LIyL96uSzrTxYPcHW1rp8AKd5BbbOxEbbrjwZuXlNMRG/SF9fGfrIvz7zM3K?=
 =?us-ascii?q?KvTi+73WmdKGeR5rArc54GkJxFkj5s9MvW0fiKCNdXD3I4yDDZAbyKSOcFK2?=
 =?us-ascii?q?yp8iyElFEb6gXcMc/DI92VMZxXhEuZfMcd6mEncR67snZ0CKEWl3tGgFoeBb?=
 =?us-ascii?q?uNDPsQMa9AzUH3WsvZFLlS7KrybEybD/q7ylS7HVazaPg8lM3yAV0HeGtRFs?=
 =?us-ascii?q?Tn44a9JtrIgbCsF96DdWiNCf2HppzzaodOTQqsTB7iEnknqaOxM2OuDPXs7X?=
 =?us-ascii?q?ZwbP7jQrow1OwdbKRck0DnD9yeSeC4H8F8j6NNuila4StX2tjKcrCIQwRU/0?=
 =?us-ascii?q?/Oc35Hpq5uD3B/JWaDakZea2qdvu8UKW70c9t0owDCHv3u42o+yjT/9UEHRE?=
 =?us-ascii?q?ZEcJxDkZ4cAOLTYthJtlbzqXE6TgHI251qNNU06T7JhSJDNv9OwKRtfTOz/O?=
 =?us-ascii?q?nbBHH7QO/GRwz76/mhGpgs+nbQkxEjNfEK9/rxsZQoggc7XpmIvFfjgSMILB?=
 =?us-ascii?q?XQeSzdNmX0PRsIgTOOFppoc4ic2jV0yC3WSxnerIBO2+5hWjS5m0RTOvZ30Z?=
 =?us-ascii?q?K0FBH6t1VII0KADvbVF3+ME8VCIZKpKSE6AbimRSqJCAbMVHhJ5yHH0EBtqq?=
 =?us-ascii?q?TFwCzIlLjwz3e8bS68Q2IRDZtV0054DvBVdI4Gq6leB6INZUy8TT4AsPN7DV?=
 =?us-ascii?q?iSbLNTzZgWNB9vza/3weLzWIRDANZLu09RNCwpRWODMpxMekyCwKhuJ7Yhj2?=
 =?us-ascii?q?mGbrjKRFqZg2zoryc5tFBtCeOENTtSuONEiTljHZiuNGzZ1dGtsA3CshJF55?=
 =?us-ascii?q?gf+9IVbeGzNiFbZDU4oxPQ57RVmunzaP9ISHc2EeH9WYVr6jE06soChlVQst?=
 =?us-ascii?q?t8sCqgfTtB8+CnIXOXLsQYLLUp76D5GrjRT2A09BBuCDd+T1Y9AujRzKqfaP?=
 =?us-ascii?q?vP5uQg1FPkw3Zre9cbjJjpbPztZnxPmfHQ1qcP7MxZDnJz9k1lIn9oMH2r0Y?=
 =?us-ascii?q?a87Lo3BDqDp/iulK7U1kPECgCryaXb6TlLGm2++0HECrY26p7m3g6+iIFrJ4?=
 =?us-ascii?q?jVvCOLjqyBkx/PPgucr3bChDdIf+wdQZZoJX1mfAPRbN3sI2O+bpOcPedRjL?=
 =?us-ascii?q?PxcgkFP4zNBgrUFK3Y7qS3l+sQ+HSxNP2YbbRlo/+ZwrpBkEBAxcI9QlFit7?=
 =?us-ascii?q?ag/q+1Qrh47B+FdGEM+SDZv7Xzo/CcDNBOVWzosgoMP4o1KluLl9grOE6+fi?=
 =?us-ascii?q?P9vsSmpLILGu3mE+weZoU1VMhBejLNZqU3USQatAb64EBMOkrKN1QhOiziuk?=
 =?us-ascii?q?w9prLAcZItAYGWHkR/HBafIL9SAFsXFuDWr7mvISCdy7rRSQlpOZqSAEOyOt?=
 =?us-ascii?q?Nym3+0Jn+Kx0soW6dLjf/KmOxnQirn+hY4/Ug4C+3e7W66x+QkIeatH+vh0y?=
 =?us-ascii?q?gy3Lw0v2mAss6ejWTGROkZ+HCfxprNjlWLUw+NcXO3kZXD9jpI4AxpkMBYWK?=
 =?us-ascii?q?JJeBYPtYSVlP30bYf3yGo1vg1RQT0JFHLhkwhmFN1R2cqMnEdJA7ZqtO4waj?=
 =?us-ascii?q?s4vvsK9vHZ1H7euuygj1TueRbfQ0Dvm3zhFKN8WNxJ+3m9XYi3FsXHbxOvvC?=
 =?us-ascii?q?yCpzyYBZVTz0u6SNwCTT8UoSB00XRGy25c6B6/QVkA/9V5LMjlJzyRUgM5Ir?=
 =?us-ascii?q?VlruTVEiDwjtek5m73aywQgELGghu5cKHUiVcYSwZEU0Bq29Rr7Ia6OhZWcJ?=
 =?us-ascii?q?z3G4RP4DwO/kKAvSlpiLCTzPWwJv+y75U450JunSd5l/eAs93xKAdlLvN5gW?=
 =?us-ascii?q?9uVbMXJ11OFmktx+jJJ4QwJTxI+5OWsWAcXGcbib/Q7YXLX6nWWhg0+vdVJo?=
 =?us-ascii?q?b3Jpfl5kEk51i3D4nuSDBpV+0FGXnpY9oARM7LBQcuHOJVC1EVHmOVWYD4DC?=
 =?us-ascii?q?WU1fk1ui12L+StYz5ezUsoMGTWpbeYrqlxee1O1Vyxhmv7U0+036A8TKNRdi?=
 =?us-ascii?q?QXXit1jbxiNHArat0o/36NVwh5jY4fwrKOSN0awiE+qwXa6bf3punVj/eKUV?=
 =?us-ascii?q?tK69B8hXxbkxmH0rX5G99FG4ZqBc45xZAS3+cJIfrmBG9HkfQbusSDN3w4MN?=
 =?us-ascii?q?epBnvoZ?=
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="78411177"
Date: Thu, 18 Aug 2022 17:14:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] libxl: use time_t for qmp_synchronous_send()'s last
 parameter
Message-ID: <Yv5lgAUjrMj0ofEI@perard.uk.xensource.com>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
 <9ac207d1-8a20-b880-e564-57494bc5b551@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9ac207d1-8a20-b880-e564-57494bc5b551@suse.com>

On Thu, Aug 18, 2022 at 04:07:16PM +0200, Jan Beulich wrote:
> "int" is not a suitable type to hold / receive "time_t" values.
> 
> The parameter is presently unused, so no functional change.
> 
> Coverity ID: 1509377
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

> ---
> An obvious alternative would be to drop the parameter for being unused,
> but I assume there were plans to use it in some way.

I'd rather drop the function all together instead, it doesn't get much
use these days as it's been replaced in many cases.

On the other hand, there seems to be only one call site, it would
be only one extra change to drop it, so that would be one way to fix
this. As you wish.

Thanks,

-- 
Anthony PERARD

