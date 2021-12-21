Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B825A47C12F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250448.431375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfo9-0002CP-Nc; Tue, 21 Dec 2021 14:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250448.431375; Tue, 21 Dec 2021 14:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfo9-00029Z-K1; Tue, 21 Dec 2021 14:08:01 +0000
Received: by outflank-mailman (input) for mailman id 250448;
 Tue, 21 Dec 2021 14:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfo7-00029T-PI
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:07:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6696f87a-6267-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 15:07:58 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-7EDqGmTRPTescJj4HDJ1Sw-1; Tue, 21 Dec 2021 15:07:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 14:07:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 14:07:54 +0000
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
X-Inumbo-ID: 6696f87a-6267-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640095678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9yovz81oOewLJrqJU3CMEpEKYH0gQj5lw1kvgio6/A=;
	b=aSiLKp51WDwX9AdempDf0WPQYwnAT57fZ7JdYg/UIBuUDMfvuJ79kj0cOIy0LVfWo/nVZb
	JdNzVjuhIc/0L3CoihT9gvLQBYzIK4FXcXOSDZZHn0bNVgQHBpAbMkXnoIFzywz/l7Trsu
	s8yuiLpl1JdHiMNidKO5O6CQkNJnun4=
X-MC-Unique: 7EDqGmTRPTescJj4HDJ1Sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKuiDttzhlnrckI4voup7ItZrl/XzTKDx7MjPD3l8FS2wjo+GaLQicZPcxBhZrLR6YHJN5FmmNhnZ+iN48/wqAACWW5NeQWGh894mjTxtOEizqhaySyT1H7XOr1/oYgiauNDUUOuLMiJKK8IkDJRcp1RkZ2Rk4GrgmVgeb5EgGiiE4SFpH5SQLHvBP6eb+97L0baUNGjn/V8Z0u9y2M3l/aa+iAsH1v5Vd0Vj6o6uZHlruROUMkd7+CbxPrJIyojPIuqSY/ZOYPhrO67YfFnL9yxmMy/JPuC1KBXWiLDtYolYeYozEkzrKMlRTPCxG70lJP8OukEL60y6UMyerG50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9yovz81oOewLJrqJU3CMEpEKYH0gQj5lw1kvgio6/A=;
 b=Tqcekgupdmw4zFHv56lKJvp49DkAQxsWpVmk3K2SjIBqMv2uOdb1J7t6nw5YC/Llkfm2YUhP+fcqku5qwrvqyTQ/XeTpIRE/sSuz5EHFbBlYbk2UNfTKlWk2lj7n4uHAyTaS2IunNME34i5hSJk3FvOrVSnyI3Qh/wk+J4WbGVcoPmjO/g/8+upeSmlHdhxUHl+gNGyayaEBDpr1QyPt5kRQmXYJ9e/mxkyRfLV00sLn2vqH+yZbjaUkA3rCtX4bCxh+ZZE93UZOKRf2xWdHWK1M+YWdmNahslmXn00+QY2TD1/IpOuIagrCH0XCJSibjz8aQTSNtuZ/HSb/Y/+6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcd485e8-3c46-460c-7d0e-13f50aebbf87@suse.com>
