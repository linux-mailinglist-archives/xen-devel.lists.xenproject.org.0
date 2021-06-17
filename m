Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703413AB63D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 16:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144005.265148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttCD-0008DB-Bj; Thu, 17 Jun 2021 14:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144005.265148; Thu, 17 Jun 2021 14:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttCD-0008A9-7K; Thu, 17 Jun 2021 14:40:41 +0000
Received: by outflank-mailman (input) for mailman id 144005;
 Thu, 17 Jun 2021 14:40:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k/hY=LL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lttCC-0008A3-0g
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 14:40:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ae30b1a-8b9d-4557-8aeb-30052137649e;
 Thu, 17 Jun 2021 14:40:38 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-aQHJiiBMMlyghr7ag5fvmQ-1; Thu, 17 Jun 2021 16:40:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 14:40:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 14:40:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Thu, 17 Jun 2021 14:40:34 +0000
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
X-Inumbo-ID: 0ae30b1a-8b9d-4557-8aeb-30052137649e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623940837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaOlV38ZKFp5FUC5kXh5UF1uoQXByllzTWG/71WSIF4=;
	b=E5KpwtH0XhGPIWZRvMDYsDphFJ8O60B7itxf+llqxn2JmmSNX4HcKjQy6jAD6trEQqqyE7
	8/vuZG3d4Tud4e61WLiNLQo3jJQTydLPKxqdg5JlACMKauXYuKX/9y14kudYj1Drj11iAR
	QKjWY32419a7PrPK4HikeztnjDkIcT8=
X-MC-Unique: aQHJiiBMMlyghr7ag5fvmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PohVUtb+Sc4OEe5xubJJtuohna2CWUZV/ut8zQsbr2ADj8azf7frkES/R9QMHAsyYrYZ1t/MzXqLju6/mplJPt+UU4wCTho1sx4/vWpwjvSqKyU2ZOAKi/fnPyX+JJ8Zf/CROxJHAjwjO3LdMLbxzYwTGOtjFvb3wsYukiVXXW40NrCejogbMUdcA9JtiIu4d3TrT7PH4uJA1qLYLNh6prKqlHTp7qRhHyOBNLNlIGm9uccY/SFc8ZYgBfzX/Nfk/RpRsZ+NhaeqEZ/bDjg6Y8lKrOhh6G+3kPgzM5qCmLeDo4medkjstbxM5Xu6krX2wEzHaC8aOifd9z9tOpEpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaOlV38ZKFp5FUC5kXh5UF1uoQXByllzTWG/71WSIF4=;
 b=ab2CU9pYktn3bdcWXP33gTdFUv/WeS+SJ6ulWRwKRos3gYpvkdoX9+RaIje51rQhb5XHq6/gjsI8TuEHlTovmMps2CjsxBUpbmBvtzKgHyW2gIpPp35V/Fxw+ZKX3hRnAlr5kClniWTbk6MfpOxlZn4xjEk4rpfZupI/N2MxL46cD3qjceGhKs6GPC5Ra8ezfM40GqSEckqVXyfrBK9nmsrZOZOHCxpJ9j0joD85fuNF1hbrMC7Px1G9iYpxN5lXcgCI7IdEFhoXsoCf5zgKEknLaxpFIFhefS9xGm904x8TtO3EFuDY/nTRCN1xVcxuqdfTy+UXGe6hXxO6IgumLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "committers@xenproject.org"
 <committers@xenproject.org>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
 <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
 <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com>
 <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
 <24779.18584.523983.904660@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5537bc9b-0a71-60f0-efce-d0d33301fe45@suse.com>
