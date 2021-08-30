Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF583FB370
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 11:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174937.318840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKdy0-0007rI-HK; Mon, 30 Aug 2021 09:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174937.318840; Mon, 30 Aug 2021 09:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKdy0-0007oG-DU; Mon, 30 Aug 2021 09:52:36 +0000
Received: by outflank-mailman (input) for mailman id 174937;
 Mon, 30 Aug 2021 09:52:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKdxy-0007oA-9a
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 09:52:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36ef4aed-c828-4603-a75c-dac65ec5b650;
 Mon, 30 Aug 2021 09:52:33 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-KDtAfY3bMTyDDjZxDP3z4g-1; Mon, 30 Aug 2021 11:52:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 09:52:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 09:52:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 09:52:28 +0000
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
X-Inumbo-ID: 36ef4aed-c828-4603-a75c-dac65ec5b650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630317152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozx6sDpAqlaqI9z6nWIuYi4hzITFSPYxi69L75xjK5s=;
	b=mI+14IEteyy+o2LeGgH5aLzuRi2I2Ifzkd/ByGVwgkeVTO8iuikHvaDVe8tjSFwzOxNnGp
	9p/YdYRrTRnk99/KZrF1XSXSCXvIlx738OIjKGLDHRvtAjJ4PyfXkbZVjZVc74J71FY1yr
	PUpx3W7yDnSDLzo/WdaSKmyg627dUKo=
X-MC-Unique: KDtAfY3bMTyDDjZxDP3z4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPsCzHKTW7VyUBptAB4Q5syFhD4oH2YQfsGWrKfDYoproK/r1HCZO0qNCbutSosO27hYdsdca/cISutkeFAHCtzSbZNtsz2DXhjZDnk1IiydQMVAPgrMMjm3cwnLaprfYgOM/Ta4KIcfkaoLhy0bY26KfqFx/Aed/DSx24x2Pce99PhuSfVT8yvhg+p+0rg/EUdFenpO8vtIvvkEwcgVfoy2dw6RUV+Ln3AZxblBGdotY1n7aZM6Kk543B6NoD51OX36Fd2nG+9NjHQQIdFIJp7++uR3sDikV1/fWTbQnvvI0w99QxR8Hv87GgWlZiAZCuFkJ+Y2bTDOYGLZMKyQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYh4N0p7oemNLxY0ylX5ZNMPBgydOPsE2vUeWx1lTW8=;
 b=hxcSHvIKOb1nMaFH8G/SJEcRcFwjn2S3RUmKSUJXt4bQfvXusvPuTTxfnYzHXIGMjjISD5aiypjTa6cQhM038ciT+8sTEfNZpVqz5wdSRbsiGjB6kyK1lASa7psuiEaqahrSBVcJqArnsUJxiuOrqzn7hTvSLE0yu7QS1BGmEFFf2jQywsNziX0VXUaPpDriYDEdW6K3tu+xE3viLuYoTKOWRsEXMEBgOMuqwwxf1RepH/RXg+GbG4ahQZr5egqvmp2k9JbUxBfQ9MO/GkLxJAAy/O2x7c8vWicgQCWM/OlV0+H0/ey3CgBlXjdhdKZzEd7mKdjVchV4cH6BA9RBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-38-wei.chen@arm.com>
 <48a54187-3b6b-f98c-3681-906ee3df1694@xen.org>
 <DB9PR08MB685769E192E0603F3C723FA09EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB6857B7537C35BBF1CE347A4F9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5683d5a6-2694-5842-519a-5e3e3c8224fe@suse.com>
