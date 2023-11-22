Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C29D7F4333
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638622.995389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5k78-00026k-66; Wed, 22 Nov 2023 10:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638622.995389; Wed, 22 Nov 2023 10:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5k78-000255-3Q; Wed, 22 Nov 2023 10:05:46 +0000
Received: by outflank-mailman (input) for mailman id 638622;
 Wed, 22 Nov 2023 10:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5k77-0001xQ-8Y
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:05:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b323920e-891e-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 11:05:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9949.eurprd04.prod.outlook.com (2603:10a6:150:112::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 10:05:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:05:41 +0000
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
X-Inumbo-ID: b323920e-891e-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu4yLsyVVPvNpHrwK3r3vAS4eK3VZX5vWu0A6dBlkON9XLDTCCGTwS9jsi2Ne8LsmykmUt1Nl/N0KepqSyVWhGcEriaIei1IhpmvwtY1izOWb24NApXtJYt8+dy+W6I+V9kZ60tRmqOu4+IXBIk3aet0LUXdBMQKrTe3g4W6WsSFaUQPb0r1jRY0bPY17hN+hCUPaseLbDzfb+gKICD6ekvXb+0riohu/OMqsvPGecg7xDgj7zy47aeJZETw/1Js9/n8pD9TSXIRGR3KHVHbwUl4VAPXkx2p7yjnEFsicHs5UKCEOX0Eyy6DSwXTwoqOZtCwn9wj3gJaZzazgcJT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE9fi3BGSx25RwjXXTEVChPHWRpgUYrihs3Qg4Qlac0=;
 b=I3K4Pjy7upOd+vlJ7Oi6ZYjfjvyCMLSljvRQx37Dwku4b+4NrMkdMA38nYvPFG0IBUdQwtuLwuOLm1JoapqeI7xJ2tm85+CB73+Gv7fQOX0culFCplEXckIe2ctM4wonrwL2PrbRCZio+fDYe7zGAUWzm/dUhsibd14nIPbtHwwL5ctPTXFo5Cp/pYjvQ3+jJ/KH/pTN/KKV/nChVYlsnuEu+LNAgPsH5anHyZiRlrVyPe69vO/UyvVQqh24o1i9YZRPfojruIAXzXl+Ogz129SW3BrtfzgspYuqcJNk174n1FlQBi1FTvpxvGn/XfyVxhj+KNZnJ9IVTmbbBedGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE9fi3BGSx25RwjXXTEVChPHWRpgUYrihs3Qg4Qlac0=;
 b=5lFb37a18oeuiLNW6/vhID9bi3pqBSW5UfH/ZCSOw9CnEjx8xQIkw1kPYjcRZHIZwGQ9LrkusXzNxo54BvWoh4Bv19YRrbcNd+mvGGGvMgNGN4V3HRaqaMeaMwk0Ys7MxhUH+yKMkgIqFrzwv58vG8l3iG8BXo6tH16349IzhEhYQMOfpeEmhrxZSdCfom6kok1idKZccDhySIuYNoJAjNq94gz5Hhm7rwQXlGK6SmNgCuiMJhTEAegwyA/uC4qji/zk7n7y+MPnufTENeQiOX0vwocQSoQRwuVTrVq0ZDWG6ghlmjV4iZVaUr+jXCdagelV3DLw5PxTY+GRjBBlDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec2cda2a-3997-42d8-b059-fc202cad5b35@suse.com>
Date: Wed, 22 Nov 2023 11:05:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/treewide: Switch bool_t to bool
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
 <20231120145623.167383-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120145623.167383-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0ff926-a146-4618-d959-08dbeb429555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BC+vMHV4iD0PoVYeUj08P3YzbYkAM0dwvwGgwkQe8KhmBIkw5iD51WhGK4S0Hi6S5J0nt80nhhUwSRrzXzWWdUSAZaDp/tF5iGRvIyF8nfpso0vDM+swWox3LZmhwcriykxDSQhzuNkzQytg3z2dITg8kmyY2ppfWCBeyxxTeVB/iqA8IF9XQynhoVKIMmY36DEo28PV2IRyB/Z9nyGYs4H4W04pRwzALaBkGcNcTAFtvw0Bx21spM9DuekXUs5icOKKwbP83LG7LG3TpQgH8py0373y7E00JSGvmd0EzJ2fF1nCAkJnnaN+9ViPzWqvjzab1XgmFiyVS6QkbuTIiqD+dEiCvapFeTvdx3tjSp7iDCykNm4ESec4P18JKnB5ao4+80L3ujgB4fc6bnn+sjzGjL4cT4E2AKWLbV/1fNfzbYQh+/P8LQz+C5MGKr9g4hPi0gM2LhKrWy6F94dheX34uQT1LFDO5O4a60+qa35AJC6SvmOVPG9bpT5dgT9XlX5zO1NdBdgBUgCN2YmVspLKrkPOAbeM+ww8Vxg9UhNVuJsVswyaBVT9ennc/fyK2oZLv+sqV017rvHa0mtFKAxef4FrcAZstihEwysqP7jtKCooGu4rA0bnA7jZgAGFZNN/B8YHmJscvb5dLJUvQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(2906002)(8936002)(4326008)(316002)(41300700001)(8676002)(66946007)(66476007)(54906003)(66556008)(4744005)(6486002)(6506007)(478600001)(53546011)(31686004)(26005)(2616005)(6512007)(6916009)(83380400001)(38100700002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjlaRy9nNHJwdWlGZitURGZZN0kxZHViUngyRmpramhkcmU4RWdyY1lJckVB?=
 =?utf-8?B?eWFIRXpleWJpVnFpMkpTakUyR0tVNlZHdXhYZ0cwckROUnBpbnp5V2ZJUjZh?=
 =?utf-8?B?SVpsVm9mR3phbTV4Ti93aHcxYUdiTmpoSjVORzAxd1FtNkVjMDVzb242dUpK?=
 =?utf-8?B?b3FNTERZZmV0a0FaNHl4QTFtc0tVM1RJMUxxR0FHL0lEeERhWjArUGZiTDlL?=
 =?utf-8?B?SVg2ekkrblAvdWZydUdFNkZGOWszRUpJMGhSQkZNcGg3a0JjYjZoV1RjUjlu?=
 =?utf-8?B?SEtOZ2ZMVjRxVWtWbER3K3ViOVVMM3FyeW92QUs0M21xQk9MTDEzdlpXNDFp?=
 =?utf-8?B?TisxRWVFVVFhSElCZ1NOQTlUbHFmMkNvbXp3dFN1SEwzWkFhVXFUcXB6Z3E2?=
 =?utf-8?B?ZWMvaUxVV1JSVS9TNnZMMVNKSVRXQ0pmVkdhZEV0SDVOSjJNR1R5Y0xnR1F0?=
 =?utf-8?B?VCttTktSRVBralZLZ3BFZ3FuUTdoc2RHUHhJSUkrOVY1b2EwUUxqUTNWTWk4?=
 =?utf-8?B?V3dmRW56K1Mya1lEQ08vZkxJTTVyZGdpL1RiMCtielJTdkdDRlQwNi9QQ0h1?=
 =?utf-8?B?alRXSmV3RFJWWlBLd2x2bGZ1SzBKc3NsODVhM254ZlVWVXYvVWlHRUJBWFpn?=
 =?utf-8?B?bXlocXZvUVFSWHhPQW4xZ0NVZVZjTHpqVGVUdUJNbWJWaVloTGFheXBwenp0?=
 =?utf-8?B?ZlB5Wmc5L2xHekNlOWVpeTREVDJhRngyY1dMb0pOMXlYM1d4amMwTjhOb0xP?=
 =?utf-8?B?NFYyVWRpUG5idWJaekpjSmhScFhxSjlhWS9RZUErbEtWZ1IxSWRFT3AreGNR?=
 =?utf-8?B?YkxaR0pmeGFwUFJaVHk0aDZKcHVaR2duSEtMOTVzaW4rbVVtWW8yNmJZZkZS?=
 =?utf-8?B?MGpLSFRCWHdUL2ZOMnNRRDZQZUtZSWZmblRxdHliSEJJbURHTnNScXZOQ3ZB?=
 =?utf-8?B?TjRta0RtUlVoZzF4ZzVYeHpEQ3Q3ZW9IODlGZHc5SUNyVG5WcklRY25rMW1Z?=
 =?utf-8?B?YXBKcDdwNXFNMTJOVUgwZUhNeDc5VCtqNDFTTGROUVM0MWh0c2Q0T1pxMzM5?=
 =?utf-8?B?NXhiTkVZMkhGUGV6U1BOU3cwUzRaU3RNOHRoejZoc1dYZzg3K3Z4U1dNLzF0?=
 =?utf-8?B?dU9ydmxuTXp6N2I1QXFabVFFRlY3ZWlRQUdSbTVFUHJxRi9GMjlLam85N1Bq?=
 =?utf-8?B?MjBjTWM2TWJyaFJUdFRFWjBuOGdMa3ZHQnVzT2w0cUh0d0UwVEtCZWFSa0Fu?=
 =?utf-8?B?OUFReTMySFVLbVh6UEZvRnFWQlcwQVhEVjFTd3ltQ2VlZFBzTTM2N0laWGhU?=
 =?utf-8?B?WTgwUFlLams0WkQ5N0ZDR2NncnJVM0NWZEdNZHdDSm5LRE51Nzd1V1lGM2xD?=
 =?utf-8?B?NS9HUGZkbHZpNjVGRDVlMWFsU2IyTTdmdXR0eDdqdlVyanpPdkVoNGlxd0dY?=
 =?utf-8?B?MVlWNlVyekFNTHdyM1RqNTNEVzNjY08yMjYxK3haaGNrWmRleFNmTDZRKzlv?=
 =?utf-8?B?WXJETW5XVEZGUE5KdkVXTVJ1QmZCdUNnRzYrZnJ2NW51aUV4bVgxRFV5ek0v?=
 =?utf-8?B?aWIvV1dXRkk2REJqY2Y5V01oQ3hGK3NNQmRDNW56NDR5alFqMEl2NEtzNFE2?=
 =?utf-8?B?blUxOUdUR0ZxY3Q3VnFTY1FEb01BUG01WllKZHE2dlJ2c1VLVXloWHVYTkhK?=
 =?utf-8?B?VUZuWkZNNFp2MW5KdkNVRUdBQlZZdW00RnozSCsyZVZUOW5DTytudjNLOHh2?=
 =?utf-8?B?S0oxYkZRRGphckd4U2RmdC9lQ0hjeVgzTGJ1TTRDa0JBZmdKUGo4TVhBQ0xn?=
 =?utf-8?B?OFBkeHFFZ0NudWZ1cTkxa3YwK1JzbEZTa2k4RkgybVA2ZXRVNlJDd25JZlpK?=
 =?utf-8?B?NzYvdGlSRUZISXM5Um90RzFFN0xDRjJvSjZpTGVBa3QzdkVhT1RTRElmRGNI?=
 =?utf-8?B?Wk9CMjJLRGx3V3ZXYmMwRjBXbWQvUUwwUFY0UStoSkNIWm55M1NqcUtBdXRB?=
 =?utf-8?B?TmMzRkMrdlZyclFFN3M4NWltTTJYQnlNTXQ1UEdiaXMrcHErTHhvcU5yS3hR?=
 =?utf-8?B?U2ZBcC8rUU9nTXQ1UnVPNU1Kd1o2aUtzd3AzVUhzN1NlSEQvYjE2ekFPMVZj?=
 =?utf-8?Q?LOfgHzzAoaAHra1S4F1OUe4+i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0ff926-a146-4618-d959-08dbeb429555
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:05:41.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVnCvW9in7oGelCdKqKTVaxGDNfYvuKwqjzrGkrt0mSPDCNUUTFCkGBQmreVVha8U8Pz3m3ELfbucijTCIlUkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9949

On 20.11.2023 15:56, Andrew Cooper wrote:
> @@ -798,11 +799,11 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
>      unsigned int i, target = order / EPT_TABLE_ORDER;
>      unsigned long fn_mask = !mfn_eq(mfn, INVALID_MFN) ? (gfn | mfn_x(mfn)) : gfn;
>      int ret, rc = 0;
> -    bool_t entry_written = 0;
> -    bool_t need_modify_vtd_table = 1;
> -    bool_t vtd_pte_present = 0;
> +    bool entry_written = false;
> +    bool need_modify_vtd_table = true;
> +    bool vtd_pte_present = false;
>      unsigned int iommu_flags = p2m_get_iommu_flags(p2mt, p2ma, mfn);
> -    bool_t needs_sync = 1;
> +    bool needs_sync = false;

Coverity has just (indirectly) spotted this mistake. I hope no others are
lurking anywhere.

Jan

