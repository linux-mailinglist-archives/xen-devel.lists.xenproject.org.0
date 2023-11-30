Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190B7FF66A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645071.1006877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k6d-00007m-1R; Thu, 30 Nov 2023 16:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645071.1006877; Thu, 30 Nov 2023 16:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8k6c-00005P-Uv; Thu, 30 Nov 2023 16:41:38 +0000
Received: by outflank-mailman (input) for mailman id 645071;
 Thu, 30 Nov 2023 16:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8k6b-00080S-IN
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:41:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 534c7a3c-8f9f-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:41:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 16:41:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:41:34 +0000
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
X-Inumbo-ID: 534c7a3c-8f9f-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3zOlNJM5JSp3FjdATe+ulnB41pgI/m/DggZ2/I95HiYBrp/QD2kzYKXgXDylIJbWMWH66PapFdR32L6uCKBJk173GsS1DdlgOFLzcY8sScgItF333jS/2kydOWqsqBCBTSA6i0rJXIXfBh9udRwZpzFa97xJ/x0YAJPJ8QD+NiSnVyYguaNPfvaNFCZ8ZBfC/LmTMI9viOG2nNAd8d4gGVQS016Lb/Je+9S156P+RY6mQbWQicHnI2W12lkjcgS3LphrnjqODOA2gytOm6/Mp8A96GSHCMrDxdCeimT3V3semsd1vWjePRql99JIjMi1ZSMGrJlgLR1aHoRDhDXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9j+A2Tc8862l9loqlFGJxJCuCnrZDwGbllLSxcetMk=;
 b=eZHE3Ftz6EcpHurndLmJBz4muUK6YJmC7+DPlBuYl3l3x3GsQonsgT1iY7Dj5IvcLrkFzU9dS7n63+LIygAywI6nGeux61AZpZpSDOf4XsxtSTZgD3cRDKJO42oSClieV7tF6aW0SURGwfzoEw3b0seuKGDrELQ0xWLCvkdrnQcs532TiOEpb6aKGuKbJAciTRkm7p/qt1QDQORZgJ6MUl7ji5haorBJQ9ZWjxD+ujwGvn0kTIGNeWkbzyBPdyES/VAugLZQ6pZ80umKPQdHYkKLOU3lyMt5EvZtAQI5cpoCeaTyQ7mj9sajUF3WvNqJm530Js0mOFxjTw8gQIFI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9j+A2Tc8862l9loqlFGJxJCuCnrZDwGbllLSxcetMk=;
 b=E2Ns6wNi8Gx7C6Hl/GiQuBYxZHSJrZpvilaVrZXP9iTnf74DwczpK7PkJeEATSx3M0lneCTZSnOaq6CLCFT9XfBrgUoLpM8Jnb/6ns77K/MNBM88AtJqNILrARwGT/MZUBXXF50WFiyPDP1RBYxMbPItGFZXLq0VBHqU75r40suH4PQ1H7Othd1a7rQj9Bi0wBVEKQgRs+yPn4uwmmwb3r+TxEu6j21C4VfaTuRGNAdFCpAwprDklJbT1TzHTMTtD+V4Mh+j0ZMpcUMdrRM3SoPN+yV8zuPeEqJ8P6KCPk9dDwAZXwEG0mA4vPAtMIkILc/xhqA2hexW7v34uIz6Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48f44ee5-95c5-4656-97f1-7fa6d0fdc53c@suse.com>
