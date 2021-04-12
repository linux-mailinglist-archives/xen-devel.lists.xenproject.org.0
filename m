Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CAB35C9ED
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109317.208695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyXE-00078n-Ee; Mon, 12 Apr 2021 15:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109317.208695; Mon, 12 Apr 2021 15:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyXE-00078O-BV; Mon, 12 Apr 2021 15:31:32 +0000
Received: by outflank-mailman (input) for mailman id 109317;
 Mon, 12 Apr 2021 15:31:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVyXC-00078J-KX
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:31:30 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f58916a-9d62-487d-9df4-26a23896dbd9;
 Mon, 12 Apr 2021 15:31:29 +0000 (UTC)
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
X-Inumbo-ID: 1f58916a-9d62-487d-9df4-26a23896dbd9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618241488;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=z9ZvNDb5GYWxEvtS6e+Gb7YmS7TOM2LYH+yd+1gwSYE=;
  b=YVA5/YSz/E8NhUwx8G3BToi3oyDMlFOhzcqVXc9oUxrJsCeGgtyGRrKV
   wnbsEe/kY/oJjK7x42NK7neaa2xdHiPAaBopxlDgNgC8Bi96EZzQ53R0a
   B6DXpAL9Om7eXom4QnhSQa10/9Q9SS6q6t355ixFNw6w0wjjs7+t+N8Gq
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1vpToFZtLOOUTnX8MJzp53pKZfkmvAvfne/egcEZZRJWvoA00CYlL5y+qHCM9y2eb2kX/CF7fi
 rVA5nLDWDqlOCi6Q0oLASeI+m+sfJbb3DXxOXonrSZqId3scYDerdOKXxsyVKo1XyQ0ZJTKuKv
 /ocayYnOcXCCFClEtCowmuiEg3qzSBaGi1ua9B7x6TwBOxISYVH6yS7/VGSuNKGPaXn5xIPXde
 Qd1LPIYEV7LRLHCgI6tVyIK4/LJ7JIdd+uvjLyILtgIQluyzMDOHDGVCzmQ0CoxaAg2SMM3ynU
 Tmc=
