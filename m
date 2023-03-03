Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599906A91BE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 08:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505575.778420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXztI-0005wk-W5; Fri, 03 Mar 2023 07:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505575.778420; Fri, 03 Mar 2023 07:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXztI-0005u6-Sj; Fri, 03 Mar 2023 07:31:44 +0000
Received: by outflank-mailman (input) for mailman id 505575;
 Fri, 03 Mar 2023 07:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXztH-0005tz-OI
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 07:31:43 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 712db1a1-b995-11ed-96ae-2f268f93b82a;
 Fri, 03 Mar 2023 08:31:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8073.eurprd04.prod.outlook.com (2603:10a6:10:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 07:31:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 07:31:40 +0000
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
X-Inumbo-ID: 712db1a1-b995-11ed-96ae-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/jrUHvNoYmShzB6QDq58ikKR4Tb+6SLhdqYMLSKRwJdI/bSI9MBSpgF8isens5HAeBcVq38Ux+wTeUqNDViO+TPr9ZjXc3Ke7wVro4qjFgNzZv8FkhVOqhvWTtIInA5f8l5oslbzURT04z9fUSBOFp0Xh/RsG2LcqgFkBSnFTqCejz4VQwXPo3thNMkOVwH8vdMaKF685OMbweVzxeJ6pqxRZ80oaUyvq6tfF2fOm8c88IrN9DWmrkyKe51p+oBZhhe9f2LAgJ+amNBQqKSmfuaa+u2T72yOR1KagS61GG6AM9Uty1ebRdBfObYi8umD/okOUtFHwnxuqhs4ZEz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBNEmcCYS+n9KtRj3Yev8yT8RITlz4OvvmWkz8ClEoE=;
 b=XiKxEjJYSOdiigC22cViyxyog4TuT4yjwVj6Cvotw6mKxDvAjHVBUglEGsHlNIHiUcPg0FDL+vNoQ0Bz+09CnMq0JJniJjF4bAUFsPUXxidHim543QEJUwfEGmMNi1qfxy4EhyF1UBwQDyH1+4QkT9QoM++M8M9ZqE3cDHyUfxdH+7xxZDYw25C1lE+JYJZS7Ju5PLmfRavXrIZq021tKcfHiWgkuLzv03prPKE2IzsIn7hvUjdw3dP1qANThz+NbHV3RN+whcZjH6iuGnpUC4tTQ+B2UlydVo6fhZXuIehy6JG7ZnxrGqe6JNC6FQ6gJx+y1aykWZG90clYqV0GEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBNEmcCYS+n9KtRj3Yev8yT8RITlz4OvvmWkz8ClEoE=;
 b=KePBdCRSDSpjUTTWnc69uwipstVPNeZGO1Y2MMyveanDms3n8BSmM14sEnuKFJywhdVfxr8cnZosURViCY8bX+jWaUwaBbBdIGtAs5AfQwa8AkRH7JDRQLpf3IMs2Z9mRSSFXAYZXxVeGaYDBh44LGl+5YG6qwqDo82+5F5m5SJ3NAcjBgQczVe+peu0e+N2cYIk4D3W0j/9OMZsCOPf3d/4IHMQ/2qVA6mOJdLatZFbIGyIyw9/5rDUt39RCrN6Y23rxgwqWjHoQvSe5iixaePcOTsXFOt2YFKqAjQ273NUMsWfQO3XZYMh13zWxkZjL/i6YwZnMgKXdhcMBrKE/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a455e81-6db1-be47-42f1-9aa49531d715@suse.com>
Date: Fri, 3 Mar 2023 08:31:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/altp2m: help gcc13 to avoid it emitting a warning
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: b58a69f4-ecf5-4e1d-cf2a-08db1bb95485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eomf283TStaJQTHBQrkCfwC7VkrHCU9IJQF72Pxj25RZOTsfF9KMoNNYNwzuwx1FHTEu2+TvgiWtik2HSx3Wgg+zy3tqZ1vUsu00ajBJh6feLcwgzmphp3PVC5HfBNDvTNH8SBsupjtGPD85r0D2/UpYCrJpAkI1cv1hu4GuTSmkEF/mbEkTFy8gupS5D7eefQG5m+9yDOKn/X+yuImsft3Hbncp6YFfzIXJd9EeKeLtqyNSMGoXjZaDmMpnCDf4REp5csysYrpZa5qR0nl97fKG4tXZkN9d6FjvGfDIq67yH6gKtp6snIAixThlPVhDgzCQPnv+xnmkCoN/ekMf00ujgF02kTY27Yav5zLkS6GURPFCgmP/U6dtVVBKuDmrrnpv/KU8nI0sm7zK2c2TwfNiZSIZuwEBjv5a5mx9VLXFfyqINFUTaBN3JsdomlJjwd1BX5Jr0eJrpLkHytTxbYKolAUv3cPICEISG8cgQWdnmYhO0EiTLwZPqWK3VebR2mLTCYhOvaMGlAalSOLrAJJ4z3Vqty6MXJTtlJHJSmBOwfcGCHnsbftmYQ5LBzOAmnc3Vw9Wfriz58Xaj+ZDshOWr8BABhP8jjZKKJpe0FIz440LVy0zQHT30hQzUI5PoUkJovpmkPkUb2KraNrCWxtMD0V7qcWKxmirATpFjpyGyqJCmBlOpfZc1inQ27qRNu0RhLmHORjp++6j3eNLqqVi69uAOYiUwyXU9Nh79Fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199018)(31686004)(5660300002)(4326008)(41300700001)(36756003)(83380400001)(66556008)(66946007)(66476007)(2906002)(316002)(8676002)(8936002)(6916009)(6486002)(38100700002)(186003)(6506007)(31696002)(6512007)(2616005)(478600001)(26005)(86362001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG9MRU9pUWVuMXVHcmZIT3lKN21raHFyYkFFV1pLVDc3bVk2RFR4WDQrZ0x1?=
 =?utf-8?B?b1h6RHFYSUhuOFI5VTROL0x1dXBpZmRBZkJZclV4MDFqNzRmK3REcStUQzF1?=
 =?utf-8?B?U01rM09aTGlqdG1LWlRDVjJuRmZFd0hyb2J5ZzIvZCtqNkdFN1RZQWlXY0Mv?=
 =?utf-8?B?dXd4bVBxcXpQYjBzYnBRaEZDU0JBM0huOFQxZ2JMWStWNXlLRXB2VXJJT01R?=
 =?utf-8?B?dm9xVXNvSlJIV2Y2S1dhZStCQlZmeWxFTlkxQ3VYVzZoTFczRzZtazZZaXBx?=
 =?utf-8?B?ZGc0cXF2amgxajRsSk1rSXlVQmZPc3BkdENsaXRTM3Z2eXNyWmVtVi85SjhI?=
 =?utf-8?B?TUxaQnVoRC9ZNHVyZUc2bE1nR3MxWHZDZzlSU0NVS29kcmw0UHkvWjFqMmQv?=
 =?utf-8?B?L0RqVThOL3htYis5b2t4VEJOOHFlaEVUZkpKVXI4SDFBWkNoVE5KWjk4VWR3?=
 =?utf-8?B?OFNreFo4K3pvUVF2YUh0MzNzdXJJbDdBWEdUaFUvS0xqbEk3b1hIU0hCYVZr?=
 =?utf-8?B?MHZaRDBibW9QWUFsU2VrSjlSdE5NNHhvNE02bUc5V1B2MnRMeXVFVDVjMHp6?=
 =?utf-8?B?aTBqYlZhRUJvY2sza3NWTk8xcTNnVjcyVjUwVHpEemQyRUJTTElBUjF6RWRW?=
 =?utf-8?B?VDg0UnhqTG5mWTJvOVJNR3NFc3VxaDQ5L1RUL0M2bG9JMUFtNndYeEROVitl?=
 =?utf-8?B?alhjSWtpNGdJRzRDWUtIZTZ0YmI5dTdMUTE3WW5GOVlKTFRkOUM4UktaOFpJ?=
 =?utf-8?B?UDhreS8rV2xVN0thUXNqcjZDNE54bTgrcXlmSlNLZ3NyMFREU1o1dDdLdkl3?=
 =?utf-8?B?MkU3Ky9RdFdQS1RXVTd0M0lGZERvcmpRaE5HandPTFhUVGNLQzFzV2VMSjJp?=
 =?utf-8?B?VVpNTWxmWDZEc252OU00dWFIMG9kYmJ4Qjdtb2xJeWtoOWY4OVlIVUFnOUdX?=
 =?utf-8?B?UENnVTJIUGVNdnM2L2xiK2ZqN0V1NzJ0TklCOGJpd0ZaMDQ5bVNxQXhTdWFy?=
 =?utf-8?B?OGtGNmEzTEd0WTVPcXFFMjAzTGZOclRGV2Z6NUtwNXl3RnEwL2xZRExFOFVW?=
 =?utf-8?B?aEdEZjVUSXllcXROWVdFeFJiWjJ3Z3l2dFpkTEVVdFppNnlrYWhRTzZZR0Fz?=
 =?utf-8?B?VGVTakFKNWMvTkN1Ry90eHJMRDhGTmdIVUxER0NxRWQrNXdya3BTcFliL2hN?=
 =?utf-8?B?R0pISGFZR3VRNFpqeFBOLzh4R3l1MDY0KzVGWUxWN1AxY1hSa3kzdzBDQmEr?=
 =?utf-8?B?VnhIV2huV0YrYVdDUklSMXRRWlVPNXVERDdUU1kvaXJBZ0l4bFBKMURNd3RH?=
 =?utf-8?B?YzY4d3ZBYlFReGM5SFR1MDZLSlEyRFFwMUZjUEpCS055L21WY213OEs5ZU5I?=
 =?utf-8?B?dU0vaWg0OFpxcTUwUWttaE4zQUJ0bmgwVGpWZ3ROZmhlRHdWM2FPL0xKVlZN?=
 =?utf-8?B?aThZa3V5NUFWR2prb2VvQWN1a0FVdWtVYWdLSVIrRFlINTdTNS8vUzhINW9L?=
 =?utf-8?B?b1VJUUdUOG80d1BKdUVRNXNzaVAvdFF6U1R4ZUVBWktxR24xckpoTjJpT2U0?=
 =?utf-8?B?VmU5NkJDZnBYZGlER0dFMWs3QVJFVE90UENVRlJJTDZLNEpFcU1UdjMyY0g3?=
 =?utf-8?B?dGxPczUzYXkxc2V2SHJ1Tm1ZUXBXSm9aeXcyUlFwWG1OVzQ5KzhEUVNpMXJM?=
 =?utf-8?B?aWdLZCtkckIyWVdFaGZVMzZBSmJFVjRJc0s4TExoa04xZjVzak5GZ0xQYUtN?=
 =?utf-8?B?MVBjNkhKaUNJdVJ5S0xjbFEycTkyR2hGV0VPUDlEU2Q4VzFtT2llY040MzBw?=
 =?utf-8?B?MWh1bFZQN0N0Q1Y0QUZqY3JQTmNmMXREMFVRRDZqOHFjYU5JRVJNNkF3NUU2?=
 =?utf-8?B?Rnk5VzBDd0RPTmltN0V4SE5nRHZhWWc5QW9TcUFCTk0wWHRUc0NCMEEweTFW?=
 =?utf-8?B?NDl2MHI1MVpNTzcyNXA0V2kxVjk3TEZFbXFnUFkzbXFwUHp1Q1NpTEtPcVk1?=
 =?utf-8?B?eXB0VjFJZ3RIRUZUVWlhSjk1RTk5a1NzTEoyWlpXSlJpVzNlaTdwT09nSmlV?=
 =?utf-8?B?ZFFrd0JjcFd2QkJOSXhLeGhheS93MG1yangydmxpeFNwNHBKOEl0YlR1a2Jy?=
 =?utf-8?Q?lkjVNpXGsievK/BLEVFWdJBjp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b58a69f4-ecf5-4e1d-cf2a-08db1bb95485
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 07:31:40.5106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXxlcHujF+/J1cAMm5HdWwlnZGcmMtKByR49lA5a0HBPxpaV/4O97cwyIjfrdYVR1jlWYV1elGbiw5YYC9URtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8073

Switches of altp2m-s always expect a valid altp2m to be in place (and
indeed altp2m_vcpu_initialise() sets the active one to be at index 0).
The compiler, however, cannot know that, and hence it cannot eliminate
p2m_get_altp2m()'s case of returnin (literal) NULL. If then the compiler
decides to special case that code path in the caller, the dereference in
instances of

    atomic_dec(&p2m_get_altp2m(v)->active_vcpus);

can, to the code generator, appear to be NULL dereferences, leading to

In function 'atomic_dec',
    inlined from '...' at ...:
./arch/x86/include/asm/atomic.h:182:5: error: array subscript 0 is outside array bounds of 'int[0]' [-Werror=array-bounds=]

Aid the compiler by adding a BUG_ON() checking the return value of the
problematic p2m_get_altp2m(). Since with the use of the local variable
the 2nd p2m_get_altp2m() each will look questionable at the first glance
(Why is the local variable not used here?), open-code the only relevant
piece of p2m_get_altp2m() there.

To avoid repeatedly doing these transformations, and also to limit how
"bad" the open-coding really is, convert the entire operation to an
inline helper, used by all three instances (and accepting the redundant
BUG_ON(idx >= MAX_ALTP2M) in two of the three cases).

Reported-by: Charles Arnold <carnold@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4128,13 +4128,7 @@ void vmx_vmexit_handler(struct cpu_user_
             }
         }
 
