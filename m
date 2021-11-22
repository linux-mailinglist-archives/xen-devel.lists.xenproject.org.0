Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D8D458D0D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228802.395974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7Bt-0002xz-BG; Mon, 22 Nov 2021 11:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228802.395974; Mon, 22 Nov 2021 11:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7Bt-0002uz-84; Mon, 22 Nov 2021 11:08:53 +0000
Received: by outflank-mailman (input) for mailman id 228802;
 Mon, 22 Nov 2021 11:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp7Br-0002ut-E5
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:08:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9222233e-4b84-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 12:08:50 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-4E-nAg9nPReY7P5fOY9trA-1; Mon, 22 Nov 2021 12:08:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 11:08:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 11:08:47 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM0PR10CA0106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 11:08:46 +0000
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
X-Inumbo-ID: 9222233e-4b84-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637579330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMLW8+z5HHZOqnwplZ51EAucsTsBOHi17XgKnbqsjpw=;
	b=X7Bm8XEoy295QG3wKM60KZeF/jDkxJGxOoRd+RL8Wrvn3EknhJ91d4Zd425YI30owNZipr
	RfGOhnQzQsJYIomFz4sO0B3sjqoxZSC8LtlWMxR5ETjzMHOpqzcYd27tmtRqcLgaJQm2NW
	NzadIp2ltGa4Fn4Hu3hj7iFKA9PNMHI=
X-MC-Unique: 4E-nAg9nPReY7P5fOY9trA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6e9z3ZzjhhWTlBNrz6aIM2VN+nWmptmr6ViXSU3mXDiRZZahWNDxYCUdUUAhTkJH4+/Q8IwrlYoDXZ28rZkzpCjCA0OmVLt3sZD2Ts2NGq9u4BwZOKm1nmNfr4CiFo9fZ1sW2M7B2Rd5jlRvOBIWLFM9L2z1MUcOCgSvwTN+/COXcimHQkOYvBzWeVKqjAFTiTb+XGaZ4CRrniDBH/OWtj8VRWaD8qEp50sZEWu4oZQYad7/NTbH1D7uyeRNkC2Tim3GGg+q56Fv4xIjfOliiQqTt2wqRYi67pXgHqoCbVyQsKeswKVRbs1Ty9XC9d0I4MmCn40mKpxo+OPczgT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hj2qBNU4ZDhPcPoLzKBRk1i2q3LuM+GiyfwFUsOYV9A=;
 b=ZSxcr2eBzNCKWTNeuEXIoJUgXjSrOidg9fRmV9d+xIDzf5cCSCIZ229nn9luZu8DAcvAdJdJ/RY9JNwf5brT5zvthAliM2nAyxqB7kfMEmZ8oaaOSr5CzGzlZBMAzV1qjsG6olb/5kOdOEGTphfJrGoQWwu7Tsy2bcGAPhM40Wyg1Q74wD2QNBaVk4mlcxjZc0fD2nQvpRXiBGC3eLtC4CIrNRs88uB2LPTq2PflcGPmmERWJrrUZHYqpg/ABWTs1i6rhR9+iKUQ3gAcocYoSU6AWM9ZJ5gJpaJMTWfFgmi1DAcA2kbKmDt/Fccl7Fih4ZkOmRDslPHE1sZF2bl6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44e5403f-bd76-dbd6-7af0-b1807a9c89bc@suse.com>
