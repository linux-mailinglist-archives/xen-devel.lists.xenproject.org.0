Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E984C3B72A7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jun 2021 14:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148030.273385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyDFe-0002Ay-HC; Tue, 29 Jun 2021 12:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148030.273385; Tue, 29 Jun 2021 12:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyDFe-00028Y-CA; Tue, 29 Jun 2021 12:54:06 +0000
Received: by outflank-mailman (input) for mailman id 148030;
 Tue, 29 Jun 2021 12:54:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyDFc-00028L-DS
 for xen-devel@lists.xenproject.org; Tue, 29 Jun 2021 12:54:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef57f87d-8817-4ae0-9ca9-c9824f20a7c9;
 Tue, 29 Jun 2021 12:54:03 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-lOfWBJs9Ni2Afeco7YpR7g-1;
 Tue, 29 Jun 2021 14:54:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 12:53:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 12:53:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0030.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 12:53:58 +0000
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
X-Inumbo-ID: ef57f87d-8817-4ae0-9ca9-c9824f20a7c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624971242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T+KmuULkjATHsJkpBCbdQw5XA9fzShGhY+AfPy7XXqk=;
	b=GW0mdIl42Rn67IlRdwV7lkkiFIWbK2LmZEnb+xtXNSmAN8mJlUIq7Iu99uiowt8kbLC5yo
	j94W4UjzXBKZeWD9uneUmOEqMECjuvYm1GAMutyvYQn6J04Vu5tVYCYFlYF6AhGE9xZ7RG
	OMivXR8izP/MT7lTFWy9hSrcNtLOVLs=
X-MC-Unique: lOfWBJs9Ni2Afeco7YpR7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJp63VXxr6xepdm84a+yyqUxl7uPfYouhqPTE4A9msOjGJWuFo8OAgwuqbSDVazY4hHCx7czaZnmUFuds56khZH3X9ai8Ik01cuOwRy+vvWd0vDdnVCD5i3mGbv62WeGRk+HVMJNydaqfTLa9dG/7PZYTGRKg1nOhz93dDoV698LFTlahapQDfxtNysYBNumTw2aNmPe+csO7E3qdwYedV1XzY16X1qYavC/8rYhb2RE08pl77G8Z4xYwJeZAoRk2J6Y4XoNFZG8L2a4YM7PCOjJ6umo6D2rPuv3MyuqpxvElpFQC4KTr0FLrPoKuHcS4sBkabSXdMbqZwtSZcHt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+KmuULkjATHsJkpBCbdQw5XA9fzShGhY+AfPy7XXqk=;
 b=TKUCEGsCho7705fA+y8Wl7Yj85Jz134ObhNFPuu7RiflzwAVA35hzpB8oh9KLNaS2WHoGo/tC+6sxokpX/r3Z+PxzWWG06GuwOtye++TXoukpqAARRVsFd9Yas7i1bfAyyDKelP3d3rIDo8/cFJ3d8KgRlqy+Mc3CmUMfC1UAsVa/kXv/gzfOSFNZ3+PSYE0IXLw8pfaGTgXnJD+dAV7tXDrNZOyf1hpYVQDQ3c2z3ZOyINBYmEGxlYwj+j2sSPy3er0tkgzljYgOH0geGqMLOyPxV7im3+liNyXuZ9fBSyy3IucyAmyQlxcsPR+ty49ZrD9z0JqJs2I7AIrrhcQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] x86/mem-sharing: ensure consistent lock order in
 get_two_gfns()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Message-ID: <932211b2-c3aa-17f6-9fed-ca762e189786@suse.com>
