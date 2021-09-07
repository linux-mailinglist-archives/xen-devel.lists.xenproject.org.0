Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9C4026D7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180753.327548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY2Z-0003Za-O2; Tue, 07 Sep 2021 10:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180753.327548; Tue, 07 Sep 2021 10:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY2Z-0003X2-KI; Tue, 07 Sep 2021 10:09:19 +0000
Received: by outflank-mailman (input) for mailman id 180753;
 Tue, 07 Sep 2021 10:09:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY2Y-0003Wu-Ag
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:09:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8d6043e-0fc3-11ec-b0e1-12813bfff9fa;
 Tue, 07 Sep 2021 10:09:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-RKsAUFFINoOolmJZdNIdKQ-1; Tue, 07 Sep 2021 12:09:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 10:09:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:09:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 10:09:13 +0000
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
X-Inumbo-ID: a8d6043e-0fc3-11ec-b0e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0znofO36pU2FD4CJIYFn7aacsI8GwthcODXsjcIpWgA=;
	b=P+ppK0OrA74NFQM9G9e/qTuREoS7DdeGPF3fmZjyAegAcNtIs2c/yxiJn+K+j7S7RDvN6k
	9PSwcNeUyREwBnnxmrDaVo71kI+PvYqCk7YPmcmMYrEs74KRY5U9wOHK4QZ1AguXm048G+
	LOkEl8vfKY8eOpL3QLm4ielkSpUlIZY=
