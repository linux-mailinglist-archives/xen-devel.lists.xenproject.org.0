Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA57F4072
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638530.995166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ipC-000735-IM; Wed, 22 Nov 2023 08:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638530.995166; Wed, 22 Nov 2023 08:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ipC-000709-FH; Wed, 22 Nov 2023 08:43:10 +0000
Received: by outflank-mailman (input) for mailman id 638530;
 Wed, 22 Nov 2023 08:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5ipB-000703-N1
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:43:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28bb1205-8913-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:43:07 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 08:43:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:43:05 +0000
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
X-Inumbo-ID: 28bb1205-8913-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5bn/dhuYY6j0M/Uvq3towBjv6MUeZxdN1jLu96bBXK1vR49PhgbfPWZ7SOpBVcWZVesAaQkn+F+YfCIQ8QvftpHgQ6OEUFUkYEJ9NfREVF5tLq+iJrJshTk4kSLW2sxKzbm5hc/Nf54JVXejkxE4wa+PRgopUoPYMVYCKjFeSK+NoaHECqxVSCQHsUfpXuvRuHjYOpu6hFmM9H0xs+ZF+7JbfmqdlLpk3eYSuTk1YlI2A49IZXIaS3CMDLt5z30W8pQN1uo1X5jJoxYiB4az6kF80lif6+2JPZ7NVv2p8lPPFhl0FhGQ7QIXLrgVa9kSct5V9RdbxPxjxcUr2Lt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkmRKl8OWhGoJS/Y6UWeexAT73MQ14/re1M7OfwA/dw=;
 b=DZ/CKB7Vzi7urwNKAG43ya2fulu2x0wFf+JWwDPr2e9R/hWQmIlwQwwd4+0PSAOag8Obz9GRb7yjO115U2lwS5NFBgFDZ4QCg/KBxAssgG6FzYgehKVUbPRUloSvCBpiTiaJD2i5jpWGVLTq9htxMjrFIHXjhMM3NX2R8p6U9NfiOjinSp8HM3+RXdfgbiCYhZ6XRJRMa4JGRiOheHIOwsV6LyV5aMFTpwAEPIRrrJbzqAQ6L9z0LS0RFf5FqYgcpG37Wpdr0PiD2ka6Fch4T9ILcFoTpCCgpVs7O6UoJ4KXAv48uGL6fm9w3/eYhr6B4D9Sc66PpBswUMGEw73/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkmRKl8OWhGoJS/Y6UWeexAT73MQ14/re1M7OfwA/dw=;
 b=kommmrKqeUTipOlhV0L1N6WWwTz0IrykBwVW5EmFOGIesdwWbhVMnACHEDrVPQRuxQY6NWjm+HxDx1ZzO8LhJzehvc2yU68C/87wOZB+8ezT+bkRUiG/J1o7w8BghjIWGZOOHJriuAueFkBWW7ZOomqyswrDSLGIZKxixfnOwAJT3SYlxIxu/HZ1H/WbMg6PpJ+POtGPxAHBjpBIJAOLewGnYdwGTYY98C/bbFGsxosOI4tphW38gK6SOWlV1AuyhlWraEGXCtnYJDFi68x4eR++8GrIuhQrqrlKz5L16ALZHwogYe7R74NcSavI6g6mHaRrqJQSDR3ZRxMNOSV5UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1aa12433-99c2-469b-b36a-93c99539d42d@suse.com>
