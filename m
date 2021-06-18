Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5AE3AC8BF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144419.265818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBg1-0007Wf-Eo; Fri, 18 Jun 2021 10:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144419.265818; Fri, 18 Jun 2021 10:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBg1-0007Up-Be; Fri, 18 Jun 2021 10:24:41 +0000
Received: by outflank-mailman (input) for mailman id 144419;
 Fri, 18 Jun 2021 10:24:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luBfz-0007Ub-TQ
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:24:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85329b78-6aa6-44a6-8731-fae0d3dbe456;
 Fri, 18 Jun 2021 10:24:39 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-bjUvq9YROz6IVE91bhG_Og-1; Fri, 18 Jun 2021 12:24:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 10:24:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 10:24:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Fri, 18 Jun 2021 10:24:35 +0000
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
X-Inumbo-ID: 85329b78-6aa6-44a6-8731-fae0d3dbe456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624011878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJvvmVhJ6x/yxLap6O6VF1QkaR/Dz+vEuOFGNI8+yBo=;
	b=lUBiefxk9fiCLsvfP2HFiRGfWY3nZ2LikCC7U+Ck4iSDc+7PjrX5u7KBj2+1DFF5PfjMKX
	BtIIpl03AHkHL9UbH8BzvmRGFlu7PTByz6CJiO4uKnY8NUR1/15svMlOOEQcn+vhWsjmSJ
	bQSRtv1KH71fUcoUo3ybUFIx9qSy1zQ=
