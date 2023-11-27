Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10A7FA1C5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642112.1001286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7c8U-0001aK-Oj; Mon, 27 Nov 2023 13:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642112.1001286; Mon, 27 Nov 2023 13:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7c8U-0001Xd-K7; Mon, 27 Nov 2023 13:58:54 +0000
Received: by outflank-mailman (input) for mailman id 642112;
 Mon, 27 Nov 2023 13:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7c8T-0001WD-Nz
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:58:53 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f0baba-8d2d-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 14:58:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 13:58:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 13:58:50 +0000
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
X-Inumbo-ID: 18f0baba-8d2d-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDOdElmkcFzQr8CE+iQrE7Yg6hF4xaykveFhHHqlwmErWo1/JZZ1jat18CFxLYm3mPmqcuPtiRlGrrsYN90YHt9F5NGupInGp0EPMGSRaKVQtxm8g3NJWCoEI4g82+BaK3Lum4yK94xP+9KRAmwocaoZWgMf4AUzYyJ0CxDPn6/ZnbUkVkS9ZismReKzKstH3dpbox51Ktt6FIBFdQIlLLcMiNOhQ3Fbbr6jFzGS7RC8XiyG0BCDkcacKKz4H0mgR6/KcXcRN8dxmxYytx2BcTMiMZaCiQrXidwD3M9ZqBP/vdpVZNjmSjI04/z5HCIfWiu6Exk5fnjrELO5pKXayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYEYYMZaiMMMVwcsqGHs/3WtVAXSuEy3GLJdcSPQMys=;
 b=abKBBQN2JSQu1lufhPkfeByB3HshP4invrpfG3dc7HimnubEFsOOrI0iYeLcRMXzdT4M6PiBoIEumGI9qhlvFy1DLgKdmp6FBgG4Fg2/Cn/UaV9FydI00zeV3TfMu2gOFeG3/L6GAGFUYzGRh2mGoRhDcBLDFP2fGmYZZkE1eR8jBJrIeT1RhZdPvYj4cP3BdfsKfnmFwlsDmGGuJGEo7YO7XeTZ7GwsJnqnoaZSj3u3w4i3ozR+Oj/A3FFRoJk9JyYmIEDwOxEWvKPz1zi5v4AaQH67/sSRIDYhQnbF8B6djY4X8fodCEFRs80yq3YuQbyxyKv1MvtMxbVwFVHi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYEYYMZaiMMMVwcsqGHs/3WtVAXSuEy3GLJdcSPQMys=;
 b=JS1K1My07vraOMVCSISFTA3UHxHCcoeM8VcRrIotNY8a5pO7clTa00fI8NemNPEwnjm+y/zXH3g6cpFIM5NrCCDDPBWWXbHoSz72WCT/m4AB6NETbVFaNQgveN/ZfTrWJ7N2Pfp492mbEfFxYY/9hEd0/yE+4bw117Dd0YFuEU/6LMmbliikuiqV1XvXrfNB9rWVmBTSrxptdNKPeHEdykEsg07BAq0jS3oFz8rsh0iWy+5TZ3MojX+JxNQsthxoyWqiooysPbRDlZcc1lrdWKi5q9jn+xQzHTM39rgJ3qbUpiawsvcD7gl9auwCuEFJzv6vtoNmQemwjZVKAqQuBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0995dd2-22f4-45a1-b5a0-8eb7e5bcd23a@suse.com>
