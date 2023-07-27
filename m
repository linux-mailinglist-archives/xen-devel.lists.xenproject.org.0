Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81249765777
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571192.894465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2sE-0005MW-7a; Thu, 27 Jul 2023 15:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571192.894465; Thu, 27 Jul 2023 15:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2sE-0005KJ-3R; Thu, 27 Jul 2023 15:25:54 +0000
Received: by outflank-mailman (input) for mailman id 571192;
 Thu, 27 Jul 2023 15:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP2sB-0005KB-SJ
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:25:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd0de0ef-2c91-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:25:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 15:25:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:25:46 +0000
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
X-Inumbo-ID: dd0de0ef-2c91-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO1bgjRxfM5V2PY5LNVgOIqRGVIiMLEqJAuoPvb4WQ6xJU0IVxkkoYCn7zLxmemVuiw4MGghFZWkPbKVumnUDCUEVuehV8jCjwq29LbB7ySEKvEj++jr33A9EfNjW/pXPmgzreF1qhsrtLMRIL40MCkAveANOdjRkr+UY/jxM9O03ydWLiPWwS+BEG/iEHod1iIdCfZCFjyoooM2y6I6h5RVVOM/2xOBBQo3bu8jjn0w42+K394JZnGb728TPukH9VHg1Hgef5bX431PbxjROBYQKfaSFGX5G/s52U8Bce0/vCw1rqU1AaWGxOlP5QSJUcFCT79vyLRSwqYdiU0Hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVCXWdDKp2ChIZDRQduATGvrRSz+7n/XiqcGDuffOUI=;
 b=cydJMy9UQLgyHfuHnW8IU0JlXK/h2cJlQEp2kp+WF4ZHSJ4HeY+SOyOjFPZJWcJZyB3pOJitO9ghH8C9sApG8KoMDki83KtwpB1IXzCNksoTMLR6L8Sf436WVU43Qj+yiNZ59AJ78rOfQ92i8iZgjbnrYak+6C4H4PdiqicS/wKdEM1trPFFuU0vmd/+6Mgr4F9J4d2Es2OtzEbKN/6lzn8wOirGSmR1LKoSwgQaCQaa+75B/mDIgkboLXrN1/qcXliRvRDx32Vdb+nZ0r8YmTY6fneVJYxpAIn4zr2QbuAOH4uPMhEJbI155/3INKOoIEA9VhhwmE3v2EW5Q1CYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVCXWdDKp2ChIZDRQduATGvrRSz+7n/XiqcGDuffOUI=;
 b=oIfq+L258N0vk1CpDC+eLWcoS4M5bBfKwBKtdYtGliMTX3+GXcG8dyv25eUpobZnbOQlUcEX9O/bhlcKReP2ZxJCJBQIGOckvJfWFgNkL8uP4I4cfgSEGgB0lJmrRMEjsYPB+z2ttShUT2jDXUHqUO5NF+pBUmJRBofujIh4J2ZetOiFT5orpF0cKntTRn6DYAqM887mk7KLxwsRYFEgO2c4zXai2MYKvL/oBbIGqQbQXj6CVtyzdDYacG5FseQX8+gcnbba+8UVyqqTFb/9uNtu5+tL4bJff5/5Fr9vABkqyNpaim9myfW2PFu/ezptga5joToADE/BzRxkvBbXMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
