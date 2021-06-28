Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463283B5A75
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 10:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147742.272627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxmbH-00011N-3V; Mon, 28 Jun 2021 08:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147742.272627; Mon, 28 Jun 2021 08:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxmbG-0000yw-Vn; Mon, 28 Jun 2021 08:26:38 +0000
Received: by outflank-mailman (input) for mailman id 147742;
 Mon, 28 Jun 2021 08:26:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxmbF-0000yq-QL
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 08:26:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f81786c-0c53-4e63-8c21-c7052a706459;
 Mon, 28 Jun 2021 08:26:36 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-myO3LV2lNrCMqW0lg1dlKw-1; Mon, 28 Jun 2021 10:26:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 08:26:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 08:26:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0106.eurprd07.prod.outlook.com (2603:10a6:207:7::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Mon, 28 Jun 2021 08:26:30 +0000
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
X-Inumbo-ID: 5f81786c-0c53-4e63-8c21-c7052a706459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624868795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7lK0AxLZewWyTrw7vkCgAyGbnK77VPY5Cdn6nedg3Q=;
	b=BtYmj4UUicNT2Ks/OJTuaiBQvMFRlpaWf5whCcy2nj611A4nkXmQftuurdGs7Tzw8zNM8d
	022GufEnc58zLwQWe2SvCvYRGZ6lQ5WABOx5Y444unq0UG7KnLeWTw3+USztlBBmWhYfg/
	X2lc6ge9zLTRn+xDjlRWP7Wi2hPeEKA=
X-MC-Unique: myO3LV2lNrCMqW0lg1dlKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVn2xdUXLC+ZBtz7WknD49TPvXrnJMd2YbE7WrqdYtmJDFLwk9QVoHJlCoAJWMtGS3DEcNixSQUtik904Fp9DRHBgGQWXurJjnFFwoI+yzCUXaf31WopMFPRUC8Mt9yN0oWqyW2deUvQqS4mW1rLapVb2NsUDIqEuBk+hR7ZB2fUNYXY0xy3jgkkVr114wLYDt23NDKZTy9BDCRu+HNqyjdGZWp+y0vj4gDEJC9/I2ElAdMJwYrb5OQsctPy68z9FflFaJG65pJ3p6i3lQ14gU22XFifibAWTJTYk59MVq4JTYFOopviUlTlyA/gZ4ukNMR2GFKDxjHN9xkxU66+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxLzyCEHDHA3/Ym7Xddqw9HTbN/RxvULE1e9RfZ/EXI=;
 b=MOu4+7kYd6wd6SuSinaK+J9hBq7mnmWFL6e9ZjPROsWBcDymAk3FYBgMBkXl8k2cQDpNyp8o3RE0uzYJAGpaOtezuKJSJ1vd97hPCO/GhtubWEup777Vb2OJKzOWKCOWaxH9yxLYwD73Uypg9jOeyqSSEpIxpLBRWPuTsM+uoPvbeVPTJzQgyHc/OQstQyCvql2iTT0zW/PPoIG7QZUnYm2zsdZAUVysJtfGNjiXDIHXrQiKK7LGgdaoOMb1wvC5EjOdskesFOEeBw8FwJ9UjpVScQesHLZepcvNNieK3pO7xBQ/AmgzVIBGvnIw6PK1O7Q1KcMV6OYgSEeF+4LB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 03/12] libxenguest: short-circuit "all-dirty" handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <55875a26-7f1d-a6d9-9384-b03b3b2cb86d@suse.com>
 <60be051f-7751-f15d-ae4d-2c7e9af82693@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f85ee373-b497-549b-242f-0dd9eda1b4cd@suse.com>