-        if ( idx != vcpu_altp2m(v).p2midx )
-        {
-            BUG_ON(idx >= MAX_ALTP2M);
-            atomic_dec(&p2m_get_altp2m(v)->active_vcpus);
-            vcpu_altp2m(v).p2midx = idx;
-            atomic_inc(&p2m_get_altp2m(v)->active_vcpus);
-        }
+        p2m_set_altp2m(v, idx);
     }
 
     if ( unlikely(currd->arch.monitor.vmexit_enabled) )
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -879,6 +879,26 @@ static inline struct p2m_domain *p2m_get
     return v->domain->arch.altp2m_p2m[index];
 }
 
+/* set current alternate p2m table */
+static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    struct p2m_domain *orig;
+
+    BUG_ON(idx >= MAX_ALTP2M);
+
+    if ( idx == vcpu_altp2m(v).p2midx )
+        return false;
+
+    orig = p2m_get_altp2m(v);
+    BUG_ON(!orig);
+    atomic_dec(&orig->active_vcpus);
+
+    vcpu_altp2m(v).p2midx = idx;
+    atomic_inc(&v->domain->arch.altp2m_p2m[idx]->active_vcpus);
+
+    return true;
+}
+
 /* Switch alternate p2m for a single vcpu */
 bool_t p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1789,13 +1789,8 @@ bool_t p2m_switch_vcpu_altp2m_by_id(stru
 
     if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
     {
-        if ( idx != vcpu_altp2m(v).p2midx )
-        {
-            atomic_dec(&p2m_get_altp2m(v)->active_vcpus);
-            vcpu_altp2m(v).p2midx = idx;
-            atomic_inc(&p2m_get_altp2m(v)->active_vcpus);
+        if ( p2m_set_altp2m(v, idx) )
             altp2m_vcpu_update_p2m(v);
-        }
         rc = 1;
     }
 
@@ -2072,13 +2067,8 @@ int p2m_switch_domain_altp2m_by_id(struc
     if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
     {
         for_each_vcpu( d, v )
-            if ( idx != vcpu_altp2m(v).p2midx )
-            {
-                atomic_dec(&p2m_get_altp2m(v)->active_vcpus);
-                vcpu_altp2m(v).p2midx = idx;
-                atomic_inc(&p2m_get_altp2m(v)->active_vcpus);
+            if ( p2m_set_altp2m(v, idx) )
                 altp2m_vcpu_update_p2m(v);
-            }
 
         rc = 0;
     }

