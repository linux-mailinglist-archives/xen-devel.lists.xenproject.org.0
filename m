Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90486D5BB3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517692.803414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcot-0007TZ-7X; Tue, 04 Apr 2023 09:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517692.803414; Tue, 04 Apr 2023 09:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcot-0007QE-4Q; Tue, 04 Apr 2023 09:19:15 +0000
Received: by outflank-mailman (input) for mailman id 517692;
 Tue, 04 Apr 2023 09:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjcor-0007Q6-PJ
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:19:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c35be60a-d2c9-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:19:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Tue, 4 Apr
 2023 09:19:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:19:10 +0000
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
X-Inumbo-ID: c35be60a-d2c9-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXjcnHJV9t+ebL3yCyqlnnc4xs4LSzhBG1Zpqfj77IpBYLumNKSlxc41/z9rBXwttrZZcZ2/ULA3oaBKVTWHh6045oGFdEBxxC5azCYLbC8MIu+Kp1R41cE7cBQi/c+b1N4Lx6WIQV/D+XvvSqiugJP/qUJmsLkhPlOuKlHYzKAed2spZAcok49NpzowxO6NX62Q5d7o+wZFiE6bp5rcRY+xYL7k6KMf9x8Sch+pU4G4smx5DI5aPJDk6ZVjk1X5Pc0e9e+fyZuc7r9Oq+z+t+8Hz0SG3HPECNpmukyeFK3d5pq/ebxIoDnVRu0zdN6d48dCZfj3WMn3muknoYMzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7N904AxklSbnMiROFbdWJfhWDMU/a+PNtwY8Ooo9QI=;
 b=KbUUh1GlFBg2IcBus5lH0FsROpj0cozNVxCc8zXm1upBnO+msKgoiVR1qaf4gvoXE+n5/a7ASNGqWS+SpeuooV0PSJjEWEKAvq04uFXFYXv2wWwc15pV9LfkeJl1WrGXNoKZ6XVZsSJXlbCjoNzgRtPmT2kXNQyalh/nmGqVNokNdBerSpBmlmhtJzpLETCX9rLAvZ9OyI8cPsl5pu84Vzn7t/XyzNA2x453Ava+/H0ZtsNBf1bBl6Mt9OF1ph6nDdzhJu7Cef57c85tTzp6s8z31PurCSLjhjWFIR29kWug6FWQokKj5kwws2LalG+VQQY2aNx5yto9mEjj+S3TZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7N904AxklSbnMiROFbdWJfhWDMU/a+PNtwY8Ooo9QI=;
 b=gq3VuFEVaKpovtmJTLz+v4FBDbEcZHYDVK1kj/ChC8bBeNwf0o8h98rZCU68lIVD7kj1la8WN1tUpb/ZrnNtNGnIPR0BMew7JnTfhjNy5itjBMtqfOv+LPVd1D8OlO2ejqQ2niQ6/24/bSyrNkM68Zd4JqVn0hntr4jd8wFwASn6jtW/gUxFa3wTX7lFp/E4+LTuNFBKz+NU7LMZF1gtgaJfpzxZ9vQFEci5V/iQx8FULPpyQPb/8jwgYlJf6ERk3raYERTuPgs8cRSS4QzpCKZR6ZJ+5v/frcApd64MD8xmBKpEztGTsPEOuzUIQsNrWZQKJ62ENGRLLt1E2UnWwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f52befc9-f19c-12fb-b0db-b6c4219999b2@suse.com>
