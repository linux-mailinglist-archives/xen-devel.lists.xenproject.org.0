Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226257697A4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573052.897361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSzl-0007eW-Kt; Mon, 31 Jul 2023 13:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573052.897361; Mon, 31 Jul 2023 13:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSzl-0007bo-Gh; Mon, 31 Jul 2023 13:31:33 +0000
Received: by outflank-mailman (input) for mailman id 573052;
 Mon, 31 Jul 2023 13:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQSzk-0007bi-5Z
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:31:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e8756d5-2fa6-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 15:31:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9411.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 13:31:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 13:31:27 +0000
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
X-Inumbo-ID: 8e8756d5-2fa6-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlKISsqCRkQKaKteTv1iFa120j0W1FH7XsHA2zMQGU7udPUeDkfFvutmi9TCQj0e6pTcZd09jEYPVgEu0jxgN9XFcx2iNeRqL/FvpNQ6/r861sraw6L4XC9H493ij3GOWlrZDZkUfhHPwODLsytDmORN7VxS2gwFULRXcHwLojUFg8bSpXJh5Y7Z93xWeIqtXp502zx69mFUGa8b2n5gWAgmZqq/buMBIwh43qiciPq/D7GKvM88zoBcRly6QTGni2gcZHK96CIU/fvJboGy7EMSwPlEgRUrWwygnaqF3YT9Q38GCRAXztSfjEFSDtE0KDx1fb1uUTPhT1922pQiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u6Ro9TH7gEX09Hl6hvYAKoJ1p86WOM8kiqVVm11DA4=;
 b=l2tZu7xfavIVHAbxnJUWSWwbnCnrd30KKfOIx4MwCLBiBmpBYePZYeoVblNEGlywVjgc6naZriZTxp8u/5GeTTY+a2WRX4Gm+gcMfy8vhuzkWcLcM1+dIZxW/KmrSTfq0rXRpWpwLuFmiZfMjLtwcbNJGBpz6TBs3RVB04CoJknXHpq5xNqmHEWc2lahSKtPKDZiHXRIQ/0NSQIElcDzHcheyztWWPeX76TMFX/THvcQuBXq7Vt/7BG+dFcLjFlvNvXw1rO7ZiI6RjpL8zm+3gZ9E2rsJSSeZV+x5JdZ6k9ZyL2kPHk4F40n18rzJe8mSNC80qI2meJued8GX+zKYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u6Ro9TH7gEX09Hl6hvYAKoJ1p86WOM8kiqVVm11DA4=;
 b=Ghy78BknTA2npD8vj7Go7+HCzo6dfb8ZmH5Flq8h7KW4wK4H+4j47T81jZ5k+LGyOJt+Rt+WyLBLtkz7ilwAXCVCLJL35cyq+OPTclJ7U0CiNuMpyWnQHw8rFOAVb7+ZWwF/IuycVQUS/IxLWJUd2nErf5pylf1XvjsPatv5qOSVHgAWFCkUJrSL4G+/xEtRMeFzHWcxIzNzV+eb/adioVkcZCJI8eQC2Xu4rNy77o/88MHA4zngtfjfP95VYHdmfwLgoyY3xsjOJgwuMfvmUg7zWGVlKVJ9oM6F7iogHyM3O4pUNNdMH0xjRP0w3g/e/DL2lHQ6NC+WbpJEACHzbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9035197-b329-af2e-65ed-af31cd0375c2@suse.com>
