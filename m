Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FBE4C8E21
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281584.479978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3l0-0004Ai-3R; Tue, 01 Mar 2022 14:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281584.479978; Tue, 01 Mar 2022 14:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3l0-00048o-0J; Tue, 01 Mar 2022 14:45:42 +0000
Received: by outflank-mailman (input) for mailman id 281584;
 Tue, 01 Mar 2022 14:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3ky-00048g-Ic
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:45:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 430805ff-996e-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:45:39 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-jGdeFzw5PYee6YkSS9tEUw-1; Tue, 01 Mar 2022 15:45:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6691.eurprd04.prod.outlook.com (2603:10a6:208:17a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:45:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:45:36 +0000
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
X-Inumbo-ID: 430805ff-996e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646145939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DorVAtudWv5Of1f/b2H2VMdz9EpaBjaWcK6d1llyyy8=;
	b=AEIxSj7WsH3LIEYAGtPNpSCqz3IUQ7ScAR2uR+u1oXKoqTX0uZuqrGH05JO5zoqi9MZbF0
	EELMtn2fTP9jOr6F5nTci2j3NuY18OxLJ5OwSwllSeMSkbZ8rtnZgYktg36lzDdhbhHnAV
	q4isO9sJ5es69cl9CpW4UbKe7It+A9A=
X-MC-Unique: jGdeFzw5PYee6YkSS9tEUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enLtmbEmGZyacWRZr499XuTeJUA20AxWK+4EoUiEmUuaT5j60hHeXNTIQ5OP86SiKvJ4HzJe1FiiZEzHvwFwaYNwQx9/hkb+bBfuYkKs8vwGSh4LpdGaW874CnHZcxczLDI3oJQsdiyVVZ70I/V+/TM0shRMH+RjlGTUCspXtaCj+ynrUB87cqBOjBYVLx/ufaY2/szfOQJz4mIKQFNw22l3vlqPWsCHIp6zzXsAaukcXAxLFz8pC3sh7TsQvnI+PN5YfmTzj6D9WfxivN6J2CzKwcS+knTkO7zzCgaahMUHa9TSXRYVtk8Q+m5k/FHgLPh1N28WIpVd8riDBwU/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6W/DUj8P73Qa56qkRd4IJ/l2Yw34qOaIaEzNLwsejY=;
 b=kB79BYkuM8bVOZwvFZtr8ew7jw4gyUngCq9iBgs+n3lYmVrt2vmtUYiF0gIETg7IUPz7HuYs2N4mURYiQcLrV9F5Gs7RY0b27JOGD4et/+G46FRJ0/Yo4TGZyFUSv3iCCV/vtprEYaNmXGoZkc5DfN7MQuyvORNYhEtkR5UBMUYDEmx6cvxYWqkFA/OVkwn9YTvBA9mA8Eqbg62x3QR/RDpeUbNxXOxUrBj7lyirJ1FRt7QayrIz6QW+UjbMZnU0WDpbQFeflua10LXvt0XwG4xp8zt56YhEZPBk4gZs79xh/YdLi92jZDgV/AOOQ+BNoJEblljaUmfZCl85smUbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99599e7f-c72f-7b20-d601-fc4fa99998a4@suse.com>
Date: Tue, 1 Mar 2022 15:45:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] x86/time: add CF-clobber annotations
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
 <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
 <40ce913e-4388-2d2f-45e3-e725a927da92@suse.com>
 <ae77b805-b513-7aa7-ece0-c3c7dbf662c1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ae77b805-b513-7aa7-ece0-c3c7dbf662c1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0114.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 578fa8d5-341e-44eb-105f-08d9fb9225a9
