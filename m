Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66676276F3F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLP2O-0000kV-Fi; Thu, 24 Sep 2020 11:03:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLP2N-0000kN-95
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:03:43 +0000
X-Inumbo-ID: 58d4d43b-9f60-4b4b-8292-c97092f2430a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58d4d43b-9f60-4b4b-8292-c97092f2430a;
 Thu, 24 Sep 2020 11:03:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600945421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xdCIIiqR3/gNiWzMyl2/rZEMugoYBFrdNgtXb97o5w=;
 b=FeRFz61kpYdmiXG1M0JNmCOJW6f++vQTu3kSJ3bWekcurP2KQ7YH1WKxgj4x3eW/1WExT7
 92QvHYNDGkH2Hh96Q/7PeYFJlIShNfELAiNvowuBOm7CLxR3UXbX5xv6OdN0H1uzFjlTRJ
 turTTOKq/os7favqZXnO5h5ZOcgZhP4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 973C1B155;
 Thu, 24 Sep 2020 11:03:41 +0000 (UTC)
Subject: Re: [PATCH V1 07/16] xen/dm: Make x86's DM feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
 <70919183-5215-2efb-d399-2b2d5dd8b5ed@suse.com>
 <bab6a331-359c-51d1-3f82-7ef6a28e9d00@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b1f3c77-682c-a0d4-0c71-2b82a416cc9a@suse.com>
Date: Thu, 24 Sep 2020 13:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bab6a331-359c-51d1-3f82-7ef6a28e9d00@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.2020 18:46, Oleksandr wrote:
> 
> On 14.09.20 18:56, Jan Beulich wrote:
> Hi Jan
> 
>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/xen/hypercall.h
>>> +++ b/xen/include/xen/hypercall.h
>>> @@ -150,6 +150,18 @@ do_dm_op(
>>>       unsigned int nr_bufs,
>>>       XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
>>>   
>>> +struct dmop_args {
>>> +    domid_t domid;
>>> +    unsigned int nr_bufs;
>>> +    /* Reserve enough buf elements for all current hypercalls. */
>>> +    struct xen_dm_op_buf buf[2];
>>> +};
>>> +
>>> +int arch_dm_op(struct xen_dm_op *op,
>>> +               struct domain *d,
>>> +               const struct dmop_args *op_args,
>>> +               bool *const_op);
>>> +
>>>   #ifdef CONFIG_HYPFS
>>>   extern long
>>>   do_hypfs_op(
>> There are exactly two CUs which need to see these two declarations.
>> Personally I think they should go into a new header, or at least
>> into one that half-way fits (from the pov of its other contents)
>> and doesn't get included by half the code base. But maybe it's
>> just me ...
> 
> I am afraid, I didn't get why this header is not suitable for keeping 
> this stuff...

While I have no major objection against exposing arch_dm_op() to more
than just the relevant CUs, I don't think I'd like to see struct
dmop_args becoming visible to "everyone", and in particular changes
to it causing a re-build of (almost) everything.

Jan

