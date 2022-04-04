Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB14F187B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298423.508379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOhb-0001YD-S3; Mon, 04 Apr 2022 15:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298423.508379; Mon, 04 Apr 2022 15:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOhb-0001W6-Nm; Mon, 04 Apr 2022 15:33:11 +0000
Received: by outflank-mailman (input) for mailman id 298423;
 Mon, 04 Apr 2022 15:33:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbOha-0001Vy-A5
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:33:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879ec1ab-b42c-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 17:33:09 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-EaJHUD68MfKw1oVC83dYlw-1; Mon, 04 Apr 2022 17:33:07 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4620.eurprd04.prod.outlook.com (2603:10a6:5:39::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 15:33:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 15:33:06 +0000
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
X-Inumbo-ID: 879ec1ab-b42c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649086388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mD8yHOJxc+rAijGZVnxj50SZVMAfGoQcNHRtZtFz4wA=;
	b=KEghT8bki4hlvlxB/kHqigurt60spPSR1pdX0Ir/KdZtzZGU2YQE4QnGwM5vAbEpuF6rkS
	8qQ+AQISm2z8Jqfkvr0LZvTTUK499lDCi/tcavbbGRTmKTBZ/IvXuZn2grRZagaw0/tB7Z
	xDgQmN0VDeTjhUcuPGQRGg5DpyaCf7A=
X-MC-Unique: EaJHUD68MfKw1oVC83dYlw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US87PWg3Bu8ynHCK6APk+QYQET6nmnRuhxNRdhXsivVyccxRg0j8m3C84oCLXL4m9LMdEf4t/O6+LKmYV8XKE8zYj22HodQB9evPI3GNGsrHg1DYkvhEVpqvZ1aI3IImJmReRbLhgwXQLtR4dzLqfC9mNnwkbtcl3o8FjA5xaYB4wmo6YqX60XEUbvPxQV1gLCXEsIGA+UxloWZY/roUiPQUXS3nHb5c+tdhx5WJWq51wjd25xz0OOkJswN2hS0K49xKMek9YsafA/daXbek3Mruey+cACNGsJ1R572ZW552YAOdsIRDi6hx6ye8IrM70HMtP2D5cWIyMkQ3KHm5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGwiCkItbxzwbnAFSPpg2Q2/IMgz71TMPlzmAfJYVrg=;
 b=U3G9z6PNF544djMQbsqK5tzf2J0GLdTuzuXTl88hF4bjPsOoGLJHAJQojFRCCs4GhZga4fyPtqgjO5lvbsyujQZjHkuu2yIJg/Inqfdp+9WjCTvR2ZRhMcbWNAHpUer4rg5a96hIHaA5eXY9nKvVk1gySqiLFgPDxuCCTZ5OaK2BuHB+PqZ8burVGCXhTrwGbt9ueRZbe0ewwOjw/x2+2QV0MRCbgmyTnYs97IzDF8t1g9MletzY9MC4uekY+zojzsrozJnRFL2zcpacFSfeCJodYNwld794ZiAd6ADoXi7T7wm3GwzYLK8KZ+dTH269cSDKZY29YAYaaZBWVQTlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0dbc693e-dbff-a326-3d91-b97b7385636f@suse.com>
Date: Mon, 4 Apr 2022 17:33:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/4] x86/time: use fake read_tsc()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <bddbec0e-acc2-03f9-fe4c-167fa5ac0ea1@suse.com>
 <YkrxAX7X1sxVf15r@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkrxAX7X1sxVf15r@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0088.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10310ef8-ec3d-49e1-3b99-08da16506a24