Date: Mon, 28 Jun 2021 10:26:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <60be051f-7751-f15d-ae4d-2c7e9af82693@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR07CA0106.eurprd07.prod.outlook.com
 (2603:10a6:207:7::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf905386-ede4-45be-0edc-08d93a0e6ea8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260727C9DDACF68960089313B3039@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	45g0wgzR8yDY8DNA13dxEKet45IFm/S+NQU90pv+d9p7p5YlIYs/yTiXYsM+ykZf1V2jzcJnWIqq0t03gfVMd0+LYIeS55U8meiNWGwk1cvvyt0Zt07lG3qvxP6F9fNXeuutUliMhkI48ffeqZgDCoJP0kqgvx1fRgaeWrPiZPWvEeAA4EYkLN7Kvgjc0pgQbOeJSRnXvVo8NsjMg3IjstmNTF9h5RwQjOVt4Ze5zVq3x6jivzUFVLCyzWb3WATfZEjGNq3DnWG49FkomsNQbkYRoe+IQdBYnLTobCh0CywOafofCO9J+pWbRqZCxOb5eXNPPEJUNi1ci4SzWWkLSYLWXej8FElBEQLke/2PYkDRVd1ho7JSjtjCMLjoPPZoxbRlj199BF+niGoxHLVpiP81zhKw4cHIsWRzNyQB/5PgPMWy/11Nt5wnXEtvQEHMJZvrAkdspTmiFTB2LBRhBCVAJZp1fL1fq2rVXtfeMncStFFnSbZ0AtDuKjtf4gbZhtLYwUqe7nr6MqZXMbjuxaxt0k8VhQS1OxxE0L2+R6CFM4WJSt72VJuLFLl+S3febSBlASnkHa/YxTgN7gHN9iqO8MnDzUCm1+jJ5xRXRI9IaEE7unM+EiabLg2tSvept0b53iZFhRkermTJLIXfoDJA8pnGFCX4gNWteB+t/aE5S0LssYk2porxKPlRzlAzJ5oq0m17/uJ3Csl8I7zSxD3R3Obuw1qpnGz/9V5y6g4BMnqfVNKRVABxmePaD8m2auMmwI8qrrIM0+EC8mpzyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(39850400004)(346002)(396003)(16576012)(6486002)(54906003)(316002)(83380400001)(478600001)(956004)(8676002)(6916009)(2616005)(5660300002)(31696002)(2906002)(38100700002)(4326008)(86362001)(36756003)(66476007)(66946007)(16526019)(53546011)(186003)(26005)(8936002)(66556008)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6o+n+7WxKRsryqlIsK23SYvBKdradNddKok9eBo+dpKBPuygByowH6VXny5?=
 =?us-ascii?Q?76vQrsOAJFi1vIorgWT16p/KquHq+/AFxLiPbAxuUXRYH6N5rhj5auct+zWT?=
 =?us-ascii?Q?sFN92FvS47GB+7gEzIF20TW4eQIAeX3nLoaioeC3Ao8uUAHm/OxtGq4BAXJc?=
 =?us-ascii?Q?a7wUvZ5xPi2eVYpD4FLKZcTSZ0HWOnTohjl4UzIFnaYPcqKu89oP9GPtjw+W?=
 =?us-ascii?Q?pPwdRcBQLeBB/4UGkeZICP2InXxKKgSDH2EtOKUQrmRtJD8FFCPau4Xf7bVw?=
 =?us-ascii?Q?hQHmi3ncJCCwYIaiCNz08NR710aBfe9wnuo0m426nJW11mSLOSh6IeWBfFKG?=
 =?us-ascii?Q?dtJoI5dGsVRr1/RaIs3QnwkXQPc9qMBtdaPbJY6L7xh2Scim9RJvfyhxcu93?=
 =?us-ascii?Q?wxPIzOarGwWKFX6VCf+GM8pMIVt2A5yJd9EeFzkMqB2kSiP2j1UfAmRJ/5x4?=
 =?us-ascii?Q?npTakiTgtUn5G9icxw/Cm+ItXYIX4tcQ7PCiCPDH0socsRaMGPKBG8GTyNB/?=
 =?us-ascii?Q?52LayyZZTzaIoJpKeHmf6O+oOaqpGeKLN905rGr16LkhLEBX0mtx+61YDlIy?=
 =?us-ascii?Q?N8wasxw9PhjIVm1uoO+w3UsI8n4KzG5p0z4sCu/1fYKToAzZOBjO5OqwFJlx?=
 =?us-ascii?Q?ixjfaw6rkFnEIM+rWiw6TKFKVOB410o+SU9KrBHE+ie+7Q+SeixjUioVUEOi?=
 =?us-ascii?Q?9vh2G1G2/EStLQlVQ+bhla/6+cDcbDyp3O8chT0bdkxqsqLS5rDSpxlDKUoa?=
 =?us-ascii?Q?NE6bzOY+gb7pHawX0m/UImFPDSIVtPqoFUv6reUX+QoZlXnx3VvWJtlpBCKh?=
 =?us-ascii?Q?VdD4ONgPFnyyAvrxIZFWTR32N3u38w8LL1h0/+zUboqO2gXDjMTPJmdA1PJv?=
 =?us-ascii?Q?4ienVcaLG4qiOcimJJle2CLJEL9hQwV4K8iEU+24FOmapxA66gQVMp2Ml1YT?=
 =?us-ascii?Q?9j1L1SI0tQHzP0aq+9z51bmHQAV/GUNNT+z6qUpKPbv03BXrW6yWnkhAAlom?=
 =?us-ascii?Q?UAVKsFjh/0WDLR9adU+TuBGTvpH0Whl0wMreNAD4AkRa/wHu0mEUMwIIjNxp?=
 =?us-ascii?Q?lnaUvlo08VeD0zj90WR/W9IPkH17fECtl6bve86dcPfDCPenecmvISr3M6tN?=
 =?us-ascii?Q?l4uktv7X6FEzwR0Lpy7Ca4oNQsow6yLuRkfgOqm7dAbJBTiec+Vsti04n7CW?=
 =?us-ascii?Q?/Acc7wz/hQf3Zoq7RR4WITwJWvEsl7+/Xi+0USr94BhOKJqA/0yfR9JJSsMA?=
 =?us-ascii?Q?FpSL4oyreK+NA8+segl/T+pKGOfrv043n6pd579r1RFI46wp4h4F7q/iMrMf?=
 =?us-ascii?Q?m4kw2BAEzLoENmtiEx9OXnv0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf905386-ede4-45be-0edc-08d93a0e6ea8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 08:26:31.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLri8TCB4ym5scjjpk3UYoqHZJpOvkVtHXVw3rK4ifeKkAXV1EL7aPZJuZtKLXydXOlzW2NO2iodT0Jjf1Vxtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 25.06.2021 19:02, Andrew Cooper wrote:
> On 25/06/2021 14:18, Jan Beulich wrote:
>> For one it is unnecessary to fill a perhaps large chunk of memory with
>> all ones. Add a new parameter to send_dirty_pages() for callers to
>> indicate so.
>>
>> Then it is further unnecessary to allocate the dirty bitmap altogether
>> when all that's ever going to happen is a single all-dirty run.
>=20
> The allocation is deliberate, and does want to stay where it is IMO.
>=20
> Single all-dirty runs are a debugging technique only.=C2=A0 All productio=
n
> cases are live, and you don't want to fail midway through because a
> late, large, memory allocation failed.

I'm afraid I don't understand: I don't move _when_ the allocation
occurs; I only suppress the allocation (altogether) when the allocated
memory remains unused.

> As for the send_{dirty,all}_pages() split, that was deliberate to keep
> the logic simple.=C2=A0 The logdirty bitmap is tiny (in comparison to oth=
er
> structures) outside of artificial cases like this.
>=20
> What you've done with this change is rendered send_all_pages()
> redundant, but not actually taken it out of the code, thereby
> complicating it.=C2=A0 At the moment, this doesn't look to be an improvem=
ent.

I view the remaining send_all_pages() as similarly useful (or not) as
e.g. send_domain_memory_checkpointed() (being merely a wrapper around
suspend_and_send_dirty()).

>> @@ -807,8 +798,11 @@ static int setup(struct xc_sr_context *c
>>      if ( rc )
>>          goto err;
>> =20
>> -    dirty_bitmap =3D xc_hypercall_buffer_alloc_pages(
>> -        xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
>> +    dirty_bitmap =3D ctx->save.live || ctx->stream_type !=3D XC_STREAM_=
PLAIN
>> +        ? xc_hypercall_buffer_alloc_pages(
>> +              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size=
)))
>> +        : (void *)-1L;
>=20
> This is a pointer loaded with a timebomb, which doesn't trigger NULL
> pointer checks, and for which {set,clear}_bit(dirty_bitmap, large_pfn)
> won't fault and will instead corrupt random areas of the address space.

Yeah, this isn't very nice, and gets done away with again in a later
patch. I'd prefer to keep it like it is (assuming the later change
will also go in), but if really deemed necessary I can move that code
re-arrangement here, such that the use of (void *)-1L wouldn't be
necessary anymore. (You may have noticed that all I did this for is
to be able to pass the !dirty_bitmap later in the function, and that
I deliberately only update the local variable, not the hbuf, making
pretty certain that this pointer isn't going to be de-referenced.)

Jan


