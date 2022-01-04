Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C315483E21
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 09:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253031.433992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fEV-0006Se-7R; Tue, 04 Jan 2022 08:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253031.433992; Tue, 04 Jan 2022 08:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4fEV-0006Px-4F; Tue, 04 Jan 2022 08:31:51 +0000
Received: by outflank-mailman (input) for mailman id 253031;
 Tue, 04 Jan 2022 08:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4fET-0006Pr-VG
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 08:31:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c21e746c-6d38-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 09:31:48 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-TEf8alQgM6ee0GIhZm1-Vw-1; Tue, 04 Jan 2022 09:31:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 08:31:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 08:31:44 +0000
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
X-Inumbo-ID: c21e746c-6d38-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641285108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2Hs7vGS8M62r1tacuWdnx0iqLb/qJoiJOWB9d0VRTo=;
	b=LAs9UOulBKF8fWgGPGn0abRlx8f7HS+cFulpYyyUUnzKSSsvq3Smm+kRBBT/VKUkCsLUa0
	VHN/Am7kmVYG6cttFaar8wPz3+AB4FOG54CrfFtfn1VG5udEzJpLCIkM4vKih4uW1RZoEI
	/hw57tiXQNC4kBdZulOI41LVn8HPikw=
X-MC-Unique: TEf8alQgM6ee0GIhZm1-Vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bndv9oHvzPondHhyACNy5gt7B1JdCiayip94jKNmdT8T/sn66of4XT1xu0FxyeugtRvhEm6VemsKGQxFaACGtnlAuVyy0UtEFyHgJG3dZZUWVArod7qtmhd89D8OM/i5JLV0ii2YCNC5+V14b0EWPOhOtnea+oDePV17KGScb1ww/+5jgBBawxzMSLmF/rOvXNtuVoz1a8/Tl22zxbesXyD98IVPyMTUq8JEb4rXPSQ7f6FBkqg/PkFrOiDEnSX1rdjUmoTR8DqFGXaXUrzIgDSpRQdy/+IYndCY8quHL2iJKTseJF3GCBjhm0BVAPNtzhgV0vOGvlFj7aeIqR/SEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2Hs7vGS8M62r1tacuWdnx0iqLb/qJoiJOWB9d0VRTo=;
 b=gaY5vyCOBg3t2c+I2+QERYSicQC1bAdqRPVID+1MOEsgqFFNUnF1pbJNF9uyMbJUFd/ul+U2cl8HF3xmb2Ms3XGg2+PZB/w9nGTjvc7PbjzHn39DLy0zTSX9d254gZ+SU+otOQtV+FH98nUBpdPRf7GvugbquYYtW3Cjn+LmnEtrEMkYRoB71an9TWBe22YrKO4Mzj4pLqzkREVub0ktSbqvb0fNInFiabHHOUqTzZtWMdgQsSXSrDyczVwiryeRsItJt65RKOLp1j6ZRr010kKP5fu7nPq94lphbF+mbvio+/IMkx/CGJuQs8a29Yex4QwsXy+Q3Ivmdp89iNzRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88222883-8e69-18be-0c88-7eccccccc191@suse.com>
