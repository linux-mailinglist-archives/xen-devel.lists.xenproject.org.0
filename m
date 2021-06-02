Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38321398D41
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 16:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136055.252449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loS0A-0005To-S4; Wed, 02 Jun 2021 14:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136055.252449; Wed, 02 Jun 2021 14:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loS0A-0005Ql-OS; Wed, 02 Jun 2021 14:37:46 +0000
Received: by outflank-mailman (input) for mailman id 136055;
 Wed, 02 Jun 2021 14:37:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1loS09-0005Qf-84
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 14:37:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06467280-956e-4f16-8cbf-a24b7b021e5b;
 Wed, 02 Jun 2021 14:37:44 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-cC4GcNaMMY2gmWxJIxX9bw-1; Wed, 02 Jun 2021 16:37:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Wed, 2 Jun
 2021 14:37:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 14:37:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:102:b7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 14:37:39 +0000
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
X-Inumbo-ID: 06467280-956e-4f16-8cbf-a24b7b021e5b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622644663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Op0EG6H/pxKguEBh5YGLdaL85pglCTLCDsjf1WPZfrM=;
	b=SyRck841TFi/g5Y9WVTgkrr95YD98mwZUzRbQFZIgNfyAR/Q/aFMtGFzzhw92hS4K0PJAW
	Aomu2t2NCtm0Kh/CksNI/tnMFZhNO/DQRIej4O0Ea1DUSf1Eimpi4bpb+uXwrF5VJttRYC
	gw3O9iTFwYZXvxJTRWP4bkuJSlsE3wI=
X-MC-Unique: cC4GcNaMMY2gmWxJIxX9bw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTBBdDpkZrS2flw96OEK4mFacDj/zLTCvdz+nt9j4x5cQVJHim3Ua8Zz9nQi5RdHzmiGHmglolySjRIH9K4dShB7rCpg+Fg9Etyr/3hiRJkWdDSgQop5xhs3FvEGsUTd0xFwNrOGJMJSeUejV5HXmd1eNkkN84AWiMOdzKMgOLgHVmVGdLxc5agSkffbaTJei0zscli0/HsNdLjk7CkOBsqVo7a4X8z/eWYS1Fyct28rsYy3xH/6tHhq2KYc4bo4rFj01VlP5SGtzxsc2rz/Oaxzij4iDNgPHp7gT4quWHiRtYOqtAkPazdalHevDO5ZYVOh/aeNDwWn6yyfZ0E21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op0EG6H/pxKguEBh5YGLdaL85pglCTLCDsjf1WPZfrM=;
 b=MPQt4hjwkmgPcc/6CZPI+TrpzGB6SZY21pXCKZEDn+sub6J8BhLu3lh6Bd7Q2LCbzVMIv37Y4OeodxhfetbVBux77yNRCd2HlZQ5psoUIAK5Ox4vjG/ZYPpO9GFW7P9yti1m6vrQdg47L8MneSqyDivZJ0ECGQU2/EG4CC+ozc9gScndsyS2ra+FSXo//XmFm5Ev21SE4fPsavOwPP4Tm5+S3FIoLndHO+8e7kmfs+UcZwd26DhVJwgn8LtVtcQiFMSSTohkJ3Qnoz1ZkZAFMoWoAZzhjEE1fda2moHIiB1MRX/rBBNnTfc3ie96gN1oKVmH02VRSR1PK4KxzYNxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: avoid using _PRE_EFLAGS() in a few cases
