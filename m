Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA26942C024
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208382.364486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madTf-0001tw-Du; Wed, 13 Oct 2021 12:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208382.364486; Wed, 13 Oct 2021 12:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madTf-0001rF-Ai; Wed, 13 Oct 2021 12:35:23 +0000
Received: by outflank-mailman (input) for mailman id 208382;
 Wed, 13 Oct 2021 12:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1madTe-0001r7-6V
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:35:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0722c2a0-2c22-11ec-816d-12813bfff9fa;
 Wed, 13 Oct 2021 12:35:20 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-X1IE8JBHO-ejKUAP8P32jg-1; Wed, 13 Oct 2021 14:35:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 12:35:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 12:35:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0018.eurprd05.prod.outlook.com (2603:10a6:203:91::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Wed, 13 Oct 2021 12:35:13 +0000
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
X-Inumbo-ID: 0722c2a0-2c22-11ec-816d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634128520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0H9+WKjmlmsm9ExH6rOGGW7jztCS6kGe4pQCjtAIGc=;
	b=EMAsrsudUUV094KL9JQ5DKcqrUgyB46g2LoZ4HLLECv14DnNZLy5R7LTClDcmk61ZYnDgF
	SpXsxNm13ZFkTrg+vnO4HDhX4hO5TVt/5eBMWGr00mctDGb8xKGY83OEFSXAp6zeAZBMXA
	4KH+A4gH92knRjnVejtZnenQ5Y65qMc=
X-MC-Unique: X1IE8JBHO-ejKUAP8P32jg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAL4Vg6pg1idZ0+dQEcpJqenNPYJ2nY6xKzUy9JkQsAIihAf6b/hc1ILa0J5tRgKyBbnz1DhNV2nhmkg3zxyd88cKN/KtJyPiDPnFucON6eEh8pMEcgQcsDJeLk3G4/2DQPjYgNIoyfCRUqGG03zN+J4FM41VVN10R1HeWgJAoOAhXDs0EMDHGPVuxuoagb4p1JCCBQ/a6AShdkz2ngUDINoEQILbCq4B1J5gtz3z4Vbc1iDVT+1z+LqU97M1BGFfqEvmn3Kv+n1AAfhxGVxtqC5tlLErT8i3DnTXWi5UlksdkxQCKzqNFwyGqCVkyikIKT52qIy4/fQy79VqoL5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0H9+WKjmlmsm9ExH6rOGGW7jztCS6kGe4pQCjtAIGc=;
 b=UYLLNUzCeXmzrMvx+iT/615xoSuv2jw7tA28Q4fZfsptPvZHLNPkwTfYsj6xV4I05aV+S4VgIU+usVm8XrraufdDbGgsBFm48J9GWW/aOV8jzUEd8TuFG3RsNEfBiVpHqchMpAIomt4qKay8VBm8Yno/VDZBwlGF7RMSCNE7an+BG4kTaRy70unPBAgLegPmybIAlQgiugpXZH/ygcuMNpIr02KSWgl1J/9BeYr0XHYgM1x5ADdFT+Awp+csH0UZF7gK+Ulzrwy8edtWHEf9oY92spgJ0yk4LwcpuMvgCnGiClc14+d9LOjryigtayOY6xfOJIHNLL2YIIjHYL6QJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 24/51] build: prepare to always invoke $(MAKE) from
 xen/, use $(obj)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-25-anthony.perard@citrix.com>
 <430f6b64-e255-1250-1afb-a596a57ed1a9@suse.com> <YWa7ms9QIV4szv9x@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47358db3-8108-5a28-1b00-6d206800294a@suse.com>
