Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626D456D27
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:23:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227736.394006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo12d-0004JP-Fs; Fri, 19 Nov 2021 10:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227736.394006; Fri, 19 Nov 2021 10:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo12d-0004GS-BO; Fri, 19 Nov 2021 10:22:47 +0000
Received: by outflank-mailman (input) for mailman id 227736;
 Fri, 19 Nov 2021 10:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo12c-0003FS-5V
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:22:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2e55cda-4922-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:22:45 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-WQAgmwXzNoOlNJ4ZFus9Iw-1; Fri, 19 Nov 2021 11:22:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:22:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:22:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:46a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 10:22:41 +0000
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
X-Inumbo-ID: a2e55cda-4922-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YZ/RYh6HZJE7d4sF/mnmyPw4f+smxi+AYdlGT8UcGM=;
	b=OrxysEkAe9gTIlmpR8eJCEWQ1yF5u9++tp0NLlW3eYtTahxU/XHmk9NHEhec8twuRn8BMO
	D5r4j634AIOC7uTC+28zd9ZFsiLsPC5VfuNr+BKEvf7wwOgXox/Cwfp+iUk0uRnMyTX7D7
	OxsKJ1I5SizbNDhE79wAUSbatqggFtk=
X-MC-Unique: WQAgmwXzNoOlNJ4ZFus9Iw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrEhwEPkLd/189ebi1bAm5dF3wwonPRUYdJDPN/rZDFQ4gAgCp0tbuHBpCm1I45OndffIpw7waLZVxwezzf3OaIg7vl9279Y4UOcWZfiDB36Zs2csRUTbviEkhMw/D4jNZW7NMI1N65mcbRY6pxwb5aIDPDG/q9KZWZxReTe4YtCFpykkwXlWIJdHPYzfZATAjnpgrJo2pEAlK3C8q23I8W5PoEERN8MEJ/BJxD133zjzrdgXtK0tNBIy2fnRtpHkpC+YNfBipWaoMW2z7ly8yyQspShMuBUi+FESIBzKaMWucP1YJCGD7ivT7s5n5Z2Ost6U/nclrTx3NIOF4+O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YZ/RYh6HZJE7d4sF/mnmyPw4f+smxi+AYdlGT8UcGM=;
 b=mKi5bKOMTvmAs3jypacP0i9/VX0ipRfDwak1R59ix1Kky9fNFi7YFWxEYv1VZ3qvz7Ib3eqZ22nNlis/ImgxfG+0/XbKjC9jwN1V2nZW32h+DyMtrEG3ajxnqvhM2wdHr0vfxCFFya98XqeeS8jWsYKWsuz07aF4Om+xMuIqcL7wkI7+yf1j1EQM8sxV0tQ3/AaZS0u8+Zi1vU+jsRgiZHnx7Dw1MocFvvaU2buhlr/F5k0VccY9809TNF6kDocdeLvCUuL1AAWaXd1aQSRpaG4O6Hhpk4KXV98OMOEjP1iMwxasbdZQU8YFG3EbcT4SmkqZj4Rmrf7kXmt4y/x96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b6557c0-08ce-b4ae-87e5-ff550a07ec9f@suse.com>
