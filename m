Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD387791ED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582499.912296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTBc-0004WU-6p; Fri, 11 Aug 2023 14:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582499.912296; Fri, 11 Aug 2023 14:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTBc-0004T9-33; Fri, 11 Aug 2023 14:32:20 +0000
Received: by outflank-mailman (input) for mailman id 582499;
 Fri, 11 Aug 2023 14:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hSUX=D4=citrix.com=prvs=58088f632=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qUTBa-00049h-IO
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:32:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de3e8300-3853-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 16:32:17 +0200 (CEST)
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
X-Inumbo-ID: de3e8300-3853-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691764337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QSD97pX4rIQFsdB9WrmfNuasn0tkdiTxkR97JAfxjbA=;
  b=cTYLzgDZfY8/5VtNDc2RbcapHhPZrh65Wdan+g2YGmkdz/q7jzyx6LXO
   LI5WBtYW4maVVwn2npwgcw0RsglvT8CFSU8iwjFwlVUlVHvxLyLsJio5G
   OdIvmTxKLlysJk59jfLPeu4T/kRj2FpwlFROHn87B3XHXjZdWZfnUUFAw
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117921539
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:CSxFn6gz7kTBmiZVRPtkpF4GX161sBAKZh0ujC45NGQN5FlHY01je
 htvXmGAPK7fMDP2fN5/Po/joRgOscOEzNNkQFNk+Hg0Engb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AaHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQFdm8iXDCEm9iP3a28YeQxtOExHdPkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 z2XpT2kWUBy2Nq31QSqyniOl+P1thjbB7s+Hpme5qcxqQjGroAUIEJPDgbqyRWjsWa8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkqcs3SDoCx
 lKP2dTzClRHq6aJQHiQ8rOVqzKaOiUPK2IGIygeQmMt/N3LsIw1yBXVQb5LGba4lNTvFRnsw
 jqBq241gLB7sCIQ//zlpxad2Wvq/8WXCFdvvW07Q15J8CtkOtGKVayv9WLi8OlHB4vEfHyTj
 WILzp32AP81MbmBkymEQeMoFb6v5uqYPDC0vWODD6XN5Bz2pSf9INk4DCVWYR4wb51aIWOBj
 Fr741s52XNFAJe9gUabiaqVAt9i86XvHM+Nuhv8PosXOcgZmONqEUhTia+sM4LFyhREfUIXY
 83znSOQ4ZEyWMxaIMKeHbt17FPS7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXMLFgsvLe+lqEr
 YsEXydv9/m5eLehCsUw2dRJRW3m0FBhXcymwyCpXrHrzvVa9JEJVKaKnOJJl31NlKVJjObYl
 kxRqWcBoGcTcUbvcF3QAlg6MeOHYHqKhS5jVcDaFQryiidLjEfGxPt3SqbbipF7rbQ8nKQoH
 6JZEyhCa9wWIgn6F/0mRcGVhORfmN6D31nm0/aNCNTnQ6Ndeg==
IronPort-HdrOrdr: A9a23:pLkEaK74nPGkI6W+mwPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-Talos-CUID: 9a23:NAw1YG8AjX9LGI26TBiVv1NKRe8XUnrB9k7NPEiTBDtbba+kU1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AWIopSg0GcWaokUxif+76HUdYpTUj/5qBMEovgJk?=
 =?us-ascii?q?8kPKkahVcMRO7nG3sa9py?=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="117921539"
Date: Fri, 11 Aug 2023 15:31:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: correct gas --noexecstack check
Message-ID: <ad590b68-ba27-412e-ae9d-e6104c104cf4@perard>
References: <e5b54663-77c3-5be1-ea54-3f18246bf77f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e5b54663-77c3-5be1-ea54-3f18246bf77f@suse.com>

On Wed, Jul 12, 2023 at 04:23:22PM +0200, Jan Beulich wrote:
> The check was missing an escape for the inner $, thus breaking things
> in the unlikely event that the underlying assembler doesn't support this
> option.
> 
> Fixes: 62d22296a95d ("build: silence GNU ld warning about executable stacks")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

