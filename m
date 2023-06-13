Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3672E7DC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548251.856098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96ZL-0007F0-9p; Tue, 13 Jun 2023 16:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548251.856098; Tue, 13 Jun 2023 16:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96ZL-0007D8-76; Tue, 13 Jun 2023 16:08:31 +0000
Received: by outflank-mailman (input) for mailman id 548251;
 Tue, 13 Jun 2023 16:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q96ZJ-0007D2-PB
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:08:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87fcecfa-0a04-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 18:08:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9067.eurprd04.prod.outlook.com (2603:10a6:10:2f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35; Tue, 13 Jun
 2023 16:08:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 16:08:18 +0000
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
X-Inumbo-ID: 87fcecfa-0a04-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+mUz+m/icLi6soH5rd5PH8cp/014fTkp//Qd3dLcr2jedrdAVUUyGMXGCncEXH6uYHO4PKlO8QX6Wqsxtvf/CBmE0xvB7sbKThVtxp1V62EmtSQ8YCS/0gDYHGXMvsx0vlCK4b3q0PMB/nhO9xHmbeyl/MW+HTYUz1Vg5MHDZt2iuBs84BwoRKHYQMahJ7AWvgII1v8XLAWWjj6/wznjnGfOt+tL+QVWreb+i07SFoeQ41s/bIM0EMBg42eDlSEKUSZ9sOR2kS68BeLTDHexP4zRLTBVNKWNfFw9qO+DGD5Hnt/GvHjxLyaSa4MjalY6Hhw6YwzfdMWj70RzdJ81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM9lwbqIpER4R9ogt0cDMHR4kIE5JyHL1Jop51j+1vg=;
 b=TKLx/18fBXmHnnuI1eFfjE9WF3XQzwENLJZFnheoUR3t+zZ9pRGs42P9wDXc0QeNVkiMm+Y9xRaSIPPOCLEdsRGkye2sVmnAhtpiNcvZbnhBEHtNZb6pPJIM1K6bkWscyQOT7YVAZXif6jzJflbK+vaLHs6xa7SGsLK2fFehqGOE8EwR8lKz4wurtac/jQQArpNTmBuyl6RWibBCLETKcUPjg9EUYIGazyCcHN8CyaLGc1dM/I806EiS/MRhFKxGKXzGB8YBKidnWuohbrsEjZpzsYVOAcrMtKKNRWWv2TpvniUk+XE7JsCtU/U7/9deTpTNC3xEPOPf7yJiQZADUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM9lwbqIpER4R9ogt0cDMHR4kIE5JyHL1Jop51j+1vg=;
 b=3zL6lZ1TBLN3TLNkTk+eax2YUDS++F3D1t6/D/W1I4l9Uf5nliayGwmRD1kppETE1nDlwtQgV3QOOqvXyyHH5XYD5ekIjnuj9EnRjFySkXTJBzAZUOMrih0HEKOa7TpSoRZMczhMCKYXpXi3D47JejP8vyxVSF2lw3KBCaAFwHGLypiTF11RcrdfbR/ygB8ROOavhJ3hh5iWxbd1CcKUbdQDOBj1yWBWDa8r2ubamz85HHxf2LS+iB9ySEzHy4QC7qfwb8vc8AcKFzS/cu+gz7hBBha2sKgXR6hQveh652AUA0jCg6sQgK8h85AJJ0HIEnf0HvNlNdRqqpj7qxJJ5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a22f00e7-d5e4-45e1-652c-bf22ad78f567@suse.com>
Date: Tue, 13 Jun 2023 18:08:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] libxg: drop dead assignment to "ptes" from
 xc_core_arch_map_p2m_list_rw()
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <fe8cb20f-8541-19a9-a0cf-06e9206b1299@suse.com>
 <33566692-ee42-44af-a94a-5535fdf39930@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33566692-ee42-44af-a94a-5535fdf39930@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7dd89e-c20d-4540-b19d-08db6c2866d6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbNLmXiQwdyNeiqOqyRopeQRQpvSUdLWpgMpuw9gkZdQ2OY6mrGaocBTfvFgPZJXAZj3uzS+AXoR6xD2tgJzLwm04YP9zHkRhK7+X9Wg2rVJZ0EX4cwmVhJ4VNTWxMCrnQkAGm3HVABftsyrfVFuy1N79CrlRcI9YSf2hwdSxMhTLX3ydfZiHBTVf9YHdkzpB1deA7g27RSfSrBpFH7HkJ8PkJjPhd8/0+nVO5T04uGHI66x6e7zTo+fxTKR6eLyTuGTJZO80mqYWtKT/WH4FHF9HTIRv+8Y68wE2IFSXO2KnoxnSVlks6kwjYh11tcQDE9rL2aWzoxDqkzHZB40OdL2AdmxG7465bWlXgSMKc2jlg3z0S5pnlSifeAMH8YP+6dnBSsiKK0dzYJUZdAq9TtYmE/DytJgp2kymzATEcIvPc7joyc42lAMxEqNbgA2nqDVOWqvjO75HUldPlCy81zxl2GAYUmkDzG5hMF+Agm6hXA9JhIUO/XlJn3jNXMug+pekwn0Cvj54EhqhudDxxFGmmoEDDtB639YepMe+ZJ27lU8lOdMvKL02HQoSTxAkc6snf6K+1s9XmYzFAkNROFCbbBTRI6/EHdPta2JTAhLKSsnr+/ugucIgahp/jSIx26qjOMLX6WZ7lXHKh3NFQjQw4nYbi36ZlJXM/FuhLkEg6p+3pXceKGSOAHfD3Wt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(107886003)(6486002)(36756003)(83380400001)(2616005)(38100700002)(31696002)(86362001)(6512007)(53546011)(6506007)(26005)(186003)(478600001)(2906002)(54906003)(66476007)(6916009)(4326008)(316002)(66556008)(31686004)(41300700001)(5660300002)(8936002)(66946007)(8676002)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFJleVM5dXNhTVlUOUh6ek52bGoxQlNxWktPVWI3WHRweU9JZG1ubmJoUWha?=
 =?utf-8?B?TWR5azRXcjNjZDMrR1U5aTY4ZDczcXpJZnJ4UmZRN244SnlBdW5GVUNYSHlL?=
 =?utf-8?B?TlZMYlZibndQQnQ1TzN6bmdXUVY0QTdCbU9DZm5TcUdNM0FYZFlaRUNTTmVT?=
 =?utf-8?B?K3lGL0RXdnZaTGYwZGt2SjFCeUtPNEl1amFHVlFJck91Q1JwVlYvRGhWaXJ2?=
 =?utf-8?B?b0VaWm53aWlJSy9hVWg5dDBRcU42dzBXYnRBOFpNMjBTTDRDeDlQcVlvRDRY?=
 =?utf-8?B?c3JsaXpCSWZmK2duMXpIZmRXbWs0N1pBWmtiTDRhUWJzemlVQjlZTmE1cU5M?=
 =?utf-8?B?MXBVdXFLb2VUUkVxL2JkSlBpSlIxTW43d1pCUzBlcEw5UVFsaG9VWkVxT3ZC?=
 =?utf-8?B?WHhLWGxqTjVVcm1LWDZ5OC83Y1FXYy8wbGwwT1pKeU5vSzFqbEFWb3ErRGlC?=
 =?utf-8?B?NmxtVlJzbTg2ZjFZUTVJaE5HWlR3WkY5TmdJOXI4LzJ1QW04TjVORHNnMDR3?=
 =?utf-8?B?eDNSLzJDTDU1UHppWUUzYnVLY1RQQ2k0ZUhyWi96Qlc5blZ3eW52WTdKclNl?=
 =?utf-8?B?Tnd4L2Q4a1VMMjJPM09ubnl0OFdlYW5XRTkxMG1JNUMrWkdwNjIxQnVRaFlV?=
 =?utf-8?B?T0wwTUwxVzJYbisrcERidXpuU0x5MUVCbkE1Q1JLYy9kYXk1NW5pVytIcktR?=
 =?utf-8?B?Y1VrYWVXZVdXQk1kUUZHb1A2ZEM1RVUrOElZckE1aERxakIxcVZGU2loRnI5?=
 =?utf-8?B?Rk9vWXNjSmE3U3FDRFN6L1hLeDY4bE9UNE9QTVRUdC9QVnhJWjl2ZmJvVm5R?=
 =?utf-8?B?MHJuOS9qU2QydjFLcEg2K3VFMms2Ukl3YVUwWVVZT3hIVHhzck9VdURxZ09G?=
 =?utf-8?B?a0EvLzRVby9WOHZRMzJIZ2FadHdDT2dKdWJ0Q3U4eEd3bk5JMmNxd2VQd0tK?=
 =?utf-8?B?UVhIQy9WS1RPOS9BTFFGWWQ3eWUyWXdUU0JFVm1FQVV1OVBFMEhrQzZvTVNy?=
 =?utf-8?B?Q0c5c25xM0FmT3ovSzRQUjhvdHRQSUJqRDRCMzRQWUU0MVd2RW52RE9IcDg0?=
 =?utf-8?B?bFUzWGFkS2p3eUpuZVZYaWlBYjdxOENVREg2TkZodFFXeTZJd2l2VmpkbUow?=
 =?utf-8?B?UE5zU29GUW0zbzllR2I4OVpOZGZ0WVdlb082K0ozOGN3RXFzNHpVdWJzOU9X?=
 =?utf-8?B?TXFRakI4NnAxUWdHc2JlS1BZL0RYWHJQRkhKOGlCQVQ0S2lhWnBEeEdIWjV2?=
 =?utf-8?B?UGlSemNPZGVLbHkweWJxUnRjT0NZZDdDcEpXKzROTElCN245RW9BaXZlT1N4?=
 =?utf-8?B?TkxCWlNaZDJGVnhMeTgvWHNmZkk4dlB1M2NHSkVVOURld0FaWHZKaDZQaXNv?=
 =?utf-8?B?RHBSNmN5NFI3NzRTazRGSUpVMWtWOWVYSHd2VUdYVTRtSDd3T0xIWENzeXR6?=
 =?utf-8?B?RFNIblNZdEdmNmN3TnZnS0NDbGFSdU0vV0lCWjYxc0ZLNzd4NzhPOGNDd2tx?=
 =?utf-8?B?MXdrendRZWNTVU81QlF5N0dWMFpRdEZodjRxemN1UHlKOFNyU29wSDYrSU9W?=
 =?utf-8?B?VFYyTmMwM25qVVNMd0ZIZ0NoUjRpMWMwcjVLMTE5TVA5Tzd5Zk5nTnhRRjVz?=
 =?utf-8?B?MlVkN1p5TFd4TFk2bnkxNlFQZHRZbTFTK09CTG5nWEdlMllaK0t0TzBXN1lI?=
 =?utf-8?B?WUVqY3dvWGtpbU9rOURMTC90QXZCU2RUNlB1OFUyM2hZTENtektSb1pnOXRa?=
 =?utf-8?B?d08vNVA5dm83WCtFS1hkMXllcU9oNjMyMWlZMFJhT0FPRUF5SmxYQU8wZklQ?=
 =?utf-8?B?Y2VMMVFsTE0rK3dQbk1sT3JNY1RIdll6T29MbVNCb0pvcUhScElWL3lXQWdn?=
 =?utf-8?B?eS9BTDVLZkJQUTJnREc4UmZjbGRta2xGRGcrWXBFT1pTRGR4Zjd2WUVHbCt5?=
 =?utf-8?B?RGc3ZW5meExEbUtVUG1QYWZMelY3K2ZyWGhnRXVkVkM3Y21yQmVoYkxodllI?=
 =?utf-8?B?c29YWkEya085akZnM2haQXQ2TmxEVXdGTUVSWndvSFBIN1JzTDF3Tnc5QmNy?=
 =?utf-8?B?MEhCSUR3QlJlY2djRWxSZWlHR2Vta2Evdk5wUW03RlF6SWhJYmxHd0VPSVZK?=
 =?utf-8?Q?c5ZCyFTzlKt+lyBPSH02wcJK/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7dd89e-c20d-4540-b19d-08db6c2866d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 16:08:18.4541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmP0EllXGQID+ku6M26V1BRKW1wRjOAJjtD0kRah2u5d/KZQS2yyFjXbwMUssf349H0FvDcAp6WlYPf3XgISUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9067

On 13.06.2023 18:03, Anthony PERARD wrote:
> On Mon, Jun 12, 2023 at 01:46:40PM +0200, Jan Beulich wrote:
>> The function returns immediately after the enclosing if().
>>
>> Coverity ID: 1532314
>> Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/libs/guest/xg_core_x86.c
>> +++ b/tools/libs/guest/xg_core_x86.c
>> @@ -210,7 +210,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
>>          }
>>  
>>          munmap(ptes, n_pages * PAGE_SIZE);
>> -        ptes = NULL;
>>          off = p2m_vaddr & ((mask >> shift) << shift);
>>      }
> 
> Do we have to remove this assignment? What if someone adds code later
> and reuse the content of the variable `ptes`? Or what if someone adds
> codes after the loop, and handle an error with `goto out`, we would have
> a double-munmap().

Imo it would be at that time when the assignment wants (re)adding. I
fully agree with the tool, and I expect Misra (if it was applied to
the tool stack as well) would demand the very same change.

Jan

