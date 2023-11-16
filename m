Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A697B7EDBE8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633992.989143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Wit-0000Km-49; Thu, 16 Nov 2023 07:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633992.989143; Thu, 16 Nov 2023 07:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Wit-0000IJ-18; Thu, 16 Nov 2023 07:23:35 +0000
Received: by outflank-mailman (input) for mailman id 633992;
 Thu, 16 Nov 2023 07:23:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3Wir-0000ID-9R
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:23:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b6ece14-8451-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 08:23:31 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19; Thu, 16 Nov
 2023 07:23:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 07:23:28 +0000
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
X-Inumbo-ID: 0b6ece14-8451-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0uyVjz24LQ4+Xqpk9iN+7hDlRdd4Ee9vY7CEvAqOLfZsBPbnFpW4W+4Brls8lxyDTRQ88azI36lDV9Vl1KPk4FppAHJ45dctWYHMoHk9G9jbmIHA+ZMPxkx0YVKAyEY4feWQ6krsFyopHvtkbqanyUX7klvWCJ4NfgvRx9ZqfONfw9QpwU+PaHoNYnx6bGkfGm3qa0TaVEU/WNuDQd+CCkmlnE7QJJK+hDJXC92h+N1KU+KzPhULO3oimieLbsYqVf6KkUOV3zCHpeJZo8UUrx4RKqtjDk87hhfoFAxnQx8S5ocNuJ4gNfYcKmms0CqQCLaA5ntc65dCtH0UqZDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+9M4wZR+P5dpSW9oQe3cecX/YrhY2qVP1mWPEWaXfI=;
 b=THLu4ZmxfQNKU9G5ul+3QY7O08Z5ySBH1VDHH0oNWTn2/XWOvQcX0yCpRqEmHpmG6ClFXd1KHEjowQZnDX82CtE+BinlxZAzQpgCyNAhmUNx4mQvOj4e2jKyYOATVfVBUwcG2KiUm1DUa5VUSSD7p2pkehovimihGEr7a4JayyTKcm7eU889v5nQP1+8Yzd51ICBMX/rbWi7uF/Mwo7Dl6Td2Qu4eVI6GfuXDHPXT+MBbdqyR2PHhdMn3nu+brmwN9riabbqdTUn5En+8TwGtukXa1XHWKMjCW4uAL0OD3MpFeLS0EBpyZ7YAU7GgJgS97Er43Bg3Hvl82Ejv7j4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+9M4wZR+P5dpSW9oQe3cecX/YrhY2qVP1mWPEWaXfI=;
 b=wb8o0sBDKZO5qcWHt49A/XbPSubLA6FcLtcHSDvIhJ2uKLM7lHHwnfi3/1D95ZB0P2yhuBW3J4bHsU2tRdFFF634rgVBdW9LL9kJeSEM7YfMHsJDnjJB4cUns7SiNQ4S/nK2UBCZvdabk3F0bb3k262QR7JRqQYSyDFrYofFpldvJoQqjc5IzHsHvTDUS+3pu5fJOrWqz6bWjur95xzINcyl2xiXVWgFEKgMAt+57NVkPoSnviadApMSodaSYU9wfMM96RiEKS0tk8W2GjAbu0IQgT5I6vDtM94mSBvl5zrxO2DzrOJb1ENFhZHmZSGXe3frTyqF0ldp8reuNeVH3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3bd3696-d9dc-49da-af6b-dcbac405cf07@suse.com>
