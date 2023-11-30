Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99D7FEADC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 09:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644449.1005456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cXL-0001SD-SX; Thu, 30 Nov 2023 08:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644449.1005456; Thu, 30 Nov 2023 08:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8cXL-0001Pu-Pn; Thu, 30 Nov 2023 08:36:43 +0000
Received: by outflank-mailman (input) for mailman id 644449;
 Thu, 30 Nov 2023 08:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8cXJ-0001Pm-Tj
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 08:36:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944af6dd-8f5b-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 09:36:39 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 08:36:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 08:36:08 +0000
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
X-Inumbo-ID: 944af6dd-8f5b-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOHpU8H7VLiHnHzVxyHnnov6sCuUttHBTHJKCKcsPrbv4152rYWSHZsmRvBfPUaUD+FkK+EQ2p+YxDVvCC9JjWJHA943SvxuRV7DKQ2UTw9+X0PxwzDt+RcykqZ1j0aAQ11uACyl+hRTWtrcOtDQXDzow6dHejgcRhe2rvVjQsLT5QU96f5MVrdmQOFxiEL7Ip9lllM9So/UxWE0HlS/nm8bIVsq8Z63heJbliBHo2Lc+aoxz2uDsUMgAry3WY07rjqLKgjHOYW8TkuP0on13ZlhsmaI4DovtG/YAE6/Tnk/0N8IUw8J5xOEGCGGbi2/sBZR5Z3LNs3FH1JSYJFgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWlqujNL53Z1sthmdGXDFmwEMe3iTzE7S1q1huqLOFk=;
 b=BB365QHdstDC4509YeqS+AuYNJjKou4j9fIJuNfKbQmKKAsA9eDRiCZ8Sc4mQBOX7KsX9UAAFH6ixdbxV/OXAHyABjLFhVpP1jojgUUqnuUPaRiiWQUVR1b1J+DDa3N7pFnSnQ6W+eMmllbsGNbgfr18ljxdk0hSaeX8DW9n5jeziWXAXU7uQNdQkbi36hRa2JjYchxgerRlUe7iKrD4pa5E6xJytvvGvmb+HLsW4wD+FozFx2R6ZI+DyYEBNSFo8qzb7iglyY+r+h/5QqbPhC89uGG5HHruKKxcENlmbyAq1FVYTf5/PGK3p/uXrYb3JBeUYHwYb1aSXIo6Fr5cVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWlqujNL53Z1sthmdGXDFmwEMe3iTzE7S1q1huqLOFk=;
 b=1wYyUlpAR7OrjiZN/bTiII9l/sUkz1/zaOX8xTctA/zKfUaUkl4g3xNETp4x0Maqk0kSaVJWIY/w/aVkDKBqQlf2QokbtDGsj+XZ0Iz/36qD0MyyklxorAE3GzHCVOeBTeCLB5e2+goXEug/bn6ZPj5rKfBzHHhTa3jjeeIiiaiDjKbwWmCVoZ8iQUCLD9Y6gOs1WCwsc9L41Wo6a1w5eN45+aZMIGgstp1Xaesc9EpYZfc9avv8WJM43g86/mZgdTCLmS/Zxw4PD/Iu5XN6JLVebRCKE2Jcgqqn+AeGYBebuREymlqEDQSPc1fl8rnJtxNOFK1/vWJa8VUbkZvIlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <890f54b5-9692-40b8-94fa-9a55268e29f5@suse.com>
