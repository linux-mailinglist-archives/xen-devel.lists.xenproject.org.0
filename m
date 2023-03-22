Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37E66C44AC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513160.793768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petaX-000615-Sc; Wed, 22 Mar 2023 08:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513160.793768; Wed, 22 Mar 2023 08:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1petaX-0005wH-Mb; Wed, 22 Mar 2023 08:12:53 +0000
Received: by outflank-mailman (input) for mailman id 513160;
 Wed, 22 Mar 2023 08:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1petaV-0005ts-BS
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:12:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55d16607-c889-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 09:12:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:12:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:12:47 +0000
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
X-Inumbo-ID: 55d16607-c889-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G07qpMEVAJNksx5wkpNrjqAeCBCn2Hg2tXd/J3ZwZ6l2q6YTxoJcOspsIk06PxnGo89ODCw9myWNjcynoXLhgOc6r2vFFCF3l2O83NdTrXVgFa4cgg+faStaGOBEE41a27GTRBRk0LA48LexJUK5AulNZbXlufhgrqypfjp0F/6eTuwpH2j5iFcdFnBnlKFp17sbDpMutLFOGIDeYgYf2F/KBZ+Ohhm5+o9fhEleAou+YjRwC7/AqBzUQLaIizC8H6RQniubBOOYvzIR1Hkb9rGnljp2AYp3hruImIMRzkxqB8se5NiSzjMu0EzsnLoUAmdVpzgNTo+XimSIBLKiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJCKsSkn+PTTF4nWoLglxHmvbjcZfYns4LxR5NN4OH8=;
 b=R8er6eWBZ3ctooU5WYDjO9gJj7fd9xLYwTSKMN/1HmWlOtcJQXl5wyktXvoNrcH+lgo1aMuaN18l6oEaMRX8YZqN+5YWSJkx1BABS/OcId70d8D4wzah8EBfc5H/I1fz02IJXxVfYapC1aehENCFVIwi6RqMBHPEpzm9Fc/uw0bIySpxWHWIYHrFgUOijVUzFe+d8XQDMglERZ+FErZyecjFwZIzbplc36KpukD7QOhcaDvia2LwPcNkZqD4C2tKJx9RKsji9wnHWk6N8m3ntPRhRKPWACsx2kPo567vhQBCVb/nHgXqzZ1VO0bX1WX5H7Xa2PuCdbyTJidAvEK2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJCKsSkn+PTTF4nWoLglxHmvbjcZfYns4LxR5NN4OH8=;
 b=HU2RWq7LQUCrIAOAAh6RuCl3/2Q3QsrzFy6v9SXFBce67hmqgZ+/1YywhJm6paETh+vSzvuPXd7AUokN0fg6/ecMyk2FP1dx4BR4HUNp+ERNuukvQ2GnbBHl/Kj7yLGz/bw7U87jML5D3BB+Asi7JxaDAD7tKgRBjxNGfc9QxlzKLYB2oYfTC+SZs5UgFzZp/q3FR3jQmxZnXoLnTPpH0kpejDJrk+Wqkr0Qm3M5c6f64SC4hF0oRNLrvkVEAFw4+L2ttqgUI0FVffxx3iimbYfQfAzgpCJOfNsf5Y87mv9buY0WQhJeTsRypLeOrTiI5xeuDhhArj92V4535tEuNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d6cc462-8df6-bb49-5e24-5fb61df40a49@suse.com>
