Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73D4F1525
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 14:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298321.508154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbM3k-0008Qp-Cb; Mon, 04 Apr 2022 12:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298321.508154; Mon, 04 Apr 2022 12:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbM3k-0008OS-9h; Mon, 04 Apr 2022 12:43:52 +0000
Received: by outflank-mailman (input) for mailman id 298321;
 Mon, 04 Apr 2022 12:43:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbM3i-0008OM-Ty
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 12:43:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df0eef6a-b414-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 14:43:49 +0200 (CEST)
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
X-Inumbo-ID: df0eef6a-b414-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649076229;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NgXwQCXnFLT0lyFMWIhVIKTef2di8i+SEcClsGc1pTc=;
  b=ceD3c36pMFIYHgY5gGcSD4q86pruy+Pt9foUKGC3Nun0FDmnWEoFZ2n+
   zGHPXF3FEi6R2Pqig7QGp5IYzFatDvWM9jRAewKKMr8Jvn95EVI83bpde
   wKRGtObVDtrf8xNyQZ7N0oYYs3wNI4Nw/6nfqHEOHLHF0rfs0IeHypV3O
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68343080
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3qAlL6DnQyZJFBVW/z/jw5YqxClBgxIJ4kV8jS/XYbTApGsnhDMDx
 2VODWzXbPncZjSjLdtzPtiw905S7JSEx4VqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgy8
 /xk5duoUDx2P5f9ouEvdTUGOC1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjGxs3ZgeRZ4yY
 eI9ORBJSSr6USF2BX0wBIhl2+qZu1jGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiD2/lzdMHMJJKLI70jC3z5jyz1iyCkFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tWuVh6b/PuREDGQ3C94ace51qXHb4
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSLyJdoIvGwifxs1WirhRdMPS
 BWO0e+2zMUNVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5DRlEUHCb2nPXG/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chUAoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:+ptEK6rqcTTdWQN5dth8xn8aV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="68343080"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpZT1mAGIxjOyPVXOdMLaNOZX5xzbtZg6ngfM5oyifGvj1ZvELFfmjMI3p1mCkKy6X3hRCPCI5eNECN6ueniqU90It2kJnor8L89zImLBvLXqf/wBAsgqqcsoe5lCh0WbbGnw/uGsOrl+PutOLHnlQ9SBHdFqU9uVPrepsC33Kg3tL+wBUwAiUgQptcTfqaI4h7VjihgJMG917FEO6UKuxd70lPldXseh42X4pm5J8Btvag6eFy5oGyp0gP3pBE6BfVr3eE96V4rNX7lXdO2meDTazR/Xx7UEgyrt41wKgl//ZgnY8AYlw5XEwCNu+BSIRzlsTTd7e4oV5seXm0SiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HciF5PxIQ/A+isnDsu/+Q86UpJzaLpfYjgLF8qaTJ00=;
 b=QjJEt1fSSRsGLphpQ8X9MSr2ioHTfDW4XBGjuSkJgvX74DoWWthJAwnCwt0DOk/g5ib5TmBTmAh/BjL4j23DQzIXhY8XPGUT6VqmqCLROXAKsLtLZy/YdW1QQNH8csE7nmXytT1B54AvqrJYm+Y/kxM6IFgtwb5ngV5GUo+rc36D3avXFDm8L7vaax8rEnIRLKO0U9aOtzulLvU9wn8tEtwaOqDz1gFKsh5bNS5qpPzFA7go9yDz8cEaOjjcZFwjcWzFxYM5n+R3arSse5WRgmJSwzvUwXs4LwNvc81VxSrDslDY+yIHiFNjYsmSUpmfgpDCkTbE35LRDn24PSfgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HciF5PxIQ/A+isnDsu/+Q86UpJzaLpfYjgLF8qaTJ00=;
 b=rMrq64PUB/eWI9MeiWdj/og/F1CeE6s8fM0jf2rPwrYVKTX5Y5vr6NDlMFgFQRfmdtbCVq6gVoBVPYOKVL3I7XsF/w6vmqm/Fe3/w9qBnmkRyX3G6HGT81mJzE43MoNAoU5LDsKTMrz18NHZ2Dkmvb30BaZ4kj5rOBv20RHszdY=
