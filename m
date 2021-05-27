Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D97393258
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 17:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133574.248923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHoe-00063B-6u; Thu, 27 May 2021 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133574.248923; Thu, 27 May 2021 15:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHoe-00061I-19; Thu, 27 May 2021 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 133574;
 Thu, 27 May 2021 15:20:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ln4B=KW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lmHod-00061C-3G
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 15:20:55 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c02a242-ec5c-4fe4-bae7-bcf7322f51f3;
 Thu, 27 May 2021 15:20:53 +0000 (UTC)
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
X-Inumbo-ID: 2c02a242-ec5c-4fe4-bae7-bcf7322f51f3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622128853;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WPD7pNQEqa/siY58nkVGlldYh+C1L4iLrnhhDsefgYE=;
  b=LguKQH2RaqTyD3eSTYd+Edb3amB5QBueiSpWcCngskMMIefXx98dUWfd
   AJNsM+jp5WhdEtoLWj2tsPVmwmbWQZR6w0G/J4a02uSGnu3SUaUeq1aaV
   mCnI6MR1PK5CH6kdrFNQ58z2CS3FX6XX0c6gS6Umvf9WTKAkGLwM0/Yx3
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cwLL+AXADZOTc+lstAszYwWiaq0GqGwJBXqlm0XFPsxTJ8HTaiaHPspHHXUiJDRlcW6CE02v4C
 quVb6GWRyAHff/ZILgA/9HuyUw0ph+qtCSVoJK4OTrL8mUsfnGEP5lUi/hhxOu0uq+qRx8C56C
 CuwRkYmsGPity+pB6tnvcs3VilFHgz8hD8RA89ykgTUO2KW4WnvwDwDD01M1bTwt+3aKOMTKG/
 AWaFI7G78hETqEx43chFe1KWSvz70cEv7gfHRY/LmF4F2vlDziXcIB4BGmZcW0PcRf1g86v+YK
 MOA=
X-SBRS: 5.1
X-MesageID: 44864868
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/LzkwKvghcrPG2K7m9/jSS5b7skDRdV00zEX/kB9WHVpm5qj5r
 mTdZMgpHrJYVcqKRMdcbLpAsO9qBznmKKdjbN8AV7AZniEhILLFuBfBNDZslvd8kTFn4Y36U
 4HScdD4bbLbWSS4/yV3OEWeexQuOVuXMqT9IPjJ9YGd3AMV51d
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44864868"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8opeJVxUGtClTjpm1QzlLg4SjlNR8fOJYbLG32wdWqHFBpP4OlJCcIfJ4wDoWjnd2rOBeK6vauwCIguhA2rplUZIHJRH7rC/uZxeZOfmBBYHfMg1y4FjsPS+cZ1S5r5O7rH8rrHz9Fewv9vImivvHsN3CAG8mOvkmfZjFFCNBslwUpmJ5ZI29FsQOSmqVhYB6t4SvUvr+RD3LTNb/GQD8pzAfzOGVMiRPpRAGb0B4sSo1e8MWpOBphYvvF89/3mo301Hu07w3g8WJUia+7SKMOLIazfs8LN2ZSd0ERnbEw/+u8SA20O70nm8VhqztyCaxq8veDZ32idz6sZ6SlBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9kti0sSeNFYtvJ4yA4eu33vG6aQbwWAzTH/n6j6Z6c=;
 b=Xh5HmVvXGaolSm/FAAx1JzyfHlk7hlzxIGpi/Rpa3tesPx+WSIyceiHnm/JzWTw+vmflJWBcLm0FvrkN/lQH9BcaSNld8ypjKDfyhR75edKiIRfZp7ddGqO9bQ1pKlBrWqdbG39zVUOxDXTrOt7roGPOKIhisez79RyViL+YgPSJvlebYAuTJPPfaGRgz9hLdDhR1AcFVKgn/oK57xaPKgEUPfyrF/T1Ywii4fn9GIgi73egDNS2jgruXQSxCdv8nzFyu4oQ3avAigo8H+dkCVJxPl9+Pf8Vhkt/0nVbCRk/7RWuoL0bCzmqo1kMI4E0ZbrT9O7i/WFlgNPpDPp0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9kti0sSeNFYtvJ4yA4eu33vG6aQbwWAzTH/n6j6Z6c=;
 b=ftGmjebP5hLvH55pHdrAmYLCLJab2KD4U4kglnrZR9r92201aXQ/po97Pb/ux3L2TG+VMTN/dR19H8/881GUgTfTW25DgvzxNAY/Xq1+j07sgf2yhnxYGj+8346huTmgTvt6uO1SYuQMp+GZ/k9A5dkum5AnQiEZMM+r/B/106I=
