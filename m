Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9857A4609
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 11:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603864.940972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAeV-0006HL-A5; Mon, 18 Sep 2023 09:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603864.940972; Mon, 18 Sep 2023 09:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiAeV-0006Ep-6Y; Mon, 18 Sep 2023 09:34:47 +0000
Received: by outflank-mailman (input) for mailman id 603864;
 Mon, 18 Sep 2023 09:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiAeU-0006Ej-CG
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 09:34:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99a561a6-5606-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 11:34:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9046.eurprd04.prod.outlook.com (2603:10a6:20b:441::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 09:34:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 09:34:41 +0000
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
X-Inumbo-ID: 99a561a6-5606-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahpADbaz6oKUojRZQzIBYSs/JvjwdKqJSbMplh1lxE3vMEhglf8+qRkBt7/+7kaWqnSFwqDEUkzki2uSTIoZw2QpW3ya9Q73Lp36UZcArCDdUmq8vjs0EbXkefDBwKew4NbIwlntrKYRiPqVf+qGYivdJpRpaFxpy7YsTm0BvlHrcmxZGEPtHyrK/AgsIv1f9KX9V+iSBja7HCelkysczoVqxkzVfLHyiul4CHTwKgt+n3cMTM/3XsRRXD3ORPM8n3JhXsNRzcj8DfW1uo0ndRNfxYKVqblLFpxLYI+g2aqM0190vBr15zOZzZM3AVPpSvqkKBWa6YHhwwYtmzZFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opsRYtENuuHQGLovwl3XVFPPf8rBcwNpbaPNzb50/kM=;
 b=So+jafijEbHEqmyEHJ4aN5gDuJdorqrgt8kbyFNr5GxzEn5zHST8YJt177pc69j/D0h7UUP5+ofBJ08LIGmMISuhJqi9fO485s4d4LWid05m39c93cynmsLvnre/ja6FjVu/MBEZc5SmceGqWg8xiipZwAl5B4M+j3oiucirZQmsk5CPZvTLHLKUuUdoY/Kcdc2QcLMenNq/ZDa3jc3TLus6+Z+c9I77r9BkT4ijY+C8Z+L0fklfdgYa5gzSke2/MevHsw7CuPloKOie3SEn5yYvuQ+CpbwlHj0pj83mPuJbgv3b9YAhui+Y0P1EPMdx2YD9kI64vAmBCtPTl8cbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opsRYtENuuHQGLovwl3XVFPPf8rBcwNpbaPNzb50/kM=;
 b=Q9oGmICpyRBY6s1K1IOncRcZSkT6sMWjYDnkiGpycXqNCq9RqzzQSzHfF+qxZfCNtOg9JBFoFcIuUVdbBns1QV/JwHsgB8c4/vJ4ucZKl72hoPf9x4nGGcI9X5xylnCRXwRGQXQ2YR4dIX8ieRyC03zzO2NMy7Jvit5P9PZq5LvoS2SHI4fQeiQhZrav/yWN3VNs+zDXYtvsrW6ItvrZ2dCi00Emn8bovcdL3TvD0pWSKZZF08u+W991cbBm1CWw99QQDwY55wl2C2IuqLmbVaM+GW3oO781w27UVqesYEZ1y02A3ancB435u4oLshQp023KanjB4k1YnJX9TG0Zcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d290c7a4-e00f-692d-8448-f7ffdaddd595@suse.com>
Date: Mon, 18 Sep 2023 11:34:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
 <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
 <c8e3595f-62e6-4d49-9602-577391f203e9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c8e3595f-62e6-4d49-9602-577391f203e9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b29eb1-439d-4697-9abc-08dbb82a7c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M4GBBmLMkgItQiqyHVH0a0D2Wqy4foeUSFKNpKd6z2cA3ewD1l+/EVJYj1gxIefyodQTVuKGL12gW/TT59jXBQ63/NK4GjlsE9qIGkArxKcogUkE4qC2x942RuCOsNmavUKQbVUQ51VUxFSZ4BApGURNDdpelgYzn3CEvDECSoSVcX1h5QhwgbVJJ4D3sDhwxqkxLf/e6601PVqInj7ALGHaIV44VvIn6m29g7WdrR7XpPu4wD0J+n/SWilR8lBqVpVZilKG+wpCkxJTfpTdqGtRIj+0FJawuWYcHu4gDK3V7uDbQ9odgUpvXRf/sViTcx2GRFe+esRGYHZmHi393WCXBDUN7nY3rHtwt458xfyXNKbpXplFWqH4iMLD6m20fLxOmvbPDpIm09M+Lwcs2nPZENSwVsHvOGPkGkQVhC7ferPn5S52zLqYBl+c1NRhDzaHDjvpDWkJbRQVV+2flixM0jLV8sBogr/xkU1G6CYxZFuWw297bfR98nt8mdRDv4G+ZLGOD+4bZYcD0Yx5afzF/nq6Qc8W5AOzkFWz3XPyi02tbBWNOnXfRV2pPJ9wnra4RbFtR2pXQbTNPZggTfg0WojYPHnngamskYxnl2mvQ7kMBqJFMuFamzq0EG6E209g2iG4zJTdD267K+mz1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(1800799009)(186009)(451199024)(966005)(54906003)(66476007)(478600001)(316002)(66946007)(110136005)(26005)(53546011)(6486002)(2616005)(6512007)(66556008)(6506007)(41300700001)(8936002)(8676002)(7416002)(5660300002)(4326008)(38100700002)(2906002)(86362001)(31696002)(83380400001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEo3QzJxWXcwVjFIWktOY2NwZTBWL0VySFpueCtyM1BwRWg0T21iVSs3L0dx?=
 =?utf-8?B?dGNBcnNDdzVVUXZJcGxPZWIySFZCRk1sMEhIWWVHUWh5MFRiUkQwNm8rOXJX?=
 =?utf-8?B?UW5MRjhNaEtsQUFHM3lybjNKK2llZHdPNkFhWHpvY1R0a1g5dkgvdGhnaWZo?=
 =?utf-8?B?SmVSWFVVVm5UcjQ2bHkrMUhsOTRXWEdsd2NjN3JkNVBid2RIVmxpZG1QK0pN?=
 =?utf-8?B?d1pzWEdCQWkvT1lucVlPRkVQRlNkVXJHYTZTeXBXRVp5MDRDck9JQlZyemFh?=
 =?utf-8?B?RG82OGRjS25zRDQrczIvNjg4YkoyaXdtQkxYUmdKSG1QcEpiZ2lvbVJScHA0?=
 =?utf-8?B?SU90Q016dngrQURmSC8zYTlpTUFHNnZES3d3YmVhK1dGbWxZb3pyYzZRQ3hq?=
 =?utf-8?B?WGF3NmY3a0RVc0srTFNvbnhBLzFuL2tVZ2YybXpaKzAwYjVERjVhaEV3U2JP?=
 =?utf-8?B?OGNiL3A3L1E5ZVRpVm5TUis2dFNVTzhCY0w3bzJNb2NmUnZCSnJMOC9DQVFO?=
 =?utf-8?B?WjRCUzBCUXFxcTVlSGpPZFpEdEtJNHdNOENXa1FKbk00NWhaSFRFUFZTNktu?=
 =?utf-8?B?U1FTRnIxRTBHQmZHSjlOYzRXaDlkZ1VzODhJb21LaThCTThXeG56U25hakt4?=
 =?utf-8?B?amNpMnRjMEIzRiswR1p2enRWR08wTGVTdExiVDVUUEFDbnlZOGU5Uzh1UFlF?=
 =?utf-8?B?bU9GaGpFVTNtZ3NBSEJCM1BmS2ZIaktuNlViN0NOR0hMVWhjNWtoeExEZFh4?=
 =?utf-8?B?Z3dybFpxclVQVEJDUzIzT01qWVVzSWNOeDZ0N0cvd1JZUWlkWVBZZ0NscG4v?=
 =?utf-8?B?NkJBR0NMMEVwVUJpOXJKTitTaFFFRlQ0dFFOdXlSNGhhc2hZU3BuaEJ3MTRN?=
 =?utf-8?B?ZXhTMmVMZk4zeFM4bTBMc0syRlBhdTExN0RhQ0kzenBOSW1zS0cwbWxIZkk5?=
 =?utf-8?B?Y0J4WTdTdk83bzFjamtXbzRkVFY5Zk1aTG9Ob2x3R3RJUFBKWTlnZkdJRlFE?=
 =?utf-8?B?ZnJjSGlKeUdHZW4xdFZjang4QVVocWFkTnlUaDBLRVI0WitVN3EreENadWVK?=
 =?utf-8?B?WStBRlJ3cExZWk94cFN4YmpqeHFEeG1oaldlM3NDdHpsbDdnVXVYVGFYWGJp?=
 =?utf-8?B?MDk3SzRVUzZwaDJnYmdTSzduaXpyUXNyaTRvbmtUOEltT0RTMDd5cEh6ZEEy?=
 =?utf-8?B?dHUrYkZMYkJUMjZOYUFXclFscXMyUEk4QjUvOVI2MVBidVRnVjZacWFtNmVX?=
 =?utf-8?B?RFh0cXk0ZGo4T0tyZndHenhRNXVWRUxkM2FjS3AycDJja2FTYjRnUjJPOE9r?=
 =?utf-8?B?KzBQQUovekZBNytTK0ozWENOeGhVc3JRbnNXd2RoZmNrMHJCNnFDY3NqaWhN?=
 =?utf-8?B?OGZ6WmV1MzJwME1nS0tLRGZmSFE3OUtvaTdWaFNqRFpSRisycEgvalAvL0dT?=
 =?utf-8?B?ZDlWa0tsYlJBc1hnazlRTlBCano5bUt1MS9QaFduZkhPcmlrK1Y1UmY1QldL?=
 =?utf-8?B?OHltVUN6TGJrUng3RFhiNXMrZytDaEZLbFFWdU8ybmtuQTBTcTlCNndVUmp3?=
 =?utf-8?B?Q0VlNWNhRkU4UDZvS3pqSG40enR5MG9VdkNXelVpdzZta0s3Ky9sVmxJcjNq?=
 =?utf-8?B?UzFzZkxZS3Q3Lzk5MnE0NnFUZTZSUllGZXFabTJhUWpKa1A3azFLUTg0MFlJ?=
 =?utf-8?B?akZad0xkT0JPc05IckUxbXJCN2VNUnd4ai9LWE5WL091SlJnS1lBWENGUkZ1?=
 =?utf-8?B?SmV2cHNtTHZFWCsvZXhxZGlYOGNpTXdKSGtRN0VEU3RycnNYenpiM1RvMW1F?=
 =?utf-8?B?YTZaYnZrcjV1c3Zuc2RIVzNWd2hWcVdMVk1NUDRKS1J4Lzd1aUM3a29MTENW?=
 =?utf-8?B?L05WZUh0Vm9ndzVNejJwNVJUNDQ3QlN6M3F1empsaWtEcnRXODVZY2NleVdE?=
 =?utf-8?B?OG5Rb0xFRjJ5MFJKZCtibU9MUy9xdjQwd0JKeUdPa2NmVCtidmdNb2Q3UWJN?=
 =?utf-8?B?cmdldnU4S0paakNQQk5GNnNZTGU0eVhrZk5ZV0haNzRCZzZxUG5YOXhWTFBx?=
 =?utf-8?B?UWE4Rm9CRFJLOVZWcFhnVmxLSmN5bG51WVJWeHRVc2lrUHNibVJCUnZKdWxy?=
 =?utf-8?Q?7ED73hQ9TbFb087EG73FGQ7gp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b29eb1-439d-4697-9abc-08dbb82a7c64
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 09:34:41.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tz40n+tNsTYozwOeonaeG258KeqpvmDsKGXk14K8WZbi4zaLK9/dnZLseO9XCktJY1sZooAO944A/+COpwwHwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9046

On 18.09.2023 11:32, Julien Grall wrote:
> Hi Jan,
> 
> On 18/09/2023 10:29, Jan Beulich wrote:
>> On 18.09.2023 10:51, Oleksii wrote:
>>> On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
>>>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>>>> Based on two patch series [1] and [2], the idea of which is to
>>>>> provide minimal
>>>>> amount of things for a complete Xen build, a large amount of
>>>>> headers are the same
>>>>> or almost the same, so it makes sense to move them to asm-generic.
>>>>>
>>>>> Also, providing such stub headers should help future architectures
>>>>> to add
>>>>> a full Xen build.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
>>>>> [2]
>>>>> https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
>>>>>
>>>>> Oleksii Kurochko (29):
>>>>>    xen/asm-generic: introduce stub header spinlock.h
>>>>
>>>> At the example of this, personally I think this goes too far. Headers
>>>> in
>>>> asm-generic should be for the case where an arch elects to not
>>>> implement
>>>> certain functionality. Clearly spinlocks are required uniformly.
>>> It makes sense. Then I will back to the option [2] where I introduced
>>> all this headers as part of RISC-V architecture.
>>
>> You did see though that in a reply to my own mail I said I take back the
>> comment,
> 
> I can't find a reply to our own mail in my inbox. Do you have a message-id?

Oh, sorry, I said so in reply to 01/29.

> ? at least as far as this header (and perhaps several others) are
>> concerned.
> 
> Do you have a list where you think they should be kept? Or are you 
> planning to answer to all you disagree/agree one by one?

I think this can only be one-by-one.

Jan

