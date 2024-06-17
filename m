Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263E90AF8C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:37:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742285.1149051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCXA-000492-5i; Mon, 17 Jun 2024 13:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742285.1149051; Mon, 17 Jun 2024 13:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCXA-00046A-2M; Mon, 17 Jun 2024 13:36:32 +0000
Received: by outflank-mailman (input) for mailman id 742285;
 Mon, 17 Jun 2024 13:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TOf=NT=bounce.vates.tech=bounce-md_30504962.66703bdb.v1-596ddebcd27e4a80866745c63510b597@srs-se1.protection.inumbo.net>)
 id 1sJCX8-000464-FW
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:36:30 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 991a80fa-2cae-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 15:36:28 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4W2rWb0ZFYzCf9KH4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 13:36:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 596ddebcd27e4a80866745c63510b597; Mon, 17 Jun 2024 13:36:27 +0000
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
X-Inumbo-ID: 991a80fa-2cae-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718631387; x=1718891887;
	bh=ANoB2hVLGG/+0YUoUyUuDSxhyaDSfD0W7DFkZ5zOFpI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WV7YF7M8wSLvI1P7Rwq1vgjWkhIOQD+PDZtKFfG+2thNNZeoDgBMzEDSJ5kpzXTpx
	 4Pc8KI3BLOGx/MkgGyNCuiwYiOSQmbcpwo6NP1zX9qtWpp/5TicGsuJ+0CZexP5tAj
	 BHAwIrphRTaSBqMAxwsL80/tZO1dQ/sQNyoKmuXOcSgX7RufGEiW/m3AH+u918yTaL
	 Xj2dHQeYRN8mQQ9d7i9gcC5GgImQOL81vQ1wpZsJ6FIWAe4M8Jvg5J4Y1YKI9jJzTg
	 WVDpIr3WmKg+BWOLwa3m7zE1bVJz1W0Pm3pxwRH66ShuJlTJuNKOKHTZdsNf394iSr
	 zCPXUsTqxROeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718631387; x=1718891887; i=teddy.astie@vates.tech;
	bh=ANoB2hVLGG/+0YUoUyUuDSxhyaDSfD0W7DFkZ5zOFpI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vZYWjYSF7bPtrzdw7uEFljrrEWqYsXzWG1x/bq5zkvfGbs1lewOxLqFD5EnHS3Yhg
	 92lhKeshbjIUZrSaSGvl0iLvTkyo/TypSCJp6pNJg9/wbOcUziSt6b9Mt3GbnF+eJ3
	 /ItfQxxwqpy2qHyYDAgFTLzQC47rzcI2q3h2Dub++8NYiccaPOimS77Rvrnx7RjNkR
	 cKHO9IhQaGTIKACjwpUVWGph4Kz/LIhueO399QXzUPFDON48RbBQQO3X/fAVNS8fxc
	 7aU1MqwVwWztIyx/RnV2u+y60FoleBV7FEDA13BruCfMAkypLeYhT3qTrEaxXtQ3dA
	 o/G8tkfC6PmXw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20iommu/xen:=20Add=20Xen=20PV-IOMMU=20driver?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718631384460
Message-Id: <eceaa7e7-d07f-4a41-b39a-0b32be6724ae@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org, iommu@lists.linux.dev
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech> <8b0151a8-2293-409a-8469-d9e73cf561a3@suse.com>
In-Reply-To: <8b0151a8-2293-409a-8469-d9e73cf561a3@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.596ddebcd27e4a80866745c63510b597?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240617:md
Date: Mon, 17 Jun 2024 13:36:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 13/06/2024 =C3=A0 16:32, Jan Beulich a =C3=A9crit=C2=A0:
> On 13.06.2024 15:50, Teddy Astie wrote:
>> @@ -214,6 +215,38 @@ struct xen_add_to_physmap_range {
>>   };
>>   DEFINE_GUEST_HANDLE_STRUCT(xen_add_to_physmap_range);
>>   
>> +/*
>> + * With some legacy devices, certain guest-physical addresses cannot sa=
fely
>> + * be used for other purposes, e.g. to map guest RAM.  This hypercall
>> + * enumerates those regions so the toolstack can avoid using them.
>> + */
>> +#define XENMEM_reserved_device_memory_map   27
>> +struct xen_reserved_device_memory {
>> +    xen_pfn_t start_pfn;
>> +    xen_ulong_t nr_pages;
>> +};
>> +DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory);
>> +
>> +struct xen_reserved_device_memory_map {
>> +#define XENMEM_RDM_ALL 1 /* Request all regions (ignore dev union). */
>> +    /* IN */
>> +    uint32_t flags;
>> +    /*
>> +     * IN/OUT
>> +     *
>> +     * Gets set to the required number of entries when too low,
>> +     * signaled by error code -ERANGE.
>> +     */
>> +    unsigned int nr_entries;
>> +    /* OUT */
>> +    GUEST_HANDLE(xen_reserved_device_memory) buffer;
>> +    /* IN */
>> +    union {
>> +        struct physdev_pci_device pci;
>> +    } dev;
>> +};
>> +DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory_map);
> 
> This is a tools-only (i.e. unstable) sub-function in Xen; even the commen=
t
> at the top says "toolstack". It is therefore not suitable for use in a
> kernel.
> 
IMO this comment actually describes how the toolstack uses the 
hypercall, but I don't think it is actually reserved for toolstack use.
Or maybe we should allow the kernel to use this hypercall as well.

>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> \ No newline at end of file
> 
> Nit: I'm pretty sure you want to avoid this.
> 
Indeed.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


