Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C962749F872
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 12:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261970.453906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPdT-0006XF-Vv; Fri, 28 Jan 2022 11:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261970.453906; Fri, 28 Jan 2022 11:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPdT-0006VP-Ri; Fri, 28 Jan 2022 11:41:47 +0000
Received: by outflank-mailman (input) for mailman id 261970;
 Fri, 28 Jan 2022 11:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDPdS-0006Uz-60
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 11:41:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44c18a75-802f-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 12:41:44 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-SOm1B_QlOFafBNT5KCp64A-1; Fri, 28 Jan 2022 12:41:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8172.eurprd04.prod.outlook.com (2603:10a6:10:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 28 Jan
 2022 11:41:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 11:41:40 +0000
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
X-Inumbo-ID: 44c18a75-802f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643370104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ng4cWlIouCpGvfbfFpdMWlqZ7oGFx6uPQrKT4270Aco=;
	b=FMF12FYfptT4chIERqo1Wi+a72KCPkyC6GImZOxevgpcQPhb7f0axWir/CLD4Zm9snqEYt
	6zrVsJo5lyXmsLx4DAHueyfkFbJ79dK5cN+uMSsV+AAFAJB5qsFUQDiEVDXTlN8PuByMjQ
	cqrR8kUoSvW4zgnTnuE9hYh6ij/X+KU=
X-MC-Unique: SOm1B_QlOFafBNT5KCp64A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJVUsxHLk3X64jNJre5xPQHvrPtwl4By+OTjI+IO9zYL9g02Kz4vsq7F/1qZawnOZsoZ64BWXa9vBA1agv5AJmCtjYKJtYy/kGmtgo6RBkeHDjiEV+hoaAfL1rkZnQJABo2/rDuhTJW/zZUNBqGiYEviBBcm1UAvKuS+NMUVfi/GbFHOwjpUVx1VNjOxPLJ80xw3mAi1sCSlUS/xPkJwzxFdJvU4SEwflyn+ddKdxCrDWy3X5/I9UgwsryTveA3FT6+y4gBnRqJs9oE7nY9vEGVRNWJ3KME+0rLJkr+FM9sapFEbFF+KsXSqHnFuHkKnZgtf617sNRyfatm+0Jp8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng4cWlIouCpGvfbfFpdMWlqZ7oGFx6uPQrKT4270Aco=;
 b=RAU674MzRR3KHcfk03iM9LKvlMzrOCkqHF4n9gukKY2W0ml1uCEaL3tc4K07pjhMt3bCIao5HES1W9iWAb0M+tsBB2pUf9U/tR1Pwffn10VG9vMCNU0KRS+sJifedM6T7dO/SsUqYR1sc6WWziJpzu2jWs15EtJWpzulNXK8k17V+x2cc5R5tJHostgchRfS6B/QGkoWn/zWzbT4UTfcRqBwh7NTV3Mur+oN84mZKVE2rvGkj5xHRI+dTQVIHd1H3kWIQeL36WKw1yvOhyIP7fmCUo6oLf7AthUyJBRnMsTM1kfyrsm/QooLDHxrs7f+anpoQtUA3DnVAn1hnY6CjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c757048-bf9f-5743-a2e7-cbf5a7fd97d5@suse.com>
Date: Fri, 28 Jan 2022 12:41:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 04/30] build: set ALL_OBJS in main Makefile; move
 prelink.o to main Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-5-anthony.perard@citrix.com>
 <9bd4d8e6-d426-97be-f1d4-429a793f888c@suse.com> <YfPUP6iAatz9JPaS@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfPUP6iAatz9JPaS@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0059.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d516091-1b97-4447-62f5-08d9e2532666
