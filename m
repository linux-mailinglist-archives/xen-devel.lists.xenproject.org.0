Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42C7FB906
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643048.1002924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vxb-0003Jm-PB; Tue, 28 Nov 2023 11:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643048.1002924; Tue, 28 Nov 2023 11:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vxb-0003HM-Lv; Tue, 28 Nov 2023 11:08:59 +0000
Received: by outflank-mailman (input) for mailman id 643048;
 Tue, 28 Nov 2023 11:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vxa-0003H1-77
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:08:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 866267cd-8dde-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 12:08:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7517.eurprd04.prod.outlook.com (2603:10a6:102:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 11:08:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 11:08:28 +0000
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
X-Inumbo-ID: 866267cd-8dde-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+VQO4LI42fKSCYUagQEVvusVHyDhHZXb8PA+2vMvYaInmLDxCvlboYl3e4Bds6yoP7ub++SvL2L/vL44rMK3x15X6oVCG4oEKqtJJyB4K/xjQYG0kDcVG8ksyrxlgJUiii7b83GnGVb/gW3aDYK/Co/8ELxnVo4ASHFv1OHk897xBgzIINff8oZJxzFeJKEW1Nt+MWLSwbgRLIO34b/OEt/I/cmRzaTEBKG9iJvCWpw5hevCC+NCD2+Y9Zb0XUJRDoxUm7OvTNlInLmis+27aS51pvIYelVQZTl0sSqPSvs3V1blIjhAigtw92Wzl2Cqap69Z6jgnaXoi39n1VxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHM640CL0brm6XLhH4Ah5+FySsM4Ce2r9bQ7B4C6trc=;
 b=XCxNXvNZ1n8W8jwL6DmUpsSWkMw5VNRHEZOg+R26z7bIc18hxIyn905k6wIlZaPx7sL/vt9vavBmfgX9MRmNXDTZJFp5x6vfv46WMPeyQGySlO96bUoMYrAWvO5wDxEKVnrX7QVsdFO0/zcwozP5PIi0rkgyvpsN9aC/hQTGFnebjf5cHpIV2cM/mQLFAfQlELlwZiiUqqzTk/DaSuK02eymOMT2rhjDbd2CcI8PUsz/2no/X2iZZ6YUdiLP+0d+4hRtXQK7BlKCgSfy46gHgaldgOMD/K9ABA5jv8oMAOMg2NPNMTk8oqdtUjXodvOeW6BxiXmWg168vcX3aDOn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHM640CL0brm6XLhH4Ah5+FySsM4Ce2r9bQ7B4C6trc=;
 b=YE02Vr+RuOBHOGlK63sTh3T8PXTVSgz5/62gtYSjeKbvPR9SFF1A0J+fEo/Ey3AKJTwtzR6KabU4nqIgKfwo8urK2FUW7SuJw7ZGk19qiFdhIS+N3vjTB7fj3BfmdLbpkRVqMX7542XiaPeANJBkjbknqcQLZTPti7MjnLCucmMgXH51m+azYWUgGqUf/qa1CsRxV3j5at41OK+CgxvbDdZxNbE4ltq/nN7hqGnwT09brDNMsc/QlU5XkMQagaDiq3Lj6/1lm8IEhs9MQLG0mzCzEZ4Dgm4nNurrfXnY6rCIxk7MU9Eh3i+PD+Wwda+fBDQae3Dgd0gdRKrARZkdFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5aef66fc-089b-4a14-bf35-96afe1e06285@suse.com>
Date: Tue, 28 Nov 2023 12:08:28 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/6] x86: introduce x86_seg_sys
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <e13004ac-22af-411e-a5d0-907a2a0301c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bfe7f6-8e38-455a-440a-08dbf0025975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/vcVKHjF9uIOkr6b/Vw76vS+24YjAfoXCurc6mC7rEc16WK/ePHy2fBypXwuw7KTuBT8imyZgrZyOyXBJ6vjXDXYbclNCXsAZ9SM2t6JD3YndQ61MU5dVjZwwH4EEZaZZ+1EAKDPWivPHPFHYwVvUYiK8raqbKrPjS3guaQy4AgXEw8TRCNb7HDsAdl+2KQXQBJlh0RV69NEd2N+zebuO+jhbkPTlnx3fCVDt1sRJ762nbCPGIWCuvPSwkmhEFqhnf6EiTYeysFm6BIjkj8jRPY+lr/ZGR6Ah7BUnUvhafzX7wtq96AgLjNpvFGoKz1YtbM305KoeWg91ObjZOGHZZy+Bz2a3hWJ1+yEA3vSj35T7symO2Z5xPcVUsKSP7Mw8h+lRE2qPNSleAxlRqwxMD6O5ZHJ0O78Jycp3GLZE4td3StWcdgPNNTgNhTOmo8c/Znzy5joOIBDNlYgdknCdL7Q4uu/tWYkPx+NoG+UKeH3UeZP+BwrcmAvLAPicmLA0ExDhe7XPo2SuZnsL1m69mryFm9umQeHuP2Ntf2DjPOVcZcKiRIopTrSEME7lpnRSy9kv4x3ZiRGTEMdD53hpwX3JQ1AueFOYtjJcSwh2Jy4syrksa4b5ZhYRovTyAnAm/rkoF+6ldBg7WMoGOhVKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(86362001)(31696002)(83380400001)(26005)(6506007)(6512007)(2616005)(31686004)(36756003)(38100700002)(478600001)(66556008)(66946007)(66476007)(6916009)(4326008)(6486002)(8936002)(8676002)(5660300002)(2906002)(41300700001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZzd0p0c0s0WHlxTDNvZVRsdVFHQWtURk4wOCtqY0liY3hURHlrM08wOTNY?=
 =?utf-8?B?OXBXNFdPblYyZmxEbjlpZTNlNU9sbXVjVWR0YXZpTXQyU0dpMitVa2x0VXB3?=
 =?utf-8?B?a2JiYVNnMk95U1BWQisxeGQyMkR3NVJVeFp1dkNRZGp6cGt0YStjNHdZR1JV?=
 =?utf-8?B?Rmx1WDF5SmM1UGphSmtZY1pwV2IyaWFzZGJkN003K3hIMy9xNllZQ1JNZkJO?=
 =?utf-8?B?Z1RSb0d0V0RTOTVab3NwT2hGZVNuWUxwVnJLa014MUFXZUVXbStMbUI2QndI?=
 =?utf-8?B?Y04zLzJKOGJXdVJEYUpFOFQ4ajBZNlE4SEZYZjA0Q0ZHWldTRDE5d3YrNkVh?=
 =?utf-8?B?bnRFZkt5MXdESVlHU25XMklPcFFxOHhiQ2IrcndIVGpDSHZ1azRKV08vMlQv?=
 =?utf-8?B?d296K05Ec3BieUo4OUR0TTI2Z2VyV2FMOCtqcDk5RGk1OGdtbmgxV2ZsWGZH?=
 =?utf-8?B?QlVjT0FBeDlVeTZ2SDgwL1FVVnZ0SHlZcGkvTHpIY2FqZ3grU3dZOVkxVkVx?=
 =?utf-8?B?ZXJaemhHYXhJZUtNMGpKbHNPcTZWUXg0V3NpcVFmdDZoSGtOMUVtMjE0RTNI?=
 =?utf-8?B?SjVDZXpCSm1PYjRFMDhoRm9yMlNxTWdtNXJDWGs5bHEvZnNWcGxOdXZOZWtP?=
 =?utf-8?B?K3ZTTE1qL2xQdlpDZnR4bFR6U1pvZVJOMXRpT0JFdS9SRjB5Z2FIRVVwdTRY?=
 =?utf-8?B?bTV4T0VaWkMwMi9TdWs1K2JZQjVWNUxsbTlFTnJ3cVAzendkaENsUlQ2SndW?=
 =?utf-8?B?VXlMTHhscVU3TEpBZWM3K2oyd1NGYXNJUVYxR3VRRldmRFpiYVhwcnphR2tV?=
 =?utf-8?B?OUFHcnN4aVVqVmdiL2FPdWNjckJicTBIMkZ3M3FXQnE3SytXejJmdStiNmE1?=
 =?utf-8?B?bmQvRWx5eVlnL1MrODJTaDh5UFFJZVhyMG5MT1pBczBRSDduLy9ocGx2Q0Nz?=
 =?utf-8?B?KytZVVBGQlhFR2p1MkZqV1FsV3dYRzcvV1BPbGcvWU92QXBtaldBWjJjNjV0?=
 =?utf-8?B?VURoWER2SnozNm9XS3c3MHRHNS9NMVVnY29CZHkvbm5jci84QmFsRFJFRFhQ?=
 =?utf-8?B?V1Y0K1ZuWDB0M0dJS3ZYVXV2bnVHblcvK09MUlVqUkRpTzFLYno4WDZmdVVi?=
 =?utf-8?B?L2sxRWk1MXA0TmlaeGYveEtoelBzS1BSOEtPN1BJV3ExR2ZNd2ZwWDNSZHJ1?=
 =?utf-8?B?blZKTXdYOTRaODJmR1dVVmJsMFg3QWhGMGx2V29xcHZXMkxsbTNlRkMyU3hH?=
 =?utf-8?B?T1pVZFMxWEszVnhjWHpKbmtuOHFpV014K0taajFiZkMyUGV5TUNGSHY2UnRn?=
 =?utf-8?B?dmVHWEVXNzI3T0IwUnZ5ZTZDQm5HVXVtRnNTeTB6M3VURWF3Q0NEWTdLdURK?=
 =?utf-8?B?bEJ3eFRSQWdaSHFSSUkzQjlxZVVHeWRGcERyMEdQT3MxTUhZbnBCcW4wWkk0?=
 =?utf-8?B?SmVGdi9INGR3V2o4Zk1RS3hvQUwxMVpFVDM2MjNUdDJwV2ZxS3ZFb1FOdFJr?=
 =?utf-8?B?TmYzWWowVlNwYzRsS3BFTGFGRU4wQjNhbEZvZkdzbUFSQiszM1BhMFhsZHN2?=
 =?utf-8?B?RFpMNUhIMEt6MmVCWTE5SHFra1hXWmx1TVFTRVRVR1owbUVLM25UUHVOcTU2?=
 =?utf-8?B?NlhkNEJFTUJkeXo3Z21JVElRUWRvUExYRWc3K3hNTGlNdGJLcTV5Wm5jeURZ?=
 =?utf-8?B?UmU5QWFWWmxsYnhRd1B2bDNOUEV2eFZ6SGxLTW1RMTR3TnYzR1FaeGZkRlBU?=
 =?utf-8?B?VkE0ODVuYWVNWVdGQkJSRUxYUEF4UUwrT1NhaXFvem5raG5tZXpBNzYrSG50?=
 =?utf-8?B?WVZPNzQ2cFNUanBRZnlWQ3hmZTlzbDdtTTdWTnIyRGFxaXRWbWhZMncyY0Zv?=
 =?utf-8?B?Snk0WEd6YjRVVEpQWFdSQ0d2NGtNU2hYQ3dFSGJ1aGNrN1BJUHU2RzlnZVpO?=
 =?utf-8?B?Yy9YUENrUlBMc2tUOGpVVkY5WVBwRk4zckdxOW5DRSt5c01POW85YXpZS29E?=
 =?utf-8?B?K2VORHhTMDBkVG53VW4wc3JPQzFMeXI4YkFxeWZKWGNCOU1SL01uT1Y3VUV4?=
 =?utf-8?B?U2k4cDZPL3lacm5lVHFuZXp1YjlGU2ozWW1XditveVZZamE3UWRMcW43QWw1?=
 =?utf-8?Q?VQmVNDr/cqv//rxbZYbvuWtXH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bfe7f6-8e38-455a-440a-08dbf0025975
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:08:28.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3wNGu8vM2mZUcrm5GHun9nsSSeB4OGkSrr9HSSvKvvskzFPRNP1T4R/xA1OqD28j2A+7Y04jY1kkbYmwY12cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7517

To represent the USER-MSR bitmap access, a new segment type needs
introducing, behaving like x86_seg_none in terms of address treatment,
but behaving like a system segment for page walk purposes (implicit
supervisor-mode access).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This feels a little fragile: Of course I did look through uses of the
enumerators, and I didn't find further places which would need
adjustment, but I'm not really sure I didn't miss any place.
---
v3: New.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -603,6 +603,7 @@ static int read(
     default:
         if ( !is_x86_user_segment(seg) )
             return X86EMUL_UNHANDLEABLE;
+    case x86_seg_sys:
     case x86_seg_none:
         bytes_read += bytes;
         break;
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -837,7 +837,7 @@ static int hvmemul_virtual_to_linear(
     int okay;
     unsigned long reps = 1;
 
-    if ( seg == x86_seg_none )
+    if ( seg == x86_seg_none || seg == x86_seg_sys )
     {
         *linear = offset;
         return X86EMUL_OKAY;
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2581,7 +2581,7 @@ bool hvm_vcpu_virtual_to_linear(
      * It is expected that the access rights of reg are suitable for seg (and
      * that this is enforced at the point that seg is loaded).
      */
-    ASSERT(seg < x86_seg_none);
+    ASSERT(seg < x86_seg_sys);
 
     /* However, check that insn fetches only ever specify CS. */
     ASSERT(access_type != hvm_access_insn_fetch || seg == x86_seg_cs);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -749,6 +749,7 @@ static void cf_check svm_set_segment_reg
         vmcb->ldtr = *reg;
         break;
 
+    case x86_seg_sys:
     case x86_seg_none:
         ASSERT_UNREACHABLE();
         break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -43,7 +43,8 @@ enum x86_segment {
     x86_seg_ldtr,
     x86_seg_gdtr,
     x86_seg_idtr,
-    /* No Segment: For accesses which are already linear. */
+    /* No Segment: For (system/normal) accesses which are already linear. */
+    x86_seg_sys,
     x86_seg_none
 };
 


