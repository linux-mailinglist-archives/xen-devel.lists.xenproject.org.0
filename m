Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D6800458
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 08:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645310.1007429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xcY-0003Fl-S9; Fri, 01 Dec 2023 07:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645310.1007429; Fri, 01 Dec 2023 07:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8xcY-0003E7-Oz; Fri, 01 Dec 2023 07:07:30 +0000
Received: by outflank-mailman (input) for mailman id 645310;
 Fri, 01 Dec 2023 07:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8xcW-0003E1-Hv
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 07:07:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4874903a-9018-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 08:07:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.15; Fri, 1 Dec
 2023 07:06:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 07:06:56 +0000
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
X-Inumbo-ID: 4874903a-9018-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBaXISUSEouV6GE8o6wIEwxX3Ge6nGPH+UiKLmPQBUkHn0SXH0HjRIz0ZmKMIwLYppeCCTAnxY6neMmC5TgmX5+qb+Ef86ybFmFXmTarhlfPJZe2oOR61Y6/9gs0kw6NSekhlD+rwPX+ry5wRftaBglmck78kJWmYmAcaWPqZUfFnlw3nggxzR0LYG3jFUXFwW7VmqluWP2VP350PcZog+NJqmt8+qkbDWx1xOilt8jxbNwuH1OPYkppH9vI34DQnmcKaknka7xkzx7SMTTTwdqAJ4tARvaM5vpZtGVXEo10YTjNIKgIQyD7719zL74bmLLLM9xeCg5quNxlCNatLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAWQOpWgiLF0TGU1pEZq4ot8nvBvOfzsfk5FsiYZRYA=;
 b=oK4ACZeESxEClWR9HpA8FzggcpsnoAJ4V/PCKMcmQ9EegvT1MRVzRjJQavH4ezOQwOFKt9GHiW3PdwNxBhBhrSGNkNoT0ZwQw6g7lwfbczMoZ9navV1Ai2qAeO47mDNLy+rZ8k0YzeBpKv870wPBz9JFmNj4h09BbDD+3Lbt0+NPHJ/oU2pWbpuPZXEjrvgROdkcZ8HsorWj3824puztl7ySona25UPqR51tmeE1+SvL4z0hErv+fVWM16g5hxwY044ggVXkQPEo7uoSGvKtDsoZlYeLP7DkooMWAx38+I9iGZRlSBhmvXhIRPDl7PDc+tvMzzLku5VFHc1IIelEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAWQOpWgiLF0TGU1pEZq4ot8nvBvOfzsfk5FsiYZRYA=;
 b=Xx/sATkEmqt4Lr4eNnhXnEYP5S4bRA3hIgjHW+4expS02Kx6Wjoe5UpB/NQ9/reumvG+rD2LVGBfEIY8ji6+OA9Z9eAfDNPPefhVoPw4vk2qHdl6IZIVaMMBD5yLMK6qSne2KLwZN/Cb+zTfYnG/5DAK888wa8l3MQHJr039ZbZWi/3nLEVbbF75EzZNEK1XYbXi8EJoDYF5guIhmrmBlP2b94EmaWnGq15pfE1sOx5dWHt9wHMvTEx8KL9eim/PZ0Ez6X44niYrj2kfXpIG3OeQ4Cn/jn4oA5FwHNRFJ9Yms4G4FtVpn4ySwjUNfIIFFvpQ4hKK8aG3uS/IteaaDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
