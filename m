Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939887FF68D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645073.1006886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k9K-0002js-FX; Thu, 30 Nov 2023 16:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645073.1006886; Thu, 30 Nov 2023 16:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k9K-0002hl-Bt; Thu, 30 Nov 2023 16:44:26 +0000
Received: by outflank-mailman (input) for mailman id 645073;
 Thu, 30 Nov 2023 16:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8k9J-0002gG-6n
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:44:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7bf599d-8f9f-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 17:44:24 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 16:44:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:44:22 +0000
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
X-Inumbo-ID: b7bf599d-8f9f-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAJc1sFhQmx+VVJEBfz1RtadG31O6GwUfYiLIuUzfxhuoNPj/CD7CB7kNkHJkAuN9w5hNb6lNUNENyOpacn7IISWeEbD/FIkBZHgIcF0Fgee0Qhjo6cyOFsg9AFotqad6YHXu1k6uqikKNC2kNG5gZi2CAEcOu5oBhFH7V3kv1z4FXGD3E0XMLR4oc2/by6Cc47fWVPSlcCQUHdSRf8E/xSeK4dH99KZ5YcsoyFEgUqi3zdafqDknInee2Yn2P7/HTgOTcR6mTtbhpdPliNbYV9+Ok/INsYzxfeiyLnFXlHuUPSrPZ+ZLdX7avY1soMucsYIRsQedvbZz7S3GgqlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95nfjp9u+Vuxnchjj0ZGBhJwX+UDFQAuqpefBG7v6NE=;
 b=Bchfr+4hrEl5CZkx8n4AybRJChrdtWlUOl5hj225+8xbPaY2RNOOLGk8SohRGd+dRfHiGihP8oKiRaXjbUuLQyQzfjmbLcSwMd73jSnbuuIkkpx3Kh8R3XSQDngeIZ7acq5fq2EWmIXEFvZx/pjH8AnxUpGdyHyWtWxvz0wKvFads+VhAG7T1elp/tQtM+bKjHHxmr5C+EFeR+GAnJkSMuKIVzV3AYWpmqZilUQGlCz5HfJvSrk+bQ4VDIVSF2FC1j5TOOvm5aAY9wamOJBdiUmbd1BGxnwZCAmox1+1qq3E/GnGmaLyCzO1dKSy4c3O/ZK2BKGpL1iKuRnKjBIgzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95nfjp9u+Vuxnchjj0ZGBhJwX+UDFQAuqpefBG7v6NE=;
 b=KSHH/vweM+7L7Axy+lqVDQjtJfD+zCWPt30uRI0sQy4v0pmTD2J9l7XuU5RkF1sER0hxycHz3WUf5Yth44W/OeNHZrrpcDH913/P0S1O1kqLHtRSajrN0p9CMnYdQMvDEjL7V48z1v2B3HGHha+vk3ANfhI4X505IVWkGYL123O4XJDoWdaRXCoqmKDCVJTmop81ne+jGndFWKDkW4oLhJO249EwerH8WQbfjL1XXAd8WDyH+0XPhO4lpLSCki7YPwqC7tZJtipOy5nRsQsdu4pG0+biTvmvvfBCHpNWu2WVX1pGT6fB6y1Cyn1SwV+uY4x3Njb53eJiYevcIqV/hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <918d258e-c10a-4cdd-a598-3b5dc0124de8@suse.com>
