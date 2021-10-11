Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062F428BCA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205777.361170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtBh-0005Ub-IN; Mon, 11 Oct 2021 11:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205777.361170; Mon, 11 Oct 2021 11:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtBh-0005Rh-FL; Mon, 11 Oct 2021 11:09:45 +0000
Received: by outflank-mailman (input) for mailman id 205777;
 Mon, 11 Oct 2021 11:09:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZtBg-0005Rb-I9
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:09:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61347ed5-4338-48a9-840d-2e5505db6d42;
 Mon, 11 Oct 2021 11:09:43 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-Fngrbl7JM-yhlE_l-obbdA-1; Mon, 11 Oct 2021 13:09:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 11:09:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:09:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:20b:46a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 11:09:39 +0000
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
X-Inumbo-ID: 61347ed5-4338-48a9-840d-2e5505db6d42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633950582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cj2s4Ep6h3MsZ/i8kx3tvEoapr0vwNyWOGWcj7wJ3Xw=;
	b=QD7wwYe2YYpDcS+RctIiz9WWcOM5wUUI4O+HLWHw7g6I+U1RjV3n7r6O03G5xxYKVomgc0
	FlFfWzAoBqUWuaIAQC9Zh0iTEgtlB3VysGAaYrim6iJRHPFDen87qRDlF3cdMhKHgnNQGP
	DsS+KwCEUaqjOiQLpPJM4PSJ90bcZUs=
