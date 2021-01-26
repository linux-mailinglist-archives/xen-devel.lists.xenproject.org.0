Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36938304261
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75209.135369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QDh-00063f-RG; Tue, 26 Jan 2021 15:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75209.135369; Tue, 26 Jan 2021 15:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4QDh-00063K-O3; Tue, 26 Jan 2021 15:25:29 +0000
Received: by outflank-mailman (input) for mailman id 75209;
 Tue, 26 Jan 2021 15:25:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4QDh-00063F-3f
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:25:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c69a7a9-8f07-4cbd-a323-0a9381f8a7fc;
 Tue, 26 Jan 2021 15:25:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E61D4AB92;
 Tue, 26 Jan 2021 15:25:25 +0000 (UTC)
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
X-Inumbo-ID: 7c69a7a9-8f07-4cbd-a323-0a9381f8a7fc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611674726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJhMgi4L/CDuHs+74SzZn37M/yhQaqjn5Iihe3n9oJc=;
	b=uxikR5djVyk1L2M9FdxvssnHKjrtJI72a4amvpLXavDoKe6yX6n39tLxUJmGVYdm4xRcC7
	5pA54b0Dq8zJvLaYvyVt6GsZLvf2aoqApABg55vl8XIaBEsH6KlBql+Lkp/UgILnxrEBwS
	K4KEL75P87jkx/yri95M8U2RgTy/3Q4=
Subject: Re: [PATCH v3 2/6] x86/vioapic: issue EOI to dpci when switching pin
 to edge trigger mode
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6b886fb-11f1-6071-72d4-3d4d8d7f1cd5@suse.com>
Date: Tue, 26 Jan 2021 16:25:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126134521.25784-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 14:45, Roger Pau Monne wrote:
> When an IO-APIC pin is switched from level to edge trigger mode the
> IRR bit is cleared, so it can be used as a way to EOI an interrupt at
> the IO-APIC level.
> 
> Such EOI however does not get forwarded to the dpci code like it's
> done for the local APIC initiated EOI. This change adds the code in
> order to notify dpci of such EOI, so that dpci and the interrupt
> controller are in sync.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


