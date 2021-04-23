Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2653695AC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 17:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116464.222294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZxQO-0000Ww-Vb; Fri, 23 Apr 2021 15:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116464.222294; Fri, 23 Apr 2021 15:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZxQO-0000WW-S4; Fri, 23 Apr 2021 15:08:56 +0000
Received: by outflank-mailman (input) for mailman id 116464;
 Fri, 23 Apr 2021 15:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZxQN-0000WR-95
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 15:08:55 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eca979aa-91f9-4f51-b7e6-646c1065bc6f;
 Fri, 23 Apr 2021 15:08:54 +0000 (UTC)
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
X-Inumbo-ID: eca979aa-91f9-4f51-b7e6-646c1065bc6f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619190534;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DUBCAn+X8+8D0PZ8nk1uUNOLpBr/g7wbrdyYCwXwWus=;
  b=BdCPE3om3+fnKGvT8aTCOrHy8sNBwLbE8pm/ef8rSHi59BdKoFhqEy6h
   83Wt89lokUbB/yBCXiYc1EtuYtLpvBoW+rDQ8PNjiPNYXdW8pD65AV5aX
   2jtElMx7MsB82sZEoh/FJe6wZc30y6mJhqYpkp1YKGGRQ63puLGuBJ3oa
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZA5S7EaeSVj8txApTfzT+Vwq92XsFFOFFSsok78vPWkjhhPJclnV+oQBFAG9gXV1KItt8FSt2F
 XkwUNKpzVmMgkxkvSB/nnxX6UggVwz6vmL9lHSf0/czNPdNc3DWswU8JzEJ+5VyixqQk6HjfmH
 Jp86mpYFbxUitAwZ/PshV/xDnLnSMzYICOSbgKWxvwlM07ipt9Vf/D1SUIasTz4eozR08H/frm
 yRPgDEBuJZ912OhYaho5JTkQCo7JxgUle98A7TnVEOFY3bUCMQ732AeaYZZY+g+cYxhrEcOmCz
 gGM=
X-SBRS: 5.2
X-MesageID: 42108647
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VAsipaBeLMJ3ZAPlHehfsceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAF0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyApeCb9Ht1SBEvVqcI1XYaNi++MmlbADZLHoA4Ep
 303LshmxOFdW4MZsq2QlkpNtKzxOHjr57tbR4YCxNP0mDn4Q+A07L0HwOV2R0TSVp0sNIf2F
 PIjhDj4eGbu+y7oyW260bo859UlNH9o+EzYPCkt859EFTRozftXqtNcfmovDc5oOaggWxa7+
 XkklMbEOlYr1/UdmGxixPx1wfnyyZG0Q6d9XaoxUHNjOa8aDUmC9dQpY8xSGqp12MQ+OtS/Y
 gO/2WFu4FZBRnN9R6Nl+TgZlVRuWef5V8B+NRj9kB3YM8lR5J66bE7xgdzFqwNGSrrgbpXbd
 VGPYXny9t9NW+BY2uxhBgW/PWcGk4dMz2hWUY4tsmcw1Ft7QxE5npd/sAZk3sanahNMKVs1q
 DBOqRsorlEUtUbW6J7HPsAWsu6EAX2MGjxDF4=
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42108647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4wUxEKR1mcansgxcM/ZSzwxLIvUALNITV3vF0uy5vSvYHcVTFSJOY4oV3JR/lVm4XsF6Tbv+cexu/6Syo+rw90XYJGvgdltB6S80jUeL0FcYFYdKO8PiH2sn89+rVQTEPWtr+WdD+MNlMxJfG5RwgCuSbMrnNoCCArYhtB8G56UoDp42XcVKCStvpxe05TZ6GOQk/ROOjSNNy3KdS2ugt2gbDQBUDGWnGoiwZmr/XF/n1qoH9YqZc1yE7zQYrFmcWJFKd4Uz+nLdf4bmlCY3US58fLbQ9sCw0yQS7cD5RyPFw8//XRu3dY+NrHiloZsY71kpSeALpElWRuuD2bvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kWF9SLEDid5HopZY6yt3vHr0m7iPltaTyLP03kOgUE=;
 b=dnGTH0299+E6ulzWlQIppYzICzCyHmrI4/InhX6zfkIjKgwut0DB9N7XpeOBxKkj84TjNqjIqcIkzy87KMUzelsA6+5+iFqXGrg1QtErYhMiWEK67PVcUOLktEM1gpzmIdqOi8FlZlblcHJXXZqgol4/hGQfMWztUdJbBZhHZJwkroxEXTXtix7zNuujKnkeMxS+oeSaGu9Fqw7UlwrYz8FzaVM7iJ1h8O9QGjOKrKSzsIiPazXWoj2jyYDd6jpqLxzG/KcGruBM3OeZKSW4rvulU0Ucu/7sMvlowqRX+9k91ROO23hVMeYG1L6fj3ijUYCCOEGfWcjnDXn5LlPIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kWF9SLEDid5HopZY6yt3vHr0m7iPltaTyLP03kOgUE=;
 b=nbWn3CPYLHQxbKwsNxBzR/t83wmCxpcazWWXVz1Xcv/9Y4LzGLInxOONsHh1h5WFE8L1/6Ff5Ls8hIiHgQakM0ffcLM68Xw9xy3L29d2yvshntMmbb0uA9Ba3bb6sMcyHkAr9EC7zm2nkHcSIJ+NukF1vWlWeTzfv7YgczICPoo=
