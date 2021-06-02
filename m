Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3836C398D42
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 16:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136058.252460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loS0f-0005vy-64; Wed, 02 Jun 2021 14:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136058.252460; Wed, 02 Jun 2021 14:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loS0f-0005tA-29; Wed, 02 Jun 2021 14:38:17 +0000
Received: by outflank-mailman (input) for mailman id 136058;
 Wed, 02 Jun 2021 14:38:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1loS0e-0005sy-1a
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 14:38:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71181ff6-5a02-4ecc-8ddb-64c302e781e0;
 Wed, 02 Jun 2021 14:38:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-fj4UwSf2Mm-DcYEsuE4KTw-1; Wed, 02 Jun 2021 16:38:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 14:38:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 14:38:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:102:b7::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.26 via Frontend Transport; Wed, 2 Jun 2021 14:38:09 +0000
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
X-Inumbo-ID: 71181ff6-5a02-4ecc-8ddb-64c302e781e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622644693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NwFfkvN5qesznExZCGsK7iQb4IOiNi91GWuoqxon3zs=;
	b=gT4qi+QA0NZDOeZoN/hT1L9GVEq7Oc5Q4kNQ49xKAeUszTKA8TZEkDS9HQye/GkkFBQ6CS
	qZ5mQS8Qeo+R3I1eFZg5q0MlD1fNwEQ8LQHTJr/FhiBsDLpDwRHjnT44o4ZDJj9hTSSx5x
	XIKI4ZSsn1nDhmX40FDOu1wxZP/U03k=
X-MC-Unique: fj4UwSf2Mm-DcYEsuE4KTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSDGrNyZP2yRCRNUCaB/sV11E3j2ANDj7pv529Lmn9WSEATdpDWrogMbScch3fCElReMwBpVlLK7wwGYhVrbVJKVem5tvE6ZgwpqBPCqAYra8S47GSW20l+xRwsa9cVjeagY5926ZOUwSAWbfil4uUO0f5WpoiCfGTZz540dIcyMNs/7563fznh9HtVPGzy8vPa5mIQ5LKBsBgwXsT00M4Qsb2XDKPyHyKRNfMOS6qN49dDuy92wIOExEnvEcXRMoIh4rxoCE7tRWMhtLDH53qbTvcK7oUjw7v3aae6ZikdNu7j/HEw+ZYyNfqHGpM5HJggyiPl2ztsM5WkRwfOOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwFfkvN5qesznExZCGsK7iQb4IOiNi91GWuoqxon3zs=;
 b=GXJr5kgLroSZ5wGR1x0wIfKMNnH7aod3+77Ot/CKHFi8YMcb+vHuW39l7xyC6JCwJl13B15rpQb3PZs+lYvV7d9N0lLXuisqcuTQY4uz+qBXhuvveJHbdZR+X3D/Yk9rI2fd750mPLFjKBtiHS3uBif3Kph6KUu/JAX/RKf67JIqU7sMT/dh45LpP6FH7QFX5qLlBcTLWuecQJ2KHDhhrK80P7uZO1gZnUOAGIZAqGfJP1+L53rei5Yq5st6zS8rRzFPVAv0/bUfZGOREn5Ypxj5cZGUDhVWEx0pYtWoSuWGV152pwlYu6zJIV0ctSG2zwuCIrG506caa5MBHqwZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: pad blob-execution "okay" messages
