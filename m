Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A56E438E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521878.810859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poL2p-0001B2-9g; Mon, 17 Apr 2023 09:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521878.810859; Mon, 17 Apr 2023 09:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poL2p-00017c-6P; Mon, 17 Apr 2023 09:21:07 +0000
Received: by outflank-mailman (input) for mailman id 521878;
 Mon, 17 Apr 2023 09:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poL2n-00017W-Oy
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:21:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bff6cee-dd01-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 11:21:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7627.eurprd04.prod.outlook.com (2603:10a6:10:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:20:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:20:33 +0000
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
X-Inumbo-ID: 2bff6cee-dd01-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kloHCBLxqUfpZrJinXySg04CZ+JEhlk7/NNmo+wAJT0mQwf+RLmWKXPGNy99b/x/JEaFV8eMplZi5BwvhyWl5rEx4AZ2ue/Jbcs9reWM5i3q4rPJ9mfujTVJ4QQJhoh03yy5ajrURZWUodJ+E3QzchvCkeIkJxLmSopPSp2Jvxxrs+8Il2CP6QOGzygaVycuFrPBjk4bx6Hh78LiLlazKkFvfczMdFn9X5oV7K4Q9vkQzlXkFdiCik6MIMw0VkNhAnWSVrFgtYy4JxwJAvC2eY3afbWDo+d1O0ume4UGVIqqgk7Uyae+eRfl26+LGXiltzD2kTj799vJVrHS37AldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q18hF30gZ1xNEQqzIPg1e63xr7UG9az3QdjMvpHEdU8=;
 b=HHo2aCAwUAa+WaRzRQAqGgqhMx93zxpmd7+nXP4F/ClzVv35Q3pQijCdqhTwceK14me88XxCvKkTKsz89Y/wSkcUXlRf6MiiXgwcSn7TBZE3AmZepVF77wphKVpgQkT2gLgZJjcR/GcuTb8xMsuxiMtMzux8oA9gHoZzsGJkXAb35BeVMWiOq2b76rubjMDYneoMMFxcbQBQIacRAgeU9lVxzDu6d8xwdLhNijjSd8nIfCERaLyVtVn4ibYjjyRc7UWk5+6ZWOSVHo6kURIocdS6wGgnEVGHSsUBWw4SG6gt8JmisI2Z6SuqgtOVWEOjH2mwi1Gv5koJOjRVHngDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q18hF30gZ1xNEQqzIPg1e63xr7UG9az3QdjMvpHEdU8=;
 b=HEvzlo84CzhWUxlFpdsLjguF5vcWPgg8Iq5FFPdWki/YXyQX+eJuhT3WNlDKxIJoJV5r8gXxFirMIdGatf2BP4vthsvWx5oRvzu87MGo3eDuVbU9SJOuw0b3PoU5v3gCo9paJMtGi+dObnsBAhe7pzM5V2mSni48M3QAMLPNSYdIGITRqzpki80g7FO+5+VVZ3/h1D6Sebk+tjc5aaQb20Wwvxnw/fqy3yYusKNqMd+3AH380Re6jTPRZ5YQ8laD6CAMATLYfVezPmcXqnT+10oHmCs0veKOxOpisqnjgT5/u5jEenI938BEZFO5lgFWzHlFdG3TNgTLl+Dkd9nqhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56efad28-cef9-ad68-d246-5221f99a6074@suse.com>
Date: Mon, 17 Apr 2023 11:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <9486E559-879E-49AF-9145-B929A8EE9301@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9486E559-879E-49AF-9145-B929A8EE9301@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3a5b86-0150-4cd2-9e55-08db3f24ff1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E164o7ViXs67HxDKnDT4fGmT7xfxXcX6IGxh884iaEgsOVp5VQU9cPkZUvboJ+CmL4AQ9PBthcU31AYuDUIBDpOd8XANw/RLKwezUr3AP9P+tns4jWDFGmaUEdxZwbRWwde1XAzFQE0KiaUGNTi/iluwoNZyA/qfvVJIBkBKjEjHOFpTbxRXFwE0TxjlijPYpuEj2ThiYEZz/QAcTC7a8QRi63TvCOxzwJnNLudJsyeQPTG6othHlChU5AvePTKpIkh7y7qdAnmTTlgGFfmL/mGfOEHUqeu76AcP4+sC8h7EmT0h4iEP1ih+zpZbKWjRGr3Nzkn9ltgpGY8gDL2JWaWq3Gtyg2cPtLJctKTpzHxJjs48cPeDbmRrinkaxYe/f29TKr1zwMm5V43vui4S463+a9X7AlwTvyLBgZ9U8bNAieZun18VLkRI/kOz0nZaBSeApQLGA+x42YjiHXD1TIkUm2tu0LuPvcG0rnlttOYMUvsQqK/ZZuY12NMjVH7zF+HKwMG3B9WgmWK8i/LIj/p8XbkQdiiKCyfD8DeeqWHP5QwHh7vSSNVeeQlvZrE9SMfVvUNtG6MyA8mK3HpiATU3uG/mTRYKghjucNvwqpbt6t1Up9m9uuwroj37ehu0XpzsCfNZL1PmNNF0nOw7FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(7416002)(5660300002)(2616005)(86362001)(31696002)(83380400001)(53546011)(186003)(26005)(6506007)(6512007)(38100700002)(8676002)(8936002)(54906003)(110136005)(478600001)(6486002)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(66946007)(31686004)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hERUp6QjhDNTVjQittZ1pQcDcyTyszOUZZb3lSU0h2am5paXhTcS9PTkRx?=
 =?utf-8?B?NmlaTXpNdEJMbjc0YzFDYXhyQ3NwTU9ndUF1MlpRbzA3eU03bWd1RkQ1TUQ3?=
 =?utf-8?B?cHhmNkJDZGJycWNZUTB3cDlEaDFTLzZGUlRIY2R3dUIxQS9STDNCQkhPdnZs?=
 =?utf-8?B?VERoZWpkYmJDNWNBZDZzUE1iWUpJSDhKZTFPcGl0QTJ2VzVFcU9oOFNmSUhl?=
 =?utf-8?B?OXQ3akY2WVR3N2o5ZUpkZ0dLVlFNcXZOelBuN3VCYm5Td1krUW9RemVKVVZm?=
 =?utf-8?B?aEw3Vk1GYnprYVhCOFJUbEs4d3Q4VUxNcDcwenVzNjdQN1ZWaFZnTlFLdklF?=
 =?utf-8?B?QUd5L1JzVTdvNnUrdjlJaEZhT1QyWEZJeWkzUEQxZDBmVnBlVGtCS0d3SFZI?=
 =?utf-8?B?ajFWWmxpcUttck5IYWdUVDFmcEZsbXZWSXduSFI0RWJ4UlExNkNmVWhhUWFI?=
 =?utf-8?B?L1FjNUpBMXVzdHdyUk9yTFl6TlJSRGNJUTF2R2U5ZHlpay9xeXV2SWVGM2l3?=
 =?utf-8?B?eG51RGxKYjE4bEJVb3hMT0tUS3V1VTFBVUZlRElBL3E2b2RiL29QMmpoaWYw?=
 =?utf-8?B?YkJVeVBNUjBVaEZjU29rUUozNlNDVGJLWGdrSUxQODI4VmhydHBsd3NLNk5J?=
 =?utf-8?B?ZCsvc3hTTGo2Q0RBbWdaM1R0L3RiS1R1ZEorKzNVVHBBc0Vxd3M1Z0R1U1Yy?=
 =?utf-8?B?blR4ZHA5T1RDMVZXd3BURTJPb2Fmd1N6clR5dWJaa00zVkFEUmZUeEFVWk1i?=
 =?utf-8?B?elpPdURRQWJxMm1YRVRRZ2FaVkd4ZUJBcnJpQzYyR2gxamNxZC9hOGdreFAr?=
 =?utf-8?B?UmovUGdOeXlabTl3MUR4dkNaKy9Lb3FtOGZYZThVdG5xQk1FV2tzamRaQW51?=
 =?utf-8?B?SE1yWkZ5bjNteHltb1lZYXVOMldMdGxQMlg0b2NQNUxIMVJWTDN6bk45NmF5?=
 =?utf-8?B?U3ZOZ3BMU1pMTnpCT0xiSEVqMWFtL0pFZTBDVThrZCtQZk1sN2VmK3JQMEpE?=
 =?utf-8?B?S2VaYlZtK2RkSmw4dDhYWEE0OEJldmliSG95ek9XRXJ3WkV4WFc0cG02cVVy?=
 =?utf-8?B?S0hTQ1FMa2FwT1QwbnFnZkw5WnQ1a2o4aG5xL3BFVjRDdjVhREFwZGJuQWR2?=
 =?utf-8?B?Wjlla08wTHEwY2JmcE85d25VcWJJQm1CTE9CN3FNMmtGQ1lsM3YzNjJnRDVD?=
 =?utf-8?B?bEVVUVd0cFFhQ3h6ajUvNG1ja01YNmZYM1ZhWVJHejlPa2xlRSt2N24yd2JK?=
 =?utf-8?B?SHNzcWdIWm9rSUZRZGFSUVEyaTc0WTROT2lsTFZqN2ZKWGpIa05Gdm5UK1dl?=
 =?utf-8?B?ZXhwYVR2a2R0elNneDdTc0E0cU01UDYvc3o3Ui9KVmJwNjlFMlhEVmpjQ2pZ?=
 =?utf-8?B?aE1EQ2xBWDlQRW9TUjhVVEdjM2gyZVhpc1NSSkMxQVBGb0J1UEhpdlR1VEtx?=
 =?utf-8?B?ajVxdklGOFZON3pjU3hRS0ZJUFRVYWZITDhVUkZDcE1zVjdoQXhYZ1BSVHgw?=
 =?utf-8?B?SFgvVksyTTBFc2JkbFdKbXl4clk4Vm4zN0NOc2JvRzZ0U0krREtZeVVvWTdo?=
 =?utf-8?B?ajMrcDRHN1p1M0dSWkFpeHVOK3AxYmlrMmprTVFhSEljRXpMVStkQTVOR0xZ?=
 =?utf-8?B?V1drTEsvaVFKSVZQTlBYOGpFRmtkcEQyZmVycGZGamVra2RuWHR4WGhhZUpo?=
 =?utf-8?B?bXZJTUtTMjVoZ1M1MzlyeEExM2RLdW01YUZWUW9CSVE4cjNkczF6TFlwdFNp?=
 =?utf-8?B?dzVyUHBXYmFwLzBtcUVQYys4YWNWbWdlQ1htNU5LektmUmVtSFB5VlordE1X?=
 =?utf-8?B?R043dFlDdFVCb1haVTlqWWJrWFc5VlhFVC95RjVxTjNaZVJ6YzNlN0FIVE40?=
 =?utf-8?B?Qlo5ajYrRDVEaVY2OTgxeTNMRnVxWGowam9uQXNkNk1ybkc0eEQ2NzU2NWw3?=
 =?utf-8?B?blpNb2FaQjRmK1lSRmZJWlNjdE8xUUF4MnNuSnZIc2FGQU5QUzJad0lvejdH?=
 =?utf-8?B?cEZ2VzNkd3VpYVRxTkZ3QjdmY0VnQ1Q5MWtOUVJnaTd6NHlJVW02dU41dUhL?=
 =?utf-8?B?Z2h5em5iZGZDaUNtbEIwYTgvS00yUDcrQyt3dFFNRDB4OGRRenY1bmdzZHpn?=
 =?utf-8?Q?6gkZJmfYSQNkwFR91rv1oiF3N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3a5b86-0150-4cd2-9e55-08db3f24ff1d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:20:33.5881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znEU1PpO+nXgDU4JyCGkhw6xBD61iBiGKPqvcE9RjGROAMrORCaHIFqaKaVy/QSUQkaOTKH0ERDLsF/yT/1TPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7627

On 13.04.2023 14:47, Bertrand Marquis wrote:
>> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> Add sve_vl field to arch_domain and xen_arch_domainconfig struct,
>> to allow the domain to have an information about the SVE feature
>> and the number of SVE register bits that are allowed for this
>> domain.
>>
> 
> Please mention in the commit message that you are bumping
> domctl interface version.

In which case please not just "that", but also why.

Jan

