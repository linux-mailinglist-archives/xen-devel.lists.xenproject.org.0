Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE151189F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 16:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315122.533508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiIT-0007Sn-S2; Wed, 27 Apr 2022 14:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315122.533508; Wed, 27 Apr 2022 14:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njiIT-0007PN-Nv; Wed, 27 Apr 2022 14:05:37 +0000
Received: by outflank-mailman (input) for mailman id 315122;
 Wed, 27 Apr 2022 14:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njiIS-0007J0-IE
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 14:05:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ddde23-c633-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 16:05:32 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-vB3fFBK_MWWY2s2L366wEQ-1; Wed, 27 Apr 2022 16:05:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 14:05:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 14:05:32 +0000
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
X-Inumbo-ID: 19ddde23-c633-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651068335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/n9Q++3q0pYQZYbGOt+1Me5LfJnrKYNu6hI876RpWg0=;
	b=cTOji2sFZHj0IEwiWtc/swDLx5euYrFnPdqBKLf5wFlrDmy2/bw6zdeERmgJVELwTCMjGj
	VlAaHYp+OgOk4Dyf3BCXJDzbbFCnvkLW3SXdWPArqC7eZX8MMzBBsR+xKSImbOUe2con+Z
	u+WT3oNXnfHw2DJNhuIfDsWH1sjlgcM=
X-MC-Unique: vB3fFBK_MWWY2s2L366wEQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arJhKsAikM60e3EI4DbhOQZDjN4qyAWWrR25FJhSVqTh+C6aTc5DkSbvkdT6u6dpCTWcx6GbpqBINFEq/74Xax0eaCQsu97jxVi14JRVsNwsmg1J+nQCVjpKvjvEsuaMN8O7mRJ/EZTDJi8nCQyywG/M7Dic0NErYL0LvrsAM9FzBXDhShz2u1VU8w052BVOPDmjuGILKJ/8kygnYXIB2KwKQF4LWQOj9OrGJIuvCV96o5Acm+iSiSNx9L9aPcm2A3bpEETCmQWn1SKJ5QpBJA9ikuFEJHPkiffJs5+IJtnHz6Oi1Rco6p1AbXbXw5IwoiNF+XSn5Am3pb45jemZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n9Q++3q0pYQZYbGOt+1Me5LfJnrKYNu6hI876RpWg0=;
 b=kR0dlUVRZC0z/WskbhjIA2mR26lctGlBWEV3SYgwVzE3bohvYQ+7j0uRLfRSndCCK+rzr8dQMcHkTFekX0YbV+w6qGxx57Ma/VQsDQRFKVOt/Yy/Jjs4t7YM6mXmAXIVsccJp8vbGtNhijPDFSXCRsgEi4O8icgTJRv6iDhav8aPOmQyzWcNVTn2ZFf810kICfder7B3VoGp0DFoedy4L2x82XLx+9Xb/HLFlY/4r1SzfQJ7c0709mkRlX80cVFyTlGJgBgZbRCM7jkGPDqwEyTM68Y+WDmTXd8m7Mq9nkr39b55ylWCRM/jxojQ74GiY17EyONV5bj6ihEIMHRNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d1b2626-84dc-a899-aab9-6b4f167c9d2b@suse.com>
Date: Wed, 27 Apr 2022 16:05:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 02/21] IOMMU: simplify unmap-on-error in iommu_map()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <cc4323b2-e074-f86f-eea0-9cd6a802bed8@suse.com>
 <f61ce2f9-ef08-6f50-29b4-e7e09e7059a6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f61ce2f9-ef08-6f50-29b4-e7e09e7059a6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0015.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6632ddf9-e780-4d33-6bfb-08da2856fe18
