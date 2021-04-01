Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C1A35106F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 09:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104122.198771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsBW-0008VY-3v; Thu, 01 Apr 2021 07:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104122.198771; Thu, 01 Apr 2021 07:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsBW-0008VB-0c; Thu, 01 Apr 2021 07:56:10 +0000
Received: by outflank-mailman (input) for mailman id 104122;
 Thu, 01 Apr 2021 07:56:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsBU-0008V6-JH
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 07:56:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9a6458f-1a25-436d-bbf6-fc1c94ea109f;
 Thu, 01 Apr 2021 07:56:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0758EB21F;
 Thu,  1 Apr 2021 07:56:07 +0000 (UTC)
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
X-Inumbo-ID: d9a6458f-1a25-436d-bbf6-fc1c94ea109f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617263767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crDx6RJ3pOXnjuMYs8hePdC2YuFryi75VhhC9or0s44=;
	b=r4SmKVGNDkmjpjPnOau9hDW5sVVc6W6lthXxMZuNi+ylG+hMgvdiarN3uM4jfDcKvH2ITJ
	V91ln7HPpKHz753bshK81wr+ZZO5Gtmo8vvCA43Qpe8HUwO5A+xtTGg02GU5s8/rI8x36X
	2QhY+Um393XpTxT1bycZaRI4VhkIhUE=
Subject: Ping: [PATCH 4/5] x86/PV: restrict TLB flushing after
 mod_l[234]_entry()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
 <20210111130020.ogpsylc7sh3wzb7i@Air-de-Roger>
 <2bee9e95-17f7-4089-4adf-29db50c5c4fd@suse.com>
Message-ID: <efc19a1c-5e63-e48e-89fc-5d353374e4d9@suse.com>
Date: Thu, 1 Apr 2021 09:56:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2bee9e95-17f7-4089-4adf-29db50c5c4fd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 14:22, Jan Beulich wrote:
> On 11.01.2021 14:00, Roger Pau Monné wrote:
>> On Tue, Nov 03, 2020 at 11:57:33AM +0100, Jan Beulich wrote:
>>> Just like we avoid to invoke remote root pt flushes when all uses of an
>>> L4 table can be accounted for locally, the same can be done for all of
>>> L[234] for the linear pt flush when the table is a "free floating" one,
>>> i.e. it is pinned but not hooked up anywhere. While this situation
>>> doesn't occur very often, it can be observed.
>>>
>>> Since this breaks one of the implications of the XSA-286 fix, drop the
>>> flush_root_pt_local variable again and set ->root_pgt_changed directly,
>>> just like it was before that change.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> LGTM, so:
>>
>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
>> It would be good however if Andrew can give is opinion also, since he
>> was the one to introduce such logic, and it's not trivial.
> 
> I can certainly wait some, also to hopefully get a comment on
> 
>>> ---
>>> While adjusting the big comment that was added for XSA-286 I wondered
>>> why it talks about the "construction of 32bit PV guests". How are 64-bit
>>> PV guests different in this regard?
> 
> ... this, but his email troubles make it hard to judge for how
> long to wait.

About like for the other one just pinged, I intend to commit this
one together with the other two still pending ones in this series
once the tree is fully open again, unless I hear otherwise by then.
All three have been acked by Roger.

Jan

