Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD5800B5D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 14:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645524.1007719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r937o-0008Te-8L; Fri, 01 Dec 2023 13:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645524.1007719; Fri, 01 Dec 2023 13:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r937o-0008Rq-5B; Fri, 01 Dec 2023 13:00:08 +0000
Received: by outflank-mailman (input) for mailman id 645524;
 Fri, 01 Dec 2023 13:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r937m-0008ER-Mv
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 13:00:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a94436a-9049-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 14:00:03 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.15; Fri, 1 Dec
 2023 13:00:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 12:59:59 +0000
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
X-Inumbo-ID: 8a94436a-9049-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyKlqa7/x33u3vvON54ts0F+DQi+rH3+SkslL0n3MJDHwZRb5IZfPRBjiq6pY3oUbth84VbSMFrY2Oiw1iwPjijaqDrbhJIKj51Ah5C8OKDNaSYaiJU/2rkKNf7Jq0zB0rF2SNgS7q8k9+1Um9LxdwA/s4Kfiviuj6GedJ3/wY3wiUEJjj5pcsegOFZnHL6slP7b/EeSIxMouFQJIHmh0f17sW1XZug9JK4/X3PNeBbOmKHLKdhVm+C3iY36M85Wgx2ouS7b7tYEw6sQ8WrP3249Y5tzATy12F6R0NHwvVK+KlNHhK9dLN1awt9eTk+P467tKWllC/W38Cg/f+HAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrn6E0UtMKUsPSSAmahxhWgTogq/IBlkzFwsmU2oYeA=;
 b=E7L1HN236fAL4xQnMByZTfaxtTC8rVEoyrEEYtvt+4gXWbByA2yXmnEfX+F1tgG55VW5MUc/XR4hZDOmU4Dg1nXUZYCbaC1h9Gotg4rgDqi5g+EP1tD5HW54Q2wVWM2l6jhVcZ1W+2Emq423AxMTi+t9zG6NS+IfZqJy/6m7XK7bCqyyg9aPwzF462bBrvpKOyUBpWORIauFlblGdH1pKm2fhjzuM/dZBZAiGKhPCgy5aFsQc14eo/LQcv7GrDJ9FgIv12KphzQRwCu4vMri1qJeeDXu5vyAz74OXvhnSuAcByDEpWsmwhP4mGPSi6LV3EdUY27Tgj4vx1Nzj3kDIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrn6E0UtMKUsPSSAmahxhWgTogq/IBlkzFwsmU2oYeA=;
 b=4/UMLd/zEq3mNxeh2P7rhYhHTcSDj5xqSXoqIpEJ/QXGTNuK6ezUhzQu3bmfiFgZdo2ZoH310/JPVsmhzwNZhN5awqy2Ts9W3xGmjbvVKeL/9kVU1i3TsU2ehWACpqUtEQGm+021r0gE0Vu5+EyUTuT1f0NfyeQISHSaEb8QSpEjcQFyMwVjD+XaTqgDGgYUXIvhwVjSwMPbzgfBIf6JlXZ4cEXX+KfRnMHJibU/qURxtUKawmQMHnik/B5EOBHgqWK3S50J5SMJuSRVzdgyXWTMYpeUY++AOWy3wuH7rMCywOqvHqtz44jYmWcn9X+TV6ddqzgju/QW4/51Ko2U1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ceb54df-8121-442d-b9b7-f505e26a5abb@suse.com>
