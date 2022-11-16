Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B2D62B417
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 08:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444186.699106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovD2q-0002De-Ir; Wed, 16 Nov 2022 07:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444186.699106; Wed, 16 Nov 2022 07:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovD2q-0002B0-FL; Wed, 16 Nov 2022 07:41:16 +0000
Received: by outflank-mailman (input) for mailman id 444186;
 Wed, 16 Nov 2022 07:41:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovD2o-0002Au-Bd
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 07:41:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aab2408-6582-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 08:41:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7148.eurprd04.prod.outlook.com (2603:10a6:10:12d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 16 Nov
 2022 07:41:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 07:41:08 +0000
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
X-Inumbo-ID: 0aab2408-6582-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBUyS26uiOmPdR6NoHjGu6/Wtx9mh+9rLUEH3jf1PNZ/f3CIsVXMNVGRfSOnyMrrpTTwU3hTVFE/X3AODzL9XbkMsjWcJAHVlO6ZGP4wIEFE/JYZHS7v/gjYuATvz2iWT9S1RQyyDRb9/eMzC/cqc/OK89v7RokHO2YKbhDXjMPMmE8BIs0ahEPGcy4+WT3doSYFxkrvum6K4xgoLKs4/B0+l+bsP/fhA4i8YYZMl4JA35mayfMLgmwosEIC6NTGJCdlWlnz0D/nonG6UcM57T2GfDlR+KAHC4gkr+U0fPqf1aTo/MHO+3XLk1RRsxVrhYL2CzJoYViZ0y/RN2CZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRH2bjytmN4B/NCNdiqn+zEgoQ38Kq4POE9O7rRLD+c=;
 b=Wh04Qj+uMx0k2um1h64eb2LSRRRP4FE1mMHhu80+vlOyATawXF1wUYCdtwodtNUeWrCnglcYHc3DNgaljPURma/urh4859h5hNDHYZj9UTkrgSXxpCw3IgHIzwibQo5dHBK8BllIohNQOR44uuiggA0ZSYFpW2sOxJEU6kKiSTJVbVKjsdWI7M5ICSvMN8YaZ2kbFrjC6YDwolAdmKJoMV8Qif89T9lcjammhpIyGtNBXlCuT0Fop5eFSNQu/C/PKvkDxj4GMZA+se37Okhogn5KGC+TvqGfvQG+NkZzk5cuVoW99II5iHybdlzStfSE8lbuHFaAAPN9mTldLVw7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRH2bjytmN4B/NCNdiqn+zEgoQ38Kq4POE9O7rRLD+c=;
 b=5JD+r5yfBwOJiiGqt5yq2Hm2fAzYL6HLzDHaG7SgCmj1Czs3NjnXO+C80miWJqB9a0hyzLhfTlOtN8zMpcmeAcO3n9/5GLICqdI2GQouujQYV7XTxGTqIyVoOIDZuauuXsgO8dZq9m6VDUe5F3zTn4znAZKLLRQPtsK1YOZIpfV0rMRVH4sC55OuABiYofTVzT74s6xKUedNGAcBfK2Dklbr2TC9Qcu6KXWK4678f0xYvY6i9oXXfq1LvXj8p54/esf1jFvkfnlU0NleZQi5IaSUtfxrjgIjuHcccM66Wurq7KTrfhgqrznfsrio4xmwWD9s33LD6QMLm217bgS/ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a43058ad-98eb-f558-3b21-65054e163c22@suse.com>
Date: Wed, 16 Nov 2022 08:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <20221115132657.97864-3-roger.pau@citrix.com>
 <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
 <5caf3930-ea8f-6e68-326f-93cca1fa210a@suse.com>
 <51e9dd3f-59fb-a112-baf7-f96c07800ee1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <51e9dd3f-59fb-a112-baf7-f96c07800ee1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0046.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: d90ef8a4-459c-4f73-fca2-08dac7a5ecdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S85Dfrjc6LOVijjigeGLWDOb7fSK9AkhLAXF13+3JP/6/v4sdwXG+gt10uz3cm3T3xF784qC3zFmMI5ixLGCx7dfjt4OjNbRn+iDqhzCRqCxMyEAlH7ZhhZrIbusE+MPZhV7b1DWHrwZbgx4NM/ufjvmspxo5NFeWjHdEUEGBAPMfqKq4CRlce2qQEC8IRHA5m50VE5gtdW8aHo29eG0ALq/2dw0us0SYQ/Zsm2WcYypHBmpwm0gkGO4pcRe9F1MCGNzDodgXile22d0DTUlODWrlfeRBKmZSsgbcVoBRbUeFd6e5uD3sxuEuCUJgXVc6adqn7ldmFhGmiUa9ArxwOceU00Z9lFqwngXGsf3uEoU2Qp7zHMPIZMg3QkbNGb61UeL6vfRo+ZL9b8yTFWAHwBSmnO61KjOiZU+RKKwGOICOyUX2kNvULww8Z4Ou5gsmfrpdvn64aDkyLZuThIjY2cISDhonRJFiGIPWrw7fZ30ICIDZ9sW1VuH0ADXXzdaaGbNpj1p1uLHD+crdnFfU7BA7x4kRhKvUw1HSA6OCgybcdt4bM+eIdyM6qwfaels1lSRWkCHppCkI7WbIIaMCD4FYNIWXsyGrhuFlLpSWEmKiFxmrdT6yC34xBTMH4GvjuFSI+ME5w58WEnaZKwszrHmMlaCWmCaVf1rQu0ynXLvUl1Da0t9j23QRnCwwGZfeda2t5kuicEzZwX0l+KmOJSsK7zpZxmMf44ke6FoMUgb0RKduWT/rTchzBlHmUL0RYNQaXtDccbtnMDZoXHE75lkQbkuy5aJYk29COu2nsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(53546011)(6506007)(26005)(4744005)(31696002)(36756003)(6486002)(2906002)(86362001)(478600001)(186003)(6512007)(2616005)(38100700002)(66899015)(54906003)(41300700001)(316002)(4326008)(31686004)(6916009)(8676002)(66556008)(66946007)(66476007)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2xQRjZ0S2dTekpWKzg1dXZlSG1oZlpqSkZTTnFDc29ua081N29PU2Y3Sys0?=
 =?utf-8?B?ZTJSM3lJMXNoNUh3OFhVTTRFVVB4MXJqTWI2elRvU0hYQ3d6amgwMWU4NDRP?=
 =?utf-8?B?V2c5amVQTlJkTU5rTkVyL1FFZ2NvQWV3amdPK01yMVVPcVp0TVBMYmdOYm5Q?=
 =?utf-8?B?S21ENkR1ZkJBUXQ1d3lDc3dHb2p1dkd5VkgvelI5aUxTQkQ5M1BmYTZNOG94?=
 =?utf-8?B?RDg4cnl6N0RtNEVtY0FYM201bTdZMnUwamNNUzZRUHNLOVFUcStnTnBDb2kr?=
 =?utf-8?B?VXhLcnp6KzlxcGJuSE1JYkFWL3lETnRYU294YUxCcVhVbWZkalNsdTlXWE42?=
 =?utf-8?B?NXcraVFPZ2lyR0pqSGROS2dSWDRTLzY3dUdHTVQ2YThOZTNOQXQvT3cvQUZY?=
 =?utf-8?B?bGt2YUZreUFpZFBxcnpqcjJERStpZGhHM3VpVkF4WTVhRzJtWEtSZitWV3Vy?=
 =?utf-8?B?eHZUSTE5S0Q3RlhpZTdXNGFwQ3VRa3c5UWxtMjZYSEd2eHFxc0ZDd0sxbUt6?=
 =?utf-8?B?OFhETnlJU004MW1yRGp4TWJiVnJ1SXo3anNZYzM0eWxqbG45ZG8rK2YzUEsv?=
 =?utf-8?B?dVI1aDBKZjZkbkVBVk0rVlVqVjdMR05TYjBISWQydzlpeGc5SXkvbWdqZUFD?=
 =?utf-8?B?SlZCbUFjUW1COXJvREw0dWlPMjRVb2M4dUd2T1hxNU9tWHdvc2RpNlpiRzB2?=
 =?utf-8?B?TExodFEvQm1rNkJXb0VYcXovbGo3T3ZvTHhDSEc1cnl1QnNhS1AvVlg3QmJK?=
 =?utf-8?B?Zm4zaHVoTnpuYnpuRjRMYkFKbjlISEtDR2Z0bDk0MjJnZ25jTWs3a0YyZU1D?=
 =?utf-8?B?bUF4Y1dqbitWbDh0VkNzTjhHU1dxVmpIYmNkbllLajh1QkdBQXdoVStQM01u?=
 =?utf-8?B?MXAzOW55S2tCcFVseGpwYldjOFdadm8xVlVzRTFJTlMwWllTU2d6Nnl6d3Jv?=
 =?utf-8?B?bEhlRTdaUmZiZVphRHUzN0hEWk0rZVlrZko2bFkzYWJJcEYvTG1uYlZYdTZ0?=
 =?utf-8?B?M3ZOTTlQL1RSMWt0VXpVRzYyT0NxbXRYS1BYYTRnQ0V3OEc3TG5QclN2MW5j?=
 =?utf-8?B?d1F6RkVSU01mWXpjampZZXB4S2VNbzZBUjBoUUY0Y2g4dEYwMHQrbkxuOHVP?=
 =?utf-8?B?YUU1ZUtxaXppeWR2YTZyVHBMWGZHNFdQRG1vYUJ5ZGZHWHA4d0ZUNmttOUlD?=
 =?utf-8?B?d2d2VDIrQXNjNHBkZ0dsNC9JRHJhRE11dCtEYmhXa1hQdS95S1ppWGJQbXZ2?=
 =?utf-8?B?RjVRN2x5Q0Y0RzhJZ3NreVkrUDU0LzZNRUY2R3NoUlhjUm4zM2ZRdVp2L1k2?=
 =?utf-8?B?N0IrRnhnRk84by9CdnpRSENBVmNlMk15VFpWSk1seUZpWm1kcDZubFhQNFFB?=
 =?utf-8?B?NllXZWc1ck5BZ2NURXg3eWhYWjhOMWVMSk43NGJEZjB2am9SU0VrYlgrcDFp?=
 =?utf-8?B?bndsVS9FWDdubGt6OVZ5cjR2RGtQdGYxNjhqelFoamtLOWcxSDhyUHJydlIx?=
 =?utf-8?B?QmJud2s1UCsyNG42NkZGcm12a0MxRlE3YnNsbDhZbVdja2lPcUN3OWJDUmJD?=
 =?utf-8?B?bVl6REY0UWlkNWRpOCtrNTkwSEthYjc3V1lxellNSFBXZWpIaFlSVXdwTGo1?=
 =?utf-8?B?Y0ZPdklqM2ljUlVWTTBMNlprclFCUjRYWUQxcGZYWHM3N2EyUkZpbjFZSWlw?=
 =?utf-8?B?TnZrM1I2MFd0SE8yU0ZQSjJ5dUJleEZ6S01jbHFVWlRseUtCd0dlekQ1MURM?=
 =?utf-8?B?Z2pjRnMvTDJWR0Mvc0tEZUU3aUpmVU41SnJnbHRUdmliRXJPTklzODd3QnF1?=
 =?utf-8?B?K1ZlZEtXckp2NWFiTWZHK3RYREdGbTJMWTE0aVc3ekFybTVtYndEVmRNa1Zl?=
 =?utf-8?B?ZVdOYXBvY2lkdHNIc2VHdVBnbW1PSDZmTWRhY09zSzcyM2RBOXJraVZnWFFJ?=
 =?utf-8?B?VVpIaXlML1l1dGgveXNjcU5ndUh2OW8wT1N4VHVFUnlKb2UzM240TlcvTU96?=
 =?utf-8?B?bVpSbGNydHpsM0N6YTQ5LzZWdkNZRG4rMGw5b2xVc25xSG1qc1hTWVRMMDVt?=
 =?utf-8?B?d1FtbUFWcnZpR3lHbHU0bjhaM1RrVTFjbzRIbkFqTzBOeFZYNFhrY1Q1UWF5?=
 =?utf-8?Q?evKIwFEb6UoZ831ERanUhjBir?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90ef8a4-459c-4f73-fca2-08dac7a5ecdc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 07:41:08.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0FixmsEAlzTIDMEiXmObvdsOLL5Q0IQLBpTmZaKyGRvAdc4V9H9St9NKS4t/AsLCX27FGlFBjJRMU7aT96/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7148

On 16.11.2022 00:54, Andrew Cooper wrote:
> On 15/11/2022 16:44, Jan Beulich wrote:
>> I think we need to settle on at least halfway firm rules on when to use
>> synthetic feature bits and when to use plain global booleans. Without
>> that the tastes of the three of us are going to collide again every once
>> in a while.
> 
> Its very easy.  All other things being equal, synthetic features are the
> most efficient option.

See Roger's better wording of "why use a more complicated construct when
a simple one will do". Yes, generated code may be better in certain cases,
but no, we don't always judge by that aspect alone. Source simplicity is
an important criteria, which at other times I recall you also weighing
higher than the performance of resulting code (especially when dealing
with performance aspects when they don't really matter at most/all use
sites of whichever construct).

Jan


