Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C0A6DE9F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925790.1328674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjjq-0006C7-Pm; Mon, 24 Mar 2025 15:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925790.1328674; Mon, 24 Mar 2025 15:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjjq-0006Af-Mw; Mon, 24 Mar 2025 15:29:18 +0000
Received: by outflank-mailman (input) for mailman id 925790;
 Mon, 24 Mar 2025 15:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2bg=WL=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1twjjp-0006AY-AY
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:29:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2606::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf0cdaab-08c4-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 16:29:16 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI0PR03MB10298.eurprd03.prod.outlook.com (2603:10a6:800:201::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 15:29:12 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 15:29:12 +0000
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
X-Inumbo-ID: bf0cdaab-08c4-11f0-9ea2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B46kkRBBc7O69fOla+idr3kYM41uoEUiYwxb6jUk5VLnkNiiS61ICna9oTDixA3JOG8nV6rogVDLk/soBbJ3845r4KBJ2IG5Kg8jS7IPtKlzI0i/a22ap7x8fVDgdVnR8m4IZsvycraD0HnFbRE0xPeB2m8f09a/PSU1kUlBFPix9HQHAD9fEOq0s7DYRhY1oDPnoGjEvrmptLGsSquMaAz3FDUo3AkxWHw+3/Uwp+GS0VhuH13peMBsMqM7ianaXukVj1LiNvBe2H99v8KUGKP4mjmjYNvxRyzIncX+BAvJIsVdptng7VfNtxTJQLo4o9Eug/5Wf+DZk0gO76lPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA0M1wM2hsNbrNNAUE3UPqZm96I2mrOBpeFjpJJiZog=;
 b=Ln6v52+cjBFYT7xzf0P7VQDhHbCOihhk1bWjJZCxqkOzcy6B+HnXB7FI40+TqL/sl/Pil6I3ZCrEuyK20Kvs/SOpthtkaIqsMQcMIqODqJW/rneQ9p+MJqgyth9dLphnbO25AqSutfj3BmxFEQwFcf14M38lBFXUgMmleHczJsO82AOCXQa6S+5DVOxDu/zJXnFNJUajBBO/LKHK9v2GOPynL2HFtcWC1htq0DHmEQybhUdTBBCLuGJQIBrt5/vAs33tqyNaDzi4NSN+Hi4uvpKsV8O5i1izmKoTaSw5f6ysXTQSal7u0lEQevCvbEkoOH70SMdOgWK+vHvGnyU/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA0M1wM2hsNbrNNAUE3UPqZm96I2mrOBpeFjpJJiZog=;
 b=be5huwweorueDjtck1plg5yeL8geJAYZx6k5ya6iV6yhDwl+qcu1hOTkkw4VmCGzDVZUzBEwGfP3FDovUiINqR5FbXlqzACJujHsoLiuOM7gRvyFz2hSaomttYQh6pyQiMX+zs696j+Dl+hamtGcJZnPDDcGORDciXl+8VA/L4GEVC5z2LRiXP+hMSPFqBwlBtyhWwMlsn0Niu6hQ8quNr8VMwrbt9YydsK1I1xfBmfB0pZuGvcskWSuaYa+XXZkuNUWb7Z1WqCkmxHh9BwjwFYYJfmmWSr7s6W7/Op1N1lazUaivZyeMntz1/c6pETiDMxZhD+6aohUM+knbmTSxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6f5e22f4-9554-444b-9d88-83c2304161ef@epam.com>
Date: Mon, 24 Mar 2025 17:29:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/7] xen/arm: add generic SCI subsystem
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-2-grygorii_strashko@epam.com>
 <6a0a3b3d-9bbd-49da-a37c-eb1cbad94cc1@suse.com>
 <53758670-ca39-4df2-93be-5dc417231f1d@epam.com>
 <42511843-c6e0-40ae-894a-cad4a73c002c@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <42511843-c6e0-40ae-894a-cad4a73c002c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI0PR03MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: f00b953c-80e3-4c2e-7b1a-08dd6ae8a102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U29KSTBVa0NRa1Z0LzV3VVpRL3NCL0d2cWRHM3Q1ait6cUpiUmI0ZGp5VDM0?=
 =?utf-8?B?VnQwZGRFT0FERmJ5eTlBS1FvT3cvZEJNVmcxOXJybDVweW9yWlkvQ3JNTW1U?=
 =?utf-8?B?TzVYcWhTY1JNemd0NkNKMWV3d2VISFVaVitQZzY4T2o5REZZZXVGeGx2NVZS?=
 =?utf-8?B?bEl1c1E3TDh6ZE9xQ0s4NHBNRStXSlJ3a3ZRMjlWRzh5NDc5K2V1VXJPeGZF?=
 =?utf-8?B?Q1IvVlQxR3gvNXRxZmh6c3NkeTNOSm5lNDhjOW9HajRmVTFOaW9kRFNjUmo0?=
 =?utf-8?B?dEtyVDZvUDlidWtrbG9Gb0NtMUp0clgzWWpJNUsybUp1SG9xUlR5MUt2TGtz?=
 =?utf-8?B?QlJaVVZMbkRoOGsxUmVCKy80cWFVT01hZURQT1Y1WDBZZXIrSWgyd0VaemhD?=
 =?utf-8?B?SEFuSG5ocXI4dkp5SVpEbTVIS0NWQ0M2NWM5S3U0U2xkYlhKK3ZoblAzWlhU?=
 =?utf-8?B?NE9vTy9SK2tTbGY4alR5RFhTVCtySm5sTXgzdmdTbTJEbXA5OHVuc25mSVdo?=
 =?utf-8?B?R3JpQWhSOHkwNGV6QzZrVEhydzQvNXl4NlNvOHI2V3UrSDRhM3MyRDhTcE1S?=
 =?utf-8?B?R2NOM2k2MUxVeS9FR2VpWEdHdE93RnNDOFlGYUhyT3NEWTJXNGdtaCtpOTJQ?=
 =?utf-8?B?Myt1MW9US1lIeEtBVWtWeTlmOHdpN01ybC9PWWFrVm03L3k1RThkQy93eTM1?=
 =?utf-8?B?a1cybWd1TlV5MEhrWEZoekE1VzRkNCtnWjdPSmxiZmhSR0VPSHBEbXFjd2Nn?=
 =?utf-8?B?UWE4TzdoNTJMMzRyRkh6MXJ3YS9IUjAwcWt1Sk1hMGxmNkNxNEJxSlJ0RFg2?=
 =?utf-8?B?TnZoenFRb1Jrc2JDa2EwV0l0YjE1RTQxQ3RpdlBibFlJMnhJSHNSdTdEKzJk?=
 =?utf-8?B?UEhLeTMycDZIMEJZek1VcWtiRUdPMlhCYThXSUtWVTNwYnJHV3JNWW8wSmtS?=
 =?utf-8?B?VWl2OEZ1UEljMGtGbDhQVkdEZEhvWiszRUFuUDZaVDEwOTVYWnJCK3NhYWtC?=
 =?utf-8?B?WjFSTlhJUGQxallwamI2QTBPTitnWTIweXZ2V0JGbjdYdmFJODMyN1NkUEFT?=
 =?utf-8?B?M2FOY1FHd0hPVHNuV3lzN1JmSHc4YlJGRDVRMXIvYTFLaG93ZlZhL0Y3T1VZ?=
 =?utf-8?B?bE9vTlZXMWE4MVh0anB3bVZPVW82UmR0WnRYVkZtUDZ5R0hLSlFNK3BqYmJW?=
 =?utf-8?B?ZTVsZU5oMFQrdC9RZW5DSnFVaVhvMVdDSGd5aFo2T1R3K25ZWEU5U2hjL3ZQ?=
 =?utf-8?B?dFM4ZjVZL2xpWFN1bHd0Zlp5bnY4OGI4MGhOQVJjaGNsL1JJQzVWa2Eyakl5?=
 =?utf-8?B?Um4xMG5mdW5IUkdaSWNCRU5VZU1RN2VheHo5M0dpYlB1N002TjJtekxlWHVR?=
 =?utf-8?B?Zkc4bzlvVjlSRTg4ekEwWE1sVGRMVmUvcGhuajVlbTNiS0x1ZE1hVXcwV2l0?=
 =?utf-8?B?OUFaUGdaRmlraWpPeGV0Uy8xUHFYNnU4S2VqZTM3QWdNbDVZMjBjbEc0T0tT?=
 =?utf-8?B?NGxMTXNZNDFyYmhDRXBjakFaTGg4OG8rdnhpcWwxcUU5ZS91dGpKUVpheEkr?=
 =?utf-8?B?SjVYQkdVQTF2ZkRjU1JuNHQxMVFzeU44WmVMYzBMbUhBc2ZlcDJ5UkEzbW9m?=
 =?utf-8?B?SmpjQnRweUFrVS9kNWRUQmI0RDAwT0dDSS9XZHVzWTUzYkhna1g5RzIrY3RU?=
 =?utf-8?B?TUtmY3RONjZoNEZDc2wybkhRc2wyMzhTWFBpRlhCNzlhTzdaSGg4cGVWZkZS?=
 =?utf-8?B?cU0vUXFweHF5c0hHWTBpNE5DRXNuNWRWNWVhUFZhdlZRakM2T3RjYTRjWmxv?=
 =?utf-8?B?RktYYllibGhrZXVPMzB5WWZTenh2TSt3Z1BXNHU3L0RvbTltcWVkSVlxRlda?=
 =?utf-8?Q?h/y0qFPwo3SEI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3psRkJKSTliVU9VeWhnNHM3TnlIcnZ3eFNwa0NUZUJSTTNveWxKT0FLRTVr?=
 =?utf-8?B?QkZZMDk5NkIxenVNOUZLNmRMTTJONktKU01WQmxHU25BYXFtRHVzN3FCR0o3?=
 =?utf-8?B?VG5FbllDdENheWc4anBTOFQxdkNMSG91QlBEalZiWHJ6WWVHbkw0L1V0RXh0?=
 =?utf-8?B?SC9PeVNHekpyKysrd0FnR0IwYlpsVlZINVU5QVA3ZWpaaVY3R0FKaEJRSUtT?=
 =?utf-8?B?bGxrTXRQckgyYmpkcERzeEQrOVNzRXpmeWEyMUNzaVZITUtMcFhSQjJTR3My?=
 =?utf-8?B?Qnc1VWpyZ0hqZzltS0lCZFBobmVCbkFBVVNKU2h0Sms0cDZQRTF6d2RTK3hC?=
 =?utf-8?B?cGR3T1ZsQktCT3lzRFBvc3FqRlZSY2MvUFUxZGJBV3RuWUdKNVVoL1hyOCtM?=
 =?utf-8?B?R1IxZndOOUxYUzVpLy9HL2xVek1JTWQ2cXJqQmxOblkwNmc1RGk0b1JHMUEz?=
 =?utf-8?B?bC9HSFFmeFYrU3hGTVpXUkhnNlJjZVRDOEtzd2p4MmJwdC9pQk9ZY3ZlRlJR?=
 =?utf-8?B?VmtMTnVSWXVHdSs5TUk1cndqZHIwSmNla09adHRvcHR1em1UVTE3TFpOTTJD?=
 =?utf-8?B?VW5qME5YMmQxcVo4KzllRVJOMEVtYUFSQ0RPd0toQW1EQ0F2Yit0TUpMa3da?=
 =?utf-8?B?RWdiaTAxQjFiNGNiU3VWU0MveVVtMzZqdnFKWFFFR2NTcnFPNlVNR2c1dmJI?=
 =?utf-8?B?SFQySllyZnMrK21ZNkhhYk9zWUxIRWZQWDF2UFlraml0akRQS0JnVDhtRXZx?=
 =?utf-8?B?YVJxZ05PMEdhS0ZnZU11OUh2MVV2Zy85SHZkUjRQd2dsblZ1SUd3L3h0WkNC?=
 =?utf-8?B?ZExzODVjNG9sWWlnSmFMUitlU1BKNDhCS3BzRlNLN0xoSld2ZnRoOWRvNVYw?=
 =?utf-8?B?L3hScC9GZVg5eUxGUzRpbFBRZEVXZWdlbnJITC9Hc1NubHZGU25qSmZtTzlJ?=
 =?utf-8?B?Q2I0V3EvU3pZODd4Q0lFNmhzdUZLdXR6V3FFUUltdFdIMnJwcUF5Z05MUWJn?=
 =?utf-8?B?c245dVdSZTRETE5qMktNUmIrUk13cHRjUm1hWkE0ZUwvOXdOTXg0K2M0NFcr?=
 =?utf-8?B?RmdqZUVnRnp6N2ZqMmdMNkpLNFhBcU50OTFIL3lNMFVQVGlsNUxWRVphaUVI?=
 =?utf-8?B?SFhicjlEVGJ5UUpUQ2dUeTE1VEhaUXZGUHhhNnpydEtWZ0k3c0c0QkJoZmx4?=
 =?utf-8?B?TzNuNytJVjJ3aURBdVF2emRlbFkwYWQ2U05TdG0wR3J0YWZ3YjVSZFB4T3dM?=
 =?utf-8?B?NjJhWnRFdWZpVlRUemp0TVlFU1ovWWV3bFE1Mkx1VFJ2UkN5Nml2eWNFM0hp?=
 =?utf-8?B?Zklwci90WXJhMWV5SlBPQUdNWkh0OTAyWWhEeGVCeEZ6STNVSnFqYkZKNFgw?=
 =?utf-8?B?SW1tSk8rSDd3b2VOS2hQcytWeVpKUHZxd2I2MFZ0cVpVa01UT0FITlFCZVFH?=
 =?utf-8?B?Z1h4cnNqUFBLakxJVS9wdTdBQytQbkhHem5SQVRvRm9ZV044VmhpYlRQdlVO?=
 =?utf-8?B?dUw1dmpXWEFEa1JPN2N5NjFwQUZiUmdKSWllZVZsWEhIbk9qTGxBVmdlaVVF?=
 =?utf-8?B?ZmhUYnpmVmF3QzI2K3FaQXNhSHVqdDlxMmM3VWlqOWRheWpCSTJjemlVb1Zr?=
 =?utf-8?B?bm5wQTBwbUR2bjhENkRDdVV3aUwwRGt4SGtsSnQvOUdYaTVPRXl5N2c1bVQ3?=
 =?utf-8?B?QXZPZVgzK1hBejRicG55TTNQOFIvUWo2QmRGUTh4cXRXNm0zTE9BcG9QN0hX?=
 =?utf-8?B?a3lwT1FrRTJ1MzJkN0FwT1BCaElUQ1Zrb1d1eFl1elhaSDlJeFh3ZmV0Z2w1?=
 =?utf-8?B?eXBnSUhlS0w1V09vRi9kMWZsUGtocEJJQzJFY3FneWhxUWMxMzFjT2NHUk5H?=
 =?utf-8?B?dWtORTIveVAyMm5OOUFScngzK2IrODZyTWdvYzU0U2orcmwrTUlOdE9qdU1T?=
 =?utf-8?B?azRIU0t2dDdOWXdWS2RoTTFFdkkxVXI2L3ZaY1Y1WlIzblphYTAwcXFtK2lE?=
 =?utf-8?B?UDBtc1YrcnloT0FQTytlb1lUZVpaK05MQ0gzOUNQWFdHL1E5RjlEQjl2RFJ1?=
 =?utf-8?B?WTRLVXJ4cHBXbXJwYlFoVWVvZzRQV1RBRXdLdlRZeG9EZUJadFRHVVExSEI5?=
 =?utf-8?B?QkJRQVNDOTJ1WER3Z2s3OXBTZDU2V3gvYzN1MDd4eS9JWWxmSlU0MjkwbFZS?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00b953c-80e3-4c2e-7b1a-08dd6ae8a102
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 15:29:12.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKwwuwbRtzAtOJPmg+mPkbEP0Y3+KBIAApiIYYZBvXTLzO3Q/Ia6hgP0YP6WK6xwZ5JEP8Drc9JIplYwZbFFgHkC6OlpWfJKalB6jC96k/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10298