Date: Fri, 1 Dec 2023 13:59:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <a65aafed-68c0-41dd-bf4d-3eeff87dd5d3@suse.com> <ZWjIX0Jo5gW5SEDr@macbook>
 <d0a4f187-4e84-4e0d-b478-6d8437a0b644@suse.com> <ZWmeV-y5RpGAG5cS@macbook>
 <0d9bc0cd-3719-4961-ae7d-3e27508000a2@suse.com> <ZWmzo68abRmRtfwN@macbook>
 <15fb0b37-da9d-410c-ae02-872dd45cd327@suse.com> <ZWnD-a3KcWS83wXd@macbook>
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
In-Reply-To: <ZWnD-a3KcWS83wXd@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a60b68-31e6-420a-20cf-08dbf26d6cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qPmmQjXZ7yDHxBQsm1cPPYZVPt43xO8jsVlcXLpoUJG93rvNhS5s9yd0CY+uiiWh7xD+3qZRcaMeNtSU4fM3+PW0dVGR8wJLcEsj4dQ7iiKXfURz01fhIh3uAb5FeQ+ZHLobjoFasMWncvHEh2ZLISh6OGQiZgf+DM8vHYliCEK//uLe8EFceMZAUUvYB2al1fzb5sb9acekafZi6i64MZekgAZiFSac8p0BmLI28VFyutp7IB2NjcTCg1WSFNeGRQZMVd0OeoONknQOL8g+zCZTeSWgL70YVSGAJb8lvMZeyeumpiLdjmWhNMNG7CYdXKnjnqzJhuT6KkZGBVq02OR/9aahU3hNWxNwRNP+FqOTpbeRahHCzzTtUmvy4rZdRQkbt1gbObmDbAkGVQlpK7/Qv8GI2Ua1VsBpEOQBcVZi/lIhQkojX/G04RAzFhRQDR7RideedF/543/Og7VZk01heJTjJzRthfR7C+4MlxOBroBXiZnOwc0IFuOkvvrJQkdvQfQSyTXkDv38KBAzyPvyeuMckiilP2I+AgEKxwfrA54XAWcsymK5Pve1plcuuEguZ8n3Sazj9ziqZuXrH2klNLEfW842hKZfkyDJcLSw4uUZMMTq9dRwn9+mutTXGF/gFpovnU8rrU5qxXeFXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(26005)(2616005)(508600001)(36756003)(6506007)(6512007)(53546011)(5660300002)(66946007)(2906002)(41300700001)(6486002)(54906003)(8936002)(8676002)(4326008)(66556008)(66476007)(6916009)(316002)(31696002)(38100700002)(86362001)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlZpeEdjbFF3cHdOM01qQTdQanNkVEVOOGFzV3NxOEhvRFpwc1Z6VkdJN0Q4?=
 =?utf-8?B?Mzl5NHdZNzUxWi9ueXg4UUhZcHVZWSs2ZmM3YXBIeVhWQ1I4VUlBdUNORjJv?=
 =?utf-8?B?UDl0WGRISm96VkRoNFQ3ZVNCZGJxejlrNzVXRzVCc0R3Y3ppUC9zQk5uV0JS?=
 =?utf-8?B?WGFZMXpidmhFcndsNG5YMjBvNk40dDg2RzViZ2tqUTNIdFM1Y0toejViRUxQ?=
 =?utf-8?B?Y3N1OWlXM0xvQUVtTlhOUWF6ckw1cHBaZFRlQ0hpUURQU2NweHlxTW5mTytW?=
 =?utf-8?B?QmN6NUJwRHdzUG9oenMxcGNtRi9kUnhSd2FyRi9aWm9IVFp3ektZc1Z0SUZt?=
 =?utf-8?B?MHljbUIrTnlzVVd6cDFIOFF5ZkRYMWY0eUdTdE5JbFIxTVJvdGlCd2JDT2FF?=
 =?utf-8?B?NFo3aHBOTzdjblNVMjZUOFVoejRPb2ZiMFJsMi96bXQ2T0pVTk5nN25UL1g1?=
 =?utf-8?B?YlQrYzVwWUdWMFZwaWRuaVdXWE1XK05mZlFMVDhxVlNMRnJ3cEtkNmt3N1BX?=
 =?utf-8?B?b2J5aWhSazZOWGdsdWQyNDFkSFdzcHJ6RVAvbTBKeXRwbHdnK3IwZW9Ld0Zh?=
 =?utf-8?B?QW55emJyRDU1SzlUZ2FVNWVGL0pFUjVIMHNnMmI5dzQzQk5MZi9oamFVd3pr?=
 =?utf-8?B?MjRMa3pVYk1YWnE1ekZoRWphMExuU3pFUnFjaTR3b2ZEN0tRRi82NUdJNjRo?=
 =?utf-8?B?Yk1DVDhLTHJOMW9GcHEvTG9yNXZrZzUzajkwaXVvL2lWd05UUWdRVW1sTFRk?=
 =?utf-8?B?ODR5M0hmeGx6UWlXc0lJcDVpK0Nid0tZclF3c2Q1MUN4UGhIZHRBeFhtKzEz?=
 =?utf-8?B?d3RTczFnUW1TZE5oWDRJQU1Ob3NhZElxcWhMRTZpVitkblErbWZzckNZTEpk?=
 =?utf-8?B?SVc4RlBnUStHaWxrZkp4OC9ZZU5WaEJ0S1F0UDNpcVVkZlVvU08yL25CWFkw?=
 =?utf-8?B?cy94eDF3dkIzeFIzUFRsNm10R3RSbHEwMjZkZzdNS2I3NVZMM1ljSlhWT21o?=
 =?utf-8?B?RjRPOUNNcXQyeW1iOVNHTGhQS09VUW50aVRnUjc4NzJIK0FiTlRiTkZmMXgr?=
 =?utf-8?B?cUNmdm1DZ0RoUk15N1ZVdmFBc1ZkNGR4eW1WUnNpM0dubTVZMXJSOTdOUkRP?=
 =?utf-8?B?S3hQa2FtVURFbHN1S1ZMT0JDaDgxd1BVRGRLdVlBNmtBeUgrdzdkZjFGSnY5?=
 =?utf-8?B?eElMbitlcnB3dE82aHB2cG9UaXlWK0J6RVBQbmgyRG56T3BkSkROYmlUK2xG?=
 =?utf-8?B?TVY4emFIWGNSbzBxdGFvbVdZOVo2eTVKSU5Hc29tTEdENWtHd1Jxbmdra3Z2?=
 =?utf-8?B?OW5HZmtzUU1XV054Zk5zVkVwSzFKMkR1OFViMTltSTVabTNIOXVwMHRFdEUr?=
 =?utf-8?B?SWljdE9Dem5oeHg4aTBkaHE3VkxyRXhpUENzb2NURGtXN3BGN0MyTGNyUVVw?=
 =?utf-8?B?R0J5WnAzU1RZd3plRWQ3ajc2VTdDcDhEMVVYSE5rMGVobnJKK0UzTTdNeGlZ?=
 =?utf-8?B?V05TcHdINjB2TUJzOFRxdUt3SVhOMGJYRm5sUk9YS2FWWlo2eG83UDNiOFZk?=
 =?utf-8?B?WGw0czlUeEZjZmlKSjk1Z1VIUWZYMnpVVlRlYjhKQ09OUGVTNmFURXUwZE9k?=
 =?utf-8?B?ZUVkeWhYdVYxT0pCQzB3SklzZm1QSUY0Z1BFRlZGYlo5M1J6M3VOT1J4ZEFw?=
 =?utf-8?B?ZnVtREhZcHNEMGF2Ykp3WDF4S3pxb2JuaUk4RnNnd2pPNmJFcVdNZGNDc0Q5?=
 =?utf-8?B?SVovamtNRlVSbVpWZlhRVmIxaGQ4cTNTN2NEaGcwZWtZQS94WG91OHViSjFL?=
 =?utf-8?B?RXlZWi9EeDdya1VnMk1zb1ZreERieHNRRldMZXFTeDdQRWlrc1duQ2NOUk1V?=
 =?utf-8?B?bmRHVHFQVkE1Ykk5a3V1MllhSHQxSFhEL3V6NzlVSFpqYVYrZHFuOSt0RVE3?=
 =?utf-8?B?SXZvOXNnYnpkTzRRdUNDRnRaTFNiZ1FvcmN0d08zZ2U3V3lwZkFNckQxc3B2?=
 =?utf-8?B?Wks5T1JoNkRaUXBLL0FNcFZ2L1E5b1lMaUFCZmhFTGsrWVRYTDQ2L0ZaUUpI?=
 =?utf-8?B?R00xNGpzeEp0UDYrbXd3QmNoN2EvY1hQYWhjVnZFalg3aXVRL05pc2QvcURr?=
 =?utf-8?Q?XC2ENZQDtmSzx28zwlVk55VW0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a60b68-31e6-420a-20cf-08dbf26d6cec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 12:59:59.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylVCOgQoOW2Bg/IdsvzHbQmcnZqsoiV8EjO0g402oyjGLlrQBCj954fEREy9UTf6twCkA1I17FAEXxVqx2tcrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337

