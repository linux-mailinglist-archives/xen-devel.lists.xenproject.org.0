Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F56458D10
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228807.395985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7DU-0004FU-Nv; Mon, 22 Nov 2021 11:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228807.395985; Mon, 22 Nov 2021 11:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7DU-0004DZ-JM; Mon, 22 Nov 2021 11:10:32 +0000
Received: by outflank-mailman (input) for mailman id 228807;
 Mon, 22 Nov 2021 11:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp7DT-0004DP-B4
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:10:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc966ff-4b84-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 12:10:30 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-UwlgUN-LPt-MNeLlMt5ZOQ-1; Mon, 22 Nov 2021 12:10:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 11:10:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 11:10:27 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM4PR0701CA0014.eurprd07.prod.outlook.com (2603:10a6:200:42::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.18 via Frontend
 Transport; Mon, 22 Nov 2021 11:10:26 +0000
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
X-Inumbo-ID: cdc966ff-4b84-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637579430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYxbTAjfQ++BKVI79TLlSSTbaoHOQzuiVm0U3g8puP0=;
	b=g7PLQelTrD0SbQf3eqxUehtPwt2JXuGO8ubxT7tzvc285tsLPkVz8hr/D4agL5B6N9mQG7
	Nes+F0n9ua+NQ92Kcqs/ZUGtRTebHLNmPBFHzdElllg4Oc3Q1D9jav/4Ct0pZ94MbsG9J5
	GwVK1y4IMUq7sCbEhqOUWqc4LBxRZII=
X-MC-Unique: UwlgUN-LPt-MNeLlMt5ZOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWuiHhGX24vkqtwjDJ/vmJgp6BTp61YiOORk/ggV5gJnCA72MFNOUK+ozqp96LeJy3ynSS6jfFMJOyoaBhVSlXRE1jaJ9KMSuCEbCJAHN9437mV4nYk+TykWVtkaO6ZaaOfVNJbjVHeSMI1UE+9OxYKogNemuQSe4Sf9QwFa8kQcrT+Va7vs2nvH85SKIofutuwNWjc7PyaRhzdXnsprrisTQPDNyCNSp3qP2BpyEwcfzGVIeaXXsifNvOjhm0ZfPCRCzzz8tvxLtVMpn1hZlR1nmsQgmx6SgfyMeBfJxUbpkiQCzKtQBbuEoyYlgoleNuRJDBmZrTrqNxotGR+VOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uACt18g6d1l4/ffA2fAj6Gp5l6rTw2DbUOLkfwievbQ=;
 b=kmhwLl6Ghzu1zVaWMOJVWEmZmO0dGOMsU1xH8T/iMBghJJoYTKO3L2Q3UiBA7Igf3SDvlA8SxTnobvhGEvU+VMMjKoSLeAKbQq18ZPCdrbw14YgmcRbzPMvmBvFQHnrCJvoGg8k3AmDEiCn6qvthHILgQBz8tzPCoaIlXvwE29BWCbBJCDDuCVwVjWI/4DroTeMToSFIDM6yu133blrfbZIHFOIWSgjRmnIDxJrRSPJ5JFaNL6sZuBOCB8rFJ5Kw7rrHpYs/n3Az/3AoH1MsgpCyB4Yi7NYrt8bE98PlQY97Tk71spT0Ii63hmrNto8IW4COmfa5kHRuFFwDDBqZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1838c29-9a80-28d4-474a-b72daf7a5488@suse.com>
Date: Mon, 22 Nov 2021 12:10:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 v2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Community Manager <community.manager@xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211122104005.58897-1-roger.pau@citrix.com>
 <7f8fd875-a69b-1821-5abc-a8062a7a6242@suse.com>
 <YZt4Wtr5uGeBVrZT@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZt4Wtr5uGeBVrZT@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:200:42::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5170c5cf-a7e0-4be3-d7da-08d9ada8b032
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152790B119264F4C0772F40B39F9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	phlW5hLN+EU97RACYpvrV4aMYI3jeUpZPqYqcm2xkLnJXyJkQmnU/5cKS3h14aE/GracGtSaP9sdLnT/WrRNvBlbg+dmuiWuhBAn6od8M7vB7im+GVYPN580wmCF3Wx0ZZY8Fv7gXrrljnuABFf4Q6glDxg681A91EGj0bxun5dAAX82Bc39MGABsELFphGDgp3VSsh1oCt/eAVtmrtZI8oztUnKCky5RaCF6cPlidsXV6BD1qqf/A9ZkDMyGmx9LcahYbggseZ+GEc2FGLcf27FszSyoBXwzHHXAG7u5kfCPesOZsRTzJyP5p6Cs4brQ4M4l7OAOgy/wVOqxT6NdpnkhQDCaE8O43Y/5Zn4hCaJcsr9FV43db+1TWc+CGQvzsbsgXUmgnTtubpkGhy2bWkwR5EFYfolKRQTbPqDb6h4+fG+auWzPfsSTn6enOpx+7LZCT6081zIj7VL+X2BfoLakdeThLy0DNunpy9lGLU4x7ewvX1qz6r5KrapmaEic++vj7XFU4OPHZFuzgWncSiKG0Duw/G0ylFSNj+y1oJMnrk6IR6nTyUR13Z4Uqjz08KWSEnSzLQI8gDYfv4bLOPLO+PJzWavouF9dV6v+H+Tl1UF/cec/SsXSMPMA0xQv63a23A4F6AtcvMnarfaaUGHLhQIpeUI88RPs32O9tpMxjs3o3m63MPcI4NJ4s58MDqcvKEJ4/77LXACwyV2LLQmM1yHx4HuPqXLkJmn9zdhISMWhtferZu3D/LjfrvF7sJT9kImpSFIVBtwhVZ+eEe13VB6nSyCu0r8TwtILbpoSqbm8DIlkCMnu/oEwvsCPtyiwvM+Gp0vc3jCrlJ8ieTZfkw8wi6NoecsFUyAZs3BW2XF8ktPlmAUOd5zqQb3uZE1wiB1X5YeO3T8OH+cLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(86362001)(53546011)(66556008)(4744005)(4326008)(66476007)(31686004)(38100700002)(966005)(36756003)(508600001)(5660300002)(6916009)(8676002)(2906002)(2616005)(66946007)(6486002)(31696002)(54906003)(316002)(186003)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2uIIgNmj9AkGi9LMKDflQqG+FN3Wn5kjXXANJv1V33mvrbbx7DUen4MCQAV8?=
 =?us-ascii?Q?A7KEJ3BHDfDd7LUz2cOKjOSuyFQudWr8l9sFXuXbYfKNZQ25DrkCaNx3sx/r?=
 =?us-ascii?Q?cJdFklhtTI1QhpNFO7SePHVE4BI141o+fC2e86+bJAb7BF60aiedeDTVWq/2?=
 =?us-ascii?Q?Pu1xN5PS814ANwZqFXvk1kRWBbENh4b1y9ZHGQCtiu2oZTaVr8qoPTDJACo1?=
 =?us-ascii?Q?OyQnko41hRn9k3afCrjQBZdh9AtrxVVjz+Z6yd/06LNmlMHasz6S4rx/EmH+?=
 =?us-ascii?Q?iMmIOp84901mtvzmB6z+fQgFY0u9YID60XMxBp+i/+ElXKel2fCnSZFbGz5b?=
 =?us-ascii?Q?ZcEqCl6lTQQ/LLfGYBXsau9Fw+lFCFdUV0skA9o+E/6I9xh6CTHm68NUxW0P?=
 =?us-ascii?Q?CixerI8YWJfcaxr6t2TWwWu+RPwDxHAzY+4gB+a9Bwssyhp1Tjat/RpkvEJ6?=
 =?us-ascii?Q?bA1FMkOuAiyrpCcGkxYTMEsmyJsq74RWaEY75ZpFWP/1pIABo4/qZHN75HLB?=
 =?us-ascii?Q?pRTIPhZnYQIfPXGmedHV5rzZtmrJoT63f2jz+FcTUEFzYkETOaQmtKPy0oNW?=
 =?us-ascii?Q?MLor2JVO8Eu3uRtokXkRy+knLt7SS4Ks2FsT3AYFf+RuvGcBunGDohU/y6Bi?=
 =?us-ascii?Q?9yjZjRtAjXtFX0B2GxXbp/iX5jZ0rLjdazPg4bdMUr3Scrj5ygTm4SoqJjSF?=
 =?us-ascii?Q?Nfcn+fcN26V/a6G/RfwclQEavgvPs1d7ciIOuGXjOvz3/76F2YTcmqpvJM28?=
 =?us-ascii?Q?SX2gn2VQ8WE26ID+H7Z4+xDqCoz4GFHz4Gw/Bnz7HiOJjX4PBXP9V3mEWqAv?=
 =?us-ascii?Q?2ExAPiYYkt5/Gwi6K7ph1VHtr856wxYnQ44cn7G4jdahQqtpX9JrL4pFgDA+?=
 =?us-ascii?Q?U9XW2VFtsxEY5H1CMfGiJZo6Thk0VoPe0hya0Knzovxf1DiokeQEHcu+dXiH?=
 =?us-ascii?Q?afGLmmRRnnJDwYeRksI0fc2q5caTRGQ6mcgfhckzzxj1dMKVA7XHd4+5k8mf?=
 =?us-ascii?Q?k+e7WTeM4/39Kmd61ndjGPVB6DrXK+MMUQL9NyKOv2XlRrnWU62OgVzoCpV4?=
 =?us-ascii?Q?rftDDu0Z467vy9XuZIyr9RYs7Tn/K7sctAmlc4FU4JBjpAUUUpZL4iB4Ki3I?=
 =?us-ascii?Q?+PgTsVO2+GgvpHR0r1uwd1A5S9X0eOFfKKUURftBkVomyYG6lt8EGkMGdDFw?=
 =?us-ascii?Q?ujjbJLb8ZNJ9SJXev6wzFFzb/zJ0MC1kI3DRcvImVv8UqPjOcFvHrOMXA1o6?=
 =?us-ascii?Q?tuz+8T7lie+GqL2czYjv3dOc5TLhtwkmDmoOOua5Zv5+shj8vTs433ZOOWmo?=
 =?us-ascii?Q?N8oyYju/tiTr5dusC2L0mdNwMUJ+IC6TORZGs0wDYhs9ZN8plmFraccoR036?=
 =?us-ascii?Q?pShuTte2d/DJBVDHNdwPA1Itevabpp5O+8N24KldhYfEKtrqOc73xPBr/jzz?=
 =?us-ascii?Q?0heR3kwIfpgps0NrBlLEe5FBM2T+9CX8K4yiq/gavbPFltIZyR6wIJnCiJ8s?=
 =?us-ascii?Q?96r5DwBlga8WSNpdeJ6jBQfjMXHFzTyhCLkg6eVc/67HPM5Dls1cXnjmRGH2?=
 =?us-ascii?Q?AxUtUFv8tSZd2vy7gDNZje6ETToMvF7tKS55y/+ciUNviqkLMhth9tfrevwi?=
 =?us-ascii?Q?MWNk5Vk8dyK4FLPQQO/w+HnlSQkvdut5OYZpZ8ZaE9o39SrKyBLv2Gozxkto?=
 =?us-ascii?Q?bGSi5toeU6HDay7zWFscglRYq30=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5170c5cf-a7e0-4be3-d7da-08d9ada8b032
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 11:10:27.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMe2Q5h9kmamemgkqSSvS3P1JoBtGZsQdvMPITsgKzEVowNCcGmtNpV/o1UQqOOsYgB1igl9EmoIbJIEae9Fmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 22.11.2021 12:00, Roger Pau Monn=C3=A9 wrote:
> On Mon, Nov 22, 2021 at 11:51:59AM +0100, Jan Beulich wrote:
>> On 22.11.2021 11:40, Roger Pau Monne wrote:
>>> +### Added
>>> + - 32bit Arm builds to the gitlab-ci automated tests.
>>> + - x86 full system tests to the gitlab-ci automated tests.
>>> + - New x86 pagetable APIs.
>>
>> May I ask what this is about?
>=20
> It's related to:
>=20
> https://lore.kernel.org/xen-devel/cover.1619014052.git.hongyxia@amazon.co=
m/
>=20
> But I realize I should have added "Switch to domheap for Xen page
> tables" instead likely. Some patches in the series had "switch to new
> APIs" and that made me write that entry.

Oh, that's very much an implementation detail. But yes, if you want it
mentioned ...

Jan


