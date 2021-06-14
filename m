Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884B3A6870
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 15:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141542.261416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn1C-0005sK-Ur; Mon, 14 Jun 2021 13:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141542.261416; Mon, 14 Jun 2021 13:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsn1C-0005qQ-RN; Mon, 14 Jun 2021 13:52:46 +0000
Received: by outflank-mailman (input) for mailman id 141542;
 Mon, 14 Jun 2021 13:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsn1B-0005qJ-0O
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 13:52:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ee17a86-bcb2-4d8a-8f54-4ca86d920634;
 Mon, 14 Jun 2021 13:52:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-016OOoopOMeL7U5QbbjGBw-1; Mon, 14 Jun 2021 15:52:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 13:52:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:52:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0068.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 13:52:39 +0000
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
X-Inumbo-ID: 9ee17a86-bcb2-4d8a-8f54-4ca86d920634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623678763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uHxN8njyAPbAT4wEv5MVDJ50g6OUZutBTJuMLi18sp0=;
	b=TI47cXuyyQTJ3kHP1fYLzfvRWjTR07wDez+cDvn1bnrNOd9wCwcjpt2Li0md6xpETIzyYU
	QXlvqa/Nc/K+ru+AZvM9kghhFL106Hr1d0eiF4WKbIIYene2FYa4f3poMdmagr5ulcir95
	dJLc0Ai1GZrIOzMHMA+3sdjwfqh4wkg=