X-MC-Unique: bjUvq9YROz6IVE91bhG_Og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io7zHhlximNRb6H+4Lg5cKks9eQkof85SJxLkPJf+Hq9NM2eQzRRyyqHT0WRc7be6116ph33JYjkXlqNOQtccMjACve5771e8+4+jP+XQXnk96uMsTWYWhKFbv2t40KBw5VGh7tf7jYnSs4OJmBMeri6bJDJgZqhXJEc8gdDRVt1SNx7/Z5FOUWU4lxY5h6dswy5ebT+01Nk/lmVJkNrUiGSKuyW2uJ2CEVkdZjCRgYk5KmFQ3bwMYhdkeF1fULPicDWZHOL2+CEzvKPgsfWvqT8ocPcE8JRcE5edfRMG57JS6Oez9fSMvsRbga3UP3pnGc5Zgv6rtuWdIsTLccQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJvvmVhJ6x/yxLap6O6VF1QkaR/Dz+vEuOFGNI8+yBo=;
 b=AHyl1X4Q9B7isuvkctHvooAbyIBv25erq/5dgqmD7jL7uFOnA1zCp9Is0nzvlVDIh2OG7CiAqFax4ARqa7Tk93MaHoxgHDXWYjHb57tzJ1XBNvknEohn6fBUE/ZXD+sERFYSyiRkzW2xRZgWFBhogaUGqx4OGrKVUbSEBMtagAIgNMaPmSewA0qCqVQajVM6OnezNEjTO22nNObxiuoM5zlFMKimwj1jnIY80CGHqTbwBlgRhEFTjTlJWMVOjzSeVl6YZBCUJZ6C3Kd0yPavvW27oHUCkXX53t4j4QiYgPi3uh07q3DCWBNbeV5z2WnkEPz3WH/J0ppeedBKi+gGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/5] libxencall: introduce variant of xencall2() returning
 long
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Message-ID: <c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
Date: Fri, 18 Jun 2021 12:24:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ccd42c-c63a-4e24-fc0a-08d932434541
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686409383D94A5ECF0DBE10EB30D9@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eORuFAJLq7M0+z8xJXd0MBabM1yfiCgDK3ay0C+uT8XuJI4Ymh6337T6vcZuqLaLvFnXG3WCeAI6IwR2VbcCL2J63tbGdUTi83y3Wfzn1S3NNuwhV0xhKvyNfNxWbOnBzBtDvH5IphcTwYXu7zyDZwzlXOyRt+oVm/10XRLGvSYwsOhKsrXhrWDBxkgbUxTdQmn+RSUcSXoDmt09vgWF001vW0NaNoT0VxlM2TAOsZjbtPwSZ2LyR7WxecC/qQTKrsi9XLWfFVTk34hXdTzJ4/Bh8UnTcp52jLRzXMqa3Cj0fTVE/65WyK6+Zc1ILfHtOQ+kRhQgCnnrEmeRk4T3JrDgomNAdtSKR8RPiALmpGvjZCMCkNtisi5rOAzmgN/7w5N4706ttxrh3jbtyLlceDUWKRSnbsMBfe/wUZUddZmY1g4dS04TuDuX+Mwj5N//Jag+8onDrhV1QsBRZ0R6AmdtLOaCfmDAYpeOI1uL7L62ij/RbxqgSX9DyUELqwR1RIFID7ZXKZfOMRbvgn3I680/RbTpLwXnGhgCcqwPKtKG7rGfeFbpOaWCFgTXHncrdOrKh/eJCnf8QKx6wws61G14CrWdyIukL9yAbXkOeWYVwv2XaIgHDcP63HoLvZYUlcibTZbv6wyr6T+kD9kd4zsngZ+3CaI4ASTScr8IbwxqJYsmX72JQhIk08AJPZmZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(346002)(39860400002)(2616005)(956004)(83380400001)(66946007)(66476007)(66556008)(6486002)(316002)(26005)(186003)(6916009)(16526019)(478600001)(54906003)(16576012)(107886003)(31686004)(38100700002)(2906002)(8936002)(8676002)(4326008)(31696002)(86362001)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZlbHRRc0hUaWliMFNEdDlSMEpBODVVSFlBaEJzMFV2d3FsSFBPMCtHVkpT?=
 =?utf-8?B?V2FvZTZqSVdlV2puNXI5SThoekNCUmNHWnFRS1BRSnY1TGdZbEJvZ2hXZ0Fl?=
 =?utf-8?B?WGMwR0E2UUNnUWNyWU1mUG1Xcjk0a2xDQ21Ub3Y5cGtMV1NOcFZFbVVPamlO?=
 =?utf-8?B?N3hodDdNWFpYWjJWYjRJc0JpaTgwRVN0ZXROb2U1NkRsdnhtTTZBcUtGVG0z?=
 =?utf-8?B?aU45UWhkRDJDbUdBb0FnMVJhSGkzQ3d4bDRZVUlLbkZhSHVtOWlvbi9HOHVi?=
 =?utf-8?B?STlialVtY1ozVnNPeW85UjdsQlBBb1JQUFR1NHh6SGRKclhWQytMckdobytS?=
 =?utf-8?B?UHZSSkloejQwS21qb0VzWFdMK3pqeTAvOW9GanZKMEFycklua1QvQTBhMGgz?=
 =?utf-8?B?cCsrOFlZdFNQeHM2VUFmTFVFNG41QkhWRTdoaEpIcHNHZXdnZk43UWlhN3Nq?=
 =?utf-8?B?OUU2RDZYc2Q2WWhPZnRxdkJZMGtHS2RmNmlWSmRJVHZWbk1na1BQMnJJZ2xU?=
 =?utf-8?B?Y1RCcjQvWEdNY0wrMTNiOE1CSFk0R1hUay8xdS80UTJJeGhja1V6Y0JzU29U?=
 =?utf-8?B?dzBtMFNrRFRmZFhDbDRQVnlzcFJZYVBHT29XZFp2amFQSHF1UTFmNENDYlBO?=
 =?utf-8?B?aTZBZXRsd05qeHNHK2tvakNGOHkxZ3BMT3hPNVBXS3lKK1ZDdlh5TW53bTZv?=
 =?utf-8?B?S3o2THpkOXoydW0zTmFCdDFaY2M4Y2R4L3hxR2d6TytLaUh2WlJHeVFSaEpa?=
 =?utf-8?B?OXJlYnUzdjVsS0kvQm1PK3oxeHk2ZUcwWEl5dEdmcVBZYkgrQldkRFRYNFJa?=
 =?utf-8?B?RWVBWEViK0JZY1lXMDMxVkQ2VllHdDR0YXZXN0h6MmdoR0Rzc2txYklGL1FP?=
 =?utf-8?B?RXhmTzkra0NFZTZQVWFOS0s1V3NBRW1aK0tQTFRiM05OY29wU2p4U1hBT1oy?=
 =?utf-8?B?YW8rNzNmVHpPUC9ESm8rK1ZXVUxlZ0UzVjFnbEUrSVliMTgyeTRuYzBaZ2o1?=
 =?utf-8?B?RjBVOFVWT1NIeXZmY0VxWHFUbTZhSENpNEE0VVMrSE5ZY1pDOC9SUlhEZ1M5?=
 =?utf-8?B?cWhvRUhhODlCN0hFak9teGZBaGZQMzZLNG1nMFFieS9hcFhMWHl5Vmd2KzFV?=
 =?utf-8?B?TjNlbi83N21ldVhVYndUalJMME9ZK2g5VUJKbTZYdElRTkpLZzAyTjUrR0wy?=
 =?utf-8?B?OWRsNzhQWDBoRjFnaE5OVGJlRnRQUGo4Q25LRHRWUEZBcHI4MWl5TjFPUlZL?=
 =?utf-8?B?ckh0YnRFY1pqT2VqR3lNN09tdVJ1VGkwWG44RERQT3RpcE5wa21HRUFlQkIz?=
 =?utf-8?B?S2xMMWx3ang3eWhGaWN0Z3V6a2hSYWlSVFhDV3c0WTRNQTBmZkdxdVl6Uzhk?=
 =?utf-8?B?cHNLYzhpcXpnMlNrQVh4UnlyYk5SVXpIOWE0QUE0UXY1L0YzK1ovcDhwSzMr?=
 =?utf-8?B?NExGWWs4N1lyUUpFeHBLTllpQy9heTFscTJ1cjBvUXBOOGFQYW5QeVQvQkFZ?=
 =?utf-8?B?QmlEWjhsVGkwWnd6cDRZcnRTSlkva28vRVhKMGRDR1BLczU0SDltMkhCQTEr?=
 =?utf-8?B?NHhVREpBK1d2SXh1bExCeVpuNzV6M0w1NWE4T2txTDJDTjF3bTZGVUdBYW1y?=
 =?utf-8?B?cXdPR3pkREFIbllXaTlLcWFrY3BVRWhiNjQrUUV2b1BTY2poWkwvV0xqVHdq?=
 =?utf-8?B?Ty9hL3FuMGttSzdPZWIxTGdWUjVYbmpaZ3dVUjdTQ2Z2SW9YUzJoWW9xK1Qx?=
 =?utf-8?Q?NjTVtFv/7gjreYYgMdnzr91c9DsQinaMDgDD8kk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ccd42c-c63a-4e24-fc0a-08d932434541
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:24:35.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3rNQySP6QSTXCpJmTPzc0dzqZu5zBXLm+e5uUn0/b3HVVG6SnMAz3g7lCuAoZzCNpiYa5Rkrc1rqUp8nN57ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

