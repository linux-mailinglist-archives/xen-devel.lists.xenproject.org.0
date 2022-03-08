Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A764B4D1DD3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287237.487140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd6T-00077e-OJ; Tue, 08 Mar 2022 16:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287237.487140; Tue, 08 Mar 2022 16:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRd6T-00075P-LB; Tue, 08 Mar 2022 16:54:29 +0000
Received: by outflank-mailman (input) for mailman id 287237;
 Tue, 08 Mar 2022 16:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRd6S-00073Z-DB
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:54:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a22bf52-9f00-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:54:27 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-5mKv7_ueNaeumMiCnW44Yw-1; Tue, 08 Mar 2022 17:54:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4613.eurprd04.prod.outlook.com (2603:10a6:20b:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 16:54:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:54:24 +0000
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
X-Inumbo-ID: 6a22bf52-9f00-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646758467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=46rokF3Lxsgt/ZR3Ph9clZAayFv0/8XlMx+LgRvaLOo=;
	b=RUHybXpUmDrAX3PmfqjA2aFvJb6O8bv66c9rdQHFg2MyfX+HSPrWdz/PmoQ9rasr7V0FiP
	6pVc3CJzMjFxr0Qhk8Tx6os1dg/O+3D5eiriR5yTroUd60mwLZmJ9mQNE4MxTQngCJBidS
	+7QTXInC7Zr1ytoVoVCv+pDro0ONtD4=
X-MC-Unique: 5mKv7_ueNaeumMiCnW44Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAyow/pHDP8SZKy7/9zFIdVXTB0irYMRdSaATz4Lva3b1+pRDy0wZEIblsP+tev+iX+RJO8td2cOmfBbIaVXgdNvXTS/XXYfK/Z/tqwmooaChKpg6BdIITa3AyJEYeK82hO+YZZzYSaBLWQZHGt4j22dV7QGRFld7zCeNcTn3CTJB+Uro3ouuGfnoCcDVzVKt+AeJ/A65VHWnQVnmIoNvoxbMjm+yCwFXicaGvKHNtRCZMMaV0QYT0GZFnuROJx6sWEUCPdWwefJsjRVKQFRJuRqXSzbbuDM/Z/ElJTCg7SzQEiAv6pkL0gbiB+Wqwz4TeM56QwgRy/b5Dx4EJE2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Das1Cc0UZsMKw8U+GV+gAfi+gqzVBn1FjHp8HOYO4p0=;
 b=WsxGgl0yenSWWPFo1pzGfVWvUXOi39eZZTPOzI4ScmpMBuLHkknjklkMRMOjV2rKSih13BmjvrsI/MNJAj6RQTLTxl/94R/YOBm+L1azb5OcAiWeeuqiXi9BQq3SgGfl04/8Uos8WDxZqvzQfHBfvJVbvqPF9Hlkir0XbzI96plL7fOSeVI7y/xUudP835gPB3ZFfWS6apoub11nFumuHtY/QQ6ukq6+U0Pou8ZiqpblmCdayxskkegmrpE31H1pnPjlDBXnmSb5Tg+XhBmAiEctXUJBFfIyNAgehcSTSERZuC6LWtUziS3wgfuF2XIQbynej80yot+QB82AfWjqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fc643a5b-4025-a9bd-ded6-6a5d831c1d05@suse.com>
Date: Tue, 8 Mar 2022 17:54:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 1/2] xen/build: put image header into a separate
 section
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-2-roger.pau@citrix.com>
 <c2e15d35-91b3-ba29-eed0-92fa19a692e8@suse.com>
 <YidlvWBauhcrAQa1@Air-de-Roger>
 <8f37e018-ab41-3e4d-14c7-1a25aa35e958@suse.com>
 <YieGEMpcSl+qdZ1e@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YieGEMpcSl+qdZ1e@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0063.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 812add7b-cb15-4f15-212e-08da01244cb0
