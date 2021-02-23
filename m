Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9D323023
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89036.167423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEbyz-0001QD-CB; Tue, 23 Feb 2021 18:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89036.167423; Tue, 23 Feb 2021 18:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEbyz-0001Po-8c; Tue, 23 Feb 2021 18:00:25 +0000
Received: by outflank-mailman (input) for mailman id 89036;
 Tue, 23 Feb 2021 18:00:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEbyw-0001Pj-V0
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:00:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c6e1fab-a222-4865-85f8-74b7c9e2bf7a;
 Tue, 23 Feb 2021 18:00:21 +0000 (UTC)
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
X-Inumbo-ID: 6c6e1fab-a222-4865-85f8-74b7c9e2bf7a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614103221;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HL+rCgnhWWVwH2c8OglKjw4FmFXDlZ5mZgFx2gb4vBw=;
  b=I4toG335c1pcxCxtp6r5afHzXeuM347Iwe7dDc10giElWAWg2C5VWrGE
   CCwcFTYp4UcRDcKG0eEwEu3KNb10g16p/zZipwAShgz/Ag+kggxzoCKeS
   COzRPCwfmwGP+ba3KlYVITUNVy50jRN9Xa0FOEbrNxaKr7wsYDPTK027v
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PoaUFeIxALenvVms2RSoolzkrsbSf/qJQ7OsrsChX4BlNJVXwk7axCSCKK1rBRPWvCiK8QW8LK
 oM93PIhzilDKgIHPAK7W3auVKdVO80hVYrqiNDXlonyH5n5M1GTBEdORQpPF+6hWS6NHOZZjrH
 puEmmNsnDPlpfHClyXIxfz6AS4BHXlII/g8OJb+/6hlavAfag59Ed+CRb+V1yhZuoUGimfrErP
 /54niccLcWymwufyxq/M42x6wN635B+i5qhBYPtX3ZB9MVvA0YfDFkPAWfOPXyKPYw0kGWdqNh
 NNM=
X-SBRS: 5.2
X-MesageID: 37871554
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="37871554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOhDpiiPiMPH6C2Aseu3uJzl+ZuRQUMixrTL+SBYZxo3Q0I2uEAvEybJzwDxm61JKuZDS5KOjgnC7bR0TOR8UHQ3gItA46Kt8NuPsiyJPx6MnmGgzXQu2CJkERfW2RcSOxhArOAxs4tr4rf+WIYdJrmOq46Ik+v3/IktcdRETv5LlQAG716A22WaHBKsCYg+wchZ+dvezIxeivfu3z9yJM7i1eC53R25WVLbtlKOjZqrW17YlR+KVsjtkaGaBe6sQnyu8CLwECjhM8gBBnGRFHRwW8uwpOSbYGsoNauasPJ2jO8CpeYdeftZDXQWJNQyniZ0Blam8hExh3uoStaz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L3TgQfo2UIqdfUdhFuk2vIahm8UXlonLYTKGfKEFRU=;
 b=O1jzwtJ4wV8jJwJ0/kQuhnNd+O+xxIRLQwwYkp7/FgNSJpNWPj5syXEW73StLD7kJV7XaVqSYwkE9aYEARrAE3sOVLa7YLXwlGoxh9htNC9DUG7Looyg2+MIsUFmLLFlDB1CKqFOy33hafOuIV6AQ1OS86cXWafm2lZhDEbay7b3/2TI539DihcSIQbmskO7E61gmROF+/cSI7uGBurfvzDdVEXRUgoHdBjVDYh2ViQq9wd/mneq+bOSOIKV+sQzFCB7jkulUCcrnwKbktn7TTH2GzxpaDDGCbQ2L70vSXI9kBPOWMRh+18ImDm+6oujdKWZL73yPIGhBQ1sjLq1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L3TgQfo2UIqdfUdhFuk2vIahm8UXlonLYTKGfKEFRU=;
 b=icgCTw3eHLIcBQOQSddvsnXfgOgQvktJ7hvHR5CL29sg9n9mo2KuVRald5WYp0VZA7JvY5wOJ8DRE41cOSD3potKJjEYzk23kS7Hn2dTOQqHqRyJEhVN80MpOJkrZC3SLqX4RGFKgu2RRXQsrf7VSeGddbQxRYxkrBGJEI7hKRk=
