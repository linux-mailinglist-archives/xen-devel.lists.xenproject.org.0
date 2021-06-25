Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7893B445A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147230.271252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlob-0006JZ-Kn; Fri, 25 Jun 2021 13:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147230.271252; Fri, 25 Jun 2021 13:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlob-0006GS-HN; Fri, 25 Jun 2021 13:24:13 +0000
Received: by outflank-mailman (input) for mailman id 147230;
 Fri, 25 Jun 2021 13:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwloa-0006GG-F8
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:24:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f49d5b31-5609-4204-978c-bfd8d1706e1b;
 Fri, 25 Jun 2021 13:24:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-5pf-YncbPxKDgi77_QYp5g-1; Fri, 25 Jun 2021 15:24:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 25 Jun
 2021 13:24:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:24:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:24:04 +0000
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
X-Inumbo-ID: f49d5b31-5609-4204-978c-bfd8d1706e1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOEUDOPXWP6D4MKSfHeNrHSH9v7EBiETR03v/53OyJ8=;
	b=Dnagzc9xtafQlITtm31cRE9HbPhk4cNV9JJWMf/6uyurzktOKkbIOOgYyg9UIpcK+yQIcD
	yyZ6sTQr/JN/Cfurjmd1YSpyCG4zIJS/UGVJYUp57Gyp83+68Kg81koDJcfN5dXJDZ67sh
	X1zjOVA0Mx3Ltk2zpVKNRK7d/MMgLSw=
X-MC-Unique: 5pf-YncbPxKDgi77_QYp5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWNLcs772SYqKrncLypX7Hbq2prV0ORBEEZvLbpiX0bn2lDMC9GFJvebqXumd58bjBtyLFNuum/6MIaq8LU61hN0EbLpDz0JzaP/xpV7JEIdh/VXY8fuHvWkOqfCPp5sQsdBrujTTeE66gmhpBhp7Yk9m/ZXB0HD9qaScWvo7i8yYWxmRzzS5qOIp2Qs63tZCPP19ef1rxo40DZ8cIkFdeQCva/aP+IILy8jHVbotvIJ2l2TEQggSEgEILmRtAMr5nmvxBakIszI91t4Fg9jhmCLn1Lep5dETjjtLm6W2zjl5yxFKfjLtVeTIP1GWzYlJXgpmIgtU2a6stE0GYmarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOEUDOPXWP6D4MKSfHeNrHSH9v7EBiETR03v/53OyJ8=;
 b=DkvQdKY5QOvoUIfMp7Cr3C/ECtG/D01YORQu1zXRIvDUXSCWa0zsUvbqbSgOeshsUjITpjjPA0fhNDMwOZzUQraqwT4psGcFji4LWpdQDleMxobqfmlifKLBwujBCrEbYtvjhiTeaq7sn0OYjncVSLYGKibwFVlCmRmqSryA5PMVlOMBD3okVByjupOjBRUV5qznSthswg4oByymC+ODsIjs2s2u7GR9Jf14ACmP6wIkL4RQZ8WABHbMIMz15fJ493PzS9cIeQO3h4sPSRPZv9p8hKMb2hA8tRj1wZM4ONzwP20bGw1VRGGVUzo+xpmdTBnyo7YEZkexfnXoU8pq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 12/12] SUPPORT.md: write down restriction of 32-bit tool
 stacks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <03512f29-7a4e-70ff-271b-7d65ed471935@suse.com>
