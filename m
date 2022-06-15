Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A046954C622
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349942.576157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QIF-000794-7z; Wed, 15 Jun 2022 10:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349942.576157; Wed, 15 Jun 2022 10:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QIF-00075c-4k; Wed, 15 Jun 2022 10:30:35 +0000
Received: by outflank-mailman (input) for mailman id 349942;
 Wed, 15 Jun 2022 10:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QID-00075T-HJ
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:30:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ef00ec7-ec96-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:30:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6876.eurprd04.prod.outlook.com (2603:10a6:10:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:30:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:30:30 +0000
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
X-Inumbo-ID: 2ef00ec7-ec96-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEFE/xmpqlrJK+fT76C9M+gtQo5+W8+8r3Be5Yk9tJ4Yo76VQocBr1ikp+pbN4oCFn+6tPHazjl46QictiIsH2GkS8SJ7EZCP0n4QtXNsq2/xwPrdmGN/rmtTVtcaMhGklZPOrVGcErIQj4RjVh7krUHfKAJeFmZebRy5qyRNKsE0YI3KEaPRrDbjC8LwmIJdmutlJfmCa7+OXDfJbAQX8ODqxWTQ9w+6e3u42TC5m3+DZe1RA9nLTpeNUacSpe6yChV6D8ghNlNJmJ2NoIBr4NzDUmF6gs7XtMjhrs6CkkIXDkvF9Oov2RqKhIw6zR1rdE+TXA4JSxfJ98siyMJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf+9jy8WYs5YFSSKVO0mOzJRe1qi6wwM0nQAc2XnSdc=;
 b=Y+fPwhomFfs23C+nstPksrmqXpStoIO72iUKaGMtiHdztJeRVLnMYcm6uYDeYvQ4Z1xwPBB3uXYkc2OoRxwjxM8ivAS7d7JT3KV119VzCPX80cldW1wuD2Om8m+8Yu4BjeKaIZMqYJ0JlI14V1sjR2iA+jaiNbaSQFdc5tzJQjLF6jHKHQ3rt616y796jMTgKaMRHhGwMhf57o+nA5FgKGaP44v7xy7qqqNNnaOKrrL+gZ/kwCwz0lR0TMJ5wfLZ4VoE/PCNJUubDABqDUG5PAU9/KU5wuEWqPpVmJaUsO5IvX9rYPhH7TCfjZMmWxOoVQxZLATXgkAeljZQ4Op4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf+9jy8WYs5YFSSKVO0mOzJRe1qi6wwM0nQAc2XnSdc=;
 b=KonsezMEaA0kBHvSz0isaYWLV1R+DcXASQK6RhfbJPl7qJ4N+dgFbH7mEkShDWTo4+itrrrovK4aiN7wmW4d3s4AsNbP/NLiQJiW9p5VwVrFMk5iY9NZnS86IoJA2l1k3yPhQU4mcf+DlNQkQ1mXtGbPNxMv262xFXc0osI68CUzpt1FXf/dAuaFGuLPIUpONiWl/e1E/DdaVDcF/dAlOe6Gj5Oaqd49uQIOtkFGoIPwvj6zPx8AEGq8hORc9DJApvtn2pTgmpydZQq8fGxgP4hVsiM/h60WfY8gMwmLt56gIifjvppuGUJDL9ZSel1vUo+MKSRcFz9GDKZcNWi4zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c77cdba-fac9-d82b-9d68-40f8b4f82d66@suse.com>
Date: Wed, 15 Jun 2022 12:30:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 08/11] x86emul: handle AVX512-FP16 conversion to/from (packed)
 int16 insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bee5b93-c83a-433d-713b-08da4eba1269
