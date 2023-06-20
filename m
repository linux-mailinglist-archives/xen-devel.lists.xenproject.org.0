Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8C73735B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552177.862110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfbw-0002Jn-6Z; Tue, 20 Jun 2023 17:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552177.862110; Tue, 20 Jun 2023 17:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfbw-0002HG-2X; Tue, 20 Jun 2023 17:57:48 +0000
Received: by outflank-mailman (input) for mailman id 552177;
 Tue, 20 Jun 2023 17:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epHQ=CI=intel.com=dongwon.kim@srs-se1.protection.inumbo.net>)
 id 1qBfbt-0001tF-OI
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:57:46 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f325bdc9-0f93-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:57:42 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 10:57:40 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2023 10:57:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 10:57:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 10:57:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 10:57:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 10:57:39 -0700
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 17:57:36 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4%3]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 17:57:36 +0000
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
X-Inumbo-ID: f325bdc9-0f93-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687283862; x=1718819862;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zfhxFR+u9DXtsylv8N1rbQmLpUbuDP/eX/s4PpmdRrY=;
  b=PBMJRBILezagtbRilkL3UbSpBmNDhARkSPkx0QncGW6KI+JdbjHlEZyu
   i+rbzCRk1PxvIX4a0rZPj9hiJukkdWOO0/ppa5Ikyhn1RcIIySYRgq4x0
   FnC4WEGcwssrUNTbXwrtRLud31+PgM+8s7NirmdYNmC7vbtspmvsOr+bJ
   yEe7jbEC/tBst8X3YaddCj0EAE2WogsZb51Qb10rDVQiELBca6dL6i234
   CAhqB6AZLYkDANnAspdXAWmCSvOBDmHP/hB1M4LI9ANAC3p2wzv2ZsnQY
   WtfnCz6YRrpPobXnFE0HNYY5FDkZfVyvMTyXhXNYerf+/astYJI0hxtvQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357433891"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="357433891"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="784175624"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="784175624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obvy90PGtClivngwXVZNUS1TIF40NhnkGbwTmgsKsl14K8jgMe4cRqJiZkYTGXaeToX2fKNxJu0oF2EGW7B1sO2grJHWWWxtr+qVQ+fxV8icgx55pQ9tenjhVcm+S5XRd9a076AFcocgUHstdQYC7QkFQkdelybpymJCh7WfiaiKfxxSSN6K9FaRn8erpR5q8YyzmcovcYAeFbyiR1imL9IU4pFA0rbFuDzb6JTl0o14rxw5HKc2njf29tchbdrfdNRM5oF3ShB9DRuGEMycyYt4JPCcUtn925BQrXAMY8elDBPdhnI10HQvWRadb4/5kc7JrMCrJ1IBPS3c5exMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlA7FfOuzu0kwMR4LXeLlfNWat6nZWOtwSG4jxrJlwE=;
 b=lBEYe0rPwp5VC/C6Psw9+ScalE9/EM/+gJAFogS39l7Vn0mX0GV4uswrqBRHQxf+6KYCeYESrMoYFZ80b+1Vkv5+12nwLcyDzCJJiZHZP8p1uUCLul2NDhBSP9DKp9Ph6SF2PCS2t8WKbjoNoqqtNKGDHuu65wAou7hMBBNvV9H25SaN5DXTJKKX9xZ4S7CIhhq0ijXwU0+Nd7tLCeWb/WQH5O17EvLUocEi6j4vGVy7TEnaW0UPVRvVYBYiKL0JDmxJ6UPg0X+UgMGOFns9t3+mlNhYFmeu5c6H+FzquMYTl/Dr+zz25BEOVndNInXTEcfEV80nch5R7zkzdwulMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <3aa645b0-ca8d-f292-fb60-46d3e35ace14@intel.com>
Date: Tue, 20 Jun 2023 10:57:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>, Gerd Hoffmann
	<kraxel@redhat.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
