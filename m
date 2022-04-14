Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A652F500E39
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 14:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304729.519443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez4Z-0005mS-Um; Thu, 14 Apr 2022 12:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304729.519443; Thu, 14 Apr 2022 12:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez4Z-0005iw-RR; Thu, 14 Apr 2022 12:59:43 +0000
Received: by outflank-mailman (input) for mailman id 304729;
 Thu, 14 Apr 2022 12:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nez4Y-0005iq-19
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 12:59:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf3e9636-bbf2-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 14:59:40 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-AXqV1K0GMI2CBTIzD8fnbw-1; Thu, 14 Apr 2022 14:59:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7931.eurprd04.prod.outlook.com (2603:10a6:10:1eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 12:59:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 12:59:37 +0000
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
X-Inumbo-ID: bf3e9636-bbf2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649941180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5uNq+bMf/0KXclaV12fWHRa6rfIrh4+xcGNYdN0tNk=;
	b=hT8XIRaBvhCDMjW0WCntQsIZN1u98Qq8OtJDOI+WEKLCc66gDyaC28UFrPlZrTjKRNVnNY
	DE8t/M4w/6dknUDtmZicfWYCVKKCUdMY31A5oiNDO7RWfPfw/xOxtJlY+3SjxjhgrLKq2F
	5nxb4px1talD2lkVVIRICLem8A8fMLE=
X-MC-Unique: AXqV1K0GMI2CBTIzD8fnbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPsagwSQ4JBQJpwMqf0caw2n/zlxDvqmMb8Yotiwcg4V6LM7HaAxG9zHmn+HI0f+QMS8HOHv9RCxmylweS4YJ5lPl7qkx+wJmkD3cvKYvo9VvYl6vuD7feu64Uk7tT1i6T1M1uopGggpdv7HjPRBDGtNQBKs+v5rW76Fm8VgPfCdEeK61YW7cyd2eB4dH0cmECXeZnRWSI7Qxuki1fp33vCjT4XXSbIRlYqbndUJgiJP/wgzahcgC9X4a4lUFgSvJAN7mHnEDb3vUnOslqFd3tKPIptibd0H19OD+cPVz+gzU/zwLiB3+BgyCgffql/UD4zowFphg5OOiargzdhpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5uNq+bMf/0KXclaV12fWHRa6rfIrh4+xcGNYdN0tNk=;
 b=OVkyLS3M55iyUx49koU7UndC1wdvP2GXiFUlER9Zd2nGdNHsnKD16ADbBh8mqtVjcBvLcO5vASg/E3T1cTIwpZyQZpk9WBGx1WYXwHhMmbRj/3wWFFQfHyZXTPOXnHln33PQ67Vr8GOCDhwyCOuVHiLvaISayNTulFuCzz/FMCG98tmTYho1B/wOZffQ5HylfTeog2w4rI8b2JLr9XOD2b+RAlilluq3mFifhKqszaFVJD6zrqjJrYeN9ImDYcAsFrupNt+kevYEJcU7VdlhJkj/fIEACch4BHxqZr/Y70WCHO+dlj5ERsnySjc/t+HxEg7ErhCFlrdLPrpcnwJp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44589528-2655-a949-0fd9-f30b6f2fa09d@suse.com>
Date: Thu, 14 Apr 2022 14:59:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] x86: annotate entry points with type and size
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <531ab7f7-ce5a-12b2-e7e7-528c26f9ff7f@suse.com>
 <22df182a-762d-711e-5191-d4b628904085@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22df182a-762d-711e-5191-d4b628904085@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a95bfea2-a3f0-4929-50af-08da1e16a177
