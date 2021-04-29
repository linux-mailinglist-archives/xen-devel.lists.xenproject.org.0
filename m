Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D536EAD8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 14:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119963.226815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc65b-0006b9-4R; Thu, 29 Apr 2021 12:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119963.226815; Thu, 29 Apr 2021 12:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc65b-0006aj-0k; Thu, 29 Apr 2021 12:48:19 +0000
Received: by outflank-mailman (input) for mailman id 119963;
 Thu, 29 Apr 2021 12:48:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc65Z-0006ac-H5
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 12:48:17 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1b68935-dde3-424f-94fe-f24db5f26077;
 Thu, 29 Apr 2021 12:48:16 +0000 (UTC)
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
X-Inumbo-ID: a1b68935-dde3-424f-94fe-f24db5f26077
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619700496;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uofni5z3KVX9TkIOfn3NPOXcBG80KY35TFOrY9zykZY=;
  b=fsWdeuKus39gQeqxClA92Sor5BO5YepV5L6jXwP/uzUrPx0T5N78Ac0a
   eg36blHaXlp25mitqtUAwbvg/qD+zSeErcFrbKSncvjFuQer93GbrUf9G
   /30cAMx3UuIjY5pUoqqhqTHakkTMw0rNMGVbkC6yGN87utmaj8kbTEwUe
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZRCgqkzlZgsf0qw6zHWzCXlOtyxfwNQhB80hSHLy0oE7eNwHKCODsjghKKUuf2seaLSpdfN///
 iLR8J0OnoY+7/0Hi2MK857pRARE1bfGJ6rHYIbkZnCaW7F1m8aEuQ/SwiFG1TW9c3ZDj2RhjSv
 3+5g2a8bJ54BXPT6vx/NV58awiq9xleAMxvbBZg57KucXr5SVwJMJ0gD1bHCQz5KKI9shrjTOL
 8ms0m9Z+jIOxaQTHFJzkv36EsYi+2S/II/Z6yiC+j2LI0C67cd0O8w4hPC73Vswlom6sPB/X2u
 0fo=
X-SBRS: 5.1
X-MesageID: 42511731
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:86okcKM9l5ou6cBcTg2jsMiAIKoaSvp033AA0UdtRRtJNvGJjs
 zGppgm/DL9lTp5YhsdsP+aPq3oexPh3LpUxaVUAru4RgnhvwKTQ71KyYf52TXvF2nf24dmpM
 RdWpNzAtHxElR25PySiGLUL/8b3NKF/Kq07N2x815RS2hRCp1I3kNBEQCcHVRxRA5aQaU4D4
 aHovVKvCChf3N/VLXYOkU4
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="42511731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKEuqyd6E7wImRZHcnV/ZuY6UP/uBgJnvDb8FFSwbGm/H9b7RPGPmjiNAILH0tsePQqnJRxGHMkuvOVPlLPHt/Csj7IQnd/KqG1rg+POZDaWqkYb465JinFZVyexzwivmsfrAEOUDNMna55bNSAbAwMu68K+/PtznBfqW6XEqVIXtRMcdHL577xk218kL75R/XJmyT1QIlY8bvVH+bLIj1t4eWrwT8A2iDlxtkK0d0pwdvnO+mewexPG1LY+bmUGz5DjgEolGAChSKcQ4cEZ6bZO4cQ0RmDucxCj/KK/qIlKPi+Hz0upP9qH60plyl6vVhYF7rCSFTUE9q/sLsQW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRthqBanK0WJd1E4h2/7VSBTh9DXU++Z91NzpJ9oJvQ=;
 b=S5mvZ36VsTozO7OInGMHzMm3oz5mhVCZPEDliuD4tvD3TFifPamgRhBzYidpuFGlZE5rhHdCtdRjx8bBI1AT1Yt0XOmu/f9Z+4SD9YvJAnZRyEeO5T0jIPUiujxgC6rq/wSPTk7Rg95GpkTwSLLOzp0qkRgJ4JLIhNZugjkaV0KpdxORFLiv9lfzVWEAZDH7+BtmAi+FFg99CNVu7IxyC0+9HBqazZbQxQrh7WCxCP83RGrTCxTuIwN8AHqM+RM92k2EC8UA8Fs9uERE8zxw9p/6fUIsnA+PFxGEFRh5WfrU2ZGDf7N/sj4LMqBKXPynzr/ETEaEHgKYMzFcoIVGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRthqBanK0WJd1E4h2/7VSBTh9DXU++Z91NzpJ9oJvQ=;
 b=tktJ89VEBpsfIwCgeBIZIA5uyCZl2oF3Ru7CwNSJn+IopOX3KrqTsJ9xX1kf1NryQuux1DLTMExfry3XgojARsP3/ZOyDNXLOpt0CZuTmAlOVQ8DiR8fiDjktJSpvM8R25POUnn0MuxkUGTC14fjfCf7YYzhtXflv0GtLVzrtvw=
