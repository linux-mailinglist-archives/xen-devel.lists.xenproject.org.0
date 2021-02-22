Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C38321414
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87858.165072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8OI-0000SG-QN; Mon, 22 Feb 2021 10:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87858.165072; Mon, 22 Feb 2021 10:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8OI-0000Rr-N0; Mon, 22 Feb 2021 10:24:34 +0000
Received: by outflank-mailman (input) for mailman id 87858;
 Mon, 22 Feb 2021 10:24:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lE8OH-0000Rm-3E
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:24:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bc05b2f-c776-41eb-a506-b3920b73644c;
 Mon, 22 Feb 2021 10:24:32 +0000 (UTC)
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
X-Inumbo-ID: 6bc05b2f-c776-41eb-a506-b3920b73644c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613989471;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xBERzIVCjCmT1zh+ia5T7GT9F6AlN8X3qbUJ7Rr6Vp4=;
  b=Ng8OqM/TdNyXswSCXQa6h3aXkzZU6BpI2I77CDN4ubgfR39lutLgFpOR
   VQk/11UWbeqOYi++JL9WQD28xRXx0KB39SwRJSmUQudyYSrHtdyfW5Vg5
   tLSZ7Y5SGpaxbixzuHmCaWzvd49Iu71yT6fFHS8+n1PBm8YbOumWqRdBB
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zqposPiWRB/2qI/Btpwd1YgV1DxSCxj+GKrJSS5DdhgIlNzi+eHQkeVK4ANlXb9hPXtMspA+hN
 h1EemKuVk+sxwWSHgknlns2/3NwxJv5tkZ2tpAf9+gy6IZj1D3os/k0hn505IbCTDuujPDImw/
 EYq8myw1IJOhk1DYjFEzhP0hx9oMMNbNRqbynQk5DUL2myfeHa60X6j+RX6qxMGZiWVQP7UxKJ
 nLXezcU/XBtlLKM5oAzB3D0do8vrRvVLR7VEscQ0ohomBVcktFJ96WKtbjVpFN+UIplJ8KG8lB
 7I4=
X-SBRS: 5.2
X-MesageID: 37914758
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,196,1610427600"; 
   d="scan'208";a="37914758"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJLrVSSWoNYC9mU7FBVgMwGJM99HCSIoe/yJqZbignXYXmonU/GkwdKW0eEkBInQxm+28++YdEjDErsF2j07xhy6Pi7IE2XgZDxADZn/h8DaQYp4beA856TN5ZsBBTkyZCa7bT7GAjRQTqYWQ3hOgHSmUpGq6AjE7+ctCUb/Pdnnk7elvBNKWrE7bVaPW6+MMUVonokaOxR7D7euvUxZg6AG7IRN6570/99jwZPCXfQdfI778m1auIvkkazQeZFAg3nkSuo/zbCfD6JfTwlx8+0c595RGeabT5BOf+0z0L//9ObcjxSyjZyfQAjH4oKY+0+0lEPxhgciVNeyBUI2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/djj7M5mquJQDj1u6cxQhbBU22AEShavrxn4mhwoRxk=;
 b=ClNIVnOlq4hKbpr7AB8XtPqzjNKZPhcK9hVdIHFAGWMyumzWg9/OVQ5ViCm3Dv8cTvkH+ULMprk+0xo84t5aSr1ueU/338ibTt3G9o4yr2HfkRb/W3ZSXsUAX0BQ7rHxLvaUxEqXf/+CNmPydaK8GW3O3FCsd7d0Tyxr07X1aWMGpHAi2UYnjZ7tKYUnUXBVaZiy3jL1d8KnEmQSQFeuTpsLIcJkTiF4LMV7MUU2N4eSYdBUruhgh64soDscVVEJFNMKzU86NLqatZ+Mf+okTygcenXTSt/AUq3C9URaGHZtSdtR6RAaa/S2qczFjv93puVreTXzB9i+MEcOFcTqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/djj7M5mquJQDj1u6cxQhbBU22AEShavrxn4mhwoRxk=;
 b=MF6U8EmxKjhtH2523NIH4E1SdjihgAQYr9vnMw/DafBJeniovEKPmFYP54CHMllJiHd+VSkrdcLN+zrtddjXy/YbjIsi0kBw8OnODjCPtsCBC10tmFWd3sF3u3jBmuQu6kc57rk+8e/tAJpkF6mTO9NCqjf79m9YrWJymV4+prI=
Date: Mon, 22 Feb 2021 11:24:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
	<iwj@xenproject.org>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/4] xl: Add support for ignore_msrs option
Message-ID: <YDOGWC/VK9eOtgLw@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-2-git-send-email-boris.ostrovsky@oracle.com>
 <YC5EitRCZB+VCeCC@Air-de-Roger>
 <a78a4b94-47cc-64c0-1b1f-8429665822b2@suse.com>
 <YC6NPcym62a0Nu0M@Air-de-Roger>
 <8ffd4f51-5fc6-349b-146f-e52c35c59b4d@suse.com>
 <5b286dfd-278b-8675-cd88-3ee2706c06e1@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b286dfd-278b-8675-cd88-3ee2706c06e1@oracle.com>
