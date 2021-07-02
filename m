Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEC3BA29C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 17:12:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149181.275796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKqD-0005TY-Vw; Fri, 02 Jul 2021 15:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149181.275796; Fri, 02 Jul 2021 15:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKqD-0005RK-SF; Fri, 02 Jul 2021 15:12:29 +0000
Received: by outflank-mailman (input) for mailman id 149181;
 Fri, 02 Jul 2021 15:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mhJ0=L2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lzKqD-0005RE-48
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 15:12:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d71f225-76bf-482a-b128-9d567b530083;
 Fri, 02 Jul 2021 15:12:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-PKfjgzwWPQGkgLnazFl3Sw-1; Fri, 02 Jul 2021 17:12:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 2 Jul
 2021 15:12:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 15:12:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Fri, 2 Jul 2021 15:12:24 +0000
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
X-Inumbo-ID: 5d71f225-76bf-482a-b128-9d567b530083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625238747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbvhHxlLO1642pXBaDEfWehMsyn88DfKcSTKtOiE1n0=;
	b=PKgEP4eYnCZlwujdIQ/HmWozQors7iNk9r5tJ4WDLQyfROe91wwFfUjYqwBP/pz2ITS5Fc
	1oLxz3IpKeuXbNLnE/6ijSCli84l54vqSH1vGcrXN0UKgABUfyOkUL+mJR1rAOUlA/aLR7
	SzwAY97q7bEh5dO8OVozOp/ixLQUkdA=
X-MC-Unique: PKfjgzwWPQGkgLnazFl3Sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QegQI+5Yx1cT9Qu0lJdAJAZ2/YsRmf9BXjHfHnvllBQ+LszI8kBGhDAfN/tCZ7T2EeDU5w8GVoKwVdsFcfOeQeLE4t3hznM9/ouvKQxZM8Fn0imUt0M5qFxa3hso4xzG+XcX8xMseEIU5Xc8bOuX+PvMZa/obs9AtvLrdCz5alwDRWGaWEL0MmXLKnH3ym3f0mJ+e7FvvMs2LThkvJC4QQkYCWt+t56mxajmsA5f57g/G8ZbOiIaC2DD0kip92jFkHEWo21UIVdF3wkMh7K5rcf5m3XJfvkuyPaJMiPbLCARLJHE6lba6rQQ41X2szOtBulPYhwevHdLN0UW4/Flxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbvhHxlLO1642pXBaDEfWehMsyn88DfKcSTKtOiE1n0=;
 b=D9Pryn99mQ679F8yuBBI5Rn70ZJlUYAw+7iO11dPz1w3oM3L7cAQBNazFkHaTe8EP8JaWd7X7P/JR0ON0aJYN287/KOQrsrNXjakMFBPZfMduXLvsd3imoqODhu1Ix3g7323hemNfSbzDrDopbsiQszmCNeHJwuZqKmD9N+7BXMXOwIOk7YmBkkS8ODOGN+MW92APWndYS3hUo1tguuNRLXomsYK+XHlILIUgTnxnY/SKOCJ0q86ha5uB1ueIyogK0dL4GBaePwi4ETQE5vILIsXTYmuSl8DPr9kzKAnli9XZ15dO+kRKnhWWTBRuKGvW1jfSUf/i+fcG0+k7xZiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION
 domctl
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
 <YN2Mujj8jKGv7tik@perard> <4913d3f6-cd16-1865-9c19-99f7db615ded@suse.com>
 <YN8m4BBYrb++fEYN@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89ccd8b7-42e1-0e86-5929-2a33fa1b9c4b@suse.com>