X-MC-Unique: RKsAUFFINoOolmJZdNIdKQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+Obh2I+xU/AOuzDzVsCa3QogoiyJWgpxdsjtcqpsayydXyYGSVdx53aa5oEFNnLQWTNr5LIf1Xf9cCMzLOm7jRD0ZqDXrd5FAp0NT1WUmLyQqnb8Dq6gOgP3tfJ7ftAkk6bL63PsxdKHPLGO4raT2qGpOr1xZNsQUh/fA/lnW76GjXV1xzyPbtz6cP+FKqbjFK2qVtkYzQixTKG6EWvRq2aojvD1DOJ4UE0x1SgG1aMt+hZkt8W5hiinkL05Zsm2ID5E92FimUK6/pd30RfgZe3m8d4nIj4auhkkAeGe7e4Ox7DCKqrFWCW4nRBhgvUX3OuX0fCUAA9EK4rLlY6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0znofO36pU2FD4CJIYFn7aacsI8GwthcODXsjcIpWgA=;
 b=bPEHIaEv9JYVoSbY+gvx5oyBVL1BqnjFPM4qZbZclx5+Qmy7GCDTKEjJDC3kHJ5L5uZ/7CbZ/rk7Q+4Ji9TPj9FWzGPjojIZf6gImmPwTAeTmx9HjcBVfwHHG06pnOeXBFTPDlD+MyodyOXnqEaVAF3ovQP99bcmmk6kyfktKgI70vS0DOnMTBWo+ijj1Si7UAWkCeXjIQyhsIDBxWGHRoEZHEJF7TfnOChTVwH2/NrneIsLzzH6ogEQdBsQbrmeKyqdmNYciOikikmk6ZMsqn6KCi3tzl32lFWXXG3Kiwxio066IUC5Op9h6tczPI7uUZ9bHTYmtafJZdLpG0xv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/9] xen/x86: make "earlyprintk=xen" work better for PVH Dom0
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <ecf17c7b-09a4-29a7-6951-1e0b0dda3c67@suse.com>
Date: Tue, 7 Sep 2021 12:09:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0071.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2155bbff-726e-4d13-9c57-08d971e78b31
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617617206747D72C7EC87873B3D39@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DqSxuuek7MRKqM9FPJxyC3RCob2LpV3j0q4Czc9nWvy5lx1gD2hV6b97MKRao45nN6Rf0ZGl5TIP7GFezJ5VWq6m7SPYwi4bUKd2x8bCZ2cHGspooh86kKm1T+4IW0rL1hySEYgu7V8ATig+QW+LtJLpMtzqHniQvOks5UpWVp4oKc0NyFFGD/v2J8D7HHU/SakxcltURskwnlgIOFAkoHB1Ag3xOHnsfUlkRKupmBtwuWzdjjQVy5uJlkX/V//bBRi/kUDQPXhIZp3I4tCIros3z6E5lpirYVhfIZdxBHDzhMGXrQ10mGK6uUu77sdtNaXSquCijFDf/61E4c9RvSq16xukd0CqtTqwnu7vzQ6aFneL5AKympo2pruHHd8uBbT1i3GVyqlToT6JbLj/VLJ7X1XTcFOJDDrCgR3wBqbAsZdToghOo6HtslSsAUtZ4PGgubRQEhLwsvrcJpTxamf7cCraU2DR3N2aomPbiObPlzpEGVckcl/9Fk3k6zWumLbKhH8bF5n1DS924BdxCfkO1YwZ5yDODuyOlSz8lnHpr5WRFq1WYdL7k5lb2FYfy4IX2AQNirM76DIPvqIdTRRzKsDMDdiVSzhe+Eek+wYIh59PrHyGmouTdfxXWrhFynm183fRx5GM45KeL0QU9RuU35LIFUlRxl3z7f8JFmPrV3Qhk3UCHODjnwH6gMXB+U7JF3aJPFjn8a6flYB63sFsl5+vvBK5MsHhBoMRRqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(346002)(396003)(376002)(54906003)(66476007)(66556008)(2616005)(86362001)(8676002)(66946007)(4744005)(31696002)(956004)(26005)(38100700002)(6486002)(4326008)(8936002)(186003)(31686004)(36756003)(110136005)(316002)(478600001)(16576012)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFDS3NmcjJhR1kzSkJGL1dKZHNTUGFnclJLajhBZHo0R0lTOUpiaUxZZHQ3?=
 =?utf-8?B?b2FISDc0V28wdEx2ZmYxd3hNUGZvYmNJZVpIeHRWcGVMRVh6SGZGUCtMWXd3?=
 =?utf-8?B?alltUmdXU2hWOWlpQmpXYWVieEdpMkV4MHlDSWJDaEV2MThHbklSaVhTaHBl?=
 =?utf-8?B?Zlc1Tzg5SVErbzN5YVNkN2ZMNnRUZ3pyT1piUmhTbjZYVkRjOUtSYzJ6MHJR?=
 =?utf-8?B?aTFuL0FyNVlsSmRFS05SU2hhZmplTVM1NWpub09WNWpnSTBZTmZIMFVkajF5?=
 =?utf-8?B?MzZlQnJlVjVSZmkxQUFtN0d0S2tLcXNwVE1ib05BenVnV0pKNFBIbGkydm5B?=
 =?utf-8?B?OHRWSmlKNWJLaW5kRVBCYlJzNkYxZXBmUjdDL2s0Snk3c1V5Q3d6RnZlRThL?=
 =?utf-8?B?MmdwQ1VXN3V6VUxvQi9aeThhblhzcGlydHFxVkwzWVdiQzVUcE5UNnZIeUVT?=
 =?utf-8?B?djhQY0Y2dEh0V2JzTHNWcmk3aUpKV2U0M3E2NGRWNG9IY3Nva2ZKZGlGMCtQ?=
 =?utf-8?B?NHc1UWl0eGNOeG1YK0FUeU5HQWpVYzFPWHk4T3hWNG94N3ozNTBFM0Z6cTVG?=
 =?utf-8?B?TjdiQSt5cENnYVFEaDFWM0ovaW9kTUxnVktPRFArVnBaSzFzeEphRXIzRkVO?=
 =?utf-8?B?S2dPbk1ySCswOXk4c0tsMXU5ZHR6Z0U5WnJlQUZTWXRUOVA3SlVacWF4UGpi?=
 =?utf-8?B?RzBRY251NW1TN0toOTdTcTl1c2xNQzVkTTRscGE3ZkdENnJ0SGd5TTE2OTlK?=
 =?utf-8?B?bmNlM2lZV2FTVElkaGQySDVVcUIwUXZ0QzVaU2dMQ0NTcElIcHNmVmRyTnox?=
 =?utf-8?B?Z3BGYThRTmgvdC8rZDMwZ1ZEMXhwRmJxeS9MSk1TZ2ppQjZqd0t5a212MGJW?=
 =?utf-8?B?dUpKRkdzTmxZd1RrSGpId2tnZkF3ODVFZCtUdytPemx3SmZ3SlIrTzB2Wmc3?=
 =?utf-8?B?ZHByM0tHaWxkczB6bkl6elcwQjRFVGRCajBwMlVla1ZlaUpETlJhbE44eFhn?=
 =?utf-8?B?VUhEZVhjS1BKR2VERGRCSDBFMzdwdmEyWjNXdTN4a0xXcklHZ2NhNU5vM0h4?=
 =?utf-8?B?MDZtWDMvbWtaYU5aRkpHVFhpeVp4bjlteWJiNzUrdHVHbFZsN2RWb0tMaU1s?=
 =?utf-8?B?d2xEekhaWXI4K2t6MTdVMW5NT2o1VWJZUUxpTkpuQU9jS0NDdjBpUWo4RWRJ?=
 =?utf-8?B?VytEbzc0TXZ3TzI2ekMxK3pQUkhPNFNsb1QwcTNIQ25FSFJuQStUUUN4LzR4?=
 =?utf-8?B?eENJdTFnNWVndW1Za3hZdVpWeVczYlVFSzNiZUVJalZ6R21KKzRCYm5qZEpL?=
 =?utf-8?B?SHZoeHZYd2FlZ1NscjRUNlgwN3ljTnVBVG5sT29pRjhiMi9neVg0SzZTMmIz?=
 =?utf-8?B?cWRLOVhYZGRqZlFNSFJFN3RRRjl5ZHRHL3hNcWdKVTlJTk9mTThQL09VZE44?=
 =?utf-8?B?cnF3ZTNtZ3RpWlFJbkJWc3JmMDBjYnNPeFdTSXNOMVArSG0wV24wMnpScHlQ?=
 =?utf-8?B?bm9KUngvT0FHZStsb0lmZTFCeGZLcHY0UlRSYVd3ZWxqS3ExWTJTbW9BMEsr?=
 =?utf-8?B?cWlYYlRCSjFCQjhld0dPdkZTQ3NHaXVESVlHSUcwMythaFRuQlZPUWZhTnRu?=
 =?utf-8?B?V09GOFVPVXNiLzdtbG1OU2N2SmE1RVBTN1h6MUg0MHBxTUpKdHVreTRkYVpX?=
 =?utf-8?B?VTdyYm1oWlZFL3JKRUlvdEhNcjNhNFNmTTdncWNsbHRiQzN3aWt6dHFPSlpR?=
 =?utf-8?Q?DjIWeRVkRORIhdVaYHAohA9/jC3HKzFldnfQ1ev?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2155bbff-726e-4d13-9c57-08d971e78b31
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:09:13.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLBaJrGAjz0mRLQNZfUZ7RbXTndV1ys3SY0nFWniw1bduL2b6Kt5dDipo/9yF0nBg4Tk6gqy+zazSQGQxlYGZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

The xen_hvm_early_write() path better wouldn't be taken in this case;
while port 0xE9 can be used, the hypercall path is quite a bit more
efficient. Put that first, as it may also work for DomU-s (see also
xen_raw_console_write()).

While there also bail from the function when the first
domU_write_console() failed - later ones aren't going to succeed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -632,17 +632,16 @@ static void xenboot_write_console(struct
 	unsigned int linelen, off = 0;
 	const char *pos;
 
+	if (dom0_write_console(0, string, len) >= 0)
+		return;
+
 	if (!xen_pv_domain()) {
 		xen_hvm_early_write(0, string, len);
 		return;
 	}
 
-	dom0_write_console(0, string, len);
-
-	if (xen_initial_domain())
+	if (domU_write_console(0, "(early) ", 8) < 0)
 		return;
-
-	domU_write_console(0, "(early) ", 8);
 	while (off < len && NULL != (pos = strchr(string+off, '\n'))) {
 		linelen = pos-string+off;
 		if (off + linelen > len)


