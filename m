Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71E7F0F53
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 10:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636518.992078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50qV-0005tM-N1; Mon, 20 Nov 2023 09:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636518.992078; Mon, 20 Nov 2023 09:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50qV-0005qa-JV; Mon, 20 Nov 2023 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 636518;
 Mon, 20 Nov 2023 09:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r50qT-0005qU-Dh
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 09:45:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b5aa6fb-8789-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 10:45:31 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7670.eurprd04.prod.outlook.com (2603:10a6:20b:297::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:45:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 09:45:28 +0000
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
X-Inumbo-ID: 8b5aa6fb-8789-11ee-98df-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llVOwg0szul4MBnI8wBINWEkq0bl4b2IDXTcr2VbDhO03APd66UFz88eYBMH6ouQZVpRiZC4qZ3T8gxWggfevmbGW5xnB0HbBYpURJcgQ4vSUcOcYhHpNOIytPIcYRnMHG73DgaP+ILscMUDM43RQ0OfbhR/pgL46BwLHmenrr0+oxPVyHZ6gc92sCrvq/tBHFaHh8f0E+k0lWkvtBor4PN/7BHNhJWT9JgNVpj9DdByVrldppVk6epJcz8iKmwfOKOY2japBD3WbXuFKVakfDfVa8OQfGIwpw9F8QILP8J5MBxU9qg2CgOrNkD/Rp9zSOov+OM/yE2Uy5zkOi2NIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovPYBdVuHzxMQCvdmoXlW0IrIrTqTh3xuEQfZGiELbM=;
 b=mubWQB5UZBC9tz6mUSM3e/P7HJHlV2Dpvp7Y1Hmaqq1wjc1iI2NKoietQNUAYIapf9qtlX+NUC7wcqcFe8GXTo2F7k5epULlNV0GuFAVBiPbOBAtTJPSO9kFeuhy5aHJ0Q3KbUxFDf7EiUvpRwHqOo89uqhbIznwGPnDpEz6BOAPJopBT4lbwoO5rXlsANYiInp/am75iqBF9KW3OWI5HmQkXaldUoOtSt6G06hhITYdmSsgAF7ojUXKHnUsYsBex56mqTqlzm40qz24RGzW1M6Y0F7tDmvVekICYdfL1XPoU5bv2ddfQGEhRToNm4Nb1yM3vBfpxSIPhhfeamGEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovPYBdVuHzxMQCvdmoXlW0IrIrTqTh3xuEQfZGiELbM=;
 b=zqLvrLBmlI/8dkcfMfE5WOyhJlh4xg8HhWFzxajC93YWclqFK6WhEhkb3m1EYjIh9wYKk85Xd137dCaKWduNpB0sWn17wIg79vIQsS5HSedJL4MPOQhy82BQiCPsA02zqngCqIzP+oYV71KwFUaH24M38nwefUmZzgjwWchzxtENkqRgUj08wiQ22gRnCvYjFxbvchwBJTdXxkWb14GeCt7xC4qmoS4e+l+8l/XGw4pNQdFlYaO7f8D3ADIlBlpsZGcmQNMdt1KFy4q0tq3LVKlpd6lHwCPVVda/zf9QdDKr526iRtfw4bg+higpir9lc5zE1sZ+ewlq1hkcF6QG/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
Date: Mon, 20 Nov 2023 10:45:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4252fd-85ac-4169-b05a-08dbe9ad6da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FQMoR8OXkow/6QycwkT3NJw0fUvRmqeToHWHM8OLgr0UVGTAu1R7Ve1uOQkAQGIm3FoukaJZBmQ6bVa5wJvY9YBmQ0mPv1vJljgFfHD2Oyu7spG+hSXz3TPLbhs5oFrShUY/qT0fnwgBMBVtEozGDFozHFxjGvmfFkTDY45zR1uJRxeZuF7eJuS+yYsbqRtAgp5E42oKp4B/sx7Be/igVxCGqaZKnNXj8UKY/Xs793h/Wc0yv/ylDs7q5OcQDv5sYMb44ftYXmnJRRy27PDgo8df05V9h0u6LPkX9/le+SBcjip73nRY65WlcopWaZqu2n2Ea9Pzs2guIVV1KTIELGFt1tMFqqP+78i/fyF1G25SPNy5SSa8G+LuXg/tRBMOcLVg3j5XlnE/T5Dv9TNPZTJ2iCiKJ0IQipNzrr1Rjqlmiv9OhHV0+EGRvtWxh6pojr7MpUAvPgyy1zLVwLp9yEN6Cy/+oGXgPnNcOuPtZt3d8C8vQAolzgO/fnystgZ1dRzbTvKVl22iVmDKeZCyRmC12pr15XMW3JwTVa9LqfIZSLxQ0lRHa6jKMQd+IORpVlaSVv4rzZzcDA3zUsmen0403ROlXFzxuEOvzmQeTi7tEL3kLp9aDwqmNoHsxexOJMqLg0ehQhcnu3esv03Iqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2616005)(6506007)(53546011)(41300700001)(6512007)(83380400001)(26005)(36756003)(4326008)(8676002)(8936002)(478600001)(5660300002)(86362001)(6486002)(31696002)(31686004)(2906002)(38100700002)(66476007)(66556008)(110136005)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGhPNWtFUVc1TS9DaGdmTUx2QmdOcWQ0aFphaCtmanVROEJpL0dFd1dROVVj?=
 =?utf-8?B?a0o1Y24zVmgvRWVYc1JWVjRZdVFQZVB0U0lwazlHcklqcW9KOWIraHFnK0s2?=
 =?utf-8?B?cWlrT21RM3cyUU05OWpZbkZOMVVUNjJuZTdCdmpoUUtsdUNSNUlPL0krQ1VW?=
 =?utf-8?B?UVRqNDVDTURNRjlmT1NLU2g1NXdHc0Ezc0lpaTRNWnUzZnFNNWFIM2lWeUQ4?=
 =?utf-8?B?YWRxc0xUZENsU1V4SFpwUnk1TG1IdXpMaXpjQ29Jb0paenhyT29qZ2VPL3ZD?=
 =?utf-8?B?bXY3Q0VON2ViRndMSnZxRldZT2Voa0hYZG1lUmhKRU9qUEx5b1RZRWdwcThh?=
 =?utf-8?B?L3FlRGVUbnRFNTEzalhrRUR0Um1ZVlNQVWZsbnJ2QldLMXBFcUJqWnRlUGcr?=
 =?utf-8?B?ejQyaE1BY09FeW1BcGE0eXN6MGZtQ0RROWMvVldWcGdpYmhhdVhaVlZMQllN?=
 =?utf-8?B?OW9EZ1M5S1gzbkpCd056dDVnbTF6U0V6ODlUOVl5eTd2YXVTRWNFb09pcENI?=
 =?utf-8?B?N2Z1akM3aFFvTmJOVHk1MGtzOHhPQng4WVZXV3VzWjZ4cFRVOFEreGFiRVhk?=
 =?utf-8?B?ajEwa1RsOG1pZnUzRWU5NmpyRkwyMHZTRWxNbE9RR05mclBtb24xTXVHYlVL?=
 =?utf-8?B?dlJ4UHorVU84dXlRSURzcHI1QktIeUdJbllEcktJeGlLS1h5dzRpNER4clNa?=
 =?utf-8?B?bThYWmpKU2ttWUFoVHQyay95TFd0dEVkbHRJWWppU0JkNUQ5aEJla0s5T1Nw?=
 =?utf-8?B?N3JuRUhRcXNobURHaHpwdmtWRi9EeDd1MndPajc1Zlo3REpQYkllc3Fwc01K?=
 =?utf-8?B?M0Y0YldxdGxSK0thNzl5Q3ZSU0FTY1h2cy9qaTVwVG5mMjZWUXFNUXlGZzdu?=
 =?utf-8?B?Z2Y4dUNZZEVVcmlYdktoSXB6N0sxVENyc3RvZEpHOUNSSUowazljdENHVnk5?=
 =?utf-8?B?MlQ5OWRuTE1wS2tpSXVDdk5FTlloNFFpYU1uODU2Kys1bVVHR1dVaW1rQVBQ?=
 =?utf-8?B?U3Y5ZWhabXdVZTR6NVc1bHBVTlp4MWJ1V3M2V2VwMDZ0OE5ocTI5bTVPRTVJ?=
 =?utf-8?B?eHRXTkNYZ3E5RDJVUFk3b3hYa3RKTDhlN1Qyb0R6aXNrZE1UcjhMMFJ1ZGl0?=
 =?utf-8?B?T1V5ejh0aUd3RWsvT3kxRnJVelpvQ2pTVkMxNVEyRjlwckltS2VWbjN1SFRk?=
 =?utf-8?B?Qlc5a0FkL2RkVVFqUnpwbmFONEZVMXEzUHNOR3hTTnlVdlVKRS9RZFo4T2k3?=
 =?utf-8?B?czh0UjdrdEF6OW5OVmV3SGRES2t0ZHl0TzhaVVJqbjM4R1R6TjBKQlNPNEg4?=
 =?utf-8?B?VWtLZFh6QVFPMXJOV0M4TEVxYkp2UVI1c29ENUxKKzBrV3pYYzhhQnpNYXhK?=
 =?utf-8?B?RXd5ZW1uZkNrN05EbEdBeE0vdUN0eVIvTU1Genk5Y2thUG9CQ1pjRXZVMUp6?=
 =?utf-8?B?YllNQWlCM2UxcDZLMXRtSURqZWR6RXhZb1E3REVvTDIrOTNwWXozQkRMSWts?=
 =?utf-8?B?bkIwaXlvRS8xS2g3ekllOTN0ekdDVit1RlRYWmY1cTk5U3BKcER0djlseU0w?=
 =?utf-8?B?cFBNTkJSdUFHc3A0Z1NwalRwVVJIWXhxeGNEYmJHcWlDeHdMWXlDTGtrdXlT?=
 =?utf-8?B?Q2FHZW5UZ0Y3d3I2VnVuSjFlSVpYR3g1cFZJd0pnMjNqSVhRbTRuRWoxSEZE?=
 =?utf-8?B?U3B0Q3RvdGk2MzIrUFZha1JlYlFZWlcyamZVNkEwYUdkdXF3cmcxQlNiMjdE?=
 =?utf-8?B?R1VMUkw5bVVNNkJBcE9YMjh0ejdiM0o4QXcyNHVLUnVQWTBSQjY0QS9Sc0VS?=
 =?utf-8?B?NWFrSlp2cTI4RzRPd25YcmhtbDRkOEl6UWlFZjc3d2IvUTlSQnBSTlB4ZExi?=
 =?utf-8?B?aUpYODdTWTVLcVJ0UmE1NmEzb1FrRjN4akI3NFh3emx1cVNLeVM0UEM4Q29z?=
 =?utf-8?B?T2NMK01tVUZnN2pzZ3hqK3lxZUxibmRhVTM2Z3NmVmtkMzJ3K2tOSHFaOHdR?=
 =?utf-8?B?MS9CSzNuNHZGcExWMlJ6NktldlZKSk9Oc3pFVElnLzVGeHdqdHlLc0RMWDJ4?=
 =?utf-8?B?T1hCWXFYc05FVHhyV3V2cHBWL1ZUTVpNMXYyeld1Z2lRbjYvY1VJaVNGTGtN?=
 =?utf-8?Q?dSz9Z0gZJpV+YnVd+/jW/PpWb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4252fd-85ac-4169-b05a-08dbe9ad6da8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:45:28.4322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2lDrHtQaFVNdf7vK2BWwvzdSz10c6+qgpMJNBGKiJ719Acery01LtkHYpX4amnMxlhS+ZHUdNJqny5k2fO1VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7670

