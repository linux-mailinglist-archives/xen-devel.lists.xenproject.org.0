Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A04672DFDC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548078.855849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91S3-0002N7-LJ; Tue, 13 Jun 2023 10:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548078.855849; Tue, 13 Jun 2023 10:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91S3-0002LQ-HQ; Tue, 13 Jun 2023 10:40:39 +0000
Received: by outflank-mailman (input) for mailman id 548078;
 Tue, 13 Jun 2023 10:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmyJ=CB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q91S2-0002LK-18
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:40:38 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b962abd1-09d6-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:40:35 +0200 (CEST)
Received: from [10.10.1.82] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1686652818704537.0908992853477;
 Tue, 13 Jun 2023 03:40:18 -0700 (PDT)
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
X-Inumbo-ID: b962abd1-09d6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686652825; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GUXR02iJIgRWsCWCxVgIMW1UZCEguvM9IAJNc3UIx0KnBLOiWCynFVmdu7cUOoG0GExQ8xkh9YfuxxvnOOR7Y9w35r8zPaJMmFRRK0td/pbBSzCC83WRdjTkG8Y9m863ls1tBiiKpOZmuV7oeEjqg69ZcxN0KVmUJVHaKamCNxE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1686652825; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=C2s/VgZHS8sWtvgrusTBkAOg6G3bNzV1aLf9P2Gdn/w=; 
	b=CbvsyclMyj+AlKO3Shoa7ljYfeW+v4jLa1Gp074BJOqnvRotCYRiGCHPisySQhGZ2NUX1hwcPyFPjKNU8xxLYttfzopNFR2VBhrRvWmnUPc3DyKDV77u1u73e+YMRzt1Y5pM7s9n4a9qeIpmfWje8z6/4e8sSUyej/513mQPNcQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686652825;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=C2s/VgZHS8sWtvgrusTBkAOg6G3bNzV1aLf9P2Gdn/w=;
	b=Z+YOQ2ITsvUdvuQ3ZesEhcHGFDh9J+g2R0PBhx3TMNv7PJZjHpOX1e8XS6oCrxON
	zQhGZncpWJnu5wVE3OcHscRcvtj4fnpx0l8sHn/UtD9wMxZTzfYJ8l/oBHkDvTcVThf
	XxHaXSTAsWomFtwZypi+EsCIju68X1Lho5nCxhao=
Message-ID: <6549f13a-c905-1791-c508-ac2c0128bf78@apertussolutions.com>
Date: Tue, 13 Jun 2023 06:40:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
 <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
 <a3c7752e-cd99-d90b-376d-bbc60cf4a967@apertussolutions.com>
 <10f2d41f-b34f-207e-eb73-d53f31385d8e@suse.com>
 <70622b39-cf85-49f4-69a7-b8039baa07f4@apertussolutions.com>
 <f00fde6f-4dcb-45a3-5b6d-5f1704ecacbc@suse.com>
 <f5315788-a8c4-e92b-de7b-7eb9f3c0753b@apertussolutions.com>
 <ec8776dd-9a3d-7529-2614-754ed2879e55@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ec8776dd-9a3d-7529-2614-754ed2879e55@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 6/13/23 06:15, Jan Beulich wrote:
> On 13.06.2023 11:57, Daniel P. Smith wrote:
>> On 6/13/23 05:40, Jan Beulich wrote:
>>> On 13.06.2023 11:21, Daniel P. Smith wrote:
>>>> On 6/13/23 02:33, Jan Beulich wrote:
>>>>> On 12.06.2023 22:21, Daniel P. Smith wrote:
>>>>>> On 6/12/23 15:44, Daniel P. Smith wrote:
>>>>>>> On 6/12/23 07:46, Jan Beulich wrote:
>>>>>>>> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
>>>>>>>> if the 1st yielded ENOSYS?
>>>>>>>
>>>>>>> Would you be okay with the calls staying if instead on the first
>>>>>>> invocation of any libxl_flask_* method, flask status was checked and
>>>>>>> stored in a variable that would then be checked by any subsequent calls
>>>>>>> and immediately returned if flask was not enabled?
>>>>>
>>>>> I'm wary of global variables in shared libraries.
>>>>>
>>>>
>>>> I agree with that sentiment, but I would distinguish global state from a
>>>> global variable. I would take the approach of,
>>>>
>>>> static boot is_flask_enabled(void)
>>>> {
>>>>        /* 0 unchecked, 1 checked but disabled, 2 enabled */
>>>>        static int state = 0;
>>>>
>>>>        if ( state == 0 )
>>>> 	state = check_flask_state(); /* pseudo call for real logic */
>>>>
>>>>        return (state < 2 ? false : true);
>>>> }
>>>>
>>>> Then all the libxl_flask_* methods would is_flask_enabled(). This would
>>>> not expose a global variable that could be manipulated by users of the
>>>> library.
>>>
>>> Well, I certainly did assume the variable wouldn't be widely exposed.
>>> And the library also clearly is far from free of r/w data. But still.
>>>
>>> That aspect aside - wouldn't such a basic state determination better
>>> belong in libxc then? (There's far less contents in .data / .bss
>>> there.)
>>
>> Not opposed at all, so a series with a patch to libxc paired and a new
>> sub-op/sysctl as discussed below would be acceptable?
> 
> I can only say yes here for the hypervisor side; I'm not a maintainer
> of any significant part of the tool stack.
> 

Understood, thank you.

>>>>> Since in the specific case here it looks like the intention really is
>>>>> to carry out Flask-specific operations, a means to check for Flask
>>>>> specifically might indeed be appropriate. If not a new sub-op of
>>>>> xsm_op, a new sysctl might be another option.
>>>>
>>>> I am actually split on whether this should be an sub-op of xsm op or if
>>>> this should be exposed via hyperfs. I did not consider a sysctl, though
>>>> I guess an argument could be constructed for it.
>>>
>>> Please don't forget that hypfs, unlike sysctl, is an optional thing,
>>> so you can't use it for decision taking (but only for informational
>>> purposes).
>>
>> Good point regarding hypfs, the check mentioned above is expected to
>> always work, thus an optional feature probably is not best.
>>
>> The next question is, should it be sysctl or xsm-op. I am leaning
>> towards xsm-op because as much as I believe XSM should be consider core
>> to Xen, the XSM logic should remain contained. Adding it to sysctl would
>> mean having to expose XSM state outside of XSM code and would make
>> sysctl logic have to be aware of XSM state query functions.
> 
> Well, you seemed hesitant towards an xsm-sub-op, so I suggested sysctl
> as a possible alternative. One possible issue with an xsm-op is that at
> the public interface level (public headers), besides __HYPERVISOR_xsm_op
> there's no notion of xsm-op. And it was pointed out before that by kind
> of blindly wiring xsm_op through to flask_op, adding XSM-module-
> independent ops and/or ops for some future non-Flask module is going to
> be a little, well, bumpy.

That is in fact the source of my hesitance. Fixing xsm sub-op from being 
a flask specific, not well documented thing, to a documented general 
interface is on the list of many improvements needed. I believe handling 
this case could be done as an incremental step towards that by 
introducing a common sub-op structure that is used for the "get current 
module" sub-op since it will be new sub-op for FLASK module as well. As 
you mentioned, the next step will be the bumpy one of trying to convert 
the existing FLASK xsm-op sub-ops over to the new common structure. 
Until I try, I won't know for sure if I can do this as a small step. Let 
me see if I can carve out some time and give it a try.

v/r,
dps

