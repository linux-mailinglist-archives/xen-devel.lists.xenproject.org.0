Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D687D35C7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621399.967840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutSm-0005It-4p; Mon, 23 Oct 2023 11:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621399.967840; Mon, 23 Oct 2023 11:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutSm-0005GY-1O; Mon, 23 Oct 2023 11:51:16 +0000
Received: by outflank-mailman (input) for mailman id 621399;
 Mon, 23 Oct 2023 11:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qutSk-0005F7-Cp
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:51:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76ce674a-719a-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 13:51:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9130.eurprd04.prod.outlook.com (2603:10a6:10:2f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 11:50:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 11:50:42 +0000
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
X-Inumbo-ID: 76ce674a-719a-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/lv359VsVyCg3aYpuzHqcCKZDJiDKY8CUBVfA5/++5hyQJTraEGxUPr86uazQ4JbMOWqAAtDoGtgk57fFwL7QrK86ejrk5IDY7clWnMVAfsqL4O4UMw6K7evKXcpNpfsvI+kS1EYtv1jQFqErVqut2pfKaIj07rP6ku8t5gkE+9qKXBBihH8vRb72XTKKVBCPXQKncbOi9xq/INl6rGbgqceQHSDQnT5YOymFcGWxMCXj+LghDKjLlfE5G2BZhx5TKTneQ8ZUS4/T0XpPADQDgarK2+qUbNqjLMXky0/4aDKUL0xw2PWOrWa67y2rNxDtmATeUajL+lUFcQSrOfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMu0DOIyqQGn7n1ISvh+0GShf823uiQHyp1kTEWEVww=;
 b=fN5t+u96rJC8/5Ezr5IrS7zr5p75ng7JnP5E2QV4JBPkfKVqpFtKJTsy3hmN1GVI0U8RQKXxoT/M7kyJwjKKGvX+ycZG5QHMSXDtje/sX1vv7UtCkLb+e/htBDQgnBK+p2SRoEUI6f+TMPvpVr9uAKvI9hhfu6UsooTJjnMS2B+rQYv01HmoYC6aMD5FpMm+GnACRfOM2dNJD+CemAr8zloLTHGSSCpPNPHmXwakSovi4gI5RNe1IcI00qpO49dJIJ0v9wl6Ou8V36XKwBMwdhJuky2Y9lOmECoO21um1OqjYcIrxW+BkRS6R9GXZmgpryKoeg8LWNHeealUW2exXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMu0DOIyqQGn7n1ISvh+0GShf823uiQHyp1kTEWEVww=;
 b=RTuBdxtXgfNmoQYv+0jUDCYLBxos2JhteAc+257itCN3j5rbBOkS2qWfDdbHSZDPpEttcnO+nfn3VONHaNnj2HxgE1yXX3DRNuqEKHxqRdPf2NwKrY0JtH3a7vpjgkz75EjGI4qVMLHtbcAUgcpTRTto0PW73MIn40f7qhDfN718M4Qx8HqW+BOVHR7rkFXk0nDMXa7TOM0KFNMsqRi/7YEUd39xESuRgYici1HxM4t9QCh4RbrlG5cM/k2lsmgvLGByRLSbFocTGbPxyWt+dk2OMpEWc6frVRncQtsWrjKHut+WicJ2dNdL64xQrcbmQ20JL3r9QBBDhrYeDJwO2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7b02b0dc-2649-37d7-f6d0-f3ad375480dd@suse.com>
Date: Mon, 23 Oct 2023 13:50:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/pv-shim: fix grant table operations for 32-bit guests
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <0f6a5b8d5b3164dc58db193fa5c1ae7cd0969872.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0f6a5b8d5b3164dc58db193fa5c1ae7cd0969872.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7c2e7c-355d-4c86-1878-08dbd3be48df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqOClXk9hzRvMSWcxtR3MGyHGLMW44wX6tEemfMkRA5UEVA6+OlgMWSpS4dZREiU2skGQZsMQfa/RhU2USPj1jF23LDBjQsaqPP6coWVMYfyrpE8IncMZRDgu1ZFnYtO0JRyCI6tc5uKxzYMHUASmrJYmP/RmGzNRlbPPhvlHqZI+eLG6qtK88g2H+SQXEErdMmVThXncpMjp4rR+eKSxQb8uqxucccaIaFPMsTsK6qMJuWx4jT81pmFAkp6m4pJ8+8hBuEUbpe7Q9n7AjSu6xFet8rMccXwpar7sSx2uEcTXsiX1Zi/PY+Hh1gf4k/dWg+db9n1+NVOXMTzorqkyHCbcVIdzR2G9i2JK5+sQ0S/iaXDWUT9dnha5nJAEkDr+aNPyy+1tPea+GiyPX8u32+QM2Udd8tSwDSwhpanKQt+/OTKblCGKDpY/mQX3UVbcbMDPtjssowIQTP2gHX6uIUNdDVmlTgluGEh+pQolD9ZxAV/LxNVGXD06k10StlsMT5rBTAMY9qvS1X61FbZaSmldwfma1SWcMJuBICVLYS7Pnt3RzPwWMl+ldIV9s3JhjzFxxZicQsAijjTspkj1KVEjHh6w1B9bGoAqDuQRg1II3qN9yNIykE7ggVgSEy4cQtdSQK7ppYZKQ0jKkAWitch2//yqNJ3Cu/az18gwvIoXkTFPxGMoyUMWeEwvi5S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39850400004)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(8676002)(4744005)(2906002)(5660300002)(86362001)(4326008)(31686004)(31696002)(66946007)(66556008)(66476007)(6916009)(54906003)(316002)(41300700001)(36756003)(6486002)(38100700002)(478600001)(966005)(6512007)(2616005)(26005)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJNWStBTFJLbTdnTWtGcmdFWVJxQVRKRGdOdFNNTmxvQ0RZZEpGeWZ1Z1NF?=
 =?utf-8?B?ckFqT2s3MGFSV1Jmelk0RWNyWXVLdlhTcCt2MzhRY1FmTVdnZWVwbEZVQWVr?=
 =?utf-8?B?SmR5b2wwMEFmNGxQNTNYdlpQM0ptSit1M29PUWJ5aVZZd0dpUDlBTXZxM09K?=
 =?utf-8?B?UjUwOENDRWhjcmRWUEg5TmFzdktaTGZ1b1RVR2NYTjNoZEFWT1ZYWWkxMjNU?=
 =?utf-8?B?RWxYL0tQbzM5ZXZabXpXT3hZMlB0VlFmdnZLdDBTczJRRUhiVlpRcFQ2NUxu?=
 =?utf-8?B?VjNxZytBRGVVS05RRExaVS9tVG1sd3EvUEI1MDB2Zm5FY01CbUVFODA0ZS82?=
 =?utf-8?B?cHhqT0NrY2R6a3FJMUdzMFVPWHRkZ1NUV0libmtZVWF6d0ZpOGQwUHQrZnRa?=
 =?utf-8?B?L05nYVcvZG1jR0JPdFFGSFR6T0dIeHJTWUxKQklrV3p5bUZ0RXhGMlpGL3FE?=
 =?utf-8?B?aHhKSmxEQjg3U3FwZG5ucVo0dUtmOVQ1cHVGTU05ZHRvZ21iS01SVEdwSEF1?=
 =?utf-8?B?V2VPMjhTSnJFb1UrS1YxWnJaUEdhYm8yNnFBVDhBWFZYSTN2QVN2Q1gwT2t5?=
 =?utf-8?B?MmxOalI3OXdraTlrNk9hMDNwcVFRcGVER29OY1p1VFRFU1h4Q2Z4SUxUdlJj?=
 =?utf-8?B?SkVtWTE3ZGVJOU1Bc3JabnBXR1V1TWJUNWZ1bzhRMHdhZ01FclpZWUR6ZUsw?=
 =?utf-8?B?Z29nY0MyL1lTYWhnWndLUWJSTW5BeWRxd1hqU245NnBJVGIwZXE0a0k4MWhj?=
 =?utf-8?B?QnRhazBPU09jQWNFU2g0bDZZbklNblVSaENCbzVQNFpGWVB5MGNJSnVMcjFN?=
 =?utf-8?B?dU9XVmZ4T28vem41N3RKbDJGMGVDTkNjb1k2eHZJLy90V29jYjRuQW8zekJS?=
 =?utf-8?B?QTdJZmFqRVMvcUZWVnJJTmw2dUxDdUpaS3VXcjRzbkZkT1FPTzlBZ041S3VX?=
 =?utf-8?B?SkwzUnF4UWkwTlg1QVdXSW5tZnpSNERPVUJRUDlTRzQ2bzFyMW5UWG9WR1By?=
 =?utf-8?B?eWlMcUZzaDB2L2YzNDl3THJFUjUvODkyNHBkaG5YV2poYnp3b1hpaGhCcWdi?=
 =?utf-8?B?ZnhqZFJ5ck1WMWtqTWxhNkpxVUdzZ0lpamJzc013NnFXMEZpSmY5RDRRTEk5?=
 =?utf-8?B?bW11T1NkbjhabldmZWYvL1IrRGwvbU9tZWFlY2lpbkxMblNRNnI1c08yclc0?=
 =?utf-8?B?U1h6VFN2RU9od0xMNGNBSnZQc0V5aUdtNmtEVzhSQXlOMTRCK1dDdXdQREJ2?=
 =?utf-8?B?R3pWNy9sYWhRZFFPRW1jb0twajhzb0tiNW1seEpGeTFGQjNOR2d5eTFwS3Jw?=
 =?utf-8?B?Uy9mUmpYY0xpYmZGV3N1UjUwcldteThxaFFhdCtjRDZZR3I4ZGM5REE1LzNt?=
 =?utf-8?B?eFhraG5EYVFURFhxRUhQcUVBVFJxamZWcUhrSzJ6RDBwRnA4RGtPeEx2OXdp?=
 =?utf-8?B?RU5qY01MZDVzQUkwTEs5UGg3aVJrd3NhQklnQkFwQkcvNWhadjRSOG95ZmNm?=
 =?utf-8?B?VVVDK0J6dE93MGxUYnMrOTN4VHd0UGorNjBEZVRMaXVFMTVzS0tId01BaUJs?=
 =?utf-8?B?TVBxbTk1dDNpU0lEUVBrU01GZHJLS1NNL3BmVGM4TWZTWUk4cUpBazlvYnRl?=
 =?utf-8?B?WHpRL09NblVXS3QxdWdockMvdy8xTkZPYlRhazY5QTJFSFYranJaMzZwWXJG?=
 =?utf-8?B?OEsyZUx4T1ZRVkd3VmNhN2x6WDYyNFUrdHJ0RWs0UTVHZnN3ZWVUVjB0RkhS?=
 =?utf-8?B?Njg4Tk0wN2M2UDlMQjJOalVVZFNqbUNDZjkyNUlVYWNEcUxmOVJiTlpnNndH?=
 =?utf-8?B?THhwQzBFQkZxSUNtcEdTODl2a2l6NEtSSjUvZlFmeG9JMjJNcEJsSTNQc29I?=
 =?utf-8?B?RG9VaWVIcGVoZmFYb1l2TkcyQS81eEJhU1FKQXBzdnYwRjhEd05vZmRMWXEx?=
 =?utf-8?B?d3FsYzZJWWNjM2o0K1EwOHl0dlcxY1NZa3ZaNWpCZ1BxdFJ0WDlkQkZ5Zzkr?=
 =?utf-8?B?QXBEaTMvbmd1SFV6dHQxSkkrUnU2em9XYVVzMVUxakdhZDdNTDRobDJIM2tq?=
 =?utf-8?B?Zi9ReFBTSktjSytWNjBOSW5xZGtqc0JzZmg0T3kwT1RrY3ZyQzJJVkdpYTUz?=
 =?utf-8?Q?6lX62alPHQDSdmmtSEAIjUMHN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7c2e7c-355d-4c86-1878-08dbd3be48df
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 11:50:42.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5R/MgSNiuBthsoGvKgjRSnmkMYrnQ/7icKJ49slreb+ilwNxRXSrfJDrm3aW9+D0ivCqHctctE9QgGFnu6bz1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9130

On 23.10.2023 13:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When switching to call the shim functions from the normal handlers, the
> compat_grant_table_op() function was omitted, leaving it calling the
> real grant table operations. This leaves a 32-bit shim guest failing to
> set up its real grant table with the parent hypervisor.
> 
> Fixes: e7db635f4428 ("x86/pv-shim: Don't modify the hypercall table")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

A patch with this same effect has been pending for a long time:
https://lists.xen.org/archives/html/xen-devel/2023-03/msg00041.html (v2;
I have a re-based v3 pending locally, awaiting whatever kind of feedback
on v2). The question of whether it was necessary to split out the actual
bug fix was raised yet earlier, in the context of v1 (albeit I'm not
sure whether that was in email or on irc).

Jan

