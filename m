Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2283876EF
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 12:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129062.242275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixIk-0003F2-9V; Tue, 18 May 2021 10:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129062.242275; Tue, 18 May 2021 10:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixIk-0003CB-6Q; Tue, 18 May 2021 10:50:14 +0000
Received: by outflank-mailman (input) for mailman id 129062;
 Tue, 18 May 2021 10:50:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lixIi-0003C5-Jc
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:50:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a79f1267-04be-4a7f-9499-5bc1f1706bed;
 Tue, 18 May 2021 10:50:11 +0000 (UTC)
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
X-Inumbo-ID: a79f1267-04be-4a7f-9499-5bc1f1706bed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621335011;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=trKKf++AzOW/eOKJ07UkttS0C4U3twhhwK2n6basGfY=;
  b=Gzveldvsk7IuZTbTd2fKx5rCNK0nE3bI6aSNMFJYZ3UyWBxVGtvDzsHH
   JYuMb4DD5ZNYuOjalC9wy8LeuPvDO6TC0i9iarxXyUHj5PBWuu39N+GFG
   xNHQ72/QtySoJizBRma0je3JffcKNd1FGrQ4QZ9kGQEZr51ZU6mDZ6Ira
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Cl4RLLTtjbvYQwRyF1aqSfaIRDAHBKdxtlGin+2jzRydDkRusiQWkz9IVX8MW2rvSqbmJuhoNR
 gAXjlTfX+MLMj9E0wtQ4m7nvsBdRnE160k8rNRRejYgH812o86ZPNed76tJO7/ZsHn/4pgrF/5
 8zgp2C1nDS3ckDhmNEz8CdDDd8LMnt9OarYEZQHHhfdlEfsOJZNITLnF03i4y+Kfq/cNpscP77
 NwkVX43/JidDm69M21gKPcjec3/AdlwCDpC7n4oJV1tuD8iU0L0ssnvOSp5N/rZtv5NtSdR5lK
 v4I=
X-SBRS: 5.1
X-MesageID: 43809368
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JssPva7EjhXk4QuXmAPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.82,309,1613451600"; 
   d="scan'208";a="43809368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmtPLdVBKFSiE03gZI5XsELw+SwhBuzkymtIUuT1j0+TS9a+7YSqpoPPfKYjA0xTTzloPtQdI3TNXjBdrNZ0UYkJ9q46sPVXII5vIuzUYaU9iJnqLEXFNrjwucxlK4gK+x7Ksuvv1uvvoU7XNwIZ6VKXlmJUNc1KgP83YABDg9cP/sBYg6foxErKTNOe0JHuqb14yC62FaOYGPYLaEEeeHKStGvCPkatU/nGfwLQ6ddOhFbDpSVgWTrXUegu1rNXIVeS6M6vFnPkjPGXO8V6BL3tfqi1EcxDwIPtTALgWmTtjT/wcGU00k+iPPpF5QBkuJRgSlxA1L41JwVLcQ7V9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUn5XI88xd1B744IQxuFJuWJsdR5tDB/QShlTfvEat8=;
 b=OvZHlc+NF2mAhcLlA74Jwb33A3sC5mQHobk3vIbzvB5682/mYqbzWO21x905CPXZhWLXOjYqVaqg2jdibM6K4q36KGvJDdOgZslA7cHSoXxLIYfPf5yPiQk04DXrvA18XRExDZMoRgSl6hVJ7w+8ZAYrBFgI+vlbJ0WukGivU8UfigvLhK3wfXnAGECjw0ls/BrAD5KJreawe3mr6bFdZP68yBUz60fbEgxBBnZ+2bZu7r/wDHxkriHK8hoHjVf8kt7Y3lmSpveYyM3LpKdGSdmGyOB12UipO8AiH13LtG7VjZqXUWEjTg0HvuyWHpfdcq3hDaRxijH/ZHBN/EdexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUn5XI88xd1B744IQxuFJuWJsdR5tDB/QShlTfvEat8=;
 b=kMOiTMSC9+gqaRIXSQVs7dqvpTL52Q2eg2Gx7xA1s/EbgPY08BSmOSvM5K/4fgYsDPQy7SNk1p5VKH/eFrsgTejkkgaebpbeWXrhtWXMC7dNiIEa11yH6YFk+ItoyF2zTBGaRIwxvHvlKuPI03DrUFckKngo5bPEUhyclNh3BOg=
Date: Tue, 18 May 2021 12:50:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Ian
 Jackson" <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 03/10] libx86: introduce helper to fetch msr entry
