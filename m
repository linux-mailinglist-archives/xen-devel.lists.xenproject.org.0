Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F4E3A0FA0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139065.257251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquUC-0007Ht-0Z; Wed, 09 Jun 2021 09:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139065.257251; Wed, 09 Jun 2021 09:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquUB-0007F2-Sy; Wed, 09 Jun 2021 09:26:55 +0000
Received: by outflank-mailman (input) for mailman id 139065;
 Wed, 09 Jun 2021 09:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquUB-0007Es-1h
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:26:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3973676-3e22-4e97-8941-9ae6bfa5acfb;
 Wed, 09 Jun 2021 09:26:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-Kqnb9FPlOEa-vknXKphazg-1; Wed, 09 Jun 2021 11:26:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 09:26:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:26:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Wed, 9 Jun 2021 09:26:49 +0000
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
X-Inumbo-ID: e3973676-3e22-4e97-8941-9ae6bfa5acfb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623230813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgddFxzuF1jSE6HuT5x1HspbAq09VNpsTBcFaLySK44=;
	b=hrj7DZUPG/nIk2OI+0MUVjCIBN5teWTvq4Nc6rcHDd9NTpRAmHhUSMuYXbtQ+qq+WZy3uj
	oouDHm/r1iRLLP0b8HnBEUcz2xu+QBF8dJxsrh8BHWyGx4Z7AiQ2y/DdgeR3GvSdmRbHcj
	qMljqHRdqvZUn466Hfm0D+deaz4XHs4=
X-MC-Unique: Kqnb9FPlOEa-vknXKphazg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K87rkpShTseE8d/AZoAhISK7jlOrTXGpo4Yy7Ekt7Q8jSx3B1hDULh0j7ZqVOmZBU5NSJUvsjU+RjW3xk4O7B8zxC6H1cpbWxr2evXxxE7/5GZAqqUSH0RmmnjSd0ARXWh3tc01SZkNmR5AdIdahQoDwMuk7OKNCBJwlS8Xe/6dVo2FpCqfwEQc32K7WBNTr1KiXtKh+WSH7O3cUNcrGxOi36PhMX7mnYto5SDvGsxZR67lraQmV/OwlhYpPAOtjYGMKrDlJf9rBD709MHsWrnnRRMH006JRSGLr351EmqmPiIOgrqtMh3qE1hLa7QgctRxn1PSoB6drxQxIUgM39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgddFxzuF1jSE6HuT5x1HspbAq09VNpsTBcFaLySK44=;
 b=geVoSJY9nHs5LLnhLkBpGuWRMqLPolZOZ949NsyjOQPmNSuCKwrGs33hISs1T2BG5LtX9YqvMvC9wui5Ze5D9aFSMb35DaMv/qqD58uXWyMJgCO1eTBDYecDKFFg/63/ztLjXQjIPHh8tDg7C5T79JPeTh1xsQaZWmocdP230jOJuVeOuvdewkOX7tiNwdRKi7JniqXIiveKQ3fhsd53OQ3tENdJ0B4VlO5a+A1hoUcqywUYT6EAGt6Zzul/Ylc4V2uvmSUdEulRsciwAlEl5rKRuJchrJbmVu8xbHpZZmi/aAbXMzCS8CBjrE6+zXpflhkYt1OCbzX+H21Kcx4Vsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/9] AMD/IOMMU: redo awaiting of command completion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <1bb49cce-537e-9fba-80bb-82bf502728d0@suse.com>
