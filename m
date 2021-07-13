Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730873C6BE6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 10:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155099.286441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3DTO-0006P0-Fd; Tue, 13 Jul 2021 08:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155099.286441; Tue, 13 Jul 2021 08:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3DTO-0006Mr-CF; Tue, 13 Jul 2021 08:08:58 +0000
Received: by outflank-mailman (input) for mailman id 155099;
 Tue, 13 Jul 2021 08:08:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3DTM-0006Ml-Fg
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 08:08:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de1e2a39-f357-43af-9572-dd69dc960230;
 Tue, 13 Jul 2021 08:08:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-42D3VLmhPLyLmD_pbqe3yA-1; Tue, 13 Jul 2021 10:08:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 08:08:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 08:08:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0050.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 08:08:51 +0000
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
X-Inumbo-ID: de1e2a39-f357-43af-9572-dd69dc960230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626163734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Es8rIQ/70i6W1mPzYIj7OBzyjIGpeUVo6ozIzqQPwkk=;
	b=c0OQrVLOSvIrWFEsMH4xQ5lii9Jz/ShWP1v5iQb1Txg8c4//SloZvP3MX+MeSdGKU8hOAP
	lTQdZvWA2akUQF8QYth6M251k0K4tPEgwocTLMAvyifr6Oa1AAs1YLdPaBuCNzEUjm1iVp
	kuRL0BafG/NbQh+RqJu7y+kioEb5dyc=
X-MC-Unique: 42D3VLmhPLyLmD_pbqe3yA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJqk1CVhV8XKfdoYZf+a29FHlxNJfBAZCVQIabn2N0zDx63+5D1npoEau9Q/Rx8ZAkZFl9gx5kwjVW76A0oIlnehFxvDVioQAw8gZtdHpNr2/L3vTNylDK26L019O5iqfFmKsdZrGbvDxdLWmVFDcfB9Fwi4F0gA+8C+2cVmnUa9m6R89Rtn2uWSQ9sIp14JEwsLpBmQ9wgxCUIRgXCQ6TeJeaB9kxnjO7W0Fc/V1bbBCMvUBmtIqJKwUXMMC7oX8IBUtf59cyxSI1UwJgUpmU6DUYMr0nkyLlKaMG5jIkHizXzUMQ8W5TK2xlzHDBP2rCdGF+VwRPwcYnf56qI4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es8rIQ/70i6W1mPzYIj7OBzyjIGpeUVo6ozIzqQPwkk=;
 b=H+GiKoRkU9YTVsDprTFHFub9qJ0/64GJMzpMWslHHbyhFtP43aHDdePzDVQRtyn+UECwWufikVAgxiWpDo9MpRBqmXZU3pBUnXFhSda8q4A0LdcmPZE7/yMMZG/9s9tQBGLd85fCU3D5lEgoVDGndgrost2xI/rzCef3FwcwiaIzSvUuiksfx75YHTiIlfyyIaDqGqAY/4CJIkmOVzbgZjG3ebzb8239fdYbILBQaC1gPeVRS17wftnzXZUTjz9Ovt9mPuQA0nAomtZIAV04eju7BUvVF1l9mi4zdlehGVbyvF9qKtRvSpaT9dqvJuTyfjPzL8yrAXJ0Cg5wPpokGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: mark compat hypercall regs clobbering for intended
 fall-through