X-MS-TrafficTypeDiagnostic: DB7PR04MB4620:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB46200464BD4870FCE4221604B3E59@DB7PR04MB4620.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HYj7QjHcXhG7tpDBNN1I93XEjusFhbKR6uoYvkXHMvRbvylnLkrq/nZ+mtbjnA3yTXgLpCA4ght1lQcCfbhmttg/3s8SgPskPOp0JfSCfMCaZjaX+xQQoRgAPG0flRvPxn+qdtOw0cFk/DGBZDd5FfxbkzjFoEhNDvO8gpUPqWxYEqYzsrzWswQx++aXj3Rh1tI4qj1VxYwvp5mt0jXkfMrIj1VR4qpHsy67LGAyLZZgqY4NflDis8O94rMBtDgUFw/oSfXgJjKRKXIcgJI+z1STQ90CQUbrxFQZ+3y6y9+PdgF1Q+D/Sq7GNvZ+9sPRfQSu/qNiLoKRZcE50QDtQdo+CRzSW9gBBTf63A4KnBJqya8xIPeJBz03rRhPakPxFlYIQ445on+jvfshfW7lhc8R+Mwt+U9oyRKOwNg+znGLZpzLX9/HWqSFrrojp4Tyv1o1eGae3lo7lGD2XME8ARsklunC4+eV5NzBta3/urTCqxV8Tj0FK7IKTqSYpLtL7o8STob24vY0BFTvVGaGI/C4awBEYL+rfOSy0zjfdQx9YrwxLaM+ePGysj4ROrRICAyuPeCugo98LAGPNgEkCm2heDxUO6LReg2FyXoJ/scWOFS3thE+vIQs4H5lfg+AHElEDZ/+vDXyexMlQYdPXE2M6wRQAlJEUiMYBxltyIhom4Z7n6RgEkowP/Y2jVVLDZ4fim2KijaSPVG25gAY55lttObH5UHLKWyBYvMbo/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(83380400001)(6506007)(316002)(6512007)(53546011)(2616005)(6486002)(8936002)(2906002)(508600001)(6916009)(54906003)(5660300002)(26005)(186003)(66476007)(66946007)(66556008)(31696002)(86362001)(8676002)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0u/nqxY26nr3LXJu3SeHfA0pMV253X2URlRbuLBY4iGgYuH/b/UbGrCqOYbX?=
 =?us-ascii?Q?De/WOJGWqpVB95PoACdBp+2eQtFxh+87HRMDPqdwfv+7PhNskGnYN2H+bF+K?=
 =?us-ascii?Q?2caYNgPLd9hbZPiLhN/NZuqEewP/9MrXDDReVTvAqpsH3/xkuXSR3OT8I/VM?=
 =?us-ascii?Q?3iEZkYgtPUJnwWVgPytKBxQ0NXPOVpidcaIs97uKqcMQbsxD5u62ospMTmnv?=
 =?us-ascii?Q?ALvWlDPfUQUnG6sYJQiootyJjxk/uuMmKxGoLrXUwduXIT6WBmX/YfY1xCSs?=
 =?us-ascii?Q?L/6xcidmRoi2kPIf3Mm12ZHqEV1zztkgNDbK4y9cs4hzEQ7yR/lvi6b10jdy?=
 =?us-ascii?Q?F+EFr2nnqNIvh2+bXHCxqJ+m8pA7C3u22bNcZa8FiqSVYrPovGXyeDXaiege?=
 =?us-ascii?Q?3W/OMfZNTb9j4n2A29rSXe7B9dotMcli9ahiHCWaVd/uWl1HPmbvYJbA2KKK?=
 =?us-ascii?Q?Dsu1nepNbeo5VYgz9fEhk08IuXl7zn0WCt+2s3k2K3IIl8gHeDV44jd9dQBd?=
 =?us-ascii?Q?vOInoqnsJZOCSXSAkbRZ94zlIf8QWIuoAluDNxVQ4spKqUMrdSBaBZnaPspW?=
 =?us-ascii?Q?uAqW/qMS68FTkNQYdifg8qPsZWFASQVM7wcntJpUEqsdJGvhYk6QmPDxHzsi?=
 =?us-ascii?Q?zOWZlnae7LBxRrF2kdN4RYuDbrlHDNf2uuQ2fk6tJpXEuon6wYHMQNCHUSQO?=
 =?us-ascii?Q?VU2c/AvoEbUkI0mcVFiXZpn8tiSbRnAjwZcGs0B3Ka2IHsX6b5xT/cxLRziM?=
 =?us-ascii?Q?cnX3pxPOtWjPkg1H4B5m23X4GtjbDnWKtUM0OfSc9B+ewXCSSPCHShK6Fh39?=
 =?us-ascii?Q?FKfwkhh/Yc8DGDLoghAc2C/Hnr4UKyQeFdt21qC6XDVuWdHs53r1/+OeN5CQ?=
 =?us-ascii?Q?z2w1GvqKoYvtX0DEds1a92m6ks7Eik1GLglQ+JgagDIjlEt3Wps8t2090Bl2?=
 =?us-ascii?Q?ODU/uM63z8e4ecsuhKjxvk+b9PHOIdNhWmUnz/qRyp4UV7w9joTp14OVrrj6?=
 =?us-ascii?Q?bHpm3hwcfa3OHh43Q4qzpuOVcQXM4e46IFB0MZbf6C71+ZxCRoJFqugQIro0?=
 =?us-ascii?Q?wYMqgdkIaJWdvMkWZ269z+RnHbZFU1CchPMtuKSs1GPKnPcfO/4keZBMUMpK?=
 =?us-ascii?Q?52ywH0XHgPTuC3BaugXO/cA6CamzhtvZh0lDRcxAV8YgRffeYumGDL2i2fvK?=
 =?us-ascii?Q?7es84rvc+/qhosDycAYZhrzBakLXglKbCWlnqUWFJB6TM+2xCo3FYoAsBc76?=
 =?us-ascii?Q?dUqHqx70gMTrZdbaHD+OM8wikeELdbrIxTeiJtNIGv2gJ5Uh+6xbSnxroRV3?=
 =?us-ascii?Q?mgavf7XjxNH8auzJNo39FWRyA7cThqtLgFmLc7DRWJI27ii1KMMX/EkXwp96?=
 =?us-ascii?Q?LmjiHjWjOSpMqfcJuwB9hBZHMjeX9yyx6x4S8PA4SWKSCtaLWhq9QOPcXsF/?=
 =?us-ascii?Q?jNXWBsheod5R6kTvjsbHMRKwNpW6ppQgJMvHJHcH4cpljG89VIjF0BUJ+kUA?=
 =?us-ascii?Q?y8gbLTE8Dnqi7B2Hu/r1N4Q0Km9dmulaFWtrAyHZmJtzEqJPJaycSxtarVo2?=
 =?us-ascii?Q?PkNjYBJL2N9r6KfZrq8/LqBd2iOLzYuwof3vIpUHNdTI6+20IsYWEPR3I2Ov?=
 =?us-ascii?Q?BGzdIJqI1uTD3beGPseK7/ysfd5J9iZ0EqPztmIdeerIKgSdaGhgQyUYPKb7?=
 =?us-ascii?Q?S1lkCfwwwFhe5VPYutinUaZBHfsbek4mUCB7/MWn1Jk7qtoAvKJl4abJtx3u?=
 =?us-ascii?Q?6eV15V9TWg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10310ef8-ec3d-49e1-3b99-08da16506a24
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:33:06.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab9kjEydoxzXl7Y53AC+UdmANTrtS0fH/ZG9bQfD0sP+hA55JcuJ+eGNgZKu01DVHUzC2aMpHv4J4+lo3O4f0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4620

