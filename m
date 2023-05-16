Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F1704698
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534973.832507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypGS-00054F-1m; Tue, 16 May 2023 07:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534973.832507; Tue, 16 May 2023 07:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypGR-00051K-VE; Tue, 16 May 2023 07:38:31 +0000
Received: by outflank-mailman (input) for mailman id 534973;
 Tue, 16 May 2023 07:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypGQ-0004Mf-V8
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:38:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7d00::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6fecc2d-f3bc-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 09:38:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:38:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:38:27 +0000
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
X-Inumbo-ID: a6fecc2d-f3bc-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTwHUgngN4ZcZo0XYIWYTN62Wj0nIz1viPSyG6trB8FpDStCSY9v4LC0bZoJ4uTodtHG6P4YeYqxb1Z1CyRg/DeYjSy/XLDWyWk0IoPt8xXRdKJpbU+oxtkZBnllTntE8WpU+iDA01dOpPsw3Xo3fTj35xWMW54n+tCMNVV7aehJzqu4n2IZTkdzeVQL/sOFKIL71t9hM7/d9xqARCuunoNkqm5vnaCYhuWlldC7X9Rd7/F4I+OExy0/LGiOx07HslxYhtLIRYltsOg7C0DAxUn9tLwaScEMKky0hc/B48RNrIg8Vwmb1aP993r3P9bNvt+ng4FEXi22OsizDFmx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7CRVIADmzDGbiqvXB+w2ZRXIp+FhtVeLdWts3mages=;
 b=NrBMhyuDAMyvvuDTUhT7EX4pEdOsozYkGQvJ4nd3G5AsXK5mP8XfrimtAzcAh0DVRHnNygywG2B36hstHxcgDazgAkMHzEDOLLa64J2any4+y2O+EA1ayioMTLcZRk+zadKI5YbbLi5xaIYgOolO6GyhyBNVUqJYKlotL/PXYjbPzu2CAgp1jE+WJY1bNwPyTt4ppV988eIQW6GQxfT/g3EMtr2edUbq2BUwimlpemG2aDUOXI5f7yZmqNMVfvWO4TbdDmcleXqLmAG8ov13lQb023m97Hzg6jXM7hOsKZDe3jtN6LP3M9NoYqpa+wKwfxSq9OisAQRK+w6sNZGi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7CRVIADmzDGbiqvXB+w2ZRXIp+FhtVeLdWts3mages=;
 b=M72L3++wI8Gw/PkXoDK2IKmMr7TNc14fBtiRqWRH60LgYOhYIKsTbva5q3BwFt7abBa2cj9XN/mpf98ubIrTdnplM5pMnXMqzShi5Gb+4JBelJnu2CzjPLFLOdY5Ogx7a+cqQO/q1aYn8UrcBONeQl0ymK1n1XzFm0glXr+uD+OBz/clJdu+SVefWjJ1vbtEttA/Orpmr5IJmrN8sS+Rn6gR/9cb3VBgaQkObnOvgW4m3QG2UEJ2ktrJd1rkh5GYtxPrld8zZbRjOcfylxkEM31KokrpU1ra75AWaY2rFJOoGxeklTo4daE3Y2IgxOECHIfZz2f9Jiv7mRzSPcvPCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dbdc07e0-4700-6cb0-4ba0-927417482604@suse.com>