Date: Mon, 30 Aug 2021 11:52:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DB9PR08MB6857B7537C35BBF1CE347A4F9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72adfadf-7a8a-4daf-4269-08d96b9be0be
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671A53C855D4DC298DED911B3CB9@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b5U9W8rXJfP3HqHlvANkPWHutgu1XdPcfHlMT66qyNqtZAnI3BMJ9JEHeTd6/6zAzQYhFiIwKVQMINsr1arNfSU3ACCzqp7KJDQBBgq5X393DDziY2he197BFKtzZA8TFSGWGlQDXCW19UpOxgeHsA66T3g1wwqPeQ7ch2fhy7RXvXxbIuTFK0QASPVKpJMJwyGPCgvqihbN0Wu/frGwzcFSAVD/yNFr7fxWJoScaKFe/NS2JiO8e+XNjxnAhD78GIA/ePGZzPgcR6i1jr7B1DRHLQpShYEbUL18S0uOZgLzti786fAkrTgXWjCi+9LbrkVniQ/xxBn6yOMOilpoC2xiMLqvoCV5nClcQVMLOnorWVwy7w9RHaRUdK5EYYCfVxJWW6uiYQm4ETtvsAsewnilHD+iyxTEPLra2eMz2Qcg4N/uunGaRhtVnMgVQ9sFNiVE3DrLMD9I2spQk/Y+Txxd50Jx9xRZYqVqvfFFjhL/eD8UvZoDsJGAQJqRkKkkCR9KWvUuhaoCxlhwmEcKFb75ttmpaE2iA+q5cUJjFUnVUCP6HObddhtAav2CXI3caJt5jq2wWNsYtTT2D28S7ly0zuHeckQtYZPho3snLjgZjByLnsALH8Nx900lyoIuYcrCaukiZ1IzP5PybfM4WX4TH9dm0W9no3Nhz89uhYnU0DM+ocbHcD0dPTGr5VT1BbkqzhaMlB0inijd/6N6BXttpTShUfSR29M70s7qwkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(5660300002)(31696002)(6916009)(186003)(2906002)(16576012)(36756003)(53546011)(86362001)(478600001)(38100700002)(4326008)(6486002)(83380400001)(26005)(8936002)(54906003)(31686004)(66556008)(2616005)(66476007)(8676002)(956004)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YAW5LQOwGqmatriT6Cqnmke8YV+TI/dEOF81d2/sXCpiuPBY1bWMRaP32UDn?=
 =?us-ascii?Q?WBVeyMXtN72MjJD/e3u0fSnroXq8t55eccuo4USOo5oceuTNy87NKF+B8DYl?=
 =?us-ascii?Q?mwGktmc4m3vja9A+r7kOap0ZyV2tW1uhvSXDfazU9xSbDTs4MJ03bIe1A5m7?=
 =?us-ascii?Q?LuRMvAPtU8mDGxxj0o63YUGprbGhbXouD7ffrF2/VuGy6UiZIW8XX063Meil?=
 =?us-ascii?Q?h+U/flUdq+Cq260ssm7Ut26ykMHAWGPzC9ZYTn/tNM4VsCbRuS2k1yN+uemS?=
 =?us-ascii?Q?y4Bam8NJkH0K9hRdzWUhyPiwlVBvXflKWbIFCHXxQpPkKd3EwdHWxw8wnSaL?=
 =?us-ascii?Q?Q5HyPMr86Dw/iF6/Boi416My9zjYK/TM3e21uIOl0jl/D3+eTSbxN/A64Qam?=
 =?us-ascii?Q?2LDH4ar+QXv5LpNPTJsI1/gmbtdpftFyAPR40RVFP+LewkiAChkzqnk567Sg?=
 =?us-ascii?Q?OtOzS3jCTsohF2dDkRzNxhXh4DTJ/nd2RpeM2seMeeMX6AaRfTIQRWpg9S05?=
 =?us-ascii?Q?Z+A+vhN+RRJjyQeyJ2C8RtZlM57n9JA3uOiUoVlAx98lFwn4VBZj/RlcXDud?=
 =?us-ascii?Q?v5EILIHAacFwIg7LvMztx36ROOpzYdP6fvIW+jCQLhgT0ZA7DABs+tRm+Sq3?=
 =?us-ascii?Q?Q+X3c+1SX/zFqLWJy7EnyrTHUrCjmDWT33v9+TPyngstZZ4lReiV/8r7uv+3?=
 =?us-ascii?Q?0BeYklLQNkpJTIXm/20zc1RUTLhKcmoGTJ3NQrgFHpqwCeE1vNTThQWPRWtu?=
 =?us-ascii?Q?1vRqAJPKjG9sJzeLzg3Vhta2/ZE1yEnJ7+6/eXehc2SiGU0MFAgmeMuTc+SD?=
 =?us-ascii?Q?IOSzLmmQo5Xe8evUuH8AesLwVV77vyJQiKtMcoOvYG+u3DPAdMIuvJkir5dM?=
 =?us-ascii?Q?tFuTfvz9lCK6ynItONBhJQseJ/gRbCh/h0S2yg8Lydvhy/REzdvfq0eZxq6m?=
 =?us-ascii?Q?tWmFhRCqPR/IAlfRgeqg+jVf8bt/Xn0vA5Q9CAKlEmWphiHQtWfAp0+YTzuI?=
 =?us-ascii?Q?TEcDry6IpF2vTZEVlCLwrrm7/X20wd6a81yaev79TjGU3m7qYgUGwgxy65ed?=
 =?us-ascii?Q?Q++RzzEL6Lk8XwO2rsnP/bzCVFO3NxD4COueBcV/hQ4CZA48KRhR+5qVbzmy?=
 =?us-ascii?Q?BexiytyC19FzTxZfHJN28502S6rovYmjGfyuTbzOsLWq2j7TmdHBtvrev/yt?=
 =?us-ascii?Q?x94ZCCbmyJHLsbXZZzBOnPneTzt3vCk2VTpkZA6VvnOHZ7A5ZJISxqHgWrA9?=
 =?us-ascii?Q?+ogp3+SL/zinHEI5/SKU//nDZuhTEn339beC8mO+EX2hhfF/7rZZyfny11LE?=
 =?us-ascii?Q?ZfZgVfMUwgUoFTSCLoa+jtVT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72adfadf-7a8a-4daf-4269-08d96b9be0be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 09:52:28.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhf7Ux2AJD05/WZIfn4kKCyMn/zQto0t3j48q1FwVSN18Xoxx+V8KeY1LTcp0B6ngUw53s01GekHRx5yc5C1KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 28.08.2021 05:45, Wei Chen wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of We=
