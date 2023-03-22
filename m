Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA16C46A2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513266.794045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuuW-0005rV-6M; Wed, 22 Mar 2023 09:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513266.794045; Wed, 22 Mar 2023 09:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuuW-0005pM-3E; Wed, 22 Mar 2023 09:37:36 +0000
Received: by outflank-mailman (input) for mailman id 513266;
 Wed, 22 Mar 2023 09:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuuV-0004gG-4o
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:37:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8ebad8-c895-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:37:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:37:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:37:33 +0000
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
X-Inumbo-ID: 2c8ebad8-c895-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI7S7CPhKoPrfD9dU5uug1veAm9R4yfrbNNiUyRUFA5MU0pq2NieJzVjiykeETrjtVvnpYubxfof6vum3lJZpUzQMuPLVh67yG48lNs+92P5sfOxBUWG9LS1LzjgOwgnvJPZyzbtu8mSpC9QtWNcF0V1CoSO6ROHFBLDX+qLvQjD4sKTcfCjtcgnHRl0eVc6wjqNWdF9EpbnbzZRw6txJUeqA8WdW0hq9zOFz5xJiljPJyPiuOB2coOuL7RMFk6mtjtFAm1QWNkcOPgo1cXPQC6vX3yDJjYOdH+ouFuA754XTEW1zLwQX41Euu6DpYjrYh8U36va8Yh5tdsIayQobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1l2fkRqRJiGKZyq0x1zbIscrbjHpZaIQjMcBMuPrbQ=;
 b=JMKjwBrSJO65IKZH/NCdMBPxQcrN4VQVMy6Y5CmzvWuuMmOPyfIPDOJS+h2kMhC/R0KDr0mJgPxDl51gmwLUfZ3tjOIz4VB8GYSpl1Mg6lckPDuMdLE0Hu8g50zat38MFFQoS1z/lNx+vnHPxB4uW2L+pRILjXwDudUEMhTUoyeRFcX0hVyCByjOYsoqn5fr7mbVslbMFHo1gytIQggUxk0pwf2zmFQDe/24nwbcVPOOKpf1FoibEvJxpwp0JxPpGevmFt0/SaSXZj0qIZp3k0fxkLEs36ieIish/bNAYXS/AAddO5MDdYP1Kplxu1HQxxTaghMKEJzLhds9zAvbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1l2fkRqRJiGKZyq0x1zbIscrbjHpZaIQjMcBMuPrbQ=;
 b=CjV/m7mlwUdrwiz5SeY+mfeIdDXLH9VvXrRw5BOaP9AdhqmPtNM1GReRjiexslYhtaIopVinag1rkJ4dYleotIaZEsTgCJFdRVtva21gZdJDPspyL1vMnofz0lOwGokaUWXIceli/a85JQRXhxV5iaw0U8ciKhXl/dH5fgzGD1M96md3kX7o/uWyMOLgXnVLhTeEmT3sKf3VWbrqdebDUu3V7lwHLFfmkysdqO5YnTO3rXeOdijkwR4LWqiFWaWn+BtrJHGcDZmL7fDG1MxmHcklRnzpTNpgng7AyJRvnsAmtLY7u8YxwdYA60PemI0U6TQnoWa5j81BpHbTiaR9SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3cae039b-e01a-b9fc-3b02-1139e3ca20c9@suse.com>
