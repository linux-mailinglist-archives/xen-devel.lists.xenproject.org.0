Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6C72DA9F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547838.855458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yJK-0000gE-V2; Tue, 13 Jun 2023 07:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547838.855458; Tue, 13 Jun 2023 07:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yJK-0000f9-SD; Tue, 13 Jun 2023 07:19:26 +0000
Received: by outflank-mailman (input) for mailman id 547838;
 Tue, 13 Jun 2023 07:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8yJI-0000Yt-OM
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:19:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e208f88-09ba-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 09:19:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 07:19:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:19:21 +0000
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
X-Inumbo-ID: 9e208f88-09ba-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl4AzljfPS4oOwzAEbZhKttMD7zHTU9D8VrplbJDvUVjsxe/pU6s37XSTTonXc1MZr5Yex9Il1CeWjYWKFfaq580nFZDbLknOJQjLWjlWUBAjExNeG2EIB0AR8NYYe7NCToC7hPp+yD4a2qaLfaRA03G2+dDR/71XlhwGhoMElOmRjtu+bGDjmAVdlnAFoFzbXX6Ng+3PqlBLK/POf8xbBEO3dgAZnKUJsEmebK4vIiVypXdobAXZvb1Li1eYW45/U3zT/sAmnKqCfiGc89JWeWcD2zuQVOIxaqBK+CmBSWgKicyG2CoVJGjnb37jB4bskvBgPcIQWBAf7IoAnjlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUDooqjYHTVu4kCN5wcFl08JucBkTtWbVL6aZIIkCqw=;
 b=Lr1GQ5C378vRAzTtcusEdG/lSTWd57+XpUGKMOxW7nQHdVmUQpiRqQZBDFaHdldK/6htU+ua9v0bhlWc8QeKeYyNVIFdLVMXsi4zepsPKQAtl98gUSAqH3C2nmAaiiA75r5sM0olATPR6KVBhdl+NdgA/W+pduGYAn9BA27/HROYPDqGzlB6nVuvk/4zOQNzoj9Wv/rmHuEppSfVSKo8LUkFwmu24o5t4+rgYjUoASitUtbpLFth6iAgknc7dpZG2+n+1JQz99cikJ6+IveOPvssdd0e0D2sgSQw6mnk3s5vzGv9vK0IRsov02uAqJO9rysSAzhmyrYD9woQM1ibOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUDooqjYHTVu4kCN5wcFl08JucBkTtWbVL6aZIIkCqw=;
 b=Z4GTrIwp/T2YASlFxqNBXHcCmwutDTXu3PWRUE7ZbYJ1FkIkSijAUxAfHvvk+tuYf6R1+HP2+htNgnUfld13r3n0usFuDoTdNnyU0ktA4frr86aRXJaoNpsIhUpt1I4BlkZNqBUgUVNtgEtfjvJdSfWUPmHfKmrdJdZf36KxtE5JaOW42RR4DIZZOF6baWcaoWnq2TQ7/91kbbFawE2nj3G+RPyYVpZ1x1fg9st/1gjFpYumblY1q72DqG4BmlSl8A+h00ILeZ9FQfIiKPj4mjcB5OfNRCx5yWwNtvWEUp8TV6eR+oe9HKtxPuQKKtWsE2wsVjpjMRiFOzSNLDn0ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75970c54-1109-e534-a375-082c5c188cb0@suse.com>
