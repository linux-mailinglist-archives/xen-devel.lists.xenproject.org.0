Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF3431275
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:49:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211867.369549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOJv-0000lb-Kz; Mon, 18 Oct 2021 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211867.369549; Mon, 18 Oct 2021 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcOJv-0000ia-HD; Mon, 18 Oct 2021 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 211867;
 Mon, 18 Oct 2021 08:48:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcOJu-0000iU-A6
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:48:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bc25d93-2ff0-11ec-82d0-12813bfff9fa;
 Mon, 18 Oct 2021 08:48:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-tbJTzTX7Msy94FY-D12UJA-1; Mon, 18 Oct 2021 10:48:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 08:48:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:48:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0012.eurprd03.prod.outlook.com (2603:10a6:20b:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 08:48:27 +0000
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
X-Inumbo-ID: 2bc25d93-2ff0-11ec-82d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634546911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PA0iWdDJYyeaEKNMoAovVP9ZkLAROthSOpvLGJf88i4=;
	b=cWOnQg81UbmbNBT33GCbPx2lRwnY1JPXiGBMV31AcjVosyvvuAgGPhcgfE8cxlAwCxDTDH
	Wnpa4TEHUOIVoJT/62fdta1QSKiiGzmwA4YGTw9JooXN+Dwc3YvVgcWfPTUgp31HUeEz53
	9UiL1cKqPfCwRjCulgfproHV/Lk/+2s=
X-MC-Unique: tbJTzTX7Msy94FY-D12UJA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCO+9yLrOw2RuHzxxsfcO5N7rYudLiU5Ekokt3E4j16aH6lfAQzUh3eA+y1v981BpaFKSEnaZPWd5pTrai2SZ2dgDLAc75B1P42C3UBMfz2Q7Or11edfOJcSDU1H7SggL9QvH38F1U1g2GHc8EXkfEerOyOv7B4SH2PRZtlFke5VqFkGniNFoQQYWFi+dXm2g2kEKL5oBSdTRtMcz4zABKhl5/NoxJNl3d4jmCB2ACgXJf4nzG44HZ0xMDkEfYXx5CeoEsgc/U19w3K7qj/tshGw2DlU5+UjJ9G+20XY6zJ7bqR0688ZOAeP+jDNq23KJES2tV9GaDovoYHix4t6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA0iWdDJYyeaEKNMoAovVP9ZkLAROthSOpvLGJf88i4=;
 b=Xc+MT7F85WRqn1lrKYB9TnKdBhbkLFWGMe/ImDtribXxW6EQ0bwIdQ7guAW+06Y1LmVyTSXzCUeaqSswA5VfokDdQ38fX/B8jXEh8tuQ1BcFPlgc7keKEEUpfuTSHsZDzqJIcH0C2HRXdREQzoxC90/fa4cRalFyg6gvdJwkBR5MuIpMVxTcIsiXrWujuCI/BndTgvovA8uo91JTCM4mj9fL4ROwJWiXRbTpG79ausmIhgtbGByur7SBryjDl04v+OcUCjciCqdVYVmdHJNffe3REcu3TTfqtXVqcHXt2GP5w969KipkuboAsvHOHbjtMVGrDnMu7t5EH3/uR7cSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 42/51] build: grab common EFI source files in arch
 specific dir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
 <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com> <YWmse5Sv2SFyRMdj@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd11108b-db66-3c0e-9a7e-a5e30b0b5b1f@suse.com>
