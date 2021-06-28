Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D703B5E1D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147847.272937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqTw-00061c-1s; Mon, 28 Jun 2021 12:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147847.272937; Mon, 28 Jun 2021 12:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqTv-0005yo-UV; Mon, 28 Jun 2021 12:35:19 +0000
Received: by outflank-mailman (input) for mailman id 147847;
 Mon, 28 Jun 2021 12:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxqTu-0005yi-9Y
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:35:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d04d7be6-8270-418c-98ce-8437a2fc8d7f;
 Mon, 28 Jun 2021 12:35:17 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-JLOLGcG1MfiC_DSJLrlbRg-1;
 Mon, 28 Jun 2021 14:35:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 12:35:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:35:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 12:35:12 +0000
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
X-Inumbo-ID: d04d7be6-8270-418c-98ce-8437a2fc8d7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624883716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqO9UDVuUossHo7M/+agqwQGG+tXBLJ5Zyyux978lLo=;
	b=WbCn93Ykv70ACURWYPy03YmyS2VBxU4Q2Qkevxaeq/gP8qMcSLnyaA/K8Sjk+IFtMIjsEB
	NelqXLD8/Cu6rrZAiy2Gnjr5xzwZRseNGswymOHmxOCWd+O174RlJrRftfmTVGcMjfzJSs
	gfOgSeMooufpbe8al9mfuKhAZCttEzI=
X-MC-Unique: JLOLGcG1MfiC_DSJLrlbRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDrjMA4WhEUHiIYJkmajRHgmMKHUevW5HCXM0q9wfRnhq8XGYfwmWO7cRRXPjxCbeD3Kla0YqAk13hvR7Sy8mfswodTd9kwTgtYJpN7Il4CrBjRcgtOxXiJFkzCj20zymdQg9qVCEcbARQ4+uPrBdrk8I6QSf1127olUEtGG2rpT8YHTao53yFeUGNf0nS/4pTTAG8+Byt1POHz7nYVj/Mg7e3GjWlzkHv1haqJVLJdCQbFqq4w3knXtE0lYCNK+HNBt8V6dC3x60FwivV/tqWT9HnX4n2eiepG8vDjCJohU4VVpeHujntb0UcEQslWHOXvIRw4dfx6CiZwJBeiVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqO9UDVuUossHo7M/+agqwQGG+tXBLJ5Zyyux978lLo=;
 b=V+CLOLD+HNLFbtdZP7FOE+nmSFW2oeLoTHAYBxTsh+FCFKU8orXZz2XidVjhuGZqyUaOOCJDt5di320Xa4nWNUKzyPV2YosesnamvoBHGQCtD83mgrllTuLRMfr2JviGu5APf2WZk3C3Gsj+1nFZ9SxBYefuyqeNVc63BcwQyjfbkCfQAnDIfkGxQbzVgXlpcGVx4fCJFM1QpwQj+iZi+u4jlzSgOaPDPXBQKCRx5ElrfCValBZTuN+fSXidXnzPTG7E/xb+tAEuJtRDfain1WnGaCIiOXMd3oD2hFiU2OWHIq18H06xVLe7d8yiVQLilb/ah/8ZCIf75vjZ5wmATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: Regressed XSA-286, was [xen-unstable test] 161917: regressions
 - FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "committers@xenproject.org"
 <committers@xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
 <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
 <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
 <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
 <24779.18584.523983.904660@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c044998d-f7a5-dac4-1f7d-396e1be951a8@suse.com>
