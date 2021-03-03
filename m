Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1732B798
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 12:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92821.174994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHPya-0004GU-DO; Wed, 03 Mar 2021 11:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92821.174994; Wed, 03 Mar 2021 11:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHPya-0004G5-9d; Wed, 03 Mar 2021 11:47:36 +0000
Received: by outflank-mailman (input) for mailman id 92821;
 Wed, 03 Mar 2021 11:47:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dD22=IB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHPyY-0004G0-8h
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 11:47:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a317676f-3be9-4547-9822-22cc71b3299f;
 Wed, 03 Mar 2021 11:47:32 +0000 (UTC)
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
X-Inumbo-ID: a317676f-3be9-4547-9822-22cc71b3299f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614772052;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=enl88DST0Ml9Qdz9BTXneN6SvP5rs+OmPrTeHTem2P4=;
  b=LfhVdhuwGXJ5SpRURk8Ftp/jYPiFmh19Ljp+v/4FUe5VaeFgXkWmZTj6
   NA3+XKH6MBLyCS2sRksQjsGB2YQ9MSpp8jshsE3RBWq7DBFrUT6/y5Z8f
   mBMDvpH5vYgwKUTwo/Bdu9LIztqgiKiejvOOGj0oywmlWbBHsT/HeGj8k
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +jeeHrDWaqT2cPX1aXaWqPBw7Md7k6u/00O7eLm7zsEEaHO70yApyyMXWAzAo2fQMTujb9Kp/J
 D0+6xz9YC200GPlvXU+5ATpKlFdSIrfMbPP19h+bPk934j8N4Z4H0NM3hLPobEZq3WuwomciBI
 oQUWT6QU06qWSUpLFSmalVpj+bKF1irg7aLYuBB11tFJIrrS6oFXGrK04oTfU85Rv5X2+Ubk1n
 KXOGB447Brw3U4uRP9AvhUHSDUPtGJqwa7opdMfH2zNiVUbcG6fOAzhE5pGRvS7UTLmbbNr1T2
 js4=
X-SBRS: 5.2
X-MesageID: 38340508
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,219,1610427600"; 
   d="scan'208";a="38340508"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7ArtUWIml8vk1MWb6sCYZVmuOVHdltQlFy5REplH6WbQsYDl4hdT80jQqy0XNPJjqkicogVABlNjbjcjpBgEj0d715UQ3Mq6odviTzoFmebpT5MemrrRu9d4OVUqM++yR20Lo/vyl+geBd5NC7fVldOlNybb8qdkk8S56JBKf4O3nTiXmgNRJr3e1Uh6IeiD+cZnVz4i6aGCE4TJ6dgjisX5Os6nbYx1RZn8guS5aKXwI8vtKDIhl7T3q56r1JXlh3RZ87YpETxXzY+qiUtvIF6bAlE2WtY0MoK4Q3TkTIWutMmBNx8NaPY1ji/m4lMQ8W4ysTL+fqeRFGWrIDG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enl88DST0Ml9Qdz9BTXneN6SvP5rs+OmPrTeHTem2P4=;
 b=Invz9TzkT4HHwE+91WKceqH5504DtXdOxa+iXW6wBJwwmz615ngFsVfgOCP/ZG9V/VxYTQgrQrhkI/5dDEXWXD1y8BxvGDTq8FWj9OaAk5Pv/as/u6Y/IX4i1wi9NA9AbFBLpt5cVdeMBLgjUhmBzF2oxwmyV6YsTp1npPBB0FOicZgcwih844MJTBbrylQt8nwVFkPwLe9ooJI0zr7QjGBdp9aQ66+aLmVAFt4/aGqWLBRKpgBqvdysVM23W59HJjM2zorv33wzn3XugCp5RxVyNEJnEe78bw/HirkGjEulvZBSPqdNI7q8F9VF2ADVa/1klnvn6h6mthGcXVLdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enl88DST0Ml9Qdz9BTXneN6SvP5rs+OmPrTeHTem2P4=;
 b=HxR+QGy0kNgVuS6Yr+k7JejNXzo/eK9b8Iq3jmnF8B7y1hbh3MUstatsF3+hLYKI2vfgUChRM9d9cnEvzpnFF5XzHyhNp0Ehm+k3c6Qt6mmK6sL3GzfmFLD602jOS4RSgv9DJtQc8K+ASlQsNIgcho866Rcb6KgUS/8Wph2HPZY=
