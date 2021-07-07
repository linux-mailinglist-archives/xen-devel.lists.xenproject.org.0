Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB803BEA05
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152335.281445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18nf-000871-D3; Wed, 07 Jul 2021 14:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152335.281445; Wed, 07 Jul 2021 14:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18nf-00084S-9Z; Wed, 07 Jul 2021 14:45:19 +0000
Received: by outflank-mailman (input) for mailman id 152335;
 Wed, 07 Jul 2021 14:45:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m18nd-00084K-RW
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:45:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f15f2c48-df31-11eb-8506-12813bfff9fa;
 Wed, 07 Jul 2021 14:45:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-HhEQGr2cMCe4-hM5pPx9Xw-1; Wed, 07 Jul 2021 16:45:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 7 Jul
 2021 14:45:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 14:45:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Wed, 7 Jul 2021 14:45:12 +0000
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
X-Inumbo-ID: f15f2c48-df31-11eb-8506-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625669115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFIIUHzMTDKCqPL8znK8J92aEXgfwDlYde2CPqpWyPE=;
	b=TiG2QO2GPLk+bVMkLaEF/ZREDYvY0PgDWve41IZk7nvyIOSwgFbuavGvJ2kr4PTybKT4Bd
	BF1+15UptKIriyWriBhN80JjbeNvN9wyeU5ht97mPc2qlxbflMa+Fr4dQMM2b1Vy1KpjzB
	0HD3yOfcQ+01A9g6jHtJFcmP2fn8CLs=
