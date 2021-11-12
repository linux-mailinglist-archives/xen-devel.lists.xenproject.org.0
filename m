Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2944E42D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225057.388683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTDZ-0007lR-7N; Fri, 12 Nov 2021 09:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225057.388683; Fri, 12 Nov 2021 09:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTDZ-0007jd-3d; Fri, 12 Nov 2021 09:51:33 +0000
Received: by outflank-mailman (input) for mailman id 225057;
 Fri, 12 Nov 2021 09:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTDX-0007jS-PL
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:51:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ca8dab9-439e-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 10:51:30 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-q2NS1ZdPNzSLfWRQmETzTg-1; Fri, 12 Nov 2021 10:51:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Fri, 12 Nov
 2021 09:51:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:51:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0043.eurprd06.prod.outlook.com (2603:10a6:203:68::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Fri, 12 Nov 2021 09:51:28 +0000
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
X-Inumbo-ID: 1ca8dab9-439e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2m/CJIfKmCp42iGpSLQV6mSLgNROe0X3B1g+LDTuDN4=;
	b=LsPjQo95E6Vdx8AH2M7fSkUoZsdsMUZSAL1cEVjfRKZsv0QSysJ4jl3mDgxfs46XDMkfiP
	NjOpjqrlnm5tgjaddIPorRahxt2gEEy8xJL1wn5G9pLLLzgXLwKMPpVqahWq01E1nC0kQM
	DvcuKVjAxfI6AeMDqTOmodM7FmtHS2M=
X-MC-Unique: q2NS1ZdPNzSLfWRQmETzTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1SNmvVLvsPuESPPC3mfBP3O0yJBRFdV1yA9GuwP14VE5giDW1kwkkcCV0kWqeJW7/XsEq+sKCs3KppPYuzh+1zuA0buAjNW8KH0jP+sCs7/ik+V1RRFg8XOEkfiy0SdNLEBEpcx1yc+j7CK/Oxs36CyrlA+yZtb+V1BOkysHZXxg0c8vnQwUEbQoPSIdupeyIlAcnS11F1UbcnaDSjSo1MRwp1vxNAvy8YQNBv0jmMkySsOkEjXsGqEYMW9XLF7NIG8JksQ37AOTMrFhd3VizELY5qBUHbHthkHUXg+eBd6HY+Wvb6WBNSgDNgGtPa5JWMHustyIizI4Tps808ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m/CJIfKmCp42iGpSLQV6mSLgNROe0X3B1g+LDTuDN4=;
 b=Zh6ANy8esEue9zPNZgUQdB7RL1dzw31u+nEIYKh5TUWmKH24PirUN7jwM8keSrehOSTKpv48C3uMfyT9WpbjyLp7RVAf6dVVMriyXR5pY7lLEsjXpn6iG6Nj8CbU8NBG/QRuuSj0Jf2j9nThxQqtnDPL1KJYiHVwJSJlwSq6YIn3fIcRY7Y9G8CJ4NIq26pqlfuT9qyFobrlNngoYY8GUWygouv4TavLLkA1zErr8O65IvB0CrZpdIuIW3zp/M+HMOJiTgzJzj2MD6FY4uyCTrJTNgHzaASSNsNTYJ9s1y9YCjfDdLQ/udRmmS49xmQtcDQg5b7R3zQfRTDL2C7EIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30305930-0402-c01a-226f-508597a15a1a@suse.com>
Date: Fri, 12 Nov 2021 10:51:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: prune super-page related capability macros
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:203:68::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10a05b79-6450-44c9-3d1e-08d9a5c1ffa0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942C3D95F612566A9261BB2B3959@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0XoyKSUv19z+nyG6F3V2T/MfV5Q9QLD0hn7bzjQ0F8hahfxewyanhtomMMQFh/ztA/GfDUxj8AB6tt5r5ujhxWv2QyCLntg3MpUIhYcuzD2lRdtlLUYbCPveyVChdENG8/0liX81fjCn6q038G5DNBRre6+BwXCZ3hFcaqQJHWhg+DgfXPRXOHpaWBmk8g47DWSI8spoQPM24em/2EBsKNgT5xxBFj5gGE87X5/D+j7Yl91Lp3kIXIhgpbAZPDP/pYXPGs9S1YSxszzKK4tyjM97bsfGZs9KgUBrwHo/eidjzDPZ60ZQMHTNbeh/pSv1ZW9K2GvUSgCkLWH1jSLMhczLRYl6fqwdJrM7f1KsQmQFVyP/y5exMvRRHnegV6OYqzE4GqYjK4J6k7O3xCXRYxSZdOgkdBMhYT5vLDdYk5JgMDrAPm5n69bd4JA1pbeVlSULSGf0Mk49nvCBuNfZN+AnW00H3NLTNKvGIYCQJ2/Cv9eootZ+y5gO/w9ue//F2lNsmgVLsw5AR1rN7I5FyqFwSLNhBoQJNiEajDHp1y3o+tUkDEHhM+mKQj0iwZWV5DXAcRd1yQkvjTe1ZBMgu4PxTF8RcpH2C+fjLYex8z8dJ1pd9BXodYTH8rbDbrX6OGVebRS9Df5TMZBvwzZNbOY3H/luPkINCfcoLLXOclGEN6iLxGCnyEzhNWWbtKrjdQwJFYQ+Y5b/dT6pSsUgVsvruN3pECR6aJm//Tlk9oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(186003)(2906002)(5660300002)(6916009)(38100700002)(36756003)(66476007)(66946007)(16576012)(86362001)(31686004)(26005)(4326008)(66556008)(316002)(31696002)(6486002)(8676002)(2616005)(956004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUIydWhieGdzd1gybDhDUUZ3R0NwYjlwbDZXMXNqbnNRZlQwZXlFVEZHVnRr?=
 =?utf-8?B?UVRmZGlxN3ZITWJwM1hEQ1dvc2xtM2QzdEhVR3NLVVZlZFZHQ28xaFZzTXNM?=
 =?utf-8?B?a0RLUFE4RUk2VklUbloyb0VSc08wQzBkK0F6OUdva0Q0anl6OEsrZ1RVL0Jl?=
 =?utf-8?B?eXI0NTlLc3NOQ0VQOFBmWjk1QTJKNko3VEpKa3NKSHpjcnBSaVF6Slo0YVh0?=
 =?utf-8?B?NHc2Y0JNOE9PRFFIR0RWaEdtWTA0anNKVWtLTWowc1hmV3k2UFd4Rk1TdTZV?=
 =?utf-8?B?Z0dkdUZ6VENSVHIxaXhNNGxWVGxuRjdUa05uYnRCejU2YkxsNWNGK3JiZzhr?=
 =?utf-8?B?NFdiK1BUVWxGSjgvdmRyS2pOYkhJVVZ0VUgxLzIvU3M1dXlnejh1clJGVmxD?=
 =?utf-8?B?cWhFR0lSZmlCR1g0RzFPbGhLV3hDRnJMSkgyQzZxOHc4eXBKYnl1VlBsdTBX?=
 =?utf-8?B?K0hoNjFDcmlsdmRHaWwrbVAvbEVrc0tFWk96dE1vSURCSFlNWGE3WHF3d3h3?=
 =?utf-8?B?S3dMQWFkd1RSNmtXRmIyRVpGR1lWaU5OREErN2FFNlFFV0x1ODVRNmpxSmNJ?=
 =?utf-8?B?SUtNMjFjczR0OWpSUUZnWDl2M1M4TWU2UXcrc2dlUGVISzg3VHJlY0pSaXYv?=
 =?utf-8?B?VXBpOElyUTdNbFBXeFY1bUY5blg1SnFZMXMvMiswQk01NkMrdWVlUUhVcTlF?=
 =?utf-8?B?QW1yeTE4ZkRSNklrNjZiU2ZDRDlnZndMZ3V0cVJXNjVkM1JqN0VoTm05aVpJ?=
 =?utf-8?B?R0ZZeHNNTGpOeHE0aXFBYzA0cXZXMVZObU9EVUJOSTAyM0VRRkFkT3R2cHl5?=
 =?utf-8?B?dnFtU1hNdmxMa3dTeEdvc1JSYWVaSGp0UHV0d3loMFBLRksycC9kTUpIUlZ6?=
 =?utf-8?B?SUdweVRnRDJxNVgwV3N3ZVdtVGtxNk1KL3I3K1dhRkx6YkgxK2d2dCtsSjRu?=
 =?utf-8?B?dHBUcmlITnZCdXNtS1k3eU1qaHlIRkZKVVdlZlFNNDhUUUIvL2p6VmRRU003?=
 =?utf-8?B?cUVJZjBzZUlnQVZUS0VpSWhrSExSYVA3aEpKQ0JkZmVReTNXeXhzZXN6UGpK?=
 =?utf-8?B?S01xWm5velU4eTRSMEVxUDdHa2twZlhRZERRV1I5dFNFODRjR3ZlRFB3Tzdo?=
 =?utf-8?B?WVFpUzlTTjI1M0Y5RUpjTVZPMENaQXc4RmZTUElKU0NXNWxjRlhUak9VcDhM?=
 =?utf-8?B?dlowZHJoY1dVQXlwRHlWMUFrY29ONFdOdjRFWnhIUEZycEk4b1FlQnZmK291?=
 =?utf-8?B?VnZuekNuRVpNZDkzd3ZZYWdtbGJ6dU1DbUFFNGJXNVhTQzhTN25DYm5uekJX?=
 =?utf-8?B?UjJ0T3RzTkxxRzJ0ZndTbnJKcUhMUFhsRTFBcXVoRGhMRXBra1I1TER2SGxZ?=
 =?utf-8?B?REVYeVcvVXVSdnd5aUNFUDN2b2pEUHhtM3FiSCtjL2RWYnQ4QnVxc1V1a2FN?=
 =?utf-8?B?a20xYlZuRkFNckhmeDl4b2c3eEZuYXY1alc2bWZNWWIrOUh4cU9YeVdmYms2?=
 =?utf-8?B?RnozbDlWZ2kwcHdwakRXV21TK3dBK2FDb0ZkclpCVnl2UitsUWJRdmsvZXFV?=
 =?utf-8?B?bkM2cCtWeXQvRWkwMVNoYlowZ3VqaFR4TUFWWW5pMUdUU1JwTTYwMXlHNS9I?=
 =?utf-8?B?UDFNR1ZwM0dLcllYL0RPSVg3dnFpR2lnbGJ5cFBETVVSSlBWU3FxS1l1NFBR?=
 =?utf-8?B?SGVmSXdwZTBFMW5VNVhmRUVhZENaZi9QY2xoZjZ6UUVZUkNIZnBjQ0ZyVEwy?=
 =?utf-8?B?Q3AvRFVlT1gyd1p1SXZQTlk0YW9KUGN2OGhidXBIczdyYTRibjEvcDg3K2Za?=
 =?utf-8?B?UFZCSDlaSG1KT3g4MkdhR2VFQ2VnVGc0QzlIRjdocWhJZkY1bG4xWS9xZGpV?=
 =?utf-8?B?M3p2Qm1GSkQwRHh1RUpNQzlSRnpCZ3JDTEpERklFYS9YVXg1dTYyczhSUGhW?=
 =?utf-8?B?cUw5OGt5VVlnWmFEaTZBeFJXNlNLdlF2ZVZTYndmMDIxR3UxaHN0TGVoK2JB?=
 =?utf-8?B?S3JUczN0SnUzUGxpVEpXN1ZyWUJEQXlDM0JWMndrdlQxY0FHcHd2KzdRb3ly?=
 =?utf-8?B?c0tGZkE1bTRJaFEzYWx6VUZXOS92VVp4QVVsbzRwTHJtcitDNGJyQlRQa2pH?=
 =?utf-8?B?b1NRaS9veHBNUXliclpJZWJDVndGbFowYlFKQ1Q1R3duVkdYb1htVVZOVXVk?=
 =?utf-8?Q?EPLQ4Ss3qdRwiJ1YgQVLKsM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a05b79-6450-44c9-3d1e-08d9a5c1ffa0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:51:28.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvRmSLY2rhfyM6Ftn3RcgoG32L5IkgG/N3gSD/D0BQp5H3C/AO/FJXM2sEmFFlaGYrs5gSLsSHyFlajE0UFfnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

cap_super_page_val() and cap_super_offset() are unused (apart from the
latter using the former). I don't see how cap_super_offset() can be
useful in its current shape: cap_super_page_val()'s result is not an
lvalue and hence can't have its address taken. Plus a user would have
to check the capability register field is non-zero, for
find_first_bit() (or find_first_set_bit(), if suitably corrected) to be
valid in the first place. Yet as per the spec when the field is non-zero
the low bit would always be set, so the result would be independent of
the actual value the field holds.

Further zap cap_sps_512gb() and cap_sps_1tb(). While earlier versions
of the spec had things spelled out that way, the current version marks
the two bits as reserved. And "48-bit offset to page frame" wasn't in
line with 1Tb pages anyway - clearly 256Tb pages would have been meant
here.

Finally properly parenthesize parameter uses in the remaining two
macros.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -68,13 +68,8 @@
 #define cap_num_fault_regs(c)  ((((c) >> 40) & 0xff) + 1)
 #define cap_pgsel_inv(c)       (((c) >> 39) & 1)
 
-#define cap_super_page_val(c)  (((c) >> 34) & 0xf)
-#define cap_super_offset(c)    (((find_first_bit(&cap_super_page_val(c), 4)) \
-                                 * OFFSET_STRIDE) + 21)
-#define cap_sps_2mb(c)         ((c >> 34) & 1)
-#define cap_sps_1gb(c)         ((c >> 35) & 1)
-#define cap_sps_512gb(c)       ((c >> 36) & 1)
-#define cap_sps_1tb(c)         ((c >> 37) & 1)
+#define cap_sps_2mb(c)         (((c) >> 34) & 1)
+#define cap_sps_1gb(c)         (((c) >> 35) & 1)
 
 #define cap_fault_reg_offset(c)    ((((c) >> 24) & 0x3ff) * 16)
 


