Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B10C740C0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167344.1493680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4C2-0005Hk-Qj; Thu, 20 Nov 2025 12:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167344.1493680; Thu, 20 Nov 2025 12:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM4C2-0005Fe-Nc; Thu, 20 Nov 2025 12:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1167344;
 Thu, 20 Nov 2025 12:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pFer=54=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1vM4C2-0005FV-11
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:55:22 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 293c4d61-c610-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:55:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 851795969FB;
 Thu, 20 Nov 2025 13:55:15 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by localhost (zero.eik.bme.hu [127.0.0.1]) (amavis, port 10028) with ESMTP
 id UFymzwfFm40x; Thu, 20 Nov 2025 13:55:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6C8115969F7; Thu, 20 Nov 2025 13:55:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 695685969FC;
 Thu, 20 Nov 2025 13:55:13 +0100 (CET)
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
X-Inumbo-ID: 293c4d61-c610-11f0-980a-7dc792cee155
X-Virus-Scanned: amavis at eik.bme.hu
Date: Thu, 20 Nov 2025 13:55:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
    kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com, imammedo@redhat.com, 
    anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org, 
    alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com, 
    harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com, 
    zhiwei_liu@linux.alibaba.com, sstabellini@kernel.org, 
    anthony@xenproject.org, paul@xen.org, berrange@redhat.com, 
    peterx@redhat.com, farosas@suse.de, eblake@redhat.com, 
    vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
    philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com, 
    qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
    qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
In-Reply-To: <4fb0a736-4450-47c0-9f9e-6cb86a3b28ea@ventanamicro.com>
Message-ID: <072c1f11-1bb4-6f19-f847-e4ba07c148c3@eik.bme.hu>
References: <20251119130855.105479-1-armbru@redhat.com> <20251119130855.105479-2-armbru@redhat.com> <4fb0a736-4450-47c0-9f9e-6cb86a3b28ea@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Thu, 20 Nov 2025, Daniel Henrique Barboza wrote:
> On 11/19/25 10:08 AM, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> Nice cleanup
>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
>>   include/hw/loader.h |  4 +++-
>>   hw/arm/boot.c       |  6 +-----
>>   hw/core/loader.c    |  8 ++++++--
>>   hw/riscv/spike.c    | 10 +---------
>>   4 files changed, 11 insertions(+), 17 deletions(-)
>> 
>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>> index d035e72748..6f91703503 100644
>> --- a/include/hw/loader.h
>> +++ b/include/hw/loader.h
>> @@ -188,8 +188,10 @@ ssize_t load_elf(const char *filename,
>>    *
>>    * Inspect an ELF file's header. Read its full header contents into a
>>    * buffer and/or determine if the ELF is 64bit.
>> + *
>> + * Returns true on success, false on failure.
>>    */
>> -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error 
>> **errp);
>> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error 
>> **errp);
>>     ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
>>                     bool big_endian, hwaddr target_page_size);
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index b91660208f..06b303aab8 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -766,16 +766,12 @@ static ssize_t arm_load_elf(struct arm_boot_info 
>> *info, uint64_t *pentry,
>>       int data_swab = 0;
>>       int elf_data_order;
>>       ssize_t ret;
>> -    Error *err = NULL;
>>   -
>> -    load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
>> -    if (err) {
>> +    if (!load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, 
>> NULL)) {
>>           /*
>>            * If the file is not an ELF file we silently return.
>>            * The caller will fall back to try other formats.
>>            */
>> -        error_free(err);
>>           return -1;
>>       }
>>   diff --git a/hw/core/loader.c b/hw/core/loader.c
>> index 590c5b02aa..10687fe1c8 100644
>> --- a/hw/core/loader.c
>> +++ b/hw/core/loader.c
>> @@ -364,8 +364,9 @@ const char *load_elf_strerror(ssize_t error)
>>       }
>>   }
>>   -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error 
>> **errp)
>> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error 
>> **errp)
>>   {
>> +    bool ok = false;
>>       int fd;
>>       uint8_t e_ident_local[EI_NIDENT];
>>       uint8_t *e_ident;
>> @@ -380,7 +381,7 @@ void load_elf_hdr(const char *filename, void *hdr, bool 
>> *is64, Error **errp)
>>       fd = open(filename, O_RDONLY | O_BINARY);
>>       if (fd < 0) {
>>           error_setg_errno(errp, errno, "Failed to open file: %s", 
>> filename);
>> -        return;
>> +        return false;
>>       }
>>       if (read(fd, hdr, EI_NIDENT) != EI_NIDENT) {
>>           error_setg_errno(errp, errno, "Failed to read file: %s", 
>> filename);
>> @@ -415,8 +416,11 @@ void load_elf_hdr(const char *filename, void *hdr, 
>> bool *is64, Error **errp)
>>           off += br;
>>       }
>>   +    ok = true;
>> +
>>   fail:
>>       close(fd);
>> +    return ok;
>>   }
>>     /* return < 0 if error, otherwise the number of bytes loaded in memory 
>> */
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index b0bab3fe00..8531e1d121 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -180,15 +180,7 @@ static void create_fdt(SpikeState *s, const 
>> MemMapEntry *memmap,
>>     static bool spike_test_elf_image(char *filename)
>>   {
>> -    Error *err = NULL;
>> -
>> -    load_elf_hdr(filename, NULL, NULL, &err);
>> -    if (err) {
>> -        error_free(err);
>> -        return false;
>> -    } else {
>> -        return true;
>> -    }
>> +    return load_elf_hdr(filename, NULL, NULL, NULL);

Does it worth to keep this function or could just be inlined at the two 
callers now that it's equivalent with load_elf_hdr?

Regards,
BALATON Zoltan

