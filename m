Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107D7F1084
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 11:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636551.992148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51f4-0002Tn-5y; Mon, 20 Nov 2023 10:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636551.992148; Mon, 20 Nov 2023 10:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51f4-0002S2-2A; Mon, 20 Nov 2023 10:37:50 +0000
Received: by outflank-mailman (input) for mailman id 636551;
 Mon, 20 Nov 2023 10:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r51f2-0002Rv-UG
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 10:37:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7f87277-8790-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 11:37:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 10:37:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 10:37:43 +0000
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
X-Inumbo-ID: d7f87277-8790-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ulxx4T6nKyCyg2Oz/YD1SCzTXI93TkVh4iX1DtVyKXoDCnpcxS0hE/MglZX+g5mfMnL8yqlDuufYm5+UBBbUDEA55RqznPf2xf6oGIdfqD//GhV1tZOrgXu31sbZAAOOL7iNwkSP48TlWx7S/X8X0zV4kR7q7hXT9OnIuxOQ3W4MGfKEBzKe/LJg+LPmZlnoTLgU8c05HPieoNSVsajhqF+r2/Occ7+iNhYcxPBi2rtrloGZqeyp0gEidhiDvH4a3UhW0wfqNkQkGlVNSP+5YY92I4n1jF7aYU73bwh7ytOy8+KS+/Vrnij8Z61iU/Q0QgbScf3nUfTYxh+/Vu0d/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFkxyXI54AquBuExjBspjM6rfrVkquiRWE0YdVjJt8Q=;
 b=Ll1HWStiuf1SBThxQK1/GWIeDt2ehakw34h8+ZoYgAGWhgRArv59Ui30ptBBsuD71LR39OFHAJbvXuZ23LhUwio1fSaIxewYBC0yJoqOeLAHqvf9S4L5EReRSt0S5taeV6fHw/YXNquT175/OOhQU3G2Pw6DEwg/cDmRj4gGlw7rF36LLIOhuJeZu/V9tSsOwXxE/WbHCEndQX0cBXQ9MHKxlaVhqcsX1wJ8VsZjaDUgtjL+POLg2JdQDprJYmErslvcdDLmsYTYhYnLIIx2Ka+aXLkq+OYy+bgibW3UImGObv4Za2gwMyb86tvU+hxip1MuG/k23gp0ckq57He+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFkxyXI54AquBuExjBspjM6rfrVkquiRWE0YdVjJt8Q=;
 b=enRmn8GIFgPWO/XMXMMzm6JM1VZhMHBBbhu3BuFJQC0qkywZp/iC1z/VhuZUHX6jVGit53ySpo1oNZa7qjTZsWu9CvvvRmwfYhOXu18IUJIzajxI95P3QvTrH+QFWPEMmSAL2Fwd90dYUCfKPW3xQXuPeVzLmhNqXdrQXWf0pXa1Gb7nwXT3TqzP2+j7pciLAbxnEYFsZPURsygrWktTJHVxEfumHU+4S1bEHvDcZi3mNn/zJ1PpaJxWZLHfN5z+tVPpFb31P0qmK1lOAsZPauJXtWYGxIWuhw1UaxQGsVyKz34m9WoTVSKKkT50wieHuIlDnRik0i1V1CfZ83H4LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f414730f-307d-4ef6-9aaa-a861925fdab4@suse.com>
