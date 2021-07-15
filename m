Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A43CA15E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 17:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156683.289138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43B1-0003hF-AI; Thu, 15 Jul 2021 15:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156683.289138; Thu, 15 Jul 2021 15:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m43B1-0003f2-74; Thu, 15 Jul 2021 15:21:27 +0000
Received: by outflank-mailman (input) for mailman id 156683;
 Thu, 15 Jul 2021 15:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m43B0-0003ew-9c
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:21:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 512c692a-e580-11eb-88f6-12813bfff9fa;
 Thu, 15 Jul 2021 15:21:25 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-c0MyQnX1NxyzVT5ulDJGnw-1; Thu, 15 Jul 2021 17:21:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 15:21:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 15:21:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0020.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 15:21:20 +0000
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
X-Inumbo-ID: 512c692a-e580-11eb-88f6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626362484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJT1eh5cGVaWI4X0SnHBZXFDDu1culqNLOKoK/WU1RA=;
	b=dFi4MfzV2B14172xJzMsAigl9D4yjtFscS3H6D9oDHgx1mSUUiuxIyKnj0noFFjBPzh8M7
	rZY5xPmDPTYsiONFCeDMHQVRaDZFExTlNVNWvL2eVlQwkYbpBoC6Q1okNGyixYbmhWdvaK
	XQHC+vVNlNHBRiMVX+IanxePxEBKFc0=
X-MC-Unique: c0MyQnX1NxyzVT5ulDJGnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxfb/vkbKwA79hmmbu+sCvtIT4C1I/VTXwlOXv9DbVD/ylFEIh423R8tmCMDNzdGHgBTdu75scS4MKr5VJM9qjRmQjWk4bLtLUPhwkydCbW/+xNQIjZhxTscwHHVtouKlEXNpr0hksUun8CHlbrzvNymy27BkEvATMZqW7R3tULBKRpSlX1g1gfA7YBfY/qYAowYvFbG9RFvGntxpACvgIuBz8WfkjxswJF4ftMmFAUK6qHnON+89pHEK/4Sw809iR1hU7mZPU5uI15N7jxNpJyQsMGpJheWPorU99cLDsJysFx9yN6HCV9UqlfOa2P30e5bjHf3wwFs3vIjl92S7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJT1eh5cGVaWI4X0SnHBZXFDDu1culqNLOKoK/WU1RA=;
 b=dl/qcMMG8YCr+r8U9q3LC6B97DHthBYv08hD3uGB7PAavPvYk3HwImyiGsSddFs+weuKbuuiTOXwlxAyRufdLgGEMLip4UoN/yB0mnkqCndQl0o0ONCmuCLuU8huUQLQhiPkQLotLxEQ+8CwTcHIdtK8loPVkY8yRP2T2/nlFoo1N6yD2kQxjQyK8mTXFSrfRMuRoUEMbnqacD1iL/sDsHgV6csu+aQ8hZjzdNnl4UUhRTuc20bXUloB5zl6lDMJTs9Jn23q51+Ev7XDK5aF+brdLRNDwfgoZbtpr7QMZEY/Pj4rRytFZwulXHXLmGM/Q8SoRyVEyoGpQEFQGkTc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/4] x86/debug: move debugger_trap_entry into
 debugger.c not inlined
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
 <a7af5b3fd6d297b2659433060d6f1e2fc6bfdb86.1626286772.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6644a187-8460-8e38-2c67-b5309a9c7ad3@suse.com>
