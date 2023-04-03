Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88D6D4B46
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 17:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517506.802932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLfG-00030T-IU; Mon, 03 Apr 2023 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517506.802932; Mon, 03 Apr 2023 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLfG-0002y1-FU; Mon, 03 Apr 2023 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 517506;
 Mon, 03 Apr 2023 15:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLfF-00025F-0y
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 15:00:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39430082-d230-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 17:00:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:00:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 15:00:06 +0000
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
X-Inumbo-ID: 39430082-d230-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zj8uHsbxyqDlnVZmjqL9sx91gNXvLdLQH8LQeUnyL22V4/yrnGVAlxxV7CfVrH0ySwjDPNYErJjUcVvHbbxF9bQyWcZvGXcee/VMYUP6EIOwtDJ5HpaMYDcCmGe6C/u/3bk9NIRChLsS/c1LdMreZEKxMao0lir8rF4zASSb/z11JV/YJX+F+U+Bqhi7QvyXjaAu8LaqKR8wiJ8eEXhNPooSIPz70IS25C2zeEBD+d70/3eZZ3OiTePCYV8wL3A4m2wb0ok6GIwvPvwMvsSc+upVhEBrcwDgno62q/Jj8UvgzHqfB6Wf/sc4Ec9Kvlq4ZhmgVxSm0EiiI/k5HCVWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wxm5CGoq/DJSIHHXyHkrlfKqPlnnC/KYi/RhtFzDoeM=;
 b=gOBkorkFh5NNcVpHL/s73bGIymlZuIs0MTPIzNBXyWngnZz3RLmK35LhUV9GCL2HwXPgwttejZc+WzHjewjIgN0UqqsANn2FdaZqxMdVQxzE/RZgsIz1Irh/4KA10soQSk2rWhMGglyx0HjNNpbKzwmI6n5GpyLcaA1CxdOB8u4dvwkT4ZgqmvjdzzxOuaNRgX2VK3J6mBWL8kH30n6JnuLgznyBh7NqWZaymNtLWTFaMSEm0Wvw1CJEReYY6VDtiSc+9CVgaoZhXrz2iomnat6yXdvndba6Uq8qTHPj6rkqqtlM7rQ25gITJ7QV6tI1mhhp55mVJK78w3APBufxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wxm5CGoq/DJSIHHXyHkrlfKqPlnnC/KYi/RhtFzDoeM=;
 b=L7VenwbqWTh/tIIqcdEIQoz882tcdZFSjd+z0EBbqO3NfLRk2OtJRpmpuxfoSd5a0nU/ZgD96QVFyJFH+Q41DZXp13cH3tCay8ZpyCrZpY4DqW/Hdp4CkFqYSUi+bS2vF9/1p0WLh1fJZ4mHHmPHXr7ETxXNcV2HgKjQLAsO7vv7d1k4qbmgUwKDoM/D3aE4IkxlUzhJkZHUC41yEChLV+sd1PMbKQT3B3IYT4ernTFAOJ3ERGAUVwT74f7W77GS81zOVuWyDBuvLmdoR02E/2zpUpKcPUTrQ1Ma70X+FUJFxpMJAWk9D7umFJU4FlzKxT0+iT1fMdL8QSjUwT81rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <283bef89-b29a-3cd3-56db-a34dc4f786ab@suse.com>
