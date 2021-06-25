Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84E3B42FD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 14:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147153.271040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkjm-00073x-9H; Fri, 25 Jun 2021 12:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147153.271040; Fri, 25 Jun 2021 12:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkjm-00071b-4k; Fri, 25 Jun 2021 12:15:10 +0000
Received: by outflank-mailman (input) for mailman id 147153;
 Fri, 25 Jun 2021 12:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwkjk-00071T-Rk
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 12:15:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 591b26a0-93c5-4044-b7c3-d616942fe692;
 Fri, 25 Jun 2021 12:15:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-qHcmV0iUMbKdv2YGaMJiIQ-1; Fri, 25 Jun 2021 14:15:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 12:15:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 12:15:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Fri, 25 Jun 2021 12:15:03 +0000
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
X-Inumbo-ID: 591b26a0-93c5-4044-b7c3-d616942fe692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624623306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKNAiCAkTEux8snV3/fR8a3Zgbg4iM0MzH/i8v9qTag=;
	b=ni9lhuVBwkNPhL3uZ3TVeAgrNgO82LFe1cUfqU/uxRpyfIFyvquhog7ZtkkofjCiKV7jC8
	G9vhOe+6GBy7D0uN0TliR1hIiSZBMif+A1X9Ul6sRPO2HmS6OXdNs6kHKbKj7RvXzrdg28
	NU1glvRCeXwhI3XM2k7JYSgpLWDz7FA=
X-MC-Unique: qHcmV0iUMbKdv2YGaMJiIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+/Z/PUx3aonao+Bn2BfVUmUDRCPWgFKL/E0TrW1ZNTu6gx4k50kKcjL/rZk5lYZNHkB/UDVogt86pB4tTSKFl4El8N9caSIJqDgFeQT/qHTpEGC6BFwhuGALGWgKu7Trmv+4Y0FnWbYY3yHXVatBQwknfxW38YsDY3Ik8XkxjGgzm3sTH+qe3IvhHxMJoHNA8fzkOmN/KXqEpeKGh5jsDlELw+Kbgz1PuWwCJzL4UGQ+j+gJS0DKtcRvLvE4NNKxrHEhIwHBHOb8vGsRlT4rOJskf7jNgharvSg6N25gaNjyHErNUlL9UWvkraX1lzwEn1y7hY4eFHK+T4e+4YVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKNAiCAkTEux8snV3/fR8a3Zgbg4iM0MzH/i8v9qTag=;
 b=Duu4Q1Ir0QVpHQEUocabQ0hQhKbk1NhS+vPAsQdiQOG/wjvc+/0mXN826C97OVMW1ViW5SglOU2GvvQDu01s0jugLr6esbj3h5SyqT4m2IDHtYiy4GcH8ub4ajHvYU9XZ7Uf6ANHfdNL4Be+9BKnfxuErtkXfA2tRlJinu6JoFf6aNReN6jqRn5hof8No5gO0oPo872L9BY/crWWc4QP+hsl6D7ylCO79Pcm609KIcqM6ajC/ji6LaTlHDGtwY21hKuYTkUQeZe1A0+4sX2lMvazvp5I5PaxqBxAl2xUw46rnBZ1qjtmSHalWwejJNYjWP7K78b978woOm6pvLbQsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 2/2] AMD/IOMMU: redo awaiting of command completion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <a6e72235-570b-c426-589c-236f37749e1e@suse.com>
