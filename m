Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF0778C1B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 12:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582375.912118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUPRJ-0004ZF-PN; Fri, 11 Aug 2023 10:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582375.912118; Fri, 11 Aug 2023 10:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUPRJ-0004Vt-M8; Fri, 11 Aug 2023 10:32:17 +0000
Received: by outflank-mailman (input) for mailman id 582375;
 Fri, 11 Aug 2023 10:32:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUPRI-0004Vn-Nc
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 10:32:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUPRH-00084u-Ie; Fri, 11 Aug 2023 10:32:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUPRH-0002MW-Bn; Fri, 11 Aug 2023 10:32:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ktTYnxaJliQmP6svwaLVJ0Ml4z0+NKivmbjfpX2UNjg=; b=wS0bj8eDd1I8kpL3ndrziL62KM
	fiQmnYd7K8Yy7bc979XbOiQlYTjA7IguhY9Rq/b1fXWhvOs7imx8xUBgY1B6pGru29WjXIQBrdBBk
	gKvNdaADgUCROotrzLY00gOwmbo63wKImfL+ThxcjWiCkNNPUGdvE76TAxLVbb1Q2Zcw=;
Message-ID: <63f1ba1f-05ec-4400-9804-43948989d550@xen.org>
Date: Fri, 11 Aug 2023 11:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach for
 HVM domain
Content-Language: en-GB
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
 <CAKf6xpvLtOTH-WVz8B6df=WF5M=Cng8BBWTvOOJ3C1N8QbqWWA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAKf6xpvLtOTH-WVz8B6df=WF5M=Cng8BBWTvOOJ3C1N8QbqWWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 10/08/2023 21:02, Jason Andryuk wrote:
> On Wed, Aug 9, 2023 at 6:34 AM Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
>> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
>> the permissions are only revoked for non-HVM domain (see do_pci_remove()).
>>
>> This means that HVM domains will be left with extra permissions. While
>> this look bad on the paper, the IRQ permissions should be revoked
>> when the Device Model call xc_physdev_unmap_pirq() and such domain
>> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
>> be done by a Device Model.
>>
>> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
>> doesn't have support for HVM/PVH stubdomain).
>>
>> For PV/PVH stubdomain, the permission are properly revoked, so there is
>> no security concern.
>>
>> This leaves dom0. There are two cases:
>>    1) Privileged: Anyone gaining access to the Device Model would already
>>       have large control on the host.
>>    2) Deprivileged: PCI passthrough require PHYSDEV operations which
>>       are not accessible when the Device Model is restricted.
>>
>> So overall, it is believed that the extra permissions cannot be exploited.
>>
>> Rework the code so the permissions are all removed for HVM domains.
>> This needs to happen after the QEMU has detached the device. So
>> the revocation is now moved in a separate function which is called
>> from pci_remove_detached().
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks for the review!

> 
> With one suggestion below
> 
>> ---
>>
>> TODO: I am getting a bit confused with the async work in libxl. I am
>> not entirely sure whether pci_remove_detached() is the correct place
>> to revoke.
> 
> I think the location is fine.
> 
>> TODO: For HVM, we are now getting the following error on detach:
>> libxl: error: libxl_pci.c:2009:pci_revoke_permissions: Domain 3:xc_physdev_unmap_pirq irq=23: Invalid argument
>>
>> This is because the IRQ was unmapped by QEMU. It doesn't feel
>> right to skip the call. So maybe we can ignore the error?
> 
> Sounds reasonable.  Would be better if we could clearly differentiate
> between QEMU already unmapped and some other EINVAL error.

The only way I could think is to have a distinct errno in Xen to 
indicate the PIRQ is not mapped. CCing the x86 maintainers to check if 
they would be ok with that.

> 
>> ---
>>   tools/libs/light/libxl_pci.c | 142 ++++++++++++++++++++---------------
>>   1 file changed, 80 insertions(+), 62 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>> index 7f5f170e6eb0..f5a4b88eb2c0 100644
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -1943,6 +1943,79 @@ static void pci_remove_stubdom_done(libxl__egc *egc,
>>   static void pci_remove_done(libxl__egc *egc,
>>       pci_remove_state *prs, int rc);
>>
>> +static void pci_revoke_permissions(libxl__egc *egc, pci_remove_state *prs)
>> +{
>> +    STATE_AO_GC(prs->aodev->ao);
>> +    libxl_ctx *ctx = libxl__gc_owner(gc);
>> +    const libxl_device_pci *pci = &prs->pci;
>> +    const char *sysfs_path;
>> +    uint32_t domid = prs->domid;
>> +    FILE *f;
>> +    unsigned int start = 0, end = 0, flags = 0, size = 0;
> 
> These variables ...
> 
>> +    int irq = 0;
>> +    int i, rc;
>> +
>> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource",
>> +                           pci->domain, pci->bus, pci->dev, pci->func);
>> +
>> +    f = fopen(sysfs_path, "r");
>> +    if (f == NULL) {
>> +        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
>> +        goto skip_bar;
>> +    }
>> +
>> +    for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
> 
> ... could move into the loop here.

You are right. I will respin the patch with this change and whatever we 
decide for the unmap error.

Cheers,

-- 
Julien Grall

