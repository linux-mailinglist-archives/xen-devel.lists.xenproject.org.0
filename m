Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D23213CF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87827.165036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8Ae-0007br-0N; Mon, 22 Feb 2021 10:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87827.165036; Mon, 22 Feb 2021 10:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8Ad-0007bS-T9; Mon, 22 Feb 2021 10:10:27 +0000
Received: by outflank-mailman (input) for mailman id 87827;
 Mon, 22 Feb 2021 10:10:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lE8Ab-0007bN-Ow
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:10:26 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c657e947-f3b1-4ee2-a534-3b8f909e21cb;
 Mon, 22 Feb 2021 10:10:24 +0000 (UTC)
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
X-Inumbo-ID: c657e947-f3b1-4ee2-a534-3b8f909e21cb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613988624;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SkmEDHbhEloiKXa0cVdsvcT+4iZ7AddyOCLXloeWakI=;
  b=YNNK6oqMPHWjG7audNTfTmCnnpYcBSE6tg/DSQFYYuKCC4QSccIFpihL
   nu8HM/5oGrChe451r8YBGdGoOBDjyLrWR+ATK0mm8H9AqIlq7UhMkExRX
   OQOmizmPHXwEfWmRBoYkZHcoutlyqNMdU+t6zF6epa43kIXhdII56r8F4
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4y5Hl5XxpXt/lYh8cLweGUY8vq5Ckz+EXFhHagFTp59TwNvf60G64oYr73x2mdNMUO0Yooa191
 L23sh8wZhgStQcc+NRD6NTQiaH9WLvNQd5oYGF7psAYd6xKXyp0n9Cj9eUkEIm+MwVDaHHsYBS
 q0qfkwSyjMc9B9tCg1ccBj38cebrr1PpoumdOsbzSxwyRvvTdwAnc5GJDtnhQLZ6U8MD37w7qy
 OfIcxyXZrWpniUU3vLoiwpJzlHdS4iQrhZgUwLjuQ3dGDy+I5uOQWyhX3T7grpGhY6SlBtMPA8
 +po=
X-SBRS: 5.2
X-MesageID: 37718800
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,196,1610427600"; 
   d="scan'208";a="37718800"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtMWGve/Vz4B9/a8sIvCK3qjQU0l+GiPb25J89JRQS3XZs0vvx2b2GxmMxJXJ+4HrwjOKtRIuwmzyS32lnp4V1jsOsZ+icEaEiEHNDsFj9Sqz0KAoWDJr8F60eryfgW7fPYPGN3jhsE/1HsPZwpRTmoaQC4nHr842GadwXrgp3WtPmA68x2J+H7EtEavr53uhMd/FftPb2uFV1cONh8VLu+sf+gzkEXlxR/LmluX5VExuvuwk/mVBjW1CS90G9ZBI02k3HNqH2R+F1ZE7FHPnKZfUkNQdz03RATzciPKc/DVlvkq/E+f1Ve45BaeyholhI1MH21bg6ex58rtKfnjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pqfrxr549WpMuPY429Zzbo+E3Xzkh0J3wI+EMwusg4A=;
 b=jzyslptbbd+MVlf4/Ctoc1mc7Gdyc1VUt916FrWrKeNICjky9AFJmY6LBm05t/DkX8fnmZCuY9YnZqmhFRGFkxBk8CclvbX69qlPJyFpeshUteGMyIzOSPerqffnHgh1mNml2cJrInIEVuRf8hSNlNYhpRxVusj5s4DOvsovJm6YKA894yyNNG11bgTLbpdG+j4BCYFWW+VoH7fncPq6ZKhlSIem1TWYE6gmMqKwMj0vN3BneLwCsxbJLu/7p/2dlr7CdgsC+tjIrMaRahwqVx+yJBEd5Fffs2BI8PdEogWsTU7XWhd31ezG33ZQs28Xskp4X782cyAY74mOiED/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pqfrxr549WpMuPY429Zzbo+E3Xzkh0J3wI+EMwusg4A=;
 b=OQH0ptxZimFraXVdZxw50Dq7BE87hhjYyADwrUluZaO+sam9vYfT3m3KsoxI15tjUG0ttIeM2B4D20sK1EuD7cgKsVqZ9YGW4FQM2KYTjavErsdmt2uX2Z/7msIZgNL4mFdaDJAes8EfaSplr/ddZ108apxOWbHzN4M/0dEoah4=
Date: Mon, 22 Feb 2021 11:09:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, "Julien
 Grall" <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page
Message-ID: <YDOC2ACTf0bmryG1@Air-de-Roger>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
 <dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
 <24623.61403.440917.434@mariner.uk.xensource.com>
 <dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