Date: Tue, 4 Apr 2023 11:19:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: ignore PAE_MODE ELF note for 64-bit Dom0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: 377ba6c8-602c-49ac-00ba-08db34eda5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JCDSsrggbx3+5PNTDltoIx1wBJfxgNSyv5T55+HkKh4uSkIH/jLUmpV4W3wRpjsUG4CCq/gtamMiVJFouVUnE8FUV6JKeqCSxQs00jlJtzor00P7WZv2eejb4hsubN5Heo/NRo009VmiYgcD9YBU1UbvE34+MRn3M3gHQKLoQl+FVuacrhhLzhrfL4u2uatAXEbWmBDDZRdcrT6QnuFx/9qpTbsrBjDBMu64cBEPnXFwevF04El8kV++9ZgqWdWN0oUJteNzlWhF9KlHIUPz7E1q9rr88Fch0CP8uhmdmK4uukW0fGtY3a41Fwfk4H+whOuVV5ZkXSQi2i7D/4AQb4JJPZ4bG2feibwPwS3WBv+qhgCzmwLdH3TiQhXkP7hCLuL8NeP1qKnSS7x+Vexi7MW6JQM9cbs7hSWE2IIni6Zd8jCbCnTO/rhg6HlK3UI6DZHsttO9JRe888Icp3sXBT0+odL5WN8nj+5dPW+1hlOHUPAUgCA12GfMnXtHOK1JTzUdRzWx6HSZOubAz4QD0xEuya8GIpr5MJONSNTpmNPG3izV2XgTvei87ZFe9c5T39rYWtQDB1b3zphNWdy+xi70CVLN2a02buLvjbZRbIToCeh584t3EDQshfqnozbjbr+s9qdWESNM2gOnBAL7CQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(38100700002)(8676002)(66476007)(66556008)(66946007)(5660300002)(8936002)(41300700001)(316002)(31686004)(6916009)(4326008)(478600001)(2906002)(31696002)(54906003)(83380400001)(86362001)(186003)(36756003)(2616005)(6486002)(6512007)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3Fkak81VzRiYktxQUx1LzdUeHM2S0Z4aWVhcmFvUGRZNjBGWDVzUTlpNVAx?=
 =?utf-8?B?Mkh1S3F1RlNvb0J3ditsRk9qLzJmNk9lVUxCUHhQQnp0dTNyZ1FVdkhmU2RE?=
 =?utf-8?B?TnBycXJGcVN0ZjJDNXcxUmRQZlg5VXRmRjMyZzdCMENBMlJoT0lxbVdzV3RD?=
 =?utf-8?B?enNUQi9yQVFNZGtnRnhCbWVaNXBCZ3RYSzRlUkFFbXRVMDRuQ2NscEZtRElP?=
 =?utf-8?B?VEZPNXhjWVpUeU82QUU0VHBQZG54WlRmR0x0TEhaNkRoQ2JWc1VLVVNPYXBl?=
 =?utf-8?B?UUpFUTlDZWtqeUxPbzVwdDV6aXlYVTM2SFRWenJGdjRVcGpVN2hrWXlaUWNh?=
 =?utf-8?B?bDNZMjlXcmFEOTFsWDdlV2c2SkVQYmVoOVNGcG9CU2IvcGNUVTh3bnQzLzJE?=
 =?utf-8?B?aW0zaWpaWVNGcGlSZmFRREIvYjFMaTBBNkJvTkJLeXlLQ2FsTXk0STgwb1U0?=
 =?utf-8?B?SFgyMVc1UTdpTm93TU5leDZQTUcwMXpGdEpOZEhEaXAveGY3Z3VkSzlFNFRR?=
 =?utf-8?B?QVMvWTRuK3lvRDNHcm9MQkJXUGpyUjY0R29QLzU3VFM0dUhDb3JiMTlxTFVJ?=
 =?utf-8?B?aEFyTUpOcFdpOFJnZFRHNW1aZkk2TFY5eEpNY3MveFpWS3dUSUJoNm9nK2Rk?=
 =?utf-8?B?UDM4WDRYOWhXR0hUWWFFcHAyRmV1ZlQvQWZwZ3IxN252bU5pUm5SSjlpRnhU?=
 =?utf-8?B?S1ZSM3UyeGh6VGtDSDZFZ2J3ZU9Md3d6UHRhWWMzZjgvSzhZYm9Xelo3WGlk?=
 =?utf-8?B?bWdWNHFJWnJocmdzd1NZYm50OHNuZFJ1Z1lyRDNOL1c3NUxPS1pLbWprTFNY?=
 =?utf-8?B?dCtraWl6U3J3ODlLQmhwWnppSXl0b04rMFoyWjlUQmQxWklDQlRYb2dPTFlh?=
 =?utf-8?B?cHpUK1NjeWFiSU01Uy95ZFBoUDYzZEdoTnhHRHhMWnpvY1hOeEVWUCtsSzlq?=
 =?utf-8?B?WHJ0TWowMkgveDFqRlRYOE8zZnB4YjdGeHZoKzBzeVIxdGJaVVpLaTd6SUVY?=
 =?utf-8?B?SnVkT3FqQXh1enJBREtlS2hPUUp3bDlTNXhmclNkekc5bnZMaDY5aEVyZXR5?=
 =?utf-8?B?K0VCcHBBdGdkZmw1cWpOTUtMbDFtRFhyaTgvcjdlZ2s2bDNpdCtDZ1hFMHNp?=
 =?utf-8?B?RGlBMVVNRUJ3azAvQWt0dGZCNktRejdwc2hyWmp2NGlKUFYybEJjUHNjWGRn?=
 =?utf-8?B?U0lkKzhObm01TDh4cFFhTzFFMjQvdmFMMXI1ZnJ3MG1PQzF5U24vWCs3WTRj?=
 =?utf-8?B?Mkh3V04rblBTWEZ3VWt0MFJBSCtJR3VlUC9IMDVYaTBGNjJHU0dhMXZWMzcw?=
 =?utf-8?B?aXZpYm9RRjhJeGxyRzlsY28rRnlOYVJEOVVReVdkam9VcXpzNWVkaDQ1cEZJ?=
 =?utf-8?B?TW5UUFlESUlZTGpFcFN3QWtzcGZFOUNmeE0zYk1VdWpDSTYrYXBwR3BwS3FL?=
 =?utf-8?B?OXd1amgzTWNDSDFvWWZscTJTR3hCZERaeWVHSDRGdURrMGFvWXlTTHExcTMw?=
 =?utf-8?B?c0gvNEJ4U0xQQjZ1cFNwbjE5V3R1cjZvdTAzTjNWZnVERFY5ekhjYWpLNXNC?=
 =?utf-8?B?c0dDclkvdG5pcmJQeXU0SVZudkFLT0U0RUJlU3J3cFNkTlUvc3pzb29zSzRC?=
 =?utf-8?B?RG9JaGlqYVRxV1l5cTlMa09RZE5aejVidXVmRnlscGVBYllOTk1UTWttSmhx?=
 =?utf-8?B?R1d5UEpDWVBBM0pUaHdBMlJvcE5wWlducVhCeHgvaXBFNWZ6T0k5TjlGTkVC?=
 =?utf-8?B?WmZMaVpiK3FUd0VKaTB0alpxeE5qdWJWNzNyWFhGeGVxbkRjL0g2bmJaVitJ?=
 =?utf-8?B?Zkd2aDVwMXV6Qlc0dU03WWg1bjRHK2lPZTQ3L1lYUHV4d0ZobldCUDhCN3Nw?=
 =?utf-8?B?V0FpcCsvNFRRTHE1Y2ZadTVpYW0vRmNjOTVkdGJDT3h6L0p5VmJvZVJ0WWY5?=
 =?utf-8?B?UjhxTVA2SWN1Qy9vTlZxb3JkeGlPSnFDWUNXZnl5Rjd0MXMyeWJjeUdNTGxX?=
 =?utf-8?B?NVhPZjNtVWZrVmtXSVZJMit0cUFmKzVNVzU5dUpTZ05TSU4rTmp2aDJvM2NX?=
 =?utf-8?B?bnRUTGdyM1RXZWNpdnhhb0MrQms3c09PQnhsRmlwVnppT3M4bVdUSmlJK1Ny?=
 =?utf-8?Q?mgCEK8xZxF0gnF6Xz8srBHW6q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377ba6c8-602c-49ac-00ba-08db34eda5c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:19:09.8621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEidxJEAFU9n8QurnQZpXBuQbrcU2rn6fKoGU2O42ACtUe0gZQRAwZuT+ZL9nSydLI4ZYFhiEXhdCmuxs6cAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915

