Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAF293EB4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:29:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9681.25457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsdN-0003U5-3B; Tue, 20 Oct 2020 14:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9681.25457; Tue, 20 Oct 2020 14:29:05 +0000
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
	id 1kUsdM-0003Tg-Vy; Tue, 20 Oct 2020 14:29:04 +0000
Received: by outflank-mailman (input) for mailman id 9681;
 Tue, 20 Oct 2020 14:29:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsdL-0003Tb-Tl
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:29:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9a9a76a-ef6e-4835-bdc5-abc1f6d6603d;
 Tue, 20 Oct 2020 14:29:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E1B6AB8F;
 Tue, 20 Oct 2020 14:29:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsdL-0003Tb-Tl
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:29:03 +0000
X-Inumbo-ID: e9a9a76a-ef6e-4835-bdc5-abc1f6d6603d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e9a9a76a-ef6e-4835-bdc5-abc1f6d6603d;
	Tue, 20 Oct 2020 14:29:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603204142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tGrb4u8FwGicwu2LfELLCD03J3dVGpcxqGyc+0ewGWw=;
	b=H/9ygFZohciQ8nMONaUKItTlsUVhPsWnklY/14C5GLyIeNTeBBQNzEEUktj8pKYQbuh2Hv
	Mc+7KrAGZnBnsDcBXLPtI7EorhWjaTmBFZG58r/5iZdSihxoFQOYmsjVc4nySyO05rPECC
	BKrbXPFPTUEDYv+OnlOqiVoxTzoaXD4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0E1B6AB8F;
	Tue, 20 Oct 2020 14:29:02 +0000 (UTC)
Subject: Re: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
 <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
 <58e33283-a883-3bde-c697-8605586abace@suse.com>
Message-ID: <48c0a58b-9a3c-d180-386c-7166986dd307@suse.com>
Date: Tue, 20 Oct 2020 16:29:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <58e33283-a883-3bde-c697-8605586abace@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.05.2020 12:30, Jan Beulich wrote:
> On 29.05.2020 12:07, Andrew Cooper wrote:
>> On 29/05/2020 10:34, Jan Beulich wrote:
>>> While the behavior to ignore this option without FLASK support was
>>> properly documented, it is still somewhat surprising to someone using
>>> this option and then still _not_ getting the assumed security. Add a
>>> 2nd handler for the command line option for the XSM_FLASK=n case, and
>>> invoke panic() when the option is specified (and not subsequently
>>> overridden by "flask=disabled").
>>>
>>> Suggested-by: Ian Jackson <ian.jackson@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'm very tempted to nack this outright, lest I remind both of you of the
>> total disaster that was XSA-9, and the subsequent retraction of the code
>> which did exactly this.
>>
>> If you want to do something like this, prohibit creating guests so the
>> administrator can still log in and unbreak,
> 
> Unbreaking is as easy as removing the command line option, or
> adding "flask=disable" at the end of the command line.
> 
> Preventing to create guests is another option, but complicated
> by the late-hwdom feature we still have - to achieve what you
> want we'd have to permit creating that one further domain.
> Dom0less perhaps also would need special treatment (and there
> I'm not sure we'd know which of the domains we are supposed to
> allow being created, and which one(s) not).

Furthermore the policy that would normally be loaded might
constrain Dom0 itself as well. Allowing Dom0 to boot is therefore
not necessarily the right thing to do. Therefore, while overall I
agree that generalizing x86's "allow_unsafe" may be a helpful
thing to do, it's not what I would want to use here. Instead,
together with ...

>> instead of having it
>> entering a reboot loop with no output.  The console isn't established
>> this early, so none of this text makes it out onto VGA/serial.
> 
> You didn't look at the patch then: I'm intentionally _not_
> panic()-ing from the command line parsing function, but from
> an initcall. Both VGA and serial have been set up by that time.
> (I was in fact considering to pull it a little earlier, into
> a pre-SMP initcall.)

... this, I think the patch wants to be re-considered as is.

Jan

