Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20C564FAD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359921.589199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HNC-0002CG-Cy; Mon, 04 Jul 2022 08:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359921.589199; Mon, 04 Jul 2022 08:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HNC-00029l-9L; Mon, 04 Jul 2022 08:24:02 +0000
Received: by outflank-mailman (input) for mailman id 359921;
 Mon, 04 Jul 2022 08:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Xk=XJ=citrix.com=prvs=1776e108b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o8HN9-00029f-QE
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:24:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a28e6b7e-fb72-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 10:23:56 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2022 04:23:37 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5813.namprd03.prod.outlook.com (2603:10b6:510:35::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 08:23:35 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 08:23:34 +0000
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
X-Inumbo-ID: a28e6b7e-fb72-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656923036;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8IF8fqekkbkFiiRDiFhmHjgxhiflV4BmZVZmQy7k55w=;
  b=ewv310XnaSmUPxp31w4FqyU3mx6P0mL6habAKfwAf3ardCumRYKhHTqQ
   we93hGdcbNhVnrgALuCme2mFpw0GFovKk93kUBOuKfOUJefg7RcdLIWb7
   /R3KPysQ0sNCk7wlwdRE0RZAT87TZKkJCPZOPwYtL5KCzwPxsDjeepTUG
   Q=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 75044534
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wQvZh67k6zA28OAaJsoSbQxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mFNDGiBMq2ONGf3KIp0at61oUIG7ZHUmN43TQtt+SA9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YfhWFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS+EFkJZq+Lo9gcVgAIDD1cZr0Bu7rIdC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAhF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IF8A7J+PFri4TV5CBMwJvuNMX1RvitZspWnmzGq
 kf83HusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/R/FyfD21dFjpZMoV+7IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLT8ZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:xHvVpKMLqi5Be8BcT1r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNOqWs19
 60TJiAq4s+PvP+TZgNcNvpEvHHfVDlcFbrDF+4B2jBOeUuB0/twqSHk4ndotvaM6A18A==
X-IronPort-AV: E=Sophos;i="5.92,243,1650945600"; 
   d="scan'208";a="75044534"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNMOQApej7dkOtkDrh5bHMlLFxsGgDkCa22Sa3meiJ1OBVLX+FG4i/ch7LcgGFKh3uCxaMYx1g2uvoqCTqvr45KJEG7qw7pHRj4HsAFxWCEYifY0A4kAKKoilBSVxG3Igzm3kSnVuaQN0S+AjIJcEyEVQwy62oGk8pcgd5F5CEujxewAjvY0bNcj0bQ16iPbhZ81rLQLMNVQtTDzVlImfproxNU2Z8m5Qw38lTdt1GonB9w3dsh0vLhzeaKYQk0X8gIYhAX/tzJkwjhAd36TOCnVp+ZrUH7emcZ4L7EqXB+X98F9hkjtWceG05yGrKfoNuVmRsDVmsaBjdYi3UDV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR6PunM16LDtcYjrwHaa2RbE3HRjrEamFKKGsQk/vKY=;
 b=GPRm7hziKb7UTYo2KXfFbUl+L1z7+J1kALU8LyUrjpQp+hQxTxG9y8qU2HD+dl8AzFDa9cdmMoLTExBZLiNJUew/uLzObI5OUwYHmYXxCj6eEMMvnUX5qsUgHnvZJGolN2sGZ94bo+FOTbR44dB5ytp2JECtYdTXIClF1znQlM3NM9vQcdvOKHmyBTxlMWWZkY/4nc4scN2mbjToM3CNuWS6nVm1Wji6rBjb4Lel7lzppD0Hw2BNhc19exbfX72b9wD5KNCRRRPEe4jzTe2ls6xo3PWQ4KbZrimN7fHfIO0KgFCX8RA5YC8tX5iu0pdidCIprBNvvnLn+N3y6GB+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR6PunM16LDtcYjrwHaa2RbE3HRjrEamFKKGsQk/vKY=;
 b=ukkDRlPp01eWpoDv1X0tBhl8TvsEP+F5/I2Wsys+xIcQItaj+4gwhxmNELwfZSnFu4VclI4txahGOQ5AEJLN6fby06nIQhn+CiWuogSEV/Nb/st1HGFhJWxI7M1ABGIQ71lz7wxwr0Z7INvdn5J2LzwRBB3bU1EFpKuzVGzQufU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 4 Jul 2022 10:23:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] x86/lbr: enable hypervisor LER with arch LBR