X-MC-Unique: 016OOoopOMeL7U5QbbjGBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuivG3+pMRNI7/2IRkGMiKkkh3g6S7ofGoh3FAsA27KW4y6GM4kSSo4zDhAVh6ntipctTYV+agNesoA6wZB2Yk7FNNyTKCm2TF7NNaqY9/lZP/zqEFMiA1X9J4KZ3dPM0eeb/6PCpg3lBDO1UNJrI1sX9M8xi8E8VkZGqaccVLsdgzVgDolFVlT4M7hsFpGaJlJnu97/fDF+KJGwyOz3/+UKs0urSDibMPNw9F2w7cD1CqVeLzkWTwj9oNVygz/3J+sGMtlVjYwtJeM0lnctrfGn9XzRvFXjmRZhlGqLYQsSEFLPsTeTpWi/WxG2/o48COhS66gvQccqw+SZma/sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHxN8njyAPbAT4wEv5MVDJ50g6OUZutBTJuMLi18sp0=;
 b=D8/dHsAVr/d71EjHnzhp1TlodLXqmjGpuRPH9+gdd7+v726sjjRWtaPhtsTOkyi8qRZKFRvf+j/dTCc5vWjNtRky3HoUokJNDAhkEdfli7MC0+rxDvYhr9Csg7d1LG3JletjhgWWHANrmt7R4Ublm7Bf3V2Gf7nAlmpLNXag9ltaqdts3FM6q0LyimPVgk6nF4Z9bG00fJsl2bpCPmdlw231FF1ovg2U9BaSnpnil9oCHe3b3usw8vne0hu4n/7WnsMz7/z/rwaXcI0tfoRQKpp0Cw8Zx2SxYtcIvHUHPICSwzrCTCOmyhPHZmjBG3zHLHsuot45GP/rtCFBwQO9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm: avoid .init.data to be marked as executable
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <5c173e92-f615-c95a-21a2-5c894727414d@suse.com>
Date: Mon, 14 Jun 2021 15:52:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0068.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0b7af54-b7e8-45b8-d3cd-08d92f3bacf2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848CEE5AB322257F2A5F82BB3319@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ofrI9vD5JdO8gdRtsCPfpw5Udz7mc7aeBKdqfrG5J39Phl1utLLqGBldJDxng4IA3Xg6cXrORIbwXE8oCAnKubXkRWBiJzromETVDu2f81BYXoT2jb7o9aFIrVTDwlWfd3Deh7mRb52btaaPODBnc4Z8h4q3JYYdA6WUX8A0orTXlNbe1bQtv85IdolTMfVRNrfYrTbfVcU0ozh4yR8Sq+e66TVWb62SUK21XcaB8wT/ektq+TQljMWpRPO0LbQ6dI+pIBvS/MNy1vTJISMmvCkpmJ1UpLZOV3nX5kJdaKJWmQofIRnVVk4V0QMLX7ROtYjSXuYIzays2zCYDY/JwlGnmxtxorm7Yz7wpbmiChKR+pMnv6qYwSurSjm2RTjeZ2I8B5OQkVgOkm0v8/+44esgjCZJgxwlzwen8a59lwPf1I3AOvEGjwENBl530zt82oJrPeEmkvLl4A3IEdHY/5BVUeEYwG7BaTGoKJnJtStDhW4Ti6Vw+CA/bVtI3JXcfoY2Fgjg7M6UVrFBZDWEkCoaoPsRipBg5nU8igpyffXca9JGmlb1Y0iqMiZY92KB5TqGEzra3iCvRObBu4+8SDt5zR+0q8M0aVlbbCokERjzC6N7SPdfIzgiWdtFClyKDCzazKC+CaFcgFxzlE3hX3lBZRTlOucl1VvpQHJCV7dvTtXyusrI0s0GAfWjIuVtLTqCwnSsJXhRvubzUO1QQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(376002)(366004)(136003)(396003)(31696002)(316002)(54906003)(6666004)(16576012)(86362001)(38100700002)(186003)(5660300002)(66476007)(66556008)(66946007)(26005)(16526019)(6486002)(4326008)(478600001)(36756003)(6916009)(83380400001)(2906002)(8676002)(8936002)(2616005)(956004)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2Ira2FEVzRMZUYvSG1PSnU0ZmRucVdkVlhoNnNWRlBmRGZRekJHbjBVd3I5?=
 =?utf-8?B?NitnQ1BmYlIxeHMvVUdnSGZsK0NHazJUN3Bqd2I3ZFFqZEJUY1hUUjN2Zytq?=
 =?utf-8?B?STU3ZzRYSnJqUWRWSjNJekRReDd4RU4wTTh6TnppYm8wRTcrNXZYRDQrcEdj?=
 =?utf-8?B?SHErK1M5N29BaTlIRWtjNTlhRGZiNDc1WG5SL3ZhMnRweFh2QXFyTzRyNHBr?=
 =?utf-8?B?K2FQTkJXRzY4V1ovcXJjdXdsVjNNa0wwN2REZ3VqTXhrSGlWS3h5c3U4OGVC?=
 =?utf-8?B?WTFkRldGZlUvK012TEVPeGh4dmxselMxK2tOSlNZWGxvRkNYMXlycDFYSzR1?=
 =?utf-8?B?dGx2d3h3S3Jka0xqZEljaEtQTlJOeW44MmF3U2wrYk9GRGtyZ0NpMHpMbXBt?=
 =?utf-8?B?M2xOT1YzN3plUkJSVTloY3JFWDQvWHgzQW1kMXZjQzNQcFl0MkZIQm1kVVhB?=
 =?utf-8?B?YmpNYjlHdW1pK1pmMEVIZGlBZWtxTFdNbGdEM1lCTXhvNExSekx4SzVwSWoz?=
 =?utf-8?B?ekRnN3ZhMjVxUnNFWGM0RkhoSXh4dU93and6Z2dKMTk0VWxjanRTOWdlamYw?=
 =?utf-8?B?b2JMOVI3UmdxQmd2RWc3SWdISmJlVkx5Mzk3SCtxaEprNXJMUkNHUm9vL082?=
 =?utf-8?B?Vzc0K0kvSVRaUkZ2VkNlM3oycnh5MnoxbEY1ZGxWQmFlNXdQVDZ3YVYxYWR6?=
 =?utf-8?B?blNVM0I1REkxZjY5S0krT1lvZDEyWlN4b2ZvTmsvbjRpZ1RHejRqdnBZWDU2?=
 =?utf-8?B?Ymh0bXp0UUw3bi9mVHYySGJrYTk4TmdLQndYamgzMjVVeDFqUy84WFNKNXBK?=
 =?utf-8?B?UkdNS3NoNWNSYmNIazFZNDh1aU9ETkhKY1J5NitrRzFrT0daZERQdnB6ZUZw?=
 =?utf-8?B?RS94dGlncXhpd0wzbUxYYXUwM3FmYVpCU3pBd0UxdDg5L2MrbGJ6a25NSmZI?=
 =?utf-8?B?K3JGcC9GNGhYZnBwM3ljTFViaXlWMisvRm0zTnovazd0YlNYKzBUQlp5OUY0?=
 =?utf-8?B?SkFacUFCWTlYSitKOFdUaENPZ0ZaL201TlZoOENJeXdSSlNHZzFJeDBXMmVo?=
 =?utf-8?B?UGppRlZpdWlVMFVzbGgyVWhERW51RUZyUTUxaHh4WUpqZVUxRGd2Rzd6bHRH?=
 =?utf-8?B?RE53ekcwM1dLVUlySU54UllpUXhMWFBTdGhNanBXWmhFVDkxakc2QWpKUlEr?=
 =?utf-8?B?U1gvOWZXbG1VaUJhS2NzRWsxeXBCL3JsYjFDZzVCTFptRkVicjVqV2Vnc0VZ?=
 =?utf-8?B?WHVLZTlqK21KRlFUcnA0V1ZvUjZ0Y0dibzc5WEMxd0IxbDZLbkxSVjMrQlZU?=
 =?utf-8?B?L0RzcG8zZGpFUHJxSXM5WHZYWS9PV2VBV2hoNW9wTGxreXhlNldibDU5SktT?=
 =?utf-8?B?TWlnV0JJeEF2aDBmMW1UTk12eTRDVjBmWUNGWncrLzMxZFA0dlVxcld4N3ZM?=
 =?utf-8?B?YjIzdzJ6WG00S1d4MkVLRWtkWXB2K0FCQXh5SGhoVEFVam01djNTbnJLWDls?=
 =?utf-8?B?VWViWWprYlVua1g0cE1aYzg1WklUNXMvZzQ5TVp5Y0xPZTVGckF3cjRvVEJQ?=
 =?utf-8?B?emRYRFlLVC9FOGxwbThNdklEY0t0Z1lyVjhCT1lRYklZU3NPclZNT3VkV3B2?=
 =?utf-8?B?THpzYTVXeVhuOXpIUklVWVd2NkcvWndqVWx2QlI3UnJPTlo1ZVQ4bzIwdkxR?=
 =?utf-8?B?K1FScWx2UElOT1lveFptVmlUYU5wOG42Y3JhaHY2NW5xRjAvS0RnajNjRW1n?=
 =?utf-8?Q?I2K0uT6g+UN1MIY64OnrhQEu48SX1usBRQyvznO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b7af54-b7e8-45b8-d3cd-08d92f3bacf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:52:40.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxDhiwj1iWoKM8Zy4+fbbSzViqmLGoO/MkmPDAWAmo2aHadSJCzMXPsreWLK2V66XEDeCtGmDCG0SvvXXdG5pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