Date: Mon, 20 Nov 2023 11:37:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
 <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
 <ZVs0fvUQI9C7NRc5@macbook.local>
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
In-Reply-To: <ZVs0fvUQI9C7NRc5@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0343.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f6db4a-789b-4346-4c8f-08dbe9b4ba61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AwsZdZAZ8ZQ4IWgy5pgz1H9b57IGvhJ9z+L6JbyvTwVT0rApmPlLbGnMpYq2I8TC5+LPg2KwH2WIGE8Ttm8FCSl3Ag495Z/hcC2Ev/5gCanUL72vmU0Ae034Cq868OJdsoDHarw4UAe2wc6brlh0Gi8z8d/2D4krLAoa+r4M250moSrvfzSIwnV3b8OR8QDLz5G7sLt0V7avpJs2rMwHLiujgVh/VeNhLBVqtDh3IAIcaLDAwjLCCH0YTcKEHKaAs9TpwUmH4EQOqyxDTHq9+Wj83lSaVLqeJr4VYMyrgP2vJkzjRnOAvdE0KYaNBehPrfR1Bmg3ySWLU3j3zxlfUz90F5Gqwj9yfwnttBQSJpcqOQDoerUmt1lUQM93ZyFiLA++Z2StaqvLOH0cUO2ngHXANc0hO2iaLiJpbG+vUvLnjSJXRA/r9F46Sq3ozHosIDfJ2Gh58/6dDwBphuM3VSmQA0QRTO6YAXTJfw6/xhFlaUh1rWr68exZFUz6EXFe9Gwyv6WMY0XwgBoxsHzUi3Q6g2hNYTKB0btaZvBkOSmXFHRumI76zA7qyr/vl8dhrXf3N9V9ScfAZ4vjebJYYWgYXyZCnPrsK2nSxyR+Ha8qse6nza1B9DUv+o9Nu3vBJkAZmlVd4CE6R6TSA9JW3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(4326008)(5660300002)(66556008)(66476007)(6916009)(8936002)(66946007)(8676002)(316002)(83380400001)(26005)(53546011)(6506007)(478600001)(6486002)(2616005)(6512007)(41300700001)(2906002)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmJPSldvNFlWVjJ3WitZbDVsbHdOdDZHSFdkNDVLVHMwTkdtMzBvcFl1S1JK?=
 =?utf-8?B?b0w0TG9FWlRsNmxPRjQwNzl5Y3RLYS9YMW9TMFY2UGQwUUw4Tm5FUkNXbWdY?=
 =?utf-8?B?SEw5RXA4UExFQUwrd1d1UjFZSmdEcnpLMFJDTm9xRm1RRXRsblFONy9iM1Zu?=
 =?utf-8?B?akJxOGp0NTM1ZThDWEM5aW9rRkQvYWRJNE5lV05Pek5sYzVWUklQejhPMk9p?=
 =?utf-8?B?NGR5d01acDVrWXl6c2NZSzhjRUx3Q1NEL1ArT2RSVDlkUlJ1MW1mYnlYdVZw?=
 =?utf-8?B?Nzd0UGlTK2h3ME9kMlBhL3F6T0owZlBDVVlLd1dVcmJaa0pvMUs4S3k4UlNn?=
 =?utf-8?B?THg1Z3FCYUFXS2dKdkhyRDl0S2UyaEhmWGZLeTh3NytmczhOZCtHK3VRUUc5?=
 =?utf-8?B?STZkeVQzWG0yS09LWWc4V0NEZFJZOTJnUEx4Nk1EOFBMeWZ3S3QwcmNVMm85?=
 =?utf-8?B?ck1GRjkwUTM1ckVaV0VTaWNsbS9BQmZua1ltanVQOG05RDdFUWdLdXpscyta?=
 =?utf-8?B?YTJyZ3NIOHN4Sy9ZQ0x5TnhWcnlXNitBT3gvQWloc0RwVXNELzJ5ZytJSXU0?=
 =?utf-8?B?T3hiTXJ2ZG8wSTA4Y0J5MFhWUVhCdG03YjZTQVp3dmNkdC9QbTIxTWxzU2Yv?=
 =?utf-8?B?RzNGNS9qWmZXem1RQVYvU1lsSG9hdTFNNjA3NXBPV25MQzRuaS96UEc2MWhT?=
 =?utf-8?B?ZWxQVjdvaTZXVm44OFZsYVVGVjVZUHV5UWVLTEhQL1JkNWlaQUt2MHNhSmNx?=
 =?utf-8?B?ME9DNjhiamJnUjIrNjh2bzFtd0FUZVdPdGFXOXg1Q0dabGQzc3IxQW1oaDRR?=
 =?utf-8?B?RkJiRUNqckhEemZxRWk0by9zc0s0SHNGemd6YVgxakZTT1hTbzZraHJUN0JB?=
 =?utf-8?B?YVNRbWl0SXFWYUQyOXJjblBCZ3ZrT3pUY3cxUFFTdHB5c0w2Z0VBRm5ic3FL?=
 =?utf-8?B?ZGd3VlY5UFFObGlvZlNGbmdHaVZYQm1EZnlMYTE0NTlldk5kVkloeEljRzhW?=
 =?utf-8?B?a2lBQWo5K1I0eGtURk14QUMvVEQvSVlNdkd4M2tGVmNUMUlRSEl0c0ZTcitO?=
 =?utf-8?B?VHU0NWJScDJJRVpBR3gzY25HT051MEkxVStzbVRhQUFqSEFKTCthQUxyMFJk?=
 =?utf-8?B?T1RLNEFHbVRVUjRUcFI2RUs2YzdjeGVZZE12b3N1OURFK3NxQmw4dERyV3RV?=
 =?utf-8?B?dDNYQ0RQMlFBTjI0VUlEeG9DZUVZQ1lyNVo4ZVlEc1l4cTNzVzBYT3gwQm83?=
 =?utf-8?B?OHZNdDFvRzYvSWpUbVkrVkcwbGgwR3d3SGRsb3FKRmFLU3pUTW5iNUo2UmNo?=
 =?utf-8?B?VTJ5Z292WmZFSzNBNmlTbjJ4UlBFQ3ozb1Y0QlJXbVF6VUJ2NGtpS3drSUVp?=
 =?utf-8?B?VlA0WHlUaU1seEtUQmppTU9ZMXhWblQ3clN6MDBnbDlaeENUY1Avc295MUV5?=
 =?utf-8?B?UVlOVjU0Q25xSGpHUnNhWndOUEhEMkJSOVRSUlVRa2QvYzlIV1RFajhtZ0dD?=
 =?utf-8?B?c0plSy9lYmlUYlFIRExZbzZ0YzdMeWQxckZ1cW9qczFDU0JiNElvVVB0Y1BY?=
 =?utf-8?B?VWlkME9JWlFyTmJLT1ZjaytjS1hwL3VOM3RtTHRIazhuQ1dacmo0OEpSc0ZS?=
 =?utf-8?B?VExNdG9zWmhiRVkwWWpMOXJrQWVlV3RBUm1DdEZFSURtdVpmdFhiVG96anQ4?=
 =?utf-8?B?cWZYOVd4RlptSDFpS1dnR2FLMzdRUGx2STBMS053Y0ZVN054UDBYcWM3Y0hn?=
 =?utf-8?B?YkZ2NkhMTWN0NFI4QzRvTG1oc2tEMUF2VWhidGhEQmsrOTRCTklvYktpdlRO?=
 =?utf-8?B?WStWRWMrcU5jM1NPZzdIdW9zSGhpV3JwRFo2YjJnS2lENGpFZGswQXY1S1FD?=
 =?utf-8?B?eW9PcE14Z2I4RGdGTEtNRVlSd1VMOXFwcGlwL3ZxMlRGbDV6ZGJwbTA3U2tN?=
 =?utf-8?B?YVNuMVAveEU3YzQyYnM2SU1ISXdQKzBrYjA3VVpQMGxTVExXMDFXT1IyYy9D?=
 =?utf-8?B?bjMzb3Nrc3JXbnBiNm1tOE92QXQyKzhDTklrUFBEaENQT0dFNkR3bXprbjdU?=
 =?utf-8?B?SHlIV3JTRHZ4Mk9YWEh1VG56SEdqSENKait2Y3FOdUxpYjU5b1YrQ3dRZDFM?=
 =?utf-8?Q?FKko3cKg8Ivkx8wSQn3DIlcNg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f6db4a-789b-4346-4c8f-08dbe9b4ba61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 10:37:43.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T4F5St7ICw4ZaD2QasaiTomPLJ3UokSqUdD+HD5Nfr534FMFZF7A1gLBRXxufLxR4ZDh0C+mQfls3bqisxWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220

