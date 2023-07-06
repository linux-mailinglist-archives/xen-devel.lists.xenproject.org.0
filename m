Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA19749713
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559745.875018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJzT-0007rd-Ri; Thu, 06 Jul 2023 08:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559745.875018; Thu, 06 Jul 2023 08:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJzT-0007pH-OR; Thu, 06 Jul 2023 08:05:27 +0000
Received: by outflank-mailman (input) for mailman id 559745;
 Thu, 06 Jul 2023 08:05:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJzR-0007p2-PB
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:05:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc5c2aa1-1bd3-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:05:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:05:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:05:23 +0000
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
X-Inumbo-ID: dc5c2aa1-1bd3-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRa08L/OsIoanHLBe/sMM65gEvbEtleH9tWEHUcDL+ZwnRj4D4FmgQPzTYrW9ob2sJQZ403a/IEc5hhfPo0n8od8yuRWW4x2CF2k/Bvywv/t5Zt2puUbbzB5wh2XF6QB1rinJskAlV9LGPWu/QmG4vcviiC3Gp9s+ZLM/WrxH9YRD4t0S6M+hAjQTap4DfRY+7jEjV8pJPtnnS80dxWt+qlbTZoblDKX4P+qYhp0kcC+7TKyzIfR/KNwZj6xnOzjm1Ra8nXlJkiuo44lKgL8wovVcMirlIB9QAwpbvEoU3W68+x4Zj3hXO5PSHJpP/1OHYJFCv3D1UFNvmmKaUujTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PffBXkoKNZD3aGEzj7kMg9mzXoHV2+hn7WAjxl3Lwe4=;
 b=jinAmZNteTnDZ0wvaSr/AO/ylFO9XO6M3ZMoY2FPU+nPfeHhgJ2lAnYlwQrKz3aRw77vEreYZMhwRiAOsvKms0pgrv12GzvdSpAQlKnkLF59snYzw7vXj82/mqY97Fp6NaZs8WVcU8l3j50g5tDgm9TSsidvbxygZTCkQPuU1kY+lyfzWf9hEvHFmN/RYFdsOjx9QDlet94tnfAegRAs6oyqrq+Y1FP8RWlNFEGG2+O89nuicDEP5BLlR2Q33DwKORkXi/cOYl+CY4CeLhcr8fI6DC2jZ8ZuSAVLICj3Owk9Uyhqu8tDx0jMF7XF5FpE0Yx4DLVsp44Omxk5oJpTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PffBXkoKNZD3aGEzj7kMg9mzXoHV2+hn7WAjxl3Lwe4=;
 b=sLyLkbQMB46zcL/Ob1kurzsxapU8V58jlCwT0m68lteMfRAqiFPWH1tKf557ZKSrGE1BunvQcVzmbSge6UJPxxhLmdQiWoyJEM+E4vPV2Q/q+Y1xah8ZE3c/m1qKzAZYj+pU2081+qtfOPyuByoy4lNB3XHiUPlEMkXQRkpC5tvuUS1kPpCvLOw17LFetwkqi6S7v+Ux8ckN9VqRRdOJvcOwgLspY+zbeJn8h2yrqf6q1tg+3Hc+v2AZNZJU4ugiMngMWxA2t/QVDfg7+IJD6uywo1vg8ShpPmqFOb/uJDKbaH/Mv4siAIziM243z6nMe4tHoFLm4OBWu1ih4bGMJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <701c4207-503a-1597-35aa-2fa4c427f7d3@suse.com>
