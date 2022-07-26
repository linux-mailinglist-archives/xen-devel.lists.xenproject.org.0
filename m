Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B658119C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 13:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375157.607478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGIPq-0001NA-Nv; Tue, 26 Jul 2022 11:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375157.607478; Tue, 26 Jul 2022 11:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGIPq-0001KC-KQ; Tue, 26 Jul 2022 11:07:54 +0000
Received: by outflank-mailman (input) for mailman id 375157;
 Tue, 26 Jul 2022 11:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGIPp-0001K6-FK
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 11:07:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 311771fd-0cd3-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 13:07:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4667.eurprd04.prod.outlook.com (2603:10a6:5:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 11:07:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 11:07:49 +0000
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
X-Inumbo-ID: 311771fd-0cd3-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLdMSWeTQuUtIGUixKVgYRLdvVPvM8ci9lp+N+JEZ+KkyHxFeRzTj3I9b/t0UiAwxznvRspiXQEwtM88Z0dSAD3sKOigqnChIOaknVvKqRxf2nx3fkqdlFhctnP6OiXy6ZWKJOhIrWYpqBzUgIuv4xYTqriLeoFswMAat3Ce0XtrG7yoA5qfMBgzwvqxe3VAedec917773p6WgL0k7mwdwzNr4pJ6uCTvoguPm9O613DUrLC7N/NTvE5RgeKFgSlTAwgR+3w8EHVRILoEp8+Q+gmdDbgKNKCnlIV8dK9RlbcKw4tl56WbjktkMBjupUgOLCKjaj9xBVS+chzPctxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBeEMw4RG3ww4qAmAf0pPVxQdgV8XD7EGgOGB3Zumyc=;
 b=fYsGOpF8AixM1LN4/ld3uXfouhUbFyxwVwK5j37u4jvGFS0+TLWSyhzegDT+NG3a+5Ni3PRuP6fm5Soh20EUpgl7YJb1x2k0/s32SIRqbZVXXBtIe7SK5ufQc5tO3U5KOtn1qWnPlNTzYD+rIntgPEDNKEOtF9aO6wTrOnadjr68ZWAmp1LT6KK+Y9iA2dw2SBGNQBhgR8jRuSNjl4253cqUFuC/iyEDfHeuyqUX2DYzHf//AsMB3oQ4kqD6bBTIol8euoe4SISuVfm9MtiJq2qWKdKBn+m6Gs0u1dWD6TfxnOIHiKFST0LPJ28LZzRmMNiWx4wI1JVRob4Ka8NS4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBeEMw4RG3ww4qAmAf0pPVxQdgV8XD7EGgOGB3Zumyc=;
 b=Jiy/buN3cFlgG/5qOVuTdZO84bktf6vNuEtdgMu/mBboCmlwn4dDCS/m2nbIcO0IIMnUAIZou8haX03grrdUxzKSa1HE6mMX2T1tC0zcW5zmlIESRAiwZTZp1yLA5j3IoX3Wvq6fccmkxX4afMehy3dAg6mi93qxhAOLiZDt+1TROJgHo6+UwgXyjWmyIUBbzL4EFPghdJPmcsjUMEOdUwcY+Y5Xv0M/hUu5vNQxu53O5tsyqChcXjML6Ku7AcC6ZzZcYDCKb4OFeevcPjdNIpcI0pyUurSc0jUY+RnYRw5OlAzoOJIRb+/tWO2LV8cTc2MQPG3CsMobgXP2XgZCoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <190b7280-e024-8870-0032-56cbe282c41b@suse.com>
Date: Tue, 26 Jul 2022 13:07:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Random crash during guest start on x86
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
 <7d816c9d-412a-bcee-f1ab-3b4b46051b8a@suse.com>
 <880625A9-C3C8-4D45-A4E8-BB443E9D4CEF@arm.com>
 <194eaccc-b05f-c1f2-d861-737f3a881966@suse.com>
 <03648C7A-D7E8-4348-B2CA-43CBAA7FC51A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <03648C7A-D7E8-4348-B2CA-43CBAA7FC51A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::47) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23923f1a-d35a-4acd-4cb6-08da6ef713df