On 04.04.2022 15:22, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 11:31:38AM +0200, Jan Beulich wrote:
>> Go a step further than bed9ae54df44 ("x86/time: switch platform timer
>> hooks to altcall") did and eliminate the "real" read_tsc() altogether:
>> It's not used except in pointer comparisons, and hence it looks overall
>> more safe to simply poison plt_tsc's read_counter hook.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wasn't really sure whether it would be better to use simply void * for
>> the type of the expression, resulting in an undesirable data -> function
>> pointer conversion, but making it impossible to mistakenly try and call
>> the (fake) function directly.
>=20
> I think it's slightly better to avoid being able to call the function,
> hence using void * would be my preference. What's wrong with the data
> -> function pointer conversion for the comparisons?

There's no data -> function pointer conversion for the comparisons; the
situation there is even less pleasant. What I referred to was actually
the initializer, where there would be a data -> function pointer
conversion if I used void *.

>> ---
>> v2: Comment wording.
>>
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -607,10 +607,12 @@ static s64 __init cf_check init_tsc(stru
>>      return ret;
>>  }
>> =20
>> -static uint64_t __init cf_check read_tsc(void)
>> -{
>> -    return rdtsc_ordered();
>> -}
>> +/*
>> + * plt_tsc's read_counter hook is not (and should not be) invoked via t=
he
>> + * struct field. To avoid carrying an unused, indirectly reachable func=
tion,
>> + * poison the field with an easily identifiable non-canonical pointer.
>> + */
>> +#define read_tsc ((uint64_t(*)(void))0x75C75C75C75C75C0ul)
>=20
> Instead of naming this like a suitable function, I would rather use
> READ_TSC_PTR_POISON or some such.

I'll be happy to name it something like this; the primary thing to
settle on is the type to use.

Jan


