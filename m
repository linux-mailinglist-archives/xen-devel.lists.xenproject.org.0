Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F75578D3C5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592747.925565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG6F-0003r4-Q2; Wed, 30 Aug 2023 07:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592747.925565; Wed, 30 Aug 2023 07:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG6F-0003oI-MK; Wed, 30 Aug 2023 07:58:51 +0000
Received: by outflank-mailman (input) for mailman id 592747;
 Wed, 30 Aug 2023 07:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbG6D-0003o8-M1
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:58:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ced251a-470b-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 09:58:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6860.eurprd04.prod.outlook.com (2603:10a6:10:112::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Wed, 30 Aug
 2023 07:58:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:58:46 +0000
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
X-Inumbo-ID: 0ced251a-470b-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXrKeQptRyxVTQBizZkh+1GNaN196Y9tVTRhezpEaVnMH9Vix9xhCBAF9+qTB3FfEapE+3hoy1A29Wu4cWShGMylw6a8L0VcNahmAaRhbQ58Rq2EDySFmaGDDYq3OmlWvMFruqtuMnV1X550q29B3FUrbaukIi81nd5m0zuEX1DK0nWiccsrWrVMgEJ3AkuFCiPz3sJMSV4evw55a1Cic73+/yljJGUNKBglYKstcnqh8aXI57ALJ6W4+3ikDsipUEmQhU51+Z0hVwDMyrPDqGyJRe7zxj8yZBqlxVMPtbmnqsTigsY/oRArmPgdWpYA/ajU0GCgkj6KDcei7qdp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdVnVck2WIIzqoZQ9M2KyGXt7qyFPYimJtu6qZk8mGI=;
 b=bt8H1UA1aegL6yjqkXPiEwP3KjFxjwOPJc4Fq0v6rSOmAaq8VVR4yHbDZQguCn3WSiEFDDJP++kv0z1B+o7Pw2CQDy0tcPAw6kw/dwG/1c1DFaiuRprbWSOMT/kSea+7nUlHhwxo3d2uKzXRsfniylLtKa3qJQ7ktUK8B07zT0BWZdVUoWtTyxLpye4wFGplgbFpJufKwkgN1klMEdjCh80hTxqNWs+yyDNLZFilmq0ljehJj4A1FPfkvQNdBFcgIo8KM0Ihii0t8ZCgSBXJaCQAY4YYN5VfyABMlGPdwBVJPar4VZ1C6R3nOGhw3kjV+cDNhboq8BOAobFyzJtc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdVnVck2WIIzqoZQ9M2KyGXt7qyFPYimJtu6qZk8mGI=;
 b=5zPRDq3/JSS9mEJ+9x7DpMBguDo8qYAusRDYjRj7cBf7CQD6x/DMkGYCO8KWiS7FtLA4MGjl7a5aa3RZDGmQ5mjoyIIvFJs3clDEJxzRaJXFF3Jm6+z006hYBrLjSRJmV91xD11x519XYSWKvHLj5DCAo88RnbatAaCt2sGpNE4vIPCZyzMrrRYVTpXxFhkSj1V8fblUWpNHWigWylAOCvRu56yOmVcxHBrayrQ42WsmbbU13Ny1ukza+y2L/FgbkH31D6upqSPa9slvr7f8x/ySf4AKeQqgBGs8XjHLtKF4y9sDlG7iO0vMDe2Fo6vEvVTAUVaGRcraaTE+HfHnug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15551c77-95fa-7c7d-6b6b-d5c42a38caac@suse.com>
Date: Wed, 30 Aug 2023 09:58:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
 "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230830005950.305085-1-sstabellini@kernel.org>
 <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d043641-605e-4f5f-1186-08dba92ef04d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DgOrGvpGiaiJ7/r2hybrZFKe1BDUWyJrkEJe1o5zdTige5/a5Y40beXKbLe175CR1tcutzIR/W4LR5sFinj9Ze/YUkOn7tfZ4+5aAsuw5fN7LXV8ZdEPKn3SbSBP1Gjzh3DDkYsreE5voojDlS8czm7azYBKAcfkMCps52d4VsuT9M+d9mM7gddN1X6qlbzVEYcp5/Nbz6cxNoo0IwYfuTVXSr8sVzBRc0hDfRBz78Ivgfkcd6gUmfloEA1n5+YrNruAGgfyDhj0CL9ZijUpptUiWSxaDebfh3b4qkMKOwiuJVy9AdI+r3lOWRZYkdtN3JHG78Aqo/e1F4mveFRec8B0erv/hsl+7m/6zC6x5BQfNW9r5pP0zrI6TUrF93AjECr0fjccmfvAr71V4v128MWIxdWCbXSxndKlt3WHpvVWl/baaAiSbSawpb0YauN6Q+0ZUtDMotf9oYcSUtaw1QAZWqkB2Z+y8EwYlhDCdFnmyxnqS5hkNbJ+vPREGkOn6OOEs1a/Cma54mZ37CkZoiX0RbhkZO+P+lOTMJKQdDV9UCpZMmFliLaWIn10XgUHmNf+T2XKAhhhZjjFrKLsCw5AHZTcrmM9mxsfJBGfz4SNaHDj8qtQIkS7T8qpLiRAVo64+75sInXyPUxgMQzMyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(186009)(1800799009)(451199024)(4744005)(2906002)(5660300002)(38100700002)(8676002)(7416002)(36756003)(86362001)(8936002)(31696002)(26005)(4326008)(31686004)(6486002)(6506007)(2616005)(478600001)(6512007)(110136005)(53546011)(66556008)(66476007)(41300700001)(66946007)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tnl5cmdiRXh5NEtsMVUrQTVvMUsrYkx1SHl1b0xSMlZvUEUvdFBpRXJkMXl2?=
 =?utf-8?B?ejFqWjhHWkNhSGxseHVmdjl3ZktMeGtSdjJxNFNRdnoxT3dwV0FpZjZuOWxN?=
 =?utf-8?B?VGVOMHcxREJwdkQ4RW1Cb3QrelNIM09NazFwV3Zvb0NsU1JYdzhyY2xyTWxV?=
 =?utf-8?B?clBrcEpKdkJ4ZmpyQ3VyclhrREcyNUt5THBVUmd3YmxKR1VTdTgweTdaWHQx?=
 =?utf-8?B?VlZ6bHQ5VklXU0pYVlVSdzdueVRDVXYvNUhERFdwa1UrZ3ZzbDlIS01qZC9L?=
 =?utf-8?B?Q081M1hydG9hS0hHNjllc3k0eGxhZGFvcHg0bmExMlIxK3FXTjE2b1JXaklI?=
 =?utf-8?B?eTV5bzFKNXZ5L2cyL2lZSUp0dTNxdGVkcWZGUUFzMDZFQ1J0K2RtM1FOcEhR?=
 =?utf-8?B?K0hVMElOZU1reitVa2I2VzBPWWRKNTdua3RyUkFTMnBJenRpcER3clM3TWpK?=
 =?utf-8?B?Nmtoc2F6VTRGRTRjWGQ2amp6VGI0YmxpVnZ6TjQzZlFiN2c5cU9HbDdZWngr?=
 =?utf-8?B?dkRTSkRaTWl1UVI4T3dQQ3ZZTUUvVDZUZzlUVnVKYW1nS1pjci9NdmpnNHNL?=
 =?utf-8?B?M2FiNU03bXB3SmtPRWNzQ2pPK3FxTHFuaHdBTkw1TllQUXNkTDVZVE1tSWV5?=
 =?utf-8?B?WGUxQzlFOHpBS3dteHAySUV4Z0dHazZHRlBsQ2RoNk5WbWExTGNKMkVoKytT?=
 =?utf-8?B?VGR2S1B6ZkNTZzhkdC9PNzNVTVFxR05Ta0s5RlZkaXQwdTNpN1dSTkw3eDEw?=
 =?utf-8?B?NHp6bkRIRmk3b1JKSmNmVk83c2N5Y1ZIWmMyazBmem82cm1aR0FNY2ZMdVdm?=
 =?utf-8?B?cW5lQzZBbHhVelJ4eXJiNDlvYTF6aVNVcG1CR3IwZEttN1Nxd0F5NHU5eGlG?=
 =?utf-8?B?L2tKdklqbHJKL20yKzVXR00vTEhhUE1uOHNzN3ZpTjhXZWxkMVRkek91Nmtv?=
 =?utf-8?B?MVlrUkFudmxLQU9ndGo3OVlXd2loZjlJTTVLc3NpZ05GSTdCWk4rdnNVWlor?=
 =?utf-8?B?MysvVE9VOWg1ZkUxaU9WK1hiR2RhbkU1bFVXMHNGTDNpMWZhTnlxY1NyalUv?=
 =?utf-8?B?Uld6Y3pJZTJIQWFRamhmeFhtOTA0RFViMk96VW9tblRZR2NLb0lUV3VYdEU5?=
 =?utf-8?B?R00vMzAvZ244L1VtODVtRkcxbWFJUTQrMkgrRG1sd2Z6YTFkTWpGZlZjbWh0?=
 =?utf-8?B?YkQrbzlqalRmU0p2K0V0UlZSOXJVellCbVZSQlFNRThQQWR0ZlNTWWZJQStU?=
 =?utf-8?B?dzl0VUVvMlhyTE5POWpsakJDNndubGQ2V05DUlJJUHJweWh3SE5iODk2Rmwy?=
 =?utf-8?B?VVVSc29aYVFXUStxakRaWEF1L2xPUHVRQTZqRVIydzNsSExkZGwwK1NlL0tM?=
 =?utf-8?B?ZTlGbmFiUVc0a0xkQWJ4WnB0SzhtSnRtY0gvL3dLblp0ay9uRDJxbHZGUUxB?=
 =?utf-8?B?NzNjSWVLMDlrdVlsajJZcjh3V3RZc2pxV0Q3Z0V5SW9pOUFaRVJkZWtmNW1y?=
 =?utf-8?B?bjZzT3FOM1F4b1Y3MEZaODJBYTRpRWZBZmF1WlFCSXIvbXJRa1ZzdVMzdXRa?=
 =?utf-8?B?RjJPdGljS0x6Y1g1NkZuT2R0SHJRMGkwU3BKa0NjcWdnSGY5QW1YeERydWdW?=
 =?utf-8?B?ckw3RENPVEpSWkY3SWQxQzlyU3NrTVFhajZGaWtYN0F2NDdMM3Q4ZDk0Lysr?=
 =?utf-8?B?bG9RZ1ExRXJRSnpId3plNXZGZTRuRE90eTFGbTdzQTRLTGdjZHp5aDRpMndv?=
 =?utf-8?B?R29vYU9hZEdTQ0ZnWXFDeHpJL095Uy9acmpXbysxaE9obkFzSUMrejNJZWxY?=
 =?utf-8?B?bU9xdnlxRXpJMjhvOHNjWnUwZHlsTHF4dU5mZzFBclRxelJBdWpHQnZrMCtB?=
 =?utf-8?B?cVQzOXY0UjFmblhROHI4aTNZOCtueXc1bExLY1RNUDRZaWF0N2tZNVl1T2pl?=
 =?utf-8?B?ZEUxaXQvenhraGdmNGhuMGdJMTJMR1hzaU5wVU1vNTJQb0ZTK285RU5QUHVq?=
 =?utf-8?B?cERZMzlqdExSenkwb1B4RTN6MzRyU3pTUDl6VzIxSE50SUNMVk9sTWhaaFF4?=
 =?utf-8?B?MUpFcWlKL1VseVptMVVTQlFwV3JnOTU3UWFJcFZEYkdPSUJ1dTdVQW1UNldy?=
 =?utf-8?Q?ZDaMiGJM0DVv4tNOyv3iKgszq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d043641-605e-4f5f-1186-08dba92ef04d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:58:46.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMlrvKafdtjF1bS/XQelOl0RJ9pG/CmWTVcxida6LLAZcznIXJNbxnim8lrx+i7TO/D2efAQjrtgF6RLSHSoSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6860

On 30.08.2023 09:54, Bertrand Marquis wrote:
>> On 30 Aug 2023, at 02:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
>> +     - Required
>> +     - The controlling expression of an if statement and the controlling
>> +       expression of an iteration-statement shall have essentially
>> +       Boolean type
>> +     - Implicit conversions of integers, pointers, and chars to boolean
>> +       are allowed
> 
> I am a bit wondering here what is remaining after this deviation.

Hmm, good point - floating point (and alike) types, which we don't use anyway.

Jan