Date: Mon, 27 Nov 2023 14:58:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20231127134619.2978-1-alejandro.vallejo@cloud.com>
 <287760a9-c6fd-4723-8357-f0abf9202d46@cloud.com>
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
In-Reply-To: <287760a9-c6fd-4723-8357-f0abf9202d46@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: da7beaa1-73b6-44b2-4a34-08dbef50fbe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tziGy5jKCFoA/xDFULCejSbt9eTS4mgpLL9aOPL0nw4fkTqDxVHg4rOX2k0qD1VGU9z9EUe9s4Ly378ZwPrpWV1XtWlfTnujpsA/32X9KlSNhQnMwhDbqcZtDUQOQdDQ5wbSUvH+Aua+tPP8fFUifdoCq3wbOb6TFMc1vOSj8MWfV2lknAC/cn6aatJcL3fZYZfL64MUTBtdrU3v+a0VSQLToo7lwVsfFZ9i95YDPHdbbHCK8dMBnCdd1yznAab8hPkwBZbZKeNJozdcX7kB2NxMoUAsFf4BPgzs2eAZvlvAAeFuGNL65E//+nXODJKEYbskG0h8qK8uS503K+hDb5Na8qqw4T3sxrTD6sCMpirbMgxDSjsTr//NOxTGAfN2MvO8D6zJIsC3s/y3267SZcLA6//tErlosYTllRIQMEeYENA+AzyN83S/CkTDHNihMY0gJhYW8/FSrdZ+asN6d0PkOO21fDlxxxilIiSsZdV8eM0vmir2yypSHGojggZXGx93nDzt9i8Ubj5Yvf41O4fIsKq9zpEHQyJug9WV4lKUhIKt3cLvkU/K54SozecoIcDDCJA7b1iNLZDtyCsifLzpOekM/gOPfr+8ORcbJ2RCfDyXxhysQ6tr+d7J+TE/Xcfb7QCmDkbKL/yQpXuVx1mShkY/P59Aaj3IlciHPmGHkTuQ1xlc0Sl/jWTKjmdN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230273577357003)(230922051799003)(230173577357003)(186009)(451199024)(1800799012)(64100799003)(4326008)(5660300002)(41300700001)(31686004)(26005)(8936002)(8676002)(2906002)(478600001)(6506007)(6512007)(53546011)(2616005)(38100700002)(83380400001)(316002)(54906003)(66946007)(6916009)(66476007)(6486002)(66556008)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9PdTU1aW5WYTdENHh6dHJ3WHFnSWdNaU9PT3lNSTBUTUV1aHFiWmdrM3Qx?=
 =?utf-8?B?Q3lRMnRhRjZ0b3hUdDU5RHh1Vjdic2J3UFdxeXN1MCtaZ01CR0lLVGY0VFNC?=
 =?utf-8?B?T2JwdDZ0bnJRajlhTldja2xkeWdJRUlwMXdIVGh3d1lmcUY3SWNZektSdENt?=
 =?utf-8?B?NFpzVkFIMzRJSVdiWWlpZEFlMmQ3V3U5OHpVeW9HdkErNzBqUThxREljNDg5?=
 =?utf-8?B?QldhSDZMek43dXRPMVdTTzk1OFJDd1BWb0dMRGI4WjdnTDZuOWJYV0N4VlpU?=
 =?utf-8?B?QXdWbisxQ3RHUVpWTHJPVWhCWlNBTHY1Y05ubktmSzBuZU13SnN3Znl0dkF3?=
 =?utf-8?B?Y0lpRmhvcE5Ja1pmSHJtR093bTFnaUdIVTdXWE1xejBTYXRwb2NtUFk4cmww?=
 =?utf-8?B?dFFuMHE1MmNRY3VIdTFuR0xZQ0ppTGRSSTQxU05QdlZpYUFUNEkvUEdwVWlB?=
 =?utf-8?B?Zll5YnRvZHhBWWx5SmozNmdFbUFWdm9JZEQ0a2tzYVFVYmVSRnNKbGZibjBW?=
 =?utf-8?B?WVhwS2tNVTkxUi9mNGc0cVVNeVpPbFRWUkE0VkpkNCtqbFkyUGlTSmQ2YTZ4?=
 =?utf-8?B?R29idGJuSlNrWGx3RUhXRWw3QWpQRGxPd3JYMllKamFUaWQ0Sit3SUlzMmRE?=
 =?utf-8?B?WUdnWTBHNE0ycUhhWVNITlVkNGN5SzFsLzhpcjJScjhFTHVMM051TC9rajJD?=
 =?utf-8?B?ZXk2VHlmdVg3bU5HQk8zb1U5ZXZUZFJQRlg2aUp3WVpCU2F2QmE3UmRoY0pM?=
 =?utf-8?B?eUdvY3hvdHloRm5SM1hOVW1nMENEUGx5MmpYQzdDL3BOTDRpQktzU2ZFemI3?=
 =?utf-8?B?WWRaeG5IU3dxOG5mZFJYd3FSenAvRWFacWRQN2YxWnBxRFZMdzFuRVI2aXNq?=
 =?utf-8?B?UTBzSjVQdXR1N1Y3QWp1QTQwa2pleTlwaEFCbzIvcUhZU2lFNWhLZ3lzd1FQ?=
 =?utf-8?B?V1FhVWRzVGlnSjEvaG9SOVNIRlVEaGZxV3I4ZDhnYjRhUXRZR0NWOXVUd04x?=
 =?utf-8?B?Q1ZGOHFTL1ZQb0UzbTBuZCtyMWd4V1JzVnRlenM5SFlIOHRHbk5OVzR3Uzht?=
 =?utf-8?B?T29GVXRtNllua1VKWjJ6ekYvMWpCN1pZd0tCWjFDVkovZGVseXFlelFRMmJE?=
 =?utf-8?B?Q21Mck5xUnZrTUZMalFQZ0x5eDN5NHpkTW9FNENYRUtRVHZaM3RwZFJVaExw?=
 =?utf-8?B?Y2VvOHFjVDVReGhJbmxUUVlTK25lTEJFNG1pWVE0a1V0emRXOHlWUEJ1MmxH?=
 =?utf-8?B?TmpqNkU5QlB6cXhGWStxVlhxWmg4OEd3WU1wd2ZWbkcwbmFTa0dzaDZqQUIw?=
 =?utf-8?B?QUNnS0ZDQ2hsVTJJTVU0NlRCcFlYM2pvS2wxanJ5VmtVaEx0V2xwblh1T0h3?=
 =?utf-8?B?d25pSWlVZkYyVzdiazl6Rk9EUVh0bGlVbzNpZjEzdGp5WCtyUXJhSGxlWGph?=
 =?utf-8?B?VkQ2ek5TdHJuQ2dyY2hkMHNUYzRGakE0QlV5WDM4Sy9qMlE5S3NjSEJWL2RS?=
 =?utf-8?B?UW5MdTZmb1FSUUpISFNLRkdIYlNaNnlWQUdiWFpnSWJVdnZzdzVEWWZkRUdY?=
 =?utf-8?B?SmREL1lZUGpSQ2Y0ZDBzY3ZQWmRGak9lclpjWGI0aGsxT2NwL29LRThVNWls?=
 =?utf-8?B?VWxkbmpWOFZPNmEzVGFBYWowUUZzRWgrL2hxdWFQZ2FYWGIwSjNuNnRDVWdF?=
 =?utf-8?B?SXNJaXdpUDJ2anJ4VjFJTmtmb3VRT2cyeHllT3V1UVhHOUE5RWNyUE9KYSsz?=
 =?utf-8?B?aGQ5Mzk5WkphWGhkc3F5NFZwRGNDTlppWnM4M052cHdCUUxteE9zQkR1L0s5?=
 =?utf-8?B?RkkwVTlseXdzcVBjNmRuSlZqYzMrR1VXN0ZtaGEveWZnbVk2OHFvMHU0bDA5?=
 =?utf-8?B?QXlmZXROMlFEVEVHT3pPZTA2TVhCMVIyUjBSSnZ6Z1BmaGVSMEZqWGhyaHM4?=
 =?utf-8?B?SG1TUFhrMjc2eklqTXp0dWZLajZDSTZER1FiRS9aYVZHZVdtM3VRek9YaElX?=
 =?utf-8?B?OTdNRzh5eGo1Tm5TVCs5emNxRjdNcDdQTkFyc2hvQmJkUi9leTA0aHlJejhP?=
 =?utf-8?B?aTVoWjAvbWpUTHQwb0Q0TzFqdS81ajM5ZUR4SmZmbU9iNTVzQkcra0lmdkFK?=
 =?utf-8?Q?R3+TCREZzKNoGUNMKNVk5MdW9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da7beaa1-73b6-44b2-4a34-08dbef50fbe7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:58:50.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Or4/KfCUuX5PRrGIDGmIVbQROPJQbXaO2hoLOsI5JWpJM1ghXMb8BfaeRNg53/7nCm0i+SIKi+TRM4ANsk7aog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200

