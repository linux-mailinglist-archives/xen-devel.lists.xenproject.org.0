Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22077F2814
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 09:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637578.993500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MUe-0007b6-5D; Tue, 21 Nov 2023 08:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637578.993500; Tue, 21 Nov 2023 08:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MUe-0007YF-1T; Tue, 21 Nov 2023 08:52:28 +0000
Received: by outflank-mailman (input) for mailman id 637578;
 Tue, 21 Nov 2023 08:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5MUc-0007Y7-Ay
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 08:52:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a57b343-884b-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 09:52:25 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8666.eurprd04.prod.outlook.com (2603:10a6:20b:43d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 08:52:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 08:52:23 +0000
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
X-Inumbo-ID: 4a57b343-884b-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9UDxEvcK+HXLFT84w5i0oqHl7vhDUXtCIGAtMOOKA/p2CXI+0pne4Q6U+Q2IR+ZXBTh5p3CnGgHZFyz3bfwMVvgln+bmGhj/WO+GId4bWGAUPeML+lz7nsrU93Fiuz3WSAz5rNBQRVpmPzc4uteGxFtJBT30R39mYU46jfqLZhB06Q3hoy0bq9D1V2Bc1raqEGh8r+D8HAnKyNAx6w9TCHTnbD4WX5ICgoTYMxWcCe5Ia8NhyBBLwBEeFxEcDGVYc7axE6svR/M7u7jhnkzLJRv+uZA21uSzT0hqd3rYcf4dlTVBvlTLzNxiGWJlpV4oJBPyp1dsiJpiO8K/qzEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V/om9C876igB3pduHGj2H1MKCzA5wuXePJYAXj22CI=;
 b=ni82ubaXmug/Hir+wxEK2EVfVDAH8rsJltz4KRRNHnftTMr3ZN0qv16B6gZyO3n6si8SKl64SHjwKZSPQzWAQWVxLc/rY21YKFFWHhN5DVHTJ6lo3lH4Zwl+f50chq88nTmjc5zBSEkhyGPPipFrYKDAzk+QGE+jC+plFHVZfDeobMp/l3X0/8mwwrdluX3MIss2efyl3MGUt/u1ecYevhahtNhOgNu4KStghOXvKB6ogpNU43EUIo9C6HsM3U/M3D85dqROVmw1xCStrV93EdEJmtJWYCsz/tbaKeIgdZMyDiCSK3JuFoEsPErSc9T7SBpkA642NoAO6hBD+BxorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V/om9C876igB3pduHGj2H1MKCzA5wuXePJYAXj22CI=;
 b=Ro3TyBFr1sQ4wb/KKaruOVavZj/9tCIh0BamL+djgJ3Xp3oCzcTj4V3xm2zJwtMIlhrmpIe99iK2ri1pQlyrRcMv3yMb17kFA2Oc9dxf02dF7t6xz3Cf7kOi1o6wedZ8coqQQnEIIFZUNOLbhqXxkkPNmQKrbw70IxV77v6w6e8798cckjtHdm0MPUFfGlvDXA0guptLVpCqVnIarNU3AqrEId/S/JumgOIrfAxhmQDFa2APhdul2z4dk8fiWAUlkiGYQyAvnaMaPRDUWPDT+PnrTUAGKQ02fKfIwoiosKCkAsRmfEVnvbXecGJlfA8+ygZziVPSwB9CqrzIwneX4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad117bbb-890e-4387-bb5a-cfd226c68bd2@suse.com>
Date: Tue, 21 Nov 2023 09:52:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: More use of nocall
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120194537.1341452-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120194537.1341452-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f727f7-753a-43be-0eed-08dbea6f2da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AEOY2XrArJJ/j9JUEtlGt6kNJsohny0ORbBXcy8YtpF2KAYHbM0Hbhk1yNiSgA6AESTOU+MIS08Xu7y+5QW71RnRwHu8tzUIEcdgB8ePrPrWg5q/enVFYoLO+9x1+dtIiPeQlluoi4ysUeqbZBeidJW+F8sbzdfB+L7MCMY5SlkJgk2U66KIwlWoS8sKksn15ptqWpLbC9uQMjqaZ6vxJnsotmcJZWF02tzYckqhOwpW2kDNr1QNBL6t8q82+JuSFVb6i5/VMzZ/mHWLSX6e56CgNQtqGg1HKFKQrfKlDFNBcMPb3Tj95emxafTPK1XurBX4vT/0lsB6Cxmr3gxekk4yjbtTdjwK2PzhWLYGLwDGr3aeyti+fDiLOeLYAMx1EvtIPYOcTOWLzccgXUWG5El88IHDc6pTCrYCKddR/t+4XbWUtufd1oMmeM7dRaA22W3lcxlPN7BZfyAAvESshp+pFrI530o1xzbu46r6BHAt7XCkAlUIW5CRSW5lTgw0fIT1T+gCmGuE5pglXSD+UKMz6kefa1cWnC42N4dj+rfE7puNiu/yCx489IbfjLyEvkA/VY7fBre4oX237FNHRAzgy/p+yvcjEyQUbQuuohUIWnjMlQFBzHq2vUHi6vYyhgHuA7po8bD1lCEHyByPSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2616005)(6512007)(66946007)(31686004)(66556008)(66476007)(54906003)(4326008)(6916009)(316002)(8676002)(8936002)(478600001)(26005)(6506007)(53546011)(83380400001)(6486002)(38100700002)(31696002)(5660300002)(2906002)(4744005)(41300700001)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXh1bzZGN2pheVJwOUsrc21OWmljUjR1aS9ReWwzYkhEY3ZpUHN3bS9nbTRq?=
 =?utf-8?B?Z3h0d0JoVUFqdmRzYTJvaHFQbGcxdWE5cXhnaVdVZnQ2NStqbUVuT0JINmsz?=
 =?utf-8?B?YlJBcEJBTEJmV2lJeEdadFh6VEhBRlNhclJXajl0Z2F1cDFOQ2Nka29KSU4y?=
 =?utf-8?B?YzFJeEV6RG90eHB6NjZ3c00rUWRCUElxQWptYnVwbTdwRTNxUFZnZXVtTVpS?=
 =?utf-8?B?MWlib096TnY4a3MyeEQ1YVhRODVzUzhKeVhtNnVLMFpRdTNia2JxQ0FGRDh1?=
 =?utf-8?B?WXNqd24xd3BTTXhOcVh2TWN6QmFBaVlxcWVkejZQZVF0MEV0WXVqZXFBS2Y3?=
 =?utf-8?B?RzNTSGgvL2FKOUdYdHpIZzM0bWRzTEk5UEp1djdFTEpjTmk3M2JXeHNGNXVC?=
 =?utf-8?B?dmVCZ3ZvVkRBUVkyL0lmYjJmcklTbjJ4NzMwVWVLRVVmSTNXd2xMZTV4Rm1C?=
 =?utf-8?B?WjN5bUJCN242aGUzVkJyWG1NQ294OVA2dFdNUkpUUXVzT3FNalFhNFVyMk1S?=
 =?utf-8?B?Y3FxU1BmNnphWVI1a2YwVitXWEJRN05uSGVqc2Q2TW55WXNkZEZxeEV2VkZX?=
 =?utf-8?B?M01sSmtmQ2ZpL0I1aUk5dEdYRUx4RnNwMVZielJHREE1TnB2UGJURjlTeFZu?=
 =?utf-8?B?R2dzOGRzQyttb09jN3lHbXVONitHWkRtTWtKbnF2RzQ3alVHRjBvcDdpZW05?=
 =?utf-8?B?YWNXM2JvWUd5b0ZYN1NLRGFIWnF1NTViR0x3S0twS0Mwa3VEaURhNk4xNFpJ?=
 =?utf-8?B?MUFqMHVHanBPUWxyK29kN2lRdzdhWDNHcnJReTFGRmRMdTRzS2dqdkdEYmls?=
 =?utf-8?B?ci92cTkyQ1VHNzIraVdwQTBKbitpRXBSRmQxZmVSTHc3bUNEODBwZHdUbDZU?=
 =?utf-8?B?MFNhYkw3SUtTUUVxQndhSTlBU0I4ZHBaUzRPQkkxTDVOZzdQOWFSbnRFKzJk?=
 =?utf-8?B?YXpEZzhSaHRPbEt3ek5oQytoMllHbHVJcnppUE92eG1RVGpaT3cwWVUvYWx4?=
 =?utf-8?B?QXgwbWZ0VnpMa3NqQlhJcXArUEpOc01mVFBWMG0rMHptNW00UmRkWGJORWdq?=
 =?utf-8?B?bTVnc1AzeWlIalRHNGl1SDhZRUNwMHRINWF1Y3lQZU9GZHFsSUZnSDBHengw?=
 =?utf-8?B?ekFyRnM4QnhhOGxzS090Nks2UlkzSU1EeW9jT3Q4OXN2M1VvVnZKTStoWWl0?=
 =?utf-8?B?ZHIvVVlXZ3p4VmlJTDNqOFB3VFg1TVkrMHhBMmJjR1JBbDJBeWlobW5Bd1dK?=
 =?utf-8?B?YUlPMDA3Y0FpNkFaQi9pZG04aGNWZUR2TmQwZnJWSWN3S1FQUWlrVk1JQTRK?=
 =?utf-8?B?UUtGQnBoWnBGTWtmQnJlalY5VW9uK3hRckNUL3dCdlBMWUtUN2F3Z29mekNK?=
 =?utf-8?B?NUFnZWZuS1NXVW01ZTZwL2gvVmc1SGx5RFBKY0RBdWU2bkIwdVBrMUFDbUpq?=
 =?utf-8?B?RS8yOGs5Rzg4WkVISkVlNW1TZm1JSDRpbUo2QlZQS0pIVUZNbGFCRGNteWxq?=
 =?utf-8?B?Y3duMFZodkc0QS8zUHlRVGQwZHVjMWZhYWZma2FNK3BSMVFRcnF4N3l5c0cx?=
 =?utf-8?B?M3VGTTYyMlFZSjFUY0cwOC9wZVFzK1ZIWm9CcHpkSWpicjJTcW8vbVFncHJW?=
 =?utf-8?B?R0pkclhUMWdLLzYrTW9tb3BBUW9HVWlrUGoxWWMrWmtWZlEzcWk0eWxkSTFT?=
 =?utf-8?B?ckR2cHVFK1lBZCt6OE96d3lGZTEwQmtTemxadnFmb09JYi90bnJjLzRSUFF2?=
 =?utf-8?B?dGpKelQyRXNZdHJmZlArRlBlNy8wNHRuaWJvZFAxc2hXR0hHbHpaNzZtcDFx?=
 =?utf-8?B?Z3V4REt6VkNEZ0V5TnRPeEZQMDdwVWZqLzlCRjRLYUNLd2cyVEZTK212ZStF?=
 =?utf-8?B?RFZKVVk3RUFtRjBqTmxVYjdXSlpUck9zcjFIMTV3WGdYRFg2K2tkNjZEbklr?=
 =?utf-8?B?ZUJoWkd1RGpaSmFkcTdhVUdkWkJ4QnJIcmxqVnZ0WkpONWNqS3Q0UXEzNHBo?=
 =?utf-8?B?MUp4RHlIUDVjdVZQczNjSHVLaGNzU0szTVM2WWlDK1FzdTk2dWtZd3J4UDF5?=
 =?utf-8?B?dkNuU09QMTNncHA5TFRwblV0TDJ0cjB4ek5ieCtFMGNjcXdYMFc3b3d4MlBv?=
 =?utf-8?Q?MQcovFp5vSPMx2lgQkZ/GPEMr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f727f7-753a-43be-0eed-08dbea6f2da5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:52:23.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAQIz+UqZT7/6f9AyMIkaflzdH1+IPKbxCWYAU4Uh58TxxXpdCfLFsk89gmYlTBKPn+J8SrsxAgd2Ju/jvjrnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8666

On 20.11.2023 20:45, Andrew Cooper wrote:
> sysenter_eflags_saved() and int80_direct_trap() are now only used by a single
> translation unit.  Move the declarations into the respective traps.c, renaming
> int80_direct_trap() to entry_int80() to match the style elsewhere.
> 
> Annotate all 3 with nocall like all other entry paths.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I wonder if this wouldn't better be deferred until asmlinkage
has appeared in the code base, such that along with nocall that could be
added at the same time. (Even then it's not entirely clear to me whether
Misra is going to be happy with declarations not living in headers. But
imo limiting exposure trumps Misra's possible pickiness.)

Jan

