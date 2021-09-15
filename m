Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8540C11B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187274.336074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPuY-0002pv-PY; Wed, 15 Sep 2021 08:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187274.336074; Wed, 15 Sep 2021 08:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPuY-0002nd-LQ; Wed, 15 Sep 2021 08:04:54 +0000
Received: by outflank-mailman (input) for mailman id 187274;
 Wed, 15 Sep 2021 08:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQPuW-0002nX-Sv
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:04:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df169c4b-1fa0-4bd3-a69a-f7f12dd4c625;
 Wed, 15 Sep 2021 08:04:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-X9jyxgW-PO2ucaABi9Wqwg-1; Wed, 15 Sep 2021 10:04:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 08:04:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:04:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:101:16::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 08:04:47 +0000
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
X-Inumbo-ID: df169c4b-1fa0-4bd3-a69a-f7f12dd4c625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631693090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r132eiCb14LF3oKvpumOcwCR1jNghL/zwsEyh0UIrSY=;
	b=iM7zKMbi3pHhB8x1etviWeebo+m/0R5KzFgIwi+fNau7X0x0XU6EqW2XiM9GRCuJ5vdJag
	Wgg00vwypfuP0z+UZ4k2ZclnKjpY982pXATqmY6tXwr8fRYPvByGk/qA5lPy4wUSh4hWWZ
	ZKWYcpjHRNTpNXGrQNRJoyOLaDE2+lg=
X-MC-Unique: X9jyxgW-PO2ucaABi9Wqwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMjeqgtxZOzecfOl9XVohA844BHun1geGRBwe4PoCp11H1PpoYWP0swF8TS52ACHsyTEJDoS2VLIZUrEmUfDtwZ45RCWJU/ERwW9uVmvbCqqw3iQj3jKYJifJM3zfzhJ42Lsg1wVjQOmHQZDLx3CQjpH58pxM+/XoGynIWwKhnOwBJbo+D280E2mzR82FGnBnlVeyW9wHM79d2VazMHvI/TAcuA3V7Z9wjGY0aOG31rBam4WXHvKcEwtup2jwMz1MFzS+HUxnl3u6LYaFPyDMVE6agmLC4nCZe2FIHYyUAH+M+VovnBTnk8rMG4VnmSry/yTunuxYWZ5i2CIFfo7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=r132eiCb14LF3oKvpumOcwCR1jNghL/zwsEyh0UIrSY=;
 b=Vx5EZs817tlPtQPk6h1iejvDcSvCzI0UPrdKoOUXXPwrhrbVbs+lJcqcYSNJy5sa/rAH3LjHRo/VOCgONvoVub8Yf3ClWRnZVnC0PaHJUhjSteZVemvMIZ5T4UXDO+fQrfoA/rIDZi1P8kPkclxPRqARhycE6BGXLn3uJhUQ7YXneyRnGcj+nr9xuu6lLqsV9bnGRpgJ4ZF+A8yk2Z/AFvu3iYSMB7HPgCTcGf5lLoWBHlvOhUBbP0raMoeTBg/mt7Y2r2mlijOldKzu5pzYRPptNlv5q0xGSPZQAHzLFrSNItfy9o/uiHo2HmkJ2rUf2en9GBGIrstWxn8l2S8mZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v7 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <penny.zheng@arm.com>, Bertrand.Marquis@arm.com,
 Wei.Chen@arm.com, xen-devel@lists.xenproject.org, julien@xen.org
References: <20210910025215.1671073-1-penny.zheng@arm.com>
 <20210910025215.1671073-6-penny.zheng@arm.com>
 <acf2e43e-5db1-1374-013e-b152093b41ba@suse.com>
 <alpine.DEB.2.21.2109100916270.10523@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2e87c7a-08e0-3cca-fe4a-6278d6939591@suse.com>
