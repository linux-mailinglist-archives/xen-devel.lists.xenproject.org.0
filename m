Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE772F141F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64823.114598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyx77-0007Lq-JB; Mon, 11 Jan 2021 13:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64823.114598; Mon, 11 Jan 2021 13:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyx77-0007Kc-FB; Mon, 11 Jan 2021 13:20:05 +0000
Received: by outflank-mailman (input) for mailman id 64823;
 Mon, 11 Jan 2021 13:20:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM29=GO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kyx75-0006yY-7Y
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:20:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a2b97dd-fecc-4221-90f5-e4be0e98786f;
 Mon, 11 Jan 2021 13:20:01 +0000 (UTC)
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
X-Inumbo-ID: 1a2b97dd-fecc-4221-90f5-e4be0e98786f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610371201;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=igQDkQkuLkbJ2hAMNO0KWYAa8A7U7POkOz+ZuJvChgk=;
  b=hxWf9Jm9s6qpknBjO89t0/jZVGzG1S0jh7+KqYxhRe5iaFLbx9I4M6F+
   SUFdbZgqFcYQU4YAdIA+sQZ8ws/KMDAJ1/utd3vGFsC3fQ/086KKYiLVg
   +dgfpRw89UKhtf2z9aCf4Wy1zK20L3KfhMHqYa8FdWkRAAYXajtA72RMk
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 05wgxv/pil473+aHlpujU/wnftfUCC4AZMCojykqYDqp4OEUVsMzg29skmdb8BrVZzvax+MkBt
 uvx9Ur5txNHa5ivtKEyLLmiVJGVL/XFcjiEUjsZQ6Dx6GCIVPjic/4mzq3vLc34okkd0aUqJvM
 WQhDv06zxVDPmjxHGxGv/RIRRzAmiurs9lxfBgYl7+BDOXpabqYW6CUyqEkUzrFpDGf/Xbnivb
 n/JInetCvOVSR4XsFxoKCnQ+iX50/jX+ykqaSEocxuRvfb7dU6KPg0BliBWhg0TXiBaBAjRGJ5
 vDk=
X-SBRS: 5.2
X-MesageID: 36098220
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="36098220"
Subject: Re: [PATCH v2 07/11] xen/memory: Improve compat
 XENMEM_acquire_resource handling
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
	"Hubert Jasudowicz" <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-8-andrew.cooper3@citrix.com>
 <9b6c7ed2-02a4-f422-c0ab-62ca5864c7db@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <50773bc6-40a5-7c76-bd30-62bc69772503@citrix.com>
Date: Fri, 8 Jan 2021 18:57:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b6c7ed2-02a4-f422-c0ab-62ca5864c7db@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: FTLPEX02CAS03.citrite.net (10.13.99.94) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 28/09/2020 10:09, Jan Beulich wrote:
> On 22.09.2020 20:24, Andrew Cooper wrote:
>> @@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>  
>>  #undef XLAT_mem_acquire_resource_HNDL_frame_list
>>  
>> +            if ( xen_frame_list && cmp.mar.nr_frames )
>> +            {
>> +                /*
>> +                 * frame_list is an input for translated guests, and an output
>> +                 * for untranslated guests.  Only copy in for translated guests.
>> +                 */
>> +                if ( paging_mode_translate(currd) )
>> +                {
>> +                    compat_pfn_t *compat_frame_list = (void *)xen_frame_list;
>> +
>> +                    if ( !compat_handle_okay(cmp.mar.frame_list,
>> +                                             cmp.mar.nr_frames) ||
>> +                         __copy_from_compat_offset(
>> +                             compat_frame_list, cmp.mar.frame_list,
>> +                             0, cmp.mar.nr_frames) )
>> +                        return -EFAULT;
>> +
>> +                    /*
>> +                     * Iterate backwards over compat_frame_list[] expanding
>> +                     * compat_pfn_t to xen_pfn_t in place.
>> +                     */
>> +                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
>> +                        xen_frame_list[x] = compat_frame_list[x];
> In addition to what Paul has said, I also don't see why you resort
> to a signed type here. Using the available local variable i ought to
> be quite easy:
>
>                     for ( i = cmp.mar.nr_frames; i--; )
>                         xen_frame_list[i] = compat_frame_list[i];

My goal is to make this code able to be followed, not to obfuscate it
further.  In particular, my version doesn't take several minutes to
figure out why it doesn't die with a fatal #PF.

Also (because I thought it would be full of irony to try, and it turns
out I was right), your version is 9 bytes larger once compiled.  This
has everything to do with the scope of the induction variable.  I'm
surprised that, in your effort to irradiate overly large scopes, you
haven't pushed for this form further.

> As an aside, considering the controversy we're having on patch 2, I
> find it quite interesting how you carefully allow for nr_frames being
> zero throughout your changes here (which, as I think is obvious, I
> agree you want to do).

I thought you of all people would appreciate that there *is* a
separation of responsibilities between this parameter-marshalling one,
and the native one.

Also, this code doesn't livelock in the hypervisor when handed 0.

~Andrew