Message-ID: <YsKjhksEsLDs80Zv@MacBook-Air-de-Roger.local>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-3-roger.pau@citrix.com>
 <4a193fd4-deb3-12c3-2faf-eed33e7b52af@suse.com>
 <Yr8VH8EUahBV0p7B@MacBook-Air-de-Roger.local>
 <9db996bc-cdeb-37ce-9e98-ca199d42a494@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9db996bc-cdeb-37ce-9e98-ca199d42a494@suse.com>
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 660467d2-7828-44bf-0083-08da5d967cd5
X-MS-TrafficTypeDiagnostic: PH0PR03MB5813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3LR4ZefSOKNuCP/IUYjO5CV0GfortFaBbEmh3Vv8fZ8nvWz+kE2YN2fpEaWynzEjiCGEqLx6lUmete5ZsLxmqFl3DP82LsTZTEVTUNvHKwAIEEYWvL3UTqJIFMTxoI12VKYvsOoryJyHC/PcmbpdTxRZQJ3RyWSSkOhO7FILq8Fnw2iqtAaU0z3GFqbS3QfkY8MtE8oLG/G8t90cqB79AX8R67TYTbUZsM3eCEkJktcn6GNtE+s0pJRG0hSH+mpkYfi4AXqn3gyW8mgJKz5uxu9o5EzvQyxpQzQYhxxqiKKqxR+1m/UYfYK6axrvPmKcnJ9Qov4uAS6f7VCHBQ0pNQNDkLSBBC7eGXnOmOizMa0d3CUxmxs3XZH+jRIngaLQapcfYb/IJ4ASiwSaLFRWjJV7ng2xTSGyeQq2NNz7QAh8GPeXyjRSnpmradgTgV7f0sqeK8q0pj5hcklnJZsrjJh92s4rfdwaK211YroLRjveeAGE9Slc4NE1iF/xKYkffGLudlGWXiAeGVEQvc7yjTnSWiGwYj/W4ym9cItdcMs55lFuVnnKl4OzbQU866uevYxldaa7azWVsfVbmDmXBaoSz3fY3RNKp/xp7SEE4bF0q8aTZyxW3oP8NJUF2ZxRoWnY0bpL5wZUnGOAYOv1jkNQkZI8pp4GLjz1V19FduJAXxN2kOUTVdnav/zvXWJab4NWihOSe1U61qT6u2znED0qqlXU4S5Nul2s+I8UPZMHHj28luXqmWxswSOSKiBURxJjEfABecqbgc9qjh/EnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(4326008)(316002)(53546011)(8676002)(8936002)(5660300002)(66476007)(66556008)(38100700002)(6916009)(66946007)(82960400001)(41300700001)(86362001)(6486002)(478600001)(6506007)(54906003)(6512007)(9686003)(2906002)(26005)(85182001)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2ZVRFd3U0NZbThoK1pXTENXZzFVTlN1QWVBcmpBa0ZSZ1prZ2dBbUlWbkN2?=
 =?utf-8?B?VEVBYjlsaVplUjRxWmNlVEFoZVFrZGs0UjhBc2NVcXA4U3UvRUdtdGI4bmt6?=
 =?utf-8?B?VVBvYmh0STZSa05seEJIQ1BOVXlNUkFpc2Z4bWt0NGt5WUxwV0NEU3BKZTlL?=
 =?utf-8?B?bkpjKzUxWThKUFNEMk5wNjJrank3aXF6VDFZbTEranBIQVRUeURHYTliMkgz?=
 =?utf-8?B?OWFyUlNwVmMxam9XWURxYzRoNkRQcmVhTXRrQmxFaDVtUUZvNzFVUU1CL3B4?=
 =?utf-8?B?V3NmNFRSVVJkb1VkTzcyVGRZU3ozMUJOaVN3TmVqa2p6NFBubkdUV1lZT3dI?=
 =?utf-8?B?ZWZlUDJsdVFKaU44KzlnbG53b1E5VXd2Mjg3RUNOZVU5aDJXWHRPSTJEUlMw?=
 =?utf-8?B?dDZQUkdxL1hVb1dUYnQzQkVhNnEwM0lXV0FvVGxzbDlsSnY3eENRdmlsM0FV?=
 =?utf-8?B?VEU3RzVFaWpTMmlXRW91VlRpQWQwak9ITE1ISmk2bGhZQ2M3d2hIdk1kK0hH?=
 =?utf-8?B?WWk1TGo4eU1mOTRlR3JMaURUNGZuZ2c0VUFZQWtHa1JtVTZSWUpwTUdqLzdW?=
 =?utf-8?B?eTRGWS9GTGNoN1IyTS8xSXZXa0dwZHZ6dlU1VjNyUXlNcklMR0xNRXNxakhM?=
 =?utf-8?B?ZkgvMUpBK05hN1Y4cVNtSUJQVnFZZ3pQbWdvcW43cWUwL3BnMlpQcFlEYWFk?=
 =?utf-8?B?UCtNZ3V4QVBPZytRN0JUeXdUU0xsTElHRnFBczEvallzbWtyemRRMGFzRzl5?=
 =?utf-8?B?bitSdFhKYUh2NUZTRkhJVm51QnA2b2tZZ2JrR1BZQnV1S00zZHlaNVdPWU5t?=
 =?utf-8?B?cTVaN3RlNDQ2ZVM5OE5GWGhxK0JQbFlmc0lWTEVKYnJjdm1Ybml1OUdrS2x3?=
 =?utf-8?B?SkJCVmFOU245M1doMEUvWG5uVzJ1d2t2NDZqV3EybWtRZU14M2EwdCs2UFRX?=
 =?utf-8?B?VnJhQStteG1wbzN6N1NyNHAyWHprRGFNZnJVcm92UGNTMGRpUzlROFJHNUJz?=
 =?utf-8?B?aSs2OVFJSHhSRDI2d0ZaY0Y0TnBPckp5RXp6QWJMQVNoZktPZGtrem5Wb2sy?=
 =?utf-8?B?bTcwNE0yZlFNaUtUZTJuZExiQThrRWdqbnEyM0Ntb0hHTEw5aTIvWXJObGV0?=
 =?utf-8?B?bThxSVpweHlsUVZMR3haUnRjL0p4YW5xUVoyUmMwUkxISWQwNzdtV0s1K0lB?=
 =?utf-8?B?UXVlWmRxcjYvMU43dDFZZjA5VnJTd2hpY0laaGV0T3RXR1ZpNmlydHJLQ3lY?=
 =?utf-8?B?ZlFQcndhYTRoRE42NWxTcXBselJ6Q3pCRGh0NGZJQVZVTUFoMFFPeThMTEVx?=
 =?utf-8?B?N2w1U3d6amxjMTVqUU5sQXlXZXlUVnYwSjhIK3IvMWt0M3ZWRUlNSS9jSjA3?=
 =?utf-8?B?WWxtNndwVWtnR0hxdW5yN1BJVEx2eTFLbk90QXlIandnbHpRWG9TeFQvZUNB?=
 =?utf-8?B?T052WkJ5czc0SWhGQ1JVRnMzSGMzSlc5bHYrTERWZEIvdDV6ZGc5bDl4L2Nr?=
 =?utf-8?B?b29MdDNYeklHOHc4R3RtMENFcWJtdk8vK0NxM2xONEtCQTA3V1VLRjAwcVpQ?=
 =?utf-8?B?RnRVTVFqM0V1R2lYeGMxei9KWTVZOTJxYVZveFJNc0RJcmQvYkVLdTJ5MkxB?=
 =?utf-8?B?cWlvU21kdVpuRlBDbUpWekJpR2greHBZSWVQdlFOeUN3eU5EOEFvNk04OTVB?=
 =?utf-8?B?eDJPTjNmMWZxR2hkYUFPUXNCczM2Q2R5a2ROK3MxVlR1NmZQZS9PbFdJc2lv?=
 =?utf-8?B?dStQeG5GME5vTzNKUzZnRVV2c3RtaGlxMGVGU3k2bHFRa0pncGdCSy9xRjdh?=
 =?utf-8?B?Z0YzRVNXbGc0NS9qRkNRMG4wU3IvZndhYTRFaW85NjFSSDdTSDVENUtPY01i?=
 =?utf-8?B?VTIvU1czN0lzT3EzUHZsRkFuMVlOWjd2cnBrV2pQWU1nV1d0WlBvcFMzRERM?=
 =?utf-8?B?QUVITWhGbUFCaEtvdlBrTkNsUklEYy9Cbk5yUVVNaU5TVWNqMGpSSFM2R3hr?=
 =?utf-8?B?WUFSTDVya1hrYSt2NnFFRWdmRkg4VkZ1ZlBiN0VJL3lqV2Jlemw1UUNnWU9Y?=
 =?utf-8?B?SmNTWGR2RUNFRE11eFhZNkRWcG1LUmNJUysxV04rYWZiZG8vdUVRQkFYZXZa?=
 =?utf-8?Q?C5yHSO2f53gqt+IzeAtyyCTTc?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660467d2-7828-44bf-0083-08da5d967cd5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 08:23:34.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eW5n4foToQsiCzzKmKKlSSmP3psdkiDCqXnRn5zlNi6NhEs4/wXs9nkSwlaaconOuR9BwyKcg/rr5FfpHich0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5813

