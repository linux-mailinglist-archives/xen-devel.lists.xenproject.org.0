Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6317EB571
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633036.987565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2x4S-0001YG-Qt; Tue, 14 Nov 2023 17:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633036.987565; Tue, 14 Nov 2023 17:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2x4S-0001VO-Mo; Tue, 14 Nov 2023 17:19:28 +0000
Received: by outflank-mailman (input) for mailman id 633036;
 Tue, 14 Nov 2023 17:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2x4R-0001VI-CU
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:19:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f57cb484-8311-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:19:25 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 17:19:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 17:19:23 +0000
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
X-Inumbo-ID: f57cb484-8311-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE+s3Baioc/1+NRPpWi7MmaRaIZYgMqekNGkMO5uA1UhWMSdEDp17ixpPdA77S9h9FYxm2S7BjFSCO7qHS+uzVaVJBIAjzZJLnGlE4vLV3+Li0SdDFJHqic4BgvGG5ZVhNFA40Xwt72ovLoRR2Wjj/il/o4QBG1Li3dkRmjQeyjEL0LeGUZwz9UDhKPGKmkHXmv5H9X9qajD2d+OAO+UaF61pYwOGbm4nsO2DoqNRdSDC9HLmX+9q1Dbd2PY+ybeol+de9JXbmDt89xC8CIhjq50gikAqtRaJ72jI7YxzTSR61HeIqMAFP8LJ3gOuVh4ehnxW9kTy7mnVY7m5fT+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aStHLeOB33YVoWpH/EcwkmmoJODc3XuzzgXoGUInQ0M=;
 b=ADXQH2NIFlAerKMuJH7RFhTCOeTeFjYg+DkSlwevUKRiXb+rGinBIl3FRx0FAajDyUyTwn8Z8cKXTeP938vws4gP6t2H45ybeizoykOz3cJvQxn0yef/LF3q7kEeH0FXwumhvVwrD6IO/jBP1SLg9YO9xwT5dbM7Lq8PLsXE2SkexxItA2PHVoLs1tG5UvrUz28MMm0LjgaUqzV+txD3M/Zhd9LBvrvIP8CPJcwySNMKIAU7TFFWlVS3AkWF5tf6u8cxSfmcCSwcdDP2Xh1NZ0hPp3GAHJR8W7S7m8M/PPUVki/4AKqW1lqeZIsC3k/MwVXb2H611QdtGjFP72P0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aStHLeOB33YVoWpH/EcwkmmoJODc3XuzzgXoGUInQ0M=;
 b=wzZT936xdUOyx0B+49tG+TsYP+PBuguHywsYxlr8mE24DeG8pS9qoGihua2wBxjFf3hdMFLX7Fa+Nl35FiAYFGOxVcR8uvvdNkymOjHB084zIcRThfIihYP8+zNN+8j/t60RM+oTlQnd7/aFcYRDzzOZjywA8Xz2yWxFzrchQGA+2/oDk8GcrbfmUC/BiihlZTJXz+AgF84iXtxV4CaykSMO/WfhSugQIutVUL6NCqhx4ZLuWdr6eOCslBEIQkwMi/OrmybLQf7HZIWUl1ko70LkAOrK3Uu5x2GHPzlg2hrP2kS8FQXvOeF0413YffYptsh3LbzcB7K7PDUVe0qW0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39592ff8-4694-4427-b1f8-614150ca9ad0@suse.com>
