Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1B53BBEC9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150384.278059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QNJ-0001JX-C6; Mon, 05 Jul 2021 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150384.278059; Mon, 05 Jul 2021 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QNJ-0001Gp-8G; Mon, 05 Jul 2021 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 150384;
 Mon, 05 Jul 2021 15:19:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QNH-0001GA-GP
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:19:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ef82d97-3515-4199-8073-9a88d7333d68;
 Mon, 05 Jul 2021 15:19:06 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-nu-3OTzgMRuMgoeBjUPhAQ-1; Mon, 05 Jul 2021 17:19:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:18:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:18:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0101CA0061.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 15:18:59 +0000
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
X-Inumbo-ID: 9ef82d97-3515-4199-8073-9a88d7333d68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625498345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zViDK8FuxeRhRXIhpj/SCVn6kY0R8hbaF74WBTbyFgY=;
	b=ksAM+1xgCk1RBAve0txCj1XusQfUd4IKDMUjcC0DIJWCKCOyCJp8e9PjRG75+5qy2O0t3G
	y4Qk6Tm7nf9d8Xo1itu8E5XmKRYN/bOhDwZhsDEKXh9eXKmUWMo5+NvEjLPB4I795Fr0Lg
	LtyNxroTJHXW7yhAXbvhmfZEIaCme3E=
X-MC-Unique: nu-3OTzgMRuMgoeBjUPhAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjvDoRys9kN38HoiEWKnTwyXmqNAfxjfCgEq/yxfbgIZgvJG8B+0S/bGG6enkUMsN3N9BTwFqA3wDmYdt+WZPl6NGbH5BDpcfdB8bwVYXEVLce8TPNkTd4reQ6foxBCGtk11kIe8dtThUa1eUZD6QzxmWBuUYFOua5H0j/Jct0QsqXPbIMvFr4/WIkb371T5FfFj5hpFjjCgNh17y3lWiWMiQ2dYDQ0MH/KzoXHdNRqHiY4coZz6Kv8iK4TCT7APYUIoARkUlCat5QkCCZPoCS/ygrE6eNNpA1vY9atSyEj20XxEHjwL5v+prOhbtg8xLw+it9Lu5Sxn97f6l9s5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zViDK8FuxeRhRXIhpj/SCVn6kY0R8hbaF74WBTbyFgY=;
 b=buof7unWyY+mF0+gLLy8IhYHOO4eb0AFQx/jYWuN2P2Ld3MhBozCKkCDTYRMoS+82Wr8r+GRfDTfqTEMv93njyWKtsVy1RgMexHASXlG2XYBTm3Yc17kKKl6ca9hOE7TlN41mDlgjqjZMx44mwnU6GIYHqOujAlT+pkevPSH3N8PRKlPXxInNmbWXnUxWgGV2c4COEoIeiWaVM8BXr4Xjbe+uVOJqbMKD+g3JJJ/7tKPkbEbnAyMYK2CIkUidn04xLkiaL8jZtYzhw09jLBRZnaVzY8tkFrzC9Uznk5qSR3oBJBoAb8h694zb634koAUpDUb1sbl1w8hK7US8pxiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 13/13] SUPPORT.md: write down restriction of 32-bit tool
 stacks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
