Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A346972B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:33:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238934.414129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE7G-0006FL-69; Mon, 06 Dec 2021 13:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238934.414129; Mon, 06 Dec 2021 13:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE7G-0006CF-2x; Mon, 06 Dec 2021 13:33:14 +0000
Received: by outflank-mailman (input) for mailman id 238934;
 Mon, 06 Dec 2021 13:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE7E-0006Bt-Bv
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:33:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e3c92b1-5699-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:33:11 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-tUU2hR1TO-uXqufT8ZrcKA-1; Mon, 06 Dec 2021 14:33:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:33:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:33:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:20b:f0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 13:33:07 +0000
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
X-Inumbo-ID: 0e3c92b1-5699-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oa6iC2T5QUROEVeYq1WfshK6wYPb0g27s45ej1AfY/A=;
	b=maAX+bD6rTZqv999b8CMYezBC5UcaFQg+TjdqVUeS9RB+DwvmevMTsMDfhf54VO9esxEbY
	jTAdoS2MIuZbr1ugiYPZ4RxJpdmses/SfJfej3vuqJk+gVgsHGhUvre1F5abj7NTaU/HdC
	tS04RdLXOKnz9FtlylwWGjdrDcyYUc4=
X-MC-Unique: tUU2hR1TO-uXqufT8ZrcKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx6ArBvDmjIXYc+m+1xoxAxezSSvaBdU8eFEGbDrM6oc0qjUnowaj8JDACb+N77BuYXmogStwNe8LACuGNsivbwLJCu15LjRlbjgjiqqpRGhulWw6GS6HW9JvhQyxFK5JhiYaz7zjj1Fz8wk4bdQeqEMr/sLDRfnLzO3u2c7awEauEhAVNXMO3XuOVnoLs0iMECeMbf8Bg7rgQtdTq9NEmXflgamS4vcdcjNVfLBwDeMwJX1BeGvEqXKoB1xKdPbUEPZNmEZslXIAuwfBbhz9uomkJYAPKGFmzdy1dUVQQPPSO8iOclDuSFjFdYZSJv7WiI9C+kocoRLiCacDaONaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa6iC2T5QUROEVeYq1WfshK6wYPb0g27s45ej1AfY/A=;
 b=YY2ijtEuvcQou1VPWHRGyLHH2Osh4dvOygRJ2GlhAk4DMhWJ9rzgVUjwZDlqsmq/eSfpXFwHQ4wyQZlbaIl97zMFe5wsI4CAGnkgfbqP8WDGQibu2FyGyhScXklV8yvcd4ntc8b+q2jyoAFpnJP8pbt2wfFQdEvFW8shq6Cyo6k4d/pdJz9CJioTRUCfmmNkO07b/NZ+eCjsilXMSrgJ0AT/vY2yE6dnuUtkyIk6bv/8hcDPCTVN/+JHVdjJt/525/1eHYHl7cZ87YAQfszK8EgwYQhZ7sL5JhBm/zApy5xndNfYm9V8+lDCIo+gtLOTJKHtrEGYYCn5rQIcBfZ1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81c95433-0931-5869-499e-b8f15dfc74de@suse.com>
