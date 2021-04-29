Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86D36EDA2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 17:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120144.227187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8u0-00083B-6y; Thu, 29 Apr 2021 15:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120144.227187; Thu, 29 Apr 2021 15:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8u0-00082l-39; Thu, 29 Apr 2021 15:48:32 +0000
Received: by outflank-mailman (input) for mailman id 120144;
 Thu, 29 Apr 2021 15:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc8ty-00082g-5N
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 15:48:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11ecf22d-4f25-4b67-a06c-0cd87944ca2a;
 Thu, 29 Apr 2021 15:48:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FD25AEA6;
 Thu, 29 Apr 2021 15:48:28 +0000 (UTC)
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
X-Inumbo-ID: 11ecf22d-4f25-4b67-a06c-0cd87944ca2a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619711308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kRcHWeI7wrH2wqnPkM+OfGLeZ3hELeyUsbrDTyst9uY=;
	b=tG3ILaGD4ENzkhqHMqZReuOWi9VmkysgeQ2/KyferAilSdK7axw+ZGoJQwLcpoGetc5iZU
	WfPgEUJDa5IUOOGNsXRiX+khTh61/DQTwPIGziWTabNMGGmg5y7LIUTjXafFTNpWecfVVt
	ljwWKvfc/BupM+ci4hb/tOvesX1QfmA=
Subject: Re: [PATCH v4 02/12] x86/vlapic: introduce an EOI callback mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <393a1804-6761-9f40-efc8-815993a815bd@suse.com>
Date: Thu, 29 Apr 2021 17:48:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> Add a new vlapic_set_irq_callback helper in order to inject a vector
> and set a callback to be executed when the guest performs the end of
> interrupt acknowledgment.
> 
> Such functionality will be used to migrate the current ad hoc handling
> done in vlapic_handle_EOI for the vectors that require some logic to
> be executed when the end of interrupt is performed.
> 
> The setter of the callback will be in charge for setting the callback
> again on guest restore, as callbacks are not saved as part of the
> vlapic state. That is the reason why vlapic_set_callback is not a
> static function.
> 
> No current users are migrated to use this new functionality yet, so no
> functional change expected as a result.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