X-MS-TrafficTypeDiagnostic: AM9PR04MB8841:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB884186BEBA7BFCAF918C31FCB3FA9@AM9PR04MB8841.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cdlkBcgSFc2Bv7dVev6qowK5QHv8c5Yn0reHy4QFzdhh5AACc70V1DemlWQABf0RQNpV5vCHd8b5Si8SQXpuezpKvxnhIGoqoX/Nd8sq1y7mZZDFXCtZ7vDT+fHiPmlTsLUvzMMs5g4xXdA2Vdl1GH7pFtGH1HExALCUdEQw4IRunqz1VmyHz9NCnnwx8nQpWbLW7TkHCWHaxSGYgtL0OPAQO9sNiLqsH+5NPjcN5zXNFbP+LvfBjfwkrv8pm1LGN/EVG2fE+TEF7K7kAvSznZ2YVsg8f5ebSW1dlK/eKPSVSQ1BkVyjTw+EbuKxjMWBDIuQmeNyp5VQPvR2HMsgRuINl8XMHqZm+sDfwcBvqseMuEHZqbzcn6heGVt4MRigNrhU8nx3ah5/3i0ByEcGb5MkV76AjeVa7CNDpdtrYER441g6iAVLLjrwOzf584lZAmf//xnYp/lLD2BBcJ09lIMevGZhPs3QA4yYZZlL3Ii+P+nyBhmU2imjUfqTyIsp1C8hkrqe5nW4xVZ9d1e82m209F8R+x26Y8BKBveYHQP4uktDwhrvIzjEDMYKq3Rd7w31ewj54wf/3QAifDDq1mzSb8BCPd5fG89rNRDix5iYoN3a1m+vfG1LxgvN1WmqURrbaDrmqe09imkIYcyuaaF70IkVHPEdDCoOGYW65kVcgETxsNHDpyTIx+QkEZUAZg+xQxpoeQN/jRbaE3LrIMkWevlGZlbI0jcD95YYMjRN7nwZMs+bn1KClcqBoUnl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(5660300002)(66946007)(8676002)(66556008)(4326008)(83380400001)(66476007)(2616005)(2906002)(6512007)(186003)(26005)(38100700002)(36756003)(53546011)(31686004)(8936002)(31696002)(6506007)(6916009)(54906003)(6486002)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVYxZldZbmVQRFQ0ckJ2T1h0elhoU0hLQlRHODBJd0JJTnc2Zzhkai9KakpK?=
 =?utf-8?B?Ym5vUXBBVFA2SXBVeTE3TFNxTlNvdGtNTG05cVFhR2pNWUxzQ3JpRGRTSW1M?=
 =?utf-8?B?U2NyUUt5SEtvVjAySmgrWUtCRmpJYzFtb1lHTkVCaTd2OGgwUFEvdUgxSFpx?=
 =?utf-8?B?VlNyY3ZhZHN6UndTRFIyMTE3SCtlSDBVaW53RTV4Q20yYyttNUpjK3ZReXhB?=
 =?utf-8?B?allTREtXOStiaVBEZkJVRS9ubGZzLzNzVHRzYmZ6V1BLRXZlUXcrVndtOEI0?=
 =?utf-8?B?NWJDVmhWYjRMRjN6N3BrRlFqLzVxblN0SlVJcGc2M1piNzhzcWFSZDhveXdp?=
 =?utf-8?B?M1RtSmxINWF0L1hraVFoTGRacTlMSzloZ3JFdllLdWhFTzYvUHNSNlZlUUNY?=
 =?utf-8?B?ckJCR01pMlkzanhvRkNtQUFFZFgyVnhHZEp3RytLTjU0cWpIMHgvZURCU01F?=
 =?utf-8?B?YldxZ1pMWW9td0E3dUkvb3BBMmp5ajUvTkdMaUZ3UFpRcldCc2tMUE9yb3FP?=
 =?utf-8?B?UEE4OWsrQUV5VEU5SlkxUHRMZ1BsSlV3NE1qUmt6WE54NTNPcElNc0llSlpF?=
 =?utf-8?B?ZkpldmlkSWVsTnRGNzRvbjBTYUR4ekFNT0QzNVpqU3loNFozNElVZ3pnZFND?=
 =?utf-8?B?Rm9lTVlwNzZzemEyVmEwTWxncUtoUGJTdFd0dmMzaE5VcVZkMXNxajV2TGg1?=
 =?utf-8?B?aG84OWFnZVFEUE9oVmsrcU1NbTNUUFhEUHFxTEw2dXZCME5OOWRuaW45SmNS?=
 =?utf-8?B?cXNEV2FET0RjV3BGbTV4eFBPUThSMW5nUzVxempxSXpkY2UwT05Maks5Z2Nx?=
 =?utf-8?B?QUFCME5KMm1GNm5mSm5VbFU5N3BNaWp2TjdJODF1K3VMb01NQlNaVFd6TWRS?=
 =?utf-8?B?QUhJUGwyakwzSXo5d1ZPZHU0UjVHdkFWQzJScDBaWUduTHhiSVN2OXpoWXhy?=
 =?utf-8?B?cGdvREVPRW9mSWdkNHRTem5GbFpxdjJNMmlFQ3lKZ1pnTWtQaVhabW8vb3lu?=
 =?utf-8?B?VGgwdkJpY0xhTTUyVnpwOW1TSEJaODJFVE1iVjdMYkVzTmY3aWl3VEt6UEVs?=
 =?utf-8?B?SS80Y1BrSnJoMW1FdFBPL216ZW91VERtZlFFM1dUbGFsVWVvMTlTZDBsbkJ6?=
 =?utf-8?B?dys0REhSQy9WaVI3Z0dIeWRHRCszWWYxUll5ODZSZHFuUUJhZmxPcldMeXlV?=
 =?utf-8?B?REJCdTFlbE5WNVEyNk1ZUEJUSEZVaVlCMXBUaWZxQVFuVnU3dS95Mm96VFNT?=
 =?utf-8?B?MytHeUVVd3F3Vlg5UldENWh5cnRNK3cwMS9weHF0YnNmZ3lDdlRvUTdYTFN2?=
 =?utf-8?B?Znd1WmxKNEJudGFVTURxMC8xTEFpMmErRzBDZExjcGx1L3B0bGVQNnpEU1gz?=
 =?utf-8?B?OTZ1emZhNWJmUW5sOVVVbkNLSElZS3QzaUFsSjRzZm5rWHlVc2NFejd5Y0Fk?=
 =?utf-8?B?SEgzMXJmYWxER2x6RU9TdEt6Q2NwQUp1ck9wcEMyUFV2L2xMSDVCZjZ2dnpa?=
 =?utf-8?B?L2dWalJsenc3Z3RpanF2RDRMUEt0K2U4RWo5U2xLK21BcmVxNFJaMnJadDhB?=
 =?utf-8?B?SmdjMVE5WEpReUlYTGdLMVdxVDB0V1ljR3ZpVmNuNzhCb0JqbjFZTlBSSFN0?=
 =?utf-8?B?amR2dFd0ZGJKU0htdERJa09kU1duNVZKUzcyRnU4ektWNnRJRHRIRURsT1FL?=
 =?utf-8?B?Ny80T3lvWWpKUEF0NEwxZnhXNzNoQTBRODRDQUNYOVQwMUkwVTRiU3NVdDQ5?=
 =?utf-8?B?eVVRSUpQQjAxOWlnQVVRY0VoVWV4M2VrcDUvcitTTXl3cXAxTDVmb2V4R0Fn?=
 =?utf-8?B?MEJ1Z1FDT2ZGR1dKRGtSTy9lbndyeExneXhFaFhzTUNPYWUwVERwNGJPcmw1?=
 =?utf-8?B?cXNxMk1XaFExQmhlS0pJc3ZqS0ljTmRtQjVDTFRIOEhQa29TRHYrS012TzU3?=
 =?utf-8?B?WFltRis0Wkh0eDJoZ2RCY1htWFo2cmkva0xRZ1U1cCt5Sy91bklCTXI5aDNR?=
 =?utf-8?B?VEUveUdtSmxuZmYyVmRkL0x2b3lGckNKMFFpZGplUFI3R3R0Zkx2Z2lWWDVz?=
 =?utf-8?B?SkhGdXFWeEZXeE80aDBhOGVmSUI5UCtXNnBiMkgvMmlCSFFiMGMvOFNYNDdC?=
 =?utf-8?B?bisvUmk3UCs1NGtCM21QZlhhWXZUSE1BUi9Dc01uQm93MFdZTFZxYUpseUJw?=
 =?utf-8?B?aytwMS9ibW05dmd3aU5qVTdhWVp1UmMwL2c0dzBmVzZLRW9raG50YStvNUtQ?=
 =?utf-8?B?Q2xXM1I2MnQ5dE5TYitPN3FNdnkxMnllYzlmZmQzOGhtMFd1dUlPZ3hRWkxH?=
 =?utf-8?B?eEVxWHBlNlN1U3VWbWRaSzB0NGE5cytiM016NzlObkdGZkhOc2lJdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6632ddf9-e780-4d33-6bfb-08da2856fe18
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 14:05:32.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irrFlsDpiYHyUEKWiR1AcUPJz36jew9DOS33yG3qRuQxRO2S1aioYfYoMjS1Et/lzlzhF7HkDOASHCOtZDwqdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841

