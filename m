Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA773562C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551045.860342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDP6-0004FH-Oz; Mon, 19 Jun 2023 11:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551045.860342; Mon, 19 Jun 2023 11:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDP6-0004D2-ME; Mon, 19 Jun 2023 11:50:40 +0000
Received: by outflank-mailman (input) for mailman id 551045;
 Mon, 19 Jun 2023 11:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBDP5-0004Cv-9w
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:50:39 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81ed86a7-0e97-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 13:50:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7410.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:50:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:50:35 +0000
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
X-Inumbo-ID: 81ed86a7-0e97-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jwb5D3OWSFSLnryyZF/hQzVMl8H/kN7VVzNUiSvJOOKz9xxYlcXsFWHoQA7zIJzVwK3tCs13LtCeyx/NSPWlCFQsTqaE8zBbw9RaLTKEWZyHKnIHG6tnlM+JlVJ8zUDEdU+sRxcuYjacIUgBCC2Pq/AWODPmssxsm+toAvOk3+cuNC3PGkgOno7plBAHnPC+jhClZCooGIe2A1RUU97BuyvyUimfjDsI3yq+Tm7ased1m/64/iDghJkdw27fpYw1wYqo3SFXNmfYNxFkhoQEvDPwUi4Th8to6K1hCuHXMv1Jhl+9J18nJPKHFTCgpRYv4WROfDIrtH03TlgtflwqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZEz6gcVfK2oD2tJiSnN8RjtGRQIENSV259Ixze9tOI=;
 b=aS2LmDSZ7h8BhFLiOoKzJ9POnMC6T3IVFuEO7k5SX6G8feGFi64mdEHV4sJWxrxhI/bZN6Tyi4uYPZdQyC6YShjggSmGLermxRaiykeONu734WoBuHjFLGjtBrLpZEQMSGlolDdPUNYXPr/Ng0okj6oYzL+wFqGsMfHcfBU6WktBOj18K56700zxspoEq82qoyB6JobgbiV77qZpbjBZEhw1RPMt2U+bznbs1c3XynFU6hmIZmTMr+6fZ2KqY1UUCbndft4Pcqf3ZpcAaAN68mwmPu8FfmSAXAoQTY44i6i4YJcyRyPEdGqU2rWsHUYO3BRWPl8KZvvubgB1l9kXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZEz6gcVfK2oD2tJiSnN8RjtGRQIENSV259Ixze9tOI=;
 b=p76PkXppWZU42E10FuIRwE8UiJK2Ynk/gkIs1kEbsDb2yodRleRh5+DjVVivMPqvuuaj/sX77a0bxghjSy32jZcgkKfqTq8vUybQ1n+1MJ2RRORmvb4UYhTt6gHZ0jLdORmlX0UJ9S2/okctL7QSX6Z/mfeR8paCSijfVM2yJSu8iLcIBJsrwExYIbHODBNBEtgdeY/FEA1cNMbvgZRg5XOd+Yn++ZqMlgkG2o/5YYZ8xf3ST/4ljz0qrpoKzbdLV/3sOdBtVHxLFJbTJU3ZMnuTR+/jFqGwVvhnKD9zvGrDf9176K3oGGH/N8CBBG6KPikSczwTX27Hg8tycCrrCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44399046-c9b7-2020-a896-b01efbf42c28@suse.com>
