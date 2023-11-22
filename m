Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1372C7F4082
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638533.995176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5isa-0007yV-0p; Wed, 22 Nov 2023 08:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638533.995176; Wed, 22 Nov 2023 08:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5isZ-0007w9-Tw; Wed, 22 Nov 2023 08:46:39 +0000
Received: by outflank-mailman (input) for mailman id 638533;
 Wed, 22 Nov 2023 08:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5isY-0007vH-Ac
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:46:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a50cc19a-8913-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:46:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 08:46:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:46:34 +0000
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
X-Inumbo-ID: a50cc19a-8913-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhE0H/wHbIXkgv/LpVmIH82FOYG2QlS0B+J8j40CiyHf/EKy9BSWH/F2S2UYr5h+spd5O1WzxDqS63n3gPYjnXoEfjo9QUKHFSgFqyYTcGvvEe87T47i0LeypobKKp03R3NkQgPhbisf5g+IZob+zbPUvPV/CTa48veiU1F4T+TWiwqTeBmTd/i0ERmWk/qx6WEg2Tqp39ZVbL+NimkWJbaEbCHun8HVqUdRYznfGAHL513VFqStnShQDysU8LwpCWigdJxaCLurEEd1RQP3K1c7vysvnhiEgmkspxgr8YD6nIbwSrM9c2RBgnpTlTrZhe+MrmFrkZePdH3M8iPFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ag/W+3cXpV5c6W32UxHMkxy+4hgfufiUKjIJ493JMk=;
 b=CiIgBEYah48Dy5tdMQfTkmTj8J3IPQLV1E+MSkGkGuUSSf3M+Yr+TygWhJsHuD99dZoscAmGrH72uwIeMWwMo3vX+E6OxJluG7B5P6p1U4Iz/KNuxDwDN1ZVm9Ti4RNwiYR8iNlqBKy8D+a1FlZ9E4zCAECmc0uXvxGZDw9ai+Ar1ks5Rps8i4JdcruD2d01a8vxq06e0qI5mcSm1nUmnoUYA6UAg44gU39/7V/iaVsy3CfbjiCn/YCkyMqM19hs971g/G4nKTh+JDQJJJtDgcFuhLqLnu5G2Hb1b/lWNbEOaBzHu60Cuwq2hAgH7JUTRvPPTuL9jOB5WH8WuaLgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ag/W+3cXpV5c6W32UxHMkxy+4hgfufiUKjIJ493JMk=;
 b=3SlASFpjAYESMFh1a9EzFfbd4IthN/wDerbh/pxP9Pde8oEfqNNmoriY6GLMmi+yQxPXXC87yymiXdiXeBcxFeRF2aAXWZGiKxRvMYHK/pHoOWqmukT8PJOJedhhNWLko2RNd3mpjbwhLVrcMDwiUXs/sdlTrJXWGmoLCbZanbYToX2X85Ycqyg1qNe9ZL6TO/SAUJfHfnni3vNsUF1aNlODXTbBpCAGYT7Ozlf4G4f7L+I+kqfXm3baLXWwTFZF4eUPu0KrRTS2hv+nyvN89dXag77W9CBYvUhIIv3XVV8k12Q4Pqsuph2p32UGJqSI8lQ6tKPbfRd4YyKCr/i7ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df7fc33f-4d2f-4087-b2ee-67cb2573a515@suse.com>
