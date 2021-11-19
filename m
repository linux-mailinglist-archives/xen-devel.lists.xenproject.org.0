Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE05456D26
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227734.393995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo12G-0003gj-3u; Fri, 19 Nov 2021 10:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227734.393995; Fri, 19 Nov 2021 10:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo12F-0003dU-Ui; Fri, 19 Nov 2021 10:22:23 +0000
Received: by outflank-mailman (input) for mailman id 227734;
 Fri, 19 Nov 2021 10:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo12E-0003FS-J0
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:22:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d9d9ca-4922-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:22:21 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-AXYmrSAsPE6VtmYQLeNg8g-1; Fri, 19 Nov 2021 11:22:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:22:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:22:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0058.eurprd02.prod.outlook.com (2603:10a6:20b:3a::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 10:22:18 +0000
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
X-Inumbo-ID: 94d9d9ca-4922-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Poc0wRx/mUi3cWDnszzqwQVxElnm2r9mLP8h58FAsVw=;
	b=F4i+wOnaUYE/o7juzWWY3omAp4NpvXnLgNxoQ6pWOVqe4ghTq/BsyshvILQOldv8qoXLut
	DKS+T2Kl1wvxNBEZmU0LpS67LWbBA1zwjiHOl0dHfxkZDPWaFQRerdNjcIBVZCI5tDBgy3
	Irw8SjblW6btLPSLULmQOZ1l/WmCYAg=
X-MC-Unique: AXYmrSAsPE6VtmYQLeNg8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUpd8WeQi5qeK1VJ/CD9bcv14ONyU7aU0qCno6b3zKzpYnsS7VerEDG47GbEBjFiKcqv9qjaqqNBxabZPiAlgDmvFzOmMXcsWRyKgSlhV0PtDoYWC/R5h6Pdgij2O5AyzMLX3k8xz41LX2+aaAwtw2Du5RTS0q5ehSmN7mxMFN/4vCliERfAeyy/lnfsGdVZPti5e+uox8cOBLaNR3cGVb+qKn/ya17HtZVzAT0SVHU971Ss1m6k01qUsRyDTgHlxlrY9XOQp8gIdVv3fT0gYs5bsJLjQUeFc1ynOl60vVHVYimOUmEASl9KOTrLq611H35AZroYLMQUvUUnReMA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Poc0wRx/mUi3cWDnszzqwQVxElnm2r9mLP8h58FAsVw=;
 b=AbhQdo828vE7c2lcOyuV5VoCvRqcc6BxTVpLOLKCRV/B9kYqi9Lzzvo2GDnFNPXxRQuILBubZrUVrStRGow/A2xTN/VhdqAdX58HPwps++UxIq9yWPWjHDNpEVx1sozXUpjxJ05TlCIvaNEWbWiAlEAd182wSsaLR4llSR4802P1yyXukA5+QMkvTmp2CJQc/gMHX0AfbOxnEGpabvkS10R3GBofmHb+4fYdgEJ/x8cugukPdvZGK6uqroWg4Q554gvAEZoUuc5OlJ2I3EyMXopq3r0TWzGsLKw+haqF8m6BLIqDw4XxnSf5lsKny7xYQ9xRk/eZfOagONYoB8cqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <389df3f4-5842-0f44-c8a4-42130f51959d@suse.com>
Date: Fri, 19 Nov 2021 11:22:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 4/7] xz: avoid overlapping memcpy() with invalid input with
 in-place decompression
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 793a95cd-4571-433f-1300-08d9ab46778b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704533DBCFC6F9480E63941B39C9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FVZJZ5DaSMlNSR9yPTHe+OB+gbofu4kHpKQMBifucWnbtwH72y+4fGhSFPYuOS0p6/qJjI0Oh6mYP6MYPskU1O5QLgiF7+IicIiQzyClu9pzk8RNee4VhNCAGntPn+T2VinGEEn+0quXxz53J/IDhL+E5apiZDSZL1LNHmwt7kHI4lNmCZZKlr+iBABWPjtgpgnJ62CVF5AR8hrBO1WWSKuYOfF6C6/neyo9d3C9vKQjkWK6fGBOkCOTdPfA/AR6wTVEDtp4vRu17U2CJfRen2ipB+tqxxOO4qIz4g0uAedIl93DTr+GjrINxuqzlK5JRd/3vnLb7/uqHbDeQLno8MqdKVvHbLetjP2klcabkUN70dAoZUahFVM4MWgTcglRu0hbeQNzVmXRXPjOzZM1hCvyJcgRcG2HtN3Giq/Y/+ilNe4zg33kem1cA5Vcz7CEH38abpl6W3tNjjrxWnfaSVrAmkY4Ua2LxodT/cTvXEUUyFMns3TXZvYV4A7BPasYffX+NVSwtGC0S9f76ecaWfVXcc3PvusUPNo2Yzx+bFDNbysTtFYL+RKWLDIRSivlVu6C1vAOHwuA5yXUfsasfxErsHvoZtOu4wDREr4eK6kmA0OAq43HfMewhC8z7gMKz0HAKoLjxA3hqjdHj84gADHcEvAl8VAaSXCPexJl7FfccpU9kuSSSuGTLJMGd+n+6yq+uySQKxSVwPicCg3MmjW/kj3oXyy/DnTeBn/1vinSnYslX3VTQ82RbJSav6EOKf7wiCjkJvegQIr45A8cFEh/fYNwHeOAcr3Al4DWT7MPfQ3czU21fLllNcnNxvITxwbn5iNV9vK/LjeKdquRCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(508600001)(2906002)(31686004)(8676002)(66476007)(66556008)(86362001)(956004)(2616005)(5660300002)(26005)(8936002)(6486002)(186003)(316002)(966005)(66946007)(54906003)(6916009)(16576012)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZENlbzdSN2diWHZRdzREcUNCTForZnhBdENzL3A5M3h6c0ZHbmp3aG9rSk5j?=
 =?utf-8?B?dVA4OENxT0orc2JFczE3UVpJL3dCenpJcUdTQXVTdkdVeFNRRlM2VGwzNTlq?=
 =?utf-8?B?SEFhamkxNGUyeEpXRTd2T2FOdzNDeGtaM2VlT0pUbVM3anBmYXlzUVRBMVY3?=
 =?utf-8?B?QjNKNFluWDJTZmxpdnh2Mmhyc3BtTTQ4c1ZhVmYySTFPWmJzam1oOWxlRldK?=
 =?utf-8?B?YlhmVHdaZ0w3UlMzOUVMc0tiMHR4ZVZyYUhhUW95MTZKMWxlUCsvTkRhSS80?=
 =?utf-8?B?V0htQVUvVlFkUVVhVzIwMVdmeW5MTWNTNWNOQ0ZHUG5HWDJIWFBDV0lDbWZp?=
 =?utf-8?B?dkVKRnZIT0J4ZVJxVzBjWHVwVVZwSW0wejJldGNxQ1JiSjBvUk9XWnBYeFpk?=
 =?utf-8?B?b0QrZTVhNHZPSW9pMnF0UEpGYjl2anp3VTJxZmtYWUtxQjArUWJTWklBazZJ?=
 =?utf-8?B?OTFILzJVcm00Z0J3VzRhMG16ZjA4VmkyVnF3bDBUcmkvbnVJUjNLc2RwWDlR?=
 =?utf-8?B?NjY0M0VCTVAvLytuekpyZzBzU3p2Q0cycVY1SnE2R2hhS1h0a3N1YS9VenhM?=
 =?utf-8?B?ZTFJNzNkd3Uwd2ZKNzJiMFpPN0FGcjNvMUNHS2ZZb1I0aldheE51dzhnSmtp?=
 =?utf-8?B?d2J3WFRQN21ibzZDQ090RExBV0E4bU42UEZ6RlZKR0lXUkl3TFBZbTRQRE1V?=
 =?utf-8?B?MCtHWTdXaU5ySEg0bkdmbnljazM1S3JOYWFSVTg0MnlrSDc3MUhuVDNpdVdr?=
 =?utf-8?B?bzB5SFl0Z0ZjYnRRN3k2bDFzaURGKzhYQmhaSEpBZ0M0Y1ZqSUNLdW8wMVZM?=
 =?utf-8?B?R2dDOTVlSFRMWFJlWFFCdnpUcVhVQS9VNWd1OG1CWERiWnpnb2JyeEFjM1Iy?=
 =?utf-8?B?NTFwNHliTHl3cFAzRnRGbEdYM2U1cFN1S3E5dngvbkNlN0MreVhGdjEzYlBT?=
 =?utf-8?B?bW5FdVJsbHJhWnpidzV2d2pzbC9pK3MzZS9hUWVTcmZ2eFFiVVdqWHpOWkMw?=
 =?utf-8?B?dFd4Sm5aUlZvWjZtRlJOMlJScml5UU9kUDJQWWk0WjUwU254S2o5SjdhNnRk?=
 =?utf-8?B?QllRWmxVWWFQdzM4dlpiUkVuajFCVWhVUDdvNXBhYjdhZmFQSTFVd2dZbG9i?=
 =?utf-8?B?SktJd1l0VnErV1Vhalp1MTVETG9zTzM1SW9KQmpKemlxZWw1SGNRNjlmWXRO?=
 =?utf-8?B?QTdObE5TbC94Rm9OSUNlZzl0M2RPenltY3ZQRk9GRERuQTFRRWdMS0N4U3ZM?=
 =?utf-8?B?KzNtT0JnVnBCRlhIYTJOQm5STzE5dEZMeklFYmlWdzZoZi95OHVnSkViQjBn?=
 =?utf-8?B?aWc5U05FcXg5bjFlR0tScUhlUGVVUGhZRmh5anZxckhUOWcwOElJcHk4cHg5?=
 =?utf-8?B?UEIyeXd1QTgvZnAyOGVvVVR6a1RuZVVrWFh4VEtuRlRzbGFPQzVQNGRWckl3?=
 =?utf-8?B?d1ExdnJkTFhRTVQrSGpHNTNtL1o4dEJ1NWVEV29VZjBiZXMyMHYxcXBBQXdp?=
 =?utf-8?B?aDlzbkpFQUxRcmtONlNwOHBBTU84L0RETUFzaWZYMVBmN1JLdzZPdm4rWXJR?=
 =?utf-8?B?WGFHbG96a3o0R1pFQUhVcFhsN2FtNUdsUUJld0lzZ3dCS3N3cGxqK3JxclVp?=
 =?utf-8?B?QnJKaCtmRm5FbmpLTy95ZzhpNFVuV1VOR0k0YkUvY254MEhLMmFxMVhXandQ?=
 =?utf-8?B?VW5RTXB5Z0JUY0hmR2NHOEhYRXBLODVQRnpGZkdmcmVKdHdaK2JPZkxnOExw?=
 =?utf-8?B?ajRiYnFVbWZXZ1ZWZ1JGZnBramlVK0hvY1k4cmdxQXI1SlI1cENqdTBJZTl0?=
 =?utf-8?B?amhSN0pEWWxkcDJaekVOMjVoZGQxUVhnN1h1bHEyN3MxN1BLNFBJd3lmcnF4?=
 =?utf-8?B?Sjl3cjdHd2VVT29YZGlWWjNDK3A1YmtLeDBNTFdFNk1ZNEg2c3NKYi9qOGxu?=
 =?utf-8?B?M2pQQWQ3NENwcUVsNysycldSTXBzZldvcWJCNlZQbEhSOWYwQnlSSi94emFO?=
 =?utf-8?B?WS82TFNMaU94OE01NEh1Yk85RDVTS3llcE5DdWMwQTdjNUg0cm81S3dxU3gr?=
 =?utf-8?B?VHMzTHduMVpGQURmTitIYjlNZlViYmlUWjdkd1NIbFBiL0tKdlhiSVp3NGFS?=
 =?utf-8?B?ekdCVERLVzYvWU9qNWk5TnpDclVoR0JTbkpBbGtaQzM4NzlrZVNtdE5jWmlp?=
 =?utf-8?Q?U8i0iChKSnhA6P0JVkZ5D3Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793a95cd-4571-433f-1300-08d9ab46778b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:22:19.2528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH25xuGdz1U/svWoeddzKVBIS/sm3m3jNLulq4nz5gGIXo8rhYf+C5GtDpCA8pRz8PXZqwxYsT0tVYPcVMlsYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

