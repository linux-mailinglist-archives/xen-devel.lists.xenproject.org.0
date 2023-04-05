Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CD6D7D3C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518520.805164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2kb-0006lr-1G; Wed, 05 Apr 2023 13:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518520.805164; Wed, 05 Apr 2023 13:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2ka-0006jV-UN; Wed, 05 Apr 2023 13:00:32 +0000
Received: by outflank-mailman (input) for mailman id 518520;
 Wed, 05 Apr 2023 13:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pk2kY-0006jK-W6
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:00:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d67a0e83-d3b1-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 15:00:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 13:00:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 13:00:26 +0000
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
X-Inumbo-ID: d67a0e83-d3b1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu1LozaZwSHW0gQ8nnl1ClKXoo70m7hMUZeWF+Rn/E8nfQVmzKSa0TREPaf1/O1cpGT5aS0rAgZyYkVw1H1yrD33T9byTv0uGykw5m/Qa5JBRdcHafJwX8C64RjgVlB+99z64J4TZr4gpBSOQ5lKLY3a47ounbO7KX5KoZQmYc2cOvajwbQaxy1ip/vo3VHOuVlPtsxNvr0VyAtx1kLoIsBfkBsnAFUqeeODi5KIxmCiikJr9/wSztmmeQAI3QHkNHF3ldhyYWzTFfx+RxjjqJjkl4W/Kgd5giICbwsHVLOfoBQiJ7R1e+zYVPG1uM8yj+IioyJKcD3yAVIWhBJwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAfNC/zjVcbX3wOy+qauUhTJ8tcVsFPgjltxjEMksao=;
 b=gJFipnJVgve6cXeZRxscll5tkVoMgsxmfSW4MKJKyUdzEO0gpwx9NXUQHvAWXf8EAYq2JBq85h2UDhYii4i6gnrYTzA33mUzDpbp6ppv3sP9LffHMk98k3gQDrMZ/pE8JP7/3dXONJ3joJTvoAec8cHWoVNWAy/N7d3O3n348MzZ3cWt/B7MvE/R1E9aFdrW9w4bkaccufi4thkzNWo62TEINUXxYylSpQVkq5WyURedb5TyxhfBQDhcHMwZ25oY0HTtIZN7+J4z5ON+q20UNHFjEJ9bKQfPcph4PnPX/M5iLVkCORnLq2bf3L5iHOTx/H0gWiAzglvytxZFa8eVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAfNC/zjVcbX3wOy+qauUhTJ8tcVsFPgjltxjEMksao=;
 b=CeIDe/eMpTRstGsb2sF1ACodnSgpT8dCvKFriNw90ZilNoJV9hgRIgZyuizVpJF39hJrLxk3Kh3mbgN2c9jnrCs/TK4lslutRcTikdq2myKVMw1xC2S5BZoGS3N8XqNCQMS4Xp+dr8dEJTUrCA9BA79kJ8PLWCHh0XyjUEGTqAPI19JmcwXjVehCjWj5LRlXpplohKxoy9YrMyqAzSJD10nRGF3r4LDLS32CQauHnJ14PX4xz037H/d+r4JisSmJD/ESzSgTnwrZIBCYwGzxlfukdd67z2zUwp4mT7j8+b3urRvJFpOFRUV32kWl6MJHjYTgoe039tCkTSopJmvHLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52421029-a058-65fc-074b-fbcb1ccfb1b0@suse.com>
