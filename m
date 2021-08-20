Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFB3F26BE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 08:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169231.309143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGxva-0002J2-AM; Fri, 20 Aug 2021 06:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169231.309143; Fri, 20 Aug 2021 06:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGxva-0002GU-7D; Fri, 20 Aug 2021 06:22:54 +0000
Received: by outflank-mailman (input) for mailman id 169231;
 Fri, 20 Aug 2021 06:22:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGxvZ-0002GO-Cj
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 06:22:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 198f0846-9136-4be6-b291-01a78c460aa5;
 Fri, 20 Aug 2021 06:22:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-oR6nrMTnODKb5eBJo4oDGQ-1; Fri, 20 Aug 2021 08:22:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 06:22:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 06:22:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0274.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 06:22:47 +0000
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
X-Inumbo-ID: 198f0846-9136-4be6-b291-01a78c460aa5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629440571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flwBwBVXfU+MlPOnrWXz/2YdNax8UTXGznjYRY1Ujb0=;
	b=NmQ5INklPKZPYXn+MF11d+heD/6ZKjRaiYNmpDHkr5yY0FPf3VMY+DPASHJ7mlpir2AzT3
	QqxsEs6vFKNyFrTASvX1bWl3/yl/mfL8jnFtnq2q3exmI9V5Ps5txTjZAODedhT3QxBBOz
	v6v3R7Q2GfXcJrra647UTqEBjU7+fT8=
X-MC-Unique: oR6nrMTnODKb5eBJo4oDGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6e3Ne/wOiQN1crXTyVB7sAB8rNbgne9sqSZhl9Mn+njbq4J5tSubH12xIAobpUaZc+DL62L2TR4RgTpO0jsCGtiuUfdSjx3t8btzirXJ/ZAOKMBxEGvUHwzihl4mUJK2ml1+G7Z7sZ5ArG9vBI2pf796NItOKwS5lQv453ZF9B1XExDQnMW8yOcoc/ExdzLQorBGTlBvBSq9BbsPnNM0MjQ+ZYinwhuNlM/k1xjbQ3dMFmkvya6CpBHvYJBZiLfFQWx4i68Pz8AJO6aqtxnLM6mMbE6A68W5enoGr99Iye7NTEsRev95A+Wf+kS9v3UmNHD6211/3A2qtgLt4NWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flwBwBVXfU+MlPOnrWXz/2YdNax8UTXGznjYRY1Ujb0=;
 b=TSWv97OlHG4MgBzYwjKc9+1ZEMqn1J3CJPnLxc6UwWZqtMV8H7UKmjt7Cw/mILFPLnuBZy8UR1f7zWtFfmoN8cipv0/Gzzm8Qy/R47/2WUWyt9OsO6R/SSVYC7nnRFrJXJYS8E8D50fMS9o3IMX9f17qSzf+uvbjKJe04xDaYKitSABYf4+YxJMvy7BSbH1QJQgW65exwn0pkYHzk+GUYcWbHR0m6OUfgtZsPngCoE7VgETFbceBZH9owY1wH2krDg76hly2btUnLEpeoinKzpKKv9HT+TmKcj2yxDcCmo2eJIRMyI8+NN9ipYmZ54/6YCSzrWSkfxfvZeOIW8hNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: account for 32-bit Dom0 in
 mark_pv_pt_pages_rdonly()'s ASSERT()s