Date: Thu, 15 Jul 2021 17:21:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a7af5b3fd6d297b2659433060d6f1e2fc6bfdb86.1626286772.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0020.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af1ee4c-a355-4019-82c2-08d947a43359
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48487F58A8523106CC6C61E2B3129@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:287;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0tPy11jv8EJJNAlRtB0RbeK/AR7REHD+j1asyyhqjJ9daJ9VC5JHMqNwEqrbE+GAAxOTsB2nRBxOU+tv3UfHh4rnb87fcn8OLXUR+D4NmHzr7RB5ieoC3fyTtbuFMbgL7zHLhe2SWfl1l+RIvCMltos6LfOa2GRTohPv2Acz+Tz4tYg1RiQx2QmcT9msd0AclNQJQQPzRW6xKjdmkkbkv7zTgFubaaOZklXCHjxjIU/RtN5YbrekdLdZdCqgYnJRnNxsR9bGmgoJ6Q7JzUqP7q1PI3cEcAPvAQOZ3RX7VNUuLNxBcKgFbL87mzgFN6lXM48uazTPjOVU3jc5x4ExV/nev0Z8pLcFTkielD7icjMdUB0UVBEpYE3R7GNQEJlCh+KC1hQKitqoVuq6H7HEcDbEK1o9kt546/02x2SMOimr+xOdd/wSJXzjl2WClFlt43TSS1aN0b6yClngALUAMMS0bwbas/6xD3O4MRhMv17gglcRpzdHD2GxVLeTufVWjJA/oADvMRbT3xSXypOnmbQF+Kjsts9bgn5zovnn6XgCPr0KiSfQV78u6qLc2ly8lX3vH6+ZndSY0lV2SV0Nxr5A1sCQNUCqAwd2Bp9qiHiUEBTe7gZvphPM411EtQTJrP83b0Xca3NB1HLxkvY0wDBZAXcaJ3OHO4Xd9yAgSyrlHYCtVpGrr9zNhNb3Y9CmLVuCXVuXvxialXjUgcikKjyIn/+qG/Jx65HU7jS2v0QIlzMLyC3H0RKCkTp+Y7ud
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(346002)(366004)(39860400002)(5660300002)(8676002)(8936002)(16576012)(66946007)(38100700002)(54906003)(7416002)(66476007)(66556008)(26005)(956004)(4326008)(4744005)(86362001)(6486002)(6916009)(36756003)(186003)(316002)(2906002)(2616005)(478600001)(53546011)(31686004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YSs2UXFqZjJvMHh5ZkpwSGJId1dkUitCK0RSM3ppQTFzWkJhQVJOSDFyaGU2?=
 =?utf-8?B?eGpsR2d1WEwyU3IvZmlJT09hRWhtcGZ3eDE1N2tTM3A2VURlNWkxWjdkVWVi?=
 =?utf-8?B?ejdnVW9OaW43bDhvM0htZTJmQm53MFRrVDdyZzBxNmZKWVZWbS93dUFMUXVW?=
 =?utf-8?B?WC80NDdHYmdobjRJZVk1TnBmcnc4QWYrVURHQXUrOUk5UFNRTkZZb0xkMVdy?=
 =?utf-8?B?RWFxOGVIdUU3YjZURzFObUppdnpvYjY5TU81d0pZRlREcEpVbnhHMVJHOXJJ?=
 =?utf-8?B?R3JSNlNCazBBdHJOUmJpME1vVytKTnVjQ2trWlFncGVweUg3OE5FbEZoeml2?=
 =?utf-8?B?Y2xHWnZ2b1kyTm1lVGlRUSs2MkVNY2dhdXo1ZTRWSkFGdjNXNHRkWUxQM0RN?=
 =?utf-8?B?V0lQc1ZjSWRuaXY0aUdHVkJjRHB2Wk1pd0Q2anUvOW1ocWg2bkNQRFJxcnY1?=
 =?utf-8?B?OCs3TzZ2aUhBdWtZbHpsSGZ6cmxicWh3bXhVY1k5Uitmb05jRWt5T3pLb1pj?=
 =?utf-8?B?TGxBdjBWTHkyWlhIbFg0dWZ6ellYL0ljV2NqYittMlloZUM0OFowOTQ3MDhH?=
 =?utf-8?B?UVBBOUc0Lzl3dzc5M2JKa0lacVZMaUVBNEkyWHVUemhMOFc4eDFwY0tIRC93?=
 =?utf-8?B?YXpvbW9uV3R0VWc0R0lDMHBxR1JiN0pjcENiN0hCRm9TQnNRTW9wVzJaK3Bk?=
 =?utf-8?B?LzQ4REgwazJtUGJVQk1ObHZhdWtUZFQ4SkFLMFN1U2ZjSFl4Rldha0UyMGxo?=
 =?utf-8?B?Mm0zN1FpV0hFK2p0NFBqcWtKOWk5NlN0bjBaZVQrdUQzRnJmanJnekxxV2dq?=
 =?utf-8?B?SmdKMnk2TjBDakhxNmRxZWdNVExId3RIOXZvMEcxV1JJalMrM1MyeHdobkdC?=
 =?utf-8?B?bHBTMDJOTWd3K0Q1eVFyUW5abDAwcHBRMGxuU0NOM2crcHY4MDJzVit1MGNt?=
 =?utf-8?B?U0hMNjY1UkpOOE9kdHN6cThETTdqa1VySnBONm16V25XZXdjbzh2TGNmS2Jv?=
 =?utf-8?B?R0tPSW5yZDlBdkFmVEVQdEsyVlJnVGZrT0g3ZHhJVnNYTEF0RUhWdGJ2YnFG?=
 =?utf-8?B?VmZCQ0VXeVRDWTV0NWgyVUlkZG5VNXhVTjhXVGFzQlM5L0Npa2pDMVc2NGhl?=
 =?utf-8?B?UklXSkd2NWViTnkvZE8vWVZ2eU9senhmbFJibHFBTVNzWWFxVUh3QjlOaXgw?=
 =?utf-8?B?MWJqdytWM3BvK25kQnN5RVcrYzk4Q0hYbkNIMU44dERQVDEwQWpMTWVaOFZJ?=
 =?utf-8?B?dEpWUTE0SDVIWHQ5STIyaG5FYUlXaVdPaDh3VnhUMlBYMGluY1BtZElFRUxM?=
 =?utf-8?B?TGRIQ3NWUC9BWjNpTndsUEhYZUFYc0ZTd3Y3MG02dGFacG5EMFRwRTFkcHJD?=
 =?utf-8?B?QTI1Rk8xSUN5MWI2UnVEL3NiWnRucno2SFBqWmZmdXJocjNLejZZdmtxaFF1?=
 =?utf-8?B?a3N2MExoTFRIRVZnOEp4Qm5ORC9NN0RzYjNqRms5MS92aUVycHA3UUxtSzEx?=
 =?utf-8?B?ZnB1U0FjTWFCNEU5US82RUN5ZGJGbk43WUdGbVZjS0ZKUFBtN1pjb211c0RS?=
 =?utf-8?B?dCtrM09DdzhUY0EvQ3lJZ2x1REkyVWFKZmpjdHJFR3ZuTGtPUUNFSUxhajk2?=
 =?utf-8?B?eVN5NHludDhRNnRTQXloS3A2cE9vOUEwWHhnTGhCWmpDWVF1NUkzN2ludUVh?=
 =?utf-8?B?UVRLV2YrTDBoSStuVnc0Q1lpVExMMk5KNjUyaGJDZmJxM3Q4cVVNTWxOR1ZC?=
 =?utf-8?Q?t0T522/vmSgOyY0Geps4NpEhKBrQCOd6Ysq7Kax?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af1ee4c-a355-4019-82c2-08d947a43359
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 15:21:21.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubWtblLgMwH/pIag6Y+qp36FAUTDDig4IytuWy3E8IdxZ4Dy9aO+4+zC99ILZ6Ff9vYTy+Nx8GSL4mRFjxSqfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 14.07.2021 22:37, Bobby Eshleman wrote:
> The function debugger_trap_entry() is somewhat large for an inlined
> function.  This commit moves debugger_trap_entry() into debugger.c and
> makes it not inlined.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


