Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A146B3F6000
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171417.312809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXDe-0002uJ-PS; Tue, 24 Aug 2021 14:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171417.312809; Tue, 24 Aug 2021 14:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXDe-0002ry-Lk; Tue, 24 Aug 2021 14:16:02 +0000
Received: by outflank-mailman (input) for mailman id 171417;
 Tue, 24 Aug 2021 14:16:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXDd-0002ol-Bq
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:16:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55a338e6-b629-472c-9e85-e3944542c13a;
 Tue, 24 Aug 2021 14:15:58 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-WIh_3XwKMUepgyPs6bFQ6A-1; Tue, 24 Aug 2021 16:15:56 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB7188.eurprd04.prod.outlook.com (2603:10a6:208:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:15:55 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:15:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0132.eurprd06.prod.outlook.com (2603:10a6:208:ab::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 14:15:55 +0000
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
X-Inumbo-ID: 55a338e6-b629-472c-9e85-e3944542c13a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5i+Xnl5ocLbmeDxy8GlyB1nTmg2e1vt95em7FKfvfs=;
	b=nn5UBsMjHeIWLiriMPclUHn6glzurQ8YBRb1phAZE0RTfdPpRUP1gjJOkFdGx7exNXFGzC
	CCDY0Q9u0hr1vQfPM7JTpB/DeLy7XBJ3LkzDJHPDMePl39nriCy21NktE7vxwM6g3JCwrB
	4TRYir7Mz/9WvVWcyOQFBL9uqgEJNyU=
X-MC-Unique: WIh_3XwKMUepgyPs6bFQ6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4oKhU8YN+K/AFtcC0YF54W32f1HPlBmn+bJCkOqpNbQF7QKiwvroLUzHAaUZbre8IOx9bKAjyYaraUrw6usTkMoWlAuGp1u7o7H69ALjFhNn6maGKwq05JP94QJYD/QC8YSwydypIusyRjHHDN92dAY9G4MdLNm/dMsnAfZver+BsEwgU81SrPqor/+cnYE3taLIAwoRJsJ1QTRI3HRHg2KkZjjVxCS/63JReVfI6zPrM+5t/Nc+ofd8LMYBMlTvkeWMX6stYeBVPNAJ/q3IYRZhNTnZwi0M89/Lvc+BeVJV71/ye6kEtqJaFq+H0RaoPDlBE5nbgHbfuLxMe9PKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5i+Xnl5ocLbmeDxy8GlyB1nTmg2e1vt95em7FKfvfs=;
 b=SblCSGFfpsk+maAcSJ2LXSdgE1h/wdMKKITjVD1Ug06IPqIaK7G8/r/8mXOPsm6Jb408Fb8+a8ZTdflbl05yrUnvMx4RSmACFx06n/Jst1GFySkhDVZej3+bh6DEON7Dd0OlLhpJb0wECtW5cArx/Ia1AaFZqNNQNKkDeRMxQAfQNIzxCAbETHbvrzJYYGGCL4TbXwL42WVkqnfFkTvssPDeCBGHe5n6ldXIy3okSY/TGyFL0izfgw8k6Hdz3x5wyjJJ1rI7rRJtvtMV1ajxB/sz6dyWvlZoYN4/tHUcNC76prBtvPCJcZGYEKZbhmvkfnzOkmhoDNLgbQwYBxbZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 02/17] AMD/IOMMU: have callers specify the target level for
 page table walks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <003e5e7b-1570-3d88-33a6-6785c0f566f1@suse.com>
Date: Tue, 24 Aug 2021 16:15:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::37) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b97fd0c1-b945-4d72-c851-08d96709b004
X-MS-TrafficTypeDiagnostic: AM0PR04MB7188:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB7188A94BC60E589E2A0117C0B3C59@AM0PR04MB7188.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IlsGdpzZTXr9IoOmWC/9I/pEoE7iSe1JHn8XA4dY3D/ho1lTHcReSEz+xk4rOpSR2zua64FyiqEhhofwgO8ruuaXkMQgRBzdMuyq6cYJDB66Lm0rLgLAW5PbxNueGR7KE/xt9ZCS5wD6hjLCbyd33d5XkRJ8kp+fHSiPgdx8bYAQvwih4JWudQx7FeAdvFfYxcqJRr74XaDOzOVlJ/mZS0G4txc6bEe8OU8OspAL9U7bewrw5KfdeckdNWoqLpLPgAVvEA1R9s+v6ohgbapDFaI4JL9DY52ffSXGyy4RUDjsBitsjak6o4o7krFRN4Vd1U62fenfKqowS4dECljTvztl5BkkuYOldTpqDktyJI2UZMNnZJlHRkrDD1aUqL5R6z7ZyueEi1xsYsVIsYAX4jQmCzAWWbltOrSQoaCGaAft7PTIjvnUTUUOtAlqmYHiujVji2MHL7AX1ovmheszKnBXse2OzXKAeec4kVFZ8tvqkvvYdoClHOC95nIRlmVRwVObwFfkzzJwFMzh5no6YuW4A69urPLjr4XhtsRpJ2iHaH9jafSjd+ZxELOEs1tQBxfMAneEBPohUwKV7fqG3l93kF+Amc/yD3AD7wBrLd3QwEvELUcxYKH5EhvAc2vD0z/0VDNbS7ww9xqJnzI+djTpHk5rsn19KhTePHYz6UoPkX2ji9HEjXkQubICe9ZyXdHVvZEAhyBhzvnMQJMq75yQH4ELLZdCjH4jWoaJad0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6486002)(956004)(316002)(2616005)(26005)(186003)(2906002)(66476007)(66556008)(66946007)(8676002)(54906003)(4326008)(16576012)(8936002)(86362001)(36756003)(38100700002)(478600001)(31696002)(83380400001)(6916009)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3NMUnhhbSt6QnUweFBrdWRxWWRKRGRhbkZzWTdwWDRHZnpINFFzSVN5K2c1?=
 =?utf-8?B?TWN1NDFUaXBHcHFQRW4zdHo5bmxEa2l1SHJyTEgxbXhza2VXb3czMXlHL0xk?=
 =?utf-8?B?UW53Yi9BVElaMUY5UzdWY0l2bEtFZE5IVmt1VTVDVWtlQ0dQSHQyNjdPeHNQ?=
 =?utf-8?B?WGxGQzBMelNja2hIeE4wNldmS2g5NkhlNHBPaFJrMmU0YXFhMkh4dnVrVjRm?=
 =?utf-8?B?SDg5TVRVTElqdUovRitlUW8vNU1ZMzMrR0ptMTc3RWhaVUNhek9ZOFEveCtI?=
 =?utf-8?B?OXZ0UDA5SHZUSk1UNmtqNkFIOFZQcU5ueHlldXVENmk2ZXE4VTFnMkFRNTdY?=
 =?utf-8?B?cTR6cnE4cFRpeXZtMnVYRnBCSzBIblRUZS9PcHozOUdnUFBWVkNFL3QwTlJR?=
 =?utf-8?B?QXJaNHdxYkdqa3FUajZLZkpBMERNYTFDNi9mVUF0U1BwNzg5QlpoY0huVUNB?=
 =?utf-8?B?N1orL3VTaWF2Y1NUTlhkUk80eDVkbGlrOU1yRWhVMHhrSFRZcWs2SEYwTjNk?=
 =?utf-8?B?S2ZHa2V3cjFuOWVFbWY0a0RmNTNiNHV4S0o3aUEvWG1EcU8xZlp1QnQyK0xt?=
 =?utf-8?B?dmVrUzRZTVN5SkNIWmFQcW9qVzIvUExadGx0dnpHZGswaGRqR3dqTWkrYlBN?=
 =?utf-8?B?cjl4d1E2S3NxS1ZacEZmVkk3QVdBSSt3VGVka3l6bVpLb1FjejY0S01SZVpS?=
 =?utf-8?B?S010WE9ZMFZHd0M0TmNkZVhpNDdxZDA3VnBmQ3BydTlLcVZ6WmRZKy9OcXYw?=
 =?utf-8?B?Wmd2T3ZBUjloUWUycXoralRYclB0Y2xkY2MrekpEOU1jaTZjZm1hRFZDSDdM?=
 =?utf-8?B?WnZGNmcrRzlIVGdFeE54S0ltbGU5OGdnK0R5RXZBRGZ0WTBobm1lckJ6czF4?=
 =?utf-8?B?WjNuTDg2QTRLN1lSUHBpU0hFUWtXb1FYR3lTeWxCK2RGWXQzZXFGb0cwVGdG?=
 =?utf-8?B?VUhjUnNOY0FBOW9aZ2cyNjhSUDVyaTNWOEt0U1hTQk1RYXhIcFc4VVY2cktk?=
 =?utf-8?B?L0F5M3pMUkwvU0MxdFJRdURnRDhzWmZqalpGZ2FPRWgzLzg4RkJsNHJkMHo0?=
 =?utf-8?B?T2kwK2VNRUk0Z25ndEYvaGxkMENWUHJVVy9HSVJXRmxxMldFNWVRb0t3YTJJ?=
 =?utf-8?B?L3RvbzVTY0gzOVEwanRDUEs5U1hvcDFlM0g5clRLakNzVHZtMk9NZy9yQmhx?=
 =?utf-8?B?R3BDdGpzTndNekl3UDYxNVcyMG8zVkwxVVhoWW4wdGNVd1V4MldQSFQ3V2NP?=
 =?utf-8?B?SmtGRGI0RHZGdGhiQUFMdUZEWW8xSGdEMnllbHJwQXQrM20wTkI5R2xNb0Jq?=
 =?utf-8?B?UHdSZnpuSC8xRXRBTU5WREc2YklxaWFWMlZlWXU0WnNnbG80NzJJS2RqWGRv?=
 =?utf-8?B?eUhKa1A0cmlMbVlHMVhuODJnTzY3RWVjdm9KQXJJVzlFK1Bqc2lPYXVpWmMr?=
 =?utf-8?B?QjhlMVM3L0p3MkkvU2hBbnFRcHVuMjhxblhCeUdYRTRNaU5DQUFhb01ISWtj?=
 =?utf-8?B?VDZ1QTc1dG1Pc0tJTm9oaG4vWmwyTlhFYXNrRGx5ZnNEU3FTOGI4MnRTSEVv?=
 =?utf-8?B?SEhGR2o1Rmg2T2pqazBUYVh1bzJEZ2pKZisrWnUyZUlaRGdLT3ozRS92anZy?=
 =?utf-8?B?aTRSY1o4NWFPRmM0Ty83WVlLUlBvSG9uSkw5RERJbE5FOVNFMDBMbWxIUVZU?=
 =?utf-8?B?RDg2UTNEcVZFVkprTERoMk96dk02OHV0M20yT2ZiUFNSUmhQRUJDdG1GUWdn?=
 =?utf-8?Q?6XYna6K0MJTDDJwDYaXu62CqEQSGf4O7dFoRN7V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97fd0c1-b945-4d72-c851-08d96709b004
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:15:55.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoorOTeX69bpLIE5rw+D/sxn7A7imvB0nygUlgxU0NqOTBKwQQVhSo8wfIe5XRjioKWCbp2Xfe5zOpMY5KIDhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7188

