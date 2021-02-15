Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D497D31BACB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 15:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85250.159855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBecA-0005KG-JQ; Mon, 15 Feb 2021 14:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85250.159855; Mon, 15 Feb 2021 14:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBecA-0005Jr-GA; Mon, 15 Feb 2021 14:12:38 +0000
Received: by outflank-mailman (input) for mailman id 85250;
 Mon, 15 Feb 2021 14:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QLJ=HR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lBec8-0005Jg-23
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 14:12:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fdde6c7-d997-49bf-aeb1-a71a7270094b;
 Mon, 15 Feb 2021 14:12:34 +0000 (UTC)
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
X-Inumbo-ID: 6fdde6c7-d997-49bf-aeb1-a71a7270094b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613398354;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1qMNtljXf0apYUhwBsXK9LdL5JcXbm/+2a8v3UZBFRk=;
  b=PtQv6m9WnUi6GcCXuIW/GksZojZbiF8oB1qRgPhok7I/jJ44rFSnoMFX
   ZJhqIKocJdanMtekNPi+YsXlc7xr/DUN2I8Y5D3KSgeGGWrRf6CszRu6+
   9zBg4lY2MIiHyE8PVoOwxdLzL9DGAd6vOykUIo22t6HSbVZpIVK6d/2o5
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4INl3YANdjwqMDXki9S+VLEORqNKwZj6XhjD1LlZmvUdPY0MNTM/SxwFASPUVeQOh7r3G8FSyh
 G1PMiQxn4oNNObx4dJbGCK8Y/bwNJl2BQRBq0fH7K/xT8sYgihNg5kJUDrddqkd2BLtU8I+Bbe
 sQcamMA3940jATEqt0WGuipmy227E6IeKZxDntDDfefKYqaoHURnCTItBtcZ+k7kupHQFYqxrf
 y1B1CLkfLwwk52UYhvzGL4+buMzSUJIQMsTWxLexAVS4P3f/s+16y5LHI+mRK4yIA1nZ+8enVl
 ERk=
X-SBRS: 5.2
X-MesageID: 37257266
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,180,1610427600"; 
   d="scan'208";a="37257266"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIRPFr+9Jglby9el1e31ysQrKWz9T+nSYBgvIQdG4W3MbiTvz/XgTjNQdExVMvFj6tFOlbEPb01xClNuizpngqoAbxQ/y6OHFozxPOC64dMgLjXJ/pI6emEKQdsSVC9dWxPyPmRbrg4iLVMB8CtT43CseDWiw3OtItuREF9b67rp5ePjwpPN+YQjjmAMYlKhpvlnc0Ul+5Acm28fV3WZVJcUwynoGrNi/KcI25vfcSvC0VfFTnSO4g3Ch+l82hM84sjRxmYXm0Zrmk+4Nqb09AZ6QPpJMUlUi6Sj96rFc+n/7J/nqdsUBGSVdyV5glI36fITDyRfZ1Ghm8WbRdgwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qMNtljXf0apYUhwBsXK9LdL5JcXbm/+2a8v3UZBFRk=;
 b=hJJT9ae7mvyWuryvVntmTMFhVq+wnqep0llrQAbLvJ6izIt+D02aFpfn4Rhgqo2QxNGvMKVDKqKEt4FTOjG28coamxbQYHF/JnwIK+ZHfnt16QytZpLxcXtz9uQn45OOyuPSk3csOSpmpv/pK8He1qxGktmyk8H2+PJQXykmP9Lgp5Q0CZwI8+9XWNdeBQw5I0fsQBs8yQFVwA85PrlErkqJki1S/HqRvg76/cmxEeD8cTrBkHwCuuUbDtLiL0uN6jZ0zqacdUfFCiD2SYKvN/N6+rkpNMoZW8u6FixTwaFeSEsI1o1G1Z4zVQbpFOF68ELh2T6OC5SvSrIg+p30lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qMNtljXf0apYUhwBsXK9LdL5JcXbm/+2a8v3UZBFRk=;
 b=rhhbFXAOqNQ7K2vEjY0sVH72FYbhqMHOJ2BQAbb/BXgA12JG/wBjSiYqTZnc5iEInhjvOAr4KE2WUoqUIXiSRCnykV4q3i+eNFuIqExxRw2xE8rfN0OcitWmkw4J6yT75aNv3YVhHWNj3Yr3buSOYJDy5X4EhsD+GXVXzGHJKcQ=
Subject: Re: [PATCH 06/10] stubdom/xenstored: Fix uninitialised variables in
 lu_read_state()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-7-andrew.cooper3@citrix.com>
 <cea38f47-7dc3-ea67-104a-e5b1899a7f3b@suse.com>
 <226c35c2-2280-8353-74d0-cc35e7f84de6@citrix.com>
 <f77b1634-b250-33c0-42ca-25dd00cb5a02@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6db2e90-873a-85e9-51ec-6d4818f752cf@citrix.com>
