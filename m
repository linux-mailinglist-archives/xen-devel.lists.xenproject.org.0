Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2799469710
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238926.414096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE5Q-0004Cp-5V; Mon, 06 Dec 2021 13:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238926.414096; Mon, 06 Dec 2021 13:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE5Q-0004Au-1J; Mon, 06 Dec 2021 13:31:20 +0000
Received: by outflank-mailman (input) for mailman id 238926;
 Mon, 06 Dec 2021 13:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE5O-0002vN-Cd
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:31:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca8b90c9-5698-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:31:17 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-1203vd6lPwWmIyTnIi7LrQ-1; Mon, 06 Dec 2021 14:31:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 13:31:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:31:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:46a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 13:31:14 +0000
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
X-Inumbo-ID: ca8b90c9-5698-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCSQ+AXXRTjdtJyeP2akK62GyR4QHv+YZ2pLR/0+MYY=;
	b=N+jIBQTod0rSqSca6OhF0Y5AAPCqiCSEBvM9INGhPUR53QF8VsO/f3KwwuLv/IRQXqPTAK
	7Qm50/OLOwkeUuKGo8OAT9/tDB3LrMAdOhL2WjWExO2LvucAOz+4TXtS4vgJyOTc3aN2B0
	6ZDCCnELuSZA/eNsUTlR+5JJFwNTfNA=
X-MC-Unique: 1203vd6lPwWmIyTnIi7LrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXD/pMNJm4DdDLSYKHPhETw1V5AUWHQkHOyd1x7mmvyAbmqBaKt/bbBDF2Sfx1pwgW5PlklwXnbR7Hefaf0XZjeOceUmCxTPfImxs89dLm/WRDJNtLYiGAO5616Llkl9WgDW+T7Gal/C+QR8UACAjlhsdeBKP+ur+Btr+jtFo2wyCov5SPoG0K+ODyVzewGVqQYCNsp0LkUeL5ttLc9N+AVbQSVRSfyWnxCL4CXYEP9YVsEs0+f8Xeef5v1MZgq5vVBx39kFMaLJkAtXZz8HYmYvc/FZxYBQWqj7PgDTM6veHJgLgNe4K/aHa1znbKmuDLjtzpCHmr95pDRVjkhxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCSQ+AXXRTjdtJyeP2akK62GyR4QHv+YZ2pLR/0+MYY=;
 b=g48RbDNF3lnvgZuKyy30myXG1eODG+qfVC2IkR38+ApkVofWlP4KNmRzVZCuU0gSgV3iWpsUx/i6jmyYvRpJciBvmhxyCgNDnAdXUgUyag0hTARMGbsLreHIx01YPHkuFJSQrMSzhkQL0xb35FGRMsR+p8VKhhStmaVSZNDTGVpvi2h6SeK3ISIhyMOB0rS6SSBPZXSAw/20S6xjpT39EdTKBDbDtFos84pk764Y+22hMh3TNAoqad/fxcZFR/AgoHlzuClBWuXlGNSppj34DnvwbDKEL6jQsf8GKcj0CGLCv4bQ4njYopnbaaUCRTbgN5fg41q75hhDuHE5qGiLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdf92555-56ff-1205-6c27-1388ce745a7d@suse.com>
Date: Mon, 6 Dec 2021 14:31:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 2/7] xz: fix XZ_DYNALLOC to avoid useless memory
 reallocations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
