Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA016C4AB1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513408.794342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexfJ-0001Ab-Cv; Wed, 22 Mar 2023 12:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513408.794342; Wed, 22 Mar 2023 12:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexfJ-00017H-8p; Wed, 22 Mar 2023 12:34:05 +0000
Received: by outflank-mailman (input) for mailman id 513408;
 Wed, 22 Mar 2023 12:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pl0Y=7O=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pexfI-000179-0f
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:34:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e89::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0c173df-c8ad-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 13:33:59 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:33:51 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:33:51 +0000
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
X-Inumbo-ID: d0c173df-c8ad-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3q3uiVSktwODPLcBG8M36XdOK/RhOTd5VGvm9wLy1W4I25jKTTjiffUpxS6vhJsVp9TpQQvRECG14AuqxVhaXGsEqsSbY6oOudXwXVlIPHbieo+qZkBM3pScjXI4bSkwp8wjEcYTSI9slXCo8elC/Ci810YdlHPVRvjhRBlSfuubmf7/3frye+f7bhGTAe9LNpnuyu+M63DgdPfw8ddXDizfoH9Oz9xbi0znwLi3cSTyLt1FWDK+oQRFdjVAdpnyUAnsIqo2d3XxPOYhlX4vSZ76GIsWmSXk9VmPCM4vDVrAEeRpswwgaLUj8B4fQNaropPHHTQjkvVJ+lHsNpEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trD0uMveClH44RZ/CLLdUab3NTJGL6cza4lbn4P8FHY=;
 b=DS2znbWwDxRop1cJCY1t7sEebqOS0Dn6i1Gdlj7FmUM+08FqxQH0I6OVsQ5SqMwBryCz0XeFW7sRSwsRbXqHKSxfYiHh4U5/v60/UYJjqdet4TQxp3CXHpD3OQk2T9HYjSbaYV7GP0z8GXUBUvGowzltt3dABX2YlGUtknCWHUieo23jAYfLOBRsCfHmNPH407SXx68mRHACHYD+bihwOgpQAiZDextshOsK+o8dINQ+NTMwy05Uc7Gy5nLIPwaEpB/dBrJX83y5Kla7owWaa2im47019+PfkAz82lKWnPBEN2TJMxN3rEJfmG4KCZOMgT+uXQKikU2Hcp1+tQJDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trD0uMveClH44RZ/CLLdUab3NTJGL6cza4lbn4P8FHY=;
 b=b4d3J6dvxb91kkMzwXaDEPSmJz88grOIcbkN4cuWl4dqygidY7J2f3IdRv+zNjlA8J/77bvPtw3jvittlNhfObzjPFysPb8jKtgLQiIYM6qFLJQsnLrRsAxL7wqz5qaK0bb8XlBQEJjiqD1RTSAAZziqmxZJ5/1a16e0IDpngFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 22 Mar 2023 20:33:23 +0800
