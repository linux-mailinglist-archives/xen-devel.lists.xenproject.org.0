Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608E57BB12
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372010.603826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oECDg-0002Au-4c; Wed, 20 Jul 2022 16:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372010.603826; Wed, 20 Jul 2022 16:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oECDg-00028d-19; Wed, 20 Jul 2022 16:06:40 +0000
Received: by outflank-mailman (input) for mailman id 372010;
 Wed, 20 Jul 2022 16:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgt+=XZ=citrix.com=prvs=193804040=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oECDe-00025G-WA
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 16:06:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecdf0b1a-0845-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 18:06:35 +0200 (CEST)
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
X-Inumbo-ID: ecdf0b1a-0845-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658333195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gbGvLp8fdso+bACMBSwD3Z+fkqyE4Fr15tmPJJuH8kI=;
  b=SagQvOlumhrfqajXY+HUrYGnsqMTGcIvNlcNzaLkQ9nT3bVhnqgr9PVG
   n0BijSnGwz71lTpWdQrn2JbuITLAqFrbmu7vqgumvc3wwbQoejJclPIcQ
   oAfpKekUnnWn1U2vJVMi2nIBaDD7M8zKdGgGeYNxm5rsfw4DxFcS6CSb+
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78813765
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qzMa5qllIXi5Gj4Q9kIqbHzo5gymJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWj+DbPzZY2HwctByOYuxo0lQuJLczYJnQFNppSw9QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3466q4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kYYZA1+cB0Qlpnz
 tEhDR0dVQjZttyflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oe9YIOOJYLXLSlTtlSFj
 0T/0TnVOAEDK+6z5CaP2E+Q2daayEsXX6pNTeblp5aGmma73GsIAgcRUli9ifa8g0+6HdlYL
 iQ85S4GvaU0skuxQbHVWBm1o2WNuBIGbMZBCO0x6AyLya387h6QAy4PSTspQNsiucwtWS0x1
 neGmtroAXpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT0wzarjGKpdvyZzUY3yD6Tlm9tDJHTdvwD2C30mQ3/cqsPa7AEATR5
 iFeypTHhAwdJcrTzXLQGY3hCJnsvq/Ya2OE3DaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGLoC6TLwJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUCZAVPk3lGfrG7d1PVoXKscWnDm7eHwG507/jer2iIC9Et/pz2dinshmtfjZ8W05A
 v5UNteQygU3bdASlhL/qNdLRXhXfCdTOHwDg5YIHgJ1ClY5RTpJ5j646e9JRrGJaIwOyL2Wp
 i3iABEEoLc97FWeQTi3hrlYQOuHdf5CQbgTYUTA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:mHvrmKzjMRD1zm5cw+ZxKrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.92,286,1650945600"; 
   d="scan'208";a="78813765"
Date: Wed, 20 Jul 2022 17:06:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] golang/xenlight: Update generated code
Message-ID: <Ytgn+OyXmWv2aBeg@perard.uk.xensource.com>
References: <20220718092125.307310-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220718092125.307310-1-olekstysh@gmail.com>

On Mon, Jul 18, 2022 at 12:21:25PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Re-generate goland bindings to reflect changes to libxl_types.idl
> from the following commit:
> 54d8f27d0477 tools/libxl: report trusted backend status to frontends
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