In-Reply-To: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad052fe7-2175-4be0-37cb-08d9b8bcad4c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2829D84C82EEC937765B6FD8B36D9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:56;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G83S7QF4hvyypzbKflfnJf+cTPkeQng7ZZXzeHHUtmjk3U5z/bI46C2wR7Gmr1BjH/GBpyD3oCG2I2Dqwz+kMnAyvzDkO+K4DiRIL1x6g3xiokR5dc8eTGSzwp7XdnfjnJlXxBv3hy9XissWzOjtxt5JqIkwVKllQiXlNBRS+sNxHqUlnWJlDqRU7odeCXtCeI96fA90+pJB/nBjJgP0R/ITKStUaHQiUlXwof1P2NbgRdp4uQ9+idMQmVJJfHjZRFo4hxWns5qU6MIIVCbTrj1mkd6gT8ntZouoOrMZRg6JneLiX85pkEl2bjFJIaGQ84r1FE2tCac5Igx5cGk6QEbkGGOwu+H+/t2QY1D43Fs3oXyXfOCURnFwCYaiZ+fGw2yaxPs766hrEVH/rDRbk2I5+nz8WDj8TNnmJqn40axia/Mh3GQ4x+Twa82uW43oTQhYyR08M19LWAg1xEWdieSL+itYc9+SlKmh1EiYP0hf/xJ1oX5AKCNPFgGb10o8d6pCxBctIT+GKNMezUG90Qe25eLFphgdGQPPxe3YBJJjFoZldV3MXaBwJncHQWpuDo5uJdULqQ2q9yLslC45zKR4ahGiPe/pf8JLQMOLw2j+ZHvvTbOAE3vrdJH5tXyoveXGgyEDSV1keI+Mh3qUoZTSL1/GgI0s0/dFDGdsnqd20aydg/JduM6miiDVg3nf1eYiTyrlkdxN73+f1JzUg9dKWySWFarZmbJgCXTOLNUfyMdeN2TlB7slMrMDjOwlgVVo5vC8fYsjsqf3F04sARfM9JYiASjoe15TLyQsx75hQaJeEl6elZ0G/GDuqVVQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4744005)(956004)(2616005)(8936002)(186003)(31686004)(8676002)(36756003)(6486002)(66476007)(316002)(6916009)(5660300002)(86362001)(31696002)(2906002)(26005)(4326008)(966005)(54906003)(66946007)(16576012)(508600001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0JYRmFmdmFYWUo5cU94blQyNWFxWSt6R1ZOYmVRT0ZMSkhuOWFEeEtZVGFP?=
 =?utf-8?B?TjFXTnRFWVZrVnhoQ3Ixdi9XRXdkRHh4OEp1T2VFUksvbWdiTm9PL1pKYXZO?=
 =?utf-8?B?M3hPVjFYTy80MkJPUTQ5ZmtHTjlPUFpGSjRmYXZoVkZUVjNKNzd4WTIzNWVi?=
 =?utf-8?B?UlhzWWdaa3Z6YXJWZGZWWE9lQzh5UGE0UnQ5K0hnZXVFMll2RHZRZXhjMytL?=
 =?utf-8?B?NHMwV3k1ZmJrcitVVHE3VlFtUklKNW1LZGtLNDB3SkpvN1JsendrMWhnQlB2?=
 =?utf-8?B?d2tEeHUvU0FMM3crbUhvYkdMbWM1ZEpsLzlSdFdDa0Jic3kybnByY3JRdEF0?=
 =?utf-8?B?UHd2cU5YMWtES0hRaFh5dkc0T0QvNlJ5WGpwSVJYTnFwdFlycUkxMHRrYlBL?=
 =?utf-8?B?aWRuUlZWd3dDdzl4WHZnYTNyTDNkNm9wZzU0RVREL1ZycXo3bnlrUU5aeXQw?=
 =?utf-8?B?SXBsRDhNOXBxTHNhZ1VqNFR6NFNjNzltVldCdEN5aGJ5V3V0ejFreUhXUFhn?=
 =?utf-8?B?WkNJR3BENW1qU2RyRVJMemtvUHdiZ01Oc25jNm1ocDZNMTRzMkZxZ2RqS25N?=
 =?utf-8?B?czlUNzVrQUcwZXhwSld6WmdrcHJLUVV1dkdDWmwyNG9CNWZXa0M0cXlHeUJh?=
 =?utf-8?B?UllzL2ExczYzeTV6TU9IQWxrWGIySE1TQnZYY0tDZnBkQkc0V1pZN2xsSENa?=
 =?utf-8?B?U3pYcEFHUnFxaTFEbW54RFFlc2ExRU1PU3dzcERJZXovSGtDV0JrVXQ5R24r?=
 =?utf-8?B?WE5ac0c3VWk5SWNQa29rR1p4QzBoTVhOemU4d3NNRTdvTkpMT2Eyak9iRGRT?=
 =?utf-8?B?U1FxdDN2VWViNHZJWHJnSnpFZzhLK3lLYlJCVTJoeC9CeFQwTkZiNktwbUtW?=
 =?utf-8?B?bEE2a0dFb0R3eHhwQUJZb1NrY2pUTTd2Y3k1WDIxUWx4b01xVDhwVzEvc000?=
 =?utf-8?B?R3R2VmthdnBydFlQdG1jTHE4RHVCRDdES1RUd05IN2NKSWtnaW5lcnhzQzdB?=
 =?utf-8?B?Z20wY1lONVhWa2NqU2lqRitseXY2TzZiQzVGbmxRVlF2cUQvMmxZbVd0U0l1?=
 =?utf-8?B?MFF1aTlhODZBd1p3STN2TzVzdTlwTHNxVWFpajB1a3MyYldKZWpZUzNJd2Zr?=
 =?utf-8?B?Zyt0eDdxK0E2Zjl4S0JUYVM5cjM1VHhGM2lxOGl3eHQxaWtDbXNsMVdOZzU2?=
 =?utf-8?B?ZzNRaWtZZER2VHZrY2ZJS0Q4bEFZUUVrcndzZ2NjYldrRmZjUHhZSldQVkhp?=
 =?utf-8?B?cmp0UUtsNkJtV0FkMzJyMnU1eXh6VkJPUXh6bTZuQWFmellkTUc0cDgrTDVY?=
 =?utf-8?B?WmxKOFZQVDVNSDQ3WXdxUEJ6Z2ZTUm1ielpjTGVsbVo3alpBNldERnJ6cmlP?=
 =?utf-8?B?aGVZMjlpUDJveEZHY3FPK2N0Z0NnYmptSlp2RU5Vd0pDUVZGbUJRUENEUEwv?=
 =?utf-8?B?elZQTytldy9oOHlDcnQ2NFRwQ2NxNlFYVlJuN3hMVThJTk5lY3pJSVRSb3ZE?=
 =?utf-8?B?LytQWnBmU3ZTWXNjMjFwUENxbGQ2TnMxTVZkOVd5ZEltRlNiRmFLRWJNYll1?=
 =?utf-8?B?VWVDR3kwUEYxckIwM2ZVcDFpa1dzbmVzRlRMb3ZXd0hQZGJBbENWdDFOME40?=
 =?utf-8?B?aDY1WUpmcXVRVzJXUituaU40Sy9LMFhra0hQUlZwM3FWb2FJWVB0c3hSWmZE?=
 =?utf-8?B?Z0ZLbko4a1ROMXN2RlZYSEcxajdaK2NhRlB4RTY4QUVEMjFlMHZHVEt5Mkdp?=
 =?utf-8?B?UXZIWE54TDNRQmlBRU1ML2xIOUR1UFg2SVRqOFIxT2ZjTDZrRU9ianJncTYx?=
 =?utf-8?B?dkhNMnkrVW14UU1YYVhWNC9GakIrVXpIMjNjZml4dDJhVHNzR200Y1RoRDh6?=
 =?utf-8?B?UnZZUGVyenFpYk5RaWordVJzSmFhZG5GNzQ4NTBTQi9wWFZXaG5GM2lCc2RY?=
 =?utf-8?B?Q1h0SDZLQUEyaGVJKzEyMzRVTmFROG02dWE5MlJ3RnhKZEttNDRzczRsY29Q?=
 =?utf-8?B?UnNjZ3ZOczVvTjhFTjNuT0dZYmJwQ2RVUEtiRFJYL3Bjb0toSk15RGxoaGxP?=
 =?utf-8?B?U3ZTQ2dQVU5Ba3hEREptc0FQUkMvOC9LNVh3OE5Bb1Uxb0RDUE9hcmxlVU5a?=
 =?utf-8?B?amFQc0dKSlQ0V2JOeVQ1VjV4a3JpbHRkYzRBZUpvdUhkYUp1VDR6OVJRRmNO?=
 =?utf-8?Q?rWHcU8ay71cJTPiYxXOyf14=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad052fe7-2175-4be0-37cb-08d9b8bcad4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:31:15.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwuFnTOYtfaJ8ww7xrKzlOSXNUvNI2Tmy7z1kt78Vqx3PVsXqcclc5vpkbD8uSNzJLWt/g2jx80yGONhGHbP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

From: Lasse Collin <lasse.collin@tukaani.org>

s->dict.allocated was initialized to 0 but never set after a successful
allocation, thus the code always thought that the dictionary buffer has
to be reallocated.

Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
Reported-by: Yu Sun <yusun2@cisco.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Acked-by: Daniel Walker <danielwa@cisco.com>
[Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -1146,6 +1146,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_lzma
 
 		if (DEC_IS_DYNALLOC(s->dict.mode)) {
 			if (s->dict.allocated < s->dict.size) {
+				s->dict.allocated = s->dict.size;
 				large_free(s->dict.buf);
 				s->dict.buf = large_malloc(s->dict.size);
 				if (s->dict.buf == NULL) {