X-ClientProxiedBy: PR0P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de7e0685-6441-437f-8b94-08d8d71c08df
X-MS-TrafficTypeDiagnostic: DM5PR03MB3212:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3212C821A64EA44C2A14CFA18F819@DM5PR03MB3212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9vdiCuEdQAghBFmgEDS6ieVTaJwqbvaW9mEQZCv7cIy3EIBwDOgHJj5cvhC9HyEnhAyDc4HHVdFQMudYiXCyvVCVP0hy3Pn2fBoT8niIeeNUmK6TX0FkIQYNkAZAT5e+t8K1/ECQixpAhAFXW7YMsDrmJQl1YuRUthfI064qqXg0XJabe3fUAFM1rvUMbo7FooTvjsO6uW181BPuECpwYFi08ITxpsg0xK8L3npc8eQTxQSFd12toG00uD635eyJM6YEk174lwNXVXQkGha9dx4LkjV98WWdunVSQwrDYviVYgDURY1GEgwz+HFFJFmxdzDtkptJ1Y0QgaL3/GHuAZSP3AA/SMGmyOFer7APgTMcO0qNwIa++GUW+wRxITtzdrX0wD11GBIvQ7FIRBRHNvfyg9Fqa2zVJ3RZJAul3oSwZyvzgCZPDupDO6HWc/4y/kjKnFsNoUtUZVuKI65Z4lAGrE/akhzNtNcA9Bm/WCFUu/TEG4C7bLo2uH/iPC8Y+jf2OiScG1ABPlmH42E/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39850400004)(396003)(346002)(376002)(136003)(6666004)(26005)(8676002)(16526019)(66946007)(6486002)(9686003)(5660300002)(53546011)(4326008)(186003)(85182001)(478600001)(33716001)(8936002)(956004)(6916009)(316002)(6496006)(83380400001)(86362001)(66556008)(2906002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3RFYkRSQTFmcWJpYm0yMGdQcHkraXArRFNmV3lrOTdkMWhwS3FYbnZ3M2JM?=
 =?utf-8?B?WmVWVVhVcGx0N29NNUtDZ1hteFRHK01Pam1YcUJVeXNvYVJmaTk5MnY4Vlg3?=
 =?utf-8?B?d1hXMzZWK0hOb0ZqcngzMHhIeHV0N3pBNUNUVkhtRVZ6a0E4UEZGV3JuNmY0?=
 =?utf-8?B?ZldTSGg5V0hoQ0RIVjU1WTZ4RUhEOE1YMS84em45dnRXTnZUVi96ZDV5TlVW?=
 =?utf-8?B?QTdya1lMK0MyUW9XazJzQjladFJmV3Q2ZmlUWHpZR1NyTDZFZUtabmVhUXBk?=
 =?utf-8?B?cTFxR0w3KzZzRVdSc3JrMnJEbXFCd1g5azB4ZnN6UGZOaUVCdmtCSUtCZ0pp?=
 =?utf-8?B?K1d1SmlEWjBacXlkOWR6VWlTSVVHRUZXN2UwVU03ejV1ZDdrWjczaE00bUwr?=
 =?utf-8?B?NlNLQ2Z3dFQxblN4clBKY25BbGtaQk1FYm5tRW5BYTJSMWJXMVM0QkJsUDdI?=
 =?utf-8?B?VEtzZk5lMkN5WmtPUGFYRlBSWVZ2dFprbTRJQUU2Qlk3dGV2UVZHZjhLQkxX?=
 =?utf-8?B?MFVQeE0wR0pzSkhtdDIybDB5bnZ4b2ZiaDVTcWFQRU56WUFuWERsN1VIWnVj?=
 =?utf-8?B?NWZOSjg2eWsvT3A1NlJMK3k2Szl5OWFNRGVpc05RTG5hUzczWFl5M0JSZEJP?=
 =?utf-8?B?UDdtRllFYm9UTXV6eURuTk5aR0YxR1NseDJ6Ulh2Tm4zVm1pcUZJZk1kMUs5?=
 =?utf-8?B?c3pMaksrS3VJQndDS0pCOENhdUpmbXN0VVFDeWRWcjNGVVJJYitRRVFEckNC?=
 =?utf-8?B?R2RsVEgrYnBXcldWTThlcE9ZMlJIWWhuS3Vuc2FSVjVDNDJTczdZeS8zcFVX?=
 =?utf-8?B?Y3dHSWF0V25NZzQyTkFCUW1FSFNXVW1nRHYyNUdhL2hmTEdZd0dJMk00cFJz?=
 =?utf-8?B?T0p2WWFJamwvemlTdTFzeit5anFNa0dPWUhqMjUrWlpsY3BYdkVOL04yZjBL?=
 =?utf-8?B?ZUM2VmUxV25VWERSekI5M2I1OEhoNW1XcnhSb01idFNvS2xpdlRkcTdIcHJJ?=
 =?utf-8?B?Vi9wU05rYUdRVExSVFoya1VCYXcySVFLMWd3cnhWK2R6bzdqNWNXckhzYldV?=
 =?utf-8?B?aFZPcWMrQ1o1VnpJbFFzOXNwbFI0MmNWOWFXZ0diMk1XVGxoNTdyQlBjTXVZ?=
 =?utf-8?B?S3dvbFVnMnFqbUZnZk5mRmRocWVmNEIvRHF3OGE0NUh4RnFNSk5vTEF2a0sy?=
 =?utf-8?B?eUxibmlzNkluM1BmbmxCMk1lU1lkVUlTN0VuQjFqTUVRaGtrSHRnV3ZKMUVs?=
 =?utf-8?B?K3RXTWx6Z2NUK0hrTVZrazBSMWt6aURscGJVdU0yUUcwVkcxRnU0eUY3eHVx?=
 =?utf-8?B?anhPeENueTd3RDM5dk5sYjlLbmdQOHlZaWpRbWpVZk4yTTZuZlhwMDZJV2J0?=
 =?utf-8?B?TXE4TTlYTURVUWJOcWdDQ1FwRUM3RTBSb1FhQWxxY0tCTXBNTW9IS1pENUlU?=
 =?utf-8?B?L2lCMzR1WkV3V3ZjRlpIYmk1c0FoQXI4V3BqSmZySzNIbFpTd1R2eWd6dVBK?=
 =?utf-8?B?cENzMStGZmVNdFNKQjU3S2FocTdodG10M1h2KzkzK2JPWHlJcWsyQzk5YS81?=
 =?utf-8?B?OGpUQlgxdVFBeFBYNHQ5eFNYdktTVXFoUlRzQ0dQVzlBWUFLMW9pYmJVRDdt?=
 =?utf-8?B?cmxnYVBHL2Y2QXVyTWVZRGNiak9JWUZIbXkwZENoOVJxRE5VMlpzbDViNEo5?=
 =?utf-8?B?NzBEcDR3V1NhcGVQQW9pOEZrZUNmUzByS0JsNEt1MzlWcVpkY2h4amRDOUhF?=
 =?utf-8?Q?EHnWtCexZuF0B8tzmw3hMDJMQJcgqV+Jn6rcbSu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de7e0685-6441-437f-8b94-08d8d71c08df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 10:24:28.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwiwODx8zC2PuI8DlfS8481V3JJi9GiPU37HS8u66abp+KIp0dPnCOHkoTJwhxg2m4Is9a7UILL2Cf2Q8cE9AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3212
X-OriginatorOrg: citrix.com

On Fri, Feb 19, 2021 at 09:50:12AM -0500, Boris Ostrovsky wrote:
> 
> On 2/18/21 10:57 AM, Jan Beulich wrote:
> > On 18.02.2021 16:52, Roger Pau Monné wrote:
> >> On Thu, Feb 18, 2021 at 12:54:13PM +0100, Jan Beulich wrote:
> >>> On 18.02.2021 11:42, Roger Pau Monné wrote:
> >>>> Not that you need to implement the full thing now, but maybe we could
> >>>> have something like:
> >>>>
> >>>> "
> >>>> =item B<ignore_msrs=[ "MSR_RANGE, "MSR_RANGE", ..]>
> >>>>
> >>>> Specify a list of MSR ranges that will be ignored by the hypervisor:
> >>>> reads will return zeros and writes will be discarded without raising a
> >>>> #GP.
> >>>>
> >>>> Each MSR_RANGE is given in hexadecimal format and may be a range, e.g.
> >>>> c00102f0-c00102f1 (inclusive), or a single MSR, e.g. c00102f1.
> >>>> "
> >>>>
> >>>> Then you can print the messages in the hypervisor using a guest log
> >>>> level and modify it on demand in order to get more verbose output?
> >>> "Modify on demand"? Irrespective of what you mean with this, ...
> >>>
> >>>> I don't think selecting whether the messages are printed or not from
> >>>> xl is that helpful as the same could be achieved using guest_loglvl.
> >>> ... controlling this via guest_loglvl would affect various other
> >>> log messages' visibility.
> >> Right, but do we really need this level of per-guest log control,
> >> implemented in this way exclusively for MSRs?
> 
> 
> In a multi-tenant environment we may need to figure out why a particular guest is failing to boot, without affecting behavior of other guests.
> 
> 
> If we had per-guest log level in general then what you are suggesting would be the right thing to do IMO. Maybe that's what we should add?

Yes, that would seem better IMO, but I don't think it's fair to ask
you to do that work.

Do you think it would be acceptable to untangle both, and try to get
the MSR stuff without any logging changes?

I know we would be addressing only one part of what the series
originally tried to achieve, but I would rather prefer to have a
generic way to set a per-guest log level rather than something
specific to MSR accesses.

Thanks, Roger.

