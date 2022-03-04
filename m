Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381B4CCF0E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 08:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283976.483096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2No-0000BS-U3; Fri, 04 Mar 2022 07:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283976.483096; Fri, 04 Mar 2022 07:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2No-00008q-Qk; Fri, 04 Mar 2022 07:29:48 +0000
Received: by outflank-mailman (input) for mailman id 283976;
 Fri, 04 Mar 2022 07:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ2Nn-00008k-8Z
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 07:29:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dda19dd3-9b8c-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 08:29:46 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-V-nxuICBMES9oqmZd2FHNQ-1; Fri, 04 Mar 2022 08:29:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6296.eurprd04.prod.outlook.com (2603:10a6:20b:b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 4 Mar
 2022 07:29:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 07:29:43 +0000
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
X-Inumbo-ID: dda19dd3-9b8c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646378985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vob/TRDzpFKLurlcs5DJ56sShHWhgC6Etwn80wNOGWo=;
	b=RgZb6r529oPWitvrlevRo7pn/hVMbbMQLwkiitXC4P36tMPxH94WFgrmhXY38+IZHwSLpv
	OqtjeHI2s2bxB2WOqPEDIvV4sfV7c5HY8h74ZL33lU3Et7zq/EnMMKl8meHU2nwFmo77/q
	UfNfeoeMQogo7urPbGlTuvLyUNYdP/8=
X-MC-Unique: V-nxuICBMES9oqmZd2FHNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwTzS2SdKxLfN3rWLPInEoeTYkI9/tHc3Mcx779lI+og0xpNNtUox0BJQAwwPgUmg1XIWpUjuHJIourVO3TcLlE4rwL5aEL2ewfvv2589vI8otoKt8qXezYwma+WX1kE4YaykCOeSuf7xpmZ8A5TVbHYo4ggJvZMpwgVaUN7hQSyEGKaSFsglpW6JnNXtwekYWtk+uM5LIgeE/9mZaZDKBYMX/H33vPnVHjIpOKwuclAsjvKJQmQgFo4WFoaLmvexPfNm0AOu5GBo64GHMcqYVmrxbBVuhtozzDHhjJo0UduRf+nXLowOlKSsOk7ZQXe/qRh6DN9XSnIJUINnbWxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vob/TRDzpFKLurlcs5DJ56sShHWhgC6Etwn80wNOGWo=;
 b=i6eQj2ob+XaoLCXBpPdubUynB43bbIgoLBcp6Wup3enS3n2GmPSLQe/3dNW6pGc4nAT71QlNgJkGfBRkZKvsP0wt+gFTbBIns9coXAD7deRWmoRAjpcPzdxB52Xvx5MMPXsOslfjePQoAOgkG5AH5dnIFTrgBcBj7O2RfrvfEesSfmaAHptv5kfeFTTA94jT+U/Z6eYXRk/JOJI2Q8mkqueJcyAzqD+an4458BhRknlSmlV6YKIL5JN+SeKN8sTiwdzPz2cDfluDhPwRznEw7Tbp7r3YSJqY/075SJYqad2leu/28s7QQVXo403BphPSGxo3rj2CAsNueCDSdnAY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c85691b8-675a-7a7f-8c38-d224c88a9aaa@suse.com>
Date: Fri, 4 Mar 2022 08:29:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Regression] [PATCH] x86: fold sections in final binaries
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
 <85b6a876-ac8c-051f-5b61-23c58b29c1dc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85b6a876-ac8c-051f-5b61-23c58b29c1dc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0080.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af66dbc6-598a-4d73-827a-08d9fdb0c08e
