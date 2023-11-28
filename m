Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653C7FC03F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643384.1003551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81pP-00075X-Qg; Tue, 28 Nov 2023 17:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643384.1003551; Tue, 28 Nov 2023 17:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81pP-000737-O7; Tue, 28 Nov 2023 17:24:55 +0000
Received: by outflank-mailman (input) for mailman id 643384;
 Tue, 28 Nov 2023 17:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r81pO-000731-CS
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:24:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2e74f4-8e13-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 18:24:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 17:24:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 17:24:50 +0000
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
X-Inumbo-ID: 0a2e74f4-8e13-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPaOdAuX4De16G5BjLyHuCJJpJ5ys3+To27xGLaz3jXY4P4Fh+Y83qMqKdyqOnOmkdQfpxLRAAJ4VcSRZekg3rSbUzL8mj19NZmbwyomDbHk/jeDqGzhVmXvLELkhYfgg23+xJ9W6eLKfSjrIlym5EQcS/F6BxQwi0NGnfJ1eIUMUpp//T1A8+oxxkUCS25/Wcu0kKmLRSw/6kViQ/M5OSuGnWN0A6RjOc+oSPQ9TXceuURuG7S+mM5hLRFdjp+I4JH/xF3SdRD5dtq2eH2mkOzfhGcqbrncF7VB5Mo3C6oNAa/Hj99Z23QAzOI5teUSJvD0CvIJGq1TuWU5XA7Ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMcXsedGhwrciDSH7IosA3kJxY/D0gWCWyYN6YRzfLc=;
 b=J2lQD/sin8DEmhn2cGqi+kXlT/FOGtP+P1pmsIZrZEN5dfnmyi4YryMACyxrYRD68Yj0IqkyGIYWa+iJ5/k90fHlJsJvJhcczfbFhd152BHpdUY4RBV73XgPNKSPMe4ABJ2o9AY1zkW7C/+SKtAVkdmfz5af3yuJnz6DnEFhGMRrVHubYFNoQQgwYfQlvrz7fvuSzw6dgJOhBxR47d3IXbeN0ryCKs5QB6fyeFtAtrRz6VN1dgX1uvfCr9HuHidBsziByfEmDFPEWEEa2pKxeKWrXymnG5+cH+3GLs+5sd+LOnmWfyzpcb3XJrJJG9XxXBAO54IsbXvWR9JYe1Bwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMcXsedGhwrciDSH7IosA3kJxY/D0gWCWyYN6YRzfLc=;
 b=bX0SSJ66fqKA0Dy2ZsLrknvK0VGqSmC1SVvktYpwNQxBP8Jjdd5ml/xofsv8sxrDiuVC1+tsXZfdlgK8lzxdNf1MXHV91WLnbh8JYwjxuAu0aDn8N8asvQEr+njdHYnI+s8BwN34ny8iZNNoHB6R/1+iYiyKzSn6Eq0CHMmr07HDJ5LSVvTaOmQJqIC5lzz6/+RZZNMLdp0rzSaXhn9V5wqNv7xKbBNinw/Iar00AKpHDM4uKILiFBjdgxFLHAVWtXVWtbhwPvvWQlYhvARzmuP56ho/m1Ot4unM1leQGhs9/FbJlKuUZYEV+OmfqmW6/eE+4Lw/gmbrvi8ADLbsUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d0aad5c-0cf5-4142-b7aa-bde0597ea7de@suse.com>
