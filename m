Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D4402A57
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:03:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181090.328082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbgN-0001hi-U5; Tue, 07 Sep 2021 14:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181090.328082; Tue, 07 Sep 2021 14:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbgN-0001ed-Qu; Tue, 07 Sep 2021 14:02:39 +0000
Received: by outflank-mailman (input) for mailman id 181090;
 Tue, 07 Sep 2021 14:02:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNbgL-0001eX-JK
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:02:37 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4021a5a9-0fe4-11ec-b0f5-12813bfff9fa;
 Tue, 07 Sep 2021 14:02:36 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631023350916797.7635160563889;
 Tue, 7 Sep 2021 07:02:30 -0700 (PDT)
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
X-Inumbo-ID: 4021a5a9-0fe4-11ec-b0f5-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631023353; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=guLKaRb7pEXs6IvRpXDUHthw78iVpWi9KMcWoCdAQtd0K27y9wSn2xwU+YtwYdaJYxegxbBaGtEuE8maOgIb9eF+CYzrKH5tF8czrIV74mNx7vYAiBl7rmLhES6XFlJuqRJHifsPcPFIK+PPrpb1WT4OequkCIf/oQvq/OpnJk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631023353; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9gom1ql8ae5NoV/h/dFHGpp6IOjAPFwXRoaCwPNyKHY=; 
	b=Ryir5TWDAdMIW6Hed3D6Tto3pPa2caSMeEuNlyhUgH/sUpM9RZnIAMUmY3e9DZbFTpYk6acRzQN5gWNJe0LgnIvlBmQO9bbmdj+w160fyFnbIrGaqflU9Mc9DMCF4/w8FG5TABY3/rnBRdLCAkwX1OqjeYkgrWuix3ycbjRMxA4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631023353;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9gom1ql8ae5NoV/h/dFHGpp6IOjAPFwXRoaCwPNyKHY=;
	b=SEcyi00ox7hQx1Q6b539rpNUYrC+0QIR9R324xlHYNdvffgW7J0Wdc3UYXptjHlh
	fhGe+Jx8+rpkcptvj+N3vm/wCbf9kqkxo4+xz3zzuJNmLKBn5ZkBBFr6KBnteuW99Gj
	cWGu0dD26swHy4U0OnKa2aLoAlLbkBpyx2zZ006c=
Subject: Re: [PATCH v4 09/11] silo: remove circular xsm hook call
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-10-dpsmith@apertussolutions.com>
 <d415ab82-ca83-98e8-0b07-0e093a1fa7e1@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <997db7f6-266d-b488-4024-37d9adeb4ceb@apertussolutions.com>
Date: Tue, 7 Sep 2021 10:00:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d415ab82-ca83-98e8-0b07-0e093a1fa7e1@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/6/21 2:55 PM, Andrew Cooper wrote:
> On 03/09/2021 20:06, Daniel P. Smith wrote:
>> SILO implements a few XSM hooks to extended the decision logic beyond
>> what is defined in the dummy/default policy. For each of the hooks, it
>> falls back to the dummy/default policy. The fall back is done a slight
>> round-about way.
> 
> "done in a slightly" ?

Ack.

>>   This commit makes the direct call to the default policy's
>> logic, xsm_default_action().
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/xsm/silo.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
>> index 6db793f35c..56a330a831 100644
>> --- a/xen/xsm/silo.c
>> +++ b/xen/xsm/silo.c
>> @@ -17,6 +17,7 @@
>>    * You should have received a copy of the GNU General Public License along with
>>    * this program; If not, see <http://www.gnu.org/licenses/>.
>>    */
>> +#include <xsm/xsm-core.h>
>>   #include <xsm/dummy.h>
>>   
>>   /*
>> @@ -43,7 +44,7 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
>>       else
>>       {
>>           if ( silo_mode_dom_check(d1, d2) )
>> -            rc = xsm_evtchn_unbound(d1, chn, id2);
>> +            rc = xsm_default_action(XSM_TARGET, current->domain, d1);
>>           rcu_unlock_domain(d2);
>>       }
>>   
>> @@ -54,7 +55,7 @@ static int silo_evtchn_interdomain(struct domain *d1, struct evtchn *chan1,
>>                                      struct domain *d2, struct evtchn *chan2)
>>   {
>>       if ( silo_mode_dom_check(d1, d2) )
>> -        return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
>> +        return xsm_default_action(XSM_HOOK, d1, d2);
>>       return -EPERM;
>>   }
>>   
>> @@ -62,21 +63,21 @@ static int silo_grant_mapref(struct domain *d1, struct domain *d2,
>>                                uint32_t flags)
>>   {
>>       if ( silo_mode_dom_check(d1, d2) )
>> -        return xsm_grant_mapref(d1, d2, flags);
>> +        return xsm_default_action(XSM_HOOK, d1, d2);
>>       return -EPERM;
>>   }
>>   
>>   static int silo_grant_transfer(struct domain *d1, struct domain *d2)
>>   {
>>       if ( silo_mode_dom_check(d1, d2) )
>> -        return xsm_grant_transfer(d1, d2);
>> +        return xsm_default_action(XSM_HOOK, d1, d2);
>>       return -EPERM;
>>   }
>>   
>>   static int silo_grant_copy(struct domain *d1, struct domain *d2)
>>   {
>>       if ( silo_mode_dom_check(d1, d2) )
>> -        return xsm_grant_copy(d1, d2);
>> +        return xsm_default_action(XSM_HOOK, d1, d2);
>>       return -EPERM;
>>   }
>>   
>> @@ -86,14 +87,14 @@ static int silo_argo_register_single_source(const struct domain *d1,
>>                                               const struct domain *d2)
>>   {
>>       if ( silo_mode_dom_check(d1, d2) )
>> -        return xsm_argo_register_single_source(d1, d2);
>> +        return 0;
>>       return -EPERM;
>>   }
>>   
>>   static int silo_argo_send(const struct domain *d1, const struct domain *d2)
>>   {
>>       if ( silo_mode_dom_check(d1, d2) )
>> -        return xsm_argo_send(d1, d2);
>> +        return 0;
> 
> Shouldn't these be XSM_HOOK too?  Or should all other XSM_HOOK's be
> short-circuted to 0?
> 
> The asymmetry here seems weird.

It makes more sense when you follow the approach, which was to duplicate 
the body of the dummy hook instead of making a call to the hook which 
would then call the function pointer to the dummy hook. The definition 
for the argo dummy hooks is to return 0. In the future these other calls 
may well have XSM_HOOk replaced with the proper role expected. Since all 
argo checks just return 0, this reflects there is no logic rules in 
xsm_default_action to determine argo accesses. Of course this is on my 
list todo and when the dummy hook is fixed, these would be synchronized.
With that said, converting over to XSM_HOOK does provide the equivalent 
and would provide consistency within the context of this file. Basically 
a long winded way of saying, ack.

v/r,
dps