Date: Thu, 16 Nov 2023 08:23:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] xen/asm-generic: introduce stub header
 <asm/random.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <2464c6b984d187207fe76453bd05502d288af4f9.1699633310.git.oleksii.kurochko@gmail.com>
 <8f5f9a74-cf90-4a65-8195-ededf00da9f4@suse.com>
 <e3a2f0699c8476e98c2c1dba0ba92e25e3f14915.camel@gmail.com>
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
In-Reply-To: <e3a2f0699c8476e98c2c1dba0ba92e25e3f14915.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6bdd1f-cdce-4576-140c-08dbe674eddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O8AVI19bdYt0jyIVQCa+Oekd3x3Kjk5pHkOJtLcNTyyyDEzbZOHOxzSeVV6yQbmRUHFmLwLMNnU2T9qEohfJfyxAxrCufEs4iYCCWDDX057iwsSNL7qIkf23i7dCehhl9zlq2BuNm4gw9Jh8XAvCDWAt8iw7VsPUHPtiGdk5he35dneE/j4CHck6pSKaTw5vCoK8++UsyIt9vJBoRaLSBwTjrce2gwTjlxNYljKREtEZ+EcejKG2epGjtua8QVfZ/mFnXEqPFK+8fgU9x3bDmAq7LZHLABDrgOJpjiXCkdJPrrz5Ob6kOXbiRIq290neXI8HXMH8o6+qhE5fVUpWbAE7RAc39nbAO++jaZHVoFc6d5S5foAvAN2w3xYVPqCSPCtnHBO7GzKxa/7bcFDKuENsTttRTdeeNSASGeiB5m2Mzmmz0tuZ1O8rOJV1bVvndS836L2LDePtNR7Nw872vcPp+9+AFBEYlShNkxag9e4tn+k1KAgGEbODteE3YgmrINWJYqxrmHSUjOI8CHBaVg1j+UwxT3JorXwLUeVWBKZwKZup6qjrAv918a6YS79Dm1rBHUUmqssAHlxAqWxy2pRGGXWJ1sKp3vbdOY5bpY8W/32KcPLNeAMv9BfoLMj7OVlMI2UM4u68kRIhmkJCHi5gWActEwJnjuIqUKeN4+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(478600001)(6486002)(6506007)(6512007)(53546011)(4001150100001)(86362001)(5660300002)(31696002)(66476007)(66946007)(54906003)(66556008)(4326008)(8676002)(6916009)(316002)(8936002)(41300700001)(2616005)(31686004)(38100700002)(36756003)(83380400001)(26005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FNbjQwWDgwTWtQVTNKb0dTaHZWU1ZDQURpejlnZjFLRGdBenJoOEY3LzRP?=
 =?utf-8?B?R0h1V01LZnplM2hUbjhtVWVLVjY1TEZJZXlQYm9IY0NIeEJMSGFPWkZIeUVz?=
 =?utf-8?B?MHNOZVdTdHhzVUE1bjdqeWdnbS9Jd2UwSGtzdHVxckZwWGd4dk5weUhmYUpw?=
 =?utf-8?B?UjZQbllyTWNLYXEzeWErZkprLzNNMW5MajRreklKU0JkMlM4bVFlaTJQS3No?=
 =?utf-8?B?OHVwNDNLWkJ6UXYvY09oZWg2UmJQLzlBcjlqWGhvVTd3VzkvK2MvSzdMTnE0?=
 =?utf-8?B?ZFJSazhwZXIxREZIaWttMy84REZ0SGpIUEs3REQ5dEx1RkhIalVrRldpRWwr?=
 =?utf-8?B?UUV2WlNPQi82cnY2Q1lpMkJRREVNOUhDUnpKbFFVakVQMFdIclJZSGVuZWNU?=
 =?utf-8?B?dk83aktGdERKc3RGOVIweGI4VFNKOU5TS2xqaHJ4cXFlWjdQeDd5N2M2TG4r?=
 =?utf-8?B?dWhRcnU1enN3UDhXU2hGNkdkSU10ZnZZM3ByOTREWEFPajJBYnp1WnFGWHJO?=
 =?utf-8?B?ZjJwbWovNmZKaFFkY0hrSXV0NFIzbXAxZmlXNjJzVGJ5SDl4clpUanNmTlpK?=
 =?utf-8?B?Nm4xQXIyUEo1eEw3dVhMZ0ZDN2VpWVR1eVpiY3FBOGVEM09YdHZ1VkJtRm11?=
 =?utf-8?B?dEhwaWFhdVArNXNXMjJVVVpydStuSHM0UHcwMllzSGJKdC9KSUs3UERHRE1r?=
 =?utf-8?B?cGwwT0xXTWtzNVNsQkxObXNuSWpLdU0yR0I3Q2dQU2wvZVBTN3dSQmRhK1l0?=
 =?utf-8?B?SXRwWGZDT3Bwa2l0MVJIRVowdyt0L3djdzdWZ2pnZGl3ZU1YVy9sbVAraWhU?=
 =?utf-8?B?QXdmNjNhVzgwMVZ3dEw1cVNTVzBvVEp4WTBodGRCa0xLT0txWm5YRXV3NTNh?=
 =?utf-8?B?ZlF5NFJEbCtPZFZmanY4WXAzd1phOTZDM3RwN1ZSTjNxUmQzZzNyUU5JblBI?=
 =?utf-8?B?ckJINUdZVzVUYzNMM1QwcStDRy91N1hIaUpiSWd2Rmk3bVFQUEhmTHpUL2I4?=
 =?utf-8?B?M1JPSVllTGMwVDRDYW9UK3pGV2FUdWRrRExKSzlZbE1wMjZ6MWU0eHR1R1ZO?=
 =?utf-8?B?RzVWR1lRbDNSTzZQVnhHYVRSWU5HTjBGWVlCZGU5UE9ta3MzcndvVUZjTEFm?=
 =?utf-8?B?WEVER1ZNYlpXc3NLOWNzejNZZnRHelAzRHEydzVjZVVFNjBSbEJvWXpUZUNK?=
 =?utf-8?B?cWk1d1k4eUNxTDhveGFaamo1VDVSUkx3T2ZCRnpVTE1DRmw3UDdKaG14V2dN?=
 =?utf-8?B?QUVQc0gvM3VTWmdocm5RVTVKbXJyNFUxdVdMQUU2TmZEUG9nc2J3RzEzMHpy?=
 =?utf-8?B?R2t3TTFmVS8vRFJTWnRoWjNSLzhtalgwRmFERDBNYXVGQitScXloMTAzWW1K?=
 =?utf-8?B?MkFTdVFzMlYvYzArN0tYWndTWm1adGp2allPSUoyYXp1aVluRmYzckd3cm4r?=
 =?utf-8?B?QU9qM2EyaXpuN3lXYlMrSXZkR1hxTFZ6Uk1CTE1KUTVnVUtlNkJVaDVmQ2dC?=
 =?utf-8?B?VmROSFBFMzFMNmNHcVA0dTRROThqNkJqOTZSZWxHM3FUYStIL21WbFN5Yk4x?=
 =?utf-8?B?WkxKY0FuUGNyZ05lUURIMWhrZ0hHckkwaWovckt2OGRMSUljU2FFQjVkWnR5?=
 =?utf-8?B?VUtOdDdmZHcxclFyQ0o2VkJkMFc5TGRMdTYrRmRYYzgyVGpseDdRUGRWc1Q5?=
 =?utf-8?B?dnVObDA4YUpyd1F6dWYzeGV2cHRUb1Y4cXZKU1JpQzRNL01kbW1FYTBnTW43?=
 =?utf-8?B?enA3Q29pZUkwVlNFY2dkak55UmdhVjdKQ3dSdG4xNkF6NmRoQ2tyV0ZENWtx?=
 =?utf-8?B?TWpWL2dRUi9DUjRCRlM0VExUcnhzbHN1WkIzSGFDeTJaRFhXTk5ZSHlVZFJN?=
 =?utf-8?B?Mk5nb0ZkSUJaUnJJMFRyR1RGc1MzUi9rK1V0NFNpUGtrRGdIMk5RUFJkMUdr?=
 =?utf-8?B?WFMzR2N3alNaUi8xU255QitHd3lXMkpURDY5OEtCY3hZVUZUWk4vcVc2Q1hS?=
 =?utf-8?B?Y2JmaUdkQXpQamF2QW9pWjFSUUpkSDhwMW9Xc1JTK2FMUG1EWGlieGd3Vi80?=
 =?utf-8?B?bHg0Tzd2amZwbVVOWmZ2SW0rOUlRTldNTkVYaTVVMUgyWXFxY1F0UEh1ZTIr?=
 =?utf-8?Q?La5iHzfE5Rg8s90mozqCdkz5f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6bdd1f-cdce-4576-140c-08dbe674eddc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:23:28.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDVO3McVvnwUpgRJA67uIuVi3LR4Emwlc7y7iP4Jge4jC6q30O4D/cw63tcsD6AB3nv2YaJ/FrnV5tRAK4Xy8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521

On 15.11.2023 13:39, Oleksii wrote:
> On Wed, 2023-11-15 at 10:56 +0100, Jan Beulich wrote:
>> On 10.11.2023 17:30, Oleksii Kurochko wrote:
>>> <asm/random.h> is common for Arm, PPC and RISC-V thereby it
>>> is moved to asm-generic.
>>
>> When you say "moved", ...
>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V2:
>>>  - update the commit messages
>>> ---
>>>  xen/include/asm-generic/random.h | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>  create mode 100644 xen/include/asm-generic/random.h
>>
>> ... you also want to actually move things.
> Sure, I'll delete Arm and PPC's random.h in the next patch series
> version.
> 
>>
>> Since the above comment matches ones on earlier patches, yet otoh in
>> your
>> submissions of two individual patches you mentioned you sent them
>> separately because this series wasn't fully reviewed yet, would you
>> mind
>> clarifying whether further going through this version of the series
>> is
>> actually going to be a good use of time?
> I think it still makes sense to review this series.
> 
> I probably have to stop sending patches from this series separately. I
> thought merging almost-ready patches would be a little faster if they
> moved outside the patch series.
> 
> If it is possible to merge approved patches separately without getting
> approved for the whole patch series,

We do this quite frequently, as long as it's clear that later patches
in a series (which are approved and hence can go in) don't depend on
earlier ones. Ones at the beginning of a series can go individually
anyway; the only time that I can think of right away where this would
not be desirable is if they introduced then-dead code.

Jan

> then what I did before doesn't
> make sense, and I am sorry for this inconvenience.
> 
> I can return the patches I sent separately to this patch series.
> 
> ~ Oleksii
> 


