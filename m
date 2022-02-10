Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680314B1105
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 15:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269882.464029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIArW-0004l4-P1; Thu, 10 Feb 2022 14:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269882.464029; Thu, 10 Feb 2022 14:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIArW-0004jC-LK; Thu, 10 Feb 2022 14:55:58 +0000
Received: by outflank-mailman (input) for mailman id 269882;
 Thu, 10 Feb 2022 14:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIArU-0003wV-IS
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 14:55:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ca15171-8a81-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 15:55:55 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-tmHgBpWCOYuVdGtyZDh-cA-1; Thu, 10 Feb 2022 15:55:54 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7443.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 14:55:53 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 14:55:53 +0000
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
X-Inumbo-ID: 8ca15171-8a81-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644504955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUtuGMPyAObdf0J2/GPNj4BgwRzlxjTEV6wyVRInaNs=;
	b=JtUHnqR6JqKfYBMPMmtGYMPmwLDPa/y5rXL02be2GHxliIXct8U2AMq3XVddxY89es4uhw
	/NPwiPfrYoAElydDL0Q/misPZ23k8cp9NYHjEVC8Wa0vY/tDgSoRycVp0RdmS0kWibm7Ai
	SYNOOmP4WcJere0zVOgBXtkXjJhRoDk=
X-MC-Unique: tmHgBpWCOYuVdGtyZDh-cA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJAKDzwgRvv8cJ7D4aRFUNlUpbWv1FTaINtIVn7BHLbTIBK0wixv4c8huL8watjjoIZ3BPXh82v5a5r2/JnQoLthu6Y7o+yfy2leRJOXUAZ8D+FDuje/BEij0L5RbW0eM7nWgfA2t5G/fxrlIXOGI3yIX1eFsiIetDsYjdSrNalun5Q2Gmux3xw4LacQRc4Ve7SCVPbPqhqsr5qqXvpR6Q/AVK5zFzNDijUAHDF1E/zYrxvjUWd6BYjFcvKQCHSs1oXg+/ugLDV4mBiAXgFDfu/ZwB+yBagCj0VWl6mFeI/NXYHWK3x5pkHQ/BX5YpNaHX8887M/a09LOnAwLVzUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUtuGMPyAObdf0J2/GPNj4BgwRzlxjTEV6wyVRInaNs=;
 b=HlRoy07vaIM5qMBm2TSWgpFCYJ1ewdZGeQjIBzPQk+xnLWUovYCndKjMoukVX+JSVa9zkAkgzFn9299gyKAsEju+zo2VBVP+HDvMt1WBIHd5HjoRunjGL85EWp66lwsJl/ZLh1F1ir+hLJhuF4QeuuJmplLMnpAvEORyrGXneYbKbxDPixhkJGqkzI5zvfhbzc1BQTWffFIZHYWIFrj4Zmq/XHwDSEaH0kSK6t5xDAj18FSPWu1FYHRPRL2q7gZjIZ3dhre55Ce/R2AKggcg/G+QdLRQTpDdEFuCemlax1XPxB5JJY2VzbzVL+sWcs8l3FHSbKX6wkzuoLT2IuOWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f56a75c-cd68-0dad-b1ef-a3421271ee47@suse.com>