Message-ID: <YKOb2hn9XHPGhM5g@Air-de-Roger>
References: <20210507110422.24608-1-roger.pau@citrix.com>
 <20210507110422.24608-4-roger.pau@citrix.com>
 <035cc783-6083-f141-d4a3-db7a6adc36f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <035cc783-6083-f141-d4a3-db7a6adc36f5@suse.com>
X-ClientProxiedBy: MR2P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c70f8b8e-5702-4d52-2a5f-08d919eab38d
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB546311B51F216A39C5843D438F2C9@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAE+skgH8NolIoHm7B9yRbZMGhiglFAbVACk37G0g+f+TjzswTFr1wk1IunVZrEjA9iCpPdtCBSme8r1DdAAivi+Mzn496AU1z7vq6ukMkuV2LjibCkWo3NIRtW4CiBzs6RzMwz/hRt+BwlPpZLrluso/lDHZJtU0ij4QEgE5VZuoOYKdwOeErCrHsSxGTZBX1ajoHiuZQ/Bu3mKLdbchQfQziJBuje1pZ5LQTVvONIzJ61TM2bgbv5po9Gaq5ap4cRAiHzub31v+I01OTmUpEugHAFi+mEVi0J2R/A6LjZrlwPwbpgOabSrRpgXyhumYIsVwx1DtW1QJQl/bdZQLwUqGsKvcP26r1a34YkTOM4y15TlZV33K9//3KjEaTHMF2V03pgugRx2/UraYpytSBLEp2YoLZRu7xXceFtjJSVI6qf94mj0wsYdH60JNfZe9JPuZRVeILSIABzFjr8639FnvzKmzdVBqnpRjIAJMjSQJKijnqEXYw18ZPgsP9KSweMzt7bEDvpc1drjj/+afJP8Blj3kUhcBmI8sK5JAD8xyMaulMukkGqUA1xe4KBASsx2l+ii+PjfNvYk0HOazsf6ha6zV4DR5kPJf77rkAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(54906003)(6496006)(66946007)(66556008)(66476007)(8676002)(316002)(8936002)(478600001)(86362001)(85182001)(4326008)(6486002)(186003)(16526019)(9686003)(26005)(53546011)(956004)(33716001)(38100700002)(6666004)(83380400001)(2906002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWJnQm93MWxDc0F2Sys0UjkzdEJJYnpTc29hdzZyM3RPUmtDS1NQV0Z0Rlly?=
 =?utf-8?B?TjZQMWxDRTRYTnMzd2pzSlZhOEY1NGZ5TVpTN1luMlM0ODl6b2IxNFc0dWZL?=
 =?utf-8?B?WUdFRnpYdDl3TFBCVEtQMTNSbkR3QWoyVGpncjhVRFlQWXR3SGlGN2pVSzZS?=
 =?utf-8?B?aHY0VWZXUE0rQUVEbWN1aTJQZE9YTDJZT3pqSjFBR1lWcUMvQ1B6ZytFSFVS?=
 =?utf-8?B?QThRRFUvbTJFRnNSa0E3c0FjMkV5UitwM0FPd1I1ZXBmOXBDS1FUSHV2eWkz?=
 =?utf-8?B?b0NXbzQzS21pSkVxN09uOTV1L3BTdkR0d3RQU0dOQ0tHYXFOcXRxWCtvcHRN?=
 =?utf-8?B?UFIyMjV5Q1NGNmU1dTFTUHFSdmJTcWVDeEdMTWxTczI5bWJDNlZJVnBQcExi?=
 =?utf-8?B?MWpQQWtjOHZkdEFxU2dsWS90V0FjZWZxTFJkTGFGaEgyTHpHR0R1cGhGV2Jy?=
 =?utf-8?B?T1U3Y0JoRGRjTGRrK3JCRUgyWm1IYzBsUGFHZm5qaXNtWHZqVUtDM3F0MGI5?=
 =?utf-8?B?WVViL1V2c1kxVnluWWp0aDA3UTBBMFVoQWZlUW0zTVMwNHpuRjZVVkgxV3Fs?=
 =?utf-8?B?cUVlQUdvWXJrZjBKaHNLTHBBeFBXUjhDYS9zOFZsbHJMc05Jb0tHaS9GSm9h?=
 =?utf-8?B?c3doaDRQeFkwVTRpS2hPSXFOVkVBc1JoYmdNNVJLYVZFQjl5MktWbyszU3ls?=
 =?utf-8?B?YUZkRmJVNFNzYTlRRGRWRno1QVEwRmpqb0ZNMTVSVE9VaDM5c2VBdXBMaHJl?=
 =?utf-8?B?ekUvenUxL2czQS93cEV0SHpsa1Y1WlIwY2dsTW9FVTVMTWFOdDRiZm1SN1Yx?=
 =?utf-8?B?RUNnNmtWQjMvcVZ4SlRwc3FiYmZYdzEra0xhM0xkQzl4NzcvNWZYNTlSSDVp?=
 =?utf-8?B?dHkvOEhlLzJ5eFl1OXgzYUdUdENiZHRJckoyLzNEYnowQXJFVWtEYi9Ja2pU?=
 =?utf-8?B?OVY3eDltYVJDQVVvWERZN3J3eUlsa2pWaS82b2xEanN0S2hpMHI2cmtNZGxR?=
 =?utf-8?B?eGlwODZKMjJodnpUYzZNaExRNEFPbi83MnVuV3E2ZEwvRk56VHFvTFAvQTlm?=
 =?utf-8?B?K2lNSk8xemdIblFBci85T0hURWwwODR0UVBlWGE0N0hPV2lWdWdQNmN6R3Bo?=
 =?utf-8?B?Z1ZUdlpaNEk0di9RMG53MG1NRGJ0ZG5meE94MWV5bXVPNGNPclVoczJhM0Er?=
 =?utf-8?B?bDNIaGVGTTJkVW54QWpGdkhiR3pMTE5WYWhycDZkS0k5SjNKZi9rRG42RytW?=
 =?utf-8?B?bkorMUJYdDgrdXd3aXNFaVZuaEIzeFQxaTZOWUpINTBsOXRMcnhnWVBKTk5k?=
 =?utf-8?B?UVhNRWhJQ3YyOTNwOUVFWlU1bW5kNlJyVzYyTllJbk9DUThUclpDbXFwbDI5?=
 =?utf-8?B?TXIwTElTWldndXAxZTQwNzFDYkgwcnNCSHRvT2xiYTAzYkJROHF3V29zRXVy?=
 =?utf-8?B?cWIwcW50Y3E4M1RLdDhwTXp1bUZpblEweEhZa0N0TElRU2tjcnRCZTd2dml0?=
 =?utf-8?B?Vjg2N3ZoS1E3a3NHekRsSm94VFZvSWZ3MldYNk02UlFLb05lUlA2dktTVHBk?=
 =?utf-8?B?Q3R2VXcySFJxRzV6T3k5RWxrdm80SEppRE03bEZ0VGMrb0VvQ3NnWDlJTlpi?=
 =?utf-8?B?d2w5SVpqbkFjNnphNkIwcWt2R3FKT2pyb1RjZnNlSWlGOFh6QWFnYVo0UVBv?=
 =?utf-8?B?a0NLTXBtRlphUzJZbDV4SEpJdE00bkM1cUNabnlKYW1NTVVxZVlEcnNPNENp?=
 =?utf-8?Q?vcomwl3RAY8yICSVhSqMjYRa7NHVhm/utrQASTC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c70f8b8e-5702-4d52-2a5f-08d919eab38d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 10:50:07.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdW+C/770A9gKhZ3K8DxYTJ9uwNTqoqqnXhFaTPfSVHVNJNPv6vxXSFWLgn7Z1wkplOew/7WE1BNg5E1XBB6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Mon, May 17, 2021 at 05:43:33PM +0200, Jan Beulich wrote:
