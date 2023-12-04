Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF089802D20
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646585.1008985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Kj-0004U7-Ou; Mon, 04 Dec 2023 08:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646585.1008985; Mon, 04 Dec 2023 08:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Kj-0004RI-LT; Mon, 04 Dec 2023 08:29:41 +0000
Received: by outflank-mailman (input) for mailman id 646585;
 Mon, 04 Dec 2023 08:29:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4Kh-0004RA-S4
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:29:39 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431435ed-927f-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 09:29:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:29:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:29:35 +0000
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
X-Inumbo-ID: 431435ed-927f-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZR+kbB5P3qhjOMI6uBVKoOnUwTbTlZmCl1g1SDMNmSfpppwx9xhSKsg9wkQspm124x0jarkW/vsqPgPfePlc9alq6tvuJNIf8njhs35RyN2nrY4clYeSTdwn1HmMZ4KLgXKfJKW6Li5SoQobqWl6GHCbfH7JzSFNJvUCPTIq98S2Z/xJBfQSu6YIhnmRG7z81DQmr8G+tNLS4EPAfmwZ1hF1ztxgOj8E6fYRqBRcvPaMhlHTk3NVaES5XVzglB2jI0fRppaQnE2RebX2go6VQvbziDeqq3lL25N5B9FRU5hggvQG2oJq1K4SjBc2UUhs+41t1cBHEp3X/AszDtObNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6qAUzvmfVWsB1lOFab/mNO1yowk2sqfErRFZrqDFSQ=;
 b=ZyOzhKJiKl3i7t0nXKkz2xx4OHb1tJ7fJZOo6prnM3+yqkUg1Q44hfgHPOjFNzcVJtYS5L+3i1/aRYwm5ZAeqFg9RjNTCV4tF5jGGVx/iDrp5KhnNdyfAyYUe7PfHXFidWTsyYDwkVOLxsxbCQM971FNDwzFeHR1wLWGOn1MoNjbPdrqCifeoBO2hSk9JLuXzhldQQNjxULQ7NMOfQljsKHqjRWxWFrIFEInZjbEHwf3Hj7S981mF3Mj0kLC3RnjymTLg8T1a8jMGhSLogWybBb5LtLENtmL259UJkHeEoGr25rFF3VpeUzfTHpRzfDoCc4MplYpAZOH5EesEXKjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6qAUzvmfVWsB1lOFab/mNO1yowk2sqfErRFZrqDFSQ=;
 b=YAy9htybri+TiN9lXMc6JrESldmrMiEHmAda5nEH9I6+rZpHFixWPhpUWLUc57vff7/kTVL8Ue9qfdBvRsOEBD8ahd0i9rYu8+wTHU2yFJcpv04M6AAWA/Ux8ZJ4zORomOKilBVqcsEthuhQU84SrhIERyaHC17fZe+IOcGtPpWqbf3jnyLEaC60LmuFO9fhoWcsNDbsLyW0VgO4aepnJbRZK0kR4/e0re5YVawI06waUoxx2u7fUbjdkuuT95PK4CIv6biVBmJWOvHE2JqAY9oHMX2QzxVMvN1i8PKvgINipmNbuC+704HOr8rOSkQMyM3Vh5MG+AJujMTyF55C7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bb1afc3-6de4-4b78-85a4-2610f5f1d001@suse.com>
