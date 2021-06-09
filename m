Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199D3A102A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 12:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139174.257423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvY2-0005Cy-Sk; Wed, 09 Jun 2021 10:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139174.257423; Wed, 09 Jun 2021 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvY2-0005A6-Ox; Wed, 09 Jun 2021 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 139174;
 Wed, 09 Jun 2021 10:34:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqvY1-00059y-KZ
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 10:34:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6bc1069-6ebd-4b19-903d-eb1d4d06bae5;
 Wed, 09 Jun 2021 10:34:56 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-1rLL0AnpNAy-Pp0hDhr6YQ-1; Wed, 09 Jun 2021 12:34:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 10:34:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 10:34:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0088.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 10:34:51 +0000
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
X-Inumbo-ID: d6bc1069-6ebd-4b19-903d-eb1d4d06bae5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623234895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uis2epUXIm/AFKHpwnFZcYA2it1l1skFRqJ73nbBLAA=;
	b=TPyVcdzZNdFJmJZl5vWXkpl4hpmSDGNFLeNTDhrbbFlr+MPvEyMyRGeOtwty3pyqxDzTGF
	LjWGrbqDjbBykSeH3hZ44ZPuJzWQK93NeiEPYmHL3WsWVu0k4SXwYtDDpotHL1H2rUkru9
	FtL+Thf04TapH5WN2i8XbH5TAgSARrs=
X-MC-Unique: 1rLL0AnpNAy-Pp0hDhr6YQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoeTU+JVn71uEqICoNBF7KkUeESjwZgJMAjmXNiUf7s9I/BJ0Utlb8Gjf6aUE12XBbfJcywQjZRzt5OwZRx/i79MGA+pmHuYmFSSk0t91Pg0XU1Y/5YF9tPvLnac7hQKMEztOJtYVo2QvPKrRfV57R9AISHZI/cbnue0LLR316C05tyvDyBzg0y12S+AmuKWXBgZyPHQ9jAXJUw6FdsXtMhF88X+BF0//JodVKz/ZmwarkQZRYeFZ8zgj9SdIs8RNpHTHUM+PT6j3b1IlopOpPTchI7KxEKZeDx3DIIb1pIKpH3Wwpw00amRoNZFT/Hz5A2K1gxIX5V0UPLseQzg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uis2epUXIm/AFKHpwnFZcYA2it1l1skFRqJ73nbBLAA=;
 b=Q3lJSm0Oyq/s5q8kEib8aiS8Nye9MsIMQiCk3RQBrKZPqX6wdv3/tXmcJI38fNMeLMxMYMgUqU1r8vy6dqf/ch/IKn6gsjUYjSUJogTSgz+b7RP5VoZgY1yh1qMPfkz9gDl3aIp72TvFr4Xm33Wx/NKHEmjlL5dFd7CXDZ3pem3TWqhi7ZUexmJoPhCKa9OyJoTWQ/NS02OPZi0JnjuwHCt0+fLli04g3Zx2sDT2zV5PwNTlzxRFTGz8QOX+1AlCf9RD44joDdRBQk3ppV18H2jZ0vqxI1eL5VfJ/X1cL8tij7eDzLTpw5raAz8zrJk+1TwtCPMVzoAezMgPqXbkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: mark hypercall argument regs clobbering for intended
 fall-through
