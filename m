Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F854A4847
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 14:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263099.455674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWqx-0005Bo-OW; Mon, 31 Jan 2022 13:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263099.455674; Mon, 31 Jan 2022 13:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWqx-00059q-LR; Mon, 31 Jan 2022 13:36:19 +0000
Received: by outflank-mailman (input) for mailman id 263099;
 Mon, 31 Jan 2022 13:36:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEWqw-00059k-5j
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 13:36:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3cee17b-829a-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 14:36:16 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-ZySY1B-FM9u56zfKGGtVlA-1; Mon, 31 Jan 2022 14:36:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8104.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 13:36:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 13:36:12 +0000
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
X-Inumbo-ID: c3cee17b-829a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643636176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHdtx9lqJXQOB46IXsPNkQuT2ZN1zWa6zDBLdoFr45w=;
	b=kQ6kbZZldi3Ugpli4CeIioAzPYWntMwosC5XK3QgMphWVpPRxvxs4m7l020tJ/mVcP95c/
	H8Nxxsw/s868XdIbXr69j+x8OWoSDvXwTlgGvp8fqHq6ccrVmOdMtwZd59CVheeYDM+zey
	6Gr34ZkjuqqdWIlTXn0xCZilohmbD0I=
X-MC-Unique: ZySY1B-FM9u56zfKGGtVlA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDl8Gonx8ITJix+TIFkvZVK1XZj7Ie3RaXoUXnhV+WWfWjqPZ6cbB7Shz3hwcqMUg63KBirz2/cLPEltDf3xzgiZxku91IxgOYh7JSr5EuKH8EiDbKWvUbYIVOOcdp5soQgAOnacpKhO+nBLGJuasGQPwhVIdE4JWSFT10yK6sw9RoyBKeiyOnc6pF/hi53mX7GXqjBXDdRn/UlPJ/bpIZg+2okgrlR/jkSi0xpLEWprL1/U4RzpaMMay/ypOVQYj/o26kl1iWz39Qk/9WuaFGH6tiXzYpS7mTJXPGjNv/2NHTZMqXR8TgXapTSOFwhE1kYTgM1YOfDCt6ObjbR/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G+f5m8hWIDUXAPivUIcHKl8jCbB4ejms75XP71uiJM=;
 b=GlDUSA95nt1FbLWuyRja9oyVlln/suU6S4AfWDWfIw6upRJSzRdalUhGVV2cUYN+sSdaxypzYhlzwCVmxMibRqQ/6eBh3UJj40KnwuQ+8dAbCURoXACCKockFkFDT/39I0jJfGXITt5zTEZGg9uyyIYKK1DT0KRdASRMyD4aL9EKhw8ujRj5XE5dVexeyL3hNw3auljlppjHF6+/xYlgobiwsbbi+niwEfYgltoCbEBR1ybb/CxEt+AZYQCqwCaIi3Y9avY2zNC+pk+RLNOMc66GeECg5aarm1uPRbKTahB5Vx/en5RIzj+MFNZi8ObACxxB1VfZC1p/AE/WM3N/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2cfb6134-ab5e-3231-45f4-692c31302b1e@suse.com>
Date: Mon, 31 Jan 2022 14:36:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
 <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
 <0b20be9a-61e6-d286-b379-92c29ee9a804@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b20be9a-61e6-d286-b379-92c29ee9a804@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99140143-a6c1-4173-5ce8-08d9e4bea5cb
