Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F98A62F299
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445555.700766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovyfB-0004fm-E9; Fri, 18 Nov 2022 10:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445555.700766; Fri, 18 Nov 2022 10:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovyfB-0004cu-B2; Fri, 18 Nov 2022 10:32:01 +0000
Received: by outflank-mailman (input) for mailman id 445555;
 Fri, 18 Nov 2022 10:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovyf9-0004co-L1
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:31:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35f4608f-672c-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 11:31:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7551.eurprd04.prod.outlook.com (2603:10a6:102:e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Fri, 18 Nov
 2022 10:31:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 10:31:29 +0000
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
X-Inumbo-ID: 35f4608f-672c-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlmrzwobKb2nRm1TyXPlhkHdclgdwdPJ2rUbxVCofkVzTb8836q0+pyuZr3ge4HrKgl0DSDINhy0HZbMQAydPCMn2/I0+ZdyGJmFKKhO6rvcxkcjIWGSMt3uP8GiA2D9uqPQwRB5N55zfw/DPxdF3XmzRlY0MrNlw9GLuvI29rjCSyPP9hm8G8rTsI4zi/G4yNHJp0EDjCoBwnW6MUP7sbSyank7ct+jLhvi5tZ3TrTZoAoAoWB/wPfWoS/WVy96J9QLbFPG+8BmBBl3fE0hjFP89tAizrZsX6/adxua0Hm+22yT2+sVIArAThquHknC0lo2zgLJYGtKAxY8lk3plg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4843PEKfZVz9As49dWM3d43kFfV2jNSzREIg8Ev5iw=;
 b=AeCLcKzsp2h741xRaOUz7HlHvSpGX4Vr9uxXkCYynOIIqegYdfoFtkR+sF5DPV0ZGohMxP/DSbYnicI9sChRTvUjEAU2OMtTGubLNieqXAuV6zDjx67mVVD9s6qc+xsxw9AmtOfWkKp6eYFbIEwBZ9Umi1squt/94DtdnyZngDr9LgGTCLCDGUZl88YcM3EmUdbRCdeAyrRMI/vKr3EDUww+aB8598q3Wh6/1uLrrosrj36lf5bpMtudry25Kj9HRPpktHTuO90OPJLNTka6POLesRxImGYBwrCfIGTNobXGGK/xQhodHn43Jf+L8G2gEJ9qTSfDjv8TD6Cip4XMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4843PEKfZVz9As49dWM3d43kFfV2jNSzREIg8Ev5iw=;
 b=bNE9JpbQdpGGvucXntkMR78M6FawfdOk1bqK1whmOPT1Zh1cYRIW8QrE7RqBbEa1ULoWzJ2VDymqMa1W6bPetA+QHHZUc6YetIZHIJhVS3PsUkspmi1LBvFN9l8qe4vJpFq6a/v46GuAadOi4yHfEYz/0L4u3E69CdGdEJpbINecGncTThSpI80MndT9Kt+qlqBTC2PpJK2eaVEOrm1Pz14B27F5bJ8Ul6fBZNIE5h2rx3FZhDIqtJpQIYUQxvF3QWwOxD1TiKtFkdWlawkA06V0LdGO9hO1Lt7DU+JZAm6V4dq+tLG91yGwEYGwJ7uXBjUMeBZrqaMcE4OOI0YR8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
Date: Fri, 18 Nov 2022 11:31:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c1e7db-86d1-444b-6d5d-08dac9500df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	au/URv5ffAdLEBmvnqBX7bh6mhD4dp23RZp4qckylcDS1loOst5lfSDDYqu/c5kYP7s6witB3f9sx0R8u+C8a6FvJPnESwOuXKFp5WrWeHU7hAieY2lYKF2zMlmuXqzoVVUQT8wgCG8jpZr/iITilcoDg0yO54h3CMPdz1az+/OuikkxkW1GaCIqcmJwRuqnZULsGiDORVlwdpgRv3T/djvhKuKmIWRtb8o9kIJ2azq02hvtP/3NhLfjFT6VLijkUmfi+U+/2hLojIi+KLy8qRZ91bofjVbsFkGQI4PkW+DSDeZo6ue7fsQPaBXOOPd7G5PKd+5ikis6B6bBK7szvBXRaYH6jtjOpPrUE1abymQogDbOpuTjpvm2mGX1iyarlE8/cFIqLV7Rb4WMYaUSyovYaKR5sO9mfac/IQLjepuiJ3HwAEBMeC3xdaC+cPP1fMmmLXKkYsrMIQBDbPJwOnnbvzYB8kr3lW56GiIgHHK67rws05I+B2Cieuzg3lvgUf7N9De0zTXjh64E/1FJLkm7wmDR5osBLkEEvhD1bIoX63BxPcDZCAQaUHmw4nmpgQM9Lus5fUJ+4s/mgW1/zRaM6tem8/7GZ5/kRUw5N4blNELy4/i1mrJRTQ+ZAppJ8lWyLUYH0FBdoYPjZt0rDxuCQzqVgeGLpntu6PAVnKgfjPuGQj+8CHaFGvj3KPjGPwjDBR4z56zMyeuftCOaPxtuxZIF9eFUpB6NRZDzUDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(86362001)(31696002)(83380400001)(66946007)(38100700002)(8936002)(2906002)(4326008)(41300700001)(6916009)(66476007)(26005)(66556008)(6506007)(6512007)(186003)(2616005)(8676002)(316002)(54906003)(478600001)(5660300002)(6486002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d25Ia1ZrVFpwL2hERW50TDBCRjNqWlhrdTZDWVVrQURWOHpMN1dDb2ZoWTkv?=
 =?utf-8?B?RU5CT2EzV1Y5Q2IvTVNQUEY1M3RLMExrdEd1VUFRS0xaQXRsd1p4WEd0R0tM?=
 =?utf-8?B?dzJ4K2liNEhtRko0anVsamllWHY5RWswYzdjRStZcTdjckxBQWxTa1FrTnlz?=
 =?utf-8?B?OGpNTXlYcTNwNjVQNnNWRURkZTFxZU8vSHZKM09raWQ5T3g2R3ZvdUFpOVlj?=
 =?utf-8?B?M2dEOElmdlFMMFlMTGJRQW02RlBRVVhtRmJublV0UXpjWTJ0SGd0YkFySkR2?=
 =?utf-8?B?U1M5Vzk3VWpqMitScnlXR2JVaUF3ZUE5OWVrMm56Zm9MMUVadzNxUnNmSEF6?=
 =?utf-8?B?TWhYZzdGWlpzWUxLZEkwdkdocmVmT05nK0NENVplSUxiL0JoYXppdzAwdWtV?=
 =?utf-8?B?eDhMUUMxWUszZUd2cE1WM3pGd3M1THZTV1J1SExLY0tEUnlyV1JrYXpMcUJR?=
 =?utf-8?B?bGpSU0tybWxuS1AxbEhIcUYrMmY5ZUI2ZUxzYWJ1amlSczE2c2hnRzR4SjA4?=
 =?utf-8?B?VktQS3NnNWtKZnFxSXhwSlljK1Z6NHcrdWp2MSs4VjhyK1BPOEVhVm1lWVg0?=
 =?utf-8?B?aXgzSUNwbHpqUHNqbHZ5Q3BQL0xnZ3BoaWphdVlrS3NOTXBvYmxoUmNvWi8v?=
 =?utf-8?B?ZEJSemc5VEZXckI1Z2pxczRFWUJGY1p2U2RvTThCS2R4OVdiMVM5VVdOc1FK?=
 =?utf-8?B?QjdlbXA5dUFRUVdKT1ZxNXg3Nm1zdGZmZGNxOWRqa0JUV1B0VWxPUkFkU0pO?=
 =?utf-8?B?WGpjZlQ5eTdUVWNzWUVHYmpnRXdOV1BTZXloTHdLRXhHTG10V0ZRWU93NnFt?=
 =?utf-8?B?dXYvR0dMaU12bmJYbzhYbUhOcGJiUlRtMElkSjg0bTgyckR0OW5HS2xKbE41?=
 =?utf-8?B?cFAxTTNCb1g3TXB1YTg0RzFqZEd2U3lJTStkR2F1Vy8zZGVYbElEcEN0MXFz?=
 =?utf-8?B?dFl3aEJRbXVQK1BiMUJhenJIblhVWWhlcVA3MElSdldYQnNXYm1zbzhRQzhm?=
 =?utf-8?B?QzJ5M09id2ZXd2RTMjdKTUlGUnNGS0VPNS9xNm5LMnltN3JyNDRzOWxVdXB5?=
 =?utf-8?B?eURyRHJlV3R5djVzejJRWWhmc0Y2RWVjcy91T05zYTZyT3dYZXFmN1lzNEhD?=
 =?utf-8?B?OFZ0ZjcvOTI3SEtheUluVUIzZ0ljMDhpWHBjekRWblMrQVl1aW91M2xxN1N6?=
 =?utf-8?B?TmVVd05RNEVSK25NdmdEUytCVWtVY241bEsxcS8vYmozSmtIdEkxUTZ0VENX?=
 =?utf-8?B?TjdtVllqaHJ1RDZXRHJtTlJiTU9CUkxQcnZPYUZweDBaRDQrb0tpcndPVVBW?=
 =?utf-8?B?ZDg3dmoreDVCTk5IZ0VkNzdFeUJoemN4Q1pUYmtSbU12WmZkbzRNMy9Ud0o3?=
 =?utf-8?B?K2dNenhob0lqRVU1S1ZmNEhmbDVLYmNFdDZVajVuV0lISTBKQi9OWlZSOHBm?=
 =?utf-8?B?WDd6Skg3bUMwdlAzdWo0cVpJZVd0VEtQYmI5MGorVVk0NDQyRE1jeUpvTHhL?=
 =?utf-8?B?Sy9GWHNMQmVreGNzOXF6SmxMSE1sa01sNkZDWlRWNE9ncHlhcTIzOG5xRWhu?=
 =?utf-8?B?bUhhZm9PbHJ1YmV2STdMbVQ0dmExN3lrbmFnekFRRmdkWkxsQmg0dlJXMHVE?=
 =?utf-8?B?SVpHZE9TV0RlMitCK2JKTm93QkhpS0tnakFrSXR4Nm82NlpRaFpGTmMvK2VT?=
 =?utf-8?B?akJsU0YxZk1YUXBlbUp0eVJmeWtVTGlnTThrWDRxK2ZNdFdSTC8yeUs4UUcr?=
 =?utf-8?B?eGVFVFl4TUtieTgxeDFPWHNMOU1xSFpEb2NLQ2FxVTZ6RWlncktjUTE5bjZY?=
 =?utf-8?B?b1FaZFMwc2RKdkJBOGlZd2RETXBjQ2FmUzZyN2R4cUUvSFdUNlhqazhKMGcw?=
 =?utf-8?B?NDNQazJBMG1uL3U3WUl0eHRTaUtFV01Zb3NvZ1JJVkI2dDNlNm1ycU83Vm4z?=
 =?utf-8?B?bUVObjdSR3VneGJtbGZlMFRWektlcnZML2pES0Q1Zmt1WTU0cjZmY1l5cUNJ?=
 =?utf-8?B?U0FaTEk5WEEzMWdKeW9oZzJRTjVDZWFqK0J5U0J6VjhYVzVrdmYvSStQZG1u?=
 =?utf-8?B?eE1vVWE2TXB6QnkzOWdlU2oxeUljU3Y5TjhQNTY5OXhURmYyOFRtOU84bTRH?=
 =?utf-8?Q?xwjhrnwqQA5SDS/WTmxXXzAiR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c1e7db-86d1-444b-6d5d-08dac9500df1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:31:29.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCluhwvBhQhB574tVLsdXHOWta8aekrryrhIMYzf+w1yVSYqmdn7cxJSrzopuEWACSqkg5ifbdDf5CspXBDQEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7551

Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
exposed a problem with the marking of the respective vector as
pending: For quite some time Linux has been checking whether any stale
ISR or IRR bits would still be set while preparing the LAPIC for use.
This check is now triggering on the upcall vector, as the registration,
at least for APs, happens before the LAPIC is actually enabled.

In software-disabled state an LAPIC would not accept any interrupt
requests and hence no IRR bit would newly become set while in this
state. As a result it is also wrong for us to mark the upcall vector as
having a pending request when the vLAPIC is in this state.

To compensate for the "enabled" check added to the assertion logic, add
logic to (conditionally) mark the upcall vector as having a request
pending at the time the LAPIC is being software-enabled by the guest.

Fixes: 7b5b8ca7dffd ("x86/upcall: inject a spurious event after setting upcall vector")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Don't one or both of the Viridian uses of vlapic_set_irq() need similar
guarding?

Is it actually necessary for hvmop_set_evtchn_upcall_vector() and
hvm_set_callback_via() to call hvm_assert_evtchn_irq() when
evtchn_upcall_pending is false?

--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -321,9 +321,10 @@ void hvm_assert_evtchn_irq(struct vcpu *
 
     if ( v->arch.hvm.evtchn_upcall_vector != 0 )
     {
-        uint8_t vector = v->arch.hvm.evtchn_upcall_vector;
+        struct vlapic *vlapic = vcpu_vlapic(v);
 
-        vlapic_set_irq(vcpu_vlapic(v), vector, 0);
+        if ( vlapic_enabled(vlapic) )
+           vlapic_set_irq(vlapic, v->arch.hvm.evtchn_upcall_vector, 0);
     }
     else if ( is_hvm_pv_evtchn_domain(v->domain) )
         vcpu_kick(v);
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -829,6 +829,9 @@ void vlapic_reg_write(struct vcpu *v, un
         {
             vlapic->hw.disabled &= ~VLAPIC_SW_DISABLED;
             pt_may_unmask_irq(vlapic_domain(vlapic), &vlapic->pt);
+            if ( v->arch.hvm.evtchn_upcall_vector &&
+                 vcpu_info(v, evtchn_upcall_pending) )
+                vlapic_set_irq(vlapic, v->arch.hvm.evtchn_upcall_vector, 0);
         }
         break;
 