Date: Tue, 14 Nov 2023 18:19:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <371c5dd29fa974ca27db1f720f17fb0ffdd667a0.1699974488.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <371c5dd29fa974ca27db1f720f17fb0ffdd667a0.1699974488.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: c1896f70-8e25-4126-e123-08dbe535d8b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hXZHJJZgv+siEJ18zQlg8IEuABkfkYviZYDwVv/xYvGFgyZPqvFyDlDXjiYjI1M5sB/FJEjKL8t8UCOVCfTd0Ne2o0aMiTmc0dQ2i/YlcijsQ5PKxqZlKhCuT9BXHzve/uL5XEuIv0cYoDndiSJy4JS3U53wyfyGWiRCdxiQm70IxFCITjMEo6YjUmqKJlcMTD4rtEPJrxkdx2vZCXde0JyCBu7ycPtingFWBjAOIbcpJpGIoZHDpq3ZPfZT2PuiBv1LLZIJFM0L/9v9So4H0mqWHgGJN/dKLb5oLZZD7iuzxXnJuPeqDe0174gp+LSy4Hg/HOMKsXEkVF3HEvA74m+FU21OZGUH2mY34t69fkN1wXNHFE9xF5y2O/9xf9ArGH7jQRmTbcmdLv3cBSTcgpTXUhqLzwN2AwnkoNZ7Y5VrPBFI72PoTIwj1LWEtkTaL6XbyIQfppaiCEq52m+RCYRGr4cwZpIP9eUjbnLL3swoKbCKZeU4aVdrLroPr9obvPO1cIfCYxvVUcQEYS8fpMo9fG340HfmH2OKIEiNTOew74/bDM7S53VbpyUeRIOTNwfn+Y/WD06jAbcUybl78DVCBnGM1CdX1udMgeeFMt0oOqkzb6KgvAgAfIqIc/sU9siXWzwx+3cFAwmfDQtJtnrfw3IRX5iPVZAU3EBLsEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(6512007)(26005)(966005)(6486002)(478600001)(31696002)(36756003)(86362001)(4326008)(8676002)(8936002)(41300700001)(7416002)(2906002)(5660300002)(66556008)(54906003)(66476007)(66946007)(6916009)(316002)(53546011)(6506007)(38100700002)(83380400001)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUZ5aDI5c0RvRk0rVWRWWUFIdGg3YU5PTDd1UHc4bjJiRzlWT0FsUXFSMy9u?=
 =?utf-8?B?ZDZzM0ljV0ozZ3Bad1BUYU1ZNWFYL0E4ekpMN2JBTHh1OU45bC9QU1JodTNT?=
 =?utf-8?B?Q0lKeTV5c0pxMDdvdzNEZC9aMFhZU084ZTJ5ck84eFZQc3gvc1pnVGNlT3Rm?=
 =?utf-8?B?TFdtZmlqOVJVbWN3VzVjUzRXd296U3hveUo0d1dva2VEbW80My9WdTl5cWpV?=
 =?utf-8?B?NkpRV1Mwa3VrdGpmdGtvZngrY1JHYXRlNHJ3ME9GQVZRTVg5YnNVTENUYVRG?=
 =?utf-8?B?RitwWm1jblVST24ydnd3SURjNzBhSVlqMkRyeHROOGpnRjNqcmRUNXM2aXpi?=
 =?utf-8?B?bmFlVlE0MjZMTHBraWlvZTA4YWNJcmNtMDY2cy85bm9pZHNKVStPdFBzNENr?=
 =?utf-8?B?cG15YisyUTROaXR5OVovRDgyL3R1NkE1U2ErZ0NCT3JacjFuT29aVTh5dk9H?=
 =?utf-8?B?SXFVeVI1a0g4czNKRFBFMGQ1L1VobzBEMDQzOGxlcUVONjNzK1R3N0pHWWJ1?=
 =?utf-8?B?YXJ4OHRncHM1TG1vM3dHN01TQmNJSHV4Z2xpTzllcGFEZy9tZTdVN3dRWkJ2?=
 =?utf-8?B?ajRPMllFR0pHZmJpV1NhemY0c1IzWFo4UWM4dDY2SVVVTmM1SEVxbVliMitI?=
 =?utf-8?B?eHY4akhyZldCVWxPZ1VLaXdmdGlaSXgyYmEzUU1TQytNT3l4djkzUnduNDNW?=
 =?utf-8?B?QUNJTWlVZzZZMTBoUWxTTDdSc3Z1cGQrY3N3RFBlbDJaMjI1VG9jdTZ4NjRH?=
 =?utf-8?B?Sk9Ld011cURTd1dtcXpZWXNFRDh6TFF2Y0dIcTY5ZnNENHU1b2lScWNuQ25C?=
 =?utf-8?B?RW52T2NyM2dlZ083ZXM2SVJIQ0JVMmFGV0lxZVFmR1RjVVNacmFzTkdRUld5?=
 =?utf-8?B?dGcvTjluSS90QWlCaDJ5alRudEJHRkxjZEp5VzY4TFVBRDMwNWU5VmtPWFJq?=
 =?utf-8?B?bW9paEl4R3dxeTc3SDIyVm9zRjZqeVFyR2ZZN3N6cUZza1Fib2p6U2x6ZDJr?=
 =?utf-8?B?MnhnZWNtN0oveHhBLzVwekxPZmp2dTczU1VGUHc0Rk9oM05IMDlLZ0crSm14?=
 =?utf-8?B?dk8yWlJGUmNUbHQ4aGp1Nmt3ckpYLzI5aFo1RTQxMmMvU2xhbHEybDVrU0hh?=
 =?utf-8?B?ZWxnTUxUN0tmWUFsaGRLZm92eFBoQlY5QXZRS3Y0MWFVbm9ZOHJhQ2JMMGlj?=
 =?utf-8?B?aUMwMG9zTEIySXlVYUl0cDRIUnVOZGZPYTc5cG1sZnlpMjlkdW9FVXB2TTBZ?=
 =?utf-8?B?NU5pUzVXRnpXclVUOFdMYWlVWWIrRmwvUS96RnZyekRkTGw0NExseHN5Yi9E?=
 =?utf-8?B?eGR2N0dFeHlkbjQrQW1iaFhXajZCeE1FUFlPOVRXMEpLLzVNRmljUE41YnM0?=
 =?utf-8?B?a2FqdStUcDFCb2F1MUlTNDNoSHhJd2NOMGV6UEdpOTIxTi9uYm5GSWtYL2ts?=
 =?utf-8?B?cTc3c3kybThJdU8rdERZaHM3TVF3K1dFOENFSGxNVEw5SkFxVVl2V09TUVVr?=
 =?utf-8?B?ZnozWWFOMUdtUGQ2aEwrajJIUkltR3NOaUxsYmd4MERJTXU4ZmpwM1hwdHdn?=
 =?utf-8?B?ekQrQmM3ZXFmZ0ZlSDF3VVFUVzdUR1JZSUVrMVNNZUlpQTFXQzhxRzlWbXpi?=
 =?utf-8?B?MXlGUm12TVdrY3dRMU5KSkIwQVBLV1YvZk0yR3J6b1hWZWVyN3Bra2dmcGdH?=
 =?utf-8?B?RFR3R1dGTTdoOHVESjM5Z0dIeDJ1ZGhiKys1cUI2S2lRYnhRRVBRSHV4ZlBi?=
 =?utf-8?B?eWtEdWdGeC8xVVVHT1ljeU1FUlBUajZld3ZXK1phVW5JbWZHVlVsdXk5TG5F?=
 =?utf-8?B?dExqU2p4TEpnWG95L2FzZVhjZ0FWeXhpL2FTRWVUUDJSSmZ6K1diN3dwVUFv?=
 =?utf-8?B?ZjZ0djIvR0ZXdjVhNVphZVVneUdwcnd6U0QxODRiSGxLenR6ZnJqK0MwQkFh?=
 =?utf-8?B?a2NDb01wWVllRFFxemIwNG1oSjg5WExkUUdJOHQ1Y1gvRUVzUzI3c3RabU9v?=
 =?utf-8?B?a0VRK3kzM2tRVkp3WC9leVdVUTJBQUZEbDhHMEZqTzUva1FSOHdTTmN2bENC?=
 =?utf-8?B?M3RqQkFBQzBMYjlOL05YbCs0aG9MOWFLcEJQVGdBMGVBenBWU3RDQ2tISGhy?=
 =?utf-8?Q?PuGGCSaw2vAIJsMUC/YxtKelJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1896f70-8e25-4126-e123-08dbe535d8b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 17:19:23.5994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/Tbm6PL/kSwVcYdSChPPROhpBk8T1YWhSyQbWmYYY7SVVZ5i/xWOxu6txWt8BesKI2vTpN86QR6ULiAGDXOag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

