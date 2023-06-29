Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88033742AD2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 18:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556993.869944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEuol-0001Lh-UF; Thu, 29 Jun 2023 16:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556993.869944; Thu, 29 Jun 2023 16:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEuol-0001JK-Qa; Thu, 29 Jun 2023 16:48:27 +0000
Received: by outflank-mailman (input) for mailman id 556993;
 Thu, 29 Jun 2023 16:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDrB=CR=intel.com=dongwon.kim@srs-se1.protection.inumbo.net>)
 id 1qEuok-0001JC-Ek
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 16:48:26 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfd78cea-169c-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 18:48:20 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 09:48:10 -0700
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 09:48:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 09:48:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 09:48:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 09:48:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 09:48:07 -0700
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by CH3PR11MB7249.namprd11.prod.outlook.com (2603:10b6:610:146::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 16:48:04 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::b33c:de68:eacf:e9c4%3]) with mapi id 15.20.6500.036; Thu, 29 Jun 2023
 16:48:04 +0000
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
X-Inumbo-ID: bfd78cea-169c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688057300; x=1719593300;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GBh+Sv/amPAsxBcRSJeMklTMNhqeaL5uZpm84YynRHM=;
  b=YMR++dY1wWQBIvEmjc78cWhCGP9ceYo4C92ZmLFFz17LIvP+uLfj4QoW
   7X8arb13F2LE68QSq7RX8d2PWtCaLL7PkVl9iI5SXssaj2wVx4N2pNUlB
   ySc/HoKM8c9Of9SHHtJaL1TZOD1N+dw192Bq/e29MY5q3KXpiK87ts0Cm
   845FhRQHoMqF4EdtHFbUjKJo0/ALHpVxCv74dm1FyvuamqXJQ23er2tIW
   xvstl7v5jywognuJy+dJ+M+b+UAkw8MLyiVbDqDxRenIexMyAqLFMRczq
   RafGJeqxohbETu0oSXC4R1vee+cNYHrmYpcJkgG7bhafaO24RqAsRshDS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359646261"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="359646261"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1047857834"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="1047857834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8edgAVvHxvSbvnz5/zEwsqt/EoBOpdEQRacO2GixX+kjIGwV7lTLxRbOZIT7yBKcXqoOUBxVXRKO/lgSaDwbMypzniHHNud8CzWpUVQACWZmu+QPaFzxMF8PBlbhALp2gZyLmxcgHUjLYltgzgP2yjOsxKwBfGhOCM/GujQgDsRd2RKBkrh+Jt+36kCh3/a9wvF936K4ahje7w/kbHP05RZMHTO1lq2eMQOUq0BpL14fSXYMtF32rwAEuosyAdqTcvcwkDYOLKJWDtFLIJatB7UIhe+uz01w4anzmmloLtgRe4BmfQEJJtFdVGhfgIYy1BjLuSYRH6Hl6hld4LeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obaEIbrZyVFCMlpZnXrItx5UZtL53gws9Zj7nTlNfDM=;
 b=VrTu2gxKVnjSGAVcp2q4Xgh4iF2P5iHZ4wZkJqQawvDXB5Sc+8XYfaoNz7t8gA88TtrPa/WQ6NOxpw3JA32zBi4O4ZY9aJwfYGRIpMo+EtjEI5Xp8aeES8EPTgP96jXLkoVYGohu8Yn32iEAtOT1T04eJkbaF4xXIp67+lvlUvIrq6whNxMwssjEI1dPgT4gd43rNuIjFRhfpg5a3TQlsDhsjynulPz3AD73oop+g1GUTga0BScG7ZNQAB4DKZksoyZ1UKkMyoLHi6xPEg/oOm4WXGahbiDjLlx9GjE0Z9iNRICoCx9bTNQLaTZfaR4DGfQH9LanVUk8lMy+1V+YHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Message-ID: <2401c7ba-6eed-f2b2-cbe3-d0ebccc7bc26@intel.com>
