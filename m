Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50587972B8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597326.931546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeEoZ-0001W7-PC; Thu, 07 Sep 2023 13:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597326.931546; Thu, 07 Sep 2023 13:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeEoZ-0001TT-MN; Thu, 07 Sep 2023 13:12:55 +0000
Received: by outflank-mailman (input) for mailman id 597326;
 Thu, 07 Sep 2023 13:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeEoY-0001TN-V0
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:12:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40dd283f-4d80-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 15:12:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7734.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 13:12:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:12:51 +0000
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
X-Inumbo-ID: 40dd283f-4d80-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8FSipE0OeNY7i0I8sLtzBrXvSC9OwUKX90y45hS7BzyVkPZazop+Iy/2mnqFDMxzzYmEzxAjJJsXLjF6h/aWZYCB1cRmc0PQNbMbF8kxIFW1U3ADCiVgEfgukEZ75KswQYnJZrfHpBBCYiIbR07bH37YNC+zebklKV20Fg+Naf7KJjpyyMmslq0ztTuRlq+iXi18L4vq9GSiIU4VhbEuBWOtD9ZcnTsyvVVKWVnQ6lcnw0y3+43Iv9iA3qpn4lP8iI5mDyFK3OLr0FL9ypRLNLDcP/Mm7Ai0XaekKH5GE4c4Pak0DmzStONy6lrs9WokY5zPC670fdA9P3m7GyUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzY0BtiwbILLQZ4b4TJ6wOWk6JKxQEtwdjfMMMHJBZM=;
 b=VwkXLNUu4KM2OLgabj7EdTPrP3JCDie7pLyybmh+DUjajrjyrm9aeQJo41iPmkUQftEhwfSDyeBoz2TVOQzWGAFbIOXJL0dK9MDUTc6uGc2P7AvlBH7qqPw6r7ewZlCqcuAH7DzLbK0XLFexkW9IjDUDgTFG+94xp9G6Qx8Y74rjq5mpDYzJD2feRrb1CWpD8sJQkng54cQiaE52icPy0ydsSnNRciRF9rSP7DaxZ4W1ey6g8AizWAQRSGB2tzNUYCwQ6knIwzHaaufNo7+jazIvBhPF2EXNEvydE3qdlSpQVIqtliftrJ0Ja8hUXlXk+fgPT9CQvAgTVM13Cp+TMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzY0BtiwbILLQZ4b4TJ6wOWk6JKxQEtwdjfMMMHJBZM=;
 b=Gq54lh1K42m2i1I5v911x14pPOsQhgtYRs8muPUJ5YXZREIcTN1XgigjRpEjFgbv0ymsWyzykF36zW3B+5NdsjkFF5gpbN1nRNlMJKt71+aLGKVi3UDKAOaww3mlDBBCCYYNccgbHhTTX8D2EvVbZjyY4MfpAqtnzBQgsuI4CO/nKeBzQZSrgfoQDZmY/45HXp01KH21XtL3mMi56MG6kYWe2cKI61bT5+82q0b2kizNCk/ogZZPmsH7IYJJy1bvYX/VrgVOaRFmxSeFI+k+QIqa3hHMOrtQoBujgd96Xbx4QDCivvbIoTYi0KhMGLFAvT36j8p45tq8JBnh+qIzCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a0e3d8e-a7a8-abc4-6a34-739f37e90622@suse.com>
