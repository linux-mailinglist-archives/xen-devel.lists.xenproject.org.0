Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E27412F33
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191410.341431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa2B-0004JD-Au; Tue, 21 Sep 2021 07:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191410.341431; Tue, 21 Sep 2021 07:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa2B-0004GW-5W; Tue, 21 Sep 2021 07:17:43 +0000
Received: by outflank-mailman (input) for mailman id 191410;
 Tue, 21 Sep 2021 07:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa29-0004GC-QM
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:17:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 325a3e8e-9eaf-40a0-a08c-a5a859c2f989;
 Tue, 21 Sep 2021 07:17:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-eChuMQnbM9OtR8qRh1PPBw-1; Tue, 21 Sep 2021 09:17:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 07:17:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:17:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0154.eurprd02.prod.outlook.com (2603:10a6:20b:28d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 07:17:37 +0000
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
X-Inumbo-ID: 325a3e8e-9eaf-40a0-a08c-a5a859c2f989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Le5BJdNW9ne/Xmuzk0IFXev47snchE6r7a8FNfwFXaI=;
	b=A9l1GU7mXI5buJf81fafDwrA5TGWj8njefwNhc8hQlqQAx+o8dGt+TreZYsXJvk2H1+3TP
	F3t3i6i870w+0pTqSpCQNYCkcS9UClGqfbt4vnRT9fh21jtYoI+8jrBeK+sS6iqqdJDtou
	5vxy44IXrhqODou+c97BLSCUIV5qSE8=
X-MC-Unique: eChuMQnbM9OtR8qRh1PPBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnlVwtVClkmwJ1yacAro2yUcn1YX3AJVFXaPTI3uISPRttF5md3bt4bzgLbfdHxlYn0ru8z6CbFbRyN+XBab0h5J4/vQx/REo4UeeOHOJdCcv5/cpASccUUFK6U8Exe3Q4Qn1Xa+BB5F/PB36dsy2ZypYZbDUePYmFC/tpK/7leFlDE/UIsYGew0392kRqXxZnjuNCDpnc6jO28SSJW3b58iZB2OlLKXYRs2ZnpKVYQxJ5PyPUzs6MfBoJxGQGGxcZHhV0px0wEZ9BzimigxlI6IVeyPqhoEWA2JimjO/j61F7zFcTM6ZS1vf6h1QqbnblSHmKfGbBQdNlbmzR0clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Le5BJdNW9ne/Xmuzk0IFXev47snchE6r7a8FNfwFXaI=;
 b=nd1gnSPL/TPVYL3hiOj9OPt6AS2yi4U1Jk75RsVCfkJuFKdkFFMobWI7k70J/bpR7tGWHnDF48QZe8BVAS0XZ3XtWuBucPVCnwuV8BcZp0m6KGRdqKiP2SsgcDoYY0ar5NM16HAWELPt1hIDsRbqXf+6TNn2SdlWuocZa61xnjr3RNs7ITXvlU/UdilnZTTmiKdR7Spzl4U3aoTXTNeL4sf8UtOzApvnQlux/9CeizTdCf64OPWaghof0bo9bp7Gox0+SjOc5BG+de55y0czOzY9d2iifv4wmSLMlwq1c0Ap3+7HAOvtv1xqfuRZYaqSrh4Kxs7YJb61+HsiIqvAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 3/9] x86/PVH: permit more physdevop-s to be used by Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <78c84053-3d79-b36d-be03-08b3b3a3d26c@suse.com>
