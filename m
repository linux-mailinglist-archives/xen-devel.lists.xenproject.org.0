Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2334C52B24F
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 08:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331658.555207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrDCh-0001HT-Iv; Wed, 18 May 2022 06:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331658.555207; Wed, 18 May 2022 06:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrDCh-0001Eb-Fd; Wed, 18 May 2022 06:30:39 +0000
Received: by outflank-mailman (input) for mailman id 331658;
 Wed, 18 May 2022 06:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrDCg-0001EV-2n
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 06:30:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07429427-d674-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 08:30:37 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-Aq_EgDsIPLCNu43gCEn_KQ-1; Wed, 18 May 2022 08:30:35 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 06:30:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 06:30:34 +0000
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
X-Inumbo-ID: 07429427-d674-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652855436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRha0q94rdBud0ylljLnX/WSz4bAkEUpYGAp5fitZfQ=;
	b=Wjc8NVwuhL+4sYdJ4PFXyszAfcrA4FRy9NyLcb4TvqeAIfLiL9Qzg0XX1VZdu1DlWwOZUu
	rqPzTcqIz/ET/nVx5MwNQHZNHCWEP+lQvaUi1nrqTxTO8UXjDqqo+mbL94mLyRWgPAgLRT
	Hnk/LR6lRl1Pm388oJU2i7FkFyV0KVk=
X-MC-Unique: Aq_EgDsIPLCNu43gCEn_KQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtqDS5ax9FQ0f5Qjoy8GNWjYhmjWYrU0ah6R7C7wELArNAONklMNSFWXxYDrtTbFm3VfEH/6JUJdrSJ6wf+LGL6chn8yDkTzHk3UdXDP/3jv96lFyUkr77+zw0HkgpQ3A4w6BssSr15SYi57WXEb+7Kncgjz/iiFyZbFLRmsov6Hbk6vmU6Yizfgd1IwNpdJdkb1pEbhRFNVNO0MiLLY+LNm1mMXpab2/TpRHsvcO4rExjaegyY5qfYaTLwrv4aampHxi87/5ejUPf9jBbL/YSnnYmtRcJiWJKuFtahK+vrtzSQdqT2rkeVckkfPRgaYmm4XOWzyOyUOmNAslhs7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRha0q94rdBud0ylljLnX/WSz4bAkEUpYGAp5fitZfQ=;
 b=jZLb0e8Iye1SLLhqagH7mSd/fujKUPiyhmg7rlF5n0kHJ1YMCq4mtzHsFLibHvQPuA8xT1Np9okV2ojeVfwN5sKNq0MSX8uY3c0lXYkIZNv947Obcq0elFXffv5JLf9SoYCqwuojx0nyY4UqujsWVP96ApUKetBSLQktYHV8Nvt5oooECZ2FsfwBoWeLK28aTA33vdZBW3YOAFkk/mHM8z0MzGInmLPBVAntF+ln21aOMuh0mBedSc4V7AUW/s2ctLLy+EebnTujUxccE2Mw1YvhQRw5/TzQKDYS4yDbtDXsZCgtl5Wtc5LNvIefTqH2FMTghB9lYqKtcTUDDtpqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b46cd18-8ef7-f0e8-c58f-a0332f07d921@suse.com>
Date: Wed, 18 May 2022 08:30:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/6] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
 <20dd9308-3cdc-4ebb-61b2-e0a71e808697@suse.com>
 <DU2PR08MB7325E3D7474C737E35D18174F7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325E3D7474C737E35D18174F7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4fe62c0-d52e-4daa-484c-08da3897e9e7
