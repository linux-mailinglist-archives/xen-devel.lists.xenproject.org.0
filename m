Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B012511533
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314899.533179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfMK-0006af-AH; Wed, 27 Apr 2022 10:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314899.533179; Wed, 27 Apr 2022 10:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfMK-0006Yq-5z; Wed, 27 Apr 2022 10:57:24 +0000
Received: by outflank-mailman (input) for mailman id 314899;
 Wed, 27 Apr 2022 10:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njfMI-0005yh-PX
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:57:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d029cfa0-c618-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:57:21 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-rO4iQjY-PHWxUV11zXxh5A-2; Wed, 27 Apr 2022 12:57:20 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB6185.eurprd04.prod.outlook.com (2603:10a6:10:c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:57:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 10:57:18 +0000
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
X-Inumbo-ID: d029cfa0-c618-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651057041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yLsc49pkrpA56zUyBj4602Mqp4cWTKF+G8J0s3Z4fRg=;
	b=n7LlQBLqBx0iwnV+icIpILtplnc/NK5ST/fuVBc3Hzt4toHEPy568Dg83BfJNAu+sGqiVa
	EO4/iHETS/OZ+cF874iJcDOZZMKnSssThsmYzAxMwm3lbBG5BNyAHhi1FLyF6PwubP4HWQ
	dcUq0VDRf2A76Rkf4VKuolHKqaSAWn4=
X-MC-Unique: rO4iQjY-PHWxUV11zXxh5A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDwhmVTvsJh79p3LJPi+I2/HnbILotQW4DB7i+l03roi6lhmIezfy5VMdZ2ixKsXI+My6X8xOZ4Zc36Rj5ual+bwlJWvjQicieaRJlZ7oHuI5wHXAY2axHU2Wh2cAC5AkCMDtx1Gqt3xSOMPHfAHZnOnlpivqIpKlC+pXOwLHuQUYlHcSy0XGidaIpSD61PokjQwlIIyD/HSLXNBU98A1QqeckieR22XUfKVvOztMdYnk1m65mjoZkr1qpESsE1m5oyVbDGkkzwvgezIHrAha2lSgBlVHT5sIZNmleQ4x8NpoyUrpCck+eWYYtaE89fbc4wdn7tVJdAiTjWi9NIOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLsc49pkrpA56zUyBj4602Mqp4cWTKF+G8J0s3Z4fRg=;
 b=IIxGXsqPv+mufyWXk3Y3Ok080Ujlz2mF5WAvGEL2LEKE+N+0TObSJpMU+OP5RHd/ph6LzJ+uZXNUf86Yvx3/RNqDrkdfMJipt0dpYXbSUi2jcnJ2LvQhHCb9ELz6MAhamtzWlC+ZwTTJTHqNMsGt50X4pF9ecbHIxqC7xCWa0KgiH0eTcD9odhnXMYug5GxcC64blfI1sSg60jdGjCIh/RFoCXGUalkzux/11nreFqkbC+3HauWGRRV67pFSKr7z5ezEUuBmDD6a8O64Cyi5c5YE+DmCP3fRt78LDWLGaWjPbpK0Dzpdz/1KPWWWJoAWLjLHc4YZGEHviRhQqnf+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81ba388c-66ff-e191-0098-2f88a004105c@suse.com>
Date: Wed, 27 Apr 2022 12:57:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86+libxl: correct p2m (shadow) memory pool size
 calculation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0027.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::40) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c62aca91-2660-42d5-f177-08da283cb267
