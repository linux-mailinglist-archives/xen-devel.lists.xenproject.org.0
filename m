Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B572E7ECE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 09:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60446.106090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kutkU-0004y5-68; Thu, 31 Dec 2020 08:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60446.106090; Thu, 31 Dec 2020 08:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kutkU-0004xg-2n; Thu, 31 Dec 2020 08:55:58 +0000
Received: by outflank-mailman (input) for mailman id 60446;
 Thu, 31 Dec 2020 08:55:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIAU=GD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kutkS-0004xb-If
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 08:55:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d0e74a9-22de-4f30-82d9-45ecb4b1ac94;
 Thu, 31 Dec 2020 08:55:55 +0000 (UTC)
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
X-Inumbo-ID: 9d0e74a9-22de-4f30-82d9-45ecb4b1ac94
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609404955;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xhLgeIVcD+GN7j0M7BgfUFKaMTqrZa+pW7RhS4eDTwc=;
  b=PBg72bP07unixMRqvJrHN7XIo7r5EzvtdDZucxFicAX9w0cUy0PNH65l
   dguPWN2KAt28t7esQ5BapeK/N+wM/4y9Zt7jJJEGKclN0KpNJs3W6EX5p
   Sb6odLX4TriSIr4Qp6xZV+R9BXL6f169b4BTZ6GrIwTLbA5AtOZGYQK+N
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qowIPzAUlAFrcXSxV8cDoFcU7KZNnxap9yJx41ler5EQL9tf5Lk7Pll7bRKYFCrYCakQ9alf9X
 d5D7753YIDoTQbVCPjPxlyJlKhMEFifg5rFaK0MjWzBAH1bxIMGzcP0lGXV4WB9Dj5s6+20PiZ
 ukNPc3pmJZI3q3vyXoWL0jS4epAIksOi0jXaOmbapSeRSW5d0k6GELlhw77PiIGO1oEIJB7QDo
 +9Aq7nMXroPtc8Ha7y/VrYMc2QF/9VU7a7fSQAUSQzoSDw8sWwyAMYo1zBlIaTSWWW3SoooICx
 +IM=
X-SBRS: 5.2
X-MesageID: 34560215
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,463,1599537600"; 
   d="scan'208";a="34560215"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dl5f38yyLg8T6Wt8JyFM4LRQrl/RXVL9nqs5Ky9S0VIOiUC1WsaKQ1+FbzGqzJK1cL5mRHfGnWkzWSTidB3Eqg8g1Zviae1FXPJF2bgJg7pH9mxhATIMKVvpOS1mYcKpG3Lg3AP4wrxWHfvnf4u8oObGaz8A2SbamKc+yUwDzic2rt9/Ong6JTVA2hfFcVXCojVwdEpJED5CaS/aQOf2hlX1BHR4piI/FY6oE9/wALBbmX1cZkpMktM10kaI/Cs/clUeC3Eg1vKHuBhiEFc4Vk4G30fbDgj/9jjIbLB9rF+bngOwtFCJSMKQYRjPACsmap+JMkSc9up5ovTYNaxNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjLV/lVtDp/RXbWyIND1cVbX3sYXc0cfPL24c74fCjc=;
 b=djSq4l6H43RK6kC9jHnOJ0ey5CKvna/N2jakC4PHLVYURv66ZTt5RBuneFFFtKXqCSssyBAdaM3/qIUYED3/4EooMrrfIXIsNad+eft9v5wmONxIqQ6QpCEH4otyRLc9HioMB6XCUFpLRmVMwLyFQMam5aCFBOnMTyJZ3DKSr/Ef3JQdVoWrmF442VsqLmwC7Ia/7FZYxbo/v34Zx4yxHxfF5RyoC/rA2FJNUJAmDyppKV4V49QGkUvqM60d6uxLkd+yZJXjAuAUrMoV9VV6+dvyD5h/oqZN0Gd1ZZehxfEtw4SdoDpKsszomyoBR1xifXwR7sE2cmjV/vIBFHEdyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjLV/lVtDp/RXbWyIND1cVbX3sYXc0cfPL24c74fCjc=;
 b=X72FbqHv5o5wjOKK5zjE86+3+K0aCVJCwNeFGkvANI8+DK8fcxpw3HiGNy+VJZ5Sf0KdzDoaUvg82b9KXJ67CSsiJC3KKHwrZ9kAfoYwO2d8+zwSB1d490un1LRGglxpF3r7yPcbWA0TCGaI7JM1Mlt1WvV4ugvLTRfTL0A8TVQ=
