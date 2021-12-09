Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE846E92B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243041.420326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJWB-000799-GZ; Thu, 09 Dec 2021 13:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243041.420326; Thu, 09 Dec 2021 13:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJWB-00077L-DA; Thu, 09 Dec 2021 13:31:27 +0000
Received: by outflank-mailman (input) for mailman id 243041;
 Thu, 09 Dec 2021 13:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvJW9-00077E-PD
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:31:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4df15d54-58f4-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 14:31:24 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-3imMhHckP0qpmkoH16xDsg-1; Thu, 09 Dec 2021 14:31:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 13:31:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 13:31:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::21) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 13:31:21 +0000
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
X-Inumbo-ID: 4df15d54-58f4-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639056684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bU1IOlukx2Li3M948d4Bb8tPyrGgtbqzjTe+77Ph5Uc=;
	b=PeFrQ6jbyXJ+x2vjoKSLZp9+yg0SZ5JIyxAV8Tz71XiEOJ/SWgEvGbxtcw9mTZz2WcrTCO
	qZHq9PU880I8UdyHFYAtP0mNG11/bCSlLl5dzHYLVSHzbZWlTFrMfscIqUOcO0Ye4M7rti
	Ec+hAKhNPcl6u/LQwf+HiiTc0vu6vZA=
X-MC-Unique: 3imMhHckP0qpmkoH16xDsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDvPk8e5Jm5YNOEk70+8xJoYbJKpRddShD+hLmPTi0cjlXEXLfRKTNhcp93ql2Bh/EfeUlMWRf0an5/KMy8VGsU8c4oMve/AxntPVcTK9WS11RYBKy34LY3OHvhfm5bAFYbxatUJOyPoHBj90NJGZjm3i+RF/4v15NLjV0foZLdSixXvU8nMealDjY+KH+DeWA3jH7twK6EmmWPrlWMOroX44nAK90l9XYlyyr026oDX8QwrUqyfLJnNE5UExPictjpYlBwGg7rAZ98xAcb7yqYwIL55qSBpCHDGpzz96K/O5KFVXcz959kmS2WofsBZzVbcMuBq7XV2arBdPbIM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU1IOlukx2Li3M948d4Bb8tPyrGgtbqzjTe+77Ph5Uc=;
 b=Qz9B0VTebjQ4wYWqRAleQ3H+4CeN5e5L+QwAMl2HxRRcwr5oxsqR5CbLU1O1+yTvQMe+H4LBjSkQflE+/H4z2ngKFGZfXsqAjBClLsu4NGJTFTEPrT70NVOkFTXDQTX9IElel3t+F7Kmo80/BwCddcQ17mLoeO7N/TI8dTh1aaATUB87r6fO+O2kybc5GgfL4CwP8lXMmaweg+0So4YcJHvcfUs+QRTSejAjenWYV8cqRQcsZokT6Ey2asN5lPZA1VE4U3Huoqtt2M+WrvuERlqhjrj73Db02ODslsqlMnG1nFUVwjG75R4ynZl9VXwAApT4VkGP8HV95HfZV5dDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0129a25b-4563-1f54-5419-f1dde8680245@suse.com>
