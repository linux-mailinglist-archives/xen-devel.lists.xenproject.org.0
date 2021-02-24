Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987AD323A67
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89237.167925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErHx-0007it-GB; Wed, 24 Feb 2021 10:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89237.167925; Wed, 24 Feb 2021 10:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErHx-0007iW-DA; Wed, 24 Feb 2021 10:21:01 +0000
Received: by outflank-mailman (input) for mailman id 89237;
 Wed, 24 Feb 2021 10:21:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qs49=H2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lErHv-0007iR-Oc
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:21:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbffd52b-bc7a-46aa-bb63-14bf472bce2b;
 Wed, 24 Feb 2021 10:20:58 +0000 (UTC)
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
X-Inumbo-ID: cbffd52b-bc7a-46aa-bb63-14bf472bce2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614162058;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nNjlYhI937zkkSmM7N4sPVbJ9UiXVBAZM20+gFzB7fQ=;
  b=gRoe6+l80WDmrq6QGHV68r0AUvCH0KJkWQalE419FJT0XNrB0w3zin3x
   uLzNaSKFteuKWfTOQm5a0KILVSLQmygiue6ESA0lLgPOFR5okj6qGTgIw
   CogvOGeiQ2WTCXokFxNiNXFG6eeUhTmomtzpvHKqYuVIs9EJ9ZgmoFodk
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ngR1ue2C1O97dQX+eBx5yiHLBdlBImAdl3/VygmhgcWPVJ4N6Nh0VNwvkvMZrzQgTCVGj4zdzA
 sEubshhkXFnigOaQoEBzqmWSejm3+JICDlJH2J7elonP8c5xCGuhdqASk/P0CVKTpzrLxzOOvm
 ajo//lHkyXCs8f4Ll4UB6JWdPxF2Mug2PTBm4sswghi9HeLsSLkTXFY5tV3k3sEpSORUpMJSah
 jWXsvDlXdaBZXZiFEquUDd/EZP/Exo6AoVZitmrTSsF9rx6ZuaGEBU2YeX8R+kIwv6LhDk+KXB
 CXI=
X-SBRS: 5.2
X-MesageID: 39296787
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,202,1610427600"; 
   d="scan'208";a="39296787"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcQMtkX8ckIVWl+u1NanUYcvSUI40GY+OThluqzhx20H78yX3scf8aN0FCWMrTQePYv3mwm9/tlAH/XG15HrnEKTD57X2U7+Yr74RgZIsK67Kuj7QNe91QC7KJiS3vsZi2x277wsu22YvnwhZe08PrAHxzDBYlbFW2ceHXtFOq4okiFIoTRpid5Sgd9Xg9zWTytNWB4HN/Cp+Byxp0LWD10wbFJVyi0PGcWN1u5p07EHbV8Z0xJQzBJmjfgUFaX8OL/M1GdHYn4t5pms2iFdlW5duIXG3ZnlOqGxipt2XL8A9tBwVguFzPb+zwn7MgqkbpI/ypRXLrtPFUxqLM7idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOmbYkEZH+o/N87Ohbl6qlrRkNv2stcHZzmPTrsPvRs=;
 b=HovLOdaeerk3gheF9NhJqnoqfuRWPcPd49OLdGgwU5q1QARIGXPw6s0eRbdbyi7/g1ZDHHcJ2VCAoXA2P2WcKKaqOozyGQ2R5Gpz2c66QHPN3Whb3xrtmGd+U2BYybTruJF5VZpb6YlPeww+K+JC93wz7D8WMeDZ18ZswotblU1mOm4tGUMgjAtfJJ3/Ff7toT9fBacxG3Qtn7jd7E779/wf/cqSCP8u9YR+bElP27q0iofwFyeYGgCaAXhCNq8J4305SMXNdnW1lFUKWWIaCtkDG4uH3Dtgxn4rEedTh4sdbHCmWvRu1iBRU6G9a6Qg+ZUM1jkY3EQXrFy+LgJisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOmbYkEZH+o/N87Ohbl6qlrRkNv2stcHZzmPTrsPvRs=;
 b=BWasSQ0ps6MGLpFrY3dyeVnhniLE4OcMlDnITh62fIwfnQOLkzDyLMCyvCNjP8dluGVsNrykwvChcL72H0x5mFq3VJuZxJIjK468Yw+T2An6bgiOg+PvL6SUIea+Ak4VgVWXCHF4d3b4cqU3Ht/ssNLnfz27J+apKPTnSD5ufsE=
