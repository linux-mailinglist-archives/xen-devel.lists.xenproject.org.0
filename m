Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372CD4501CC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 10:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225716.389815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYhk-00011I-Vg; Mon, 15 Nov 2021 09:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225716.389815; Mon, 15 Nov 2021 09:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmYhk-0000yX-SY; Mon, 15 Nov 2021 09:55:12 +0000
Received: by outflank-mailman (input) for mailman id 225716;
 Mon, 15 Nov 2021 09:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmYhj-0000yR-E2
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 09:55:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e813690-45fa-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 10:55:10 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-_GO-9aQRM2SyhL9kntd2pw-1; Mon, 15 Nov 2021 10:55:08 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4244.eurprd04.prod.outlook.com (2603:10a6:208:5d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 09:55:07 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 09:55:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0330.eurprd06.prod.outlook.com (2603:10a6:20b:45b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 09:55:06 +0000
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
X-Inumbo-ID: 1e813690-45fa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636970109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xrLdRTjZHUzRTgOrhvxX4txdtoE8zxn/hwkst9Wzoc8=;
	b=ZY+KHsjD594DpN2Rkd/aG25jo//WwBbCzF7UOlELLXjO+qiUMFRq0AVuPoS9FdGe693scp
	JDwrr54bGoplRITHbkvfksvF9M7iq43NkE0gAYPxzbjeCaOLyoqW/0GVZRzawOHH5hz1/+
	2VuxyGHQN2vXOJMhci1TFZJ3vcJ6voc=
X-MC-Unique: _GO-9aQRM2SyhL9kntd2pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYXS5tG8cVUlWW/oleGmnGYsLyZg3gvvKpr3fyHicuUj0gJ8V3vxakegtrJIl3cREUM4Z4ABRoNoBgXlfb0MoQIPnGRp2YTyN0o7TX4bFS2GZ2/XkkT73X7KfB/gIKlisPhv3fcTGMIhHjf7EQYPb7yR3hqi+LQscrRKHkgzON/5orWS9F4V2iCzCPjeMltfxpc3BmQNgmcGjjBnO7PDYjl43dePSSNArxHHyAcWPQhdTESmoRoGRzPxRR1mQ/yJdjs9W/VYSqrmzVZI3/TRkCUgeh6oQOb5ym+8zsFO3Q2K81CC2nrgrvq1xosQR4bx7BCYjdzuZ+bC8MpvmBNhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrLdRTjZHUzRTgOrhvxX4txdtoE8zxn/hwkst9Wzoc8=;
 b=XaoMbnqhh6TcaX7et6iq917rCFAUEmm8HcWADRZEhvyWH/ngSzvqFXRSZsNSjQmxYduyVuIQBPWOzmGI59kBzkPr5KqM3b13lgIRUtX8vp2KDcxW9GRHeR+VSPIWdEH+a5ZFoCaymfrJuB0S25juGLMuqvbe95LL/hqa7oG34l4pfhS8VtMNKNHQhD61giqc1BQmgSMxR5qoOx1BZbb6R13ZGsON6HQ1Z20fa41taMXNqrJ7XdU/Q8ytjzLTNExn4oFnYrU3/bkYfd+FLCaoSu1oeifli3zrErH43NLaSikdk0Ghf8R1nj8a5mbTO4A9T8MN6J3gYc7iYZYVMCxinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e6e23c7-4416-405f-8bd1-bc5b23ea587e@suse.com>
Date: Mon, 15 Nov 2021 10:55:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] public/gnttab: relax v2 recommendation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Luca Fancellu <luca.fancellu@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0330.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::9) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e506618-6b84-4414-3613-08d9a81e00f5
X-MS-TrafficTypeDiagnostic: AM0PR04MB4244:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4244FA7D92E4B2DA4036C88AB3989@AM0PR04MB4244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+QORIrDfWCpp4rohaP+ker4a/gpY8SR60oIM2MZJNeBZ0C+q+M1RS0iGCEeV3NViGmgMLvvwr4Kc8CaG4NkUGreY3+keiPIvvEwUeYc1CM8tA5C/hJUiJbo7WPIkh31Mz2DJPTTTemq1hiYtyW1Vrh+mxxz8JO0ukCL/kmE6ptg2Vv7cP3GTBs6KOGgKLXRLHkKi/mPRR98RV5A0SkZdyXgdIxgg1H+v51HmbewFa+iG1pKrCZVo9rniAavmzeS8npWq8OoeEjKOjST1lkzmJIJve7A4OTCI9l0wY/x/aGappnrdHzQjhP9Kqy3ZWIAsI5uYLYMBXBV7zu6jHVnAa0V2s2CiYra96Bo9fqmXLFJS8k16ptl/Nu++Ga1hVevCLTEFkSJKdNTgyq9mZLElEGvyhAz5n9k3Yt4aSP2iDMq6dsPO99UAsNCoDLl7zhxwvQ/cIIObrHxwVEiCtMHEoQP1eDRFYckXpXkGWkW8oTHp8bwMiHQCjOZ01BeV4ZHmt2L5E6p07deZx2phI0eYeadHFWIW8aSJt48Iub3P2XYszUz0/PBtJ6vuR8hkrXfwC3PlGnaqV87PzAitQbUPYcgA86BaUJ20/Owpv2Ka+lHC8qoqExlZ3pZTRiitriNDqZ4XmN3FzhQ41+W94TapmULkYGLXhs5eQdTJqz3l1xBEbhLPj7KFm0pwLn3zIwWQidrEyb8xnZC2RHndcQrb2ti5ZjHKRdC+B9jYGnMxDuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(2616005)(6486002)(86362001)(31686004)(5660300002)(2906002)(66946007)(186003)(54906003)(31696002)(508600001)(83380400001)(66556008)(66476007)(4744005)(16576012)(6916009)(26005)(8936002)(316002)(8676002)(36756003)(38100700002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlcvVFJtNlBZdUhvQVk4V1FPRHZFVzA0R1dHQzFoTHJMSC9iUzZ1dnMvYkE4?=
 =?utf-8?B?bXMzRXYrZjNINzBCcUc5dEdvRUJtcTZIN0ovN1RINTYyUmxOVkJhVitZUXln?=
 =?utf-8?B?eHpSbVkwamVrRHc0OXZKeEptZWR5NzJHNjE5MFFsbGFsUEpwY09zbTg5UUdp?=
 =?utf-8?B?d1E1U2VwSmduMzdnNFkvcmJoRzk3ZXlQYUVyNVplYS85SmQrclVMbkt4cGxm?=
 =?utf-8?B?NDQ0eTUvYnBVNmdNMXFMNnVZQldHditJSnc2NnlXeFFINFUwQ2JwZWN6TGxL?=
 =?utf-8?B?TDR6b0p6RzlqOWZud3loUmZsS2dvSHVRb3htSEpaSlZzSFF3bG8vaEdiM2R4?=
 =?utf-8?B?ZVhjR3VnbHBibTdwT0xjdlBMYVltYzQ1YXNzTU1ibDhYb1JTRFc1ek0yMkxC?=
 =?utf-8?B?dWVpcXZ6TXkrbW5uNlorSHdvNC9GdzRHK2lyRkluSGtzQVBkcEM4NXBOUi9T?=
 =?utf-8?B?Z1hVMHlTK0prMzExdFpEV1Y2Y0lod2MrZWZhMktDUHdFbm41dmVrR3UwbEJs?=
 =?utf-8?B?WU5JeEZYSittM1BRSmpuM1RTRllpcDgxQStVRjByNXZ4NTdJeDIxRFFzeUNU?=
 =?utf-8?B?QjI0TGNMWHRYSnExWHdZQWpvSVJ0ckp2eGhJU1dtV0hPQit6b1dDME5sb2V6?=
 =?utf-8?B?bGFmYVNyV29VcHFQNWpQRmtRVTI1eFRyb2NQREtBc0RhOHUwWGsvRjZaLzlv?=
 =?utf-8?B?MC8vbS9wYTQzSkdiTkNrRUJzWnZjaWJxY3V4ajhWZmZFa2JvRXVTMi9jTXNZ?=
 =?utf-8?B?Yk8xQTg1cVJSNEExR3RSNjFRdnQ4OC9nUzh4UUV2ZVdUUXNjTHZBV3REek9R?=
 =?utf-8?B?VHJ3L1VwbVVJd1JjSjJ3YU85VCtDVjl2bGxZODhGQ1VCcHF5a3ljTE0xcGdG?=
 =?utf-8?B?ODRIUW0vR1NTeURBTGdtaTY0ZjdvaXFMeXFUYW1ndTBnSmVIOG1ONUdMY0Zx?=
 =?utf-8?B?WWxXTEh6MEVSSER2MHFDdUtlL0tYQlh5Q3B3WXdxaWJDZlNEL25GeGlYK0FI?=
 =?utf-8?B?WEtONUdqaXFPRnZyQmVRNVFENDBHcm96WkVMU0wwQkpmUTVDRzFsKzZJR0xF?=
 =?utf-8?B?RmY3Q2NKUysrT2YxMitkQWxZc2t2SG9mTUpsQ2ZaZ1k0U0tscXp5Q29IbW8y?=
 =?utf-8?B?YWNFRDVhYmplUC8yVjFEdHQ2cDJBZFFNa2U0RlNaSlgrSzJKbE1Ja1pNUktH?=
 =?utf-8?B?djd3ajN5cmlHQ3BVZ0RvSlNQeit4ZzlVR2RsRnR1RzJIR202MElRaXFYS1JF?=
 =?utf-8?B?Y2srbUFhOVZ4WjVUcWxtYkk5Q09VVkRsKzRCQVNzcTh4bmxVZXNFa0h6cXQ3?=
 =?utf-8?B?RkphNVIySkpzYi9CNFovTXN6Rm1vby8yYVlvYnFiU1paaEF1SE9DQ3g4TXcz?=
 =?utf-8?B?NVRuRXhTTDhtRUdtaytMZjBQbFV1WXZjZWlDUlpzdFZMeVNJbllyNHNhUk1Q?=
 =?utf-8?B?RDNzaU03MTlUb1FZVk03cnRDY1NHYkFKNDV3WittRHRrUEEzWVQ4WklOaHFN?=
 =?utf-8?B?VGZHaTArTm5RVDFzTmJWd1laMXo0VGNLak92Q051MHQxZ2JaUmloam84cjV5?=
 =?utf-8?B?aGtURU5mcTBxM2tRaHFJekZSeXVFSVN2LzZKa0I4N2NEanlNaTd2NTZZT0hx?=
 =?utf-8?B?ZnJUYUF2VXZlT3hvTUF4dXdtcm9SdGU0V21hcWhjbENTaXF6U09LdG1ZdHRP?=
 =?utf-8?B?UkNxa3dyMm02em9MZlc0K2RRMWxPZXNTdW93QVpBSkpzM3JFbW1sWGJ4bnc4?=
 =?utf-8?B?SjlWclNQaHkwbis4VEM0a2NZUythMTR5QjBjaEc5MzlvRGJqQ1QyanVPMlpj?=
 =?utf-8?B?UG9rNTRFc3YvTDZjem91ZzI2eEtjRGtzOE5JdGhTY1hnVVQ3cXVOUEVlOFhl?=
 =?utf-8?B?M2lMK28xY2MvSi9sTWxJN3RMTllpb2o4WGxFVlRQNGVGcDdhV1hKQVc3NmN4?=
 =?utf-8?B?TklJR0tWd1NsUnFCYUJiNklCVzlYWXFwbXY1Y0VGcWxQNXdsUytrdUdDZUhT?=
 =?utf-8?B?WUR1dFJ2L1FoWk9DQ3lYRm8yMXZtV3VQaGE0blk2UVgydVdKWGFNOTJmczFw?=
 =?utf-8?B?N00ySGozVGh0QXBUbU5rR2tJb2RzMFVLYXorVnd4UWdIYzJWdXR3RkJCNDFv?=
 =?utf-8?B?dkQrTEdnR2tTY21mbEp4empIakM5dnloNHRJc2VMSkI4NkJTRGszZlpudTJM?=
 =?utf-8?Q?YIgTSP0XnlOzmc94kuYiNGw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e506618-6b84-4414-3613-08d9a81e00f5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:55:06.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbzvXeVKgOuxHECyvbi+5M6lzQrVKtdzvQVyj9L8BiFu2cwpTywMCQo7T0oVQxhyfsUzQR0XqjDLcQE0vtqOjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4244

With there being a way to disable v2 support, telling new guests to use
v2 exclusively is not a good suggestion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: s/be able to fall back/default/.

--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -121,8 +121,9 @@ typedef uint32_t grant_ref_t;
  */
 
 /*
- * Version 1 of the grant table entry structure is maintained purely
- * for backwards compatibility.  New guests should use version 2.
+ * Version 1 of the grant table entry structure is maintained largely for
+ * backwards compatibility.  New guests are recommended to support using
+ * version 2 to overcome version 1 limitations, but to default to version 1.
  */
 #if __XEN_INTERFACE_VERSION__ < 0x0003020a
 #define grant_entry_v1 grant_entry