Date: Thu, 30 Nov 2023 09:36:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
 <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
 <716b0ec4-adce-494d-b9b6-69dbb7e26000@perard>
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
In-Reply-To: <716b0ec4-adce-494d-b9b6-69dbb7e26000@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 754b4533-7944-43f8-c402-08dbf17f6661
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b/QGKBGQ7BFqrJiS0baugVPBzZWUKlkDOH3OdsN7V+p+e8qQAr5Dicj62+E9LnGmRCCwgaM2gOZ6loHlqtzuvP/ZeHAgnPxAim2uiRvif24K/65zcJ6HkIwXi4ms/B3Ot0YsQXyVoYITWwxNeR9C57SL7DUL+8wnbYXYRiXY9WrlCafmp9ITBo21jYJWXpVS5MjOj64fcjMHP8gzfa7kBmpxDwe3sMTujCljg9SZyforLIk4ENyJvd8WxRcIFaZASCykYDsc6gBckFeCuO3jCnhI08pC7giZr9bcSBAlWlMQhosTiVdBvvJRA74xQC3AAiMIrYJxu5OY02/LY9ABDawtk0RLty7NFjF02/hCg+yEFbzdxxibWhihQZ8BECzaOAEnxhXvKONNH+gFJDCCyOgSML4QYfyjLQZb7tM2WT30npObU/qwkMbdkDTYZ9r7N8Us/9GEacFOIgQG1JdNm7pUhLuFLveF4ljhVrFVWymzhVAPKqIhMBghPEVzyRIWOXaT/LfpArmkvf3OmbSjnCKlmFMdTZG3v9U/7Zu85w4JbzEHwYEpHKuuTxqOmWyFyoqETJr6biRmiGlon/2ncTC93wElqaDGc3DOFe1EGfovAFilFmebb9nAg1caLxokZXRrQ4cQdl8c0Wnj1z5f9Dp9IxeQEdQQyYElA29j8ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(966005)(66476007)(66556008)(31696002)(316002)(54906003)(4326008)(8676002)(8936002)(66946007)(478600001)(110136005)(6486002)(36756003)(86362001)(2906002)(5660300002)(41300700001)(26005)(38100700002)(6506007)(2616005)(107886003)(6512007)(83380400001)(53546011)(202311291699003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ako4TUg5ZFpzUUthSVk3eDRqYlk2L3Rwd21JeHd4M1oySTdyQXVLWDV5WU8y?=
 =?utf-8?B?bUFiWC9TN1dJYWZrNDB3S0VhY0pjWWZUMG9NeXhJVEVSOUdOS2J6cFRaenNh?=
 =?utf-8?B?TjlWNkJ5YXlQM3BWUEdtczRSTlpsa05DaDNrVWRrSmhaellLNFlyNXpkMzk0?=
 =?utf-8?B?cmtPbkVFUkMvcGc1NGtxVnUyYmsyUDRPSERVQXgxR3JCdXB1QldEdlBXcitt?=
 =?utf-8?B?V29GVDM4VWlBdXE0cjViRFhxMXpoU3JCZWJ6Z1BvVTZSUjJGWGVnSkpnT2Ez?=
 =?utf-8?B?c2djYWxuSGQ4elEydnIzN2p3NzQ4NU5VbTBXaXc0S2g4b0lpeEdvZ3ZzV0Fh?=
 =?utf-8?B?TmMvT2hsY1lLczJrOFdoTURrWTA0Y016NEVGUGVUOWVtTXAwMm5YTUF3VG1n?=
 =?utf-8?B?YllVM25RelpDS2tzTW5OclBGcjJERVM5TVM3NzNUOTM1UW8wY01YVEdUNkx2?=
 =?utf-8?B?UGNzZGlvNkx0RFNmbDlsVmhZeFZrZzdUaDF3Q2syV3JhaGlmNGdVQUdaOGFl?=
 =?utf-8?B?Yk9JVUt6eEFiN1ZoUFpsKzFJVXJ0VlNjWnFncSt1WXhDeGtvMWlWYkN2Umhv?=
 =?utf-8?B?enN2MGlPaC9VR3EyZkdoQ3JrMmpZTlQzcWt5STJDTm5XUkFveU45RkVTRTR0?=
 =?utf-8?B?UkJQVDc0TWFjbzBPRkpkQllLRDV5UVZrM3h2WGZaZy9NaHVZRkYwemtnZDFx?=
 =?utf-8?B?bDBvT2hVM25vcFhKOC90RWc5Z2F0MFNKQUs4U0JJdUt4bXI1c2xLamFlUDE5?=
 =?utf-8?B?aVpobGRLOG5sSTVrcVFCS2FVZjc0c2N5ZXpTMTVheE9nc2xCdUVGYUY1WXkr?=
 =?utf-8?B?b2hKU2V1VlUwcDFUckhjcFB5VEtyR0V6VjNyQ1JIZW0xNFBRN2dyaTJFd0xB?=
 =?utf-8?B?ald2MGhZWU80dzRCTTlCdnNQbU1mK2tFbW9lbmpXUVJVbFdYYlRFd0FBMSt2?=
 =?utf-8?B?K1dzaThRTHBZMTI5ajhxcTVnRUlNdVQxZ1hoK3JuNkVnbzZWTWMwb2Q5YVRG?=
 =?utf-8?B?dnNYL1FPNSs2bGNhV04wT1BlUTV3OS9FdFl2R2VKTWs1SG51TjdISUw1Mm9w?=
 =?utf-8?B?VWNEeko0czBXWk1tZGQya0F1UndHc0czZnpVdStrU3Bvc3VPTWtNa0pma0NM?=
 =?utf-8?B?QStRcVVCM1JaRFZTSVJSQ204NnhqSFRSM2ZiWFI4T29kdWgvYm5aeDY2RTF3?=
 =?utf-8?B?Vm82djBUN3hMd1N4S2RYMTJDUFFXTU83Q2htbHBrZStzVTVPaVovSkMyaWNM?=
 =?utf-8?B?bFdZZjlsM3hvUnQzdFE1R0RxRTlWWjJ6QmllQlNLbm5LdHNtTTBoOC9oSGhx?=
 =?utf-8?B?dTdDbnNaSGV2WmxzWGZjQXh6L211UmhYbXppbmp1dmNpWmVFTVpQdFR3K01Z?=
 =?utf-8?B?a3V6UzExMWZnTW5Ga3NaT25maDZQTG5yZVBpQk5iZERJbzhTYlZENmhjUUti?=
 =?utf-8?B?SXNJOHVsb2tCOGU5SmpUeUlHbENibXVpa25PeTNOdnN3b21lK2ZMQ1BxVW1U?=
 =?utf-8?B?b1JlUGdCaXMvdFM3czBUWjJyWStkZFppbzErQ2prUzZLV2tkajZBb1ZCcXdq?=
 =?utf-8?B?NW40QldPTDYzSkpZVGdKd2lNa0hKWUgvVFkveklieC93Mm0rQlNhSVExcVRE?=
 =?utf-8?B?bUw3cldGeWJLcVIvbkJZY3NEbzU4M0F2TnZFdEdIWUVZWnY0bG9SM0RwMUtY?=
 =?utf-8?B?OWk0L3VaOVc3RGdUV2F5SlZhSWJlcmJvWmNvTXB0azgveGhaYzY1a1NqZ2pF?=
 =?utf-8?B?U2V6Qkw2eG9KMXpvUWcwM3RQUG5PYzVmZzhpcXowdGx3ZWRMcjdyZlkrZW4y?=
 =?utf-8?B?bDNubTFpdzJVaGRqZCtKTDRnU25BR1ZvbWRyenZhODBiemMveUl2SVhRNHd1?=
 =?utf-8?B?MUY1UG5yK216WVluRXA3ZFAvUzk5ME1GTCtUb0xsYmpvcmtodzhxeEFzTWpI?=
 =?utf-8?B?Mm5mS3RERmNsUW1UeUk2cm9YVG9tTFFPQ1Jrakc4dFRxWmZDdWFueHJYKy9p?=
 =?utf-8?B?emhpa2hXQnl6aDZmd2VsWUJPdDRVY2gyWktFQ0JrREN6ckRkRHpmM1JqQlFn?=
 =?utf-8?B?Q3B6NWpyTDV6andVSkw0QWhrd3M1MXp5Wmc3dkoxeGZGdVNZMFY2THFsUUhy?=
 =?utf-8?Q?QQ4RepFaqKiBBjB2pCCGfenSw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754b4533-7944-43f8-c402-08dbf17f6661
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:36:08.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWQVtiBxKGAZFVb/kgyiO3b+OYRmQPQM/fgkWTxlp772HwI7o/sxt5HGBvJiRCfowDQuH5RKYpdAGz4kwHDdzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320

On 29.11.2023 14:10, Anthony PERARD wrote:
> On Wed, Nov 29, 2023 at 11:47:24AM +0100, Julien Grall wrote:
>> + Anthony for the tools
>> + Juergen for Xenstored
>>
>> On 29/11/2023 11:34, Alexander Kanavin wrote:
>>> On 11/29/23 08:51, Jan Beulich wrote:
>>>
>>>> On 28.11.2023 18:47, Alexander Kanavin wrote:
>>>>> Such constructs are fully allowed by C99:
>>>>> https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations
>>>> There's more to this: It may also be a policy of ours (or of any
>>>> sub-component)
>>>> to demand that declarations and statements are properly separated.
>>>> This would
>>>> therefore need discussing first.
>>>
>>> The error is coming from python 3.12 headers and not from anything in
>>> xen tree, no? As you don't have control over those headers, I'm not sure
>>> what other solution there could be.
>>
>> We seem to add -Wno-declaration-after-statement for some components in
>> tools/. So one possibility would be to move the flags to an hypervisor
>> specific makefile (in xen/).
> 
> You mean xen/Makefile I hope.
> 
>> Anthony/Juergen, do you have any concern if the tools are built without
>> -Wdeclaration-after-statement?
> 
> I don't, and as you said, there's already quite a few
> -Wno-declaration-after-statement.
> 
> It can be nice to add a new variable in the middle of a function, it's
> like creating a new scope without adding extra indentation (if we wanted
> a new scope, we would need {} thus the intend).

To be clear, I wouldn't mind this in the hypervisor either. But then I also
don't see why we should further request people to separate declarations
from statements in an easily noticeable way. Thing is that imo something
like this wants spelling out in ./CODING_STYLE.

Jan

