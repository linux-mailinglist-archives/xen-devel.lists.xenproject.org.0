Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD44D412F3F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191432.341463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa48-0006JD-8Y; Tue, 21 Sep 2021 07:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191432.341463; Tue, 21 Sep 2021 07:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa48-0006GP-5B; Tue, 21 Sep 2021 07:19:44 +0000
Received: by outflank-mailman (input) for mailman id 191432;
 Tue, 21 Sep 2021 07:19:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa47-0006G8-3S
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:19:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49b1ca9e-1aac-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 07:19:42 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-o06BvGRINnOqe1Or22CsTQ-1;
 Tue, 21 Sep 2021 09:19:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 07:19:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:19:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Tue, 21 Sep 2021 07:19:37 +0000
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
X-Inumbo-ID: 49b1ca9e-1aac-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/fFnczmCtwlapERXxOX/XNhHEnAVEjvjTgMNNwr6tw=;
	b=d8hxIQ3+Zjs9V0ufk1WdwDW13lp3CSuRyeVi4v+7Sfe9SAbtz71Q4LHm2KdBh7NeWTTVAy
	ocevN2A6/LvLA3GTPj1+BaBGK7no2a5ZEZEW1KdOiT9BaxNoU+6e2nKMgkBfvO4uVk4AZS
	hqPSBnCB2C2yWymoGYgKs5GjGbdd0gM=
