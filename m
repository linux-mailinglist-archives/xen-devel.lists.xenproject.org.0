Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940434E2DB7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 17:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293083.497819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKkW-0003Yv-8o; Mon, 21 Mar 2022 16:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293083.497819; Mon, 21 Mar 2022 16:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKkW-0003WH-5q; Mon, 21 Mar 2022 16:19:16 +0000
Received: by outflank-mailman (input) for mailman id 293083;
 Mon, 21 Mar 2022 16:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nWKkV-0003WB-0A
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 16:19:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5465fd1-a932-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 17:19:13 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-cPj2GulUMBq1FF9povVZBw-1; Mon, 21 Mar 2022 17:19:11 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR0401MB2657.eurprd04.prod.outlook.com (2603:10a6:203:38::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 16:19:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 16:19:09 +0000
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
X-Inumbo-ID: a5465fd1-a932-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647879552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vF7+RCWQUPMXYp8VIDvk20+YCKQ76QYZ1wcXRGnK1uc=;
	b=SRQyCS1ziDno/74TbPE4XFM/d3t78NPbCBdnmZGvEjzzkZ2yWCTTT6VrzFOsga45cwjgch
	530GQvQqCGJ5huRsMgiR4e75NUsENIZpAJHt4UVs8fe+Z52W8ip0RVKxnBKXaY2ewK4RFx
	DHyPWXmak8h2/r/nXYXas+IW5MvoAEk=
X-MC-Unique: cPj2GulUMBq1FF9povVZBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRg6OgfztXekEV1rUyP4vFU97XdZuLID/dBCi14Go5XTu5WaMVbCuuvguU21TpboDht9hn+nCS+e2rP7ccx+m6qhzHm6e/qqJmUD6O17AYkjEQIpWkZynbEHwI9iWk+iZ1mgf31sVBYMv/ns01Pyv2YCnmAFXBg/mzuTRldRodHWTPNGVi5ffJNMYxhDOvviiD5PmxU8ZVfP0/Jz5VRiGhT2mkF6QYXii0l+i1F7/ZKN/3iNQlKqXG6yJPEaPw5fcMgRp8lzEKDz00m4WzpJNFl52aQKOPjbz4kqeIgblvnjjlc2bxFRZZEFhYPIIvlEsuyl9NgkltWEQXHtubJOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF7+RCWQUPMXYp8VIDvk20+YCKQ76QYZ1wcXRGnK1uc=;
 b=C94FGcGPQQTzu5KDX0PR5ZlUdiy4UiH78LBEo3ixAYLheQQ+xHEp7Qk0EYWMs/ZR/sKs8BkvJwC2CXRCm4zA0/KQ/bAeAdXsn7ert3RTOlh8xeiqtqWpslK4OG2EnPkRpjxLE8HmYF+/QFy1ePvgyPXU1AQRqRwglg8XpkOB7t6mU76MJ2yoRtVHyp6WChRJ2REYszSZZmpp7Koc+ZY0yBH8h0twWOI2QHNuaBCw8rEt1lIZB76ZOr0b9efcdjT8sxWT4ErlYEkwniQJCr3qL47xl3pMwPP9GJ4xkJIMF9KY3amdlwAxsHCZMf6Bq6V23cRHo/j/yPt2PZ5YqqUz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ef7dd73-ea16-67a1-2710-14cbfcae0d0f@suse.com>
Date: Mon, 21 Mar 2022 17:19:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86/vmx: save guest non-register state in hvm_hw_cpu
Content-Language: en-US
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <e79bd13acfd73c105ee1399295c99cec153258c2.1647532323.git.tamas.lengyel@intel.com>
 <ca8f13e5-5e3e-e64f-2711-4730883a24fc@suse.com>
 <CABfawhn3-zRJ+m9nJsOGBL=8gkVmzOyE_ttuWJcSLd4UseLzXQ@mail.gmail.com>
 <dc3cc4f9-e1ba-b73e-9527-7a3a85043505@suse.com>
 <CABfawhmqZS5_gjpUxye2LvzcpS93Oj2U0-gsNfMBXjt3dLxrKQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmqZS5_gjpUxye2LvzcpS93Oj2U0-gsNfMBXjt3dLxrKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::36) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 509367e8-9271-4774-d9c4-08da0b56877e
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2657:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB265783E56F23E82DA1268DF6B3169@AM5PR0401MB2657.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oEQBO5STpjcwczvlaG3sY2ZpmYhudEGoU3JHBBKyZMT0GHqYVlbDHS1l4pOxg5W0PIHbk1VznXdXYPWHwPsYQY4y0c+7f2dP3eqVwXT2t3ci7iNECYdW4jHYZX8/+Y5Og42DopOSyo6GGG9izA3qcIAZvDLv0HLtrGA+IaIOulQyKhVQOqhEkCsJBhK8g8t5uHP/oeXchcZuN0861eV5asOshwFiZfk4FCGssT2iDpPYguo3VcrpEsO8EpckNLA3izd7+jrJCCRtZY5LMWmvfmFE0F9+oUX7shAhyALIoyrgRbQBTkN+9r/WX30eCWv0iEUI/0we9awEbkBUfEo1W9hGUSdhEJ4dqXpT82Lo/gyF/6QmQa4+HpodV25n9WGqHc1eIDM+ejkXl9NKd9unEQHVPUjA+7Vt99iKZGSHm7bYd+JaAiAaT6eBSSm5iSzLL6dpPv74wDH/rPsVseL6azu+IDurdKJs9fgTalA04k9UZ/5+Acpe3UNSmlJDldz0t/tdE4Vj4DiCfJ1Crn8K810RiiXQTcQU5ZBBdy9DKjl4FZUyRnTeqTnt681/9LSzh9GmcVuS0WPY0ZMp36utHxOMC1TpC0SSjcbCJlgfIFbXZugrGKEK0HbFjMJA9sjrXDARDsGAJOAhQTbwXPhmITOuooRbeKplJCAPZUUxIK77+Cif9qNLUCAi6uqYf+fpx/fBsQrif1QgeAlBGDpOfMSUOev/eSTufo/vnlDaAX1wZetjm/OA8WjOsbLog6sZvcgLjCdZtQuFSQkSbCK+fwNEHrK6vu5G4d22XGJfp8AcLVWabUeb1NBjaZuD7PlO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(36756003)(6506007)(8676002)(54906003)(6916009)(316002)(31686004)(53546011)(6486002)(31696002)(5660300002)(66556008)(2616005)(508600001)(8936002)(186003)(83380400001)(26005)(86362001)(66946007)(4326008)(66476007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUgzaUtiQWV2cGdLMU1QbFA0SktqRUJmL0dCUjNBMXM3MEdiMXFrTkVjQ3ZV?=
 =?utf-8?B?VjQ2ZHVrMkhNQkpNVUtDWDRQSGhFQXNYNWtxSUhoU3JhbEFxMTBod2pwbEdh?=
 =?utf-8?B?SWNqRlVlY2FSYkgrUUxRbXlFdWxkMmxNRVBVemwvWkhFdE9EZ3Eyd01CNlY5?=
 =?utf-8?B?dnZhd0VVKzBUc3o1cVlacFU3T0UyVUZsWnE3VnFNZzVPYUY4djBBZlVjNXVs?=
 =?utf-8?B?ZUF6Y1pXQmlZcktCMzMyWnc1N2pqNHlBRzZOakxHOGF4NUNXM05PVHA3Yk1z?=
 =?utf-8?B?RnBZQVhpWS93eXVYdWo2K1hES0N3aFljdmdNb1dtY3laV3V2ZGRwdHFEZTdr?=
 =?utf-8?B?S3NHUlkvWStjK0xRSWRNVXBEdmtxSjVRaGJYVk1aSkNOekFleEdOTVkyMk9k?=
 =?utf-8?B?UEUvMG5XaGNyRzZ4dVhYSFU5ZEdqakNrR2VLUVQ1RXNGSSthdUp5K0Z1Q25Z?=
 =?utf-8?B?OTlOYkJVL2RJYXVMWjJFQmU3UFZqLy9kNEVVVlAybXlnbWZGei9OMnlhalJN?=
 =?utf-8?B?OGdZVXBRUi80MDdIWk5oY01uUHdmeHlPWmYxTGZVc3lZdms5bzc5eWF0K0RD?=
 =?utf-8?B?M1FOREFPdWVSbFA0dmFtODA1NVpmNjdiazJKS0UyaERQVUtpNEpwcEM5VUlx?=
 =?utf-8?B?S3ZRNEdZV205WGJNd1dwL0NwNkxLaFE0Wmp1SUpYMFlvb2Z5Q2JVZzFKeTNJ?=
 =?utf-8?B?dk9jUTdMQVRhRHY4MnA4c0h2ZE5sTkZCNmNnMXN4WkFGQUx2dHJOVU1NY2xR?=
 =?utf-8?B?K0d4N3J1T2Q5dWhZSTA0cVlUQVowQVhoa1lMZWx3NUFWNFpoWDd3YXF4WHp2?=
 =?utf-8?B?YSsvRWpFYkViRkk2YUJ0UFBhYTRZWnpIQnE1Znh4V3k1WDNpeFJsWFRVTS85?=
 =?utf-8?B?d0VIdUF0UFIreGhpWG1yVnhDN251ZVE5OWtuNFZpQ3loaGlTVmhLcVpodkYx?=
 =?utf-8?B?TlkvVzllbko2N1dFc0swbjVUSVBzMlIwaHdUMVhCNTN0U2Z6NE5qNE42bXcy?=
 =?utf-8?B?QmtnSmJoTm9vNmJ3ZG82TDFNTFJOQld4WWZqZ1RqMkx3Z1llK3YxQ1RJRzhs?=
 =?utf-8?B?TldBbkg1dlR1SU5NSll4SlNjRHkwSU0xWGdDZ2RmZEh5ajlpRHByMVEvTzds?=
 =?utf-8?B?ZVgzZkQ4Z1dSdkxLT3NHTVdtLzhGWFRvdlhIQWxydXNzdEVWTVBhSlVOWmE2?=
 =?utf-8?B?QzdjNkU5SW9ERkcwQnFnUXorelpSaDBNUUdha2tOUkw2WS9uVmVoSjAzbU1C?=
 =?utf-8?B?TmM0RWdtMDhsbDZ5VjJTcmVZYlhGanZTUThWL0xYTXR5U0pXUldKUWhOS3Np?=
 =?utf-8?B?cFlOK2h6ajhEOXl6M0MvaS9ublRjUWNPVXVzMWc0c1ZYc05FNUsrd0MramtW?=
 =?utf-8?B?OTZUL0pMRjgyR2t4SG9JOVVBOWpzYW9NUERJVlRkTDRYa0dVb1NTdTMyRGlE?=
 =?utf-8?B?Rlp1N2ZnR080dHlaRmZSRWlHYWdCQXJFVzNYNGF1Wi9oVis4LzI0dzlKVURI?=
 =?utf-8?B?QnNSYldkVmNtT2swSXlEejFFU01MVDNHMVFXVzVTcEhsSFB2NnZRaHM3c2xt?=
 =?utf-8?B?Snh4ZXRBekMrRlF3dHVMQlhXOVhvVUlFOFlHTG40ZWFZNWl6SFRpd2wxeGRq?=
 =?utf-8?B?KzA0UlY2R0xnbHUyWDZiN1JJWEZWMVcwRUJWNmJ0cHduTEZkY3lOYmN2WXRI?=
 =?utf-8?B?UGJnNitPUDQxOGg3TUZzVlA3M1h3WWRoWHh0Rm1Hbk1uS1ZORnloSm5paTMr?=
 =?utf-8?B?NTB2aDQzK1o4ODQ0WEl2S3hkb25jdGpxQjQ5MEdkMkNNWjBFeThKdWFiSjhE?=
 =?utf-8?B?WTFadVBTcTBGd3Y1Q3lsbUhkZnl5azg4T0VtV1V2M2VjZE1HWXc5M25GRFMy?=
 =?utf-8?B?RXk4Mjd6RDBJNUFFR2FqVG1Fa3I0RzFPSUdHcUp6K0FuL2QwTjhsWXpyRHlF?=
 =?utf-8?Q?45q76igN1wwj4JZ7rB8TpVFZw8W+klT0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509367e8-9271-4774-d9c4-08da0b56877e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 16:19:09.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h62B6kRgkue8ExLYETTKR0lTSo6gW2wD+6fdpgkTqshWQhU+tZXDH/wx+I9JPGMrTaHG/CDaxl+M4kHkfGJ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2657

On 21.03.2022 16:28, Tamas K Lengyel wrote:
> On Mon, Mar 21, 2022 at 10:58 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 21.03.2022 15:39, Tamas K Lengyel wrote:
>>> On Mon, Mar 21, 2022 at 8:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 17.03.2022 16:57, Tamas K Lengyel wrote:
>>>>> @@ -166,6 +167,11 @@ struct hvm_hw_cpu {
>>>>>  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
>>>>>      uint32_t flags;
>>>>>      uint32_t pad0;
>>>>> +
>>>>> +    /* non-register state */
>>>>> +    uint32_t activity_state;
>>>>> +    uint32_t interruptibility_state;
>>>>> +    uint64_t pending_dbg;
>>>>>  };
>>>>
>>>> ... these fields now represent vendor state in a supposedly vendor
>>>> independent structure. Besides my wish to see this represented in
>>>> field naming (thus at least making provisions for SVM to gain
>>>> similar support; perhaps easiest would be to include these in a
>>>> sub-structure with a field name of "vmx"), I wonder in how far cross-
>>>> vendor migration was taken into consideration. As long as the fields
>>>> are zero / ignored, things wouldn't be worse than before your
>>>> change, but I think it wants spelling out that the SVM counterpart(s)
>>>> may not be added by way of making a VMX/SVM union.
>>>
>>> I wasn't aware cross-vendor migration is even a thing.
>>
>> It used to be a thing long ago; it may not work right now for no-one
>> testing it.
>>
>>> But adding a
>>> vmx sub-structure seems to me a workable route, we would perhaps just
>>> need an extra field that specifies where the fields were taken
>>> (vmx/svm) and ignore them if the place where the restore is taking
>>> place doesn't match where the save happened. That would be equivalent
>>> to how migration works today. Thoughts?
>>
>> I don't think such a field is needed, at least not right away, as
>> long as the respectively other vendor's fields are left zero when
>> storing the data. These fields being zero matches current behavior
>> of not communicating the values at all. A separate flag might be
>> needed if the receiving side would want to "emulate" settings from
>> incoming values from the respectively other vendor. Yet even then
>> only one of the two sets of fields could potentially be non-zero
>> (both being non-zero is an error imo); both fields being zero
>> would be compatible both ways. Hence it would be possible to
>> determine the source vendor without an extra field even then, I
>> would think.
>>
>> A separate flag would of course be needed if we meant to overlay
>> the vendors' data in a union. But as per my earlier reply I think
>> we're better off not using a union in this case.
> 
> Right, both structs being non-zero at the same time wouldn't make
> sense and would indicate corruption of the hvm save file. But I think
> the same would easily be achieved by defining a bit on the flags and
> then a union. If two vendor bits are set that would indicate an error
> without taking up the same with two separate structs. This is what I
> have right now and IMHO it looks good
> (https://xenbits.xen.org/gitweb/?p=people/tklengyel/xen.git;a=commitdiff;h=84f15b2e1bef6c901bbdf29a07c7904cb365c0b2):

Yeah, why not. With the separate flag all should be fine.

Jan

> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -52,6 +52,7 @@ DECLARE_HVM_SAVE_TYPE(HEADER, 1, struct hvm_save_header);
>   * Compat:
>   *     - Pre-3.4 didn't have msr_tsc_aux
>   *     - Pre-4.7 didn't have fpu_initialised
> + *     - Pre-4.17 didn't have non-register state
>   */
> 
>  struct hvm_hw_cpu {
> @@ -163,9 +164,21 @@ struct hvm_hw_cpu {
>      uint32_t error_code;
> 
>  #define _XEN_X86_FPU_INITIALISED        0
> +#define _XEN_X86_VMX                    1
>  #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
> +#define XEN_X86_VMX                     (1U<<_XEN_X86_VMX)
>      uint32_t flags;
>      uint32_t pad0;
> +
> +    /* non-register state */
> +    union {
> +        /* if flags & XEN_X86_VMX */
> +        struct {
> +            uint32_t activity_state;
> +            uint32_t interruptibility_info;
> +            uint64_t pending_dbg;
> +        } vmx;
> +    };
>  };
> 
> Tamas
> 