Date: Wed, 9 Jun 2021 11:26:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 733fc351-2ce0-46e5-2b13-08d92b28b5c7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3773EC7E85C9DB61B702BE50B3369@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/xL73gIYfIT3ZtoiLLGrm2YEbI0FFMrwQ0fwS0cmfwu9Ltb2RAk1xcBmtQvB1YsdvuXCUl2Jz+nzpEhi2ezjyOrlkAGsxzLfv74aVHK3IIRY2fu7HBZw1Es3P4iKsgQK5Pn+SVTF2P62Tt2BZePiLuRNVe03Ywj5zqqfjdW9hb7GAnyBKRl8SjsKblFKxkkYao2P+uoOxZ79unN8A1DN+pEwE6M36JAQ3LOQ9cA64WQ+uL67U0qPSDHZBQEq1JfWKSZkZgOl4fJZXACPi38KbHzi5ZO1eYzVesCMbIx+WuM1yXi64/jSWKRgqgUYgSHWr9E+KTtZvsJgIiVKIc1v36s6dAbJv5Xx2kebVKB/4U7UoiWpUc702O6YToXDh1H2SxA1wNZLVO+rgHA/YK0SBL7SDF6HAqDpdpS9Sd7J5Ei7AH4CO0VK42VpGgwRNEx1Q0IDAHNywAD9E2hzGRdL3m01Vocmoc4S3EP5qCf/DccAgvWOgSvMrgYmO7Z7FOcPC2Pk09NED3rq0LydHMLPxXxMso7xxN6z2+wMn4aGp0BxKvw+Qc/c2065c+gPK89EKGAi3XA52bG8/C5utsMBYCuP9IZdJKllSnBGBHM2evkDfxzGZwW4q2AsbmDZnKuTo9reRgCrFVboD+Y27WCkFPMv/fXt0lMNP45nmRdiJkBhd6FqwrjmJsHy0u0EL2Hl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(39860400002)(376002)(396003)(4326008)(6916009)(8676002)(83380400001)(6486002)(8936002)(2616005)(956004)(38100700002)(26005)(478600001)(186003)(2906002)(16526019)(5660300002)(31686004)(31696002)(36756003)(316002)(16576012)(66946007)(66476007)(66556008)(86362001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?TjFhdVhYSUtJZndBeDhhMmpiOXNuTHNMV2ZnRktKc01keGVrclZkblF0TndU?=
 =?utf-8?B?VEw3WXBzWkJodVdsRzdxbTYwWmRydGdzK1NMTEsveS9Jc0t0K2RFaXRyV2pF?=
 =?utf-8?B?UDUybExMR3NZd1Z3ZS9vMGN3b3prNFpCVnhLSVA4alYvZU1LQThublhmSEVq?=
 =?utf-8?B?VUhtNGZaYzk2ZElBRGF4VmVXN0R1cjVZSmVScDZKeThPbnJOMjBOZ2pJOE9M?=
 =?utf-8?B?eWhJUEgyVS9SUEVHdGNqc01SVlBCWTFCVFNKYmpnSFM2L1ZkanpUVGVnRXlK?=
 =?utf-8?B?cXM2Q1RVM0pPQVh2cmlQM2lIMldabzdxNDhYd2ZEQ01NS0dROGZ1L3VMc01r?=
 =?utf-8?B?WDQxMk1wRGN6cXlSTFpNUG1PNXIvMXJnZXpsYTdUV0thVG9CTjlTbnh2TjVj?=
 =?utf-8?B?a0s3V3k3MkVvVmJvR3RNK1owVEZTbCtORkNZRFQwbWRHVFU4OVY0dHdITjFq?=
 =?utf-8?B?a2ozSlBGcnpoNDd4eHRlaVlMYnZubmxHS3RZc3RFSXI4MVdWTkRDSnlxZTZk?=
 =?utf-8?B?TXVNQ1hYSTlSdjlsamxianF4M0VJRTFYdWc1RHQ2S0cvSGhWck1EQXZhSmhL?=
 =?utf-8?B?U2w3VkxXQThoM2lxWXAwdVhWQjVjK25tbjgyY2txTk9DbXBPRUsxT1ZMaXpj?=
 =?utf-8?B?blZxbDRMYzYwT2NaL2F1eHNIbGVINXI5VjdKRHRGSVA2c2FrbFkvTlY2eXdQ?=
 =?utf-8?B?eStaRUlaQ3Fnd1krV200c2Z1SUpFd0thMHkxWCs5QzZ3NXgvNWU5N1J3eTR2?=
 =?utf-8?B?emw2bFRMMzA4YjNoTHJMd252MnRLdXRVMkVvZHlId0VuN2taNEVpdkhrejB4?=
 =?utf-8?B?MnFKa3dlWVE2cU53T012azNwNmkvMllEWHdCNFV6ZFBML3BONjVpVlk4ZjlO?=
 =?utf-8?B?a24zVnFrTklScXhVd1laQkRuQmVVTmdrMlFiOVRGS3NzV0g4ZHN6TEZuaSt5?=
 =?utf-8?B?UWFneUdsS0ZBTVlFKzJoNCtaWTFGekw4TU1hd1N2OU10TzRWZkVINFM1N3Bm?=
 =?utf-8?B?TzlJV2ljVW1WUG01TjJybzdMdW5rV3VLRDdFR3lVWThyY3A0OE10cnZFQWZk?=
 =?utf-8?B?TE5uTHZwQXZBK1oxbXd5eUlZelkvem5Ed1h3eE5VMlJ1aFd1cjYwN1BaUkNz?=
 =?utf-8?B?L2NPZ2VNVEhyajBBWjZSS1pUdkhGWks3WVF1K0VidUxvM0tzYTl1cUFONmdV?=
 =?utf-8?B?ejJVYzdxemlkMklWQW5Lak9vdTRtUklCTUNiUklTbHdqTlh0a1FQQzN2dWwz?=
 =?utf-8?B?bGFLcFQvcFZVZnYwek5sR2dJTCtnT1o1UEUxVkx6ZFN1YWs1NC9sT3J5TzZN?=
 =?utf-8?B?Q1Nodk52T0tLeExnZk1BVjZUYndDeVUwUkJlSnhpc29Vd1lFUVVvcEtURkkv?=
 =?utf-8?B?emEydWNwOWdnb0JSUjh1d3RET1h4Q0Q4ZDZyZ1FNVVpoRGNQODdUcDRrRE52?=
 =?utf-8?B?UnZ3MzRteTV1TzVxei9ZNzVuWjJ2TzNTUUpiMFVEazA3RHR3cVJid3BFWnJs?=
 =?utf-8?B?ZktVaU1hcWo3djBVckdzV0JhcTloVUtqRnFoK0JJOGprM2xFci9mT1o5ZXVi?=
 =?utf-8?B?dmV6U3V6Zks2YmRnYlJYUFJ6bUF6dTlQdWFDZTI3VkdZTjVDMzU4aW5RbWVm?=
 =?utf-8?B?dGhvKzBFSmpJQmhHWlNzVjRId2NxTWRVTDlOcWVyRDdybitKUFlnV24zb1F4?=
 =?utf-8?B?VGpnWlIzN21TQldFWGNvcXFxMFMyWTJycVM5UmxUZy9mVytsRGhLTnBQdE8v?=
 =?utf-8?Q?fWMxUPvuax8tFgvpS7bSfxPTaNFHyT/hjXMakRS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733fc351-2ce0-46e5-2b13-08d92b28b5c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:26:49.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZBRRnERhOgNYRzrsO5m0V184YcbiymbapR4H7QxTcEEybn+fgw0B266ztdIuCT2T6ESaiY9tOFPt4qGVG+8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

The present abuse of the completion interrupt does not only stand in the
way of, down the road, using it for its actual purpose, but also
requires holding the IOMMU lock while waiting for command completion,
limiting parallelism and keeping interrupts off for non-negligible
periods of time. Have the IOMMU do an ordinary memory write instead of
signaling an otherwise disabled interrupt (by just updating a status
register bit).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>

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
@@ -49,28 +52,31 @@ static void send_iommu_command(struct am
 static void flush_command_buffer(struct amd_iommu *iommu,
                                  unsigned int timeout_base)
 {
+    static DEFINE_PER_CPU(uint64_t, poll_slot);
+    uint64_t *this_poll_slot = &this_cpu(poll_slot);
+    paddr_t addr = virt_to_maddr(this_poll_slot);
     uint32_t cmd[4];
     s_time_t start, timeout;
     static unsigned int __read_mostly threshold = 1;
 
-    /* RW1C 'ComWaitInt' in status register */
-    writel(IOMMU_STATUS_COMP_WAIT_INT,
-           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
-
-    /* send an empty COMPLETION_WAIT command to flush command buffer */
-    cmd[3] = cmd[2] = 0;
-    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
+    ACCESS_ONCE(*this_poll_slot) = CMD_COMPLETION_INIT;
+
+    /* send a COMPLETION_WAIT command to flush command buffer */
+    cmd[0] = addr;
+    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, cmd[0],
+                         IOMMU_COMP_WAIT_S_FLAG_MASK,
+                         IOMMU_COMP_WAIT_S_FLAG_SHIFT, &cmd[0]);
+    cmd[1] = addr >> 32;
+    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, cmd[1],
                          IOMMU_CMD_OPCODE_MASK,
                          IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
-    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
-                         IOMMU_COMP_WAIT_I_FLAG_MASK,
-                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);
+    cmd[2] = CMD_COMPLETION_DONE;
+    cmd[3] = 0;
     send_iommu_command(iommu, cmd);
 
     start = NOW();
     timeout = start + (timeout_base ?: 100) * MILLISECS(threshold);
-    while ( !(readl(iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET) &
-              IOMMU_STATUS_COMP_WAIT_INT) )
+    while ( ACCESS_ONCE(*this_poll_slot) != CMD_COMPLETION_DONE )
     {
         if ( timeout && NOW() > timeout )
         {