X-MC-Unique: o06BvGRINnOqe1Or22CsTQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vw0PD9v0hk/jRxeWzor461xYslltKuCVvmUzNIEgkwGAaEWQuQYTd+zjflwge69YRjZSPzPqfTArWCLE09YZyF+Sjt6v0MR0ukdPQ5Jjj7WEDgd5kXG6qrndCg6Riotfhrc/ZMkcLg50XC0hphVwC7VUPJrp2MtB1/vaU5BEl5XhphwBP+GVFz2EIl8iaKboeOdU62HvFfij8Z+toX49ovF8YQpo6ZPLMkUcx44Nn/NqIvSSsc8y/gHj9iqhPoQJhL2fHpWsBCSZaYS15AYzVcOpEuSduNRmLz8mqm2Lfqmfx4ZOBfgjBsf2Rd19I/LXR1T1dsp+dYjIZVBoaFt6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=R/fFnczmCtwlapERXxOX/XNhHEnAVEjvjTgMNNwr6tw=;
 b=PScBIewm7KpmAyqZSfiMHy9k2LWhGe6dIBpaXajAa4/yVbYp14spCbLbVuS2TDTUiAg5ZnvSOczCYhWjcT8MfYAaAxskKwg21ZC5I1bD02Oti5xfpAZTOyZKhAztCpHM8hlIlJFqYke87rGGPlM6s+XVP+JzVdXFOM4r4dut9HgHMlW+UWRTVZgBK1mfKlHmdj0NilGBwZ16hLlJ5RYlXlzwi2iFgFp9JatSrgsot+5sIWUhXW2IuyKvawJK7+HG9E103qOnFxfEc3loC6z1YrIwTTZo0sYRRi1VK3ZeC9GKTw/AOl4jfRGKvaIVgP1DDbQsARyt3b5W4JAwXPoB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 6/9] x86/HVM: convert hvm_virtual_to_linear_addr() to be
 remote-capable
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <3397b5ea-bc21-5a2c-ba5d-afc974a92df4@suse.com>
Date: Tue, 21 Sep 2021 09:19:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72fb8069-fc20-4153-7ac5-08d97cd02bee
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26067874CC4144E593081B09B3A19@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TJaB1RuJ1J1TQQJVuAIWYy1Lstkt45BXC8DsTjD1KvItYVmqDHMaGVe9XhXNCDzqX4l7qDFm2Q9qxb0qWhd8wCGTeqPp6SRV0ty7bbwZGUE8nLotJ0Vs/foJQvVJXIVeFR4yYQRDdtlXKP1r0czwN+g5L3lpDmXXSm+y3xTgyEt8R+y2ycJjcswjF75kmxP18I9fRiVShgpcFARQ6d8FACbA+07mRQB+ZkdHWJg7K5uv8ExhAqj0KmgQ46aRaQ2sEoWPCK+fwz9YFKehHyoXGqj92WgqwDHyYsMVrngmJo+HP45GIg6PEnsi/PBaIOeOKd589ly5pVdTRcV7ok/3/ai2hjerGraB809PdYUIILZyV+fhkxaxlPpcKBwMDyzc1iFjtqtlnmKSrpWKzyLWAose+e+4gCgHbEzXO/pE24sLDwNV+knG6yJjk5E/q0b6ebnzP1PhCj2eDWlces5ZTCz37hipjj9q45qt2RRHw5nRRj9VRPn8VI4nGvXIl4eSvNatDkRTD9d2epVU4gsmo3MqrtBWgwqIGOSQ+0dNgla/mTWUr3/nkf2dIA6F7UyoBpv2hPny0NB5a4hqEHIfoAVkzlI3aIK1b3RnkTFJ+asIm0nsJGT8i5DjsKe8cAeKmmqidAvr2i8QlrM86LE4I0OHOnzMRCZQM45feq9g+y5VKNMy0gARvsmDzjiTRu24WQm2TEvjQvPYC+uzI6BAd5KGeXe0XEPeyhE8egt0a38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31696002)(508600001)(6916009)(38100700002)(2616005)(4326008)(83380400001)(66556008)(66476007)(316002)(5660300002)(16576012)(26005)(54906003)(86362001)(8676002)(31686004)(956004)(8936002)(186003)(2906002)(66946007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTZDZ1JSOEwySEwxZVhNY0FxelNBVW1wMUEyc1ZJbmZSRWRvc2IrbTJidHZj?=
 =?utf-8?B?ckd6cTZiaGJuVU96VmhXb1gvKzhJTi9TTUJTbVZ4ejJvOTZZK0NqTTN6MHQ5?=
 =?utf-8?B?NjRFd29BaEdHdFhsOEpqd3VTRGx1QkUwT3FjMExtSzlKU2V2L0ZuQlhqYlVh?=
 =?utf-8?B?Vk9pYnptZ2ZrWG1UdEVnU0dSMG9KMDJpdWFJTmNkYURxVlZON2d2aW1OZHg1?=
 =?utf-8?B?Z1U3NUlad1dBZUFoRFAzeTRFRDNHZFRGd3dnNzY3N1BSNXMxYmZEbjU4NnJK?=
 =?utf-8?B?ZFRKTVVtcGpiS3J6c0JqK3pXdmFabnd2NU56ZHNRcTVGd01FS2FQTTRGUFhM?=
 =?utf-8?B?aDkrQ0c1UFlpcTdpZkZFbTNQY3Z4cnVzSTFrSUozc0RoNlE5RWtFZ2I3cENq?=
 =?utf-8?B?Vkx3eG1wa0FjZFd2SHVlK3h3dFFqakFJdncxYWhPTDRYOVZYRmhPUXBQRi84?=
 =?utf-8?B?WDFJYnBmTkU4UDVtM3ZTcE8yU1loUDVSOHc5ODkxSytURW1yL2JjNm00eGty?=
 =?utf-8?B?TVN5UzM5WUt0SnlsN2xDTWlya3dIbGU1K0ZqRCtVK3ZWMmE5ODVWaG1zcHhs?=
 =?utf-8?B?a3J4VXFGUkNSTFRqY3puSy9aQng4a1VhK09IQjlTaXdsc1hlclhJY0ZFckN0?=
 =?utf-8?B?cmxDSllOY3VVYmpyUzJDaG44VENlckZybytmRkFTZ2JiYnlOYktXbis0RkRS?=
 =?utf-8?B?Y3FqR0Q2RXIya2JsakgwcCtUWlZBU2RhZ1JVS2lBQnVWUzF1aG9EdlgzRVlL?=
 =?utf-8?B?dzIwQVpOMUd4QitQZDh6bUJ4c1Ara0RBc3A2WUZCcDg1cE5rOUs3MUt1QWJK?=
 =?utf-8?B?Q2JDWlhnR2Z0cWVEY3BXR0tJNnk2OUV4SEN5UVhpZkxpS291cWthb3hKa2lL?=
 =?utf-8?B?cFNlaVBybWcxNjJqcWlvQkJOWkRQeitCekJIa0VheXF0c2o0Q0R6TTd3Uk8w?=
 =?utf-8?B?SWtjd1RIQXozeENNWTJKMkNzMENvZGtrYjhFdmRFbmxSbnB2WFlOc3VuZ0sy?=
 =?utf-8?B?N1JtZGpzd0lvdVZpd1IxVWVaQ0h1amJZZHBocWpzL0N6V3B1MytvZ05zeXBQ?=
 =?utf-8?B?N2x0SjJLV3dkNHdGdWhYTlNrU2JHaTl6MjJoL3hZRE0ra3l0dG53VmorVkdl?=
 =?utf-8?B?Sk52NHFxZXc5Z2hLU0tPYUI3V240S0RIbzhKRVVhUGtZa3JzMmFJNm8yNlhN?=
 =?utf-8?B?aUZWM1dtUHh2R08zb0VlVHlPdkZSb012RFlmMTVYclBVcW5uOFBKMEpSZUY4?=
 =?utf-8?B?MzhlUDB4Z2pVYkdOcDIrSEp4ZDZkejhCVHlaMHZ4bjZmZWx3bTZ1Q3hxM1JQ?=
 =?utf-8?B?U2VlY1lOelk2cFZETDV2aENMdy8xTXg3SWl5RFl6Z1RRR2xwSllldUVuMERE?=
 =?utf-8?B?RzRGbXZZUVVFOXZKMExqUVV0VlZmZ1FQMHhiK3ZGeWwwSGpOQnVKdUhwZjBZ?=
 =?utf-8?B?NVRDMmNNaU5aQ0pjdWtmSEpjUDZ3Qm42c3dUR1hGYTZlOG1jMlNUQnBjWU95?=
 =?utf-8?B?ci9JYnluUEI2T3M4dXMvSFB5TXQ2SmtaWnhNbWRBc0ZDOE14UnNKdjlNR2dS?=
 =?utf-8?B?N0VYZU5vaE41dUJKQ2JoTEMxRER1WGFmNjNjSGNNMmtxb1hNQVVKMHM2Wmdo?=
 =?utf-8?B?cUhEN1V3T2VnZFgwK3M1eGowaVp6ZWZrdUw3NERkY0xwTDZiK1hBQUhwcVJu?=
 =?utf-8?B?d3llNVF6NkJFaUVpVDZRM0JGQ1FjU0lnOUdXTzF1SjBZTjNYV2RLK2h3SG45?=
 =?utf-8?Q?EY8kKN4BORMZ/F6qciG0TM/27rcPNIB/HFhAgkO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fb8069-fc20-4153-7ac5-08d97cd02bee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:19:38.2846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpgVTVTSozs3rU/tqjja6EY4bOmQ/8bVed01uRMqnAGv7w4Px6N0MICPRM1KaCQzTzwZC8/c2+At0QdMUFcgdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

While all present callers want to act on "current", stack dumping for
HVM vCPU-s will require the function to be able to act on a remote vCPU.
To avoid touching all present callers, convert the existing function to
an inline wrapper around the extend new one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively the actual dumping patch could avoid using this more
elaborate function and, ignoring access checks, simply add in the SS
segment base itself (if needed in the first place).
---
v3: New.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2526,7 +2526,8 @@ int hvm_set_cr4(unsigned long value, boo
     return X86EMUL_OKAY;
 }
 
-bool_t hvm_virtual_to_linear_addr(
+bool hvm_vcpu_virtual_to_linear(
+    struct vcpu *v,
     enum x86_segment seg,
     const struct segment_register *reg,
     unsigned long offset,
@@ -2535,8 +2536,9 @@ bool_t hvm_virtual_to_linear_addr(
     const struct segment_register *active_cs,
     unsigned long *linear_addr)
 {
-    const struct vcpu *curr = current;
     unsigned long addr = offset, last_byte;
+    const struct cpu_user_regs *regs = v == current ? guest_cpu_user_regs()
+                                                    : &v->arch.user_regs;
     bool_t okay = 0;
 
     /*
@@ -2547,7 +2549,7 @@ bool_t hvm_virtual_to_linear_addr(
      */
     ASSERT(seg < x86_seg_none);
 
-    if ( !(curr->arch.hvm.guest_cr[0] & X86_CR0_PE) )
+    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_PE) )
     {
         /*
          * REAL MODE: Don't bother with segment access checks.
@@ -2555,7 +2557,7 @@ bool_t hvm_virtual_to_linear_addr(
          */
         addr = (uint32_t)(addr + reg->base);
     }
-    else if ( (guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) &&
+    else if ( (regs->eflags & X86_EFLAGS_VM) &&
               is_x86_user_segment(seg) )
     {
         /* VM86 MODE: Fixed 64k limits on all user segments. */
@@ -2564,7 +2566,7 @@ bool_t hvm_virtual_to_linear_addr(
         if ( max(offset, last_byte) >> 16 )
             goto out;
     }
-    else if ( hvm_long_mode_active(curr) &&
+    else if ( hvm_long_mode_active(v) &&
               (is_x86_system_segment(seg) || active_cs->l) )
     {
         /*
@@ -2636,7 +2638,7 @@ bool_t hvm_virtual_to_linear_addr(
         else if ( last_byte > reg->limit )
             goto out; /* last byte is beyond limit */
         else if ( last_byte < offset &&
-                  curr->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD )
+                  v->domain->arch.cpuid->x86_vendor == X86_VENDOR_AMD )
             goto out; /* access wraps */
     }
 
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -314,7 +314,9 @@ enum hvm_access_type {
     hvm_access_read,
     hvm_access_write
 };
-bool_t hvm_virtual_to_linear_addr(
+
+bool hvm_vcpu_virtual_to_linear(
+    struct vcpu *v,
     enum x86_segment seg,
     const struct segment_register *reg,
     unsigned long offset,
@@ -323,6 +325,19 @@ bool_t hvm_virtual_to_linear_addr(
     const struct segment_register *active_cs,
     unsigned long *linear_addr);
 
+static inline bool hvm_virtual_to_linear_addr(
+    enum x86_segment seg,
+    const struct segment_register *reg,
+    unsigned long offset,
+    unsigned int bytes,
+    enum hvm_access_type access_type,
+    const struct segment_register *active_cs,
+    unsigned long *linear)
+{
+    return hvm_vcpu_virtual_to_linear(current, seg, reg, offset, bytes,
+                                      access_type, active_cs, linear);
+}
+
 void *hvm_map_guest_frame_rw(unsigned long gfn, bool_t permanent,
                              bool_t *writable);
 void *hvm_map_guest_frame_ro(unsigned long gfn, bool_t permanent);


