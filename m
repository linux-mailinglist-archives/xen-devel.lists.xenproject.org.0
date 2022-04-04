Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E64F1424
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298299.508112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLJQ-0001VU-MG; Mon, 04 Apr 2022 11:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298299.508112; Mon, 04 Apr 2022 11:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbLJQ-0001Rz-IU; Mon, 04 Apr 2022 11:56:00 +0000
Received: by outflank-mailman (input) for mailman id 298299;
 Mon, 04 Apr 2022 11:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbLJP-0001Rs-9G
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:55:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3059ee67-b40e-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 13:55:57 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-F8UEe_AhOnWjy6dbOy1VCQ-1; Mon, 04 Apr 2022 13:55:56 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4677.eurprd04.prod.outlook.com (2603:10a6:20b:25::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 11:55:55 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 11:55:55 +0000
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
X-Inumbo-ID: 3059ee67-b40e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649073357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJXYG/9gRpsvS/cHvl/2KW38Pb4LJYO3r15BpS2DGPY=;
	b=VPabioAgk8s0mLawM09YyaQgHPW4Y+UqpOiaLwUZkh/EEzEc1ImtO86lb/3/oed0GtfODY
	zGWbOBRn7z91O3kP9Y0ISpNcPNpQcPQsL4Osqy2PX50cLROHhlkrbLjJmiYrdPQhhyGi75
	JueH5SblmQ9izjaCSw22QUO7DCfbiCo=
X-MC-Unique: F8UEe_AhOnWjy6dbOy1VCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/Jgdma9NP7/q/DqSOFU5bh6bOT1DTpocqCzuOiR6VUHYXO7gl24CT4uREtaurG9FhXZWQY6HsxtyrPnMzgkQ/O1TErrUJZJItb4Ee2T2J4VNaoW5kfoVyleokntyh5u5BOPNy4Ub8QvoyEfzFbKTecY41s2NdiGlEwkJ5CeVbqpxqwpJAKhShhLP1EFupMw9g7OW/mq1AyJTw3dAeJ/B7uwLf+cw3tRJysHXBDoncmLm6O7GHz8r0swCQWSKxgkOCgUoxaqY3jfdWxjMveRiTuCMoRZUxvofABkEok8lz6ebjpaxBe6pPNux2L2O1w4QmG/0rTeKvbFPxvdXnFhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCKvEFJvw+lpfdXbT+KPfCyUEtPemYHb6h5cHDSCVDY=;
 b=GfIBFM6h8olQ+HvWFxF6hCzjLLO6APHh67m0TyKDMAUDHBb/bE9Iu3zUoA341bRAh4lFvbcegyzQPepMEU7eBKBbY4dQAiTu4/0RrXmJ3lgciYRugp3i0AfdW7q7DtvwFKcgUFSYCmtjo5ei6MpoUqCTTLMgG2c/Dwq/6hUsDcm+CKd1hQ6CbbuBePW3NKVFvKQ2YMIq+KJU+dBGmKtV70WMkXCJf7l6PPEggnLUE7EYyN2Fm8j+4Z0SKVnXbW6p8bcGlSSys/qy9lNmn2YNCiW4PVRJs+DiQOQb7KzG8wXJgtHZzXFJzDvvR+joosbQTRY5g897E1Y9/r0o5ERDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95654e26-160e-8664-23c6-ad5e4c87f444@suse.com>
Date: Mon, 4 Apr 2022 13:55:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/4] x86/APIC: calibrate against platform timer when
 possible
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <37ee7fe7-1218-7fa3-bc29-0fb45389bf75@suse.com>
 <YkrapvsmmjcZkwSj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkrapvsmmjcZkwSj@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ff960f0-828e-4a16-8a5e-08da16321376