On 24.03.25 16:36, Jan Beulich wrote:
> On 24.03.2025 15:25, Grygorii Strashko wrote:
>> On 11.03.25 13:43, Jan Beulich wrote:> On 11.03.2025 12:16, Grygorii Strashko wrote:
>>>> @@ -851,6 +852,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>        case XEN_DOMCTL_deassign_device:
>>>>        case XEN_DOMCTL_get_device_group:
>>>>            ret = iommu_do_domctl(op, d, u_domctl);
>>>> +
>>>> +        if ( ret >= 0 || (ret == -EOPNOTSUPP) || (ret == -ENODEV) )
>>>> +        {
>>>> +            /*
>>>> +             * TODO: RFC
>>>> +             * This change will allow to pass DT nodes/devices to
>>>> +             * XEN_DOMCTL_assign_device OP using xl.cfg:"dtdev" property even
>>>> +             * if those DT nodes/devices even are not behind IOMMU (or IOMMU
>>>> +             * is disabled) without failure.
>>>> +             */
>>>> +            ret = sci_do_domctl(op, d, u_domctl);
>>>> +        }
>>>>            break;
>>>
>>> Despite the comment I fear I don't understand what you're trying to do here.
>>
>> It enables in toolstack "Device specific access control" function, which is implemented in SCI FW.
>> SCI FW has privileged management interface assigned to Xen,
>> and non-privileged interfaces assigned to guest (VM) and identified by agent_id.
>>
>> SCI FW manages access to HW resources clocks, resets, etc, which considered shared and
>> which can't be accessed from multiple domains due to HW limitations.
>> SCI FW can also manage safety specific resources like HW firewalls for example.
>>
>> Each device identified by device_id and can have HW resources assigned to it
>> device_id_res = {clk_1, clk_2, reset_1, pd_1 } - FW implementation specific.
>>
>> Device can be assigned:
>> 1) to any VM, but only to one - dynamic configuration;
>> 2) only one, specific VM identified by agent_id - static configuration.
>> The policy is FW implementation specific.
>>
>> Here and below the case (1) is considered, while in the case (2) - nothing need to be done.
>> To enable VMx access to device_id (and its resources) the special request need
>> to be sent to the FW management interface to get device_id accessible from VMx.
>>
>> In case of SCMI, ARM System Control and Management Interface (SCMI)
>> specification (DEN0056E) - functionality defined in sections
>> 4.2.1.1 Device specific access control
>> 4.2.2.11 BASE_SET_DEVICE_PERMISSIONS
>>
>> The HW configuration described in device tree, like in the below example
>> (abstract, not related to any specific FW, but principle is generic)
>>
>> Host DT:
>> /sci_fw {
>> 	#access-controller-cells = <1>;
>> 	#reset-cells = <1>;
>> 	#clock-cells = <1>;
>> 	#power-domain-cells = <1>;
>> }
>>
>> /soc/deviceA {
>> 	clocks = <&sci_fw 1>, <&sci_fw 2>;
>> 	power-domains = <&sci_fw 1>;
>> 	resets = <&sci_fw 1>;
>> 	access-controllers = <&sci_fw 0>;
>> }
>>
>> To trigger SCI FW it required to pass Host DT device path "/soc/deviceA" down
>> to the corresponding SCI FW driver during domain creation by toolstack.
>> And it has to be done as for devices behind IOMMU, as for devices
>> not protected by IOMMU.
>>
>> To achieve above xl.cfg:"dtdev" property was selected to be used due to:
>> - xen doc says
>> "
>> Specifies the host device tree nodes to pass through to this guest.
>> Each DTDEV_PATH is an absolute path in the device tree.
>> "
>> - toolstack triggers XEN_DOMCTL_assign_device(XEN_DOMCTL_DEV_DT) hypercall
>> nothing from above says it's strictly limited to IOMMU-protected devices only.
>>
>> But now ARM XEN_DOMCTL_assign_device actually limited to IOMMU-protected devices
>> and will return to toolstack:
>> -EOPNOTSUPP if iommu is not enabled
>> -EINVAL if DT device is not IOMMU-protected
>>
>> in both cases toolstack will fail.
>>
>> Idea behind this change (and change in iommu_do_dt_domctl()) is to enable
>> XEN_DOMCTL_assign_device(XEN_DOMCTL_DEV_DT) and so xl.cfg:"dtdev"
>> for DT devices which
>> - IOMMU-protected only (has "iommus" property)
>> - require device access control (has "access-controllers" property)
>> - both
> 
> Thanks for all the details, but I feel overwhelmed. I'd like to see this clarified
> in more basic terms. For example the comment says "This change will allow ...".
> What's "this change" here? Together with "TODO: RFC" it feels a little as if the
> code comment was really meant to live elsewhere (patch description? post-commit-
> message area of the submission?), and thus offering little value to an observer
> like me. Yet as this is common code, I'd like to have at least a rough, high
> level understanding of what's going on here. This doesn't need to go into any Arm
> details that I may not fully understand / appreciate anyway.

I'm very sorry for the confusion, I'll move changes in question in separate patch.

-- 
Best regards,
-grygorii

