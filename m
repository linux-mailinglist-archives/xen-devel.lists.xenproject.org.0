Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4036EDAA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 17:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120156.227214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8wc-0000ai-39; Thu, 29 Apr 2021 15:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120156.227214; Thu, 29 Apr 2021 15:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8wb-0000aI-W2; Thu, 29 Apr 2021 15:51:13 +0000
Received: by outflank-mailman (input) for mailman id 120156;
 Thu, 29 Apr 2021 15:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc8wa-0000aB-Q5
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 15:51:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6df97246-ae9e-4d53-a6eb-f047fd397faf;
 Thu, 29 Apr 2021 15:51:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE8AAAEA6;
 Thu, 29 Apr 2021 15:51:10 +0000 (UTC)
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
X-Inumbo-ID: 6df97246-ae9e-4d53-a6eb-f047fd397faf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619711470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkwe+HJmqmilqg8AsmCJ4pWgrTNaXBW/4xK6N4eMWhI=;
	b=X38kS2rSb94Q36f5n65BgkhmWtv8UxliONrobN+oO3BJmyb+BaQ0bOd9SkMs3uZGzSmWnc
	cIQNZu9nZbDmCVnqBig4YVl4Pa+Ohyr51xQPl+2jNyQ1+vWjiLY+8t8oXW0cCGWuS1Vc5T
	5VSd7/BvwIJZNQ9YtPffLW09rjeMqA8=
Subject: Re: [PATCH v4 04/12] x86/vioapic: switch to use the EOI callback
 mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1fcc651-a554-d10c-a84e-d79518ae5888@suse.com>
Date: Thu, 29 Apr 2021 17:51:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> Switch the emulated IO-APIC code to use the local APIC EOI callback
> mechanism. This allows to remove the last hardcoded callback from
> vlapic_handle_EOI. Removing the hardcoded vIO-APIC callback also
> allows to getting rid of setting the EOI exit bitmap based on the
> triggering mode, as now all users that require an EOI action use the
> newly introduced callback mechanism.
> 
> Move and rename the vioapic_update_EOI now that it can be made static.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


