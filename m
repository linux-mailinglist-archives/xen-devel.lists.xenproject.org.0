Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B578D63C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592939.925795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLSK-0006Zt-MR; Wed, 30 Aug 2023 13:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592939.925795; Wed, 30 Aug 2023 13:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLSK-0006XT-JN; Wed, 30 Aug 2023 13:42:00 +0000
Received: by outflank-mailman (input) for mailman id 592939;
 Wed, 30 Aug 2023 13:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbLSJ-0006XN-MF
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:41:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd9f74d5-473a-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:41:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 13:41:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:41:56 +0000
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
X-Inumbo-ID: fd9f74d5-473a-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYPyBK9+r3WPsx9WpyIe6eG4Ifs9FYVe9/TiA3U3us0M3FbXLMJMcejWRBIpuGoS6w3ufr297tK3Fi4RSn+6j9ExmdE0q6JRIG8tlWbGJh1pyC1Qk5cCQevEWndC2i6Ua0sYQB18kX+rqIAlqIL6vMDbmvaugQfki3v8qhTMFIXls5xfnm8j35dOF6podiZ+YUfA61LqIGtCGVQa7sKrKin6N8RDyljY75SwV6EqwlXNQAQUqt1tYpURbBqWhkQanF1Eupn5dFu0iMVeAI4NRfVNTQMdIwbyq8dvwyei7KC8mDgFqo4erd8DvcIC/yluUz+j2a5QN63En+1NmbzBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1bPQjcdTP9iQm25N43hO2+wK86V3V0MB9f2ZTY5AGQ=;
 b=Xo170HTD5yavZubxmYlqjEaZTIeaJS5CBPC+7MSOr8AWFBsOrJXM8kUCsI0BxxKfMhJg1hi6hsusY+0RckhLKMP3FhJdngj8dCoViRkySHQEbI1d2NAR8EO7HtIq0peSMjkFKwUxQ90cnb7F8ARAM86OOz2KYp8gKbGn1WJnjz/V+jUtTN6RVtZ7DnB2lXLGGOS8KddqaSKWjc1b9ndCUZ9tkjsx2leuTinUefszakt/oaLMs8sz5/WC6XAZA3j0g0dzElU9DP2QOfCjiVPQJh8zh4jR3bAQv/fjNnuDtgMMH+mUT2JsPYT6toBmYqnSwQcjKytMP/b6fNwBaWT9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1bPQjcdTP9iQm25N43hO2+wK86V3V0MB9f2ZTY5AGQ=;
 b=m67H13R+e6VeAu/UkfpDP2I6+NwyPNCLrZW4o5Lab/4gD2Z2/gRu+mT6gvrcZordNZfXcjzaJFPMq/qcMP/TirbwElzGJj44fXlkbzsU7AZOILWxFIDKmmXHHew0JMjSLFp1M+0qwm76T9F7bFGWqjbOZcEj0cb0iheaSGPy99fY/jFcM2l1awipt9Jmle5Ssn4oD+DxMa9yxomJ19S3ovFGaBclXrqqqcNcq3xxM67SC3qJDx0hgTtiSvvWQU4sc70l2/erp2u7CSkYlm7dtILlvjuIIcnAMcJGFgIYVzT4XHBGuikqEKkXsNuch6QtlNi27scTjGHZNDv0Iyp1pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d19675c-993d-974c-425d-bd16d3e85905@suse.com>
Date: Wed, 30 Aug 2023 15:41:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/8] x86/hvm: Only populate info->cr2 for #PF in
 hvm_get_pending_event()
