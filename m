Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097DA431F8D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212378.370231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTd7-0000vn-I4; Mon, 18 Oct 2021 14:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212378.370231; Mon, 18 Oct 2021 14:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTd7-0000tv-EO; Mon, 18 Oct 2021 14:28:45 +0000
Received: by outflank-mailman (input) for mailman id 212378;
 Mon, 18 Oct 2021 14:28:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcTd6-0000tm-K2
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:28:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1dddc92-301f-11ec-82d8-12813bfff9fa;
 Mon, 18 Oct 2021 14:28:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-81RWkhORPJy8ggdSArHK7w-1; Mon, 18 Oct 2021 16:28:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 14:28:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:28:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0031.eurprd06.prod.outlook.com (2603:10a6:203:68::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 14:28:39 +0000
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
X-Inumbo-ID: b1dddc92-301f-11ec-82d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634567322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYuhlC88UZgMhO4pNH4L3Gtp9dKel0eI9TFhqa0Kdu4=;
	b=bXR0Fzoly6cnzAts9W6noBF14YzzMudrWuAr5AG3nd8TePEphiYbERlsoQ9piFHtK0ZRJ7
	NjiD4PRsPgZhq+rtcyobt1sundt1MHt7t8qlvM3AoMQkhc2wZUcl1Emn60HetoexDDY5OW
	qmrnix2/435ajk5X7Q8CExBl9F7PiKU=
X-MC-Unique: 81RWkhORPJy8ggdSArHK7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JojYliXSvpzXmLB6/Poeum+fu2QTGe2GfEli4QK+WBI8TeKtj6cPFi2aLljdtJlgmr+37jDjESFSBogGptE0h+ztiIBLHwdAGAO2tqFF6gOAsxDyCU6JNeelzIJCdLWeUYjDH8eWO7cfcapWsocPNnaxNVWsHBHNR5MwRr+oiwH66bUAb0frHanHUBkcH1yBEWrKQQD/dV13PkdoD5XdzOnIk14cAdjOHFSkwZTNEzH9E5Kz6ne2XK89U+B0dDzv+jE8B5vxdIu+Sd8VCWSGK3StaHtvr8ZBWBNc+HxhSFDF1rX5MNpw776yULXJHefsnDSzYfrSLUm+WGJ2e+BMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYuhlC88UZgMhO4pNH4L3Gtp9dKel0eI9TFhqa0Kdu4=;
 b=UoPHpqc8qCsuWexuGLkiQkFcXgvgSuVLDgZqme5pVOXYooFo3PaF5AJ4UDAnV2qt1Ha0sp+IVyiAROGvSV1UoAZkxdWIn6y854TfDYXMg0fCsOqbY6Yg+WQYSmFMry/LmsDEh7UpImEFZWNdxWZv9Vg8M7wgcViNeYjVzA47BLEUQc8L1jdlW5vfFcLUKdQylfBYBw1/0jppfWySCXwGCAQdTJ0XS0n5c/TBHJkdruGnx4HEU8BWNZvDFNSTu+NJNdXAY0UvE0Yf6xMQYxIUZdlsZJD1sPr6Fz5OP6H7/qUzRlOMKNW1fW/6IDJKOSCTUotOfIpW2+zZigzvh+fA1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] xen/x86: modify hvm_memory_op() prototype
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-5-jgross@suse.com>
 <71fae3b2-9f90-878c-50f1-e9c0d7cf7e5c@suse.com>
 <d5c5854f-6bd1-db12-b530-ffc628f473f7@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a1aee06-41da-7045-4bdd-33993ce3741e@suse.com>
