Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD3366F0E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114839.218947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEhu-0003WL-AY; Wed, 21 Apr 2021 15:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114839.218947; Wed, 21 Apr 2021 15:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEhu-0003Vw-7O; Wed, 21 Apr 2021 15:24:02 +0000
Received: by outflank-mailman (input) for mailman id 114839;
 Wed, 21 Apr 2021 15:24:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEht-0003Vo-5U
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:24:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6097ea9a-8cde-4a89-9ea3-805289eac83e;
 Wed, 21 Apr 2021 15:24:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E0C3B4F4;
 Wed, 21 Apr 2021 15:23:59 +0000 (UTC)
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
X-Inumbo-ID: 6097ea9a-8cde-4a89-9ea3-805289eac83e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619018639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O55BFAVHl1k2hSCRXuwD9sObx1sD6Qj4tI/HRCtDbp8=;
	b=JNCPmm5gGZxnc0acgTiALBt2VkEkSS9OSLzElOJS3zJ66/9CjrINtQv0mzA+GxG39R1YOW
	iqhuVEXMHMDWsdPzM/YsSGlg8m/Lik6L30A4XuM7X3rAeXGSPZN+nplWB35sQ4ofVPZHIN
	mfmKlU3dK1sk+sv7BFtYZFg0+deVPgU=
Subject: Ping: [PATCH v5 0/6] evtchn: (not so) recent XSAs follow-on
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Message-ID: <d29fa89b-ea0a-bdbd-04c9-02eff0854d47@suse.com>
Date: Wed, 21 Apr 2021 17:23:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.01.2021 09:13, Jan Beulich wrote:
> These are grouped into a series largely because of their origin,
> not so much because there are (heavy) dependencies among them.
> The main change from v4 is the dropping of the two patches trying
> to do away with the double event lock acquires in interdomain
> channel handling. See also the individual patches.
> 
> 1: use per-channel lock where possible
> 2: convert domain event lock to an r/w one
> 3: slightly defer lock acquire where possible
> 4: add helper for port_is_valid() + evtchn_from_port()
> 5: type adjustments
> 6: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()

Only patch 4 here has got an ack so far - may I ask for clear feedback
as to at least some of these being acceptable (I can see the last one
being controversial, and if this was the only one left I probably
wouldn't even ping, despite thinking that it helps reduce unecessary
overhead).

Jan