Message-ID: <bdbd506a-e6fc-a560-1be7-7424f33d413e@suse.com>
Date: Wed, 9 Jun 2021 12:34:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44707495-6933-4989-90e1-08d92b323706
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5902EF31AAF8E45ACDF94EF2B3369@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yvcWwc36LV1MicJAiPtamIt4xPV9Akaf12MVAz5tfd1N9nsqXyUBvPJmN15Zkw4DDsYyr5gWJX2luiQc/E0F8HsNxfN6gRoNISqF5S7Ie8hj2eBEJDOSMh0X4JQaEXhJGuSJnkP25wI9wGqHfwUJron/vdGoi8PkbNdiokPV3IAqLl+UqlPHGtxUuiNdDRyjpAioDuKaYxcVxtni9EdouVWBoSkHjNqt5TdekeUyatrdNvPO8DwNbxbtC5AguV7p9brTyLwW9mfuGrAaMwQVz8w4SKjS0CGsG5UeGp2qduc2NdGB5y2FOmDGxbG7UJIHg3KrPkW+HHVkIs92i1UStn/TaaCxvyxRFAkBDjvm122Otfb4GxRB5TYnpGPXvhp3gu0NRZjxvoMTJDlrqNw6r6FJXpYySsltOefIVGgMfjSPtlFraSHSw8WzlHt9Z6KA9nXAo2rQs1GZ3OumkCxI9HXszTO2lqcin1iSIvQSEGUOu7Tr5+ebk28CoT6OTuZSZRz6mL1YF0uQGC+Dhj3hS672ZifjRC1wuMMgbFdaO/vmBk/qYjo47FhnrNu00zMptkf96VIaJCrh6qBtT3ACqjFtOOvfjeMYOmk0ACAKbmA9/+3TRMW9A6m9R8axFfI4/NHD7uVpw9rJ3cUEXS55YkNcI5iTas9lTLvBOfqn3PUvRBU1tY6LaxGydRknVDnk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(26005)(8936002)(5660300002)(36756003)(66556008)(4326008)(186003)(6916009)(66476007)(16526019)(498600001)(54906003)(31686004)(66946007)(6486002)(8676002)(16576012)(31696002)(2906002)(956004)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?a1lmQWg2Y24yR2F5ejloOTZVRFFBb3R1NVQxVVEvcTB5bzkwWFJOY1RSRUVa?=
 =?utf-8?B?K0xVRTU5UnhzL2lKTVZlbjNHQXdQUlBMVE9ycUhoNlJ3R2Jhajh3S3BvT3l6?=
 =?utf-8?B?dThDRGhoR0YrT0JYd25uQWMxaHdWYmpJN0ZEYmFGOFFjYVNLY2Foall0UFh4?=
 =?utf-8?B?WUMra2dJbXJyWm1iS1d6eWlIRERXUDNFMWZMdVJQRUlSckMzUzN3RmJsd0lV?=
 =?utf-8?B?V2FzMittMEo0anU3RVBXZkRTQ0U1RHlhVktNdFJ4dGdUZ2Y0eDE1SkYveDZx?=
 =?utf-8?B?em1JL0hFRGVPS2gvQWlqa2Q1Q2d5VURna1JIMXV0YVJkRXNxNFRlK1poL0kx?=
 =?utf-8?B?M3FKbVFyQVlENWkzL0Q5UnB4eXo3R1ZzZlpRc1ZnNmlqdVByVlErRklMV3lM?=
 =?utf-8?B?blRmTm5nT1dnaklGakdOeHBWcldtWDJOM0RiL0xNU1o4WWhHNEdaNUpIYUdy?=
 =?utf-8?B?L1MzdUlCN2Frb0ZZVHpOODJuNjFNSEYrTzZWMjBJQTI3OGt5YmhTNUJzYUNY?=
 =?utf-8?B?cTMxRjZPdGNNSU9pS3VqSW5QUEJRcW9ZbmFCMGF5eDlGMW5hbEhCaHMwUHFn?=
 =?utf-8?B?MjBEd3FQU1E5c2JwbG44UWVINGxRd2NSOWRlRzlvbGFEcDA3eHpwL2pBYytY?=
 =?utf-8?B?aXZ1cll0aStDTm5jOVRPdlcxb3RyajcwVmpnaGhkLzgwSkRnTVJXY1pLSmdN?=
 =?utf-8?B?cXZlMUZOVlJVZUZnU1Z4RlJMdzQxbk9jOHY3MXU4QnlHZjlvTU16UElNTkRU?=
 =?utf-8?B?U0ZBNWR4RmIxaFVDcGpYUnB1WDdsWjRENWwyWEphME50T2hXZUh2SS92bFlv?=
 =?utf-8?B?RnJ4N3Q5SUJoZTYxMlVKY0h1eFJ3UTZWZEhWZFNQWTEvUjVzaGVUdWVQK0JT?=
 =?utf-8?B?R1ZsT0lINHlDcG1CRHB6V09FVURLbjBSdHlBUzU0bmJrTUJGZDRTYlNDTXNh?=
 =?utf-8?B?VFl5OFY1cHREd0drWHdrQmlreE5WdUNuVmE2bE41aXhNdUlsMVZZM0IwOVkx?=
 =?utf-8?B?RlVuRmc2RzllOTg5ZldrNHdwNC9PMzZDSktJMEZDai9nMGZMTkNUclZ5ZmJY?=
 =?utf-8?B?VDQ3aHh0Mi9wMVFyMmdxcVA5YjhtMFJkTG1wRnliamhWT0lGcHErQUdjK0dR?=
 =?utf-8?B?eXlhaHBBYXNFSFptamVLcHhDSVJuekgwNlRFY1gxWjZKVFZuYXZOd2NqYVdU?=
 =?utf-8?B?cjA2TGlZVFF0Tm9FWURsZE5kWWlpVzV2ZmxHbGFybUpXdEt2TkNKQ2ttNi90?=
 =?utf-8?B?ZExETGdVQWprZzh6d3VxVUExaExHNnJZR1I4dGs1ZlVOejlwTnZLcFlObyto?=
 =?utf-8?B?cXVRVlJxNkZDKysvMEV1N0E1elprU0FFMytoYXQzUUVuWmFvYi9SU3djUFNt?=
 =?utf-8?B?T3ZPQnIrbE9ERk1MWDFmTWhmSExlSGFDaER1cHo2bUIrQ01mbFdJb3ZSckIw?=
 =?utf-8?B?a1k3aVB0dVRSN0J6RW1PYVd0STJ3UDVXVjloWUYzeDl2bWo5L1NuSVQrblpN?=
 =?utf-8?B?NHd3L3NBQUcwcjViQU5vK3VnakE0d1lIYmxzSHZaQngzVlB3dzdqaExDckVN?=
 =?utf-8?B?OTFwMGhNUDRnQlYyN3RPbjFPaU0rZ1hOeW5FQmRHM0hOTzFuZEhZMGZtN2N4?=
 =?utf-8?B?eXhnVDh4a1QzanRZYWlxenZlNE9MS3FnSnhWQTlYN3UxUXFKK0E4a1hIWkZD?=
 =?utf-8?B?S3N1eXJJTk5Vd2w1MThyakt1VGw2M1lvcjZJWGQ0RmszY1habXFGcEtZcDB5?=
 =?utf-8?Q?mNKyeaOqubnQJnUFZVmdq9sTgbmix4C/XbSpwxb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44707495-6933-4989-90e1-08d92b323706
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:34:52.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zD8lLBpLF/5OFL/jq9BTdIkzJ6WtqyGc1HxkRQ47KLWrJ3JYh5yj/TZlTaPBOxXSAkJ4wfTDqG6I+pZvBr1Xqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

