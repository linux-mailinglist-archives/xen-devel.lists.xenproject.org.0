Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0807F59E7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639420.996764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64vw-0000p0-2n; Thu, 23 Nov 2023 08:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639420.996764; Thu, 23 Nov 2023 08:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64vv-0000mN-Vf; Thu, 23 Nov 2023 08:19:35 +0000
Received: by outflank-mailman (input) for mailman id 639420;
 Thu, 23 Nov 2023 08:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r64vu-0000mH-7Z
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:19:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 071c7973-89d9-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 09:19:32 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 08:19:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 08:19:29 +0000
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
X-Inumbo-ID: 071c7973-89d9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6cdYMKN7UxPse5GLl6j5vnSdsjvDVDuUBFWv67dj8ng6DK6sdezAP79hqw7HPlJMjW7XzshdzFaPIKNttQIy1Lt2WMiHH5lrT3uilm4ILiz0M74WkgdeqrG5/S74ShArPERvqKFJuHmPmLx9kt+n1a/mu0yP12xtbQsTxHP++4UVtkeqXJ1KN7+O2RzxN3BfDE5X1k0zwK1zc9sjzWcA+IRiiAc10iMhUB621b00jj0ykIasDQavTm2otycB4j6rdKm8FO0JX7VWtOunMbDjW+mDDFXUne0WgbSng6SmKJkS2Cl4xNRNna+u4Po66kbx4cxRrpdLjGPJP6PEfoWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02IMtu63KczNBwt8NGFFouUz3pe8jJXocvgdW90d5mg=;
 b=F73gt0EMmu33IPsKqbBiQjxuhFv8Rw+F/3Lgj3Jq9oYWWqQnw0uO5xNhLu9oJG0X1ujDjF8/Qz63h023WY8Vkh4eRhnuJZxhS1xVsZE+3hePzGWTjdW4wieVQXLJPXjJpaakPAKNCKyaYMBBg/MK7eVuItoiS3emnpBj+eqGsxU79hkWCGdFYXdd+aMPntfOpOf6EhJ269O+MXbbx2GE3Oss7+3UPwSMm1GYk8llHeoGMmZ5ESopFdUtrhRGAvxq6bh8Qh2Yizl5T58fsfb/lY6cPsncN2ApKQQCZ2lq0pRKNrR+qsTwjLKqVeWpugsIRUbjchrzHj4bmMBfHdv7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02IMtu63KczNBwt8NGFFouUz3pe8jJXocvgdW90d5mg=;
 b=E2nH+1bPRU4mnK1WTpU9lQs4NUGJIcMdVT/8yxIBZw4H/w17WSlBG7vRCyzL5KvJUo62Closb3KdLBa1YrcXFS7GYdDLX5GEKdN068w2UyNuHMqehiWvoLEXSifPVbmT3WoRmZLJuGQ0gRBTy4fCizgXDKp3LFycEQ6w76vVXPDBgEvE8XL95eAP5nnpMPgYRr46z469LqB7PiTF7u50EFFUC6uTr5H7afYyqcr3uxaamuRIejcjCEhxWuKL4HG6ZFoOsJ+BXal1Iz4eWFjA86Tp+K8KG0r0TMb5PsDWv0TWKGRBzki8PBOgjkWMGDq75ep7D7gL+Zd3WILDd5ylHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4aa80555-2c57-4470-a914-e22df497a040@suse.com>
