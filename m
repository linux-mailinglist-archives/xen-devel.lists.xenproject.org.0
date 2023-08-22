Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D378468F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 18:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588607.920153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYTuB-0004d2-HF; Tue, 22 Aug 2023 16:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588607.920153; Tue, 22 Aug 2023 16:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYTuB-0004av-Dt; Tue, 22 Aug 2023 16:06:55 +0000
Received: by outflank-mailman (input) for mailman id 588607;
 Tue, 22 Aug 2023 16:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYTuA-0004am-II
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 16:06:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70ac70c-4105-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 18:06:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8891.eurprd04.prod.outlook.com (2603:10a6:20b:40a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Tue, 22 Aug
 2023 16:06:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 16:06:48 +0000
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
X-Inumbo-ID: e70ac70c-4105-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La02r7iDSl0K+Ye1JSWlC1Rmxy74LSkkNX0GKDsFOWrpsy1mcP5Gxy0WgYEj7oGuI6uIJODD2FSFvIqpA8wBNe1XEbvfYn/I8iFh3ngVnNGHzI02Zg6kCNH3ROM4KDMurQ4zVPldQFFgW51yJMHL7UDo3HKv117WlGp4GsX6sMRKiTmhYnpZaVC8R9Udn6SQ4zhJNSqDd/Tcm1V2fuKoSlWRyrkYV3LXVj825AnWblEER1+9uy3rD4qGer3ttr43pmX8O7escMLw+wzofyri23k5BqEBxfuvIscPmHCOxKZ3fRxDhfN+VeolzQDfC0xnh5Jup2kfgHzBZ5sdl8SpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EbZgH7SeckSf9BV9v2xl/XwY32LO8ezUZPwITIBIjk=;
 b=JAkl2o1KuumUDe+bOvq61JG4aafp3fh20x4kncArnPKKhBSVx//0FJBKez88vOcw/gd1oD1ynsjv8O/tNc62jgbe6Nsn4/Jg9JQ5QW52drppwb+xa+qrf57BgKK1IyZRMUc3DGjo/Mqq8ouKyI3tQVdqakYTUoZMaMZiT5g81bRNjafhYbw5piXpH5rXu0qrORAFr2JNreuxyelLYiq64m0sw3HVFkBH7eP8jAmE8au5Rnurnv0UpLWQzXa4wxjDW1VViC81SRgozEWYZ/4B73oSRgoeHFDI09vnlsSOJK1xXuki9/1UOtyokp8aKmH23ny5WzJnVzmSwXdXdJKoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EbZgH7SeckSf9BV9v2xl/XwY32LO8ezUZPwITIBIjk=;
 b=QEOmc2K0Spt8DlAjVS0hC5SSoZGTORwfq+0RAZNDCPh5d1m9B4RlkCvbiA1/zRURbjkZ3Z+P75DpsJ9I0u0EbK7s4BlZcusg7uABd36wb8cmo16EqJXMX56aUV/hiXy6eNQidIpZ+aIfFSPtGn2jC11vuOJxh2xlhpf0Eywmogxbh0G5v9fM2LxURjKnBUEUAeYhQvcXyXCNJecAOWRHNlqg2j7aK6CXtCWyWZJWR+0asmSNfwDGNie0wGXJlK6XUuqMTuvlGRHpWLgjcfcCITBn+8wULywkTWG3a+QYsT1LZQvDgoPvioXk22XGxLYjItZkPaNoMsDtjUSuSp1zQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb10f21e-afe4-6593-f10a-fefd1731bf90@suse.com>
Date: Tue, 22 Aug 2023 18:06:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add exceptions to rules
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230819012410.1754839-1-sstabellini@kernel.org>
 <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
 <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop>
 <89c57dd1494de14168dc0c7f4aed959e@bugseng.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <89c57dd1494de14168dc0c7f4aed959e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: f301ad16-86ba-4a30-799c-08dba329c46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HTvO6tCWFxFWSwU6ZIw6xfnCKm/aSXVRuTq/acaD4C8qk5hMTf3mW2xkxQk5dSJ1ICUc6vzDqT2KzzKj/ZfolC1lDNJ9vMKc2hwF/UeetAPRqpTp4AEaZocRy2g3OPNGTI68188XLl1isI5VeaDXDnIx5IukCPd72J9Ds4eF3hcLNAGriwmUungDOn29Iane44tI1MBkuGLmxWgxSP0UFC7zhx78lRjfV3sFnUle9RdNUL7QJyzRZTndZzmYwFijZMt46KlArEl3OwZhFW8QNhyKYiYqEwAHo1SyeAP0zf5YIWbCRqHHOh+ew9mcqdUV9x1uoOLmSewojJGy1OOAJo78yFkQu1yS5JLuUK/vSH7eaGq8TQ4Ady4ChDq27i10oAYySdJH4vmGkdnhk07miCedyJNQbcTkpp9+5DlRpbUlCaceyPntUbC+tpRSqCpM4q8Sa3X9vaESJZh+4BNCoM+ZVA56RjtcXrZ5BuCNc5T2HpBJTk79JozGRbCkKUazF969QSWunoyTgQ3oI9HjWvv17ToeP6pmAA4gpNu6VIN9Wu/GSNygf/ow4CZucN5DvM/aqlhGSgeeWHYrIi6om0NDC2e/6kHZpRz+aQFG5wIiZcDN/gA28tng7j14aofpAApFUlmoEZdMIawR/agamQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199024)(1800799009)(186009)(8676002)(2906002)(83380400001)(66476007)(6506007)(66946007)(53546011)(66556008)(6486002)(6666004)(110136005)(5660300002)(26005)(2616005)(8936002)(4326008)(41300700001)(316002)(478600001)(6512007)(36756003)(86362001)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVQ4TmNIQmFpclNzV2NzQVJEaFNhWUxKRkw2WUwyZnNBelNiblZsY3dUS0hW?=
 =?utf-8?B?REZWVGNsVWVLSTJFTVVKN2hDdHFHd0JnanhuU21CZzdrNHExbTdIVjlpeHlx?=
 =?utf-8?B?U21Sa3hBaDZ0RlBWc3ZMQ3I5Z0NxTTlnajVYTWxUN1RvK0g3MWh1NFhmMkNZ?=
 =?utf-8?B?bEhqbFkrVlc3cjB0L2VZc0RCbXUxQUN2QnJjaEY0S3J1L0VnZzByeEh5Wlln?=
 =?utf-8?B?b0txa0l1dEhObWdDWjR2TEJoa0xzendxWitvOTNhcHpHR0l1bExoa2QwdVZs?=
 =?utf-8?B?M1phcm1lenZXeG5ybTIxelRTMFIwUmEwenlpd3ZBZno3akYwTUtUT3JOTG5G?=
 =?utf-8?B?RUFaYXBnS0hXTFVqTWVBT3VRZ2ZmL2FYZzh2dVlvaUhhR1RVTGJQcVhrblht?=
 =?utf-8?B?bHBTOGQvK2JkNzhkNnRtMDkxS0RRMUtzWkVDQ3ZVblg3NXNwRytwbzhSNFpu?=
 =?utf-8?B?TFZMYnp0TUp0N05iRWllMmZkYUt3a1dRWVRxMzgvaDVLVk11bklMQWhsY3NQ?=
 =?utf-8?B?MlZ0T3k2Znl5cDVpakpqdFVkUHJMZXU4bTd6ODd0aldGMW9taEJIMERDS3dJ?=
 =?utf-8?B?ODUrb2pCN09jN0ZZSTJVbUdSbW4wN25rd0wyTFhpelU4dHMwUWFDWXhrNkxY?=
 =?utf-8?B?S2xmNzZsTmdJclFOeXNpVUxCTjlrUjlhSVE1b3VxUU5mNGN0QzY5bWozWjli?=
 =?utf-8?B?dUI1VE92OUcvdTZqYlpzQjhxb0MvWGJFUDZzR1JPcC8yVzBXN0V6YmErUm9Y?=
 =?utf-8?B?V2dDZWdFUGpGQjMzemlkWUNaWUNhanlYZWJLTGVVK2xGR29BNkNkQ3hVdlZW?=
 =?utf-8?B?T0FsRmtsSU9iWnY4MDIzQ21lcGhzdnJFcGIyd2loNFZCUGVFNVcxbkl0dlhV?=
 =?utf-8?B?MHNrRFFVUFc0aXdHUFVyek9hdFVTc1J3ZDN6WTdJV2JOK2dvOURXTUVOK3Fj?=
 =?utf-8?B?QWdWY1lmakx3L3Yya2tKTzZwTEdVdSs3eDdwT29aRHlNQXpxRENkczdDT0w5?=
 =?utf-8?B?TW9NTGNXamh1K2h0OGI4OTYvYTl4SEV4aXFwZlFUc2JJMEs3dzRoUDV1VmNy?=
 =?utf-8?B?NmVJeEdqb0FtSm5iYi9EbVp4VUFvN0cxd3ZIMGZ0aUNUMkRzQk96UkJ0U2tq?=
 =?utf-8?B?eUJweU43cG9GN2xScG1JcGE2L096b2ZsU3p5WFJzUk40RVJPSEpOeSttZFJY?=
 =?utf-8?B?cy95QmRhNTZPRWdUUjFNS28rRXg2T1ZsM3l0QUFSak5xM3g5V25pUXRvMG1j?=
 =?utf-8?B?WUliRVlKY1laaWQxdEtMSlpFQmFtVnRjZFQreGR4ZDJnS1J3NXM5eGJNZXFI?=
 =?utf-8?B?bHdKOXRjVnV6ak9vdjBOQmd0eXRBMlBkMHNrRUw2bStGV29RaTJQbHF2ZzFS?=
 =?utf-8?B?UnkxQSt6QWd6WXdwdWFJU3hGcWZGdGR5WWxBL1Z1c3IrQkk0bWRPQzBTeW80?=
 =?utf-8?B?Z2ExQmZ6SDdOTjZvbDk5V05UV2txLzRlRFlwdGxRUER3N2JIOEZSZENKZ3RS?=
 =?utf-8?B?dGVqMEcveDZJNFBTOTZhTUo1aytKUUpwU01CdldHbXBOZTJvSmd3MGpJZm5B?=
 =?utf-8?B?Z0RuTWJJVHN4elRUUGp0cWg5bTdTNERDUVo4L3YwREtkOTZ6MmlTVFkyaWhw?=
 =?utf-8?B?cG1oVjZlYmtsVE41SFkrWEpoaEhveGVKeDFzeWErR1VWbE1yNWxaeVZ2NVU2?=
 =?utf-8?B?RHV1RGo4MU92UHBuUnRhcGpQSUxhRGJxOUZ2eFJUS0huSE9zbmZKV3ZtU3Rz?=
 =?utf-8?B?VEtlTStXUk1ieFM3M2NWL2ZOQzB2d3loOGErVU1jbG55TjFHclh5Q3dTblRM?=
 =?utf-8?B?NGFnRW05RWt4SjNGaEFGWjhrVk1hbnIxbVl3NWt6K2xUcjNXRXdFQ29Nck9O?=
 =?utf-8?B?Ym56R1E3dWpQdU5YVnpTQ2ZqbmtxZFQ2Q0RiQlloV25rWlA1Tm5jaTF6T1kv?=
 =?utf-8?B?ZWxZcklkNGxLNEdiQmdXOEEvSytmcndINW4vZm0zM056ZDBZQkRDTFJ5RXYv?=
 =?utf-8?B?MFNuTkxReUtrU1REOVFXOVU2K2xxVjNMYXZmTHV2TzFnSlR3OEh0QXIxZVhx?=
 =?utf-8?B?M1NQNkpXOTkzbjg3b05KMytLSDJOS1JoMDFpMjE0WlZwRTVzWHdQelBkWHMy?=
 =?utf-8?Q?7Xyxm3Vo///crJDSc9thfVcA9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f301ad16-86ba-4a30-799c-08dba329c46c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 16:06:48.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGAdx5Ovu/mbIf3L8TGzi2rWyXv+haVZdTpGuBw4LyA8Z3fyMKTzFJsu+Xz9jG66KkvdkKZRyQQ8XjMEU7mhtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8891