Date: Thu, 30 Nov 2023 17:41:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/7] xen/x86: remove stale comment
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <d06ee9f139392045fb8d927ff3a0c38fdc5080c6.1701270983.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d06ee9f139392045fb8d927ff3a0c38fdc5080c6.1701270983.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: ae67f665-65e7-4400-275d-08dbf1c33664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fxi848UK9ZbXwF/G4lnXxfNEKX3yDKJafzQCqffMlcVtIro4FdpfF8r+bHAl94Xx5o21dIZZ+QbD+yc+9c9bXsdo/hSGh3oPHsXnmRMF3j5hPoRauQNePcYqpZiOprlXKgL6uFL1oL1bF4gE0Qpkajg835DIqaIp6KaXttGpsPHYDIFU9w2PJOXq9YIGuSlRmn34mpOH/6jxdiN1Z/FJdLCvP4GIy2XummtNPxCvF0a+8EnUdkmiAgRinwWQPVQD/bcs11ptRrSDZtmuxdBFCCSY0Wui1ayFMCXet7tzc2gXCCzjeQ+tvtgDHJ9wMvxRZOfPPZB4Gy9yQD1jIP/En3t0mveVig8Y03dCMzD68v7V1wbBLnu21n30w38E+1CpoevfqHzhlsC9Gj4zP6cXPpo2zFL+OwseblWe/ZhFG6dP4KweJGnI0Y1WxqakuczAhym61q4l886RTpg92/LsJPp2Mox7oU/jRMcKtRKQznVNtDKA8yfhdSJcLjsXW+hm0HKaUALozkeL8IXWQIvExr/rx0kApxjfcADkhd8Q5URwqoS2jW0K43Fn6y0+5rjWjwUxOyLdIfKAfDoVF5H2kQ02akUeK/Ds7EEM7tPtat0BatU+Xj83YSy9LPIkL9Q3SIObmfGwvXDJoY+rPxj1Vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(6506007)(26005)(53546011)(6666004)(2616005)(83380400001)(478600001)(41300700001)(5660300002)(4326008)(8676002)(8936002)(7416002)(2906002)(6486002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(31696002)(36756003)(38100700002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGtOeXBXR3loK0xxWkNzRVdKS2w2eUtLc3pvbXd4WDhOVzQwYXdBUG1iQUxa?=
 =?utf-8?B?c3l1RFdIcVltTFJmZ2NLMEI0czNNUU1oVnZrRnNoUWYxZkFIeUd3anExY1No?=
 =?utf-8?B?cm1GOTF4OFJIZWlkWnN1RmNFc3IwSFQxay9DQm1PNE4zaDZiWTI4WS85d2Y3?=
 =?utf-8?B?aGJSYlFDbUFzT1JlU1RJYk0xN1ZxRTN2anZvbWo0ZTNaUzNEdXJrYTh0dEtj?=
 =?utf-8?B?YzNSYjNYL3N0OFVXc0s4ZHMySUwxVnYwbnB5VWdxc2d2NVpRTW1KcUE1dkNj?=
 =?utf-8?B?Z2c3SzFDaVE5UytFZ1JVNWJtZFJoMWpIb2hhMTNvV0UwQTV3S3hkZUhQSlBZ?=
 =?utf-8?B?WS9EM1BBMlZkR1VhUE0yNkJhUEtrWVBtVFN2RUYwdzV6dlNocjROeGJpWHhH?=
 =?utf-8?B?dVZBTFJEQ0N3aFFPc2JuNTJvb2xVYTAvTkpNTmpjYWRvRnBQQmhZVFcrR3pR?=
 =?utf-8?B?eVlqMnB3VGJBSTZwTVM1Q0xxUHBNRGZVYW5rNStXTzJ0VG4vRm9CdnR3R2Yr?=
 =?utf-8?B?LzdPNDh6Mk9LdnZ5WEZCNmMxQy9TOW5LOVFTU25oaS9CSFJqVU55WDJjR3Jm?=
 =?utf-8?B?V09XOXlINHJYOTMrRFdkdThOaysxOXF0cXFiQ1gybGh2YWV1eVpxYUkveVho?=
 =?utf-8?B?WEtMTFZaMlFFdHJLZTZaSmUxcEgwL1NKeEpqaXBJaWljNEEzQkdyUGd3RnZP?=
 =?utf-8?B?b3Q1cnFjT1Qyd1VENS9nZnhlNDdrdnhrdWdEQy9hc3AvcU5FNThmNnI5R3Vu?=
 =?utf-8?B?TEN0YjdxSlh5Yk8wa25MK044aWwwQ2lCQit3K1M0S0padHNEZUV4NlI4V3pG?=
 =?utf-8?B?NTJkVmZlc09wSEtYTWpQclhIeWJOQmN0cWxieUhWU2lOLy9keUtoNmF1YlM2?=
 =?utf-8?B?czc1ekdUQmR1c3J2ZTN4VlV0WFVTSWs4T0VwTXFBR3FiVHUxQ2wrNTYzL2t6?=
 =?utf-8?B?aXNNSDZ6M2FORXNVTW1MN0ZhS0UyYlZnSys1MDBWVHlqZ2Uvc1UrRU5qcFRD?=
 =?utf-8?B?TXFDL2hsZmswa1FQdU50SXdYRUdHNFYzM3l5WkVRaXhQZlNXSVFEalY2aXhP?=
 =?utf-8?B?TmZETXNkRFVwNDZhRGZMdjE5V0M5Vyt4bzBBd2c4R3d4WFlERnhVbmFuSmV4?=
 =?utf-8?B?aFVURXhLb0R0Sm85dlZ1TitKVlJLZ0JUV3E2OFRDRWpzZythRXhUL1VveTFE?=
 =?utf-8?B?bFZQM1JXakk0enZ2MkxzV1pmRWcvaXZwRFcxVTZ6b1FFaTJQMjNFaVpORDZk?=
 =?utf-8?B?aWp5LzY2Z0Vnc3VkeCt6Vk9KWFQzQmg2UmEvL0htWE5VT0I1TlFjbGdQOHhL?=
 =?utf-8?B?QTV3bXBLWFplNEEvam9odmlsREJHeW5wRDhFa1U0TUhPYjFBbVJjd0wrUFkw?=
 =?utf-8?B?MEh6cEsrN1hYYTdyWFhDc1h5Yko4WjdRQ0krckpQTlptYkRTdlppamxCUHNp?=
 =?utf-8?B?RTJMOGtKT2RMdnp0TVczQkJHQ3N0dUI5VWRCTEFMcHFjWHJySlVlNUxlejNJ?=
 =?utf-8?B?Zlo3RU9sbjJmUmxwMmVocnJMWVJ1S1FEUEF4Q3BYR2ROZXVYVjhYRTdMWjMx?=
 =?utf-8?B?NDBhN3YyaHJaZ20yMXBTOVF2MnlVWjFUVGlOSFUxU1RHKzZDZk9rNXduOG1h?=
 =?utf-8?B?bm5GZU1nQ3A3YmtZNzc3VlpDMlpMRUhxTDVuM0lQMzE2cDVIM1A4M21RS2NK?=
 =?utf-8?B?MXAzQ2FpMGl1dTVxZGg5OVNjSFBEUWMvZzV1dG5oMmtuczVWVGgrK1NEWnk2?=
 =?utf-8?B?UzBOSXU5NDdoYVZRNjRGUndZTnBKQnlqbXBndmhpVGQ3WEJzOVlTbnNMb0tV?=
 =?utf-8?B?S3VIZzZCd2JlakdMYkRYVjZxMm1JeE9aMHYrWTliMTc2RWVWdVB4V09aUFpG?=
 =?utf-8?B?S1N2MEUzTndVZnpTdHVpNlhIdVJaeFZkNzM1Nmg0ZUhKZ1lTeXJlNGdQMVVG?=
 =?utf-8?B?Mzh4VDlSQ21wOTR1YlU5ZzJPZUl5RmlQanBta1NPN3ZGNlVSNEY4V0JJMmtW?=
 =?utf-8?B?VkE0eGRsMWdWRzRIQXlhalltcHZDeDRqYjVNNkRCc25OQUhJdmtHZUdQREVP?=
 =?utf-8?B?TXlsdExYenk3ck9zc2ZFUzhVVTd6eEYrMlBzMU9tcGdadGRnWTlDRnJwVTMz?=
 =?utf-8?Q?5LYSpCwSlWkrrVmMbrPMZBIzw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae67f665-65e7-4400-275d-08dbf1c33664
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:41:33.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+d9iUdCF6cOZV4HPPdC6Q/rE/ub2EJXqOUKErrU+bYr9R8KjjhpvyrfSYJJ8Rrr8ngFIeCn2lqLj6YtC8gQmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040

On 29.11.2023 16:24, Nicola Vetrini wrote:
> The comment referred to the declaration for do_mca, which
> now is part of hypercall-defs.h, therefore the comment is stale.

If the comments were stale, the #include-s should also be able to
disappear?

> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -14,7 +14,7 @@
>  #include <xen/cpumask.h>
>  #include <xen/event.h>
>  #include <xen/guest_access.h>
> -#include <xen/hypercall.h> /* for do_mca */
> +#include <xen/hypercall.h>
>  #include <xen/cpu.h>

Here specifically I think the comment isn't stale, as xen/hypercall.h
includes xen/hypercall-defs.h.

> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -12,7 +12,7 @@
>  #include <xen/types.h>
>  #include <public/physdev.h>
>  #include <public/event_channel.h>
> -#include <public/arch-x86/xen-mca.h> /* for do_mca */
> +#include <public/arch-x86/xen-mca.h>
>  #include <asm/paging.h>

Here otoh I'm not even sure this public header (or the others) is (are)
really needed.

Jan

