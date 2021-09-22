Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC34145F7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192428.342859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzIw-0005Ja-Js; Wed, 22 Sep 2021 10:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192428.342859; Wed, 22 Sep 2021 10:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzIw-0005HR-Gf; Wed, 22 Sep 2021 10:16:42 +0000
Received: by outflank-mailman (input) for mailman id 192428;
 Wed, 22 Sep 2021 10:16:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSzIu-0005HJ-SG
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:16:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c7bc96a-1b8e-11ec-b96a-12813bfff9fa;
 Wed, 22 Sep 2021 10:16:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-1rM-3_mIPnu2w1oLQjm4IQ-1; Wed, 22 Sep 2021 12:16:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Wed, 22 Sep
 2021 10:16:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 10:16:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Wed, 22 Sep 2021 10:16:35 +0000
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
X-Inumbo-ID: 2c7bc96a-1b8e-11ec-b96a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632305798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ihy5AqkbKQlh/sKYZgTSszLHYrjLcDDqhUqK4o2XEtI=;
	b=K/b87FAGIGJ2izaj7QLjGENwt+VWzCnazT4oFrNZC0c0JOh9V64eMOEOrmUiOV7NyFj9p4
	7gWw5+/fAi/u4YFKmjePGzUkmd9+jcERcpTIU5ywEbS2/cMoEYkr79Fb5AirAcAUhHgzS4
	nTqVqASwh4xOoU01mw/KvQiSMbSdceY=
