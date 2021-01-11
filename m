Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31642F1827
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64895.114772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyy8p-0005qQ-OF; Mon, 11 Jan 2021 14:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64895.114772; Mon, 11 Jan 2021 14:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyy8p-0005q1-Kj; Mon, 11 Jan 2021 14:25:55 +0000
Received: by outflank-mailman (input) for mailman id 64895;
 Mon, 11 Jan 2021 14:25:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyy8n-0005pw-T6
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:25:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a38357b-0c78-478f-84f8-02463bf8d971;
 Mon, 11 Jan 2021 14:25:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7BA5B72F;
 Mon, 11 Jan 2021 14:25:51 +0000 (UTC)
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
X-Inumbo-ID: 9a38357b-0c78-478f-84f8-02463bf8d971
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610375152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irP/pCr6Nq+l9KtKCWMw9BpxpKlAuFbI4eWVNdEURfM=;
	b=hjRdXJCzuKLLB5BPPXgRu4FwqxzAJNONfBK/ME3dwMQMvhFtlQiMwELgY6LpIA1w7LjDyg
	skuF0VAkDVherTkUJ0rpYTwXrzzBAYJ6DfO+0E5wLH1w7JlWCLSxAyZ088Nh5mzgjLe3rL
	aY+zAaG3Pj1nTWpBOjmUtfzLjbBGheY=
Subject: Re: [PATCH v2 07/11] xen/memory: Improve compat
 XENMEM_acquire_resource handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-8-andrew.cooper3@citrix.com>
 <9b6c7ed2-02a4-f422-c0ab-62ca5864c7db@suse.com>
 <50773bc6-40a5-7c76-bd30-62bc69772503@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df809e68-4c65-39b6-47d2-9a55ed6389ff@suse.com>
Date: Mon, 11 Jan 2021 15:25:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <50773bc6-40a5-7c76-bd30-62bc69772503@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.01.2021 19:57, Andrew Cooper wrote:
> On 28/09/2020 10:09, Jan Beulich wrote:
>> On 22.09.2020 20:24, Andrew Cooper wrote:
>>> @@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>  
>>>  #undef XLAT_mem_acquire_resource_HNDL_frame_list
>>>  
>>> +            if ( xen_frame_list && cmp.mar.nr_frames )
>>> +            {
>>> +                /*
>>> +                 * frame_list is an input for translated guests, and an output
>>> +                 * for untranslated guests.  Only copy in for translated guests.
>>> +                 */
>>> +                if ( paging_mode_translate(currd) )
>>> +                {
>>> +                    compat_pfn_t *compat_frame_list = (void *)xen_frame_list;
>>> +
>>> +                    if ( !compat_handle_okay(cmp.mar.frame_list,
>>> +                                             cmp.mar.nr_frames) ||
>>> +                         __copy_from_compat_offset(
>>> +                             compat_frame_list, cmp.mar.frame_list,
>>> +                             0, cmp.mar.nr_frames) )
>>> +                        return -EFAULT;
>>> +
>>> +                    /*
>>> +                     * Iterate backwards over compat_frame_list[] expanding
>>> +                     * compat_pfn_t to xen_pfn_t in place.
>>> +                     */
>>> +                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
>>> +                        xen_frame_list[x] = compat_frame_list[x];
>> In addition to what Paul has said, I also don't see why you resort
>> to a signed type here. Using the available local variable i ought to
>> be quite easy:
>>
>>                     for ( i = cmp.mar.nr_frames; i--; )
>>                         xen_frame_list[i] = compat_frame_list[i];
> 
> My goal is to make this code able to be followed, not to obfuscate it
> further.  In particular, my version doesn't take several minutes to
> figure out why it doesn't die with a fatal #PF.
> 
> Also (because I thought it would be full of irony to try, and it turns
> out I was right), your version is 9 bytes larger once compiled.  This
> has everything to do with the scope of the induction variable.  I'm
> surprised that, in your effort to irradiate overly large scopes, you
> haven't pushed for this form further.

Let me reply in reverse order: When asking for scope reduction, I
don't think I would typically ask to introduce multiple identical
variables across many smaller scopes. So in general I view helper
variables like induction ones okay to have wide scope, as long as
they're used only for similar purposes (e.g. not again after their
loops).

Additionally it wasn't clear to me whether this originally C++
style of declaring induction variables was something we actually
consider acceptable. Personally I've avoided using such constructs
so far, for this reason. And again personally I'd be happy to see
us formally allow for their use.

Finally, the main aspect of my previous reply was left unaddressed:
I'm not so much concerned about the extra variable, but about it
being signed when (this being used as an array index) one can do
without.

>> As an aside, considering the controversy we're having on patch 2, I
>> find it quite interesting how you carefully allow for nr_frames being
>> zero throughout your changes here (which, as I think is obvious, I
>> agree you want to do).
> 
> I thought you of all people would appreciate that there *is* a
> separation of responsibilities between this parameter-marshalling one,
> and the native one.

Sure. But the two would better agree in their interpretation of
what a count of zero means.

> Also, this code doesn't livelock in the hypervisor when handed 0.

Would you mind explaining where there's a livelock? If indeed
code structure results in such, special casing count-is-zero
early on (and returning success without having done anything) is
an easy solution. Nevertheless I'd generally prefer to achieve
such behavior without additional code, e.g. by loops "naturally"
degenerating to no-ops in such a case.

Jan

