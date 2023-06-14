Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76766730182
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 16:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548859.857055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9RJP-00024k-Re; Wed, 14 Jun 2023 14:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548859.857055; Wed, 14 Jun 2023 14:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9RJP-000234-NB; Wed, 14 Jun 2023 14:17:27 +0000
Received: by outflank-mailman (input) for mailman id 548859;
 Wed, 14 Jun 2023 14:17:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9RJN-00022y-Tb
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 14:17:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f39f322-0abe-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 16:17:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 14:17:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 14:17:21 +0000
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
X-Inumbo-ID: 2f39f322-0abe-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWGUC04IMIeomgJxUZd0DhVwXdHfwYESptrcyXe+tn416jpFA8F1yL0foQNsFBDp2jTwFf+Ekyewqba+GOugKvp4Y0T6TDu2tA9GUBztETjjvBnBcovuWGGzuG96u8O+qJXy5woMgnanOpVOweYyM4vh1BUTNQcApt7c8UETFQqcawrkjjIjnLxUPKMeiUdLt6QTc8fAwgNWj8b8jc/LsQOD7tri2chKrjVpLX8aOiFusuhpTFdxdGHheqw/X1XlBGlifmc23ef560/Gsw2pqVA4+a+uuGFwLIxquaI7BnUzl9g02NczBhcDpUga638BbfkYaoNn9apR53ar8Lq2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cunu0xp7pvxz5mEERk0+Akla7p/Ed2j8w9biXRMSufk=;
 b=TSSOswSe1KlAL7iO20MePSXXJaoJnn8u3o4U1BnxZ+JdP81c0Hh7vlqNRTT2Yvuxk5x1oMTZatHDT5zO8q6SSHDGV3QQiYr/zr+G9JFr5Yb/Dt738dshYfl7k7Rch+I86kv73/v6klctDXFC5gHtAaClDdgHrYzNkNOByVP6lZlP2DB5p+iO/5+Bfwqb4S+EkzfmZIxi2ZedKJfjpRWmah9X/dGz5CZutDi7WL5S1eHLUKrjcg60r2BthIDHkrp+lotheFl7OkKgIRT2nJIgrO16YycZoiHXvrt+2Bco9XnNp3nVI3Lmjko7uDNVXkQ4E65NjPgLgLL68B7O3itofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cunu0xp7pvxz5mEERk0+Akla7p/Ed2j8w9biXRMSufk=;
 b=JDPsc5kCn0DLfPt+sF3tWyBIH8Q4Bwd0M0S5t49NmmvU21dW/yTtEqgcXM1RAPLqoIKMkKpXq7D9nkcucQGga18Mu0rn/D2JFeKcI6EJQXA3qNWQfNctV8JSOVkn72cTh5EzE9UaPKilql6aB1cjziWy9TAPe91/e85dfjrynDAbZbcQO3Xq1BimAyZLkG0KMPZy4uO00uQraYUJlBc91mL6wWMHE0HMCUSxuondLj8yjd9g1Jt/+wnZMKUPL7uBKKJ31YRdMcXWoabILbG1yqdQ9QH3qH0uqj2Hvw6LchUoIYxD08AyfsbCv1GslZCi4qtTSWcf62CHfrhBR7dt/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd75280a-167c-6a1d-87e4-edbffe12cf3c@suse.com>
