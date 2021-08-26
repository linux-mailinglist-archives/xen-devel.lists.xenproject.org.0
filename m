Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EB3F84AE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 11:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172820.315356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJBrc-0007xf-Qt; Thu, 26 Aug 2021 09:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172820.315356; Thu, 26 Aug 2021 09:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJBrc-0007vL-Mx; Thu, 26 Aug 2021 09:40:00 +0000
Received: by outflank-mailman (input) for mailman id 172820;
 Thu, 26 Aug 2021 09:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJBra-0007vB-He
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 09:39:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9305ee2e-0651-11ec-a9de-12813bfff9fa;
 Thu, 26 Aug 2021 09:39:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-o7Pi1I39NI6HngsjZpxWsA-1; Thu, 26 Aug 2021 11:39:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 09:39:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 09:39:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.9 via Frontend Transport; Thu, 26 Aug 2021 09:39:53 +0000
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
X-Inumbo-ID: 9305ee2e-0651-11ec-a9de-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629970796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KxBywyxa3bXcSgzp/JM9ZriAlUe1ceYSvVWqEeCMV8k=;
	b=fRkvIXbHdCc6kYP5iIz/3ePDu1486eIRfDMOn5DlEt6VBwkhXmhjicUV7F5HU6+IsxugGW
	/EN3KBIw7fCfRVPnI+dLtEyUz5NSbqqaz1xKRHGe92IyM+ke1SfruB17yMr6Q/pSnQEnXt
	EnklsLJy+0FnuhUlAR4x5s69Cak5x5o=
X-MC-Unique: o7Pi1I39NI6HngsjZpxWsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llvcQdRJwmdDlqoHm+LTSd/qD0GEsJ2xSMtLg4SS4PdWOdUz4w1ZUrCsk5M91cn0j5ZOQ17/SUPX/YETaSZKf0qD1bAFQVi+65RPn7sHMKM0iBRDt3NrJj65si2UpJYCrNDWlm1fSnGi3ABmDpVgynOlqvOmskDS45KA5J2IcaYDKSI/qkNPSX5k+siM5AURN4Q3VGMtkhau25bQ56wME4xjWMmVbkAZu0OJwCEAv+YZMk9EsGXvTt9zGvWUYBjXcAHJ3U5KhfOb4ISec2rgpRLB0Xb9427pf1f0n72AiTxNY4rlkrf1vEhiyGF4EC0ocRZsGzymppiF53jSUQdX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=injP7FFmfUlmJD92wnXPa5z2YMx2oIO12H70bWEwEyE=;
 b=EvZuYgC8sgz2WjtAXf5NdqYHYaPiY5LBFTQ0Sz91tw9wNBKhT3N7Z8x1GY50cvrpkkf6u/sJwelpbRw70kP0SqmfMpTdASIMR6NalAHhtToIBepelvJl1IjJVsYhtcPP3lp0E2R3KLHnCb/Teak4vREgh3hp4Sn4H6GZd61lk4gwIOMEvIB3gPJREVfN0knNXgOa95gVjy0359aKs/khGS3r3KtY125BWu4+51+KMvAfJ4h6hh3WlOckOS67Wm2GWHRMHz0j6aXa5EAJfS2AHDsVmDy+ezpJAuQ8E510jxflNKV9G4BnIZfYeq1K8JFtntf7C/OZriy5yDWzzXxBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA
 system
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-27-wei.chen@arm.com>
 <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
 <DB9PR08MB6857FC8EA8C0D324426408709EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <d7ea4260-aec5-efb5-32e7-7f73d6ee206b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <705eae88-2cb1-f3a5-3190-dd4ed553fe36@suse.com>