Date: Thu, 10 Feb 2022 15:55:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH 1/3] x86/Intel: skip PLATFORM_INFO reads on family 0xf
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
In-Reply-To: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0025.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::38) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b8a3236-040a-4120-7573-08d9eca56f75
X-MS-TrafficTypeDiagnostic: AM8PR04MB7443:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7443831F1EE3468EDF20D709B32F9@AM8PR04MB7443.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsRv84qwoEk3Ic6kSsJbxS13Vx4wTSJD8vkIHaiSRGP+8Hl4sBX2/Ffyp7A4WpTxXJaVqUySFNeiA40X3HAKfMdL5agKGetsahbUhvW9xOpeyjdSCSJu6DP/fq+wibw3pSmDBFP0OtWio5LyrBgeeV8LKnzzM2lXa3b2nE5sneecOi3f94YMAMDsq0LNbPags9VW3M4qALCcwir0mI8a8Nb6HzSQOGREJmlRdL88rwS43n2Dr73N1Qd2kXQjRnGBrGTO8OOWyeKFgW5BxUShbN6jtvpzqlWCIswwa9QdWimncdOl1BowbAjSqBmXXeTlgJUMV131iH5kaWJ1WLRFhUA0aAZGk7OF3TNPFlMC7ag0QL42OTfcH+/RNR7SvH6eKrpBnumiUmkrTONrqia2gXF3LRCUu5PQQ8VK12IgpVoGPXmu22nN/T10P4xPWiLds1qY0vgnpMA3iF7APRO/O1gxce243cxOs7qW/F3bF0Fc0zPJC0aucaha7GDdpjavjOtFfI1WA0GNeq9upNQ5rceFM6v++BTp9EJ602PvQ+NEpb8piH8DzLwaDF87T1GsWPVqWGeyT5W5z4Zxttmck64HfpZCNLoaUMlZpwRR/kVvoe6tbc1it5kbnS2IeuB+RszlWrSZDcOGHK6GGuatiAWvr+vT/C3h1BTpHOUPIXAPJeXWO5a/nONyv6Skd+7jfPSnzSBVRMUKo5fMakFG4YBv6Ue0CwrVEVTxNh6jo9YdlgC1w3qR7qb+mGULRr5P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6486002)(186003)(2616005)(31686004)(26005)(6512007)(508600001)(5660300002)(6506007)(8676002)(31696002)(36756003)(8936002)(66556008)(6916009)(66476007)(66946007)(54906003)(316002)(86362001)(38100700002)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXV4VzFmck9lcnZzZ0Y0c0ErYWFxWFZFTTZJV0xxTTF2QkFROWZQYmVybkNY?=
 =?utf-8?B?N0RBd2xTVVpNWksvSCtZaUVCUUVkQWRhUGJ4Wk9DM1pGakF0aVJ1eEpuS0dJ?=
 =?utf-8?B?bm1zSXRNeWEybDM5eWw3K2o5WGdlV1p6Vmx4ZFArQituckdCZ1pZTi8ya1d1?=
 =?utf-8?B?dW5wemZMKytubThWU01TTTAyYnZSOFJPcHJ4b1dBMTAzZThWeUlVOEdWMWc1?=
 =?utf-8?B?MmdvcWZqRlYzaHI2N25rN2RGWHVzL0U3SUdrOGFNcUcwY3RjeWNib25vaWMr?=
 =?utf-8?B?V1RHb3FhY05GejVHRldvY2lGc20vQ1JpcG1YZE1UWGU3TlZTZGdtTVgyMGdK?=
 =?utf-8?B?K1IzME85Z2VmR3h6UmhRSU5hWENFbmt1RHptWitMYnFxY2U5SDZHNmdVTDlK?=
 =?utf-8?B?Q1FDMncxRkdBaXF0Y1dBR0M2RFB4cWhBN3AxM2VFbGNJQ21NY1JUL1lnWnZZ?=
 =?utf-8?B?VTZaN2lyaU02V1BXcWMvV2FuZW9tajlpMG90RG0rL25sUFBmV0xRQ3VoN1Mw?=
 =?utf-8?B?YkNMZG5Ickh1aHA4ZlFBR2xaTnUyNFJPYlRoWFVnbHFDeTNnY0Z1eTczRDZW?=
 =?utf-8?B?aWlVRkovaTRtV080TzJhdnArbk5OdEpEdE92R0p5OU9nUU1NM3lkaTdpamxW?=
 =?utf-8?B?OUVsUlJkRVN3eWtEak5RV2xZZEIydVVOeXd5TVpRdm1XNlFQVUprVXNOMlRt?=
 =?utf-8?B?UVVaQllpdHRuM0lHTGlndmViTVFEYmk0citWVjlHL2pscmVrZVVvNmZROWYv?=
 =?utf-8?B?Q1J2WjgvZ2V2SGMrWlVXM2RiMXJISFN0NVBLdThvT1U3Y1R0WkF2QWZFL1di?=
 =?utf-8?B?bmhMSmI4ajZ5b1F0c2ZlWnpGTkFJQWVRekNESkVyU0VGd1lRZ1dGc2wyc2lr?=
 =?utf-8?B?eXYwTXoxMWRQUkptRjVTWGZodzNSaDVXODEyVzNLRVVDUzlyaGQ2TTRHaU10?=
 =?utf-8?B?T2c4VThGbTVZK25vTXJQd2NLOXMyYW9keU9PR21qV1Y3RHVQNEY5N2E5MFRL?=
 =?utf-8?B?bEI5OFdVUERxUFNNOFpOYkdFZHJwd1NFQ0FvUkhRYm9YcktPb256bmNPOG90?=
 =?utf-8?B?Qkp3MU02dE1jNHJTS2NycmMyNjFhRzhpVHNNRFdrbHlMWk9uelhZYTFVbENN?=
 =?utf-8?B?UUlDT2lWeDRKWjlDbWwrazhudDF5R29YNENvZ0hydDZUSnFRdWpyek9Cczk0?=
 =?utf-8?B?NW5rMW5HNmE1ZEhYY2FZbHAzcXdKbS83YlBRZUdxN0Z5Z25mV1lkVWUrQTll?=
 =?utf-8?B?UUFQbjgwdTFkaUZML2tCVHdvdkVJN3Nsdm1BZVpISTUrNXg1K0hoVnFFS3JE?=
 =?utf-8?B?RC9kWWcvWWoyK29QSmUrWnNuWFQ2ZUw4RlArcFlURGFkWHp5MGx0MllDSUxR?=
 =?utf-8?B?V25ocHk1UTdPK1RXTWNndXBZMTM1R1gwSnQvK0ZSMnJscDJRbTgzV2pJTHBU?=
 =?utf-8?B?SGJyanpCdXNiTzJBQ0xKN1FnVVJiUjVnYVJOMnpjY3NZTzIyZFpNWlptSDhy?=
 =?utf-8?B?QitUbm5UeGVxdkxEbU5DaE1CYmdsZlYvR0U2VDh5QStURkR2Zm9vMlpWT2wv?=
 =?utf-8?B?cW1TQWtTV1V5am1CcklPOTdocEl2VVR5SnFXWHptS2VyZDZUNnNkTzJtM1NG?=
 =?utf-8?B?bytSS3JhTlRYcG5XVkVTUTFYeTlUU2g3SlhBTEFGVUVXS3ZtUFhuRlNIKzE1?=
 =?utf-8?B?ZHJTMHFIejZJZUQvTHhTSEFlOXJWTjZrQVhwLzlPaEN6K1kvTW1VZnp3YlNt?=
 =?utf-8?B?MUwyZlF2MzhLZUFzdXF1YzNueDZ3S2RtOFVkVUxkb092OFovVTV0NnE5OW53?=
 =?utf-8?B?amVEUTBSdXgvRFpQa2lZNmtGd2loMG5IMk5vTFhRaUhhN2VNbjdqQ0lUK2FQ?=
 =?utf-8?B?T0xPQ0NMNm9KZk9tblU5K2VNTUc2RXBob3h2Y3hJc1A1em0zblQwOEVSb3R3?=
 =?utf-8?B?aVcxRjEyR3N6a0NnVitLMnpIdDcwaWUvVXFYcnVZK3BoNXFvdGQ1RUdLemRt?=
 =?utf-8?B?cUVkZGl1c0xKakpwSC8rcEFCRWZsTkc3NjBTNnZCVUVMd0o3M0t0MHlBWm9a?=
 =?utf-8?B?WDhUdzRTZVE3SmxRWlRpeDRZTmtRUllWUGo3S01mclJhVlpDaWlpQXRKaG1H?=
 =?utf-8?B?YkJ4TmF0cm1qMWNiaWV3TGM4QjRGWXc2VVdwazI1VFJ0bjc3KzU1RUFlcjM3?=
 =?utf-8?Q?ZgzLEBztrA+uKBY/f7uBA40=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8a3236-040a-4120-7573-08d9eca56f75
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:55:53.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF4i5uevj3Us2pG66yQINEkt9v1FCfNkl0nI3kJuoeVoo0WXvy6cNtr2qo2qsk5TQxFBv1nvx3CWjvXceglD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7443

This avoids unnecessary (and always somewhat scary) log messages for the
recovered from #GP(0).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Perhaps even use "!= 6" in at least the CPUID-faulting family check?

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -127,9 +127,12 @@ bool __init probe_cpuid_faulting(void)
 
 	/*
 	 * Don't bother looking for CPUID faulting if we aren't virtualised on
-	 * AMD or Hygon hardware - it won't be present.
+	 * AMD or Hygon hardware - it won't be present.  Likewise for Fam0F
+	 * Intel hardware.
 	 */
-	if ((boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+	if (((boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+	     ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) &&
+	      boot_cpu_data.x86 == 0xf)) &&
 	    !cpu_has_hypervisor)
 		return false;
 
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -455,7 +455,7 @@ static void intel_log_freq(const struct
         }
     }
 
-    if ( rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) )
+    if ( c->x86 == 0xf || rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) )
         return;
     max_ratio = msrval >> 8;
 


