Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51A4AB7F6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 10:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266634.460339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0hd-0000f5-RX; Mon, 07 Feb 2022 09:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266634.460339; Mon, 07 Feb 2022 09:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH0hd-0000cS-Nv; Mon, 07 Feb 2022 09:52:57 +0000
Received: by outflank-mailman (input) for mailman id 266634;
 Mon, 07 Feb 2022 09:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH0hc-0000cK-II
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 09:52:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9191dcc-87fb-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 10:52:55 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-59Ph7fXENt-UfNEfK00QbA-1; Mon, 07 Feb 2022 10:52:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6166.eurprd04.prod.outlook.com (2603:10a6:20b:b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 09:52:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 09:52:53 +0000
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
X-Inumbo-ID: b9191dcc-87fb-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644227575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMF+NdZa3rhWgQA9szyZZhoiagBTVUgzEnIUFbf1G94=;
	b=XQml6ZQjXxK6Lr6IotUiFd/98jSbtvWdCu6F1u9Z6rkF6N17JzwEaVZz89blIyQf6KlSuR
	2blbVbCL8n+tLngK08BpEXgpZfHuvmLp8HGqheYI0iZuaQDqaNMDrTKrix3ALQC6bJVqx2
	d6Y5HkWiP4HcaKePN1lzOs6zryC/teg=
X-MC-Unique: 59Ph7fXENt-UfNEfK00QbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY0/f0n7b+1IYNutyR6QYvg//WqwUDJ3eI0ad+swcj4HPpj3t4mFaH+XrElfGeRoLDkU0ZmjuvxtKGSX7hxVVHsAiDd73gq7BJIPaVRUUiJpd4/+4TN9csODMp3+Ran8etggbeeAMpM6BKnIHDT770rXIfjP/pLgp0XWDCSz/pzDvYN3mx6MzWmYi/oTz7g31jWdsKGiZISYSi972Aeu5D8KVJpzApTiBgW3B37hhpr8G5rfgjBmGI0z9GQ3YXKX8IZw1J+yPIbwTg6G5/CDo9h08hzVIHBJn9Ur6zVdLfbASBrw91x6wxn7FKaZKd3NQ3AyCAp7EVXWMdax64SQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yld6LlMD3YNTlB7jKatulCSudWVWc+yVLJhJMQevo3Q=;
 b=hayKKoVThXUNebK7mskNXPygJ72UoaogP/nHnFN0FaI77RlBow0A8TxiShUjeKnEYXNCtrtYz/b1i0nmEeffagfoUcbk/K3gnzMDMqxveXB3w5crfoua+pbarNgV6dT6GcImGP1q5Jm3ILqgKTdjVS9ibu+lfn53b8XsRXqCBcnBDmPx+d4aXqYYWzXY/tl8qdteKMqjOg0UuCr1dYCb46RHckfVUtR6QkRnp4pnvxc30TXABTkAEXKOdsQLHqoAva26nKEyFaH2c12b2uXlLGcol/V4OYTz6Ca3tIPD7YOcgZM+sk9UDZaL6+ndtGi/qAjkggj7/c+rrUw5dKvIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c30f30d4-ac93-8b47-14df-2a5e64bf2487@suse.com>
Date: Mon, 7 Feb 2022 10:52:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dom0/pvh: fix processing softirqs during memory map
 population
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220205101806.35927-1-roger.pau@citrix.com>
 <10266b94-7399-2f76-24e8-57ac6a1ac258@suse.com>
 <YgDrhhiJsH3r1i5x@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgDrhhiJsH3r1i5x@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0040.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16adf07c-6c7c-4470-f864-08d9ea1f9bbe
X-MS-TrafficTypeDiagnostic: AM6PR04MB6166:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB61669DE454A0AA48404843DDB32C9@AM6PR04MB6166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QvLjIOelvfGn52rA5Fp9JqTUdX1g5KXPCt1uxjlJaQ2bNG+iE0Ki71HtsVpEsmrae3Y+6QEfv1cquOrmgvfI8EzrXhGniVrqHDJTTVri5BQUPPfSCwlSNu2OGNi8k+v/l8G867G8zPFEEjsT9ctDb+LeYAdrQTMRMMlG/HSQptWfe7vLknxLWM99MzKxBFLb+SKnt7C2qGkfjkFbyiw8K7SDmfVon3frjJpfZEbNlfGdqPnmE98nCSYSfKKfdGikfm0rv+rAAjZeEBCk2NM0Zi4zEP5/MWklOX3WjsyGSwcspE1aj/NTx8ZN451EVUiOQZva8d/FCP5zD95Wc0O0hwrACQGNIeAGnVePVr0fnnJwsoJZzWgwYchcI5fz+sUqDF/YAG/kD1h2IXcWZaaHgsZXD8znmI/s3VYZpXjXmP141Hj0pYU4NRA3obQHdk0s0yeFvr/R6q/BxEqg907+syVVkbv20WgXXbybma7716O8yjRQFOI8wnN0BJ2TyNkuZVh1vxNQkSVajiWgj+GAo8CpHKIovNq3vNdjCihwdJEkecIc+9yrlnF6X8wwMBa7vsRe63PNTA/41/xcos7tW+Ti6T6+SPhsGxPw4pv6EcgTPSMEiMLApIqDDs9WwlcIK+RW6dtwUsSO2j5ka/eHjRCVep67nS2kU/oxzfW49KS4LnSjnwRFa8dp3PCXDwutGG2vgmFMBMsJXNLPhT6lqHZEbBJuZztdniyYSBvHLXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(54906003)(38100700002)(8676002)(8936002)(4326008)(66476007)(66556008)(316002)(66946007)(6916009)(83380400001)(2906002)(5660300002)(6486002)(2616005)(31686004)(6506007)(6512007)(508600001)(53546011)(26005)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XkQRjJfN8qAetZPQlY62ZW2EG5FNBfFy4RzU22hH88qc4h43c1CFvM8gUX3C?=
 =?us-ascii?Q?JVhMh/gzF23Ycb51HEwy/dPKeS4cNSoTK/pGTJm7G4rtVwREgbDPPW86Mj8Z?=
 =?us-ascii?Q?rq6kWfV3JGMd++gFsVMQ8spXftsZCvgHF7jcBt+qp2SbY2eI7GdJhJduVpRd?=
 =?us-ascii?Q?nfFUEGat31gudWJ93DkI17WSAEqa5zuxpuJ2oo0HKcJ1b3K5IQ9Ulp9A8LyB?=
 =?us-ascii?Q?ToB+pTJAADpDu44J7ougpFat5VEjhgXgvdrUsBT231Xx3KxlSxGlp+Ekg6w2?=
 =?us-ascii?Q?Y5BytDReyt2EV1rGrVrTuyJrivWUtVUlhNGix98It3zr77ZycPIygV9Uo+ab?=
 =?us-ascii?Q?KsgRx1H8LI5dQL/LyN6DTbVK8duj6puZ7TOnMPVQ6t7Ewnv0owPxRiIfdrX0?=
 =?us-ascii?Q?jijqFZK4c+NKgIKo+LG/W/j5rjP3yS3uLhq09SsqV5Yk720aVFZqvZRujyb7?=
 =?us-ascii?Q?qKLOa713UIiTNHXu5OQk6116KS0Xqb916mbvCQ3gP+1VNBqU1j2KsA42A0cn?=
 =?us-ascii?Q?ceORRRktFlXdYGM71Axt0wLYgGcoae+NgRPpE+Af8G6857FBzIrHp7p4+dqB?=
 =?us-ascii?Q?RZGI7KdIJQysFnI8BxkXdnjCxm46sOnmSKwOfRmfTEGFFb5J1BPYZjBamdTq?=
 =?us-ascii?Q?UeSD7T9eKDhoNSmuQsoisrJNKnPlJ5+trXaG/+6uUBUOuSFN2fCf/YjJpHsn?=
 =?us-ascii?Q?mSwy2nplraKavekDKkMXxAWfajlysszyDOeIcPOfrE/U3iTCvbwdL80tRQJH?=
 =?us-ascii?Q?8Inu2nKRLsOJ2W1GWY/wG/y/MRIz6tZ3t4gbS0xM3k2nPPbl0rLAUKOy/BWD?=
 =?us-ascii?Q?CbKSOlmDdEC068Fdl852zJMQeikzelY+ZlR6pBM/KYgm74qT59gd65d2jorR?=
 =?us-ascii?Q?7ESmQFYZXVjiEvbbsuqB4m4YocpfDLID+NhMdMm3qjfMPohkN9f4WkfxRi/m?=
 =?us-ascii?Q?KxdBgWQGEaNsPE35Sbd4/nnLFuXRxLP4G/0UgCDy4ANXJ48YIBDUN8ppNB3X?=
 =?us-ascii?Q?W4UnppSadvs31GUEqS8TnkjqjTFYF5Omds5u8d6325FSTAwfiteVahbWBR9R?=
 =?us-ascii?Q?wsfO0kFnjKGx0OQ0s7NvHKv+UHcQt4YeZldd4vQSt7SGoryj3RrIoCRPgAOF?=
 =?us-ascii?Q?UBWuCSd4KwnAVHsJeKqgM5GgFafkmE51he91JWhPyl+a+zpbwUY5SMtHvKpK?=
 =?us-ascii?Q?QcquPsvNPkgiKpxcqm/VM0SXMR7/+fDUSZ2hJ+fthvRWQwDpljIG6h05dLMG?=
 =?us-ascii?Q?yIIYdF5G6oZb2VHlRL2vSqDnHpYa1Wq5rL1/kUTFdVs1FxWddTbk6kCSI0xD?=
 =?us-ascii?Q?g3eTqsfYDu29WsMm4YEbrZC9aXVpe1Pf45wspiU0PeBT+Cbz5hIswd44aHC+?=
 =?us-ascii?Q?508q0n5QeH+H2D5wxGWhUV4XGi7e47++MmIAqApTlZYSXQLEs3IF8nZkzAm4?=
 =?us-ascii?Q?RY6R1LW3Adx1D05D2vf6zNMJPemHj8yl/dE585pTLW6XhOMiq4U60z3D1owW?=
 =?us-ascii?Q?OaaYBgdq4WlnlrV4b4uWegI1Eq8t33UnmdQmFyZeobMtl2JHpc1+AjN+obWI?=
 =?us-ascii?Q?RK8bjNd7/xLlSRhnaueUY8Pi/dGpZ3ChIC6n6t8mAObsOq0lY0B1iZAH82k5?=
 =?us-ascii?Q?oJLffCPjGemKZ/6b47HTEKo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16adf07c-6c7c-4470-f864-08d9ea1f9bbe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 09:52:52.9380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZRiBd58CcVEyB8Hkw9sCweeDw6qUVyUAPqghqUKc0kzVfdReHUQCb/KEAL0fXD94DFL7ToyZJyxQmTroPIygA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6166

On 07.02.2022 10:51, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 07, 2022 at 09:21:11AM +0100, Jan Beulich wrote:
>> On 05.02.2022 11:18, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -186,7 +186,7 @@ static int __init pvh_populate_memory_range(struct =
domain *d,
>>>          start +=3D 1UL << order;
>>>          nr_pages -=3D 1UL << order;
>>>          order_stats[order]++;
>>> -        if ( (++i % MAP_MAX_ITER) =3D=3D 0 )
>>> +        if ( (i++ % MAP_MAX_ITER) =3D=3D 0 )
>>>              process_pending_softirqs();
>>>      }
>>
>> This way is perhaps easiest, so
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> but I'd like you to consider to avoid doing this on the first
>> iteration. How about keeping the code here as is, but instead
>> insert an invocation in the sole caller (and there unconditionally
>> at the end of every successful loop iteration)?
>=20
> In fact I was thinking that we should call process_pending_softirqs on
> every iteration: the calls to guest_physmap_add_page could use a 1G
> page order, so if not using sync-pt (at least until your series for
> IOMMU super-page support is committed) mapping a whole 1G page using
> 4K chunks on the IOMMU page-tables could be quite time consuming, and
> hence we would likely need to process softirqs on every iteration.

Good point; please do so.

Jan


