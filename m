Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB859F3AE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 08:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392222.630426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQk3z-0003mu-7q; Wed, 24 Aug 2022 06:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392222.630426; Wed, 24 Aug 2022 06:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQk3z-0003kX-4o; Wed, 24 Aug 2022 06:40:31 +0000
Received: by outflank-mailman (input) for mailman id 392222;
 Wed, 24 Aug 2022 06:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQk3x-0003kR-Np
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 06:40:29 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20078.outbound.protection.outlook.com [40.107.2.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3d06287-2377-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 08:40:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7787.eurprd04.prod.outlook.com (2603:10a6:10:1e3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 06:40:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 06:40:24 +0000
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
X-Inumbo-ID: a3d06287-2377-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BePX4AbHxl+b27xqK0DAFoFdzYrG5rpizv0IYdF6A3lmhlf/Y3agyZa+z3saiTM0b24ovCFXwpY4kNXt6WmIjH7uiKkZWC3cT9RrOqKQ+OKpXZqs9DTFRCqHbcXe8PA77N7pgfZkC3g7GW2IbTsLCTCafX5arq37xHVgsLPLkXZI7ZeYlqCPBU47e3dVVXkXkEILzN9rBJCCwFUvj00ulHCrT89zbj42mklscoJG5wcryMR3MEzvwSQDT/YfVM5DhTit7FKjnALOKBg246nA8/Ik3SvvfrNmZMliOCaZrYeia5GGHRz9Fx1tBm3ZsoN8o2azvswA9oifcimtxSSpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2tASAJcbyeoJJNHMXYy+/pVjGHuvQF0cvFlbJWfWIk=;
 b=UoDYovgQHV2k1iKP0+PEGW3gvY+DdBmXGZQnhITzTAwdIfoJJaLZ7rxGon7k91Fybg4afD0jxFja2KS5b9L4ADRwwh9UkFyypz/cEYfjpguohExTsncfkMPLoADqFRmZG5V4qdbyiuCy5pB3LaNuQAEHKNTepKIbrS3tVpCgRwwy0n7KuluCGZPT4taShj0ia4vudGtcQ7+eEj08pYRUDYt83oNAavR26haUaFUO8VgNxCa1EEcnCQ5YpMZXQN/QcrBWN7U5wYABb9dFCAzRaAhaiqRtixJPIxmBhbLUYNSykP7DN84YbbADTgkdsm7Sck4Gnxpfr2QAOs2aFaMXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2tASAJcbyeoJJNHMXYy+/pVjGHuvQF0cvFlbJWfWIk=;
 b=oXSpHJsnxWdyft7VAdKVNhxUpdOofbtxkzqQdP321FRZ/AI1XCrlSdQkgTYHXukO1Ecp6RzJ5uOoxNg6M0el012qXpXAitZ1OoB9InOeZ6pjbLF1pu6zL852F7g2mSmxtCilmi/Ee2q9QTjYWKjxk8OtTS19Op/3ZGySQhPKyS3m1lOlBDwpAHtXgmxOd7TD3+2WfoC0dMKekLdgEVtRStYptIMtNtwFoy0HkC805B0SrLahvyf7gbkMgYg/42isvbT5w6+IotQv8DYYhDPlEVcJCi/WSv5f6h47wJdi6muEQNzhwEt1zlgxrEZluPnuebrmJjKV6JvibV52YmFfIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42123645-19cf-ffde-8c7e-6e1445182b85@suse.com>
Date: Wed, 24 Aug 2022 08:40:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 SeongJae Park <sjpark@amazon.com>, Maximilian Heyne <mheyne@amazon.de>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com>
 <82fe9c20-2b6a-fb53-8ab2-84a955efe14e@suse.com>
 <81811b5a-7006-bae3-422b-81e38bcdaef3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <81811b5a-7006-bae3-422b-81e38bcdaef3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a086a4eb-95af-4c87-5e5b-08da859b85d7
X-MS-TrafficTypeDiagnostic: DBBPR04MB7787:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EqAyUL9q+jCH0eppNeTAcduzAzVxgzsOGfs6nRTxsHiQAM7ZEawexWIoD81bzA+LVaNeLIjLdG0eOZR4taphWDTFEAZa/Q5ImUmDurEmSUbP0GuKSL9VEOSvsusCCEMUnagZeSDLcJcdosIteDhpLS7uWkTGW1MGStQEmjTWZtVtkDLUNkm+LisFZOzIakuo/fjy9DNRDPV6RgmDhqWq3dIALQFXjUrH/s7PbAt/UNvZk3+sdtYN1RO1z8e1SQVBaQd4itiY/dvcY5Ujp07lkJM+CLVY45AXAi7XQ44aFyF/evNO6SAb57oWvnrjliuutiaJtqV5xd/Zt+luupSRfVKPkrFsXDM02N45cMCOWPQjrI2Ao/sHW3tqw9meLeNBmJW8l0J8jc6N2taDi4B57Fkgz5EdItdql+gx6YLa+iz2Hfza1HJLtPGNlHOo5D4ZaLIx3N+/SG+aLeLLTx0fh8ea5UT9cPdtbMguSfim/uZmCFpRKSckAcvRq0bPSggeavi0+ktU0kKEjPpJ8VpVFe4SX0Y0CIFMDrbUh9OIzdfkcpYZhpmjaqqNHevh+1A3zatPHGzsbn7q/RZVs2f52/GIJeCubKXEiticx/nb69qkI0zUUqpNIrcfRq6X5kZByvZBTkNcXi1bvaHd+4SJWimN+M92EYBmzA3bz4UouktfULm/FNjLiFTTx0qxPoz3FsPlE7KIxiv+B082CkImUxGlE5uQuOo8EjUo8dfF+sFHjVn9YNmlt7RZedJ2U8n39FldhLS2Pj/qpiedFE2fCBCEcAE9Oiu7drYSRIVzaRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(396003)(376002)(39860400002)(4326008)(66556008)(66946007)(478600001)(6486002)(26005)(6512007)(66476007)(6506007)(2906002)(31696002)(53546011)(86362001)(5660300002)(6862004)(8936002)(41300700001)(83380400001)(316002)(37006003)(2616005)(4744005)(6636002)(54906003)(31686004)(38100700002)(36756003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGFvZEcvYlpGc29ydUc2RUcrZkxqUGNPUFZndjBpV0dyUDM2aE1IVE5wNVJ1?=
 =?utf-8?B?MjNBdUlOQUNobVFBeHZHL293MmJrT2puSzIyN095QjVHWHljZnkzQ0ZQbWRD?=
 =?utf-8?B?Y2VLek1jQzdwTkxIQzZCMWlFamZ4ckIxVEQ0NEt6NnZRalIzdkdxa2V1bHMw?=
 =?utf-8?B?SUx0N1pPZm5QNEs0d0o3Qlp4QWJDbDZabXpJa0MzRTJUa1Y5azlRQ05nR21r?=
 =?utf-8?B?RGNSQ0tkWExSTjA5SStQU2lidy9KZitUNytKbU1RL2h5NXJ6SVpqbUJyTTdT?=
 =?utf-8?B?TkZkZ0duQXlYUU80ZFQ4VEszOFFpSW5IM2pOUXUzaWMrc1ducExmM2ZSQXhV?=
 =?utf-8?B?NW1abUdkNFFaTERCeGpSdGdDdXQwNldtdkgyMVN6RUpPOGIxVm03UitqeWJn?=
 =?utf-8?B?aStBMEtEdGZ3aGlKNERjSVg4QXd2UktQMDQydlpaVVRabGRRWktmWVkvWFFS?=
 =?utf-8?B?OXNKM2xtcEJZUElGZmlFdllmMUs5TlJjdlBDc1FVdEllUGJqY0FGWFJJM2sr?=
 =?utf-8?B?K3RKOU1neTgyemk4STZ1MzZ3QU5PWjc4MFB1eStaN1htMUdvQTFnVTlIUG9j?=
 =?utf-8?B?WmZVU3YrSVBxUUtjVmdNTno0bHp1UXlXNkxsMHZJZnhvcDNHMVR2cktMY1Fj?=
 =?utf-8?B?WU5zWm9XRFNWQWN0M2cvd0d5Z28vN08yaTRVZUx2SVNBeTl4THd4elVZNEVZ?=
 =?utf-8?B?eXFtRktML3l0dkNHR09NZVFzSi9ISXpnaHRsdVFQMWlPbnBuQ3hjNW1CNXJx?=
 =?utf-8?B?dUNEUmkvcmlwSnFxNDRMM25sVGZ5WjBkNUVYNUExLy9vckpoVVd0dEpHVXZu?=
 =?utf-8?B?ODNvUVI0WEo5b1luVm9mTWdCdjFCaFVtNE8xQkt6NU5tOG05U21ib2k5czZu?=
 =?utf-8?B?RDhDQjE0TGFLWE1SS1dYK3pydlJjTFNXMU9SRk14cTdENFZOMEJia21BWmlD?=
 =?utf-8?B?MmU0dDQ1K3A5RERuQ1VrNFpIVFJjbUJkSlA3YmVTZGxTRUdSdDIyM1VzVjZa?=
 =?utf-8?B?WUl5QmdtbnhoWGUzU3hTTWNZYm16dGV0TnF5OUc0R0pFTXErL3ltUVJYVng1?=
 =?utf-8?B?R2RrRkQyMlNlVFpaVmpDaUFTVkp1MHpGVnZ2c0JQNUFsampubjZhR1RWeTQz?=
 =?utf-8?B?QTV6M250R3lJK2pJZU5lVS9BMU92TWRwUHNCWmpRZEtaVlFKb3lMNXY1TGY2?=
 =?utf-8?B?UTNjUjZ2YUU3NExRTm5Wc1VGOGwyYUtpQ0I2VVZaallZamE3MVRmQjhSTUlR?=
 =?utf-8?B?ZWVSQkltQkN5cCt5WmNBRDV5U3ZTNmNId1AvSC9idCtCNmg4c2hlM09XUytr?=
 =?utf-8?B?YmNCb1R4UmcwUUg1YTM4aWpmM2Jqdlc2UlMwSzA4MjZlcDZqcnZGR0hHSjJq?=
 =?utf-8?B?ZTR3RmhqYllSWThqRWZsYlJvWDk2S3FGUkJiRkppZ1BmNlBGcHBrWEhzdVl6?=
 =?utf-8?B?SkhwaGliRnhNZGsxVmJNOG9DSGxIelpYbjE2RjZvYk0xL3B4cnVkcEZRM2dL?=
 =?utf-8?B?eDhJNnAzak5RU2x4c2tVWjczVTRqeExPbjhZSmZUUEJFdFVwbTBTT0pkYzZ1?=
 =?utf-8?B?MGRrNkFFYXFXb0lCbjQ2dlU5ek5udGJDbUc3Q00xNDBBUVZaK3B2aXhZN05y?=
 =?utf-8?B?bFRBbENBQUNKNytBWlJqRmltRXg4YlNGQmIxZkNnYXk2Z0U2czhIOExFczZl?=
 =?utf-8?B?UjkwWVhrZnp1VkViREFWMXNWcXNkbVZUSWc2SExjV3EzNHlJUmZrbnRTTTlN?=
 =?utf-8?B?UGdJeGtWVWtra0tjc1kyWkFZYWxDM2tVV0kzaVhOTjQ0M2Nmclp3U09HWTQv?=
 =?utf-8?B?N09HZFQxakVRVWExZnA2NU9Cb2NFeTJocDY3RFczZGY4VEt6MUhrSzBTODBi?=
 =?utf-8?B?ZjE3a2JBd0YxVHBGVmNkc2ZvNUM0RlI5VE5BUEhxL3lnVytVUkJPYW5qRjZP?=
 =?utf-8?B?VUhhQ3hyQU5vejVGeGVLT1FUY2VzdXJGRVpuNHh6Z3FBTVdBSHhXejIyU3Yz?=
 =?utf-8?B?R3oxczJEeS9vRjFzUU5mc2VqOER1YkovQkJIaVRzV0p2ajJlUXIxZFN5aWFX?=
 =?utf-8?B?bTllVDBFdlZ3cXErckd3QmUvSXVwYjRwQ1ZVUXRVNkx4UUEwSVI4NE5xVnNo?=
 =?utf-8?Q?YXmG17toW+WAFk1u7Dh62Tiga?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a086a4eb-95af-4c87-5e5b-08da859b85d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 06:40:23.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8pOeqqOCNH9sR206pts4tfVJSO4f08wV4aZ2ovaVxgeMl31M47XKfrh/eE2YnRKwnn1dHasWvs0QV+meSYdAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7787

On 24.08.2022 08:36, Juergen Gross wrote:
> On 24.08.22 08:30, Jan Beulich wrote:
>> On 24.08.2022 08:02, Juergen Gross wrote:
>>> The blkif.h comments should be updated to make it clear that the values in
>>> Xenstore don't reflect the state of the connection, but the availability of
>>> the feature in the related driver.
>>
>> Isn't that implied for all the feature-* leaves? I certainly don't mind it
>> being spelled out, but I don't think there's any real ambiguity here.
> 
> I think it should spelled out explicitly, maybe in the general paragraph
> about feature negotiation.
> 
> To me especially the phrasing on the frontend side was reading as if a "1"
> would indicate the feature to be actively used:
> 
> "A value of "1" indicates that the frontend will reuse the same grants ..."

Hmm, yes, that's certainly wording worth of improving (regardless of any
addition to the general paragraph).

Jan

