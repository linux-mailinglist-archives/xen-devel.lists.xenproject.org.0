Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE57FBBD3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 14:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643189.1003162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yPh-0003Nc-Rm; Tue, 28 Nov 2023 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643189.1003162; Tue, 28 Nov 2023 13:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yPh-0003J3-O8; Tue, 28 Nov 2023 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 643189;
 Tue, 28 Nov 2023 13:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7yPg-0002gd-DV
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 13:46:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b4c4c9d-8df4-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 14:46:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 13:46:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 13:46:04 +0000
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
X-Inumbo-ID: 7b4c4c9d-8df4-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CV+lzNWAY9BeAK2aJzj5oZfKdirNZ2QGV3rAV1zLetxxjYsj94V/KnsAFw12Vofz1DCvwszX5Dffqni5vsd/Yz26V/HpezOjf5XR6ETd+Y0BhM/2htSAif6gEsoHoFY/F7RmNk3ROliqeSMaAMkBnVSrzT7eO7pf7KI9IBVSPTH/hzQvntyELU8PWOd4Bdio6LSsqSudo1Rx/B/QBKd4SxHYGlLds4pwGviSlZI2juEFz3IrzPjls0qHrCvx1Qq5hURS9U4ZqtLvkfAFE0dJnyy8MQnPZLLrLgXWCtz0e/40B2D6h6960hCDneFlB8nd5xJOQX6VznVGYbt9iqF/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIjYccPsnPUNl7/NLjTIC8OH04miJyE40ZgeRxx9yAM=;
 b=hg1UtGmDY/fapeqzU7U0es/Fru9fXvjl9VbxWPvNCo+pwU3IVpCDT+7g36/d1vbSBY+6oL/VVryZB0b0mkt/tWegGtJz5YFTQCog3vQ85qv3Gm1twttBivG7VwSIoMWNYRKMYMUZtlUZpyY+fUovr9XN7KdHGjEqztaabV5WPnFxcE3erU+mV6iL11S9jxblBnNrkCUsSObobfevT0q1mVxLuab+7kffQnf3ePFzKfENzCygPptf3qTu0aFe3xNNPmwfIP4azIV052FHgMs9qKIsN8NjXxvKO/PCzzJud+L1uQguHxEj9GDGX8YcGvd6YkjQhUZRzXsSgleuEIq8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIjYccPsnPUNl7/NLjTIC8OH04miJyE40ZgeRxx9yAM=;
 b=TNZhYyTMwjybJvylpUCCCNaU1xttZ4ueSsz1ZthTBSrW9b5aqvSUfiC7H3CSyQ+dMv9t4O0W5jVZrXE8PxV4VuH2DMmq7LUZ/+W6Ijyy5wKbThNCI7iSaAoOd90CwGrlXinxe4WioULHOHR9sDQaeoEYMfz5IIda9JA2cK+0Le93JzNAilFoVASgohYcliFF0g6KUpIBiqNV2tb+wfgTosIjkXkij8a9siCu9DZVFLBKF4Y7thV7On7l2dpp8yTPWrHs01DeJEteiz0hKD2d0QT9vxb2qZ+cojCILUVfrMRUu/6X/5iwRIgF+5/HgaslwDHa8dL305aG+aPpVibC6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68788bae-ed43-4568-9c1e-261e0b05db4c@suse.com>