Date: Wed, 22 Mar 2023 09:12:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
 <27c2d76e-1f9e-01f2-846f-9f3bdddeefcf@suse.com>
 <d5e9a5750e7cd32337b98ad39b60d3e95321caed.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5e9a5750e7cd32337b98ad39b60d3e95321caed.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: a18bae43-57df-4216-5b8b-08db2aad38cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AIwVEGV3y4Ms+prMkpHUeLhxwc/xYts9eCfvTWZwOcKQhs9bD+KR35bFHTn2QPIQNXFjdPXopO7Ghv4psnmF0NHl/WobkAfYD7pnlP4Z2cHSbJhz6/JP8ATC8DXRYuXoWmMxIVL6jGn9+xquvhwN01MtISNVxRi7Bz3mGP+C2VNK3gX+k3ZTixJ2DRBAZHTK2vJpi0+Sa7RUgPzCUTiZCxgHANn7C0ZaZ49rfyfFPK7jcyzn1oz7LSPcJ4/+GenLBKkJxOSLvWr3BVeCuQE5NmibY29dtmsAJq0Y+Libz5fqYPOhiZurNKdOQQ9Vosto2IfgVbxsrAQARd87/Gatg9LySgvGKuJ5t5ZMFiZbWrvGvIc54A6yuGLIKbkc0a9M6jn3lW6HzoohtmmVrl63Qfscyfhk2E1qOLnTbSvV9qvxhv3hrIAf6sUrWWmH6kTOBDFrkizM4T9sFSb3H0+DCkxmGDLzElNmHL32OfMmZSPycPDM/H3w4RMC/lRbjR2XtFB6orULnW50FXyZgWjWYOsCCF2+EFY5yW7yFTE9KNAUeJ7lSeVo6QpIsWBwxdIgSKKpULdZc71hCkqkmSjMh1gzDzzHT09/X+3z0GmIot0MZC5LTrj/OVfB/42xNUzXWlVa8qSLn4LFXjauqE7co64flpcOV9Tceb7Yu7jGv1yKZUn8fWvNoL4rGe/rutWW5rDVcSDGRXGXe+PuqAwsjy0VkBphwUIVNkfg4VT7X8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(2616005)(83380400001)(2906002)(86362001)(316002)(38100700002)(31696002)(66476007)(41300700001)(36756003)(66556008)(8676002)(6916009)(66946007)(4326008)(26005)(8936002)(6506007)(54906003)(53546011)(186003)(6486002)(6512007)(478600001)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXUrZ25MSXVKSlVzd2xUQkpiMHNhUHlhQVk3Nk1KTHUyb0tXZnQxTGFZeVlC?=
 =?utf-8?B?TlpBdFNVa2lycG1YSSt2eDF2Z1JwaWc5cmd2YmdkNWFFYnZGQnY2TlgyaC92?=
 =?utf-8?B?WThpbXRBQkw4TUNKeWd0OUhnaWZ6cTdwZ0JqTkxXQm1KNExNZzNUWmE0c01I?=
 =?utf-8?B?bFhwRHVoaUhjUlJkNjd1blFzbnhNNlZVVFNscDE4c0JwN015VXFGOWtRN1Nq?=
 =?utf-8?B?OFhJcHdFQ0IwbjlFZnFXV1JJZkRMR3gxaDVlcVJveHRucGVtMzRlMEpCMEgy?=
 =?utf-8?B?K1V6R3Z1bkFOZWRVV2VjaEVXSnVoZ3VaS1lsSVZHM1VKZHYzSmF3OFpKVUE4?=
 =?utf-8?B?aWhxQTlzeStpTVcvWkViRnlZRFdtaFBlQXc4bWhJVTJHN3JEaGQ1Zm9LQ3Ji?=
 =?utf-8?B?NENyVzVMY0pzTVhXK01ET25KWEZIRE9iR1MvblhvYzY5cm9vS1pYT3FSWGsv?=
 =?utf-8?B?amFWV0IxQU5VZ1E5bG43VmZrdzhEeWI3YWxtZVVTS3dacGJCalhZcFNZLzJ5?=
 =?utf-8?B?YzV0Y0VSVnJxa25SNlowQm5RdjllOVFVbnpJWU9jRk8xMG5XVVp1M0NqY1JL?=
 =?utf-8?B?dkRleGtaQUQxemNSazgrbXl1OXVZWHNnWGVhK0Q1SU0zaHBHY2hWcjN1c0dY?=
 =?utf-8?B?S01GeXZEZVlyaFJjWGovNnorWDFPV2tnR3VUSm5FaXdnVFN0RUszdzVKNk1P?=
 =?utf-8?B?anlMSHNsNmdtRmNOK0tlQVEvNDlGSm9uYUhKQjRuNXFIVytWekVxSFp5dHBU?=
 =?utf-8?B?dDl0K0RnZmcrTDhTRFdmZzJrMm9vYkRvcVZmanZ0RUNiRzRDNXkzdzB0YmlD?=
 =?utf-8?B?dHJaTytGQ2VTbEEyRDkyMUtiaTJrV3RXTHlaQVhINDNJYWM5VWxSNDVxMnZM?=
 =?utf-8?B?TjJxL1JzSnhwNHdMaVRSK3h4RVBLZzdOa2hka1lMVkdlbkY4MTNLeHBrQ082?=
 =?utf-8?B?dEVPOGxxUVgrRldLeWlwQ09BbTlFNjQrbytPU0k4Y0NjNGRybnJzcUhhVkRJ?=
 =?utf-8?B?S2JsU2ljOGtoUytLRDdwWko1Zk1HS2ZhQStDdGRySFd3T0J0anJBOWtKWmxV?=
 =?utf-8?B?UDJ2U1ZLYzBqUXoyOHVoMTl0Ky9xWTM3dFZ2ZmVuMndHdU5IOHdXSG9ibE5J?=
 =?utf-8?B?K1VpbmlJbnBMalNIZHpsK1EwUkdGSExwVTZBdkdIRGxzL2ZYcVJ5ZGd0SnY5?=
 =?utf-8?B?U1NZVGN0VzZrOTU2Rk04elViL2FqMkxCMjAwN2Iwc1p3WXpVa21CWmhwcERY?=
 =?utf-8?B?bng3cHN2eXgyZkEvQk1JS1NVbXlyU2V2dXFKZ1FDalhTRHZJMFpVY2gzZllp?=
 =?utf-8?B?Rk9JQVJzSURmT2NjU2gycllONWVhY0hzc29ERk9IWlhxYkpwV1VmZVVKandk?=
 =?utf-8?B?eXRUZk9NY3dud2ZvVmc2clVpNHR0eDBCS28xbFZOUGp2Mm1wbkNJTjhTMkxL?=
 =?utf-8?B?QkRYN1ZxYjhXc3BOZ294UzV2Z09PZ1BsdDI4L0JNWWZoOGZwdlE5aklCMjNu?=
 =?utf-8?B?RlNmRldVSmcvMHZSeHZNdlovN0trcm5xa3NZV3l1WTR1WE01MHlLNjQwN20y?=
 =?utf-8?B?azJTR0dkdnlZUitiYmRiNy9ibGZQRzBVRExibXNnc1N0bVltNzRpbmw1SGxy?=
 =?utf-8?B?ak9VTUZjVjZPUEhKYmFLVVBTSElqRjZjRDU1UlprMVlGVW9VekNpNHRlZHZ3?=
 =?utf-8?B?QTlrNjEwdkFQQmtXWWpUVTFaVEdXOTJlTGVKZGdPZlUwQ2NCQ2IrL1UyRlVy?=
 =?utf-8?B?WUJQVkk0QU90N2FSdmlHSTIzbmN1NGg1b2YxUmpORGhIaDNrSDd3ZWtPWm9w?=
 =?utf-8?B?ZnRMZmNKS09SVXR1SlMrdVFGL3ZoTUtNVmpjYkloanF0ZlNrMG1UbndOYTl5?=
 =?utf-8?B?SkpKSDNaSVM2akN4V3dlQVJLYnFsSVFzRUFsbTV3TnFXTmN0M2RnYm9PcU5j?=
 =?utf-8?B?dEVBUTF6U3ByWDVNQ0I2eTFIRnJYRU5ncmlVbEpVbzlDWWZicjU5Q0c0cm5B?=
 =?utf-8?B?VmNkWlZLNFBLdU9CQkZCU1ZOSjVtcG8xSjZTS3JMa3dOTWxNS3FjRHRvRFNB?=
 =?utf-8?B?SnRUcXBRcnNIbXFkVTZrRTJsdjlzSjlib2pLcWxPKzUrRUJyUFlRdXdyaHBp?=
 =?utf-8?Q?I+iq7qdV7chZsvRTdMG6LRCRU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18bae43-57df-4216-5b8b-08db2aad38cf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:12:47.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgGbIKOSmKpcZZyZaPVomCobEOutRZn2nY8ZfFcpIx33DLVS8cnxCjpuSI1aRCHZKcFEqqA+O4FcQolliygvvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

