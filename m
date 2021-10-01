Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F641EDB0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 14:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200600.355124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWHqY-0003bz-Ut; Fri, 01 Oct 2021 12:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200600.355124; Fri, 01 Oct 2021 12:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWHqY-0003ZP-Qw; Fri, 01 Oct 2021 12:41:02 +0000
Received: by outflank-mailman (input) for mailman id 200600;
 Fri, 01 Oct 2021 12:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWHqW-0003ZJ-Ed
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 12:41:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d357e728-22b4-11ec-bda0-12813bfff9fa;
 Fri, 01 Oct 2021 12:40:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-0zuZFZCIM3uFSwhEQyF8Pw-1;
 Fri, 01 Oct 2021 14:40:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 12:40:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 12:40:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 12:40:51 +0000
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
X-Inumbo-ID: d357e728-22b4-11ec-bda0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633092057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sk5xXoMECgoAPRmqrXjkZhP6tXMUOjqsXm6deHY5wuo=;
	b=k3u4bHfdVQXAggqaAmWH/bTkS7usQzxdlHkVGijptl6dQNAE+0jUn/cbVVUjg+Q2Jlk9O0
	4ERmXHg681SFWqIi6jDh5LvSs6V9F0DRBNY4pTm7vGyVNOiofyuhGzNr+jyQMnUrBO/t5c
	1H/yE0mSD3VNuQlgE4Om09vlQL08+Jk=
X-MC-Unique: 0zuZFZCIM3uFSwhEQyF8Pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EujXjLyN+emKrpVByOg+VrL8cwUOIBm01XecQ0HyeOtPJfmmrHwitJw18IjKOQ137OObiCdz0eY3Z5OgSyJ4um+Zx6lHWUSpMDh0oVWiUjmpklY9zjCQu4q0nhBValZo8tUKH9xCDsA+i7KWra5xGDL9hcSkBMf1HLTre/T4QFf/D0ZR5eBu7jmAViiPP/wPx0T9HPSAInu502mCYAScWYA0erWiOxhPRjby+9np53XQ4lETOCFZZs3mjM7v12eeb2uSwzjpVojYF6L0nBht5cfHzxSag7pss5sS2mQeAAoOKacu4Yqq3t+R3/XyvpUSgo7l0PQzbwVJ9mlJ0iLqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HVoRp3HJtQ+BByKx+UH2Z/rmdwcUrvQZUxWIiCqngs=;
 b=c0DVgl0TtpGBiOhEHBm+E44GLB7W+j7YQdgrTqKdaCeRjOMRgQ+c7JYmqh8eA1nKJkHVVyGz8/MdWc5AXCZ8DR7c0F4uEL4uyT6lGkI0aBc3oI0fG4YzAZpVJvlFna2C0BQCl8IHM1bFNWzcrpFlVIFgTTETj96gpPhaWRL/M2txZn3qS4i6qfVpTRM3zw8T5PUsfHGer4dG1N4elVi5IuWeAYg7rBWthc2QQ1feov8u6sR3c3wP5xy9nDmHxncztXccHpge2kZrFQAEHY8wRiaZT6iJ64AcT7g+PVWXr8yqaet9LnYggNfuusXxo/LXhRdbUD5PJvil1Ys3yG0pFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <Andre.Przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <d7f62249e6aa7b33017ef707d6bc451b5e2c7047.1632847120.git.rahul.singh@arm.com>
 <491a49c0-d609-c122-f64a-999b16ef3a83@suse.com>
 <F537F4D7-A4D3-45D4-9A0C-AB573CAA724A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38119531-4c0b-42b5-59ee-eebb70c1f9b4@suse.com>