X-MC-Unique: HhEQGr2cMCe4-hM5pPx9Xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKKksC+wvz7PMgduTHf7tOOB0ptgDRjiyvXqv7wYJ+2BbaDVxhA5wYNw4dA5OyAj2JYzN2yyavgJTxm8b/gVQnQ3bz+kBzpMExkcBs647cYH7EcTUByEj05GBqKyHgdxg+fe5v63Tb7bYAdXjT5zPthvwIaRa4gGZm9FYCBPe8cgf9gVs60N0e06UPMmR7V9Uulm+cINLArHeSbFBaou2p9r4vsLNu1qTNWdI/qFLU2sSWO6J9WwKaJzOs80pg7mjbo6UectmnuNa5TTIaafa9wP+f3rULHavZa/L14gZk/IumgjH7qMwst0KlS5DbMT3Ptv7d0UTeSbZBQLl+aTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFIIUHzMTDKCqPL8znK8J92aEXgfwDlYde2CPqpWyPE=;
 b=lqrz1g0cRiZw2q6gzi5r0wVMwDvcEbMrXSKipJoLTLio4ubCkimLIZVPMP5zYvn1BU5QDOHVUo6oJH8aIxQdEkI8e+hG/DX3qU5y6y98dqLDP0U9EFbmGYo0Yg1SU/fGJW1l2PSbLVgyAUJqnA5jAJZpt/EHu1J8DP5p+nz8MHB2Z8IRDN/fAtqCnU5l2DpzPctCYZc0apgsjb6Ue+dk8D0Q6Df/HYyhein9BeXDV2RMqLpN8IFl1qKRKGOAMPFLjUawLDi4dTd1+EjUmaX60HmHxB4bqtyhM4Bjnzl4tQnnMN4k7HCQH0Ab23+ZT+o9WTjqr9no+NuwdUP7/evKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 06/31] x86/mm: avoid building multiple .o from a
 single .c file
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73b924a9-dd69-7cc8-acf6-e4ae746c244c@suse.com>
Date: Wed, 7 Jul 2021 16:45:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-7-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d3cb45-06a0-497c-4b5e-08d94155d3df
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469C2E638B4BB0AB31F54D8B31A9@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bVjvW1262CRKkOjfPf1YV+XT9bL6vv4HMfP1SHgijoJGUsxXN/Xn56sgkMdIyrGArYVhr8DuM16Hx1byEPNOtgt4mColWlZVaNlrQQhPPbH9HGDecDY5x0LVUhqcDIxQDWrPzcVas/DyuEOnmnu0aFXc+1TZZkp0AHDmW2c4R7v2BhN+IXRYTWqeSkEp+tSAFUqt4khUaG7wjaO2dHkE+0uqFtKeKOslnaI8uCPUIFP9US2bt53wuzvdXJ8rN0+FJw8+yqtoUPrLB4M+B3UnokkuQ4Z81SM/3B5+HBU1JiLSvVF7FanBUtlXmQCNQ0adhV5sXP13/VTGSk/jNkt0uBHOhYdosz0GzcE3s/QPGpRRjNECnrQZE1OCmBVqqyNfpExx9HTfb5jMvSgC4k3b+bfJWrncTs/UuE5EMjUcYa1MQBl9xjHfY2nC1mxydEUiptXOivySL5wqhLbvH3sg+RwEPbK8ym278YWoGdjM5mVH3bwiep8AmCsJrQACrSTiwr3EBtl2MX07zNLQnQU0ED/YVVylqJv5RqirTsh11kn+HbQHqUpGk3vCPWaxaGVqTkTJGFwI46d5viIt5z5Zmmswi40Xuztr+o6c8ITV0LQWw6aIN02iukmfHtWrQC4/4dFlW1wTl2qrlHPKGhYaPSfEj8lLV9G5u7IXRgzauYl72DBEg8cqXPmNSy9PES0IhV8YDcihe3Gd4jtptKPolG2p5I8GY5G348lZ6AZO7R0nw0+4Te3DgJXRgp76CI2qIHxhkEj/8vlp764NWEGGuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(8676002)(478600001)(4326008)(38100700002)(8936002)(16576012)(31686004)(31696002)(54906003)(6486002)(316002)(6916009)(66946007)(83380400001)(7416002)(86362001)(956004)(5660300002)(53546011)(26005)(66476007)(186003)(2906002)(36756003)(2616005)(66556008)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVdMUkh5eFY5cFFYNzlMOHBNSXE0WVhBSDJMYjRDQ2VwVmVMeFE2ZEhPSE16?=
 =?utf-8?B?Y2FySUtJTG9uQ1RKdkVsbVJ1cmNKNnBBZFJmRkRNeHN5Y096QVovREgwaU5z?=
 =?utf-8?B?RzN2S3ZJUXdMeWxTemZpRnZtU2tmTWdEcEdRcHlJaktMTmFjeTlzL3lqU2Ju?=
 =?utf-8?B?bno3OUdydlY5Qlk3eTM0UWc4Um5RdVVRU2NXOUNSRlJPUTcyYW9BRU02emtu?=
 =?utf-8?B?TGp1YksvemJCSm51QkZqd2NwNkp5RHh6Z3pSbWV4Nk84ZUxaZW52ODA2bVR0?=
 =?utf-8?B?Q0FiT3JJU3JJdGJVUVo1RlhTZWtvYjVkS1YwQ2FyTDV2MmxxQUVqT3lKNmNx?=
 =?utf-8?B?ZWNzNmR2ZkdBbzRISFE1NG9mbUNGeVcrRFRsRWZHYUVtaUhObEhMTjJHZHYw?=
 =?utf-8?B?N2EyY1B1WWRXSDF2VnY2cS93bnhpRGk2d3dOOTJiS3dsZDJFcGpRMDBZbWZB?=
 =?utf-8?B?ejlBREorNUxyMnlMRnRLZzlqc2hES0o3UGZwL2FHM0g4ejkyMGo2QWZrZThJ?=
 =?utf-8?B?aXB1Ly9EZmJFVVdTYVhxUGx4TkFneVp6cC9BaTFUQ0lkdzF4SmxqbjZOcS9u?=
 =?utf-8?B?VEhTRExCUHpjU3A3UlVsL24vL3dOd0lwK0FkT1I3TkVPQk9hTXZkL3lMRUhJ?=
 =?utf-8?B?RWQwREVpa2cvbFQyTDNWR3crNVNwOUk1OGljMXRHSkRRaUdNY2VSTitSMCtI?=
 =?utf-8?B?cVMwVk5XNWVuL3lpR21TODlRQTFvS1o5U0pLNDRGY1JYZ0NHQUtmSTNMaUpy?=
 =?utf-8?B?ZVhaTk1HclZmdTYveE8vdTNaQlB0MjZwQzBWMDlhUVE1d244NXlOZFlRRHpU?=
 =?utf-8?B?aWhvV2svZnlsTU9hN3FtQTh4NnRTYk1nZjFraE05QjlLa3FSRk1FZVNxQTdL?=
 =?utf-8?B?Q2ZlU3hPM28wU1JYNjNyZlBqYmxYTXp1Q3REdjRiejBQekprZFpKdFpCck9F?=
 =?utf-8?B?ZkJvY0V1ZGlCT0FFdDdQWmRuS2krSTZhMVFPNlhIOXFHMUMyQjY2eW1iWnBM?=
 =?utf-8?B?d01td2ozNjVycFhPV1A3R3Iya0drcWo2TlhQN3c4Q2c1aUpNSmZwUkxEQ1VD?=
 =?utf-8?B?RXlyQ1l1WnZpSzV0NnBUYWJkSVNmclZFMnpzbDBBTXdsakJwa294Q3ZrdzZU?=
 =?utf-8?B?R2E3Vk9veG1xVGVMQm0wMzMzSi92UzRxNXhjVWVVYWQvNFpCSTJZNVV1RnJY?=
 =?utf-8?B?bmljTmdpeU85Y3VuYUFidGExajdKZDRySGFqZkIvV0IvVTM0Q0o3QkhMYXlV?=
 =?utf-8?B?NUw1aFRGRm5CdE1ibHNmb3gwajRXMmtmN01UZVZuVHBrLy9FaGVMVW9uVDlV?=
 =?utf-8?B?YmlsOW5ZUks1RUVIVDJucGJLai9Lbm10blYxOE4yVDJZeVY4RWZqTVIwY1RG?=
 =?utf-8?B?TkNHZjhvbm1zU2ZHRjJMY2ZIR0lXT2lORkJJcHdtZHNaVjVmbFJ3QmZPc09v?=
 =?utf-8?B?N1gvRGptUjRQZkx5USs3U0RZRnlaNitOZHdWeEtiQStCVTlOOVRYVmlwQjN6?=
 =?utf-8?B?amFvc1ZpbFlpL0crTzZ3OVFnRjZBVndEYkV6WDU0QnA5dmVCTXgwRXdTZGts?=
 =?utf-8?B?L2gyMkE0eUo4SUhiSW84YTh3Tk1xNVk4cjdhUjEremFWbmZBQ21qYVhOaGNL?=
 =?utf-8?B?OVNpRnYvOHVRRHkrYmZ3RFFjeDdxWTFsOVZZWWtHc3NaaE9yR1VyOFNYTy9u?=
 =?utf-8?B?QndidHBRa1E3bnZxdzhKWDdQUDRSdUwxelBMYjE2TW9YTDdqODR0MU1Ga3Zv?=
 =?utf-8?Q?q7JIzQHdZNWO8jJKigapEPCDtrdYpb2h+o25L6d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d3cb45-06a0-497c-4b5e-08d94155d3df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:45:13.3307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGjdYJ7mtOeXK0gXXKg+Is/QBueAzoPs9uWBOwDMhwHH3HfYIq+MwOGhUFmXGJ5crARhzwt7ufJedB6RP3qtCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 01.07.2021 16:09, Anthony PERARD wrote:
> This replace the use of a single .c file use for multiple .o file by
> creating multiple .c file including the first one.
> 
> There's quite a few issues with trying to build more than one object
> file from a single source file: there's is a duplication of the make
> rules to generate those targets; there is an additional ".file" symbol
> added in order to differentiate between the object files; and the
> tools/symbols have an heuristic to try to pick up the right ".file".
> 
> This patch adds new .c source file which avoid the need to add a
> second ".file" symbol and thus avoid the need to deal with those
> issues.

While I have to admit that I'm not really happy about these extra new
files, I can see that one might view this as the less bad of two
evils.

>  xen/Makefile                            | 11 -----------
>  xen/Rules.mk                            |  2 +-
>  xen/arch/x86/mm/Makefile                |  9 ---------
>  xen/arch/x86/mm/guest_walk.c            |  3 ---
>  xen/arch/x86/mm/guest_walk_2.c          |  2 ++
>  xen/arch/x86/mm/guest_walk_3.c          |  2 ++
>  xen/arch/x86/mm/guest_walk_4.c          |  2 ++
>  xen/arch/x86/mm/hap/Makefile            |  9 ---------
>  xen/arch/x86/mm/hap/guest_walk.c        |  3 ---
>  xen/arch/x86/mm/hap/guest_walk_2level.c |  2 ++
>  xen/arch/x86/mm/hap/guest_walk_3level.c |  2 ++
>  xen/arch/x86/mm/hap/guest_walk_4level.c |  2 ++

Is there a particular reason you've kept the "level" in these three
file names? Preferably with them shortened (and ideally dashes used
everywhere in the new file names instead of underscores)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


