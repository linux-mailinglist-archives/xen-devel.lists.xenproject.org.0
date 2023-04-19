Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A46E7D86
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523553.813704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9GZ-0003Ad-Sl; Wed, 19 Apr 2023 14:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523553.813704; Wed, 19 Apr 2023 14:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9GZ-00038O-Q7; Wed, 19 Apr 2023 14:58:39 +0000
Received: by outflank-mailman (input) for mailman id 523553;
 Wed, 19 Apr 2023 14:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69VN=AK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pp9GY-00038I-W7
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:58:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e89::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a75f8d41-dec2-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 16:58:34 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB7905.namprd12.prod.outlook.com (2603:10b6:510:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 14:58:31 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 14:58:31 +0000
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
X-Inumbo-ID: a75f8d41-dec2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fl9x7G5rnLziVBuaNcM1bgktgG4jf2hWxwveneCMEXp/3kqmZ5Ck3NJ/INrw7rbYif7floyzn8pnkniWV2DfB1/tJcYlkTiZOAhyQnnYVbrOVu4u+RUL2OmnlInB8KG6KUh7vMlKaJD1AuAZ8xaPuwkwTmGNfwDuEyq3RTI1iOP0dPFi7nj6jJaG+zPsQ4pkFvcyEadJL9bREBIHR7QqHD2AsFCy102fbGf2Df/au164VrCFd4TSkY9nSAv59lLs5s4vg9j7QKmLvviY6pPLhdxUkM2N5LDrf0FgtqZL0tyfn4BlsMl8HrZLoJxlmYFk7zxIofsUcqGGB14lepH+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm1+NpqhsrN/A7lDdV1aW9Indv6FlUFdLbge98LkndE=;
 b=D1zau06UE+/69+QUYSzueFscFk+QlWFHL+yTaV8/ayzsq/yTQ3lR4ZOkgzQ3EYyUvK4cdl3dElJ4NMJHp37Y0K55x0LBRVIGQDo53+JKz0/h3aSU55YWBPR+QW7qJ7K0ZNRFfnBH6KXqAZSTc5neb5Z9v65gEQRhZRH3ATaqFoX0BAaY6GlV81VB9OB4fVpOLbVKTWTl8CiuAD0FSZ8GQYSaQgvSQoGkJRjabbziaDV1kuUhe8y2KZjTpRgkryy3BcQhYI7rKnjeyx6g7mzAskUaWTs08TPyBpkHwOnXGSgskxF44/B8teYghQKTy+6trroNkmJoOBh+wTpo/mGH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm1+NpqhsrN/A7lDdV1aW9Indv6FlUFdLbge98LkndE=;
 b=iVKvYf3LdDWgmT58dWbozNh4L8AeMw4+xF2EnzrLampVi3/IBxO0j4nP8m4EdoqI+vWfm2utdVE0pWE77G744n3G4vZlK0R0HDxYU57ITjj3DKV7SrzotDDhJHtSOLXEnW+DW3eRGSvM2Dznb7qbT5dm7TO9H3gMnzX/CvomPLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4e11e153-2224-15a1-2563-0f1a3c5a6a81@amd.com>
Date: Wed, 19 Apr 2023 15:58:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <8560fac2-5c92-8362-090d-bbaeae3f5d22@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8560fac2-5c92-8362-090d-bbaeae3f5d22@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e3f49a-dc99-425c-3f20-08db40e68a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oV/09N8Qwwetmmni0d/flCSIxKG/p5D1xstxuYKw84KKyfC9mFmek7fGVuM2+PxydUkJ2HOkt9aHZ12I5nnBl9sShakNUri9DPnwsiMkfFcpxb9UXoltVGKFVbth596VLC5ACxAqwm5uLeoBfvVYUDUONHoPr6EjKZI+Qzlte5+P+DN7K1cWtzCrHEegbYJKqrUb8iHfRUYiMyYGHZDX2hgREBNbGyXN6Y5P5egkNoudPOyniirSQ0VKXKA86tKMAkW02RIHx5cyMjjOwKksym1F6J4uaAUGwcFRZ164BdCSIO55pJn+rbqZ8HchwVv6sb/60loNvWj/w5cQpF7R+11Y64L6Bqd8WqhgGqKBMe0NWR6UKHE9XKFT13Ku7+0cvo7JnnQx9w6JmQw1nW5tUU7h9Z3ZcpqaWyTvIliZpvJSTzZMFsBzuanv/G/jSthsQObaNYhAnbSY+oXBsVsBDCfDKWvUj1Ge1tOaocQzrZhTOuXdSM9YukYaU2Xt8Zt6b7walonh/UrW+PoB4IRQr6aIupshTdg1pQUTdmMuu3CRyV8UqFT6s6QRDFsRYD1DfcmsO46T+wqbwB0hdD/OfuGFciqyP5gz1PgycbegOU1Ryl+Sv6GKeLXBXTZSJYeEA+t2hmtGtf37jAq8DWXhog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(36756003)(110136005)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(6486002)(6666004)(8936002)(5660300002)(41300700001)(8676002)(7416002)(2906002)(38100700002)(2616005)(6512007)(6506007)(26005)(186003)(53546011)(83380400001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjFZQXhMRjJCUTVIMzBtNVA4R2dESjFTZWJzb2pGTitEK09QNHFtWU9HMy9U?=
 =?utf-8?B?R3lLU2dzRVhQaWFpQzQrQVVGWUhqQmU1b1RzaTNLcHNUcGZHTmxncWVZVVFC?=
 =?utf-8?B?S2ErV0VYRkRtNFNwVUFNVkdINXdKVUdBZTBTL3BJcm9lOHFEeWZmU1hNSnY2?=
 =?utf-8?B?dkZsVm5aWGM4bGtUUE52Umt1QnlBVTZpcDFqZG40UGlYVzlJa2J0K05QTldz?=
 =?utf-8?B?M1ZpQUp0a1VUdmRnMkhGN2RyZzJCMWFneUdDMytNbUd5dFg4UnQxdkt0dDlX?=
 =?utf-8?B?YnZaSG9DNHJmNlNuU0Y2dGNQSm93R25Na0Yzalhhb1QwcFg4cTAzOVdKcjBU?=
 =?utf-8?B?QmtrSkd2alpGRmRwMkZBVWZnZ1RkNmJmSDh2VUh6ZGpMWHVya3VLMjdpUXFp?=
 =?utf-8?B?VXUyRGgrT3JWSjBoOUd2Q1BicUZMNXFCNzI2LzU2Z3I3TDJycG0wK3ZxSEVJ?=
 =?utf-8?B?dWIvcTBXVzZyU21zM0FzY2JzVG80UTVPMGNLK3B6YWlwRlBJcnB4dUEza3hY?=
 =?utf-8?B?dmVNZCt3MndVZWc3eWJKKy83M08yak5MNzI3OVYzZWtuV3dYNDIyU0Q1ZHRV?=
 =?utf-8?B?U0JIWFJFMisyN2lEd1ZpSmk2K0RuM2ZqNmNJb01ycEtNdkNNSEhUZ0hvakh5?=
 =?utf-8?B?a2JyMDdaeGNCMEJFemRFNE9YRnkxZzIvYXowVjJKRjNrKysxVlFTZ2hOOWJ2?=
 =?utf-8?B?cHNQdEpoMHIzSTYyOWlkOHFxMXIrbHFab21kU0orbG9sR2ZwTnArQ2lGbmR1?=
 =?utf-8?B?dTFzRko4b3l1UmJETjlOcjhoZ2RjSUZMV2VPc3pLdUs2YlpCd3kyMk43akly?=
 =?utf-8?B?ZS9lWHJRNXcrZjVIRjQvS01QTkYyVDEzbzFLQnRxQ01WVlVNaW9NR2lNeEVR?=
 =?utf-8?B?WEZMR2NpUVhCS2sxcWdRb3gyQVJtM0ptUkkwb3BrNEViRUJkdTdpeVJtN3Bj?=
 =?utf-8?B?czdIOWJ6aHdic2I5dm92OEwrek43a2pKNHpTcThqdGNyRTk4TTZhdUl3ODhh?=
 =?utf-8?B?VmlCRGJseU1PZmNaNGEydTQwSGcvMWE2VDFyWkc4aS9TZXRJQzlVNTBaUFU1?=
 =?utf-8?B?ZCtBUTQ1cG5UM3JtRzh1b3BidnYzSkltOEhReWVxMGxyZXdXNVp1SE9iTncy?=
 =?utf-8?B?NHVYY3R3VDBXRWlST3ZUUW5rdU93b3RRZjNQdkxlTmlMbnZoTkRudUUvNG5C?=
 =?utf-8?B?UEQzQ3pwY2MzdkVyUEhDOXc3VktxYkY5Q0xQVllhanpPbVVsc0Mva0E1NEV3?=
 =?utf-8?B?NVVDcXlDSEtNWGRRSjJ0azI3S0FZeGVaQzkyOVhzd1RXTTcwRVlDQmhQdUMr?=
 =?utf-8?B?andFbVdEbDY5eDNTOE1DdTFIRGszeUdmOUcyTjBKc25zOVlWeS9RNi9jOG1t?=
 =?utf-8?B?TVR0dXFLRUozVTFvYm4wM0ZkYkhhV3pkOUpGeTlwWlpOVnczbjNYYWtBNlJG?=
 =?utf-8?B?WjNiQTR0alJZUkJlcXMrQ2RqdmF0OWdOY2grSnZNTXhTMGJQL0xTVFh5WFJL?=
 =?utf-8?B?RzBkTjViMGxBYkx5LzJXUUphMlAyODA2NkNNbFo4MFR5Nkg1UlBjbUt6aUEr?=
 =?utf-8?B?ZWNDc1drc0hpR1dKVnIvbXEzZ0FiUGhJSVJmY2lYbm0wNjludlhQdlYyb1VG?=
 =?utf-8?B?ZVBvazRLVXJpL3hYRVJ3MVQwQXVSOG5XRndiSERiakdCem16YU9vVjloaEVh?=
 =?utf-8?B?RTVqV21IVURHdXcvQmU1Ry9XS29mMWZKSkM4NXJUUUtDZDNpNzBKVHpHNVNM?=
 =?utf-8?B?V1g0S0JnRktpREY2UzA2NjdZQmRBbDJQeW41dE5kSXdrcFBGK20yaDFkakFl?=
 =?utf-8?B?ZDJZWDlmTGd3b2RwZVkxYmhLcWFDN2xqS1JJNXdiWjdWdnRYQkVNYTYzWUx5?=
 =?utf-8?B?UXdPNG5uU0FGcVo0V3VML2ZaRU1JRTJmT05wcWhEVU95dkJEWkNpTEpuSWpo?=
 =?utf-8?B?Z1ZZbFJ5M2FYeFY3QzhnYzBhMlhvZFFOSG05b2VHODV1SHJ0K0F5QWYzd05t?=
 =?utf-8?B?ZnFlTzBsUGY4MWtteGJyYlUvZ3d5Ui9kaXkwTUs0U3NBNHl2ZTN1RmpReWJk?=
 =?utf-8?B?UXoxZGNUTjgzK2daTG9JSzg2aFZlaEpZUHlWbWdmMUE1Rk9Fc08rNHJrT2Zl?=
 =?utf-8?Q?NsEUoEKpBuROpzPopIjJbizI9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e3f49a-dc99-425c-3f20-08db40e68a15
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:58:30.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PD7zh2BZM/Wkz+dsdsUvgPpqjf7XedB1l+TKCAQY4hZffUdSlNBJqSPcNVYPsK9I+L89t6zcvd+NFUXcubACw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7905


On 19/04/2023 14:54, Michal Orzel wrote:
> On 19/04/2023 15:19, Michal Orzel wrote:
>>
>> Hi Ayan,
>>
>> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>>
>>> The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
>>> currently accept or return 64-bit values.
>>>
>>> In future when we support 32-bit physical address, these DT functions are
>>> expected to accept/return 32-bit or 64-bit values (depending on the width of
>>> physical address). Also, we wish to detect if any truncation has occurred
>>> (i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).
>>>
>>> device_tree_get_reg() should now be able to return paddr_t. This is invoked by
>>> various callers to get DT address and size.
>>>
>>> For fdt_get_mem_rsv(), we have introduced a wrapper named
>>> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
>>> uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
>>> has been imported from external source.
>>>
>>> For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
>>> dt_read_paddr() to read physical addresses. We chose not to modify the original
>>> function as it is used in places where it needs to specifically read 64-bit
>>> values from dt (For e.g. dt_property_read_u64()).
>>>
>>> Xen prints warning when it detects truncation in cases where it is not able to
>>> return error.
>>>
>>> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
>>> by the code changes.
>>>
>>> Also, initialized variables to fix the warning "-Werror=maybe-uninitialized".
>> I can see that now you explicitly set to 0 variables passed to fdt_get_mem_rsv_paddr()
>> which haven't been initialized before being passed to fdt_get_mem_rsv(). Is this what
>> you are reffering to? I cannot reproduce it, hence my question.
> I can see why did you get this error.
> Before your change, we always checked for an error from fdt_get_mem_rsv() by checking if < 0.
> In your wrapper fdt_get_mem_rsv_paddr(), you switched (not sure why) to checking if not zero.
> Becasue of this, you got an error and tried to fix it by initializing the variables to 0.

I actually wanted to return the error code obtained from 
fdt_get_mem_rsv() to the caller.

In this case, it returns a single error code. So does this look sane to 
you ?

diff --git a/xen/include/xen/libfdt/libfdt-xen.h 
b/xen/include/xen/libfdt/libfdt-xen.h
index 3296a368a6..1da87d6668 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -22,9 +22,8 @@ static inline int fdt_get_mem_rsv_paddr(const void 
*fdt, int n,
      uint64_t dt_size;
      int ret = 0;

-    ret = fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size);
-    if ( ret )
-        return ret;
+    if ( fdt_get_mem_rsv(fdt, n, &dt_addr, &dt_size) < 0 )
+        return -FDT_ERR_BADOFFSET;

      if ( dt_addr != (paddr_t)dt_addr )
      {

- Ayan

>
> ~Michal