Date: Thu, 6 Jul 2023 10:05:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 08/13] xen/pci: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <b921f7a9a13475da9fe4c71b5cf7173bab55b439.1688559115.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b921f7a9a13475da9fe4c71b5cf7173bab55b439.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aae739d-0d76-45c5-e3b0-08db7df7bfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NtCOqSLk/CFZChL1zE2J8+N8/22Qe294BB7803njU5eApX+NnJZgZIVOHLsw0zizZHESx/3L9N69HblIzfuN8jFt9tHiCRRN5STTLTt0IfUuWoz/ffcjxdQqpXKdpueu8sRya1o7fSJO6zEdAjIa4dHsfke9QNA995or0PX6V54uw29IuQytZjMEdjerpacIonzPlamrTqZ2J5iiXcESEjQKgZzxBeQdhX+ipycsQpap457HSjcZ8klWgJKINv3lZsp99u6iUn1hHlUr9Gd4QjBFYX2z+SiNKtbhhA7/GysGSuzO0lG9hWnTN5dYiCZ4PIOBWjRjVAOCJLBB+A/3xRq8ZXh4mzD5m0Ok5A0BOS1koueiZuHYHyJ0ECFP79HGjtROetCSt7+oIO1UEcBO4uKg8Kt8WA2ZCrNcaG4X5QZ9kwhLHsF+ApD+ZDhQRy5N5d8rfJS68Udrcw0XGNXdxkJt5N56bOfP0k0y+BTg2Qxn50y9YUKXNk+3ysMNaNrVYMDB3CnPQBq8CY2AfLXUBwaDGpCl8j2iGJBz2yV59VcQLtbsMIYMo1Fh/cKLs7VQM9BKhcZQvOy534UC8ZHCpqqg92rJOyeQWRIfHbPwXehal1MH5lR6qMCSK4IeltlDE1TrtSxNQMeTgk1OPNV0kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(4326008)(186003)(478600001)(6512007)(26005)(6506007)(53546011)(31686004)(86362001)(66476007)(2616005)(316002)(83380400001)(38100700002)(54906003)(6486002)(66556008)(6916009)(66946007)(5660300002)(7416002)(8676002)(8936002)(4744005)(41300700001)(2906002)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW05eDIwQ1dYNE14ZEV5dys0aGZwRGVsMEk0eURVam9CYzhsMXd5K0ltcVFa?=
 =?utf-8?B?R0NoZFlWTCtBVU5YWmJUVFA3OXpCUG9aSlNyOUNzbUR0TUd0UlNiQ3cwTlVt?=
 =?utf-8?B?VjZSSEt3VnI1VklFdDdGa05aT3VGcjVVaDBza0drSDVuSkxvdTlLWjBrai9W?=
 =?utf-8?B?S0RZV2ptK05OKzg4azhYZ0s0TCtKcG50WkcrdTJxQm5UUTQ1MTd3SXNUYXNF?=
 =?utf-8?B?NjJWRmhMNG96TUVNbFREUU5BaEFBTSsrV0p5NHdmN0ZrdDd0MklIbnJIMlJm?=
 =?utf-8?B?UkZvWi9nd1h0QXZXRFdMaDFBd29FN1c0cW42eGNsN0lka3ZHZTYyckhaVlB3?=
 =?utf-8?B?YUxwRTk4ckpRbStDbGxjVlFlT2NUd3R6Ny9aUDV5djBsZE5iMi9SS2FSQjNG?=
 =?utf-8?B?UFd1R1VZWEcvRVB4bmdrYWsrN0kxVDdyb2dLMVFvUVNkUVllUGg5U2NFdWdL?=
 =?utf-8?B?TFNUSjNubzVSV3Q5MmdEeWxEMCtORFpoRWlLOEtxZVNvakRTRG1mTkFnQ2Vm?=
 =?utf-8?B?WjhMZVUrUWlVeUx3ZHFiZ3diVTZvN0R6K3FaOTZWeEcxZGJSd3gzQndaRy9O?=
 =?utf-8?B?ZzhtVHdkMDhNODdIdEFIbTdpQW9UTUg4WTR2cnlRbnc1emFURU1qMXQ4dFYx?=
 =?utf-8?B?c2c0VWh4aHhXVE5JZUltTGxhMXBNK3JIVlR6Wm54alJtQUozMzMyOTZnOGtm?=
 =?utf-8?B?ejZEU2dZYjVRSUJSWEh3S2w5cEJvaVFaay85Qm9OUW14c1R4MUFEQ0d3aERo?=
 =?utf-8?B?eUNnWHJ5L0xHeHFROE5IaDVkQzhwNStmcUVsVHVKVER4eStrY3gzdTJiN0hj?=
 =?utf-8?B?bjkrdCsyUnhTcmlHSS9TU1ZkL21wTyt0SE9MMWpsNjJEWkpZWU9Nd0k1b1Vh?=
 =?utf-8?B?K1RXc1FhMXdZNDhScTUybjBEQlR3UlI5VTE0bXFYWlhiejRpazRUSzRNUCtC?=
 =?utf-8?B?Q2krOGJmMkNETW9LZ2ZTYkhuL3N4YVRuT2E4QWMrdHY3WEtsVlZ2WHJodmEw?=
 =?utf-8?B?SDViRmtwbDB6ODRzZ0xNc01FUWRuek96aVNZTWhTaFlFM3cxSGdmMGVEQVVT?=
 =?utf-8?B?RTlUcFI2cWdacWtuNUcvL1RyN3dkUldTdWg4TU5GQnR3MHpuV3A1SE5MSmN6?=
 =?utf-8?B?bFZIWjB3dVRkUzd4Yi9sNllEYkpRVHNFMXg5eVBCeGdaUDhpQXl0clV5dmtT?=
 =?utf-8?B?ajVNZXV0Vk10c0JlUS9GcURVTEZHTlJyNDc3MVdZeUtad0taa0NRWEo3UDVk?=
 =?utf-8?B?T1o0SnBwQUZRZXVlNWVxRVRvT3RWUVpxRkR4SnRQWjdNVmk2eGtqMUlLd3hG?=
 =?utf-8?B?VW9ZVnRpZjZOTUNGWlBZdStlSWRGc0FQNmVrRWU0WmpXU0F4QlN5b3IrT3kx?=
 =?utf-8?B?RmFXZlVXWS80OEwrWnFONU9SWDJOdUpsNi9ERDV4VzdGajYwL1NRZmpFNjkz?=
 =?utf-8?B?aGZ1SjlONzQvWm02OTF2SUt1cGQ3UWFERlVXakRuNGFuZ1BVRVU0OVhuRWJ5?=
 =?utf-8?B?Mmo5ajlhRXA0T2Z5QmZQSjg3cFJESkxaWGg2dHUrRU1KTkt6YlNvZEF6cHdT?=
 =?utf-8?B?QWlMejZabXJML1dyZCtXOWcwZ0NGZzgvSnFTN1RHMEhHTmJXRFlGQk5LM3Ny?=
 =?utf-8?B?T2xPamhYbHZ0UnVxaUhqK2pXOHBGV0x6V25kaXVvblZnQUVQd25jMEdyZGFv?=
 =?utf-8?B?TWpRR2t1Q1QvSlEvMk5hVWF0MlNaR21LNnh3Y0RCQWl6WitScU9NaHdTWElI?=
 =?utf-8?B?TSs1U0pRTTBBNlFJMFo5QWtWQUhZMTFKM1VZSlhQZHZBVFRGbUtNRXQ2N3dq?=
 =?utf-8?B?RllDVUhTY3Y2SzZvZFg5VDE3amJaaDIvdHhES2R5ZzNaUWYvdFVIanVQaEIw?=
 =?utf-8?B?NXBwZTZHbmVyQld2a29tWTNvQ0hyNWVhaVFEVklicko0VGd1dHNXMnlpemRS?=
 =?utf-8?B?UUlab0YrNUxWb3pvdkdhcXlSb3hKaFpBWXZiV1NZcmZQM25LeWwvRUpoUWdm?=
 =?utf-8?B?N3VzOHdSN3FEQkdGU2p1emo1dkh2Z1VGUzI4RTl0S29yd01PODIxVHhnZFlG?=
 =?utf-8?B?VjhseXBlVTRoTk5LZFFPdzdjTVNZWVE1TmpRakZZU0x2blNjZktJOEI5Sm5R?=
 =?utf-8?Q?xMCt6nf2NWRXzdYEjbybroQEo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aae739d-0d76-45c5-e3b0-08db7df7bfb5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:05:23.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsGurzZWLRUtwMC9SZ9NQPZyGY7vZX7HDpNx7QSbt00HFqQ1QB+wZnhl0IBPV3T95rYkjWKZJKysHGI92GH/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

On 05.07.2023 17:26, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