Date: Tue, 4 Jan 2022 09:31:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksandr <olekstysh@gmail.com>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
 <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
 <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a12e4d-0848-45d9-b647-08d9cf5ca430
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6381000F74451E90DBAB7247B34A9@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zu35MeT7Z6NT2aVAgbwZj818l/ghBCbnTjpiUU4yrfsR8nttrJkfTzZCAaUAsb3dlclPgNKpHVLbp6auptoFE4whsV1Y9xjFl5UdDT9GT/GAtFNyXtS5IYaodWcBWZg98GoFZ6ThWRh2fMQiw9qpD5s5RGkC71LlYC5huL46NI+6HzjebHKmXUElerUfBW11UWLupccAB/KQ1QKCwaKE7UkU5V77ndJMWKAIcdhiMKgeqjlFMqlY7qOI2FmHHViJlWMMWjGQy5de0chbSDqFFTmXjgV2prqM9bwZjYXZjv7ZN42z6npQovRg+Xd4Sbf+ry1gKP4G9GpMtLQg3fP6b78GrwSEiVBY6O82tOgcUyPmZo+mIqsz8bD0nHlEV9OS2dSAlLJ5gM0SlmOsIiAR2+JPvJJwRBkDlfdUCsXGFF90DRTj3eKa/GAmeKIy22BNbPqC7Ll8Oe04soOgnA00e1WfxgKPXgC4Bhdh7m8xskLtuqMbfq4ISYX/NLLMYt7wv+cpmM2qk2f8qF+5q/32BDHl1LHow5wzfPqg68dnOr1/CNkYWAhM8Mvv5oZ/6vURXNSAQsSDAUVsIkJdTAOY+dBesunX2RBCN3+EedApfDe1mSSfpeZKHaOeGirnUPfLk7h7OdGUzN3aNcolpDFaiGnpkpesTlB+8vtGl6XniM4136ajwpMmU6p5wiNURNmbmZKxeAbT+IQCXdAKU3fJSDRSyLwX2jugLyfyecx4yfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(54906003)(53546011)(2616005)(6916009)(186003)(8676002)(6506007)(4326008)(38100700002)(66556008)(66476007)(66946007)(6486002)(6512007)(2906002)(31686004)(316002)(5660300002)(7416002)(508600001)(83380400001)(6666004)(86362001)(8936002)(31696002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkFqME03eDI3dVlJNGhUcU10ZkJXR0cxYllTNVc5b0tNR3J6UWt4dTEwWUQ2?=
 =?utf-8?B?dXdNRnBLcGJ0TFdZZ3ZqM0tTWTY2UENWZ05zaTFBSnFzaWVrcUI5cDlLbG9Y?=
 =?utf-8?B?elVhdDFFVytCYzIwL1J4L3EzK2JMNzl0SGVaT0V3N2dkVm8vQ3FNVXZocTFt?=
 =?utf-8?B?SS9jZWZpT1h6RkdpLzVPZmlYSjlPRjdDVjZ6WHQxSXBFSXlCZmVyRzNqUlYw?=
 =?utf-8?B?MFdCc05PaHRXTnJSNW12aDVpSEZwSThEYjlDTUhOZXd0Mm8xb3BvaEJTRjQ1?=
 =?utf-8?B?LzFZbGhmTzQ2N0t6WEZMT2tDUHE1dktUMGJRMzFSUXV3YWhlMlEyeEVwcDJp?=
 =?utf-8?B?NGN1OW12QjUrRnZkdG1LdXJySHpKdTZvTEgvVXZMUmJEa0RCdmhOcENtTkpM?=
 =?utf-8?B?a1hRR28zTXVuc0JxMEFieGdEaU0rRE4zNGlpaitPSnNramtMRmg5MGtiL3hq?=
 =?utf-8?B?QWRWMmM3eDlyRjgxbzI3ajBQVDdGV1FieGZ3WEswWEtkdm1hSlVPb0IyRGhD?=
 =?utf-8?B?K29xaXJXYWpCTGlsN3MrS2V0aytuMkZDd0FtOHZmZWlQUDFodDNYU3Z1Y09Q?=
 =?utf-8?B?cUhFZ1UvTGdyb21rc1VyMGo5MmY1NUVaWmhaclBkRjMrNmRBOTNnTXphbmZD?=
 =?utf-8?B?Vjhqa0M2QzFNMlJpWHFZWk91dHBlTFpwZ2U0V1hqNFpXVHZsbGYrVGNYbFk4?=
 =?utf-8?B?WG1UMGV1eERpTHJFdjMvRk9KVTRDcGlidS92UjI1Yzc5cEt3akl2MUZzeXEr?=
 =?utf-8?B?Tm9lV0V2b2dQL2pycVlLK05tWWw0c1VOeVFsQU1JWTdMcEZZN0RHMzVxMmVl?=
 =?utf-8?B?RjBFbGpsMjJ5aWlWRmIzMVUzdFpES2lZYmQzNHY2UjVRdFdscVg0dWR4NFNV?=
 =?utf-8?B?MUNzZFFKUmlwNTNlV200cTh1SzRxd2MxakF3cnhrMG5BVnlXRmpPK3BVL3hZ?=
 =?utf-8?B?N0RXRitJaVd5OTM5QVJqTWhGQkt4K2lxSmU3dDEvNllVRS85SWtzNlRDWUN5?=
 =?utf-8?B?a3BCbnpndkRZMi9DSUcwNVJQNWVCdFZURms4bnNqcmhOdmdGcjQzSjU0VzdI?=
 =?utf-8?B?RTZPWGR5cTcxZXJnQysyenYyNFA4NUtrNmo3WkFtcjZ0L082cFlDNENzQXNO?=
 =?utf-8?B?WkJYOVlYUlBpcllnd0cxU2pCQVV2Yi9qL3h0ckVyOGZGUVVSWkp6Z3ZBZFR3?=
 =?utf-8?B?eTJkcHVZdzUwWURmOTJ2eUpLeFdMMzNMYTVVU0FKQkgrV1hBSlM3NUhKU3g1?=
 =?utf-8?B?SzZsYVhBdDBXd01xekliZU9rTDRLZVNUWUR5b043aURXRktyRTBUcXBENzF4?=
 =?utf-8?B?NmhSRWpXbGcxSkVCQlRPelNpRHE4R09CODVtTk5lc2Y3dldKQkIxS0hiRVI3?=
 =?utf-8?B?WG9oczZnU1FvN053Njl2SVNFQ1B4akExcVV1WTJpbDhGNHloQStQcE5HVEtX?=
 =?utf-8?B?cUFzOHVYenFQMFdUZ0V5OFBmNXExQlVEK3NldG1jZXV6aVpjRDRnbVViRHIx?=
 =?utf-8?B?Unp3TFQ4Z0hmK2lLTE9jWlpVTDB3NjB0Y215aGswNDlMcDB0V3BDUW0wZGNs?=
 =?utf-8?B?ZVgyWjUrTEE4eWU1OTQyMmdLQ0FzYnI1MFpzczRBUHJwaWNKMXVrWTltcmNN?=
 =?utf-8?B?MEhhd0VXd1FXbmVRcUJodWlYMHhnWkdEYktIMHF5bE1XVlZNQ20yakZkK1RN?=
 =?utf-8?B?bVhRZmIvUDNPaTcvU3JFZ0dFZmxERWZoLzFlcGhOY2ladk9oQVdzcDh5QkNJ?=
 =?utf-8?B?cGtOcVp2Wnd4anlrcEYxdnRocFZNb1B6TkxXYnI3WE9ZRUgwNlJVTGdrZ0E3?=
 =?utf-8?B?V01zOUxXbVZqT0JiOHJHVmVhOW92ZUNla3JTSWJiV1p6TVBiUVozU0FoK1Rh?=
 =?utf-8?B?bXBQMktUbHlWeVpZeU43aVJMWUFoT0VlWmtQTUVXYU9LWlltc09tc2VXdzRo?=
 =?utf-8?B?OFo2QlRYOU4yejZNKzVzb2RyRTVuemJyZ3hQalNuWDU0ZzNtQXpUQnpEVjhE?=
 =?utf-8?B?MzY2Z0VtWFRDbHZBeXJXdjJzT3dkV216TFcyUjV1M1Z5UUhnMUR6MW1Zd1Y1?=
 =?utf-8?B?bmxheGlSUENIVEhBbmdEbDVrQnBXcDVqSko1dG9ldklMc1JpNTdHTUNoUUxV?=
 =?utf-8?B?T3FVOEc3eUl0UXJ5T0J4S2hLUi8yRUcwWDZaZXJTSGFoNmJkUHFKRzBpTHl5?=
 =?utf-8?Q?Se3ZDIUj6VVzdC5m+ETJva4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a12e4d-0848-45d9-b647-08d9cf5ca430
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 08:31:44.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /N9CGrG+YswgdEZbH2NlIUf4eUtmDKcIspf6PLngSqn61eqbrg1LUB1HNyf8HsyRJKwKeVkA4uioMrbxpfLBgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

On 22.12.2021 13:33, Julien Grall wrote:
> On 22/12/2021 13:05, Jan Beulich wrote:
>> On 22.12.2021 11:01, Julien Grall wrote:
>>> On 14/12/2021 17:45, Jan Beulich wrote:
>>>> On 14.12.2021 17:26, Oleksandr wrote:
>>>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>>>>>>     
>>>>>>>     void free_xenheap_pages(void *v, unsigned int order)
>>>>>>>     {
>>>>>>> +    struct page_info *pg;
>>>>>>> +    unsigned int i;
>>>>>>> +
>>>>>>>         ASSERT(!in_irq());
>>>>>>>     
>>>>>>>         if ( v == NULL )
>>>>>>>             return;
>>>>>>>     
>>>>>>> +    pg = virt_to_page(v);
>>>>>>> +
>>>>>>>         memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>>>>> ... this really want to (logically) move into the new arch hooks.
>>>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>>>> notice there's some dead code there on x86, which I guess I'll make
>>>>>> a patch to clean up). But first of all this suggests that you want
>>>>>> to call the hooks with base page and order, putting the loops there.
>>>>>
>>>>> I see your point and agree ... However I see the on-list patches that
>>>>> remove common memguard_* invocations and x86 bits.
>>>>> So I assume, this request is not actual anymore, or I still need to pass
>>>>> an order to new arch hooks? Please clarify.
>>>>
>>>> Well, that patch (really just the Arm one) effectively takes care of
>>>> part of what I did say above. Irrespective I continue to think that
>>>> the hook should take a (page,order) tuple instead of getting invoked
>>>> once for every order-0 page. And the hook invocations should be placed
>>>> such that they could fulfill the (being removed) memguard function
>>>> (iirc that was already the case, at least mostly).
>>>
>>> IIUC your suggestion, with your approach, alloc_xenheap_pages() would
>>> look like:
>>>
>>>        for ( i = 0; i < (1u << order); i++ )
>>>            pg[i].count_info |= PGC_xen_heap;
>>>
>>>        arch_alloc_xenheap_pages(pg, 1U << order);
>>
>> Like Oleksandr said, the 2nd argument would be just "order".
>>
>>> The Arm implementation for arch_alloc_xenheap_pages() would also contain
>>> a loop.
>>>
>>> This could turn out to be quite expensive with large allocation (1GB
>>> allocation would require 16MB of cache) because the cache may not have
>>> enough space contain all the pages of that range. So you would have to
>>> pull twice the page_info in the cache.
>>
>> Hmm, that's a fair point. I assume you realize that a similar issue of
>> higher overhead would occur when using your approach, and when some
>> memguard-like thing was to reappear: Such mapping operations typically
>> are more efficient when done on a larger range.
> 
> Yes, I was aware of that when I wrote my message. However, they are not 
> necessary at the moment. So I think we can defer the discussion.
> 
>>  Since that's only a
>> hypothetical use at this point, I'm willing to accept your preference.
>> I'd like us to consider one more aspect though: All you need on Arm is
>> the setting of the exact same bits to the exact same pattern for every
>> struct page_info involved. Can't we simply have an arch hook returning
>> that pattern, for generic code to then OR it in alongside PGC_xen_heap?
> 
> arch_alloc_xenheap_pages() will modify inuse.type_info so we can't or 
> the value to PGC_xen_heap.

Oh, sure - I didn't mean it to be a single OR, but two next to each other
inside the one loop that's already there.

Jan


