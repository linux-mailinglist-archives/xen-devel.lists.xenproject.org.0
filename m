Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2D3BC167
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150472.278217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RAC-0006Ll-5I; Mon, 05 Jul 2021 16:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150472.278217; Mon, 05 Jul 2021 16:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RAC-0006Iz-1m; Mon, 05 Jul 2021 16:09:40 +0000
Received: by outflank-mailman (input) for mailman id 150472;
 Mon, 05 Jul 2021 16:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RAA-0006Hc-G3
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:09:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2648351e-e4d4-447b-9e30-6bbd54dd1573;
 Mon, 05 Jul 2021 16:09:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-PRlD6ZXqMw-ewHfLXKsgHg-1; Mon, 05 Jul 2021 18:09:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 16:09:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:09:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:09:34 +0000
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
X-Inumbo-ID: 2648351e-e4d4-447b-9e30-6bbd54dd1573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y519G2kPDVMzATqyC7RjCSlK3dqw0cUbYWZl2eMBtQs=;
	b=KDpeV6GW/bMOoOD1k/8gR0VhncPpMA0wtT5ialf2U/LGh8ziTjxGKZ2DyQ/OfWWLEYAHKn
	BrQDYSixHbPYt/w3U+jq3rIsI1MrU181UMEk6XbXZzBna5Pc9VuFPTNZTxPAA43dgrw7Sk
	8a+zQoUREfxVkwaLMvfXQ51EcqgB0rQ=
X-MC-Unique: PRlD6ZXqMw-ewHfLXKsgHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJdjbEC5SB16phTMi/MrUCGzUiYVJd4uQX2zRH+NJtrdkLVxLUnHWAXh/8e2s69G1totuRJt2GmPJKworjtUyQgV1G+TkZPJkJcbXaCDwhrzS0kY4MAGoOYgQEnTf4YMczbRuPTQF6evL+bhMFmYIrmEw8VQgDIkAWFWOx/yLjMm9mbvCv5WT10IESKL+vkQVA9kcJfyCU2x368fjCCyloN6ALzQ3/RhTY9XTFoT6cKpNZR728a77K5Za5qrQsPDaNBd9gk8UUsqzX0Xf5DFbj+8BdhQcx0yvuPfFyKgciIAKpO9og0+Ve92BIW0qz24jHat/RpBlMXIL7Ez8OxWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y519G2kPDVMzATqyC7RjCSlK3dqw0cUbYWZl2eMBtQs=;
 b=R3r9ck0aSgjbU+5YnKfVp4jm+EBKwVav06ughNPFLddzzCjjXeEEnqCS+bHlcmyCUKLc3yxDll0SyrrOijxCOvdFv2qJS/ewPVZOcS13qs9djGFPFK41s4re75ZrRYtndpTDqI3x0+GfVJCicbGIhQ+fX1/LkABNB2Ujch85W5wmfPP+TzEMgb/Uy3Gk2BcZmB+TI6HlubhxaP+GwUmWP28HHztVXBxKuz+QSYazuknEAvZdKXr2eEvYC3hb6/AhUta2rsXo323nKPexpTHQaGeCvhrEnJjLl0OhG4iwFM+fUuiEGSJVyT4ddevpJyEPo0wSqUlM/uJfiAIhxaLtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <694a6590-0018-223a-c796-3e1469ec354a@suse.com>