Date: Mon, 3 Apr 2023 17:00:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 09/10] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int{32,64} insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 86295e5c-9d05-4e11-d2e6-08db34541cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JcRK0aNB0Ms6+hy6fVaPmT7H2TV71DRyqJWPTf/9Z0DrjivdCDIHnOUYMoxoQ/OyE54LWrA+a87FBDrD0Y0onokNbgJHhTLBXvnIIeSFryMnTR2agwtyWLTmX5YjGbERsh70xgLaqIEmkaiaXkg8aWh4kAFEPuEzHa9cbL3CpXuTV34h07s5Pa6kFuNLRdIZ8jABOUOQz520KbTS5y9zg0srigjxltyxzgaw5EBUgozvxtqzmFMBIZAxMPFPJrOo5Rwmb4oF6qcaCbq+mfWff1SLkbcwfLttAVMJR9fBZcm8Ocjh2JflD8hRg9ajjks8p4+R/DWEworBmbpmcHL89a/9VXZj9vwNJD7VNuRThRF8IIHnL9J+OW8XVVwdgwKUISngqlAVIRdBuE9+rz59JVHlhvUovjKTyH+bUieNQqHxTZLVfztJc/Vwr0nfxRTvCcPX0xJZkdgtwkGe4Penwd8LsP80Y0eydU9A3uLkzfqPqTmMQhQ2BSFRt56zkoCZ/+yfYkGnD2FqDmjry4GvUEYkK2vweL8pWoo2jg6R82XS/dUlloqMtdKY87QZ5/8sRDcvkHkwdDhZGyYcAZX66xAzfYu0Fxn4OA/UPObfNq/j/JfQ4EU2FFLl41+zRuDjqqQMT1oM7zmP7L/JwD6MHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVJOTXkxTmRRWWZKcUxwQUw1YlNHM25DRkU2L3lRWmJwVE04aUJJRkhLOFp4?=
 =?utf-8?B?WERKVzFGWEo3VzJjdW41bmtmTHg1QUR3elhEQkprK2NETXVQbTQ3dG5HTjgz?=
 =?utf-8?B?YlFtWXBCbWM0bVlNTmRJUGhueGY0QjM0K2FxUWsxdUUzVWN2eWx5ajJ3ZC9o?=
 =?utf-8?B?N1A0ZlZMQk9tSHY3RzV4aWM1N0NrL3Y5QkFxVTBwNFc4ZzBqTnhXNkE2NlJh?=
 =?utf-8?B?S0Q2WFZSL1pNYlRUbFFTUEtPN3NIZlFLczd2ZFRyNTEwVk9xWk1rVEd3a0tw?=
 =?utf-8?B?cFZpN2pnUHJoeFlxdThUMENnU0N0Q0xQbGQzaHpiRENOdlhVTm5qdWZKTnJr?=
 =?utf-8?B?UVlaOHBlb1BXTUp3WWNlUlV4dDEzenhUaEFqb2Y4MFNUd3lZVm4wL0RpamxZ?=
 =?utf-8?B?WmhlMmxvTzlZOENrcVV3Sk9nc0prRFJoUmRoTFYxNi8rK2U4MWJlRW1tNWhs?=
 =?utf-8?B?ZXpzQnlPbEx0dzZlV1lJSzlHSEFFU3BUdW5zRlNDMVVZa3JMU2NWTTFEdVFi?=
 =?utf-8?B?QVIzaHY0Z1N3MkxjSVM2RXQ1QTRCUVdibHJRYmlRNkJrUnZDQWNkTGhQTG9H?=
 =?utf-8?B?SUlBNkw1Y3l2clFodmhQMmdMQm55UUNZU3dFU1VRaU82S3FHRGRyNW5aN1Bu?=
 =?utf-8?B?NTIyUHJ2eDNBTXptR0JqMEUzWUdzQjh5UUNmV0Vtd0plWWZheUduVmo3NmVB?=
 =?utf-8?B?dU1YZUN2K3FGZEZQK05mUDB0Vjh0dldGTStxYjd6VU4yQWR2OHJYUDlJT1VE?=
 =?utf-8?B?RHJOSlJsQi9HVFgyeGY3cDh0Nld4TDRLcE1lb3d3dzU3bVhsWk5RT0paZDlP?=
 =?utf-8?B?R3dOT1p1endMWGpLbzRKb2xRalFEOVpVaVV1ZFBKVlRPTm9Jd0ZlN2hxeTVu?=
 =?utf-8?B?M2I4MG84UEo4WXdZU0tUbUVHdElJemd4WU5QcFRSS1g5eFNNc2xuelEwQXdD?=
 =?utf-8?B?MW9TVkphWU1nUG1qTFIyZHRPRU4xWFlrYjJvbUMvaGZqa20yVDdxdXhJNUhS?=
 =?utf-8?B?T2pJYUg1UWZreW5WczAxNVJjTG5aMWROZ0ZybTJOTWJjenl5Y2xtZ3BnL0NE?=
 =?utf-8?B?S1FZMy8rd0RMUEl1YXNPWG40VkllaVppMEh0ZU0wOUZyWEUvaGloVVFpbldK?=
 =?utf-8?B?TWgxekxhelhsbVoxbmdiQnVRWE1LaVBQbVZFTEtBUHFCNVBqeDQxL0NLSEt1?=
 =?utf-8?B?dG5MNWtneFYxMzVieklwVk1vb0RYZk5jZ0RBK3Jya3J3VzdmZkJJOHc4eFVu?=
 =?utf-8?B?NldDRkVQRUgrV2R2RjlJMHRUeUwwT0phd1h6ZjR1QXlFVXNkM1FTM1Fjdmxk?=
 =?utf-8?B?ZFpCTllTNklocHgwTmZGREthTitZV1ZMek8zMnlEdStWVk5wVExMY3J2MDRV?=
 =?utf-8?B?dVVXY1F4NExyL0RvTW10K0J2RUc1OHRjbURWVzhsT2ptaCtMbS9FRjhnaXVM?=
 =?utf-8?B?K2YzVDlNOFNMNlRXWWVuYkhEMm50UkcwQ1JnNDFkT2VnVkFMZTdSemlFQ3VJ?=
 =?utf-8?B?MEkyTUVFQlRBdTJLRi9XSGkvOGc1OVpaTzQ0b0lRdFkrek9SRTVlUk55cTk4?=
 =?utf-8?B?WTM3NmhGYXNMUk91VThVa01BS05JeWE4Wm5sV0xGdERFZjRPWXZvT2FibDA5?=
 =?utf-8?B?ODFZZkdydmJhZ2dIak5GeEoyR3FvbUNDbTJLNFV1NUswNVo2d1RzUzNnQUo1?=
 =?utf-8?B?bU9MYlR2MlIvTGVMS25ucHJ6aEtoM1pUMUxQUWhJVHVqUDRaRUtkRXduMDgw?=
 =?utf-8?B?VExsc1dwaGNncUFrSUlsU1VIVm02dklBODlqTzhMMk5vSmcvVUR2UG02dldx?=
 =?utf-8?B?aCttakI1NkhtN3ZBb3crK2o1WUgza1lVRVlvSTZqdENKbUQ1Ty8wNy8yUjdH?=
 =?utf-8?B?NHFldThkNUM3ZndmRTJUdFg5OC9pcnVEZ2Vad1U5bkZ5RzFKTUVhNGE4U1V4?=
 =?utf-8?B?VUVQa3lBb0l4bnZxbkViclJsNGJDNmh0eXdVUzZ2ZmpKZkwyYURTMWJybGN3?=
 =?utf-8?B?OS9aYitCcGVLNitvMVA5WTRoMHYxN0F5ZmlsL1ZBLzFvRnp6QW1xQXRtZmFj?=
 =?utf-8?B?R1R4Qmd4Z0ROdXRpRGpDWk9YSDlrMHFtbDlHQ3RDTnNGMDI4WmtGTzFHSWRh?=
 =?utf-8?Q?IJfNdk0THtwJQDklc2INbjo4j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86295e5c-9d05-4e11-d2e6-08db34541cb7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:00:06.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqNOpu3XvHJjWnAGvsYlCgKKbuFjNmm+BVpulfyJ2cixIFA7b4GEb9W3VBNqJhkbr93z+xKum8DNv95lhr4xOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -612,18 +612,36 @@ static const struct test avx512_fp16_all
     INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
     INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
     INSN(comish,          , map5, 2f,    el, fp16, el),