From: Huang Rui <ray.huang@amd.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBr1k/B/ve8NNqaJ@amd.com>
References: <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
 <ZBmrI3wrrwsK5Q+0@amd.com>
 <ZBquOn8x7IyI33Pj@amd.com>
 <ZBrLsRebAYaspHrK@Air-de-Roger>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBrLsRebAYaspHrK@Air-de-Roger>
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5d84fd-1c53-4240-fa13-08db2ad1b083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aof+V9tHcTWPl01ygWXZBw6AfRpATbiDfK+txtcg6uk9q9N5HnPeJtH5FShWmhm+if2cvFzG/dVyS+uenWxYn+Spu45BmyDY5/dd/PCMVUsk4w8jxOLgByvp0yDiOlmt/ojF9X2jjTgGxTines/wEw0SYwTOvvsdNIfn6ynDhP3d49u078l0v6Gip8OOH24f0wuu+/TyQzfXbsdAx4WJ6Y7/WYrl6Kdct8zd6ejMoDuWP0kNilRCww9jdWm40tERg+FybGjD2dW9dewTn2Ia2e/3rpQgn1DxWzZ0TLJ5QO4jJsRTlfdTNLTdqAuUfm3mNYBwIx0jKa38zEPucWZupdY4Yih6FjICH9yIsieX7XjtCoMcVVsHgIPVwZyhYb68mweqauMaZ5FaXIAEFwicz8QLGh4qRCzXZIGUxSJJsKTDfNWzvDSEqC3lRB+zc+/d3sYi93RiwoF6jg8t0GFhiADrf+C0cpM+8GwACsmrVyxvwaL97k/3EpuMamKZbhNA+ZRGqmC3TXQd5qfZfobWm2zty8zWRj5xKEMkmn2SLHlNZK229G3QS0Q1e/BcrWWP6nUveL45qQGBZQaAIlF8OyVmLHaAPAmvtmMgB4nPTnL9CH1/FaDqPNXDx+drtfQwTyQdleA/jluQMCYtcLl+Jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199018)(30864003)(2906002)(86362001)(83380400001)(8936002)(186003)(6666004)(38100700002)(5660300002)(2616005)(41300700001)(26005)(6512007)(6506007)(53546011)(54906003)(316002)(478600001)(110136005)(36756003)(6486002)(8676002)(4326008)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4cSRn3IRI+qBABmlHcZWyZWVdcUljKcAd9EpF94DyzaH4poLVqNvSMhJyd?=
 =?iso-8859-1?Q?C8WTEc095c2dcWH4sqmihMBJu6ChKajOtr1xa/c79Qo0Uvbd/xE/pRTpyv?=
 =?iso-8859-1?Q?vBdf4nzdymVZxxIAR+KS05IdqiZd7zW0Q4Cal+lfxjddLysPHwCIM4szNs?=
 =?iso-8859-1?Q?V2xm7qtS01Sx1cvTtvAX1KQgZ0tILu1FTmWXnWGS7YN2gRmEAJ7xHHMLi2?=
 =?iso-8859-1?Q?WaMRBTKbUyvqFjv58APPE8HJxnIspu2LxeMzbvMv5tGFUAN35ocuxB0ZWF?=
 =?iso-8859-1?Q?TpoydZ+6JA6TD7tUZrvRA/OdDP0WTm+VJqdqdbRI5kr+WpW5MiRqf6Rf74?=
 =?iso-8859-1?Q?Jz8L8lkTOgzyHQyz+j5603kRRr4L9YDhogViiY0xZPgGQA56Np6WTCeEji?=
 =?iso-8859-1?Q?T7WeK+AkqVQ+z8V7XAp+KhD9F0KOU0TlGttzErj84syaOrhEUTvL7t/2zI?=
 =?iso-8859-1?Q?0SOiLl/NHcBWsD0gNJNG0/KAU7afP4aRjoWU82LzCyFcF3b2yfeuWBI+wf?=
 =?iso-8859-1?Q?CGN053KNptTZQh9klv3gy0a2I6XEw0ujKIq7EKGK+h/IaYoAPGNZplZfT0?=
 =?iso-8859-1?Q?hAwC2BbIf8bIOBsvVCfpFyyn/kq/14tO6uwWajhWW4jHHtatyqdQMJfQ0K?=
 =?iso-8859-1?Q?CQNDz955XxHyAbYM/e7HKx/kky7D5fJb6X7rracdWwgMok3taDEnH4tuuD?=
 =?iso-8859-1?Q?0ATQnsd7cZ87uw6xwp8trCbafsY/Z7p3av6AqjK70OmXP+rtpcScjIu5qg?=
 =?iso-8859-1?Q?LVswDxgVk6V7kjLGJp8YpFk/Q2GsUo3nNSHg0B4wmeKK0VK1+GInhR3ALp?=
 =?iso-8859-1?Q?1aZZpRzG/RMRzJ1s57nd7dRR0hQanDrZgXAV/4NrHpzsXvTyjIcgZaBXTq?=
 =?iso-8859-1?Q?MknDxxkRANn1PgkjBXVarjSxYv2DBwFl/jEdGbSq0TpOwtLcMwCA8ZHSQe?=
 =?iso-8859-1?Q?sSazwWeFND/AVlk/BS9QoIJ+F3h7YyhDigbxi2CW2AON9sn2MrNXcIznSj?=
 =?iso-8859-1?Q?3HZd/6cHa6hJkUg2z5Qry8pcCYIgVZRWw4ZzWPzGbG0YJF29MjReuO/NiK?=
 =?iso-8859-1?Q?sBRlJGFc6jV0takz2qMuqQT2icIp4GYrQR0QfIc2o6nPn68GxfvTdGjPwP?=
 =?iso-8859-1?Q?sfyU5VAfqWZKA9xEmrlXHgSphArsFa0f9k+d4ZAQJQ9P/JNEtHUqVDDkSv?=
 =?iso-8859-1?Q?34gayjDGOW3vUKA/YkUyceEe+VFkI2wxvBoXcv9OYW2yzzYIWU7nLAtLd6?=
 =?iso-8859-1?Q?ugjot0PC2xhRIw2K7KWUX4gKb6K31felkYZzXqBj10BdCQIPa17G7AQxzf?=
 =?iso-8859-1?Q?X9H+6ZZr4Dq0kd8KJ7SacE61UBw7K5q3nVduX3ELiuxzRVTj4cQV97aWIG?=
 =?iso-8859-1?Q?0fB8mTD4M5iNhD60Hgelxf7QO6Z/gtqCcuHI2tBl9z/2IU4S9YTmBhG5/Z?=
 =?iso-8859-1?Q?S2h4CRQ3HCJhWkSxlfA+5wiQsPllxPWTw3DNhH6S6uE3VetO1MPlXJ1izi?=
 =?iso-8859-1?Q?15RRzJxi1KvWTTQZcb287x3JSQXzo/Cainz9Hs271N6nKuXo256akbKUJr?=
 =?iso-8859-1?Q?1tTYcSE8WCSHfFEPjbeiSxSJeOw1xCW6YD8Hk0bfRkMMfkmKfZTBahNcIM?=
 =?iso-8859-1?Q?M1WdqJBJEGbdEZFXeJirPpBgdnfhQKdwy5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5d84fd-1c53-4240-fa13-08db2ad1b083
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:33:51.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJoL823aOCJ1wdCr+SSS5zJH47WT4NUBoqKfJEbZD802xfD564oYYjVmNLY/NB0nz1t9/0PLOubUzOwfa+ftKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867

