Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FDF4648AB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 08:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235614.408713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msK6j-00032O-JE; Wed, 01 Dec 2021 07:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235614.408713; Wed, 01 Dec 2021 07:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msK6j-0002ze-Fy; Wed, 01 Dec 2021 07:32:49 +0000
Received: by outflank-mailman (input) for mailman id 235614;
 Wed, 01 Dec 2021 07:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msK6i-0002zY-24
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 07:32:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e08db8d4-5278-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 08:32:47 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-zJYj0U7fOZu4Xaxg0jVo3w-1; Wed, 01 Dec 2021 08:32:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 07:32:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:32:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 07:32:42 +0000
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
X-Inumbo-ID: e08db8d4-5278-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638343965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wejFNDN6wuh0qusnpNLQnyepAmpAz94amjDDXwCWwbU=;
	b=L25AZWF+xSxlxQ10ZMl6kxlVuicJC7QsSw91v2LxSL2q9VUUFMkSOo8d27thG6X7mP7vns
	5TRBuOJsFzz+b3bsem0/6nIZd7/fj+x92CVYMaoqOi5+xK/qpS55hDF3Q1ioqrN70vJqco
	6vfv1IuVxjK4kR6U2blxYv+W+Vu8hIc=
X-MC-Unique: zJYj0U7fOZu4Xaxg0jVo3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbHaYFRqQZJy+UxtdYUx/jWFald2SaQyZAwLNHHNTurd5JhAYsgsmvKLb/VVIEbE+kDUa7e0bsf8kgaxmaMk30Vmhz2SGXNjoVdlZ63nY+rtwlYjXDQBzA2E5aRivtV1VMq1tne0LjqiTfSDwAuWG/6ODkAw9bRGkJtIDKd5PArdaWmiHGVERzrKwvcXm5jDXzqaHLbOnzlXuw9Xxy6cMRpERrDYugPssARhHSvymBYfvYYdRX18HvtGIHwu6QTegWAhQ97QiAN/XR0gohSfsVaG2YNaRx2J8tAm/Y6oorGYtmrWre4QV1jp+Esp8M2SwvQdxGOcYzIqo+C4fzxsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fO/+E6zcJdufR+r2Lb6bLprlrGmHwIxNFjibVMxTh8=;
 b=GWCOIOpI7JsW84IuybZK0dc0gCd5qssin07GnQMG2Mm1/SrBQJeb8NJB0VRvUER1y36KsNBnugk1EZ1L2zIeiF3g/hRjaHHMgPE0PvvIfrgKn8DTiGRa8b7+Yc6B26Y4ZQ0rx23V5FPwpEL19mfROAF6LUWxuW13cjgdtwr+HUdHBLdbPLQIaebq5ahx2F0SVblwW1R6H3pVeB7zqDRI+GczfMCW1saEkQuh/MySRLPsI4PRtksCPh5r/htEvR+vgtqJxRM4mFH+dXk+R5LfURIce9sEKTI8PHLcEG5DQ2VY/VyoC9jjuN5OEDIOA008QKq+Z2Q9a95UyrkuJ3akDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b40d95d9-6bf5-e2cc-396c-12c3be6c48eb@suse.com>