+    INSN(cvtdq2ph,        , map5, 5b,    vl,    d, vl),
     INSN(cvtpd2ph,      66, map5, 5a,    vl,    q, vl),
+    INSN(cvtph2dq,      66, map5, 5b,  vl_2, fp16, vl),
     INSN(cvtph2pd,        , map5, 5a,  vl_4, fp16, vl),
     INSN(cvtph2psx,     66, map6, 13,  vl_2, fp16, vl),
+    INSN(cvtph2qq,      66, map5, 7b,  vl_4, fp16, vl),
+    INSN(cvtph2udq,       , map5, 79,  vl_2, fp16, vl),
+    INSN(cvtph2uqq,     66, map5, 79,  vl_4, fp16, vl),
     INSN(cvtph2uw,        , map5, 7d,    vl, fp16, vl),
     INSN(cvtph2w,       66, map5, 7d,    vl, fp16, vl),
     INSN(cvtps2phx,     66, map5, 1d,    vl,    d, vl),
+    INSN(cvtqq2ph,        , map5, 5b,    vl,    q, vl),
     INSN(cvtsd2sh,      f2, map5, 5a,    el,    q, el),
     INSN(cvtsh2sd,      f3, map5, 5a,    el, fp16, el),
+    INSN(cvtsh2si,      f3, map5, 2d,    el, fp16, el),
     INSN(cvtsh2ss,        , map6, 13,    el, fp16, el),