X-MS-TrafficTypeDiagnostic: DBBPR04MB7931:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7931B3E0D215FD0E47729855B3EF9@DBBPR04MB7931.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bQjQA74OMugbZVxQNHSe6eTTVpLh5fnBjfFeuqvomnEyyXKivGoH7tX1xr4RqO5E3tu8Tb8Zc1ZJmXF2mn0huQG+x+TL8hsOxUunkG+5ilIe5ztJST6rhON8HPhdw5iVyBojb0IotsIt3QS3pc9d8/8WrSJeUSEHOUvLi6nFjmzvHM190e4yN6wtaugAo9LgisECNFTynMCYwBD7Gx94SOf0fIXFOVuWbCfFE1zrjYynR+9/1SecQBQWdXHZqKoPgooUUoWGHpW3zZndkmX4IXmIgeGoX2NxEUhh5fEcLbWb7yg99OE3C3NKxHFAsyFW70SZGnrfDLTr3/L1/iPECwh51go//tp0G8coe74Z7dpnB87jcPGscUE0ncZMvGo3H1zRRtiDlEtlmKd1Apj0PvFkLA3SUd9VmEvahuQkBEbW77ea5Xb28ys91KjbgdArwauVSZRFy55PHzG2WGT+Ta9SKToGiH2uKEtMSK34lIgG32AXoeIg5V6ubG4Vl184i72s5TFjtelrpT43OS9I0cZrj7SVIi0wURXvwaVE5QopXBWI0L7a6qJxT3rkXLHenOh9HYQ/Wlfmeic6scmzMaf6OA0OiDX5+plZeasFHYMuM5iGP/jRfmUPq1qiJ6CewAASv3ApeHaeNY29GH1SbZCRl3ohp326uJmcPsicoumshUH3jnG+IniQ3LCI0LOPc34ZXaszyn5oskPhqJZ5V2dd4vZFQzUxtQ5y1guXjLqgs2JN8yiL0nxt3zo/p4SVIsGzorr+wIloxksSIspmpuVnI50eW5GZ+M3LtY79tj+4OqqLLG8qza758PnvgA7yE1zZFbTkV1D/jSQb/OXhww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(6512007)(5660300002)(2616005)(86362001)(54906003)(31686004)(31696002)(83380400001)(316002)(6916009)(6486002)(36756003)(966005)(508600001)(66946007)(6506007)(8676002)(4326008)(186003)(38100700002)(8936002)(26005)(6666004)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGE3aVZ3QnJWTGxiajVxQ1hMbFUxRFZtN0diM05XTVVjL3dxTGtuZ1FqRi81?=
 =?utf-8?B?eGxHa2RMMGV2bUhWeGZtU2Q3QWtxaVRyUWpQdGVua3Vuanc2WUNweDBLelhE?=
 =?utf-8?B?Y1h6c0V5d3VVRDB5YTFRUnB0U0tLZGxJRnhLR2p6ZDQ2dU9iUjkvSnE0eVo0?=
 =?utf-8?B?VU1yMmxyd0YzOU9GMitHN0lFc2hUWkh2SFFvWmV5NnRHaUJMdDhFUnF5RVBW?=
 =?utf-8?B?WkplL3RCSHdHdzZQbU00d1lsSUxQRTI3UVZuUDhqWnBEWmU1SkRyOE8rVVJO?=
 =?utf-8?B?L0NwZGE1dGFJbWkrOXBLQzhDZnVWdmltaHJseHI3WVFQRC9JeTExdVRtZTdP?=
 =?utf-8?B?ZzJHSDZ4bVpPVCtCQnN5Y0RqOGs5Zy9FNlduZzA0YVhSTjNNNmRHR1Zac3kw?=
 =?utf-8?B?SUk2VkdqL1Y1Q2Q5Uk0weERRRXVRVHJ2ZGE2RXBTbXV1NkJWcjQxeXhDUDE5?=
 =?utf-8?B?WkFCeXplNkh2MUMzc2c2VDdKeEFqd3QrM0RoVjB6QXJpRmF3bFY4anhZVVls?=
 =?utf-8?B?UUFIa3RjUi8wNTR0Wmt3UFpPM0FsRnFOVFBCN1ErZkJXazFuSC9STzJWN0Ux?=
 =?utf-8?B?amNySStjQ2ZGcjBxdmFKbC9nKzVXK0Q0ck5rLzF5QjM1MkkrakcrUlRnNnJB?=
 =?utf-8?B?Q0xxNWorbG4zdXJpaDFBamU5bkdXWHVTcHg5VTFQRXBITjJMUWVhS0ZXYnJj?=
 =?utf-8?B?aHR2ckh4WXBRcHJVaVRINm5Kb2FDWFJqSGQyU3VpSXJjbjNPbkhKOXdYNFhO?=
 =?utf-8?B?aHIyd1Z5K2svTDlyRnYyb3BZVXlOZE44eithejZKOFlXNE1XR2pzdFdEM3d5?=
 =?utf-8?B?VFgvY3FNWjhCK1ZPVlFEdkppVDd0M2l2ZTdjODVCOXdKOU5KQVpGK1lUSUtW?=
 =?utf-8?B?VUNJL29Zb21UR3N0eFh4cnoxWkJjaVpzdEkzQ1UrUDF1bWo3YVMxZnVQMW9y?=
 =?utf-8?B?OUdlT0dORkVVNGhZN3hYQzhSTDZYWjQ4cVMrNjVGVHE5WHZlT1dhL2dTYU1I?=
 =?utf-8?B?aVZCMTFuZGVRUm9FOFpDaW5aVXBEK1dJcDNYTE00NjBYZkR2VWpBUDJ0OXpL?=
 =?utf-8?B?UHF1bEVLcHJKVjIwd09rRUNqQkt0NW85b09OcWdlb0tIK0RibjhPUzBoVjk5?=
 =?utf-8?B?VTBVTEtVWlRmRFF2d1V2MzZVU2tvY2VhT3NlSStMQTVJOWdBcmlyaGx0SWpT?=
 =?utf-8?B?KzVMcDBML2NQSUtkVWdIK2lxVUpCNWR4eVpyM2FsVGZSZk1hK0MwcW9uV2g1?=
 =?utf-8?B?TnNUVks4Z2VjK1JqNldMalQwNm0wL3FXRnp5SWRBalZ2UHdQMDBqZ2ErU3Rt?=
 =?utf-8?B?MDlhWDBDTUl3czk4QXBHR04vU05TRk1Ib2lGQkFYLzRybCtwbVRGTzgraXV3?=
 =?utf-8?B?RzczZFRHUkRUeEhCNkYwV2J1cGsrZEdwUEQxaXVRdVduTHU2NlBIOExVeGtV?=
 =?utf-8?B?MHFld2JrV1h4aWRNQlIwemI5V2RuRGx6UkFsS21Uc1gyV2M2Q3hDODBNYjdm?=
 =?utf-8?B?WWhQTFZSWmJlZ29IMlEyTWtVZGlmdE9SMUJsRktvb0JDeDhYKzVmd3RiUzhl?=
 =?utf-8?B?MmtXRFpYd3o4b0FSN3hKSGp5eVhhRzYzSjU4b1VSTXovZk5PWTMzNm5ibURB?=
 =?utf-8?B?OG95R01iVnBwejNJRlp2ZlJGSDBwaWVySHJDc3J1bURWQ3NEQ2xydFBFMHZo?=
 =?utf-8?B?Y3dMS0VXSmg3bEt3NU03OEpsVU9oZG9qN2RvVE40cnhnL2xWUndxOEF5QTFk?=
 =?utf-8?B?aWgySjI1U3ZSVUE3dG9kZ2kzQWRqYmpQM3g0UHFBQ0k3dytyenY0VnFtbkkr?=
 =?utf-8?B?a0NsRi9za09UdU9tVWNpZWdTa3hjWEc4S1VJSHZNencvNE1uRDVxWUMzdXFa?=
 =?utf-8?B?N3pwd1pXcWEwTkg2c2x0UlNXRm40TkFrRThJTUU0RFk4OW5EYlRad05MVVRa?=
 =?utf-8?B?ZklEMGxBRlI3UU5haWM5dnE1ME1VQnFFU0JVM0hPd21kdjJSTEY4VlpwSnBm?=
 =?utf-8?B?L1VDb0txdVZFM0JqcDF2OFpPYTA5UzhNQkR1YXlEZGVCbFNtOW1hU0U2WGtO?=
 =?utf-8?B?bXhQQ3RkQW5LNnd5MzE5TzVoMnpIUG5FVXN5VHVtbnhtaUxEMi9GejlUUEEr?=
 =?utf-8?B?R2pJWjN5OW56eTdVdHNQSldBUXo4amZ5L1EzcVUvdEVuVUFycnhqZURhMlg2?=
 =?utf-8?B?akxnTEF4Wnd1OFJ3N1JuSmlCY3F5ZXNGUkhOdnVmRCttS3BoZTJRYVNXd3Z6?=
 =?utf-8?B?VmZxSUU5NExINHhpUDl0enhVem91TjdrUTl3alE4MEprbmVvd2U3SjJNNVBk?=
 =?utf-8?B?d0NsVUpzTGhOaVc0U0F4ZUE5c1hiRCtJa2xQTUtQYkN0aHFsK25hdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95bfea2-a3f0-4929-50af-08da1e16a177
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 12:59:37.4505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yl1eLjuep0D67yruPLUT8VA5QhsNV81sOEUXYEwdKBP1Dc+HwNTnB56i/YjxOIYYoriRSzSPEojPN7biPj3F4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7931

On 14.04.2022 14:49, Andrew Cooper wrote:
> On 12/04/2022 11:28, Jan Beulich wrote:
>> Future gas versions will generate minimalistic Dwarf debug info for
>> items annotated as functions and having their sizes specified [1].
>> "Borrow" Arm's END() and ENDPROC() to avoid open-coding (and perhaps
>> typo-ing) the respective directives.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
> 
> I'm conflicted by this change.
> 
> You've clearly changed your mind since you rejected my patch introducing
> this infrastructure and starting to use it.

Hmm, to be honest I don't recall me rejecting such work of yours.
In fact I have always been in favor of properly typing symbols,
where sensible and possible. I would therefore assume it was more
the "how" than the "that" which I wasn't happy with. If you have
a reference to the old thread to hand, I'd be interested in
looking up what made me oppose back at the time.

> Given that it is a reoccurring bug with livepatching which has been in
> need of fixing since 2018, I'd organised some work to port Linux's
> linkage.h as something more likely to have been acceptable.

Taking what they've got would likely be fine as well. At least in
a suitably stripped down manner (looking at their header they may
have gone a little overboard with this).

Jan


