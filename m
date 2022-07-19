Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064D579307
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370337.602026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgUW-0006qb-6C; Tue, 19 Jul 2022 06:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370337.602026; Tue, 19 Jul 2022 06:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgUW-0006o7-2u; Tue, 19 Jul 2022 06:13:56 +0000
Received: by outflank-mailman (input) for mailman id 370337;
 Tue, 19 Jul 2022 06:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgUU-0006nz-IP
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:13:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6b894fd-0729-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 08:13:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7309.eurprd04.prod.outlook.com (2603:10a6:800:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:13:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:13:44 +0000
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
X-Inumbo-ID: f6b894fd-0729-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1vVbkKutkTAT4BqSVnQOJf5HRyq9fOwF4bfcwHQrmVs35KSpFILkj7RU2Xy1d/NgOX37aGxHEFY1umZ4ImBlEDJ9mFzlVw6VJ8wEze3BAOFoMY5+Rl3g9vT9y79URk/lbRRpwlRMLuTcSHQrqQPuxjGz7oZqxsZ+tsQa8JT/WuqdLZ98oUDf+VdQXGOHkLre3+bhXogqu/7IjXfN7/0MKEdOZGMm9ClLypN3rpxCWct4m5HJgKeH/lVWBkC3FdvXPSMOyMoRXx98nVB6NB3R6yDxlaXSXJlFFjem2PqeX3xzIBDo7CQjopBNSlsb/FbK6Jq/I2OiH2YHbAia4+W5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQx6jvbw0ce4D9tfYC8sMRrpdB607dpI7gyLn6aUrM8=;
 b=Z+KDKvc3q8LGdgNY1CgMKM/ovXIBw+czySTGZmGWgYXtafk2noBSsRYN/4YC1JAUsppM75Qk5Q8V/6GyJTs2cgXNY7Iow95EbvjLfOrPiY8E0YjaIdvWjwMxIseNChxl8KIUCBOhPDf7J5mw6XSQpHhT+2gXcU4tMhjXYCevXCot/gnPgH2RnPCRllZPXUmxvLi6YmlU15KJXSokRcRRCN5ubjNJZzDtcKWE+AZrXmUIU5bFqElomzqr2ZaOuDmyVtCX2y1Xbqv6MyxupmwWA4ZPph/cbm9Q0XMapxpm/DurSXAXquz+euNouZgBv7EdQlmyyuapdXxKHDyfQOvbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQx6jvbw0ce4D9tfYC8sMRrpdB607dpI7gyLn6aUrM8=;
 b=bZNGZbiQbXjsi/Zo9rekEqYf+USiQ+gj09AKFKsH8dbE/ZHv3tOF5pZBab+NaqdG0+cBWobLWP3WHb0HV1UFyRXQ22VJ7bWAeqEeFvmEHgZcGUHkVmRKhoSzAso2NzTPfxr9wlMPvhdPnSJ4v+RjbTynGIUdo+ZrLH2/lic4w7oKjFxKey5p/ETmHZ7KLhSs1kNt7XL3wJvkqefgfDL/mYRZFyLRpLNOByU7ZL5AgRg/wF2fLnhucJ4QnFO2zr6QM2YTaRTz7LDcr77+3G0xdseXxvRSbcEUavd5GysjcjMKccOjUiv8E5umzje2Gp5LqY2NbbEZ/sSP3AQ6gOKwVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5cdfbf3-d496-f919-125d-857452fdf55b@suse.com>
Date: Tue, 19 Jul 2022 08:13:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] x86/spec-ctrl: Consistently halt speculation using
 int3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718205009.3557-1-andrew.cooper3@citrix.com>
 <20220718205009.3557-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718205009.3557-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24b3bce5-cae7-40a1-effc-08da694dd582
