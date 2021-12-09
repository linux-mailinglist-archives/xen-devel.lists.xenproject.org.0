Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF546E795
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 12:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242963.420178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHaO-00017c-O7; Thu, 09 Dec 2021 11:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242963.420178; Thu, 09 Dec 2021 11:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHaO-00014v-Kz; Thu, 09 Dec 2021 11:27:40 +0000
Received: by outflank-mailman (input) for mailman id 242963;
 Thu, 09 Dec 2021 11:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvHaN-0008NH-1v
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 11:27:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03846458-58e3-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 12:27:38 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-VYKA4X3vO5iA2lAuAVi66A-1; Thu, 09 Dec 2021 12:27:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 11:27:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 11:27:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0110.eurprd04.prod.outlook.com (2603:10a6:20b:31e::25) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 11:27:35 +0000
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
X-Inumbo-ID: 03846458-58e3-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639049258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGYaCIoX8o17jAvi6lqGRSDxKlq7w0w9+/u0S+y8TUY=;
	b=LpmBRYfHE9dlNFkoKCcGzWb/N+7S6PyZBzi4bkAs0oya5psLRT3tHiVjIEBGQcyHFvjYHz
	/rGuQ1XAHDrAJo9kJzytiFuk2qxmSrA2e0Modx6IJ+GMaUUCEKycVxZ3SJxRxX7pQkKkNr
	hI+DJicBNs4IgXpeshVljeEmSh7DXVs=
X-MC-Unique: VYKA4X3vO5iA2lAuAVi66A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjoAZPmqG+pv6U9nklnjxWqnJzQv52jxnmYNlegPep8wf2uCNO83OThmM07xhTJLw+0KnZWRF0Dkz0IjzB6hpUWmpnaVCYN/UVFgmhJrc0u/TWgCnetrh/tbcQ6dSxwF43MKys4YsxAq6bEIGyhdWoudDqVY6xgiw8TePjB1nMvrpOvTNE81E8aQB1qv/L5NbWbNUAew9rhwfltLmljSJ9fHwbltUqUOVl6JSWHpYSHKXnb83hsbFv3xFA5JnBNEaNpl6QM3LE0E274PJ/dFlJ+eQWmZt+KaPw9jtB4veOYMm873t0mLouBaSCGEjdC467gVPaZZkhYe+bPCwThAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGYaCIoX8o17jAvi6lqGRSDxKlq7w0w9+/u0S+y8TUY=;
 b=NdGhAlttJ8jswFnLRbn3/OjniGL76ExAOxLXW+IM8V8k+WWOP6eCqC3pbFM2q5oAOtb06preUTciJa0TVDU/t+GypFRiuiM18ElMo2j1524l/OcIzHWJLnzGNtp65kcBuWCV5TJfgWWB+jPPF223sKRXbahPko/8nMF/GJuwQ6IhpIam/zbObX8joxBfYoNPpa54sWaeQbrdsSVewLmcpIW3C5+6Tc4dqe6BYMWivsYy2GLMt3vHL1HTmBGc7vRIKaoj/Bg1O0NTLGVOCgpER8ZyBb98YtJqKCcOHyt2HPaZKW3oKvmifXbAvTopYjpBjpxYmnLF/T7coGQJI46yCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a80d08b-edd7-43c8-a7ce-42eb85d6f3be@suse.com>
