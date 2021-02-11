Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B3318CA2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 14:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83907.157152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACPQ-0007uS-39; Thu, 11 Feb 2021 13:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83907.157152; Thu, 11 Feb 2021 13:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACPP-0007u4-Vz; Thu, 11 Feb 2021 13:53:27 +0000
Received: by outflank-mailman (input) for mailman id 83907;
 Thu, 11 Feb 2021 13:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzmj=HN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lACPO-0007tv-Gy
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 13:53:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5373a624-1236-4a50-b9e2-873dc13a05c5;
 Thu, 11 Feb 2021 13:53:25 +0000 (UTC)
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
X-Inumbo-ID: 5373a624-1236-4a50-b9e2-873dc13a05c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613051605;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lXSGzGBDTLVTIC7+IZAPlzSog7065n2VSfHi1CuBn58=;
  b=Y9NUeHxRyVsYwiSp+/4fYFZnee977sJ/De4WbZFfic9JaOFWzjj9KICE
   4uh0lbohr55S8fWgziCmPrxnC9UFWmdLIGQ0JsXcVTkDyM3M2dzOwPnv/
   iA8c6l5eM80M1suFyytv7MLDvw5GDbEOfOIXWo+7MYL7lcO6lqQyYFQEs
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LL3fwKBwcKukpEWeKp6haoCfmojw6EZlwQxPgaMy48flSA/Lw7clocUTZeDuj9UyZVPy03uiFy
 ghWWUXw+LXqBYMFMXlfK0yaiC9yQkQC/zvD2KuA5pYFgthwSWP7otFYIA72XzvXk874kc3sc/0
 2JeTXw7S9r8MnLY4tAufFOD+kOqngLpBQcx80TzHjfAt9Eg6kIGK711eF8lN7RbnI0Q/yEPRdg
 /CQrHGsx71NpI9U/1a5j0zQOAiHjsxk1ODx0VNjdoFMXbiuSEcPTq2cO6bX3/FeElnxNl6VyEy
 T5M=
X-SBRS: 5.2
X-MesageID: 37236409
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37236409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLyeUXm50GWv+UPYl1e7i8W+oBojY9PHONiqkDCy5TzAJHiZuFW8NgZclMWcLXWqlbfRG6DEIShvSqLEyQzURgHCBTcix5mKjqZlRbdgUwfE9QYniR6/4iZsgCXKuy123kBlfFNKK0tMiRw5qkX3A5Wf5JBEenPpRWxXxMlXEQXmGHCUMZI/GKpak0Gmlfq7M0l9WGqHvON4iYR4i+C66HnqWzcjG63jKiAVBCnJboLFoMhuwk6NJvOaz+o30ohPT3q5vEdUfmBrqUZ9KxZiN65XBXCF088Cn0Vv8Ykk9+UQjAXAXoQmvS1VDLoCdUh1lCmJ1+ru8aoCdAOJaMvbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXT57OOjhb13TbZlcLP8QSaorO0xgSrsszjAEqbEdhw=;
 b=GchIMOZwFMwiYDUQR4vlQuq4cFwNi7a3nu6oS69nEQmTQSdIJ8LuCOnaH783R9hG1uNepvpy9UO8RuDdBK7M+ZaGXQu7YyBdRsbimu+0J5PK+QitltFG0EMq6bKALMEBplWONc4IaW2WwUyMVsJ5BNr4O9hr/5RAzM9TY6euvvi71XeaDwQj8eIDB17G2Wui7+y9femVxkejNSzJNKI/ufHxo6eR5kWksKXUbbgEe2TfPjaJEh49ItWvmcNSUyU5ioOaiWX1kmkMbHoPNSQQa9FXciujXAguh5q7CJa1vE3URvTmyJ/X7JryX9gD90xbf51ifj7ZdKpj1HpCcxFfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXT57OOjhb13TbZlcLP8QSaorO0xgSrsszjAEqbEdhw=;
 b=pMZ1kyN4vcWHEQqRL8R1kIz/YPDBZmt5yVmAuRmf5PzUfogttMTJkwzVvP/HITeTAtvebDHmDgYB31eHQEqcBrbzVfs5j3Mw0+e1UrypubfavKOob1Bkoghk3ZSbo/xoZRnoxwC+8K5rZWDwRF6mcCZ57rrbiSXLbzcqAULCTxg=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <YCTuq5b130PR6G35@Air-de-Roger>
 <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f71f975d-8e01-ecf1-0762-30ea18793690@citrix.com>
