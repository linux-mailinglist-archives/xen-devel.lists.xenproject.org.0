Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223E266C6E3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478843.742283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSIf-0005cs-JL; Mon, 16 Jan 2023 16:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478843.742283; Mon, 16 Jan 2023 16:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSIf-0005aI-GZ; Mon, 16 Jan 2023 16:25:33 +0000
Received: by outflank-mailman (input) for mailman id 478843;
 Mon, 16 Jan 2023 16:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHSId-0005aA-6j
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:25:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2049.outbound.protection.outlook.com [40.107.15.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6326ad9a-95ba-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 17:25:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7620.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 16:25:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:25:26 +0000
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
X-Inumbo-ID: 6326ad9a-95ba-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeDosKGe9BX3RvhJHus1qnfpxRPGOwg++iFhSbwQCmajS1aSXZUXIjvH6YHAdYNXK/WJzus1PU4UcsgN1lt+jAsUxWbeapeaHt9B9XOG/ZJvAuVk50riAQvC69FtTq+DXj4Ho2q6hH14KW0J2FAMJOuxjUwaGg7bJiGD9EKiGp9HlK9/7cdOIIGhBKvUhEw4eOZBuuyN/aNOX1VC9cYT5Oe1rtoS03fxUlI3xJTCE4Glw2LNUv1ppBZeaP3+heosMNQFMEJUC62P6N567iaerv5NG3eswPsTI6bRJeXNRSwMq1fT2PnLbDnpUubdI225WSg2MMr76ke5H7q4SeyCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Jwkd5Sz23cMk59TPJm0atTzxjDdl3j8u+68EG19txQ=;
 b=Us0Z/ZBDaUQarOXRQ6j2OVn7UteaZqkUQuuckTavVDocHQhsezbR28p3n45cGTcUtcnvHXexK1cKWuiVwsFn2svpY+cHfFVBkkTxUhWK2cj2IWOaqi+pgeZ21qah0ai2FOcEpcs8uwP1TArtvJZbd2do6cKNaqFHoqBpL/nuDUOZCzXa+MVdLfwWcddNW2GxUuWlRNo0+kcNxaTWR8DKrtFMDZCwsSGWo9YHeC4/ZAKU3Ucpxc4FTVQOcJnjsBqqq/pFZEgTvwC/NP01x8Ed2XoXWXryi/dsJhGjCy4lJMKRcFjGeYyOo+qxfta/ZyNF4TykOJlb45JwgfexbDE4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Jwkd5Sz23cMk59TPJm0atTzxjDdl3j8u+68EG19txQ=;
 b=gGRrgkxtKryOWIh4VFILgSABia3suZxkgEhQJ1UUr80FpBHosAOuL4s1n/56mAoIsa8wlQwEzVKlyOKT/AxAXg7Lv7M/CaOusq7ZDbP8cIvmIGkSxiWUb0vWAICxNyMNteTfHZ/61FZ+UJyrkc57/4c6vEHc/556Em9bfBJRqfOsKas7VYF+hDqFACiJMh0evckWennC1F4GeFbNPGdfUuK3pyO7v/dVooy0Lh1Aa9MFk8kt/dnC2BJOcRUlpKeq5H9vSSNbdEZKSJnKsE04wEDoXEgQrNe7q7IfToeXYcFuhTv7BQqawhPG8rYV7Gnc0lKr/vqXtHOMiJrpghWWHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <230bc200-e163-52ee-6689-76bf82b526a4@suse.com>
Date: Mon, 16 Jan 2023 17:25:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/5] xen/version: Misc style fixes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113230835.29356-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 688f353b-ac87-4e4c-8a93-08daf7de4638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6J7eG5sOeKSgZgcOiBaohdI/x3lZPiYS59C9YLK+sN7i8ijCm/tSjKX4RzaOeSzZ0C72y/h0HYqtAUGBSd2iG/Nv43biADHDdJ2zgV1/yzd35oogfMJnI/YpBFxGOTSc1l8k+/zc3CxhThBnSSnwOqlJwmzjdqwITMdDP++zYEA1iddqSdHntJblExsue/9A3CXyHzbf6cLSF+gE75LGfau3/CigGcVQl6kmAPKrLoMqmgkbBf95cwu4BV2v6yiMRKcFC5MHwSNkUDqyJJbINe8PRFDooLM6coKn3fJjQAVnH6Q6Vns1c8K8lSqErqVeWjthBGzVSZPQJsLb1FXCEfj3/GP59o4ezgARfP+oQuwzqrdk3Gr7Os0q3yTbohx4QHUA7ecygnOFSlJPR/nwt0jLsBrRCmTAwTrzlk5XdQf9UDKHqaxGSeU+5QB0VK/dvnmUkhxSOgix7pr8qZft7rUcuNNkMoPMkXp+BLWDY0XdQktKRqz84RS7UYHMLIhrs1iMAd2Psm1jPdCkvMg4uQIgTMs5D/Gi4+1N+8GvUP+yw8LXCHsFEkvH3BV5QwU7mweds7xOSXIOodhG4cbEWhfnsN6epYSxdDiqy+dklvDoDUwPkHDt4ZLIKCz2VlVi2EAnGx3rZiR+QbDH4lyexii0uvaeiBkY3bH9IA83pzt7uRw4fNFGnQL24MyBi2GPQh26uLmd1U2b0Vwx00ASGG5TN4g2WtkyUs3NAJj8mEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(2906002)(5660300002)(4326008)(66556008)(6506007)(6512007)(53546011)(41300700001)(26005)(186003)(66476007)(66946007)(8936002)(6916009)(8676002)(478600001)(36756003)(38100700002)(54906003)(2616005)(316002)(6486002)(558084003)(31686004)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzA3QWZlVjRIODlMa25SNnhWUjdKbGZjYWEvVUZvcXh1RitvbTZmWmQ0Qkgx?=
 =?utf-8?B?VWhZUlZBUGFFZlBLRWJYbEFzRTgxMThQbjkyUnRHUmhDNlB2R2lwdkFBS0J3?=
 =?utf-8?B?eHIvajM3NURtejlrMkNNZ05sQlJBOGtISDg5TUdyVjA4bFdoNGViMWlxaGNT?=
 =?utf-8?B?VThpYkYwa2JYUGZIOE1oNDRUOEFvdUNZWkJmd3lMRmZTb0ZGSElyUVFTcTVk?=
 =?utf-8?B?amlKM0VSWXFTVWFPaU1ESVZ3OCtXU2gxeFhWaGsyR1ZUeHhiSyt4N0tYZnBi?=
 =?utf-8?B?SWMrdUdZYnBXRjlzNzZaOXJ5SGFnY3pQVCtIblZyQW5PdnRVS3RXU2VJR0Fk?=
 =?utf-8?B?allvMk5vOVdrc0t2cTAzRUV4KzJtNkZwVHBTK25vbWlJcnRvWWlGcG9KSm0v?=
 =?utf-8?B?WThLWENaalZvbmY1SE02aWVRT0YybWhhUUNxbXpmMFIvZFE5enJwT0NvRFVs?=
 =?utf-8?B?SG8zL2UwWGFvNFVTTTFJUUsrOXA1QVFjMUlDSW5wRHdlb29UTUlmQ1JtOVlz?=
 =?utf-8?B?M0F5cVpLcEtjRlR4TE0xdG03d05YdlhuemJiQ2lET09zNmg4NFhzZnNBTXNY?=
 =?utf-8?B?SWE2MEo0U0pTSlFaT0llYU5rVFBva3A0NURRV21SWHp3d1FWRFoyOGxrSWFr?=
 =?utf-8?B?Vk1QOGdOTG82WG8zNkpVTUl4QzZPVE1iZFNFMllpbXZpb0hVTWFaUjREeHJL?=
 =?utf-8?B?VFoxbGp6RlhmOXI0SlRLZk11TGh0Q3dueDlTdGpyQXdXUkp0dUNONjFJRDdQ?=
 =?utf-8?B?dTVpMmo2T015bEpsZDJpM0JXYUtKU3JUVi9RZUpqV1hEWVRsNzR2Nmw2UzIx?=
 =?utf-8?B?Sis1alViR2NFNis2WklFdHFQUUpXTVc0Rnd3emFtcWNVc3pYV2lLVlJwRkk4?=
 =?utf-8?B?VVpJYm9PTktiWmZka1o1NE5WZHNCMFNjYzBnTUZxMjZCc2dRckcxNk94akhu?=
 =?utf-8?B?K1QzcXlpNFkxbFdwS3JmYVRNeGdQZ2h6djJJSXNjUTVMWHhvMk5MT1R6NWY1?=
 =?utf-8?B?b25VenQyeE5mNEdDak12dUI1QmtuUk52cnVyM1czNURGMURyajhqODBZbVQ0?=
 =?utf-8?B?WGZYcTZSY3JMTGJuTW5kUlRFSWRuZUNwdU9tamJqd3lWRCtlZml4OFRZV1NN?=
 =?utf-8?B?cnJrbW1DR0lXbDY3Z0FOQkhwOSsvMERpQWgxU0VITkNya2R5UktIY0pWQ2ww?=
 =?utf-8?B?ancrdmdQcXVVVFUzM3pSWEZ4SHQ1R1ZmbDZiOWxvN0dHZ2NhV094S3EwVjAz?=
 =?utf-8?B?U2JNblo2VlN0bngyOTNjcDFrWkM1bDVxeHpKMGZuakVmb1hXcDhocjZOa3cx?=
 =?utf-8?B?QVBvZHRHQjZFWVo2dUVieVNmSUVxUmVjMU5VRHIxamRFZExvUGtsZ1FDSjZO?=
 =?utf-8?B?NEZxWGlnT05pdjNyL3NpUWlzcGcyZVRuSTdZK1pUSElwRXNZUXduWnBxcFYz?=
 =?utf-8?B?TmJkS2IrQi9PdDAxS0ZHSUU2UnpCcGd2eGMyNzZ2aEhiZnJhUFBtdVAzWm5X?=
 =?utf-8?B?ZitIS2FJNnMxeVN3SW96SUc4MUJBbW1iRmNlY2hUcmVxaUxwZkkybmtUVjJP?=
 =?utf-8?B?MklWMDF5SklTRGY3ajNFL0t5VlBxMUx1RUJUTmlrTFFYUGxuendOSjdVK3Bh?=
 =?utf-8?B?TTQwbzNhZE9pbk9jU2drNktHNm5GZ1RQQlpsSXkxd1Z6KzZqS0dPUWJENWNw?=
 =?utf-8?B?V2V2Lzk2UzhHNkFwVEg1MVhHMDFBN1A1clNkeVlvOG9qZ3RtcStVZEVKR053?=
 =?utf-8?B?YndTWGdJSGpyVWtUVndFak03QVRNN2pzelpFTWp5d2pGak82K3dGc29xMVlx?=
 =?utf-8?B?dXFOMjNxdkJxNFhMbDRkb3ZHNEhrd0Q1bWJ2akRMaUNUVVNKRGNlT1FNVlJX?=
 =?utf-8?B?Wk9zNyszSEt2ZlRqaXdIY2VEVDFxOXJpT0hkRG1HVmlsaU9xV1N3eWNGT2xs?=
 =?utf-8?B?S3BJRHd5dk9ETlhTeUJkUkxsbFJmZ1JnMStHSXdLYmtPQWIwR3VzcDdTNWhI?=
 =?utf-8?B?OTFGQ0VDTUFUeU5iM05DTzUrMi91QzR4TTNoNVBGUkMyZDJwVjJZL1g0OS93?=
 =?utf-8?B?MnN1OXFlajFoV3lRY0RPYXhOZmJEM2UrbjR5b2o3dkdWVlE5RXB4bHlnRW9Q?=
 =?utf-8?Q?s5GS1P3IcLIyNjB679lF03r8Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688f353b-ac87-4e4c-8a93-08daf7de4638
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:25:26.1288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cToHhCgr1xTfF01oDVYWhj/Yrbe48k8tjtCrbo19f6TCLNd7ylSlXUT4q1ed3q5UFskNLkiJfEX7dwhPsGbBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7620

On 14.01.2023 00:08, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



