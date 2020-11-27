Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A106F2C635C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 11:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39143.71935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibH5-0007zh-90; Fri, 27 Nov 2020 10:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39143.71935; Fri, 27 Nov 2020 10:46:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibH5-0007zI-5m; Fri, 27 Nov 2020 10:46:47 +0000
Received: by outflank-mailman (input) for mailman id 39143;
 Fri, 27 Nov 2020 10:46:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Tu=FB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kibH4-0007zD-3N
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 10:46:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 623a9f76-a0ce-434e-9e18-a2f5091dccec;
 Fri, 27 Nov 2020 10:46:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=33Tu=FB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kibH4-0007zD-3N
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 10:46:46 +0000
X-Inumbo-ID: 623a9f76-a0ce-434e-9e18-a2f5091dccec
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 623a9f76-a0ce-434e-9e18-a2f5091dccec;
	Fri, 27 Nov 2020 10:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606474004;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=pl4SLpfK3Jw2b0Ca1apyPoV1WVxy+JeuV676lj8j2NI=;
  b=fhkaSzVkBDaNsoD5dMdM0Sxmk75/6IK4QWk8BmjYyKTRQuenBW+mJVXh
   xohwljeIUK9xHyic1199VZK3T5+9tEYUALaGsHbjipNOkXm+KEtTMOb0z
   r1//Qk6MtGDfFeb5Lf+boVjR3iygEE7WQbrwDxXWVhf+LJxKWfa+R/fvG
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /skHKc2GgQjSi6QkDRPaIMDu9NqM/V3a/uRqgVDXxOWfLsWfWQWYH61nrI2gPb+3Q0QNgy9vqd
 uzNm1P5DLoQGgeLuHPmflOTDnc6wd+qLBBWsVtDdTkyox6RrrAZ86QQ+L9XUvbxkYMpP+o4Rew
 IXYS4bef4SrBZhUuYx6pjn7l1QFKOHfhOog0muPLLe/sad9p9rSwJjGiIbrZlRXPOGpPv7l8+9
 2+coyUkLZg5iJHB4BAHSKEUrYBlqqNE+B1Z2MDi1oyECXlJeyRS9EBSe2UKZEqIJqsO8/0eGra
 xW0=
X-SBRS: None
X-MesageID: 32007806
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; 
   d="scan'208";a="32007806"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+AWDEwllZrtql9NDcXH5jT9gIbhrXFGvgqw7pUsqKPGiP7/mWcx7a1viBWGlWyRbwbOqqO9Hu/fC4txJhCUhFHp6afExNrKxfQYa5HRPwWjzgyHuudo8AzixVU/S7W6HwlgfnH4YsDEC5lxixyAcD+M/jddLDNAwF8JlZQqHip9CTAbrMyju/j7GLQHUp1zZDH5JCI2sHk6MmmAgxI7loagkGQTyUZl8tjEe5YbtSjtt2ydwj9JciFQFuQyQUp15ZYCto9vmpEGyHJ3CePoX0dMA+TcDHGs0GtBnoXkSWAkbprvCYWic/6E2vMXA2PZqZE2XsjPOJ0KvjRUbJfUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMM+/x5/EdEJOyjUC+X75zlJ9+hyk+7CvKHWojtzWqE=;
 b=d1V8P/PHkVyWrG/F5hSYb9m+D7vZuA4MZ6G335V6+1wpvsuHfp6KgPF9/CbqtkTY58TFDfk0MrGOZ0LJ6qDipo7J2WKnRCm9mztAnTLtm98xre7RkiUvG3w3ZJXm2fMXS9KSx28nuysMU8Ct9pInmYfKbAe6mKb49Hzcmc9Qt63+Hm1LBv13jm78SpwJkR04PtvxQRv0chk+WAlQnX3zAxnFKGPHoSdTW1BGBa3R8NjbWM2JKYFTa6qWfwY74n43kVXO38P6YXe0/H8WYUlx68DQzAxF3T0v/xhL2Aaenix35Np8ydtSzixSoG54oVZiqAAyasWtby9+B+a1qjpmFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMM+/x5/EdEJOyjUC+X75zlJ9+hyk+7CvKHWojtzWqE=;
 b=paDeWY4AZGOW2Cjiv41KVoVW65DNW12tNtIi5zk7gT3LRn20UdInrgUTetMdvvY+n4aAQcxY8z47y628VZ5mEZzFP3hLjrVhHUI0ZVmfzi5tjlx0JaLCoAyh8767vhqI6TmoO59BzqxUWMksKOggTMme9ocehG4/X7qTVkD6Vzc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/msr: don't inject #GP when trying to read FEATURE_CONTROL
