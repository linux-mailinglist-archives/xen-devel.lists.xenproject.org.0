Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C087FB339
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 08:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642761.1002454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7st6-00016r-9d; Tue, 28 Nov 2023 07:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642761.1002454; Tue, 28 Nov 2023 07:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7st6-000142-6I; Tue, 28 Nov 2023 07:52:08 +0000
Received: by outflank-mailman (input) for mailman id 642761;
 Tue, 28 Nov 2023 07:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7st4-00013w-M0
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 07:52:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0524169e-8dc3-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 08:52:04 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6951.eurprd04.prod.outlook.com (2603:10a6:20b:10f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 07:52:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 07:52:01 +0000
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
X-Inumbo-ID: 0524169e-8dc3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSLPDdi3/lEphYG6n+uQpq5nw/VkQrCP9hwdpVHEAvPX+UkCzY5SEhXVqDWkrj8T0S8lkU/1edc51GU63N1Q68912UGL95xoHVXoXQx/6HJFwlgkjOeYQzJf9Jz/9Qb1dvB/RBRTczdLc5/zt8LQNSXFqkAdlWF11MtBpzVEKevDPeN/LquwHPxRpI/rRIwmKck2+VcAcXs2fXzp0/Pbbmbu9+XN0iEXIGMFkOaYeutPgSRlGuKgkhv58L+1KSR75fDEVJ5oPETHbLE/MUskHkPZBDAXp98ssqYgDxzeuN3GJG7oa0bj//ylHetvz56MCZLmWxjDeK79n+FkhgYiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yi5bmKT3wuiKQN7gsNb/0xQNXTB1/Uogrt7+38JcDYI=;
 b=ZD3qaZ7EAPbblBaxugZnzVn7r8XzWS/pgdWbOUB/y6CiZl45mclTkHHugnrvbhieiiA90ZHRE/lTSqc7ljl9ClUc9oKP2WSTaiBjearP+7mcj9hPdsD7dJ3PjZGHAGA/UIIMgMkNInOXaeAcFpGWA8hpgi+2biIK/RT+QY++wlNolBBbX2KDkQ6TAEntQ9VicFEA8xaHw9Z9M33LG2VxSa4iGeY1SgNpABZQwgHl9aKYCesH78wluNv3Q9Eozr5FU7f9WFPy3cfz+POyzqfL6hdwQyHHk3tVE1ed9qpeLbDOOlA0Ww/lnTQzhwjBrSgJnPRqiYJVb1/cAgoqq0i6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yi5bmKT3wuiKQN7gsNb/0xQNXTB1/Uogrt7+38JcDYI=;
 b=SAqBHXMz783DeGkV+bmlPtCVoi1XqLTS+ru/CW8qhdZVs+ZUeMAu+RksVYdMTyY4UpU8PULODXNzsCQmBgDlp4KZTuVAsQrIu/23py0JpeySMxK+WNFrFkArBLZVYTU61jmiUj0zcN4J+H97yvROxQZ7HoxmMwowlHRYj1hLupoycgy9/Zn596F11wLcp3njpv6Zs7wOTQjjCFXkemgNMGHKcuXhIQRZGlg0EsWTkdHCbwrkghdQGtwfneuXEAYXtwdk1ycXX1ivh0hWaeDcQNPHTObz2tPi7eMyNZvWzaFuTP667bLRwVAOTYLV9Ntc6kd/5WKQvgQHyNq1Y+l6eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <846bd4e4-cc37-4fd9-8f69-850c3b31d8b0@suse.com>
Date: Tue, 28 Nov 2023 08:51:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
 <6aa8c7e5-c13e-43e0-bec4-74827407c985@suse.com>
 <0e948dcb22fe553053431083f19f058245016e41.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <0e948dcb22fe553053431083f19f058245016e41.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 152dfce9-8929-47d0-b2c4-08dbefe6e7b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MyxfsW/Fd1pzeGVqC0x+wC4AJ7n2KJDjCaW4CThkhCioCnVUoTu9LG26s8boZPTkJ7SIJEfgN3ewybuoADbmPX63YFqXvBtX/OvGZYvKK3G4cgV6XvwbkTIvUxsuBTZ8+IcXEFE3adNg//eK/ZlYWou4ZGDx0OY3M60Vf+zgYE3gizR9YH5FZUN/tLnUM115vBANgUjD7lw1EEkNRIPyN7Rm39k44kdDcGuiWORA5d/BN0yz1bHHmmQTuPyppgoqjaWJc2o+O2nMgn78XD5YgkOi1ST3vOJqPSBGe/C8Ce7yackujdkucI1McJ6Dt8BAugJJZZJZqwsdfTnuTImUtQ7j6gVPPgO8J79kIcP2/xxffRrXwO+hXEIfgy25mpXSqe+g4Dk85oLoKIP5xZcoQ0n39TK0JdZAzSAeChNBouPyzvTE70bD9fq6EKQcqySL0MVzisqIdUhIBnW2bhVEqMFnB1eSYdu4xHC8f9YYif6I5AaRffV4wioBuyWOembQv6KU61S4+ySgqZ9Wa8usRqeHsQmOQiMy7/QkpS/xPiidKJCXx1hi1izFKeGsCz5jFAiNNYio94SOgAM4Lak3E4e2B3p6OqTjEvJfbYH7jDriPNyNrSC1dAKezfycA/rXPnpBn4b2QVgt9SoUTwLyymldf9yUnOHmexy5fSJkwhA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6916009)(66476007)(66556008)(316002)(4326008)(31696002)(54906003)(66946007)(8936002)(8676002)(478600001)(6486002)(53546011)(36756003)(7416002)(86362001)(5660300002)(2906002)(41300700001)(4001150100001)(38100700002)(2616005)(26005)(6506007)(6512007)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0tnU0YyM2lTRGZzR0hKMHkwN3ExZXZ4T3BsVHVudHduTFhzaEUxK0FWb1pn?=
 =?utf-8?B?cFhuVkpNKytEQlVNL0taa2RaQmJCQ1FsN3hvTHJjRVdXcFlaQTFKVzk0b3BD?=
 =?utf-8?B?R2ZVd2pEUW1RVTA1L0VYZWhwdmR2cTdnN3ZHdkJ5SGRKZHowRHE5dHZuLzd0?=
 =?utf-8?B?NlgzM0g4UDZyTTlQOVJUVEhnK1hnYnl0Smh1d3BjY3RwMVNLYnl0SnRDdlRS?=
 =?utf-8?B?MjJUNGNoRTlWMmlrRDVpMzROLzlheEx6MnoyMGVRdjVoLzRBSzNBVVk4REQ0?=
 =?utf-8?B?NmZwL1NuaGdiUmdoeFZPSmxHaHZIWXl6a1VqSVFPNStSeHJudDg5bzV3cEN3?=
 =?utf-8?B?ZVBvVWdYKy9KdHdVYWxMWG0zRlkzR05FWm5td002ak12VE81UWtJNncrU0tL?=
 =?utf-8?B?TFdxWVk3ZWlyZTVRMnQzWTJHYy9JN3N4RVROTDJXUTA2T0FZQ2dFenZMaHNs?=
 =?utf-8?B?Vklhb0RSZGdKS3FHbjMzUEVpcWZ5bjNKSVI1N0J3czA1MnlCNktBYVlZNzRW?=
 =?utf-8?B?ZTEyZ2FSYStqenRielZwaWJtQXlJSTkxZ1ZyYVQ1aCtjVGZESms4VjZZNVk3?=
 =?utf-8?B?QWlJQnprY3Urejd4YlJKbEZzd0xlUDFHZkJJd1JtZFlSNmwrNGxOQmkxS2tP?=
 =?utf-8?B?U1hiMVdwRXdqWEgxdW5pZ1lsWWF6M0xleks5YUFwUG9qWk8rS1MxemZ3UWlM?=
 =?utf-8?B?RTdNQzY0bmhJLzIxdUlCb0dhb3BLYkZTTUtIV0JUYy9ZUlg0WnhqTmxzUFB0?=
 =?utf-8?B?ZXVzQUFZY0cwNnVSbEZYR0lhMjRsMjNQam1mTjRCR01WMWREdE1VQVdoYnhh?=
 =?utf-8?B?L0FRTmlqTzF0aXRHLzFOWFUydW1SQXFRbmVUNFRhTmFqOStOM0RQMGsvR2VT?=
 =?utf-8?B?ckFPVlUvN3NVLzEvRHFSUE5PYVAvczRBWlIwUXVRV1dLc3BFM3F2b0lXWktG?=
 =?utf-8?B?dFgxRmluV2NkUjVuYm5rRVBNZzFaZXdYVWFpSE9EUXcxa1UxY0I0aDU3Yk11?=
 =?utf-8?B?UElhSkc0bVIyK0pQQml4M1JsZ3R4ekxKaFp5Q3NlRG1kc2RTa3VIM0d6anMx?=
 =?utf-8?B?V21vNE5RVWhQdmdvTHMrL29VKzFnc0hHQ2YxWDgzdVM3S2l5OTFzVzg2U2ds?=
 =?utf-8?B?QmcycU9wNGlNZTZrU2hMOE50Z0pSRkNSdTJKZmtneis2VmI3ZGJ1YnUzRlNu?=
 =?utf-8?B?aWozQXE0WitSVGwvalFPdm1vdk84YjYyd2o4ekFveFJQdEw0ZVBWbFgzMmtG?=
 =?utf-8?B?OVpSVGRMQnBoS2l0NFZxR0VDdXhZYjF3bHlodVRLMi9hVVdmVlhIeGU0cHJK?=
 =?utf-8?B?aG4wMVB5UGNLa3lsTEprZ3AzRjMvSWxyd2lnVzh4U1JnYlVGRUJUQ1p0dDhC?=
 =?utf-8?B?dUJ0endjZXJKWWFhWEdJN2p4TUx1TTJ3NU0wbUx6THBUaGRqcEVkVzRiTWdC?=
 =?utf-8?B?akhaUDlWSnNvbW9zMDlSVnlqQ2NBcEdlTiszVVhldGd5Rnl4VUkyS2VjbTVF?=
 =?utf-8?B?VkQwWEptUUovVDA3eWJvRm9SZ3NJT21CMG5KRVBvY2Z6bjRyZmdRNkliSjBI?=
 =?utf-8?B?YUkrcEFHb3ZnVnYxVTUyRWk0RkNwTXFWdGhWc25BRWxvRWpYaW9VOWNkRHVn?=
 =?utf-8?B?VVJuYzc3OEJzL0NjYUhreG1QV2xlc2lZTkxSWFJCSU9MME5JSVdDaytVaS9I?=
 =?utf-8?B?SGQxbzN2UnAxUmk2M2lOMlVCUkhaZmFHZ2NEQ05pOENWemFKTFIyY3psMTVG?=
 =?utf-8?B?RGtzMlU4TGNIWWpXZXhyNUgxQWpWaFdidXRMRnV5bUZaOCtXRDBBSWNmZzRV?=
 =?utf-8?B?YmUvaTcvcGtJRXBGTmgxeEVWeDgwUGFTMDBQRzZOdktoS3lSZ2ppeTEzbmFI?=
 =?utf-8?B?SXhFZ0NTOER0S0FYcVY0Ukw1UDdoNW1UUWE0TTlnaWZ0WDh6RHllenVaSXNE?=
 =?utf-8?B?UW9ZNUcrQnVwNXhnMDdqRVFzYnVKRytDQlZSRngzWW1STUdFQW9kMmJqSkc5?=
 =?utf-8?B?ekhtcUFCMzAwTTdXS1g3N2psNUFpd0pjK01OT3FBMWh5NkpWWHh4SE1Ta1N5?=
 =?utf-8?B?S2RCRURaMWNEN1NZSHFwdkNNRzc1R1VLR0R1azZVdE5VYzVoSE5WVkZDSCts?=
 =?utf-8?Q?lotAeFhLDFz7EqBUp2/rzAZ5J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152dfce9-8929-47d0-b2c4-08dbefe6e7b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 07:52:01.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0+FKYaPkaB1WDln6z6/pK3zoFIBE0fr8B4qvEVQ87RoOe9wjJ+cZH45XK64gM4/GnRl9o/9+FSqjcJSfZQjOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6951

On 27.11.2023 20:46, Oleksii wrote:
> On Mon, 2023-11-27 at 15:31 +0100, Jan Beulich wrote:
>> On 27.11.2023 15:13, Oleksii Kurochko wrote:
>>> --- a/xen/arch/ppc/include/asm/irq.h
>>> +++ b/xen/arch/ppc/include/asm/irq.h
>>> @@ -3,7 +3,9 @@
>>>  #define __ASM_PPC_IRQ_H__
>>>  
>>>  #include <xen/lib.h>
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>  #include <xen/device_tree.h>
>>> +#endif
>>>  #include <public/device_tree_defs.h>
>>
>> Why would this #ifdef not cover the public header as well? (Otherwise
>> I'd
>> be inclined to ask that the conditional be moved inside that header.)
> In that header is defined only consts without additional header
> inclusion. At that moment it looked to me pretty save to ifdef only
> xen/device_tree.h but you are right we can move incluion of the public
> header inside #ifdef OR just remove as xen/device_tree.h already
> includes it.

Oh, yes, dropping the redundant #include would be even better then. Yet
that furthers the desire to have the #ifdef inside that other header, to
improve how things look as use sites like the one here.

Jan

