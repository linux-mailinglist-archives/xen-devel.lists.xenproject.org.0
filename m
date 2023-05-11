Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3456FF0B0
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533276.829795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4oG-00030t-Mw; Thu, 11 May 2023 11:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533276.829795; Thu, 11 May 2023 11:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4oG-0002z0-Hp; Thu, 11 May 2023 11:50:12 +0000
Received: by outflank-mailman (input) for mailman id 533276;
 Thu, 11 May 2023 11:50:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px4oF-0002yu-Gc
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:50:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb30fdde-eff1-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 13:50:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 11:50:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 11:50:08 +0000
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
X-Inumbo-ID: fb30fdde-eff1-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1KmYhuK6+4o5gPuLjsva2MWNG5hPQ5LeNK+kKqI8tuK+xmI9R8NIXZD4FXxDDyAMpteA5Jix91NYmHf/soN74UUGGuMoP9OJeIbtan5wHfCYduf7VFybucR7KdjavFkYHM8UucUOOEZrxb4qU4EnY3V8r/o1lphqzau+Q+gW/8sRymsHpINMXU2hW8IN6MBN6oDNkFm9AnDVw0zTqEWEcqYjd19IKE1rXJM3CVTgsdQ/SGx29KY1KGRekJRy/PpTnSGhd6OSatBIci9gvn8OE8gpps/T4fDAe/NXYlUICUlGLJpsaLBy3nzr6aBTiJLSaMvuuOG2Bjnykda7KX6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPKJcU9yyCNN6ui7J+8QrolkEQPO4ronoUMXEO9IIrk=;
 b=Ph4VuLBqed1csXbbMLSP0QEKTCVFLiUVlxCUnio6stHdMazNLMjfuTokJtRfwiPgdfEf25EOAhEHnjruS5rh4qlnKcF2FUQaPtOhuqVp+wokctjPn0To7DKux92EpQ0nUVd3nnWDO4dzvn/471INROuQNr9YuWHSXjelRgBmaVhFhtkVc+XU30yMi+4ApfHqwoqUmZCX0RrAuWt/woCQqPeAuKnjLS81OP+4VLoOhMaq7wdKl8Z5EEYT3W59o4gPP3xRa1HMc0kVQzBQ5boQgMe4XMAGz73TXwewz1WfBHkfTpIuiDWk3Ntvv2rEnqdzXvWahEyUaosOPApALSYsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPKJcU9yyCNN6ui7J+8QrolkEQPO4ronoUMXEO9IIrk=;
 b=VfZ7JE0aDX4ktYDKrda7knBhDagAkCFa1Dfwk9NvXAIpm8Jv1PkRzzU/+1xpaJTcOP3NDaFHP2y0rjIq7unPsDRmZIXh3iGU7ff/DBtEh0Od1oMwyiVxr0KxdzQJZLVwkRQH6bbWg3GcxYfd+zJkhKDPEGTPgplaZUt+AEBnoDUVPJ7tRyRH6lVYi1gFACrJSesklO1FlKpuTr51G0fjgohQQL6ge9fcNRp3yjFs9BYopwRX7Rznpc4q9PxVf/nUcwDRc/dhEMQNfDExsfLFOjsORyzAVANA01Mj29fWHuqRGotFyNUBvM3AksID2mP/7QsICdRgfITCib1d48iObA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