Date: Tue, 16 May 2023 09:38:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 02/12] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bddaa9-4bbd-4262-4eda-08db55e08994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FacHqmzhmsmkUsqlMxAoPY3i8OyrarTHs8o06Y80p9Pz7uy/YVIWZAfYXdYHmBa+ECLBsurFvrAu+QSP7NpYwB7kz8gTjJ7Jvay9HxhLb/uYTLYJm/Q19rOkvnoVB+wsM+n6V1XsYY82lc9FVe3mhdPZ7eeTykf/pOrLEdD5TsC6QpP3hrXaxWmUFEdWkqikkcKV5E1QE8TllNIyvA+zj70qZ+Ghgt6yKoKqpkc54Dysok/OlsHe7ybh0qvAMER00FAo+h1s3cnHFkxN/HFQE+K1L9jChHNirpUbQ8OlFWtiGXGjwvbdslT5s4QKM0UbHri2X27hqw1cBrlhMxxwueQ03IiPxtmydnqE+yczn9MdgD6OznmnXSWLRE/q9SfXUl22oOD3IvB4t6n8z6mJRR4fl7SRdCs7OWPK/0yxO5HKOlyxItg466kGOv5qF1xgXJAZrzhmRMouNbwfX0qXx2U7vfCNsWuRqcjVBY+0+GYsbq1+GxXSTNF0rFPgtG7w0l1ufiQ97tmQkfWcfglXQL8PeUB7FI9ht7woK5FYbT3ykCgkTVSlYaq1fLk/47Zh+r3fAvFISE2pN/ymFwMCQEd+auALPUi9rzPrBkdqfoXev6TNwzzmC5HdA5D73+wvFWZyRY6mUYLxzpom/Gh/7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(66556008)(66476007)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzFIOFEyRlhuTlZlbWRDQ1RFVGZ6SzAyZ25OYVI1c0dIUmZhVWlJbjZiVDBI?=
 =?utf-8?B?UE9adHdjclFtVHpIRW5nNG5xQ3NxY0hrVEVIeTh4S2o1S2lhSjQrZ3I2UEQr?=
 =?utf-8?B?QkRLemExcHJiblZuWjQrY1lvcEh0aGZUd0tsaFh0TTRDc3NWTXVWNjljaDVQ?=
 =?utf-8?B?dFBnWHBKeHNQUTgrbC9JM1RTM0czcUxlaEFSaHp4cXhPUXJremM0UWtRb3Q1?=
 =?utf-8?B?aTVxOG1sMzB2dDJ2TlNyRGhYbjJkaDh1b0dNdUU0cWlEdm9FTTljUUxmc1I5?=
 =?utf-8?B?anJhT2ZsaU1jeVBLTWZ4cCt0M3ZmeStqWi94bFQrM3pNVitxem5mZXdEVWFr?=
 =?utf-8?B?alhrTGlzbVdkRENkUUxEbUVuYTdTUjMzN1lxYWFFU3hTOFc3Vm85YU9CeWRy?=
 =?utf-8?B?U3ZxZVc1ZEdHTFdTNW5hV2hrU1ladkh0cENSQlZ5VU9JMnViVGIyQUxXanRm?=
 =?utf-8?B?MzlFRjRtMHBld0V0MnBSZ3RicGREdmJXN3NEVk9rajVSR1ZPU3ZSQ2pHVFA0?=
 =?utf-8?B?cHpRMi9UU0xPWE9LNlhGL3RndTJFWVNHNUpXNWNaZGxOLzQ4V2RaOGFaNTc1?=
 =?utf-8?B?QmxIWE4zM09XZ2ZONENsUTFOaGMrS3cyMkdUVFhiTUwzTGlacWJOckdrVUF5?=
 =?utf-8?B?YnNZMXZ2VVJNTGdNSEVvcDdKYXdsV1h6cEVzbmZjWVQ2S1dVU1FLcHZmdERR?=
 =?utf-8?B?YTE5TEtESDhDdFJxM0VDVlI3SEVvYUlHOWVvTjVNeVN4eG9RSys4bnFnQU92?=
 =?utf-8?B?V1ZsMTFERU1HdENMaXZKODJSK29Scnp6YmY0akZ6bHk2ZHBGY0NvbEpjZldj?=
 =?utf-8?B?MmFxRERwT1hUVWduYmhmR21MeVM1bGdnSTRhKzgwOGVRMEU1R1RoamlyV0R0?=
 =?utf-8?B?VXdzQ2dMMWtERitmaVBzdVZJMWcyeUNtY29Jdnd6QmIvSk5jV3RURlBZak9Q?=
 =?utf-8?B?eU5TZXc5Q2I2S0Y4WmE3dDVtUWNZWGdxZzRHckRzR2pYemhvcTFlM2tYbDBU?=
 =?utf-8?B?d2VxenhaNnZoYXhKWFF4Vjg4WTExUFR5M3JOM0xTREdSK0tWM3JiTlFvNkh1?=
 =?utf-8?B?Zk1BZlVXY3ZBdU82ekxvRmtLYTltUjhvT0Z5RERYbHJZRlFUa0ZFK2dKUVNp?=
 =?utf-8?B?ZjhRWC9OVmVMQkt6Z2U5M0RqM1g2ODlkVEZmOHhNNThzUDZMaG0ycTI3KzUr?=
 =?utf-8?B?dFZ6TVY5dThocjQ0eG1ybk5DYjMvNUY2S01hWkdBVkVOWDdtQVllSmZZT0JI?=
 =?utf-8?B?N3pkYXZwMldKQ0JtWEJHeFczc1A2U3BoaU01OFo1VmxnYms4dXJZMzdWMUJP?=
 =?utf-8?B?dk1CdUNpb3FhUzU0Y2o2d21wNzNGUVFjdUIwT1FtbkJOakU0SzEyQS9jMmxo?=
 =?utf-8?B?SlBicUJQZTZlTkpjK3hSNnFjUHRUTURmZ1F1QWFZOFlxTmQweFRSM0Y0T3RF?=
 =?utf-8?B?MlhKcGMwQ1MzM3BxaVlOWkgzWUpLRldPNmVBWHRCeXpyb1Vwa2xEUXNTY2pP?=
 =?utf-8?B?NlRQU09ISWZuTXhTZCt3SkU3ak9BUk43cUlBK09nZUNWRmVXVjB4TlBLb0tH?=
 =?utf-8?B?bWNQaTNKR0NDR1Baa1Rjd1NXekVkQ2RKM1orKzlESEZKRDVjSWdjaEQ1dnBr?=
 =?utf-8?B?WisvSCtHV29jTTR5MjBhR3NlRXJFT0FGaFQvazk2bVBFQWJibUhLYXkySGo0?=
 =?utf-8?B?dmZEcy9sNUlINkZSakdjRXZKVFJYV1NsNCs1KytFNE5FMXdRclBvMHdVZUZC?=
 =?utf-8?B?dFJFaTlqMHVqdzNpZXRKcGR6YUtkbkxGUkpDNG9WajZGdEFQUjFnQU1BN1ZJ?=
 =?utf-8?B?bGxzRitDendBVkJRUHIwcnVNNjdmbFpScnVaSVorcEQ5YmExR3BsdjljNEZz?=
 =?utf-8?B?cTdXcW9OSVNwdTNnYXRsNWJFZmtqTzc5WUF5OGJvWjBTUVBpSTZwRVNKdzBS?=
 =?utf-8?B?ejYxeTZzaGJyRWFUUk4xWS92UGE5NzV5SmtnNlVzMnJnNHZ4eTJsOVpra25s?=
 =?utf-8?B?NEZOQldFa3ZMNjh0aHIzYTRWdzF1aS9namhwWktEMmt3amFWWFZNSURxUjJC?=
 =?utf-8?B?eG9MZkwxNnB3U3U5TWxVZG1tR1BTdXROSjZoRUx1QUVZQkhYUE5WYWJQYmlK?=
 =?utf-8?Q?qpSK+uHTCEeZRTo6C9fT7Udkc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bddaa9-4bbd-4262-4eda-08db55e08994
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:38:27.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4J3lcM4X9wrhFzzmjcGN7R6BKIC5LSdXNtvQvX1z4Qe3bpZoGl+VxuSEMDMka4SDh0iu2vrtSJIPx9kW6Ov2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