Message-ID: <5cc873c5-fb76-52b3-5af6-0a5f4987f2d9@suse.com>
Date: Tue, 13 Jul 2021 10:08:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0050.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd41d1f-8d5f-4ea3-d4ed-08d945d57368
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484665BAE604BBC2AE4DB734B3149@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NpszVFiVqkyjaY/rLetJNIf9BR5wTKin0gebIFY4UrWkpyPNzYxi9GLr1wsKjodV0Ati1sUiyn6hP2iHoTQO+RuRXQndie3kkQGIsb5gFvJzULY7Qxda5Uo/bfwUYS5HWyuQ1IKgwEZcR8NClEBieNJslLbaQOqrFbLQGoyY6UaNs5e3buqQTYZWVHxgrTVVp827LgCYYjPBVwXj0XgUoj0/DIyAw3nTtS2ekpbceATxol3OGEiB6L6CvlLdHxm/RvXem6K4+Ko5ZMR7UFK6ZS60hYdjAwIC/hwWTEUdC5YA+eSKcJkciejAphI2jAkaN0/YM00ZO6guw7lpaS0TwP+SeDT6xa1RCsz0ar+bcHQs+7Xl2gob7tFuZTFsZrJgTD9j02oZFFWmmdxYy4vyTx3yAeqCIpguty2Mwyyf6mJ8iU0G0Sk/vDxCm9mcmvrB8/KZE6JMv2593ed3NfhF/s2c9VJrGGembfJvIAJ5T/9mcHJJHQnHuu5IDRLZAZLtAkYnyAAfOWlYvxb8bGKyYfUHGNQPhmJiAmfrU6hA66kVnn300csYGks/4AqS98VRWnj0mfcm1JYDpqi7gvbGQFxm6KXiW3cItGtbqDKKBlbpfQ0JnJPOHwE52hUzRJiUNLRPB78cH4EFUu1tooyq16Mz10eiSEOMsECzsbe7JVU5VEIn5sRKnnJSWLAxPc7o3Oepii9eTSgVfsVZwRXuk1+JmtYD5yYobnW831p9lgw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(376002)(136003)(346002)(39850400004)(5660300002)(478600001)(31696002)(36756003)(86362001)(4326008)(26005)(6486002)(8936002)(54906003)(316002)(16576012)(6916009)(8676002)(38100700002)(186003)(2906002)(31686004)(956004)(2616005)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHZBOUMwT2tlSi8vRUxsd0gweXk2T3RYd1RLcC8xeG1YUlUxOTRFUFNMcmRB?=
 =?utf-8?B?R0EydE9PbmY2Z2Y0MHB1ZTRIU2c0T0pFUGJjQS9qSXhDSk5KVitnZjREeVlD?=
 =?utf-8?B?V1V6SE5UaDFzTUNhRStCOGE5Z3o2Um5IUzZrZDVjTTl6dWYweGZhVUhVOXBm?=
 =?utf-8?B?Tjh1K2YzdEt3TXR2dWJXSW4wYXhmR0Jid2UvVElQSGFackYrMlNacjRINEhM?=
 =?utf-8?B?UDlIWjlEa29xQzE1M2hhMlJqVmRuNHVCZXBWMUw4dy9xTXRRb0wzOHJNUVU0?=
 =?utf-8?B?T2pxeGVUZEZTYUY4TVJURzMwK3NLTjF2UzQ4UDRVc3NsbHM1VUs1WXdUbWV0?=
 =?utf-8?B?YWtKdklIcjJlQ3NpVEJvR25ZTzBnNGFYdzk1OVRwbm1FNXFyZFBxSU9wK1BB?=
 =?utf-8?B?WEF3cFE4eVFKeFFrdy9qeTlFNGs1eURGNDJlNnQ5RU1OaGVuYTQrVzNZdGcy?=
 =?utf-8?B?S3BhbU1zR2xNaEpkeW92SlBBdW4vRXhJNS9DWndHTCtPdEw5NlNNelp4Rzlw?=
 =?utf-8?B?V0ZoVjJQSHJTWEp0NGdQMG5PanlkaUNkYmpMRXpqSGpLaGdIcjN4dmQ3Z2RI?=
 =?utf-8?B?RWorUVRBdnlhUWlUOHZYbUVrQXZ1a2tyWks4eG5FVzlKQ1p6dkVEODlTUnR5?=
 =?utf-8?B?djRxRUp5S1lScVpVSUExQTVMeDFUeTErMUhEZitRTGdvZGR6NFhjNEUzOWlB?=
 =?utf-8?B?S29sbG1qTDcwMlRidzI5YlR0UC9IR3J0a1I1N1kwMkE0TUxiOVdpcUN5Zmd1?=
 =?utf-8?B?Q3UrUWM2WVYzNmhOZGhWSG5rSkxHQXhBTngrd1RHMktQUm41N3RRdkpnRi9r?=
 =?utf-8?B?cytoWnY1aEtOaVd4OWJDUHVGOVQ2Qk1UTDJSZUZhcjdkVHhJNm84TlNkN3lo?=
 =?utf-8?B?TXB0RU42dTZHL1FRUkdZenJseWkwenFrUlk4U0pKZDFJbDFSTWZ5OVRPaitQ?=
 =?utf-8?B?UlU5QkpyNTgrMkFLeEVXVnlVOU5QQjRWd3AxWU1jQ3IyaHMxeEkyRnQ2a1Jh?=
 =?utf-8?B?d2lITjZCbE0xWGNhRGF1ZFI5L1dCRUdadm1abzRuYUYyWU52bEFKRm5ucFA4?=
 =?utf-8?B?dnJ0bWFEK3Z2YzFkRzhHNHU0WDF4U2YyaWZLZC9aOVhlZ0xUQnNpb1F2M1Vv?=
 =?utf-8?B?WC9QUjI1V2Z2MFJ6VzZMTXNHVlIwbkFYeDR6c2NTQWdpcmFyT2ZxVjdQcGky?=
 =?utf-8?B?NDJjR2l0RkpPZUxxdm0xYkdyeGFmN0tWTytWK0FXQTY0b2ZRK2h1eWNMNzI4?=
 =?utf-8?B?NlBqRWJjcGRMV3lDTFBwM09WbEdhNVZKTHNIN3htRGlrNkNCYm82a3dsQy9Z?=
 =?utf-8?B?bmh5ekpwMmpKSlExdUdWc1ZSamFuc2ZVeUg0WktGUUJla2loTmtIUWUvbElu?=
 =?utf-8?B?NW9aN09PR0grdXJOL2ZaaDlha25ZUE1VVHlGVkNCcWs1NTZGc3oxNkt3dGlN?=
 =?utf-8?B?VFN4WS92L2o3MjduaXRjVGxkSk1CRG9LRVBCeDUrZE8zVThveG1RWlZSOGpD?=
 =?utf-8?B?UkpBSWJSdjVBMTJBdzY5TzRXekhkTnVkcmtsalRyRFFPNm5iN3JabjE4cWgx?=
 =?utf-8?B?UnpRWTFvSkVubDd0TmQxWGs0OFpHUHIzVCtPT0FSU1R6aDJwSlNpdGIxUFJ6?=
 =?utf-8?B?OG5rUURuUDFzUk5wWUx2dkNaYlIyMXRKNkFJaFZZejNKQjJYa1hHV0N3WXdS?=
 =?utf-8?B?SStFcHN1YUh5SDk3bkVScWZZUjZzdDVpVlovdFg3d3BFRmdyZk5BOEdKMGZj?=
 =?utf-8?Q?3c7aM7Q5Fa0xEYrRhN8KEWoSmPvX9LBxWNxCWvT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd41d1f-8d5f-4ea3-d4ed-08d945d57368
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 08:08:51.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNRIeSFPtGnfMa+U2VubvESyAuwuhFTQcPi0KZQqbRrUVwkiLRw4oZuAkQvDWRqwpwYw5ai+pnjI09YAVuaorw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