X-MS-TrafficTypeDiagnostic: DB9PR04MB8172:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB81727953EFFB924AE19193E3B3229@DB9PR04MB8172.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+RqOMRM0KLBg7GDnfmEwlRzXam0QnOfzBI29tSb6iGrzsd64svF3AVnse3Jw+eMvUhlFhj9LYmFaDEMPLJvM+dQ55eoJ4gpoWlw9CGAat2gfZl0YzcGgweIKnfCWF0sIX4PW6uBgpIin/khZPmSYzGJDTgLB0cQhfE1Yu6Evu8P4Aa2irHpsRha7EPcCQBU5QoJUMb+WHkQJ1lLBsfJe6M0y/YkqxVnEU1qdAHusNn6WDZPkkUYZNovwgmzG5uUE4LNPTr/y7gGxXnrkIpihORGFVISKXyAH/X7rcUQtE8Tspz0dym6bT8pLKKOLAD6cxQP9l6hPhJLynjFWl8WQC409Cui1vjtK7BK3Ipvobj5P5VRsKxY/7NdflGWloHJVou1dMVNZS+3XnMrHtOxWbiiNknPoA63AZ04jJLBKPuMGkmX1aEtwf2Q1LORjgNHmRAzYwXaFDdN/lRXAVfbPnYEFxcuq298x7bIvOvrOzHN3axIZIy8q69M/zzKRtn4BnlgxoemFOBWUplRmy9GcxRJLbD9lH7sXa0RgTHhog/HTMec42FZOVG0veDIQ1nhCJyFORvw5zogu8ZfOo7b5J/UNDPHqmxOvehr24cMhgiUHU2hYn0Qu+oBY9as+oHUgEDUHFZ4y+MCi5k9dgGX9BI+zr/9reYSwQ9+B5IE9FQNtFienXFvof0pnedsrhJNqkmdves9wGq/fr5sWrKrYAwUmaEex3gV5NDEnUqJ6hrijaNnCkWOpzWfsjf1Uekn5/7TkMyV4LZlSCEcS3oY2XA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(7416002)(508600001)(54906003)(26005)(316002)(38100700002)(6916009)(2906002)(6486002)(86362001)(186003)(66556008)(2616005)(31696002)(83380400001)(66946007)(66476007)(4326008)(31686004)(8676002)(8936002)(53546011)(36756003)(6506007)(6512007)(87944003)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0dtWjl3dVBGdUVZWmVteFZZTDY5NUtBTTVBcFFFSk16RVhUNnRySWxuRVpE?=
 =?utf-8?B?RktjZlRzaEp2cEJLRmVnU1RvUitKNTF2SnpJdnJBU3QyTjBqcGJ4NHdwM2tj?=
 =?utf-8?B?TzYrSk9WVk85Ujh6b3l6Z0hxMTFJeitrZnhZVk5iM0VjR2lXYUhyR2F4dWxB?=
 =?utf-8?B?eXFjZ3BDdTlmSUVkNkZ0U1doL1YxaDZOVlNIeUlGTTNOeEZxRk0zU1VtT3hN?=
 =?utf-8?B?TG8vLzlLb1BoTkovQlVTWnB4SnptVVU5d0hqMVMyak11N0d3a0ZJc0xkSll5?=
 =?utf-8?B?VGxpWVBwcW1pTzcwcnFNL2NtaFhiaUJEamJhdk9LVmhTbXBiWk1wUGhuQlpQ?=
 =?utf-8?B?RlptaEJIVjJqTWJZTlZOLzJ3aTBSYksxYnBHdlJ1ekp3MzhzQTVkMitIRU4w?=
 =?utf-8?B?RTRaSXFZTjVGSkJyeGhtQUVwanVBK0hzNXI3N24rV3IvMlEyM0VYNmIxS0No?=
 =?utf-8?B?b2tsVVViNGtHa3FJMHpWMDJEcHJVcndRZnU1R2lDcTJZbWRNYk9ESlBEZmxH?=
 =?utf-8?B?eUoxaHlJcXVIMWhJaDhFZGxIMEpZeEFiZXEyV1drdkpSWWRpeTR1OGpIbno5?=
 =?utf-8?B?c1owN2V5by91Tkk4SFQ0Q3p3UTBuM3Z4V20rbTUvT09hUlRaUFJ3Z1R4SzB2?=
 =?utf-8?B?cFloWUNqZHVQS1VBSjBwYnJuUFVqRk91Vlh6RE5FTmw0OTJyc1IyVGVUcXpn?=
 =?utf-8?B?VDFaWTdYNGRyeThXdHVTdEFsa241R0hoQkVpNGUyU29UaDdqR3ZBeGluUEJp?=
 =?utf-8?B?NVpyRjNBSzBFd2liMklJTVhYYUJVNGxOenNkVDdTTmk0aGl5djFobkh6WVM5?=
 =?utf-8?B?TVlZVldBdVdCVThYRnZXVm1SUVczWDNDZVJ4T3hFQWFBblF5bjJXb1F1cVZh?=
 =?utf-8?B?MkMvc1RQaG5nV0RHZFpBTy8vOGJCSGg5ejF4K2FQVjM1dmQrM0pJRjdJR1pK?=
 =?utf-8?B?bFIrOGFjNzJlZ0VEUks0WTQxSEtHQnplUXRBa2VkOU40MTluREEvdGYxZzBk?=
 =?utf-8?B?WitOQ0h6VHlJWGF4YXpWWXFsRWtMcEZ6TFVMaFA3Tms1a28wMVJ3b1MxRzdJ?=
 =?utf-8?B?bGJvTytIZ2hIWG9ETk1tZjJ5MklucVFETmhzSEZ1WTQwSGdUNVhtQUUzQnBt?=
 =?utf-8?B?eWZiTmhIR0tZVWdYRXVCVmNmeFkvSCtXWE5OQWNiVVg1NEcwNjVnOFZQbk9P?=
 =?utf-8?B?U05xcytjMzFrYVU0T3gxTFhCMTVCNVdQQWZrUFRBRlppRVF2T1lzTmhYU3Bx?=
 =?utf-8?B?Y0hWZ1d4bHFFc3p4OEl4SlZrNUtPc1ZDS29idXNwOVlwU3F0UlVCWWNYV2h5?=
 =?utf-8?B?Yi8yOGpNbTdxeVJZOWwya2JDSXJTZ0kzS1NoNlcvY0YxZmR1SXhFRm5qeGlG?=
 =?utf-8?B?SHIyMlBteUlWaGxJR2U4Rm95RXJBRFMxMTB2ZFVxNWxhdWFQRDFmMTdjeFpG?=
 =?utf-8?B?cW9NMC9pbkJES1FuaFE3Sm0zWmpobWt6SHVrUXFTK0tCZzRnZ3BHTWlhL29t?=
 =?utf-8?B?Vm5jNzJmOU9vUnVZUTNTczFoQUpSVXdSbWZJbUkydk91cWNKMHVFYm1FV0VI?=
 =?utf-8?B?M1B2enNVNmdyZWplOHNWa1FYUEcrSEhIYUh5UjY1N0xRcGZ5cnNSRnNHMzNP?=
 =?utf-8?B?ZjJja1BHbllqYStsNE5MTU14NjNDS3lzRFNJbm9FbW1MNFdBb203MUlEZnFB?=
 =?utf-8?B?di85elRjYjFpelBrSWtOQ0NITHVlVDl2Z1VMUGFEbjE5a3ZMUmdZT2NQaGNK?=
 =?utf-8?B?MXlZekl2alU4VmxNbG5uT2U5SHUwVWFhaXU3ZW1uZHJteEVPc0k1blVtMnY5?=
 =?utf-8?B?VWFQTHlraDBMSmdVQUdMcTE0MlNEdjc5dnp6Y09Uc1dCRmMyVGM1b3E2WEtv?=
 =?utf-8?B?a3hBaEFpQXdsS0dYNUVKK3NJZ2RHZWdqbXlaWWN1bVNONWd2QzhTNlZYMTdS?=
 =?utf-8?B?aEp1NHY3WTMzTm5YbDJUNFg4Z2JQcVg3OWtLdzhSMFpySnhiem1KNGdYeXBK?=
 =?utf-8?B?cUlJYlk5M0VkVWRhelFvQ1dRVGxnaGdDL3luTkE5MWxGY2tFMklmVHdiQ1hz?=
 =?utf-8?B?UkRCY1RBMFYweHh2dVViTzc2L1lIVjYwZmZPUTBZTlJIbW5LWkRVZ1huOHR4?=
 =?utf-8?B?ekRBb3JEMC9qK3N3cFErV1ArMW9od2M0Y3pLYmcxaFNsS2lLMUg4Vm1lMlQz?=
 =?utf-8?Q?pSfIeKAGqdGZbj5iuiuZu3g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d516091-1b97-4447-62f5-08d9e2532666
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:41:40.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6kcfXzJHH3u6rx62nBshr3UFcasZQc/Dyomltqu5Kx7/Nyqc7vfu3IJYt7bODsdFuX0i4VgNKMS09NTApBC6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8172

On 28.01.2022 12:32, Anthony PERARD wrote:
> On Thu, Jan 27, 2022 at 04:50:32PM +0100, Jan Beulich wrote:
>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -285,6 +285,16 @@ CFLAGS += -flto
>>>  LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
>>>  endif
>>>  
>>> +# Note that link order matters!
>>
>> Merely as a remark: I wonder how applicable that comment is anymore.
>> If anything I'd expect it to be relevant to $(TARGET_SUBARCH)/head.o
>> (Arm) and boot/built_in.o (x86), neither of which get named here.
> 
> Indeed, the order here probably doesn't matter. I tried to build on x86
> with the list reversed (so still leaving boot/ first) and the build
> works. I didn't try to boot it.

It's quite unlikely for the order to matter at build time. Being able
to boot the result is the minimum. Even then you can't be sure you
merely avoided the problematic piece of code on the particular
hardware you did the test on. Perhaps the most fragile parts are
sections holding pointers which get processed in the order the linker
put them. E.g. unexpected interdependencies between initcalls.

> Maybe it's time to retire the comment?

Probably, but Arm folks would want to confirm that's fine on their side
as well.

Jan


