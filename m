Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D27367FAC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 13:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115297.219873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXeg-0007rG-Ds; Thu, 22 Apr 2021 11:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115297.219873; Thu, 22 Apr 2021 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZXeg-0007qr-Aj; Thu, 22 Apr 2021 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 115297;
 Thu, 22 Apr 2021 11:37:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZXee-0007qm-Qk
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 11:37:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b6ca517-b395-4729-b66f-5a9baafa3f76;
 Thu, 22 Apr 2021 11:37:55 +0000 (UTC)
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
X-Inumbo-ID: 2b6ca517-b395-4729-b66f-5a9baafa3f76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619091475;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ml2qelRoNeEw/w/rOdoKROzuQXzr+vv26hWg7rN2k4g=;
  b=ezcQ0dxKBh781LOX6WPrUO7p1uH6eLs/jfkP7yo0wXRGLZtgwHrQdn4S
   q7NMDSaglRvMG8XJScWMkQlOCk07Xrbs4xqXwzv6d8lE/GfTxLd1E7lln
   YILr45nhpyjZs04pkuxpF6+q+SUyzrzeqIGqfnfDh7aP+lEyh12iKp/7Q
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wberg1xC0CB7k7e37l3TmPm5RrkgcLijCv2OskEIN2BW2mzxqiwgxWMjxHhS7j3DREMWOdbToh
 1HaJkuqlxFuV8ku2f3huFUfIR3iOCvzG07A0bYWbEdo0s4u0LH/yzrnnJrqw+seFjNU7bp2exl
 HLGwCLEsc+31GodVJVVAUOfWrf8/4vGWRd8u2hZP3JmeQ5EEdAmECR/eZvHKwpqPrfVB7h8su8
 7Kgl7w3ICcTPR2p+yd6AZ+r4wuPRkh/QFoOAWYHcOf62o2z7SuB9bLupyEvNjNy6UWGymbRgox
 9yA=
