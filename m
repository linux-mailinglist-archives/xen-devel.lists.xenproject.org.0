Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C617FB366
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 08:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642766.1002465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7syK-0002Io-U8; Tue, 28 Nov 2023 07:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642766.1002465; Tue, 28 Nov 2023 07:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7syK-0002Gi-P2; Tue, 28 Nov 2023 07:57:32 +0000
Received: by outflank-mailman (input) for mailman id 642766;
 Tue, 28 Nov 2023 07:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7syJ-0002Gc-W3
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 07:57:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c675c1c8-8dc3-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 08:57:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 07:57:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 07:57:25 +0000
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
X-Inumbo-ID: c675c1c8-8dc3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJr9F0ad5JAxc8JA4QuC3Cp9MnoTMByf61kxwQeIpC2OcMVvXZFV2oom3mj/skIz0fp6ymmGwHCrMrXVa05o0mQeOp5Ddox8+ksjvtdob1u1Y8USMXFWycr9C5u4ak72Sn6yaddE9EeApMH+7UpDraQ3ymSx6fywQIIsFbfiu7gmrgMDSzP4/41T1i6Ek+qtaNZlxzPalTVvNKnn7ECjSWcXmubEIWCYEpaLcxWmxUIwFT9eLAc+MUHBKKayXTs6Uzmoq1gdBwblYaYwN6aPHoDrbavt2eUtrMjJY9fGAbhjAxHN9KtCZCnRX/8BykpxpjnaKFuEizDXkN6qeLm6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4PTtvCzg0Ja0EeDzc+UOOLp9ajc2AQY7vkCFW2huKg=;
 b=Znn3Qa+PmbdHws1KHsf45CTX4RhWISEmiWCKGv+oMya5lzS2m3k6i2YXHuzD/My5OtFaPjIOhpmhoCurET3yXxj4jyXDSLfj6/m//zmyW6qnWf22ypuN3aSaTcF73rRzwKC4aRgfZKKR2rWFwMwQobouCl2jU9Md4YL2A1uwEq0abePLsYAExXgcgOs/7w13DgVZg2/ZpQmN2/RMN1QPsJRiMjGpRZwj5rw+JHTd5SqdUJG/01gd7UvAbZDvaOvH8DMVVc/JgGXIgmijVBoClSuvfVnsDzCOcP5UPZetChg2GhieFCUbBttTCLy7HPwi1cTVm3L2efl/LbxB48boJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4PTtvCzg0Ja0EeDzc+UOOLp9ajc2AQY7vkCFW2huKg=;
 b=220e0IaFp1GS/9+lKmLzQnnDQovvXmWPmvGjDQcYfDJm/McaF6P1XLDfMJveVJHEmdZrhqImAJxs3TwzALheCem5iLAZGpog4LH2HldLkYmQwuFb0f1durEjj6hSznif5hDxqAgjb4Dc9NJmlUVoYul1sAuMjBcMs8jY02q5KqJfeguNherkYrxb/zElmMd+va5QaJX/k8gN1ClT7pvPGsP/j/ERX9xehE/YJZ3BSPZEct1ECW/I26TNsVd34YVfEIcsry5jxw3eqc11BRS4N7vCzg1gg3XL1f90KPmvn1gjmvqIboc1Nyv+6ycVtritkSycYC0nW6NvP3oGlIAneA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <405c2d66-a6f4-4bbb-ada5-2ac49c8c9744@suse.com>
