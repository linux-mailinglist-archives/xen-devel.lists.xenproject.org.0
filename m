Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7723372DD91
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547918.855568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90DV-0003Zw-0r; Tue, 13 Jun 2023 09:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547918.855568; Tue, 13 Jun 2023 09:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90DU-0003XW-U4; Tue, 13 Jun 2023 09:21:32 +0000
Received: by outflank-mailman (input) for mailman id 547918;
 Tue, 13 Jun 2023 09:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmyJ=CB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q90DT-0003XQ-Un
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:21:31 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf2bc04-09cb-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 11:21:27 +0200 (CEST)
Received: from [10.10.1.82] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1686648081516674.3641276495971;
 Tue, 13 Jun 2023 02:21:21 -0700 (PDT)
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
X-Inumbo-ID: abf2bc04-09cb-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686648083; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AqlZ2Q5WcaqUgPKNneglOOrnGXcprpHmQACMne2W9F1nL2s4EudLphr+xoHy3jh7zqLyaDZuRPcrKKHXZvJzK9jhGHe28lqYw0WE47YBwDgqy1eeQiqSze5RvEahjtyVMvt7kC+yvRZ9620DAkyvg/Wa7oDmH1T5be1RNmHU6bc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1686648083; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=CweT3I7UqT+XzBLwuOD1Q2n/WYxcdW+nDoO6dCHuOm0=; 
	b=ajxf6irlARZRk8SnUs70ABGJoWTwimM80ca/DZTqZrBSl1vlEY95KzZXThIRPXcsq6N/Hx46OI9gOwpE+h7s6PsptjZj6jjBaex+AuxRwy1UL6asdemUACLf1jdZOHLbPmLS3SsU5r9xjct4n3vZue+I+vvwnzVFtNVIMPJmxhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686648083;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CweT3I7UqT+XzBLwuOD1Q2n/WYxcdW+nDoO6dCHuOm0=;
	b=KePU+fU45/b+HN0dVkFVnLqAiWtkmBgOi71ucynAs0k7s8s6DZVZL1+l9AyQx36x
	J7W4inasJH9A9zBPPp72SaAvS34TT10enYhpJ27UWMIuL6dziw3gNINhyDyWR7cNimC
	I7cYWJnUc+kyZtwq9C/wj53WSdD5Ai0exnzypGzA=
Message-ID: <70622b39-cf85-49f4-69a7-b8039baa07f4@apertussolutions.com>
Date: Tue, 13 Jun 2023 05:21:18 -0400
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
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <10f2d41f-b34f-207e-eb73-d53f31385d8e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 6/13/23 02:33, Jan Beulich wrote:
> On 12.06.2023 22:21, Daniel P. Smith wrote:
>>
>>
>> On 6/12/23 15:44, Daniel P. Smith wrote:
>>> On 6/12/23 07:46, Jan Beulich wrote:
>>>> The variable needs to be properly set only on the error paths.
>>>>
>>>> Coverity ID: 1532311
>>>> Fixes: ab4440112bec ("xl / libxl: push parsing of SSID and CPU pool ID
>>>> down to libxl")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>
> 
> Thanks.
> 

My pleasure.

>>>> ---
>>>> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
>>>> if the 1st yielded ENOSYS?
>>>
>>> Would you be okay with the calls staying if instead on the first
>>> invocation of any libxl_flask_* method, flask status was checked and
>>> stored in a variable that would then be checked by any subsequent calls
>>> and immediately returned if flask was not enabled?
> 
> I'm wary of global variables in shared libraries.
> 

I agree with that sentiment, but I would distinguish global state from a 
global variable. I would take the approach of,

static boot is_flask_enabled(void)
{
     /* 0 unchecked, 1 checked but disabled, 2 enabled */
     static int state = 0;

     if ( state == 0 )
	state = check_flask_state(); /* pseudo call for real logic */

     return (state < 2 ? false : true);
}

Then all the libxl_flask_* methods would is_flask_enabled(). This would 
not expose a global variable that could be manipulated by users of the 
library.


>> Looking closer I realized there is a slight flaw in the logic here. The
>> first call is accomplished via an xsm_op call and then assumes that
>> FLASK is the only XSM that has implemented the xsm hook, xsm_op, and
>> that the result will be an ENOSYS. If someone decides to implement an
>> xsm_op hook for any of the existing XSM modules or introduces a new XSM
>> module that has an xsm_op hook, the return likely would not be ENOSYS. I
>> have often debated if there should be a way to query which XSM module
>> was loaded for instances just like this. The question is what mechanism
>> would be best to do so.
> 
> Well, this is what results from abusing ENOSYS. The default case of a
> switch() in a handler shouldn't return that value. Only if the entire
> hypercall is outright unimplemented, returning ENOSYS is appropriate.
> In fact I wonder whether dummy.h's xsm_do_xsm_op() is validly doing so,
> when that function also serves as the fallback for XSM modules
> choosing to not implement any of the op-s (like SILO does).

I understand your point, but if ENOSYS (Not Implemented) is not correct, 
what is the appropriate return value for this module does not support 
this op?

> Since in the specific case here it looks like the intention really is
> to carry out Flask-specific operations, a means to check for Flask
> specifically might indeed be appropriate. If not a new sub-op of
> xsm_op, a new sysctl might be another option.

I am actually split on whether this should be an sub-op of xsm op or if 
this should be exposed via hyperfs. I did not consider a sysctl, though 
I guess an argument could be constructed for it.

v/r,
dps


