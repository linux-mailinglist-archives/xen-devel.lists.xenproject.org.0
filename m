Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F2455C71
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 14:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227409.393311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhFb-0001Ar-OW; Thu, 18 Nov 2021 13:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227409.393311; Thu, 18 Nov 2021 13:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnhFb-00017r-KS; Thu, 18 Nov 2021 13:14:51 +0000
Received: by outflank-mailman (input) for mailman id 227409;
 Thu, 18 Nov 2021 13:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnhFZ-0008QJ-Ls
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 13:14:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81c33106-4871-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 14:14:48 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-Vh5s9ku4Me-GXLzm78DRgA-1; Thu, 18 Nov 2021 14:14:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 18 Nov
 2021 13:14:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 13:14:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0126.eurprd06.prod.outlook.com (2603:10a6:20b:467::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Thu, 18 Nov 2021 13:14:46 +0000
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
X-Inumbo-ID: 81c33106-4871-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637241288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7NvNnOH5HYnSaIdiD82OvXyiaMKZTo5P7hBpSZhL67A=;
	b=lk20czgJkMtCrcQFcnsCzYcyJrRJs1Qv7xQhNErJh4b4u4SVcQZcev4VnemPSzKQoBPOqZ
	C5kTucyFIVmiiyULup+xDtoBxAWIqGvV1ki7zvM+4vUpnQ0UsxOUoOvL+L4tRru/eSMPxB
	VhenVHOVdKxxrGhRMke40uEYI7CH9fY=
X-MC-Unique: Vh5s9ku4Me-GXLzm78DRgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu88c6RUkYKJAvmwn8AWBi3ZKNft5jWXJKWN6sdWkNYu7y7NvFGJbX0pLM21l1aZWNo7mBwJu7FenXzzTkjJ3F3Stz23+ZjT3Ls44nyKJfz4mAYvyMLsLtPoKNde6qw65GQEEXi3mAEgrjYmQKUh/N8PNpPJLq1LAD5m5UmUmyyf+Ua5L/lDBeqLbh9V8QbogFV3iEKpGMo4u2DVcZ+NSCIYlAXM/umFcAJ8K7eY/a5ayZEs3o0yAVyZ+A2CjLfsVJrQkXzANmn6JrDWcdvnHfw+/y0qrspBPHjbCFbUr50a0t4kblAJ7WwUYDwVcj6RJtPZISjOJMhIIqT6UuIliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NvNnOH5HYnSaIdiD82OvXyiaMKZTo5P7hBpSZhL67A=;
 b=imT4AjyuLSkC2LZU7ApAaA3rJYylWfAtaKji1FoQ/9xPaCnz9Q2Kv9kridz7VJ7Gook5iVws2FB1PL4/IyVtAmYahDJkZx8G5BdsZlbEpZADBqIzgLlcGa1Y5LiWpoBe7SOB2Z2ayNxi9UNGReajGavhGGJj3JhtQ1JNcNzKG6xgOho502VS6J2UpDF/BrWlriLK7fKPCCIDljS2TRYUl9ISLtAkZlLOrZzg4LvIyNRqlftwLlPWArwg9QVR5MmJLJytRXUmiAVLnERnxKWEcUHCyuO+3sZjOGwjjOQd9yzSrrBgX2WeLl4ff+z8snDPHgyQJjxRKPwksr14/b1t9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4aa6c9b4-dcaf-38e9-0b22-394f22ae898d@suse.com>
Date: Thu, 18 Nov 2021 14:14:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 3/3] x86/Viridian: fold duplicate vpset retrieval code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
In-Reply-To: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0126.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb108c7-a028-4a22-71e4-08d9aa9564bc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704863F007818B11966B860B39B9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+d7unjbeRqO39kucSfK2qyysCfBXMMmnV1dTg8bYemNPSYDEHEcZ/qMV57ZMsXG70+XUX/6q6JM6qwOA8ipQuHZZO8VtK7WxE4Y4+3dAAo9sLWUMH90rQc5KaVvNyZJFt15hoyCmrg28pn+coeEWNG//m03aZRSeHRE7OQXPTF+5akvy8Rwdd4t2M8onq9Wb3IgCFmMD/rSlUgRj201yrHMDKTrMGgJMRonl/fQOM29SS/XOKGlJWyu/UOhNTFPfggtuoA16N49sJgiXtkaVklOhpigmSAQRj+SMxELbo5NTgkvOilIhRW1R0PvUsFd+gPlgXQVJ9Yill3tHdo7q+xbJvOq8hJJE67c+LdIwrEyaWj8LpCFzdh3FQu/SNZK1gMALfSnhA6cgJjSHoDEn18iW6bKlMztEdNbKntDFuZv5liWBmlDfoCALZfN+K5ye7l5RCF7z+KC3/5oRPy9eMaSHlzOHVFWBxZhpKtJrsOAH5L8kdcIOYzmTix4B5y3xhYo0a0gCPE/9FcM0o7QV/y5VosLJVdf57ltl2WC9Izv/sFxDodPLf33w+XtefwvTqRHOCKjnYIA7Gffjfn8oeILBIJEZXeh4L8JZ4iWOsxqgtHFHRUBT4XOm1DxQiRxsKRIA/4mDaQEgBSlrr4VeSW1mkIbHFZdYqIcssAkwJtXK/qWm1jIEbRRWVUD5kbjf32S5LWgLQ45snSUOdVIbuw2wvo2qA9gsOLNG88xruw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(38100700002)(36756003)(2906002)(66556008)(31686004)(66946007)(86362001)(83380400001)(66476007)(4326008)(5660300002)(956004)(2616005)(26005)(6486002)(8936002)(16576012)(316002)(54906003)(6916009)(508600001)(186003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckxhTG5HMTQ4T1J1SWhvdzFOcjRZZEJxbFhKd3dZaGJVcVFyS3o4Tnl1NEZF?=
 =?utf-8?B?b3Bsa0QvN1o5SGpOWXJpNTFjbkxLSUxpTVFFaHE4eVJENWFVemg1MEhKQ2JH?=
 =?utf-8?B?eVEzM2tsS2FKSTlodXR4blJKaDQ4SzBwSVdHb0w2ZHFwRW9FWXF2TjdGNlRm?=
 =?utf-8?B?VUtlMmEyeDZCTmtFMmVoYWVuS0RVbHN3Smt3MnRRZjZ6NTA2YzBPckg5Kzl3?=
 =?utf-8?B?OGZnaFpJNmdsaS9WRjBIOFpCOEE5RzkvOWdtUlRkTTdMOWcrVkFhQkZrbTNS?=
 =?utf-8?B?WjVXSFR2NnEwdVVRVUlVRkRTR1ZsaG9lMG9HSitYQkhYUWs5WmFFa2Z1RThx?=
 =?utf-8?B?eVAybTJaU1JRNUlUV1hreUd0Q0FqYjFoYWR5Ym8zd05vODNINEpXSEhBNzhj?=
 =?utf-8?B?dFpKVlZjNWhwV1VwcDhBZ3JRYkpteTMwdFJGR0lHd0hWQ3lNY2pKMHBlb3Nu?=
 =?utf-8?B?cVMyd1hxaXlwcHlqVUxSNTVDbm9CTUJJWjhLVU01KzVScnZrWk1weUVsNGxC?=
 =?utf-8?B?SWREd284c3BLUmUwc2VMcjlLbEg4a2FBSEo1TXBKL01rdlpsUHZrMUhORkpm?=
 =?utf-8?B?cWdrbVlNWk9jc0FrK2FnOGxkOUE1TE9EZWJ4cFRDOHhMR213TWtNNTZ2eXR5?=
 =?utf-8?B?NlFSTWdWS1VkZXgyLzFCY2ExWjExdW92TXBqRG0zblVsWS9VY0J1ZmtDVU51?=
 =?utf-8?B?Z3RhUG9JYUluU0VmNlJEOU4xNE1vVU5kODRkZEV4aUxwelgyUFlCUDdqM3Ex?=
 =?utf-8?B?VUd0cUt4YmxkUDJhemt1T2Vta1JHbFdmVnNUazc5bDBzczlyL2ErSlVJMjFB?=
 =?utf-8?B?RWd6Zy9DZjJQQVdlT0ZGVFcyeVZpTlNTK2hOazRzdzJ0ODNtUi9zbVRtb21s?=
 =?utf-8?B?bDJoYUwxQjRodG94RVNLU2hqYndCcGcwTDJCL1UyWlJ4Sjh5cHFiZktRbGRE?=
 =?utf-8?B?QXYrVG90bDVsRWhhZmxvdzhTUk1vYndMa1FRWmRBeWNtcEErY1BMTHJscU5t?=
 =?utf-8?B?QWZqcGZiV0NJdW8zdzNSaEZQdEk0RElySEpqd216SHpSSDIzZ2hxT2F4ZWNB?=
 =?utf-8?B?elErZ0hlTklpY3JaaUdtZE9adFFQYVBUbHFQaDlUd1BOaENUVFFQaHJqRlZB?=
 =?utf-8?B?VzVaTFdtSktTeEIzdkRTMnpJcXA0clpkOUdBZUF6ZkhXR09DSmNYSDBJWngr?=
 =?utf-8?B?cmYxa3UxNTdiYWh4ZXFGZWVKYnlPaWhHYzJ0VCtQUksyMkFVMTRuQWIrQjhB?=
 =?utf-8?B?dHVpSm9BNU5kUmh1REdReitZaTFNU1F0NHI1b2ZtV1VDYlV1QmcwbmZndkts?=
 =?utf-8?B?d3NtRkRhZmF3d2V5cjBVMElBM3I4K3d5NzVLVHlvaU5BTEVFYWlRM1hMb2lC?=
 =?utf-8?B?dDhQdEw1Q2ZOeUJBTUprdDhRRjd5ZUoxMktKYVZqd0tzZlRpT3lWYkZOdjZr?=
 =?utf-8?B?dU9sVlFhdEp1ZlRRaGpQWDVFRnV6T0dramp0NGIxN0E5RUZMa3NSMVVxM2Fs?=
 =?utf-8?B?YlBWNm8vLzRESFJ0cWp0dnlLaFNCSnlmN29LQXF2ZDc4YkdEYXk1SDBwZXM0?=
 =?utf-8?B?VGJ0eW9hSFU2Skl2d2oxdjNRb0ZVVUF1RkQ1R1dldVNydTVVNnBxN2szUUFK?=
 =?utf-8?B?RDduQmFlWDVkZVlFNjZGMCt4c2dIWEh4bkZrN3A5SzZFVTI5VGhIL3ZVSzRn?=
 =?utf-8?B?aVNDNkE5L2d1dXB1elhmY1YvR25RMUlKTWJHRXJkSDhjYWR6MmhEc1hhMmZ3?=
 =?utf-8?B?ZDZCbUtTb0JwdkMrdHRlQXRqMkxGSjVhbXlIenIxSFZxZlJKcWRKTmJVN3Y4?=
 =?utf-8?B?WTlzWDg1TStqRmZMTzN5U1o2UW1JdmZkVGhmYXhxOXRnRjdhUmdkQ2NjNnVO?=
 =?utf-8?B?RGhTaHM0cmJLVCtqcmR3Y0NadGt5ODlyOTNWYk5sb0JmMnJwckh6Mmo4UXJ6?=
 =?utf-8?B?bERRNkdkV0thQ1pva1pydlV0UWo3anRYVGRuRXhxUEFPYVBGdzFxKzhHM2pp?=
 =?utf-8?B?TmFwb0NTaTVnUW1SamNWeFE0NGQxa3duL1BpTUU1dzRYcTRsbnQ2NURVK2pU?=
 =?utf-8?B?K21WODl1MWE1UGt5N2lvdHoxd21yaXhaMi8rUVJzRHAyOTRlbDV1dlk1L3o4?=
 =?utf-8?B?RENtVjhlSnQ5RG9qVUpUWEtWaUJ2OTJVaEU4ZDU5MFRrOGVrbmxjUlcxMGc3?=
 =?utf-8?Q?t6ALRW04tzu7eaJfMbREjlQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb108c7-a028-4a22-71e4-08d9aa9564bc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 13:14:46.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyRKHAGN8R/tmaL4/Gr8Z6YTFKChhRqPskc3BE/N9DNYLpRl0TCr6Rgmdp/ZAn67HFXLc+HjyQ3rHQ+iayxOXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

