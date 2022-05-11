Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A02B52311E
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 13:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326708.549312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokBA-0001jB-0V; Wed, 11 May 2022 11:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326708.549312; Wed, 11 May 2022 11:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokB9-0001g3-TD; Wed, 11 May 2022 11:06:51 +0000
Received: by outflank-mailman (input) for mailman id 326708;
 Wed, 11 May 2022 11:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ssr4=VT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nokB8-0001Bc-Aa
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 11:06:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73972aab-d11a-11ec-a406-831a346695d4;
 Wed, 11 May 2022 13:06:49 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1652267204266268.65022183172607;
 Wed, 11 May 2022 04:06:44 -0700 (PDT)
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
X-Inumbo-ID: 73972aab-d11a-11ec-a406-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1652267206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lhb2nJ+kynrJR6BzzaA6jSc5Yoz7+1OTWG4TH1uSUcWP/6JlK5i7oXan4SnOK1TN6nXvGpEPjuoO9yiCN5YMWsPMnbXzJQ50XpOcOtTNh0/DtbSC0+3bz6K4P3buZGM4HaZSIXJ6sx59wpSRSMl69gka8hYOpYY99YvbX6A+lhQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1652267206; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9n/aS6rL2TlLAqR5rCBnVob92xkCeuTrUzwXok9Ctks=; 
	b=by+2gTOE1eg0PsTupT+jukoWl7HczTMyNFcOAJ1bch4CiyMXgr69XEjaPTHEXNb8zWJFDoA+cBQ7/Du1HFM/MPbrOOgwwUloVFrLxT/DHSmrJZPaLIiv91uwaVrFktgy9yApjMPzpXo8tdG4dXTkRfeiaRPGWHuiv1vBoNlQj94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652267206;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9n/aS6rL2TlLAqR5rCBnVob92xkCeuTrUzwXok9Ctks=;
	b=YrnYlOdqz1ZsE/0Tn/CjmhjFxZqSD3mmmikZ4xyyCI6EmwIDTm15+FzBakPpkNZ0
	yEkV8e21aR+A8DBIoyewBKsgys0bnJoJ911g+PzeiDAscQsSF3PTCnZO71XaB28Qlyw
	9pDj8uuuRfTTjKwXsWT2cbg0KOqcXLVIsv/rKqDw=
Message-ID: <bebe320d-17e1-1bba-1b2b-c595a4b770b6@apertussolutions.com>
Date: Wed, 11 May 2022 07:05:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Scott Davis <scott.davis@starlab.io>, "jandryuk@gmail.com"
 <jandryuk@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-2-dpsmith@apertussolutions.com>
 <08C4B263-D905-42A2-BBFF-75D7F78E20A1@arm.com>
 <d97053e6-678f-e356-840f-e70c85b007bd@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d97053e6-678f-e356-840f-e70c85b007bd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/9/22 14:33, Julien Grall wrote:
> 
> 
> On 03/05/2022 14:17, Luca Fancellu wrote:
>>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>>> index 0bf63ffa84..b93101191e 100644
>>> --- a/xen/xsm/flask/hooks.c
>>> +++ b/xen/xsm/flask/hooks.c
>>> @@ -186,6 +186,28 @@ static int cf_check
>>> flask_domain_alloc_security(struct domain *d)
>>>      return 0;
>>> }
>>>
>>> +static int cf_check flask_set_system_active(void)
>>> +{
>>> +    struct domain *d = current->domain;
>>> +
>>> +    ASSERT(d->is_privileged);
>>> +
>>> +    if ( d->domain_id != DOMID_IDLE )
>>> +    {
>>> +        printk("xsm_set_system_active should only be called by idle
>>> domain\n");
>>
>> Sorry I spotted that now, here in the printk probably you mean
>> “flask_set_system_active”
>> instead of “xsm_set_system_active”, you can keep my R-by after this
>> change.
> 
> I tend to use "%s: ...", __func__ so the name always name the function.

Ack.

v/r,
dps

