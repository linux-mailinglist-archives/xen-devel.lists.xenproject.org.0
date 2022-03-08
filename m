Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFB4D17E1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286803.486453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZ5o-0000Xz-RA; Tue, 08 Mar 2022 12:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286803.486453; Tue, 08 Mar 2022 12:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZ5o-0000W9-No; Tue, 08 Mar 2022 12:37:32 +0000
Received: by outflank-mailman (input) for mailman id 286803;
 Tue, 08 Mar 2022 12:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRZ5m-0000W3-JA
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:37:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 837326a0-9edc-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 13:37:29 +0100 (CET)
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
X-Inumbo-ID: 837326a0-9edc-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646743049;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9VrkbleKNpf7rEW/4+vWvP6st6hg0WnKMV7/Q8MgRuE=;
  b=W/WGwxcoKpt+m4PKsZEd4iOmT+MQs8YBjv14S66h6Gv1mrj2c8WzPoqU
   S9rV2e9Gfq9aSeFjrHzkAJ/SHwVt3wTBEBIP41seRlFvkDOrcaHcplO8n
   j8UGbljBl35Jb1hZ59qpad/H1joykS4ANrmRmwrRB21TrmhXtRSbirqkW
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65176449
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FvsUY67MYGqHOVbWRajErAxRtBzHchMFZxGqfqrLsTDasY5as4F+v
 mZLDW2BbvqPNGLzLY0gOoS38RkOuJfXndQwQQNk/3pkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhU1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSvZgsFZ43iqt0HcEBSTzp+M58YyLrudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQK+BO
 ZZFOFKDajyZUhldFw80Jqthv83xlHv0KjgFl3W88P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTRIITD/u57bhj2FmIwWo7BxgfVF/9qv684ma8Ud9CL
 00f+gI1sLM/skesS7HAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixGUcIYmdhRu4fruxvT2Ax1
 lG7wePsLGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+hL1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHc5
 BDoeODEtYji6K1hcgTXGI3h+5nzu5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518PusADYSDzPfIsC25UNyjM5fK7fTgCfqqIBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcyu+5wNKL/ZeVYO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:nYfhK64OMw0qobQi9gPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSKWMB26ffueChPaHbzYfJt3Tk4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65176449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxnVvxQQ1507b7j/NXDe7kalrvvxrp0+ZfvV6e2/ux53HF7IR2qktU04uDqbO0kBjK9n/4mLShQpwGjF//CWaRgLkw4x0EWXwBcUEuwPju/qk9HcV708Etnjo7GNOH/VwaKgF+vC3Y9YxqiFPLy8b97pE0o/jmUwUEeGpOTm7jPzBJbkrJZZmGCPezREFdo7gzRbKXcOKFqiHUTZMktNpcWcSErJkhBhI1fuaeo5V1Ej/6GmiUA3LF2l/JnHgSwDabxJ+iLmgouswr0vX4prDKv99bV11taKd7J6YDaDqmob8nCZYEJmnVZyqmdFWDRYh9a3NSCUTZexFOFypCTBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3PjM7YjxFPOmv6OkEMZsIGB/W/MEnG0q9AmT8FGzjE=;
 b=S+fQcbCBjgq9x2pTIgSaZi4aGf48msugbmTdrbmq5XlsZU7SowWeYGlPJ36wLk+I0psjbpKi2gt74NvgWb1KJd25m0+CJs5MFWTf7eeiGUnIslv3OlHkdaS1vHcDd4QKup2ji4Eg4m2coJYtEvi0fxqhREcQZ2hqejmiwnhSTal2Lux0QAoPCcLamJI6ji3kEnGmigAa+MpGdBltlbRK85XhB6/TGpVXRnrKmIaH2nvhwgBWEXNpZMYSqrAcHdRAObIharChNnM4GstAtkHJbq9XjNdadHJNxVBiQiuivfZdFtmUlAkXxwHqFeyGLH3a3hLT1PG2UMgih6o35TwKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3PjM7YjxFPOmv6OkEMZsIGB/W/MEnG0q9AmT8FGzjE=;
 b=uNNXbFFwaGynYtwD9Yd10S6gkxZG6XcxDYTA4MU0LT7GLGr2nFpd4wqiDx1leiq05QVVyH2I95wvHSmr1IfJS5YeolcT8yz5witST1Scbhm7zwPnQfEVUtGfLzDO7EqLaHppGgv5RVxjaAbJfgOYepY+KTNku05haubMwEa3Kmk=