X-SBRS: 5.1
X-MesageID: 41399735
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:eJxlxaElBnoOOCDrpLqFb5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYeNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nE/iTLH8DQuTFupn3hIvrCCR2fSIPxSuvqXeT6LD8GwWFxRt2aVJy6Jor7G
 StqX2d2oyNqPe+oyWss1P7z5MTo9f5z8sGOcrksLloFhzJqiKFILtsQKeDujddmpDe1H8PnM
 PXqxkte+RfgkmhBl2dmhfm1wn+3DtG0RaLojX08BiTw72KeBsAB8VMno5feBfCgnBQx+1U66
 5Xw3mf86NeEBKoplWN2/HzSxpomkCoyEBS6NI7sno3a/p4VJZh6aYb/E9TDa4aGjP75I0NAI
 BVfb/hzccTXlWAY3/DuG5zhPSqQ3QoBx+DBnMPo8qPzlFt7T9E5npd4eFap2wH/p4mUZVIjt
 60RJhApfVrdIs7fKh9DOAOTY+eDXHMewvFNCa3LU78HK8KFnrRo/fMkfsIzdDvXKZN4Io5mZ
 zHXl8dn3U1YVjSBcqH24AO2gzRQU2mNA6dif121txcgPnRVbDrOSqMRBQFiM27ucgSBcXdRr
 KaJI9WOfn+NmHjcLw5nzHWat13Ez0zQccVstE0VxalucTQMLDnseTdbbL9P7zoPTE4Wn7uI3
 cKUTTpTf8wq3yDazvdulz8Snntckvw8dZbC67B5dUez4ALK8ltv2Eu+BCEz/DODQcHnr09fU
 N4Lr+iuLi8v3OK8WHB6HgsHhJcC01S8YjxSn8in35MD2rENZI4//mPc2Fb23WKYjVlSdnNLQ
 JZr1NrvYW6MoKX3iJnL968KGqVgz8yqRuxPtYhs5zGwf2gVoIzD54gVqA0Px7MDQZJlQFjr3
 oGThQFSE/ZHjbHkr6kk5QQOeHae7BH8UWWCP8RjUiamVSXpMkpSHdedSWpS9SrjQEnQCcRuk
 d86JYFgL2LmS+mLEw2hOhQCiwLVE2nRJZ9SCiVboRdnb7mPCV9V32DizChhxYvQWby7EkJim
 v9LSqbROHTDjNmywNl+5ev1GkxWnSWfkp2ZHw/i4F7GGjckltY0OOAZMOIoiGsQ2pH5ttYHC
 DOYDMULA8r+su+0wSNni2eUV88wI81A+DbBLM/Ur3a13+3MreUnaUeE/I8xuc9CPne9sswFc
 6PcQ6cKz31T94z0wuOv3A/JW1armInnf6A4myt0EGImFoERdzcL1RtS+tFf5Wy7234S+2J15
 s8p9Qvpue0OnjwbNnD6ay/VU82Fjrj5UqNC8cvotRomIh3kp1ZNZzSSyHJ23FKxw9WFra+qG
 ouBIBApIncMYpudfEIcy1X/lAVhM2CRXFbxzDeM6sbRxURlHfVMNOC3qrQpZcuCkOHohHsOV
 P3yVwrw971Gw+C36UdEaQ+PCB/b1U98m1r+Iq5BsDtITTvU+FI51yhNHChNJdbVaieAL0V6j
 J3+cuBkePSVy323mnrzHdGC5ML12asWsWpBg2QXcZO7tyhIFyJxpKQ3/Tbtka+dRKLL2IChY
 NEckQMbsNMzhka5bdHrRSae+jQuUIqk1xX/Dd9sEXis7LWuFvmIQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41399735"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY7vh2iXnI6PPxhjFED+yJYjJuwvmxwMH6nCLhPz29ldJnNzTI9ZmyIyxOWZirFHZzTZT0P4+9AXGAtcsPj71R4LLXm4prM4SA1Gn/Yv5limmtTR72a22vLe+3GQ8bBJAeGPeGR6XWdouklzGBTMSSYJGTSjll4pNFCRBfst9PWkTKJzCgFI92opqO926Pi3mnUJUTcc4Ad6RUnhBsbGz8yeoG78vdE3So3MnDG+YWh/pZactEfebeR+vbTfTe65i0FEE2c74skViK9YZoxqBqYO8Sf1aQKEFRJxDc9ycRsqQGCKDTPfQrxdQE0y08Y0GsKCmZqrXtNABU4Rs4DeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14l+Phv4R2uRqhvMOZ9ffFIQv1zgoSBmCpCxhFnXL54=;
 b=Payjt03faO209ssbkiIgTmi7+q3WqMMWdjIkr8bIp8kpzKwr6Joj9ubecq89fDrFflQMceB1sg/fDCI7XgR7KZxQKTnsY6UYAed8s4URjmaeB2Z+80tIHAReFT+JIc3NKH5LAPzGaXmMxqvJkndlEA+pIsSCyCz7eKZtEtnzz+RC6lzePG3HtpR3THNvvnB9cCqVyU6sS06yMB0TkPs1fXPinRc/Kjt0gRrVmIDb7bwTzrHE/lzsC5NGzeOVKHcp9DCRmLOdNSuJ7siniWqN+piiDjN1b5HbijOQKXgMcyos96LKjoSYVdWHzKLIqTW3lklw5/Da3YmBXRw44XcYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14l+Phv4R2uRqhvMOZ9ffFIQv1zgoSBmCpCxhFnXL54=;
 b=CdmT1PFzA/O8CkuMg5w1YahdmL9JZs9K9kRb5G3dIJ/HqavVGxXNSgKRa6JnIoljdmwR9/6QibZ8q0JAGONGn9lEo13HE3yBgrutdN8oIROpBdz0a8MXTOIsJNBq8Za8JQEDfXS9ENZ0+9HiVDOoWFBMQ0nwreL89FHJN2WIHqw=
