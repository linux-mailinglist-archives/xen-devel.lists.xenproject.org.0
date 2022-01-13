Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE748D8AE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 14:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257202.441889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7zyp-0007ay-Of; Thu, 13 Jan 2022 13:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257202.441889; Thu, 13 Jan 2022 13:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7zyp-0007Z0-Kq; Thu, 13 Jan 2022 13:17:27 +0000
Received: by outflank-mailman (input) for mailman id 257202;
 Thu, 13 Jan 2022 13:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7zyo-0007Yu-9M
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 13:17:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25c226a9-7473-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 14:17:25 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-N-7FQoAWM0WEpJdDlstoDQ-1; Thu, 13 Jan 2022 14:17:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 13:17:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 13:17:20 +0000
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
X-Inumbo-ID: 25c226a9-7473-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642079844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2/d3CTDxLjqoZ84Ou2Bee03DcAeFqL7eJTl+639eoTc=;
	b=ITTnIrBSPUPwRSlXHKgn69oYNIv4xsVyS3J4kH4rqVCLATyzeR2ihG1bEiQJm0j2g8/grW
	6ahpxOV1nR4AdClpvNLypcVz+8zC0iDh03SkJJmLaMfogrDocs5xJFBNl50Ba7Z9rFLv2K
	yY+Xxq2s+EnUoRkIZux1ay6IJ9TwLJc=
X-MC-Unique: N-7FQoAWM0WEpJdDlstoDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaE+KpXWpw10Y1I1hHcYqdfrql0Aao0kWgZXqV8gz1Oe3GEaYogDqYaSgJWgU0zrtNnIgIFNioiDI55FqwOR/AanMCJutu856Mh+zd95KIMG8Wpxf00sOEMi1y3p/y5oz56qeCr3ta9xStJX+Q0gfxcbRgHLJFRNAr+vrZUI9L5BrHPFSQteAaOqtUwuRmDipbeZlJjocPUDKLTsnWpE5/rDE1UAcWmwgJoixECVAOYlszp/eC/uWhMM4nQ690R44gy+rrPdH9rbQYleFzrG9UhHtlv3BKEnFdMKkI8FswL2TEd+vWPoRw8yTFVIZ3PQaowm59t2tulvflPboYm6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/d3CTDxLjqoZ84Ou2Bee03DcAeFqL7eJTl+639eoTc=;
 b=bLt55/7rFIO2WpS44+JDeQC0TBki+ptYgixONOtPhLcvwd+IRF/yxuwkTmG1yDbRzYqsDc4/u9SIF8xMunJRwlSk3BSMOyTvKCnuy0QTwwjabiKdp1AGSiUDf7X/mzrh8L4M+A/wZLXfMwA5CT91ga87zPtgOc7IgZrTEjgBXt6rUDVFiI0SI9oafuu0IcwekYz0QSK3gzrUd8zrsX77XVdT4lw5JmGOTKlkC+uDwHL4LqbuVGbI4Qd9iEObH3JaWdD3SPAI0GQoHsxdS/RMPq7TRmSofv5bJyTvxNp8CmAhjfhBM5I8VR2+6wQj73BnJ1TOWUoDP2U1hJpInhMUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
