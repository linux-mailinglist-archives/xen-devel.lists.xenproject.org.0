Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB857F74B3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640688.999274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W4z-0004Je-PH; Fri, 24 Nov 2023 13:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640688.999274; Fri, 24 Nov 2023 13:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6W4z-0004Gx-LE; Fri, 24 Nov 2023 13:18:45 +0000
Received: by outflank-mailman (input) for mailman id 640688;
 Fri, 24 Nov 2023 13:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6W4y-0004FV-3t
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:18:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd5781f0-8acb-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:18:43 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Fri, 24 Nov
 2023 13:18:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 13:18:40 +0000
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
X-Inumbo-ID: fd5781f0-8acb-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuBGURx+157kepsNCLnDKXhKZy1ZsIkDqOtfEohYL6R1ABaOnUWOUfiVgVop8zM74xG4TKBjB6E7Z8j+/1Ld1POJYYypVdzh3o032jUsS/sGGhRP7Sf5Z2SKMO8lwkMNUTAc9jLrzr9QfjN+srbxeILd1JbvxM3qbGiSd4Nmfq5p7jv2L/dwdHyXB59FsNJE+z5zvpn03+FFNxPsdaoI/XZ6kJsMCKRT/mH/362TJ3Ag+VCtGNA5PU/4/gAe+5WbhY1zB6dZ5jJFdYdqvRXZDJHOVRSJ4cU7ubcyRcJT4G0aF2vugK8hh8br02YZLuyUe4o4fwTp3TdVRedx9S1P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1yRHYVPpqqoUk8sGtZwi/QaG5bP9kIgK17f2AgBkCs=;
 b=DuWjEs9vkNvNdU/Y3IqJl6c+UDYPlj8/dRll+x3T5JGsWzK4DtVQLcw6tlnHP2+iuzhGW4UoMMWFmkOFCrxDLkEXszuQ7a+bVxUSmRlGkttKgRF84Pe+1J6Ji+7hRwTLxZ9TnYnHnAdGb0lvFj+RvgYZy1D67RBb9nWAEWf/AHVjWTX0guYrzgYGt+8w3VsWCzYVKeF79aDHJWgmN96JYtT0yr/7iKPzRfLFjITStwiDLC5PyQIbdQw4q1bdsM1sV/39/aZLbVghxS1zjlgvKo3WWB1sEftRSsNixWEapqdUa0O7iMDkGQ8gZ7gJYMNg0X8A1xpQ2ioXR4oes/vfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1yRHYVPpqqoUk8sGtZwi/QaG5bP9kIgK17f2AgBkCs=;
 b=cqhnUAJPHLyuoLSx5wjl+PECduhlqmjnsMPDroq3h9fPJ6DTY9ajc0+vdaLuoXZJYztVb4knjFkrQOsCBzuE5IkKGWWJN0po7YRmunZUHkZckvdxUQUM9a+Jmlpp49bAvh3YWHM37VlBxkL5m2mcz3BGmoRYaQ4mDQgxCAvUgsE7YtlRG8G9q6ykTH3rvC1wqEyyrZCTvpLbM2+5J020CPYOembV4Vj9HR1E+vByCGWV7dx6lLtMFVCT/1jDLro/FCTJeovAUPkJBuwjrKtpUo5gaEGtLoLvcMSVFAcVQj4CC61yJnhJzcf5sAkS764xIgIAJur+wTD7AQEJ710K0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f37ac1d0-888f-484f-9e74-40699cd3a620@suse.com>
