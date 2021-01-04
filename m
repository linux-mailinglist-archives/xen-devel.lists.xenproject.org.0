Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14A2E9809
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61292.107717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRPs-0003MF-N7; Mon, 04 Jan 2021 15:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61292.107717; Mon, 04 Jan 2021 15:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRPs-0003Lo-I2; Mon, 04 Jan 2021 15:05:04 +0000
Received: by outflank-mailman (input) for mailman id 61292;
 Mon, 04 Jan 2021 15:05:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwRPr-0003Lj-Ef
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:05:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad2ab7ee-7c27-4654-8b82-8b7e07072ef6;
 Mon, 04 Jan 2021 15:05:02 +0000 (UTC)
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
X-Inumbo-ID: ad2ab7ee-7c27-4654-8b82-8b7e07072ef6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609772702;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=q9OYNlfnE3OlhnrFvUcV1gTc5tc0ie1BtS+wl9GinzQ=;
  b=LPIXgzJmqyMC6WBTtT6W/W6lxoldkKJ39m0REwc845UbUWh7YIG6CS+B
   JPPzBObipWlv+ManuHZ8JUfb12NlkZZR3ADutvkpWcXqBG9IZ5Jwo1spC
   IqvOfr148xJ4oFbexi2DASdzqyMG8Ht3kXwwY8vNHD6AHtClkiunKR7hM
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fj8ykU6ZqALn4FrGHfT9vuyoqi6BmcT7bAHvunUta2cgeD9hkYxAMOZFUfvqsdr7h+6/+dNOaR
 iBZxvRA99/Bgzu3jBwlWEINQ2bXlJf4vgTGnh+qsVtwszjtTFgicBivLONLQnOQxf23G0htXW+
 JBTRr6Y62mlcA1mTB4ArqVL/yNhaTZQB1oCJo1ZSuQJq/rsxg1Co+sVtFj5Uzajw48YICqB11D
 AN41FYN5HHgXXTCIyVMHN+paLqxwmzXdyuzngco61WeGK9WL7Ih4TDw21yH2NF1ndN7zKKJg0s
 v5s=
X-SBRS: 5.2
X-MesageID: 34574653
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34574653"
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
Date: Mon, 4 Jan 2021 15:04:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 23/12/2020 15:13, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway, by doing this only
> in gnttab_populate_status_frames().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Defer allocation to when a domain actually switches to the v2 grant
>     API.

I see this as a backwards step.  It turns a build-time -ENOMEM into a
runtime -ENOMEM, and if you recall from one of the XSAs, the Windows PV
drivers will BUG() if set_version fails.  (Yes - this is dumb behaviour,
but it is in the field now.)

It is the toolstack's responsibility to not over-extend the capabilities
of the host, but this is impossible to do with behaviour like this. 
Failing at domain creation time is a whole lot less bad for the system
as a whole.

Longer term, allocations like this ought to come from some per-domain
pool (possibly not shared with the shadow memory pool), which can be
sized suitably at create time.

This is one of the points behind introducing dmalloc()/etc in the
fault-injection series.  At the moment, we have absolutely no clue what
the memory overhead of a domain is in Xen.  It is impossible to
calculate how many VMs will fit on a host, because the only way you can
answer the question is to attempt to create them all.

Understanding how much memory a domain actually takes is the first
step.  Creating a plausible bound is the second step, and that will be
of substantial use to higher level management software.

~Andrew

