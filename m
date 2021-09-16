Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2040D353
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188103.337165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQl2f-0000bq-CJ; Thu, 16 Sep 2021 06:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188103.337165; Thu, 16 Sep 2021 06:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQl2f-0000ZD-81; Thu, 16 Sep 2021 06:38:41 +0000
Received: by outflank-mailman (input) for mailman id 188103;
 Thu, 16 Sep 2021 06:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQl2d-0000Z7-NR
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:38:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b90cbb76-16b8-11ec-b5a9-12813bfff9fa;
 Thu, 16 Sep 2021 06:38:38 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-ExB47IRgOD6NGSJPMzNQXg-1; Thu, 16 Sep 2021 08:38:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 06:38:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 06:38:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 06:38:33 +0000
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
X-Inumbo-ID: b90cbb76-16b8-11ec-b5a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631774317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJv9z/VlZXMdQt4wLVBVf1OgyUJJ2fFb2mp4WuvxNrc=;
	b=XlJSETDkJBib7e1zJ/yP6+aSAiufZ/+6KNpmQ0uxFHnpHnyIphFedxSl3UuCIgIscbDNIx
	4B4aXhoPRtx9Y667p/kFQZKnoCpDcUd2EzIAZfe6D+Vnvl8Frqjbwfbq92Pysj8O7ZoszT
	4rlT0WDUE1hm1CQ42w1Nm1nZezFbybo=
X-MC-Unique: ExB47IRgOD6NGSJPMzNQXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gd0SIERTX2UNQfzcvykVr1NRNb3sO0+wAh2XqHW0MjZkiza3a6ebM/LPRaqnVlAhGevHpJHLGWBqLhdivWKgWI6ZGYoJSmTQ+YET5B8GnZC9/NpD5lrHmSrTomGr1qopu3KqIjhbiijo5wqR5H8OXSDBH0QpRzSufvfbtGRKjHBba72wvmNhwcC5wCZIS6rYoBID9boOikgLa6AconRYdFB6CYYrTF5hFP8WHq1JrEPqqsLFBRjCg5eRjuv/ea5ZvHrSoZHap1EIUDE3Y7f7JpP1h6L7Ra96XPuGQJsg/7PUuRLQR6LqKdIxTdC4YzfL5VWGYQx1vPaKRino6BMQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AJv9z/VlZXMdQt4wLVBVf1OgyUJJ2fFb2mp4WuvxNrc=;
 b=Ud0+EzfGLKLym4JkLqMJnQQKtUXniDtWBt81RQkg0yPDTfBa3orSpiEe23IF3Dkb1a0iBJwEGyWSXoZuNLe73qAYQghkJPAOIz761tgNocf3bCpMhNOMGGEcN85EsU5+b2Omsao5xAgcg21p5EkcFmnwCzjmx7iZEz2oKq/yitQtkzGBTtLpuslMaLlGWDFRmIdoqWumQMTx9Lwd0zjpAkAb335VhhfJlB8T550ktoJiQ/eEaMNKQOZr391PT+NQyoRTMy0LfX3m6uCYSvGjlww0Z+ZlnGwKLUUgx92xa1UOoX8fZDO6O9+QNyEw77/YwLovNudawoI977HcjYmidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH V2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631652245-30746-1-git-send-email-olekstysh@gmail.com>
 <b6744333-4d43-ef24-0f9b-b5cd54680660@suse.com>
 <86cdc577-7085-48cd-c417-85b20afc9bf1@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <647bccf5-1d1e-1f21-fb7c-c338bc5119b6@suse.com>