X-ClientProxiedBy: PR3P193CA0011.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef236b18-9573-4525-404e-08d8d71a102a
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB284261E208E7F05124BD1E1F8F819@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PXmUSd5YIdCCL7y3gFUKfXcKUbZq84zN/tafkmKmH+xlqU1yimMwH3a1rNpif4lK+v4sc4Zv8Drpe6YaMQyo3cvL7h44MU64aVyRRVKnKxmepD7QhE4aQY640F631MYDlSBNrzlf3TZaePznZKp0gzEkktnWGunm2OLOk5n8jwggQVcAgNnDMul+4SjCFC71JWvpGHjiNB5JjCXZzk7fe7X1UV1WzBMAmZrPDokK4zaBb2hNrmCAvUpwH6c5ZXgfO1USH1ezAGvV7luZRj/RZMg/1E1eStwVvEvZwRJqWEKH9LbOBSgYElO5LjcriGPcM/3quo13b4V0upe6nHQF7l4fZgLpFUmnLsw0AOekX7vREJ5lSH8pnX8cYLwazpBQQisHoFh01WfXn5UmaE4lj+UI+Q+ZHihy201lSrufrswDO8W3NCMOmw3NXCk4vFVS8uhB6bgZbQ7Q5Cyja0FMgdtqf5NquB9CnpefOro8YH24yrvfjEJ1vHzToah8WwYe1XrLsDQuGnGoH7UxatnMwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(136003)(366004)(396003)(346002)(376002)(186003)(6486002)(83380400001)(8936002)(5660300002)(16526019)(8676002)(53546011)(26005)(6916009)(66556008)(66476007)(6496006)(33716001)(66946007)(9686003)(85182001)(316002)(54906003)(86362001)(478600001)(4326008)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHNJYVdmWlJydk5NbnFiSW9aMmcvZXVOMnNkb3dTSWNRcU9Qd08vUis0RC80?=
 =?utf-8?B?WU9Iak1UbUpkK0VLQ2N4NWFPR3NXNjFpZDJZaXBNejlBbmdnanlDRUJKanZJ?=
 =?utf-8?B?UldMb09oNUc4eWZNU0wyVXR2M0E5ZG4yeEEwL0R2eU45enF3TlBTbDQ5ZXdQ?=
 =?utf-8?B?Szl3aTF6SjFzSTA0TWJPbmIvejRzZFFzYlVGRDlxbXpIdUoxOUhNY2ZJRTEr?=
 =?utf-8?B?YVU2L0pKeDJDNmJuQ2FldUVnbFdjNURjUm9pbHNVU01BcUh6dE04UWVxNXdP?=
 =?utf-8?B?d0xNZE1HcUowdTIrQzFldk1TTTRnMW1QUDBlQUVaTTBQa0diN080d05LNUFM?=
 =?utf-8?B?L3hyMzUwR1lCNmxyenB1WUZGWnJ2WFE5N0phZ0hsdkdOVDZoMGR1Q2pmNlhL?=
 =?utf-8?B?cWN5VFZoQ1ZzTk5HcWRUM2VmUWYxbDhVRGRxcGhFYjhtcFZJR3hjK1lUL3R4?=
 =?utf-8?B?L1pUQjVmSjl1MlMyQjE3cHNqS0tkTkFuZHUzYmVOM2VyNC9tOVkzTmI4bEIy?=
 =?utf-8?B?VHpITDlkSlZuQjBzNWlxaGtuS1V6S3NHYzVoVFAwUGxtdVZtQlB2bjk1UTA5?=
 =?utf-8?B?cXUrY21tVEJrRmhhclRyMjZpUjlxOWxKYzRtZENrOFhWZ2NjR0dBby8xQ0ta?=
 =?utf-8?B?ZkdWU3Uzbm15R1QvRm8zaEpKWDFwd3NSM3VMYVdGODBWWThyMUV3Vy9XQ3g2?=
 =?utf-8?B?elRkSy94Z21kenEzM0tIekhlazVEa2hXUFNCeXFvK0NUREtndUZHQnQ3TVZS?=
 =?utf-8?B?RStFWEZOYnlESHQ3SnhMWEdKdGE0Sm9LcnA5WjllUGxDa05PeWRna05XOWJ4?=
 =?utf-8?B?RitCSHM3azhGWENBTEZ0Qlg3RUpYZXVIb2UreSthUlUvV0hZaU9rbG9kVjNB?=
 =?utf-8?B?WjMvQytSVzh5a0FERThib0xaRk50YnVDVDdNNFlJUUhNV0tUb1BNVW1kQ25p?=
 =?utf-8?B?T1BhK1k2V1ZRbHNPR080bi9FS0p6YVNubTViRHFTVmszYkZRbzBhTHVVVXpL?=
 =?utf-8?B?ZEtnb2oyNkMyTzhqYXBqNUVoQy9vaGhOT2xHOUh5c3hvaUV4VFg0WVdWRkNj?=
 =?utf-8?B?QStNalJRR1NDdHA3MHVFbW0vU0s2OHZuZXl3a2RheXRYWDdYcVZoK3Zabnlj?=
 =?utf-8?B?MGFJZS90U1pHUUx6Yy9JVjN1c1NPSWI2amFsb1JrTEt3bFpab0hGbTZIc1VZ?=
 =?utf-8?B?ZnU3MExNV2puY2wva3Jla2RSbzExWXpsTkdWM3g5akFtTmw5Q3RoWmpMd1dr?=
 =?utf-8?B?OHkyQWsvbjlCMEd4RGRIYmpsSXptNjJKeFRPYmRVOHN3b0t6bEJhb0FyUlJq?=
 =?utf-8?B?U0x0NVZ3RERqR0ZpdVUyeEFSWUFPckVVQWZNdTNCMC9XUy9JSExkNG1lY3Ro?=
 =?utf-8?B?Ry9rV1VDWnpMVXlSemdaSGtpZExqUFY5bXZ3RW1NN3grK1JPMVFtWnRwSXMz?=
 =?utf-8?B?YzdhMTVzdCtQTHh5OTNkODlBeTV6Q0gvSGIwY05tV3VuQmVuY25FRWNrMzlP?=
 =?utf-8?B?TzZIdklzZHA3ak1rUFFiSnhIbnoyZ0NwQVNTbjJpQkk4SWk2UDZZaUV1dmdu?=
 =?utf-8?B?L0dwbzR0TFFCK2RpYlZiOVRjSHA4MEl5Q0c2dDlRd2U0MUR6TlUyYldQb0tQ?=
 =?utf-8?B?ZlVhOWNYb1JUUTVtMEFYTlJqOWJWRkk0ekU1T3BrS2p5dVpZMnNxMmlxRjR5?=
 =?utf-8?B?aGR0dVpPYkRSYWZLZnlNNEU0dmpLbHBFb3VOYXVKc2IwSVVoMTN3QmJFeFFt?=
 =?utf-8?Q?L6Ye/q4eCQ66VA+MFPnWpfqU+bcdVMiWaxu1cjx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef236b18-9573-4525-404e-08d8d71a102a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 10:10:21.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Xs4jrPm2gLIgF6xirjxu0s91c3JAxBN4tgGm59iybdNCVDPyQ3VQBmTGBKoIouNsQI+XXTmIsfjJMyOL2Wg/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

