Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F67F1826
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637076.992781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56ne-0007OE-P4; Mon, 20 Nov 2023 16:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637076.992781; Mon, 20 Nov 2023 16:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56ne-0007Lh-M9; Mon, 20 Nov 2023 16:07:02 +0000
Received: by outflank-mailman (input) for mailman id 637076;
 Mon, 20 Nov 2023 16:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r56nd-0007C9-FC
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:07:01 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe16::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b16c17-87be-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:06:59 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8758.eurprd04.prod.outlook.com (2603:10a6:10:2e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 16:06:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 16:06:57 +0000
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
X-Inumbo-ID: d5b16c17-87be-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETFCMp5EtyXdNW/xb2caB643Yd8VLBL9dsgfrWrVkeSrwNb8qE1FQUQ7DwiGJn+A7t4kIlHJHY0bOUOfudHWymhesoaTlbpitkTXZF/dv44MnZDMdqatFcUYowyx7a27URKOUPBr/ThHgRuNwsldY7AhPB0GLqQTfy1rfvkP98itzuwrpCBok7a2jcQMPMi4ycFdyPYdAd4Mu8RvF7JVHWLb7hpNhk+AdcdhUVlO/Yi80ET80LthFACf3sL7F0cIwRNq5wvZaM1pMYYSGCpWnbmG1lWeuV1ALjZbOzYA3EfWEGBgEEsNTuIRyiqN+aAmO+9J9u8QOSzDGUjRCvX2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etcYvFyZck0gAecVyGECofQ+De9b1SDCIDyHr3EFwJE=;
 b=Rm8VmbHpxH5faXCOMQqItlDAjUFPnILoPl4qNAcmcolTQ2FEJWhNGV3SfcZxOaI64Yiv7LSPZCoiBhFm8vGAO0kK1dbXsVV3gZc3pmSg8e6kcIENXSD73//AcwxDPxCSZNrjXNTVdG6tms6+kb0TUrX/iN9HtPo+VhjdBe41rCNcj9bC+y/iyD/H5+oBp+1Fq8LxFMgwAjEMaLWKUIvUhptu+/YsTKrTuRrePMz236GEuLBU7amuZuDkpJPu/esvCPDyNllhED2F9Ue9vqKIdug4TXn1XQDTY6YODPlzWsPMOOB5yetAd464xBb9CDK+U/w9TVhbKj1nKAq76EbkRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etcYvFyZck0gAecVyGECofQ+De9b1SDCIDyHr3EFwJE=;
 b=XWnSWs2Hg6dqFXMVv63HMoeiJnCjY8AJkWtrnWUa/3MVDpHCwoz5gy+ADkZ/ayskRwFsViIL/uY3SqZ2Hr+arO9LyS6MCIOiW8MNnnjF6qvklYIYJ/o5ZNGov50RU9jadvutBYN27K+1kd+kPCdDjQ0f9IjGgR8aYdAma8fpQRlZH17t7mKCb8g4Thmjz93RGeVoioWjahPwOS9/WTUQYlO4VMiGHb9WoNuWuX2LO6/v5lbHnwEGKWrAfEKOjVo22Ttj0Gx8Bc1NElTjgsZy8Uz+g74k6FVti+B26uKw5qsPI0ezbjvMc153AA1it7Y3rfgLheLQ9RGzWjk1L/LJzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ad91848-4dce-4654-9d82-e24ead7e7063@suse.com>
Date: Mon, 20 Nov 2023 17:06:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ioapic: Check 1k alignment for IO-APIC physical
 addresses
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120151006.168773-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231120151006.168773-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 77314d62-d297-483c-1854-08dbe9e2b895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycCdzZo+I9wpFR18O14W72ME4kybg4JXXDT+sKvsdGeH75tc5rse767CFQVu0ToD1sQcoeGfqeBZwtmnxNR7zP7b+Jh5utgvOgenEwvtB90ia9m5lQ1QW+4wShIkGCyVXa44Jd/8GcB86PLEAs4A5o0uHU0Y3yTzbFdGLf0Z1NwchapyYf+M2BLxFS5DyxkCz/hrXNzEyyomlvk0AH6w4Idl9KirCFwSuP0vnga+0bj3PCfarXqrlY7dXIZnHYyd5383fJyA+8hOOzPYT3XdDHLuqEbbKwUJG7rZtXFZ1UBk03Zf+wJLR3eEGwiXpvlOoMEMkqfF0agvqSMQlLCVsfM9VQaWISxnWJWyBUhHXvLsjoF4EXy03XiqHlnVVVCdg4WtZ2RAS+ahf87cL22EVu13A3+Z2ADrlEIY1dIN+ST969yO+xWgkw0qK+XoP8ObsLRRhYLUxYAS3Drhtb7cZtc0GE1ZdakmGeMTSiGC2Tki4kCUK11CwgCPBuqWVfxUjrApmM5CFvsPCFNgcVBOcB9/I9NjQq2Sj0RGpHbbsWpVw4aWhNmTK/izkSz5tfiwJOEeHRxoPvMgpkwDDAujQEmlB9olhPasrg9119vgptdTHzZMqXuaqnJROK+IIh2ssFsDxsv6sIaMfHRD+y8aSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(53546011)(6506007)(6512007)(2616005)(8936002)(8676002)(38100700002)(4326008)(66946007)(54906003)(316002)(6916009)(66556008)(66476007)(6486002)(478600001)(26005)(31686004)(31696002)(86362001)(4744005)(41300700001)(5660300002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVl2R0dOSFNwS0hyU2ROeGpnenp1TkdNV1dEcUZkb2xPbEVhSzdhOXJnWDQ1?=
 =?utf-8?B?NVovZUE2dFVWU3U1NlJmam9EOG5QVk5qNnBLSFVtT0RLUm0yY0ZFU0RXenRS?=
 =?utf-8?B?SUdXM2NCNHhFVmVpUGVCZXkvU2lyOFpKUnBOTmtxTEoxeTJ1SFhCUm1qNEVz?=
 =?utf-8?B?Y2ZWc04wUmJyZVE0NzEySU94TWdjUThZWUFlZkxsaFFLcTUwM2MrRzlpbFVP?=
 =?utf-8?B?M3VRL0paSWdHT2JnRnhtWjVnNzFBNzBtWDNxR2dpdWZRbllQanRmQ3hOYVN0?=
 =?utf-8?B?SG9ZdDdNV09EcXh2MW9kb1pVZlQ0UHJVWnZDTFlVZUQrWnFLMEhsYzFVMnZI?=
 =?utf-8?B?emlrb0dncFBBVGl3QkMyeDMvR0hnRi9tZVFYYVBXcFI1RXhDRW5xY3ZYRlB0?=
 =?utf-8?B?TmoxZ3FMQW44emRSZHJPVWc2OW1KUitpcFV0M3ZPVnpaQlFPbTVqeTFJSTM3?=
 =?utf-8?B?ZU9sUytCSWhJcjM1TlZuV0RndkNhbGNkaVVRdzVBaXBVRGpNa3RheElaVURk?=
 =?utf-8?B?bW9IbHRmQ2RaL3RnTi9aU2NYcTZXUHhLRXN6NFlXVTd6TzB1eDdqVEtFNFpG?=
 =?utf-8?B?ZGoySUdyN3RCUi9kdVZhZXQrSHhyRG9nWFNLdXIvSTV5ZmVLRVFhNUdDbkE2?=
 =?utf-8?B?NTI4eXJBdFpFeDNDVnF5TzNFaUdrS2hHSGZhMmdMN3JsdEdQY2VHZVNHbWd3?=
 =?utf-8?B?T0VhT3l3RzdyOEtXZ1psMW4raCt5OXoxZlFLR3ROL1Y3ZStmbHRTdTFZWU95?=
 =?utf-8?B?OU1uSEllMVk3WWRJc09XY0tObG41WVp4SmoxREtFeEFHL1NoRndIMUFWdDNL?=
 =?utf-8?B?cnJEU0dwVy9DYTNnczNvd0hPNDBYZVZlMHNFWnN2YXh3aVRBSkR3NHI4YTBJ?=
 =?utf-8?B?eGpPKy9SY0d1U0RidHZhcXUva29wbzZQMldNbWNFNE9MRDFHbUk0TXN1Tm9n?=
 =?utf-8?B?di81VW1MOU5yYkVHNTZvVGJiRlZKNWk1YjR2RXJjU3ZrOVEzS000OXp0QURh?=
 =?utf-8?B?dlkxRnJteEs1emttcTBmWHlnVXRYSlZiVVpZazVtQk9JQ0pvdDNIVlJIMGw0?=
 =?utf-8?B?em4wYnRqNzcrWHVFR0MvMGo3SDNJbEkwcGFWSFluNXFtc2VENVg3aVp6clFQ?=
 =?utf-8?B?MlBQcDVuTmg1OVB0Z3g3ZWVvQVR1dXJLbGNXK2xLQnF6UnErVm8vc1BxRGpv?=
 =?utf-8?B?YTVDKzdmMUlLTVg4dldIbUJ4NnBQY29MNWVlU0ZUbjRCMkhSWWhGemlWVElo?=
 =?utf-8?B?WGFEaDdTdjQrdWl4NEZzNDFKR0haYzBVRnBVRkxnU0U0R1lSaloxZzk2VTlr?=
 =?utf-8?B?MDRHNlhkSXE4SmI2bDgraEczcTljL1RHMjVxSXdOMDBFeHRnL28wMWlQOHZ1?=
 =?utf-8?B?cXpzWFB0V0hqQlYwdm5DeitoUjc1WlVodURBMGthTUNsRG1CeDJUcWJyd25M?=
 =?utf-8?B?NjhvRXNoYUpmRGJTRm5WTmkvM0tKQjF3bGpZcFNEV1NXRGsxMUlsZ1VvWDRN?=
 =?utf-8?B?OU9mZ0ZRVGpsS2V1V0xVN1ZHb2J3SFhseEdvT0w5U3lPZDhQUDBZaUhzeEFi?=
 =?utf-8?B?Zlp5ZXRDekpBOUxvSXBVcXV6dDdDNDhNZ0pCYlNtV280VkROY1N5a1F0RDJU?=
 =?utf-8?B?Rmx4TzNZdEFmREFLRXR6NFNqU1BQL0lZRXVISUNLendQbERKVEdqOFRDQ2I2?=
 =?utf-8?B?MVFkUWJtYzBzVUpHM0ZoK2ZtU0ZjWG8rTDcvWmp5NExnYlRNRGdhdHlXWnI1?=
 =?utf-8?B?dDAzbmYrd0lXd0tzM2dRbVo5OTNkRHRtR2dBUWpodm12dlExWitJaE1YS0Vw?=
 =?utf-8?B?QmJNRDNaRURFc09ELzFvS21zMmQ3VDFCSFRVTEo0S2JKRUFOeno5dkRDTEpH?=
 =?utf-8?B?V251bFN2cFloN1RRVUxWcXFKUml6Q0hkR0N5eW9NeHZpcEswRzBFQzVHZFJt?=
 =?utf-8?B?eFZLMjg1Vlc5Yk12VVNVS0hmT2dsSFhkd2lhYUZSNWx4UVJ2R2RQaXVhRk91?=
 =?utf-8?B?U2tlZlIxWVp0OHFkNEZMUmxVbVB2VSsvcStKRG5WbE5ZWW1RUHRtSXlQdW4r?=
 =?utf-8?B?MUpTZCtPTWRBSmZGVFl0eGZZUHZYSDdtTVhqK3Q3U1loUTVnN3dXbEtCZjJl?=
 =?utf-8?Q?O29QgDQEyXw4xKpIvlmeZfyXa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77314d62-d297-483c-1854-08dbe9e2b895
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:06:57.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWqxjA+QshNDroXds0xrWcP+39rFpiXCDmQ4p+NyfKshgzM56GUkH2AscPE7O3U+SXWb/aGZd7TcBmNRpa6aOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8758

On 20.11.2023 16:10, Andrew Cooper wrote:
> The MP spec requires a minimum of 1k alignment.  So too does Xen's use of a
> single fixmap page to map the IO-APIC.
> 
> Reject out-of-spec values so we don't end up in a position where a bad
> firmware value causes Xen to use the wrong mapping.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm curious though: Was this observed in practice?

Jan

