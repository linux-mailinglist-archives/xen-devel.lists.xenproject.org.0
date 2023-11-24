Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B817F6DA7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640200.998106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RDO-0005Qp-AE; Fri, 24 Nov 2023 08:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640200.998106; Fri, 24 Nov 2023 08:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RDO-0005P9-6m; Fri, 24 Nov 2023 08:07:06 +0000
Received: by outflank-mailman (input) for mailman id 640200;
 Fri, 24 Nov 2023 08:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6RDM-0005P2-Dm
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:07:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e655410-8aa0-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:06:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8203.eurprd04.prod.outlook.com (2603:10a6:10:242::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:06:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:06:23 +0000
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
X-Inumbo-ID: 6e655410-8aa0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+bdnk9X+V75z8skkxKj+pZ56G3N6KXEqiYAyJsN2zorlbPRt7aP3gwFpxj9HgDWdTtk7Eq9PPNGqwAu8yuk7eZTZQH19uEfioYiYQQoNvdhT8SPJhaLcjcSlvemkqgvGgNhIuO7/GMbweDG/U8F+rccyV+q5GEy2oS+I4UFzOzmu4SCo6Tn9r8WZQBqzy3T/8qtpNAePfCT0EPJB2B3DRWUiOkIXlg0z3FeQIWInnV3mmGSQjI1BPH6qhVsTlz2R2mpx3SsEtEg2P/H+YshNPFPce5oen3HEYnsTL39sDhyqzGDUH//oUZ+993ostuZhVhxCpaUmE0Gh5m34+wl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox7qnDEJf8z4LNTvfU5qnqmobBlvukQnZSDw0EyR4Ks=;
 b=IpgYvU60Ajd0RAzUKJ9MO/DTQa6Hq4HWWVNdbK8uAYGk+1IoaX5Zp3rDez25OJ1JHQHvHO6TN7RK2dVM3TLGf6Bj/RwdfxkqaHYv/NyvICaQyLaVxEF1OH2HUTvQervsFRc3b9E7uuQCGmls9IVZbdyNF5hm656VybCOk6Cq3H/BLFfRFu4xkPl5GrOBG3NDW2loQklcVuyl+/MCvs8LTg190dURmdmeS1RnneNFemUGnJhCcJRhWCXHNYHw1mduUisNDVWFSo9ES62ceD87H6w136fE5vRCurFqjbOKGtJVNBVjCEIa2/fOuKdJhq6k0eA3aClgTkGF1oYN1X86pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ox7qnDEJf8z4LNTvfU5qnqmobBlvukQnZSDw0EyR4Ks=;
 b=DXLibEMFBPUWxYQ1uQJzIvWIcqkKzoDNOSRV1k36jV5jxdlb5aiFyyq+qPF6lh2PEB7Q1yDaCKBc+w62DqgWd2e3/jy1FPhX88BueUT73yNE+B2UQUZlFtWAbKCu5ZH84c+mICh71xkxNvavpnbCZkRpO1Pbsdge1dA5+O4MJP5dlMzIoDdLcYjA/WvShzgcLW+V96ikhGeTI2vlZ1daqcRZo/JBLoaoTOcDItKtxkQHmypXHDZbwliHNDNT6v9zRfSf2hyWiWP6BWqjexa6a9hDysovyws2zAgCy5LGCqsWMu+z811dlnh8j0WmOaem9WvOLAgcQ0/zQl6rG1NyxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <790c0480-7235-4a2a-929e-973e7aa27864@suse.com>
Date: Fri, 24 Nov 2023 09:06:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 1/3] arm/bitops: encapsulate violation of MISRA
 C:2012 Rule 10.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1700724350.git.nicola.vetrini@bugseng.com>
 <c7728964a8e6afdb1f52ed93f3d7459cc72b85ee.1700724350.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <c7728964a8e6afdb1f52ed93f3d7459cc72b85ee.1700724350.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: fba79b83-2cd6-4f26-79b4-08dbecc43fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6QECApVTLLDKPOvOOTqXhVSZzj1RbJOQrv8caiBPV7pLvpGXrrDSoDdBrZbz/xEHfUjjbFroSidf02r8X3EevgR/RrRCXB5EJnnpw8JfR0hEAqoLtkDXcbROyFcGayUZwf/up9FtNlyyRuhsVUnEH2S4uKxZM4Z7n7vI2D95Wu5urNpQtDCnm8VDWDaFg4Yqqya1EbQCTl5ottSIb5rN9DC9B4V/6V2r3y7F91TjrFyUKuhEAuvMBuFaVVJAmIvLVH4d4WiFaX/N8Vf6ltQLgqbJuot14vSSdfX6U1cpbx9cdy/MNYv1QM25+FF/yBdxVoeDkw+gS4EB2q1CmnxbisQrp4lX/hanbT+lFI3doowmRdd0qxXfEknvsA2B4eYxapGEp1k0Vhx8zsAWRVDrf0ZDksuOG3Xh7T4Yk2+EevN1x3wf+TK/jzeH3gzk/BqW0dLQCyTScGEqchDrMDppwFUlUq8fICWYNIpyXBNjydIIwJM4tVwVgTbA5VomKKHouqWILe+z/Axd9GfKFMZ6o/NBwgIW13/BcTTxSbgp+kuu+I2RNYoEXJOOcQ0VuAbgOH6ut37rpDd9ETsW+9CfwGIomGnXtCeI+mcp+k8COhdVlblS+TrYB750/vszDdbARifROzjLKwsYwSZTwFmwmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(26005)(66946007)(2906002)(66476007)(66556008)(4744005)(7416002)(2616005)(6916009)(316002)(54906003)(38100700002)(4326008)(8936002)(8676002)(6486002)(478600001)(5660300002)(53546011)(36756003)(41300700001)(6506007)(6512007)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVc2WlgrQmI3L3hsdi9WeTk0ZWw3UkV3bWdkS3dkT09MRlJ4U2tmRkNXdklz?=
 =?utf-8?B?anErWjgvUit2eThPN0FiMFdpTzlmZllvV2lMd3JsWEk0K0U4WXdvRjNYN3BD?=
 =?utf-8?B?SjVJNUFBVEVWazQrWFJMYlRldEtmb3preUtpTlYvc0hTTEFMZEpaUnZIU3ZI?=
 =?utf-8?B?aW1vNmFzWGVuY3dyR1dJQS9GcE1nTTFzUnNHRUpYMFBHMU92ajF6TG03RExY?=
 =?utf-8?B?TGRxK0tXYWk4TU1sSjBWVGxEaDh1VHpnK3RiOUQzYzdhS280TnQxb0pZVXJQ?=
 =?utf-8?B?OHRoSjNNVnVGbTFRZHBTNXM3VWRXZmJqbjAzVHJVdzRtL3VHbkNxaWJLbmc4?=
 =?utf-8?B?SEZoK28yOHY0Wk9FdzRKV2xYdDF3ZmhlTndRTWJnR0RsQ1NyNFBIeUtBK0hZ?=
 =?utf-8?B?emlwYVJGdVFkbE1QU3RQVlYyUGk4TW94QVZTWit5Vm9YS3h4NlVHV3lPRWhF?=
 =?utf-8?B?R0hoaGhGUTRJaWRWVmFCOVNGeTN0WE04YXRKSTB1RVZRR3ZxTGZKV3UvWVNZ?=
 =?utf-8?B?UUtHYUQ0V0RkRWdUSnozbGgrN01IaEpYbTg1RkZzZlJtSzRydWxwTm90Z3o3?=
 =?utf-8?B?Wmw4cEMycXNHZ3VmdUdvMWdCUmpUZUx2b3hsSUhqSnh4QTIxZ0xVejdKNGNQ?=
 =?utf-8?B?eVd6bUFNeDhWVEU2NFVhajl4TGVCbVJ6TGFvUkt0MXRNK0ZOV3dwVjVGUk5n?=
 =?utf-8?B?YXFzQlB4L2U3eFVXVjNFUDdmMmdPWGxLa09Qdmk1SWF6WjRPakFQbE9wSG9E?=
 =?utf-8?B?a0s5TllLSkdVMWtvSXBMVjJHZmEvNHhQQVNwdE55endRblBiNnp2MVg2Q3hp?=
 =?utf-8?B?dlkxRWphR1Y2eEpBcVJTbi9PTEVBbXhZRmx6WEtpYXhrU2xZTVRDUFdkS004?=
 =?utf-8?B?enVtU3kzNTJVTVlISkx6RVdieUpXRldKR21FVzZ6M1FCRUZKLzdXa3M4bFBH?=
 =?utf-8?B?TXVmaHN5Qmh1Nzk4OUljbGhaOTdSUmhUUXhacFpJdThGWmdPYkk4WWphYVFz?=
 =?utf-8?B?N3dJVzJ0a0xyYXM5My9zeWtQaUMyNXRwaW1yNjhrZ3FkN2RRZmhsSlZ4NWFD?=
 =?utf-8?B?bGNxL3hqdURiM3pPMEZhekNzQmVLRnpJdHl3ME0xaklWNkxZaG1KZkNyVUJi?=
 =?utf-8?B?NVJDOVpZWFdVOGgyNnkxN1hTMlRicktNQ3UwcjI2QVdkWW9XZlBDMTdsRFdV?=
 =?utf-8?B?OEU4YWZZSGtVVUFVWEZ1UGNnSk9iUEtEV2pMMXo3ZXdORFl2dVQrUXppYUFW?=
 =?utf-8?B?OEszQmZxWG9hemQ5bFYxbEZ1K3ZnYkZWc3FUeG4wNitMa1pHeXRvNDc5QXBH?=
 =?utf-8?B?bmR0Z1pBQWRvWHFaOVlEZ0FiQTY0MXdDWkpkY0JrempGOHNuWG9MS1NlYWtI?=
 =?utf-8?B?UmxSODRKcHBUdkUrOWJJRWxObDN3RHFOL1lEZ2xKZEV6R2dQK1dDTzZhbUcv?=
 =?utf-8?B?Q3Y1c3RURndZWXlZYzJTbWVnT2x2TkFxY05xdFRkU3ZPdm9RbUx1U1RRa1hx?=
 =?utf-8?B?NXM2bnl6RThYdjNaVEdKMmZ0U2hPZ3lFUlFHZVpHSmpNZ2xqV212NGNaenRL?=
 =?utf-8?B?N1krUUd3R3dZaGRMbk1aQVJYenlpU2tsbDRad005eklPVXBPK25RdzFBeGh1?=
 =?utf-8?B?RlVhaTVieTZxMGRYOHhJU3oyYkordzBPMDlOODNzdG5TSHRSZmhaWXBDNzlx?=
 =?utf-8?B?aEhKVkpRVERtUjZBR0RYKzFzc2h3Y2xzZll0NWZ2S2xGNVFhNnM3bW9taU5i?=
 =?utf-8?B?cktFUERXK25wZk1UbDhjNkM2MTc0UG5idDBOT29BcmlSakxMdXJBazZZNmIv?=
 =?utf-8?B?R2twbXdVTXVXcVVKMS9GTTFQTkhMaXM4TWtNZmlZVER4NmJBQVpqKy9qK2F3?=
 =?utf-8?B?RTZQeXhQNEtPMDYzejVYZnJaQ1h5b1Ayc0FpWG4zS203Y01DN3ZKOUhTZjlk?=
 =?utf-8?B?UHRxQXZQWHB5UkVPVmlQdkVBVUMzZDVXRXNyYUJNMFVVenNzcmFKaUNxY2VC?=
 =?utf-8?B?T2I5TituS3BJVWZ1OW8xN2NwN3M2ekVWK2FZaDFoL3ZKc0YzVTNoUUxxbS8x?=
 =?utf-8?B?OWVKUHhDRXM2eFdBc0wvYy84Rjd5VWhtVGczcko3aHZTN29zR0g1bHFoWXgx?=
 =?utf-8?Q?yPrJ1bSwuUDYSraUYbICEzuYS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba79b83-2cd6-4f26-79b4-08dbecc43fd7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:06:23.3345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5Vv/9LswS1pu3DHHRWYH4ypOQQYl6AlI0zAFnopiZFTVtTnNZ0GD3ImH4oXjPfJYzUh8FeANNKglN7CBWvyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203

On 23.11.2023 08:37, Nicola Vetrini wrote:
> The definitions of ffs{l}? violate Rule 10.1, by using the well-known
> pattern (x & -x); its usage is wrapped by the ISOLATE_LSB macro.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This patch failed my pre-push build test; apparently xen/macros.h needs
including explicitly.

Jan