Date: Thu, 17 Jun 2021 16:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <24779.18584.523983.904660@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a48dfd55-436c-41d7-16c2-08d9319ddddc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54713CE1CCAFFB7766668F19B30E9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgT/zcHm4gqnY9ioTr2l7nJQEMw7YyejMSMIN0eHUZZVwlROKjmjhFl3w46PooOVqOcrrgncp2jw05ojFLm9RgIrrKo3ABqo5cf0iUa9x8CJdoQ3mGNKt3MJqMPnWaX8dw/9ylD39Icjt2lhprlMCmC5XNVEUDDq8YGoid2RRZ4YIUi2Xzf+nuG7QLmPW3yQ3mTboJNQzC50/T9yfpKhpIkzfbwnToeU7Z6e88cwz7frIz8G/nVeoj5PAv5LHfdb9gSZ5BMBbwmphWuDtJr7lBDm8rpuOAft5MlIoK2xc7MJhbvYIim3M5G+puvTZCMlb/+hJtgZXLrN5qYM/OqI8z/xoPcb/Y2JhmHwvd+WjU2eucUKVxc+wj16jtewKmzlbzzYxrvYYxKBjznVkQh3P1CmT8gAvKpgu9taNSZaaG94vBcs4ykOskF/1LEV1ttuQB21kwi/b6IXuiQjRuTiWBTdszo/I4oRbwNUK6TmzMSnaFP4E5AHXcBEbVUgB+LMWKwMZYe6psVU+q1kZxf4TQOsZmdVYhspQtdgRO5EgP2jSkKuCEdaYkEbeQT/mB1O1rjUKf4BI2HFKE8GXUEztjcjjLf3jQq2Z6fopnWdbvuaEW2BSPE6ZFrsF3AEXY+9zGYoVNzgQ28i46VLuCppufV8hlntLjB2ogLoszvp2ZhILaN0WemoJmdC8tJuDRoH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(376002)(136003)(396003)(366004)(66476007)(66556008)(66946007)(6916009)(478600001)(36756003)(316002)(86362001)(53546011)(2616005)(186003)(38100700002)(16526019)(8676002)(956004)(6486002)(54906003)(4326008)(31696002)(2906002)(16576012)(83380400001)(26005)(5660300002)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1Rmc24zYXlTcmZOb1NVN1g4aTdZSzJzS1kvQUl1SEdBTkpSOGtvK1VkMFNE?=
 =?utf-8?B?amhaVFRUZkpxaHBVeXhqMEE3em9VWUlsK0Z6M0hodko5OGhFcndZVVU4VDZB?=
 =?utf-8?B?bThIOHlrbStTUmtuU3dVci9jQk9JL1QrU1U1Tys2Uk10bVA2TC9UbUhlQ21R?=
 =?utf-8?B?YlpHM3NpREt0WVN1N3V0NHZqOEl0TThQYk93UnQzd3g0Y1k5N0VwaW1pSGUx?=
 =?utf-8?B?ekFsWVhPT25oYnAvcndJZXlpak51cXhUM1J2SGNMUnE2NXkxME1RK09ZbDNu?=
 =?utf-8?B?ZUtUYWhNRUVuRzNDWFpwVmd1MGgyZmNsYk5zQkFIVXZQbFZkaTNZVUkrVWZx?=
 =?utf-8?B?R2gySHB4QW8rbHJyUEpuUUdqQStJSkNXQ1drZTRRZ2lHeENuL1RReTNzK3dl?=
 =?utf-8?B?MlpKcjFNVThyc3Q5andkSXY2WkxmV1RIeTc5UlRnd2tyZ3EvTzNWdXRJUmw4?=
 =?utf-8?B?SDEvMWRsNXdVS0czVDNYNDBoYXgwZkxFcHgyUlQyQTJTT1F3SWV6MXpIMFZn?=
 =?utf-8?B?andtaXdQWFJJZ2xlSWhiNHlHMHVuRGNES1lZbmN1MjYwUzZLTW0xdDBvNk84?=
 =?utf-8?B?eFNuNHdhT21VQU54R1dQUm1aMzdlcDdCS3FtS2ZzcGM4UU5kVzA1RjRIa3ZG?=
 =?utf-8?B?emtIbEl1RzNycE5WVm1iV2RNb1VJbE56UmxmOHBtTlZzd3E1ZVJOb3VhSmNX?=
 =?utf-8?B?MmJvaWVHZlpWdEc0d3dRYnR1dHRvVkhqY2ppazRTYjBYZUFHcHo2ZnM1Qlh2?=
 =?utf-8?B?MWdqL1U1TjVpSFBYU2g2NmJTRGVCR3BTSU95MmxYZ0M0M3BBTTMzczhwVGNC?=
 =?utf-8?B?REpIS1ZLMGlaeWJNSWlrYUU5Ryt2UTdWdGlnNVZqNXRTaUg5SWZ1a2NpTDJ3?=
 =?utf-8?B?QVI4VUVWa0hYRFY4S2Y0V0lPbGYvQkpNejdGV1QzdmtWYzAvemljemFNRllX?=
 =?utf-8?B?NllMckFDMytISHljdnRHNlV2YVEyY2ZrNU1EYjJZaUF5SlFUdGVxWGxGOUtq?=
 =?utf-8?B?ajFva1R5cGRLZWxNVHY5bFYvU0VGaEFqQ255NzViQjNzb0NBdnNxcFgwV082?=
 =?utf-8?B?K0o5ajV6ZUJRSzBQeFE5ZGZaZXBsZW03aEo4SkRqdzdpQVJtWnZteDBtMWsw?=
 =?utf-8?B?RVpDdjFJdVlOeGdxU2VqMGJSZEFnZjFGWDQwdTBtUGE5NjBMYjcvUXpqblcw?=
 =?utf-8?B?MzZHaklHMytrMFBNNEJNRVZKdFVPRVNNODgzVDl0WVVGak5IdGp1WHhRNzRt?=
 =?utf-8?B?RTRueGZlVTB0U1VuTU5MUTlEMzVSWlcxZ1d0NkxYNFNmUVRoSWhaRFVaSThI?=
 =?utf-8?B?WEowd0s3eGlJRG5UMkxxNFdrOHFMRU5Ybzg2Rm5kTXVYaVUvNzg4a0pFUUti?=
 =?utf-8?B?bkN0K2Q3WHdXTkVtTzlHZDBWUXBUYmpKZHQxOC9xUXFqbEdMckNKVXhldk9w?=
 =?utf-8?B?S1F3M0RsU2hPdFVzTk82UjlxZlBzYmJSdk1yZk9ETmFHaEFOZGx6UE5hbDlv?=
 =?utf-8?B?U2R4Q2RRTmpYZHoxeml1QlJ4QWl4MzVnaVBoelZ5WXViZFNsYktkQkYwakFa?=
 =?utf-8?B?bnpQS1R0ZXJDa2cwMWlJTmZURWRQeVhCbm4zOTJvbElEOGVzeGJ4T3k5VXBH?=
 =?utf-8?B?K0tRaTdoVHFLVlAwZkpROW9RbnVTQzJWUXBTZEczQTlDN05tYlJUSWhHUDJ4?=
 =?utf-8?B?N1VsZ3I3UTBXcnFLcDR4RmhoQkk5RnFnV1I5NFFMMXZRaTR0VmpSbHdDbk10?=
 =?utf-8?Q?903T4lJw+lozj/Nao10QO236Fi1ozqiezsMhiPY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48dfd55-436c-41d7-16c2-08d9319ddddc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 14:40:35.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urTbOBbwovS4L5xjTOa42B9yYz9EAXeUvRbkkZDXCwGGv0JFugd3G/5CGFfAe7EDMK/fBJyyZeswcUHEjej/jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 17.06.2021 15:05, Ian Jackson wrote:
> Firstly, let me try to deal with substance and/or technical merit.
> 
> Jan, I am finding it difficult to follow in your message whether you
> are asserting that your disputed change (to Xen) did not introduce a
> vulnerability.
> 
> I think you are saying that there is no vulnerability, because in any
> overall configuration where this is a vulnerability, the guest would
> have to be making an unjustified assumption.
> 
> If this is your reasoning, I don't think it is sound.  The question is
> not whether the assumption is justified or not (answering which
> question seems to require nigh-incomprehensible exegesis of processor
> documentation).
> 
> The question is whether any guest does in fact make that assumption.
> If any do, then there is a vulnerability.  Whether that's a
> vulnerability "in" Xen or "in" the guest is just a question of
> finger-pointing.
> 
> If none do then there is no vulnerability.

I don't think any OS does, simply because they can't rely on such
behavior when on on bare metal. The only such assumption was baked
into the respective XTF test.

If any OS made such an assumption, then I don't think it would be
a vulnerability either. It would simply be a guest kernel bug then.

Jan