Date: Mon, 19 Jun 2023 13:50:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 08/15] xenpm: Change get-cpufreq-para output for hwp
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-9-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614180253.89958-9-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 31024157-5611-4190-9991-08db70bb649d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Kwpg3e3VViMrHHjupQ293CEZC4rTPltaaoN/dW+J/nt1VL9yIAviChoYFGrCv5gT9YlSh/xxPRqLcBTjLhhiOJZqElaX4yCKzI+2y/XBw3dx0PgOzbx+TUDtJHDUmGT0Wi3sy3/ukIjwMRkh4rJPuD1rIh99OMUkRF1xB5WOqHEsziiaiBmhjpGeZow/UufruqgWf8OVmI+5IUHWU6RJlUNI1wXoXG6vCdFZBRQwLS+UUL7jZrlfAy9v0O8LG2m8lbIFIbBEl9P36vsA53TIktPn+M7uaN4t5jU9uiNgl4puOyYn9M76QSVCM8uu1BHu7tN2gFVBQxTZRtZMPXJyFAoI/TS643JTvcoKriFmJfWW+O4aTXfuWicfzzKkKQh8RNVxn97vXGEM67uoabriXpeYUJCRiK/T8GmC+ceGI2TDu7Mq6OV5c90NGi1BICpx8fUiD7akO22DQg8MiWcu+BjegPzwek3zEj1f9bK4zLAGMu0ZaCAZ3nUQw/Nu1+BeRq/vhpyx4bICyPx3IBmhxfK+GhSn6YsinS3aIQG40Fw32etI+uDQ6gcm4uzQsvgQqOZlNzaSQzjq84DPVQwLNsVnawJbvd9lifQ3VMtW2ybqnasjraZe79Tqber91/8clIRo5G9qq0fA3dOkM0lMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(41300700001)(5660300002)(8936002)(8676002)(4744005)(2906002)(36756003)(86362001)(31696002)(26005)(6506007)(6512007)(53546011)(54906003)(186003)(478600001)(6486002)(66946007)(66556008)(6916009)(66476007)(4326008)(38100700002)(316002)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QS9EdkNMMVVjQW1DMmpwK0dmREh5djYxVlluZTFOS2lZWkdNdHFWV3lSeTNh?=
 =?utf-8?B?N1pmejFVWGhNbEJwVjBuNmgvRzEyU2hjc1Z4N0JWdlhNVEVTK0tyY1lsRkR3?=
 =?utf-8?B?cldkais5OVh4MG5KT3YvU0N0c1RlcjJFeGxValhqdk9ETmlqcnMyTmRwbUxu?=
 =?utf-8?B?endtYWtlVEZHd2RBcmRXbjY1VkZzWS9LZ1NwRjcwNHA3NzRLZ014ajhpWUha?=
 =?utf-8?B?MnlBZHJzWjhzVG5BWkRCNnlZU2pYeWpKc1kzc2FtV293eWE4Y3B6STRrc1Vk?=
 =?utf-8?B?ZzdrODRieXNjc1hjS083QndvQjV4dG9IRUo1WWJJbVM1UkEvTzBqYzFQU1dm?=
 =?utf-8?B?Z2k1dFRkczZQeXBsc0tQQnl5cStRaHoxbDIzTDNvckRna0grdGRPSU9mVDdv?=
 =?utf-8?B?eE5hRTh4N3N5ZEtTWHFIb0JWUDhkSy9lL2VwYS9hNEpFT1lReVoxbmtaRFZy?=
 =?utf-8?B?Zmd1RlAzaFBnQldhT1VYZTB4eU5YTFZJdVZZZ0JPbnBWZzAxV0RaMVpqUUlF?=
 =?utf-8?B?KzkrdDRmOTFwK2pRZm82SGx3azk2ZnBLMExYNWRKem9lVjdhelRqVlZBNEZE?=
 =?utf-8?B?K0pnL0s5RzNOb2pKQlNTNnVQZFFtSkx3R3R3bjF1YTN6UWYzaHJqL1oyMEZI?=
 =?utf-8?B?MnlXOFArQkpobHFCd3pWRktQdDlxMlk2WjRQMFZham5DSG1lcnRSVUE1UG1h?=
 =?utf-8?B?aGJzbDlMbXE0M042R3JhNFY1ZTZ3QWZyY093NUdHUUt2QjRwTlRXb3JyNk1U?=
 =?utf-8?B?NzZMNVoxaGV6dUJkbjJTSk5HZ1dCU1dDczIrTkJQdDRlNFZuek5FQkpoSGpQ?=
 =?utf-8?B?ejB4WkhOb0s0M2VTNWFnOEFmdGFxdEc4cStFOU54Y2p3TkppeUV4RGJpTGJY?=
 =?utf-8?B?SnZIV2JIa1NPa0xlYjVnYXdISGhWVG9mNTU4V2JHVmtaRTlWZjBzM0NRcGJC?=
 =?utf-8?B?WTVwaVR3b2E0cVdzQ2U0bFFwWjlDb3B0dnFaSXU4R1JoOWZRdUdvUXFMREdW?=
 =?utf-8?B?RlVGYWFSM3BBVkZpNU5DMVd1TFZqTHBoY2p6U0VpaDNBYWYwNDdwVFJiMy8y?=
 =?utf-8?B?cVI1dFBZUHQ0eEJVL0ZFSko4aE5XN21lUlRDVDc0NDFIdGlreC9ubFdtc3lT?=
 =?utf-8?B?Rk5mZHlic215R1hoL2ZSalFiOUZ4V2pzeEFQcTl2Rm9yQlRuUnFsc3lGUXh4?=
 =?utf-8?B?U0ErU29raFZYbGQvaTZEVkVlVXVGR1o0eEF0aDlWNEQ3eHdzRytZK0c4K2t5?=
 =?utf-8?B?ZXVaWXNPbzFSS1BaZVlSZHhXLyt1VTRMdE56MFFYWUdENVV4TkJHT0xpcGpq?=
 =?utf-8?B?RFRGU0pUN0IySTZ1UW9ac0NtQ004SWcxelpIZ0wzVnkrMW1tNmMyeWpxODlO?=
 =?utf-8?B?bnFkZk1nQmRCYlhPUXVEQlF4SUtHUlluRVhxQkVacS9MRGpLS1lWdDZMRGRk?=
 =?utf-8?B?TlRaQ0dWLzNRazZwekVVVjRoTm8rSCtJNVBWdWxLSUFSaFM0eEtSTDE1SXNk?=
 =?utf-8?B?V0diUXUrVCtkNkpkeVF1K1M0cmxzK1gwMG5qcXZYc2tSOGY4YVFNOWloVXZD?=
 =?utf-8?B?c3BiZ1FwZkN4TmdEZ2Vjc0hWTzFjaVVRUnhmMmVIS3FXRHBEaWFwNjlTSG51?=
 =?utf-8?B?aXJSYXdFc0FDdk5LVnZ0NEtQSGtsc1hvWWtibDk0eEQ2Uytvd3ZKV1F3cFJJ?=
 =?utf-8?B?Yzk2L0c5T1NUa3F2Y2MzRFRLTFNwL1ZiQVkwU3ZjZFFObHRNekVnaXhUc2pH?=
 =?utf-8?B?TjhQV2w1d0hxOTBIVFE3M0txNzRMaTB0bTN3Z1FrbG0rNG1tSytPNE11ejV3?=
 =?utf-8?B?M0pOcko2RFN5dlY2bmN6TUp2dnVWQnF2ekNPTjUyVWdOWGdEeHV2aFVsVHNu?=
 =?utf-8?B?eVJIeTYvYThmNXZTWk9kR2hPN2lNd1VHc1k5MlQxK21lUVB2NWp6ODRYVUx5?=
 =?utf-8?B?MEV0VERjWkxUNjVMWTRubTkwZG55UzU4cUQxOU96bWoxMXl0K2pONitDMC9E?=
 =?utf-8?B?WU4yeG4wTEhuVjNKbWVoQUlIcXpyZGJzU1k1djhlenQxK0Z2TXg5Q2VKNG1x?=
 =?utf-8?B?S3daRlI2N0MzdW9NaVl0YjgyV0U5VEZwZnZGWEFhOFlvaGM1d2phdklWdTVy?=
 =?utf-8?Q?8ayRpxL8gRoqiJJsXIAbjL2X0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31024157-5611-4190-9991-08db70bb649d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:50:35.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KqzLIYczlCNeYJ6LcZhapmHsAYt5nPQYVVUq6UsRWghNDzbfx2BDOU9wH2sINdUVoyF0rUTYazdJyFjKKP18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7410

On 14.06.2023 20:02, Jason Andryuk wrote:
> When using HWP, some of the returned data is not applicable.  In that
> case, we should just omit it to avoid confusing the user.  So switch to
> printing the base and max frequencies since those are relevant to HWP.
> Similarly, stop printing the CPU frequencies since those do not apply.
> The scaling fields are also no longer printed.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