Date: Fri, 2 Jul 2021 17:12:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YN8m4BBYrb++fEYN@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bfbefd7-6d54-4f40-54ed-08d93d6bcc84
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2704F21BADCAFD3B4F5BB215B31F9@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9svFSW+O7ePAVbnfzlUHtlKF+85Z8OxN+n3dODLhgBouEv0xCtvymuq3AmNxVu9QNkC+TM1mU8yk788bcHGI5OKwo2Vzu9zqxCEvGPXP5xlxBrdosFfGhCHYe4HlZCUrGiuXXY/NxT7XntEo5Nrwn5kA957Xl5KqkfjCP+S3TD+eybvv4GXMkVAtQbVG8cektXJq+VwoqGyXVDHuFuRXRNAU7yuzaxjl8K8l2sxsHoGdiFRy80EKvy4whyECfukW/6wB3otpw72HRNiMpRe71mt/zZo194p/GRsHUZL/7plsWeqZEeSuJ4RtxxzQ9XmI3sbIPJAXPcR2i/9LEkMpSmfa/eWBnNGb8J7tdg/cds5rCdRLyfT1vpZvPI23ON5jWvXaH/nGMqmhnvGUFcXNNIgeRj//pYN/sevDo2/tRMCgaobK26RZLqezhzwQ+5lGtV+YlfcrAcdhMIjo6QgOU9MVl2yrCG0YOMkJ65uxM6aIabXoEquwIB0rLIT6XsaiTtjuJMp78dZjlS+oCQ7IPrBQaYJWi+AUpG+TqignFEdh4uHNh/rlWvBINzEHjw6ONOuRuHYdZhB8PH5SgcZRFNxHk8Y9sLjXwsf+6aBCBchij3qV1KhlTbEMILcx1R6cVdiq0rafgCeKWvchDMVy6JGkIJM/8g5fSGHGNXgNpQBuTExBr7NaFVMjxihsPudPf5s3V6sMRbyOc98h8Je6wgZ8nFi46DhrMjhr4mRj4ZnYfNigCffCcAAQP9lQVl16
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(396003)(366004)(39860400002)(478600001)(956004)(31696002)(6486002)(66556008)(83380400001)(26005)(4326008)(2616005)(16576012)(186003)(36756003)(6916009)(8936002)(86362001)(316002)(66946007)(8676002)(54906003)(66476007)(2906002)(38100700002)(53546011)(16526019)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFc1VGV4VkJvNWsrMW0yOXEzTUZjeVhtNloySGdpMmRiSWRnd1EzM1NRQTJH?=
 =?utf-8?B?T1FTaVFsV0g5WS9PNWtwalJaNkdsZDJxUjEwbHUrbWI5Q1VJMUZpS0h6SzFI?=
 =?utf-8?B?N3dPemhpcmx0czVpUjJqRkdGNUJBdm5oZGVuUXU5SXBscjY4LzEyeHJUM3c0?=
 =?utf-8?B?WkRMS0dMazZiRzU4U1JpcGVJMEoxcndEMUtiWWk3VjNVNWZJczVlRXdRTTRI?=
 =?utf-8?B?V0ZTOUFucGc4RkRYc3I1V055MDg2TUVwYWM5OURpYmJrSHZQZmpPL0hqYnhr?=
 =?utf-8?B?SmYweUx1ZEc1RlpLNnpaeHRNZTRpT2pMTG82MzlJWEdPOHRkVjRyb2FWcVlM?=
 =?utf-8?B?S0pXZ1VHWENiN2xsTm5adUlXVXJ2VHJTYzVwaWFHRm92eGxYd0JWcHkrblJs?=
 =?utf-8?B?MC9kRzlhYVhaMkVjVno4K1VuMHQ3RWRkN3dSdXhBNmppLy9qWW4yS0U4bURW?=
 =?utf-8?B?NS96NkJnUDJyTmkrZ0ZPbmlQTGsrV3U5bGdFTVoyNit2b3ljM2swMmgraWZz?=
 =?utf-8?B?SnNoeWFNOVg0N3JTTkRvUTRzWDZYUTR4RnpwT2xxTjlYNklMa3hYdWtwbkVW?=
 =?utf-8?B?U3hUMHZSSiswNldSRE4wWFhSdEJPVHkySTk5MmIxelprajdCamg0RjNlOHk2?=
 =?utf-8?B?WDNTTXk1bnhxS1VMVDdUZ2NUaU5BL0pBdVQ4NTVSWEUzcjV2dThYR2FWTTNI?=
 =?utf-8?B?L2dvWSs2M20xci80ZlZISWcwL0R0VVNFUUl6cmJBWFY1TDZWc094U0txR3RD?=
 =?utf-8?B?YndRc3h1RmxaVXdOVGFCQndMa0NONU8zVlJUWTN6Y3lOK3lhMldkTmE5WHVH?=
 =?utf-8?B?T0lEQzU3VUhxV3Z2OWlVVHU2VGVPU1dyVEhIMy9EcHkwNi9lcTlMSnFCdDUv?=
 =?utf-8?B?NXQ0Rkc3YXk3MUs0bW5hOERtVmxjN0dMZ1U5TzNRYzJjVGM1b3Jnc29IN1Bs?=
 =?utf-8?B?ODNxQVVFK0pNNFFBOXFScW1tZ0lpaCtFT3dsT09wczdoVTFRelFXK1dkbHpC?=
 =?utf-8?B?UkliNE02TXNBVkFnK0RhSzRhdkt5cHpnOU5zL010OHg1Z1oyZWdqZzV6bUpm?=
 =?utf-8?B?VDlLdG1WWEk0UjNleFlURlk1azJBUWZVZkVJUDBBVUEvZHRHTk1yTEc2UTFF?=
 =?utf-8?B?ZENhVGw2blQ1bVdSelV4LzhQMWNhdVVNeFZ2M3d1NWc5ZTE3QXcySVZxRFox?=
 =?utf-8?B?b2xTdkthblNQYjZobFdDeEZ0Wi82OFI2VWV3NHV0NVZSVDU4RHBJVjdZTDBt?=
 =?utf-8?B?S3hqMVdsa1pTeStBTjMrUjJkMnBZODJJenNuTllxcnE1Q3BXc25EVlZocU5M?=
 =?utf-8?B?SjExSjBKamxxNDVwd0RGSXczSmNhNzRKWnZDQ3lHTWZRdE94NENGb1hVNzBm?=
 =?utf-8?B?MFhXdW1PT21VdWVUczdlT00zVFAySyttNytMSXdndWFDenllMFB6NkFFTDlU?=
 =?utf-8?B?YnNZMlIwcWE1SUVZWmZJbkdIV3F1cDZ4SFFvVG1qSE4rQjBudzRVSVBDWDN0?=
 =?utf-8?B?N0hXb3AwUEJDdVhDaEtQRUpDckE1TGg5RTh4QlBUWWtNTm5DOC9XVFdlTGNM?=
 =?utf-8?B?dlFqblZndWc2eGdlZ2QxaFduY2lMNXhaaDFBUzAxMFhLU3dmdUx2T2ZEYjNo?=
 =?utf-8?B?VElmYVlFbjRmY21nbFNTRWRmZkg4TlRJaDlmcndsckxmaDFNd042REpPMWVI?=
 =?utf-8?B?RjcwSU40dHNOVHI0MnVqZzZTTU1KdHNBSlZ2QjV0aU5PMVRia0k5TVNETW9S?=
 =?utf-8?Q?vEk7corV+XXqUdAkiVBRqHnA4+tn390DKG5irVV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfbefd7-6d54-4f40-54ed-08d93d6bcc84
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:12:25.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2OvLFuJCcrhp5WlaJhvBXd+Iq7sidep7Uowq47mDlKzyrj5vn5HQxV9myuqtCfAPhurULwjEje6iHSpkKeo+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