Date: Mon, 18 Oct 2021 16:28:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d5c5854f-6bd1-db12-b530-ffc628f473f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:203:68::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f258d9-cfac-4645-d6db-08d99243944c
X-MS-TrafficTypeDiagnostic: VE1PR04MB7360:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7360183EEC0AB811C00D0E9AB3BC9@VE1PR04MB7360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IGDV7AbkA9Gk6n/D7Ts03ltPPW7B57fZDoSRmwu7QtfOajLQ2AmdqR24VN7ct1YBrKwntC51K17BrS4V/U/SQ8VrxaL7vS+sSlq8Wlc0ZA4elCR3/ChtpY7ULDb3Kr6qXRSkqbR6VaK1hpknKuVpFMKNmlqnSIxrrGvmX0Zoy0+c6ev+/wvSf+Z2FTE+ufiOAO+uCDiFm579OFjwGMH2RQhPlD28dzL8KGK/o4/yUQw6uKC6ZK9+KvJrj45AuHcWTX1jlbAggYAd2CTw+OLreEHNjEOVASCYuRK1QFqnIKJvOWkoo9timUWtBKRlgGQ0zBAhmFe3aiXo3ufuQA+xWt6RPtjsghuRuAPLOjH54MQCwe1xk88YSs3+7JhidTWvuxcUoDmyYACRMXUiIy72SSCfGnfEd7TWTNgxabSNlc+Fp3o2rJhNtCY45hqae6pmw8OS6w86bU+BEjTdd4lYfuGDtw+FXGrFvUlkNZX20M0ZaejBaTDeqPQD4xybMSK4OCnaNCfUYz7g2qPurVFxk92mDqpYDZSXKZNFuQy7SKDxHP4p7967RTZD2D4f15qiCKuATot8fVlrwB6/kzTuYH3WGfmdzYy7TIbyxmw4/6p0XRmMdlMsgMtFZ8sW0j3oeBezKDMpl4u0EBGAR5MzDL4dUdzfcqtpfavOZeuG8MIYDaAC70mTQFv2LJqxJTlGwf1631CwN1M9SIqzqUm8DWDXHs94SzaDpthXpOE59m3lTIzVNVAKoZ2dXHDZrvQe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(26005)(36756003)(66556008)(66476007)(66946007)(16576012)(2906002)(6862004)(316002)(86362001)(6636002)(5660300002)(2616005)(38100700002)(37006003)(508600001)(54906003)(83380400001)(31696002)(53546011)(31686004)(8936002)(6486002)(4326008)(956004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXB4ODFEbnBDYTBmV0xMZmpuK3EzN3ZhSXV6cjFwcWhrcWkwR2s0Q1g3bE1w?=
 =?utf-8?B?eG5WWS80V2xVQzJnVDVBczdoTGZkMWxSMHU2T1lTc1d0eUFFR1c1N04wTjJm?=
 =?utf-8?B?Vk1XVTMrQ2YwUzBsL01UZHVHWlJ6MENDTXh5aWdEay9oS0ozeGNLM004NGN0?=
 =?utf-8?B?VXNlRlhLdnVzWDA5OXVTYUNFTW1hVTkvcUpuU1FWQnBTOHc4Z2tqVmJLZHNr?=
 =?utf-8?B?NjZiOWE1Z0lGSGsxdzRSWUFJVTRBYWJ6TmF4NFVWanZYQ2lXQ2xmR015WWdU?=
 =?utf-8?B?RkZzRXpWZ2xrdGlDY1RnMjRkWHQ3cWh6eERURkNoRWpKZGtiVm5JT0hGaFpu?=
 =?utf-8?B?Rk9obUlMRW1MTi9ZM2NXQ3dyYXV4dGlZd09WbVJHb2NWRXZTbTdTdkhwNnVE?=
 =?utf-8?B?Z1JneGtRdVZLMGc0RDdrNEk1bWEwb1EwVkNwckx1c0w2OHdDZXRJVUFPT01F?=
 =?utf-8?B?aXRrNUxCR1VJQmVRaVh4OWIrL0hsc3orRFE4TGc3NjJlbjFUVnlmY0hYc2Zq?=
 =?utf-8?B?QkI0VVlZc1JTbTBNODlRUnBwemhVRmI1R0tMWWpiU1FGUkhZMDZRcWFBcTl3?=
 =?utf-8?B?Z0xleWVmTk0zbkREUCtaVUt0N3pSWm1tdWE4REZSZTIxNm1zai9maEtaaVBt?=
 =?utf-8?B?N2xkVjdYUEMrS3RvQmtUOTBOYXBDVXVLK3BPREIyaGlhUlVpMHgrTWhtSmcy?=
 =?utf-8?B?Ky9wZTdMaGlManBsblZtNUsrNHZCT3VmaWNIWDBwcWYwMG9xOUFnRHl5TjNv?=
 =?utf-8?B?aDNielV2YmJyVWlNTkpsODBid1VBVUhScFF2R1ZNc0U0U0JZMkV6cWN0VGNz?=
 =?utf-8?B?N21pZlBKY1ArbTZyTGtXelpUamJFM01ubUhSK0MrR3dadmRLWGtzUnFzQm9T?=
 =?utf-8?B?c3NiYXFIemQ4bDB1QTdjLys5UTV0R1pFZWRNcFZ6U0s0RjhIWEJCNUtOczNh?=
 =?utf-8?B?WDlSUXBQelhJMnJLdnJtMzUyTkt0MUtMbWw2Y0NwUG1LeThWYlAwd3REOEph?=
 =?utf-8?B?Y0E1QVVXQ1cvR3BsakpwRFdSL3VmTHlFVHVTVkh6UVY3eXNCelBCbEZaWkxa?=
 =?utf-8?B?a0NrbkZySDVWQkY5MlRqa3hwdTF4WEJVTWx5M0hKY1NKTWh3THhhUEJJbStP?=
 =?utf-8?B?RjI3MFY0ZDB0V0pSRGV0NzdVQWU2QWxZZFlaK09GUngvTGxyS3Z6ZE5BK1Mv?=
 =?utf-8?B?WmRTTU1QOHBlOU9vc1lzRUw2em1sQzdCeVpjUFgvY080aTBWUEJjUWYyZ0ds?=
 =?utf-8?B?bDNCK0FMeVB1Vjg1d3ozMEJyRXNNcW9pTE1qM0tYdlVDNzh3d2YyZDNOYXVH?=
 =?utf-8?B?bzhwaDBwZWx1NFZPYVloY0JpUnpMNS9pdVI2OG8xS0pjak1uZ1R3dmdjai9V?=
 =?utf-8?B?Z2k0NUtoVk1MNG1ueG5KOE42VjFYQ3BVR21Fc2Exc0Z4M3gyL21Ib3hkM0F6?=
 =?utf-8?B?ZjVkZ01IaVBnd09NTHAvaFUzemQwNWt1ZWszT1RtdFRSa29nemxzY3pCTU5o?=
 =?utf-8?B?OW10YzB4WjlBVTlEOWhJM3FuenNUY1NIaEJJT3FycExKZERZSWlreHkxNGli?=
 =?utf-8?B?enhxcVJCK2NadzZXQlN1SkVub2FraTBJMjd3WTFyUzNyM2hSUmd5QTRtazVD?=
 =?utf-8?B?QmtuS1lNSStEdEZ5djk0YXdtdXZBei8waTMxTFdkNWd3YlgxT253SW1FSXhO?=
 =?utf-8?B?Y3ZteDA1SUxmWFpEMDBGSkVQcFVJMjB6N1RKSzVzUzFFMjUrMGF6VDYzYXZq?=
 =?utf-8?Q?8f7VX7BEYk258Xirk3q398v60KSIH7ZcvdDXN/F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f258d9-cfac-4645-d6db-08d99243944c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:28:39.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b09vzjqfD5SSCUBXduEmmVsQtlpZCBhtleW4HiOL9E2pV+6nhmL1vYqdjjaSsWpN4y5dKbojCHgxvAAFcQZJzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

On 18.10.2021 15:27, Juergen Gross wrote:
> On 18.10.21 14:31, Jan Beulich wrote:
>> On 15.10.2021 14:51, Juergen Gross wrote:
>>> hvm_memory_op() should take an unsigned long as cmd, like
>>> do_memory_op().
>>>
>>> As hvm_memory_op() is basically just calling do_memory_op() (or
>>> compat_memory_op()) passing through the parameters the cmd parameter
>>> should have no smaller size than that of the called functions.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Nevertheless ...
>>
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -31,7 +31,7 @@
>>>   #include <public/hvm/hvm_op.h>
>>>   #include <public/hvm/params.h>
>>>   
>>> -static long hvm_memory_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>> +static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>   {
>>>       long rc;
>>
>> ... I think this would even better be dealt with by splitting the
>> function into a native one (using unsigned long) and a compat one
>> (using unsigned int).
> 
> Why? In 32-bit case the value is naturally limited to 32 bits width
> zero-extending perfectly fine to unsigned long.

It all ends up working fine, yes. Else I wouldn't have given R-b.
But the .compat slot of the hypercall table really should use a
prototype without unsigned long, and then the calls wouldn't
zero-extend the arguments anymore. And then the declaration would
be wrong, as then it would need to be the callee to zero-extend if
it wants to use 64-bit values.

> Otherwise I couldn't use the same definition later.

Right. And this will be less of a problem once the function pointer
tables are gone, as then the compiler sees the real parameter types
for the individual functions.

Jan


