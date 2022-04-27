Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663B511498
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:57:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314764.532970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeQB-0006VE-1i; Wed, 27 Apr 2022 09:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314764.532970; Wed, 27 Apr 2022 09:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeQA-0006TL-SX; Wed, 27 Apr 2022 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 314764;
 Wed, 27 Apr 2022 09:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njeQ9-0006TF-6n
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:57:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b16edec-c610-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:57:16 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-rJFEUM0rOfKxV6NZ5tJv8Q-1; Wed, 27 Apr 2022 11:57:13 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6911.eurprd04.prod.outlook.com (2603:10a6:803:12e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 09:57:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 09:57:12 +0000
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
X-Inumbo-ID: 6b16edec-c610-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651053435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFBQHEQ6JEOBTHZKPMnzsFZL/okDtiHCSU8+PHJ7Pio=;
	b=eU5/2rjzMVwXm3/2RIDUWdhnX5+HPiP0GF8NYajTqNXfYiQGZx48o0sEC5GjsVOFTfPoUG
	/714ydS8Cb3xwdnufO5tFaSD53DY5229CXgcjOwcd6fJQ9wvtaz3tR+jpi0u3KincnCOlV
	BRiJ1IOfDGosMWyTf31f+V69FPB/GCI=
X-MC-Unique: rJFEUM0rOfKxV6NZ5tJv8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWUeKKj8/uc/ea08i8BBUo5wCN2NqDzjzUVIgsTiMG58i5T9p2UwTuXtIrs4929+UpBHXt0aAyev6BCMNRw4vrSkrSavpz/5TdIOphHLwqfjihq9Gur+6MyOS4kdW4/pDh2fH12X0tEW2B1BRP9LJkYeALeiWdeXdoxhLUnlfuwGTpz5qr1JasNlmT6KI6KVghTsZUn3HTChX/iH6yh5V4DFCOK33E4rb6RqRY3wBnQQR1Id6HF7ao+tCxuPCAkr0gh758k6WPnSNtRWxWYqrCd6gNTl3vq+TMbI05BTsjyfUrMc5XWt4OXDE5F/w2fm456hDrWSN45YDBFHBg+ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFBQHEQ6JEOBTHZKPMnzsFZL/okDtiHCSU8+PHJ7Pio=;
 b=hXX/U/N0/ETJxEX4KetsR/gWDmB/khrrp36qpC/TIy1C/fqbJpBAksybI0esKi8FuQyTx+s4uKQ+gLi1vI6QTuVCnh+L3Asx5To1VZczJkq5j+OujeQ3MajF0544o9QnFaIpXgbKEcLtIN+Ta4d70DnobAKxY/DwPrqWwUxK2GAztodkJFsEPKpD2wVZqOzTWiiBz9mp9Kh+kmaCnTP62H//T6UZE0r4RyBMqGS5VKNwNZMr9EOfcS4XCDEw9PzDE6iDGnWOQ+QGKfcMGd74daAFUxQOLCYGtSLTAIUTQRJmz9a+4KiqgLiitxlz6QvJ0R/5lGVX6180EjUmHm0ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36488778-02f9-1453-aac0-37e6729d9f22@suse.com>
Date: Wed, 27 Apr 2022 11:57:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/8] efi/boot.c: Remove unused-but-set variable
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-3-michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427094941.291554-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a7d72a7-d475-4e91-98fd-08da28344d4e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6911:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB69117420BCC8D9B4BC28BC71B3FA9@VI1PR04MB6911.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8fh52TJ2ZSYCLDfpO9rBFPJltqjzAgd4jo/GsZ8lIsvxecvXtBbeZg6n3zadVwzaAZBKTIWMNrTcN76j6xX+0BY1+CAcUaPnyGuyArb+0KalmvyKWWSGBJ6B6nU7vLJZBwiybCgnkQevIwcvQ3r0GlDaOpkf+zyVL/pfqmpeQQzKFM+bywI8G7QUjuBFbm/KLYFbZQhWXoQhq0wDLSrRYIuI7u/gfbYeHX+CpXpeRfVEsFwmkBo9MhKNGp0MqzFIb05gTiYFzljvTT8JbJ4IFZmrA6cRzsyrGrx1x+LDsu/NADDYeI6RIn51MvLWa8DE+BNZIRU63G76tXyxyWDVXXU+riAmz0duhdQXwLYtOXhJu/hmS36W+PgGKB9U+mTh3Qr468l/NMdyHkLpuIsPShl+SbC3vJgVyZGGqlLm1JcCL99piGoBvI/3+V46iG7duvjc7rAD5/RMkPvDLc3AVJ+sSI/hFKbwWEPxH6jp81fEIh1t5HEDbEGwDZgH1iF0APfzmxb3piMsQPukiglclcMTxTRp6/zVDANex373TSaqcP0/SsIf6xrHEKb2yGIhTm3pvAQeZMAYhXR9AiBinRxZMH9g0W5RUnixxWON3QgnFeBL1za35UW2/LzhqJOmK0n9LfA8hm2CGgtl+/E/V3kwFaFNSCOqGysaeD//NbbooT5Kzpf2yFJjyurqD3fCYfdtT5NzPHnL4qwm7lYx/SkupQyz7OHJ5Fu+WJlL3Gs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(5660300002)(31686004)(2906002)(558084003)(508600001)(4326008)(6486002)(66476007)(53546011)(2616005)(186003)(38100700002)(8936002)(6506007)(86362001)(26005)(66946007)(6916009)(36756003)(66556008)(316002)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkdJOGdDNGFySG8yWGsvenhLYnJXUzA4QUV6TGxkbHVHcW9Za3hhTXpaMFBo?=
 =?utf-8?B?MFZ0T0k2clpadi9RRGFLTXZhUWFrczFkSXVVeFFOS0VaWmJZc2JHUUhPaDEr?=
 =?utf-8?B?VjJUWlhXd2Q5dEV5TmdTN1ViLzJQS1NNTGNEdTFBRzR1R0tyY3dCVHBNMXFH?=
 =?utf-8?B?QlhhQnRGNXVLYXFLeXBWRnRqMVZpWEhaYk9tMUpzWXJkRnVUNGRaUlZvUmYr?=
 =?utf-8?B?UllwWWVGbG13OG9vZlR2MEhNUnl2WllSS1E0T1FRWWtxRnByZGdYUzlGcE1k?=
 =?utf-8?B?b3FVdXJOSEkyaFR5SnkzVzlERnJ6cGVVSlRRcmYzUlFiVmJsUS9FbjN3Z0Fv?=
 =?utf-8?B?L3RzS0lQTEZqSDg2aCtUTklsRTNnZE5xUjBRSkFHbGRmcnZRbHBIOHI3WWRD?=
 =?utf-8?B?bWp6VHRkWGZSTE5Jb3oxT3prUUJ6MEwrOE9neHhNalBGNzZhdDZJWnFUcUQ5?=
 =?utf-8?B?bkFTRlBmcnJ3SUpWSWovOXRHQnhRK1NORHBRZlRxSjkycTl3YkhYQk0wR2g1?=
 =?utf-8?B?M0hDMC84V2dRYjJpeWt2NXZ3SitEWlg3YmlzM1ZZT0ZHUzVxSEJhRUhpSmto?=
 =?utf-8?B?SkdMVjRGbXpKY3NwMHVRTklmZjgwMC9OUkpBeXIranpFMUUyWDl4M0FNdjI3?=
 =?utf-8?B?bmJTV0JicDh3Sk8wTFhrZ0VxdTc5UU1wVUlJVkRzSllLU3NJaE9ZQ0JZb2s5?=
 =?utf-8?B?R1FLbjg3TWh3cmhXMjAzNjlzUUN5cUhySkFrL3l5NmVqUHcrdWQ4TTgzbkxo?=
 =?utf-8?B?aUdLdnJCMEZ4N25WUlRlamJxMllEMWs1alpqbzFKUnpxYWZXTmROY1BUU1lt?=
 =?utf-8?B?ek8zaHRxcUkrdTFhWHVGdVJ4azBHc0lrbE5HN2NZRzM1enY1RUR4TDUydk45?=
 =?utf-8?B?OFVhZkl3d1o3ZjBsdE5ra2kzeFdCNE11SDc2VkYrWTI3cHhzT2dudjBvTFBv?=
 =?utf-8?B?ZEk1d2NMYVdEYWFEVlFSY3I1RW5pRXNTQWN5aGcxL2dNYjFJaXJGMVNnYmNE?=
 =?utf-8?B?VzJqbWpaSndrUng5QXo2cDhQcEpvZVNMZzc5Z0tDcDVmMkUrRm1CYm1HSW5H?=
 =?utf-8?B?cURSMWVGT1NJVk5UeG1sWVBtMm1ZSHQwaFBsK2I4bGovK1lEdjU5UWJaak5v?=
 =?utf-8?B?aHdUQ1R2TkxhaXhPcW8waERmWHdxQkRQK2N5dUsyY254dUNJK0FVNXB4Mk1W?=
 =?utf-8?B?anU1M2ttWnFudmZHRE1QY1EzaEswSnA0Rms4Q2tRSnhjU25iOXBiZnlvS3lM?=
 =?utf-8?B?SzlOM2QvTWlxTG1wWC9CR1lGN2k4ZjB2WjlUcnVvZm9hWTNMd1lBcVBtUVN4?=
 =?utf-8?B?UmZWRG5rR3lkUVp3MUJ2dnordnNMN1NHU0JtclRROWN6N2MrYXpzUjIvUHdn?=
 =?utf-8?B?WHFtYTZWQTh5WkFzaWNkYyticEZsbk5zb1RtdFlxU3ZqaHhWeFhVbVlDU3hw?=
 =?utf-8?B?blptTUE3aHdXNnVnVk15KzNaeHR5VXlNZXNaRFBQN1JDZlkvNzROTWVyb0pR?=
 =?utf-8?B?Zzk5QWJIVnEwc3A0WnNHRVQ2MXNKZllhcnMvajUzYjVBMFZpbDJaUVNrR2dt?=
 =?utf-8?B?OS9CTnFwSDc2Zms1aHZ1WWtCdWdhRkxEcmFTZ0JaZkw1dFFpSFVWOTQ0dFpz?=
 =?utf-8?B?SERPZzJmcHdOMGhjQ2FaeGZPTmRVanFWN1l4b1NHVVkxMEtsMHozTnZhNCtL?=
 =?utf-8?B?eTVRTkNGUHpVMDRCU1J5M0pCbmJrZlFuMGpudDRxVWs3MHVRU2FoaEp6OEcr?=
 =?utf-8?B?V0oxZFFJYlI0TzJvcmw3Ky9pN012TnFMVkw3emtjWjcrTytVVld1WFA5bEg1?=
 =?utf-8?B?d0gxWk0wTG94M01JaTRMYTIvRmJFRytVL3F6aGFlNWpvTzlYcW5Db0oweUhJ?=
 =?utf-8?B?bDlUOWd4RVJkb2F5Um9CSy8yNmtRRkpoQjk5WHh2TVhWOTk1dGw5UjV6NENF?=
 =?utf-8?B?KytMR3NiL2ZTZU1IWEZtSHp4Y2ppNHpPMExVNzlkTzVmRVNxUFVTMG0wdk1s?=
 =?utf-8?B?ZEh0TmJuWVoyMWJZVnNOczZqcWF1WU5aOGR4T2R4R3BKMldQZnhnZWZXSWIz?=
 =?utf-8?B?ZCtLaVRMYU91OGV3UndIUUVRRElCbGJJZ1UwajhNYTFkN0swODNGbFE5TU51?=
 =?utf-8?B?QS8ya0JmZFlmZkJMMkhKL0hqd3dxUXhPdklBeGN4Wi9Ydm03MktSeXBCbmlk?=
 =?utf-8?B?WDFIRWJvcitnaXRsYjNNcGM0Z0M1NWxNYlk2eGpOVU1FN2hveDZVbHEvTEVN?=
 =?utf-8?B?QUhGYVJWSHpHSkhaK0hvSGJpamhBUXVmUDZnd0M5MnV4L2ozN1hsRHhqQ2x1?=
 =?utf-8?B?MlI3WWF1aXBuMmZPWExPcCtPak51eXV3Wm5FUDNmZTdTb0hleGswZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7d72a7-d475-4e91-98fd-08da28344d4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:57:12.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miruTujMx9FpUa9bqzJ7ThtfJxGjulFBCSsMssdmIO2ie8NeLowtbaoQB+IsDdAs5KLOC0zLwAbDdA4fDcjoNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6911

On 27.04.2022 11:49, Michal Orzel wrote:
> Function efi_start defines and sets a variable size but does not
> make use of it. Remove this variable.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