Date: Wed, 22 Nov 2023 09:46:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/efi: Make efi-boot.h compile with -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-4-andrew.cooper3@citrix.com>
 <a17c5268-fcb8-49bc-af68-a6df2227d48b@suse.com>
 <c9ce3570-c4ea-4f0d-b8ec-9a74d2c0e569@citrix.com>
 <679b8fde-1d58-4ae2-8b22-3f9c50ff8f1a@citrix.com>
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
In-Reply-To: <679b8fde-1d58-4ae2-8b22-3f9c50ff8f1a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bd6c3f-651d-431f-b558-08dbeb378830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UkMh4I/fWV1+RcAcJKgIT96vRSxq70+dCnn0KtiQwxtQU3YRPwQnI7yuDA6kMqF+wal1wEMGpmiyE2hEGwXelSZLI1CEegeMA04lSLzds7U1BMF0MDUU8NXCu367LuL4T1hVuekal2QT2AXfkhRr9ehEopWxJm0np22iZ8Ah2o2CdlieiwFTdh88k27s8xQc5iuj7zUfgTCyKbicBzeMeNgvaKKwkHJqEICd5kg7qhuAC/C8PKHWuKpng+sNqnW2dtS+iAUtDqeIfpTtmp9snCeGn62xA9t6oK1yhObXyiwtxGudSc1PDRBWUuTRwgh47f/NOFMUn6BQ/th8PHqaRNEhJbQePlIucL8uYqkKyS7rgl/uaoQCCiMnzJcblkpfQu0CblSV+dAiT0yAyI9ZGri7WOpPInMTwITCgXWpe3WyiESk49mC71FR0GouMSFBpMPOof1EO5Fd2JgFEZHuUzduGozSaVP6/revUprn11J3ywg00RsJhKaFhqdGg4VIQmjy6+luz0C6DjSQazXbI6RFZ1coKlZ8oCzLtMB7yf8s8XvVqNT5PfHOeHMA9CrBCF8+G2Cd6En58M0hJsSOHCAdwvFIiN3isNXLxZn1u0cCiIP4Nj6j6H75Q147MdfY2q0KHT2rx/lVFYzTAonZKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(5660300002)(7416002)(31686004)(36756003)(8936002)(8676002)(31696002)(478600001)(6486002)(86362001)(4326008)(6512007)(316002)(6916009)(66476007)(66946007)(54906003)(66556008)(41300700001)(38100700002)(2906002)(83380400001)(26005)(2616005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJLUEd4NzF6Z1ZROE9rdW9QTEF3eVA2elhnWjZnTlNDRk5SRDRwOEtVOUwy?=
 =?utf-8?B?bTl0eG5GQWV4Q2RMaWtadHJjcEt4QVM4djZQTHRaTmhENlYvUDEyVHJ0TUZ0?=
 =?utf-8?B?RFowWE9JTnpYbEZWekRPYmFCY0ZkOEtuRkx2clhyWjdrTWZMaWZrY3B4MU5M?=
 =?utf-8?B?OFZFU3ZGRE5wTklSaVA5M3RSZUh6b0ZOUWI5Mk9SYmNFTDdJK0R5THFON2I5?=
 =?utf-8?B?dVB2QWkxTWpFVWRLWDVzb2tsTWFidElzbGhERTJtYVRmUGJLNnFkNlRjYW9X?=
 =?utf-8?B?cDFjNGoxRWZmMk95czJoMEd6Vld1cHR6clhzTkdCUm5mcTkzY2RMZ0lQcWkx?=
 =?utf-8?B?Rk1oTldoeE5Zd3UvUUZlcTVoa0dwc1duby92NE1RRk00ZlJuVm43SVNQcVBI?=
 =?utf-8?B?dk0wRml0dTk2bG5acUc1K2hZczRUcms4UnpTOWM1UjRaYWJlZlRBU21OSDhB?=
 =?utf-8?B?WVdaYzBlYUozK0IzejlLbVc3UGZjMVdHbFJwbW43dkJDNTVtNnpNNXFaVDZD?=
 =?utf-8?B?cFRvMFNyUEppU0s3Yjg3TDQvMmN1aDU5Y0hmeFlOY3NMKzd3eFZKTm8zVWxG?=
 =?utf-8?B?ZmM3NnduWm1qT0habENVQityM0pIaTcwamhrbUFTVW1PRCswTE40RDNaSUxy?=
 =?utf-8?B?WmxSRWk2NXk1Z2FXVEdxd1dIZmFmQkx5bWZpQWo1VHNaUmcrTHJidEw4Zytz?=
 =?utf-8?B?SU1TTzcraW1UYm9mSkhTUEg5U2N0cGpaTGwwTkFrUEJyYWhjZzFGK3JncEE5?=
 =?utf-8?B?d1lnTTJ6Mm5ZUHo4S1ZlQ2kzRTBpLzFsQmg3KzVZOTc1ZStramRoc0hnU2lv?=
 =?utf-8?B?Nko2UTF3Zm1nbjYyZk96cVBsMldic1RpbFhRdUtIaWdPempBOWl5ZSs1YXBB?=
 =?utf-8?B?ZlFqUzNtN2UvRHFXWDFJdlBaWU85QytvSkN5MlRDcGJrdzJjZlYxREQvck15?=
 =?utf-8?B?R1UyQ0REOE5mdVFVNmtDVm9LVTljVTVMcjZaV1ZpN3NRV3k2cHN0d0pyUmhR?=
 =?utf-8?B?VGZ4djVWQlhaR2VQV2dWRmpKT2VCUVVVRnhtQWN4SlFWa0kwaEFKSTN4ZkMx?=
 =?utf-8?B?bC96UmFQTG1pTlA0SVpsRkc2V1BIZXVyMkxLdGZmK2FRMDdRbVFndEw2SEV4?=
 =?utf-8?B?a3dyZlhadEJVendKNlZzVmJ2UWIzcm0xWUpLbGV6WXVtd0x6M0M3RzdzZjJS?=
 =?utf-8?B?NHh5cXk0VDdienlVcllCTk5ZQU5qbkN2eXlKU1ZtVURUeXltd3UxZ09odHJu?=
 =?utf-8?B?emI2bGZrOC9wWVlKUklmdCtxbGFIbWJkRGowMXZ1eFJyVFE3eWpsRStkWjd0?=
 =?utf-8?B?Q29oRzFBandTa0U2RGFIK24zbmUxOWtabDBDM3pMV1Y3Q2swYjdXaHVlR0M0?=
 =?utf-8?B?QitqZW5aRVlLWmNpdE41OU9LbjNrU3gyNVpiWW5hVkhRV3RsVStIKzNzRVcr?=
 =?utf-8?B?Yll6L3l3VXpOZS9iQkRJcDMxVVFlbnJXb0NDUHZwZ253QnZjRGplcjY3WmNO?=
 =?utf-8?B?dkpFUnVlRkZEZUhZV3pJaE5nVXBzMDNWMFdFWnNqQWlNVHFiKzBZYmJNcTVa?=
 =?utf-8?B?bG93Z2Y2MlB6b2ladCtKMjZEUldjSThSMTNNV054K29oUHpubjdtS0VOZG9k?=
 =?utf-8?B?Mjhqc2ZUV0dpMkpNZ2QvL0tjeGVqNkdqeUlEYXd0UlVnOStxYVcxMVJKTXp0?=
 =?utf-8?B?WHhIUER5TnB2bURWY1R0UGx4V29pNGVEdVBZcmExc3R1SE05em51OVFybWlX?=
 =?utf-8?B?ckxlOFR5K3lmZmw5T2hMYkxOTmtUVndSY0M2OFhhdE5SOXk0Yk03SUZqN2ZH?=
 =?utf-8?B?L1NNY1pRNUxzZXdTcytsajZzdzhtTUg4RUg1K3ErZ3EzZ3YySldOSFZ1TTUx?=
 =?utf-8?B?RGREaHJZMk9vek1yNHArTmNaL0JTd0tHSHo3MU5xMUJGNnJ2WWRuSmJwYnBT?=
 =?utf-8?B?WUhmNm9OZStETHdINytKdm5iNERSUnN3NDQvSWZ1aWk2bjZNNlBBc1p1bXFr?=
 =?utf-8?B?UXhhNWxPMVZxbk9nMUJ0emF2NXhyZDNvTzlMeUlXVWFjZDNSYlE4QjAvL21X?=
 =?utf-8?B?cUdjZ1BTWDluaUJsdXFEU2F2YnVlMUtxKzdiY0VLN0tnRW9Dc2N4ejQ3TmlS?=
 =?utf-8?Q?UBuR7E97j1ssi0omjn+lC2zrD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bd6c3f-651d-431f-b558-08dbeb378830
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:46:34.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cl/3yr3BnTzbqh4i2K1jQC3fkGz3qYzcbSDFQNS3vtEVUQ14ph84d1IztgtnHuMUyYNE9L+E32nnU9NhRtqkxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940

On 21.11.2023 20:13, Andrew Cooper wrote:
> On 21/11/2023 6:03 pm, Andrew Cooper wrote:
>> On 21/11/2023 8:40 am, Jan Beulich wrote:
>>> On 20.11.2023 23:49, Andrew Cooper wrote:
>>>> GCC complains:
>>>>
>>>>   In file included from arch/arm/efi/boot.c:700:
>>>>   arch/arm/efi/efi-boot.h: In function 'efi_arch_handle_cmdline':
>>>>   arch/arm/efi/efi-boot.h:482:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>>>>     482 |         name.s = "xen";
>>>>         |                ^
>>>>
>>>> There's no easy option.  .rodata is really read-only, so the fact Xen doesn't
>>>> crash means these strings aren't written to.
>>> And the consuming sites confirm this being the case. Hence ...
>>>
>>>> Lie to the compiler using a union.
>>> ... to at least slightly limit the lying, how about ...
>>>
>>>> --- a/xen/arch/arm/efi/efi-boot.h
>>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>>> @@ -479,7 +479,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>>>>          w2s(&name);
>>>>      }
>>>>      else
>>>> -        name.s = "xen";
>>>> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
>>>>  
>>>>      prop_len = 0;
>>>>      prop_len += snprintf(buf + prop_len,
>>> ... you also switch to using name.cs down below here and ...
>>>
>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>> @@ -324,7 +324,8 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>>>>          w2s(&name);
>>>>      }
>>>>      else
>>>> -        name.s = "xen";
>>>> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
>>>> +
>>>>      place_string(&mbi.cmdline, name.s);
>>> ... here?
>>>
>>> An alternative would be to introduce 'char xen[4] = "xen";' in both
>>> cases, and use them instead of plain string literals.
>> They'd have to be static, or dynamically allocated or they'll end up out
>> of scope, wont they?

No, place_string() copies into the target area. The input string then
isn't further used.

>> I have to admit I find this logic very hard to follow.
>>
>> Furthermore, I note:
>>
>> mbi.boot_loader_name = (long)"EFI";
>>
>> which is exactly the kind of pointer which is liable to end up being
>> edited via kextra in the other patch.
> 
> Hang on.  place_string()'ing here is just to prepend a piece of data we
> go to other lengths to strip and ignore later in boot.
> 
> On x86 we can just delete it and make our lives simpler.  I hope the
> same is true on ARM too.

Well, yes, the prepending is just to allow uniform handling later on.
Surely this can be done differently. Again - I'll go look at v2.

Jan