Date: Mon, 6 Dec 2021 14:33:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 7/7] xz: fix spelling in comments
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
X-ClientProxiedBy: AM6PR04CA0046.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3e8f3d7-3856-4261-b6d1-08d9b8bcf0c4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574140855239959FF016AE60B36D9@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pv/+Vv7WnhJhWTNXnPlgYkviHVbXMylfJb2fsglz9CkkXn2tFEVKAvFIgZlbUWDsXrCrMGAlAfTxv3hBWr2B2PUJnt3WR+FXP/n1rC+cb26rOTVqDQ+R6uIlNBlRrwF+7LdFVYGBN7QpyC88uV0TSUGOKKfhbZxF0Ttk1lzOkwDb+Wr+NEN3N50oX9V4uNWoDRQbL6Ra00de/6Qm55+4EZml3zW/2ysY7bu16g+JSw3hkJ9Md/P+j4EuN2A9SUXLJHF0EbUIRaFSJzHiOy6Q1YRO4/aiF9z4ov1VAeXm5S83JYtWV0evKnNm/LFO+/5guY1EuPce5FMlsneXoWPkQWCvPYWZctj7cxPpvUwDSoedMToVnmA3xoOdx9WZz1ByWq10p9gs6cmTIbYItohzA6DUtSrCb9jldAhdspFr7c3k+yDm1BpeRn/M310X/2SnLyYgc93dTMK/h26Y4WB3sT31NL5xVw4m8c9iRDY6LFjmVDj8xlYtRjCjS7Q3J0BuJrxqiZtgyyMFiG4aB8udl8YrACDOr5lJ051JdWP3l+8lQr5VwdQBAxXzWWpWzc0hBsHu3LY4SqKO0B/8w2JyJBxV8iK3dBVcqCYyoznPVQ5Yd4LN1+soJS5i714nPIYsmsBx49Dw0sWXxw8RBfWVkBochCkhTOwNEaye5+KsAFYE6ZWwUc+BdiViHIJkaliakfj3xCypZo3qs+pAmTHFEMZExnI92bY3X7k6R1pdVwVrllrhzhDLU4NY7CGAyr2waTi08LSHHKWy2Pb2I4FECmehcGqpyO7RjcYHsYAuHLR1Mumx+6GeXqD8jgHFEKuq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6486002)(8676002)(956004)(186003)(26005)(4326008)(2616005)(38100700002)(86362001)(31696002)(36756003)(8936002)(66946007)(66476007)(66556008)(508600001)(316002)(2906002)(5660300002)(6916009)(54906003)(16576012)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnIwQ0Q0MUM3OEZiUnFEVE9TbG1qUUF1NUd6cTZjMEhUQ3J4b2tNVUREN2ht?=
 =?utf-8?B?QkpNT2tTaERjZGQrYWo5bERZdFpmdVhNMHpYanhpRk1iWTM3czlXVFVFYnRo?=
 =?utf-8?B?TkRXREtHRU5RODkxZGl5ZDluNWI1MmxoS25rR2FWeWNmTWNPeHo1MHl6Zk56?=
 =?utf-8?B?MFNjUWhEQnJGSmMxakdkY0cxV2RMZjNnaStNRTVzdGlHemZSY1J6SENvWVlB?=
 =?utf-8?B?YWpPMUlDSjA5aFJLN1c1MVM2NWF5Mk9JSmVkRDl3N2NjRXJOM2xwMTVPU2FB?=
 =?utf-8?B?aFpHd0ZGdnJrNmtuTXplYlFkMmxYVlI3V1o2SXhLTitUajJ6dVFaMnVLZjg2?=
 =?utf-8?B?Q2lkNnlKYm0zd2lIZDlaUS9WNFZYdjhDZGhLM2VEYTIzZnFSYnZaclNRYnlV?=
 =?utf-8?B?Zy9Rcjd0a3BCYmlwNlFpSnNWdHAxcUI2aU40Z1cySnorNTk2SXZOQzJjUXoz?=
 =?utf-8?B?OENOSElJc3lFTFZDZm5HcWVCUnZ6WTJsd1ErT1M0ZTRFdHpWNFNrTjk2RlBK?=
 =?utf-8?B?MnhpdHc5RGE4YllEalBiaWUzNTBQU0k4ZnJxTmFkdHY2bXJNRFZUK1lJQUJX?=
 =?utf-8?B?MFh3QVpLL1JDZWNqamZPQ09XRjRMRXEvTHR0TjRKUGVtMnBBZXN0UWFHWXhS?=
 =?utf-8?B?TXJxSzZ4bFZGM3prUEUyYlovRS9mSHlYRFlONWxXd1NjSlVJRG9LbjJ6VjRs?=
 =?utf-8?B?SjMvL0ttaU5WS1Q1VTBxOEFkTHlrSXU1cGtmamRKYTAvZ2w1VUpUMEpSNHdL?=
 =?utf-8?B?QjJmMHh0ZVNjcjFrenkyTVdWOWx0T0I0RU1veTNiOVlqd3RDZEdvYlI2RWFY?=
 =?utf-8?B?cW9jTlNVVWNmWUp5aElZeTFVYUpTYnhKRWJSTWRwVElsVGxDdXFhN1h5SlhU?=
 =?utf-8?B?dDU4NXUwVjdaTm44Vnp4aHVIMEF0cTJ1bXBuWkhVVUxXa00rZzBILzl3c0pR?=
 =?utf-8?B?eGFyaTlZMVlhRFJSYzVxdkU0VnBuMnAvSmRTNzFqZUxNNGpIUVpSelQ2UHRN?=
 =?utf-8?B?YndEdGpHWTZ2NHp4NEUxb04wdnBodjhtckJPUE1iWm1LQ3BlMC90NllwRVRk?=
 =?utf-8?B?cFZmWEtPZmI2ZHUyekZFQU1ObDBGaDhmTHdYd0Z4Q1R4OWVQTDZkSG5LOGta?=
 =?utf-8?B?eHZndzFCVmxNVnlSWkJIZ25FUnlvcWVCbWgvcHdsYzFkRXZlSHhnN0hZUm1S?=
 =?utf-8?B?Z1VyMGwrQXFzRUVBeklRcTZPNDZMZ3lzeWpxVnIrNlJ5c1RaVDZobE4zU1RB?=
 =?utf-8?B?WkQ1b3hSWVhMWXJZQlc1UkxNcUlsUXFBQUFpcW80Wk9uNHl5S2luRXpzMC9v?=
 =?utf-8?B?T2ZZekxwYmZSMDdVdmcvb3lZUDRpV3RDVEJMdTdGbzNIQVlpOXdSTHQxd21I?=
 =?utf-8?B?QmJWanU1a2dwQnVwUmYvaDlwaHpLb09XR2k5dXhGQXliM282M25QSy84QTF1?=
 =?utf-8?B?TjhMNmZ5NXdhVEpyMEJETmtJdXV4amZDYlZ4QnZrdnJxUmpyMW4veGNJNmdk?=
 =?utf-8?B?cHg2ZExOQWo5TTJZQUYxWmpuQW9KdGlrYURvNjliOHliaE8zaEJLSDFNaFJo?=
 =?utf-8?B?WVQ3VjVkUURxa0pKRjVsVFFCanBjdGJ1L3FFVHIwOSt3bjNRRk4va0lscW00?=
 =?utf-8?B?SSs1QlNZOUtnU24zeUlWMEpNOG80Qml3SzV4R2lOWGRHTXdVUlFRNlpKRkh1?=
 =?utf-8?B?bVQ0TnBEYm9OREhCbytoMFBPSW8xMVFNTWZLQldpYmM1MTh2Y0lVZTNNVjlT?=
 =?utf-8?B?VDkzbGpSSVl4K1p0czJ0UnI5TTZ2OWFQZ3MwMXJDQWIwN2IxMGFMWTVzTWJJ?=
 =?utf-8?B?Yko1K1dmWlNzc2NnelM5d1gzNGM0L1JsWXpUTmpvV0tUR1RqL2h4RlNqOFRt?=
 =?utf-8?B?Z290S0JqWm9JU3h2bDJId2l1ZzR3QzMyVTN3Y1BXK3lXNVZkS0t6MWNHMWJ2?=
 =?utf-8?B?TkhjUjhtWkN1NXI1eStzeS9wTE9BMDZCSXlpaTVMcEtyczkzNDlpcG54V1gy?=
 =?utf-8?B?V05yZHloZmZRVnJlVm5aaUowRDl0T1JmRVJmZ0dJRnRzRk1wSkFLRG9DRGcz?=
 =?utf-8?B?ejd1cm55enlxRE9rY0lsOWg5dVhGb3ExVjlrNHBHY2E0RUhiWTFDWWxIMkZs?=
 =?utf-8?B?RHdqNGY0aS9PQmxnQ0d0U2kzQzBtUHlKS1djYWdkWlp3S0Vpb0RpVzNHcmRS?=
 =?utf-8?Q?nLgs60UQxV/Y+aXcEafYdr8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e8f3d7-3856-4261-b6d1-08d9b8bcf0c4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:33:08.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7UbTg+qr2Ks+qAiKGKlq69ZzcMokPvKHcUD9oVPRaZUz9iCe5eAAIwyKcvbdCBRZcatGh9DWVLi840yLxLhzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

