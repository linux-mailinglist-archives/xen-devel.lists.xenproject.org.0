Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6734F6C4ECA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 16:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513506.794597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezxQ-00082P-V1; Wed, 22 Mar 2023 15:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513506.794597; Wed, 22 Mar 2023 15:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezxQ-0007zn-Qq; Wed, 22 Mar 2023 15:00:56 +0000
Received: by outflank-mailman (input) for mailman id 513506;
 Wed, 22 Mar 2023 15:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebb8=7O=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pezxP-0007zf-KW
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 15:00:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57e61c10-c8c2-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 16:00:54 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by VI1PR04MB6798.eurprd04.prod.outlook.com (2603:10a6:803:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:00:51 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:00:51 +0000
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
X-Inumbo-ID: 57e61c10-c8c2-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eD6dJMwnwljaQGvQmhdIukvXAeBC7o/Ip8YKTGNWMtyeLGEr0/FHJq8UOjSl5LmArWDNGErtaFMSIcR+t7/HeiM3LTIWZfZhjc6+2md6TOdf2/sXe6vOXWDzgqVqRol21pm6NDXQP6zNyZme7pJOnb4IyRbYNCx3kIyt5Qqaf4TcH0kWQR/VoXdsZyRRRJuJ8r+k0T1owJP21Q58tkP5rlRrKTIWsqt1d9/KlWQcJahiQiGjrA6WIbWv0PxVo/pBi0PbEq9su/EUIDOXzTUpnWESw8zcLF+zoVRCykeKqYJx+2JeuepKM9lNi612N11AmdW9dgZvQAoZSu6imTwB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCk+TvrW1VNq3EQ1RnOyiylEuzVv3sPxZOUDFM42nd0=;
 b=YOfY9zanvrysWP6iRftJlGm0zmTc4xGq7/gMz6UrjMIbRWY8eodnImRn/id4DWMlInofaYwlU6VMVSlAw3aeUAgnmmR3OI5lg2ELBrXbNE6/eyRti5QdWqpDB7/5Cem/JBkoTQWTvd/rFALAn6uG5Wy06xKhmQP3n2KG3dVDwnAwvR+1fVcw3Tk75Nio2cTBANg+nQ4nO43xJprENku9NJkQ/ZB09hhthn4TxV+hqHoqyGiF9Tg3tluT/5JnXL0jIoJEgqYVTVOMIfb0dqL/su9WIM/u/lRdbF9SUM6JUfFuyyGCWbPEPRLje8DJYXmW/Ujvncs6IOemD9MXvkX6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCk+TvrW1VNq3EQ1RnOyiylEuzVv3sPxZOUDFM42nd0=;
 b=T/HoZDXg3agxLQgqnEO1aQRrvbByaPwtUuaV89tgZRa//aT+X7ILQn+OLHE6ffq4RQo0C+eA8xt442l574QatA9aUxteQ4P+KziJ+1dSWgfsG+LEmgF0NUa0StYoi+AyzVz2FbkEy8SuG0HGLFov39oCsiNxx8B5cG5k53naJm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <1fae91d1-8b2f-b300-506f-99e7d64ac3c7@oss.nxp.com>
Date: Wed, 22 Mar 2023 17:00:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] arch/arm: irq: Add platform_get_irq_byname()
 implementation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
