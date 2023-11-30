Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002887FF437
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645033.1006807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jSd-0005eZ-BP; Thu, 30 Nov 2023 16:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645033.1006807; Thu, 30 Nov 2023 16:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jSd-0005cj-5q; Thu, 30 Nov 2023 16:00:19 +0000
Received: by outflank-mailman (input) for mailman id 645033;
 Thu, 30 Nov 2023 16:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8jSb-0005KM-P8
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:00:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d8b97c4-8f99-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:00:16 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 16:00:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:00:13 +0000
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
X-Inumbo-ID: 8d8b97c4-8f99-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuCM12zi0TF4+r/qEJDon+yhg5xlYaCrR7fveRFJcbhWnJVP0Klf5UxPJla/asyRkMaXHCUjUkZ6bCvExmHhoCOrgPCVQtthTCzCn4SmFdCWDhycogLDE09Pv0zzAlG3cIHvnGi9xbFSWsh5WwJJwtXVYjowEoGw6RJSplXQu9exjc0bOZz6KtXG6cnCkM0QNVk/PGlH7s4ZKFQOiMzjtd8LlHgQ61L61IuznfmD6QHu6NgU1kHSJkceQodJOiixhxNZ8nAoM/GgdglAxCgKQURUD8UcTHmnQvdYyTx0LIUlW0EGf/rOj/bNz8FUxJdUUT9k3v/l01GYbDbsNjEw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=mpALbJgNC07GpiWC3XCKyFNM2JjPa2Dno7zhEZN9sH/MGXX4eCxnkOJEyGltbDkhgEyd4mFsTtPZ2JivxdOpzzifUzhMtjMPQlMrfa4VVDUuiHb623/oGrOQbZrvOTG1w9HrrScmYoOfgnyG55sJnblFB7sB1EkrLimAIfQ0RkfLgqqr+PO/B2UPgazLSppZUYnJjYaLP5/JRUQJ3DV9rOSCzURxfScsREJojPidJufBeFrmmhP7gXw7Qi/+ze2E0l/HKlOe/6WBpEpnjBmsKjCNNnOM2Z/tXAXRdb4VNjFXebUvtDsQDhIn+pLzs33bo3MwE3IDhL+9hn8v0ZIYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=359se0zwheblR3gQ8iCEWo19fEVQkaMnFaZyxNlsiXQ=;
 b=KQVwDUlMA0Qh7VZUCSLt3VDCtSpufT6EbBPaXbmiDYNlXSX2zq25TIDrC6kOUZy66soq5oTZenzw2lyV71MQkAFgf1XC3KmcaGByF1gPst0GeqBaTcba3dPaOzSYMgNkYCc3oUm7Jic71sG3J3BygbaKoBYOSRjfj667k5KwGEbEx0seJATTbCcmbkZSzf1zQej83u6RukCDzYvt5lW/qA1Yw6lCKV/FV1nakDzZRoifAGK8mV9Mhzlzd1q7/kJ1OlsJrFDolIISNKwrG/XDXca1ns2EG2jwT5j3DoCAoBj0F4XdsZmgI017lFUj/CPMU3iMII42sgFmJdOm9/Nytg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d59754d-75a0-4536-80c4-0af73f8d063d@suse.com>