On 27.04.2022 15:16, Andrew Cooper wrote:
> On 25/04/2022 09:32, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/iommu.c
>> +++ b/xen/drivers/passthrough/iommu.c
>> @@ -308,11 +308,9 @@ int iommu_map(struct domain *d, dfn_t df
>>                     d->domain_id, dfn_x(dfn_add(dfn, i)),
>>                     mfn_x(mfn_add(mfn, i)), rc);
>>  
>> -        while ( i-- )
>> -            /* if statement to satisfy __must_check */
>> -            if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
>> -                            flush_flags) )
>> -                continue;
>> +        /* while statement to satisfy __must_check */
>> +        while ( iommu_unmap(d, dfn, i, flush_flags) )
>> +            break;
> 
> How can this possibly be correct?
> 
> The map_page() calls are made one 4k page at a time, and this while loop
> is undoing every iteration, one 4k page at a time.
> 
> Without this while loop, any failure after the first page will end up
> not being unmapped.

There's no real "while loop" here, it's effectively

        if ( iommu_unmap(d, dfn, i, flush_flags) )
            /* nothing */;

just that I wanted to avoid the empty body (but I could switch if
that's preferred).

Note that the 3rd argument to iommu_unmap() is i, not 1.

But I have to admit that I also have trouble interpreting your last
sentence - how would it matter if there was no code here at all? Or
did you maybe mean "With ..." instead of "Without ..."?

Jan