Date: Mon, 5 Jul 2021 17:18:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0101CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8810012-ea42-4dbd-1f88-08d93fc836f8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472D36DB94CE860C6D34BB4B31C9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HICbAzkd9BhTrQHoTbg/+Yqh4t12j96rpBo0dtHhkTA0zvf7O/VZRG6dwLppYNAUH8V9bQL9k2Zbb7DdzpsKZKd3OJAlNstmJWRATSF0lgdt/pT6u1/3HW4SR/K/lP8TbCGbMnWgD//jKGUpmvOMT3T4/4mEBbxUcJ7Pg90imqfyRMujaBOZT6SDtbKbhjnzl4cJfmFIsJcdzen4AIdCORN/aaDAdGr8kfHjWGGa3AbmQucuIhJdpUoYJsMWHtBDVTLYGxSspGOxyERFKdkd8Ds+7RpaxccMafRuMd0sKWhADp41TEXQNrMu3myBJp1xIwPd60EiKj7PgIDupHMZstyl+9CT20+qoD5w7IUMLSsW3ihScZ9esyt2hd0usb+JZ/YoqHTzu3+dzNKNWQV8rRC3Y5+4nWfIJ0zWxxIo/+SoWk8ekbS6XnHDnH+aeYE4xkxhFFRkdV0QsOxDx2U0LuIh7UoXG20r/YQpXF8tXQ9Tckp38eJKmcysIox+RljpaHkC7bcXuLZzPWzhhUABjtwKYO7LRKF9yq+mzbXE1R0yBk2aTO2rsf6rK1r8h+IO2VQAQC91pjAfrv5BRLPieOhGcqWdKR/KwuwuKWTWlIrXyeG/3THfCrM7E96rTbT8yTb2g46u0AltmnCjLhljKY0f3VAsoZZXmoxXIuBeEAb7CEbHmcGD03Uo3GdfgFAXNlq9phUq11KzhWoCPN5ojQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(366004)(396003)(39850400004)(54906003)(478600001)(6486002)(316002)(16576012)(2616005)(6916009)(8936002)(2906002)(8676002)(956004)(4326008)(5660300002)(4744005)(66946007)(86362001)(66556008)(66476007)(36756003)(38100700002)(26005)(186003)(31696002)(31686004)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJzaHowQ2hLa1piQ3A5Yks2R2lVckxWV2kvb2lhM3pkSUNCcHQzVVJBTDNi?=
 =?utf-8?B?ZXZDR1ZiNDZhZnA5NGs4UVZtWFhMaURtMnZCamhYYUhPQ0FYcE84QjhoNXE5?=
 =?utf-8?B?ZzZNRGtKYkt0S1JUbWJOM0FWT2dLQWVnSzJCajdpT1NqWmQ3RVpacGpIVCtk?=
 =?utf-8?B?aGJwcHpmeExJYzR3bDg1T0lyTmw0dHNWSm9uT3FDOFE2U1U0UnpMNHh1NEw1?=
 =?utf-8?B?Y0puTW03S1VvZ1FZU0s1YVl4eGp6WlpYRGlzZUM4WmlJbXBXcmkvSjFlN1ll?=
 =?utf-8?B?Z0hPQjVUZjVDd1lobzhJVWZpSDFuUUFQSEdFUmRkTGQ0OEk0UFBNbnd1ME9i?=
 =?utf-8?B?UUpIa0tNK2ttL2pUcGJaVlo0bDNXSHF1dXJXbi9wTnJWRTBFRlNYbVpCUFZW?=
 =?utf-8?B?ajNqWGVDZUk4b050MUtsd005NEE2di84Tk5YWWQyMmtGeE40b0dzVW1mZ09R?=
 =?utf-8?B?RDVIMjFkczlybGpQQ2NqN3Z2MjcybUFLQlU2TjhYZm9OWmxhVm9sbS9lZ1hK?=
 =?utf-8?B?ZU8vYnZvZFZsOFFaL09YdDNxT0JZbU5Cb0tSdHVpa0dmbWFhVUFvWmZrSFk3?=
 =?utf-8?B?Q1p4OFlEU0pOcTRHajVoZGhRUXlNdG5JSWFDVWhSMW42ZWdJRWlyQzBndmhp?=
 =?utf-8?B?YURnaWpObHpxdWY0MGNmUnR1ZzN2NnRuMWxFWTZVOXg4dTFPRDRQY0NtSkdS?=
 =?utf-8?B?UFE1REVTMnU0NXNhYk9ING1LZkkyekFzOC93TGFFREdlclovT2JaL3hsaTBF?=
 =?utf-8?B?SUhNZ1prakJJOFFKT3pkT0l6MnNISjRmVTRlZHhhMVIxR0FzbDVFd3ZDVXNh?=
 =?utf-8?B?bzFoL1krcGlyWjVlVDdZTDg0U0YvdzZCeFBSbERLaVU1MnFIbThGQ1Z4Y3R6?=
 =?utf-8?B?TkQ2bjlkNldjMlh6akFQaXQ5WlgzdDZhZUo5N2hzQkthRzh4b1N3WkIraitk?=
 =?utf-8?B?anEwdE9NSjFOUnNSYzJNN2VYWlpqdlE1a0REaDdIYmhQdXJJSHNzdXgrNWQ1?=
 =?utf-8?B?Z2JjcW5ZdjcxNjhVY1JKRFNrbVVoUkh0azcxcEdqNGhYdFRtMVYvaG1lckpO?=
 =?utf-8?B?dnZJZWlmeGpVeGNqVFBTUWRGcmZiMHE1MnhPdlJDWE9sanllK2FQOERBTk9t?=
 =?utf-8?B?OXNWZ3pNcjVCa0s1SnlmMUIzbDMzdC9oTXIwT3I5cGhJUXZEenJpK1dmS1FD?=
 =?utf-8?B?Qk42UkJTVmRIYlAwdjk3TWp0c21Ra3BGbkFFRmRYY28rcDhySG54UURCVDZB?=
 =?utf-8?B?Z25kUG42dkxEV01YeTByS3BianF6NWgrZnJtWnFKb2VuNXc5T1BmTkk4eTRV?=
 =?utf-8?B?QlVzUFFWT1F5SklBYklKR3ZJQzdKeFJzSXBlVzJKRGgvYUh6UUJCMGNCS3RQ?=
 =?utf-8?B?L25COEpEdk41NDVjREZPMmpEOStCeksvUVdnZXRlYnhDUHRtT1BOaWlxbVFo?=
 =?utf-8?B?ZHBGL2pMR0szZXpJVjhoRE9iZTVPd1N5WDhSNEhyY1F1R21GUHBxcnFPbmQ0?=
 =?utf-8?B?aWhiaFV0TFJzNWxuaTN1eGp4K3VrVWZ2YVRBeDdNaHZFRS81eXdmdENEbjhH?=
 =?utf-8?B?K0JpLzNpUVBrV3BRYXdRcHIzTXhJNzRhQmZqalpPVlcwei80ZzF0cnlwYkM0?=
 =?utf-8?B?cjNyVktRRVZNbFZnWFd5Tk1BSUwyTUp4TTdNeVRIM0hVRGxaZTlGdUF1S1RE?=
 =?utf-8?B?ZDdYYVY0VUZrVmZSZUlySzMreXZLMW9LS2pDeUc0SXlTQ09NTnM0ak5KV3Nh?=
 =?utf-8?Q?o9G+zKCdRpcxDAsX771gTs/9LgOw3FDDzsPG2YL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8810012-ea42-4dbd-1f88-08d93fc836f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:18:59.8934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuG47RgKBH+h5gDloSuD2P2kgHViTWrXg622nhILaWrT3aKBphVx1lepOga2dj7Hg1tnu7+V7wJQ9L+nLavcKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

Let's try to avoid giving the impression that 32-bit tool stacks are as
capable as 64-bit ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Wording adjustments as per review discussion.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -131,6 +131,12 @@ ARM only has one guest type at the momen
 
 ## Toolstack
 
+While 32-bit builds of the tool stack are generally supported, restrictions
+apply in particular when running on top of a 64-bit hypervisor.  For example,
+very large guests aren't expected to be manageable in this case.  This includes
+guests giving the appearance of being large, by altering their own memory
+layouts.
+
 ### xl
 
     Status: Supported


