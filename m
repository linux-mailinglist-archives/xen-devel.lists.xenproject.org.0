Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2217F5922
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639363.996644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r643u-0001w0-Pe; Thu, 23 Nov 2023 07:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639363.996644; Thu, 23 Nov 2023 07:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r643u-0001u2-M2; Thu, 23 Nov 2023 07:23:46 +0000
Received: by outflank-mailman (input) for mailman id 639363;
 Thu, 23 Nov 2023 07:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r643s-0001tr-JY
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:23:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b614167-89d1-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 08:23:43 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6785.eurprd04.prod.outlook.com (2603:10a6:208:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Thu, 23 Nov
 2023 07:23:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 07:23:40 +0000
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
X-Inumbo-ID: 3b614167-89d1-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAav5ZSrei3eTIl+ri+JXWCNJIiI14yy1LQHuN6XXHaRVMnG78I1HfbNP8hYjoYGSkSMFHI+sDfX+7pUImFjoJoo1rrPZfBFBXXI3tGQOJ8/lnUuHP0tPoxNEVQCZhPZh6Vu/PpZ/NJ8yfXlTubnOh60T0ra02eL8g/ydLNxm3RTj4R2oP1RGJk+U8pz4wTpNp96iwPW9BHlu3u/GLtxluvBrVXs7VarGKsv0+ph8pLAVozkpHxy91WBe2NTNU3AaEePP235DlrE5GW20lvqnhHAZvXMOESJkDvUK0qe/dWsf+2eYRLvlL+gC28pqPtuM+QoAlXShECPP7XSXoeukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndpmDTzy5DPBvW2271zBbDl9FN8C9aabe+09cP/JsdM=;
 b=C3IbEtydM7DKZOaVJL565LDk7AN5Uvb+r5//lNcuG/6b9MmP9l2uOhmVs8K3VXhsXT3zeToh06C0rXFFUm4h81UFog69goIpJnhVThAk4TbNNx+BVP6lnmVFot+GAufuqhQEbegJJhOD0Yx7hqP2a4SkERAJSPWoLn/Ek12AAXa0D9v85Tf3Yp5Q/pxiExTSR8sVGgiafsTq+txd+wm9k74rNMlLy1VcQsQPDDRULBhsSviM63byi8gkU/cDZ7ybPFCGtzqtqqJD8H5hVyK2W15YQ2AEKqPIOdtX/GOb7xZyuhTaVWNHSvCw7NYsWChem4pLgzwHT2cQ/uSV/ZXxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndpmDTzy5DPBvW2271zBbDl9FN8C9aabe+09cP/JsdM=;
 b=TXwYFrfIQlberv5q42r+r6IpHlZ2D4B63JV/OJlDGqCNs2QmTB+5dwkY1vesVkSr21w6Mz8cfj6nwgNtoCh4BYdQC/jFlFotGh5lx74pfi25swuSSINcVyOLVGgPspPI6t6RzF31BATIImvkcRBoNV5tdMHcZFKti5ynLfYGyPqfIlgFPytkrSMwGwGby+jmVJMBqkLRTaDhYZ8NZxnNCTHuZ2XI+kCN4oDqP82EdsBB9QTlgl+OiFt5FeBMRo/GWLIHVhZb7zNTO4W2lVK7yEh13EDYaVyTy5OJfIxQqSqGl10OZDwwii2Z6kf8QlUtZv8VJLqVoZCS2z7qlzu7yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77296c34-1bd1-4fec-839a-d3e6047787c0@suse.com>
Date: Thu, 23 Nov 2023 08:23:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpuid: enumerate and expose PREFETCHIT{0,1}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2736e884-4b28-4ee9-b23e-24e763355d1f@suse.com>
 <a09c90f3-d720-41d7-8b21-42cab58bd0b8@citrix.com>
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
In-Reply-To: <a09c90f3-d720-41d7-8b21-42cab58bd0b8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: c090017c-c42b-4d7d-f074-08dbebf51df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mJ6lOmqWlNSgQ5UQVW/LYnltWekJNBN86heOt+t10uKfQplJZ1i3SMXYE5c59T8xDmeCd+BEfOVAhSDHRbLf+Uu8rHPek2WIbNS/or2tAkdD9BspEz/UT5+0uldzPhwrWM/eLj02cNBGBdVCyKZgWySPmr/TgOyMvHOvNHvjtQVUJzc8Txb73q8mNvao1n2g+/WxccgBd+JolrrmlHxYNimJJfy0wGUX5aN3ZGapDkICvWB2dnU0Pvz1SeEqTE/RmrCsAMGB8bUajZRFEcRlVcx8xRz41j5mgK0lI0znFFuWHp42QiYUNYlmPQMaxfVWFR6jxbDZlZaYFfmfojGIxHoEHAkCYS2vUi5Fg0Z1z+P56sIwPWTiOUHpS/YQ2MSYUz65u7cj0MHsITxolG4wOyr5j3uzq/0PDYBWAge/smC7iJNhLfwXHNYdw4+yWiWa4THLtusoEbSQJttjwhMEQWlbgYEGq+MQ3BefIU8M1yzdWgguS/ERvEIGFbSnuYX6puU9vVTInHJIDo4NxL/xzVgAT/nGX8+no0h0nXo57QkY3+cd9WKG7UsNoJGMrEMNmIklL3vm40O1EESnTYY5bwOLKFmwB6swxKEtRpylyjpsFU3BH1C0UblY1GMw2cMNiJMx1f4OTKocDdYACM1fyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(66946007)(66556008)(54906003)(66476007)(36756003)(38100700002)(86362001)(31696002)(26005)(6506007)(6512007)(53546011)(83380400001)(2616005)(2906002)(6916009)(316002)(6486002)(478600001)(5660300002)(4326008)(8936002)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nnkvb2RYSlU4TTZZZlhNY1l5VU5mamdXK0RmUlNKcklxTVhCZGZCcTZtOEVl?=
 =?utf-8?B?ODNBU21XK3pUNmNOR3BzeTcwRXpLRTBTNjk4SHNhbmlqWUJ3bWNKNVdWdGJC?=
 =?utf-8?B?a0V4SVFjMzE3NThzZDhyNnkxK0NXdk1lWVhPRXkyVytEN0xjbnNETTd5dGFa?=
 =?utf-8?B?azBBMGlZa291Y1AvU1ZDRmhpU2ZzT1ZLVVFlUXVMbldCWXRFSU4yQ09GQmJR?=
 =?utf-8?B?amlqb2szRXE3dXk3bllPdkZ5bDBqRmdYMmZqeWY2dE5BVFhFQ0dJYmtTVW9p?=
 =?utf-8?B?ZW9vWVhFOGczQnJwQURmV3NJdTVObTYxMU5Rdm5Xd2hrYXNDeEtqQWw2ZDh0?=
 =?utf-8?B?VmdPMFpaUCtOZGtmb1VVMFErSHNSaVo4U0tCTjkyYk9uZnFsZm1nNitYMndT?=
 =?utf-8?B?QVJLK0Z6RVpwK2pDeWgxUmZwZ2I0clhDUWZscWdBb3RqZ3E3czdYQ2Y0MkZK?=
 =?utf-8?B?dlBpV0pUMFlwN1N0alQ0aFBMR0t5UlVmNy9DYngvbHF1SWZSWngwVTNSTWlh?=
 =?utf-8?B?QkNoQmQxaFNTZTNFWHZ1SllrVVVBb3U2NzAzZHVjZnZHbk91akUzbGJOTGR2?=
 =?utf-8?B?YnIwOS9DV3pYQkRRZTAwL0lqangzeDZ3ZEZnYUkzSzhWZXNlaXhrZ1lKVEky?=
 =?utf-8?B?RTY4ZUFZNTBrOGhDTXBqZkJVMGZWOC9HaExxV0plajk0eE1iZ3VpenJzbDlX?=
 =?utf-8?B?a2x4b0ZEeW1BTzF2eWEwSUtSZFZHNHQ0SlhiZXlySUd5MC85eS83QWlpMmVM?=
 =?utf-8?B?RWVSbjFBWWJ1cjlnSkZCU2dmbnBxQ3k0RU94eHZiNmhMS3hNRlVzaEV5SWh1?=
 =?utf-8?B?eW9IODNFcjh0NG9YQkJ1YVduRGwvc0R6MkN4TTNKclNHNzVQTTRIQTV6ZDBz?=
 =?utf-8?B?ek5ubXhFa1BRcmdZeGlCS2t0T0VrNStuNis3V1dMRkVoS2dGb3c5WlQxUXph?=
 =?utf-8?B?SGtPcUY0eGk5Q3hwM0VMaS9WblVTeS9IUTNscHMyQkhsMXVSQ0ppSXpuNHFT?=
 =?utf-8?B?VmNWd3BrVU9VaDUzQzlnSGVCcTdCSmUvb2hyKzQzUldYV0MyOEY3RHVzZ3h0?=
 =?utf-8?B?UFRDdlZWWXN1VUp6dHppamhmQ2tNbjE0bHh2bmU0cDVXc2hsekYwcTJwdmN0?=
 =?utf-8?B?RU5yWDQ3SDdRWVJ0VXdJZGZXb3d0aDdSWkxMdGozK1czakhWZWZnQWpMWURE?=
 =?utf-8?B?OGI3VkpTT3pvMCtMZE1DNTlIdU84UGM0bGhmSkRkWDYwQmhqenZRRjQvUWoy?=
 =?utf-8?B?aGdXNk9ib25SaktVNXpzcjd3elhoaHhUdnUxbDRmcnNEMStnNFN2NjFBYzEw?=
 =?utf-8?B?REoxTU5yZ212Qy9aYzNPZVhkQnV6MGs2RHNtckNVazI5QSsyYXEzbmVsbXEx?=
 =?utf-8?B?Kzl2YXY2d1lyV2cyZzlEZVd0M2JMaXVWZy9jUUdBT3BIVVliWm1JaUt5eTMr?=
 =?utf-8?B?aUg4T3ovcEFJWEgraC9JVm5ZdTNsOUF0cjYrYkszeXgwVVppNFJncFNjaktZ?=
 =?utf-8?B?WHErMDJ4NkJ4VURSOHd6c25Gekh5cEV1YXduZHdOdlpnaCtibElaajBCTDUy?=
 =?utf-8?B?YWxqb1pyR0tuNktwRE9CdWVnc25KS3NMQUQrVmxwNTdTMm9XOThRcWZ4OTBr?=
 =?utf-8?B?YkZlRXJrcmlKL2JrMXR0ZllVc0N6WTh5RXNqcHRVN01Ea3pnUlU1eUt2a0VR?=
 =?utf-8?B?aG9tV0NDMzlhWExITmZlaHBLT3ZMbzdHWUg5YlZqajlsU2t3WXA5VkdCTEtP?=
 =?utf-8?B?UU5ENjVEL2NiME83WGxsVm5Dc25wNjIzd21JUm5Qc1BQYTdwN09QSnFNYWlt?=
 =?utf-8?B?ZkkvQ3NrdVJGVjVQZ1RWLzVQSEVjUlRLckVoWjhpNW8wYStyY3ZlSjkvRkEx?=
 =?utf-8?B?U1ZlTTM1bDVONXAxVkdpVm1SVHNFLzJKQlJRbXltMjBtdE1TVzJwRWJ6SUpP?=
 =?utf-8?B?ejNSYmJVdVQ0TVdLQkRONDM5U1M0U3dyODVEWkdXajNGVkxkL1o4cFZBMWJz?=
 =?utf-8?B?M3JsaVFvdEdFUWw1clBDTm9KZGFQZ09ZVVc2eVB2Qk1QbFBrZFVKcDk2YmZx?=
 =?utf-8?B?dDhvdG5Mb2pRaHVsc0ZEY0wwZFNwOTk3bFg2WTQrR2dEQnAxd2plVGw3Y1RK?=
 =?utf-8?Q?dI6fSdBR9fYD8YC2J//ZK+0gn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c090017c-c42b-4d7d-f074-08dbebf51df4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 07:23:40.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtGSPYCErz8VyKYKcjZ5fykapHQ+eg+7ec98Zw0yZo2xBtvF5SiZ963OoXcE/CJGeAoibPOhYCWzXr8zIoUkMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6785

On 22.11.2023 13:25, Andrew Cooper wrote:
> On 22/11/2023 7:43 am, Jan Beulich wrote:
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -274,7 +274,7 @@ def crunch_numbers(state):
>>          # superpages, PCID and PKU are only available in 4 level paging.
>>          # NO_LMSL indicates the absense of Long Mode Segment Limits, which
>>          # have been dropped in hardware.
>> -        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL],
>> +        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, PREFETCHI],
> 
> I know this is what the ISE says, but I'm not sure it's a legitimate
> dependency.
> 
> It is an implementation detail that Intel depend on a RIP-relative
> address, but there are no architectural reason why other implementations
> couldn't make this work in 32bit too.
> 
> The worst that happens without this dependency is that 32bit-only VMs
> see a hint bit about certain NOPs having uarch side effects, which
> they'll ignore for other reasons.

I'm okay either way. Adding the dependency was the only reason to have
a v2 ...

> So I recommend dropping the dependency.  If you're happy, then
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

