Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D560F329B2D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 11:58:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92253.174085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH2j2-0004y2-Fo; Tue, 02 Mar 2021 10:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92253.174085; Tue, 02 Mar 2021 10:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH2j2-0004xd-CR; Tue, 02 Mar 2021 10:58:00 +0000
Received: by outflank-mailman (input) for mailman id 92253;
 Tue, 02 Mar 2021 10:57:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IOGE=IA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lH2j0-0004xY-U5
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 10:57:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7040fd48-3aa7-48be-a8be-6d47ac49b06a;
 Tue, 02 Mar 2021 10:57:57 +0000 (UTC)
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
X-Inumbo-ID: 7040fd48-3aa7-48be-a8be-6d47ac49b06a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614682677;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3YiH4boUD9uVzVjax6AS1na6eviDKN8qhkHBZr+wnYE=;
  b=iSy/DSRE+N9z2ueTdHlmbPJLe6ZzOdKNBOfwu7N5IGGxK5hmoPpmMU81
   v/VH1+ej5O9Be3OWLa7KaS/RQlBva3ChjjW335k1emeMd13Zra8AhK5ER
   M1X8cphQePmQYsM3xi94qqkpxZq893N6gzFZQnYruNyDkVo/E8Gs22IGi
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZdLZAyCGI0nirchg8rANmjWaj8RCAyPNC1em6vHuqC1kDut7l6BbvRqnA9lsyrye3WGhUEmzpU
 aNCvpNTAPo6EZ6fZuGkm67/XM79/k+I9uhbSdKF5DjQ7oorOOYiAYWxs9ADUpzWzmcOfP1p/lB
 lrXLrRe6Wj9bSLlgQALBgVPaa9TTpoHy+3bAVN1joQXAcmCtdCRHQ849jjlUrdfJiNe4PUIWjo
 ZVjX++R4WiQ6FJt3cqwWd6UOfSXwIRfB6sYue5hQOdvBCzhUYmbXAJV1J5XtJteaEC6A8N9KNS
 bXQ=
X-SBRS: 5.2
X-MesageID: 38334043
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,216,1610427600"; 
   d="scan'208";a="38334043"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdSt8j6TH/uOCGYw9ayQuhBopBnH6/wS+IuH/gtbbJXEzAP5camwJhq5eWP5PEdeMqAdv02NFV6XHLwGs8oCH48i2KekKJHonjgpIb3nt/i8mJnOBsliQ5MZi7mxf7fB5jE0ul4H5cCnVgoXdD4o2Elb6R+A8ymDBZhJsizYUA/zU6uJ0sI1aPBOGNlKurH7E+dPRnn3mJH9xBIJCduVQ8nfUY1dZ2aHuT3mosYfBNjWtxSn2Ty5+s5hv0czbTTEx87YTdAd98f70DAW/orAxz7UhYqUBHRITQZ5jZpM50cUMV9BkpqhiANAN3xwaFYZ2a1pqDh6ryi6XDFZL7S1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4b9FBabi2Zvy5ESdh9529MReJHNaekB3PL7uFvPI3g=;
 b=X5aP70ckAgOrStnFuZ6v8MMOV+/M7LsIYX7RvPV+JbrAA0Zmx/F9DPa/40PcooLli0TWhRaIk0v3uWk8XQSfq6zKhUvCMFrfPticj07g0LlToqNs/foT3m1nFhEEuYrcH99dSFXx0TTSVc7qKnmbiLAyCz8GqoTnv9z9y1UbkFnQdEzfhl/zkJrtJRL7UurD+Vz4lf3lj8E/2+cj42gLezcbUAVjdjsD1p5TeH4qobsEI33CSMNJ3Om/GFQejUYHChy4mNgdFPlBfF+hXGYQgGfX9LbukG2v6FiI8v8yv4BF3B1aCe7p5772/EYS8G68wuslQDSRseIn4lwdMkr+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4b9FBabi2Zvy5ESdh9529MReJHNaekB3PL7uFvPI3g=;
 b=K84O7HglJRBVJx5yjDu/XPph/mtar4qxMmgC9NansM/i5UiY6UQ3qnvQ+TiObn3R2YskK5pf41TzfrFvut40bZwwBfOKSmncWn2lg0z7LHKQ1r94Lqh1+SDhL0IO67Q0Yb3f8MTGou6t+6xXPK/CokjPZW1nK+dhCVTra2l6rMY=
Date: Tue, 2 Mar 2021 11:57:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
Message-ID: <YD4aKmAaYZ5xdTzP@Air-de-Roger>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <YDzzt1CXau8vKCn1@Air-de-Roger>
 <a0664115-2b36-7a56-2814-bb234fb379cf@suse.com>
 <YD0rtgJgIN2FxEex@Air-de-Roger>
 <9b0a5689-fced-d986-3bfb-9ade47cf3635@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b0a5689-fced-d986-3bfb-9ade47cf3635@suse.com>
