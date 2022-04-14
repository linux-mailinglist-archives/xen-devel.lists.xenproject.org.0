Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D155009BD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 11:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304576.519236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nevkd-0000Mf-7r; Thu, 14 Apr 2022 09:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304576.519236; Thu, 14 Apr 2022 09:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nevkd-0000K1-4Y; Thu, 14 Apr 2022 09:26:55 +0000
Received: by outflank-mailman (input) for mailman id 304576;
 Thu, 14 Apr 2022 09:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nevkc-0000Js-4W
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 09:26:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a5a826-bbd5-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 11:26:53 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-CY5Ucz6PO1WLUdOVCshIZw-1; Thu, 14 Apr 2022 11:26:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 09:26:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 09:26:49 +0000
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
X-Inumbo-ID: 04a5a826-bbd5-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649928412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=68DWobKimP9q7ZONaTMYa8j1VPPw+5WKo8zrFkW58vA=;
	b=mCqxNSoCvdQqn0wAHEHljpGkw2BE6JMNGwxy5TKT5DdGcJ///t8btqxKbXVjsUfYJii3Re
	TvDGea9aaXJOStl2uEdyTEiczlvog5e/4Ev36cswrLl57JSv8lGaOJcVvEE7+cK4wfZ3nN
	gJbMYtztoSv6QL9HYR4Qjw/6J2MEnoE=
X-MC-Unique: CY5Ucz6PO1WLUdOVCshIZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnnU+Z87LLiXmKpCym0zt6DiS6i7XCFIS/BAO7HkwX3ouvqHXdnS1IpPFp7AByVFpjUCpIxian4isfYctSzM7bNiSrZPnuLMzCiWaQ6Tk2OgDiygaLHVGTiC8NDOaBzlS6PG+3ynPfs6UW6XYdd1/HbR3kTNpqxIOkZhJInnIQ1ZEhQTZdSacpFEEbS7TIWJdeAjump3k0bZZfe12JLO18lPK1YD/uRYOCA3gc4CKPKjc0qNBieaOKusbJDNcSeB4ljajGEykJt0sqCYmhQiNcYUNqkdgUKYMQtOpT1e3XgbdyWI00WsevydhFEIErlFvaC9j+8bKZ7p/vqhjcgyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68DWobKimP9q7ZONaTMYa8j1VPPw+5WKo8zrFkW58vA=;
 b=KMw1FA1N3kv3uKBbcrk0TIO4kT/rj0KJcZB9oTbDJPh2gV55DLSnNfiw7+kDrfLkQbcllfpyZ8bwL/CO9zPAcVn7P1ShTaEt2KlaZJ230/Yatr2Q5PkVxcVEyvISTBAeYSFQh8iS06fvMkweBq+PKOdc7UDOPlend8142Eva7F7FPLU9DhMOfZ6CHObBV51YOpKGl9pexZyc6/kW7Ih9ZEdWa3Bg/F8hZt8hpZiC5Cc7BhIRz3fy1sXgsAvPKmDG6/pLBtOwhc7VIQr7rqOFKrPWPuibL0uHHI8P/knGVBZydHrFCBMYDiHYPSdFbNts+y8sjuGcWXrUwHubU5xvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <674c4cbb-0e2f-a12a-986b-393b9cc4f970@suse.com>