Message-ID: <3250a871-e49d-d3c4-333a-eff435e092c2@suse.com>
Date: Wed, 2 Jun 2021 16:38:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0027.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f1df024-eb5c-41e8-9f64-08d925d40b11
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB338977F05DADC47292EEDFC6B33D9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g8oKK5Rf4pWZGEwj763+nFvZqNie8ZY0Ad2iXG8xu4cjylSDa39yI73bDxOEGTDDFLk4g+hyvuz7rykhyxgHd3rzg7t8G0El3UcY74CH6U73ulGy1BJT1kSsJlTJkE7byHhs7Cdxhx1ruLouLByE1H7kMTO9jH09aWpUi//lmbFgHBH/jNqxwOuxaAYxo1oB5GtZ5o5EmU4IBpJqbGFiKyEgtXZtLHe6hE25TDsk+9BCISGG/qHiB2S1totUDrFbxcYM0mM/JNiZR3HbmAly/R5v5GSLzgbyB4vcfljrV1CXSjp2MprvupynlFd9CeKnkTVBajdnDtMwc6sgReFjOMwbg12f2KaoHGy5YqxIjbVdWky+Vmf1oFsQLfUPntiqhe7Nt/JRwHkp02LHt3+cwusOyN41/K55MfS1rk1kE53lqEJxTVlrXYEMYdN7jIFA0l9RM8SR59UZk+XruCPYLhipAL6OD6htA4yfDI/W+7CSU6t6T137nFJTEk1m+dtoevyY0DFE+sG7wf5qOTWmi24PbjXWiue1NaGwfW4FxtKGxbLLUVbX3nZG3C9bOnuW9zPWjsALBgJt/j5AOoNzE+cnUeKbriHrYRQ0T6AOcQoROCc7UEqAT6D/zPQEZQ11XR9MxB0kvML8Yl3t3Xkuj5FkIH6qABApLGRyN3Rtu4fpX9is0tPoi8/jiA1lkiA9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(366004)(346002)(39860400002)(4326008)(36756003)(5660300002)(16576012)(2906002)(54906003)(316002)(26005)(66556008)(83380400001)(66946007)(38100700002)(15650500001)(86362001)(2616005)(8676002)(956004)(31686004)(31696002)(186003)(16526019)(8936002)(478600001)(66476007)(6916009)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?enpkV1RJZ0N6L0VjV3lSUCtWYnNWWW9zc0drWGtqcjhUM05pMXM5VEN3azR2?=
 =?utf-8?B?ZGFTc3hKRElqTXRNQ3ZLcEwwTElFaUxWMXd2Z2tiaS9aNjdMYzNHeFBlQ1RC?=
 =?utf-8?B?VDNwazNZNU4vbW9YbjI4TE8wZEo1K3NxckFQSEcxd05vYkcyQ3A3cVA1OUcv?=
 =?utf-8?B?TDlLMFByZDJnYXhHTWEwU1YvM0xFMzVjLzhOMHBtZFRqa2pJeWVPQy8zNzdL?=
 =?utf-8?B?VE9PNmhkb1BZa0QxSWVWQnkrQmFuTFhQRDR1aC81OUs4YU12c0ZuZ3prZDRT?=
 =?utf-8?B?QW9rL28vOVBFd20vcFplMzRVdkVubzBaMDhnNWR1WWlpOXZ4OFNicmpVeFFV?=
 =?utf-8?B?QnlqZjJsWjJwaUJ5azFoSFdzZWpERExMdjBSbXh3aFo3MkVpZ3ZaWDlwd0JD?=
 =?utf-8?B?eHBNOHlRb2pVMzF4L2VTaEh2RmNyRHRJemZKSEVscnNkdERUY2tKeWszM3BD?=
 =?utf-8?B?S25OYnNycS81eE53SW9INFFDbFVpaWZJbnFyUDFnWUplcGVxQnhCMlFMNVdQ?=
 =?utf-8?B?Ump5b0pmeUpselFoaDhtUkxEYXVUejEyRUJ1azg0WlcwRTBZTzRLcnJmWHpr?=
 =?utf-8?B?UFo4YmVqRklrV01XUXR0ZjNObFdWMlpmb1g0dlh6cHZYSnh6a0d0dk9ITFNE?=
 =?utf-8?B?Yk1sNzFGbTBDblBZcUpqVEJwN24wSVhLdWlIYkFyNjRraE03M01MSndUdWRF?=
 =?utf-8?B?Z0J0b2ZCQXJ2bmZoUUJPdnNScnpiRDMvRGZQeUQ3R0pzclFnWDFqeXRTaXk2?=
 =?utf-8?B?cWphd0dVVHNHTlR4QzI3dnhwMnRGc2xMeDZKYTdHQ08vTm9qOXYrS3A5TllM?=
 =?utf-8?B?d2dld3ZKVkxNZks1Ui9NOGp0SzJBcHhEeFlXcVF2UWk4SXdmcnhtVCs1c3RD?=
 =?utf-8?B?aS9Cclc1QmdlaWFxM2Z6eVJOUFpFN3NLSHVDc3krNE0yV2FKcHQyVmxwbjN6?=
 =?utf-8?B?RVlla1VnUUk5WTZTeHMzaHJRcDhIRDkxQUc0QXpyRGFJbzdBUVpJa1NWT2xD?=
 =?utf-8?B?UUxPUlVWZ082Y2NLeThueVF2S2h6KzNLWm1wZU0reHhCK0JsWXJDSlc5bjVz?=
 =?utf-8?B?bXdub0d5aTMxZU5WR0d6K0VYTWZtbjEvMlRxQnZ5R2I3bnM1UVpHTFNaUWEw?=
 =?utf-8?B?MllEMktOMXF2bFFKcklDR3ptaEFOZUo5RTJYN1I4UEg5aEdiNkxCOHhrVHVw?=
 =?utf-8?B?cms3ZEdkL2duWnZ0ZEV4TTVad1Z4cnRkMjFBb0xJUTZJKzAvL0R3T1NnVVlu?=
 =?utf-8?B?UnlTR3VjTVV4MWZ2alc3ckxHWXdVc2tiT0ZCdTJLTnBScGpMVUxvWnAyWkR3?=
 =?utf-8?B?R2FsaHhhVlp1cjZhdmIyeFpTUFRVTzBacWZVYWR5U0J5RUx4YnVzd1RiZSto?=
 =?utf-8?B?ZlhRb0FuUVpaRDg3aDlnS3FEVGcrRm8zQlZPMVdQZTYwMUdiMjRFWVNpUFZM?=
 =?utf-8?B?WGZ6UWlrY0FYZktiRkFtTUFxTEhyNTlXTkYybXU2eFJQL05tY1VMWnExTXZF?=
 =?utf-8?B?blh5MjREcGxLU1Arck92MzNnb3J4c1E3V25wMG9XYmNueEVUeElOcXBOeDNp?=
 =?utf-8?B?YlIrbm1tSjNOUmdoL0dOc1ZUcE45R0NQR0pDdDlUZC9TTW5wbnp0NEJzQm9I?=
 =?utf-8?B?WTB5dzV2VUIrSDdBdFB6VE53aTgrUE1LN2NKYnRzdmVRdkd4SFl5N09SU2Nw?=
 =?utf-8?B?OGpycnpyZDVtRDVORVVnYVdFUGlMY05xZUxqRXl2R2RzV3IydDB3cExBVGVC?=
 =?utf-8?Q?mCpeSRhecYOLXe35UQQMvdhbJC2R1jG0V7lEe4i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1df024-eb5c-41e8-9f64-08d925d40b11
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:38:10.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ohapvO7SF/xZdV4WVrYjNIe5U3ucFkyB4Ex0KvgyJnvWpdHr/iiTdiuk1phcEQ1KiGh9DiMXewppcE6dvTlEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