Date: Thu, 11 May 2023 13:50:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vPIT: check/bound values loaded from state save record
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a1067e-b41e-413d-c5c3-08db5215ddf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qxEc4IOSN8VaFsS2kYnDVrbVjvC09s3UduO92z4qrrsvij3SwBRzV6AM1vxdf9qkKl9ittLwPQAt7JtItLVxwLM9X0s9RNUb19FnolR+iymVMX8KUZF3I3dD9sOEFhNCGZ9nhAjuM/J6wKlvMQqCRNa1JhjcowJk4ePo/8uuDy/pRXRLJjDEVt0dKiVX3REuo4vE2E/81KROXii9ePIAc91Io5XM8QLWjmExfgPEgm5JOKXcnLJt2uExPGJ2LmfSoYWCSSNvSja119DXT3EEBVYQV6I7V8Y2jxj2QPrGxlSjTGwrRpImmbrNGGdzTbHYzgvtLcDHdS2A/KQZ0LNgpjYRVMPHoMm7Vf4/iDHAdSeoChnUtqZPE2CWseD87/bIgM/fcMgzMu/f/uMQQNVRvgFQlUsg2AepR/IIm7NA2NyWm7f3Mzx9d1XjMhTsYaqjRMOMJXnyaj9JUZjGNDBIssuJ07NKcNS+Pj9po5FQ4nYJ++dwB+V5jCHuvR3XjhO63pFdrL+c59BOFA54THikdlxlKpMpGlOhPrP2UIWPfIto/9XYjEldmVPXkPMG4+a0nK2nw+9k3eK8na96qLbkOESS5mOcRSBu7ktDxxA1MzsyJUswYJnJoncIOpObcWOkh0lsZ5S7aMZllAdGTVBwQajb4siBrzBkToFffxhqcpilmqTmNpr9516R+4zrxK1t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(38100700002)(6916009)(8676002)(31686004)(8936002)(54906003)(83380400001)(2616005)(66556008)(4326008)(66946007)(66476007)(316002)(41300700001)(6506007)(6512007)(186003)(26005)(478600001)(2906002)(86362001)(36756003)(31696002)(6486002)(6666004)(5660300002)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEdCcXJpVmRHakIrelpYQkFGV0RKbStXemJFZWpTSnF5RlJLUlZHY1dBYjVy?=
 =?utf-8?B?MEV2cTEvaFB2dHZiWjcySGZyQW1GcVBNQzNRVGFLZ2RKUHgvL3dneFFOL3o5?=
 =?utf-8?B?UytOUTlCVDZyeitMRGFwV05yVlRGTnFIK0twK0ZuOW0vUFo2TFg2OXNkaWx5?=
 =?utf-8?B?cmdMNU9VYzIxeUl1elgxVExxdTlNL2xLM1NYNnErY1lMbjBzSWltZzlZSTd1?=
 =?utf-8?B?aGVTaFpGbE5mcUJzbTZYWjViVGl6bFFkRkx4VWluSkJEcEdGRzhreE9jclZn?=
 =?utf-8?B?bUtaWEp5VWpmazV6MkhsWlpqUlFoS1FvZ0I1d2ZyQzhITDNPclpmeEMzZmxB?=
 =?utf-8?B?bXJrRG5BM01JUnViM05jSFYrM2l0YmJRSmM2OXN5cm9zK3NyNDEyeklUQVJR?=
 =?utf-8?B?Y2ZoWkJiUEFxUVpyeVVvZjdSVVNQb05KMlcyN2hSQTRDMkJxRnVmdTVydjgv?=
 =?utf-8?B?d2lyTUg0bmRKQzFJUmYxb0V0YmcrWFJQT0RWOGFDeVhhNjk0SENGRUUrYnZz?=
 =?utf-8?B?eVZ5cnlPamtya3Q1YzUwK2hZTFZOaExUZTQxQy9pL1JYSU5RYTFqREtsa0Vk?=
 =?utf-8?B?Mm5iaTdqRkdFVEIwVU42bll4cURrTGxLdTNVZnA5Y0h3cFc1Yk1kdWM4NUw2?=
 =?utf-8?B?R1l4Zkp1RWh6b3BVa2FhbnYwTi9EWmJ4UzBLNkRDbVIraEJCd0daZ3BtZ1ZO?=
 =?utf-8?B?ZXhDZkxSbWpLZWh4enBYNHhURVV3OEtFZkp0NDdGSkpCaU5tN091SjdlYWg3?=
 =?utf-8?B?ZmxqUytneThtbHBTeE44Y3FhS3BoY1EvZnJvWHJ4VUxOTFBhY1hXZ2RRWjBS?=
 =?utf-8?B?QVlHT2FLb2hZUVZpRnRjVytOanB4NWc4c09Wc0twdzQ4cHdHZkhGQ0t5TWVv?=
 =?utf-8?B?Y1BNaG04TEU3UGkxbGtMaE93YjEwUnYwZlUyYjJibUZKTUtGNkhRYmtxVitG?=
 =?utf-8?B?dDJleGdnOHZTclRIVUxJRjk2OVVvTllDak9ocHpqaGI4aTY3bnpRWlJ0NDJa?=
 =?utf-8?B?T1NycXcxZDlVSnpEN2lGTk1qeHlvaGlrRm9mV0xQSTNMVjdKQkZ0WkdiQnB2?=
 =?utf-8?B?NEVyZFRLTG5iNnJyc2laVnFUK0c2Ry9DQWFqaWhFYW9FUzYybUM1L3A3THg2?=
 =?utf-8?B?M0VJQXZxMllxZzVNeHNGdWw3eTlIckZ6MTdRaW5JeDJML1lscFZCbjBtc1E1?=
 =?utf-8?B?REU2NVFHUm55RFR0am42cXkwRDJZRzRjczc2SWJWVnlIN0s1NmdCYnIrMG0x?=
 =?utf-8?B?K2ZKZWR2Y215SVhhK3NIa1prSmZyeVZsLzd3UEYzVk5jNUJLZG5lSEU0SWV5?=
 =?utf-8?B?S2xTbFAxd2pUcEJsYnUrMmtZV3ZUcFFwS2JhclVNU1pLY3F2a2h6MHFyMkdQ?=
 =?utf-8?B?L1E0cW1YMStIUUx3QjkzbkNHWW9KOTNvTW5tUExEQmNWMVVwOXpUcUxLU1pr?=
 =?utf-8?B?enlzZy9jS3duYklZaUtoWjFVMnJNMHpjbHFrTHdFNnBldU5CZS9neUdVVlMr?=
 =?utf-8?B?UElLcVdhU2RiaFVYZGVSUHNCS01YTWFDLzAzaXZrL3ByUTNVQzJZcWp1RTJ6?=
 =?utf-8?B?MXMzOTRMY3FWci9jVWh1NjF2Z3pXcmhFdHBpYkphc1VYZ1kvRXhMYVl6QkpY?=
 =?utf-8?B?VWlUK0huclZvUkJqZ29IUVE5WlZxZlZqQTVscVdBTDRiT1FOUFZlU0VjaUNv?=
 =?utf-8?B?U0VaS3QzajJMdGRBNHJ4bmNzRlY1TDdIbkh2NFYzQ3M3OHBKZU5FVDJPQmp1?=
 =?utf-8?B?RXFxOHdwUXVoQmF3QmZGaVhYVUtLWTQ5b1JzeHNoNkZzYTI0ZU1FRzUzdE9J?=
 =?utf-8?B?OU8rV1JqSmZWeHdtQmlQRnRYR0RHTlpwcm40MWliZENBRi9aNFhVc08wUXZ1?=
 =?utf-8?B?elVWUkNkbURCNXZiUVg0RmgyUWhHU3BKeXkzcnZFZEJRUWRneVpsS1pSMFlx?=
 =?utf-8?B?b3J1V0JDSzgwUEFCMHk2NjZVSTMwb1VBUmREK0RDR1hwWU1XUVM1V3dwbnND?=
 =?utf-8?B?RnZCV2V0ZlkwdUdLR1h0WXNudnRZMWpBc3NvWUkrT0gyTjZzd1hvWGxnTzhy?=
 =?utf-8?B?a3JaSDZhMHpTM2Z1V3lGMVplRkdoZUhhQ25CdXBseVhVN0hseERjSS8zTFFp?=
 =?utf-8?Q?07saZHLdgkRqL21a9Ow+mYN6X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a1067e-b41e-413d-c5c3-08db5215ddf0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:50:07.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW0DAQBQWTU4l5Iz/Nad5wS0R9ygKxgRI0mRPWZuZoJMxY7EicbeQ/TLrBNdcpq8O6QAKHM3yD7QgM62RFSYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

