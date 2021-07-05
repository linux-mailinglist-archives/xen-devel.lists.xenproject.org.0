Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D866D3BB8A3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149882.277211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jfl-0003dk-Hh; Mon, 05 Jul 2021 08:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149882.277211; Mon, 05 Jul 2021 08:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Jfl-0003aP-E6; Mon, 05 Jul 2021 08:09:45 +0000
Received: by outflank-mailman (input) for mailman id 149882;
 Mon, 05 Jul 2021 08:09:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Jfj-0003aJ-Rm
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:09:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a115912-dd68-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 08:09:43 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-uI4kHMqNM8ylFR3BHhTijw-1; Mon, 05 Jul 2021 10:09:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 08:09:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:09:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:207:4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Mon, 5 Jul 2021 08:09:38 +0000
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
X-Inumbo-ID: 5a115912-dd68-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625472582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3ukqdqargNajk7QomIvgd+mfoUGfHQ8FSpzdFZYCqQ=;
	b=TcSUy3mq8zB0Vu2kIMHXPXZq6RPCiFhIlzXG8MbNxkM166T+FENnOFw3SRgiJ4TuneZP33
	PCziMRHxqeyA3zhR+icrZVcFa19GrjtJNmfcEUYii3m5hoDG4We8RFDgZzwUwK+3uDCjMc
	brcK93qNuI2436XfBpzyoJTnSh/B1vY=
X-MC-Unique: uI4kHMqNM8ylFR3BHhTijw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Se/4kbrB4gyekeCJKQbnUfzb+maUEUaooM6gS5iBcyMGaarmIBZeWjRGDtZm0xqplKNXZyuoxkIq0du6XKVgdopAPzzh3wi6Hv4xIgi9DNNuvhLYCd/k095RpdGhkQuVNpP8mvmSzk7FVt32FEJk3/RRpASfMYoyCJLlx9u8ybX6jyF4lAZP1+8BQNLH8wTtImlrh2pylx+UAy35ZTVE/wwcSnC8ySb4v2fW9Jp6JaB0qLxbrf/Oziwv+N/ant23FcOYvYahu3zSex2es9p9bGfNpZpKnPVts7+JinJIV81Ji/4/hvzuLqgqw9I96AoGJpGqvpQZCXcb9OgZ+K3LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3ukqdqargNajk7QomIvgd+mfoUGfHQ8FSpzdFZYCqQ=;
 b=GbrempDH+y3B1s39Eo6j5ZweAGdGDxDLE+1ES593WnUYNRcGLyeQfy9Usq1aCGf25hqExG0nzsLMZam+2N7D59RGhZl/aNKrIXA/B2o2gmbcM9DnCSLT440th9i/2ttQtuseMAydgC39x9JBjmZqAZwFsanl+ck4+CbQQuY9TUWg5yqbp7gvv4N6gzSuLc12WYg8UYadvv+A2ZYuH4QvSLSCSFyDR9BQE3fNW04g1zejvpupmE1bcAoSVCDoeuXvilv3ge+htimC7CiDAD1rTYY3J7hW5L3p4l7VZ72uKwxMF3cD+s4ltFBZwhn3rZc1lt6Jjwv040GOvA1LwcLeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] xen/Makefile: drop -Werror
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
 <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com>
 <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
 <YN9gf2vhyH7w7V1X@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dbc8f6f-a283-a5c6-4779-40c39ffb568e@suse.com>