Date: Wed, 14 Jun 2023 16:17:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Federico Serafini <federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] spinlock: alter inlining of _spin_lock_cb()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 30dd9b6f-cb6b-4ec7-9f51-08db6ce2119e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zd/pwKBJFd+CDWuasYrqtwxbIzHxS27uH6OH0iLM/0k3Vwewih8e23K6EXhF8Kv0Nf908ugWXzitt8dMtpoHWDmDrAxwf4sxuqiTvvZy1ZUIgYHVt22PyFcPyClXPKOivKjHPX54iSWGV8HPgrwqnNw2nS/Cu7v7sqxON9aeow2kNtkcNFF5TjbBaxX2CzRAwdE3WTJRqTPTyF3IDJrBfTsHiz0cq4alrKL2saw+bt2vRL4/sEgJFnwvgLO/I0CacZB+VcxNLNX7RkuXwwJp4g6pMR5xTtocBET385dYZHeBwzWLGPbLRdMbNv9+75SIoctx0Mb5hTacbXSQ0n/5NIlTas4QU/mgL0Ti8RYTiVpU4YY26bSD8ztbwGUAGgS7VsWib7AggKJtyutn1YDNNJ8kgc91W6Dg5NyRDZ4HcZIcv4mGg7W9k3wdAroWr347zGw1yIRkcAvoratLhnZ+nqNDBHqzODvmp1AcKdcmQcgfqHEiLKXT+q4zPvIWTtv6jezI/dxu7odvDim6PtJ238YtKIXc3sOCSTJlJ8Z332BdR69rnlIRXzIM8EPy0IR44Y/r1lg5+dw9p9QD/1nAPWu69xWo4AnCkScpWkXJpYwnlZYhQu3f/zTY90Zy5AT6t67S2zLn2wZDmKekdO8AcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(83380400001)(5660300002)(186003)(6506007)(2906002)(31686004)(2616005)(41300700001)(6512007)(8936002)(26005)(8676002)(6486002)(316002)(31696002)(54906003)(36756003)(478600001)(38100700002)(86362001)(4326008)(66476007)(66556008)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmJqUFlhckl0dlJPUDRPaC9scHBKTG1vaGV5bWN2Ym5NbHFyZlFQTzZoSXpT?=
 =?utf-8?B?Y2FPYUR5a1drWXdPczNhR1YwTVdaTUdXS3JwNlo2c0VUK0UvSjJaaFNoQU53?=
 =?utf-8?B?bE9XTWNLcnVXRGpENEl5aVBnajdBT21RMU5WOVR0cUUvVDJlNkJXZk5wTTRI?=
 =?utf-8?B?dTNEMmFWMmpobzI4UGRFbHFuWjJvUUpTK3pNdWtQMWwrN3ptRzhWelR1b21H?=
 =?utf-8?B?bVJEdlR1NkJHL2lSRzhTMWpyOHJmSWFTc2NvcmsrRTVYSjV1b1ZXRDU2cmR3?=
 =?utf-8?B?bCsrL3k3RHB2MmNQLzExalFDV2hiZVU2Rlh6djRZZFNTMnlCNzhPU3k5RUlS?=
 =?utf-8?B?aGNKME80TGN6SkZreEhUZnladHphVUZpTXAzTjE2UjQvK2FWeVFLaU84T3ZI?=
 =?utf-8?B?Y0R3ZkQrZVIwSW1DbU42bjZic2tjNXMxc1NaQ3dVN28yWE5KQVlRZ28vaEU4?=
 =?utf-8?B?aUczNUc4cHVYZWhYdlNtdEhrUFBTWVdtNEczZWhibnlHQ0NreDlXZmNJMUZE?=
 =?utf-8?B?Qmw1QTJCQlBJS0d6MkdOR0JZMjJPMnNtYTZWNXljVzdzcytiYnp5UDkvKy84?=
 =?utf-8?B?bmlKOU9CNWNtZTAySFUxdkVTOHVsd3lKeWtjNEJ2Mk1QSWlyWTljRjZ5RGdz?=
 =?utf-8?B?Zlcxdjk2bm5DQStNQ2VQeUxPdGpnVWdsemwxbUg0L0MzaVJVSTU1aGtQRnZW?=
 =?utf-8?B?Y0NYRkVjcHh2NFo4WUNmZWxpOVVpa0R1TEtVR2NPOFRUcFBoeWMrMEYrSmVR?=
 =?utf-8?B?aDdRUGNPcWRNTzJNMmVvZGZlN0hkbmVyUE9nZ0wwWjNKYnBlYjJ2TDVVcUtn?=
 =?utf-8?B?Q1pua3hzZEtRekduMENpYXJXUXBLZWRBY2EzYjhQbnBBZFNnYmZEMStFODky?=
 =?utf-8?B?T0tFcmN0Y25zWEJZMW51ekZ1bTZSbUFxdERZeGtlTUo5K3pBd1VsMVlOU2JU?=
 =?utf-8?B?aytZODl4TTFlQmVjYSt5ajJ3dHdYQnVuWTcrQlErTFU0NjlJb0hramgvcEpB?=
 =?utf-8?B?ZGkrbGpuc1UzbXhKTjlVWENtc1I1V1B5VEJCaFZnTTVKUktsZDYvclBTcUlz?=
 =?utf-8?B?akZsRWRJSm8vczJGdytaQ2lXWWh4RlViTks0M2J5ckV5K2tianVqbTF5YXpr?=
 =?utf-8?B?c2ozWWN6S2QvNHR0dE5zaEhvQ2oxVHFEUUNJTjgzalladE4xZmFTSEJDcHhY?=
 =?utf-8?B?WGR2aC9hMnI4bCtuMTRUTUpLVzFYSElHM1RKd25HZGcrYlBCcXdiTkF2dTY0?=
 =?utf-8?B?TkVMdW81clBxUS95dEJFczIwUTFuT1RPS053RTRHbDBESTdCV3R3Zm02TXNI?=
 =?utf-8?B?V3N6akkwQkRlM2FtcmlLbG5sM1FIOGhJRmhXbVFSVlA3a1o4YkszcWJSNGFD?=
 =?utf-8?B?OXJLazJ2TWJqWmhyK2p1NmlETERvSklrSWR0VmliVTlyT09mYnZOOG5QSzJH?=
 =?utf-8?B?c3JFS1NBWHkxdWIva25CV0RtS2ZBUFhDVmM1aEVFemE4OVpVekNkNkxLSUww?=
 =?utf-8?B?MmltV25ZNkNDM3pkUjVBNzU1dVBvdkZRNEdhNmtSWVVXenJDY09qVlZXNFNr?=
 =?utf-8?B?cjdJMGRKRTNwU2hBaXFreEhCTFdTOFVKNjJUQWpZNmF1NzhHYjNSNElVSG1T?=
 =?utf-8?B?TWg2d1Z4Uzc3eitpVHZuS3o2MDdRRmxKRUxHRHlXS25MNjdkNG10dUtmQ1N5?=
 =?utf-8?B?ZGdPL1ZJNjNsRllWZnQzdkEzVXZpVWo5ZjFZb3VGdERuZ25nc0QrU25tMnJD?=
 =?utf-8?B?dFRGd1dwUlV5WVRrN1NwSGY4OVU4d3dxcEtQdlhGR3lPZ0xlcmswb1c1NUdS?=
 =?utf-8?B?OE0yM0JyRkZhNDBTNnFUaHJ2RVdZZXlUNFBKd0o4TWZrQVk5YzhBczhRbWtS?=
 =?utf-8?B?UWhTS1Z5cC96TllsQ3c1eTNHWWdTaTBNbzZJeFVJVmsyOHBYR2ZwekNIdUdZ?=
 =?utf-8?B?YWdSOFAxMlFQWXRrdHdwWk4xdml1czhnSCt1ZUc2K3k3YTA3VUlBNlltMnU1?=
 =?utf-8?B?dUJrblB3eStsVGs4VkE5RWdDcnMrWVFWZ2YrdlpkQzg1cVN5ODBVMHN6TUw2?=
 =?utf-8?B?VnhXVkFKazJIVjZjRnlidkJFY0tONy9QS0Z0NS9VVFIzKzd6RTFVYkIxb2tF?=
 =?utf-8?Q?KpL8MYqqRP+Gevu/9MElsGFF4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30dd9b6f-cb6b-4ec7-9f51-08db6ce2119e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 14:17:21.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwwZ2dyAsyhb6oMWBsh/33Y2HdqgHV+02KEIPMbLb3dElKL4lk1yqtFvD+51Wc4VsvX2jg5K+Yc5+jtHR0xgxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