In order to be able to insert/remove super-pages we need to allow
callers of the walking function to specify at which point to stop the
walk. (For now at least gcc will instantiate just a variant of the
function with the parameter eliminated, so effectively no change to
generated code as far as the parameter addition goes.)

Instead of merely adjusting a BUG_ON() condition, convert it into an
error return - there's no reason to crash the entire host in that case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -178,7 +178,8 @@ void __init iommu_dte_add_device_entry(s
  * page tables.
  */
 static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
-                              unsigned long *pt_mfn, bool map)
+                              unsigned int target, unsigned long *pt_mfn,
+                              bool map)
 {
     union amd_iommu_pte *pde, *next_table_vaddr;
     unsigned long  next_table_mfn;
@@ -189,7 +190,8 @@ static int iommu_pde_from_dfn(struct dom
     table = hd->arch.amd.root_table;
     level = hd->arch.amd.paging_mode;
 
-    BUG_ON( table == NULL || level < 1 || level > 6 );
+    if ( !table || target < 1 || level < target || level > 6 )
+        return 1;
 
     /*
      * A frame number past what the current page tables can represent can't
@@ -200,7 +202,7 @@ static int iommu_pde_from_dfn(struct dom
 
     next_table_mfn = mfn_x(page_to_mfn(table));
 
-    while ( level > 1 )
+    while ( level > target )
     {
         unsigned int next_level = level - 1;
 
@@ -307,7 +309,7 @@ int amd_iommu_map_page(struct domain *d,
         return rc;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, true) || !pt_mfn )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, true) || !pt_mfn )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",
@@ -340,7 +342,7 @@ int amd_iommu_unmap_page(struct domain *
         return 0;
     }
 
-    if ( iommu_pde_from_dfn(d, dfn_x(dfn), &pt_mfn, false) )
+    if ( iommu_pde_from_dfn(d, dfn_x(dfn), 1, &pt_mfn, false) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         AMD_IOMMU_DEBUG("Invalid IO pagetable entry dfn = %"PRI_dfn"\n",