Date: Thu, 9 Dec 2021 14:31:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] tools/libs/ctrl: Save errno only once in *PRINTF() and
 *ERROR()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: anthony.perard@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211209120939.513-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211209120939.513-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0196.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab2e171-3faf-47d1-b19b-08d9bb18304b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61736B908FA53D8C1DD327D0B3709@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LprxzIgD8Q1b4ekkmAldXlwp1TLkUNcAwwxNYYUZHjEX4u2O7gy4SzCQlKQ+OPtrIxYJknqQ4+4usSPA0w2Vp7lMqjM6y3hFshT6N3bCwj7Iigytm8pLwXuqmUJhmzYVRq4pYVC43r2C4L9fKq26P6KRvSH4z3BAWIBJ0HnjJ1ba1CUXa4xfqdX7jxsb7I9cgQ5X9KvVHUeHinODWMqHpzLtfR3hEMpMQZo5M1LJ2faWCcjyQyyhkNRmVXi1JKSdRsoi38cEKa3VKHgzYGYjwCBj6Aj3sGxAAM4DKbbED/FSXeWK9I7GN/POfk2cPank78rEd8yO/cxmrRs58y0ETrPZ15ONDae4CXcDrpOi4lUcQj9Tq6dqaU/BK8YKDrSe6lAvZaqrfpEOczWc+b0gsP2V0dXGdLi5xSH12JUzDG1zmxrkSzWjsWlKRO5f9PXyOqub2KsopHYdy4ci3ayVYPKAvDevax2n20+9TahZkfjAQrSBF0HgBnuVXVyPgTIblgepM8HTrU0zaz+LeCo/lzbL1FS8XRNWEvqRZXkzvcB0Nbza1qbhi7OkzyTJXP4wuUICSTmbpGDctuRpG1KyMe2PKZ5Tp17ZmgWKY7tC5jXh1eelomKB0KdCS0eZembM8WEq+w+AWKJJlmB79daQp/vFruzHozca0qyQ/99SjISlEdn00Rps5lu/XoaQHiSHRmaiM/K3qLV6rP7TCrcLwmFbej7+aeDWMYkIPUuW48E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(31696002)(4326008)(2616005)(66946007)(66556008)(6636002)(508600001)(36756003)(26005)(186003)(956004)(66476007)(53546011)(31686004)(16576012)(5660300002)(6486002)(86362001)(8676002)(2906002)(38100700002)(316002)(8936002)(6862004)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXlKZng0NW9RN0MwaVNIY2xIb2ZzOUlzbFF3ai9DRFFSMmlzeUJjN09nTi9w?=
 =?utf-8?B?SU1BRkQxeFVmajdhWDkxVlpLcUQrMDZFZXl4K2l2L0JnQ0tWNlRkNDVTUEly?=
 =?utf-8?B?eHVZQm1DdlZTUHJCdVkzM1E3S1NySlJsSXZlT2IvbldDSEZOVDhpRFNWb2dh?=
 =?utf-8?B?bVp4ak0wY3EyS05SUVF6cHlMbGNYSWFNTno5NHg3L0ZCT1RpeGJlZVcxa3lw?=
 =?utf-8?B?YWVpMjRCZWY5RlFneTZDcEI0NGx5TjRPSFJJZmxJV0FzV3FzYjRqaWt3Z0s0?=
 =?utf-8?B?VXR3eWMwcWcxalB0UWM1b2Y1YUFsSWFEOHBrVUdUd05FMnFPYytUOERxYWN4?=
 =?utf-8?B?bC9LUllQaWgwaGMzRGo1Rit1bERGVXN6QnYvL05CcG1Uc1U3K1l1dHhUVmdT?=
 =?utf-8?B?VDZrQXRaa2FTQ3A2c25ZQVFlTytOVEkvRE13ejlrdXBVOHZWM1JJMHFlZ3NT?=
 =?utf-8?B?MWdvdkFUOTJsMmo4dkhQVzEvKy9MNnpRQllOQ2wzWnlDaVJNakNVL2VYaFV5?=
 =?utf-8?B?TjE1bUlEQ00wK1IwalpsNzZOTm9kdk1INzBlM0ZXTjQxaVd5Rnd1b3RXenBK?=
 =?utf-8?B?NlJUckdlTW9pQngrMUJ6eG05MDVOMVE3cUtyeXlsVmRDS25YaDZlNGZQRjZE?=
 =?utf-8?B?cDBFMnJiZ2lPVWdQKzZIYjhXRkJVaFdvQk5vZittK3BmY21QaW5lYUlwTWJC?=
 =?utf-8?B?NkZncy85MUlWOEk0QlZYRkxpSUZQanZSN1JTVklCd29IYnJlditEYUZiclRa?=
 =?utf-8?B?aGJpSVJaMDZvbysyRXdLM1FneTUwQzgzMjdWelJ5WEVGb2hZS2xRSDBBOEda?=
 =?utf-8?B?enN5dnhUd2hiM1JYa3FzSzVyM3V1RGFybmE1cTV6bThTM0FDdDVwblZkRjh1?=
 =?utf-8?B?Q3laTEt5eXNSdjhwaU84ZEEzU25WWTZMWGxJL2tuYlY2Y2lPVlR3eWlvK1lB?=
 =?utf-8?B?YzRTL3RqVzRxVmlZRGRzZ09uK0tKcWVadTN2RUtPVmh5cGYvUWpUdXlpMHFK?=
 =?utf-8?B?Q2ZWZDRMU0NBdk9uQmFnYUZmdlJCK1NNUTdhNm44N0t4eERBZ0x4Ui9RMCtK?=
 =?utf-8?B?YTEwYnlSQzhDQytIRldhOFNucWNzd3pES0dCQ1dFYmxFZ1hZditzZ29BRkM4?=
 =?utf-8?B?dWJxNDJNOUJtN0VsMFVLNHlra1VaVklqbWtJb0Uya0lndUhIRDlFSU11RlNo?=
 =?utf-8?B?akdhQk5hWkY0U09GMDlaZmJWckgvTVlIN0ExTTA5cjBkc2VhRStJWDIrazFp?=
 =?utf-8?B?UG5KTnZZMnloUzJldzdSTWRxc0JROFkwOXZsMFVoMmpDSVhqYU9RYlFIU2R4?=
 =?utf-8?B?dU1TekEza0NDN040OWdtTExOYmVWOE13aW9LcHB5MCtJVmthUytiU2ZGcHFw?=
 =?utf-8?B?b2VWc2pXV2NJNzN1Y0QyZVpwam9LYkRERmNaNjNlckZhNDZBQ25ESHROblph?=
 =?utf-8?B?T1A2L3FSS3Q1a1NPaTI0M2EwSllJczAyVVM1TzlXN3RzSFRONVNZeXZXZ2Z0?=
 =?utf-8?B?TmdkS0tEeThaTVhaQXpOa1Urd3ZKV2VsSDNZQWtYQTJxS2p0MmNKTTJFZ1FH?=
 =?utf-8?B?WHZMbVF5YnN0bXRiT29NM25sclkzYUMxVmFDTG44VnJZa1dPNTdBUDFDbXNR?=
 =?utf-8?B?d3h1QjZOczM2ZHUwYTByNnZxcEQ2WENVandtWEJPZ3llVGVRcGVxZHNaUjFr?=
 =?utf-8?B?VGROVlhWYVRWU21RakpjMHlwTzBNcTNRaFhNVUc4cCtjSWxFWFhmQjJheEhv?=
 =?utf-8?B?WWRiRTV6eEVMVUh1cnFSbHA4emQydG9BNjcveUtwaFFZcHdBS3lucEZhUldu?=
 =?utf-8?B?L3hFTTg1a011OUg3QXY5c3E1RHZCcGVqWEo5WlRtYUxON2s4Q0JacC91b2Ur?=
 =?utf-8?B?M3g0Rytza2VpTlp0eG8xcjU4aU1ZTnVzOWJzaTBOdm9kRlpvekUreUdVMExV?=
 =?utf-8?B?b0hRRlgzNGk2VGo3clVDUDBlbDZkaC8raXpZR3ZXTFM4aG1EWFk2aFRLVWls?=
 =?utf-8?B?QzlIbWYrS3kwb3dhL21WVksvMWxpaEJkZ09KZ3kwWngycDNSQVREbjZoZHdS?=
 =?utf-8?B?dHNiTGpMS3FRc01xZDVuODk0dGo3bmtXaEx3UFZCYjRwNUt1NHpBL3VaeG92?=
 =?utf-8?B?SGVqTWdUU2xHamRpVWRYeFRHeERnWFlzcG96RXdsbmM4Z0xGdWtLallZemNC?=
 =?utf-8?Q?ZBY0XTRSBNzXNYQUYlWb7CE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab2e171-3faf-47d1-b19b-08d9bb18304b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:31:21.5810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWVXtVfdoG5KDIQfK+UgkD2/CdycSxY/OeAY6VZisXqb1DUZjyLYoFusuRt16355D7cP/ZO4VLmu8qg1ZGTOFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 09.12.2021 13:09, Juergen Gross wrote:
> All *PRINTF() and *ERROR() macros are based on xc_reportv() which is
> saving and restoring errno in order to not modify it. There is no need
> to save and restore in those macros, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Albeit ...

> --- a/tools/libs/ctrl/xc_private.h
> +++ b/tools/libs/ctrl/xc_private.h
> @@ -122,28 +122,18 @@ void xc_report_progress_step(xc_interface *xch,
>  
>  /* anamorphic macros:  struct xc_interface *xch  must be in scope */
>  
> -#define IPRINTF(_f, _a...)  do { int IPRINTF_errno = errno; \
> -        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a); \
> -        errno = IPRINTF_errno; \
> -        } while (0)
> -#define DPRINTF(_f, _a...) do { int DPRINTF_errno = errno; \
> -        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a); \
> -        errno = DPRINTF_errno; \
> -        } while (0)
> -#define DBGPRINTF(_f, _a...)  do { int DBGPRINTF_errno = errno; \
> -        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a); \
> -        errno = DBGPRINTF_errno; \
> -        } while (0)
> -
> -#define ERROR(_m, _a...)  do { int ERROR_errno = errno; \
> -        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a ); \
> -        errno = ERROR_errno; \
> -        } while (0)
> -#define PERROR(_m, _a...) do { int PERROR_errno = errno; \
> +#define IPRINTF(_f, _a...) \
> +        xc_report(xch, xch->error_handler, XTL_INFO,0, _f , ## _a)
> +#define DPRINTF(_f, _a...) \
> +        xc_report(xch, xch->error_handler, XTL_DETAIL,0, _f , ## _a)
> +#define DBGPRINTF(_f, _a...) \
> +        xc_report(xch, xch->error_handler, XTL_DEBUG,0, _f , ## _a)
> +
> +#define ERROR(_m, _a...) \
> +        xc_report_error(xch,XC_INTERNAL_ERROR,_m , ## _a )
> +#define PERROR(_m, _a...) \
>          xc_report_error(xch,XC_INTERNAL_ERROR,_m " (%d = %s)", \
> -        ## _a , errno, xc_strerror(xch, errno)); \
> -        errno = PERROR_errno; \
> -        } while (0)
> +                        ## _a , errno, xc_strerror(xch, errno))

... while I realize you only stripped only semicolons and line
continuations, but I would find it quite desirable to also get the
use of blanks straightened at this occasion: In a number of cases
commas aren't followed by blanks and (instead?) sometimes are
preceded by ones. It doesn't seem very likely to me that this
would be intentional.

Jan


