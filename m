Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F3742AD7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 18:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556999.869954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEutT-0002ra-HX; Thu, 29 Jun 2023 16:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556999.869954; Thu, 29 Jun 2023 16:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEutT-0002pz-EQ; Thu, 29 Jun 2023 16:53:19 +0000
Received: by outflank-mailman (input) for mailman id 556999;
 Thu, 29 Jun 2023 16:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDrB=CR=intel.com=dongwon.kim@srs-se1.protection.inumbo.net>)
 id 1qEutS-0002pp-6U
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 16:53:18 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fb227df-169d-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 18:53:15 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 09:53:12 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jun 2023 09:53:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 09:53:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 09:53:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 09:53:06 -0700
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Thu, 29 Jun
 2023 16:53:03 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4%3]) with mapi id 15.20.6500.036; Thu, 29 Jun 2023
 16:53:03 +0000
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
X-Inumbo-ID: 6fb227df-169d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688057595; x=1719593595;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VQKM/nYZDs4SYwysuoM/QoQJyADBTBIL1GudZFRG944=;
  b=WwEoMuj8IxiHXhdDGA/u07t8tRYqT2QKRJCdCNLQAwiucPEc/0X8vq8/
   51se/90ffkUPN+kW3q80bBj4yb0WDzxQRVqcqYekU3MjQZTUvAV+UySQM
   19ADNcNgGg7cTxGSAehXkX8JKEcZy75beAUdGLieaqut12eW5Rufonggc
   i0EBqY6w7s+4ktZ37sRv+2oJl+201k6n/lPnY12fQFhGE1uHfK33MTdr0
   +wvvvrKN44Z26ksoClEacFqQu1KHptjwhg37EREUqSUyvIDVquJR2a5g5
   a5qlEudIpU1Cb03h9g5bryYapXYlNvW94PvzOGxrDqx3UthGUv7a10whJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365652885"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="365652885"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="782726363"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="782726363"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi39+qk3Wh2aTlPqGZzOwqPcWAKi3jbNj4mU/KEA5fmbaHBrIomhh0jsOE0+iNpPAWea+BirjgtARSNPSkyjMSP0tK6A01SP4FaeH4PAnUNvaZMorSLz7ywevadxTH0va+7ngma5YLNgAubmNG6GRorkZ8QlsdRSyjl+6UrX7EbQknvMCNkK/00aKRpINFCuxbQFoq6Fm5hjFEzfS/K2mjQ2R87QbmnpFanU9/y6ynB3OIKjuxsmxaZ3xxWMrFQWg2Mmgexklp57VREOiLczXvKkWB+LksGhOUTYR3hvJJe/G9ZkgY8VKrk/o4fOoe1Vl6EDMc74Gjl4w4IdmQPCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aiQenFB6Mfpa+cMt7y6DybXh0zO20v4EdElpu6s0t0=;
 b=Rd1U1mxzSlEG7vBj1dJ0KeLlCzlH6wfrFVgULjgciUd0szTlbgXrbOSTrBxXry/rX6m2bs6yZ5eRTTd66WPi7sAFfEvRUQ5EPROIDUpYXKVcyNxAOWwEJtUGvn/y93KjBYgaJ0oEkmYG2AIyzras2HqFo2Nr/KriD0Ciu5RQ2tmy6PrnGHmGlRoa/Wu7LMVH5MUFLiM4U+zb+oASo/Mj0Kwi+jyc46ec50Pun5+Y97bqlUFnjE9AZJNmauujQLHlY0lD/8HGVhpZUfTOK9YcVuKLelfnqVLgVsdGHfbcvU6mjUdDpHQXCdTr8zIRbeew6a1swnmP6LQL/aoOA09SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <980355eb-0241-2690-8ba4-3f136dd8555a@intel.com>
Date: Thu, 29 Jun 2023 09:53:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Antonio Caggiano <antonio.caggiano@collabora.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, <qemu-devel@nongnu.org>,
	<xen-devel@lists.xenproject.org>