On Mon, Feb 22, 2021 at 08:51:59AM +0100, Jan Beulich wrote:
> On 19.02.2021 18:05, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH v2] VMX: use a single, global APIC access page"):
> >> While this patch was triggered not just by Julien's observation of
> >> the early p2m insertion being a problem, but also many earlier
> >> times of running into this odd code, it is - especially at this
> >> stage - perhaps a possible option to split the change into just
> >> the movement of the set_mmio_p2m_entry() invocation and all the
> >> rest, in order to defer that rest until after 4.15.
> > 
> > I infer that this contains a bugfix, but perhaps other
> > changes/improvements too.
> > 
> > George, I think you're our expert on this refcounting stuff - what do
> > you think of this ?
> > 
> > I guess my key question is whether this change will introduce risk by
> > messing with the complex refcounting machineryt - or remove it by
> > removing an interaction with the refcounting.
> 
> If anything, then the latter, but largely neither afaict - there's no
> change in this regard here at all as far as the guest could affect
> behavior, due to the page getting inserted as p2m_mmio_direct, and
> guest_remove_page() having
> 
>     if ( p2mt == p2m_mmio_direct )
>     {
>         rc = clear_mmio_p2m_entry(d, gmfn, mfn, PAGE_ORDER_4K);
>         goto out_put_gfn;
>     }
> 
> before any refcounting logic is reached. The removal of interaction
> is because now the page doesn't get associated with a domain (and
> hence doesn't become subject to refcounting) at all.
> 
> The risk of the change stems from going from using a per-domain
> page to using a single, system-wide one, which indeed was the subject
> of v1 discussion. In any event the consideration towards splitting
> the change would cover either concern. Perhaps I should really do so
> and submit as v3 ...

I agree it would be less risky to keep using a per-domain page, and
switch to a global one after the release. From the discussion in v1 I
don't think we where able to spot any specific issues apart from
guests possibly being able to access shared data in this page from
passthrough devices. I would at least feel more confortable with
that approach given the point we are in the release process.

Thanks, Roger.

