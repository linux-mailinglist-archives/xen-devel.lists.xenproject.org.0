Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73F7633C9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570281.891982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOboI-0007EI-GS; Wed, 26 Jul 2023 10:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570281.891982; Wed, 26 Jul 2023 10:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOboI-0007Cb-Dt; Wed, 26 Jul 2023 10:32:02 +0000
Received: by outflank-mailman (input) for mailman id 570281;
 Wed, 26 Jul 2023 10:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOboG-0007CV-Vp
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:32:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6dd6676-2b9f-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 12:31:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 10:31:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:31:56 +0000
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
X-Inumbo-ID: a6dd6676-2b9f-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpKsRspCO8z6xSPzxaXb84xg9DwZH6n7V4fr6un0m3iH1B5VTXms+p0mUiRw6+lJ/3s9hBprRqjZdtfnGkEseZhyjvo2ZQybI85oWm7YuBzG4RW1l+gRRE9W/kboQ1Dzg0Bp2V2uc+uzcSPmoRVTZyDJOfQQ/r3GRUq31D732Uo9OCvv6dcAhPTxLV0Wz3uJtnbo6V2ptbAFA2qNrSXBjEN0CaxC0bvBFTV4HEUGeYK/Roo+j6ec1utMRpXE6pTyOa8oNHXcAShJa31PhQanhMR6Vo1ZMVMMHglI+PCgpBgnjokFDcbTbKOUpZ4/uGrHAxpDk87om/gkmZp9Tx2zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x54BF867RplKc+ogBqz1C629hCeUocCx2/oZXgNJ1Fs=;
 b=WKIo36GcOa+srVBhh9yotK5zF/egGyc9dCxu1wbh/FTdILCnURw/L92yTVrHuRd35Szwo8rtJNo8Fd2ayH1pgrzpIHVH/nRZ1CBKfjaIbxha2ZuKFoANip8OuFwYE52gVAPYfsf/oh2PlYa0mgRKI5cLweZAjQ7FPpoIbJGrdTSQskOeZ3poPzPECVTg1HNgM6lwRuEoOhlbgGKakh1yohEAuOc1McgZBbBeozj9nP8QbjVa8gcKGEOXSPDqkYNTI0fvquhyj26kRL7H6f+40SQRgFtaId50KEPnNlxSI7D6xAoaMcUS1KilKpBsnV0zkWjqiTq38ySEXUiILZ5/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x54BF867RplKc+ogBqz1C629hCeUocCx2/oZXgNJ1Fs=;
 b=hZkVE1FpjFG37w9Rv/6jrZocom4iO7fcsXhzOLKNM2rbej4Kokddv3pnHXA6b6JVMWm+psycFmhxlqLB2xrr5Oz8lijGcHG6HNu+WjC3LXsGGatH4NoSxtXRe4Oh7X+clT8earEnYoEZhguGLbmm3bKZGVpET7goLWaq3JJ0dxNxsw5scj81y7AC5XkNzrHVqQ++UTat7/y6UL4CjCBtiu/pjEqKqO6GxcGwx81bd/rKSUBRe1t/CInaCSs6uSGAX/0+9aWYwMGzWiIGY3r9acv9Fw2AegtaMLTPDmv3m3YdRFcg5qCNHyd5FBN9dx8q2e13vfl5VLb1CLrHRTWMNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