Date: Fri, 23 Apr 2021 17:08:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergey Kovalev <valor@list.ru>
CC: <xen-devel@lists.xen.org>, <zaytsevgu@gmail.com>
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
Message-ID: <YILi/Qft51Vh5QZy@Air-de-Roger>
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
 <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
X-ClientProxiedBy: MR2P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66d948cb-0437-420b-8a3e-08d90669b3ff
X-MS-TrafficTypeDiagnostic: DM6PR03MB3834:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3834524392F1C9A3C07DCC5D8F459@DM6PR03MB3834.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJYWTu5lF7qisTHBcCtCXhw3toHLAeklOZ2saok595S9VjiAk88zDQ26hYomTvvqNBoPNzfZjDzNOSB+gAD40uwL1oVsNvvE34N9z/YSM+NJgqMurVTNK7prnd1g9h1ApAHeNQwAY5xRbk2ICbRrwkw5HJmmMKtjvSHEhh2DPY+D5KqyqTWWHtcjEIF/uyhOC8DWs5EDa0037XCQley5PlHp3kW7C6VLGBFfArQ9XWokFNTnEf7WZpvNHBb+3LTxpQCsAon09wRPHaOMoJoCNDBIG13o99D/MFWd8O8UVGT3XRIVO31qzeLKPWtVPNsGWbfcC9s5slsyaw3nTcz0lNoHvFmL+hJ+BfsaaQz6Ci9PLKueK44U5X4W4OpfaCqVs1k30P0szrgmkwLM9Rp26paEBlcbiqcnFq0zJBb2PA+U+VXuPO8/sK9QcLYwFdH9jIQ5HVc8s6xGIgk3HWw4exYiV1YqE87IuZ01Em52/VViDo3xJ8Uwy3eLAhSpFWH2eYq02rLeoQU2Bx454KpSU8OTKIYAB0jWWU9ibvt4iPauTggo36okkDbuu/H1lms6CaLa30N2jSU2ppmlyxihUd14kLaJ67ApHw35b7mu3uc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(396003)(376002)(346002)(136003)(39860400002)(66476007)(2906002)(33716001)(5660300002)(6496006)(316002)(6666004)(26005)(9686003)(186003)(66946007)(478600001)(956004)(85182001)(66556008)(38100700002)(83380400001)(6486002)(4326008)(8936002)(6916009)(86362001)(16526019)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTJzUTNFZDZQdm5hZGpUbExCc2R0STR3RXdUTmRoOW1LM3hUdk5DYWF6UHlp?=
 =?utf-8?B?SDRNZG1YanFiZTBLUmFvbTZBV21XQ3Mxc2dpdGNUVjlubWpjSDNNcFY1OER6?=
 =?utf-8?B?N05xRUtaU0dqNmg5cTFnUE1TdnErTXpwZlVrV3psdHRGeFAwZCtKQVlQWGpD?=
 =?utf-8?B?VXdFYXFXa0grTGVYRktIZFk3S1lHNEZaZ0hLNm9qV05wNjBYT2toeHJXUk11?=
 =?utf-8?B?RnJ2YllyZ2pCU1lKOVJnM29jdGlQZDNGL2Nna3NNbFZUU3lFWTR6WkFaeU1t?=
 =?utf-8?B?NWhJd3R3VldQN29BWGYyOUc2UG5jYWhQcHEvdkdTK1ZrWld1eWNJOEFwNVpl?=
 =?utf-8?B?dHliUUpzM0lYb1pWQk9icmRaM1ErazZlc1NKT3pSQUFTNEhuemN2dGkwYnFl?=
 =?utf-8?B?TGtvbUdON0RKK1NXa3h6TjMxZUlFYjB0TjE5dEc2L294Umx1KzJybVdRTEZJ?=
 =?utf-8?B?cVdlc0NzUlB0dlo4WlV0V3E3dUVsdE8vWUtoMkJhamIrZkFSbmU5NDM4SnN4?=
 =?utf-8?B?QkVIekdYc1RzWmdmVnRRejNKQmZHV012c2o3U2dZZHhxNWkrazJIOW1qd0FY?=
 =?utf-8?B?RVJPRHVxSlVHdnprbWhJMGdscytvRGVxTkZyRnlOS3R4QVVvcVVoeENicU9F?=
 =?utf-8?B?UStxSHlHT1Z2V0srYWlmcUlncUUrUHdaUDJMMTQ1VndwUGtDQXlpeU8vVDls?=
 =?utf-8?B?cGtrQVZDT0lZSHM5LzN0ZzhDWGJIRmo5dzNkcE5JaDJEWlNmUDhmcTZZUGJM?=
 =?utf-8?B?eEt0Z1hUeDQyd3EvMDk2dGFjQkFLWmJJZmlqbDkwSmF3QWpwZjhia2Z3cU9q?=
 =?utf-8?B?U0h6cnliR2NWbkMzTlNCZkNmOXNpckQ4Q1dObUpsenRrTFNHVU9SdWdibmhQ?=
 =?utf-8?B?MWFLZ3d3WmFOVEZzaFlQQlBramJDYzRweW1pUGtxQzRtaHFRQm1aWlF3bFBN?=
 =?utf-8?B?dDZkN1YwSC9sNG5PVUtFMll6UVpKS0plWnlwVDdIVG1vcE9qZUVUdEJiaWYr?=
 =?utf-8?B?a3lJV1F0Qk5LTFBWUjRNM3dyUzdzTDhQOEJRTnR3MEZiZml4MG5ycTVsKytm?=
 =?utf-8?B?bU1Qb2liMnRLMXhQN0xyYVJ6OEF1cEN0Rlk2c0NocHNwcDRoM01zajEzaUUw?=
 =?utf-8?B?OVFwOHNpa2ZGL0FjbG43YSs3YU5Ld0phRTdtZWdHcUp5TVlEU29EZk5kR0NS?=
 =?utf-8?B?Rk5HQmxXREYrTG85QTVBejZFb2FyUFVXWldDUGw0N2l2aWxNME1LMDZjWTN1?=
 =?utf-8?B?TEpZbHZNa3JSKzlUdU9ERitoSnBEd2RCSEtQR3JNR0xzLzhhbkRFQlc4NDFm?=
 =?utf-8?B?b05tODVwUDZGWlUrY3ZBT25YU05mZHJ0dGhlUTNDQlJkOW5ucUlSWEdzbHVM?=
 =?utf-8?B?YU00V2dkWTBQcm1MWFhZbkpxQmduNUVNMjVERmU3TFFHeGZjbERnY3M0NHQ1?=
 =?utf-8?B?bFo2clF4Mno0YThvM05EUlNiVTFWZ0JDV0VvN1VQY2dJQXFrdWc1SjFRL2ZQ?=
 =?utf-8?B?eHQzRW9qRkxHajZKT1cyd3RTWGE2M0tlbWNJMUJ6U0pCK1o3cXZLa3psZ2J3?=
 =?utf-8?B?TlVqbDAxeCt3ZmJjRXhuSEx0UUo5UHZHOVlJR05wbUlSNTRzWUFidVNwZUZD?=
 =?utf-8?B?VERqMUNGdG0zdVVvckJvYk9CbktaSmZhUmZBUnBEWVRhaTZPVzdKZ2tuc2ZV?=
 =?utf-8?B?cjZ5b25jaC9Da2V5VkxoY0dKMVJ5anBibmxBQWt1ZkQvVEsyWitucm1qZEdN?=
 =?utf-8?Q?0WrAAqo0NpJrSx2ekdTVe6Qc9CNr+rzbvHklcyO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d948cb-0437-420b-8a3e-08d90669b3ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 15:08:51.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M74u/1huIhwlcvYWcyqNQ7QA0/0Z8bn8VIVle6zXZzVNkfbHP9WNshp5ijStd+g99LcAAfO+FQcS+sZ1SQEBpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3834
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 01:22:34PM +0300, Sergey Kovalev wrote:
> # Abstract
> 
> After `xl save win win.mem` and then `xl restore win.hvm win.mem`
> the Windows 10 VM remain frozen for about a minute. After the
> minute it becomes responsive.
> 
> During the freeze the OS remains semi-responsive: on `Ctrl+Shift+Esc`
> press the wait cursor appears (blue circle indicator).
> 
> This is an intermittent fault been reproduced only twice.
> 
> # Technical notes
> 
> It have been noticed that there were no timer interrupts during
> the freeze.
> 
> zaytsevgu@gmail.com has debugged the received Xen state file and
> noticed that the flag HPET_TN_PERIODIC been set after unfreeze.
> 
> Based on that he provided two Python scripts: one to check the
> value and one to patch it.
> 
> Both "broken" state files we have been detected and patched
> successfully.
> 
> # Other information
> 
> ## Target machine
> 
> ```bash
> $ uname -a
> Linux localhost 5.4.0-66-generic #74~18.04.2-Ubuntu SMP
> Fri Feb 5 11:17:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
> ```
> 
> ## Xen version
> 
> Build from source on tag RELEASE-4.12.4
> 
> ## OS version
> 
> * Windows 10 build 1803 x64

Do you also run other versions of Windows, and in which case I assume
you have never seen the issue on those, or it's this specific version
the only that you use?

Thanks, Roger.

