Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F34923AF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:18:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258423.445007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lZd-0003DK-In; Tue, 18 Jan 2022 10:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258423.445007; Tue, 18 Jan 2022 10:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lZd-0003BV-Ep; Tue, 18 Jan 2022 10:18:45 +0000
Received: by outflank-mailman (input) for mailman id 258423;
 Tue, 18 Jan 2022 10:18:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9lZb-0003BJ-SM
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:18:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c34a71-7848-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 11:18:42 +0100 (CET)
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
X-Inumbo-ID: 01c34a71-7848-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642501122;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jo0SUgBr3ozx4mBnkX9E58Tv5X7GQEfN3DoFeKmUyhE=;
  b=N/CqISSiMHsCOFubGqxb60sEnEcCbn5QM8FLxZXMb02GlrgS6HyHiBpE
   K63kJAAwtD7lCWiIuMy+6Xdeh5x0cl1I3Sh9AI0MTN9+rBd39olAJU8eM
   paBK+NEkmi5NalgQ0XjykJCbvyMYp7wF56vYgHeWo90u5ZsenDPj9d6mw
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1lh6RYAEaDucqum+IADq/clDzhu7xtlkhJ05xAogjqk1Ot1inOxvzZuV1EPle4S13+POd/UYwD
 qUD0RS2Vhq0nW1C4GbbSZ/VvhAqGvqKjCh72+KB92UtwGPcQY7iWdR7tsaK9DhZr0q283mxtxf
 c2YBuW6QzqPxYgbAluhM6V85UqMqi0a2O7nksqXbze7XGpr/f5Magt1VETbIRQDl3K7by6wm+X
 8v0eFDsgrrRtxzXrZXxJl3L7N2iozNMGs25XkMi23qcmYhz+5mr2E+FCQg6T4Z3cGVcHtuAMNp
 1WWOZ4C1S8YkwXgSGI9bRwaK
X-SBRS: 5.2
X-MesageID: 62123856
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6n1aVqsmLbwqZKVCIQBatyDY4OfnVLZZMUV32f8akzHdYApBsoF/q
 tZmKTiFaKzZZGbze9xybYjlp0pTuZSBzdI2TgJprC0yES0U+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2IjhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl67upayFyBfPwvPU6WkUCSTxeA6ZM5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JoXR62OO
 pRxhTxHdEXySQEUFk4sM8x9vMuXqFuiQhZmgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDZCfMNyNbYBtj2p243dv1zDG0g6RTRePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb4
 xDofODEvYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0keBs1Y5hYImW0C
 KM2he+3zMUMVJdNRfUmC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhRfCdrXs6n+pUHHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2Bf6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:MMWCia6QYH7eYlUzJAPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62123856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWE0mJTeDmqalH/txl6aoCQXOccMPMngOeVmsRi27b7GxRKNngoXq6wuY80eXmkYhqgPFigNJNPtsiXy7RE6JOBxdHca5Qtj1dAXh+Up5wnuOUSbC2lgJPr5W1HPEIGZBbV34EgZoKT7TCiI6xN3C95rInw4yeMdmkSimc8Sl9P5gRT+idcDHD+l9/XfokG8fwh6/XHRpbClSOIQqHg45cpXeuyI5Vg6YONWplfbno0cCPjsCt4/egPLVcJq0lx5E7hjQxi3YrPIgARwIOY4SScbCBXRKtfrg3ky7N25tHJlad83NyB0TVEQF3r5gOGvQZj+l7wrFo3z3i/ya/h+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tgf4MXKWPkhZJdX9p26p28RqL6p0tLHs30ZpbPiOGE=;
 b=AaHBs9pvYUeb9ex6KTF4u0ldQqZiePdbe639Ij55IwQyyL3lirf/o+FOueIFvvWaSeJshGhedJOktUqgpXFJcd7wiZgZwySTZkq5mV/OcOKxSZ2/56qyblyYP5XKmmPTZNZtENCIaWoNI8My01kNi8zH0/1O/2voOJo/fPbR1a72SSh0KyU3PWQzm88JizV57M58NUaFU1UrhkeSPHOp647/FVTIIOZFrZyy8Jvrk+xqAC1Ja/WIq7+dxRPEdLxFKR242mE8LCmzWxz7i78vkh0gu99lJi9Ec/nakuygHWMmV0oFXWSy8HJYVBBOgVKd828e/rqRe8zwmwV+fqUU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tgf4MXKWPkhZJdX9p26p28RqL6p0tLHs30ZpbPiOGE=;
 b=xbA3yvPnZ7UJmON13yg24Mzp+NvdEjguTLujPIxshT4xloNqMwWUud16UWRwjFbD66uPi5/22Vs+RPwW2110FXWnyPWy1pu9y7k/ZvYSdbT/Ojo2jtcZCwph3parOGYJZGkOp7pbtD9g6CiiuMFJUJRF/ROsgt7iX+BxCFlmWtA=
