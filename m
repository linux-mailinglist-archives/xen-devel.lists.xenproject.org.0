Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B457074F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 17:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365266.595384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvaF-0001Bc-6Z; Mon, 11 Jul 2022 15:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365266.595384; Mon, 11 Jul 2022 15:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvaF-00018L-3o; Mon, 11 Jul 2022 15:44:27 +0000
Received: by outflank-mailman (input) for mailman id 365266;
 Mon, 11 Jul 2022 15:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAvaD-00018F-Gx
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 15:44:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566e40f1-0130-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 17:44:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 15:44:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 15:44:21 +0000
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
X-Inumbo-ID: 566e40f1-0130-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDg2RFjTn5CapAmR5LdY/oYORaO1gbs3118uGW9iwR/Zf8hDY2gpxfVvWIVUluEX35kWnwrb6nP4nHJDopA/ma/VsHugBNDR7g/59pZzAirkBt6Z1KULkbIijPeTUUC2cgacsIyC+f5iv5BapLiWW5u0gMPf7ebNAuKtw8v3MOxB2vAafBg2bamV4FmtCIbdFbG6OetO055WwD2q8mtpfJJxJ7ll9oab5n+4jE55RBx6e+PH9zGuQlanzzZRZTJGuUvBgoUeCf7ur3R2Xz3rPY7YZYfNrSJWzzyIY2HTT618QxMnVhdVqfvMFs+v6JNwjHR21P0yDDedgWhGNd5/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM+CLaN+xAkrTVHpV+K7R3DHHG8+aOMrHq0gIAWw6+Y=;
 b=mX15mLTwyf4x8l5OvfH/DRRBBdbln+xvgzDNQfUIWEHGqzNHwiXb9HZvzbJ02G+Bh52k1ihWzYC87TrUnuFsdCfbz3lDH5WPWh7G43ULZzc5lU84BuelJL2GCvpMRdokTU1mO66vkL9dP8YtY0iW0CD9LUpUpyL7U5RCFud03Ka8sZKCRnacEzjbSUz1s53fLrbooiULQ0OvDcWbKg+GmK2QWx5NKdNh1waMz0BJyUxOMWV7u9H4b/1oqlyL1Ns3sp3P3SsfEy7WdJ9dzCEIYLl/JkBwA7zdBZt/nGlQE5Xt9r73287tTT4KkJTfsKIdDMYkL4GJHxEsTew34NM/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM+CLaN+xAkrTVHpV+K7R3DHHG8+aOMrHq0gIAWw6+Y=;
 b=QvuIbAum1VGAraPJtHIc02TNl4ktxE2C5oelJ0sdKgbSiX3Ao+YSclrSjzIe6fYkCuQtoXgxyXFSc8nUsJVsLhKCyO5b0yng3n27xElKcKDgstvInnMqUvkqcfaoE7Xs557p7UMXoq2XAz5/Tg/qkkyM/84tj6BF9hFclFFJzvOWyQpj1DOfFFgbexwgCyoTWN3zbI17++6yALG/FvDXiJtp6POZ/oEEPisP7J/157FcIpX+pSmMqlYljrchdTtKFs3gLbKMINPmanIu1UFvhKra+a8u+XgmqBQHyZ6pFcdG3lM612YWaTPx7JIk5uwlRS5AtOrlrycG9RVk1G7xRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b80d3d49-1a5c-41de-b6d6-87e9631d4f53@suse.com>
Date: Mon, 11 Jul 2022 17:44:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH] libxl: Check return value of libxl__xs_directory in
 name2bdf
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20220711103847.21276-1-anthony.perard@citrix.com>
 <490ef2d3-98e3-42f9-84e9-cf2122b14472@suse.com>
 <CAKhsbWanTngsCF3p5QDEF0RtWhA95HovJqE=H047HoN0hfz-CA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWanTngsCF3p5QDEF0RtWhA95HovJqE=H047HoN0hfz-CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1659802-9c3a-4db9-0916-08da6354392e
