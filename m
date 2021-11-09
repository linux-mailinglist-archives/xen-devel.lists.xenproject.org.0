Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368BF44AFDE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224004.387030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSZs-0001OW-6o; Tue, 09 Nov 2021 14:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224004.387030; Tue, 09 Nov 2021 14:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSZs-0001MN-3S; Tue, 09 Nov 2021 14:58:24 +0000
Received: by outflank-mailman (input) for mailman id 224004;
 Tue, 09 Nov 2021 14:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkSZq-0001M1-TJ
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:58:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b11219e-416d-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 15:58:21 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-O32xj_7zOlKiRMqLa-UOfw-2; Tue, 09 Nov 2021 15:58:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 14:58:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 14:58:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:206:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Tue, 9 Nov 2021 14:58:18 +0000
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
X-Inumbo-ID: 7b11219e-416d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636469901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI2I0oSjXvpskejeIS7I4+Eo2D0UJGIdxq3pdjMmjqA=;
	b=kFKX1lSKZa0uPzwEpWPzUeR/Heqxnfg0J8vPA2aJiWu4om/bia6kw8XCHE85+WClxAoY29
	Qxfj0i5l7MX0age+5uWKXcTPpecne3x+4CNjD8R1CLy2vfl7PS8QVJ+vYOvH4m6hLgbIz8
	3Orc2ixklKX2HqlkKaTLTrrR7qYm0iI=
X-MC-Unique: O32xj_7zOlKiRMqLa-UOfw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld9ccBFHjmzCx77rMxovZKtzR2YSMOV4DyDpimUnrTR4eY8M5slkCrM7CmaB0N2InWitY5FtOKgi51FcnnEYsnkzNQRFr273N6Hq2n0XpTJfYu4iVvO5E1wwTEXo6mwXMmJx/ht9Jr4ZMTcZUsF5FL9ryciIqyz/QcE4OxW8kFXrCLOWlfYHrnHKpC9Out09JDwDW6MlVypVBEyGIEfqH1GNIwfd0LjaUoTyTqJei56nxaR2JRjw101GJo8Z/jCrTO/qxusb6AeEQO+oML/R69iCvMffx+AfaUBbP0DXtKC0XHpvTch/NKx7M240hryXd9KUK2cqrGPhXx9xtM603g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI2I0oSjXvpskejeIS7I4+Eo2D0UJGIdxq3pdjMmjqA=;
 b=TLrn4DBjymBTTld1gTKKWVFLDQR+yuXmyZHToeUEIQBKNWFqFlVvKqyNOy+oMF7xJSiCwnzYV+Fi9nlCj92p73oOUyfnNQvVhNtPikacDRP0Dp8JmXyJ8L/BWjDAEz1M0l/aBA3VYPvlGmY1JJFo3ZiHg5lgQSfuH5X0K8edo/tI0xjAuE2zERiGRxuH1iSwrx5K4TElvRl4rsYnM6w1eM7xUn8r/YHnbVLbmf8PWNysLAXNDpva8cU5BWybg8tg7SRr5IZrptQp0IXS7Bh1DvCZmA7wi8q2XswRgZL9BErjMG/jFeUwsrx6+hoAZqyAGsA8IKOV0nrq7Lw0PhKvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <466baa9f-38bc-99b8-6403-24e9384820b3@suse.com>
