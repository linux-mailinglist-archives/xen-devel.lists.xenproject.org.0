Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CAE3B42FE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 14:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147157.271050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkkE-0007gx-Lb; Fri, 25 Jun 2021 12:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147157.271050; Fri, 25 Jun 2021 12:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkkE-0007ev-Hk; Fri, 25 Jun 2021 12:15:38 +0000
Received: by outflank-mailman (input) for mailman id 147157;
 Fri, 25 Jun 2021 12:15:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwkkC-0007eh-Tg
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 12:15:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77737e35-c514-4c5b-8033-ffa74c5175eb;
 Fri, 25 Jun 2021 12:15:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-k6S0ZeH3P7KuM3A_VRj4aQ-1; Fri, 25 Jun 2021 14:15:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 12:15:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 12:15:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 12:15:32 +0000
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
X-Inumbo-ID: 77737e35-c514-4c5b-8033-ffa74c5175eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624623335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2pXfNxThTc3rc087ftHWI5WYIVmApjfFkK2DTveZXM=;
	b=dHD6+fsghgnOCHvKjPI7ASnazavsm7lVrZ6G61wcRyt0tT+yKQhUi5XwBxxXm9aIcJZx1a
	iu7RbQR3dviABd3T7f3SQuPUa0CuiM5BSPOzKF3o2dDPw3Xs8aKzc32aM7lujqVnXSl/LG
	g9eBx2MoCqhBfWixeiBEHsQfhzmy2vo=
