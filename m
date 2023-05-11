Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29CF6FF0B3
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533283.829813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4pF-00041j-6r; Thu, 11 May 2023 11:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533283.829813; Thu, 11 May 2023 11:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4pF-0003zj-3g; Thu, 11 May 2023 11:51:13 +0000
Received: by outflank-mailman (input) for mailman id 533283;
 Thu, 11 May 2023 11:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px4pD-0003SF-Km
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:51:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e667cac-eff2-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 13:51:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 11:51:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 11:51:07 +0000
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
X-Inumbo-ID: 1e667cac-eff2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFO2N8g1N3L29rBDP2FEWSuT/Q78PjkkozzTuD5SiDey7pTKa72YA+SK6ycMHjYhpordTr0R+M8yMphxywIvB4qb4KL3+B2y8bfJLQ08mbBEZiGJggn3zt6PcIjIHKHijfERtDJZ80OqhBkGeOnFh35ABgF60VoDBhwxDaM13qO4ky80F3pxdsAn+G4bgGZA+30qidPKmi9CdnhUxz+k3VdoeKglNXbTSk6vS/YE8zCNbKC8flUCPNlqczQFNe+3MtHIdWvbiCkVUrC3OH5Y0vA5Ujlmjzjicqya7ML8h+92zvZVOqG5R01BbazrnMtUYXr7wkqPj4JkrDooiJ7pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpgonQYUpEAl3AwPVAhrNHwGHxi1zyVswuSPi4ojvwU=;
 b=h/yOGzGTBVQQqe+IE1kPMMHvttNfp105yaRhV0UJ+ZxJ7MFEFru6THmhTJii9XMji2OuJiWmLbQIDpQUzPVy2xofFd35iYjjeYpxjjrxouMvKnltNe9DCVGdBMrl0i5rxrdrghryhsutNzQXG3JN4H4qHNMkJATHog3q952RksaZAJ6LAUe8Gg1ip5/8J48DRaDaRyLTaXW8UnBkrdGbQVahHV9a2Asklek3omrbvvfjVDLaFNgLOLS4l7eR15urUsC6qlvlgmhibr5hkJfVQYyy19+PWv078PPUgWGb5nB//Ti1W2KGuT1EoA4qYEXRrWmljTMpZCZ6M3HDxhCQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpgonQYUpEAl3AwPVAhrNHwGHxi1zyVswuSPi4ojvwU=;
 b=D4oukvQKTxQ8eXVAfD3w4TL8nbZuX+FKpkQxNWQfmz/W9ZEzvrgzWz0HjhIL7iKTMvrkMSTjjk+y1MBVcaDspIIu/MT0vnlmQdoutIg+cYON2Hbo3Rto2VvU+1G0d1l2JugMVF7ayWYoyFVddLYbPCAhnDGO8Abk6p9J1/6uGTQxtoBVTUWOY3nAm0/FLcoZ3lXRaNYRX12muTiPrURfwCyd5z4+hepiNS9mWZb7MqHHSIer6p0tvaw0fVS0Sp5YcvRxsjGGi3HhuxvpgD+c4qJ3csQjd6nNNANaTyK49keO8eE4H99G7H7cyS2vOtJzyNdoR554ozZC3JalmNrcUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39903e79-af15-9017-e470-65124bd60847@suse.com>
