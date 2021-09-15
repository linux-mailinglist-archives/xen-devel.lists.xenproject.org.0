Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8040C665
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187646.336593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUwB-0001LB-CJ; Wed, 15 Sep 2021 13:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187646.336593; Wed, 15 Sep 2021 13:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUwB-0001HT-8n; Wed, 15 Sep 2021 13:26:55 +0000
Received: by outflank-mailman (input) for mailman id 187646;
 Wed, 15 Sep 2021 13:26:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUw9-0001Ge-Ip
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:26:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39e1bfec-14e6-450f-88d6-9d4ab6c63143;
 Wed, 15 Sep 2021 13:26:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-m0u-xFKfPUS8eSUh7SStsg-1; Wed, 15 Sep 2021 15:26:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 13:26:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:26:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Wed, 15 Sep 2021 13:26:49 +0000
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
X-Inumbo-ID: 39e1bfec-14e6-450f-88d6-9d4ab6c63143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNU533Nas71KGaxkrjt8Y4qhfH0SyWRPA/lY3YgjMd0=;
	b=etd6icAyDgV0LsWvCl+WEd1BjTm3Qwv13LIdQUiFU6d4TBJQcn56hMZDQjJcKBcbH+ERAa
	bhpoH8jXVepYivBSVTERf2uFwhxTZHRM57A+s1F6K7tIs9jvwnO+8sRb/nTkMzr3c8qjLk
	Nc/aTSCbLFReFbKtj2MPOc/PPNZp5Wo=