Date: Tue, 8 Mar 2022 13:37:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] vpci/msix: fix PBA accesses
Message-ID: <YidOAA9rljXnXYLb@Air-de-Roger>
References: <20220307163744.74030-1-roger.pau@citrix.com>
 <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
 <YiccSMWbV2StPFB1@Air-de-Roger>
 <b24007d2-1b2c-8358-e72b-2be49e62f065@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b24007d2-1b2c-8358-e72b-2be49e62f065@suse.com>
X-ClientProxiedBy: LO4P123CA0211.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d571c4b-e78c-4e85-368e-08da010065b5
X-MS-TrafficTypeDiagnostic: CH0PR03MB5988:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB598814DCBA0C43EEB7E00D3F8F099@CH0PR03MB5988.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TlLKJ+WRzD6nbns/Gd0zHV0Hozh4Kx5OBRY6zSRRNsvEW3qtALnAdqGogRCK6UtwWgdH090pR4NohH5/b4bOZYicXCPNvUBMSPP6GTQwfiQZc+tPl8wJdFTBRfqsfpZbmRCWJA+IdQvk0i50/Qe1xKfuhObSFfgJJ1YeB5QIIM7nNJww+MAQGJ7gZtHqXeyiLldo9JPrkdM/DAPJxAmC6CLCKG7rTHWIpIS7bqxMBVr24IpXMOzIXnCLthjDazUKJNR9EalxvfFO1D87POTXIoc/NWZvV1P3uFuZ2ylqzGa6l/uKY+xJBa26DE54xpwt41gPgDCP+ad3CF2084DUe0XAwaPJ9XrJj6/ZL362o5r9/86driK3JwExW5Xsn4ICzgemyJ77KSUjnX3cgayMGZvHoSiTJV9Z0chUTDGiovUiY3ghDbAH69ygUUZ+GSXOrKl+FCeMndCsQvzbtBwsFWVYBzvQziwoTH6lmC+cj2hqRqFmkDlzaWBKb244G7JyfN+9G+pSi6vXfRMG4tZ2LWi9w/qxmtHSyntSVKtA3Pp1mKy1QNnMDEfoLUlQ0IVpaXRJqZByIB7m4qOmUR1zjszUR9kpZtZ2iR/+Kouna33Inz0oef+B0sdIg8x0V7P+6uv+6SKH6DbYu2qzRTPvtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6916009)(66946007)(26005)(186003)(6506007)(6512007)(316002)(9686003)(6486002)(53546011)(82960400001)(85182001)(8936002)(38100700002)(33716001)(6666004)(83380400001)(86362001)(8676002)(4326008)(508600001)(66476007)(5660300002)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWV4Nk5Fa1MwSVRKRGgrK0JscDRLcjFUN2s1eERBZ1VZekxwZjVhczRTSGh1?=
 =?utf-8?B?aHFZSDI5MDdSa29rYjVKK1B5VEFqWFEvRTBBMWFSUm1lbEdYcTRJYTFvcnNH?=
 =?utf-8?B?dWd0eTFiZStVOXR5Q09DbGZaQXczN1JaWDI1Y2RaNTNsV09sWHpQMG9KZ2xt?=
 =?utf-8?B?TzNaek9jUXRlNDBkWFNtQmhBMk5aTHlnaFpXcGRUVis3Q1RFREJJdUd5THZI?=
 =?utf-8?B?V1ZCS3hGb0YwaVdtMFFCdWRPSjc3LzZWeUZCanY1N0NhUTFlanV2Y1dHVjc0?=
 =?utf-8?B?VmpsNzRxa25OVWppTEJ6MHhac3NLSWRTZjlPU2RHNit5SXRIWWc3VmNQL3Zn?=
 =?utf-8?B?dFNSTzIxZlVhczd1T3pIVUszUkhsZDNRaTFjZDIzTEFqZ28xNW5HRXVMWHQ2?=
 =?utf-8?B?Z3pKUGhrTnZaWTVtRVNrYkxvSUVkS1F4cVV3SWpJU0doLzdSZ2dpdXEwd0Z4?=
 =?utf-8?B?Yi8wUmVrTUpOaUNRSE5udjM5cGRwOGpxMVNDNTZ1NHZZRXRiUkw0TW1QNDhY?=
 =?utf-8?B?V1ByMjMxRDZDcjlDdE8vd2VsRFhTbVpMZ2dleHI5VmVlQzZpYUR4WGRrU0F4?=
 =?utf-8?B?WTB2VEtyc2N1VHozZjBnMWFnVmxoYzVESlhnTDlUK2Z4YjNCT2lHdmRhSnFG?=
 =?utf-8?B?eDdSSTZvMGdQOUV3eUxndVNaaG1MNkRidFdpa2RLMElFcHhiVE9sMS9Yb1FN?=
 =?utf-8?B?R2E4cnEwdzJaU0ZpMWtqamk5cnp2aFZycVJDMzFyWjh5NVIreGcybVZlaVBN?=
 =?utf-8?B?cXhhSlM4ZzhzYVpoSDdtNW1ESVViWUpySERNQ3piYTd3Q1VreC9YQnhEbEJJ?=
 =?utf-8?B?UStIZHp2ckNmY0pKVVFPRTJHK2M0K1Nac3Z0NjJXVFozOENoZGo3Y3dSSzNV?=
 =?utf-8?B?WjlPcDc5TitXbFdaOGpSakJ3VVFGeFZoNVczU3RGZXYwdVhzb1hPT0VYVEFa?=
 =?utf-8?B?Rmd3VzdqcHl2eFZ2ckQzVFR4M2ZSdEYyN2tCc3MzYzlWWUtURzB0SUEyWEgy?=
 =?utf-8?B?SUl3c09QVW5aRzl0bDNrZDZkaW12Qkg1aldhb1lHYTluTGxpRCtJd1MrWTBX?=
 =?utf-8?B?NE1YUm9YZS80ay9IREgxR004VjBnRGVKeVZSNk1DSXFYUnpPWUVGVW83S0ZV?=
 =?utf-8?B?SGErZHZBNytjTlNtRm1mMUdvbjFOSTNJMWg3aFpIelBMY1BNNGhPM0hld0lM?=
 =?utf-8?B?dVlNTlNhU2s5eW83UHp5NC8rMGFMVyt6a2QrSGtFYTEwRXhvOHVheFdvM2Rk?=
 =?utf-8?B?cXpXQ2doSkovQ0h1aDhkbjJXb3ZIbGd5dUdBVWNjT042UFIrMmdGQ3d1eDNv?=
 =?utf-8?B?ODYrM09XcHVvY0VxWXBBbTA5ak9nNXhaaWh5azQzU0x2N053Y3RydVRSVlkr?=
 =?utf-8?B?NXl0ZVVZWjhvWVZOR1JxNzlFUnVqSmJNdEFYNk1adEpXRSttd1lJdDRGbkd5?=
 =?utf-8?B?c2Y0N1pIdVVEQW1aRzJIdjRsVzUrK281TGxBdGlzcnZBa2hIUzhRVWxyZlFK?=
 =?utf-8?B?Zjc4UzZhTVh5Y25pTXZ4Wk5rY3FSa3ZPZE01OGpCYmprMENCOEF5YSs4dzdB?=
 =?utf-8?B?MXBxR2dvVEhMZ2IvbUs1eUgvSE8xMGVzYVF5Y1RHVFZ1Q1Fad2czWnRnUVRu?=
 =?utf-8?B?SWw2NWNxK2xxMkdPUEZjSEhOcHBxUWtlQXR0RUFqaE1BMHBPZFd1ZEJXcGZk?=
 =?utf-8?B?RC9uQVdZVWV6SDBvYlIwR0toNHQyc1hSNHBmNHlIYkhXS2F1SzZ4L2thTzI3?=
 =?utf-8?B?WUllNmJockRKQ29hTzIvYzVyR1R4Wk5VMkdBWGs4dmpPbnVWcHlGOTY4QUhE?=
 =?utf-8?B?SFNJSlNrbWVtd2Zza0VwQnZMMGJYZzZlZ3V4UDQ4S2VNa3EvYmxjbHQ1cEg1?=
 =?utf-8?B?R1BiN200ZGF4cUp2bnFPREtBTzIrQWdreTIyZVRoR3haZFRvVTdjekxENVZ0?=
 =?utf-8?B?SkpNaW9lS200MXo5MDBvZ1VjVjdXc0JIOW9HRjA2NDgxK3IyRUpVU29CMWd6?=
 =?utf-8?B?d2dBWk82dzVYdE5uckRPUm9XQWQ5dDJFN2FZWU0xQkEwVXFObDVTVkl4YVpL?=
 =?utf-8?B?MTJpNjdTUFZmZndtaU1NZmhIaENSNzIzdmVhT01YZ2ZLSUt5NzZRQkE3dFp3?=
 =?utf-8?B?NkRpQUlpdXo0MjFLWlVKcndmWnVaV09RWWhRcDBLMi9QWVQvTmFsYmlIbXBT?=
 =?utf-8?Q?AVjlHC3ZFS9qXAwwfEapr+o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d571c4b-e78c-4e85-368e-08da010065b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 12:37:24.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydu4aqeMsOxIZv/TafMfAGj/ZalXOTLcUDAuROaxPmdh8copGslaBzJctuP7X1mF3KARSXlz+Q693y/L4IhrGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5988
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 11:46:20AM +0100, Jan Beulich wrote:
> On 08.03.2022 10:05, Roger Pau Monné wrote:
> > On Tue, Mar 08, 2022 at 09:31:34AM +0100, Jan Beulich wrote:
> >> On 07.03.2022 17:37, Roger Pau Monne wrote:
> >>> Map the PBA in order to access it from the MSI-X read and write
> >>> handlers. Note that previously the handlers would pass the physical
> >>> host address into the {read,write}{l,q} handlers, which is wrong as
> >>> those expect a linear address.
> >>>
> >>> Map the PBA using ioremap when the first access is performed. Note
> >>> that 32bit arches might want to abstract the call to ioremap into a
> >>> vPCI arch handler, so they can use a fixmap range to map the PBA.
> >>>
> >>> Reported-by: Jan Beulich <jbeulich@suse.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >>> Cc: Alex Olson <this.is.a0lson@gmail.com>
> >>
> >> I'll wait a little with committing, in the hope for Alex to re-provide
> >> a Tested-by.
> >>
> >>> --- a/xen/drivers/vpci/msix.c
> >>> +++ b/xen/drivers/vpci/msix.c
> >>> @@ -182,6 +182,38 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >>>  }
> >>>  
> >>> +static void __iomem *get_pba(struct vpci *vpci)
> >>> +{
> >>> +    struct vpci_msix *msix = vpci->msix;
> >>> +    /*
> >>> +     * PBA will only be unmapped when the device is deassigned, so access it
> >>> +     * without holding the vpci lock.
> >>> +     */
> >>> +    void __iomem *pba = read_atomic(&msix->pba);
> >>> +
> >>> +    if ( likely(pba) )
> >>> +        return pba;
> >>> +
> >>> +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> >>> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> >>> +    if ( !pba )
> >>> +        return read_atomic(&msix->pba);
> >>> +
> >>> +    spin_lock(&vpci->lock);
> >>> +    if ( !msix->pba )
> >>> +    {
> >>> +        write_atomic(&msix->pba, pba);
> >>> +        spin_unlock(&vpci->lock);
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        spin_unlock(&vpci->lock);
> >>> +        iounmap(pba);
> >>> +    }
> >>
> >> TBH I had been hoping for just a single spin_unlock(), but you're
> >> the maintainer of this code ...
> > 
> > Would you prefer something like:
> > 
> > spin_lock(&vpci->lock);
> > if ( !msix->pba )
> >     write_atomic(&msix->pba, pba);
> > spin_unlock(&vpci->lock);
> > 
> > if ( read_atomic(&msix->pba) != pba )
> >     iounmap(pba);
> 
> This or (to avoid the re-read)
> 
>     spin_lock(&vpci->lock);
>     if ( !msix->pba )
>     {
>         write_atomic(&msix->pba, pba);
>         pba = NULL;
>     }
>     spin_unlock(&vpci->lock);
> 
>     if ( pba )
>         iounmap(pba);
> 
> Iirc we have similar constructs elsewhere in a few places.

I don't really have a strong opinion. I agree the duplicated
spin_unlock() call is not nice, but I think the logic is easier to
follow by using a single if ... else ... section.

Feel free to adjust at commit, or else I can resend if you prefer.

Thanks, Roger.