Date: Mon, 4 Dec 2023 09:29:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 16/17] xen/arm: vpci: permit access to guest vpci
 space
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-17-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231202012556.2012281-17-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: c16fe335-db17-4a8d-5bf3-08dbf4a32569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e8YZ46veYiofKKu1bGf9Cg9JD0HnFVTnGvRMcxzIp4uups72h7O8W29uLd6/i5B41Bhh9EuondvaCgFQu+rU5OYajK86BsqRG9/1Em9i5vISKTM0dTY8Vv7jihCHAdwIJ2vJHnQ+GSWZJMxa3KYISwiR+2+g8boPbRVA8j9twRxP0wKUotOoz9zURHPJ8u8JDel9VLGiLdETzW5rqsxeejdzebkmZRV8b3IDyp+rboVOlpcf3IQcjyoqiSv9p1CzuRYxIMupBzVx1ukQ9S0cCaKX00tN+Jd0sBotpzGMehS1OIPTML+gQ97lOt4fo8y8MojlozhPuXIcA6YPKge8ilmRtJgQwYfr9v3aKbBybQ6ouWYSCt77P4LE8y8N0eyGAhtYSaZHeJEDYXHsMMpYmK/7ySXgr/47+WArmHDttiUMA4JuwXHk2o0tsFROmDyBqgKhOmddfkDnn1Yz395yRZnGlQRhqjgIU7t+NyrxRqi7obozl6Gt7XOPUsgJxQEee3rmLT8isUCUWQqXxpefBr0Rs/9epW1BCJX4u30lhTT+uld6GVzVfLpCIG0ENlMAEbjy5IB2kcrG7L45LkTLTVHyn90lTw+MzMy8PokniR3zjRQYcQCjXXVpolQKgIA6w4DTvnvYUbnP/coqV1+ZnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(36756003)(41300700001)(5660300002)(2906002)(4744005)(7416002)(86362001)(31696002)(2616005)(478600001)(6512007)(6506007)(53546011)(26005)(6486002)(38100700002)(8676002)(8936002)(4326008)(31686004)(6916009)(66946007)(66556008)(66476007)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJEUmRzSUd6ZE1mQ0FTeGM5RWlNckQ1R2s2WGtMWU1XaVQzendka0M5aWhQ?=
 =?utf-8?B?WURYeXVxRVIrQkpvdlFpcW45QVJacjBWWkJqUmZPRUJadmpSRlB6VUdRdzRK?=
 =?utf-8?B?MlBNQVJ1d1hWWm9lbVZwcWl0YUdiMEVsTkV1M05JMFJ2amQ2UERKdUoxcHFv?=
 =?utf-8?B?UWxLa3dOZGRWVXdkLzJEMVpUOXJRNlJxQ0tBY2RzVTN2WUJBbzA4eHBRNjVt?=
 =?utf-8?B?MlhLY2ZrSEd1b0t1ZEVLR01HMm5IK3dJbHRScG9GMDJoTmtCMTY1Z3VJc1U1?=
 =?utf-8?B?VmVtZ2F1OHdEWTlqRjVTa3ZOS3BsdXJ6eTlJb2hkSDBXTE9XY3lxckpUSXNo?=
 =?utf-8?B?bWthUGpkcVUrZmJ2VHNGRmI1cWovNGtsa0hTbmw5RnVScXlxVjE1TjNNdy9l?=
 =?utf-8?B?c0lHWTdhdHJDS0hIYU1rdGN2NlFBSkJWQVhvTE5rMUJzU3hkc015UVFGOEdX?=
 =?utf-8?B?Y1NkaHhKSlJ3ZGVRR2FkSXVJQUpQTjZxWmpFV2Y2TStINDVjSDU4bEhRUGVW?=
 =?utf-8?B?QzNNRGlaWXBiWUhHd2xRRktBSFFZV3NZNzEyUjBRaDZocGYwc0p2dkN6Z1Mr?=
 =?utf-8?B?SSt5dkc1Zks0aDkzM1lkOWZOTHVGa3UwOUloQzZVZ1ZoSElMMUp1T2hHcVpy?=
 =?utf-8?B?cEVwNFIzRURtU1hjYlQvbkNvbjRqMlFPZEErNzBMU1djc0szN2ZyMzRhUmxE?=
 =?utf-8?B?Q1NhdHhsSTN6Q3dqRDlSMWlaMk5aN2JDcDd1Nnk2Q0V1ak9qL0VsMmhVazBx?=
 =?utf-8?B?d2tOTHVheGlCVDl3bTBHb0lVbG1TdUtGcloxVXZVTXQyVDN4emcxbnljOW82?=
 =?utf-8?B?UU9vazI5V3RYZTlkeTNrd09tK2V5OEpTR3d0VDAyaW0xanlIZmo1RVoydnp2?=
 =?utf-8?B?QUsxVUlZR1BBaHRhVEkrZFp2TjdBRVZrVGFndnRGSmpOMk5FU2M3VnFqNjhJ?=
 =?utf-8?B?MUx1VTdSL2U1UnFJRUtKU05DQ0NjUi9XY3F5T0NIVTJ3cXdPaGFiRnRNVHBT?=
 =?utf-8?B?dHU3Q2RmTXN2cklSZWFXVGtFN2xEVFg1amN4cmM0S0pjRzBISUFPVjdHaWFu?=
 =?utf-8?B?SHVNb1NJaWtMSThRcXBydUZpZndweDRqekxwbDhHeVpSekhpb0VSbUdUUHVR?=
 =?utf-8?B?cnk2WFg3K2gyM1ZIdVg3NHVMc1E3d1FnYWp0MFR2eTFkTmNSVmZ6cncwMDd0?=
 =?utf-8?B?UUYrQTA5RUJYRnc2d1Y2dDNrWXRRZy9qNi9TZ1J2ZHBlUXVWNkVPVWJIeTY0?=
 =?utf-8?B?YStZWXlmVFI4MTRNb2UvQ1NLb2VCZzdVVllUSkZ1WWNRcUJFMitTMll6Qktm?=
 =?utf-8?B?b3pkaXAzNFMxRmxpZGhFN1Y5WHROZUZUY1lKbWMxaXM5Vkw3ZGZqVkVzM2Nv?=
 =?utf-8?B?RHVDZit5YXdxSjlBUHZ3a0NNWWd1VFdkR2orSUE5M1hRYlhKWlFxTkNUREts?=
 =?utf-8?B?bFhqZVJsbTNhYVZOczBoZlIxbFVsVWJkMG1IQm05VzIvTXhMSHpKOTRZeFRp?=
 =?utf-8?B?QkU4RVN4YzhaWHdwSm9CV0FtVElmTHhWVHVaM1d5VkNENk9qbjJmcllvakZM?=
 =?utf-8?B?REFSbFIyRkhFbGRlMGk0NDBySWRjVVp6cGUxK3d3RzRhN2taMk15Qi9lT3hW?=
 =?utf-8?B?YWV0MW9VNS9IT09FZXhPeWIyMVpxVytOUHRVSHdqY1dNUTNvSU1naFZNQlBL?=
 =?utf-8?B?bGtaYnVzWitMYVdBNTJqaFBvV2hTU3orNFZRS0VOQ2dsbktWZW9SNmNWWm1j?=
 =?utf-8?B?NXFJSzhOZDVSdmFZVU5uNEwwM0lPVkFWdFdYbzU5VFM0STBDRmV0ZlJJSWlW?=
 =?utf-8?B?YUJXWXNkZExOZFRsRUk4aWRkRmhsNHBHa3ZpSTBjWkJTTmdoYVE4QXVEbGVF?=
 =?utf-8?B?MWU5bjdrdGZmYkNTVHFBSzVMd0d1L2MrcUN6NEFjaWJTM09oajVNaDUrV0pR?=
 =?utf-8?B?dGNzazVVaDVid1dxWXlTVEg2NWRvby8wUGdzMk5FNHR3ZWkyM0QwbDFTa0FC?=
 =?utf-8?B?Z3pCUjNheWhrZ0Fpd1pFeXlPQzdkdTJwVGFjdjdETGdEeStVa3BzRW9iOTNp?=
 =?utf-8?B?dHRxVzdTWEgvdVJKRGpkUkdLWWM3ci9hcEw1MElVdDhKelN2SlFSdUNxMUVN?=
 =?utf-8?Q?ktAEbahNRGHTdPMzZXbUvoQP+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16fe335-db17-4a8d-5bf3-08dbf4a32569
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:29:34.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3NTNi4zFLbHW9DbOocbGP9a2pg2F+eC80bMHuUxojUlvTpoJLr2RTEZVB+nWsTPH6dvVHXMjsxbQRlYtO5FgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749

On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -695,6 +695,9 @@ struct domain *domain_create(domid_t domid,
>          radix_tree_init(&d->pirq_tree);
>      }
>  
> +    if ( !is_idle_domain(d) )
> +        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
> +
>      if ( (err = arch_domain_create(d, config, flags)) != 0 )
>          goto fail;
>      init_status |= INIT_arch;
> @@ -711,7 +714,6 @@ struct domain *domain_create(domid_t domid,
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;
>  
> -        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
>          d->irq_caps   = rangeset_new(d, "Interrupts", 0);
>          if ( !d->iomem_caps || !d->irq_caps )
>              goto fail;

I'm pretty sure I asked before why I/O mem caps' init would be moved, but
IRQ caps' would remain where it is.

Jan

