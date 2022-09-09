Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C9F5B3503
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404124.646471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWb5b-00088o-Ad; Fri, 09 Sep 2022 10:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404124.646471; Fri, 09 Sep 2022 10:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWb5b-000871-6t; Fri, 09 Sep 2022 10:18:23 +0000
Received: by outflank-mailman (input) for mailman id 404124;
 Fri, 09 Sep 2022 10:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWb5Z-00086v-Re
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:18:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60055.outbound.protection.outlook.com [40.107.6.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba3e5fe5-3028-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 12:18:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8710.eurprd04.prod.outlook.com (2603:10a6:10:2dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 10:18:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 10:18:18 +0000
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
X-Inumbo-ID: ba3e5fe5-3028-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV8R+MtZVnSCi3DfnGDyxrd0AItnLgzQqm+iHqz0Dg0GnZJvL4rrCVGtcZVQJ3Dr9a4367iCSL3DLyEqBKPdRj6JbXcdjnrtb5ADHROuoZ+SQMO+9BXKp8aJau0e58vE/1zv2PcM4HPA2APRNujHMflZ0bLaKwypwAqgG6jfw6bEFUL8X/6djeFoiro8PBDjMy0vrxwPxC1+ggJ3KDrSdATxZYb8OpgA515iF2Momet/QRTR+vn2y6ibweER38WX50G48QqkmiRgqzrwRyBbALeX1L084rNHdYbNYjEFCcCgB2sHsor61wV9V1R2JMHv/Mpcll4+9dNwWeF0RDlkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnVpo75K2ajU9Prf0GLOajBAWXGHI4F8hbqIMVVqlcg=;
 b=aolgVJsC4QZaiQkLt5dbaZIpcXuhfvfXMGWEg9uLEeJVyf2lz1qPaWeyeshA8RBDMtiJQKylw0LPaBZQGJyD2k+HllKCB3UaaLblH1rewtAZ832I+vdh9ujoF5gOnx8P68hA1peo7isQhMPqf6Z9u6dSAxfaDmf4+EMmA/w/HyGwyVyMUYjHUeJEy+uSVtlfdXedXrNGxzXJU14BniGXNDneRmYc/dzFkXfQjqk68P09rBksDuSbwKwr+K7uYIjXdHA9FSTl7mOFKS2XP+xWltv24qXH3XwWg4rXlVXkN/AwRWUY5uDekwYy32nKciwOt7rFlp31d8YA6VqarTtBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnVpo75K2ajU9Prf0GLOajBAWXGHI4F8hbqIMVVqlcg=;
 b=Ud+Kixo4XyeBInAVzu94K67ZobT8AxeuK94s3puOhwGteJGG6fyYl8auzdOw3xpuw7bNquwzl8zVkJCE6ptE5ds9D1M18+B2cBMYXsaQxTtTvl1mlhBT1syRcBwnMa2T3S9ZYp+GbyWKjT7ccvEwPvjzPXFoMoLSKFzoVoX080lsKpA09jz1T0Wcsog/JQyKqbJBN/sbjPCfOqlBMhbDiWTGglf4DhHCqA9o7BmvrgqN7zboxW/d5iNMPPgHR0sLtxt2jfNVzxPxnG6wuyRexb4C7YnZONGqc/CFufSB32jwSsLdcEB+33WVaNZRx9szAMVEv67oxsg900Z8OB67TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c23930f-e809-d623-18ec-599a0e983b7a@suse.com>
Date: Fri, 9 Sep 2022 12:18:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be7ab50-29e9-487e-26ef-08da924c9da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Doo2UjbmzJhD6nU+9yNephSbvoti1SyL+gmyC4m2og96FSAANmEjD74Djo9PxtdjBiz+5gPTdvQ1CtSFCRYOPy7HQBrFRovTA3qMTRYUjWK22GjQ9HUHfN1nlMI78zjDumn2wX90xIucHgXbB3iDnKS0D/3PMy5ic6xcSus4wS1V3bL7NZ7+OuAArpDr++2n2m/4aF6N/4OiDIcHq3TKwXamocaX+weuljmWwsgmzgsiKi7WGvyTpBhC9lVYK/n9CtcHAH/9YUUTFkVdJFyYwZXgylePpmBDmTSCTBFdjCksSx478kP2mySsjNAEZ8GK4gvAsb++uaZMf4OKpMEf8xuQkJWR6SfcmWQsDMRlzg4qCA5SJg/NB2C4z0/rRm4FRAkfBGzjVBHZf7x93GsdqiOJHnRc2e9hajzQpaLGHOL6PGVWCKsxa7UpWLP4DIXzLFhaZRBShdAsexfknrY4lyPxUHlZIPeAsrMBniyvShwP6SCGQYtdbzvtnKOn6ZYvuCIYColN9VE/gwPVZvxNvwxyfbNAzZTXoNDtl8vs9x51/LkIMmF1sF0Dk7flHrVgVGZPv7KT/lyHvhptDelEf6M4QO5QiQfhPiOe1m2GeDel6jlaL+3kgME8r04quR7jBTAhGIQR4kRW5wcLtlr9X9pP4OwkJ9gSJX0NszxeoOfYT52l++VXw8Ujd3oDIMeZy3pRnPmEX6a8u2cvZqeiZAE+a5R04HM+x3v0dTOfq7ouqMFTE9VBcRyHG4ZFzKosaLjZMgGCOXPseXa7axJMJcJAaQK2PsgFIk5cQD0DYaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(39860400002)(376002)(31686004)(31696002)(86362001)(36756003)(8676002)(4326008)(38100700002)(66476007)(66556008)(66946007)(41300700001)(83380400001)(26005)(6512007)(6506007)(478600001)(6486002)(316002)(6916009)(186003)(54906003)(2906002)(2616005)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1h1SVNpOHhVL3VxZUxiM21zbWtoeUp6blRHV1pBMHVCZTBIR1p0SWhWKytl?=
 =?utf-8?B?RGdVMjVMeWJOTlplYTlIL2UvNjVPakxHcFVTeVZGM29HeHZYamdGMmNGQmpp?=
 =?utf-8?B?enVLczN4N1ZRd1BZMlVhRkJ2VURVNlRyZ0VRUnRBdnllREpaZW9FUFZSbkxq?=
 =?utf-8?B?aEd0RlQwK1YzRmxDeDdhNlR0S0tKemZJQ0Zrc0pzNC9GYTdmd2k4MFZtLzNL?=
 =?utf-8?B?U1R4U3hiVGJXdnkzQ0ZqK2RoTlArU2wvNXdsaTNjZ09YbzhCSGZuZUNSaFUv?=
 =?utf-8?B?bVE4ZUpvS1p3a0c4Q2xXRGNTL0kvUW1JN1o2bi9EZW82MENkVk9BbUpjdTJQ?=
 =?utf-8?B?SS9KTmwra3RHNGdqQ1FwL2ZLNmJvU0w0di9adENTbjRsSFNjM1JFby9lY242?=
 =?utf-8?B?dEp1V2ZPRjJBMkZ3c3gwMUZoS3RwNkhsamYwcUdTYms5b2VxQ1BjUktpOE9I?=
 =?utf-8?B?TXZ6SitCM01SbXNhYlA2U0c3a1g2THNtU0huTVJFSUpjMCtjODZnRzFtdXFU?=
 =?utf-8?B?M3IvWXliV204dHJ4VzBDNXFzWkpDbkc4RjhRcFh4UDVtMWlUQXNzSU9FNHVh?=
 =?utf-8?B?WEowUHF6ZXMzL3N4bnRqNzVFZjZlM2tvbGZkQXBkQjJrbi9PVUtVZzM5QzNy?=
 =?utf-8?B?VHI3eExHWGRremdIdWFFU2o4MHJ5VkF2a3pWVTBaQ1MzWDJ0Sml5K0FGQ2ZE?=
 =?utf-8?B?T3l5UDJpVStKUmVDZGthcmJwZG5DQlJvR2VBMFRGTVhoMWZ5dEN0aEY1M2U3?=
 =?utf-8?B?cHFsSEMxOG1YbmN3MGpUU1piem9pUWpreG9yaXhVS1lvdDNGVmhYdExwcCtX?=
 =?utf-8?B?TDBIcE1sTzl6WjlCUlNaaDQxdkhWcDgwSnltZmVxUGxXYktSbFVCQVpsczJJ?=
 =?utf-8?B?UkpXdzM2WWMwK1JoMkhaeHpYRE1Mak5SZ0VLc1pVSWxrVDhHTFZTb1l3ek43?=
 =?utf-8?B?WDNCRHA3aHcvaHkxNWx2OWNTZGJRVk1KS0w4M0hhNHpHZG5GZ1pLSCtIc0VL?=
 =?utf-8?B?NC9iZkFtOStZdjFia0FHUE1kQzV6OVdQTzUwVUZlNmpRanExdHc2eTd6NTZM?=
 =?utf-8?B?R2ZXdEJaV1o1Uk4zVGcrQXdlL3ZHS2UvOUdaUHBRZ1ViL3N1OStDN0tYNC9E?=
 =?utf-8?B?bmpEaG0rU1BLdmxtU043UVF6S3dQTDBRNFR0bGZhTXVnbm9xeHo3ak1GRVNr?=
 =?utf-8?B?U1B2UzJMRlVwdytVT1Z5OVB6WSs4TytyY0xVVVZkYjZma3lLMm5qa3JhMFpt?=
 =?utf-8?B?dEVsaVhoZ2F1c2kxcmhDUU85SmxBallYS2tuRlFONHhnamNPcVdid3dSZ0t6?=
 =?utf-8?B?WTc1TVJUQXFmckFWR09QcjgrMWxBK3ZwVm1VME5JODBpcU9PUlZGMHBISWha?=
 =?utf-8?B?cE5GZGVQMEdmd09jSzlubURMZU9ZbkQzbmVqT2t1S3pZM0VJa3R3N3FZR3dG?=
 =?utf-8?B?Y0RWWERXVHRiRG1ybVNyWHpHOFBWaEMvVGhmTjRuZjk3UERTSzZSZC8yN1VP?=
 =?utf-8?B?aVdJZ3R3S3YySkFpbDkzUlNTVVp5bWVMa3hvaVJEL0tvN3VKYW5GVUUxYkZV?=
 =?utf-8?B?Y0tGTkFaWE5oV1dRc2VlZVE3eTNBWENHcTRpQTZITEU3Uzd4aHViL2xsTnRB?=
 =?utf-8?B?M0s2d2JDWGNwN3o5d01kNjdJcVhVbG9aNHRQU3hvQ2pCMWZwek1vcVlQdXp5?=
 =?utf-8?B?N3hkcjlPTldZV3lQT2dNV3hrTnFiWDU5V2VPbVpuaGJiV3I0cEJ4eXhjdmZv?=
 =?utf-8?B?aVVBejZISi9wWWpjVTM2K1JnZUI3M1NiTkFnQWJ6VkVHM2p1TjlTUHRYL3JC?=
 =?utf-8?B?UEdueHU0REtJSnd4NkdNakhzckxwOS8rM0tvM05Lbk5GWmxrOEUxeFlaMXNE?=
 =?utf-8?B?WU44UWJoUUdyNkZac0xjUmhORC9wRXIvQTZXVktZVi9TL2VreWNwdVgyM3Nu?=
 =?utf-8?B?UDNVaWVKcStoVUg3SEt0anRvNE9KUzdrUU9BN3l3ZXhhN05tMXdyNGdJRU54?=
 =?utf-8?B?eDU3QnFSRWExUnd3dFVnalFlTFh4YzcraFNsTGkvdzUzdHBoVGFqYkxRWkM0?=
 =?utf-8?B?NGo2bFZMcUo1WWZEdHhlajlibmIySzVtM2xHdE0wSC84eDE5M2EvSmswUGND?=
 =?utf-8?Q?Ytt9ARYCQBXZ8+lvAE/FJNV2w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be7ab50-29e9-487e-26ef-08da924c9da6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:18:18.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpnThxLGF5A/7EqK57ZbdLAvF/lMhylvuvwT4QhtvBv84meEGgjCGmwoDiqh/eGmvawRqDkjEG/MlXuVlbKigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8710

Gcc12 takes issue with core_parking_remove()'s

    for ( ; i < cur_idle_nums; ++i )
        core_parking_cpunum[i] = core_parking_cpunum[i + 1];

complaining that the right hand side array access is past the bounds of
1. Clearly the compiler can't know that cur_idle_nums can only ever be
zero in this case (as the sole CPU cannot be parked).

Beyond addressing the immediate issue also adjust core_parking_init():
There's no point registering any policy when there's no CPU to park.
Since this still doesn't result in the compiler spotting that
core_parking_policy is never written (and hence is continuously NULL),
also amend core_parking_helper() to avoid eventual similar issues there
(minimizing generated code at the same time).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -175,7 +175,7 @@ long cf_check core_parking_helper(void *
     unsigned int cpu;
     int ret = 0;
 
-    if ( !core_parking_policy )
+    if ( !core_parking_policy || CONFIG_NR_CPUS == 1 )
         return -EINVAL;
 
     while ( cur_idle_nums < idle_nums )
@@ -213,8 +213,9 @@ long cf_check core_parking_helper(void *
 
 bool core_parking_remove(unsigned int cpu)
 {
-    unsigned int i;
     bool found = false;
+#if CONFIG_NR_CPUS > 1
+    unsigned int i;
 
     spin_lock(&accounting_lock);
 
@@ -230,6 +231,7 @@ bool core_parking_remove(unsigned int cp
         core_parking_cpunum[i] = core_parking_cpunum[i + 1];
 
     spin_unlock(&accounting_lock);
+#endif /* CONFIG_NR_CPUS > 1 */
 
     return found;
 }
@@ -260,9 +262,11 @@ static int __init register_core_parking_
 
 static int __init cf_check core_parking_init(void)
 {
-    int ret = 0;
+    int ret;
 
-    if ( core_parking_controller == PERFORMANCE_FIRST )
+    if ( CONFIG_NR_CPUS == 1 )
+        ret = 0;
+    else if ( core_parking_controller == PERFORMANCE_FIRST )
         ret = register_core_parking_policy(&performance_first);
     else
         ret = register_core_parking_policy(&power_first);