Subject: Re: [PATCH] automation: add a build job with NR_CPUS == 1
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>
References: <20210303083318.9363-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5dda8f5f-0d91-e956-383b-41060ef8f3de@citrix.com>
Date: Wed, 3 Mar 2021 11:46:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210303083318.9363-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a39245b-49a2-49f1-f5d1-08d8de3a092a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB394272CF94C2F34053134FBCBA989@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Kf/xY6stsBtzyjfA4maf0THjqtbf2gzXEYx74Xj3OBxMu4696cZCLaldkXlF9+zOdE8y6gCw3/HL1ntid+M59R4UrSSf11v9fIwPxzkGVY3784KKuj7zKXkTE8/O+NoCUa6Wm8ht7HqLRQstzjOjVdwEazNtvxtY8F5Nk6nuVASdWP124Gpo34MyoLRMv0kFEKT/kjtgLy4wZbD6jpOpmhMK96hLhZWhpoAi1pejgR25SQa0b+bEsrvO6TX39cE0OtqjLz7tn6jcvnWjsQHnxC9nXlXQ7GODcGUJJ6YRZJIKjKrF+qN973FgJgdT62SVTNASNBl1WwloZRDX3QC76EViQYrDch17R62wgH3YhPC1z75Xp6ARniIRjbF9ye3BZkMHHE1f5NaSF2sg6+OL7MHI2M3JLkiRBxg1Y1cCCyqtrQZvaBQFkQXHP2P+0IDB+RmBbokQLyYLU13GqZ3lh3vWZA890kV97/2Zgaxv9wH6FqUaEGcO2HL5qmcQvam0vRIymh3gaVMW0e8QAx9HFwgMh4nD53CO0NUW6SMJGWM4Wh6yAa/5qA9g+tXuILS0skelSg3sUGN94GA6tb3rnvQY7OnZCUiGodNyOmiWjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(366004)(2906002)(5660300002)(54906003)(26005)(86362001)(36756003)(316002)(66476007)(4326008)(16576012)(83380400001)(31696002)(186003)(66556008)(8936002)(66946007)(6666004)(53546011)(2616005)(4744005)(8676002)(478600001)(16526019)(956004)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?REx3RHZwRnlhbythaFRTZWtUcmUwQjBBcWF0QzBDRHl0Tk1raHlwcldoa3l5?=
 =?utf-8?B?a2dOZWsxYkJhMkpHVys4czQyY010eWRkMVYzcHF3ektwMFJ2MWhGaDV6UHBz?=
 =?utf-8?B?UlMrQ3pCdFk1ckJQZ09jZ2R0SlFOeCtEMnh1cWE4N01DUlJ5NndLd1UweFpo?=
 =?utf-8?B?eDlkWGdjd0djT2duVkJpcWF4eDRYL21vSzVyektrNlBsNFY5M3Z0Ny9BWFRl?=
 =?utf-8?B?NTJhWFhlNnB3N3dlYzdTUThVSkdoQ3VyUnFPZCtXenVxS1duL09udjlMOGF4?=
 =?utf-8?B?aTUzdU9HQUdZb2xTT09pS091Z1lTdDdSYXFhdTNuZFJLMDhUQU5zV0xNcUZs?=
 =?utf-8?B?Y2NRMjZjd2JUL0RJZy9Vc2hoc0R0L05zR2hVaGlmeDZNR0t1OEdENWwvOTM5?=
 =?utf-8?B?ZldWUEF1YXpTNlBvNnBjTGxPamw1VnhuOVFCYzc0WTFVY2RnNmVJVGttVUxT?=
 =?utf-8?B?YnBkcXZKRllJRFpBSVpMOXdhaUdGTDZhYkx0aGR0Z2JTdEhKSVFsWFBXRFZq?=
 =?utf-8?B?K0U3RWJUdm9QdlFOdCtrRWl4RUlhUHBhYzU3WlNJVG15NHczM0k3Y0lZWGlN?=
 =?utf-8?B?L1BpYzk0NjRqYk9ZMFpjSVNTU3ZxN1htQ1RQajFQSmFFNk9QS28zblAzVnhW?=
 =?utf-8?B?Q1ByOEhza2xXRmxzWkxpWVR6WHQrbDdiamhuckMxZUw2dUZ4RzVwby9pYnVH?=
 =?utf-8?B?a0xZWFp6VHdvZDZXajJ0eVBsa3ZXc01oNzJyMlFwL3RWalo0WmU0Zml5bU5z?=
 =?utf-8?B?U3QwVkVlcENzdC81ZjFRZGtmTTYvSFlVT3BqZTh4NkhyQ1lnZFROT241N3V6?=
 =?utf-8?B?THlSa3g4amV5RzM3ZmtBeEZSVVk1UGh6ZjJRQzVRWjg0aXdURTNIN3U0QXFO?=
 =?utf-8?B?c3NLeDJtUEg1R29GZks4VDNzOU10aUNvK1EwTEEzeEowQ09rKy83TThpT3BR?=
 =?utf-8?B?bmhBRUlRbW1pNnFCb2lrY2tCclBGTG1HVUdaUUFicXI0djVobnVRcjhKekhy?=
 =?utf-8?B?c2VObkVHMkJ5bkJXU1l0WlpYTVY0QUhBdUd0byt0dHBvYjdkdWRnbldHRGlS?=
 =?utf-8?B?OTBzZ29LWnlzMW1tek9uU3l3OG1MeHlOcm9sNjZjMTVBWWNsMnByV0g5TGtB?=
 =?utf-8?B?OGlsU0g5d2VtdzhBZlhlYlBDV2oveXZEWWZ0SklFditVWFI2dFJLcmRySlJa?=
 =?utf-8?B?dTRKaW9WM3hXUXluREhvZVUwK2xURmMyQWpYaitKNU5GZHlIZjZ2YlExbmtQ?=
 =?utf-8?B?L0xSK0JUQUI3RWR6SjE2V3laTFYzVGVsb2d3MlUzL3JUMHNBV00yUVpQSXk3?=
 =?utf-8?B?WlhVNGl6RmpkUEVwK2RBUUdOVDJqdllTL0hYRlRqUjVlaEpwUDdxS1FLZzNW?=
 =?utf-8?B?K1J3RlZIREhzb3hYQ2tIaUFHeXBtQjZqVUEwOGlpT2JISm1BRlg3YU4zeEZU?=
 =?utf-8?B?b2l5czErZ1B6ZmhTaDduSUpKbVZLNzlQVWlJTlVSL2s2djhJKzZvcjZ2YWRQ?=
 =?utf-8?B?VkVScE5NSWM5c1ovTHV6MkU0Zi85QXEwWHpLMWZMS1BjOFdDMmVUckpOb2VL?=
 =?utf-8?B?L3JFcVRUbjZ4eGMzYmxnaWtJZm4xVHFBaHBuVWF6VUJaeCtTd0hWNzFodzFL?=
 =?utf-8?B?RmJJcUxSMTlUMFRiLzRPZVc5Umc2NVREcFdacVhxUDF0cmlYSWlwd1V4cmZr?=
 =?utf-8?B?SXRQdTRMZ0k2NDcrRHFYQ0tLdVRMRklnVjgzUGorbjhjQng4dUptYm5lVGNo?=
 =?utf-8?Q?3o1loYBY1WnYosxcnAdSIYzlDlK1nv8O0YQPYNu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a39245b-49a2-49f1-f5d1-08d8de3a092a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 11:46:51.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOPRFGJn9mYed+NSkZQB+p/y2/W/lgs3gOh4gM4LYxUBnaxzysV7J8S6RpJ9DzsRddvMUH7lH9KtrZv/VUbCSdTTXaEJH3c8S+oMb/WvIoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

On 03/03/2021 08:33, Roger Pau Monne wrote:
> This requires adding some logic in the build script in order to be
> able to pass specific Xen Kconfig options.
>
> Setting any CONFIG_* environment variable when executing the build
> script will set such variable in the empty .config file before
> running the olddefconfig target. The .config file is also checked
> afterwards to assert the option has not been lost as part of the
> configuration process.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> ---
> Not sure whether there's some easiest way to force a config option to
> a set value from the command line.

I'm -2 to this.  We've already use thousands of machine minutes per
push, and this corner case isn't worth adding another 30 minutes or so
per push.

What would be far more useful is for randconfig to be weighted to choose
1, something around BITS_PER_LONG, and something around max preferentially.

~Andrew