X-MS-TrafficTypeDiagnostic: AM0PR04MB6691:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB66916D3C40FB99FF04630E23B3029@AM0PR04MB6691.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i4/GnNOabh7DQBSA8aeKynMvk+bMwI7utW3BFnd9rrRPfdaDZgJjNGJHh3uoX7V8kHvQQFoE8pxPIv+FfKQh9xDaZTfNwQbbc0dCttNOLye8mI0/DXQEi5+KUZtoO+0Y9UpOuuzceZZAAE+VG0Rs/xW1IvwsQNzqehlOG4rn01y0SL1KqF+r3LE3ipHBdWrOm9hF+vxoO/5sKrdbsZPl8GlCsoN4xlrrSWOcUAbwr0wmPQNDim4+D9MlD1fLTOJGaMyyer4dWoiim7eXVrDvzhr+f+cNsrNnhFs2yIRLqZj+oJQEFBwRa6t+yEO4ygo/7BLl5YtQudFn7gay5GMe40x6HI4Ez1XiuJYisTxm5FwLe/T2JeDGDgvs4iBjlrIseMGxfD01lewZ/jDOTHQWrqAH+38eJEy+Sx2SUBpWTbGPc2GI7qW6ZYGVT4ygb/cQxy+3SHzK6bTP0gxGMb5LBjdRhnCVV3gUoUsBhIg657268WlJQBhS1/62m1dTfno05Qzuar7azzOmMcVUn4loFHxBtkETvUF2+lD6mMVpy66zUtuzntYc/zTPVcWgb4Bu980azYbt3exLtqQLcKoGQZPOds3LIj6HSGfGII16RVrzEkrsoBKAu4P1Sr4ZsECqtAdjRuxokZMpHgcj8ryoQ+JN5QoSPBe/Y32UzIxTZWRnrO+EuG9CscC46LXFowhsTxj8PZZXjzrj8nOGPLOT1MmyILPnr2kTBux2ydlqGXdCOpFjt46zCpfJ0bbp1bRq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(8936002)(38100700002)(2906002)(36756003)(31686004)(66476007)(66556008)(4326008)(6512007)(5660300002)(316002)(6486002)(2616005)(26005)(186003)(31696002)(6916009)(54906003)(83380400001)(86362001)(508600001)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p0glLugHsvTHFWgQ3vdzp/VMV2ah8gBYvXBqo0F1ghyKwtk5XBjb82oWPMm1?=
 =?us-ascii?Q?XRg4FWliXTrkPlYTJhzavSV72uVDLbs+ULg7wvovx+DGgV2ZlX/COw1Vy2v0?=
 =?us-ascii?Q?lI7Km2ouLSYBgqjcAxeimc2jyfpMl3iqwFWaAPNsjzH7pnViNQR2DWOWRoU4?=
 =?us-ascii?Q?Y1xzuKbjam3Xhu6Y7936L2l6OvYH+mx6yLam8qmW4GqiRcYBTNK3jNcUOq7T?=
 =?us-ascii?Q?7ifFt+iKVSeLKXaF2U3GnTAg5yXf+v8MnVG4aIgv2TSNn20RmVoXeGMuBCbT?=
 =?us-ascii?Q?O8bUrTLfLxeyvUeI95zICoUppuB0/TwpJsZmulSO3B1TZKKd1mxeb/WRDu9k?=
 =?us-ascii?Q?FjuNNeewXR//LE85KFn6Rj04j+WUiFB6ojPYJjK1SM+BIzQRv46oOtENgPcm?=
 =?us-ascii?Q?ByZWiuY+PrNHh1+vY+Mu8Y9SR4DXjP+t1g5DOmV/KmHTCrJQ6aNKX/PWx+GH?=
 =?us-ascii?Q?DaIp29JtYgUoqIqBn9izIyq/U0Dhw+PVtFzpasNs2O+iN0SLDkBWp4mA5dQ3?=
 =?us-ascii?Q?GCttNWwMBig23qnZ5Ft/dqa55YNNJKyq5rpeubdjyNC4FRgb+LbxfbBQRzpK?=
 =?us-ascii?Q?2gOtKHCw39wq01oF18FumfACwnZKO9TIGbjFcIvG8yoJMbIzOO0ibojhAiz5?=
 =?us-ascii?Q?0KC2SwxZukzgqg4B2Exeo2szXWlpvGU9Uu15SqDe9a65p+xm28d/4VXALVXt?=
 =?us-ascii?Q?eYD1tCmAm0r+BjN7XO4hbTYRm994EfhK32XHop5/KK1i7++zfD0i8lwEjKxg?=
 =?us-ascii?Q?Ri/l9BnM/18+5mpE/0XLszXmqxPmcthP3KIQ0/9UCwjVhNPrh6JuIJ7I41A3?=
 =?us-ascii?Q?p1sSd7kxrgynwFy2RfNTljvJegvyMjKbkqCZcU/vL5m+0QTX9tGei1gn416u?=
 =?us-ascii?Q?rFj+tRcBQnrug8Uxi6TJev92gX7e20XJjzxAVGSQP3JzF50DGdya2txp317+?=
 =?us-ascii?Q?c24I2mm8gSbNwf3OccYsaMEXBrF8kbbrGbFjIJyeeUzrbqJvN3jni0VDyKME?=
 =?us-ascii?Q?SkXhSYsg2IxmX4FOAgGSP8HzoOuyOi2KICDEaA/8ygNSEH5gbAcvP80a2sjT?=
 =?us-ascii?Q?WilrIp6n3/6D0ElExHzCVfj2hbeaWcPcZW7WnGDQuixYf/iaV+cKqvbmrK6x?=
 =?us-ascii?Q?sAxZLgrHbwaPlbbjNtm+k8tdcJd0qjIlLwvav9WwV751KrzkJOmX66eZ12Bb?=
 =?us-ascii?Q?Q3Yus38LJHVll20C4wxJr5aOTvWa9oxQ2OabO23OOFj94oxjG62zbKzASU9s?=
 =?us-ascii?Q?JCLdF8kPqCRoVyk3YzcSLAA0mh54LJi6fI25Baa5WrnoTMYdmKM7fyJvdrSt?=
 =?us-ascii?Q?EhFY9kOjxPicD3eZ+XfYYA2xyMGiY8EIiFD0qGmft0J6NjRVt7RU9rGhAXU5?=
 =?us-ascii?Q?TpppPp4LsP1rHA6jN1aN6e3HZ5vkSNprPP9Dc1B1ioFhER2sGV+CXeDMHNyp?=
 =?us-ascii?Q?KkjVaD5aoC1FtS3hS3UzqDxU6yCUMKEds2sWeB7ufwXN+S17xUN4GyQNfKbn?=
 =?us-ascii?Q?k3h+nKOCRG1Azo3w920MT9FVy6w6qDak08T7UzDVI6GrMO255ySiVCYtV4cQ?=
 =?us-ascii?Q?Qt3dTvzyAuMXlwKYIw14EkaYswTDK9SGu0xVAD8iTgLZGD7CupfURKWef2SQ?=
 =?us-ascii?Q?uUB6voh+ESlQENZ4v91X+38=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578fa8d5-341e-44eb-105f-08d9fb9225a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:45:36.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t9fL8dugMr1Y2HYL4nf2HuSSaMuJ/06tpOycvSvLb1nfFu8cS29WaLDBVVEAH4iX2K0TyhIZKJOc1QadFYjoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6691

