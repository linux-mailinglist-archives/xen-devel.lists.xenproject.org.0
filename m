Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F1E3E55AB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 10:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165300.302099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDNIW-00018q-Fi; Tue, 10 Aug 2021 08:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165300.302099; Tue, 10 Aug 2021 08:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDNIW-00016H-CV; Tue, 10 Aug 2021 08:39:44 +0000
Received: by outflank-mailman (input) for mailman id 165300;
 Tue, 10 Aug 2021 08:39:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDNIV-00016A-4y
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 08:39:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8131aba4-f9b6-11eb-9f65-12813bfff9fa;
 Tue, 10 Aug 2021 08:39:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-h5sYDeX6Mk-r39yHF2h8rw-1; Tue, 10 Aug 2021 10:39:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 10 Aug
 2021 08:39:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 08:39:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:208:3e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 08:39:34 +0000
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
X-Inumbo-ID: 8131aba4-f9b6-11eb-9f65-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628584781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8N102LiC+nr4OvpxqgUwQ7axtekkwHAW3qHqcPtNKgw=;
	b=mS0MVVchjT4BHF6ogjvXorCrrSs8lq4Q5l/+gjzgN4OPqtpo5lkzzmx0GsE2oh0Ye99x6X
	JT4oDfsjpVApJETzxkxj2TDJK/s0MHAlOPVO1+KNejOhOJaFUyvNAcodpPNq+ED+2d83GX
	irFMnC5mk8cryTo4t3oKRSDgebt1oAo=
X-MC-Unique: h5sYDeX6Mk-r39yHF2h8rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1oBBQh7+zxFBtncpzWH46ul76Xmvd1diINp2rg8kHIoOZ2R+YJeOWNVadjig8Dahm6IVjcN/gsI/cW6eASG9WZd9/K7AD1lirddd1ZhI/ML60Am0VX0eBDj5iV5wPlCRR0pjwtuU+gMbJUshWzlJiHnHm9ihbmi9ODUwVVXE/Cfv87gib4xKNiJGL9NPf0+IBuXU2mRrus2Oj90MsGfnt9epJayALjMw2vUV0tE7UvsUbLK3msGG8wzJ9hplgvmUDAGy1YYDDr9KStZakvFk8TljNXxtitQzIEtkB5mUUSPeQV0OkqtRwCq8Pc4bSbURRAHbiU5YRp46dRbKQAkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N102LiC+nr4OvpxqgUwQ7axtekkwHAW3qHqcPtNKgw=;
 b=RVL+5vYurB5Klvvguj0oDFfAxPI0+fFN80FZosw63rpMu3W2t02SHfxbAPqbSrjl+y8oaYPUfr5ve3mfaheOLuqpdQ5s3+9rhpx3t/9eW3c9oORH9YGtEZXcumVcSpKbdWIFpXpljPlCS0UC5pJ0oy9wx/L/Zi0X786hW0N8NHNy06WU7Vl43p3XbxZ1E2XJ/jFMuPxYNzNPkbcYlymfS/TBZyCxnTjSbXu1qi0Raqg+92emUU3wSeaxkD9sJ7xb+5LJLKRGGO5yBltYR9om/U2R3BNMy2bjRW13738rfsNNsBc2FwIxwFHf4cW5rLUPJnh+PZ2xBaUm+DK5CuloOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <iwj@xenproject.org>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
 <24832.3234.356168.227371@mariner.uk.xensource.com>
 <93bcfe0f-2fd6-7177-53f4-8544582df3b8@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dbcc5ab-eea3-ae82-0b5e-c15a4bf35772@suse.com>
