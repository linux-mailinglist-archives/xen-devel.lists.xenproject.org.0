Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E457FB674
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 10:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642868.1002628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7urx-0000M5-ET; Tue, 28 Nov 2023 09:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642868.1002628; Tue, 28 Nov 2023 09:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7urx-0000Il-Bb; Tue, 28 Nov 2023 09:59:05 +0000
Received: by outflank-mailman (input) for mailman id 642868;
 Tue, 28 Nov 2023 09:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7urw-0000IO-2S
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 09:59:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2085.outbound.protection.outlook.com [40.107.13.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c11fffd8-8dd4-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 10:59:01 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB10059.eurprd04.prod.outlook.com (2603:10a6:20b:680::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 09:58:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 09:58:32 +0000
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
X-Inumbo-ID: c11fffd8-8dd4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTbZUTMtzPjTct8KvLgTWjFq4gE1Kd+7TwKmki1oUzDuTlcyksJORkHuNKzAK3ju7NelLf2Ggwg1aC0+ci6n9zj2Vz8yMXsUlzG8G+RcejnaisX48mi2DZAYiPyRP77jlrYT1ekXxOgYmKKLZi6hw6Hheq+ofGV/35kl6W973SRn5oR3n5z3+bo4ewkX5Z6gGcK2oKcdUYat2nbi6naMry+M9tIYKiIaG2Ed7IBgCMnbS9JPAgBRsdoh6nYy1Kn45unUN+GEtmm9f4mjc94N6IFiSbm00EsJx+oB4MT6W460PamsyfCRuou8Tdm2VzUPLHKLd2AmGZAYuoKmKg7nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVo6mXEJdVllx1xQz4J8SJAw4xBpv1w+ecg/HZxmgiE=;
 b=aej/QRDU+GnBCrU7Kiv49A5iLpB9YICOh38Vukqc7c8nQGccDXfA25eMN3IgDnPCgxFQfJohtuU09CRsomomZF4JPrSfkwjF0XTc5cw4W7ZHP533xWo5X1cmLPkiZJ8Xb+rnymqaTwqlrXuPUHN0/zZLoTjUSe9G4V+XxiMwIOgsyj3iGQB2dpaQJ+2hWYzPGlpqFmL7HpuGQXyKFf9LbqTMwJLYAkO+p+H5t9OklfEZk9a2TAzUCzJvtrJ1wWLtdvuev/ukARM2oxx55PTOwTUwQZyqamp9z1wx7mW3NNVhCiIOpYlfq6E4orrCLEE3FrJKjzcCLFPIPhAe0cO3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVo6mXEJdVllx1xQz4J8SJAw4xBpv1w+ecg/HZxmgiE=;
 b=nqTAO24a25j1qyla9AIOpBgS0P35sPkWKEKPe99/b9Fa8KkfBSVd8Zcpo8NHdwVnbQrTFqBPX9Z+Dtvyy2xhIBxlCRmX4vT5W8h/YLRdkonatbWfYX5OOsGO9M8x8iSfGzOxjoPEbGalUHVB18Ovf2oc5kJdYiRHJfatku+8KNM3rLJ6YaRxWLBCRE6UhD6XzQYJ36pnh5qVD6KpOFX3eTR8PycLSoRpynJhr+PRrS9jaPUh/n0bg0X+Q/yLktuEsy64A6NgSbEyFBnR+jYG0xtORQGD4Xpa06gypBinMszM3TW1fxVwkeNbWcWSm5wOlfpjWx+z9ontS2P/YZWmXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b81607e0-409f-4805-a4ee-8be8fdd959b8@suse.com>
Date: Tue, 28 Nov 2023 10:58:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
 <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
 <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
 <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
 <195a50316efde86113f6f5df269c754a90490c57.camel@gmail.com>
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
In-Reply-To: <195a50316efde86113f6f5df269c754a90490c57.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbb4b83-eb2c-4a4e-98fd-08dbeff8944b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pDNMZTtjO3yHF/dkeNvIxAXYR7x1Ej0trv7QFKXmlYStCZE3y2tNt95TfZtbAEmL6bCVDW3n4+cE3kmS+IRWa32xHRoOQCwhvNlzIQSXWDCJYiWIKshSBLb+x3gquSCePs854XlK2627JlL8+8kkJTUtR7nSzBSFb0Q4/bJnr670b3/EKlL6tuwHxLOcQBkpdW4cBeJHMvpT1jxDY0nyPZd/boUluBrtn/Ck/BP5s9msmcm3L7oqVb9c4QUSrrzLIubvk4yb+WKLUAf/r1XWdMPqX53hiM+eS1DpD3OWEC2VHluSZ/T6NMBfGtaZGzCG6kKqorFbww82s+2IFh+Q8KUBhqN0UP5nGxPoAaGSltLxF57MU6vgnB1+UM8v2FXoUJv/643rRrV3DFnj8c/nFVpttCSrjHHPV3HsxdWhgbHb7ARDiDVoTE5KCY2zee3O9QtHnvRDYmaB5VuZO/jScD2Q6NyVQ2Zq0S6CCQEua93sJ2Bsm2FBYlZ8Sa9P15W5gOnTj0mnvaBdo3WnirC3K/ZgvmbtE1fSLTbtUVY8a2kbDQlzXmixRA6Dol9fQCnfIR2w5NknTZqkTHqTT0rq3wx0OgN/kNPipIqqSAL2mWOd06rFtXMHSH0gVs6zV0iEoZcCD8FO3Q2OnzzSTvwELA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(38100700002)(31686004)(4326008)(6486002)(8936002)(53546011)(8676002)(6506007)(54906003)(66556008)(66476007)(66946007)(31696002)(316002)(5660300002)(86362001)(478600001)(6916009)(4001150100001)(7416002)(2906002)(36756003)(6512007)(41300700001)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXJqZ09xTjNkRjhtMzdsdVh0c04yd2ZONlBVblNDZ1ZlZ1RXVy90ODhsRlU4?=
 =?utf-8?B?eWdxNHZxQXhYYjE1SVM3WTQ2THI2Ym9YdTliTy9KYVV5Vi90MWJWTnRrT3BV?=
 =?utf-8?B?U3AvSEM5eUx3WStETXhSNWFPclp3Y0RoQkg4N1dlUzJ2b3g0VnBDK05QSW4z?=
 =?utf-8?B?MWZmWmsvRG5JaGJoZXB0VEwvT1FKNmE5VXljSmxpeEJ3WlZ5ZXpPMWsreFUr?=
 =?utf-8?B?clJoUVVMVnIyZGYrT25KN2FSWE1xbTBQVHdLNFZ3YUhWdHFXZjNvSTcxZmc0?=
 =?utf-8?B?V1QwQkNoYW5UaTBKTEZwVWpmaUJLa0JCOWphT1ozZm5NNFhQMEZYLzh5T3Vx?=
 =?utf-8?B?YU53ajhJN2J4aXlWeURYVy9xQUx4UEx0anZtelYyajJWbUU5S1d3UEt3emt0?=
 =?utf-8?B?UytoZ3Ezblh0cE5FRGtjUWUvWVhEVk9ZeXkyaTNIdGt6ajRnVDRyUWJjak9n?=
 =?utf-8?B?dWFQRGpwL3p1TlUzazJ3WHAwN2wxYUVSOGxCempuaHFUQ292bU4vQWtUeEo1?=
 =?utf-8?B?Wm9SMUVtVlhmNnVPekMzZFNKREQvWC9MK2xVdW5HUy9vV0YzVkExcGxLL0pU?=
 =?utf-8?B?dlZOSFNVTUplQjFwQTUrVDNoOTExRldaODZqS2lpNGVhVXlHVEtUeWJDeWxH?=
 =?utf-8?B?NlhPZWp2YURPbTVEYkRuRHBIK1dEVHhmeU9OU3RvTjJSWUlLR3NzQVFBVTBS?=
 =?utf-8?B?Nm1TTXpadmNWalVXZEQ4NFZpdkNUMGUyTm1FUXluUlpCWnN5c24vVGFvWGtD?=
 =?utf-8?B?RE9mWnIrUW1mdzNUb1dBczVOanBBbldscGFlWUhnQzFFaUdNcExPUmF4L2VU?=
 =?utf-8?B?bGxRZGo2dU5iT2RIaWxLd2J5ckQ1MWNJYTU2Wit4a2k0NFZ3SC9UczNhd0Ri?=
 =?utf-8?B?UnlmS2lzcCtTakg0blRGWUlFdFFIbkNxQlp3SUwybzRSYnBoWVRqZ21XWmV3?=
 =?utf-8?B?OXJXL3VnNm9YN1g3LzNqU1pjT1dmNytFdWZVaEJFRGNyTHZodERLbTcxL3Jm?=
 =?utf-8?B?ZUM5bWZ1UnR4N0x5dHB3L01YVWdwNGJhMlVwc0hUZmtJRzB0b3B6ODNNZlpw?=
 =?utf-8?B?YnAxN25hNTE5bXpPMERzQzZ4Qk1GSzREY1p4RWErV3hNTDRydGx1TGVXbkt5?=
 =?utf-8?B?VTIvZmZIVUdaV2dEdmRQN0thWDkyMXRwRjd4NjEvVFg5Mm0yWFZVK3pnc2lm?=
 =?utf-8?B?Zk5LcUMxd1o0c0NXdklSSWYvMUFHa2VkdXpSbzhqaElIMlpOSmNrUWlSVEtL?=
 =?utf-8?B?ZExWcjJvNnBoNjRmS09KM0VwSkFMNlJHbjdyMU9tQWljdnd4aUNhVjRvT0FP?=
 =?utf-8?B?dlJ3VjhWN1p3Kzl1SzROTXVIa05pMEpJTkhBdFM0ZU45eFZtazRCNXJraFBC?=
 =?utf-8?B?dVo4V0dnenJUaEU5OEo0RXE1WXlvY1Zsbm80a2VFbk5tRlM2cmVGNVdnK0Vl?=
 =?utf-8?B?L01wQk83ZUdhWS9hN2d2SUlMdTdPVDVWb2hDS2NhSXo0TG1zMlk1c1gvczZj?=
 =?utf-8?B?OTFpck54a3NLRUlRSFZQV28ycHZUT05PRFpRYVh2Y3Nwc1NNeFhXVWtNTTli?=
 =?utf-8?B?ckFVNTZLTHZnODRicGVRQUdTeWNodnRwUHFLNHYzZDZMRGg0aDJwaW1oV09n?=
 =?utf-8?B?WEV1NEdrT2xpeUhaNWRaVjdkRTk1TFM0R3A3S2t4RER1VTM0VDdXTHBMTW5Y?=
 =?utf-8?B?Z2ZQTGhRcTZxTkF2a2hrc1RiTTJTeFZtVEJmd3NBdU1iOW5ORjNsNHBCY2Ez?=
 =?utf-8?B?aDZ1aFJrSWlaVHk3c1ZSaTdpckdDSVFoSzNobmdjd0hTV0xJWG5KcnYwckdV?=
 =?utf-8?B?Rm9KKzhYTHdzUlNhQ0dLaWVJUzN0VGY0RFBqeWJGS2M4MVpDUFJzSzRjbm9Q?=
 =?utf-8?B?dDRJVVNaV0ttTmtNZE42OERGcnY1Rk9XTTNzdTNxWTJta3NlSGlwVnAzTXMw?=
 =?utf-8?B?Qm9YU1g2NlAzbjZ4QzhLOUtGOGVJY3lYSG5QYW5aNlV3cmgzOGx3VXhSRGtR?=
 =?utf-8?B?RWVOVmVEMFN5djBYcTU4cXpNVlZJMjd6K3R2UDlySHdGN09iMCtsT2Z4Rlpr?=
 =?utf-8?B?cmZMZk9WYWhyWllZWndCck9ETlVkb0xzbkgrQWJMRXZyQ3lMUk5iUkg5OVo3?=
 =?utf-8?Q?HGlw6ehoA9jjtEWTvRVhXBdF8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbb4b83-eb2c-4a4e-98fd-08dbeff8944b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 09:58:32.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhBbLW/DD7cxOMHL2ubNYXS8icGsZvr4y0nWxeBCeaHt+JA8qXsil1LrCvZjv5LZMCwkDNFUlQThSkSBvtz5xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10059

On 28.11.2023 10:28, Oleksii wrote:
> On Tue, 2023-11-28 at 08:57 +0100, Jan Beulich wrote:
>> On 27.11.2023 20:38, Oleksii wrote:
>>> On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
>>>> On 27.11.2023 15:13, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/ppc/include/asm/grant_table.h
>>>>> +++ /dev/null
>>>>> @@ -1,5 +0,0 @@
>>>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> -#ifndef __ASM_PPC_GRANT_TABLE_H__
>>>>> -#define __ASM_PPC_GRANT_TABLE_H__
>>>>> -
>>>>> -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
>>>>
>>>> Removing this header would be correct only if GRANT_TABLE had a
>>>> "depends on
>>>> !PPC", I'm afraid. Recall that the earlier randconfig adjustment
>>>> in
>>>> CI was
>>>> actually requested to be undone, at which point what an arch's
>>>> defconfig
>>>> says isn't necessarily what a randconfig should use.
>>> We can do depends on !PPC && !RISCV but shouldn't it be enough only
>>> to
>>> turn CONFIG_GRANT_TABLE off in defconfig and set
>>> CONFIG_GRANT_TABLE=n
>>> in EXTRA_XEN_CONFIG?
>>
>> That _might_ be sufficient for CI, but we shouldn't take CI as the
>> only
>> thing in the world. Personally I consider any kind of overriding for,
>> in particular, randconfig at bets bogus. Whatever may not be selected
>> (or must be selected) should be arranged for by Kconfig files
>> themselves.
>> That said, there may be _rare_ exceptions. But what PPC's and RISC-
>> V's
>> defconfig-s have right now is more than "rare" imo.
>>
>>> Some time ago I also tried to redefine "Config GRANT_TABLE" in
>>> arch-
>>> specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it works for
>>> me.
>>> Could it be solution instead of "depends on..." ?
>>
>> Why would we want to re-define an setting? There wants to be one
>> single
>> place where a common option is defined. Or maybe I don't understand
>> what you're suggesting ...
> I just thought this change is temporary because grant_table.h will be
> introduced later or earlier, and it will be needed to remove "depends
> on !PPC && !RISCV". And not to litter common KConfig with the change
> which will be removed, it will be better to redefine it in arch-
> specific Kconfig with default n.

Right. But if it's indeed temporary, what's the point of this patch?
The entire series is (supposed to be) to improve code structure for
longer term purposes. If a non-generic grant_table.h is going to
appear for PPC and RISC-V, I don't see why the present dummy would
need removing. That's only useful if an arch can be expected to live
with GRANT_TABLE=n even when otherwise feature-complete, and at that
point modifying the Kconfig dependencies would (imo) be appropriate.

Jan

