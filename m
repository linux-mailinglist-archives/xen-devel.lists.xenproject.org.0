Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818054AD575
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267987.461756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNdv-0002Df-Bs; Tue, 08 Feb 2022 10:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267987.461756; Tue, 08 Feb 2022 10:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNdv-0002B3-8E; Tue, 08 Feb 2022 10:22:39 +0000
Received: by outflank-mailman (input) for mailman id 267987;
 Tue, 08 Feb 2022 10:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHNdt-0002Ax-Oj
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:22:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 091851cc-88c9-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:22:36 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-N9f3hAklNLie3t0S6JToQA-2; Tue, 08 Feb 2022 11:22:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6236.eurprd04.prod.outlook.com (2603:10a6:10:c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 10:22:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 10:22:33 +0000
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
X-Inumbo-ID: 091851cc-88c9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644315756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9zMbSiFz8/dLVrBO6IvGWf/x28O2Ku99pcxAmJHLaMY=;
	b=DhCp9huhXlMWWkdLCS8FcWC+I5cj+52TEWQk3Y0CBEHpCs6tbJjydjXAOGlrv/VP8S0j3r
	h739NwS4kuZ1rTgNNk/CthG344AvJiDSDFCpN+Wc76u5pI652RxBTEtN4txtiwvoWVjmLo
	6shUOD42fySnt38xMKIshuxx5DqsGR0=
X-MC-Unique: N9f3hAklNLie3t0S6JToQA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXevsg5vNEJP7l+HBhu0bUzSO1+IEx9Y/0d7X3KrI7gIF2YatvpEWYrK7I2sVDIL1VuWqJ51E2maRYTN2dEKdjQeclPT5tD6lYzev2dHubp8LFkl4u1u92NlPCPPbCoCwqC1F/U562dxtqrbCjTZGhM5rHEeEz9wQzH15ezy3PSsPkfS2ARIRxew50zvttGWPJk7qeel2VO+GDFZKU3Erq+jLK+1bQGKogkQlJulHrEqoj3PbsbmcU0nMiGFzeddKrFs9dRw8u//CjjfGSgrqLHWVmq6uP0RjGyKU5BhdyG+fjN1D+tlTLrPLMkYDTr07YJkhVQPacTfpYiOCMrtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zMbSiFz8/dLVrBO6IvGWf/x28O2Ku99pcxAmJHLaMY=;
 b=VM+YgIg29C3FmUCvl/UqaWA4fYSwwU9AFw/Uy9LNXYOEZC5GM4/v/n/powX7Noe9bEyw2ojsbFga9AqXAHct/H+SI4nQpVqPKjWDII8MD7Iz6Fz4kUH1EhhuMoz2TRIfXS9dxPtjOBTpKNWWrUpzEZR00a/8VW4HzIXJ8pCmrdUy/LAReC+GrqBCKk7cNcX51clOpg7tR179gRIxLoGQeW5yAKfFL0wLsuSDWp3ZlS6KVcA0+BCVf8AAJ99Dqay2l9bTxHFeqMypCE55DacOYuyI6b28szouXT5vmLEsG5wMv7r5Fg90XGekHJ8Y4ERHc3W4j0CVCs9yhtw7c801Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc405f74-9101-586c-9a2c-0fd0ef018f96@suse.com>
Date: Tue, 8 Feb 2022 11:22:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 1/3] xen/efi: Always query the console information and
 get GOP
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-2-julien@xen.org>
 <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
 <26cdd9cf-15d6-a463-b1bb-28964005f618@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <26cdd9cf-15d6-a463-b1bb-28964005f618@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0030.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08b18b7d-fbed-46c7-d1c6-08d9eaeceb9e