Date: Thu, 7 Sep 2023 15:12:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/HVM: adjust hvm_interrupt_blocked()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3a9326-7171-4250-ced4-08dbafa423e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8KvLJ/43KkrHwrp91gREoZPkFYHTdMY7JVBLlI+QjOo+rNBdrFtAjimu0lHtV0sAudWjo9/im90JMzHOCuSv/COa2EWlVt9SVnPHt/MgrdehGJvY2UX6leiDtbl+1IOmaP+f2P51efE2qiH7UzuRJ2Hgq8pb8QwfHtdCvJ9jPtQeeNm/lN8j5Kw5wJgFs9+IWxr7UP/rPBEVlvjZVrlhJw3AolZ22UwPGMSW6LrkGYL75coc7sLo0Pu4+GgATHamGJBSh6ATSiyjA3ZyemEiwdbZsXSgfAi3Gnp5P2lTKiATmDZaZxvgwnTnBirddYHZ3twpjL3ss8F2NUxn3/JVTcF3SOgM0THXmBbyCPiMafRFIA+iheWUJZ8ZeNc+qbrRHBPgdpS8qNlklF8IQp/AO/uOg2/+qDMlJ2mweT93/maWK1EY5bVMRdHsb1J9b6W1za3FjinfdDfwBgNSdMjVA7VNYdOwd6j9bJT3sXEzjnCiAJ4T+WogC6r4LIkdrJZTLbR8uUUos19z2qM+1rwiUZakYpHu7J8TeX5N0IwNgpNUv/HhStWyotDeb12+f9ndZniQK4i9pGfASwzvIcM1BVpv3d0E2yLlkzx0yr6LDDVBgnk0SPZ+l8UZvk346Klj3JwoOl99JgO8bwVKMGoUiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(186009)(1800799009)(451199024)(6486002)(6506007)(6666004)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(6916009)(41300700001)(54906003)(66946007)(316002)(66476007)(66556008)(5660300002)(8936002)(8676002)(4326008)(36756003)(31696002)(86362001)(38100700002)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVVNNEZ4VVdtSE9uV3l2ZXVGaWt4dHNpY3BNWVdFczRWeFBUZFdVRWphWmRy?=
 =?utf-8?B?TE5zRGYvVUs5UFgwdHFaRXZYaDNCRjdLbjI2YUkzUTJoNHBXTnJwOGltWTd5?=
 =?utf-8?B?ajZyUndQUEROSHMyUGl6VkRUekhLQjEyUEJXWUNpbW9rY1ptZHltbEFVQWNy?=
 =?utf-8?B?VXFBQmZ6Q1JjSUFqM0hxd3ZBdWhhbFY0cDdMbnIzNURnQTNOcmd0ZTVpRjQz?=
 =?utf-8?B?b1kzMi95UEplOU11QzJIVVZhSGI3ZnNEbDZhZTVGRnJNZGNGT29HS1Y2c2lZ?=
 =?utf-8?B?VEJoOUdxUzFBa3pITDlJWFV4M0tmbFhNYlc0WXRjL2J1NGxYOFY0QmdNSGVP?=
 =?utf-8?B?ZktMY0V0S2dSQktpQnFXWDlxVWQ3RVFEdmlOVFd5RE1sV0h5K3kwK25lZmNl?=
 =?utf-8?B?ZEVabytaN2dVbDRsVjM1RlRMYVluUUk3eGp3YitIckkwbnlmZGtlcGEvaGhu?=
 =?utf-8?B?aitKR25kR0duY3UrWDU3YjlmVXo0YXI0U3hJOFM3SkJkc0hmWDQ0THBSYkpu?=
 =?utf-8?B?VWR5MGdJa2FiRjJibG0rK3pzVEltbFhNZlkxa1pFWkNjaDM2ZjhISWU4RVVE?=
 =?utf-8?B?YVdFcGxPMkVZKzk1TWllcG5oRWhMZFRJZ2pnYW9PQ29iV21YOXpFU0FIRm1I?=
 =?utf-8?B?dXVZRWIyK2RjNzZiR1JXdFI0VlBkR2pZTW1OeFdFWXFxY1ErWDZnc29Scktq?=
 =?utf-8?B?Nm1lYTNtVUVRU0w5b1BuT2xEUzNxT1lNZG9BcDlBbDlmbHpGOGNMTjd6UWZL?=
 =?utf-8?B?SXJiT2NMV0tvMVhRb2V1Y1BLOXg4VERiUmtzU0F0YnBGZkVWWWQySmQrVnQ2?=
 =?utf-8?B?bS8zVzlGbmU4QWdrYk9PdXZXbDdGWjBGbEtXVm5rVitFakx3V1FZTlU3ZlJD?=
 =?utf-8?B?RUJIQUF6RzV0eDFFNEdETGhqMWhYWkJQY2FLSjVLOVpPamN2Y3VtdHcxTk4z?=
 =?utf-8?B?SHZLTVhSWmV3YTdkT1d6SHZ4T0tZcmZSN0FVTGJtVitWcnlRK3p2SzZDMnNy?=
 =?utf-8?B?K3RiK0hPUlgwVTlrSDVsZEhHaXYvL0JmTEdBR3AzMy9qMXNUeWoralIzYjY1?=
 =?utf-8?B?V0JvN0VKSTI4eDVUS2FHYkhkZ1d1NjVzaWlFSDZraUM4WlUzajliMnVOSC91?=
 =?utf-8?B?NEcvYW9qaGpUUHg1Z0czdzJ2N0NuRjFkMktZTXpPQStWdzV1eVBYck11Mzl5?=
 =?utf-8?B?SE5qZDBJc0NUZUtXNW9jN3VNQllRVXlMZVk3L01QNTNpVnpQMkg0bHlSN3cz?=
 =?utf-8?B?cFZwaGJqN3FFKzFveURKekpTZTN2eFVvR3Q0NnZidUxxdWV2U2VtcE1jYXBk?=
 =?utf-8?B?ajF5ZzIrcTY2aTZRUHdNWFc2SGVHd1hkOWZBcWtVTmFvTzFVcEdnNEc4RjBQ?=
 =?utf-8?B?OFJ2a0pnV2tVMzJmenkyS1dDdkQrU3JZaWhTdXdBd1hTNmZ4YjU0YVByaTgr?=
 =?utf-8?B?MkdEZW5yWURPL2UzSVdVUU04cWZWbTFuVEhSOGw5cm54cmR1anlnQ1ZqbFBo?=
 =?utf-8?B?aThpamdOdVlYMDl2WEZ6RTdrbEI0NzB5aWJadEZkR3JSNWs2bnU1ZjF4NGZN?=
 =?utf-8?B?N05wM01nZnZFNDVIWUF2bXpnemJVZmQ4QVN1MkI5U3dkRjEwRytkcVFOeWEw?=
 =?utf-8?B?ZXBSSVdOQXora3J2Vng2b1RtSXprQktKMjFRcTh3V0w3V1pXY1NTRE9FckYw?=
 =?utf-8?B?dm9GWm9TWlJQNEVNS3M0R2hMcThSSkJJaER3WHY1dTM0NTk2emVobVlNRDdj?=
 =?utf-8?B?QjhRa1dlVzlsdmM1bEhaUHJqMjB3THowR1N1bVlqT3hieWFydUFHSmRkTDRu?=
 =?utf-8?B?Y2NyUitRc1ZFNmZUNFB1UDl2bzFOM0twSElUb0JVVTJWUVBGNFFzTTBsa0Fa?=
 =?utf-8?B?R0IxZGxTNmFkMVhMZTNEcDFJdjFYbjdpVUdibThuM1RWM3hmU0V1Vy91cUdo?=
 =?utf-8?B?d2J0WnNMcDhWeUl3blpybHIwSUJzVTkxSkREV3hGQXpZVEQxU3B4THE3Mk96?=
 =?utf-8?B?S1VYRFV5UVUvV0t1M1ZKdHVGS3NZT3NCVmNTYUczODh1eWJmNnRPVXlSRWxR?=
 =?utf-8?B?V2FSeHptZ1FJWlVGUTVkY3pRaTJ4K005NFE4THhSSmwxWXUva09YSFM0ZTNU?=
 =?utf-8?Q?7fAIaC4xDYmiHLwCtC+XrtGvN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3a9326-7171-4250-ced4-08dbafa423e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:12:51.6128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q6Tu9Xah/dWt1WbGT2EEYVF+aizvayGbZ47Km+0uQqx4GjgPximHhepKJ9cXzfFTut2Ps/MLC/sF/g1oxeE2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7734

