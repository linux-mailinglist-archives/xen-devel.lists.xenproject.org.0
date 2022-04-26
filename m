Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E079F50FABC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313737.531450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIW2-0003pH-FX; Tue, 26 Apr 2022 10:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313737.531450; Tue, 26 Apr 2022 10:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIW2-0003mp-CU; Tue, 26 Apr 2022 10:33:54 +0000
Received: by outflank-mailman (input) for mailman id 313737;
 Tue, 26 Apr 2022 10:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIW1-0003mh-Kk
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:33:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dc1518c-c54c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:33:52 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-8ANpQQuqNriiBUF16WuF7Q-1; Tue, 26 Apr 2022 12:33:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7785.eurprd04.prod.outlook.com (2603:10a6:10:1e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:33:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:33:47 +0000
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
X-Inumbo-ID: 5dc1518c-c54c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650969232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CwmrpSe4Pw1W+yGYAm1bkOFDuNoRZOMh4sYLYOv9c1Q=;
	b=lLuAvcXYWAdHU+zWT8oo7/ANshZobtR9JZFV8RcvEst1bqMbkMZo+H9lbSVHltbtShOlGj
	tMX+DhnE4vFyOAfxHm/D/7JTgdFQVs/dZeTqluSfL3eo8QY3zog82zZXQWFzrJOaVzaZf9
	x4EwLN11kN3CuB+VmiDsgpQzdVX4JEQ=
X-MC-Unique: 8ANpQQuqNriiBUF16WuF7Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEZswY+zDzt6D+JLGSv8NcbdQ0m40KbmEURIuHq+kl/c578jd5/zAA5OL8Ey6UIi1b/rQX8/7Y0tnZwDd79awy+BdRY5pXID/F5rUR+j1CZv5oFdPH9QQqA0acZu0B4nWT/D9c8fNjMygCOmRmPUrorN0rxrrSkez3S6Y3zDazguwvVoXPy50FEIqH9HN9rNI1wW7vfSlLvOxgemqI7my8RqmWfSrqcqO2bsPXwIbmnPbmVf6mr5RNKf64vTLkXgL8BbJt6qdAAIBBpQRov9aNdoo+n+ccjm1bSuQzaPOwAoccGKV1rzmS2ltYqBmMkfRwsCHF9bD08ehIuR4qwZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwmrpSe4Pw1W+yGYAm1bkOFDuNoRZOMh4sYLYOv9c1Q=;
 b=M5utKc4lyUOZmypDSJJE/T5uklOqMy83J07QS+hE+nPeloMaKIR46qM+eMNpYTZHH/5gLfPEVMuZpRLfJMrf3HUFu+WIFP9bh1ntelk9E212knqovkmrq1qw/ReMKSvfqzrrLxxNHH5wY89NGG6P1unVS9fiiAFbsScxYkvqntm4lQzZeWG3W8r/wxwZ++KdEmPdXEbC1AknNZEmhxmkZSNwaTuFmA7XZIbLbpzZZKUjzZq4F1XVrF4wjRo3hoKVwRvQOhx7cvO3cDFPelf5R0LXBs1NQIOw7s1f1+0o3nuuybl3QiQWjipcf/lbHVYSNRfEEvZQtz0OUJ+LSr8Yuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acd0dfae-b045-8505-3f6c-30ce72653660@suse.com>
Date: Tue, 26 Apr 2022 12:33:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v1.1] evtchn: add early-out to evtchn_move_pirqs()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 162d85c6-39db-4f04-9ecf-08da27703f1c
X-MS-TrafficTypeDiagnostic: DBBPR04MB7785:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB77852EC061845C3E723EA89FB3FB9@DBBPR04MB7785.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oZPVwWgkOTXAvy1A62TpepsXeK5cMP4DUNVUhQYwmmGDOneu8I9Qt2lo0Zp4otZ9xvjPtdY3vaM7b8AWQs8cx9o0fWknJRsWlFQThsKv6mkmvDmZJ34XwU9puazqNo+Pz7lwF/iT8EH4hVBRJnhu2ol589xsAdCLa8YfmrAmQcVz6RQIFqXSdbFoLcvZ9KNkKrwjDwN1gW+i7Esqqx7QSLWYGy0nbDs+S8c+NyYV8vcX+hfnA4DL6Ontf7jO0Za6aQCw6FU8n3zYhcWhtZxb5AEEii+NDIFZdl9yW4Str3Q3eifE0y2QbEFrPIlzzwotIzU/jPDJ33rwnxmXdMKBvUkfmMyPfPbhoW/pVbaxBPxLudqXX3KT1E74k6wVXvbdJbgz28PlJH5L5pbidrKWteheqbUf7DcxG/2xA4557mfZjJ/vLZBi/jWT3k1Lgw+9oSr8O+czp3MVVgovkdya3R6JYnm48Xx4UbRu2Ldbzu51mfWwbK5fiZa6m0NrnWsE0pdRk6LahD3Tt1YdkHig8tuA16V1kMl41pgIpR7Np64BaDxmnSNREbn5kdvgZ0SXOxPDvIYfT40ZWstJZn0WuVpV0A/TEgCytrgfDB1802a7qW3LMMXwFIalmaY8exMiKvYPBVOSNzxMT6LyU22Tb5T3MpgiiLYqG4TnEpxvZ/XQJTzh3IO4xYPMY1KtZDilpcSCmALN/tOCwBSeH/9xR8B8iPQVqqHP+F8KGoIIo/7M8OPIvnHVW94JPye/hQAK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66476007)(86362001)(316002)(2616005)(66946007)(107886003)(8676002)(5660300002)(38100700002)(83380400001)(2906002)(66556008)(6512007)(6506007)(4326008)(8936002)(26005)(186003)(54906003)(6916009)(508600001)(6486002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9jMUZRZkhObGRWNW90NnBsTEJENnZNZ0dHbm5hR2UyVm1kMFZtcVRlY1pv?=
 =?utf-8?B?d1FBZ3YwNHcxeGx0UFdEQ1ZidktkanpoODNlYW9LR2lDVVNSMGdkVWNwVW5K?=
 =?utf-8?B?V3VacHk4WWtOMWFDTmhLeUtjdzNFVjhyTWZnTmJDRmNHbDFvWG9FY2NkSFFq?=
 =?utf-8?B?aDZicnRDUUhYN1grU1ZidE94b25IUWNXS0MrSDFEZGdjSS9tTnU3WEVBVko2?=
 =?utf-8?B?QzVRcFU1Nk5XUU9ZUExjRGRvNmxXSG4wVmMrMmNXMGF5UktLTWdxK2F0UENt?=
 =?utf-8?B?UFg0aVdDWU8wZjZJcUd3MlAybWZ1L2FmZ3JiSjM5dTVXN1p4dlQzdWZTTE1W?=
 =?utf-8?B?UGFZZzEwcVZYeXJyUHV2K3htQmNmYllJN2FYZFQzNEVCZ0lOYlBDU3pTekpH?=
 =?utf-8?B?TVNqemJlazJiV3VHQjRzWElreEJrR3lXTkxxQmZTcFl3Z2VsYWVpaWRiTmRy?=
 =?utf-8?B?cXRHMUNXbE9aWEZNakJieVFrZ1oySjRuVCtBR0JKa29CaW9kdGFlNDJFNVRI?=
 =?utf-8?B?VXJCYXhJS3ZCS01qd28xNTBocUdlclluWWxlWjduV2pnYmo3L3BhK1VMYTVZ?=
 =?utf-8?B?cTBKYXc4ZEJNOWJFdnltMnM4REh4dUtaYnR0UnRRdzhUeXREZTVQTC9WUklX?=
 =?utf-8?B?KzZZVkt2SDNNMHRmTCtZRTg5eC9yejBoSXdxQVhISlpybW53NFQyRDZWV3Rl?=
 =?utf-8?B?MlB1TGRwR0V3VzBCYTFyMnNsaUlyZm56THBxUzkvOXhPMmEzcnUrcklWWmcw?=
 =?utf-8?B?dmZ4NjVVa1lmNVorTWsyZEVZRC9GQ1dTYzgwaGdld0R6WFVLVEduMVB4MjNR?=
 =?utf-8?B?dVlhVzRhWTVNSGJ2TWw5R3cyUGxGWWkzRHNzNlVQYkEvSkRwZjd0SGVjNkQ2?=
 =?utf-8?B?ZElvd3MveGw2Z1pEL2VvR2ErNVdNZ0tFSFowRVRYa2h2eUdMM0tBazVZaXpp?=
 =?utf-8?B?c3ZBVERaQkpPMzgvSkhJK3FJci9yMlBSd0tNdkhKbUY4RUZ5M01SU0hLUERa?=
 =?utf-8?B?VkE5QnJHQkJrS1ozVHlwZTZUWjNnaVZwcC9BUnk5NU9Pa2pLdFNhYjd1RnVj?=
 =?utf-8?B?eDllMDl6OFdXZEFoS0s1SE53T1JRbDY0VVpMUmU1L3ZJc0M2V0pNQldDYy80?=
 =?utf-8?B?MndjbWRuc1ZrYm13R1dSeEE3WXRGT1RTdGV1U2NZK1NLcUU5Nm1mem1xL1lz?=
 =?utf-8?B?ajd3a1c3TU5UbG1MVXEzZjlIOXZSS1ZlTUtPdytiMnM4MnBhQW9SWk1iandt?=
 =?utf-8?B?TlZBdVUya09oVHBXS1pxbGVPVENFc0JDMjhIeHRBUlhiNi9yMGRIQjc2YWdh?=
 =?utf-8?B?VDZXMDNFM012UlE2bHdOUmQ4VmRkNmlXMnBqNUY3VUJWK3k5Z2Q2TjhhdmRQ?=
 =?utf-8?B?M0dXeEVzZ2czMUw2N1lSVzRiZytqT0UyUU9mTjZoNEZKSGdEU01VdzgzSlJJ?=
 =?utf-8?B?RjJVb0xPUXNLUUpKOUhUS1BOL1FQekJzNVBnWU5Dajh6WmdiYUVsaithTm91?=
 =?utf-8?B?WmFaZ2JUWkJ3R0RsVnVzeE5mci8xS2x2Rzc4RjB3MGVlaEsyUWZ1ZUxRWUha?=
 =?utf-8?B?cExoRy9xdW5pVW5STlRybWhXSm1aVCtCSCtEZ0tFa3piTTdvdXRXMDhHUkcv?=
 =?utf-8?B?RHFQSTBVS0hOZGRkMHpYOFBHbWhrRG5HRkNCQldibVZ3UHNiS2UwMWtvbEpY?=
 =?utf-8?B?ajFUMzRUcmVqRkdmWkZ2T0FETUJyNnkvUzE2UXpjWG9SQ3FZVnF4ekhVK0FZ?=
 =?utf-8?B?ZHJEL2dTbUZaQjdGTU5SZUVPM3NqZHUzWndEZkNKRWFpemZOdWFnTVlYQTNU?=
 =?utf-8?B?RlN4U0dkTjQxK01rcW5OS0pxaGxJcjFMZStReGxsTXJKQTMxMldENXBrNmZB?=
 =?utf-8?B?d0RaT3BDZW5ZK2Nmb2VWLzBhb05uTi9JV2lYZ3hVcXRQSXhLaE1xOEdTNm95?=
 =?utf-8?B?RERWenp6aHVFYkdVaXlPd3BDblBpd243TkVZM0dOVUtIRVRoOXMwRUFMNEFK?=
 =?utf-8?B?QWwxNG9SWlFnaWtpanM4VjRkb2JneC96a0lSdW85UTQxMUJFV2dMSlhRNU1k?=
 =?utf-8?B?THBaQ2dSSmhveDlpZWVBVmtGRjZ3Q0J2T0J1VmN0by9ZYzZWcVJKaXNPWE82?=
 =?utf-8?B?UWZFa3FNNmNSZ1dTUzBJN1ZXOTJyelJiRHFyU0VaZXpIQmRNZEJEdks2MW9V?=
 =?utf-8?B?WnZ3V3d6Mzd5cTJ6N1JmTWNPcXBuUE1HeDc5MkdtN3NjZUxKQ2xBcEUrN05r?=
 =?utf-8?B?aUhRTjRldHIzNVR4Z0dQS0N1STNQbjcyb0h4Rkp4NktRYk1leUxPeVBXOURX?=
 =?utf-8?B?dlJBYzhraytHcVhFQy9pSXVYd2NPbGx3aURDSS96NXcyL2VpU09FUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162d85c6-39db-4f04-9ecf-08da27703f1c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:33:47.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaEI3f+nRMFE76BclNJOQBcOR/zzJvGFWSctUv57eORlJeFgriyuEnTQ5EYLjWqTd8GXHNU3FAAF6FEElNfH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7785

See the code comment. The higher the rate of vCPU-s migrating across
pCPU-s, the less useful this attempted optimization actually is. With
credit2 the migration rate looks to be unduly high even on mostly idle
systems, and hence on large systems lock contention here isn't very
difficult to observe (as was the case for a failed 4.12 osstest flight).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
     unsigned int port;
     struct evtchn *chn;
 
+    /*
+     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
+     * vCPU-s they're to be delivered to run on. In order to limit lock
+     * contention, check for an empty list prior to acquiring the lock. In the
+     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
+     * until the vCPU is migrated (again) to another pCPU.
+     */
+    if ( !v->pirq_evtchn_head )
+        return;
+
     spin_lock(&d->event_lock);
     for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
     {


