Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230517F9F83
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642052.1001136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7af3-0006Qj-EK; Mon, 27 Nov 2023 12:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642052.1001136; Mon, 27 Nov 2023 12:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7af3-0006O8-B3; Mon, 27 Nov 2023 12:24:25 +0000
Received: by outflank-mailman (input) for mailman id 642052;
 Mon, 27 Nov 2023 12:24:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7af2-0006I0-4S
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:24:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4d8afc1-8d1f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 13:24:22 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 12:24:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 12:24:19 +0000
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
X-Inumbo-ID: e4d8afc1-8d1f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdPq4F9R5SAj8W+PG2TGE66vTjBhJz60soISivj5va1TVapdV846+/uXF50dURD5hsjh4HNs2oW8zXSULaMSRpCwj0i28VaQXx61X1n/TVBwSi6loBoK9aztxigQt4EOOLflcNhugWX1BRdjt7sXmHjCoXMsMF+Hv/sYFxuru6DIcUOUcYyeZRflbpdXdq5NFX+Z18tu4miZX/tm1hqZcojx5Qo9NHGFfwtEjiSdjOtdQ1IupwTJ700y7A1KhHD/8Gd48Z9gXMPfeegLDZx2nwXVa6ulmtO8t8/LoEwWp/IQNSycPWruSclcDY5uEPtPSKclnHEAaSyLAxDdsVBOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE5KAkUqjNeQY7q544O6gAWiH7k/A5rAtNQR4V56iBo=;
 b=Ii6inpEil3xeR2Bd0Q7KP9+Jl4s9Xn+LHu5d43cbu7XlylWsKxiYfTOTjvvgJ9OyBis6ueIB2NXPOpQ88zXSiNQnp7IBukr0nMCpiy0xGDa+LiRP/5+TF7IcQkmUzbu6MdJ3GGExVZihR5divYr9Wm8uMheBTxKHmGS0cH1utSBgU0OJ+2q6mYP8lIPDlGmjo/Iza+hJDuFk+1tqhOQbuFbmPeYmnQbz8vUeqRrgMqRqgTtLEddUKlql8fqBVDezozcepfZ92IFSmSTq7uJKfje5GeMGY2LvCcgArAY90K93jIEwPSQkgQd7sQDAiJuv3KvPXz+iCKAbfjth+2iVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE5KAkUqjNeQY7q544O6gAWiH7k/A5rAtNQR4V56iBo=;
 b=iKYuHR/xLsD0xcMRKNwis8njRquM9T5UUSA8F5LhDb7jeK42zVS9H8/kBZ7Nz6i23d1F3s5VcjMkVCEU02wsrcAFMjhGw90IrrHlOuUABIX6PscG/XkYUCfc3KWX1gV0VweMYpU5NZ6m/CirelYMINqL6iiYElbVYnBQNsZY8kxeb7IYFF/0ankDpScN71W/UMxzu5XFBrhak0FY8+xHSqqrXQKxe7I8HBwyXxgZh1m7/iIPfXXXMVznxv9KYN0ngQFMYvWxO5gB5jcS9/4xX8yxy3LUmU3uP6MB+RJ8R5gcDEoekrUXePGWUZVcFNMBgR/4uKwFitLVTs5Awcr7Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <699ef5f9-50c0-4c15-8874-833dda81e251@suse.com>