Date: Thu, 27 May 2021 17:20:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] x86/cpuid: Rework HLE and RTM handling
Message-ID: <YK+4zhqJdyZwLwNx@Air-de-Roger>
References: <20210527132519.21730-1-andrew.cooper3@citrix.com>
 <20210527132519.21730-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210527132519.21730-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab2d52f2-b951-41f6-54a7-08d9212302c4
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53406357F691A1E27F4831EA8F239@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKBsdU8dZWeUK46rBkvrZNRL6NA2jsMUwUpbnM2pdMgXAPYtJkTv0PSkzzDKSON/1ou5oFhHiESr1ZjyehvOodY2F0mfp2vVm3YdTZ+g7yoD+tKlxnbxw3Jb+FY1zumwwSvT9+fzZIlkVoCgMvnd1DgclNg/p90vZc1aNUJNEjTq0iqUX5/AboFrHyA7NAPb5KcmX6x/LTwW63c5PZcgWPIyc2zkcSfo7CS3+eB2J6enR+/uak0GzNNmbOJDKayI+Y95qkj73efi2MHFHxejWVSiTNiv0tDzKpQQ5KsP+Cof3cxu5K3TnC7JZuIu7LEAaLvQFQeZrckjMm1jy/UjqrBK3O/2zbO8U+FkKvajxce37rdYekCp4gcyTFZRbdf0wBdyS194QFw0T4Lplks4o0OkvzpdnKOZSqQqdTH7X6G5plFl5VAhkDs08qxDG2KzqOKRBIc7XLIacX0sfXqFuxJWNpeHoSLLEBfIDutwRQRfER1aNmvQld1/X3Ft8VvUYkUW4AagWnrpKVnaXba3OqTGGGcnHUAaGB3Kn0ptl7Syzn3CT+ObucSYaz7NTYYlIJt8j5inoCHa8y6kBH0nNYMMVFgA0mvNJKoagTzxIuB2VG+qVUwtpMGyuB22ANJCDDGZLKY0r67VcvjiDh07yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(396003)(366004)(39860400002)(376002)(6862004)(85182001)(38100700002)(2906002)(9686003)(33716001)(6496006)(6666004)(86362001)(478600001)(8936002)(16526019)(6636002)(956004)(5660300002)(316002)(83380400001)(186003)(6486002)(54906003)(66476007)(26005)(4326008)(66556008)(66946007)(8676002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3pRditTTkUyUHJUR1k2REpBQTd2VjVCREJsOU9KaHBqZ2hsQ3RqbmFXSDZX?=
 =?utf-8?B?UFZPNnZHaHcxOGo0M0FXZHVvQTFYaGFjOHduWklKM01IOWNnb0oyZnpXQkFu?=
 =?utf-8?B?L3k4cGQvNml3WXRpQ0UvbFBiditlcGJHNHg0RlBWNG5GeUNSSHhFVDl6TlpQ?=
 =?utf-8?B?ejRuR0N5em8zZTZFQjBWM2FEZG0yWVNLa1pnQ05rYUdYVVk0WHNoSnNnZFRF?=
 =?utf-8?B?N05OSTFkK3RBM2VjRy9WWXJ0ZmQ2cFNnMkVoSDJlZ1luS2Mwcm80Yjh6dzA0?=
 =?utf-8?B?a08vWE5DTDRTRHZmSE9XUEo5T0pJUDBmNlZZR2FCRVM4K28valg0bjdIRWRO?=
 =?utf-8?B?WDhXS0RNQlh0L250TCtLaUNiVllQTVFja2F1d3d5dVU1Q1ZPakJJdjJScHRL?=
 =?utf-8?B?ZGpLMk5ydkdrU2dRZFhKcE1FYUV1YzhVOUtKK01JdEdrUkZ3VmF1NTV2NXAy?=
 =?utf-8?B?L3RLU3BuNVJIOXVDQVlTendlWTdaVXA3d010NWRpMTBPa3JCNWVCcllTTkNl?=
 =?utf-8?B?ek9UZEo1Q3ZXTzVpQWNIb3FBbHRndXBNS0VPaTNDV2NpSEsrcFR0THozbUF0?=
 =?utf-8?B?aThoZWsvM0lBVlV3enU1bzdQeUVhd011dmwrRC95UUtFZmpTWVR3Q20rVmUr?=
 =?utf-8?B?cmtsUnV5c2dKK1NKRzBmOTBlNlVzOGVSR05STTdpcXFhL1pCSFpMMGlhMktS?=
 =?utf-8?B?VUc1NnRFUlZhSU9zSERJbXBMVFUrNERRSUV1UXdBYVlLN1BoL1NSaEJGb0xF?=
 =?utf-8?B?TTN1bm5ZSjJKZE9OeHNiZ2haOWdyeFhIdDlHdC9wajR3NjlWSHhXdXJ4Nkow?=
 =?utf-8?B?R2JjditNS25UMzBDaUFUT2VsYVBCZGFWN2xxUGNBRlprMDhyTThPNnAwQzNO?=
 =?utf-8?B?L2xJRjRTRGN0c3k4T0txSS83VzBDaGdtdkk1dFg3dVl1Mm96NWJydlhCYXJs?=
 =?utf-8?B?bStJWE5EWG9YUS9XYjA3RGl0VXFtUzJhWmlBNERWWkh3MUJ2dWVBYUcwL2FD?=
 =?utf-8?B?ZHpRRWQraXBKVDFVRVhXVS94cFZqTWFLK09XNnduV3Y3MWNMUkgySE81OExI?=
 =?utf-8?B?dm4yeURKc1lrNk1rWTBZMUIvQ0pXd2N1bUhTNlhuYVdCZFliQWRLWWo0TnZW?=
 =?utf-8?B?NmNuQi9OT3VaUk9EV25EWlJRNW9kVE9uSm1RbHZZd2NWeTJHT05ac3RjTS9L?=
 =?utf-8?B?SnVKdUdycGZlSlhreHg0THh1d0NxZHNDM25qT2FhNEgvZzhFU3ptN2ZrZG9y?=
 =?utf-8?B?dFJITXptR3YxMzUreC92MFp2MXpMRjdTRW15M0FudWV6eWVYR1dlU0tCSksx?=
 =?utf-8?B?WGFURWpOd3Rsc09ybi9uTXQ0RzBLaE9IdG5hT29SUzY4b3pseEJKOG9DYVZH?=
 =?utf-8?B?U1cwa3YrSWh6RVY5eG1lT25jRFNqaWtGQk1tVkthZGlybUFQY3FzaGJSVTJR?=
 =?utf-8?B?UmhFYi96ZEtBeUV0cjdtZit5cEl5WWNwVVlvaHUrUXZSS2Y4eGR4SFQ2RjhZ?=
 =?utf-8?B?MWEzbWdmZk1aUWtoeFpNc3VNZXVLUSswRzJ4Zm5YOUM2RWs4Z3MwejlLS1Rs?=
 =?utf-8?B?aHRENE5YdVNCd1F5bTJZLzlnWkVoUDl4dEt6akRpbm1ETUE4QUFNQjhoY0FL?=
 =?utf-8?B?WGVQYmZhUVFhQUs5MWluVSt6aG5PbFdrS1lpb2xjRDAxM1VtWWN1ekttK1Mx?=
 =?utf-8?B?TTNpOEhBRkU4RXZrMFhNS3BGa1ptc05LeXhXWFNuSC9oWFZlVGhoSUw3Wkxl?=
 =?utf-8?Q?6n3gHeh0fTsab5naWvpyUTtTV14ADliLwlD5mSw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2d52f2-b951-41f6-54a7-08d9212302c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:20:50.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6oMSbNPhgJJG/SW4BUliYqH1WlyR463RIAYfMiw9ZM+PjOCRVznCS5PCLTinYe156+9txrX13rMBLui0a7tkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Thu, May 27, 2021 at 02:25:17PM +0100, Andrew Cooper wrote:
> The TAA mitigation offered the option to hide the HLE and RTM CPUID bits,
> which has caused some migration compatibility problems.
> 
> These two bits are special.  Annotate them with ! to emphasise this point.
> 
> Hardware Lock Elision (HLE) may or may not be visible in CPUID, but is
> disabled in microcode on all CPUs, and has been removed from the architecture.
> Do not advertise it to VMs by default.
> 
> Restricted Transactional Memory (RTM) may or may not be visible in CPUID, and
> may or may not be configured in force-abort mode.  Have tsx_init() note
> whether RTM has been configured into force-abort mode, so
> guest_common_feature_adjustments() can conditionally hide it from VMs by
> default.
> 
> The host policy values for HLE/RTM may or may not be set, depending on any
> previous running kernel's choice of visibility, and Xen's choice.  TSX is
> available on any CPU which enumerates a TSX-hiding mechanism, so instead of
> doing a two-step to clobber any hiding, scan CPUID, then set the visibility,
> just force visibility of the bits in the first place.
> 
> With the HLE/RTM bits now unilaterally visible in the host policy,
> xc_cpuid_apply_policy() can construct a more appropriate policy out of thin
> air for pre-4.13 VMs with no CPUID data in their migration stream, and
> specifically one where HLE/RTM doesn't potentially disappear behind the back
> of a running VM.
> 
> Fixes: 8c4330818f6 ("x86/spec-ctrl: Mitigate the TSX Asynchronous Abort sidechannel")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