This confuses disassemblers, at the very least. Move
.altinstr_replacement to .init.text. The previously redundant ALIGN()
now gets converted to page alignment, such that the hypervisor mapping
won't have this as executable (it'll instead get mapped r/w, which I'm
told is intended to be adjusted at some point).

Note that for the actual patching logic's purposes this part of
.init.text _has_ to live after _einittext (or before _sinittext), or
else branch_insn_requires_update() would produce wrong results.

Also, to have .altinstr_replacement have consistent attributes in the
object files, add "x" to the one instance where it was missing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Put past _einittext.

--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -148,6 +148,8 @@ SECTIONS
        _sinittext = .;
        *(.init.text)
        _einittext = .;
+       . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
+       *(.altinstr_replacement)
   } :text
   . = ALIGN(PAGE_SIZE);
   .init.data : {
@@ -169,8 +171,6 @@ SECTIONS
        __alt_instructions = .;
        *(.altinstructions)
        __alt_instructions_end = .;
-       . = ALIGN(4);
-       *(.altinstr_replacement)
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
        . = ALIGN(POINTER_ALIGN);
--- a/xen/include/asm-arm/alternative.h
+++ b/xen/include/asm-arm/alternative.h
@@ -67,7 +67,7 @@ int apply_alternatives(const struct alt_
 	ALTINSTR_ENTRY(feature,cb)					\
 	".popsection\n"							\
 	" .if " __stringify(cb) " == 0\n"				\
-	".pushsection .altinstr_replacement, \"a\"\n"			\
+	".pushsection .altinstr_replacement, \"ax\"\n"			\
 	"663:\n\t"							\
 	newinstr "\n"							\
 	"664:\n\t"							\


