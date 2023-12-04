Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D062C802C5A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646541.1008885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3ip-0007eW-U6; Mon, 04 Dec 2023 07:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646541.1008885; Mon, 04 Dec 2023 07:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3ip-0007c0-QY; Mon, 04 Dec 2023 07:50:31 +0000
Received: by outflank-mailman (input) for mailman id 646541;
 Mon, 04 Dec 2023 07:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA3in-0007bp-II
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:50:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c994e1f1-9279-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 08:50:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9928.eurprd04.prod.outlook.com (2603:10a6:150:117::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.21; Mon, 4 Dec
 2023 07:50:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 07:50:24 +0000
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
X-Inumbo-ID: c994e1f1-9279-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPqHoE3y7KB702F84HiX9Qqz4zfxgITRu4KIFChhRBtMuCrIuLcTKRD4D1chtO6Ea0aX7abhsXrlfb+bOGuZNX2fBGvMi/PxuiBBy63MLk1P2QXX1IW2SgeA1UdBFnk8y7wAi+PsngzgVL3HXSvGlTSGPpoQOLFkIWMmBCeNshFtWvQ3PqvrGCy/lUvUqOTGN9kq/b2CHjEcPAIhaPB3ud2SAUERLvQE4gGHYDy6QXL1JM7zGWLRuj3DQReijPk9Y3xKvP3WThdEOZvZ8yNoVwc4MY7P5KSC5NFPp8iJEmq4W7mW+BwLRpRByVjCDHI7ZyuqRY+rbq/VyeCafVwKOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXgSb3N6/KjVKW+Isbo1CyWphVQ8ULYo2yHN6sXAVw8=;
 b=dR6p++mWw2mfTSOVAGOIbj8/0yuyqRpbcizM2laJmU2zdPMy4uzqNJ8SKYd5ktJLhp8uI57vCYPDHBgxg++FHPMYqRSvcjTjCX9xpDbRoPoqO6xpEC9hAnJMjhyhPhWZrqTd985YKnQTHJ8U+JBDkSIhlXbbC7lXOfCjQq+XM8Jmp8AsFvm8B0fID9Niy7/QRh6cPAy8XNCqWTrV7TKbiwO1b2v+AQ21yQdfr+XJEtmAzMJEYsLPV9JnVd24h7nWjuNlx/bEoKu1ThAMt/xh+SiHBCKbiCOPpBpum5HD37O9UG4FqzHg9wykYXG9wfT1XZhmkKzxtIpRC0aD9tHg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXgSb3N6/KjVKW+Isbo1CyWphVQ8ULYo2yHN6sXAVw8=;
 b=4R4r4zy7GQDDhQ8BetCElwvGTF0q27cS2ddoe+VJ1LV42RIg9nEi9Y3RS2Iybm4808wubKJf4liMz0ZJCzfxKynB1sxoleJ+Vyx+2e/wDA9wviTAxMHE7TyHW11lDWMIyFASiJFGgI2V/3tj/bym54xJY4BOOmG1cUAI/3zFizL7r8ij/1n9QOdLFuUobKSrnukaHGJw7lVW2B2cOeXCdN0jbaMdMoYjjrWjhQYUGCEG+4w7YVavjRh+7HBdwYOs5VmrzmuYdEdHdAnIWVeM0VkySy7Mtavd5oW0XkvPNiMty6DV1uYyw52TqIvtS7QKoAq2lkGvCQwuQZg0xbebkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5664d0f-9ca6-4a9d-ba71-7f81e24e6a85@suse.com>
Date: Mon, 4 Dec 2023 08:50:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: address violations of MISRA C:2012 Rule 11.8.
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <a295b44a9fbb02f962720e086588437876e02ce3.1701430079.git.maria.celeste.cesario@bugseng.com>
 <a33ffc19-1e1c-4126-aba4-4a2b0ee24cf4@xen.org>
 <ca2d37aa-fb8f-4b49-8909-ad7d4065a59c@suse.com>
 <0e3acb5e-b1ff-40dd-8f63-d5806527321c@bugseng.com>
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
In-Reply-To: <0e3acb5e-b1ff-40dd-8f63-d5806527321c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2479bd-3968-48b1-0661-08dbf49dac2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gmQo2Qfig2Iz4UJuwzJQUwxaodF68sFYh8rNDknb2gHOEjMqhPjnRlBk49IQj7H09VipXlKL6VHk6SNVEgTIEMoFAV2NXYRuBUW1Ga9DFYP5yBh5K9uKoLTXvdGq8eATTLRxu3NM/NkGo2nHQTFAg9nj/aKlP46WyVZ13Y44mNMKa6iVBNGZI3cOrAb1ci8qK0NloBg+MesMOLq/SVp6t5UJWRmOafP4YgGxmHdqPBHZMrJr9cuEZJ9gMompD95fz+fkSgwhAk4yPvd8UWj00AOJiyaVZEqHg5pDxu6moCIiqO40vJvLp7kUtUw1e1BzLzSefweUPrQpdxd++ja1Ye42/AJL4NN71GJI5aDT8bnFkRAueaeOXO97qU323OPS0Mj+ajFRZN/0sgRwaJAvql5aexl55v+L72VNp5t8lgiJ2vevK1RwPYftMiEDNn/Mf9nDDUowsacyubOBSTZGvE+h2l+MfvLssvQYMGy25pMaEYqCbLWwnK3YN0RdToK3F4eaOkbR97veqWOj/E6LaelMN+TYKRsTJhy2HOGry1StlJnTKMcV45iJznLSNP1aeMTb+ffFc2DtS/T742nbZCb4HrCH2ZrEvd5kAINYbPJGzc4I0wAX7V29CFGCC4cX6dpF6+gibAqIZAKn91QLig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(7416002)(5660300002)(31686004)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(6916009)(38100700002)(41300700001)(2616005)(26005)(8676002)(31696002)(8936002)(36756003)(86362001)(6486002)(2906002)(53546011)(966005)(6512007)(6506007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnFuSWJNRzJsckZGL0ZnTU5lZjhqaU5ramh6Q1dLRDZnQWxVWjBvdVpOWlJq?=
 =?utf-8?B?YTMrckd2VXpTdEVReFMzTzQvek03QXhhaXFiMmNwcjFQM3p0emwrU2JHMk5h?=
 =?utf-8?B?QVkvSjJlR201MEhrUjBmcFBUampaZ1JxQkhtTTdZVWt2ZXQ4ajRSaCtjQ3NE?=
 =?utf-8?B?c3NlaUEweXFIVHB2TXVMd0lnSXI4aHk0NnR4NFZUakd1NFI0RzFJcEMrMHJt?=
 =?utf-8?B?M29mL0ltaEl4SnlMQnUxT1h5Nk5TK25Tc3E1T3ExOFY3L2RvSXQ3N2NkR2ZS?=
 =?utf-8?B?MTR6aldsa3lVaEFRM3pGbzBDS0J5b3ZBblVPVnhqUmtkS2lqU1hUL1NqNU1a?=
 =?utf-8?B?K2dJSWZvQ2E1S3p1c1F4d0pmbm5VSDY1bW9lSDJjMTh0OXVIQnlsVjI4dGpZ?=
 =?utf-8?B?OWtZSEpzY2xsVlMyZlBGWW1LOWxnOHFsNWszRkZWVEN2eE5tZVE2Q2VYU2Q1?=
 =?utf-8?B?ODQxb0ZGeVFnczlHK3ZRK1YwWWQ2T0daZ2twYld5aW9FSnNFYms0Y0RJd3gw?=
 =?utf-8?B?dWtUTk9tV0ZranlQZHVQOGZqdE1oS2VjNkkwRE41cU8yMlBSVHM3RDhra29o?=
 =?utf-8?B?ZHRKUkpwd041MEsrT2JScmp4T2pxdkxnRFdVUHZGOVI2d1pKOSt1a1JiVEtV?=
 =?utf-8?B?NURYRHFuRVB0WFVaSHIxS3hzY0p3bnR6QTVVZGJIRm5yWGZVeTNiTTNVZWtl?=
 =?utf-8?B?SXpyb3M5aWQ3MFdtN04zOE5vdlVmWFN2RzNKZHUvc3JBR25ZV29xUDh5SG9V?=
 =?utf-8?B?VnNIRkhqRDNWOGlyOWRMb3Fib0hzelV5VVdzL3lZUUZRWXAxQmNCZElQNnJx?=
 =?utf-8?B?Q1ZxQVFnbmVBaDkrTFQrM1ovZXBLYWdTWjVTSFExMFhnNkdESkRjYWJhNEZt?=
 =?utf-8?B?OEppYjl0UjFoc0xjbi9LWnljTEpCOTlPNEdXclJOd1lEUUVGY2hMczJYK0pq?=
 =?utf-8?B?T2xUazN0bUdRMXRiSUNhaHBnTTlGYWdDZE1NaWhyL05Tb0VxU2gwV3piVWxv?=
 =?utf-8?B?VDlRL1A1Qk40aWlqRFVsZ2dnSWZhM2J0Y2lyTXlJOWxBREpYcEZCM1FrQUMw?=
 =?utf-8?B?REZpYnNwekJwVk5zSm1rTURqaFpYK3Y3eURNTklBM3pxcFdxRk94L2t6SDlv?=
 =?utf-8?B?M3E1ZWJaYlFOTnpkcStGUytDeWJ0R1lzRHFJZE9NT2pRZDFIMkhNRVQzcGJh?=
 =?utf-8?B?RWhTVlljY0V0SnlUOUdObFNubWFnZ2RQSEo4UzlPVUh3MjZxaUU2RTBpcUUz?=
 =?utf-8?B?UVpiV1ZQQjBhQzRnQ2x4c1NRL2dVV01Za3hsckh4MFNsZEtqb21TR3Vkeldx?=
 =?utf-8?B?TWJ4QldPZ1A5akZ4bkJOZ3F4eTJLZTNQdWhBOGMwMmhRUGVJaXJTbzZCaHNO?=
 =?utf-8?B?QXZqS1FKSnZjN0g4bk41QWd6aTFPMXlGMHBVOVZJV1NUZ1hybVQvM25PYkMv?=
 =?utf-8?B?WXdTdnMvdzhDQVQ0NndTZmFadmNlZXVXQ2ZZYktQdjZ2RXdiRnBPREFnNTdP?=
 =?utf-8?B?OGw3QjRQSHMvK3FpRzFRZE1jTi9WTTd1dmRCNC9vNWJCWGJONUVkUCtndW95?=
 =?utf-8?B?clJoY1lCNzJsZkkrS0pxUzMrUXN4NEdHYmJjVTFYZ0RZcElyZTNUV1d5TThN?=
 =?utf-8?B?NkNVazIwSnM0eU55cHNkM0tPNFpUSGRjUFROUUt1VFRLQXRkcUJyeFkvY2FW?=
 =?utf-8?B?ejBNTkd2MmI3b3IrQzdVMjVPRElxWkhnZUJjZDVNMW5ZbndVZDFOZmM1R200?=
 =?utf-8?B?UUdZWXZFQXE0Skt2bEY5OXRWUEhwRW0vOEpyam1wSkJKRzNPKzVjbGNYUStX?=
 =?utf-8?B?MUZXZ3VMU2J3bUdEdUJicmh4Sm94bXdnQ1lsWWU5anBUQ3lNeEZnck9hcGdR?=
 =?utf-8?B?NU5heGxYeEV0WWZ0U1JZdmdjV0JzSCsySFpCSUdraUJOanRsREYzN081UUpU?=
 =?utf-8?B?bVJRSVhNME8xclhvOUZ0UXZyUDNCZVlCUXhCT3RRMjU3VXpCQzNyMVNaL0tT?=
 =?utf-8?B?Q2JHNDFKeTg3Z01ITmJqL1BydGlocjFhTHphdnU1c3MyNmJjcHVPQXQ3OHY5?=
 =?utf-8?B?WXVYdjA4a1Z5TVhwbnloREl4M2R3Z2hPQ05MY1RvQWRsWURrdkl1SnhxVlFD?=
 =?utf-8?Q?+67uZhOsXZixAhO0ARv1E7ZfQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2479bd-3968-48b1-0661-08dbf49dac2b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:50:23.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOfePtEKOMAR2fOXBPNW2vXEuTP7/TNsEDHh7S41YrRRhjLtnhnHBZTTseM/sNLyBBBHmH2xpRam5j8ILxp5lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9928

On 01.12.2023 14:44, Simone Ballarin wrote:
> On 01/12/23 14:03, Jan Beulich wrote:
>> On 01.12.2023 12:48, Julien Grall wrote:
>>> On 01/12/2023 11:37, Simone Ballarin wrote:
>>>> --- a/xen/arch/arm/include/asm/regs.h
>>>> +++ b/xen/arch/arm/include/asm/regs.h
>>>> @@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
>>>>    
>>>>    static inline bool guest_mode(const struct cpu_user_regs *r)
>>>>    {
>>>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
>>>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() - (const uintptr_t)(r);
>>>
>>> NIT: The const should not be necessary here. Am I correct?
>>>
>>>> --- a/xen/arch/x86/include/asm/regs.h
>>>> +++ b/xen/arch/x86/include/asm/regs.h
>>>> @@ -6,7 +6,8 @@
>>>>    
>>>>    #define guest_mode(r)                                                         \
>>>>    ({                                                                            \
>>>> -    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);         \
>>>> +    unsigned long diff = (const uintptr_t)guest_cpu_user_regs() -             \
>>>> +                                                        (const uintptr_t(r)); \
>>>
>>> Was this compiled on x86? Shouldn't the last one be (const uintptr_t)(r))?
>>
>> And again with the stray const-s dropped and with indentation adjusted.
>>
> 
> I will remove the const in the first parameter and fix the indentation
> in the following way:
> 
> unsigned long diff = (uintptr_t)guest_cpu_user_regs() -                \
>                       (const uintptr_t)(r);                             \

That still looks to be one off, but (supported by the \ placement) possibly
merely an artifact of how your or my mail client is configured. It looks
right at https://lists.xen.org/archives/html/xen-devel/2023-12/msg00057.html.

Jan