Date: Wed, 13 Oct 2021 14:35:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWa7ms9QIV4szv9x@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:203:91::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09571bee-94bb-49aa-1d78-08d98e45e7d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349E7B1689FC942650DF8AFB3B79@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	05L+yKR/4SHawFufj3ImrdzruDpT0CENKoWbC82bYL+6CtnOBKC6+L9mOCbEgk/I1D1jIQSxldDWeEfN/SF5FGR3XdDgkemSEpCPnsDfI6dVTyZGmlzp/rGe12SFZEcAtRWH11xlT5fY7wCsRFDypaa77L+W1GXj3od5k+VVIhs6LhBbg0zd9WA8PyIGI/0CII7d9LwT8o+xvPHfFUIx3v1KEVp6NmfZdiG8cZ/XJ9Dkzy/dp6GCHFcgcpQxmeQStTP1NMEaFF7CxDdieWDDFreOstWIT+V9kjOSeKyfczN4Op0LS9p9KLoM6fqwPsGYvcEJSI3YR8bWCcd3j1PAqPxqB9UJK7YBdfYd95b3NskyzDe26Wioj21yo4OnZSH90F2q1vVR9uzEzfTDTe50m3c2kSgRW3xA6zes8Cid7SsAHllAwH7BmICpEL+NTov7U3dfDqInLyt9BrjCaAgPsh5HgeQg4nRi7/UbeyPlutAwLpksjqCKrrbTLuNUo9nyzGpL/EjiyMRvvcc5lfNXvm1MIB4zla9W0yCnqGKNsNDZNYQIZLHbgXD8ma7WNTE8OQZMElFQXnkAO0F8Sd93BxxXkrBJFr9+8b2rgEYX6oH8BELtDigEZANm786y6RzjCetNTW4JjOpcoLYzPS4EP8fR1ZnaghHT+K8PLmNuBm/qb16rttNTZKMNFFWDEBhCr4xOYKNQM3bXyWxQEz6LM7OZpVSP7aUH6H8U6UX19q4DOb83okIXdKfGlf+xjzcp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(53546011)(5660300002)(31686004)(26005)(66946007)(4326008)(8936002)(38100700002)(7416002)(2906002)(86362001)(8676002)(66476007)(83380400001)(66556008)(956004)(36756003)(508600001)(316002)(16576012)(31696002)(6916009)(54906003)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2FNdDYyMnQ3Y3J4My9LekgwUVEyNGs0UUJjK1NvcUJYcy9DM3diYXRiVlFP?=
 =?utf-8?B?M1d3VGQxSUZBa09mU2huL1pCemJ0MzlTZEN0aXQvZHNQeW9qaCtzRzlUY3Zy?=
 =?utf-8?B?ektTcm5wZkxseHNsOVZFN0NUZC9TRGh0cFBTemxzdDd5TTdUci9VdThKQTRW?=
 =?utf-8?B?SURZbzZRVjdsaS9FL1RsTU5MR2RwWjhWN2ZFNFp0R0dSUDd0Ui9NMVRWYmdy?=
 =?utf-8?B?bGVOR21qL3RWbnZlb01Mc0czZTh3T3FMNXRjeDNoeGY1WVlVVHJER2FjV0NW?=
 =?utf-8?B?UnpTcWlJRk45QW1ObE9hWktPSGZ6VnpUcjFvVVFXcUU4VVpVdi84aWs3Z3hj?=
 =?utf-8?B?U0kzY2pTZzJsVjNlOG5iZS85Tm5aazJNbWN3b2NHblh4ckxVVWZyT3VHcUs4?=
 =?utf-8?B?eVNuejg5NjZnazJFNFE3eDhzOENiRUsvdXFrak5uSnNDUGo0aU8xZkh2cnpJ?=
 =?utf-8?B?SmlhWmR2UTczaXp2MWNveFBXelA2eTJyVFNjOEEyQ096d3RIcEJhcFIyTjdh?=
 =?utf-8?B?UUgxQ2FQRkhmaWlya1UvN0ZVaUNpWWZza2UwTERTMEtGRG9UMCtyVzNOd1d2?=
 =?utf-8?B?dnZXTnpEWUJra2s3SHFXaHJVdWpmdzNpYnp3VWtyL0E1UjZIaDNkYWZqMmtX?=
 =?utf-8?B?Z2pDaW1kMVpSWXVwa3NqcjJaSURCUURaWUNaZkVmSSsxWDRsUDNleVV1NmxU?=
 =?utf-8?B?REdWMkJ1M3RLUUxJcGFoV0ZGMTN5L05idzZHVVpiSGdOdDhNeTk4bmI1RG05?=
 =?utf-8?B?cW9FNFRySlJlTlo3SFBYYXV3eW0wNXpld0tsQUg3MDdrUHl5Zit0ZVRXWW9I?=
 =?utf-8?B?VjVGMndnQktGL0ZiVmVZejFWWmpMVEdyalZaMEoxakRudzlubW1YMlhITnc0?=
 =?utf-8?B?TU9DUTk4MTA2ZVh1RzRVcTlrVEFaOHc1WHJIdHpqeFArYk8xTlE4RlJTTk0x?=
 =?utf-8?B?SVN6SVZPK0Z2WjNQSHI3NytyRUt1N1dNd2tGZkpvTzl6NGtrWFBzQnFkK3dY?=
 =?utf-8?B?YlZvcUJ6MlhDQVc1MTlGYTZxUFAzQjJnSk9QcFdZUnZwZ2d3VXhGeWVKT1pG?=
 =?utf-8?B?eTIydUhyVlVTQlVpcEZtb1NmbG1tcHhYa0x2WFNjNXRDeVlDNkpnRVFGeXgz?=
 =?utf-8?B?Wm1mSWtIZ3BBcGNDcHJjV044eXZuOEJPZ1NUR2xzZHZwclhONkJIY3NTaEQy?=
 =?utf-8?B?WloxL2dnVGsrZ243ckhxWGJEN3gwZ0ZqeHNuSURFTW9jY01UelI2V2dnSlJN?=
 =?utf-8?B?Wm9aM25kZGREZmgwUlA0SEl0NjZIMTBTWUVsOW5sSGJVRVZoUTYvSmFZY2Vq?=
 =?utf-8?B?WVY3R1BFOTdxWTlhNkF2VlpKUVBVL3EyWTdBQjdiWUl3NGd5NDZYZGpqRlNT?=
 =?utf-8?B?azFOMHMyeWI1TnYxbUpMOCtIbkYvSUQvRmNQVkFPcHI5cEtrZStFNlg4RHJi?=
 =?utf-8?B?TW8xOWV0WGhwVXZUUlpDNzJ6WUo5N3JOOWxpQ3E5NVByaE9xNWF5QkhtQk9W?=
 =?utf-8?B?UXJlalFUUjVTQWhMYmUzN0k4dUVvdUFtTDhTdE8rMUpzM0lOZUpEcmFpM1Zp?=
 =?utf-8?B?dFcrOTBlL2owUCtXT1BFaExDNzJBN2Y4QStjeG1JNDlsZWZ1Zm1Ub0VNQUtv?=
 =?utf-8?B?bHZTY0xWbGpWSW9ZUzVoRm9RaVhvcjVpUXRuWUp5VmwzRDVpQlJlK1lMTEdG?=
 =?utf-8?B?YStFSnZPSkRSZmppK05EVEpKZU9kcnVTd2g4UUdMd1FpdVA4TUlBaGp1NHVu?=
 =?utf-8?Q?JDVr7C46L/3XAXDxYZsL9P689Ql52JJz+IJBawK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09571bee-94bb-49aa-1d78-08d98e45e7d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:35:14.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PW0NALyC+UPs3xv/AqLELsBKgo2lfjtPEGIC3mEWhkp4PeEXQvh+8tw2N3CmJ9KnVkFQ0Ze8GkKLvW3Kt5MSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 13.10.2021 12:57, Anthony PERARD wrote:
> On Mon, Oct 11, 2021 at 02:39:26PM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> @@ -222,14 +222,14 @@ $(TARGET).efi: FORCE
>>>  endif
>>>  
>>>  # These should already have been rebuilt when building the prerequisite of "prelink.o"
>>> -efi/buildid.o efi/relocs-dummy.o: ;
>>> +$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
>>>  
>>>  .PHONY: include
>>>  include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
>>>  
>>> -asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
>>> +$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
>>>  
>>> -$(BASEDIR)/arch/x86/include/asm/asm-macros.h: asm-macros.i Makefile
>>> +$(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
>>
>> Isn't this $(obj)/include/asm/asm-macros.h ? And in general doesn't
>> use of $(BASEDIR) need to go away then, e.g. ...
> 
> I've limited this patch to add $(obj)/ and $(src)/ were needed, I think.
> 
> And yes, BASEDIR will need to go away.

And replacing it here while you're touching the line anyway is not an
option?

>>> --- a/xen/scripts/Makefile.clean
>>> +++ b/xen/scripts/Makefile.clean
>>> @@ -3,11 +3,14 @@
>>>  # Cleaning up
>>>  # ==========================================================================
>>>  
>>> +obj := .
>>> +src := $(obj)
>>
>> This repeats what is also getting added to Rules.mk. To prevent
>> the two going out of sync, wouldn't they better live in a central
>> place (e.g. scripts/defs.mk)?
> 
> It looks like they are the same but they are not, it doesn't matter if
> they go out of sync, and they actually do in my patch series.

How can them going out of sync be correct?

Jan