X-MS-TrafficTypeDiagnostic: DBBPR04MB6236:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6236BC2A6D411C99A2518EFBB32D9@DBBPR04MB6236.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f53zSk0jqbmfpvCuOXNC0MRr6SMMBICF4n3pbojV0XRcXo/7fJBNHblrn408I3BnNYHUvAYjFUuBs3Y4TUPPPvFSgnqQMXj899Q3j7/r+vpkiOorcMkAjnb2LB4tnG3C0AMSIZ0jWzxlQQePZxpJVryE4UYQmRxFYl4W6zrFl0/dB7863REy+RT2Yk1gJ27gw1JixrKP/3/fnYIVUJc7Kod+K2o6XxxntFoNYchBYBvyyAu8HFAQ/7gcWNZAjEuqcacM6XP4jNQe4ss4UO15IxXQ3xEOkR8ifHaOih0wdDKNo3T5KtxAqaSprzbRGc8ngUv0lYi1wq0IDfcDHoolaY/+CSSNM21M60lo9x+zZqGNnz2hVYdZVSbRKxVaTykDHUVY/Vz9NpAfGfeJj0C2b2N86e0NrkVoIqOwDoPHJaR/FPt9ji4LnQnXlOBFN/KfHriJh9TqhgdL+3+pVmxge4o/52doCBy65Hwhpsa9wHy7vIBm9ymmGc42XkO0lVz/lsettpxnfMNx/xnzb3kD+f3R5iA76YqWVe/x2pDbF5G9sBDeUmAlAXZ+CZdh1HJftQpNSWDhEhZ1T5Ot+JXgVdVXZAKNvGkpVXHvltcQCZdNTOqrT3WE3sey5hK6aa4YAv02+xUoeRvUn25vTEzrTEcbQzK8Rse2hXkLtG6g70urgVGxSJLy+8m6NMXkVBnF8+id++pB9X3fT/ZYvaJVLFSrc9Ks68tZ55gTDR7pDck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(31686004)(508600001)(66556008)(66476007)(316002)(31696002)(6916009)(86362001)(2616005)(6506007)(38100700002)(5660300002)(6512007)(53546011)(4326008)(54906003)(2906002)(26005)(186003)(8676002)(36756003)(8936002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW85bk8yWDBQKzZTN0FEYm1ZdnpYZm1uejdUdUhETlBjS0xsQVVzUUQvcU5z?=
 =?utf-8?B?NEFJRGlKQmt6Z0NmYXBQS0pCbEhCQUtyWCtIYStEOXJEY080M3JYdVEwQTk0?=
 =?utf-8?B?TUlHZWJHWnBkNDFwbmZ4MUNwYnk0SUljWXQxYytzREVQNFkwaDB5K2ptUVhU?=
 =?utf-8?B?dTdSNmkzSytHaTY5SVYzcnZQVEVaYUtlaUJvOVI1dnhMTHNpVTJjYU1kSDdP?=
 =?utf-8?B?dGR6OHFjVElPNjc2bkhNZGd1L1lOSnBUZzY5c05YZElseitJcWZ4dmRvTlFz?=
 =?utf-8?B?RnFUNDBubkhZVU45b2RXSVdFYTUybzRnb0NsK21wM2krQlJ0ajVCd2tkWHl3?=
 =?utf-8?B?cndYcWpCVGVKNW43VVBRc3RBMWU4N0hBSk1TbU1KQ0s3R3l0cENiRDhsWmRi?=
 =?utf-8?B?WHk5VGd4U0lDV0dpVGduZVpDeDhVTldwRjd2dDFxRUwxK0xJNXBjcjY1OEx1?=
 =?utf-8?B?UDloWUd3THFKTTdMK2xvRmQ0aExkS0kreHpCUmUrRndMVHBmbk9UZGdBN3dx?=
 =?utf-8?B?aFlTbERWRGJBbzFMMVFHTkx6M3FJbm1iTnZVWktaWFNpaFlRY1UwR3ArclFt?=
 =?utf-8?B?VFhjTCtZNmR6aHJnRkRhZGZyMlRGZElPMDRDeW9PUWE0WHhFcmQ5ZFFlcUxL?=
 =?utf-8?B?eHJJcDhvNk1RY0xTMFNuUEpJd1liUjIrK0wxdk9DK1ZjRjlDZUFOWWsraXlJ?=
 =?utf-8?B?OXhYSWduR1lDZ0s3eXhZc0hpSlZ5Rk5VcFZqZE9Mb1p1ZDhpRng2WkRIa1Rs?=
 =?utf-8?B?K2Y0SUVCRlhkNnNsK0JkUFFPSS9RNXlQZjY3b2t5WDI4R3ZhM2p0aS91ZSs3?=
 =?utf-8?B?YUdNLzlKdm5CMm9adlBOK05pdmdrZ2FFQjBaWHBzb0d5aElyRWk2alMwTGVo?=
 =?utf-8?B?M0JVakVEOWlWLytnT1kwVHBQSHVEUXNobll0RzFrcDFUNWhJeXlWUjZJckM3?=
 =?utf-8?B?ZHNPYzE0SDJ5a2F2a1hyMXY5RkU5ejJrOWFDNWFmWkVTSzZySkhkVlVtclZH?=
 =?utf-8?B?dUhzTUIvZEFZd2c3Mi8wQTJKVG1NOXcraGFjZGtMdm9XcC9PMm51QnhVTkpS?=
 =?utf-8?B?enB4SER2VkxIUWlGWUJtVVp6WUcvTzI4Nm1MSk9vazRSemcxTWRnRG9mZXNK?=
 =?utf-8?B?NG1yZGdicUE4dVgyR2RFdmhrNWdGcU1qbVNFczlIak5vZ0Rsc3lpV3hydEtR?=
 =?utf-8?B?OVcyTTE5aUZYTzRkbGsrSy83ZjluSEo0aUgxRVNBZmtIcEs1M2VhK0JYQk9u?=
 =?utf-8?B?ZTJSTkM4THJ6M0NKendRSk82WDNXcVVyeGVBVzMxOTN5dkVqdWNKa0VPZkpo?=
 =?utf-8?B?TVJ4eUdPRWV5OGZuMkNkZkdrVFpsOUVNVWJKQkM1UlI0YjNHNk9leklITGV5?=
 =?utf-8?B?dXlmcHI0MmtIdVMzMmUwTm51U2tTaFNDeUE5dS9xbGRYWk93S0lLcTFPb3JD?=
 =?utf-8?B?cFdoRWZYTkhjTjBFRlFqTWtZV1hzRlExWUFyZ2pKRXdjWFNIQUdQNmxyVTI3?=
 =?utf-8?B?UnhLQzBaakc3am1EM1laN0o3SGxpVEE4WkE2RktqT1c2YVM4Q0Vlb28yaGc1?=
 =?utf-8?B?bU9mQndsRnBlY0VsN0lNaHg0QUVtWTFxUzBLR2FLYlUxQUlOdFhxcTRWbFJ0?=
 =?utf-8?B?ZFNhRU9hZTI3eWRLTVppV2U2ZkhpekYrZG56R20wbUZ6YjAybGZXUWJmV2FM?=
 =?utf-8?B?Q1FnbE9tc211V2NiektMNHgyU0VXOWFyUVk2WnVkY3dZVCtXdmpzbmpPZ3FY?=
 =?utf-8?B?N25PRk13aDA2UVE3cVF3M01JSlVGMEJQd01IK3gvSmI5Vy9FUEt4Z1NMd2Vw?=
 =?utf-8?B?UkUxUmJucWZkUGRVTWNWMm1Ob3Z1TnhJUmsvYStwYWtTUVYwanBlaXJkZXM0?=
 =?utf-8?B?c1N2VHREV01tRnlLdGVsY1dCQi9BeWpMallkTnduenNtNXNRdXhTMmQvcUFF?=
 =?utf-8?B?THlybzF1dWtVMDZWTVlHVGVtUmI1ZFVCTVhZR09xQktNZGlJeEFobGVsYmxp?=
 =?utf-8?B?YVNlcTlCUkZBQ1pUTmJ3NVBOenhNOXFPRlp4OGRvWXhZbHlwYyt0K0J6dE16?=
 =?utf-8?B?U0h1Mk5ZZzFVT1pIY082eDV3OEY3ZmhOSG1jbWZwRGdqYjBEYWRpMGg3dE1W?=
 =?utf-8?B?MDF1dHhuOUoyc2d2TmVpcWxDZms3VDkzSEpveFdOOUJhWlJKZHAwUno3MzYr?=
 =?utf-8?Q?1dPdy5LPOswh2+Z+3KVZoJg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b18b7d-fbed-46c7-d1c6-08d9eaeceb9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 10:22:33.7277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO1OSrCbpEpcW7w0nojfbfdzhexhE1QN/djG8A0tOFUgNEb5xK+WMBtdp/wJrHKG4SNh0BluONoC5T0cA/IBaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6236

On 07.02.2022 19:52, Julien Grall wrote:
> On 07/02/2022 08:46, Jan Beulich wrote:
>> On 06.02.2022 20:28, Julien Grall wrote:
>>> It is not entirely clear to me why the GOP was only fetched when
>>> the configuration file is used.
>>>
>>> I have tested this on RPI4 and it seems to work. Any chance this
>>> was done to workaround an x86 platform?
>>
>> This was done so in the context of making the code work for Arm. See
>> commit c38cf865ec82 ("EFI: ignore EFI commandline, skip console setup
>> when booted from GRUB"), the description of which explicitly says
>>
>> "Don't do EFI console or video configuration when booted by GRUB.  The EFI boot
>>   code does some console and video initialization to support native EFI boot from
>>   the EFI boot manager or EFI shell.  This initlization should not be done when
>>   booted using GRUB."
> 
> I read that and still couldn't figure out why this was done like that.
> 
>>
>> What you say now is effectively the opposite (and unlike back then
>> x86 is now able to use this code path as well, so needs considering
>> too). Cc-ing Daniel for possibly having a GrUB-side opinion.
> 
> I am quite interested to know the answer. Linux is able to use the EFI 
> framebuffer when booting via GRUB. So I am a bit puzzled why we are 
> preventing this setup on dom0/Xen.

To be honest - same here.

Jan


