Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FA42D669
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209214.365601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxMH-0006do-N5; Thu, 14 Oct 2021 09:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209214.365601; Thu, 14 Oct 2021 09:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxMH-0006bm-JR; Thu, 14 Oct 2021 09:49:05 +0000
Received: by outflank-mailman (input) for mailman id 209214;
 Thu, 14 Oct 2021 09:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maxMG-0006bg-9Z
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:49:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c285b14-a8a7-4640-89dd-0426cc17685c;
 Thu, 14 Oct 2021 09:49:03 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-CXqRQz18PUSETECD8c0FOg-1; Thu, 14 Oct 2021 11:49:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 09:48:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:48:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0036.eurprd03.prod.outlook.com (2603:10a6:206:14::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 14 Oct 2021 09:48:57 +0000
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
X-Inumbo-ID: 7c285b14-a8a7-4640-89dd-0426cc17685c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634204942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGvy/QwWcMZ/OSmXbLZbPXm4xLrBPsrCLiFUyztBCc4=;
	b=JSlcWFKYZPyPTccwK8+TbIMt/NxKVqM4tyLMWJ/MwOHbwVAouZ1EDNZSGr25v3eweh3W70
	6WhEUji7Zie9dxOPuBxLCxAbtm11KnS++Pqk+BBRw6Qf42Ti43P5Ed9i6Z1ULpy11MUxcW
	HriEfy5TQi1DpIIHcOMnkolgcJEHesk=
X-MC-Unique: CXqRQz18PUSETECD8c0FOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7qe/hBuF3Dddkv2XECbEz56I1kU9MqdMcIOM/pHHahbFDbt8GaWnWSAQ3XaMUofcBseuDWqmjdf447NG2ceKB0/YrJaJeOCkudO4uOWkbIp108QQr9uvXRAwijVQDINDndi556THe24HjRMnBTnS1g9X2xWrIp9ZyANHleFW4P5JuMIPlmJQwxOkCUUjCocgJe7HECTDpFBzXQ6Qyls5PzsOCe4wW7Jf8spaf5Jv5UTh8tiav9fDhIpqkiEyaw2mOE3AAeyC8Qm6lLdAmK7zhE3nJ+s+TUAmKD90PUe81OIJhk4QToD9Dw/+52ZuBlOAheDn5QsYIOgZu6DFQK7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGvy/QwWcMZ/OSmXbLZbPXm4xLrBPsrCLiFUyztBCc4=;
 b=e+1mV3gq1lNuBYHVwMFEa01O7+KLU7ktUzVyRBJpJiDXblwiB9OOnGt+rHCoiC6AR5R/5Hs7kYUIbMqKW1QVnpAjzLJ4DUc18Cmx2zWzZSbnoeOTOqaUsbpof3xwRpHtIXJFijU31fAKIDed3ZbC6GRAtnNlW3+ExAdioa5P1eXxP3n5pJM9CAeg7ekR5xUSDjwjbTU+nD61v3WmINpzcqKmy8dvOOrh3+pqYW0Fbu0+Dcb3vQQGHkh/zIJSnm/O31e9+zKp2Jjb+6SVc7S/Zr3O+PnroaZiNzkQ0HxphCckJTW4kpRZgOGvbC6gB12POIluiZZtVpN/QPfnsqS73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 48/51] build: Rework "headers*.chk" prerequisite in
 include/
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-49-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a86769b9-1a93-0b81-5d95-89697c99b386@suse.com>
Date: Thu, 14 Oct 2021 11:48:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-49-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0036.eurprd03.prod.outlook.com
 (2603:10a6:206:14::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09604d33-863c-495b-7f92-08d98ef7d7fd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848BE84647CE4040F0F125CB3B89@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vd2UheSnpCkICm8qoCfeNsDOsloGX5yoPonWVK71l6QhTZ3kWAoCdFRuxK/myqqINzbi20yfJEQWx1ekCIu6AFyo4gSvSJdkjUrcqMf6kmbc3cHAFqb41HuGPnvye9udA3uKyoG1UoLedqVd3yrOT+UdoWFh6AFNbLvra2xYYzXMfWqLQXpisC+aBjrUoxBZb4IB0eDcWaC/r5e8SwDQQ+vviX//nWQfVjceRlKskJMrAEfhkRbCHjVnQW8zRgGflrYM8ssu+ldinlYKQQZ6clDhiU3vkqIpyFFZkB3kBTjhKQ285j3AGuS8fBUQDal4Q5DGBUxDI+RVjCDri/ODmTfzIllKMde9Xtxp6vkDKLF8Eusd8bWcqnqn4BHem0OOnXeDLIQ3YPDhiBJ0bi2WfgE0/MjdvBrhWIfkTEJPZwOOJWhBYU3iGaYkcF1OK8naoQAo3UAuGBPkIYmhzLJMWn23t785B3vGqE11LqKR+485mkNwWxmd5vNiI0/t3ecu3+MWUCEe0yLhmb2Epv+jFAsCaYow58oGlj00KaYPGFwBCL+Uo6wIvfwIlpbFal6dhkJCEsc1T8S6KyiwKQfxrz/BnXiu8IOjk2BVw5XDStv7rGmDODmQvai1jGqn+IEJBlo1npAwAtPaqsH+S9iVtwH+QFZmuZyA0tG3qiXDefdcHQdTXIc+Xq/x5VLXYMpUGIKbIXVLpws1pBoSR17AUNEQiRRNtx9VBDad706vQik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8676002)(66476007)(956004)(66946007)(53546011)(2616005)(4326008)(66556008)(26005)(8936002)(31686004)(36756003)(186003)(508600001)(31696002)(86362001)(316002)(16576012)(2906002)(5660300002)(38100700002)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WklsZUNORjNVYXQ1NDBHU01Temo3bk9OUHhuOUJzc2tHcmRheDc5dmNHcGpp?=
 =?utf-8?B?dlNFZGdYREpKandrM2l5SUZPVm5LaGJYK09hV3VpWWtwQ3Q1Y3RYcXJSbDFE?=
 =?utf-8?B?LzlrQ1VKZlBseVlaNDQvakNUTDFPYi85NjlpRElISU5yaEVMaEd1TUpFM2pY?=
 =?utf-8?B?TWg0d3hQM29pWlpob0diTkt5cEpkZDUxbThwUTJ6Tm9wdmkvVGlCQVFENjd6?=
 =?utf-8?B?YXI5ZEhIOE1OZ0NiTzNvTU5Vb3haOHNCcllsMXBrMWkxYXRROHltYXcxUlFH?=
 =?utf-8?B?L1RmMDk0MjNQYStYZUJrM29XSEM5TjVENmJiZ0ZXd005TjhYaFAwc3ZJVFZv?=
 =?utf-8?B?TEN2SHpOdjdLMXIxYzFhdnpSazhkT0dtZTRHbnE0SEtFczQ3WHF2akpyRVkv?=
 =?utf-8?B?MzZDeXVYTUk2VUZOTjlZTEhDdTdYQU5uSXpxeHVlQk5UNTYxdG01L1RQRDVC?=
 =?utf-8?B?S3pZbXgrb3huRThqTDJMUDhua09TeFhUd0JDem1mbXYvSGsvN1VQaU5McDlL?=
 =?utf-8?B?dkVhakZBdzE2cmY0RGRNSTNWR0d6T3VMc3lleG5DNjQwazMxcXJWN2pPdUZB?=
 =?utf-8?B?RTIyUCsxUVVrMklLalB4eitBdHpwV0FoUll0K0NVY1NkU2Z1Yms1WkoySWZQ?=
 =?utf-8?B?MWgreWRaSStvQ1IxbTNsRVZXVWVMOUZCWjBmYVpDOEE3MDdlbGxvSWpPWnln?=
 =?utf-8?B?YkpGZ3A2ZkVGd0Yyc2w1ckJVSHdpdTVlWG1XQ2hPNElqY1JjTnBlL0MwOTB0?=
 =?utf-8?B?VVdEOXRkVVIzT3g2cEVzbHJFb0ZzY0VvcEFuK1N1dkNWU1dndUdEWUhab1ho?=
 =?utf-8?B?ZzN5Y3Rta051a21HSHBoYmFzaDZxQjZZNkt6NWNSSTBtNHNzNXJxQzMwQUNv?=
 =?utf-8?B?OFFGUEJuNUU1cUtGcjA3bjcxQmZLN2VOeWlOQSttTmRhQ0VGSE1SMjBiRkZP?=
 =?utf-8?B?d05ka0hzdFZqczBwbDlmRFlzd1h4SFZuRVJjZkdNYlJwaWdMQkl6RFZuR1pv?=
 =?utf-8?B?SURSSG8zSzdnODVHY2NQQXlOdy9zR1U0M3ZmNFdQWFlUajRkc2RVNUNXZjR1?=
 =?utf-8?B?dnU4Q2xUZC9pbkRXcG1yNy8xU3gxS3JqS09UMUdkZ2YyL3l0L0RXYkVieGZK?=
 =?utf-8?B?eXdtU3RvYUtGSld3dmRtMys4N3JpdDZmeU0xMXA3T0lkMHY0T0tySjRJZGxV?=
 =?utf-8?B?dFZTWW85MExHL1d2UnY3ZjZDQkdVUVdHKzlYc253N3JSeHhSc2NnTnlKVmlP?=
 =?utf-8?B?VjRyZlYrQk5uZGhGU1p6cnRnemhNMzRsbXdOcTlOQW1qR0xkM0xTR3JxdG9N?=
 =?utf-8?B?ZStGeHZsS1ZqcmM2ekUrM05lVitnNHpyejJUejlzZHVaVEo4cS8xVi9GTHFB?=
 =?utf-8?B?SU9Wd1FoSlFMZzJoSUFHc2UrdkxnRTVzR0JsOXJrOUE1MCs4cFFidUw1eko1?=
 =?utf-8?B?ZzZxYWxLZVNIOWZaRUp3TzRLYWVKUEtJNzEyaHA5cytDLzVlZlE0SDUxTHJr?=
 =?utf-8?B?V2VtWnFvd1lkNm9US0t3NUMzbktERStNSWYrQzJHeFZYR3U4c3o3S05CVWVS?=
 =?utf-8?B?T3Qzd0RMRTJjYVo5TU5oYmVsdXg2cHpheWhiTHNNYnNCT043elhMd2hWeWFN?=
 =?utf-8?B?bG5hTFhrSkc1UG8rUWo4U3Y5NVJJQWZjR0lFL0lTcEw4WHUvQmUvaG5RVGZy?=
 =?utf-8?B?amJESXBMQ1FVcjZtMTNoZnNMUXA5b0Q5TjVOYmdTTW5GcE9HRjFmM3MzSVpi?=
 =?utf-8?Q?DR+iuPlFOIcn4u7yYBWNDMGzB/efAPQvAohOvxK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09604d33-863c-495b-7f92-08d98ef7d7fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:48:58.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhzqSrRNWeQoAxQtXTbVb0uQO/UEa+pcj2TO2V++UwLDT+Iv3Y+nhjfud7q0QkCNJgQ/P/g7hIPf6k3FC1GYMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 24.08.2021 12:50, Anthony PERARD wrote:
> Listing public headers when out-of-tree build are involved becomes
> more annoying where every path to every headers needs to start with
> "$(srctree)/$(src)", or $(wildcard ) will not work. This means more
> repetition.
> 
> This patch attempt to reduce the amount of duplication and make better
> use of make's meta programming capability. The filters are now listed
> in a variable and don't have to repeat the path to the headers files
> as this is added later as needed.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Sorry, just one nit here:

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -78,10 +78,21 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
>  
>  all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
>  
> -PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h))
> +hdrs-path := $(srctree)/$(src)/public
>  
> -PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
> -PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))

These all had / have "PUBLIC" in their names because the makefile doesn't
live in public/. I'd prefer if you could stick to this for all the new
variables/macros you add (lower case then of course).

Jan

> +list-headers = $(wildcard $1/*.h $1/*/*.h)
> +filter-headers = $(filter-out $(addprefix $(hdrs-path)/,$($1-filter)), $($1))
> +
> +c99-headers := io/9pfs.h io/pvcalls.h
> +public-headers := $(call list-headers,$(hdrs-path))
> +ansi-headers := $(public-headers)
> +
> +public-headers-filter := dom0_ops.h arch-%
> +ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) $(c99-headers)
> +
> +PUBLIC_HEADERS := $(call filter-headers,public-headers)
> +PUBLIC_ANSI_HEADERS := $(call filter-headers,ansi-headers)
> +PUBLIC_C99_HEADERS := $(addprefix $(hdrs-path)/, $(c99-headers))
>  
>  $(src)/public/io/9pfs.h-prereq := string
>  $(src)/public/io/pvcalls.h-prereq := string
> 


