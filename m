Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F035AF90
	for <lists+xen-devel@lfdr.de>; Sat, 10 Apr 2021 20:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108272.206681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVIIA-0004hh-23; Sat, 10 Apr 2021 18:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108272.206681; Sat, 10 Apr 2021 18:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVII9-0004hI-Um; Sat, 10 Apr 2021 18:25:09 +0000
Received: by outflank-mailman (input) for mailman id 108272;
 Sat, 10 Apr 2021 18:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FbzA=JH=ipxe.org=mcb30@srs-us1.protection.inumbo.net>)
 id 1lVII8-0004hC-T2
 for xen-devel@lists.xenproject.org; Sat, 10 Apr 2021 18:25:08 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b587eb5-6b1a-4cad-af57-582dc7d145b1;
 Sat, 10 Apr 2021 18:25:07 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 3DBA24422B;
 Sat, 10 Apr 2021 18:25:04 +0000 (UTC)
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
X-Inumbo-ID: 4b587eb5-6b1a-4cad-af57-582dc7d145b1
To: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 Paul Durrant <pdurrant@amazon.com>
From: Michael Brown <mcb30@ipxe.org>
Subject: xen-netback hotplug-status regression bug
Message-ID: <afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org>
Date: Sat, 10 Apr 2021 19:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

Commit https://github.com/torvalds/linux/commit/1f25657 ("xen-netback: 
remove 'hotplug-status' once it has served its purpose") seems to have 
introduced a regression that prevents a vif frontend from transitioning 
more than once into Connected state.

As far as I can tell:

- The defined vif script (e.g. /etc/xen/scripts/vif-bridge) executes 
only once, at domU startup, and sets 
backend/vif/<domU>/0/hotplug-status="connected"

- When the frontend first enters Connected state, 
drivers/net/xen-netback/xenbus.c's connect() sets up a watch on 
"hotplug-status" with the callback function hotplug_status_changed()

- When hotplug_status_changed() is triggered by the watch, it 
transitions the backend to Connected state and calls xenbus_rm() to 
delete the "hotplug-status" attribute.

If the frontend subsequently disconnects and reconnects (e.g. 
transitions through Closed->Initialising->Connected) then:

- Nothing recreates "hotplug-status"

- When the frontend re-enters Connected state, connect() sets up a watch 
on "hotplug-status" again

- The callback hotplug_status_changed() is never triggered, and so the 
backend device never transitions to Connected state.


Reverting the commit would fix this bug, but would obviously also 
reintroduce the race condition that the commit was designed to avoid.

I'm happy to put together a patch, if one of the maintainers could 
suggest a sensible design approach.

I'm not a list member, so please CC me directly on replies.

Thanks,

Michael

