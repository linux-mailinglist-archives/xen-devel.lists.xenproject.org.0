Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6593D4873DD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 09:04:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254288.436006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5kE3-00013W-ID; Fri, 07 Jan 2022 08:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254288.436006; Fri, 07 Jan 2022 08:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5kE3-00011J-Ey; Fri, 07 Jan 2022 08:03:51 +0000
Received: by outflank-mailman (input) for mailman id 254288;
 Fri, 07 Jan 2022 08:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Ee=RX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5kE1-00011B-HX
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 08:03:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57204b1d-6f90-11ec-81c0-a30af7de8005;
 Fri, 07 Jan 2022 09:03:47 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-8HbDtbaTPKqVIkNuKL6mdQ-1; Fri, 07 Jan 2022 09:03:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 08:03:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 08:03:43 +0000
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
X-Inumbo-ID: 57204b1d-6f90-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641542626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TZhAEF5VWNhsBYfTKOt6FlTVN6/6icT0gn003uYZOMM=;
	b=D7ISBHBvtm/vqlJBsrLwkcgrw4HVT4MIVaBtRa55pZOF0xjXt9/OLg5CZfkQJ6w3IaEEfg
	DTLurjlp9ZcOUvyXEG/PrEPwc0GSYRl1egoDda0hkis8b1Jb0XTBN+wqZjas4TLNQYx6XG
	FfXeVao3y/yZLH3/p/P0gsnS5irKtRI=
X-MC-Unique: 8HbDtbaTPKqVIkNuKL6mdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtHbKYb+ATkwRzpxMU1L6k7R/S5xFtlMaKS5MJpTrF7BdSSgHRoqx199Xu6sf4JzN2GIoQFuhdXPW5fV8sMJlXvpJxZrvE+xsOJLdcFw3ApsJWSikJngHoapuSNR2CX25cNwmRwAT6OTS6a5mKTibYn5Yn0WZ1xH7/zLPoTpnBMl5d9Cgn26dfbUErs0LIVpvQv+QRSlhIXxkJ1fVAGlkumlb0/A7SRxs2NY/KMgq2NSN6EFLOQPDO80BNDRTbmzoyZJDbfAuMKEA06x8fEgBqIl9UKz7jpWSpeiHMiHm1dO34BmzN/FdAs9pa1aZMujdjJVjnTOjHVegMk3iNg+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZhAEF5VWNhsBYfTKOt6FlTVN6/6icT0gn003uYZOMM=;
 b=UDd52+52hsdp3KbNXScjqXLy0+PZXLQjL1h7+uL7WXcHDpIoEiQA9TjJVguROmwXOBQS6jToQ5z9+ROs5IrXHR/ohd8KOMcjst8WeI6YXSrfs/lkKOecVnxJ9bHcSTkAQ83tyu5q8Bky9sNzX9ON5q8pAPoU0EJN2NzkSbM0gFoj6cwCuLPF8e8aso8ahKXqwvhUddL7k074qIHULUeP9+qLtUFvdWekB2RpSehn1cHYYXno7VqZ2MBghQZUoXJ9KjQve43Oy+HNIfP305a+OSNup0TcCPSTrcFNK3pR9h7pdnAIWRURgdoYhUj1pLMT3g5M3Y9pTYn95fZgzFIGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d78054ce-f579-c0cb-8e0a-1c3ecc36e819@suse.com>
