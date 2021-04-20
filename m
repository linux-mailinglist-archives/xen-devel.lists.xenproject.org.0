Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0D365577
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 11:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113434.216142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmkb-0005Pl-Bi; Tue, 20 Apr 2021 09:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113434.216142; Tue, 20 Apr 2021 09:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmkb-0005PM-8N; Tue, 20 Apr 2021 09:32:57 +0000
Received: by outflank-mailman (input) for mailman id 113434;
 Tue, 20 Apr 2021 09:32:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYmkZ-0005PH-TH
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 09:32:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeac016e-3059-45e2-a553-4235ac8e2138;
 Tue, 20 Apr 2021 09:32:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7074FB2D8;
 Tue, 20 Apr 2021 09:32:54 +0000 (UTC)
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
X-Inumbo-ID: eeac016e-3059-45e2-a553-4235ac8e2138
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618911174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mk8fDefez7G4plutkn94gH7g6EomInHaL6VBkm/kkcE=;
	b=WauKVrHV40lFYcQsIIN5s5h+voRxSCnVUsUyHUGcNyX+v77tQfehh0Qft5TvMdg3QlC8zH
	5Bi2We/+1rOzCiNOGwrfi5GE/EM4h0WmeOx2lI/OsA8UCi6xbHfeXmpO+XSmyNSUOYcCLz
	ah5Ronne9yRIYJq/H2+7ksl0C95c3ms=
Subject: Re: [PATCH v3 5/6] x86/vpic: issue dpci EOI for cleared pins at ICW1
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-6-roger.pau@citrix.com>
 <f20953be-ee22-c336-bca5-8da84af49261@suse.com>
Message-ID: <23ceee47-a69d-5aaa-d5ad-e12fae1f62cf@suse.com>
Date: Tue, 20 Apr 2021 11:32:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f20953be-ee22-c336-bca5-8da84af49261@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 17:57, Jan Beulich wrote:
> On 26.01.2021 14:45, Roger Pau Monne wrote:
>> When pins are cleared from either ISR or IRR as part of the
>> initialization sequence forward the clearing of those pins to the dpci
>> EOI handler, as it is equivalent to an EOI. Not doing so can bring the
>> interrupt controller state out of sync with the dpci handling logic,
>> that expects a notification when a pin has been EOI'ed.
>>
>> Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> As said before, under the assumption that the clearing of IRR
> and ISR that we do is correct, I agree with the change. I'd
> like to give it some time though before giving my R-b here, for
> the inquiry to hopefully get answered. After all there's still
> the possibility of us needing to instead squash that clearing
> (which then would seem to result in getting things in sync the
> other way around).

Still haven't heard anything, so

Reviewed-by: Jan Beulich <jbeulich@suse.com>

In the worst case we'd need to consider reverting later on.

Jan

