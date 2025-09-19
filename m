Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD6B8927C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 12:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126833.1468156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzYk2-0000l1-O6; Fri, 19 Sep 2025 10:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126833.1468156; Fri, 19 Sep 2025 10:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzYk2-0000hs-KT; Fri, 19 Sep 2025 10:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1126833;
 Fri, 19 Sep 2025 10:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFOU=36=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1uzYk1-0000hQ-0N
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 10:53:25 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db5ad10c-9546-11f0-9809-7dc792cee155;
 Fri, 19 Sep 2025 12:53:22 +0200 (CEST)
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
 (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58JAkcQT033756
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Sep 2025 19:46:38 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
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
X-Inumbo-ID: db5ad10c-9546-11f0-9809-7dc792cee155
DKIM-Signature: a=rsa-sha256; bh=rWCFvrSz0E2oCjuTU959aed1+QCvq+UCU8sf+vOrvRg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1758278798; v=1;
        b=CJhWqRXMK7EVEqt5O4fzgwRHkpbvNlCZaOFGT2JRrokvtE+QlXyrJW49lss+htTp
         KFQ9E4TwLqRPpCtI4tDvZhlu5p+VEeAg5rZ5h32ZHa35LPKVJVUy9pwNtE/60NSZ
         qq56vOq+zd3BaQf/Jvtr0LJAzESnC/31asffQw6Px03Q2E14OlyKOsrSBsT9SdS/
         sf6iBD4VFClJOHPImJDN5/M2qkalIoEDAePrmpoDFSsBz1S0IDQSBvgwEmvShJG+
         6hbf/Npf5//RO3LzPxRwYamdTAldhiXOb0FjhvPd7Yg15U62VVBLFDiaTcrYKflb
         uoErgJ/vf6oO0EVI+zRkug==
Message-ID: <7511a948-10ef-4325-9818-35775c522aee@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 19 Sep 2025 19:46:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] docs/devel: Do not unparent in instance_finalize()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Helge Deller <deller@gmx.de>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
        qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
        Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
        John Levon <john.levon@nutanix.com>,
        Thanos Makatos <thanos.makatos@nutanix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Aleksandar Rikalo
 <arikalo@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Bin Meng <bmeng.cn@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <20250917-use-v3-1-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMxlpfp_LSgiIk9Z@x1.local> <aMxnj7ID0PpWUVNu@x1.local>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aMxnj7ID0PpWUVNu@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/09/19 5:11, Peter Xu wrote:
> On Thu, Sep 18, 2025 at 04:03:49PM -0400, Peter Xu wrote:
>> On Wed, Sep 17, 2025 at 07:13:26PM +0900, Akihiko Odaki wrote:
>>> Children are automatically unparented so manually unparenting is
>>> unnecessary.
>>>
>>> Worse, automatic unparenting happens before the instance_finalize()
>>> callback of the parent gets called, so object_unparent() calls in
>>> the callback will refer to objects that are already unparented, which
>>> is semantically incorrect.
>>>
>>> Remove the instruction to call object_unparent(), and the exception
>>> of the "do not call object_unparent()" rule for instance_finalize().
>>>
>>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>>> ---
>>>   docs/devel/memory.rst | 19 ++++++-------------
>>>   1 file changed, 6 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
>>> index 57fb2aec76e0..749f11d8a4dd 100644
>>> --- a/docs/devel/memory.rst
>>> +++ b/docs/devel/memory.rst
>>> @@ -161,18 +161,11 @@ or never.
>>>   Destruction of a memory region happens automatically when the owner
>>>   object dies.
>>>   
>>> -If however the memory region is part of a dynamically allocated data
>>> -structure, you should call object_unparent() to destroy the memory region
>>> -before the data structure is freed.  For an example see VFIOMSIXInfo
>>> -and VFIOQuirk in hw/vfio/pci.c.
>>
>> Should we still keep some of these examples?  After the series they'll be
>> doing the right things.  Dynamic MRs are still slightly tricky, I think
>> it's still good to have some references.

I agree. I'll restore it with the next version.

>>
>>> -
>>>   You must not destroy a memory region as long as it may be in use by a
>>>   device or CPU.  In order to do this, as a general rule do not create or
>>> -destroy memory regions dynamically during a device's lifetime, and only
>>> -call object_unparent() in the memory region owner's instance_finalize
>>> -callback.  The dynamically allocated data structure that contains the
>>> -memory region then should obviously be freed in the instance_finalize
>>> -callback as well.
>>> +destroy memory regions dynamically during a device's lifetime.
>>> +The dynamically allocated data structure that contains the
>>> +memory region should be freed in the instance_finalize callback.
>>>   
>>>   If you break this rule, the following situation can happen:
>>>   
>>> @@ -198,9 +191,9 @@ this exception is rarely necessary, and therefore it is discouraged,
>>>   but nevertheless it is used in a few places.
>>>   
>>>   For regions that "have no owner" (NULL is passed at creation time), the
>>> -machine object is actually used as the owner.  Since instance_finalize is
>>> -never called for the machine object, you must never call object_unparent
>>> -on regions that have no owner, unless they are aliases or containers.
>>> +machine object is actually used as the owner.  You must never call
>>> +object_unparent on regions that have no owner, unless they are aliases
>>> +or containers.
>>
>> This looks like a completely separate change.  So we start to allow
>> machines to be finalized now?  I'm not familiar with machine object
>> lifecycles.  Maybe split it out even if it's true?

I intended to remove phrase "since instance_finalize is never called for 
the machine object" because whether instance_finalize is called or not 
is no longer relevant, and thus object_unparent is always prohibited, 
whether regions have owners or not, unless they are aliases or containers.

The statement still mentions "regions that have no owner"; the 
restriction of object_unparent is enforced whether the regions have 
owners, so it is a bit misleading.

> 
> I didn't see anything elsewhere.  If you agree with above, I can queue this
> series with above touched up, then no need to repost.

I guess I will rewrite this patch, restoring the VFIOQuirk example, and 
re-check if this whole section is structured logically and consistently.

Regards,
Akihiko Odaki

