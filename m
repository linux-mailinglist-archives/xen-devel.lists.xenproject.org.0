Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E731802E47
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646642.1009105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA52g-0006YQ-2h; Mon, 04 Dec 2023 09:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646642.1009105; Mon, 04 Dec 2023 09:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA52f-0006WX-W7; Mon, 04 Dec 2023 09:15:05 +0000
Received: by outflank-mailman (input) for mailman id 646642;
 Mon, 04 Dec 2023 09:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA52e-0006WR-KA
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:15:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9af155b4-9285-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:15:02 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 09:14:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 09:14:59 +0000
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
X-Inumbo-ID: 9af155b4-9285-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjjFD73JYpo8mkbr/oMuVuIoOu+T1IlEcd5IJzKSht7T4SvopBrziM6P4Emq7SI5HJgjtHRPp0DigO8EKp6XXIBbGl6Qqk1zO6BJR4q1YgapFhwgT5K+Cj6uwGhsMuD8rctTIU8qZuqXznGvaM3h7n4wapikjrUPOXt6YKLh2TY4yJMb5snUQZbYApC6InAcTlt4ak43LWw3Tn+WFVASegVqscV7uoP28yt7383pAeBD2QjjBJ4YRGdDV7IbusMi9tjauCXXsaGiZZYazxuhndf/I1ipmzMbOiCa51pdgKhMlS80Bl26gsNSnt/2U6bpIbDqRQsSrGaT9+l5ldaHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSi73X5pv27r1eOFMOjFwIw3O3Gz7ILyW78bNzFZhe4=;
 b=SGdiNyd3o75HkEEnqDsuQvDwQeHgb/mqmfTZFzVhd0Aqxrdh7umJeoq0DXkl/tW8dnZKkqsmpw2AtKPApSR+LZ1bPlh75MBQH4mOKBaJPTnocgtmRJGZiNSwMxFkPlkQmHnwe1FG+v33q/3gqpXkYAInVYRrWj8IdgDYCzRUkbn5lr6CPTQzhGrfetfGFvRhCqSV2Y9pfyWDUq6EmxESYd5AOfsHK+J9+WJlpocIeV44PMmVBQUdfXMpY9mEX55XyZbJM5ko/+QJOVg8xZ8XtpXQUObmF0cOgAbrrUaWXFxlZRQRN8Vxt+xI2RwL0TThHIthvmYyCyLiaAGifKgScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSi73X5pv27r1eOFMOjFwIw3O3Gz7ILyW78bNzFZhe4=;
 b=Z27QO/H4Db5qUgmbiYpVEPaPnu2zePnPpGEkrkAhMciO26R5M2h6UQ2PkUKiRvi8T/04o+OMoNzGpTpjx5VX6BEetwk1d6nYoyqnrhFpadYfT6spKe/Yh4zs9m3JzjkfxVF5HUN4n121OTOJcVY02TrKDqSVtocS/re+OPtV7SQvLpBMMLAdceDCAwbeBHwtMuD+fw0VT0iDS5Rcb7hIzkDAD4ZsJf0o0SgU0ZaZxYyPnbaNhoS9yd2vtZg00c/ET9UXbs0tj+yVPgbwufiuh4HouB6lgze+jjvlOdB8DVYGa10ayPs1dGdc7ibPAus0mczbSl7a/2FHb4j8con9Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