On 02.07.2021 16:46, Anthony PERARD wrote:
> On Fri, Jul 02, 2021 at 02:29:31PM +0200, Jan Beulich wrote:
>> On 01.07.2021 11:36, Anthony PERARD wrote:
>>> On Mon, Jun 28, 2021 at 01:47:03PM +0200, Jan Beulich wrote:
>>>> --- a/tools/libs/light/libxl_x86.c
>>>> +++ b/tools/libs/light/libxl_x86.c
>>>> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
>>>>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
>>>>          unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
>>>>                                             1024);
>>>> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
>>>> -                          NULL, 0, &shadow, 0, NULL);
>>>> +        int rc = xc_shadow_control(ctx->xch, domid,
>>>
>>> Could you use 'r' instead of 'rc' ? The later is reserved for libxl
>>> error codes while the former is for system and libxc calls.
>>
>> Of course I can, but I did look at the rest of the function and
>> found that it uses "ret" for the purpose of what you now say
>> "rc" ought to be used for. Seeing "ret", I decided to avoid it
>> (knowing you use different names for different kinds of return
>> values). While I've switched to "r" for now, I'd be rather
>> inclined to re-use "ret" instead. (Or actually, as per the
>> remark further down, I can get away without any local variable
>> then.)
> 
> I know there's quite a few (many?) coding style issue in libxl. I'm
> trying to prevent new issue without asking to fix the existing one.
> The use of "ret" is an already existing issue, so I'm fine with it been
> use in this patch for libxl error code in the function.
> 
> BTW, you still need to store the return value of xc_shadow_control()
> into a "r" variable before checking it for error.

Are you saying that

        if (xc_shadow_control(ctx->xch, domid,
                              XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
                              NULL, 0, &shadow_mb, 0, NULL)) {

is not acceptable, style-wise? If indeed you are, please disambiguate
your statement above regarding the use of "ret": May I or may I not
use it? IOW do I need to introduce "r", or can I get away with the
existing local variables.

Jan