Date: Thu, 29 Jun 2023 09:48:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [QEMU PATCH 1/1] virtgpu: do not destroy resources when guest
 suspend
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>, Gerd Hoffmann
	<kraxel@redhat.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia"
	<Julia.Zhang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20230608025655.1674357-1-Jiqian.Chen@amd.com>
 <20230608025655.1674357-2-Jiqian.Chen@amd.com>
 <CAJ+F1CKjTW7zycr2xAW0x+d_7CEy+LxWur2Tqp2dvsb=PoJ5Dw@mail.gmail.com>
 <q2rpqbg5b4bqxb7oayclzgbf5fplofm3dmxgmpmskjf4mcfzpn@peeiuxwkqxbb>
 <BL1PR12MB58491E2E13F959365AA3F594E75CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <lgan3p6wqmxht5fpduh5nvg3f5m5n636k7zrrealnu2lilghhh@qlbvgu3l4apw>
 <2164ff79-aa09-d959-cc61-c7a2a21db5e3@collabora.com>
 <2s33vb2tfogntkyk5laxzcmgexf42mhkpwr2gh3gjvpitav6ez@h5zbmuklzmv5>
 <e9e10508-c26c-cf2a-6407-8e26a1342370@collabora.com>
From: "Kim, Dongwon" <dongwon.kim@intel.com>
In-Reply-To: <e9e10508-c26c-cf2a-6407-8e26a1342370@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To PH8PR11MB6879.namprd11.prod.outlook.com
 (2603:10b6:510:229::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6879:EE_|CH3PR11MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3b9f96-6043-4b81-cad1-08db78c09baf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ireVCXVjeUULo/PGrFgABEpuQ57NNy88oL/4KjuePAfZRsU0QZ4lwHvfKV5LW+Af5v6WZG03hLrw6CJw4hmD9YpwlTme4QS0hbfT1AZxnrBTiXZjQkXrYgTEeeJD/Zwa6J/2bhTsGa1MY6CkD5tSOz6VhuVn+fAsxSPkbyvvatBB5ib5QzNu9rHQrE+g1rGQ+yO0lqC3bnVLDYb40yFA9UH/UCmXQOsy6Wgsemm9ki8wA3nP0kPPnjAtfUryJQ2y3DvAK5A+t90v2qEzu3cUmwvfNsvQYbxkX+CtIzs0AUEUwB/heTBTpk2t/Bqa4MSWBhA6Cm1s4J3MyWzjtl6IxmLFl0SykjYcVDwV8HYwcga943+kM5JoRoFtLf+yKPdjXwVW6Zu7KY5QJFFYwYeu/a0TdZt5Pet7ikTeeZ7iKoSvdqKcmnMvrez5KyReoIK9sGfs+K/O/2Yc8U7E2bKYFdTBwbaneRaTs+/2zlYxOT2Z5ucvvziG/uvcsZnueNPQFEE17T1SZLiI8ERqx3ghbZ0jwhKT28icOHGPMj5OfZKbPgYC2RnCpbFM4OmHi8hMFGY8FcmHvKoi4ZkvB1JSiRxo2vE/5zu7BbIYsen5w8ACIAIEKzWGlftkr1B306uBXlAYOaj8SPIYpadW0e2+Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6879.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(83380400001)(66476007)(316002)(66946007)(8676002)(66556008)(8936002)(6512007)(186003)(6486002)(53546011)(6506007)(26005)(4326008)(966005)(6666004)(2616005)(110136005)(54906003)(41300700001)(7416002)(5660300002)(2906002)(478600001)(15650500001)(38100700002)(82960400001)(31696002)(86362001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlpQQVl2eUxpaHZrMUpwbkNlalppc2E4RHFkTjUra08zbExoNFNrN0pwS2NP?=
 =?utf-8?B?a21hcTVvMTdEejU3M0FENlEzdjNBQmtIT3llUWtTUENPSWZ1SnB1bmVjd25H?=
 =?utf-8?B?MTNZMGExZHE5ay9qbHpjQW83MUVoWnBVWUFGY015emhmeXU3aGRQcWx0dHlv?=
 =?utf-8?B?RU4zaGxJS3ByZE5aalVReUxRSXFjNThCZEI4a0R1eFFSV2JtMlVwdGluNW5n?=
 =?utf-8?B?NGl2eFBoaWppNnQxY1RZSk44VjgzK3FzOTY4RGNxQjEzSExUaGRnZDRjNVI4?=
 =?utf-8?B?RDVuOTVrUFJJYkhXeWIwbjdySUFNa1p3UUJBV3VwM2wvclBIMFJtbXpQazFy?=
 =?utf-8?B?NjBxaEV6OUdVWjJhT3RSUVk0aXFjMGxsNTBJZndqZGxIdnFYREl0Q3Riek1K?=
 =?utf-8?B?NHU3K1NCdE5pdVBSSjZVRG1zRk5yV3Zjckc1UXR1elJqcXh0dkdXVkJZYVZT?=
 =?utf-8?B?b0pMREVSbzRvNm9pY2l3bXNsRzltVFhKTHQvd25xZGl5UkNUQkF2blFUSFVP?=
 =?utf-8?B?VjdYQUF6S2VjQ2UyNzZybkgrbVFOeXIzU0xKNTRNSE45VXp2ci9kZGZRS0Zr?=
 =?utf-8?B?WVhpRE5INzd5KzZNK3lpb1N6UWVRV0RWSnV2QnhHQ0hBaEpBSmhiWS9qZGlx?=
 =?utf-8?B?RDFwckdFVnZmZzMxRmxmRHR4cmdXSXk0L0VuRkxxRnQ5SXpIRXFRZEVtbEJJ?=
 =?utf-8?B?ZmlDUzUzZUxmUWpNRHRNOExkU2xjNXRKWWRvMG9ScmxPS0dNTWErYlFJQUNl?=
 =?utf-8?B?Vld3Q3IxRnN6OStZVmNmcVZLWWkxUE1Ld2dIcGdpUHNZbzIzU3BBaTN4UlZK?=
 =?utf-8?B?Rm9FSFlKWWVVQUp1Y0UrMnNFd2RGRG1ybzJOVUtVM0ViNm8yT1RoeExDdW81?=
 =?utf-8?B?ZHBudjFUOVlvQU1GQTRPV005UFRqeDdobmp0b09kalVXbW5SeXZsdDZ3TTVQ?=
 =?utf-8?B?U29MQThXRmtCeDdxeExYUTdkejdmZTRMYU1KMzhxa3JKSmRyVFlpQjZWY0FT?=
 =?utf-8?B?ZG9jQmNFa3hkdnI1TFdoY2RrZm1DZUl6SURwQmQ2N0ZUK3BVa3JpTFNXY1I3?=
 =?utf-8?B?cjdLV3JXZjB2S0JCU0JPR2wzWHdCN2NML3VkRTVaUm9DbXBtUllUTXAyTVRw?=
 =?utf-8?B?TnFCblBDNk9sc2s2bk94UEI1RUtqMWJEWHVYd0JJdEd5dlNscjBETElBSExy?=
 =?utf-8?B?TWY1QlMvaWhTbUJqNVQ0WS9TZStmZzh5QkZvd1pPc2dFZlIveW85bEpIVk02?=
 =?utf-8?B?cVhwelAySm1RaG5MYzJiamgwcnYvM1hHUDN5ZTJxYUh1c0UxZUEzQTNUYlZs?=
 =?utf-8?B?UExRdUlHWmJBZEF0TW5nZ05hN0kzdlREUk5mRFp1NXlUc2RJNjRtd0tKRElz?=
 =?utf-8?B?bWZxN3ZqUGZxSHJrek5YZmtjaGxkdzAvUUM4ck5ReVNlTzAveU11cGI0azV3?=
 =?utf-8?B?MmhySnoxcUVUaEFsZjhhZGhRS0lzVi9OWGZWNjVnNFVXeXhJbnMyQy93YWk3?=
 =?utf-8?B?TTVWQUZXeWUrTWpTVFIvcGxFVFE2bkNUVlBKWVA2N3JGd2tFQVdmUGJlZUVC?=
 =?utf-8?B?QnNIM3lyOTRYWm01Rk1YaWVoMGxYRGErcEdnc3VZamxVWXBlSFozaFI3NmEz?=
 =?utf-8?B?V0JLWGJyaXRXNTFrdHJTVlZTZFZyK0JoRzVvbFp4dHkzY3YyM0c0c1lha0Y1?=
 =?utf-8?B?eTU2V2RjRkw4SUREWkpDRGlyR280aHNCM3VZZmpkQW5lM3Y4NE1GQVVaWFdG?=
 =?utf-8?B?ODV2aVltZHZvTXRXUDVEOHNXOGtXSDI5a0d5czZvQ1M4ZWMzK052S09nZFh5?=
 =?utf-8?B?MUExUkdBMVd1M3NBUjFLbHNjSFlqL0VNMWxxTVNBbWVrMzk0Q3pZRmduZjAz?=
 =?utf-8?B?VEF4K3ZSRU1YdTRndDdobzY2TEY4YkRwU2t1NlpYSEg5dWNsY0RpZTdQRjZm?=
 =?utf-8?B?K0F1VWh0ZzFNZjRRNUtrbGNKd0JQMWNCY1pGSXlYVlEwZ3dYR0lBYlBVMXhN?=
 =?utf-8?B?TTZqc3hFSWFzRjJ3NnU1VGlvbUFSQkY4MHM0NUZFd05YMlYrSnVDaURyeFQx?=
 =?utf-8?B?REdhUE4zUEs1b3drclFvSDBRTWFJZkxoZlFTSFh5eHdrcmoyNFM5WEhORlNo?=
 =?utf-8?Q?xjcB5/IxjaqABRR2MsnUkJSoW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3b9f96-6043-4b81-cad1-08db78c09baf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 16:48:04.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0U1QJPdTd9mkrKw7BOzU/TMlu/ekw7A/t9U2IwwYuCzPDCp2SpPghJ+M1CTfj2fbieHPKL+hP8ji8wG1ZWUr5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7249
X-OriginatorOrg: intel.com


On 6/21/2023 4:14 AM, Robert Beckett wrote:
>
> On 21/06/2023 09:39, Gerd Hoffmann wrote:
>> On Tue, Jun 20, 2023 at 01:26:15PM +0100, Robert Beckett wrote:
>>> On 20/06/2023 10:41, Gerd Hoffmann wrote:
>>>>     Hi,
>>>>
>>>>>> The guest driver should be able to restore resources after resume.
>>>>> Thank you for your suggestion!
>>>>> As far as I know, resources are created on host side and guest has 
>>>>> no backup, if resources are destroyed, guest can't restore them.
>>>>> Or do you mean guest driver need to send commands to re-create 
>>>>> resources after resume?
>>>> The later.  The guest driver knows which resources it has created,
>>>> it can restore them after suspend.
>>> Are you sure that this is viable?
>>>
>>> How would you propose that a guest kernel could reproduce a resource,
>>> including pixel data upload during a resume?
>>>
>>> The kernel would not have any of the pixel data to transfer to host.
>> Depends on the of resource type.  For resources which are created by
>> uploading pixel data (using VIRTIO_GPU_CMD_TRANSFER_TO_HOST_*) a guest
>> mirror exists which can be used for re-upload.
>
> unfortunately this is not always the case.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gallium/drivers/virgl/virgl_resource.c#L668 
>
>
> Often mesa will decide that it won't need to access a resource again 
> after initial upload (textures etc). In this case, if it is able to 
> copy back from host if needed, it will not maintain the guest shadow 
> copy. Instead it will create a single page proxy object. The transfer 
> to host will then over fill it to the correct size.
>
> I think this was a fairly huge optimization for them.
>
I have been only focused on scanout blob so didn't think too much about 
all virgl objects but aren't all the virtio-gpu-object will be 
maintained until they are removed by the driver regardless of the type 
of data they contain? Does Mesa (virgl) remove those objects after they 
are uploaded to the host?

>>
>> For resources filled by gl rendering ops this is indeed not the case.
>>
>>> Could you explain how you anticipate the guest being able to 
>>> reproduce the
>>> resources please?
>> Same you do on physical hardware?  Suspend can poweroff your PCI
>> devices, so there must be some standard way to handle that situation
>> for resources stored in gpu device memory, which is very similar to
>> the problem we have here.
>
> In traditional PCI gfx card setups, TTM is used as the memory manager 
> in the kernel. This is used to migrate the buffers back from VRAM to 
> system pages during a suspend.
>
> This would be suitable for use to track host blob buffers that get 
> mapped to guest via the PCI BAR, though would be a significant 
> re-architecting of virtio gpu driver.
>
> It would not help with the previously mentioned proxied resources. 
> Though in theory the driver could read the resources back from host to 
> guest pages during suspend, this would then be potentially complicated 
> by suspend time alloc failures etc.
>
>
> As virtio drivers are by design paravirt drivers ,I think it is 
> reasonable to accept some knowledge with and cooperation with the host 
> to manage suspend/resume.
>
> It seems to me like a lot of effort and long term maintenance to add 
> support for transparent suspend/resume that would otherwise be unneeded.
>
> Perhaps others have alternative designs for this?
>
>>
>> take care,
>>    Gerd
>>
>

