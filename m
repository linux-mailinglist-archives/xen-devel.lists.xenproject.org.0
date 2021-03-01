Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7524B328982
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 19:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91920.173513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmrf-0006Cg-17; Mon, 01 Mar 2021 18:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91920.173513; Mon, 01 Mar 2021 18:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmre-0006CG-U5; Mon, 01 Mar 2021 18:01:50 +0000
Received: by outflank-mailman (input) for mailman id 91920;
 Mon, 01 Mar 2021 18:01:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGmre-0006CA-Aj
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 18:01:50 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 132ef57f-1241-4eaa-8947-1957ea5d71ac;
 Mon, 01 Mar 2021 18:01:49 +0000 (UTC)
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
X-Inumbo-ID: 132ef57f-1241-4eaa-8947-1957ea5d71ac
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614621709;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q8RL6R1NEP2U23lTP1xr3Ot5HUu/hkXssXVJ80doq4g=;
  b=asOZdJsrfDkEGVTnQqfDJvwVtS0FTEerb0rehEo86JCBWG8laVW/GwKW
   fBNd6XZwU3waU7YDR8RXyrpFtyEpYDpU+RTSVC2OTRM9MCPC9krWgwb8H
   wtwyxkV5siBBR9l5Us2XFX52w6/RBup9a/UAGiO8zqpOf6QJcc2KPrn8q
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5kID+Bg7W6SJhrtta6/MtVYkivadpNyPChXuTN9Xq4zyKd8JIY5gQDLbyVl6MSt8xDeqc7woUU
 g4uxriYXHp/NhrG9i+Xt6+ahUi+2Xy21XtAUm/2+o2fhLyoc0P/kFMxpB/FKz0LNWRNnHL+Dth
 i4Cxsy//ROC/m+ADj9GuwEnsCpyZNOdKzVBPEP0Ab4+OlXViyONFMOVyBIO5csRCB3PFsWWkfe
 537Q7vS7EUIO+N7Bt4Y5DAhslkkpQQtMBdw1ykqPfqjBvYP5zJVLhhgJ2F0Deq2yWx/NeXCZee
 2Rw=
X-SBRS: 5.2
X-MesageID: 38279631
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38279631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwZ3taDABVuR5k4xRQKZIgxXGGJFUuA9UpshhCprbeHUxyU8/l5l6sD9TLqeCmWGfF2d362yPd5JfK/mzIuuziXUw+kMRTwWe8PQYH01Zb9Z0V+n9vBd/vXgWIoe1iv5XRll+QiaQp9AY76tkmnFhoHUWMIiTKOUXLb0UQFvP15gcaW1Mfyivl/umQfq3pR2hqdKyH1nkJ5U9zpoaVo9HFAswAWVkO/hwBuoCuC6CzV4lUtjJR5lffd/Afme0HUbRa3oiRzgwXtwBCm+ZqgORukVNa6ib5gBbx4NSVsqSDfhotTGWUTgktjExTP8X5uQ52j041F5+FchnI9YGth68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg09GtKNi5LILMUgCDejGPKjpl4a1uVUaqPshwqYcek=;
 b=OYP5BHtewHpnbLWgLCrq6iCeLOXaBYdNP2VdD2TN0NYh1J1Cc9ClCHQhSIR0Wt9ZpjhmD7NpM4fFBYpkzlRVyNLWAW+dmN8L177CiywtuVYVmwDoNndKTRgPby+AnEXWR0xN8sXgV+TeEXmu9/6LXweVu1Q2xsUn+3JaiWafi6EFQwqlrchMJSMnQftcNknDtvslXIJ5tDcMM+ognH8DeqqArAc1xz/GEwg3xFJY6OEkiXX48FEcYDGBrIXVZOMV8b4pEijLc1WHdm1vewFHbT5K6h9uMRUMUoMEqxnp3tKPiz8zYGZzFHw9J33VBGJ7d6wiOWgAmTI00OSZf5rw6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg09GtKNi5LILMUgCDejGPKjpl4a1uVUaqPshwqYcek=;
 b=tjnFmQtBhir12QDvfVV7R5Q25NJWTb6daITSLpi+KLCgv0bJQB/8RS13W/KkpwaWW7emRM2s3610zGhNCgRr+Gu98rqqIuGvFHW43xTgkZok1/XqojvIMLrbsqgKiwvYDUC28kef2iWXmJfxYq4ZdhIVtQ3o+ABmNuIj6bFmSwM=
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Ian Jackson <iwj@xenproject.org>
References: <20210301095806.68518-1-roger.pau@citrix.com>
 <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
