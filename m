Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4A2FC86B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 04:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71212.127366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l23oC-0003qP-IR; Wed, 20 Jan 2021 03:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71212.127366; Wed, 20 Jan 2021 03:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l23oC-0003q0-El; Wed, 20 Jan 2021 03:05:24 +0000
Received: by outflank-mailman (input) for mailman id 71212;
 Wed, 20 Jan 2021 03:05:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wA1v=GX=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1l23oB-0003pv-84
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 03:05:23 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4632536c-686d-4299-92fb-a24fa583ab4c;
 Wed, 20 Jan 2021 03:05:22 +0000 (UTC)
Received: from [10.10.1.167] (c-73-129-147-140.hsd1.md.comcast.net
 [73.129.147.140]) by mx.zohomail.com
 with SMTPS id 1611111918200969.7529743001716;
 Tue, 19 Jan 2021 19:05:18 -0800 (PST)
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
X-Inumbo-ID: 4632536c-686d-4299-92fb-a24fa583ab4c
ARC-Seal: i=1; a=rsa-sha256; t=1611111920; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AXl8Hr1q4SR6eXsmETUcDXH2v9LnxcqgcPU/h/NS3VEL/CGMhWut7bcd91NLgljSBU+2yF/XNvtYIns8Az7+x9uRkGc7QGLM9k8boRWon5tUXUdeO4n4n1/KtXhyPjitB9nx71K7QQWs66FyjGfHu1HsIHGQ/8zSoz5sH609fF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1611111920; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=L3frx8YIAmkkKTT6OuJKwK5YzDJJEpCMkz1Wy9hPbc8=; 
	b=BHcWht5w/73GuLLFV/RLuXZ5xJAOplSLylXj+f+eGBEN/mWUzKKdwjswGUoxkcyJvwEJd96AQc80ZWQCeETv4cVZIfVJxytB+bbu+B3HB7owrZZyZ4t3XiWnj11y7CobUYk+R3FKHNNFBkCCwCLGlWja1kPxCivu/tycoHX1WX8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1611111920;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=L3frx8YIAmkkKTT6OuJKwK5YzDJJEpCMkz1Wy9hPbc8=;
	b=e4JUcxSSq25tmsecAO0E9bn/z5uemYmyLHeYYAxM50qz9bVYaAH1NTSprs2vKRVT
	I7F3+qw+3ydlWbrTCDQvr6UH/sd9EZ4bVbDFXwtKS4tvD4hbS5HecEjyNmu8MozUi3g
	lUxPR6482SD1k7Tyb1rknwVcP07fhY1+2b30VC60=
Subject: Re: [PATCH] xen/xsm: Improve alloc/free of evtchn buckets
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210118150623.29550-1-andrew.cooper3@citrix.com>
 <21a82f0c-2267-0891-0f4a-0fdd9feec42c@suse.com>
 <e584b28d-a438-fd1d-d908-3b70ffab9309@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <796033c5-4991-cfa8-4bea-b5df7c2f91f7@apertussolutions.com>
Date: Tue, 19 Jan 2021 22:04:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e584b28d-a438-fd1d-d908-3b70ffab9309@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 1/18/21 11:21 AM, Andrew Cooper wrote:
> On 18/01/2021 15:31, Jan Beulich wrote:
>> On 18.01.2021 16:06, Andrew Cooper wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -147,6 +147,14 @@ static bool virq_is_global(unsigned int virq)
>>>       return true;
>>>   }
>>>  =20
>>> +static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket=
)
>>> +{
>>> +    if ( !bucket )
>>> +        return;
>> You could avoid this since flask_free_security_evtchns() has
>> a similar check. Alternatively it could be dropped from there.
>=20
> I considered altering both.=C2=A0 However, all functions like this really
> should be idempotent.
>=20
> For this case, the compiler can drop the check from both callsites, and
> its safer if the structure of the callers change in the future.
>=20
>> But even if you want to keep the duplication
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Thanks.

You can add,
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>>
>> One further aspect to consider though:
>>
>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>> @@ -309,12 +309,12 @@ static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAUL=
T_ARG struct domain *d1, struct
>>>       return xsm_default_action(action, d1, d2);
>>>   }
>>>  =20
>>> -static XSM_INLINE int xsm_alloc_security_evtchn(struct evtchn *chn)
>>> +static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn *chn, u=
nsigned int nr)
>> I wonder whether we wouldn't better identify the difference
>> between pointer (to individual element) and array by writing
>> this (and others below) as
>>
>> static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn chn[], un=
signed int nr)
>=20
> In which case want we want is (unsigned int nr, struct evtchn chn[nr])
> which I think is the C99 way of writing this to help static analysis.

Would it be better to switch this to the (unsigned int nr, struct evtchn=20
chn[nr]) you suggested now or wait to make the change uniform? IMHO it=20
is probably better for the sake of existing consistency to keep what you=20
have here, with the understanding that this might get redone as part of=20
a larger function semantic change.

>>
>> I think we've done so in a few places already, but of course it
>> would be a long way to get the entire code base consistent in
>> this regard. Plus of course while this works fine in function
>> declarations / definitions, it won't be possible to use for
>> struct / union fields.
>>
>> Also it looks like this and further lines have become overly long.
>=20
> Everything is long lines in this area of code.=C2=A0 Its all due an overh=
aul.
>=20
> ~Andrew
>=20