Date: Tue, 28 Nov 2023 14:46:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
 <20ad9ab3-1823-48b0-8642-75f8c81f1837@bugseng.com>
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
In-Reply-To: <20ad9ab3-1823-48b0-8642-75f8c81f1837@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 8613527e-743d-4b30-548c-08dbf0185dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6exR8mgSvY1jGhQ8/5a+C8cT7n1SHWy0WeYpNB8RtjOFZ2Pktw0LST30nWoxmktZwmKPwB6WK0GysRr0aMZjgR+KIrDEU8+HaevuVhoQcXUg1p+TJv/RMiPPLLVwa+MrDo8hqaY7AEaiFW0Fk4YXH0FP8QlRClZjqw4o/PSIoU9S1nS+54q7r2J1jOz70fUTmZIAp1BX2GDbRxPljwRADaI2L6NZ0S4jFLtdDUteC9+248gymGMRVhRzeZ4aW9+HBp7ih6l4J1B+o8AeffK2i9PXqCxP3Cje537nSjky9720QOzLst8eH3chpIdcZuxaL+2nJcvvdJ3T7iQ6rJGpFj3hY0lE0ZpRu66j8Z764yVjZyh25VtjFQEgtWHBbgjHDHWd7nHA6w26RSndtupempSjvoSDKNExwECTITjnB0lWNiWQatT+h30rP2VkYEVVAwyfAEf3Pp5EeAMBeF7m+DGjd6iOHH1+ZK3pSVN00xZRIhE7HEJLky6gXKfQOhu4PWFUtZtXqITh0Whav/qKf9D+xTA7Pl9XvONJPVBuH3dbR3OCA36NeGOnB+dMzRyIyMR55nbWneTPlcJvTbN5oebbsD9Bd3iZ7PMBEXBE2wmR3s4rz56fGwEmQh8S52Kys1y+pug/e/nVEgd5HUWGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(31686004)(41300700001)(5660300002)(86362001)(6512007)(53546011)(83380400001)(2906002)(36756003)(2616005)(38100700002)(26005)(6506007)(966005)(478600001)(6486002)(316002)(6916009)(66946007)(54906003)(66556008)(4326008)(8676002)(8936002)(66476007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDJMVW9jbG11L3RKS2Y0NXc1MXhBSjg1Yys4ZGJiMlZlZ05JVHdiWkhZUWJp?=
 =?utf-8?B?YlY5N2lKRU50eE53Mi94L0xCTHBpTlNxMmhnamx0V0NTdldDOXNncjdKUUxu?=
 =?utf-8?B?SEl6a20vaFduVlZLN0pudXdsQXIwWGhCSVliazhmczNLeXQ3dG50RlJkSkZa?=
 =?utf-8?B?Q2tLSWRkZURYM2ZTTFRKcUFJK3NmQ2swZG9KZkdIVHU2TmlpOGcxNGUxRUk1?=
 =?utf-8?B?Qk5zN1FySDRWQ3dGQjZKck9MWTRMaUJOYzVjRXBYL1VqOXEzWVZHdFlKZytN?=
 =?utf-8?B?Q3c2cFhiVlRCSGY4clFwLzVSdXBxN3drMmFMb2pWUDhCK01hRDVjNzJnMXRK?=
 =?utf-8?B?MkZZcitMYXZ2NENhZWc3bGZLb2MvNEhTVkZVREhUYjY2OFZiTVF5M29TRHZS?=
 =?utf-8?B?MnN2T3VWYVVlY2FEcjlOZnY3NWZQR0MrU2JQR1hRSlJpQXRHMVU4RTJEcW93?=
 =?utf-8?B?WjQxY3E1TXp2YlBLVm85RzBBeGphODNFeGU1Q3Y2TjFWV0NNZjk3SXJ4ODl2?=
 =?utf-8?B?VDIybE9zUlFZOHZwVG03K0F5cDVpRnFJZEk4WHZhbnE2Tm9ETUowL3JMck5C?=
 =?utf-8?B?TzVzdUFSR3k0V1NqSjVsUHN3TWFTc1JpYTUxQ1hHSkVEWHBMMzZ6RTgzbW94?=
 =?utf-8?B?eko1c3RuYmd3dDN1YmNQa0dOZFhYZmZ2eERWWERCRzRDdUl6NytwcVVSeWpX?=
 =?utf-8?B?MGlsYTBlSENWdDM4QmpmQkYwNEdzVms2WXJnRjVwaTk4bk1MM09wc0JDNFlO?=
 =?utf-8?B?MWdCLzRkSkhoYjVZbG9MSXd5My9EZkk3UUFXeUdCV2NqMTRrVGhvSWRUV0VY?=
 =?utf-8?B?QzQ2ZlRabTFMVkx2dU05elFCa2t1Mlp1a05OQjlxZmhyWWQ4WEJmNUJVeW10?=
 =?utf-8?B?cmd0UmgydnlVWi92WGdLbit5NTZBTktRVnA3eVVaR0FFTmovYXhoNnVFS1hr?=
 =?utf-8?B?VlNQNmQzU0NLK1p4VlNnbHZWOEVBWndjYkxIQzZERm44Y0ZERS84LzdJT0lx?=
 =?utf-8?B?S0owdjZUMlh3WXlMbk1PYWJhaVdocVZPYldQTmFPenhvaEprWVJVSExvaVox?=
 =?utf-8?B?ckYxUHhiVCtENjBBM0Y4ZlpMc2V5MEJVY3JBME9LMUJSck5Rd2tuYnFMUzZq?=
 =?utf-8?B?OTlBRmtmT3NwOHFyUnVVM0MvOUlHRHBpRG03dHc1Ym84ZDNVQkVQbEljRmI0?=
 =?utf-8?B?UjgrQ2V6UjM0NERjU1lZd2FSSlZCdnBQb0UzT2U4ZTBHMUlnL0R6TjV6R1d4?=
 =?utf-8?B?enZXdEhYck03THFQajZFNEE5QUs4ZTNzbWJNVmxaNS9ETUtTcGM3dWtwN1Q1?=
 =?utf-8?B?aWtmWEhML0pCczdXT0hMT1pZYmRSR2o0c2F5VTcyY1k2UGdVaVIrN1M5aHBp?=
 =?utf-8?B?Z3VBS1JZUTR0c0RyTmJxOHRJYnZBNkl4cHk5dzlUdXpsb21uaG9vR2FVU0lZ?=
 =?utf-8?B?OW8wL1pObW5XOEJuY3lnc0RXOGpyc3I0YzV2NWFpWWk4YzEzZFNNWHdYcmpn?=
 =?utf-8?B?OWI5cUNrdjFMcmhlYmxHZExrcnVCRGlGNFZ4ZTNXS0NGRWkyUTM5YnJSeVN4?=
 =?utf-8?B?QUpkRk0ycjhLV0hORENqQ2s1UWFyTmpPZGgxb0xCK05pZzBnMW9BVURobGFv?=
 =?utf-8?B?Z29MaVhHcFF5R21ZUGNlY3RzYmNqWndQcHUrV0xZR2EraU9YV3ozMFJURTAx?=
 =?utf-8?B?RDBDY2hzU2s2dzY1QlRRTGNjK25id3d4WjgxRDJWODBha1Y0dSt5Y1VXbmtn?=
 =?utf-8?B?SEdPN1FpakJBSERKeUNKTnVUUy90UFJNVS9mSXBlSHJWMnRaVVBlU1l2bWpQ?=
 =?utf-8?B?REFYRWNDbWdOYnoxQTRSYm9Hb0VpNnp3cFlvc2tHdTlGMXVOK1hDbTFlVTNq?=
 =?utf-8?B?bGZKY1JXUjQ5QWFWLzM5SUlvSUxreXhMNjFGN05Gczd0Y3MxTXhidVQ4MHpQ?=
 =?utf-8?B?Q3JSU3hJZlFXcXZnSFRHdWxIU1dYaHVGd0Z4QzlrUURFMk9yTjlndjdUQm84?=
 =?utf-8?B?MmpUSFZybm1YeDJjWjJEVWpXZTlNSlpFSEkxSitMcEdFWjFiQWwvUUxiTmFx?=
 =?utf-8?B?Rk5DRmYrdnE3dVo1SGlFWU9ldm43OHJ4elJHbW5wbS90T3BoMFhldXhlckp2?=
 =?utf-8?Q?0Swrsyb7UvfE6ESUICzj3hsvt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8613527e-743d-4b30-548c-08dbf0185dda
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 13:46:04.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+b9Qvvx1Fi0VxV+zhFDGMPss8KfgzQ5cHHClySyhsEg4Wb4N7PFKpBafj0qSA+iI06tg/OQmpb/jPLErXcsSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079

On 28.11.2023 14:11, Federico Serafini wrote:
> On 28/11/23 14:00, Jan Beulich wrote:
>> On 28.11.2023 10:46, Federico Serafini wrote:
>>> Uniform declaration and definition of guest_walk_tables() using
>>> parameter name "pfec_walk":
>>> this name highlights the connection with PFEC_* constants and it is
>>> consistent with the use of the parameter within function body.
>>> No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> I'm curious what other x86 maintainers think. I for one don't like this,
>> but not enough to object if others are happy. That said, there was earlier
>> discussion (and perhaps even a patch), yet without a reference I don't
>> think I can locate this among all the Misra bits and pieces.
>>
> 
> The last thread about guest_walk_tables():
> 
> https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg02055.html
> 
> Do you have any suggestions on how to handle this?

This simply will need solving - see my reply to Andrew sent a minute ago.
Personally the best route I would see is to leave things as they are for
now, hoping that Andrew's indicated code change will arrive in not too
distant a future.

Jan