X-MS-TrafficTypeDiagnostic: AM6PR04MB6296:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6296AEBBAC20524002CD772BB3059@AM6PR04MB6296.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cD4PvoNGC/WQRr3JTXofity/03beuVjWnb/pTHWdXielAM1xCWcYW1qpXhf5lTcKz2LW8jcAyluohHwK7b2ciowK8Iuds2sWkoofDiDDXsgtkJfHWlw6e9M/lCytRXZlJAx5RdtcPtuPC2FQy04vpfIge3wflqQTiEsKUqS03A/olnx9gfzvA2/s/t5p8Kw07S02svCrisjVnLhgZAlmLnrziebChhL5EKqWTiLxM5fNHD9seqw4VDFp4avQJC63EOYQ18lw61WvQTFu/wba+eW3u+iL/GoskTQ25q972GR0Sz1WT0F1QxsPm3J4hMMB48Vk1Sr23DH0v+y5rB7yuKFU6f/JYEjx3BhXcrokOwEEd0rx+YAUmK+r5VITkVL49ATEYRdQ2HMX586D/IUiLe1C1gWOp8uHz1USMvBjUYUskCg8uxx3SZNjc3aJcWZ9uxIOWCRxLFbUwDo7NI7NXO4o/DCfvAQnwSSL1rA6Q9iTg5V3RLPhnpaMJhoco3y45H7HYnyrtkwbY3SGu8E5Yk9xvvomvSCQcbtKhGPJjnY05nEkgHBhn/9Ve/WLq0DXtDukMeQYmSum0biIc+d65vU1P7Jm5K9szWX1P5594OdUGWh1mwLD0bMeQBFt/v8GPBKUjqlyWRok4/S4QZBivDVhkQM6nIiI+woyXFqr5E+kMXgy2x+7VbVcmRD21rQwyV92Jw/MTCe8/Sfexo2EKlCa/YDQHTrJvI8vx/TqfKVgXG5IIiZQH6uZAVPWfESSkWgQ+HHiWq+zjRQzfKtrHPlRxvBuXoC5DFZ5zof2Y00ee1TpZgFAY2tmPwoCjKNneeO/hUOA52QnB/CImQp6Kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(83380400001)(2616005)(2906002)(36756003)(31686004)(38100700002)(8936002)(508600001)(5660300002)(6512007)(53546011)(6506007)(8676002)(54906003)(316002)(86362001)(66476007)(66556008)(66946007)(4326008)(31696002)(6486002)(6916009)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkZXdkVFRy92SFl0MndvZWc0UXppZWJVaHVGL0dhQzYyeFhRNFpRaUZMS2pk?=
 =?utf-8?B?ZHZ2V3JGbGtUSzhKQ3RVTDBOTFRMbVhmaTdQaUNzaVFaTUwxR1dOWWRvOFNB?=
 =?utf-8?B?Z3Qyc2pCaDJnRzVMZWdqRDVPdHQ5UG85cDl5OC9lYi9td2pXd0tDV0QvaXNa?=
 =?utf-8?B?UkltSER3bEpFREppNkpBNUhYR0c1RFNONXdTVDlKSzYya1dVbGhYTVdiZkVp?=
 =?utf-8?B?RkIyWlV0cFRwbjlld1ZTSkUvNWtYdnRDNVIrakVaZFFDcGJ6Qi81SmxiK3lR?=
 =?utf-8?B?MGx2bEJiUzd0L2x3LzVOQWkxa1pxMHU4MEtNT3hFRnRaanVkbi9vVjVzQVps?=
 =?utf-8?B?RWRzMDdTbXhXZVNtdE9WdXM4RWdOdGhwOG9FMG5qcnZ6R3ZTdDh6WTM2ODJ1?=
 =?utf-8?B?YWE2Y0JwMnlsWXBpQmRKcE1OUldyUnhYcElDNjBkb1NjMnhPREJUMGpuQWQv?=
 =?utf-8?B?N2VScHZSeC92L1Y4UVhnWWNqb2VseEEyT0t2ZVpqMVlVdjZwWGZodFkvQ24y?=
 =?utf-8?B?REUrZ0wxT0xCS2JWWGpPQ0RYZENJWTQ3TkgzZlp3cTVSTURQL3l2YjA3OWJa?=
 =?utf-8?B?WU9YYzZiZGljaDRWcCtaVlhwUU96blJpaDlQeGJiSnJKZE9hVlJkV3RMd0NU?=
 =?utf-8?B?a0dwZ3N3REdweXo1S016VmtTdkF1bFdHNTlVeUo0eVhZeURFOHp4eDJiMldL?=
 =?utf-8?B?SktHMG16cDd3Zk1yZzVMNmV1R1VuQ29vSXpqZFpybmtUR1VBcmViQmlDaG50?=
 =?utf-8?B?ZUhTQ3dwZnNPZGpsUkdRdXltR2xKUWx6aFR3Z2RpNGp0VEYvYytuVXZUOURD?=
 =?utf-8?B?TUI4VU13WVpXY09IWVVMQjRwN2pyTjE4NHBUdHY2ZzlDWWVScU85aU15TVRI?=
 =?utf-8?B?YUFGYUkyVjExMHU0NEVnL1FTRkNuc3YyQ2VzLzJhc0djT1U2eDNyMVBHVVlr?=
 =?utf-8?B?V3lWQWcwUE9IZkh5Y04zbURwa2lrbUZpZ2FIZS9hdVhFNFBwY3hNTXlyQWQy?=
 =?utf-8?B?aEtVZENWQWpBZ0NRTGcvR29JT05MVHg1b1JUVFNyem1xcGI2Mk9JY01nb2ND?=
 =?utf-8?B?aFNzV0lJTmhYVnc1dyt6NmJWRUY0TnBTMktvRTVBcGJwT1pBcS9RdnFSRlZ1?=
 =?utf-8?B?TXZJa1ZudWFNN3d0NmM2ajdPcmhuTTBnaUVkU1JHSjZPcjQwQVFNVkhCaGRm?=
 =?utf-8?B?eTFhN01uMTdYZmJrbDErK1NoMU44amFaRzh6dHNzMXVlQ1luS0toTFdmK2ho?=
 =?utf-8?B?SnJFeDd2dTQxL2VNcWxWL3g1Q0tjZ0Q1dk5pc0xGdWFtMjh5WDJQa0FqMzM5?=
 =?utf-8?B?TkpBaGU3TjZNUHZVN1hDMXc3d29IeG5tRzNqd1hSZmdXRUp5OEhEY3N1bU1Q?=
 =?utf-8?B?MWVRUzlKMFl2MGY2NWxaUHZ5emFreWN0RlB2YTE4ZXNtL25tbUpBVUR6RUF1?=
 =?utf-8?B?U0Z6QXR0SDFLUVY0TEpXNkhJYlFCamVKVWgxcm4vWUV6M1F1VWRxQTFBMHBF?=
 =?utf-8?B?dFJzUnhacFQ0Z2ZRbGkvVE9pQXNmb1lQYURjVmJLK3crRUNyYXRXdXVzZVY1?=
 =?utf-8?B?Z3NmdXdCeDFZQXpxVGIxbUUyWDBSUXVQdlpmSlJLcVV4djd2Vzc5U2VXOUlO?=
 =?utf-8?B?OGFaeFp3bXhVdjM4cVJ1NTFsdjdSMENEQ1d5V2twbzYxbEJMQnB6T0szeHBH?=
 =?utf-8?B?UTg5L1NSOVdqdVJzZ0hwZkFXQUowNk5UUUQwcEN0U3FJZmlKUzNoa3lGMzQ2?=
 =?utf-8?B?VjI5TWdaL2Q4MG9ndEkreFdGN1FobFBRVkZSam5KRjcwbTFrME5YMUVRdUFx?=
 =?utf-8?B?TXZKM2tVYU9TNmJCRWd3QlpHaGh0cGlLbzI5dGRVSUdKejgybU9rRks4MldP?=
 =?utf-8?B?M2s2L3J3ellOWEFSSHVYZXZ6dU9jRVJuRkJuODNaVnU0WHZnRHUzcUxWNENk?=
 =?utf-8?B?dVJ4Q0hkNndXNW1GL014NlZOYU9tS3R3RXBDT0FQbmFBUzU3T1hkdWZxTXE4?=
 =?utf-8?B?cHNpWDBTaFlFK2I5cDU4ZjFjOGdUSnNRMDRzNGF5MXRIZEUvWkQ3R0dFQXds?=
 =?utf-8?B?aDlNd2dQc2RESnZJYWkxeUNzUWNLOWZyMzhjcVdOMnJIY0dWNE5jOXN6UkNo?=
 =?utf-8?B?TnhYZ0xPT2VYdjYrMEhyRHFVKzdHNFlrdnFXUVc0eFVpVG5qdWRhaFl3bEt5?=
 =?utf-8?Q?/Fz3sGJDRo0OMg57J+7UojA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af66dbc6-598a-4d73-827a-08d9fdb0c08e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 07:29:43.7522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iURoqrTmz+kWdjx4WXgQ1+KZOuJmPp9lnkaGHeLe4/9YABBMpexZP8SN9YFkuDAp0pm4gv3i/64d9wXan1xd7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6296

