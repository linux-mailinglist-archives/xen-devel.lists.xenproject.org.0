Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498583A67EB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141493.261349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmgc-0000PW-Q3; Mon, 14 Jun 2021 13:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141493.261349; Mon, 14 Jun 2021 13:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsmgc-0000Ne-Mr; Mon, 14 Jun 2021 13:31:30 +0000
Received: by outflank-mailman (input) for mailman id 141493;
 Mon, 14 Jun 2021 13:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsmga-0000NY-K4
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:31:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d6793f5-3fec-4eb4-92c4-c61592fa5c14;
 Mon, 14 Jun 2021 13:31:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-MbkfgPg5OZuoRrKLm6__Rw-1; Mon, 14 Jun 2021 15:31:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3776.eurprd04.prod.outlook.com (2603:10a6:803:18::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 13:31:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:31:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 13:31:22 +0000
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
X-Inumbo-ID: 6d6793f5-3fec-4eb4-92c4-c61592fa5c14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623677486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75yDB8dNxubumROkHf+V4tVCUw57HtyIaAiia6Di6FI=;
	b=daB028z4kVLEu8PJycmyRyAXEdLBgeINBNj8mQlh5+6lCow74NJOs2cVZQKTHJ5lPaYEVj
	dxWgnrtPf5WuNTZwdKc91ebtVB5M+J1jzzyY+MkJ119a4JnNJIstTMxaMS2XzPioQTEisQ
	0TrgXtVh93sQjjqkOwkWf4TMZ/pu6k8=
X-MC-Unique: MbkfgPg5OZuoRrKLm6__Rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO9Uml3sUGMLBRf2Dc/RvuDvCrRYpkAN6KYFq2JnWHJii5rslx72krkPDZMyMg2D6Hl0+yTd495z4heBFaWTOHWRplx6cZmRLuWIgvvrOC/Cui7nlrEm31eFzmJuBq5vY5wys8nnP9cRMn2UTao/xVeWVaU/onFAxAthetrlUOW36+aVLFpox97K+NDMOFT756QS07s9xKJGNvdTpTSyjR0NVX2MUiKWSzeDn0D3FqT74iP49hp4FLTajr5mjM+yNH7XD2oQlmbycs1MewalxBD6fzzBxdXQtOb4yqTzOcWWHEbgOTHEN8wBAuhIVs1kKRpXNMeGO65EDT+/a2OEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75yDB8dNxubumROkHf+V4tVCUw57HtyIaAiia6Di6FI=;
 b=nUWTEtfmx6t3Tw2jN46ish+6PCcjj7JCswiJsaxcEUkVDafIk7BmxGgrCKkZhNNNDX3aHt9FkT+QkVbZOPNUM+6fnpPKMxWhSoJ92/QFlUVR4YmjNHWjje/528JV596UyEfR3wxLJlB/hoQMnTJd/zBYTf7mHlNIjOd1frgivS+wl3CrTZnkulPfcMXDzfCnSG6yZWdVMrw4RiCx8rkVXekFBuDdO6PvndlJ76PRvSrCXve8vE80+ahBGbvTzo8LDYLsCmOLfGhq8fWWMkUfpLD9GsemD19Hn1FfoM4Q83dBXoGN18oQl58jbE2/LrQPEJSzv5uXPIEiWjebGODJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1.1 5/5] tests: Introduce a TSX test
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-6-andrew.cooper3@citrix.com>
 <20210614104716.23405-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9257fd40-65cb-8b08-7639-00b15dd0aba4@suse.com>
