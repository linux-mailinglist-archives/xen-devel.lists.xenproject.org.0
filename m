Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957194DC990
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 16:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291642.495137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUriC-0006Ha-1X; Thu, 17 Mar 2022 15:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291642.495137; Thu, 17 Mar 2022 15:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUriB-0006FA-Sv; Thu, 17 Mar 2022 15:06:47 +0000
Received: by outflank-mailman (input) for mailman id 291642;
 Thu, 17 Mar 2022 15:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUriA-0006F4-CN
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 15:06:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d845368c-a603-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 16:06:39 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-huuJQdKNPpC0bTjg0ru_ow-1; Thu, 17 Mar 2022 16:06:43 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6184.eurprd04.prod.outlook.com (2603:10a6:20b:b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 15:06:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 15:06:40 +0000
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
X-Inumbo-ID: d845368c-a603-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647529604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=anzT11GYrwgbhbX71TOI2rhQQvlWwAjT9qS2k6DqxY8=;
	b=H0MkAQzfteoCfAYBNvhZvOWVLUcG9ih6PYk81Gc78D9qONMEO0ydUhP0NA5GcyJeNQGO2k
	VKPZLyySnZsseTx/qdQqLYcOhXbL9UqRfkW3mh6h3RB0gljksV29VzNq69W/X38KzbpsaS
	bP2Sl1wfmjUQcGd/+NEeFxoFpP67who=
X-MC-Unique: huuJQdKNPpC0bTjg0ru_ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTTcyxrGeUTdrRKmh6mqDU8B+Z4A+VZaQZ9EXncoVpg34EXj/9vExAcAMXtObBerw4DyjdNNEs7kntoqlUVREc98tLXejt4S9PoTCKREiiAtNjDbCJSsujQQebchvJcyB5pQqI0MyVxGpOCu/0HeXPXyenARbb4DXCTzkwNmE9lONRS5rgxMg6RmBfYTWVH2DIPKkJP311GpNLIYBllqONEeclyUzsGtaLpJEVmqEZUV5kFTzewuEGcV4gx1gXXoad15Zz4G/ROENAFBB9SkbFbmrFx5j1gRZWuVdu85R//z1g1P4Sa9EYvtAp/LLS+KWh/GqFUsRzPHBjX+19esOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anzT11GYrwgbhbX71TOI2rhQQvlWwAjT9qS2k6DqxY8=;
 b=F84e6380vdYyAS0d1JgEona6p6Rib0m6H01IYo0cNF2MQ9wQlLf09xROaqZ6CM5mYSQtjK5AWMWe1boXHfyY0wut9EldLW37iqV9yKk0s+367y9Mpn2LthuW/kunaNAT1Rp9M5t8WEHuj7F3VN7V3li29vuJic+SN1DYm5p+kDgiIQUQCkFE2lFgCSF/PwygxI5s3eI987UWeYJkY3/ygb2p1fzJupWqxc01SnIGrhKuSEC/69LUsvfC4G+zRkJskR/VsG9eYZLUOblWeoBRKUl65ft63PKoOYFJGIvkjIhsJxZDeediF8lGBzJoui0PHqhIULalwzC9n3f5T72Fxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dc898e4-b00b-2e85-eda9-a28da6737ab5@suse.com>
Date: Thu, 17 Mar 2022 16:06:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <28f869eb-c6f0-cc67-8d29-9751447d2ad3@suse.com>
 <CABfawhnsbqBOuTyB-C4sY23GY-4-AXd38TXqVMemVt_duwSZiQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnsbqBOuTyB-C4sY23GY-4-AXd38TXqVMemVt_duwSZiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::10) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d292e74-6d64-4e18-8504-08da0827bdc2