On 20.11.2023 11:27, Roger Pau Monné wrote:
> On Mon, Nov 20, 2023 at 10:45:29AM +0100, Jan Beulich wrote:
>> On 17.11.2023 12:55, Andrew Cooper wrote:
>>> On 17/11/2023 9:47 am, Roger Pau Monne wrote:
>>>>      /*
>>>> -     * Choose the number of levels for the IOMMU page tables.
>>>> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
>>>> -     *   RAM) above the 512G boundary.
>>>> -     * - HVM could in principle use 3 or 4 depending on how much guest
>>>> -     *   physical address space we give it, but this isn't known yet so use 4
>>>> -     *   unilaterally.
>>>> -     * - Unity maps may require an even higher number.
>>>> +     * Choose the number of levels for the IOMMU page tables, taking into
>>>> +     * account unity maps.
>>>>       */
>>>> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
>>>> -            is_hvm_domain(d)
>>>> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
>>>> -            : get_upper_mfn_bound() + 1),
>>>> -        amd_iommu_min_paging_mode);
>>>> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
>>>
>>> I think these min/max variables can be dropped now we're not doing
>>> variable height IOMMU pagetables, which further simplifies this expression.
>>
>> Did you take unity maps into account? At least $subject and comment looks
>> to not be consistent in this regard: Either unity maps need considering
>> specially (and then we don't uniformly use the same depth), or they don't
>> need mentioning in the comment (anymore).
> 
> Unity maps that require an address width > DEFAULT_DOMAIN_ADDRESS_WIDTH
> will currently only work on PV at best, as HVM p2m code is limited to
> 4 level page tables, so even if the IOMMU page tables support a
> greater address width the call to map such regions will trigger an
> error in the p2m code way before attempting to create any IOMMU
> mappings.
> 
> We could do:
> 
> hd->arch.amd.paging_mode =
>     is_hvm_domain(d) ? pgmode : max(pgmode, amd_iommu_min_paging_mode);
> 
> Putting IVMD/RMRR regions that require the usage of 5 level page
> tables would be a very short sighted move by vendors IMO.
> 
> And will put us back in a situation where PV vs HVM can get different
> IOMMU page table levels, which is undesirable.  It might be better to
> just assume all domains use DEFAULT_DOMAIN_ADDRESS_WIDTH and hide
> devices that have IVMD/RMRR regions above that limit.

That's a possible approach, yes. To be honest, I was actually hoping we'd
move in a different direction: Do away with the entirely arbitrary
DEFAULT_DOMAIN_ADDRESS_WIDTH, and use actual system properties instead.

Whether having PV and HVM have uniform depth is indeed desirable is also
not entirely obvious to me. Having looked over patch 3 now, it also
hasn't become clear to me why the change here is actually a (necessary)
prereq.

Jan

