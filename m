Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7A735BB2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551200.860603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHH9-0000K0-77; Mon, 19 Jun 2023 15:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551200.860603; Mon, 19 Jun 2023 15:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHH9-0000IH-3z; Mon, 19 Jun 2023 15:58:43 +0000
Received: by outflank-mailman (input) for mailman id 551200;
 Mon, 19 Jun 2023 15:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBHH7-0000I9-Rt
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:58:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2837ce1e-0eba-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 17:58:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7626.eurprd04.prod.outlook.com (2603:10a6:10:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 15:58:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 15:58:35 +0000
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
X-Inumbo-ID: 2837ce1e-0eba-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEZBQzWixEKGEjaJ4pisvRDSkC1cInYm5mYQcThml8LEGvfnflMWyQ0NUEOcEeovcc1HP6Cb+TAaTE1B/P/lvYhXACBgztLG9kluvQwjlz4HjosNLPW7I6kdV+/d8LooQA3O4AHP2Ys/flAfxm7x6sTPl/tgyJW/LghWSBYooJtZpbm4SF0iAd1u8jj5eEICNLK3zpb9tzdv8JBrEl/fSBS7VbUYm0jfw61b/qEhbAfd6Z5HhFVF2gw9o7MJf4FsY89SSfvnxUTWy+Myve7L0nhTHBP0YaRE5G4jH+6OUrYixg8tPeiSD1wQkp/kGsx9XOHAEnXkJx6Rj3Ht/EXzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GJTUy6y0lKA47rLwMqekatsJW9f1GoysPulKoKRLcI=;
 b=BtpIAsyRUQDBYIdtn1vWN3xNv8bwCjq7fWMjtwRwGn+96jLKjXpYwKgeSw7e4V338sdU+w2GhNoMm+qlw8GwgqUepRbpg3J1XLBe/UJgs091Dr8kjSYGLrcxjrQN9Ez4dSA41Yp8Giw7SniPRpwUHsbGw9gqKk5rCPyTtyBN8Ydj9hAkFB7gJW7I3JslSn1bwC82cYZ5QHp7n7ku0Codsy4vkIST+2sMBGdPavpMNO1TzkV/TIw1yTVyvALWA6h2U3mAc7nXRDZRGqE8p/S1pQGsMYvrIzKU7bxcIV47NHWQS1/HVYDlAnQAvVVKHiUlMh4zCijwq3cQ15igA72/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GJTUy6y0lKA47rLwMqekatsJW9f1GoysPulKoKRLcI=;
 b=FgoOLekBCqK6xTH2yx9ivtId2AwBql4p/rVXR9u4s1VF7eMwE3nnd/c7uT19DzuknTO2qQd/estJawIX3IFh9d6jC/ekcp49OLieVFT2ZOrK3DMCQ7z1oOTYCPN3lUabiIq0uD1vgzePkhckGnT19AvwFIGIbTaQkxuf6T4+1eNSZtMVhBqRQ2752fe4ZFsoPJNhgkp8z8HV0K92CPTPK5JVjGWits5KDd3YlRPGE7vn9RjRJi5fRq3iiklBtfwx6nGR9gHbk1zAliKdwS9X7ZgYMg2LWZYwDWj0MlyJJ6GTK1+nPkEkYsUTt7Xal0m+2v/zk+Md+bp+eSH19Drw6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a92fbe8-a9b4-f671-7895-c4d8065b61ed@suse.com>
Date: Mon, 19 Jun 2023 17:58:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-2-alejandro.vallejo@cloud.com>
 <b3543c89-9df5-53dd-2b11-aff83211187f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3543c89-9df5-53dd-2b11-aff83211187f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 9259f0d7-bc87-4921-9afa-08db70de09da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YBh9Nl0KOvLf1rjJBSH93VefC9VO7lbDUN5qjr9hCcaRw3GDmSHvS6oQzlKGeYor7cA165jxU11ldy45lRYQcdBt6YpsEDGxEswfSsl7p9TP7AOFRiyh3NKqhkR+UQ4r0cSo4aUx6IwBerD9SrXWrTafNw9n+7bBf5NpA8AQePvlRZaDr+cpjzKOOW8s7+XAuthkOmptqE5yL2Z25gtbQ7grVxI7x/ECc+YW7ZOIkeAq34eEyE1wCxrMFsN27gyG7RQTBo/mHIwBS6hkaVHCJ9dr/kqlg0tJ7Jtrg1KOg6x5OABfY+o430ijea2wT2vBP0l2W7ewLuh2Rql3Iecvi1ZYwuxJQmzVLngsd1BtrLO9B5W7P01RGZKwTC2fhkTjb3bT2QQf2JuOklxPvRpAJUr08h9gM3uMUYO0GqqEmlDiQXActr3m+OBtzHdsVSMH0WP9nGoc8VQuT1pa0G+qOLQ3Si9kbbGOC2M6342ckmNpCqVDXkOL4UeKh+b++PH2uq4bX45aEX2+ShpS2tSdT0hxV+mFPYIG3CQuNRdD7SerYiJhvjv4g5rtcpysdWgyOSE+dMLyjKb/xOG8jyherVUUvbSlf3q9LwzJ7AR0DKzskc7YgVvMTgopk3LoN5ezpCGc7+X9yU+hR3G1ib/34g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(4326008)(54906003)(478600001)(110136005)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(36756003)(4744005)(2906002)(8676002)(41300700001)(8936002)(66946007)(66556008)(66476007)(316002)(5660300002)(31696002)(38100700002)(86362001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkRvaDJwcXNoM0lLOXZMVVo5ZWcyY2w3SlVUSzkwdlNFUUYzZ3JmSG5ES3RL?=
 =?utf-8?B?cTJHTXdpRnVQdHd5RkN1cEx3Nlk4RGEwNWdxWmlUQzhDVUZpQXFGNkJieTdz?=
 =?utf-8?B?bmU4V2Z1L1F6QUl5TGdyaDI3MG9VWnozeStsSWpBcjBzSmxhYkdEWFVuZEdi?=
 =?utf-8?B?NlBBa0YvYWI5S1BpMjM2dGZuSFlIQTVPdjE4cHN4SllIUEJVeDVjZ3MydUky?=
 =?utf-8?B?Y2k0eU5pV2RlWGxsdnNBWUt3S3Z5N1hmY2VGWm5IeWxaK3RJaHBzOGlQZXRw?=
 =?utf-8?B?MTdxWWtvb1czazh5N01VV1JpMDc1Uzc0MGh1Y1pkV011R1phd1pqUFhwcDRV?=
 =?utf-8?B?NUVvYkpTWU5ZK1ZyNkhPUUE4ZXRmZmZPTUhJWnNFU3BBTENpWE0yNk9JU0xT?=
 =?utf-8?B?RmtIU1BRNVJvNlQ0UVBKZWdSNFMyamJkQ21HWWQvcnVxbk1VL3hVYlIxMnY2?=
 =?utf-8?B?ZG42UktGY2JLNGUzanFzMGRRbVBHa2lnSTE4Wk5mUUN6WUdSbHJPUlE3OXBS?=
 =?utf-8?B?V3JEbytlZnF4ZEFNcTd3MGdROWs3aldlNk9DZndidVVZTktSamJoZktQNGtX?=
 =?utf-8?B?MG9KVDE0OFROTE1XTStGTzVZMU5GVG5JUERCclU4cUgzNXZYQ1pMaGxEYkxw?=
 =?utf-8?B?ZnZjaWpDdzNuYlJUbFF1NzFYTUttdW9NRkwyVS8yeExGd1AzTm80cnB1QWRo?=
 =?utf-8?B?Q2hrc3UrRVdxdWZFWmNjNjVycitwSUhud0Fmb09XZSt4SlBHTFpUOHBjaURw?=
 =?utf-8?B?T3dvTUcxRmZZOU9mWnB3QU9kYjV3c2lFNnYyRE5NeDNWV3pIRlJERTZTdlNw?=
 =?utf-8?B?QVQ2bFhmUlZXSnRZRkd2QlJwWDNMK01ESmlRb2hpalJtdjd1cXJYbXFNOWE3?=
 =?utf-8?B?SUhYYXExSmt0dFVpZ1htcXV4UENwY2hLdGNXSFVQNjhxZWc4WGw0UVYva0E5?=
 =?utf-8?B?Y2VtMEs0aldIZXl0TTBmM0QvN1p2cVB3MURmWUR1aEpvSVFsZTNSSE5hcnJq?=
 =?utf-8?B?YmkzNTVFdThyRThGVG51RGdSQk15VDB4Wmp6K0VlWVQ5bXlGWjNFL2xiSURx?=
 =?utf-8?B?TnRvUnRubHc1a012UkU1Y3c4ZHRVYndHa1Z6eE9FSlg5eHZoOUs5TE03NGti?=
 =?utf-8?B?YVo2WWcyYnNvV1lsRzNiUFNEMGRCR0h4WTY1ZmlCeUF0aXhhVUxiL2VCOG1z?=
 =?utf-8?B?eU1jdjRQaGdtZjdYQ2NuSWVMdFFFb1pvZjRLSFJidWRCY1J1bU5CQ3AyYkVP?=
 =?utf-8?B?OUpBK0p2QVZtWHEzRmNrenpKYXdVRElnOXZVOG9vMGUvZCtrd3AvU3YwcEQ0?=
 =?utf-8?B?a2R2RW5LQ3dNbDBEQXRLT1NISVExOGNnQzBNTnU1c25ha05uZmNFZGFvb2dC?=
 =?utf-8?B?K3pVK0hiZ3lkN1BoYjhzSWdvbElTNHAwYW5lUi9kcnpId3BtVGt3SE9RdExF?=
 =?utf-8?B?Q1ZRMEp4OExrQXNveHNQWklZcEE0OGUzbnNpdDcwS2dZbW5CQWNPa0FyekRk?=
 =?utf-8?B?YW5BajZ1QlNVcjNtbzhIUEZtd2dpOVpJVkx2RC9BdVZ4cjVqc3lzeTFROUdP?=
 =?utf-8?B?Nk9hVnhkTVVaZXgwV2NsRTNtVkZoSENYcWZsQzVqczlDalJ1L3MwYlc5WHp2?=
 =?utf-8?B?dlFzelRsRGJYQW45Y083VTZLSy9Wd1hmM0V1cVR6ci9RNFF3akViRlFrZmNS?=
 =?utf-8?B?YU1YeGo0aGt4RVNrcXdSQW9OT1dqOEZjN29sMVozelBtTFhLMVdxLzI4YUtW?=
 =?utf-8?B?aHhwaEtycUpZbksvTG13OGhLOSt2L1lFVi9GTWJTd0QwTHVJcUdYMFRKMTQ4?=
 =?utf-8?B?U2hvS25RUzZTKzhMV0dLTWdjaDZFb21vZ1FmQTJrM1BFZnNDWkU1UTIzVVor?=
 =?utf-8?B?WldMdEFmWldvUnpvemRQVWRna0R3TENmVm1HaTMyUHM3dWJRd2d2enBVZFBV?=
 =?utf-8?B?alN3WUtJUk81WVRKbDc3NHk4ZXd1M1g1OVRFejg5cUFhNzlyRGtFY1BUV3lF?=
 =?utf-8?B?MXFsKzRlZFhDQm9BRS8zOU1kRWo3TlVzdXRBaE1BS2pBYWNpWVlSNDNJSGFL?=
 =?utf-8?B?dEp1aHp3VTNyY2p3QVBhYjV5QmxsdzhZYWd1OVVOZ2plRHBDMVJVKzBzbWNt?=
 =?utf-8?Q?8y85b2pPzDgNy+EUvo0S+4A53?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9259f0d7-bc87-4921-9afa-08db70de09da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:58:35.4414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOs0ZiOdXTWPLcnOJkXgy7IY/ACmCyvWhaJxlqmoZ0K4N9QW9QeWfS9Fx2taAHmhgfBEmcsDWoPv1y2IXpDP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7626

On 19.06.2023 17:49, Andrew Cooper wrote:
> On 15/06/2023 4:48 pm, Alejandro Vallejo wrote:
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index e65af4b82e..df7e1df870 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -750,11 +750,12 @@ __initcall(microcode_init);
>> @@ -860,6 +861,9 @@ int __init early_microcode_init(unsigned long *module_map,
>>          break;
>>      }
>>  
>> +    if ( ucode_ops.collect_cpu_info )
>> +        ucode_ops.collect_cpu_info();
>> +
> 
> I still think this wants to be the other side of "ucode loading fully
> unavailable", just below.
> 
> I'm confident it will result in easier-to-follow logic.

Yet wouldn't that be against the purpose of obtaining the ucode
revision even if loading isn't possible?

Jan

