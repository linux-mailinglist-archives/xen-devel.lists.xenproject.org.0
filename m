Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3585E2744B3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:51:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjd5-0000qF-81; Tue, 22 Sep 2020 14:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKjd4-0000q8-Bv
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:50:50 +0000
X-Inumbo-ID: 2466ed7a-6e82-4074-9864-03750f8af535
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2466ed7a-6e82-4074-9864-03750f8af535;
 Tue, 22 Sep 2020 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600786249;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6Ioy9Ra/XLzAsqG3hkver3Ci23Ywj7OWBmmup69R7Uw=;
 b=Wcnb6j4vfbnHYH3CG/UqEd1oPGHBdQAe4bRDj8zp7NhL9wHP/J+7LfmT
 yxFrlPKCwIWeVIwX9IaoJVUJNwoMSir+tgKJYIDCGm9/e1gxCrpvuu7kK
 OH0du62cv3lEdIqsQROXKx5EBL+bf3w/HbwfsbEb6Aq79VNTsuDoukfOL c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8/H5LiJ5BtRy5HSw83VijRj5rO0lDHJ4O1dWOJlPYkE6XqLNoEB7WDclCN9OD7Z9CMV6B5IScu
 XMKLvwILjSZj9L5hFJfFsmBt4jCcboK28JGf9SWJuI0wpCoNHBKa7xaJMELFFBR2ryyLsXV/zj
 nd839N9qe99BzWMqWnAjzua6tlqY4RKcdORDHSuxe1EoLUslUAR0sR0uJS1FRi5MklOjqHa1tt
 WHINioeh8FDP5pomVOWmcLMwJ1SfGTr94S5FC00WVAOY22Rs93UANt4rTupokkJjx85ZtnkFPs
 w0M=
X-SBRS: 2.7
X-MesageID: 27601873
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27601873"
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 "Hubert Jasudowicz" <hubert.jasudowicz@cert.pl>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
 <784bf5c1-be13-2c09-5494-6eb64c400473@suse.com>
 <17123e43-ca3e-4075-ad36-45e324bb6214@citrix.com>
 <cab7113e-9d0a-954c-c62d-115d7f734787@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6180c01-9d85-6ae0-6122-7ca688c86b10@citrix.com>
Date: Tue, 22 Sep 2020 15:50:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cab7113e-9d0a-954c-c62d-115d7f734787@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/09/2020 14:34, Jan Beulich wrote:
> On 22.09.2020 15:10, Andrew Cooper wrote:
>> On 29/07/2020 21:02, Jan Beulich wrote:
>>> On 28.07.2020 13:37, Andrew Cooper wrote:
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct
>>>> domain *d,
>>>>       return 0;
>>>>   }
>>>>   +int gnttab_acquire_resource(
>>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>>> +{
>>>> +    struct grant_table *gt = d->grant_table;
>>>> +    unsigned int i = nr_frames, tot_frames;
>>>> +    void **vaddrs;
>>>> +    int rc = 0;
>>>> +
>>>> +    /* Input sanity. */
>>>> +    if ( !nr_frames )
>>>> +        return -EINVAL;
>>> I can't seem to be able to find an equivalent of this in the old logic,
>>> and hence this looks like an unwarranted change in behavior to me. We
>>> have quite a few hypercall ops where some count being zero is simply
>>> a no-op, i.e. yielding success without doing anything.
>> There is no possible circumstance when getting here requesting 0 is
>> legitimate.
>>
>> Tolerating a zero input for a mapping request is a very expensive way of
>> hiding caller bugs.
> That's just one possible view.

... that is fully enforced in the ecosystem we work in.

You can't get a 0 to here in the first place.

However, when it comes to the XLAT and the chunking fixes, getting 0
here is a hard error, and I'm not interested in breaking the that logic
for a non-existent corner case.

~Andrew