(re-adding xen-devel@)

On 22.08.2023 17:09, Nicola Vetrini wrote:
> 
>>>> +         - Switch with a controlling value incompatible with labeled
>>>> +           statements
>>>
>>> What does this mean?
>>
>> I am not certain about this one actually. It could be when we have:
>>
>> switch (var) {
>>   case 1:
>>       something();
>>       break;
>>   case 2:
>>       something();
>>       break;
>> }
>>
>> and var could be 3 in theory?
>>
>> Nicola, please confirm.
>>
>>
> 
> This one is about case labels that are statically determined not to be 
> reachable (and hence
> saying that the code under that label is unreachable is not inaccurate) 
> because the
> controlling expression of the switch statement can never have such 
> value. An example below:
> 
> $ cat p.c
> int f(void) {
>    char c;
>    switch (c) {
>      case 260:
>        return 260;
>      case 4:
>        return 4;
>    }
> }
> 
> $ eclair_env -enable=MC3.R2.1,B.REPORT.TXT -- gcc -c p.c
> violation for rule MC3.R2.1: (required) A project shall not contain 
> unreachable code. (untagged)
> p.c:3.3-3.8: Loc #1 [culprit: `switch' statement has a controlling value 
> incompatible with labeled statement]
>    switch (c) {
>    <~~~~>
> p.c:5.14-5.16: Loc #2 [evidence: integer literal is unreachable]
>        return 260;
>               <~>
> 
> This is also true for things like
> 
> switch(sizeof(int)) {
>    case 2:
>      ...
>    case 4:
>      ...
> }

Ah yes, we certainly have quite a few of those. Not sure how to best
describe such for the doc, but what was suggested (still visible at
the top) doesn't get this across, I'm afraid,

Jan