References: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
 <20230313130803.3499098-2-andrei.cherechesu@oss.nxp.com>
 <b0fe586a-1a55-dbc3-a673-2c3809b3c1d3@xen.org>
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <b0fe586a-1a55-dbc3-a673-2c3809b3c1d3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::12) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|VI1PR04MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9cc1be-8078-44b2-8c4a-08db2ae63a4f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q8KloMoi07sNLsgo2LKcz2sGctEK0SEm60WO/1ABbP9SjTXkqITYhfACyaGeiaZfiYiSfks78gd6XYxGrZYudT6p5I+Y7OXE8SsQOdBsrINDdS9EqH3og5IgxGz+i4k6GnPZI+wVWnUU0Yy+rUAUbT10uA4pydwsfHW9A1TOWK+HPbXWSPAl45jpT6kwE7OZMbH/dutF0Rj90LN7HAQj9Dr6zBcrlpRL4Xn0kmi9zmhQ9ikMupUx+ds+FgEe9ARulwJtTlIsaBCJkv0mE+v4REjBxNOvDlH2SuAe+xrg7AGVFrhKkuak22fwCSnyZ5yHkL+rEfe9AltvpUHFkj2JT1+MsTpFDTRMQfF4uyM6IX4D+z8VdnYMnpWW9mSXvkaKXUU4fDWuav2ZQdt087G8Qed9eGFHng2gaQ+A1alTQE8H3aasJmp3D0aFq3cvByzllADfFC0x6Sm33PfnGKuIO4kI32QmH3AbJRAUOCQllaStasaIWt+JGuMLWxalF98w9SwtH21ClD4oL2pHtaFeXzCdz7koSm+h2n4wqiIISEzCkr/QTMGujeCjrHKLKn0HEC2C1GEIcg5ji6CQ3JlSYl8ml92YQLfK9LlCJeal9XoHQgVyfO2rsMXFCdZwlOSgANs07r7650Y4Q9Y1RZqdECU/qVsRasV1DTniT5+URJioBbvTr2vzRGC00qsw7E4GuzsctaJ4aOJou2HL5FVV2BLz+uSOy5+UdaJFepbeO88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199018)(5660300002)(8936002)(44832011)(41300700001)(38100700002)(86362001)(31696002)(2906002)(6486002)(478600001)(83380400001)(6666004)(2616005)(186003)(55236004)(26005)(6512007)(6506007)(31686004)(4326008)(53546011)(66476007)(316002)(8676002)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhQT01CV1FhTUNDRFY4YWpuNGRkN01Pb0M0Sm1vcCtyZmNTcHJQZDBKa3Iw?=
 =?utf-8?B?ejlNV2xpenN1cEdvMjNERm1hbjFId1RjTEVQSlg1UlMybE8wK1h3VnVPYmFJ?=
 =?utf-8?B?TVlsUkVmOFh3MjRaUkJMZzUzYThKeGgyUndBQmcreVlnQUlXNFB5V0c2dm9s?=
 =?utf-8?B?R0VPR1g2RkV0bVJDY25aeHptMll2MldkWmtaU1pRZllzYUYxZWhJbkljRGV3?=
 =?utf-8?B?S0ZlaWVXc2psT21PYkIremltYmxMT3BKL1I3S2N4ajM0eVVLMzhudnc0L3RO?=
 =?utf-8?B?SnB2UEZHdUpkbzNSZ0lnYU1HbFhic1hzazVJc1FlM1ZpeGZPbGw4dm5jTTA5?=
 =?utf-8?B?cG4yWnNXYUcxTHg5S0V5aGo1QTA5NzVEMXQ4U21hNW1sZDVjRkUzUFk2Vmt2?=
 =?utf-8?B?WG1Qb1ZveXJDR1ptN2FlcG15bnROLzFoa2lraDErbnhEcnlVQ1BkVEpqOFQ3?=
 =?utf-8?B?cUdCRG9DVVM3d3hLL3cvYUk4aW4yTXVzQnl4alZlOEhRWFBRajkxdy9QOW1J?=
 =?utf-8?B?THl5RzRTZHlwdHhWNm9sa1A5eEh2VVpMRTc3NmN5K0JMTmx2VjlXeFJwTytW?=
 =?utf-8?B?azdnR0xSOUVQeFA5bjdtZ0VTWXRSaGxRWWd0N1Y3d2R5NDQ3ZXIvMkk3TFMv?=
 =?utf-8?B?Wi9tdVhlT3pLbHBlNGZNbkNvTHZEaDQrN0plWWJoYlYwa2t6MzF2Nk15RkxI?=
 =?utf-8?B?NkREbWZnNmE2VXlKdnVIVUdkYTloSEtGclAwbUpHMFlwN1hYZXloblJIR0Fo?=
 =?utf-8?B?S3orbmtlcFFTV2NQbm5ZRW41Mk1UdkxSQ2J3S1l4dGtGVWNhSC9ZSFZ6c2pw?=
 =?utf-8?B?L3I3SXBrdEE5cjlFSnB0TUhrREU1czdaYmVKWXdCcGZ0WHRuaGFBUTNLd3Vp?=
 =?utf-8?B?Z2pxWEUwQ2Z1SE1lYno0YURQeU9kd1Rtb0VBcHBvU0NaeXVWRUtPbm1IWkNM?=
 =?utf-8?B?RDR4dSt4bkZIelFab3lYRkEvK3ZHWU5aTy94aFRtbzlxNTU2d1ZFYW44d3dL?=
 =?utf-8?B?SlpHOTBoS3RkSVJheTRjY2FDUlRWMlBFWmZUQmh5WW5qaEV1b1d0elZKRHFz?=
 =?utf-8?B?Ti9GQ1BnVnJOdnFkOFZuQnRwRG53aTlnSmQ0R1Uza0E0eDdNY1dlSTJuc3dX?=
 =?utf-8?B?WWxIRkRWWkJremJidEd5NXhjVFdZbGJPQzBhR0dpeEJxd0daSnVrUUVHUllF?=
 =?utf-8?B?YkdacDE4ZkE4UmdEWkRmdEFEZnEvZHFoQXkwenRIWjNQRnVqSTF2L2wrYVZ3?=
 =?utf-8?B?SDI5SXFZdWxrdFIyejRsdnYycm9HN1NDc2tvMFJGUDM0SVBrazM0cnRidFhL?=
 =?utf-8?B?V1RQU1k5cXBNUVV5L3lFU2IzZkdnTklTbjEwdHhaVWkxRzhWWEN3SCs5eW5P?=
 =?utf-8?B?V2V6cXdSUXIwdU9GSUxlcDlIa3IrUy9rUkdveWoyVTR2YkxSb2M2dE5jR0Ro?=
 =?utf-8?B?VlBpK3pJZnJ2WlQ1Q3pyN2hjakp2MUFPdVUvK2dBUHk0a3p3VWxvNHNrenlv?=
 =?utf-8?B?ekc0ZTRKQU9RU2t4MXYvcGo0Rnoyd2xmTGp6Nktpclk2aUNOOTNoOXJyRVps?=
 =?utf-8?B?bkFLcDhjN2lkTGFEUXFFdllQN2UzSE13c2dTdHUzNFFXd0pBdmZlUE16MXZC?=
 =?utf-8?B?NElJNXZjek83aHJRaXJLWWFhYlE0NWNLWW0xUmhVRFJpVnVqbm9aNkowbW9T?=
 =?utf-8?B?anNrOG1jN3RzVXhWS21UQWJTUGRkL3NBejErdFZ6MjE4SVlpekk2TUlhbnFz?=
 =?utf-8?B?TkpjNUpnMHNGVUwrdGIvd2tFUkR5OFFSVTNQMGU1b3NYWkxaSDlsZ3l2YVFw?=
 =?utf-8?B?RVY4bDNDdXRrS0RLaVFVSjdFSURaVkRvTzhnUWU4SzZUenhSQm1uWlVUKzh2?=
 =?utf-8?B?ZGVkWEY2cm9GN2lhWllNbUFwcm5LN0xqTmFBVEc1ekNiY1F2eUM4MldSQ3hj?=
 =?utf-8?B?ck9XeTROSWtHRURLVWRLbHlWNHlRZEtBdnJYSlQ0SW9jSXpuZEt6emg0MXhN?=
 =?utf-8?B?a2o3RXBWemVySjdnR0Q2TmhNUHpIYmdPNVRXUnFnTDE1SWNpZjBGRmN1U2hR?=
 =?utf-8?B?Zy8xK2tXenFNenkvbzZIUHgyZ2JVdHQ4WmMxWWdidW16ZExFeTlRYW9ZN01Y?=
 =?utf-8?B?SWFQb3JraEVHRWwyTVZaY2RzWElBM3hNSGovcVM5WER6QVY4cVErZ0tGL3NO?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9cc1be-8078-44b2-8c4a-08db2ae63a4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:00:51.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ejzMqDI5maRGWEnNZHmJYhsMEpuruknT2lnFgxABKwiHZhsRvPukvwMeyXx/HrBAMTdwvPazmdBxj19PixWkxQ524QM9J9DaxkUqUWHIcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6798

