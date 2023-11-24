Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE3E7F6E52
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640221.998156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rgj-0004zl-Ju; Fri, 24 Nov 2023 08:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640221.998156; Fri, 24 Nov 2023 08:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Rgj-0004xv-Gm; Fri, 24 Nov 2023 08:37:25 +0000
Received: by outflank-mailman (input) for mailman id 640221;
 Fri, 24 Nov 2023 08:37:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6Rgi-0004xk-3m
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:37:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe13::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b04f7fc5-8aa4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 09:37:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8526.eurprd04.prod.outlook.com (2603:10a6:102:211::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 08:37:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:37:21 +0000
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
X-Inumbo-ID: b04f7fc5-8aa4-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTdOQQDEtZ69V/R2piTdWheOx84lxgcHhjefkyEC+jHoR4T71PW+1+FyZK3iL2HR2B7oaWBJ9/ABbWP6+jBv/7RMZc/XLzV5g3oxKPCC3QxxwwXnMmA75gjAAgKv76UwVklTjTmeKf+6u2wSkPalja71TOuhTujgtnRsnWC5yr5pd2o1ky91BaLXAneaGV+3pAMHem4rF7DIOOvcSEOQ19OyWXisB+6yS4j7S2GdguMW4KFOTv1BlNdDVMWpfNFjDVxS/s4/6gHO8bIBa0bfv1PwbMPmk58YeTCjM1UPpmmVTiqN2DX2+Iwl2inlEVplOPnmGMiiYphHTPjwOSgnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhVP6c4MwU+XZvpPh3/grpvaiJbYdKXcbJ07V03kqeM=;
 b=XY5bc6l7Ay7Z5tDuSGVqQ+lQnaS678WWsV25rzcgWbk44zJc8HIDryIwYYNz+M4YSFufQ3T051apWOUDylPJLjTypO+itu3Il32pHFyrosnCmkdAb3v13mrp962k7B/Bxf9VSlI0w6Ve4NSWFOamkyasS2i5/+NtXgHxVIfyC3W0kXDVaVG2FfoiUUd/PdPBeWgvFJQOKtQqZSX93UcvDH7bHIh0bR2SWdte0fPzKJDTI3ojumzJCS99np74u9VVacBbMX64kj61M/jUOXPdPG0AUqx4kUyDlLbW82PWyWY4H73J78Qgu0VWHtAPt5tepW916Su9d0CQBzgSXaOk7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhVP6c4MwU+XZvpPh3/grpvaiJbYdKXcbJ07V03kqeM=;
 b=2QFc8vlY8T4jdoRuI7tyNj9C+BfGtwFPnIU/LmRjMQyu5yANkh2/tOceNJ5jSok14+FpnhXFMKEuyf5S8k8+oX6VrkWGZTW3FQzHc6E9z2n947uIXh/k8SSy+AIaq8OhIj909Jtgh+RkT5eMStd5c/Se9ZTbVf8P6pamJI1aKMlkAHAWKYrtTlJyB/7vkS6YruRp6Kjb9BfRpwSsHrvqXM0pbq1OTa7DcYO3h5vv9gtoahIpdktZGXTRBRH8tQEkU9ET6ZLz5+orX2arFKEjCkuV4K7o7DA2PNNBf/KIGtajEY0SVteUHOBshKkpu7HJgNNSjc54XgXg4NenYPJ+1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <254ac524-4217-4bd4-9664-a340bf92db0b@suse.com>
Date: Fri, 24 Nov 2023 09:37:20 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 02/15] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd54dde-d634-4210-1cf0-08dbecc8937e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	he7VwmcOepMajtoKQsqtchUPd2Ul0OwJriYmkXgLxpGNnu4vcV8pA9bDdqVWhWsKXeOGzQSfWqbj0ZEfUYPx8OGGXVBRK/NJim0YMmQnheITQqWEDI1YF/TphmaJRrepSpzZiGzEpRo+7/JaYUj5DTeBp6OeALATbBXF0eYWLOPU7Ld+pyMkLQIKbXmDfM0stQG1txolITuJxVk2JkBHEuowiOGVD3ea5rx3eX7csB2IY74eXRiOSY0U5KYHAzw+3xKexDW2pzXVymhPYpWeQzOIKRsmjGj4hlXS9qxHDbsrqvHOVd8i9a9W2j69yInm9ZJThLH7ANAEs3jy8kNIx57sqIEpDNpPnpRMtF0YnvrbpwqYk13byNM90dNUJWeOttYYrJbeTHCJUhqyoBeHQ0eXRUgISHVvMGE9bXI8tspv+8sH6KhEF2BNzpBd5U1aTvCKxTBSZ+VsQtRpz9rsUeL/7jQdOzrqZ/kBv8T2yF15jnU68rGCNpuD29FSQB6hI9ffzlYSfHi3oPRE78+8c5QoRoyalmnl6hRvMD4/4WjkrYxzfRVJzCW9e0tjSzG/TmiGnnF1cJ9v0b5WbtH/aSegmBkG7eS5OPJdWoOY2eGBmKBEgh8ArOyG4wbAxUou6GpJhiapRkJEAIlPQi8Srw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(5660300002)(36756003)(31696002)(86362001)(41300700001)(38100700002)(66946007)(6916009)(66476007)(66556008)(6512007)(26005)(2616005)(54906003)(316002)(478600001)(6486002)(31686004)(966005)(6506007)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUNzdVNhNk91TGZWcGNZcTFrRERRR3BPZzdpSmdLT1BwNzZxb1p3SHE2ZGx6?=
 =?utf-8?B?L1hTYmw1eDVjYUNqVFBuVkxsVzVITjVIM054c3ltS0xMQTczTmd3SGdHQ2Jq?=
 =?utf-8?B?YXFIVm1UT0hmc0dDOW5UVzFIdHp3TTRzd1ZtQ2NvQnIycVpUdjFGaTk5Yy9a?=
 =?utf-8?B?UjhRNE16dlVjaXJycUc2RjBXZEpubGY3NkNLMDdoWG9rdmVhWXhqNmhReWpE?=
 =?utf-8?B?UUQ0T1J0RElXeWpnejZaSUcwdjc5ZnBtUUlpajNhVkdvVkVZekZGVnZRUlZ4?=
 =?utf-8?B?YkMvYWJXRXFSSTBCRGxRdFFwV2szVi90MnhESmNJdm5BeFRSMndMc2d4a01z?=
 =?utf-8?B?S0pHZm1jbjNpK1cxaFF1OHFrc09TZjRVVXB0TnFZL2RTK0VYT1JxSStEU2c1?=
 =?utf-8?B?aUcxT0c3NWt5MWN0OE91SkNwMWthRlMwNUs3QTVySGsrY0VGaU9jS2xxWTJZ?=
 =?utf-8?B?ZkdHWmJyWE4yZ0RTbkNpc3ZmeFBtZEZ5bE5jdTBDRG05SjkvYllaVTJIci95?=
 =?utf-8?B?TTYwS3hYK1JnVHpCUkZFcmtKaEF3cVF3SjNPSzlndDRKdndlT2djUjd4T0Zj?=
 =?utf-8?B?ZWl0TFpTSTBJbnVSUmNUWlJ4QkFFcXBnSzl2RklMNWN6OXFMaTZCS1NwMXkw?=
 =?utf-8?B?aVpMK21nK3FIWXNOVE0yMGVlQURmOGtJMm1FTC95VDRBaTN2Q3VJdHJsTDBW?=
 =?utf-8?B?MHVDdDY2MFlpemgzT2VvL0NTVUF3a0JCMEo0Vk9aMytJSFUzc0tsOUd4aGxx?=
 =?utf-8?B?WjZtN0xqb0VaQlk4VlpEdDdQNmFFVDVuNlA1Zlh3NmczOVBXNUtxOFE2WDVE?=
 =?utf-8?B?Wmt5Nkl6aFFKaFd1TTFoNFRKYVJCeUNBbjVjd2hCNVoxVlBwUENkeElJR1I3?=
 =?utf-8?B?WU83TTZPci9Tc3A3eStSK2RSY2dYMmQvWDcxS1diZ0FkKzdLcGR6bHRJalZB?=
 =?utf-8?B?ZlRFcHNXZWR3NlJyMzdNZWJ5RHUzOUVoZ2NaUE5BN3pYOFNiTEpGdGJ3WGs2?=
 =?utf-8?B?WlR0T1l4UVFqRmh1c29uUDNHcndaVUloc2ZzbTdrTGpUVjBZTjROclJEQngv?=
 =?utf-8?B?aVZsc21QYldzcWFwM3pqa0FFYSsxeENsSE1uV1N2d3dGbDBmQmkydU1VbmNm?=
 =?utf-8?B?RzI2NXpFS1dNUmZRU0lEUldVb1kyWjNlMHFGOVJPWURGWEkyK2sybjl1b3ds?=
 =?utf-8?B?S3Y4NjRZWnJHaThMdW9aVVlDRVNDNjhNOVc3VVZQbjlyTGxDU0VBaDBncEtw?=
 =?utf-8?B?cndWc1NwK05HUHp3enphblBkMzBYeVhsTHJWRVNTcnljWWJIUkdhYmhLVnBt?=
 =?utf-8?B?UEhjYnN5UlBjeHdCc0Ryc2tBMzhtNEhLUEQ4R1dSUllOUmtFU1VtSmxoV0Jy?=
 =?utf-8?B?eUIvanZ3Q1lIWUJKUzlNelpRTmJFaTZuUFpuSDdYR1BOc3ZWak5TeGFvRmNN?=
 =?utf-8?B?aStaVEVBM1BYL3hSR3k0Y0NRZmY4dGhaRisxN0d4MjRjMzhaOXdjU0xGZzdF?=
 =?utf-8?B?RDJNNWZwWWZPMW9kenlIS3NNRy9POUxZVG5tN3owZlFOZFVRWmtVRnpuampa?=
 =?utf-8?B?MHdaVnJueEI4dEpMSTBVekZRWllNaGVpZ3NLM05yZlZUNTc4TDN6Nk1QZFNP?=
 =?utf-8?B?UlRHV1RyZ0kxN0E1Tm1jcHdKUTBTTGNlRjgraUcxYnB1cjRVRVhaUW1KNjY3?=
 =?utf-8?B?Si9URXllL1Ayb2kyWWZoZTZKcDZYdERHU0IxMjUyd21FWkViRTltZ0J6ZzlX?=
 =?utf-8?B?dkwvNzYxSWdHcUw0L0R5Z2l6NUZWQ2FwZnpjYXJidnZZRWtnY2l4V1RUSTdw?=
 =?utf-8?B?a2psQmlCNlZ6eExIcWhGdjlUemJsVjJqUGR1TW5TVytTVjdOZkhUb3hkV1p2?=
 =?utf-8?B?dkk2VnlGVExsZEs1b2FWYllDUnpEejFMUHM5Q2UvVXBmZmFLOWFFYk1Wdk1J?=
 =?utf-8?B?T2dLc21PSDNhR0dQbGQzWGVHNThXTVZMc2ZjcmVPN3haQnV3YkVuQ3drdEts?=
 =?utf-8?B?SXQwRXBacW1Sb3JOc1lwNmNxYXRMdXJyaWJramFNTmwvNmswa0k1dDhNb2d4?=
 =?utf-8?B?NldZNUJuaERKb2VYYmM1dVowV2UyeXZWUlBkTzlMMjJUMVJRT09iQzhrK3Y0?=
 =?utf-8?Q?kSNBSlE2BQBh45Cx0jy0rWXTZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd54dde-d634-4210-1cf0-08dbecc8937e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:37:21.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QxOGBRXbu1EXC/fmPoKL8MP4g4zK7C9XgqW4yvTx4oMjLzkXaWH8QGaQVfouWnJcYkvQ5aH0SmO8+vuHrL1kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8526