Date: Fri, 24 Nov 2023 14:18:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] xen/asm-generic: introduce generic header
 altp2m.h
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
 <5a1b98cc-cbda-4355-87db-9aea12d21d73@amd.com>
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
In-Reply-To: <5a1b98cc-cbda-4355-87db-9aea12d21d73@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: e973ada3-c6a5-4633-47b0-08dbecefdfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MmOBXtvgCLGZqYRZi3bI13x/m7q0fSUX9p6I0l/Bn5ubyYH6B5yLemLKGPzWs/iZQ/YiQnUzMgaNNQtKhEN5j7SRjo6twUjWBbhBxUX5yJ4nvTaN4J1jICdjz8nqi00byhuC6ry3+all0bBRnZ1K0N811gzr7gP31V9Inb/tYRsk1cOljq4Chc3kQqyE+dvH/v56B20YgnqHfm9vRLrt150gJJyvO7yi/pOFu3+wu+R78LZgg1goQFLUoh5WF7ZDmNS6+vUmzEXNQcCzqXBnIcdnsnVi9DqLcXUkJy0/MluoGCZGuobKfDVO/E4Kvay9z0dXTEU6MUAIx7PWlYYD9cBZaLHIOzjplfg+m9u0UTCuoXBDTCc1uJnu1rHBc3j25WtO0MuKl9UuYhvELoUHALYRcBVg4POzfNj38m2Yu1/KunSK4sy24+ErQZZ5vJbmDsy2o2wTLv1SiwoTfOC6YHnFWX0wIKz/6vl4OHZR13pBVORDtYXKSxQEHhsQgCtg3Gtf1KTlVO3BeiDh3cbBbut+Df7QslBxK40Z9MSPdBba5FkTAFxV8Uh1n0R+PotOq6YeZQerXXy7teIhBMiY1B0LJBaC/+QfTRpXu5OEZDpqrCs+dR6XF8Wu9pLv3TlSRnISRBGYwX8JRUdLJRsd7HvrAUFP60Abt9xXh3cc8Us=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(66556008)(66476007)(66946007)(6916009)(8676002)(8936002)(54906003)(53546011)(316002)(6506007)(2616005)(6512007)(478600001)(6486002)(2906002)(36756003)(41300700001)(31696002)(4744005)(7416002)(5660300002)(86362001)(38100700002)(31686004)(26005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmVNRVp6Zlh3WW1hU00zME1FV1pDR21CY1pTVUNtVWMwUmNxTHkzQXl2MkNJ?=
 =?utf-8?B?T2RNMEI5NFAxZE0xY0RBV0VSTWJ5djdKSDFObUZadVg2V1NZNS9YSXZxTG5Z?=
 =?utf-8?B?aTFCWDVuMVBkL3FxN3owY0NNaGxwSUkreGpIcHdaV0NtV1dmdzAzOTdUR1R3?=
 =?utf-8?B?ZnZiWDZVcUowb25lRUwrM3lDSUNiaXN2L3pMcG1LNmx0eGFrOE9lV0l6c3c0?=
 =?utf-8?B?dDFNYkdNaG5GUGEzbXNnYU1CUmNRK0gyZGl5Zlc2Y0xPNE9DSEdhRG8yZEs4?=
 =?utf-8?B?Q2ExbXVOd1FnaG1wdy82cDB5MHpnNWlSWDQ1bldlTmJTK3hzWGhZcTFNVWls?=
 =?utf-8?B?OE1SeWJQTk93K2hJT2dsd1k0Zlp4bE5IMU5NdjJ3SXl0dHBNeHdmWkhld2Mx?=
 =?utf-8?B?K3dDcTNKVnZrWG9PS3VOZlRjaDNxejR4ODYwODN4b3Rtck9Nakl0ZzhYMzY3?=
 =?utf-8?B?cjc4Vjd4eGRLb0YvVGFDR09EZ2p6d2p3blZoS0pML1IxOUUvNU5vVFRUbzBO?=
 =?utf-8?B?eU03cnp3cmt0ZlNDQXpaZU1lekswVmlZMmEvVXdSODNpREk2TW9IQTdadVU0?=
 =?utf-8?B?YjBkM2ZwWTFpcEFyUlIyQktDZksyQ3pTcWtyR2Z5S1JXc2hLMG5VQlNNbmh4?=
 =?utf-8?B?M056QWk5M1MxWURVVUVhaU1kYUhpMzU1RGd3Snd4eW1aN3FCRDlTazQxZzRw?=
 =?utf-8?B?NnVvSWtSSExPUHJ2bXBrbExjV0FPbytKOUtWdFdyYUJ5MHFFcXc5S202SHR5?=
 =?utf-8?B?aXMrRFNuc0owaU1CTVFFT0JQMk54V3VIbmJNTmpmRTZibm1vTFFUbVhlbTVL?=
 =?utf-8?B?eGxvZldHMVVVZTI3dWx1SGdZN0tEZGt0ZTBIeDg2eUNPRG82SXEzUTUrTWVG?=
 =?utf-8?B?TC9ocTlZWE5RUFlYSnZ3N0thaFp0dEM2cVVkMGFoSVFJZ2UzR3BGWXFNc1JT?=
 =?utf-8?B?WUtmYm5KWVlTcDJDdEh2RUE4MUpaTGlOTGJkZGVNc3liUnhTeGZjdktSSlRR?=
 =?utf-8?B?WGl1STZSU2QvazNJdFQyM0ZlNFJSNHpkZ3hqaEJOaVFzU0NUckk5VkN2UEZV?=
 =?utf-8?B?UnVvNTFnZEJqZkxrNktoMVJjTlFOSXFYRmZOQ3owRFJBVlI4YWd3cFF1U0NM?=
 =?utf-8?B?T2g3UzZ3aHFwcDFZWnF6ZWx3em9xQVArcktPNXJMQWh6S2VBa21HZlduTmly?=
 =?utf-8?B?YnY4NXdrRGpsamZ3WFA3RFB6dkRIaEtmcE5PdnRYakRzNkhxS1FLdTBhYytj?=
 =?utf-8?B?VHp2bHZhZkxXQnBUa2NyU0NldWNaanVHMzlqY2xIUDN2M0ZuTkV1clcrY3ZJ?=
 =?utf-8?B?djg5RlBuNmdCb0wxbm16M2puUFN5RUZMNStEb0F5TWxhUHJPZ3JkeldFekhh?=
 =?utf-8?B?eHFVVm82YW9TV2lLWmhMNDdLQWhMOGJrdkZZcEU5Z2h4dDk3aTloeWVEa1Yw?=
 =?utf-8?B?cStIeGNRRTNLc2RxOUtxNzFZQVB1RDVsdTJqdGd3aGxFN0YrdUd3aVR3b21j?=
 =?utf-8?B?Qmc4VXhDNU5DNlc2NXFqRmtsaTRrVGJUMG8yNnJlNXVVS21jY0ZrVGdIRmtR?=
 =?utf-8?B?akoyOUF2NEdlT0VBdGJIcGh4NW4rTTNGOElQSnpUK1ppR3JIamx4RGNXcmF2?=
 =?utf-8?B?K3p2akRoV3JVK083YWJoamt5bnNFRzlITlp0Z3NNY3U3clNJM3ZIYnhybXQy?=
 =?utf-8?B?TkZLcUR2NmRvV1NidWtQa3BGa0ZJbVJtUHE1MC9UVDV0dDVzd05VYUowMzE1?=
 =?utf-8?B?ODFYRURMOVhUSnNIVS9XWkwvM2Z2MnFGM1p3d21wMzBsbjVRRk5LYmFWVnlC?=
 =?utf-8?B?enhIdXZ0cnBWMFZPaUNHMFZ6N1ROMitXYStCc1JBRERaNHc2NWx6NEZFRzFS?=
 =?utf-8?B?eGlDSEs4UWRYL3l3ZEdIZkt5cGpmVlMxYnl2YndOZ1U4Z2hDY3hZZEFmMUpH?=
 =?utf-8?B?aGcySlpIRFFVT2JqZHZiNnFwSXNNbUxPSXlFVkhMdTV2YVBscmN1cnJLSDlP?=
 =?utf-8?B?YzZ5cnB0VlRGRk1rN2N2QlIzUXNCUHdpWjlMemtzb1I5Z3RoUVB4bCtNbHYz?=
 =?utf-8?B?bmNHazdzSjFySFcrUXdTb24zWXNMR2xSMUtNQUdTaDdnKzJXWmF1TktyYkpy?=
 =?utf-8?Q?mJvPLsNF645TMm487NkoSs1Cw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e973ada3-c6a5-4633-47b0-08dbecefdfeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:18:40.2063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjnrNX3Wx3sotRPu369vvhg+V+ClpWuYG6/uX9NUAxJcIcB32IAmQlrfYCwfD85078qmz2mOtZDRyFweB3ogzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

On 24.11.2023 14:00, Michal Orzel wrote:
> On 17/11/2023 13:24, Oleksii Kurochko wrote:
>> --- a/xen/arch/arm/include/asm/altp2m.h
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -/*
>> - * Alternate p2m
>> - *
>> - * Copyright (c) 2014, Intel Corporation.
> Shouldn't this copyright be moved to generic header as well?

In earlier communication I raised the question whether such trivial
stubs are actually copyright-able.

Jan