Date: Fri, 1 Dec 2023 08:06:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for MISRA
 C Rule 8.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb5422d-51e9-4124-db2f-08dbf23c1ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gw7pMdeB9uLp7+B9KByXsLlRmWw/qlQpXba95Jc4viNUV+mesLlc4/F68FD3W5lXxjCT+IrPNfeIiYsiwZf5ZstCRKSyHucMzcxRRICsm/sSuMOePayML4uc9gUX0yBvSQHIC3RvJ5MsPb/Uh7DiGCBiDFR2dridNywvEwD0BlA9vLEhbIAdZcrq5L1Oy9qCWiDY8zauR2kaIWLardX9ZCAyS+9I0Y9mj3+hem5wBjjz2kEUfHXjJMJm8Oo3pFywV7GybJKbrWuBDT8pZPxDuvvcD8TaWrm9Y5+KPY4mJkjRcIR3tQ6SUUlh99pj9BnNeRy1v3guujrhaOCo0WO6Ic4ypfjKEA9aqwfPe3L6IZABxJIa0Sjq0B1JXENOTAUN3Yob1NB0qL45UgtJqIM/tbxjD9RhQUi9W4+1V+yhq5uWmpGldofOtlWJj/tU4dO9T8vMaW2q7Fpy3byQT5uY+hkf8GbeHj+BYEoUT6Z0FPDxiLmUTpddRBIQh7eUdbnEYlAnYcn/JzDyHB4xuhKMUJVSwHl3B9jAXNo+zCK7Im0VbpIa2j4+oqlGcuBo+tbzW1hRKmWJYNfL+lY9v0Qwud6mr6N0OIgek4/CErTLT7J699eskMF2Znrn25DmuVaXszoSlGPujnc75nkijvw+sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(36756003)(5660300002)(41300700001)(7416002)(2906002)(6512007)(53546011)(83380400001)(6666004)(6506007)(38100700002)(26005)(2616005)(66946007)(6486002)(478600001)(66556008)(6916009)(54906003)(86362001)(66476007)(4326008)(8676002)(8936002)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGs5Q1E1NnhTOTlNamN3OU0zenhWd1ZmTWtYRUdUY2FMcDBuVU1DYytYanNM?=
 =?utf-8?B?OWRSY01NRmtid1FwdDBTRERWRGpFYld2Y0Zqa3BXOFF6UEptZU1QeTN3K0lY?=
 =?utf-8?B?Z2VnTTNPdkZEczV6QitFTG9aNUllVWczcnFJZEhkKzh1cVNxRTZjU0k2ZjIx?=
 =?utf-8?B?bU5wdWI1Qkd4bVk0bmVhbGpLYTdzWTg0SGxPTm9rWU9jTHpKTlBEM3BwQ1ZN?=
 =?utf-8?B?Z2ErOHlwZHNwbFJ1eW9FTGVRREJmR3NmbHFXclcxc2tKWmxTWTBkbHdNQlJH?=
 =?utf-8?B?VXRCNWV6K3UvcHRaOU0rV2dZK1QvTmNRYytLckhCVzc0RlU5MldMTnNzOUlK?=
 =?utf-8?B?WnJDbXk5bUg3MTRKWWE4OVRKQ1NZcnIweHZvaUkzWFJWMnYrMzhveUtmRDJK?=
 =?utf-8?B?dGh3cW9sellxVStZckVKSmpqQ0ZNZEZ1WTJhLzIweTFtTXV2SkpYcmtWT1Bj?=
 =?utf-8?B?eHhGaGNtYmJkMFE4eEZpU1pySURMbnFUdStSNDI4YUdkcnNCdGJtVElCNzlT?=
 =?utf-8?B?bEdOVmR5VTB5RHFhb29oOWhOak5idjR1dnkzUDdWcnNOZTBNZDloT0VYM3NE?=
 =?utf-8?B?VDM4cW1VOXFLOUxhZU9MNUtvQ3dEOVc5dTJqc25kWUR2cGxxUGsvQzlQNGxV?=
 =?utf-8?B?cjQwbkUvOGxtMkgwRWdLYUpmWmVLOElnV0tWVGUyK2F1YnQ4YWtXbjIreG91?=
 =?utf-8?B?ejlWamhLWDhvNDBDb1p1MXNkNGs3Qi9OdEwzUnc5d1daMXZPTXV0TGIyL242?=
 =?utf-8?B?clQxR3NqZXFTdTVlY3NmQmQycWsvQmZVWFpWOU9rNVNQeVpXckZWcVpLN0l6?=
 =?utf-8?B?U0ZTOFI0VnJGeEJMQXVOY3BnMFgxdWhYcUVadEhwWXJ1d3FjY0gza09GcE1M?=
 =?utf-8?B?VFd0WUwwM2RKaTYzV2UvMDdDZUExZHpXRllnSFN3elp2TjVOT09uZjFyL2tx?=
 =?utf-8?B?aks4OUxUb21xTUh1dC9ReEhvNFF5QnZTeksrVEEzaGhONDdZK3RneFRReVVI?=
 =?utf-8?B?VDY5Z0x4aFNEVlJMRS9JakZLL2thMEc3MEgzMzhTdmY2d0hEbE1UTVVHbjg4?=
 =?utf-8?B?U2ZxajhUM2pxd3Q3ZytaVDhVRDNyTkpiWGRwTDVBb2hTUHp1S0VBQnFXTFg1?=
 =?utf-8?B?eFg1NUkxcEZsLzNOdlRSWlRIMkRZZWNGWDNRZGpqelVkbFVrdE9NR1Y4ZWlh?=
 =?utf-8?B?eGQxTFVWWm85bUl4dS9EaDVKZU5HaG9Pd0FuNTNMNXk3MVpJWXZEUHY0d041?=
 =?utf-8?B?Yk4ySWlYbStlNFpwVUUyZ293ZHNSYmVGZTA0U1A1UGNYVzFkK0JhbWx4TTN5?=
 =?utf-8?B?R1ZJN25xYkpQeWVVdEoxTG5XcERGQmJ6TDBlVTN1RENjUVNkcW9iWHFYUzBS?=
 =?utf-8?B?MDE2WVUydXRkTytYMVVIMDNhdVhTb3RnZzFxMzU5Nkp3UFdFNEJaYndtUHpo?=
 =?utf-8?B?WnhxQ24yVmVjYUt0Tm1OVWVMNDVnV1lVWTNRUWNuZWw5dmQwTmNkTnYvb3c3?=
 =?utf-8?B?YVJtaUZNMVVpQ1NsZHZ1b1NzSDB3WFZRbWVOUVhaOU5UK2Rod3NXOVdEa3I4?=
 =?utf-8?B?SnRBNFhvN0F6T3BHL0trbTVxbGllYk5jblhNb2JaL0ZXWTY0ckc4bWdCT2RK?=
 =?utf-8?B?WS9yVzVTelp3Qm5SckQ2YzFiTVhUOUYxbXB6Wk4vTjJPeHVlcU1VTGlnOEp3?=
 =?utf-8?B?Y1NBQjBjeFhGR2txbGdXK2srbGxMMW5BblBURW5YNjZydzZHU1crQ3FmSkFY?=
 =?utf-8?B?bXFqalNtTVpHWks2aDJLQkpUeXhuOGlGVlFOdittVFRHUGN1NUhzZTNvYnpz?=
 =?utf-8?B?ME9DVkdSSFlVRldzUHppYisxZEVqQ2doRC9uM1c4SE1ZK0l3eVBhRlVGSzhk?=
 =?utf-8?B?K3NOdWRWMWhYU1d3Z0NWaWtGZlhhUFRqcmM4TG55M2VLb2hJc1BJSnFBS2Ri?=
 =?utf-8?B?SlhDQ1h4Uml3RC9LYmRIT3VFaWcxTXl3OFkyYkRhaHkyZ3RVekVyQ2k3MG55?=
 =?utf-8?B?UmNQbHFJemVpRE8xTWdvcXVBU3VudFVxZDIvbEh1VUlCQk8xdVJuVFV1dXo2?=
 =?utf-8?B?SndGdWovOUFRdW9DT3g0dWtwTXRubkVUS0lEV1pWU21ReXdHTWpSNXRHemNq?=
 =?utf-8?Q?lfZeqQYh+jS5m4utb3L6YL6e7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb5422d-51e9-4124-db2f-08dbf23c1ab5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 07:06:56.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWL9JIWpbDtUCFrz8gYQ0/hF5gJZKegMTuKj4Li8zNDDTWJX7cFyyyDzNDo5ujm8zk90VRF7t38SqLAgWMlFgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