X-MC-Unique: 1rM-3_mIPnu2w1oLQjm4IQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5VQZxg717y8Nyolf0kqnaz7jbvhKbq+SsbF4PQMpjjxSb+wtykIjxpYc8yYcvO5oUR/uh/PNzQDGMiGI3COZaqYcpSgngYK7xe2FK7ujqq41hbfaHfzM0SFdT71ZLlssFWL70rdeUhA+hx9In3JVPbicusdksQV5jC/rOAdNHIO8futks2m6RQPz/JQ90HLr1PDBqZB6QMr3dDoXqF3opWPZUFVXsls/Oy9HxxSDer6ecT5hqwCENsGYpTRNoDadTeu0LGwDmMcKKZ4Qw55qaQRg1AvtpqxMQ4Idyxj1Qy+1zZ/vYCZXC69BpOweTvoDLorHrkQIAhxbZ/3J0Uk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ihy5AqkbKQlh/sKYZgTSszLHYrjLcDDqhUqK4o2XEtI=;
 b=fKw+T/6jhwEJrkEv7XmjK5n/vgkkuOFVrw9yDrJ/4vDywMqCizGc8v8w6WPbkZu1AzvQ3ekVFCCqqZsqBwR+8hx8ZvgjDER72MLaPXJW0eR/ludwFpBpsndtZgWoGhI4iNIHUZvn5HZLTjqd3ymBKUm9yMGXjHwilmscaVIfbxNKyPqvaqhzM3ruT2Edt/r3Hvl1fM0BPLRAODS3yrDea6Vi1TUPOGfO+BvJGMAG1lL/pNGfTyZ4LKFAZNTk00UAm3Sz5vkcYSZB4SqGsJDRzyvfQKRM4N7+CrrF+Ogk17W0mZI5rPajDehNlwUdHhRAEnlSv+qGQskfoz6X8Ivasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH RFC 1/3] xen/privcmd: replace kcalloc() by kvcalloc() when
 allocating empty pages
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Message-ID: <6d698901-98a4-05be-c421-bcd0713f5335@suse.com>
Date: Wed, 22 Sep 2021 12:16:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4514c639-5875-4107-bfd0-08d97db20ef4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41908127AA8CCD2E54806B13B3A29@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jLzYEODIBUA1//UERQZqtoL1gxZrcJRrDmhsdABv6FVgoEB54z1CCXGqfls2JAMPKnFbwp1FY8QyBtFkmLAn2qvjtp07W0MjbATD0g2y2/UTC/YWWVGgPe79eFHJ8E1Ofl+tnY5LrQ1h5EJbbLhbUnMkVspsQay76Gb8BW/9YRCcozAzvzhaZzGW5sjs6oV8VnlqNcpFidrr7WhyGxA0+qDhHWFaJGhTd7psp9Z/SCMqKH/hMEO9k5QWiWdUPzEYneFsS4E8Xa6lvAdgSxrn2M7rEGSf29Ewd344mNQkBCnpSHG0IaGVNc+lM/tNBH2kEa56VwlNZhnpKXfYZMpKt5MW9CZWCA9evD9xLONioBb3bx5ILK4lAGTLdsuAKIMRKqg8plME/2PcqpIlNpjbvkzg/Q8YtBa+bLEL8u2ONHxXkeivFpg/8o451Q8cEXsL1ZCFPA3blTULInsJHtEcPX9qdH5C5oJHSFf6aTOPmDl05J6ldcSMZHd5gzCI4zRbv1jh4paDVB806DKqEo3BdSY0tfTCC5xIbe+q2IPTIfOXiaAUQw6q5MmBh+yZJxPSWWgoZL8omD1x+FSfxBgzyX82K6XPHDyy+1yQMn5/IJl7ymF6f7FSU0BkDWDs+xO0AoDv9e6RrKOCHI9DFMU6XElBst6Ji59cQEzjXTzlsYG6SyO2VS7nNElpfPbPD52cSzfdtuuuQywdKzt3/RHdb76Vok0f1jPrq1xBbqY/k28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(316002)(26005)(8936002)(110136005)(31696002)(8676002)(6486002)(16576012)(186003)(83380400001)(508600001)(5660300002)(54906003)(31686004)(66476007)(36756003)(38100700002)(66946007)(86362001)(66556008)(2906002)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blZTaFFseTV2endMd2s0VisrV2dYckpXb1hDWUk5VmVJNjVFQjZLeFl1L1VG?=
 =?utf-8?B?c2FUbHk4c3U3cThTNmZObVhEcXZzSkFDRjNQVFBZNnlYUTV1R21HbFMzekds?=
 =?utf-8?B?MlROWkJsVitBZ0RrQ2cwZm5pSFN0bmNyRnJMWkt3bjV5blZ1dURmV1VZWTlj?=
 =?utf-8?B?QnAzakNqOWNaTmRHSFFuV0YzU285Smg3aDd6OXkvSVV6S1BxWnpmK21iOUtJ?=
 =?utf-8?B?clA2L0N0bUNoU3NFM1N4OXlRR01RTXQ0TzFKYmhNSjFKYklCc2Fjd1RtRnhG?=
 =?utf-8?B?bmtCR0NleXVLanRRQmxWQUl4VzhmazNSR3k4czcrTGlKMmZDVmF3ZS9oMGlX?=
 =?utf-8?B?bjlIczNwaGhFTndkMzB0WERFaGFIeWJXSGJpaGIvcFVmRXA1eTlyL1VDVElZ?=
 =?utf-8?B?S1pobUc4QTkvcitWTGRDODNMQy95L2s5NXhWQzN3QXN5SkNQMzNSUEtkeEFC?=
 =?utf-8?B?WSthZXVqb1dOZlhzS3I0R0t5aDdTQVpsMGFxOG1YK3BoMXZkLzJiZU44Uk9t?=
 =?utf-8?B?SVU0aGRLbWUxbW4zbnZtaTVMQVFiRDJrWm9TR3l5ZEtvSng2WWs5Yng4WFRv?=
 =?utf-8?B?S3hHL3R6T2tsdXp6Qzhaa3BvVGZsNThrWldwTGpvZTlVUHozSFZqY3NsZXRh?=
 =?utf-8?B?di9jSi9ZZmNPdFcrMWJiU1dodjdUUkpvQ3hob3NCUVR6di80a2hFOVltRHZ1?=
 =?utf-8?B?bGJDWlBUNkpOQitHdTN2cWdJcUI1dHlBUUhFNlNteldtWFhPN05ubEEyK3Yr?=
 =?utf-8?B?K1M2U0NvQTVjajhFTTdwbmkrbnFrR0szZk1haGcwS3FFekVCT1ZWN0FNSlFu?=
 =?utf-8?B?dlJ1ZGRKdGFkbmN0TEsxQUx2NGtMWW83Y0VaTmF0QjhRNUZSRk1EdUNVV2hx?=
 =?utf-8?B?cnlzZmtnV3JsK0N0dHNzQXZ4OTNGS1RiYjhHbzZyQ3JDcElldi9HTXAwVFF2?=
 =?utf-8?B?VEZoTFYxTEM1LytMZkZNdnpqNjU5WVVJeWx1N2w0alk3QVRDMlp0ZUNYVmRk?=
 =?utf-8?B?TDd5c1NWekJOdGhCVDUrNHVkV21iVkRMaktKVlYvb0pnbkx4enR1ckorU3hw?=
 =?utf-8?B?OGlTQ0lkdVExZWdDWFRrYVpndFNBcnBJb01LT1hpY0JjaXZwbmxDRmFkc011?=
 =?utf-8?B?V3FxL0ptcUlRYkE4aUhpSFh3c0NzR25TZFBrQVdsWFFkR1J1TnlGUVcyL2lC?=
 =?utf-8?B?UnhJSWV2UE5ENVB2Vy9LZXNTNlJQMGtUcXF4bWpCNzhGL0QzRXZ4UFlBcUN3?=
 =?utf-8?B?MFZaZ3JhcG5qSHlHTm5zb25CSjdBdG9JMWcvbHNVNEMrQTdyVEJQalZxTHBL?=
 =?utf-8?B?ZTZNVnVzV1pXMVpMVEhuZ2pXazQydUZNcGFOZ3FNMGtDSkFjTnZSVjE5ak1N?=
 =?utf-8?B?U09GRW5jaTNOL1BwejN6dzF2Uy8yeGlvMEtHUDFzM3dhWFNMeEpkRnZWakVX?=
 =?utf-8?B?UjcwUVVXa3lQb1ZjSEl5RnViSE5oL25TN3I4ejBvQXB3bHdlbXRQdGVYb000?=
 =?utf-8?B?ODlCN0F2MjZ2akw3ZGdzZElXdGxoSFY3cVI0aVFhTUR5WXUvelJrRkh6ZFJp?=
 =?utf-8?B?a0U1K1ZTdVZZNERWSlVpd1c4aHlqS3lhNENLdUNFZWdPUXhOWU9meUc1R3dv?=
 =?utf-8?B?SEFPQkVPdnI1NTYwbWpQcEUyc0F2NHZ2QzZrcUlXY1FlMHVIL0pJbm41RTFo?=
 =?utf-8?B?aW5XakQySndDK1VmdUFVd3AwanZjUUFGaWxyNTRsei9QNThOTEZhK2RhTWpv?=
 =?utf-8?Q?uBZpnXUcTzZn+rSRIXZsXRHZ6s6fIFeFamEBOYf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4514c639-5875-4107-bfd0-08d97db20ef4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:16:35.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW0YbVmdTsaANJAoAZwgIhIgF0LseVaLSA0hlmmR7vUU8Uwemvj3opwOmutQou0QlaA815pk9achUBVIzcuGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

