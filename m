Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD66D029E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516598.800975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phq9z-0000ry-Ow; Thu, 30 Mar 2023 11:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516598.800975; Thu, 30 Mar 2023 11:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phq9z-0000qQ-M6; Thu, 30 Mar 2023 11:09:39 +0000
Received: by outflank-mailman (input) for mailman id 516598;
 Thu, 30 Mar 2023 11:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phq9y-0000qI-OF
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:09:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c0b098e-ceeb-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:09:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8060.eurprd04.prod.outlook.com (2603:10a6:10:1e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:09:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:09:35 +0000
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
X-Inumbo-ID: 5c0b098e-ceeb-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5FEhAeSahj2JUfpJg1is+sdDernDO9VzSWdeUObID0f3YLb8mE+hWPPivHnAbj2HvcfDs9NS1HdcYf0aQ2N6CmdV9kDBW09jetWfsgIUJMW+nW+coOtF2dgexywH9bPNlk+kSljMnOrBndMTX6NvQMptdLmT/8IfKPW1cnxjUz4eac8yMFca8lfrmwx6+4DK9E2QjMMq1znq4X/pDj/x6+G7jDLoSur7ALwqpUBIjlrqmxDCFaFF/ubbTYX7lnIDMvakJgUQhgPMEDagn0qk9omR02N5Qy12acf+Odbwc6eiC+wl3BJEKQFpuHdzMU1QDnqJMkDRJT0Ju+aSBNflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGY6d0J2XaHx38aYuWcLZrVOdu+PDwxliyvBCYwIvHo=;
 b=Q14Ar1qBs6RAGNtNDGRAEeUrVhvcRBiCK9QxGWMUxiBJ3owuwZoBeboJWptumgjExJ6EnuH/jzb3xW0IejXibJJTN2T9u+UFJd7wiS9barIfGI8uC5MCjKyHqsy4Uuh9SWXm/ncU2UBYQi27gWgWibBwE2PMaJo7RBLwatVRZdIwzTIk/5yr506IMJ6GMQ6BYfgc5iILCfmWLtao6N+NbiK/eRlY0a7LyR9cg1rY4baZIoBgvvImqIzWrMJeEhQBarIvgvHWdavOWyp2nSforVCJSanac5sIexE/xdsmiG4g8zRtzcfIUiJ25363YdAflXTYZgQhlHbpNB8KVLv3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGY6d0J2XaHx38aYuWcLZrVOdu+PDwxliyvBCYwIvHo=;
 b=3KJNc+MpeVriGOkyWPCm8P0kzQ3yQxyIWwAb8ev4Vb+AwmzGa0Cl936RnpHQ/X8Cp5vVIg+56h3pgJYqwEmDhUPxNRyzNwyA2Yxd7P3RL5JVd62IILf0RYCeFPEUk6uA/Q0our5muBJ8S+txkAJsqMKBTy40qKr5T4vUcfWlgwEAlt+1uOKWHFWYr9Rp5Ts9L3wKuJpR3atVfUm3KTFrRVD1XJljPJmbTbT9tdpZ57PgLoA8EQveytFtBJv830dREMcGrqdm5XOOKpRHuT4rgZWglj+fI16hcuGPL5qtaUIgPnbLTUFtOxWnndgP+yewVQk8XwwKUBgJn6gR5kKpHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0045a958-1718-566f-ed46-0648b1fd09c1@suse.com>
Date: Thu, 30 Mar 2023 13:09:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86emul: further correct 64-bit mode zero count repeated
 string insn handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbf96d4-e26b-4301-dea3-08db310f3ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yiooRpSt8ccqWFtcRWvsBLeBH0UI9H+jyM7rpC+20mBDeoIbleca+c4SpHMq2EjeNlDzAZAw/nweqHTKwWl+M5rVJ/0lcYvC1tCiPbZjgob7NR4Yppy5OOVQhzhZCmuirScq6aiBNBFxVAw3wJArv9x5pRjwO/vr5PRHpdc6Qc5DS62YL/WNKeWzGJjhidUgmfvtTF118LtgqXWcCSf+Z3J/L6KgEAk0PlMe4R/vooogyNycC5zk1CKnLBLuaGPJBBm1/+e3n6JwVZO/RQA8wXLsonJhGCrWGuI8YSP9Vyp6FiBr4uuQ468TmLKo3U1vxoVBae19L3jfGWbzG77CuxUmcCnmhwYY510kHEf5wAgMXGcYt+tlKRzU847nEABVyVZE0WV65548E57MWgFRA7+kW741H6H4h1lfhbTdOnANao2T1U6pZa/wTgVUkQCBso5R8IXt+Bh0AZsg60So/URRR5B9cjSpD9urNIIBe/CQFm9SztzsVuGJLwzU72wn5QigXqai+aekYqSfa3vVsFJUrDezpGDvwNXyIoo1GNlK036bEdKMZzWc0R0bW7Px76JG8rFuZCgI4EgjwcO5GEUjXIxETSEgYD6RU04jNmZuUMxXEVrF/y6/pDd0iT1dl0HnXqPwlrqZhpUQUuXQHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(31686004)(38100700002)(31696002)(2906002)(2616005)(83380400001)(6512007)(86362001)(186003)(26005)(6506007)(8936002)(54906003)(316002)(8676002)(478600001)(5660300002)(66556008)(6916009)(66476007)(66946007)(4326008)(6486002)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXIwc3lWTG1BdFpkZ0dtOFdvL2NMcUVUUGtySnJOVjF2WGRXWVg1emFKWFFM?=
 =?utf-8?B?aTBLelR0NVAzTldqZkNYZDJlMUhFeTIybFh3QloyQ2JzZEFLaUdjWm5Qbzlr?=
 =?utf-8?B?MS85bVJWRWFRSFBjZmdpWitnT28wYkYwTXhrVjVibzhwS2hucnJ6alJTdXlC?=
 =?utf-8?B?TlRFQzh6RFJHczRBQjI4b3VtMTJwY3ZhMmwrcjdzd3ZYOTRlajFPb3UyZFhi?=
 =?utf-8?B?eW9yay9HVUJhKzdIZW5nbVliN3FHL0xFTFlLeUVyVlRFSjZ3NWN6TXJFSHd0?=
 =?utf-8?B?cUlRMmFNbTRIY3FKdkg0eXZmU09ES3VYeG1rR1hRZzlGblhEa2diVzFrcUMv?=
 =?utf-8?B?aUZRYTlaTENxWVVtSjNYMUdBbHlUWk1GUnRFQmVWUkNkMXk1TTUrc2M0NUI5?=
 =?utf-8?B?bkFic1VVUVJXS1R6SFViWld0RFA2ZWw0b2o2cVVYbEhVUzVhTmo2cWozazQ3?=
 =?utf-8?B?UGJ1ZGZHdXMrSmxpUFcwRCtPU0hmUzBJejUyQnl6UmxnWkJNTWZXZjYvTjhS?=
 =?utf-8?B?RlNpeDdESVdBZ2pBZHI3UFBqTDhzOFR1Sm5pUUFNVFdJYzc5Y0lIRFJrdGRN?=
 =?utf-8?B?VTFqQ0tqS3RuY21la056Rklta2l5b0N3cnFwQkQ3MnJVRWIyTDdhOXZxYllU?=
 =?utf-8?B?dStaVFNzVysxbUF1RHZMQndRd0lVWXZpaWtCQURWVTEzcStWZUNCUlBKYkFu?=
 =?utf-8?B?RTBhWUFWRmEvVWFPZGEvYVh5TVYzbHlEcDh1NktiRHgvZGZXcVpMMDJhVmN2?=
 =?utf-8?B?MGdsZitwdHBDNlQxUktabUIvTG1rbDluUjRMbzV3cDRSdnQxRXFwUXltOEcy?=
 =?utf-8?B?dXh0bzdUYUw5WDc1WmQrVi9tTEpDRjg1QnRpYXVsbnBpK2tucG52WXBTdHBi?=
 =?utf-8?B?ZE4wM1phdU5wZyt5TGQvb3BNcUtBOXpjOU9BdjdJb2Y4R09SUk4xZGVubUlm?=
 =?utf-8?B?dkFLZGdEQXMxTkNGdlFxRmtUUHVmYUhQYXRNUkh5blc5VFB3S0VDSXk5Q1Vn?=
 =?utf-8?B?QlVwdWQ3RzY4UTdqeGMwSkU0eDdlV0pVQXhvaDVPVzVVb2Z5aDk1cEdnWWhF?=
 =?utf-8?B?N2d1V1dlNTBmWHIyOGd5NjVXMGtvU0lHQjdLMXdLMk9BOEFKRGVNN2dkUXo5?=
 =?utf-8?B?S3VPM2MzTWdTeEUzNHVNVVVuZDBNZk1DSEtSRjlNQnNTM25zWngwTHlERUNm?=
 =?utf-8?B?Rk1sUVJRd21xaytKNkQwVWhIVXV3M05aZHJCbXI1SGJDd0ZldVFPM3p3eW9M?=
 =?utf-8?B?MzR2cnU0OUc5V0s5RUpVcTJOd2tnSUFjNlgzUmV3ZUR6Q1BBb3RDd1hBa0l4?=
 =?utf-8?B?YjlGL2VqZHJValpBNFlQY2ZtTUtpY0ZsT0xUVmVOWE1zTWR3U0grZnYzUldG?=
 =?utf-8?B?NnBjYlFnN2tXUzhMdzRVVXlhNlJ0Wkc3c1hIYWNPcVp1UFZFZDM5WlNGY1VR?=
 =?utf-8?B?UFEvVHpSN0VmdEZORy9GYzcvNnJrbGhmaktHOXBxYXhPNFVCMVdER1RkczZz?=
 =?utf-8?B?cmJpOStWTmQ2K3V4WUpGOU13Y2R4ZExSOExiaFJMcmFwcXo4WC9OVXc2MEh2?=
 =?utf-8?B?RXU3Vk9PeFhvTlY5bllyWmxVNlU4R0dlQVpEQzlvbTRXRlJtbmVSNnp4SGQx?=
 =?utf-8?B?clh3QS9pUlpLMEErNmtUSDc1cjVFazlTOEVYb2NFWFZxZVJtbHVsK3VWQm9h?=
 =?utf-8?B?VnQ0VFVTWTRTUGtxZy9wTGhMMWp3N2wxNGNRNGkrOEJNV0VmbFpodUp1ZG9Y?=
 =?utf-8?B?K0YwYnNjaTNXVXJHZmI5Z1YrNTM0a2dCcmp5S084Y0xKS1lBcklrd0FMK25M?=
 =?utf-8?B?cTk5RTVRSGkyWFc3bHdJR0Nwcjl3Q2g2cCtTZzBGUlFlYTJINFZOaWFLTjcz?=
 =?utf-8?B?cjMzUGk5T2Nkb1FTZXBhUTJIc3ZySXpZNXZCQnB2WG1oRC92d29USHRxajY2?=
 =?utf-8?B?RDU4S3ZCb3hPMS9wemtxcDBvaVF6TElCYlJLK3NyeTdhZythSnVhNWJMWnlL?=
 =?utf-8?B?dmdkeGFtT0V4dzhTdW95MDZXZEhMTi9xNEFOVDkwYjlTVXYxaWxZM0pITnhr?=
 =?utf-8?B?QWRORDc4SXo5bUZMNUs2Qmp3RTVITE1UYnUrdnhHcnQzTlhZUFJiaEt3TkdB?=
 =?utf-8?Q?PSHQtv3SLocp62rYg0ScE1/ro?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbf96d4-e26b-4301-dea3-08db310f3ef8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:09:35.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VedAkZXKYN3L7KdFEaVzX45G1ougkYcTzIqZIUir2iNmAmEaIrcZNROOOAlPtW/PTHbfDmNXhds71vhx+yuJvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8060

In an entirely different context I came across Linux commit 428e3d08574b
("KVM: x86: Fix zero iterations REP-string"), which points out that
we're still doing things wrong: For one, there's no zero-extension at
all on AMD. And then while RCX is zero-extended from 32 bits uniformly
for all string instructions on newer hardware, RSI/RDI are only for MOVS
and STOS on the systems I have access to. (On an old family 0xf system
I've further found that for REP LODS even RCX is not zero-extended.)

Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Partly RFC for none of this being documented anywhere (and it partly
being model specific); inquiry pending.

If I was asked, I would have claimed to have tested all string insns and
for both vendors back at the time. But pretty clearly I didn't, and
instead I did derive uniform behavior from just the MOVS and STOS
observations on just Intel hardware; I'm sorry for that.
---
v2: Re-base over re-ordering against previously 2nd patch in a series.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1589,7 +1589,7 @@ static inline void put_loop_count(
         regs->r(cx) = ad_bytes == 4 ? (uint32_t)count : count;
 }
 
-#define get_rep_prefix(using_si, using_di) ({                           \
+#define get_rep_prefix(extend_si, extend_di) ({                         \
     unsigned long max_reps = 1;                                         \
     if ( rep_prefix() )                                                 \
         max_reps = get_loop_count(&_regs, ad_bytes);                    \
@@ -1597,14 +1597,14 @@ static inline void put_loop_count(
     {                                                                   \
         /*                                                              \
          * Skip the instruction if no repetitions are required, but     \
-         * zero extend involved registers first when using 32-bit       \
+         * zero extend relevant registers first when using 32-bit       \
          * addressing in 64-bit mode.                                   \
          */                                                             \
-        if ( mode_64bit() && ad_bytes == 4 )                            \
+        if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
         {                                                               \
             _regs.r(cx) = 0;                                            \
-            if ( using_si ) _regs.r(si) = _regs.esi;                    \
-            if ( using_di ) _regs.r(di) = _regs.edi;                    \
+            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
+            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -4255,7 +4255,7 @@ x86_emulate(
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
         if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
             goto done;
-        nr_reps = get_rep_prefix(false, true);
+        nr_reps = get_rep_prefix(false, false);
         dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
         dst.mem.seg = x86_seg_es;
         /* Try the presumably most efficient approach first. */
@@ -4297,7 +4297,7 @@ x86_emulate(
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
         if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
             goto done;
-        nr_reps = get_rep_prefix(true, false);
+        nr_reps = get_rep_prefix(false, false);
         ea.mem.off = truncate_ea_and_reps(_regs.r(si), nr_reps, dst.bytes);
         /* Try the presumably most efficient approach first. */
         if ( !ops->rep_outs )
@@ -4633,7 +4633,7 @@ x86_emulate(
     case 0xa6 ... 0xa7: /* cmps */ {
         unsigned long next_eip = _regs.r(ip);
 
-        get_rep_prefix(true, true);
+        get_rep_prefix(false, false);
         src.bytes = dst.bytes = (d & ByteOp) ? 1 : op_bytes;
         if ( (rc = read_ulong(ea.mem.seg, truncate_ea(_regs.r(si)),
                               &dst.val, dst.bytes, ctxt, ops)) ||
@@ -4675,7 +4675,7 @@ x86_emulate(
     }
 
     case 0xac ... 0xad: /* lods */
-        get_rep_prefix(true, false);
+        get_rep_prefix(false, false);
         if ( (rc = read_ulong(ea.mem.seg, truncate_ea(_regs.r(si)),
                               &dst.val, dst.bytes, ctxt, ops)) != 0 )
             goto done;
@@ -4686,7 +4686,7 @@ x86_emulate(
     case 0xae ... 0xaf: /* scas */ {
         unsigned long next_eip = _regs.r(ip);
 
-        get_rep_prefix(false, true);
+        get_rep_prefix(false, false);
         if ( (rc = read_ulong(x86_seg_es, truncate_ea(_regs.r(di)),
                               &dst.val, src.bytes, ctxt, ops)) != 0 )
             goto done;

