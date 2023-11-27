Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF357FA611
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 17:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642335.1001745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eJQ-0002YR-VG; Mon, 27 Nov 2023 16:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642335.1001745; Mon, 27 Nov 2023 16:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7eJQ-0002WD-Ra; Mon, 27 Nov 2023 16:18:20 +0000
Received: by outflank-mailman (input) for mailman id 642335;
 Mon, 27 Nov 2023 16:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7eJP-0002Ul-H8
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 16:18:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 933c3c0b-8d40-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 17:18:18 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 16:18:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 16:18:16 +0000
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
X-Inumbo-ID: 933c3c0b-8d40-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRbQvc6twqf02huIJ0vUhPzwUt+PFAPMDlXjbknESrw+1ZwYGJ4f5uApxMtpAAlNt6ch1bF3kE63XVCUYWP52zpmkTFeHe6xmv0kxO1VcwAHKD1DFKm9ZEIS8hPxaCH7o/jKJN0oVf2Y1hN/6rmwBb6xlGd8s9XLgRqzOX1z4i/62Bh82JGtdPhkddZby6WmsCeXgXUhlz9QNfWcEOfoFR79PL6pHZFeM/LNY56iz5kteAm6l7qGs8+43uHCMWav0XeXzhW3uWaIevTMzvu2y1dK2I8eRwLM0+p+HXK3sgXr6IqkHhewOGQojYZec6mrbm9TEanJBZu+/8/5KiOOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk0MbnXXzvWD5Lzxn3+PntMR9YtRJ90kYdVw6zNPDoo=;
 b=SczyEJ0E0RRxXWvKVUT5zQui3/o1CMgKz7IfCQhjiKmgGCKWkEYmdF7b55Roe1MlwmqYP5Y8dagaqwvGxMmzWM806K4AQlwMqcsv6SQGLvjM/j7Ie8L0xg4Ju93k3skGHkwAM/gn0DY50DWYDggZwPraFP2XEVRpKkr37fVh8DFBQFRPXoN6ozvzZWBO5CA9baMkXdoK6TWOKabGRB+o0YNSaVq3yc+yDMBq0+sJtTS70/hyv/K/Q9W2DGGCzvMwCKFL8udR2N7wGxwwsFJBpXov3hNUjpFZnShieQkC0W8Yavn6+Y5qokYn9tuLslZBANQg7ievqTPPTvrBKALSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk0MbnXXzvWD5Lzxn3+PntMR9YtRJ90kYdVw6zNPDoo=;
 b=zk69cK+6pYCIJPNzolLZ6zj0P2z5czLIS1ldskeHXkyfSWS7zurE/lfCtPHleQl1rty6EPP772Pu+aEW8aQPjFZTGGj9FZYk/mYbrWoINvL4+vkj4EEMM9N9+yoXcPj+qKqpYisHQyctYtq+FIcNoCYabbbPTbNq8jg+BenIjud+mjaabUu5EDFF+5yLzDHuQORrhpjw8mSwPK7YcPqR9mMk3FEmwZW8Hg/5avAn/Yu44x3Fr/mH0HfKAi594bkLJL5PSPDwYshwhh2Jc6rpNo8bVZ3dn/+X4D99754A9wIptlmI6qp5JleJR3SY9kP/yET7sOpY/Y6bmcNVroUI0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c4b3bcab-d571-4df5-9ee7-80dd4580adb5@suse.com>