Date: Thu, 29 Apr 2021 14:48:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
Message-ID: <YIqrAdzcR6KM1b2u@Air-de-Roger>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
 <YH79ZxNRhW24jmUS@Air-de-Roger>
 <88819ae1-d021-9192-4be7-a70064f23feb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88819ae1-d021-9192-4be7-a70064f23feb@suse.com>
X-ClientProxiedBy: PAZP264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c3fc877-eb44-4416-7342-08d90b0d0c5b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2969DCEE06A57A0A13F0F9868F5F9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRLwfHruUsZL9TGbUxDuCYf8KcVp9f1nG5Eo+3JXtWMhhM2HqOiA5IIZYaxL9mysg1dVcknTDQhySbD/wU7hOR2hQadc1ccqEl4W4POQw7MRBkcjssEr5P5ygRXudffE1ioBUYMxgjzvfq5Mb5PDgoRm5dAE6UiHU74xIh1JKFEkwEKIwuC01qlTw61wOzSmlXdZxL9LxxwtQfQ0l0fJ6XnnlLEHx84x/xFblN7vRqffIcf1+cwSPtj8vZPHS0AZvsSLZ5b0FLPyX3ODAT5A/fvEvJ2aWhiXtYmVtHeNZNJLhF12fHg+hOEioPlyBJGbJsbqd++NgNaLEkRzH8V2MTs+g7Ehpaiv3wdF517FXG3B84zkplSB6o8WnbwyYYnN7VwEmMVKfO6k8WpqnodE6MZlw0qn7FvHyYyZEjRy4Afr6ZaVAtgTmdFjW5do3sd1nGAn5I+R4tiZJYu2OYhjdu3vTZre2Ta76/bvghP/qLkgfc7zANL4Eq1t6L+b7+3XGR7kHOkVOzM7CermtrrTFKT4HylCIKGWbUPsY7PDxLBUqx4QW+RGkigh0q+vU8vRPHAc5u0TcOdJfCLOIDOWE6ZBYfN0LEvOVJFcg6Nf/bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(5660300002)(8676002)(2906002)(478600001)(956004)(86362001)(83380400001)(66476007)(8936002)(16526019)(38100700002)(26005)(6916009)(6486002)(66556008)(6666004)(66946007)(9686003)(186003)(33716001)(54906003)(316002)(85182001)(53546011)(4326008)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmtvQVRnZHh5Z09tT2xjaWFkRDVmdXJRNVNjbCtIWXlVTzkvWnRVZDd2Y3ll?=
 =?utf-8?B?UTFPNWVRZnV2ZWFjV1V5dDA2alo1R3hqOHRUbTg4MWhEdEwwRFZ6TEFRMnVT?=
 =?utf-8?B?VDdoeCtZTjR1VXQ4Ykw2RDB1R3kwZUh6OWIvTWMxNzhtanlSbUVGckczeStF?=
 =?utf-8?B?R2RDQ2lSeWpvUHJrclJuVkh1UmZMZXhCYTg4Q2ZMZnB4aHplamY4RXpoU2FM?=
 =?utf-8?B?TGRXc0ZrR1g1cWU1bEVZY1dLMmdVWmZhNFdZSDhRVUNicmxma05ybHRZVGJo?=
 =?utf-8?B?MVRRTWpCbC9SWUY1TFpmM3pZSFNkVkNKWThpb3VoZmdtc2NzVFFKeXlQV2RG?=
 =?utf-8?B?TnRyVlh3a0JabDFzM2RBcmlYYlZ3UlJDNE53YkQ1L0ZjQkp0cms3WjFxSVBx?=
 =?utf-8?B?U0p5RmxIdUJiejVSR28vejdZV2IyR2t6RlE2T25Ta21KQXdOMnJFejl1RkFu?=
 =?utf-8?B?MURNR1FVcjgwL203Ni9UVzRwWDRkVG5jL2U0bkNTdWVHeHA1akJJUVBNZWl6?=
 =?utf-8?B?Yms4WUlsMGJlZGt5YTI1QlVjbFVSRytRMml0eTA5K2JVU0RSQkN3SXJ5dzU5?=
 =?utf-8?B?dGl6NE5MTmo4Zjc5TVhSaEludGlHc3ByZkhaK2MrUmptUkpLSkZTZTVZeXV0?=
 =?utf-8?B?WXh2Z0kwVGtvSjZkZUVTTWhhbjRza1VVa20xWU5jOURMbTJneTNlU2phdUR0?=
 =?utf-8?B?MVJKejdmdUpyYkllQ0RxZWljc2UvUkhwa090S0U3MGNqK3pPdEFhaXpuR1JG?=
 =?utf-8?B?VXpKSUVWaEhWVW5YbjB5N3FNazRBZlFPTVpDdTNOTzRYb1VPVDl6ZDRaYlg2?=
 =?utf-8?B?N3VwWjZyUk9Ob0xEL2ZydTlyRWNaNjJyQUZCNnpoZEowS0VwdXgwRWNvQzRl?=
 =?utf-8?B?NmFsdHQwVEo4eitCMWN3Nmd0YlJYeUFCMVJua211T0FNbXRQVi9GRjAwUU01?=
 =?utf-8?B?UjQ5WmhVald6Rm93SExTY1hoZlpuNU5QQ05QUGJuTy9tbURFbzlKVWppQ3Y5?=
 =?utf-8?B?K2xUd2QvMmM5QUV3SUVVYUpDYStBNGJtTFZZVitsclZ5YW5ZM2o2TDNHYnFV?=
 =?utf-8?B?eStYRjFPSFhKcEtEbSs1dVJLNTJEZUJUMXNNZmlYU0oxVTZuQUZIaXF6a3d6?=
 =?utf-8?B?Z1dTYW5RZTBSRmNqMFJyUTQ3RHN0cHpLRVYwNEU4dUhWMy9XRmtoL0Y3TkxL?=
 =?utf-8?B?b1lWTkgzRFNZeXNTM3Q5N1F5TG5KQlhQR1lBbHVMNDN0dEdqNXBOcjVtTGQw?=
 =?utf-8?B?dGJldG9xRmNXUlhqUDVaUWpzT2FXTmxocjBwZVB1aEVSd01valBZSjhtcVNE?=
 =?utf-8?B?aGtMYnYxbTBWVWFsdC9VMCtWaHpLL3VLUzdYL0UreStDS2lsQm10QXN1R21a?=
 =?utf-8?B?VnMxSWo2TFB3eENDcUN3OW9zM2ZheFh1TVkwWC91TnMwaTJqWDRYMkpJSU9q?=
 =?utf-8?B?OHRUZWtRZHM5Ull2WGtLSlpjSGVrTVpIaWRoWk5tQTJlazZxZzZjZWNxaVFR?=
 =?utf-8?B?SVNZR0kxbTJURHBGS0RWNi9zNmVSMGlCOGpYK3loemhLSzUxbnRwRDBwcHcz?=
 =?utf-8?B?NWlBb2lEZkN3VmNvSDZId1MvK0FaL0lFaGhTaVRGd3ZxUTU1N29pS0UzbTZ5?=
 =?utf-8?B?anJ1dmxLUDdsZmhCWXJCNTVPSi9zUERCQklkbi9qT0h6YSt5TG8rT3ZmRnM0?=
 =?utf-8?B?SWxPZ0puZEJqN2FaZWpiNVE2Sng3TXUrZXltMW4vUFQrVjBtNExUUElTUU81?=
 =?utf-8?Q?uXNOx2CVd4NieqGBW4md2A1AWcWA4ApeuyDEcDz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3fc877-eb44-4416-7342-08d90b0d0c5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 12:48:12.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL1HDg6/eC78DLzO+4wt/+DAScYxQa2BLmjjmJvq4YdcSjtfheu2kdLfR9ZjaypGD1M4VBb8whuHtR5ZfPkkYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 12:06:34PM +0200, Jan Beulich wrote:
> On 20.04.2021 18:12, Roger Pau Monné wrote:
> > On Thu, Apr 01, 2021 at 11:55:10AM +0200, Jan Beulich wrote:
> >> Reading the platform timer isn't cheap, so we'd better avoid it when the
> >> resulting value is of no interest to anyone.
> >>
> >> The consumer of master_stime, obtained by
> >> time_calibration_{std,tsc}_rendezvous() and propagated through
> >> this_cpu(cpu_calibration), is local_time_calibration(). With
> >> CONSTANT_TSC the latter function uses an early exit path, which doesn't
> >> explicitly use the field. While this_cpu(cpu_calibration) (including the
> >> master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
> >> path, both structures' fields get consumed only by the !CONSTANT_TSC
> >> logic of the function.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v4: New.
> >> ---
> >> I realize there's some risk associated with potential new uses of the
> >> field down the road. What would people think about compiling time.c a
> >> 2nd time into a dummy object file, with a conditional enabled to force
> >> assuming CONSTANT_TSC, and with that conditional used to suppress
> >> presence of the field as well as all audited used of it (i.e. in
> >> particular that large part of local_time_calibration())? Unexpected new
> >> users of the field would then cause build time errors.
> > 
> > Wouldn't that add quite a lot of churn to the file itself in the form
> > of pre-processor conditionals?
> 
> Possibly - I didn't try yet, simply because of fearing this might
> not be liked even without presenting it in patch form.
> 
> > Could we instead set master_stime to an invalid value that would make
> > the consumers explode somehow?
> 
> No idea whether there is any such "reliable" value.
> 
> > I know there might be new consumers, but those should be able to
> > figure whether the value is sane by looking at the existing ones.
> 
> This could be the hope, yes. But the effort of auditing the code to
> confirm the potential of optimizing this (after vaguely getting the
> impression there might be room) was non-negligible (in fact I did
> three runs just to be really certain). This in particular means
> that I'm in no way certain that looking at existing consumers would
> point out the possible pitfall.
> 
> > Also, since this is only done on the BSP on the last iteration I
> > wonder if it really makes such a difference performance-wise to
> > warrant all this trouble.
> 
> By "all this trouble", do you mean the outlined further steps or
> the patch itself?

Yes, either the further steps or the fact that we would have to be
careful to not introduce new users of master_stime that expect it to
be set when CONSTANT_TSC is true.

> In the latter case, while it's only the BSP to
> read the value, all other CPUs are waiting for the BSP to get its
> part done. So the extra time it takes to read the platform clock
> affects the overall duration of the rendezvous, and hence the time
> not "usefully" spent by _all_ of the CPUs.

Right, but that's only during the time rendezvous, which doesn't
happen that often. And I guess that just the rendezvous of all CPUs is
biggest hit in terms of performance.

While I don't think I would have done the work myself, I guess there's
no reason to block it.

In any case I would prefer if such performance related changes come
with some proof that they do indeed make a difference, or else we
might just be making the code more complicated for no concrete
performance benefit.

Thanks, Roger.

