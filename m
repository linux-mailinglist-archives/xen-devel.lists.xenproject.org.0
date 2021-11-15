Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB545094D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 17:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225978.390365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmeYg-0006Gd-Tq; Mon, 15 Nov 2021 16:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225978.390365; Mon, 15 Nov 2021 16:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmeYg-0006Dh-Pr; Mon, 15 Nov 2021 16:10:14 +0000
Received: by outflank-mailman (input) for mailman id 225978;
 Mon, 15 Nov 2021 16:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmeYf-0006Db-Hj
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 16:10:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ee72c9-462e-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 17:10:12 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-wkGY3610Oq6xc7SbUED1ag-1; Mon, 15 Nov 2021 17:10:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 16:10:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 16:10:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0083.eurprd06.prod.outlook.com (2603:10a6:206::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Mon, 15 Nov 2021 16:10:06 +0000
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
X-Inumbo-ID: 82ee72c9-462e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636992612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2ePv1dQPrUKoLEBGyiBuw2ymgv8S8QG/NdKTdBe19U=;
	b=mF8uhlW8E+yvezoEkxzLWBsgTzgE/ox5QUDaX+6P/XTDLyX9DI3+bf0z/IkoTgYhs/S9mR
	1J7G0hYbkPx5pWd5MWyCoVAaNcKQ8QKEGrj24GUD6rZUVZVDCZKgxCRlpCXrNgsciouXGC
	Dp9pwfq7C8C5gz/u0v67OdvJ0u1bmT4=
X-MC-Unique: wkGY3610Oq6xc7SbUED1ag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOnevryD0BMGdz3rfxylIbRtX7TkTtkQWwaFYxq5+JcIEobaXA/emR6a8p6xeoMm/TXBP67lr73jrXMozwOJketpSlesjfSLk7X00aQRHwzbKVIMB14yYQl8fFG8LQ1O0Y4LYwCU8z4seLdWfuG47Wsj2huNZpQRy0DM3N0dFh2t1GSygCPuRw2jxtZ4lhSynNBUuRUVrpsIUgCtOAaYa+vgQpTRIPN1Wd7cL/XqQzGERQn8cqNEiWnmn7J1kM2duBnOskWqSt2sgvSlPiZNRtSm8FqFm3cChv6eId4+czjx7z3QKjubve4gByeYf3hUqPWABAcpgvD2duYauEhpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ2LRa313G6SYGy7AlhOjdMZRKIzHVzHTVxnnFJlevg=;
 b=QpFh2Qt4f7lYE8mq/xgNF3pPouk9z/edqwFHrZIEZG6dyC70B90X98koYLF6JFO82YNtmawwRI+fSKrx5l3lnOC8xI6GyYV5C50oQ0/EULDqa83NrmuPyKwAr34plEd6bmBpY9H8dnnUQNnuomKQh0ZQ7AqRWibVTY3k7deIGNtSWIhvYH5JHu2ErK45Ck7ga2z0JcXCBLBZLC3pbSrcyNpbKnO68Po6odjdlyWXfilMTK7ic2tqgGqkCzB9VG0E467SAnKYNvVwVf1eWmpgFpPSRoiw5JSnTokW5J6vOZ7GMphqeRfBhV8I8Ei0aSsePwbEppJ+YCZsa1x7XJz3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c15a5af-9ada-1f99-e728-8e6af22a9b92@suse.com>
Date: Mon, 15 Nov 2021 17:10:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2.2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <b752a000-f69c-ad21-d059-90e12fc83553@suse.com>
 <YZJ3y56FFerUa0gu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZJ3y56FFerUa0gu@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be837f5-81d5-4194-7ed4-08d9a8526403
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260722574A60CCFB2E02E561B3989@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IIElWc2g5Gu9jBl7CVCyRVUul90KsKSgIsCmqvNi5cqzQlrgKVlfUP+HhQDyE19lYZizU4OziOxRGytpFnevcLJAd6cd6xhK5TumHkFvYChw5d7HzZ++P2rH+SQRMelU7w5uWwxxmWU/ZdFU0VIO/LXweHhiyga+RlWSV90qmG2sjTHzsLJo4SGeYrO3um32LU5gUKTtPxrvhZsTPGD71w8joLuosy7FYA09c+IhnAeCtvd5JQ+lRCt3+dVHIAwVeMCP5tej5O5HZasASUgI2HYauoNr2vE0uNqOUVBDO8FaKhhs2tzSWCbeaZnBeqYCnCRGxpg76MQQH2TiMWepcv2wXLgtanSLRCzFaNZzXl4IpmWh3VG3SfEFuQeY1QdV35Os4EJoQlOmaj9LfwKKCeVM5+yuuZTmzkR80qqIuveXOLZEMr5tRCWMZpj5ojGfWQRGg9GyVb9nVKI1NfIW5qnHYO8s9snHRN5EXxQQAN04MwNIpBhYFUKkr6gtccf4timPlSd7uhvznAECrIk8DQj3yyb642R/Uk5uZI0r3Yp8CKC55aJvWs8PvJF+QUfWdNkN+Lj74Tq57Q5bXrkKmBoqE14yxNS/mCPpKoWtAL3Vu2O2i7NMZOEKIbfnoT5e/F0Aur7A5mmXqW2M8gecI981NbgW81yw23wh7L7Ihr9uZd9eHtudcScNqRN3BrzZGUfWTCq4yE1HXx9UsyXJs2uwTgaLGC1WiUrG9p8Mdno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(186003)(4326008)(53546011)(316002)(16576012)(83380400001)(6916009)(2616005)(54906003)(36756003)(956004)(38100700002)(66556008)(86362001)(5660300002)(26005)(8676002)(66476007)(31696002)(508600001)(31686004)(2906002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MiO9ZuuYNSiUp2pZBWAPtcWS8I4EahURlXbZ+QTpL0riJBH+4oLOoIudEdM3?=
 =?us-ascii?Q?BqYwrXyRmcNDQq1OSj7Nm8g1ybNTZI73txc+u0QzLQDlLMB7N5pFJ7aZykDs?=
 =?us-ascii?Q?AsCX2zytmjHil26z6jPdnK03M+55DMpiPR0JIQza6ZZng1bKYll+jMEPZEGS?=
 =?us-ascii?Q?exuNHMelLwuBM2V037ZQQ2PW18lkNA9uC29dKdpNHfLOcLDz6HTdG5C9oOow?=
 =?us-ascii?Q?joLG8qhVru/OPhS1EABdShBxC55+yRMv7BIo+6wmTZbKtQvSEV3gB43f3OkH?=
 =?us-ascii?Q?4out1BezvtupVL9HC+0TtaQL+/rEcy9R7Z1Sl23V0zaKZbzmYXzfo2bgL1jp?=
 =?us-ascii?Q?y8G9f8BQZ74JRY2Z8IsVl7OOQpqmbuBHW7RHkZ1hIqJZtDAthc7tiIG7hiRr?=
 =?us-ascii?Q?75jiYatleCgeGsf002ic3Am+RSN9uPk9mvZUc15Ya1Bq+e5Zl+/0G9tx7Wgd?=
 =?us-ascii?Q?zlFUs5IBwg85FqJmYgyCxONqVrXx/e2WCWWvmVndD1MkvY029szBYjppVMPY?=
 =?us-ascii?Q?a3OUiURH4xCnccjS8fw+zTfe2AOuqxFLb19DtKMUQpoM7DXIr7QZIWzXy2cw?=
 =?us-ascii?Q?FIykTD063Xy+9sY0OiCYovFNmjYjwH5EBKd7K/ey+YJEhKbmVgVtSALw7TtT?=
 =?us-ascii?Q?guX3wRVczyRho/NN1yViMQEKGfffhvWR8xcDTbwp85AF9dyLSa2ncRP/XxD7?=
 =?us-ascii?Q?rUqR6wDmttWt/qA6EI4rwLjGaekeW9nsnwf2i5n9rNIHynezWtre2SKfxROM?=
 =?us-ascii?Q?p8t6AfjD+TERZOHknA2cmXK3jccxMM/lODt/uOpiSYILGM25dO2bH76p5D1X?=
 =?us-ascii?Q?qCLbXQeu+01ZtFDs9HP+J1dGCbVADi05/gTT4TUJlz1IV6F1fXNavrmplAtO?=
 =?us-ascii?Q?2EQJ4Lw+xfWwHRBa70U7/MrYvJ8TIHQNawTVuUSdoCQGKl7bP/MhpjiG4VEz?=
 =?us-ascii?Q?CGjTTnIPYwNrtzQJi/RzCmlXZ6snMwkmpoouTanRzBImG4kSnBDqqIex4s1N?=
 =?us-ascii?Q?M/tedpY/RErMZYWSYxO2UJCj63MaIxxNQCr+UfLmFwPSHlCrcB4hOdD43KRu?=
 =?us-ascii?Q?0c6DFho+qX+vSfC+MmxG238L0cfFZ94D3v/bLzgBzgan9r0D86QX6Fd2GpoM?=
 =?us-ascii?Q?qNqvZevgnbAy9ZkUTk05kKoAzMQlGt1cdtWSvAC98t/TMJ7YWa1J/tt0QAuU?=
 =?us-ascii?Q?nR9nvoYpFpdLay6dqkZb7CTw1JbYlaIG38+QykzwbRO5f9+hFBsou1QCEc9l?=
 =?us-ascii?Q?0yjsuvFzN1cmkOC6wrOwfd6UyC73/s+NsESxh0xxg5x51JYLLft0xsj6tiC9?=
 =?us-ascii?Q?XljOAXfDuJf6ZZ9ZOsfyn+QIvdvFTq3jpU60r8Ab2Sj+sUGuX9GvYbtHJXXu?=
 =?us-ascii?Q?lvzNnI071tuZKQvw33uI4fE7mlwAJqitVy5RTxqqXhGroGWf92vpcKwj9tg/?=
 =?us-ascii?Q?G1+DfVIW4Nlzprtl+A9CJjLVx+XYHIa2/5gZKXc0zQ0XRFWVY7Doh+XPQOrD?=
 =?us-ascii?Q?YFcj4H3GZx4reMc9/wGtuvGJbHuRuHCtTlSuQCWa0KPUBnfqmmRZT+t3mkB0?=
 =?us-ascii?Q?C96FmTdqdjaKKQmVcdsHgV4npk+2UgsKHdisy8wzB20jptk0tMcaydMZVWHk?=
 =?us-ascii?Q?Mdvi0iCCT3/OzGwIGItrueg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be837f5-81d5-4194-7ed4-08d9a8526403
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 16:10:06.9660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzgsUpD/+tHm72KV/crA4iwiBDbYRMb6hXvfoF5FM0KSVoiKchflhOLRFoqfl2I/SE8xiA16wBCIhzAqlae2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 15.11.2021 16:07, Roger Pau Monn=C3=A9 wrote:
> On Mon, Nov 15, 2021 at 03:31:39PM +0100, Jan Beulich wrote:
>> While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
>> when ACPI tables are missing") deals with apic_x2apic_probe() as called
>> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
>> affected: The call needs to occur after acpi_iommu_init(), such that
>> iommu_intremap getting disabled there can be properly taken into account
>> by apic_x2apic_probe().
>>
>> Note that, for the time being (further cleanup patches following),
>> reversing the order of the calls to generic_apic_probe() and
>> acpi_boot_init() is not an option:
>> - acpi_process_madt() calls clustered_apic_check() and hence relies on
>>   genapic to have got filled before,
>> - generic_bigsmp_probe() (called from acpi_process_madt()) needs to
>>   occur after generic_apic_probe(),
>> - acpi_parse_madt() (called from acpi_process_madt()) calls
>>   acpi_madt_oem_check(), which wants to be after generic_apic_probe().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1700,15 +1700,30 @@ void __init noreturn __start_xen(unsigne
>> =20
>>      dmi_scan_machine();
>> =20
>> -    generic_apic_probe();
>> -
>>      mmio_ro_ranges =3D rangeset_new(NULL, "r/o mmio ranges",
>>                                    RANGESETF_prettyprint_hex);
>> =20
>>      xsm_multiboot_init(module_map, mbi);
>> =20
>> +    /*
>> +     * IOMMU-related ACPI table parsing may require some of the system =
domains
>> +     * to be usable.
>=20
> I would be a bit more specific and likely add "...to be usable in
> order to hide IOMMU PCI devices.".

Hmm, not sure. I did specifically leave out the "why" part, as dom_io
might also become required for something. If you nevertheless think
I should extend the comment, then I'd insist on using "e.g." just
like I did in the comment next to the call to generic_apic_probe().

Jan