On 03.03.2022 21:02, Andrew Cooper wrote:
> On 01/03/2022 08:55, Jan Beulich wrote:
>> Especially when linking a PE binary (xen.efi), standalone output
>> sections are expensive: Often the linker will align the subsequent one
>> on the section alignment boundary (2Mb) when the linker script doesn't
>> otherwise place it. (I haven't been able to derive from observed
>> behavior under what conditions it would not do so.)
>>
>> With gcov enabled (and with gcc11) I'm observing enough sections that,
>> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
>> failing the final ASSERT() in the linker script. (That assertion is
>> slated to go away, but that's a separate change.)
>>
>> Any destructor related sections can be discarded, as we never "exit"
>> the hypervisor. This includes .text.exit, which is referenced from
>> .dtors.*. Constructor related sections need to all be taken care of, not
>> just those with historically used names: .ctors.* and .text.startup is
>> what gcc11 populates. While there re-arrange ordering / sorting to match
>> that used by the linker provided scripts.
>>
>> Finally, for xen.efi only, also discard .note.gnu.*. These are
>> meaningless in a PE binary. Quite likely, while not meaningless there,
>> the section is also of no use in ELF, but keep it there for now.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
>>      ld is quite clear that this is an a.out-only construct.
>>      Implementation doesn't look to fully match this for ELF, but I'd
>>      nevertheless be inclined to remove its use.
>>
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -194,6 +194,7 @@ SECTIONS
>>  #endif
>>         _sinittext = .;
>>         *(.init.text)
>> +       *(.text.startup)
>>         _einittext = .;
>>         /*
>>          * Here are the replacement instructions. The linker sticks them
>> @@ -258,9 +259,10 @@ SECTIONS
>>  
>>         . = ALIGN(8);
>>         __ctors_start = .;
>> -       *(.ctors)
>> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))
>> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))
>>         *(.init_array)
>> -       *(SORT(.init_array.*))
>> +       *(.ctors)
>>         __ctors_end = .;
>>    } PHDR(text)
>>  
>> @@ -404,16 +406,20 @@ SECTIONS
>>  
>>    /* Sections to be discarded */
>>    /DISCARD/ : {
>> +       *(.text.exit)
>>         *(.exit.text)
>>         *(.exit.data)
>>         *(.exitcall.exit)
>>         *(.discard)
>>         *(.discard.*)
>>         *(.eh_frame)
>> +       *(.dtors)
>> +       *(.dtors.*)
>>  #ifdef EFI
>>         *(.comment)
>>         *(.comment.*)
>>         *(.note.Xen)
>> +       *(.note.gnu.*)
>>  #endif
>>    }
> 
> This breaks reliably in Gitlab CI.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/2159059956 (gcc 11)

Hmm, I wonder why I'm not seeing this locally. The lack of mentioning of
.fini_array in the linker script struck me as odd already before. I can
easily make a patch to add those sections to the script, but I'd first
like to understand why I'm seeing gcc11 use .ctors / .dtors while here
it's .init_array / .fini_array.

Jan


