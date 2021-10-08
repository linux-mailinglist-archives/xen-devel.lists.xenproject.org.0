Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3053426841
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 12:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204639.359807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYnPq-0003Cw-Pq; Fri, 08 Oct 2021 10:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204639.359807; Fri, 08 Oct 2021 10:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYnPq-0003Ag-Mj; Fri, 08 Oct 2021 10:47:50 +0000
Received: by outflank-mailman (input) for mailman id 204639;
 Fri, 08 Oct 2021 10:47:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYnPo-0003Aa-VF
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 10:47:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41a1fc1f-246f-4a3b-be44-cfe745078ab3;
 Fri, 08 Oct 2021 10:47:48 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-ugdX56OXNgSe4B5hJIwZJg-1; Fri, 08 Oct 2021 12:47:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 10:47:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 10:47:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Fri, 8 Oct 2021 10:47:44 +0000
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
X-Inumbo-ID: 41a1fc1f-246f-4a3b-be44-cfe745078ab3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633690067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9s2IautVYl4D5pfVLFGkSQ1cWlKhosK88UYdKSUX130=;
	b=EdHN/uMcQV1ikcEEu9DQRokxadvU6Bgtpe0YAtWhHUxn2c78mT4358cz9BGtHOAdRo/zdK
	Fo+gHwb+JZMEHT+bhjLdLw0Q4d7BGEWIZP7W/1C3py2zDi6I2qgEjGec+YKHPnbSWhu0tc
	m1pdtXny0XQobWsyss6/K4TFWSTzJYc=
X-MC-Unique: ugdX56OXNgSe4B5hJIwZJg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHgJNgdklqD9gAmLSAOWS7OfRmyb8oIA6zZBeYRRBmhIsun23f/5xuf3Ot8BkInAY47OJjddXRFiziyTlpP+yokls1Z8BJq0zSO+IZsmEmS2RdJv0OeETkQd9XA256+XBLHOHiF6RWxaBnZymH2zBZAlqbkpP3JjPQqeQ5r9ZdLbsl49QenysRIqTNRKY7cGA/C+2mWDuUmNFPn1d1Vfq8ErUc8Qk3eUhYa1FhIAFBKTpT9ZLpYPZ669JCtMjQjh49DpA+LLSWAqsPcpmpXAauKHbZkg5QipTOeK8py88CI2bIV6cl1KNR+TMPUWXOtpDkqs8S84WWEFEpB0Q6gL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s2IautVYl4D5pfVLFGkSQ1cWlKhosK88UYdKSUX130=;
 b=N3CxdDc13o5Ba7V8J48cIQq/EXaO8ZB/m7Y0pzorXwSkgkVmNvuATNEE4LPRHL2oHMYD0n8vWnc72lOS4QahlA7mwSowJOHy1iXYBDdkH8Bw1VEwEDgVv18sPtjvTd3xZQFI52hrzX+9qCAxvNVb/cCgg5DFsQ20fg32LZBOI4Ym5ek5waP5hq3G3jGKYx510pUx+ie6ex08gvejeuNFDh7kZOlipFp0tHzveAoVTmrdI8Q8OpAHjIXkiRcRAwWGxVzLO+M6WQm3thwzBURBJ7/EWOFar49ORhmkJRW3MWt/MEghjfQeOLgnanLTXS4OSJYg/S2Ry6dZrO5BT1s/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV32: fix physdev_op_compat handling