We already do so in the native execution case, and a few descriptions (I
did notice this with SHA ones) are short enough for the output to look
slightly odd.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Many descriptions are longer than 37 characters, so I wonder whether we
wouldn't want to bump the padding to 50, 60, or even 70. And this
perhaps despite then going out of sync with the individual insn tests
earlier on (which I wouldn't want to touch).

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -5181,6 +5181,8 @@ int main(int argc, char **argv)
 
     for ( j = 0; j < ARRAY_SIZE(blobs); j++ )
     {
+        unsigned int nr;
+
         if ( blobs[j].check_cpu && !blobs[j].check_cpu() )
             continue;
 
@@ -5196,7 +5198,8 @@ int main(int argc, char **argv)
 
         if ( ctxt.addr_size == sizeof(void *) * CHAR_BIT )
         {
-            i = printf("Testing %s native execution...", blobs[j].name);
+            nr = printf("Testing %s native execution...", blobs[j].name);
+
             if ( blobs[j].set_regs )
                 blobs[j].set_regs(&regs);
             asm volatile (
@@ -5212,11 +5215,13 @@ int main(int argc, char **argv)
             );
             if ( !blobs[j].check_regs(&regs) )
                 goto fail;
-            printf("%*sokay\n", i < 40 ? 40 - i : 0, "");
+
+            printf("%*sokay\n", nr < 40 ? 40 - nr : 0, "");
         }
 
-        printf("Testing %s %u-bit code sequence",
-               blobs[j].name, ctxt.addr_size);
+        nr = printf("Testing %s %u-bit code sequence",
+                    blobs[j].name, ctxt.addr_size);
+
         if ( blobs[j].set_regs )
             blobs[j].set_regs(&regs);
         regs.eip = (unsigned long)res;
@@ -5233,7 +5238,10 @@ int main(int argc, char **argv)
                 regs.eip < (unsigned long)res + blobs[j].size )
         {
             if ( (i++ & 8191) == 0 )
+            {
                 printf(".");
+                ++nr;
+            }
             rc = x86_emulate(&ctxt, &emulops);
             if ( rc != X86EMUL_OKAY )
             {
@@ -5242,13 +5250,17 @@ int main(int argc, char **argv)
                 return 1;
             }
         }
-        for ( ; i < 2 * 8192; i += 8192 )
+        for ( ; i < 2 * 8192; i += 8192 ) {
             printf(".");
+            ++nr;
+        }
+
         if ( (regs.eip != 0x12345678) ||
              (regs.esp != ((unsigned long)res + MMAP_SZ)) ||
              !blobs[j].check_regs(&regs) )
             goto fail;
-        printf("okay\n");
+
+        printf("%*sokay\n", nr < 40 ? 40 - nr : 0, "");
     }
 
     return 0;


