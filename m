Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF47EE24E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 15:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634257.989682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3czq-0005IT-Os; Thu, 16 Nov 2023 14:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634257.989682; Thu, 16 Nov 2023 14:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3czq-0005G2-M1; Thu, 16 Nov 2023 14:05:30 +0000
Received: by outflank-mailman (input) for mailman id 634257;
 Thu, 16 Nov 2023 14:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3czo-0005Fw-N5
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:05:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31010b01-8489-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 15:05:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9102.eurprd04.prod.outlook.com (2603:10a6:150:21::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 14:05:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 14:05:23 +0000
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
X-Inumbo-ID: 31010b01-8489-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWkrDQRG7FoVChN03BgYnBxiAfoPPeVRKvhy1gl9Sl1HR4BYyPd8Z7KrJfwYluc1xIatf6DIs52oCFVtAJM9Oz2wSjpZQnMnlge+eclnTsSpBSPqz8wo1ULe3Sq6bi0139MRQTvuEf90Nrkpb4BjHOMLENPk1eBxyA95JBACPJ2C8QMWJ9Wo1rUm3e6wcUIBlNGnlOO7nZyiEu76TnriuFfkEEVhkoYXT3TsxiSpbCr8SGKCbdFylB0Z/ZkMNV85oOgJvc/AH1l1NW5YcyhAsC0iKV0JnCzerBFlyGfV6TA6LDTfmeSAuTXTF+d/zuQ6a0xchmBhEijGcPF/0OpApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkdsCKI4qP6vqJtLhRogv5kDL8rgwy9kycoa4MIX0ZE=;
 b=k2RevJRqmqIQ+Iyn59tWgite+kTyE1B8icmsObRyX3FrYUULBukPZuRoAZhx/47fYn9PQStWeXVtGKoehkGQqt7mxLCZEjOH5hgg7J79iwd6NN3++UXFM188d8ptl2HROEbxoCjeAUpws2+/zUjtYgvXjvHRFMKe3saHJ8QBSXCYjvPtZXJFKDz/+Jbxv2dNiLv5PnyJYlCGV4Hq1x9FiQ9R/T3KFkuPEeJOB+491lSkif+9xzVgqP5yjW2XTvpJFr1dnJCawNEuPWwYI7BHld83lIK4m01qhVWlNfleVHPtKkv36Su+V5bSu6haoSNY/jmLgkgIbmB5Y/I+e8Jn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkdsCKI4qP6vqJtLhRogv5kDL8rgwy9kycoa4MIX0ZE=;
 b=kdeev1Xon4Qvf98PAsqFNb+SOk+3h1KsHQpxk8rkxLNaN443rwOm7Km2/M5E54zhF6rmOV73sBUDlO91UFd4gtyl/37gjQ0P9aJmxF5z4iYzE4qpFge2omCBKfQ25SVP4DHKeFQNYpWotWQZogtxHRBBJyGPS0iSUcnUv5rw+/R5zI0FF7hlZSkx/9rEXgO/5eDbT46zPmkI8WFamNcD/QLrV+F4FBRA2Vu0QSb6aLjTGru/LjbNR7+dpNxbIrkqggpk35rT0FdJPjpRDQkj4KTjc/ElD8G79wK11wVYWVyE5PMfkATe7ey8utR35C8rEErLR1pU9rsVlouNNfwxNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54cbcb8b-c895-47fe-ba66-5fb06505e00a@suse.com>
Date: Thu, 16 Nov 2023 15:05:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch: do not use .livepatch.funcs section to store
 internal state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231116115841.71847-1-roger.pau@citrix.com>
 <d6634601-5006-475c-b386-97a1e53c5279@suse.com>
 <ZVYfHQD1AEmNVY3h@macbook.local>
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
In-Reply-To: <ZVYfHQD1AEmNVY3h@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ed0004-e559-4d12-e1b2-08dbe6ad13ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	djLm4fQ8xhB+14AsesYbUjyv4pp9iuoql/qQ8fOv+sQM+OdB4vWp2r7IwTDzW6i/JoIp5GL+tsOAZgRkRjhRkCFmlMRkUDjI6R/J0dNiSraWoqnqyT9T8qvl8piWaio0M2kfOb5+27YLBYWncPOoCOxuO6wWbmilunmJTvCt4RB/otv7MGJPmQt82oETTZfqn3771qLDQC149+ezwIBKxBvqpuv+t1IcrsCUBa7wg2hbTUwxlWYfUGjj4YlecdcAUg18yMQNDpD0PNzf5fjWDOwPmeus+Ld9AjeScIlXqN8WFNUFD2h+ewTYP7V8VqnKZK2MEbRZPzDkpeYUQW2zW1C2Na2ihCDJg1uKAQKzAfR5dW8c5SWy7Kp6wY56Pce3jslnIKbmLf0Yy6tL3GirG2u0GDh1ZCHFQYhp8sBAsGbKiTr2q2krV3twkVJ1LJjN1UTAQOcxDLncUdNbrtpKLHyPgU75/1BEZnQhJ80mgoQ50BJ3ui6ZNTFgvhgXc5ftR2Eh6ChbTCWq0k0qkJLMeik0ShkkoCG8NoHHsfAfTPIU6rMzEV5wGqJMFnm7QIugJ3NXnJLdbkiamDXKP+3eSQ8Smbk8CCnUkuUjQ+UszjUKR6gMgBJr8KyEM/Zb6aq5zVXuCBMsBUoY/BM0sk9q7ikbq6hsC3jdqVnc3o4zO/PKm8lz0zKB1TKmZI9TqMGW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31686004)(66556008)(66476007)(54906003)(6916009)(38100700002)(36756003)(66946007)(86362001)(31696002)(6512007)(83380400001)(2616005)(53546011)(6506007)(2906002)(26005)(316002)(478600001)(8676002)(6486002)(5660300002)(4326008)(8936002)(41300700001)(7416002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldjY0p5T2h2TnRRVmpLMEtlYmxLS2xWNlJIdmQzRFRIV3BDSFo1ZEdEY2o0?=
 =?utf-8?B?TlpSdDg5WFBPc0FMVG50cmxwc3JVM256aDBXdGI0aHlKQit6cnc5clRsQ2Vx?=
 =?utf-8?B?SkNlRnN6MXZDQkp2L1JNbXhzM0tCeXdOZWdvTFpHWVY2eGlGZXJKbjRRRGJU?=
 =?utf-8?B?eDRNSFY2WC9jYWJRLzlRUnViUjZEYjRoR0lxYjAzV1N2TnRyRlcvWWNIK3Ay?=
 =?utf-8?B?c3hFekFhbnNKS1hIL2xTMGhDbG9sNitXSmYrTFVFUlRVdzJhcHhmT0I1UmdS?=
 =?utf-8?B?OGh3ZlBuVHczZTNkRjZURVowL3N2bU5zWmMyWWlWQkc4LzdvMDZVUjB4RlhG?=
 =?utf-8?B?THNXZGc4dlNmVCs2T1hiMmNiRFFhcVZrendJUFhpSW9laTVCWUk5SFV5RTE1?=
 =?utf-8?B?d2JNcHRsekI2YkpnOGxWZnhCbTd5QTlCSnd3N25KWGJBRnNHWFRHendsRW1I?=
 =?utf-8?B?T3orK2N4TitmcytmNk5YbHRlNmNVOE9MNWo0RklrZnE3d05DTnh0Q3ZpU29s?=
 =?utf-8?B?TDh1ejVFT0RJM0RJUW90a1hGaHFvTzNlS2VtS1JjZEJ6L0RjTHJRVUVPMXNm?=
 =?utf-8?B?cmZoR2dJQWZqdzR0aHZZRGJvR3BORm42TkdRdWhiOVhvV041Y1JMd0pwK1RI?=
 =?utf-8?B?L2pOMEJxeDlENWtUckoyaVMvVUQ4VjltV1lEeUNIdGRtczNDeU53ZWszcUpr?=
 =?utf-8?B?RlVYN1gxWmltMHVPUEk4ZU9ZeHZsT0tXK1krUFNEVUNKRytVeGMzaVdjZG1i?=
 =?utf-8?B?U21OV2RRNndVUFNQWTRpcWt3cWZ2cWRmN0lhNDhzQzNYdWJxeUdUVDFhWGda?=
 =?utf-8?B?VW9taVhqQXAxcDQ1VlIrTkQvdlhRamVPMDlwUVA2cEZaZ2RBQlQ3ME9jSElF?=
 =?utf-8?B?MU5ZeUthUGM0L2hEODE3NlVpNHFtSVBTaFpHVWVwMHE2VnJGMVVVamVzYklI?=
 =?utf-8?B?U3BISXlKSDRLOW1GSFdZV0NEYnpPdXBQRGNzaGJVNjZycWlha3JnNnR5Sy9D?=
 =?utf-8?B?b1N1MHJ2dnFIQXVESHVJcVRORnlpNnNSbHY2QTcxSXo3cVRaUGxsQlk0Mm5r?=
 =?utf-8?B?cUpPM0ZzakFJVjN6UFVRV0lYamNIdDcwZ2MrbFFIMzhSbVNsMXJzNTNZUUhw?=
 =?utf-8?B?S3ZTZ0VpcmxsZHpGNFNMZHNxcE8rbWNZS2J0QVpObHNOU3hyanlmeG13Nll1?=
 =?utf-8?B?bHVaUnF2SGEwL0ZEclErZXcvaTMzdXFlVHQvZkV6Yk5wcFhNRDJ1SGRmWlVs?=
 =?utf-8?B?OHcrb2k0N3pibzVpZURERzBBTUJxMExuNGlGUlk0ODBndmF5ODY5WFVIMjJX?=
 =?utf-8?B?OWZST3A5eDhKZVgzV3hxQTM1N296R1FJeFJUWlFsWi9mUHRQWGdSSkF3Vm43?=
 =?utf-8?B?a0ljVHVxY1VYTWxSZ05JVFRqcGIwSVpTNGNrdGQzb1FMMGVwY083TUpsSjhp?=
 =?utf-8?B?eGJFYUkvTUtyTjFuTU12ZmFqVWVzS2NPbzNTaXZqaDUzclljemMyNTJKUWR1?=
 =?utf-8?B?VzNBamsxaDVscGkveERIYXJZSkdpRE1XNHI3T1lxc0d6M2owRnd1WHBUMUli?=
 =?utf-8?B?ME1COUhVaGpSd3d3OGJydi9qWVRBNWVxRFI2NDBkMDJpdUpLYmI5aG5VeTdU?=
 =?utf-8?B?QUNaOG92eVNtQ1hwT1VPS2lNS3hrQ1dNWFByMUVPQkVuZGpGazR1Mk1PQ0ZC?=
 =?utf-8?B?NXFjWDBjRHpLQWRYU0Q2eDRzaFVXdjNvbXhXWGNOWnRoRGtHSWNCRkJIVUhl?=
 =?utf-8?B?b0ZNc3JVeFBQODBXNVhpZzl3YnowK2YreHRVRmhFS2hRYmUvTG03dGJQcUFk?=
 =?utf-8?B?TUZUVFBEZnJSanZ0QjhRN3NPUjRoZS9CWVBpcnlGaUFudjlPVlRlRUNxNG0v?=
 =?utf-8?B?eWsvV1JwcExQK3dSa2d0dWJqa3VqMTR3T1JUZjMwYmFVZy92bHRCOVA0VUJk?=
 =?utf-8?B?cGNCRTMwM1cra2g1amdSREd0OXdHZ0hDUDdMTUlWSXR0SmpQc0VwRjU0Ymoz?=
 =?utf-8?B?K0FubUZzUEx6cnBIeU9wam9FbDVJNS8xSlV5NlErQ2dFODZMa1Y1VnFpNGUy?=
 =?utf-8?B?amJ5Qko1ZFBQczRyTnNzVUxydXZtZklWbHV6YjhLZERtVytlaGptOVpkRUtZ?=
 =?utf-8?Q?jAN8hkS/uUyzwQrP4N68hNzW/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ed0004-e559-4d12-e1b2-08dbe6ad13ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 14:05:23.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+5xh5lGMMQARAsm93jNRmEVcuv+CQ6JCHJ4uvN9647ChqK5QMaaD6aEusk4I0O1/vyV0xmWVT3enoXLdph3aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9102

On 16.11.2023 14:54, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 01:39:27PM +0100, Jan Beulich wrote:
>> On 16.11.2023 12:58, Roger Pau Monne wrote:
>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -991,10 +991,7 @@ struct livepatch_func {
>>>      uint32_t new_size;
>>>      uint32_t old_size;
>>>      uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
>>> -    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
>>> -    uint8_t applied;
>>> -    uint8_t patch_offset;
>>> -    uint8_t _pad[6];
>>> +    uint8_t _pad[39];
>>
>> Should this be LIVEPATCH_OPAQUE_SIZE+8 and ...
> 
> Hm, I'm not sure that's any clearer.  In fact I think
> LIVEPATCH_OPAQUE_SIZE shouldn't have leaked into sysctl.h in the first
> place.
> 
> If we later want to add more fields and bump the version, isn't it
> easier to have the padding size clearly specified as a number?

If new fields (beyond the present padding size) would need adding,
that would constitute an incompatible change anyway. Until then imo
it would be clearer to keep the reference to the original constant.
But thinking about it again, the difference is perhaps indeed only
marginal. Anyway, I'll leave this to the livepatch maintainers.

One further related remark though: Now that you pointed me at the
other use of the constant in the public header, don't you want to
update the comment there, for it to not become stale (in referring
to struct livepatch_func)?

Jan