X-MS-TrafficTypeDiagnostic: AM6PR04MB6184:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6184ED7DB0C43330232D7062B3129@AM6PR04MB6184.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dTffEFUdYRgEAJX0vMyCUS6NZGThjcaDbNugIvDQIstDbBJTIEiWdho559Okl0VoiIftaQCJ1hRP+M76ooRio+WyNQBQR2sKO4Wy8Hj/eIsIpAciNDa0lWcwFR8tAWyHJKpID1RcDi2BcVB++K3KHR1nofDr8ZroKZCgm5nDDS0z+F+miNM5WCjBDy6ZnDPQz02hGlB3d3cR45yQYbCncYfD7uwZSGeEXxK+v1pMGRBNKuL4jwM4vuI8n7/tV4AC0KKPaqxjHBp/m6vzHE4Kf0X9Q2kQ+5SZmffQQ7mvHySL6W+GWpx0DjWgV6S8VzzHKAUCGyhonm6lCqDond1OSNnf03vTGDmuPp0OT6G17xyeU3R67CE8DY0uxdhf6VWk8unMXQR2dsywuezmdWmu7Dalwao+sAD/6uIDElO/HHsdAbBsL5oxZbVGwJdwpB6kombM3OqQhbXFtqIRnWmAWheiMKoMAMbqvNvJy5Yv5kapuFcCGahPgy8OOThajeHeXCY8aBVNLhKyoHuWeU4OQRhOzq10P2+Nnt644BNpOZShpIPi1s8cs8o9We7PfC57i8IdAYZAk/we6NYdt996IeiW+2VKCNTP4xtr9gEkoJa3KGXthuYMZdsbDqVmwBXV1O49Yk6FRPGpEgY+0feP4hoJrQj2iAkbdVUQ+XX7f7rKNDqMy0ewSWaviiDYDpqAJd/eORqbhhUrKBqA0C0i9siiwjVQbBJRO3QfM4iCbls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(83380400001)(4326008)(38100700002)(8936002)(5660300002)(4744005)(66946007)(66476007)(66556008)(2906002)(508600001)(53546011)(6506007)(2616005)(6512007)(316002)(6486002)(54906003)(6916009)(31696002)(31686004)(86362001)(36756003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEcvVjl5MldjVUJFcy9ZRnFXNlZDWVhxc3YvY2lBbW8rSHlwNXZhV0xKR1d0?=
 =?utf-8?B?dTBaaCtDNEI2ODVjd2RKUmdoYUI4Z2x1TG14MEVxMWRaQlhjSWxIUkdQMWx3?=
 =?utf-8?B?MUxQTVNLamYrM1J6Vm5BcGVqN0pwRmwwbFBmT2x1RnUwdFBQNnJlVVgzdDZ6?=
 =?utf-8?B?MmFEZ1NoQ1dPZkFGSThpTVB6K3QvVXJTMElqcC9yUXNZTkxtYVR0Vy9ZeEd3?=
 =?utf-8?B?c2gxSmQwTVM0c2dVVlA3OU9YWmxNNUM0QzFkRzdRdDltMU52YlRkRHpjUkkz?=
 =?utf-8?B?OWVYd3VJUktXdzlnL0ZTNW8vT0gyKytKd3pmaTJsWkJFeW9RQnJZSnU4MU8w?=
 =?utf-8?B?Z0lyeEVIL2pTcUNWbXF2T1ZBQ0U0RG0yeVNLUmVSYityMnIydW9tbnF6VUhS?=
 =?utf-8?B?cWV6V2paWW1DV3p3T3lTQXNLa2M5ampQZlJUb3VkU1MyNFprWjFMNzAzcXlC?=
 =?utf-8?B?dnI4STFpREZFTWs1WHZlUE13am9vTTlzKzNCZW42bnJKQXJVSFBERUdKZEtF?=
 =?utf-8?B?aE9lYU9GT0NkZ2hON0M4UjFKYmx2V3RqSTFxODlWYThGVmxud2R3UlJRSmsy?=
 =?utf-8?B?bndhMGVsWVJsQkl5dHNLQnpMQi94YzRtRnVUUGhzN0hvbzVvZ2VHeVd6ZnJJ?=
 =?utf-8?B?STBrNEpxUjl5d0hocDVhczBGdlZXSFc3Q2JkK0g4Tlg2YmEyNXREOVpaMWJI?=
 =?utf-8?B?dkNiRytOZjVxYlM0RTJ4TWNxY0lKYUtWRmVmTnA1YXJQR3ZrVUFHS05kN0d5?=
 =?utf-8?B?VVV4ZkxtT0JuckNldXJxUnRraENhN1dkb0NDZG1HWEFsbFhRRG9qYmUwbGhD?=
 =?utf-8?B?d0RuMlJ4MTk2czJzVUpiK3MzU3EvaGRJZHhWZlY4RVQ5cGVzaHlITG9aai9X?=
 =?utf-8?B?VmgxbEgyY3kzQWtaWkd6YjdaM0kzSW9oVTBGcXRYd1YvaFhPSWZoTktnR091?=
 =?utf-8?B?V09rd05GRlhGektYdFdzZG9QdUxib2N4M2Z6VmhZMDVDYU41NmFxYlg2SHhh?=
 =?utf-8?B?eUpVY0NQcmlQdW4wNUV4d250dmovME1ZSXFQOFNLR3o4Nkc5YVlZaE5YMmtn?=
 =?utf-8?B?VWFxMWE2UDJ5eE5HcU1wNWo4NmpnK0V0dVhoOTc2elR3OFdYQmVCTWRzeTRI?=
 =?utf-8?B?UmZzMWl1SjFtNGxQdmNVNmh5eGFyc1l5QytYWWY2RHpZczZCMXU4VFVFalQx?=
 =?utf-8?B?YlA3anhxbld5WFl5c3pFbHZRTjdrRWdkZnVYeW5OUnZVT3hhYmxKaTVET1U3?=
 =?utf-8?B?RlRJL2pyR2RYNi8xTExKYTd5K25qTTd5NkpMdlBLQkw5aUZNZUIxcm13WDVJ?=
 =?utf-8?B?NmlYUnJCd2ZsSEJzWjBJTTBmTXdSb3VWa3kzZlkwK3R5KzJJZjIydFE0aVlJ?=
 =?utf-8?B?bVhlby9GbVZZMjR2YlA3c29uZzBoMVhlV1V6amJZYitHS1RLTTJHWk9QaHUx?=
 =?utf-8?B?WU9qN2R6emVWa292bzZWT05oa0FKSzZjZHg3MjFyMXZxQy9vYXVOYTNOdCtQ?=
 =?utf-8?B?eis3aGE0OXg5U0hEL2gxMVU1R2RxUkRTMU9ldTRLRU1PY01JRURmQ25IaHJI?=
 =?utf-8?B?OWwxT0ZkZkVmSXhxeHF2MHpNcWFsMVF5VlR6WHM4YVREMHU4KzJmQ3YrRENo?=
 =?utf-8?B?NUl3K2kwQzNVTlZMMTRBQmJKSFkvUTQ4cnVRVFZ5cWVUOVVnVFNtTnhsWFNt?=
 =?utf-8?B?c0lvVkxBZE5oMCs2emkwRWpMZExJdE04Zm5nUkU0SXNoQ0hpeW9paTgxbU1u?=
 =?utf-8?B?a003NVhhb01ScHlYdWxXV05Xa0NUWVF0THB3V2RsVWV3VThGUU5qMGViYmZB?=
 =?utf-8?B?TDFwcGJ3TW5tT00zRit6QVJvWUxaakJmenJQUkdaSS9qV0daazF0Qi9tdW5U?=
 =?utf-8?B?dXZFb1FoUU9jeU1HNWxzenVmUTFwMGZQU2NWU0gvS2VvK3BnNUtQOXJ4OHpS?=
 =?utf-8?Q?M302OWchw/dzKtZ9SOxdPny8RW1kLqh+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d292e74-6d64-4e18-8504-08da0827bdc2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 15:06:40.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imRck1sS/eRvEAYkoxLAJi3WqM8hL+1Oo/ITp5wkNUr3hPuj+scXPAaYIwMJBF+7azzAIG0/9InqCjS52I5/Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6184

On 17.03.2022 15:43, Tamas K Lengyel wrote:
> On Thu, Mar 17, 2022 at 9:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.03.2022 19:44, Tamas K Lengyel wrote:
>>> @@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>>>      v->arch.dr6   = ctxt.dr6;
>>>      v->arch.dr7   = ctxt.dr7;
>>>
>>> +    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
>>
>> Setting reserved bits as well as certain combinations of bits will
>> cause VM entry to fail. I think it would be nice to report this as
>> an error here rather than waiting for the VM entry failure.
> 
> Not sure if this would be the right spot to do that since that's all
> VMX specific and this is the common hvm code.

Well, it would be the VMX hook to do the checking, with an error
propagated back here.

Jan