Message-ID: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
Date: Wed, 2 Jun 2021 16:37:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f47e68-70bc-4d66-68a9-08d925d3f8e5
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270132CB2EDCD2F60B38997EB33D9@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+4qNND/S+0XErO6cIM67XmqGRQrrQQ0jkde87iYd8OzOmi6/uyBu7s+Wfq5HdOiJoyYflDy1KRRsVjAjWzq21881l9fBZDPvjsSMpGJ4hXIHgCpIq8eJTNNE0qOvAHrDcenm6rqjNvChlRPSrnGzrK8DR66YJY/H6Dh5+LgXgr9oK+NPKpD9aIoI2HPOg6rPZUmd9r+7IYliJ65vsz+UFq3K7mzJuMbzucapoR6XE/BFRxLbst4Is5P/lNKAziTXq0WoeiYJsKVvgg5QOh7DHFiaFY0pRAAKNmh+KuEiBTrHDKgJZAu0WW7u8O53kmXoM4FV7GzvemQ8683EdYVWP0r0iD1906l5+a1lA/1LDxdDYMOOWsWRstBvHe+iMdOsENX6iOF4XExJCz1IMaGL3Mp6/bSRKSpDbvIrRVrKnA5/c1w3Sf1IXOpIGCDlJn+yFrrK7Kd+28yUDK5P3zxkHAP0a4aIU+4pR4hKlOUCQEGlaQnkUpkbPHRWMP0A45ukWIq0AFnP+EwltxF5gHidska11opkRCcXP9jRzAvM9fuNvf3OtNeHs5PLz9ErFt6RuhW5agS21UGgrCWvQk6Tcv4rVTeA357LpL4/gsEyJ1g/bDzRXWY+DbRrOGxPj0o5GeqeMkTDRUDg+LKSZZtvp4NB6pLXJilovnW0ip8LseyPS0K9NzLGId5+Vw6B1/MU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(396003)(39860400002)(346002)(26005)(36756003)(66476007)(5660300002)(31686004)(8676002)(86362001)(38100700002)(83380400001)(66556008)(316002)(16576012)(8936002)(31696002)(478600001)(6916009)(66946007)(4326008)(6486002)(186003)(16526019)(2906002)(2616005)(54906003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?QURpNWlvWS8xYlNYR2tFMnBycWVHVTAvYm1MT3d3ZWlwM2JwZnNSN1Q2VzhH?=
 =?utf-8?B?enl3dHI3WEVPY2NWWHhlSFZqUzBGY1BUTVgrdGFobkE0NTNyQy9MclB5M2hP?=
 =?utf-8?B?OVE0aURVVlM4UWRpZ3JkR2wrMEhsc2hOS01YZm81T3V1cHUyTElSLzg4R29G?=
 =?utf-8?B?TDdxUDd1c0JsOXpveFYrb0g2NTZFUXNZelBQdXVON1cvZmdXUEdzNkhYc2VH?=
 =?utf-8?B?M3NpZmdydHM0c0Q2ZFZkNjg0dS9HYnhKTjFUMDhSeE4zLzFOMXo4SWtFVHkx?=
 =?utf-8?B?WmtRS3FUUFk0cjUvOG9DQ25FcGM1ckg4MEs5T2szZFY2TnpaTi9MS00zZkZK?=
 =?utf-8?B?WlVoYkE5NGNFWTFBcEdCak81bjUyQ2YzTEZaQzh5YWZwVzVzT08xcUxRMW9v?=
 =?utf-8?B?QkFOOWNYVm9LYUppdTFJU1cxV2wvZzZYSmtIWkVsQ0Y2alZHbXJCM0hFME40?=
 =?utf-8?B?dDhFNERJM3E2NUxLS1VIL2V0QXVGWlJVZmtyZFBLUmlMSVVXQUFWTGc4OCt4?=
 =?utf-8?B?V2svV0lZdHB2eDFjMS81UkJDM2cya2IvVUpCUENadC9DT1g0TDJ2L090djhF?=
 =?utf-8?B?Uk1hVm1BYUllamhsSWpZcEp0T3pJcTBYVEFXUTZ1V2lVUWVvV1FodlV4aUxl?=
 =?utf-8?B?NWhwRENCMGJVVUxjS3IySTBOOENMd1lBNUprT2dQN2QrMnozMVkySmhUVGl6?=
 =?utf-8?B?TXZTK3grQnVGZnkrMlVMR0NPOFpoRHRSS0pwb0Vwb1NKcmZOc0RoSmlQMnZv?=
 =?utf-8?B?M1VtOVVLV3QyQm1VRXZhM1htTU9WdGJnU2VDMlRjbmVzOGVIc1BLelJ5MmFJ?=
 =?utf-8?B?WTBZOU9vb1FSU2R5NEhKV2cwRnJ4THhpMTI3N1REOXE0RE9qelBRNVgxbm50?=
 =?utf-8?B?QnBEZ2xFVFdTcDV2ek5yS2lzcUxFd3E5SkxGRlJIcTRHN0pyMFFnVURaaHU0?=
 =?utf-8?B?RGRjNitINVhMU1NhaklFT0RoM1kzMkxVS3ZTbUxaNmpoc21kZi9iYi8xaW0z?=
 =?utf-8?B?M01Yc1pjaXJhSnN6dkFTalFNN3g3cWp6MTU5cnZDN0dVL0JzOWZyZEhXaUdV?=
 =?utf-8?B?dmFjVmZkK1F0UG5saGhPRCtoZWZhc2pVTFFaUFMvcmQ1UGkvY1BFR1B5U3o1?=
 =?utf-8?B?QkdJcnZlMGNmcjZHemVQYUhEbzY3NHVza0dySEJGL25VcFpPNTIrdG56R2Jj?=
 =?utf-8?B?L01CaTI5RWRwc0JETmp6R3lmUkRiSUlZaWZVRVAwRVgya3BwTlc2VzE0L0Y3?=
 =?utf-8?B?UDM5UzdEQzQ5cVhWdWZUU1FMbkQvS0JlUC94Y2cvSTRIS1k2eGhWcDg0YkYv?=
 =?utf-8?B?OG9VUWorR1VxQXI2cFRpSDc2ZkFWRWp1VXZ1OUwzSmREcWdzSE1iQ25pWkVt?=
 =?utf-8?B?ZkVtRllnTktPWGV5TmoxakZ3QlNlTGpDaURmcUZHcGRGRTE1Wk02WmZ3NDJT?=
 =?utf-8?B?Y05NZ3MzQis0V3VZWEFyZCs5Y0ZWMG5QczZ6ZXFsWHNnUHJuOHpZQ0E3cU1y?=
 =?utf-8?B?Q2JyWjB1SFNNWFdNVmE1Nk94NEh6R1lHY2lHL0RsOWt0VTZaeGZiMUtjdmww?=
 =?utf-8?B?ZFJaRVk5ZmNJRmpJYzRuQk9pWk1ZcEVGSFA0NkxkbHEybDkzMWl6UGF2eTNj?=
 =?utf-8?B?VjJCU2E1eVJuRzlpbm81Uy9ycHA3UmdBMC8va05VRXhSYlY1UFljWnMvQzJl?=
 =?utf-8?B?K3pCOVJuM2Nnb1Q0RWE2ZWV4cjlhbDBKRHoyWnFNSmFoTnMydXc0eTRZL3FO?=
 =?utf-8?Q?ZQs9eqLU8SkzLn+ynqXcV/N7WX8xLnSbBM8Ozvo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f47e68-70bc-4d66-68a9-08d925d3f8e5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:37:39.5805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFviBlCCctwev3AJdKit4Yj1+uQ2sA7ELIEbTuVht9RTYZBP9ADZRpecepiVO9TidFmnMgr54WsE++5GsSFAGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

The macro expanding to quite a few insns, replace its use by simply
clearing the status flags when the to be executed insn doesn't depend
on their initial state, in cases where this is easily possible. (There
are more cases where the uses are hidden inside macros, and where some
of the users of the macros want guest flags put in place before running
the insn, i.e. the macros can't be updated as easily.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6863,7 +6863,8 @@ x86_emulate(
         }
         opc[2] = 0xc3;
 
-        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
+        _regs.eflags &= ~EFLAGS_MASK;
+        invoke_stub("",
                     _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
                     [eflags] "+g" (_regs.eflags),
                     [tmp] "=&r" (dummy), "+m" (*mmvalp)
@@ -8111,7 +8112,8 @@ x86_emulate(
         opc[2] = 0xc3;
 
         copy_VEX(opc, vex);
-        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
+        _regs.eflags &= ~EFLAGS_MASK;
+        invoke_stub("",
                     _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
                     [eflags] "+g" (_regs.eflags),
                     "=a" (dst.val), [tmp] "=&r" (dummy)
@@ -11698,13 +11700,14 @@ int x86_emul_rmw(
         break;
 
     case rmw_xadd:
+        *eflags &= ~EFLAGS_MASK;
         switch ( state->op_bytes )
         {
             unsigned long dummy;
 
 #define XADD(sz, cst, mod) \
         case sz: \
-            asm ( _PRE_EFLAGS("[efl]", "[msk]", "[tmp]") \
+            asm ( "" \
                   COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
                   _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
                   : [reg] "+" #cst (state->ea.val), \