X-MS-TrafficTypeDiagnostic: AM6PR04MB4677:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4677A6AD37C49F6AEED2E0DEB3E59@AM6PR04MB4677.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c3/5z0aZ6WZ/VSWEziaHk0ysAQW1CS8QD05MQgz5wbcQ86lqfhvuCYObZSbAMUrXdfKj2dLz49IKTwc+Rc7q98o4/QJva1cZ30PoywYV4jJddIU905GkOqVLAwZeojUO6ghMjrjEb9v6XqN2G53+U1hFbhnEplKTRPf4qUYdpFC7Mh3oJAyLKlKMhkoDMz96/4PloDWTo+8xvk/GBx5Hgs79vN2SYkvpKe4DBWVypRzAwJYgX0EMtb+kDfYNNsdX9I5wXkFFxa64AR65okj+NOvX8HyDmziCWEOgFoPbXDIcE779h+AjQ3SqIgW1LzHh2f45J0WyzINO0Wk5//JbVGxywm+k0roan8FnFoCsyyO0gim3Jv6nHa4DNOKyaNYvjFJJ32luFUrX38O7Fq6vGyyxq+6I4hEj0EyQ7EhS3ezumAercD6vnBOntkO/GTInLhg0exI+oZC/hrLVoZoUrGXzoyuvvW+AXj2i34iHcc5x3OfNzig3qR9pEi05KNyd1idxeIpJNiiRq0VTkYHe/acp7P/+OYFNnkiGRqC7hFifBj4GNu+G2BZ8wt1f6XeWZmwAaRVqFXRLk73WAn5p4wCKRe4T4ugEzqyD0NF02HZid3SJEQVTJyo7gvEFDSz18frQyis2pfZBdJ9t9dzC5Ma7tw8bW4nXkrLsGeh0T7p3NFN/UgSuvsH+HClEdqMOLr4EhcMlZi8fXzpL+AH6Y87H8+iJ+qkhChdaURG4g1o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(5660300002)(38100700002)(66476007)(66556008)(66946007)(8676002)(4326008)(2906002)(8936002)(31686004)(6512007)(31696002)(2616005)(36756003)(6506007)(86362001)(83380400001)(6916009)(54906003)(316002)(186003)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IdePypfwG/Og3VMq5DP8YtMk+7xdd0JGhJ0dBL9/kxU5khP1UhnOfBRZFlJq?=
 =?us-ascii?Q?KPHPRKA85nfL2CeYeoMEuH3GcTvwd85rdcGq8AjCf24SgRuEnI7Zd+eanV92?=
 =?us-ascii?Q?1un5TvzNN1XS1nWBty8HLXgmshD652EUoKQmZ9FDeuT/I218UUoNJJESITMS?=
 =?us-ascii?Q?WMiEkqX6kvQ+/0gPbstr7dsAFIHMlarxstUDbi1xXo9+jCQbYvyQhdmJJpAR?=
 =?us-ascii?Q?VXCzU0G3QaJBbWCLHBym1HUrAusj7N9cW4w+pHPxGDKwV+wARNVzksCjxB6g?=
 =?us-ascii?Q?uG8CoZrihFpM2ZTdZwSDyWqHJ3fTZIj6Nm0DYDHFZRkjN2Wm2Iv7bW58Fd3z?=
 =?us-ascii?Q?06lLYWuIrzrGc8ikRusEE+asYVXsiJ5Q+rFdd5HPCC6OW2jlAkZGS3/sLt4H?=
 =?us-ascii?Q?7XzHX464Ksmts2tKeLnxCwX3TWPJmrkyNZt5ivaH3HkO/SNxqJ9xImLZIUJ/?=
 =?us-ascii?Q?Vt5NW/CoEpNZ9/AUaGaKZwZsvdCXAgnJ76xW0eW997VltJeQ6sqy4CLgPLJJ?=
 =?us-ascii?Q?/dcJh+ElhrFuQQdhsCrpZy/gn1KUUMRbVAhzQX1wacB5QkhgbNcGRp7pmItB?=
 =?us-ascii?Q?zPddcK8ePHY89UUoPoq5zwp26V+VggLkHHT5E3fpqAk9cLRAGyazoWMwgN+T?=
 =?us-ascii?Q?6Y+9G/a4cNpvzko2DmawgBsVeYT9Mt6xK0OUnOIf10ztwSSkmfVssZmb8QeU?=
 =?us-ascii?Q?KCXrTRhgQQI/eS9OwJkgXY6EGrvXLJidYewG2CHctryrh+TSVz8XgR7O/2O/?=
 =?us-ascii?Q?yRgnmKrhTZsfrit/xU9s4OvoFvjWWIZyF0NPrwzimOp2IrfrlxGHtimpv8c7?=
 =?us-ascii?Q?/pNYWEcSTMtJSECVFXlqRDd0aNvt+PHpA1gDCRgcyfj/og4OqQxmuuAQelfw?=
 =?us-ascii?Q?JrJTygsOE5U+nIXA9xYxRLUEaUYSh7EaKQqIHi93/1YHoyNNhfR0sY0nKHD2?=
 =?us-ascii?Q?/b+J6Qgfq3QFDpLdhAU6cBeiQjWKwO1/inrOz3HP9VdJHJFDEovMhhiPGLnM?=
 =?us-ascii?Q?VcuA9DLd7PAOrx9lNjL/MR5DCTdEfisAYwde//IevwXUuac4Ywi0FoRYHK4r?=
 =?us-ascii?Q?xf32JujudiQVcoxLinKifMfzoRhX155NkGydJK7lM0Z2R7GgVk6bnDF6Q4o1?=
 =?us-ascii?Q?ki/bEC4AjsUSM7XWGVL/nwRkcNbVTWcQKz1hzr2UK0KgTfHVd7tjF2kXamsu?=
 =?us-ascii?Q?yaix61fJVzgSxgfYM7eBsxRYB8QEnEspl4l+FjneAvPVM+SO49gg1rxzBeWv?=
 =?us-ascii?Q?pEkWyQFVVjbFZxr0S4o+eerT6ieWKaKaWq4akiQnE0I1gjZITtXpMZpU5hh8?=
 =?us-ascii?Q?UtKXm72I4Og7IqtlVUMVN/1CH1+BOoh7z/Ec+EATPMCve/kZw/h+TAyJg4Hp?=
 =?us-ascii?Q?WmNHtNsJzrY0QcXeVVbIGH1/9CqteqUeHyY2/Sh2sIEC1anRjsGyNM0YCUaF?=
 =?us-ascii?Q?dttr//Y4PPwqlRsgsjprXL7oQ6NktF8Get8bLXuXLSQPU4IuM4EfYxqX/Uws?=
 =?us-ascii?Q?F48tCfoqN9QG7aZudHMvr8ZZnFXVKFUaQG5vHG/YFsQdpJqicDnMh3VNbZwS?=
 =?us-ascii?Q?tLQ80yLWKaVaF35EYfOtSbgZsnoMjM0S8WZOb/JwRPiCg2CQbMb/qoeD9hJt?=
 =?us-ascii?Q?76oSrlHyp1JhTUedFDrehwClXICEBLU2KTL1PQj8z2wuAmFshj+7jHE7mAFX?=
 =?us-ascii?Q?XDeFAKl1u+QT8dB0x/JX6W4k9z52sfe0Qxi/DMhmt5J1bDzFHR/UbdABqILk?=
 =?us-ascii?Q?QjMV85G14Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff960f0-828e-4a16-8a5e-08da16321376
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 11:55:55.8151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eiwYE0oqGsZ4u/1PtvNFXDWMARBBptBSDG6zS+ktW8/4MsjlDAd8fgQDTz3MDxG2CnA8XrDD4enzClJ2Hbqaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4677

