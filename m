Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6123A3AD097
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144881.266614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHVo-0008GW-HO; Fri, 18 Jun 2021 16:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144881.266614; Fri, 18 Jun 2021 16:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHVo-0008E3-Cx; Fri, 18 Jun 2021 16:38:32 +0000
Received: by outflank-mailman (input) for mailman id 144881;
 Fri, 18 Jun 2021 16:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luHVn-0008Dv-Mn
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:38:31 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3cffec1-4cf8-4843-ad1f-63c6600a1285;
 Fri, 18 Jun 2021 16:38:30 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624034221232839.5733958860641;
 Fri, 18 Jun 2021 09:37:01 -0700 (PDT)
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
X-Inumbo-ID: b3cffec1-4cf8-4843-ad1f-63c6600a1285
ARC-Seal: i=1; a=rsa-sha256; t=1624034223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HXK2h/vHO++iqp8YBYGlicqV1WC3M3K552YSTsSOwaydlmoypxXLGS2QTfCZfJNobbVbM/82FUSmMvuN/eNS+vANcip4dVpEe9XQzsFJVEwDsQ4fqy6m39o8I6WTwS+eR0zxKHXjmM02AlrWVHYFICsasWNroPmHSC27PpRJCEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624034223; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fwD4j2C0XcqU9HM5vAwXuMOllkmXuq+LYI6CbhHLhMc=; 
	b=YnYNUqng8458qQdgPlM0cfXEb7j1ss5yQl/0yBBbX07kHv4RA8diF2a7Fe5sWiCzynTq9dep4AKMkidj/w8VdNhxIAHl/SNBNcvf/SEcNyHu8VHs3c3UgbOMU9p5QQmeNiq4Bn73VVhDuYg2isyEozcipyq7DzD8GEljD9hhQZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624034223;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fwD4j2C0XcqU9HM5vAwXuMOllkmXuq+LYI6CbhHLhMc=;
	b=hkJIKQv8QCOz97uGTEz0NQn00sFnjL6N+H3Ws+uOjV1aut/eyMA07rxyKqf4Fx1u
	x09bK3cM38fyPiJicaxaxwuggUvPvnhIAG7U3sg2y0NjtZvk4G8EW/InWno278BjpAP
	adnD8u4sBr+I5o9p1En+bY6qbtJJdj64BC8B0gvs=
Subject: Re: [PATCH 5/6] xsm: expanding function related macros in dummy.h
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Juergen Gross <jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-6-dpsmith@apertussolutions.com>
 <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <5f2e34ac-e611-26b8-81b2-a63bc7bfc197@apertussolutions.com>
Date: Fri, 18 Jun 2021 12:36:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 8:03 AM, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
>> index 7e2bb09dac..0f8ea163af 100644
>> --- a/xen/xsm/dummy.h
>> +++ b/xen/xsm/dummy.h
>> @@ -9,7 +9,7 @@
>>   *
>>   *
>>   *  Each XSM hook implementing an access check should have its first parameter
>> - *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
>> + *  preceded by (or use XSM_DEFAULT_VOID if it has no
>>   *  arguments). The first non-declaration statement shold be XSM_ASSERT_ACTION
>>   *  with the expected type of the hook, which will either define or check the
>>   *  value of action.
>> @@ -47,14 +47,12 @@ void __xsm_action_mismatch_detected(void);
>>   * xsm_default_t argument available, so the value from the assertion is used to
>>   * initialize the variable.
>>   */
>> -#define XSM_INLINE __maybe_unused
> 
> Nothing in a header file should ever need __maybe_unused.  Now that the
> !XSM case has been untangled, I think this can be dropped, rather than
> expanded inline.

ack

>> -
>> -#define XSM_DEFAULT_ARG /* */
>>  #define XSM_DEFAULT_VOID void
> 
> XSM_DEFAULT_VOID needs to disappear too.  I can't see what it is even
> doing before the cleanup, because if it is missing, you'll fail the
> compile for using K&R style functions.

ack, will drop

v/r,
dps


