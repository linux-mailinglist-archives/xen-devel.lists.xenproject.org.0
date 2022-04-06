Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B84F57F6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299720.510843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1I4-0006sh-Nd; Wed, 06 Apr 2022 08:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299720.510843; Wed, 06 Apr 2022 08:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1I4-0006qS-KI; Wed, 06 Apr 2022 08:45:24 +0000
Received: by outflank-mailman (input) for mailman id 299720;
 Wed, 06 Apr 2022 08:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpXD=UQ=citrix.com=prvs=0888b7d66=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nc1Hx-0006ps-LU
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:45:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de10731b-b585-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 10:45:14 +0200 (CEST)
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
X-Inumbo-ID: de10731b-b585-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649234714;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UCaKtdb3bWKL+Y6xd/f9UbSA4XV89mUjMrfV9Tqx5Ho=;
  b=FYQJ60HuKB3fvN15eHMBZqxJV/ZM3Ct7TWo/f+ND1c8Ln7KHJeq4AgGh
   VEJjmiFXdUg57VoFjnPwtKQadfI8qkouepGTslqKuK2vc1kCRP6c/7vBU
   hcyrh6nK8XpPtJ7zSz92J43YEsDcXSGL7KjA0wRl+64YpP/GARlOsrJZi
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68031880
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9bw4YKNDvKbcvNDvrR2Jl8FynXyQoLVcMsEvi/4bfWQNrUpz12cOy
 GcYUDjVPKuDZDH3Kth2bIq+o0MOvcLSmtBqGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 /oWp8GLRykSIKCdxvUZah9qSDpbIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTa6FP
 ppJMVKDajyHfg1RZUs2CKggkf65r3zzcT1b626a8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTX5kJCLCj6rtjjFiSwEQDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZhluM857j8EYfiInh
 wGYm+rvN2d0laLAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZRj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBZw6ByD8hUVPlhcRBhps1XQtlFAN7fbVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusMCZSv2Pf8nM93qYyjP8UQGPY67PhwzRoAQCqWdiSfdpH0+DaJu9z6FfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5cOLLTefVM6RjpJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXdE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:McVy3K/zoSiRgnXC3j1uk+F2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvt3+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcjW2He4OSMTeuOb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68031880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU2i0LOe+ne5hqYnDpxJgOu5pMaYhzHWPoOaJV55v0sHUNRGLsLJ9xarDLV4YiBsFFDpCLujjpD0Xl51EoblHD2Sm8WN/wIJVXQRXoBfl7pYmS8TbDZidioVb6lXkiecTOnvnkkflcAU4MyBIcNbcykNuZ0akPHhKJTtsA3sWaSBuwoe8fvBLGonaDYhdHU80LyilU2EyL20l5WiJuABsUY3pSUEbMNcRtPUCGlp5BhMEwcMsWLMqfYqFinEyFO8/iNIo7AOK5eut5TwLA6h1bZXpCt/1u5pZIaePdM+Ua17V3OsWhZxtuxJPBXtvVIwqWXoUtIhca/G+99JDJhQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCaKtdb3bWKL+Y6xd/f9UbSA4XV89mUjMrfV9Tqx5Ho=;
 b=f7IaDprgvgalCqhkfNqz+Rq4Mmhu2vMKNLdGNf7ko6eZC9eCmwebL6b+V/aYieH8eBP36sgDhxW7lIj0LL6Ai8Xf7qHbijRjDVzSH3wBRt72bsgYUZfSP4+dYZve5Cd5azRGOHCRs2/LJENBAmTrQTwVpC5MdhiKCebyW13QvQsJLO/MRBIaeSBbZdQis1HInPcLG1DrelSAP/xV5Rl6zxyiJ+Mq0yIgPV3MVPzJFbOilW6x+OO5KOiqD0NxfnlkRQNFvte/5QYNZP5PQKrtpyUtUcJvgMH7f+VlZADIhFKC1pY80GB209JpG7C/DS0jYsCpNue4EKefjPv2VotZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCaKtdb3bWKL+Y6xd/f9UbSA4XV89mUjMrfV9Tqx5Ho=;
 b=T/kv8R20mWNKPebMuHkSQZGMPxTW+fVAFbnIV+SvjDjF7y/QjH/ao+I9oMY9ExPsXZ2963XCA2qDyibdnNtkQ/YOwPd2WmdTz2pHp75+UrT/OXcTUHSouXA91djFYBP8fGrMMndjR5OJ8lm6CtOnq6G8gfrUIvt6e4vNb94IeYQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, osstest service owner
	<osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [xen-4.14-testing test] 169170: regressions - FAIL
