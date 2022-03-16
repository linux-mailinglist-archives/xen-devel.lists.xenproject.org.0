Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542844DAE71
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 11:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291137.493983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nURAF-00041i-4X; Wed, 16 Mar 2022 10:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291137.493983; Wed, 16 Mar 2022 10:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nURAF-0003zf-1H; Wed, 16 Mar 2022 10:45:59 +0000
Received: by outflank-mailman (input) for mailman id 291137;
 Wed, 16 Mar 2022 10:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nURAD-0003zX-Lq
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 10:45:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42081096-a516-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 11:45:56 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-BuFaEF_LPIyESW-Kht-VZw-1; Wed, 16 Mar 2022 11:45:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6087.eurprd04.prod.outlook.com (2603:10a6:20b:73::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 10:45:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 10:45:52 +0000
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
X-Inumbo-ID: 42081096-a516-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647427556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eMIuBjeuO9vEqUrYE9n3lGQ5dKRqgk72MpQfcGDuly8=;
	b=mCVsMMDNNt4bMNi5G45MJurv9x70LEMhXKFFMdrIkmdmZ2dWk3qPzVzeNWK2o1UDdbu0/Y
	xK+Uu89qWIMhULK2T37mhwfM2gpjlZqVhPc9h//bKUx6lxZoa2PndQ1WxwZRbVmcTA785r
	zTAQtVL1zrNnbt7fB6ouissgYdLiqVw=
X-MC-Unique: BuFaEF_LPIyESW-Kht-VZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTsX7DoihiMdesUeiWvFbmtjY90H9TD22cxD3vn9AaByEs1rUGUOjVKl4DvU7brZemT+a8AHb1/AwyJHwrLgYerC17XmlNIkHi5RCJxv5Ewe4Tor8cdjn7wBV2APR7aHjW470wyFU77B0CqbwV4GsbObZRWvbl5smKev2H83ZQ8evTE41t+T8oQD6vWKqwl2ntHe4SYLiHJ66MOUMePB36LElmpD5QKFyC+B0lWJ+mtLDoL6ek2K9RaoErkn1NAbiLpQAEnV1mZmqM4Bz1+yo8EhIovhwTkjfezg8zG6fSclo1PKR5DwK2ekFtc5uACs/zx183KnEQdBhci8CBziAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMIuBjeuO9vEqUrYE9n3lGQ5dKRqgk72MpQfcGDuly8=;
 b=j8RN4eToomj2DM9BgglR1jnd30+xNn37wrKx1Y0EeEk8hOeyGbFfS3EJtR8GnJQ7/U7PHe9lr+0YdTrgIkoQVPnS0R8uPakswLeY6Y//dmPWIs6dK418HkNWvJoNchW9xz0FP52pPymNqauwMD89RX8hY2aDRv+GJDmmS9mksbn2Z7NPrshr/KSsTtL1p3axI9eEu3oqbTmFc557fLmO7irFHQM2vgNfJK02ZrzPqOoPJOMG22Szp9ieQneg2YeFos2272568azo+ydGS3k4eIAnGV1BNVQdTp2Aa3QWvMt1hapcbi8LigR+IGP1rhsGlN259skaXYx8DC+Pb5EKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85dd9ad2-0eea-432c-24d2-40c6530776dc@suse.com>
Date: Wed, 16 Mar 2022 11:45:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: correct VCVTUSI2S{S,D} comments in predicates
 test
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0092.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e54ec119-5400-43c3-46bd-08da073a241e
X-MS-TrafficTypeDiagnostic: AM6PR04MB6087:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6087D396B6E4311F2E81621AB3119@AM6PR04MB6087.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	45pfKdo2nPTICuswGdmAYMAajCYZGOTz383I3dQ1BtNO83G69pKQp3+mNHXDX1ko42iMe2vgSx4VWPklr5rC2Ics/3ZiYdh+NVkD86fJRU1LEM50gSWupkecNjugt4h7Lv3aZ6j3eWXJwicLkuGh4eJbpEvM4TJSGq7wKVaVK5oa0PRzJLDinKSbBnacalck79yWF8kQ+bBkVS1vyO4Q9sipklBA5W8vu9fcJw1x+PjAZSCNIPKe+7GFS6E7NniqVdOrvJZvDZpWlZ1yFnyZ+GvtKxDDQRpCpqauvq7I9anyDprQPAweMR8WhqdJbW4n1XBBd4RhVTq86g93qk6KG6BufZk22PKyfg00JN+ITId54h8/WWQn4i0S7VAkZqMmqwucMfQ+h7ba+CiCezG/sNp0UPXvy49rr1wm7puGpA7/mAQV8g5bb1rzPyOlQP/EhVU2V7WK3mpCcfocw3PoVN4mGHfhygi0EV3G6VAzH0RTugbInpQcGYyLbuIE0ieNhSMLLLLUpWN2stKPluyPqLec+wlCX5uWvdCzx3RzKwMNmBt2WcfnudNQ8Hf/KwNHxPFLhLNetK06bTam/Dawou2Ia2DOIqNE16Bh63WnK/S2kV7nNEd+/MjLEOV8sMEvpzjrJ6T8sJ1rgSCeSgNjOyMuVM8ODY3y3ma2763x4B7Ut+/z0wcbS/a+nVzfM9RTO77jA2U3hNf2HjhX+Sk1sdssLs/PltR78yAo9FRP98A+4wvL4JBAY+Tc85MizYVp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(6506007)(38100700002)(6512007)(66946007)(316002)(66476007)(6916009)(2616005)(54906003)(8936002)(4744005)(6486002)(508600001)(2906002)(26005)(31696002)(186003)(31686004)(86362001)(5660300002)(36756003)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlFtUzR0eWRicWVjMHE0bGFtVGl6VEQ0b05mODdRS1NoSDdpc3UwWnFnTFZp?=
 =?utf-8?B?cGM1VHNmK3k1ZVVBVkpXKzVxdmF5RitTdDRySXZsWGJVYmV1a2xHUDB0Y0J6?=
 =?utf-8?B?dkh5djNFQmsxWjd2WFNwSzY3US90MGFYZTBPNG85LzJDZTdpZ2h0ZFVwakZO?=
 =?utf-8?B?NHhoWEMwZmNRTkNVUWJ6SjVyRmdLNlNrVXpEcTJ3Z09rUWxJbmo1VkZrZUxP?=
 =?utf-8?B?bHlsdDFmaFl4RTltb05PUnpyMjVZaE4rbHN2aHdCcGxXMmtiWDFDcktQTFk2?=
 =?utf-8?B?U1pkczh5L1g0UkpscStoaHBCdTV4dnpuL1Y4S1MxTjJxTVNiSmxjTk93V0ZF?=
 =?utf-8?B?NFlwd3BCQndtWGRzLzNvUnc2U3RObW02c3ZQdEJpMU5zWE5QTjkrMU0wL002?=
 =?utf-8?B?LzFjWWU4bDV5YVBMZkZ2NFFhWDlkWHdqdmxBV3RmY1U2VUNDQjI5VGxLVjU2?=
 =?utf-8?B?WUU2TGpFK09Wdzl3TUZUalZzTVZqU2pnT1NBT3dlLzdSQ2VHZEEzYlg4bjlH?=
 =?utf-8?B?eGhxekJWWEpmZWpjT29kL1liQkNWVjJnd3c3VkVoM1pmU3hlUjU4KzhuS0wz?=
 =?utf-8?B?NVFhTTN1ZkxHb2d1RkZmcnh2aGVtMnlIZHQyNWdiZWlBUXA4dlFLaTF6WGZs?=
 =?utf-8?B?Nm9helpqb2FrSE50NHpIRm16QkZGbzB6KzA3Mmp3L1A0T3hYVk1SL0hDelpM?=
 =?utf-8?B?eU81dkw2WnZWU2haTmxqSEllaU1KMTFmZVFFaUZQWXJycmkzZkQwTUhNZDVv?=
 =?utf-8?B?d29XS1EvNHJDNzlGeis0T1JuNG0zRXl3LzV6a2ErZzlaUXVpd3hSdEJqU2NQ?=
 =?utf-8?B?dno4UzByUnpYeWhpY0xjdHFKSmQvNnZNMWFYZk1pcUJFeGFmeXcvdlhhOEpU?=
 =?utf-8?B?aVJ3YTM5ZnhHaWFMTHFNVUFxZlFQeFhaOG8xS0Z1SEtySk4yS2FpOGJBR0Jl?=
 =?utf-8?B?OHF4TWU3Z0xNWWliYUozMW9NTjhEQklTRm1OZ255Tmd3WlZiQ0NDeVJuRS9z?=
 =?utf-8?B?dHQvNEJzUlBIOUN3ZEhPdm9rbjBSREtkMGJ4akluSG9VR2J3RHVGWHhMVnRW?=
 =?utf-8?B?aVJNZVBIVFVpK2RFRm5hODdNNm91SDVjaGdHcXBEclRpYjNEUmIyeU01a2pL?=
 =?utf-8?B?MXFsV2pFOHJqTGZyQ3pLT1hNTzNqYng0VllmNTUza1pxR0tLd2tUQVFMeFdT?=
 =?utf-8?B?RXVKTS8wa0dzbGFuREdoS2UzVFRjcjVZQk5oZWR2QkpuMTVRQzJzek5zWS9m?=
 =?utf-8?B?MjZUa0MvYjBiRmlNeXJqeEdJc2o1cjEwQmNIYUc4SHBYc1pQU01CQUJGcUJU?=
 =?utf-8?B?bmRZOUlzci9MTUY5SWFKVVB4TUcrckYxOGZMV25qRDFnM0crb2hKRzRrZDAz?=
 =?utf-8?B?M1YzUkhSaXhWUXFBSS9EaTZKWWgwSDkwaTZueGhXUWZiQ2U5bCtaK25CeU9x?=
 =?utf-8?B?TG5UMzV2blFMWEsvZG5sOFR2MU5JeGpER2Y4K3B3NjBvd3NCNTdzYy9lU2Jh?=
 =?utf-8?B?Q3FQcVNGOHdnN21JOEppdHVRZ3NwaXBzMXR4b3RJZjlkRkVQd3E5c1lsWTJh?=
 =?utf-8?B?T0ZPOU52VDNUd0NxdHpyUmtieGZMVTN0VVc4YmxJN3Mra1NmbmdiM1kxQmE2?=
 =?utf-8?B?SXVNZFgxMHFtUkVLbFBHanVwcHVwdmtQQUtkaVZxc2pBWlJnRkZtZnkvUisy?=
 =?utf-8?B?cnJtVzNLZjUyL1Fad3AxQzJLRFNkZnhyWEhUVVloQzRQL0RlNjJ6eGNpQmov?=
 =?utf-8?B?QnlKbnBaSmRRb1RsQjZNc0t5a2N4NHlsZXQxeEhIS3FKcnppVzdNNWlIYmN0?=
 =?utf-8?B?R0IvRHF3cEhublNUZzI4MjNmNzdxWldCQkdLMXJ1OXhlNTQ1OE1pNlRCeVVQ?=
 =?utf-8?B?TS9SeGJBKzFqNmlzWVVBd1RVZDU4ejg4NVBHRHlwdmVTbXdTOGk1V2YrK3Zv?=
 =?utf-8?Q?xCXDRto1HtaQnIV/XOxwHV4toN/p5KXU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54ec119-5400-43c3-46bd-08da073a241e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 10:45:52.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjGbJyjUjjvh/DN3CpuYblVbxi+707G6DcI0/khGc0FixgnYWrEIAWZisD2TgPsuURswii87l5lLYP1QeLj2AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6087

These were missing the size-indicating suffixes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1712,8 +1712,8 @@ static const struct evex {
     { { 0x7a }, 2, T, R, pfx_f3, Wn, Ln }, /* vcvtu{d,q}2pd */
     { { 0x7a }, 2, T, R, pfx_f2, Wn, Ln }, /* vcvtu{d,q}2ps */
     { { 0x7b }, 2, T, R, pfx_66, Wn, Ln }, /* vcvtp{s,d}2qq */
-    { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2s */
-    { { 0x7b }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtusi2s */
+    { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2ss */
+    { { 0x7b }, 2, T, R, pfx_f2, Wn, LIG }, /* vcvtusi2sd */
     { { 0x7e }, 2, T, W, pfx_66, Wn, L0 }, /* vmov{d,q} */
     { { 0x7e }, 2, T, R, pfx_f3, W1, L0 }, /* vmovq */
     { { 0x7f }, 2, T, W, pfx_66, Wn, Ln }, /* vmovdqa{32,64} */


