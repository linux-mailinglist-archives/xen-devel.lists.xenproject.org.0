Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D35EDC5C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 14:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413300.656860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odVvY-0000pV-HA; Wed, 28 Sep 2022 12:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413300.656860; Wed, 28 Sep 2022 12:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odVvY-0000mU-Ch; Wed, 28 Sep 2022 12:12:36 +0000
Received: by outflank-mailman (input) for mailman id 413300;
 Wed, 28 Sep 2022 12:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odVvX-0000mO-72
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 12:12:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d52a396b-3f26-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 14:12:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6959.eurprd04.prod.outlook.com (2603:10a6:803:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 28 Sep
 2022 12:12:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 12:12:31 +0000
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
X-Inumbo-ID: d52a396b-3f26-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4DpHQJbFxNLQxE/1YccGtzWNZhk/bUmgAmvf5BDcM5lFOZrVyW/0iGkPaGTuBzu1LNNLU5Kap8FG6R0fN34MAFexkw4Z9bdQO3hfalllbl6bDkycx4BtJBpwIVFgdH6eTjJbLubA14sadXObaSN+e6SFNzwKhpAipabDVcRY2fcefFlRM3KGLWjlGQKs2erCIaYSwLoWiPH8qT4+wYd6j6S4wR09m3HjXcPAW7CkkBB+qogJM0XouEwxcbHP+GEnOPqavFZLL8iO+SErQZn7JV2t3NGJfyFibIQAZ0Ys0CGSW+gW3UMn1aIcUpxhB2ZZLpbRbxfM5bIv7F9yiReMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyAqsiSzPa5o+G/D+k0KBts/58aQQznsv6CR5kobuHY=;
 b=ZrTKrzbq0SmLM27SKLLiZodjQvZ1tXsWxRtz2Kp16G4gaovgS5yZ5Wy0fjuaIMUwSnUWRDvEaZBi4f9gslBHVfBTS2ydX5JXODObKagppByofyvoGO5B3znpd52LFAl14NQ4hGW6UsV1Z+GN63ApyuzSwOYY8meDk9WaBuOUYLKueo1YYPQHwK5fUZ804aSHhCQYPXp8e8kLiKvANTUM3AdNCc1Uez/GWYc9uI6/9u+wEhGyii3JMVCDKT5O8CbAq2Okiy0WEp1b4Js4ZeHNc0JQNZf8dqF4Bo3BGNtZTo4oDVfvBH4d8RiP29lEJ5dJoj6p1Ps/uVeMLciI2D52yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyAqsiSzPa5o+G/D+k0KBts/58aQQznsv6CR5kobuHY=;
 b=K6sMF90KmKdIoAGaEPMYWaSP/0GqgKeu0+9NGrPOUCCByHMTixOMORDAdIucK1QR+R88zoTcqaQW2n0nmnI4qG9awGJpbjY/FR7SfsAXQWL0bR/LUPeF/2DUI10BK37jDMV0K8FIAqF8pWMJI70rNzqDj2Cie+1Vx78oo7qD5dYczg0JUA6+mWxI274/7US/D8cGD6ekgcFeSVjd9sIoAtPsEBg3y46LqWBl9gIN3x5N9iM85y5aCsHHuWbH9F1UwOKz1VW5OVVb9qHCHwizNyn7+TpJShm2fLiVhwKjkJF8OBDt1vlVYPQuYhdTX/YtmT9eMgJ+2ADNEQcWw8YoRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a397e671-f93b-cd8f-9019-d005db7c7009@suse.com>
Date: Wed, 28 Sep 2022 14:12:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] rangeset: mark a few functions pure
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: ce531ad4-b74f-4082-4c7e-08daa14ab7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AZTdDmwiO/ugR8yONMG/R1cip0ZYQQJQ1XfKOSUp0tGyoSlElpkOFpDwcrb2hIH75KRM3Z5tGeIhBfAXBad3fnB7Ag2qHUrpJhjlBvMsF7EfDfmjauWhAfV32R27QNUVF1tjCgvQhcoOtb1tHevM7GrUZ+vjt+mhp34rkjtqLwYo4s7JxE6Ck4Lf2Y+jMapJFS7dyE+wCY9TZhvDiwB9LyDdaMSQrQ08ftYpZ/3kkmOzcfRGfIoZFHjs27cSBcIRH2TxoLadt1n0QUE8tlKe0WFscs7UT4ZN2M9U4E3NgCyuWwyGbbWB5GC0s9IJD/67m+Ax4ydiQUvGcH9I+9n5bPWUuIPrV3oAiKohGedmz5Rv4+xWI4aeTZVd7APCKzqPg8GOSph6O7Snucnk0wRvjPwSvhtGMdPI25ZngRkHZ1jA+QmvlP9G0hJq/tV5xACuOUAzKED9/GWCFWQabM9jDUo8ozL61+RqLo1a9PVUa+xTklrhu/ZngxvWVnkWW/Qly7CiVQv8JQsVMYMIjSx5Gz5RoWYAE5hzi1VchnXybHyvJGHMoPKeu9KIn5kNMYQESUctEvlGpNr0rMgiQLz59dBsjxxq5yKuAAWyE5FnTMpg+GcLoN5aVjxQgPe9A17cxELK1aLzaj5kJidZOECbwN6XoIkOfpQmD+q2jMxo2BUR4PYxwxQPhTUNavqFb3dP5Oe4dPD5NFJi/hwPi6ls2u3FlEv4G4w1Gr4/yN4Jyo9XchgiJsopBa3IWim6hEzwMlOHyXW9G5k1u+hHJS/DVhCh9A2HFu4TasPbKdy4lmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(6916009)(5660300002)(8676002)(4326008)(6486002)(54906003)(66946007)(316002)(36756003)(31696002)(66476007)(478600001)(38100700002)(2616005)(26005)(6506007)(83380400001)(41300700001)(6512007)(8936002)(186003)(2906002)(86362001)(31686004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmhaY3lIbXBZekF4ZGp6OGtyY3NMcTFNcHBZUDB1OFdPRWszdVQvTWJnUkkz?=
 =?utf-8?B?bVk2VXhHdTR2SnhXNGVnd0pPTnJaU3FMNVBKMW4zRlBDMlVPaVh0dXU1S3hl?=
 =?utf-8?B?S3pHVXdsMGx3b2VUbkE1RCt3TDNRVDlJQzBpK0JNYms2R09WRndhRWZSZHV5?=
 =?utf-8?B?ZnZrT1c3TzlERHNsWGtHeGVYRy91bW53bndmVGczK3RBZ1h2VVZ2bGYxbFFI?=
 =?utf-8?B?endDMjhlcVZTdXFmZzczMDFHaEh5dW9DMG1CT2RNT2R1bzVmbmk2Ri9TN3JG?=
 =?utf-8?B?SDgwYmo3aTRBbzkwQmZ0UHNxWDU5dWRSN1UwNWE2RVprL0hkWG5WN3RacVU5?=
 =?utf-8?B?NzlhSGdxOFcvdjh3b0hIM2orcTVydHprK1Iza0x1QWFseHFwNkNNVS9sQXRV?=
 =?utf-8?B?SUN2NVhLSkdlQmx5d1Y4a005Z0RUQkxDNUtQTXVabTE1K0hTZGdjampNSVdW?=
 =?utf-8?B?RStrM2NsZnJSaTVqUGo4bkpQajlsdHh2dlJzcDRUQi9ldW85c0tCcDkzRHJJ?=
 =?utf-8?B?NTR3Mm1zc3JFeEl1MkQvMlIrWlJ2R0dQRFdCZ1dTWkNjNHZjTWVMSDduSU5K?=
 =?utf-8?B?bGhrOSt6cExQbWFKR3RJQXZBQWdQQnVCMWZIQnlCY21CUGdSSW13QWVtS0hv?=
 =?utf-8?B?TjczVEVsczI5eldQK0lmWi9qOHowUlUwV2hPR1lYaDZ3OEVQcUxZd3RSL1Fi?=
 =?utf-8?B?U0c3dGNESEhYRCtpRUZiWExqMzg0ZGhDUURHejk2cE15VEErbzl3Mk50a3RP?=
 =?utf-8?B?ekd0WCtoNFk0YWJPSmVZNC9Id3F5RDhPVUJFd04zU0FtdmVvSWZaUzdxaFZp?=
 =?utf-8?B?Z1Q4RXVrZDkvSDZsZGM2dFhJVi94c002Q3R0Nk4zNVp0NVZqcHp3OEdVc2FR?=
 =?utf-8?B?VW8vN1J4ZWFhYU02cGNLc1ZNSnlrMG1KMXlEa29kNmMweGNXVFhIZmVWWEpF?=
 =?utf-8?B?bGh1VTBsV3dMYzl0eFVORWxRZUN4QmFPdEFqc1FiTlJGZXJDbGVYZ3JhWjFo?=
 =?utf-8?B?R0JLV0FjYUZyZ1FRYitaekZVbUpMRXBtbnZ6eEp5RWZaRHRvTUF4Qnk2N0p4?=
 =?utf-8?B?M291ZUxKek5rZXJ3eS8vM0libzJnbDlld3BtVFUrQ2E2Q0JNT21FWUdxV0RQ?=
 =?utf-8?B?bG9YYnNaUk1hc05WcXdvcm5XeVlYUm9GSDIwV2VnT0Y3cWtTWXloVlh5L0Zi?=
 =?utf-8?B?aTJjRHdtL2FOVTMxZ1FnTVJyVUkramtFSHNIdE5uTzI1RW5YZzlRZ3pjNjUx?=
 =?utf-8?B?eXZUSVcvZVl1aWJ4elhVTEEzNzc1dDRTOW5PejNKU1hqT3ZoS3YvbS91SW9O?=
 =?utf-8?B?Y29qRG1BZ2wzQ1R1c05MZDZkcVI5cnpxQmNpenFFbHloMnlzTklDUFdlQWh4?=
 =?utf-8?B?Sk5aV1ZsL3kxRHE1bFBob0pVOUtkY0w2UG1mM3BoSkMxdElYT2IrL1RkTjgw?=
 =?utf-8?B?TVpWcFBhODQ5cDF1YWdFbDI2bkN4NGpNemJ6bWRtQ2lPdG9ZclBvZVNmclFn?=
 =?utf-8?B?MkplL3FBc0dYVHc3MWJlYXBmQmdmcjdDUWI0MHFBRmhjaGdoWHBaY1F4K2Y1?=
 =?utf-8?B?MVJLSnQrbnhlbzFQT1piMFVYMnVFaG53UENrRXpaQlBFdGlIL0l3cmhXVWZl?=
 =?utf-8?B?bWMwQmMxZ3lVOVpSY01KSTZsZ3hnaFA2TmJnMWROd29QMXN6WC9SOW1lZVlI?=
 =?utf-8?B?TDZqTVpWQ3JndERqcHRicFNuQ0wySk5BQnBEOVNBZlJ5MWlkVVhSTGE1Q0dS?=
 =?utf-8?B?SnhGTzhVZWZJVjI2UFJ3MkFxV3M2OUZnK2JFYU9lK2pVaXJzb2NHM3lVL1Ns?=
 =?utf-8?B?dzl4bTBUVEltTWhGeGU1UEgvUzZLb3AvdGR1L3VqQjZhUWh5b3VhRlM5NG1w?=
 =?utf-8?B?UnVqdENMdGNUa2VLNnUyMnJwNXdpNStyR3Z5WUJzejliWDNvR2ZTR05FbWhN?=
 =?utf-8?B?eWV6YUFKSm1jd2cwRzJnd2xualArdmEzUWl4R2RMbnhvOUk2NEIvNGxlUU1C?=
 =?utf-8?B?Z1N5aGFweFdTU0VEb0tFbkFnb24vcjJ4SCs4WTcxVmpUM0lHRkVXYXRubURo?=
 =?utf-8?B?dFZYbmJsdnh6VnduZG01TkwyTEFnQVRpak04Qnc2RmR6YUtROVlubGdvUEtp?=
 =?utf-8?Q?DHqt7VuDZcucZsbXBHY47l/5M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce531ad4-b74f-4082-4c7e-08daa14ab7f8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:12:31.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAFAOdIjLfr8wTbrIXV9xVxDmQcZ511K4gbqulCsNlSyIK2HbfPt8/6y2BXoYE9c+FDGhG0plwCfnh1jphLuwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959

While for some of the functions there's locking involved, the acquiring
and releasing of a lock doesn't alter program state when comparing
"before" and "after" the function invocations. Furthermore without
(further) locking by callers, return values are stale anyway by the time
they can be evaluated. Hence both CSE and DCE are okay to occur for
invocations of these functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC for the (imo) ambiguous wording in documentation.

I further wonder whether functions trivially wrapping others without
de-referencing the rangeset pointer, like
rangeset_{add,remove,contains}_singleton(), wouldn't better be inline
ones. This would (afaict) eliminate the need for marking pure the one of
those altered here.

--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -52,7 +52,7 @@ void rangeset_limit(
 #define _RANGESETF_prettyprint_hex 0
 #define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
 
-bool_t __must_check rangeset_is_empty(
+bool __must_check __attribute_pure__ rangeset_is_empty(
     const struct rangeset *r);
 
 /* Add/claim/remove/query a numeric range. */
@@ -62,9 +62,9 @@ int __must_check rangeset_claim_range(st
                                       unsigned long *s);
 int __must_check rangeset_remove_range(
     struct rangeset *r, unsigned long s, unsigned long e);
-bool_t __must_check rangeset_contains_range(
+bool __must_check __attribute_pure__ rangeset_contains_range(
     struct rangeset *r, unsigned long s, unsigned long e);
-bool_t __must_check rangeset_overlaps_range(
+bool __must_check __attribute_pure__ rangeset_overlaps_range(
     struct rangeset *r, unsigned long s, unsigned long e);
 int rangeset_report_ranges(
     struct rangeset *r, unsigned long s, unsigned long e,
@@ -88,7 +88,7 @@ int __must_check rangeset_add_singleton(
     struct rangeset *r, unsigned long s);
 int __must_check rangeset_remove_singleton(
     struct rangeset *r, unsigned long s);
-bool_t __must_check rangeset_contains_singleton(
+bool __must_check __attribute_pure__ rangeset_contains_singleton(
     struct rangeset *r, unsigned long s);
 
 /* swap contents */