hvcall_{flush,ipi}_ex() use more almost identical code than what was
isolated into hv_vpset_to_vpmask(). Move that code there as well, to
have just one instance of it. This way all of HV_GENERIC_SET_SPARSE_4K
processing now happens in a single place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -628,10 +628,14 @@ static unsigned int hv_vpset_nr_banks(st
     return hweight64(vpset->valid_bank_mask);
 }
 
-static int hv_vpset_to_vpmask(const struct hv_vpset *set,
+static int hv_vpset_to_vpmask(const struct hv_vpset *in, paddr_t bank_gpa,
                               struct hypercall_vpmask *vpmask)
 {
 #define NR_VPS_PER_BANK (HV_VPSET_BANK_SIZE * 8)
+    union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
+    struct hv_vpset *set = &vpset->set;
+
+    *set = *in;
 
     switch ( set->format )
     {
@@ -643,6 +647,18 @@ static int hv_vpset_to_vpmask(const stru
     {
         uint64_t bank_mask;
         unsigned int vp, bank = 0;
+        size_t size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
+
+        if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
+             sizeof(*vpset) )
+        {
+            ASSERT_UNREACHABLE();
+            return -EINVAL;
+        }
+
+        if ( hvm_copy_from_guest_phys(&set->bank_contents, bank_gpa,
+                                      size) != HVMTRANS_okay)
+            return -EINVAL;
 
         vpmask_empty(vpmask);
         for ( vp = 0, bank_mask = set->valid_bank_mask;
@@ -774,31 +790,13 @@ static int hvcall_flush_ex(const union h
         vpmask_fill(vpmask);
     else
     {
-        union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
-        struct hv_vpset *set = &vpset->set;
-        int rc;
-
-        *set = input_params.set;
-        if ( set->format == HV_GENERIC_SET_SPARSE_4K )
-        {
-            unsigned long offset = offsetof(typeof(input_params),
+        unsigned int bank_offset = offsetof(typeof(input_params),
                                             set.bank_contents);
-            size_t size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
-
-            if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
-                 sizeof(*vpset) )
-            {
-                ASSERT_UNREACHABLE();
-                return -EINVAL;
-            }
-
-            if ( hvm_copy_from_guest_phys(&set->bank_contents[0],
-                                          input_params_gpa + offset,
-                                          size) != HVMTRANS_okay)
-                return -EINVAL;
-        }
+        int rc;
 
-        rc = hv_vpset_to_vpmask(set, vpmask);
+        rc = hv_vpset_to_vpmask(&input_params.set,
+                                input_params_gpa + bank_offset,
+                                vpmask);
         if ( rc )
             return rc;
     }
@@ -895,8 +893,8 @@ static int hvcall_ipi_ex(const union hyp
         uint8_t reserved_zero[3];
         struct hv_vpset set;
     } input_params;
-    union hypercall_vpset *vpset = &this_cpu(hypercall_vpset);
-    struct hv_vpset *set = &vpset->set;
+    unsigned int bank_offset = offsetof(typeof(input_params),
+                                        set.bank_contents);
     int rc;
 
     /* These hypercalls should never use the fast-call convention. */
@@ -917,27 +915,8 @@ static int hvcall_ipi_ex(const union hyp
     if ( input_params.vector < 0x10 || input_params.vector > 0xff )
         return -EINVAL;
 
-    *set = input_params.set;
-    if ( set->format == HV_GENERIC_SET_SPARSE_4K )
-    {
-        unsigned long offset = offsetof(typeof(input_params),
-                                        set.bank_contents);
-        size_t size = sizeof(*set->bank_contents) * hv_vpset_nr_banks(set);
-
-        if ( offsetof(typeof(*vpset), set.bank_contents[0]) + size >
-             sizeof(*vpset) )
-        {
-            ASSERT_UNREACHABLE();
-            return -EINVAL;
-        }
-
-        if ( hvm_copy_from_guest_phys(&set->bank_contents,
-                                      input_params_gpa + offset,
-                                      size) != HVMTRANS_okay)
-            return -EINVAL;
-    }
-
-    rc = hv_vpset_to_vpmask(set, vpmask);
+    rc = hv_vpset_to_vpmask(&input_params.set, input_params_gpa + bank_offset,
+                            vpmask);
     if ( rc )
         return rc;
 