Message-ID: <27ec9db0-69bc-df9a-8511-109f57972046@citrix.com>
Date: Mon, 1 Mar 2021 18:01:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d42b1311-8278-49b7-ff9b-08d8dcdc129d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5169D673A4461EC131C87782BA9A9@BY5PR03MB5169.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FKwiXFG34OcMr6SAmoaSLuUpr+AMukMRJvCqrGmTtQACW6JVUplJYaCXwejKCZm7QffacCkP4FFPf+8agT/YlwG24PrBhK7VyG/eWNCaDieUnBc0LPXGbybowhh7g0f5ITM7s1T8Os3UPrNLJvJRCcvSomrKvUslyuYZ8LjJCOVYaMLkhhmfjyEhYkLA7b+WYrhditk4EwQghAgHCHzWTQtaZalwQvzz2HdjTNkU1mptQjSb+3vKPJxI5CJtthBT8Js9SuPQKi5IwmrTtO5Fmad4ou7YnLxPyalHsRxJPuLXejdHf7NY51mJhxkk9d7I6kcIOv9CsB/bosntH78U78bOlzdAOXq4wJsSM45EiyuNJ91YI4n29tjM/e99k4qXBS3DKlVp6VlbDYQq9k6iGu3DXsKn82BsYEGjXXJH4ZE8oTfiDKkgfn7mTkgrJ0kFW+XFYHTTDpajsFWfgkP2orjPhqn/N+0LO+MINXHhXNy7Y37FbL6OQiWNhXVSF6CT5zp0K2dUsA03wfl1sPneols4gS7FCtQg6sYkNzbVRJrWwUL65myLCr7siGZlqfkrrK/nrCDs302Dxp1qf7S0s7gMBS7DdZxsQuFosMF3zD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(31686004)(83380400001)(4326008)(66946007)(66556008)(86362001)(31696002)(66476007)(6486002)(36756003)(5660300002)(8936002)(16526019)(2616005)(16576012)(186003)(2906002)(478600001)(53546011)(316002)(4744005)(26005)(54906003)(6666004)(956004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K2tCV0R0VG1pNHNqZm9POHFHQm1uaSt6Q09tc3lDTTZOcTB3aGtpaWJLWk41?=
 =?utf-8?B?RFRyd0dMWGxJcWJaa28rQVZSZmN3bTVLckV0SnZBZU9wWGZ5UTd6TDNhK1Vv?=
 =?utf-8?B?YkpHWnFrT25yc2FjdWdncjNuSVB2VXBLVktERERNcUFiZWFEYjRVRVlGUVRD?=
 =?utf-8?B?cHNqNW4rNjNSNjZmSk1aRGRIbENKc2RwZGZ0RkRKVCtpbjcyM1VqeXZUaVRr?=
 =?utf-8?B?QVgrSGIwRUt3enZjSmNUcUdUWWtjUWRhSENOcmdRTE53SVRrV2pTTHJuZ3gx?=
 =?utf-8?B?Ykw1bUxFQWNoL0hLbVZVNU5zMWJrOG1uTmxieGxjaFZJMzNRMVJhbEZoMUQr?=
 =?utf-8?B?WFZPdVhOQ3ZrdUVFSmJVMTlxQ3MwdFNscmp0eitha1dsOWxOdmprZGU5b25S?=
 =?utf-8?B?dlBwRTNTaU5sUXFCWlJzM1EyS2R0UUJLR3JpVHlJdzdhYU9NOWFNZjRJekwv?=
 =?utf-8?B?SElmejQvR1BEcVRTTHBYa1plQWR3empveGxGcW1qUTNIcmZZclE2bHhnRi9m?=
 =?utf-8?B?WkZ4V2I0VjJqWkw1QmZNZmp1S3lCQzJhSG9xdnNlVkN1bDR5RitoaDlReFFp?=
 =?utf-8?B?Vk04aE50d0d5dnZCWFZWbWNEamYyUEdHbUJwbnRkWWZTRXF2NStwTjlBd0lK?=
 =?utf-8?B?Z3J6cXFUWTE3UUhDWTdxeWVUYVhJbytTMnpzWmFxclpKajhwd1RuL3ZrQ2xu?=
 =?utf-8?B?Yk9icXY5Q0xQQTZqWjdPRklRTGJPMjJZTkpQWXRKV3Rkd0hYQjdxOVQ4MXlF?=
 =?utf-8?B?SnAyOWRwcTVHMklhRUg3UHp3cllpVzZCR2ZaTmNFQld6YTRQT3E5NkxFbVNz?=
 =?utf-8?B?bEJLTm5wQ2xkYm5WVGZ2Qjd4d2c5YnNCQ0NCc1JjbVBaKzBMakVVL0xubVJE?=
 =?utf-8?B?Si9GZ21LSFdhMmt1YnBQVjJ2MkFPZldMRkVzVXVCc3JOTWhWMkhJQk5TNndU?=
 =?utf-8?B?OTFvMnUyeSswSlM3cnNOSldiOG1hSDNIOExRTHVkVTVObHlYeUx4Y2tCRDlt?=
 =?utf-8?B?SUt2OTB1TFJURVdiRzhEanZ6NXZGbURhaDRjNE5qNnhQRkRuSnlyaVZOTkd2?=
 =?utf-8?B?amp1WHhvRTRoYmt1M3JmclFLOEUxS1k5MVQzdms3QWtyWWpBcEpYUXhGdk5h?=
 =?utf-8?B?MklHNlRnOW41Ny9id3JLUUlyVmROdnlMQ2hoRWJTcTlGSkFkVXFPYUtBaG9j?=
 =?utf-8?B?S2JaVmNTNWVraU56biswaFBUUEI5RXRwV3BHTFRYa09ucXRhR1Z6eGttcTJx?=
 =?utf-8?B?TG1hNjB0b0ZpYXdCbTZFTnErYkJjblgvS3B3YXEvdWoxbUwySEwwZm0rZVdY?=
 =?utf-8?B?d3ZKdlI1akxWRXZndGNBUCtmdENzRkN4SzZ1YWdVSmROa3VNc1hTUGRTQ3NE?=
 =?utf-8?B?V3JvRitKOFN4MEM1eFV5RnlTT3liZzg1ZlE5T20rQm41M3drUzBJbllOd3ls?=
 =?utf-8?B?QTBIZTVhR0ZwMmRYdENPYXFSMjFkR09aQTZ4NFRidnVsYnNIcTdKdnpQTDdN?=
 =?utf-8?B?OTNMT1I3dnQyRFNPOGl5YklNMXlzVWprS3NRRXl0ckQ2Rk9jT282SndUYVNP?=
 =?utf-8?B?ZU1aeWcrVUhudUh2K0VXbFVwYkhRM0Q5T1ArQjg4SUVobm1iV01IaUpvc2Zx?=
 =?utf-8?B?OU5YSG1SYXhzV1RMYmJqd3NuZDdHNjBGb2g4YkEwSTloQXV3QkpEMWZ1MzIz?=
 =?utf-8?B?WXN0aTN3VDNySjNsVUZMb0IzZEttWlkzYjhldFRWTjVrblZPdk5hQ2wwSnkz?=
 =?utf-8?Q?12r7WAT9gFnxPuyjYadIl/3QsWcHdHdHUn2b3U6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d42b1311-8278-49b7-ff9b-08d8dcdc129d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 18:01:43.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIUAfFUGAWHmUhuO7hUHXaZ98yBDvQDSMVIpqmjwiDlMPYA6q21b66AS1vDtqUdHxpR/K259j0Rq/hfFTT6tYTw2gdT4M4ADZHdUi2/oF+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5169
X-OriginatorOrg: citrix.com

On 01/03/2021 17:59, Andrew Cooper wrote:
> On 01/03/2021 09:58, Roger Pau Monne wrote:
>> clang++ relies on the C++ headers installed by g++, or else a clang
>> build will hit the following error:
>>
>> <built-in>:3:10: fatal error: 'cstring' file not found
>> #include "cstring"
>>          ^~~~~~~~~
>> 1 error generated.
>> make[10]: *** [Makefile:120: headers++.chk] Error 1
>>
>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Cc: Ian Jackson <iwj@xenproject.org>
>> No real risk here from a release PoV, it's just pulling a package
>> required for the Alpine clang build. Worse that cold happen is that
>> the Alpine clang build broke, but it's already broken.
> Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.

Or (thinking about it), we've got a build system bug using g++ when it
should be using clang++.

How does this check work (without g++) on a non-clang build?

~Andrew