On Mon, Jul 04, 2022 at 08:15:15AM +0200, Jan Beulich wrote:
> On 01.07.2022 17:39, Roger Pau Monné wrote:
> > On Mon, May 30, 2022 at 05:31:18PM +0200, Jan Beulich wrote:
> >> On 20.05.2022 15:37, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/msr-index.h
> >>> +++ b/xen/arch/x86/include/asm/msr-index.h
> >>> @@ -139,6 +139,24 @@
> >>>  #define  PASID_PASID_MASK                   0x000fffff
> >>>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
> >>>  
> >>> +#define MSR_ARCH_LBR_CTL                    0x000014ce
> >>> +#define  ARCH_LBR_CTL_LBREN                 (_AC(1, ULL) <<  0)
> >>> +#define  ARCH_LBR_CTL_OS                    (_AC(1, ULL) <<  1)
> >>
> >> Bits 2 and 3 also have meaning (USR and CALL_STACK) according to
> >> ISE version 44. If it was intentional that you omitted those
> >> (perhaps you intended to add only the bits you actually use right
> >> away), it would have been nice if you said so in the description.
> > 
> > Yes, I've only added the bits used.  I could add all if that's better.
> 
> Personally I'd slightly prefer if you added all. But if you don't, which
> is also okay, please make this explicit in the description.
> 
> >>> --- a/xen/arch/x86/traps.c
> >>> +++ b/xen/arch/x86/traps.c
> >>> @@ -1963,6 +1963,29 @@ void do_device_not_available(struct cpu_user_regs *regs)
> >>>  #endif
> >>>  }
> >>>  
> >>> +static bool enable_lbr(void)
> >>> +{
> >>> +    uint64_t debugctl;
> >>> +
> >>> +    wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> >>> +    rdmsrl(MSR_IA32_DEBUGCTLMSR, debugctl);
> >>> +    if ( !(debugctl & IA32_DEBUGCTLMSR_LBR) )
> >>> +    {
> >>> +        /*
> >>> +         * CPUs with no model-specific LBRs always return DEBUGCTLMSR.LBR
> >>> +         * == 0, attempt to set arch LBR if available.
> >>> +         */
> >>> +        if ( !boot_cpu_has(X86_FEATURE_ARCH_LBR) )
> >>> +            return false;
> >>> +
> >>> +        /* Note that LASTINT{FROMIP,TOIP} matches LER_{FROM_IP,TO_IP} */
> >>> +        wrmsrl(MSR_ARCH_LBR_CTL, ARCH_LBR_CTL_LBREN | ARCH_LBR_CTL_OS |
> >>> +                                 ARCH_LBR_CTL_RECORD_ALL);
> >>> +    }
> >>> +
> >>> +    return true;
> >>> +}
> >>
> >> Would it make sense to try architectural LBRs first?
> > 
> > I didn't want to change behavior for existing platforms that have
> > both architectural and model specific LBRs.
> 
> Are there such platforms? While it may not be said explicitly, so far
> I took it that the LBR format indicator being 0x3f was connected to
> arch LBR being available.

