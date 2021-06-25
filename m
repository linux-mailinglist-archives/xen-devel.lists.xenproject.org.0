Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6523B3CB5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 08:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147046.270768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfMw-0000sp-8m; Fri, 25 Jun 2021 06:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147046.270768; Fri, 25 Jun 2021 06:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfMw-0000po-50; Fri, 25 Jun 2021 06:31:14 +0000
Received: by outflank-mailman (input) for mailman id 147046;
 Fri, 25 Jun 2021 06:31:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwfMu-0000pi-MT
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 06:31:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84e8a9c7-be87-492e-92ab-6955f1efa122;
 Fri, 25 Jun 2021 06:31:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-S-KhC4khNjOeeVnvPgU28A-1; Fri, 25 Jun 2021 08:31:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 06:31:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 06:31:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0262.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 06:31:05 +0000
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
X-Inumbo-ID: 84e8a9c7-be87-492e-92ab-6955f1efa122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624602669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F9w18Mp5lWdHoUibn/6rsn2m3iF8YMsSgt3o1ggwjw8=;
	b=kn2Xnn90pxD6jeL+uyoYibKJpItNTXoLGsE6PZPPwM6gF2iy4FoRmZh2DkGTJC5R+f180H
	OhTgTjhowgCGlwru6c2B6MhuhRF3q2KbZ4mY64FXCchizw6/23QdJN2dkoIemDzfJUBtvf
	zADvpEa8vjXQ9dYqQmBgkWKr6vLUaV8=
X-MC-Unique: S-KhC4khNjOeeVnvPgU28A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIuY3KCJxOp4dzxPi2zGur8d1gb0YkdHYEfins2+b+FHlW3OuwVO9qhyXboN0zIGf0puwcdeJUxIZUchX8q4nkJC5LquuucM02VcXvjeOn5VUdvULl2z+VErF+6UOa1Ag3pKy3gk0oZJgAWOvwhM070pdYeG+MOgF57+9s3AbuVZsLvX7tbV4hFb4mfYPxZpEb+9KeB/K1+Ya+fj9JgJE98dPwv25/uGjSWfnzAW53CWQqzIF7tH80xFc/68AXToEfzz1/9HvQNIFaeNZ8Xqe8R3eRqIm3UsKksSKfTu5TtuHcwCpB5k1K/nRbdi35lI9K/UsDnmvb7aU4HoKoZKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9w18Mp5lWdHoUibn/6rsn2m3iF8YMsSgt3o1ggwjw8=;
 b=LYRoVMoPRs6QvFWwyK1Epe+ACRfmUJsh6PuF77resBef0h32xfDfq5lltxas8ooGlJq18SplkiHEOdsiDL6H3JSLillSX7hStzgaLJTCePIr7Psq9PBJQFzC50r/B0/o0HfKRiGTNYhef8A0+++0WpQ8nExYHW81sdtHgwDHR52uT47KPZ2xnsGP1DSBulsNKMJT8xX0XHos6GI4KOucb/ugUgbj9cxAxyenrB4h3vn39XnrCEqmycQaXkaKdAo/Tpy94VkTPJZuorNpTKSfkBIRoG6lS9+GM+JttX6k56B0wIFCc3Y1YtA7jrctiruCDpR8ecVJQ3njE9cauXhM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
