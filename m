Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0F7A5CD0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 10:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604471.941866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWLB-00059C-Qu; Tue, 19 Sep 2023 08:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604471.941866; Tue, 19 Sep 2023 08:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiWLB-000560-Ko; Tue, 19 Sep 2023 08:44:17 +0000
Received: by outflank-mailman (input) for mailman id 604471;
 Tue, 19 Sep 2023 08:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiWLA-00055o-2v
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 08:44:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b66d45c3-56c8-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 10:44:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6889.eurprd04.prod.outlook.com (2603:10a6:10:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 08:44:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 08:44:12 +0000
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
X-Inumbo-ID: b66d45c3-56c8-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1dJzkuRVja2D90uAp74XUu5LN2TT7SHzCubL9yFUIxkq5M9QSUyz4hSaXnrOLnDgIg44Z4GaKQuSIPd7tnsFl5XZ54slXeRtEdbMMFo/bXeQWjVK/tWAsbkBPn8WOXKLpjXxc20IkLhPD9Lns7fRLqb01WlMST6rXLkGcIp9ZZNUAzuBdwa+RSQhz5KTqtggj3vmHwKYHVm9QgfjMgBsaf5JNR/1U+V7DAomNqQOj+ngJk2LhJ9yVOucdAF+buWTqzAmJfwxSDDp6DubMT64ylBD64yCtzbh5c6UKIlAdP5ZPQEnWCDm41VWRitBUSf0JcWHjmbnZ2x9hFCVyUW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohUI3cXFUhetr9WRjFGO0/f3nOBF1PqukznpsDvyA1c=;
 b=DWqqGyazQqGx1yE04/icRixNOUssqvXAdEOZqQ8crAwxlFScQziHxfWameG7FQ/I1XaX0fkQkuTYReHO7CzSnEvVp5ZqWLEukqPUxdxZzZzXu6Jg/phKh+7SydMkqxwRW/xtN0nWjiGqxXWjpb98Pu4eadALU6g4SSzE+OdatJXfUNr5iNh2qQZFLT7bpytYpoNzVvCIOuqjgzZ1JLB/KOUSCbYbL1hZWY+Ot4qpFvZdypRhb+xGI/RFmIxpYYHpe73VigEn0RmCu/DdhMEjwd2Ame7BsxGxGw7iZ6Dq+4XAHstXvqDJfcWgObVqT2ZxnWh7emCoenrjzuuhXOCs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohUI3cXFUhetr9WRjFGO0/f3nOBF1PqukznpsDvyA1c=;
 b=2Xy+kvrm1bTwMZYNQK08hUKAwEvkhp7O32e0XOuyO4XxBWK7YNl5IF8flISisE97YMb5a0RLVgczdCQuypCng4vi/Up2o8rqsv5JrRAuUx+ckRSgjZNySeWgi6uXiTv04DSkM5/B0KDgm8bHj2+RFhKVkOMOqdclB/WFkeFtgCJVK7r7XNNXpKFP7TaFOAb5SdTQULH4x851euh3De1MK3adchPG3heEjUd5BxzuTpm4hUuCHL1Qrpwq3bhFF1vRiZqiNCKyMTrfa4Dhq4Za1wFW/CpVqGe5fWmb8jLg3aQnq6LoX7ux5t3FgUZ178RpFYMfq6bUjTyCyBBJlqgxAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af10111b-ea41-1e6a-30bb-0b06d17d5253@suse.com>
Date: Tue, 19 Sep 2023 10:44:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: don't use access_ok() in set_debugreg()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d3dc68-afcd-448e-ee7a-08dbb8ec98ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xBmn6Fn2jw/LCKVv4bn2itzpN87pRZTIZ9t1oeZ3BmWeb708XnOiDGaeEa7sm5FAz4IQ7uzQq03g9YzS3b+1n4g1g1H/pj2+t1xEPvChPds43n9/GKTEKLtMubBB+miUsMabOk+uqKdgq63fzVjzAUX6SZkydheKOvwM7TMSxlBLZ2Kav0q7TW35f/7WskwgmYQpFrrb91JUOvNcnLhkYrKUbsS73a0QAaxYAifjRzUEZnXo4xnF7+W1dT6AmUqiCyBjZtQgsL0vrQ9Oxdm+GVtOZg2Ei/nOFT7mIOoH+zDRepoFJKPRIyFjJhhBiF2YqMZ/RLkq8M4GA/flxF4hFxjOlq+Xw4hCI8vvdKIKcpROb2rWRPK6CR4tSitBOG1pXIBuLv41f1+NDLaj9X+HKgsinMJVe/3SOB8WAKnEex80g2f2R32jmDeCVp7Qwv68Pjak0XpJsHnJbUIhxGgdpX+OjwEmvtOmnc4+jhiidn40+i+Q0vhVDt1z7itQMcgvWVELjRmOg+xJDYOsqYWMTYsTbxzC9VEgenW8f6iw++2obNFtIfK249u5zAm/DX1dy2VwaB1a8HfYp7wvtCof68b7+sGyf78jZH5/ANiupGz7a462+CYWIXpkWUBgcx5rO5wjrJ609nOXtVHq6PY7MQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(186009)(451199024)(1800799009)(2906002)(66899024)(38100700002)(83380400001)(36756003)(6486002)(6506007)(86362001)(6512007)(2616005)(31696002)(478600001)(26005)(8936002)(8676002)(4326008)(41300700001)(5660300002)(31686004)(316002)(54906003)(66946007)(6916009)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWplUk1WNm5sbjltSVkySXR4NENDKzZaQ0xsWCt4VHRwK1c5RTlmTmZBd00y?=
 =?utf-8?B?ZW1xcnVzQ09pS2o1SEVPZXRZbko3T1o4STVBc1U2YXA1Q3ZmRUN1dUZyNnhM?=
 =?utf-8?B?Sy9GR1V1Mko5ZmpsS3haUENPa2tZWXJEVE5HMEJyNkkxcGZ5bHkwTHNtRU5B?=
 =?utf-8?B?Z09pUTZ1K1lCeE1uNW0xMUptVWEycmF5ejFCSjlHVVlxMDNzT1ByQXh4d3pL?=
 =?utf-8?B?cUNFemgwOUJUekNHRHVNQkhROFp1Q3A2MHk1TzlZTEpQYVhIRENpK3R3d01W?=
 =?utf-8?B?Nk1TN2x4c213QU9vT0VjQmcvRWdQOC9sQTBNdTMyM3ZMeTM3ZGFXTUdhQ2J1?=
 =?utf-8?B?eEFKM1JkdVpHR0x5amNmdzhJWHJDZ0krdDVrZG9pU2JzSWNNTi8wcDFoUFIw?=
 =?utf-8?B?V01UdnRseFNKSnRSNmVsckFzNXpYRGc2WldLdEZmSjNOYTI5WndnM0NDY0Jn?=
 =?utf-8?B?YldpWW9YeE5vU3FQeEV1MEprbGxwaTY4MnlTamxrUDJjNHdLdXdPaDdScEYz?=
 =?utf-8?B?WFc4V3pLSTM2MkFzR1oyd05BVlQreVdQd3RIVmZLYktIOUhXU3pvUUQ0dCty?=
 =?utf-8?B?UzByUHZFTmVLWGtvWVNTZ1dsUHV6RUJLZisva0dGdWY5Ly9XQmIvN2FHZTh1?=
 =?utf-8?B?NWp3RFcyZ2I1VjA4QlR5NFFXWCtTV2p1cXVoQVJjQ1NLUDNGRjlKTm9nMEJk?=
 =?utf-8?B?S1kyL1gzM1Fhc3JKLytHeUd6bkpVYm1EeE1nTlhtYnhDSEpnNUlLSHFVbzBO?=
 =?utf-8?B?RXByWGRGZC8xMUc4YVd0bVk5TjQxR2xtNkJPOFhGQTRwcm02ZHpONWJhbGdC?=
 =?utf-8?B?UXlhNmNqUC8wTXpFV2NhUjRudk1xV1gvWEdPV2h6WGJPTVdVcU9hcG4welFD?=
 =?utf-8?B?ak1CTGh2UWw1QmQwK0hGQjg4amVxbVRwV0NMWUxTYXdtT1QwcjJFZTRoZXZy?=
 =?utf-8?B?cG5FWksvakFIdEJWSVd2ekViMnpJUXoxSE95cWk3alR4UGF3dnI3dmkvcllB?=
 =?utf-8?B?dHpTYWp5d3NaM2NFdEhteHBtY3NkN2hJTzNmdExOSGNPL3NhK0t5TDVRNDZW?=
 =?utf-8?B?VSs2RGkrajIyczU2OUdoZERaT2t6YVJIa2FrVEpkUGVrR2VTdkpmVnFncE11?=
 =?utf-8?B?b0x6N1c0eE1CZWs2RkI3NHR5N0FseW5GNWRib0FNVXorYlBtV0FFS25vRExp?=
 =?utf-8?B?MkNvd3RtSzc1R3ZMa0dxR0R3V3VnSG13dnRPZU1hNGd6bCtnRDBGOVJJMUdI?=
 =?utf-8?B?SjNWVG1ZWUdtcVEvWWhQQ01NOUs4Zk1PNzFyanhjWGZVaWRZcWpIdDdoNUU4?=
 =?utf-8?B?amFUUjJZTEl6Yy9kU2NMZ1hNSjYrWGhmZTJycUNBN1JRdjJTR2xtYk5GRTNC?=
 =?utf-8?B?TnYxbHNXZXcrRFMxbHdwVldNU1NQcTNHaXA5dDlTdlYybGhoYVZKbldIZ2dl?=
 =?utf-8?B?aGtUcEJGNDIyclZ0SklDd2tpRG8rY1NORDVkYXFWcmxzUENKNEJUdlNDcWhR?=
 =?utf-8?B?K0dIdVlReFAxdE42WUxWWGZRVkkwUEtEckJ6SFJYRFBOaUMybFUvdjJBQ2ln?=
 =?utf-8?B?ZG9YbGNjcXU1T2ltT1Q1bWxyYUR6c1NwUThPbGUrQUt0aXV4cUV6U09uUHpj?=
 =?utf-8?B?K3NFNUVyQlhWOW02SHM5dmtNaXViTWJTOFhvTnc0QThRaHBVWkpONWNwVTVl?=
 =?utf-8?B?WWdXSTlIUjV1M2o0N2d3M1puSUNZdUxXeEZwNWdWOUs4NWcvbUc2QmVha1hV?=
 =?utf-8?B?bWxVVmliMGNzSWsrS1NYNUIwdk9rOWFIOFVPeVVFZ3lhVnZwRTNtVWN1dFZt?=
 =?utf-8?B?QXlvUDh2ZU5vWUpneUh5Y3E1QU02SmFGWXI0NndnNUp4YW15a2s3UTlkVFN2?=
 =?utf-8?B?VlJPcEIzbkg4b0crYU5YOFlRcW5wQmtLUlQ3aFVPNjlNZitTR1Q0a0FIY3ZJ?=
 =?utf-8?B?aEhPcnMzR1ZoK3hHczlValk3WFN3b1JtbGxoYmp6dEJtZnVRbkczT2FLdVc4?=
 =?utf-8?B?Z0lEbjZWbWtQbm1OTnJ2ZitOSzEzYXJCZHZaNldBTytENWJ1ejNQaTNGY3hE?=
 =?utf-8?B?bWtPSGJaZFJxWHJzMG1XRXlvYWtvazhzWXVNTGxyelgvVHFhVmh2aEFGcVV2?=
 =?utf-8?Q?Pe6amuX1aIIZlEQotfoSIwCjw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d3dc68-afcd-448e-ee7a-08dbb8ec98ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 08:44:12.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kyu8bUlJuTT6Tpg9n0ifv6Y1rTk8YP83Sf4PHs3/5/ZNwL74qsXm2zzizjqtrtfktw6cSZUixgfsiKk3jju1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6889

access_ok() is not be applicable here; we really only want a linear
address check for breakpoint addresses, as putting those in debug
register isn't going to result in actual memory accesses. Furthermore
access_ok() assumes to be acting on current, which isn't the case here
when called from arch_set_info_guest().

Note that access_ok() was too lax anyway for 32-bit domains.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The questionable use of sizeof(long) is left in place for the moment,
as it's not clear how to best deal with the upper bound of breakpoint
covered ranges: We'd like those to not cover Xen space.
---
v2: Duplicate the change to arch_set_info_guest().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1085,8 +1085,15 @@ int arch_set_info_guest(
     if ( is_pv_domain(d) )
     {
         for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
-            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
+        {
+            unsigned long val = c(debugreg[i]);
+
+            if ( is_pv_32bit_domain(d)
+                 ? val + sizeof(long) > HYPERVISOR_COMPAT_VIRT_START(d)
+                 : val + sizeof(long) > (1UL << (VADDR_BITS - 1)) &&
+                   val < HYPERVISOR_VIRT_END )
                 return -EINVAL;
+        }
         /*
          * Prior to Xen 4.11, dr5 was used to hold the emulated-only
          * subset of dr7, and dr4 was unused.
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -61,7 +61,10 @@ long set_debugreg(struct vcpu *v, unsign
     switch ( reg )
     {
     case 0 ... 3:
-        if ( !access_ok(value, sizeof(long)) )
+        if ( is_pv_32bit_vcpu(v)
+             ? value + sizeof(long) > HYPERVISOR_COMPAT_VIRT_START(v->domain)
+             : value + sizeof(long) > (1UL << (VADDR_BITS - 1)) &&
+               value < HYPERVISOR_VIRT_END )
             return -EPERM;
 
         v->arch.dr[reg] = value;

