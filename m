Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9704844E4AB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225126.388811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTsL-0000cI-Cp; Fri, 12 Nov 2021 10:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225126.388811; Fri, 12 Nov 2021 10:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTsL-0000a9-8S; Fri, 12 Nov 2021 10:33:41 +0000
Received: by outflank-mailman (input) for mailman id 225126;
 Fri, 12 Nov 2021 10:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTsJ-0008JA-Hm
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:33:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff80c83e-43a3-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 11:33:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-bGtHyApfNnCUAUPxQcNC3w-1; Fri, 12 Nov 2021 11:33:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Fri, 12 Nov
 2021 10:33:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:33:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:20b:312::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Fri, 12 Nov 2021 10:33:35 +0000
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
X-Inumbo-ID: ff80c83e-43a3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636713218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=119T01OvQDSJZiVFnQp9OnVNrOzjtoeevn1TMHaqy9Y=;
	b=eOk4AzELouEem5LATIxWOz5mbYuymMpH6vS8hwWTSYBd61zUH+9ej6yZhCHX3CiNeQwcPt
	HYA46ZWdmJxD0bpd1kQjcSI6cdB64mPD0VVrAoDsc6ThETbWaJILrfSxaj8xdzdUP/Nd5W
	mQFTo7WH7il60cAhLWUZkgarLxb7fy8=
X-MC-Unique: bGtHyApfNnCUAUPxQcNC3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly3uqgL6f7AnYvGAH15dThTyrQYDEDkXBDla1UaFKVOfflL3bwxYS+TB5POiBI3a5iTac9NX/ZYKSQG2KIjLESYZ92/BwD5+zPfEtq6/1h/o5hrF8AM5uh5bncWsoEeHwPVJeo6OsxoUYD0T91zLGrxsWB+89Q4yP7jNrs2hpSYsalX5iTvpApjOEdHq9EYLNUeG7BsC9IUwEfk0ZnQq7jWL+5zlG7bnn/APQv1JEP8azP4wKXng8xuZmmuVjDYDTMGMfVncNXrzqRPFJlqzvDS+LG5LJCj1CAaphIl0kC7k23RbUV+uJqCgvJk1dIJnW5V1xHd5PGrHqRmYLMC+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=119T01OvQDSJZiVFnQp9OnVNrOzjtoeevn1TMHaqy9Y=;
 b=IoyvklUvwEy992ZW+C7heIWUZS2+r1rVdgWPHBuVOrNfopThmpHKt10m8e4z1wAV7cDkjsee2xyihqb+DzEh/aSFpKg8zwsdggqN/fwaz+IuzfrJIshTaiOpH/BUSRB/f0ZkFRUe3OuexqP05bGVo4fky+zuw/YHxWDUj9oRHHHxS4AtRvHd84pLg0jzlk0LXGsqpp6rDvIg+CAK98jFm7vCYBWONBMznDet4hcQwZdXIt8ukOGXT8sstwG1ZXJo6Ip8bTheIGMMM/J/LlhHkINdHmp5WOyhLFRFbX7TI7gwjdnrvIE5WcXoEGgFLf6V8fYO5JEIdvLuXHrtTr9Wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ca809cb-1768-639c-3f58-c5e2c343b1e8@suse.com>