Date: Tue, 29 Jun 2021 14:53:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <dea13187-04ce-9c1d-aa5c-e2cd0a7d42d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0030.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2559226-2be0-4a85-649e-08d93afcf64d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61733E61B5D3BC10A9D1674EB3029@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P8VcGnUHIYnv+6pewCXD/0Z7cxBpynvDmlpqY/4743HLzqHJTUt44pIe108Bi8379xR+ytNB9xcgmApFk4t/XwVwnQuZOaoGUWiXXyREXkK51wcWEHj4wZ5c7NaG3hFcjMBzgfpU45IbwRtmEhkcOiUpdnt3O5ICC702i3qxXrx7FAz1fgj1bvECF2rn89prOWgxQUxCE7yZzBxLJuQ42Q9nAPJnGQlrX8tWLpyYFt5qkWPmqMjYGnzzuOgUG5otd6bgmtYr2PUtkRsVJQaPTbyyP8rz1SsOJar2+GTb+juYmMziUSexXu16bEq88rTqZ1nldiLiD7yaK8Vt8RttHiSCj90oe/qwrPlRNBxyMfpcO61KeEfoUw0IWNGycUBmSm2lbltRYtvfarIoaUNjbcjZuEpC/DUrL4IYVWkotclrWieKFj1i4X33zLL1bAzSO+VyDe5w6dXrqPI3x7gas2zyLQn699I1GZ+XQ1zSoYlGYdWX/HSdHl8+GedN48CZvx1hNQ4m4OBzGXJeku3vw7Js/kNBUO+uaxViMv2GQxLLkRhS536mbs/EZTr9bqJjNCP0IWxgO5nFD4RzOaQtkILsH+eqpe1lGA3NXFqP7ozm31KNkF9m6dpxIBTd7iUMQqV1B4EikwRRIVVfQAKbRVr2wtMLfhqijt8G+PrboxIBssDMrChwY2Rhvfn4skUgkO4RqKHlmxRb8HRnv96Jvqxcm+AZmRwYr8KImgpjF8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(366004)(396003)(376002)(346002)(6916009)(478600001)(5660300002)(66476007)(66946007)(956004)(4744005)(66556008)(8936002)(8676002)(2616005)(31696002)(86362001)(38100700002)(4326008)(186003)(16576012)(316002)(6486002)(54906003)(26005)(2906002)(83380400001)(36756003)(16526019)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmNQZ3dnRFJQQ0tmd2ZBNENNRVNyWDlpMjJrN3Bjd2lFM0dHNUdwK2lYRVND?=
 =?utf-8?B?TFFWTlNlV2hwVnZjQUhSYnB1bkpucnMvWGVydFhGZGZpTnFPazhGUmZCNlM5?=
 =?utf-8?B?REc5NFNTSmc0VmNEZ1lzSXQzMGxlSEpMcGlYaFBmRjU1MisyUVljZGpTK1h0?=
 =?utf-8?B?UjkweXd5MklHd0htMDE1NnUvVXcxakdqT1dwei9KbXV4SFNCWlNXWUxnRE8v?=
 =?utf-8?B?VElUTXJQelJ6MFI4c0c3V1BXdUZmTDdQOGZLZ3dNYUVxMFFtZHovV2RVN3hH?=
 =?utf-8?B?bnlPRHh4Q2h0SG90b3pmU04wMkpHc3Rwd01qZzcweTl0K2dnMU1RdStkSWpF?=
 =?utf-8?B?YU95YnI1K1VEN2FzaDM2b01BVUpyRG9JLytiMXVUUTJMK3l2VkpTeDZ3STI3?=
 =?utf-8?B?RC9UWXBuL0lmRmRLUS80MWZwY0p6QkxZMlJNZUlpbXR4VFlOWVE1dHM3NlNx?=
 =?utf-8?B?ZndVRHVpNkdVZzF3Tkl4c1ZaTDNTUG1ndFRTQ21ZNWVrY0lkWUxVODBUVlI5?=
 =?utf-8?B?M254akVGVlZ4T2VkNFFWdTl0MFVRNDR4b0N0WUF6cW5SR0dzeVAzUi9kZElu?=
 =?utf-8?B?a2N4MS9iekIxNlhlaDRhYVVDOHI1czZXWWRzSTdhQ1FJZkQweXU3L3pTM3Nz?=
 =?utf-8?B?U3p6Z3hJdnBvQnpzU2hoNXNYcmJWT1lWSmgvSEgxK3JDeitEUGJIWFdvYVlV?=
 =?utf-8?B?ZWp6Vk4zN3lOYzZJaEwvQ0NnQnJXVm9WdUJKcHJFSi9IcWdIb1YxZ054MjMz?=
 =?utf-8?B?T04vNkw1Z09iK1Z0Vmh5R0dYbDRFQ0oyK1dYekE0UUJsbWtFMDFWU0lGU2Zm?=
 =?utf-8?B?ZkZ2cy9XRktIRmx0dmpmeDFlcFZ6Q25CKzZXMmtlTHpJb1pqeWJEZjJ4eDBM?=
 =?utf-8?B?NW1CM2xEakhzUW45NDNtMHhpdC9kalZjM29ka0U0TDUzOTRadTFxckFHRDFt?=
 =?utf-8?B?SlFISEZSU3A5MDcxYjhtbXlXZEFBNWx1RzNveG9NQjB2cDJvUnlCcW5Xa2Nt?=
 =?utf-8?B?My85VHFQZnNOaDk5eGZTUkwrOExocG1WZHV6MVd4Zi9FblhlS3psU2J2QkVs?=
 =?utf-8?B?T3NoQUdEc2E2eTdoUGY5UGgyQU9WdGdBSXVnN1ZUNUtxSzZ4bVhuWXJqdjNZ?=
 =?utf-8?B?UzhBZUZDeUdMRHB2aVdkVnlEV1ozY3hhait0VDlpVm8rM3BzdGM3Ni96TWhY?=
 =?utf-8?B?QXh1ckpYVTNZTjhrbzNiVytGTFU1SG1DUmxGNXE5ZzhjcEFwT1RKWjZMb00y?=
 =?utf-8?B?WUc1UlRHVGVTNE9RRi8ydXBnczVRaWg5c0NwU05Fd2UwRnQzUTE1alNIejl0?=
 =?utf-8?B?SUViQURVZEhsUHIyYmRGYjhHSDdpNG8wQlo5NTlEbTdJcVJOeDJYZ0ZmWTVn?=
 =?utf-8?B?VlArdHFyVzNtWEs1Mm13NFg5aG0yM2VrYXVsTWRhTlgzNHZnM3RkNEZPVFpZ?=
 =?utf-8?B?Q2IvbUNrQmxwTExFZ2hRQTdkZHNEQnpFS1RMOUtXcjJwcVZLbkVwbmhxSjdi?=
 =?utf-8?B?RXp5dzQveEdQdG1xSWlxNEMzaCtnNjhpWW1WOWNHeG9YSmVjWjlxMURlYmhx?=
 =?utf-8?B?aUFJMUFpWU5xWXV6WG1kVUg3OEtzMkV3MUg0eTVYdEc3U3MxQ2V5b3ZVWVQ0?=
 =?utf-8?B?Vy90VXZDSjNVMXFHMGhNTFNBckd1Nlg4NWZMZWNKQTA0MmJTZXVaQ2R0MCsr?=
 =?utf-8?B?NzVpbWYvRDNVaDA1RHBNQW9NYzc2aEVUMk1jVUJuR09TN05IRStiS0x5L1g2?=
 =?utf-8?Q?kO9HFYO9qIVuIQ0Mn1+O9iyu9O7ru71DW/u7GfE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2559226-2be0-4a85-649e-08d93afcf64d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 12:53:58.9062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 551Q3KUvvOJr8Smxpnd6k7c407l4Ox9Sph4ylRooHd+S+HvqT3RJwNOGAPvkKjvX232TX8OWCDYhksEaOVZbbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

While the comment validly says "Sort by domain, if same domain by gfn",
the implementation also included equal domain IDs in the first part of
the check, thus rending the second part entirely dead and leaving
deadlock potential when there's only a single domain involved.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -587,7 +587,7 @@ do {
     dest ## _t   = (source ## t)   ?: &scratch_t;       \
 } while (0)
 
-    if ( (rd->domain_id <= ld->domain_id) ||
+    if ( (rd->domain_id < ld->domain_id) ||
          ((rd == ld) && (gfn_x(rgfn) <= gfn_x(lgfn))) )
     {
         assign_pointers(first, r);