Date: Fri, 25 Jun 2021 08:31:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624175521.20843-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0262.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::34)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15ac994-348a-45e6-22cf-08d937a2cf9c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5743A4748DE22699B07C7970B3069@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R10GTe4aigXziNcRu6+mREnIg+J9rDDdCUWdNYhObpLv/26t8UfL3YGf2KaDrJrrYVBdKLOUEs/8hcEhAkv3Rl0aiJ2DOEGAuhQLedGXTUo6tMg3chG019inMeQJSRSDPEujAtiE1lTTnt3GhTNrJyRzgt/zLQUjn6Rl8gJ8wvVD1CXnuLTGd7PYYtfXyx4MQ8ACDWLgt/k/RtajRVQUHCHUxx7ikIPeddC8xK5KNuAmtlB9J6jE0tZT9vI3g/fpcjaW0sOs3AkCtXwGR5R5fU1IBA8+50SmCfLREgM0OE9sLtjc95kvTKztjGxgp87/1lXo/oTRRwa/Ydc3fDtUn2+CXC+WzyFj7VFRQy5OM5aKHmMa8/TpcVDQV0kFLNPxtREbOY7raLGwCwNOQABSFgtQ+vKsyQnbtxHPxjmEuOnTWOhrE/EVkF6EgPBzlaquoLQk9XBdp7suTZk3DLFKUsUj7fyPv491+UFYW8s+5oAaup41R/INJPRVp0bCrBDCUbGVKy4Wx6TGY2add15qLeoYjyNwTAMJYKAPJhbk4rPpHYeN1ZqEQd4ZskaEUTUuL02k1UAIynRaSlZPMhYQmzY3ky7A0VEbjNGG7UBeM1Nz4C7Tx8K6hMN3DTDvrmDURKmEpin/Qsclm8IkEP+GVAdlKeSg68dvuAvbr4jbMgKIeZUMv+0GnNAWumb1OHCY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(36756003)(66556008)(6486002)(86362001)(2906002)(66476007)(31686004)(31696002)(38100700002)(66946007)(110136005)(54906003)(316002)(16576012)(83380400001)(4326008)(5660300002)(8936002)(956004)(2616005)(16526019)(53546011)(26005)(6666004)(478600001)(186003)(8676002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NNQWZ5dGNwbEVBbU1UaFgvUlk2UjhtVE1tQ1I1b2VrYkp6M2UrMVdoeTVM?=
 =?utf-8?B?aUxUTWdrUkpRMHBEak9jcE1qcTd3STVLYlJMcDZzRUhYYWNKdXdtTjl5WWd4?=
 =?utf-8?B?dlQwZnpYZTlHQnFsOHhPdWQvUVg5bHAyTFp6TWtSUU0vSXE3aG0rNkhHNnEv?=
 =?utf-8?B?TVBCaVEzbkFvOWFUOUtQb2JROHVYV0Y4bWYrcEJvQWk4L2lPam5CeTZIT0lR?=
 =?utf-8?B?dlBxYzFsWHVzWjl0MkUreUYzdTAyYVBjV2hwMDkrV3QvaG4vTFI0RXV4M0ZJ?=
 =?utf-8?B?ekMvczNUK3NTVHVlZDhOcE9YTDZoQ0QvK1E3Qlc1UEoycU9hT1ZrNUVsTHRP?=
 =?utf-8?B?STJNcGRJdW5paEVKbVhxd0tteCs4Tjl1VCsxdklLL2ZHeC9RejBuaTZwN0lx?=
 =?utf-8?B?V0RuSExzWkF0K2g2ZW9QYlA5bExzSkVhaGRJVEhJR0FycFJxcTJFb0V3Z202?=
 =?utf-8?B?NEcwNXFFOTJMSG5UanhQdmNPSmh0bGVkNktIT1BUWkc4bTg2NldJMk9Udm5J?=
 =?utf-8?B?OVhFcDM4eDAzYUxVY1Q0cU1wQ21FMkpYMnVHMUxjeDJQbmNDSzZOZXFtQlZR?=
 =?utf-8?B?N01vaTBuYU1yUG9LSzhQVTB4UmNGeFhCcnRZVkt2WVZFVHFFZTVGTDR2SVEy?=
 =?utf-8?B?eVhyeS83M1dMOXI2OW96blpmUUUySUtOM3FzaVRxL0Z1NHNUc0VzMXVNWnh2?=
 =?utf-8?B?MVFVc0poVnFORTZpblZDbFd5disrbVVMZ1VZUnd1R2pMOGMwZk16Y3BVa09t?=
 =?utf-8?B?bFRoUTNub285Z2dHUXdjOVV4azJ6YTFySUlxYW9RdnBjYkRJNVA4Nk5GQ2g5?=
 =?utf-8?B?a0EvWmxCREsxNWNsS0tTaVNUUndxVHZheTlsRTdOa1hkZjFwaGdKSkNqREpo?=
 =?utf-8?B?bFppZkVUbnlIOUh2NnlwY2FKSThybkFxd3lXOEJER1VQTDVxRElKS090UjhS?=
 =?utf-8?B?eUtIRXNqLzVvMHJYbjJCU3crakNsNVV2emkxV2dEQzJIOCt5c3hDTDE3ZFVM?=
 =?utf-8?B?MmM5YmdIZzhMQWI2Y2w3aDhRRFlCb1NxSEVNS1VSOUZsRXQzNkgweEo3MWgz?=
 =?utf-8?B?QUpsYno2Qk1WY3pMcUc5TnlBZmNpbmh6RG1aem9qN3ZWOXRkTjdWNk1zUkIw?=
 =?utf-8?B?WHdCc05BVVFpSnh6R1E5d1I1VW9oaERZVUV1RHRvQUJSRFpYVVpVRkJabUpj?=
 =?utf-8?B?TERvSitCSGhJbml2YkFsSTQwTU5vNm9JSlBPK0ozNnZnU3RJcmN2bmFDMitu?=
 =?utf-8?B?eW9lSXdPRG8xR2JMWlI1eTlvUVNRS3Q2ZDA2eElwVWpuN3ZTVldKcis4UC9i?=
 =?utf-8?B?alBlN2ltZGFJamI4dW5xakduR0gyNmZFUkxuYzlRd0JhcElaaGM0RVdJTG5E?=
 =?utf-8?B?eUtjNTh3a0F2THNrUGg2Qzg0M2VOaExKekZ1ODBqNWIxbFlITkd0ejRTU1Q2?=
 =?utf-8?B?Z2lyOWxVd0pTYy80Nk03SUFCR0dhNzZBUlBxTGNua3duRTRId090aHFWU3Na?=
 =?utf-8?B?Ri9vQVhna3JjdEpPeWZHc1BFRjJpcTUwSmZMcmdTSFFrTDRsU2QxUGJwMkZX?=
 =?utf-8?B?Q3BCcVRVMmQ2WDBmVk1GYXY2MzB0ZUtFOWdaWjhkcG1Ub1Y5VG1JN3RXSlRZ?=
 =?utf-8?B?QjVBV0VUT1E0YTIyQVNNYW9qa1RxWm4rOXB5aWEzS2RsNVAxOWwyL05LdHNp?=
 =?utf-8?B?UytJeXZ1N0lJaC9Da1NIazAwTWo4UEt0aUpvbkhSa0FlN2dIRko0K3RlbVdh?=
 =?utf-8?Q?FJIIVQsYXc212TT7s5cG0xXr1UDpLFX0ubHp51k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15ac994-348a-45e6-22cf-08d937a2cf9c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 06:31:05.7921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVOVJUzQTuhX4HN6Jxx9aXWtyBEIEYpMOpBp+V7yg7H7WWrOCCRxIKtNKFw8eZO2TtpIC2co51O6N2oaeDS96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 24.06.2021 19:55, Andrew Cooper wrote:
> Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() returning long")

Is this strictly necessary, i.e. is a Fixes: tag here warranted? I wonder
in particular with the possibility of backporting in mind, where I think
we shouldn't easily alter SONAME and file name.

Jan

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/libs/call/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
> index 4ed201b3b3..93d404b79e 100644
> --- a/tools/libs/call/Makefile
> +++ b/tools/libs/call/Makefile
> @@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
>  MAJOR    = 1
> -MINOR    = 2
> +MINOR    = 3
>  
>  SRCS-y                 += core.c buffer.c
>  SRCS-$(CONFIG_Linux)   += linux.c
> 