X-MS-TrafficTypeDiagnostic: AM6PR04MB4613:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4613D8135E94EE8D657819A7B3099@AM6PR04MB4613.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RGSuVcxjGnBOD/k1L0aJZPXqihRroAWRRqa6w6Hk7YgCc+8ruW/Tdhe/j+gOBA4WJHqwc18AAq/wETySrFs1C41b+rw6kBCTboABVnYuBO2XJNXdqVzOUcPTwRiMAuzHdPSsabNFHzWuWc6hi3aAjS5KkQMUvxnxL3p1D2uQ47iQB/6yDuocn2VNhlxaYnKfJ9Aym0ICuJXAR+wHs8+MEb+lt1ZAV66t9nuPd0IUtgR7EPnBralMiJHHyF7JMX5qfU0kVMtrzPTrruUMgdGTT0grNh9D2HbwNAyZ+Xfid3neVeGnqmlefJpcw3hFIVPpvO3zS7N5dJ1a6y8R1HOUs0s0XuI2eq2FPm0GU2wVCOpO2fov/HT2xbCW8pbVoIvEwBVN7ln8dhjSfu0tcjNx/OnEHV+T1/wuQg9TADZX2oGAfmdAetESSHwK76nEAsWbPCA7XxMXv8yrwRTLixvLCfb/JDte8EfglyczI0ZvZcVamcmkaHGZ3SjBb4ihyjplFGAtemA/e2LAw+83+mSg/gzU7f+UN0tRJUuAwOiCPEQH/yfdmyiqnEWpcM+v5onmtpbs9Z+xq5rL2Z/wNPdjZdNBSC3lwg48AlSbrQy2+y3QXVomHNPwVJotkkiNnS84QvbWWKt5J+7gBR3l+xEdTjItE/CJdkOleyYpdcsFT5W3BR4Cn77k5JobumkRaTPgueNnpn6opj4pNykrhrusgRSgZxUHqDjiegYIHAERY3XhvvNaJKO9+XxGrLM/9UT4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(316002)(31686004)(54906003)(4326008)(36756003)(31696002)(83380400001)(6916009)(86362001)(8676002)(2616005)(5660300002)(66946007)(53546011)(6486002)(26005)(38100700002)(6512007)(6506007)(508600001)(8936002)(66476007)(66556008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aOZW0f9j+G47izK6mwRRivqsl+4co+VgsmrQLVn5G8U5hMVHrjoCHzveaOa1?=
 =?us-ascii?Q?s/n3Rpjjte97hyde7ULODBEYH0kcGjXlhOYRVdN0Ndroxr8aVI+OKLzPAJ6S?=
 =?us-ascii?Q?P9wc0BAvBTe8q8GhhRbMgYFM04fJoUMbXx6QQNAaLxBxL+ddQQn7fmd8Rfa0?=
 =?us-ascii?Q?VuWEz7f8XI9RSa1brFeURdGbagQeXJRnvRFgsVuXRkfKYy7le7XIrIe6Qo2j?=
 =?us-ascii?Q?4LTttIBHLsCesRB+LHc9ZVVWsYcHybMzCUTQTJROq2+VbrAduxEoJZ98l2L0?=
 =?us-ascii?Q?JvZ1NAXVYc9gdzuU4IpDOyks1sM6F/Ggjp2AmQksrqyz7XHQdYB6nFuttT0B?=
 =?us-ascii?Q?FVqsIouV4yLQCm/kwgPjHcPLYQ4OoocN8rmUJbmrqxAB5HY1A00bUFIMcCw4?=
 =?us-ascii?Q?k+7GT4YS0vAkelsUfC4Ps2mqCUJbDw9emAubH7aQj6EcDudd4d9CXvVqTyMi?=
 =?us-ascii?Q?AzjrdmMOSIYAHD2rOo5q3r1KPwwYIzzoIC0AAeB6+0ZqRcaFnmSpJwYxW5Fn?=
 =?us-ascii?Q?VCQ28h/5tBvueTcqCq8WJvZzcRPGEurh1/nAET2uc2chc+fCrXTcHA/CZdjw?=
 =?us-ascii?Q?0Uv5ax99AVbGJaQv6+GI1u68V6A8j2qgAdT8Zt2Joh6eYcWuWEQ40vGsi8h8?=
 =?us-ascii?Q?irD2AgaPao2pq/dZ69EeE+nnUurAD8xYwFzOY955ZnQNlWorx/mwyB6vusn4?=
 =?us-ascii?Q?fD0PX9tB05S5duk7CjIlhIjbLeVZGEPOP/uTm9pmqWz6w80COv4XkP6btejm?=
 =?us-ascii?Q?Sq0Q4xzJcmnCmWtvXUwcwM8WVn6tn1ry2tv50/Gxp1vE78na4Kd4OnnM3Fzt?=
 =?us-ascii?Q?no9fymkXrP1uz/xKM8AbkjADDT1o7qD4Tnju6gBUCDLXdxDnz30SqOQEHdJY?=
 =?us-ascii?Q?8KvdSf/F+Uyq2ynvXa0y6AKEHBz5p2L2wxy8eYZKntBSI6LsqYaBI7gUnSYw?=
 =?us-ascii?Q?Pgcb0TtmPFvGHs/AfJ93d6cexBIIwm6VE2qi9WF65ssrfjjJB3C16C1FUQVK?=
 =?us-ascii?Q?BoY/L92z1oySsbx6y6kAqU3Gbpba9y7Whv9cRjbtGGZgRlFA0wlRIDYEGybZ?=
 =?us-ascii?Q?Vq4RxQ6ycpDI1LPV0jdydFUT7NP8X0DfnFY6vxNS/JF1RmmVoe9lFe4hS+9c?=
 =?us-ascii?Q?mFEvtoMCrocaLEEwEkUvb9aK1Uxaq16ligAJciK47x+eRFcWoATcMMMCzML2?=
 =?us-ascii?Q?3ANOIO6yqeQ2i5Fz8gedaRHLBe5TIeqQRWZ8r/fmAOvKj4VqbS7HZfN8+Ma3?=
 =?us-ascii?Q?yKt5T0X6nNOZe89mnGMz4VDD/kiIGfibK2FCkC8tsbG2EnDj68QTTEG1FgTV?=
 =?us-ascii?Q?CFQX1eVU0gd87oFu7lf0Hry+NkhE4RMNkIh44mmYhARhP2GsxaA88N/79ADR?=
 =?us-ascii?Q?oEHWhY8u+bNWdt/i1d0VQuGzzr3Fe9jOHQ2n/4v0HGR9R3MtfTrdVMm0LKTw?=
 =?us-ascii?Q?KBfbL5q2uo6wAcdH1Jonj298P8kWSOz3q2WgbhwMit54lbmmE/WoReq/7Uwa?=
 =?us-ascii?Q?uMavFGq9lIsuK3YaHFeNK7LYE/L8UcSIUjq4LUxm5nB7S/SedQFvVY7BrYF+?=
 =?us-ascii?Q?On2bgJmf/4GQClAtoEB5MuKuxMCCqrnqzP9eqp2cIX5g+QuGe4XSQ1rGZnMe?=
 =?us-ascii?Q?5fzTYZqftLj7F2AaaM/pNYI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812add7b-cb15-4f15-212e-08da01244cb0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:54:24.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAbc+g1SL6bRN6QvvcPr9s2xop2A81aCEQHAQvgq6dMm4XuUAEGZPTZ4A34lvP/fbDjt4dow7ls55c0UYIfoHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4613

On 08.03.2022 17:36, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 04:08:53PM +0100, Jan Beulich wrote:
>> On 08.03.2022 15:18, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Mar 08, 2022 at 02:57:23PM +0100, Jan Beulich wrote:
>>>> On 08.03.2022 14:49, Roger Pau Monne wrote:
>>>>> So it can be explicitly placed ahead of the rest of the .text content
>>>>> in the linker script (and thus the resulting image). This is a
>>>>> prerequisite for further work that will add a catch-all to the text
>>>>> section (.text.*).
>>>>>
>>>>> Note that placement of the sections inside of .text is also slightly
>>>>> adjusted to be more similar to the position found in the default GNU
>>>>> ld linker script.
>>>>>
>>>>> The special handling of the object file containing the header data as
>>>>> the first object file passed to the linker command line can also be
>>>>> removed.
>>>>>
>>>>> While there also remove the special handling of efi/ on x86. There's
>>>>> no need for the resulting object file to be passed in any special
>>>>> order to the linker.
>>>>>
>>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>
>>>> Looks good to me, but I have one question before feeling ready to
>>>> offer R-b:
>>>>
>>>>> @@ -86,8 +84,13 @@ SECTIONS
>>>>>         *(.text.kexec)          /* Page aligned in the object file. *=
/
>>>>>         kexec_reloc_end =3D .;
>>>>> =20
>>>>> -       *(.text.cold)
>>>>> -       *(.text.unlikely)
>>>>> +       *(.text.cold .text.cold.*)
>>>>> +       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>>>
>>>> What generates .text.*_unlikely? And if anything really does, why
>>>> would .text.cold not have a similar equivalent?
>>>
>>> That matches what I saw in the default linker script from my version
>>> of GNU ld:
>>>
>>>     *(.text.unlikely .text.*_unlikely .text.unlikely.*)
>>>
>>> I really don't know what could generate .text.*_unlikely, but since
>>> it's part of the default linker script I assumed it was better to just
>>> add it.
>>
>> I've checked - gcc up to 4.5.x would generate .text.*_unlikely; from
>> 4.6.x. onwards it would be .text.unlikely.*.
>>
>> As to the dissimilarity with .text.cold: I wonder why we have that in
>> the first place. It matches our __cold attribute, just that we don't
>> use that anywhere afaics.
>>
>> In any event:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit preferably with .text.cold.* dropped again.
>=20
> Would you mind dropping the .text.cold.* at commit? Otherwise I can
> resend.

Sure; no need to resend just for this.

Jan


