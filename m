Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCA579DF2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 14:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370624.602471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDmlx-0005Fi-GO; Tue, 19 Jul 2022 12:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370624.602471; Tue, 19 Jul 2022 12:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDmlx-0005DP-Dl; Tue, 19 Jul 2022 12:56:21 +0000
Received: by outflank-mailman (input) for mailman id 370624;
 Tue, 19 Jul 2022 12:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDmlv-0005DD-NC
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 12:56:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150044.outbound.protection.outlook.com [40.107.15.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2da1c9ab-0762-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 14:56:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2616.eurprd04.prod.outlook.com (2603:10a6:4:31::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 12:56:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 12:56:17 +0000
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
X-Inumbo-ID: 2da1c9ab-0762-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JS7qZtJ/O0dXXrB0O9TTVcdOQMZC19OZ/0a7R96Ccbo7dCrlFbC0PBi/JwJoxnHcxdwvKoKs9YpkGPzzIi0ZZlcetPTIe/ubBPKb0JXkVspjXyFvDA2TdQj/kdlRfS62MAtIjA341Rs/MFEkMcGzFdBCaPkjXnzsF+paXhpDi0HokFuKP2XmeGmODvC2S8eNio98dIz8NLeQZqPDvXAgjHXairfqJ0Yk7q8reAJ0rTVM9SdQTkdhuQPF60+nz7D9G7lTodYl+Nbk5n5dUhzWsbiSMCT4LSs1hqIO1cNuv5kkMfv+T+8PMZH6KwRXgtcltW46lTT6yOx0A7kiarwuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzhBdq+jhZM8miUoFcMY7wVOXlpa9XQiV1LdPy+xLQA=;
 b=gnhiBZiVwzhcm4Eb81tJ5v8kLM9MfS42gQ2HybwAd035N6qrp0qySIUgf0D2K8QQe8yz0U+yfMcx/49Fpb4+n2BsLFeXIz5yrOteiizthnNbAjkfNKYApG8P3RIk7r/qmSsLIdtgu4rShnG2FfzOtvNPNeroa6kkiZK59AotzYHd41C0FSGopXabOOGaTvRfcN1h+7ClkcpuUO2QpKM0eVl3YFnnFrpnaOMo52u7dzmTUNfLjB/x8S8yv3L7ukkPdbcnb0w+CZ6g7L15GxFMplIIbyaKHkhuZImDeBCWaJ1e5z1gzD4aVCRkp5aCG0UzVfJGkXdz5GNTf7TzLypj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzhBdq+jhZM8miUoFcMY7wVOXlpa9XQiV1LdPy+xLQA=;
 b=PuCjCt2iXXkjd7KXWax/u1Y7YW5JwN/OkIkHXTCOEc5gFaZv06h1Vig1vPg07OM1jkWvOCwyfzRxmhCjfNaORTaOVWUR2Itji21JWX29Z80MiwammiLAJxewPkoWD1rUY10wB+2Qg4J4ffZq+F3DVy5MQur5+P/Fk9a2gk7mn5kGxJbiKO7o7n2g6gNcJ9UzCX/Dx3XdgcUZoQE3Jbl638SeRIvrOJYKt03gCwpuOkUVLgfr/x8SCJ1yfer93eNDO3XQmreyRqk/nnY2HBjtXVog+PsDech8JM87PER03zKwSTi2Opxgj3g7Ipijga/ghopxoKwG9MrLkIEOtTdO6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8623a3f-ed4f-3a11-7c01-a3b60cc54236@suse.com>
Date: Tue, 19 Jul 2022 14:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: add memory operand low bits checks for ENQCMD{,S}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 543665ca-c1c7-4582-1eba-08da698611b5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2616:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xfHs8FIJeQm6RaAtrNxAnQLcXLDRSPTdEPdU8uNScbXgJjqx/eY5B/jNZrcWuuGrRV3dr1KH9pHEbjPIOTEoMzmzikpb3/3iaIagPcj/Vp+0j4yryjcWIJ6d7q3FrBQndIZf89kMrrkze7ww194e1ppdiXamFU30VdKBdc4icbgj1lxAm762nAs8ma6CjEF+P9755YqLWy61drPmEm1dvxvQiiQJMD2i3q5FJgmVG3uHbAc6cw5nQv1nAEe3dm004kA8WEuXFw3PovcAFXDH1vaK4iku/GZWKdY13P1xWsyrFOoj4sPTEurWh34i5FQlwJScSqMZpMEFux4EJDHOlN4ENemidrK7JVFYfFeoYlyp/cO1r5dR7TV8wgO/cN/txBDxhOYKIiij+TMu/XT0uqXhi8MnG0hh02RygTEN0sKunrO9JLSTu1lHd+1uzCEMazNIm9u9atXoLEfd874/S/Oqdl5FqSxgGtlJtIGVXRXFdLaJkEXtxFpj67ngoKYiEStE4w+Ku/8aC+DBfyTEjmxbidAFjMOU+Ot+kXkPgoCPRBike5g9RX8z+qDXpVx2/AH+iWWako5kBbIGptbCOk82rB+10eMwVNjiUlvHTwyC33np0VR7/Q7onpWJBVCzXNUZk1kw4XPkNlTAzAcR09A2i1FmrkaQh1X1jHDLtq6FFNTmNQrpMZt/gIeQe+WixfEH8Opsb+ZTMtJFY5QP76+POsVI1gHM//OtEbtwIHJRPC6+4JkPHNtolgU+1+bfD5U+NK4tdyMEYk6GjB9hs1fQnj3uJUg9fj0WTl03xO1ZMtvbimo05L0gUzROTGzBVLgWLGKPA/WV+pd0lz0l9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(376002)(396003)(366004)(478600001)(2906002)(6512007)(41300700001)(26005)(186003)(6506007)(86362001)(31696002)(2616005)(5660300002)(6486002)(8936002)(38100700002)(316002)(36756003)(6916009)(4326008)(54906003)(8676002)(31686004)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzlYTTlrYmxndHQxdEZRblVFd1ZFeUl5T25EOFFNN1ZzY0IyZ2NnaEwvd0pY?=
 =?utf-8?B?d3NUUXIrNXR5L3gvRTdjUnk4dHJ1MG1VSVkrSnNpbDVrRTRrZXArRE8xMG9I?=
 =?utf-8?B?RTZ6emNPWGpBNUtWdWpGYVBpKzJnWEs5Z1UvREwwcVd2NzY2SGpIUk5jSENE?=
 =?utf-8?B?dHNlK2NPSG1zZmhmTkY1WlZObnZTNkU4ZDZqRjJhdkNHbldEUTFRc0ViZ3N5?=
 =?utf-8?B?ZkhDOEFLL3BzOCtvbSttMVBlYW5UOXBGTUN0ZWo2czlyVlBDZHFOemg1U3Jn?=
 =?utf-8?B?bGVGVEkvUldhVTZxSXpEZklHQW1FS3hweURqTmQ4TzZzaVQvQnMzR3NsT25u?=
 =?utf-8?B?S2N0S3hsOSt5ejdRNWVkMjBWRk1VdjdFVzRsdmxhM0dyK2F1Q2w0aC9PUU5W?=
 =?utf-8?B?Qzl6bksxZU9kd2ZqZWtVQVh4WlJmVGc4MkQwL2hKb2RDd2wyeTBYckUyN1lS?=
 =?utf-8?B?TVlHbFVuWjNybWVtMHZOa2dPMnJWdU81Z1VtUG93QjN6eFZLNnRPdFMyeitm?=
 =?utf-8?B?S3d6WFh2eG51eVNlaXI1eVlqRlI1T0l5aG1TNkV0VE5ERlp0ZDBoNGJqWGhX?=
 =?utf-8?B?dDBqSVN1VUVYdGR4Nk5TNTBIMVMyWm9GTmNROS9pMEFPSHQ2OXVPRmxydmVZ?=
 =?utf-8?B?aUFGNzUwVkdJTHBkK3ozdHVSbEUveVJ1dDNQcU5jNFdNWUU5MWFyMnhQSTZV?=
 =?utf-8?B?OEVlNjI1S2tIa3J3T3QzZmhuamtvY09rWmErRVU1amNlN0krOWVMQTBJeGJH?=
 =?utf-8?B?ZXZmdU5FM3huOUxsZTB1b2xYRjlMMG1TSnRNN2RSM0JqZE5jcGN5RWJRdm0r?=
 =?utf-8?B?S2VFaFk3TURYaXBvdkhOZ05YUmZzOVhyRlhveFo3OVZEN0dmZ0NhOEdBYTA4?=
 =?utf-8?B?Y05TQnFGb0VLN3hOZ3AzUFdQY28zdEk2R2tYQ3EycXNkdXZzMnFQVmlxSzJT?=
 =?utf-8?B?L21MY0JDL2hSdXNxQ3NtazhTelAzWndudThnWlVxeFdqNlZsSDBQTHp2R1ZO?=
 =?utf-8?B?WHliSkU3OEtFOTBCb0RVeHlyVnlGbmppNGVKYmJvcUV1NXF1R2ZrdUdWWjV5?=
 =?utf-8?B?b2paakdFdkt0bjVNbkZxTVIzUHptdjZ4QysxTlRXQXBLTDV4ZC8yU0JaaEVU?=
 =?utf-8?B?eGI0Y21rZ3A5ekYzZWpBYmpTRUR2ekhsTG5wSEltSzFzYkRJMHBicEJzdm9W?=
 =?utf-8?B?aUhxb2R5ampTM0NkS0RvejFsOTJiazd2R1U1YjhHUWdxOG5nbkpvRm1nM2g3?=
 =?utf-8?B?bllRRzJScGV1OHVXcWROL05RaE9EUjFxUkhjTHpyMUprU3NnV2pOam5PT2Zu?=
 =?utf-8?B?MG1IbjJRb24wOXJDWlRzdENvRkRxR1M3ZzdDd1I0RG0vL0pBZG1tL3F6ejdJ?=
 =?utf-8?B?aVlGcnpaN0k1ZlZSWlkxTk9HRkY1RS9LaVh0L1Fhc3o1R3M4V2NBZHhPdTYr?=
 =?utf-8?B?YXdTN3NqZjZYUlo0QjFmeHVNZkhhUDNPUktpdnNQMzZ5cWx4clpUc0l5VXlU?=
 =?utf-8?B?aEpEOG5YMnlaVG5WbnNRS0s3Vm5rQUNVcU0rbE54NHcvVkdiRFQ5TzdUeU9R?=
 =?utf-8?B?T2lNMndxcmdneGE5YmNJVnJxeVhXRmk5SERqbm9LMjhmM3MwQnY2Q1RuS0x1?=
 =?utf-8?B?VEt6NGJIbkRpd2t0VnhXSE15TnJNUWxSNlAwZUlyUElGb2IxdzlDWmpDMm5Y?=
 =?utf-8?B?cDhaSkMyQTBaQWxPNG9Za1NIVWJwaHBFbGFWcTZ6SlRjMXNlK2I5MFA4ZWFw?=
 =?utf-8?B?eG5Zam5udlZEd0VmRTNKWlB5RkU1aXNDYitUZ2xEZ0x1ZllBOW9rR2JJd0xK?=
 =?utf-8?B?US9ENzFGeXUxaTAvUTNHOEg1UTNoQ0EyYkdYTjhkQmJCVm9oNjJJUWNvNGR4?=
 =?utf-8?B?ck83ZXhTdm12dzN4WS9xenA5cVYyLytReStPeld3SSs3SFN3V3VrTis1ME9Q?=
 =?utf-8?B?WitJS2JzSktBT3pVZ1ZTRVNYU0FZbi9zYjEvS0c5NlZBMHR6SVRJc0FibnJs?=
 =?utf-8?B?am52VmxMVE9BbS9aNDVCOUUxNlYwd2pZUFRBcDAzZTV2Q1RJYjAvQ2R5UDYv?=
 =?utf-8?B?aWtweVAvNUVSVEZkQTV0VFYxYjJKN1NZNWZTZUxDYkppOHdUYXo1OVg2WEV3?=
 =?utf-8?Q?eqR8FYBJ5YQKyPHM446xH8BN8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543665ca-c1c7-4582-1eba-08da698611b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 12:56:17.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNcCm810zofYA900WUupmJvHNXQFNuafU75PRus1WIyGEoW9F9JloeSTCdDsDJ08I0htWuIqrvYhmC08g+Lwcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2616

Already ISE rev 044 added text to this effect; rev 045 further dropped
leftover earlier text indicating the contrary:
- ENQCMD requires the low 32 bits of the memory operand to be clear,
- ENDCMDS requires bits 20...30 of the memory operand to be clear.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm a little reluctant to add a Fixes: tag here, because at the time
the code was written the behavior was matching what was documented.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -10499,6 +10499,7 @@ x86_emulate(
             goto done;
         if ( vex.pfx == vex_f2 ) /* enqcmd */
         {
+            generate_exception_if(mmvalp->data32[0], EXC_GP, 0);
             fail_if(!ops->read_msr);
             if ( (rc = ops->read_msr(MSR_PASID, &msr_val,
                                      ctxt)) != X86EMUL_OKAY )
@@ -10506,7 +10507,8 @@ x86_emulate(
             generate_exception_if(!(msr_val & PASID_VALID), EXC_GP, 0);
             mmvalp->data32[0] = MASK_EXTR(msr_val, PASID_PASID_MASK);
         }
-        mmvalp->data32[0] &= ~0x7ff00000;
+        else
+            generate_exception_if(mmvalp->data32[0] & 0x7ff00000, EXC_GP, 0);
         state->blk = blk_enqcmd;
         if ( (rc = ops->blk(x86_seg_es, src.val, mmvalp, 64, &_regs.eflags,
                             state, ctxt)) != X86EMUL_OKAY )

