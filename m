Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B754AC519
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267218.460938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6dq-0000Qm-Ah; Mon, 07 Feb 2022 16:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267218.460938; Mon, 07 Feb 2022 16:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6dq-0000Ov-7I; Mon, 07 Feb 2022 16:13:26 +0000
Received: by outflank-mailman (input) for mailman id 267218;
 Mon, 07 Feb 2022 16:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH6dp-0000Op-Bc
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:13:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff485cd-8830-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 17:13:24 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-mIIyAKGAO8uzwVfWFU_ZSg-1; Mon, 07 Feb 2022 17:13:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5073.eurprd04.prod.outlook.com (2603:10a6:208:c9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:13:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:13:20 +0000
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
X-Inumbo-ID: dff485cd-8830-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644250403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iplvXesFN17jy4tRCZrgJ9CBYSljiVxdQhy+PPo6CTY=;
	b=YpeaaIEmbUY/ZD+ZovmahIpm4PGBohDQl5ig11CYn3hiWwGV2Z58Le8m4Fy+wWJFWb1sHb
	K0uuEL0FsmQya8ANZDLyPA5MjJdZlmyt4todgZzy+aLvxutdakm78S6E7n3Wiw16UICcDw
	5avft4LGJfSniq1Dbkef6UF9okDcq3g=
X-MC-Unique: mIIyAKGAO8uzwVfWFU_ZSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVsyKuA+VUXyI9PLun+DswdXirA3Nks3GVt9/m7MB7QCI8v/92WOjp1jtnTfYgrT2QGVc2j0J05uz7iN6FHjuwPUsWySLzObgMmMAYNjrq8DM6S7UYPnQpCTctxvu5CPuwRZ1kSHJPfcsytkyXVlqR9Jf7fsAOwc3fal8Ng90rnIeVMvgE1nKNBVQTm195YfkurRuVMK2QvXiZiwSoEsmhz17xyA/4bx5ZqYkqWAn4vHXIkbbXTt7bn+WdMSoW1jjuFRPVNefkHx0mBK/i/qaCjtuPuRKAFxCJRzpKRfJt8UHfJpfMxK0sPNSOvsQf33txEVHrcOzpJxOp+/vmDJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dx9Qo03/kuQYs//ODUf1qfbKkv996AYQIvs+Bf9Wxos=;
 b=jNA2sgELMKQSAl6uLUlmD2W0OjyJyF7pIx+mQK0XiZnUo0MoLKoY3shGBb3/XgLFXOtdX4VEWyRpI0u0HH7rXK9T8kOoEiVtI1cd58xYKk+J394PzPuyvUITQCsBdXM5QJjbHyItEx6ndDcztwGcMEspIZNEwpt8Wc5WZ6AadNd6e3m2jfZQEwV3Q9rK8v7ScG3Ht8tLvCrfNqFzBHgITJ6IzJRV9Zjzmpjnaz3nrj+d0uM1hc0xZ2H8xuH/RDAfvcW+cqfAU2Aqn4ekSk2349Yt2d7D7ypleybD1n0a39SteU4dB39QispWmsomvPcyafTDK1f2PQQILJQqreePbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba35b9f5-158d-909f-5000-e789c8bfffa1@suse.com>
Date: Mon, 7 Feb 2022 17:12:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <YgFD8TFWwBqAe3U9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgFD8TFWwBqAe3U9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0049.eurprd06.prod.outlook.com
 (2603:10a6:206::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ea8f178-c5df-4373-e5e3-08d9ea54c22c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5073:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5073E8DC4F1335C753A34AD3B32C9@AM0PR04MB5073.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7AvGsq0+06OxXaWV2pwaC4aQwD8b7QBzV+4uehfu0jflQFdXmTaEr9P5/sM9a1r78nhyNDp9kk7EeHNmY48mCiEYFxR38y6ZGsFVO5fAaNw2re2vPXjX7b0bVufQGmRkUYxfpAe33ONdTUCgezKyhQzQqrh9z29ZymFPv7aWvefXbzWJvKV7CLZ28WqjhLfCTIiiFAC888349Kahyso41OBfXtd0fspg3e3FL2unV9wsuANE2LQrmMLFVEMI8g12vORy+wMgwmBxPy6rxUpCemT5SJwmvS9T24sibWx3+NvdKVa1y8V9hL6bA8d9LsIfeQxaDewJlEBtvwtYeGK8OHQseURL4Xz9X7VgfBz91m/n0oBRwxwNWydcxMrxZRBX9V1bZU4rZX7KBaxzGUS2+FYfZw36qSZoJrAGB7owG8uUesNsziNLKen19BEd2XJBFzfYhZgl0o7HxXd6snt0hAr0iRBEAr2m8ganQwudMQrT7fnpW2E4YGVt4Q0Skk+mpiT2kjF8ELfcfdrCCtd/zu52GK9Rc1ZrseySYa4g1laQ8nuWLpZP7AYUhtfKiQoW8IPuc2wCTuodoiMqejgKPIdKCMLsGdMUb0PF2ENDft57nAcNOfKriBxFBiH2Jm1N3iLrRNymHwFNTgJcjVX+4UtM+fcqtzTeU6uajt5A9tV2fnRuJ5omNYC8onWd3mYh0R5ATYAhlZNyJwfSLj3eIMoG1Hv8aNygIDwzqMogWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(6916009)(2616005)(54906003)(5660300002)(6512007)(31686004)(31696002)(36756003)(186003)(26005)(83380400001)(316002)(2906002)(66476007)(66556008)(66946007)(8936002)(8676002)(6486002)(508600001)(53546011)(6506007)(6666004)(86362001)(38100700002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MwmcdwvEr9eXipxVNufNDwEHhHSdNb3QDh1aUkc8QO5OdSpwGsq88qrcaeqR?=
 =?us-ascii?Q?nloybAHaV/ou8EgZ3WjJdKMpSWLhF33J6S0937SmLNzALUuqbvUN9u7cR5Tj?=
 =?us-ascii?Q?+4YMal1suy2G3fhGquA0bOfK9WkHw/AdXl/1Tjxc1UAea2xM4og7QVVpgQnr?=
 =?us-ascii?Q?QtIHJFo0VWyF/NCcMHs+M+gQLvEflBibyPn8jnw8U1JICyeFOPQojo5nNEEV?=
 =?us-ascii?Q?q9foJoQnPi+mfbrQ6H9Grq94leCm+s4TMYOzLCIkuejqMBw6KbcwNTEqoBYx?=
 =?us-ascii?Q?Et1Nllp/f84IXsKQv2YWkEurdXaW5/TJ4SBpwV3272eSJz1ZatC546osH7uZ?=
 =?us-ascii?Q?b19LU8Pidu76G8WpofvXNcZK8l5ZGGAcHcjkdvOb7Q9T8s3rJeZHUShlsvOK?=
 =?us-ascii?Q?9lScmn45QCs9TtMCyQufhQ3UGe8rketNiaqrZvNA0Z2ZDmnPhIIRDg1ZaBVz?=
 =?us-ascii?Q?TivK+v6G844+Tj6Rkh0QQdYBQaND2iPxDbik0U0AIPksptJQkUT1DPEmSvW1?=
 =?us-ascii?Q?YB8wLMIPxgC6sKk0JiGnjS/b5o+T8okO4/BkVCI8SGt0xBUKolZQSGDYjLvM?=
 =?us-ascii?Q?OTCKmYhLQIEviR0XJBX4lIf8XHv6op8h0x+kjgh8h7rqQS3uvQFA0DmKPDdW?=
 =?us-ascii?Q?0fLIHug46fFyzNybmugHzttn8QRn8aeI4TCqTyg3t2vbSmh1EEdB/LKGZjDT?=
 =?us-ascii?Q?759K1BuCuaeHyaFHV0RazpXSqoQCq3BiwCNW3HSDw6LcXs5ptaDSD11v24nT?=
 =?us-ascii?Q?jgq5v5yDXB4QXcrz4do57MVhoKhcbDfGeQIYiwgxZHu31jnay8wuBtI0DKe3?=
 =?us-ascii?Q?ThrJyb5RapviLH9/qQnFL2bD8m5bNCUvmnSFmxj53snwBwoRCmRIxXVJixp3?=
 =?us-ascii?Q?tNgkher4ZAp82YeFCLcqDC0rK/FCFdZCOieqbmqTseIqucIFs8wayFXgjJE8?=
 =?us-ascii?Q?WAQrZk4GC/w4JsOq6DZLOyIWO9rgvuWD9hBrrPytvaz/VE22NNTOiJLvcbm+?=
 =?us-ascii?Q?m8EdRj2S6Q0+McwEYrTS724yRaAsItIxS5AnsYx0WfTxQZ3VI0Bg7dsVBNf3?=
 =?us-ascii?Q?iSQkfFVy/Ws/3sIP/5HG2mke7rJPkNWuotWocsMdjygA6uqUt7b63vSDBmKs?=
 =?us-ascii?Q?6YtIip+iWrAiTDuav0UqhOyMZ2c1S2jszrLxxW08UTEAyj6/e9Ucixc+URfc?=
 =?us-ascii?Q?fNmaDtAjVBCRhh/NSvwDci5OSbmZLZFAdpcuibQ2+2CbnbK1TliLxbIbj6Zi?=
 =?us-ascii?Q?k/GclpjwajU1LI5/3EHy7kfJKaQ8Y00FiVgbjrYYyMg8iaJcaoP64Q3htA8Y?=
 =?us-ascii?Q?f07cyG0i4KZOGPrtIjlrbfOe9gOK4HcoT4f5TkCJTl9t4PWpUxarHfJ5qUUg?=
 =?us-ascii?Q?gA8gZJ9jwFv1EgCYc0nEzpLH0MJxbK78z8GIRVxKpT9aKwqf1zPElKD1kMne?=
 =?us-ascii?Q?v01/clLJkvMRGU62RIxt5xc6hT1pdsMdDjpoEiQge2Rgn3hCBn5GTN1gjxMQ?=
 =?us-ascii?Q?DCqDgQuYS8Oz/HoCfqz9WT6GVCkmL1lQhx2Azd8d2e+cI4hD25VpuCu8DTuf?=
 =?us-ascii?Q?DzCRrFX2uuHrcbxcdriXNBRHaSNwNhau46/ZVY5sqCQkL/vuwx1s/I0z4rKP?=
 =?us-ascii?Q?UzeIMkNjBSnT/IaqlEA3cZY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea8f178-c5df-4373-e5e3-08d9ea54c22c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:13:20.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39Pxzedij0RDyhs9idLOPVks4qq8pVIV9OlZ5FSF/mudVzkpheO00TJU43kW5fDR1Yu5Zn//LlaRkDiL0eRmpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5073

On 07.02.2022 17:08, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 07, 2022 at 04:26:56PM +0100, Jan Beulich wrote:
>> On 07.02.2022 16:11, Oleksandr Andrushchenko wrote:
>>>
>>>
>>> On 07.02.22 16:35, Oleksandr Andrushchenko wrote:
>>>>
>>>> On 07.02.22 16:27, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Feb 07, 2022 at 03:11:03PM +0100, Jan Beulich wrote:
>>>>>> On 07.02.2022 14:53, Oleksandr Andrushchenko wrote:
>>>>>>> On 07.02.22 14:46, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> I think the per-domain rwlock seems like a good option. I would do
>>>>>>>> that as a pre-patch.
>>>>>>> It is. But it seems it won't solve the thing we started this advent=
ure for:
>>>>>>>
>>>>>>> With per-domain read lock and still ABBA in modify_bars (hope the b=
elow
>>>>>>> is correctly seen with a monospace font):
>>>>>>>
>>>>>>> cpu0: vpci_write-> d->RLock -> pdev1->lock ->=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rom_write -> modify_bars: =
tmp (pdev2) ->lock
>>>>>>> cpu1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write-> d->RLo=
ck pdev2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
>>>>>>>
>>>>>>> There is no API to upgrade read lock to write lock in modify_bars w=
hich could help,
>>>>>>> so in both cases vpci_write should take write lock.
>>>>>> Hmm, yes, I think you're right: It's not modify_bars() itself which =
needs
>>>>>> to acquire the write lock, but its (perhaps indirect) caller. Effect=
ively
>>>>>> vpci_write() would need to take the write lock if the range written
>>>>>> overlaps the BARs or the command register.
>>>>> I'm confused. If we use a per-domain rwlock approach there would be n=
o
>>>>> need to lock tmp again in modify_bars, because we should hold the
>>>>> rwlock in write mode, so there's no ABBA?
>>>> this is only possible with what you wrote below:
>>>>> We will have however to drop the per domain read and vpci locks and
>>>>> pick the per-domain lock in write mode.
>>>> I think this is going to be unreliable. We need a reliable way to
>>>> upgrade read lock to write lock.
>>>> Then, we can drop pdev->vpci_lock at all, because we are always
>>>> protected with d->rwlock and those who want to free pdev->vpci
>>>> will use write lock.
>>>>
>>>> So, per-domain rwlock with write upgrade implemented minus pdev->vpci
>>>> should do the trick
>>> Linux doesn't implement write upgrade and it seems for a reason [1]:
>>> "Also, you cannot =E2=80=9Cupgrade=E2=80=9D a read-lock to a write-lock=
, so if you at _any_ time
>>> need to do any changes (even if you don=E2=80=99t do it every time), yo=
u have to get
>>> the write-lock at the very beginning."
>>>
>>> So, I am not sure we can have the same for Xen...
>>>
>>> At the moment I see at least two possible ways to solve the issue:
>>> 1. Make vpci_write use write lock, thus make all write accesses synchro=
nized
>>> for the given domain, read are fully parallel
>>
>> 1b. Make vpci_write use write lock for writes to command register and BA=
Rs
>> only; keep using the read lock for all other writes.
>=20
> We do not support writing to the BARs with memory decoding enabled
> currently for dom0, so we would only need to pick the lock in write
> mode for the command register and ROM BAR write handler AFAICT.

Oh, right - this then makes for even less contention due to needing to
acquire the lock in write mode.

Jan