X-MS-TrafficTypeDiagnostic: DB8PR04MB6876:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6876B222BCFDCFA88C55D51FB3AD9@DB8PR04MB6876.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XswqozxqBxBiFgV0+BPPfR7yu9zvMjyyo4OsBoB0K2ZWYZqJqOOv5iVdm2mMeomMHj2O1vsAAUr+Cuuo8ZpD89Teub/ufAd2BfZ5Fh+G5E/tNeqczJwERFk8QYL2xXr2+s0GKrLb/tW2iGsUCLLZqEoxI70MXTw7wEGgV8yKmKxLZju2V1LD+FwtvYLj83mlSa2qH7421F2cc41jSbL5cKWRwFiyLA1rXUqJKtXjzxTzb1DULnLVZpoN1HddlCyyb6cVTOr9tvgx5e0rpouiKCcAY6njtkDE9xzDSVMDDhPn5IBcF/9EmatbgzyX/t1xb5pPmB6IHtXMSXth3cDrPZJ/1YXrpCJf6v1ikGKvtrCHmSjCeDk2ICz8OhxL746/TJ6EBD7Ia0O8GK3yoMa6ovaIDBSuY7JYJNeECwl4bghZ5Xa31KoDWolakkFDTwwa5XgKgckvukNs2j+oFpwrb/ZEA+hrfIXqnu83Zlhwogj7MSlioz1FdbksNnuKj5Wh+O2R2keSmZ3mFOg5C8Mgz4WFS1XeNSGWmyAjVFlYpTThQQIYWOt5/ydCcKj07woQ37NwI6CJvwyRB0M1eit2EUl91TRl+4jWZNhSy+QFDR0Ixcbiswvwb33nmW4QbFU2D5vl/O08SOOwBsId8MRPcka/4hRvLP3eNVvX5yfZV//t7zxFW+JQlildIXQYzaPJJUqwdci2VWwujPuwtral2tO6DGTI7X2XIvz1a67ySUDNejbY7qmfLuwQpjGVDcVX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(66556008)(26005)(54906003)(5660300002)(6506007)(316002)(186003)(2906002)(31686004)(36756003)(508600001)(6486002)(8936002)(66946007)(86362001)(4326008)(8676002)(6916009)(66476007)(38100700002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNLWVp1UkNUbitnZlpmME1XYmJOclZHOWJFQTBLUFdiYXJBUDBaZktRdk1n?=
 =?utf-8?B?TkZYdUxWNzJtbks3VXFqSUJRb1cxdG5YdUZWdGtlZ1U5RWJydlJXN0RFM29B?=
 =?utf-8?B?ZFJYaEMxOTNMWkRxMDI5UVJvdXIwR25ySGdVbExXWGhRb2lrUHhxODlsR1dh?=
 =?utf-8?B?OWdYWlQzd05BZkI5cFlyejlRZmEyYlppUFJPYWhnSHBmRjlxSDJuNkI4ZVg3?=
 =?utf-8?B?bTMrSGJIU2FFN3FwZ0VxenRjTmw5OTEySEJuRndqT0VZNVRUQ29lTW11SVlx?=
 =?utf-8?B?K0M3YjJsdTFWR09jd3NiVWlZN1Y0akNEUXFqUjRIL3hzM2t3SHFGL2ZvUUx4?=
 =?utf-8?B?UGVqUE9EQ1ZGaDU1RmNpZHVDWnpoM2dOT0p5UEZLN1kxZzVBUWF6UFVQcjZ1?=
 =?utf-8?B?TENIV0ZaZDlRUlpKeUg1WmNGOXZGMFVyc20xcUVJVDdmbHBFcWQvVFlCZ2hQ?=
 =?utf-8?B?NW1jU2RqZEpJallkSUVlZEFiMlF3cU5yRDI4cG9oVzJtZ3l4OU4rMGFzN2ww?=
 =?utf-8?B?S3psSmtZZzJ1bmcwYXJYOVFMOVVjbHZaNFZ2SEFPWjZFeVQ4alVDM1FEWTA3?=
 =?utf-8?B?TDBQMDZzUXRCbi9qcHJEQVk3dnVScExubmFCYnNpeDdCMG5VcTU0ZkNINXZz?=
 =?utf-8?B?d1NBWUx1blVBalV2OWhuOXp6bURHbENwMEViakUxbHRwNDVJL3JyYkJLKy9M?=
 =?utf-8?B?bG9BU3R1cllkNVd5dXJnNXdmaENJYlFvd1k3bUJmdVZMdTkyUDNrSUtCUGRO?=
 =?utf-8?B?emNTUC9qYm9mb1ExNjFmQ20yd0x0bEIva2hIVUNCYVJ3cXp3elBGdTFnZjZ0?=
 =?utf-8?B?RTlVbWJZQUFxZDF3TG1XcUs3dTNGcWUyRU1KVWVoeWJPQ3cyU2c4aURQNXZ5?=
 =?utf-8?B?eTg3SFJsT3ZkajhQVnNhNThYeHljR1JjeGNxRWlSaTNSRzNYU0x3NlJzcGJ3?=
 =?utf-8?B?b3c5YThRS3hNdnN2NWI0WW1BdkZGU2hKemRMaFdnb2JqVCtNK3hzMWJ0TWtL?=
 =?utf-8?B?ZFBvaW4vMjhLNHVocDhXb0o2QXlEM2FydkZ4RUZMRWFJZ04zTWE5RFQzbVVZ?=
 =?utf-8?B?WGxmNzdPWFFNdGx4cVMrb2s4d3lITm5KQUprZXZiMFVlaHhSY0c0ZWVCQnpE?=
 =?utf-8?B?Y3JnMmtVWmFyK1VvUWJ6eU5FRDhHMXNoV2NkalE4YjNKVEtkNEJCUi80OWZY?=
 =?utf-8?B?ZTFSQUszdVVsMlh4d2laRGlqeWNHREh2MUJZR2ZDNHNsRlhZeHcxRmhBWXhV?=
 =?utf-8?B?NGp4ZFBhLzhxTkF2Vm53MFE4YnZ5YkFab3JOY1ZiUDZXSkxBVHBkeVVrY0Vl?=
 =?utf-8?B?R2FtTm9XQmlWY0NwWm1JV3M1cnpveXVyVTJ5blU2RmIwMnFPb3U0WXBJRDhF?=
 =?utf-8?B?bnA4Zm1MZkRmdTJqYk5EaU5lZkdGZm1kVElHSU9zVjU3OVlMdExqSVVMWmtl?=
 =?utf-8?B?YTV4VGlCcXNHL2UzV0F2NVN1MUYrNlJ4RVd5WWxGWXp3NlFSTm5wYjBZOStl?=
 =?utf-8?B?UG9kaGxQaDhZd2Y4WHUydmVtMzZIVmVrMjJJSVNFQVM5dWFxMUhzUUpTc21U?=
 =?utf-8?B?KzBlc2NJM01vYit3TEJvWis0UURsRE93S01lTitNS1hUMDdWaytNVjVhc2cv?=
 =?utf-8?B?b3V3R0k0TW44a1FhUERqRVYwQk9uQytUQmRSUUNLRUhTMkx4SHU5bGQxalpl?=
 =?utf-8?B?MkFmRTR2aG5hS0xCQkRmRitjTnZFdG5KQ24ySDl6VGY0TnhBQ3dnTFc1RmJR?=
 =?utf-8?B?cUh3M1JEZ0NDSDdTUzBVR3lBMVJ5VmRSd0prSFRtck5mUWdBa1A1bXU0dmVK?=
 =?utf-8?B?a3dlcVQvZzRMSjkzZzJwNWRDbGZZNzEyVEVyNHNhT2JrQThRcUZWK242UTBj?=
 =?utf-8?B?R2luU2lwODJqNjlKMWJTUmgyOTBURTBhVjVHZGEwTHkxM0VjRTd5VzRSNUM0?=
 =?utf-8?B?Vkp4T1dKRkxMbVBGR2RhcEx2M2MxVENMcER0Z3d4VnB5RFh3VFFGRGlsUHRQ?=
 =?utf-8?B?UVZzVnloZTk1R1R3dzkyR0JUMUNXM2JlNHdzbzZLaU5qWEdPT2sxLzVrd0t5?=
 =?utf-8?B?bG1aenlvR3hHQklIamNLUmQzMFlmdjR1cFhNTEswUTZVbS9QQ0dTZzNzVy85?=
 =?utf-8?B?OFE4MEZOT2tXUHFqOEJKMEFRNW9qWStJbXJsdHBGMjJjZXo3WGRqY0kvbGl3?=
 =?utf-8?B?TnZ5UEN6QjgxSlFmZFdYMFZHa2laR0lVYW1TV1RTaS91ajB2Qjc0bTFRTm16?=
 =?utf-8?B?b2tNWUNoaGhaVmVsT2pjV0lHODlpNGFGR2x3ZkpjRm5UcDJkenR1RXBiUkQ4?=
 =?utf-8?B?SU0rcEVuYXBaNVVsZFJnaHVzUHEzOU8xTVFKZ2pxVVI0T29qSEx4Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bee5b93-c83a-433d-713b-08da4eba1269
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:30:30.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkF9fVRpUNudE1NJvPPyL8oSiga4aDpF3JWWduid5HQLuVdkTOzYU/HQoVEsPRcxesKv7mp0VPSaSOssTIqMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6876