Date: Thu, 11 May 2023 13:51:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vRTC: minor adjustment to reads from index port
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0b0b17-c3d9-4f3d-9b4e-08db521601d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kpvtAOjYy/gARNh01M5gdl+u/L26WXcIcDmo44RtGWuPr9WDhiBjhPS/Ao2g4vupt72ey7k/DD8oraFIUH9UhZ3mQ38EM62tjbnLjPmJlDZNGHnC5sHzVPFnXmOxhOcrQUvoYNIGRRCRIMi2BKpS9lzui4IpOBXHeDPMc7Ms/8r7BGIvZvBjlRp2twQhDKHe+O2nQALAokwBd8sbXN/3TD6Y3kioW36GO13j82hxLrKEm1HCRFBxvG0g211tkOqcnE9LnxnFKZPiS8d7cRc5B8lkFTBx/0Xd6Pa73ScB/AWUpJyA/X9IxkObB0xWiG+U4sIICIBrWe364N5JkHLlWOTbVwcJCallWb7vy8rh18MpwjEcUe8KXCEkILjJRaE/MHJjNZPu8lfcC4ZbpBHhdwPADP+RXCz6ooHDowRENpCe2LHGVpn9pQLnaR2EGZ6JcsiAs36+MyLUECARR+fzEl8iKcYrs4zFmg2WDqmd/HQizb6Msv0KD1U5EGqszku+mNRId3xjSQ1F7VsOIM4I6KX+aLropvIvLSGmjuKgWGetDsA4NVIU1ar1WXcB+oNPxEUyz2TaJzkeIYv4QMUzKd7wRdFFN5U7o5ZkabOILaotdr0gy/QqIQ+ZwfSKFuDzzCWD0ny1cyMNiTUc2vV05w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(66476007)(66556008)(316002)(5660300002)(66946007)(4326008)(6916009)(31686004)(54906003)(41300700001)(83380400001)(6486002)(38100700002)(8936002)(2616005)(8676002)(6512007)(26005)(186003)(6506007)(478600001)(2906002)(36756003)(4744005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0hxSGFvUDFCUmlwMU94czYyeUZBUVdBU0wzbVZzbkxZc21vRXlGdVU2SkNh?=
 =?utf-8?B?dXJia1B3WmVVK3hjY3J5dHBIYldJaDF1a0RNNUcwOXFUS3Z0TUloZGR6TWIr?=
 =?utf-8?B?Sk5VTDlmQ3gzbHlnWWxMb01Nak9WcFVHWjNyYk5rNmFQdm5NTkFHdHhPTXRG?=
 =?utf-8?B?SUtBdHdOWWFSd3A2ZWlpQy8yd2lCbE5DeG4xVzltenlVZEFRRzBIMll5QzY0?=
 =?utf-8?B?a3h6NW5sSkkyVHFVMWxsV3NXWEU5SlZLMmplTzI1YUN3NlBVR0RPeTFrV0N6?=
 =?utf-8?B?Q1MzOXhOUC9KTnJOQjU2TFlTcTVYdHVOQVBPVzV3RnJJdHBLNndrc0g2ZzEx?=
 =?utf-8?B?Mmc2eDBRNTgwSCtEeUJIMSttVWpJL3NtLzd1UnlIZUg1eWlHeVBwZ3k2c2kx?=
 =?utf-8?B?NDI2dXdnTDFhL0pwQUJjdTErbzlCVEU1enRpRDFGUG1PdUVPWmZTZE1QOTB6?=
 =?utf-8?B?VEcySWIrOGZEbnc3S1R0VE5SZmhHVnM4VFc4bkUybmhVcEtRbGpXT09mSklW?=
 =?utf-8?B?MUZxNHpWRVA3eFl3eXhhTTlHVnl1WDRFc3owVzZVWHFwZ1NTSmY4L3dJdk1t?=
 =?utf-8?B?T2dReFIvNUtTVmU1bmg2cnNqSUIzaUgxMkVoSW1aTkwwMFE1NlhETWhwWmNY?=
 =?utf-8?B?c0xoUmtJaFBBZzRpblFVUjBCWHJpRXpUQlNsUDR3ZTFBdnZ4SHR5MXpnQ0pE?=
 =?utf-8?B?ZEFYRUE1b3BDUmd0TUo5R3RVQW8zeXRiQkZaNktjeEVJbTQ3U2E0c2hpL3dq?=
 =?utf-8?B?RkJFSGpPazY0S1p1c2hvVWpiU2hBSGx4L0V5S2o0YzY5dmc5RHRkdGpmcTY3?=
 =?utf-8?B?SXphRDV5VjlaMEhSUHJaRmtqQ0xveHQ5ZUd4N1p6c3cyZ0MrYVhlcS9TZjVt?=
 =?utf-8?B?cFFuT2oybHJHRGM4UFZWKzd1QzhzQVFwRjBNN0lkb0V2dnlIQjMzdEdieUFG?=
 =?utf-8?B?YkI5cEJwTGpoVWZ3UXRoMWJjd202cGR1WTBudG05em90TGtXK29vbUd5WWlo?=
 =?utf-8?B?Uk5RMHVaSHVIU3FJM2s5WlY3SU52QmhqV3NVN0dEdFN2TGlhM2ZBc2dSOFdN?=
 =?utf-8?B?ZG1oWVU4a3RGOW9NYVorYWtHWGlGRm1tSE9mUHRnREREREJLbDlVN0dEaE01?=
 =?utf-8?B?SzlISThCdlV3d29RLzlmMWsxbS92Uno5U2RNaFJwck5aU2lSRUFPSEdHNmt1?=
 =?utf-8?B?L2Y4RGFpSHZuNHUxY2ducnd1TEp1ckpGQUVDWHBUZm4yMCtyOXcvQ0JXMWo4?=
 =?utf-8?B?TnlsNmhjWjRjek5PcjNyL20wZU0wODI3RkhpcUQ2OVlXbU9WaTBjcmlKUXdz?=
 =?utf-8?B?TVZ5emthVDIxVlAva052dzk0ZWhBZDNSQ2RqeDlXQ0cvenFzYXpnRDZ6MlVi?=
 =?utf-8?B?VGZ0dXFCRXFULzdBUkNOeitQVURUaHVkWEtWcmNFU0txaUl3czFscWlacWJW?=
 =?utf-8?B?UFpDZ0plZHZ3RldNNkJpZTBtUWl0cVJSa2JZQTRBdFBEMnc3ZnBOQlBycVBz?=
 =?utf-8?B?UnUwVlRybE80NEpWMUMxOXZBb3ZXazVJSGJzeDVnNWxXZEpxNFJpZjQxbHc5?=
 =?utf-8?B?RXRodkEvc2dlNmdoRjd5OTNIZ0d3QWliTEVvRWhlTzQyYStYVkxuMlhtLyth?=
 =?utf-8?B?RituN1lTazJ2QnAvUlJuWlVQYmxDSzFqL3RmR3pmTFdqRllIclBsdHprN2dD?=
 =?utf-8?B?QXF0TlV6VE9nc2tOemJVbm1qeUlMZEVrQU5ZZEpycGk2V01jVEZzWlF0eU1T?=
 =?utf-8?B?ejVFMVcyNnVmSHNvak1iV1NsbTg3VFBTL0JHdm9sOEorbHV5MEtkd0ZEY1Fn?=
 =?utf-8?B?WmhKWWVrZVBCb1pGWXhtbWdVOXVlU00raXFEVmFmYk4yU0U0ZWVJVjJYcjhB?=
 =?utf-8?B?L00xSVBEV0xodDVVQnQrVnRQdXZ5SUVCK0tIYjJVV3Nrbk56SWNYc2h2dFlh?=
 =?utf-8?B?dm16dEU0ZTQ4YU5iK2tIbXdNai9STVlPR1VQQ2NuUno1ZGhlTWJzS0MyTXN2?=
 =?utf-8?B?VVM2S0N6T2hDUnUrUEgvUmZtK1JWV21GYUxmQk1OdndVUFFwSnk3ZlVxa0w1?=
 =?utf-8?B?UjdsVlRxSGZud09GdGY5YVJlckM1bXpsekkyMGZtVjdnTFlpSFQvL2Q3Q1Qv?=
 =?utf-8?Q?BQCTmO5iyTYAf1EQM8oHrybKq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0b0b17-c3d9-4f3d-9b4e-08db521601d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:51:07.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsbEhomY/kKCtwP2YeMvsr+EaevzlClPaJ6dIFeHobJ+3FuFUoBi1PNDITIASIouVDTMcN8dbZmwGreOu/DLQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9071

Whether to handle this shouldn't depend on the present value of the
index register. Since the handling is done outside of the lock anyway,
pull it out into the sole caller and drop the no longer needed function
parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -645,14 +645,11 @@ static int update_in_progress(RTCState *
     return 0;
 }
 
-static uint32_t rtc_ioport_read(RTCState *s, uint32_t addr)
+static uint32_t rtc_ioport_read(RTCState *s)
 {
     int ret;
     struct domain *d = vrtc_domain(s);
 
-    if ( (addr & 1) == 0 )
-        return 0xff;
-
     spin_lock(&s->lock);
 
     switch ( s->hw.cmos_index )
@@ -714,9 +711,14 @@ static int cf_check handle_rtc_io(
         if ( rtc_ioport_write(vrtc, port, (uint8_t)*val) )
             return X86EMUL_OKAY;
     }
+    else if ( !(port & 1) )
+    {
+        *val = 0xff;
+        return X86EMUL_OKAY;
+    }
     else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE )
     {
-        *val = rtc_ioport_read(vrtc, port);
+        *val = rtc_ioport_read(vrtc);
         return X86EMUL_OKAY;
     }
 