On 04.04.2022 13:46, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 11:29:44AM +0200, Jan Beulich wrote:
>> +uint64_t __init calibrate_apic_timer(void)
>> +{
>> +    uint32_t start, end;
>> +    uint64_t count =3D read_pt_and_tmcct(&start), elapsed;
>> +    uint64_t target =3D CALIBRATE_VALUE(plt_src.frequency), actual;
>> +    uint64_t mask =3D (uint64_t)~0 >> (64 - plt_src.counter_bits);
>> +
>> +    /*
>> +     * PIT cannot be used here as it requires the timer interrupt to ma=
intain
>> +     * its 32-bit software counter, yet here we run with IRQs disabled.
>> +     */
>> +    if ( using_pit )
>> +        return 0;
>> +
>> +    while ( ((plt_src.read_counter() - count) & mask) < target )
>> +        continue;
>> +
>> +    actual =3D read_pt_and_tmcct(&end) - count;
>=20
> Don't you need to apply the pt mask here?

Oh, yes, of course. I guess I did clone an earlier mistake from
calibrate_tsc().

>> +    elapsed =3D start - end;
>> +
>> +    if ( likely(actual > target) )
>> +    {
>> +        /* See the comment in calibrate_tsc(). */
>=20
> I would maybe add that the counters used here might have > 32 bits,
> and hence we need to trim the values for muldiv64 to scale properly.

Sure - I've added "But first scale down values to actually fit
muldiv64()'s input range."

Jan