Date: Thu, 13 Jan 2022 14:17:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/time: switch platform timer hooks to altcall
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f12c965b-02b7-4d14-837a-08d9d6970789
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54690BB94500AE1F0DED901AB3539@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7EUNvMopv7P8ZwP7yvSPurWFtOld5sHMnW0O0BPGcphd5r86r/gqqpQPgvlcBNiakpgt+2aMf2eYxlq2XGimXUr11IAsNnbp2ShN9iPkx+kuKKeh+HDWzfkBNGU+r2vSBbD1xuPsuQFQlHYUEQ5b4icvOPn5Te8kbAZHQDbxcYzUXGXHZF6PukPqHlh/JT5GL1qQg2RyCF4tN2jyYJu0xAsDSHJqzCC4eusXsZuqhbqQ4MjWdizvPl6NP9M8Cy+ltfxnVI/BWoX8lsYunF/idPqYPbcUOv5xdW1ihswjCZLKLqr0SHzv+1t/pDUAvebb73YWLYcLDZqLRMF/a07VCx1Vb0cRWRNgmdxyoAsaOCNFp8y2d3vpfT/5Dg696XGr6//mvVMwv+7dYKflUJlh7JwK3j325AxA21InAze9yvnsBWYeBgnIargW+n97P6moI47fuGx8oTJurxVAVZwJ3FbbW53aPpwApJw7N1TraIROhbqWr97XVRtSfjDZHB9kODeIPXOSETftiSzhnNKMCaehWpIhhNCCTMjYP2fhXSCOy8DdIGXzixF4KrT7SzyStbnt/XQR3baw/o17s0Akahtny2XeLoo2OzbRpXchEzmmVzYI77sgcbMg8eXWL8XyLqTC8m1ufYyEssVujJ+NnwwIRsF1x6UEo31RQgThu57RYf25WtRAhWWVB8jHszSHQuObirhHrW3UoiRwWD7e0HnTFcfv7dW5675+hzFw1Bc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(38100700002)(186003)(83380400001)(6486002)(2616005)(66556008)(508600001)(8676002)(6506007)(5660300002)(26005)(31696002)(316002)(66946007)(6512007)(8936002)(54906003)(66476007)(31686004)(36756003)(86362001)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXZ4TVg4aHhyNi9YRUlYMFZsSDRsd1EwRjVTZ0xHT2Y4WFhVWjRRZDNZUVJM?=
 =?utf-8?B?VUQzdEtjaWo0dGRPa2FzYm10SFJRTzhrQW5iN2g3c2JacmNxcjVkcG1DaTBF?=
 =?utf-8?B?OG1HdG9tLzRXUkJJcnVwT2dhdzN4QUpWWVhDckdneUFBb0dDUnE0bjhxN2Uy?=
 =?utf-8?B?OFppVXlWaUw5TkxXKytRWW5uNEkvYWYrODJCb2VRcGNaWTZpdzk2anBSTFo0?=
 =?utf-8?B?SHZRUWI5dmdocGpTZjN4Z20xcStzV2Z2alR2dHVLdFE3eDZNTno5ajRVN0tl?=
 =?utf-8?B?UTA4WlVDWTZrYzFPcmUxVUFUMTh6NEQ3a1pJVExZMVRTWUZUY2k1ZkJZOW9Y?=
 =?utf-8?B?a3Q5ZlpnYzNsMndZcEk4cEE1aUhuVGltV0w4Z3NMczRpY1RveG5wczlpZFFj?=
 =?utf-8?B?N25EYVBUUHVCb01nTVpDbFdxSXlRNHUxaStBUVZ5YUo0SklvU2hGaXZ0aXk1?=
 =?utf-8?B?d1F0OFY0eTFnS21vOWFSVi9rbnM4K3VYclA0MFJnUk92ck11UEVlN2t5elpN?=
 =?utf-8?B?TUk3WkRNS05ab0hkaEcxditHK2QwMG1RdjVBMnhwYytpZlFSejVYUmVydC9V?=
 =?utf-8?B?Zkt6RE5IdEx0RkE1ckNWV0t4NUdzRjJnNS9ibGp1bkQ5OGF6T21YWjhzWC9q?=
 =?utf-8?B?dlJVMVJZYTZkc3dyclgzbmowcjBkWVBnQzdUdU5wbU95MzJpb0NaVmJhZ1Iy?=
 =?utf-8?B?cHdZNlhkaEFDT0Z3cnh0RkdHUHMwZERyc3JzRkJ1NElPMlZXbkh0d2Zxaldk?=
 =?utf-8?B?ZkxtbDVOZU44TzlVaXlIOWJOZkhvRFJKQW1neENneWFlbjBEYzR2NXVGKzRj?=
 =?utf-8?B?b25LN2RhRVZUL04rS0RHd0tMUDhhSlJiVERqUHBMZllXVGlIaHlFZEJXUUo4?=
 =?utf-8?B?MTA4SFV6Ylo1bXAwaUNxN3oyMEN0ZXAyVGR6bmM0dDhiN1RDek5SOFFkei9p?=
 =?utf-8?B?eTNMaVFQU2pTbUJFM2oreEZBcG05c2ZjWkRiNjBGSjNON3JtdTNrSkphNHBw?=
 =?utf-8?B?ajNCUXUzYWxWVXlvUGUrNkIvNHZMOEM4Z1Exa1o3ck9MdUZxT3AzcmVHdHJv?=
 =?utf-8?B?QUxHVExwcXhEcWhhNGR0blBWbFp4ck84WXA2SzhyZVJaZkNvWXRzU1gvVFB4?=
 =?utf-8?B?Ukh3NGRqWTNnSHBHTnhSV1FQdTkwM3VMdnlESXRxcjFabUFtQUtSSXprUU9M?=
 =?utf-8?B?aHlxNEhXek41RmRiMG9FQ3FmbW5rM2hpUzhxcDhtM1UyT1lqcDZzWGNrOFdQ?=
 =?utf-8?B?K0UreG1UMFN3dnZ5ajJkd3g3SUgrSjhOemVVRTQ2UWljSnlmbkZrbTZMSHJY?=
 =?utf-8?B?bG8vYW1EMmVuVU1IY1VMMVFiZFNFM0RkTFVxUEtwVjZQQllxYk9wVEpjRTBv?=
 =?utf-8?B?L2NZUEJiUHFHeUlBQmRZR1NjUVh3OU0wdlZseWM0M2h2UUd5OEZpUll6Zytt?=
 =?utf-8?B?NUg5SWNtdTFDMm9ObUk5TnNtVkNqTlVoUW1PWDMzZGdkdTBJeGVySERVcUFG?=
 =?utf-8?B?QXN0L1VWcGI5NE1EcTczUDkyckdkdDVKNmEwOFRuMGErSzJrcitjaElTZ1l3?=
 =?utf-8?B?MDdaYWFUbzJmK3VPTGNJNUlGQWc2cjBOVXhzU25QNTFQU2hVUmgzN1VYa3Iw?=
 =?utf-8?B?T1hINVZjUHZva1N5enRXV2phVFVYRWY0cEs3czE0ejQyY2x5TStMakZaYXZq?=
 =?utf-8?B?TFI1VFByYmJCc1RzYllkK3JybzlDdlRzK21odXhVd2NESHphdGNhZGN0V213?=
 =?utf-8?B?cDc1dlIvTFNrTXBaaElMV2hhWmIybnoxWHNWYXc0UG5yOEFQV29ua3NYTEtu?=
 =?utf-8?B?ekIra25UamZrNjdEcFRYS1JNYzdGbmg4TTBFOUwrY1Q1UUE3TjdtdU1kWlo1?=
 =?utf-8?B?TkV1YVpMRHFmN2tEaUlGNmg0NzZpNlVaMmQ4YUhLcnZ3ZzBpWFZJbkFwMjF0?=
 =?utf-8?B?c3RzVmdBZmZGVWRGQXZQMUcrTlEvM2dyZzhhckhwTktHMHdJY1N0V2F2R3Iz?=
 =?utf-8?B?N1UzMWJkYTF6VG1pYmpQNjJ1Nm9VWEFMcTQwOU10ZGI5Z2hTVkZmeEg4bFIy?=
 =?utf-8?B?UGlHTXZOcUVma0c3Mi9XOHlSaXJKTndoYmxGVUNJZ2hVSWc5aWVhOWFMdW9v?=
 =?utf-8?B?aldrMzZwN0NML1RxeDdqWnNBc2NPUWJFTTJaUHQ0TzYxYkFSQ1dCODRlMllE?=
 =?utf-8?Q?ETrxyutr6CtLFoeFzDwBi98=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12c965b-02b7-4d14-837a-08d9d6970789
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:17:20.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HyC1GLSUWkm4YDclw2FDgLlyl9vI7VlnOOf1G7uGhBbIt8f6d3Ct9xu9MYO8Oczl+r/jNwapd4i6h06fRvtAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