Message-ID: <14ed9a42-981b-da81-9a30-6ff9b3896bfb@suse.com>
Date: Fri, 20 Aug 2021 08:22:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0274.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc43f1f7-f542-408d-e0db-08d963a2ee98
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33919B9943490D6E73E8F707B3C19@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JaiaoMpiWyFmMcFNtu5nNG1AavYrY4cKaEHxScyJs9Ta8xJNnvrdetraFAA2iNCjN/F//89tRWqz3RMSQQD9fUf7krtJZNaPuzH+oRzk19ea27sYgjq/8Gz4BeI0lCJdVuSK0ns21/gGQs7y6up9tuAGRu8yCStdIfZrDCq+Or0hInNr3rMF0O1f65nDDRRBhD76PXdJrCG8CdO/XWr5KbnhmxFNznJzSYnjmHiJuFJMrvrncvyNoAdvFJQf6ZtNJQBCcuufFrca/0T+jKxS0cCOqvUqTEUjxw7hgp/YUq4BrSuA+02+v6DTaC7N8JYm2+3hgk1uIuVe1bE1dYtnzlPkM7o4oQZONs98f36XDB2G+ihoVtwWEq2AwEkN5pR+Nu020ESBeVKFWX+33ih9cQ7CA2AdvVidnEoKupS+0hY+mZLmnOshmIMwMUU/11jncXskStn0AtaqQV1HHAMTdvvMYok9QWVx6Uos0ZwZ0MsfgHzNDnWOsiswqmqyJI93qy65664Aclkhc4csakUm0Pv7UQl+r0+JVOer0t6ZxOwJqMQazegLp+1zMH1E6VQ75pA5+4UFbOg/AtlIL29rZMlPbDjYWMOVbE/Szuj6be26Az9A34brEGoUianYJy3A5CJ38TxWUqp5dSN4nUHFZdgnvjnSWaNL7EeySw1wvpcwBl4E6SJYrd4nTuvzIvVv/RLCM25YztzqWTwjfvODM9nEGMn2csRUso0Fr4C5vww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(4326008)(4744005)(6916009)(26005)(8676002)(38100700002)(508600001)(86362001)(956004)(54906003)(66476007)(36756003)(66556008)(186003)(31696002)(16576012)(31686004)(6486002)(2906002)(316002)(5660300002)(2616005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnZxYWorTUhhZm1lZkhyblRmL1Y0SThJUDJHdFRvSEdwdzlzZHowSlZmSkR5?=
 =?utf-8?B?K054SEV4Ky94VUxyZ0s3TFdENUpockliVVJSYU5Vb0t3dHdmamhmVHlXbllR?=
 =?utf-8?B?NElnUENtVEYrUUQ2TDhQVFBNNExaaDFQRG9ZVS9ST1oyS2Z3cXgxK2tvUTRX?=
 =?utf-8?B?d0E4bkk2dUppN242UjR0MzZZS2hna25zZmYxUXBoWGlRWkhGc09UaUMwWEFC?=
 =?utf-8?B?a0h0eFkrVXQxcDVQbDlVQUI0cGVWa0h3WVMwWUJDcTRDOXMzZXBzRDFoZ2xj?=
 =?utf-8?B?ZTRaZmVMVThiNUl3aSs0T295MkZvalZBQ3N4bERIK0J6Z1M2MzdyN25Pd1VT?=
 =?utf-8?B?MDZDWS9oVnVMeVdLeTZQQlZiUldQZ01qNFZ1SzNTNEtQMDVFM3VFcjNiRFJj?=
 =?utf-8?B?NTZNS0hjRWVoeDBNd2F1OEY4K1BTSFI2ZndGcmNVdmNUeEpvRmdQVE1HcEEz?=
 =?utf-8?B?d1E1V0Nxc1FtQU9zVThJcWJVbmh0UE9NdEU2NlZLbDVwLzhXNEFqWTNUTUpP?=
 =?utf-8?B?ekd0OFNmUkFYN1N3Q3lEV004c1hYUDkvcU1HbHBVaTYwOUpHU0pyU29raXJu?=
 =?utf-8?B?eEhRUEYwOHJzbXJ6MjhSTlMwTjhtRE9aYjlxM1NkUXUzS21Gd0lzZlhST3M5?=
 =?utf-8?B?Z0pUaXlQNS91V1ZiaW5GVmNpeHNTaTBuYjhLdmdrWERIQWdQUTQvS1BLSm9N?=
 =?utf-8?B?YndHVzc4dnRNVyt5KzA0Vk1sQ2xTSTVyUFRZVUU1UlpGcEswY25sOXA0bDcw?=
 =?utf-8?B?WFBTc1NsYXpoVjIwREx5eS9ES1ZBZWVZWitvdVBUdnhRSTByVmh5QXNpNVZO?=
 =?utf-8?B?ay9XOThKMjZKbzV3bE5HTEtiQlhqaFRZLzBLd3dWbzFER1c3c2lJa1A3enJC?=
 =?utf-8?B?dHY1b3E4Y1UrZEV6Q3I4Vm9jbUVLV3NTRElFVUFoSzcwcVRYN3dPVVFHOENo?=
 =?utf-8?B?TGJpbGdxZ09XUlhKQlg1b0RtNmJQbTdqSHhzaTVCTElDWW93S3RoR0ZPemls?=
 =?utf-8?B?THBzOGNTbGhIaDRuN1hVNWFQSmNVenRDNEZPY1BFWjZmWjJuM1E1bUh2VVkx?=
 =?utf-8?B?S2tKUy83TnBwcWd3c1lQaDJmMTNhSjQ2MGRENVhLNm1jelI1UmVyTkU0Zzhj?=
 =?utf-8?B?c3NqL0tMa0g0OU9ENFh2Q2w0dlFEUXFLWWR2akZSMzdPTmpDMDRXVzNJOGZ3?=
 =?utf-8?B?SGlBS0gwVEViWFFZY29PQ1N4OGZPUUNWbUFOVXEzWjViU1ZWb29DNlhDZ1lP?=
 =?utf-8?B?ZHJEVWM3S1dJelJKalZ3QmkzcENIU3VDNHgrVlFISVNVVWZoTVVrRXExQlJy?=
 =?utf-8?B?YWpQREJBUDQwWHEwKzBOTHQ3YjBWa1BOVHI5Rm56N1lxVXhoRmlBcmFQcDI2?=
 =?utf-8?B?QzNLV2Z6THFheWhoOTF5NlNwSHppN0ZuSUFZNEM5V0RWTEFWaFQ3c3FFOWNz?=
 =?utf-8?B?YUV6TmE4QXY2SlFDNDAxUVBCNWQ0VE5tV1BLSXN4OFl0dHh6OEhxbkpHYnlQ?=
 =?utf-8?B?TUllSFJNd0V6SGtBTDRUaVlSeU5ham5tOUdXVndWdmVFSDBhWml2S2dXK09P?=
 =?utf-8?B?bVBkSFJSUVBRMHAwNGdQUWcrMVo0S25sZERVV3dXRVhQd3o4M25GdThibzJB?=
 =?utf-8?B?WGYrVDczblBxOTR6RkFqMUltYStoYmhvTHQrR1h5L3pVZ01INEhFT21GRGJJ?=
 =?utf-8?B?TjRMSi9UZ21BQXowenY2SXh5VE1vSlBJSFRZYlpZdHRCZVQwclFjZTZPUjd2?=
 =?utf-8?Q?RqhYkoN5gx0nWWxK3Fmsa4F9qLO4yR+GXmKYvmq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc43f1f7-f542-408d-e0db-08d963a2ee98
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:22:48.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oh3LP1u6q0qANjUiklUQ0Ge6AQ/qH0N3bSkIi7MqLvK255DrtnvZm0cVk78omQ8PUe52e1ps1aHl+UZbV+JZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

Clearly I neglected the special needs here, and also failed to test the
change with a debug build of Xen.

Fixes: 6b1ca51b1a91 ("x86/PV: assert page state in mark_pv_pt_pages_rdonly()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -67,7 +67,7 @@ static __init void mark_pv_pt_pages_rdon
          */
         ASSERT((page->u.inuse.type_info & PGT_type_mask) >= PGT_l1_page_table);
         ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
-        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
+        ASSERT(!(page->u.inuse.type_info & ~(PGT_type_mask | PGT_pae_xen_l2)));
 
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;