X-MC-Unique: k6S0ZeH3P7KuM3A_VRj4aQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu+HcT6w9YoF4XBMIguuuJP69r5aSDvdazhydS2JnW8S3bTCFNPrxXz3je/W1SzUf25808xjNlfy8jt/0tw9/R6Bs/jJDG7dGSriy2cuCcMxfMlARZHmvmAvP1NfPnPXLouaEKpZzTBAADtwzITsR2gyYbHx8PceX1T9wkHBl8EhDamyjfqYv2YQv0c5GMQiRs/9N6NE0Rdd8yTOjavkJi4tMzmz7tys9IPj4KWHyVU11jHp1MXNhA1+0xd0cNaopTnSR/7nSwfyoSyp3GNR7KqtocUDEuMgt5dp40Q2UqlbzQMmyp8PtllGojXfpc8efxTf1MXoIV8EOMaFM+NW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2pXfNxThTc3rc087ftHWI5WYIVmApjfFkK2DTveZXM=;
 b=XzLteRa4jde8HmE0B7VgbklpdTYtKT0ky0No75CvhoNLtl5ElvqiRpj5tIw2aHeALW/B1aogfKLqqBv7f97qdKVGLMJgS3oeOdTwVSQxZHU2ZOMPqMZwhJOqA4jZcLKPgqS7Y9lhy2O12b3bX+1pJj1TfAF2YP0IUSwffwg51OUBNy+Cu9Dkmvd+kgn3Vdo9lRw+mTjUt7hZAPhohMyGlfsARNpoYmdOSCQBImnn19rIQ9zZKyX6lhMUHojIbd5OugQic+hrWaJW5X3FbolGoNiYzBczSGnwhirE6B2vC/51xbFb00thpoboM8oemOdD9EVVxKWmM74fQfnnHtt3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/2] AMD/IOMMU: re-work locking around sending of commands
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <a6e72235-570b-c426-589c-236f37749e1e@suse.com>
Message-ID: <80f6365d-4f0d-66b5-b0ab-99dfeb40bd31@suse.com>
Date: Fri, 25 Jun 2021 14:15:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a6e72235-570b-c426-589c-236f37749e1e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93aeae6-ce11-4398-e325-08d937d2edf4
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66710C608228B89EFF7962A0B3069@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ENsAkQuGq6hzi2u5imZ1unHYd9IzvmYKCX2t5RD53u4QBjTp4Xt/9RJLcj+tRAVaQHJl2c7PU6Sfrtn3kX5SnSPIPYiHnz6KnExUkUAOLVJUQhrn/aL4iJ0HQIXBhD4Pqx9chOWdE0TXSPuKVNBD+n3PlqazC1U0OJY1trFcrIq1TnM0TgmrsL5X4RmuwQGGl5jcMYwbg9Mce6zgyQibTi4oaFtBN/MgcYcgOjKHNBjjH2/+xl7IINowiuyVOCkbqkB3L+xkl3LyussOzlqi9uSXufoM6xHCZDOrrKANwQY/9JWwGe5dBuZIrM+uRPGR6/Vv5PPc3ULJpgvlaWRj1+VjmiiMtdKwMh7GcWdMscYG92fhtVm9P5XOACC8e+CfKR3GHKL3cxZOQWN/PCGCBKhmljSMEWIGDZslMMutV2q2t19EEqAVLqku7SQpcToUtIC2MJboKEKBNrd/XtpmM1p8VAhAuKJepG0wU+h4B1DvyXttvWRbVchNAYT7mrCW4d8g7J6Ic7C+TEsl1I7VnrKnWeHX6nJaag1iVLaa/ZHeN846cHFJufKm2GlpHhr7/96zCS2RfWONFaTB2BIY+UVBIFT1gDrby1SR7f0zOaSeu5XxbPRSmvIW9A8KVpFtSNChgeINRJoctSBaL9LOanKrFZjshQ/0XtU+XA3Uix6yg4CWNxY/DzeWkzuNDxld
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(39860400002)(366004)(5660300002)(66946007)(316002)(2616005)(83380400001)(38100700002)(478600001)(66476007)(16526019)(186003)(31696002)(26005)(956004)(66556008)(31686004)(16576012)(8936002)(86362001)(2906002)(6486002)(8676002)(6916009)(54906003)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXo0ZEFqVU5NUDVPVFkrRnFwRmE1NEZzaHlPd0Z4M2x6WU5sZjd1U3VBdUdw?=
 =?utf-8?B?OTB6dXljRCtwcjNOUEJUYlFidmdLUTc1dUtDSlVzZ3V1a2lyZDNkZXVEdm53?=
 =?utf-8?B?eWpnL21HLzFLakNtVVlFeWFxQmQvU09tSUtOYWFhNVhqTldqTTN6dzY5WTJD?=
 =?utf-8?B?b0dHbkxnTVZuYjRETTY1SnpFeVlYZUkwRkRWekJLdDU1MXMyMWQrc0Y1U05k?=
 =?utf-8?B?Sk1iMTh2RWtvM1BhNkZOS1ptc0NTeWtVbTV6R0NpdWE3L3AxdUxYR01ZaGl2?=
 =?utf-8?B?K0Q0R1FaNUVxWDJFQVdRd21iTHN5QWpBS2swWjd2NUNzRjBFNlZiaGN1R0lB?=
 =?utf-8?B?OEpmck9QT0hIcG9OZ1orNmVYcmZWbGN2Ky9pb0tiR1E2Qjg0dXRFaVh6ZTJr?=
 =?utf-8?B?TElSRGliZjlnZS9USkN2Q3FWaXQyMlVydVJWYzVFc2w0NDUrL2hGendjQnNB?=
 =?utf-8?B?MHY1bzF0SjdZNGM4VWp0RnhBdUw5SnkwNU9qalRoaUQ3S25KZllVYmRsZGk2?=
 =?utf-8?B?TUlnRU4wNUhVYTZOR1FvbHhHc0ZpK0dWL0l3Q002WWNCMXFyV205R3VpTHJt?=
 =?utf-8?B?d1pzZndxQ2pOQ3kzRnFML25qVWQrdjJQTllERVNPZEsvb0txVGNBVktQL0NM?=
 =?utf-8?B?emdjQ21Qd0xBMlhwM0o1dytpdjBDbk5lenJ2aCtwTVQxYmUxRUxwRWdJQ3dl?=
 =?utf-8?B?aW04UUFZeUtxdm0xYU9pakgrdG9ONGdMZUNQUnQyVTIrZmJMeElHMDhQYWNy?=
 =?utf-8?B?VmpHbk9oZDNrNytFaDdRenQzU3V3WUE4U0JVbC9wL3cwUkY2RHVjVm9YZnhP?=
 =?utf-8?B?M3c1V0lzb1VjVmwxMTAyeDNEanBTKzVWUVJ5dGV3L3E2U2diMmZVM1lRRUVX?=
 =?utf-8?B?K0p4amlycjZjZFhCd1dTS3RrTWsyanJNM25GMmVMK2Q4Tmt3c1BXZVFqUWl3?=
 =?utf-8?B?VHc2SFpxRGFNRXNLRmlvWlZTdVZtUlZnWjRsYldlQldlNlpJbldKazNtenNx?=
 =?utf-8?B?MlBuSHl5NlVYTW5IeFVhYjhyWi9pbGFsM0QyL3c0aEQ2SndNY3U1T1k0Y3lT?=
 =?utf-8?B?cWE1T2pEdzA4Q3hSNmZJZk9KNm0xVHhsckJTREM2L2JEaGJJZE9zVTUvMktS?=
 =?utf-8?B?Q1AxZ0Erd0c4SHA2Q0NoUmFLNlIzUlhOaC9IRzVLdmo2Qkk0RHRDeDBJMTFM?=
 =?utf-8?B?YlhuUmRyVGVsL0FEeTI4enA2WVR0emtFL1hneXZzbTdaK241b0ZUVnhrOU1p?=
 =?utf-8?B?NmJDMTA1YklqNlRGNW0wSldZYW1WTzBpZ0U1Z1FLdDJ2elZsMC9kV08zQ0VG?=
 =?utf-8?B?LzI4YXhtWURTY0hnNDlxQU1YNGRJcjJzdXJ4QXNQQk12WDVCd3Jnc21nSE5E?=
 =?utf-8?B?RXA1NUIzNFgxQ1QrYlFtZlNNZW8zUVR2N21GdlBBYjFVenpPZEg1KzZGYXRu?=
 =?utf-8?B?LzRxcXJVa1AvaHlMbFZTeVM3Q1M4eHlxYXE4NFp0L2g4U0lVdnRneFFTbWNl?=
 =?utf-8?B?N0R4SDk5WlNiRkVoZVdyRkswL0hSTEpMVXRjazRmWDJsMDdrSG9ZeFdHSFVi?=
 =?utf-8?B?enpJelExSnlRdVlkaFpYSnkvdHMvN1dkNGZ3b3B0RVRVYlJSdEozOWIxMFlH?=
 =?utf-8?B?R3V0UVdvMCtjYjBnSUpRb055RU5rS1JEUmNFRzFaYU0vbktYWU5mdjF1YkJQ?=
 =?utf-8?B?R1NlSU5ycWkwZEkzYkhzeElTbGdReFFia3g3NjBmNTJHTjRRS25DNmcxYXJM?=
 =?utf-8?Q?4Y7k8JoExA/OkWApouiYofWmvE0uRhlT2JeGO4z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93aeae6-ce11-4398-e325-08d937d2edf4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 12:15:32.6063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7Yw0Xy3/Ph4FKkETP5K561FVIbs55WY49hFt/DOQ+zpEY/fon4SK7uh/fk0d8Uh+7n3IfRDcJKP/z1BWzNuJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