Date: Thu, 26 Aug 2021 11:39:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d7ea4260-aec5-efb5-32e7-7f73d6ee206b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c87b4f71-37b3-479f-3d84-08d96875753a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192D8719EFB9F56D5B89E44B3C79@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m0BNng+8CQoxf8SE/YoFeOPhZtHkOaMOFfOyWWNAuxHCuzHXp+8jVWvuddmJMHtWNI9xxbyzwblAVmb77tRL/NtlDaqw0jLKe1mTmqP+0jKFm2eeawVQ+z5PhNiSNPCfwm0m6MybelkVAxAFctEE7+m+enoFv3/0r3jTop4xO0+4lod3vaZLoyf33acxYSXIGkm1Zgzu4sncexjRpk5wcnpdPX897o8gWMnw5df6OlZGn+L6vrTWzc+92ZUp8Au4Y3gey4RegX5+j2ijai8mAWlVlf/+gPaWwoL7kb474U7HzB/JNdtGOVe4OhxY78lDaUK1KkRB2OLDLLjlTLvMih02yA4vbBI855T2LsOqoO87asGGHk3SpCe9zK0kYQxiTy6rLeEtSuIf7dp/U6EgMKvsZYFKBB3c4e71fssgsT/q/IWv1slf27bt1auUjM6Xy9xLp4Dcuva0DmpffP+EOk8gkZACB47K/ywmnoZDTj1u79GEhc8mf/mkH9A4hK/YnYmTJhLea/1HHSqMtEzcEQaR/AN73JfWfdWRhWTnIe8u7d1dkcTjUF2m97aF/xHph6qYEKMrhd9jWcOBWI/O7S2KRUvcg2NQDBBeMbLAHYLxjT9XPfqM//MN2U3vnWvlD093d3/df8rOlIVOxPE5Dn93+rkI9UBjox0EDZ6ElX0DdhokJd5+tt42IhUUwA/Q/yG6QrRFsEkMuWReAZOipAzR44CgXIRCtJoIcvntfAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39850400004)(396003)(376002)(8936002)(316002)(31686004)(16576012)(956004)(83380400001)(2616005)(26005)(478600001)(110136005)(31696002)(54906003)(86362001)(8676002)(2906002)(186003)(66946007)(36756003)(4326008)(6486002)(66556008)(66476007)(53546011)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TjCGGRhsHnbZeolsE9gI290MsXc5dvyXlHzRDMUn8h7krkw/Q3Yk/CYNgrUH?=
 =?us-ascii?Q?lnYq1aL2AAB6IPH+zeuv1Qmk3TaKVxSh5ZHWAQx6MkB088H3Lrr/6+wBi9LE?=
 =?us-ascii?Q?yHgMRfCt7DS5cQ/Fgj9TK0e0USJ7mIeLofnIQ8HfH8ojebeRrQFBeGZQXPLB?=
 =?us-ascii?Q?XdgV8f93WbCQ+g3vJWjkz+8rkHTBshlAl/sK62b9fg6M6MOArZEF56GDD0w6?=
 =?us-ascii?Q?pFwRk9cnfSotfyjEPg9JKkXR+/zq3Uoo6ibz+YSx9AUuPZ1gUANvrGcRmmD0?=
 =?us-ascii?Q?xmaX3oOhAd/SO6SpPoKAa6B3DAEL/imO+c3HdjLzWRdNOVCrxmef+iix0UJc?=
 =?us-ascii?Q?d/jZfE0L1BOqYgfnwxgmEvUnk2+5mDhv/1abXmsV80YIoQ5+7f4foswtgBVy?=
 =?us-ascii?Q?j6WwsdF2D+ka0KVte0GTylSjmgXEDHYhhd7ni9gNaDV3Rw8M6pgNp30EABxH?=
 =?us-ascii?Q?3IU6FTXyEeOPBnbPVJqSvUxdis7bahEFL7nN7tptA48ovgineRrrFt/rF0Ss?=
 =?us-ascii?Q?3wedxpaUqq74SoYdyNBhYt95Rcmu8/ZMU/Dfqz/RBr1aR5I20jK3gqHGWVxS?=
 =?us-ascii?Q?3YqBHCgG8haDAGhpT/+n1+FuJiG87nV0QwFQUSKafBYQRtJiQHKvr0j8CGB+?=
 =?us-ascii?Q?2HtfYSzvGzaEHQn66tE87zBtYW44hnJZrqV/3GFGJT8YaxTpparXbhrGtM9e?=
 =?us-ascii?Q?8UXVOZdU+P9DdatJfMVZqfK41pyNC4jV+M+WLZwcmU+Uhxh2c/pgxgj/2TtR?=
 =?us-ascii?Q?wlkBTck3xvTAheuXoTjqfUR4IFErrFz06tNRwPOydmkhgHa+jD4DvqIGQJ9e?=
 =?us-ascii?Q?jOVeVhQbVwg2Vye5+/FDW2rTSHFfnhJ/yEl3mNb2nlgYxD4CY2PfPRsjzg9I?=
 =?us-ascii?Q?rprUqFPKgM1tyFoMTEOCLCqFN4z4aS/UcbLC7v4Uup0Ttkmk85gVQksYSwNB?=
 =?us-ascii?Q?VRdZ+lnA0c3ZtTI0DqKt05/sGrt5XjxqrILj8okvaYeaUXQSjgTOyGBdFnc3?=
 =?us-ascii?Q?mMq7/s6m6L8adERthD1EqKpZ7WOyGN5NLIWTK6cvnSjTmGM2YAKju2deyWI9?=
 =?us-ascii?Q?/BABLEH9LPfe6ZPNCUiJDFew+q/mg0jIgP3uy2HOu3GixrdHnXb7wHq7wwvy?=
 =?us-ascii?Q?1SsM2YrINjkp2vL7xnr/YAzJB0kjhd5ObmgVu9O6kfkDDshUN6Uozd6XXbS7?=
 =?us-ascii?Q?zX2Hy2JvLqLXdFDlMtIPeOYn0IOi/gRz/6Gxuj1oPznY3ZL4hzIymzySqWeG?=
 =?us-ascii?Q?gdCvpAjKhJgTracuVSErspKc+b66pnQaRvL1aNC8uGEBvEQcQhaFB7nLAnDJ?=
 =?us-ascii?Q?og06yZ+bN8c0tgwOIxlFKeL0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87b4f71-37b3-479f-3d84-08d96875753a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 09:39:53.8588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmEiEGu91QaGoHc28Lf1JXfNunuyKx//EgdeOPucEmhIrrOAGFsebrR6/y0EYmPkvppnh9WFxCA2bh7N92OA9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 26.08.2021 10:49, Julien Grall wrote:
