Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD07FA2CD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642168.1001446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ceN-0004ox-2d; Mon, 27 Nov 2023 14:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642168.1001446; Mon, 27 Nov 2023 14:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ceM-0004mS-Ur; Mon, 27 Nov 2023 14:31:50 +0000
Received: by outflank-mailman (input) for mailman id 642168;
 Mon, 27 Nov 2023 14:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7ceL-0004g0-G5
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:31:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1927b77-8d31-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:31:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 14:31:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:31:43 +0000
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
X-Inumbo-ID: b1927b77-8d31-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk1V/AChgWxEMf83CoPP53IfVOUQdSg4q2WdNHEF6OjTZMDJVUXlJjegfLjAYA1d186QWydVbkpjZpmrvaj/ZBPVdFh287ooioAX++HCeCgUdc5bRB0f0YbadmbEp64WrevFvPt5lC8uvraPzYolvdMQDJm6E0RzFSvd1zOKTk3YpKAJO0PMXqn7RPrvRaHGD+hnbBwbeYnKZTKtW0Cpf38k1ripcY2HDWahkK3mSZXIUa1oRUmNeY8DuNxDgDWHrZHtb0hzNE7bGhmSs84qdiDozDaESiWlO6EEd4M2uN6pAMXEAQ9Fz5e9dPqdug3YugtH9MW7gYCaki61LrwPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3o01JpG/ONgP3fXyjJdNK7Uj9Vrj5CkGgyQegYFhO0=;
 b=dTczqZYm5vPeYW8qMzxiaHI+UU72G/rCOXD72muFNl/15k7qYuz3A8N9Ouk/gzsE55oRRoPbOHWJJKaEtJPzcw/K7g/aud86fQGxkkRw2T5TfcJIHCaGcZWewurZgI+OmcC5SFntvi/ldyyV/oeiacazU3LRfBvdUcVdYpYM3L2cxGHATuO6dfzDttCKpHOpAkcWqgAMSZg7iOzFsGbuL0wiwTFIslKy6PRQpYpFMNOMAffXyimHvOWHy3ny7aOUvX9fq/7exSGr8a/siODioJUjxJ9EMzPUuGPyiHm8rJSdD+ERKlVVfYDgKnl2MhUmFZOBRMgNpj+bmrx1eVjmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3o01JpG/ONgP3fXyjJdNK7Uj9Vrj5CkGgyQegYFhO0=;
 b=txP6d9Tj1lCewP5rsPosYoPg2kdqhTFwzbrFQn9Z5TePwYVkAeM4WNWWyoDr/620p47beohkjk9xjq1PX+mUdVyUY7Im9F1jViaP+c2cBsiBJZd/tLV7Ccre7Prx1kC5jarnrU/PQkwSo9UnZHB2lUZ+bwH0p3E3qwGsdfkLIrWZlhFEnmWTSkFmEOkmoOiUWfX/qbOWIAq9YFjL5FSFGu5ISM8wbSo11+OiLMzslnZkLU00AZ0iVWkcsYnYrWk9Goj8jF9wCT4eEsvR/dqlSqQS7DzyqIisVPyfkj8szCuRO4ygKWlqbsnSQjuKOoHLWL/wsUG8+lJ2D4QDhN/C6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6aa8c7e5-c13e-43e0-bec4-74827407c985@suse.com>