On 21.03.2023 18:08, Oleksii wrote:
> On Mon, 2023-03-20 at 17:41 +0100, Jan Beulich wrote:
>> On 16.03.2023 17:43, Oleksii Kurochko wrote:
>>> +#define LEVEL_ORDER(lvl)            (lvl * PAGETABLE_ORDER)
>>> +#define LEVEL_SHIFT(lvl)            (LEVEL_ORDER(lvl) +
>>> PAGE_ORDER)
>>> +#define LEVEL_SIZE(lvl)             (_AT(paddr_t, 1) <<
>>> LEVEL_SHIFT(lvl))
>>> +
>>> +#define XEN_PT_LEVEL_SHIFT(lvl)     LEVEL_SHIFT(lvl)
>>> +#define XEN_PT_LEVEL_ORDER(lvl)     LEVEL_ORDER(lvl)
>>> +#define XEN_PT_LEVEL_SIZE(lvl)      LEVEL_SIZE(lvl)
>>
>> Mind me asking what these are good for? Doesn't one set of macros
>> suffice?
> Do you mean XEN_PT_LEVEL_{SHIFT...}? it can be used only one pair of
> macros. I'll check how they are used in ARM ( I copied that macros from
> there ).

There's no similar duplication in Arm code: They have LEVEL_..._GS(),
but that takes a second parameter.