There's no need for an indirect call here, as the mode is invariant
throughout the entire paging-locked region. All it takes to avoid it is
to have a forward declaration of sh_update_cr3() in place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I find this and the respective Win7 related comment suspicious: If we
really need to "fix up" L3 entries "on demand", wouldn't we better retry
the shadow_get_and_create_l1e() rather than exit? The spurious page
fault that the guest observes can, after all, not be known to be non-
fatal inside the guest. That's purely an OS policy.

Furthermore the sh_update_cr3() will also invalidate L3 entries which
were loaded successfully before, but invalidated by the guest
afterwards. I strongly suspect that the described hardware behavior is
_only_ to load previously not-present entries from the PDPT, but not
purge ones already marked present. IOW I think sh_update_cr3() would
need calling in an "incremental" mode here. (The alternative of doing
this in shadow_get_and_create_l3e() instead would likely be more
cumbersome.)

Beyond the "on demand" L3 entry creation I also can't see what guest
actions could lead to the ASSERT() being inapplicable in the PAE case.
The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
PDPTEs, and all other logic is similar to that for other modes.

(See 89329d832aed ["x86 shadow: Update cr3 in PAE mode when guest walk
succeed but shadow walk fails"].)

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -79,6 +79,8 @@ const char *const fetch_type_names[] = {
 # define for_each_shadow_table(v, i) for ( (i) = 0; (i) < 1; ++(i) )
 #endif
 
+static void cf_check sh_update_cr3(struct vcpu *v, int do_locking, bool noflush);
+
 /* Helper to perform a local TLB flush. */
 static void sh_flush_local(const struct domain *d)
 {
@@ -2475,7 +2477,7 @@ static int cf_check sh_page_fault(
          * In any case, in the PAE case, the ASSERT is not true; it can
          * happen because of actions the guest is taking. */
 #if GUEST_PAGING_LEVELS == 3
-        v->arch.paging.mode->update_cr3(v, 0, false);
+        sh_update_cr3(v, 0, false);
 #else
         ASSERT(d->is_shutting_down);
 #endif