X-SBRS: 5.2
X-MesageID: 42290484
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:oqCISatrEmMsCMlPZSE3gNlt7skCxIYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwReCBtA50lGJ
 2AoudGvSOnY3QLbsK9b0N1ItTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lIk9y6J0l9n
 XIlBG827W7v5iAu2Xh/kLwz7ATotvuzdNfGNeB4/J1FhzAghulDb4RPoGqkysypIiUmTIXuf
 nK5ywtJsFir07WF1vF3ifF/ynF/HIQ52T5yVme6EGT0vDRYD4hEcJOicZ4X3LimjIdlepx2q
 5KwG6V3qA/ZXir8VWflrq4Ii1CrUa6rWEvluQelRVkIPAjQYRcsJAF+wdtGIoAdRiKmLwPKv
 VkD83X+Z9tACqnRk3e11Mfp+CEbzAYGxeLRVU6ocqF0zRat2AR9Tpo+OUv2lgH754zUJ9C+q
 DtNblpjqhHSossYbt6H/ppe7r5NkX9BTb3dE6CK1XuE68Kf1rLtp7M+b0woMWnYoYBwpcekI
 nIOWko+1IaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nVWKfrGTfrciFsr+KQ59EkRuHLUf
 e6P5xbR9X5K3H1JIpP1wriH7FPNHglVtEPsNpTYSPPnuv7bqnR8sDLevfaI7TgVRw+XHnkP3
 cFVD/vYOpa6ESGXWL5nQjxV3vhdleXx+M0LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 tySYmX1p+TlC2TxyLl/m9pMh1SAgJ++7P7SU5HogcMLgfRebYHsNOPRHBK0BK8V1hCZvKTND
 Qai0V8+KqxIZDV7zslEcibPmWTiGZWg36WUZEGmOmm6d3+cp01SrYqMZYBVDnjJlhQo0JHuW
 1DYAgLSgv0DTX1k5ioi5QSGaX4bNlzgACiJOZOsnLBvUCgpcUiL0FrHQKGYIqyu0IDVjBUjl
 p+/+s0m7ybgwuiLmM5naAFKlFWUX+WB7hHFQyBQ41RltnQCUdNZFbPoQbfpwA4e2Ls+UlXom
 D6NyWbdcvGBUdntmlC3rzn9051cWuhb1t9A0oKw7FVJCDjgDJewOWLbq283y+qZlwOzvo0HR
 vFbTERSzkejeyf5VqwonKvBH8mzpIhMqjhF7wlaajUwW7oApaPj7s6E/hd+4tFONjivvQQa/
 +WfxaYIVrDeroU8j3QgkxgFDh/qXEin/+t5Qbs63Kg2mUjRdXVO1ZrStggUpihxlmhY8zN9p
 p3jdg457Ttdkrwb8OL0qHRYXpoLAjJrWu/UuEvrtR1sMsJxcxONqiedQGN8ndNmCgaBoPTsm
 g1Raxg+rDPOoN1ZaUpCmlk12tssO7KFVchtwz9P/Q3cl4shULKJt/h2cu9lZMfRmm64DbqMV
 aR8ydh7+7IciuK27kdEb8xKw1tGT4BwUUn2OOJbIvLDgq2M8lF4VqhK3e4GYUtBZStKPE1rh
 xg5cuPkPLSXy3k2BrItT8+Bq5V6W6oTYeTBw2LcNQ4v+CSCBCpgqGw5tS0gyqyYTyna14AjY
 kATHcuVK14+3Efpbxy9DOzRKzxql8klFUbwQgPrC+S5qGWpEHBHU9HNgXFhI5xRjc7CAnRsf
 j4
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42290484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpvsSgvPnpVEpsB6gfTuiAgU4Dgk94aoBBrpE5TJqdudotC/q1CV4Li200w5lDM75c6E3z8KGeakHP0i2vukzt79BN2hsH1nAnw1/F+aWYJaxGikQNG0fBwEvWKppR4NBbaGCdh2ONl5OjWfsFEmq5N0cXdjuMCPCKQQK4owt+5EBH/j5WfEcfuAGBjBrdyGR1NvGp7npkIVm5b9rfra+IU1wk2fzXRj1VK4Iq0XOIfsOqQdOxkdmetgFtbD1qiJChAiWelyYv5k9hfQW8j7kCI6s9+hUt9jnyVMmwqnjpbB7lKeb8AG+fy/URqjHdk/BzMsIgDHHo46KdGwJIQjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htLj8WU6wm4I7XA0zn9KFIuwOuTxfkMX7ApT/yhLWfo=;
 b=DkmcCV8siJz4rwXInLOo8xGtJLDmvcLth/OsEoA5TMcfWfDpdU2y1mN5JYcATMRfxvphzTyByr7VX6kr4YVHVdfJ45gPZn1pIUBlEIlNTda+y59TlIK0D3/Opmmh4p6G4HFBBr0xNHJtVKbozVGBa3RyuLh5PJ981mmmHNziBIG+0d/P++MNrB6Q13NkzqHmcm7B7ZJnK/uB2xUgFZv68h7gOMDxuF7MEIyzLo9b91rqP1zBxxGLUJhUI5B2v7g+3R9lwBvUeAkHviugAY4xLCB5Bd+oZH2k72zT5GWHwdfHU6LFJ9F5AWVDA1wf3XWCdWkHG0kL51bUj8Hn2vVT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htLj8WU6wm4I7XA0zn9KFIuwOuTxfkMX7ApT/yhLWfo=;
 b=WcPJFDsriq7hqSDxEmgg3MJuAQcRjMJ5WgrPcttDPeulAQzf02VwhUPIbaa4wVtHUX9Xm0jOqnUvdvAiksYNN1OWWlEkhPM5/LgQI0Sn3ZTkMcxGnW6BydyvOnanM0ZcAKptFKJqPc5NB5g8hyw4UaouGBkL55SNAT4h0OW/m8Q=
Date: Thu, 22 Apr 2021 13:37:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YIFgCoyQaZefKZvi@Air-de-Roger>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <391b56d0-bb4d-8d3c-231c-e2e3ad7e2f42@suse.com>
 <YIFFBEhPYSYQhycf@Air-de-Roger>
 <c692e77f-1a9a-ea1d-e029-2a8f62ee0e35@suse.com>
 <YIFRQu/CLEId2uMi@Air-de-Roger>
 <d877502d-9c18-6ff3-6e01-ee997c9f196a@suse.com>
 <YIFWUnQ6d4Pk7nf4@Air-de-Roger>
 <320d9aca-1f72-f357-d303-487a67f39655@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <320d9aca-1f72-f357-d303-487a67f39655@suse.com>