Date: Mon, 12 Apr 2021 17:31:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
Message-ID: <YHRnvQvWJ7QsXVgX@Air-de-Roger>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
X-ClientProxiedBy: AM6PR10CA0101.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::42) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5a6ccc0-38e0-4c0c-c654-08d8fdc80349
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB596832FD6D9EFE918A998D908F709@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6bPhP8EBpX/tcs8dEu/No4feeETSRmKhCbw3Oc+DcvOQBz9Nf2VEJ0p4e+kgtHt3s9Ri26RlzCn5NG0H3nMCj4z7KLUlB1aMcX4h0CECmlf0EUcZeKQa1weJ5ryPSKwfa9Z6K2/jCiW1JywT88v+F/lCggml3YoAtHbabFU8FTj7f3FkRXKCtoQgKAkpsXWkD+4Dmdn1kKSH9vf3AP71E6JmD0lBMtO0p8KKpAorRNLdFKpeVY4gXi5Z1GMakk56LBMwRJ0UCXWHEfueOD6mVKxycFWazBKrlcDUr1TJBHKHOFunK9hxs8XTMcnjXobhe8QZE34zXCpvgdupZYDjUlcqQcLWdbs44euywPXeA9fjrgKyKW7n2V1LGjbKbTBGxK1qlJ1wPi4WJUNAlIT1MvZnQzrSPnI62VNGqsvgRhn3msv2tJUx49di5/mdIqvLHN4vrVHk1ujW1UMpLI4Xg2wqJD21J1pym1moFKj2Bz3FopMTttGHT6IImt50bWCPzocEeynKy7qPxOWN086dipcpA8iJGjTz4qWTXNo7xsvds9/2c7FAWxaqgw9bYKEWsWHDudDOmu9MnDo9Z9FqvmfI3YYaSpVqOFht91voY3wxKYt6qyI65QKyZrXLaHYr4OIUB8m1Cd+Y4CYZJcIZd4b/j5FhSZG/gjiVyJcTTgknI3QBGziYT9YmXlrlVXs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(346002)(376002)(136003)(396003)(83380400001)(9686003)(6666004)(2906002)(8936002)(86362001)(316002)(4326008)(16526019)(26005)(85182001)(33716001)(186003)(8676002)(66946007)(54906003)(66476007)(6486002)(66556008)(5660300002)(966005)(6916009)(478600001)(6496006)(38100700002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MW1ETFM2S1p5UTIvNWpWVG8zOGljV3VOdWNoTFRnWXN0bzNxcjBNOE1OenJZ?=
 =?utf-8?B?d2hMUFNSUkFlM0ZMY1QzVkt4S0FJL3hoZ2dGVkJKY0xKZ3QvMHdSUFEyeFgy?=
 =?utf-8?B?czE2ckVvUzJxQm1UejV2MnRNbUFMS3pHMFpaNzhUNlg5RUQwc3JaVnBZM0ln?=
 =?utf-8?B?ZzYwZFlxSXpIclBIWThJZXBwcGlhc0JZUEJnOTdRaDN0NWxaWkRkTnZFM2Z6?=
 =?utf-8?B?TDhjUkZ6SzNnZ2taTXpTdzZDcWRhQktTRytSQ0JKWU5rWHJjTzJLbW16M291?=
 =?utf-8?B?czZObHFkYWp6NjVSU3J6S0IvV0FDYlVGMFpSVjNNNDQvWUVleWVvSUVFM0sv?=
 =?utf-8?B?NnJHWHBySk5MSm5ETzBVMVV6bEdKN21va000Z0MrbEJPTjNuRngvV21LTU52?=
 =?utf-8?B?U2NqM1c2dFp2cVNrNFpZRy9oMFFmYTJHdE1OQk9qTVJ0Q1dvNzgwZDFCeWJL?=
 =?utf-8?B?cEJFRmdXaVllRUNVSWNnVTJkWEtIaHlvMExHTjlJN255MmZDYWNZWE5Ta1JG?=
 =?utf-8?B?NFpwbDNac1JKa0wwbUJLcWxPbkg3SzhBUXd4V3kzMjJyczB0eVFLd3lGL1ZK?=
 =?utf-8?B?OTcwajJBUUp3TU9pOTZjQlJRYTVKR21rZGxOS1Vnc2ZRelpkQVQ0aThCQXBj?=
 =?utf-8?B?eXBIZlUyeTRza2ZHb2Uvc2Rzb0VMbE8rdnN2WW1wbEF5b2lXZVp3S0pJaDNQ?=
 =?utf-8?B?Y3BvN2dQdS9jdmJvRzk2bGNBci9XRUxmRTVtUDVyaWZEV2g1QjBULzZ2QTE2?=
 =?utf-8?B?L3dZeFB3WTNZZVFsN2FXYWNaVFREN3B4bDBsL1hmSllGQjZlQTQ2bHJMVUtz?=
 =?utf-8?B?MlVyeVZaMUtVWmI0MXRlYVhXdlFNOXVISkwwQ0ZFeVIxbDBZc3lyMDMyOXRY?=
 =?utf-8?B?a2c2L0FYeERGME1Pck9DSnF4ZVdKTmNrQUhuMUVsTWgwY05GZm5UUTZ3SFp3?=
 =?utf-8?B?VUdkNW9acTMrNHozOW1zY0dhRC9PbFpaRVMrWWFjZmRlWEVPZG1RbTdZM0R2?=
 =?utf-8?B?NzRoNVB0N0p2VDNTRW5nN3FRVk94Mk9ZQTBacm9BTjRZMkt5VWgwNXVBOEdO?=
 =?utf-8?B?bFRoRGpaMnpNcXVNeE1zcFNML1Y0c0M2WVV6WXRrQ1BlNHNHVHZWd0VYRW03?=
 =?utf-8?B?eE5GM2FRNWlxSXg1Wnp5a0EzdTc1dlJlbXE3ZFl1YzJieU1paDhGSERkaCs0?=
 =?utf-8?B?NTVSQmY2UVBOUGRFYmM0U2x5dFFuaTBteE1MbUg0SWtwV1BPV2NjejQ2VkVS?=
 =?utf-8?B?cFQ2eE5TL0FKY3NZNCtHTUVCTEZ6dnl0TzhRUS9qdjMvbEFNK0p5OTBnQlRS?=
 =?utf-8?B?dGEwalJoVmwxTFBuV3FxTHdxcEh2YUx0SFFyQ1ZPZUFMcHEvcHIwQ1lZcjFV?=
 =?utf-8?B?R0g3cmk1OFpjcmJCUVJEVWdJVW5ESndQZCtaWFd1WUpGL3BFWHJZOU1JSmlT?=
 =?utf-8?B?OStVODV3YTIvbjYwNTdjZ3l1NEV5ZzMwMkw5UTdVOGtIb01FY01kejJIaHRm?=
 =?utf-8?B?YXFmQlRBVElLV1ozTXRaSDlMT01jVVhqd2thcitxSWNSYXFWTFN3WmdMcXZm?=
 =?utf-8?B?djRhaVo4SkpTalVXSFc1azgyc2NDQXBSSUorc0tYNXlQNHNmSmVCcDMxQzZv?=
 =?utf-8?B?am1CVnIweFlRNFV0WFRKc1V3S1paZGxpNFBxdHNQb0FBamQ2dWt0OUVvVVFT?=
 =?utf-8?B?SlFNSTdpbEZDclA5RzE3SUNKVmlpcjY3Ykc5NlpjZlhnbFpjTmQra3cwakx3?=
 =?utf-8?Q?CMnPDigQM/xZg4zfrDC7v8BZJ9i3qHGCHeFAVxG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a6ccc0-38e0-4c0c-c654-08d8fdc80349
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 15:31:25.2451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVCMHwRN6gS/7mMgdpehLxBoVddhHfQQJmH2wqnxsvLU/Hh7Z17nTpdqgG58l5HmsoBkRwuJLVVD/SlBIITtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 12:40:48PM +0200, Jan Beulich wrote:
> The address of this page is used by the CPU only to recognize when to
> access the virtual APIC page instead. No accesses would ever go to this
> page. It only needs to be present in the (CPU) page tables so that
> address translation will produce its address as result for respective
> accesses.
> 
> By making this page global, we also eliminate the need to refcount it,
> or to assign it to any domain in the first place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
> v4: Set PGC_extra on the page. Make shadow mode work.
> v3: Split p2m insertion change to a separate patch.
> v2: Avoid insertion when !has_vlapic(). Split off change to
>     p2m_get_iommu_flags().
> ---
> I did further consider not allocating any real page at all, but just
> using the address of some unpopulated space (which would require
> announcing this page as reserved to Dom0, so it wouldn't put any PCI
> MMIO BARs there). But I thought this would be too controversial, because
> of the possible risks associated with this.

Really seems more trouble than reward. Also there are systems with
MMIO regions in holes on the memory map, like the issue I had with the
Intel pinctrl stuff that had an MMIO region in a hole on the memory
map [0], so I'm not sure Xen would be in a position to select a
suitable unpopulated page anyway.

[0] https://lore.kernel.org/xen-devel/YFx80wYt%2FKcHanC7@smile.fi.intel.com/

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -66,8 +66,7 @@ boolean_param("force-ept", opt_force_ept
>  static void vmx_ctxt_switch_from(struct vcpu *v);
>  static void vmx_ctxt_switch_to(struct vcpu *v);
>  
> -static int  vmx_alloc_vlapic_mapping(struct domain *d);
> -static void vmx_free_vlapic_mapping(struct domain *d);
> +static int alloc_vlapic_mapping(void);
>  static void vmx_install_vlapic_mapping(struct vcpu *v);
>  static void vmx_update_guest_cr(struct vcpu *v, unsigned int cr,
>                                  unsigned int flags);
> @@ -78,6 +77,8 @@ static int vmx_msr_read_intercept(unsign
>  static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content);
>  static void vmx_invlpg(struct vcpu *v, unsigned long linear);
>  
> +static mfn_t __read_mostly apic_access_mfn;
> +
>  /* Values for domain's ->arch.hvm_domain.pi_ops.flags. */
>  #define PI_CSW_FROM (1u << 0)
>  #define PI_CSW_TO   (1u << 1)
> @@ -401,7 +402,6 @@ static int vmx_domain_initialise(struct
>          .to   = vmx_ctxt_switch_to,
>          .tail = vmx_do_resume,
>      };
> -    int rc;
>  
>      d->arch.ctxt_switch = &csw;
>  
> @@ -411,28 +411,22 @@ static int vmx_domain_initialise(struct
>       */
>      d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
>  
> -    if ( !has_vlapic(d) )
> -        return 0;
> -
> -    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
> -        return rc;
> -
>      return 0;
>  }
>  
> -static void vmx_domain_relinquish_resources(struct domain *d)
> +static void domain_creation_finished(struct domain *d)
>  {
> -    if ( !has_vlapic(d) )
> +    gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);

Worth making it const static?

> +    uint8_t ipat;
> +
> +    if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, _mfn(0)) )