CC: Alex Deucher <Alexander.Deucher@amd.com>, Christian Koenig
	<Christian.Koenig@amd.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>, Honglei Huang
	<Honglei1.Huang@amd.com>, Julia Zhang <Julia.Zhang@amd.com>, Huang Rui
	<Ray.Huang@amd.com>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <20230608025655.1674357-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec3f4ad-69b8-4833-9bfb-08db78c14daa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SNI4as7Iap0aXqProiUu8y99Vb9W3OcluI+WFGIEE0NSJqlXa4/EXtVo67hCDVEmC7swlWZ5PGDK/B1ZgqL0iLcmT4bEglOYQkAOn/MuWQEGdLsFxVV0KzW6Tg+6a2YJQtmOaB5M8wjzJqw1Cltj3ecPnPDyu/qV+b9UwmfcZ2SLAaD6N+K24MW7rk0egNpXuA57LOf12iQDv3PzqqTx209NDQ5DNggQ6a+2K85xYPJMBfTkQTndOPxAeszkdNQGPFJ47wtT7SVZTbTa0yIStfjv5C0UbqPOUyHvRBrArss+4RWKquIz11hJl7jtIylr8c5xTRSHCGGYr9/3WDXMzrKAqLrAUNkRwtHbz2PiruFJ0q7dx4t1nQj1xlqKXL0eK5CNqHZ3Nuexw6DRZAo4GHueofo5B/rc3bXfuObkTT5SBUM1TkH7zhhl49UXDhw0EO07FdtEW/dDgSThJudMDW83OLocdpY1RY52VAP5HAA6i1BjDTzmpmwJOD0xr0bibd5Oole526DLeRGFkAHwYCckcK4e4ZPS+5LBaGX5ler1D3FcnED+TWkoPtPaVHNciyh8QDKgi3sy+d5ouOzNLDfy2UCIU+GZqGvPo9eq9d87s6waWa0JHoRQ4f5eUdLkboncbWpL3AAVGeDbJUstfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6879.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(6486002)(38100700002)(53546011)(2616005)(82960400001)(83380400001)(6506007)(26005)(186003)(921005)(6512007)(54906003)(41300700001)(31696002)(110136005)(86362001)(316002)(2906002)(36756003)(66556008)(66476007)(66946007)(31686004)(4326008)(5660300002)(7416002)(8676002)(8936002)(478600001)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wms4SXFLeUhwU0RmMGl6YXgrN3pBUXY0bUdjRW1PczFyckgyT3lKNzl4bERN?=
 =?utf-8?B?K0QzK1VwekN5WnpCV1VibDQ2OE1MWm9wUjNkUGNCR0gxbzVZYXN1eFpocm5N?=
 =?utf-8?B?dks2ekJTVzFXbmdsMEJ1dFArNXFxWDZ0Sk1aOU5tNUUwTCtEYzBPbjR6Y1VV?=
 =?utf-8?B?TUZBNndBNEFRZmVKY1hPbW5hdTB0c3NNYXoxQ05BZ0hKbTdoY0d6UnZYemVE?=
 =?utf-8?B?b29jYUl3VFY5czFiQi92ZFMzODE0L3QyZkVNSThjVDZlQlBITkNPUzNocng2?=
 =?utf-8?B?RVpnZ2hFMmpQM214RTM5ZXJib0J4V2lUbnU3eFN0YmtJQlE2a3VSN1k0ZGFQ?=
 =?utf-8?B?Q3NHY2J1YTRhVzE3ci83SGhlY0p3OHlXNE5MWDduWkJMcjR0M1NpZVgxdndu?=
 =?utf-8?B?SG5VK00rY2c5OCtIenJxb1FDUXFwY3FVWGF1SkRLeG5tYjBOR283ZU13THpN?=
 =?utf-8?B?WlFvZGJISC85a0Y1RlZSWEVuam9WaUFyVjdpN0g4OWFYb3pHU0t3K3h5WGpT?=
 =?utf-8?B?VFF2T2hKYTB2NURlUkgvc1FNL0JnT3hiRnZ6aVp0QkJBNk50S01LT2JRZHNj?=
 =?utf-8?B?NlhaR2J3b3BaMXErNUw4dFdEZ05xWVQvNHV4b2p2Tzhodm1CQW5ldmJjS2dy?=
 =?utf-8?B?KzlEQmFnTWduUjNjKzRaZVpUaCt0bklRZFRYajZGZEpha0Q1ODZyL0h4TUFk?=
 =?utf-8?B?aWt0VDRWcGpwd1RzVzRRWEhyTHBJRFI3d25NYzBRT1RvUE90cjRkczhKT3Nz?=
 =?utf-8?B?Yi9yVFhTTVpCTUJXSit4dmtweml1RUJlamtKNEZrbkpaanpEMEtOQXlDR3Za?=
 =?utf-8?B?M2dMNVFUZzdYL1RzcU80MlF4MUVJZG9lTGZTM0IyYTU4OXdNdlRSRi94UmtK?=
 =?utf-8?B?NDBoanozajE3TGR0eUdsdFhJM3FqQXE4RHVCc0JUeCtqZUZ5c0orSVNMczhi?=
 =?utf-8?B?UkZYQVd6VmpjTTVzM01VYVhpc2twNk1nMDBFS0NzenoyOW95Q3Yrc05xNGho?=
 =?utf-8?B?RUN1ZlVZWkVxNzRZRC9PVENsZnhCeFF2bUVQalBhMml1MWlWb3pMczd0RlFa?=
 =?utf-8?B?KzNsUjUwMGN6N0lBUzJkeGN5b0pjOG4yRHRKQ21Qc0RmUnlnMzN6YUhqVWtC?=
 =?utf-8?B?SDg2Q0FyWWY4aTQzblY5OHpPMTN6R1lVbTQ1YUV6V0hmUmM0TTFYNkpHeWdn?=
 =?utf-8?B?WGlFcnIzSDh4UnJ1UEhka2E2ekpCNkphV1BwUnVSRk5YNWdINk15K1Exc0hD?=
 =?utf-8?B?aE5udC9sUjRrb0p4WjlWNS9XcW9RYW1kZG1TZzZmQXkwMjBwcENJcUE0Q1Vi?=
 =?utf-8?B?Tjljb2g5REZpbURrLzg0amZyVzZlUzNRMVd3V200K09rRjZIY0J2NG9JZjJv?=
 =?utf-8?B?U01BbVZid2xDOEUwUnlUcVFSU0RhYTBTc2s5ZWpWckk3bjdnYWNwQ1pkcWRG?=
 =?utf-8?B?S3J4RGh3a0F3SkRKSThMN25DYjVSK3YrZmsxY01IVFNjRnViRmNpK1d4Ynpx?=
 =?utf-8?B?Z05ZRjJCcnVEL0MxRk9nUDd4RFFBdTRIOVlpaTdaREJ2L2IzMmYwdW5rZWR1?=
 =?utf-8?B?MGFFZ1Y0cWVjaFNKUzAycUM2bWpUeXNHc0FWU0RyNlBmbGhTaEhyaTdML0gy?=
 =?utf-8?B?V3hLZXVaWVlXbGoxSUErclpFellzbzBrcmVTOW8wTXdkYVZTQUdtZjU2MEky?=
 =?utf-8?B?OXlzNmw0UXU1V0VLSVYveDF0cmJUMkhQOFNDTkNXOG0zMldOZkdXN211Q1ZJ?=
 =?utf-8?B?aHFrc25vUFgxU2NjWU1JRHhoM1orRUJkRzNqeXphZ29iNUFRblRQcVRtd0hH?=
 =?utf-8?B?NTcrZ01rUUV5UG1GZFYydjd3VW9oMXlZMDNHK3B2MmlOTUk1czZRVEpkb1BF?=
 =?utf-8?B?RWM4b2hQeDM0bm00bmZnZ2x2ZDR3by85MG1VTXpkRnFORll6SHArcTF5eENE?=
 =?utf-8?B?a0xxVzBJNTZPeVJWNDRwR3hTdlBRUnRGYUkzMEpCWXNyWDhKbDNabURaanhV?=
 =?utf-8?B?SC9xcU45NTVKZDJqeDJ4dW5RSWprZzh4cnkvKzg5R0xPYUlTZWZDOWc1SjlX?=
 =?utf-8?B?bkZmV01lK1F6bmRKWkZXRmF1Ky9tZ0k0UFEycVU1M0VySUJrWXFkbGk3VC9E?=
 =?utf-8?Q?lC8el4fyRJ3z2RAY2HtjQZoor?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec3f4ad-69b8-4833-9bfb-08db78c14daa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 16:53:03.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1g63au96kgeyCRtBqhmz/qcYtpCdaJZsdTBdeeT38+7nR5mxSjMJMrHdjC07Fh+Sp9gqMgjIQrBq9NITVFTYbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-OriginatorOrg: intel.com