Date: Fri, 19 Nov 2021 11:22:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 5/7] xz: fix spelling in comments
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
X-ClientProxiedBy: AS9PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28b23aa6-b3ab-4535-9a28-08d9ab468525
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51684A5EAA76D5B61C5701D9B39C9@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jNiJC2DIds0oOOyRQOhc77xEXJHEP0YrMBD3bfDdi+03CmnXReqvRfFPNyR83B+3NubG+W2QC0zewEzIqug5sa0d+kBTL9TMP0iJK7hYcms+dfFmcuOrKI7GRYjYgadKlZ6wdYD9z36ybWXVfT3dvP9sFqrjQgS3pBYt0oyr5WaEcnIQPf+hiYdwhdo7i4rFMN+TMMIzSBuVkcDScjGr5+oTcIKy/gv33DmrjtNq8JYabsBzQ81el210C6zQH612//2AMMPJHYOndix1+YwAe97NlzCDuqd8M6NpwuDB3pHne9zVkG2tifFbK5mdfs3azCqFr2JMY5G2mNq8p/0C5YI4iQyfvzG7UScpw8RSqA/Kvda820hl6pa6IxbNHdlfywPObJkALx50j0uGQMjHBBkfVZjR10kmR8tTpQbyN+ax1H3UoqerXlPovB7Cf+e952yYGfwjunHoDzhnPq/QfaL108/5LHCOARZAqe1+pswPjW54UxWPJF1zK2RuyFpQSh1XZf5AIQDXYyr74AokMWwWHaLt1d41bP6qh+/b6ePRh0LeP1ANQy9MV3l5o42GkgSrIH9qTpkkQ31a2FwGTTAUZugr85Ev/lqmV8FKvC3ZeU9r9naU6nkgyQRYW1bXamOMYLZET9GQ34o2CepNSzQDxqWqqQyBWfnAxDmUETqRWnSp1YzaCvO8XEyn/kyRs9eBbaAQLjJjYxEOykAL5HMjiL/pwByQOT/Tqca2C/eQEUtZcEr15Tze7WBTDPquE3M87p5sTVmq432ky0gaN/VzPOsd49Q1Fgeuuvl3Dl42Zyj8URZSjCEZMlRXyAZy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(38100700002)(66946007)(316002)(6486002)(16576012)(8676002)(966005)(86362001)(31696002)(2906002)(186003)(956004)(5660300002)(2616005)(4326008)(66556008)(54906003)(8936002)(26005)(66476007)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFU0Q1E3elJDZGE3TktrbCs2SFRSdkhZbmtMRWhOSW0zRWxoNEdaUUJGMHNx?=
 =?utf-8?B?TlRxWmwycCs1R0JPOUZTbStIdkg0L1VNeEdhc2JGaDM4MGY1Ni9yalN3dTZx?=
 =?utf-8?B?U3EzbnVUeCtRMzNpajlPOVNIYUd4U08wcU80cjBJeTUzbEZCYTlGZ2tVQXhU?=
 =?utf-8?B?OENWZ05JUEhVbUR2azRoeHZKc3FWSTIwT1p2WTV2OXhnNE1acFpwQWI5OWR2?=
 =?utf-8?B?azBUdkozWFhHSUIwK2E4SURDYkJsdUk1clNXUHZTOEg5WitnS2FsbVh2MHhU?=
 =?utf-8?B?V2NlVXZxNms3SWxhdThneHZneUsxK2xoQ1ZvVUFlcjlkRzI1QmlaQVR5MUtr?=
 =?utf-8?B?cWVoUmZTYXorUDhYcWZXbUc2RW5KWjZPMjE4YTlUd2pYTVgxbXZqRFdlOFZE?=
 =?utf-8?B?WGpycG1yNFhBTDV2aDRDc0h4Y0tmWG93eXcrTDVkWGNnT2d2RCtWQnowZ3BX?=
 =?utf-8?B?ZngxN1ZzeUxxellRdStuL1NNc1RadU16d284aXVWY2dUZ0UwUW5wMmFIL3NE?=
 =?utf-8?B?RWFpTGYzWFNlNUJXYzlKWmNjcWg5ZUtqR3ZZOW43SENXSXUzeWhhRGJLL2xV?=
 =?utf-8?B?U0dZdjI1LytpVTFWNzB0RnJGdGJSVmhSbEpNM3FzRFlLelUyNldBK2s3REFk?=
 =?utf-8?B?dGV6WGZldmRpWHRocnB0NkhRVG42ejdXZkxOWExWZDBGTS9RNVdLUXliRnVs?=
 =?utf-8?B?OTRkcGozRVZ3TkJSUy8vSkpTc1hSZzBzc1g4ZUcrRkhSVDJsTEVqSXFoYWFk?=
 =?utf-8?B?LzdzcmFuUUltOHM0L0d6ZWY2REFKVUxuQWtJaWl3cVBldm9WSG5Eb21KWnpa?=
 =?utf-8?B?QUx3ZUV4WTB5SWdBa1pvbndKT3RDNEtSb1I1VkxERTBPRG1QU09JeTU3ZDJV?=
 =?utf-8?B?azNSTTRBV3ZLQkFNV0FLK2VCWDh1NG1VTk1KclY5ZWw3UHlyWi9yNUMzTXRX?=
 =?utf-8?B?blZlN3Z0SVVrS3F4U0kxdm94ZUhtcllKVVVwWWRtRUVodnJ1Um82MXNyVzBF?=
 =?utf-8?B?VUIzdWVDU0I5ci9ZdnhhR05LTnd0UnRMaGNXU0tuTzFvYzVoWVhxcEFZS2hl?=
 =?utf-8?B?L0tINENRRWplUjNoTGZJS3JzUTVBdDYxWVk0am1ndzNwbmV0R3B3TDRFMTdL?=
 =?utf-8?B?WXRZREN4VFd2SWlDSkk2bmREcHF5K3NVNXZoK0pJdzdCZWNEVVl3MGxqYzl5?=
 =?utf-8?B?Slk1UEwwY3AzUjAzWkwyenkrQUlaMmljdlB2dkN1YXRxWThpV25UVTZBNzdq?=
 =?utf-8?B?SFFERDBSYlM2U2tTK2lkbU9yaU9LalFJb1pjVWJjRC9iR0U2WFVZMFJIam1B?=
 =?utf-8?B?NkFPMVlYRzJHbDVnSFE4UW1sN0hwQmN1Q0dKemNheUJjRW1IaXIrNEJhWDhx?=
 =?utf-8?B?Q3hFQTZDYWM3dUVFWWxrSGNydGlIQnVCSklKVWU3S1h1L20rbzRRclRIemZj?=
 =?utf-8?B?dkZaZ0tQeVpCa3dJUjh1SlMyR29hNWU1Y2pKK3M0Q0pLaUgxU3MvZGhJMS83?=
 =?utf-8?B?WTFIQTlWWG8xVm1GV0xrRWdSaWM0UVErVGdmSVQ3RTlYVmY0QWZORU9zaHR6?=
 =?utf-8?B?bzYxV2hqNGVTaGgxVzUxTnFvMWF3SXRFd1hZczdoL0pwU0ZCRFhlVXVLRUVj?=
 =?utf-8?B?dVpTMTNKN2svUUd6V3ByOXRhVnFYSmova2U1NnYxWDNVRDU2aXMzcFkrMVlP?=
 =?utf-8?B?MnA5aDQ4S2NBSyt1bUZkUXJMQXFjYk9KT2ZrbGhPVHVPRFJ4NUswMnhtSk5p?=
 =?utf-8?B?V3REMUJLZkYvWUFuS1djV2Q0cE1yaEVTeFdBQVVPeTl0TVdHcVZWaUQrcENN?=
 =?utf-8?B?am50T1B1MmhkSXFiaWNhYjRSbFpMVTRvc0RHdkJ0ck8yZEkwa2lQSU92VmVV?=
 =?utf-8?B?dVhpWEZoQWVJMUViWFFnbk5PTFNHSFQ5N3h0T0NlR2Z3ZUxZRmp6Tlc3dGw5?=
 =?utf-8?B?QTlWUzBMQmFKc1hac1FhdGw4VjY3UmJpejcxbHZkdFdscDEzVlFodkdQSTJO?=
 =?utf-8?B?T3RVZ2RidDdIelIvaHZTNWp0RlhzWnV5MHd2Sk5DOE50Wk9xRTZVMEhtYVc0?=
 =?utf-8?B?bUxUMUF0QWxCK1Qzd1l6ODJiVDNGZkdFVkhlY1ZPYlVnMHNLLzR4MDRwREZu?=
 =?utf-8?B?SWNUZGpwcmxzMThnbGxDSy9TdHNEalg0R1RxU0hGQzFyVW9uUEREMWhoYjF4?=
 =?utf-8?Q?PHH+z3ron7rmLiQyptYS3C0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b23aa6-b3ab-4535-9a28-08d9ab468525
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:22:42.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIlacKb+4217UHvK2OWAe3bfYepRy1mrgDg8OPr6DKgeB7/EyUZfwgeQPJIzD79KjcWmSTPzQ1oFmrT587FYhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

