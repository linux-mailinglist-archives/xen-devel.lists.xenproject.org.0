Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214B62F597
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445763.701140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow194-00085y-8Z; Fri, 18 Nov 2022 13:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445763.701140; Fri, 18 Nov 2022 13:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow194-00082C-4A; Fri, 18 Nov 2022 13:11:02 +0000
Received: by outflank-mailman (input) for mailman id 445763;
 Fri, 18 Nov 2022 13:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow191-000817-SB
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:10:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716c2b31-6742-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 14:10:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 18 Nov
 2022 13:10:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 13:10:57 +0000
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
X-Inumbo-ID: 716c2b31-6742-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxkN2mFNq2ywYwIcinIgOd+tBJqzgJMGjt+TYy2zr7id2hJBBcLOTlnNAYJqWfCWwiICntvoqHVQ5jyAWJiSvJf4Gvafj3JWZYbgb46SczrnxvN64/nEJbGjgcymrzJOV2vj0G4W7SyMWpR6MD1yW6kyn92USh5dqsnRhWopA10RC0js/Te3AWLNtKVZ6UVda2ZDBGFb5vk3lAQ+9zfTqiFxPXnZ+w0TWWD3/SO/H7YxfBQQYkfh//dSUd4JWJlNKAA6FouEHCPE5ZW4YwWoPyOO5XuDX/V1pcgNDACHxnoGuf+aWrepltUjEdyMBo2k4SKrP0iKE8YWiAv29u5jqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYkz69mvailF3/Dnf5UMLrpVpwRVCUcsht9JOvU8pFY=;
 b=kvs4gyxsITu6d6OMY63dc5JvxRnNlQJqhzEsOIgFzuh+J9RyhHkM9qbjVgUh3rd3vflGCITb6ooazVNhHnV5Oxd4mUIuzFl6Ji98dHIqtJf1caQN4z7oomYX9o4eDECD5kbF+BBnA9gw/4+5Nc8iGPoajaxNzgjV6DpBWMo4eN6qb2VR051MFf83yD5O93FIS4Q6JOPLukqGmUYYxrzJEA0vh2pFfIBctuS/K17iQpUnTzfh3PBPnNAIkLHF+tJb1X3vd/M3VBbbbyo8SBCMiQ7cBRz8yqqdSMLLUUaYh7yXj3M4EnJUKaHe1Llwi4Kg1jTiTGM6mQrQJhkUiAcFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYkz69mvailF3/Dnf5UMLrpVpwRVCUcsht9JOvU8pFY=;
 b=rqarVSJ3CQg5Ix5g9del4nbfZNXc7deNgxmxMoywHXEWD5/O9bF09ZftqrXWpcgWJQcuABnwIf+nUGMergXHRSVdICHnHPUMD5dqcMUtkw0MJIH3mu5S/dOthiBoFT2hgcSOUjSpja2E0pSs0RaLE6cwMV+q8b8RT1cfegC/rFmuXK/4vYqsC5Q9CcrnSCEfwU9htz6gETwMOQcQIkYuJacWCDnKDHL4yT84pMdT2XzrBY0FST4kleH1G+LtpAO6wCqclXvHtGBpQscjvBTZAJd+30fD1ltoC3OGcvjGATtwTZLW1RH9QIwLnTeE9l6r5sX+s6CAYLvvOZlXqW8Z7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3a17ae8-69d1-1592-7833-e0d0eeb82dd3@suse.com>
