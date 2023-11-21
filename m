Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5DB7F2FF7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 14:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637853.993894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5RFg-0008NT-6y; Tue, 21 Nov 2023 13:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637853.993894; Tue, 21 Nov 2023 13:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5RFg-0008Lb-2y; Tue, 21 Nov 2023 13:57:20 +0000
Received: by outflank-mailman (input) for mailman id 637853;
 Tue, 21 Nov 2023 13:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5RFf-0008LV-JF
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 13:57:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1756379-8875-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 14:57:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8649.eurprd04.prod.outlook.com (2603:10a6:20b:43c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 13:57:14 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 13:57:14 +0000
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
X-Inumbo-ID: e1756379-8875-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmQI4ssDa0xmKet+MyS+zfqbsU3RT2OX55Fgl9+yCoKJ8VAhfgoaJgguF9yobTNbP4PvD++AnvUAku98xfURqFBzffJ2cc2U/vAKuFRI9zwfIQqKIaHnQOGi57D+r1afsySD3FnVj4/IstQkowcH11xALB1tLunwcLvJwro1wKcLlCeP6A33oridQUJNlLDKQJrbS7cVtv62aPgwNP/+0VsQw7vap6wibdiDdobhM6MDV851d7UpZtmuL3sKDZ0Z6kCtET8vXu7BKgBC7gLJrZqiHeCk8xQ1NcxKmJtAa1yUI0ulgjszm9zv6buEx+FsJCR+bYJMri86t3RVOKt2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPnfLifzmQXdDOmJ34PtzdyvoTqXOAvCoRd8tIU+Cl4=;
 b=n90hIdEx4N8jMoRaUlO8rZ2w76pK76PlbYRc0xMf4JEIlKX8b/+/QSU1Z/C8wXM7cEDIg4PTlJBx26BXNFyLWrCgbfBraA7iJIXR4B6h/8T0+o9wYJ+0WFgfqV33nlw5MDEYEumJewIVz2xDwkzAaAGvztsru+gi4vObnobgyMDQ/4q3LNA7BvwnVO1ohQujBXGwAc0ZH/7ENLy2wYY7MxWAr7BYZICgEdV3jEv/GbVUAFmOSDeXZqkuhI1asKdbVfkm2o2kR4jJOPrRgkUmU/ONfJaUrEes68SKVWPwmffhZvt//ZGXHhLc7o2mETv3sbNMVOnW3gVkVR/HpyO/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPnfLifzmQXdDOmJ34PtzdyvoTqXOAvCoRd8tIU+Cl4=;
 b=qhl7rZQbxfVWw3R/5JZ+66f2uPX4BMZ1Nl+HdSHhzyAUP/EJAvrX/5SvzT3zgtMXC67sSUwt0WVV7K0398g7GB4gtf/Yj+C3ItbZFF+M+oDzlpjY/lKMesQFXLt2MnqqJDXJGqLlJVgEads/XdSLTEtxPUy6dKmfXMhgtqI+zneWht+ZA4yq2k8idh4HiDvkl3TB0HRWS5V/YFIYeoXTzy8FaEHCpG5XahwmSHKFWW2UdnlIzsbGx4wJelt4erV+g3N53m2ypOTHGjTB/87qyzUYLialXsdbzOnC+c7tCmSZVZCbPNSv1VzKgLsftJaXKr3xgbhtgVOOpawtZVZUsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b2a1e7c-cf8e-4ac7-a2fb-f9e74f051312@suse.com>
Date: Tue, 21 Nov 2023 14:57:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] x86/dom0: make goto jump forward
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <fcc14cb3859e4904f4a17e14fc41b5e05ae1f05f.1699295113.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <fcc14cb3859e4904f4a17e14fc41b5e05ae1f05f.1699295113.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0272.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdf389b-3215-412e-abdc-08dbea99c41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7otpnmviPPlQDqc8kZeS7OPsUfu/n2cPWwttTBrZRBfc2QG+CKYeYClklK/C1pogszEI6mrkOuHKUTA4iJiwoAV9Zls5zbDyQnQtQ4PDlyXk3KupurSkZMCS6eHhMdv4LJGzGG0R4F922swwUG2bK2fsUdh3ZqBT5CWN8FU6bnWvZkQi+ZUeh14+KBILRArV95yHvcfGp17/rYHgxnK/RJPG8y7rmSmEAhcNtQMNbVdb9IXGLZLOwTzC5DIMLd+hmDighYS3GAbnNE2vzHHFJkTOSY7GxGY7xI7S/qKAPDyr7kRYWane2ZQ4lLPTG4A6lmyTUnNOzNkopYTTdwgBf1wPKHMaz4/c6FJxsimeOE3CUoQOgUQuo8U45InIgSV39xa6/o7fU/uFi1/YS6QCpbMHiY5OH7M+VP5D15NY/ij7m0gyj3ZBIAj332TvoKVqz46bio7qL1pSf1Oo+GnX8IwGMi4RiWFde7TDYKmiikbgSx9fVeDhbcB/9X9nBVo+PH9hBk07BbI36bRPrWoNHArbp525Zux3NcohuLRPVt0bJgnVPM5wTBEm6jxkcOeGfvSS2/n/StM7I5If4z/I4Ld2mZAd3goJoEmDZYA71/AT6La/p0rFLUVeu1bcCwHDS/LGmS2AAmgpXvZhmpaXDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(316002)(66556008)(6916009)(66946007)(66476007)(26005)(4326008)(8676002)(8936002)(36756003)(38100700002)(41300700001)(31696002)(86362001)(2906002)(5660300002)(7416002)(6486002)(83380400001)(478600001)(6512007)(31686004)(53546011)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGVsVDdCVU9OYktnbVYrNlAwS3dHb1F1WS9PbVEydlNoMTNHTW9tOGljVW5B?=
 =?utf-8?B?OTRYTlVsbm1INVpVM243R2VaZEhMcWt1TnBNaVpCUmNnZDNrZWVyYlFSTFpv?=
 =?utf-8?B?eUlZc0VkcGd6dDlIL29jeFVRYnQxTks2Y1g1SXZuRlAzWlRsMTJINGkwVmdP?=
 =?utf-8?B?SVRCWG1lUUhXUGIyZ0x4V0d3cWN5M2xSUk1BdVZTTkdxVlpUWXQzYnNBeWxE?=
 =?utf-8?B?OGl5ekR0cSs2czVqVEhpQy84QTIwd1FnWkZMUm5SUXZ4Zk51Rjl4TUw4b3Ju?=
 =?utf-8?B?U0pKS091eFlyNXJFMDM2RXBpL3ZIbHVDZ3A3bG9XWjB2QStabHVtcnJzYjll?=
 =?utf-8?B?K094b2x0bnJqRm5pT0ovWXJrVHFjTHAyVE9wbU1KZXNjU2VHT1VWWVhZWEFZ?=
 =?utf-8?B?QnZ2MHhzUUNqZUplZVJPejNvN1ArYmNZcUtuWmxiU1RJY0dCVkJSMkoxVDFE?=
 =?utf-8?B?RXoraDREWm1oSlpMeC85V2JuSit2NjFZcTh6WVJORFpEa2xrSEI4a0MxYkhs?=
 =?utf-8?B?TWRNa2UycnB2ZEk1VWhxQmdHVkorZkQ5NXFUVldmTGRJR0kzK095UitrWEtM?=
 =?utf-8?B?VTlVSGR0ZmdqbWx6VlExM2dsUWJQM3UxSUFHN0UwVW1ZRTBGQjMzcTdKcEFw?=
 =?utf-8?B?YWhOb29UemgxYmV4T1lrTUR0TU4zTHVxcjB1aDI0OWEwSklIbk5EQUNSYXB6?=
 =?utf-8?B?ekxFZVNIT2tOZFMvMXBxaVNoUGRxNUdFS2JjVGtkZTNyMWtPdW82cG9vTUwr?=
 =?utf-8?B?bjJRR05pS3lxR3ZFSXhtdUo4VTNKZDdBcEExajFUcGNlYjl2TzJ0N2RrUUlj?=
 =?utf-8?B?VE80S0NOYTdmcndrRmpCbC9yQ2ZzYnVlVFQweGxxTm5VWk82RW5VdDF5L1hK?=
 =?utf-8?B?VFgwc1RNckFDRDNlQitYdFl0dG02OTUyTUE2bG5uMEFQS1JMMGt6azlqcFFa?=
 =?utf-8?B?RVU2czVpSHZYWVpoY2xTaFYxMURENkJoZ1pBbm9HMW1xekpIb2pqRjlITTZX?=
 =?utf-8?B?amRYQ0dFYTRIL0RJZHhFd3JnQ3JvdGtDalRjYXE3MjFSS1V2WDljMFpIV0dn?=
 =?utf-8?B?RlZqNm1GUFgxNDM0VTg4OUdYcVQ4Tk56TFVUNzE2TTlSd2pGVUh0K1hZZVBz?=
 =?utf-8?B?WEZDV1BybnlxUWYzMStUQVVkekpieFVSU2RGT29qaGMzeXdqNmlNME1RQnQx?=
 =?utf-8?B?aWtvc2tZUE1OaHlwZDlnRy9NQWtiWHRpeGhxMFVUNndrNzFhbkdsUGdwQTAx?=
 =?utf-8?B?eTFYWTZENHFIMUx4UzQ2OTZzbm1rTUIrTGhUa0pJUnQ1UU5XeHgwMlhnc3Vz?=
 =?utf-8?B?bUluYWRmZ3ZURUVVcFFUMitmT1VsVWtKWG02c1oxUmFjcFBtb3lnSTA5Q0V2?=
 =?utf-8?B?Q09WN2FWYm51bHlPZ3lPV2RDZ2NXZUNkWHBVZmc5ZENHdkxwVGY1SVlwM2Yv?=
 =?utf-8?B?NUpPbS9HZXIyMG0rUng5Sk1XdnFRSW9DYks4ZHUwT1M1S3lhWXpSUzQwS0Nz?=
 =?utf-8?B?VFEyTWlJNER4TGFQaTRaZG5SNThCRm4ybnFXalNJbUNuQmtqRzVrcU5WVDQv?=
 =?utf-8?B?MEFKZE9JRC9BZ0xEdCtVSU1raDV0OTRyWlBUMHVWWVJrbG5PTlR2L2w0aml6?=
 =?utf-8?B?QnlEaW0wejU0cUV5cFdRcDhiN1ByWXBTU1grVXRaL25GUGlFczVzQlRYb29x?=
 =?utf-8?B?VmJRUHZ4bmFMSnBmaVVyLzlhUWtEMTdHOU9VckNIeGFORHJ6a2NtWUVJYkRn?=
 =?utf-8?B?aUx5YjJkU0NUSWEwSy9IaUREbEowSzc4a00zZlpiWHJjcDZUQm16Nk1LcVYv?=
 =?utf-8?B?ZFhEMldCaDZ1MDZ1S3VwOHZnQTFtaGVkUXJ3SnlJRHZWTllockJNdTZCbUFO?=
 =?utf-8?B?aWo4Nms1U1puazRZeWt5YlZ4YkIrQWxVaHVrMEJGS3BIaHMwNFRNSGMrMVhq?=
 =?utf-8?B?ckRWczlDNmlUZFNXOElpZ2NCcGJVaWNDaEkyUHcwVlpIU1d6d20zeDQyaGlG?=
 =?utf-8?B?bXNIeHZldWhHK05kWHBpMFZlMmZ5Y3BUNFErNjlqTHAwRjlhc3BOdlBvYlJs?=
 =?utf-8?B?TTZXeTF5VHVNY3VNWXZRSzJjUko3djBJaXJkVXprUjBBci9lRkk1MTRSSGRZ?=
 =?utf-8?Q?/YW7dpnF5OpKdljyY0x5eOCIX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdf389b-3215-412e-abdc-08dbea99c41c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 13:57:14.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOlD3RWw8m9n1mWPUPrYm79xxEzLKxo6CmvgzUmRbWQe6ndNPz72CQwQCrMRD7XD//d6MEXKjPjFDlKETP9+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8649

