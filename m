Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EAA473EEE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246447.425023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx3mR-0000rd-7W; Tue, 14 Dec 2021 09:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246447.425023; Tue, 14 Dec 2021 09:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx3mR-0000oV-4J; Tue, 14 Dec 2021 09:07:27 +0000
Received: by outflank-mailman (input) for mailman id 246447;
 Tue, 14 Dec 2021 09:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx3mQ-0000oP-3F
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:07:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28954da7-5cbd-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 10:07:05 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-vJVJJU29OQqPijsNKKTKbg-1; Tue, 14 Dec 2021 10:06:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 14 Dec
 2021 09:06:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:06:39 +0000
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
X-Inumbo-ID: 28954da7-5cbd-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639472804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7H66UQnWAlZBGEnJvWegVKQ00ZFuA9LYcIhMYt1cYGU=;
	b=DXJ7qX8mGVX/+DtG5y5MUO9uERDyDUa5U3s8jjhmNBwdJ/mK7gX9crO7QPYEWGAz28Ra85
	UEAFF+9xekLexGF3LlWQb3YZdwfhlmKiSLOOvqo2bjiICTzitx0wtPbiy+7eLGBumtvCOL
	Av7MhO8YWtg1tKN8WZN8RgGh1UP5jqQ=
X-MC-Unique: vJVJJU29OQqPijsNKKTKbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erNBjw3cmoh7bqg3JG/Emdkzp4AxtcJ+dZ0tnaZM1xPER3oq5s2C7l2VGPRYm8dTMv4zm224w39xfhDdotJTkp5XbW6Aot6qv+k7LGvFp00146Le9p3EN8tWpfZt7tvJ/9BSkrcUJsi47z7Wi9ljK36tFdh/+ocbNMmztJsl49fwhu3om6VHDN1Mr3EzUUR0qg41VKI4eiaH0whjyr14WZqvSwd3A0wmHO238Cyo6SNzNtQujThvbktztb+VMVnvtEzkjhuMJM7lD98lX+XybKgW6ibN11HROezmKf21P2gectU+GskPNrp/OpKzROR+nOQ+mdee/QC8tQPy4Fd54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUJO2ATnb/S47w7qGDSgAIqT00NDkfzbeWMH0qFrAzw=;
 b=l+X8iVB4mY4/rQLTTACqewdtkocGAamGfHw7JTrUiB+6j8XMrF2U9vtkC1x/qAq/72/a+lrI7uqKoLJlVf3Xziv2NEqpBUaJT/RtAFAKe5w5+Tq6a6+Yau+S+lckpJBw6LJuvh0FlbS5GHk3A6K145SWuZMKlUG0LeHzr7x+K6xjSdebd5isd2s4VWZg857rL5kyVCdJhp27EVYUYiqJT3LKcDGfBi6oyQ9eBHZ6TSIaD8/hQKhJCpjQ0Q4jI9Zl9ElM1gjpuLPdiUy1fDOn4Hu7L+1iNUz1ol63uhDVPFT3bvQf0fYVw+kKpVpP5PcnnCBVhzFQeYemCUpVJkM72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <612dc962-229c-f43e-abb3-fd460c1412b0@suse.com>