Date: Wed, 22 Nov 2023 09:43:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/setup: Rework cmdline_cook() to be compatible
 with -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-3-andrew.cooper3@citrix.com>
 <7c954d5a-b2dd-4a8a-8b3f-2ec398bf5a25@suse.com>
 <e613b1f0-c79e-446d-a93c-827c098b43ec@citrix.com>
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
In-Reply-To: <e613b1f0-c79e-446d-a93c-827c098b43ec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2c50ce-0d72-4fe7-8599-08dbeb370ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LmimlUm1/5kiY3evblILLtgg2VAVDplUAAcXFF/0lJruaXuKmC+60jBcTldQYLJH5cqV3HWNzzNy2nULKSppXVNg8SUb0CPecRJ1Ci2yiL1mlaM6mnJ/MHI0Ak3FYwGpA/DYqCbWajUAjMaSN8PpAAdIdVkx+vHuKbVPOsUVe7ToXZT3zIXgD11mkdAqHRitNcgg1dCEGvFfz38vSsLw+OQrnXEcselx64P/ssEmf5Vopf1qV7LDD2sMkvRx0RijDMQfEg96YfBkpNiiHpAUmZPRt9fus7COdFBIs0J/tVPRNRgVUEAyzb6Kdz1Fz8hmyhFmoEQb+4tO6NWFurK7X8VJ9c8pEel76o4YKwahY/49hvgqzdaCg4tTE3zec5qCZFBPqQqlYrA8imSqn/6USk6w3mQF3c/p3CVGxs4/aXnO4UgXAEZA605M2Pvy7mQ/kDAJOXIGh37x0GOeHe1eJb7Cqb0UxuVVnZ+mzKPuIvY9JbjQ/welBRYKQhwpBQFSuqarCXP2MLY12thb6rBdrycvYuZ+uu/HLeeEmPp02D9sbVHcK4HE3e3QrWi9Ys4It6TUnlHlWEsoPsurkdR0nrsecgjTT3JM3MFJXrGA3eB2NaO6i9JVqrPbUM/Q33gVk1YXeZbwK5vwAoOJ6vOUaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(7416002)(86362001)(2906002)(8936002)(316002)(6916009)(54906003)(8676002)(4326008)(66946007)(31696002)(41300700001)(36756003)(31686004)(6486002)(478600001)(6506007)(53546011)(26005)(6512007)(66556008)(66476007)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktPdTZzb0duL1ErOXp5aFd2R29ISzVXaGc5ZzVaL2Evd08yUmZ0NzVQQmhP?=
 =?utf-8?B?VGp5dVZXTnBuV0VpdzdUOUtaTFo3cmNXWjZnazc2NkVGdlYvdnFxcWRzd0V0?=
 =?utf-8?B?WE5aclZhRTRFcU1iRHNwbmhMM0dhSGJGSTgxRnRVWHdGMVZTcm5MUUtSTEFu?=
 =?utf-8?B?MXFIVWZVaGJMemU3M0xnY3hWT3hXL1ZFSDBManYvNVpJM0NtRndBT1JJdko1?=
 =?utf-8?B?Z1dEcjkvL0Y4cWwyaHdESi9uYzh0cW1nTXdBTFV2bWlXVHluSGJzaUZ2TGdy?=
 =?utf-8?B?VTBGQjZPV3hqNFlGOUpEUWhkdytqSHZiTTFQY1JUNmZXeDY3OE9QYUtzVFJs?=
 =?utf-8?B?RFZCS1dyTi9nblFaZDM0RTl4R3o5NDBoQTNqWDNwdDhaNzZPWWFPWWdDeTRM?=
 =?utf-8?B?bHFQcmVBVzQrL3BFWG1tbDEveGhocFV0aUxoVFlEdnJzV0RrV1F0YkprSnpO?=
 =?utf-8?B?aHlFOHppeWhqSGhtMnVwc05ZV0tvVnVSbHcwWnZDTi9kTXg0dUptNFhpNUpC?=
 =?utf-8?B?M09UQy9kcFN0Uy9rMGZFVElOUEhtR3JtTE5ha0g3eGk0T1ZQdjlUU05Dci9z?=
 =?utf-8?B?TE9JSFpDSU9XZGoxV2hMSytsKzdUTzJkcTN6MGYxOUQ0b3NRZE1zbWZTbWVF?=
 =?utf-8?B?b1ZBMW1sUmxXY2VRRkJMR2tEbmVMZ0g5SXVQejhISmdKcGVYeElMSUlMT0p5?=
 =?utf-8?B?R1pRVXBJNUFiTFFUbmxmUVVTNCtQN2M2c1pjWVJlUGVXbUlJQUhKVVh4bnA0?=
 =?utf-8?B?TFJsdTBGeGNMcVh4WkhZYXRZTU8zRDR1elVWbEorZmw0WDdGTXhjd3Axdmhv?=
 =?utf-8?B?cUtPVWdyMnhSZmdPVU0wZXczWHRaWHF1cnVkb1JsOXFIVmhaUzkySXBQc05h?=
 =?utf-8?B?bUtaU3FJbDh5WDd0NStEWUhjeGdrVm5mKzd4ZisxbW45VU1UbUE1Z0hoc3la?=
 =?utf-8?B?aWNWdDhuYk5BQWdJZGkyVWI3WHFFU2tFSVBQaWFCSmJRWUNUUjBTa05hMjlz?=
 =?utf-8?B?NEVyRXQvamxNY2ZLYng3ZkJzcHRFVmR6Y3pvYkdVTytTV3FHcnhGTW8wVGo2?=
 =?utf-8?B?QWVLcU84Sm5sUlhCWGVFbW4zZ1lPOExZN0tlMTJML3EzQXZ3eFVBcFRSNVha?=
 =?utf-8?B?Q2Ryay93VFJOejB5SXUzMFVxSER3aWxicy8xOUZBMlB1UDBSSFlWVE9wdjdI?=
 =?utf-8?B?eXFBd3JMVmFEaWwvWndlUkRGUEVHZDhJTndNdVRVV3FZdURQU3hZQ2kyS0FB?=
 =?utf-8?B?RmxycXp3SitkNHNUZ255YWRZd2Z4d0MrK0JndGtzYTM4SGVJQUttSDFQM3pN?=
 =?utf-8?B?a0RXU0lDYlREN3VrcDExYVBpM3pKS3JVV0lPSllNNUxObmZxTWltY3NjL296?=
 =?utf-8?B?S3QxQnAwTnVQcVh5VW92SFUzZDAvdVhCS2w3VVczYit4aWZBVHNidzc4RE9D?=
 =?utf-8?B?VWljT1B4WW96UURyQjhMM1o0VEQ0SGxEdnpYTG5ka3BIUVBxVjd2UjYwS3ZS?=
 =?utf-8?B?UHhwdlZRUnlCbUFsSEJOTTBOYXJZVUh1empEMlRRM0xIL2hFVG1BK1Q1ZGtv?=
 =?utf-8?B?YkZzWEFTbFNCYVplU09ENGFuSzBLc3oram1ZVTlGdXFrZDdoTHRvVUNLTnJQ?=
 =?utf-8?B?amRpTDZneVZDdVRnckhUVVpBNkxUNGlXSnlYMURYVitIM2xRSFgwVWNiY3Mr?=
 =?utf-8?B?M1lZR3owVE9CNkhNQ3c1ZURGV0ZaOE5GYjcwZVFyc1hnNmVpRXdycjJCemto?=
 =?utf-8?B?TDkyV3llY2Mzcm1QbEw1aXNObzQ4QUw0OW8vVExQczVtQ2g5Zm9tY2YvQ2F1?=
 =?utf-8?B?ajU3MWpFVUlQN2JGbTN2aHVSS1h6dlJsL3RyT3d0ZUp3VHplb3NCT0ZHa3RR?=
 =?utf-8?B?MjNHZ1lTQTd2bzdCU25RMFRUTzNzNDlUZDU1ZDdod1YyY1Y2cWdmVXFRaDFa?=
 =?utf-8?B?S2t4WnlVVUkrWVRiUzRmSzFDU2E0TUxuZUl2OXh0YzVHc1dWaERLdUtwQW9p?=
 =?utf-8?B?Ym8vZzJDUWwwRnZVWlI3cnE3NzFRVzI2dVpwK1BtNzJTWDFBSHZoam9CMkJ2?=
 =?utf-8?B?V0htMjVXWjFMdmxXb1ZLb1IzTTc1bGZRUkNBd2tDNFJ6bnBydGpIdkVkNUJK?=
 =?utf-8?Q?cS73ua5adGHdcLRTMf3pvw33R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2c50ce-0d72-4fe7-8599-08dbeb370ba2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:43:05.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1HwchHFeks3c0y1eek7xNVVKoqoYTamDlupdl9O79YImHNbIy6XnjqyenOkR2EsCgPU8KQeU7g8Aq8xv1UL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156

On 21.11.2023 18:23, Andrew Cooper wrote:
> On 21/11/2023 8:21 am, Jan Beulich wrote:
>> On 20.11.2023 23:49, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -837,9 +837,10 @@ static bool __init loader_is_grub2(const char *loader_name)
>>>      return (p != NULL) && (p[5] != '0');
>>>  }
>>>  
>>> -static char * __init cmdline_cook(char *p, const char *loader_name)
>>> +static const char *__init cmdline_cook(const char *p, const char *loader_name)
>>>  {
>>> -    p = p ? : "";
>>> +    if ( !p )
>>> +        return "";
>> This change is now needed only for create_dom0(), whereas the call site
>> change to __start_xen() is redundant with the change here. Did you
>> consider doing a similar transformation in create_dom0(), thus
>> eliminating the need for this check altogether? Alternatively I'd like
>> to ask that ...
> 
> It occurs to me that __va(0) != 0, so this path isn't actually taken,
> even when there is a bad mbi-> pointer.

But it is taken when the (remaining) caller passes in NULL explicitly (from
the conditional operator ahead of the function invocation). But anyway, I'll
go look at v2.

Jan