Message-ID: <506e3a46-2103-26f3-94f1-c3243cf41fd5@suse.com>
Date: Fri, 25 Jun 2021 14:15:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a6e72235-570b-c426-589c-236f37749e1e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edacaf42-b2c8-43ee-496a-08d937d2dcb4
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6671FC1D6BF6067C477BC19BB3069@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycVQBW22EgcjfFuGl8ksaS6cFxgw4imrke18A0aXNDbG0wbe2UaLyC/nvtlBFHkL/Qi+DbG/SNClyHR+fYoaBlDVDFNuVOrnD0Ooo7+EYgHoL7p4sgJ1UtfXU8IQMb5Kjw5m3kmrb6SnqBF8hLP0lTqzY69sumAxjx5hnBRVkf1DkI6sTnVASORRQXDRZVR4Z+cTK9C56s0azYxRT+U8mQj177j8LjSvJPZfR2CfmM9Td7Mb80nQ6ozLOFKgdznXlmCiq/9WR/d5QzlwKV2rVnELsQnfAP9byXx34FcF1JcXg19Oitd7o2YndLZVB5FbI1WI+xyiwoBOon9m5oDLiqbYlH1nMzrHnLYoZTp9/DH3ZnauvmY5xubOU+OOFXSbe3TDEnL2wHjchNB2hlDU9JOTUzHM4RWzqJm+NX+HaBjd8iLakIwAK51xHfEUrmLKmi6jYGvaOQSqKex3LKrA0zpVEPp7r43siloIY3LNmQ1eT9gHUWceS1jMMdfUNIvEdAhPDOb3N8Gx6g/iZl4spJXbkNJoWEFgL5Qn8qbLMmtJhCAgv/rNvU8GEC7/Z8SaLX1AFrEbvddg6V3FjDROrWzopfVgncnPzqn2TFxz2bnnHQyj8+rX6Ah4zcpZ5JWpqOiBiA2CibVRFsI2UH3WXNpEp02Z2eFgK7GVL0kZasvheLcLcV2jqfkDvltIpdJy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(39860400002)(366004)(5660300002)(66946007)(316002)(2616005)(83380400001)(38100700002)(478600001)(66476007)(16526019)(186003)(31696002)(26005)(956004)(66556008)(31686004)(16576012)(8936002)(86362001)(2906002)(6486002)(8676002)(6916009)(54906003)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGsrRGlsZzFDRTFNWGNYWXVTczVwaUZKT0pUQmQxYmkxM2JJaUliZXpsbmlB?=
 =?utf-8?B?ampCYWdxNzJhem5IOXBSRUxndG4wUnpQNExZOEFIME52aHM4OThDUWwraFQz?=
 =?utf-8?B?cHRwaVJDN3FnNkJSaU43M3N6RERZOHA5UHBNTjZCbHUvMGV5QXBhVFhWRWVP?=
 =?utf-8?B?Tm5sbkRZeGdKK1VNaTNxZm5pdDZyWWU5cTNMUVlvVXpUQnlTSGRld2FraCt5?=
 =?utf-8?B?WEhZd2c2LzZPSXhVVCs2VURYekc0c3J2ZU5QYjNxbW84M2UyRTlURXhMZGFK?=
 =?utf-8?B?dzJ3TVNkNVRyWVNHRDhkTFEwMUpYb0gvVjlXdUpLYkFYTFBxWjZLb21HMjdx?=
 =?utf-8?B?ZVlKUlJnN3RrZXlET2FSVzJia293bld1ZWloalRDOUczeUZQQU1jUGtuYXpF?=
 =?utf-8?B?aXo1ZE40Q1hYdXJvR2JQbEh0TTNPRm5NTFpSZlptUENWT1FIYms3V1Bqalp4?=
 =?utf-8?B?V09qZytER2xKNldXRDJ5T05UVzNnRmJtMW9Cc1VONVNnbDZDVUxlRVBLWDhP?=
 =?utf-8?B?MVMwWUtKbE9DS2wyQ1loQlBFVXdtL0k3b0JWdnU4alp3Y2hzcGVTK1Rmd2Fs?=
 =?utf-8?B?d1p6OUVBQjdTbDR0amVTZHBicHVkRzFXNW9DWkFxVlYySmJsOHgrMFVVVDV4?=
 =?utf-8?B?SndZRDlWalVhQTcxSXVRWnhQVTBSa05sL0U0aVViOFNnL2Fwc3M5dDlZVitR?=
 =?utf-8?B?S0xzVHZ6elREQzdFekg0V0VwaUtCd2Q5bW0zK2tkditMSmEyWi9Qa3h3N0l2?=
 =?utf-8?B?THM3Q2lKNEZsL2VuVzNJN2sraXJjOGFQWlh3RENZNVhNMThnRXgxS3o1eXhY?=
 =?utf-8?B?SWlLNWlBUWMySEgrREVmam0vY2RjZndEbVdGYWdCTDZkWVlDVTBGOWFXUmFH?=
 =?utf-8?B?dkliY3Bod2NDZjJIc2k2cmNPNUVhYkFyNHdxSHVNT0dVMXN1TDhDalJReG84?=
 =?utf-8?B?Y2tuSHBZTWtQajN1amR6clBoenM0ODVsa05yOElTc2NTN1VkZ3BKTXlCakt4?=
 =?utf-8?B?QTk0NkV1cHc5Z1J6YUFtZkppdDJSSWUzb1hLcWhjMm1taDdqYlloWVJOcGVr?=
 =?utf-8?B?eDlIeG5HaHBRY25jcUFGaDJHN3BiZVE5bzZTbGczcjJ4YWtWRzByL0R4dHda?=
 =?utf-8?B?eW1EdUF3S2JaZGFpVFl3cktnQmFtNXVoR3RJaEk3bGJqcnM5TDdYTm8zalZQ?=
 =?utf-8?B?NyttRE9XZDE3ajNNU2hSQjliNXlFMTNCelVZd0Q3di9ZcEhhclNjNnc0ZlMy?=
 =?utf-8?B?eS92NHFUeUNFRlVYTFozUGVEVEpCSHVxdkhGbUdJQnpCRXRhbmM5MlErUTV3?=
 =?utf-8?B?YTArdWhIWU5LRlcwVGx2eVQ3WU02cHR2cmJ3Ry9zdDh5cEcxS1RLU2hJVHd4?=
 =?utf-8?B?b0hNQlBsSUJuT3dMNE1JKzZSd1J3TkxrZ3k2Yzl2RUxqS0tOOWZjYUtxd1FL?=
 =?utf-8?B?QTVPbHE0K3VWZ3BybUpNemxuQmF2Y01BTEVCWnk2SmZGc25HRXNhQ3ZhWmRX?=
 =?utf-8?B?NktPblVaUjZYTmtDTUMxRzFKWGh4a2hnNDhHaWoyVGV5cUFyaXRiUXZNTllx?=
 =?utf-8?B?N0xGYUVFQkNXTVBHWmNQUHE5YXJTN1lqRjIzQ3FrZkdHSVFoYnhES2dlZWxu?=
 =?utf-8?B?Um1QTG5Nb1RIc2R2cnhkTG5mNkpJQVdkbGYrVmZFT09TVmlIOWJtWVBJdjgz?=
 =?utf-8?B?dUpJS3NnRXJVSGdpZUxXOGIxRGx5VW16Zi8vbis0TlVLcU5ERTBVQ0NjT2kw?=
 =?utf-8?Q?VKH8N/XDEu7SBwM17yE0TyKzqUQN/YSxNRlyZuq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edacaf42-b2c8-43ee-496a-08d937d2dcb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 12:15:03.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drw/EOekeG0kCsC+JnTtXTvEJsK6SdsNxIaxCaPC2Mc6yiXFAvxxCkzyKeeOeVgeJr7cvnkr2rPxMwQP9jDstQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