Date: Mon, 15 Feb 2021 14:12:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <f77b1634-b250-33c0-42ca-25dd00cb5a02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 293ba4d3-307e-4807-31df-08d8d1bbba53
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3495E4C485CF8C99B919A14BBA889@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /K5F7PgF/t9YxDcPU4Ql5Gxb2r0Qk4vCrq3rvIcO7brrz323OU02X401jInCxiOfmRgElZ4VnRWQvEslPXN8dTVX3XFAOss8tXY8dgOVf7M0zDas/++qz+iZnzVauT4y8cipYu5Q2Cb3ejthbGW9EvbNsZ8+eUWGS9R/93EdCVEkvSRkVmEMNVOZ8q9qkz1iPqnUhtDO2oD/4/50vjINCpV31VfYsdyyiQAbCClHtZzH7aO4D7BgYvsrZ+6QV8o6+fP/ALya4yybbxfCrIGsLGgf/Gbs+4mJMR/LzIfo928M9N1hUbvPkUa/ZSGDewTw+mq6odxFFTxzZ+OTT/fVdn1Ybyn8OwAS+eHBAX3pPQ5swoU/OOgLwj5gOV2if3sX98uh9mIjPfOfmVQVPmw93Us+Xd17w76j0r62mp33ilcCL8OmvfpNyBNYlCmF6FjlTWizwJzW8D+o7rm0YVkRZ2jssZGM3tLMn13HPfZ3eKYmuyiWuuOUKjYxA9riRcVdU9YvJtbe7Z/sdm6Kt0WYKgfV0oeOBWOkIMHOTbYi+SgRPw3ZEoKeDGyp7KiuVk94x6SMnaw2Dq1HfiUmBAc0zq47RKELyKlimv6eCrRCu54=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(36756003)(83380400001)(316002)(86362001)(16576012)(31696002)(2616005)(66946007)(31686004)(956004)(54906003)(66556008)(110136005)(66574015)(8936002)(6666004)(8676002)(4326008)(16526019)(26005)(6486002)(478600001)(5660300002)(186003)(53546011)(2906002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmFoY09lcWdXeVF4Y1lVSy9UdnhxNnFvVnNLYnV3MENWU09tKzBSOGFZNmVN?=
 =?utf-8?B?ZkE2Tm1QV29OVHJwZTRuNnQwMjBsSXhyMmt4NlhpMml1Y3RmM0R0OVFqNm5R?=
 =?utf-8?B?MnBCZ3preGxqeGFLcWJXU0cycksvMHRaYnBHOXYzbHFYQ1BjK0RocXNVTWVP?=
 =?utf-8?B?K3hvWUhEb0d4Sys0Y1MrQ2lUMkRXU2FvUWlUU0xSbFMxVWVENUJkc2lHMVEw?=
 =?utf-8?B?RnRCcGE3WGFxa3pwQ0FKSnZDMHBQQktvQkJkWmdPUFhlMkhVMmxPaU1UZEM2?=
 =?utf-8?B?SDdyd2M3ODJMMHppUmRiTDFrZkZyS3pDazFNd1NnM012WDNZVkMyTmFINVRm?=
 =?utf-8?B?Y3lrcm4yTTJveFFWTkNDRnBPZkMxLzVXTkVIbFVKdDlrZXZHQVcreURtQjZx?=
 =?utf-8?B?ZGZpUDdhMCtNRUt5TzNBRDFNdWJ2am1vSXBwRmgxSjAwM2ZBSW83S3pIc01T?=
 =?utf-8?B?R3dlZG5vb0RXWTB5MGdjRTRKbStUbHZXUVdpMlNML0d2aVBqb1RMT3FzZTh1?=
 =?utf-8?B?WFMxMUZEY3NkLy91ZTlTTklERzdTaEhlZnVDS2gxTlBuNng4VlFvSU1hMEd5?=
 =?utf-8?B?Z0xNYzJlQlE3MmJwV3B0dTRhWDg4a2Jta0tBbzJtR0psZC8zRmpZTDlwR29m?=
 =?utf-8?B?dFdLZmhxQnlLVkx4NjBqR3pxZVdrM3lQNTlGdmhGYmR3VllTUmhHMUNnUHdW?=
 =?utf-8?B?UmVocFJnNkdZVW9NdkQrVnhpVk5IajE2RVFLM0llUEE1QzVmMU9xZ0ZLQ0g0?=
 =?utf-8?B?a1IvZ2xmRVJKTG0zdVlBTXJkSjlZT1gwYlM5K2svekQzS1JaNjRaVTJNdWxZ?=
 =?utf-8?B?TVBJejJXMGJCSWN4SytxTmp4K1JwYjJUd3kweGRNcXU3TUpiVHpPMWNRcjZD?=
 =?utf-8?B?L3lpa3BKM2J6b3djSjBkSjFHV2syYVF6bkFFNWFtUTI4cG8xRzlMUTYvYTJm?=
 =?utf-8?B?dnJSU0xzNkJZNCtiRkh6MFgxVnhXNis0V0lvcmdhai94SnVkc1NBMXF5aURV?=
 =?utf-8?B?TGt1Z2duTDVmaHU5V09mNlpMTkdFK3FaTXV1QUhCNjAxeXJnZXgvRkVORFVJ?=
 =?utf-8?B?Y0kwd0lRU1M1TGtMNE9jNCtheEQ1anpxZjY3WmhxUXJOcmd6dzNKUk1NRm1T?=
 =?utf-8?B?ZEllK1c5WnNHT0pEMTA0dmJsaXVweEpvSEtzT2prTURGVlRMTWRlZjZaUHV4?=
 =?utf-8?B?bW1lTkZmU0VkWGxpOFczZWV4OWpReFcyL1F5cUdQb3pNNmsyREszeFhaTlND?=
 =?utf-8?B?NFJWUEpsT2xOUVU3KzBaUGpuSmxFR0w1SjRwUUxRSXl0M0pNNWRBZkRMMExo?=
 =?utf-8?B?dFJseTM1TU5jWDA3WG9SUnlrN3lxVFN4RkpkdnIxWFRBcklzVTVvU05KZU1T?=
 =?utf-8?B?ZnFQaFRTYXhTQW5jKzBUQmdua2tQNHRVWWJpMmFxRWFqamd1bHhGVTEzRnFJ?=
 =?utf-8?B?ekw3ZFcxWXlKeDdieElNbFllU2FoQkczQm4rcGptRnRRM1lXc0RnQTlGb3lk?=
 =?utf-8?B?b1o3Umw4enJXRlg2bGFybG95a25hdEN5UU5YOXNRUkw5RlVvN1VsOHNpZCs1?=
 =?utf-8?B?dmQwcEEycXJsVzVGL2MzQ3I4cUJRZm8rVnJPZ2ZhL2lUS3k1RGNMODJ6YjE4?=
 =?utf-8?B?SDVyRUhtYlFxVWpuZ3J6ZEFjc1FxenhTK2pQREIwME1EZjhpNE9hVDVpTE0v?=
 =?utf-8?B?V1g5RktVZEFZRWJRejFQMzVhUHlyQ09EbUtESmdvOEZRR05jS09QRGFHRlZ6?=
 =?utf-8?Q?Bxo8Mh31ycpRW/vSBXoCWtLyDUQjnYuLUE7mB2X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 293ba4d3-307e-4807-31df-08d8d1bbba53
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 14:12:29.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FR7Ewx0kUhz5rdmdSOQ6vgKUrqXtI08ts/KSJG4GC+/5RAJLeZvVT2t2CF00RBQCGxD2GfdS7c4jW6en6xG0NtSizbs9wUp0g3VK3WTduk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 13/02/2021 09:36, Jürgen Groß wrote:
> On 12.02.21 18:01, Andrew Cooper wrote:
>> On 12/02/2021 16:08, Jürgen Groß wrote:
>>> On 12.02.21 16:39, Andrew Cooper wrote:
>>>> Various version of gcc, when compiling with -Og, complain:
>>>>
>>>>     xenstored_control.c: In function ‘lu_read_state’:
>>>>     xenstored_control.c:540:11: error: ‘state.size’ is used
>>>> uninitialized in this
>>>>     function [-Werror=uninitialized]
>>>>       if (state.size == 0)
>>>>           ~~~~~^~~~~
>>>>     xenstored_control.c:543:6: error: ‘state.buf’ may be used
>>>> uninitialized in
>>>>     this function [-Werror=maybe-uninitialized]
>>>>       pre = state.buf;
>>>>       ~~~~^~~~~~~~~~~
>>>>     xenstored_control.c:550:23: error: ‘state.buf’ may be used
>>>> uninitialized in
>>>>     this function [-Werror=maybe-uninitialized]
>>>>        (void *)head - state.buf < state.size;
>>>>                       ~~~~~^~~~
>>>>     xenstored_control.c:550:35: error: ‘state.size’ may be used
>>>> uninitialized in
>>>>     this function [-Werror=maybe-uninitialized]
>>>>        (void *)head - state.buf < state.size;
>>>>                                   ~~~~~^~~~~
>>>>
>>>> Interestingly, this is only in the stubdom build.  I can't identify
>>>> any
>>>> relevant differences vs the regular tools build.
>>>
>>> But me. :-)
>>>
>>> lu_get_dump_state() is empty for the stubdom case (this will change
>>> when
>>> LU is implemented for stubdom, too). In the daemon case this
>>> function is
>>> setting all the fields which are relevant.
>>
>> So I spotted that.  This instance of lu_read_state() is already within
>> the ifdefary, so doesn't get to see the empty stub (I think).
>
> There is only one instance of lu_read_state().

Ahh - I got the NO_LIVE_UPDATE and __MINIOS__ ifdefary inverted.  (It is
very confusing to follow).

I'll reword the commit message, but leave the fix the same.

~Andrew