Date: Thu, 31 Dec 2020 09:55:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hpet: Fix return value of hpet_setup()
Message-ID: <20201231085543.jwggru4pqt75372n@Air-de-Roger>
References: <20201230160208.18877-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201230160208.18877-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75908442-ae08-4e82-ecea-08d8ad69def7
X-MS-TrafficTypeDiagnostic: DM6PR03MB3737:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37375511E07B871E8D5919418FD60@DM6PR03MB3737.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dpoMWujtvEFEEeSTsYqcETnHAGd5uTHvG+dyfX57XltTQKcn8yMuSG+/1WxwwlppsR/+MctWIdt6P09bF7Xh+keuEmVsMpRw/moWghhjSNGWJIinK9e96f4/Iv864vm/5mXm/SVwpP3uknWQSnN0hVgK4JMGzZw1YTfHyjpkHpBdW2dNAUuFBmU/5GB4zVUEjpYyjvbrltgQHlUOKYiRlldCZnx6KbnnxhinZkcfGRxJOKXZoM2ZTPsgsc6dsA8JoLI6kW+u1ukLvMIzksNqF1SQQQGPuAoTifgjEYzMs9gJuYJdzZtnN6Up6f6hOfw4l+duR4A5yIKN9Gz3z5qqpAgO+lak631ymPZMRyMgGIjQyklLjVGnOaLj3SUehsM/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(136003)(346002)(376002)(396003)(6636002)(4326008)(33716001)(6486002)(6862004)(8936002)(8676002)(9686003)(85182001)(6496006)(956004)(4744005)(86362001)(1076003)(66946007)(66476007)(16526019)(478600001)(6666004)(186003)(2906002)(26005)(66556008)(5660300002)(316002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVlXUjRnUDI4RGFPT0lCUmxFQW01K3p4a1BweC9CRHJ6QnkvT0ZYRkROUXoz?=
 =?utf-8?B?SXY4N01ESysyaWVJVXNSYldzWWc3UWpMcTRUUWNHa0M3bnNVc3FyVnhodHE3?=
 =?utf-8?B?SjFWQmU0a1J5U0hnditHcTV2VUNHblNpM2xiVDU1Wng4NkZ6ZS9PSWlkK0pI?=
 =?utf-8?B?cXRudVRZNVoxOXJGVEdiZ3dBemVTTWxBbG1NanUwZ2JEczJONzdRbEVFdGhS?=
 =?utf-8?B?U0xSdjBvOVFWKzY0eWFZSnlIeTRJeG9vSEx4c0J4c1ZsTWJsYThHU3htaHR5?=
 =?utf-8?B?VDJObHhiUGZJV0lzSWxSNnVXU3ZVdGZNTFZkVTEzeGE4ZXJWNE4yYlRCaU8z?=
 =?utf-8?B?WXVGazhtZ3Q3VkhaMGtzQ2FGTVF4dGJzRTZOQWhNV3JvM2pSNW14T2dob3NZ?=
 =?utf-8?B?bnc3NmhmNWJzcWFpUzV1ekJIblgxR1hNWkVTRTdMdktTdEs5bDhqZTJsb0lh?=
 =?utf-8?B?ZTFEU2QvYThFa2dQOC9KYVgwbi96V2Y2aWRydUZvN2duRDM0UWxYVWhhMGVV?=
 =?utf-8?B?MERsMVNtRElkakhvMXlQeEVLYmpGL3lxL0IvOHBCa2o0c1lkWGFYSzYvVXU1?=
 =?utf-8?B?cFlabUczQkJZWFVSYjYyL2xFS1d2SDIxSmIxRjM3djNiT3FSbERlOWI5T1Fn?=
 =?utf-8?B?UHFtYzBZQmw5ZWFZS3BtVllKRGprQnZXRjNaVHhYeWtpTWhDZmtHNWJLeU01?=
 =?utf-8?B?eGlCaWhWWmJPVWFmOE56WExoeXV1dzhhaS9VUDgvajF4Tkx3WkJrZ21pMmpm?=
 =?utf-8?B?TUxMVFdieUJPMXozenhxdVBUK3cxYjkzZUJKTWFHbkZoU0pFdXNZbzNITW82?=
 =?utf-8?B?WGZpM3h4MkpWa1EvUWRxY0RMemd0M3pSTWZFSDNSL3pKMm5NU09CbDVkcndv?=
 =?utf-8?B?MUtVbzRsTVVvbVlSWGdWeVNqNVRXd1MzZzlyUTdNR3hOSm1rNVRzWThvZDJn?=
 =?utf-8?B?SVRsR1Z1NWJtM01KRlRxZVRYY2dYQWZZQWtmY1RPaW51cXg3L0VUTEFuQkty?=
 =?utf-8?B?V0xiNVdPL29qcDVGK08zMk96Y2RNbjdZWUljOWZsRURUUzRDVEU5cktTbEpG?=
 =?utf-8?B?TmphY1ppbUhzRHAzVjJaMDRNalpHWnlTSEd1N2wxL3REZzdmZC9LdWo5cXdY?=
 =?utf-8?B?UHFiQ0ZFbUR5NnM5MkpKMW9MaTlhRU9pZnJhU0xqZ2RpVmhLamZRUDVTc1dQ?=
 =?utf-8?B?anpkZyttejNQcWluZE1MMUZvTmFjS2VsTmdwNEoycGJaR2o3aEVQQjdQUEw2?=
 =?utf-8?B?c0ZHS0ErbmRSS0JuTVF2d2xpbVdKWDhia3J6K2FyRks5dFpXZjRCa29pd3J5?=
 =?utf-8?Q?ieeA5LAnJB4bXRCAcxUcwUUuJQwG5uYkai?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 08:55:49.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 75908442-ae08-4e82-ecea-08d8ad69def7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3RAk2zbQJgLgL5VYASnBIHYxeJZpR0ZjmFLU6PctQtHXOr8cplMWJUE7hGGNp2IsJbz9689me5i2s6if1QETQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3737
X-OriginatorOrg: citrix.com

On Wed, Dec 30, 2020 at 04:02:08PM +0000, Andrew Cooper wrote:
> hpet_setup() is idempotent if the rate has already been calculated, and
> returns the cached value.  However, this only works correctly when the return
> statements are identical.
> 
> Use a sensibly named local variable, rather than a dead one with a bad name.
> 
> Fixes: a60bb68219 ("x86/time: reduce rounding errors in calculations")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