Date: Wed, 1 Dec 2021 08:32:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] x86/vPMU: convert vendor hook invocations to altcall
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <aa19f4cf-6f62-3bf8-7057-7dae1cf28162@suse.com>
 <17bb5295-6207-0bf4-6432-426729a3a288@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <17bb5295-6207-0bf4-6432-426729a3a288@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1d17b6-eb22-4d56-cde3-08d9b49cc2e7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55979F18833C94C6B099F530B3689@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ke5YasYvJKzJqYt1OtfHbLiGeeDcVUyuFBsmfe4MG6VvHeN2mbQI/6vitrD+hsl2rc2Xu+8ajO4MsGQHoV0z2eIapujS9LhPsDA9nC8osoJ0pT1lKck0Sen27q7YFB+ytWn/7QcJsNFaoS8JLGXXnb0iuZWbCOStIi282bT6DEZEq1lvDCCSXpuOIT1jaaJzDoOlzOWrwZuXvWUVOVdhpkLcUDPKxRET2pYBYiFkWuXdNhsewCt9I9YhgVF5hGv0zv0LSnc0rrWrpFD41XyhYUqTIOais0SjmytLSHE0/3uiaxIxZ9z8OdBbJfj1LVnFh82ziTX9ATIPDyBTxg1HpoAMhbVQiUC+s39SGrj39zk24o2U92KHF624ILSF2pY/1lnKohXSzPFxG2PiuE5FQWkGNkoFozAM1GlybD5ktc02g5VTzGspaLaja0AtZxBSFa0ItlXsjqRrcF0EX2mP4enUvKGYu8gWX7C5/bmNCJnQDhOaHMLmWDh6XPQh5BEBFdSM7J0+zzqoOn+JvOm5Q7N+tOI0aGbNT2n1FVxZYgfYekqbO/SMfXtV2kYvlXXyPTKJc7IYJNMTEbJ0QWuXO9M1M6eJR3eSw5nRXpE9FlKnghciHZI/HtEBUTjQlokAm+XUU1iapnZlwCeET88sN820TJnUhLRkxL4PDZwRkyUaL9kJaFlffK5bgJORe6FNvf9qjpVCJC8Rd8VZHOUUFI2KeXpkh6b5BBTMzjdBr4Qmt5fXNxJtyOAXshRJha9W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(66946007)(38100700002)(54906003)(316002)(5660300002)(6486002)(16576012)(2906002)(4326008)(83380400001)(8936002)(86362001)(36756003)(186003)(26005)(8676002)(508600001)(31696002)(53546011)(31686004)(956004)(2616005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rCCa76lECDrQGK+kpo9n0jSrGWoRRfbrktbBTAGYRXFbeeVH51wasZcJXBX3?=
 =?us-ascii?Q?j83CnUlR9Ah9aTfVnRYL2rHti2K/D4D380p3oYtVn9TWFArYOsgC4D2AJnO7?=
 =?us-ascii?Q?zXhbcwmfPnSpJXUZqx/leWbopabwtM5fME8CJZbVI0wyFBBQtao4zw2z+TvS?=
 =?us-ascii?Q?11ZkWdzHTCzpk/oT9MGE0AmlB6lk7X6ai7L3wwHkW7AWv/fBNv7T6w0FC7V0?=
 =?us-ascii?Q?EOQC4LmqUyATUiV9qeSKgKA8314nektILIkkaC+mnHeeoFWq/+aCcU4fnVcm?=
 =?us-ascii?Q?U0yFTgYk0Pno8Any9aBoNoqX63iuzqAQFJYIaezh7so60XqWKiAmNs3QfBrA?=
 =?us-ascii?Q?FBLMZrstqYY62wasgBqCdcpmqNw7qTofMmyQYg8UL/n1VScY6QUDRgIg6JcY?=
 =?us-ascii?Q?63sc62ZGQI3VxYJ3TfDBhPCRgQ00QDfpyKy2/I8RNRhOHYJ2chLRlRkvwWRJ?=
 =?us-ascii?Q?rfJf8nrF20TKlyDSspNxcM4t4wlqjaweXA+c44IW0QauVixzO9SUQuBJWGLu?=
 =?us-ascii?Q?Aenlj7qFdzkWXaSvFx4oqpmTTGcPcEerI0gRNKihnTnOf94r5JKVUxnXQuXM?=
 =?us-ascii?Q?kox8GOMlHzoq6FGxdZQI2Uxb+QFC8FdQDmngKXut6Wub3jzZWGH6sTputMyC?=
 =?us-ascii?Q?dsWNhEb3S3qoXkok1TOwrWbbTKwTafzoKhS0ziyWhER9+PqQGdNgoanoabNA?=
 =?us-ascii?Q?VLN4jnc6N32LXRyd33FbTyCrZ+FPFQLsk1+K6toqqPNF9UGqC6O9WUkS3oPx?=
 =?us-ascii?Q?sYM/GzT439HJpz8bCTYFcnREIQ17fdXIT0y2I6aNJqFgB2d2vvHVDSqhIPKS?=
 =?us-ascii?Q?VHWzq8MQqSVktnYVbHhv4d8TtrzgeKOMWb0vHyRhNbTkaOG2OYClrz+5EZ4C?=
 =?us-ascii?Q?4sFY7T16zbzl1ial8Ae2bBmhm7F8w9y6gIZ15oe6hFCSoA+RZvHy0/+I3Gxh?=
 =?us-ascii?Q?4NOWUrjtyeMdhPkwHTKbVTLfEkyRCx3P/p1LzplmVg/Ndp59GLUubL2lKgMQ?=
 =?us-ascii?Q?e2OasFpT6PmgKSpD+ojPfeIRUhLd9dPB1ASPbgduG+VOs5WaQu02JzcV0SoV?=
 =?us-ascii?Q?PzxFKbfMkc5iplBRG6LhdUm68kXMxanU9zcLqJWML0L9f5P/J5/lUzLoeOoD?=
 =?us-ascii?Q?AMDyv6c2dqvOt/ETEXcCMMb3m8BIj35sMZdE3LF84MCiutM6d5UAWsA3oH5T?=
 =?us-ascii?Q?5AutQISWgiIgwXWit5jByoTExBx81BnlDmNF2ISJK8nCypZUjcv86L4bScD2?=
 =?us-ascii?Q?XD76MWbRtJZmYulrmEMqYsOlFb060tHQoU7XppGdc3AvNeVKhd8aiFDujFa8?=
 =?us-ascii?Q?tnp1CImVrfElrTNQb4eJNS9/LTUxOBBKU2R02bp2t8NsW48ABmv7UsQ4o5bC?=
 =?us-ascii?Q?p0T95vXXLxl5dZ7p2PUx7lCPFNMXogGv6zC8oFBfMuYwTFAJys1HZVxR+yo/?=
 =?us-ascii?Q?B1d2J1EXvBadQhONdvLIk2KY5bNFTwJ9HOricU5kcfxAe890WFMx6IespHOr?=
 =?us-ascii?Q?MLi9SEn05rTWHfkqSGCwE12hHAljLNOpDIYiayiNdEOQ5eQuTtEI0EF0uo35?=
 =?us-ascii?Q?5O5Hyj1LjQu1ypZx5afLLvf+eiOupsMA7COdnQWNJQTINZ7oGTWKwknvTCB0?=
 =?us-ascii?Q?WTgs+tmgulQvjq9WG/Lk43A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d17b6-eb22-4d56-cde3-08d9b49cc2e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:32:42.8854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBUtfzQOI0r7xPdV4+Fu2pUtDUH921qJ57B+we+dGyRCdOYLjy6ceU2GnrdTD7txvsR0DImkmSZ05ifnuoat4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 30.11.2021 21:56, Andrew Cooper wrote:
> On 29/11/2021 09:10, Jan Beulich wrote:
>> @@ -133,14 +133,13 @@ int vpmu_do_msr(unsigned int msr, uint64
>>           goto nop;
>> =20
>>      vpmu =3D vcpu_vpmu(curr);
>> -    ops =3D vpmu->arch_vpmu_ops;
>> -    if ( !ops )
>> +    if ( !vpmu_is_set(vpmu, VPMU_INITIALIZED) )
>>          goto nop;
>> =20
>> -    if ( is_write && ops->do_wrmsr )
>> -        ret =3D ops->do_wrmsr(msr, *msr_content, supported);
>> -    else if ( !is_write && ops->do_rdmsr )
>> -        ret =3D ops->do_rdmsr(msr, msr_content);
>> +    if ( is_write && vpmu_ops.do_wrmsr )
>> +        ret =3D alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content, =
supported);
>> +    else if ( !is_write && vpmu_ops.do_rdmsr )
>> +        ret =3D alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);
>=20
> Elsewhere, you've dropped the function pointer NULL checks.=C2=A0 Why not=
 here?