Date: Fri, 25 Jun 2021 15:24:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67efd9f3-c7d5-4601-52fb-08d937dc813d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB547236655BFDDDE42E809DC2B3069@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HmTChsITZglglCNvW5b7WXbmyPtFaePSxSnPiSqghIVdM1+MNEOXHoCeuK+6HUKuQmrd8ZRylhbmehUIsedUXkPfq3wpDmTM+M13N8zOLcEFQq9tpZI6H7eFGvk3TfmIiS3+tfkBqW4eX5Gs2XaTxkhRcDIZX73r5QR6Jb0/5L0AHfvkMXoh6WSELfBNzsTSlMJVEMnXUADBboWgrNU4aYtN7XlOjAqEb4gO8Bw1zanq2VMkTSWxQfdH0m9w799Gnb22/8PDhOd+mfF2Qh1wvfTZZgVE5lK/LE6yCF2f+HqfXZIFx2afpOBYCQTl2BoKnGGbFDUkKHx+ZElGtjwH1nwgjWlIgNypgt//vENHgJxCJRiI/Ma46fwFgene2Sy1JzTsSIRry6dNorCAKE2pvciyAuDqDirXiVX7kRz4vOAAukL0FvxiU3jnGPCopVDdQ5nWM04SOCKQloaIkH+77ZB0cdJdBUZohlG40pMGBwGW9vLO0HOJxB7nk1z2ON9Wo3wJwVNWT8fAudcteSeAG88JYRzx6KKdH2NKR3XWGIYrn9KYtyT4rin222h9lP/WwwEz5LcuHJ13O6ny4zIGLmkLtrMYhTZLFh8KLOcAeZtIVKZB5KDerFjs6nLQp//F09yYPSGd5rAigG+yFxkKWmns7OgZPxN7HuOoVBkS3TomzXxlN9XhS13r7dP4gTsM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(39850400004)(376002)(136003)(2906002)(478600001)(316002)(956004)(86362001)(4326008)(8936002)(8676002)(186003)(26005)(2616005)(4744005)(6916009)(5660300002)(36756003)(66476007)(66946007)(66556008)(54906003)(38100700002)(16526019)(31686004)(31696002)(16576012)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE0vMnptTnE5dEt6UHZqdlcrTkNWWjY5Zzg0YS9GTlBYWk5PUk5XYXQ1eE1Q?=
 =?utf-8?B?UE40UCtvS0IwNnZCdnQzRVdsWUxFSXhPb0lXNGJVaTRvY0Z5ZzVRdHRhQWdw?=
 =?utf-8?B?WlV0bFMyeEV3bWNVQm5wdmZUTjM3TmhCTWVaNmlUZFVETWNmSmM3ZTZUR3A5?=
 =?utf-8?B?Yjk5citwYlJVTVJIRFpUVDhzTVduWmJoNGRKaVNSc2dHTUZmNzRON25xSU5W?=
 =?utf-8?B?ZEJtRjhrd2ZsSFQweEphSWZycWdLOGEwUzJtY3EySmk2T1ZsMVdJUDQ4QjZ5?=
 =?utf-8?B?WEtvVjdKY2V4NlpXTkh4NDZTVFVpS0NKUTRmcVJudmZiRzllYlVGSVZxSmZo?=
 =?utf-8?B?SDBTeUtHdC9DellzSWRUc2dFSUNDOWN2UEx6M3RySmkzeExqUWYxdVRkSk0y?=
 =?utf-8?B?eGcwWlJvaU42bjluVldZaVN6eXFCYm4xdUZnbkxhQXdHU0dOWXpveTI4aW9L?=
 =?utf-8?B?dzJQNXUwV2FlRFgwOUJncHdzbmhrSkFVYjhEdVcrODV2K3J1VytYNzY5NzFs?=
 =?utf-8?B?QU0xNURJbzVLRTRpOHFLRmk4cGZYaGRmUFdtejhUaXB2ODhtQnYxWWh5OXpH?=
 =?utf-8?B?Y2hwNEgydXlkcm1FVHlZb3ZNTm8razR2SG5hLzZISzlKZ21LYWFmc0dKc1Bn?=
 =?utf-8?B?em4waXVGclF6T3NrdGY4ZEtnSzcyb0xDQ1hVaHZDL2pla1lUK2MvcEYzVVZ0?=
 =?utf-8?B?R0poa3prenlUNnZtbDdRTFZWOGdCZU5mdkN6eUZ4and3UHcyZzljNFlZVlhN?=
 =?utf-8?B?a1dNV3gvbVpEdWtMVERDOXZjNWduQ3hiQnRTbjVXTEhUNThidllJWkRDcU1x?=
 =?utf-8?B?cTV6aEwrazNrNkhpRHZHUTE3c0ZnVkdaN3FTL2FlVG5LM29PN1JZZ0c2UU9j?=
 =?utf-8?B?VTZHMGdLcjltRmFYdklybG9zWkJYZVdCNXBieklYeWhVdHpmcS9STTQ1M2NF?=
 =?utf-8?B?N1VteC9lQmNoWDJHT1ZkN0ZEa1dQV0VJOFBhQ1E0NEtZekFheXBqQ0M0UWh5?=
 =?utf-8?B?d3dkQlBKNVF4R3Q1Y2sranZFTHgwNlZRWURDYmY5RWFUTnNjR3FFUlVXTS9j?=
 =?utf-8?B?QWZMcEZFbHNaQjUwbTBPbWQ2VVpaR0ZNN2E1OUprZUJWblN0YnFiMlQ2bk0r?=
 =?utf-8?B?M00wT2xXTkwzeVRFNkNwdUdJY0ZYTzZvbFFHUlBWdE1wMDZ4eTNEanhOQVB1?=
 =?utf-8?B?aHByMnhWTWRGbWRUbVMrYVZiempNVm1EcFVCWXFBSHo4QXE4aU11TFBLUTFV?=
 =?utf-8?B?NXZRank2QVhiMEY0SzZMcXA2SHo3TU9rMDNwZk9sYnFuNWR5MzQ5RVRQYlpO?=
 =?utf-8?B?b2hySElQN3dsSEFsSVF1aWVDbllpMGJ0OFVVaE96ZW1CcjQxakhIQ2tvTzFS?=
 =?utf-8?B?dWo3NHRRbFBDbTkyV2RNQkk3aUhWc3daMDFqL0F1cUpUdVlTbWxBTlhTcGNn?=
 =?utf-8?B?TmdBK3B2b3kwMWpaWGNZVXoxWThrZGZZaUF1NWlkUkpEa0lpV3dxYUVrOU5l?=
 =?utf-8?B?VWJaVWdwS3NCVGVuUkxzOXp3RS9ab2l5N0JrelJrdHJjaUtSQ2dkTU5EcXhZ?=
 =?utf-8?B?TVNEMFQ1bjhSY0ZJVjI1VGNsajBDcEFOR2oxYXBteDBLYnFHbkkyM3c2bkIr?=
 =?utf-8?B?bTI5YlRsNFZhTVdHQnoyM3FueUIvMTZVTndzOEQxZmVraVlaZzluY1Npejl4?=
 =?utf-8?B?a3NITlZKbVI1aWpqN0xIVWVXYVgvVmRYbm5wUDVVQXBibU9NYmxid29zbVlF?=
 =?utf-8?Q?DC336ps/COvePz2IhMnox9yjXP7dXbgF5K2UZ8D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67efd9f3-c7d5-4601-52fb-08d937dc813d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:24:05.1687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xqoPn1L+vYTCTC9NI2iNEcGHWYmA4ItoFGgU2OXJ7lsVB2gEGIksRwUKASjAonOKzfSUXYfkArFA6eOkotMfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

Let's try to avoid giving the impression that 32-bit tool stacks are as
capable as 64-bit ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -131,6 +131,11 @@ ARM only has one guest type at the momen
 
 ## Toolstack
 
+While 32-bit builds of the tool stack are generally supported, restrictions
+apply in particular when running on top of a 64-bit hypervisor.  For example,
+very large guests aren't supported in this case.  This includes guests giving
+the appearance of being large, by altering their own memory layouts.
+
 ### xl
 
     Status: Supported