From: Lasse Collin <lasse.collin@tukaani.org>

With valid files, the safety margin described in lib/decompress_unxz.c
ensures that these buffers cannot overlap. But if the uncompressed size
of the input is larger than the caller thought, which is possible when
the input file is invalid/corrupt, the buffers can overlap. Obviously
the result will then be garbage (and usually the decoder will return
an error too) but no other harm will happen when such an over-run occurs.

This change only affects uncompressed LZMA2 chunks and so this
should have no effect on performance.

Link: https://lore.kernel.org/r/20211010213145.17462-2-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
[Linux commit: 83d3c4f22a36d005b55f44628f46cc0d319a75e8]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -127,7 +127,7 @@
  * memeq and memzero are not used much and any remotely sane implementation
  * is fast enough. memcpy/memmove speed matters in multi-call mode, but
  * the kernel image is decompressed in single-call mode, in which only
- * memcpy speed can matter and only if there is a lot of uncompressible data
+ * memmove speed can matter and only if there is a lot of uncompressible data
  * (LZMA2 stores uncompressible chunks in uncompressed form). Thus, the
  * functions below should just be kept small; it's probably not worth
  * optimizing for speed.
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -387,7 +387,14 @@ static void __init dict_uncompressed(str
 
 		*left -= copy_size;
 
-		memcpy(dict->buf + dict->pos, b->in + b->in_pos, copy_size);
+		/*
+		 * If doing in-place decompression in single-call mode and the
+		 * uncompressed size of the file is larger than the caller
+		 * thought (i.e. it is invalid input!), the buffers below may
+		 * overlap and cause undefined behavior with memcpy().
+		 * With valid inputs memcpy() would be fine here.
+		 */
+		memmove(dict->buf + dict->pos, b->in + b->in_pos, copy_size);
 		dict->pos += copy_size;
 
 		if (dict->full < dict->pos)
@@ -397,7 +404,11 @@ static void __init dict_uncompressed(str
 			if (dict->pos == dict->end)
 				dict->pos = 0;
 
-			memcpy(b->out + b->out_pos, b->in + b->in_pos,
+			/*
+			 * Like above but for multi-call mode: use memmove()
+			 * to avoid undefined behavior with invalid input.
+			 */
+			memmove(b->out + b->out_pos, b->in + b->in_pos,
 					copy_size);
 		}
 
@@ -421,6 +432,12 @@ static uint32_t __init dict_flush(struct
 		if (dict->pos == dict->end)
 			dict->pos = 0;
 
+		/*
+		 * These buffers cannot overlap even if doing in-place
+		 * decompression because in multi-call mode dict->buf
+		 * has been allocated by us in this file; it's not
+		 * provided by the caller like in single-call mode.
+		 */
 		memcpy(b->out + b->out_pos, dict->buf + dict->start,
 				copy_size);
 	}