Some hypercalls, memory-op in particular, can return values requiring
more than 31 bits to represent. Hence the underlying layers need to make
sure they won't truncate such values.

While adding the new function to the map file, I noticed the stray
xencall6 there. I'm taking the liberty to remove it at this occasion. If
such a function would ever appear, it shouldn't lane in version 1.0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't sure whether euqivalents for the other xencall<N>() should also
be introduced, and hence went for the minimal solution first. Otoh there
is also xencall0() which has no users ...

--- a/tools/include/xencall.h
+++ b/tools/include/xencall.h
@@ -113,6 +113,10 @@ int xencall5(xencall_handle *xcall, unsi
              uint64_t arg1, uint64_t arg2, uint64_t arg3,
              uint64_t arg4, uint64_t arg5);
 
+/* Variant(s) of the above, as needed, returning "long" instead of "int". */
+long xencall2L(xencall_handle *xcall, unsigned int op,
+               uint64_t arg1, uint64_t arg2);
+
 /*
  * Allocate and free memory which is suitable for use as a pointer
  * argument to a hypercall.
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -127,6 +127,17 @@ int xencall2(xencall_handle *xcall, unsi
     return osdep_hypercall(xcall, &call);
 }
 
+long xencall2L(xencall_handle *xcall, unsigned int op,
+               uint64_t arg1, uint64_t arg2)
+{
+    privcmd_hypercall_t call = {
+        .op = op,
+        .arg = { arg1, arg2 },
+    };
+
+    return osdep_hypercall(xcall, &call);
+}
+
 int xencall3(xencall_handle *xcall, unsigned int op,
              uint64_t arg1, uint64_t arg2, uint64_t arg3)
 {
--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -9,7 +9,6 @@ VERS_1.0 {
 		xencall3;
 		xencall4;
 		xencall5;
-		xencall6;
 
 		xencall_alloc_buffer;
 		xencall_free_buffer;
@@ -27,3 +26,8 @@ VERS_1.2 {
 	global:
 		xencall_fd;
 } VERS_1.1;
+
+VERS_1.3 {
+	global:
+		xencall2L;
+} VERS_1.2;