Date: Fri, 1 Oct 2021 14:40:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <F537F4D7-A4D3-45D4-9A0C-AB573CAA724A@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa1f8539-2cce-43ea-e159-08d984d8b505
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638286DF49F8351C6F68EB1DB3AB9@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fxJQuGcQ0KL9IvkljzWkPxAJaiw2upmu7WzH80eEmyg9DApOeQOkjNT4Ug/48Cjw0QBluvOib45qLrhr9Mi6mARlwKfLwHFxH0D17LrLdOTEVH5jK7nzAU7cahBhCCIx6f//bA4/eORjvNpqf/RjRJ1HgjeMdy7Gq2pi0DXUn3lutK9N5slLASMFYZBBNCGE5usgcss1D6zp+vFZOfwkfAgx4+RVS7EYnZ+C6eH458pPLbe9Fs6nlvd6HHBVo1D+erKGoRlrV85RDt75KFDJyTqD1KTdREEbrBaO1Xg0Po0OXQNtzUBqXq+tuWBUtOIKX7OaYS849H1iVO4kRD2JZQ763rRFjakWPhuzAwyG9aZBkatsm6sXHkuo6q35WNFxvhTSTOkYIe7eAFGfzS9VpwQ7CNMxcfm2zGNk4U2weAAz5T2KmRfKl7vL999f8gPvOpf9ZPsesvd83X8fDMV1tQjAxE11Co7q8H84ls2x/PC+IU8wKRF8rybG66jgR2ULnZPCVUpwTI9aY0Q54VGwkYEtiw7WXzl+y2ziZtG1bKwssdP6k64kAx81i0VyRQCzMrjkJoNb0Vms5X0Lhq+qiuCDztzaZpOYBoNTJLlZH1gs4FeTQUaDZuGzmN+RF6pqUeDcCVpeqdrf0nYk4sSgFwrT9ccKU5Yc+gmYd9IN4bwAsvZghrXnGo8TzI1OEOBVPDQF2Rbbv15oGEhgbl/5thv/GJmHw9lM526YSkP+PSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(53546011)(54906003)(26005)(16576012)(38100700002)(31686004)(4326008)(316002)(5660300002)(2906002)(36756003)(66946007)(956004)(31696002)(83380400001)(6916009)(8676002)(186003)(66556008)(86362001)(2616005)(66476007)(8936002)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KdlnC/zlg0i1K/Ac7o78umcZuSHVu9m6ToW9zBkWHt9gawJ5sMtWsCPCq/q+?=
 =?us-ascii?Q?r3TT1cTRAxK4dekH4gkz+4EFh8V7FhGz66LhhazHzj3v4rg3K8nksUcOhn9d?=
 =?us-ascii?Q?do4DoT8VfRV1CGleRdsVRlKkjSLSVMfbhCyibZqUi30IleEMoIHkRaAZRj/X?=
 =?us-ascii?Q?Zoy9PlSnTcZYgoEqRr0Dbb6QAqp4j2aFOyBknx/TcFZ+8Jz7UXj2kNQSb0dq?=
 =?us-ascii?Q?FTXlllDxIeDK4Gx71B5HsXjv0m6pqpmza8YODHBdY90Yr6nMsoQ2A+HodlOq?=
 =?us-ascii?Q?Ao1SAcBP66xfUed8MVTY/2YZGZR/WsnyiS06VuVJjJ3Qn1DecYS5XrQ6Vns3?=
 =?us-ascii?Q?NTEZ9kMEMEJETMN6qwjOze2RkotuYgnCO47mBtB5KObC9cHqgP/CH6/IrLPw?=
 =?us-ascii?Q?KG9pFKB+OMrElaVlkAVpxDRcMJ6K7EBo+ETE3mWUoWd2nroG3KhK8UF1gQug?=
 =?us-ascii?Q?OCk2i8S0hvMmGNLo35yuDCbINpPdTkrSn7FVhm0YxJUDeDv/twB3ApPFNDpJ?=
 =?us-ascii?Q?vlOyX/nww2sdOXBzEu7r7rmSeqz9yx3Z/dDf4vwvL9b20Smf+btLs1+vk41A?=
 =?us-ascii?Q?lpzAG58r5SjKOXBb7S1QFX7yHKb/IBQVVzHBhxgvbBtNQjP/PxqY8i0Ifi6S?=
 =?us-ascii?Q?1V2BIUT++FFceIo2xm+0C1uxXvzj4gRRoEEgt6JFpcoKY245BZF0X4/K5fAg?=
 =?us-ascii?Q?zBskkgQgHkvHYAMOB/4hWmKCYHReV58X4hzHOF4sYWrA5JvaO7CGR1KFCbqp?=
 =?us-ascii?Q?WidjhksTDu4kdS4ADmFbp/DPcGmYmgzJ3WAPoAMUqyrv/CSFdIdwT4ozN2QF?=
 =?us-ascii?Q?5dI+p9P68Tr/U4a4jYBanJWWR251i2S0G+QjHU+07+OGYnx9TELVId+QsfZu?=
 =?us-ascii?Q?bgIEFaLrUJ9e0wnV30BqUViFAsD6CllHLuudiSxlRm87/hQ6xdbhrfOLxauQ?=
 =?us-ascii?Q?mc0VKMvtq5Xol7kThU/AqninNtGaX2i0hUPYqtltU0GThub4HfZfI5F9MSeJ?=
 =?us-ascii?Q?YDB9xEWv+SkE+Um/bTrV5GnsnArQyHDXkiTqZW/jyHw2LtFpabzb3i3FS2Vo?=
 =?us-ascii?Q?tF0PGrhvPfxVRVXPX+ZJOiv99HGVquQoQzA5HTsSm+fMQBguH0/k0Acd73C/?=
 =?us-ascii?Q?rP0r7iZTYkrPpvP0ZjjeJNW3ehPDRIO9lHESQz+Mxil718iamYjaoT+UI69M?=
 =?us-ascii?Q?a+rdsSx6fROC5aH5r/4Pkw7eIrvFZwnmu8dUWs7shWHMkAY96p5AtEGqMxcF?=
 =?us-ascii?Q?NBh7jaYZAfL4v7WrvQ5yowlgPS4XT4hgzIwoiIYkuZtCp+auesWlgzn1T3Rg?=
 =?us-ascii?Q?Q0c6/h5tqTFqXK6TnbvygQmv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1f8539-2cce-43ea-e159-08d984d8b505
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:40:53.6028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcD+66yDWbIKvcmvV6W6FTBKHkU2kbIKARBYE7e3UgmxWp4y9BCailPxnlr6bzVSf3tku2YzRSOqdD7cHI6pcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

