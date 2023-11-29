Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A3A7FD07E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 09:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643719.1004152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FlF-0008H9-UM; Wed, 29 Nov 2023 08:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643719.1004152; Wed, 29 Nov 2023 08:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8FlF-0008Dw-RG; Wed, 29 Nov 2023 08:17:33 +0000
Received: by outflank-mailman (input) for mailman id 643719;
 Wed, 29 Nov 2023 08:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8FlD-0008Dq-Kc
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 08:17:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcd67799-8e8f-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 09:17:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8892.eurprd04.prod.outlook.com (2603:10a6:20b:40b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 08:16:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 08:16:58 +0000
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
X-Inumbo-ID: bcd67799-8e8f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYqgGU7MAxW9KNtq9WTPVxnKiTRAkCw64Fb8gmpNBv3iTtrs9r6opvf/Xtdj+Xh8B02J0liDI0ACRH64XwSxIkKbWSY4pa1sPHQ6HacjNkTfmS56lBWWsnjZyPTbGIc5/fFRFhw6W3yCs617C0QH7ibnNB7mORtU4ArSk6TZ1LwSoZ1FKFJlKOZArpZfs43GS/rF/ZpyflhU5N9Bl6u/YMgf1CdC2Af5y2q57PUKtpstzavtcdUOjAigH3JKESQd/ywKkf4JZ2fE+d3ECKREz8Znp3/GQkKB5OapcISGNLREc7GKdXgzG85w10ta2y3iJG6Xbq+V0dsvarHYdMs2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOFH4cUxoczcrvD+o9V9I1ocIftlAqpv0v9G5a+D4Qc=;
 b=heKZHvzp68rf/PiXQZGMj3bUdWyxxLfO731eaWKfd9KAp57aVxFXhDIXkzB7TonxV84UJy266LW7HC3j+cl8Eqv6ja+uTqUgiEb68NhDyJlgpEkRsRqER5XXzTaEnR1AUH/YSI84umifSI/MDWYD9Srt/rS99V7avclY9Cx1MiYgxCh1TP5tPGPrFIroV5cRlWFeSgulSfnQvxWeewILU94eN5UyIVDV0NdI37/RThoeOc7RjU/6BAhvCeGnmiIeCnBs+kmX2mifQQxME6s26chNj/rk6dxGJP319dnEPSnVWZwfLpE4apSIFuRK0HYhk/KK+CqOIKRANDwBuXAbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOFH4cUxoczcrvD+o9V9I1ocIftlAqpv0v9G5a+D4Qc=;
 b=SrKv6VVTYdvInnfIkj8QysgyfYM4JTzf7BknYlSpw+55VxOzk8R6bvjhSrCpSktiqFRzquAv0LXk48/ovNiJN49psz7dj0emBG9oEZaf5Z0qkNXcjD0f6GbwDoqG474XvdreXE9c/PfY4n0iBsK3zIUHf4Sj+XRcL9b1qHw4wfBkN+qE9Dj3mgC+5Plu4A+n6BSyWP28TJePhKLqFMLm1eX/4hBzBShnDV8sDW/WB29QIjjgomdwyQ/G5K4nfwid50EDWtUaVgVzbzk4A6xVk82CBWHX9GKdk0SpoFS0BzfVl6VE0cYjJd4zFdbBf2pOmdu70YeRvGy3ns/0jpYMlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e49d872c-19d9-44a9-8ecd-19e5d3d4e478@suse.com>
Date: Wed, 29 Nov 2023 09:16:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
 <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
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
In-Reply-To: <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: defc5311-d0a3-4d81-aa06-08dbf0b38e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B9Bq8vCVDziQyLIwYiXGWPebLX95GjZSRBh+rNrT3k7YE2f/ZcwX7IlqmdAP0y+rKx5bfcJdjxzj0glziidS96sBeQsIYVsKI4ZgSDa7FVRbVOb/aSDu0gvUYLCxqZp00r9LIA425jutt6UxRAgnMd5+O0TCEeZW2/hRBupADBxwHCJ8a5L8fDvI9e2V5TR8E2+zKKVzMTjki5BZt0vJO7y6OY+IPa0SylxmeYimSVM5vUkmHVJODHBcrRbauLHbviOhm0HmukUny8J7TmLNfZPnzFrtycVdwlHfqDVnHEMHNvJ24BaU+7JOIC4brWj61pZ4gF/DugsdOyOcOCZaDjBwrQcxbFTDdjUFqYyhALjVWgvBNdZya41Dc/p8kdAOqfnJr7I5FrRhW8aeAgS3TGIRfDF09oGwqWVdCBpeUlD3i4LWFBSTmhio4moSsj2TpGdVEUha/e7ftUSu7SEk9F3MPmhU+WN8wcSrrnsl37E/P+ikFP4dDGcIvkFCc4O6eIJTcDXpOoMab6MrEIBNRyEIhqpHXU8s/CBTahwo4R1EDS2gMOPTCpIxFKpDsvc9zdnvXRcIhCWA3ZH1ojEHB3gUJd4oj/Jlh+JoZhn3t1hbMYUIi9mgXy4n+5J8+N61B6wP75CkYqodn0nrL3h/wktFnq4Ln47kbgUrCL0nctU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31696002)(2906002)(86362001)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(7416002)(8936002)(41300700001)(4744005)(316002)(54906003)(38100700002)(36756003)(2616005)(478600001)(53546011)(6486002)(66476007)(66946007)(6916009)(26005)(66556008)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUtROG5maHF3Wmp6bGI3eU5VaXNDZzB2bkRhNTRoLzVDRFMrRGl2NjlxSGJZ?=
 =?utf-8?B?YU1VRnJ5bkh2R09ncmZydjNXVXRXbm1FQzlyLy9pVkVkSnE5REs4ZjdEMnow?=
 =?utf-8?B?cDlhL2FhQk03YkRLZmJGWEJZbU1LMUhRaFhEUEtYcVV5eFB6NFRtR1B3QXIy?=
 =?utf-8?B?anZOVEx6b1dEV3hHSytzdUFkVlBPM1RGY3p5cUNFUk5CaXhUZGNRYXo3TmZi?=
 =?utf-8?B?ODg2NXY3bzZSdnFDMlFlMEZ3ZzkxcE9tdG1tODc1dmlMQk9HanZ6ZDYzdG1z?=
 =?utf-8?B?Q2JFMkxLUERJdnpXTmlyOCtlUTlWWHFKMGNVV2ZBL25DQ2NxcER5N0Zjc2p3?=
 =?utf-8?B?enNpcHNDSlRxd1hwZEg1OTFYSEF1OEZBQllsR1JMbWZrcDlWZ2dpdHJVN094?=
 =?utf-8?B?djZ2R1dBdWw4QzJzNW0ycTdTZlFsQ2VoOVBtUmFIczZ5c3dBT2tRMEVva3Zi?=
 =?utf-8?B?K0E5UmpWV2dleDlmNmFMUyt1SlNFckJXWUhKT2dLdmg1NHZkUkp0WEswTmJl?=
 =?utf-8?B?K0VkL3RRT0txMjQ2ZTZKV2NwQ2pLSDdqTUJCZUpKUlE1WnRlOE1OaU1WOHRn?=
 =?utf-8?B?M1BHY251a3ZDQzB6ZGxndnhKL3Z0eFcxVXJpbzZScm1WNngwTE9lYmpjeEFn?=
 =?utf-8?B?UktncDNuU3JvU0dReE1oeTlJSnYyekFsMzIyNEh4MEp6T2tHbytTZmhscWJ5?=
 =?utf-8?B?M3dKOFluUUgvOXpNTkw5VlMxVUtNWDI5RWZYZU9oRjY5bkZndGJIMHJCcndS?=
 =?utf-8?B?YXVjSkVsbjNJWEI1ZG9hZCtUUjF3dktvNUZMaXNCaE1OZGdEM05KNnUzSGJy?=
 =?utf-8?B?N2gxU0xTSnRaV0xURWVGRDg4WDBQWkJ4VXVwenV2TEc1NlE0eHJneVZvMGhZ?=
 =?utf-8?B?OTVYcDBQNVd5ejhtR3Y2UWhBTTMzSTN2UUZwQzE3K296OWpLRmxzNVJtSkRO?=
 =?utf-8?B?SnErak4wOFJQMmhaZmQwMVVidWRvamZaUlRJd2pWeTV1ek1kd3MvellONTdw?=
 =?utf-8?B?Wkc4ZWorZEd4ZXhHZXlNeElnejloQ3Q2emQ2SENrdlI4TVNtZnBlMWxuM1JX?=
 =?utf-8?B?K3lzTVZxVDk5VEJOMVYrcnBSQ0xpWFlYZWY2bG9RU1p1Z3Y2RTNhR0pJTmNH?=
 =?utf-8?B?ME4xd1JHOXFUdk4yZEhlL1hUMlI4S2psTDcvcjMvQlpQQS9RYmxiMFZwUi9W?=
 =?utf-8?B?UGNaNUUrWDFTWWJLb0wrOXZwdmZ3THB0TC9VdzljVTJ3aEEycTVoSXBhNk8r?=
 =?utf-8?B?cURhRnJWU3llZWNPdU00dkpHek9Xb29jVEpsYmJ6dG1oQ29VK1RPMzZkbnJP?=
 =?utf-8?B?TitWdE9sa09VUVExallndGhLZ2RxandGd1NZVEFCVDlBTlZmRjNPK0cyM3Np?=
 =?utf-8?B?QmZpV3ZncXdDZGtZdG5yeUZGZVZlbW1vcnEyYzlmanJmR3c0ZDNtZnhHMEU2?=
 =?utf-8?B?UnBrOWpMd0YxQUtEd2ZDTTVKUzRqWGJjSVNpYnByOUtEWlNHYXF1Y1ZJM2Uv?=
 =?utf-8?B?dmJFdzhYQmhlOEQ1UUZuSnJvZlFMRW8vNHJEbEd4cXYvbWlvNzZ2NG5TSzBM?=
 =?utf-8?B?WmRsSExiNFV0UHNkNHl6cjlxOHM5dHdzYTZ2TlJVb2luVHlTSzdDblZCZSsy?=
 =?utf-8?B?enZ3Ni9XaGVVL2JsdzlpVHZ0RjdNeWlsb1JvQU03TXJxZlVjSGRJZXNUSmQv?=
 =?utf-8?B?WVBsUndEZHUwRXdJamkzeUxhRnE0WXJObFpUeHVyZ1FYSUYxOUkyQmp0LzFF?=
 =?utf-8?B?YVNGRkVaek1WcDJacXlBWnFZU3AwM3dNejYxVk5qa2FkbExIMy9OdmNYTE5O?=
 =?utf-8?B?N2N2eWt5eUVJb3ZDaVI4N3k4UUY1ZmNFQ2Y2Z3BOMzJCR1BKcFlWaFJpa0o1?=
 =?utf-8?B?ZzFHM0grb01MWE1LemJuUmx2R1hTZEh6dXk5NzBmSlZ6YXFzZnZ0SkVvN3hH?=
 =?utf-8?B?M0VVMVlPOXVvUjRPODNYdndOWXZxVVFINGM0N1JydVQ3LzkxTEdRMGdrQ2ZN?=
 =?utf-8?B?TWFzU01EbFdoV0M3Wm9xaStzbGRQT0F3dnNtdEJzZ1l1M0ZXcGpHUkxPdzRZ?=
 =?utf-8?B?RGt4dmFQU1RwaVZTZ1BIU3ZNSE9uNXF4ZVVZOWtXZjFxMXhXYytxcjZ6U3Ux?=
 =?utf-8?Q?EUlr+j7Xt9ZxVQU6MjK8dar1/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defc5311-d0a3-4d81-aa06-08dbf0b38e84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 08:16:58.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTYrN4F332XVYGiQCJ1t6pWNeRsV5K0VThE7ZNc6rXge0td2ggfuuq7arNkde/1Xl6kTVz66+2MDBViGG8GTuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8892

On 28.11.2023 22:28, Shawn Anastasio wrote:
> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
>> --- a/xen/arch/ppc/include/asm/irq.h
>> +++ b/xen/arch/ppc/include/asm/irq.h
>> @@ -3,7 +3,9 @@
>>  #define __ASM_PPC_IRQ_H__
>>  
>>  #include <xen/lib.h>
>> +#ifdef CONFIG_HAS_DEVICE_TREE
> 
> I realize that you were likely following PPC's device.h which also
> checks CONFIG_HAS_DEVICE_TREE, but I'm not sure that it makes sense to
> check this conditional in PPC code at all -- we will always have
> HAS_DEVICE_TREE (selected by PPC) and I can't imagine a scenario where
> this will ever not be the case.
> 
> Unless Jan (or someone else) disagrees, I'd rather this conditional be
> dropped inside of PPC code.

No, pointless #ifdef are indeed better avoided.

Jan