X-MS-TrafficTypeDiagnostic: AS8PR04MB8104:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB81048C6040FCE5F4E40FB62CB3259@AS8PR04MB8104.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jgqwjh8C2X+eLkUCzRTYFCz0zh0ygtKHWiKzx2gjiLE7iucT8Cfce6ZGiqyULMmfyviR/fZIQBAsEFpu/Sp/X+x1+e4rY6I492+WVjDGBwHdkwHca7BZXy29nGquUh+VSasUvg54E/Fm3DnhRHiO6MM6LGb2QXoI99z5CqpJHAW2+ChXPlGXa1ebb+UGsfGcS2CvuI5IuPO2dL/gm18Ra3pbcjqf1mLTbMkVAvjtUrtb7xeEfsW+Eowb5G+yC9VZ5NH7QFmlLO3gOHf31wAoDKacQJJRbMAi1V3kWw2f0lWTmNvFjTMwG7+CHCdmGJ3soKzzvQYCVo8QqYW8MkMs+ziE7V2sfEo7w7lMHHB2vpNCpcnxcRCod/ty5SXBRjUVwx/PRCi6CjYxginwb/7nCsTUbqvOgzE1A4LzsokgZ/9cLva2FVSa84sf4SV1RFk99qjTCRySq2KZwyF5jGSZJyqpvnw/GcPFeRYdrI8A5XnzgGj/17jDYVCyooQEUbj0gDKaATUvpB7JChSZCKTlaXlO5kYoKW5RFxv2VS55uW1yWhATZBASLYbW5tFGZoWyJgYPSPJoGmKzGmi9UKbblOD8C0lu+/aeV/w6v2K77SMM7vTPOaZfXM14mMsk1G8Wd5QpgI1yZqA+bTYd818WBDzsGKXmumXn11XenOQTkGsJbyRDYRCrYamSvnXGWR3jRp0ORioDJXacUmCSRzVm0ICn963tc4MS/CUqoxCFibZPRMhooTeK2TNHA3b/7gpc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(86362001)(316002)(6506007)(38100700002)(6512007)(2906002)(6916009)(508600001)(53546011)(31696002)(83380400001)(6486002)(66946007)(26005)(5660300002)(66476007)(186003)(7416002)(8936002)(2616005)(36756003)(8676002)(4326008)(31686004)(66556008)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/eW0zPp9eHDHTGX9mZOdgqLrFe/UOEzgk+X4e0kQiyBVBC/TwSsmi1qVvhgK?=
 =?us-ascii?Q?TlvOExFOF5ASACgRKOxNRfKpOfPubhBmb/1h0tBhcWTMQMc4+hAq7ACYWncN?=
 =?us-ascii?Q?gQZz0amiFBONUyNXiibaV9dYirzD6CV0VKfisCB+d6+toF4DV1qZYdzH4X/L?=
 =?us-ascii?Q?cVRKDNpwvhY+6pkmnsKNshT39GqQ14ZMAHqlta/UCR5o/89qK3C3FLT6wGx2?=
 =?us-ascii?Q?lCrx68xucrBCw591ZuT7+Kn8x19OJVrPQ8Jqb8tdCqIE7C4d3RKR5+c7Kazb?=
 =?us-ascii?Q?wY+bGiKgVgDt/qFA1CV7iEQ6UL/TDrD1f699b1w6M1uxRhSs8dH0opGYbF6S?=
 =?us-ascii?Q?QFES7F7D21oqgll9Ge+MG+DvGhK/O/R4I57my4xh0njuu+RU2TLL+KsLyEq3?=
 =?us-ascii?Q?YDQaPDUc0KNS5pvUVLzrFDABOguT9/7PJOum7qiQ9X6MnQ8y0s+2dR6zKSmi?=
 =?us-ascii?Q?uf23Cu0LgAgV4Lr5QOeg5YkGcdhIKj7aHZ6iBGb5pH0xe0zKYA0Zy3TJW54n?=
 =?us-ascii?Q?mSieF1rQutjDgdCdjplZN1EKyTGK5bRR10HxKMW9mqHBJT5GKJqz+I712UcS?=
 =?us-ascii?Q?WdBMmpRyOqtSuqUEGP1g+l+SnCmC6mX3qX0pz1uvYi6sM8hfiokUanxFILpc?=
 =?us-ascii?Q?cfdtniUqaPTR0/R3hT5WEgsNe5yiZo+gNAex3EO7LaXbKdWnZMU65KZQvL95?=
 =?us-ascii?Q?3nsmMJaPvRkKs7YbsxD3RLHEQuaQktkmVFPADz88JKDZqFNzbCd5oOW4Jf0+?=
 =?us-ascii?Q?WRPdqrLYGYzURcyfu1S2LYRLBHbdNyhQHeiifTzH6LaftveW2rGeFCd3wo4t?=
 =?us-ascii?Q?FLnUcm4xQfGJiNvH1cGRbo4PSXtq3ZetbNS7PVORfMulxr9c8fs0lGphoENP?=
 =?us-ascii?Q?DQmtOf3XTtsJbDYmDhKT2s80Z5rY+S+QSYQDu99BgfJ8E+lLZjfhlr7VRg2C?=
 =?us-ascii?Q?dXSMb0Tfpq3uvoNlI+5yx7gHZwUCe1SJ1kWexBE5MPXQT0P2bZIbZ2t8fnQa?=
 =?us-ascii?Q?9+d67BmJo01vj639u7EI48SkTiuixeAiBoBk9fVcuSTXq0u3HoNFxGzQu33W?=
 =?us-ascii?Q?TsBmHJB5WFfLeqkyKWkkIIi+M6k8LEVWAvCErTXRue+UxRyO1oO89Rjbx6SF?=
 =?us-ascii?Q?Jmlop8dwPBanyGaP3TbzI4zO5RB4SOXNdO2H9iSjSJgq+ijDEgrAQv7Ps1x4?=
 =?us-ascii?Q?422Dyj6UwM/RgjzDGdjGApLY0t5tHZuBGOHj8VhnpPKZNWZ4U9d0+9yPC6Li?=
 =?us-ascii?Q?scWRc7/JVwXvzSr8FNzUq6UR+KRWClKkNYJZSSfz13B/MvmPaOFkrKDpAegx?=
 =?us-ascii?Q?1Vt9e38OX/wsttF0z7bM2jKqzhJCUzi21gNdHjel/rVQ2biquPSrn6AbliV3?=
 =?us-ascii?Q?eYW1m4Tkm7k98Gtil+flwwPirZywyAna/ZKEtHEiEMPx8nT8jWxXsxJAgbkz?=
 =?us-ascii?Q?exO0aL71y4lV3eTP1iTXDu6EHeuYX6L58zyD1bwtc+Ay8fd2HQLK7i6AImjB?=
 =?us-ascii?Q?0/esYpYjHFKajfj1WvT2/HmqVsyx0nU3jkEfTrymG0IL9EySE3EF1xY2Pj9t?=
 =?us-ascii?Q?6ZhTmOz1ap5gL5cm659DGkyFa1FnrLr6rVn4jc19AzYqDoJOmngbJ1aFkcWL?=
 =?us-ascii?Q?APFwS9Lv/cEqRg92AZOifgg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99140143-a6c1-4173-5ce8-08d9e4bea5cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 13:36:12.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vThJJO9ZgY4S2frMgPWNcJ9f+AZ87+PjTxUW8vMlnD7tokTK/TVRbJLr3gcpSde7PrOQDoE0XWd8su6M6knFJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8104