Date: Thu, 14 Apr 2022 11:26:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] x86/debug: Drop unnecessary include of compile.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220414090456.10965-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220414090456.10965-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2ba24e1-4ea2-496b-bb02-08da1df8e73a
X-MS-TrafficTypeDiagnostic: AS1PR04MB9384:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9384BE19C95B48EC8DDC205BB3EF9@AS1PR04MB9384.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZW4VQECHzlwaMrbkfZh26lc4EdMkxRl4kYRdXWv6qAl0isn6TLvedXtXKv/duUiLxUv0MkOdDJqzXYGfZwKJzGuDfdFYC3MvIT+NdPeN/+n2yUzLEf+sNO5qzySOEVwRvrWcbU331CW2ADxh2BERJeAuBAiOH30H1ZEtIGxfcVMubVnhvhLcvLK7IxhNMApxtWqnKVhkqFkygbD+zBg5zSYQMeJ3kbz7hw6n148ErQPtQm3UlQgOotXIPTIMeBqW63PZWOnJtHZD8F2mJRlerpuS95L0uvxlvE6un5r1Prs8E1NbujwIoNmtk8w8Qy4/ehwnhWjYSJafZvaqkhrATf19CqY1kGfgj/W7ZZxZXpjTAaSPT3hErM+fqka8DOqOocd8dsFdy+wUghMwTHP9V/23g7AmVlB6ChL+pUTKTHtskq1sUpCdAezsPzMUI4L+T32a1zrfnjspUffRGk7uZn6F45k9RHp/pY6+sVkLOeumF3wloOjhL6mcwJEo4MHBIrlsMll6hDKO+tsXHRoG/TVYZJ9eSnBnszEYfKUS8u7Uchd+eO+x3FzhKFhetS7peQLX1f3Bxvt//E4Q6ZFSoMnDQ1PgwOp7w3XGs2LJ753IqHeygOZK/CvF6rR5mWipb3s82eUTufxuR2F0B5c4OocnFCcjpvLwbmyUtW9J8YcjYleAi6kwGltSbxyLYtZruQ42nCyfGmHw1e6w7SkWpa575Yo/aszVtRnVtpJBHjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(66946007)(6486002)(66556008)(36756003)(66476007)(316002)(31696002)(8676002)(4326008)(6916009)(38100700002)(2906002)(86362001)(508600001)(8936002)(5660300002)(53546011)(186003)(26005)(6506007)(558084003)(6512007)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2l5bFA0ZUh6Z014UnIrSlN6RkFqOGxkTFZTUEhuMGdOTmpZeEh6OWRjQldn?=
 =?utf-8?B?TXVHODc4bSsweHRSeGFIdjNFVDNFajJnNWFWNC9uREl5UTRBU1ZsWEJmaG1M?=
 =?utf-8?B?WUprUlhHOSt0U2hUNnZPQkNBV1RDcGh1YVZISWlYY0NHSDI5WUhEd3BoWWJ0?=
 =?utf-8?B?VkxEcW41Z0tybTVoK3NoWi8vYmRKbUNNTGdkUWpxdWx6YnJJVTVRbzNVUWc5?=
 =?utf-8?B?RmN0alpJSDZvcGpmZ2o4WE9hVkdTdGtNTVVPTmNUZXdyRnovYlE5NXdzaFRT?=
 =?utf-8?B?NGFjTTdyTTcySlhyN1NLR25vMUU0SUUzS3BVNFIxQkVkTlFPMnVrc2RHWXhx?=
 =?utf-8?B?OXJJQXRkMHh3THVvTS9WQmRDaTM3aFVOdmluZzZ0VVMyZmlGRmJSMEFpaHBK?=
 =?utf-8?B?Tk5lc2ZRR1lCZnBxU1VwSVprR2Vka2cxakJMWU5XRlNuM3d6ZUVEeHhvM0Fy?=
 =?utf-8?B?VDM2VFRteS9XVllCejVDWUVDZ0V2VkorT0tpek1kdGJsSFJUbmFLZTdUcEFO?=
 =?utf-8?B?ekJWaXB5TkFyMEF6OUdoVDhXWlUydVViRnlLVWtMRzQ4QXZ2YWRvTzdHb2hH?=
 =?utf-8?B?UlFLUm1tWXlGbDNyak5ZSmk2Mnh6Q2dVempKckR5V0lBZGwxYllSTTdVTTV0?=
 =?utf-8?B?WU5mQlh4dzFzZjRZQ1BBMnBLc1FXS2lrc3JScXZhaTBRUjVtRmJ4bFRUYTM5?=
 =?utf-8?B?MldPU3JoS2l0TWJhNGtWT2VvSk5xRHF2akVndEJNbHdkQnVhTEtpUUdNa2Ns?=
 =?utf-8?B?eURIVDhMTXd4enRPTkRadlBnSWJuV2NPVjQwUE5zd1o0TFBjWjFtNmZiemRV?=
 =?utf-8?B?TEF0dTNEVG14bUdpWVBabkkrYVZCSStWOTNYMW5JRUtSeUJSYzFBVWdSTlc1?=
 =?utf-8?B?dVBybG9lRzR6bklrKzdkL0l2NDlMY2gzN1ZMQXl0QldsZnIwVnQ3dWRITUcw?=
 =?utf-8?B?WEZ3VVhlTnRkUkdjYllQcnRnOFBNTnB0TjhEdXMzNk44MTVoeng2d3ZPMzlB?=
 =?utf-8?B?TXgzR0JFSUdiV3F2ZHo5YXRYWVVaL042WVdML0xZNm4wN0g5eUJYbUd6OVov?=
 =?utf-8?B?RUVqMC9DTjZ3NTdJSjNMSGNId285am9FMUovQkxka2g0T1kxeHQ3QlV0STNP?=
 =?utf-8?B?LytENkhXSCtlZjl1dlNNU2RaNitoaVFTWDhOUUpQLzZXVDRsKzF3Y3dWR2VZ?=
 =?utf-8?B?aEVadlhYYWd2NEJSNGFpa2QxQVJXemZOdVZxS0dQdDM3dDdmYzg3bFFGVCsx?=
 =?utf-8?B?ZzU1RnZQL0VabVpUQWNGalVJQnV5ZmZNb2plMEU3UW9lckJZY2FIWGJ4Tk9Q?=
 =?utf-8?B?M1NVT0Z2R05aM1lYZ3M4RUpRN09LakhNVVU0Ukl5KzV6ZDlqSUg0cFFQaDF2?=
 =?utf-8?B?bmJJZUJLV2FqaXg2TEpBWlpDcWZ3bTNFcmNHMGgxenh4bHkrdnU2aXBKd3pq?=
 =?utf-8?B?alZFOHNJQ2dkbW5wekprV3pPRU8vbzBua1pNcFlkZ0hTUkg4TVZQMHJwS3Ja?=
 =?utf-8?B?cUF6SCtjRFhmY1JMUnpmQzZ2SHNBK0xNemhoL2wxZ2J4NG0wUUtkTGQxU2R5?=
 =?utf-8?B?MjRKaXlWaDFsQlB4UFd4SThiSysyTDlLbHpyN21reEdzSTJ5Z2MzV0JZaGZQ?=
 =?utf-8?B?RUNOZWxQWHhNR2Y5WWFuaGVUUkRpRXlneUFaNFk4YzlkcEVybzdYVjV6UGhi?=
 =?utf-8?B?UEhvd2FVcmgrelhaY29reSttRG8xcFJpZEpBM0k3UkRQK2NlNm04TUxDWVB6?=
 =?utf-8?B?dVpMWlFjODBlRWVndlJrYlJJQyt3VjYvU3BZcExnTFd2aWJuem9DdGQ1cDJT?=
 =?utf-8?B?OEg0L2pRTXY3L05qR0hLUzVNYXg3a3k1YlJJRFg4emRDZ0RxQWRtVEZ5L1Vm?=
 =?utf-8?B?ekVXb01GcCsybU1ibXhnNGdvREl6aUdCQzE4RnoxU0E2UExsQUgvbnI4c2FM?=
 =?utf-8?B?NTdoWVZqS3A4QjNTSEFWcGlJdWxVU1VzeEdJUm5WSk5HYVlkNE5BWXFLWisv?=
 =?utf-8?B?UXFJQUZ1Z1E1b0xtaWpPcE9KL3NsdXM0UEtRTm43OUN1UDk5Z2NyT3BLUUk5?=
 =?utf-8?B?ZTJtSmRMNTJFOXlUVzhCdUFEUjB0Mk50OHVaUlEvTHU4OHFWa1loOUZUUDd4?=
 =?utf-8?B?TWwyY2hubnVoSE1nTEVkYTBYUmtoeFNEOTZRdUZaWnRSd0g4ZWF0MWdzNGRH?=
 =?utf-8?B?ZnMyb1VhUVZyK0FkM3Z1TndOd2s3dkVjTWY0ZWRaY2J0MHRINGN0QzdhV0d1?=
 =?utf-8?B?YkJMYzY5c2hiaHAzSjJkcm42cUhnbWw2NTJGOEJQN2ZjLzUvTGNXejlHbG5q?=
 =?utf-8?B?S0tEcmhFZlpLdW05RFNvY3Jrd1ZYMzcwQTlkS2lmbmxaNTFHblRkdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ba24e1-4ea2-496b-bb02-08da1df8e73a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 09:26:49.6858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrF6w2X86voyJe1rF8GW9glt7657UB5NnmIn+NH4VOqR1TnAjyCWz6gPA1d6f18COD6r3n7nxFqKz/kYi5YsAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384

On 14.04.2022 11:04, Andrew Cooper wrote:
> compile.h changes across incremental builds, but nothing in debug.c uses it.
> This avoids debug.c getting rebuilt on every incremental build.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