Date: Wed, 5 Apr 2023 15:00:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86emul: build with -Os
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 5476f786-e6e4-400a-1910-08db35d5b94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TvXv/9UOKXtqvCkHycSojunwrjd/9c3/aGQe07liLNbzlncxfsWsyQWYJ4/CEuSz77gpNXKImNA+DNSWTh2Cx0NkDqIFcMLSrTfQUyLd8I333wT2rOYhv+fKj3pVy+lt7D5x5FFEc+5Bf1ZX6saQy8IXQot6cwdMCi9Ehn6lcU2bYiwtkDQ8dATDuvL0KGLu9vTEtM6ggEzG5WS48JsJAaWTTklyIfG9r/laNGG2rmCqfR3orIKKr4MdgPnK8a7OvRsMeY7LCd+LYf5/7mVr8O0e3tEu/fADhUYF7reOz6Tfi9u52uK0xP1+m1qUD+DG+OhcnPE3uNPlaaLeiXNjvfXWSAgsBZ6aPdJgh3CjaakpRp1qTcMBmTAhGeZmCfpc0CVOAJx0TdKxnezd4+XgopwTizGGE7S6NH0VmpB4JEGvcHEHQBbPDk1og/5pSlISi8D7U78WErXr6M4lxye6quFCy4odTdOgteeSIkjZGKGgGciHzIL9/KpVoeqEmlazu4HG32e4H6Kf6JE8tbHkxp+IMjYX0elpHf6kl7F3O/cOkX528D2EtxSuQOaGspbZVHeZZZxznyEg0mtdzc1BkklMf9PgYOTj/FMdF9EDX7rCyPlCdjwqk2k/4oIQfLHL9AsfG+tuyxOah+IxdHy/Yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39850400004)(376002)(346002)(136003)(451199021)(31686004)(2906002)(6512007)(6506007)(26005)(2616005)(186003)(83380400001)(6486002)(5660300002)(8936002)(38100700002)(36756003)(478600001)(54906003)(316002)(41300700001)(31696002)(66556008)(66946007)(86362001)(4326008)(6916009)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R25rVG55aHQ1YmhTMzd6Q0kxdHRYdzk3WWhmb2w1Y0xnODQ5dnRUbjAyZFNm?=
 =?utf-8?B?cFJHNkd6U2lYTTVHZEpNb3dZZ3RZMDFuL2VKSG8vNTdIQlROeG5QVTdaVm1r?=
 =?utf-8?B?K1hEbWVGRjNhdUU0SE1QR2NmblJJbXNteGtyZ3BUcm5FemZ0Mnp2a0tjOFB2?=
 =?utf-8?B?cW91eThXMU9QNjhwWXJSSzRuRUphcHE1YzlSWTRkc3VkRWlHdC9pbVVoRVZx?=
 =?utf-8?B?dXJ0NEFKNmx6S3JEYnYyR3BGWnVEVmpsUUp6ajF4QTVNUXp5MUdVN1M4alRU?=
 =?utf-8?B?WlllVjRuQnVvRndFR1YvUjhraWdqTjJ0L3JhNUJyRlNxbjEySnlTZGk1bFVG?=
 =?utf-8?B?dFptdHhWMVR4WWpXdzBsNmt2SWRsMm11Q3dQTHVxejV6cGdqWHdCMnpXSHRY?=
 =?utf-8?B?RTNrVkpGTktsQWJ2ckVvcy9IL2luQ044RXFrMStld2VnZDFQWGZJcGFhQTBZ?=
 =?utf-8?B?YWptYlM5NHBPNmdEZERMVTZYMjhmT3JVdHNESkx2OUg1T2pGYndHYjd6L0p2?=
 =?utf-8?B?TWVUajh1ajd1UkJEajZZcnlsbFBQanR4b1I4c2VsOGNSR2d3NjZhMVZLbHhD?=
 =?utf-8?B?QUMrVWlXc0pzbDU0ekV5Zm1KR1Jra254a0Z0TnFBNDZhbXZkWGVVbnlyOG5X?=
 =?utf-8?B?cjhWZDNac0E4dUlmL3FGK2VoU2FUdkh0Rm05NlNYakh0RzZPYXBpdytEejFB?=
 =?utf-8?B?SGpjNUw2M2dzY0RCMjdCK2VLQkdEU1paY3ZMeXcrb2dSTVYxc01VSjRGU3Nl?=
 =?utf-8?B?TW5wVm1uQm8wZUFuUnU3bTlEb1QvRllHNDM4Wi9FMmgwTk1wWmxSVVk1azNS?=
 =?utf-8?B?amUrRFlVcjc5cm02TCtLTWFJam16MDZ5eElMcW1pc0YvUW15d1EzbUVmdkdF?=
 =?utf-8?B?a0habCtaMGpkSE94aEVQbG1TaWpjQzY3VWJVby9PZU4rVWl6NlVQZkd4NkUx?=
 =?utf-8?B?M2hVaGpWdVVIL3RMR3Bwd0RmZkFNcXo2UTJNZlBCSmV6a1RYbEYwd3JNWU52?=
 =?utf-8?B?cFpjcGwrajhSNmxHSEhRMzZmTDRDZCtGVVFRdjU3TTJJN0hSblgvSkZhQUpr?=
 =?utf-8?B?RUNjNEhnQkEvTzVsNThQa3hHbVdoVnFqTWIzUy9NcE5nRXZSV2NzNkg0TXEz?=
 =?utf-8?B?QW1RM0NOczlBZExQYkpsQ2xyTENBTk5LaWx6dE5vSDdET3YyVTZDcmpuK09E?=
 =?utf-8?B?NXpVZE5EUkc0RE41RmtvQTMrd1hvbDBnTGFGQUNtTlc4cWl4WlRDOUl0ampH?=
 =?utf-8?B?L0FHd1dJZHhkZjFreXUreU9IcmJIYVdEMDMrQVEvekF0eUJHelJ0akwxcVYy?=
 =?utf-8?B?RjlpeVBNMk4rRWJac21VSlpnZlRzSG5uS2Z2eXRCUDJxK0dyQzZ4T1dSRVNu?=
 =?utf-8?B?a0JGcHp4aGFxR2tTR0J1SzhLbFcwRnhpVkF3OS8zeXNnUjhwc3RuYXJBQ1c5?=
 =?utf-8?B?dllHQUVwZVUwYzhOOVVNZFFaSkM1dy8rRVB2VzFoVU1Nb2lxRmdpUkZjV1FC?=
 =?utf-8?B?bS9yS0I0cDVjMkIxM0NmWG8zcU85T09IUXJRYzA2RFA3Mit1bURRNEhlL3Zk?=
 =?utf-8?B?WU5TdWN4blpNVk5yS0w5Vldma3pYcU1IWWl2cVd1YTdqemxDcjNwYVlibUVP?=
 =?utf-8?B?MEhuSTZpbEZPYTNRbndJelRWSWJjNk5vakZNL0VSZkhGWjY3TWFZVktRbVpJ?=
 =?utf-8?B?cXY2Wkl3c0hMQVhXbWYzQzBqTTY1NWo5QXhNczIrdENFSkFmeTJvV2J4MFd1?=
 =?utf-8?B?WUJJUDlwaloxQmxqZndqVlBVY3NqVzIyNzduWmE2Sm5jWTNMSmNNK3NDSUpr?=
 =?utf-8?B?d2k3cVAvSEVPMWhRZnh5TVhTUnVVSlIxUUNwRU50T0xqb3VtWVJXOGxpK2l3?=
 =?utf-8?B?WlFvVmhjYW91MDB6WGx3THR2RWFML0VrU003aHdSYk9jUVcveU84R1VvU1Vi?=
 =?utf-8?B?UWxnUmxidVN1SGwydUhFWlJiR014WllUN0NiUzB3c2dRUkpwZFU0MHFyN3lZ?=
 =?utf-8?B?YzlXaDNacnViN3d0TkFRL0RUQllMdkIwOFFobHJySXljY1IxdkJIYjVUWnNp?=
 =?utf-8?B?b1pLM05ldXNzUnBJOVZzZVR0OWJqNXN0Vmh1MGxtSVZwbVdGQ3JXSFl6RFhX?=
 =?utf-8?Q?Ba9RDbU5X5FhBHUBHTDZp0IkH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5476f786-e6e4-400a-1910-08db35d5b94a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:00:25.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsnxvuPlJ5y0pXxlmL5hrbf0w1PGk5z8hzxFbuqt5uH3GVKJYmmD7BNUaHMmah+qmGP+JCUpx5blrR143FbaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897

