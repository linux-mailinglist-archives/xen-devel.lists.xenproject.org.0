Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4EA7EBE3B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 08:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633507.988346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Afd-00088U-Rl; Wed, 15 Nov 2023 07:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633507.988346; Wed, 15 Nov 2023 07:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Afd-00086p-P8; Wed, 15 Nov 2023 07:50:45 +0000
Received: by outflank-mailman (input) for mailman id 633507;
 Wed, 15 Nov 2023 07:50:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3Afc-00086j-Fx
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 07:50:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acaa1dd7-838b-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 08:50:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 07:50:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 07:50:39 +0000
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
X-Inumbo-ID: acaa1dd7-838b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6bJXVdTUsKf8u7zXxhb1ZgNBJc5WTE7Zz36AGdpxyAeeddWF/Dr3S1AsKCSPLN/8S70FAXQyCsts62KxxkiNrJbwBCXOccKw1CfwxouUOc944elp6g12zRm219i/mPhrIUVULw+ZoanBgW3qM4GaUgfSoEDgXzudddS5Ub113ifjFl3k4cODGg5fawoF6fKXV5Ud2UQCWcss6bJmE5ztNqG2sMs1J4RJMPUWaqufdxV9/QEABErv6evJVPsONMNl1ul5x3c7wUkfjZ3g82syyZkh0K7W+XIci5OZ4m2sdp0MwHOA2+2/2f9Pa8BXG3QKXkA1CfC3lHoMwnvIqcH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13L7dCpCKEZmm8KsbipB7zimEUzi1p1o8kjIDfwK2d4=;
 b=NYaC6IVV6yMNdJWidryYZ7pLqHfaj+73Mh9teKQlcOfg0ltK5zhdm+YqcJZcyAm7uPnkogxn0VoUMPwk3D7oK62kuarTiNiTMLz8NvHkAVCo3rmSVa5255SWBMtNOCacS5SKU4gpe2zKAmzyPo4pqsLirtGPu15r1KjtwR/01kU5aJrEdEYrO2YljQjy/i5RdWE3mT8tVdvfUSkJGEcB6u5iZioH4FHppl8OXeH0Bb2rKAH+KJxFHKDXY/uB4484/BcvtEDfU1iyZZAKsNCDnEJyRUz+7ReKgZCBVV66hfi1nvw1F/0Nve8A0ct94Q/asZfHNOPJaEYyuy6mEuGWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13L7dCpCKEZmm8KsbipB7zimEUzi1p1o8kjIDfwK2d4=;
 b=TMb4jPjdpbwn6SeZxAnri7GFDfN+g51bWWwzMTNHgUbrgNnPhzS0tDBfm2tdEEedHIJhO6H2AqtN43Bs1zd4Li/gr7iDU2UOHnLSlQGDmC2aDEypS5Xy1Rg9qjV7HOZMDz98MKC3cX0BZPD/3upbp31MwZan7DBCh7xHXNvAFKAL58p0tMqmpUu/+iUu8vfk1C1nT3X+EyrIHhZttlgJkgAHv4XTo3T6WfOVOVHy8tYY5uu5Q3BkFay+hQ+ga+sYKygI6Vu21aNmLQN46M0O0+W3NORGjZDelxjw3SGdE8x9rE6SyQxxGP422cVaq4u13aplQdLtpqp66HZt7h/CvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <baa3d68e-8493-4dfe-babb-66a47cef4f06@suse.com>
