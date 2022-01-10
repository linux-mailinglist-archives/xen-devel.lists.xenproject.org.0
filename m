Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45059489762
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 12:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255292.437437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6sol-00077f-RS; Mon, 10 Jan 2022 11:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255292.437437; Mon, 10 Jan 2022 11:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6sol-00075Y-ON; Mon, 10 Jan 2022 11:26:27 +0000
Received: by outflank-mailman (input) for mailman id 255292;
 Mon, 10 Jan 2022 11:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6sok-00075S-AE
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 11:26:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24d984ab-7208-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 12:26:25 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-e02qItsEOQ6eseEpVMVfXw-1; Mon, 10 Jan 2022 12:26:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 11:26:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 11:26:21 +0000
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
X-Inumbo-ID: 24d984ab-7208-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641813984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYCmrdfK+1iZylEjGJpnNWWT/J2aHUSqAgAp72HNKNw=;
	b=ZPFV3B1RzM9lSHrqgapfPYVhreKshQAOFfArL/MnG9UFd5KREjBPYRRcdBofsoRUiK9sLK
	0AAlLhzuz5jsxevZWnHGHaA1b6IWF4Xwy1zuF2UWo/f5p6hLEVcXId+vrrO7GAerY/pbNp
	R75P1yvyi9KNWVEW4Beyk3d8Xv6TsUA=
X-MC-Unique: e02qItsEOQ6eseEpVMVfXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQH1kaZxxyaQSst5B0swGMCWEf/c+ws/BULBaK15dfqTS8KRVfbpaPdYMwy9iGvHNmCZM+UAJE+yPc3XxzwzlSwVIYTGf6UiFp7hwgxICs6Ec8gEKBqvEO5DSOW3oypPXe+S2+0f4p7me/2Ag+H27QrPZkSLGFdyZRZK3Cp4Tfekv7CyDdFRM/XQMGVbL1GPBmfN0taCH+bRF0P8X+QuLVlD1kI8hV1yNZw5TY+JdR+x1m50Y1G0lHGuvEWDRK17J4+Nu+xf8h4WujkhDXwOaXGKXB7lrIbl92sTy37YoL/Le++QD4Cr1CnwqoI4rK/igGvv1HqLirJRmeeJcuVopg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYCmrdfK+1iZylEjGJpnNWWT/J2aHUSqAgAp72HNKNw=;
 b=B7Y1VdDE3/vSzdsTUO2nA09fDxj4x+Q7RWY8Vz1lI4RJXidHt4fg5wxwvRlsXreFmxWoCJkxKOdLsg1EoanpD98UX0Y09ynWQSXXWVkdlTjwU/RZxQywEoOSd24363kTpUzske8yhR2iS6NhGvq3S4x0D5FweKJjP9LMp+cu1IY54RWqqql3KhbwZ0nelAwJ1MabvinyUnr5W3xY/5ZLB0R+T4mP4eqnVR+9ANC+tQof7gVGNT10vld5A3ptIyVfiCM8Pqa1vQV1XhYJnb6x/qqxhBg9iFQwJeAVGpcqr5GpGvdR9P7P2usxP3BrcAgapbi3mY9u0VzCXWFw0Eb1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4d02eb8-98b9-1cd3-dca4-5230817c92a1@suse.com>