This method - letting QEMU not remove resources would work on S3 case 
but with S4, the QEMU would lose all the resources anyway as the process 
will be terminated. So objects restoring was only option for us as

in [RFC PATCH 2/2] drm/virtio: restore virtio_gpu_objects upon suspend 
and resume (lists.freedesktop.org) 
<https://lists.freedesktop.org/archives/dri-devel/2022-September/373894.html>

But I only considered and tested cases with scanout blob resources, so 
this may not cover other resource types...

On 6/7/2023 7:56 PM, Jiqian Chen wrote:
> After suspending and resuming guest VM, you will get
> a black screen, and the display can't come back.
>
> This is because when guest did suspending, it called
> into qemu to call virtio_gpu_gl_reset. In function
> virtio_gpu_gl_reset, it destroyed resources and reset
> renderer, which were used for display. As a result,
> guest's screen can't come back to the time when it was
> suspended and only showed black.
>
> So, this patch adds a new ctrl message
> VIRTIO_GPU_CMD_STATUS_FREEZING to get notification from
> guest. If guest is during suspending, it sets freezing
> status of virtgpu to true, this will prevent destroying
> resources and resetting renderer when guest calls into
> virtio_gpu_gl_reset. If guest is during resuming, it sets
> freezing to false, and then virtio_gpu_gl_reset will keep
> its origin actions and has no other impaction.
>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>   hw/display/virtio-gpu-gl.c                  |  9 ++++++-
>   hw/display/virtio-gpu-virgl.c               |  3 +++
>   hw/display/virtio-gpu.c                     | 26 +++++++++++++++++++--
>   include/hw/virtio/virtio-gpu.h              |  3 +++
>   include/standard-headers/linux/virtio_gpu.h |  9 +++++++
>   5 files changed, 47 insertions(+), 3 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index e06be60dfb..e11ad233eb 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -100,7 +100,14 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
>        */
>       if (gl->renderer_inited && !gl->renderer_reset) {
>           virtio_gpu_virgl_reset_scanout(g);
> -        gl->renderer_reset = true;
> +        /*
> +         * If guest is suspending, we shouldn't reset renderer,
> +         * otherwise, the display can't come back to the time when
> +         * it was suspended after guest resumed.
> +         */
> +        if (!g->freezing) {
> +            gl->renderer_reset = true;
> +        }
>       }
>   }
>   
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 73cb92c8d5..183ec92d53 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -464,6 +464,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>       case VIRTIO_GPU_CMD_GET_EDID:
>           virtio_gpu_get_edid(g, cmd);
>           break;
> +    case VIRTIO_GPU_CMD_STATUS_FREEZING:
> +        virtio_gpu_cmd_status_freezing(g, cmd);
> +        break;
>       default:
>           cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>           break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 5e15c79b94..8f235d7848 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -373,6 +373,16 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
>       QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>   }
>   
> +void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
> +                         struct virtio_gpu_ctrl_command *cmd)
> +{
> +    struct virtio_gpu_status_freezing sf;
> +
> +    VIRTIO_GPU_FILL_CMD(sf);
> +    virtio_gpu_bswap_32(&sf, sizeof(sf));
> +    g->freezing = sf.freezing;
> +}
> +
>   static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
>   {
>       struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
> @@ -986,6 +996,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>       case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
>           virtio_gpu_resource_detach_backing(g, cmd);
>           break;
> +    case VIRTIO_GPU_CMD_STATUS_FREEZING:
> +        virtio_gpu_cmd_status_freezing(g, cmd);
> +        break;
>       default:
>           cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>           break;
> @@ -1344,6 +1357,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
>       QTAILQ_INIT(&g->reslist);
>       QTAILQ_INIT(&g->cmdq);
>       QTAILQ_INIT(&g->fenceq);
> +
> +    g->freezing = false;
>   }
>   
>   void virtio_gpu_reset(VirtIODevice *vdev)
> @@ -1352,8 +1367,15 @@ void virtio_gpu_reset(VirtIODevice *vdev)
>       struct virtio_gpu_simple_resource *res, *tmp;
>       struct virtio_gpu_ctrl_command *cmd;
>   
> -    QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
> -        virtio_gpu_resource_destroy(g, res);
> +    /*
> +     * If guest is suspending, we shouldn't destroy resources,
> +     * otherwise, the display can't come back to the time when
> +     * it was suspended after guest resumed.
> +     */
> +    if (!g->freezing) {
> +        QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
> +            virtio_gpu_resource_destroy(g, res);
> +        }
>       }
>   
>       while (!QTAILQ_EMPTY(&g->cmdq)) {
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 2e28507efe..c21c2990fb 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -173,6 +173,7 @@ struct VirtIOGPU {
>   
>       uint64_t hostmem;
>   
> +    bool freezing;
>       bool processing_cmdq;
>       QEMUTimer *fence_poll;
>       QEMUTimer *print_stats;
> @@ -284,5 +285,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
>   void virtio_gpu_virgl_reset(VirtIOGPU *g);
>   int virtio_gpu_virgl_init(VirtIOGPU *g);
>   int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
> +void virtio_gpu_cmd_status_freezing(VirtIOGPU *g,
> +                         struct virtio_gpu_ctrl_command *cmd);
>   
>   #endif
> diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
> index 2da48d3d4c..aefffbd751 100644
> --- a/include/standard-headers/linux/virtio_gpu.h
> +++ b/include/standard-headers/linux/virtio_gpu.h
> @@ -116,6 +116,9 @@ enum virtio_gpu_ctrl_type {
>   	VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID,
>   	VIRTIO_GPU_RESP_ERR_INVALID_CONTEXT_ID,
>   	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
> +
> +	/* status */
> +	VIRTIO_GPU_CMD_STATUS_FREEZING = 0x1300,
>   };
>   
>   enum virtio_gpu_shm_id {
> @@ -453,4 +456,10 @@ struct virtio_gpu_resource_unmap_blob {
>   	uint32_t padding;
>   };
>   
> +/* VIRTIO_GPU_CMD_STATUS_FREEZING */
> +struct virtio_gpu_status_freezing {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__u32 freezing;
> +};
> +
>   #endif