Date: Tue, 9 Nov 2021 15:58:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 3/3][4.16?] VT-d: don't needlessly engage the untrusted-MSI
 workaround
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
In-Reply-To: <d8295304-d81d-1d11-9bc2-d2539bf5a96a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:206:1::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41849fab-2c3e-4f46-a5e5-08d9a3915dc5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33894696BC93112BA31E921AB3929@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fNr7BIyjC4Uj5m+wZH2t3uTaAf+fffFqQ2+pbpRAmIkZvXhZgBM2fKedOeK5XvUEd/JYSjDrxwyXSAJAWu4Z78uGQVP7pJqTF41TRFaaGZQP2IlbhfdkgmDbmposWmK+o6oI9COTy3nw7CBWHTuSrZtWoG9210PwoaURPCGtb9EkPgG1PFQ9TbC69YenwF8/G8Yh3rrISEl/mwUmDvG3CKZWnB8MIwjqRyu6yg1kBAnL9hn6rcm7AGE6t8vrU+ShJ7qImCLz4MnqkwJTRVEjGKj08g2tmDfdqUQhbRc/4wpWjbsDWTaR5LdUwXOPvaVHP4jIHn517pj1JfPUAIHTEOe6hxHIxxiPjoda5cT/IPGNBqVxOAxAH7pz0sirt7NV0/OspjSrN7Js+CFMAx1LjNR13Qwixe58676oWjDdTI6FA4Ytydik7PmiYYIwRJYF2tnx6kONGpeeG+VAtKUjpSi8Q0hfw93Fe2/McBaOasYccv8dznR332NoDNeLwKy/soN77UTHDAMPvE26099VBIEYm+VT9NPJnyc/M2ZVW+m9L77raLkg/Fz4JHXoTTviUYK8JOupLGONZ7gZH2j0+uYcyLJc8fEmTamf+nKEh2zEdxJCyAxM/Vz4tZCIKlZrrj5YJFQuTtYBnxBqEKxN7T1C5skS9VLQJosiULZwlQDZ5PdWwC8VzDxEOEW2So4V+0aas4OMXs8AbG+QhDciGKrZaXT9k/LSPSncbea8+XQa3xXz45rSTmunDvu4f9xE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8676002)(8936002)(16576012)(2616005)(83380400001)(6486002)(66476007)(66946007)(66556008)(31686004)(38100700002)(316002)(86362001)(2906002)(54906003)(5660300002)(186003)(6916009)(4326008)(31696002)(36756003)(26005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVKV25sTGlraC9rVUlaTkV0UC9yYkdyM1FlWXpaYlNRaHYvTWw0dmlBbnZu?=
 =?utf-8?B?UGM3cGlUeDFjUm0weGJObElnbXBzUWxqNm93a0lUaVUrTERma0pYYzRKM2JU?=
 =?utf-8?B?bTFkblNVVlM5TEZwSldwUDNRZFVHSWM0eHUzZXNxdCtIZy9qQkE4Yk9Fc242?=
 =?utf-8?B?NU84eFU5VE5WcjNucEtOc25YOExWb2MrbmVFWUx4c3JyN1ArYUp5RVJtL3di?=
 =?utf-8?B?dmtpWFRmV1pLdklPVFpFZndMZU4vUkUvZWN3OTUwTDVxZHpRcUJSTWxYTk5P?=
 =?utf-8?B?YkpMS0pZVnpZSjhJL21SeDNXV2NQd0Q2cSszNFB6c0ZyOEpjZHZvZStVRlM0?=
 =?utf-8?B?NVNoaHJyWXhqdFhob3h3ZWFNc2dnaGVLc0ptSHRIMjNPY3dWakdKQUtPNnNE?=
 =?utf-8?B?aTJYS1B0cUcvVXY4bVhBdDJDb3BZc3hRU3hzbG9xY2VSK1FFNTZPVFVZSWpw?=
 =?utf-8?B?S1BYQktCeGJaOWlJaU96YVVLMzdkY1pWb05qNmtyeXRMOXRCVUx2NEw3QXY3?=
 =?utf-8?B?NFVZUitnbERraDRJQ1c4STR2VU14WHQ3SS92bFFnTndEWHAxSnc3Tk1mdEJo?=
 =?utf-8?B?ZmV0K3J5WTNZeFJTQkdLTGZwVUlla1Z3WHVwY05zNS9WOHRpTmtUOTBjcGNk?=
 =?utf-8?B?SC84M0xCTHRTOUVCTU5ocG9xWFIyS2VIbW43WHFwUEduUU9sczdBVmtUWll2?=
 =?utf-8?B?N0JVaFFCYkp3YkRGUFlBOHpuSnpleFN2cTN6UlRKd3JYQ3l6UmxhS05uMFMx?=
 =?utf-8?B?Zmo5T0s5dHpzaUZBNjdBY3pRMm9sNHJwamRiaVkxT3AzSWtRa2Qrc3RCRWRF?=
 =?utf-8?B?LzVxQTlBQlpvNkE5aXBVRzNWbFJjOUJQbU8vcTRJSGMrUThuY3BXbTFWTllD?=
 =?utf-8?B?cVl2c2JkcnAvcy9BWDg2VzhZQW5VNWZVRTdzL0lMemF5WDYwWEVQSEc5TEZW?=
 =?utf-8?B?UUExMmJ0bnJYRi9ZbjhIL1lXNzd2ZG9hSnE0Ri96MDVIN0Z2eWNiWUJ3R3Yv?=
 =?utf-8?B?REd5SnNkSnRxYmpCN0ViRUpjOUVIN2VqV0I1WnpLa0FMUUpDQlNBRjIzVGdr?=
 =?utf-8?B?czc0THE4c2Q0Z2hsN2tHMWRsQ0FCUXNEUHZCQThzcEpFa2NYdDg5Y1dWWXl0?=
 =?utf-8?B?NmpjYzllbFFDWElRazYrWUpjQ1ptUlJaanNoaUdUZXVuWVZNakU3S3pUenFX?=
 =?utf-8?B?TnBoaFVKcUFkWXhmUmU2NnVpQzhwSXdBS2VickFGWTFmS2Jvd2ltM2hHYzZl?=
 =?utf-8?B?N1VKRWZNdnBjTmRzaWNIT1I0UGFrdjgxdUFJMWwrZnlYdDAvc09CRXZFVS9k?=
 =?utf-8?B?ME5hVHVOV2FUY0hTVVY3c2ZkWUFRTUpUNTNFbjVkcndId0MrZ2lPSU44eEN1?=
 =?utf-8?B?U29KZTI3LzlOdThLeDVNYmRuRVZodXRFNWpmckRTaXE4d3k1dG9qV1huYXZr?=
 =?utf-8?B?ZFBFNXR2LzF0bDFUSU93WEtBMVUvYkFYNjZQV00vN0ZReXI3QTJOT094R00x?=
 =?utf-8?B?ZmtRRytLYll5Nk40SUhHZ1M5ZHp4ZTJ2UkE1S3YzS3ZJZGVUZ3FyeEZ4NUR4?=
 =?utf-8?B?alp1OTk4OW9ueG9zYlZBR25SM0ZkN00rb2Yzb3VGaEJHUmhSMlAvM2xuV0kz?=
 =?utf-8?B?eVRTcVhqMjAvcy9wTlptQWI5WUZMSXFOdmRIaWlINjRlclBVTWVsVDJxZGl5?=
 =?utf-8?B?UGx5YytwbSt1VnFsUERuK2I1ZXUyMHQ0N0RQOWNzbmhKN0g3aG41ZXVCa29G?=
 =?utf-8?B?N1Mzb01FV3djaGg4Sy81MGt4a0JYcFVKOW9lZm15aFp6WXEyVEZZSnRLZjhw?=
 =?utf-8?B?YklyalV1Y3lXbU1XRkJ0UE1Uczg0NFVNUFZsUjdJSVBhblJ4N3BvRHNBZFJl?=
 =?utf-8?B?SlFjZVR4ck4rdlVwMGF4YU9VUjdwR3Z6b3QwdW9kcHRCMjVCL3Jla084b0hO?=
 =?utf-8?B?aUYxM2lqTUJXSkxxU2NpWFVjd1JYQWFBalNNbXlhRkR6bGM3cEtpUjJQMjhE?=
 =?utf-8?B?c3BSc1M0Q2tHNGJGTmNQRUlaRzJoZ3R6V3VTTHhqR0dHOTFQK1Uwem9CekhI?=
 =?utf-8?B?bWl2NGN2SjByTmVwSTBPTHZ0Um1jQmJVV01lb0U3RG54M2dQNjNsTUp0cmg5?=
 =?utf-8?B?ZDZpSEZoSkVlNXcvd3JZbWhyN0pFd1dkNnRZOVRBblUvWHVWbTR5M1FubmNr?=
 =?utf-8?Q?AHzR+JaTiwDmu4eclkYiypI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41849fab-2c3e-4f46-a5e5-08d9a3915dc5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 14:58:18.9684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uizStdT/mh3ugemvhO+a1TWJ34x0tm95ZOIVrWW0a0wycBjoGo4HNW0uvoxTAP45P8aNNB8jCTw7AYTZGQRkZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

The quarantine domain doesn't count as a DomU, as it won't itself
trigger any bad behavior. The workaround only needs enabling when an
actual DomU is about to gain control of a device. This then also means
enabling of the workaround can be deferred until immediately ahead of
the call to domain_context_mapping(). While there also stop open-coding
is_hardware_domain().

Fixes: 319f9a0ba94c ("passthrough: quarantine PCI devices")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2404,14 +2404,6 @@ static int reassign_device_ownership(
     int ret;
 
     /*
-     * Devices assigned to untrusted domains (here assumed to be any domU)
-     * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
-     * by the root complex unless interrupt remapping is enabled.
-     */
-    if ( (target != hardware_domain) && !iommu_intremap )
-        untrusted_msi = true;
-
-    /*
      * If the device belongs to the hardware domain, and it has RMRR, don't
      * remove it from the hardware domain, because BIOS may use RMRR at
      * booting time.
@@ -2455,6 +2447,15 @@ static int reassign_device_ownership(
     if ( !has_arch_pdevs(target) )
         vmx_pi_hooks_assign(target);
 
+    /*
+     * Devices assigned to untrusted domains (here assumed to be any domU)
+     * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
+     * by the root complex unless interrupt remapping is enabled.
+     */
+    if ( !iommu_intremap && !is_hardware_domain(target) &&
+         !is_system_domain(target) )
+        untrusted_msi = true;
+
     ret = domain_context_mapping(target, devfn, pdev);
     if ( ret )
     {