Date: Thu, 9 Dec 2021 12:27:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/2] x86/P2M: allow 2M superpage use for shadowed guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
In-Reply-To: <9ae1d130-178a-ba01-b889-f2cf2a403d95@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0110.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a7c507-f9e7-47fb-0677-08d9bb06e644
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB311805AAA8CA3E8777AC1946B3709@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Ddf4NkC3WweEEXsO3Now6w19yOLwvZzTdfmecDSZBVidkqKb13RAH5BUex3c/e9MVBxrtnN4a+BlHAy4bBgfUjaBtcEs0o/vnWGCRQU29S1zHJazn5gU4bBJFhxN0sJcRSNB2k27iUo1AWylj02UgobcFoc/5pKJckqRv+EB7uxNhHb2N81KLsizPXhKSaID3Qw6S3Qzf9+ovl7C5I4YUtdjnydxNblttyTAutzzQfIxyVKW0uR3wOqgNgPwOZWLN98+P6pdDezxsYdFy9A50mWy/1dp3eVP7eF5m0q7oTqm1V208Q8Z95F+UR9hZlF3xT51sC9iRTrzx6mhOBYvZIsKVs8HVomVx9Vbin7nbW5Wv59auxPtMNd+/z6UBQZducpy9iXYHDi1XzdBjKD7ND4/XMLmi6yC5yoSRzj1AU19p8SpGbs6Zdb0HdESUv2WnJiF47G9HXaPEKEwuaMy7DAQrzxbAwiagYQ5wNizx9t0Zju9R45lMMwzsUpM3Oiqw6d1GHeAah+zFVM8962p7A67gUGvWDJyAyNUks/Ij4WQ0VJJtfQqK/4CYva1RTzeCGIFDjF4EQRjXUpgoP3GCylCNwvVY0VDsmsdnXcJqCwwizAo7x4D6P28x95w/akeQKWQCqhN9YzgoUVANcCCBFnJcNQNNBWCavZC/ls2QR+sT6aNwov7NTEQXTWhOBwMUx8skDWbJE2pPoOTv5T/ocdZxnvh2g/De6zLOE33B8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31686004)(31696002)(8936002)(6916009)(86362001)(5660300002)(186003)(36756003)(4326008)(6486002)(54906003)(38100700002)(316002)(2616005)(66476007)(8676002)(26005)(66556008)(16576012)(83380400001)(956004)(66946007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjcrelZWNUpNUDZUNlpJSE1MbWRRZ3NKK2ZuTUVCSEdrcmR4YVJ4WDJvZzk2?=
 =?utf-8?B?UkRGRWNVdFc0b25Cc0k3R2srbVhmQVh1QnY3OFkwdndKclBYRWFIVHpXRytr?=
 =?utf-8?B?NTNJZDMxNStaK3E4b1lzaktvM2NSQy94bkk2OTU4SzFvWktlcFE2cDJ3SFAv?=
 =?utf-8?B?akxyR1U1Z2ViQW9WUHlVd2pPNjBMemdLakw1K1VnaUJaN0RRTVlCTVVJSlhv?=
 =?utf-8?B?YjZsazQ2enFZS09jY2hET3lvVjMvUEw3bjlGTzJ2SlR0a0RGbGZJZHVBaXlQ?=
 =?utf-8?B?cUlDVUV6S2Vnc3VkcngvcUlzaktENXRGd0NJbm82TWwwUW1JYU1DR012TTBU?=
 =?utf-8?B?WFdrM3FRQVZORXpXQlpCQzl0UE5iY2tTcndvek1ZRkNiUnFPK2VRSHlqZjlV?=
 =?utf-8?B?QUFrSjRDUjRjMUtucENpL3k5KzNrWjVnWlFoV01TNSs0UzJGcUk2ZWpnR2JE?=
 =?utf-8?B?aEd1MTd4TXp4OWsxTGFkUUpUUjlmWndmcXVRMG4yR0dSb0xTN2xVa1JEU3ZT?=
 =?utf-8?B?cjJ6KzJaMER2aGkvMnNUYlBLdDFER3pReFdqdkh2WVI1Vm9sYitLZHVzUXdv?=
 =?utf-8?B?QW56YnZuRWJtT2tqci9ld3JTRUpTVTlkVE1NeDZ5SFdSazdaMndqamoxQUhr?=
 =?utf-8?B?ejU0TEVDWSswUTBHNjg4dDgwRVJ3VmJsSnBRaHlqalc3T0hSQWNXczZ4Lzdv?=
 =?utf-8?B?R3psdC92TkhsNnJRcllFMS9NMGdXMHVGemZENzF5cjFmN3RheUF4YXBkSllt?=
 =?utf-8?B?d2MyWk1yL2tPK05kak9UczlZTFRxQ0c3NVBRV1RMK0pSRThhbVRDeU5mMkFP?=
 =?utf-8?B?LzczNGxhVTNxV042cThsSEJuVWNUc3B2YllUaHMzaVZwUmJkdnA1T2dkQlY5?=
 =?utf-8?B?QlpjdTRZazhjbjl2Wm9IVVI5bklxT25IYnVpRGRob0h1RFFmcHNNT1JkbVV1?=
 =?utf-8?B?cnl0MEVOTlh3T3k5b05qRlhIOE9YbXVkLy9yK3NCR0lwSTdmWHFuSUJoNFk0?=
 =?utf-8?B?TWk3VmJvU0JhQ1VFQVBPSERGV3JYVjRzdE50V3YwMUlBSHNkMFRZZEpWS0NC?=
 =?utf-8?B?ei9tMFVaUURtM0M1TlNXQVY2NmF3QkRyMXhKZ1JuR2lLVnhSZHd1K09JVkQy?=
 =?utf-8?B?MWRJQnNjTE1hVTVmVGlzYXFpdWE2RXJMUnVKbWpLeFRMQVNwZXpLVWZiZXJj?=
 =?utf-8?B?YUpDZklEbkhRRS9saHYrbUNROHg5QURZM0NFYWRiaWlwQVl0cHovRnNwSHVE?=
 =?utf-8?B?R1pVak5TMHZGcTJ4Ti9SK09XRERDeHdXUUhHZW9RejBCR1N2UGcxR3JQOSts?=
 =?utf-8?B?c3RCdmxSVEVSV2NDM0FqU0lWNTVBUU85UmVzSndtRWtDdm96ay9xREhrK3Ey?=
 =?utf-8?B?WFlQSnFHVkZuekFScFZyM0J6MUVxTFVCUkhvcWNsdFVmZDA0U1huRis5aDU2?=
 =?utf-8?B?SCtFS2YrdkszS3oxUDNNM2JIUXhMbmJoL21DS1RydVBHVHNiS0hvcE9WVzk5?=
 =?utf-8?B?bVBscm1CTnU0QUJsYUlraXJxbzY4Z2x3bEtuT3ZaNVA1dWpnNGNPSzlVamRO?=
 =?utf-8?B?cDVON0Vja3BHWEEzajBxK3cvN2pFNjdaWEQwNFJMM0hhdXNuU2hOWG9kSmF1?=
 =?utf-8?B?Wm0rUVBOcXZPd2hodUswYzVwVWVtYVphK3dUeVZZZFBnSHlCS3hUc1ZSNFJV?=
 =?utf-8?B?eDY3YzFVWUdEYjhFWlhqUUJ1UUc1Ni9SMGNVYWtFWUdoT0RBeGZtdU4zWitE?=
 =?utf-8?B?UFJzcmJnR1BQQjAxSnAwMDVpZERyelpsVjJqTlFxRkMzYXRDcGlrcDZpSFg1?=
 =?utf-8?B?cEQ5U1RvbDI5OWoyUE9Fa3VBRit6UkdZL2FSMjNkeUtmNmtpNTlyeVkzTHlP?=
 =?utf-8?B?ZTI4cTB0bEI2Q0NqUTVjVTh0Tlcrcks1NlpWMU9LTnRUbEpzV0pVZW1BRzdw?=
 =?utf-8?B?RU9TSWpGNTdaOGdTQ2I5YzRoRlhHbUszTXphL3I4blNFb21OcVFmV0NBMTE0?=
 =?utf-8?B?ay95aHVpVFFNYlhGWWVpNjQraldDeWV4TGNyK2JqU3lsOWpIVnN6ejlFZmZB?=
 =?utf-8?B?UHNibEhlQlpXZlU1TDVHTHRBVTdJNVFwZStHdlhLek9qcVNmMUROb3BUSXlk?=
 =?utf-8?B?NHZsZFQ5Y2RrSFhjM0pyTzQvSWFhbG96SktSYlk2dU1XQkttanZ0ZXMzM3hB?=
 =?utf-8?Q?hGXgLOdS6ohNguSzHj4+dtU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a7c507-f9e7-47fb-0677-08d9bb06e644
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 11:27:35.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6tDBhLtaYt1+60rrZ2DFWCECzQsD/OpM4ooXK1xvB36xdUwqZHw1fXuCyLJVMKnCf7C7PhQHHtzE1GPWUMV6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

For guests in shadow mode the P2M table gets used only by software. The
only place where it matters whether superpages in the P2M can be dealt
with is sh_unshadow_for_p2m_change(). That function has been capabale of
handling them even before commit 0ca1669871f8a ("P2M: check whether hap
mode is enabled before using 2mb pages") disabled 2M use in this case
for dubious reasons ("potential errors when hap is disabled").

While doing this, move "order" into more narrow scope and replace the
local variable "d" by a new "hap" one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking "fn_mask" could also be "unsigned int"; I wasn't sure
whether changing that would cause objections.

While at least sh_unshadow_for_p2m_change() presently relies on this
behavior, it is somewhat odd (and inefficient) for p2m_set_entry() to
split even non-present mappings.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -631,28 +631,22 @@ struct page_info *p2m_get_page_from_gfn(
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
 {
-    struct domain *d = p2m->domain;
+    bool hap = hap_enabled(p2m->domain);
     unsigned long todo = 1ul << page_order;
-    unsigned int order;
     int set_rc, rc = 0;
 
     ASSERT(gfn_locked_by_me(p2m, gfn));
 
     while ( todo )
     {
-        if ( hap_enabled(d) )
-        {
-            unsigned long fn_mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
-
-            fn_mask |= gfn_x(gfn) | todo;
-
-            order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
-                     hap_has_1gb) ? PAGE_ORDER_1G :
-                    (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
-                     hap_has_2mb) ? PAGE_ORDER_2M : PAGE_ORDER_4K;
-        }
-        else
-            order = 0;
+        unsigned long fn_mask = (!mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0) |
+                                gfn_x(gfn) | todo;
+        unsigned int order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
+                              hap && hap_has_1gb)
+                             ? PAGE_ORDER_1G
+                             : (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
+                                (!hap || hap_has_2mb))
+                               ? PAGE_ORDER_2M : PAGE_ORDER_4K;
 
         set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
         if ( set_rc )