On 07.11.2023 11:33, Nicola Vetrini wrote:
> The jump to the label 'parse_error' becomes forward, rather
> than backward; at the same time, the else branch can be eliminated.

What "else branch" is this referring to?

> This also fixes a violation of MISRA C:2012 Rule 15.2.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/dom0_build.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 09fb8b063ae7..f0191dc148a2 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -439,12 +439,7 @@ static void __init process_dom0_ioports_disable(struct domain *dom0)
>      {
>          io_from = simple_strtoul(t, &u, 16);
>          if ( u == t )
> -        {
> -        parse_error:
> -            printk("Invalid ioport range <%s> "
> -                   "in dom0_ioports_disable, skipping\n", t);
> -            continue;
> -        }
> +            goto parse_error;
>  
>          if ( *u == '\0' )
>              io_to = io_from;
> @@ -454,7 +449,12 @@ static void __init process_dom0_ioports_disable(struct domain *dom0)
>              goto parse_error;
>  
>          if ( (*u != '\0') || (io_to < io_from) || (io_to >= 65536) )
> -            goto parse_error;
> +        {
> +        parse_error:
> +            printk("Invalid ioport range <%s> "
> +                   "in dom0_ioports_disable, skipping\n", t);
> +            continue;
> +        }
>  
>          printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
>              io_from, io_to);

While purely from how the change looks I think I could live with this kind
of code adjustment (not a lot of churn, in particular no re-indentation,
no potentially harder to follow use of [new] local variables), this is
precisely one of the cases where I think having the label appear before
the goto is actually better, for matching how the language works otherwise
(things you want to use first need to be declared / defined).

Jan

