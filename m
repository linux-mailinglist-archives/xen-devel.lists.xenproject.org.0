Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B073FEAA4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177138.322376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLi8y-0007QY-FH; Thu, 02 Sep 2021 08:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177138.322376; Thu, 02 Sep 2021 08:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLi8y-0007O5-CA; Thu, 02 Sep 2021 08:32:20 +0000
Received: by outflank-mailman (input) for mailman id 177138;
 Thu, 02 Sep 2021 08:32:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLi8x-0007Nz-MB
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:32:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54a0351-d668-400f-9754-8cb4883e52f5;
 Thu, 02 Sep 2021 08:32:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-8rI5qsy5Ot-aOx5yvDc6Lg-1; Thu, 02 Sep 2021 10:32:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 08:32:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:32:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0084.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 08:32:12 +0000
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
X-Inumbo-ID: b54a0351-d668-400f-9754-8cb4883e52f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FuErrn7dPOKk18p14Eqqw0Ug5qQHJVZRhPNfvjkAXCc=;
	b=L94RNv+6FlEjlgqvSwvSNstDsWDSyMyRbG69/F/2G3hwkGiz7CL6wz4XOAQFJtexf0gLSI
	JMjLtEE9DrYwRRD9aKcwT+yig234ilgbDK05hmv4kKHIS6bWn9nG0EKBLRwa9Ux82KylSp
	892ol2c0NK2OfCKXuICW8QIFODNWZn4=
X-MC-Unique: 8rI5qsy5Ot-aOx5yvDc6Lg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esop9D2vOOSfKjxkqZ2QTy/dXVlj+3dCmsXtOrdkgM9Xd04dHZP1kfcLV5luhYvDUSA5pF8SG+oBfVk/uAmFTICChATsNPEZKNpCCALNnzQYiGYIOyWeMAYGoWFE77PGivScaWBk2vEil2SkqeE/wKZh+7T732+gtWPwfT/zkQwWVmxAP/CYHtsN/br42smHMGCieMO85HTfiReerk8mqA0rDKxSpDeO0khv8QJC0OcUk6K4gJtr+iQboeXhNsRb4ua2vggiPVpcmnx4vMnkw1CwRGbuQy+Mf1kWvp9r5Nvbp8Orom/+IDXPWSg3I5ySyqza17cEG5VAW3EQxqFlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FuErrn7dPOKk18p14Eqqw0Ug5qQHJVZRhPNfvjkAXCc=;
 b=QqHhhd6RNunR/gm9IEcERf6hsRrZ91u49seIlwSyduy/tgvlyY9L98qBJVFOaKS2JIEkvEVJiHfmWBnqArM4yK+Er4Ub9eTn/0mjgKStW7AHEhberdHR3XraM6cmUPuPDDY5LA60qLszeodZqMhtpmwxNc3jxslCrWbMBOcthES5KwTbsp0FasEx46tvfPRR98w98OITl+F8utSupwpVPSU0F16swNPILpDJANAg4OWbzi3nyGUDGTmnTRj6f/4DYl/OHhXBaZ9cX9F8MEePiYiaDxRbw7anKMMu+X2BXdGq2b+RyJpR65p9rzVg551Kinho6UJrzSn8V71iiDGL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 1/6] x86/P2M: relax guarding of MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <9ab471d8-877c-b569-96c3-c3145800adcf@suse.com>