Date: Fri, 7 Jan 2022 09:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.15.2 and 4.14.4
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bf9e642-2d11-4b40-f8ba-08d9d1b438dc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59019738EB62C2F79B6AA7EFB34D9@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n2RlMeFTaGcSJfronrioik1KaYY819e4MCVCy048gMtkPuPywkkeqCt5H0Sg9k6iPp5QM3VuOn7IRw+kPIwh59ih2Ri6RwFmomFLX47UDB5cO+vD0DGW+wLzQZJedNyd24j78w1O/SHSPNFeAxzwdWmPWpsgNJmVf9evJhH3gYvqudftX83FOrwGNCcSWMEP2QJbfekaBOqvOIyg/Sb3oLpPtEPq+Fx6Tzf6jY4do0czeRHm6KtL1WP+9GMpUGgiF2XEksW3IESojTCxQDsLrOyMSd7k+vM2g+4lFrpEzH97its/itleedzIQ5vcdNRoilbWw5nFoZ1IuLnf27uvwU1OTOHRQyJcR7jkiQ6KJeBz9i3+PEPTv1q/zgk1Fa709kVSvvk5zd+zAPpir+kDkJsuG1RDoIbYt58IlzRk664Ql6uM+Vpo4QKtJSVlXatBPguc0iTBQwvf4hDCba4QDYan+tw0IchTVVkV0rwXfGycYk9rd1zZxVzPz8bNlUuQjQ0fzBJLAXu6hRLtEfLqaED05UPSN2wd1tzaZSx+Y9RVd4Y74tgNfqBpcwaAMraqVz4TlzA+HtHRrZ4c/5xo0CC4ZlXHYkhF56A1fhS8TgDe0D7dSg81fyEc2ZGwW/+/fuzlXUwGltoBZmBQAcJ2YZsweR8ucl004eoDM5Al3MO1HYUlKs8O6s+1J3mpNu3SnuwpQgbSvtMu8ly1X9LFJ2guFZ9SSfdmUPViYlrn6JGs52hlevOHbKBw6daNY3kH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(83380400001)(86362001)(2906002)(66946007)(6916009)(31696002)(66556008)(66476007)(316002)(36756003)(31686004)(2616005)(8676002)(4326008)(54906003)(6486002)(4744005)(38100700002)(8936002)(5660300002)(6512007)(26005)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1QVEZscGZvU2FpcDFhOVJJUWEwdUxHMTY4dFBiNCs1TVJYME1ZbldzcFZr?=
 =?utf-8?B?UUp2eENMOU4vbFdyaExZamlsYVE4aEhPYk0vV2RxaGZoMkVLdGU5cGpmL0F4?=
 =?utf-8?B?OXNBU2NPcGJXbkhhWjJxSXJzK2Vpb21zeTBLUzl0ZVQraHNhUWIyMXhBUVBH?=
 =?utf-8?B?U2FmOXFlWW1WV240TWxqbmhvQkNBaHZQQTBxd1JSbUszRFIzMW04TzcxSVUr?=
 =?utf-8?B?NjZpSkU2V2FOMWc0ak9WaFdQYUVaOUF0aUlvektwT241UGhVM2czTkFiT3lv?=
 =?utf-8?B?SzFzczVsOUpZeEhMQk5UQ0xjS2NnVTBBQm1YS0lYVEwybkVKOGhGSHpUK1N1?=
 =?utf-8?B?YmdpcHBNVFdRSjFqNWZlWE8xMDdqUWVKRm1LaS95ODRDMXlvQy9Ta0ZCY1BI?=
 =?utf-8?B?TW0xdm1nNXNMekdnRU4vVUJ0TmFWVENjbDVlU1VDS3Z4WS85RUFWWm02N01q?=
 =?utf-8?B?cC9jQWhGUkZjLzM3QWxrOHl2UUNML0g4NGxUcnJVVjFmYnl1Zm5abzFjR2dJ?=
 =?utf-8?B?Uk5tS0MrTjNMTzhleVNQUHRkVFZVSnJrZ3V4RCtKQ2RlMTNHOGp6R2Y5ZGtv?=
 =?utf-8?B?ZStLdGpyWjJQNzhVZXRJR2NLNkE0Q0x5U3NFMXQ3OUl0WVgvQ2I0SWhnRFdJ?=
 =?utf-8?B?N290YlV1UlBieUJGVzNhL2ZCc1lJZHdjR0dNOFpEU3JPTzZvSlFvV2ZIT2FU?=
 =?utf-8?B?VVVkK0t6U1owZ25tdXhmNFIvQnd5TktzNXcvSG8rTnJUV1lTamVoL2ZhYXlq?=
 =?utf-8?B?RG5STkN2R2UzaDNLTnhLN2xIY1dQUVFLRnNseUJacmc3amlwUERXc0FRTEFN?=
 =?utf-8?B?VUYvWGZQUXlqRlVpNmRGS1pST2ZLTzdIakdLc3dvMmpSRngzUmIwQzQ1bXlC?=
 =?utf-8?B?b3JEcmxVMlB6alhZbnJnS2pWZTRnSGFGSWpmenNLM1lWRTNEcVNXUXpreC9z?=
 =?utf-8?B?bHNOZlUxNHozTHRlTWFkeHNnY3pROXV2QmhDMEk4di9kbGlWeTdqKzNzNXZl?=
 =?utf-8?B?bEl3WlJEeW14ZTBTKzZlanAyMDU1V3ZmaGlQQnFrRUtuOVl4Z20rRFU2Tllz?=
 =?utf-8?B?Ung5ZHJtQ1BiVjROV3ROaG5IVDZKbkpjWlBRcDMwM25GQ1dLanBuWXU5dXlG?=
 =?utf-8?B?ZENhaEx6bDd6SEFRTUxCMVhpOWZuSEJnTUU2NlNOTERrN1ZVNnNQWnNlR0dK?=
 =?utf-8?B?cFV2UUlSZkx2YjNWbHdZSnh1dWV5LzNMbUc2VWZnS0RWTUQ2U3hSQnorZWQ2?=
 =?utf-8?B?OWxqaHlnM3ZkL1NyaVVOR0E4bkRDMm5EYk8zT096RG9tNzhuUnErVURsb1dD?=
 =?utf-8?B?R2IyN29IZ2Y2Q2VsMHllQjM4bFU4Y1dZRTF6bUNpckFtbXRhbHhXdDEwRFIw?=
 =?utf-8?B?V2pvcHBwaURsY1ZPRkliS295VkR5MjJaQzk2UmExNnRJNitlTVk5blA4M2FH?=
 =?utf-8?B?YmhNVGFRdmZWMGc2L2FYZUM5aDRpWGF3VUVBQmZtZjN1U3NtdmVscWx3dHNK?=
 =?utf-8?B?S05WOXFEMG5aOGRxcklrYnJueXg0VzRycHlIWi92alZxSmxtRHFqZUNNeVFC?=
 =?utf-8?B?dDhiT0tjRTFpYmtFTkJHWW8yak8vM1JYVFNGb3BiSmhQNmRUcGZRVUlscEYy?=
 =?utf-8?B?THE2KzBxYUljRE9JemNESFZkeEJ1K2Z1bjNNRGRWZTl5VndockxRNkRoaGRG?=
 =?utf-8?B?S1pxaWRnNUFuTkV3S2RaVjRCZkVPSHdOTW1IcDA4d2txdlltdzNLMlFSWFVo?=
 =?utf-8?B?SzlsRGZDejR0bjVVc0s1SDkrZjBLeDBoYXQxaXoxZUx6bEhOZHR5ekwvbnQ5?=
 =?utf-8?B?Qnc3N2o3UG0yd2oxRyt0dkQ3UHJiVS9VQWNENWxOcEhsbGd1Z2FjMTJFa3dE?=
 =?utf-8?B?VEtVVlJvQ0I2VS9heEorWklZOG1mbVlHYlVaZjVxZkJhQS9OeHJ1RnRKV1NT?=
 =?utf-8?B?YjdlZ283dGQyeHhzWHNNa1ZTQ3FTNW9zWTM2dC90dG1GTU5WNlpNQXZxd25o?=
 =?utf-8?B?Y3Y4ZDRhWGg3RTd4SlRqaktkQkxsWXFlbytyWjJTWmxiY3c4WnQwdEh5dGpx?=
 =?utf-8?B?d0lRRGt3cjg5Y0hOTFRQWHZ5VHRUbHNydDdQVUtPaFhaRU4xaEQvcFRMbG4y?=
 =?utf-8?B?eHB6TGdBQktCelBNalBGZ2FheitmTWpEQVFNYVdnczJOSkc5VURlRy9HeGsz?=
 =?utf-8?Q?Bbl6XRpNTJgXyuO2UOIzshY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf9e642-2d11-4b40-f8ba-08d9d1b438dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 08:03:42.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOI1+qRefqDVaZzrQWIl/hM+bKZITrm3mQsAHxd4or7NkTCLlS+Sr+8HrA6zEGQXEPKS4ry0IT02FzDgV/gFkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

All,

the releases are about due. Since 4.14's general support period ends
later in January, I intend to delay the release by about two weeks to
cover the full time range. Since it's a little easier to "batch"
releases, I also intend to keep 4.15.2 aligned with 4.14.4.

Please point out backports you find missing from the respective staging
branch, but which you consider relevant. With Ian's departure, tool
stack backports (if any) will need some extra care. I'll try to deal
with requests, but I may seek assistance in certain cases.

Jan