Thread-Topic: [xen-4.14-testing test] 169170: regressions - FAIL
Thread-Index: AQHYSPz9Yui6molSPEi3RG1EVTOj+qzifDEAgAAXDQA=
Date: Wed, 6 Apr 2022 08:45:04 +0000
Message-ID: <afaaf270-27d4-39af-8125-6d622801073d@citrix.com>
References: <osstest-169170-mainreport@xen.org>
 <d0e84ac8-308e-1784-982e-271705c13b7d@suse.com>
In-Reply-To: <d0e84ac8-308e-1784-982e-271705c13b7d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a1735cd-6ef0-4c2d-fbdb-08da17a9bed0
x-ms-traffictypediagnostic: MWHPR03MB2639:EE_
x-microsoft-antispam-prvs: <MWHPR03MB263909DCF25505CAF7D19303BAE79@MWHPR03MB2639.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ImYpmFdXzUr/F8lMyVi3+Jf4T4Xvowjjk0P+sr0KoTjvpLLjgZ5P2OZuozxSLxDT0/S/Jp+ZDvdgxq7liiyYVH4zHUHVcX9VNnYdbNdEew63EEi3tjNFdI/TS6N/xmeTt00/sJQIW7iV2GQvRayssSk1d4IiA1lnqdXsG4gjZfVlT1nwikSvz+VjDVgFuwjoGnf5xPnFTP8q7k8ZpfWUTptwWRib1r5BE8xvEqmR7g/4XzfaiFmUj1KasREqMWP+BCRas3wBZ6Gjh3Qj+jsWhqjnSdc6JBhehqzMhCAx+gUNXZ7qNgpZTqEfiF6CsetVpnt7J1O8bmeWq0+jWnUHDgGmKtzZaO41wevTXscgHcBPUbeubDogzAYQsZu1zYWZHBUo9Pyr/4oIyKbFO092C7AMc4/r0OD3kCtWr/9Xy87Nm7dv0jVsX/KCprRhDqklLwDRD4XdGAnkvLhv73GnYP4G4mV6O42PFpmiRKxFQY/yCkaXULxhweBtJ0SDZOK/pvM18ssA/LeR93kfL29LKbyIA1I+k5U4EgwD15k8fnjIMq8mqn3cF+xw3aO1J0AUnh4IHhhcrZQOVqH2iQc64yWR3Rk0x6LBgcVnYPIYWqZ4FYZNTSygT57Nbw2ru0H/7b817EpgVY5wBbldTmYCl59fT0n4jyyyMlQS257bS7L3UlKCy0qm6YmOaMVuBviOiU4/t3o6BNRnCt86rrmOGiCXLVy1m57lP6Eu6i1DfW4V6AqPodMZl/1v1zxEtrjy3u0sJ8i3CCPMp1KKIjKtOqW8R9ybkxz0DUrwcVn8vRu1dyI6q0l5hpRiJiqQ1lYf4VkzDPedV26JFkuisxvxU0p8kUBY7weBwk3ph0A9ZDI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6636002)(110136005)(4326008)(71200400001)(64756008)(31686004)(91956017)(5660300002)(82960400001)(66946007)(8676002)(66446008)(66556008)(316002)(66476007)(76116006)(36756003)(122000001)(38100700002)(6486002)(966005)(86362001)(508600001)(83380400001)(38070700005)(26005)(186003)(6506007)(107886003)(2906002)(53546011)(2616005)(8936002)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHFEUkx6VU1yRkdreGZrOFEyQ281WUNYdjNOME9kT253eEc1b1BIV3FlZ1Rz?=
 =?utf-8?B?ZUFvK0VGUHR2ZStiNUpUM1RteTNZR0E2czNQSmJCbm0rRnlwWHpJdG9PNHhN?=
 =?utf-8?B?c2pWVEJYUTErWFJ4cFhJalFwTEtSSTE3L1lCaWxUVlZhVjhmSzRHekFFOWw5?=
 =?utf-8?B?eTM0SWdSMzBwTFpoWFk3OTh5aUgwTzU1ZGxMK3NYOWlGRjcvbnlpQURiTlBR?=
 =?utf-8?B?bjl1azAxUEs5ekxSK2o0ZHM1b1JiRTFhVEpPeFZuQ2xKeXhZeXFBL3lHZFN1?=
 =?utf-8?B?RkloQ2VQdE91cDhxUUhDMGtCdUZSaHU1V1ZVd1E4RjZPYTR2emY2UzNOOU9C?=
 =?utf-8?B?YlF6K3J2UlVHUWJDS1AvNElabk9qcGtyRC9MMmZJZEpLbzMyU1ljdFBSR1BJ?=
 =?utf-8?B?ZTJsREwvNFZleFMycmVIellSZHJMWkE2WlB0cCtYa1BFZ2orclN3VDNvclp4?=
 =?utf-8?B?MjZRd256eXBncDVmc1R6NnlVUXlxZ05Jc2k2a2xtZmpyQU1SSXdKZ09IL1ll?=
 =?utf-8?B?OHFveGM0L0dRZ2RjM0J6VmpvSmV2S20yNElybmRmOFlWMkJFeUg2aXNldUhO?=
 =?utf-8?B?bVZ6N0MrVjhOSW9ZMUU5cm5jbnZteXgxZWFiM0JkMk1tVmJwUjlVWVhVa1BE?=
 =?utf-8?B?VHRueW94UlNOZFBmL21GR1hTNHRFbTJ5Y2pBLzUrMXp2bGU0RkFkYkx6cDgy?=
 =?utf-8?B?VFhROTl0Wjhqb1h2RExBV0xSNzUwUXpidDBSWm9pU2h0NXdEdm9UZHp0RkZJ?=
 =?utf-8?B?enNOb0JqVmpXMEx2cEVVckE4SWdMdVBvQjZhdGVZSmVNV0tWbERqRXpCTWY2?=
 =?utf-8?B?QzV6OC8rNnBDN1A1MTZ4OE1tZkdOY0F0YkthczhMUnZncHYyZlBWT25ha2tG?=
 =?utf-8?B?WjE2bUcyeG9qdjJyVUVJOVNOd0tnWk8xYzJmRFc5SXFBWWtIKzdsZnNSeG9r?=
 =?utf-8?B?QnByWVh2ZkdwSHNwQWpNMHgwZFVkWHJaeFMxbVAxeGtHTk1XM1FVR2EzaHpu?=
 =?utf-8?B?cVZpM2NYakE2SUp4TEQvSTE3ODFCT3hIU0h5NVpNYUNhck1KWEpHalJVRFZy?=
 =?utf-8?B?dEYvaXNpaVUyYTB0blFmRzZ2Q1FVTStRUXNGQ2IxekdNQ1hlZkpMUmFic0VZ?=
 =?utf-8?B?UUpBclpFUUQ0Q2pseWw3aURvTEkxcGJ4dHBkQkZ6SC9xQVZUWXFmZFY1WThr?=
 =?utf-8?B?L2NkOWlhN0Y1L0lkOUlBcEJDejIveTJMMHpWMEQ4WUNOZGk5ZUZyRXd4UnRx?=
 =?utf-8?B?YU5ZbEZzVjFIVVVmTVVKclZ3cjFvLzIrTW5HQVVKZlp6ZThRZHNyb1lDTDV4?=
 =?utf-8?B?alpRbWExcmR2bDFqdkM3NTl0WUt3SUthU05YRFpWbFpqL1FxTkRUTmsyWFZB?=
 =?utf-8?B?UnVlQ1drU3dhWmZRZC9TWXgzeXJxK0ZTNWlMN05jVGUvSks2MjMzcHp5TzFQ?=
 =?utf-8?B?V2NRMzdINnRwNlFNMUF0ckVTQmlzT2ZJSWtLb0FLRXlHbmVRL0FpNUlBNzJy?=
 =?utf-8?B?TkRjRW81K0plTjBpZFV6VXJ5Z2ZmMWZZamxJNklvZjdvMnRJd1Zxdk1TOFpO?=
 =?utf-8?B?dndYV0oxOVBRL1pPWHVrWjhsT3pvZTJjaXhSUWd2c3JUcGljcnk1MEt1Z3p2?=
 =?utf-8?B?MGJOYUZrS0VZMVR2UlNGL1hKVW5wV1Z6QWNKTnpCbklJa1BYS3VnWWcwTGlV?=
 =?utf-8?B?aGVLRVpRSVVMdE9zQzVrZ3hLeHNKUlczOWNVY2RrRHBLZ2hzVXBFVWhId3NV?=
 =?utf-8?B?WVY5MXhoajM1cXVXZms2Qm5iUitLZVB4U0NyVFZWaWNSaVZYRjhyRjFhTEhv?=
 =?utf-8?B?MmdHMGlRd1N3TEFzS2U1RWxwWkZTb1NDSzJRZG1uWUllazlGYVhqdHdaN1dM?=
 =?utf-8?B?cVc2Syt6WDdoOWRpek5tR21wZDdDbzZITlRqQW1VclJabitacExmVzJmN2Y3?=
 =?utf-8?B?em92bW5OTFNYM0Z0emd4empwakpSb0IwVjZvU3pwQUpwQ1B6VmROR09pVDZ6?=
 =?utf-8?B?UmNwck11Ty9BVGRZOEVFalhzSytUeXNhZ3hUVEc1K2NVRElHZjlRdEtkeHIr?=
 =?utf-8?B?MzRvUmpVZmtweG9URlBaY2VtbWdzbmNYc25abndGS3dnOEMvYThiZ2s2clQz?=
 =?utf-8?B?aVJYNkd6SzI1SlZYNjhlM3I4MkxIaCtpSEhrdDFTU2EvTXBUQThmK2t2WFFU?=
 =?utf-8?B?UUUya1J1akxvbkdiMVRGTFkyaHV2NzVkaFJ2ajMreW5VU2tDL0xCcm5Ec0Ez?=
 =?utf-8?B?cTVINi9lczc5M25ZR2pNelplZ0l4aVdMQVJxQUh6YUVmdTVObG5aVmp5dWNT?=
 =?utf-8?B?V3JwQTdIckYyVWVUSEhaVHJ0ZUU1KzRBRGtCM2xvOE1oZXMrck00QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F33AD89354E8654BAF725CB867589BB0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1735cd-6ef0-4c2d-fbdb-08da17a9bed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 08:45:04.4000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NXbI/0V5useZXUdgHUARZsA+IHCoWN7HqVfJkLv0ltjYLSV468iKtOrveVWJggaTzdTU4QXBlsA8a729IS4vWR6KtDZGm1BYVJYEjHxfCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2639