X-MC-Unique: Fngrbl7JM-yhlE_l-obbdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOVec5BsMoydb4pc83shMElX6A8u608ZQN3Wy0RTds8Q5DJ+uniXXXeiMkjo39wkzNR/6lkbWwA1gMARHEOIlVDs2IxWQN5/bUHcVZPqE5SCTv3aikxQetMW+epuBRWG5MYC6R5wCnq6ZT19ek6UvAicpOcflXgw0XjcVHVv6qCC+oVky/LsM/uCjx87tUy1q4vm5lSlD9/8ytKuZmu6sjgetGzhXYoz8J76Y0amf5Oc/ajY36ZNBSGVUSsKbnFMUVFdcHtLxhbh77gPURqtRYj34+fiPJ6R27u2VesvaC1v2ieYgwMJ7QboLP6CbX9xlF97FyaYCJtSYDYadtOHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj2s4Ep6h3MsZ/i8kx3tvEoapr0vwNyWOGWcj7wJ3Xw=;
 b=SkMKOKRVSC5PMqZTe12+p2iRf3A2AYhJeNPx8UAQu1sKodTo8+CzUJQiwpxQKfBb2u0Wad2c7Xr6nVxqhIQS/RhhNdgcrdQqRlGsbt6OkWvMNFcxqMvqXkghIbeZRNWXo3UsRdGinEEhNXCzVTkqsPGLElapZ2EW3avbrHbZGHX0Rg88MIkgAQrw+weyWD73wiCnrwR0tQ4FCCyHX1jT3AA+p5i96MVq48FIVxRZqN7YfpcP8v1M3riw/tS3RDjs+buvnIu+EIsQUumbkp8jSCJs0WcH+bPgx9UWiJKUav80A/ezLE2z0xI+1j7AeZ2a7jHkU85q4C1RLjFwvlkAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU
 disabled [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
 <a385938d-243e-1790-da1f-be7c4f5f2c3f@suse.com>
 <24932.6255.815797.597475@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed7632b9-5426-b351-45af-7ad3bf31d3d9@suse.com>
Date: Mon, 11 Oct 2021 13:09:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24932.6255.815797.597475@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3d53497-6fe8-4b84-e34a-08d98ca79ebf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574183BB937A225C7D07DA94B3B59@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qb0Y+bLkbssbRCWKKbOVeLFqYASFekHgtLYOabWeTwYzBSvATGeSPue2ol4cpmvlgTKQALeTZUxioH68ATgPAijtl4jGKVXuBzJY1yPesCYc+ZowabV1FL3vmEHqM2K+w8qtFKV0jrFtAs1kdp9ukHPHJjOYJ5nj+Pbd2enUdTmKoSBu1aDk6FuXjWVzBLAMQw3SVhUxnYQZ+5EPuFD5oYv9YBpREtemYMBqWDH+DuzDfqIxMvNhshV3hgqFFa+woQPUMXAdvOEDqp3ONYPRaEzqaKUF3EoU6ANfxqXsowoY/yz/2DxuaWXC3fMk9j6trxmPicl5R/9q0ANbeTyS466oK81yvRTSsP4vPBZlEWCUjcWBg5C1O6HgUf7tzBpTRry4Bocsqbji0mJEjnJ5Z7Q7CBuKGL3O8BF+oN/iaE+iFLRiz4APbkpSjcgYPMpX8te+POhJJCyM2poMA0m0ScOggEcS0FIN3hRX8pL/Mhd02bJDBeykvkuDgFLf2vcp1B+S3dlTaN1Hkj/4qUM+mEBu4Ds/S2YTD9ZcgJU8XpzhWW9sxltV4do0GsLzwXfUbgWTkQT+iL67jeaBp2OBnuY4K/soDZ3VSR5cMV8NpTzy6k/asgOnrB8WCFxDcFmixEh0nHw+eyXZ9q3I0fy9AJXPV9k5bZr9FYWnptR2lCz8tMUjs4MqDOwESnEghgpdMGDQMP1LeuS8b9FvqGMosCo84fP9JTR3rR033qupL1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(66476007)(8936002)(83380400001)(31686004)(8676002)(956004)(2616005)(31696002)(2906002)(36756003)(186003)(38100700002)(4326008)(5660300002)(86362001)(316002)(16576012)(508600001)(54906003)(53546011)(6916009)(15650500001)(6486002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpsVnVHczdhdWFVajUvQ0NrRHZtTU1QT3JobWJkSi9PVGpNSGpBeUVpaWMv?=
 =?utf-8?B?eFovL1dVbHhzY3A1NjZndGpoL05ReUdkNnJJL0ZQWGNRaEFySFQrMEppUk9u?=
 =?utf-8?B?NC9sOU0rKzdwVkZxMEJmdFArdmgxOG1rV1pMVXhGZU5MZDIzNW1ZanptbFd4?=
 =?utf-8?B?eWJnYzZDZm5GZ3dBL3dmcWhCVXlySlBpc1E1VmIrT3B6QUc3RjJlRHpLdUFV?=
 =?utf-8?B?YXFGVXFTTnhpa1FveGZNRC80OCtKR3VEQ3llYXU3Z2d1cnBnNy94MnN4ZCs2?=
 =?utf-8?B?VDJ6ZForN0paRTlsc0FGZUVabDBCNWw0WDdiWWFhU1BKMStacWdIWGUwZ0RG?=
 =?utf-8?B?OXNvUERia2kvYlFLRXlWUmxRMWVWaEFuUnBhNVloMTBualFtSDhpZ01IZWo0?=
 =?utf-8?B?UFFPWldpNFVLZWszNyszOEJWVVVHYmJXWm0rQjNYNG43M1lBbkVVZUthTzBM?=
 =?utf-8?B?cFNyUEdUNXFMQVhCNktNRkpJRWRtQzRIMUh6YVp0RkRxcWxuOTlqcFZmUzBq?=
 =?utf-8?B?TXhCWi9Kb0wwSVZXeCs5MUh0N1RxMk1HZlo1NHZWUVdTMTRnajVUcFY2cHJZ?=
 =?utf-8?B?bGNXcVlJK1NtTUxuNUxjcU1GeUloZ2xUWnNSY2ZxNzRCYkZmZnNzcTA5QXRr?=
 =?utf-8?B?bUxlZDFHMkRadis1dHBWQm1wSXpIV2s0RVpEN2FySlVNWU1Da0VMR2RGMk4z?=
 =?utf-8?B?czdWbUxDUFZIQ003c3FvWlZxNlZhMjBLSE94NURaK2RZeGhFOVFJaERYbTgz?=
 =?utf-8?B?UFI2NHJqWlR3dUdnZFNTZDVIWWlJcnMzQzEwS2t2REJPMHFxSVEvT1Z0Q1NP?=
 =?utf-8?B?TzQrTExJUDFxeldZWDVXOWhMQ0tyOUkzcXUvaEU2Q2FkREdPQ2plaXIxeEpC?=
 =?utf-8?B?WHVtWlByRk9sczl5SEtvMWNlL0RYR0RWM3lCQVZ5VkdVZlk2T0R3a3R0ZlVJ?=
 =?utf-8?B?TDVFTHZ1SUZyN3dRaWpiQ21NbEFXMkJEQVczUExSZFRwY3B1RzVUZ3REMWht?=
 =?utf-8?B?QjR2dmpOWklyaDRyenRvUU42Qm9hTStGUnlVdE5DMTF4Q3Q5eld4RDhhY0RS?=
 =?utf-8?B?TEEyTkNxUksxd3J4NUwwTmFvNE1jdi8zN3JUb2cvN1pvWE1FV0dCWmJPWkdK?=
 =?utf-8?B?dWRPU1MrUnp0NHovVmRsL2RHNkxjVXFTZFlVWnNNMVRZckZCdDhmRDlCM2lw?=
 =?utf-8?B?eHBnbjVrT3dqcC9TemZ2eEpJVWR3UzZiMWo4bkhHSDRoNEltTSszZFIrc2xo?=
 =?utf-8?B?cENnSlp0TkFSMmIxcG5EUHFSTzlkQXhFR1hnalQzR3IxQnJ3MGFsVDJpSnVk?=
 =?utf-8?B?YnlCK2xtWTZGdEtMbnplcVRDYnVwZTVOb01SY2NURk9RUUFYNVF4ZU1mSnlp?=
 =?utf-8?B?SU93UTd0c1RQa3lrM3Jwa21xWTVCa0J2bmh1cEJ0SDNWQ2RaTzhOVWNnUGNB?=
 =?utf-8?B?djExUWZiTUVzOTR6cFNlOThuQVc4clc2bnFGUFdFWmw5MisxQ2RHcHBEdTdl?=
 =?utf-8?B?b2VOSjdxWGhJRWwzelJPbHRLMzlaTUdNRGsrMmphcFJIbk5MaEo1QVdMY0l6?=
 =?utf-8?B?c0VHT3BJVGV3UnpRUFFKQWs1ZUYvTm5RakFvSU40cnM0endKYzNqd0t3TG5v?=
 =?utf-8?B?Y0FwMDNnTUF5OWsvU0JpeTAycllsUTlHUFdFREhoMkZEKzlxRmhJNUdMN2di?=
 =?utf-8?B?WmVwV3JVanJhcmRwUGpPK29MMjVtQkJaRXVuWVpIUy9FSEFoSjI5eStFVlZP?=
 =?utf-8?Q?yMVk9WjGsHRLprbmvcFXR9bG7jugD4Qb5mfviRi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d53497-6fe8-4b84-e34a-08d98ca79ebf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:09:40.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHP9KrZh85uXT028Y9TtkYMxEyM8Db8HGrfQREaDy959Q34k6xs96bAkCydBKJvvaDPMeL8O8i3kWwt9U4DOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

On 11.10.2021 12:56, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU disabled"):
>> Ian - I'm also Cc-ing you since this feels like being on the edge
>> between a new feature and a bug fix.
> 
> Thanks.
> 
> I think 2/ is a new quirk (or, new behaviour for an existing quirk).
> I think I am happy to treat that as a bugfix, assuming we are
> reasonably confident that most systems (including in particular all
> systems without the quirk) will take unchanged codepaths.  Is that
> right ?

Yes. According to Linux there's exactly one BIOS flavor known to
exhibit the issue.

> I don't understand 1/.  It looks bugfixish to me but I am really not
> qualified.  I am inclined to defer to your judgement, but it would
> help me if you explicitly addressed the overall risks/benefits.

Right now our documentation claims similarity to a Linux workaround
without the similarity actually existing in the general case. A
common case (a single integrated graphics device) is handled, but the
perhaps yet more common case of a single add-in graphics devices is
not. Plus the criteria by which a device is determined to be a
graphics one was completely flawed. Hence people in need of the
workaround may find it non-functional. However, since our doc tells
people to report if they have a need to use the option engaging the
workaround, and since we didn't have any such reports in a number
of years, I guess both benefits and possible risks here are of
purely theoretical nature. Note that I've specifically said "possible"
because I can't really see any beyond me not having properly matched
Linux'es equivalent workaround - that workaround has been in place
unchanged for very many years.

> But when reading the patch I did notice one thing that struck me as
> undesriable:
> 
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -750,27 +750,43 @@ static void iommu_enable_translation(str
>>              if ( force_iommu )
>> -                panic("BIOS did not enable IGD for VT properly, crash Xen for security purpose\n");
>> +                panic(crash_fmt, msg);
> ...
>> +        if ( force_iommu )
>> +            panic(crash_fmt, msg);
> 
> Does this really mean that every exit path from
> iommu_enable_translation that doesn't enable the iommu has to have a
> check for force_iommu ?
> 
> That seems like a recipe for missing one.  And I think a missed one
> would be an XSA.  Could we not structure the code some way to avoid
> this foreseeable human error ?

I'm afraid I don't see a good way to do so, as imo it's desirable to
have separate log messages. IOW something like

    if ( ... )
    {
        msg = "...";
        goto dead;
    }

doesn't look any better to me. Also leaving individual IOMMUs disabled
should really be the exception anyway.

Jan


