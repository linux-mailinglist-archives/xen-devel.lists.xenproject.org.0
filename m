Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA1249DDD0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261352.452419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0zF-00051I-5Q; Thu, 27 Jan 2022 09:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261352.452419; Thu, 27 Jan 2022 09:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0zF-0004z8-2F; Thu, 27 Jan 2022 09:22:37 +0000
Received: by outflank-mailman (input) for mailman id 261352;
 Thu, 27 Jan 2022 09:22:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD0zD-0004z2-DH
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:22:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8dc62c8-7f52-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 10:22:34 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-jYylFniuPHGcfatyGuVfpw-1; Thu, 27 Jan 2022 10:22:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5365.eurprd04.prod.outlook.com (2603:10a6:20b:99::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 09:22:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:22:30 +0000
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
X-Inumbo-ID: a8dc62c8-7f52-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643275353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLFqD99FARL9XQMsZCRocnSm6uQAvJwUGxFnWi+Rhb0=;
	b=LtfjP32ditZWMJNEyBay1o2gCO343djwWr7QYVfz/MyWK088+VtJXn0mkMx0c3gPHtUsuy
	ZoXpgpdHNgbY12UaMbAsTiZBEY9gVwbYPJQG9VvB+pmaS7/hfIkiddLXVqRn4R//gvt4I+
	PjaWBOxf/RDUemEPD42D+ssHd5ecyYw=
X-MC-Unique: jYylFniuPHGcfatyGuVfpw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIgo/tF/2BrYg9ywiyLvnEAHDIQ8cET+g54vKDN0jhWXUuMgGUUskxK73MOjC158mJNWj+VpG7wZ5omvrXM4FjM5eNoU/nqRVU60LayRVYGy65GzoFDBY64YrdrIBdc14pIDkHegrqyrnX6UyNOIgBXZU6YXJslyRkOJ8LxYKgQuHOUW+TOyzfbGAHtGOWraPf5QQgVWyzFKpmX6/V+r8VeryzxZAO3vl+qC8ATUC5056KLSURCeX8z+C6GU03GsB8YWjIKmKQG4QKdh7q231OyYw0KNR+V8UbMTLJJ1vP0KZzXUnSA5r2KuqJjMBfJ6B4Axv8QZdk3t8ys5jCGu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roLsfW5BYtLkyJsUdQFvcHZ6aAyOjF7GMt7sZWiTRZA=;
 b=mJbyFg/Tf5HSgXP6QKvmVnz9Skklmm/aG3KI+Vi7+DJWItBtHgej2ZnsC3tGtHL+seae9Ywi1Bc1wUHVXInrB2TsBmiNIHvcP46I8o6NFgfrz0612fqRTqi4CdC0oqvwSfNZgQOZaWh9hKTIVq9r/6VrJKPF7LmgDfH91L7TD8/MzGjk4w5o+o0KSJ23BdUdYjpmV1MnbDBm5lBdDliLjeWnBnfVkNYloeonq+FrhFKI3OKvA9isAw0OiiY1H1ssBqtpNpthslkEMefvyTXaD55l2+NOmhw+iii0oRkNwjesebQMyOOj4sZVRN0KZN8oxzPejp7zsrUs7Pjibj3/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ed21543-c299-12fc-a445-ed146fb59412@suse.com>
Date: Thu, 27 Jan 2022 10:22:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-13-wei.chen@arm.com>
 <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
 <PAXPR08MB74209CAE2D594D22DFF14DDA9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <d4bb30f9-92a4-47ef-05bd-0ae1dacb3642@suse.com>
 <PAXPR08MB7420131F1D61587D251C05239E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420131F1D61587D251C05239E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbabc2f3-71c8-4dbf-7210-08d9e1768ad5
X-MS-TrafficTypeDiagnostic: AM6PR04MB5365:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5365EDA9BCE4DA9E6B7C0B34B3219@AM6PR04MB5365.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Je8zUBx6jn1fawXH6CNO5le36kM6eSmW5ZjlT3c8xOIvlN2Sy64OnqpzaogdzIPNaLyYr+7zEPC6y2adavnvkc5bqV/g9btSl6solQjXcTfzcxeWQ4CjI7RrGy13BWJ66BoQq97LnxFtR7WZQn2ZLPOZdSJ5b6aZjDM4IeVlqQ88srHAD9gQ/UImWyYoe3xq/86r1TpDM0wJ2Fv00qCban/aDDaUFHP9bCtDHnuoWxJ/9DXwcm6TUkDgFX07Tsi6fj5IAGJdptULPZE6F1lZUUZHMSP8nTuOPJKxMfxu4BXt7zQrhHc1eudia2zN9FZ24SW5+Cz4B437G/9ubjO/P0pNjCZZKj5ChFsGLiGYXjk5wecL98dYhfVTiFFzxO2WrfBONN+xL0KT6XGspro0VM0uwJd06/SpMcHn27Pc/BnnaMEG144iQ4AURSZVlKWkoXhPBoEvCMxZkoa53jYwQD2vglykRqPm1NPdQ8NYI4AgJYipCHAxMCeEaFaN7vrKZCj+BIp6ssG6bKYLxfvEDhWTRIp1jR0FildjRMrRrppmBdFgr4eG5FIzm29SihaUiuI4ZUgt2nknzK6I026PeA3UVXd1V5kivwGBrhClp+bv3Iqxtjx/c+GR9dbKJYgG+i83f3ZTG5OoEHkorvzwNlHtBTMD4EfvE7ixdJHL8MpBnuCZ9qewfn++UKwhq/FSb+V1scAWWHWbL/SUNMC7x5oRuW6OEzyyfk3NNihme/QEkED4uuzKPb78KJv/kxcm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(6512007)(5660300002)(2616005)(6486002)(53546011)(2906002)(36756003)(508600001)(6506007)(66556008)(31686004)(83380400001)(54906003)(66476007)(26005)(316002)(6916009)(4326008)(8936002)(8676002)(38100700002)(186003)(31696002)(86362001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMOT54ka+XlNYhXXO+tQyPb2pqN6sZ4qa3JXxQDe/E1826U29svLVvKQ6GZL?=
 =?us-ascii?Q?jYw/oyaWdNl+J9m9Ixy8MCv7vEhlpaVdNd1AgnE90lcpf4s87dxezzfVUOiE?=
 =?us-ascii?Q?snR8GsOmRUNJKJ12RzedQSdQ7GvqvtufiYp7lesaAvZHOFbLnLRZQ9NTu10U?=
 =?us-ascii?Q?8+9ICpCHQN3pgpIxUu9YyDmN1AdqlcTnNK+WNFEKQApAIhO2hvYSlWYBCZht?=
 =?us-ascii?Q?NfFTnQKraip0PdjgHrUwK8Q2E1khZ+mZcEJw+aGNkYIziaCSAWaBjRNdqvr7?=
 =?us-ascii?Q?OPQJVvfAKe133SdzvhfwR4QHrcWUHuPu9bPXXNLpiEuVu2N7rV/mPGbDCsA+?=
 =?us-ascii?Q?XlLQqURx6WFPhfEfxm4FKqTDfaS6HOun1JBJLvEKEHClHPFuHfL1m0fUi5pM?=
 =?us-ascii?Q?O0tZmkVhjVH3ufCyEQXZi4reMsSt8Q4+ffetg9aPCxQ17IGceIltrPaB9lvT?=
 =?us-ascii?Q?LJbA+OG7Bw0B5bafanYcjnj/z/SsbMvFFt9hX4xi4gHJa3CNn3NoFMnR8a56?=
 =?us-ascii?Q?tcDSuT/b4p7ytWovJxgrAZAz1ohSuSj707UZ7XDXtH20B7AGDn5uCoxL5kIN?=
 =?us-ascii?Q?UAWFc40slybrLgSqdqdSJCfZq7KxKU7WRucgcm/8SdcGN1TxLPvuOUoBQkE4?=
 =?us-ascii?Q?gNn1iV7/W1ETA/5GVNKDnFZQKaSJFzRg11x2e2gDyHUc8+PiG7ZoNIG+vGr1?=
 =?us-ascii?Q?z0PC2F2/jXUPIl7gggyhaFxOMDOh8c9xtHWL42y5yV3jO5ltptIdsPou7gp7?=
 =?us-ascii?Q?4ohgzlvVOxiLSKkSuklcR2tPLh+3FRYVSKxRT/24nRFbqMR8WqkJO/kRmnrm?=
 =?us-ascii?Q?mYpDo/yGafwSUw7SgL3/tW4WzL1Ou2YNMPPMItf2/4fgs1UbWeY5WLafGmpo?=
 =?us-ascii?Q?1g9GmGKAlybTVJ93DdUsaRpT+luR3CYqkM9z4MjFw0PyQK53UwdBOJ8AsZeB?=
 =?us-ascii?Q?GP7Koad4uAeea0JmRdzluVw9gBApejX5Td9fx3bwyjXNk6l9+K2ZToC21Bde?=
 =?us-ascii?Q?WMDHudjfTI26YTR+VS85A3YY1Vcbjbm0yvx4rNNExZ3MMnt423dTET9inonk?=
 =?us-ascii?Q?e/Ti0/NE8zcIa+s9cXT6Ile7kIalaEXV4trsgNHE8NfMCrucCt4AHveaFVQU?=
 =?us-ascii?Q?eLgUObiyzjNJAB7tf4JhQR7sVsIxUEgzHvaDn14gzMP051/U8eXV7S38ajpc?=
 =?us-ascii?Q?1wZf/XgeRRjjRepHBP0EXwUY41Nn/K11cETE4ttT9pBnWsf1JjZMOHh6B7lp?=
 =?us-ascii?Q?SqsMCy6J8q/aS8K0CR0PQJh72SqU1UTuu1PEVvz1tCVGEYJv8PK9AzH9AxNG?=
 =?us-ascii?Q?qfw1Es/QjPWkClKozCpyjReP0vjnXXIMxeWmSkQ4SSuTggBE8/5DEaID1d73?=
 =?us-ascii?Q?nsF7OztPhPNNDmf0NcFSdzSJYlLOsZgGaXyGqA7n2vlho0kHXcSCVid0AodC?=
 =?us-ascii?Q?Mzt2GPn1Ss5oT5Dtc4HbIcjeuDjCt/jZOl8RZz1a1Atos/476dLAhRpaPzQt?=
 =?us-ascii?Q?wFuJtLj0NUeIKAKOglsASNP+RlYm9Km/b9ZqsnLU52JuzK8zAmOavraYgMLw?=
 =?us-ascii?Q?T6PlKz2c/A6KwmDlfB4axtJ+5/M/tEft+EREoup6fzv9RPGar7/84Hj+DTUD?=
 =?us-ascii?Q?2WzTjZB68e1RVo70JV0M/kc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbabc2f3-71c8-4dbf-7210-08d9e1768ad5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:22:30.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JdVa8tvlmhoRAWryw7ZACFWraqydTQxret7fH14E70Hznhq/2bbWzW3wR04FrljMyVAYNaMKgivZToohkkdeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5365

On 27.01.2022 10:03, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 16:09
>>
>> On 27.01.2022 09:03, Wei Chen wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022=E5=B9=B41=E6=9C=8825=E6=97=A5 0:59
>>>>
>>>> On 23.09.2021 14:02, Wei Chen wrote:
>>>>> We will reuse nodes_cover_memory for Arm to check its bootmem
>>>>> info. So we introduce two arch helpers to get memory map's
>>>>> entry number and specified entry's range:
>>>>>     arch_get_memory_bank_number
>>>>>     arch_get_memory_bank_range
>>>>
>>>> I'm sorry, but personally I see no way for you to introduce the term
>>>> "memory bank" into x86 code.
>>>
>>> In my latest changes, I have updated these two helpers to:
>>> uint32_t __init arch_meminfo_get_nr_bank(void)
>>> __init arch_meminfo_get_ram_bank_range(...)
>>> I am sorry, I forgot to change the commit log accordingly.
>>> I will update it in next version.
>>
>> I'm sorry for the ambiguity of my earlier reply, but my objection was
>> against "bank", not "memory". As an aside, you also don't want the
>=20
> How about arch_meminfo_get_nr_map/ arch_meminfo_get_map_range?
> I am sorry, I am not very familiar with e820 map, could you
> give me some suggestions?

First of all I don't think you need a "get_nr" function at all, which
eliminates the need to find a good name for it. The "get_range" function
can easily provide back a unique indicator when the passed in index is
beyond the number of regions. For this function's name, how about
arch_get_memory_map() or arch_get_memory_map_block() or
arch_get_memory_map_range() (in order of my personal preference)?

Jan