X-MS-TrafficTypeDiagnostic: VE1PR04MB7309:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6O5UAQiG1J37r348Er9zi6Ai2jv+TwSPPJoLStBi+cHCcNzItDOid3AfjtZZCeq+NICgP09lJmLfGPeTtAmzfjI44eeRcvDAQPR7QEwBwjJ0d3fzocg0KGATpi0XkF/63cAk2HuQGtMEChJV2LHF2W9V3RCpMUVXKHxiNLVpVLyxfhXbudEu4qJRUf3aRPRb/PUrqXEWyiNd9Z7ooVWjqhRSYzNcVGJ7m/3/QA8yU2uL2iMoUOxnE3mb2dHP/nkiN91ghMaXtfIbfnFwsjNr1p8jPBJDOtMOzZ8sHyjwFpsznQBx/9ARCefIeoAvnVBcpCtZN0z/ZzNp2HQfhLVbRFMbV2m6hx4wzqM3+l1jXRU2xRT1s4ibPt4XV65O2NNsU+g9Gq0uuup4Z3RirL4+hPC3OpdrhtminqqTIx/0ARBc6YK1I+VuHCFMYsql9Rf7iHFK8U6atcQ6g2aDltDb4v45mQpiKrHiMhHKyZ1W8h2XVhA9zry4x5Ay2YvtzCO8xcu+JL8kW1zxtfz/W9ock0aOEXKBzwMZawySVSaKPGswiPRTaaNbxWBQgFP/aCGHF+TkwC7WrrKMTT0G0DwZrogYtP1L1vwwBr/HoOkdiUY+WGXR3Vt8Oxr8ZY5RJFwwjV/dXT6Seo7VZKZ9HciES7X654DGpIE6OCwQR/J6cMgCr17P9E2dqD/48mVliOGtD3tPCLvdax3/bdrCaQ4J/7VCFBweWW86S5zf3CwtvPol1c7HrztP94Sa6/u+/3k/j1/rAqPllHKqXcIDpkgCWj/1arIskA9uDC9kKolRFt5LSZlrT3uZsKfWj3cVCXMHeh0vf97PTArcAsEoSF+hFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(366004)(396003)(346002)(36756003)(8936002)(66946007)(4744005)(5660300002)(66476007)(66556008)(8676002)(4326008)(54906003)(2906002)(31696002)(6916009)(26005)(86362001)(31686004)(6486002)(478600001)(6506007)(41300700001)(316002)(38100700002)(83380400001)(53546011)(2616005)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU55bXZnclU4b1QrRE5ucGRzbzR2MjNCN2NEYWlBTEpCOHVQRytMWnFId1RU?=
 =?utf-8?B?T3hveDNibVBDR3lUdmtSMTMwbTkyaUFhNWZkUHo4bEdHbHo2cFIrRDQrc0dS?=
 =?utf-8?B?cjBoVGE3RUU3Z1NhUUE2S1JJMTl6eG1pZHBBdi92aHNKVHM3bk9VakxORkRy?=
 =?utf-8?B?NlNkVEFTVU1EcURNWGlxeldTdGhyUzBmTkoxWXhwTlVkdUUxRkxRczYyUk54?=
 =?utf-8?B?ZkVDTnJYVDkyMnBoK0NWekNCdEQvQzNVdDloRFFHdUxIYjFSbzc0WTlMUzNL?=
 =?utf-8?B?bk5TbUpvTG5UdGZ5NVFsOWlGVnFtMEt6UkpRRGt0NUM5dy9LT2lxV0NyT3dB?=
 =?utf-8?B?bVc5R3h1Mms0N0ZHNmwxbXk0eWJFR2RqUGp3azJrN0ZHU1dtbjJZRUpveC90?=
 =?utf-8?B?bDBUZlJpL001SXU5TlBXWVpCTTYrOHR0ZTdjSHdCbHVqTGN1U0ZrZmhOSjF4?=
 =?utf-8?B?WFZMek5DTjlZQ0VFQWF5RElUTVFTVTl6eUNFRkhhejUrZ21mUkNBdFVRNkhs?=
 =?utf-8?B?ais3RDJ4SC9wOHRwUVdCVHFna2NnbXNtRlFpZjlQcnZHYU9LYjdhdHB1S2pj?=
 =?utf-8?B?REtpV3VMMHZVV1JXMzZuUDFJNDg1ZjJMZ1hNVWZqUVYyQjNTRzRVUEQwSnRV?=
 =?utf-8?B?MjR6RXZtamdVSnJSUU9YcFMvMUZmWVk3eGFONEhDYXJXSHUxRE1rUVlUNjAx?=
 =?utf-8?B?ZEIyZXRSdUwrN3d5S0JKSDZ2dkFkOTBrbG54VStETHU3OCtzdDBkWVcyMDRm?=
 =?utf-8?B?cXVoSUY4M1JZVmNMWVptTzdNaVRQVktXd3JJME1RTnpXTzVXUkUvUm13MnBr?=
 =?utf-8?B?VkNmY3RtNzlkcDZNSzZPWG9HUDNUanM0OXNTcWIwbkUraGNxU1VkTWlvMmFv?=
 =?utf-8?B?cjcyRGxuS2ladGduM3NJM2VrLzZKZ3JYS0hGMldCSE9KU0JiMEp4WXN6dTFm?=
 =?utf-8?B?dzVKeGY4UHVzUFFMRW81S1Z4STRPQ2h0VHNtZHl2ZjllV1pQazVVdWZMOVBP?=
 =?utf-8?B?NzNhOWJLWExUMEN6ZDlONThHbHlMdXk3Y3FZaXE3cUswRSt4d1hUTDZ3UVps?=
 =?utf-8?B?b2puUk5yeHJmQklJMmlTSGdjSUtaYmM1djVUVnFWZUV1cVB1STJHei9sMjdp?=
 =?utf-8?B?L2p2UXpEK2g5TUNLU2llWHZ2eVBkbWNVeGtYczVpdHlxaUVsSzM1WlpObUV4?=
 =?utf-8?B?TklvY1RDbXZOM2c1aE5ZcWt5M0ppeVNnRnU5eTh0T1djOWFPYkNiQ0lEVklr?=
 =?utf-8?B?Y3dVVGtSNENiVlJnSnlMVW55VzhLNHNYSGZpRmlWcWMvdStORjFYWkY4VFhj?=
 =?utf-8?B?a1NTV25FSUFCOEdPUDVnaTZVa0VzVktZT2Jxa0JGTHRXV1hwU1JZR3BUNk11?=
 =?utf-8?B?OVJxeDdiRkF3Z3hFQVg2aVNSRkVjZzBPQ3dBcnhaNjdtMVZSVkhLVk9saFRS?=
 =?utf-8?B?NWlYNW5tZXFNNldIMFBuNlM1aVM1UmpNc3V2WmQvM2RicUxyOVBtOFZJMjcv?=
 =?utf-8?B?ZHFHc0p2cW5oMmM1TnFJY3M1VHRuU0hFMy9JaFEzSCtuUVRza2V6anIzZGRh?=
 =?utf-8?B?MENDN3Q1Vmc3dXlFODYyZ3pvdzRHQWxZUnkzMGRaTXB3ckRQQWt2enRpQnBo?=
 =?utf-8?B?dnYwbXRiVHowbzV4ellxa3FYSlZVcFI2WGpLME93dnd0aHl2Zm5nNk5wYTFF?=
 =?utf-8?B?eWVXYlRVYWVFQm53cm9Qaktxc09IRkhFUEU3OVlsa1lhU1NRM1BqeWpBK1lW?=
 =?utf-8?B?eEI2V0krdEgzVWM3M3JWNW01Y3h5YktVSGR4WER3K2lGTlhMblVJZ3VyYmVG?=
 =?utf-8?B?ZnVid2tPMlZJVGlJK0R1bXlRUDJhSG03K3ZMQXhSNHZwblY3dCtnZkc0VDZO?=
 =?utf-8?B?dlZ4VWcwSi9uYWtqZEdnemg0OTN0MUlwRm5yenBBTHFoSDlkZ3Z5QVVGVGpL?=
 =?utf-8?B?eTVJYlZjcEVDWCtidzNCVmZ1WGFQT2pqS0wyVUxPNVNYVDhhVXJFUHVOQkMz?=
 =?utf-8?B?MFdLb2lpM0UzeUZGVTJKT01xdXMyQU5Za3VDcTFYRXd0MGpuems3SFZXTUU2?=
 =?utf-8?B?T09FUDg1eHdaK2V4NjI1VjZpVWdUc3MxdFZ1eGNzMG1WRlIvdjdlNWEyZ3BG?=
 =?utf-8?Q?C/x9ZulyxWYzmQj5ELXyLWCoL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b3bce5-cae7-40a1-effc-08da694dd582
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:13:44.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97+8f5TinpM+z57u/mexmwm1wPMtE5YG8yA++vH9Munfv/+kXeCYN8qcp82V6I712kcGXEOhSw07TeoCBZ7QAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7309

On 18.07.2022 22:50, Andrew Cooper wrote:
> The RSB stuffing loop and retpoline thunks date from the very beginning, when
> halting speculation was a brand new field.
> 
> These days, we've largely settled on int3 for halting speculation in
> non-architectural paths.  It's a single byte, and is fully serialising - a
> requirement for delivering #BP if it were to execute.
> 
> Update the thunks.  Mostly for consistency across the codebase, but it does
> shrink every entrypath in Xen by 6 bytes which is a marginal win.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


