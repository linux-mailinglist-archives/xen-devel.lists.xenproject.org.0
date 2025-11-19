Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72A2C70BEF
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166327.1492898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnc0-0007li-4i; Wed, 19 Nov 2025 19:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166327.1492898; Wed, 19 Nov 2025 19:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnc0-0007jO-0Y; Wed, 19 Nov 2025 19:13:04 +0000
Received: by outflank-mailman (input) for mailman id 1166327;
 Wed, 19 Nov 2025 19:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aBqX=53=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vLnby-0007Pd-NM
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:13:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c44940d8-c57b-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 20:13:02 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-ZZ9ZNeNsM7mLeavDfCwX8g-1; Wed,
 19 Nov 2025 14:12:56 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0EC18180034A; Wed, 19 Nov 2025 19:12:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B313C180047F; Wed, 19 Nov 2025 19:12:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3478021E6A27; Wed, 19 Nov 2025 20:12:47 +0100 (CET)
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
X-Inumbo-ID: c44940d8-c57b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763579581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40h3XLj9+PQ9YtwgX30Ek+MMJ2QDdr/Ci5vXiZEsl2A=;
	b=PIbfsttwP8VK0U/cN/MVh0Vb1Qxv+glISjeLh+HpvbiqV/SVNV1cmyqMqd3bVv4YiDpIQj
	7wCVR4ZCQSw14fxPlZ5an6o8thBg2DcmGbD6OkMuAhg4ErO88oftqsuvTTm7RozuhFWVFN
	ZhRsZQ+v4pFRP3C9OMB8VRVbe4h9OsQ=
X-MC-Unique: ZZ9ZNeNsM7mLeavDfCwX8g-1
X-Mimecast-MFC-AGG-ID: ZZ9ZNeNsM7mLeavDfCwX8g_1763579572
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
  mst@redhat.com,  imammedo@redhat.com,  anisinha@redhat.com,
  gengdongjiu1@gmail.com,  peter.maydell@linaro.org,
  alistair@alistair23.me,  edgar.iglesias@gmail.com,  npiggin@gmail.com,
  harshpb@linux.ibm.com,  palmer@dabbelt.com,  liwei1518@gmail.com,
  dbarboza@ventanamicro.com,  zhiwei_liu@linux.alibaba.com,
  sstabellini@kernel.org,  anthony@xenproject.org,  paul@xen.org,
  berrange@redhat.com,  peterx@redhat.com,  farosas@suse.de,
  eblake@redhat.com,  eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
  philmd@linaro.org,  wangyanan55@huawei.com,  zhao1.liu@intel.com,
  qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
  qemu-riscv@nongnu.org,  xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
In-Reply-To: <bf44d9cd-806a-4d2c-8cff-0a88222959ed@yandex-team.ru> (Vladimir
	Sementsov-Ogievskiy's message of "Wed, 19 Nov 2025 19:34:26 +0300")
References: <20251119130855.105479-1-armbru@redhat.com>
	<20251119130855.105479-2-armbru@redhat.com>
	<bf44d9cd-806a-4d2c-8cff-0a88222959ed@yandex-team.ru>
Date: Wed, 19 Nov 2025 20:12:47 +0100
Message-ID: <875xb5x2ds.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 19.11.25 16:08, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>> ---
>>   include/hw/loader.h |  4 +++-
>>   hw/arm/boot.c       |  6 +-----
>>   hw/core/loader.c    |  8 ++++++--
>>   hw/riscv/spike.c    | 10 +---------
>>   4 files changed, 11 insertions(+), 17 deletions(-)
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
>
> I don't really care, but IMO, it's obvious contract for bool+errp functions, not worth a comment.

Nearby function comments all have a "Returns" sentence.  I try to blend
in :)

>>    */
>> -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>>     ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
>>                     bool big_endian, hwaddr target_page_size);