Date: Mon, 22 Nov 2021 12:08:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
 <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
 <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
 <a0345cce-5b44-6cdb-681f-002403893e31@suse.com>
 <90fe8b04-4bc3-2d10-e94e-70e5e28c9780@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <90fe8b04-4bc3-2d10-e94e-70e5e28c9780@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0106.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e48a7f10-82f9-406d-55ca-08d9ada87467
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70248C1E48B4E3856445BE26B39F9@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/8bHm+mMUov3SwuBo+NUEguvYSic91cHgNnjgmNek7S63Klk8BQbMrxhFNttuhWmKpJd9SLWLGZ3N8BCtZaZyT+MqINBHIXYqcwEKWtIYDHqOPTEO6Xgqji6bRpnE+xbgujeTkzCZOabSjvJBdgoXkXjGYQEmqrnGrVFJnHzji0eSz93RclU9M/jwl2YMJCyzu1h2GXJqHf81ATKEheut7V7W46W5u/pXs+tTEDEzIwl95JTmPtTui61sm9PcA+2wOblLfUTap/MufIYlb3iSyb5Z1Iy49+ZO320NXEVZQzrZMmG2MZhWK+4EbUaOGjfmm31ZhgGaUBPT6y0OrTtTwY+mnrzFtOtH9MC49quplQLAJ6pHI4cFL872UVENBS/SzKQmBt54C9JPK460KzuSXm5TH6plXO9h0nka21cawQKiO/ZCrd3zgLqLmZM2pg/hkeCg3ElBiVx82ajJSmZvaNNBdlzlZsTtIP++QEjlf3cYJjrTTgtgeCvsU6NpT3TtRMJD9ef462h6O6Usr0H64LBMDTUvuDz04vvytQzJcQUoKyXk513iputVpj+raHKQKw1Aj4aohqIlhf4kah3enw7Mx8f9I3u+wEhxfB5SlN0+Ng2/voBrMNZDktHccX8YBjgw7CtytbE+bx+0Gh7vHxjKmN0gojIogqNTqyNeaMwh61G+8HbsvudhDbQaboLdz0KDvszQLQ0mA4idWY9S83U9C7sSzIQak8yxDvEx0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(8676002)(2616005)(2906002)(36756003)(31696002)(8936002)(508600001)(6916009)(38100700002)(53546011)(6486002)(54906003)(83380400001)(66946007)(66556008)(66476007)(5660300002)(4326008)(31686004)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WoqkmGCQY9HuLg9iuSSmFfGwZO/qNPufoMyBBkCbnTRknA9baAM/PbqMCaiU?=
 =?us-ascii?Q?kqnZRGp//ZJZ2e3JOzMYpaWcf4j9voleSMxD0t/Go/aonrPcEjttsMV20xqn?=
 =?us-ascii?Q?JLCD/+saemuSam6G3m7s8dzro+zyfjvhUsgcNAcUKy68NGo8cwX6G/kEYVRc?=
 =?us-ascii?Q?cq5HHjOO7XGucWC0v5vpgaN51h9872T1F7KSn/IOSxdgkJM573cxy29Ak0Nu?=
 =?us-ascii?Q?aNaJ+/GZy6SRPA17aGKMguwVUY0km+gFqrWy+EdfDeEuiJzABpLW6twE8tul?=
 =?us-ascii?Q?CFD0GHP0o82rmft4gF945nKn3548ulEsZTwEHVvB2AnND6ZEgRC7DqyI4osi?=
 =?us-ascii?Q?WTJgNoJRIyF+aulbY0wYDmaFRrFggbBkKuzYaTe7jCwuiOEOy9arSDM58p9u?=
 =?us-ascii?Q?TjtKLREg+KvI2BnfziiPlfrmSLerXsqvxabwuKHfSatKsewkuYKt39jh+snr?=
 =?us-ascii?Q?HkHVm3wfnTVQOk/oS5MiwEIaiSdTW5N13HD5kX15c00NpZSvJMSuLrc51IhE?=
 =?us-ascii?Q?AAYZ9xymSOsGYd2dpHYMoQ4t6lGVYxWiGE0MCiJGP6FPvf6NENbQT7fcapdK?=
 =?us-ascii?Q?ATwynM+FzHQjZ/EnCDHeKzrpfCcjxZnUA9dLaolm5alUKNC8s9vzWzV9Uaa5?=
 =?us-ascii?Q?Nt4m8owkSAsmtpL+EsiOBUm5eLaBfxeAMiCaAJdyBi6NLwZfE7e4yVmgErbP?=
 =?us-ascii?Q?GKXUfgI9HrI43mGCzt63zzG5AQkFYUoKFpYN5rfaybv9RX7Cik1Tv9C1sKZj?=
 =?us-ascii?Q?l1UW2jCCDggbWCAPSdHZ67PEhbUsR9Be6apS0hy4NxJhjuKcNihIbemqhy+K?=
 =?us-ascii?Q?77ZSC33oOtLGlIaIlGNIHm60lAEXvTlUvrIicQBD+TLi7ls4zCcA39rZT3ao?=
 =?us-ascii?Q?dqOyVWAkqzpDzqirxbFlao1JDmRBwfWJqXdcqyTpzlbDwzbJWn/N1xPdeSzq?=
 =?us-ascii?Q?6odRNvMGXJwJIQEZCsyy6Tm93mB3YE4qGMM9ueZ6RBLahFImI7ABGmnsOGQM?=
 =?us-ascii?Q?IptWzDzZ2k7T43CXAfwUwGHMaJtZH6V2FGV5MxXyHrtchB6MKRoopcdVNAiu?=
 =?us-ascii?Q?Eofy1c/1beLn/nIZyr7msF6q6FLkufvb9rDhwjv/QGD2IgVlUL7DU3AdyydI?=
 =?us-ascii?Q?6wbr2GehtjSEt4orM83MMnT9s5jZHTK6XPc8Gr/2U3AstczHL8ONbYfHTMUU?=
 =?us-ascii?Q?iqh86si8/Y5De+uuJFYYZJe1ufsTQ9MCfEFMcBT4ufkE/cZ9EUjGZ2LOIxW7?=
 =?us-ascii?Q?mQBVOHiKvODAiE1X+hOA+etpkT+Y0Alf2LUn02HI8rgXxi+pKOL+jfGtnzvW?=
 =?us-ascii?Q?vGUt6KXGwSG2h+g//Qrhhq8yNbXdPDjw3/8ks4oYIvxg9OKfUUu1iBdMUHAZ?=
 =?us-ascii?Q?neh54Pdyk1m+O/+rZ3/8O6vQpsAQn8erXbn0JShCX2fzT6VNWNdutk5+Tmss?=
 =?us-ascii?Q?hz8O3mDN2nRlpqG23XrdFTm3Wvx/aSZrrju3DtKKILZKXERy2dC8WxL/GwPc?=
 =?us-ascii?Q?QlVsHj8wjmmDTNgbacHoJfD29n3H5V1aBcp2hyaSTBOBTXqyL/z0MgMhuxAB?=
 =?us-ascii?Q?LwzNYrpZCk1KOMimpLPdAK37ko0qLnKgwGsfWyt8yRZ8im0K0wlEXdn+V6/K?=
 =?us-ascii?Q?Xka1e6bhe09zjQTJ1GUUvEdXvs0WVGi4PKRFwU+xPQ/TTlZ6O1gT/Rr6O1+M?=
 =?us-ascii?Q?Wkt1Sth9mPcbTaU2FhLCAqT0QaQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48a7f10-82f9-406d-55ca-08d9ada87467
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 11:08:47.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61jnGtvHbdBf0UshvoqqshzqHuyoT8OLXrTlh14oC78cqS7hd+AuAEufiQ/fz19g/JrOtVeqXv8YSZ3dHoMbsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 22.11.2021 11:59, Oleksandr Andrushchenko wrote:
> On 22.11.21 12:54, Jan Beulich wrote:
>> On 22.11.2021 11:50, Oleksandr Andrushchenko wrote:
>>>
>>> On 22.11.21 12:43, Jan Beulich wrote:
>>>> On 22.11.2021 11:27, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Nov 22, 2021 at 11:28:25AM +0200, Oleksandr Andrushchenko wro=
te:
>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>> @@ -206,12 +206,16 @@ static void defer_map(struct domain *d, struct=
 pci_dev *pdev,
>>>>>>    static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, =
bool rom_only)
>>>>>>    {
>>>>>>        struct vpci_header *header =3D &pdev->vpci->header;
>>>>>> -    struct rangeset *mem =3D rangeset_new(NULL, NULL, 0);
>>>>>> +    struct rangeset *mem;
>>>>>> +    char str[32];
>>>>>>        struct pci_dev *tmp, *dev =3D NULL;
>>>>>>        const struct vpci_msix *msix =3D pdev->vpci->msix;
>>>>>>        unsigned int i;
>>>>>>        int rc;
>>>>>>   =20
>>>>>> +    snprintf(str, sizeof(str), "%pp", &pdev->sbdf);
>>>>>> +    mem =3D rangeset_new(NULL, str, RANGESETF_no_print);
>>>>> You are still not adding the rangeset to the domain list, as the firs=
t
>>>>> parameter passed here in NULL instead of a domain struct.
>>>>>
>>>>> Given the current short living of the rangesets I'm not sure it makes
>>>>> much sense to link them to the domain ATM, but I guess this is kind o=
f
>>>>> a preparatory change as other patches you have will have the
>>>>> rangesets permanent as long as the device is assigned to a domain.
>>>>>
>>>>> Likely the above reasoning (or the appropriate one) should be added t=
o
>>>>> the commit message.
>>> If I fold then there is no reason to add the comment, right?
>> I'd say you still want to justify the change from "anonymous" to "named =
and
>> accounted".
> "Make the range sets permanent, e.g. create them when a PCI device is
> added and destroy when it is removed. Also make the range sets named
> and accounted."

Making them permanent is a requirement of your change iirc, so I'd start wi=
th
"Because the range sets now become permanent, make them ...".

Jan


