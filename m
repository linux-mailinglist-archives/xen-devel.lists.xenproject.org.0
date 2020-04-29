Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A651BD439
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 07:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTfct-0003px-AN; Wed, 29 Apr 2020 05:51:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fvgr=6N=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTfcr-0003pr-Co
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 05:51:17 +0000
X-Inumbo-ID: 7057b296-89dd-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7057b296-89dd-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 05:51:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C630AC79;
 Wed, 29 Apr 2020 05:51:14 +0000 (UTC)
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
Date: Wed, 29 Apr 2020 07:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.20 22:55, Julien Grall wrote:
> Hi Juergen,
> 
> On Tue, 28 Apr 2020 at 16:53, Juergen Gross <jgross@suse.com> wrote:
>>
>> The XS_INTRODUCE command has two parameters: the mfn (or better: gfn)
>> of the domain's xenstore ring page and the event channel of the
>> domain for communicating with Xenstore.
>>
>> The gfn is not really needed. It is stored in the per-domain struct
>> in xenstored and in case of another XS_INTRODUCE for the domain it
>> is tested to match the original value. If it doesn't match the
>> command is aborted via EINVAL.
>>
>> Today there shouldn't be multiple XS_INTRODUCE requests for the same
>> domain issued, so the mfn/gfn can just be ignored and multiple
>> XS_INTRODUCE commands can be rejected without testing the mfn/gfn.
> 
> So there is a comment in the else part:
> 
> /* Use XS_INTRODUCE for recreating the xenbus event-channel. */
> 
>  From the commit message this is not entirely clear why we want to
> prevent recreating the event-channel. Can you expand it?

Recreating the event channel would be fine, but I don't see why it
would ever be needed. And XS_INTRODUCE is called only at domain creation
time today, so there is obviously no need for repeating this call.

Maybe the idea was to do this after sending a XS_RESUME command, which
isn't used anywhere in Xen and is another part of Xenstore which doesn't
make any sense today.

> 
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/xenstore/xenstored_domain.c | 47 ++++++++++++++++-----------------------
>>   1 file changed, 19 insertions(+), 28 deletions(-)
>>
>> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
>> index 5858185211..17328f9fc9 100644
>> --- a/tools/xenstore/xenstored_domain.c
>> +++ b/tools/xenstore/xenstored_domain.c
>> @@ -369,7 +369,6 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>>          struct domain *domain;
>>          char *vec[3];
>>          unsigned int domid;
>> -       unsigned long mfn;
>>          evtchn_port_t port;
>>          int rc;
>>          struct xenstore_domain_interface *interface;
>> @@ -381,7 +380,7 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>>                  return EACCES;
>>
>>          domid = atoi(vec[0]);
>> -       mfn = atol(vec[1]);
>> +       /* Ignore the mfn, we don't need it. */
> 
> s/mfn/GFN/

Okay, then I should probably change the parameter description, too.

> 
>>          port = atoi(vec[2]);
>>
>>          /* Sanity check args. */
>> @@ -390,34 +389,26 @@ int do_introduce(struct connection *conn, struct buffered_data *in)
>>
>>          domain = find_domain_by_domid(domid);
>>
>> -       if (domain == NULL) {
>> -               interface = map_interface(domid);
>> -               if (!interface)
>> -                       return errno;
>> -               /* Hang domain off "in" until we're finished. */
>> -               domain = new_domain(in, domid, port);
>> -               if (!domain) {
>> -                       rc = errno;
>> -                       unmap_interface(interface);
>> -                       return rc;
>> -               }
>> -               domain->interface = interface;
>> -               domain->mfn = mfn;
> 
> AFAICT domain->mfn is not used anymore, so could we remove the field?

Oh, yes, I missed that.


Juergen