Date: Wed, 22 Mar 2023 10:37:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 15/16] x86/shadow: adjust monitor table prealloc amount
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a669e42-8b08-40da-1f4f-08db2ab91028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wG7q3a2hLk1mkVg3uXx0B3WljJiSmCR8aUrYSDBlwH8/wpD8V58//Mv5DcWJQJq8RvUyGfjaOZyIyD+7Y8VQHwSTmxi5qhA3zUuj17UZaS/bB9gUno2m3F8TqBLdhNFqRSAPc02IB/S9Y8/2m+yGjnfxZ/GPS9Clow2Zb4MhMPcPUAKRBNmFLO/pXr1za/c1cWwqEpqXU3yCWOaaodhYnz4B38kUCKoWSmyJxs78/6WFvjrA/WgZ8urm7VSlagVhZhWoDNaJyE8D3gYn+tThKLaIp1RfXEC30xUcbEDgTnWosdp8k4b5oi1BC3FYQuxv/ihQJyHGIz7zbLwjzRlbV4GzYulU3+U2L+OqTFQxunQs2ga37UCcw2/Huo8T26nbP76SLBMoF6pYqBmIXRnYocB4agP8IsaSKa74gB/H9AfBTNdK5I7SRCyOjwkwo1gfVpgHtZb1MtuP19QFQA2+JCejdNYSdjepfW7lFtp903cht7wzuyjYI+dMX/cMPSJa1xrS6YjbGC16mT1vi9+dPDYmqCSr5Gc4B/wfmRYLYRujsO7YINHeu59aWj11DlynShrGSQH6SYeKcAgIFQKicC4nGu+OS+09hfoYhwOQgd0SjmXoxCJuQrL9Ew3O5q6tMv6GPpCg6YRN/0nr/AVHEYkwHO0S5aJmv4kCy9D0uWxjTI7nlWbr1VBVVe3am6nqhN7Kv9JrGxzC/mIJBSizKcu7EfXsxj2suybRgfrokVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(5660300002)(41300700001)(86362001)(38100700002)(8936002)(31696002)(36756003)(2906002)(4326008)(6486002)(478600001)(2616005)(186003)(6512007)(26005)(6506007)(54906003)(8676002)(31686004)(316002)(66946007)(66556008)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlFYTWU0Qzh3eVFBdHBsMVo1Y0VvMnBZZEl0WXlkNkJxRCtQV2hGVDQ4a3h1?=
 =?utf-8?B?U1pGbldWR3hoRnRkenY1TEdwYmtUWjVXUEtZNzQvbnlhUDRQUGxtSEdqaEdF?=
 =?utf-8?B?K3dPK0REQ1M2ZFU2YXJTSnlCc1ZGY3VmdzNUR2NoM2dqc0Z2blowT25pbVV6?=
 =?utf-8?B?VGVRakJ6YkpIMzJOUzM3TzBDNHNKQjZWT3dqTk1GSmx0Q3BIb0RPR1kwck80?=
 =?utf-8?B?YURCUm1iTTA0TWo4WkJIYjVYTDhJSWdKT1NlK2xQVHdBcW5GaXlKSzVJREEv?=
 =?utf-8?B?eTNiM0wvQ0Q0dmc1eGxOMlAvQllmeGdqUnMwdWZBT29wQVcwVGFBV21IdjF2?=
 =?utf-8?B?RVN4WFZldFFycytsU1Z1N2ZsMDlDU3lXa0NDLzZET0Uwd0Z6SkNWTW1TV0xp?=
 =?utf-8?B?bGd4YmtsQUk1K2lVaXFjYXdaYllpZWx4M0R3MS9KNmtObzlSaHh4cE9jK3h0?=
 =?utf-8?B?WEVuU3J2ZWNzVEExc0R3N3UyQTJVVjA4YXdvcFJtOVR6RVExcWVycnpvamox?=
 =?utf-8?B?MDlaN3QyaFhYUGdCUlMyd0pmOWVMNFRmaGwxdERCNlp5dkkwRGZXaGZmZXph?=
 =?utf-8?B?YitnVm1OUG5CQ2tYOWs4Q2xndU5Ta1Q0YjdRRVlOMWNwV1RtN0tRMmtESXI2?=
 =?utf-8?B?SVZ1QzFUUlRHWXhZaU1OTEpHOEFyRW9UT1J6NU1qNkRrMHZXQytUa25ubkM4?=
 =?utf-8?B?NUhLVkFNQUxaMVdLSVlGU0YyTVBjdlVmQW5DczhuT0U0M3Y5dVFzREhTNnBO?=
 =?utf-8?B?cm5yNXJObklWT3Ntc3lheFRkc2s1NlVSZGtoNzZkT0Q5RUkxaUFkVG9sR2M2?=
 =?utf-8?B?S3hCTDNycGo1SHExd3ZwdGsyRlBVMEpxM1E5RmgydU1kd0hWNFVyUm9UVHd6?=
 =?utf-8?B?S3B2TVh3ZXZqUVlqVkpwcFlCdlMwMS9SVHYvVmh0VFpTV1FHYXNKSHVFWWhU?=
 =?utf-8?B?ZDNNNmxhYnJiczJ3cXRaMFM3U2RLK2lhTDZ3RGNRYmdkTlVjWGI3QlVDNkxw?=
 =?utf-8?B?UVM0ZjNZcXJIZldING5SNGhrUFAwYndCajlLaWc5NmRxOTE2QnFOd3Q4TFNq?=
 =?utf-8?B?MXBhTURibUhUaTltdjFPSXQ5elhZVStSeDhLellaRzNuRUJGbmRZQ3FLRlQz?=
 =?utf-8?B?ajIvOURoaXdlcHdCSXJBT1RRUEFwelZxVGgwdWJQWjJ4L0RxbFM0cjBwTm12?=
 =?utf-8?B?RTA2dkc1ekkvazd2VWJTWkJISHE2OFZ0OXF0UGF4bmFHdVVIMVRXUGdxQXhR?=
 =?utf-8?B?U2hiQUczNDg3Z3ViSzl2aWtkWHJ4QTFlbURNa2lsbFBaVFZnZVorVUJDMXhD?=
 =?utf-8?B?VUYzYTNaOURiY2hXTUFPZlJkbklPZEVRMWgvVlEwN3J6NjFLb3lhaXA0Vnhx?=
 =?utf-8?B?M3lPQzErNDBoK2ErSDhlcFpWOWhhbEhISkJsc2NSbWR0VDYyTEYybCtsWWNB?=
 =?utf-8?B?WS9vWkJZMlIzVDRyQjVQZERWRmtQb1B6ZmlmejlleEk2L0p2SjVPMlVwZW9p?=
 =?utf-8?B?bGtVT0Q4b3RXaUFwTlBYdUpIcnF6Q1R0RUpmWEdxNURnSVorUngvQmtyeGRB?=
 =?utf-8?B?bWY4ZUxhdzduaElVQ1FheWtiTU1HMDloalpQNWZPVjlJNEJwS1FRaGs0T0xC?=
 =?utf-8?B?V1o5N05VUENLU2dkMjhuNjhVK2FMYnpZdGw0L0M5eis2SGxMQnFNZXhUd0or?=
 =?utf-8?B?N3RBRHlMcFRVZHJkTGUvKzN1d01ycWRYaVpqc1NvajgvSXRINW52WENHNzdJ?=
 =?utf-8?B?ei93QWpPWENsSElRaEozRGUyeUVUdGgwdE9mRHUrak9wbXo2OHZJVzdCOXlH?=
 =?utf-8?B?YjN6RUZCbCtDeWN6SWk5d2E3YnhkRVMzR05YM2JKS2ExNW9MS3hmL3lUM3Za?=
 =?utf-8?B?cklnMjlPd20zLys0d1Q3Q3kxdHIxRDVFekVGS1pGYXN2eU85c0ZvdjFnTk81?=
 =?utf-8?B?c1gvU29GUXRZR0p3bWU3SHlrKzIvZXdxVVRLaG9iendYYmQ1TWNpOURKL2FX?=
 =?utf-8?B?ZXI3Tmc5Zy9YT3JpSC8rN3ZCOElua3NCZjV3RUhSVFUwYzF3dnFrdGFNQWtx?=
 =?utf-8?B?UEFsT0t6aStadjZQSFBYL0VQKzcwN1QzRWtOelVWb3hYWG1PQTJ5NTBveGly?=
 =?utf-8?Q?9k63W+bqgD9mrN9JCVugoNM3s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a669e42-8b08-40da-1f4f-08db2ab91028
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:37:33.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsfogPGEKFN5kbK+sz5UqEXX4n3OzEbExMlvGWxuSJMJAIhcXIgEYQVesQEpPGZU2WXauXNNpuhh9pW9JfH4dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

While 670d6b908ff2 ('x86 shadow: Move the shadow linear mapping for
n-on-3-on-4 shadows so') bumped the amount by one too little for the
32-on-64 case (which luckily was dead code, and hence a bump wasn't
necessary in the first place), 0b841314dace ('x86/shadow:
sh_{make,destroy}_monitor_table() are "even more" HVM-only'), dropping
the dead code, then didn't adjust the amount back. Yet even the original
amount was too high in certain cases. Switch to pre-allocating just as
much as is going to be needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -738,7 +738,7 @@ mfn_t sh_make_monitor_table(const struct
     ASSERT(!pagetable_get_pfn(v->arch.hvm.monitor_table));
 
     /* Guarantee we can get the memory we need */
-    if ( !shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS) )
+    if ( !shadow_prealloc(d, SH_type_monitor_table, shadow_levels < 4 ? 3 : 1) )
         return INVALID_MFN;
 
     m4mfn = shadow_alloc(d, SH_type_monitor_table, 0);