... or we fail to enable the functionality on the BSP for other reasons.
The only place where hardware announcing the feature is recorded is the
raw CPU policy/featureset.

Inspired by https://lore.kernel.org/all/20230921114940.957141-1-pbonzini@redhat.com/.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2543,6 +2543,7 @@ const struct hvm_function_table * __init
 
     if ( _svm_cpu_up(true) )
     {
+        setup_clear_cpu_cap(X86_FEATURE_SVM);
         printk("SVM: failed to initialise.\n");
         return NULL;
     }
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2162,6 +2162,23 @@ int __init vmx_vmcs_init(void)
 
     if ( !ret )
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+    else
+    {
+        setup_clear_cpu_cap(X86_FEATURE_VMX);
+
+        /*
+         * _vmx_vcpu_up() may have made it past feature identification.
+         * Make sure all dependent features are off as well.
+         */
+        vmx_basic_msr              = 0;
+        vmx_pin_based_exec_control = 0;
+        vmx_cpu_based_exec_control = 0;
+        vmx_secondary_exec_control = 0;
+        vmx_vmexit_control         = 0;
+        vmx_vmentry_control        = 0;
+        vmx_ept_vpid_cap           = 0;
+        vmx_vmfunc                 = 0;
+    }
 
     return ret;
 }