X-MS-TrafficTypeDiagnostic: DBBPR04MB6185:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6185C19CA820052E1ED85A08B3FA9@DBBPR04MB6185.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RbDpOik6dQOOQaiCLo846KbmMKV/HHziwgCWB+fD8TaawyQ3V+YrWu2Amtqjfnb2NRgWSEmVvmRrp6fOYlKeSUJv3gOcuKKaOWzFhgliykQ9+T6UGZXIZqlv9kGSxFZBtx5nfi/dsqY35SNo+/dFZfpJfp4K/VyVTwKNkEIO+fJN8hzScHTGj43+Rw2Hg6VvJH9dx/cFm8sUHxG7CwLLAqDv23JWYo2T2awX/B4mJSQarZp2YUlkQ4DOTrp3h21EKxRmkHcnbPIaXXJZftC5kcxEeqQxjqpzV5iYFhEMEZDyIYykXaBbyyKUorn0zFr4cDblpJNTRiU0UQLgJd46JUAQPSmVo8sHwPtSO7wY9JW68uN1VXGkcJb6wfj97gKbz3gdyC0u6Zm4FwFmVkA9+bsNoLTzi1ZzOJvN084xSegZcpj60+XeXoLDu9aU3se4huKCpyyN+4H/6Q+E7lWP5uc69WmrL/Di8pEMpTgMz6h6QgjjASIK45ZAtddR6WEcBqgYlS9yEM8xRE/HEmfWdW59HZ/q4WsrbWyHxBEzVbDr7c/YpfmWaW49gw4E9egVIbQokD2XjsDkOmu7roous6JLIeN8fKPxEpD1kytnoAJoqyFZS1NGqbWlC3ctXtlznW/HZvwzwohfR3qCRziGsbmF6wcA5eBu6QRHpMVxQyI7gQXUJQabia+uCf3AaOAVnpETNo+sbbeiEld4vWb20m12FFyaVTbk0XtMVuyUOo9nEuta112jtTWXRDBRvcD/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(36756003)(6506007)(31686004)(4326008)(6512007)(5660300002)(26005)(508600001)(6486002)(54906003)(66556008)(8676002)(66476007)(83380400001)(66946007)(31696002)(86362001)(316002)(2616005)(6916009)(186003)(107886003)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1crSmtKZG91YThjQkZTR0xOV2NGenlOYVhTMVlpNjJNTFRzdnBVcEYwemRN?=
 =?utf-8?B?UXVSZGxCYUJjbzdMcEpFZ1kyQTlDK3ArYWpXSlJINmNNZ2IvMkNrZzNYbWgr?=
 =?utf-8?B?Z0t3QTBRQUc0VXBwTFBsSUFvWTFyYm5CTS9OWFVDcEo1T1NqclVvMkNKMHp6?=
 =?utf-8?B?eCsrYVZVK1RnRlFFWkM3eW1qZi92eGdKem1wUTArbi85NXA3bU5XT29YeDZs?=
 =?utf-8?B?SGxDelpvUHdtQkJoTlY1WTJjVEE4ajQ2ZWRMNGVEL25scnlPbWhKM0cyNWFz?=
 =?utf-8?B?QjlOWndGWjA1RXJITklWQ0dwbnhBVU9wRjlRNElreVBxc2ZCb05aeWgzSHIv?=
 =?utf-8?B?N0NLR3krSUhjUExoU3Z4VDV6Sk9hNmtxZVZnKzZ3MExHU296UFkrbGRYb2pl?=
 =?utf-8?B?aG9jakF4anBjenNDLzc5WVVpZXB2RENwbUFYZHJDL2FIclJuMkRIWGpCVHpN?=
 =?utf-8?B?QTVNYlR0QnBlR2lRc0Q4N001dDB2bG54U3lRUlF1cHBocTZKOTNScGVhSFRo?=
 =?utf-8?B?Tjc1V0xCN1kxQVoxYzY5Q2J4NmI1NHlGZGlaSlNDdHlzU1FlSEN3Q2RaTXpu?=
 =?utf-8?B?eVBWS1puQUkycUxhcHpNc3c3dndXbEljL2pxUEoyRDNsS2ZCRlJlTnJucXlH?=
 =?utf-8?B?SUVCSVU4Tmd2Z0FVOFFKbkQzekoyRGpxem5tdTdyL2lTb1M0b3Y1V0JlemRt?=
 =?utf-8?B?Zk9oUVlrMjh5VEdsVnF2NGlJWmljdGJuTWY0QTI1QWJXY2QyYzNLbkEybmZn?=
 =?utf-8?B?Vndpc2xua2JhbDM3Ukl5Q1d0a1ZYSWxvUU12Ym05dXY0VmFJM285OTVvN2tF?=
 =?utf-8?B?MWNDMmk4YlloREZ4dkR5N2FoUFpwUERWei9uYThhMHY3UU5NV0FIZXNJd0tD?=
 =?utf-8?B?WmZSTWdsUmJuUmd1VkptUjRVVkhGTExjelUxU2FQaDBNU1R3MGV3VGZoMjcy?=
 =?utf-8?B?NzhQOW9CQko0dU5TZUVHWlNUNW5ySlZ2cGxUN28zRWNUU2t4bzJQOEhyVThL?=
 =?utf-8?B?bnE5ZHpFTkdkSUZjQWFLUUgxZlpsRDBNbHp1UHRxL05rWlhkZlJXaVphWnl3?=
 =?utf-8?B?YkZYTjZ6d3c1Y3FaRXFPMjBLT0J6Z21ML2FmTDFhVVZuZHFMWGlaRGd3RXFh?=
 =?utf-8?B?ajMyQTJJUFpRN2tZa0hyQld2Z3RMR3lEeUFWZTlZdHZDWk5rTXQ5S21abVF3?=
 =?utf-8?B?Q3I5b2JZVG94Z2J5VGRqZUw3V05SdXZjQW9COHFXeUJMTUNYSGxPL1RMSFg0?=
 =?utf-8?B?RW1kNFZIaVU3RVFKVHU3cnpmUEdlY2REK1BlTXltMjVPeTVBSUxDdEdMSU1U?=
 =?utf-8?B?ZGtDdU9Ja2RpeDVkdjRpOVhyeXgrbTNvS2hDYW9mTkhoSzl6YkI1N0ZUMDRk?=
 =?utf-8?B?c3A4NEVPcTlzcS9rbm01aTgzSXlYSFEyYmhhOUdQZ2s3a2RsWGowZkdyOXI0?=
 =?utf-8?B?dkk2UDhrVlE0eXUwUFg3U1g1elhGWE1kM0RmZi9jZkZpcW5DVVk4aDFLQ2t0?=
 =?utf-8?B?NFhSaXhMUEVITHhBRVU3ZTV5SUd0aEpvbllQQ0ZYdEo5VjhSQ3c3Q21jcFVP?=
 =?utf-8?B?M2ZBL1ZDWUJiTlZ3ZWNsOVpRSHdwMVBKalRCUDJDQnUyNmRoOHFKV0E0eVdC?=
 =?utf-8?B?bGJNQVV5VTkwK0NQS1lNK0kxRWwxdlgyakV4OWNqSFRBWS8rcysxVHkvK3Jz?=
 =?utf-8?B?ZytJbWxDMWRqbnZrNUc1SVFzZlNXTlEzNnNLQklId0JjRndhSFBEK0p1VzNZ?=
 =?utf-8?B?cWdDSUxuOUZFS0xkUWJwNnFoQUlMVDNreXpMM1A2V0Fta1JvYmQ5RTdMU2FI?=
 =?utf-8?B?VkVreGxXL21uWEhGRXpwT3h2WW9WK042VWN2WHFITitVVXpLVUViUjg3T2lm?=
 =?utf-8?B?OUxRbEN2eXNxMjZramRaaVgrNHBiZHNSakpMbFI2akVEN3pRbG81Y0lYeFRW?=
 =?utf-8?B?QXY0V05ldWJsamU2c2NtbGEzOWZtUVBlRGxXYkVtalNxRXcvRjYvVWVyNDBX?=
 =?utf-8?B?TzhvVmVOKytER21vMnFUYkVKZXVTSy9nL01kT0lOdzltOHdDT0NBTWttOGR6?=
 =?utf-8?B?V2FScnd5Z2lVbkVQQXF6NmlJaDBLTkxRZGhGZFZOdEkyeUY5eUJ0ajRWVzBT?=
 =?utf-8?B?YXhrNms0TU1tYmMySmpEQVg4ZzV4eWVvN3M2RVZzRmJEbGoxelBGMzdJcHg0?=
 =?utf-8?B?RWZIS1VVN1BWVGgwNEUzL0h4L1AyTnFOYmdEWFUyV29tRWlrN2hmWkg4N3Uz?=
 =?utf-8?B?S2pTcGdPdEtaRExtL2hsbWVmcUh3aWgrM2h5aHNyYWZsVU80VlZzV2NIeU1C?=
 =?utf-8?B?Yk1RNm9rRmdLb052d0pQd1M5YS9LcCtOdkVlZ2dvY3RkMGtiUHhaQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62aca91-2660-42d5-f177-08da283cb267
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:57:18.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZwGBkSBPtoBz83ubd3jPJRtCzILdamRIcyQgonByYbG624bZDnCVFpTC1g4GVIP7R1BhEFRMzpFfplC56xeyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6185