On 17.11.2023 12:55, Andrew Cooper wrote:
> On 17/11/2023 9:47 am, Roger Pau Monne wrote:
>> Using different page table levels for HVM or PV guest is not helpful, and is
>> not inline with the IOMMU implementation used by the other architecture vendor
>> (VT-d).
>>
>> Switch to uniformly use DEFAULT_DOMAIN_ADDRESS_WIDTH in order to set the AMD-Vi
>> page table levels.
>>
>> Note using the max RAM address for PV was bogus anyway, as there's no guarantee
>> there can't be device MMIO or reserved regions past the maximum RAM region.
> 
> Indeed - and the MMIO regions do matter for P2P DMA.

So what about any such living above the 48-bit boundary (i.e. not covered
by DEFAULT_DOMAIN_ADDRESS_WIDTH)?

>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Variable-height IOMMU pagetables are not worth the security
> vulnerabilities they're made of.  I regret not fighting hard enough to
> kill them entirely several years ago...
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
> 
>> ---
>>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++++++------------
>>  1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> index 6bc73dc21052..f9e749d74da2 100644
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
>>  static int cf_check amd_iommu_domain_init(struct domain *d)
>>  {
>>      struct domain_iommu *hd = dom_iommu(d);
>> +    int pgmode = amd_iommu_get_paging_mode(
>> +        1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT));
> 
> "paging mode" comes from the spec, but it's a very backwards way of
> spelling height.
> 
> Can we at least start to improve the comprehensibility by renaming this
> variable.
> 
>> +
>> +    if ( pgmode < 0 )
>> +        return pgmode;
>>  
>>      /*
>> -     * Choose the number of levels for the IOMMU page tables.
>> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
>> -     *   RAM) above the 512G boundary.
>> -     * - HVM could in principle use 3 or 4 depending on how much guest
>> -     *   physical address space we give it, but this isn't known yet so use 4
>> -     *   unilaterally.
>> -     * - Unity maps may require an even higher number.
>> +     * Choose the number of levels for the IOMMU page tables, taking into
>> +     * account unity maps.
>>       */
>> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
>> -            is_hvm_domain(d)
>> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
>> -            : get_upper_mfn_bound() + 1),
>> -        amd_iommu_min_paging_mode);
>> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
> 
> I think these min/max variables can be dropped now we're not doing
> variable height IOMMU pagetables, which further simplifies this expression.

Did you take unity maps into account? At least $subject and comment looks
to not be consistent in this regard: Either unity maps need considering
specially (and then we don't uniformly use the same depth), or they don't
need mentioning in the comment (anymore).

Jan