On 31.01.2022 14:30, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 31.01.22 13:39, Jan Beulich wrote:
>> On 31.01.2022 12:23, Oleksandr Andrushchenko wrote:
>>> On 31.01.22 13:10, Roger Pau Monn=C3=A9 wrote:
>>>> Right (see my previous reply to this comment). I think it would be
>>>> easier (and cleaner) if you switched the default behavior regarding
>>>> unhandled register access for domUs at the start of the series (drop
>>>> writes, reads returns ~0), and then you won't need to add all those
>>>> dummy handler to drop writes and return ~0 for reads.
>>>>
>>>> It's going to be more work initially as you would need to support
>>>> passthrough of more registers, but it's the right approach that we
>>>> need implementation wise.
>>> While I agree in general, this effectively means that I'll need to prov=
ide
>>> handling for all PCIe registers and capabilities from the very start.
>>> Otherwise no guest be able to properly initialize a PCI device without =
that.
>>> Of course, we may want starting from stubs instead of proper emulation,
>>> which will direct the access to real HW and later on we add proper emul=
ation.
>>> But, again, this is going to be a rather big piece of code where we nee=
d
>>> to explicitly handle every possible capability.
>> Since the two sub-threads are now about exactly the same topic, I'm
>> answering here instead of there.
>>
>> No, you are not going to need to emulate all possible capabilities.
>> We (or really qemu) don't do this on x86 either. Certain capabilities
>> may be a must, but not everything. There are also device specific
>> registers not covered by any capability structures - what to do with
>> those is even more of a question.
>>
>> Furthermore for some of the fields justification why access to the
>> raw hardware value is fine is going to be easy: r/o fields like
>> vendor and device ID, for example. But every bit you allow direct
>> access to needs to come with justification.
>>
>>> At the moment we are not going to claim that vPCI provides all means to
>>> pass through a PCI device safely with this respect and this is why the =
feature
>>> itself won't even be a tech preview yet. For that reason I think we can=
 still
>>> have implemented only crucial set of handlers and still allow the rest =
to
>>> be read/write directly without emulation.
>> I think you need to separate what you need for development from what
>> goes upstream: For dev purposes you can very well invert the policy
>> from white- to black-listing. But if we accepted the latter into the
>> main tree, the risk would be there that something gets missed at the
>> time where the permission model gets changed around.
>>
>> You could even have a non-default mode operating the way you want it
>> (along the lines of pciback's permissive mode), allowing you to get
>> away without needing to carry private patches. Things may also
>> initially only work in that mode. But the default should be a mode
>> which is secure (and which perhaps initially offers only very limited
>> functionality).
> Ok, so to make it clear:
> 1. We do not allow unhandled access for guests: for that I will create a
> dedicated patch which will implement such restrictions. Something like
> the below (for both vPCI read and write):
>=20
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index c5e67491c24f..9ef2a1b5af58 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -347,6 +347,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,=
 unsigned int size)
>  =C2=A0=C2=A0=C2=A0=C2=A0 const struct vpci_register *r;
>  =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int data_offset =3D 0;
>  =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t data =3D ~(uint32_t)0;
> +=C2=A0=C2=A0=C2=A0 bool handled =3D false;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 if ( !size )
>  =C2=A0=C2=A0=C2=A0=C2=A0 {
> @@ -405,6 +406,8 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,=
 unsigned int size)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( cmp > 0 )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handled =3D true; /* Found th=
e handler for this access. */
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( emu.offset < r->of=
fset )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* Heading gap, read partial content from hardware. */
> @@ -432,6 +435,10 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg=
, unsigned int size)
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&pdev->vpci_lock);
>=20
> +=C2=A0=C2=A0=C2=A0 /* All unhandled guest requests return all 1's. */
> +=C2=A0=C2=A0=C2=A0 if ( !is_hardware_domain(d) && !handled )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ~(uint32_t)0;
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0 if ( data_offset < size )
>  =C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Tailing gap, read th=
e remaining. */

Except that like for the "tailing gap" you also need to avoid the
"heading gap" ending up in a read of the underlying hardware
register. Effectively you want to deal properly with all
vpci_read_hw() invocations (including the one when no pdev was
found, which for a DomU may simply mean domain_crash()).

Jan