>>> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) -
>>> 1))
>>> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK <<
>>> XEN_PT_LEVEL_SHIFT(lvl))
>>> +
>>> +#define PTE_SHIFT                   10
>>
>> What does this describe? According to its single use here it may
>> simply require a better name.
> If look at Sv39 page table entry in riscv-priviliged.pdf. It has the
> following description:
>   63 62 61  60    54  53  28 27  19 18  10 9 8 7 6 5 4 3 2 1 0
>   N  PBMT   Rererved  PPN[2] PPN[1] PPN[0] RSW D A G U X W R V
> So 10 it means the 0-9 bits.

Right. As said, I think the name needs improving, so it becomes clear
what it refers to. Possibly PTE_PPN_SHIFT?

Another question: Do you really mean to only support Sv39?

>>> +/* Page Table entry */
>>> +typedef struct {
>>> +    uint64_t pte;
>>> +} pte_t;
>>
>> Not having read the respective spec (yet) I'm wondering if this
>> really
>> is this way also for RV32 (despite the different PAGETABLE_ORDER).
> RISC-V architecture support several MMU mode to translate VA to PA.
> The following mode can be: Sv32, Sv39, Sv48, Sv57 and PAGESIZE is equal
> to 8 in all cases except Sv32 ( it is equal to 4 ).

I guess you mean PTESIZE.

> but I looked at
> different big projects who have RISC-V support and no one supports
> Sv32.
> 
> So it will be correct for RV32 as it supports the same Sv32 and Sv39
> modes too.

Would you mind extending the comment then to mention that there's no
intention to support Sv32, even on RV32? (Alternatively, as per a
remark you had further down, some #ifdef-ary may be needed.)

Jan

