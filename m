Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972745B3AB3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 16:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404428.646896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWf1N-0002Yg-0C; Fri, 09 Sep 2022 14:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404428.646896; Fri, 09 Sep 2022 14:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWf1M-0002Wo-TV; Fri, 09 Sep 2022 14:30:16 +0000
Received: by outflank-mailman (input) for mailman id 404428;
 Fri, 09 Sep 2022 14:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWf1L-0002Wi-KT
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 14:30:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00040.outbound.protection.outlook.com [40.107.0.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb1762c4-304b-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 16:30:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9478.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 14:30:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 14:30:12 +0000
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
X-Inumbo-ID: eb1762c4-304b-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTDB6wC5upZX8sr4LyxMqoN8COcSJdyUi3SvPKQtuYG59gZL1vYQKwpBvY2FRljLtTeqqHH5GpBx26fMOrCckptxU60t1X0zOERnBw/ko21zJorDK7pCZwdljB0NLRJnRO937BfTneoXNUXnf6NW6L94Z7LO4v5yLLdpBpVSi06nTHu8zWrWOgLfGIB+/290yCT3GoCOKUloRAt9KX+Gv7PeVJiSgF/VRH2fYOl3b/w3PY+Mea22kPv1iT04tCK1oSjehYiYFETNY+cqr3zQZs7yKuZeCSox97Mydh9gLa8j52UzIHiXOHqGEOyrTQiRfBDD7pPA7YZE70zg4DD3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYInDRVqF3/giNMsCtExKTIiVPwObn6L8MAQq6YWhG8=;
 b=DNtp+P9iu0lk11MhkA3iYBoHP6hrjgjr6ZTuJWxmbHG5254HojL+KIIYfQ/izZxTvSyQJlGbYfPNAOmVNb/gGq8/e7Ngjz/sVDdErJbo94QXeOfiA/WZvG0zcUBTqG2rueZyFIiXKekO+THJkTKVFkU9tAmzWGWQtIWHnVr72SJN6f+mqR+F9+3KBz/3MnDuz6skjyRv1M+UjoFMY5SVsw9zaKRJqAU0DlvzzSkc6UpPDKhqJoPq4IsVKj1kTkzmJh7I5+bPAtX3BMGi75nlQlWYfLzx8TNWzLvnw7eCux1cexkuWrGw9SL6fthBZuwf3Omh+NlwUVMCl0rNCcSuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYInDRVqF3/giNMsCtExKTIiVPwObn6L8MAQq6YWhG8=;
 b=I0S4WNpwQ6TXPn/EDZToEhq92aQH48ZnLfscU4T0i+hosoPiKuvH1j9V1AvI+g2J2UTfp+oXbS5NKEoVmwRYm7//AN7DlkGnJ5IQqZ/eecfqYZ1O+QRvt/IJwwW96dGukLHaDOE7zGHYgIPzBHo/R90EyIQC8efgEKaafeX+2vnkW/YLT4qgt02IOGQbnSfktF8CueMct2+qlof3e3qyUfA+ibJNQbVR7FKrmBmxeGXVP+mHm9PdFhZcJb/K6DgUHeTVqGshcfpZPXiEg7kQzpNGzKaUk4QgBw0amqxwuBTKq7lJWLdjeC/fOAw2Sq9DVxnle/dQ8MZpG9IhND50Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
Date: Fri, 9 Sep 2022 16:30:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] core-parking: fix build with gcc12 and NR_CPUS=1
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fb6e72-30a0-4f5b-e5fb-08da926fce5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1fLN69NFdD6ZI6Uy7VW5GLChWfn5yNvOirORw5lA2PIuBRpCVVAJLVHCW8fQWvbqRGUsOPNnqr/SO/OJb6q/ixkhMRo9xcHN6vGOPs/S7w52I5R4Ep7YogGq+U92/Srdmdc8PqRE3zOHFg5+tg6MiEsgfoX5HSWcZoaLLHDkduAo7KwXbyeu7n0t8pm1wtz0Bxv0jGP9Ud4V7Sg41KQr9tzBw7MWdG7TPV+2AzKUzqrjNseg+OMClbHV7kn7lz7rhEX3C+4A10Y6GmmmT8dzayk0iDubEEUG/hOaHxaAyFlIeIboCmkjlgNniTMjWgl6c6NuaTRITpZhCCZO4GWRrxm2rW6IEe5OaTM7KoM9o7Auu04WYDhH5jZL9biYgvF77ofjxEqlvvmP7oneCQrC38zAv3fZKtbcVDGrX77l3UuzRIWkO/M1p75OKpug2PAccZvuBWnfAjmIXoPcAcIUCPOPRPvgwpg0tN3/H7Jm4J1aHWjFwUpWBlozgBX5yqdQxFTX1scMT4YnvYHJ22o9CegGBdw3aaFQCLsa6Goyu2gf2k7MuzqhjE9VCOkd/H8h1ZZBFlQmb/i9xQKxu2Wfo3I0FhkGJxnTZ+CXtl1oRLnLim6iZfhit1+Thvpx15YsTbbVNJFDFwqzGMDxzyG8Wu690tUYSF69Om7iDXoTsGQW6k5gUQTAELehyL/Ck9jr3jTwlAlstgH7MjvbtRVZ5kQlPqKsCyoVk/5OlMOhf2IlImTpLFhwLnaqWYc9LlUKpuBzDujl5MIThOJ4X1PJHj43zN0p1eXMehSsjU0R+9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39860400002)(396003)(376002)(136003)(38100700002)(8676002)(31696002)(86362001)(66946007)(66556008)(36756003)(66476007)(4326008)(31686004)(26005)(41300700001)(6486002)(186003)(8936002)(316002)(478600001)(83380400001)(2616005)(6916009)(6506007)(6512007)(54906003)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2xaNWtJMTFGVGxEWERKcUJzdkFiaTN3NVoxUHFOcjRzOUZlSnNKN1NLUWd2?=
 =?utf-8?B?bE1vaWFULzM5TVJuOUMzankrVW1zUFhsdHh1TC9MeUxTcEtwd0NYTkZMSlY4?=
 =?utf-8?B?ZFJ6MUJPVFphZ1RBWmlVa050amJqVmRyRTYrTmpoSWZ4RCs5VXc4L0QxR3dC?=
 =?utf-8?B?YWNzSEM2aG1CYkkwN1dBZmZ5dmh4NHNQNnByZUZkZzFRa0wrOCsvSHJuSDgv?=
 =?utf-8?B?QW9UaXZxdFVLQVVPQ0g5WE5BZXBxMERLWG9Tb0I3V21XWVk3cW1sUHBocG1w?=
 =?utf-8?B?NWdLMVVEVWhiSFFrdGdYWk56K0pJTmtXblpZZ0VUZmF0RnRteDBSTWsvSG9r?=
 =?utf-8?B?R1llWkhjcVoxRkRXQWR6ZFkvRFU3eS9sRU9vcU9mdlVEd2lBNDBRcnRzSVY0?=
 =?utf-8?B?bTY0MHlySnhyd2dXbVNMaFdzUVhSWGhHK3FMa3hxa3F5QUtMWldzWFRyaUxa?=
 =?utf-8?B?WkpuSTVKVVg4NlBwU2U1VnA3SlhQeFpHeWVJR0lIUllnUHN1eU42b1hOZ1FG?=
 =?utf-8?B?UHh5aHd1ZXVGVWVzRkRBMXk3UVlpWHBUL21KbGxOcCtDUklUdG5ENDEzUFpB?=
 =?utf-8?B?MkxRRkhSZDNrWkJOb2VOZEVFZXFpRy9MMzREOHd5TnNzT3VUT1hGSGtuR1Ju?=
 =?utf-8?B?ciswZlV1Nkw4cEY2bmJHaVFjMjQzd0NmdkRxeURiei9JZERZSEV2NTg4enZh?=
 =?utf-8?B?eHNoWTdhNGk1dGh4NytmaVlVSW5saTk0K0Z3dUo3b2xYcFJTelhzR1JVRjBY?=
 =?utf-8?B?V2xrRXZQUzk4YUovVDRwanJ5UFl1RTNiTGxhZGtSZWljUWErOGpSSkpobmlw?=
 =?utf-8?B?UStmR0xsZVBVaEI4aUxadDM5K2tWblVTQzQ1UUZjbTZNUTRHZW5OdUlqRlhh?=
 =?utf-8?B?azc2V1pUejZDVUFLT2xCT08xY05PUytCb20rSWVQS1FiT1VsUUNVVktiV2Fk?=
 =?utf-8?B?enVxd1JrV2RyRXlNTWViZVJzTzBFTjlBbC9lWUZGa3NJZnpQUThMNE51SE5F?=
 =?utf-8?B?NWExM2xScnMxMW1waGhIaU04QkQzSzF0WUE2UDZjZlVRQ1ZDN3Q5aDViK2kw?=
 =?utf-8?B?RS8yNFBSaUloTENEMHhJOUhNYnM2NExpM2VPaFpVRHdYaDNvWjRXM3ArWk1p?=
 =?utf-8?B?MjBJRUpLUWtiNVhlcUlSdGVaRk4vbm90RlZJdVBRUUZhVnlvRkZzdDM1VnhP?=
 =?utf-8?B?Y1V1NzdpS1FYcnF1amIxUEQveDc0UklPdS9iUmphcFpmUjh3Uk1qb1piL1Iv?=
 =?utf-8?B?TkdFUHlhT1Z6WGgyby94UjZqejFYOUhOQWtlVlZTM2dUZ0E5bWRVZk52cjV6?=
 =?utf-8?B?UFVCS04xZDZUTWdadHhMOTdWOUxjZURvcEN0d2ZrUVlUU3B0dU12dWFXazBM?=
 =?utf-8?B?cnErUEpGZGpyOHQ0YVUrSzd3OHZNWGhkZFJBR2NMbGhyMGg5eGMvZ1V6UlRs?=
 =?utf-8?B?ejkxb01RU2o4UnROaVJ0L0s3cnVIZjJScGRqUk1WY25RdWp4UWFZb0dGMWE2?=
 =?utf-8?B?SmxEUDhzc3d3M3p2M2pGOUFqTVZ0TDZmWTlTQ3p0SGY4NGZxMVBLaHNKN2p2?=
 =?utf-8?B?YjExdGdKdlBlN2hzLzd0ZXRaaDJ6V1dpZlAxcTJ6T0o0Ti9YR3FLeHpCOSs3?=
 =?utf-8?B?WmNnWkdkZTFSNmh0L1Zza2pKMWVWOGhXRjF5QjFvajlGOE1jcVBkZllBMER2?=
 =?utf-8?B?MTF2WlM1c2g2djk4RE1SMWI2d1hudW03WnI0eFFBcHhyVlBJa3h4Z2IxbnZP?=
 =?utf-8?B?MnpmbTE5STBSRlZ5Uzc4TW82Q2g5d3VxZzNKLzZURmlqOG1uUTBaWmp3Skkx?=
 =?utf-8?B?bWJDRng4ZnlTbURBUlFkcjM3MjRmNEZYVkNxb0F2ZEI1dnJCT2VKMlpBVlhS?=
 =?utf-8?B?cks5ZXhsUWdreXdZVW5pUTYvakg5RCs3dkltRlFpL1p3SGZkU3JCWTlqMDRt?=
 =?utf-8?B?VmZ3dzZCR1lzZkhQdmRLQWF2YVdzMEJlVitmbXlSdEovS3ZpUU43UnBISVY4?=
 =?utf-8?B?aEZyaGhmYStXeGdvbFlPL01yczNNZ2JIaFo0OERKRUZ5M01jekpTa251Uzhz?=
 =?utf-8?B?Uk9DSHBBbElRYmJidWpPSHFqRGIrTWcvVFpMYlNFQ0VTK0tLMGw3dEV2T3Z3?=
 =?utf-8?Q?6ParUZM45PXsUbUzxJXzOxvL1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fb6e72-30a0-4f5b-e5fb-08da926fce5a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 14:30:12.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7misG8T4qsT0CDc1ToKdycSjMhheShdMSg9nGyh+VEk7YssUfKzBns0o1yU4JN4oljPpU+A5NrDpl5HZyy3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9478

