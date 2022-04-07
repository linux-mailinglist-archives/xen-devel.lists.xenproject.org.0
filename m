Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBE64F8255
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:01:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300861.513306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTdO-0000Xo-PM; Thu, 07 Apr 2022 15:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300861.513306; Thu, 07 Apr 2022 15:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncTdO-0000Vo-Lg; Thu, 07 Apr 2022 15:01:18 +0000
Received: by outflank-mailman (input) for mailman id 300861;
 Thu, 07 Apr 2022 15:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncTdN-0000Vc-9r
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:01:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9261c03c-b683-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:01:15 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-jxtdQqawOPuZi6AuXWaE8A-1; Thu, 07 Apr 2022 17:01:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 15:01:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 15:01:13 +0000
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
X-Inumbo-ID: 9261c03c-b683-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649343675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F4Fy+HuQ1ahLRZkkeLjYi3ElgU7JhahZPR2UkCBKzmg=;
	b=FI5apdjok+WJLO3j8xoXfdDm4xB5+OGO8+hAlXpvnG3J/fqRjxFZQ+yTbFyJt4bjb7FDkI
	xPk7upn4GelO+jIgE6iBM5PDt8ej5jGLs/cFipSl5Ox0DZucvGuvjftBUpl7rpX8m6j4yK
	ofnKT3CztqL9r/812vVjDdxoST+3gbg=
X-MC-Unique: jxtdQqawOPuZi6AuXWaE8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc/WwV4fq5NMpC7EaUqRWUmkKEla2Y89CH6g6ajz0b/bHsumcqwmBI9Ql6bJmB+4wl24DWKa0adWogLVuKsuRDuNE+mKjwVsB3V/2Gv/QIreB76KlwQhlA2kOAM35DSJbTPpdcHCQddMvu0oW9egjZrJBxsjs/VZ7CPLs+H6VxzPF1lCscY4ipj0j4i4b9DkaFcCv2vjXOw4zQT3MZx5IenES0wYg2irYONuVC9mQYjOu77eM2nVScmH+vUkpd22MfeGYZk9ObfHV5+P3fnKqH9Mwcgpfg5wVwivKDImycHaGe+JqwU4iINWSTb/MQTx2aydHfr4BxseGCKg50K0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4Fy+HuQ1ahLRZkkeLjYi3ElgU7JhahZPR2UkCBKzmg=;
 b=SIM8bWJAANGywSUWLnPNqrqvRUpl5H0E+xP9LDE3lLMKy7ITzum804E+V5O9bYMB1UBQX+KBBkGyolLaCviUTRD4wT4ymFhr2CmuUA+zwsY+hyaaK8rhc0v7/cn7veO8P3zpyFJW3FSXortlKUsGDQioe49PWdoDXGxLtSWSHpDgT4Q+Iw9QTTOtWFAf5y5gc2536n3WoKyaRShiGZWgrrdroYhaEE7z2GqyjZExYt2eoht36rjYsyLiEi3YN7xHzn2vqRnRGeghu0KUkGFe0mEkSABcMklbt+7GY8KVDiy/3LZAWJbYfJOu5EaAiYcfBxIaH/XklpSbb+VS4B6oIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56a57946-04f9-90a0-ac4c-17773347dcea@suse.com>