It appears unhelpful to me for flush_command_buffer() to block all
progress elsewhere for the given IOMMU by holding its lock while waiting
for command completion. There's no real need for callers of that
function or of send_iommu_command() to hold the lock. Contain all
command sending related locking to the latter function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-work to contain locking to send_iommu_command().

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -27,6 +27,9 @@ static void send_iommu_command(struct am
                                const uint32_t cmd[4])
 {
     uint32_t tail;
+    unsigned long flags;
+
+    spin_lock_irqsave(&iommu->lock, flags);
 
     tail = iommu->cmd_buffer.tail + sizeof(cmd_entry_t);
     if ( tail == iommu->cmd_buffer.size )
@@ -47,6 +50,8 @@ static void send_iommu_command(struct am
     iommu->cmd_buffer.tail = tail;
 
     writel(tail, iommu->mmio_base + IOMMU_CMD_BUFFER_TAIL_OFFSET);
+
+    spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
 static void flush_command_buffer(struct amd_iommu *iommu,
@@ -273,7 +278,6 @@ static void invalidate_iommu_all(struct
 void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
                            daddr_t daddr, unsigned int order)
 {
-    unsigned long flags;
     struct amd_iommu *iommu;
     unsigned int req_id, queueid, maxpend;
 
@@ -300,10 +304,8 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     maxpend = pdev->ats.queue_depth & 0xff;
 
     /* send INVALIDATE_IOTLB_PAGES command */
-    spin_lock_irqsave(&iommu->lock, flags);
     invalidate_iotlb_pages(iommu, maxpend, 0, queueid, daddr, req_id, order);
     flush_command_buffer(iommu, iommu_dev_iotlb_timeout);
-    spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
 static void amd_iommu_flush_all_iotlbs(struct domain *d, daddr_t daddr,
@@ -330,17 +332,14 @@ static void amd_iommu_flush_all_iotlbs(s
 static void _amd_iommu_flush_pages(struct domain *d,
                                    daddr_t daddr, unsigned int order)
 {
-    unsigned long flags;
     struct amd_iommu *iommu;
     unsigned int dom_id = d->domain_id;
 
     /* send INVALIDATE_IOMMU_PAGES command */
     for_each_amd_iommu ( iommu )
     {
-        spin_lock_irqsave(&iommu->lock, flags);
         invalidate_iommu_pages(iommu, daddr, dom_id, order);
         flush_command_buffer(iommu, 0);
-        spin_unlock_irqrestore(&iommu->lock, flags);
     }
 
     if ( ats_enabled )
@@ -360,37 +359,25 @@ void amd_iommu_flush_pages(struct domain
 
 void amd_iommu_flush_device(struct amd_iommu *iommu, uint16_t bdf)
 {
-    ASSERT( spin_is_locked(&iommu->lock) );
-
     invalidate_dev_table_entry(iommu, bdf);
     flush_command_buffer(iommu, 0);
 }
 
 void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf)
 {
-    ASSERT( spin_is_locked(&iommu->lock) );
-
     invalidate_interrupt_table(iommu, bdf);
     flush_command_buffer(iommu, 0);
 }
 
 void amd_iommu_flush_all_caches(struct amd_iommu *iommu)
 {
-    ASSERT( spin_is_locked(&iommu->lock) );
-
     invalidate_iommu_all(iommu);
     flush_command_buffer(iommu, 0);
 }
 
 void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[])
 {
-    unsigned long flags;
-
-    spin_lock_irqsave(&iommu->lock, flags);
-
     send_iommu_command(iommu, cmd);
     /* TBD: Timeout selection may require peeking into cmd[]. */
     flush_command_buffer(iommu, 0);
-
-    spin_unlock_irqrestore(&iommu->lock, flags);
 }
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -449,9 +449,10 @@ static int do_invalidate_dte(struct doma
     spin_lock_irqsave(&iommu->lock, flags);
     dte_set_gcr3_table(mdte, hdom_id, gcr3_mfn << PAGE_SHIFT, gv, glx);
 
-    amd_iommu_flush_device(iommu, req_id);
     spin_unlock_irqrestore(&iommu->lock, flags);
 
+    amd_iommu_flush_device(iommu, req_id);
+
     return 0;
 }
 
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -871,7 +871,10 @@ static void enable_iommu(struct amd_iomm
     spin_lock_irqsave(&iommu->lock, flags);
 
     if ( unlikely(iommu->enabled) )
-        goto out;
+    {
+        spin_unlock_irqrestore(&iommu->lock, flags);
+        return;
+    }
 
     amd_iommu_erratum_746_workaround(iommu);
 
@@ -921,13 +924,12 @@ static void enable_iommu(struct amd_iomm
 
     set_iommu_translation_control(iommu, IOMMU_CONTROL_ENABLED);
 
-    if ( iommu->features.flds.ia_sup )
-        amd_iommu_flush_all_caches(iommu);
-
     iommu->enabled = 1;
 
- out:
     spin_unlock_irqrestore(&iommu->lock, flags);
+
+    if ( iommu->features.flds.ia_sup )
+        amd_iommu_flush_all_caches(iommu);
 }
 
 static void disable_iommu(struct amd_iommu *iommu)
@@ -1544,7 +1546,6 @@ static int _invalidate_all_devices(
 {
     unsigned int bdf; 
     u16 req_id;
-    unsigned long flags;
     struct amd_iommu *iommu;
 
     for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
@@ -1553,10 +1554,8 @@ static int _invalidate_all_devices(
         req_id = ivrs_mappings[bdf].dte_requestor_id;
         if ( iommu )
         {
-            spin_lock_irqsave(&iommu->lock, flags);
             amd_iommu_flush_device(iommu, req_id);
             amd_iommu_flush_intremap(iommu, req_id);
-            spin_unlock_irqrestore(&iommu->lock, flags);
         }
     }
 
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -310,9 +310,7 @@ static int update_intremap_entry_from_io
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
 
-        spin_lock(&iommu->lock);
         amd_iommu_flush_intremap(iommu, req_id);
-        spin_unlock(&iommu->lock);
 
         spin_lock(lock);
     }
@@ -527,11 +525,9 @@ static int update_intremap_entry_from_ms
 
         if ( iommu->enabled )
         {
-            spin_lock_irqsave(&iommu->lock, flags);
             amd_iommu_flush_intremap(iommu, req_id);
             if ( alias_id != req_id )
                 amd_iommu_flush_intremap(iommu, alias_id);
-            spin_unlock_irqrestore(&iommu->lock, flags);
         }
 
         return 0;
@@ -567,11 +563,9 @@ static int update_intremap_entry_from_ms
         entry.ptr32->flds.remap_en = false;
         spin_unlock(lock);
 
-        spin_lock(&iommu->lock);
         amd_iommu_flush_intremap(iommu, req_id);
         if ( alias_id != req_id )
             amd_iommu_flush_intremap(iommu, alias_id);
-        spin_unlock(&iommu->lock);
 
         spin_lock(lock);
     }
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -129,6 +129,8 @@ static void amd_iommu_setup_domain_devic
              iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
             dte->i = ats_enabled;
 
+        spin_unlock_irqrestore(&iommu->lock, flags);
+
         amd_iommu_flush_device(iommu, req_id);
 
         AMD_IOMMU_DEBUG("Setup I/O page table: device id = %#x, type = %#x, "
@@ -138,8 +140,8 @@ static void amd_iommu_setup_domain_devic
                         page_to_maddr(hd->arch.amd.root_table),
                         domain->domain_id, hd->arch.amd.paging_mode);
     }
-
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    else
+        spin_unlock_irqrestore(&iommu->lock, flags);
 
     ASSERT(pcidevs_locked());
 
@@ -307,6 +309,8 @@ static void amd_iommu_disable_domain_dev
         smp_wmb();
         dte->v = true;
 
+        spin_unlock_irqrestore(&iommu->lock, flags);
+
         amd_iommu_flush_device(iommu, req_id);
 
         AMD_IOMMU_DEBUG("Disable: device id = %#x, "
@@ -314,7 +318,8 @@ static void amd_iommu_disable_domain_dev
                         req_id,  domain->domain_id,
                         dom_iommu(domain)->arch.amd.paging_mode);
     }
-    spin_unlock_irqrestore(&iommu->lock, flags);
+    else
+        spin_unlock_irqrestore(&iommu->lock, flags);
 
     ASSERT(pcidevs_locked());
 
@@ -455,9 +460,9 @@ static int amd_iommu_add_device(u8 devfn
             iommu->dev_table.buffer + (bdf * IOMMU_DEV_TABLE_ENTRY_SIZE),
             ivrs_mappings[bdf].intremap_table, iommu, iommu_intremap);
 
-        amd_iommu_flush_device(iommu, bdf);
-
         spin_unlock_irqrestore(&iommu->lock, flags);
+
+        amd_iommu_flush_device(iommu, bdf);
     }
 
     amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);