Message-ID: <e8d21433-2f4f-f662-dd45-1543da8f4caf@suse.com>
Date: Fri, 8 Oct 2021 12:47:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0203.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fce2384-6c95-44fc-daf3-08d98a490fbc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4189181759339B28DA7B6CA2B3B29@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b6eUIsqSevdIxG2gqHxMmMNr8IAtqyqwJnEOW3Eni9XsWsGj8iM2WdDm9lqpZsd5X/1L1eT0IaLglH2B+JhKvliRHvwtACkV0uXVbVeX5H3JBvzIFl/LU7q1eGAosCg4OyeIgRgU/P+1G7qRfCizy/8XTxsjH5cGVM7cjsDkep1QwF2Fj0iyN6zyklrIa/IjcTL82YL7sy1Ea/2npWb5ouour76l24OBpGL8cF5PQUU81v2i57JIaHbqurK4cCCeQ82kkyXzN+GTnDRu/hYq8ICJbR68axof3VeJYYBaxlYXWW1xQ2DIO+8QPFmZsKMfhgry2vvInMxBXr5fMDArlYGll4Q73OgJ1C9MmJ3LueUqMCb69SDDEdBaWcQCUT3+fBCcDA0u0Kv/dss2E3N3CYbvmYKV5E4glSkOQuOb8mKddQAouORzgMk2U/WeQ1qg0HGKwjeMfga4MIjY3eXdapigfdBQs3gHacJqQUiR40C/cmw+U4POAkBgx6d5rFTdBpvtUi+ZbG2sEmOA1q/fadjJJcU0xd23s0rsu5bD5dPZevGapVnA9UkoJ1eT6tUT0kkl+wUvEH/QUBzmcGkCHZ/rxSEFC5Ul7cSY5E0UjKnPxzSKqDzyaQSogPsUmHdKarZvc6uneM8Yc8/x7jpElG/Xn9QuBKoTIVdAU45ifByh3yOcJ/Hmo4R2Cp4ArR5D2z//s5fssm20mwEiz8hiwp4z6IAgy7+YrXE4euHuAe2JXW81RKNWHWwn7KfnkK/I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8936002)(66946007)(31686004)(54906003)(86362001)(8676002)(26005)(316002)(31696002)(5660300002)(6916009)(6666004)(38100700002)(956004)(16576012)(2616005)(6486002)(2906002)(4326008)(36756003)(66556008)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCtXdmtBRFBpOVN6YUlvdjJTc1I5ZTBkZXdnM21HcUUxTTczNTVtK2RCQVc3?=
 =?utf-8?B?UWNtWG13K3BoWnBGbFpPUnZXQkE1bDdKZFl1cmZxT2J5RStHd0FLK3k3N2FZ?=
 =?utf-8?B?bUJmTTdKcEVOQnhtUFU1WExvUWZKdStzbjljVVNOV2VSeXRnRlhsM0Q3bE9h?=
 =?utf-8?B?UWMxMjFqYy9XSzZoZjR0RmVrYnJhc09jU3IwZDR0RkNVSFkzT2Y0SFNxMElw?=
 =?utf-8?B?TTNzYjFFcllGZW5vd2JtOWJCeVAyTUh4RDkrSGkrRVlBek5QSmNhOUpWZ0Fp?=
 =?utf-8?B?YWVaT1NIcm4rYTlTLzR0QzhSQXo3WVJtS2phbUhRYVFpMWkrK0ZIMDVvS1l6?=
 =?utf-8?B?NUwvVGNUUS9yVlVWcm5UaS9DVzNOd0Jid0pvS0k2Y016YmlPTzZSVUVtV3dv?=
 =?utf-8?B?RGJpNUJFaEVwbHdFWmoraFhKS3M4S21LRTk0ZkhQZml1RkJCeGdlbVg0M1R0?=
 =?utf-8?B?SU9ZMEpXd1EvMk9YMDF5MDNNcmxjc3pVR29kZXNXQllrdFYzN2JXTXFuVUdN?=
 =?utf-8?B?SU9JR0pCYjlHb3ZZODhTRnRYL2NXdThLVGlRNFFYb1NqeHFDekJ5ai9ZbU5Y?=
 =?utf-8?B?QUgzOXgxMlFoSnRlNzZhUWxxVklod2dUb2VOYWhwZTNOYldIMUZjLzY2TXVo?=
 =?utf-8?B?UHZaRGFxL2dMYUlpQXRQampYZHJneFNMWmlnV2RGMzgrK0NHUDRpb0UvMUpF?=
 =?utf-8?B?UmFJemVqWHFySEJKUFk5eVN4b2tBSnN5Vm5lUm51TGQwUVZXVDhYdStSQjRr?=
 =?utf-8?B?ZU9hQ2cwTnBtMVczaU03MmUvMWxabmZOR2o2Y08xRDFuRDBidkdmMnFjbk1k?=
 =?utf-8?B?S0RMTDd4dlo4ZSt4YkcwRllmWDF5c3lDWXBjK3IzWkZ6WnhGYU9ZQXFlQWFD?=
 =?utf-8?B?dW5aZXJxNVFRdFJaVnNqcnhsVTNld0RteisyUTdNbVdzV0UwRk5FakR1Tngw?=
 =?utf-8?B?YUxod0N4eGJNMWpFNkxIU3dlQkRMSGs2MXZwUU9BOGRKY0F6VEk5ZDZIYVNq?=
 =?utf-8?B?QUs4MDhxeWd6SjBPb2tUalFrVUxaNUdFSHhMMmQwanlzZmRvNVhNaXgvSWpD?=
 =?utf-8?B?dHQ4YkhkemF2dUxWSTBXK1RLNE5FOUNTc3BNU1A3MzFhUFZXeUc2dEpHOXpl?=
 =?utf-8?B?Y3NkditIMVJJWkFjQ1VkYk5Ub1dONmlYMCtQWkdoTGVFWDYvNVhEcCtPQk9m?=
 =?utf-8?B?WTUwWnQ0WTdmZXZ0Zlpxcm1Gc2JLSjY1YXhQYU0vN0RBWWdPalBZQnBoQjRS?=
 =?utf-8?B?dUpBTmdLYnoyVXFWdXpkN1VHWlRkeTBrOE9BczNDSk9KWGNDU1JLVVlJMmhs?=
 =?utf-8?B?U1IvNUc4bTI2ejkrYzh5Nm1HSkI3SXFCV0VkYWdtcmJpeVhTcVZrQmEwR3BB?=
 =?utf-8?B?VzRzODFWVmkvTytPRDBHYVNuU1pYMkdEM0dOcFJBclc2dDFST1M0N2paaFZE?=
 =?utf-8?B?blhLSWk0bGVVekhxTnBrcEtaWml3djg2K0ZUQ2FoaGtXbm8yaHdYSjEvSS9u?=
 =?utf-8?B?cjRZYnVTTFhOMk1kY0Y1VmpsRS9kYVlOdnRDUzFnOXhDUHlYeVhDWm1LQmtt?=
 =?utf-8?B?TlFBSnBBRzgxdFAxQlF4TkRnMTJsMmFqWDZFQXpWM1l2UnVpbTZlOVkxR2M1?=
 =?utf-8?B?SzJzRkp3RjBlS0ZqQU81cWRMck8xSXpTd3BkUEkvVThvcmtCL21JTE1RYnl6?=
 =?utf-8?B?Z2ZQSlNXV2kvSVJLbm1IMXF0MkhxYW5qWnlIQ1BGUHF0SGRuMlFsVDVnOWVV?=
 =?utf-8?Q?2VLws5di60BN/ufYHzFcI04aeEGUf/oGnwlwgXb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fce2384-6c95-44fc-daf3-08d98a490fbc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 10:47:45.2075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8dsrn1vbJbqUjyaRuogihCRo8KFUM4nsdeNUZmIjjtgUf0SlThKygCI7oZAhmf0Nl068MOBlnf3FuEAHBfXBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