Date: Tue, 14 Dec 2021 10:06:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
 <Ybdg6/J6oUf/5hEH@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ybdg6/J6oUf/5hEH@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0063.eurprd06.prod.outlook.com
 (2603:10a6:206::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07851677-f927-42fe-0920-08d9bee10a21
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33900717DD9B630CF4A165FBB3759@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eDL2BLvT9/7kfXkTHtMBDAZi4ao1VCtF9hdwbbxI8ldycAvjcO+1vcYomNNWws9SmVzpmAUFR63tYyIbmbSSTphFnygZhcqsWjumpsrejaD+e7tq7nulpzi4zjtRi5MHj5vCOQFuRYnmTibdEV5KZMHqMbyoyRXDGlTqNn7sI1cQwqEvSh9CHE7l5JNYm5FT/PCmbUIHrPiRYSYMYJY+3LAGySQvWGTiF0SjhHOlqjwFZ1K7lnaXARjEHPq1Jsp5XFp/KvuSCNv9SaaOWNv0mCeT9U8oqMmeH3gCL2eOFyJ0NJHMKLfb/UXAy5DBg/COnNv50T7o5QbDbs5517wisAKspuxerep46bSSI332FFkIhbxyY9JDEX5W3N12LH83k6xxBFTFPc7GINWfeF+K9IPzYqjl010DGbTiyIVK2Q/oSqFQD51UYetKLjcgcx/rlAj3mJ3UN3A3DXkl2kdSZTT20TuiYks9KRb5UR4GrpkWBALvLxaSMwIz92U8G6MUjAlauqSCCexQX1rWJMOI/M/8RAaIJnnr6/xzKTJC5/v7pcKLtWX4MntDUdiWbN1Nigd9/+ZDQxF/zkhvAZBO7VW+YpDqudj3CcwoyCqlofPNA1mQiIbVWRv370VsJSpV5dX/WAbQiVzTefEIX+TTzWdjN8+lMm+3DKt/7xwHMYxwiZErc0KAE08JSRlg5VE/PzHEhcUsoMBBfGvKw19YcerEizRDW3vNkitmBaDy9rE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(5660300002)(316002)(4326008)(38100700002)(66946007)(2906002)(54906003)(7416002)(31696002)(6506007)(53546011)(36756003)(83380400001)(31686004)(508600001)(8936002)(6486002)(26005)(6512007)(2616005)(66476007)(66556008)(8676002)(186003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QlNgfe47nDaQlWzAdpCxrdK4zDCtxarDKOhKh4XiNTBYhESGVOA1RS6Undf0?=
 =?us-ascii?Q?tMTOip4RzFF/mZwRkx/HYsALKzZArVevESH+7kxyxydNA99Ke3vDa8fdEmD3?=
 =?us-ascii?Q?ICS35eUZ+zjZeT1MnKiv20y3bcNysR/PYj+A9wPhoGhbO2Em8Oz/K52k66YB?=
 =?us-ascii?Q?9vx9IOIxlhUIDyDYxiUltD24DMTREwK/2Xm/WrARU8zEqw3Mv2PP2IPsI/D4?=
 =?us-ascii?Q?nacwfUfIdqU+7WhqqzW5KOvY97H19147PJbRnVnRdOAq8W59U3bQ3z6FASrw?=
 =?us-ascii?Q?lKa//s1JBMBVmp0nTLCx9FobdO8X6TlyrwRoqp1km6T5PTF5emqu+mm+PeEA?=
 =?us-ascii?Q?ud/KRjST7eXTka4WxERtP3bTRmv9mMyFOTtLa5VgbQWz3CvSVMn1JpjUeuNH?=
 =?us-ascii?Q?QPoKhZl4M8fj9QhpdMAghSWg07fKO+ilrmYRyrMpntanJmlbK2nLfA9wSEWg?=
 =?us-ascii?Q?BCvAXdrF2nZ7sQO0DDyXzQtqIyUsAtAOYy6gsB45CyEjlrnDO8O2EXwlRir/?=
 =?us-ascii?Q?mV0LbZ8yCIkJ7DwwbXMV9JF5LT6GOnZNC0+Dueu1ym5a9UHZMQfotZTl53Sw?=
 =?us-ascii?Q?SeIsIh8uqj5tiOY0/fGqNUYdklTurW5tHwUjBVAD0qOtDIoJE7YWRgiIjiZP?=
 =?us-ascii?Q?Y5zO9hF9DstODhIh79PqwNt8hlusLVIBEHCJLclfECKQXh0ZNaY0f5cRr+IG?=
 =?us-ascii?Q?E9fiU6/eDHy31NNiBT+UKoiCPP6qRXYx8iYS8AuLv2JX+VBAK1KjzpYOn3bg?=
 =?us-ascii?Q?bH3uFTInnYeHojm+onjwLoueBTo/X7OFhbFamKIYt+KTdUPsiZmuJpnSn4GT?=
 =?us-ascii?Q?lP3bxTUC90yq/fyw8vsoiCXXW3DwHawQLnIOf2rqll/6WtRyqo3gfIbUIBeK?=
 =?us-ascii?Q?NBidPEP62dnnMafnNAUaMi8PYU6GVi1WTZfTQSKEy6rnz2UmVZhv2GyfmYOr?=
 =?us-ascii?Q?HYsxjqg1vg0nmqPJ0NNPYyKBlpLZk7r0iwf6ZEtxJXztACdZ1Cj+CbFAuXBB?=
 =?us-ascii?Q?qaSvOYmFoummR/ZzQG/iLiVHxzv9dWrV16ZhUNOO7BcLws/scsCKq+e017fr?=
 =?us-ascii?Q?6x6KVcdD4sb99RQTjIjIB9g6KWXV+T4wGETCqgc6YUYLm2c8ubiKkaMACgXv?=
 =?us-ascii?Q?qlmE0ZZyudO3WUatzKGTq2vwLPzMcjtyvRfDrPod48JSxNatE9862QhEqnAU?=
 =?us-ascii?Q?lv1/xvBY5cAgRNYJT5uxDhXa5hSXq5wBBeLwPmehM+GxjTl97YYofszikXql?=
 =?us-ascii?Q?QmUWZWybOSzYKdVm6R9PBJcJ5VHrNOdaGb5Gz1rblBejBovkL/W4n5fRgQOM?=
 =?us-ascii?Q?4WO3zLXHH1QtbVyDTYcZ9yWscORIa+Pxk39sfb1JNVhXtcyKklUU0QsxTlxF?=
 =?us-ascii?Q?h7uQ/sBOHQnG6j0MCumDpcd8RS0a5NuCHNKjkQhthlJct1R0/y2Zz2zPCZ2r?=
 =?us-ascii?Q?MUtUdGHAXAvCGzc6mmMOEtVa6WLJDer60xPRNduIPNIR1i8QQdMcnzvBQ6IA?=
 =?us-ascii?Q?4YEzAR++CSigYVV/kFufZuVN9rWGZ1GPi+M6eZFFiyPoYGWOgO+Hk5ssR2ae?=
 =?us-ascii?Q?11i5gOr1c05yNaaRzdcmCjFlLDsB3PPXCtKWZPMwKDMU5rDI0VWkZA0kylSx?=
 =?us-ascii?Q?z49J4x4oFH9cgydgUeiO5HA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07851677-f927-42fe-0920-08d9bee10a21
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:06:39.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iim0enpL/4vTWdIWzk2PWQNuOdIlhffNsNgSNv6bJsLHJpDy3rxcFfYJOo6Z/QFNLzhd8n6JavvjuZkJilDGig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 13.12.2021 16:04, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:53:59AM +0200, Jan Beulich wrote:
>> Having a separate flush-all hook has always been puzzling me some. We
>> will want to be able to force a full flush via accumulated flush flags
>> from the map/unmap functions. Introduce a respective new flag and fold
>> all flush handling to use the single remaining hook.
>>
>> Note that because of the respective comments in SMMU and IPMMU-VMSA
>> code, I've folded the two prior hook functions into one. For SMMU-v3,
>> which lacks a comment towards incapable hardware, I've left both
>> functions in place on the assumption that selective and full flushes
>> will eventually want separating.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Just one nit I think.
>=20
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -731,18 +731,21 @@ static int __must_check iommu_flush_iotl
>>                                                  unsigned long page_coun=
t,
>>                                                  unsigned int flush_flag=
s)
>>  {
>> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
>> -    ASSERT(flush_flags);
>> +    if ( flush_flags & IOMMU_FLUSHF_all )
>> +    {
>> +        dfn =3D INVALID_DFN;
>> +        page_count =3D 0;
>=20
> Don't we expect callers to already pass an invalid dfn and a 0 page
> count when doing a full flush?

I didn't want to introduce such a requirement. The two arguments should
imo be don't-cares with IOMMU_FLUSHF_all, such that callers handing on
(or accumulating) flags don't need to apply extra care.

> In the equivalent AMD code you didn't set those for the FLUSHF_all
> case.

There's no similar dependency there in AMD code. For VT-d,
iommu_flush_iotlb() needs at least one of the two set this way to
actually do a full-address-space flush. (Which, as an aside, I've
recently learned is supposedly wrong when cap_isoch() returns true. But
that's an orthogonal issue, albeit it may be possible to deal with at
the same time as, down the road, limiting the too aggressive flushing
done by subsequent patches using this new flag.)

I could be talked into setting just page_count to zero here.

Jan