In particular pit_latch_status() and speaker_ioport_read() perform
calculations which assume in-bounds values. Several of the state save
record fields can hold wider ranges, though.

Note that ->gate should only be possible to be zero for channel 2;
enforce that as well.

Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
the value pit_latch_status() may calculate. The chosen mode of 7 is
still one which cannot be established by writing the control word.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course an alternative would be to simply reject state save records
with out of bounds values.

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -47,6 +47,7 @@
 #define RW_STATE_MSB 2
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
+#define RW_STATE_NUM 5
 
 static int cf_check handle_pit_io(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val);
@@ -426,6 +427,33 @@ static int cf_check pit_load(struct doma
     }
     
     /*
+     * Convert loaded values to be within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.
+     */
+    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
+    {
+        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
+
+        /* pit_load_count() will convert 0 suitably back to 0x10000. */
+        ch->count &= 0xffff;
+        if ( ch->count_latched >= RW_STATE_NUM )
+            ch->count_latched = 0;
+        if ( ch->read_state >= RW_STATE_NUM )
+            ch->read_state = 0;
+        if ( ch->read_state >= RW_STATE_NUM )
+            ch->write_state = 0;
+        if ( ch->rw_mode > RW_STATE_WORD0 )
+            ch->rw_mode = 0;
+        if ( (ch->mode &= 7) > 5 )
+            ch->mode -= 4;
+        ch->bcd = !!ch->bcd;
+        ch->gate = i != 2 || ch->gate;
+    }
+
+    pit->hw.speaker_data_on = !!pit->hw.speaker_data_on;
+
+    /*
      * Recreate platform timers from hardware state.  There will be some 
      * time jitter here, but the wall-clock will have jumped massively, so 
      * we hope the guest can handle it.
@@ -464,7 +492,7 @@ void pit_reset(struct domain *d)
     for ( i = 0; i < 3; i++ )
     {
         s = &pit->hw.channels[i];
-        s->mode = 0xff; /* the init mode */
+        s->mode = 7; /* the init mode */
         s->gate = (i != 2);
         pit_load_count(pit, i, 0);
     }

