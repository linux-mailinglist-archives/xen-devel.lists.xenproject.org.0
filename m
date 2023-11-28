Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21797FB7FD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642950.1002799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vRY-0002fr-UN; Tue, 28 Nov 2023 10:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642950.1002799; Tue, 28 Nov 2023 10:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vRY-0002dm-RB; Tue, 28 Nov 2023 10:35:52 +0000
Received: by outflank-mailman (input) for mailman id 642950;
 Tue, 28 Nov 2023 10:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vRX-0001eS-RM
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:35:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5e7f392-8dd9-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:35:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 10:35:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:35:47 +0000
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
X-Inumbo-ID: e5e7f392-8dd9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGeFkQQbLFFdgMdSho8eUSUNigoSxg9ObsTNc1LQ1RCbgSvaTD5L9x2Jm4JZt6Dw8aOqFWYXB92L0Hp3lRbEQjVsHdcw4G4z3XZkgwMhS10XXDng2PssWdbRng4MwOeq3aOUShuPXYR1jRS8CA6pSwxWiY3lEv9eH8tjmcjdf07MouPE5rqJVrQYJeaWcWDyoksdJFE8iL1/VN5Fr6ptdJDe+fvXy3ARO8xcFjO4IL6XE2M3WrwFDAoY5UriYqc+eDDPr1//8GzDGWYPVBxQp6/sCAEc66bRj6NVoHJbQyNcvE3NR2MKiXmIGZQtGhAYwbV3oLqrD+OCSi6hyLL5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBwVLYxteBvFvzJ5zFgWT14OipIYNoUnky/Sn7smcA8=;
 b=ktWX6Ce66aMMDt5vKF+rO+byyM/9oe2B4gZKRQCMr3Zmn3/dZSsbXt6xBUvQTm2P1Jc7XiD3gK00w7uuUiPGEPLA2Qk2aGnA8WahZXWz/BfuK48hvsV3fjJ/dCti9X+iIb69IOT8hp8A1OVx7aXvpkdgUoXkr/QlOMcPr3eHf1y8q2fXg1IRi+dx2DmXwDazj1oa3XslHWtCxgtcEcrbblDkucHDT62xGVyXLzJ0GnbIY37+884qPq5YomRBBph4KDMEkeYEK3dj8YvOmmu/8HyIgAE47/lXgfl/GvQZg3dhewTkBK9kdjAua3g5U+YnYteWa7qqHFxEMSQQLiH9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBwVLYxteBvFvzJ5zFgWT14OipIYNoUnky/Sn7smcA8=;
 b=VCVfNlkJqQSkL6IvZ5UrznDioBxMTzT5YwsJpomNi4SU2d8YTHSItW9FqccxnEn2FIuA3Zb6pjtBx7PY5k38La43GVZ1/paJH6DIqdW5H7O3jT0PZveJJ1X0k2YGfHFaWG1hJfss1hNWr8paHjaqac1mthhYNZHwUi+voqtJ9/N1JxquGe7T6a8fOwgICm695xCKoH08tTJZz228dumS21D1nPyRKYwAmbwPKtw2ZqxiEAN5wqJq771v0ppI4U3iRGmq+MgzE1suvBj9NQsyS2YsCsNP7jO/Ku2YEhSwgLI2x+YFPbezdZ1o8DG1wEwSLYbriojFsM7d47Vjkk2GBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09fc4c14-07e8-4e59-a23e-bb295125f25a@suse.com>