Date: Thu, 7 Apr 2022 17:01:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] vPCI: fix MSI-X PBA read/write gprintk()s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0121.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eccde1b-d8b8-4bca-5418-08da18a77528
X-MS-TrafficTypeDiagnostic: PAXPR04MB9024:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9024FF57017B750700F3AADAB3E69@PAXPR04MB9024.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/yxjJjLrwKjme6+bB7uiyadRRT/r1T+GQi4KN7S2vgLZUXyUd7jcubXI8pgXmKg9HMA7DhMdD5jm7XDdhD2XG+2SiPjCMby2nLeWkYM4d4nzaNGgLkZ5iVFWWlborq2+A4rGn/Ll96uxw4/HAtDikZpbMAcw97wCMq7h6OXLoa7gV3PMpzZYBGg9LCP02d5wsPwTIlm+pJWeKsjxUYy7z6gfaiV3KWE5/FMmoezWYs9A0KeTdRc91E37XOZEreyqpxLzvpWPExw6aHAB8RrXylUgwevy2hCsocLlva1e/N8gKbASoNvfgKIGgK3qn6xaK5r6RUcauQxsDk2B/vluxOWHQ3FsbTPAV1t8+/5/hoY8a09HWPDf7NxqzPjihQ41rSQOhmtSbYAZ9cWgRkl9zShT5+Fl9qp4O8kNJqBDXJC2JLQL4qBVNviu9BTJ8x4bShGzhqmkEJgWaMZVofOCP7lVWgyfTGVWYgiuJZWILIL2GE2/nuio6vpq5R/smEDieHIUlxXBbn2B80o3HC0PU1Qz17hfpi8Zp7TwL2y67RNSziBomOYvFWSMmMkRCDCaALh7R9DGjXOStskQ7/B/SSFp7xk2gCAajRCyqEYzhgT60c3qerZ5+Fq4Z0KrAN5fpirLlXC0oQUoM6POCbzdScln6MF/VUngdx0KElQhnEnu6aXVJ7fnMeDLLvcsxsxDYasP5qJio4yAfQ7s2LAoGMv9m8wu/vtVMQs9chL+dgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(4326008)(6512007)(8676002)(6486002)(83380400001)(66476007)(66946007)(66556008)(2906002)(6506007)(38100700002)(8936002)(5660300002)(31686004)(36756003)(31696002)(6916009)(26005)(86362001)(316002)(4744005)(508600001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yy9tQTNwdGpwdVplVWo5ak1aRWZnVWlHWVZkUXhWYjdSYUQrN0dPMlg0RVdS?=
 =?utf-8?B?NlNkUDNqaFVGRkVkZFkvVllQbFJ6QWlxdE5JWGFvYWVUNVB6Z2RHL05ZVGY1?=
 =?utf-8?B?c2JPYUxCU1NqcHZYSEF5NmlNKzJFQ1NKT2dvWnFzWWgwREhNYW54N3BTNmhX?=
 =?utf-8?B?M3h3Qjg5YXZkalJxSEJhUklQWnl0QUF2SDQrRFMrenJhdVNsaXFQMjVyZ0V0?=
 =?utf-8?B?VHd6ZFQvOFNjMjRIeUtzTHAvbWUrWkVId1VRSVA2L09JUVdESnFtV0dUZ0ty?=
 =?utf-8?B?WmVZbXB5dG9udG0xZnVwQ1FSelpIRXlpWVZwMnlrak41T0dFaVNQTFM3Q01w?=
 =?utf-8?B?ZytYbzRZYzQ5NUR2c2FSMFVTVXRMb3RFZlJQNWl0OGNYNFlPaVVOQjh6eW0z?=
 =?utf-8?B?UVZqREkyT2I0VlJEZ0UxQlB5OUoxWnp5QjUzYzFNU2cwbkZTekJEUktRK3ZC?=
 =?utf-8?B?MU5CS3o1TzNJQ2JBR3VyVkpyQUpDMUNuUmNPSGJYVlNEMC9uUG15eU1ZWk1J?=
 =?utf-8?B?QXdKVURIOU9DcjhJS3dnc2M3QWRORW0wNi9FSkVQb20ybVN1R2YyZWhvbVI5?=
 =?utf-8?B?UkIvbGkvK1dvQzlNa2hBcS9QUm5XVTBseFEyK3Y3MHk4ZVVKYjhTMWtvRERC?=
 =?utf-8?B?VlplWVJPbGxGNTNhZGZYMitQSWE2aU1ZcFpBOVhsRC9FR1FhMEZXRUVrVUxL?=
 =?utf-8?B?N3hma1JLbUVRamNVK05nK0poNjdQaTdKQnNmZWpQSjM3S3lpYmxIWlp0ZHNK?=
 =?utf-8?B?K3BUMVh0VTBTUUtnblNkUFRseVJWSjRySHlrbzBmMC9tK1Vua3lTemlPYnlF?=
 =?utf-8?B?VGZJTUM1TWlsdmR3dW5hTDFUa2I2VXpMQWpoRDFYUXBUbC9QVVUydGFLV3NO?=
 =?utf-8?B?WGpUL0FpYi91ZDVzODhFMzdYaFJPVFRrK1Y2anZ5aTBtV3dnVVc2OW1pMXFV?=
 =?utf-8?B?ZTZ2R1JHRTVabEFYelg3RENpNk81ZkRRZ1J1U2QwaEo5Z3JJYmlpYzFLMW9q?=
 =?utf-8?B?WlFYZXNVTXhVcjVlUi9VRit5MVh6akFhbWZuaDZOaS9ERnRaRW0zMmUwVDJw?=
 =?utf-8?B?T3BFT1lPK29CZHB0cE5kOHVYVUQ2ZTA0MzdOZFliVGY4TWhxNnZCVlYwaWdk?=
 =?utf-8?B?R2IveldtVS9tczN1VHhrZHRUancvek5rVk1nL0hRaUxJNmtYR0wrL3ROSzhp?=
 =?utf-8?B?Zm5ZaUl5aEYrbE53c3cxS3lRUFErTlJhcktiSTRqK1NGYlN3VGxaa1FsNFJq?=
 =?utf-8?B?TUlmY0hieFlvTENON1d4YW1nb1hlQzZPcWZKbVJUNHNrRlFEMkc1WTFMcnlT?=
 =?utf-8?B?VmwyU0FPSjh1M25uTlpSeHVmSGtuektVRFIvOGFQT2EvOXVkSnJkVmMwT2w4?=
 =?utf-8?B?YjBFbkozWjNXMzVKa3VpQkdXMGJLbG9MV2FWZWU2SXdFWFRvQmdwQUxPOEVL?=
 =?utf-8?B?Q1BPOWRKU1B0NDJBSFBEL1VCNVJiQ1ZTRUxVaHBnbHAwSE12aFBmWGpXczhi?=
 =?utf-8?B?NGlDNW9yRVdRNE9JcG93ODE1enN1SnpRa0FUVGM2NzVIUjR1WGxvT1Y2a0tV?=
 =?utf-8?B?UDIwZ3dJK3FteWNlUjZUSjJpSFhOTytIWU8reEFpVHVtOUE0Tk55Y3lzdFNr?=
 =?utf-8?B?Q2FBK1hoazB2OTFubk85aVpwOXRsMGQ5dis3VlRhMHlFaUhZVmgxOFREN2hx?=
 =?utf-8?B?RlhiMnR6LzhtOXdESDVkL2xqeVM5WVJxNlZtZ3FHb1c4bHlPVkVWczRXTjVF?=
 =?utf-8?B?b2F3TzlEV3JuOHNINVFXczZSUW1SN0gyekYraDBZckliai9jQ3lIeDhudmpS?=
 =?utf-8?B?Wk5DcTRsdDErSWFnclA2VzlhbFNCNmFqWkVjM3F1RUJjRGZzNDNkMWxIWlVr?=
 =?utf-8?B?NzBsK0daZFozSjdUN3R1amJEVU5KSkpUaGJGSXYzYXpRSGgwYUF2OVRQL0Zp?=
 =?utf-8?B?dERjQ3U4ckpoaWR6VW1teUd3ckZFT2dzL01mUXJ0ODZ2QVZKZUUzd2psNlNG?=
 =?utf-8?B?aGZjSU02Wmcrc3FFKzJmOG9QRFlzOTJiTis1NGtwVVdTRXB1MGhuT01WMUpp?=
 =?utf-8?B?M29SeGpUNU1NcHI4NnhwU2Z0a2twZlhMa3RYNzBQZllsamNwQjVsZk5BZU5s?=
 =?utf-8?B?Um9nMnRxM3I4RDFFcE1Qa1BKMHZJOFJ1a0lpUUIzWnA1aEJ6dVFyemMrUWhX?=
 =?utf-8?B?dHAwTmRjQzc5c2U3UlpheEV2SUlxbHQzRENmMUpOUlc1MWdQTUxJMmc0YmpQ?=
 =?utf-8?B?VVFKQmlrcWx1N1JadGI1NCs0Q3hVZWx1WEZIdFFkWEcvRHhRdUpyTEp5RDg2?=
 =?utf-8?B?cGh1cEwzeTlLdGFtTFB6M1JMMVpXeWZDR0FGc3owTzh2V2NoZEg3dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eccde1b-d8b8-4bca-5418-08da18a77528
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 15:01:13.1622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNW/Aj2/lhmQX3o9okIafsZKG/yGY0OHqoMdmojGYZ+JSBxB8itmacedBnUvl4ArWwlmGzDjLfNrB4Fb6o2P1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024

%pp wants the address of an SBDF, not that of a PCI device.

Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I can't resist to say that this would not have happened if we hadn't
made this a %p extension, but e.g. a %o one as I had proposed.

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -247,7 +247,7 @@ static int cf_check msix_read(
         {
             gprintk(XENLOG_WARNING,
                     "%pp: unable to map MSI-X PBA, report all pending\n",
-                    msix->pdev);
+                    &msix->pdev->sbdf);
             return X86EMUL_OKAY;
         }
 
@@ -332,7 +332,7 @@ static int cf_check msix_write(
             /* Unable to map the PBA, ignore write. */
             gprintk(XENLOG_WARNING,
                     "%pp: unable to map MSI-X PBA, write ignored\n",
-                    msix->pdev);
+                    &msix->pdev->sbdf);
             return X86EMUL_OKAY;
         }
 