From: Lasse Collin <lasse.collin@tukaani.org>

uncompressible -> incompressible
non-splitted -> non-split

Link: https://lore.kernel.org/r/20211010213145.17462-6-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
[Linux commit: 0a434e0a2c9f4395e4560aac22677ef25ab4afd9]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -20,8 +20,8 @@
  *
  * The worst case for in-place decompression is that the beginning of
  * the file is compressed extremely well, and the rest of the file is
- * uncompressible. Thus, we must look for worst-case expansion when the
- * compressor is encoding uncompressible data.
+ * incompressible. Thus, we must look for worst-case expansion when the
+ * compressor is encoding incompressible data.
  *
  * The structure of the .xz file in case of a compressed kernel is as follows.
  * Sizes (as bytes) of the fields are in parenthesis.
@@ -58,7 +58,7 @@
  * uncompressed size of the payload is in practice never less than the
  * payload size itself. The LZMA2 format would allow uncompressed size
  * to be less than the payload size, but no sane compressor creates such
- * files. LZMA2 supports storing uncompressible data in uncompressed form,
+ * files. LZMA2 supports storing incompressible data in uncompressed form,
  * so there's never a need to create payloads whose uncompressed size is
  * smaller than the compressed size.
  *
@@ -127,8 +127,8 @@
  * memeq and memzero are not used much and any remotely sane implementation
  * is fast enough. memcpy/memmove speed matters in multi-call mode, but
  * the kernel image is decompressed in single-call mode, in which only
- * memmove speed can matter and only if there is a lot of uncompressible data
- * (LZMA2 stores uncompressible chunks in uncompressed form). Thus, the
+ * memmove speed can matter and only if there is a lot of incompressible data
+ * (LZMA2 stores incompressible chunks in uncompressed form). Thus, the
  * functions below should just be kept small; it's probably not worth
  * optimizing for speed.
  */
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -505,7 +505,7 @@ static always_inline void rc_normalize(s
  * functions so that the compiler is supposed to be able to more easily avoid
  * an extra branch. In this particular version of the LZMA decoder, this
  * doesn't seem to be a good idea (tested with GCC 3.3.6, 3.4.6, and 4.3.3
- * on x86). Using a non-splitted version results in nicer looking code too.
+ * on x86). Using a non-split version results in nicer looking code too.
  *
  * NOTE: This must return an int. Do not make it return a bool or the speed
  * of the code generated by GCC 3.x decreases 10-15 %. (GCC 4.3 doesn't care,


