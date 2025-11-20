Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E0C7602C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167724.1493950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA5j-0006og-AI; Thu, 20 Nov 2025 19:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167724.1493950; Thu, 20 Nov 2025 19:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMA5j-0006nD-7P; Thu, 20 Nov 2025 19:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1167724;
 Thu, 20 Nov 2025 19:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r49+=54=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1vMA5h-0006n7-46
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:13:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e0eb95-c644-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:13:09 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-FjAiVakzPqqK6eg0tFZr0Q-1; Thu,
 20 Nov 2025 14:13:03 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CF1531800370; Thu, 20 Nov 2025 19:12:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A99730044DC; Thu, 20 Nov 2025 19:12:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 214AA21E6A27; Thu, 20 Nov 2025 20:12:54 +0100 (CET)
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
X-Inumbo-ID: f2e0eb95-c644-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763665988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jlhMzPTHuX4cLpmrLyGntMkPW4ErwgtosCfiUCW5AfA=;
	b=F1nCmebA+9OheAbQqnWMAVA73WRPBFfGA2+xaBb9qSZaZHW+B6Ss25Cr4qgbo5u/nr3ki8
	vDC94+VjtmfGmZazKhr63O9a9lFXhxpCYXGtxsFtzD5/sc1NuqMdERkuJOjgeuYVdIIEC9
	t7vR+gTSX2CBbbND82BfuDKdQb6KKVQ=
X-MC-Unique: FjAiVakzPqqK6eg0tFZr0Q-1
X-Mimecast-MFC-AGG-ID: FjAiVakzPqqK6eg0tFZr0Q_1763665980
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
  qemu-devel@nongnu.org,  kwolf@redhat.com,  hreitz@redhat.com,
  mst@redhat.com,  imammedo@redhat.com,  anisinha@redhat.com,
  gengdongjiu1@gmail.com,  peter.maydell@linaro.org,
  alistair@alistair23.me,  edgar.iglesias@gmail.com,  npiggin@gmail.com,
  harshpb@linux.ibm.com,  palmer@dabbelt.com,  liwei1518@gmail.com,
  zhiwei_liu@linux.alibaba.com,  sstabellini@kernel.org,
  anthony@xenproject.org,  paul@xen.org,  berrange@redhat.com,
  peterx@redhat.com,  farosas@suse.de,  eblake@redhat.com,
  vsementsov@yandex-team.ru,  eduardo@habkost.net,
  marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
  zhao1.liu@intel.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
  qemu-ppc@nongnu.org,  qemu-riscv@nongnu.org,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
In-Reply-To: <072c1f11-1bb4-6f19-f847-e4ba07c148c3@eik.bme.hu> (BALATON
	Zoltan's message of "Thu, 20 Nov 2025 13:55:13 +0100 (CET)")
References: <20251119130855.105479-1-armbru@redhat.com>
	<20251119130855.105479-2-armbru@redhat.com>
	<4fb0a736-4450-47c0-9f9e-6cb86a3b28ea@ventanamicro.com>
	<072c1f11-1bb4-6f19-f847-e4ba07c148c3@eik.bme.hu>
Date: Thu, 20 Nov 2025 20:12:54 +0100
Message-ID: <873468tt55.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Thu, 20 Nov 2025, Daniel Henrique Barboza wrote:
>> On 11/19/25 10:08 AM, Markus Armbruster wrote:
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>
>> Nice cleanup
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

[...]

>>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>>> index b0bab3fe00..8531e1d121 100644
>>> --- a/hw/riscv/spike.c
>>> +++ b/hw/riscv/spike.c
>>> @@ -180,15 +180,7 @@ static void create_fdt(SpikeState *s, const 
>>> MemMapEntry *memmap,
>>>     static bool spike_test_elf_image(char *filename)
>>>   {
>>> -    Error *err = NULL;
>>> -
>>> -    load_elf_hdr(filename, NULL, NULL, &err);
>>> -    if (err) {
>>> -        error_free(err);
>>> -        return false;
>>> -    } else {
>>> -        return true;
>>> -    }
>>> +    return load_elf_hdr(filename, NULL, NULL, NULL);
>
> Does it worth to keep this function or could just be inlined at the two 
> callers now that it's equivalent with load_elf_hdr?

Palmer, Alistair, Daniel, got a preference?


