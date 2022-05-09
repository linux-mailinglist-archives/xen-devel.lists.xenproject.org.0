Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC30A520490
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 20:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324748.546941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8Co-00087K-ND; Mon, 09 May 2022 18:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324748.546941; Mon, 09 May 2022 18:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no8Co-00084T-K2; Mon, 09 May 2022 18:34:02 +0000
Received: by outflank-mailman (input) for mailman id 324748;
 Mon, 09 May 2022 18:34:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1no8Cn-00084N-9I
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 18:34:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no8Cj-0003Lc-J7; Mon, 09 May 2022 18:33:57 +0000
Received: from [54.239.6.187] (helo=[192.168.22.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1no8Cj-0006K4-B5; Mon, 09 May 2022 18:33:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=rLTSljuycOZML5T9a6BEbJXuZn4e4N2aaJvj3LctdeY=; b=L3hnZM6QDWXBvb0Pns8PMSABD+
	mukios6hy/QKkc4EXyCWRlXI55PlwO6ZY2oZTN7MTFnbioSKw63XobDMo+U6jvFA/AXpnU7quayHE
	eP1LWWrkUjeLwum+6eaUsWkl3Oaso50iBnX/m2JAZkF7ISwVleEioIgBrLo0zHYTOdsw=;
Message-ID: <d97053e6-678f-e356-840f-e70c85b007bd@xen.org>
Date: Mon, 9 May 2022 19:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <08C4B263-D905-42A2-BBFF-75D7F78E20A1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/05/2022 14:17, Luca Fancellu wrote:
>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index 0bf63ffa84..b93101191e 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -186,6 +186,28 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>      return 0;
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

I tend to use "%s: ...", __func__ so the name always name the function.

Cheers,

-- 
Julien Grall