Gcc12 takes issue with core_parking_remove()'s

    for ( ; i < cur_idle_nums; ++i )
        core_parking_cpunum[i] = core_parking_cpunum[i + 1];

complaining that the right hand side array access is past the bounds of
1. Clearly the compiler can't know that cur_idle_nums can only ever be
zero in this case (as the sole CPU cannot be parked).

Arrange for core_parking.c's contents to not be needed altogether, and
then disable its building when NR_CPUS == 1.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Disable building of core_parking.c altogether.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,7 +10,7 @@ config X86
 	select ALTERNATIVE_CALL
 	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
-	select CORE_PARKING
+	select CORE_PARKING if NR_CPUS > 1
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -727,12 +727,17 @@ ret_t do_platform_op(
         case XEN_CORE_PARKING_SET:
             idle_nums = min_t(uint32_t,
                     op->u.core_parking.idle_nums, num_present_cpus() - 1);
-            ret = continue_hypercall_on_cpu(
-                    0, core_parking_helper, (void *)(unsigned long)idle_nums);
+            if ( CONFIG_NR_CPUS > 1 )
+                ret = continue_hypercall_on_cpu(
+                        0, core_parking_helper,
+                        (void *)(unsigned long)idle_nums);
+            else if ( idle_nums )
+                ret = -EINVAL;
             break;
 
         case XEN_CORE_PARKING_GET:
-            op->u.core_parking.idle_nums = get_cur_idle_nums();
+            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
+                                           ? get_cur_idle_nums() : 0;
             ret = __copy_field_to_guest(u_xenpf_op, op, u.core_parking) ?
                   -EFAULT : 0;
             break;
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -157,7 +157,7 @@ long arch_do_sysctl(
         long (*fn)(void *);
         void *hcpu;
 
-        switch ( op )
+        switch ( op | -(CONFIG_NR_CPUS == 1) )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
             plug = true;

