Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABFD32302C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 19:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89044.167452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc1H-0001g5-7y; Tue, 23 Feb 2021 18:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89044.167452; Tue, 23 Feb 2021 18:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEc1H-0001fg-4U; Tue, 23 Feb 2021 18:02:47 +0000
Received: by outflank-mailman (input) for mailman id 89044;
 Tue, 23 Feb 2021 18:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEc1G-0001fO-0R
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 18:02:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 459a4017-5390-4df5-bcde-c6c7e715c885;
 Tue, 23 Feb 2021 18:02:45 +0000 (UTC)
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
X-Inumbo-ID: 459a4017-5390-4df5-bcde-c6c7e715c885
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614103365;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GpJR0TkEJWV1cw5g+bnSVakPaumVAn7676LSPUruwrE=;
  b=aFPoePWDfFux1IA+WsXYd3bXQgdOBkwh9vrSUHvKvbM7PpPmPYVJXyI1
   NBqDAtqwKsgy+jarOmjWMraJr7/YAMLCX9dYYsm/63B08Y42idoWcMwip
   t6NtFOqrkHiI4akq7FEF++iEmV+dU8CDDYKAZwQoazFhkb/MgZooLdhpB
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ghJ0LMW93T0ifyFrWdGQRyUzJ7uhp4XFvy+wIFGUJumOtySwv0PMW6qvzkLp3yxMW18JDWz/EY
 freL9mkA9aeWXa8zJbuqC1YY8mmp7+86AsMFlDoxUADwHoAMMHAJ1RYp/hc/UakD+6RK0uks8Q
 bWlNz368a2KuMlEMIp9Hu2Bg7LtvByu35t7OgUBOjXSSjIoWHa4t8YcHPFwYxASItCUAbriiUV
 hzkYuZdFvNAXM/aW2dTqhdlKLQQroq6W45r7BSPR+zK6WF5NUwN6gn6J4NMRi+tDpZvgwYMzL7
 mrw=
X-SBRS: 5.2
X-MesageID: 39241038
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="39241038"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Diqc2y/9XiiJ4n2zEokzojHCY8Hfm1u3kavDqsE5UjYJwaOHuL5QI6LNgkbd6khizf92HPLfU5AL6TC7WbYE+3pq/RPb/w2M+12i2XZVQfN0ZcN8n3/9ASZu8thB/ONVaompceWEUBzGYnC6hlk5K5ABGaM+8hD1Q100VcVf8ric5cs1vsbDowGLR+3PtA5FnVnUcVCBY356poj4AR35Qv4eM3usebVh27ZHH1QtE5xtoAIpyMTiUnZzVQZgd5qaIrDScouZPe4Pui7l7C23L0+DjIW2j6u5EGPSBIRLsMyR2PoD82w0b3LvO/7jAt7sad0VqDD+QXvyvpCRU0bCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0/Z9e88+p8B4E8ib4HiG4eVCKTuEgjgJnd6RaqIKfA=;
 b=UZ1QoB5VfHSjoYXEqHYVr988+C2O8PNUj5Lpur3gTI+Y/O5YXYecDOhb0LADgolVF5X7cubkvcncpo7MWm+7/veLmeOM6QzqKpWA5vM6TczI3XxhqTvyHQh+jHw8uhbZ8NasNqUmukAVLnm62eNhQMCX4xoFi9ugDU/PR0J4U9VxYj7wlYY5HBZLnYgTTiUbNcU1YT4P/97QOLlc4Wm2OHPJ3c6clYcuNW2Hg50RvXnserN0WsVQFVw+6PlJvNGd+yWeeZZ54KtdCgaz8QZVx25Oad6aAMbJRXX16nA1OOtFQHUI7vQBgyG0LYHmogJoF45Ia/iM3G0+E9+q2DnjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0/Z9e88+p8B4E8ib4HiG4eVCKTuEgjgJnd6RaqIKfA=;
 b=fyN/LSBJGOsR+YW+YkxOmsZceb+PeUii8wnaSMD4k8yfNb6hTfOA1DlxbT24aIxIlRMFsYgcKA6Oll/QUOeaMhSYpVy1kTXzCAJEyJx/ikISj21HxP+/aEyVVrRpBuA985rtTHGgnA72vTlQXuWQugYZLxcRee1kk9fLUjHILsk=
