Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036054721C5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 08:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245827.424094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwfof-0004hp-Sl; Mon, 13 Dec 2021 07:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245827.424094; Mon, 13 Dec 2021 07:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwfof-0004f2-PH; Mon, 13 Dec 2021 07:32:09 +0000
Received: by outflank-mailman (input) for mailman id 245827;
 Mon, 13 Dec 2021 07:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwfod-0004ew-Q0
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 07:32:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f4d6f1-5be6-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 08:32:06 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-z-bm8rxPOpyX3Gx_qo75MQ-2; Mon, 13 Dec 2021 08:32:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Mon, 13 Dec
 2021 07:32:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 07:32:03 +0000
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
X-Inumbo-ID: c5f4d6f1-5be6-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639380726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIzL6DtSRiTHTvxG3MpCmSUNjQ351sIP7nXdVMcDQRU=;
	b=HMMJmbuj5MVhC/oiqE9sh9IhJYjy9uA+fX6nrD8g8ZFiXYMWxFfvxc2tMiyUr1MDciL3WR
	qKllK5kw3wZSJFiLVPCsbdguEJXp1POvV9FZh71Um48XKfrq6Usrn8qWb4Ok9wYDiA/t0J
	/5wfbVVLMpbb1zzXdGosFuNHJUC5+rA=
X-MC-Unique: z-bm8rxPOpyX3Gx_qo75MQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuU7snKsG9d6HVzXvxJl8IWpUp+KZO2cgbhc5quK/KFS+8rK25R3Onss9aDCjUogRY86wrwDfi33BeeIvxLztOUNdlM14skFcgEsGRx23EnoYsU/Fqdrl5or0Cj3dSYP1qUNqiUoejZ84wrtjJ7Oz/I0yXpJIn5nQfd97/gnEVg8vLNsvraUlnFvkWAkZzp4cahLA+lEX1HJwE4/e+ZsiewmVnlZoIXc1LBo0eNVLDL+21DjsQGY1CcCAZbKfgyIX0gH4YQKW5P6QRkiG6brlYKqwHzGUQgNEiHtnwZ0cZks7MMt2YapWYllLt09FCwo45c52YKdh61hLNBpgEdDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIzL6DtSRiTHTvxG3MpCmSUNjQ351sIP7nXdVMcDQRU=;
 b=PT9UwP2CKT33U6LmiuEed97Ym7Od6qOz+eeZ2NfPtTDI8IHr+Bk/fKjfJwzhYvdn7J8AHRJHXDnkWEMm4pucafZ5l6QUXtxuBmtL0HqOVvq45q/nyg1XZrLvEWooTkcp3TxTHx9k57sY3/C8TNjeg2HKxCZQpuh02FPegk/da+q/HPKxXUlX/NJbGyx2ticE+3//YdVjmKjj05zY7fObDsZgcLzVMtkUFLCJvh/blr6txeeexffPUKoy6EdSd+vp6bVgbvBSQnokIdGneWirktH0eYKDQTAWemjaffri6JRaLUQzV7OrCBbvyiR6MLFn0uonzyv/eNOw4rzwRkm+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10705d67-b51b-76da-555d-20edf5d5d747@suse.com>