+    INSN(cvtsh2usi,     f3, map5, 79,    el, fp16, el),
+    INSN(cvtsi2sh,      f3, map5, 2a,    el, dq64, el),
     INSN(cvtss2sh,        , map5, 1d,    el,    d, el),
+    INSN(cvttph2dq,     f3, map5, 5b,  vl_2, fp16, vl),
+    INSN(cvttph2qq,     66, map5, 7a,  vl_4, fp16, vl),
+    INSN(cvttph2udq,      , map5, 78,  vl_2, fp16, vl),
+    INSN(cvttph2uqq,    66, map5, 78,  vl_4, fp16, vl),
     INSN(cvttph2uw,       , map5, 7c,    vl, fp16, vl),
     INSN(cvttph2w,      66, map5, 7c,    vl, fp16, vl),
+    INSN(cvttsh2si,     f3, map5, 2c,    el, fp16, el),
+    INSN(cvttsh2usi,    f3, map5, 78,    el, fp16, el),
+    INSN(cvtudq2ph,     f2, map5, 7a,    vl,    d, vl),
+    INSN(cvtuqq2ph,     f2, map5, 7a,    vl,    q, vl),
+    INSN(cvtusi2sh,     f3, map5, 7b,    el, dq64, el),
     INSN(cvtuw2ph,      f2, map5, 7d,    vl, fp16, vl),
     INSN(cvtw2ph,       f3, map5, 7d,    vl, fp16, vl),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2033,6 +2033,9 @@ static const struct evex {
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x1d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtps2phx */
     { { 0x1d }, 2, T, R, pfx_no, W0, LIG }, /* vcvtss2sh */
+    { { 0x2a }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsi2sh */
+    { { 0x2c }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2si */
+    { { 0x2d }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2si */
     { { 0x2e }, 2, T, R, pfx_no, W0, LIG }, /* vucomish */
     { { 0x2f }, 2, T, R, pfx_no, W0, LIG }, /* vcomish */
     { { 0x51 }, 2, T, R, pfx_no, W0, Ln }, /* vsqrtph */
@@ -2045,6 +2048,10 @@ static const struct evex {
     { { 0x5a }, 2, T, R, pfx_66, W1, Ln }, /* vcvtpd2ph */
     { { 0x5a }, 2, T, R, pfx_f3, W0, LIG }, /* vcvtsh2sd */
     { { 0x5a }, 2, T, R, pfx_f2, W1, LIG }, /* vcvtsd2sh */
+    { { 0x5b }, 2, T, R, pfx_no, W0, Ln }, /* vcvtdq2ph */
+    { { 0x5b }, 2, T, R, pfx_no, W1, Ln }, /* vcvtqq2ph */
+    { { 0x5b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2dq */
+    { { 0x5b }, 2, T, R, pfx_f3, W0, Ln }, /* vcvttph2dq */
     { { 0x5c }, 2, T, R, pfx_no, W0, Ln }, /* vsubph */
     { { 0x5c }, 2, T, R, pfx_f3, W0, LIG }, /* vsubsh */
     { { 0x5d }, 2, T, R, pfx_no, W0, Ln }, /* vminph */
@@ -2054,6 +2061,17 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x78 }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2udq */
+    { { 0x78 }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2uqq */
+    { { 0x78 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvttsh2usi */
+    { { 0x79 }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2udq */
+    { { 0x79 }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2uqq */
+    { { 0x79 }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtsh2usi */
+    { { 0x7a }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2qq */
+    { { 0x7a }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtudq2ph */
+    { { 0x7a }, 2, T, R, pfx_f2, W1, Ln }, /* vcvtuqq2ph */
+    { { 0x7b }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2qq */
+    { { 0x7b }, 2, T, R, pfx_f3, Wn, LIG }, /* vcvtusi2sh */
     { { 0x7c }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2uw */
     { { 0x7c }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2w */
     { { 0x7d }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2uw */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1497,12 +1497,25 @@ int x86emul_decode(struct x86_emulate_st
                     s->simd_size = simd_scalar_vexw;
                 break;
 
+            case 0x2a: /* vcvtsi2sh */
+                break;
+
+            case 0x2c: case 0x2d: /* vcvt{,t}sh2si */
+                if ( s->evex.pfx == vex_f3 )
+                    s->fp16 = true;
+                break;
+
             case 0x2e: case 0x2f: /* v{,u}comish */
                 if ( !s->evex.pfx )
                     s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
 
+            case 0x5b: /* vcvt{d,q}q2ph, vcvt{,t}ph2dq */
+                if ( s->evex.pfx && s->evex.pfx != vex_f2 )
+                    s->fp16 = true;
+                break;
+
             case 0x6e: /* vmovw r/m16, xmm */
                 d = (d & ~SrcMask) | SrcMem16;
                 /* fall through */
@@ -1512,6 +1525,17 @@ int x86emul_decode(struct x86_emulate_st
                 s->simd_size = simd_none;
                 break;
 
+            case 0x78: case 0x79: /* vcvt{,t}ph2u{d,q}q, vcvt{,t}sh2usi */
+                if ( s->evex.pfx != vex_f2 )
+                    s->fp16 = true;
+                break;
+
+            case 0x7a: /* vcvttph2qq, vcvtu{d,q}q2ph */
+            case 0x7b: /* vcvtph2qq, vcvtusi2sh */
+                if ( s->evex.pfx == vex_66 )
+                    s->fp16 = true;
+                break;
+
             case 0x7c: /* vcvttph2{,u}w */
             case 0x7d: /* vcvtph2{,u}w / vcvt{,u}w2ph */
                 d = DstReg | SrcMem | TwoOp;
@@ -1524,10 +1548,34 @@ int x86emul_decode(struct x86_emulate_st
 
             switch ( b )
             {
+            case 0x78:
+            case 0x79:
+                /* vcvt{,t}ph2u{d,q}q need special casing */
+                if ( s->evex.pfx <= vex_66 )
+                {
+                    if ( !s->evex.brs )
+                        disp8scale -= 1 + (s->evex.pfx == vex_66);
+                    break;
+                }
+                /* vcvt{,t}sh2usi needs special casing: fall through */
+            case 0x2c: case 0x2d: /* vcvt{,t}sh2si need special casing */
+                disp8scale = 1;
+                break;
+
             case 0x5a: /* vcvtph2pd needs special casing */
                 if ( !s->evex.pfx && !s->evex.brs )
                     disp8scale -= 2;
                 break;
+
+            case 0x5b: /* vcvt{,t}ph2dq need special casing */
+                if ( s->evex.pfx && !s->evex.brs )
+                    --disp8scale;
+                break;
+
+            case 0x7a: case 0x7b: /* vcvt{,t}ph2qq need special casing */
+                if ( s->evex.pfx == vex_66 && !s->evex.brs )
+                    disp8scale = s->evex.brs ? 1 : 2 + s->evex.lr;
+                break;
             }
 
             break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3577,6 +3577,12 @@ x86_emulate(
         state->simd_size = simd_none;
         goto simd_0f_rm;
 
+#ifndef X86EMUL_NO_SIMD
+
+    case X86EMUL_OPC_EVEX_F3(5, 0x2a):      /* vcvtsi2sh r/m,xmm,xmm */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7b):      /* vcvtusi2sh r/m,xmm,xmm */
+        host_and_vcpu_must_have(avx512_fp16);
+        /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2a): /* vcvtsi2s{s,d} r/m,xmm,xmm */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x7b): /* vcvtusi2s{s,d} r/m,xmm,xmm */
         generate_exception_if(evex.opmsk || (ea.type != OP_REG && evex.brs),
@@ -3655,7 +3661,9 @@ x86_emulate(
             opc[1] = 0x01;
 
             rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp,
-                           vex.pfx & VEX_PREFIX_DOUBLE_MASK ? 8 : 4, ctxt);
+                           vex.pfx & VEX_PREFIX_DOUBLE_MASK
+                           ? 8 : 2 << !state->fp16,
+                           ctxt);
             if ( rc != X86EMUL_OKAY )
                 goto done;
         }
@@ -3685,6 +3693,12 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+    case X86EMUL_OPC_EVEX_F3(5, 0x2c):      /* vcvttsh2si xmm/mem,reg */
+    case X86EMUL_OPC_EVEX_F3(5, 0x2d):      /* vcvtsh2si xmm/mem,reg */
+    case X86EMUL_OPC_EVEX_F3(5, 0x78):      /* vcvttsh2usi xmm/mem,reg */
+    case X86EMUL_OPC_EVEX_F3(5, 0x79):      /* vcvtsh2usi xmm/mem,reg */
+        host_and_vcpu_must_have(avx512_fp16);
+        /* fall through */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2c): /* vcvtts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x2d): /* vcvts{s,d}2si xmm/mem,reg */
     CASE_SIMD_SCALAR_FP(_EVEX, 0x0f, 0x78): /* vcvtts{s,d}2usi xmm/mem,reg */
@@ -3756,8 +3770,6 @@ x86_emulate(
         ASSERT(!state->simd_size);
         break;
 
-#ifndef X86EMUL_NO_SIMD
-
     case X86EMUL_OPC_EVEX(5, 0x2e): /* vucomish xmm/m16,xmm */
     case X86EMUL_OPC_EVEX(5, 0x2f): /* vcomish xmm/m16,xmm */
         host_and_vcpu_must_have(avx512_fp16);
@@ -7787,6 +7799,38 @@ x86_emulate(
                          2 * evex.w);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX   (5, 0x5b): /* vcvtdq2ph [xyz]mm/mem,[xy]mm{k} */
+                                       /* vcvtqq2ph [xyz]mm/mem,xmm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x7a): /* vcvtudq2ph [xyz]mm/mem,[xy]mm{k} */
+                                       /* vcvtuqq2ph [xyz]mm/mem,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 16 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_66(5, 0x5b): /* vcvtph2dq [xy]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x5b): /* vcvttph2dq [xy]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x78): /* vcvttph2udq [xy]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x79): /* vcvtph2udq [xy]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 8 << evex.lr;
+        goto simd_zmm;
+
+    case X86EMUL_OPC_EVEX_66(5, 0x78): /* vcvttph2uqq xmm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x79): /* vcvtph2uqq xmm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7a): /* vcvttph2qq xmm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7b): /* vcvtph2qq xmm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        op_bytes = 4 << (evex.w + evex.lr);
+        goto simd_zmm;
+
     case X86EMUL_OPC_EVEX   (5, 0x7c): /* vcvttph2uw [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(5, 0x7c): /* vcvttph2w [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX   (5, 0x7d): /* vcvtph2uw [xyz]mm/mem,[xyz]mm{k} */


