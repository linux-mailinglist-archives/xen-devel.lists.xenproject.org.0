Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F877BAD3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 16:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583681.913958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVY6r-00066Q-7T; Mon, 14 Aug 2023 13:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583681.913958; Mon, 14 Aug 2023 13:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVY6r-00064K-3C; Mon, 14 Aug 2023 13:59:53 +0000
Received: by outflank-mailman (input) for mailman id 583681;
 Mon, 14 Aug 2023 13:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVY6p-00062w-CS
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 13:59:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d55ec303-3aaa-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 15:59:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7136.eurprd04.prod.outlook.com (2603:10a6:800:122::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 13:59:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 13:59:46 +0000
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
X-Inumbo-ID: d55ec303-3aaa-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTAo2mVr2SM7rQfB7CcNUqSMD9HDPVOst6y85GYhx91Y5aZDX31jmuJFbnwzkvgySskQR8/Lu2Bjfhck1j13nwcrLUlOE6OJZ+mr9xoh1p7hQUOq0WlsLN6CXT+kLxjT54FiREzAmDLvmfWGWgL+cv7LFIi6CiojQ2aJIx2XSr0Hjbq3KSOpm/MjEFVNYY+wDZPb3aCGgGAOzqggwiY/Gd39KkM9zNu6oTLop0twufTqSvz9Sc8E+zIMd2ZCDO1Jg5CVW8ToVg2L6d0SAIqEJSLiinojmKciy/Fw4/2i8C9cVPHREsajM5Fzu+jy0g2MCGRAlNPMM6IqZUCYI3Uflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2arC9uBf7LBsN05ErzvbRb1QlLiqzJWuznii/OFnPs=;
 b=EF6O8huGjl1PUFbVJLxkOUH7o+E3yErpNhM0FnuTlReFBa4svF3tOxif+rMiDj3yhtk3TuL0BDE2iv9Fo8AdHmR86U5u7toa9euC/sZ8hWOxonk9qLPefavGTnm2x5E2KYk54nrFpeKBptm/AZajRlx9kT1tSZt9GFr2Ko9meabFeR1kv+EdH8cCGSBOOm8FR8kRDPZrCUC/DZHm/05gj1NKF2wPJMECa975WMWsLyVZ/MyWE2hZvzuaH1kTzjAz4XP8OZtkVnbHdwA4msZ73TpbTdPSTIeg9vTJQVITkpFqihuLmiOuStqu0saXb3h/wSDjQqvnNY1GjNNjM3vkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2arC9uBf7LBsN05ErzvbRb1QlLiqzJWuznii/OFnPs=;
 b=sBJefi18IHu0VaSKEjZJlpv4NzcHkcaerKg0EKVp55GEagW4BAQhXrzL5cESQsfg8ZuQJnsBkXHYQ+wF11vFIC8oBK1rGseXhJOufhaQgoiwqAMQDrAeMR6KaC6B3TjIRpBFb9p1H3o397cCxIqJkbH9cwXoNbr5+HIJTnBnP5q2agBavCl1axhg2cveIVUqK7WC7bWHLkm6MqtWI0YJ9ot6DD44vrDRFuyZEAFFO/jcWKaQseb4PLyLKdM5G8rIX4LjY6YAiqxjTUzsUAFiQq/+T6rrprGLUebjKgKnowQuhftmyr4Psck5ZtgHibyovW9ZmFxApQ3FQPDqkwsgXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98616195-71ef-23ce-e6ed-0dfb6e10020c@suse.com>
Date: Mon, 14 Aug 2023 15:59:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 0/3] vPCI capabilities filtering
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230810191312.644235-1-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230810191312.644235-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f938e4-7df4-450b-ece8-08db9cceb79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V5YVmdejjRoS03lkN9b1gYllj6roGnA8nEgEbGF+2uiT9q2VxoiNKBFr+OLuBJCrP1q844oqWPNy3LKESDaA+V6rRHyDr8R9mRyvVy7brL+VTG+AcnoraTvEx/Vw0gGOMcZnWh9TXPSsF5EZwtY461gIznT46yE7mfwqpU+nI4Dylm7psg0nkUImrApDDioLJXR3QJr4bxwKsSrOfP/c+VGHpdEGXYZCy92g6lC06lQtpvEEPfK1MeeHX6u+/CcEZTdJTSkXr4j+FzX3rettlVNMe3CqNxbIiYdEpw5VSu9WzUB/yx6Q4Tfr71wLYBMGtsEKNAEiMl5DlARxOwphe7+ibFnIeZNN+aqySkL97UD70CHt9zyvMOUQij2kQ7rhCmRBRb51t8qGwwjaJKHO/xMhxaOKTiADk+bAV1fWi3mhBX3djqxnuDQgw+Y0rBNpqFUEn+1caCABY7mEwRFPGgO+0w4ho1afoK525TVT/OIErbIjPw61O/jHZw3+Dm7o6CCBV5AbdTOvfczEc1KpGCP7HN6+YEt+S7M9UEudcZufsNi0e+3ktQtsv3fnEiaiJ3LT2froxsAwBHUVYL5wPuDrKdzIjHPue6sJrPCwX1ftsW/zahwGs45AW3f/nHakdS8YddPAxDrBVcowOCoqtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(186006)(1800799006)(66899021)(31686004)(6486002)(966005)(6506007)(478600001)(83380400001)(36756003)(86362001)(31696002)(2906002)(6512007)(26005)(66946007)(53546011)(2616005)(38100700002)(4326008)(316002)(8676002)(66476007)(66556008)(5660300002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWordG4xeUd2ZVpOamJaeS93L1I0aGUvclpOUi85MzhUZUROcVZ3KzBzcFNH?=
 =?utf-8?B?eHhQb2laWEJLL2ljTVpETHNERjRjOEc1aVFXc1p2VUdUdDlpU1pCSmtLcUdw?=
 =?utf-8?B?Z1lrRXVJbkluYituN1Y0SVhXM3J5S25EUWFKd2NSRWVxQS9aS1A0RmNHUTZn?=
 =?utf-8?B?emhpblVFV2lxSk5sRXVjaUFockR0bS9sYkE5a1ZqTjd4VGViRFBIdWs3RUtx?=
 =?utf-8?B?TzJVeDhZZ0dvODNPL3BRRjRJanJ5Tm1ZOTVJbzhKQTd5ekpPK2wvT0dMLzJJ?=
 =?utf-8?B?QVJLeWQzQ3I5dElpRURmZ1JoWUFYdzlIUXJpVFdObjU3U0hHZWZ5Z2xONEM2?=
 =?utf-8?B?M0pqc3ZjcjIwQzZQcE9vMWdNTVdZN2VHcWo2ME1EVE1nNWhsWUQvWm5FRS9V?=
 =?utf-8?B?b0ttTEJPS3h3QmIzblp2UkJmYjZ4MWxpeDJhVDVDbW5VK3RUeTlVMXErN1gx?=
 =?utf-8?B?bHMzdGtWZDAvdkg0cXNNY1htVE5SZnNYRzRzSXRMRTZrVklqdG9hZDZFeWVx?=
 =?utf-8?B?cEl4M2ZnNzVMR1NQU2p1bms4OTNZUU90UFRMcWJvZE1DSzNrS2MvWW51dFlC?=
 =?utf-8?B?SGNvZGRONDlVVTBaSzJBS3NValI0WXg5K1lVRXVNemRpY3U4T20rYjExdmdl?=
 =?utf-8?B?a2VsUXovM3hsTmlPaUhGQXcxaFdSWEhIUlJSc3d3NGtwV3VwZTJ4MEFLWk5r?=
 =?utf-8?B?Z0taZlllMEQ5RmpJV3REOGtaMTA1ODNCMWRwSDc2TytkS0dyQU1qN2FJT2RZ?=
 =?utf-8?B?SHB0NHl1bXJKc3JGMVVkNjBBV0FZL2lSMVFqak1mV0w5Y1pCOWt1ckRMb1JZ?=
 =?utf-8?B?UXhHanJ2R2R6ZWZHcWplemxCRW1wVEVTV1RCVHJ3QmFORUhIcUlDWUJ5U1Y3?=
 =?utf-8?B?OHpEYThXQ3N4QVVMWjRXNTR5ZFJwV0dYbENEOTRXcnRabHBaRkt6em42VVV3?=
 =?utf-8?B?cGN4K2tVUXV1RjVnNExScms3eDZCSDluSjFhZEQ2b3F6MFlkNUR4YktFS1hm?=
 =?utf-8?B?cXAzZDd2Sy8zbzA3c1ZiQWRVN2xtZnc0TkFUOHFkSHhacEkzbUxRemZvbTNx?=
 =?utf-8?B?Zm9KbjFkTDIvSy91NCtmeGpNRmRNZ2V1c2hsa0J3aS9vY2FOeWhjaWFMeFBm?=
 =?utf-8?B?bHhTcnVVa3BzN2lqSkNIOStIS3NJZW9XeExLdUlaNDQ0V1Z6QVRXaDY5WVlK?=
 =?utf-8?B?bGw2RnJpcVpnU25ha29oaTRTa0NIZytKbnpDY1VtRUEyQTNNSklIRldKTHZP?=
 =?utf-8?B?clFTNWlZbTVpZ3Qrc1BPUXh6VFNhSFljajdJeTRaeUVoQmxqTjVaRTA2UDNm?=
 =?utf-8?B?eEZxcm10RjFsL2haSjU1T3FKWVZtSXd4SlJMZ2JzTWJGUzZCL0h2NU9vWWRE?=
 =?utf-8?B?c3J2bTVkRTgvK1BFQWNKRVlRUnBJUW1nWlF3Z0xNTjNwN3lIM2JHUTdVVHhB?=
 =?utf-8?B?NHg2Rzh4WHBYQmZLVjVwR2cvTDU0MzVLUEhVTWdwd3ByMTFacC9xWGJteEZZ?=
 =?utf-8?B?Ri90WFJyQlZxV2hTYXl2Q1kwdGQ4VW8rVnB4bzUwb2MvTkd0MEZhWS8yMVZk?=
 =?utf-8?B?VDhaWE1MTWVIZWk0MVNXeGtBTmJnN2QwV0xBNVJUR2doY0k5VDdBbDI2ekRQ?=
 =?utf-8?B?YnJtdFl4dXdnMU1GUGhzTlNUVUgxUk1tUEJOM2RCUlRmTEh4cXZtZW8rdEZq?=
 =?utf-8?B?aWhXbXJXcm1ORVBudExjNXZyeXFYUkgrQlNUMVY2eGU3Nmg5Kzd3a3dwMlFG?=
 =?utf-8?B?N0hRb3ZjSklMOGh6Y1VPUFFOUDVkK3YxcEdLeTBTV2JXR3hzbjByK09aS002?=
 =?utf-8?B?TDFPZG16YmpDRy83anVNUGI3VlY0RFpYd0d6OCtwbTRDdjMzeUNsdTc3d3ho?=
 =?utf-8?B?SE1TVFQxRkxnS05hMzRrckdPeGFFTHFkTEk1UFlyVXcwR21iRVoybks3UWgx?=
 =?utf-8?B?TlJodXpnSmh1dzVpZXdHWFMrRGFrUVozbkJTdU9EdVVDUStFdlVsNkpvdkwz?=
 =?utf-8?B?MncyQ2JUNjNsN3VxZHJZVE9MUW55cTZQQXRjZ1ZUQ0R2WTFPQjZKaGVWMkRt?=
 =?utf-8?B?Z0pINHQzVVhBd0l3YVlVMVJQWEJCMHZSeng0SFg2MmZlVlJaSGErNlpUZmNl?=
 =?utf-8?Q?G4mMjqjYOH4lBFWPoMBQFP1Fl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f938e4-7df4-450b-ece8-08db9cceb79c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 13:59:46.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO2HZGKUGx2FDp6AlMn+nyLgY+wWIyXsqqBbNkVWzUBbTZoiwjTzYAE3uZIuDwVHl7eCY9gH+jDG5opSRPKtEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136

On 10.08.2023 21:12, Stewart Hildebrand wrote:
> This small series enables vPCI to filter which PCI capabilites we expose to a
> domU. This series adds vPCI register handlers within
> xen/drivers/vpci/header.c:init_bars(), along with some supporting functions.
> 
> Note there are minor rebase conflicts with the in-progress vPCI series [1].
> These conflicts fall into the category of functions and code being added
> adjacent to one another, so are easily resolved. I did not identify any
> dependency on the vPCI locking work, and the two series deal with different
> aspects of emulating the PCI header.
> 
> Future work may involve adding handlers for more registers in the vPCI header,
> such as STATUS, VID/DID, etc.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg01281.html
> 
> Stewart Hildebrand (3):
>   xen/vpci: add vpci_hw_read8 helper
>   xen/vpci: add vpci_read_val helper
>   xen/vpci: header: filter PCI capabilities

I'm not convinced of the split here: Seeing the new helpers in isolation
leaves entirely open what they're to be used for. Plus besides introducing
dead code (even if only transiently), you also introduce cf_check marked
code which isn't really called indirectly from anywhere. Yet we'd like to
keep the amount of these markings down (in the final binary, not so much
in source code).

Jan

