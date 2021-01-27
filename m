Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4993056FC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75863.136731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hA0-0005su-Nj; Wed, 27 Jan 2021 09:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75863.136731; Wed, 27 Jan 2021 09:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hA0-0005sY-KV; Wed, 27 Jan 2021 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 75863;
 Wed, 27 Jan 2021 09:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4h9y-0005sR-G6
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:30:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fede2ec1-de0d-4ddf-a925-13ab7a3a6aad;
 Wed, 27 Jan 2021 09:30:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 031C9AD57;
 Wed, 27 Jan 2021 09:30:45 +0000 (UTC)
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
X-Inumbo-ID: fede2ec1-de0d-4ddf-a925-13ab7a3a6aad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611739845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjbC35B4iQnKQHTJ/BuoGsLUqOcSHbnLcmSMHzbkBw8=;
	b=pkyWwYpZdHAgpB3pMk0ET8jiSS+AYY4yOrYpouuGH5DlqNThHZwOeba8WtotbziTNgeMZn
	opHENugpl9CSoJVO3Nq4QnWLxb6FuipTdfqCa8T1hWFAIQ4dVA1LY8dEM8DZCxoiFkQFS4
	KW0w6KDCZc/UVQMhF3YcMWrruDsCAyw=
Subject: Re: [PATCH v3 5/6] x86/vpic: issue dpci EOI for cleared pins at ICW1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-6-roger.pau@citrix.com>
 <f20953be-ee22-c336-bca5-8da84af49261@suse.com>
 <20210127091545.tyzqinafcw5sz5j6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56d1ccf1-f36d-b636-d1a8-c18f13c7bd6e@suse.com>
Date: Wed, 27 Jan 2021 10:30:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127091545.tyzqinafcw5sz5j6@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.01.2021 10:15, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 05:57:49PM +0100, Jan Beulich wrote:
>> On 26.01.2021 14:45, Roger Pau Monne wrote:
>>> When pins are cleared from either ISR or IRR as part of the
>>> initialization sequence forward the clearing of those pins to the dpci
>>> EOI handler, as it is equivalent to an EOI. Not doing so can bring the
>>> interrupt controller state out of sync with the dpci handling logic,
>>> that expects a notification when a pin has been EOI'ed.
>>>
>>> Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> As said before, under the assumption that the clearing of IRR
>> and ISR that we do is correct, I agree with the change. I'd
>> like to give it some time though before giving my R-b here, for
>> the inquiry to hopefully get answered. After all there's still
>> the possibility of us needing to instead squash that clearing
>> (which then would seem to result in getting things in sync the
>> other way around).
> 
> OK, let's wait a bit to see what Intel replies. I assume this would
> qualify as a bugfix for getting it committed later?

It would be up to Ian then to judge, but as long as it fixes an
actual bug, my understanding is it will still qualify for being
considered.

Jan