From: Lasse Collin <lasse.collin@tukaani.org>

uncompressible -> incompressible
non-splitted -> non-split

Link: https://lore.kernel.org/r/20211010213145.17462-6-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: 0a434e0a2c9f4395e4560aac22677ef25ab4afd9]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -20,8 +20,8 @@
  *
  * The worst case for in-place decompression is that the beginning of
  * the file is compressed extremely well, and the rest of the file is
- * uncompressible. Thus, we must look for worst-case expansion when the
- * compressor is encoding uncompressible data.
+ * incompressible. Thus, we must look for worst-case expansion when the
+ * compressor is encoding incompressible data.
  *
  * The structure of the .xz file in case of a compressed kernel is as follows.
  * Sizes (as bytes) of the fields are in parenthesis.
@@ -58,7 +58,7 @@
  * uncompressed size of the payload is in practice never less than the
  * payload size itself. The LZMA2 format would allow uncompressed size
  * to be less than the payload size, but no sane compressor creates such
- * files. LZMA2 supports storing uncompressible data in uncompressed form,
+ * files. LZMA2 supports storing incompressible data in uncompressed form,
  * so there's never a need to create payloads whose uncompressed size is
  * smaller than the compressed size.
  *
@@ -127,8 +127,8 @@
  * memeq and memzero are not used much and any remotely sane implementation
  * is fast enough. memcpy/memmove speed matters in multi-call mode, but
  * the kernel image is decompressed in single-call mode, in which only
- * memmove speed can matter and only if there is a lot of uncompressible data
- * (LZMA2 stores uncompressible chunks in uncompressed form). Thus, the
+ * memmove speed can matter and only if there is a lot of incompressible data
+ * (LZMA2 stores incompressible chunks in uncompressed form). Thus, the
  * functions below should just be kept small; it's probably not worth
  * optimizing for speed.
  */
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -505,7 +505,7 @@ static always_inline void rc_normalize(s
  * functions so that the compiler is supposed to be able to more easily avoid
  * an extra branch. In this particular version of the LZMA decoder, this
  * doesn't seem to be a good idea (tested with GCC 3.3.6, 3.4.6, and 4.3.3
- * on x86). Using a non-splitted version results in nicer looking code too.
+ * on x86). Using a non-split version results in nicer looking code too.
  *
  * NOTE: This must return an int. Do not make it return a bool or the speed
  * of the code generated by GCC 3.x decreases 10-15 %. (GCC 4.3 doesn't care,