On Wed, Mar 22, 2023 at 05:34:41PM +0800, Roger Pau Monné wrote:
> On Wed, Mar 22, 2023 at 03:28:58PM +0800, Huang Rui wrote:
> > On Tue, Mar 21, 2023 at 09:03:58PM +0800, Huang Rui wrote:
> > > On Tue, Mar 21, 2023 at 08:27:21PM +0800, Jan Beulich wrote:
> > > > On 21.03.2023 12:49, Huang Rui wrote:
> > > > > Thanks, but we found if dom0 is PV domain, the passthrough device will
> > > > > access this function to write the real bar.
> > > > 
> > > > Can you please be quite a bit more detailed about this? The specific code
> > > > paths taken (in upstream software) to result in such would of of interest.
> > > > 
> > > 
> > > yes, please wait for a moment. let me capture a trace dump in my side.
> > > 
> > 
> > Sorry, we are wrong that if Xen PV dom0, bar_write() won't be called,
> > please ignore above information.
> > 
> > While xen is on initialization on PVH dom0, it will add all PCI devices in
> > the real bus including 0000:03:00.0 (VGA device: GPU) and 0000:03:00.1
> > (Audio device).
> > 
> > Audio is another function in the pcie device, but we won't use it here. So
> > we will remove it after that.
> > 
> > Please see below xl dmesg:
> > 
> > (XEN) PCI add device 0000:03:00.0
> > (XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:03:00.1 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:03:00.1 bar->enabled 0
> > (XEN) PCI add device 0000:03:00.1
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 391 0000:04:00.0 bar->enabled 0
> > (XEN) d0v0 bar_write Ray line 406 0000:04:00.0 bar->enabled 0
> > (XEN) PCI add device 0000:04:00.0
> > 
> > ...
> > 
> > (XEN) PCI add device 0000:07:00.7
> > (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0010058 unimplemented
> > (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc0011020 unimplemented
> > (XEN) PCI remove device 0000:03:00.1
> > 
> > We run below script to remove audio
> > 
> > echo -n "1" > /sys/bus/pci/devices/0000:03:00.1/remove
> > 
> > (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029b unimplemented
> > (XEN) arch/x86/hvm/svm/svm.c:2017:d0v0 RDMSR 0xc001029a unimplemented
> > 
> > Then we will run "xl pci-assignable-add 03:00.0" to assign GPU as
> > passthrough. At this moment, the real bar is trying to be written.
> > 
> > (XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
> > (XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1
> > (XEN) Xen WARN at drivers/vpci/header.c:408
> > (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Not tainted ]----
> > (XEN) CPU:    8
> > (XEN) RIP:    e008:[<ffff82d040263cb9>] drivers/vpci/header.c#bar_write+0xc0/0x1ce
> > (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v7)
> > (XEN) rax: ffff8303fc36d06c   rbx: ffff8303f90468b0   rcx: 0000000000000010
> > (XEN) rdx: 0000000000000002   rsi: ffff8303fc36a020   rdi: ffff8303fc36a018
> > (XEN) rbp: ffff8303fc367c18   rsp: ffff8303fc367be8   r8:  0000000000000001
> > (XEN) r9:  ffff8303fc36a010   r10: 0000000000000001   r11: 0000000000000001
> > (XEN) r12: 00000000d0700000   r13: ffff8303fc6d9230   r14: ffff8303fc6d9270
> > (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003506e0
> > (XEN) cr3: 00000003fc3c4000   cr2: 00007f180f6371e8
> > (XEN) fsb: 00007fce655edbc0   gsb: ffff88822f3c0000   gss: 0000000000000000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > (XEN) Xen code around <ffff82d040263cb9> (drivers/vpci/header.c#bar_write+0xc0/0x1ce):
> > (XEN)  b6 53 14 f6 c2 02 74 02 <0f> 0b 48 8b 03 45 84 ff 0f 85 ec 00 00 00 48 b9
> > (XEN) Xen stack trace from rsp=ffff8303fc367be8:
> > (XEN)    00000024fc367bf8 ffff8303f9046a50 0000000000000000 0000000000000004
> > (XEN)    0000000000000004 0000000000000024 ffff8303fc367ca0 ffff82d040263683
> > (XEN)    00000300fc367ca0 d070000003003501 00000024d0700000 ffff8303fc6d9230
> > (XEN)    0000000000000000 0000000000000000 0000002400000004 0000000000000000
> > (XEN)    0000000000000000 0000000000000000 0000000000000004 00000000d0700000
> > (XEN)    0000000000000024 0000000000000000 ffff82d040404bc0 ffff8303fc367cd0
> > (XEN)    ffff82d0402c60a8 0000030000000001 ffff8303fc367d88 0000000000000000
> > (XEN)    ffff8303fc610800 ffff8303fc367d30 ffff82d0402c54da ffff8303fc367ce0
> > (XEN)    ffff8303fc367fff 0000000000000004 ffff830300000004 00000000d0700000
> > (XEN)    ffff8303fc610800 ffff8303fc367d88 0000000000000001 0000000000000000
> > (XEN)    0000000000000000 ffff8303fc367d58 ffff82d0402c5570 0000000000000004
> > (XEN)    ffff8304065ea000 ffff8303fc367e28 ffff8303fc367dd0 ffff82d0402b5357
> > (XEN)    0000000000000cfc ffff8303fc621000 0000000000000000 0000000000000000
> > (XEN)    0000000000000cfc 00000000d0700000 0000000400000001 0001000000000000
> > (XEN)    0000000000000004 0000000000000004 0000000000000000 ffff8303fc367e44
> > (XEN)    ffff8304065ea000 ffff8303fc367e10 ffff82d0402b56d6 0000000000000000
> > (XEN)    ffff8303fc367e44 0000000000000004 0000000000000cfc ffff8304065e6000
> > (XEN)    0000000000000000 ffff8303fc367e30 ffff82d0402b6bcc ffff8303fc367e44
> > (XEN)    0000000000000001 ffff8303fc367e70 ffff82d0402c5e80 d070000040203490
> > (XEN)    000000000000007b ffff8303fc367ef8 ffff8304065e6000 ffff8304065ea000
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d040263cb9>] R drivers/vpci/header.c#bar_write+0xc0/0x1ce
> > (XEN)    [<ffff82d040263683>] F vpci_write+0x123/0x26c
> > (XEN)    [<ffff82d0402c60a8>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> > (XEN)    [<ffff82d0402c54da>] F hvm_process_io_intercept+0x203/0x26f
> > (XEN)    [<ffff82d0402c5570>] F hvm_io_intercept+0x2a/0x4c
> > (XEN)    [<ffff82d0402b5357>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5eb
> > (XEN)    [<ffff82d0402b56d6>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> > (XEN)    [<ffff82d0402b6bcc>] F hvmemul_do_pio_buffer+0x33/0x35
> > (XEN)    [<ffff82d0402c5e80>] F handle_pio+0x70/0x1b7
> > (XEN)    [<ffff82d04029dc7f>] F svm_vmexit_handler+0x10ba/0x18aa
> > (XEN)    [<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> > (XEN)
> > (XEN) d0v7 bar_write Ray line 391 0000:03:00.0 bar->enabled 1
> > (XEN) d0v7 bar_write Ray line 406 0000:03:00.0 bar->enabled 1
> 

Hi Jan, Roger,

> As said by Jan, it's hard to figure out where are the printks placed without a
> diff of your changes.

I attached the diff of my prints below, and I want to figure out why the
Bar_write() is called while we use pci-assignable-add to assign passthrough device in PVH dom0.


diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 918d11fbce..35447aff2a 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -388,12 +388,14 @@ static void cf_check bar_write(
     else
         val &= PCI_BASE_ADDRESS_MEM_MASK;
 
+    gprintk(XENLOG_WARNING, "%s Ray line %d %pp bar->enabled %d\n", __func__, __LINE__, &pdev->sbdf , bar->enabled);
     /*
      * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
      * writes as long as the BAR is not mapped into the p2m.
      */
     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
     {
+        gprintk(XENLOG_WARNING, "%s Ray line %d %pp bar->enabled %d\n", __func__, __LINE__, &pdev->sbdf , bar->enabled);
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
@@ -401,7 +403,9 @@ static void cf_check bar_write(
                     &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
         return;
     }
-
+    gprintk(XENLOG_WARNING, "%s Ray line %d %pp bar->enabled %d\n", __func__, __LINE__, &pdev->sbdf , bar->enabled);
+    if (bar->enabled)
+	WARN_ON(1);
 
     /*
      * Update the cached address, so that when memory decoding is enabled

> 
> So far the above seems to be expected, as we currently don't handle BAR
> register writes with memory decoding enabled.
> 
> Given the change proposed in this patch, can you check whether `bar->enabled ==
> true` but the PCI command register has the memory decoding bit unset?


I traced that while we do pci-assignable-add, we will follow below trace to
bind the passthrough device.

pciassignable_add()->libxl_device_pci_assignable_add()->libxl__device_pci_assignable_add()->pciback_dev_assign()

Then kernel xen-pciback driver want to add virtual configuration spaces. In
this phase, the bar_write() in xen hypervisor will be called. I still need
a bit more time to figure the exact reason. May I know where the
xen-pciback driver would trigger a hvm_io_intercept to xen hypervisor?

[  309.719049] xen_pciback: wants to seize 0000:03:00.0
[  462.911251] pciback 0000:03:00.0: xen_pciback: probing...
[  462.911256] pciback 0000:03:00.0: xen_pciback: seizing device
[  462.911257] pciback 0000:03:00.0: xen_pciback: pcistub_device_alloc
[  462.911261] pciback 0000:03:00.0: xen_pciback: initializing...
[  462.911263] pciback 0000:03:00.0: xen_pciback: initializing config
[  462.911265] pciback 0000:03:00.0: xen-pciback: initializing virtual configuration space
[  462.911268] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x00
[  462.911271] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x02
[  462.911284] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x04
[  462.911286] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3c
[  462.911289] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x3d
[  462.911291] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0c
[  462.911294] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0d
[  462.911296] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x0f
[  462.911301] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x10
[  462.911306] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x14
[  462.911309] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x18
[  462.911313] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x1c
[  462.911317] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x20
[  462.911321] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x24
[  462.911325] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x30
[  462.911358] pciback 0000:03:00.0: Found capability 0x1 at 0x50
[  462.911361] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x50
[  462.911363] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x52
[  462.911368] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x54
[  462.911371] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x56
[  462.911373] pciback 0000:03:00.0: xen-pciback: added config field at offset 0x57
[  462.911386] pciback 0000:03:00.0: Found capability 0x5 at 0xa0
[  462.911388] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa0
[  462.911391] pciback 0000:03:00.0: xen-pciback: added config field at offset 0xa2
[  462.911405] pciback 0000:03:00.0: xen_pciback: enabling device
[  462.911412] pciback 0000:03:00.0: enabling device (0006 -> 0007)
[  462.911658] Already setup the GSI :28
[  462.911668] Already map the GSI :28 and IRQ: 115
[  462.911684] pciback 0000:03:00.0: xen_pciback: save state of device
[  462.912154] pciback 0000:03:00.0: xen_pciback: resetting (FLR, D3, etc) the device
[  463.954998] pciback 0000:03:00.0: xen_pciback: reset device


> 
> If so it would mean Xen state got out-of-sync with the hardware state, and we
> would need to figure out where it happened.  Is there any backdoor in the AMD
> GPU that allows to disable memory decoding without using the PCI command
> register?
> 

I don't think we have any backdoor.

Thanks,
Ray

