Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5403532445
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336197.560524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAl-0004Df-2B; Tue, 24 May 2022 07:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336197.560524; Tue, 24 May 2022 07:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAk-00048a-SD; Tue, 24 May 2022 07:41:42 +0000
Received: by outflank-mailman (input) for mailman id 336197;
 Tue, 24 May 2022 07:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntP6v-0003DA-0x
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2522fdc-db2e-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 08:58:15 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-eXmNr-YEO1OhbWO6T4u9GA-1; Tue, 24 May 2022 08:58:12 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7633.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 06:58:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 06:58:10 +0000
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
X-Inumbo-ID: e2522fdc-db2e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653375495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iry2ScJHFHGazf7Zegk+CDHfc4Vr4GlJWSfF8kTN5fI=;
	b=OTkfKZAtyWgMWobmht7/t2Y4zhhYIvO2Wx8EVHFwtxEhJS86g9UzixuumkfWAgDqXI57IT
	JDU9Gr10BScDZtpWqvlcZYmgxCDYSHkq1b1hjz44m4zh8hiVDhGl26W1gQHSXUMvsSCOtt
	qUG6rEL77ElFddiF/gnDmBLhbiEEtoM=
X-MC-Unique: eXmNr-YEO1OhbWO6T4u9GA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYh3a3TZM0+sliuyNdqpcdQ779YLQ6gID35Lx+IWKOwBKQKoz/3Uc+vgMI+teN2MAwEbV9cHPBzrXNJ2zYN9+fAu9j4uCTQhw7MvUqkyYK+Td8t3LAdFTQLK0t28E4Tnm7UoZ5lrPVQMyiXdCbSwlWijUHEvxZg7hm/5i+rY6n7+gUORisBFmnrP9/2q7oak0wZVjH3hg9eT3iieSj1OlwGcFVnIdD5odj+E67ZKmhl4c/oslaaGzwrMEJ0Ik5pTICc8khSqnlTB2ssdAhSZHiGh8Kpmi98FOSNEZhNrIQv4qjlPrQrLtek8UWcxvj1xmpea1fJfxwaqGiizpb58+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzPQLR2jxPKcOw2m44MccYVdL5mUZ6h1/S/n0FIIsro=;
 b=UJxbtDZ3a7x45bq1qJ0vebB789vofgrBEW6B2zEEI3tCkaas6Ins9VA1KEyhpe1+iOJtj1CGodCObqKMl1KUdTvuHJphV2YxSdQ4gHMKPg5kjDeyMrGoRsWBhMjnHg31S0Shj8we8bb3uz9H/cK806WTLQYYbuCQM+0KUNBVqjo1a54Vwie4RFCVn5C3ajUK/qaVoe57nE1QF9AhPPYD23ok6sygGQ+fe3gpAxJW+QLZcWiGZGRVaBkTjrP1g2DqPUx5v8vAXCA4onV5CdxAky+VnOrM+zl//9aPymXE+AwTUS4Ptkmyv+hwunknzwbJGAGF5zi5iN3YgJlD899fYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75055009-5053-0d4f-9174-3dd69add7c8a@suse.com>
Date: Tue, 24 May 2022 08:58:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Content-Language: en-US
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
 <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
 <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <7312f3ee-bd0e-9183-922d-c9c82cd003db@suse.com>
 <SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <SJ0PR03MB5405B465EDA6717EF1F83A9B9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23008568-d23a-4b91-fe9f-08da3d52c370
