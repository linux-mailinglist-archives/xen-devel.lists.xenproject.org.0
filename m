Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA559802D53
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646597.1009015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4RR-0007ML-0r; Mon, 04 Dec 2023 08:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646597.1009015; Mon, 04 Dec 2023 08:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4RQ-0007KQ-UK; Mon, 04 Dec 2023 08:36:36 +0000
Received: by outflank-mailman (input) for mailman id 646597;
 Mon, 04 Dec 2023 08:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4RP-0007J6-2Q
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:36:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b01e270-9280-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 09:36:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9415.eurprd04.prod.outlook.com (2603:10a6:102:2aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Mon, 4 Dec
 2023 08:36:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:36:14 +0000
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
X-Inumbo-ID: 3b01e270-9280-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI95pEqQg34DDgVU8WzeSjF+PekqFek/lA7Q8iS7/480ME3grcuftnMBSesjH/lVRMm3XREOw1rN8zHiykVvF69p8BEPYHHoCZBvVUT5JDGNXlqyQn9Vj2m0e+93lvSeA2cvlTIoxiw882HOH2XsWFSLbOdeZiiCFYkzLmePU/EOQicN53B/IWSfIj3HbVcomYjRz7tuIWMwAr+Y8dnFY8ovkzBrivuBFA9xF2R9LXJ2LvIpAUYr/mWw7aNv1TEB55P/zcNPZJLftgxalquI76EjYSY2wmB3LtdNgpvsoqAE+RL16QBzUwTWjxV7JQuh7Hv3X0GJNuzeZtH0iajo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp2R/TEs7nDQayr5C6WP5aqTcA9k0EtH0HF+IZ+keuo=;
 b=ifPkFoBVEM3ZknU6Pqq4CN5mP648FnCaAzOJA1GWaGHO5sAQJznhDTPzcidH8T/n80qwY+2I+gyebIXmb5aAm/nQdnleDL8XmnVqvz4TthhIMAJEoFVwnjqJv/2xYit8LIwXRn+4P5BTHXbERCqhjndVubAzWYC+gbRQjIln/sPdNTUhqschNh7PZJmeM5+FOoZKSRwnTKsK4d2nJsJxu9+rKsi27xQrBTflVo67ZWSv21aGdOi3CMdlFPfQrV7nHlsg8B+E1gniV89X533R5wld6evoFra48GtjjNBvgNGzvcT/vIHsIvK6SI5NS4+8BfuTbyfxrt0DZx0+QKZk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp2R/TEs7nDQayr5C6WP5aqTcA9k0EtH0HF+IZ+keuo=;
 b=r/syXcNcIL63pWSbbr+Ircpo6zQ5m+DAfNRW3PU1bdc7BvL+K10i/0pEVlapMSknRkgHj9HQDHGX7muD6U/Ao67cfpRdd9Er5ZV+7RvgDKBEgO7ny3Ibv7+DB69K//5RFaa6v9MJWOz8LMeLpsRh7IrUnleS2jWYJFpc5vilmP2O+t45Xt7AJpkJ1xztphStmlv0T3SMajuhz7uNP/h8pwRplTsmpADcyAoPjZDes/8iV4G+UxQsij5Bm3LPfWgKqF3fJxpMjWH9XjLktcaZwXorjb4FN9pP7H1k2l5LCfJjDepSGRHZat7HCtGai96ZUBm+g5/PmKbXCCMvAftzrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d44c8f6-aa12-4aa7-996d-68aa50dbec33@suse.com>
Date: Mon, 4 Dec 2023 09:36:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/17] rangeset: add rangeset_empty() function
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-10-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231202012556.2012281-10-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: d7419cde-9727-4a1b-e157-08dbf4a413b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XdYwC7Vm8Uswm6O9AR9yz+wx+mkYhKQx8U1RK9N7yVNDxZqLuH/DpV+y0MyMwCHU0/0tIHpr5k653T3yLi+4ievFV5RpQp7PJTii6XHdFjSYICr6Mji6RS09y4nmPw+OEzOSlqdRb3aBigkM9z1GxCU7os3SYQ7DkCrnxKcBk/qupnjOoeO7duwdTFa1BXSB2/8RtS1eHx/rKxfvRlP6zyCNCUeQ1HSuIMlxikjZj7+fAZBv12KagqRbnJ4zArWVtvgPxfdG5xg59MAAqdsuFfr4AI5PT2IVgnm462AStWMMeISOouOEGoABsfF1s5rgB55Dzs80cUHn72Mkbn6gCfvV9UuZrsC/q5+buh+1hnIhLPXKN9Cd/ns0jWwHIok85qTU8vNUN1tIf02qkHDekhJsyxWu9C9Ho1oXLTh7Of5vHflC4iFa2HZwZno8HlfJnVEDDIrtWJdxE+Xh3JX/SE1KeSfZ6CRF5RqRW87yE6XViwFVwJNrt7U3RVZREDYNgIusSrBEeFNR829tQ/TIBWI0xVA8l3ST7kMbR+RYT3nYZBgYkYE+sPOZLfAF3p9++U+Gr9PqHCm/F0frE5s3IfYB1wgPPiMZB5NT7SLrRTK8gtY+dbS95KBFL3iYSeRejjcfAzyp4zXa3BrujWqggQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(2616005)(26005)(6512007)(31696002)(36756003)(2906002)(53546011)(86362001)(38100700002)(66556008)(5660300002)(6506007)(41300700001)(316002)(54906003)(8936002)(4326008)(110136005)(66476007)(4744005)(66946007)(478600001)(8676002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNzREY4WUxzanhlWDBjZG1BZHlkeExYNGVpdHpQcTNZV3R1UUc5UFF6MzhR?=
 =?utf-8?B?ZUFTbDVkNlpwajVqMEhnZnZlUTR3eUJ0VENIaFEvZjJYNzR0UjFKWkNJNjE0?=
 =?utf-8?B?d29LaHZCZWJjYWpublRRQlozSHo3VGMzMWoyRGlMVjRQS2Q4L2wwNDFXYVJH?=
 =?utf-8?B?MS9pREgxWjJnRVBqRjJlMmY3dDFCRE12TUllcm12WTVDNUdjcUR1SnhpZEVD?=
 =?utf-8?B?ZkhvbG1UQmF3d2N3VzFIRFVwSkdkalgveE1ia0YxMnMvdXVkNFNyQTI0L2p4?=
 =?utf-8?B?ZFF6cFd1M1pwRFJPQXhJamkwQWhHSDg2RmJqZDBLMGtOZUFYMDAyWFkyYWtv?=
 =?utf-8?B?S2gzOFJRSWFJRVhFaHFXRWk3elE2SXEzNHJCeGorU09BTm1pWkR0S3M1TGR0?=
 =?utf-8?B?VG91Ujk4QnExUlJ3ZFMycjJIeWJiL1FZRmYyMml2azNib2VhbnpQR3dMQTMy?=
 =?utf-8?B?VmJTQnRYQk01TlhiNDJILzRqN3RTMHY5RE5IT0JtTDhjSFN2S0EzUC9JOVkr?=
 =?utf-8?B?M0g0TmVNeXNXckdjcW13d1RXa1o1WHVvT3BRRmNoZS8wSEtqNGxmK01aK2Ew?=
 =?utf-8?B?dW10cFBlYnFidHNuVUVCSGwvQ1NJT2ZHVFRjeWNSS1JBa29DVFRreDMwRExz?=
 =?utf-8?B?SldVWDArU052S0t5ck9IK0xSSHNPRm1VUmdSM0FDcTJ3SEwzeitFdFpmaU1G?=
 =?utf-8?B?MHUraWJ2VE5XYjB0SFhpSGtFVjJUMnRkY3VZZkRTNUxaUHlnQ0VzbDhOM1JV?=
 =?utf-8?B?ajRpdmxlaVBqSzJtNUQ1SjU1aVNDSWpGTElXSnVZMUFQY3M2N3lXM0VwbEZQ?=
 =?utf-8?B?K092TXZmZklBdWZlWVpNcmh6dkE4NkUrcm5CTitLZzlCdnpsMDkwMjhDU1c1?=
 =?utf-8?B?VEVESk03N0l6UHJ5QXlSSldrL2dyWmI3UVVzTFhBdUF5c2tKS0tFMWd5dkVv?=
 =?utf-8?B?b25QNzVvZ0dSUlFBZXhlQm5ZRUZuV0czdmhQR1VzOU4yeVhPbFk5OGxwUWNY?=
 =?utf-8?B?UUNjeVRwc3o1YjFlWVQ1aTk1NjFrcnNPeWRrTW1hSmh1aC9pSkxKcEFQSzdl?=
 =?utf-8?B?eGZKRVdaM3c5bWtDS0VXZmQ0T09tUEtFNzVGZWVKSm5pam1jVFE0bmZQQ3Bq?=
 =?utf-8?B?eE9RYjREdndBNzZFVEpZOUhlVDVaQ25nWWFrQ3JsbmVFdHQ3MnUvbnRkQVB6?=
 =?utf-8?B?c1ZTQk9sQnViUTN2MkFJQ01LdlYxSFZyQUF1N2xkd2pNL2Y3UXhKV1hOZ0w5?=
 =?utf-8?B?bHQ4L1RHa0NRdzRlTk5MazVSa29neDQrU1FIb1U1OVpETHpoM2tTK0IrZko5?=
 =?utf-8?B?V1pveVRXRlNnTzhjM3JtaFQvRlRsQmxkRWZPQlBIS29pME9tRVA5dGZzd0JD?=
 =?utf-8?B?cUJEeGJ5Q012NWZuRmVlZnZTcXdrZzhMTWhCSmxna09SRVQ0cUhiRGNMaTMy?=
 =?utf-8?B?YjdxNXhrU2t0NTFLdldobGZEcC9TWnZBL0tEY2c5QTdqM04rbm5zZXhtOUZ2?=
 =?utf-8?B?VWR0ME91SDh5V2hFdFUxeUp0Z21Yc2Zpa0pST0N6a1JBK0JwcWdKdi9HTkhU?=
 =?utf-8?B?Y2t1Nm1qMitHY1NzTkZuakFUMHRqWmFGbUI0aExmRERYRloyTDlzN1ZOSm5h?=
 =?utf-8?B?emZqeTBOT2w5aVFvdVhTQ1lPUWVwUS9zc3VjbnY0WEV6VzluNFdYVXdkVWJ2?=
 =?utf-8?B?a0NadVpVSFpYU0VLNEZJZmZUQVFDb3IyZHBZR2F1T1BIZlRiaFRZN2tpYnBX?=
 =?utf-8?B?WlRLaXZtMm1aU2lsMTVQeGVVeGVWWE1DZHhaK093d3AxeVBFdmdZaFhFdGRn?=
 =?utf-8?B?bWtTTzNmYjBrTkhnSEpzK1JGK3I1MTQ4TUJYcktLOFVtWUZYU29ybjRSZlhp?=
 =?utf-8?B?bDdxSUZIZ0RLWG42ZkZLWkg2VFBJakp0d0xUb0FLbUE0dGkzMzloMUFkRHNP?=
 =?utf-8?B?UDFVQlhCQVAxU0NuaFFRTExvTjlrM3dkbEtCUUhqdEY3STVzVTRtU3N2cElW?=
 =?utf-8?B?MFlMSTh1UUpJUXZmVExHbWJtbEx1NEk0TFg4NVpObFhJS040ZWplL2prR0Z2?=
 =?utf-8?B?aDRNTUNiYU9FUEJLV2M1MmJaNjdsVjVxSkFxdG5XVVRPSmRtejVMVkU3Tzkw?=
 =?utf-8?Q?DhP/9voxQ6QValpbgwZ8jkB0z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7419cde-9727-4a1b-e157-08dbf4a413b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:36:14.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY31N15de4wDPW4NR4eSXbQJxg6WGVnbMeo9uvEKTbfUN8hqhgclo4s8dUNdRErthSl7YzZwKAXm5bNagKsPjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9415

On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> This function can be used when user wants to remove all rangeset
> entries but do not want to destroy rangeset itself.

I have to admit that I'm not happy with the name: We're not consistently
naming all predicate-like helpers is_...() (see e.g. cpumask_empty()).
May I suggest to use something which unambiguously expresses an action to
be taken, e.g. rangeset_purge(), rangeset_reset(), or (less suitable as
some ambiguity would remain, yet it would be in line with e.g.
cpumask_clear()) rangeset_clear()?

Jan