On 14.11.2023 16:13, Oleksii Kurochko wrote:
> ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
> allows to avoid generation of empty <asm/mem_access.h> header
> for the case when !CONFIG_MEM_ACCESS.
> 
> For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
> and traps.c because they require some functions from <asm/mem_access.h> which
> aren't available in case of !CONFIG_MEM_ACCESS.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> ---
> This patch was part of patch series:
> https://lore.kernel.org/xen-devel/cover.1699633310.git.oleksii.kurochko@gmail.com/
> 
> The patch series hasn't been reviewed all yet so send this path
> separately.
> ---
>  xen/arch/arm/p2m.c           | 6 ++++++
>  xen/arch/arm/traps.c         | 6 ++++++
>  xen/include/xen/mem_access.h | 2 ++
>  3 files changed, 14 insertions(+)

Also drop PPC's then dead header, please.

> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -11,6 +11,12 @@
>  #include <asm/event.h>
>  #include <asm/flushtlb.h>
>  #include <asm/guest_walk.h>
> +/*
> + * Inclusion of <asm/mem_acces.h> in <xen/mem_access.h> is #ifdef-ed with
> + * CONFIG_MEM_ACCESS so in case of !CONFIG_MEM_ACCESS will cause a compilation
> + * issue "implicit declaration of functions 'p2m_mem_access*'.
> + */
> +#include <asm/mem_access.h>

Personally I'm against such comments (they simply don't scale), but this
is Arm code, so Arm folks will need to judge.

Jan