Date: Tue, 21 Sep 2021 09:17:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0154.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c6805a-0f31-471f-e4ea-08d97ccfe42c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329325490E31417B3E35C420B3A19@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sJ9tMjWXdmprCrWK98SbUGnUwiMblG0eEeciQSt6Dk0DTN056yNhOWYk0U5l//h/q6Nict1ck6qW1ml0QtbChX0wZxE5nmbZwDDHI1LAfqlZZguq5xMwNutb1iA0xC9/mjHxd+ctRiAlvAZMmgXMRdjuUxXaKvr56Qgl+7D7Cy+41zPHA+xvYmjk7soyNDKIaq0s0KmPd6twrqVhNl3kI1GFLfkynR2rCRFzTlBgb9kLwqD3JNVvwsgKr/WFSLY4lQPY0x/T7v17kS2lUVFVtLCbrNImIzhDC2H9hgu50lpXVsyS9dAPCSN1jwJ6fpNloeG0Iu2oo9aTHHLd5x6rRiMN8EzGcawO54rw1WREmYXvUm0w5e9UuSO3zmNVDnk6X85EivlSoTw9HQApWGx/lBS4DuoJb+YtNun46ZDIAPNpQazpbwQNkj8yaynZCVK5kBDqPwqR1ucKC28mdDf7zqQ4O9c6pEsNwpOK9AjgqaYFcAoS+hAvLqaiKAULSbBKQ52GqbyLZJoA+fpcxC4iERHm4BmiqyvRbVO8QT2BsjYblY7bNeoZf0D07hWKS8OOpGAo48WwVgc9Jg557VrbCtwRh3jwOP7U34esEpP0+nUuIYMr4jXuDk5z1WT/hkV2ahjh5IPZUd5M8vTZYwIplUh5Q+ZcKuXZuDvz/O9U7uHXxf0mEAEvHAC6Cp60LE/TIfB4i/Frqephz097CDmEQPNnTIsYreK2FUl2damey+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(83380400001)(31696002)(8936002)(956004)(36756003)(2906002)(86362001)(54906003)(31686004)(6486002)(508600001)(66946007)(2616005)(26005)(4326008)(38100700002)(8676002)(66556008)(66476007)(186003)(6916009)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW5FWG90clhZZzc1VjFEa1lXaUxMdUR1OUJEY2E0cDFhRUtKMWxtTkZUOHhU?=
 =?utf-8?B?Uzg1anZ0Qzcvby9wL00xSVJJclZIamNweGI2ZUZia3RGdGUwZGFVWTZXamhQ?=
 =?utf-8?B?OE0yS1FXZnRnWXRlV0xFalREbU5SUXFrNkpsVWN3NmVEUCs1VnM2cGFUZC9U?=
 =?utf-8?B?d281akVYc0pQM2NSblFyNjRyZWhhcVdybi9sdjRGclZTbnJKdzhJKy9NUWoy?=
 =?utf-8?B?M2lsTkVmbWhqbHlMbzVGaGNMY1BoOXFXTUREUkJDd0R1ajVRNnNvaTBEYXRo?=
 =?utf-8?B?cEgzRTRpT3RQTFhEODN6RnJiVENDVUJKcG1scCtWVXJ5ZURYQU5OeDZUWmZS?=
 =?utf-8?B?M0J5NkpLdGs3c3B5Ym5TWjRubWJ3Wk5ZalhyT2ZmZi8vWC9mcUZFQjg0M2Nh?=
 =?utf-8?B?S3Q5R3AwYkRPY1lyTVlJR0N3S1U0M1QwY2E2amhadnBVUTVkWXo4M2lLcG5D?=
 =?utf-8?B?b3F1ckNoRDBEMmRXNCszeFhPQXA3TjNldTE0MTVXd0lSdEluVFZiQ0h2L3hr?=
 =?utf-8?B?ekJtTW16eFNGTkR1eXBRVkFJNE01VFh4d0taWkViZHQ2dFF5TFByTUpxaFZn?=
 =?utf-8?B?UUtjK0xsOGNKYTFZcnpzYmt3Z1IyZnpRdmdlRG1XT0QxQS83SC9PNFA4Wm1O?=
 =?utf-8?B?ei9KVzdBVWFlMTQvVUhvNnh1ZHBmMjFhSnE3eVlaWUdnczFDREFubG1zZHZs?=
 =?utf-8?B?bXNERjlLRVNZS3hyaUhDcXpZT210dENWYXRsbGEzbFdpYm0wS2VGWVVJZU5u?=
 =?utf-8?B?WmY2ajlMZ2UrTkphdk1oZWY3ZCtpRXB1NkRzRzJydWk1YlZzNVJsVkFOWHFV?=
 =?utf-8?B?TUpnZTBnNk1EZllucWwyZUZFZEdpbDVmR1VnQk1vNWJINGVVMnpOelVEY2dz?=
 =?utf-8?B?WWtZYUdEMGkzT3YyMlIzSGRSMEovU0t5VzVyNzZLKzRUVTRzNHI1VzMzTW9a?=
 =?utf-8?B?NGhJUFB4VkNEc1IvcUNwdmdsdkJnTzU1YkMxZlI5S3hzMmZPY1hyMU0yY2Np?=
 =?utf-8?B?T1F5ZmZXeGFkZ2hSM0dmSFVHcDhTamowY3BTMzcvTHU1TWF5d3pZbWRmQldY?=
 =?utf-8?B?YlEwR1UrY2NVMUZaRm1uZVFVQ1h5d0I1TnNwaDd6VnlsaHlNU0VZV3E0cE51?=
 =?utf-8?B?dHhhR2dOeklJcU9pUHZVUjlsVUg5WWVhZ0tFZGMyTHpPMFRpanlZVjdac1FD?=
 =?utf-8?B?dTFtWjFGZkZ3Zys2bmJZZndpUGcxYTZGVTBDbDc3bGpMWGRTRklET3JhdnE3?=
 =?utf-8?B?VzNYQXZYQ2tlcUM4aXNzRko4eEdIYTlBbFdBa1BnTXpvSjBPMUNYZHBBaU5R?=
 =?utf-8?B?ZGo2YWptcmpXbDhheG1FOG9PZkVRdzU4dmY1cFFaak4xZXAwdlEycUhLYVZD?=
 =?utf-8?B?ZmRhc2NSWmRTaFVCNGwwL3lJaWVkUGZrUnVib05zd1pGdDdyNzlGd3FKK0li?=
 =?utf-8?B?QTg0aEN6Y2JBNGdKR3c5Ull5M3QwcXBKZ1ZWSkF4MkkzZy9zdEFTSDVOYkRE?=
 =?utf-8?B?VldMY3E2a09XeU9RYU43cEZPc3I0ZHhURU9EckRnTFp6QzdWL1dEOFkxdFdC?=
 =?utf-8?B?b3dOT2xzbjFkeFNTQjJENEtObzM3RWZ1enJxWU96Skh5amZNOE1MSGxYN3d4?=
 =?utf-8?B?b2hjcWg3ZjVvRmpPRXpZZ0RmY01IVUt5RUM4V2xlMkJic253a3pMTWVzUDNi?=
 =?utf-8?B?YnkrRVNwQXg3a0VxUkhoelpDUnU5cFR6YUNHa3J0bE9nSnFmb0taUnE5TEdz?=
 =?utf-8?Q?cOu8c3PLYnK9OEtkDsVLkMAlwwFKBQJZ1MXIF5w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c6805a-0f31-471f-e4ea-08d97ccfe42c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:17:37.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SOn0nmxyIpiNa4GGLBTPAAscpU9iU2OImNjof6+o3lAirSvzjUDaO4WZOudbiZwDYqLt+hU/W9DsdgJK/JxaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

Certain notifications of Dom0 to Xen are independent of the mode Dom0 is
running in. Permit further PCI related ones (only their modern forms).
Also include the USB2 debug port operation at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm uncertain about the has_vpci() part of the check: I would think
is_hardware_domain() is both sufficient and concise. Without vPCI a PVH
Dom0 won't see any PCI devices in the first place (and hence would
effectively be non-functioning). Dropping this would in particular make
PHYSDEVOP_dbgp_op better fit in the mix.
---
v3: New.

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -94,6 +94,12 @@ static long hvm_physdev_op(int cmd, XEN_
         break;
 
     case PHYSDEVOP_pci_mmcfg_reserved:
+    case PHYSDEVOP_pci_device_add:
+    case PHYSDEVOP_pci_device_remove:
+    case PHYSDEVOP_restore_msi_ext:
+    case PHYSDEVOP_dbgp_op:
+    case PHYSDEVOP_prepare_msix:
+    case PHYSDEVOP_release_msix:
         if ( !has_vpci(currd) || !is_hardware_domain(currd) )
             return -ENOSYS;
         break;