X-MS-TrafficTypeDiagnostic: AM9PR04MB7633:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB76334099FCF7E25E01869726B3D79@AM9PR04MB7633.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J/1lmYo9xP8aGRSGU83P2O8txWRAcHzI+I1sINKkGMOKeoCiUclHL1BUhdNEyyL9Z/gxXF2EKxDhXZ1kiNukETM1IKh3I1QJ29uAqarw0qXl/NaguuMOxm2dckQQ469tmGsf1Ws+bayqF2k+83eAM8ATacPJy6YITCytHwg99KP/GwpWHRxZpCZnkjR+wWf+aqr1bqBpfm6+uBnbAebQECSD18LXIY+htMB5a6VsTp4H1geAUt1ia9q8NAg7OMmDgWIPm9zp2unPL3b2Py2cY7R0sAydFGlSb5q4zDis1v4OTx1slDUQVfCBPjYkTQDvPEAoM4KK4XEpgi4Tb0QJKjXFmgX8pI/tvYrLi16YjnKyz01I/lXhXm3aBOoj5Liqv4F6BuKSkEr+U0jQtFfcZP0rHeURQQiKEDqAhgHEWnnBEc/jWT8+HF/7zxgRKRmG68W4w2hvInhKm+bD69dqYGTIpbA8bwiVNylSTGCKn1FW2KiLqweUFClIUIe/EyyFMRUOwxX4VUDwcLIO6+tcvhij8uuTyX98TqS3Cfe03X2CkoE/7mvoMw6dIj6d6cXbRIN3GjgPIJpJkcJKWTbyP2rINQljEBC89a3SeWIQNfDcCjylPG2DW1P6IxU3txAc0+SahxTi2H9LwmSolRhLyWGH7NMK2JzooyecSUis5jBFNSMMAafSGn/0+HaaGauTxHF4UvhUX9TF9urrQpzJNNhlFKEcRtI2Q4gqjlJBSpe0RqISkU+Yb8xsPRw1uXv2c1ubVa0KexOMY9GilITyYXJbTBhjrPmjDDC1JfVI3Lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(86362001)(6512007)(8936002)(53546011)(6486002)(186003)(6506007)(508600001)(31686004)(2906002)(38100700002)(5660300002)(66946007)(4326008)(2616005)(8676002)(26005)(316002)(6916009)(66476007)(66556008)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EXbtl324+CVr9koHHHr5hW8kD/xZn2FHXGoWIXbutpHPGdNxN/xmjlCYSX9V?=
 =?us-ascii?Q?zBDarjYUKTQ0lOMdyD53ivRrQlzg/VkOyItw+NXeAqRsb5AzkcFWSh0E6cZ4?=
 =?us-ascii?Q?eIasHYP8mdAGxtrxrmTSyztDuMegzpocqg3hDrEic1fASQ5fOqg/vuVuorFs?=
 =?us-ascii?Q?c9nJuiSnBPdsTCgrGvk7Iduc3z2ILnoa8HCJkG9Ow+DYk5ZzH3hbx+vtqZKQ?=
 =?us-ascii?Q?hI8RdcG0WbM6E5dUBK2FxXgF+lKQzc0msCYvMjamStC7hI5GIInIjr92QQZw?=
 =?us-ascii?Q?EWNmkv8NwzM7LJNU6EdSwNqBeaFbWExkNEGo6RtP0kZVhBqgCHob96fXHLRH?=
 =?us-ascii?Q?PxSsGToHrxEHEpFPFGhEm9pGnTQibcLYwzCvKK6kV/cMlcvQngjeylMvtwM2?=
 =?us-ascii?Q?I5wuxu/MvhE8dcY5hrjwjc1toG/KMOeJe9hD13YiH7dQrcWXcUT0c6vhZBAX?=
 =?us-ascii?Q?a0RyUAcJ9k/U7HZ6NoQxZDi6dtlp5D6Oi6ylG2bIX57CFH02DEEu+wuDQ966?=
 =?us-ascii?Q?HLiJw+TJBMDjKFB5lKdbbsvmviiW0o5y0RHrqOqmavDxz0Pl/nc6k2dKBPcF?=
 =?us-ascii?Q?iKtUANOBLPds06swCyDtdChrJr7KsqkFRIGTWV4QyseQtGg5ffVNhnckXOvD?=
 =?us-ascii?Q?VJhavNaPcYTgLro9/f0CypTBll5SchbpTNmAD86+PhF83LyV8G7VN6S2ARi8?=
 =?us-ascii?Q?JQptQEYwHhIJ7jwbLM+p/Zy30EQpQVEx28W6nvaJUmb7S1YqDV/29PyWJork?=
 =?us-ascii?Q?CJ1ZcMvXHaEwDywSfnGWbKpJYYEjMxTIEFXGbFZDen8ZLSBJoS3YGraYdkHy?=
 =?us-ascii?Q?NA8rBQGnbRdZR6Jh6aBI5JubRZULO7wemys9NPgHoO4lpIVz+EkzK+s8PN2z?=
 =?us-ascii?Q?6y64TC5WAV0bmsbkJ4wQLTpBtgXws5OjM40I1XQcj3hX7Iq6ugLbv3/kv80B?=
 =?us-ascii?Q?zkj+1QU+7DlPxERVjXClAkB8L1LIxIMdRcm6v+pQBfNaUdnWGozOuYA/bMCu?=
 =?us-ascii?Q?9mtSJ07EpbqkKrBemXIt1sx7eaQzTDFzkb4qOzEVovZMkk/DbFqkjTqe0Ju2?=
 =?us-ascii?Q?UY6yzKKKcp6VJQ6hxycAOWfV7OtKT+6hCWUIXtOI5xGehj4OY2RY478RNY5i?=
 =?us-ascii?Q?cUfJeuGky+nZNOw2O6/UeAux0uA000zm+nvv9l6jeOzd+4zdMG0I5QNlD+UJ?=
 =?us-ascii?Q?5fltjCnN1dmKK0bfKQ/nht/CwkXwYOfmnEJcZLLp6XPUOHtUvqWcyo3ajblN?=
 =?us-ascii?Q?I9RBBdm5i/6sdRItl8Z8YGw+iakiUWirtGYynXiceu4zP9lJbSool/Nleqj/?=
 =?us-ascii?Q?ePC9AdGx3bd01Z37VB6NPEGIHZoyROETn1Z3uy19YV6WLKQAbWFxTu0Q1lk9?=
 =?us-ascii?Q?VGSAtr3MY73+1Xy8yWOTyXwXHy2Sn/u13ECyfcPkBPGuYLl7qdcnWFqeGJrU?=
 =?us-ascii?Q?v7nz9JPJGI3sFJrTsbh2rC28Cee9L6JHjsmDrnHic3q10l0t99BChq5bJRIb?=
 =?us-ascii?Q?Qw+7RTWYIXZ/8OsXNxgJC0/9KO0Kwfkj/Ucyb0Ozc1LlMuJxJmXKkJ+S4117?=
 =?us-ascii?Q?Jpfx2Ot/jFKRkojiy+CuPgpOSlwjfCyIuV+R+/vO0ljU0X1rHP+wFv3WWEw4?=
 =?us-ascii?Q?NNbZBMY3t3igY4mCnoUuAjg80fBb5L9n8GoxeG0nKK/F9+SgWSC0ZbzWKmci?=
 =?us-ascii?Q?noBJ+p+5kDeEUXxqfMFC0uOSwR9fu94eC5Vis6XQ/mHakkxM7Y2r4KSxzouD?=
 =?us-ascii?Q?Mgab9vYE2g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23008568-d23a-4b91-fe9f-08da3d52c370
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 06:58:10.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaN6puyJxgP1ysU//pBZcMaXx/aMUqxb7fRwrlnTSwNm59ID/gRT8cY9DLNr2kYopILVGvIP0bVUv/RqvkkFUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7633