Date: Mon, 5 Jul 2021 18:09:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e302bb8e-d98c-4ade-d562-08d93fcf47fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293AA5D31AF6473AFB5DAFAB31C9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ydcXRPs2clSuuB5QbUaMYADcAxwhQv9YM0i9FIHTVyVPenHCNJtbMH5x07YXfos5mu0S/nm9j39D3MbmeTuE8+jtxJUboTQIreFoGFzJbpA4PqKLQ5vXhCe71enCsydtk9ptQ1rfa8xWBdWFeR9gQ9d5TmzC16AA4qn6OTxQ0hfNQZd+QOgMbAmMukqzuXLINgCJTkph0ATtFpF++CgYY5VQNzbRKp/zDbbToM9LxT6HGrGXlmFY8YIvmPp8/lji8qWsnN+r8hCJYeCsgubeJ/8xS7Cs7HTzNl7/r6v90njsWaC3yRSF/v8uKHyo8CjHWrKYETiz1le4ybWT5rtVTMUeUqiOEtXRK4LHxQuE8M764Er6mrYoaw7lPhSdPzgY1rSzU6Iuj5XsaV6jcXlLtNKfowUmsyP8e08ZqSSUZECpOOp9iZfu9jgqK2/SeGwn6enqSTWnT99XgNWML2faktxGrOyWm/ljxtJM18u9IX4gtS3GvoUpGFa2NjWbZT2ucCxpwL1s2iOWeU9weUcEHVOsBd9/q423dsUmiz735kbeTEBRH6zIBCKy+NrZbTi5Mxzg32qx2v0BVQ+yeZ5V1syDbBBJ1WJZ+39pijxhFgh8EUh0ufYT71Z4f+mOZiqmULScnyEzfel3ZAsheIo4vClJqPMCuriDtfQVWQzbx1deF0BPHAkFZZW+ApjH5mz3h1oQ/4gT2xnPvr0jF8J4zrpIeygEsEiQpz9JUAGMd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39850400004)(5660300002)(316002)(956004)(66946007)(2616005)(16576012)(26005)(38100700002)(186003)(66476007)(66556008)(2906002)(36756003)(16526019)(86362001)(31686004)(6916009)(54906003)(83380400001)(31696002)(4326008)(478600001)(6486002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUhqcFRXRnNlQWxGRW9WUTQxVm0ya09qUS9HUVRId0VmSHF2OFFlSGNSVEkz?=
 =?utf-8?B?dVVDV1FTTGw4bWtCSFdxWTZQWHhnTG51NE56L29aK2tVOGthNk1nLzVzZUNH?=
 =?utf-8?B?RktSMmpNVFkrY25WTnBRdUFHZU1WaE4ydGkwYzRuVUpzWFNCem9yWmw5S2Ns?=
 =?utf-8?B?N2hLNkhDT0F2V0VtV20xdWdXY2pIRzdEek8vSnI1TEg0djlvWEZRVGFtRlpy?=
 =?utf-8?B?N3ZKc29nY1h5eS84RTVxNGJCUDFJMm9GR3c3UEovOFFxcDVxLy91YlhUOFNH?=
 =?utf-8?B?Ny80NUR6cmh0ajF3dWVyU25TV1BITlpNU2NYcWlYenpNVzkreHd5N3hudGxw?=
 =?utf-8?B?cS9USVUwRDFnZzNGRzZwME94VTV1OHFhelNVaTJMbjRZTkp2cENSbDNNcGl5?=
 =?utf-8?B?dUZaOHhHQlEzellPL1A3ZHFmOFBMd2FJd0lTdndTZDd6Vk5reFl2emRseXVC?=
 =?utf-8?B?S0E5RngyKzBYRXlWcks3U0FKNThjUmVld3Bpd0U1U2VLVHNac1BGQmpsaEFI?=
 =?utf-8?B?T0ljcXAyYURVTStKZUM2QS9aUFdVV0NCcTFZWk40Yy95V2NEMkYvbWNWWjNy?=
 =?utf-8?B?ZzJ0bWhMQ05PK2l6L1EzcDd3U1p3bnBvMklqTmFHYTViMTlZaWVmZlhqWE5t?=
 =?utf-8?B?aFpLem9UTDhLSVRpZnpseEpSbWlxbktlY3lsMjlqTzlYMmhobzY0dXlJT0hC?=
 =?utf-8?B?MG1kbi9sbXRwK0ZOb0ZZdGxXOXFKdE0xeE9RUjJuRndOUUhwWisrYjZ3T2pX?=
 =?utf-8?B?b1R5d0J2Szd0TjhOTGdLeEV4QndFM01jZkoyUEZQNU9xRDBzelREdE1KcmM0?=
 =?utf-8?B?Q2d4YVVLQUcwNnl1M1dRSmZVRm0xTExxbEcrQkdsTmFPZEZkSlJTWTRRT3BY?=
 =?utf-8?B?d3JWdXB1clZoQmsrM2lCb1pMUDlpa0Fka0R0ekkvbjZ1a25VY0IxVkpEZEoz?=
 =?utf-8?B?YWRybGJsSE9aMlZTYTJ5L28xVm5RcHJqcFQ0M0pQeFFpbG1Kb001NzBoSW9G?=
 =?utf-8?B?ZHYrSjZBbExGL0xQZTFsZUNCK05KekFDcDNjQjIzcnFpQ2k5ZGl2dC91Y1Z3?=
 =?utf-8?B?K0dPVy9VYjRHc1ZqZnpBZjJVdDJ3SWs0RVJrZ1MyWDQ0SVBwR0IySGZQRURF?=
 =?utf-8?B?NEdUZVFJMHB5TGwwVmhYNmlBRjRJRlN2ZjFZQ1hIQ1o2bmZjMWdkR0ZVdzR4?=
 =?utf-8?B?Y1Y0L1VHLzdycnhEWnArRzdMTkFnVEsxdlZXb1p3N0tobEMvbzVWMytmakVR?=
 =?utf-8?B?MXlsUWlRelFVK2s2ODlLQU53TUR2VDRNQWJRM1VqbmZ3ZHRrNGdlWWRqTUx1?=
 =?utf-8?B?OWRYRXN1WXJKRkJ5b1Uva2FwL2FMeW1CWExZWGg4d3Z4eUU3bXV0c2p4d1ow?=
 =?utf-8?B?Unh6dHFaZTZ2bTJkRHRDWk5pNGtrZ0luQmQrVVV6bVNQTnNSNk1FNFdsTGow?=
 =?utf-8?B?dzZMalowV0xrUUNTb1ZNZ0RsaGxWbU5HdjM3UkJONDlOeVkrQS9oZTZudk5x?=
 =?utf-8?B?bGJrR0FpcHVxQ0lhNEIrSGFFdy9aejVmek9kTUI2blEwVEdQNkdTeXBJaUw0?=
 =?utf-8?B?azAxL3E4NmU5dS9RbHd5QXBFR2VXV2RYQS9vK1puRllBUGg2elRxUWtkTnhW?=
 =?utf-8?B?NWJkQWRvcHZwM2tzWE1lTFR5cmxsbUpzR1BvOUNrSEg5Y2d3TlNRT2FVaWZG?=
 =?utf-8?B?OW4zOWZnVmozanIrem42dlY5UFMwWUJyNCs1cTRvclhuMHFDL3EwQ3BMSjNZ?=
 =?utf-8?Q?gdT5tag+LJ6pNxD+9SXX0dHnbPMrsMAvkW0p+at?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e302bb8e-d98c-4ade-d562-08d93fcf47fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:09:34.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXDI9Ms6SN1FjMQOc+eRrKRqZ0fZwWW/D69fSFEukTyyNdS8eV8CGQf8Srbk00XFOzkqXL/MhcWNvTttUJ3nqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

There's no need to initialize respective data for PV domains. Note that
p2m_teardown_{alt,nested}p2m() will handle the lack-of-initialization
case fine.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -102,6 +102,9 @@ static int p2m_initialise(struct domain
     p2m->default_access = p2m_access_rwx;
     p2m->p2m_class = p2m_host;
 
+    if ( !is_hvm_domain(d) )
+        return 0;
+
     p2m_pod_init(p2m);
     p2m_nestedp2m_init(p2m);
 
@@ -259,7 +262,7 @@ int p2m_init(struct domain *d)
     int rc;
 
     rc = p2m_init_hostp2m(d);
-    if ( rc )
+    if ( rc || !is_hvm_domain(d) )
         return rc;
 
 #ifdef CONFIG_HVM
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -17,6 +17,8 @@
 
 #include <xen/mem_access.h>
 
+void p2m_pod_init(struct p2m_domain *p2m);
+
 int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
                            p2m_access_t p2ma, unsigned int flag);
 int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1135,6 +1135,12 @@ p2m_pod_demand_populate(struct p2m_domai
     mfn_t mfn;
     unsigned long i;
 
+    if ( !p2m_is_hostp2m(p2m) )
+    {
+        ASSERT_UNREACHABLE();
+        return false;
+    }
+
     ASSERT(gfn_locked_by_me(p2m, gfn));
     pod_lock(p2m);
 
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -679,8 +679,6 @@ static inline long p2m_pod_entry_count(c
     return p2m->pod.entry_count;
 }
 
-void p2m_pod_init(struct p2m_domain *p2m);
-
 #else
 
 static inline bool
@@ -709,8 +707,6 @@ static inline long p2m_pod_entry_count(c
     return 0;
 }
 
-static inline void p2m_pod_init(struct p2m_domain *p2m) {}
-
 #endif
 
 


