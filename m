Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7B77388F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579319.907255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTH3h-0000TG-RY; Tue, 08 Aug 2023 07:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579319.907255; Tue, 08 Aug 2023 07:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTH3h-0000Qj-NG; Tue, 08 Aug 2023 07:23:13 +0000
Received: by outflank-mailman (input) for mailman id 579319;
 Tue, 08 Aug 2023 07:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTH3g-00008I-0u
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:23:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e035360-35bc-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 09:23:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7970.eurprd04.prod.outlook.com (2603:10a6:20b:24f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:22:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 07:22:55 +0000
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
X-Inumbo-ID: 6e035360-35bc-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEl6I3Slo2ryws2bd0Uq31f3rK+9XVcz7jlrwSlsUgCO2VscmJ5/5ZfogFNbzUZl42DxXskh3JHiz2pmfq5GRXAMBtlEfRbhZh5UIgeRvr5EnrzYF065qYloDCS1iCKUbX/VCuuwzxQwfLr9PEToWaolgXqgaVUqsU20wnrmLsDUOEfCQAnnRmKSHlXNQ15PA7DHJfmxJ/0dpzovAOE2XgNZnY19vg0ilrqO+qyrLEjapgMGhXwuhZXr7LgsXb/Qkk9SYhOYEvn7dkzXaNdPJ+DfFqW+Lz8WVi0UmdFMixgaHCeZ1xi9C95IuzQ7SEJiKZBrAFvyZdlVVcejVtcLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsrWtmWG7rBGWqtN6Nbj9lITQcyNwJ9A8pnEseQgdPs=;
 b=Nj3N3aDcYnIligpdBgMFIh1wrwRjfDOa331egtUNd7r44OYCnJNmz5oMZiBSXmNpg0QJ8i0vUMsBqtZPbuF7iIDbyEa28qZ8SzwsvtMhzTwO8Z4c085qrx5m2w7BA2IBRxnGwnGSmmKgmAXVYIrLbGfOjyLsPzSLHS4HMNW8zLONW9lxkriZXcHlUz5+Cl0rwzZ/xJUqZHUdd/Pi3HLH7wUbQET/ndJk98/Nmz++Pp8Kg/QLQ8AE9UkXVIEiuiVHZ6dzjKIdUUSzaoI/F1JpLwkHk5lizgkjY5r2DGOvedu55Yr02Pns1E5erxZBWQlACrbkHQLtssO2Wvju05lqUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsrWtmWG7rBGWqtN6Nbj9lITQcyNwJ9A8pnEseQgdPs=;
 b=OF1Mkd6K9a0N5BSXhN/HwktZuTZUw0p7IOAkv7G9P8eK7qw5Q6eQvlKyJFtU7OhxGxNdFavOumFyFWpmJ9QyEdIK2HAmJwofeqPIYlwlcYLeGg0n4CUWGOPFafqJRVk2UyhVjXLWGm6LIAacyWU5jP0qE2T0EA0XeFvLnh+PlpP9yTxv0cU2oZqRSvasfRQtAuqfr9QN7JGArHAvgsDTzEXsUeQYvllw/YnPwU8XSNVJmtAFi8+qtmmdBReRlkLsSATWO2MqYw/NtVq3NjGD2W+AcvjzD6LEFavQUWkmJV44mFfcuJ7G16rkCAehAUGrgpI4K+5mBMkWdOPbRdm9Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17842357-d26e-3c57-25a7-76c09a8c3733@suse.com>
Date: Tue, 8 Aug 2023 09:22:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/cpu: Address a violation of MISRA C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <8536f54b708a1b3a906d14a63958c2e6dd0d034e.1691427640.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8536f54b708a1b3a906d14a63958c2e6dd0d034e.1691427640.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: c52a5332-0fc6-49eb-bd28-08db97e04905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TWk3mi2LG3PHxoxbK1LYzTSO1RlFRv1oDjn+Muf5Wq1JRTIb2V4Ry6Ao9im1grXbD93ewRfPd5JuAUDbzuQv/hL5UyqBHMq1//jD2prbU+qi8u/E9gL/D29RfdPq4fH1Z0VPgI5fr2CPyYuu9+AgxApbjidivs4PbJYa6tKyxpt3S86B6ys7Z++1N+O+HKi/FR6ID4Tz11chNP1fpak9YHxx09JN5TJY6Ctix1L0z4SR39I3eA99nppR/YDIi0IJwZq7jtAPjnTzUU3AZMB8WnAnSALvWiHImwX8uwv0j2oIXTgPfOAasjGMwWcsLvyz9DpdE7R6DZggRcuN5fiq12ZoUp19RRQnQOjxXXgv/UD7IX9Vh0yTkCRWvf0hrIEfAkgPTg9U2hHACi2mgLQkD+8m8Rs7+B/JQB6S28iomYt2fl2HL/9fuCvr+8aZ5y+yWa50gJVBtAbxxZltXKuuiDYTRWwq0m3SSw/GV47ZUQFxO1MyHa6YEyNXVddsXBvWzBzDKnKDgLZp4hRcQzJ2mto0/chjA7txr5JhNpY4K3DabAyx6MXRUybjn9GzToN9ykZtjVRMnwuiVkUNw9wLMJ849u1L6Lva1GEoujJph73Y63o2blmukJEyYhwkk+zmp+u7/t1zkqbnmqOjLRI+omz99aSQA2PtLxRqNCIBUBxfwqIuToz8BWkZipcltlCVeOq+8UPUepXdzYlVg6Adxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(1800799003)(186006)(90021799007)(451199021)(90011799007)(6486002)(478600001)(83380400001)(31686004)(2616005)(6512007)(26005)(53546011)(6506007)(8936002)(66476007)(66556008)(66946007)(316002)(41300700001)(4326008)(8676002)(4744005)(31696002)(2906002)(6916009)(36756003)(54906003)(38100700002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2pWZnozWHJTaTFERktCWGJTcmplb2JrZnd0V1dZbjZHM0VvUTk4dFFkRWps?=
 =?utf-8?B?WW5CZ0NMMVpYcTBJSDBsTVFHRlhMZlFXdnAyWGM5MEVabGFYeURzSjBLRUxH?=
 =?utf-8?B?RzQzNEtMS243SC92ejBBZU9ONWo0cDg5TTkzVXUwTk1SYkNiaThJdXZqMXJL?=
 =?utf-8?B?VHY2NVpDemNNMkwwRGxEcGNBQlVqTlhraDZnQU9lcGtObXRjT2NYVHVrZEha?=
 =?utf-8?B?NExka0RTNExOdHZueDlYL0k4TjJQUTlKbnFaSEluWWl2SE8xNk5kcWwwOEpT?=
 =?utf-8?B?R0Q0cU1rQVFQQ0tzVHc0eWJMdzNnaFZETy9GR3pnNUl1UDcreWxzWXpTUUdv?=
 =?utf-8?B?VGV0M2JCOGZoZmtleWRaV1g2bS9zVHdNQmFSeld5WHovMHpDbUEvbGZaVm1o?=
 =?utf-8?B?dVRSa1pObU5VOUNhbEY3OHVBUWtDc2pkc2JaVFg0ZFpPdGQ1SWpZdU1EWmdG?=
 =?utf-8?B?eFBLNHVObE9yai9rQmR3YXBLMStlM09QZ3NCelUvYXpYZkNNVjcrZGMxYzJx?=
 =?utf-8?B?U0dIM2JNV1dyWHV4YVRoVmZKTFl1d3RwUWtvUTFWb29pbWRYS0ZQRm1wMmZO?=
 =?utf-8?B?NkpQVndydUlzcjRrY3gxUnZ0TzBZZzhmbFJqUTVjS0g2cW5yeDJkR2RXdzZ5?=
 =?utf-8?B?b1pYanlLK1VYcFBQTldDanZnWkF5UzI4ZEpCbVphRjhzK1FjU0FEWGQ5RFM1?=
 =?utf-8?B?ajlMazVjZ3pPcEFaMEZ3L1R5NEgwczVjZUhudUtab2RpOEsrOGRybjY3TXZl?=
 =?utf-8?B?VkZwS3JWRG8rcXJSVWExYi9BNVZJU1A5ZnpBSzd2VlNGYXhITDdMSExnaUg4?=
 =?utf-8?B?RzFNYW0wZldQTktGSTUvTW8wWDU2cFRPWURxcXNKaHZWOUpHVXhMK294OEEr?=
 =?utf-8?B?cHBkbDVyUy91OVNqZUFsNnFoRHFCdTNodDJEQmhySEZQY2pNcEZlU0lQVzlx?=
 =?utf-8?B?N2srbEVKdURnV25NakVXQ0NFclFFM2hqRTkvczdIMW5lWW1IL2FVeXB2MXpQ?=
 =?utf-8?B?M2t6WGlWcVRtVi9IK001N1ZzQTAxN28yVGZnYTFMWVdEVWZNYnFLQ1VlSXpO?=
 =?utf-8?B?S0swVFZodk1LZmVGcXlVRDY0NFJMblFibWQ5TVlybGFtaUdPSXJtZ1NweHY3?=
 =?utf-8?B?TEoxN0kxUEhXV09kUDBmQXFGTVJCbmFEY2NGdmE1akVXOTlvNWVacWk5Uy95?=
 =?utf-8?B?T0lTQ2VxdzM2SW9ENU1JeU1va1M0dXZucXRZbUZ2dUNnUXljbzVFYlhNaG5E?=
 =?utf-8?B?ZnIzVzRkL2ZiaEo2V1k2NFRmdmI3Y2tOamMvcE83VXkxWkZnSTVMMHVqdGpP?=
 =?utf-8?B?Z0xUaTFVUDlHVzZXUDBTc2FkeWFxV2p0ako5T3pPSWd0SEtneTZ3ZWZ4elQv?=
 =?utf-8?B?QkdubmRCcEJWaVpNeEtkUERNVkVjL0VtUzlLcHZ3RWVaN3IwSW1MRnkydjJs?=
 =?utf-8?B?Y0hpcFN5dHMxbnNtTkR0Q2VJMHBhaHZ6dXd2b3RXNENrSk1JaUx3UFZYV1BT?=
 =?utf-8?B?RG1lcTkrVzJFSEpEZWoyeEVjMjRTZEwxL1RxNEdQeW9vbFNqcENmN2lucDZ1?=
 =?utf-8?B?dmlsZFB3RVh0L1BhK3N5ZWI5ZndTVEJHV2M4aGlaZmpxelRnUGhxOTNxWUVw?=
 =?utf-8?B?VG1UaDdCY2N5b1ViYnRWTnJpN3BWcHpsTFJONTlkS3ltV1dwZXlmK0RWODYx?=
 =?utf-8?B?MmNsSE1ReGlrOXNad1lFdU8wNVFzZXNqbWpWQ3BsNmpJQkZKMnpZS0tZOTFS?=
 =?utf-8?B?MHBzNHpJSm1LTkxhMDhNcGllV1hWZVE5KzI2OERWb3k2MlBWREFnWCszRVht?=
 =?utf-8?B?a2ZXc2lOWjMxNmFBZ0VIQXMrTFlaY3hjcVpDYlAwQktCN2VYSWdnVnhpbVRE?=
 =?utf-8?B?ZXFORXVxcDNQMXFVYmNLQUVWbnlvejliU2dDbVB2NlhyclZYRHMraktLZHlM?=
 =?utf-8?B?U0Mvbk5SUEJrVk5zNjdDbmtCWEsxdFlpNlBaaUJxdk84WkJud2ZDWitncGJX?=
 =?utf-8?B?Mng1WndDdzRDMUJNMTZJOVhwcXRFNnMrU1ExNlhYMHFNdi9oazdiUWpGVVcx?=
 =?utf-8?B?M3dSc1I3NlJrdS9odU5tL1ZpZHpOemRXYm1BYisxcERhRnhsU1BRRzRmb3Zk?=
 =?utf-8?Q?Adrw+frJewxpote7DZuoOrygj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52a5332-0fc6-49eb-bd28-08db97e04905
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:22:55.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuSGfblazyc8fH13DJZ4WkBl7eNOBOCaUm1NEqx+Sa5X9iomLMl/TemXdFQVLmKDq7SN716cQ2JPsi5SVMw0+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7970

On 07.08.2023 19:02, Federico Serafini wrote:
> A missing change to the type in 'opt_arat' declaration introduced a new
> violation of MISRA C:2012 Rule 8.3 ("All declarations of an object or
> function shall use the same names and type qualifiers").
> Change the type to restore the consistency between all declarations of
> the object and drop a further usage of 'bool_t'.
> 
> Fixes: 202a341f ("x86: Address violations of MISRA C:2012 by replacing bool_t uses")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