Date: Fri, 27 Nov 2020 11:46:14 +0100
Message-ID: <20201127104614.71933-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d5dd280-f377-4b21-2bdf-08d892c1b926
X-MS-TrafficTypeDiagnostic: DM6PR03MB5084:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB508451FAB879FD8E8DB519488FF80@DM6PR03MB5084.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCyUFWR02v68GGz7QdyyWsYhIMAq5R7Li7KpoYnlfipZ3ID1Zn6ErV/uv4/R3sAVIgICV+NX+z5XRJbrm8USSwNvB0nVhedqXMeuzCLVSjLpF1wrdHnjh6OTbDSvSOZf/4GFyBiHcHm5kwTi+4WaJDJfkN8tngkbde21+LtBpD03SltzYQYwokAaawrhQF4hQ8esvZ4ULkMnvrs+Z6VY/Rz/g+diqV99m5Mk9Mp044dGo53BTynuxbePkmgRpjub0ObrLNn8dh6bxlmxFo/Jlxe+ri7KlK+1+P2TKZkJB05dbwA+a/unsI065mwYgKhd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(4326008)(2906002)(478600001)(16526019)(5660300002)(83380400001)(2616005)(8936002)(36756003)(956004)(6666004)(86362001)(186003)(316002)(6496006)(54906003)(6486002)(8676002)(1076003)(66476007)(26005)(4744005)(6916009)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vyt5d0JEMWcweEg4em5QaU1IcHdTZ3RiT01PdVg3VVFxSkZObFh1eWpqYUtD?=
 =?utf-8?B?YjQ0amJWT09kVmFxNjFmTmVJV3lvWHJvY3htbmFVRDhkcUpHUk12V0Y5ZDNG?=
 =?utf-8?B?Q1NwN1ZGYVh2M0dlY0V5OUl4ZHBuektXN0NoT1AzMmVqUHozZEtBck5hYUVp?=
 =?utf-8?B?RVI0djNDTlA4NG1MSUlCaUpLVk14RW5NaE9nVjF4dXZENkN6T0N1SWdSK0Nu?=
 =?utf-8?B?MzNxcVNSOUl0UkY1dzE2L0Y0c3ZsVG03d2diSHlyaHlZK0l0RWlFUnZZQ3JW?=
 =?utf-8?B?VVBjWVVqRGwxQmVWNnljZFU3cWhHT3AxNHpIM0xsWmttN1F0TU5uZ0NwMmxO?=
 =?utf-8?B?WktqZ0xzR3VTUy9RODliMktEWGIxM01Sdmp4VDNLOS84Y0lCY2wyM3d2anF1?=
 =?utf-8?B?YVQ1aGRubWFQUVBFQkQ4NEZHMzZqclZDVWVDUlFFSkV1d3p1cHFSNStOQk04?=
 =?utf-8?B?bkJnbjFmYXNmSkMzblFYS2NOUm0rbTN5dzVQYXJQRTFkakJUMmVMT1A3VnlX?=
 =?utf-8?B?a2lxQVNiS2J3eVZlaWR5N2FRMzNTRUwyeTl2WnVxZHNhRy9obk1MK0FYOXRa?=
 =?utf-8?B?OG42ZDUybFY4VXFTVGdINDgzY3psZzBEdk1uUEJTVjY4cFRiMVlzcXRCRFJa?=
 =?utf-8?B?UjRWYS9CMDJNWUxxY1dZTjNGdXdYbXVmbCt5dHcrZHozNHZFMENsWExRbTVp?=
 =?utf-8?B?VHEra1JNUjh3RnFBOGdpaExidkNHb2dSTnF6czkrTFk1SFdwbEpMQ2o1VUNq?=
 =?utf-8?B?VEhRYk9scUthOWlBNjk2ak5rbFNaYmsvRHZlUDlnWU43bHZDK1hndlFSWEYr?=
 =?utf-8?B?TVlyVWRLMExuZnBSdExaUGlGaWREWlNCL2RRb2lZc1FhVGVmaFJObTBLR3dr?=
 =?utf-8?B?WTZkVUgvMEZ5R3M3cWJYeVg4Q2hWZ001Tm5qUkNuSmVwSm5ZVit3WmVsVitE?=
 =?utf-8?B?SnI2eVZ2S2R4dmxQNEJXYVgwTG9aY1EvT2E4SGl0eXJpT29UTDluOXYza0hT?=
 =?utf-8?B?MlF2Lzh0Z05pT2hVVUNyWlN1RHRVQ05xc3haV2xRaUdWdjJ3ZlozU3NmVHVl?=
 =?utf-8?B?eVFWR2VkcDRvU2hmem45akJsOXJlWkhRWUdlVzlNRWhFcEFtMnR0ZzIvejZ4?=
 =?utf-8?B?L0hDN2xnam53ZFpnK2hMb00yazQ5SUgwREhpdHdaMTNXMStjSVliNTB1djUv?=
 =?utf-8?B?WS9BNWh6aU96ZHUrUTFuTHdBSDJtTzJBcmJXcnQrZlRHdXIrV0ZYbXIyRmpR?=
 =?utf-8?B?RWxSbFBxaXh2YTRPV1hTeFQrZVVaSTkwYmFhdXRjdlhzNjBlN2x1SS9LOHYz?=
 =?utf-8?Q?pBcKXLmtDSI1XOr6+0tHGtYEfxJK+rndPe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5dd280-f377-4b21-2bdf-08d892c1b926
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 10:46:40.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChrTmSH/CIFp0mqJtuclXQsBCTHhfXzIQwIbjQC2YgVw06M62ylU39Hl8OhA7cdUsIWrVS51fwJcv6upzmsWhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5084
X-OriginatorOrg: citrix.com

Windows 10 will triple fault if #GP is injected when attempting to
read the FEATURE_CONTROL MSR on Intel or compatible hardware. Fix this
by injecting a #GP only when the vendor doesn't support the MSR, even
if there are no features to expose.

Fixes: 39ab598c50a2 ('x86/pv: allow reading FEATURE_CONTROL MSR')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index be8e363862..38b0a046e1 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -176,7 +176,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     switch ( msr )
     {
     case MSR_IA32_FEATURE_CONTROL:
-        if ( !cp->basic.vmx && !vmce_has_lmce(v) )
+        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
             goto gp_fault;
 
         *val = IA32_FEATURE_CONTROL_LOCK;
-- 
2.29.2


