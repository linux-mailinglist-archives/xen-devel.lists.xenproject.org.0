Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF67F9F47
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642029.1001083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7aST-0008JS-5g; Mon, 27 Nov 2023 12:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642029.1001083; Mon, 27 Nov 2023 12:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7aST-0008GZ-1w; Mon, 27 Nov 2023 12:11:25 +0000
Received: by outflank-mailman (input) for mailman id 642029;
 Mon, 27 Nov 2023 12:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7aSS-0008GT-4k
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:11:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1492ae8a-8d1e-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 13:11:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8625.eurprd04.prod.outlook.com (2603:10a6:20b:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 12:11:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 12:11:20 +0000
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
X-Inumbo-ID: 1492ae8a-8d1e-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeZ88Z4YkS445LFxoh0qfbmzP6S93KHdsfzggalrrh7Id3vqBcnTxJmd3oOjn/Neval48/lY2jwsGka3B+sHOP34ijkoKnxLYGQDMSFZXGcaFbwHFdaNvApLKs/5vc7kiTkrYSqboAsqNzdpw3vKGDwcJ9nGsfOW1N7wfCCN+c3rqJ8IrtNkG2AaMwOVW6QESly4XI9gbg2P4OCa5S6q5fEBSk+zEqs+kcrlRF4eZFWLQ5jfNl/rMC3BCVZgoZo4YT+e6sI5ddJEBBrDF4yzMsZGiCDjy3WtGiMUhSYv5BP1j1gsYtJpLvphb/JpCOFRVbC7+48R+eOowTbYBRZJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n3CALkEYIwfZZ4OYFHSS5u0IpUZoHX4ICiF9NsnVLI=;
 b=QTJQlT0ic7yICp06LLtHv1pAPubLNOhxqAXpo8zcg2rCD1bhL459jqqDQSkrqw2acPFGKsI6Q4D7PaO2+FWTPNJPEBKP3ARu+f06GaNSGQpiax426vcgoovTwczZxpxTAdX8xvRG8yzQwJrIGqPTKYMSScvNdNNiITx0ac0J0M5+i8gvW9WolamhBB/WZ+DEKjBDN/wrp18PmqmcUK/bdyQ7NWrH1WFpkEgRX2sGE35GnB0zvM5Y9M0x7cbJtx4Oj8PLg61HPdoS47PVahk1VXBJx/YHuFKtyJZT5j/PJ9//SpEuxfwRNGuGjwdu4mLnNRZM5RCJ2rTlt3Qe4so5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n3CALkEYIwfZZ4OYFHSS5u0IpUZoHX4ICiF9NsnVLI=;
 b=eHOA+5Tuz6kYMOxGWyiGR/gkvB06jKI6uBcrJwiIhWfapP97D8f1/nuj0CKRQL5d9PmzV5nlloMOBIyErZIi0bpJgayvp8pxxAOYr4DcX1iD5la46L1N1V9ItHEAH574Wc8UmaYZQC4x+43Rg2vTIes0hhxfbL8eJDkdLEK1Nyr7b7E8kiJ7aiJG38PTF4j7uWVVMgPBk5sCiXAgMcMYGlQXorV+gQ4e8+1JumEVfkkvFGkRLPYIedZj4ch0oAdoAZ55M71IxCEQInUam8F/71tDyjai4MOIexBSKjSEe2IZpDJrjorgPpVQoj2JCx43pMZDwpOk0LcDkVxxlbVu2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12adb389-c84a-43a6-85eb-68eb62c2b24d@suse.com>
Date: Mon, 27 Nov 2023 13:11:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] xen/asm-generic: introduce generic header
 altp2m.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
 <5a1b98cc-cbda-4355-87db-9aea12d21d73@amd.com>
 <f37ac1d0-888f-484f-9e74-40699cd3a620@suse.com>
 <f3a707b82b3f2c8829ca1a26fe4ac307f9a212bd.camel@gmail.com>
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
In-Reply-To: <f3a707b82b3f2c8829ca1a26fe4ac307f9a212bd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8625:EE_
X-MS-Office365-Filtering-Correlation-Id: 946cdadd-51a1-4f49-9130-08dbef41f726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o8Kcu59ELeCbjljuR4YPXIt43UAmTtz3C82E7xJTLfbcd0QgMQcNrHh7R5S1/A1NHUiPmB8kmhNbu37d8Q4ZFNELl7V0qVrQee4Uo03bM2tgPMCbdKzzusGk6rETPjEd9t71LaSpUTHZugPDTbQdSrXgujduOMbHT4LwKxrAWieYZsC0tTHMn8l7sEXXU1OLtUtE4nhB0iFaxnXL6Hj6T005995yRZpEsfpyv1KnmRWRS/2A8umIV2VxRN7BBI+zNMCfYyPz5iK0Lpl3GIjQTR/5F0MT9+cl0Gesb2EZDUm0RqoReJ9VV/tngMXoq8+X0bYTngSf0EXZvBotdwZvmzlMm6J0WHkZgw1lYoBBT9KNXXOxfv50w8DD3VRMa80KEX377aB6C3KjlQM+Zrqvq9eW728peswiNNx5P8WiNyAYCVt1LFGnZ5MRAP1OGm5NOz2rqyi7zZ7EtdZai/FXScKOX0PYn7tcl8fQ4AameNtBSfjcp+jo4YTRem8o8X1TKtnempWIUl8ZRW3h0Li+l2LKjlq1lClQOOWgosIYm0+sd0kW6v2pY2gKIsEMMlsNkeRYUeedSdJz4qwGgpXMu3ufsnLAWs9Gt69za6sOF4ZZh82RnGKch61CblASIuaJTcTSjSCgmsp8NV1QBoiDghhkMPTO2XMWmEHrPI5KvYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(4744005)(7416002)(4001150100001)(31686004)(41300700001)(66946007)(53546011)(6512007)(54906003)(8676002)(8936002)(6916009)(316002)(66476007)(66556008)(478600001)(6486002)(6506007)(5660300002)(4326008)(2616005)(26005)(38100700002)(86362001)(31696002)(36756003)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDc5Wk5iZVYvRzFLOEY2cnhBVS9oM0k4NW1yK1J1dWZRWlFITU9PWjc0OTZE?=
 =?utf-8?B?Q0dwOTAzZllHM3hSSXZnamcydVQ5VmdINUQvVTkxSE1WczczSVhLMmtITHFD?=
 =?utf-8?B?MVcySmVpRzBtZWZES3lkeXJHeG5OL1FWNzRnWEFmNlc4YlRrSlJ2bFZvUE5k?=
 =?utf-8?B?amlrbEVOSmhBR0lLbFdRdkZkdDI0Q0pXdmFTTHlYK0tlRkgxdnJucy82dHBU?=
 =?utf-8?B?c2RzekNnR1lFdVdmK2xISTRmL1dKbjU5L2Z4TmhMZHhOU3U5T2d2QWdoOHho?=
 =?utf-8?B?aTc4elAxTVNSRldka21HaUprWWc3TCtkM0lUNEFaWVdnUitvbjJ3bXlXV1py?=
 =?utf-8?B?cE0wL3c1a0RUWGNpQXl6Y1FDWDk5Y3l0cUJhMEZzR3hoZm9xTDFsNDBjalNn?=
 =?utf-8?B?YXlTSHl0bWx1YXVQbzVQYWdVbWlRVHBYUXV1MlE4RExNOStJSDlZMkhIUThQ?=
 =?utf-8?B?UG5zdmVDMlQraDVtdU51KzExdHFpc0ZHaWhBTUdDbmZYdGR4NkZzQlByeFI1?=
 =?utf-8?B?eXJNckFjVDZlcnVYN3R1Qm53YVB6Q1h1SDJYaVpEZ0dHekU4MlY2anN4UklF?=
 =?utf-8?B?YlE0WEFVbmpKM2JLcU15T0Y2SG14QXp3WjN6ZnY1Y0hBQnZYeGtMaStuaS9o?=
 =?utf-8?B?TG5LbnM0bjRkTEozdi9VYTl3ZURCV0pvWjJNSC92L2d4UFpVS0xoZldGdXNp?=
 =?utf-8?B?OG1ZSnNjL25CUmRTS1R1SjVUUktQWEtQZlNhZ1RKamViNzB1aWJaY3Ftandl?=
 =?utf-8?B?c3dGM2taczBSOUtOL0lwMk1iSGliZXd4RDYwcW1TYmk0Q0tjVzg4SEh6YlBH?=
 =?utf-8?B?WjMyM1orQ3Qzd0ZuemxHa1lNNGtsU2ZoM0E2STFVSUd2ditkc21oZEFWWktB?=
 =?utf-8?B?QTE0ZHdhVzRRRDhxQ3RYc0pycWtsb2g1M09ITFlZd1JhaEJxeUtDaTJmQldY?=
 =?utf-8?B?TjRkTGJmeGJYM0tnemdKRHUwSFdaRExGQUM0WGNvUlB5dFVGYXl4Slpmc1VG?=
 =?utf-8?B?SHJFaXcralpwQ2wxZWx5djBwZTRxK1NrSjBXUm5uSlNCYnZkWWkwNWxLdnJ1?=
 =?utf-8?B?dVRXVWxZc21oOFAybklEVFN1dkpScnovQlcyTjFmWDR5cVRSalBGVGY2TG8x?=
 =?utf-8?B?YnZuMmhGTjZHRUMzUkJvVEMwRHlEWUpRMmx0Yk90a1NMZXRDZzFpbFRDRGRW?=
 =?utf-8?B?dFFpNkFjK1JVMEoxRjBBMXZvVUtGRDVOdXdZdnE4cWUybXk3aThZeno5dWVP?=
 =?utf-8?B?SWxVaGlOeks4TWoyNER2V0laYk5ycFVhenJaTnRvYVVsLzRneUNWeWV0SHhw?=
 =?utf-8?B?MU5kNmFXMVREU0V5NGNHbFlCY1pHeERJUVFvanpZV0w2cWhBN0pkZythNC9C?=
 =?utf-8?B?VTVBNlN6M0l0c2IvSzg2UDVwb2U1Sk5yTG1rUE9Cd1UwaFNGREdxMFNIR0w0?=
 =?utf-8?B?L3JQTmEyTDV1VWYrVThPZEpncWJETnF6bUl0YnA0WnB4aXZZUEJaS3M2R0xY?=
 =?utf-8?B?Yy9FVjlqY3pDTWlxcWIxeFh0elJ0OEdKcmxzcGtPeGtRYXFCL0lkZXlWMjAv?=
 =?utf-8?B?YmMrd3I3UWFJWWUvMVI5Uk8xL0JXYkw4R05PcUFYc2xZaVptVjFFUUhBS2xQ?=
 =?utf-8?B?bDdRaFAwdmdZOUR0UTNoclY2WS9Xaldtb2hpeFFWKzdDaEtUc3p5LzhKbDNW?=
 =?utf-8?B?MUd3aEQ0N3pRMTZleFFYaVhpUTcrUDJDYWJCU2djMVlYVXUvSThZZWcvN2Fm?=
 =?utf-8?B?bmF2SWx4SDM2WFhMSXpTb3dvZTd4THVaREdpZlJHUHVzWDB2RE5EUnhOaHJK?=
 =?utf-8?B?a21pNkY4MHlrOFMrTWR0VW1LM1dBbDZMdWlNTjFmTk9rck1GM21qT1FrN0oy?=
 =?utf-8?B?YmlXbHFub3VhYW9aVi85aUdrenRjUUJNeG94L2ozYkZpOTRVQU1KL1dpRzRB?=
 =?utf-8?B?U0pxeHdYZkJId09kY3RqNURvckozQlpEdDk5MGliOXg4d1BIbmVMY095eFRm?=
 =?utf-8?B?SnRSRGtUaWdqSERyRlRzb3BTenl2MlRYdGV5SUlmbmxBVTV6Z3Njb1pKV1R5?=
 =?utf-8?B?dkZEdDJtMjRocGc1QjBkTW5xVU9Ib2NOekJsYWJuVzFEN0E2NzZoUXlKV0RQ?=
 =?utf-8?Q?O5t//4YCQm1CeTptEUUkE7M36?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946cdadd-51a1-4f49-9130-08dbef41f726
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 12:11:20.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgoGHGzWRtu6u+bBXiSdpB5bz1XuDOIcVnMDLbu60uFWuYFfsfNMSZRmEbmKMRwu5Cxf36IlH2ghiBCFFLykqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8625

On 27.11.2023 12:48, Oleksii wrote:
> On Fri, 2023-11-24 at 14:18 +0100, Jan Beulich wrote:
>> On 24.11.2023 14:00, Michal Orzel wrote:
>>> On 17/11/2023 13:24, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/arm/include/asm/altp2m.h
>>>> +++ /dev/null
>>>> @@ -1,39 +0,0 @@
>>>> -/*
>>>> - * Alternate p2m
>>>> - *
>>>> - * Copyright (c) 2014, Intel Corporation.
>>> Shouldn't this copyright be moved to generic header as well?
>>
>> In earlier communication I raised the question whether such trivial
>> stubs are actually copyright-able.
> Could you please give a link?

I'm sorry, but no, I don't recall in the context of which patch this was.

Jan

> I couldn't remember what was the decision
> and why.
> 
> Thanks in advance.
> 
> ~ Oleksii