The reference "to shadow the resident processes" is applicable to
domains (potentially) running in shadow mode only. Adjust the
calculations accordingly. This, however, requires further parameters.
Since the original function is deprecated anyway, and since it can't be
changed (for being part of a stable ABI), introduce a new (internal
only) function, with the deprecated one simply becoming a wrapper.

In dom0_paging_pages() also take the opportunity and stop open-coding
DIV_ROUND_UP().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Refine expression in dom0_paging_pages(). Update comment there as
    well.
v2: Introduce libxl__get_required_paging_memory().

--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1017,7 +1017,7 @@ static bool ok_to_default_memkb_in_creat
      * The result is that the behaviour with old callers is the same
      * as in 4.13: no additional memory is allocated for shadow and
      * iommu (unless the caller set shadow_memkb, eg from a call to
-     * libxl_get_required_shadow_memory).
+     * libxl__get_required_paging_memory).
      */
     return !CTX->libxl_domain_need_memory_0x041200_called ||
             CTX->libxl_domain_need_memory_called;
@@ -1027,6 +1027,24 @@ static bool ok_to_default_memkb_in_creat
      */
 }
 
+unsigned long libxl__get_required_paging_memory(unsigned long maxmem_kb,
+                                                unsigned int smp_cpus,
+                                                libxl_domain_type type,
+                                                bool hap)
+{
+    /*
+     * 256 pages (1MB) per vcpu,
+     * plus 1 page per MiB of RAM for the P2M map (for non-PV guests),
+     * plus 1 page per MiB of RAM to shadow the resident processes (for shadow
+     * mode guests).
+     * This is higher than the minimum that Xen would allocate if no value
+     * were given (but the Xen minimum is for safety, not performance).
+     */
+    return 4 * (256 * smp_cpus +
+                ((type != LIBXL_DOMAIN_TYPE_PV) + !hap) *
+                (maxmem_kb / 1024));
+}
+
 static unsigned long libxl__get_required_iommu_memory(unsigned long maxmem_kb)
 {
     unsigned long iommu_pages = 0, mem_pages = maxmem_kb / 4;
@@ -1194,10 +1212,16 @@ int libxl__domain_config_setdefault(libx
     }
 
     if (d_config->b_info.shadow_memkb == LIBXL_MEMKB_DEFAULT
-        && ok_to_default_memkb_in_create(gc))
+        && ok_to_default_memkb_in_create(gc)) {
+        bool hap = d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
+                   libxl_defbool_val(d_config->c_info.hap);
+
         d_config->b_info.shadow_memkb =
-            libxl_get_required_shadow_memory(d_config->b_info.max_memkb,
-                                             d_config->b_info.max_vcpus);
+            libxl__get_required_paging_memory(d_config->b_info.max_memkb,
+                                              d_config->b_info.max_vcpus,
+                                              d_config->c_info.type,
+                                              hap);
+    }
 
     /* No IOMMU reservation is needed if passthrough mode is not 'sync_pt' */
     if (d_config->b_info.iommu_memkb == LIBXL_MEMKB_DEFAULT
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1569,6 +1569,11 @@ _hidden int libxl__domain_need_memory_ca
                                       libxl_domain_build_info *b_info,
                                       uint64_t *need_memkb);
 
