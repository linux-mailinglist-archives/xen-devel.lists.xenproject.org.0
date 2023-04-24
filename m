Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB646ED10D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525477.816700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxr6-00025f-QG; Mon, 24 Apr 2023 15:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525477.816700; Mon, 24 Apr 2023 15:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxr6-00023T-NU; Mon, 24 Apr 2023 15:11:52 +0000
Received: by outflank-mailman (input) for mailman id 525477;
 Mon, 24 Apr 2023 15:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqxr5-00023N-1r
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:11:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56402a16-e2b2-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:11:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8937.eurprd04.prod.outlook.com (2603:10a6:20b:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:11:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:11:46 +0000
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
X-Inumbo-ID: 56402a16-e2b2-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYyJ1MTGJhGgCpmEYKhIJKjEi7BQ8+BKcMqYWocszGQRbDFH6IxN4UTVqqakrwhHzw5eSdp79o4gW40PoM0JWI4C+XAHB7tOSHZNNVPqpeZnQtNJQy+HmxuL7MszNiwTvBXgl0F/FVJ+7N36/2CD7GMhM/KBtsQQnhaIth2RIXSpMtsoAT40DBNVQGu52/Wq/Muh0Skht4n6432Ww17UCwbfaj3Rw9cQJ7MlObazmFfahNztyQ15PzsiQenIHlYJoF6Br6oCsP0Avbw+fvqJTV8C/3ZzNkvMWIQwbmYr/4uoHFO8HFoJW0MEaOHuQFyV1Oq8F2J42Pj7D4af/zslYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D4CWq3/ocWJ3zYqlZtaj3TsyERB+doYS6MmyRBvfdE=;
 b=LGWzAtTm268f4GMLJUCpQuajYz0lYggmOrur+xdkKc0izBig+c6cQlFz6WEiCc0wgdVLSQ/tcYtb+Vn9j7Db1ljIyI9bBhL2N2BfZb5pn1sGbEAhhaCh+D9QHY1Kh0HD2RJjWiIFJvlOY1gyMtTmPa2WHXFmlCr5uv1YRMAtnxBFuJkM7T3NQxrc/dkLnXFq+SytD447UxXrMNm7VmmwPlvUNdauk1+f5+mpmo+knspbdvhJssvscXbQOMnG1PoMDRPPjsSsFNJYs2WtuToevsNzH/KKb133uJIhFvqXf7CDpu47oiVke/kZO88q+4ISvRG36pnrzNyR870AIo2yYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D4CWq3/ocWJ3zYqlZtaj3TsyERB+doYS6MmyRBvfdE=;
 b=OkCTtMHgGvkIi3N7nDyX/8pTKcYYhBNk2Zyr8wKG0xZvI8eeNzhyAOTXbLqhW3+rlLOlukzPDOKx0/481ZRhF28e81HKIYmzI7ecfsgJ1Q/nUbV6dRx/4KyQT+JMIOxDdLtPqy57EQZN48BLfpVAuK4WM4vClWhToz1bWNJzwvtR+liiETTsZt2f0LyEhJ57dLZWoYTY27UlFfjC8IZDKPCTu8SWTy5isf6RFSGqL81gBnWO/ifBp7tj6Co+nyO0et7rscOzPEUtfKGJi11k2BPP+D1PdxKXAa1jH3gH+NYCMAXiRTOLgSOjMYqJx5A9u8ry3gq0fHFj7v9qF2AYuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5495cdc-cfda-6aa2-4d6c-c226dc2b1ccb@suse.com>
Date: Mon, 24 Apr 2023 17:11:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/3] hvm: add hvm_funcs hooks for msr intercept
 handling
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: d26560cf-01b1-4966-090f-08db44d63898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DjSX4UObh7c4qnwEwsLsKk0LIswj1kdf4xcM2aEKU0eqqJqc09nVDKcu9uvHFWjFJblpPSjdRzBt8fcz10hBGfbTMLgx8QSI+K1t8NJmzhiwHQnytLO6iYzMmEllKMx+AhACalTpU0KR7sRXx6D0qVJZCZ1QU18ae5UEwH5tnFQZiHqbNBqJl97CS9j9B1c6TrTrUS32AG1BJRPn2BqxifCvI6j5NbQoXx4XbLedMYP07ANC3FJHd5/X2QO1UTAkJxahp0G4TSlRLovyUpDndtprcal48e9dT14xfBAbYhFGYggPnG8V9mZgK8bd+Jn5q1K3wbk3Oj0AeZ1OTfU8/nid5XLwqN8jEp5HvO6F/QVMoRQhxH5Sk7BnGEsxyxsBFXwnyVh0MTHjpJOqVl1125bfLF6n1eLLvbWaDwiLEpSoN3npV6ET3VBY27EOTeDYNCHC8VYVpsw84Px61yaxnmO0YVUmrZ5VEwAS19S96jgNG/4zHOfrgo5w1t0JeE8EFOBGGTnFFibjgaa/j9JudBoUUAPtYWq5h1qINRvUAd/nQgH9V0kkihNvqqOn8TCP6Y48FnLRIe/O/9biBDGKR5rvzfbA6eI/hXH1Blvb+GQJ0AISff8cAlr1jLkHIjLSsr/oX/un8RLve/rJ3EnfUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(4744005)(6486002)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(54906003)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEpQbzJCRmhLSUNxVmZnK1ZWSCtVUURhRUp4UXJmQVRhcU4wek9wd0Jlc2lY?=
 =?utf-8?B?NEFVY29ISlNuYWYxZ2V1aVpwSzU3VHBwb2cwcy83M3R3eGcrd0lpU0grbFBu?=
 =?utf-8?B?K0RMQ2EvQzFOdUs4RkhEZEtPY2dncWVhazRJeFd2QitTVGdSc0ZRVEoySmVk?=
 =?utf-8?B?KzF2VTRKRzRUcWJ1ZFFSOHhKaTN0b1Jnd0NrNmU0QnZIb3hQUDhYcENoR1U4?=
 =?utf-8?B?enpTOWdsaVU4N2JqSUVDNzRiSUV5UWsyeWlNY0NHbk9XZ0hwMmpBdGh4d09G?=
 =?utf-8?B?cXBkbzROWUd5RUpxaEdFNXd3Zm91ZWIxdnpNQXF4dzRFREJwdzhBdjJPN0Nk?=
 =?utf-8?B?OFprU0J4Y1JncnpQTXhEUm9wVHJMWjh6L2M1ZG4yT1pxNU5ubFdDbzZZaDZJ?=
 =?utf-8?B?aWZ5eUtzcTVtYjFTZUxpSjZZMGtlTkpEaXBNaERNdFJZSHArcys5eC9MMEtt?=
 =?utf-8?B?QWV1cEN6SlNQNENwallueStOSTFFdDBFbno5a3Q2dU5QbVZVR2hINEtUNVNJ?=
 =?utf-8?B?SGhIY3NMUTh3eHR1ZkJnNEtkQTZidFQxQUl1S0VMQjI0RG9iN2xRZi9KNkpZ?=
 =?utf-8?B?b0lmU1F0WFFCZURWeWF4bWpuTTFYKy9jTFIvcmxaR245eC9Kc2JPUlRGK0di?=
 =?utf-8?B?akdWRWNqWXE1MzRyeThocGlrQ0NWSjVkVFcvRVg2VHhwSlZHWlg0eEwvVjli?=
 =?utf-8?B?a1Y1aW00Z3krdDFuK2V1R2JPcWJ6UnVycWg5VndZTTlIMzMvdmtJQkJJNkEx?=
 =?utf-8?B?ZE1wTnhReWFZclZIM3ZnZTRDUi9sS05pTVF6a2Y5dElWZXd6ZkNubDFiQVZH?=
 =?utf-8?B?UUlNWEE0eWRGZDhPUHJsaEhyVW5VZS9IR1ZpNis0R1k3Tk51SGdBMmZxR1pr?=
 =?utf-8?B?azJyaXhJREYvMnZpM3ZkZFZOdUYvRjdOckROaS9KNlk4RkVGSU45Wkgra1M0?=
 =?utf-8?B?RzZBQm9leC9HenhEbEQ1THRWWEorYkFYWFBmUXYxMFdQM21COUxOR1J4amtp?=
 =?utf-8?B?Z1puaWVVQUZuMFRlVkVhN0h4blF5TTZXZTIvYVI0aG5LRmVkN3FFeU9Cd3px?=
 =?utf-8?B?VlFwWXBsMmttNmlnN2N4Z3hOSSt3OFFsdXFYWVA0WitRYmNxM0xUSmx6NzJO?=
 =?utf-8?B?NnNDUlEybWYwMzg3UjZzUnNST2k1TnpDRUg4NndpSlllZWZuUERyQmVHNDQv?=
 =?utf-8?B?bC9TUUNuYnJMV2VrY1dpN0Zra1BYYmdOUStmWkxwak8vTWNoeFl6Y0VxZ2Z4?=
 =?utf-8?B?eGp4a1JSa2pEWEMrTTRDSy81cFVaNHRtM2hMdnplSHBXMmxoMExPYk9jQkpD?=
 =?utf-8?B?amJVOVdqYlBvVjZYL3o4YXlLZERPSG5iTFgrUzB1bUpZdWxmU3dhbktEbXZo?=
 =?utf-8?B?UE5Ed2hYSWlobTFUM3Z3dUR3c2d4THdvejdFQ3JtaFp0YXFSUWJtRjRqOGgy?=
 =?utf-8?B?em5ZUXhDVXMwbUxvMnY1SEtLTUJSWHpoaWN3bFJ6OEllcmVjV29ib0pGUjdu?=
 =?utf-8?B?Yyt4d2ptQ1Zmdk96T0p4TWxEaFVEODQram1uMEl6dlRQbVVOVkNlS1hoY1Iy?=
 =?utf-8?B?Z2lQc0tjT1gwdmQzSHkzNC9WZWg4ODVYUjErdWtWMDZZWCtOSjRZdUdQZEJR?=
 =?utf-8?B?d3MxVEVYNStOQk5yL0dMa3pzRCs3MFFKZEorak1ZY2tYRUdJNjNxdkNmdy9o?=
 =?utf-8?B?aVBuTVRvUU55dE83em50TnNiK1NscU5LOE44eFlyeE5WVWVpRG84czFJWnZ3?=
 =?utf-8?B?MkF4b21rUDFOUStVK3R5WC9LcitsaGtobTV3ckc4ZzViUWRva25oNjkxVmo0?=
 =?utf-8?B?bVBGNlFwY2NteG1neElDTEIxcFRXL09TOW9GdTlsdmhscDBUR1lMbGJtTWVH?=
 =?utf-8?B?bWFPZ1Y2eDJKWElvOWhzYlhocDhxVmtFZjNML0toTS9vdmF3M0IzTHpNVVcr?=
 =?utf-8?B?QXhobnU5aVlRS1RYdi9SREJSU0NQcFdqU2JzWWtLMDBtSEN6ektXZjh0STVJ?=
 =?utf-8?B?Y2FJcm5JQ3lCS1o4SVcxKzhzVjJVRjQxTTdzazVHOXdrVWJTcmxZRUExL1Bi?=
 =?utf-8?B?OTdBWCtBNUkyd1oyc2s1NzRUdko2VTFld1I2QXJaZmtMY21CUVBndytXZTN2?=
 =?utf-8?Q?D17ilj6b21HrFLh38gqRVR0T5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26560cf-01b1-4966-090f-08db44d63898
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:11:46.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7svtXcFJ11WvKMaQgiejGLqoTG5HqHtCv2rJ4l9xyiaUzMoutaEDprCeFQIwE+wR05JCHFyQDfGo6eSUtd7FmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8937

On 24.04.2023 10:20, Xenia Ragiadakou wrote:
> This patch series aims to make the msr intercept handling, performed in
> vpmu code, virtualization technology agnostic.
> It creates a common interface for setting/clearing the msr intercepts and
> then add hooks to the corresponding hvm_funcs table to be able to call the
> svm/vmx specific handlers through a generic hvm wrapper function.
> 
> Version 2 addresses the comments made on version 1 to ease further review.
> 
> Still there is a pending question made by Jan, whether there could be other,
> than the vpmu one, use cases that would require msr intercept handling to be
> performed outside of virtualization techonology-specific code, and whether
> this abstraction is actually usefull to have.

Just for reference: The code changes look okay to me now. They could get my
ack, provided we really want to go this route (which I continue to be
unconvinced of).

Jan