Date: Wed, 15 Sep 2021 10:04:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109100916270.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:101:16::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cb274df-df84-40e3-84de-08d9781f7c57
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33927FD29567B1915AC436FCB3DB9@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Upn39ntDiY6yaAuSbcZsITtJXckDJm0su9ezkgPSIEmjAOdADPhZDQWxndmMzBN6/exAK43AuyToxWUcPGKJhYlWa2JCH3+pHRwb4DxXcz3c+N7TrMFi87mnnLRkF8RSW2RmM1VjMsZaCpPFpkPnawS4Bp5tpdcCFvyDCcznCCOc1iCJzkGm3TA6w34rMOCL0/pSW3DuJN2qrvEpQXptM9Q0i/A4yvkv+gmRlyfIFzdTabVuc4qxaZapPCE2bn3C6KxPcOqyPjn/MZfCQ5dEtShFD2Tl0RSLNfFPvyOTDBNv/Vad7rhTKQKLr8GkJY21AFexY+kRLkRPnVOm5JFh1K/qPJqhZuelqZbe/Y2OMp44TPs0EDcngW5bXcF2N5yOHB+E30vfwccaVEcrRbiTpbfCLWKYxhSZ1CCUFnKL7YllZj2VTDhRu0UrAc2IQ/9v7TQOOKzQ9o26OYl3EvUL17Ix1yKMR7Pln7rjrwohvvSNwLIuH1rtJTsLtFGPbU9UDLdFL7QRMh5m/4paNgebu6aJkVoJIMys5cL+oFkUcTB46zYxNzwoScu3tbtCUOkZZSFzwtjv8InW9nW+fHZuoacxmEa7HsIzvpBx4qOSAIWoosNdeJBApbbw4oNvBnKmf0YPcr4rMc9FJKU9AwHWDI4tEFGiwb6ztyU8aPT1EQWy6b+H6JA+L/6u2IF/EnO/zC4tvrfSW3yT/SukluH1uc+U3liwVB6AsDevbcHr7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(2906002)(66556008)(86362001)(186003)(6916009)(31686004)(508600001)(6486002)(83380400001)(31696002)(53546011)(4326008)(316002)(26005)(16576012)(66476007)(8676002)(956004)(36756003)(8936002)(38100700002)(5660300002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0FXOUx6aTZyRFlzakFHMDM5NVgrL0JVUEllRFNVNWdZUzVkRXNzU0RzbEZz?=
 =?utf-8?B?blZhd0FkS2pNQmVSWWpYRXVGOEkrdlRxSnlLSzNTMDJJcElQMGo0TmVpN0cv?=
 =?utf-8?B?TWdVWkVrZnZ4cmVONk53YnFyM1pWaFdFbEc1ekhCVFVTK0YrbUVKUjg1UmVn?=
 =?utf-8?B?ODFCSWt6VWw3MW1ZTkNpZDYrSjZQT2pDdVUwM2tFUittS0doNGZJbVVLZTJB?=
 =?utf-8?B?VmVSRDZqV2RBVTc4UGkwYkd2bE9NZkJSUDdKUm9aUUVnWCtYVHdCbHRiSDB4?=
 =?utf-8?B?NEdUN0ZGMWt6eGpxVENwTUR0RFhBVEdBVzFZZSsvUkVZMFNNRmVQclZIR0tP?=
 =?utf-8?B?aGVyeExrZEcvQUdNTzVEcWxqT0d4V24zVHNkT1pCc3lRMDk2WFg4ZXA1d1My?=
 =?utf-8?B?OXUrc2x6Z3NjaTJid2s2VDJqb0lPTDlvS0x1WmcvZGc2ZURrSEZGN283NWQ3?=
 =?utf-8?B?b2NFS0llQXp3MzdjRmZZclVPdWVCbHZHTE5XdzBLRzd1ei9KRkhUcDRvM3ln?=
 =?utf-8?B?aEdvRDZxclMvM29CU0tGeFlmZDR6ZC9HeEhzaVRGcjJxUE5wZ3BVVWVXOUR5?=
 =?utf-8?B?UWR1MlFXeVBudDV3aENueFQ4czI4SWxqSDJoUnVRbEZMSk9RZVJ0VmRmeTgr?=
 =?utf-8?B?VjMzMUJUajZPdUxBd0VyRXZQbGxTcys3MUg5WmlobThxQ0F1Q2VsYm9PTkRj?=
 =?utf-8?B?ZzUrWGVXWVRhYTVuM2RlZjdsTHp4bStkb053a245bHhYM3VjRnd0WGVPSkFi?=
 =?utf-8?B?eDQ1NXl6a1NaMFRya0RSZVJ2YVhWcG0rV0dVTk5heG5SdE85QWk4dSt1a3Z3?=
 =?utf-8?B?bmttODNPd3paVXBiZ3VGWEpYS3pld3Rhc0FOaElZUURZZnZ6NUQycDZlM0Vx?=
 =?utf-8?B?ZkJhUzV2TGV1ZGlweHVPOXNGazNqQzBpT2F5YjlCNXRKOTBBOVE0THFmZWhH?=
 =?utf-8?B?Y3FvQ0owWVlrUjcvZjVwc2xyR0FRbVhQS3lQT05OSmhySmtJUWxkZS9vcldR?=
 =?utf-8?B?V20xUm5yREw4R0hyampFQ21rOFBUZFh4UXE4cWRPRU8rdWkzWnltYnkxWEk3?=
 =?utf-8?B?MjRuU3lEVXdjVTNqbjREd3pSUDNvVUxwVGE0OTdTaUpMaFpFN0pGWTA3dUVF?=
 =?utf-8?B?OExVQkx0VzFWRC90L1ZPOTF0bG1xVXQ1NDRHZURlRVlzbk1BLzVjcEdYM3JM?=
 =?utf-8?B?NTk2Z2tyeGhBdzJDYlBjczc0TU5VZVkydUFsLytESFlNR25ReUsvcmRCQk1J?=
 =?utf-8?B?cVlodWpIV3ViUXNRREtNaVRqb1V3K09STGV1Vjg2a0VWRWl0R1l3cWNwdmph?=
 =?utf-8?B?eGlMaXpSa0xSdUhXSDRUVUhZM25OUE9zc0kxT1N2YklkOHFpb1ZodVJ6WG5W?=
 =?utf-8?B?VUtVdllZVzVadmdNcTZMYzNTNGJUUklTNUwyc3VhTlJTVEI0Tzl1NGZGYjFK?=
 =?utf-8?B?Nk9IbUUzc2tMeS9nMzlBWTVVcitTOUFwZVNFZldRTisrM2pZczB2OUhnQ1k5?=
 =?utf-8?B?V0o0cWFzNmdaWWNGaUtuMER3WXg2TzUwcDZaODgzMG1sMkIyNjVpaXdkSWta?=
 =?utf-8?B?M1piR1lSR3NtMGxwZWRiclNzOWNCUG05dUpkamhnOENQNUhDYWxEMDMwcFFP?=
 =?utf-8?B?MWxabEZZbkhMWFFlNWdVUzdnQzJ3UVJOTUhySi9LOGUxN281V2ljOG5DWkhB?=
 =?utf-8?B?anZIaXNrZFowY2oxNWJGSWZoZTN4ci9RNEN0Q1V2UmlNcXNxOWU3cmRkVmR5?=
 =?utf-8?Q?OY/HnKusTAHOFNo/Il0zR4zV8fcrjK9312vPNqG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb274df-df84-40e3-84de-08d9781f7c57
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:04:47.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3tQHYXsaOWkoBK7/N9we58RcGZ/YH1YCyHXsd4zh+eOFBF0wAxSNS8VVDb63RvLxV8oo98xkuoMRqrZI1tAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 10.09.2021 18:23, Stefano Stabellini wrote:
> On Fri, 10 Sep 2021, Jan Beulich wrote:
>> On 10.09.2021 04:52, Penny Zheng wrote:
>>> In order to deal with the trouble of count-to-order conversion when page number
>>> is not in a power-of-two, this commit re-define assign_pages for nr pages and
>>> assign_page for original page with a single order.
>>>
>>> Backporting confusion could be helped by altering the order of assign_pages
>>> parameters, such that the compiler would point out that adjustments at call
>>> sites are needed.
>>
>> Thanks, this now takes care of my primary concern. However, I (now?) have
>> another (I thought I would have mentioned this before):
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2259,9 +2259,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>>>  
>>>  
>>>  int assign_pages(
>>> -    struct domain *d,
>>>      struct page_info *pg,
>>> -    unsigned int order,
>>> +    unsigned long nr,
>>
>> If this really is to be "unsigned long" (and not "unsigned int"), then...
> 
> Thanks for spotting this. I think it makes sense to use "unsigned int
> nr" here.

I see you've made the change while committing, but the subsequent patch
then would have needed adjustment as well: It's now silently truncating
an "unsigned long" value to "unsigned int". It was the splitting that's
now needed there _anyway_ that made me wonder whether the patch here
really is worthwhile to have. But of course acquire_domstatic_pages()
could for now also simply reject too large values ...

Jan