Date: Fri, 12 Nov 2021 11:33:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH RESEND 3/3][4.16?] VT-d: don't needlessly engage the
 untrusted-MSI workaround
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
In-Reply-To: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d50a6da9-2423-4f78-037e-08d9a5c7e201
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB704079AB7EE0F8F8BBFA61A8B3959@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bviTnOqdo1JJcgaTGzR2N1aK9CglvjQzvBuhWste4cmLtBlyQOpLbx3L76siChQBnm0ySS9+YA9OJ1MZZAbV94xc75VCZeSBD00UxAmuq6xhnRXk6GJ6e00pXJWhPoZ9a7puu9Us0lEIehcrtSuMpre6DIecAiEPOfsZtXXTXhgWgckXF/8DQ4+WPjLWkct8n8DuabOBnSbH57hPwRWr3KRVcVVPO07sa7ySSck5n3FiILVieyGUmmM/lrY3j0PKfJ5+b1FalQCuNwRpcuan7LukjBdBKnJxPS9QwjFVHQHU/IBA7F/6kOxahcdt2sMO/r9YxW2SO8SQZE86mSspSllysOOOTapMADZ9leH//VTVlKp8zBohPF3ndoehBSlpWkVPFunq/kf5UKrWdPmTuyhldOP/4NL/ktbPsA1HtOL27iLRU3p2Q8n1KPShAl/1LSOmXdM/hoQD3V61rdui4ok0djXAZ6P4LWyY2NYCV1AeszzNltBG2446W4fpkAKkzdk2BUsE3xBoGhrw4aGdIq26fqcEXZwh4Q65z3wwGVOSXUW/Ihv4/e+Iw/hCzQ2iIfvzzL+AzEWsW2SagdoN0MZJY/hYrtRrct7oxKuUrI3EcjX07xfKyU41bFElS6z2nno+NbRENbYhZUAZYH893uu+xrntxKiOEkdzmqrg8CPb2b0O7cR32715aeTcjjck8sIyOKsXjEKl42eGs5r3QGkQTya8p1vJsL1b6FKfFsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(2616005)(26005)(508600001)(38100700002)(36756003)(66476007)(66946007)(6486002)(8936002)(86362001)(4326008)(2906002)(66556008)(6916009)(83380400001)(316002)(5660300002)(54906003)(16576012)(8676002)(31696002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHZVLzJjN3BWWHJDdjhFbDlsUkJXRHNDWlNoYTg0dzd4WU85bGpGdEVvb053?=
 =?utf-8?B?RWxtVFk3L3A5NGdPRGs3N1RFQWFoTmNhK3pwRGkyY1VqMHhLbVhGcG90UFJF?=
 =?utf-8?B?Skx6UHNsb0FHeXVvSUJLMVhtNEJwTXNVUE54SmVPOXY4ays0eUQ3eWtVZ2ty?=
 =?utf-8?B?SE5DL2V3ck4vWFNNbnNDYWVRc2RLTEIrL3Jjakt2VzRQbDhxZG05NW1YdG1v?=
 =?utf-8?B?WVlKb1grUmxyNk02RXlrQWd4akZjNVB3QkoyOTJuS0ZlZ1JIcDdCdkpSR3p0?=
 =?utf-8?B?WXRqUVV2bUNpYTlQRURxUkJUeVBzRE45Vlp4TC9NTVM0ZURQT1huYUdrb1Y5?=
 =?utf-8?B?R0Z0UkRvdEZpOGlsV1l6TTZkSFg1RFBrNWdlTUs3aitYQ091S3RkOE1PV1ky?=
 =?utf-8?B?WHBGYzd2cURoZjBPdm51d0FWMmxGVHREeEVkUUdFOHVqVzZnc3daNkNjTm1X?=
 =?utf-8?B?alJFNEFZQ28vNUpzNDRyVFh0WnR2M2NOQ2ZzWkVJU0FPblVwYmtVUzFBTU82?=
 =?utf-8?B?REVycGFyeUZGbURIM0paVS8rK0s5UHdqMllja3VIbVhwYzVXMFZXTktZeXhE?=
 =?utf-8?B?TGhBdnJ0WkdBc2Y2SGJvUEdBS1FkRzl6UUR4emJHaGdQbUFVNzlzTVZoV0Fj?=
 =?utf-8?B?NUh1ZWdjbHdzaDNmMXdvc3FybCt4TjcwYVdMa3h6TWprdmM0azQyQWV1aVRw?=
 =?utf-8?B?MXZ4dkFjdlJORyt4bkY4TGtKa2QxL3dRZjhBdUJLa2piVTFuWWpZeWFnbCs2?=
 =?utf-8?B?eUxzcGE0SjdKb1llNTN0RlZ2OGVvMUlFRzU1WGRRY2I2ZTBtRHV0OWxUSGpF?=
 =?utf-8?B?WDhBd1p0V2ZVdEdEa1o2elpFUkVpMEJ0OXBvM2lmdlFhbjJXU1N0akFndW5Z?=
 =?utf-8?B?dEJNYStzQk5Dc0RXL1JRaEhwSFdyamhYd1lCcVJwKzNPbTh5K2hnSXA4WTJH?=
 =?utf-8?B?ajRLN0s4RTZub0llVFFHdWZaZGZXdzVzQzYrRnRLK0lUTUV1aEJqblhjRTdG?=
 =?utf-8?B?RU0ybVdOOHNJd1hSS0ZHSHlTSGk2OStDZFg5c3N1QXkrV1ozOUlkVEVxZS83?=
 =?utf-8?B?aDhURFpiRTd6R0EzeTRKb0s1MUFVUmlvQmh2MUM0UFR4ejlQWitIQVdieVBD?=
 =?utf-8?B?LzljcmtuN2NSZk1ZcVB6RVZ2VkJwL25wZ1pCYlp2NTQxM0lUZitra215MU8y?=
 =?utf-8?B?NkFFMUQ2RWh6d3UvdHpjVjd0TzhBYjV1NFE3MDFidnlDQUt3aWtMZ0V1dHJw?=
 =?utf-8?B?bVNVTU5GalZjSlNqMUx0cldMWXRtMnI4K1k0ajhMZVgxUGppaUZxenNUdDJj?=
 =?utf-8?B?ZXltRmFGSldpM0k1ZzIvdHErclFaRDRsR0VKZkVRTkNMNHR3emw4NEE2S2lB?=
 =?utf-8?B?a1ZOTG5XWDZoc1BjdUVTa3RoeTNZM3I5M1hQVGVGZ0d2d3B2NnVjTmxORmNG?=
 =?utf-8?B?dmU1S3RZMXJTTlQzMTB1UXpwTEVaMHN5MDR5c2dvOEFoYUR1RG01enJSR0Ix?=
 =?utf-8?B?ZVJ1L2hDaWkyd2tSYTdIaTNuYnNhcHVMRmIxUDFRQjhyM3V3RGdQNDBQQjFy?=
 =?utf-8?B?YXBHaytmYnVWZFBndUFCQzIxTlRuSFFSVXRGdHl4cWVqRXlIb1NCVWpBSDR2?=
 =?utf-8?B?SG13QVJQVzk3YzBuUFZxUUN2bnlnTllRRGxnNEphODRrVkg3YUtPQW1lc242?=
 =?utf-8?B?NkdHYk5jbjMrMUVoTE5QNStyclk2SDhXUU5yRWtoWlRtc3NEaVRKWEhSWXNt?=
 =?utf-8?B?cjQ0TkJJUGtMZWhTUldYTDlLZkRwZ08wZjhvWllDTUk3a3dsWmszM1pnM2xQ?=
 =?utf-8?B?S1g3MmZubStvQXA3cmVDOHFRaVZEY2V3V3dlSlJBTm9RcXVGbDZRRUh6bVlK?=
 =?utf-8?B?cFM0NlpZK2lITDVOV2E3c3VIaVVDV2c2RitOZitzTytjdUpTQlZUZ1NydXI4?=
 =?utf-8?B?SW9RblB2eDBnT3U0ZGNxVDZlZnhDeUk2cDZubFFrMUI3c3ZORDlSR0xBUkwx?=
 =?utf-8?B?VlF2TXl6aWNoMW5od0xqOWVlWVN5MHRPeU5xaGw3N1FjWFd2VS9QU0dFYWdH?=
 =?utf-8?B?K0svRFN0SzVXd054R0FTMDBkb012MFBhZlo4SkNXdG1IZEw3ZU54NngzeTFR?=
 =?utf-8?B?WCtOaWFCajNyeld1YURrWVJnN0p0WmJxUUZLSDZoT1U1Rjd1V1krZWRVeFNj?=
 =?utf-8?Q?9mwhdWtAYbM4gQeAfxXNlE4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50a6da9-2423-4f78-037e-08d9a5c7e201
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:33:35.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evCFJ3aiugjiXJCOHxEkG/AovUHD+laq15dXzKi+Zv6fwHNKWbB/YgU/0Q33cCFPty+8laLMNzRfRdvcZa0sVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

The quarantine domain doesn't count as a DomU, as it won't itself
trigger any bad behavior. The workaround only needs enabling when an
actual DomU is about to gain control of a device. This then also means
enabling of the workaround can be deferred until immediately ahead of
the call to domain_context_mapping(). While there also stop open-coding
is_hardware_domain().

Fixes: 319f9a0ba94c ("passthrough: quarantine PCI devices")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>

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