IIRC Ice Lake has both model-specific and architectural LBRs.

While format being 0x3f could indicate the likely presence of arch
LBRs, the CPUID bit need to be checked.

> >> As there's no good place to ask the VMX-related question, it needs to
> >> go here: Aiui with this patch in place VMX guests will be run with
> >> Xen's choice of LBR_CTL. That's different from DebugCtl, which - being
> >> part of the VMCS - would be loaded by the CPU. Such a difference, if
> >> intended, would imo again want pointing out in the description.
> > 
> > LBR_CTL will only be set by Xen when the CPU only supports
> > architectural LBRs (no model specific LBR support at all), and in that
> > case LBR support won't be exposed to guests, as the ARCH_LBR CPUID is
> > not exposed, neither are guests allowed access to ARCH_LBR_CTL.
> > 
> > Note that in such scenario also setting DebugCtl.LBR has not effect, as
> > there's no model specific LBR support, and the hardware will just
> > ignore the bit.  Also none of the LBR MSRs are exposed to guests
> > either.
> 
> My question wasn't about guest support, but about us (perhaps mistakenly)
> running guest code with the Xen setting in place. It cannot be excluded
> that running with LBR enabled has a performance impact, after all.

It's possible.  'ler' option already states that it should be used for
debugging purposes only, so I think it's fine if this results in
slower guest performance, as it's not a general purpose option after
all.

Thanks, Roger.