Date: Wed, 26 Jul 2023 12:31:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/5] x86: allow Kconfig control over psABI level
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ee546b-6511-49ec-0863-08db8dc38961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLSJSi+isVylIuSS351HYq64h3P1unBWkeBy720dhGXjWf8JNgkaaVYCVzLG0lifDeL0edGbuWzJwE3zJ+iKCqr/+SYKJhx0bDWORAgmeTabzm8akjP7vjSjoThzk9wEaw6FAOxd/TCIShDqfkTu+aHn0O7T4vKWUIWVL+9pivtvug2srzwTQ5lueLj8MikUAJWNhjQqd5LIfCDX0R7s/AZ2ZLIWrdK2cR677imy3o14XGU25JJg4Tc0QBJjH21gSnPzC7+qGYfBPZaPjv//tzR1HsCPrMYide9f/nPRK2t5GG9mc3+LK1lePpzzo9j21RZR57JyAOIib10h3ELLcaMGw89aBM4Sir453kcnMVUYO+3Yk00Vtnw3voQQvZbV9COpRQ0qvLiBJdOKqYjX4o1lzI+LeYh7fzf5tF3442gtK0zqT+JWxYfa8EPcsJuDNu0VEYHBGl8aza0I/LWZo0ysWO19hKL4PCAAdAV0kh95/GfQ/hEOgCrFF3YGmEZkT9QgDEr4Wy5kF9WBAQ/SbPRse+RNzY/57u17K5P2yOix0YQd/9KxPnAisy6nAiaBjJjHDoEL5hLNK+7G1KDf2584Qw/c53DXmdWM2wQDzZ+0K+CnarjUimGgKb7vFfVL890E+qKhgoEf8wF7Is0kug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199021)(31686004)(8676002)(8936002)(5660300002)(66899021)(41300700001)(316002)(6916009)(2906002)(4326008)(6486002)(66556008)(66476007)(54906003)(66946007)(478600001)(6512007)(26005)(186003)(4744005)(6506007)(86362001)(31696002)(36756003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3JNcm8raUk0T3JpUnBlZDc4QzR6YW55cTNIUWVZc1p6TTllQW9HZVJseGZV?=
 =?utf-8?B?RFcyVS9mWC8yMFpSN2RtdGZuR2NzMTRUbHVzb0k5eUdjVDA4NWlmeGpWbmlS?=
 =?utf-8?B?Wm9NeDlmMDREY21JeXpwUTZCaWs1RnBRUytkNHkxUjlIZUdRdzRJUkJtenlD?=
 =?utf-8?B?d1hwbXg4L3h1OGdPdFdIOWlNOTlEbjR1Rk05ZmdRbnVMZHVnNi8yQkFvYmx2?=
 =?utf-8?B?NWVTcTRSUklTREJLMUNvOGQvY01qTURIdHpma2k5RDF6SDFOWUtlSURHb25H?=
 =?utf-8?B?N3ZYa2M5Z1Y3ODFHcHBDbEFHaCtZeThpVDlYTkRiSm9CM0ttZllldjlDbGd1?=
 =?utf-8?B?TEpGRGkzL2hSOXJRaWpSTlFCNUFVL2RXY1IrZGJhSHhSTHp3dnZXUms2SVhX?=
 =?utf-8?B?SzBHamRuQXNBR1VjN2pwT0ljZGo4VnVtdW5wbTJvbmJ0MjRpZkdxR0xNTGVF?=
 =?utf-8?B?V21KOUNkMWVDd2FQUUlmckRkcG9rRUFtVmQ2UTdwMzh1NzJkQWw5WVJqYk1P?=
 =?utf-8?B?UXhuTWxKdzcrN1FpREYrZ1NPQWh1NWhWSXc1RkdmN3pFYys4QklaUXpVWnV1?=
 =?utf-8?B?SkxBMkFRc21rMmdnT0NyN0tYTStMVnJkTDlvdFdxRVNLcXduTk9VZS93dUZs?=
 =?utf-8?B?K2xDMTkyR1B6TlNPU1V4OE1FRjAwby92VVQzUVpWZ0ptMndxN2Y2SGJTTTN1?=
 =?utf-8?B?ODByU3hobHF1RDZQaVhmajFwZndlODJvcmthUHE0NFNmdkVmTFhQTVhWRHg5?=
 =?utf-8?B?YkdncXNpQWhNNlF2cTJRdnEwRVBBUW96SXdTVWsvMVZxRWYxeGZmYVUrWVgz?=
 =?utf-8?B?cHN6QWtEb2gvOER1Y2cwWEZURzVRZHh0aDRKZFNLN01xODRQdU9ZSmRMVEZm?=
 =?utf-8?B?NDFNL3dnbDJVWlpDdnEzUlUrd3kzRkpJWEJNUytUUmM2QjZLUWR1V2tjclIz?=
 =?utf-8?B?eFEvRCtWcGFxL1dqUVhoMEVGd0xzbWZ1bjRpMUs0WjJRSS9Ic2k5ZXpGK3Br?=
 =?utf-8?B?TnFqbXBwQitsMkJmNU93OWtQNTlIS21VUmlkeEZFTlBFMHVvNXhGanFkYW0x?=
 =?utf-8?B?ZFhyRHRiZFhLL0ZqWmN5RVRrMnJFTGpYaUtuRXdwcnFlZEFZQzRuYk55MHo2?=
 =?utf-8?B?dWY5ZENrWUtJUTZUWUF2bmYzWnRTN2g4aU1kTnlrak9XZnh0cVEwWGp0dFBB?=
 =?utf-8?B?TmxtMTdpNk5LeW9Wa3JBcGVyT1ZZemhBKzRBRHZHTEEyaUZrS3hNSzV4Rkhn?=
 =?utf-8?B?VjJGMVJYQVo5eGgyYWVhT0QzTUxhYklGT2dZTGJYNndIcXJZZ2ZjblU5Yzdv?=
 =?utf-8?B?Skc2eXNXVC9CUC9Ya1hsd2xNMmQyTGdXWXljcCt3a3RqVXQxL2xjcEx3TlBK?=
 =?utf-8?B?OTk2K1U4b0J1K2UwY3BvdkNrNjNqUmVKYnNpVURWMHluWjMrbHEvYnBNdTMw?=
 =?utf-8?B?NSs0eitYZm80Nm9GRDZtajNDeFhoazVabU8ra09wMDB4cktTUGVTa1RMZXBQ?=
 =?utf-8?B?YTM5WmV5ZEV6SFVKTW5sU1ZIRnlsRWRNc3JaT1IxdzBmR3pkZi9DSkxidkN2?=
 =?utf-8?B?K0E1aytibzZmOFBnbHhmaDA1ZGJXeDRBVHkrYkRueUxMcWlpNjRETEJqeDZK?=
 =?utf-8?B?cWl0U3U1NWkrdGV2TEVQVWpYdTN2TkVDYzRPeERrQzdZR1ZmK2VJcE5EZEhZ?=
 =?utf-8?B?NEhOUUFYS3V5aEZMSHdsRC9BR3loRGtkU2ZvNjBLams5dnRsRmdMbWhNV01V?=
 =?utf-8?B?TFhIeUwweE1XL1l3VG13VWdCakpOb3dwYkZoSVNoWjI2TnlDN3dRQ0llYU5O?=
 =?utf-8?B?UVA3R0RTWDZWQk14czBPdzU5NEhRcHhzMUlyc1Q5UW5ZaVpKWkRtNHZXVlZ4?=
 =?utf-8?B?dmhIazFuVEJtSndHdWE4NWNlOGtEMjV5TXJYU3V1Q2g2TjhuM1dUeWlsc0lP?=
 =?utf-8?B?M3lPT1FwTThlbzRqcS9CL1VjYXRkWVRESGx5Y0Zrd3BpU3haaXB4cUE4VXpH?=
 =?utf-8?B?N280N2ZGanY4dnFaVmhTd2p4YzJsQkJlbEt2MS9UQ2QzMCszRkppNUdPQW5i?=
 =?utf-8?B?QVJMbS9kZ3lqUElIUC93bFJlaUR3ZlB3cUdTTy9ST0F4M2NDMG5JV2JCRGFV?=
 =?utf-8?Q?eOXudBUz11VFxjzY1a1mp/JiL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ee546b-6511-49ec-0863-08db8dc38961
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:31:56.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewpiydfTSwQFeIFGrO+/CNPHZcWfJkHcdbe827Spa9oLfT7AIHwizQ9nhCrlhsf6Dpufnw0Ue/T+TmtZ03HoMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055

As discussed in Prague, with some minor add-ons (patch 2 replacing a much
older patch under the same title).

v3 addresses issues found as well as review feedback; see individual
patches for details. Patch 3 in particular continues to raises several
questions as well, though.

1: build: make cc-option properly deal with unrecognized sub-options
2: build: permit Kconfig control over how to deal with unsatisfiable choices
3: allow Kconfig control over psABI level
4: use POPCNT for hweight<N>() when available
5: short-circuit certain cpu_has_* when x86-64-v{2,3} are in effect

Jan

