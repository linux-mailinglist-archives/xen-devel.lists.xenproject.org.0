Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA58930375F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 08:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74638.134136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4IuT-0003Mx-Vy; Tue, 26 Jan 2021 07:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74638.134136; Tue, 26 Jan 2021 07:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4IuT-0003MX-Sa; Tue, 26 Jan 2021 07:37:09 +0000
Received: by outflank-mailman (input) for mailman id 74638;
 Tue, 26 Jan 2021 07:37:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4IuS-0003MS-6t
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 07:37:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e631714-eaa1-4f05-aa19-6ce78bf1af28;
 Tue, 26 Jan 2021 07:37:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 734D0AE91;
 Tue, 26 Jan 2021 07:37:06 +0000 (UTC)
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
X-Inumbo-ID: 3e631714-eaa1-4f05-aa19-6ce78bf1af28
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611646626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7G6M7VLWX2HfWjv+I3yeJvp2R6zYlznnwDW9sQHn3Zo=;
	b=ZMjFlVFo6ZjQcA1AubsU4mO0loUnYglkVC0oZ1rZ2Z63ICoJ37j3ltwdlHltbebw2XvJGv
	n1XKD4JReyldqTiuj+US0l/I1eVd6ZzMeHZFgsW24bCmlxxspsLRMWaUazbmnIYTcnKY6o
	nxsNaBuR48bvne5sJ2oPBO6aWdFMA2Q=
Subject: Re: [PATCH v7 04/10] xen/memory: Add a vmtrace_buf resource type
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-5-andrew.cooper3@citrix.com>
 <7702d1d6-86c9-af43-c9a9-f5ec082bad2d@suse.com>
Message-ID: <226c4857-b0f7-f7f8-f353-e7331cce6e46@suse.com>
Date: Tue, 26 Jan 2021 08:37:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7702d1d6-86c9-af43-c9a9-f5ec082bad2d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 17:31, Jan Beulich wrote:
> On 21.01.2021 22:27, Andrew Cooper wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1068,11 +1068,35 @@ static unsigned int resource_max_frames(const struct domain *d,
>>      case XENMEM_resource_grant_table:
>>          return gnttab_resource_max_frames(d, id);
>>  
>> +    case XENMEM_resource_vmtrace_buf:
>> +        return d->vmtrace_frames;
>> +
>>      default:
>>          return arch_resource_max_frames(d, type, id);
>>      }
>>  }
>>  
>> +static int acquire_vmtrace_buf(
>> +    struct domain *d, unsigned int id, unsigned long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>> +{
>> +    const struct vcpu *v = domain_vcpu(d, id);
>> +    unsigned int i;
>> +    mfn_t mfn;
>> +
>> +    if ( !v || !v->vmtrace.buf ||
>> +         nr_frames > d->vmtrace_frames ||
>> +         (frame + nr_frames) > d->vmtrace_frames )
>> +        return -EINVAL;
> 
> 
> I think that for this to guard against overflow, the first nr_frames
> needs to be replaced by frame (as having the wider type), or else a
> very large value of frame coming in will not yield the intended
> -EINVAL.

Actually, besides this then wanting to be >= instead of >, this
wouldn't take care of the 32-bit case (or more generally the
sizeof(long) == sizeof(int) one). So I think you want

    if ( !v || !v->vmtrace.buf ||
         (frame + nr_frames) < frame ||
         (frame + nr_frames) > d->vmtrace_frames )
        return -EINVAL;

> If you agree, with this changed,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

This holds.

Jan