X-MS-TrafficTypeDiagnostic: AM9PR04MB8100:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8oVGrHhJQ4QwjU2SI8fA4vm3XRadIw780+4uoeDyOn+Kj549pfDCxkBp3Vgm/1A6t+o+GCJmVIZ7KvEYHwYA/OmGbWzYwxqwqhAjUGslhrJnsdTaAkNVJJhuqwUJ2FEGleBGRydIB5m+0I3Mk4fp5k4STE8MWRhHzKJalEU00Iyb3ZHtjTaEebChaO5LM1wNirYYxZlim3Jx4XyEWYePRzaBlgC9cK9HnZWfJ4ZprDOx0vfNc2L7q/pgfeN6aS1r0rRoQPL+xmEwse+MQUtd26iP21mLXrvzelmn8S9tJf3vfjZihsAQWm4mVagJdH3TiYuI0rsIDBfLYXvFzb9G4Rz3/DZL2C/vvORUAxmkX877PrG4pyYexgeVEXuLbep1e2we3LARs7/lBjcP90j9hE+BD5o1N8DNcBLXuR6pXQ9m2KyQVOeVwvH2ewjM31KN2eQ/yky7v5NcOP8npoqN+n+nsYF9v/J3g6YXRQdn7PT3amME4dPH0pjiDKYCJNj1IeiK+5pN5aYxoqv26b3qWAgCo67nkqBAv2ZT9c+UMdjEC0GYnV6k4x8TVbs0QYqwgOKYE79l4mqa3eDwgoaBdxhCYs9+Hy2TM8JvsXokBD+SSRsRonNBO6jH7eJozq/1CNjyK/BUFbENoV7gWLRjtSGWK+lPgmXPjM/bz5FBGSgjGVMND0NPeE2483BItwEmPFh9M1vwRbRn3AujVVCtACgvGS2ZzRbh66RmUTVMmX3sS7zwFGwmdvntATUZy5kPTykW7KNcfhhDm/v2s3aJE636k8R5NiHTMK739Z+HC51exM6QP4DiMs7M6KgcZDMdUKyUOwXkeZKatgFx+bYLdmWKF4M2WhvnvQ8fFmclc/gzKuVzzrDG4Ot6dWk6qQAX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(136003)(396003)(346002)(39860400002)(186003)(107886003)(83380400001)(38100700002)(66946007)(66476007)(2616005)(66556008)(478600001)(6916009)(54906003)(316002)(53546011)(26005)(2906002)(6486002)(6512007)(4744005)(6506007)(36756003)(8936002)(31696002)(5660300002)(31686004)(4326008)(86362001)(41300700001)(8676002)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2o2VXdBNFRaKy90TzlwV2gza0pUL0FHVlRTLytaS0hWenFCMXZWYXVyakdy?=
 =?utf-8?B?UHJGbnpla0pXR2UwcXdjYXhKY2FTektrTllKNUJwd212bythK281blJ4N1Nk?=
 =?utf-8?B?TmtaQVlKKzFGbXU3cDFVV1JSY0h1UlpFZjN1Y3piV3E5S3hRUUIrbytvNjFv?=
 =?utf-8?B?UTNkRnQ5MlhvdGlMTm1vOU1PK04wTnZnMWFud2FKa1Y4cEQ0RkRmT3hiZHNw?=
 =?utf-8?B?ZEErWS9MWURXa1Z4OTB2OXpzeC9MRW04UUhoZUVMZU5RZkhibVg5cy9VL0Zz?=
 =?utf-8?B?Sk55dDcrMC9CcllTckI2cjV5VVZQQUlwcWV1RXpyMTUyVlBCWHhqQmwyN1lD?=
 =?utf-8?B?Mjh5aFZkcDdpYnVVYUtSNTF0aEd4Rm9lS0JwdlV4RTUzMU9YRG9LaXBYanVC?=
 =?utf-8?B?TEg4MFNWWTNuYjhHU25PK2c4a0FwTjl6Q3VrM2xjeXNJV3dWVjlaanR0alps?=
 =?utf-8?B?N002VVhtQ09EMXIzVnM1UmhiTGtIa2p6eHM5NThKTkJWUldEWCtuWXhSZFk1?=
 =?utf-8?B?eSt1ZTZYS1cyOFNPalVydDFoUnEza2l3cHU1NjA4VU1qRytJdDAveTUxdWZj?=
 =?utf-8?B?UHlQUzllY1dJQ3pzSVJZQXd0cGV1WjB6T3NkNGluQ01KTis5VERpa3RJaDRi?=
 =?utf-8?B?NDQ0dkZES3RDcXpsVjB1Q2J5SVRoaDJ4UWxYZXh0eDBYUnlwanBJenNucjFa?=
 =?utf-8?B?amROT2Nudm1WVDRyblFyejZpa2RsZ1RZVElBMkdjb09UakwvY1JhdE9FRUt1?=
 =?utf-8?B?RHpyeEVZU3M1NjRpM3JhNFoyTTlGMHViWWlCbWZ3RXp0REordExpbHVDQ2l6?=
 =?utf-8?B?OUowUnZJNE01Z2JuYUlkcUZ0UlRvSGZLcHIxMGZteWx5bXFqSWIyaTVBK01w?=
 =?utf-8?B?WXJ0aDhaMkZQK3h2cm9TQnJZMjV0T1hQaGphNENUNjRVcUxwMWpqNWxnb0Ir?=
 =?utf-8?B?SUJySUloczZJS2dFQnNJZ2RZOTF6bTYyY2JYakdJckliRDE4bXhlWHlESU5G?=
 =?utf-8?B?a29ySEFoRlhVdlFIZnlDbTQweS9PZjVwckprMXFDaTNVOXBBOERkK0IzcXEy?=
 =?utf-8?B?eDNwbjVBaVluK1ZJN1A1QmpOOVlpTEFkcTdtaGdkWHQzWGRYSVk2QldkTGlH?=
 =?utf-8?B?Qk1OTEZEd0VpbzFFNlFxUk9RZHlDM1p0LzAzUjZsS3BQcXF1dGhScEJQVXBP?=
 =?utf-8?B?Wjdsbi9ac291cTB0N2J6aThtNzFSMFZsdGkwcGx4M2E4TUpBVDB5Q1NNTE1L?=
 =?utf-8?B?VnlSRTZKOWU1bmcyQWtsNndaMGFvbUtOODEyemFLN29iZnZob0hYb0tuT0FP?=
 =?utf-8?B?ZnVNZVNYSjcvVGEwMzU5dHJFa0dPQW1VZ2ZsZGx5eGg2QWU3TTFoRUFycldE?=
 =?utf-8?B?LzNFc2lhZE45dkRRYVZSa0tmQWlZaFZCeWg5L1pkaUtyOGNRVXNwTGhZd1RF?=
 =?utf-8?B?QlNZNEJtN2xzWnlEYUk2d2UzVjdOVTIwQnB6OXo1bWhnT1BTSlpIejZZbWhn?=
 =?utf-8?B?NTJtZlJJcExuSXp4eUpiU1FBVnM2U0dlVzR4dnBZRmNkc0dQREszVHdwLzU3?=
 =?utf-8?B?RHRTWWdDbWN0VkhRNlFTRnFsejEwdGtCTEtMT082TnR1OHRxWFJuS1BDNkY5?=
 =?utf-8?B?NDZlU1pZS1NsSXI3UGFmUjVxOXZnT0x5OW9HZTgvMVFOR3BnZHRHdFp3eUJs?=
 =?utf-8?B?STdkdDM0SDhqeDBwdzJvTlo4dllpcEFjdVpmRUhJZnRhRlZYY0hRVmhJV0R6?=
 =?utf-8?B?eURwejZOanM4U2tiRm1vQk1TMXhscjJmWEQ3dEtGWEhaTDd2SVdlMWtUeUpB?=
 =?utf-8?B?cGhiV3RJMk0vVzZPZFBMaE94cVNVR29PTVRyYS9qZlNBeFAyNzN5ZStVQVk1?=
 =?utf-8?B?SFlkQldNME9WTXluQTBPWG1zeU40TnFidzZBUjdYNU9HTElydTd4bWxvQUxy?=
 =?utf-8?B?MWZzSHFXSmFGcTFjOFB5cU5PR0oxMDRwdWZJWHAzYzJmalYzUEgrOHhJMUpu?=
 =?utf-8?B?dEFURXhRdEZyeVdBRGRoOHF5TVI2czM0QkoweFp0dGY3RmJpUUJWdlVKRUxD?=
 =?utf-8?B?RUEzNDhRK3pwT0IyeG5PTVhudTFPa2RDRDdBdWxqelRiT1VyUG42SGY4SUM5?=
 =?utf-8?Q?eAUPiI0QZpjXRuB8V6piRY/AP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1659802-9c3a-4db9-0916-08da6354392e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 15:44:21.5629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaQh1mVy/m4Da/tlKSYTZnZJllriF/IFZYkpz2t9p/W4WtejEamh6Th+yj5pigeVYg3zn1bZcI/7qoxcZEauJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100

On 11.07.2022 17:35, G.R. wrote:
> On Mon, Jul 11, 2022 at 7:03 PM Juergen Gross <jgross@suse.com> wrote:
>>
>> On 11.07.22 12:38, Anthony PERARD wrote:
>>> libxl__xs_directory() can potentially return NULL without setting `n`.
>>> As `n` isn't initialised, we need to check libxl__xs_directory()
>>> return value before checking `n`. Otherwise, `n` might be non-zero
>>> with `bdfs` NULL which would lead to a segv.
>>>
>>> Reported-by: "G.R." <firemeteor@users.sourceforge.net>
>>> Fixes: 57bff091f4 ("libxl: add 'name' field to 'libxl_device_pci' in the IDL...")
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> I can confirm that the change fixed the segment fault issue I observed
> on 4.16.1 release.

I'll take the liberty and transform this into a Tested-by:.

Jan

