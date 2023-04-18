Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D993C6E5EDC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 12:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522738.812295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poif8-0006Wj-TU; Tue, 18 Apr 2023 10:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522738.812295; Tue, 18 Apr 2023 10:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poif8-0006Tc-Pz; Tue, 18 Apr 2023 10:34:14 +0000
Received: by outflank-mailman (input) for mailman id 522738;
 Tue, 18 Apr 2023 10:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poif6-0006TW-VC
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 10:34:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c77cee9-ddd4-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 12:34:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 10:33:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 10:33:39 +0000
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
X-Inumbo-ID: 8c77cee9-ddd4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyPKMuuaePvTIe3zjSuAEyroFYPdGjwxQ60Nr8j2m9jXKJ61cdQR+VcXQoEp+vEt9mcGHPrOOZqEsK3wNgnLEhCPvXIKecopAnwtvMyZwX/QQp0HLb+6n1fiGHrOsht3+s0X5d2Nn69T/9n6+tJ+dyY61gzHukyvsqhEZW9dk9dkJH+a2Os6jAzoDJzV193wEwn2YEQbU5x+0rzvCN35KbB3JnqoEgSs6XLkbtG3524VtpwnnaaISfzRevYZXGrwISo9yoGK3SOHGlidhNzdDKFrBfHf3OiXNPACTdZA0Q3crRO6k7wwIpuN4vo+4E8wvTTvOCK3zir8rpvoZnOQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ho7DQTfcrRGgvdcXsi/AG6ZA4fuFOVAjl3n8bd4GpfQ=;
 b=LR+wdnEQpUnMsheH8hFbZ0v0AXE7cirouxPSjwI4yARBNrVuo6o5TbGn3BSaOaVRzkVECQPTb3hh1bYPpUrY9ADCHiw8vHeKMR7KLG3JQeVaTViDzfV4Y+O+Jv0UYAscIvogVgxt2zEZKk60TXT74iRLCWqJPKbuKpqKb2klYKB8Gt6c2BjoDp/FujRxpYIbfwRR6jYAmy1Imu4vjx0xhXjvIJv/kcmlKdc9q0rEaSpBYZ+lgpA7MM5/y34YDTTMZZglPQcXNuO4g+qKbOwhV8+nxdI2ULXsXDaKcLFenjgYCzVx/b+JJcXVh895clB47EtjvWNTwCZ3Ls222C4oIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho7DQTfcrRGgvdcXsi/AG6ZA4fuFOVAjl3n8bd4GpfQ=;
 b=UXt+oNcJQVeyh6MKnboS/axEsI4wucqN2UQhBt7LIReP9tC8RArz+XxAwAnZgWkHIXTzeI6G7Sy2QlDrI7H3LM6gcf3qw03dgS0gXwjrF5W1L/Q6Ei6LpLUaLIQHbY+yA5/p7XSDF+zkwaFgitji6E+KDr3L4EQJIj20gJGMksm/tJ3jRdNO+DuwG5GZjBI2U6v7/CAVCvAm9opw+sPJY/b9J8vVyyH9HoHYjeKR7bEG0YjKXamMLHGZ5VwLdYT6GVf4yBsjpcyjVd9wf0xnbs+aQ/QelJfdX578GnaT8rHcBmVlRAeoVRExr3kkeMm3GhcPMvHyNWAJdvyTLzX+gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c603b4a-c126-edfa-2b64-b114e43606cf@suse.com>