i
>> Chen
>> Sent: 2021=E5=B9=B48=E6=9C=8828=E6=97=A5 11:09
>>
>>> From: Julien Grall <julien@xen.org>
>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 22:30
>>>
>>>> --- a/xen/arch/arm/numa.c
>>>> +++ b/xen/arch/arm/numa.c
>>>> @@ -140,3 +140,16 @@ int __init arch_meminfo_get_ram_bank_range(int
>> bank,
>>>>
>>>>   	return 0;
>>>>   }
>>>> +
>>>> +void __init arch_numa_init_failed_fallback(void)
>>>> +{
>>>> +    int i, j;
>>>> +
>>>> +    /* Reset all node distance to remote_distance */
>>>> +    for ( i =3D 0; i < MAX_NUMNODES; i++ ) {
>>>> +        for ( j =3D 0; j < MAX_NUMNODES; j++ ) {
>>>> +            numa_set_distance(i, j,
>>>> +                (i =3D=3D j) ? NUMA_LOCAL_DISTANCE :
>> NUMA_REMOTE_DISTANCE);
>>>> +        }
>>>> +    }
>>>> +}
>>>
>>> ... this implementation looks fairly generic. So can you explain why we
>>> need it on Arm but not x86?
>>>
>>
>> This implementation is DT only, for x86, it's using acpi_slit.
>> For now, I am not quit sure ACPI need to do fallback or not.
>> Or say in another way, I don't know how to implement the fallback
>> for ACPI. I planned to solve it in Arm ACPI version NUMA, so I left
>> an empty helper for x86.
>>
>> @Jan Beulich Could you give me some suggestion about x86 fallback?
>>
>>
>=20
> I have a quick look into Linux. When Arch do numa init failed,
> the numa_free_distance will be invoked to revert numa_distance.

Does this matter in the first place? Don't we fall back to single
node mode, in which case the sole entry of the distance table
will say "local" anyway?

Jan