Date: Tue, 23 Feb 2021 19:00:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>, <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YDVCpq5girn1Klh3@Air-de-Roger>
References: <4e585daa-f255-fbff-d1cf-38ef49f146f5@oracle.com>
 <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
 <YDTyScmud26aiaMi@Air-de-Roger>
 <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
 <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
 <a4d2f7f5-a8b0-eeb5-dfaa-539784c67a87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4d2f7f5-a8b0-eeb5-dfaa-539784c67a87@suse.com>
X-ClientProxiedBy: PR0P264CA0282.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681ff6bf-6ca1-4065-6d14-08d8d824e165
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB357929609585518A683173FA8F809@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v92NNcoVXX9Hxpd1tNiJ0OZWeMVooJB7YjTYiTpDXPwShCOvyZ7+3EUNNhUEEiDBbIS+Oi1l61WeEcl7Lr9e16rbYYiAyDgUsi/bM/TKCZxvan85EWMw+XnATzte4nOFvRzwYrk8n5DWd4+kXNe4/v9DU1h9ryL1maACPU0H0lfZey0GBQP9zeTwSttQbbOswzbUnR8Adp5b80A7DyeKShoqgzEunw+KMJrlzCqfevke8Jx5J/zul73aekDirp13mX6VgGaku5bio4RE/fIdXaq3BmN1cLJpyFlrADCycBaVBRyWM7Xs3LO30dXV1AoflSzMk94b6Kd+eSbeLkskPOwLcebUfb70X5uh1MyHIAdB5KfkLXHBVxDfsI53IMFvy5niDlxzI/EVpOjijDn+7Zg84BGP36qoC9iojkYqoBVOOukc05ejfgHc1WQeJyj/2NdMudRvt9UOcRQS/U0pvAGz1ouj3+LjDkhEYN41dPpSweHWs75MGJDJIFwSUREMXPDNsJlPH99JjTtYrCIvKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(6496006)(956004)(86362001)(2906002)(53546011)(9686003)(26005)(85182001)(16526019)(83380400001)(5660300002)(8936002)(66556008)(66476007)(186003)(66946007)(8676002)(316002)(6916009)(33716001)(6666004)(478600001)(6486002)(4744005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXNMcC9PeDJIbzI4NG51MjVMMWxSTS80S0RGcURFQVc1UTlHNUQ4SWxzQW5Z?=
 =?utf-8?B?SU9pbHg0ZVQ0L2Yvem55Q2JtN1dYRm9MVWhnWVBKN3JFZHhWcmUxWkZzRVR5?=
 =?utf-8?B?ZDVrVEQ4SWpUMDNOSHk1ZHpEWTVGWDBkMlVaMUc0T0xQQ2RlQldHMmtuMUVE?=
 =?utf-8?B?TEgyZUFWcUZhRnFRcS9ocXpyWkxRRU0rVXFXSWFuQjZxVTVCUFhQbThZS0tZ?=
 =?utf-8?B?VnY3VVJlVTZ0Uk9MbzNKenFBYVJ3NWFndkJPU0NQZ2I0eXVnUCsxb0EwdlJv?=
 =?utf-8?B?bFVoRkQ5WDhwMDlkTVo5YzVnV2xFQmtUbHBkZWFuQVplNmhmRlVqY1o5MWMr?=
 =?utf-8?B?TG44cVNmVUIzSjAzTjUzdjNoMUZpVzRGMlVscVMxMWI5QmVBU2loc3dLUTVa?=
 =?utf-8?B?ZHRNbjFneVh3RkFDRi9TaVlHcmRGMEhvL0dSWUNLajBlTEQ1THJ3cjFKektQ?=
 =?utf-8?B?K3lHOFV2bm41M3ZIWVErT0M0dktvL21raUNTYUFLalgyQW1naVpMNU9sdWNt?=
 =?utf-8?B?NnIwTDRyRGxJa3RQY2hJc3IvWVg1TW1vSDdSRHlrTlQ5L2Jjd3gzcFN4NFMx?=
 =?utf-8?B?OWpSMnZ2TXV0UnByZ3cwZ3JlcUtCZUc0Mk4xMFNKTFZsRW5XbFVvODR4QWRX?=
 =?utf-8?B?RkE0M2RLQXlWdUVzb1dLcHpPb0E5UVU0eW5hbWNUdmtmMyt0V0x0REJIdm13?=
 =?utf-8?B?QTVZRkc1MTA1OFlXcmxTWmttVDdIMjJ2SU40VHM0VnNaQmNyZFVEL28ycms0?=
 =?utf-8?B?WU83WGgvNEZhN1N4bTJWUUpoa1VoM0dsSHYvYnIvb0lZQUowS09qbkcydzNx?=
 =?utf-8?B?R1o4bjVWUlVMY0JPdm1zUk9hQTF5Nm42dVEyVXFKczVTZjRSSWFvVXRhZ2lt?=
 =?utf-8?B?MWE1NFhIa2RyZHBrQ3l3Q1pON0x1WTI1Rk0vdkk4TkVTR2tqM0ZKQmNEUWVl?=
 =?utf-8?B?VXphdGZpQ3h3c1hFSVFrUnFneFc4SVJ1NlJoNHE5VFlLU3NOMlJhZFEzRjVX?=
 =?utf-8?B?aFozZ1hhYWtwRThBOWdPcFp0bThnQ2o4aDFPUjJKWXBTQkRUMDU4SFl1cVgx?=
 =?utf-8?B?R2s1MjQ3QWZtK2trZnZUdS9paW5mRnVlRkhUQk9OVWxoTWtkMTUrVDYxZkln?=
 =?utf-8?B?L0Z6ekcyMXdqZGNKM0JWT2NKeVFrV3lBY0h1YStQNUxhY0dnVHhZdWVNSXhm?=
 =?utf-8?B?S0tKeXBWV3Vyek55d1JYMzg3cDI1dFAveU02djVseFA3bXBjQWZVb280bXdL?=
 =?utf-8?B?NzlzWTVPM3M4NFYzcEZQOHBLQmwrRER3OFhJZHVyZFlTY0RibXJoQ2YxM3dZ?=
 =?utf-8?B?eWRWcjd3MlVqVUY4emsrZTFOWXNkb3lpZWlwcmhYZGhHbFU5Nk1VcTg1RVhs?=
 =?utf-8?B?ZHlhdjdHTHdWK1VBdFdKbTZQK2RheWxTQ3N3ZWFmaWdzUVYwcnVWeTBES2JX?=
 =?utf-8?B?VmE1bmZsWkFJMFprNis5dDdyc3JwM21uc3FpcG8wQWQrMGxSTmc0Yk9VSzFn?=
 =?utf-8?B?c2preXBBc2JyQnRKR0NxS01jMC9sZXcxeEdTZmpsVmlod2ZkRWI3SjZGMjBl?=
 =?utf-8?B?VmwxM1MrdjlhR2pKZzJzN3RqdklwV0NMTzlIYzQ4aTVQaUliTEFTOFV6Z1do?=
 =?utf-8?B?TWZvUEQveEZRSjJkUFdNQm9yOHMyNVREQ1J6L1ZQZkpiYVRLbjRQMzJZM1hj?=
 =?utf-8?B?WVZLU2Q1YmdoOHFreWdCSU96ejAxSWYxbGZZT2ozbENXWlpSOE96bVdJcnow?=
 =?utf-8?B?RjVza3FqMlNBdHVLRFFIWXV3OHY0UzE3dUFQNnJwSWQwVmpSNUtyMjhxcVJM?=
 =?utf-8?B?WWI5cDk0RG9oeG5FZTJpQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 681ff6bf-6ca1-4065-6d14-08d8d824e165
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 18:00:18.6162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+o3stInkRRBCyRs19VAWZz/18/s6fjDTKgVuXfRb2Guh9sWLzggjn9htyJiXAXNegMzdbGMETTajelaAmEHtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 05:10:16PM +0100, Jan Beulich wrote:
> On 23.02.2021 16:39, Boris Ostrovsky wrote:
> > Before I do that though --- what was the conclusion on verbosity
> > control?
> 
> Not sure - afaict the conclusion was that we still don't really
> agree. Roger?

As I said on my reply to Boris, I would really like to have a more
generic way of doing this kind of per-domain verbosity level, but I
don't think it would be fair to ask Boris to implement this. Xen
likely needs a way to print issues with MSRs accesses in 4.15 on a
per-domain basis, so going for a MSR specific solution would be
acceptable given the time frame. I think Boris made a proposal for a
solution on another email, let me go look at that.

Thanks, Roger.