Date: Mon, 27 Nov 2023 17:18:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
 <6c030c703fcd37d7dfae3c488c21b5bca540e352.1700790421.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <6c030c703fcd37d7dfae3c488c21b5bca540e352.1700790421.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: e17a2f70-122e-4c55-c22c-08dbef647626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/JUFv1CVR9rWYeXlCxJZ9wBFX4r3yZxzNPtO82VU41w3lfLYgGh4NVksGNdJ+JXoLk0SOnOb4jl1WrfMDMnsQffR2ZYLYtSuQNPdgsRNbhYLPaHHfe3dTe8SUyphAzMdJZasuCCkpr4WrAjN4hULxN/05hNoPB7K9Owe6Oi6bX6kKza0wgEa55csG8piUlk+baaNaBIyzr2VBIDTb3uClMGO3DLCauilt5DLC7broRGUZqyM9BTV/HfIUDwADujFxpTWmlj+f0mz+M3uDP04lVCjZWZhXy8kp8Yebokmol24X7FsL/iQXPIkylEwRD9DtwH/HUVBZw6AkTqvPDHwhEIOHrum24Kv7+qCoqnCgvZw+gqMVWqTFn6irD53+xLla3lKotKHNbaCnjKxgLAZKaZTJZbx42iNP7M8UcdKJtAfNrR9KE0e4sUn8lVppuAFrsUAlfJVNHxOjbXDzR+wiY6Gah2kYu5j66VXRt4zNW2HuEGCF1Xw8Tcf6kAcyNqY62qkuiwjB494qblfsV2m0aUcMBnrC0eAvz8BspOi1fJsr0IEBmmmMAXswadZ0S5QNqm2gNsK/BzglfYXL8va9U85ZIQA6N5PbZY1xgCUihvEtaDIbwKBWdsn+5SpHdHg5RvM3QUPPhm6RxFFxmfnBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(478600001)(6512007)(38100700002)(36756003)(86362001)(31696002)(5660300002)(2906002)(66946007)(4744005)(41300700001)(66476007)(54906003)(66556008)(4326008)(8936002)(316002)(6916009)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmlSbS9rRnJjYUlMY25sL205cFU2K2FXU2tqcUdxa2Y2MTd0UENoRmRzYzNt?=
 =?utf-8?B?MFpiRE9kL1NUd3NmTi9mOVkxaHdaRXhxaEdXeHc0NGN0ZStnRVByWm42enR5?=
 =?utf-8?B?QVhTWml4aFRRaFIxN3J3ZHpuMmd2ZkFwcUNxQ0dWS1VldmRaMFFtQXdpZjU1?=
 =?utf-8?B?WnQvRDhTcmpESEVtd2M3REtIMXdBYi93ZHpCRnZBbGk1S3VrRGE3TnJEdDNk?=
 =?utf-8?B?cEtSTFdyRTY5NjkxTndIdmxSRmRMNmdibUlWamk3MHJiazZaMndnUlE2R3BL?=
 =?utf-8?B?V0dzNWdCOTcxRWRrdy95eXd3dkx5VnIyM1h2cERrdHQxQm1VUzRBWGZjOHVw?=
 =?utf-8?B?M2VrNjk1bFM2NUxqSXNDd001UndGd3NFQUxKWW5kMS90MWZHMGJuMm82cmYw?=
 =?utf-8?B?aUx5cmwxbndaOFhtYUJheE1qaUNTRE5vaU05NitsallkaDRrcFE2djhRanhi?=
 =?utf-8?B?dkNyc25EQlROM3htMmdRb0VSU2dGQnpvQTI1TEJ5cU9nQkIzVDBqS05oTm1l?=
 =?utf-8?B?YklLZm5SNDBtZXVXQ1dJSE1TMitlWjJ5OG9BcHpBZ2c5N05wNXdWR0s4NllK?=
 =?utf-8?B?MUJVVTdKdGltQ1d2aFNOVWtPbXlVOS9sbWxJOHhQTGtyZnc1VWZ6YW5PQjI0?=
 =?utf-8?B?MUpYdW1vTmhCT0VnQ1F3QytGcWhiVlVUN1hZYUhBdG9scWJBWmwzUWJWazg3?=
 =?utf-8?B?SW4zcXJBZllaRitlamhiNXk1WGZpNXMvQkJRQUxFNFpSMUh6NGRDaXpYckxi?=
 =?utf-8?B?VWpvNldpOVNHY2JTSG1qMTRqazhhMGxpTzZqekVYaXZUaGVQUGlsRVlWcUJN?=
 =?utf-8?B?cFNtTXRoNi9aRW5OeWFjQi9yVWtpcnNYNG1IOE9zc2RLMnpxRytESjhoSnNz?=
 =?utf-8?B?NldyZVZlSXVkVStqL2ErUTBHQ0lvOENoVjRVTmhoY0VLblFUOSt2ZHEwU3cr?=
 =?utf-8?B?YmRORnhEWHhPQ3ZVUGdDbmZHTW1JMTlMRExpRE9UMmthR0g5WnRuTkNvaWtF?=
 =?utf-8?B?bTZrQ2hlUE1PcTNncjkrTmppVkh2bUdzN3dBUnRHM1o2Nm9iNm03QUhvYk1J?=
 =?utf-8?B?Tm1Ra2E1aEhxbi93ZkRNRUh3ZTJjb3h4c2Y2LzJOVC9NM1J1c3B2ZzdzNzRC?=
 =?utf-8?B?Y3FaR24rNFFxd3g3RjVHZENGWVFLTDJHRW04SXlGcmVzeVpVL2dkaWxDNFdE?=
 =?utf-8?B?UDZRZ04ybDIwWmRKK29YQm04cWNtVVBJR3p5WEZibGY4dXpWTVg1VFRUZUh5?=
 =?utf-8?B?UWtFM2UwSFFMdnBhK2wreERMcWQxMVoxUmJqUmE3dndrRkJDUzl1OFJFY2Rn?=
 =?utf-8?B?dm8rV25HT1VFay9HMlQ2c1hENzI2dHR4czgwUE5RY254b01HaFZCOENZT1A0?=
 =?utf-8?B?dFZDVll2MzhrWjJveE4yMjRZR3I2QjdHdW1Vdmx5Sy9KQ1czUktwU0syVDNv?=
 =?utf-8?B?SEJVcWlRcjVidEoxbkJXa1hYMk5GMWJoZHdEMXdtYThvWWhoZXo2aTFaSTh6?=
 =?utf-8?B?Q3ltdGoxb29WTHVKc1pGditrdTRFcVMyM0k3dUQzTWpvVWhTUTlmRERLeEg4?=
 =?utf-8?B?RUxDY1Y4VzNBeThZME1oQjRzbWNINVhxSUVBanErVjlqWXVrUTMvY0JTVzFS?=
 =?utf-8?B?OFFDdWZYeUM2bDM2ODFLOHg0Ni9QSFZST2ZOYnVFM25RMmhjVkdOSjdRSFhM?=
 =?utf-8?B?cnFxZW9YcWVRZlVyUGxIaGJ1MFhZdEhvQ3NQMHlKcFJMOFd2UUwweXpGNE5Y?=
 =?utf-8?B?NFUxKzJkQ0tISVpSbUdoYVRLU2NoSGFLaWJwWEVPMTI3RlhjczhwSHV0M1h4?=
 =?utf-8?B?RU15Q21qaGpkYk1Rb0ovSWtKWEVrdGttMzNVQ2gwNEpSOW5CbWFXcU9MeUMv?=
 =?utf-8?B?RkJkY1ZUS2c5amttTXFSU1Bmb0IwL1JvamN1YURoSXFlYVB1eWxqSlJ0MWpv?=
 =?utf-8?B?ZklLRXV6RkpQYVZ5bTNQU05iVFg5cGVnc0VZYzQ5QlZMdjIxYm9TRE1hT1Jx?=
 =?utf-8?B?NXNWUUx5cUdJZWYzcEFnTk1xYmRaYnFFUHB2YTNkdEJhMmVTalBNOFBlakw4?=
 =?utf-8?B?YStJc0U4K0tEZm1nb2gycmJCNUpmeURvNjVhVWQ0VkNTZlN3eENBbXQrdlFt?=
 =?utf-8?Q?cAOzFJlmzNcUe04aoDiKcpiub?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17a2f70-122e-4c55-c22c-08dbef647626
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 16:18:16.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0FEhiDlA+ql8DJK/B2KIoYdF5NC6uOIdLNyxlyW3S12J4pQ8JUN4ootM9l1AiBnYVA4sZGpwmDDhhMJzeNUsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771

On 24.11.2023 02:47, Marek Marczykowski-Górecki wrote:
> @@ -357,7 +356,17 @@ static int cf_check _msixtbl_write(
>      const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
>      uint64_t val)
>  {
> -    return msixtbl_write(current, address, len, val);
> +    /* ignore invalid length or unaligned writes */

Nit: Style (capital first letter).

> +    if ( len != 4 && len != 8 || !IS_ALIGNED(address, len) )

Please parenthesize the && as an operand of ||.

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -642,6 +642,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>                  fi.submap |= (1U << XENFEAT_direct_mapped);
>              else
>                  fi.submap |= (1U << XENFEAT_not_direct_mapped);
> +            fi.submap |= (1U << XENFEAT_dm_msix_all_writes);

This probably wants to move up into the x86-only section?

Jan