It would be better to use INVALID_MFN here, and init apic_access_mfn
to that value.

>          return;
>  
> -    vmx_free_vlapic_mapping(d);
> -}
> +    ASSERT(epte_get_entry_emt(d, gfn_x(gfn), apic_access_mfn, 0, &ipat,
> +                              true) == MTRR_TYPE_WRBACK);
> +    ASSERT(ipat);
>  
> -static void domain_creation_finished(struct domain *d)
> -{
> -    if ( has_vlapic(d) && !mfn_eq(d->arch.hvm.vmx.apic_access_mfn, _mfn(0)) &&
> -         set_mmio_p2m_entry(d, gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE),
> -                            d->arch.hvm.vmx.apic_access_mfn, PAGE_ORDER_4K) )
> +    if ( set_mmio_p2m_entry(d, gfn, apic_access_mfn, PAGE_ORDER_4K) )
>          domain_crash(d);
>  }
>  
> @@ -2415,7 +2409,6 @@ static struct hvm_function_table __initd
>      .cpu_up_prepare       = vmx_cpu_up_prepare,
>      .cpu_dead             = vmx_cpu_dead,
>      .domain_initialise    = vmx_domain_initialise,
> -    .domain_relinquish_resources = vmx_domain_relinquish_resources,
>      .domain_creation_finished = domain_creation_finished,
>      .vcpu_initialise      = vmx_vcpu_initialise,
>      .vcpu_destroy         = vmx_vcpu_destroy,
> @@ -2662,7 +2655,7 @@ const struct hvm_function_table * __init
>  {
>      set_in_cr4(X86_CR4_VMXE);
>  
> -    if ( vmx_vmcs_init() )
> +    if ( vmx_vmcs_init() || alloc_vlapic_mapping() )
>      {
>          printk("VMX: failed to initialise.\n");
>          return NULL;
> @@ -3224,7 +3217,7 @@ gp_fault:
>      return X86EMUL_EXCEPTION;
>  }
>  
> -static int vmx_alloc_vlapic_mapping(struct domain *d)
> +static int __init alloc_vlapic_mapping(void)
>  {
>      struct page_info *pg;
>      mfn_t mfn;
> @@ -3232,52 +3225,31 @@ static int vmx_alloc_vlapic_mapping(stru
>      if ( !cpu_has_vmx_virtualize_apic_accesses )
>          return 0;
>  
> -    pg = alloc_domheap_page(d, MEMF_no_refcount);
> +    pg = alloc_domheap_page(NULL, 0);
>      if ( !pg )
>          return -ENOMEM;
>  
> -    if ( !get_page_and_type(pg, d, PGT_writable_page) )
> -    {
> -        /*
> -         * The domain can't possibly know about this page yet, so failure
> -         * here is a clear indication of something fishy going on.
> -         */
> -        domain_crash(d);
> -        return -ENODATA;
> -    }
> +    /* Arrange for epte_get_entry_emt() to recognize this page as "special". */
> +    pg->count_info |= PGC_extra;
>  
>      mfn = page_to_mfn(pg);
>      clear_domain_page(mfn);
> -    d->arch.hvm.vmx.apic_access_mfn = mfn;
> +    apic_access_mfn = mfn;
>  
>      return 0;
>  }
>  
> -static void vmx_free_vlapic_mapping(struct domain *d)
> -{
> -    mfn_t mfn = d->arch.hvm.vmx.apic_access_mfn;
> -
> -    d->arch.hvm.vmx.apic_access_mfn = _mfn(0);
> -    if ( !mfn_eq(mfn, _mfn(0)) )
> -    {
> -        struct page_info *pg = mfn_to_page(mfn);
> -
> -        put_page_alloc_ref(pg);
> -        put_page_and_type(pg);
> -    }
> -}
> -
>  static void vmx_install_vlapic_mapping(struct vcpu *v)
>  {
>      paddr_t virt_page_ma, apic_page_ma;
>  
> -    if ( mfn_eq(v->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) )
> +    if ( !has_vlapic(v->domain) || mfn_eq(apic_access_mfn, _mfn(0)) )
>          return;
>  
>      ASSERT(cpu_has_vmx_virtualize_apic_accesses);
>  
>      virt_page_ma = page_to_maddr(vcpu_vlapic(v)->regs_page);
> -    apic_page_ma = mfn_to_maddr(v->domain->arch.hvm.vmx.apic_access_mfn);
> +    apic_page_ma = mfn_to_maddr(apic_access_mfn);
>  
>      vmx_vmcs_enter(v);
>      __vmwrite(VIRTUAL_APIC_PAGE_ADDR, virt_page_ma);
> --- a/xen/arch/x86/mm/shadow/set.c
> +++ b/xen/arch/x86/mm/shadow/set.c
> @@ -94,6 +94,22 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
>      ASSERT(!sh_l1e_is_magic(sl1e));
>      ASSERT(shadow_mode_refcounts(d));
>  
> +    /*
> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
> +     * get accessed, and hence there's no need to refcount it (and refcounting
> +     * would fail, due to the page having no owner).
> +     */
> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )

I find this assignment inside the parameter list quite ugly, I would
rather split it on it's own line.

> +    {
> +        const struct page_info *pg = mfn_to_page(mfn);
> +
> +        if ( !page_get_owner(pg) && (pg->count_info & PGC_extra) )
> +        {
> +            ASSERT(type == p2m_mmio_direct);
> +            return 0;

Are there any other pages that could pass this check? I don't think
so, but wanted to assert.

Thanks, Roger.