On 01.12.2023 12:31, Roger Pau Monné wrote:
> On Fri, Dec 01, 2023 at 11:59:09AM +0100, Jan Beulich wrote:
>> On 01.12.2023 11:21, Roger Pau Monné wrote:
>>> On Fri, Dec 01, 2023 at 10:41:45AM +0100, Jan Beulich wrote:
>>>> On 01.12.2023 09:50, Roger Pau Monné wrote:
>>>>> On Fri, Dec 01, 2023 at 07:53:29AM +0100, Jan Beulich wrote:
>>>>>> On 30.11.2023 18:37, Roger Pau Monné wrote:
>>>>>>> On Thu, Nov 30, 2023 at 05:55:07PM +0100, Jan Beulich wrote:
>>>>>>>> On 28.11.2023 11:03, Roger Pau Monne wrote:
>>>>>>>>> The minimal function size requirements for livepatch are either 5 bytes (for
>>>>>>>>> jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
>>>>>>>>> that size by requesting the compiled to align the functions to 8 or 16 bytes,
>>>>>>>>> depending on whether Xen is build with IBT support.
>>>>>>>>
>>>>>>>> How is alignment going to enforce minimum function size? If a function is
>>>>>>>> last in a section, there may not be any padding added (ahead of linking at
>>>>>>>> least). The trailing padding also isn't part of the function.
>>>>>>>
>>>>>>> If each function lives in it's own section (by using
>>>>>>> -ffunction-sections), and each section is aligned, then I think we can
>>>>>>> guarantee that there will always be enough padding space?
>>>>>>>
>>>>>>> Even the last function/section on the .text block would still be
>>>>>>> aligned, and as long as the function alignment <= SECTION_ALIGN
>>>>>>> there will be enough padding left.  I should add some build time
>>>>>>> assert that CONFIG_CC_FUNCTION_ALIGNMENT <= SECTION_ALIGN.
>>>>>>
>>>>>> I'm not sure of there being a requirement for a section to be padded to
>>>>>> its alignment. If the following section has smaller alignment, it could
>>>>>> be made start earlier. Of course our linker scripts might guarantee
>>>>>> this ...
>>>>>
>>>>> I do think so, given our linker script arrangements for the .text
>>>>> section:
>>>>>
>>>>> DECL_SECTION(.text) {
>>>>>     [...]
>>>>> } PHDR(text) = 0x9090
>>>>>
>>>>> . = ALIGN(SECTION_ALIGN);
>>>>>
>>>>> The end of the text section is aligned to SECTION_ALIGN, so as long as
>>>>> SECTION_ALIGN >= CONFIG_CC_FUNCTION_ALIGNMENT the alignment should
>>>>> guarantee a minimal function size.
>>>>>
>>>>> Do you think it would be clearer if I add the following paragraph:
>>>>>
>>>>> "Given the Xen linker script arrangement of the .text section, we can
>>>>> ensure that when all functions are aligned to the given boundary the
>>>>> function size will always be a multiple of such alignment, even for
>>>>> the last function in .text, as the linker script aligns the end of the
>>>>> section to SECTION_ALIGN."
>>>>
>>>> I think this would be useful to have there. Beyond that, assembly code
>>>> also needs considering btw.
>>>
>>> Assembly will get dealt with once we start to also have separate
>>> sections for each assembly function.  We cannot patch assembly code at
>>> the moment anyway, due to lack of debug symbols.
>>
>> Well, yes, that's one part of it. The other is that some .text coming
>> from an assembly source may follow one coming from some C source, and
>> if the assembly one then isn't properly aligned, padding space again
>> wouldn't necessarily be large enough. This may be alright now (where
>> .text is the only thing that can come from .S and would be linked
>> ahead of all .text.*, being the only thing that can come from .c),
> 
> What about adding:
> 
> #ifdef CONFIG_CC_SPLIT_SECTIONS
>        *(.text.*)
> #endif
> #ifdef CONFIG_CC_FUNCTION_ALIGNMENT
>        /* Ensure enough padding regardless of next section alignment. */
>        . = ALIGN(CONFIG_CC_FUNCTION_ALIGNMENT)
> #endif
> 
> In order to assert that the end of .text.* is also aligned?

Probably.

>> but
>> it might subtly when assembly code is also switched to per-function
>> sections (you may recall that a patch to this effect is already
>> pending: "common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly
>> functions").
> 
> Yes, I think such patch should also honor the required alignment
> specified in CONFIG_CC_FUNCTION_ALIGNMENT.

I've added a note for myself to that patch, to adjust once yours has
landed (which given the state of my series is likely going to be much
earlier).

Jan