X-OriginatorOrg: citrix.com

T24gMDYvMDQvMjAyMiAwODoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjA0LjIwMjIg
MTY6NTMsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToNCj4+IGZsaWdodCAxNjkxNzAgeGVu
LTQuMTQtdGVzdGluZyByZWFsIFtyZWFsXQ0KPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJv
amVjdC5vcmcvb3NzdGVzdC9sb2dzLzE2OTE3MC8NCj4+DQo+PiBSZWdyZXNzaW9ucyA6LSgNCj4+
DQo+PiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywNCj4+IGlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOg0KPj4gIHRlc3QtYW1kNjQtYW1k
NjQteGwgICAgICAgICAgMTggZ3Vlc3QtbG9jYWxtaWdyYXRlICAgICAgIGZhaWwgUkVHUi4gdnMu
IDE2ODUwNg0KPj4gIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgIDYgeGVuLWJ1aWxkICAg
ICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDE2ODUwNg0KPiBVcmdoOg0KPg0KPiAgIENDICAg
ICAgaHcvdmlydGlvL3ZpcnRpby1idXMubw0KPiAgIENDICAgICAgaHcvdmlydGlvL3ZpcnRpby1y
bmcubw0KPiAgIENDICAgICAgaHcvdmlydGlvL3ZpcnRpby1wY2kubw0KPiAgIENDICAgICAgaHcv
dmlydGlvL3ZpcnRpby1tbWlvLm8NCj4gICBDQyAgICAgIGh3L3ZpcnRpby92aXJ0aW8tcG1lbS1w
Y2kubw0KPiAgIENDICAgICAgaHcvdmlydGlvL3Zob3N0LXN0dWIubw0KPiBjYzogaW50ZXJuYWwg
Y29tcGlsZXIgZXJyb3I6IFNlZ21lbnRhdGlvbiBmYXVsdCBzaWduYWwgdGVybWluYXRlZCBwcm9n
cmFtIGNjMQ0KPiBQbGVhc2Ugc3VibWl0IGEgZnVsbCBidWcgcmVwb3J0LA0KPiB3aXRoIHByZXBy
b2Nlc3NlZCBzb3VyY2UgaWYgYXBwcm9wcmlhdGUuDQo+IFNlZSA8ZmlsZTovLy91c3Ivc2hhcmUv
ZG9jL2djYy04L1JFQURNRS5CdWdzPiBmb3IgaW5zdHJ1Y3Rpb25zLg0KPiBtYWtlOiAqKiogWy9o
b21lL29zc3Rlc3QvYnVpbGQuMTY5MTcwLmJ1aWxkLWFybTY0LXhzbS94ZW4vdG9vbHMvcWVtdS14
ZW4tZGlyL3J1bGVzLm1hazo2OTogaHcvdmlydGlvL3Zob3N0LXN0dWIub10gRXJyb3IgNA0KPg0K
PiBJZiB0aGlzIGlzIGdvaW5nIHRvIHJlY3VyLCBJIGRvbid0IHNlZSB3aGF0IHdlIG91Z2h0IHRv
IGRvIGFib3V0IHRoaXMuDQo+IFRoaXMgZG9lc24ndCBsb29rIHRvIGhhdmUgYW55IHJlbGF0aW9u
IHRvIHRoZSByZWNlbnRseSBhZGRlZCB0d28NCj4gY29tbWl0cyBvbiB0aGUgcmVzcGVjdGl2ZSBx
ZW11IHN0YWJsZSB0cmVlLg0KPg0KPiBIb3dldmVyLCBpZiB0aGlzIHdvdWxkbid0IHJlY3VyIGl0
IHdvdWxkIGJlIHNpbWlsYXJseSBhbGFybWluZzogVGhhdA0KPiB3b3VsZCBzdWdnZXN0IHRoZSBi
dWlsZCBlbnZpcm9ubWVudCB0byBub3QgYmUgc3RhYmxlLg0KPg0KPiBUaG91Z2h0cyBhbnlvbmU/
DQoNClRoZSB2ZXJzaW9uIG9mIGRlYmlhbiB3YXMgcmVjZW50bHkgYnVtcGVkIHRvIHdvcmsgYXJv
dW5kIHRoZSB1c3VhbA0KT1NTVGVzdCBpc3N1ZXMgd2hlbiBpdCBnZXRzIHRvbyBvdXQgb2YgZGF0
ZS7CoCBHdWVzcyB3ZSBwaWNrZWQgdXAgYSBuZXcsDQpicm9rZW4sIGNvbXBpbGVyLg0KDQp+QW5k
cmV3DQo=