The CIDs below are all for the PV side of things, but also take care of
the HVM side.

Coverity-ID: 1485896, 1485901, 1485906, 1485910, 1485911, 
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Let's see whether Coverity actually understands the (relatively) new
pseudo-keyword.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -246,11 +246,11 @@ int hvm_hypercall(struct cpu_user_regs *
         /* Deliberately corrupt parameter regs not used by this hypercall. */
         switch ( hypercall_args_table[eax].native )
         {
-        case 0: rdi = 0xdeadbeefdeadf00dUL;
-        case 1: rsi = 0xdeadbeefdeadf00dUL;
-        case 2: rdx = 0xdeadbeefdeadf00dUL;
-        case 3: r10 = 0xdeadbeefdeadf00dUL;
-        case 4: r8 = 0xdeadbeefdeadf00dUL;
+        case 0: rdi = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 4: r8 = 0xdeadbeefdeadf00dUL; fallthrough;
         case 5: r9 = 0xdeadbeefdeadf00dUL;
         }
 #endif
@@ -264,11 +264,11 @@ int hvm_hypercall(struct cpu_user_regs *
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].native )
             {
-            case 6: regs->r9  = 0xdeadbeefdeadf00dUL;
-            case 5: regs->r8  = 0xdeadbeefdeadf00dUL;
-            case 4: regs->r10 = 0xdeadbeefdeadf00dUL;
-            case 3: regs->rdx = 0xdeadbeefdeadf00dUL;
-            case 2: regs->rsi = 0xdeadbeefdeadf00dUL;
+            case 6: regs->r9  = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
             case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
             }
         }
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -149,11 +149,11 @@ void pv_hypercall(struct cpu_user_regs *
         /* Deliberately corrupt parameter regs not used by this hypercall. */
         switch ( hypercall_args_table[eax].native )
         {
-        case 0: rdi = 0xdeadbeefdeadf00dUL;
-        case 1: rsi = 0xdeadbeefdeadf00dUL;
-        case 2: rdx = 0xdeadbeefdeadf00dUL;
-        case 3: r10 = 0xdeadbeefdeadf00dUL;
-        case 4: r8 = 0xdeadbeefdeadf00dUL;
+        case 0: rdi = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
+        case 4: r8 = 0xdeadbeefdeadf00dUL; fallthrough;
         case 5: r9 = 0xdeadbeefdeadf00dUL;
         }
 #endif
@@ -172,11 +172,11 @@ void pv_hypercall(struct cpu_user_regs *
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].native )
             {
-            case 6: regs->r9  = 0xdeadbeefdeadf00dUL;
-            case 5: regs->r8  = 0xdeadbeefdeadf00dUL;
-            case 4: regs->r10 = 0xdeadbeefdeadf00dUL;
-            case 3: regs->rdx = 0xdeadbeefdeadf00dUL;
-            case 2: regs->rsi = 0xdeadbeefdeadf00dUL;
+            case 6: regs->r9  = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
+            case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
             case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
             }
         }


