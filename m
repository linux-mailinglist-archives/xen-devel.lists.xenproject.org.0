Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB8603AD7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425556.673461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3hv-0004xq-EA; Wed, 19 Oct 2022 07:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425556.673461; Wed, 19 Oct 2022 07:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3hv-0004vS-AW; Wed, 19 Oct 2022 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 425556;
 Wed, 19 Oct 2022 07:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3hu-0003Zj-8V
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:41:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78b0655a-4f81-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:41:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 07:41:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:41:40 +0000
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
X-Inumbo-ID: 78b0655a-4f81-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3o+6L9+WDc1yJ+tJBF/w+Yu8Ob5PCY/kqxIHbXRAuv/1R+mdKhYoZ6M/12+9tMgHPWwmpCoYWa0jfZ6X54hofU4ekEfngGv0CiXYcN9LltNpkRPAv4ApY/cZD+AKJaI9q5zduK3550dPd7igUVXcf9ZTNAgUeC9VFpgg4NGord9soP6P280Wf97bRBWS9IKqzxuW+fTUnwIhAYSXZJx8gzRY6sKROvVMHxsuDj1snxmaamayFHtWcMYSw8jcd/oNKsCUAuAKWhI2XbB0vtkg4NnCalIDXVRJaHadv8JFpN8IgPxhDSw+0N0Ny7zwDiUJUwmRM608rFgV/8FrotUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zbAeKGcLxlIY49axvUp6udDpWdFPLm3sDwSLxopW8A=;
 b=A7ir7CVPeBLLXLvaABUrjhDN5NppLgRmy2MP+ymQTgGQ4KJeR2IguxDd3tsquTgxJT0ibpygEsLKWSsTAkU81hUNy5npQS8VZ+3VeAra4dR68X8G7KXkAaOOvhebCUPQi6eaPKW6Xk93zUU3faOeXOIKMgFgaM8cXME5WMuoXZq4AICDmevfpGTFOX4BAHvlGEAcl+VjiMlIymo9vLvec3Jh0Nt9DqpU/OZCBrlbCl8ukLn+eZRAqK37T+gh9UuepF/YPUcxVi4EiP6CBVHg1xfwBhX/RDrgdMdENmyQ8v9TmiTeWvkBhCpGTwKk+hwwDBYXGjK5vWo8W2IkYPasUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zbAeKGcLxlIY49axvUp6udDpWdFPLm3sDwSLxopW8A=;
 b=KHDxoiMniU20imloNY0qf7SyHA4BAsOKKcsuLWpPXIxh1eLVCohEol7ij6he03oE4VDYWvMSYG5JwwbeQQ9tqEf77mJlmVXdHWdDK5ObTaNC0P1S3sF5JwrKfizkQeb/KC/8SomJKqfTOH3GkKXFTRg+17GJY8vAFd9bFxSr+UK2M9kNnCXAsZ64AZUxBWTMcRj/U9POkhaEgv+xBPHBma4YK9sg4dVsvx4UPnWY9CLo7fPT46G7ZvZgtZe1HlaHNZFA/QbZC3GvNs0vymeaK1lrqeiEUsYjOwFWAr/LEUUnUohGl8YYviXbcLwN5eIDD9KRgoGvAEooxgZvEajWcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d814375-c190-ae0b-793b-a8563a23d318@suse.com>