Date: Mon, 28 Jun 2021 14:35:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <24779.18584.523983.904660@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f5a1f99-29ba-4a01-b4f2-08d93a312cd7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606F2575639C57C68E03BCAB3039@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EyITUFPNsy3YrZpjUz9wmW9t2cecVFbj/6t76A5qkp4MRV7u+ItSbbQYFzaCl5VNHqtYo4Q6TKkJZeiRLQxzOTa9yc4WNb4JgPWIJLTGg0zyVFqh311fFIe1JA50UIgZJC3L9HuZTjEbdMBby4CeaTxgJV6wP3o9emmTB3vJoY5IcOp13ALwSXdM0npRizUi/kjhFpixOeYNaq2u/UsdWobrdcHiBRTHwPQauhcf6Z1OnkCfWgia9OSF7Y9mBtbotzJvEu2gZ64s7S70vOSYYCt6Ol8R+45Sdy6MDYtW0v8cwvXfqLnUTn5690YlZvNdn3xkPfUzgLLAi7Kek/+o+r7tddek5HuJ7aQId+oh1NFY0ygDkMeOW0ljrPa3ZkcwIJTc5vBIWNbSNT2z7gjtiZf3sv9y8PtOwLDvHtgjrxClcsky4k9FNWr+AafE2w0nlWEdqe69aYGw7IVmPyBMiEUBx1NHNGOK1fkr5yHQ0dplKjs/vjY/fpN3FHoBguFGQrLD45DQ9AsUKnTxk6o9LIBT4AiRnNOYmu6rWKDpiK0zVbWWAJUwj2DcOdt5AkZGqWQ2u+EuXaz+GUy4KkmoMjSKocv8NRTdvCCkWkOcePbYEmQg+nU7lmw0XLzcO/CcLC2IZZ6c5YvL8dgrqY5yjDe3dmeTdd35UTiEgJG4oJ17/EB1b/KAB8MwNVZZu/2BzRbpKHnwzPYGs6/PoyPhvnMvQ4OaJeiL5LbaRWi6Gzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(136003)(346002)(366004)(396003)(66946007)(66476007)(66556008)(5660300002)(2906002)(38100700002)(86362001)(36756003)(83380400001)(31696002)(16576012)(54906003)(8936002)(4326008)(6916009)(6486002)(31686004)(53546011)(316002)(8676002)(2616005)(478600001)(16526019)(956004)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGJZMFBiTGx6UjRBeC8wdTBOaE5QNEs5bXF5bzROQkl3QnpIYTd4bWdUa3RO?=
 =?utf-8?B?QTV0aVJrV0VLU2d3UWhpUUdJYmtKZ3BEZ29HSUZFdmpqZmErME0vR1Z5Qk5j?=
 =?utf-8?B?S3h3RHoya3JIR2syQWZVclBkQjJMc2dWNDVCb3JhajBuNitRMmE2UnhMRHpV?=
 =?utf-8?B?VU1GRW43V3BSZVk2Ym9qdG5oZFJna29NaWhEVktKSldHZ0xSN1k2V3JOUUZF?=
 =?utf-8?B?QWJ2dXNjL1JFZTV2L0VNcHpVVEdwV2x2c1RDbnhab20vMkNmckNzSXJISzZX?=
 =?utf-8?B?L1FPd3NrR0h3SGM2WnFFY0Z3MFAvNDZmUlMwS2NHd1pGbklFc1VIdW9jSVVk?=
 =?utf-8?B?OFpneVZ0SHZta1NxVyt3TVY0dU0yVk02dUIyV1Y3UTc4MGY0TW5ERVlDNzkv?=
 =?utf-8?B?SHBqblRHS0NERkdZQzJmMHJ3TnVUdVFMRlhDV1lwY05jWFFIdlRFSmxVdWhV?=
 =?utf-8?B?NWhMYW5HOUQrRjFsMWJnZTVnWCt3WEp1QmtpSTNWVm1IVnJhL2haM0NsVDdx?=
 =?utf-8?B?UGJLSEZjTklZMVB1YzJwVGlyVE05K0V4UzROVjU2NTVqcEhIbTU5S1B2TTV3?=
 =?utf-8?B?bzNKb0FsemY2ajYrL2FkRGlmbmd3QUZGajhmUlNlcXA0OUNhcnJxZkxwZDFr?=
 =?utf-8?B?TFJMRHNpQVRvVmtHZWpYSGxMUHI0M0dnMjRudXVWd0VOajVFUEV3U0lKZ1Zu?=
 =?utf-8?B?OFhSWFc3U3hrTEFpTDNJZ1ZzV0xtaERBQnRnK245VmdFTFBkYlZmaHZ0N3J5?=
 =?utf-8?B?SVFJbmQwWTZwb29XazhWSi9KTzZucXB5dk5obVFoYm5iV0hHNGZPQmNodEJI?=
 =?utf-8?B?UjBqRzBHWTZKR3BhUHQ4cldHY2Z3UU9BV3J0MUpXNmk5VW0zTVFVUHF4R0VJ?=
 =?utf-8?B?SU1SNjdhN3VjUmhML2xUWU9CVTVtdVlPcGgwSURaRk9GUE9sakpsYVdrZ2VR?=
 =?utf-8?B?UHRUSmRWK1JUTWNJZk1jZEJVZnE3SUVjTThSM1B0ZEt0TS95TjNnVWFyVW0r?=
 =?utf-8?B?MnVYVzFCb0lpcVRPcFNXeDlvWFdzdjhNdXlFYUtFanFFeW5ucnFVNWhWMTRJ?=
 =?utf-8?B?NVhmMFhiLzYyRm52bzRLNUNKeGdUM28vY3BEL1AyNTdWellqZVJkaEN4ZnRS?=
 =?utf-8?B?aFI5UUdHcERUR0doWVZNOHRTZVp6TW1NUWdZQU8ya0NFNVlnakxGVjFaZU8x?=
 =?utf-8?B?U2Zoc2M1WkI5ajRZT3Vlb3BlcFI4MDBRZXRrenhua254M3dLOVJBOEJzS3hj?=
 =?utf-8?B?NWhlalhwcjREQjQ5a29mZ0lVbElPVzhQdkF2em1TYlNYdkgvb0RtQ29QbUhI?=
 =?utf-8?B?VTBwSDg4bGcyTy9IRTcwbGZPQzBueWFuT05aMlYxUGh1SmI5cmtrZXZTNmsz?=
 =?utf-8?B?Sm44TVVYZFNVMDRRQzFMNmlreEdoMVZVK05oUG5OaTBhcFdYYTRuVFRoM3dN?=
 =?utf-8?B?a2tUWjVoQXB2KzVmZmhpdGtuNUxCSlJLZVRZRy8zbk02Yy93RnVZMWZ5YkYx?=
 =?utf-8?B?ZWtRZGJBVFdPSkg3WkJ4M2I0RW8yeW1YYlh0S08ybGN2TU5WMm5zN21rNUs4?=
 =?utf-8?B?Y0JueDBwOUdidlplT1ZzZXplc0o3cU5LMkhjdXZZRkJBV3VTN1A2SWJTZ2Vh?=
 =?utf-8?B?ZjNiN1BMTy8vTFYvWEY3Lys0Rk9YYUd0cnc4N2dlbnJ3RWRXN3BUMzI1cEtJ?=
 =?utf-8?B?QTlaWWkwS1dEdnJ5UXYzMzUyWWZxdTljTVFWSkNsL3JKLzNmZk5VZGJtOWRu?=
 =?utf-8?Q?7bg5iODOYclcmXrn5oN1lSL716Gua9VudJh5TB0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5a1f99-29ba-4a01-b4f2-08d93a312cd7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:35:13.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31zIYlc3FFliqsxdkqUFJAmdHm2VbXejYMGNv0LLvCZt1kKgNjQh9+3U8eFb0j9OQ3Y1ZxFXTYr4R4sm11nHJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 17.06.2021 15:05, Ian Jackson wrote:
