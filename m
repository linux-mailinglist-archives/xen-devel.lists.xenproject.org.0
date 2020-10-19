Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B12923DA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 10:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8662.23183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQkg-0005X6-Ep; Mon, 19 Oct 2020 08:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8662.23183; Mon, 19 Oct 2020 08:42:46 +0000
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
	id 1kUQkg-0005Wh-Bi; Mon, 19 Oct 2020 08:42:46 +0000
Received: by outflank-mailman (input) for mailman id 8662;
 Mon, 19 Oct 2020 08:42:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUQke-0005Wc-U3
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:42:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 782ea23b-ddc4-4ec7-b6c8-478d4d14405a;
 Mon, 19 Oct 2020 08:42:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46892ADCC;
 Mon, 19 Oct 2020 08:42:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUQke-0005Wc-U3
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:42:44 +0000
X-Inumbo-ID: 782ea23b-ddc4-4ec7-b6c8-478d4d14405a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 782ea23b-ddc4-4ec7-b6c8-478d4d14405a;
	Mon, 19 Oct 2020 08:42:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603096963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NjUdc3Xz8megZ6ucNz+/Pu0EanI1CIIppZmzrzwJ0/s=;
	b=RzIdiMSiBO1bvyDiJYkCHM/o7xr9/c2inP/eSueQb7r2+aRiiRBH+ShXDeL5eM3FOMV6am
	CBoan3gPuU4h4jPuNvUbf8zZ7CghKIUdTt0zmIx6N242KGj6IOmsCbrmvtxNA8Duv+hnQz
	nVhTp7kZMmXeeb2+FeVkWVe5ETxMosg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 46892ADCC;
	Mon, 19 Oct 2020 08:42:43 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/3] x86: shim building adjustments (plus shadow follow-on)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Message-ID: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Date: Mon, 19 Oct 2020 10:42:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The change addressing the shadow related build issue noticed by
Andrew went in already. The build breakage goes beyond this
specific combination though - PV_SHIM_EXCLUSIVE plus HVM is
similarly an issue. This is what the 1st patch tries to take care
of, in a shape already on irc noticed to be controversial. I'm
submitting the change nevertheless because for the moment there
looks to be a majority in favor of going this route. One argument
not voiced there yet: What good does it do to allow a user to
enable HVM when then on the resulting hypervisor they still can't
run HVM guests (for the hypervisor still being a dedicated PV
shim one). On top of this, the alternative approach is likely
going to get ugly.

The shadow related adjustments are here merely because the want
to make them was noticed in the context of the patch which has
already gone in.

1: don't permit HVM and PV_SHIM_EXCLUSIVE at the same time
2: refactor shadow_vram_{get,put}_l1e()
3: sh_{make,destroy}_monitor_table() are "even more" HVM-only

Jan