Except in the "clocksource=tsc" case we can replace the indirect calls
involved in accessing the platform timers by direct ones, as they get
established once and never changed. To also cover the "tsc" case, invoke
what read_tsc() resolves to directly. In turn read_tsc() then becomes
unreachable and hence can move to .init.*.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Instead of adding __init to read_tsc() we could also ditch the
     function altogether, using a dedicated (non-canonical) pointer
     constant instead for the .read_counter initializer and the two
     comparisons done on plt_src.read_counter.
---
v2: Avoid altcall patching becoming conditional.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -66,6 +66,7 @@ struct platform_timesource {
     char *id;
     char *name;
     u64 frequency;
+    /* This hook may only be invoked via the read_counter() wrapper! */
     u64 (*read_counter)(void);
     s64 (*init)(struct platform_timesource *);
     void (*resume)(struct platform_timesource *);
@@ -578,7 +579,7 @@ static s64 __init init_tsc(struct platfo
     return ret;
 }
 
-static u64 read_tsc(void)
+static uint64_t __init read_tsc(void)
 {
     return rdtsc_ordered();
 }
@@ -810,6 +811,18 @@ static s_time_t __read_platform_stime(u6
     return (stime_platform_stamp + scale_delta(diff, &plt_scale));
 }
 
+static uint64_t read_counter(void)
+{
+    /*
+     * plt_tsc is put in use only after alternatives patching has occurred,
+     * hence we can't invoke read_tsc() that way. Special case it here, open-
+     * coding the function call at the same time.
+     */
+    return plt_src.read_counter != read_tsc
+           ? alternative_call(plt_src.read_counter)
+           : rdtsc_ordered();
+}
+
 static void plt_overflow(void *unused)
 {
     int i;
@@ -818,7 +831,7 @@ static void plt_overflow(void *unused)
 
     spin_lock_irq(&platform_timer_lock);
 
-    count = plt_src.read_counter();
+    count = read_counter();
     plt_stamp64 += (count - plt_stamp) & plt_mask;
     plt_stamp = count;
 
@@ -854,7 +867,7 @@ static s_time_t read_platform_stime(u64
     ASSERT(!local_irq_is_enabled());
 
     spin_lock(&platform_timer_lock);
-    plt_counter = plt_src.read_counter();
+    plt_counter = read_counter();
     count = plt_stamp64 + ((plt_counter - plt_stamp) & plt_mask);
     stime = __read_platform_stime(count);
     spin_unlock(&platform_timer_lock);
@@ -872,7 +885,7 @@ static void platform_time_calibration(vo
     unsigned long flags;
 
     spin_lock_irqsave(&platform_timer_lock, flags);
-    count = plt_stamp64 + ((plt_src.read_counter() - plt_stamp) & plt_mask);
+    count = plt_stamp64 + ((read_counter() - plt_stamp) & plt_mask);
     stamp = __read_platform_stime(count);
     stime_platform_stamp = stamp;
     platform_timer_stamp = count;
@@ -883,10 +896,10 @@ static void resume_platform_timer(void)
 {
     /* Timer source can be reset when backing from S3 to S0 */
     if ( plt_src.resume )
-        plt_src.resume(&plt_src);
+        alternative_vcall(plt_src.resume, &plt_src);
 
     plt_stamp64 = platform_timer_stamp;
-    plt_stamp = plt_src.read_counter();
+    plt_stamp = read_counter();
 }
 
 static void __init reset_platform_timer(void)


