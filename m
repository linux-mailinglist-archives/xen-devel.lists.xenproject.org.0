Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884972743FF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:18:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj75-0003CA-11; Tue, 22 Sep 2020 14:17:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKj73-0003Bx-E4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:17:45 +0000
X-Inumbo-ID: 4ab7da6a-2b82-4f2a-bb08-272c37ae7594
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ab7da6a-2b82-4f2a-bb08-272c37ae7594;
 Tue, 22 Sep 2020 14:17:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600784262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/b8fvvibtxXT6u1u9TDPmBkil4Zo6gAduyXPojkOQ0=;
 b=GX5l28Jpyss3rkYhvdCNigXoMm2NbVEmQTh1imSbjT+J6lxeP1xaY93lcDp4Z4n1UtL7fK
 a7U/RXZrfATnU4zCuqTGLHwGbEuXpub/58KZuwv73axhw8YDcuoFMnhZt73FSZAhlu/HOt
 DjEB/CkTzR3wkSrTrnug0JIgaKSjS+s=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EDD2AC97;
 Tue, 22 Sep 2020 14:18:19 +0000 (UTC)
Subject: Re: oxenstored performance issue when starting VMs in parallel
To: paul@xen.org, 'Edwin Torok' <edvin.torok@citrix.com>,
 sstabellini@kernel.org, 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: xen-users@lists.xenproject.org, jerome.leseinne@gmail.com, julien@xen.org
References: <CAAMaOzi5d7S0qAhBkPTFzNfAWXMuK-JbxtQuyk4hdPcVDUwxQg@mail.gmail.com>
 <c84155eb-429d-7143-9eb1-3b5a50c6bde5@xen.org>
 <46f1f50dc02c53391958d9d4bb5fc57d23ba6ede.camel@citrix.com>
 <CAAMaOzj3eYo=bQgth51f+psR2ZBj+c-2boZy57x2qV2aq0fShQ@mail.gmail.com>
 <ba74b8225223ba800c38b34ac950283b7b6cb0fe.camel@citrix.com>
 <00a101d690e6$33a88bd0$9af9a370$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <816d5bd8-6794-7fcd-bd08-6eb5a2248328@suse.com>
Date: Tue, 22 Sep 2020 16:17:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <00a101d690e6$33a88bd0$9af9a370$@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.20 15:42, Paul Durrant wrote:
>> -----Original Message-----
>> From: Edwin Torok <edvin.torok@citrix.com>
>> Sent: 22 September 2020 14:29
>> To: sstabellini@kernel.org; Anthony Perard <anthony.perard@citrix.com>; xen-
>> devel@lists.xenproject.org; paul@xen.org
>> Cc: xen-users@lists.xenproject.org; jerome.leseinne@gmail.com; julien@xen.org
>> Subject: Re: oxenstored performance issue when starting VMs in parallel
>>
>> On Tue, 2020-09-22 at 15:17 +0200, jerome leseinne wrote:
>>> Hi,
>>>
>>> Edwin you rock ! This call in qemu is effectively the culprit !
>>> I have disabled this xen_bus_add_watch call and re-run test on our
>>> big server:
>>>
>>> - oxenstored is now  between 10% to 20%  CPU usage (previously was
>>> 100% all the time)
>>> - All our VMs are responsive
>>> - All our VM start in less than 10 seconds (before the fix some VMs
>>> could take more than one minute to be fully up
>>> - Dom0 is more responsive
>>>
>>> Disabling the watch may not be the ideal solution ( I let the qemu
>>> experts answer this and the possible side effects),
>>
>> Hi,
>>
>> CC-ed Qemu maintainer of Xen code, please see this discussion about
>> scalability issues with the backend watching code in qemu 4.1+.
>>
>> I think the scalability issue is due to this code in qemu, which causes
>> an instance of qemu to see watches from all devices (even those
>> belonging to other qemu instances), such that adding a single device
>> causes N watches to be fired on each N instances of qemu:
>>        xenbus->backend_watch =
>>             xen_bus_add_watch(xenbus, "", /* domain root node */
>>                               "backend", xen_bus_backend_changed,
>>   &local_err);
>>
>> I can understand that for backwards compatibility you might need this
>> code, but is there a way that an up-to-date (xl) toolstack could tell
>> qemu what it needs to look at (e.g. via QMP, or other keys in xenstore)
>> instead of relying on an overly broad watch?
> 
> I think this could be made more efficient. The call to "module_call_init(MODULE_INIT_XEN_BACKEND)" just prior to this watch will register backends that do auto-creation so we could register individual watches for the various backend types instead of this single one.

The watch should be on guest domain level, e.g. for:

/local/domain/0/backend/vbd/5

We have one qemu process per guest, after all.


Juergen