Date: Mon, 10 Jan 2022 12:26:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH v8 33/47] build: adding out-of-tree support to the xen
 build
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-34-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-34-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0036.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e629b61-d75a-4027-73ba-08d9d42c06ec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270305CC4A45D4863ED60699B3509@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	og0+r0jXRwm2N7ry+XuJBCZ7REtIxrlnehtcSyyQR8KS82p6HL5nHZwYTjGxbjiSpurhbe8cTC271kQ+nvdbXqvsm8iiJnZzDM0nUGt20kBJ1uwfS+svEsq5vfncrvy77Qa1OhAoBfqmyt3gc5VNmjp1iUIPbxZ1AFhXkqBAL63gAs2lFyJ+m450sc36/Ljxwi5PhgCfEyl7Oz3gjZn4uZMPJjfWfvDQl5KRNL+tvzePaSyAjrJMv5cn80ZQOhpsJghSHBGbVGf87wHuazs00TaMMUZjCgIalr1CblVFSrWE324J52HLlXmyfylfguE8sXtdgYb2qgN7+nLPkSS7ea2BiV9peQKEEbQRjrbyPBgBJ5U0QlMrIu9ZAV0WGqxM5o1hAizK5ygfABKFdd9ORam04S1/Kkc/4+M2IjW0FOUXCL6OEtNzHRB6HOYwHai1IeAj7XmnCPfXG0jL5NOJdj6KarSV279hA/gn2qnjsbV2dKWLzit81F+Strk6I6Y3yfBy5+RPtEtBK0dpgLUGOW/D5/rtVI9GYIzQn5AcvY1gRW+0snThuZQEvRM3xRTcKUdtvKZwuMDXTlNklPxa957QwXAwSHtP8wA4kjAatu7at4vqyVs4InI2z1vB9IgDzXBQbu5HJe+xmV5nQQNL62n90tv2cGAaO0Hiyc0Su16U2l0l0b9mMksVcPVq3u9VfzeK7t55lDJQzMk+zunGwlFpEwnQ27JHJFvHhhLQWILxNootFzx13kdW0criKw5O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(508600001)(6486002)(38100700002)(6666004)(6506007)(6512007)(5660300002)(31696002)(8936002)(66946007)(66556008)(66476007)(2616005)(316002)(86362001)(6916009)(2906002)(54906003)(7416002)(186003)(53546011)(36756003)(4744005)(26005)(31686004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FmZndrMmFmekZiWnE3YUw0aWI0SEJLQ0YyVm1reDg2dENQQVR6a1FEMHpS?=
 =?utf-8?B?NTlrUWI0Si9IeHRRSkxKc0ppc1Jnd2tYK2tjUHFOT00zTDVxK1MwM3JVMi9T?=
 =?utf-8?B?VVpGRjhmZ2dmdldBOEhYUXR0LzBxYWp5SmFhaXFYblhoYW9CZVpYa09BNnhv?=
 =?utf-8?B?aHZTL1VYTklKTFV5eEZITXN5UHRhaHpjU2xHYmhwR3pFNTVFMFJpanY5RFJM?=
 =?utf-8?B?UnFaeElyMTQzbk5XaERYeGw2Qy9vU1VnZU53d2E3WGxTa2RvL05mZENaTk5O?=
 =?utf-8?B?dG5FbHNWUVNEaFlhZXpPZktRNDNuWVpmbkNLWloyTHpzVWRQQVFkWGpSYUh4?=
 =?utf-8?B?TGYxdWpPc0tYWUF6ckMwQjQ5Qkk1bGZOZ0pad2J6ZUh0R3lJTklaZ3hmanhy?=
 =?utf-8?B?NGtCdFE1VERleG5xKzlkNzFaVGxDcHZjajJJYUZndW9QbTZpRStzUU14ZTkx?=
 =?utf-8?B?ZEM5SW9YNFpKNXdwNHp1eE9icCs1QjBsYnVFdldiV2N1cnVSdFJqTFV4UUNz?=
 =?utf-8?B?TEV1U1hic0Z5bkJSMndQeG9MRFE2RWZhTWRORy9hUVc1aDZwejhSSFA1K1pH?=
 =?utf-8?B?U2pZUjJad1VFT3V2cU83YW0rd2YzUTU5Um9FMlZDWVlMR3g2MTdReHg0MDZE?=
 =?utf-8?B?NDZUem9pMEhLWkQ1ODcvWmlxckJITEwvbGpva2ZuL3BCcEtzK2Q0aTBjNCsx?=
 =?utf-8?B?ZjJ3YTRKMHBXcDRUem9xWUlYTXpaRUJsdWxSYUtKODQ4VmxjTTdJWjBzY2p3?=
 =?utf-8?B?ZTVnZlY0TlRuQ1NoTmdhamFkdGpEdjVFVmU2T3AvT3BVUlNRYmQ4T2F3YXV0?=
 =?utf-8?B?QVc0TGZ1T1kxSUlSSDNRYzZKZGdvQUNPUUZCekZ0WVU4MEpUQ1VoNHhFL3dp?=
 =?utf-8?B?VFNuYkgzR3NlelVYa1ZYNDEwaEFzUXN0TzlSRFR0bVI2WXM0Qkp3S3NxYkMy?=
 =?utf-8?B?cTkwbXc5ZlBPc1h3NSt5N3BjeE9vbytFTWhmUURGUVpURUEwK3ZQZmUvTUhI?=
 =?utf-8?B?N2FVajV2T0hrNEU1dWQ4NWJDVHpwaXI2b2EraitZcDdwVDg3ZFJwMlBqY1Fk?=
 =?utf-8?B?ZXdJOVF5YktaT283dExQVUJ5Q1oyeENGbHJWb2RTZTMzSjRwcy9FMDBXUUN6?=
 =?utf-8?B?eUJZT2huM1BwQW5xcHFFOTBCYjVGcFg4OFRDU0pNWjd3MklxUEs3aGdHSW5j?=
 =?utf-8?B?cGdRbUFWb05CTmFIMlI3cU8vYjhzQ1h3NEZSL0ZyVlRDL0pTZitYY2pYU0JR?=
 =?utf-8?B?YVRYZ3ZJRVlLNmk5ZU5Xd3BFSk14MzZzVi9xaTZlT3puYnZFd3JTWVlMTGFn?=
 =?utf-8?B?RVR4RURyRDJXdEN5RzRaYk5oUXNpWjBDWDhTcjVSaGw1bjRacW9yWFJJRzZU?=
 =?utf-8?B?U0lyRzhXK1dLRVJ0K0NrK2tCdnJqdkU3djVBaE9qeUZVQlZsTWp3NHRnekYx?=
 =?utf-8?B?T2V0TEhSWFpSeG9QVGI0b0V5TU1pR0wxOTF6emlkalluRWhkbGQ2VDl6Nytl?=
 =?utf-8?B?cm50ZG5rTm9PV0N4RVBjdDIxSVQvMkp3NlJpMnlEMTQwZ2NyOERvdGJwckVE?=
 =?utf-8?B?ejZmY0JPaWpNS3o5clZuVCt0cjhyYjcxYk5obEtSWU13cVBWc3ZTSmRXZzJq?=
 =?utf-8?B?L054UUx2TG5YZ0s3QVUzVkJ3MU5Hd0EvKzFxYnVucytHRGVxZk1KenIyeDF2?=
 =?utf-8?B?Z3RHaUYvb0dpb0ZMQkQ3eWxaa3NKdzVKZnN5bFM3T1pITDlDTG92VURkaHNP?=
 =?utf-8?B?VkpZVTdsQjRMNDl0cWphWW9YZmV4am9iUkcxanpmTnhVcUJlNFg5ZUJJWGt1?=
 =?utf-8?B?eGlpQzV4RkRFMVllT1hrTTVRYjRqUTd2NG82WDg3dnZaVlZIQ3Q5dVRsa1Ju?=
 =?utf-8?B?eExOSEhQSHV2Z2xiY0MzamNiTHYyRzBIRG1RSC83VUlqL3QyZmdiR1V5bTZj?=
 =?utf-8?B?VU9hQWY2bWpIa1laTTRFKzVWbjVqNlpjbnErdFVWQ2pLU2x1OEo2dHFZSW5i?=
 =?utf-8?B?bjFHSE9PS3RyZVJjelRHRXM4aFRnTFRUS1haa0lkbTZIYytvNlhLV21jOTBB?=
 =?utf-8?B?QXFUdzExVUd2cWF1aDFuMURwZHJ1Ry9KZ1NwYTVGMjZQZFFhZzNoY2Nka0dp?=
 =?utf-8?B?UlRZSFVoR2wxZC83NWZBdFkvR25TVnoxUk9uckNPMk51WVgrVG4zSDlHMXRh?=
 =?utf-8?Q?2PkKXCGt2OFmTKS9WxHPV60=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e629b61-d75a-4027-73ba-08d9d42c06ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 11:26:21.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R9jJC2ERBkbXuVLM8a3m55KXyUX75Oe2y0xQWQGhLcp7QU5/2afQ+efELedkq0yJU2a6UzSXutx95iqm1dRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 25.11.2021 14:39, Anthony PERARD wrote:
> This implement out-of-tree support, there's two ways to create an
> out-of-tree build tree (after that, `make` in that new directory
> works):
>     make O=build
>     mkdir build; cd build; make -f ../Makefile
> also works with an absolute path for both.
> 
> This implementation only works if the source tree is clean, as we use
> VPATH.
> 
> This patch copies most new code with handling out-of-tree build from
> Linux v5.12.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