> On 26/08/2021 08:24, Wei Chen wrote:
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: 2021=E5=B9=B48=E6=9C=8826=E6=97=A5 0:58
>>> On 11/08/2021 11:24, Wei Chen wrote:
>>>> --- a/xen/arch/arm/smpboot.c
>>>> +++ b/xen/arch/arm/smpboot.c
>>>> @@ -358,6 +358,12 @@ void start_secondary(void)
>>>>         */
>>>>        smp_wmb();
>>>>
>>>> +    /*
>>>> +     * If Xen is running on a NUMA off system, there will
>>>> +     * be a node#0 at least.
>>>> +     */
>>>> +    numa_add_cpu(cpuid);
>>>> +
>>>
>>> On x86, numa_add_cpu() will be called before the pCPU is brought up. I
>>> am not quite too sure why we are doing it differently here. Can you
>>> clarify it?
>>
>> Of course we can invoke numa_add_cpu before cpu_up as x86. But in my tes=
ts,
>> I found when cpu bring up failed, this cpu still be add to NUMA. Althoug=
h
>> this does not affect the execution of the code (because CPU is offline),
>> But I don't think adding a offline CPU to NUMA makes sense.
>=20
> Right, but again, why do you want to solve the problem on Arm and not=20
> x86? After all, NUMA is not architecture specific (in fact you move most=
=20
> of the code in common).
>=20
> In fact, the risk, is someone may read arch/x86 and doesn't realize the=20
> CPU is not in the node until late on Arm.
>=20
> So I think we should call numa_add_cpu() around the same place on all=20
> the architectures.

FWIW: +1

Jan


