Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE94AC149
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267055.460762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH54u-0006eS-Ae; Mon, 07 Feb 2022 14:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267055.460762; Mon, 07 Feb 2022 14:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH54u-0006bl-60; Mon, 07 Feb 2022 14:33:16 +0000
Received: by outflank-mailman (input) for mailman id 267055;
 Mon, 07 Feb 2022 14:33:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH54s-0006bb-MQ
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:33:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e16f2046-8822-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:33:13 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-3do6KZoyO_iZvs6YG_3pUA-1; Mon, 07 Feb 2022 15:33:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5648.eurprd04.prod.outlook.com (2603:10a6:803:e5::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:33:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:33:10 +0000
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
X-Inumbo-ID: e16f2046-8822-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644244393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uO3NTQVCSYkQL3zC3b2F2lPWwxQRU60We7U6kBLyBL8=;
	b=KE2RI69GllVQNk8ZZhgo4wq8JR39nPg9xnyIbM60KSuPTbmx1+GftszAl9FOorWvL4mvGG
	WcH3qFNCJjtZrvROA7mCSvz4XA8jFTBJcWwU5FUW3oHEkyqKfTkTAPU1r9beVO8eV15oCj
	6UR4sXDHd+IAWbc7bCpA/9FBd+ok114=
X-MC-Unique: 3do6KZoyO_iZvs6YG_3pUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTGvfyaJM9sp9WhhCxRXVWvg/hYYX5teT4Jq298o2EyLcnFwxMY5vacIeJAOAFrMkOHTImZ31LZWjoGqC7mLQ4/YWDcbeWeE1cz/AMENvFCy38ttNV07k/2Qv29jhgzr1RB6usC1biR7vxNtpjwWvT4NSFY0pTzXzqWxXBxd52C4OIRt4d8l3zDZNBrXoV80/7dCfit8qEKKcfeGhuhhIVUhaUWnousLQu1FcYb7QG/nquYsC4ZE6ccHI7H5p/CtPjgrQRUf/QEoE429Kc1fM97IzgUWH0NlfcNSv+BYeM87E8qgPhtDfOr8x4iUqOZxQa3OZMjI494qOU57VLE+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnu4bU5tZdendMLAVNuz7lgls4DjjMkja3Rjnbkr7YM=;
 b=bkU5VwuIFnvprkQZHr9mz0+Pb9VKqAYH/JTMNIhkpI0dZj2Bg2qEn3K35NX3fV759f5yz5f8g9fYWKOh6rd7y1z9ckMf4oWfNi5m/AQJlWGTMaLITEw6ajNEFfTcuGGP7s1cDHPRPACoAzx/oKCGZA5ljH0RCk0QMTQm5qgLn9UjoBx8eYDZ2/Oaq0qlwoYp8DuUXC6tUO2162DU/KVLDANAhtk46YYh2iSOaj5jABktxmCk7QU5OCxl6XnUQOM+/Pj2JjAG98MgnuMR4s1HFhlQ6VrnsmXnuXo9eo1dqBJpn6KkpRh1/rV7WGi/gG2suL4Cberw6pjnuKz3egHhpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9ef8453-cd58-37a3-b290-578a015e301f@suse.com>
Date: Mon, 7 Feb 2022 15:33:08 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgEsRuckQJIQlkzf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f96e3d5-8bfc-4160-0167-08d9ea46c3bb
X-MS-TrafficTypeDiagnostic: VI1PR04MB5648:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB564821133602A1C0C09B27B2B32C9@VI1PR04MB5648.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p3D7roFiRHDwiI0sikpSoimnEKViRmf/zJnoJUym6sxyF/Oos60uVt+5haPHnUQyUaDnfAm/0K0ox+IlwgOhmq6YJqwLbR5+4jzHQtxGZQyqDtqbSFCZRcaekFFqX+euvg/owwqfGkhHkyD0BLRkD6+3RTpjH539K3eXdhxecTcqCZ2w78soFPzOdcrxdcDw/5iplW5GlRZ7th+Cmilm+zn0+seaUAFYeTcKu2yJUgC6Vi859zrtT8gJysN7mQ/XDfmAnoGMjKXMuPAzxo7ieRvbPZymlTbQ/UttHNkC1HsFHucNzYrzWNQBkYsPL5O//iYOQUfesAKD0g6KHVR28MLlyt1iOtF2uWseTS9DZciwes10DpEwfMG+5PLXX1UsCitBC9/xTkqLVNotqp3Xr7O9f2IM2iQc12leObZ8T2eNVy4OTSgVQu019NzXt/UZ062XyUzFSvTUo08apr7ixY27W2RHpm+wZwQEUp+5UAH0bjeHmGaR9vJetHUlFRma8WS4+pt8E01ZswXSih/cG12qv35EFCCHUTKbiiGLxQO4wSOAKib6gGa1DLFxIQHK+Serhq7WzOmVRbAw9C+XinhRO7Qus/lx4DZvOfqNIG7nDbH65jDp54gd7wK4DrllmEAzy94MFWaj/OgwdWwJ+3yQ/eDeTYIP9x3ISYy/ZhwNizJExFSaQmjhPa2OATb9RPCqnhXHia9cjJDJhHOQlcIb3NYVXR1PLD8PH1/HWdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(83380400001)(53546011)(6512007)(36756003)(31686004)(8936002)(66946007)(26005)(6506007)(508600001)(186003)(66476007)(66556008)(38100700002)(4326008)(54906003)(7416002)(2616005)(2906002)(316002)(6486002)(6916009)(31696002)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KSU0jCfnDpMZN8AMzSeFGO9ASDW7vz4OofT19SyhIxDYtVg2GlexiKinkVW5?=
 =?us-ascii?Q?byK6j1I2//snndx7bF0Xl5l934N935EP+hdxz3YFCsmKSRJdYRqLOMF0FH23?=
 =?us-ascii?Q?3Gk8ayYVj0h2/17mzwd8f5+zK+UF9PRf6DIXyC7QEcfLLz9htSZ+V4U+nBou?=
 =?us-ascii?Q?eFY4XQXkpBhNggdK+2V8gFIc3AfHO46f6Tju0KKZCQKQPXX/tWh+ZjhjRxZr?=
 =?us-ascii?Q?sfpJpZKSzbxrm9oEjTA1Kmdlh+NlqA3Bhz5jneBijwoGd1Nt7AFtqQ0E6DGv?=
 =?us-ascii?Q?cy5wCcZY+EA3n3FPOy1FHWk21+d+AfWC+yEvgOdhR2vgTIkg2OuYRCW3GhLU?=
 =?us-ascii?Q?OkFmFlAC9DNbxgF8ehV4QfC2f0NUF+G16mHxSmVbyHH2UUTnIuGdiKLWn2NT?=
 =?us-ascii?Q?0WllXu8XUlt7dk20IHZ29izIRSvHzKn5BL2VSMf3FZL6m559uxdOLOqfWe6Y?=
 =?us-ascii?Q?JNBGW/N8vN2TEeZQ5NL3aEm7BFzVrkZdhXgNfRXcnVCoXfVdSjbdBoPYTdN0?=
 =?us-ascii?Q?gqgyD4ZoJbt7fLhmI+HNnQfTp0jSGcQhGjDVjYLQLu9xHh9xEC3NVgWfBt4v?=
 =?us-ascii?Q?jkviTm1Xx6NytsUHOl2+MZGAhUfRV2Kza+GfLCPPPx77ix/4WCuy2+iNMF5g?=
 =?us-ascii?Q?Kg6+7723EbgYJ1PWitjevCk7aa7gIU2FxxKeqESsMVNIq53GwhV1FuVU96iy?=
 =?us-ascii?Q?itrkNe1AGPdVAdEKqUooyTn/AQq3WQSqGKNvxjkXTdtdGRSi7mCl5fKOFwOe?=
 =?us-ascii?Q?zB/4E1wdjf2DpPoSVINSnLzlSruQB5WP8gyYCu/2N6vkrgvXCoHYyCwsOM6U?=
 =?us-ascii?Q?+Kii4J8vPd4zWR2xVvkb2G+3T6m0ZRD/tMZ/i8xrTqfmDLiE/QyqAxV/hGeV?=
 =?us-ascii?Q?J3OZjDWqnNw8ooSeGVcGE5L5/uBiqwpm4118/PBeFwQntHNazklDmZ2+z8cr?=
 =?us-ascii?Q?hhsg/QRyYNGo7xHZHIZLTyL84yI2Yi4hf7N9W2Og7ALqGbePPCuiuSArtBzD?=
 =?us-ascii?Q?P3Bjge8FO18Cy8qNNu0r4Vm6BOdp04jNzEHzOfrqJwBBqV+/+1Gjdi/gBalV?=
 =?us-ascii?Q?zJhn0huN8r6qYuUMjCLvoiIBjeum88BybzZv6+SKE74n3QIK0EVOOgm2mpa7?=
 =?us-ascii?Q?R54Q/Aq5OhTJYrFXxxT0msp1fknPS3+/CfXLJdbr6YIpTz3eKXm2CkuS87uY?=
 =?us-ascii?Q?g01hKo+sQPrp4iwKj/vV97ik8eEs+GIG534N/aPnG4TGvnnQPlvKgWnLvGp7?=
 =?us-ascii?Q?lIAJwr8XSPy3e5ZcXZvva2hoQIlYUo/dCqJ6pzEx0DPlI5JWhYWePh1VOiBw?=
 =?us-ascii?Q?D4J3j7oAbefJPXZeWwJCTg0SsgiXSyBMM/zTbbe3BpX6WWARgh8RPlpqmwOK?=
 =?us-ascii?Q?7Tjt7ahtM2vA08vO6w3Xc6oNPy1dD3G14GPm81bGexKUBLDcFcoYfYZ9fPxe?=
 =?us-ascii?Q?I/KAe6ParL2upqQWBsSyb3HCN2Bc6cyegWAZi4WZ4I345gDzFeSOeUahsb5j?=
 =?us-ascii?Q?R72Q6dIKvVHWtW+HKBUZSH+wsBTrvdN+AvJtjD9gpJG7+SUWW3d98qkRWotE?=
 =?us-ascii?Q?xbfRnXvp27cNuDVX/5UlfmPL5aK2vue/WJMI2QFO2ugCW6lnbAP2bA4J58CH?=
 =?us-ascii?Q?5q19cLrHvmWC5EAnMDvgydY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f96e3d5-8bfc-4160-0167-08d9ea46c3bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 14:33:10.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJhfg+F6wue+AS7YdyInnz/qJS/lWQeCtW0PCNreGuB8sf6egr453cAUhh3V3kjIHHMN2YCCeOBiffJssu/GSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5648

On 07.02.2022 15:27, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 07, 2022 at 03:11:03PM +0100, Jan Beulich wrote:
>> On 07.02.2022 14:53, Oleksandr Andrushchenko wrote:
>>> On 07.02.22 14:46, Roger Pau Monn=C3=A9 wrote:
>>>> I think the per-domain rwlock seems like a good option. I would do
>>>> that as a pre-patch.
>>> It is. But it seems it won't solve the thing we started this adventure =
for:
>>>
>>> With per-domain read lock and still ABBA in modify_bars (hope the below
>>> is correctly seen with a monospace font):
>>>
>>> cpu0: vpci_write-> d->RLock -> pdev1->lock ->=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rom_write -> modify_bars: tmp=
 (pdev2) ->lock
>>> cpu1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write-> d->RLock p=
dev2->lock -> cmd_write -> modify_bars: tmp (pdev1) ->lock
>>>
>>> There is no API to upgrade read lock to write lock in modify_bars which=
 could help,
>>> so in both cases vpci_write should take write lock.
>>
>> Hmm, yes, I think you're right: It's not modify_bars() itself which need=
s
>> to acquire the write lock, but its (perhaps indirect) caller. Effectivel=
y
>> vpci_write() would need to take the write lock if the range written
>> overlaps the BARs or the command register.
>=20
> I'm confused. If we use a per-domain rwlock approach there would be no
> need to lock tmp again in modify_bars, because we should hold the
> rwlock in write mode, so there's no ABBA?
>=20
> We will have however to drop the per domain read and vpci locks and
> pick the per-domain lock in write mode.

Well, yes, with intermediate dropping of the lock acquiring in write mode
can be done in modify_bars(). I'm not convinced (yet) that such intermediat=
e
dropping is actually going to be okay.

Jan