Date: Tue, 18 Apr 2023 12:33:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] SVM: svm_get_insn_len() improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9362:EE_
X-MS-Office365-Filtering-Correlation-Id: a0bc21e4-d893-49b9-4415-08db3ff85ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	56NJwWt4xUhGxo8XGjgJprhT6K54/E1T7HEGRlDEO785/ssEincbbOQvRjOZT0fLfbhF1p+k5bFN6lsiVnge8pyOBlEM2PTv9nh5IMQiX9d7wh9x89vGVc6EvBQtdz7K12QliLmE+5njQoR0x3u6+283DJQH8k8lu5ixRpdZYnLDiHI1mnGA21dZRf2wDvK0i1pS4bYqPNPv7Sb8Vu3XmbsOdOhCwR7m0mjQaCda+GBV70QFfIaV3VsN09lya07RUKlBmXryh8qhq8+6FxptaTx06MEJ00vN25vqHElMJVwkrT5yuu1JIR58XheJ//TBD61DYNmS6TNflTWBp5SNboeAkpNkWS7n2Pm0nlOes9k7vajT4pN5aCoGuPXnT4KlaIATRYNBpEFMdtQWjMo02E7cCARe94WauTImAgu5qg3CCOpCDfcknSM0cy7Koge/K+vri1uw1YjthN+HBG2YJmF+xgTca8aGI7iFxAMAMqOhKhoFnb5NXmOKBumtTv753fMhcypn+eKIbOsJJ7Zk6bpsvdtaed0TGy2k25/D8Sq2j+vQ0emLuDzBtapLZimDlNG3RYk3+ennRedncxCP2ZpRN5aQWlj3TjP25SaZ5+J1H84+5xlGNpIseLUNcTY637gBCC25a7wbQSqUZWuHXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(5660300002)(6486002)(6506007)(26005)(4326008)(2616005)(83380400001)(478600001)(186003)(6512007)(38100700002)(66476007)(316002)(36756003)(66556008)(41300700001)(6916009)(66946007)(8676002)(8936002)(31696002)(86362001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdmang2TitCOWE3Mmh1WGdCeE1JdzRDVHNkOUxXSUV2Q0VhdGFkZVhGSEhl?=
 =?utf-8?B?UzJjYmZMS1JiWmMwMnFKdWZhTnRoWTA5WDJHUWk1Mk4zNGM5WE5OaXRxUkJH?=
 =?utf-8?B?eWNmcHA0QXJjY3VOTU9VT1NPWHBmWXVsRG4yWjRTekI1emVkR1RSa0NQMUJQ?=
 =?utf-8?B?MUJDSXd0WUtjTHg0ZGhUTWNIeHJobE03OTFoNHpVVVlWV1hMamFSR0o3L3FH?=
 =?utf-8?B?czl4RXg0bWRvcEJSMGE3dXU5WGJUS01PVm1KT1BhN0lWa1JYZ0N4ek9ZOEJX?=
 =?utf-8?B?QTVtQTBxUVJHY1NlR3IvWlpOQWtvb014aWdnRDRrUHlCdFVjV2t4TTZlYm94?=
 =?utf-8?B?dmVjYThhQVBYeW90VklwTCtPaUFxekVtbmZXN29QTXVZQ3BXd2V3M1gzOUNC?=
 =?utf-8?B?NllxdjBpUkFzYlV2NVZqc2Z5a2RmUW1JendmbHNBdDUxVjdQZUk0UTl1UjFG?=
 =?utf-8?B?eVd1RkI4N1k2RW1IcW5nUUkzc0JuMzZLanFMT3dTK01YUHpqcTBQWkhJeHI2?=
 =?utf-8?B?Q0d2MGNXUWdPVXFWalNKYk81SSsyalB3eTZVTVdrbzNlczFUUXQxZjZMeUNr?=
 =?utf-8?B?ZWt6aFdjc2RQdXJZRkV6TTF6TWFoVWx5U1FMalVub2N4ZXFMcjc0MlFWYUI4?=
 =?utf-8?B?QUxuNEkzRC9WNyt3M1VPdDl3YkN4YitPZS8rWS9uZVFHL0lTWHkrK2hZb2xT?=
 =?utf-8?B?ZVBEa2tOMjVJdnNsREZOaHczUkY1bklTeTlOM2FaczZjSEY4SnFzMUQ4T0Y4?=
 =?utf-8?B?OUxjTkN6QlNyNExDTFE2UXFDNXA5dHZUcDljU1V4azE4c1pwRkxwU1h2QTJK?=
 =?utf-8?B?c0p4d2Y4NVRkZDZDcUhiODBET2JseGlmSEE5Sy95bHBpcEV5R3c0dHFaSHV3?=
 =?utf-8?B?WTMyVkZ1UVY0Y29vQjNGV0F2ZFUrTDQ0Y29HOG9WMUk1YlVnMmdmTDVIVHN4?=
 =?utf-8?B?NkhNWk80aDQ5L0x3ZGhlaTIwdHZLclliN09JalBZSXJFTk5FTjE2WFBqUWUw?=
 =?utf-8?B?L2F1OXdvNnpLWG95RVJzYll3ck9wSWZTQ3hMZ3dLL2dXMlI5SGd4amY4OGxo?=
 =?utf-8?B?YzI4b2xSOUxjbDYweVl4c0duV2JMV1BoTzlFQXRIVzBVd3N4VlI4ejZ6Z0ZI?=
 =?utf-8?B?YzYvYVhNVWg0S2NzVGlBQjlIVDVOU05tc0ZsRXBlYklrM29oTU9MbFVFV2hF?=
 =?utf-8?B?eks0T2cwUW13SUxSLzZsdWJYVWpTNnBZc2YybkwreWtTMGpSTENTZlF3OVJm?=
 =?utf-8?B?bE9JZHRXKy9Sc2pEMnVBVWRuc0VuTU9wY2RsbXdyZENVVFdZcVRuSW9lKzVG?=
 =?utf-8?B?bVVtMUE2bkpSMVExQ2dndkZ3MGtrRno0aVo3WnpoR3hKUnVYcTB0WmpZQnVS?=
 =?utf-8?B?cXRLSXZHM1Z4Y0xtQ3Z1dm5NZ1kzeERScm5IRnFHSG5XN2VZUVJYeWo5UCtl?=
 =?utf-8?B?VnVIeVdoemV0Yi9aVm5OMVR5S1FEaVdsZElnRTJ4NXI0VXQ2OWdHMFhqbE53?=
 =?utf-8?B?WDVRcWlINjQyVFdhcUlvRXRFOXBZMDF3NnRob0tiLzc5NEp6dElVZVhEM3hR?=
 =?utf-8?B?M29HTERvVmdlNWZicTFaVDNUU1VyR2crdTc3SHdxMXNwR2J1aWVpSzU0MmVr?=
 =?utf-8?B?enQ4KzU2ZVlWTytrVXdDZmUzN3RtaVljNzJrYUJlTXZ1N2lTS2JRVHNLOEdt?=
 =?utf-8?B?M1lHNkJia2ZxVTNYTGN2RDFUSTlwWlkza2RlMUFXNktGMFVpSFNZR3pJY05o?=
 =?utf-8?B?Q2R1SFRIWlpSUG9qT2tuaENJVlVXQ0dpL21OTVhwYXoxL3VndWZ2dHpQMkZw?=
 =?utf-8?B?a3Jtci9YNk9zOWNLYkxJWDIrMTh0dnl1YmVIWDlacjBlSW92T2UzN05wSTI2?=
 =?utf-8?B?WjFSSi8zTzZaelVpN0NhRENSUGZReDZmNVhKdDliVi9veDkxWk1iYjZRWnpv?=
 =?utf-8?B?Q0NXYmtGT3I4MC96YkhOdDErUjM4ZldtbXVhREhHZEFhU3N3UDFyZ3FzNDVj?=
 =?utf-8?B?dE5HY2YyYWdZWm9XR2NqRUkwV3c0ZGlwQzlIZVMvYlNackNST2hIbEowUDRz?=
 =?utf-8?B?bGZ1bDRaV1c4L1BpR2lnYllUaVhtOVg2MGM3bVhCWjc4MGpoNUFlcm94cmtz?=
 =?utf-8?Q?ueNs0q6onGYzJ1COeCaOrBWc/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bc21e4-d893-49b9-4415-08db3ff85ff7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:33:39.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ME2Loae6ciTlGy8QF4GBMZLhTz2zPxeIk620BHmJCTch+bxgpJr2j5bAWTDsqkbI+SqX96N3n0FfsiSbcOr5sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9362