Date: Mon, 27 Nov 2023 13:24:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
 <2fedb7c1-5742-46d7-9882-d2ec336beece@suse.com>
 <71a22900-6167-490f-9d33-fe924bb96c5c@cloud.com>
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
In-Reply-To: <71a22900-6167-490f-9d33-fe924bb96c5c@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0359.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0cea46-70cc-4718-4b99-08dbef43c76c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i+W4MuKGAmwag3MqNrsZ7WgiHezlh0tvtl+ksr/GdWzYqCnlFfnKDB68SPGTsJaPZbStM03UWo4bewd99rrdWL59Ufz1frNCh7CPSlWKMC2SuE0wgeVYaJUul2B77Qm5HCi66PBvfmaXpFaO3ydERUxNjFl7RYHEklkIxcsJqFPB6jMh5L6C40mazfhT11rmx3gkgNnk8eEuBGT4p6ctV0OG2suULL3OQhfg8ZEm3vg/pymuKcpIQfCXprOmQAQtt3t7DaZktURX2bAL1cH4xlnZ4C1NgtWdW+zq5gwABKGHj3K/hyqfbA/iVcTi1tPi9WwvDMOTUFSC012BIPRIqjLXc7NzNEhb1ed96pSFd+ErpDKWPxZ8Ot5IscQ7scU8hNaEoU551/Je/7a7JaqORHi9vmeqvlGXghf8XQyUc8xdEbDmdE4P+loeqdj14BF+MYEJfxoDkrLwqSqCrKRbDckyLT9x0+DjPvV9ZCdvYPotTW4GmEgMn9CoKzcRcvGI2Q19VEJhInnjBucq1STLIbp0W3RuwwIUHkhqdDDKsnU3Yf4EhKX1UycjsLkeObU4vz+liSkmVTm2A+SaVGn7hft2EnjAtVj1GlhefkojfS8SW50jyzEgbbc1Ui5dFmha3cLb8LtyBm4wG42P/P0Xig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(31686004)(4326008)(8936002)(53546011)(6512007)(6506007)(8676002)(6666004)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(31696002)(5660300002)(6486002)(86362001)(478600001)(41300700001)(2906002)(36756003)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVBsRlZTd2FqRE1GSHFLc1Y0WU9yQnRCc0lXcDFzbC9hZHdwOVFrb0ZPdDJP?=
 =?utf-8?B?WHFQaU9XZ0pXeXdmc2QzejFHbUp0ekRYL05BZXZ3Y1FWeWFVVGlJSC92VHJn?=
 =?utf-8?B?a21Bb2JTRTZNN3hIYU1qSndjaHBaYjRBM2lDc3FiaGNRc05ScHJhOFhINnZR?=
 =?utf-8?B?OWFLODMzMExmRHRQZTBkd05RVkZWS2VUM2U1OE5DUitvRzNNVHhPYkpvTlMy?=
 =?utf-8?B?RkM2NVNBR0VsSDdscGZLVUxsQyt5WUZ3UHhtVndMcVBuQ1RBUzk0RVpseVF5?=
 =?utf-8?B?N3RHamFLUjJTSHJqazJySGRka2MrVWY0YlBubWR2aWZkTzJndDU4dHYzTEFE?=
 =?utf-8?B?b2xRMWdaeFkrQ3h4S3RtUlBtYnlrbTNFVFJmdEE3cFBqVE9rK3N6eUhvanN4?=
 =?utf-8?B?R1YvYjBYZjNXV2xrZVE2cWEveWNPdkRQbkVrMjFobjRxNkxWVmNlRzJwWWZP?=
 =?utf-8?B?VDRzNDBXeElPL1loTDhBTVk1eTF6Y3F5TmFsam41NDdYVFhZY3FmdDdURlNh?=
 =?utf-8?B?Z015UmozVzJSZEY1SDNsVGtaVTdJSTVHQTYvVlVqS0grZnlMdDlkLzMzQnVy?=
 =?utf-8?B?OGR6WHl4Zkd3UXMvd2t0WCs1VWJoUStQU1hPbS9QNU0yNHNKVVIza0FFdGJa?=
 =?utf-8?B?cHM2MmdVdmNRMHBjaldOSlF2MXJzQkNra3FVbGxDRVBIQjlNaURBYldlQlFU?=
 =?utf-8?B?ZGlpV0tBNDV1Q1d0SlZIRjNVL1pQSVFmTWNqRjVKTkJmNGNReitFMEpNZVlx?=
 =?utf-8?B?QWd5dVBLVzE0Q2RYcmJsTm9qSGI4enBqZXJIdlhMcmhsS1RpRFBtTnhkZ1B5?=
 =?utf-8?B?K2VRN0FIUEQvVVRFRHQ4STNqRDF2K0ZKLzZMb1NQODNFYmdGZGFUUHZKd2JC?=
 =?utf-8?B?TVRoRU5DMFB5Szc4NmRrdElxUHBJZ01YVmg1NjVlSTFGa1ZQQ1MrVDNaYW5Z?=
 =?utf-8?B?eDVkN1FWYmdXbUl2bEdkM3NvVjh3TWFZZ3k2Zk5CV05wZi9FZ0k5VWxtdzVk?=
 =?utf-8?B?aE03RzdBTysxOFg3WU9JbXp4cHUrS0c0N0R5VFl4di9WbG11SW9naUlPdC9v?=
 =?utf-8?B?RDg1REprTzBvY1V0eHlIT2tVKzNSbndObGl2Vk9JQXhrb3YyaDFWdkYyTldX?=
 =?utf-8?B?Q2txdkJYUDJqNFIxS0xrWlgrck1nMDVGV3Q3Wk80RWJaK2tnRktZZFdURSt5?=
 =?utf-8?B?Q2todkpURjlualRSVnkyRFkxSGFMZFRMY3BJRDdLaTNTOFozejlqRU5tTE1K?=
 =?utf-8?B?T3p0ZlF2V3dYYUxTbVBlbi90V1diQlRUcFRuTmJvbUlubDVKWktIRzNsTzdU?=
 =?utf-8?B?VE1VaXNQK21PWDE2WnBjT2QyS2ZkYk82dXBUbHlNcHFNWXhYSXIwcVFXMHI3?=
 =?utf-8?B?OXJRWWgyTlBsZDJSRUtVVmFWWVFJVDFxZkFtai9OSTVvZ1g1TEQ0MVpDS0dU?=
 =?utf-8?B?eUJ4elkvT2xvc3ZNcm9lc2ltMGx0YUgvSnFzcjREU09IdDJPUjVHL2luMFA0?=
 =?utf-8?B?VTNraUlGd3VNRGd4SkM2eXdaRmZIL2YyYjRaVGcrcDRhQWQxb1I2SkJMQ1N3?=
 =?utf-8?B?bnJmV25wU2x3Mnp1S0xpNm1WeW01bXBudW1WQ1htM05GdWVPeXIrUk5iK0Fn?=
 =?utf-8?B?SHA5ZjRvampsSVVqZXNaRWhhbUs0RHlza3c1bVVkWkxMbmgzYWZ1MHdrVDhh?=
 =?utf-8?B?eUNobTBZb09kWThDK2VBb1Ixekljb2F5QmJ2U2FrUFkxS2FFL1dRMFdKRGps?=
 =?utf-8?B?OGx2T0t0Q1Q4VHJPSHFZYkxOYmZjRlhBNmtvNDdiZkpIbUZ3R0lhcXBDUkZh?=
 =?utf-8?B?dHV3VytTMTJDaHR0THppclZGSVRVNm02TGgzSk8vWmFPMmtUY0xheDVsbjlJ?=
 =?utf-8?B?ZUQvSUJiM1UxRDlKR0RLL2w2YytZeGZBc1ZnaHZVWFYxMHFHMVZWalFVQWpF?=
 =?utf-8?B?bXVxa1lSM3Y5L3c2Z0lKWFJRc1ZraUwxcytuSCt1VmdQandmSGxuRFUyM081?=
 =?utf-8?B?TFR1VU9IYW9BdlRYMi9UZm5OWGhsK3VMTndyMm9nUWp1ZFZBUExiOXNoMlQx?=
 =?utf-8?B?cTkyYnBSd1VZZnN0aDUrUXJrTGozbFFFMTRIRlY3WnF6UzNqRzZiRGxjaWZa?=
 =?utf-8?Q?vvLD+Ni+/bFicXZoJGJ89aOMe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0cea46-70cc-4718-4b99-08dbef43c76c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 12:24:19.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iynaebg1hJ3yG8yEKwUIm/8CcbRgG3lJGEeQW/jif0MS8ScbELJR2TfUdf1ZJlz4ZGZdJWSvkqkV7dM2EIKrOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468