On 01.12.2023 03:47, Stefano Stabellini wrote:
> On Wed, 29 Nov 2023, Nicola Vetrini wrote:
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> The preferred way to deviate is to use asmlinkage, but this modification is only
>> the consequence of NUMA on ARM (and possibly PPC) being a work in progress.
>> As stated in the comment above the textual deviation, first_valid_mfn will
>> likely then become static and there would be no need for the comment anymore.
>> This works towards having the analysis for this rule clean (i.e. no violations);
>> the interest in having a clean rule is that then it could be used to signal
>> newly introduced violations by making the analysis job fail.
> 
> Please add this text as part of the commit message. It can be done on
> commit.

I assume you saw my reply on another of the patches in this series as to
asmlinkage use on variables? IOW I think this paragraph would also need
adjustment to account for that.

> With that:
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>>  xen/common/page_alloc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 9b5df74fddab..794d7689b179 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -258,6 +258,7 @@ static PAGE_LIST_HEAD(page_broken_list);
>>   * first_valid_mfn is exported because it is use in ARM specific NUMA
>>   * helpers. See comment in arch/arm/include/asm/numa.h.
>>   */
>> +/* SAF-1-safe */
>>  mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
>>  
>>  struct bootmem_region {
>> -- 
>> 2.34.1
>>