CC: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>, "Damien
 Hedde" <damien.hedde@greensocs.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <lgan3p6wqmxht5fpduh5nvg3f5m5n636k7zrrealnu2lilghhh@qlbvgu3l4apw>
 <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdf4b58-790b-4a10-051c-08db71b7d465
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YEL0wTHAHmaET/pjqboXbYlOcYvAPzd/bT3LvDl2OupFnHiq1l5A39Wd49DyUsOUtjWS1SViN5Hp9hb9YUoLRC80t5CZMxwKAdkTth0awgdhTxY0civ2F+M1sCS+lwOr4Lg2AuSPHdrwmxqoY8usCSQUNobgtHdNT3ec6hjSZ2ml9S0GQoIpHUpJbeH+suEeMIxALm6Bk6TxUQ2UuK1+ONQAt2X+5tMGdzzWi6Z8P3JT9L1bUvEcEs89AR83L4fWaNtsogp1b5Z3zEqexRJtlVYgm1+z7NDrr6EMvgaAc5MDW/HOCKdC6Lt3UToubUaF+cZXws3uOKl/RTXi/dvrw75I0VOU8Co+iAYfv5j/2fcx1s/iZK+RpPj2Ys0/BcTKnFAW7VPFDiN6koVNyHxCSbjgyBdA90dNubxFeahfIxWcHt8QxWCBoR/tliT8pD5XMjawdAH58eWU+7EGIm3gLsbdeqZ8alDXDUozqFWE4qLRny5XwTsDNroN1kZgSSsNkRH85nMGJmXkAHFljP3MnSA3pNMHLkpnV97se1Z2kMXTJYQTdPwDfpSZLa1V1tz+IcPP5mGKAYgspcxaahU65scZc1mu1WnkntUHQPbR4FWUKHhhnCqFw8X1WLvB6Naxza1cnM8qfRrUrdVyBCWh8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6879.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199021)(31686004)(53546011)(36756003)(5660300002)(7416002)(66476007)(8936002)(8676002)(41300700001)(86362001)(66556008)(38100700002)(316002)(31696002)(82960400001)(4326008)(66946007)(6486002)(6512007)(26005)(6506007)(186003)(2616005)(15650500001)(2906002)(478600001)(110136005)(54906003)(83380400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzVxZmkzbG85QURiTGFpemUwTXByUjZ4M1lOd0hycVZuQ25pZ2NYVUtMd0JX?=
 =?utf-8?B?bjc4UGxYNzlYaWx3anVBMFh4TWxUODF6ajAybk5COXIyanN5S2FUM0tpOG9G?=
 =?utf-8?B?QnlDSlgvYlAyQ1haWHdPRUw5QUxQTVBvR1lMWUFYRnJqUk1xMGxHUlQ1UW1q?=
 =?utf-8?B?R2pWcmdJYUhLTTBYYVZFVDhaRi9Ob0VlaExsc0lmYU56TVNnVEg5dG1FSkRK?=
 =?utf-8?B?eTdYcmtJaFlScSswWFVpN1Z5cURCNFMxWm9ZRHIvendxTlVHSU1WQVlkeXlO?=
 =?utf-8?B?S28ySGJ3aXFjRXVjVVpOTG5uK0VlZ1hmL0hoUk9DNzFvQk56bWVwaDJBUFNE?=
 =?utf-8?B?M0lPQ3F4bUxRYVNNeEhqVUtvQ2x6Y04wK09CMVY3OHEvczQ5clljNjl2UzV2?=
 =?utf-8?B?bmRIcFQ5ajEzT0R4OEdLSU4rdjQ1cVVHTVVUWlJBaWxIU1pKeG1tWDRMMW1G?=
 =?utf-8?B?WHB2MjhDemRNU2p6bGpML1VoUGVRcEFZMlJOV0pEdklmb0I5eVhRWlRveTFy?=
 =?utf-8?B?WFYzTE9aTHBDdEVHdHhGdFJQRnRYenUxRkdMbHhMSXpJMHV3SDZHM0cwSC9l?=
 =?utf-8?B?N05TR1ZTZVpFaDBlYmVleVNsOVNqSGs2V093Y3RRcHhFb3ExK28yY0RhU2hz?=
 =?utf-8?B?NEkzUGdaSk9hdE9EU05vWnkzaFQ5eDl5RzdFZ2lTSHRVTGVSUDZVQS9rL0ZK?=
 =?utf-8?B?YU94MkNKL2lzMlZzWG1qTmFhTmlMTWdIRTFPSmlWdzgxRnQ0ek9lS09NNUs2?=
 =?utf-8?B?NGc1clkzcitMSmM3RG9yWWN0dExHWlUvVFYrcUpnb1pFOFRJL0tLSWxTSVNU?=
 =?utf-8?B?cXNJeVltcFZsMDYrb0lXdTR4WkUvRkxWUU1mRGpMbXlsbWdaczJ3cG1XREVK?=
 =?utf-8?B?MHM3RTNXcDdJRHdTSUlnUEVOK1hGMGpqT1g0ZC9QbnZTd1FMcFJqQmQ0anNC?=
 =?utf-8?B?aUpaSUJoSVExbUNlTmREZytWeHdyVWpabHhyQk0rNisxcFBIY1hpSWIzWTBV?=
 =?utf-8?B?VG81U0FRSTZ4dkVMUm1VTncrWkFMVXBZYkN0MmZtU0VjVkhLSFdQcEhRd2pK?=
 =?utf-8?B?NzIzeDRDcGRjQzl2bUJ4WlVILzBvNEJ3MExRc01xSExYYWhzcU1OT3JHamRn?=
 =?utf-8?B?TzgwZHkrMzJJaDFlMDVGd0dVcVhKem9WK3pNT0JtOG4rZS9DR1NIV1pEWHY0?=
 =?utf-8?B?YXMxaXRMSHJLVDBOZGZEY1BFaFZyNVpSZkxXRlFmcGZYb0xHZzFmeHE4SzAv?=
 =?utf-8?B?U0dwdTJ4cXBpeDBVOGpvdjRzUFBPdlhwWGNCRlNETHpJd1YrbFkxZnpwaG1N?=
 =?utf-8?B?QWF0UDR0cU4vZ1FET2RQMDkwQVl1K1g2enBBbEJ4Myt4L2dXN0d5WHFkVmpF?=
 =?utf-8?B?RjdsbjhJLzhuVWloWHhNNGgxV0RKQkJKclZYVjdZMHhsR3ZoY0ZLVHFaNFJ3?=
 =?utf-8?B?U0RreXh3Y3dpa05taFF6WnZIemlYbFU3SUpINmh1UTJNdGJQcjZsK1FUVUIy?=
 =?utf-8?B?bTJabmxwUEZ0YjRlSEJlcUthbVpUbzByU3d2Y0pkUjB1L25nMW9ZQ2ZYY0JM?=
 =?utf-8?B?U1krNERCOXJRWGhkYkVEZFhNOXdKQlBPcWtwaGlHZ2UxbW1IT3czM2VXVXlp?=
 =?utf-8?B?MnB6eENlbzFqYk56M2p0MlZXR3VZSEoyTnVvcjZHZ2ZDYmFwM09BRFB0VGpz?=
 =?utf-8?B?VjRNNStCZHJWbkpIOTU1bmtkQUhqWVJuMHVzd1hjSnlTVWplZWVFU2l6ZkVE?=
 =?utf-8?B?dDRqYWNrUVJ0VG5obXhqNUVwdW15UDMxSUxRNXVYNjV6dlpYdTQzYUtQRTJx?=
 =?utf-8?B?MTdxRmpjZVRKanBEYXFWS3VZakpWeDBzK1p2eEFYQ0N5MURlNkVVeXdsOUZp?=
 =?utf-8?B?S2JXMlNuVWVtMEp6MU9QWG5QT2ZUVnBVQTdzbTlRbEZFRVdia2RKVlk1NkV4?=
 =?utf-8?B?U2s5QmRaZ3ZQOGlBT3ZOd1ZweTlTclF5SjhpU0FmZkViYnl3TG9JN0VIOXhh?=
 =?utf-8?B?Z3JvTVVycG5TM1FwZkk1dit1dDhaQVdTYTVvNnJhcCsvZFRHbkp3c24vLzZD?=
 =?utf-8?B?dVFSVVpRWW82Z1c1eXd6dDQ1bC9yUjlqSVVhaHJ0YklJRUNGYm9ja21aQlRi?=
 =?utf-8?Q?C+CZjGw9kVqjJSTa2ecO0IFVO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdf4b58-790b-4a10-051c-08db71b7d465
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 17:57:36.0958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjRti/PPa4tk5iWuRYtpUbLwlQQIDtVPlgkMYYAgAdlg5YYNMoc61PrqfDB1FMQ+9pEoA5QuBxt+Ej99TMeiPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
X-OriginatorOrg: intel.com

Hello,

I just came across this discussion regarding s3/s4 support in virtio-gpu 
driver and QEMU.

We saw similar problem a while ago (QEMU deletes all objects upon 
suspension) and

came up with an experimental solution that is basically making 
virtio-gpu driver to do object creation

for all existing resources once VM is resumed so that he QEMU recreate them.

This method has worked pretty well on our case. I submitted patches for 
this to dri-devel a while ago.

[RFC PATCH 0/2] drm/virtio:virtio-gpu driver freeze-and-restore 
implementation (lists.freedesktop.org) 
<https://lists.freedesktop.org/archives/dri-devel/2022-September/373892.html>

This is kernel driver only solution. Nothing has to be changed in QEMU.

Jiqian and other reviewers, can you check this old solution we suggested 
as well?

On 6/20/2023 5:26 AM, Robert Beckett wrote:

>
> On 20/06/2023 10:41, Gerd Hoffmann wrote:
>>    Hi,
>>
>>>> The guest driver should be able to restore resources after resume.
>>> Thank you for your suggestion!
>>> As far as I know, resources are created on host side and guest has 
>>> no backup, if resources are destroyed, guest can't restore them.
>>> Or do you mean guest driver need to send commands to re-create 
>>> resources after resume?
>> The later.  The guest driver knows which resources it has created,
>> it can restore them after suspend.
>
>
> Are you sure that this is viable?
>
> How would you propose that a guest kernel could reproduce a resource, 
> including pixel data upload during a resume?
>
> The kernel would not have any of the pixel data to transfer to host. 
> This is normally achieved by guest apps calling GL calls and mesa 
> asking the kernel to create the textures with the given data (often 
> read from a file).
> If your suggestion is to get the userland application to do it, that 
> would entirely break how suspend/resume is meant to happen. It should 
> be transparent to userland applications for the most part.
>
> Could you explain how you anticipate the guest being able to reproduce 
> the resources please?
>
>
>>
>>> If so, I have some questions. Can guest re-create resources by using
>>> object(virtio_vpu_object) or others? Can the new resources replace the
>>> destroyed resources to continue the suspended display tasks after
>>> resume?
>> Any display scanout information will be gone too, the guest driver needs
>> re-create this too (after re-creating the resources).
>>
>> take care,
>>    Gerd
>>
>