On 27.11.2023 14:49, Alejandro Vallejo wrote:
> On 27/11/2023 13:46, Alejandro Vallejo wrote:
>> Both Intel and AMD manuals agree that on x2APIC mode, the APIC LDR and ID
>> registers are derivable from each other through a fixed formula.
>>
>> Xen uses that formula, but applies it to vCPU IDs (which are sequential)
>> rather than x2APIC IDs (which are not, at the moment). As I understand it,
>> this is an attempt to tightly pack vCPUs into clusters so each cluster has
>> 16 vCPUs rather than 8, but this is a spec violation.
>>
>> This patch fixes the implementation so we follow the x2APIC spec for new
>> VMs, while preserving the behaviour (buggy or fixed) for migrated-in VMs.
>>
>> While touching that area, remove the existing printk statement in
>> vlapic_load_fixup() (as the checks it performed didn't make sense in x2APIC
>> mode and wouldn't affect the outcome) and put another printk as an else
>> branch so we get warnings trying to load nonsensical LDR values we don't
>> know about.
>>
>> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> While no R-by from Andrew was in the mailing list, it was in the xenbits
> patch, of which this is a direct copy except for minor delta suggested
> by Jan in lapic_load_fixup()

Sadly the doubly "fix" is still there in that comment.

Jan