> On 07.05.2021 13:04, Roger Pau Monne wrote:
> > @@ -91,6 +91,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
> >                               const msr_entry_buffer_t msrs, uint32_t nr_entries,
> >                               uint32_t *err_msr);
> >  
> > +/**
> > + * Get a MSR entry from a policy object.
> > + *
> > + * @param policy      The msr_policy object.
> > + * @param idx         The index.
> > + * @returns a pointer to the requested leaf or NULL in case of error.
> > + *
> > + * Do not call this function directly and instead use x86_msr_get_entry that
> > + * will deal with both const and non-const policies returning a pointer with
> > + * constness matching that of the input.
> > + */
> > +const uint64_t *_x86_msr_get_entry(const struct msr_policy *policy,
> > +                                   uint32_t idx);
> > +#define x86_msr_get_entry(p, i) \
> > +    ((__typeof__(&(p)->platform_info.raw))_x86_msr_get_entry(p, i))
> >  #endif /* !XEN_LIB_X86_MSR_H */
> 
> Just two nits: I think it would be nice to retain a blank line ahead of
> the #endif. And here as well as in the CPUID counterpart you introduce,
> strictly speaking, name space violations (via the leading underscore).

I guess another option would be to name the function
x86_msr_get_entry_const, and keep the x86_msr_get_entry macro as-is.

Does that seem better?

Thanks, Roger.