> On to process:
> 
> Jan Beulich writes ("Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions - FAIL"):
>> On 16.06.2021 17:43, Andrew Cooper wrote:
>>> I am very irritated that you have *twice* recently introduced security
>>> vulnerabilities by bypassing my reviews/objections on patches.
>>
>> I'm sorry, Andrew, but already in my original reply a month ago I did
>> express that I couldn't find any record of you having objected to the
>> changes. It doesn't help that you claim you've objected when you
>> really didn't (which is the impression I get from not finding anything,
>> and which also matches my recollection of what was discussed).
> 
> Andrew, can you provide references to your objections ?
> 
>> I don't think I know which 2nd instance you're referring to, and hence
>> I can't respond to that aspect.
> 
> And, likewise, references for this.
> 
>>> In the case of this revert specifically, I did get agreement on IRC
>>> before reverting.
>>
>> How can I know you did? You didn't even care to reply to my mail from
>> a month ago. And there was no reason to make an emergency out of this
>> and ask on irc. You could have sent mail just like is done for all
>> other normal bug fixes etc. Iirc I was on PTO at that time; it would
>> hence only have been fair to wait until my return.
> 
> I think it would be good practice to copy and paste relevant IRC
> discussions into email in this kind of situation.  That email also
> makes space to properly write down what you are doing, that you
> realise it is controversial, who you have consulted, and why you are
> going ahead.
> 
> I looked at one of the two disputed reverts in Xen,
> cb199cc7de987cfda4659fccf51059f210f6ad34, and it does not have any
> tags indicating approval by anyone else.
> 
> Andy, if you got agreement on IRC, who from ? [1]
> 
> Ian.
> 
> [1] This may well have included me.  I do not reliably record this
> kind of information in my wetware.  That is what we have computers
> for.

Another 11 days have passed without a reply to any of the questions
above. I find it generally inappropriate to try to have controversies
die out by simply not replying, but in a case like this one it is imo
extra bad to do so. In case it hasn't come through clearly before: My
primary goal is not to revert your revert. Instead I'd like want to be
given proper reasons, so I can fully understand parts I may have been
missing so far. But of course I also expect you to correct your views
in case the technical details speak against your original reasoning
(at which point undoing your change may indeed be the necessary
consequence).

And of course all technical aspects aside there remains the process
aspect of this whole situation.

Jan