First of all, hvm_intsrc_mce was not considered here at all, yet nothing
blocks #MC (other than an already in-progress #MC, but dealing with this
is not the purpose of this patch).

While nominally STI-shadow only blocks maskable interrupts, but not NMI,
at least Intel offers more leeway: "Nonmaskable interrupts and system-
management interrupts may also be inhibited on the instruction boundary
following such an execution of STI." In case guest kernels might rely on
such behavior, keep the STI check together with the MOV-SS one.

Additionally EFLAGS.IF being clear affects neither #MC nor NMI.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The EFLAGS.IF check may want moving yet further down, i.e. also past the
TPR check. Otoh it may also be okay to keep the original condition, just
after the added MCE conditional. Except for hvm_intblk_tpr, the specific
types returned here aren't really of interest to callers. The special
case in vmx_intr_assist() concering hvm_intblk_tpr looks to prefer to
have the check done last (i.e. all other blocking reasons to be
prefered). For the one in nvmx_intr_intercept() it's not as clear to me,
though.
---
v2: Keep STI and MOV-SS together.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3904,9 +3904,8 @@ enum hvm_intblk hvm_interrupt_blocked(st
             return intr;
     }
 
-    if ( (intack.source != hvm_intsrc_nmi) &&
-         !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
-        return hvm_intblk_rflags_ie;
+    if ( intack.source == hvm_intsrc_mce )
+        return hvm_intblk_none;
 
     intr_shadow = alternative_call(hvm_funcs.get_interrupt_shadow, v);
 
@@ -3917,6 +3916,9 @@ enum hvm_intblk hvm_interrupt_blocked(st
         return ((intr_shadow & HVM_INTR_SHADOW_NMI) ?
                 hvm_intblk_nmi_iret : hvm_intblk_none);
 
+    if ( !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
+        return hvm_intblk_rflags_ie;
+
     if ( intack.source == hvm_intsrc_lapic )
     {
         uint32_t tpr = vlapic_get_reg(vcpu_vlapic(v), APIC_TASKPRI) & 0xF0;

