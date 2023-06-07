Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1672640E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544877.850956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6uw5-0007Hm-9K; Wed, 07 Jun 2023 15:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544877.850956; Wed, 07 Jun 2023 15:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6uw5-0007F5-5B; Wed, 07 Jun 2023 15:18:57 +0000
Received: by outflank-mailman (input) for mailman id 544877;
 Wed, 07 Jun 2023 15:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6uw3-0007Ey-Ns
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:18:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bb7ce0c-0546-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 17:18:53 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 11:18:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5282.namprd03.prod.outlook.com (2603:10b6:a03:22a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:18:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 15:18:46 +0000
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
X-Inumbo-ID: 9bb7ce0c-0546-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686151133;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t0nE1vS+krqiPIVvb1gt/aSnRfsnoKW1opWOn5zZLTQ=;
  b=BBFgWNICLwZsxi7Hg6FMqrWgl19UCYpzMYDvLtirRCAgR7ZZMnfKq6MY
   dUYNkSG5ZoDf3ZZWhRPkx9nVhOTvCl0aJTchOZ+/GjuB6eDb4bKJ7My2q
   nvy6qRBrs9YhG8wSbsGVEotWGP/M/MPhnUVFrrKJrhQJw+tLVRwAgQ5MM
   8=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 111818116
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZK4BjK1MndBWCNvra/bD5Thwkn2cJEfYwER7XKvMYLTBsI5bpzRTn
 WAcCmvUb/+JZGOjftx1aYS/oRsBuZDWmNcyTFZupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIm5Oy
 f4kChk0QwmYpN2Eyavme/Vcr5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1YZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAdJLROThqJaGhnW49mIuSzo7f2Cc/9rn0FOFV+1OC
 X4Lr39GQa8asRbDosPGdxi5q36NulgbQchdF8Uz7Q3Lwa3Riy6dG2MNCDBIbtcrsMsrbTUw0
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbkR/OCN1jHaidh8fwXzr3x
 liipiUkm68ai8JN0qyh5E3GmBqlvJ2PRQkwji3IWkq14wU/Y5SqD7FE8nDe5PdEaYqcEF+Iu
 SFen9DEtb9US5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysKjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:EZRS4auMhom1jVd508W/ms8u7skDp9V00zEX/kB9WHVpm6uj5q
 KTdZUgpHzJYVMqMxsdcL+7VZVoPkmskqKdjbN8AV7AZmnbUQmTQr2KhLGKqwEIcBeeygcy78
 hdmqFFebvNJEk/hcLopBO+CZIlzMOc+K6lwefSpk0dKD1CeuVp6xQ8EAGAVldrTxNNHpohCZ
 qb4Y5OvD3IQwVyUviG
X-Talos-CUID: 9a23:UfKZ2W/J4pO+JWK7knyVv20bGvwnTl/09VrJOGyHO29wFYyJeXbFrQ==
X-Talos-MUID: 9a23:SEBcfgvkY0yG5A10ls2nrwFsCYRPzo6VLx4uz88bgMW7JA5CJGLI
X-IronPort-AV: E=Sophos;i="6.00,224,1681185600"; 
   d="scan'208";a="111818116"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MS5TRCBc2NR61pTafnRw7083D35LbXatbBRuzmGCAxQF/vDPSHZa4mQCJLZ1jESyDT2HAFgMRqVXDHpHBURnJih1duF5r2BvYhAJWVFVobJE1Ua/Ny2jDvOITntXyOWD9XmErGjn/m3Yxc6tX5fUSnAr9J2hmofiMvTvP9g4iYJ5dgf/BYkuPJmtaHAj7LKxTGwlaImLhv61/pPLUYlprGDMsIkMCE4bZBpoPkMhVr/XiDqXSNufyGTnqvAn5HXXZsHq2ie/1c++EXQIuGULcssdmDoJCzfydwBT7NFwbV4zr8NkgXclcY6HSDnINX5xXc2NfFf76tGkRArKVwrl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0nE1vS+krqiPIVvb1gt/aSnRfsnoKW1opWOn5zZLTQ=;
 b=YnRKdDQqqiIdw4SBqDhzthC1rLeDzj8jGcbrHrftUeTV7lg20TcYumhLSZE0GfrNaIoNJbb3IM7YWgtNXJBRj6NlM2bsACMReHDHi+IHhi5VuZ9lvMOoBiN26EwuGGXC3DM93EP4+etLp6YURLbmhj5jGZd1qKquBM6q7aEd2L2eNA5xLz2G58K8UvFvPvqW0cFODtE2ZsFWtMAHCYke4cRYkSOJjQqd3kUytxWCOe3qlNsC2VzSEijXizQ7sRaXK8c9WN0EVdFiJljK/P6uBvbeuP8k5BnSj2GA7oUjQTICNl5YOJ7fJl6YyQU2WOdZRhUXZ9j36aIdHhEukwVgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0nE1vS+krqiPIVvb1gt/aSnRfsnoKW1opWOn5zZLTQ=;
 b=v1O3erVyWfMHImplwyaRm0p+SEwksJU9o9QgvjBUPgFxyNyVaw/ug6km7uJccvugwkZFDcSwNM/2q4XfuuyYQ4xF51BKEn2gLsm0MvKlGtMpVePBKdDoHS2vWwnJ6xvDC9Tbeozo+Ef2y1sLHMycxbyqW/mx9Haan1vvDxHaRyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d2cb0986-e5d0-8957-2ba0-c4f7150d5bbf@citrix.com>
Date: Wed, 7 Jun 2023 16:18:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] docs: Fix xl.cfg documentation
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, bertrand.marquis@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230607135419.3498902-1-luca.fancellu@arm.com>
 <6e15c9de-d8ec-2900-1fe3-5d743f5ae1d7@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6e15c9de-d8ec-2900-1fe3-5d743f5ae1d7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0618.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 777c6c0c-257a-407d-053c-08db676a7cb4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L4EhY/9LB8TjzWUpDxPnjDoT3W0PYQS0McPaYSBT1KMRJoGEFhL1T5WOwU7XgdlcmV9yMOd/OEbRDGhVEiqAwCrS03fGv19xzSsXr+tKg8yMN5oqXSW5dBg6tESyy88ohf64S5XSMWqLj75iVhaoqjIPeGpiazLss3l00RMeLOdymSwMWav7KimWiDI8SMRNnIafSF6tJ3BSraMQFNZmqAXjPoyouWFPvQagF7CzWDaHYq55zSMvNxk1FhO/VNFp/Oxh3q//nrkja+srYiFOsangXyVHcc0UkpN17Jxe9Sn6y9GwIeE0+az9UgxvQbBQykyXj/IZp6w+rq17mnm+9yyHoXS0M9kH1Pri3S5iEdk7bFp1zUuOhMEiT8WYj1CcJB0VAdydFxSv2xN7TCXPWjeouo7CNGqi6rSer/ThRNsE0hWh0JzC1ssZjahYFLKNeT3K9jnh2eg+UPbID2oAEyEfL+F5iS62lFo+INXGp74N0uG1VXWNa8gcMgR7g82tBC9dYKYB0oaatrRQLxqmd8byZ39LoIpyXrQu2FHNWZkfla0f8uIUFeHZj8vJBmrLxwtVy5L5lEnmGy84sLWReM1sJ0dI4oI5Twmi82gGKfT8ta0Acvd8vwVfuTf6LxWXJiq2wk3e5ncSpqzcV+EBog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(110136005)(478600001)(54906003)(8936002)(8676002)(82960400001)(41300700001)(316002)(66556008)(66946007)(66476007)(31696002)(38100700002)(5660300002)(4326008)(86362001)(36756003)(6666004)(4744005)(2906002)(6486002)(31686004)(26005)(6506007)(6512007)(53546011)(107886003)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlhJcUlhaEhhWTZlRk5HdTFXdHdQMTBLRmNHTDd6cUxnbHBYbGc3UUxrall2?=
 =?utf-8?B?aC94ZndZQUNRL3NkVG4zSkFCZWkwd2xkcHpVTTJFcWh1ejRLOFhXN3VZZWo5?=
 =?utf-8?B?UkxqZVV2Z1lxcG5BVWNuMUlIU3M1NWFYaUo1eEtScExqYVFOYzhSZW1EOEdl?=
 =?utf-8?B?cHI5Zk1YYlJYdmRhUUxVZ2JucHI4SVV3ZXJJWVN6RDFtQUZoTmtSNXAzL1hq?=
 =?utf-8?B?VUtvdEd4NFJDOXZXZHFOZXpIZjVBWGN5anFYMXhiczZZQ2E1N3BDWGs2UXBI?=
 =?utf-8?B?MnNOU2V2Qnk3Zk5taTEwMGZSOHpFNVVZV1pPRlpTelk1VFBoYjlPZVY3bjcr?=
 =?utf-8?B?ZjAzeU44NG9EUGZXRzJ1VDFUSTlsSFZqSWVKcTF2ZmNJSW1HVUVrd1RoaE1x?=
 =?utf-8?B?elIwbWcvemxpbHJ6WGNQUVVEWnZCUEFQd3JSRzUrbEJJaWszVGo0cVpHYTNs?=
 =?utf-8?B?WmdqanlneTRyc1Nuci9sb1lrdm10UlBnQlR3b2F3ckNZS2V6dG04MWtTRno0?=
 =?utf-8?B?VHc0UHRCRVMrVHQvS2hud0xKa0c3a3ZWZ01YZy9GR1h4R3hWWWZPV1BUT3pS?=
 =?utf-8?B?SlppNTlqZ1JhQjBoQXNHb2RHRERhMnh4ZkRNOG1va0gxWXB6YS9JOGZDQlA2?=
 =?utf-8?B?ckdSQmhtYkkrcGM0QkZjYlhkZDFrK1RMVHJWNTd0RzVuNXBweDlhSjRoUW9o?=
 =?utf-8?B?Rm5ZK3pKRDV2NVpBd1FTUFBTV2hvVldQRHpTeU5uSUhZVFR6UTg0eEZ0aVFJ?=
 =?utf-8?B?d2pwdzlZS21oVkphSUtWSkpMWWFGZXZUdGhrSFdSMGViUFV2M2JBam1wK2Ry?=
 =?utf-8?B?SzFyUUQ2czJKWkFWQ2NDd3RXTTJsSlRsRTBMWWxKVTlXcThSRVhqdmhleDdQ?=
 =?utf-8?B?R2RtRENLd0tYTFBJNGNaRVUxZGlBSE9Zdmh5TDhyUWQ0aGdTWHUyUDNvNFRm?=
 =?utf-8?B?M3BJdnRmRm82QnprSmdxUnEySU9wZ3lzY2E1bzR4eGNyN1FJSU9hZHdMVFph?=
 =?utf-8?B?NE9DTkd0SlpZTkRlSnNXVGVhWXpmWUFxUFZEeTRheUNJUHY4UHZpb3FNQ2dN?=
 =?utf-8?B?bHlybWlvaXNhZVBlMTVrRmVkT3NITk0rUG8zYlN2eURaeXljYys1NjM4em94?=
 =?utf-8?B?L0FVMC95VFRpQllDZVBHR0Z6VkZmYUdvd2Y4Ulk4Z0ZEcG8xVHJrbEVXOWor?=
 =?utf-8?B?SnBDNkZEckZqYnE1SmgwN3o5dXNPSUY2ejNwdEUvdU5WS2FzUkNLbkMrRWMw?=
 =?utf-8?B?NVRpckN0cHQ5NElvbnZmM2R2NmU1TUdqOVMrd1ZmRW5HVzg4WHRFSlI2TjQ3?=
 =?utf-8?B?R1ltWElNenJaK3QzWFpCSUtLMDN3T2Y2R1FuaWNYMTROeGNhVE1WQjZWVFlD?=
 =?utf-8?B?TDJ6MDRhNXVmTmhyRWVxVUNNSGs3VlpMTzVSYVJ1VUhFdjdlSXVLRy81T2Q2?=
 =?utf-8?B?aGE5cGF6a1lnZ0NoaGY3TXhMNlVBSGt2bzZ2VUlkWDhBUTRMTms0S2g4dk1k?=
 =?utf-8?B?R2hqZWhHdDEyNHl5UFgzZk1PYmlSa3RLQ1dxS1pVQmZZenRxbEhwcU1UZ2hE?=
 =?utf-8?B?Qi9oQkthWjB6YjVEUW1TNkFWd2xvWFcxQktIQXdxU2lIaTN2aWZNS0lmakJp?=
 =?utf-8?B?eklXVU5vSk52NHRLaWRRZUlhVy8zeWVTTmV0SmVDWGpGcEM1K0Y3aGMyYnVS?=
 =?utf-8?B?d0ROeVFHUm9YamUyY0ZsU1RRRXZ1cU9lenpNaEVQc21nTW5scUxYWWhQL0I3?=
 =?utf-8?B?QXFUcjNFUW9BbmNZTngrVWdlVXd5aEc1SjBYeWY5eE15QWhlVTZraGwyRkNQ?=
 =?utf-8?B?L01BdHduaGdmWjJlSjFRK2JoMTVUcWFGMUlVOGxyckFYcEZycFdqTmE4STJF?=
 =?utf-8?B?RURrMmVaY1RmUCtMc2RjTTNwS0c2YWI1T3NQQ2FMRDNHNzBKbHg4ZGVPZGRH?=
 =?utf-8?B?SGNnSXVoeUlZSjRNanRlMURKbVJyY3RDeWZVNm91RXBuclVvakZUaEZnM0Yr?=
 =?utf-8?B?U0pXTDEvWVBWdEo4dHVpczErMGRXVnFaMXJXeW5RL2hHb2gwSW0xaVRScGZv?=
 =?utf-8?B?REJRVE9OVnVTYVpWK2FvN1ZNbDFlVWgzQkpxUm9jZmdENzFQSS9lenVZbDZP?=
 =?utf-8?B?SnBvYTF5eWNVUlQ2czlnVlUzMXJjVHdzd1JaRFVQVTNBeTJxc2EzZHBscERD?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ho7T+Bv2OWfByNK+MQHP+tsf9SRKcFWaddzM5R/q+5VcrDk1mzT2ga052yw+7D1wzlbtbkP66/DhLAcHNmBB3S4PUrBh84Pu0assq1DfDybEl+BD5n4DzZpHQcVSOoHbts2HVSJ+OswCTvCADqrfgdTobl/yMxjT7JETFboAOjy8zvmkVWZxuxNrlYxuvQGMt7whBjQgy6+Z1i9ZOOLBIiBinriLE1WNLKqIRQqRkB9Yb9rVGmKBm3xnS9piK30ryMSbCmWxpONMYUmjsBWCps2l1CJdRf2iy5IbD0KQoi0Mb+EYGlLjxYVfIHJPpzFHm6IkkcgVeL/1eDquyIAGR7iOUHyWHvgNBj40SJuQkS5Dr02BSHy+M6Ocp0PBnuSjvJ0QD+kzqtRa5pkP+8HXSs8Cjq9V35SlfXyOIRt9XHApxMl3By4b8wtiuAjP7ZLkyMdMP80n9aW0iTTuWK6SLlXwclbCKGDaLzHhH5AWZ/9vt8/VG/sxqnsSX3mUPzgaSeJRT9DjJ+1v6UFiWaCZBMjErML6WMbqEsWmsvPjz3bNzhH4i+Odt4JRb58cWUC34FxO3NBMVIX6/Tusa9YrrIX5Nj+HcMqtvxqIAr8fp63Bs/S5SgLlk2btOam3xl+2cWXburCNfdt94qPY1ei4ZarKjs2AYHGkzMWgxXXxX8OL8PKlhS9PFJgUmDg8c5+is1o8XbEw2wQTsWWYKny+nFlLotKCQratJ0uCwadKCblSc7y1VF4lk9YBJ8NlWJY7ZCmEAs5vQGgpRddxmeuDRncVTpAuQ5ZdVGzeVXYugMfGgamplJtkCpsmsGlv9AlzAwK1Y8bt3wikyiIY7HGvZQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777c6c0c-257a-407d-053c-08db676a7cb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:18:46.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBGr8Tx+5q01KZASooCQzDpSWdMmw+ZE5jjT4McM3K7QX0gFnBxklHbQrmlxXgK8H80b3j1+McNzCTE7Ourn1DQgAU1S2vUheudhJTm/YV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5282

On 07/06/2023 2:59 pm, Michal Orzel wrote:
> On 07/06/2023 15:54, Luca Fancellu wrote:
>>
>> A recent change to the documentation for the xl.cfg introduced a build
>> error, fix the issue.
>>
>> Fixes: b46e8207d0ae ("xen/tools: add sve parameter in XL configuration")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested and looks good.
>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Tested-by: Michal Orzel <michal.orzel@amd.com>

Committed, thanks.

~Andrew