Date: Thu, 27 Jul 2023 17:25:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: drop dead assignments from hvmemul_rep_{movs,stos}()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: c62d68e6-6138-43ff-ef65-08db8eb5c013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xwnjWEiOqxMqzItiz41bOXE9RS0kawcTw+HQ4o4lc1xxUDp5XfsG2mRj5tGDdGBkSrDkvFWIXPKdHSLYvxUgVqyjCaQQC3NL/JlpB8AtcRJSUR13XNOCbtYUZ4OP9Yp4HIWl+23X0/5JIIGfCLLQBPuxkxh/Ye9NjzJEY8VThllN+3oYJh6pQbcDmo70pUZkHYx/6QgVAjk2Jx05a9U2RSx4Qb9hUDiWTh4aWxzs3v0emxhVdS7Xcyp6ODZLbEFGve7TKmnu++FtmWaoKrlzxZ+CM87cxcdl8ja/IQ4qWsi5npkkAApdO9S1UwQCN6Vf9Zh4CN7R/Mp1eMwmE9JtR/fdodyJ+rHBMnGBawZVlQwqNy06utPMQTAoBqnzIQ8adeCHGPtnbNuY2W/YCi6orY0II7ndPRywlfco8Mcey1fvnltw5AUsrUahHswOfh0yoiyNtFY+H70hqXdiWxmw3A0XmRYsjNQ2w1N9SGRiAnR5dha9F8LfwUqP+vn1Sg74hSmbGkRqqf2DJ0XWoXHeERiKKu/K47cUvS89/9AEya4vKVdEgyzIo/PeZ87I4T5JGLLvwzvI9gQNsBzRmoW9RwcX5Xa0SsJLyniPOCYQo3FjTW2woydjZzTcdSBS8F1QVzX7Hb7sH3i8zbsIIOpJxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(2906002)(83380400001)(6486002)(2616005)(38100700002)(36756003)(186003)(5660300002)(86362001)(31686004)(31696002)(316002)(26005)(6506007)(8936002)(8676002)(41300700001)(6916009)(66476007)(66946007)(478600001)(4326008)(66556008)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzBOakRiYXJJUjI5NHc2QzFRR3lYcVZBSFRoZjFWNmRRVDdIZzlOVDZmd2VO?=
 =?utf-8?B?eHZTRlpXQmFONFI2aS9wbUIvdmFBZ1RoN0hGWXNzV29hY3F2djd2MHZINFBX?=
 =?utf-8?B?eWtQRjcva0Z1bU5jWHhmR0pDcEFWZUR2MU5vL1RNSm4ycG9aL1c1b3ViKzNt?=
 =?utf-8?B?bW4xeGZDSXNxaVpHRXpMZ2FaeHJTbERQcHRwS1pCRmF4RFVZMnprOUMxSTJz?=
 =?utf-8?B?MExTNk85Y2V6cmU0UkVsUWltVVBhQ1RoQUtvZ1dZQ2U2bkV0cEZpNXZjWk9G?=
 =?utf-8?B?bXkrOWw2bXM3YklTTlZsUFpUT0FxUTdxbkNlUmIwUGhpVENjbFh4NHNwMzY4?=
 =?utf-8?B?TDJRUjRGSVBBaHU0WW9PV3h6V1h4bmQ5MjAvazV1SUgwQVFmL3ptMkNqR2dr?=
 =?utf-8?B?bm5JRDdtdFd3YVVjZ0U4cUhNU1ZyUmhhYlhKaWZGTm1EQWZONXR2UDVuKzhj?=
 =?utf-8?B?ait0ajdSTVo2Y1N0LzJ2aTB6Wk5iSjlYMXhkTmdNT0FtYW9oNDNYOTB2dDND?=
 =?utf-8?B?QW10MUNMdjVsRzlWejV0Tkxnai9vSFprVi9sTXd2QXZqaU9yL2NyZXh4eGti?=
 =?utf-8?B?OG9WRVpPZS83ZjhZbHpUU0NUbThpSmFnbENoM0liQUdwR2pFQ2txaWV6V0tt?=
 =?utf-8?B?TFVJQS9JOWZQSDc5TWN4SjVpazg0RGhtTE5CK1ZSclFIN1JFWFlQS0FhSFp1?=
 =?utf-8?B?eW9SQUhHOG4rNDQ1WjZ4ZWRnNzh2UTNvSXB1dEEweXl1MDlWWG90NkZKTjAw?=
 =?utf-8?B?bU5OSW01UzEvWktvU2xhZ1E1OHBjSVQzZnhoRmVtS0lrODF2N3hmWUVhL01h?=
 =?utf-8?B?QmVUb1pQb1l4c2tVZXZIR1BUY0VCNkZiWWJLUXFjY0xCR2ViMkZGbmhBMUdQ?=
 =?utf-8?B?VzZpRmVuQkE2ajc5Z3dXUHJsUisycTZwTDdVNnZ3NGh3ZkpMSy9YQW1nd3Jz?=
 =?utf-8?B?RnowM0c5OVFaQSt2NXEzek44b25YUEVENTlmWVNBQWZKajI3SVFDa3orNkVE?=
 =?utf-8?B?UWkxUldOWDBKem81NzJFUkRVd2FZMDZhRWd6ZzRMK0xlZllHditrbDZBMElm?=
 =?utf-8?B?bEdyMkhmZVh5TnlWeXNxME50Z2xiNmlyRnRydEJ3NVhGWjVBcTh6RlRKRW5R?=
 =?utf-8?B?VFQrNEpQdFplT1JTUFVwOXpyZUwzZHZGZXBFTmVSVDdoNzRKazIrTjh4Vmhw?=
 =?utf-8?B?ZzdPL011TXRCcUtlSDBzU0M2RHoydXhDR1NQQXAvN1dWazRkSkNWaHpQV1U0?=
 =?utf-8?B?Q0g2eGJsQlpiV3cwRWxDQUJucUlvUnhFclFnMHU0Tm05eVNtbU80c1M3R3FS?=
 =?utf-8?B?dDl1T0YwWlp2OTAxck5reDZYSzE1dlZwc1FjNHJrclB1TFEweFZOdlpsQmpY?=
 =?utf-8?B?TndKUFp3NXdkaXVGRFZZKzJDaGQxYmdQNlcyYnVLbGlmbFF5T0FGY3VTSUdN?=
 =?utf-8?B?YkhYV0JmN2hzK1FmYXNFZHh2Z1ZEYWpOc056KzVzTTRBT2prL3huTXRjaVpB?=
 =?utf-8?B?NlhBY3BOM2Z3cnNiUXlkM2MzVXlyTDZZUGlsblBZa3I3eWxjWkprdE1xcFJa?=
 =?utf-8?B?QndkV1V2M0VwWWF0Vi9sQnJUZUxNSVMvN3ZRdDNZYXJnTTlqdWxNdmV4K1BR?=
 =?utf-8?B?OTF2cHQ2QjlTODRxdnJBMjZ5Y3pZSGIwUjRPbEdTMTh2S1h4YThuT3pZQm82?=
 =?utf-8?B?QXFUaE8zeFlNazYwb2FlVDcrTDVMM3lYMnpoTmJWVVR5Z2o1eGlsbnVmNzMv?=
 =?utf-8?B?b2VPa3lyVTRiM2c4YjV2T2loMGl5NlYyK1dhM3FtZHdvM0JKcWhsMnpYUjdI?=
 =?utf-8?B?MzJyZWZSUjB5bFBhc2ZHaXNSazdMM1dKaDhqM3lMdk95bFUvaUFoTGxxbUgw?=
 =?utf-8?B?bTdBSEg5aTlHU0hSSjB0RFk3UlpUQXU0RVhhWkM1d2FrNFFUSytEY2k1dmo2?=
 =?utf-8?B?aEFuaXpsODdSUURLNGFwR2NrWDBXWUU1NithckMzOFllUjhHV3NyQVJtVzUw?=
 =?utf-8?B?UTRhS0ozYW5yYlZUdks2YjJUOUVKQlYrOFdhVlgrVlpnUUU4QTIxbGtwRFpq?=
 =?utf-8?B?T1gwRUJrU2dWRFI0Q011b1BQZmw5YW1wZS95MUZwUWNId0NxUDlrclpaRXYx?=
 =?utf-8?Q?33r5JZA4FDRk0E+hCSPskPSzt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62d68e6-6138-43ff-ef65-08db8eb5c013
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:25:46.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZ7KyAGeswB7wYEjgUsNMhvnxohC7af0Q7UtiGBu92LMNk6+LLRuqbSqUAzB93BczakExAGrwiurwMiworNtxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

