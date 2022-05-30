Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D6E5377D3
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 11:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338455.563232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvc7U-0001iR-K5; Mon, 30 May 2022 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338455.563232; Mon, 30 May 2022 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvc7U-0001fo-H3; Mon, 30 May 2022 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 338455;
 Mon, 30 May 2022 09:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvc7T-0001fi-1m
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 09:55:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0ed2b24-dffe-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 11:55:25 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-wVzK7pjzPCSaW73714e8Gw-1; Mon, 30 May 2022 11:55:24 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5211.eurprd04.prod.outlook.com (2603:10a6:10:1a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 09:55:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:55:22 +0000
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
X-Inumbo-ID: a0ed2b24-dffe-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653904525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0j/myxkkkGdoPdEsWqT1KymJQXDepJ7roZwg9grDmY=;
	b=Jmh9409xT5k2HRcFHtm+9JPQIU4a4Epj8EXmcqyuZ5XFR+QjVX8dnL/6gZyDU1ZaZfuubC
	lTwqRYfclg++8n3IskQo3KFt13FICwrfAl70I4pFbJ2Zb2Smddc0ya8WCf+/5t4tcG0qe8
	NEezsdFzyEo7+EkHTteG1qJ4YanDuj0=
X-MC-Unique: wVzK7pjzPCSaW73714e8Gw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXsg3PYIYNo1Nsd5Yuzz8ybHnErsp0WSpY1sBJv55jq15rNqgQ03cXo2wQyqSB9t62zHrs8E4StxLC8cNLWujUBGK9xcVyp2tJNdYdkUj5VULr+PrTb1woOAHd1hOBK+sNghc0smXcVDUwYmzttVYknU8AJTlu2hlzVQ0QCaQblT5KEbLSot9qxayg3usItEkT1/Ufj2CeiChLaKEnvDErPRPS2iV5ltIIXN4sYfHKt+XjbvWSqGNu4gqlWm62dzx0vrAgNEJvrOafF+pQLzwHIkz8VYwIrv9TobZP4WeVzWOFdF5CsVx6sHp9FD5v/lSiRe7GTv3uP2Qff9618CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0j/myxkkkGdoPdEsWqT1KymJQXDepJ7roZwg9grDmY=;
 b=Mr3CMj+tPClPOA45DL0ANa4w4ogaUv15C3LizIHoYsnnxMKd9joWqEx+fNvVKhZviO5G+edvGA45qrVvvEvsDbwZPkhIDTQ6t7TNW7EBQ0H7zATw0XknHHUIRYC8GfEYz1NjDyyWFgMeHF6o4mtCZJag7d5U6eUKXN2JUAyVK1itEXFnpPziz19CoxugWJ2oTOVCJ0cLiNUKKpCpd0DXy35gGHDfcpGQn80J9K6bf8knwLmWDDlr0H6ge8X5LSSKBt7ywvClb5DoO6bEApfcvh4mYxcVW/nOTBDerGtdQQ5LYBNZrlNxRL7Onp2bV2MAJkPmy220MJisepTAlUbvmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcafd462-f912-8c59-f1bf-32f65ae45fd4@suse.com>
Date: Mon, 30 May 2022 11:55:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
 <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com>
 <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com>
 <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
 <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
 <c0b481fb-5172-3515-764f-dba9f906c049@suse.com>
 <alpine.DEB.2.22.394.2205271602320.1905099@ubuntu-linux-20-04-desktop>
 <3882cc86-72a7-8e19-5f7b-b1cc89cce02e@xen.org>
 <5b790260-dd5c-9f62-7151-7684a0dc18fa@suse.com>
 <0cc9c342-f355-5816-09e9-a996624c6a79@xen.org>
 <6d6115a9-2810-0c9b-bba3-968b3ac50110@suse.com>
 <d4c6aa78-cc94-274c-db05-c62ff0badc9d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d4c6aa78-cc94-274c-db05-c62ff0badc9d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f7ad597-4708-4b79-f24a-08da422282fc
X-MS-TrafficTypeDiagnostic: DB7PR04MB5211:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB52114A3C1E9D211EDC76554CB3DD9@DB7PR04MB5211.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LHm1ftGxIj4+GtGBZw6U4R3LoFKAXfeQZ9r8pzAGO39IjcedKtK8MKKUih2vC2LU4mO0y2q78LLn1czCOtHMG71oI6mVQ8SV9AdoMcH3AH4FplELs4vstUnCzIYigXFMpMryj0ZjK2Q2DpypAYjg6jgbAkS2tL16Em+agvnSvcuXs//YPBYQUJGeIPcp1dwacx67zTzY8QgRD7wGfPg8EDPbrJMnq13n9wlAudwIjcdl1NyrAQgoSmO9uKe/BaM7OSvG/X8puGGujSHnVMCb12grtBSg2T+Z0BMUc0RKUcWPVyFaJekwhmXJgZJJH4UpLQbmrLQHbLi+9BiV1wJUEjTy0ldNW0dUeEzEDv68PMN+dGgwFNcn3Q6qPszfkTzfmA9Oe5Ud0TmrOhlRi9gix2XrXMFYSRQAuZMETQKPSBxS1DZuAPeFlFODcTltK3JNi3h/xBCF58MG0kNQaXJbk9gz8JGercRgdU7Rzolb31dgLab1VDHEWHG61uAldZvnXYTcXn4xJc0Sat9cK4Btrkb+NchiwQc0Rv3zutnC+jC+Fl/HhMj0YHpSbTPH0rwemgFFrrwjpgyPn52N5Q56FTq0R6QD7NsAGGyu8Pi+2EgY/xDLSDfx95KF8I7gDVqyrHpPya2SVeG/Y0wQBWvUpJTUzHt8kiYhLhO0utywvWQF23IqVsHXvWszOBIMc4XRG2DRNkKQz99xkcSLNHJLuGU06Urpjemds82Rb4vus98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6486002)(53546011)(2906002)(508600001)(38100700002)(86362001)(31696002)(8936002)(5660300002)(6506007)(2616005)(6512007)(26005)(36756003)(316002)(6916009)(66556008)(66946007)(66476007)(8676002)(4326008)(31686004)(54906003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2xvSDRuVHJ5bVAxSkpITTFKTUwvb042M2xOOUx2WXZ2RnRPN3c3bDM5b1Bn?=
 =?utf-8?B?YkVCK1Y5WDl4Y2tEK0xMNkFFUlZMTk83cXB5dFFodnFGVXVMQ0Z2NGJuQ3hi?=
 =?utf-8?B?RmpGTmQvTDRNbjZYZUVlWjZrTnh1MTM0amF1WG1pVTFwTnM1T1ViTjNKKzZ0?=
 =?utf-8?B?UVZ4NlhDdUJTeDJOam5odnAyK091Mjcwc21SVm1sa2ZJaE5vTGM4bElvM0Ji?=
 =?utf-8?B?Z2VSNXpvbG82VVR4Tno3SWNYSitnd3RLemdBbDdnU2QraFd1eVJpTzVGb2RB?=
 =?utf-8?B?U0NCMldMSU5RSWRxbjVSa3dpNkFVVFNZeDVyeTJDeHRXcnozNE9wdU1haXhx?=
 =?utf-8?B?cjY1cnhVSnVnNUVpalpQTVpLNEdlRUNWeExsVkZNazVubElCcmorVnBDM2ln?=
 =?utf-8?B?UEZxaDlId1VVZytyZmFLdjFOVmlDekFZeS9OZ2RER1JCcHRZSXNyaVJmM0Vx?=
 =?utf-8?B?YzNBb3gyUTdjaUhzWTlGN0t2am5LQXVCTnlpUGlXekYyNnJyd1hiV3hqOE1p?=
 =?utf-8?B?NjM0WGtxU0xSbE9Wak82VFVtUzNNQk93SHVUN3REWU5sL0t5ZzBCUmJFOXpW?=
 =?utf-8?B?QXBVQkx5cHNPUUpRS1hHQzhtenRuRnIwZ0hEZmlqYVFjRGxoYzdwV3RNMjF3?=
 =?utf-8?B?OTVEUlBxUFlZZ0VPWit4SXpacDY4UlRBQ21SS1UwSTl2b2FGdXRWWmgyUTNm?=
 =?utf-8?B?UGRqQTExNHZ5SnZySTh0WDdNUjlWb3BQSms1TFV2bCttRU9EbWhocTZjMXJZ?=
 =?utf-8?B?RVVuM1hGYTlyQk51bWMvTTVXNGZRSWtZUjBUdUlWaElBbGVPMnF6MDZCSzUw?=
 =?utf-8?B?MldZaW12QW5MM3pBV3o2TVZuOGZXQTI0ZXVCSWhHc3BCbzYvSDllWUtCRmN1?=
 =?utf-8?B?S2lzbUdYakdoWWRkMEhmOGdwU084djk0NFUzTTBLamJZYk9LdGFxd0pWYUxJ?=
 =?utf-8?B?YmtwN1JlL0FSa1F3QmpUWmI0TnA3MXZYR3ovcVp1dmpMVnl0NUNzb0VFR1Fp?=
 =?utf-8?B?cFgzd2hncGJ4RG9IcnhsdzN0K1EwaXIxditlNy9FVkdwNWNzaEFDaFEvdGlW?=
 =?utf-8?B?VDJETG9zOXlmMFdhaEUwaElnYnBXZzNKMGd0cmk2b0ZRUThSbElUbW90UERY?=
 =?utf-8?B?bXdwaW52eE5JM1VFcmMxMC9mREdQV04ybnZ4QXErRDRnc2UxYUFCUG9UMmo3?=
 =?utf-8?B?dlJRdjFPRDAzOTdhWFlISzB0N05JQTd1ZmlQU3VRMjJiZUpzM1RaNDBUMGpM?=
 =?utf-8?B?QkJZcXFya2lReDRuaTYzU2FtREhvcC9mS2FlK2l5YS83MkhTWlIrQ3JyblVh?=
 =?utf-8?B?VUpSUzBRNG0rRC81NzFkQlhJWVViWFpWakpoMTJOOEg2MDZKL2h1aTIyQXFT?=
 =?utf-8?B?bG1rUTRIcDFFeS9Xdk0rdlBwcDN6ZVBRbkRLblo4b3BnNURZMFB1T2ErbEFx?=
 =?utf-8?B?SGJVWWJFa04ydFZDTUpCcFZ2cU5hRlh2clh4K3h1WWtvNUhLblBPMFZtZkJR?=
 =?utf-8?B?RytCcXhLb2ZmL2ViS3NUaGpvVXdIc0lpM1dzR004dzlwVWl6dEFuWWo2TW13?=
 =?utf-8?B?V09ZS0YrcXVXbTdpMGEwUWlCUmw5SGlHaWRqN0hCY1NrOUxyQWZ1K083U0Q2?=
 =?utf-8?B?MWlaMGVFTUJtOHZUL0JQaUthcThwMkgwVThsYjNaYWEwM2drbzJVeUV2Rkpj?=
 =?utf-8?B?aEdPcnVkbjl2UWxIQWRqS3dWMWl3UE5WaUhWVGkyamRjeDJYZXlXS3kxM3RZ?=
 =?utf-8?B?Q2dHSTl6R1JHMlJVaERaK0NLQWZKbU9XL1BiSnpzTElhb1dJQ2RMK3RvaGNv?=
 =?utf-8?B?L1ZaazFHcHB6d2liOFR0OEVGTWU1Z1hRbkVoREJUdXNIWCtKWWdzSWlhTzg4?=
 =?utf-8?B?cGliUDVDZThUQjZLcmpWbUUyN0JSMXFzNUpTOUpYZk1xMFkrU0JaMFNsNE5y?=
 =?utf-8?B?cjJxeGZMdHp1SEkva1UxYUg3ZVlFQUlEeGw4SEo3MUlab29SQlJJQytxY2Zk?=
 =?utf-8?B?Zk1oSzYzcDFlMU1jSmRwT1ZXenRyVXI4bmVhQ1lZSlgyTUlkZHNOZkw3S3ND?=
 =?utf-8?B?VFBEUFAyT1plWmN1NVZPZmhzQnJoSmJYbkZFRVJtdGp6VVBjNTR2cUxJeUhw?=
 =?utf-8?B?aFhRWXFLeTlUckIwZWFBVDgvdWlYSHlOUTdjNmlIN3ZwU092WTRsSFowOEZl?=
 =?utf-8?B?QkNteUkwY3RCUHR2c3ZpSS8zOFlWVlVvWnFwNklaaU0waThXc0dYZWdmRnls?=
 =?utf-8?B?cDFDV0JaV1hFRkNVWG5qTWpCZFhWeVIyWVJ6ZUo2TU9razdBK2FUM1E5aVFl?=
 =?utf-8?B?RkVBMHcyTm1VUE1lSlpZU0ZTbk1JUFFCNnFtNkJ4bk5rcHFVRk9rZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7ad597-4708-4b79-f24a-08da422282fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:55:22.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ojL0UC6bY53XS35139uz8Z9tYaVI21ZkGfZDI4W6jfipjoRnd9pGiTQ7o+bvY+UO3SNbNxhgxwXDlBQVJFp6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5211

On 30.05.2022 11:41, Julien Grall wrote:
> 
> 
> On 30/05/2022 10:33, Jan Beulich wrote:
>> On 30.05.2022 11:27, Julien Grall wrote:
>>> Hi,
>>>
>>> On 30/05/2022 10:16, Jan Beulich wrote:
>>>> On 30.05.2022 11:12, Julien Grall wrote:
>>>>> On 28/05/2022 00:16, Stefano Stabellini wrote:
>>>>>> """
>>>>>> It is possible that in specific circumstances it is best not to follow a
>>>>>> rule because it is not possible or because the alternative leads to
>>>>>> better code quality. Those cases are called "deviations". They are
>>>>>> permissible as long as they are documented, either as an in-code comment
>>>>>> or as part of the commit message. Other documentation mechanisms are
>>>>>
>>>>> I would drop the "as part of the commit message" because it is a lot
>>>>> more difficult to associate the deviation with a rationale (the code may
>>>>> have been moved and you would need to go through the history).
>>>>
>>>> But this was added in response to me pointing out that code comments
>>>> aren't standardized yet as to their format. The alternative, as said
>>>> before, would be to come up with a scheme first, before starting to
>>>> mandate playing by certain of the rules (and hence requiring deviations
>>>> to be documented).
>>>
>>> I don't think this is necessary short term. It is easy to rework a
>>> comment after the fact. It is a lot more difficult to go through the
>>> history and find the rationale.
>>
>> We all know what "short term" may mean - we may remain in this mode of
>> operation for an extended period of time. It'll potentially be quite a
>> bit of churn to subsequently adjust all such comments which would
>> have accumulated, and - for not being standardized - can't easily be
>> grep-ed for.
> 
> Well... Scanner will likely point out the issues we deviate from. So you 
> we have an easy way to know where the comments need to be adjusted.
> 
>> By documenting things in the commit message the state of
>> the code base doesn't change, and we'll continue to rely on scanners
>> to locate sets of candidates for adjustment or deviation commentary.
> 
> The part I am missing how documenting the deviations in the commit 
> message help... Can you clarify it?

I understood Stefano for this to merely be for the purpose of justifying
the deviation (preempting review comments).

Jan