Date: Tue, 28 Nov 2023 11:35:46 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/6] x86/vPIC: vpic_elcr_mask() master bit 2 control
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
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
In-Reply-To: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3085dd-4f66-4b88-8f68-08dbeffdc876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GcPMZ77MdVEpY8j0NVIXvuz/ILe3um0x9FYqKLuKhpGnhvOvvHAtj6zakUK87qqHEIYH3mxn23OnpdBtWF8FLc3CdUu4gskSiCFtBg4S+pVWTOveAxr+1RKguiXXjBIjlk6WgivOZm3IFzUQ8T6zNwyHNbwgH4QHYy9uO5M2eZAAeITiZc3iyu+OCZknc2oFk0qN188gyY6PRLM4SmmWY11tYLowvA7L7fnNflVeJRYSg2nlTDCdBEqIrOWtNVhGqlG9dc65mRgBYt1I9Nh8hPVPxRLmpD7thg40QCkkSSAu8QPFhvMCd0y+Gouk7nMZoAo81oNzch8VZ2qNvYHuzKqryHL9DQAQg1zT/auPtB120mKCkdZ2scu17cgCJja4NjhAov0Z/KxtqWBx2wojSmZS2bXlTzGdDbPxfl49U3tW94tNDYV40+bSYGUUR5hdOh8Csv2BXIh7H2Wv5jAngqcsnlsAfMSWUZ3rsYbkFQmrHLn64ohp7FmoL0MgO975JWRtvdrCO1LxfJkjaWcUPtc3qFoNTcFQuK7/lsmhA70gWLflFHJnJq5f8hkFTapEn6me4RqRQ3kcImw8+k/bxLF+2a069nFt3ntYcaUusAJvyBoV6rr8VBxXDglFbZK7mvKphCvKVfNW1ha8Z+c3WQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31696002)(86362001)(83380400001)(6506007)(26005)(6512007)(2616005)(31686004)(36756003)(38100700002)(316002)(54906003)(4326008)(6916009)(66476007)(66556008)(66946007)(478600001)(6486002)(5660300002)(2906002)(8936002)(41300700001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTc0dnY4ajl1SFR0dnk3VFdiNmxvRlNlV2YrVmEzU3pkbHM1ZGFmMDBWekxP?=
 =?utf-8?B?NnJQVVNLUU41c1FaLzZTbmJVMTh6dHFteFNwdjdJSmUydjZsNjVKNldFNWp1?=
 =?utf-8?B?UjRYWWVFT0I3WGVaK3ZQc1BYVG1QdHJUUWN3YXJSNGoyQzlxaG84RzJCbWJM?=
 =?utf-8?B?UmJQWC8wK01iYjlPWGlMZlpsWmJ3a0dTemc1M0VhT0lydVlGMCt2cDhpVmtz?=
 =?utf-8?B?MldZMi9lY0NjeVpZdnE1cVVTazdWdmN0cHE1dDB5cWQ5WGdPb1czWkZzMEtW?=
 =?utf-8?B?RWtpMnZOaVVObEtFREVUY2NzL01aN1hodVBlQ3QvWVJwR25wWkV2NXMxZTQv?=
 =?utf-8?B?WGZ2eTNVZ2NzN0xwTlhiRHJaQkhzdlY2UVBnZ3BMTjlUMFM1WHAwSk0rYWpl?=
 =?utf-8?B?bmMwNnlycjg4SWJ3M2VQQXQ1REowaXZMUUQ2WHR1NWY4dmtQVm1LUE90V3l6?=
 =?utf-8?B?S3gyQ2UrSU96dEtmbVAzWmpzTzZFemg5bnRCUmRLV29oLzlhbExJcFNPcnBt?=
 =?utf-8?B?UmlzZ3A4aUpYQkl5WlFrdUgrak00YUxJeFpJaGJTNEg2TVBwcXpWQzVuelhW?=
 =?utf-8?B?VXEzN01Dcm9wcXR1TFNDOU5uTHA3YU9SOThiaE1YbUVMaDRSOE9sNEV2UXdQ?=
 =?utf-8?B?MGd1aWwzRFJFSHNYRTlVTWVyOTlyMEtLWkgrTUJReUQrNlFEZjNXc3NSMHlW?=
 =?utf-8?B?YjlZb2cwTFpQM2dSWmN0M2N5VW5FK0phdjZtNkQyd3dNdVdwLzYwMUpDWUpV?=
 =?utf-8?B?OTFqeDZYTkxjdnZkelVIbjFaOE1kS2d6OGtEcnd4eUFCN202aXBETmwyeC8w?=
 =?utf-8?B?S3BHMzdwVmlIcmVSeHhjb0NERDRHRkRiRWhveko0WENSZjh4L2FzL3hUa2lP?=
 =?utf-8?B?SkVrZTU4dzhQakdEU1YrQUlwVHM3NmRqQ3IvcVo1TDB3ejFWWUU2TXE1Mkhp?=
 =?utf-8?B?WnprT3JPVHF6ZXRlS21NeFEwdmhLOEJQUWljNXBVLzIxWU43cTZKQ3p1UHhJ?=
 =?utf-8?B?bHg5bUtGT1paK3N0WW8vTzVtRUVRQ1dCdjJaaGVvUDVpRmFNdVNrWmJpTlh3?=
 =?utf-8?B?djhVZ3dZZ2ZlTmRCeC9xclFsV0NrSEUwK1BSbnYyWTI5UThya2EwSWpxQVdn?=
 =?utf-8?B?dDA0NG1iVFc2eThtOGpvR1VuSElLOHFLci9pNTlrek1xTEFJdkVrbXNXcU5V?=
 =?utf-8?B?Q2NkdGpZZlR5MFM3T041bzBRcS9QZkJSSEdKSnFLYzNiSnltWVdQZGU1YTU5?=
 =?utf-8?B?ampodGhWNmN3N2NVYS9wMEc4Qi82aTFCY0JNZ3hVWnJRN2M3eXBNdWwweFZy?=
 =?utf-8?B?WFY4a3JpUmpHZVcvcnFsdkVraVRSY09xSnpmczY4VjgwbnBtbnFTTlZSaFRh?=
 =?utf-8?B?OVpmb3QxRkdET3YrWGxVRWErVWdXR3lSV0JkYm5wUEhSb0xLZWttSUNDOVdO?=
 =?utf-8?B?Ui9OZXVobGdjSXA1U05BdjFvVFF3bnYrbno4SzNRRlJ2MzlzQm51ZEFvWTZL?=
 =?utf-8?B?akdZMjNtT3J3cGJvcVNGSWM2OHlkVUxVZnVkZ2xuYmp3SHV4aU5Uclo2V1RF?=
 =?utf-8?B?NUQwZ1J4b2c5OGd5M2ttZms3b2o1VGFPRTJGU1RtNXZDVnh2cjJNSGF4MjRV?=
 =?utf-8?B?NzZpUWs2S3p0UXdTZllRL1RHYkhTU3F1a3I4TzBDTkxsUHd6V0VKajFWMXlU?=
 =?utf-8?B?NGNsdU80TGx6eXJKdDEzU0FBQmFpVGN3aUtWTVRmWXljS2tpR2VrVW9HRWRo?=
 =?utf-8?B?VEJROHBabExjcmV1cUROUGVYQUIwR1VzL1I1UXhYdEN4UXUvS3lvaXhmMGFv?=
 =?utf-8?B?bkg4YkNFZTMwTjV1RGtEbTBaOUxoNzJzVEJIQTFaYlEycWh3K05mc2F0TldV?=
 =?utf-8?B?LzBrVmg5NUxWMkxIMnJRQ1dhd2NNbU50ODdpZUF4OTJyZ0Iyc09zRmtBYlJJ?=
 =?utf-8?B?MkwvVlRUOHcrWXFOaUNEeHBOamdNODRhek1QUnRPcnhLWnNUY1YrSWl4cmU2?=
 =?utf-8?B?WjhOV0hjRUFkV3dsZ1ptd0lNdGFObEhqdTU1QUo5NGlWdE0xRTZrcnE4SU5J?=
 =?utf-8?B?bXNFcDFDeTROa1FReXVKQk9lbFZ3MWg1Q2Iwc0FIajhZRnJQditYQnZZV3NL?=
 =?utf-8?Q?G0Ftr4znpCr/2LER4DFbZP1TG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3085dd-4f66-4b88-8f68-08dbeffdc876
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:35:47.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjF7BD+Ezlv/OduflxeWaBcQrP+fLq1nI2B9/zfvPLjiHCMBMcJmWWGo6/nf8Fvu3l8/SqgmlNDWdkkbOI8Y0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542

Master bit 2 is treated specially: We force it set, but we don't expose
the bit being set to the guest. While right now the read and write
handling can easily use the fixed mask, the restore input checking that
is about to be put in place wants to use the inverted mask to prove that
no bits are unduly set. That will require master bit 2 to be set. Otoh
the read path requires the bit to be clear (the bit can have either
value for the use on the write path). Hence allow use sites control over
that bit.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New, split from larger patch.
---
I'm certainly open to naming suggestions for the new macro parameter.
"mb2" can certainly be misleading as to Multiboot 2. Yet "master_bit_2"
it too long for my taste, not the least because of the macro then
needing to be split across lines.

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -41,7 +41,7 @@
 #define vpic_lock(v)   spin_lock(__vpic_lock(v))
 #define vpic_unlock(v) spin_unlock(__vpic_lock(v))
 #define vpic_is_locked(v) spin_is_locked(__vpic_lock(v))
-#define vpic_elcr_mask(v) ((v)->is_master ? 0xf8 : 0xde)
+#define vpic_elcr_mask(v, mb2) ((v)->is_master ? 0xf8 | ((mb2) << 2) : 0xde)
 
 /* Return the highest priority found in mask. Return 8 if none. */
 #define VPIC_PRIO_NONE 8
@@ -387,7 +387,7 @@ static int cf_check vpic_intercept_elcr_
         if ( dir == IOREQ_WRITE )
         {
             /* Some IRs are always edge trig. Slave IR is always level trig. */
-            data = (*val >> shift) & vpic_elcr_mask(vpic);
+            data = (*val >> shift) & vpic_elcr_mask(vpic, 1);
             if ( vpic->is_master )
                 data |= 1 << 2;
             vpic->elcr = data;
@@ -395,7 +395,7 @@ static int cf_check vpic_intercept_elcr_
         else
         {
             /* Reader should not see hardcoded level-triggered slave IR. */
-            data = vpic->elcr & vpic_elcr_mask(vpic);
+            data = vpic->elcr & vpic_elcr_mask(vpic, 0);
             if ( !shift )
                 *val = data;
             else