In the latter case the variable altogether is then unused and hence gets
dropped, eliminating a Misra Rule 5.3 violation. I'm afraid I mistakenly
introduced both assignments in 57a57465daaf ("x86/HVM: use available
linear->phys translations in REP MOVS/STOS handling"), likely as a
result of some re-work on the patch.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1861,7 +1861,6 @@ static int cf_check hvmemul_rep_movs(
             return rc;
     }
 
-    bytes = PAGE_SIZE - (daddr & ~PAGE_MASK);
     if ( hvio->mmio_access.write_access &&
          (hvio->mmio_gla == (daddr & PAGE_MASK)) &&
          /* See comment above. */
@@ -1988,7 +1987,7 @@ static int cf_check hvmemul_rep_stos(
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
     struct vcpu *curr = current;
     struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
-    unsigned long addr, bytes;
+    unsigned long addr;
     paddr_t gpa;
     p2m_type_t p2mt;
     bool_t df = !!(ctxt->regs->eflags & X86_EFLAGS_DF);
@@ -1998,7 +1997,6 @@ static int cf_check hvmemul_rep_stos(
     if ( rc != X86EMUL_OKAY )
         return rc;
 
-    bytes = PAGE_SIZE - (addr & ~PAGE_MASK);
     if ( hvio->mmio_access.write_access &&
          (hvio->mmio_gla == (addr & PAGE_MASK)) &&
          /* See respective comment in MOVS processing. */