Date: Mon, 18 Oct 2021 10:48:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWmse5Sv2SFyRMdj@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb4970a-366e-4822-8073-08d992140dee
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27028C9A4A3B030C4695DF40B3BC9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e7RseDFODGZxYX3rIXBJ45NMPqVnrSd2fKgZXT7ljb+EYs1/T45gkJYTgzqmx1O1KGCMC6Po+uC3CK0Xco2JwnMatqHpsm/KvYxog5n/WKlqPEmIPV2rv/5okpeHrkrRBN8AFedK5NaWJ64IB+5CqHbasvSFfMBiYR6AYCAJ8lS/DnVmu19FmjNKbQ/+3AM6C0vu1ph5zQbfKkADk4XvgsRBI9lwWAr7hZxw+ZObJ6I4AWGv9qpYZ73CTioSYnq7afPPhRJOjuC69ZHvdmUaevtRJyJ0LH+6TgZEe0jCTNcaTH0jzpWlyIV5OdU7WaiRe0RwRt+IG49qRxuIaU9ZlrXIlzs3lUd1PpR0gCJ07HH0jDM/qrorSQ/jIcz/pCzXym2UVJ7GGypKigh4+KxxgiCrRsRaDynJPk3QhOe8ryTXeL4ipmR45ktz5fazvI0cugCt+q7n7ZTf5BI2NUA+heQSf+8CcOdVqFfKL2bcJyIJdi5stSmHEG3m25u/VqTlBirvGL3F0mHWhRuldZdUSLo1Q1ydnqJWQA4dTAEUd7DTBgvaIi3xegus/kVq0MyJTH+pr2CVOXFhE7HXhsQD09JYdhs7JoP88ue6fmcRDlxxgODENxbajML8kXnECUjBMx/t3JpDemyOT/QtVI62DIjZKVlEzti5duhYvwaPivw3f63EpE3179vtA7fZEaGmZEDHWwdkmLcFb94dFuxZsa8K6TWEJlxPg996V0YNe90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6916009)(54906003)(66946007)(53546011)(5660300002)(8936002)(6486002)(38100700002)(956004)(66556008)(7416002)(86362001)(186003)(16576012)(8676002)(31696002)(2906002)(316002)(508600001)(2616005)(36756003)(31686004)(66476007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aktteTM4Z1NMb1RUTVBNVXJOVHB2cFNTR3p2bitLT09raDVmeFlhalJCRDVh?=
 =?utf-8?B?VWJhUUw2Y0F3VUNTaUZWZXF6eTA0UG5URjVXMGVOK0podVBxeGVnL2pET0ha?=
 =?utf-8?B?MSswRFF0UDBEYjl4b05IaGJVMmk3SEFhaTc3bGV3enVUOURHNldjd1JCYnJy?=
 =?utf-8?B?cjA3ZHZkK0VwT05hVW9ETkxtakNWWEt4azM3ai8rVWZaWjFaeTQ5WE9CZWlW?=
 =?utf-8?B?dFl0YzZBKzVlaXRaSnJLOXozN1hxSm1aMHJPMkF1UUtNOWFTaEdwaHBUK3pv?=
 =?utf-8?B?Y0V6a3h6NFF6b1U5S2N3SlgwOUg2b1hVSjBuUWJpTUFLbytpR0dKQWdneEV0?=
 =?utf-8?B?dWl4NU1UZmtzUDdJbjVoVmZHREZFZlJwVEMvWFUrRXkwZTJOVTJWbkFkSnFV?=
 =?utf-8?B?Q3hzYktKcllVVzB3WWtqaU1GMGpXcHF6aDh6dE5rSXBQWndpeHN5MVg2MGFy?=
 =?utf-8?B?NTFKVVBucUdMNUw0elo2cDlLWEZNRVNJblljQ3FBOGh5Um1NQ1RUcm5jY210?=
 =?utf-8?B?Y2JDQnJZRWpsZHRvMWhWZGd6bzg3TGJRRlNSMGhSKzRtVDVOcTRJdFFlMlVs?=
 =?utf-8?B?RHRKdExwTnhacmhCM1RzK0pVNzVlQmdicHArYTVhbW11Mkt0TEVPQWh3WXQ0?=
 =?utf-8?B?UGFuNVg2V096UHk5NDdlNmZRVW1aM0g0bmdOUGR4SVNjTng5emxQWTNLL2g5?=
 =?utf-8?B?OFRsZ3B6VXg3bGZqZFRSMHNkaE1kWFQ2U3dGRU9sa2VPUGZNa1Vqa3RpNDdW?=
 =?utf-8?B?TDFzam9kaGdyQ0h1eE5OZXZqUmFreGRrL0ZJWHdPYWcwVVhDY1Y1OTIvcHlm?=
 =?utf-8?B?TXhPL2NDVWdoNGo5ck5Xc3FTWVNQSFNXQjNMMXZhRHF3VkhHZklxMVdkVWZP?=
 =?utf-8?B?bGdGSzRtVEFHSFd4d3lXL2dHZnNmcms1dmtMSlNPSHYxT2xZbk9ydWpPR0Ra?=
 =?utf-8?B?WHRrRTU2NmhyandwcUVYU1FXWVNwSHdLdVBYaitSMXljZXNZbzRYdnR0enJD?=
 =?utf-8?B?T05JTlhqVERXeitUMjMzd2xUc0MxUlN3UytUUFA1YlA4VXlrQ3VQVVB5dWdV?=
 =?utf-8?B?OVcranQ1bFV5TUVGd2xMVy8yQWkvYVoxY2tzeTg1TzBsdVNVcUc2OUMyTlcr?=
 =?utf-8?B?SVZMK3VMajBxREl0eDE0NmdpNjhPbXVMeE80N2pOYTl6NWdFQjdwS3hPNnpy?=
 =?utf-8?B?U3h6dmpydDcwZVdzSEpaVHQwcVFLTkcxNEozamJMWUlNd3NrRGlTQm1ZS1Vl?=
 =?utf-8?B?ekR3MW5SbmlWRGZWdFVUVE1Xa0FoZm9ocFQ3blVvejZPZkJXZlRSL1BxZ21O?=
 =?utf-8?B?QzVEMERFbUFRTVIrYU96bUJ6UnloaHZmVnpwWkc2SGhzd3l5TlE5V0dSWnE5?=
 =?utf-8?B?WkVXK3Y4ditEeUpLMmdjVHc3TGEvcTJJOUdHM1Ivbmd3ZkxPdFRBYlRaM0tX?=
 =?utf-8?B?KzFPbnNGSlhKWFE5alhsMkhWM2tTRUI2KzlyUkFnZDFTQzFUZXV1cDlxYjhG?=
 =?utf-8?B?MzlFMGdqYk5pVmVpK0F4c3VUUW9yWlpJNWtjMmN0OG5MWVdWcC9GaU9acUFp?=
 =?utf-8?B?WHRmOFkzSG5IR0pxMUI3aHNJaTY0YkpjSklVNmtKM0J1M2RMT3cxV1VTMjVU?=
 =?utf-8?B?WXVNWnd6S2tTWjkreC9EVS9pYnUwcEo0WTJoRU83M2NzSjRKQ2c4ekd4TFdG?=
 =?utf-8?B?TnYxbVQxK3orNmNBQVVOMStrS3NmQS9IcCt3K3FDMERsQm54VHNnZVJiQTJG?=
 =?utf-8?Q?/zE+1e1tfQ4dXBiwjqPILx36HkFt1FYNUQU3qkl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb4970a-366e-4822-8073-08d992140dee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:48:28.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggQbGr3PA6MH2BXyRDd9cqBCyDbGfwEqg/LewI4SvUEfAkUvGTCusUw54bs4mrBNurtulCCqW112UEOOczxH7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 15.10.2021 18:29, Anthony PERARD wrote:
> On Thu, Oct 14, 2021 at 10:51:44AM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> --- a/xen/arch/arm/efi/Makefile
>>> +++ b/xen/arch/arm/efi/Makefile
>>> @@ -1,4 +1,10 @@
>>>  CFLAGS-y += -fshort-wchar
>>> +CFLAGS-y += -I$(srctree)/common/efi
>>
>> Perhaps another opportunity for -iquote?
> 
> Yes.
> 
>>>  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
>>>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>> +
>>> +$(obj)/%.c: common/efi/%.c
>>> +	$(Q)cp -f $< $@
>>
>> In case both trees are on the same file system, trying to hardlink first
>> would seem desirable. When copying, I think you should also pass -p.
> 
> I don't know if doing an hardlink is a good thing to do, I'm not sure of
> the kind of issue this could bring. As for -p, I don't think it's a good
> idea to copy the mode, ownership, and timestamps of the source file, I'd
> rather have the timestamps that Make expect, e.i. "now".

Why would "now" be correct (or expected) in any way? The cloned file is no
different from the original. Nevertheless I agree that -p is not ideal;
it's just that the more fine grained option to preserve just the timestamp
is non-standard afaik. You could try that first and fall back to -p ...
Otherwise, failing hard linking and using "cp -p", I'm afraid I'd prefer
symlinking despite the arguments against it that you name in the
description.

Might be good to have someone else's view here as well.

Jan