Date: Thu, 2 Sep 2021 10:32:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c4cfa0-5137-4660-cee9-08d96dec296a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB418960DA18FD87F9884E86F6B3CE9@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SkzESaDIGIt8nj7pKgXEjA05Kg+86BAjcW2RYiEawFWSTTDVrX/jSD9X1x1ktOkTveqImF2eOieqMJ4Bpu413IdjI6y6vsMGfAah7BnHMXSlIkV/Zemr1f776d1Pcy5SyD2/plKhIwOnMRL75DUCuuu9cE54ce3NS0swsnmy3BxYnRNHXTdbeneu0LgdF3v6EoivRCJptvWjY39wPmfHwRLdR23vn8y7opqLYe5m+vLCC/HFM6yy0Tl6Hatl4o6mgM//ObQNO4PgnujK+03/wqmCWsn7iGP99ETPASC2mBhLCUNvmA8tFsciRjJIXhxBalfwGLmVzF/x1u2OPnTw9KTxXe/M2vsqwtjH0tkN+JCn/1USL/Sxr8TRB+eZy7ZbCFkA8wcSPWdTQUvrMu4VLHQBoPQjkR/13KihYCxe3FYhp9fkdwRdhRM+PfEHdWtZH+Tylr9ydY4qvaxx0iUrSs6T7H94/SMfpQb9a8qarLtN8l6nY29YUeTJrrRR2ipeT8YaBckvJiwTOKaTTfotM8rlvFhEFGsoREU/cSv5P/Rey9PYaxzfwpNV1EiBO9XA/VkGEeTv2W6G5MKNEExRFJvIGbszNtIvcMfR/4xIqNzoUBSpeL4xnpda7Xq+qHg4w5R9WqUuSk9WxsgCstxhoRqmTF5htOYXvzn7FwdcMcXuyY1MTda73NrLPgkO0UfO9cSHbrqaRDYk6Z9r3d6iJqRRdzBycGozfHux/Yggbvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2906002)(4326008)(508600001)(36756003)(5660300002)(31696002)(31686004)(8676002)(54906003)(38100700002)(956004)(86362001)(2616005)(6486002)(8936002)(66946007)(83380400001)(66556008)(66476007)(316002)(16576012)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJ1ZVNZSytLZ1VLSnFWdXM2WWxsbWdpcmNoZ2lRT3g3Nit5c2Y0V3FUTy9P?=
 =?utf-8?B?ZmtUNlR3NGhzK01wajE0c0tJWEt2MWp6WUhVb2pWVmswR3NQRllrb2pVVWpD?=
 =?utf-8?B?dFVoSXB1WXhkY083cHg5Z3FtMkg2SmFhVDJzeS9PN1ZkQ2VUSzYwRnlOTFQy?=
 =?utf-8?B?T2MwNGlHd09HS3djNG52enl5RjF4UkRYT0puYTFtRlN6enJxTFFnUjQ1eVB1?=
 =?utf-8?B?WVUrZVNsek52MXZ6ZFFYUm5aU3RsbG5QUnBVNzF2UlNJazNwRXdTQ2xyQ05O?=
 =?utf-8?B?YjUyZUZ3UFRSYVFQdG1lMXhJZWJtcDVZb2ZWQTMvZFhUYjQyODRnS0dmSmh4?=
 =?utf-8?B?b1ErcTdTOEVNMmNZeTZicjFpNFMwTERXZFdBZjBXekRqNi9Malo0cUxiQ3Vr?=
 =?utf-8?B?dXNBT2pDbFJIa3VXbmpHN1lIaFRkQlplZjNEaTFMZDQ5NUJVNXA3aWpQMFhp?=
 =?utf-8?B?Vk11dEh3UVVJbHRJdmJId1JjSVBpdFFwSXU1OEk1WGMrOG1zOW1aZC9pOUhh?=
 =?utf-8?B?ZXJVRjBFT2RsUWdzY1pSbzRoUHh6RHQ4YVQxRVo5UngvWUxSWmFubEg0TXRW?=
 =?utf-8?B?TU9acWg2cDRFejVUMTBqV3VPOHUwSHZaOW4wcThRNUp4SFY5ZG9hNUdCWkF0?=
 =?utf-8?B?MEt4SzNtaVc0ZHpiYXJERGRaQTlSTXk2RlVHcFFabGYwL29XaUpXSmlqa3NC?=
 =?utf-8?B?OE5TanZNSEdFRUhUenFBRjZkNmJ2UUdNaWQrWXpldjRJbVc2REk2VDBCdW0x?=
 =?utf-8?B?RzZPYUR0RDhmRGR2b0l2MzFVTHNzT3lVQ2lwWFRnU3JTbUtzT00xNGVZbTd6?=
 =?utf-8?B?Z21KZTd1VUo4UFA2WVN3ZGpnS1FvTXVzKzQ0YURNT0ZVUFA5Y3pDRWl6ak9R?=
 =?utf-8?B?OC9pOUdzdE8xTHpiZGRHYXBqT0ZWZ1kvU0dsUzlOV3dwcnNtNU90ZUZOZTdR?=
 =?utf-8?B?Q2F5TnV4cncwOFU1dlp0V1pRbGkyYlNCbW1HWkNNNDcvT2lZQWtYNUo2dDNt?=
 =?utf-8?B?UEhJREdaQUJINjBiZkFHei9MOHU5dmhkVFBUWXBCbXBVTU5kcU1GdU92Q0NB?=
 =?utf-8?B?eE5aNXFnZmhRNElpQTRqazR5dE9xSEc0TEdzdy9sQ1VCeVdNZk5KTzdKWjZx?=
 =?utf-8?B?VnB1a1EwajMyd1dIRWtQRWl4ajk1VmwzQ0ZZOFlnKy9IblpBU3FscnVDTHZt?=
 =?utf-8?B?dkxFY0VNZlRuOWJwaWdUTWFoUzB6S3VEMkV6eXN0RDdSOTJJVENua1p3NFBB?=
 =?utf-8?B?VUdaVnJDZ1h2bmpKVERuZHRObVdNeCtxZzF3QU1iU2lRZHdJQmdJNTAzempj?=
 =?utf-8?B?UnBwcGlwdFVXbWtNbytqTm41ZU90UFpjYkFxUkJLb3NKQnhmNmxCYUdYODJr?=
 =?utf-8?B?Q0JmVnBtTUJkdXN1SDVlcXljVXBSaExRNENqWVI3QThFQmRPVUJmNG9iZ0Rp?=
 =?utf-8?B?eDhlZVBHaEtuS21JbDIrTHAySjFOSU1jOHVQc2hOcGpPT2I2RW5mdDJWUVRB?=
 =?utf-8?B?dXpiQkJRdmd6UitxM2s0QmFib0VHanBoZGs5bTQ0Z1VlZTNyeUlZeWFOSzhw?=
 =?utf-8?B?T25sMXB2SEdJRU9pMkc5MEhxU1JCNDRkY2hrMW5XSitrSHozaXBLdENkOWZV?=
 =?utf-8?B?cWVmcVlWaGEwWjBweThOOXo0dlNrbVNPVzdaeVdyZ05iZlpPMmxZSERuLzQ2?=
 =?utf-8?B?ZWVMaE92eGorblVJMzZTNHA5eUFScXNXMDc4NnBiRkpTR3Nsd3c0R2tnR3VB?=
 =?utf-8?Q?LOoB/m6LOyENjS5F6O1LWLoKb5oy6g5nVMc+Mrh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c4cfa0-5137-4660-cee9-08d96dec296a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:32:12.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iE6TS2myTByzrqwPsYAy2o/vaqD1rHTAnFsHPyhCBGF25NAY+v5+1iD6JG/zBJizAnixdGooglWxiGFbxHTLvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