Osstest has been suffering test failures for a little while from order-4
allocation failures, resulting from alloc_empty_pages() calling
kcalloc(). As there's no need for physically contiguous space here,
switch to kvcalloc().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: I cannot really test this, as alloc_empty_pages() only gets used in
     the auto-translated case (i.e. on Arm or PVH Dom0, the latter of
     which I'm not trusting enough yet to actually start playing with
     guests).

There are quite a few more kcalloc() where it's not immediately clear
how large the element counts could possibly grow nor whether it would be
fine to replace them (i.e. physically contiguous space not required).

I wasn't sure whether to Cc stable@ here; the issue certainly has been
present for quite some time. But it didn't look to cause issues until
recently.

--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -420,7 +420,7 @@ static int alloc_empty_pages(struct vm_a
 	int rc;
 	struct page **pages;
 
-	pages = kcalloc(numpgs, sizeof(pages[0]), GFP_KERNEL);
+	pages = kvcalloc(numpgs, sizeof(pages[0]), GFP_KERNEL);
 	if (pages == NULL)
 		return -ENOMEM;
 
@@ -428,7 +428,7 @@ static int alloc_empty_pages(struct vm_a
 	if (rc != 0) {
 		pr_warn("%s Could not alloc %d pfns rc:%d\n", __func__,
 			numpgs, rc);
-		kfree(pages);
+		kvfree(pages);
 		return -ENOMEM;
 	}
 	BUG_ON(vma->vm_private_data != NULL);
@@ -912,7 +912,7 @@ static void privcmd_close(struct vm_area
 	else
 		pr_crit("unable to unmap MFN range: leaking %d pages. rc=%d\n",
 			numpgs, rc);
-	kfree(pages);
+	kvfree(pages);
 }
 
 static vm_fault_t privcmd_fault(struct vm_fault *vmf)


