Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4A76E41A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576125.901917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRURV-0007sf-Mg; Thu, 03 Aug 2023 09:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576125.901917; Thu, 03 Aug 2023 09:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRURV-0007q3-Jj; Thu, 03 Aug 2023 09:16:25 +0000
Received: by outflank-mailman (input) for mailman id 576125;
 Thu, 03 Aug 2023 09:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRURV-0007pw-50
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:16:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 693f3aab-31de-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 11:16:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8636.eurprd04.prod.outlook.com (2603:10a6:20b:43f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:16:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:16:19 +0000
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
X-Inumbo-ID: 693f3aab-31de-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUPvXqQLlcpGrmHBxoCMFObe8JK91q1IJ+W7bA1UaTYm+nlGy9jRJs/4pyn40fv+txk0qMAXilGYmhkjjcHshbqV8gP3JyVNKUVx6MIH2STQulL8gB3iRB2UetWgtnfSviiBdbaug/x1U4pUAYW8gzdeP9cRLWWM82wKwtOxAbKrI6abS4XCzh0U3v0jlK5Yd3XEgWa4Te/Ax7Ngq8bspIwRvH1iK7bpiWL8XS4JETAfRtIjKjK3+7CXv3orcjMFL8LNuujaT4Kj0ZFLog1F7uHh8lJ6qRMBterEsGx51tFYzkuh8NVbpgZFQkdksQ/Hs04L5kmAwWwIEBnA6tdYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kj9ri09BREZFT2T6zcvI87nG5Txd5cPnlOAP7pxLDM=;
 b=MEAL98fu3CWBgqE6GwwPwJu8XVp0+S4WFhBZKOM7w/UAL2WD4KK5Qxf4CFN0QjhajiMNtxWQ+qb5dQT5i5ujql3VZ1Z11ZU8EGpJrJDMj5M0kGtF1tQt5ELLF+g1BHXaD8Hx+LmY1mVSdgCchc9GFkOuh1u+i0FPysbvFsBQr5kM93aqjPxh0zB6UI5iH2dY2SPEiVg65F0YXHXRmbOGxRbAo2JzPKY2yAjU45yOR/kzMgz4HZi54kbJlJb+xT+t4eFjwVokaG49at8huSPH8bjWLN4+iDL5JeCSxkh0MgPwV2AT7v2dFa8rXWFQO1rvbxczbs8w/YT8h5rAZ+fxIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kj9ri09BREZFT2T6zcvI87nG5Txd5cPnlOAP7pxLDM=;
 b=MB/NMgelSiG1eRPSnVlOsdpjR9yLLk3yUfZf0fcW6ZuSiE+6KmemR+6HPofgeToYkYDF58ZDb6XQVTgBwa36fGetMA7aSslIfQfhmYaNfkCYkM6XNnVGZeyf+EiNHE8O3AGDyWWze+y4kZILlKlpcOCASAP0VLD4l3SRsNG+3VquInf797dAGou40NwglHnXzAh0DuAvpw0zCwiAUEcTQyBhAV2x6mAUZZlRCVFm3fBmVDQOSCfQLN/JbGUvPXHn2fYyVy19v5BykOisli6nNC6AAAw6k2GL3rLR5oOdvCt+i+ihLjLeQLhfLtZqUotW3FPWaVQEn1o+Z7sPyE2jUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
Date: Thu, 3 Aug 2023 11:16:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cc0d34-57da-4d69-6c97-08db94024c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZT8cbMB5al2XSuUyAJNq1QDuDhHehKBoCWzkXh8+1/muuiozapiMDymwDXGbxhIwm7OOUbbFnMfF8w68EHzpydo9BkutW5QQgREhscwlgm6wTt7nxP+HRbF3eGbIjngC9XCOXPZ7dEbxmhX/huEfG/hfbyKTSAYQQXOlpBiR5SWvbuQ2TsJzUVIplAcZpqK+QJJvwhr/uKR3vtf+7Tc/x631tc2x9Sw+sMDIIpSXse750s6ywKjFCxXgxlThPCQBOfOK+AVwYqttUgaPLue6Gvj+vYT39rvc1grpBbTjV0W+E9xZ95RaJh6fsNntmf2wXH79/DK+ThceDtLWx1EzJO5H85XfAICX3PD8XGcntlk4UjazHmzZhAoQRQtQRdHf2gm8gMGbmZZ/sXv93mImkP726ouXfPex/587vmmuMkGZOoaebl0dJec24FrjK5ySlOAwij9zIONveGz2dTrgzWe55Gd4Tmp8rUge2SX4dUWlYrwl8bZ43Lk/X+mD1+EJK63a7y9KYM0AuxL6rrFqPNbzTwAJVhSL6yJcBt+OVghzyGkgcuYEiRNJQKHok+7rKo8YvWDuGtq88MnIQulEis/C3EwkuG8CDfg0eLcnGKO2sYfMR/eJ+SlC2dDsQfYPW9bjeMWsLS3EjmHKEXMNAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(4744005)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(7416002)(41300700001)(8676002)(8936002)(6486002)(6666004)(6512007)(54906003)(478600001)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0l5cEE2YXIwdTMxanB0N2pNeE0zK0lkMWg3VWtnMVlRbSs1TnNubnJGTGdM?=
 =?utf-8?B?bDd1Qzh4YXJubzFIN2kxTDdrQkhCMm9tUkFhNjV6L2JSRTBRcWZRcHYweGRx?=
 =?utf-8?B?TFFpVmtJRTJUUnVMSTFtQUcwMVBrMXc0V09kSm5sL0lkNXNrYTZEN3VXSFlt?=
 =?utf-8?B?N014b0tZYjhvRU92bWVHNDR5TlNnR2VBYnJjQzBDOEp2ZHhmd3pkQmNQZm5Q?=
 =?utf-8?B?SHQyVnFVVVUweFE2UDZMOXZJaXgvNG5GMVNIV3IzaXVtMjFlVjJ4TUJuWC9a?=
 =?utf-8?B?OTljbXRYR2Uwenc1ekw1TjRUQjYyZWZLbmhUK3hWVEVFS2l6TXdVRnNFZ2hY?=
 =?utf-8?B?VDNSSHdRTHRiMnE3SHZKU0J0a3dvZDJuNVFaQ2lqVldFRE8ydzN4R3RCRmJK?=
 =?utf-8?B?WCtYTzdjUHR2b285ZVF0S0ZBL0hIaE91Zmlwc1l0ZzZxT0dEcXllU2NrL3lO?=
 =?utf-8?B?VU92aEExZ2wyMndmM0VZYzVXZ2FVNHArdHh4MlM1ZCtrOGp2NjJWZFRKMjVT?=
 =?utf-8?B?ZjFERUNnWXFaSldyU2NGb2tJWFppWXZDMFBZam9MWTQyaktKNU5hSVlEWi9N?=
 =?utf-8?B?Q2dDREY1QTdZdWh6OS9DRFFXdTRBTTB0RzNwQ1J6NnNjRHF6RjhicGRrWmlD?=
 =?utf-8?B?YUlXV21UMkN4MS9vNEFBRG14K1g1NG53R1N4K2pUN0E0SzhseVVHODVqdDR1?=
 =?utf-8?B?L0Q1RzA1NzgvLzZ0ZU9hRU5OelJnSzJHdk5BVm1ZVTF5b3QzekFFT0c3NXdS?=
 =?utf-8?B?OUs2T2lYUGllMUZFZDJJeDFXcmxuc1VBaTNGZHlyNmFOR3JHMkpPSHVoTGF3?=
 =?utf-8?B?Y0psV0lKZnpad2tsUnN1bElMSXVPMGFPdzlIQzJLS1FLWm56K1JqQTE1WXZv?=
 =?utf-8?B?bEswZWVqRng0T2w5M2dCRjlNejJGTVNneGZpZGc5NUQvekpFS3ZiTkFKRWRx?=
 =?utf-8?B?Q09CRDNQVWNNTUNOakpTOHppTG54UkRGWEZyandQMStTSlRJWkhsN2RsUldT?=
 =?utf-8?B?Y2FqdXVKQzFaUDVwQU5pVDVNditGVExPek8wVTNKaUNnRm90SGU0RzdZMncy?=
 =?utf-8?B?YWFFL09YcktmTzY5dW1iYXVybDRpTTFYR2Y1akdtOGZ3Mnh3WXN2dnN1R080?=
 =?utf-8?B?NFVkZER2dTluT3NpeVpybm4xaFZzcURuYkg5OXkyNE9pbXpiRzh6N3BFQ1Nw?=
 =?utf-8?B?RndXOTdJSSthM0piajFtbWhickNOWE9iOVdXNkN4Y2JKTVpGQ2J5TkcyS3hB?=
 =?utf-8?B?MmtDT05TUWgrdkY4UC9sUy81MCtNSGdPNFp4QTd5emEyY1NPYnk3ZE5VZGJk?=
 =?utf-8?B?YWhUNldGNzhBb0diNWVhWmZmL0twM3Y5SjJyb3h2dDlnTHVhRzQ0UyszTjRj?=
 =?utf-8?B?WUt1UFVFOU1wWjBES2krMlA4VFFSckJVYnMyQVdJYlZSY1ZFTExIeEFwWG54?=
 =?utf-8?B?T09MZUJPOTVjbjNleXVjY05SOWhEVkhLR0thMXRVV3FteXVEVHdYSERhV2p2?=
 =?utf-8?B?NCtCcVZDMEpab2pHSzI2bm9BZ3ZleWZYdlI5QzllRjZKc2w2emhVSlJjMXll?=
 =?utf-8?B?OGRVY1V6Zlo3eFErMnRsR2w5U0FzVFVmY1oyWkRBZExlRFZvOXR2Q1dhNWZx?=
 =?utf-8?B?aFluOFdoeHZ0V3dJTGZ5WHZUalpjdGVSc0lkeEV1N2FqKytrNHAxUEp1SE1E?=
 =?utf-8?B?OG9sdTZUUFhLdUptMEdOZGtRSFpFZk5TTWwzcDZNNUJqWlBrWEVRQzVwcGtU?=
 =?utf-8?B?WEVxVTBzdmk0RmJhbFVoSWxXOTcvcTM2OVdhN1UxUmUzYUdHTW5jbEIxdVdt?=
 =?utf-8?B?UHBhTlkxbWhkNU85NlFPWkhINmc3WXBiZ2UybkI4VVc5ZEE5UHAwK1VlYk8w?=
 =?utf-8?B?VjhIV1VUZTJPV3NDdC9lQ2Q1YVVEM21JbU10WjM4aXIzV085V01mb2pYWExs?=
 =?utf-8?B?Zm5VQVYxUmdQQmhCMyswMnpSV21BRFRZWmlpRHhuRk9XL2hKa2pNbjcwWm9I?=
 =?utf-8?B?MlJrN0tBNVpvQjNPdlg5SXM1by9UWHc5ODNMTTRZT3dsTVdRb2ZKdXRwanY2?=
 =?utf-8?B?N0p2TnVtZ3RlYkEvL3BJSENyQ0kvcGZpYkFCNU1DWnhrbFFUYU5ranhxV3JG?=
 =?utf-8?Q?OzIG91gkaOAfWlUSuaQwhej31?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc0d34-57da-4d69-6c97-08db94024c03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:16:19.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIY3NByFOOjJS4g/Lp5xglIkhxMlmD3PneI2/HkHJGs40GHrNlOd2Q/z8/9evxBTS8WAMWueXtG9WqBDnkzFgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8636

On 02.08.2023 16:38, Nicola Vetrini wrote:
> Rule 2.1 states: "A project shall not contain unreachable code".
> 
> The functions
> - machine_halt
> - maybe_reboot
> - machine_restart
> are not supposed to return, hence the following break statement
> is marked as intentionally unreachable with the ASSERT_UNREACHABLE()
> macro to justify the violation of the rule.

During the discussion it was mentioned that this won't help with
release builds, where right now ASSERT_UNREACHABLE() expands to
effectively nothing. You want to clarify here how release builds
are to be taken care of, as those are what eventual certification
will be run against.

Jan

