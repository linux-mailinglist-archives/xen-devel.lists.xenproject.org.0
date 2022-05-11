Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE252311C
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 13:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326704.549301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokAY-0001Ei-LX; Wed, 11 May 2022 11:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326704.549301; Wed, 11 May 2022 11:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokAY-0001Bi-If; Wed, 11 May 2022 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 326704;
 Wed, 11 May 2022 11:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ssr4=VT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nokAX-0001Bc-Jr
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 11:06:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cfa09c0-d11a-11ec-a406-831a346695d4;
 Wed, 11 May 2022 13:06:12 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1652267167835177.85639750326493;
 Wed, 11 May 2022 04:06:07 -0700 (PDT)
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
X-Inumbo-ID: 5cfa09c0-d11a-11ec-a406-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1652267168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jqgIHLUDhkjHEbDGN56CG/foHg07cjKNEQZhC8OzOu+/nNSzPqMq0CU92VUFeD2mftzhLj7iYjQlOnUF3q74a1oYo/719AsOzRhMAG7LKh84ovReIQ+ItTauACWmI26BsyjiOZoq8ZFfVjEeF9cCBEwfN/3JL8WvULnjZdF9zmg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1652267168; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gTL+o8aNyNcXOAKDASLTIDGIYEIU0NEfdsDtKkGnT+U=; 
	b=XWkulCxaPfh5o6/DSkZuk+XsM4OALhr5Mofko6yOdyMi1cn+eIIGaaieHWEyYYdlgyJd0i6KX9w3SYl5xZLZleV0ouIoWWLojAqBWNkKYmHHutXQmqJ/sqKWyxlnv5SXpJFeuqFhe9CPPRluIX/DihwIhKfmJoijmfvznWvy9XA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652267168;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gTL+o8aNyNcXOAKDASLTIDGIYEIU0NEfdsDtKkGnT+U=;
	b=JpCras6R8ZDNBj5+EqFLo/uEP81ugHbCrhOQmuLGsTYUljiG/FE1ogdofrA8GAmq
	tIkN40ZV4tuDS4r6R/6FSpfl37GFROR9nv/DAZwXzGZzbgSk8/9VLTjJ+FyqR1J/IlR
	JN8fNiLNIT1h+sHbTW59zTPigJtbzjNIcmIW82eE=
Message-ID: <97fc4e45-ebd5-d686-a3d0-01d0d524659c@apertussolutions.com>
Date: Wed, 11 May 2022 07:05:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Scott Davis <scott.davis@starlab.io>, "jandryuk@gmail.com"
 <jandryuk@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-2-dpsmith@apertussolutions.com>
 <08C4B263-D905-42A2-BBFF-75D7F78E20A1@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <08C4B263-D905-42A2-BBFF-75D7F78E20A1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/3/22 09:17, Luca Fancellu wrote:
> Hi Daniel,
> 
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 0bf63ffa84..b93101191e 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -186,6 +186,28 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>     return 0;
>> }
>>
>> +static int cf_check flask_set_system_active(void)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    ASSERT(d->is_privileged);
>> +
>> +    if ( d->domain_id != DOMID_IDLE )
>> +    {
>> +        printk("xsm_set_system_active should only be called by idle domain\n");
> 
> Sorry I spotted that now, here in the printk probably you mean “flask_set_system_active”
> instead of “xsm_set_system_active”, you can keep my R-by after this change.

That was intentional as that was the hook it came in as, but after you
pointed it out I realized this may cause confusion since the default
policy function name is the same as the hook. Though changing it I would
do as Julien suggested and use __func__.

v/r,
dps