Date: Mon, 14 Jun 2021 15:31:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614104716.23405-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM8P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3e1599a-936a-4df6-7b1b-08d92f38b3bd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3776:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37768BEFEF3FE5EA5C605D3DB3319@VI1PR0402MB3776.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YIu57ASIK/PwzdaaNuc3QPW6izB7aradumVYLSDbDoL1wG13n1Gg2gPlCC9v0ykdUesrsgG5m+TdrFekU68YsIG00fhFuI9y7lNHvLHRSrOYgADUVlAQH9aBuhHXxhX48go78TFWYec2fO2tDaCQuGSxMcrjUsaZWr5YjMQqS3s9ggyxfCMSvnGKZFmMYBuqQQZDhYZzxPQWjijizdTHMqQOdTNMwh5oiFldzlbxbO60tDja3u87y01dtOWvV/DSWJZa5BM/WK0Ax9sXubqIgJfmUDb4jqWCqWqfkkrsxx9WhlNEwe/8EfOXr6KStR54Y13VZHDARQ1/oXLROIzdboP17XswH1AuqLKWQ9Ge3NRP8yd/NFaAPiAICVQDTM43Mt/pVKH8NO3T6Hz1zpfMn2INlwQ+7+Z2+38TpvqMBv/0+PUnjEpnOtg8FIq/U38gExtPdxde/cMH4MurDRnuBfBbo/OI5Tq3HZu72iYzUbb2TlAF7Gu/q1PTe1gRqa1tSikKg/xscgvByUedKdUopBSaDXfYD3sAzLvfuFWy/j5GFj0ccbidqnYZS322g00arLZq4Lqxdz6BRf0jyip/jwAZD+QW3AVPCZkb9Z8s8AhK3zt/k3PL12fKCQFG3kyMReNJ6YG/dV/wJ4Zq5sRGbHXsHXv+88+34ZSm9WkmCBxtGK7M3MJn/opNeABYOSqZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(478600001)(4326008)(83380400001)(36756003)(6916009)(31686004)(6486002)(2616005)(956004)(8676002)(8936002)(2906002)(53546011)(5660300002)(54906003)(6666004)(16576012)(316002)(31696002)(86362001)(16526019)(26005)(186003)(66476007)(38100700002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2RTUnE5dzFDbkR1WFhjaEJSdkxOREpoUmdOaTMyOEJwTUVGNlRhUjFSWGFs?=
 =?utf-8?B?RWNad0lRVTNKRWNXVFc2aHdPQUUwM2tCNFJhcm1hMWtPMUd6UllNb1EwVHR5?=
 =?utf-8?B?K3BVcGxOMGo1MkMxSUQrRjYwSVdQbndSTFdsa293cHM1TzRJbmJYdzFuRzVH?=
 =?utf-8?B?MnllaUdBTjV4MWJqaHVQdGxUZFI3QXcyV085MjZwcVkwSkFSQ1o3ZktrMUMx?=
 =?utf-8?B?UDVwZGpuMFEvVDc5bHJyaG1rQ2diUC9mWWdWVkd4OXFSbTFKQjF4TjlMb1No?=
 =?utf-8?B?RFZwQ2FkeW5GRnBhRkNvVGl0clJ2OGROYm9PUjkyUHB3OFV1MzRyaFF4a285?=
 =?utf-8?B?L2FrZXk5SEtySE1IVE9qdVBINnVmRHM5aEdxeFNWY0F6RFFVYzhPcU9Hb3d6?=
 =?utf-8?B?UjFIN0M1N2doV04zd2VyQW85VUU5bC83c0VpZURZcWNodVpoWFpIWEhBRTdx?=
 =?utf-8?B?K0xWY2dTQ1FrVThSbHphZ1B1MnJrZ1Q3RFl1R25hZVpRK2grWkxlVTBwRHU4?=
 =?utf-8?B?RW5MMDU0ME13SUJpRmE0R1p0RzNCTlJSNERRMithWGlYMmhqQS9xWkZkUU80?=
 =?utf-8?B?TTloTnRXYk12ZVh6K0VWbU8vT1IvOW8rRUhWdmlEL1I5Vmo5aU1LQTI3S3li?=
 =?utf-8?B?VFE2am5GWVdOUVBZZ1VLdUhNaE9UTTI2WEJDLy9vVU1OY25uRHpSR2JvUHdu?=
 =?utf-8?B?VlJmOVdkQm83eCtSMjZkRlllSzdHZTJGNU41MXhmRDVaanpBRUNLZEpoZ28y?=
 =?utf-8?B?K24zVGpHMmpmcEx5VTNHcW0wb0haMXpoRE9xOGY5bVpzazRVSzRIN1Jtb294?=
 =?utf-8?B?c1N1VHV3RTFENDBxVlJBL3VGaWRkTTN4ZUcrL1FIR2hNZSsrUE9ORGVyV0lQ?=
 =?utf-8?B?ZHh0VE5SMGw4Rnp4LzVOV05uSC8vOTgyWTg5bzZncDI1bUx4Rk1sMUd1bmZN?=
 =?utf-8?B?ZW9KMVhjR2lqa24zUkRaNi9NOVBnWUFDdkVoWGo1dDlHQXR2bkdOR2VQcERW?=
 =?utf-8?B?bC9HR2lWajYyZjNJWHY4elA2amswNHZWeXNKU3R2UWFYUFFDeHdtaE9ZaGlI?=
 =?utf-8?B?WFNTMjRlcFlzOEFQdjc4RFZWSFJMU2R2d0l3cldBaWp5MkFheXNPVm9sZjh5?=
 =?utf-8?B?UFd1YU9POCszWkNTRXBqVzVDZEtYQ1pSWnUxWUdPSjRKTk40anFnS0drdU1u?=
 =?utf-8?B?cU9mZEszcjZrSytKbG5yZ3RFb2pJWmJZMkhJV2dvTlA5MCtkWnlMNmJ1Rzdt?=
 =?utf-8?B?WDl3R2xVZzRrQ0R6T2NqUm83a0MyV3A1cHY5cTJvengvVStkUnN0UXkrVENF?=
 =?utf-8?B?NER6NjN6Qy9MTDNpcVpKRVFtVE9lK2JGbEF2M2xqenFpeU94dmtjUHJoMXFj?=
 =?utf-8?B?a25oVGFhMEMxOGhZcjZqdE9SZCs4UUNmNFR2Tk85ZE85cGxvaEN4UXh3MVk1?=
 =?utf-8?B?b2E4b002cVUwR0FDeURyT0tDQWlZb0hjNWFEUytlSjZKNDQ3dU9YTHFQSjNs?=
 =?utf-8?B?YkFIWWtmWklSa0FaOVY0Lzk4cStUVTIzQ2RjWWNwUDJ6RERLK2I1WmVIcHBx?=
 =?utf-8?B?N0ZTemhISUYyRnVLSUxNOXdwZ25yRVAyaFBuaWZzNElSREliYS81VXIzTDll?=
 =?utf-8?B?MDYvdEd0dGZZREJDenRIR1luS0kyRU1BMklXREJiN0FYLzJsekpYQi9EeTJu?=
 =?utf-8?B?WHEzVm96cll0d2JkbkpGd2RnWE9wNjF4MldZZW5ma0wyZGFpcVhLWUF5US9P?=
 =?utf-8?Q?vHm4boh8KP2L+KXfaYAcM6j55lmdoxdlseXp2tV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e1599a-936a-4df6-7b1b-08d92f38b3bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:31:23.0848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bBhy7YdCBYk1HhCiZxlPOC4gJnPkutDiysv2RDpLVZcXh3k9It7Topjap+OH4ZqjkcjRJEtXhckTYysuTEwWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3776

On 14.06.2021 12:47, Andrew Cooper wrote:
> --- /dev/null
> +++ b/tools/tests/tsx/Makefile
> @@ -0,0 +1,43 @@
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET := test-tsx
> +
> +.PHONY: all
> +all: $(TARGET)
> +
> +.PHONY: run
> +run: $(TARGET)
> +	./$(TARGET)
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -f -- *.o $(TARGET) $(DEPS_RM)

I'm surprised this is necessary, but indeed I can see it elsewhere too.

> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -f -- *~
> +
> +.PHONY: install
> +install: all
> +
> +.PHONY: uninstall
> +uninstall:
> +
> +CFLAGS += -Werror -std=gnu11

Is this strictly necessary? It excludes a fair share of the gcc
versions that we claim the tree can be built with. If it is
necessary, then I think it needs arranging for that the tools/
build as a whole won't fail just because of this test not
building. We do something along these lines for the x86 emulator
harness, for example.

> +CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += $(CFLAGS_libxenctrl)
> +CFLAGS += $(CFLAGS_libxenguest)
> +CFLAGS += -I$(XEN_ROOT)/tools/libs/ctrl -I$(XEN_ROOT)/tools/libs/guest
> +CFLAGS += $(APPEND_CFLAGS)
> +
> +LDFLAGS += $(LDLIBS_libxenctrl)
> +LDFLAGS += $(LDLIBS_libxenguest)
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +test-tsx.o: Makefile
> +
> +test-tsx: test-tsx.o

Wouldn't you want to use $(TARGET) at least here?

> +/*
> + * Test a specific TSX MSR for consistency across the system, taking into
> + * account whether it ought to be accessable or not.
> + *
> + * We can't query offline CPUs, so skip those if encountered.  We don't care
> + * particularly for the exact MSR value, but we do care that it is the same
> + * everywhere.
> + */
> +static void test_tsx_msr_consistency(unsigned int msr, bool accessable)

Isn't it "accessible"?

> +{
> +    uint64_t cpu0_val = ~0;
> +
> +    for ( unsigned int cpu = 0; cpu <= physinfo.max_cpu_id; ++cpu )
> +    {
> +        xc_resource_entry_t ent = {
> +            .u.cmd = XEN_RESOURCE_OP_MSR_READ,
> +            .idx = msr,
> +        };
> +        xc_resource_op_t op = {
> +            .cpu = cpu,
> +            .entries = &ent,
> +            .nr_entries = 1,
> +        };
> +        int rc = xc_resource_op(xch, 1, &op);
> +
> +        if ( rc < 0 )
> +        {
> +            /* Don't emit a message for offline CPUs */
> +            if ( errno != ENODEV )
> +                fail("  xc_resource_op() for CPU%u failed: rc %d, errno %d - %s\n",
> +                     cpu, rc, errno, strerror(errno));
> +            continue;
> +        }
> +
> +        if ( accessable )
> +        {
> +            if ( rc != 1 )
> +            {
> +                fail("  Expected 1 result, got %u\n", rc);

%d

> +                continue;
> +            }
> +            if ( ent.u.ret != 0 )
> +            {
> +                fail("  Expected ok, got %d\n", ent.u.ret);
> +                continue;
> +            }
> +        }
> +        else
> +        {
> +            if ( rc != 0 )
> +                fail("  Expected 0 results, got %u\n", rc);
> +            else if ( ent.u.ret != -EPERM )
> +                fail("  Expected -EPERM, got %d\n", ent.u.ret);
> +            continue;
> +        }
> +
> +        if ( cpu == 0 )
> +        {
> +            cpu0_val = ent.val;
> +            printf("  CPU0 val %#"PRIx64"\n", cpu0_val);
> +        }
> +        else if ( ent.val != cpu0_val )
> +            fail("  CPU%u val %#"PRIx64" differes from CPU0 %#"PRIx64"\n",

Nit: differs?

> +/*
> + * Probe for how RTM behaves, deliberately not inspecting CPUID.
> + * Distinguishes between "no support at all" (i.e. XBEGIN suffers #UD),
> + * working ok, and appearing to always abort.
> + */
> +static enum rtm_behaviour probe_rtm_behaviour(void)
> +{
> +    for ( int i = 0; i < 1000; ++i )
> +    {
> +        /*
> +         * Opencoding the RTM infrastructure from immintrin.h, because we
> +         * still support older versions of GCC.  ALso so we can include #UD
> +         * detection logic.
> +         */
> +#define XBEGIN_STARTED -1
> +#define XBEGIN_UD      -2
> +        unsigned int status = XBEGIN_STARTED;
> +
> +        asm volatile (".Lxbegin: .byte 0xc7,0xf8,0,0,0,0" /* XBEGIN 1f; 1: */
> +                      : "+a" (status) :: "memory");
> +        if ( status == XBEGIN_STARTED )
> +        {
> +            asm volatile (".byte 0x0f,0x01,0xd5" ::: "memory"); /* XEND */

Nit: This otherwise following hypervisor style, the asm()s want more
blanks added (also again further down).

> +            return RTM_OK;
> +        }
> +        else if ( status == XBEGIN_UD )
> +            return RTM_UD;
> +    }
> +
> +    return RTM_ABORT;
> +}
> +
> +static struct sigaction old_sigill;
> +
> +static void sigill_handler(int signo, siginfo_t *info, void *extra)
> +{
> +    extern char xbegin_label[] asm(".Lxbegin");

Perhaps add const? I'm also not sure about .L names used for extern-s.

> +    if ( info->si_addr == xbegin_label ||
> +         memcmp(info->si_addr, "\xc7\xf8\x00\x00\x00\x00", 6) == 0 )

Why the || here? I could see you use && if you really wanted to be on
the safe side, but the way you have it I don't understand the
intentions.

> +    {
> +        ucontext_t *context = extra;
> +
> +        /*
> +         * Found the XBEGIN instruction.  Step over it, and update `status` to
> +         * signal #UD.
> +         */
> +#ifdef __x86_64__
> +        context->uc_mcontext.gregs[REG_RIP] += 6;
> +        context->uc_mcontext.gregs[REG_RAX] = XBEGIN_UD;
> +#else
> +        context->uc_mcontext.gregs[REG_EIP] += 6;
> +        context->uc_mcontext.gregs[REG_EAX] = XBEGIN_UD;
> +#endif

At the very least for this, don't you need to constrain the test to
just Linux?

> +static void test_tsx(void)
> +{
> +    int rc;
> +
> +    /* Read all policies except raw. */
> +    for ( int i = XEN_SYSCTL_cpu_policy_host;

To avoid having this as bad precedent, even though it's "just" testing
code: unsigned int? (I've first spotted this here, but later I've
found more places elsewhere.)

Jan


