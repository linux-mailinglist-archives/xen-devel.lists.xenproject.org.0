Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543058AAF7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381141.615689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwfJ-0003pJ-Ed; Fri, 05 Aug 2022 12:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381141.615689; Fri, 05 Aug 2022 12:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwfJ-0003mt-By; Fri, 05 Aug 2022 12:42:57 +0000
Received: by outflank-mailman (input) for mailman id 381141;
 Fri, 05 Aug 2022 12:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gIeK=YJ=citrix.com=prvs=209c8ba5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJwfI-0003mn-PW
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:42:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ea14101-14bc-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 14:42:54 +0200 (CEST)
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
X-Inumbo-ID: 1ea14101-14bc-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659703373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euWSBfbmZsItBC3hxzTVH+hCNlldPJzlYSx/FyyOXBg=;
  b=PUkhvMMyi56Xe2JmEWhHvJDTirX24/rvlrP5zK8eRrMN+5qnbTG3yAVw
   pH7Bokt54NpklfM/7Qdb/5Bn8wHDfse83ylXqgvlSQ7tg0NGBXCXVAqv8
   8qfX/MObWJKkYvxsgf6EdLhOaiHjr0GTAWC0tf3/QONndD9JAJ0n9wNjX
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77454067
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:cUhp3KhbU0CcU4VHiYFJ0DSoX161FhAKZh0ujC45NGQN5FlHY01je
 htvC2vXOq6ONzb3eN5zb9jgo0MH7JHUytM2QQI+pXthQiob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSq5GtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eJ4EZ+/l1Wk539
 KIhIS8cLRu/hOuK+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyb4aIJoTUGq25mG69p
 mLi0EbmAighE4akmDWO2VKilOH2yHaTtIU6S+Tjq68CbEeo7kweDgcHE2Syp/aRg1S7HdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9N2MDZDAGFiQ84ofaqZ4izRnzTd9fKfvg5jHqIg0c0
 wxmvQBn2ehC05BWiPznlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rlxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpPtPvUJRznPm6SYWNuhXogj1mMvBMmPKvpnkyNSZ8IUi3+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnDu7bc2qkHyaPU+2PiH9pUEtbATTNYjULcqs/G3oz
 jqoH5LVlkQGCrekMni/HEx6BQliEEXXzKve86R/HtNv6CI/cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:eHJ1rqFkXxZif/depLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77454067"
Date: Fri, 5 Aug 2022 13:42:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: qemu's deprecated -soundhw option
Message-ID: <Yu0QQ7T+Hh1poeQi@perard.uk.xensource.com>
References: <2b5ab7dd-d38a-835e-947e-67e1be263cf3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2b5ab7dd-d38a-835e-947e-67e1be263cf3@suse.com>

On Mon, Aug 01, 2022 at 04:54:57PM +0200, Jan Beulich wrote:
> Hello,
> 
> a user was making us aware in a bug report that qemu's -soundhw command
> line option is deprecated (and apparently going to be gone in the next
> version), replaced by some form of -device. libxl_dm.c does not appear
> to know of this yet, so I wonder if this isn't something that will want
> addressing for 4.17 (and then likely also backporting). Clearly I don't
> feel capable myself of making such an adjustment, first and foremost
> since I have no clue how to know which variant a given qemu binary is
> supporting.

Thanks for letting me know. I've started to work in it.

I've also found out that "-sdl" is going away.

As for figuring out which qemu binary is been used, so far that hasn't
been needed for command line options, and it looks like it still not
needed :-). (At least, I hope using -device instead -soundhw is going to
work the same way.)

-- 
Anthony PERARD