Hi Julien,

On 21/03/2023 18:56, Julien Grall wrote:
> Hi Andrei,
> 
> I realized this has already been merged. But I would like to point out a
> few things for future series.
> 
> On 13/03/2023 13:08, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Moved implementation for the function which parses the IRQs of a DT
>> node by the "interrupt-names" property from the SMMU-v3 driver
>> to the IRQ core code and made it non-static to be used as helper.
>>
>> Also changed it to receive a "struct dt_device_node*" as parameter,
>> like its counterpart, platform_get_irq(). Updated its usage inside
>> the SMMU-v3 driver accordingly.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   xen/arch/arm/include/asm/irq.h        |  2 ++
>>   xen/arch/arm/irq.c                    | 14 +++++++++++
>>   xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
>>   3 files changed, 22 insertions(+), 29 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/irq.h
>> b/xen/arch/arm/include/asm/irq.h
>> index 245f49dcba..af94f41994 100644
>> --- a/xen/arch/arm/include/asm/irq.h
>> +++ b/xen/arch/arm/include/asm/irq.h
>> @@ -89,6 +89,8 @@ int irq_set_type(unsigned int irq, unsigned int type);
>>     int platform_get_irq(const struct dt_device_node *device, int index);
>>   +int platform_get_irq_byname(struct dt_device_node *np, const char
>> *name);
>> +
>>   void irq_set_affinity(struct irq_desc *desc, const cpumask_t
>> *cpu_mask);
>>     /*
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index 79718f68e7..ded495792b 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -718,6 +718,20 @@ int platform_get_irq(const struct dt_device_node
>> *device, int index)
>>       return irq;
>>   }
>>   +int platform_get_irq_byname(struct dt_device_node *np, const char
>> *name)
> 
> You are changing the name but don't really explain why. "np" also ought
> to be const as this is not meant to be modified.
> 

I did not necessarily see it as a name change, but rather as adding a
more generic helper to be used across the codebase, and the "_optional"
suffix did not seem a good fit since it is an alternative to
"platform_get_irq" functionally, and I tried to keep the naming
convention. I will have it in mind for future series.

I agree with "np" being const, I saw you have already submitted a patch
to change it.


>> +{
>> +    int index;
>> +
>> +    if ( unlikely(!name) )
>> +        return -EINVAL;
>> +
>> +    index = dt_property_match_string(np, "interrupt-names", name);
>> +    if ( index < 0 )
>> +        return index;
>> +
>> +    return platform_get_irq(np, index);
> 
> The existing helper was returning -ENODEV when there is an error. But
> here, you went differently. This is the sort of thing that ought to be
> explained in the commit message because it is not obvious why you
> changed it *and* that you actually checked the callers are OK with that.
> 
> Thankfully they are all.

The existing helper was only visible and used within the scope of
smmu-v3.c, so changing it was not a big impact. I agree that it is not
obvious, though, and I will mention something like that in future series.

Thank you for reviewing it.

Andrei

> 
> Cheers,
> 

