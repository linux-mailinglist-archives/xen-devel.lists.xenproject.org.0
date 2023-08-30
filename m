Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3A78D604
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592903.925744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKr8-0007f9-U1; Wed, 30 Aug 2023 13:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592903.925744; Wed, 30 Aug 2023 13:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKr8-0007cW-R8; Wed, 30 Aug 2023 13:03:34 +0000
Received: by outflank-mailman (input) for mailman id 592903;
 Wed, 30 Aug 2023 13:03:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbKr7-0007cO-Ih
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:03:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f4157a3-4735-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:03:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8594.eurprd04.prod.outlook.com (2603:10a6:20b:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 13:03:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 13:03:03 +0000
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
X-Inumbo-ID: 9f4157a3-4735-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMgAXPfx3hMO50QKo1ZqkBhfNsL6cOdnyePj1bfBgTVlzu5Yt69WolshNjY/dWe0epqTmlFMIzMn4azja+lUn/rcG2NPP/aUziA07pW5dejwQsK3RpK6NyhZXsXszFi4D04zZwPc50eoUJnH15mJd+/BipWpAKkReemo5y+2+IEI7iv5MfY4Rb31JWdOVHMi8PBm9DqEu5HWkX3gsxSSbEMdKbipfnRTPGnILZKnERVc/enXES2jFaZ8W3iTKTvCWF4LbEPjmZlLm7dqADQD3ewPN+WvU7MtzSmt1Zmkg8gRRKklZ4H0rGBcZc96tsUdM0u4ksQjQPYc8AmeOpUeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m0KKUnt/oHt7Iiu9m8cQE3TJkkDW5g1n1YRO4iHWdw=;
 b=iqu7PEsV8j4omimQ6BoVtUn/nhS/U6ITtSoh/VgykbkODNiV/MVk5a/gMUnxD2JZ9yJwRgvBxGMe8Fw3FdoGlUsj355IXbfu/r4Ipufw1vokGqIoWPm+ChIcNbw5Bf6HrZCs4K9D4rw3AepGY05tNYVhbyK1I2/Unla0RBgBEPZkXA2VCuzhkqPrkRTt6fDNB4nxj4P1jWlOk0auR9UVUGGZ+9hCiMpFwQO/z0GcgZyQdXFDQDFQXfKQDD01SleEtggd4Gm5frWO75SvZgKiB0iKTRFvpKVRkgKftTp/a8MgaSvg/wzu8vCfpg364tQsj1a/O+7hMKQyuPjEMf+Jsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m0KKUnt/oHt7Iiu9m8cQE3TJkkDW5g1n1YRO4iHWdw=;
 b=g/NAjvyHL0MR+//6Zrrh03kqLKAeTjztHjayAqb1LSXC7h87Kw3J6siQdPVYsCAcrEf7y91b7pCLqpvPXEDKjk/UR0oGOMQ6WRIda0mD0g6yMeiv6po3DRi+zotgyaPpTvwSAGda3AMJXhWxafYZxKkw8fHhdpcHk9jKJqFLRswFcqZvub/xE3zMHJT1wblk8DHnTyVCD5H2H/wl0AoS6rELVYCgw2SVzK6uQ4qTmwC894Vt4zTK8mkiaH0RpssETqqpaD+JEvs6+nVh/Lqk7wVPeNbe+1yFpcwzFknX2TdCquzZRlu9+v8Xk5ZMCvFjH92GqmXLx1URiDWBgrfQIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <599f1b4c-501d-6b02-e35a-6cba8b459376@suse.com>
Date: Wed, 30 Aug 2023 15:03:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 6/8] xen/ppc: Define bug frames table in linker script
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <f81914771ec96a48adf25c55329aa5f739f174d0.1692816595.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f81914771ec96a48adf25c55329aa5f739f174d0.1692816595.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: b7618432-ec6f-478b-01c6-08dba9597210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1FRiU+jzARGuntjga8hbBEXU+pHvf15ovDjQNb2rQRdlS8fo1DjCxQwJYPHtOqGQpOaB1R24VzeJglod31Ux6MIA4m0xtUogLdny9sskCc9tUZQKK33DWIwn9FZ+NOYtP69C4eHVZo26x0T1QSbxaLGqy0RfbhLaEcK8H2vUSSEe/N8UjtvFPI60FaIeQZIPeN1sNWsdnVGGwHzg+cHGaZFt0nvirxtaTfcizyQvTGhLND9mw/u/etK6jngKxnbWX2qDMDRLwprdC2fL8COZGJddjVBiD4YRLnZ7S94BHuPSUEni59QqvPfIGw8BXrML9Q/oi1Oc40olU0mawztc9nVdutaewsRQOEWeCDPXEfsfkw+saVBQ7ZN4x5ameHL5lxBr7/auwEMGb+Uuyzakh3Fk39bilHP0VgTYH3q4hFIGoqT266osZARLPIXJTYI+lIbWTYyumwaWmzXoUoUmCIA8U1EDfkzek9ZFjpzrKSVJ4EJQ7XXOm/3YdRmWlexd8FKeqCRdyzjEKzTnwTTdydVNX23XtluPXbwAt9BuFO529rqx6ByJZ+nSjFKi+M256IPFbZ3k3xAKpaYStBFO+KfHcKXxCJGkxd19oK6OtvNeCWqPPyXenl6nBmWuNzjU1bePxanJsTxfT/625zXoYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(66946007)(31686004)(478600001)(53546011)(6506007)(66556008)(66476007)(6486002)(316002)(38100700002)(41300700001)(6512007)(5660300002)(8676002)(26005)(36756003)(31696002)(2906002)(83380400001)(2616005)(6916009)(86362001)(4744005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHk3ajZvWE81eWxFc29DajRZaGpXUjkxWCt0ZGk2bHNObnN5cU9nS2RqV0JV?=
 =?utf-8?B?VmpkOVVndVZtZllXelJnamczQ2FvU3FHYjNOTVRyZk1naDBRNXpnSzVOdnBz?=
 =?utf-8?B?bExKWGwxOVJBcU1vSXI1VWpIaXlyT3NnUzVEVGR4VXRXa00yek5EdzE4aEVU?=
 =?utf-8?B?dkZIY01keitVQklIU0FCMjRuVEI2b2ViZEpnU0gvOHBtVzlLd3h0YVA1V1FI?=
 =?utf-8?B?QzZya1VRZ2hZOURWKzJiRGg0bERlelV3MyszZ0hYN1pnWEJDaTZzYmIvWm5Z?=
 =?utf-8?B?WGtscGNSakNLeC9QdXpacDZoT0xIckVReThaY0hWVVd5LzlLWDNXbFg1K3Mz?=
 =?utf-8?B?V00yTFg0WUJyZGxJVTFSVnVoUkFGNWRmVXl2N1RrRGhzQW1tamhRbVdDREMr?=
 =?utf-8?B?dGtIS09ndzdhbHpEMlloYVhObnRwckVCNDdJRTJhaFRtakpLRExwcGZJWmJJ?=
 =?utf-8?B?bnVqYUxSeW0xeUtWTlBRQ3QvWHB3eG5oUmUxdS9rVXc4YTRvM0xrYU9rOVMv?=
 =?utf-8?B?KzBrZjdNTUVIWllXT0xsa1dMUDRUa1FrdlExUFRuK0lqd0tDbU5qWUhzTWw2?=
 =?utf-8?B?SUNRWTh4bTBmUXIraFhSQUszTis5OVlhRXlhdVJwUUYyVVBDWnRVNFFUREda?=
 =?utf-8?B?RDdHd051WHd4blIyR3ZUVzJxR0ROeWVUR2dlY0hJcXQwOWdLUGVXZE5sdk1w?=
 =?utf-8?B?SkcyakNOWmtCQ3h0clRxZ0dMYjg3Wmx3ano2M0g3cnVxVXg0N0JVYWpHWGRP?=
 =?utf-8?B?aTdCRmtUbnRSVG1KdG5pQTZIK1ZSZExQd1g0OGdQbHRtQlA0ZzB3V3pDbXBN?=
 =?utf-8?B?TmNtWjRjMXlWNUMrdDE0TnBXUnBTeCtpLzJOeVRuU0xQeDErZDl6QWt4Qjl5?=
 =?utf-8?B?MGwwTnlKT2IwNFN5eDVXa05Ea1AyalBMQUJTaFRIZHQ3V0xxSU1JdXlBUHFv?=
 =?utf-8?B?Z0l2cTZMelFSbktSMHJQT0hvdjl5U2djSEVvUG5qTzVpZm5ScllkQ041MkFr?=
 =?utf-8?B?OXc2ZmlxOUJ5YUEyT09aN1hJMnhDNWNMZ3ZHRmhqeWxzbEw2TXlEeUt3NzZv?=
 =?utf-8?B?bDRnYWRiUkIvbXYrWHZIeDN1S0NPUmhmakozUzBLamVLRzRJU2M2eFNyVG84?=
 =?utf-8?B?dzgxdnk4SEVuS2lyeDZVVEdLUENodlJ6MDRPenIwL3ZKb0t6ZEZvU2ZoNjVL?=
 =?utf-8?B?bXdxdDFCSVFWY1JncnJNclFvWWlabW94UWFpaUtVNTRvNS81ZmxXZ0phVitT?=
 =?utf-8?B?R204S0V1M3l5alE0YmxOajVremI1ampHY2RwemNFQnF4MGlEVy9ILzVpV1R3?=
 =?utf-8?B?MzBWZ25RbkpBMFhOT3lkMVFVM3dNM2ZUWFdmNVE2OWQ5V1BsdUN0ZmNRWXdz?=
 =?utf-8?B?dDEyOWRaWTlpQi9wdEl0N1ZOUG43M2ZBdFJQQ0cyMldSVlM1aW53eWVvQVFq?=
 =?utf-8?B?a0R3T2VQVnEvaWttN1QzQ1ZWZ0JNblJhd0VjejRuajhPMmhJWWFGRHA2MVND?=
 =?utf-8?B?K3NPZUEzNlhJMVJ6dXRJWXhhSXpMUE9OOWlFOFFaTUpyajZTWHJranA2MElI?=
 =?utf-8?B?NXhUWDRFbmhLTnBXR3QwdVZjdHhRY0E0SksxUXFRNVp0NmVxMzBRUC9KQThO?=
 =?utf-8?B?UlF1MUVONERaSDllVDJFMDBTVW94alo4NWVWRHgwaWFhQyt3aUhGWlZCWXZT?=
 =?utf-8?B?OEhhdHoxSGJoU0RQL1M4b3JTRStZV2NuZXVwNENrR213VExRT0FsR2dFTXJT?=
 =?utf-8?B?YmtJSERUclVmYXR3K2lSb01OazhqamFqWXBFd1NUeW4xSTJpVGdPS0hLSSt5?=
 =?utf-8?B?aUlraXRqUjJFVDVjTEJaYkRLV1JGeCtEZjlOQTM2QndhMlhEUVJpY2ZiZFl4?=
 =?utf-8?B?MThqMnM3WVI4ajFhSVZmRGZ3Qm9MOGVSN2ZRRG9hVktVeGZwWVEvTnNXZUov?=
 =?utf-8?B?UTA2Nk5Oem9KcldYR2NHSkowUmtBZU1xYlNRYlg5Z2NFTitwcFFQd3VIZUhE?=
 =?utf-8?B?bWdSU1lJVTNKL0ZVU016ZTg3WGQxSE03Qkc2Mk5LZnhzNjVzRVNlWUtHRnFJ?=
 =?utf-8?B?a1VWamQ3NHl4Y2txWm9DN09rSFpDOVpjWGZDelN5UVlYdlNPS3c4b3pGbVlr?=
 =?utf-8?Q?zREfk8QEY1m9vPYid32ytkBec?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7618432-ec6f-478b-01c6-08dba9597210
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:03:03.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tC23pV39Jo5+mG4Mr4DLFEKPhuAq1Mt1/bcS4hgH/InYjQiYghhbDHKlsXT4odnIdvPpLryDCv8WvW95b56Kow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8594

On 23.08.2023 22:07, Shawn Anastasio wrote:
> Define the bug frames table in ppc's linker script as is done by other
> architectures.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

If I'm not mistaken this change is independent of the earlier patches,
and hence could go in right away. Please confirm.

Jan

