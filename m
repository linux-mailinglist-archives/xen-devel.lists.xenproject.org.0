Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56DE29ED1B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 14:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14168.35174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8A6-0005Gf-2M; Thu, 29 Oct 2020 13:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14168.35174; Thu, 29 Oct 2020 13:40:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8A5-0005GG-V1; Thu, 29 Oct 2020 13:40:17 +0000
Received: by outflank-mailman (input) for mailman id 14168;
 Thu, 29 Oct 2020 13:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY8A4-0005GA-Kj
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:40:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e56244f9-637f-432b-9926-a2ae2319acb5;
 Thu, 29 Oct 2020 13:40:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2333AD5F;
 Thu, 29 Oct 2020 13:40:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY8A4-0005GA-Kj
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:40:16 +0000
X-Inumbo-ID: e56244f9-637f-432b-9926-a2ae2319acb5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e56244f9-637f-432b-9926-a2ae2319acb5;
	Thu, 29 Oct 2020 13:40:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603978815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q1Bpm8q+ni/LHNqViyLzcib+SJg2pmfkMPF/cyhDaY0=;
	b=LvC1tcQQM3Qi52PjN8fRYqtdvymULGqB22kJgLpoggxRZvpR00J8JnoSk6s+PyBV/23awh
	wSn4Y9nigJ1Ld7fjHqnyeDkax8kCQPxYppZM1kQDAK80/Hmt0RbTHo26NWjYVPCiLTiS21
	tHT0bf4EruNg6EdqP5EkLuRVbmfY1d0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F2333AD5F;
	Thu, 29 Oct 2020 13:40:14 +0000 (UTC)
Subject: Ping: [PATCH v3 0/3] x86: shim building adjustments (plus shadow
 follow-on)
From: Jan Beulich <jbeulich@suse.com>
To: Tim Deegan <tim@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Message-ID: <73ec8762-d7c4-c46f-b0bf-f40b89377312@suse.com>
Date: Thu, 29 Oct 2020 14:40:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Tim,

On 19.10.2020 10:42, Jan Beulich wrote:
> The change addressing the shadow related build issue noticed by
> Andrew went in already. The build breakage goes beyond this
> specific combination though - PV_SHIM_EXCLUSIVE plus HVM is
> similarly an issue. This is what the 1st patch tries to take care
> of, in a shape already on irc noticed to be controversial. I'm
> submitting the change nevertheless because for the moment there
> looks to be a majority in favor of going this route. One argument
> not voiced there yet: What good does it do to allow a user to
> enable HVM when then on the resulting hypervisor they still can't
> run HVM guests (for the hypervisor still being a dedicated PV
> shim one). On top of this, the alternative approach is likely
> going to get ugly.
> 
> The shadow related adjustments are here merely because the want
> to make them was noticed in the context of the patch which has
> already gone in.
> 
> 1: don't permit HVM and PV_SHIM_EXCLUSIVE at the same time
> 2: refactor shadow_vram_{get,put}_l1e()
> 3: sh_{make,destroy}_monitor_table() are "even more" HVM-only

unless you tell me otherwise I'm intending to commit the latter
two with Roger's acks some time next week. Of course it would
still be nice to know your view on the first of the TBDs in
patch 3 (which may result in further changes, in a follow-up).

Jan

