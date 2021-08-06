Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D43E2322
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 08:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164663.300992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBt3V-0003pK-9w; Fri, 06 Aug 2021 06:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164663.300992; Fri, 06 Aug 2021 06:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBt3V-0003lR-6o; Fri, 06 Aug 2021 06:10:05 +0000
Received: by outflank-mailman (input) for mailman id 164663;
 Fri, 06 Aug 2021 06:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i2ZJ=M5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBt3T-0003Vb-Vl
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 06:10:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef090e5c-f67c-11eb-9cad-12813bfff9fa;
 Fri, 06 Aug 2021 06:10:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-looGEf-cOHKv4lXaZSFcEg-1; Fri, 06 Aug 2021 08:09:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 06:09:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 06:09:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 06:09:56 +0000
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
X-Inumbo-ID: ef090e5c-f67c-11eb-9cad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628230201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHPWs8UT1Yr1WFog5189LhOf1BoG3MTjO3pc74b9gzk=;
	b=Ge/qg2lzUOaWoo5xdI32RfBs+AWc9iqtB0OKtUHcTfppHw1uXhW72JMbrgWHruWsRSqp+2
	E35fcMbHS+c7S5f5JlIEdfOGiVZZYrOL0oj5jjTSU2yJBtMMX1npra4mNWHsVe1rhKga2v
	2tGK461AvA92uRlxjbI9cTycQjPHYjc=
X-MC-Unique: looGEf-cOHKv4lXaZSFcEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXDqr8fT5ZD0CfRiyeFnlHOd+XpuHHLv47l3KbHknYSgZ7tzEMlfljBMXzJ9y8NH3ezvvXwzaK7aCwJU4RzSwuE9yQDRFOppDGzNJedMoa8+jIESIJlLojJJyuedanEKLReQJylTnXSW5zLRsgcl7bM++TyIlfihJ0UxgR4eR21n1ii2/79U1ssA8hJjcSCWbHIo/CYKxIWKhHX4JWsDkBBcNVMLP/TaHmvyx1h3dPMp6sWlxJvzpeOEEZsDKGwPaRsVJJDJSalf6eCXmeaWGP8rEDK6CmIno4khtiNvXZDjz+QvNAdNrV2waxxVAlsCv08gDyG1Bz4kHmnfUtSedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gODY3n5Lqize3C6VnG6zfsBKHFF0CBD79yiDTjR7yhg=;
 b=cVXuntuTUeRhdesRiXwMd+vWDw2CTll578nx4ASU03yjgyKN+xFXeWeInhIF/caz8+oWmfTtjAkERT1rDJxSHsxgIVjEnSVxn9yLv619yJPEG7wDQ0uQXVZZvBKyQObvmdp9/xHPCL+ZHZeUZGyBAIYYHPKYIWiyg9x3xg0rxjFjRgGpvUj/Jm7UjgwKNxgR/k97x+LKFclEdbXUB1MqlLrQ/xJ17Q1/nMhLoW3BbmsFzCXU1Kv3prMNJ1SKRnYR0oeO0mIfC0MEnlHXnwCJuwb+DFJGbQwCV94WuqVWKTZkq6LaANvLdAIywrWMQuJkkoDmWvnOf/cIy0EmG9zWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Oleksandr <olekstysh@gmail.com>
CC: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <6e573489-ceb7-03f4-3511-e6c166b318a6@apertussolutions.com>
 <ee685f11-4f34-614d-e0ba-7cafeda08344@gmail.com>
 <ca936d82-cc31-a127-488c-e4e33ceb6fbb@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4765c96e-49dc-ecb4-5c4f-2a6be5fb99c9@suse.com>