Date: Thu, 11 Feb 2021 13:53:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <7abc515b-d652-3d39-6038-99966deafdf8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa643e6f-0483-4e68-50d2-08d8ce94646d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4166:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4166ACEA625AFB63F8D965ECBA8C9@BYAPR03MB4166.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cg4y/7SDl/dqBtdrlqufW+OoWc5z1ykIMXRAP32VxS9hSGdX3pOUEL2WFyAAyu7bPjJ10SJFQLDV3TV/pEZJ1D9OjYDpWEBOU7uw0jfC/zWwLg0Fa7md5pYSpi0+H+32qGKqDtWO6rbJ0oZdtQrBBNn90212bsm2MdvO2AettYBzXhZJqhGlD2t7CcvCoIPmVsh+J7v36zL8J9WuhuKp9Zw6KwnXfUZOv5wGjzj4jsJ8witobFrEJtjht2HWIdYaxxcpFR8gYTswkrZJMp5RkMX9TwFTRGhpxBQ0ACaIqaXWiw+WQBBEBeyrz5LyRmLhFIcz2La7s8k7cWEY1ayVYaMvj4FpbTm5WTcBhZOx2NJ+LYLuXUwnkJNVDy1N7qT9DvQuylBrdHT8gxLaMKJv84R06bPf/aX0rwi8LqyFyaxFycTOAXY+kpCd7ObLgfYrGOoJk5UvUUCW+WX5VKC8NCZJWs9ki4bqARCuEHbCF74Zcgqoh7tCG+DBw+is8Quzm4IlfDZF+GJOjpNIF+tIKhcmFjyVl3gIsB7EZhYD3QqjNX/2d1x9Rnxkgqfuy3zfOvhibxloWgzhDBWsBJlOk0AZ1kof2l0ZmiLKivQSTQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(66556008)(6666004)(8676002)(186003)(66476007)(86362001)(31696002)(8936002)(66946007)(5660300002)(54906003)(4326008)(110136005)(16576012)(36756003)(26005)(16526019)(6636002)(2616005)(6486002)(2906002)(53546011)(83380400001)(316002)(31686004)(478600001)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3p1MkFvVUd3ek5WQVpqRDU2dTk2REtLVHlNWTJlcWpJelJjaHNsdTA3Qk5m?=
 =?utf-8?B?b2lmRUdlWFNWQ0w0UlpLUnNJdytHNTdka3hzTU41MlMreWh0QS9ZejVwdHJm?=
 =?utf-8?B?NjM1ZEtnbis2R2VsRE1FY0lXWTdQQnFseTNIblFVYkU3VUh4Z1llaGNwNVdh?=
 =?utf-8?B?V3VLNDFPanR2T3RPb0d1bGxCMCt6VVFnZnN5d2k4a2NTZ3AveEI4a2xoU1hK?=
 =?utf-8?B?SGMyVzZQbnVoK09jRUR4UVV4ZTk1T3Rib2RFbG9zMHpHQ1p6dHFQY3BVWUdV?=
 =?utf-8?B?Qk85cnhoMUliakZ2UDIwTVE1WnA1M3B5WW44VWZtY2k1UlVwVWVmMEk5WTNz?=
 =?utf-8?B?SU9wenRSMFNIcWNFZHB4akp5elJBc3hrNFEzYitqRGJaWHVTdUhHSEhxckNw?=
 =?utf-8?B?VTJ3Q1hiOGJxTFFWdDB0TTBtZ0Zha1JjbkhnVHNKZ0w0MCthdEhUb1IzNEp2?=
 =?utf-8?B?NEZLUThCS0RCUm56cUJPWWZKbklQQnZZNFAvVCtxY3IxTHBvZHhEbVpJUW9k?=
 =?utf-8?B?YXE4RUcrY05JMitGVDA5M1pkczg4ZE1kc0t4akhnQm11cWFtcmp2K1VubHE3?=
 =?utf-8?B?WjgyazcrUmlRWm01akg1SWVrR2NiRkNVU09yL3VseVM5dkhaNFpPRWhGT2xK?=
 =?utf-8?B?SmwwSGJhY3Z5d3A0RWl2WmgrWkl4RllqNmlrQVBvUjdNRUtZOHBWSCtoWlEr?=
 =?utf-8?B?SjRCL21ScjZOOHhLUVEvM0Vka1ViZ1YweXF6OGcxeW1TR1lhM1BXdi9WK3Q3?=
 =?utf-8?B?SEdBeU4rSFhXRHZaMnpWOXo0dlNsSXZoUCtmT2VSWEd4a2IyNjkzelEza1cz?=
 =?utf-8?B?akRCRTBuUnFvREZUQVNtNjFld0lVa0hSZytURkRLcE9xdUMzZHZBbjBkbkRj?=
 =?utf-8?B?dUZUbktKa29sb08zdk1vRm9VTWxuQjl5SmNuWjRkSzFOZlZCMDl4eHJjWUcw?=
 =?utf-8?B?OWJ4OHBsME51eTE3THFxZi95TmtYdllXb2doemNoNGRxNEpIUDBsSmFicXhE?=
 =?utf-8?B?T3lXdEJXdFFBamxRcEsvNEhlYmlndzMwRjFkbHVBQlJCTkY5a2VqOUhxY2ZD?=
 =?utf-8?B?eG5qaXJhYWIzajd2QUJicm1RdE5xRkNISnJLK0ZzUWZRbUJmTlA4ejM5aEEw?=
 =?utf-8?B?cEc0UjJEd1hxVE5haVRSU2NkbTdtc01aSVErcnR5ZjVnRlViWUg1cmhyM3I4?=
 =?utf-8?B?WFVCc1p0SzlOWTBJTnJQWFJXUFhLN0o2b1YzcGFoYkRTTXRVcklwZTVwU3ZU?=
 =?utf-8?B?ckNIYldROTdmWG9EbmJtZXBkc1h0ZHlwVHI5djROYUNkN3FpbjJtWm4xRy9T?=
 =?utf-8?B?cjZIMGtjMWhEZmY2U28wRkFOUTUxaC9OS1BKT2V2SEVEUEZMMkFqQ2ZhU2pZ?=
 =?utf-8?B?UmtYaFozSnMyUHlXbGh4aCtpOGNCcVhJWDErRTVFVVpvTGFNRWh5YlBuT2RM?=
 =?utf-8?B?clprcnlEN0syZStHckFKK2JmZlkvcTF1d3dsY2pBV2RCekpqWnZpY3d6T0dl?=
 =?utf-8?B?MVRSMy9MTUIwZlFHNDhWblpRT3RsL1grKzBJbVBHZzllajZnbmp5UWUxZ2N3?=
 =?utf-8?B?bHBqaDc4aHJWR21USDFISThBdFArTm9xeWF2SXN3OTBJbkh3WVJ5dG0yQVFp?=
 =?utf-8?B?dzJ0Q2gzSm5sL1ZWUEpjTWNHVmVwMjg0Tldub21OQ1ZxcHRNYnRpblV6MjBa?=
 =?utf-8?B?MXdRSmpRUnZGdmNPcGo0S3VXNFYwU3dpQzV5NDhhOVdDZWhmMkV0YUhWOVcv?=
 =?utf-8?Q?jtOa2VuCQ42LuWaVXoTOLZY/VlM1oFB7FLA8OrL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa643e6f-0483-4e68-50d2-08d8ce94646d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 13:53:21.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myGjkMZnvzZ6s0Jrh3JokeGohdX4Ktx2e0bnlgSHwkjU1VrYto5NQwZRCUfZ88qW0eUYeveLnqRtileEOC6KqkK1CfZBxCPCc3vzjyD4kT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4166