One of the changes comprising the fixes for XSA-378 disallows replacing
MMIO mappings by code paths not intended for this purpose. At least in
the case of PVH Dom0 hitting an RMRR covered by an E820 ACPI region,
this is too strict. Generally short-circuit requests establishing the
same kind of mapping that's already in place, while otherwise adjusting
permissions without - as before - allowing MFN or type to change.

While there, also add a log message to the other domain_crash()
invocation that did prevent PVH Dom0 from coming up after the XSA-378
changes.

Fixes: 753cb68e6530 ("x86/p2m: guard (in particular) identity mapping entries")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I may have gone too far by allowing "access" to change for all special
types now.
---
v2: Format string and comment adjustments. Split off access
    accumulation.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -958,9 +958,13 @@ guest_physmap_add_entry(struct domain *d
         if ( p2m_is_special(ot) )
         {
             /* Don't permit unmapping grant/foreign/direct-MMIO this way. */
-            domain_crash(d);
             p2m_unlock(p2m);
-            
+            printk(XENLOG_G_ERR
+                   "%pd: GFN %#lx (%#lx,%u,%u) -> (%#lx,%u,%u) not permitted\n",
+                   d, gfn_x(gfn) + i,
+                   mfn_x(omfn), ot, a,
+                   mfn_x(mfn) + i, t, p2m->default_access);
+            domain_crash(d);
             return -EPERM;
         }
         else if ( p2m_is_ram(ot) && !p2m_is_paged(ot) )
@@ -1302,9 +1306,24 @@ static int set_typed_p2m_entry(struct do
     }
     if ( p2m_is_special(ot) )
     {
-        gfn_unlock(p2m, gfn, order);
-        domain_crash(d);
-        return -EPERM;
+        /* Special-case (almost) identical mappings. */
+        if ( !mfn_eq(mfn, omfn) || gfn_p2mt != ot )
+        {
+            gfn_unlock(p2m, gfn, order);
+            printk(XENLOG_G_ERR
+                   "%pd: GFN %#lx (%#lx,%u,%u,%u) -> (%#lx,%u,%u,%u) not permitted\n",
+                   d, gfn_l,
+                   mfn_x(omfn), cur_order, ot, a,
+                   mfn_x(mfn), order, gfn_p2mt, access);
+            domain_crash(d);
+            return -EPERM;
+        }
+
+        if ( access == a )
+        {
+            gfn_unlock(p2m, gfn, order);
+            return 0;
+        }
     }
     else if ( p2m_is_ram(ot) )
     {


