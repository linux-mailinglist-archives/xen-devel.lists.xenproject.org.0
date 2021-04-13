Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F74135DE38
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 14:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109718.209425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWHlr-0002FI-CD; Tue, 13 Apr 2021 12:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109718.209425; Tue, 13 Apr 2021 12:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWHlr-0002Et-91; Tue, 13 Apr 2021 12:03:55 +0000
Received: by outflank-mailman (input) for mailman id 109718;
 Tue, 13 Apr 2021 12:03:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWHlp-0002Ek-ID
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 12:03:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e81b8f6b-4a85-42af-b914-64040811778f;
 Tue, 13 Apr 2021 12:03:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0513AFAB;
 Tue, 13 Apr 2021 12:03:51 +0000 (UTC)
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
X-Inumbo-ID: e81b8f6b-4a85-42af-b914-64040811778f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618315432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATfV7p4h3W1F8WQ6C9MwBGR703K73Rquu1Z0XvzEGys=;
	b=qEY3jvgeEfEDRKA7VsxdJrjK4FrAE7Nm22owy6YbmuxDKeI+snz4W5H6jpTz1pJGDKfEJV
	QMkfrTs3OufPc7Q8dXBdKsNy1szJAXYy8EiAp8dTqPsaALLlf91pIbTN0IXoooPbjpT0Oi
	2RXkq2mbib5N0KyCesf6YArF3Dg2moU=
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
 <YHRnvQvWJ7QsXVgX@Air-de-Roger>
 <c07396f2-b0c5-092b-4e3e-5f452c453e56@suse.com>
 <YHVv/wyD6BphWaU/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4190da5f-65c2-dfee-e84e-9d5560dabf69@suse.com>
Date: Tue, 13 Apr 2021 14:03:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHVv/wyD6BphWaU/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.04.2021 12:18, Roger Pau Monné wrote:
> On Tue, Apr 13, 2021 at 11:24:09AM +0200, Jan Beulich wrote:
>> On 12.04.2021 17:31, Roger Pau Monné wrote:
>>> On Mon, Apr 12, 2021 at 12:40:48PM +0200, Jan Beulich wrote:
>>>> +    {
>>>> +        const struct page_info *pg = mfn_to_page(mfn);
>>>> +
>>>> +        if ( !page_get_owner(pg) && (pg->count_info & PGC_extra) )
>>>> +        {
>>>> +            ASSERT(type == p2m_mmio_direct);
>>>> +            return 0;
>>>
>>> Are there any other pages that could pass this check? I don't think
>>> so, but wanted to assert.
>>
>> "Normal" extra pages have an owner, so no, there aren't any others.
>> If and when any appear, this may need further customizing, albeit
>> generally I'd hope further pages matching this pattern would also
>> want similar treatment.
> 
> I wonder whether we want to add an assert here to make sure only the
> APIC access page receives this special handling by the shadow code,
> but maybe that's a bit too much?

I think so, yes: It would require either a separate function or
making the variable global. Both feel like a layering violation.

Jan