Don't let x86_decode_insn() failing go silently.

Check hardware provided value (if sensible) against decoder provided
one. Also use it as return value on the error path - there's no real
reason to inject #GP if we have a presumably good value in hands.

Check that, when no ModR/M byte is expected, the decoder also didn't
think there is one. This makes things symmetric with the opposite case,
where there being a valid ModR/M byte is implictly checked by the first
of the involved comparisons.

While adding the initializers, also switch emul_len to "unsigned int",
matching both the function's return type and that of x86_insn_length().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -56,8 +56,8 @@ unsigned int svm_get_insn_len(struct vcp
 {
     struct hvm_emulate_ctxt ctxt;
     struct x86_emulate_state *state;
-    unsigned long nrip_len, emul_len;
-    unsigned int instr_opcode, instr_modrm;
+    unsigned long nrip_len;
+    unsigned int emul_len = 0, instr_opcode = 0, instr_modrm = 0;
     unsigned int modrm_rm, modrm_reg;
     int modrm_mod;
 
@@ -75,19 +75,22 @@ unsigned int svm_get_insn_len(struct vcp
     hvm_emulate_init_per_insn(&ctxt, NULL, 0);
     state = x86_decode_insn(&ctxt.ctxt, hvmemul_insn_fetch);
     if ( IS_ERR_OR_NULL(state) )
-        return 0;
+        goto bad;
 
     emul_len = x86_insn_length(state, &ctxt.ctxt);
     modrm_mod = x86_insn_modrm(state, &modrm_rm, &modrm_reg);
     x86_emulate_free_state(state);
 
+    if ( nrip_len > 0 && nrip_len <= MAX_INST_LEN && emul_len != nrip_len )
+        goto bad;
+
     /* Extract components from instr_enc. */
     instr_modrm  = instr_enc & 0xff;
     instr_opcode = instr_enc >> 8;
 
     if ( instr_opcode == ctxt.ctxt.opcode )
     {
-        if ( !instr_modrm )
+        if ( !instr_modrm && modrm_mod < 0 )
             return emul_len;
 
         if ( modrm_mod       == MASK_EXTR(instr_modrm, 0300) &&
@@ -96,12 +99,16 @@ unsigned int svm_get_insn_len(struct vcp
             return emul_len;
     }
 
+ bad:
     printk(XENLOG_G_WARNING
-           "Insn mismatch: Expected opcode %#x, modrm %#x, got nrip_len %lu, emul_len %lu\n",
+           "Insn mismatch: Expected opcode %#x, modrm %#x, got nrip_len %lu, emul_len %u\n",
            instr_opcode, instr_modrm, nrip_len, emul_len);
     hvm_dump_emulation_state(XENLOG_G_WARNING, "SVM Insn len",
                              &ctxt, X86EMUL_UNHANDLEABLE);
 
+    if ( nrip_len > 0 && nrip_len <= MAX_INST_LEN )
+        return nrip_len;
+
     hvm_inject_hw_exception(X86_EXC_GP, 0);
     return 0;
 }