+_hidden unsigned long libxl__get_required_paging_memory(unsigned long maxmem_kb,
+                                                        unsigned int smp_cpus,
+                                                        libxl_domain_type type,
+                                                        bool hap);
+
 _hidden const char *libxl__device_nic_devname(libxl__gc *gc,
                                               uint32_t domid,
                                               uint32_t devid,
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -38,13 +38,8 @@ char *libxl_basename(const char *name)
 
 unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned int smp_cpus)
 {
-    /* 256 pages (1MB) per vcpu,
-       plus 1 page per MiB of RAM for the P2M map,
-       plus 1 page per MiB of RAM to shadow the resident processes.
-       This is higher than the minimum that Xen would allocate if no value
-       were given (but the Xen minimum is for safety, not performance).
-     */
-    return 4 * (256 * smp_cpus + 2 * (maxmem_kb / 1024));
+    return libxl__get_required_paging_memory(maxmem_kb, smp_cpus,
+                                             LIBXL_DOMAIN_TYPE_INVALID, false);
 }
 
 char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -314,12 +314,15 @@ unsigned int __initdata dom0_memflags =
 unsigned long __init dom0_paging_pages(const struct domain *d,
                                        unsigned long nr_pages)
 {
-    /* Copied from: libxl_get_required_shadow_memory() */
+    /* Keep in sync with libxl__get_required_paging_memory(). */
     unsigned long memkb = nr_pages * (PAGE_SIZE / 1024);
 
-    memkb = 4 * (256 * d->max_vcpus + 2 * (memkb / 1024));
+    memkb = 4 * (256 * d->max_vcpus +
+                 (is_pv_domain(d) ? opt_dom0_shadow || opt_pv_l1tf_hwdom
+                                  : 1 + opt_dom0_shadow) *
+                 (memkb / 1024));
 
-    return ((memkb + 1023) / 1024) << (20 - PAGE_SHIFT);
+    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
 }
 
 