To comply with Misra rule 8.10 ("An inline function shall be declared
with the static storage class"), convert what is presently
_spin_lock_cb() to an always-inline (and static) helper, while making
the function itself a thin wrapper, just like _spin_lock() is.

While there drop the unlikely() from the callback check, and correct
indentation in _spin_lock().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -304,7 +304,8 @@ static always_inline u16 observe_head(sp
     return read_atomic(&t->head);
 }
 
-void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
+static void always_inline spin_lock_common(spinlock_t *lock,
+                                           void (*cb)(void *), void *data)
 {
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
     LOCK_PROFILE_VAR;
@@ -316,7 +317,7 @@ void inline _spin_lock_cb(spinlock_t *lo
     while ( tickets.tail != observe_head(&lock->tickets) )
     {
         LOCK_PROFILE_BLOCK;
-        if ( unlikely(cb) )
+        if ( cb )
             cb(data);
         arch_lock_relax();
     }
@@ -327,7 +328,12 @@ void inline _spin_lock_cb(spinlock_t *lo
 
 void _spin_lock(spinlock_t *lock)
 {
-     _spin_lock_cb(lock, NULL, NULL);
+    spin_lock_common(lock, NULL, NULL);
+}
+
+void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
+{
+    spin_lock_common(lock, cb, data);
 }
 
 void _spin_lock_irq(spinlock_t *lock)

