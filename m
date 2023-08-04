Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770176F9CA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576842.903442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnxr-0005TO-O5; Fri, 04 Aug 2023 06:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576842.903442; Fri, 04 Aug 2023 06:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnxr-0005Ri-LJ; Fri, 04 Aug 2023 06:07:07 +0000
Received: by outflank-mailman (input) for mailman id 576842;
 Fri, 04 Aug 2023 06:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRnxq-0005Rc-Cl
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:07:06 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224a9e8f-328d-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 08:07:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9277.eurprd04.prod.outlook.com (2603:10a6:102:2b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:07:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:07:01 +0000
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
X-Inumbo-ID: 224a9e8f-328d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/s+6W0kHDRSmGVoUlJaM32zBLYfTiCmlpDVYgWTXSBIBz9wdg8/QGb5qg2ZHUzGHSuKFbk6A+bQGssvPqJSPwdf77sxDuZynrS3mbr71aqkdM+tC/0F5AyVgmoy8+WjC99QMAJf5Spm0KZdyqsT9VCGY5L/OULpeg16rgJY1WQZr+DcuGJrd6bHk6MARSa8puZWPWywlzJTGSuhwtNziIAnvR+fE3WOJlArb6XWkKuGkPLPW6xFGItXPDFGzKlQx+EAoQwhZvE0HD4fDxeFwN8AMKp4ERtOvK6xTZ+OpEU8+vmUlLFeJeHnvwboiLFWm6D3Mnb5r9RIzpm1aV67Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXWkm7VfS37UWvnn3hIxvcHzcg4l3UHsgHHUoknNLiQ=;
 b=nxIc627Dt2ssjN069cSPFhUewrhfM7BT5IOFmPUUGmlLRTdxNH/A/nE5pAWSeBwo2DUWX20cCteassWjk2p0HGR5VIGgpxxVTU/E6FBFqJJ6Ko8XHryIG3NM+ZFABI4j0nCWUmr6pZdaL3O7Odap/pRxFc5yKE9Cn3Hzx3UWu+p71yyk7Yg1pW9OwRx2b6IjnOSRS6PjCzVKWV38IgT0+F70yb6IBEKIQ843n+ibyoOkQ+GE9nKFP5bRGaYtv77BxQuQBj6pIB5+IGElQOJsNmy6z/fx7l7rqMARpwZQPdn3LuMWOM1G+ZB0JsTTx4VK124GGOoIGjOrKHzRZICcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXWkm7VfS37UWvnn3hIxvcHzcg4l3UHsgHHUoknNLiQ=;
 b=NnwwYjXyTe0XmzRzSzeTqI8pWkkAA/qXEBBTxo66GQocLPrAzwk4wow5yYH6RHGKKCCjRhnpE6pTghxNOGIC0QyKWdC55OHsSpkK1O8QYsr2zx3WDQ6zgOxSI3LlA5Vd4IGFgvwN/q9h7E+2Z0CZSrQcncM1sf2JPPpiOBPRK+bpL35+7l6UkSg5812SvUX0YAKr7CHrvJ71kKNijM2X0ZrCw9e2MqEFQmCtRo/ekkGUGOD9dzgFE7U9ZW3bhnB91cwafeT/HfVsGH99Znt1F3ulmTUp+1XWtqoH6hSW9LAS3mLeHK9UOTcI5ir9q1B/U95e9sDpGekf4PPh1wQWpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
Date: Fri, 4 Aug 2023 08:06:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] fixed width type adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 7828c13e-ecda-4224-2940-08db94b104d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hqYgZnCg+Hn4YyQ749vYI1AEiq101CZVatrHc9QDAJkm/fC6cY3CYHkeIl9caosGD4Du2tsgYA2ixRqzkkxn8gfSfUgdlmZULFdakoVJQ/gaSh7tmwQJAHStBLPb8RsBaCcjXFpt5JMeTwJRkBsLIWIH9mAByx8DAaPwk9EZIJZXjUkIf5aSef0ZU/eVsn2Drm+RRkPyDsmNIHX13IJPctrgcPfI9eG3Gg+ndyfSwegkOOiuB9a/A8LZATzZhziy5A+Rm1YYDW76Wx/KbCSXnEglGNlza00X4BkKgFMeyOPgamCoLcf227asdx9rlbqwNik3T/2hfXB5RBaoO85BqFR5RRq+XtOdD7TUsl/LT8MpS32Qqf3k4h0yC6wLkqHBII8f0dzRZcMESQ/ggQdq9Pba8FPJOv2H0Td+OcjpPBLXGRKQrNBzOcAkDNz0oehW6CO+w8ogO2F0rGbF3SQzskSGQ1aHRc3UEhx+iK+LIJvdZJ8O+JRQQWWSPbZ981iQvDxibs0WCecbJMbfyg+rPeL1KujwCnZVD7BP3oBQHxOG4lPvoOc80qIjAEB7NiSHR3lyYUmbC3P4PaB6e+YUcCLMPmmEBFtW0xmlUvoayqtGxi/W9zbMb72FanKaZJarTCgm81sDZTvLQz8ZLLiSEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(1800799003)(451199021)(186006)(2616005)(8676002)(26005)(6506007)(66476007)(2906002)(316002)(4326008)(66946007)(5660300002)(6916009)(66556008)(8936002)(7416002)(41300700001)(6666004)(6486002)(6512007)(478600001)(54906003)(38100700002)(31696002)(36756003)(558084003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUZTMnNBUVJxOTRlYU9LTlppdHIvMHlrclk3L0lIcFoyNHl1aENqdFdWbjZJ?=
 =?utf-8?B?SXYrRk1YK0M0K3hXQUxxY2VUaldpbTJpbFdsbEMydkd3aG1CU2c5VWZLalBZ?=
 =?utf-8?B?OVZuZGVDcjR3WDhkYTRvMEJlQWhGaXZXK3IwaEVyc21DODZhK1RqeHFDZlVP?=
 =?utf-8?B?OVZBZm1ieTRVbndFYjkyUnVHTk8rM0YxeGhSY1p5cmppendYMlFXQ0RVVU5k?=
 =?utf-8?B?b0RaRmVBTVU0V1lQS3V6UTVvTkZNbkFrMkg0S2tpWTBsbFc2bVp1Z1F1elNs?=
 =?utf-8?B?UXNtb1R4RS9oVVJ1RGpQRkRKRXlVcFhYbkxZbmZaY3ZRUG03Nkk5Rlo5Yk1p?=
 =?utf-8?B?RkpUellOSFIzakpKRnAyRFdOOWxDV21CdzdnNmJTNW1DWTMxMWJQVFdXWnpz?=
 =?utf-8?B?K3E5K2pVNG1WanI3N3ZDd2FjdkE1ZSt6UkRsdXhBRUs0Uk9IakgwT2N1em9o?=
 =?utf-8?B?cnVPc0UvK2tleWZqT0c4a280MlNLeld1aW5ZeXVaMVliU2ZsZWxOaUsveHVC?=
 =?utf-8?B?aE5PR2VIVkdrOWlxK0RtYmhJZzhsb3FGWEMxSEI4S1A5dnVkSHZ6UnNhTWUx?=
 =?utf-8?B?QVRMU1AxMndlaEs3bVV1TTQ3Uy83NXZWTDYwalE0NTlud1NSSWZCeGh4SVV0?=
 =?utf-8?B?TURoN2ZBdXZOYWd2VjN2NnRWYmljSHFyMjZTTFhBd090WHo0Vjh0K3RmYjB0?=
 =?utf-8?B?bTNxR1IzNGhkL2JuTTNqOXNLMXNKT0RpWk55amwzOUJPakNpcUE3eXFka3hL?=
 =?utf-8?B?Y1pJTlpOQ1pURXNvZE9SbUptYWRRS1hXTFpycjg1cWhaTkp4dTF4R1Q0WkFD?=
 =?utf-8?B?enQ5ZUlDMnQxaWhkbSt4cCtXQzZzUmtNM0phVnB3UWdGZUE0RFFIUnhjMDZO?=
 =?utf-8?B?bWFIRkEvQkZnN3NGSnFadGI2dktTUGtLdklZVjQ4NktMdGhLZXROV1Z5Wm51?=
 =?utf-8?B?eUxkN2p6YjhRdjh0WjRVUzZtK3lYV3luY3VHQXBHbzhvOGxHTjhMNG9IbjR1?=
 =?utf-8?B?TG1IOWJOWlBVV3FCVThlVTlJdzJLWTBtcWtIOFNCZ1pCdFFvdkJWNzkxOUp4?=
 =?utf-8?B?OEtRdnFTN0wxTHRRRkU4ZlgxVXBIenNCQnUxL1Uzc2ZQcG5tVFdzazh6YVlD?=
 =?utf-8?B?U0oxbUJ6c0ZtRmJTSWVuYTVVdHZDQ3pqZTlFWmVHaDNzMjRXdGFSeFZna1JL?=
 =?utf-8?B?Zy8wUzBIL0k5ZU1ZelplbERiUzk3TTh1d1ZzOHNQWE0yYzdXV1ZVTnU1VzM5?=
 =?utf-8?B?anY4ZW4yaDU2Sy9JdFZNZVp5K2tKRXdKdDU0ZEUvNWF0eU5tN25Md1NNRE8v?=
 =?utf-8?B?RFpaWmRCNEZYcS9UKzRpa3N0SjRCeElrVUh2S3Z0OUhIUUs0T1JwTWp6Wm9P?=
 =?utf-8?B?bCs5Zi9kdzJyZUoyVU44b2xUY2R0blZpUDNoRVAvaEIxS1lKTXB4QWN2cVM2?=
 =?utf-8?B?R3JBTXF5c29lNkYrcFhYczM5WjNncFZzb3M2QU5jRE5WaWdiaG1GWURGU2U2?=
 =?utf-8?B?U3RZcEFJTWNWeWtUK2N5c3RDbWFSbzV0R3VxU0dlTEh0STdLS2xTYm80U1Zu?=
 =?utf-8?B?czYwQyt5YkRrdjFVMS9QZU5OQnZjaXc3ekxNdDNZRFUwd2hFY2dweTlLRnhY?=
 =?utf-8?B?L1V4dUVPdDIrVW1JNks4WXEzZ1hrRGtHVDdRcU82VWhOS0VpQWNyQnpHSEJQ?=
 =?utf-8?B?QklNeXVlcHNNa2QydTlheTlVTUUzdnpvSGJxVjhpOTFJQlUwMlIrS1hqTzN4?=
 =?utf-8?B?RjBiOWFqKzBwdEs0N3plajhtRWNwblI3elptMUJ3VFpGNjhrNHlUSjdTVHRa?=
 =?utf-8?B?OGF4eDRvTTdGZ2l3ZGJocXY1OE9JVWc3R2ltQlFYdUpyeERUVFdxZVRZaDUx?=
 =?utf-8?B?aFJDT1R1NWlQVmxZSGRxOUgwZnJlWFRoOXlJUEV4VElyQjAxTEV1NlJUdXJG?=
 =?utf-8?B?YjA4SVBoQitZYmpBcUNILy8rM25MMDlaWk5uRU5FTDNsZGpaUW9Lb3ZtbXZ0?=
 =?utf-8?B?VWVnSDlyTlg1V0ZtdEZMQld3VzZMcENBUWc5TnowQ3A4WWloR240dk5jeTRk?=
 =?utf-8?B?N0RtY05nTEVwdHlrck1tYlNpck9QU2FMeWVXQnR0N1NFbkdoUkQyMlgwWE9u?=
 =?utf-8?Q?/QkEysdaV80RZ/E6NxcsP9bni?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7828c13e-ecda-4224-2940-08db94b104d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:07:01.5807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9cUFaU/nGzHbVxz3qmQKC3586U9NWrjEF8q9+VUAJVqfFMV3IB6oFuvbxXSdUd0IcXw72LMu+qwQq9DQSV3tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9277

Patch 1 significantly reduced from Andrew's introduction of xen/stdint.h.

1: move Linux-inherited fixed width type decls to common header
2: __u8 is history

Jan