Date: Tue, 13 Jun 2023 09:19:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/4] x86/spec-ctrl: Use a taint for CET without
 MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230612161306.2739572-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 454de083-8d6d-4f74-8f42-08db6bde81eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IB8jfba9ltr373xs74gMQMl6p4hk3JSzPk0iA7onVbyM5B6YKzu09ZzVPYkuNBfQTuhYWdkvlovBfX2Fy5qdAdJuJso1xgCKC73CfkglIIjxMxbtr01Wii4wIOh9CCQvjnJXXWSGW249EsYvY1ewvZHJgbTP9IJxoUZOKBke605IQuruu+mRdWC6wxYwNn14cpsj7mlSiBrkTAN+1xaq6JfuN56n4fDaNKexpDcOvUfKj89EKQVnT0h5JSmb2Lg7zMKRoJdBwEwEdJwQRcnrGMl7uZhCGKcC57v8rLFJX7JN3DVpfryX0Xf6sLfcYrVC8nr9M90R/UdXLRmhgWVi72/iFl9VSpu3pk+6HEMcxWtq5E3qhpLEgMhE1uIqctsVY2jpNM30sxbI8nzKhdfy2p4xtjvqWgsoSPcaoDIpf3/ysz4XaCy7QNGzqx+GZXxYSGz6cdE/RHpzZQzjXxJjGH2bFXcK/kFVA5jak3zDq7cMT0BAEP3iasLnO6x9w97TuvqaxdQgUgUN7RpAz62QQ7z2NBANbaQvprGvbGsg8d8ZKIHAOipboSvp6GVewmclKixOMaT60VZErS9BKcXW7QOLJGYUXo9sR4zFy/N7EjXxu58wnQAITJ/4VveU1DQBlQaSjka1Ir+yD1vavbgOBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(31686004)(54906003)(6916009)(66946007)(4326008)(66476007)(66556008)(36756003)(186003)(478600001)(2616005)(2906002)(8676002)(316002)(41300700001)(31696002)(86362001)(6486002)(6506007)(558084003)(53546011)(8936002)(5660300002)(26005)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STVMMkpkME94d3Z1Tk8rNjdYUlFkblV3Zk5CdVMyeHl0WXd1aG5CakViTWhq?=
 =?utf-8?B?OTdrRzVGcVkvUzRWNGFFcW9Wd3BkUUZFdDNNMStOVUxMUzBqREJwUVdKUVll?=
 =?utf-8?B?TWVQMTk0dEN1Ujl1ZVdkdE9GZUUxMXk2djNhTk9uWUFjMFg0MEhjV2xhdmpt?=
 =?utf-8?B?cnZFeTFLOWJmbjZIdCt0dnFkbm1iVjBRR3hwNWdzOVF4ankyc3UrSHZ4SE4x?=
 =?utf-8?B?dDN1bnk0Vm5JWWNsRTVuTzVsZC92Z0tHcmNybjZrUUxOeElIV0M5NTZ5Q2Nj?=
 =?utf-8?B?NUZBY2E5alRJYXV5QzFFV05QRlU2U1RzaHdoTHFVcWJOMVk0VmxobVpKZkp5?=
 =?utf-8?B?U1hEbkgxNzFncUhHa3p0N0trb1RPZ2lwMEZKdEJDS21aaVF4OXVlRHhaT3Uy?=
 =?utf-8?B?anBPdVZNQ1hzZUQzeHkvRVkxTnlITzZYamN5S040MjMzWGtFR0huVkNUMzBu?=
 =?utf-8?B?c2E5ZVZQOWFVbGlxb3Y1elJBd1pNRzVVR3RLU0ZtU0tUOXVpSHFlNnJTSUs1?=
 =?utf-8?B?SFB5SWhQZERrOEcwQW5wK2RJeUM1dVBvS202SUx3L2pnbkZGREJMYW4yekZn?=
 =?utf-8?B?eWNGc0RiKzZ5c0Z0c1MyQkszSDkveFJjZzNtMzlScE5mYnVpZS9ZaHM5UStr?=
 =?utf-8?B?NlUwSmdNSjBoYnFPc09jSmhmUEV5dkJoTUg5R1VTNFowVjFXUjBUTk93RlFt?=
 =?utf-8?B?WGRPRlc5RGt0bjNBUUlOZ0JNOFlsLytCaHEvTm04UUZUUHE1Qno2dUxtK0dZ?=
 =?utf-8?B?NUVSRkNoOVFVRlVhL29lM0tOTXpZU2kydnp0M1NWWm9RNGxCVmxTd2pXRitF?=
 =?utf-8?B?NEJLNG5IYnlxM0MzRHlSb0dXNElEdC81K21IVE9WTFlvTFZUNzE5RnlEb0Jv?=
 =?utf-8?B?KzR1K1lpZEVRUzhYNm1TbXEzWXFGY1Z1UGdLRlJMc214YjNLcUt3WS83WmFK?=
 =?utf-8?B?dEtFRDloNWh4Mk1qRUN2QTB2b3FsUmdtVkVPc1Q2WnErNU1Td3J0Ykovd01O?=
 =?utf-8?B?TDBodXQvdDFrVFZROFZ1QW4yUlRRTmVNNTMxc1gyanpjSG1FWlkzRFRsd2sz?=
 =?utf-8?B?cHI5MGN0V2Q5NEVDTjlMdWU3Zkh0bnB3RDBXNkF5YmNoQzQvcGo0Y1duM2p2?=
 =?utf-8?B?RnhkWUVHcmJrRC95UE9aSWdLNEJUN3pYTzNPUmxkbXYvSmlEYTI1RjRMbnpo?=
 =?utf-8?B?VUlZNHNwdTF1OC9jaDZMZG9CRXo3c1czZ2Z3Si9MMnlNUDlvRis2RVZQVkgy?=
 =?utf-8?B?YkpZdnB2ZENXcGxSdWdyUzVqeTh1Y045TlpiUFJYYWtjdGZEMU8vajloUVdL?=
 =?utf-8?B?NXBvSXY5VGN5MTdGMmtPamRUdHdWVHBZWUZFK2JlV0dXb0RPb0tma2ZJa3Ro?=
 =?utf-8?B?MHRyVVJacndLbFcxS2lUNmdVZFdNOHNObVhWR2dFTjJ4TDJoM3JDZEZMZmx0?=
 =?utf-8?B?dTdqTGhwZG9yZk93czhOZjNwSGQ1UWlnS3ZDK3pZLy9ReGRkc3RWclptbzJq?=
 =?utf-8?B?VEpsblJiTnpUakgrUEVhM3UrNnNhMUk5dHJiaDVxMmtOUU5KNkNnYTZBbXpV?=
 =?utf-8?B?VUpMNGcyeHRrMXdlemRYQld0bll1RkdFbkhudXVjd1B1OWNWSVNrQjFQZXQ1?=
 =?utf-8?B?OFZrMkVRY0svNm5rT2NFUitkUHVRVnJXRFRSNERCZFVzZVV2S2ZxSEFqYmdq?=
 =?utf-8?B?aVBpdnk2RlNxdFRnMllsZXc2YWYyVTM1bGR2WlAzbmRJdmoyeWJOK0lZR0VU?=
 =?utf-8?B?bDJscHIzNlRXMWV2SFo2OHNjWDlGRFNPbWw3MmFWeVNXZHE0NiswUXZycFcw?=
 =?utf-8?B?dkRGL3lQaEltYzdJTTRlQU1FM09CUHpSeUV2ayszOGdsdVVmUWNWVDhtd2cz?=
 =?utf-8?B?ZlQyaExZQURrOGgvRWkzTG50UGNIcTdlNTVDSW8xK0xZTmFVM1FXUVBWT1g2?=
 =?utf-8?B?aU82bzlzQXZraks3ZlFkOVBkUU96bDI2VFdqcDhPSmQxRzd4SmNSUUNXcVMx?=
 =?utf-8?B?bkJyUkJaNUlHalArSUhSd2tueW5xNm01MTlEWDdmblQyUm5kaDRqZWhPZUEy?=
 =?utf-8?B?Wld0bFNpYkpmZDVVWStERUlHL0hZV1paWlhPTExiaU14WjgwOFYweDNJTk9D?=
 =?utf-8?Q?w6UoRF0EBX8JTlJ9CQORcZ4mJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454de083-8d6d-4f74-8f42-08db6bde81eb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:19:21.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHLYoJ/0BIGjbq95HoKciFkXXFVhhhnnDG5P9/Xt+XAqSErmnhb/1s6qENCm3w1FYW1z5v2XxB3WE4vmmhBgpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064

On 12.06.2023 18:13, Andrew Cooper wrote:
> Reword the comment for 'S' to include an incompatbile set of features on the
> same core.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