Date: Tue, 10 Aug 2021 10:39:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <93bcfe0f-2fd6-7177-53f4-8544582df3b8@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b9bc840-6f6c-49f8-8d90-08d95bda61ba
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333C65CB4D78FDAB4214F77B3F79@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IpF+t823TR1xMIaVej8UGpxhXLkBqei4RLMiKfP1eaTGSr53LP82hkmFyAlDxLjKDeBIhkj4teYgMDSrF0c1mNE66x2cC8viyvCLxEKjq2IziySBar578JJ/8eV3+TnD1EIjCmYa4PgY/HEX3EL+jsJ9Akq1psC1cDXj+8QOEOJmHL6bcs6c5jFbfIjzwpS9OsVkGtOCg+TZT7wyX+ef5Q3KlXhnD84Btgg3Q12Fd2gG0Rh0GI3lZ+a1Rbbl01OEZmh5jpLAU176oqy0SPxSJ4SbMvXu3LWObR+QoUTSX8vtevCcxQhZze8GKmwA6dZECpT2G1eLIXrDw1Ez2W979VuwrG0fbHRoN/RnFyeoAEiLpyWdfcO8kYdXUJ9g39OQsfE1PbJimlGX9K/u1sxH9S5DFgToKK/ta2sty3B8GhFYkDEqcc4ECEUcNRVpTeJyhUmU3jIdE2/tAkz3EEQZtNTVqteCJ+WHiJRJ0RRXK2u4JyqBuX068mHb79hAALXrdSOevldOPnBN72+qMybJyHgvzhVitbFCbEMTy/SS5I+RqB0guUSJIRGJiKrgxfebnQgJAkIum/FrvCz8oMkrm8nErdzYLM3jgUliQtEi/J/YhLqI+BHjvSCd299WmgDB/IJNcYAtNldoe1n5b2XRWyx0QUF708AjcECyd3FMZ3Nsrnx5U7UCjKjAC5Fn4SM+oZNn+gXuLwX2rTYI2PI5DpKneBjhMM7EaZF6bBvo28E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(346002)(376002)(396003)(26005)(6486002)(7416002)(8676002)(186003)(31696002)(16576012)(36756003)(8936002)(86362001)(316002)(31686004)(5660300002)(2906002)(4326008)(66476007)(66556008)(54906003)(38100700002)(66946007)(478600001)(6916009)(2616005)(53546011)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTl6c1g2WEt5ZUl4U0ZpaWtiL3hHTWpzby94TExCeWVzSVRvQ08zendaMW5F?=
 =?utf-8?B?dnZndU5XbGFPU3Mrc1Vva2lXNEVvZ2xadGZWRG9STzlISzZXL2xmZExXdnIv?=
 =?utf-8?B?ZytldERDS25KS0txYUhCVlN3TGMxODFqU1ArMHQ3bUF3L293M1kzNDVKQXdP?=
 =?utf-8?B?WG1IQXg0b2daRVp5dmc0UUdaZGZrMnY4TVJOOGc4cHVYaGYwbG9QTHcxdkNi?=
 =?utf-8?B?bVZUUFlxOCtvaGJoVDFOdnpsTTdzZi8vUjhvcVJsVUVIRDN6SWdLZTNVRTJC?=
 =?utf-8?B?YTFHQjF6bEdSa3pFYldNa0V0SC9pa0NJWmpzcmlsK0pZRjJiSFB3YWg0RjRI?=
 =?utf-8?B?bGN2L3ZvejAzbnJYM0FXbG82UFFzYnAwSDlGU29vQzlkMjlpczkxdTJFU1Vs?=
 =?utf-8?B?UmM0SktnVk9tTWRiTXhndWNwamszVzVPb3NsZERVWEl3Z3luUGNhbU1tZGwr?=
 =?utf-8?B?V1RYQ3VkWndET0oveUUwSVZKalJzK0Q0Slo4bFpNM1pIQUFwN2xRbzk4aENQ?=
 =?utf-8?B?T2ZlUDF4dlJjWm9YOWttUXU2ZkloN1VvV3dES3p4NkZkNm9raDlCU291ZUpu?=
 =?utf-8?B?UkFRWnArM1RsQ2ZpcDRWK2hCcThWZXRvWDFaM05mWkNSWis0andIRGN2U1ZJ?=
 =?utf-8?B?U0ZFQUZjc3Vhd01tZFF3VXYycHdINHpoL0J4d3ZyK0FqQS9QdHdvVEdnTE8z?=
 =?utf-8?B?elNra2tESjBoYzFxajFsSnBBakt0UjhhUWdKaHd5bnVZdDIxd0ovblZnNm9a?=
 =?utf-8?B?TFZhdFhISW83cEhxWjdLV3c3SUU2NEY3emx2ZkhNeldaZDNXVkZSbkxFN29L?=
 =?utf-8?B?N1JxZlhxR2lBVllHY0x0WTNsYWNXcDNLUG4xQmhGbFIzRlhvQmYxclp4aW42?=
 =?utf-8?B?WXpMVlNtNjZqNERVZkMwRXZseHNIekk1TkN2dVYwTU51TFgrZTdlRi9HcXR0?=
 =?utf-8?B?ZnhRMWplcXJxZHlGb3BpSmZwYjU3UU80KzVJTC9MWldaMmltcnNuMGs2K0NS?=
 =?utf-8?B?Z3dNWG82bStUVE5BaGVTVzFWWnpSdFVqcWh0aitRbVpwZllQWDZ6RmFySG05?=
 =?utf-8?B?TXVFRlU0T1QvT0NYMGk1Ui9mTXl6V3JDYjBkWER1UnNnWDR5dktGWjEvRDB6?=
 =?utf-8?B?VU1CanhjQ3NzcXZ4QkduQjVPQ09WT2FYSlZ3T3JJOWtnWEFaVGJCOGduY3Nh?=
 =?utf-8?B?VGMyRGlDS25ZSHZrUnNxL1Q3d0Zkejgwc21sN0JjUDZydnJkK1VRVzJud0tm?=
 =?utf-8?B?VFpoUXgvYUlEdEM1czdZbXArU0VKRXJRd0ZYRzFCeDJVTGNTcVVTR1VaNUJa?=
 =?utf-8?B?UTBzS0E1UHlrZVdEY01nY0ZUeXpPN3AvaUZWZjZqK3BzMWpPTEtkNG1BR2pO?=
 =?utf-8?B?RGpkRlUxOXhCWW1QQTNiakFGbGlJQmVXT0hwRWFodW1MT1JheGN1OFhLd2k3?=
 =?utf-8?B?Y1NFeVYrZE1Hd3A1d3RlWFk1bEJCVVUrajF5TG9nQ0xjeE9EWUUvWHJWbGhP?=
 =?utf-8?B?UEFoSTgyOHBMenNRWWFNNUI1SVI2UllMdzkvZkwzalE4bWdrbkZsMjNSTGhm?=
 =?utf-8?B?VUVweGdDT0pETjhKUkFmWlB1MElueXJ3aHhhR21LN3pxZkJVQU5sOW1kQlNx?=
 =?utf-8?B?MVF0ZmNjcW9GZENWRzhhdmJVcWltbFNrN3RqWnZ6d2pjUGhER29vdTMyVnky?=
 =?utf-8?B?RlBHOWVadXpydTNJTjY1L0ZRU3NMNUoyVEVjOFhWck5JTEY0cGdZYURvdDZZ?=
 =?utf-8?Q?UvxTfNgZdeM6RYjeYQU/s72zdAJPfhMw1XMHYOn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9bc840-6f6c-49f8-8d90-08d95bda61ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 08:39:35.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IX0a2NbEsiZjVb9ykS46MIUW8EXI0EqvVtyLonrKdKDE7FU0Z4B8ZMqR9lViPrDwPWqsZJWjk5PqrKFLaXMRsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 06.08.2021 23:41, Daniel P. Smith wrote:
> My concerns/issues:
> B1. The irony that XSM is unsupported but XSM + SILO is supported (for
>     Arm)

Just one remark here: Prior to SILO introduction (and to some perhaps
ever afterwards), just like !XSM stood for "XSM dummy module", XSM
stood for "XSM/Flask". There's pretty little core XSM code, and the
reason for it to be considered unsupported was mainly the bad quality
of Flask code (which no-one, not even the maintainer, ever cared to
address, except maybe tiny aspects thereof). Which luckily ...

> Deferrals and concessions in v3:
> D1. Answering (A1) can be addressed later by reviewing, refreshing, and
>     expanding XSM documentation
> D2. Will work with community to get XSM in a supported status to resolve
>    (B1)

... you aim to address. Until such point I think though that people
better wouldn't be forced or talked into including unsupported code
in their builds. (I say this without having looked at v3 yet; you may
very well have taken care of this already.)

Jan