Date: Mon, 13 Dec 2021 08:32:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
 <69d1b4a3-a042-c2c4-2f59-ea897886ae1d@suse.com>
 <e7f8a52a-5761-88dc-97ff-6c2feca2effb@srcf.net>
 <566dbf20-2881-80ac-eafd-57ac4b217f0f@suse.com>
 <44707bed-ceb3-377b-f2b3-9864b7fa4e97@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <44707bed-ceb3-377b-f2b3-9864b7fa4e97@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0115.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a0e2097-5ece-425c-6619-08d9be0aa848
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3773B3600E0ABD2A52A6A65CB3749@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QNW9qxHxIXNsfmaaOU1NkRAGXa3Z0O2O0874zJbwlbwIRyW8jnaVfeU1Tl9koPPJ6w2HKFIFngP7jMzxkm+XrLNT3E4TanrquyLPY9tODSJ5FBljhZoYMJIlsrB4L0VwpE2otxRNtM1avD5qs5uNIfn7fTrDiNfVO1yHJQFimtOgKXSu9HFM3jYoRA/c+4FQCA+z3NUfYTDVyOW2QJzNyB3MjtMlamnS7tVZLESR5oR8fVIk9+MbGhWu1MWDb1afuiS38ke+zKcX/6lKJZbXtdPdoNDvXoFIqQciix5n3IckbtPGxv1DYuqwjTg3M6KoId6+o8oqG4IGxZAoCoj0x9Uhmjam/Ey35rqmpl2hZfpypQ2EY4ruhxz7sq3w88cRDaP6xNW76ybvkXNPrddwRBX8jIwd94ujtJaGZVRlYgMfnYhFaoQhYMGveRbtMdXhAymBV1ia6ze5Xtygvfu40bssYGE6j7rGyn1wK2v4XMx2KVBsqqGmtvB+7XBnbWw+o6Rd/aUGroUUbDAqQxsSjWkPURF4qzGuenOkNdrIpe1u08itqdmFtK0tvKRXtpArThS4LxffYFFeH2yPpgnfHz1xomSzTifuO/fQSc8816eq1AJLI1182KG0H14c6AYO9SWl4rdklypQ/JX8z5eRfSvwLZrxe1B9BDmgY076z6kl9OoKLcdO8vCd7bynwgbeXvrlAeqpMW8t1G6cZL1XBwNhySwQ/M40coUH4+fJsdUBTtpf5NnEGw21KOXIkiLA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(54906003)(83380400001)(6506007)(8676002)(6512007)(31686004)(86362001)(53546011)(2616005)(66556008)(110136005)(508600001)(66476007)(66946007)(38100700002)(186003)(2906002)(36756003)(316002)(5660300002)(6486002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpHT2xrMDBSVzFDamxSTVpsUDBuekVHRTA4dy91MU5iQ2J1K2RSRDBWc3BO?=
 =?utf-8?B?UVUzb1BTVFgzdTI1bmhjRjVQcHBlcUJlOEt6aGJsNG1kMyt1S0ttaGwvMlp4?=
 =?utf-8?B?TkNiMHlESHUrV2o2Z3JTSUxoMDQzQ3lpYlI1ZFhRaWMwdEtjWHFEaTBhaGFv?=
 =?utf-8?B?N0hhWkVXUWRnL3RtbVh0UnJlOUdLU0dBRWxyQVRQczJNM0lJQWlKRC9Lblds?=
 =?utf-8?B?WG1lWWFSNEgzK0RyNU5KUkhLcEU4bEduZ2JMVHdCOGZtSmFMVXpaTWNoVlNY?=
 =?utf-8?B?b0hua1pUZm1jbjdEcFpkTGxMR0VxMkJoRzEyVDFXVG5md0FNS0FVcmxYMm1P?=
 =?utf-8?B?c09jQys5bzJJeWZGbjUveVQ1b0ZUQjg0SDJOaEV0bzFzdUFjZnFNSjhMVXgx?=
 =?utf-8?B?Z1pkR2loamNZQjZvNVM5MUx1bXhmVjhocUloNDVMalRhV3h0UTlob05QMk1p?=
 =?utf-8?B?bU1SNng5UlJsQW55ZUpCN0FtdTluU0IyL3g4OVRwRWtlNDBJeENSVFN6Rm5v?=
 =?utf-8?B?QVZxRHJjOWN3R2JVVmJnaG9ZWHpJTGZOY0c0WGo3WUtYSXZjbFdDc1diTHM3?=
 =?utf-8?B?VFpqMWc2RVFUdTA5Y0QyaE0ybWRtWTZYRmpveVZ1YmkzcEkvM0o4UmxCRGJt?=
 =?utf-8?B?emo1Tm5tdHVtS3hQdlVud2ZsWXpVL2ZkSHpYV3lWejlzaUhqOTJnTXJUZUdD?=
 =?utf-8?B?eDdmdGZrT0UzcEJNSXcxQkxDNHBCVTdJOHBOV2lyUWRIRHdKYlF4Q0phbkVu?=
 =?utf-8?B?dFV0N3JjU2JYY2JmQjNVd3NLaGV5Q1dGTVkzNkZaTkhUNUg4bldBbXkvWUM5?=
 =?utf-8?B?NGNVNVlEc3ViTjVmYVhITGhGNDNYZXQ0bkUyNlZVL3Y0cnVUaHkxeDFmb2Jo?=
 =?utf-8?B?dXFBcnZLd1g2dXgwL1VzUVd4ZE1VY1NNVDgvbVFOd2lpSklqZVNhUHNTcERG?=
 =?utf-8?B?SDlOdnp0dGFOTS9xOXVPR1ZON2kvVzloUmdRSXIzQkhmM3ZOZmpnUW1jb3Nl?=
 =?utf-8?B?ZTc0TUY0MUdSV1MyV2pBQ3hjNy9DVmRzRzdxL08xRUxPTitiZjYyUkVXT0JN?=
 =?utf-8?B?cW1hTG5NNWxFSEtlbmZURjVBVkN6NUkrRWRjbjNXRDdJK3BFU2xreXN5NHp0?=
 =?utf-8?B?S2hIVHhnaGlwUmpHNVM2eDlEVmMvdTgxcXY4YnJTM3BzSnlPWGR2Rkd6MkZk?=
 =?utf-8?B?bHpMczJqVWo5ZjBBQS9yYm1uczB6TWFIN0ZUNjJiNDh0UmpCZndRZUw4b08x?=
 =?utf-8?B?WmttcnF3RU1Ob0t1bVlFRHhVWEdJelV5QThXR3p4ZkFSREtNN0xiVVR2UEZX?=
 =?utf-8?B?WUNLY0V2eXM0VUlNOW1hbzFodjdxYnJLRVJVNExZUGFXRitNOVNMR3ZsT3J2?=
 =?utf-8?B?eU05TEMrQjJSbjN2ZkRnaGZkeHhseEgvUG5oQW16SDU5TGFlZnpGc2NqdTls?=
 =?utf-8?B?eXd0dkZrQ3FGQVpFSll3eGxBSURSVEtmdHhUeGNTNGFESDhHdzJrVG1Tb2JX?=
 =?utf-8?B?akt0UFp1MU9aa1lGUjBtdmwySHdqN2h0RzRZSU00S2cvY0xwcU9veUZlZ1RY?=
 =?utf-8?B?eE55UTNtWlBRTU5lYUtJanpKWTZMZ0R2TUtudS8wdlhPNzFzYUVEMnlVMm5h?=
 =?utf-8?B?ZWx5WndIcVp6YkJ2TU01L2VDY0k5Y1YyT25HYjFCdVRHZUdOZGFkRGt4SVlO?=
 =?utf-8?B?Y3ZDWHdqcXlLckZuN3pCRkxNV0ZzZHlCZTdmOXRad2o1OFg4RnFwY3UxK29L?=
 =?utf-8?B?V011NTNOYmx5R1FlVFltdlRJWGlLdDUydXJQVXA1cThSdGozT1J1dkkydFRn?=
 =?utf-8?B?dXZHZTMzaFFmMlNKYzhmeDZBZE5mVnNMbWpvN3RHRzgrN2twZnRDVFJaSXNO?=
 =?utf-8?B?RDBsVU54T1dzcFVRcVY3d25lZER0YjVzSUIxaTZER1M2em9XVm1tZVVBMkZn?=
 =?utf-8?B?T09KUWhkSXhIRFNWNVowZTJVU1BLWVBaL0l3TjhlQmJadkp5TFdvQkJHcW9O?=
 =?utf-8?B?ZW4wOHpkeXM3NEgvL3p2cHcvUXBHOGhKT2FMV2d6Q20yTWFvTkd3M0RiTkdI?=
 =?utf-8?B?Wll0dm5EdCtQYy9kL1FoVWVRdFVHTjZkb08wend2NHdkK1lwVXYrVW4xWUFh?=
 =?utf-8?B?aTJiem9DWXludE1OWUgrbXN4Q1JueDdBUXRpeE93UzZNY1FkWEdSVy95MXd6?=
 =?utf-8?Q?CDT//POOxR76M8WajLr8Xu4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0e2097-5ece-425c-6619-08d9be0aa848
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 07:32:03.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNVolVwFDBck6WCLkLb7F6YLzi12zvyZdrXr0mMeYzQxLjEYF+SaHz6NQp/t3MluRDjSnZFOdo2uMkQUYzdQMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 10.12.2021 15:20, Andrew Cooper wrote:
> On 29/11/2021 09:21, Jan Beulich wrote:
>> On 26.11.2021 16:21, Andrew Cooper wrote:
>>> On 26/11/2021 14:10, Jan Beulich wrote:
>>>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>>>> @@ -124,6 +129,18 @@ config XEN_SHSTK
>>>>>  	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
>>>>>  	  compatiblity can be provided via the PV Shim mechanism.
>>>>>  
>>>>> +config XEN_IBT
>>>>> +	bool "Supervisor Indirect Branch Tracking"
>>>>> +	depends on HAS_CC_CET_IBT
>>>>> +	default y
>>>>> +	help
>>>>> +	  Control-flow Enforcement Technology (CET) is a set of features in
>>>>> +	  hardware designed to combat Return-oriented Programming (ROP, also
>>>>> +	  call/jump COP/JOP) attacks.  Indirect Branch Tracking is one CET
>>>>> +	  feature designed to provide function pointer protection.
>>>>> +
>>>>> +	  This option arranges for Xen to use CET-IBT for its own protection.
>>>> Shouldn't this depend on BROKEN until it's actually functional?
>>> It compiles fine right from now, and making it BROKEN would inhibit
>>> bisection through the series.
>>>
>>> Nothing actually matters until patch 65 turns on MSR_S_CET.ENDBR_EN.
>> "Nothing" except that until then the promised extra security isn't
>> there.
> 
> The series is very likely to be committed in one fell swoop, but even
> that aside, it really doesn't matter until 4.17-rc1
> 
> As it stands, this is ~65 patches of incremental changes to the binary,
> and oughtn't to be 65 nops and a massive switch at the end.

Well, I'm not convinced, but I can live with it being the way you have it.

Jan


