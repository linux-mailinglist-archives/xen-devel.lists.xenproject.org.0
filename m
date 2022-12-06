Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFC6444EF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454863.712418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YLp-0003Zk-DT; Tue, 06 Dec 2022 13:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454863.712418; Tue, 06 Dec 2022 13:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YLp-0003Xu-AZ; Tue, 06 Dec 2022 13:51:13 +0000
Received: by outflank-mailman (input) for mailman id 454863;
 Tue, 06 Dec 2022 13:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YLn-0003Xn-Eh
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:51:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0106df9f-756d-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 14:50:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:51:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:51:07 +0000
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
X-Inumbo-ID: 0106df9f-756d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NN7F64TOvjTZuKcQ4TZ4hveZrFRIcbqfPY/BXMrTLWJqXD74wNQnZIqbxvrH8IicfW4PvJa1szoaGcJXJ8OW1zv80IbJLaFaLmKrE+cz95OGDchvRIztlZSEBts843jwwcx+fmLcJCuyILbPQaXYyb3uxKDyu+u+6yuYNM8qZjpHjOcAxUZRU5MYTLlEhj91C+waB7jtYrLfJ6ZumWU6PB2LIwm+PxAJ7p6jpZpmRuP38Hgmx502WjfpZVmV85691wE/t/XHu/b8+8iNkP+HeLHk0GeP5oEkiaJfuqXE3Yo49TCv7KogxdJdpRg+s8YpvWB+tndWz3YS+872AGonbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zitPA9vA+4VoArL5sjEXotRF1OCfzd/8VEUiklva12w=;
 b=ZDXAz/ljvF7ptLud/wI+xMkPOKKKcX+clq+SOjpHjk9snmKmtPqNQNF8SL4eOvpVtcRAC9eJv37s/dN5rKnY478T4Obsm7r8zmk1jd8Bb7pLu8YMssrFwvDZ5ESFxL/zG2AkOObxlgPQuWtOA+Ik1Ave1CFvSkc+jCxkA8XliR7JnpSVMIwY2CVQoivT2cmc/hBu37ZfPUToSrL3seaBlub/gV3UWZZW1ObSaIfz8+3mBHylap4RfM8/IPUNLuNVVIuCoiHFWd5MuQhqH7bhDobzmXBHytq2YuW5c/aaIk08p10qnnAcw13HK1UD7E0v2G0WOsdGBQ/YqXsIdVN2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zitPA9vA+4VoArL5sjEXotRF1OCfzd/8VEUiklva12w=;
 b=mS27SIWeCCux+AAcFpaxjr5kfzhDD9Q7+Ip3xRUMeirjUqKBbmOiz5uCBK07l8wkipfUFJWdmjjdC9Bl7fqKgLyjrY2o4KKa6hZ2C1Zweq+n+AA3e/2CDob226OV0ukzVq5FkyyuZUYmqfjCexpn2QPdmmkjVJzxz/69J9AgRGN2bWF66dJMyF96zqU4PcIn5qygRXDDC8I26AB62OH7QDtsYyZjySe45a3aUhAxDMMihH/XxayXAqRaWY7Nd95gqVVHI05nAolpV5XiXUM9QtQxa4Lwm6ULpyc7s6a8jU2WyEpohWViIdxKiF0bhWe+andt0I8S6o6fTforBALVsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
