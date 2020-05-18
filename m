Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A481D7F44
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 18:54:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaj1q-00042X-Bj; Mon, 18 May 2020 16:54:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ws3m=7A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jaj1p-00042Q-5z
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 16:54:13 +0000
X-Inumbo-ID: 3238e0df-9928-11ea-a87d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3238e0df-9928-11ea-a87d-12813bfff9fa;
 Mon, 18 May 2020 16:54:12 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +ccds8SB45TqruE4apIM2XLthQlYshqcpezscngwotaVhd3bONz/ib38mK7DM7qyfHhYl2wJyR
 3jGuQtqA2AflF4DVLDuUrSTQiy2hwon4UCqkBaBJAozfbXPyYqszf5DBQ47/qq/CGLj0C7NRHv
 7PF9lxBWvwSb2R+rYEyFYThB06UV8A02MsQvkYVM0Paa897p+n9EpevAqRkapafDWGZPRs7vzL
 2OJ3WCymLKC/Ce33j0Q71ufmNjV8vrz4BOs02uSA1z7K0dTCij58LmjK+tR0gG9UNHB8Lz3ycV
 V0Q=
X-SBRS: 2.7
X-MesageID: 17839065
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="17839065"
Subject: Re: [PATCH 02/16] x86/traps: Clean up printing in
 do_reserved_trap()/fatal_trap()
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-3-andrew.cooper3@citrix.com>
 <aca22b53-895e-19bb-c54c-f1e4945c95c1@suse.com>
 <8f1d68b1-895a-d2a6-4dcb-55b688b03336@citrix.com>
 <b1ef905c-dab6-d1c3-4673-4c06c7e94a0a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <560c3bce-211a-52ab-c919-9ca1ab9beab3@citrix.com>
Date: Mon, 18 May 2020 17:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b1ef905c-dab6-d1c3-4673-4c06c7e94a0a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 11/05/2020 16:09, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 11.05.2020 17:01, Andrew Cooper wrote:
>> On 04/05/2020 14:08, Jan Beulich wrote:
>>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>>> For one, they render the vector in a different base.
>>>>
>>>> Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
>>>> mnemonic, which starts bringing the code/diagnostics in line with the Intel
>>>> and AMD manuals.
>>> For this "bringing in line" purpose I'd like to see whether you could
>>> live with some adjustments to how you're currently doing things:
>>> - NMI is nowhere prefixed by #, hence I think we'd better not do so
>>>   either; may require embedding the #-es in the names[] table, or not
>>>   using N() for NMI
>> No-one is going to get confused at seeing #NMI in an error message.  I
>> don't mind jugging the existing names table, but anything more
>> complicated is overkill.
>>
>>> - neither Coprocessor Segment Overrun nor vector 0x0f have a mnemonic
>>>   and hence I think we shouldn't invent one; just treat them like
>>>   other reserved vectors (of which at least vector 0x09 indeed is one
>>>   on x86-64)?
>> This I disagree with.  Coprocessor Segment Overrun *is* its name in both
>> manuals, and the avoidance of vector 0xf is clearly documented as well,
>> due to it being the default PIC Spurious Interrupt Vector.
>>
>> Neither CSO or SPV are expected to be encountered in practice, but if
>> they are, highlighting them is a damn-sight more helpful than pretending
>> they don't exist.
> How is them occurring (and getting logged with their vector numbers)
> any different from other reserved, acronym-less vectors? I particularly
> didn't suggest to pretend they don't exist; instead I did suggest that
> they are as reserved as, say, vector 0x18. By inventing an acronym and
> logging this instead of the vector number you'll make people other than
> you have to look up what the odd acronym means iff such an exception
> ever got raised.

You snipped the bits in the patch where both the vector number and
acronym are printed together.

Anyone who doesn't know the vector has to look it up anyway, at which
point they'll find that what Xen prints out matches what both manuals
say.  OTOH, people who know what a coprocessor segment overrun or PIC
spurious vector is won't need to look it up.

~Andrew