Date: Mon, 4 Apr 2022 14:43:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/4] x86/APIC: calibrate against platform timer when
 possible
Message-ID: <Ykrn7hTD0r7fC1WU@Air-de-Roger>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <37ee7fe7-1218-7fa3-bc29-0fb45389bf75@suse.com>
 <YkrapvsmmjcZkwSj@Air-de-Roger>
 <95654e26-160e-8664-23c6-ad5e4c87f444@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95654e26-160e-8664-23c6-ad5e4c87f444@suse.com>
X-ClientProxiedBy: LO2P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfc50563-e5b8-46a9-75a7-08da1638b8bf
X-MS-TrafficTypeDiagnostic: DS7PR03MB5640:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB56402FAB72FA0B04AE773AC58FE59@DS7PR03MB5640.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8b4SfyI1D/OYzAE+clrqf95ezWPO5ACeb7K9HahBEdzhul0ZCb8nyWcJoabGcoDwUwCFKS+8G9T0Ryh8Rkch0msVBZnawJwglihKg+FU38n7TRo0FWSmouFRZAvuJDfyemDMS+cI83kTAXsfXMGNFHtVvv3dpSeKUjiomvojsKsUw1AUVEkcbV0c563neXHvgvL+6EsrJAflDwCBj5E9SrfiEQizc9C7zN6MYGVyYzbgZJwm02FPNnLjPI7Ukl2SYkO1/6Ckb2VxjursKE8dkeIydtFjBLYY8orgfBVCUoEuLHh34QtWst5zeB5kCGqsCRgzftOSP+VOIJSIBRsEKANF+9biv1emlm41mKkNyAC/Jw3U369h52ld00KBVRkkJ+VjaZwwXYQGGScRB1mkTBb4J5bQ/0xB+vjQdTrLs4IjSr5hipYYr3mt1dK1Pd2jcnw7Y9t0510Ft0lxUpAd6Y+E4ZmLlR2JeBWhd64tq6NsyyytOIcVUPqwNNTWdFqYlgkg6chtYDKu4HXYGtm77RNIIlYd0Tx4zK5DrBcLOivfzOdknH906Rac+oTTEcAb9AanHnLbHxY1lUhfJ0vc6GWpIb5DHmk5VLdteC0ryIt7WgYvcYz0qK2+WCQd7mb0mqJj3vNzGOsVCrIA1MMd9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(186003)(316002)(5660300002)(26005)(38100700002)(54906003)(8936002)(83380400001)(85182001)(66946007)(33716001)(66556008)(82960400001)(6506007)(6486002)(86362001)(6512007)(9686003)(66476007)(8676002)(508600001)(4326008)(6666004)(2906002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0lzR0U3cmpFNjdpaU1GWGRVTWVjMWhhbGxaRjlGSFgxQ2pwdjUyT0R5dWNS?=
 =?utf-8?B?VklzWjN6WitZa01rdUtuNmI3c3ZqZUZ4QWVyUlIzRHRweHRBOVEyWU1Dbk9w?=
 =?utf-8?B?Vy84RldvdFN6NXRId1Y4V3E0V0FxaWVybGt0dGFibzJYYi9FanI5UGNsZDJy?=
 =?utf-8?B?dmNYeWRQbFVmcTAyQVpSUytUa2c5bEIyMTFJRm9YOWU2ZnA5NTlNSnh4UlJi?=
 =?utf-8?B?ZkN2UGZvMVRpK1hkZ0RqcmdGcmV0OUpHOEhnaVl0SW8yaE5Ba0dEVjNLdCtx?=
 =?utf-8?B?UnB1eTAyTlVXNjFrRWd1Wm5PUHN4VHcxdStkWWUrc0x5ZURmTGJXSlpndXp3?=
 =?utf-8?B?ZDlrem5jbks2cHhkci93b0dpRmJsRHpydE05VzFRZlZyVDRDcVdQdDdRV0pF?=
 =?utf-8?B?a1lKbFNTQmFtMUsyVGxxTDliTEc5VmZrb0w3TG9vME4zMlMwamJjR2l1MlBm?=
 =?utf-8?B?OElwKzU3T0lNVXZYSW53VXZ6aytvNDg1TE9iRzl0Sm9VbzZMRW5CL2xRUlZp?=
 =?utf-8?B?Y3Eyb2NFamhLY1c1emJnWm9DenNYR09Zd1hHaVEvWXBJekhWcE5WTVplNmEy?=
 =?utf-8?B?QXhWSzRkRi9FQW1KL0hWejBpd0FqMytkYTd3V0VRZEE3RGcxQUhTclloUXF3?=
 =?utf-8?B?S3RBR2h1Mk9PUjZkOFdoekdxMG13YmE4SEZPUHljMHVIaVpZWEluNXNwSHZK?=
 =?utf-8?B?S3J0YXR1ZkJMaS9aOFhZR1hKZ2RDWUUrRC9KaEVlUTZMc0hmeE91L0JtaS91?=
 =?utf-8?B?dHdLNHUyYllXbW9HSUFOOHFrc3JVak4rdk1peGZIYXRQNXpyc3djMUc0Ymli?=
 =?utf-8?B?NzBWNFNKUGJ5SVZJQ0h4bGFhZXF6RFNTcGJXa0R1MG93Q21VVVR3VjF2ZENn?=
 =?utf-8?B?dWZMdkVlbXpqVVY3eFBmdWZKL1RoVGc5R1pxMFBpZlR5QWxGclVMVTdDekZF?=
 =?utf-8?B?Sk4wYk1GMnRWUTlPQjFyQlkvVGg4dytzVHNsMzRWTUh1SnZTNnZIMUtTRHRE?=
 =?utf-8?B?MUUwUmh0UkRIUzFhcmxEdk1PMVR4SG1nRFpXZTZYOHkzM1FKeEdodnBzYkxO?=
 =?utf-8?B?ODFzdW5YWm5xMVQ0TUhSTnljWlE1Sm91bFZFd3JXRlMzZmdWQzhlTHZETXhB?=
 =?utf-8?B?R09OSUVHUHlWcWFlQ0VaZDZ3d1FWT2I2TENmYk94VDdzcmFoT3c2bm5wV2JK?=
 =?utf-8?B?aTJibnovMHlua0s1MU9jTWg5K1JCYk5jQjNpZWpPMEtUTDIvRklDTEdUUkNB?=
 =?utf-8?B?TTE4TWlHbTFSRGV6UmxYbXg4Nkhhb21GRExvOEpVY0tSMGlRcVN0Mm5TS05x?=
 =?utf-8?B?SVd4OTlKdE5Vb2VLYUNjV0lFYTZ1TWg5UDdQbVZQVmVOV1Fxam9takVLdUlS?=
 =?utf-8?B?UlY4dkFUV3AyMXRnMHdmOXRWWWIwLzdJalVQaGgyRGROSHBHWTRaekZuWVpx?=
 =?utf-8?B?bE5CTnZZOUJKZFQ1V1VGRlBxMmo1eWFuVEJoVkJ5UHN4MDhHdXNnTzJYSHJQ?=
 =?utf-8?B?ejltakFzSHFWcmpCWXZMeWVDblFuOXhkd3NnME9vanN4cng4NzRrZndVUUZV?=
 =?utf-8?B?eklhNDRPR0J6bUdtQVIvT00rK3FJTVA5U1ZXU3dkZ28vWkp0N0I1anl2Zzdh?=
 =?utf-8?B?TXkxUEYrcFFNVW15TXlucTF0SWZLSGpVcm9Jcnd6bTZDZWpseEFGOGdIZExa?=
 =?utf-8?B?ZzJ3UUMrK0lRNTFJckVxSzJPaVJHOEgwUFJnTGRaMTREZ0xTQ2xGam1vMGRM?=
 =?utf-8?B?NXhVbkU1ZDhJZ091c2t2czhBNVBCaDlSQW52bmh4Ykc5c01WTm41YWFOUUU0?=
 =?utf-8?B?ckdQVUF5WjFNSU5iaGlBRUZ5UGRrMDZPVXpTMzh3Y0JOQWl4K291Qk00aXNO?=
 =?utf-8?B?SmlEWC92TWxIVUNKTksxNjdkSFZVTkZxT2ZVbk1NTDAwTGJBKzB5TFNwdzdu?=
 =?utf-8?B?VUFGNjcvSm4yVVdPT3g1U0hxMFZoaVlkV2ZMS3J0U21jRUJzRW9ocDdXTys5?=
 =?utf-8?B?LzFLT09tLzBBMEVyTWU3dkJ6K1o4bTVGR3ArMkxzNnJWYkdVUnJuS1RPcXMy?=
 =?utf-8?B?QmxFWmpYSGQyNHY1UUtVaXhjeVdhTUJpT09SdkMzdWRuWUo0Z1dycGcxV3k3?=
 =?utf-8?B?Y0JJcE4vdnpxeVRTT3NKWDdNZFdiWTFBVGRrbWdNb1dza2hYQ0V0Zk1GMFNz?=
 =?utf-8?B?VU9aUGpzdFh4ejJYRklZeVE1MHFuR2pkb0lzajRrZjM5K3pta2FhektHcll3?=
 =?utf-8?B?V1MvZWF5WTh5cngycXJtOTVHbzltelE1ZnlZRHlIZEZjOVN0UlQ1aDF0STdn?=
 =?utf-8?B?YmdtUXJ2Rmw0UFJ2SWZ1TE1icXM4SEREOE9nMFllQ1dyaVlwWXhQOVE1eHUv?=
 =?utf-8?Q?LxWUM+DgYpdlzhL0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc50563-e5b8-46a9-75a7-08da1638b8bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 12:43:30.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TON7nCy1YL1MhqgIuuCwt5t8y8nTzkq9RqSe5kAP+OcjNYwS5neVAGAEBtOU3nrlq7vzahEShFGXie4Juh0/3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5640
X-OriginatorOrg: citrix.com

On Mon, Apr 04, 2022 at 01:55:56PM +0200, Jan Beulich wrote:
> On 04.04.2022 13:46, Roger Pau Monné wrote:
> > On Thu, Mar 31, 2022 at 11:29:44AM +0200, Jan Beulich wrote:
> >> +uint64_t __init calibrate_apic_timer(void)
> >> +{
> >> +    uint32_t start, end;
> >> +    uint64_t count = read_pt_and_tmcct(&start), elapsed;
> >> +    uint64_t target = CALIBRATE_VALUE(plt_src.frequency), actual;
> >> +    uint64_t mask = (uint64_t)~0 >> (64 - plt_src.counter_bits);
> >> +
> >> +    /*
> >> +     * PIT cannot be used here as it requires the timer interrupt to maintain
> >> +     * its 32-bit software counter, yet here we run with IRQs disabled.
> >> +     */
> >> +    if ( using_pit )
> >> +        return 0;
> >> +
> >> +    while ( ((plt_src.read_counter() - count) & mask) < target )
> >> +        continue;
> >> +
> >> +    actual = read_pt_and_tmcct(&end) - count;
> > 
> > Don't you need to apply the pt mask here?
> 
> Oh, yes, of course. I guess I did clone an earlier mistake from
> calibrate_tsc().
> 
> >> +    elapsed = start - end;
> >> +
> >> +    if ( likely(actual > target) )
> >> +    {
> >> +        /* See the comment in calibrate_tsc(). */
> > 
> > I would maybe add that the counters used here might have > 32 bits,
> > and hence we need to trim the values for muldiv64 to scale properly.
> 
> Sure - I've added "But first scale down values to actually fit
> muldiv64()'s input range."

With those taken care of:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