Date: Fri, 6 Aug 2021 08:09:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <ca936d82-cc31-a127-488c-e4e33ceb6fbb@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f73d8a-d34d-4cfb-8d99-08d958a0d0ca
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233310685AE9F4918469F32BB3F39@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cket8NwwDlAVo9cl5qyAvMeGp5w65OnttR0+aGk+eks7iMsbp0+ucthQ/bN01uZF2VH2LOWidm8QFghsvSSR1lygLpOl9cDbPlmCvJ2iYH2g+oaiDNDPZoYsdkB7qoyIKjMICXvlxQOQNIkPvXKF3JjuDuFXg+6Pp/w9FkG1/RGOQhzIO9664/PJ8lCtd1uhbvmWsaNf61sXIJ+hQkUWjAKFCX+mroHcaKu9seMaFkCs4MTLTXzGXVYGFmUtc63A8TIokLlNNL9Vvey3nRnE8K8Uns9/8Es/+g+V0KYtGn1AsIVPkgOneeyiQNpfA/lBgXqH4cumhn7hP4bNMqM0VZqdvmgyHMevPy3HoLIB9VnbyoUbxsCZbx5hQJKS8+i9/3DuJA09u/BX+N3Jn7byeblbiGid/RSmY5Yvz6e+DqzU1qLzHqBhZdirvOKPpn4SCA6jUW4tMrA3zp0lTvoZc7ear1BvFU6qLhpTI/hpOJ+p5ozTMRNgW5ATS/6HmqMtha0axFGEDCAJwEnMWSYfV0trNcIVk1pTo+5E98u46o2IT7UCAIkTic1WJpURSglbckftHWPep9g7XQDwn9W5huOURNvPvySCm4V9CzJzOW0djZd6w3/oflKJsXbnXXtby4J8sULAm1TzcpWpp4x4bN3JPFQBBtzYc3DUO+UTOdZApmvjzTHVBYW5Nmf48d1O27JqLcmW1bibZhMWZ4hpVqVlIZxcGbJkx84R2B6gbKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39850400004)(346002)(396003)(366004)(36756003)(6486002)(66556008)(66946007)(8936002)(66476007)(8676002)(31696002)(316002)(110136005)(26005)(31686004)(83380400001)(38100700002)(54906003)(16576012)(53546011)(86362001)(956004)(2616005)(478600001)(2906002)(186003)(7416002)(5660300002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBg/RzGdh+RuF3iLoFxbkNZp7TNEQ46YMy6FuMkxujRMMTxtqgLZYRqbZOKo?=
 =?us-ascii?Q?kVt0HuUWBJj4urP9vhjqrdBMHMMfrGrsiuwR+GS9LPTjUXvGVfioo86ga7EJ?=
 =?us-ascii?Q?FiFXuDTTuDRdwAvf+3lYftZ7UciXTpO6EP0k2xWjKTXa4kWKQ3Ci4e/JMU/5?=
 =?us-ascii?Q?B9xM3HmImFaelzQ09xTDE8bzD8VQ/MaxoZ5buvRtOE/bRILMigbAkH/PcHXq?=
 =?us-ascii?Q?HmRJ+ONtSJmwc0c0KUwqe6L3jZEIQYRD1PBL5zW6wQ1kcxfvSoWs1/RUS0L8?=
 =?us-ascii?Q?MfOToIqCnmaCKMqwPYJBzt8EG9/b057wBq7EkxNIetrbPqfeV/Hw9NmftzEz?=
 =?us-ascii?Q?Gv7shCb7GTd+iLjjjbjk3Fi67bxu2ASFygxltotZ6MPG/dSmXy3zXX0omVW1?=
 =?us-ascii?Q?QlzZi1wXEoesQZMNL7ylBlWZfN15x59t9LbxirMXhq6JPiXyOU3STBQtdCuY?=
 =?us-ascii?Q?F9zr9rc0/fY32lGec6a64go5m2GAVVCGiZK5MVwQFkx9E5nTmiqh9bF1vdbi?=
 =?us-ascii?Q?GltsXAiGPrEhhVnOIvmJQP5GN6KjMgFpLF/Cn1ylS4LKyMeklOCMQj0aLazw?=
 =?us-ascii?Q?K6OdztE8dIi5odGwRtu6svRcG63GXRWObcZIHdVJdsEQwL77IV204Cx0oO4Z?=
 =?us-ascii?Q?3ewAXERDwpYBCzsJyb5rukNXoYvhOdK0icxTjHwjoHPfjevDZ+xUZHvPk23r?=
 =?us-ascii?Q?HHtbzdt5nFW3JzzftC+NiPgwHNbA9XpmZHXnhefqVm/1wyqGQN6erFwRxfhx?=
 =?us-ascii?Q?lfGdMcXgn2cAxqlDLWNnST8F1QmL9D7xDVTs5NuVm25BqMUYkk17Z/GSKPiv?=
 =?us-ascii?Q?MZGgfAVjwVM7CkaFJNF+gVUCVjLr3Ovq9jjVqmHdRVwdCvMRYUKZP/pYqPQZ?=
 =?us-ascii?Q?1LKVayXA5czAR91ftkgCRIWh0JDDkDU02qS9pB6Gn/zNgjzQZrWQBXmzx7T/?=
 =?us-ascii?Q?5XJ1lisBD1eVi6lMxKEl2Cu7MQjo0NAqZgsHnF6cvSjWJDOaou6Ral4jgQZq?=
 =?us-ascii?Q?AT3Hs233H8b6JAAmZEossazd55T5E0HyT0vIFdd6HkY+6RWV4fdvKRRHiWeR?=
 =?us-ascii?Q?nqAxV57T4hiRoRFj9jKdeRXNciN1GNZSdXtDqGaXS8ZhkDKKboUDpAKPz720?=
 =?us-ascii?Q?i+fDQaU+HtS5RL+5bKdaVzlrJyKKSsA5HlLQlTgLV7HDvWsIFAGICB4NnC9w?=
 =?us-ascii?Q?4mLw7Np0vt7bmM2JIpPGRTRzmvpt1de/V9j7upNze16rSEqNDbdfclgiLf/0?=
 =?us-ascii?Q?bQ/zI0CGCZXaQ4/VubnBnnyi3ohSo+SHj8ZzBnQqaknAryaQAA8R9uyTKq7Y?=
 =?us-ascii?Q?mJoXdKCju/GJq0ZjM+dM4Cxv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f73d8a-d34d-4cfb-8d99-08d958a0d0ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 06:09:57.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB9SQruok1Pm+tWiZGChroZKIWSraBHkT42GqxLqb+qK/4Nno3QjLHhPMEswYCrGriste+rfHuD+V6wG8YjHzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 05.08.2021 18:37, Daniel P. Smith wrote:
> On 8/5/21 11:59 AM, Oleksandr wrote:
>> On 05.08.21 18:03, Daniel P. Smith wrote:
>>> On 7/28/21 12:18 PM, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd,
>>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 start_extent);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 case XENMEM_get_unallocated_space:
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_get_unallocated=
_space xgus;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_unallocated_reg=
ion *regions;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( unlikely(start_extent=
) )
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -EINVAL;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( copy_from_guest(&xgus=
, arg, 1) ||
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -EFAULT;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d =3D rcu_lock_domain_by_a=
ny_id(xgus.domid);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( d =3D=3D NULL )
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ESRCH;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D xsm_get_unallocated=
_space(XSM_HOOK, d);
>>> Not sure if you are aware but XSM_HOOK is a no-op check, meaning that
>>> you are allowing any domain to do this operation on any other domain. I=
n
>>> most cases there is an XSM check at the beginning of the hypercall
>>> processing to do an initial clamp down but I am pretty sure there is no
>>> prior XSM check on this path. Based on my understanding of how this is
>>> intended, which may be incorrect, but I think you would actually want
>>> XSM_TARGET.the
>> Thank you for pointing this out.
>> I am aware what the XSM_HOOK is, but I was thinking what the default
>> action would be better suited for that hypercall, and failed to think of
>> a better alternative.
>> I was going to choose XSM_TARGET, but the description "/* Can perform on
>> self or your target domain */" confused me a bit, as there was no target
>> domain involved as I thought, XSM_PRIV
>> sounded too strictly to me, etc. So, I decided to leave a "hook" for the
>> RFC version. But, now I see that XSM_TARGET might be indeed better
>> choice across all possible variants.
>=20
> If you unravel the craftiness that is xsm_default_action, there is
> actually a bit of hierarchy there. If you set the default_action to
> XSM_TARGET, it will first check if calling domain(src) is the target,
> then falls into the XSM_DM_PRIV check which is if src->target =3D=3D targ=
et,
> and then finally checks if is_control_domain(src). That will constrict
> the operation so that a domain can call it on itself, a device model
> domain (stubdom) can call it on the domain it is backing, and the
> control domain can make the call. I am not a 100% sure on this but I do
> not believe a hardware domain would be able to make the call with it set
> to XSM_TARGET and not employing Flask.

Afaict (perhaps leaving aside late-hwdom, which I have little knowledge
of) right now we have is_control_domain(d) =3D=3D is_hardware_domain(d).

Jan