Besides a printk() the main effect is slight corruption of the start
info magic: While that's meant to be xen-3.0-x86_64, it wrongly ended
up as xen-3.0-x86_64p.

Note that no known users exist that would have developed a dependency on
the bogus magic string. In particular Linux, NetBSD, and mini-os have
been checked.

Fixes: 460060f83d41 ("libelf: use for x86 dom0 builder")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: While Linux works fine with the adjustment, I'm not entirely
     certain of external tools (crash?) having grown a dependency. It
     may be worth noting that XenoLinux and its forward ports never had
     this ELF note in 64-bit kernels, so in principle it may be
     reasonable to expect that no such dependency exists anywhere.

Prior to "x86/PV32: restore PAE-extended-CR3 logic" that (meaningless
for 64-bit domains) VM-assist could also be engaged, based on the ELF
note's value. I expect that change to go in first, at which point the
description here is going to be correct (in not mentioning this VM-
assist aspect).
---
v2: Extend description.

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -459,8 +459,13 @@ int __init dom0_construct_pv(struct doma
     compat = is_pv_32bit_domain(d);
 
     if ( elf_64bit(&elf) && machine == EM_X86_64 )
+    {
         compatible = true;
 
+        /* Zap meaningless setting which kernels may carry by mistake. */
+        parms.pae = 0;
+    }
+
     if ( elf_msb(&elf) )
         compatible = false;
 

