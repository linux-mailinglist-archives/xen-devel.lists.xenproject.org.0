Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB851BEDA
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 14:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322070.543265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmaFp-0002Nj-6I; Thu, 05 May 2022 12:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322070.543265; Thu, 05 May 2022 12:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmaFp-0002Ki-3c; Thu, 05 May 2022 12:06:45 +0000
Received: by outflank-mailman (input) for mailman id 322070;
 Thu, 05 May 2022 12:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmaFn-0002KT-KJ
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 12:06:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d14198fb-cc6b-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 14:06:38 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-bhKbU8qVOJu-C75XKnLQVw-1; Thu, 05 May 2022 14:06:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3184.eurprd04.prod.outlook.com (2603:10a6:802:9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 12:06:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 12:06:35 +0000
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
X-Inumbo-ID: d14198fb-cc6b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651752402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98p1TwxYan7Gpg3+zutP7MOt3Eyiz/A+sUynE80Rr+0=;
	b=niJnaE1AryT4j+qtmo8YAF7e69WSTPfDjkt4sdQt4RYE+IFiXTGg3f5/7zVUistEQwrkxO
	9umaRrN2qKG3ymQAMou9l5jURBrhH6Zkx7hQfb8vR+akKkLVv2pGDZ0dwFZqcEiJGvXjnM
	wYj4C+v44hrE5PtxFm42sNYxvbmXVm4=
X-MC-Unique: bhKbU8qVOJu-C75XKnLQVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5MkIDr+HFV/SjfZgdFUy6LcdLBJuhRirNNNhcR7cFYkZCQRKiJsqjhjAsfAAvtUpStnoBOIGyZmyMwR5qAry4DnWqqhmjxWisTbAuayfIziw3Z/CEh5/LYbPhHpLQ7L98Uey0EUxQfnHP8yjk0OXj03AmEohk1WCAJjjxIs6wkAAGYfi01DnC5kO7v8tN/UEkENeCSupBVxWXcJh909l2QMCUl7Ww5L61x2YEgrj2n1tE9T2gpU0muuAQ992+klcb2BICMBpzTSzsOQ5BxdUSyprnG5daYmmIwTm6938ciIlx/C6T7i5Sc6q3SASAz8F3uydZ2Dm2Jb1/gEqJQhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98p1TwxYan7Gpg3+zutP7MOt3Eyiz/A+sUynE80Rr+0=;
 b=icG+0cEi73LgHfyAW0NLtevt6YPGzOMgv3j0y1HrxGNR96WHW+HGW6DdrviKlpawJ1n/vN8AOOz5tAOURUoHPSTmayz7nYzRwrgfJuqO720nowTbyWbDAtIGQriClRp8iI9iijc3TSiHCFQPp/FZDpeXSK4wSXEaRZ3htbtLekJ9EnH6gVxqKI/HBgrRzMRhD7KHZ0F7uCgDa8sdKrFxIFTmPSd4+RCcZnjQS+Asl56Clg3CmO4qoMisdTKDE5alFAn/XQK3HY2D9X/13o1UvgTZL0JIpeKcUDhmTJ4sy72/yhhx9thbGJZHQdqhG4JivlvC9fqgIgB2QwkSnv4Uww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
Date: Thu, 5 May 2022 14:06:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0492.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c05eb4eb-f729-4bba-38ac-08da2e8fb37c
X-MS-TrafficTypeDiagnostic: VI1PR04MB3184:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3184012FA534078BA46AC702B3C29@VI1PR04MB3184.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZhQqpBoN5FLZ1nHSiE3vFAQ+p1VKXFJMV356TtGPQkXZ2armu468Ca8BHtf96pe+I5lH7RJlGHFJDI1w4NLTWQVB00cx+6C1RERjphIeu/vnzpIlyK/on4b5PBVjlxuPlAhCReuFoMQ7hTFW6bO3+Vj5AS4AKJM233j3PqBPjSlTlCN7oj94Xx/7ulRW7r6z6xnSMB72czTSOn60dgRD5grTLOal4YAhaJR+bOTMFSsXaFQqst9gHukSV28O0f7lZiX++a+v3ELC4JCLSqSztr7XVTumDiku+Ghs4RjK5ggEZ02IrWJn03W4ejrVdQv7JDGGy2U+IOppYeScLPd0ueVsqCfW+62yTWzNdR/wH58NMduguGUjyR/bBZ0Tw23BATGfppoQX1pGm560Nuk2oUmVcwU6iSxNXOOUHY1gQsHCSM9kzlQLHZ7O3V8eUs/aC7twWTDE9l6EvyRFZXz+BuOQ79srsPbM5U45Ggy9fvO9UzaZy4eGn5BMIkA7IJBCA2xEJWyFWrxduMlhbJbtDhMWKRhEk8Mnnx4hIRUelSSQpW1p931TERS1WHMbj4H4tF8imUjZWX4D9pf56WVIh3YAKQjtNpBllZubNTeu2uXgYGOPvgnlv2mg2i6XZMZuz1nx2knRc0E/AfGwdJBVe0b9KXNKuUv4F0Ewverg/5LBETdGoH9oiSrTnZBVoOobbocwC3j1/crNcOdcgFJ0A+g75Fqi5hSuwwbrrxxi2qqEQBWjWoVqYFwwynuEn4075j+9vIEN3Lk976AgPfN5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(5660300002)(186003)(508600001)(316002)(53546011)(6916009)(31686004)(6506007)(54906003)(38100700002)(8936002)(83380400001)(26005)(6512007)(6486002)(2906002)(31696002)(8676002)(4326008)(66946007)(66556008)(86362001)(66476007)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWxTTmkraGRYeGU1aXg2UVNENFErc2I1TXhsd0k2OFZGRS9SY2x0aWZpOEtC?=
 =?utf-8?B?d01PcnBmNGRKMUQvYjBQTEhKOGg0RTZhY1FSNlBudkNCZFVnMGNQU3BUUWRC?=
 =?utf-8?B?TS9lU0RYUkZJV0pPRlB3Q3ROa3RXK2Q3c2lpWlFzbE9QUmRCSHp5VnJZbUJq?=
 =?utf-8?B?R2tLVXpHUm5mcXFmWlowY1lZT1hjanpLWXJld05SblB1bkluZWRZMlBOQ0h3?=
 =?utf-8?B?c0lTNEU0TFZmWCtob0t4ajRZRnk4SlZKQVpjU0E5d3E0d0FqdXlZL2FuRUZj?=
 =?utf-8?B?WmhNRFk0b0kxZVZRN3RqeFExNUc2TkVUbU91UkQyRjRBRXZmKzJObHFUczg1?=
 =?utf-8?B?bGlnMk5GTlQ4dGJlTFlJNml5TXRzd0ZOVm5XWUtQQitsQ2VqR0ozWGxScEtK?=
 =?utf-8?B?OFpQMzY5dy9Qd0hWS0hIT3NtN1IzQ3IvZEFza1RDTXIxaDUxTHd4cEpHdlRt?=
 =?utf-8?B?R2ptQXhua1NCL2d6TnduY21PTC91d2ZvVGlSb0ZIL2RYUzJCV3FVNmVlc0FR?=
 =?utf-8?B?b0U4SHB1ZjBMTUFhZlMyS3dSS3NWRUc2K0g3cGFMZ25GWERNamV1NmZaRTJ2?=
 =?utf-8?B?T0svZzBURm8wRHJHUGxNRXl5WjlMNS9CVXhNaWJkcEpGT0FXSnNQL2wvQUs0?=
 =?utf-8?B?MC9YeERKUlJmWllKeXJVZ0ZqU1BodUZZSmxlU0t3QWp3TUdOb0pSVWlTMkRD?=
 =?utf-8?B?SXc3VCs0YTY0ZjA1eVpIbW1iWHRWT0ZzU0lCUmtONEdwNHBBdGs5ZGlXcUpF?=
 =?utf-8?B?YmNZc2JpWW43WDd0bklGQjE5aDdoSEt2VTFmUzF0YW5aSGtOT3FzbllCNWgw?=
 =?utf-8?B?a1FoQ2pFeE1pbFY0R3d0WXFDNUZ4Yk84RXY1RnFoUzBVOGxSdjFMMW1XY1ho?=
 =?utf-8?B?bzJ0b1M1cUxmOXEyaE1ud0N6SUNmbnZmZ3A4YXB5QTdkYnVMTTBMQ2g5UVEz?=
 =?utf-8?B?WGxkWnJQdlc5Vm5mVW83VnRrR0xDMjI1OXNRWVBnWUJ1ZEx0YmRIUGhMbnFI?=
 =?utf-8?B?cnYySnJsY2RlaU9DN0lBUzNGWUJlNzFSNHN0YnZLTHlIY1dTYk1MZVRiYnlU?=
 =?utf-8?B?QU9zNzUzMzBPdFp0S1NGcHFLZnBacUhQNDdhaFQ0Ymg5Rk1tNXRXdVAxayta?=
 =?utf-8?B?Vi9PV0J1M08reWRCS2x2UzB5WHpyaWVrTk1VYU0wdjdnTXVCNFh1d3hGd0xh?=
 =?utf-8?B?VUFzNUdCaGNaQ3dpYmxRYmRVb2wvcDRQSnBSZm9zbHV5aWxsWWNsU0ZTbTlm?=
 =?utf-8?B?WXVYNGJxM2tTVlByUCtxQ3g0NE9qdVFLWUgvdkVxLzhVVERWSGJiYjk4Zis3?=
 =?utf-8?B?ejZIQ0c2bEtjempqZ2xRekpISi9xSy90bStaQ1VyNFB4ekZkbkRGZERqVXdD?=
 =?utf-8?B?TjZnREV1bzh2RGluV202d2RrZ2d3NDNEcm91NGdwZk5WMWZ5aXZmaERZS1NC?=
 =?utf-8?B?UmtoQ1lIZFpzSTJVUkJEYjZoL2VmcUtFWXBiNDFGS0lUMzBreDRPY0lRa2hq?=
 =?utf-8?B?dVJ4L1lRR3dXT2lvbDUzM29UMDh6YU50M1lNdTN5Z1lRcGVucHQ5Zks3alZu?=
 =?utf-8?B?VnJxZTV0eWIvdWI3WEpsMHRJU1lJSG9aOUhCQzFZQk5yVWhwY2IvV2lvZnBs?=
 =?utf-8?B?dDhvU1lwWVE2STdBVC9KOFlJQ3J4akk3c1ovbDkrYTFCQ1kzS3dSTnVRMnEw?=
 =?utf-8?B?WjI3WjhNR1RJZkp4azhqZCtaRDRndVJhNWp0QVo4SGh3VzJuSURhYXV3b2JQ?=
 =?utf-8?B?SjJQY3pQRHN4YzJYMVZoZ05CWE9Ob1E3MVVHTlRjbFhLY0JJK3ZkSjNyOSt4?=
 =?utf-8?B?d1pDNGVjNWtrZXZLdDR2N1NqbFVlWkVkdDdnd1pCYklRSW5oL1dzRzM4b2Yv?=
 =?utf-8?B?MEI4Z3VDM3pzQVRJQStuZHhaZGZEVnphMC8reU9xbVMrVGxONytMR001dGpH?=
 =?utf-8?B?aFkwQTdRS21MUTc5d0pRdERoWXJlVjdxQklIMU9WVGxsMzVMalZQMWFJMDV5?=
 =?utf-8?B?QXBGaXJQRXNETUpWanJYSXlZVDlmZjRyUitZNlVkN0w5ZW1lNG4zL3JTMTlW?=
 =?utf-8?B?RVRBUndoTDhTMWk3Y1hPL1hrcUNvbFhTem9rTk5wZllRc1pOVEZRSFJOejMr?=
 =?utf-8?B?TVdWYmhuTDFwSUx2TmRTQUVQM3MvbFpCM1pWMC9zR0NlVEd4QUZuVDFtaG9H?=
 =?utf-8?B?bkp4UVNGZWNSa3pyV20rdHh1NmRiWG1IcEpSeGQzeFpnN0krdUllYzRTSFB1?=
 =?utf-8?B?NW93SXVQU0JVYXlBVUpkL2Z1SXUyUmRSTnJNYnVWdjVoY3UvNWhJSHZMd1dN?=
 =?utf-8?B?TVFGaTQ3S1k4RU9VZVBzVlY1aHdHajBEdTE2RitjSWQyeG14VnpzZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05eb4eb-f729-4bba-38ac-08da2e8fb37c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 12:06:35.4685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/MpD3jZ/2elbBkunwDPQgLK8AEgIPdIxaH4D2+toifMDDrAj4SP1Bi13OcoqKuNgOLE99nsbvDLOe+PE9MwIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184

On 05.05.2022 11:29, Penny Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, May 5, 2022 4:51 PM
>>
>> On 05.05.2022 10:44, Penny Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, May 5, 2022 3:47 PM
>>>>
>>>> On 05.05.2022 08:24, Penny Zheng wrote:
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Wednesday, May 4, 2022 9:45 PM
>>>>>>
>>>>>> On 27.04.2022 11:27, Penny Zheng wrote:
>>>>>>>  #else
>>>>>>>  void free_staticmem_pages(struct page_info *pg, unsigned long
>>>> nr_mfns,
>>>>>>>                            bool need_scrub)  {
>>>>>>>      ASSERT_UNREACHABLE();
>>>>>>>  }
>>>>>>> +
>>>>>>> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>>>>>>> +                                   unsigned int nr_mfns, unsigned
>>>>>>> +int
>>>>>>> +memflags) {
>>>>>>> +    ASSERT_UNREACHABLE();
>>>>>>> +}
>>>>>>
>>>>>> I can't spot a caller of this one outside of suitable #ifdef. Also
>>>>>> the __init here looks wrong and you look to have missed dropping it
>>>>>> from
>>>> the real function.
>>>>>>
>>>>>>> +mfn_t acquire_reserved_page(struct domain *d, unsigned int
>>>>>>> +memflags) {
>>>>>>> +    ASSERT_UNREACHABLE();
>>>>>>> +}
>>>>>>>  #endif
>>>>>>
>>>>>> For this one I'd again expect CSE to leave no callers, just like in
>>>>>> the earlier patch. Or am I overlooking anything?
>>>>>>
>>>>>
>>>>> In acquire_reserved_page, I've use a few CONFIG_STATIC_MEMORY-only
>>>>> variables, like
>>>>> d->resv_page_list, so I'd expect to let acquire_reserved_page
>>>>> d->guarded by CONFIG_STATIC_MEMORY
>>>>> too and provide the stub function here to avoid compilation error
>>>> when !CONFIG_STATIC_MEMORY.
>>>>
>>>> A compilation error should only result if there's no declaration of
>>>> the function. I didn't suggest to remove that. A missing definition
>>>> would only be noticed when linking, but CSE should result in no
>>>> reference to the function in the first place. Just like was suggested
>>>> for the earlier patch. And as opposed to the call site optimization
>>>> the compiler can do, with -ffunction-sections there's no way for the linker
>> to eliminate the dead stub function.
>>>>
>>>
>>> Sure, plz correct me if I understand wrongly:
>>> Maybe here I should use #define xxx to do the declaration, and it will
>>> also avoid bringing dead stub function. Something like:
>>> #define free_staticmem_pages(pg, nr_mfns, need_scrub) ((void)(pg),
>>> (void)(nr_mfns), (void)(need_scrub)) And #define
>>> acquire_reserved_page(d, memflags) (INVALID_MFN)
>>
>> No, I don't see why you would need #define-s. You want to have normal
>> declarations, but no definition unless STATIC_MEMORY. If that doesn't work,
>> please point out why (i.e. what I am overlooking).
>>
> 
> I was trying to avoid dead stub function, and I think #define-s is the wrong path...
> So, I guess If I remove the ASSERT_UNREACHABLE() part and only leave the empty
> function body there, the CSE could do the optimization and result in no reference.

No, DCE (I'm sorry for the earlier wrong uses of CSE) cannot eliminate a
function, it can only eliminate call sites. Hence it doesn't matter whether
a function is empty. And no, if a stub function needs retaining, the
ASSERT_UNREACHABLE() should also remain there if the function indeed is
supposed to never be called.

Jan