Date: Thu, 30 Nov 2023 17:00:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/11] xen/kernel: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <2f551139ef5a26b203c6c089947ca4bc5bd29d5a.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <2f551139ef5a26b203c6c089947ca4bc5bd29d5a.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0437.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 909bae90-9863-46e6-9faf-08dbf1bd700a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yXIGaQJ58QlEKS4mEpeuMrtQY8MFrsWNaj9JKDvoODc6KRmg5IHzICwZ3mBHYJ4Tkr9r+s35L/WCDisEdY+tzhiR6nM+pCJuSy2EJqNAPDbkx4rBpKqf45LgZVym30UplF28EZRCTbzRyTCXe8GKax82WhKF745sydqyacW/JZygHFPTBQDYF7f0bQrjfQsRcZX8vZeFSz0yEAJ3E7EZD+FngIjG70kTtluHtmwKn+autf3hdUl2t7320FqUBB4V3b+ZfhomV8pbkor11PvEeiIdilYrACUrIVE21o8/en4F0QWgrj+6XpFVy2UUaW/0Qo2uuOTSPuWEJyeLFNMkaM0Cj4MoOoBbADeHDQ5Q7H1Zrvy9mZ/rd0f/XIYKTFbqyTfRzTv5/qB3VB81BPFXwHNjMoFExOGD+ZB2QKpve+EC5AdcbOtXNi8LG80m9guHw9bTm6OSzCeK6o2x0kY/wqbGYTrCYxfhi3fAMenT/uNxleD0iXS8a2YtIzqYN6EjA0Cevgl1R//cSaLVU4hgQpSaCDXmPI6G5dKLQymPeyNKUhZ2x/ZPdIh9/j4u8eV1KNZMB+9LrcjxFrjc0fP31jnkuH4dsK9CUVFVqc0VtZLjj4dyFHSwKLgYijy2ui5c64FW2yFDEgVLjLnmo7y7vg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(31696002)(86362001)(316002)(558084003)(4326008)(5660300002)(36756003)(66556008)(6916009)(66946007)(66476007)(54906003)(31686004)(8676002)(6506007)(38100700002)(2906002)(478600001)(6486002)(53546011)(6512007)(2616005)(41300700001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU1sZ1d1eUVlWm92cElJcEUwRWJaR05NQ1FXY1B1Z0lKL1NXeWpZYXZJVE1v?=
 =?utf-8?B?Zit2elhoRUI0cW9pTW9zMVpPeWpydyt4WnV6RnRBc3Y4ZWJvdnY4M3BWMTZS?=
 =?utf-8?B?dThiclQyYnRyTWJLN05WUlhUYUllUktOVGkzMWhjclZnd3JvT1dzVUJqSkxR?=
 =?utf-8?B?SVJ2WVVmWEw4VUdROFhSaUI4QUYxaTJVOXlhMmtpWmxiZHQwZktEVGlqdmdv?=
 =?utf-8?B?MUliM2dGYmN3aU8rVHhZSVQrRXZ2N2pOczdWQVFWNFByUmZlRjF2RlRHc2M5?=
 =?utf-8?B?RjZ2Y0YvSndtYXh3N0VpaDlFREdOc0RycFhISXQzb2t1d0J5cElwY2lrYXVK?=
 =?utf-8?B?QXlLRm0wbUNhOFp6MnRQaWFvbVZOclA1R3hIMDlRa2k2blByNll1YlB6Z1Q1?=
 =?utf-8?B?RWZXSGR3LzVwbllLVFZFbnRTSExaMlY4Q0xjUktPakxVNmNkbjJucG9ESVJs?=
 =?utf-8?B?VnQrY08wY3ZCYklzemZCZ0FBbjIvZVZuampudW1ZR3FSeHI5L0k4enRpSVJ2?=
 =?utf-8?B?Z2F0VWJHaDc5S0NkY3JuS0QwTE5YenpDZGE5UzMwdVhJN292SVF4Vjl4RFF6?=
 =?utf-8?B?MXFuTlgrZ3NPQWIvRkthYkpYVXNzOGJxZXFDaktqYzNNYlJQU3B6bHM4ZDdH?=
 =?utf-8?B?Nmsrb3hCSERieEdGNVIxSUdWbWcxYmw2NnJZMzlzdlVOV2FMelFOdTZ6UVg2?=
 =?utf-8?B?eFdURkNuL2ZOaStqS2pTa2s3SmVGbERSbDdjL3p2TTNEc0NOcG4zRndVWWIz?=
 =?utf-8?B?TEU1aEVUa1daNmVnRnF0UUZJN0FPN1JLbjlRVnlvQTRTeWFiWnhDRHlLd3h3?=
 =?utf-8?B?bGNwSWpKdk84K2pwMHB6OEMzRmtHeGRialhZWnA0d2RoM21CWDVaOE8xc3JN?=
 =?utf-8?B?NUdZd2svSmExOVZTOU5CUVhnQ1lZcm8rOVNFbXFtNWZPRXR3MS80NHE1VXNY?=
 =?utf-8?B?bEJ1dm83WXdYa01YMEd3Q0pXTjhGNFZBRitsUEM0Y2xJbGRDTDZqUktBU3JM?=
 =?utf-8?B?bGgxc05laGRIRERmQkYrSjU3OVNaSzlNU3RxeUt3Q2FtUS9yYUl3ZmowMVVn?=
 =?utf-8?B?S0ZvRUFncERsWFNTdjFiZFhoT1h1R2VLNkxFQlN5aENuNSs2UUhQRDVEaytO?=
 =?utf-8?B?RHZYSE4rbkRIMVR3S2JoM3kzQ3dTdG1wOVQzdGNYd3BMNmVvemRzZ0t1YXFH?=
 =?utf-8?B?YTQ4S0xGSVVhVGhkMStlZk5VNnBYMzlVN083TlBleXpER2E2N0dlRDg5WXM3?=
 =?utf-8?B?TExzemhTVG9SNXZDdVc5WVJ6aWowSVYrS2dRZnB4Rnp4ZTMzMlloellRSGJq?=
 =?utf-8?B?OTVKdk5TUTE5OXdGNXpsNXROMmFRWXlCc2xlcSs1MTZUNmV2WnRmbHhrRWU4?=
 =?utf-8?B?bjRxUW42RmpkMEh5a2FkWFNtbGsyK3lkeFMrdFlFZi9jZllXWWRIT2JpRjJa?=
 =?utf-8?B?cm1BS2dtTHNmNTdDKzBnWkVIcktGQjFVYlh3dWhVeXo4NXhPY3pFMXViQWMr?=
 =?utf-8?B?bTIzLzg2R0sxY0FIdzlVSG4wSzZQcTQ2R3hMbElJeTlRWW5BQ2NkQTM3dHgw?=
 =?utf-8?B?VTZBeDEvM1lTL2tCTkVmQmdSdmZNNlFPUUViYXp5c3E1Q2RWMWxHdWJGNUEx?=
 =?utf-8?B?ZFdiY0EwY0ZVd1lyV1Nmc2hpakpHZmUxTi9iL2gwRWQrdXJwY3hBNUk1S0tV?=
 =?utf-8?B?czRlSHNsbUFIUWtIZlhsTS9XZTUxK2VtbjVxbWFteGhRS2o4OXRhWUJGd3lZ?=
 =?utf-8?B?WkZzQnNVcm9OQUlpTGhiSHRXSzJTTm1GZXBUNzkvd211YkpkN2ZmeHpkeGxY?=
 =?utf-8?B?OHhQbCs4RW9Gcm5sM2pMVC9lL3gyaHhsVkVaQXdoWW5ZTkw3MUJDVmJXd0Fo?=
 =?utf-8?B?N2JUNE5aWVlwYXpjOENwNFFJVy9nMHMxbERGanBqYWVHZzlkbFIyT0RmTExY?=
 =?utf-8?B?aU8wZEYyQng1azJLbjNvbnV1QnM1alFQaGx2dGpaQnhqVzNQUVQ0M05IY1FH?=
 =?utf-8?B?WjVOUlV0bFBaelBPYVVFSXoxWHNyd1NoSnM2SnRtVHNoTTNzeW81ZkM3aEtF?=
 =?utf-8?B?OVRQL1ZSODljVk1jZk5KZ2tsZ2dvTlF1SXVML1Q4Tlh3ZWl4RlNSalNxelF2?=
 =?utf-8?Q?PEI0R5OJ0qUDcHK0OK/0tH3Xm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909bae90-9863-46e6-9faf-08dbf1bd700a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:00:13.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z/kkekVSVUvRe2Pl3Ba3tflFk+uU303fkax6zscv+KRIP1OH50zl1J8dQ9oQ+L+E/r4skBiONzxhHZc9HSTKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