Date: Tue, 18 Jan 2022 11:18:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] x86/mwait-idle: mention assumption that WBINVD is
 not needed
Message-ID: <YeaT+LkWbH8Yx5qm@Air-de-Roger>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <0ebb0de3-2500-a9a2-8128-64b9d4a27cb7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ebb0de3-2500-a9a2-8128-64b9d4a27cb7@suse.com>
X-ClientProxiedBy: MR1P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e271d97-492d-45c5-70a7-08d9da6be3c4
X-MS-TrafficTypeDiagnostic: CH0PR03MB6065:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6065F39B30479D38B6F801DA8F589@CH0PR03MB6065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /K6jETxt+fY7co2BKq2wMlx2Z+oyM85CyAVF2pTFzk89IbQbWlcGRfG/9uE0fCmO9PlN0nk5/s8nDiRJkYSmQJIq3XbZSijopOkngQ8z3utSbTuSvojeEfjiigmLcjk1n62a38vFmxC5XqaQKqghSxmkXjqa4LGbX2BM3F8Ec9UduZc3kYfiq0P2aXrmB9N+/Byr8uK3I1xyFtjq+K/g6/6sfQFi85dJIfRJCTNGQwQJqi1FfRi2E7DCq8WC/Sz9xrpo4KJ6ANIxpMzZ03YNL5e4CRvGmqdxuYwOGYRRgblOuZiyG3sfukoBLBobQc3WNlACy46YEAr6F84U6Gusbd5amTOH9SzuBh8SVzgMksGuC2XpiIsYRNjvBd6lKgfNBbl+qsx/P6VJiGXsyC0RnnC9YYDyph9cG6gmiI9ly1Tq6rZoIpgAFxCZSKqKZAc5NGsoChRL09obkHTDmkpZJ1VI9TLj0vQKu4QbPV+5UFtA8bvUUoKjyaDDAK3BOIGvmwYeDHETygwqRjzFey8xMf78g/Ke1QS9Cs6IiUkjCN9BiD4Ulk4LRGDaLSDlbZwps9joNbBCRswcNu1PsRy1ZVQbJfsCTfOMjK2tDeM++dK/5jSArmmCA6EvokqKVO7+4HdY6wvYwvVAKftn8c0NPwthH1Gree1x4oHJvehJ44+aQsJP2wA660e1Ez3pYjWnSu5CCXcaNvx2hSMQ0OdoTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6512007)(9686003)(6486002)(316002)(54906003)(508600001)(38100700002)(33716001)(83380400001)(4326008)(2906002)(26005)(66946007)(86362001)(8936002)(66476007)(66556008)(6916009)(6506007)(5660300002)(186003)(85182001)(6666004)(82960400001)(8676002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVIvQW1OMkZCMDFMTGlEWlFINWEvOVY0c2dBb1pUQzFRQ2lDRWNCUy9MK3h1?=
 =?utf-8?B?dkFiSlVuLzJLZkl6K0ZRcFFWVWFKa0dwVHBQczcyekxjaFd4NkhyUEEzVmlr?=
 =?utf-8?B?ckdHV2h4TU1mRUNLR1lJYUU3aUFVVGx3WitUSzV2RTBodEQ1VWhGKzB1SkdX?=
 =?utf-8?B?Q05WaFJXcHlvZEpnTUZEMS9qNVd0RC8yUEhXemNKd1phQWRWeVVieURQM29W?=
 =?utf-8?B?RllOZTR1RllxSEtUOEJRdU5FenFYaGhrODMwRHhScHNLaFF3b1UxM3p4NUVW?=
 =?utf-8?B?d3dicS9sMnJ3S3NKN1pidXh3L3NPYzBTUGNzMXQvc3J6RGdDZ2JITWRXTENS?=
 =?utf-8?B?S2VMd0h2ek5WWDZUWXhvYTF0VWxucXEwMS9oQTBBT0I0ajZiQlBISnp1OVEy?=
 =?utf-8?B?ZklDQk9rN01laUxHeFpkU0d5VFhHU0dFNTlPV2VqR24vRk44RDkySHVROEsx?=
 =?utf-8?B?aGhKVy82a3NIQWhkMXJIY1NwZUJUV2IxQXJ4RUtmbWJJN0I2ZUYyRXpmSEc2?=
 =?utf-8?B?eW5JWnJ5czJGa0dtYy9IVzVxSnV4b01wdkVOWUFnb25KWDZsc21rNlpnN0N4?=
 =?utf-8?B?Ry9SeXA0T25USXBMdE4zcUNQUGE2RDVBTll6ckFqR3J6MGJoS2o4am5VTCtx?=
 =?utf-8?B?bEV6ZDM2MUZEZTdBMDJXTTNRaXBPWHJqZ2lnRi9neFBVV3d1WUlDNnVRMlNt?=
 =?utf-8?B?SSt5V2ZKV09Md1VWMW5SZzJJcmRBQzd0OHZ0QW9uNnRpdlAyM2huUysza1VD?=
 =?utf-8?B?VCs0UWM2UDk3b2RLSDZ5TDhoZXlIMHUvOUFUd09vdmcvSkFpTi9sVWw5ejNF?=
 =?utf-8?B?YmpXR2FnMVFNbzNMMENkeU5WOHdxemYxejZMNDlHZXlQandWaFRHQ0pKeEZT?=
 =?utf-8?B?MWFQazZ1WWZNcVBmUW9qdjEweWZiMVEzRm03K1BXU1kvUUlTbXVLdTBBeCsy?=
 =?utf-8?B?Ty9SVnpGRGcwb21WTzNTMHJlUEFhbUxNZVNjSjFTRTVXNTkzZjI3QzhaT1Fs?=
 =?utf-8?B?dUpEdVJyeXpwM3RWMUFrRXdDcVBpM3pzL0ordlBTVWl0SWppV3hmb09PQTFI?=
 =?utf-8?B?Q2RNVnAySzdKcUtNTWFValBRQmZoZEhoSkNWd0pEOHllbnZYd1JyR2szeXZx?=
 =?utf-8?B?OWVwSlFia1Mxd1BCK3VCczg3ajcxZ1IzZWF3SW0yWldEM1ZSVFByL2Fua2lK?=
 =?utf-8?B?UU4yTmtEVmp1YnRnQkdMdXFOUTBhazI5QndqQlBJNUd3dUg1YUVEemFDOWhl?=
 =?utf-8?B?RWt0clV5Y3JpTmxrYis3Z3VRd2ZkdkM5Mk5ZNlVRZmZRVTgrVmZ5VjNBUGJt?=
 =?utf-8?B?NVJhVzRuZ1NDazVpbWZ6VC9xd1pUczZUbmF0Rmkzc0tMRkRwR0Zxako0NlpL?=
 =?utf-8?B?aXhjTVFReHpOKzk5eTIreHJtSmY2aXVTNG5PN0JTSUpnZzJYVzl4VU1zL2sv?=
 =?utf-8?B?cFpIdXNlbFN3R2JpZzR6SDJGYk1TNWdDdzRjV3VtSlRMa2lVMjZLeW9NZ0ls?=
 =?utf-8?B?eVZ3bUttRUtMekFmNW5DM0NXUWdwN3g4YnBKemp0cFlvTnVxMmxzYmk3aEJK?=
 =?utf-8?B?WFQvWXlWYTNjc0FkQ1lKbXo2L0lWT21KNG1RVEo3QXlnWngwSEcvU284eU41?=
 =?utf-8?B?YXJxK0s2cngzQkVzck5QeUtkRnBvWVY4VkNiZ1ZuN1FqQmpEdG4zVnBwTUo3?=
 =?utf-8?B?K1NXTnd1b3NwNG04Y2NCeVQ4Z3JKM2dnVGVmZDA0WmQ2bUZ5T0hjNHA3Vk9t?=
 =?utf-8?B?d01KQU0wMWJMMi82VC8zbDNEQVBqYTNuMFZpQlpjYzgwWlI3WHpRdHRQbnFI?=
 =?utf-8?B?K3JwUEd4R0tJNngzcnVsR2dVc1ZjWXhhNkJvd0lsVzhEWFpxT1ZsYThRUzVE?=
 =?utf-8?B?MmhVMlpreDlsY3FnVGFrUTVmWEVzZFZEV3lNRDNnSm1EWTdYazV0eWpBYU5m?=
 =?utf-8?B?SmV2azRhd1FUdnZiTTRQa093NjVHYnJmaHhtZzZzMHoxSHJiTTRQckZkRCtB?=
 =?utf-8?B?cGZOK2VQZjJoTTQwVCs2My84R09oWGE1THBCNllORXJhK3NHdGRJSjREa3Rm?=
 =?utf-8?B?U1E1MUtwTVRFb1hla21KK09UcERnU2ZwRDZaSUVjVU1CQTVpSzdZSzlMc29x?=
 =?utf-8?B?aVdDTU1vZ3Nod25BVldzRUtmQ1pyelh3d0dpNHFyZHEzMnZRaXpuYTVxQnBS?=
 =?utf-8?Q?Z17oEzq9Vx8rFAQILuEfB+I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e271d97-492d-45c5-70a7-08d9da6be3c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:18:36.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8SP0BYEEITVSINR8CXc1FCATFIhsnOfQDYOgkuNTuQjtaJ0Y/WVhIIi9cWPhBfcrg52syKe2aYqtf/ubD83hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6065
X-OriginatorOrg: citrix.com

On Mon, Sep 06, 2021 at 02:59:46PM +0200, Jan Beulich wrote:
> From: Alexander Monakov <amonakov@ispras.ru>
> 
> Intel SDM does not explicitly say that entering a C-state via MWAIT will
> implicitly flush CPU caches as appropriate for that C-state. However,
> documentation for individual Intel CPU generations does mention this
> behavior.
> 
> Since intel_idle binds to any Intel CPU with MWAIT, list this assumption
> of MWAIT behavior.
> 
> In passing, reword opening comment to make it clear that the driver can
> load on any old and future Intel CPU with MWAIT.
> 
> Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> [Linux commit: 8bb2e2a887afdf8a39e68fa0dccf82a168aae655]
> 
> Dropped "reword opending comment" part - this doesn't apply to our code:
> First thing mwait_idle_probe() does is call x86_match_cpu(); we do not
> have a 2nd such call looking for just MWAIT (in order to the use _CST
> data directly, which we can't get our hands at _CST at this point yet).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

