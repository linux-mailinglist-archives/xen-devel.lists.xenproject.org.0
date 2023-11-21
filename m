Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD77F27A8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 09:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637566.993479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MIx-0004Wk-P4; Tue, 21 Nov 2023 08:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637566.993479; Tue, 21 Nov 2023 08:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5MIx-0004Ue-MU; Tue, 21 Nov 2023 08:40:23 +0000
Received: by outflank-mailman (input) for mailman id 637566;
 Tue, 21 Nov 2023 08:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5MIw-0004UY-9T
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 08:40:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe12::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4ec4f4-8849-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 09:40:20 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6804.eurprd04.prod.outlook.com (2603:10a6:208:189::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 08:40:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 08:40:17 +0000
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
X-Inumbo-ID: 9a4ec4f4-8849-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXVfdqC+kG//MlMEllNyYzqOXXghxkRItGKqnGdWBe5PcGhMW8gxfJDzUAY03Mb9TfaRei8d79pK06eSWDxewoyJ8AJY1KZWgl96jgemR6qsGLc2KVxTIBZPmETxqWWBQkQ0jaRlh9DFdlapXsk0U76jh8LOugCHqU31yJZmGS/AddLad9yveBnnDvX0dBQLoK82dIY2f4delyodgtXGmlVOBSQGVjbDD59N0wT/Qft0MxFBkGtk3DQkaqxlOrIfKGTISuadVli+Ex5Z8dbktxCqjhd1Lbp14a1N7oaNKthtPGUl/r6Zi+jK192AKPjjFVlCMwohGU8LvVyjw79tGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfOT8zcnlQVCODiVrp6A4d73eIGTJ0tE4fy1SXn5yNY=;
 b=U7dsLO5Q8de/IClB20qBZGyaufv3G5OyNS4Eht4aEhTun5y6gVVUcR1GiplF0MvvD0ZYLypaH4t0PcC4mO+m+xxShphhod1zQHOod+MYw8az0n34HtA4Etqc6usz5HW0CiQyVprhsOXpWJvyHVi+VginFu1TVkwA8ePzs3WR5zR7whMdzmjrVIHgIEGnZFH8hoEUjZZPAiJCgnK8Y+VN8fvy3lbgheKqYYdduHziltYg125OnSzpr+SK9n3SNZtZTWSazp2SSjl6lVSa5kV/Lcv6cIomKni6kZV9tC2XuHIMNCuEF17imAq9lv/177igjvV6AFlEox3/bvIryFeJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfOT8zcnlQVCODiVrp6A4d73eIGTJ0tE4fy1SXn5yNY=;
 b=cf+DSu17hFEmCjbKuK+sSwz/qLPXshRZpwH49lSwtC/JRLNdOSe7SsYm2n99HGh7uVlT9ja5R9A/F/WYjuaRPHhus/lmfa2gopMdJy4X+UB2wMSsCAL1a2nN/adbWmzAxRkiuIrGi/MJT/TbhtTdRt8+RG//9XUyIlWSpRaODwKx9/yN0EFNQ9FBc1UyLCBu5tIdyE5fQQXaswEzNCtJgMEAkoFo9FjTRHMX23SZDpZP7ImjZnac3e4dwdaDRnzSMtO7W55jOpmQtnAln+tX/ocKhW7soM3vUL9Wa7RyzVNTiDHlv92LslW/w2zCM23ueTD/VW0AVOdf+iLyAoXecw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a17c5268-fcb8-49bc-af68-a6df2227d48b@suse.com>
Date: Tue, 21 Nov 2023 09:40:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/efi: Make efi-boot.h compile with -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120224912.1421916-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 10dde8a6-bbc0-49f2-9b3b-08dbea6d7cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8uDIE4h6Uc0dITTwQQuI24JDsgq2z3LyYf2QOrogbZgOA8ps+s7HUBFh3JbrAODgq0LB5UdV8/QFp78Ryk6AF9GY45/LdP0PmH8QscfcVWcU4nuu4KDfAWAkWwE/A/LeKSrpyfdjOTGOTQK2uE2Xj8YtydlnIPX9+yrQYmMRGaHfRMk0dXOi4EKG7m7l8uPUR8BoEqGn7/eX8sZJUnnpYzyDL40ZlWFAUYD6+6Cw5W2gUL8uf0On2Nrbw1WC8u6Y6yVZsofyrQLSImFHsuFlWkvW3T4wsvczTZFUYGt1F2xCpCTYuM7LIma+OM9nhjU2Q5zLk00dT6HUNUXRUEk5FrO+eIzuhmiynSsUDvzKlv6CGQzk6jVRwQYgot2v6laDZaawn0pTU9ryFIA3Jgp4z9wqdszYekmiUeTKL5SGuTD/UPCZJEcWcB8F+ebA9QJPeKK07DPVh2gr8cE3iEtYwEDd7b5uukD216TOj/hnZ1xQGymU+JY83vgSrDU1P9g1wN8CjIGZUiKoux5WCdnLqJYkVB61KAZ1ROKB3j385/osnNaliK44KPWLUfEpgZSwpd6zmR5FEAuVUOtYBIgTsck/G4/7ANG3lZKS2Kc8erTWpdpyEdBC9+df9bo/vOax26IBigqv3ds11uafBQXtGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(83380400001)(6486002)(2616005)(53546011)(31686004)(6506007)(26005)(54906003)(66946007)(66556008)(66476007)(316002)(6916009)(86362001)(31696002)(2906002)(41300700001)(5660300002)(7416002)(38100700002)(36756003)(8676002)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2ZnRDBNZ0I1bUNPZklvazVSR1NNbWRjN29SVXhzSGJuN1h4dStlSWduZGdn?=
 =?utf-8?B?ZTdGOWI3SklYOHZkYlp4YlVGTXFSRDhWZStwR3E5Zms0eGloYmFFeFc3eWg1?=
 =?utf-8?B?LzlpWmo0VE9MV1hHaXVYMkVuaDhzTEkyZ3dhR1l6UnJEby9ZZDdMcFRabll5?=
 =?utf-8?B?TFpISXdVRkxHeG5MWnREMEZvMzhMSDhUTDlnTVd2bjBEaGwrbXJKSGlQR3Rw?=
 =?utf-8?B?a1NSN083ZXRXNlQ1UzhYR2REU2c3eXY0TCtkdUppTERzZCtoZjFqb08ydStl?=
 =?utf-8?B?V1dtY2NqT2p6T2IrUStNL203SXZGV2duK0QzczhRV2IxTng3L09kS3RnOTND?=
 =?utf-8?B?MDNmN05HVXh2QUZtL3VCNWN3L1lpc3pLZGNBbURnd1NkeSsvaWhrR0VIZUls?=
 =?utf-8?B?alJCM2dIcTVHRXNVb2dSaTdvem5RaG1RTVhaS0RwU0Q3QnF4TTRnczBKaCtp?=
 =?utf-8?B?aVJaRS9tbzY3YWZVVUdYaDJKcnlaUFdydXUxWjh5eW5seFNLY05yQ2dlT1lr?=
 =?utf-8?B?dkJqWnB5bXV0cW1EeGxFZXhlS3paK21SeWVTSDNra0RBaE1ycFo3OWFVeStT?=
 =?utf-8?B?QVJCYi9sRnJvZU5kUlJ0WXYvdVQzcEhqUGtWaWtQa3gzQ040M1Zjc2Y4RVVW?=
 =?utf-8?B?WjNuWTBLcjBqdUh1ajdQZ2phS2xPemVjaTZ6ejNmTWhyaDdoR1VJa2YxSlR1?=
 =?utf-8?B?YTAyV3VCekJrNGROc1lwa2d6UTZZZ1pGRTUxKzFxRERWSkhKODh2S1kyS3ds?=
 =?utf-8?B?L0UxT3ByVVJTV0dqN3BNcTlINGRyWUpGc1lXOXgrcXB5SGRlb2xOTVNHa3pX?=
 =?utf-8?B?OExJdUFuamZRL3EvQWhNSGg4NW5FbHJlbVRNcDExMjBXUjM5T295TTU5OVlK?=
 =?utf-8?B?dytrR3M3RkdYeE5TZGlpS2sxUUJUdHBYTmYwTHlFSVBKcTYxSEpTMVJ1SUY1?=
 =?utf-8?B?dzVRZFRuYi9nUnlTT2RKN3kxNXc1VnRTKy9PVEptNFZMalVRNHFhV2ZKMTVH?=
 =?utf-8?B?QU41cTVFMGFyOEpYMmxwRWg4MHJteFprYzd3S3pDa3l0Q0hwQ1R5ajgrVEgv?=
 =?utf-8?B?a1JRM29SK2pkVUZqUFhkZXpZaCtGK0hlVzFzRnI0LzE4WnBzZ0hzeGovSSs0?=
 =?utf-8?B?WnBOdDhhSWFjRVgzTVgyb0psWTBUbjMwZ2x1NW8vd3J3a1JPOUtBTGdxZ0Q0?=
 =?utf-8?B?Q1NsRXN6UC9SVmRkRnBnSE9RdVlnYkNqMFFUZ1FXZWJ5UmJSUFh3bHZIZlNu?=
 =?utf-8?B?ZUdiYm5wYmEvLzU5UUtHZXpPc0w2SVFCS1cxeVRkSzZOVTJnYm9zbmhFSHhD?=
 =?utf-8?B?bDBLNW5QRDRBSW9rNzdLL0UrZDhwV3R6TW00Q2hMQ2ZRdTUyVnEycWJKVGFl?=
 =?utf-8?B?MXBqZS9OV0llUWZYaENVSlc3NzRzTnhGbE5YZmNJaEJFdy9lVmthak1kRGdC?=
 =?utf-8?B?d0pOQm9sRk85U2QwN3BTcDlTempTZncwdnBSK2FmNElaNUNBV0t3SmpMSW0z?=
 =?utf-8?B?Zk9jMmxGWVEyelplVXpaUnBEUlo1Qy9EMGtOQU9YemlyUU5ZajR5TlQycEZ3?=
 =?utf-8?B?Rlk0WTBiSmRjcXgyNGhWUUZEWVUrTVd5ZmVVZWdJanpUNWFCa2Z6YXRwYkc0?=
 =?utf-8?B?emk1Vmtxa3FCeFloVVB4SW5TWVNrbk5HNHdKdGNuYk0vZXdxYzF1emwwVUYy?=
 =?utf-8?B?VnowL3dBOXVVcWpRNjVVSDdTVGV2bndNMDZlaHQrV3V4NVpZczVDOW1XVm55?=
 =?utf-8?B?dkQySkswOUpCcTc5K3ZWUjJOSDVoTmF4MGhkeDhmUGFycUl4cXYxMHdPdVMx?=
 =?utf-8?B?Y05CWXNSWmZoU2tPaTU3K2IyYlQ2NFltSFMrcyswYnd1Ni9Td0RCODVNM3lx?=
 =?utf-8?B?K3huWnkrYnF0Zm9MKzZQSWE2TDJISXpZNHJ4Y3RqZHcvV3prOEFCUEVZcG4r?=
 =?utf-8?B?YWx6OUxTaU84WGhod0RoMWhENTNoU1ZNTEFrblVZSEpYS0JnM1BvR0wwbTMr?=
 =?utf-8?B?YXVDSHRoK2R2YjFaVTduUEdXV1V2MHpRUEtPUGZHMmNKbGVBS0V3MitHTkhk?=
 =?utf-8?B?TVlrQjNrUFZwQzZaRk5FVVF6Y0xPR00zdlU5OGhYckRrRnVuTkxMNFhZdkNV?=
 =?utf-8?Q?TLrgz0b+5h31kk7eaG4b98rBF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10dde8a6-bbc0-49f2-9b3b-08dbea6d7cef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:40:17.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rY2KC2DX8Ar/Ll4yXoZe3L0fxBAKbpl1iJTugDx1x4CI6rjQ5oVQeQMZ4L4RL/SfVddW0kEhdUCsd486n1taw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6804

On 20.11.2023 23:49, Andrew Cooper wrote:
> GCC complains:
> 
>   In file included from arch/arm/efi/boot.c:700:
>   arch/arm/efi/efi-boot.h: In function 'efi_arch_handle_cmdline':
>   arch/arm/efi/efi-boot.h:482:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>     482 |         name.s = "xen";
>         |                ^
> 
> There's no easy option.  .rodata is really read-only, so the fact Xen doesn't
> crash means these strings aren't written to.

And the consuming sites confirm this being the case. Hence ...

> Lie to the compiler using a union.

... to at least slightly limit the lying, how about ...

> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -479,7 +479,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>          w2s(&name);
>      }
>      else
> -        name.s = "xen";
> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
>  
>      prop_len = 0;
>      prop_len += snprintf(buf + prop_len,

... you also switch to using name.cs down below here and ...

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -324,7 +324,8 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>          w2s(&name);
>      }
>      else
> -        name.s = "xen";
> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
> +
>      place_string(&mbi.cmdline, name.s);

... here?

An alternative would be to introduce 'char xen[4] = "xen";' in both
cases, and use them instead of plain string literals.

Jan