Date: Wed, 15 Nov 2023 08:50:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add R11.1 R11.2 R11.3 R11.6
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2311131540490.160649@ubuntu-linux-20-04-desktop>
 <6695fcfb-0762-e48b-69d2-3871a3acaad6@suse.com>
 <alpine.DEB.2.22.394.2311141431090.160649@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311141431090.160649@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: f72fe2e4-0b44-431a-8125-08dbe5af8f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ijVxzsl9GKwVCHLYvdoGky53u1Kgvxht179uqbL0Jk0QBrKLjmERpZi+a+OsPha6kSwraB/WeuwhG3JR2v8AUrSFrC1PhvdBpEUuzA8/pifggJJMnIMR1G8+kkXKBrByske/jVaq+z2WDwSyiugk0RhIB6JIYtsfsdLfxMjVuMw8MNXzGgT4qxQwiXRz3yIxK9XxU/PUBnLxArxM4GyksM0JK3SB/QmQy58AlWbeVtLwanZFi6DPjlfmiuZYoDaoPevWVlr1Q8Yu4/peo342e91hpeAQVNuOIE8VStp6mJA9uiI0ECy1D2vDrNEwOAjwabIry98fRYUAj9yxVe3IVpN9f03sNaOHglsuCAvld32biU8upz0afxI2sBMwZVYUBuSqPK/4YshDw/2pcegvhIlfE2mNCJtbDSvAQtQXzYKu6bXd9G3O/xr1hKHXdpNclTbGJIAKEDnJHwW8KoWr2xGFJHiFGH/N2fsdf/BramsF2DuvS+G4/qeZQrMxT9K9Qt9S0QU3GAfbTjHyCq6eIv1waj1GrRMLlAudfzPGrBskzUtUHufU54CcNfFT90mRfwzYxNyJPoK8EFupg6oGMSuIrEp3f/jojIiaZqpluj2QDaBbXRbwrGT3OSfPxObjsyrX9YSJ6rwsRnoZrvnLxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6506007)(6512007)(2616005)(26005)(478600001)(6486002)(41300700001)(86362001)(31696002)(31686004)(53546011)(66476007)(54906003)(66946007)(6916009)(66556008)(316002)(38100700002)(4326008)(4744005)(2906002)(8936002)(8676002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJzRVVRS1RxU0VZL1RrRWI3K1pHZCt4TEZJMEp0OUg2UW9LNzRtSjZoTGJ0?=
 =?utf-8?B?M2RvRXFzU2F1dzlqRXYyQ0xZcjJwQmFjQjUzblNUOHZLcGU0WnB2QUpENG5G?=
 =?utf-8?B?NERDN3V3QUNPKzJyY2hYUlBPUFFrOStZZlVudlZCS3dIRHdlOXdaT0FTNlN2?=
 =?utf-8?B?NU02OU1KeUFtZEtqU0d5Wno4Q3pZNjdjVnNWSnNNN1B6czRjdHRYdnI2U2Iy?=
 =?utf-8?B?c2tUVzZNMnA2RXFWZEZMSHFLSHYrNTVHZk4wYTBJQW9iUkJrWW91d09CM3I0?=
 =?utf-8?B?NzNFVy8vbjVEVHdaYTJlb201enpVV2JFOHpVRzdGcFdRbWpkNDZhazF6dHVj?=
 =?utf-8?B?cmdFVks2UUFxajAwdm9PZ1ZtTU1RNVNUdHpzZ0t0M1pKQ0c2aFRsMXg0OU12?=
 =?utf-8?B?VWs5cDIrTnAyN1VSZGFnRUxQQnZyVEQ5ZDJpV1ltWWErMEpxdFVFUUJ0UWtu?=
 =?utf-8?B?cndvUThoelJScS9zQzlvY1FTK21nZkluRi8rTGFKblcwaTV0MTVvQ00xeTFU?=
 =?utf-8?B?dVBXS1NORG5oZXNQR0x3ZldsT0RZWmd1TG5WOWUzTnB3ZXpvcEJTTWhpbUhq?=
 =?utf-8?B?OXZxc1RGMnlwQ0VvcDQ2VHArbjVla1oremYrSmUvc2tycnBVdUQ4THoyLzRp?=
 =?utf-8?B?NDZHR1RWendGcVBmbi9WTXlPaUpKSWw1dUN5UWFDY0pOVjhJRjZZQmF4VUxa?=
 =?utf-8?B?eElRR0d4S3RqNEUxOTUyNnRuOFlJdHRLSDRoaXdBVldkeVl0UCtQSmVMOW50?=
 =?utf-8?B?VTIwRmRUa0FIVmlFYmMrcUJCUmtHbkpRVnpSakdpSENsZjVKbk8zWkcySFF5?=
 =?utf-8?B?cTcxai9VWkprY2lSSkJWSi9xWnlOZlgxcElzSkU3S1hhZVBTMXhoTUdxQlpK?=
 =?utf-8?B?VlRaRzY3Z0FHdW1XLzgwZXhLT2pHaDQ3QVRSamJOeXR4eW50cWJ4eVAwUWtt?=
 =?utf-8?B?N1RDQjN1OWpKTXNUcEFMMzBFWXZaQWZreVI2N29xa2lDVCtGMkpCNGpEOXNt?=
 =?utf-8?B?SVRuejlWMlhyMGFROGtBSWk4SEI1WjdxcWo3Y0ZUWTR3N0YrS1Q4UStlRWhk?=
 =?utf-8?B?QjlGa0hySUZLakw4Y3hHanJ1TGZnQURUbzlIUVFDRmd4bndCUVFqeTd3d2p3?=
 =?utf-8?B?NVZuK3hzUHBHR2hlS3NqbUozd0RaL2ZCdDNKa0QyLzBiMnhWTlhZbDMyYXJt?=
 =?utf-8?B?T1pGMjhoMXo0UEtTT2NaRHdnM2szYWhXSkMyR0VOSnltNjVQZGRZc0I3OFla?=
 =?utf-8?B?cXpVcGU1YXJWc0dmaDF1M1VSelVZa2pRMWdxQ0U1U2RMeTNRY05TMkNtcTZT?=
 =?utf-8?B?TDg1R2N1RVlSbWM0UlpEdkI2eFFZOFozOTVvSDJjbmNaNG5sRytFeTVxWHFv?=
 =?utf-8?B?UENMenVYcFBUM1VEWHh5VmEwYmdzajlMM3VPQ0ZPMTlzUGlaTmJuRDZBQldN?=
 =?utf-8?B?RmRxU2NIbk5xU1VTN1picXk5MDVsU0w1RG5OaTVZaHA1U1ZMZW1pcFpmQm85?=
 =?utf-8?B?d25aRWErQVVDaWhDVzJ6K2N0eUdhM1Q3QUY0WVBSUVF3REdrWnpBcWYxL01s?=
 =?utf-8?B?M0VqSm9JbWtOVXJhRkh2RmVsdHlNTGFQbEI5eWlTdDlLV1UwUGtUZExkSUNv?=
 =?utf-8?B?UlRCTDFlUXcxdldjZ010bnFvbHlEWWdJR3ZCWUVZQkRjajcybXVrN1RsM2dz?=
 =?utf-8?B?L1czWUxrV2hqT05rQWhKNmFQUmFiNlZPVkFFaWx5a1plSVFCWEtINXA5UGdD?=
 =?utf-8?B?UXR5ZEdjQ1FRZW0zY3lQbVNSSmV4N2ZIbGY5T3hCOXFCVzY2MFZudmpreUMy?=
 =?utf-8?B?dHNGVDZHcVRscWdkY0lWWHhQL0pGSHEzT3BBNWhaZElGUCtxTGpZZ2NsU2JT?=
 =?utf-8?B?bDlDQzlEbGNLTUVwbm5Fai8xZFV1amhFRWJPcDdtZWVTWkg2OHE2a2I3UWpR?=
 =?utf-8?B?TzN4N1U2Z2JMOWZaVUc5MTZCZk5OL0FsemtmcEpoZ01DNU5oNEdxcWFlNGJx?=
 =?utf-8?B?aG4zQzlQTklQT3YwelVaNzYyZXFZZjVSMUZMdkJqQzkxRzllTnVlMFZ5eWNk?=
 =?utf-8?B?SkNnVUhSZGxJaTBTMDlubHdtV0VHeld3YzRJN1g5SU9oL3VNWkMxSkd0cWVV?=
 =?utf-8?Q?DJBwZssULZ1wn5nb0i9aoMBe/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72fe2e4-0b44-431a-8125-08dbe5af8f98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 07:50:39.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNLt8SJSDdgKnyRWhliFT+Qi4nLkZYRErh4o0sCmPAUOxZ9k6jbdTqrD8ww4XiqQt8eid4Ar3l/Oa06zgYnZ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821

On 14.11.2023 23:37, Stefano Stabellini wrote:
> [PATCH v2] docs/misra: add R11.1 R11.2 R11.3 R11.6
> 
> Add MISRA C Rules 11.1, 11.2, 11.3, 11.6 as discussed.
> 
> Explicitly add in the notes that conversions to integer types are
> permitted if the destination type has enough bits to hold the entire
> value. GCC gives enough guarantees in terms of preserving the bit
> content in such situations.
> 
> Also allow for bool conversions (e.g. to check if a function point is
> valid).
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