The present abuse of the completion interrupt does not only stand in the
way of, down the road, using it for its actual purpose, but also
requires holding the IOMMU lock while waiting for command completion,
limiting parallelism and keeping interrupts off for non-negligible
periods of time. Have the IOMMU do an ordinary memory write instead of
signaling an otherwise disabled interrupt (by just updating a status
register bit).

Since IOMMU_COMP_WAIT_I_FLAG_SHIFT is now unused and
IOMMU_COMP_WAIT_[FS]_FLAG_SHIFT already were, drop all three of them
while at it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v2: Avoid set_field_in_reg_u32(). Drop now unused
    IOMMU_COMP_WAIT_[FIS]_FLAG_SHIFT.

--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -178,11 +178,8 @@ struct amd_iommu_dte {
 #define IOMMU_COMP_WAIT_DATA_BUFFER_SIZE	8
 #define IOMMU_COMP_WAIT_DATA_BUFFER_ALIGNMENT	8
 #define IOMMU_COMP_WAIT_S_FLAG_MASK		0x00000001
-#define IOMMU_COMP_WAIT_S_FLAG_SHIFT		0
 #define IOMMU_COMP_WAIT_I_FLAG_MASK		0x00000002
-#define IOMMU_COMP_WAIT_I_FLAG_SHIFT		1
 #define IOMMU_COMP_WAIT_F_FLAG_MASK		0x00000004
-#define IOMMU_COMP_WAIT_F_FLAG_SHIFT		2
 #define IOMMU_COMP_WAIT_ADDR_LOW_MASK		0xFFFFFFF8
 #define IOMMU_COMP_WAIT_ADDR_LOW_SHIFT		3
 #define IOMMU_COMP_WAIT_ADDR_HIGH_MASK		0x000FFFFF
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -20,6 +20,9 @@
 #include "iommu.h"
 #include "../ats.h"
 
+#define CMD_COMPLETION_INIT 0
+#define CMD_COMPLETION_DONE 1
+
 static void send_iommu_command(struct amd_iommu *iommu,
                                const uint32_t cmd[4])
 {
@@ -49,28 +52,27 @@ static void send_iommu_command(struct am
 static void flush_command_buffer(struct amd_iommu *iommu,
                                  unsigned int timeout_base)
 {
-    uint32_t cmd[4];
+    static DEFINE_PER_CPU(uint64_t, poll_slot);
+    uint64_t *this_poll_slot = &this_cpu(poll_slot);
+    paddr_t addr = virt_to_maddr(this_poll_slot);
+    /* send a COMPLETION_WAIT command to flush command buffer */
+    uint32_t cmd[4] = {
+        addr | MASK_INSR(IOMMU_CONTROL_ENABLED,
+                         IOMMU_COMP_WAIT_S_FLAG_MASK),
+        (addr >> 32) | MASK_INSR(IOMMU_CMD_COMPLETION_WAIT,
+                                 IOMMU_CMD_OPCODE_MASK),
+        CMD_COMPLETION_DONE
+    };
     s_time_t start, timeout;
     static unsigned int __read_mostly threshold = 1;
 
-    /* RW1C 'ComWaitInt' in status register */
-    writel(IOMMU_STATUS_COMP_WAIT_INT,
-           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
-
-    /* send an empty COMPLETION_WAIT command to flush command buffer */
-    cmd[3] = cmd[2] = 0;
-    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
-                         IOMMU_CMD_OPCODE_MASK,
-                         IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
-    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
-                         IOMMU_COMP_WAIT_I_FLAG_MASK,
-                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);
+    ACCESS_ONCE(*this_poll_slot) = CMD_COMPLETION_INIT;
+
     send_iommu_command(iommu, cmd);
 
     start = NOW();
     timeout = start + (timeout_base ?: 100) * MILLISECS(threshold);
-    while ( !(readl(iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET) &
-              IOMMU_STATUS_COMP_WAIT_INT) )
+    while ( ACCESS_ONCE(*this_poll_slot) != CMD_COMPLETION_DONE )
     {
         if ( timeout && NOW() > timeout )
         {