These are easiest in that they have same-size source and destination
vectors, yet they're different from other conversion insns in that they
use opcodes which have different meaning in the 0F encoding space
({,V}H{ADD,SUB}P{S,D}), hence requiring a little bit of overriding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -612,6 +612,12 @@ static const struct test avx512_fp16_all
     INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
     INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
     INSN(comish,          , map5, 2f,    el, fp16, el),
+    INSN(cvtph2uw,        , map5, 7d,    vl, fp16, vl),
+    INSN(cvtph2w,       66, map5, 7d,    vl, fp16, vl),
+    INSN(cvttph2uw,       , map5, 7c,    vl, fp16, vl),
+    INSN(cvttph2w,      66, map5, 7c,    vl, fp16, vl),
+    INSN(cvtuw2ph,      f2, map5, 7d,    vl, fp16, vl),
+    INSN(cvtw2ph,       f3, map5, 7d,    vl, fp16, vl),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
     INSN(divsh,         f3, map5, 5e,    el, fp16, el),
     INSNX(fcmaddcph,    f2, map6, 56, 1, vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2048,6 +2048,12 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x7c }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2uw */
+    { { 0x7c }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2w */
+    { { 0x7d }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2uw */
+    { { 0x7d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2w */
+    { { 0x7d }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtw2ph */
+    { { 0x7d }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtuwph */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
 }, evex_map6[] = {
     { { 0x2c }, 2, T, R, pfx_66, W0, Ln }, /* vscalefph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -259,7 +259,7 @@ static const struct twobyte_table {
     [0x78 ... 0x79] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_vl },
     [0x7a] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
     [0x7b] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_dq64 },
-    [0x7c ... 0x7d] = { DstImplicit|SrcMem|ModRM, simd_other },
+    [0x7c ... 0x7d] = { DstImplicit|SrcMem|ModRM, simd_other, d8s_vl },
     [0x7e] = { DstMem|SrcImplicit|ModRM|Mov, simd_none, d8s_dq64 },
     [0x7f] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_int, d8s_vl },
     [0x80 ... 0x8f] = { DstImplicit|SrcImm },
@@ -1488,6 +1488,12 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
+
+            case 0x7c: /* vcvttph2{,u}w */
+            case 0x7d: /* vcvtph2{,u}w / vcvt{,u}w2ph */
+                d = DstReg | SrcMem | TwoOp;
+                s->fp16 = true;
+                break;
             }
 
             disp8scale = decode_disp8scale(twobyte_table[b].d8s, s);
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7780,6 +7780,14 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX   (5, 0x7c): /* vcvttph2uw [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7c): /* vcvttph2w [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x7d): /* vcvtph2uw [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7d): /* vcvtph2w [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7d): /* vcvtw2ph [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x7d): /* vcvtuw2ph [xyz]mm/mem,[xyz]mm{k} */
+        op_bytes = 16 << evex.lr;
+        /* fall through */
     case X86EMUL_OPC_EVEX_66(6, 0x2c): /* vscalefph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x42): /* vgetexpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */


