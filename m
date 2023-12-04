Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76325802F18
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646703.1009255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5XN-0007oO-Nh; Mon, 04 Dec 2023 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646703.1009255; Mon, 04 Dec 2023 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5XN-0007me-Ku; Mon, 04 Dec 2023 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 646703;
 Mon, 04 Dec 2023 09:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA5XM-0007mY-Hd
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:46:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a7e5125-928a-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:46:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 09:46:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 09:46:18 +0000
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
X-Inumbo-ID: 0a7e5125-928a-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc5BK2Pne3gvWJmBKTVEIXyOjbk7sd7yO+JL270gDRwdFrWISqtBhwXtVZS2LHX4YhI20neGLwOxJDAbQgd6UTtq1ca3YwIgpyvgjb+cOdF87dei9W0da1vswNBPai+h22EsWtCOKW1oiMaeBN2OWglND5B4foXyyCqhrPU0VXHW2dzfawmvG5cVqpxVMujo24gdPRjxi7CEMqLRecNs835Jx6RQ58SG8XTYlfVp/BJnQ05Nd4W4aeMtblfHM6WpcNR4Qmg/nTpNOHqpNDGBYXVE5R1ppGsec1kvtss1YHktcYG+c/H4QRLxdBOnC8aOHa4VodZMQusbu61HLs4AyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgOu7R3b/ruejFf2564NEBBdQQ6D81cOPPTVDf5qamY=;
 b=Ahk31vJ891F7v+0KcmGpo+EVyzucooBCbZtgRCJnKFJMsQaNJCHPGPGbWeqRJzumKtGBZRxxcJLt8nmyvVvZnK8llqu1FNaMJlWNVmmravHR9c5V0PsGhyK8wIcTdq6z+yrlA8a/f8mNV16gFohX9hO8kK7e4t6C8mslb/npbTvrdjtPLPIziPpY+ARbanEnf1uCjtWV+D0mcihtHdpi9nqXixdaDOSGbEccVoRVzAo5iymD8yF3MP1uI2ieZkcFGmHRtgm0ICRAnRg3uRKQ0cq+xho4tyxr5GyLlBfyxev1/gswSd9IaQA63Q6MNkxHxQj4n9xjEe31dgJ/g8Sf5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgOu7R3b/ruejFf2564NEBBdQQ6D81cOPPTVDf5qamY=;
 b=0zZMj5YtPoEO/n1BDDWtZOkdz6zuK9abG+F+tGICu1m/hjCn6emOlexSqa+aZza8EXJK9Pt5W/TKt2RFqegDne+Bc+xvpikOfPmlEXvAxJdwJDuCebn+0J9i4AVlzMGiKQLtC0WfcVIht+5lUK9NNckWpsp4eCwFYZdZuAG+D8svxk9G8KW77MEDzqfZcae/LDN7WAdpS/2p6Br7Vgi8BQo+UeeGoBBn490ZwD8vQOtyGRdx54a6LhEq1/LksQkzTDrUe/Xitjf5fGaOEPEZmEzQ4J/u9WDudC0pf5fzn2IJuw7oqx/wsmGTdkRDK7BqxwSkUolgAliI/9fv0iiM2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
Date: Mon, 4 Dec 2023 10:46:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
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
In-Reply-To: <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be3c1aa-52bf-4d67-34a4-08dbf4addd51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rQy/wW95f/RCc0NdL1orUnQ5wg9aWRK3SWqs6sdaOazcGbA5/Ds2hihM3hKPGCWRcrNwM5+FutuaxBVyQdl97u8zfYH458/LJ/E8gOQdmRyR3Rz9L3B54qiLhtqy1uefNRwt/pfHx0SrIrbCQPkwzWiQYmueXr4BLJdS/GWR7hUEMM/5+vcR0lAwYhN58YmmmSS+dsYlnP7KJHxk6ZIRCNZHvGk4KGnpNkWxva727tTjLJjHUIbCPlrqKLDBNtOFA/Z4b2IhlAySdLD2mCeFm05DdjlQYw7QxnguT/ByeWXJ2rypc6ztqgrPLqytN/DPCfnptYScvuKG2e0xk1SHVeGvVeFTNHjbiV9OKu69JRWC8HQ/x4N8fDY8/L7YvbcgMU8yv00g4J/4wFgDwFzRLk2z1iUR5UJFN7suDqkRdMP2CtE2Vlf8L3bNGjIbmaJlp+4yf3F2KY3FTF1CFNotMdGV+In4dZAD7RUJUM4eGCLZx4yMqoGPX7i44qAmiS5PAZ280cJJvPgCgBmaklSJRBZSxbL1ovJ6FFmjg4swLStaFECQnsTtfwRzeZuMXikubv8ERP8P5OyFCUuUQnJSS/5CRLW31TzDoid5Fuzshi++qHe8efoy4YYuuhnAejorHs5Q464t9b5w042K1IXnyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(7416002)(5660300002)(31686004)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(6916009)(38100700002)(41300700001)(2616005)(83380400001)(26005)(8676002)(31696002)(8936002)(36756003)(86362001)(6666004)(6486002)(2906002)(53546011)(6512007)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3NBZ0dDOUYvcHJOM25xNVlrMncwOHlDYmRDdWtOS1NyaW9aTElTWjk2OHA3?=
 =?utf-8?B?bk5TYTBOSGUzNWxybVhZbER1SGZBVitGcmV6MGkraEFJVG9iWGZvSWZQVHJz?=
 =?utf-8?B?czNxdy8vdnpuOFRkM21zczVqNWpiNi9xbnlnby9KTHJQbnpkb3R0Z0E4ZTZh?=
 =?utf-8?B?bVNSbnNqZDAwS3FFbjZ4dmRubUUvbHljL05JQ1MydmxrWUhFcXNGaEtqSG9p?=
 =?utf-8?B?OHJONjlxaUx6ODJYeFJSLzAzQTlHSU5QOFpUY1dySkFrVjVWblN4UDA3WmhL?=
 =?utf-8?B?Q29NejRMRlZzOVdYQ3R3TUZBM04rSUYwdlcraUxtL3ppY1Z3alJGSlh3ZnNk?=
 =?utf-8?B?RnNvVlAyd09Ka0NDMGFaL0poREp5RE84Q3JObFVhNGI3b1h2MWZXaVhndG05?=
 =?utf-8?B?NU9HTTQ3bW9zZkxpZk9QYmhFMEVSYm01d2tBc0Z4WlJ3RU1TSXdTYUloOGc2?=
 =?utf-8?B?dENJSVRLYTFXQ1c0QlJPcStKeGN2eFRjWUp5M05pd3V1cm9zVWt5Z2ZkZGZ5?=
 =?utf-8?B?Y3cyak1pWHdQcFROUlJWdTVOTDJCR1FHN1VCR21TN245bElxQ0JqSnhDTXA5?=
 =?utf-8?B?OTdycktyL3UrZjFwZmZwbWdtYmVmRUJmQ1F3Rldmd2kvMGxRb29rVUFYUGE3?=
 =?utf-8?B?SjNTeFpPNlZtVzlnR3VjTFk0U1pKN2lLZTZCVEZjV3hxcU9CSTRrT2JBSVJk?=
 =?utf-8?B?OTVNV0Zwb2p4UkwydEtRQVBiaDU4ZjN1eE5sM0JYK2RjdDVSTmh4Y2VKdU5s?=
 =?utf-8?B?SkR5NFZFRkZnQ0RSYUVrV0diNjBoMjRNV1FjRHJKZWFRZFV2NXFxbVFvZHJQ?=
 =?utf-8?B?aE0yTUJYUmFDaHd6NERDUFMzSENaaExHWXhycUtsdE1CTVpEU2MwUzArbmdF?=
 =?utf-8?B?d2hPVmVNancrWEZ0YXFqd243WTZ5WXBaRTRlbWN0U3ZSRm9aSUFPbnIvVWc1?=
 =?utf-8?B?TEZXYmRRRTAzaXhMMzlSUEVSakIrNi9mdTVhK2RSUTkvRkRqYXRaNExHVU9y?=
 =?utf-8?B?MUFYRm5hVGp2NUpBcDdCTFdTWVpsL0xDY2hSVXloQ0V4SldhZGp2MG5OY1RH?=
 =?utf-8?B?MUI4TmdyVU4zdm9ybnk1TEpuSFZpTmI4TlZqdWZkc1lGK1VjTHlCaC9KNmJn?=
 =?utf-8?B?b1g2dDgrVFBvVU01MGl3dUd3L0pJRmJ2dXRtTE5RTFBNaXlhSFlnS3liQVRH?=
 =?utf-8?B?TjhZNmNKcC9zb2RJejcvb2VMS0ZNT1RtMTd1WWpTWXJuVmtyOTFWMFo4bVoz?=
 =?utf-8?B?Tm1MMFl1bmJmR2tUTXh6cDZMOUhuU3QzOUlBZENoN01ESnhieEk3d3BqRWU4?=
 =?utf-8?B?NWU5ZDVNaHdINzNaeGJUMmM2ZFhWd1lEamJic1h5UGozcm5hK25palZta0dM?=
 =?utf-8?B?M3pPRHE4UHJLWlBnMlhwbXVISE5kYmRPMkNLVEJwZkxyYk4wRmF0NjA5OEdx?=
 =?utf-8?B?bXJVV1hYNWJGWVRYNmxZMDdOYzJ6VUpYZjgxRVI4MnhUZmJybFBrQWErYXd6?=
 =?utf-8?B?S3EyUjhrS3JXM2JibE5UV29oSVZ0bmVjS1Nyc2VIeG5CWkc1N1dycFI1RkxZ?=
 =?utf-8?B?OVV3Y1BtNWFoOHpqWVNSVzc3WEdDNzNxdm84T0xmdVB5UHI0Q0g3aVAxV1Fz?=
 =?utf-8?B?blM3TzZ6ME9WeGJJVXp4MlJGdDVoQ2VXS1BCcmEwZWZwYzlodm9lci91N1Jk?=
 =?utf-8?B?UTh4TWx4bXovK0pXWm9vT2NkWit2UUF5UWVWaWJFNUh4K2Q0QlN5cW1HRTQw?=
 =?utf-8?B?WFV4ejVmVWh0TXNlNExzWHdRQUFqMVQvNFNQbTQ1VStJdFVlRkZhWnVJWHBv?=
 =?utf-8?B?dG1nMHZnN0MyQWZZdU9MYkNGZWViZG5mVVozeTVyOUNwaXhXS1hWYnVwdE1v?=
 =?utf-8?B?eCtEaVhHVkFCT2xkVit3UytNSmdlVnFCa1ZUYWpvN0FaelJPZTFMUHAxNlhJ?=
 =?utf-8?B?RHVPS2dKa21RdWtnK2pmeDRQcGdTaFoxbENvTzNFdjNOaDdKbEs3NkR6aDBp?=
 =?utf-8?B?RWk2MUR4U3NXVUxrV3lVbXNERHlkV1pJUTY3dWc4ZktLWGptV0hmekwrNXNt?=
 =?utf-8?B?amdtSjFuSk1BM1pZSWhFU3lvTnNUVW52WThBd3E1SEUyVFpQYUZRSlR0M0Zn?=
 =?utf-8?Q?aBhurspUquDR8y9PQWKLFLJG2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be3c1aa-52bf-4d67-34a4-08dbf4addd51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:46:18.6304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxfoPVwChidqhfCEqBcVEFQvhlkPbR0I0yp+WP3K40tlNmMYCQpP9JrSODSu18P9mBzItloGwVdaPjWWnY4mzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902