Date: Tue, 28 Nov 2023 18:24:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 03/11] xen/cpumask: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <0ea3c74ef2e5524d0a9726b6e0795d50dfc32eb8.1700832962.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0ea3c74ef2e5524d0a9726b6e0795d50dfc32eb8.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: cadec6d5-b627-4a30-bfcb-08dbf036ed06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y2kY5oLnSHMskvGhFbAUuk71dFo9vv/qd2/BJZXiXY88QnQA2wsxcZcRno3VwkyIBQiCcyxqgkthGJhBe5lB2Xw7K3dzu8oWBSM7+c/pRv+xw698ig3lFEbuU1fzRvxpljDNNTBdExTKNDCxlCVwepr0po2vPqOCfUAxh8Y4XUS8SQOXEHp8WMmt0HqwbT6igOMSlsexz0ahljZA88+ABpv0tzVYn8UKrHhEI7MYkcG0emd2T3s/N0xRtY/oPC8hFoB9Np0qTaMDet3d/AaT/kAFt6a4tue7cI6NJ2yZTnfJ/zwZ71yemOd5JJMzcuuUtWi1rFmfqxG2bWl5KENxilP5f8S2hdxIegwO0uh0q7aqIF83Pb0bqIXglf2E40fDkMR+f6oNhtJfqsvEmr73VGhHDBFR7PYVOsmOCG9shh9C+q/i2Xe3LHrKgSaZ5C0ZKKC1I2A8hsfpNmvHyQAgae/9gAdsbCtGUmFv+TuylPTxJai7o1Pr4OiovH0bBPe7xA9Zh1sJ0/9uOb5pe5xNRPn80N9o2FEyefEMaiMJ/GANXMICtDFVju3nvKe/Oi1haNKgoorJxPqnKqqELm/EmaC78mPjDRg4QBHyar+Rkfw+EPE2U9rl1jABJnuSHBX0MCPA5jZEbJ/TvOg1VYk1Yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66556008)(316002)(6916009)(54906003)(31696002)(66476007)(66946007)(8936002)(8676002)(4326008)(6486002)(478600001)(41300700001)(36756003)(86362001)(4744005)(5660300002)(2906002)(38100700002)(2616005)(26005)(6506007)(6512007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkNLMkl6ZUhJTjFTTHA2MW9ZRDV0NXZZQ1o5M0ZxY21LQ0s0enFIQUcrbENR?=
 =?utf-8?B?NVdFSzNWK3BFejg4dStMbzVqSm5aNy8vY1ZuYVlxYVR4WHJ5d2ZpYW9JcDEx?=
 =?utf-8?B?bDVnSGNkSjI0NURIQzBwTEJWb3RVbElsaHFvY0JBeGUrdE8rcDh5ampwaFR0?=
 =?utf-8?B?cWtSckRPVEFvQTRTdy9MeXlubnBOL1VLVloyanRMK1h0YkhtWnJwV0M5RUNp?=
 =?utf-8?B?UGc2aWppVm1BeHNDRFBVTy8wbkZ4TnVxYkpmaDBDTlovMTd0eHlGUURCdFFm?=
 =?utf-8?B?a09HR1JhU1AwTmVJcXExTldBKzRNa08zcXBwdlJwb0VlTDRHSDdrenc0Qkpy?=
 =?utf-8?B?RDJhenBoeHJ0cXcxc0dwSnJDek0yVEVLdUNwd25pSVQ4QkdXL0tNajJBMXhV?=
 =?utf-8?B?b0ZmSTlmREFLL09XQi9Wang3Ym5zeXNuajFvTjFZcWF5VkpMTHcxOU5GVW9E?=
 =?utf-8?B?ZThmd3BkM2Rzem5OOWxOL2d3ck9Ga1dyN1VjTUl5eVBRWVRmbFFFSG40RWxL?=
 =?utf-8?B?NXlKYmpYbVhpSEhQRW51OHhuUWhtL29COW1VMEg0aUk2MEptcG5aV09nSmZh?=
 =?utf-8?B?RDRuY201dzhORFlMSGRObFJtMkVPM25UZ1cvL1NvZmpjZVZOc1d2dkRGeUFp?=
 =?utf-8?B?U3FvUlp0TDRZT1F6azllQWhzVk00YU9saVRoNGRyd3ljWk9VVlZNMFAwVHVn?=
 =?utf-8?B?T1JPUTdlcmVZeENPamtuTGZXNjdEdi9PNkYzdWhGaHk3RjBXYi9JZk9lbFph?=
 =?utf-8?B?Tkd1cE4wYWh2ZU9tMGdJdlpqMEp6QVhYRnovRG4yTWFtNHE5TVJTUmhBZWJM?=
 =?utf-8?B?VjNiaTl2VTZianorZU1PR3NuMlRYUkRIK3ZnMVJWTFpaRmEwZ0lIRjc5VC9P?=
 =?utf-8?B?Wkpla2EwWkMvVnhJMmJYRHBmeUlTeFREUzlXZWsyYXJoVUJHMEVWYitibXk3?=
 =?utf-8?B?R0M5MlZNSFRuMmNYbzBzV0FNTEF0ZGdRcDN5VVVNM21ZekxQS2VmeDgweHNk?=
 =?utf-8?B?TDI0alhkMTN2bVJVNkpSTlBQT1h2V2lwb0p6OXpRU3p4aE9Fd0N1UGlsTnRv?=
 =?utf-8?B?L0xKYjFlb1kxUG5PRk5VOWpuVUh0ZC9UenBoek5waG14VEtFUkFXdkU4cEJh?=
 =?utf-8?B?eCtNSk81K3o4SlZZRGxQTERoaGdyK1JYekRQd1F4VnFmWmhJSXRWcGdOejdm?=
 =?utf-8?B?TW1yZUN2WTF2OWJRTWdmcmtsMTFJdS92TDJTU2NrUFd4Z3ZNSUhTdFUrcVBo?=
 =?utf-8?B?cUY4NCthRllndG5DTGpHTHJvRmZ1K2VRNjhuaE5kVEh1blpTRGJBQ0NtN3Mx?=
 =?utf-8?B?WHZjWG5oQzJwN0VQR1FJaDFKN3U1TjBVQ2QreDlxYWVLQnVvQXVmWTdFL05v?=
 =?utf-8?B?K3hZa24vcU10VkplOUJXclM3c3NtSklYSEh4bG1kRmpqdHVCaFhrYWhvVmRQ?=
 =?utf-8?B?MThSbkg0UzdxQlViNGRubWtZcUpqN0tTYnBMQjhGYlJtYmo3aC9KaHo3QTNH?=
 =?utf-8?B?dUU1b244empCSnU3R0JNSXVobjVMOFUwQkd1TTA3NTQyU0tFNHJxLy9PcGFB?=
 =?utf-8?B?QkNySVU2QkpnZkpnd0VBUGVQZmhvRXhFdnkwTHJJdndVd0xZRVJRN3BnL1h1?=
 =?utf-8?B?S2M0a1FmbDBlN2h5Q1kvN2F3cjZrWUowNENvNk85cXp0aXFXUTM5QkswcHhL?=
 =?utf-8?B?M1FKdzZZcWgzUXhWMXFwQXFPYjlIRDhlemcvdndPaTRvYmVRVTNMUktxRkJW?=
 =?utf-8?B?RmRRTFliOHp1WUp3NzhsMEVjWjdUbWpXZVpTQTl3TmZCUmU3cjBtOFhlaVlX?=
 =?utf-8?B?Umhjdy9SSlJzYnhTcURxZzVDSTRFbDJHQjlMR3A3VGRDaitrVTc0eldBbTZ1?=
 =?utf-8?B?eUVvb01ZcnV6bmNaSmZjeFRlNTZOT1FEa0YrUDA5WUFsemdFaStUMEhXNUQv?=
 =?utf-8?B?cWlIM1ArUXFNVURzd2dsL05wK0dOYVRHNnlCSlhjRDlMQ0p1STdibWx1QkZu?=
 =?utf-8?B?RGUzbWlWZldVZUkvQjBmYUkwN0dyZ2FScjM3OGdCMEZHWlkwTkt3a3ZsbUo4?=
 =?utf-8?B?RFB2NXB4Mll5Wmt5cWswa1NxMzZTa3Yya3BLYUp2SlZTWFlUdUdCRFFKYkU1?=
 =?utf-8?Q?xVDoSaag/NoHvAekcIerv83xz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadec6d5-b627-4a30-bfcb-08dbf036ed06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:24:49.9728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FpOJ8kt11eqBGJ5wx7ca/knyFbxJFpl2PkgNMqxH0thJ8cVpQg6f+LR6fuGMKZWxG2fDDi2HvFpZwrQZNRwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
irrespective of this being one of the examples where types alone are
entirely sufficient and descriptive.

Jan

> --- a/xen/include/xen/cpumask.h
> +++ b/xen/include/xen/cpumask.h
> @@ -460,7 +460,9 @@ extern cpumask_t cpu_present_map;
>  
>  /* Copy to/from cpumap provided by control tools. */
>  struct xenctl_bitmap;
> -int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *, const cpumask_t *);
> -int xenctl_bitmap_to_cpumask(cpumask_var_t *, const struct xenctl_bitmap *);
> +int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
> +                             const cpumask_t *cpumask);
> +int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
> +                             const struct xenctl_bitmap *xenctl_cpumap);
>  
>  #endif /* __XEN_CPUMASK_H */