On 24.05.2022 08:52, Lin Liu =EF=BC=88=E5=88=98=E6=9E=97=EF=BC=89 wrote:
>>> On 23.05.2022 11:52, Lin Liu wrote:
>>>>> --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>>>> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>>>> @@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)
>>>>>        return cpu_to_le32(*p);
>>>>>  }
>>>>>
>>>>> +static inline u32 le32_to_cpu(u32 val)
>>>>> +{
>>>>> +   return le32_to_cpup((const u32 *)&val);
>>>>> +}
>>>>
>>>> Why the cast? And why not uint32_t?
>>>>
>>>> Jan
>>>
>>> le32_to_cpup has following prototye and definition
>>>
>>> static inline u32 le32_to_cpup(const u32 *p)
>>> {
>>>         return cpu_to_le32(*p);
>>> }
>>>
>>> xg_dom_decompress_unsafe_xz.c redefine and use u32, use u32 to keep con=
sistent
>>> typedef uint32_t u32;
>>
>> This answers neither part of my question. For u32 vs uint32_t, please
>> also see ./CODING_STYLE.
>=20
> Type cast is unnecessary, will be removed in next version of patch
> CODING_STYLE encourage uint32_t instead of u32,
> However, Current xg_dom_decompress_unsafe_xz.c already use u32 instead of=
 unit32_t, so I
> use u32 to keep censistent, otherwise, the code look strange

Strange or not, that's the only way to phase out certain things without
using gigantic patches / series touching the entire tree at one time.
New code should not use these deprecated (for our purposes) types
anymore. Note how the file you adjust here already has to introduce
these type aliases for things to build. These typedefs really want to
go away, and any new use of those types is another hindrance in doing
so.

Jan