Date: Tue, 21 Dec 2021 15:07:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 30/47] build: rework "headers*.chk" prerequisite in
 include/
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-31-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-31-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0081.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b792a71-7a85-4fca-e4b2-08d9c48b4890
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41899A4B6DA7FEA7B1CE3AE2B37C9@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QIn9fjDKPsB+1lh2tsEr67z12fLidA35AuhyYfVZP7QbncIYJ3tmYXCS/lhGtX4dNPxkbLSThob053TsBqE88VKuFvs93kErohQPtUGtDdQv2+EqZjS/B9xQnQDPVynuaDoiK2kxp+RrwtzOflHoSYwgnokWFS3COe/IFKD1SeR7Tq2Ny9sQpemc/w69JoUJie1udxHpEO/FIv9f0V0gCwjT7rHsOhl8wIgEr4nZu56idnzUqzC2ZU7dIGR+fpLB+pkBcZIeoITbNRHkWPyuCwC9uhCouhEBwtt5ysepA3cutfPFCaTuYGkaxxdIGF1I/zRIqKL26YlmTTxn65Vp5GFroHwxAT6jPebHrqLgQpyvnVmTiuH1CUq1d2uC3A0KWeuUgvCZfVOZKFZ1tBpqp4e7ZLy/0EgdNfDJskMjswc+pNgX/PbVp9LRl582nXZzP7q+sVWoC2jcqUjORDXPOSe7GDH2OsqLsGi3u5RnUjueUQ28k1OdV0Jgy4hSY6JByzl0CdCGCz23ATC8ZLlp+JjLHO5FJZE0w4grw0CUz9qcTq9P8AVoOU028mgtrpO0EWkkgVvvvMUkHiMEDnr5Pdh4+L1APupWW35ULrJAD9s5dwGrDDzgMCaIir1ipFmhBlGqa/zTYoYqUM+EB9ROJz4I0Z2AGCHsvdXC+U3U/nJZswSD//o8PKqOplt14hRvoVoVlSUxHAy5XQmyRD4jxKNz0eACrzYuyTXcb3IV30WOiFnDOI9ayOYMCPXFLK6z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(66946007)(66476007)(2906002)(508600001)(66556008)(6486002)(31696002)(6506007)(38100700002)(5660300002)(2616005)(53546011)(86362001)(26005)(8936002)(8676002)(36756003)(31686004)(4326008)(186003)(6916009)(54906003)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2ZmL08weTFlNzlLcmVWcjBTeXUyZzFYaWFwWEw0T25wa3c2NDFrWEVvZFZy?=
 =?utf-8?B?YzVrQWhINFFFeTZGd2svQk5IR043UFo2ZDRUUmprTnVLYWJ0SDlvMjJYbVJj?=
 =?utf-8?B?UWRtRytyK2MvQ2I3TVBkUzdtdktSZXVyQ0xFamtMZnhNNlprd1BWeDdGbVFu?=
 =?utf-8?B?QnJNNlQ2dGl1WXVJeG1BRDlaa2pBRXNHNHVleno2ZWRwTjVwM25FbllpV2xX?=
 =?utf-8?B?WVMwbGR3eXNhellCZFMxYlZFZ05lM1BPNVZhQjNvMEQzNWdYV1pZR3pOK2Rz?=
 =?utf-8?B?WWdYeUhlb2xVU09YbGRlUTNKclNuUm1Yb3lHT25TbTBsd2k1eHJLNm5tSWJV?=
 =?utf-8?B?cTRRUEhwR1l1S1dWL2VZb2d0blQzRXdXMXhEeEQ5RlZIb0VaUFBWQmVVWEdN?=
 =?utf-8?B?OVpYR1gxSHdJeVZWdmRHT3Q2VXlsMDdyTE9teXU5TWdYUkRUK2JhVUlabUVh?=
 =?utf-8?B?QmcyRnlsclc4cGNseWEzWkl4OEpPT1E3S0VZR2dFbCtPLzlScXkzZEVhY3Zm?=
 =?utf-8?B?RDdJMU1jWUd4ZWVjMldwQ094RVV6U1VQUlJ6YWFEQncvZWo0N1NtS2pzSWJz?=
 =?utf-8?B?Y29oT1g3UktLTVlXMXRwQnpKUDA5R29vNVlMVytYUWd3NnBVSC9CSUNoVGxF?=
 =?utf-8?B?QkpXblg5RDZUTVNDZWxvS0xTU0s1dHdNanlWdHV5Nm0yK0lqUzBFMFBkYm4z?=
 =?utf-8?B?ZFp0Q2hKcDluRzVyK3FiaEhhY3JISk1KN3dVRnZvamRHMHd6YnQyK3ZPblls?=
 =?utf-8?B?V0JTVVMreUZ2LzNuRWRjOW1aYkFFMXZBQ0h5RDdwbmVGWnRpN0JPYVU4WkFC?=
 =?utf-8?B?VzVZNStNVjgwNStOdnpRb0RHc0N5VDFMRzk0QnJXTlg4dDltdVNYZHlzNEYx?=
 =?utf-8?B?Ykpkbi9DRVE2aEY3bFQ0bHVSTTJpVFAvLzBMZFVXbjIyd1ZyblFPNGRwbFRM?=
 =?utf-8?B?Z1diYmRZMEdPakhsZUtYbUJTa3QxSEt3NlVXT01vaFUrU2VHclR6RmlhQWlu?=
 =?utf-8?B?K2R2Z2lzNThOdVdBdzh5bXkzVW00NEUvdjdZbGRFcXBrNDBQS1M0QlJOdEpw?=
 =?utf-8?B?WFAra0RqQURWWndGQ2FLSENPdk51THlZYzlsRENjbUlZYXp2dTgxMFZBQjJx?=
 =?utf-8?B?UVE1ellnN3Y2Z29paGJtZGJ5aTJVR2NRMSt6ZTYvRWRCMFl0L1J3N1hiZkl5?=
 =?utf-8?B?TVJNTTdSRVEzaXp2dVNHZmtQazZsSk1YZ3lRcFppZEt1a0ZQSCtid2o3d0NT?=
 =?utf-8?B?eFhucWJvaXJtbmtobEFPbXVzK2ZNRWlBNzhuOTEzYkJWV2NObGZwTlBGQ1JJ?=
 =?utf-8?B?cEFHSHJVbmRQcUhSRjdxbFZrcnA3NE9UVHBxRnVMZnpRcmlwdHo5eHd5aUZW?=
 =?utf-8?B?OUhiS00wZE55b2FoY0dQWHhqYXlscUhRY1BkQ2RqenFSTDhFRk1nQ2FKNmRl?=
 =?utf-8?B?dytiSHJUNzdrL3Jna1NtQVQ2eGxwZkovZkFyd1dMU2syTVZDekpBZUc4UjJ1?=
 =?utf-8?B?Kzc4Y09zVDRmcnBzVGwwVCswMlhmZ2hsL2xHY2xiYXpoR0hOREdyb200UFYz?=
 =?utf-8?B?ajBEbUNPTWZNbjh6VGFlZUE1MzE3V1prMTlKc3MvL0h2Q2Q1VlV6NUc4SnpQ?=
 =?utf-8?B?VlM2OG42REpSc0FaSmdSU1orUDlYbXNSa0VaRitkNktjZ0MxOXErMFFuQWRs?=
 =?utf-8?B?RFhTdStDc1ZSOU1HL0QrRjV0bFlkQ2FiNGttOUNuQkpQOG8vci9NNDhISHlv?=
 =?utf-8?B?TmxZYVJqbDRnZzdoQ3hTMk9sK3VtTGx0d3NFdzlsSURleE1McmZiZURBTnZt?=
 =?utf-8?B?UlpaZHpiK3c5bXc5bnF5QS9DbEtkcFVYVFc0TStUK2VlNFQxWTJTYTVMS252?=
 =?utf-8?B?L0xLazlQQnlheVJ5UFJtNGdMVm95QkgxQkd4QjRjbmtzSGlRQzFicmJDUVd6?=
 =?utf-8?B?WFloZ3hIMTdNZ2dHM2gxckhzYWxKSjFWKzE2cXZ3cDFHYngrd0pGSDBOUHc1?=
 =?utf-8?B?bTNqaUxJTklMUVVRblFvYWRpL3NoZ201TThodGtCdmtXQkRGUmlUQnVkYVBw?=
 =?utf-8?B?YVR6YVRZYU0rdUhxY3hYdlhhaVIwQ2JqL0xLZHRXTzJkemZjZVZjSmRLdnFR?=
 =?utf-8?B?Qkh3N0s3VFREd05zaTE0eVVPUDNHTFErRkFGeXdRM2pUYklYTk1WYTJGTWhF?=
 =?utf-8?Q?61FsoStTkg0b3qUk9fQp6DM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b792a71-7a85-4fca-e4b2-08d9c48b4890
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:07:54.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9GP5TwOKE4WcXOizAIrAUhbfeqvcC2QK7p6bF7wTXSv+HiV/gH+nZwubP1bc08ms612+dHWTaXRIbbyirA8sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 25.11.2021 14:39, Anthony PERARD wrote:
> @@ -81,10 +81,21 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
>  
>  all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
>  
> -PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
> +public-hdrs-path := $(srcdir)/public
>  
> -PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
> -PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
> +public-list-headers = $(wildcard $1/*.h $1/*/*.h)
> +public-filter-headers = $(filter-out $(addprefix $(public-hdrs-path)/,$($1-filter)), $($1))
> +
> +public-c99-headers := io/9pfs.h io/pvcalls.h
> +public-headers := $(call public-list-headers,$(public-hdrs-path)) $(public-y)
> +public-ansi-headers := $(public-headers)

Personally I find it odd for public-c99-headers to be first in this group.
Further down, in the upper-case counterparts, you have it at the end (still
in context below).

> +public-headers-filter := dom0_ops.h arch-%

What is the criteria to be listed here vs ...

> +public-ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) $(public-c99-headers)

... outside of that macro's expansion here? There's no other use of the
macro that I can spot, so its presence is puzzling me.

> +
> +PUBLIC_HEADERS := $(call public-filter-headers,public-headers)
> +PUBLIC_ANSI_HEADERS := $(call public-filter-headers,public-ansi-headers)
> +PUBLIC_C99_HEADERS := $(addprefix $(public-hdrs-path)/, $(public-c99-headers))

While benign right now, wouldn't it be more consistent if
public-filter-headers was also applied in this last case? Or is
there a reason not to?

Jan