No, I'm not dropping any function pointer checks here; all I drop is
checks of the ops pointer being NULL. These checks all get dropped in
patch 3.

>> --- a/xen/include/asm-x86/vpmu.h
>> +++ b/xen/include/asm-x86/vpmu.h
>> @@ -61,25 +61,25 @@ struct vpmu_struct {
>>      u32 hw_lapic_lvtpc;
>>      void *context;      /* May be shared with PV guest */
>>      void *priv_context; /* hypervisor-only */
>> -    const struct arch_vpmu_ops *arch_vpmu_ops;
>>      struct xen_pmu_data *xenpmu_data;
>>      spinlock_t vpmu_lock;
>>  };
>> =20
>>  /* VPMU states */
>> -#define VPMU_CONTEXT_ALLOCATED              0x1
>> -#define VPMU_CONTEXT_LOADED                 0x2
>> -#define VPMU_RUNNING                        0x4
>> -#define VPMU_CONTEXT_SAVE                   0x8   /* Force context save=
 */
>> -#define VPMU_FROZEN                         0x10  /* Stop counters whil=
e VCPU is not running */
>> -#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x20
>> +#define VPMU_INITIALIZED                    0x1
>> +#define VPMU_CONTEXT_ALLOCATED              0x2
>> +#define VPMU_CONTEXT_LOADED                 0x4
>> +#define VPMU_RUNNING                        0x8
>> +#define VPMU_CONTEXT_SAVE                   0x10  /* Force context save=
 */
>> +#define VPMU_FROZEN                         0x20  /* Stop counters whil=
e VCPU is not running */
>> +#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x40
>>  /* PV(H) guests: VPMU registers are accessed by guest from shared page =
*/
>> -#define VPMU_CACHED                         0x40
>> -#define VPMU_AVAILABLE                      0x80
>> +#define VPMU_CACHED                         0x80
>> +#define VPMU_AVAILABLE                      0x100
>> =20
>>  /* Intel-specific VPMU features */
>> -#define VPMU_CPU_HAS_DS                     0x100 /* Has Debug Store */
>> -#define VPMU_CPU_HAS_BTS                    0x200 /* Has Branch Trace S=
tore */
>> +#define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store *=
/
>> +#define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace =
Store */
>=20
> Seeing as you're shuffling each of these, how about adding some leading
> 0's for alignment?

Fine with me; I did consider it at the time of writing the patch,
but decided that such a change of non-mandatory style may not be
justified here (or even in general), as there are also downsides
to such padding: Once adding a constant with more significant
digits, all pre-existing ones need touching to insert yet another
zero.

Jan