Content-Language: en-US
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <c668f355-0a31-0ffb-a7c2-4fee46705a3e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c668f355-0a31-0ffb-a7c2-4fee46705a3e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe043e1-44ce-4cc6-71e6-08dba95ee0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UTEyuyqpfr0NnfW+PRsp+Dlc3G8I749mDIdJG5U16MYGmbCLMc+ku1AmVWzr+lFMTFjmm3RaNEENjKp3XGhti2MBUFmR9EflxndZtrOcbDvwSCUR38NPk/l1KdGs1+JExbbSsOG5pQZa+23nNTkt8mnu000DldPFzHAOQk5pX42uAeXnl/AleBiEASemjiTb7mAtTnwux7HcExviaQyjLZuKhbFOOqU/SyF+X6/jO9uwREgQET7OaG5YuFJrR4M8/Tj4K0GcKnB1WtsRaIk7y/DFqsRdZ/cHNb5pHw2xoDYa1AECkFvmyCuNOQP6d6Jv2ourO22UJu0kbcZofMrnR6FVK6ACq9dqUJjH07HV9iKoU8d4L5iRG6sozWyiehKYeVp2ibt2QNYbIznkBYqTuNi9qgV5JNWv2/2Fz7FgihmjQogsR1Voh6qMtWx4DJ0p+onaBPEfk1HzUO9W8xsQ//FeDObFaz7bkaJwxn4LlarrX6tnq4+xHj1bkmfgryDNKPnQaPrXakY9J1bUISGz57UIVyF1e7dlnCp2FZ7f6Hv9/Cv0Es/Kelt7mUh7nGROB65EL4HHTPaHnqEabzC/ggI4N1ju1sUroezIgFxgdcFHlxsrej3hD+sUsmUzAbLTRD1cROzHh/OicTrwDjEi1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199024)(1800799009)(186009)(6486002)(6512007)(6506007)(53546011)(478600001)(2906002)(26005)(4744005)(6916009)(41300700001)(66476007)(66946007)(66556008)(54906003)(316002)(8676002)(8936002)(5660300002)(4326008)(36756003)(2616005)(31696002)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0dRYmFFb0JZTWpoTVR3T1g4ejRpTjE0WHdTTkloNE5iVllzQnJmVndWUlJJ?=
 =?utf-8?B?bUFwa2dUcUg0RHlheDNZWTMrOTBzZWhlaFVqU1Z3RXJrcmdhOXZwUUJpcmhv?=
 =?utf-8?B?R0xhV3RKQkxGYWNKWlZlRWgzVitPQlV4ZWlGQUNCYmVSa00ycGVtc05CbzNs?=
 =?utf-8?B?UWlvaThDcXpXd0dwdGFaTHhidVgwM0JHbURHdGNQMmdmU3puRVZnd2RyeUF5?=
 =?utf-8?B?bXJVUVRuU2lHcFlnMC9IdzJPUlNLR3ZTbW1Oei8ydDUrbzhIQkNJM0orTG9K?=
 =?utf-8?B?elIrODNCTDhpeWQrNGExekVyaDZaNEJzT2t6SmUzSWpELytES2ZWNUJJbUIr?=
 =?utf-8?B?RnpmNVpEL2hUYi9JM0tvamsyT0xiOUdYM204TFJTRmliSlduMWdqRGtWeURW?=
 =?utf-8?B?emVJeUtWemsydlEwNVlJcjhyRUdVVmlHeFZmWUFPMlpZTE5SbFpXRVRLTnNn?=
 =?utf-8?B?MG5PY1htT2FQdDFXU0JLeDhSNlVDYW1GKzloUkNyRktiUGQzOWRzYWRqU0Jz?=
 =?utf-8?B?eER6VUZtTFB0WTZnRThpeGRjS3NIQlc5K0ZBaXdUVnJJdUFTWEI1TDdFNDVa?=
 =?utf-8?B?bm5WV3ZBTXJsN2labWhxb1E0OXFUOG5KZkQ5WVVqbHNic1l2amNmdEhoUEJj?=
 =?utf-8?B?RnpKV0h5NWpWaGdPUGFGaENjMVdmU2pBcisxMURxODI1LzNWakh5bGx0MlRJ?=
 =?utf-8?B?ZGR5RWI4RktYL2JWTFhtVjhPbmJuWmd5YS9ydE82bGR5WVJCTytKazZ4ZzQv?=
 =?utf-8?B?NXFPN0RrZ3pFWVJsMmRBT2ZJK01Zbmxhby9rSmFNa1NNL1VIVmVwdURLZ21E?=
 =?utf-8?B?QjkyM1gvZHdCd0N4WTVPSFhiUTVpYkI1c1ZoMFRqai9qWlRlZ1FLZHlwNDlx?=
 =?utf-8?B?WTV2S012UTBVd0ExT1psT3ZQTVlhVUV6bU5UdjAzc1ZpcnhuUmNnWHcvYUFX?=
 =?utf-8?B?aWExMHFjSDhsUDdQK0RmMVo3bkRkMWVCWFFnNkl2dWw0VFZpZDFKbzZrZUZZ?=
 =?utf-8?B?eEJjei9jSm5wZmhBTFBYMGNUTytHYmdmR2dhYis5UWVkb3lIYTlsNHNUejNH?=
 =?utf-8?B?WnlZRExWY1ZEZUlSM2JUMWhVajBYbmw3M2l1YWkwSWR0YnkvbkJhMzEzb05v?=
 =?utf-8?B?ZjN4TXJxVmZWRSsydXUvSExsN2s2UkpHYkhwcWF5UzAxN2lRU2orblhldHVG?=
 =?utf-8?B?b0JMSmhIZjFPd2pEUTY3YVM0d3VUQ3Y3L0RyZERuQ2xyS2NiSUdaVWRVT25L?=
 =?utf-8?B?U2JDUlk3WnVyM3NiMFB6ZG5Ya0crTkFNMnR2VDJ5OW9GcU8vV21xNHhNRlJm?=
 =?utf-8?B?LzVlZlVsdElLNVdvNjJhMkxlM1pib3RBWmNSd21lZklCQk95WXNzTmdUeitC?=
 =?utf-8?B?dmJvMWQ2bW0yZkhYYWNBSU1EbTY0WTNwMzhYc3E1clNIZExrc1kyUW0zZkEy?=
 =?utf-8?B?cHpPb0dXOFM1U01JZklKTGZQakxWRTJnZEQ3UFdTWjZYbTFjbnI2b1lURTNu?=
 =?utf-8?B?b3BjWVYvcHRIaUZ2M3JaM3NiY1YwYmFuY2lKUDlLS2FvcnljZ090WGZVRlNR?=
 =?utf-8?B?Yk42WjFQSk91MStWQXBvRlZIVzllUGZEQ1JjV05WYnRvakFacE1pV3kyOHhk?=
 =?utf-8?B?V0RxaVhnSzBYcnczbG0ydm0wMU5zM2ZxUzR3K3ZXZy8xd01ISzk0QStsajNV?=
 =?utf-8?B?MXMzb0ZoeDJIenFvMHFQNkQ2eEZ0OEhGNEw0RWw1OTdVeXdIYS80cUxjNGta?=
 =?utf-8?B?cExCc3FUZGh3b0ZKenc2MlBFb0gvMWxsdjJRRFNjR3E3dHZ0VFBSTXRvSG9Z?=
 =?utf-8?B?YmNQVHh0Tm5vN1N5R2hsNWRHV1AySDBmVFA2S1A0M2tFdFRaMkl6cnJvVjNt?=
 =?utf-8?B?c3M3amRyNVQ5dEh1ZmZqeUZIYk9Qb0Y5V210KzFHY2lHR3JEMjRjQlRSNWpD?=
 =?utf-8?B?VkVIMGNHaVA5L2FHdWo0UWJrM0lndC9hYjRiUzYwRlg1cFExWXRhRXhDM2Jm?=
 =?utf-8?B?aHFsaDFHL29DN0ZzY0FUUUpjWGtrbXJzY09uWHVXZHFBaVlLQTJaTXBzKzM1?=
 =?utf-8?B?UHJpOUkzcm9kR0hCcFlabVdrN2lmekhrMy9iZitNWkU0LzdIVW9hY0o1bWZ6?=
 =?utf-8?Q?83i9ZkSg5HO7Nnvdr3ML0+msx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe043e1-44ce-4cc6-71e6-08dba95ee0d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:41:56.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6h0zOGGqGejZpcCf0FTC2vnpZR7XfGXacW260bfk4bBNJ3fpFp/pJw5E74LsyBCKeeoH5JefJyysS7fq/XGEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120

On 24.08.2023 17:25, Jinoh Kang wrote:
> Prepare for an upcoming patch that overloads the 'cr2' field for #DB.

Seeing the subsequent change and the fact that earlier on Andrew didn't
need such an adjustment, I'm afraid I can't see the need for this change,
and the one sentence above also doesn't answer the "Why?", but only the
"What?"

Jan

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -503,9 +503,14 @@ void hvm_migrate_pirqs(struct vcpu *v)
>  
>  static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
>  {
> -    info->cr2 = v->arch.hvm.guest_cr[2];
> +    if ( !alternative_call(hvm_funcs.get_pending_event, v, info) )
> +        return false;
> +
> +    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
> +         info->vector == X86_EXC_PF )
> +        info->cr2 = v->arch.hvm.guest_cr[2];
>  
> -    return alternative_call(hvm_funcs.get_pending_event, v, info);
> +    return true;
>  }
>  
>  void hvm_do_resume(struct vcpu *v)


