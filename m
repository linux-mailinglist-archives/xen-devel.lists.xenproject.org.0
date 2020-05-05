Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627C1C5B10
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 17:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVzSw-0001iW-A6; Tue, 05 May 2020 15:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uapr=6T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jVzSu-0001iR-Tv
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 15:26:36 +0000
X-Inumbo-ID: ce535e0c-8ee4-11ea-9dca-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce535e0c-8ee4-11ea-9dca-12813bfff9fa;
 Tue, 05 May 2020 15:26:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E14AAE37;
 Tue,  5 May 2020 15:26:37 +0000 (UTC)
Subject: Re: [PATCH v5] docs/designs: re-work the xenstore migration
 document...
To: Edwin Torok <edvin.torok@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200428150624.265-1-paul@xen.org>
 <2bf7dc13-65a4-317e-2c8c-bd6972dbb35a@xen.org>
 <fb319876-41eb-e785-a197-92440187a135@suse.com>
 <3fa9445d4677a9a6c24fb3aaee08913ad5c13a34.camel@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <25c0675d-a55a-e7fd-8026-594c3148099c@suse.com>
Date: Tue, 5 May 2020 17:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3fa9445d4677a9a6c24fb3aaee08913ad5c13a34.camel@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 05.05.20 17:15, Edwin Torok wrote:
> On Tue, 2020-05-05 at 14:13 +0100, Jürgen Groß wrote:
>> On 05.05.20 15:01, Julien Grall wrote:
>>> Hi Paul,
>>>
>>> On 28/04/2020 16:06, Paul Durrant wrote:
>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>
>>>> ... to specify a separate migration stream that will also be
>>>> suitable for
>>>> live update.
>>>>
>>>> The original scope of the document was to support non-
>>>> cooperative
>>>> migration
>>>> of guests [1] but, since then, live update of xenstored has been
>>>> brought into
>>>> scope. Thus it makes more sense to define a separate image format
>>>> for
>>>> serializing xenstore state that is suitable for both purposes.
>>>>
>>>> The document has been limited to specifying a new image format.
>>>> The
>>>> mechanism
>>>> for acquiring the image for live update or migration is not
>>>> covered as
>>>> that
>>>> is more appropriately dealt with by a patch to
>>>> docs/misc/xenstore.txt.
>>>> It is
>>>> also expected that, when the first implementation of live update
>>>> or
>>>> migration
>>>> making use of this specification is committed, that the document
>>>> is
>>>> moved from
>>>> docs/designs into docs/specs.
>>>>
>>>> NOTE: It will only be necessary to save and restore state for
>>>> active
>>>> xenstore
>>>>         connections, but the documentation for 'RESUME' in
>>>> xenstore.txt
>>>> implies
>>>>         otherwise. That command is unused so this patch deletes it
>>>> from
>>>> the
>>>>         specification.
>>
>> Could someone from Citrix please verify that XAPI isn't using
>> XS_RESUME?
> 
> The implementation of XS_RESUME in oxenstored doesn't do much: it seems
> to be just a way for Dom0 to check whether a domain exists or not, and
> for a domain to check whether they are Dom0 or not.
> If the domain exists, then the resume implementation just returns `()`,
> i.e. does nothing.
> 
> I can't find any references to Xs.resume in xenopsd (or the other XAPI
> repos that I got checked out), so I think it can be safely removed from
> the spec and client libraries (I'd keep it in the actual oxenstored
> implementation just in case some guest does call it).

Thanks for the confirmation.


Juergen