X-OriginatorOrg: citrix.com

On 11/02/2021 10:36, Jan Beulich wrote:
> On 11.02.2021 09:45, Roger Pau Monné wrote:
>> On Wed, Feb 10, 2021 at 05:48:26PM +0100, Jan Beulich wrote:
>>> I did further consider not allocating any real page at all, but just
>>> using the address of some unpopulated space (which would require
>>> announcing this page as reserved to Dom0, so it wouldn't put any PCI
>>> MMIO BARs there). But I thought this would be too controversial, because
>>> of the possible risks associated with this.
>> No, Xen is not capable of allocating a suitable unpopulated page IMO,
>> so let's not go down that route. Wasting one RAM page seems perfectly
>> fine to me.
> Why would Xen not be able to, in principle? It may be difficult,
> but there may also be pages we could declare we know we can use
> for this purpose.

There are frames we could use for this purpose, but their locations are
platform specific (holes around TSEG).

I'm also not sure about the implications of their use as a DMA target.

>
>>>  static void vmx_install_vlapic_mapping(struct vcpu *v)
>>>  {
>>>      paddr_t virt_page_ma, apic_page_ma;
>>>  
>>> -    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
>>> +    if ( mfn_eq(apic_access_mfn, _mfn(0)) )
>> You should check if the domain has a vlapic I think, since now
>> apic_access_mfn is global and will be set regardless of whether the
>> domain has vlapic enabled or not.
>>
>> Previously apic_access_mfn was only allocated if the domain had vlapic
>> enabled.
> Oh, indeed - thanks for spotting. And also in domain_creation_finished().

Honestly - PVH without LAPIC was a short sighted move.

Its a prohibited combination at the moment from XSA-256 and I don't see
any value in lifting the restriction, considering that TPR acceleration
has been around since practically the first generation of HVM support.

~Andrew