On 27.11.2023 13:17, Alejandro Vallejo wrote:
> On 27/11/2023 08:40, Jan Beulich wrote:
>> On 23.11.2023 18:30, Alejandro Vallejo wrote:
>>> @@ -1498,27 +1511,36 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>>>    */
>>>   static void lapic_load_fixup(struct vlapic *vlapic)
>>>   {
>>> -    uint32_t id = vlapic->loaded.id;
>>> +    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>>   
>>> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
>>> -    {
>>> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>>> +    if ( !vlapic_x2apic_mode(vlapic) ||
>>> +         (vlapic->loaded.ldr == good_ldr) )
>>> +        return;
>>> +
>>> +    if ( vlapic->loaded.ldr == 1 )
>>> +       /*
>>> +        * Xen <= 4.4 may have a bug by which all the APICs configured in
>>> +        * x2APIC mode got LDR = 1. We can't leave it as-is because it
>>> +        * assigned the same LDR to every CPU.  We'll fix fix the bug now
>>> +        * and assign an LDR value consistent with the APIC ID.
>>> +        */
>>
>> Just one comment on top of Andrew's: Is the double "fix" really intended
>> here? (I could see it might be, but then "fix the bug fix" would read
>> slightly more smoothly to me as a non-native speaker.)
> 
> It's not intended indeed. s/fix fix/fix/
> 
>>
>> Another aspect here is what exactly the comment states (and does not
>> state). Original comments made explicit that LDR == 1 contradicts ID == 0.
>> In the new comment you only emphasize that all CPUs cannot have that same
>> LDR. But the value of 1 being bogus in the first place doesn't become clear
>> anymore.
> 
> 1 is bogus for id!=0, but so would be 3, 7 or 42.

Yet 3, 7, and 42 aren't interesting in the context of that older bug.

> In particular we have
> ID==2 contradicting LDR=2, and we're allowing it. The reason why we must
> fix this other case is because all LDRs are equal, otherwise it would
> get the same treatment as the other bug.

I understand all that; still there's loss of information in the comments,
from my perspective.

Jan

