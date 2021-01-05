Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACC2EAC08
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61996.109453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmXR-0004GV-J3; Tue, 05 Jan 2021 13:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61996.109453; Tue, 05 Jan 2021 13:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmXR-0004G2-FK; Tue, 05 Jan 2021 13:38:17 +0000
Received: by outflank-mailman (input) for mailman id 61996;
 Tue, 05 Jan 2021 13:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U980=GI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwmXP-0004ES-7V
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:38:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb5f14dc-a301-45d7-8ae4-b6452be22eb0;
 Tue, 05 Jan 2021 13:38:13 +0000 (UTC)
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
X-Inumbo-ID: bb5f14dc-a301-45d7-8ae4-b6452be22eb0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609853893;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lCB77ODYrQ6Y/cLUQ8UgNkaYf0IvIlDHm8F951Ahp78=;
  b=dGvUfAJF+8s7Yj1P1tT0/JVaLYmmzTD5Q7/7XoJ62FB2BTZSuPq//wDx
   MBWHGhwSQ86jg6xLUitHSQFft3aaMIxoAIOXSVvB+/8B03gSF/LMPFMJF
   iiu8/MdiZSyE3uxJTMaclX2TszZ3wwzbqVmNo/jvbf0FmqKRvsSJrCkSN
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W4N7xV1b5knAHtgDUSXka9xzSxuyaYdBrpFn5unP+BY8ubUWV1c1M2QyCYIjlP4gK9jRTQblOz
 JIZeMkj7Af6EcS2DyigCVyBrRT92nZW7gXKTU5noy56acap5FCTmZncPWLd596tadXOAAqD4X7
 mKlieIERiHT3yYxkC3x6Fet5w97m8fqki70cH3CGePOcxtDzVtvxkxchJpcdt31Q/mxr0/jpgH
 p390Sx9w/ZqW2EXMF5eDc/hdOFkGEH60AC1WEYbZ9/pd8K7+Mm1RBRBtP9Hm3fXmC2VlO/OYqa
 f4Q=
X-SBRS: 5.2
X-MesageID: 34779224
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,477,1599537600"; 
   d="scan'208";a="34779224"
Subject: Re: [PATCH 1/5] common: don't (kind of) open-code
 rcu_lock_domain_by_any_id()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
 <12b46155-3b07-7ee2-3cda-160dda01e8fb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <484a5c4d-5a46-f22a-7bd9-0ca597ebf52d@citrix.com>
Date: Tue, 5 Jan 2021 13:38:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <12b46155-3b07-7ee2-3cda-160dda01e8fb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: FTLPEX02CAS02.citrite.net (10.13.99.123) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 05/01/2021 13:24, Jan Beulich wrote:
> Even more so when using rcu_lock_domain_by_id() in place of the more
> efficient rcu_lock_current_domain().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Besides get_pg_owner(), gnttab_copy_lock_domain() has similar strange(?)
> behavior: They accept DOMID_SELF, but not the resolved ID of the caller.

I queried that behaviour years and years ago.

According to Keir, it is part of the attempt to force guests to not know
their own domid.  Xen itself does (or did) its very hardest to prevent a
domU knowing its own domid, while at the same time the "domid" key in
xenstore is mandatory for setting up PV rings.

I'd personally think was a short sighted move.

~Andrew