Date: Tue, 6 Dec 2022 14:51:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: follow-on to XSA-408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e6fffa-047c-4fc5-b56f-08dad790ecec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lA5rg3bOxJLuObpmZru/Nj/KW6w2ByP5wh3sHVlrSie68uFSziHHicGwHRwj7xsFg5yxDvkXp6HLr67IbTzOwJ0piATS1rZl/EVMKQfXmLJXn8ilVyMareoOFZq5da2EQ4p8n01Gn6vlPrxg8bGDYNTVvGPtY6KKBxax0uo5oeQFgqTMl+SlPVfwb1tbneRWGuambE8WcgMy9IxswkTRbGdqe/flyeOzggCyua/EJigK/oVa+tzTeVQgX55RqqJnowvIRTMz3orELBZDa0q1GJOqC6N3+SBOLwrxmJvbOZGS7wUy5jVktqcG3xh76VtU+Q9xZtERnRvt0VxZSLQLtCtQavwrpMMfFYga801GoUz5tQ3QMfUeEIFfejdkkXI25Or9ZBMQEKBtFTDbIMwwp0qnz73AMg2fEZSLXnBK93W0TH+Raz9y22tzz4GPHczzyLwmF7ejPqKTpUm4aqTAVvh0EKMg5ILaveWyuA+sz0n+NauxNZkjDUcp1pNHAG9p0aCVgchziIDANr3tpk6rnNRPptyJ4Lu7K2E+fIXZb6FDi+LCuOTZ59yyvMBcWtahfn7CzzijsF9S+7ctEu5C/IkidhO+gRPhoGPnzMVnuWH7wqNgYYKIyzDp+QBDF0AtXmRjBycP7E5OXMENtLyZ+Gtv3J56apcrsvxPUCLBank5W1Js/rVFW5OSaCPctU1X3Ssv2zC8xwJyHUkd7YfB2DxkrF4YScasGskdzfDtVJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(38100700002)(36756003)(31686004)(86362001)(31696002)(2906002)(41300700001)(5660300002)(4326008)(4744005)(8936002)(8676002)(478600001)(66556008)(6486002)(54906003)(316002)(2616005)(66946007)(66476007)(6916009)(6512007)(186003)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2FwaXBsd1NlUXExbHNvR2UvQUoxOWtKTkg5Rm5jcWdWeUtGTnhKRUxvWnkr?=
 =?utf-8?B?RzBFZEpUSTFaVEw2MXZra3l2K0R4N0lua1hxMENqaGl2d3N4OFdXMk5Ua2tQ?=
 =?utf-8?B?V1hBdDRKVzkwNGZxUVdTamZ1MjVvVkwxdW9lQmFVYTUzbXRYZEU1N0xXMzVL?=
 =?utf-8?B?eXN5dFZzaU1FbC8vYWdvdFdoT2pMODRzMEUzbXNFZEdHemFlOW91MGcyMjdN?=
 =?utf-8?B?K0lhK3kvVHdEVE9uMDhSTDNUVFJWWFUxVzFtRm1ST0tqeGRqMEQyc2xvaGg2?=
 =?utf-8?B?WVlyaDdDblhZMGZxYS9UaHBHLzFDNFUwQ0tJemFaMWhMMWtkK2JoUEhieUtZ?=
 =?utf-8?B?ZFdzRytvTitFM0FuZWlINUd5VnZsSnBqL096NmhlWWVxMFhucTRmTUJrYmQ2?=
 =?utf-8?B?RlQ5K3lkdmhMYnpWSnl3QXhmVVQwa3FTdTEwKytTRTVoZkd2TkF1NGtpV3hZ?=
 =?utf-8?B?SjJFQ3MwMFA4SVNGZnAvdGNSK25BenZmdzRWWkR1dHEzQ0tYeE9nNWtHRUFx?=
 =?utf-8?B?Mm83WWt6L3pPVFR2WnJJL2gwRVdHSm5sbUt2VFhYU1BKYW1EdGoxak50bFUy?=
 =?utf-8?B?WGRFZWRzMVNiclpndERXV3NCUlRtVkRUOFN2OFo2NTkrVXZSbWlDWnc4VVJu?=
 =?utf-8?B?QnJuM1VOSWtsWmc2a3I4dll1OU9hcy9NOGpYbmh1bUxXaW1TSjBPWEtMTlFr?=
 =?utf-8?B?Q2g4eFlZdDRScGQyNHU2ZjB5ZjFrVGJ2WGFsWXAza3IwT1EvcEpEckhuYmdJ?=
 =?utf-8?B?akxNWVIrNVliZjdpMjJWTG1mbk0rdVYxakIwUW0wUGRRbXNnTHUxa2RXc3dN?=
 =?utf-8?B?NzZyTXFKOGZsZitvUTBnaFdGZlV2N21RdmowQm42RlgyejRHSHBHaUxzejhp?=
 =?utf-8?B?cWVRNThSRTNTMlYyb1lwRGVXOTNSN3VMWUhvYXRuOG5yd0s2RkR2a2NUYkpQ?=
 =?utf-8?B?QXJOSjBDeTRiT2dRNTNiUFR5aFpSSzROM3FuQU5hSGo2Y2xiTGhmM1pueXFs?=
 =?utf-8?B?dlRKVkVORmk1bnNjNWNHSzlGUDhOY1loTjJlQXl2cTE5amUzb0JZRmZCMkJN?=
 =?utf-8?B?SUdGS1lqa1h6SHJicDBSMDB2SVRPQWdkQnBmN3V1Q0cwS1c1OHdjVHJkUGlt?=
 =?utf-8?B?U0J4N21ZUGQ1bmVTTW41cjMwTUNhdVIrUUxUVjk4amFqVnVoT29HVVYyYmFQ?=
 =?utf-8?B?OCtXTm9jRktMaTNPWU1iYXA2K0VUaUNmY1VyQTBPYUhxL1hCaGFqRy9rSDY1?=
 =?utf-8?B?TG12Y21kb2E0aS83UzZBb0dXbk4xSW5CdlU1MTRVZFFmREVvZG9sdHFHeTBR?=
 =?utf-8?B?SjhWbGw5UHNtWmtzNWNSK1JBTlljL3pGeWNQMjVSbnZaMkdsOWRLN0Jwd2Q4?=
 =?utf-8?B?UDNGcGV6SDBGWm9QYS9nendYOEhRT0FaS284Lzl3a1ZLSytvc1lMRHlRbGRL?=
 =?utf-8?B?T2pYWTdkcHBlMzVLenhsTEgrTmNlM3FmQldSMDFvR2lDWGZ4bEtTanNBcWds?=
 =?utf-8?B?cGU0Ri9ZZ0lKZm9RVkVhMElMMEVwRk1seEhrQ2xUUjZwQmExQVJhaW9mWTRN?=
 =?utf-8?B?SE5Wblk3SHIyR1ErRjViUkZvRFpNZnRKc25GaHVwNWxiMjdOajFobVAzTVcr?=
 =?utf-8?B?RXpDdWM4ZmVtUFZ5UFVCMVRpZ1Q3WlExVHFIbjNiQVkwYm5TUGlxMUkvV2I4?=
 =?utf-8?B?dFRCUmhwU0NPV2FuTGJTWWR5b3UwMkE5cVkwQnYyRXpCRkhSbWJVL0x2QkY2?=
 =?utf-8?B?bnppYm91L1ZOdTRxQ0VQcGJuVFlVcXJMc3k3MmxpODJ6RjRBYi8ra0c4b1FH?=
 =?utf-8?B?WEJkSE5lUEtNeXhlVWJ5LzFJQ1F0a05ZNVNCb3h3WDJzVnM0d0NCSkx5VFp3?=
 =?utf-8?B?ZXFFdGxFdmdFaEJlOFp0SzEzd2NKaGJRMm53bmkreldJQ3MwK09KbDhLbU1z?=
 =?utf-8?B?RTViVzZSbTNHQ0dON0dKaWQvOU5MakJWUVQ5ekgzeGo4a1pmNGRMY0hFcFND?=
 =?utf-8?B?bERnak12TW9wci9QMWJIMUhhd20vV2dwblJyVnpPYUV6R25UWWQwSHRIaEN5?=
 =?utf-8?B?dUJ0bmJISVpmcFZacGdpTXYrYnZsSkhxdnJpRmY5ZlZkVzhQYjJaTVp1T1Jn?=
 =?utf-8?Q?K6XqLVD7y4EaSR5uILqDV3EKv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e6fffa-047c-4fc5-b56f-08dad790ecec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:51:07.8107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3T6JMZHx4TNQvvzhSx9xLazf2quMdwjr6Gvk3VHsuZfjbTpO29Rl1B+iSfBs7q64WyNEi9y9Vp4FIdHLB6Lcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034

Originally just a single patch (#3 in this series) plus an observation,
this has now grown to five patches, largely as a result of discussing
both.

1: tboot: drop failed attempt to hash shadow page tables
2: mm: rename PGC_page_table to PGC_shadowed_pt
3: mm: PGC_shadowed_pt is used by shadow code only
4: tboot: correct IOMMU (VT-d) interaction
5: tboot: actually wipe contexts

Jan