Date: Thu, 16 Sep 2021 08:38:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <86cdc577-7085-48cd-c417-85b20afc9bf1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 809f3c5a-f78d-4e9b-07fe-08d978dc9b41
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB28292039D56CDF06A0089A7CB3DC9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CeCQJfFlHAZvnAstDxGdvSUU+FokA3PO6t+/GEGiFPkNlC3yWtViHHexejbrBAv20UJQzk5y3Eo/7/NanoTOn6Eb0+2i1qu/zRs+uMGY11Efb1wKutuBNNmRAB+YAIcCo/u7NenyeVuWbtoxf36/zGWr/mCRP2/A3Hzcepihw8yWL0opXgYHoA/OxLd3lyUawn6OYQAw75W8fpTwIzby2yqdiHOpm8YDc6A7zuLWnc5fQBfbIEyLuhD2o1X931q6jPF4hYWK72zeV8kDDjTrA6gfY4hGDFHZbU4f43WHYQOLgKIsB/0BfSoO1Pk92V6OVmY6OP7sHdX2D6SOnRzLDKjqGMVPRWv0VNP6oEYnbsIeayRoKTo2c0kiBMzIiIlL6Y/Qu/ZlIcMJ2b442gfo1+0OfEZT+EPFW9iveM6wogkoybAJRBh92McTSkTp2CLOyIP+sxQYdE1qhXCU137rsH4yMb12P35z1LdkFWFwwdKtMdB3WaRyf2XEw3JsxLD/L1p2sACmx0ywR7bHvZvy+SCJgl7TO4MLfJHVr8Zr8LzN9sOP5/0oJdpWK8XKeFmJ3Sr07sNdc8wiuQ2cXwCeYIKG/Bog3A2GxxC37b8v5e/y3V1Iq8o+4/itZGJjYs9Lr6UsZ9WvOqvVKgyhUiHr60a/0xlnOpgcnD3m+FLJDRugU736NS9mrOQglLbV1fD2UvRYrN6e7IJQuRs968XvpHWL1AIF83NL8kr3hblfBFqWMwKpoteTabEydsjG73LA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(956004)(53546011)(6916009)(26005)(2616005)(66476007)(31686004)(66556008)(5660300002)(66946007)(86362001)(31696002)(186003)(36756003)(8676002)(83380400001)(4326008)(2906002)(8936002)(478600001)(7416002)(16576012)(316002)(54906003)(38100700002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEVIMEUxUGNyblA2dktoUVdmRjVvaDZSZHczdWt0My80ZVFqVDkwY2ppaHVh?=
 =?utf-8?B?NnRWRTNSR3dFY0xSNlpNMmE0eHNsUVpwMkxONm93VXd1eU5iTllNZG9aZ2NU?=
 =?utf-8?B?cXRncHRVaW9zNVUwbngvTkJEUnV1SUtLQ2RaNk81WGJyVXhzd2N2dDFWcFhK?=
 =?utf-8?B?MFpBM0lveHFXekc3TGFES0phdUFWSHJZSzErZlF0RmExVEN2ZlRpTnRhQXBD?=
 =?utf-8?B?c1RlbExtOUtoV21uTHpTTU84TEIrdzltaCt6WWZrOXpYcWFZeTdURWZiRnY4?=
 =?utf-8?B?MlprcWNtYkY0V0h1a09IOHRRQkpXRGhoY2ovT3hFQThUODZhcUJHaDJpTXYy?=
 =?utf-8?B?OTQwQVBMbEhWa0VBc1FvejlFWFBLU0xFV1hZMmpFN0hnUjJJSEZhVm1BY0VH?=
 =?utf-8?B?YjlOQjVudWxFM1F5d240cm9PVTBSUVYxbUhGMGtYc0labVpVOGFkcXVCSytp?=
 =?utf-8?B?WWpDNStrVGhhWldtZ3FSVTBCRmFzU0ZXYVEvWlRSWTNoSDM1NENHamp1bzlx?=
 =?utf-8?B?ZUtpZFRjRitmRkVZRFd6V0tlTlcyQXpyd0dpMG1QdWtVc2dtVmNHbldDa3la?=
 =?utf-8?B?WnRpZDBuZlVYYVgyNVkrRE5lZTkxRlVCK1ZLQWNDZGFYVjFDTXAzT0dkVCtu?=
 =?utf-8?B?cXM4aXNNRXRMUDJPSFlyamF4T1dtc3ZOb1gxVm9iZHhaeGs0eStneFJMWUZC?=
 =?utf-8?B?eW1yYXg5Z0xEaVplY3RkRnJVbW9UOFUyVFF4QzhHUTdVVUh2TVF0cGxFS2Rq?=
 =?utf-8?B?ZVZCZmhaMnlJOUp5L2dGSlNPMlQ3c1pZcHJ5d0d5WHkxUFJQTHdIaG5kV1Rp?=
 =?utf-8?B?ak5yY3IvaWF2Z1oraFFibSt4TEhhQ1Z0NlU3dTBFa2tQUGFGVUp5clpEWG5X?=
 =?utf-8?B?T29EdWVxZzc5eFAwUlg4b1JtTHl3dXZHc2tVS29rY1JvWkRPNmRHeGFQT21S?=
 =?utf-8?B?a0dHYTdnQTdETzA1TStUdUY5bmMxYXBkRzlNWS9VSko4T2hnWFFRS1d5VDZr?=
 =?utf-8?B?bEFVdmp0cDVFNS9TbXVFY1phb3BIQkx5OGRMeStKSXRoK2hTZHVmZEdqRnlC?=
 =?utf-8?B?YkRpM1pxcEl3QzAwMWVyVTd3SVZkUk1XQjAzTUtSTWpwR0tJaWJzeHlwbHpP?=
 =?utf-8?B?cG1EQkZxZ1U1MXlsNE45OWM1Y1I5d2Y5VUhBclVWbGFqRTVPeGZwakpEWm1k?=
 =?utf-8?B?MWUxV2FMRGszM0I2dkFBTENBeU0vQ3dabldCQzc0RmxMSGVlYXV5WGptbTIy?=
 =?utf-8?B?KzRVRDNhcnAxdGtUKzQ0b2JjbWJlS1Nsa2pxbmwxQ2M4MHVSbE9NYzVMTThG?=
 =?utf-8?B?d3hZTHFvZFUyM1RnbnF5aDN5Z0hVODZiaVh1a0pOaW1velVEa2VJbVpQU3Vx?=
 =?utf-8?B?WkpVZUkyT1Y2eVkrb2FvUktweHNYWWdEdVNzMzN5elVodTI3aWJqKzFZSFhu?=
 =?utf-8?B?eFNjTGVmMi9Ua2dqY1NvWVhaOURpbGJTRk9vSkZENW9LTXdpMVdIaW51VFJw?=
 =?utf-8?B?cXdkSStYa1BRS3EzcW1raGR6SDI0VHNCeUZPYzhxMEpaMTJYWkY3N3dlLzla?=
 =?utf-8?B?c3p0ZDZVY3JiUDVEMklIUnY4YVZkMXJCa3NSS1BzYnpsT3lQU0dhZXVyeG9o?=
 =?utf-8?B?QnlWNTNWeXZvUGc5WERyZXdGRnArbjBwZnJLeFNyVTB1YldZTTU3UldENFVY?=
 =?utf-8?B?MHZCMFJjM3pFejdUdjV0V0ttV0lNMExGTXRRelNYNmkyQS9jK21BTzBSVXVl?=
 =?utf-8?Q?b8b7504qo1wJxmX0dAlsfNy5BjyqxgmPyqIF2mC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809f3c5a-f78d-4e9b-07fe-08d978dc9b41
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:38:34.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpPn9OUjF/IxjlfPflknBERwcOR0b3SO0UyL2fLUFV/3vVRfKiAXLs+y/auZ7Ir8/u88MnDLSHglZBAE2VUX+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 16.09.2021 00:13, Oleksandr wrote:
> On 15.09.21 13:06, Jan Beulich wrote:
>> On 14.09.2021 22:44, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/asm-arm/mm.h
>>> +++ b/xen/include/asm-arm/mm.h
>>> @@ -98,9 +98,18 @@ struct page_info
>>>   #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>>>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>>>   
>>> - /* Count of uses of this frame as its current type. */
>>> -#define PGT_count_width   PG_shift(2)
>>> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>>> + /* 3-bit count of uses of this frame as its current type. */
>>> +#define PGT_count_base    PG_shift(4)
>>> +#define PGT_count_mask    PG_mask(7, 4)
>>> +
>>> +/*
>>> + * Stored in bits [27:0] or [59:0] GFN if page is used for grant table frame.
>> I don't know enough Arm details to tell whether this is properly
>> one bit more than the maximum number of physical address bits.
>> Without the extra bit you wouldn't be able to tell apart a
>> guest specified GFN matching the value of PGT_INVALID_FRAME_GFN
>> from an entry which was set from INVALID_GFN.
> Really good point.
> 
> 1. On Arm64 the p2m_ipa_bits could (theoretically) be 64-bit which, I 
> assume, corresponds to the maximum guest physical address (1 << 64) - 1 
> = 0xFFFFFFFFFFFFFFFF.
> To store that GFN we need 52-bit. But, we provide 60-bit field which is 
> more than enough, I think. Practically, the maximum supported 
> p2m_ipa_bits is 48-bit, so the maximum supported GFN will occupy 36-bit 
> only. Everything is ok here.
> 2. On Arm32 the p2m_ipa_bits is 40-bit which, I assume, corresponds to 
> the maximum guest physical address (1 << 40) - 1 = 0xFFFFFFFFFF. To 
> store that GFN we need 28-bit. If I did the calculation correctly, what 
> we have on Arm32 is that PGT_INVALID_FRAME_GFN == maximum guest physical 
> address and it looks like we need and extra bit on Arm32. Do you think 
> we need to borrow one more bit from the count portion to stay on the 
> safe side?

I think so, unless there are further restrictions on the GFN range
that I'm unaware of.

For 64-bit, if you only need 52 bits, why do you make the field 60
bits wide? I'd recommend against "wasting" bits. Better keep the
count field as wide as possible.

>>> + * This only valid for the xenheap pages.
>>> + */
>>> +#define PGT_gfn_width     PG_shift(4)
>>> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
>> Any reason you don't use PG_mask() here? Any open-coding is prone
>> to people later making mistakes.
> I failed to come up with idea how to do that without #ifdef. As GFN 
> starts at bit 0 different first parameter would be needed for PG_mask on 
> 32-bit and 64-bit systems.
> I wonder whether PGC_count_mask/PGT_count_mask are open-coded on Arm/x86 
> because of the same reason.

Hmm, that pre-existing open-coding isn't nice, but is perhaps a
good enough reason to keep what you have. (Personally I wouldn't
be afraid of adding an #ifdef here, but I realize views there may
differ.)

Jan