X-ClientProxiedBy: AM6P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c2c2c17-5ace-4f25-a64d-08d8dd6a076d
X-MS-TrafficTypeDiagnostic: DM6PR03MB3833:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB38333B7D4C428C0DC4CE59368F999@DM6PR03MB3833.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j2So5KjjKi8jhuNBEeRfQvDyEcq1Bb+Ol0qbhQPwvPt5UfmWOLXqZUjyx+lS9xCzSfcUvlRtPXeVfLCGidrGA+OBncJ7sqVblCM9U24BG4tXb+FGBaOSEYD52Kn+G7Sc1DgNeoau5ZtLoFO07aTIdoGXzT0zRDgI/5QyFJfI782rtkrpuvHoMfDd6BqY2IaqfWID2Qe1OiKR9KaKJKOwv65zqxvS+LKnSyrVeAnJQVUb3sKVPIqenQfjlQ56nXQuBZIZ51k+MylHB1Mevxx26k9ZAjomNqZTJ0X4rxcSJsYCmKwOdTYKcLWRsy5i3j9a1QVKFxI7GsiByX6NElMfLpaNMiA+f3n9GiNoYRPtou9huMACaUScNVNAHZP6MmeaZCmM8srGCW1WEsp9wowVHXT9HOdgw+432/JdddiSmqxahC2yxH2dL5M5tSsutZcZu0u+XChrJSXGvOx5rLcagih3y6Dp2O6lNRWj+gyffmVLDp+we8lr7LgLgehw8oKlOb4MZvge8Os5rB4k4dXA4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(376002)(39860400002)(346002)(366004)(956004)(316002)(8936002)(186003)(16526019)(478600001)(53546011)(86362001)(9686003)(6486002)(5660300002)(2906002)(6496006)(83380400001)(85182001)(66556008)(66476007)(33716001)(8676002)(6916009)(54906003)(4326008)(6666004)(26005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmJlUWwzVkhaNjVQMEtlNTc4cXF1dUs3eXdRdG1CclMrTHdFM1dxM0pUOHc0?=
 =?utf-8?B?UWx3UGlMakZCbzBsd25EODU3dVNnenIvZjZRU1AwTk5kVE1IOTFGcHBPbjMy?=
 =?utf-8?B?TTV0WDJrdWtHSmhNQ1BPaFRBU2dmYXVwWi82TGhCSzVMRHFTVS9iRU5CSUxC?=
 =?utf-8?B?aEN4OFh2V3VSWGVSMlU4dmdtOGNicFNRREEvdzNlTE5MSEhNdDJLWGo1UHZE?=
 =?utf-8?B?VGwxOUlBaFVvQ3ROWW9HNktZeWszRCt5VjgwbW9TSnBKTUQvZFh1WHljcC9L?=
 =?utf-8?B?UlVWU3pYb2dRN2hHSmltVjFMaEwwZnE1cTliVVhMdzMwUHBVY2xBdmxTWVNM?=
 =?utf-8?B?MG5EZXRSVGlmNnE5OHdydG1RYjZIeHpnM080Ump6Ujh1Uno1bUtTSkxhMnU0?=
 =?utf-8?B?MlFnWGpIQW05ejMvZlVkTGdPVEsxVzZsZzZseVRBTUREL0NGUDAwL1BPd0Fz?=
 =?utf-8?B?YXNMUDJiamJ3ZVRxdmcwMFMyZEVGeVZMTml6TWxVQ3ZTa2tHcW5VdDd3TXBr?=
 =?utf-8?B?SWEwaEZEejYreWRJRXdoTXYzMWR6ckkyUHhnQ2VwRUEreXY2TVVHeEd6U1hS?=
 =?utf-8?B?TlZqOTgwYm9uUG9EejRFQVQyK3YxTE1ISXJSaVNqSStySnR1Wmkxemg0SkJD?=
 =?utf-8?B?Y2NCVmZuZ3NISEFLQzZFRnVCYkFHS21GeXlxSVQ1OG5jK284VVErSjZqSWty?=
 =?utf-8?B?WFFFNDlMY3V5cXBMdEF4QmFDdHRtbk8zRnhFOC9VcmVzZUNaRjRKYlVZVjhv?=
 =?utf-8?B?OTkrVTkxQ2FzMXNiWmR3dTd0dHlTQy9BN0RDOUx5R1RUWUhYSXVrMnE5SGlz?=
 =?utf-8?B?bjE4R2tDU2NDeW9EOWtvR2sxdC9jZXRUelExQlNlY25jSnkwdGd2OElWVXoy?=
 =?utf-8?B?Nld3ZXZCekJqY2hGa2d5SlhPMnl5TmZWM0F5TDdlODZlQmZsQXpIcnY5Zm9T?=
 =?utf-8?B?amNTR0hKZ0hXeUgxSEg3TjJXV1dXQm5iRnNXVEdEdUpWT2Zvc1dCeWwrZmxt?=
 =?utf-8?B?MTd4SmpQa25tMGNWNzhCVUhNNEN3Smx2VSt4SGM0U0NJcW53dTI2Y0kxNnMx?=
 =?utf-8?B?eGltL2ptZzFJT1dBWWIzQTV0aElxdXYrREtTZGZUSVZEN3VDM0ppakdLVDBC?=
 =?utf-8?B?aFBZeit6RnZpMFFBdWRFM0lmWWVJWU54anhaeHFVUytUTndQdzJhcVBkekNh?=
 =?utf-8?B?aFJKclYxR2prV3VPRUtMSnNnL0dxTG9FU2pPaGEyVm1jWHFuS28zOFZVWmhl?=
 =?utf-8?B?eHg3RUZrenJvbTZjOFEvN21PdndBV0ljMktXUzFmK3ZqVFlSUTB6ZVpRL3dE?=
 =?utf-8?B?WDI1L3BicEZxZ1FWWUxTb2JRc3NqVzFOOFJ4b0Y2VmhQdlJCMk90Q0ZybUVK?=
 =?utf-8?B?ZGpXRFBvTFh6dVg0K0R2aXNrTjN1dFd2SmlOMTk4TzZUQlRHOEN2NkJhMFNC?=
 =?utf-8?B?LzllUzNCa1BFK2dHb09zOVNCaW1EOFZJSDNzT3VUTnBvTmljMzN2RXJCVFc4?=
 =?utf-8?B?dmt1eUpXMGx1OHZHNkVyMnVOS1Z5UEdBUkMxdWpQdzNXSG0vN1JHWDFSWjF6?=
 =?utf-8?B?NTdHcU5SOTdITkhsMG1xWDUvV2NXcWxqVWI1OUtScnlLVHlzYkNEU0xhcVpy?=
 =?utf-8?B?MUdLZU8ycGdXelRzMUVkUENBMEZyYzI5VmdzQS9PaTlQTVowR1VlajdJbTJK?=
 =?utf-8?B?d1lZQkMyL0RlY0Z6Yk5IMjZQMjVlVGtHd0QzVmdxcU1HQ01hdXkzZ0J1YytQ?=
 =?utf-8?B?clc4S2d0b0kvMWlWM1pxbmxpU3NwSUJtOStqL2QzcDNZdXNSQVRLbTEwYWt2?=
 =?utf-8?B?ZFUvZWN6bFZGM1NwQTdDUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2c2c17-5ace-4f25-a64d-08d8dd6a076d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 10:57:53.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmF0OKbg2pWJ8yCvTm78cFV6AolCNrzgk/r3P4t7aow48X0IyjEDWLQR8OALNTAdvinQHILW3kXXf+crixj8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3833
X-OriginatorOrg: citrix.com

On Tue, Mar 02, 2021 at 10:59:37AM +0100, Jan Beulich wrote:
> On 01.03.2021 19:00, Roger Pau Monné wrote:
> > On Mon, Mar 01, 2021 at 04:14:26PM +0100, Jan Beulich wrote:
> >> On 01.03.2021 15:01, Roger Pau Monné wrote:
> >>> On Mon, Mar 01, 2021 at 09:31:07AM +0100, Jan Beulich wrote:
> >>>> In this case the compiler is recognizing that no valid array indexes
> >>>> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
> >>>> ...)), but oddly enough isn't really consistent about the checking it
> >>>> does (see the code comment).
> >>>
> >>> I assume this is because of the underlying per_cpu access to
> >>> __per_cpu_offset using cpu as the index, in which case wouldn't it be
> >>> better to place the BUG_ON there?
> >>
> >> Not sure, to be honest. It seemed more logical to me to place it
> >> next to where the issue is.
> > 
> > I'm not sure whether I would prefer to place it in per_cpu directly to
> > avoid similar issues popping up in other parts of the code in the
> > future?
> 
> That's going to be a lot of BUG_ON(), and hence a lot of "ud2"
> instances. Not something I'm keen on having. The more that it's
> not the per_cpu() which triggers the warning, but separate
> conditionals allowing the compiler to deduce value ranges of
> variables.

Right. I don't see much other way around this then. Did you check with
clang also?

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