The conversion of the original code failed to recognize that the 32-bit
compat variant of this (sorry, two different meanings of "compat" here)
needs to continue to invoke the compat handler, not the native one.
Arrange for this and also remove the one #define that hasn't been
necessary anymore as of that change.

Affected functions (having existed prior to the introduction of the new
hypercall) are PHYSDEVOP_set_iobitmap and PHYSDEVOP_apic_{read,write}.
For all others the operand struct layout doesn't differ.

Fixes: 1252e2823117 ("x86/pv: Export pv_hypercall_table[] rather than working around it in several ways")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Additionally the XSA-344 fix causes guest register corruption afaict,
when EVTCHNOP_reset gets called through the compat function and needs a
continuation. While guests shouldn't invoke that function this way, I
think we would better have forced all pre-3.2-unavailable functions into
an error path, rather than forwarding them to the actual handler. I'm
not sure though how relevant we consider it to fix this (one way or
another).

--- a/xen/arch/x86/x86_64/compat.c
+++ b/xen/arch/x86/x86_64/compat.c
@@ -10,8 +10,8 @@ EMIT_FILE;
 
 #define physdev_op                    compat_physdev_op
 #define physdev_op_t                  physdev_op_compat_t
-#define do_physdev_op                 compat_physdev_op
 #define do_physdev_op_compat(x)       compat_physdev_op_compat(_##x)
+#define native                        compat
 
 #define COMPAT
 #define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)