Date: Fri, 18 Nov 2022 14:10:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221118104508.768274-1-wei.chen@arm.com>
 <20221118104508.768274-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221118104508.768274-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc817bc-4190-40dd-fa86-08dac96654d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FmCs/KeemC1k+gOZroq5+h7DXx2xNFn7Q6xgENnuD7FOm3R5sP6MqDVdni62GKj4ZDPr3KP8TMQSfJjMft+TeP85CfCm5qjXWzH8ZLbls9XZZvOuNVbG47O4UPkAr0Y2+NSxyIInDhGxaTO2YcnTdg4ae4PH6EbcK7EPtrHbTSoVrQI+yShs10uv9WmU4ODVhIDqNnPbTHxYpVstQo5WxciUJE5GmS+8N1kbOitbwjTF7WrcSIZFix3ucT0ip9NvB2teoJbWIw6cgr5UlvrouHh8+i/7DqvC6JWgk7L4u+zISGOGAcJolkcZmZ0p/SOaEEq6q3iOPzbjEqS2rTsy/lIaC4p44HJeBQ+DtshCpN6EbZQ508szLekilQCEkWghSwW2brit3pkXz3SIl9yHDZ4Y8HLbOAB/vtzHaS1uXb35QWG2o/JUaJf+JBWlkcxrUQWPoR8VpMky9boojAOWwVK5XjhMutqFD/lD2JBekQzOc1d8SonkI1nqKrRIx+9clvjlGUnV3yt3aTK6lWwKtJj95dpkJ6FNxe65D3w1aats/ozs62CrelrkxZeKheQNADyLTDcnfCnDYsCqCOPOAw2yNQGzGTuN58FLmWw9AYRtNB+hyfoGXl5n650Tob0wn7RpxsrxkRQkQWvfwhHScE5m2SjmO61T52roQZF8GIekf3XYep+XAnXMXembFNp4D2WKpM2dcgzzhU5x0IfItrs1I4YoSfUKNKIdHmqfe/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(478600001)(31686004)(6486002)(8676002)(26005)(66476007)(8936002)(4326008)(66946007)(36756003)(66556008)(6512007)(186003)(5660300002)(53546011)(6916009)(6506007)(316002)(54906003)(2616005)(2906002)(83380400001)(86362001)(31696002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXRxTW9GdTFmL0NvNTVhY3pBbzlRamkzaUoxWDJmRWRyU2NWN1MrY0JINXNU?=
 =?utf-8?B?YTVrZ0hVVG82ck45QWR4ZzRhZVducVVFRzlSNnNYaEJmcVpscGwxcDg4RG1T?=
 =?utf-8?B?ckpLT2FRVzZ6UExQZzRHY0Z2L3VKcllKUkJSK2JMM2JUSmNIcW05eDNyRW41?=
 =?utf-8?B?Q1hJblhOdzNXcDNJWEJ6UjRLTXZqdEZiYVZ3VmpQRG9ubGx2TmtIUk5vaW5O?=
 =?utf-8?B?cE1oV1FwcHBtMVJtanlKMWhaTDk4VzlHMWJnZ1NHUWk1M2R3UE5ObXExVThM?=
 =?utf-8?B?cGZoZHhUSWpTMmhKOWFxYW92NnQ1b0tEYTNXWFkvRmtyNFhVRzVNdkZ2dU5S?=
 =?utf-8?B?b3VmMWJkMzRJUHJ6RE1TZVNVU2tFRmZoK214QnlQdCtVTzUxdjVJRFZkOS9M?=
 =?utf-8?B?cmlyeExWblBBcGNwNDBuNHIrUDkvSU55OG9vT0Eva2tFbGhNTGdHNllDWkEw?=
 =?utf-8?B?MlJLTnNZczRSUFRBbmRINk9XS2NlZjdlSVVhVU4vWUcrZk81T1ZUR1FvOURM?=
 =?utf-8?B?ay9YeldNUTUrbzJFbXU4Wk1iK1FKaitwTCtXRjlwOGUzTzJ2NE1wR3loVXR0?=
 =?utf-8?B?QzFLTkpBS0JqaGxVS29aUG5ydHZmeTRTc0hodjZ1UzVqTE9aVGNITkJXMjYw?=
 =?utf-8?B?eERhZitXT2h3Y1hCYm9YNTdTTVhEcHorbStLek1XdVh6VUtTRlJhVmxRRE9W?=
 =?utf-8?B?aDYvUlg5WjJFNUVDTEFFdHFVL0tkOTg0eGZaRzlxbEdVOG00bTlHMjAreFVL?=
 =?utf-8?B?RnZsS2c3Wkx5S0daQkR1MC9tVnFQTWZ0RGtSUjhpMm1zdlp5UVZkMlZJbU95?=
 =?utf-8?B?SlY2Rm95VVp6alg2eEtHaWo0MTh6bTJDdTkzdlVTaVpmczJuZmxuMlQxZVZB?=
 =?utf-8?B?Snp3OWYyOXBrek1EZGJMMnlGQXVWbmF5VjBpS0NuaG92ZGQ1cUVjb28vVUc0?=
 =?utf-8?B?ZHBJY2FDbVR6ZmhPRFAxYjMzVVhuR1hOZXRwZXdrN0JMK1hJSm5IVEIrYnVQ?=
 =?utf-8?B?bmNpaTVJYUVBSFBKZzRrSSttWG5wRDEzbU5RZkJrWGdiYmpmRnlZZGsvcTZW?=
 =?utf-8?B?Q1NGa0wwUHdBUlExZTgrczJrSnYxN21yTWxoTS95SUw1RGsvWnVJZmw5K1Va?=
 =?utf-8?B?U2M4RE92Y0k5bnJqM3oySkNwZ0cweHRhUDI5aHN2Rmpxbm5JNnROVFo3QWlW?=
 =?utf-8?B?RXdBWTNzUjRKMnhRQTFySitxd3cvTkJQZGxrb3dvalJnOTgzWHNJUVJXTHA3?=
 =?utf-8?B?dmVYL0V2eVZHRmxjZ2xvOHA2akxXWWpKL05jWjNXT0RQZUVtZkxSL1N5WG5W?=
 =?utf-8?B?M1JjMHZ0R1JBVTdhalRrYWlOQVBBUmsyemc1ajJNL0hGR1phb2pPejRmZlI0?=
 =?utf-8?B?TU1zbDNjbnJORzNvQUppVWJ3NFdjU2U2V3hkZ0ZhTmk2Y3d0QnJZdGxhUHpn?=
 =?utf-8?B?bGhma1FySFQ3R0V0UEpnaFE1VWtSVUdoVHhKZWhvaStkYXlEREdsa0lIVWJs?=
 =?utf-8?B?VURlYjFIdDhMaExyZUx0TnJuS214YXdnS2JBbS9QZm4rcmkwcURoNjV1MStz?=
 =?utf-8?B?TGJkNitQSUt0SjJoYzVwREpDNjN2Q2duc3VtV3p0NHJpdzJmRDA1WGUvTlda?=
 =?utf-8?B?UGJEQjRYMjVSb0xSWWtCTVBORnkxdmRFdGVKSTdzZmxTRTBJbWR5YWtoOXBI?=
 =?utf-8?B?aFdLc2wweDNaTW14WmN6RXhxeDBCaFpMdG5mT2xoQTJCYU42dS9MY3ZWM01S?=
 =?utf-8?B?cE1zbnRQMTJ1RlB5aWk4QmZHaWdaeEt1MGxZOXJyTVpNMnJxRDY1V0J4VGFV?=
 =?utf-8?B?cGE1anUzQWRrU1Y0cjhPdS9SbVlTYW9BR3BrU29RYlhmUVFXUU5VbTZsTkRM?=
 =?utf-8?B?eStVUnl4SnhiWWxOUjJWNUVUVWRWb1FrQzdqTkk4Tzg0SWd3QStpUlFJMjdG?=
 =?utf-8?B?V2xEVWVJUkViSXJWZEd5MGo4NnZUckRMbG8yWXZReXBMRUJ5dVg4N0tPeU9Z?=
 =?utf-8?B?ME81RWxJaU1FdkMyNndBeFVYcjNvYUxySmJydlR3QnN2VVdqOG1lSlAzYVA2?=
 =?utf-8?B?dXpZVSttam9Eb3JPRXo1WXJwVm1xZCtKdVBkUTVsNGNyRjNSdDhNalltMDcx?=
 =?utf-8?Q?eEXHyCKh5ffTLU8hM5zjnH1Fz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc817bc-4190-40dd-fa86-08dac96654d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:10:57.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7S79x/h9HgZ6tGIZcXzLgcmfEVg+ZW29O/EFPC3QNf/rqvnaOz485r5oSFzXq5fwMecZY7/G7dB3tnLbhPF4wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471

On 18.11.2022 11:45, Wei Chen wrote:
> x86 has implemented a set of codes to process NUMA nodes. These
> codes will parse NUMA memory and processor information from
> ACPI SRAT table. But except some ACPI specific codes, most
> of the process code like memory blocks validation, node memory
> range updates and some sanity check can be reused by other
> NUMA implementation.
> 
> So in this patch, we move some variables and related functions
> for NUMA memory and processor to common as library. At the
> same time, numa_set_processor_nodes_parsed has been introduced
> for ACPI specific code to update processor parsing results.
> With this helper, we can reuse most of NUMA memory affinity init
> code from ACPI. As bad_srat and node_to_pxm functions have been
> used in common code to do architectural fallback and node to
> architectural node info translation. But it doesn't make sense
> to reuse the functions names in common code, we have rename them
> to neutral names as well.
> 
> PXM is an ACPI specific item, we can't use it in common code
> directly. So we introduced an numa_fw_nid_name for each NUMA
> implementation to set their specific firmware NUMA node name.
> In this case, we do not need to retain a lot of per-arch code
> but still can print architectural log messages for different
> NUMA implementations. A default value "???" will be set to
> indicate an unset numa_fw_nid_name.
> 
> mem_hotplug is accessed by common code if memory hotplug is
> activated. Even if this is only supported by x86, export the
> variable so that other architectures could support it in the future.
> 
> As asm/acpi.h has been removed from common/numa.c, we have to
> move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
> as well.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