Date: Tue, 23 Feb 2021 19:02:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Jan Beulich <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/4] x86: Introduce MSR_UNHANDLED
Message-ID: <YDVDNtd4n8zV7T6J@Air-de-Roger>
References: <YDOQvU1h8zpOv5PH@Air-de-Roger>
 <ce2ef7a3-0583-ffff-182a-0ab078f45b82@oracle.com>
 <307a4765-1c54-63fd-b3fb-ecb47ba3dbca@suse.com>
 <YDTMIW5vBe0IncVR@Air-de-Roger>
 <2744f277-06fb-e49f-2023-0ec6175259dd@suse.com>
 <YDTyScmud26aiaMi@Air-de-Roger>
 <172dfcab-9366-47f0-9c56-2202a8b7a7db@suse.com>
 <3ae19e76-2543-28f4-9c7f-697ccf9ed202@oracle.com>
 <YDUpF8gf6fbm4ouQ@Air-de-Roger>
 <a49b03dd-19c5-5df1-81a0-0d8d9e84156b@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a49b03dd-19c5-5df1-81a0-0d8d9e84156b@oracle.com>
X-ClientProxiedBy: MRXP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bcbed88-34e1-42a0-3334-08d8d825335e
X-MS-TrafficTypeDiagnostic: DM6PR03MB5354:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB535437C1C349F35D98D399A48F809@DM6PR03MB5354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZyLLIOuDUHVS0Z9tN+eKWpBYHOf8waZHd1IfSlgXsZceYdd7kX7z+UliPcAjqCGDq0MtoapidewQ+BdNJZ8cynaZtBmyat/zA1e7hJBYorvuUZEFtxvQ58+1VDPjPHrnsYAGBJAIEZS4c5sIDGJ1BSw2lUYHhlNmk84Gb8ipywHF3zYUUQylrOGmHTNcKgFuNz6biGoxuyirSFC6RX8CSQtIiz9P+6D2eaaFGfOwBUyJEOT79+COKtZshkjVaK4eNLpcJpozvK3ZlkU1Ge5Hp3KS0c/yQwMQiDgLLgXCn4QdZ3y7VfH++p2HctuSVYwwJYX3i81TnJME1h/QdDmacEMg1lsy+sWOEmAzwF7qCFVaZ0K+QYHDNy2y/bGi4OLDmn+sYk4/ibdV20R7gOsPFyp1F4lzbqWG7rNQDQcUXn0uLY46FbYjtPqBWNsyn/XDDJeIpheO0IN7gHlhEzL+VYdw+Koe877UIV3FEAqMXkf8msFQaFVynzRV5dFtPBM3midxN9WR12nx3afrF+X6AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(366004)(39860400002)(396003)(136003)(53546011)(6496006)(316002)(478600001)(8936002)(66556008)(4326008)(956004)(85182001)(66946007)(6486002)(5660300002)(16526019)(6666004)(4744005)(26005)(8676002)(186003)(33716001)(6916009)(66476007)(9686003)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?clhFMS9yRTkvUUIxSkZBWXFsaXc4aWtia1I5MUhPdHM5S3VPcE9rYTNNOXhl?=
 =?utf-8?B?cCtIRlAwV1dmVitESkZ5QXJEUElZRi9pamk1a0NtRE5pRnp4Uzlsb0FYK28x?=
 =?utf-8?B?RTRaYi9PNnVUS3ZXYzVwOXNSU2NBNDVTV1Y1U0FsU3lPSVJ5aEpFY0ptaEJQ?=
 =?utf-8?B?amVvVUhpSkpRL3ZRYjZNWDVjMFlGQjlwMnhmVUoyWmFocTBHZ2xidlpEdkkw?=
 =?utf-8?B?SWdNUDZoczdHbW5WcU5NWm8wQ1hKNUFSTzRJR01QUzQzWXdZeERvZE9VZzVh?=
 =?utf-8?B?ZkxKRVFNWTdHbWJha1kwQmp5QWtwZmRkMFNxaUhocVRXeEV5NlJJWjdFNThF?=
 =?utf-8?B?ellIR3dianBnYlkzUk91RW56MW5UZyt3TmNBb3VZekpzR2ZQUjIzYXdZeEY0?=
 =?utf-8?B?KzZBSXB3SUVlb0pSWkdvNzI3VlRJSmlVV05ISStRa0p1bFlqWlJOeUtzenJL?=
 =?utf-8?B?QlNqcUlLU1lNdXEzTmRSdlM4dDZOUThsc2lSZG1ldVpublVUV2JyMFFBRG1J?=
 =?utf-8?B?czhXRDlwTi84TDlJclNCMlByQkorMGpkL2FqNzh2RENPZm1Nb1FZNEQrUDFL?=
 =?utf-8?B?RHRYR1REVzNORVhubll0ZWZCRnRmcVUvLzgxdldmUks1Smk2REtIMFBBZTY3?=
 =?utf-8?B?SWFGT1pYSE1DbmhLRXFhNk1sdFFCWTdGTFpWYkQ4bUlkalN0aU01d2tnamtw?=
 =?utf-8?B?Uy9yRTR5MWl5eHFwRzY2YVRKRGkrWExwUWplL2l1UGk2MjNlNThvdll2dzNG?=
 =?utf-8?B?RlBIM0ZGaFlPOXF4bEpFWkVFdW9YNjF2Mm9FWm5jejJGWHBCVXloSE5hOXJz?=
 =?utf-8?B?NmtJMUVxWmRMU01zZlhWcXIzK29HRGJUdmVuNExRNG92U0dQaFY5emJBVG1u?=
 =?utf-8?B?TDhvSlhvcmdUVkViWmIrT1k5ZjkySll5VXVpMGMrQVVOU0ZNWTBuVlpubi95?=
 =?utf-8?B?Z0R4QTZnRk8yZXBFZFZDeWFnM2hsVCtVNC9zdGYrOFA3djNXc010RVRpMmta?=
 =?utf-8?B?SUJtSDVrUUFQUlpmaFFwcXFrd1pESVRSU055VC9QNjE3blRoZHNwMWRQT2o3?=
 =?utf-8?B?Y1kvanhtUGF0eVFhN2ZncjNxdkRPaUhzZkdROWR1dzhlRTNXenl2b3Iwb0xI?=
 =?utf-8?B?K2F5ZU9Yd1ZBblhFempvTlpQZ2VMS3N5bFNPdjFpRVpKV0s5QVdJNTJhekww?=
 =?utf-8?B?ZWxDSTUwZWlsSENUTGNDREphNE9YYXJoQUI3Y3VGOXNZbjdhU3JEZXdKTlBi?=
 =?utf-8?B?QTFtbG1sZEp6cVFBTG5Gdm51Z3JCZVozcVZpNzkyaTJqeEh3RjRvK2dqZ3VQ?=
 =?utf-8?B?emxiek5JRFF4cXVMTDllb2c0ZVlEcVhvUWtGSXRVRUdIcC9DR0Fucm1mWHh1?=
 =?utf-8?B?bmN3VWEvMnJyQ0ZwQXVWMGRiOHQwSnhFdWpVejlWaHVjSmlFU280M0d1eVdT?=
 =?utf-8?B?QzQwN1czc0UwOWwzbXNGUUtMZkVVNnkzS2lqVVpNeXQ5Ykhrb0JVaDhYancr?=
 =?utf-8?B?UmRYNXhId2xUWG9RWjRGTkdXY3REZk9oQys2YkN6S2dBZW81QWFzS2xDQ3E3?=
 =?utf-8?B?YzFvM001aGhicjFQeHZzc01MdlVlSUtJM05oZTl5QlVWYWx3ZGpaWG5QNUFu?=
 =?utf-8?B?ZG02WVFHamo5a3hHelgzZ2x2WXVaYWxyOFk5NFZ0S1dNYkpOSkowMU4waUw5?=
 =?utf-8?B?QUVtS1o1QmtCS3h1UjZBNFRVbEhQN2NGQnNyMHFpQW95b0FDcElOV1E3emR6?=
 =?utf-8?B?ektBMEVGZEN6NXREV2c5a2lGaUlRVWZVRFJmNnFiTzJvdnBMa2t6eG1yUXBC?=
 =?utf-8?B?SGZTcGtHMjhhb0luR2w0QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcbed88-34e1-42a0-3334-08d8d825335e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 18:02:36.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UykzLdiaWEhpIY230uZYaEvF8QiE5HQ6bF+Fhze4IvD1iVFma0stpCYruhEkdWlAO9cZO9Mdk+t4+KzAFOH2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5354
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 11:40:07AM -0500, Boris Ostrovsky wrote:
> 
> On 2/23/21 11:11 AM, Roger Pau Monné wrote:
> > On Tue, Feb 23, 2021 at 10:39:48AM -0500, Boris Ostrovsky wrote:
> >
> >> Before I do that though --- what was the conclusion on verbosity control?
> > Ideally I would like to find a way to have a more generic interface to
> > change verbosity level on a per-guest basis, but I haven't looked at
> > all about how to do that, neither I think it would be acceptable to
> > put that burden on you.
> >
> > Maybe we could introduce another flag to set whether ignored MSRs
> > should be logged, as that would be easier to implement?
> 
> 
> Probably.
> 
> 
>     msr_ignore=["verbose=<bool>", "<range>", "range>", ...]

I think just adding a new option will be easier to parse in xl rather
than placing it in the list of MSR ranges:

msr_ignore=["<range>", "range>", ...]
msr_ignore_verbose=<boolean>

Seems easier to implement IMO.

Thanks, Roger.