Oddly enough in the original report Coverity only complained about the
native hypercall related switch() statements. Now that it has seen those
fixed, it complains about (only HVM) compat ones. Hence the CIDs below
are all for the HVM side of things, yet while at it take care of the PV
side as well.

Coverity-ID: 1487105, 1487106, 1487107, 1487108, 1487109.
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that I really have trouble spotting a pattern in what
Coverity spots or does not spot.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -292,11 +292,11 @@ int hvm_hypercall(struct cpu_user_regs *
         /* Deliberately corrupt parameter regs not used by this hypercall. */
         switch ( hypercall_args_table[eax].compat )
         {
-        case 0: ebx = 0xdeadf00d;
-        case 1: ecx = 0xdeadf00d;
-        case 2: edx = 0xdeadf00d;
-        case 3: esi = 0xdeadf00d;
-        case 4: edi = 0xdeadf00d;
+        case 0: ebx = 0xdeadf00d; fallthrough;
+        case 1: ecx = 0xdeadf00d; fallthrough;
+        case 2: edx = 0xdeadf00d; fallthrough;
+        case 3: esi = 0xdeadf00d; fallthrough;
+        case 4: edi = 0xdeadf00d; fallthrough;
         case 5: ebp = 0xdeadf00d;
         }
 #endif
@@ -312,11 +312,11 @@ int hvm_hypercall(struct cpu_user_regs *
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].compat )
             {
-            case 6: regs->rbp = 0xdeadf00d;
-            case 5: regs->rdi = 0xdeadf00d;
-            case 4: regs->rsi = 0xdeadf00d;
-            case 3: regs->rdx = 0xdeadf00d;
-            case 2: regs->rcx = 0xdeadf00d;
+            case 6: regs->rbp = 0xdeadf00d; fallthrough;
+            case 5: regs->rdi = 0xdeadf00d; fallthrough;
+            case 4: regs->rsi = 0xdeadf00d; fallthrough;
+            case 3: regs->rdx = 0xdeadf00d; fallthrough;
+            case 2: regs->rcx = 0xdeadf00d; fallthrough;
             case 1: regs->rbx = 0xdeadf00d;
             }
         }
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -197,11 +197,11 @@ void pv_hypercall(struct cpu_user_regs *
         /* Deliberately corrupt parameter regs not used by this hypercall. */
         switch ( hypercall_args_table[eax].compat )
         {
-        case 0: ebx = 0xdeadf00d;
-        case 1: ecx = 0xdeadf00d;
-        case 2: edx = 0xdeadf00d;
-        case 3: esi = 0xdeadf00d;
-        case 4: edi = 0xdeadf00d;
+        case 0: ebx = 0xdeadf00d; fallthrough;
+        case 1: ecx = 0xdeadf00d; fallthrough;
+        case 2: edx = 0xdeadf00d; fallthrough;
+        case 3: esi = 0xdeadf00d; fallthrough;
+        case 4: edi = 0xdeadf00d; fallthrough;
         case 5: ebp = 0xdeadf00d;
         }
 #endif
@@ -223,11 +223,11 @@ void pv_hypercall(struct cpu_user_regs *
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].compat )
             {
-            case 6: regs->ebp = 0xdeadf00d;
-            case 5: regs->edi = 0xdeadf00d;
-            case 4: regs->esi = 0xdeadf00d;
-            case 3: regs->edx = 0xdeadf00d;
-            case 2: regs->ecx = 0xdeadf00d;
+            case 6: regs->ebp = 0xdeadf00d; fallthrough;
+            case 5: regs->edi = 0xdeadf00d; fallthrough;
+            case 4: regs->esi = 0xdeadf00d; fallthrough;
+            case 3: regs->edx = 0xdeadf00d; fallthrough;
+            case 2: regs->ecx = 0xdeadf00d; fallthrough;
             case 1: regs->ebx = 0xdeadf00d;
             }
         }