On 01.10.2021 13:44, Rahul Singh wrote:
>> On 30 Sep 2021, at 4:19 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.09.2021 20:18, Rahul Singh wrote:
>>> The existing VPCI support available for X86 is adapted for Arm.
>>> When the device is added to XEN via the hyper call
>>> =E2=80=9CPHYSDEVOP_pci_device_add=E2=80=9D, VPCI handler for the config=
 space
>>> access is added to the Xen to emulate the PCI devices config space.
>>>
>>> A MMIO trap handler for the PCI ECAM space is registered in XEN
>>> so that when guest is trying to access the PCI config space,XEN
>>> will trap the access and emulate read/write using the VPCI and
>>> not the real PCI hardware.
>>
>> All of this is just for Dom0, I understand? Could you say so, perhaps
>> already in the title?
>>
>=20
> DOMU guest will also use the same VPCI handler. When we assign the PCI de=
vices to DOMU guests
> XEN will deregister the VPCI handler from DOM0 and register it for DOMU g=
uests.=20

But that logic is not fit for DomU use, is it? Aiui some of the other
series on the list are aiming to work towards making it usable.

>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -662,6 +662,12 @@ int arch_sanitise_domain_config(struct xen_domctl_=
createdomain *config)
>>>         return -EINVAL;
>>>     }
>>>
>>> +    if ( config->flags & XEN_DOMCTL_CDF_vpci )
>>> +    {
>>> +        dprintk(XENLOG_INFO, "VPCI not supported\n");
>>
>> This is a misleading message, at least if for some reason it was to
>> trigger for Dom0. But down the road perhaps also for DomU, as I could
>> imagine vPCI to get enabled alongside passthrough rather than via a
>> separate control.
>=20
> Can I silently reject the flag or do you have any suggestion for the comm=
it message.

Whether to issue a message can be judged by all the other code in this
function. Which makes the answer "no, you can't silently reject the
flag". As to the message itself, maybe "vPCI cannot be enabled this way"
or "vPCI cannot be enabled yet"?

>>> --- a/xen/include/asm-arm/domain.h
>>> +++ b/xen/include/asm-arm/domain.h
>>> @@ -262,7 +263,12 @@ static inline void arch_vcpu_block(struct vcpu *v)=
 {}
>>>
>>> #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_updat=
e_flag)
>>>
>>> -#define has_vpci(d)    ({ (void)(d); false; })
>>> +/*
>>> + * For X86 VPCI is enabled and tested for PVH DOM0 only but
>>> + * for ARM we enable support VPCI for guest domain also.
>>> + */
>>> +#define has_vpci(d) ((void)(d), \
>>> +        evaluate_nospec(d->options & XEN_DOMCTL_CDF_vpci))
>>
>> Why the (void)(d)? Instead you want to parenthesize the other use of d.
>=20
> I will modify as below:
> #define has_vpci(d) (evaluate_nopsec((d)->options & XEN_DOMCTL_CDF_vpci))

Please also omit the outer pair of parentheses, unless the Arm maintainers
insist on having them despite being redundant.

Jan