X-MC-Unique: m0u-xFKfPUS8eSUh7SStsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXJe1CvuUrpYq6H9KGPvpt7ar1/bkWERk3uEVIjMxjBmHUVj6nvvzFtntGfT0Tp1PPvEcn0cmPgK6jSgt0JlB5el1Sf/OuCgxgudJrwSqjLJ23w7XM3dYwEuYQY9F8eFEyHVbmfs/1GDLX5VoRkMjfgnh37hyYcYanI9Z3BbZ3XPFliXjEylSY3CQdFmj1fB27yUNsHRqZbt208AXrc54mz//s5HipHUAbxsGlO+/z819P1w2Bj1HUkPpDCZ/vaFdaT93ZRq0WhFpYL9Rux+cUeZBtkSSOsuklB1TdoFVW5ztTQILQyWNMyiFr6ToIizA8r738qfyvD8VRO/184fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KNU533Nas71KGaxkrjt8Y4qhfH0SyWRPA/lY3YgjMd0=;
 b=VXKsUlbkagqgre7uehe3Q/anitst+U/HBD0UfQ4TQLj3h1YUYeVCzCUvbHsjsCm0cMtJ/1PuFMObcka++nmec9XVvFw/ORLleZdDIE1kNTD/vja6gu1zz8qY++st5q1AIpwlKkyfyjn/w2LYZyEm/+/ypYHut8FqyR2yvxQEw5A28fDPD+rbJf0HEyKartI7PqoWjuxSfHqISAch95u/3knU2snw//+byS0RQA3bw5YEhOIacylkkGrYD8mv0Yu65GDtBDhu913lkORih5Hu/kP1yeN96Mhz+LN2UzNTE+TYXmm85J+Mw9u5tsHHEi7ZWgP1+DHoZwadZRfKq07O3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 7/7] x86/boot: fold two MOVs into an ADD
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <85e26647-caef-9f18-eadc-452c4c4ce19e@suse.com>
Date: Wed, 15 Sep 2021 15:26:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c3a53a2-a77a-43df-c71c-08d9784c7965
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53276C90210BA35DDB31CA1FB3DB9@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GA2UriHqqpe/KQL/aOg1PCWco+ZVmlKQS7s1utumEl49r3d6SHgOo4fyonfRBChk1/ppN7+FupO40aBMDo1wawQJYu4BYA0RMjPcc5i3VlhDTgtDgM4x5BH+COOmjndL5ovAM8AY8NMTVrzzKfl/4S//D4gdY7WQMMXUirPcH7w+oj5gj0wR+76L908hFW1bBD07Iaxalv0Ags7N9VQrtI/Qsg4nmLNCHNleFfYKOahSliG7W0YuHX9Km/S7zaRphkhcbJ42Q55zxp9NzKYLcxWWSmO/zafRCHYicIyeNwu52C/DjZAC1gaEUIRZ3mNNnOdRF+YRMfrICECBN6JqQSupUDjI75JusFzHBKuIwlyXqqtfKXdnFmHXPgBx9TehfJbYA4XAgIWiE45Lh7ijOzEujyFexmmurMuL6PCFsnh937Se/MXDEXdqpGUloSlVXmuwnor+AkUr1ssA7lv670+h+lgVfQ210LUk37R3Q/lkCNu0V8KOXwRqkPp+oOx0j0sxgERoW/lNIKYAmHzXZYZmiK00KsVnwcyh2J266uW/HJWpnLC+4rzvU4mdsvpuX2BnllynR+y66LWh+NXb7k7MjvFD43be5C2nL976io3V8WiQKlWuff+0L0+zXLziCHXe1xeiPKGihT0JXvSZqTEoVN8siL0Aa+0mCe4DDzv96EouZKYItLv3TaD3q+v/SeN4ApeqBWs95pDTpk4nk0qIZxbGPMSBzIj8AxGQ+FQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(6486002)(316002)(66946007)(8676002)(2906002)(54906003)(478600001)(6916009)(8936002)(66476007)(66556008)(5660300002)(956004)(4326008)(86362001)(38100700002)(4744005)(36756003)(31686004)(26005)(31696002)(186003)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpKZEZrQjFWUm13OG9EZmFBQVFta2lPSjB6TGsyMWhrWnpzd2lNZ2szWU5h?=
 =?utf-8?B?cFhYWDlCM25seHVjS0p1RFRGVWNHTTVNeUMrS3c1aWozVkJqZWhrM0xiWmVs?=
 =?utf-8?B?bGtVV2U0RzlOTG1xdEI5TzYzdXdRNXdaK1hLUHExV0RqVmJrVzBoMkdZYnVj?=
 =?utf-8?B?QTlHQm44c0lUZHorSWMyWEJ3RkZLaXViYi9wWFd6TmxIbXlFQVJjQWtacTE4?=
 =?utf-8?B?ZWpac2dqTkZ4N05ubE5uU3RHaXBKVzU5ajFncisyYWIyeEdLT1VCeDdLNTBt?=
 =?utf-8?B?M3lhVmowZDBIK0dLa09udFJUMjBCSmp1QzNBWitCenVBZUgxOVZrTmN5NVhW?=
 =?utf-8?B?TFM1RDd5TWlONmNobGRKT0RkNUMyRDMvT0JPSVFDaHJOSGlFUVFYMm5KSDEz?=
 =?utf-8?B?dnJFME9OM01sdkRtWWJzbXdqdlBXYnJKc2QwSTFncjcwcFdlTncyZ25nVXpB?=
 =?utf-8?B?RXBZYTNUb3NlR1duRDlUMENtZzlGeHRUS3BwS0UvWGdIamZPTjF3SjRCKzF5?=
 =?utf-8?B?RHdrTUIxQVRVWjlPNVEyNFp2Yy9UZTZWS1JvWE1NeUFxaHc0NEY2WExmRmpI?=
 =?utf-8?B?MmlUbW9hTElkUCtZNFhNcU4xNG5NKzM5M1IwdmJURUVld1dBNmRvcU1ITnB6?=
 =?utf-8?B?aExMS0N6bXBWYmY5eTlsOGhzdDc3REJ0WWNpNisyTktiL09OdHVKT2xKUDB4?=
 =?utf-8?B?cWZsZEJ2aTlrY2NqZTU1cFZhbFJBWi84WDNhWWxEbFNaMTFiRm9UQ0hYYUQ5?=
 =?utf-8?B?NmxWV3c5QnVUT3VpckQxQnQ4Y3Y0MHo0NlVYS0VtQTMrVjIzOGNRL0xYWmxi?=
 =?utf-8?B?RWwxOG9ORUVlZ1F6bkw3TFZjSDU5UmdPSzRlSWRnaTZJdzF5emN5OHVwV09a?=
 =?utf-8?B?S3UvUVZrcDdGMlVZL25taVdZWVJuMGIzRkc4aGZLbU9hTmdNR1NaV1VMMk54?=
 =?utf-8?B?K01nYlRHY2drQWcxdWNJZTFhZjhiNEE4MUcwbWM5b3B6dzlDYms0SFNJQ1p6?=
 =?utf-8?B?eFgvb2I2dlg4akZrcXkxT21aQkNaNytBTG9iSHY1a3Y3M00vQ0VFaHpiOEF5?=
 =?utf-8?B?TWcwRHAxSENaK2JBR2kyallPaW5adno2V2hoVC9RSnVRVmppcnhFUjZRRmFk?=
 =?utf-8?B?QlRSZndISVVKcjE0T2lKa0J0N1lRdmZPTXZaZi9LcXJEY1dKS3dTeFhyeVY5?=
 =?utf-8?B?RU9mWmRBWGcxMm8vRUFjOFVJeFRrd052SWFKQStYNkNxUzYycVVSSi8rQzhO?=
 =?utf-8?B?eDM2WXV2ZExEdEZwWDRweHhMV2plZVZ3NGJVeXJSMG8yaFMyK1M0MlVDVWJy?=
 =?utf-8?B?Z2FjNFgwTUh0YTNZRU1odXVCQXFLYVpSZjR1SzdFZWpiUFcrRGwvQnh5dGh0?=
 =?utf-8?B?bE91NEhvam9WOG4wTXBpdzl5RDlWNzRld2VaaGtXQnpROEV0bFVJOTZPZm1z?=
 =?utf-8?B?OVR2aWV6YWN3QzhKYTBLckdWL1dQT1E3LzhoOXEvL2c0bmZIL01UZnpJUVRz?=
 =?utf-8?B?ODh4RE9Db0YwcmsxZzBRNHdsaGt0TGtzSUpLQzZTSGhhMW1qMnFjaWZzVG5L?=
 =?utf-8?B?aGcySTkzaVZna0Exc3gzTkVTeVkwakl4ditIL2VYRldMVVI5NWVYTVVzSWxI?=
 =?utf-8?B?VURlc0lZaUxxSnBTNFV1dVBjLzFtV3Z6MkhGMDZPSjlyYWlOZnZuTFFUN09R?=
 =?utf-8?B?WExsOExxUGp1clNpNmRxbW9WMmhUcnpHU0x1LzJSMm9hNWFmWlEvdTZYL1Np?=
 =?utf-8?Q?jkNKXGE5fAENcyvai/g2CP77/ddXG0G/vmz2Tn9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3a53a2-a77a-43df-c71c-08d9784c7965
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:26:49.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvfVA7kYUob60b4OW2rkZk6C5mLHlr4hgDllW/ebIymETJ6FK/HBHpQqINK1Yl79tbh+grQlNZI+4ZkWUeWwYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

There's no point going through %ax; the addition can be done directly in
%di.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/boot/mem.S
+++ b/xen/arch/x86/boot/mem.S
@@ -24,9 +24,7 @@ get_memory_map:
         cmpw    $E820_BIOS_MAX, bootsym(bios_e820nr) # up to this many entries
         jae     .Ldone
 
-        movw    %di,%ax
-        addw    $20,%ax
-        movw    %ax,%di
+        addw    $20,%di
         testl   %ebx,%ebx                       # check to see if
         jnz     1b                              # %ebx is set to EOF
 