X-ClientProxiedBy: PR0P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b802c10-a78f-4716-cb7d-08d905830f33
X-MS-TrafficTypeDiagnostic: DM5PR03MB3289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB328983DB91B250193359C8608F469@DM5PR03MB3289.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09uyR/CkFgF0qUihUwXqeaIyRZXjXUD2dU1SafRM+bsqIYEFJQmLa4AKtVq3WIQEMIEt9RywlY45qrjwTc0o5xjoUupkFRIPXm2USkuUKK6LLEMZNVxBNL877c/x13MV51unk/NCj7LaDjo5UJXTt2vW5EiGOtGd0tIIRgDgE9v59K4YH1a9OL2AlOxUKN17pjNJRrOTvZRPTLYVYjKxS1q4EA5n42d4KfaVNKi5x0rsGyW+1ogE9I3BhXwEcpNxrFV1euN8iy3urLOglrIKswLh9EXi5TUqJ0tts6Qvx10ANN0w5BURFOachXu/NN66bYbDYIrTZSdGkUICFLMkJ6VeikyUoN0ItCTW1qHXbivq0Sd0eyN5fuiBVOfxsTzeSFKN6Xwc3MH1mez/r1/1fZVV5IS7fCqSnXsPhdPW240GZpALg2uXWZE7ks8thGc/6G/DGHDhndYWti/mbnE8qYR3nNLD/Ck1U2U3KOZ5LugYIa12QgV/lGOPlZyUAmpo2lCo2c6143+J56ewNM6fYLuIooo2ClmrcJxE2dchLvXhf0cBYyXA4apNAygxXS3Jg6z9YBgy5xhO7FZJzmrl59oS70zR4TO8lBVr2VkENQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(38100700002)(4326008)(478600001)(186003)(6666004)(16526019)(316002)(86362001)(9686003)(83380400001)(33716001)(5660300002)(66556008)(66946007)(8676002)(956004)(53546011)(26005)(6486002)(85182001)(8936002)(2906002)(54906003)(6916009)(6496006)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3Nsako0ZWY0ZytDdlRQRlV0Q3dBcGRDZnhPSkloOS9GbE1OYkdOais2YzYy?=
 =?utf-8?B?S3RaUy9sRk5yZmQxTDlLQmdSenBVVzNJYjlYZlNiZXc4Sm1KVHg1ZzZsQ09O?=
 =?utf-8?B?MWdvcE54WFJoYWtqME5jTFkrSlNacmFpVVZ6ZnVuc1ZXc1ZJWW15NUFzaEZp?=
 =?utf-8?B?Y0hCMzlCaU9wdnQrWkJMRzlhNFZsRkVxczNhckJMTVZhTXZzaVdHQjlXWHl5?=
 =?utf-8?B?NWUvamw5VmJzLzYyVkF3TG1UbWE5ZldDdVU1M3F3bzJZZXEvZWwrK2N5SzJi?=
 =?utf-8?B?TEdlQ1lKdFpUWHcxMWxDU0hFWlFXN1IxWTZBYkFpMDJ3Uk9FdDRYUFhHN3Va?=
 =?utf-8?B?aUc2d2h5WGhlK0VBQkc2bEp5c01weGxkVXMrWExObExnTUlzd1JmbU5tbTMz?=
 =?utf-8?B?QkVReWRiWlRCWmlxTVVrcW5nL29DQnFMa3ZDMXNJc1BPM3RTSGJLSitsemRp?=
 =?utf-8?B?QSt0elNHTmU3T3RuSlVaOFpVeStLVk03MmFGZElmZnl5SW1DUXJtanFUQXhJ?=
 =?utf-8?B?NnYrSTQrbG9ZVGFuWXpLaU83dVJKSjNWQVZDZnpFcmFqMUUyRmtJUmVQdUVX?=
 =?utf-8?B?OFlXVElPY3k3S2JXSEJBYlJXNXVISDlkNXh5a3JyM3BVRWtDdjZXVUNobTh2?=
 =?utf-8?B?bWVoNUY4RThmUGF1azhJMmdPeEZsRTg4Q1oxbFNINHRRNE14cEdBcng0K3V2?=
 =?utf-8?B?aDBPSUNzcGpyTlQ4dmdKUjBraTlnaWtBOFBDdWJwRTY3ZS9mRit3UFZqNmZq?=
 =?utf-8?B?d2xUNWIveUxjRW01WTVNdU92NVNreDI4SU9qbzVKTUl4RUZDeVYwYzl6SnhZ?=
 =?utf-8?B?bDRuZTBBY1U4bis3VGR0bW9TOE1pUTg0SDI0NXNxMWVZOHNIdFpVUEFQbEli?=
 =?utf-8?B?UjJQYXQ0czI0ZjNtREJuZEJYeTFaNkUvaFNkQ3NYVlZrL0lKa0hMNE5zNHo3?=
 =?utf-8?B?MEh6Z1dMK1g2N1pwZk5tcy95Vk5RQzUwV0hTb0FFZWFZNkpwWFVOVm1uSHdS?=
 =?utf-8?B?eU5ydDFTRTNKblA2UVQ0eit5eDdiZEVnTmpScnlIN3VSN3ZlTVdRMGw3bm9T?=
 =?utf-8?B?c2xGQ29HNE5tTUpua09EZ2hHckxhQm5MNjJndHdLQVR2eStvWUdXUHZqd2sv?=
 =?utf-8?B?OWV2ODRFaE9uaVVwSS96VEVxcXZNVDM0MW12bnBIbG8ySGR2VHhJbWVKVVNR?=
 =?utf-8?B?QUo5bklnYmVXdFJsSkUwZFkzdmNNNEJjM0NMbWhlR0lBTHErQ29RaU9GS25Z?=
 =?utf-8?B?M3hTTHVQOHVQTW9udWw1NVd4SUZsM1c4Z0VKb0xLSnh4bW1MdE44dWV2bGZn?=
 =?utf-8?B?YmE3aWwyRnZZSG1tdi9KcE8wakkwYkpJallQSXpUa0J1ZTFLOVZBczV4ajFH?=
 =?utf-8?B?RUdtMHVzRzcyUUU1ZXF6NmVQOFVMZDhOS3ZyaWVZZ2VNYXpWWjkySzZsNElu?=
 =?utf-8?B?RllUbE14ZnA1Uzkwd1FkYVdvUkZyNVUvZ1c4b0YvYUVGN1d1aDBFY3BmbG9U?=
 =?utf-8?B?cVdhZ2cyQnVtdzF4SGkxV2tYajZSbTNsWVl0b3VBVUhmM1Ara2tDNy9mL1E2?=
 =?utf-8?B?dURzTkFMYzMyL0l0UjJGVnY4WUc5SVF6M1RBOGN6YkNtQWRPS1o3SUYwZzNw?=
 =?utf-8?B?eDMxSEZGVktybXFjNEVFSk9aZTJ0UkVkVHpBckZocUZCbnUwSkxGVkFQd0xw?=
 =?utf-8?B?VHhiT1lRYzYyK1JNN0lQT3lvdGZiYmNFYUIvMkppeVR5ZTRkOEVSRDBFSXFk?=
 =?utf-8?Q?zAJmebLtpHC4Z+d1LcuSyZEP37IZmvFiPbgKalk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b802c10-a78f-4716-cb7d-08d905830f33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 11:37:50.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wp9lZIGKRaKa6I6BQJNNerDXUbvWDzJpXd9dpTfdee6GAhg5SGys9NNDEFchb3lQLEE7bqqhuc21AtgszOo0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3289
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 01:05:23PM +0200, Jan Beulich wrote:
> On 22.04.2021 12:56, Roger Pau Monné wrote:
> > On Thu, Apr 22, 2021 at 12:48:36PM +0200, Jan Beulich wrote:
> >> On 22.04.2021 12:34, Roger Pau Monné wrote:
> >>> On Thu, Apr 22, 2021 at 11:58:45AM +0200, Jan Beulich wrote:
> >>>> On 22.04.2021 11:42, Roger Pau Monné wrote:
> >>>>> On Wed, Apr 14, 2021 at 03:49:02PM +0200, Jan Beulich wrote:
> >>>>>> On 13.04.2021 16:01, Roger Pau Monne wrote:
> >>>>>>> @@ -944,3 +945,130 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
> >>>>>>>  
> >>>>>>>      return false;
> >>>>>>>  }
> >>>>>>> +
> >>>>>>> +static uint64_t level_msr(unsigned int index, uint64_t val1, uint64_t val2)
> >>>>>>> +{
> >>>>>>> +    uint64_t val = val1 & val2;;
> >>>>>>
> >>>>>> For arbitrary MSRs this isn't going to do any good. If only very
> >>>>>> specific MSRs are assumed to make it here, I think this wants
> >>>>>> commenting on.
> >>>>>
> >>>>> I've added: "MSRs passed to level_msr are expected to be bitmaps of
> >>>>> features"
> >>>>
> >>>> How does such a comment help? I.e. how does the caller tell which MSRs
> >>>> to pass here and which to deal with anyother way?
> >>>
> >>> All MSRs should be passed to level_msr, but it's handling logic would
> >>> need to be expanded to support MSRs that are not feature bitmaps.
> >>>
> >>> It might be best to restore the previous switch and handle each MSR
> >>> specifically?
> >>
> >> I think so, yes. We need to be very careful with what a possible
> >> default case does there, though.
> > 
> > Maybe it would be better to handle level_msr in a way similar to
> > level_leaf: return true/false to notice whether the MSR should be
> > added to the resulting compatible policy?
> > 
> > And then make the default case in level_msr just return false in order
> > to prevent adding MSRs not properly leveled to the policy?
> 
> I'm afraid I'm not clear about the implications. What again is the
> (planned?) final effect of an MSR not getting added there?

Adding the MSR with a 0 value will zero out any previous value on the
'out' policy, while not adding it would leave the previous value
there given the current code in xc_cpu_policy_calc_compatible added by
this patch.

I would expect callers of xc_cpu_policy_calc_compatible to pass a
zeroed 'out' policy, so I think the end result should be the same.

Maybe I should also clear 'out' in xc_cpu_policy_calc_compatible, at
which point both options will get the same exact result.

Thanks, Roger.