Date: Tue, 28 Nov 2023 08:57:23 +0100
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
In-Reply-To: <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf16bb8-7e09-4281-9e24-08dbefe7a8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SScLhe+Soqt63+XcgaWcB47+UGrIXD2naquiIJYUw4hGZdPyY6qbIEa9W98lCFUkvTSMzcMceEuI9dIpCdc/PO2uV6XNR5SbITocR6zKuqn8Ti4/ae8+0mEMiTYe/XSOC+2zezxmwaIBwQFG5bZ0N9MoW24BaHJn6ruccGdJhcxWwqnN71GPyMYvGUuRmt+E1cFo8Nffl8o3/XuMI5qN1cGSqVm7lzH77anj1lWatsaa/YT/Ao6RfKgFgtaNSDUozdGOQwHvbDFz9UxRCW6W4qjHdf65fNde21jnr/zlh4X6eVehsM1ohMUmCOjv1zrJvi9mQtLo8MuwEtTu25VIMKyN2/BFr7aigvRVkRL1CtvrljFcE1sSDsf4hxco9g9cdxJY6EcPaDuSomC+Bgl+zQaymNnLxg9fr9P6PXK2S3+zqPvm1L6laA0TYcyAfpoHoWWvr2732H0XeOaQoJJJvUMh1G940nacJjWl0pQfjq/g09a9ryRFimqNrMzYwFQj0bGXHlW7nb5CZAMNBfSy2ixZwKjP8CGDs+2e82IAT/qL7XEnvKIWIgVBWR6ouddE804rlJG0YoDdYObpvcqlzp70uNCIjNugk+OG0d1aYS7zoMZkU3+3iRQczn1ngRd9ZG6sqEV0Ti64D/Oylr+Tsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(26005)(6486002)(2616005)(6506007)(478600001)(53546011)(6512007)(38100700002)(86362001)(31696002)(36756003)(41300700001)(7416002)(4001150100001)(2906002)(66946007)(83380400001)(6916009)(8936002)(54906003)(316002)(4326008)(5660300002)(66476007)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1ZMNnQxdkJWYjFrUDI4UW1QeldYc2R2TE1PcFh0bElHeWdIejZSdzdQVkh4?=
 =?utf-8?B?KzY1bEdWa3BxTTR2VVQ5WFozcWNzcjFXZE43SnhPcjJYWktFOUZ1Skx3RmYy?=
 =?utf-8?B?cUhaSW5QV3ROMXUxcFl6UkRqbHdHYjltMzkxQ3huMFJFdTVmc3phS2p1djI5?=
 =?utf-8?B?S1dIM2V0V3lSNmZ5SzJjK3hhd1Q2YnJrQitNSndVSUpZMnhVZ3YveFdhU2V2?=
 =?utf-8?B?SncrdjdvQXdhTmdFb05WOHRLSlZWdTZNK1c0NEltVE5BVmFQY2daWnRJbko5?=
 =?utf-8?B?Mm5aTUV1TDlQc2IxREI4QnM5UUZUUEdnTWQ3bzJsRC9wejNNY3B6cXNWTzRO?=
 =?utf-8?B?RHdONkgzTlYzVnBieElXc3oweWZQdk1sTjhLV01JamhWM21wRDMvbjE4RkJo?=
 =?utf-8?B?M25ndXFWQkl5ckZTYWgzOG83a211QW5XZUZha1g5WGVzQ1RoSUxlOFU0Y1VI?=
 =?utf-8?B?SVU3dlRVSytOMGdBWUJHcG9TM3hjekY5ZXphZHJTUDhlUnpZVVY2cThhMEoy?=
 =?utf-8?B?eWF2Yi9qU2d3QmJXWXNQM3RXMXJYaUVJZTVEb1pMc0dleW5YUWhvUm5oWUVQ?=
 =?utf-8?B?YzNYZnc2c2c3elVyYmJYb1RSWkpDeFhxa1V5VmJNaUQzY2lKWjBnUGJJVFJL?=
 =?utf-8?B?aEh3QjFTQlRrTWwvaEpDVnRFK0ZSUGVjK0hiWVlwM2V5amRSRDk3N1JaUUxu?=
 =?utf-8?B?RnpJVHl1R2ttcEYzV0lmREdZSXYrRENzTi9RZ1IrNVAycmQ4MGZjYzFkZE9T?=
 =?utf-8?B?WitqVjFDNTZaU0tEb0hoVWVoUEhjZFo2NWlnTCt2MnQrNWZFMllKMytyWG4r?=
 =?utf-8?B?MjlKaWdwWnhiUTViYnB4dUtDb2ZjSjVudTdzcDRVYm55OGVuVlJ4NGZ5b3pS?=
 =?utf-8?B?Y1hVWm9vNG5FY0MrRDBKK25aOFpWUnVRc0tCT3Rodzd2VXdsUlJDOWRTR2ZY?=
 =?utf-8?B?a2RiNmkvN0xJWUczOU42MmlUVkRQNkF1SEpxK3dlMUQ3a2IwckE0cEhYaHJ2?=
 =?utf-8?B?WnFPQmxFbXJ0c0x0Y1BlMGpWOVlsb3E4M0hMdi9DbGRKY3RFR3ZGNllHcEhL?=
 =?utf-8?B?WnhyMzFTVHJzbW9TenRnMzZ3RFZmTnFKbUs1dXRlMVR0ZVFUNTBZT3FVME4r?=
 =?utf-8?B?OFlYSU9IeG5tRnZNUUtza3J3OHp0bGlyRksyZk9IMkRNM3NCcDdtTXhYRFo1?=
 =?utf-8?B?bDFxcGF5RkVWZ2RIY05vcm5ScEdYTDJjekd3UlowV1NYaGt3OXhHSXZ4VmJo?=
 =?utf-8?B?VlBQd093NU1TYjY1d0FiVlQ4REZKY1VrcUFEQ0tFZTNyUkJHY3FaM1hTbkQ0?=
 =?utf-8?B?Zlh6N1JOdGdLMC8yYUZtZlB0YVd3YTVHWXJlMExCY1g0R2NqY0tESjNPL2J5?=
 =?utf-8?B?bDVvTmk1Z3RoK0dPNFVlS0tia21HcE5ZQmhQOHY5Zi9lRzkrNUs1ZEIrZThW?=
 =?utf-8?B?aFR5Y1ZabTRnMEdmWVhLc1FjOVQxNDFDSDZoaUQwMDVFdEd0V2pIeXJIcHh2?=
 =?utf-8?B?Y3dVT3BuMWRqN2g3YWo0RnZ0ZWs3L09kZFZDY1NsSlBYWXF3cEN2UTF5V3dv?=
 =?utf-8?B?dE9TOEY1VkQvbXp3YzZraFpBV2g0d2NEbGtTdXM5ejJMZUdnMmRITTBGNkxs?=
 =?utf-8?B?NWoxQzZDc2xmRWtOTTlVZ3JIakpXeDZZaTZwV3BQRmFzKzRzcXowWWxaQ1V4?=
 =?utf-8?B?bnZUYkxXRlpmcjdaRmxzLy9LSlloeUFGYUxoeGZCNGJGcU9tTXNmcldkSm95?=
 =?utf-8?B?UUZ0R1h3RjBIbVg2Rmp3MXUyQ2JkRVhxMFN2Zk0xZlZKSlVNaG1RU09ONEdE?=
 =?utf-8?B?M0hPa2hNMHcrRzN1akFadmE3WXB5MzVEY2lWU1JQOFV6ZFBNMlRubmIrYklO?=
 =?utf-8?B?MVpwVzdueVVDQjJKU3M3NVpyNUx1cG9CZzUzaFRlQ3ptTm5pRGxOR1MvNjhp?=
 =?utf-8?B?TTVaNjlmbEVkTFRMaldGVzNYMDNYY3N6czlpbHF6L09NM2ZHS3dWdWp0Z0h0?=
 =?utf-8?B?RkxpcTB3UjJhRU5CMEJVb21qaUxuTVNaWDBZU3dMcmhnQURoV3RsNzZYdy9B?=
 =?utf-8?B?QnBUOEYwMWtjeW0wb09kUEdyZ0RxcmN2KzNNSVhzQUJyZFdIckl5MHdMWEZh?=
 =?utf-8?Q?RV1jszep+hhELgHjEF9P4MHSj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf16bb8-7e09-4281-9e24-08dbefe7a8bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 07:57:25.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKT1H5arekfpL6pwNLCrI1JGfxxQ35rpJw34aklF+AKi1cR3VeX3YY/UG5+hyFnNDtzCbl7OMLF6ziDrKnHaQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416