Date: Mon, 5 Jul 2021 10:09:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YN9gf2vhyH7w7V1X@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR07CA0058.eurprd07.prod.outlook.com
 (2603:10a6:207:4::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f058d210-73df-4606-1d23-08d93f8c3bf2
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66695A5D593A5DE1D34890B2B31C9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JeS1cpS1mPGPfLdzb5xNvf4i10TzA091I/+w954PVbBi1QuQpRD6BGxrTpx700Jb+1tIYFyDDL8O7QN3BxeX8nJ7ZBzwk18a9nDkUfektTnozsdru7d4X6+OlElE8yenLJDT8f27ON2tnNcH53rWL5sarDT2Z0memIrnNiXm55QQrtjWB0ld1+U7MPTT7ZPyfVPgh5El0VMkuAQPxzvtOQyq9hHexB+8UjrZp6wk2qNnLitvyjceqUA0Ovtvt1i2POR6j30oZ3jl+akt8FoFG4AVAt3jScgV/peGeigJqNoMFKYsUmxixQgmyFVgfZwSb6oiBk1PXWoephGd6efbCv3AGrSfzH/7XfnPWbXFGmHTQejHlwh4qUx4nY+6+QfnVgRk2YZZ5RSnktNFPw3F34wTZ/mdQaoAQyazBhG4Vj43TYdVczfCHRHq1YLvuo0djJAKf+FNvRZWyt7TPlhClLQbJpZVDkL113rgDUDBVy208mq6iecCQbF/hpwUcxbKIX/UQACxy9YkMmfjfqiiK7lwus/+fy82OuHS5snGI9f0kFeTp0EKAmN3OwiJKJLtPoQdVqpAS89C/VOl4S+04T9Jv7tiZbHDUNk7SeubUFYTI6ZMSdOznYMJbpVZVJ7QxOd2G4YD1JiJPpCQsSa5XyaPfc5V+fbBXwkxVxApPK7/BTLpO8KniE8nOXndQ+K1gbppSWW0489d8GoLbSXtLIdVgl8N1M/1ZIlY7q0kOG4RnsX3KmNqixa885j76DT8M/skm+Dmeby95XskbXPSDCUk9qKu9kLskfOjAHv73cfq05OuVbsgw/NkPxUTJu+u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39850400004)(16526019)(2616005)(956004)(966005)(186003)(31696002)(36756003)(16576012)(316002)(86362001)(6486002)(26005)(31686004)(54906003)(66946007)(66556008)(66476007)(2906002)(38100700002)(8676002)(4326008)(8936002)(478600001)(53546011)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlN4WG1ZOUJIaG1IQlMxZ0QyRUdUTzF5a1NNVTFneDhoTk9CT3lGaVRNdE03?=
 =?utf-8?B?U1lUSUM0R2lLeXlISzNBNlRjQVE4MFdUaW1haHU5VlMwVEpBbU5zcmdIZUov?=
 =?utf-8?B?d0ZscGx0YnNVRm5SSDJoZU1MQXo2Mnl5OXhCUmtDdkxvbk1pNkgzaEprN0RL?=
 =?utf-8?B?NmYvQ1VUcE1HN1UzODhtOVVuYVNVYncvVzc2ZlQwUEJRdStJL0wzZmxieHpO?=
 =?utf-8?B?TDJKdmQrTEJqRGJ5MkhvVVlUNHhidzA1aUV6aVpzTERYcmx6anZKdkpHczFR?=
 =?utf-8?B?T2VhUFI3YVBRNGo3UFBLcGRzUTNVZ3NyRmd0Yjl2a0tTUlpBNUt5V2RBODFm?=
 =?utf-8?B?M3NNV2N4eThnM3N0bEFZZFZhQnNKNWZ0SHFhU3hMc1ZjcTBSeGhkblllQTNw?=
 =?utf-8?B?eHpiMzlTbzdhZTdpejQ2TDkwY2ZvZHNucng4UFM4c0Nwd20zRHlIcHI4dStS?=
 =?utf-8?B?aFFZZ0lUVEJHWlQyZndJaHVDRSs0MjlyUHREMkQzR0EzNEIxc3VpNnBGQW1l?=
 =?utf-8?B?RXZ2VFdtRWFtbys2V2Y2MFJvUVVXTjVHMHhMdDlIUEk2NHRGeFBjWVpWeWRa?=
 =?utf-8?B?NG52MnlBdjlCWGxsZTU0b211WkFMcWt3T1lyNnpCZGJiZkhKZFN0L3M0U2h2?=
 =?utf-8?B?eDBadldVYTh5Mk9qSHRycmZXNHRWaEtSRkhHck5sSy9VdHVjT3praldnazlh?=
 =?utf-8?B?MGxKR0dlR2VsR0dneVpockhUcU83SUhmaXdRR3lxWEJQRXJ1T0N4a3NyNnhG?=
 =?utf-8?B?TlpSSGl6YXlzRm5kdWw4aStWbEtWeU54S0lUQTF0U0U5Z2RTYnlEOC9Tb25k?=
 =?utf-8?B?M0J3VnAyTHl2QWRxTnZOZUJyYXc5OFk2ekFXVzZhRXFkVS9IeVpaSnVUK3VD?=
 =?utf-8?B?enBwajh3bzc4aXU5dVYyK0dtWEhRN2hhN09qYkZIOEFBR3lCWEVnWUVtQWVq?=
 =?utf-8?B?aisvcFIzMVpaMGtVcWxreitubHZKUER2ZFBkV096SzllTXBzWHZSb1lZQ3hU?=
 =?utf-8?B?WnpNYTFxNWx0R0hPaWhOUEhKZ2djTXVhSHJtR0NuL2UyOHFpZ1hBNHpDTFBt?=
 =?utf-8?B?Vk1WbzdUZ0pnOWxUYitDd2RVbVM2UElaTGpmdGRyU0tPUEFLM1UwZlc3bi84?=
 =?utf-8?B?OS8zSldKeTB3ODh0SHQ5Z0ZPRStEc2w5bjZxMDYxR3VwL2xRUFYzNjU0Sm80?=
 =?utf-8?B?SmJLTCtNS3c2TnFnQW4zaGRuSmFjY2JlVmlqdCtBTU83NGo2cjVXLyswb3lY?=
 =?utf-8?B?N2JiTGJTZjR4WjJHUlNBOFNLYndiZ1pBU0tEM0lDTzVBYUZrZ3I4cTE4OXVr?=
 =?utf-8?B?OVhJWW5vQlFINll0MGNTYThvWVNPbHNDY0F1eFVTZnJNRk40Mjg5VGRlNGgy?=
 =?utf-8?B?V3l0cWsyb2ozekVxbnNjQkN6OHhXYXI1N1RmTHNVTG5MT1dvSlpCaXVXVDRh?=
 =?utf-8?B?bW1QRW5wMzgxaFdsM3hEcXhHWDVJWkZtUWpFY01jTndxTkVEUnpYMGhORW5h?=
 =?utf-8?B?NHJreVBLNCsrc21EM3lXMkZHclJDSXJKME4xWmdFUUVLcGRCYS9wVXZRMXc0?=
 =?utf-8?B?WXZJWDc4dktod01SMWNXUVBnZjEwUjB2Q2NidnhMWWlscS9kY3oyVi9QcEJw?=
 =?utf-8?B?WFB6WE9uTitGdk9BWjF2M3pOWWk4QWF0WTR0SDJSWjdMY2U2cU94WlZXM0dY?=
 =?utf-8?B?dW5FNUFkMnBDdnZaWklneCtkb3ZZdnJKbzkxbC83ekJuQ1U1YWk1c0wxNkhO?=
 =?utf-8?Q?OYp5zZ3gZDZRy1HGZsF3rdDpMxyv2+hpvZ245WG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f058d210-73df-4606-1d23-08d93f8c3bf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:09:38.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/aDs50u8X+xdfNANgF1DarQDuFF6Qq22Fc0+C5msszpSkx2bHcKDAm2WPsveJlAVugYPrxiJzmTXBC2WrcADQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 02.07.2021 20:52, Elliott Mitchell wrote:
> On Fri, Jul 02, 2021 at 07:51:55PM +0200, Fabrice Fontaine wrote:
>>
>> I do agree that setting -Werror is generally perfectly valid for upstream.
>> However, for downstream packager, it is generally seen as an issue as
>> it will always raise unexepected build failures with older, newer, or
>> exotic toolchains, see
>> https://embeddedartistry.com/blog/2017/05/22/werror-is-not-your-friend.
>> It would be good to, at least, have an option to disable -Werror for
>> example through a XEN_DISABLE_WERROR.
> 
> Two people don't make it a majority opinion, but if this was a meeting
> this opinion would get a second.
> 
> I don't know where everyone is on the spectrum, but I also strongly
> dislike -Werror yet do like -Wall and tend to get rid of warnings.
> -Werror is good for continuous integration systems, not so great for
> releases or active development.

Well, my experience with Linux (when I started working there alongside
working on Xen, many years ago) was that many people don't care at all
about compiler warnings their code changes introduce. While Linux has
improved some, I'm still carrying a fair size patch to silence all the
warnings that I observe on various build systems (i.e. with various
compiler versions). I do this because in a build with (perhaps many)
pre-existing warnings it is far easier to miss the one you accidentally
introduce with some code change. -Werror is an imo very appropriate
measure to get people to at least address the warnings they can easily
observe about everywhere. IOW I've always been appreciating Xen being
different from Linux in this regard.

Jan