Date: Mon, 31 Jul 2023 15:31:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: tidy _hvm_load_entry() for style
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b44274f-c63e-473c-499d-08db91ca713b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sVWOjyNUtOqfNVZBXPIgTFmXpCfchYFn0KjcS++DbVniD1HEavfS3akBRcfeBNSVyRf2UfZhXhyJrTBDJY01wJMDfoMHVVIdGmgX1uzKc39PdvxkfvvQCpRV296/DLnZ0SVPqo5dl4O/2T0/VqI4rki1t6UzS9WFU1Wb1Gxn4Svm8iYrquHHXOCBTmjL2PkDndLjrdL1k6+Va7r+Gj9P11P9H/oAEYmA1GhaB+QwIZgZidqj0mR6Kg2n0qhQtaKi7a5e64cdNPxJWVOYIhLOagUHo5WSDuNYNTlRXUp95fuzCBgs0Xckm1seC1H5/8FewBe+dtbIhVrKJH+pMBzGJlBMTH0EuCpcNjI6yc140xNo/sc3TMvrq0kBEyfB4gsHYg0ojvwqG1t9DRy4pI/nfOELt+G+pXikCNQ/xkewlZkbnyXwKkxpF+B3tsBU+vrBhpYsi4hp4So/w5AxbLWST6cMIA/a7lDC4hYxZfCdz8cxO0Vr1F2lNvz7sGiAKi06bmB1pSqqBM/CgFAofXmTdxhGFg+qc20g6q0YANlISX4+5h4z55XfuqVzru8IMYFx3REIQOf3hO1nS58PmVp+WGbPP8nA0LGcz6JmvhG5n7C2NEW9UzDNbh+a6OEXhqqk8izQwZdQ7ZRc7QcIe8lu5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(6512007)(6486002)(36756003)(2616005)(26005)(6506007)(186003)(66946007)(66556008)(41300700001)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(38100700002)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJjZndmT0FsTy9RclcwM1BMWC9aZmI3cHFvWFFLb0JaTjZ2SndLNjU4OWxz?=
 =?utf-8?B?bURxYzAxalQvRHk3a1hwN0lGTWJSTUZWVWZaT0I2enp1OTQ0M21OVVBxMU8z?=
 =?utf-8?B?MlBiWk94WWNSMUtjZVJlc2Z4bmxWR3RrT0EybUlLWk9hZ0ZUQ3NCMS9seWJH?=
 =?utf-8?B?WU95ZVl1ZFEyL2l0L3Q3dS8zRVViZk5mM3pQQXVLWThLWkdOZ213NnVnaTN0?=
 =?utf-8?B?Rkt6MG9QcVNUWTk1bTkxY21ibGErTUtMUSsrSzBOZVU2YllQK0FOakFBVHh2?=
 =?utf-8?B?QVJ2ajJvdTcrMklQSkd4dnFFaE1FSE0vRENEMDNheHdPeFRpVzZ2cEVpUTI0?=
 =?utf-8?B?NUtZQ3Y2WEpFUUhzbUVCUVdnWFpzNzE0ZDBidFJHaG1KMm1wQjJ4dFU5amJk?=
 =?utf-8?B?MWpSQVJUUDJXbWtLQU9jUWNHaHJDM3g0V2hOWUZ1LzNTYWt4SjlmR2lWNkhS?=
 =?utf-8?B?ckhrdEdrZFFySExJNjVram5aazZ4cmV5V3lidmdpdFoxb2x4Z3FSQkVLZTV4?=
 =?utf-8?B?UkJacHIzOHNWYk9FYkp1RmQvbExucklzMFZEU25jWm5aY0tiN1dMeHhvR3V3?=
 =?utf-8?B?ek9UcEJUM3dSdWZvZ3YwOVhsZU1zMkx5NlhjZzdwT1NWa05ZNExjSXY0K3FJ?=
 =?utf-8?B?UEFJbnNtWlJvQkpQcDF5VXBqamlpcHNNZzJ6Rlp0MlduVGlEQWtEWFdIdUZt?=
 =?utf-8?B?bW9BbUlyZFdGcEtHcVFIcFJCV0RGQW9TdHBoSjUrSEMzK2FqVFZZL0VzcHU5?=
 =?utf-8?B?dDFaemlrSkluK0RGbjVEaUlNaCtLY0dLY3VPR3FtalpUaUd4dkUrYmV2TVha?=
 =?utf-8?B?c3J1NE81TElpcVlNZ3VzYnN6SEJpMW02U1N2V0lSZFJDRGlaQllacHdkYjRQ?=
 =?utf-8?B?MExIajBvdEdXcm1qMlJMVzg3SVBPUUMwT05iU3U1bHNZVGV1RlgySm5DQVNQ?=
 =?utf-8?B?STA2ZDB5TVJ6OXFxOW5HUDZ4ZlpNQVNNN3Y1bVU0SUExNmpvUnFwSk1pNzh4?=
 =?utf-8?B?RmNpT2taMVh1QnBlMkNFRWU0WGxSbE9pcFJQZDVRQzF4RldJcy9QYkZUSHlB?=
 =?utf-8?B?MVhGdXlwdTgxdFZ6NWtrbVlzRFkrM0FiWm9QMXFqMUZYa2I3RjdmT2VuYVlt?=
 =?utf-8?B?eHFRS0JLZEZ4SUc2YU4vKzRkSU5PN29FR092Q21mTHZKRGFMWWRSNkNsZi8w?=
 =?utf-8?B?ZTg4RzJoZkEvaDg1d0tnaWpCNFlwZFZqMUJIVlpsbnRaWTJZYXV6ZDNYTkN5?=
 =?utf-8?B?Yk8wTWFINXlJSmF0dTNuTFljUnB1UGgyM0l1NkhQVVFZOGZYRjVmR2lDOXp6?=
 =?utf-8?B?WDVsUWQzTWJoVzlDdG42c0dMejZ5c0pDbUQ2Q0xjYjgyQTl4UnNZUStyZlcw?=
 =?utf-8?B?eVV6QVJaV3dITkhVRWpOVDFvdGZ2ZHY3SGtuaFB5NENKVTF4amk0VXFtdmdl?=
 =?utf-8?B?cStnNTcyMnFsc0VlZ0RpcjZ2cEJUcElsMFNWVmttYURySFhkRUdxYTBvd3VV?=
 =?utf-8?B?Wks3TTJqdEticVppSFpxamFHU2YrMTF4WkdadVkxU0tPa2Fpd2hxTVVoNlhZ?=
 =?utf-8?B?eHFoV0piZ0c1U2RBeVZaaTJLaUFyaEk3WHJpMlR2Z1hBYVJTRG5JeDJJb2ZB?=
 =?utf-8?B?eEJXQlNiVUNsVWZuN1RIT1VrdXlsbVpRSTRvTFhLMHB3Nkp5ZmRjMGI0TjN3?=
 =?utf-8?B?MXc3YS8ybUMyMXlPMVJaWDFiRXNjUktSY252VzBTZmJ6bHR6bkpIRy9IQmhW?=
 =?utf-8?B?WU81SW1PQUNIaXdPSmNzMnFrVW56YURJY3VoNVFxb20yMzR3cytScGlDT1dp?=
 =?utf-8?B?RWZiSmZIcFhCZ09lSjZOTldqRGNkLzV4OEpMOTdqYkpiMDl4NmhRZ1RYVkFh?=
 =?utf-8?B?bXJvU0YyRDltejFNYWhhTmM2cnJvdzNmRmp5SUtRYTlLOVBMcWxNZUdIeisv?=
 =?utf-8?B?OERVYVNVc3QwdzIrWmsrbEd6Zmt3WWd4cDZuQXc1NlRxblBPQ3ZuUVVERXhC?=
 =?utf-8?B?S3RhTm9IZ25qNkwwOUJBck5udkoxaGJHVXlOb3h1RitocWpZcFBQaEJEbXho?=
 =?utf-8?B?MjA2TE9FSGtTdGZUNHh2eXFsTDRSTnEreFpHK3BxejhheEpvNitrRjVDK1Ex?=
 =?utf-8?Q?DG8Vkj7ZSSbqwPCFJaWWZVNn9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b44274f-c63e-473c-499d-08db91ca713b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:31:27.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPlbzqF61y/CAkEzTsWzZR8IEaDevcuaiN6LVQIA0JaI7hGnb/coRWA0pq58hk2UcvH2oblk5h/mOOU+Yq3c7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9411

