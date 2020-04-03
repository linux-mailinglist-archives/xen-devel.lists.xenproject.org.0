Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC119D198
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 10:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKHFY-0005Eu-Dk; Fri, 03 Apr 2020 08:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKHFW-0005Ep-VH
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 08:00:22 +0000
X-Inumbo-ID: 2abe0b10-7581-11ea-bcc1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2abe0b10-7581-11ea-bcc1-12813bfff9fa;
 Fri, 03 Apr 2020 08:00:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7702AE83;
 Fri,  3 Apr 2020 08:00:20 +0000 (UTC)
Subject: Re: [PATCH v5 10/10] x86emul: support MCOMMIT
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <e41a2f72-ede5-adec-dc82-65b76368b7f7@suse.com>
 <574bab09-a29e-d77e-96e0-06e57ff524ee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71d182e8-983c-9fa6-3403-ee3212c70c50@suse.com>
Date: Fri, 3 Apr 2020 10:00:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <574bab09-a29e-d77e-96e0-06e57ff524ee@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 01:47, Andrew Cooper wrote:
> On 24/03/2020 12:37, Jan Beulich wrote:
>> The dependency on a new EFER bit implies that we need to set that bit
>> ourselves in order to be able to successfully invoke the insn.
>>
>> Also once again introduce the SVM related constants at this occasion.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: The exact meaning of the PM stating "any errors encountered by
>>      those stores have been signaled to associated error logging
>>      resources" is unclear. Depending on what this entails, blindly
>>      enabling EFER.MCOMMIT may not be a good idea. Hence the RFC.
> 
> Not just that.  Its not safe for Xen to ever execute MCOMMIT for
> emulation purposes.

I.e. you're suggesting we mustn't even try to emulate it?

> From what I can glean from the documentation, it is intended for
> non-volatile RAM, but I can't find anything discussing the error handling.
> 
> The fact the instruction can be intercepted in the first place hopefully
> means that there must be something Xen can look at to get the real error
> indicator.  However, the suggestion is that this will all be platform
> specific.
> 
> 
> The emulation problem comes from the fact that if Xen has any pending
> writes to to NVRAM as part of the emulation path (or an interrupt for
> that matter), an error intended for Xen would leak into guest context.

I'm afraid all of this is guesswork until it becomes clear how
exactly this error reporting is intended to work.

Jan