Emulator code is large and involving it in guest operations cannot be
expected to be fast anyway. Help binary size as well as, for release
builds at least, compile time by building all involved code with size
optimization, independent of the build being a debug or a release one.

The size savings observed in a release build (with AMX and KeyLocker
code in place on top of what's upstream) are above 48k of .text, with
gcc 11.

To keep what is being tested similar to what's in the hypervisor, apply
the override to test and fuzzing harnesses as well (but affecting only
the core emulator files, not any auxiliary ones).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course if we were to gain a Kconfig control for selecting the
optimization level, the override done here may want to be controllable
that way as well then.
---
v3: Also apply to test and fuzzing harnesses.
v2: New.

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -39,6 +39,10 @@ x86-emulate.h: x86_emulate/x86_emulate.h
 x86-emulate.o x86-emulate-cov.o: x86-emulate.h x86_emulate/x86_emulate.c x86_emulate/private.h
 fuzz-emul.o fuzz-emul-cov.o wrappers.o: x86-emulate.h
 
+x86-emulate.o x86-emulate-cov.o: CFLAGS += -Os
+$(filter x86_emulate/%.o,$(OBJS)): CFLAGS += -Os
+$(patsubst %.o,%-cov.o,$(filter x86_emulate/%.o,$(OBJS))): CFLAGS += -Os
+
 $(filter x86_emulate/%.o,$(OBJS)): x86_emulate/%.o: x86_emulate/%.c x86_emulate/private.h $(x86_emulate.h)
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -o $@ $< $(APPEND_CFLAGS)
 
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -298,7 +298,7 @@ $(OBJS): %.o: %.c $(x86_emulate.h)
 	$(HOSTCC) $(HOSTCFLAGS) -c -g -o $@ $<
 
 x86-emulate.o: x86_emulate/x86_emulate.c
-x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
+x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__ -Os
 
 # In order for our custom .type assembler directives to reliably land after
 # gcc's, we need to keep it from re-ordering top-level constructs.
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -89,6 +89,7 @@ hostprogs-y += efi/mkreloc
 # Allows usercopy.c to include itself
 $(obj)/usercopy.o: CFLAGS-y += -iquote .
 
+$(obj)/x86_emulate.o: CFLAGS-y += -Os
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,3 +1,5 @@
+CFLAGS-y += -Os
+
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o