Date: Thu, 23 Nov 2023 09:19:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 0/2] use the macro ISOLATE_LSB where appropriate
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700724699.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <cover.1700724699.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: edbaf8e7-45dd-47f3-7dde-08dbebfcea3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jRjn0NBGeEXjBJTF49Y10Nc1WdVMOk5b0x+lSLAxWTf2vstHQ6xIbXuJ7TIWLDgIdemINQVakjBetfJuo1vXRLLA3QZ6vOvtd9m5pN93yf63MqIqogbFgCvzmi04kZaavgUVy3FRRKVQQJozpIoUDg9vdUgqV4jP8GYjsZ/Hr/B0bmVKu+hTvxhl82z1HSUgU/0OjdDxDm0+CwOrVDHj+QoiWExDvUIU4wO06jVUlfKJfQPVMHTs3HELQUfpw3iQqiabdK315U7ve7OCJJoGYAuVjM4PrMsRpXC+WXPAGaOJfYSYyDfDeNIcXPQ488jXsgG+ec6cG8sIGFDG1jYCYCxf349KbITiEqRVRkw9nSlzt2WnBK4dpun5MtQx5JGMLSUVrcsri4BQQalp4SprFQYbkY4oqr2wgN+ui3YhwmEst9KIJfg3TcIgrjldVOvoAiXKZYdrGyY8APVdJ7wCZ+VMXsh5hkg1b1kQhDpwMT/x03mXTnZc440Up4OHbt0pnghxvGuVBoB3VWMCwiQ2g73XLMrnKfOgGTDFgPQS5EzDEYa4ipqaP/kQsWF/etcP2qaUGzuExe1BL7WxxPOWO2UZjgFzs0V96BHFbseFsqgT5pX5927jQ6dl9aiwSO71hBpULmXaSbtIg4PJ8Mvrxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6486002)(53546011)(6506007)(36756003)(6512007)(26005)(7416002)(4744005)(2906002)(31696002)(2616005)(5660300002)(86362001)(54906003)(8676002)(8936002)(66476007)(66946007)(66556008)(6916009)(316002)(83380400001)(4326008)(41300700001)(38100700002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDZwUmxpUjhQT3hNdGxNcmZWeVJCellON0NySTByVzBiaHU5a0oxejBrWmx4?=
 =?utf-8?B?SzBEVkJDN2ZnTE8vaWNNcUlMUUNPNTVxWmM4VW9LWEdpY05idVdVcjZDRzlr?=
 =?utf-8?B?RC9aYjZjbm1jS3Z6c0VrcUMvbW4zZndGMjFrb2JzTm5YYXNJdFU5NGhyd2Ir?=
 =?utf-8?B?ZmtQSmdQSE44b2EvbkNvakRCbkh6bk96VDh5eERrMFBaTlR6c3hId090ZFRu?=
 =?utf-8?B?V2VvcWdVVjZmdk9ObVBCQzI3ZE9mL0FuQnVVUkZKdlBzSGtTZlFPKy9zR3Ni?=
 =?utf-8?B?Nmc5QXNnRGExRW0xNk5NUG5vOVBpcTFVUksyZEIrV09YQ29oSC9Nb1IvSnUw?=
 =?utf-8?B?QnpCRmN0MURMUHZqUDFBdDR1OFpWRm53L2dkZTd2YmpIMFdmQ2FQd1R5cldS?=
 =?utf-8?B?eEVHM2wrUlQydVdOdVptdXRNaUdDZ2oyeUtyaG1ncDlzUXNJdUhuam0ydzNQ?=
 =?utf-8?B?TFZ2UWpuNDNrY1FTeVhnL0ZIVUUybE9KQ0pQQWphRGVveXZTTmF2b3NZU0My?=
 =?utf-8?B?L3FycnRxQkw5ZjBrS1UybnVtdGpmOFZjclFNbDdwRTdlRHNiWEpVeTF6M1Zz?=
 =?utf-8?B?dHV2N0V1R1Z1bVhabDYwM2lsL0xBamI1Si9idDRSWHliZlMrT0p6Z2pvL0xC?=
 =?utf-8?B?Ky9qOHA3cERVeUJHWDl2NHF5SGFHR1dINVdIMUIzVXVVanlJZWY0cjYzZ1lY?=
 =?utf-8?B?ckVFVmRtdkxvRGlBNkdISDEzT0pWUDJWVHJWSnhpQWl4UEdKUFZhLysyNnd2?=
 =?utf-8?B?citiTktHcW9tVzFvV1Vac3ZVMFVpZzRrVlB4Tm1kMUIyTDlhZi9HelpMNmcv?=
 =?utf-8?B?alB3T3k4cHR4c1E3MFdkaW1PR3NVQ1NQa1hxSDBGTjNSdWs1WnR1eHdmbnE2?=
 =?utf-8?B?WXVVcjlFMnErL2V1eXlzOUthY3dUN3ArSHFxSHJKdjZiK0xCTC92Y24rQTZF?=
 =?utf-8?B?M0J6WlRaZFo3cWhmQ0JUSlRzam9xc0NJaUx1ZGVvZXBDZDRVNnR0blFlaGpr?=
 =?utf-8?B?K0ZkT2h3Wkg1enpTUUZRSG9QeXpzWkZVMTFaT2QvN2o5dUo0WG96ditGTGdF?=
 =?utf-8?B?QzJ0NVN6cVEwN2NWNzQydnBWcXNmTEJOWVc2MGN4Mm5YQXpsenBlK3o1RVlz?=
 =?utf-8?B?NU5OSE0zSldrUGx4MUtRN002YlkwN21jMGZjaXNuT2t2bUUrdWJtRUhaZW5Y?=
 =?utf-8?B?YzlrQzhJTkZXWExpWFM4VGwxMHdVL2Fpbm81d00yYnRBOFR2c0hnNVZNSzBD?=
 =?utf-8?B?KzRxcEw1T3NZaFJ1VHQzLzYxV01JTFBOVEdKUDRFMExjUzhnT0kxbjhuUnc1?=
 =?utf-8?B?RjFTNSs4aTNXM0ZNb1R3aFhYU0ZQZkwzZm9BZWdnSDA4NURHK3FlQ0JBV2pN?=
 =?utf-8?B?Z2VlQnFIamt3TWRiTjgyL2g2R2lveHB4YTYvU0hiVmsxT0Y3TEIwZ1hDVnQ1?=
 =?utf-8?B?dFh1aFdNdnBjemxaVWZicXNtWHhlNUtibGdpVWFQUVB2cDFCUzBUbU9PanMx?=
 =?utf-8?B?TExrYnNIdXlmQ0tKZnNJSW5tdzlaQzZzdzEvbWNEcE5nL3RXcVFoK3NQYWJp?=
 =?utf-8?B?aTFCaHJ6RFhPaWFSMko2NHFyWldjNUoyaGRyM0xQK012azA5WWVzWklpZlI2?=
 =?utf-8?B?RFVTY0lIMTdESmlrcDdnMlRhcDZNcDlRK2dQdHVPcGw1S21lbW13cmM4dzNz?=
 =?utf-8?B?M3JxbWhqZ0NXOTZ6TFc4Vko1cE1YdDVqWm9vSzFBbk5Vb0duNFc4ZVBKUUcx?=
 =?utf-8?B?Smt1YWJRZGp4QTlDV05sbWVWZXZoa1d5Mks5YWxpbmZXYkMya2hpQngrS1A1?=
 =?utf-8?B?Q1FaRXNVWEUxb3hjaDlSVTZ3KzdIYnc3b21MQ2I2WllLWmoraFFIYXYrMlRz?=
 =?utf-8?B?VFNFWmlwV29pOUkxWWFjS0VZNkw4ZnFjVFZXd0tkOTFaZWduMmkwa0UzWGN6?=
 =?utf-8?B?aFNqMjBOY3FvS2hOUTNjeDFZbGhKVUljLzFJQ0wrMDBBZGZDYkJJVnpNdFNM?=
 =?utf-8?B?VnJ0akcxU0daV0V0dVk0c2R2YUpFaS9TbjMxTUF1NkNXNmhROFdSeEJ0OUpq?=
 =?utf-8?B?SnZzczl1S2FMdHEwa0NncTQ4VE5PcGdBT2Rud0JPTmk5TmxKMzFMN3ByYVpC?=
 =?utf-8?Q?Jw62GqCA9npgTgm0pzVBa5q7g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbaf8e7-45dd-47f3-7dde-08dbebfcea3f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:19:29.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kThT5pkgf3GqNBTqQtrI0g6rgCnI/SuCZz9cHTDGpCMgw72zoulvSCrKeI6KjeR9epoBLv+BpGdi3GlJCfENyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

On 23.11.2023 08:37, Nicola Vetrini wrote:
> This series replaces two instances of the pattern (x & -x) with the
> macro ISOLATE_LSB.
> 
> Nicola Vetrini (2):
>   xen/vmap: use ISOLATE_LSB to wrap a violation of Rule 10.1
>   xen/iommu: use ISOLATE_LSB to wrap a violation of Rule 10.1
> 
>  xen/common/vmap.c               | 2 +-
>  xen/drivers/passthrough/iommu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Just to mention it: This is an example of where tracking the various pieces
of Misra work is artificially made difficult (see e.g. earlier respective
remarks by Julien). Why wasn't this combined into a single series together
with the 3-patch one sent the same minute?

Jan