Date: Wed, 24 Feb 2021 11:20:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>,
	<anthony.perard@citrix.com>
Subject: Re: [PATCH for-next] configure: probe for gcc -m32 integer sizes
Message-ID: <YDYof8YTAViDlDz/@Air-de-Roger>
References: <alpine.DEB.2.21.2102231648580.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102231648580.3234@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: MR2P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::17)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08756c50-8de3-4533-ec2f-08d8d8adde1f
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463FCEF58D3207367D977278F9F9@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8psd3L5EyY+8WtA6vQkh/TmFYszWedV04UeicQBDsPTQqkz9Ab6ZlqTzo23PzQSoO3rmdtj2u1bkOR8n2qvYVsDfPqVq4qpW5J/QI/ecr5TRpiFnBF/n457rWVZfDLm/Z8iJH/7CPRAR0a9bER3BAOW6VhTA1ARlauHnIJIk7Kg52pZdOkJOK7oVVa0rEx+PSaOxA8h2uKxyESxfUoBmxrztqC/dlk9ht1qOUpnCH4t1kG3imj2y8UslI6dhv78x67QX/nTogsdG8p8xJHhMFs2kxaLrp7/LvsBo4G12djEkbr9ivY6Ln4TvMfI79A65EDWEWRnXzlfIzRCyBkyfIBZhFsLKXiNqQQZs4GbWIHCfJ8zLcl/52Bg8HRjgzKfltFxOZS7BbgOkCKtuh0h58+AlQp/0XWaBdxkkoZv2LD/DZ3xpLwx3gQ4Sfm1XSGse0Bkt+QHfV8J+CYp+zel+NlTm1m5zjqUo61hwHaY1u1kyQeC1WBbcFKlbnXGfel9eOQLpgpn8yQ6lxXwq4Ctpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(136003)(39860400002)(346002)(366004)(316002)(107886003)(956004)(6916009)(8676002)(478600001)(4326008)(16526019)(186003)(9686003)(5660300002)(26005)(4744005)(66556008)(6666004)(86362001)(8936002)(66946007)(66476007)(6486002)(33716001)(2906002)(6496006)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blRkWksrWTN2NjdTczRhMW9jcDljWG55QzZCUmhESlhaeXFlWkFWNk93dmEw?=
 =?utf-8?B?Q2VXOG9MZ212RmxvakV1ZE1KMEt6bEdMSDN1bHg3b2M2YXVpcllaaCtWQm5k?=
 =?utf-8?B?UWFSQUZ1K3d6TENLN2w5a0xiRlhhSFE4a293aFVTOGxEQ01Oc2dBSlY0OW5l?=
 =?utf-8?B?TUs5MXg5VnF1TlA1cUtVSkNJK25Mb2d0ZFNFemxRUlpUR3Rmckw5K1VtN0Rx?=
 =?utf-8?B?UjZ2Zks2MFZSU3J5cjJXdEtwMW56cXYyWm52a1h4a1RUSVpndkJqc3hZYlpC?=
 =?utf-8?B?ZkgvdTB5ZFpxWi9VODZITEFhSmRIS09Nc2xPSTJiejhkWk9YZ2RtTDQ4Yy95?=
 =?utf-8?B?aC9oR2gveXpBekJwTmhJZUQ5K2NqLzZGdWluODRQcVZDVUxkNFZTN1dtQWR3?=
 =?utf-8?B?cS9rNnN4U1ZQVE84SW91SEpPYVVGY25LYzFaQ1hmY3dJQ21mQkc0WThnV000?=
 =?utf-8?B?eGxaZnFlSXR3am0vSzRMUGk0WDFJZ2ZpZ3hVVnRJS1ZLQ3ZVS29zbmljdTdH?=
 =?utf-8?B?Q1haU2VoNDJ2aERtSlB0dG9DcVdGd1g0TGg5ZkV6SGpvMXlmd1JJNUJkTk01?=
 =?utf-8?B?eGRKaVhuMzVnWUFDRGlIVEg3Y0FraDBYbXYxWmMvKzR6VGZxdHl1REYwWGEz?=
 =?utf-8?B?cHF2MXVydmx0TlhyUUxWcHh4MEsySndWZVJaU3h5aGNERUZMRXFkdVVhR3Nz?=
 =?utf-8?B?RDZZUzYvelhvRHkzRUpHbk9ObVptalAreHhFOFZ6czVsd2M0VjhWa0dGaHFV?=
 =?utf-8?B?RFlmcTRkMVR3RmlWaFBGaTJWaWpkUE14c2txdmI4U3h1a3QwZ1NmTnpKMnYy?=
 =?utf-8?B?dlg1a0tKRlpEaFN3bXBnMXlEa3pMS0t6MWtTTnpkY2lJQ0N6MGpaelNzdG9n?=
 =?utf-8?B?cFpkZEllS3FISEdsTDFKNk9rN1R1cWlDbkdmZ1RCQnlIOVYzbFdmeE1HZlpK?=
 =?utf-8?B?QVhhNEZwWHFrbGtZYk9Fbng1ckhYL2hob2FhdkhkTTZ5c1dmMWhJNmQ4N2dD?=
 =?utf-8?B?UC9EeWNnUk9JMWswMXU5U21qZno2bzhnN3JlN3NzUHdzNDVjZHdFUlUxMnlY?=
 =?utf-8?B?SDNDK1h6VUJOR2VnT1hNTnRKN3hqY3VoNVFUZVpHRkdRWWRDQ2VSeDlmNVNE?=
 =?utf-8?B?d2pOclB2dFBJT0FabFcybXdsaEN4a3B6R1l0RjFJZXJ5MFVHRWFLQ2NDZWJI?=
 =?utf-8?B?bVhSN2d4T2RPamR0UnZhcjBmN01JeHAxcjhXKzBneWNaeDVwZ0Eybm5mTk9Z?=
 =?utf-8?B?RmpRcFV5S2dMTWR4Z056RnMycktrWEY4a0FhMTh3b1pHem5PZnVlWFliM21O?=
 =?utf-8?B?blhCTU9EdU1Icmw1L0F1bU5GNnFKejdMNVpMUHpHMFUySkxWbFY5RHhZSjZV?=
 =?utf-8?B?WGZLTUtjeXM5Rkp6NnM1SzdDQjFIbmUzcTdNNVZOU0lqL0M2RDc3TjZ5aEdJ?=
 =?utf-8?B?U0JmSEdZUFNoZWZMNHYzMFhCNTQvUlc4YTU2MlBOSXRqdWhDaFdXMVRKeUNS?=
 =?utf-8?B?L0pPS1pBdCtZUzFVYlp5SUpCOFl2MzVmYmpEYjJNaXdhOVdRNFk5a2dnaVlC?=
 =?utf-8?B?elV3ZkRlR3JkOTRacVlUeUgrREdtdEZzSWhSZXpVMEJIVXZHRFZSRm5ZZ09K?=
 =?utf-8?B?djVOb0UwSDhSeUhpdWlBdEhSS2o5VVg5OEg2WXhwUzFIb1NHSGlWQy9RV09I?=
 =?utf-8?B?NWdOZzN6R29rdGRVZ1MzQ1U0akZLSFZqL3ZMMFVQNjB4UUQvRFlDa1lENzRa?=
 =?utf-8?Q?3szOboAUjEl7yuhH/APO3msCWb6nSD4mT/wBHf4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08756c50-8de3-4533-ec2f-08d8d8adde1f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:20:54.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdDkZr4Ta6lO85tG+7dH6SMIFuslv+qeAuCRY34ub49iOmqlfWU75w3jiQPUhqaABHqoA1WZDFVpOLnTByxnvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Tue, Feb 23, 2021 at 05:08:43PM -0800, Stefano Stabellini wrote:
> The hvmloader build on Alpine Linux x86_64 currenly fails:
> 
> 
> hvmloader.c: In function 'init_vm86_tss':
> hvmloader.c:202:39: error: left shift count >= width of type [-Werror=shift-count-overflow]
>   202 |                   ((uint64_t)TSS_SIZE << 32) | virt_to_phys(tss));
> 
> util.c: In function 'get_cpu_mhz':
> util.c:824:15: error: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from
> '4294967296000000' to '0' [-Werror=overflow]
>   824 |     cpu_khz = 1000000ull << 32;
> 
> 
> The root cause of the issue is that gcc -m32 picks up headers meant for
> 64-bit builds.

I'm working on getting hvmloader to build standalone without using any
system headers, which I think it's a worthwhile change to do rather
than this configure bodge. Will post the series now.

Thanks, Roger.