X-MS-TrafficTypeDiagnostic: AM8PR04MB7812:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB78127EBE3D1652000C8980B2B3D19@AM8PR04MB7812.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qC23hf4f+dvnozN9e8l+7i+vQtKwMGscU8QraocxCF0SMOSpylQ55fQGklOnugQS7QXJfm53s3NPaaPRfUlJQpG9vdetl4tMBKcsN2dWRABxlq6WCLYP9Wwg+RjrR3Z3MuEljN4A7cl4GLhTRocuuvemK61J/9uiOTuGPeKHApQOdCMvPM4BgSTpMAzF9IoeUQ3N1nXmopK57J5M4BGsewbv8K5k1hQfWR7JECwRccsNxVewFlIs0aXbuNX+AzOLNaBX84ol4RpuxIed4caAYjB/2WuBZD8wut4A4I32RpXK4L5v07Bu8wfe/ncZOApSg5uEDw5Ygav9YWPy/fe9DTIPb5wJrnXAs/XdEas/Zf4fWAAa7kZazuHZGXckvXzx6H1LSqcuPPXScwYYWpfgbOHawTmtKlNaSBM8eQveTt/zjVM6s1Uws677X1E7OsPFIRRtQsGg6LQnrsvcfji95mwpyQUbVTTi4ScV1F8UeoIiicu/VOqcIExWuVpNvrZa9TtY6QJSZUhLaHct2Z/aniLV1QdtTXrInvBNEvlrYmUdoiGvdLQlvyDvOXNE/4N+pIuowI52YxWGB9HjIBIp8UbE1yZdsdYn1Alpp0i0DkSJIrGCmK1PP+LMhcCbf0lGLXZBJt5KLEcYrwgjk/kXJQVoA6WPQJuiVhk6nuLU8z+oLMxecuI5ArAPIXEKGcLuIYGnCf0SKPI9EoSis8YFK+lUITmuOIvhr5SHjM8YU6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(83380400001)(508600001)(8936002)(54906003)(316002)(6916009)(38100700002)(186003)(2616005)(53546011)(86362001)(4326008)(66476007)(8676002)(66556008)(31696002)(66946007)(6506007)(5660300002)(6512007)(36756003)(2906002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHJDSTBsWTk0Q2YyUkpDZXNOclNWdFJRTHRtWTVsQUVuaTRuSmFWcFg4SG5Y?=
 =?utf-8?B?TXdkZ0hqR3Y0TTNtU1FMZ0grSXpWS2Rjc0VOWnlBMmFweXluK1c2alJXNm5Q?=
 =?utf-8?B?YzhFSWg5c25Iemk2WWZLTGVPdHZEODlCbWxmNGhURHM3TXBDbS9aMUl0NGxa?=
 =?utf-8?B?b2N1emI1L0lKZmpvSjlHVmVRWmFCaWlRUWpHeGkxNWZxQ0EzYU1tN2h4V0h5?=
 =?utf-8?B?cnVJMmhsZ2JqT1BRRjlVMDNRb0ozVGxOWGV5RFhDdFk5UllmRnY3cThyNzFo?=
 =?utf-8?B?enhvajNiTEhlTUR1bzE2U3BOTUcwdHRHcmtDcjluZjlTWCs0QnBHRHlBMzRW?=
 =?utf-8?B?ellPYlIxdjg2TWVNRGRQb2ZLRnlsY3liZEtJY054WkxkY2J5V3BMbGZQN3cz?=
 =?utf-8?B?WTdETGlPbDJqTkhRclhkZ0tnK2hTZDdmU3RpNEpRS2JiVytBT21oMytsSkNK?=
 =?utf-8?B?RzkzVC9rMENONWZDa2tSWENQc0piMGZvOUI4MUR0bmlTa3Z5OGZUM0RBS1da?=
 =?utf-8?B?ZGw3eHZJaTdzQTlNTGxTRVlXclFJV2pyQ0xHcnpWMDdBYnZQMTZxS2ozb1Fx?=
 =?utf-8?B?TGpWSW1Dd1I4NjZ0aStlYkJwVGN4RzE2T2dGOWM1RFhWUXc1dEJZM0lYNHFY?=
 =?utf-8?B?YTBvU3ZjS2VJL0RnZTdSSHFOZW56MkswbGI3TlF5bW9HZFFOWFR1YjNnd0c4?=
 =?utf-8?B?R3RVYkFjOVh6aHBwU1hCUEE0RElXcGF4L1RvQzRtd2pKR3FrRHdrTDlPVTFM?=
 =?utf-8?B?Nnp5V1Znckx6QVJBeWFvMURONmVyVUttOFBGaDdMeFAvRFo2ZFozb2xpYVhG?=
 =?utf-8?B?dkZaVXBUV1AvT0JpdTZlVUM0QUlQaHVWUlRSMExMZWwzTU5zdW1GNDJWUkNV?=
 =?utf-8?B?Mk9Nak5PbUdtMHhOTlp2NmtVazBCbEFJcDRlN3ZuRmlyWjRSSlhxTGpsa0dh?=
 =?utf-8?B?RDFUYTVsWGxyN0dwcDRZdEFpTHdrR2ZLdUdKWkcySlJxV09JZXV5OTJCODRl?=
 =?utf-8?B?Qm5NcmdlOVF4V0RIbnlKYVpVc0s4RmZKY2RFZ2NSb0xQSUVCVEtldW1VbmNH?=
 =?utf-8?B?QXg0ZXluQUVQSkxCWXZya1BOYzg5OFB4b3d4dTQ4QVl3Vlo2K29ubFp1Z1Z0?=
 =?utf-8?B?cS8vQU1XM1RKcytHSGJjZkJ0Q0ljdlBGdkFRVWhGbHhENUlLK2haZDhLNlhN?=
 =?utf-8?B?UjU3QzRNVWtIV3dTeXhJOGNQQStUZWxpQUJUVmp0OGQxV04vZWZNTTN1R0h4?=
 =?utf-8?B?cmJsSnlWRndpaEk3U2JNVmdiRjNSR29yR2s1ZjdpZU1CWjZrVkdBUU5PSytl?=
 =?utf-8?B?dVhudkhWUCtKL3A1bnJPMEtJTzExenQ4Q3dxNTJaZ3RHVndwQkRuMGcwdkJG?=
 =?utf-8?B?ZGFvUGZzd1c4YUVTSHE5RVc0RkkwSkJKUXc3ZFdpeG9yRnJZTmNhaUk2V2lK?=
 =?utf-8?B?RUZ4cFl4RkdPYW5YOWtyVXBTNkE0Y1lTYWVaNnlGaWwyMXU0VlJDNHAzVXcw?=
 =?utf-8?B?eXJOdzkrVFN4NWFUVUozK0RIdTJmK0lDRmpsNHMyVmFhZWdGcHVRWk4vZVU5?=
 =?utf-8?B?U1V3YnJTdTZDSU91TFZvTnBKNUlFOXljbnJSdGZ0MS9BeCtjTkROd2NNY1Zs?=
 =?utf-8?B?RU4reFRGVGh5MzJPVjhGbzUwOEQxbERiOFdxTUMxN1NlNGpBSktEQkhSZzRr?=
 =?utf-8?B?aDFaTnZYRUZ2c2ZSd0Y3SWplcks5YldkSy9Gdm9sSDZUenVocGFvOWdOcFIr?=
 =?utf-8?B?cnh0NVltNHhuekp1M1lSdVdVSEowTmxsZ3ROU1cyOWx5VWNmT3dNMnZxUXcr?=
 =?utf-8?B?am9La3VPQkhZWExrV2dzNm1zUVFIc1BqOWs0M0wxNllaeG5RalRHZHVQd0lV?=
 =?utf-8?B?Z2xheThFWnU2Y2RQZUdpTk5IU2VHMmlOZWh1T0NnMFIxeG5lSnhOcGZlRjlG?=
 =?utf-8?B?aHBQZ0NtdWRNSm9nM0pJSDBmMWNaRHROTVJkb29zZGlCY1VQWVUybWZIK3Bw?=
 =?utf-8?B?V2ZmVVJVYzRXRGtJWkJ5UERRNXdTTTViRzNqRGJtZTVobElMaDJzUnRmRDJn?=
 =?utf-8?B?Q2M0ZFVhQ3NHc3ViSjg3MzBjanJkQWJTMXRjY3NWZDdURnFybjJDdEJHaEd6?=
 =?utf-8?B?WFhhRXNPNThLRjAvYmZ4dldCS0VzTXBNWEdQQWJiOGxsYmdmOUNqTGhoQVE0?=
 =?utf-8?B?QmRaeUh3cWxuakxSUW1SR245ZU9YWVpYSWQ5NkY1dDZPejdvZWw2R3NmeXI5?=
 =?utf-8?B?Qmdqak1lY3dhdUN4b1dHY2dPVCtHNFlRTm9Semd3RmhmSTRGd20zMmdaN29l?=
 =?utf-8?B?ZjMvS3Eya3Y0KzJxeFZFVlRzaDlnVnMwV0tnZFZLRWpwa0FxWFZxdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fe62c0-d52e-4daa-484c-08da3897e9e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 06:30:34.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5n/gV5PPAIwZYkdTL/N9FFeSs7nXGb4r4biPHZShQXYdE1rnmVVeE5vZGJg3FOUtyiW29Q5PjCNRE7CU9zsRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

On 18.05.2022 04:29, Penny Zheng wrote:
> Hi Jan and Julien
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, May 18, 2022 12:11 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
>> Liu <wl@xen.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 1/6] xen: do not free reserved memory into heap
>>
>> On 10.05.2022 04:27, Penny Zheng wrote:
>>> @@ -2762,6 +2767,12 @@ int __init acquire_domstatic_pages(struct
>>> domain *d, mfn_t smfn,
>>>
>>>      return 0;
>>>  }
>>> +#else
>>> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>>> +                          bool need_scrub) {
>>> +    ASSERT_UNREACHABLE();
>>> +}
>>>  #endif
>>
>> As before I do not agree that we need this (or similar) stub functions. As
>> already suggested I think that instead Arm wants to #define PGC_reserved (to
>> non-zero) only when !CONFIG_STATIC_MEMORY, just like is already the case
>> on x86.
>>
> 
> Ok, if you do not like the stub function, then what about I putting the #ifdef-array back
> to the common where free_staticmem_pages is used:
> #ifdef CONFIG_STATIC_MEMORY
> 	if ( pg->count_info & PGC_reserved )
> 	    /* Reserved page shall not go back to the heap. */
> 	    return free_staticmem_pages(pg, 1UL << order, need_scrub);
> #endif

No. Stub functions, when they are really needed, are generally preferable
over #ifdef-ary inside functions (for readability reasons at least). Yet
even better is if stub functions can be avoided altogether.

Jan