On 01.03.2022 15:24, Andrew Cooper wrote:
> On 01/03/2022 14:18, Jan Beulich wrote:
>> On 01.03.2022 14:18, Andrew Cooper wrote:
>>> On 01/03/2022 11:06, Jan Beulich wrote:
>>>> With bed9ae54df44 ("x86/time: switch platform timer hooks to altcall")
>>>> in place we can further arrange for ENDBR removal from the functions n=
o
>>>> longer subject to indirect calls. Note that plt_tsc is left untouched,
>>>> for not holding any pointer eligible for ENDBR removal.
>>> I'd be tempted to include it, for consistency sake alone.
>>>
>>> It is less likely to go wrong in the future if another hook is introduc=
ed.
>> Can do, sure.
>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> With the commit message, I'm not not certain if this is linked to the
>>> previous patch.
>>>
>>> Overall it looks fine, but I'd like to get clarity on this point.
>> Converting read_tsc() was discussed (with Roger) earlier on, so I'd
>> view this as a separate change. As said in reply to your comments on
>> the 1st patch, how exactly read_tsc() looks like is orthogonal to
>> the changes here at least as long as it doesn't live in .text.
>=20
> Ok.=C2=A0 Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks. I'll take it this includes annotating plt_tsc as well, just
as a precautionary measure (and as you did suggest; still visible in
context above).

Jan