Date: Wed, 19 Oct 2022 09:41:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH RFC 05/10] x86: update GADDR based secondary time area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0514.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: b712a35d-e580-4324-eb54-08dab1a55c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E9mQNDtbpKxXCt6fmbwstqxJCNsnzSnuo/ocAr8SvxFE9cerJsPpcepRYr6KPC/YutfwHsWF5PnBcXa0gT7maDF0q988M0L3+LF/9cEV5+EJKWRNNl60GWBxsriDsCwLBJU0y8JQCxm6GUZOAaztjG8G4G7k0A6sJl71hhyoHOIx9cry1YI3RGBnaFkTM+CEQRjucYLLd7jpRx4vRZFwP8iTZkA0P9EUA/cH+lrAXlf7M5ztoA9bH17n/BqgTeX2UigBAVh+y4pi6wyr1F4vGxOTixiWbdMZCBFAeSyCo3I78Fpjfy9R2JhZk43GsGkGwdTY6h2JuI1gFpIKhqHbi+mTVzXQBjdrvInl95lewgDWbp1xV2ONs8Am3Mn7YnxpDf2TU/ilMM+n4aoCY5bIUSXNSCfgTAB55lQ3UhWISOqmdNHhu9CZ/ZJkahJVrL2E3ZR/G+RDrv4AXmkz6YIK1om2Wr7+IYf6Stb61XRkGLi/BMq5BWzUDTnsQxrtoM41pg0gwNyC2LFilhvo5fbjuJ+r8Py8A4nltXB2QyDo1rqckxgzXrzMSv2kHLlmOzYxO/TqgKwVaALkJ+leflPmFHKGFhJ8yJ+3OCnJ4CVgE5vLBJt0DT2ja2etp55c5Z2mm4AMlcVDqPBQbJXZ0CD2GVC/IQl3MHRe0lWVhi7bid5eb1mFXSMupo84M7n3+Da1mzWhHg0xHoTW/HvVf3OAZyz23URJUl9WRm+vlu8NYVIkKQuDdpn3Ob0ghEhxJeSgl1KT/iHQ1o7kMj9rLm9vp/SAn9m7FIyasIl3Zra9UMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(36756003)(31686004)(86362001)(31696002)(38100700002)(2906002)(5660300002)(186003)(2616005)(6916009)(83380400001)(26005)(6486002)(316002)(6506007)(41300700001)(478600001)(6512007)(54906003)(66556008)(66946007)(66476007)(15650500001)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q20xcmNibEpqck1pVXNBNjgwQ2tvMTJnalpHZXlQRE80b0ViMWt4SUVwWmRn?=
 =?utf-8?B?UStqRmxqT1RDTGhvWDYyWFcyaWUxR2NnRC9iL29hT3pPS01md3Jyd1pQWGJv?=
 =?utf-8?B?dE94OHpiRjNpVXVYemp4UWxzdFE4UVBxelFCSGFOanBRVWJ1Z3dxY2dmU3JM?=
 =?utf-8?B?OTJvTWRvd3JqQTNJREY5VXVTV3JMbUxWNEw3Y2ZUTE9NTm4zeDFDaFhjdG9k?=
 =?utf-8?B?Q3hqYTVmKzR2bVJYWnZPKzkrWUQ5bmlzOVRyL1NrcWFhb3B5ZWN4VWo2WkpF?=
 =?utf-8?B?OW8rTTQydGtZZWt5WllrWEZVME5PSUljcVJpL1hUS0hUOVB4ZitBUmFicGMx?=
 =?utf-8?B?TTdmOTF1eTRHUGQ2R1FVUUQ4RXRJUzRtTTZ4MFA4THNRbTJ3L01QTVVnUGhD?=
 =?utf-8?B?eWpldnRBeHdrcWNjNGxrVlBHTmdWOHk4bVFRYlh4cFhzZ2NCajlzdllNYWky?=
 =?utf-8?B?cFpWQXRLVjY0MGh2UHhzTk81N3RzRjJRZW9pRDQvNlBxeXMrVFdvUVZnSlM2?=
 =?utf-8?B?MEhrZW0zdlEybUhCSHRXMjgvTnVNWVEzRTIrYVBBd0VZUWFHUmZ1YXliQUdM?=
 =?utf-8?B?MDdBLzZ0WUFPMHcwNkE0cnZ6dHBxWmxEeFVJTFlEeGtkVU1JQ0JYVlZ2R3ZL?=
 =?utf-8?B?NDBkV3BTQnk3UzNOVVdtKzd0bS9DaTh3TDRTTzlHS2E4dFErclZoUS9LeWhP?=
 =?utf-8?B?dmFpYVkrWlA0dSthcC9GUmVmMUZCeFZVcldBdzNiM1FQR3VCLzQyUlowWjdJ?=
 =?utf-8?B?YS9NS3B5MmFKUDJDaXJkbnhUSkZLZzFORlU0NytlcllWUXMrTWN6MHEzNTMr?=
 =?utf-8?B?QmN3a3JzbGhkeHU5RDdZcEVPRTJUMG5PdFg2WS8zcmhmUXdhVmRJMEt6bHMw?=
 =?utf-8?B?VUpLV1hvVTdZS3dZakJ0bnJmZFVOVm11YklsbUsra3BuNDFEMjA3ODI4RXhy?=
 =?utf-8?B?MjNTUjVHdjBNa3psWHFzak9vcGptVUNiSDF5LzlWZ2dYNVF5dUpOR2hweWto?=
 =?utf-8?B?dVU1WjYvVzNGWXBOK1FKd0Fkcis3TmlZbkRkNTJTNGRKR3FzaVpqNUJTeE53?=
 =?utf-8?B?TVQ3KzhkUzZYTEdiRVAwc0l0SjJBei9rZlVUVFFRMm9PZWhuai81RjhHTFdX?=
 =?utf-8?B?U2NoK1VXV25jN2ZKTytqSFBPTHpwcXUxZDFMWkZkWnNkUysveHMwZFhVdHhT?=
 =?utf-8?B?akMyMEROemsrMDQ2bHpyTmM2NGpIL1hUaC9mbEdyQ2VCcEpUR2VhTG5zVUdp?=
 =?utf-8?B?bm1INUMvallTOE1EaG40VVNnVk96dHZHVDZqR0o1QnpQTmttYWZ2NVhNTUxu?=
 =?utf-8?B?ZTQvYXphR3d6ditKbndmMTBDRHhYeXAxcGpFd3h2TUJ2eFhmbnNrWSs2WE1Q?=
 =?utf-8?B?dHpYWktORTRJZVIvTFVvWW9oNERtVUtvU29pdDBRZUw0ZmtCa0RuQkFLdGhG?=
 =?utf-8?B?by9TU1dyWVovaFltNWVPb3REc0VVQjRySDN3WmMzamppejBFT3VxbEZvT2JZ?=
 =?utf-8?B?QUhVMnFRZDhmZGJhS25XQWV0bnNITGhnR1J4WWcwa0JES2piU3orNGFtUGZq?=
 =?utf-8?B?cXc3RHJnQnA5S2FWRnFRS0VabFl6WmE4UVlYajdUVWlGdEZSc0NxbnoraEd3?=
 =?utf-8?B?OERESHZqNnFzSURTaUtsdFpzZ1dCVWQyRnVlbUljSUNNZEVpYk0xZ1IvVTJI?=
 =?utf-8?B?WDNZZDNCZFpMazRSWHNWSm95Ni9ZOWJlSUk2OXY5TzFIbmt4Y0R3RFlKQ1hn?=
 =?utf-8?B?aE4zeHRpSE9jQ2lHMXl0bUl2dDlzT1BSR3FPRFJvWmxIYzlwcndkeTd5c0Vs?=
 =?utf-8?B?dWNnTVRXNnpDbDFSejF4MUlrUHlGb1FvRTFtNXZMV0Z3bGhrZWRHRDBkWGNC?=
 =?utf-8?B?aGJvT2xrWHR3NW54b3ZWMTM3by8rdUxSeFRtQW9vV3p5eW1CQXlNeEc5VXY2?=
 =?utf-8?B?RFpBWGljMEFrcXp0L1M1c2JLQkZzeThnc2RPVEgxTzlNQlhBT3dNTVFyRmkx?=
 =?utf-8?B?TkxqYUY0dW41Smd4dGd0elh4TjFQcjFwSjBvNm9OZ2RmVW11ckVBZXZudUZ4?=
 =?utf-8?B?VzlnbjUwVVhvMVVRd2lQZTcraW1GdXBnMCtWTWxCc0RiV1V3UThJNEs0MjZT?=
 =?utf-8?Q?xgghug+CdryA6ejGGebRTglJw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b712a35d-e580-4324-eb54-08dab1a55c0d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:41:39.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXIy27kUkJlbrIgGLLnbwO5vnSmrMgJm3nV+Ix4EqDdP/etN5sxD7CTHCNdyKb6cxBeHOrO8ssxdOtP856h0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