Date: Mon, 27 Nov 2023 15:31:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ff193e-db16-4b01-2eba-08dbef5593f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SZi3YZungd24kzxIdurtPY0mu/6moEtyNosrK10KuxLBNSBkUz6CBFelRUDDJnkcuUmEwVb6MjwUDA9vcBKjK69usgBb7/mtS4eUje/JvA1nJI0fZDngfo+uVQkzbUOz0SLwrpmrvIb5tTMrxdh9EYOIDE8A3s/MuDXXAPzC9GYH8juES3ukj5jSeK4HnWcbdtn6Gs7ZcmBSzowTIv4oJaI/IPK3+uOG9rus7tTubHzLtQZH6bjeSdvrrsbYG4Pu4BkqnyqxltMEWqGwF+dLCT93N8jzviykEHdSagC1n3MJuUAV+D0g3jIjKzWr+/wvXYZ4ZW9kvf5jRYYZZp4YlZJEGJbzWzff6ic6TRx+NpTU9I4LqB3a0nt/qUF980163tck6CKJAHZ+xC+omn/D9Jcjx6bab5s4Yepbxqekn+kzaDp3r3tOgJOJnJuHC4qFb9hZQvw8xtDJ+BudKCzMRp/m5pGvxSJEjiH24oCQ0U9LA+9l5qKRippC+I0D/TD96bwxLSLdgbSu8C9tHSuyEoOLfarVp429p2SfezMPmP0a9cgVncI/zKcpk3rj4OoluT21ZnL1a771eacZ8YPlkjeijiNVZezr9bBVBtmMCOHWKOnj/+bAUeplt/CSbYwt8SylyizGIzsDniH3fjf38HbLGikmQ/DqTk4H729kBSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(6506007)(6512007)(53546011)(4326008)(8676002)(8936002)(5660300002)(6486002)(7416002)(31696002)(86362001)(478600001)(316002)(66946007)(66556008)(6916009)(54906003)(66476007)(38100700002)(83380400001)(31686004)(41300700001)(36756003)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RklxWi96VFpwVHljMW43djRDNzNXd1lNazJNam9VV3dmZ1ArNFZXUktvbnJ4?=
 =?utf-8?B?MGZ0cGhWU3VjZUZVR3hXdUVkR0VNdkJKaE0xQVVkU2FQSXFHTmRzK3JOeHdQ?=
 =?utf-8?B?WFpBSHVwM0p5RE1rRVRkVzV4cFNKTi8wUGM1MUdKMDZ5Y05WMHNYTVlFc0pG?=
 =?utf-8?B?ZFgxa0VRWjZ6T1VNMkt2Z2Z4Qm9DOFNIVjc5b2JEK2xsS2xKLzBNUGgzcG5P?=
 =?utf-8?B?QWNXa0JsczJFUHAvdStiY0dVZ25LcXlJSlUyUldWeUdWcmtHbEpiaWpvVDd4?=
 =?utf-8?B?SWhrVlVRV2JZS1ArZGJSTWtiZEpmOUlxK1lwZVhCdGQwN29KNWdNSG1yQjQ0?=
 =?utf-8?B?eGFhWUprRjN4WDVDWGVONk85cWN6bklsWDBLSXNTN2x4MEw3c0dGdHVXYWVk?=
 =?utf-8?B?WXU4eDhNQi84bFpqVXllL1JNQXVjZnhieUVyaDZZVWh0S1I0QlBNOU1TUVRD?=
 =?utf-8?B?ZmhzblU1Wm1ZZkNCdnZqTXZXUnRxM1prM1pKV1ZDc2VOZ0JGbFQ2N3huSG9o?=
 =?utf-8?B?MldNWXBOcVVwNkQ4QThKbSt4eDlYandwNkw1QmhYMnhJYnhkK1EvSVVDUTVi?=
 =?utf-8?B?SGoyb2NvL0grc3FSa0wwSEQyTDdxSEhGZFFSZGFpWEZRem45Q0ZDQ21hdGNy?=
 =?utf-8?B?REFMblRnQWtOVWVxMFdBR05ybytxaEt0ZFN5UmZNdnlVRXpyYlZjdWZCWHVx?=
 =?utf-8?B?elBzajNPejJ3OG9XYTRCY3JDRlVDQkVjQm5rSXB5M2hvNHgxRm1nbEQ2a2Zq?=
 =?utf-8?B?M2ZiZHFqbVNNclduTEJJaFErUXhpUmYwWFZYT3NpdUVZQnhFQysyemordEFR?=
 =?utf-8?B?ZU1KU3l2by8zaHlFdGhhcUVPWTc4KytVNm1kSFk5dU1NMkV1QW9GSGhmY3dl?=
 =?utf-8?B?UGtJRTBSeHlkSVVFZU1vMUZSS2ZPWlNJYUJiMHdaU3V4R3lEQXBYVEhDVjFj?=
 =?utf-8?B?Y0FoM3dSeFo2WWdkeTFGaWdDVENIWmlwK0R0ZXFESmlCZ0xMeUYzb1NoN0NE?=
 =?utf-8?B?Z2ZaSmIwSXZVTTV2TUdSMmtYUFUzYk9pdyt5b3NZNmV0SUlJYnBGSjlIZEhD?=
 =?utf-8?B?U3p2bXl0cDVjUVh2aTltdlZoVmpYOWlCUWpIK080ZnN2M25WSk01VlV6NEZO?=
 =?utf-8?B?VitkNkRtZC9RYlN2dHo4d3UyV0JXQU9PQ3BONUlvZWdTUVkxRDhqbGFyNWRv?=
 =?utf-8?B?ellkUVFFdDFhQWpWMDBqeCtOcDRWNnR1MmF0REttdUZ5T1h4ZEpXNU5xQU9V?=
 =?utf-8?B?a0Y5dHhieWlsRVdJK1ZkczFldUQ4N1FPelJJMUJYeHpmdUE4WjIzVGVVWUdk?=
 =?utf-8?B?dnkyUUJQbmhPM0xPMkZNSi9FbUptWFpUWU4zQlR2UEt6N0RMNTRPekhyYUxh?=
 =?utf-8?B?UTBRSDFzK3RpZWJBblhGelNKWjZEekZuUUdDcTM5NEZhbGlnamZxZUFENHNY?=
 =?utf-8?B?WXFNYjZ5RUZFUTVQRGY1M2p1RDg2VGpiZHIxVXFaWnBtTXZ6OHp2M3FxWFZP?=
 =?utf-8?B?VFd2KzRwclhaS1ZZUVd2eFhERGFpYm10Zk51dzhPcXB4bUlDN0JLWk1jZGZ4?=
 =?utf-8?B?aG9LZ28raDQyR2V4bm5sQ2c3ZjVmZ0pDQ3N0SUMvTEN0SzJDUkVoWk1tNVVM?=
 =?utf-8?B?U01UM2ZzL2FIOHZPQXg0Zmo2eS9TWkdDcUp0dXNMSUdKU3hVNy81RnRRekR5?=
 =?utf-8?B?VWMvMjhzSm9hTW9icll4ZURwMzBQN0pyM0VlcWxPL3ZTZ1IwSXAySG1lNjhF?=
 =?utf-8?B?Q3ZyMXRzQUhHUWxIQkxKSnNRVXJ4Q0ladTQ5aytEbHF6ZmMxZ0w1ZHNyTk0z?=
 =?utf-8?B?TzhTNCs4ZHJ2dy80aElwS0ZIQzRubm9IZFltSEF4ZTVJUDhkay9BVldqNEpp?=
 =?utf-8?B?OURrV1dmRVpoamxBRG9pV29yVnNUdW1HMHpHc0JvcTFVODYyUWc4WDlaenFU?=
 =?utf-8?B?UlRBTXJ5MmJoN1NRMnZwT0xudGdNMm5IK3hET0pBL2Rzd1Bjb0Q3UEJhNkY2?=
 =?utf-8?B?c1BhZXlxOU1aWjl0dWFzWWxlK2ZkYWJnQ1lhL3hHY2RlVGtsVXowS1RrWVQ1?=
 =?utf-8?B?cTY2eWxmR0VMdldXOFBtRkxtL2JtN1BCWjJFbjAvNUN5RlJUMWtsOHhxRlRF?=
 =?utf-8?Q?NIjOincsLOe4cutNaaF/3yhSv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ff193e-db16-4b01-2eba-08dbef5593f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:31:43.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiJFltSXWfbr3agYSnSjQyUtbBNO3jBsY00MLGrFAviiWx3s+wLFpX8itMxO2yJXU1ctHaSQGKRHLDayJx1wyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9192

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> Arm, PPC and RISC-V use the same device.h thereby device.h
> was moved to asm-generic. Arm's device.h was taken as a base with
> the following changes:
>  - #ifdef PCI related things.
>  - #ifdef ACPI related things.
>  - Rename #ifdef guards.
>  - Add SPDX tag.
>  - #ifdef CONFIG_HAS_DEVICE_TREE related things.
>  - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> 
> Also Arm and PPC are switched to asm-generic version of device.h
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - Updated the commit message
>  - Switched Arm and PPC to asm-generic version of device.h
>  - Replaced HAS_PCI with CONFIG_HAS_PCI
>  - ifdef-ing iommu filed of dev_archdata struct with CONFIG_HAS_PASSTHROUGH
>  - ifdef-ing iommu_fwspec of device struct with CONFIG_HAS_PASSTHROUGH
>  - ifdef-ing DT related things with CONFIG_HAS_DEVICE_TREE
>  - Updated the commit message ( remove a note with question about
>    if device.h should be in asm-generic or not )
>  - Replaced DEVICE_IC with DEVICE_INTERRUPT_CONTROLLER
>  - Rationalized usage of CONFIG_HAS_* in device.h
>  - Fixed indents for ACPI_DEVICE_START and ACPI_DEVICE_END
> ---
> Changes in V3:
>  - ifdef device tree related things.
>  - update the commit message
> ---
> Changes in V2:
> 	- take ( as common ) device.h from Arm as PPC and RISC-V use it as a base.
> 	- #ifdef PCI related things.
> 	- #ifdef ACPI related things.
> 	- rename DEVICE_GIC to DEVIC_IC.
> 	- rename #ifdef guards.
> 	- switch Arm and PPC to generic device.h
> 	- add SPDX tag
> 	- update the commit message
> 
> ---
>  xen/arch/arm/device.c                         |  15 ++-
>  xen/arch/arm/domain_build.c                   |   2 +-
>  xen/arch/arm/gic-v2.c                         |   4 +-
>  xen/arch/arm/gic-v3.c                         |   6 +-
>  xen/arch/arm/gic.c                            |   4 +-
>  xen/arch/arm/include/asm/Makefile             |   1 +
>  xen/arch/ppc/include/asm/Makefile             |   1 +
>  xen/arch/ppc/include/asm/device.h             |  53 --------
>  xen/arch/ppc/include/asm/irq.h                |   4 +
>  .../asm => include/asm-generic}/device.h      | 125 +++++++++++-------
>  xen/include/headers++.chk.new                 |   0
>  11 files changed, 106 insertions(+), 109 deletions(-)
>  delete mode 100644 xen/arch/ppc/include/asm/device.h
>  rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (79%)
>  create mode 100644 xen/include/headers++.chk.new

Stray new file, presumably because of a missing entry in .gitignore?

Overall I think there are too many changes done all in one go here.
But it's mostly Arm which is affected, so I'll leave judging about that
to the Arm maintainers.

> --- a/xen/arch/ppc/include/asm/irq.h
> +++ b/xen/arch/ppc/include/asm/irq.h
> @@ -3,7 +3,9 @@
>  #define __ASM_PPC_IRQ_H__
>  
>  #include <xen/lib.h>
> +#ifdef CONFIG_HAS_DEVICE_TREE
>  #include <xen/device_tree.h>
> +#endif
>  #include <public/device_tree_defs.h>

Why would this #ifdef not cover the public header as well? (Otherwise I'd
be inclined to ask that the conditional be moved inside that header.)

Jan