The primary goal is to eliminate the Misra-non-compliance of "desc"
shadowing at least the local variable in hvm_load(). Suffix both local
variables with underscores, while also
- dropping leading underscores from parameter names (applying this also
  to the two wrapper macros),
- correcting indentation,
- correcting brace placement,
- dropping unnecessary parentheses around parameter uses when those are
  passed on as plain arguments.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -47,30 +47,32 @@ void _hvm_read_entry(struct hvm_domain_c
  * Unmarshalling: check, then copy. Evaluates to zero on success. This load
  * function requires the save entry to be the same size as the dest structure.
  */
-#define _hvm_load_entry(_x, _h, _dst, _strict) ({                       \
-    int r;                                                              \
-    struct hvm_save_descriptor *desc                                    \
-        = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];         \
-    if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),                 \
-               HVM_SAVE_LENGTH(_x), (_strict))) == 0 )                  \
+#define _hvm_load_entry(x, h, dst, strict) ({                           \
+    int r_;                                                             \
+    struct hvm_save_descriptor *desc_                                   \
+        = (struct hvm_save_descriptor *)&(h)->data[(h)->cur];           \
+    if ( (r_ = _hvm_check_entry(h, HVM_SAVE_CODE(x),                    \
+                                HVM_SAVE_LENGTH(x), strict)) == 0 )     \
     {                                                                   \
-        _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));             \
-        if ( HVM_SAVE_HAS_COMPAT(_x) &&                                 \
-             desc->length != HVM_SAVE_LENGTH(_x) )                      \
-            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);          \
+        _hvm_read_entry(h, dst, HVM_SAVE_LENGTH(x));                    \
+        if ( HVM_SAVE_HAS_COMPAT(x) &&                                  \
+             desc_->length != HVM_SAVE_LENGTH(x) )                      \
+            r_ = HVM_SAVE_FIX_COMPAT(x, dst, desc_->length);            \
     }                                                                   \
-    else if (HVM_SAVE_HAS_COMPAT(_x)                                    \
-             && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),          \
-                       HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 ) { \
-        _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));      \
-        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);              \
+    else if (HVM_SAVE_HAS_COMPAT(x)                                     \
+             && (r_ = _hvm_check_entry(h, HVM_SAVE_CODE(x),             \
+                                       HVM_SAVE_LENGTH_COMPAT(x),       \
+                                       strict)) == 0 )                  \
+    {                                                                   \
+        _hvm_read_entry(h, dst, HVM_SAVE_LENGTH_COMPAT(x));             \
+        r_ = HVM_SAVE_FIX_COMPAT(x, dst, desc_->length);                \
     }                                                                   \
-    r; })
+    r_; })
 
-#define hvm_load_entry(_x, _h, _dst)            \
-    _hvm_load_entry(_x, _h, _dst, 1)
-#define hvm_load_entry_zeroextend(_x, _h, _dst) \
-    _hvm_load_entry(_x, _h, _dst, 0)
+#define hvm_load_entry(x, h, dst)            \
+    _hvm_load_entry(x, h, dst, true)
+#define hvm_load_entry_zeroextend(x, h, dst) \
+    _hvm_load_entry(x, h, dst, false)
 
 /* Unmarshalling: what is the instance ID of the next entry? */
 static inline unsigned int hvm_load_instance(const struct hvm_domain_context *h)