Before adding a new vCPU operation to register the secondary time area
by guest-physical address, add code to actually keep such areas up-to-
date.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Pages aren't marked dirty when written to (matching the handling of
     space mapped by map_vcpu_info() afaict), on the basis that the
     registrations are lost anyway across migration. Plus the contents
     of the areas in question have to be deemed volatile in the first
     place (so saving a "most recent" value is pretty meaningless even
     for e.g. snapshotting).

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1462,12 +1462,34 @@ static void __update_vcpu_system_time(st
         v->arch.pv.pending_system_time = _u;
 }
 
+static void write_time_guest_area(struct vcpu_time_info *map,
+                                  const struct vcpu_time_info *src)
+{
+    /* 1. Update userspace version. */
+    write_atomic(&map->version, src->version);
+    smp_wmb();
+
+    /* 2. Update all other userspace fields. */
+    *map = *src;
+
+    /* 3. Update userspace version again. */
+    smp_wmb();
+    write_atomic(&map->version, version_update_end(src->version));
+}
+
 bool update_secondary_system_time(struct vcpu *v,
                                   struct vcpu_time_info *u)
 {
     XEN_GUEST_HANDLE(vcpu_time_info_t) user_u = v->arch.time_info_guest;
+    struct vcpu_time_info *map = v->arch.time_guest_area.map;
     struct guest_memory_policy policy = { .nested_guest_mode = false };
 
+    if ( map )
+    {
+        write_time_guest_area(map, u);
+        return true;
+    }
+
     if ( guest_handle_is_null(user_u) )
         return true;
 