On 27.11.2023 20:38, Oleksii wrote:
> On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
>> On 27.11.2023 15:13, Oleksii Kurochko wrote:
>>> --- a/xen/arch/ppc/include/asm/grant_table.h
>>> +++ /dev/null
>>> @@ -1,5 +0,0 @@
>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>> -#ifndef __ASM_PPC_GRANT_TABLE_H__
>>> -#define __ASM_PPC_GRANT_TABLE_H__
>>> -
>>> -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
>>
>> Removing this header would be correct only if GRANT_TABLE had a
>> "depends on
>> !PPC", I'm afraid. Recall that the earlier randconfig adjustment in
>> CI was
>> actually requested to be undone, at which point what an arch's
>> defconfig
>> says isn't necessarily what a randconfig should use.
> We can do depends on !PPC && !RISCV but shouldn't it be enough only to
> turn CONFIG_GRANT_TABLE off in defconfig and set CONFIG_GRANT_TABLE=n
> in EXTRA_XEN_CONFIG?

That _might_ be sufficient for CI, but we shouldn't take CI as the only
thing in the world. Personally I consider any kind of overriding for,
in particular, randconfig at bets bogus. Whatever may not be selected
(or must be selected) should be arranged for by Kconfig files themselves.
That said, there may be _rare_ exceptions. But what PPC's and RISC-V's
defconfig-s have right now is more than "rare" imo.

> Some time ago I also tried to redefine "Config GRANT_TABLE" in arch-
> specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it works for me.
> Could it be solution instead of "depends on..." ?

Why would we want to re-define an setting? There wants to be one single
place where a common option is defined. Or maybe I don't understand
what you're suggesting ...

> One more question I have do we really need this randconfig? On RISC-V
> side, I launched several time this patch series ( from v1 to v4 + runs
> during test of patch series ) and I haven't faced case
> when CONFIG_GRANT_TABLE=n. ( but I turned the config off in defconfig +
> EXTRA_XEN_CONFIG ).

That override is why in CI you wouldn't see an issue. But as said - CI
isn't everything.

Jan