On 04.12.2023 10:39, Oleksii wrote:
> On Mon, 2023-12-04 at 09:41 +0100, Jan Beulich wrote:
>> On 01.12.2023 21:48, Oleksii Kurochko wrote:
>>> Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
>>> generation of empty <asm/grant_table.h> for cases when
>>> CONFIG_GRANT_TABLE is not enabled.
>>>
>>> The following changes were done for Arm:
>>> <asm/grant_table.h> should be included directly because it contains
>>> gnttab_dom0_frames() macros which is unique for Arm and is used in
>>> arch/arm/domain_build.c.
>>> <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
>>> <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE
>>> gnttab_dom0_frames
>>> won't be available for use in arch/arm/domain_build.c.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> Not really, no: In particular ...
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -15,6 +15,7 @@ config CORE_PARKING
>>>  config GRANT_TABLE
>>>  	bool "Grant table support" if EXPERT
>>>  	default y
>>> +	depends on ARM || X86
>>
>> ... this I explicitly said I consider wrong to add.
> Then I misunderstood you.
> 
> What about to do the same as with MEM_ACCESS config and introduce
> HAS_GRANT_TABLE?

That's an option, provided (and I put that under question before) there
realistically can be ports which don't mean to support grant tables.
You mentioned that things are fine for the dom0less setup you're testing,
but I don't think a fully-functional Xen port makes sense to only support
dom0less. But of course I'm willing to hear arguments to the contrary.

> Or would it be better just update "depends on" to !RISCV && !PPC?

Definitely not.

Jan

