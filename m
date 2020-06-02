Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE41EBBB7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:32:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg65T-0008JK-3U; Tue, 02 Jun 2020 12:32:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg65S-0008JF-CL
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:32:10 +0000
X-Inumbo-ID: 13721886-a4cd-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13721886-a4cd-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 12:32:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6405ABD1;
 Tue,  2 Jun 2020 12:32:10 +0000 (UTC)
Subject: Re: [PATCH v2 06/14] x86/shstk: Create shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-7-andrew.cooper3@citrix.com>
 <8a02b933-3b7e-ded9-8bf3-a1c35f2ef7ae@suse.com>
 <fe8f077d-2048-38af-5deb-0d9dda48cf36@citrix.com>
 <fb55d660-4a81-101b-85a4-7ece3c98b8ef@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c194c45-e8a2-30e9-19bd-241bc20fd89a@suse.com>
Date: Tue, 2 Jun 2020 14:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <fb55d660-4a81-101b-85a4-7ece3c98b8ef@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 23:45, Andrew Cooper wrote:
> On 29/05/2020 20:35, Andrew Cooper wrote:
>>>> +    }
>>>> +    map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
>>> As already hinted at in reply to the previous patch, I think this wants
>>> to remain _PAGE_NONE when we don't use CET-SS.
>> The commit message discussed why that is not an option (currently), and
>> why I don't consider it a good idea to make possible.
> 
> Apologies.  I thought I'd written it in the commit message, but it was
> half in the previous patch, and not terribly clear.  I've reworked both.

Thanks, I've looked at them, but it's still not really clear to me:

> The current practical reason is to do with clone_mappings() in the XPTI
> case.

What exactly is the problem here? clone_mapping(), afaict, deals
fine with non-present PTEs. The original memguard_is_stack_guard_page()
check was more as a safe guard, to avoid establishing a mapping of
a guard page as much as possible.

> A wild off-stack read is far far less likely than hitting the guard page
> with a push first, which means that a R/O guard page is about the same
> usefulness to us, but results in a much more simple stack setup, as it
> doesn't vary attributes with enabled features.

While OoB stack reads may indeed be less likely, such aren't necessarily
"wild" (assuming my understanding of the term is what you mean): A
function epilogue can certainly pop (by the respective insn or by
incrementing %rsp by too much) too many slots, which would be detected
earlier with non-present mappings than with r/o ones. So I'd prefer to
stick to non-present guard pages when CET-SS is not in use, unless
there's indeed a technical reason not to do so. The two uses of
PAGE_HYPERVISOR_SHSTK can't be that bad a "variation" to alternatively
make _PAGE_NONE. In fact PAGE_HYPERVISOR_SHSTK could itself resolve
to _PAGE_NONE when !cpu_has_xen_shstk ...

Jan