Date: Mon, 4 Dec 2023 10:15:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
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
In-Reply-To: <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 73881f5d-28ba-45ed-babb-08dbf4a97d30
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZ3E2aSt8bJD0esz/uzr6NQHEPSKZot56P3WX6qbvDnCuZnyWznjpGSiLF6SbBkLK6XuDb5DEEMu+W67LpoTP/Z+/N9Yn/xA3fsWA5+UF2uR4XQX33DezwouZDMczkpR0yTqzbHBo1Lb0d3h/ymuuI3eaEIeJKVWiRgaWJAl3o/1mBu5KEGtzzUdhFsPtVv8Ub2/pfJzV3tcO0Se8ihv8FpamgRQ/UOFKVnqPQ091Sl2jVDq4FSS9lzydfLM/MnNyBlBTUaovBBfURZm7yW0Dc6oUEL5zlTDMcG7wAWHSTFkesk99E0KUwLoBwXPb7a+Ux/loq18TIooYNq0l79GCYJNUyfAwE6mCOvBA8SOD7RJ5BiXYJG39x35fvB1jvthquMeLKeiLhC7lwUkPdliol5/RoDE8/t8e5uXdfmfhGw5j8p6FQuDRlgRVuqjBEULadxD3GJ9gMdem83JVmj5KX4bpF3yT+QKPqI0AuwsR5UPBXZd9L3CAfZ3o+a89tYkE4ASgC7H6ld8n8p9O3qiiA3w3R4Jj+wa0lojFlKZEHFvBaNH9MTp0KeINWPy5UIX2oYONGHnx6Z9kbGSQN2m+5fLU/SVcikV4PwN/ygb20k09L0JqSfQrCOTtg/0aXq1okd5sSswMC0iB+QEygUlPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31696002)(5660300002)(86362001)(66899024)(4326008)(8676002)(8936002)(2906002)(41300700001)(36756003)(2616005)(6512007)(6506007)(53546011)(66574015)(83380400001)(6486002)(478600001)(26005)(6666004)(38100700002)(31686004)(110136005)(316002)(54906003)(66476007)(6636002)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVY2dUpocm40MzJWZWRCZjh6d0d3UDd4RjM2NUU0WjFKdnNLaVBud0RxVTJ5?=
 =?utf-8?B?RHhsQTRqMlczYTBHVnE1T0pNVG1nUmtjM3VxcUpBK3d0d0VDOFBKK2JNc0g3?=
 =?utf-8?B?K2lYWkhydjFjdUlBcmdmNTZjYkg5MGdQOXFCZUVidC84eDhrRVR3OW83MzM1?=
 =?utf-8?B?aXUrM29JRDM5Tmo0TkRlOXRrMjVXZjJ2OHc1d0NqQkRPbzRlU0ZHdGJDWENG?=
 =?utf-8?B?RmxDZTkrcUliN1VnUmlsYWVHWVBGNmdzZnpEK005b1BjWG04KzRIamVTMlFs?=
 =?utf-8?B?eDZpMnEwaHpKVU5sbmJZcTNBbGRGWkd6eXJxVkVOTjVROEFIK0ZPYjhpbzVx?=
 =?utf-8?B?UUZIMDhFeHZxay9Say96L0VaKzJzdHBDR0c4TXFqNld1SnU3aExkTUMxM1gy?=
 =?utf-8?B?U2JWRmNiYW91WE1HY3FWK2Rsdld4OFhBWHhrbGlBRlFWczE2MDZrVjEycU5S?=
 =?utf-8?B?NHNBOHZndkg0cGhiMDRWOTBHMlJiYUpYeWhqK1hoUytxQmRNcGFNdUtwYnZW?=
 =?utf-8?B?TkF1MW8rNk9YLzU1SUNrRXBWZnpOZGhKazhsR1RjKzhDSnJ0VWxyY3pLRUhP?=
 =?utf-8?B?bEt6c3VMVHJvYWJwUTBRaU16MUZma0R6NWxnTEZYaTlqMG4rODM5NjIrYkQ4?=
 =?utf-8?B?R05veG5aZkJMNERDd1RDZjFmV1FnamRQWlVFZkdzK3c0NStpOTVOc3VLcEVB?=
 =?utf-8?B?MCtNaFkxRzJmMDgzTnBuemtodDhZeitiT1FMc3dKUFIrdVJLOGJtLzdSdk4y?=
 =?utf-8?B?eGZ0dEV5MTlzMTJWMGs3djZicmhFcnVwWitJREJ0a3Q0eTlRYVRRa29MZnVu?=
 =?utf-8?B?dXAyckhBR0dsVWw3Y3d2QXdZV01UVTJ4L202MWZRRGM0UG5EZzBqdWlyR3hJ?=
 =?utf-8?B?amJMZm03ei9zYlFhaDRGaGVuRW1nK1ZQV3pNRThNZFZPL00vMnplWFd5alcv?=
 =?utf-8?B?bWFOS0FjMnhGRFlOZWc2ek4vZHJURURpUHlZUXI1ZTZjZ0FSR3RIVXNJVG55?=
 =?utf-8?B?aVIxU2V3OWp5aUxJT0EyUTNzMEg3bzhpWmxERW1EQVpnOGJHTWRkODJXVUh5?=
 =?utf-8?B?OER3VzQ0eFVhVkVRbkovUVN2RnE5UkFJWG1SaVRwbDV0dXBEMkQzYXhuVlhn?=
 =?utf-8?B?a2lkZEhFeHkvQ09zRU1KWklIcml6RUxjVzY1U21OOXhsMlBRaDE5RndPUUtU?=
 =?utf-8?B?K0ZISHN2SmdXaWpsT3IzYmczUDZIZ3dtQWtmdEZkcXZOUUJSZlNMdXJWMDNM?=
 =?utf-8?B?YkRVSjN6ejBlM1g4TjBCNndEbHFrRjlCNVJYbXJlcDlGSm5MQVlZSU9xaHRa?=
 =?utf-8?B?YkttQzd3SFpYKzdkTGxwaVlzUkpSL2xQRDgrTlVxVEc4OTdtRThZQUNjdnM4?=
 =?utf-8?B?dEZNUWMzUk4zc09TRzQyZnRjanMwZUNjZEthcTlPVkp3Q0JlRTBuRVBKVlN2?=
 =?utf-8?B?dkpqWW9nSkpyVzMwa3pvY2JEVWRhalJiWmxGSlBMSnpsd2xSV1NvVy9xM2Fm?=
 =?utf-8?B?bGdETTJHczduVExZQXdVL1NuRk5nVllsb25PMzZUanRyNllxeTV4TzhoYW5L?=
 =?utf-8?B?MTRhdGFrWStxTW15SGRHbXp2bmppQlYzaC8wYVE4NGdKUXR4ekc2YmNvUmRE?=
 =?utf-8?B?WkUrUlhmVTZMSWJXcG1RNlJTeHBqbU44Z1Q3dUtxVDVybFVYK1hWTG9RWERE?=
 =?utf-8?B?MmxWcEdWL1dNUjREd3l5ZEpsYVBvaVE3aHVYT0N3Y3VOWHFuREVBMXdXWVJ1?=
 =?utf-8?B?dERNTmF2ci8xUHVVbDBOMVo3dDg0NEYzTm53dHlvQWljZmtackNLQ3NGNHUr?=
 =?utf-8?B?bDBsaFV4VHAwV2ZHNG1HTEtCb0RLRWNsS2J5SCs2VE5vVThDTlhmdGl2b0lu?=
 =?utf-8?B?dmp5KzFobklOdnVSREtjR1BacHNCWDVPSCtmWkJ0TGNVakprSU81Z0d3NGR0?=
 =?utf-8?B?S3VTd0hGT3FQRGovMTdYZlBDck95NVpYcE5QbkhvNUY3Q1lFb2dQN3VQeTFt?=
 =?utf-8?B?K3FORUx1RC9kK0VWSmp6YU1Ub0k5VWpNNzZiTnFIYW1RU0RFbFBwUS9oalVN?=
 =?utf-8?B?WGlpM3BpbEE0ODdGcmxJNTlUOHd4eU5hMlBGUkNZbFJWbmJrbkpYNkNUYjVC?=
 =?utf-8?Q?RC4m1fPy6x9r/y7nBdokfJtml?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73881f5d-28ba-45ed-babb-08dbf4a97d30
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:14:59.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0FbMR0GulqQ1qeCiDSvYoVOw+D0KfBp0bRxqtZoTJjXV1ctbhRC7dHZNOtFJTX7fjusPZJaVbiXc2RnsksFSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142

On 01.12.2023 21:12, Andrew Cooper wrote:
> On 01/12/2023 7:59 pm, René Winther Højgaard wrote:
>> If I set smt=off and try to configure cpupools with credit(1) as if
>> all cores are available, I get the following crash.  
>>
>> The crash happens when I try to use xl cpupool-add-cpu on the disabled
>> HT sibling cores.
>>
>> Hyper-threading is enabled in the firmware, and only disabled with
>> smt=off.
> 
> CC'ing some maintainers.
> 
> I expect this will also explode when a CPU is runtime offlined with
> `xen-hptool cpu-offline` and then added to a cpupool.
> 
> Interestingly, the crash is mov (%rdx,%rax,1),%r13, and I think that's
> the percpu posion value in %rdx.
> 
> I expect cpupools want to reject parked/offline CPUs.

While the only explicit check there is

        if ( cpu >= nr_cpu_ids )
            goto addcpu_out;

I would have expected this

        if ( !cpumask_subset(cpus, &cpupool_free_cpus) ||
             cpumask_intersects(cpus, &cpupool_locked_cpus) )
            goto addcpu_out;

to deal with the situation, as parked/offline CPUs shouldn't be "free".
Jürgen?

Jan

