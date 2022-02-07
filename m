Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31714AC339
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 16:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267135.460850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5uz-0007ah-Fi; Mon, 07 Feb 2022 15:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267135.460850; Mon, 07 Feb 2022 15:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5uz-0007XH-CV; Mon, 07 Feb 2022 15:27:05 +0000
Received: by outflank-mailman (input) for mailman id 267135;
 Mon, 07 Feb 2022 15:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH5ux-0007XB-4m
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 15:27:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65b5b22a-882a-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 16:27:02 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-Os0zWyWPOW-wZ-5sth2Zfw-1; Mon, 07 Feb 2022 16:27:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2761.eurprd04.prod.outlook.com (2603:10a6:3:e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 15:26:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:26:58 +0000
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
X-Inumbo-ID: 65b5b22a-882a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644247621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpGu4kVAeVZG2Z26ppMJeIHhbkIH9q871b3Gy7eOgMI=;
	b=mlMfBbgBCCUo3httgCqIVGOu7A3kco9zPsfR00nPg19i9WNxi9wuEYFQzTy/W9CKHYvx8C
	7WExnVbr6c/Hn0pNyo2kayyHo9B75GxhVn2v+8RGxfkqe0abG3R2QaqwqSqPcBdw2Bhphs
	wGEmLUxA7+wHM5KCj5Hamzi6xsxpY6w=
X-MC-Unique: Os0zWyWPOW-wZ-5sth2Zfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/0ZpW9tA3bs3dD7ukAVC306LZ4dZ9Oy349RMcXzAGnyTp0rhK3NZqXMd0FV3jOF/mzCxnaXI1CxO+1xGc6IMnc2HzqO7J93JXM9R8DgR/SyIhj6WngJ8yiHgREE2kngJ0E0Ffdd82UZcO7ZE2lJkXNWwIkB4N+jwlshxSWkwI6uEZtFutr6zhgYI9+ULFkN7ApKmbl1T8J6GxRNHdmqgGEzzjF8Yo6/+taUDiYJMEABCeMu2uxcdQIG0B0Jk50XKQMbscTGHdfSLTaRn5S+05ys6f+VR2mxcmrgN39/Gast17M3YdRZKN4sdyKrNAh/tAxFZAh7fzjPQxhJfG8zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/4gJ9De7Bte+knbZCCadeMWEbTc2zuA08UDK9acSz0=;
 b=ap5u9EuliktG4YphGfHzMItkK/yYFz51sCX3LDqAdH6NhDPBSxFgHH4LFrrgl6XIi62u+TWinuc00ybo7bgTQ+OOwoeNGxnz8YKYle9mMiYApmKj5uqshJiTUuIJAFgRfn/Egfp/kmcEynwGDyNCLeHR5k21TQpSDgrlOpkOW8CuekjdiLuhH0bFUWTXuTZ0s/A3Y7ttU8R+9bhKpL/Sf2UG3+gFnKH6Ii8BNq4N+hV1noN9her5ktBQovk/fZpgESVDgcFGz3DGx8QXrkmIZmPlCjF27F2Rgz2Evb/EHvbdbEknObRhVWXKlYUROUmA/RLwdSvKn6Q10CPkce0+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
Date: Mon, 7 Feb 2022 16:26:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:206:14::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb0efeca-5f1a-4b1f-a19e-08d9ea4e47ce
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2761:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2761D5C3F092B5F37B5B52DDB32C9@HE1PR0402MB2761.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QSQtm5l6xQN24+9it1vumHqugXIVC4f5QwNVC7q0rfiP3gddKJtPdyN7I27WgymluAwfzyUCSvf4Su7GNEqMnHT7p0zrxNDs7jlEvanQGPznmlgARzY5r2V5gta8nYT/2Nk85/bhnabqc0yGv6u87GiHgbtRw3SptO9fS7TI149jJ4EiPmhqAWBV77V/RxtuDXGGApo7JSGfKGTUl1xR4mv+/Hcr1dETXKH3iTJNcJto8hurGUx1/CM1tDMcEhQjGVAmfubR7TcgDoYyvCxHsZlxlq6iBvv6vaRIjdQxgByd2PqgltFnjTMCp5c2mareUt3dEFrLruwGopZYvPUJ/li2L+GcFtLvIsujmXaiJIbAYhG83kAWI0lKT0dB+BCj2kJxDKZPOhq81bm5TwtDhj+GnRr4R6MNuwo0pTCXQZ2Ga1X2Q9TcduHypV2EeP2OJTg6mBz+2VkqcAyx8/MMC1iOrxI1F9Zxq8d84Ti5Bgtig+/crmHAJ6AHIIUWpQv6Zaqbu6OxVJ1XfO6H7SKwcj8TlQDmPy9IAuUE7LXewewExSIRgWa7qFqaScHWvxRSDyeNHIrHzAvagpf5fE6tJwsd/npkk02A8ObMvLSxc8EtwqkRxfufAspyhhj1EIqtPx2ty7xNsjkZfey1bpuLzj75DrOT38MHYx8NqVY9jYpgpdtMpOUDsCdbnXvrPuk6dwJA/+nYwkayLAfVuCsjNX/2JP4dfVj2P/6lMpXwv8Ih0ZzxMtX0k5pNzNd/gUolJtcmO4s14oT+gPqDfX5xlOtiO2uUsOOxpTmBk/+0ateKx3u5MdfflJV5cskOfH9f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(66556008)(4326008)(66476007)(8936002)(31686004)(8676002)(83380400001)(36756003)(508600001)(6486002)(966005)(26005)(6506007)(38100700002)(86362001)(31696002)(53546011)(5660300002)(6512007)(66946007)(2906002)(316002)(7416002)(6916009)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SthCRT+H3FR4zxRpxaekTJ6HNVu256ZePzAwDmah0MDyR0UYY8ofh4Iv79b4?=
 =?us-ascii?Q?GWUCXKJz3neB/KwsD9e0VZsd0lmHoH9AY0tYcN/vMcCNhPLNSgrkcEUaB7IT?=
 =?us-ascii?Q?0whN5csk5i4orWpnomihxOBNixpog4ue2ZbSN0JaLNKNEH6qvpIL+1XqkbRG?=
 =?us-ascii?Q?dFwUe02vngZIYzxs8vZTPPPqI2zwi0hW9P7mjOLztVAmgehi3qLsU1XuZmOz?=
 =?us-ascii?Q?68D5Xe3SslsNTWf3gR89LrMMwcEEKpiSmn0a9j4Adiv8TAyaKmT9BIJK/uRk?=
 =?us-ascii?Q?7N1X7pp5Bcb69RNaZkQ3lwK49o3+PeUAh3ntqSt7DB7NeZraiTfYb66qHBOb?=
 =?us-ascii?Q?GiH07NoORtVzsSf0dNAgziRXEjp+sxE1xYo66H9C2fcpmwCwSZ4cp8whF03v?=
 =?us-ascii?Q?Dz+DG5LnsS4AM05USluwdfoOyNHQxn1SFXJGh1fLjx/IWHC09kXcm54cOLOj?=
 =?us-ascii?Q?PlfzGCGLkTDqUBvrmXURQmDqftqTmlYkA1FRjKai8Q9a4mTq8dZ42okQogOW?=
 =?us-ascii?Q?+OkNT29bdgfGOEgOtRypnIs81VpuZKij4uv+sBBe5dICz3WLg8xkPTQO5qjZ?=
 =?us-ascii?Q?35SWhRw4mRgNvxnEUmEyihv5wqGkvRUcQ0n0rTu293HDRS/ujQyuIy/UZzOq?=
 =?us-ascii?Q?toX1vnmqdtPjaQsBrW82gzhTG0lVwJiCcl+teIBCN1ObyGHtKAXWM/bEWBbG?=
 =?us-ascii?Q?MY3/wOrBfie1/0bcujzx+pAKwa+nBJsa73DznkKj/jETxzSSkWHHz/RiPuw2?=
 =?us-ascii?Q?Z0LtgtGLMnuZSVFQWu9TXGdJ17gJY7KVIpbdnEAUAseH04NTX3FLmO5XrJJ4?=
 =?us-ascii?Q?e0bjEoqA70XXyvATxFaBArv64tniLHaKyQ4bzZse94ajEGaOTLfLtJXJU5Ai?=
 =?us-ascii?Q?4Ek9wOcVGIn4odfaatfHgAF+8IjiPIyax7Kk5pw28l+vbUPYV3aOAi4uj8NN?=
 =?us-ascii?Q?7/6AsXD/P+PO4yGmUlsv9Oa6BfbEnJf/f6hKv16nj+Lh36WYrhTZVSq9RSdh?=
 =?us-ascii?Q?0QH7xH7P4C4/36iIBfZ7u/p7/tvnmebRRVR19BQxVN+XnK2WFY2nxtOGu6lf?=
 =?us-ascii?Q?5/YlR7g7KO7gxbPbwYRQUUXtyuTit5BGDuiHlLNHyvj4HSqZU02gIAM9cl01?=
 =?us-ascii?Q?sKk1RJHqdKJEZqBqhCBclY/QCJeN4LKhaAQhgm+NENy0/qVvRrkzs6o3KtCq?=
 =?us-ascii?Q?+wG7fMYdZj5dfiBdUOuZ/G8oyWHb/6FLHfGpPdxX4tv6afBWD6LrIKvLizq0?=
 =?us-ascii?Q?XvIH8uREYwSHPxNy+9mx7EMmASnsLX2s+Z21N1R97CGXtrJk5hc6v2aRn3OP?=
 =?us-ascii?Q?5kllpJvz13Nhv6ufox6lof7nLS5f2WG9zFMlIhQJTQuG4A6ray9UA48kN1dt?=
 =?us-ascii?Q?noCIU4Zh5q91Tty8L1YKtdJxNPnC+SeqMFnzUcwTSle/L3lkIJ3jqJaMH0gu?=
 =?us-ascii?Q?4MI5MSMagrTbO0I+LiJvvUOGwPgsBQpIUJa5shO0k4Ar9RKQVPIJ4e8avZWC?=
 =?us-ascii?Q?nvkoPycdFwPTwaZkU97iswloaD/9jRURdadFcfN3jGAENCJG/MkLcEqeVAsY?=
 =?us-ascii?Q?NTONWsxLt58gd3cn23gmisaK9WQVBNkns2RQ3/9CHq8xuLEaPBhyIBxdg09C?=
 =?us-ascii?Q?6wwQ0K/aM7wAJ9+d6T92SVA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0efeca-5f1a-4b1f-a19e-08d9ea4e47ce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 15:26:58.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBtW2F54Vq5MSJpMDFm3LGAA9Pii29rGGu6E9nSJE/5CS/3UfUfdAxHMCM4BGf5MZ/CBwinr02iRKcx55hwRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2761

On 07.02.2022 16:11, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 07.02.22 16:35, Oleksandr Andrushchenko wrote:
>>
>> On 07.02.22 16:27, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Feb 07, 2022 at 03:11:03PM +0100, Jan Beulich wrote:
>>>> On 07.02.2022 14:53, Oleksandr Andrushchenko wrote:
>>>>> On 07.02.22 14:46, Roger Pau Monn=C3=A9 wrote:
>>>>>> I think the per-domain rwlock seems like a good option. I would do
>>>>>> that as a pre-patch.
>>>>> It is. But it seems it won't solve the thing we started this adventur=
e for:
>>>>>
>>>>> With per-domain read lock and still ABBA in modify_bars (hope the bel=
ow
>>>>> is correctly seen with a monospace font):
>>>>>
>>>>> cpu0: vpci_write-> d->RLock -> pdev1->lock ->=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rom_write -> modify_bars: tmp=
 (pdev2) ->lock
>>>>> cpu1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write-> d->RLock=
 pdev2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
>>>>>
>>>>> There is no API to upgrade read lock to write lock in modify_bars whi=
ch could help,
>>>>> so in both cases vpci_write should take write lock.
>>>> Hmm, yes, I think you're right: It's not modify_bars() itself which ne=
eds
>>>> to acquire the write lock, but its (perhaps indirect) caller. Effectiv=
ely
>>>> vpci_write() would need to take the write lock if the range written
>>>> overlaps the BARs or the command register.
>>> I'm confused. If we use a per-domain rwlock approach there would be no
>>> need to lock tmp again in modify_bars, because we should hold the
>>> rwlock in write mode, so there's no ABBA?
>> this is only possible with what you wrote below:
>>> We will have however to drop the per domain read and vpci locks and
>>> pick the per-domain lock in write mode.
>> I think this is going to be unreliable. We need a reliable way to
>> upgrade read lock to write lock.
>> Then, we can drop pdev->vpci_lock at all, because we are always
>> protected with d->rwlock and those who want to free pdev->vpci
>> will use write lock.
>>
>> So, per-domain rwlock with write upgrade implemented minus pdev->vpci
>> should do the trick
> Linux doesn't implement write upgrade and it seems for a reason [1]:
> "Also, you cannot =E2=80=9Cupgrade=E2=80=9D a read-lock to a write-lock, =
so if you at _any_ time
> need to do any changes (even if you don=E2=80=99t do it every time), you =
have to get
> the write-lock at the very beginning."
>=20
> So, I am not sure we can have the same for Xen...
>=20
> At the moment I see at least two possible ways to solve the issue:
> 1. Make vpci_write use write lock, thus make all write accesses synchroni=
zed
> for the given domain, read are fully parallel

1b. Make vpci_write use write lock for writes to command register and BARs
only; keep using the read lock for all other writes.

Jan

> 2. Re-implement pdev/tmp overlapping detection with something which won't
> require pdev->vpci_lock/tmp->vpci_lock
>=20
> 3. Drop read and acquire write lock in modify_bars... but this is not rel=
iable
> and will hide a free(pdev->vpci) bug
>=20
> @Roger, @Jan: Any other suggestions?
>=20
> Thank you,
> Oleksandr
>=20
> [1] https://www.kernel.org/doc/html/latest/locking/spinlocks.html#lesson-=
2-reader-writer-spinlocks