Date: Thu, 30 Nov 2023 17:44:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/x86: add missing instances of asmlinkage
 attributes
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <4815279026ca4e2f1d93c98bfe6ea51ee139280d.1701270983.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <4815279026ca4e2f1d93c98bfe6ea51ee139280d.1701270983.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d4fd23-facc-4973-e1a6-08dbf1c39ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pllV6rJ/H3mpO3r1SzqYTrQwVzHJ8X2vMMbiPYKNw/cgDY2djEgQTOzEMs2UD5zl8OfgdlUeCsFoDdD8gj/tAqLaFX5Uqcn89dtLxuDLDmsvgR8sgeekVpgVWXbg780ofjcpDbFPW18f6SYPl7PaOCQ3HGkF43cZwkoVrnDnKZOkrmVLcOB6il7DtnRuDxDstHBlwUzXJ4LM8BbL3IvBTYQJ7mpx8p8FLKDEQkTmT/sPTaGemrYRBSC46ZaqHiLJ7E9G8Bw24H9sXrP/4dpmDrYiqBCOqIJOWduTxX1DK0/LHbTKgUgn5oqHoaqYS/pWrPDR0ghVCt70PD7Ucm/pmpWL6ahoRXfOOQokA1GYc7Cxl2ZbPFOi6zwS7a906ZBp++5PV1g+fL2L9A+b8XHTxl0bSrqIS0vZwclTHex4rInU5rxeCDxtT+9Agp1gY4cM2Cj3cHgBt1KCV6//tqmgdW8PvwlE8bRbZ4v1cK1kc7nFc/ZKqF6mOr+DKd9k5ppjAyw1Tf37TTNQDmzD+ZVxGUUzD8oLejDVjgwxyAtgU8V3Ye8bijb2MBgclM6ryu02peA0r/S5PmtjMXbd7kh8dNjIs8rKLrugGnmUmz6MSvwygO/vB9EWOeQiNTGhMwXkQ7b41BTqIe0PKGdt5tV8PA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(53546011)(478600001)(2616005)(6512007)(26005)(6506007)(6486002)(7416002)(4744005)(2906002)(83380400001)(41300700001)(54906003)(66476007)(66556008)(5660300002)(6916009)(66946007)(316002)(8936002)(8676002)(4326008)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE10bUJJbDY1N2tDNzlqYlc4NVM1eXlsVzBLT2wvbGI5LzZHVUtmWDZBSGpF?=
 =?utf-8?B?THRYU0dwQTd1c0Vha1EyT3NHckJIM1lORGRBYU1NQ2QyRW1oZUlZekhkZER3?=
 =?utf-8?B?WkxDSDBRbjllaHZodVRJcU0yVGlUUkU3WjBwOFcxaHZhNkxjbUZ4dkJWeHJV?=
 =?utf-8?B?akxTSHVXcDJTdXdlM1pITFpYYXREQ3g0ek43K2JUMzlyMDluSlRrOWYxZVA2?=
 =?utf-8?B?NHVNODlYRENrWHY4SlJFMXlpVDJoWXhmUTV3VUJnN214M0lvK2drN3dnbTRN?=
 =?utf-8?B?bFZ5VXM3d3E4OFJsL2RHYXRFQ1VuMDg3b0lOeFVIZEIrZUN6enFpVEkvbXRs?=
 =?utf-8?B?UWw3ODBHdlpzeG8wQXVnSWpjT2xzNVpxMENxVDJ5YnE5Vkg5bDlNR1BXeFdV?=
 =?utf-8?B?c21ocVZpd3MwSUFtWnBxOStEVEhZU0d2Rk50Y1JsR0FITzREZm0weVpIOEQy?=
 =?utf-8?B?eWRiZkUvWnd0c1VxdHk3bkVTK3l4b1R0Wk1Wb1VQV0x3M1lNUjBMT2hGd2hU?=
 =?utf-8?B?UEh0dHE3c1FNckFBOFFwUUxGU1ZlNUlNWFh3bld2aW9ja3VVRmlWaXc0bjRD?=
 =?utf-8?B?cEZxaS93YXZJbFZXS2Y0ZFZpbFVrSHJGQTJlZnlYZjMxOHBsSjdkQ2lNcGY2?=
 =?utf-8?B?MXFEbkZNWVlKQXRWY2NBZ1FnZEJWbXludmVFZEhUWkxlLzFub3hZQ0JBc2dp?=
 =?utf-8?B?dTJuTUx5NDkwQnpMMDBuRTZYUm9nUEVlbnZFZDd4aXBYODk4K1JJYUJzWjZt?=
 =?utf-8?B?NTJQSndrWlhEb3BGMzJkdXVCeUFERTBHMnVFQ2o4TzJPRkxrbEhZUElmUlFm?=
 =?utf-8?B?SS8wVCtSaHBvZmpKZnpJTjk2L1dWanVjNVJTR3MyMGY4Z1Bhc0w5V3lpcUx0?=
 =?utf-8?B?NktIT0xFUWwzU2ZyTGRSZEEzZDBDc2NPa2tXNWwxNFN1QUhEeFdqd0pvQjAv?=
 =?utf-8?B?VkNkVVVDNHpUODQ5c1RrcmdNaFVjbStFRUQ2MzhBYlgvZDJsN2tWWnVScUxG?=
 =?utf-8?B?ZWRRR1Z3TGlRakJOOHUrTXNZNzlyeDNFTnROMTRNdmNIUU9ZcXFGNzd0bUY1?=
 =?utf-8?B?cWxkc2lNVzNtQXNPYVQ4Vk4yUUdKVjNuek9SZ0p2a1diMFJFVW45WmRybzZC?=
 =?utf-8?B?UzAvYjdWenZFNjVVRFVLQ1c5VFVjRDBlSFVXS3k2eEo5SEg4dndBRHRkempE?=
 =?utf-8?B?Y0VqZmpkYWdXTGFnNTQ1WjRBeXhSdy80dGdCMGQ1bktUZ2FsWDB2THNJMkVh?=
 =?utf-8?B?Q0s4V0s0U3ptY0JJZnJPSitRajFZQUhGMnNqeFQyV0NGMi8xaW9Cd3hFeThL?=
 =?utf-8?B?UzU2dWNpWkhpNWg3VG1vYmluM2o5ODBWOHprRmlVRDVvSW83UjBsM2k2Y0px?=
 =?utf-8?B?WkZUVXp2RU9EODBNcXVRWXM4VHY4TkpqUlUrTmQyeWRPM2RjK2d1cUloVit1?=
 =?utf-8?B?SEs2VGRxclNmMWZjT0tybXNMRFBCU3BwUGRvbGswcWJadTM0QytvWEJVRTlR?=
 =?utf-8?B?aWl4NFg5NjZqRVd5Z1ZYSlM1cFlDTUE0dGw2MzJDRG9pLzNEbXluWkJsQ2VU?=
 =?utf-8?B?djI1SG85R1BCUmo3NzBwSnJIaGRyczByWDBQNDAzMHhIdlRwUjZLcWdvOGxI?=
 =?utf-8?B?Vk45clZVaHluU0QxT0MwMXlKSkJwOHBCRFhjZ1NDaGN5anhoUXBuV2dnYXVB?=
 =?utf-8?B?WjBpQzRNUlQyNW5acE9EWHZqT244OC9LVi9PU2F1ajg2SlBYYVcvcnRlQkFM?=
 =?utf-8?B?SnpyOEphNmk5c0hQOVBXMDhOMk5oWXEwWmI5V0xOSytDNjVtazk4b3FIRWND?=
 =?utf-8?B?ZStwc1FsMmwrUTVxZE5XeGtRSk1qMWpRQUJvUG9OWmVDOWhXWGR3MVBOVHFR?=
 =?utf-8?B?ampMZmVwQzFUMXJtU0hoMkswTTJJY0QzY2VlY0lvdXZlYm5YVmZ3dG5xQXNQ?=
 =?utf-8?B?aVVyOEhLVFdXTkVWeno2bVRIaC9qRDdvUUllZ1pQY3ptcEZUV25wbHJKV09h?=
 =?utf-8?B?a1hhR053U2Jpcmd1Z0U3eUNvd2V6NlJQdHh3QmppOFZ6ZHpabGh0ZytuTHNQ?=
 =?utf-8?B?UEgrWk1oZ3NLRWZoSDJWTGRrTlpXVTZtUUw3bC9HaU9UdVFHczhwYnRqcFRC?=
 =?utf-8?Q?XLb7zwbaF/STCn7+4os57GZCK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d4fd23-facc-4973-e1a6-08dbf1c39ac2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:44:22.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZWTMsHPeR7a4zkM8hMbdAYHBOY2BbE7lxmUkMoEOiwYqd9xrfUDVsSolD+QW4AP3F9dfCvne5s/BPAHfQkzZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

On 29.11.2023 16:24, Nicola Vetrini wrote:
> --- a/xen/arch/x86/desc.c
> +++ b/xen/arch/x86/desc.c
> @@ -91,7 +91,7 @@ seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
>   * References boot_cpu_gdt_table for a short period, until the CPUs switch
>   * onto their per-CPU GDTs.
>   */
> -const struct desc_ptr boot_gdtr = {
> +const struct desc_ptr asmlinkage boot_gdtr = {
>      .limit = LAST_RESERVED_GDT_BYTE,
>      .base = (unsigned long)(boot_gdt - FIRST_RESERVED_GDT_ENTRY),
>  };

I'm not convinced asmlinkage is okay to use on data. Recall that in principle
it may expand to an attribute specifying a non-default calling convention.
Such attributes cannot be assumed to continue to be possible to apply to
non-functions, even if such may happen to work with a particular compiler
version.

Jan