X-MS-TrafficTypeDiagnostic: DB7PR04MB4667:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	56Eeu0NDhaUu684XqTptfv9OUHxkffIFUG1asKcJ881hakcga/n0JtKBA4+A96pYwKRY2YGO3dkGfKVy2LjIYpF4s8kcw+KuB/PmsxL8j88feirxvYeafzwIpbq1MnkshPT2jHR1chj+iWOzIfYcYam8CvLrst79P6Ade9FYqli9VMNpczjWEpbkTt2wuAwYdVUQGxOmJ0SQT1Cy54cQ678QrYrI5nSnUV90D4ju6QJyWGo+Fop8N82Kov6Q32SF1ngTzDqy5RlAm3yUXXUazp4OpV8vVGDEM9X1V3vDcG4Yswp/u/+hKR7Hk/k+iaFptJQSPocHihS28Yh0T1LobQEhXV/OODRg1EQwNi+475B9sFSYHO++8UYZHglxv/Gv2BwTSO8wDY8xWC8iZvN/LveQ5tOPcaNDK8d2IjyCJ8vfZNHrhyv18CghnVk8cEl5NxFuKS95ty/8+e+cWWJL4OOY33YmdsYvrnDdqYEFwMVN0VQYR/ifDaCKSNNxu+YyfdgIxOApK7tVWWGqS+92qtjAm6dsYWdOv1hrwlJqlPv/btA0S7Nma9+RV+RgzI3yYdTkFgXYc6E0yhNg24eMnQHL0WAN3Yf0jTtycFri4DRdYnLtw5pVyXMUeIyWhW3Z07L6efJHDKvKU8ngYTqNCmcV77DQqo/HnYdcO5AG7h9mDfHCvDglokN/9goZnyTew0vqBusnAYtMDdWiTKNeLAkjQ0qtjiejzs7q0zhs5CftUtEsCspQyQ/n1T0TNKciAWLwPkaXVgpJOtlp5myZHtPqwcd2NkdloEJnHtzBuNus9U3N5VitPPwPVSHlNLF/+9ObCHIuW5wDRcxBQi1I+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(2616005)(66946007)(6916009)(31686004)(186003)(53546011)(38100700002)(6506007)(26005)(54906003)(31696002)(6512007)(36756003)(86362001)(66556008)(4326008)(66476007)(478600001)(2906002)(5660300002)(8936002)(6486002)(8676002)(558084003)(316002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJmYlpqWEhDNmRqbVI3SDVuZ240QnJyN2l0RDdEY00vSTljNHJsMy9XSy82?=
 =?utf-8?B?ZS8rUVo4YUZjL0JMOWpIeWpWY2pzL1VyWmpOcHRUMHprK3gyY0NVRnl3aG1C?=
 =?utf-8?B?NkU2MGV5eEVWdi9PbFIvWHBXM2UzdlA1ekhoVm9NRUpnNlFhL2I3V1kxbnZO?=
 =?utf-8?B?VzhRMW1oakthZ3lqZk1SWHk5YmxUdmx0ZXVwWVZScnVBSVpKekJhK1RQOHgv?=
 =?utf-8?B?SzRuZjhlY3hDRzNvWnZ1TWFGZHVUWVd3em83d3ZyQjJVMk1ObjRJVEdGTkp2?=
 =?utf-8?B?VkhrSFhqNVhzNXN0QkdHcHBNa0wraWdMS0xLNDhnZG1PZmFhTUFTd1BvTGlh?=
 =?utf-8?B?MEhBck9sc3M2akFFaHhrWFNWSmtmYUEzYnhRWXE4SmNSV3QxdGNFWUtuaUJ2?=
 =?utf-8?B?WWNPS29vb3puczBuMU41NHRJYmp6NHlPMHBQMnBGdENQdWFzb0FGcHliMVhN?=
 =?utf-8?B?YytZV29Jdm5QNjY0NzJ3bkw5TnhZYzV2UWJqbm9oMVM4OWg4S0lEeldtN2Ur?=
 =?utf-8?B?MTdEYTdOS0xUWmxFNXRQaC9FVk1SWm9Ka29EdTdKYzljbjBQWmQ1eFJXSGNr?=
 =?utf-8?B?b29acGlBWGdSd0JzZEpZTTBRWUlEOU9iVGE1UmgyQ0RJSVNQaEpKTWFNYVJQ?=
 =?utf-8?B?U2d4S3lHbjhVUEFocm0xTGx6T2dHSlk4UmNuSXdRTUF3WnpXV1VJd2ljcG1K?=
 =?utf-8?B?RmFvR0Q5c1VLTElRNlozeUVwSTN2UnE5MDJ1b2JvZ05qZHVTTnJmMDZUZll3?=
 =?utf-8?B?bzlhbkROZFM2cUczaVh1RTNjRjJHUFAzd0VBREJBR2VqYnY2VDVJWVl6eStL?=
 =?utf-8?B?ZVNGdU9McnJaZ1R2VVk5SDRYMkZ3ZzR6TGtONU5vb0lUODNxNDJvV3J2UlU0?=
 =?utf-8?B?aGo0UjNOVU01ckFmS2QzK0x2S1NKd3JsUFZLc0YrdlE5aUN2NWxzTytnQUVz?=
 =?utf-8?B?MWNFbHpPaDhUUWN4N3JYMUQ1YjRBQlpIY2ZXWDhUbEoxczEzUWpsQ1M4b3dn?=
 =?utf-8?B?ZFhWWFlrNXhGaXI0MzJFaTIyV2pzZVQ5N2MwNVhWcUlZaUVJTmFnR0NCY2lt?=
 =?utf-8?B?SUQ4K0QwSEpycSsyQnYyRDFxeEtTbzQ5bW4vMmVvMGRWSWhLZnhBd0E0cGFR?=
 =?utf-8?B?T0IyV1k1UHBQUVFFWm1xamFBNDIwQWw4UWhXTUNNdmxYL2VncldhSkV0RW04?=
 =?utf-8?B?cE5kNFlJVVFkVVF6dlNicklmYWRqNGcyeTIzMUllWGxOaUxIdzlhVWxjM3hY?=
 =?utf-8?B?S09YNXpFQVJsNjlvcC8xS280Vy9peHJreTZaOUxkTjBnaGJIckVkSmhmU2d0?=
 =?utf-8?B?NXhZYTBZU3I3Z2F5b2pXRmIvSmcrdzI3US95VVJSWUlheTVYemU3Si9YV2FQ?=
 =?utf-8?B?YVZ0dUNueE5oNzRXRTk2SjhqRnE3NktBS0p3b09lMWZERFRueWN3S0plOWNn?=
 =?utf-8?B?OUtaNStGTWVsZG1WeUJOREZBU3Q4elRnNzFTeURRU1FlbTY1dXdZOFA2RDVR?=
 =?utf-8?B?OVpDWGZZWUM4RkczOHBtODZWQkhtK2hmMmw0dHR2aW5ONlRyOWRlMk84YitN?=
 =?utf-8?B?cE5JdTVSZ3VsLzRma095T2ZFa3JrODZpVEdEVVphd3JadVNaNTJheTdQV0tE?=
 =?utf-8?B?YitBY0F2VUFZWS9KT0k4U1RDSmpadWVYcy9obFBWZURaK2l0MndQRnFOeXVI?=
 =?utf-8?B?elFwb2JHR1lzbnd0ZTJISXF3SHFJZ2NDTi84Tkk2bzRGYUQzbkk0eEVDK29s?=
 =?utf-8?B?bkpwM3M5ZmJsemR5d3c1OUlVc2J6UmJrY2gvL0w3RHk0UmREdlhPTnE4d0tU?=
 =?utf-8?B?Mm1mWHpEZllmbUM2WW9tTXFLa0o2NVVIc0t2YlI0dDg5VFNzS29jRkZ0dkJS?=
 =?utf-8?B?b21aMk52UFhMMzlQMmxOY2thQ1N1bTh0aGR1ZmUxLytscHlubEZ0Tit3NHJN?=
 =?utf-8?B?OXlpa3pwMUc0T3Z6ZGVWSVRveTZ4dWZPcS9jdWpsK3pmR28yREFYQ1FuSUEx?=
 =?utf-8?B?S1BjNjVDdnFsNHYvYVQyQlFHSzdTakl3VXV1MkZJNnhmc0lTaHpSbFExQStR?=
 =?utf-8?B?NHlKTDhDZFl1QVUvSHZSWnZkRXpuZmhCN21tTGRJaHhaTk45d2JXN2ZKYS9G?=
 =?utf-8?Q?HvasEdpjmb5cyZ0AjazA4l6bm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23923f1a-d35a-4acd-4cb6-08da6ef713df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 11:07:49.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /30MjT4bnm63qNxiGiPTIt2E5IS+mjrX6CqTMncUUqO753FMPck1ies7UbEUqy0lKwLzx4HoczXGLxb46Bepxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4667

On 26.07.2022 12:36, Bertrand Marquis wrote:
> Would it make sense then for me to try a newer linux kernel first ?

While it's almost always worth a try, I can't really tell. That's
precisely the kind of question that maintainers are in a better
position to answer.

Jan

