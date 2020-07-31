Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C7234782
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:14:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VnW-0002ix-Br; Fri, 31 Jul 2020 14:14:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1VnV-0002is-6i
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:14:09 +0000
X-Inumbo-ID: 1819e82a-d338-11ea-abbb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1819e82a-d338-11ea-abbb-12813bfff9fa;
 Fri, 31 Jul 2020 14:14:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34D22AB8B;
 Fri, 31 Jul 2020 14:14:19 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
To: paul@xen.org
References: <20200731123926.28970-1-paul@xen.org>
 <20200731123926.28970-3-paul@xen.org>
 <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
 <004501d6673b$9adffbf0$d09ff3d0$@xen.org>
 <84cdd5b8-5149-a240-8bad-be8d67dca0d8@suse.com>
 <004601d66740$9661ad80$c3250880$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1386ff11-6bf4-2edb-3b44-354faa75cced@suse.com>
Date: Fri, 31 Jul 2020 16:14:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004601d66740$9661ad80$c3250880$@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 15:43, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 31 July 2020 14:41
>> To: paul@xen.org
>> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>; 'Andrew Cooper'
>> <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger Pau Monné' <roger.pau@citrix.com>
>> Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()
>>
>> On 31.07.2020 15:07, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 31 July 2020 13:58
>>>> To: Paul Durrant <paul@xen.org>
>>>> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau Monné <roger.pau@citrix.com>
>>>> Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()
>>>>
>>>> On 31.07.2020 14:39, Paul Durrant wrote:
>>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>>
>>>>> Re-factor the code to take advantage of the fact that the APIC access page is
>>>>> a 'special' page.
>>>>
>>>> Hmm, that's going quite as far as I was thinking to go: In
>>>> particular, you leave in place the set_mmio_p2m_entry() use
>>>> in vmx_alloc_vlapic_mapping(). With that replaced, the
>>>> re-ordering in epte_get_entry_emt() that you do shouldn't
>>>> be necessary; you'd simple drop the checking of the
>>>> specific MFN.
>>>
>>> Ok, it still needs to go in the p2m though so are you suggesting
>>> just calling p2m_set_entry() directly?
>>
>> Yes, if this works. The main question really is whether there are
>> any hidden assumptions elsewhere that this page gets mapped as an
>> MMIO one.
>>
> 
> Actually, it occurs to me that logdirty is going to be an issue if I
> use p2m_ram_rw. If I'm not going to use p2m_mmio_direct then do you
> have another suggestion?

p2m_ram_rw is also not good because of allowing execution. If we don't
want to create a new type, how about (ab)using p2m_grant_map_rw (in
the sense of Xen granting the domain access to this page)? Possible
problems with this are
- replace_grant_p2m_mapping()
- hvm_translate_get_page()
All other uses of p2m_grant_map_rw and p2m_is_grant() look to be
compatible with this approach.

For replace_grant_p2m_mapping() I think there's no issue because the
grant table code won't find a suitable active entry.

For hvm_translate_get_page() the question is why it checks for the
two grant types in the first place; iow I wonder whether that check
couldn't be dropped.

Independent of this, btw, you may need to call set_gpfn_from_mfn()
alongside p2m_set_entry().

Jan

