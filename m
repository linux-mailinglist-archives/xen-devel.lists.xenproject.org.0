Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C64BF4E3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276605.472817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRen-00086A-3U; Tue, 22 Feb 2022 09:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276605.472817; Tue, 22 Feb 2022 09:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRem-00084F-V6; Tue, 22 Feb 2022 09:40:28 +0000
Received: by outflank-mailman (input) for mailman id 276605;
 Tue, 22 Feb 2022 09:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CiU=TF=citrix.com=prvs=045c9559e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nMRel-000849-In
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:40:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7587a318-93c3-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 10:40:25 +0100 (CET)
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
X-Inumbo-ID: 7587a318-93c3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645522825;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6RHXfly5ARCcz3pjskSyCuwuoNYg+47abYSQdeN9YPI=;
  b=dVBKLJ2FSHqlZgycqs6/pdbkH0FBzL68IWanV6aVPxR2+6ijCyWNO1AD
   bDY3W90MFlrZyTVtioqV438z7B54+jCPjeD0ruLTAzJY3mGnNb5MQokGe
   /AAgwKE4Hm2qqt+Mtjl194Ggs36Y9Kh0oUSV7IL13kPFM+NOhc1nJOE0a
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64707532
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BJD/I6OplIR9GBTvrR2yl8FynXyQoLVcMsEvi/4bfWQNrUp2hGcCy
 mROWTiPbv3eNGX9fYwnb4q3/R4C7JaHm4RiHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2NQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 upH7pObdwIVPbScuuVCdxxoMT45FPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmtv3p8TRqy2i
 8wxRhd3fiTjIDh2OmwFFc15w935gWiiSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaugRRHVPFuFtE58VGvy/Xw5ja7GS8tG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzCJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id0MvmAjeR01a55sldrVj
 Kn741g5CHh7ZibCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikUsHC7SmOnGNmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:Zd76H6OP7uaA7MBcTyX155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80kqQFnbX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YeT0EcMqyBMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQnjuRYTzra3GeKjM2YqbQQ/
 Gnl7R6TnebCD8qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPof2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7vvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wA9HdwGOt15Dt
 //Q9ZVfYF1P7wrhJ1GdZI8qOuMeyXwqEH3QSqvyWqOLtByB5uKke+x3IkI
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64707532"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOCtQeYEQ3DcsaTTpnrU1LOSxmWmAnWpaZKyCtJfkcxwGT38syjgFsITKs9dWVf82NxzorfRXuaG4Ck0xb2vxJYIm57+AGEuhCPwl32sSbtqRVgPQM8ox8LbMJXJgGtxz9VDUiLT+pzjSm+dn/xQ1c/M9wGIc9p3rpbPMJ7aHd2RS63gCqZjnF1Znvn3zPcpd4e9WcoNI09tG+NZDRBQpJPzM9sCsbR+VD60+hbaWe4P42MN5S4/uzDyLNN9v0NpsO1Nn0xVBH+WdQ4tHnhoeDXGLp3vFM96P4KAMb4lp+0Vnnm7liaaqHnvhyuOAu/F1mjn1nnRCf+/TjcUW+ZfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gS7/inIPKvQqZhZqlMazaIgUzDQJBDKHdhDYzlWVE6M=;
 b=ZudpLpowN8PrX3kK3BVU76u+c8R0wUA7NSxETxCvkLmLyRyualdR44jw68p5bJdGxcpX8BPOoy//1ri0g07aIW47n09iGM8DIZLE4QTAfaaf0QrrjApy4kaocKNt7jo9i1msfl2oWp60DS/kA6Cxv0AGi8KUOsAY/kYSih2PaVnY+/T0C/+zH04n5LQSSrcCFbWhH+TzVevrLDc+olPia/1jQFhmjUqY4FfE1ixg6ZymeMnAeMOHEWqwAxyKr97g4M1+f5ma0UfrJm5MaVPUX+LFr1Iv8rrcRxqjZD/k+fPwOgWFjA/f/VRoD+US46DxPbF3vBg1l5KcyDpZFfA4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gS7/inIPKvQqZhZqlMazaIgUzDQJBDKHdhDYzlWVE6M=;
 b=XvIQUlLy1M0AlhXPgw6CG1pGeOy0wL/uX8bfm/vBrYqAP7xRdVWoH7mEctoiGamzkZBXLDZC886swKzKuUF/BxUWk1pSvANFU6iAqKLFjg7L433wRr5UgNWEfhAu6CRU3uh3Z3p8H5CzBpuTGzyFMpqgvqL887Svm8Nhs1ckHbA=
Date: Tue, 22 Feb 2022 10:40:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] x86/perfc: fold HVM's VM-exit counter arrays
Message-ID: <YhSveDsp+3NW3hYX@Air-de-Roger>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
 <6a2a47af-4ae1-2fe9-1190-e15b6ce742e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a2a47af-4ae1-2fe9-1190-e15b6ce742e6@suse.com>
X-ClientProxiedBy: LO2P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f23efa4-2fbb-4bbb-a867-08d9f5e752f8
X-MS-TrafficTypeDiagnostic: MN2PR03MB5040:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB50405DF6FE7231B1CBAEC30A8F3B9@MN2PR03MB5040.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4IJIvi5sua7kXFH7RS6aYhsI8qwSpHnlfafPUIETbBHFY8y3y9F1aGBxek21JiHIwiqiVUBJGMjNytKsCiHAVwVRyezO+Si5BmGeApM+YwTuznIfNhvgDzxOVkcRG378OyhRpsqZcUDIl4K5yHZwtP+KRSzPTN55SVwg/znUpyQMzYuxPM796iSlll81WlBudrK+ilL20wXbdG5Leosp3vUUlN5rXNVi499YoUN7mX9RYN7xuaOdQ+sPVW0xt4uNpdHIrcSm2+9F/GC/TFuQdS1ojJcLBMiwTcaDGvP8oHPdzZydzmgknz6zfz6wDwJkLcg6OfPuMG0zlNqft/XAkJ5lDyxMaXyjffI630qERxhBE6BFIulqchi41MRPL0IP/+faMN01wZcMcG3Dnx+2vZ+6KEB1fceoetD7wTtQvBehCEfdNOoYcC18GheAh0UVwvtKsXFpxSbfZqCiPyWlGu8nbJ26sbcF5jNOvzDhcYhaBlpA6iIUIGHnDwqFBeiq55sXdBNIfvBOA2suRQEbkx9dhOq5AhHUWMT50Y1vQEwpI+3BRiwZgyLzSvYy7jd3QDQ+u1CGjI0qngKH3P5K1K4nqJv3rleajbboyhd3L+1wBu3BT71iH+f94GwuOC6tGNhDrd1eCBgGEtfzEvyFcfJWqfMxuAJLIdSvBE/AwF1Wp10DHqPC3E3z0IYY/2kvgK6DyuKvu6Aehy8psZSKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(26005)(66946007)(6512007)(9686003)(66556008)(6506007)(6486002)(6666004)(33716001)(86362001)(54906003)(66476007)(508600001)(316002)(6916009)(82960400001)(8676002)(83380400001)(4326008)(38100700002)(5660300002)(85182001)(8936002)(2906002)(4744005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em9UUFJmOCs1TW5aN09TajNTRVNqMmFNcmRxVWdvbUQxTTZVWkwyTVA5N21y?=
 =?utf-8?B?bjBWQ2dmTmcxOUZLb0JlN1IzK3JqK1BhTnRPajNSWXo5a2MrOVE2dDBjYzEv?=
 =?utf-8?B?enQvSXpxbWdvdlpHUkpBakw1eU4vTFpxZHhPdm5lcThUdjl4aTArN2l0ajVz?=
 =?utf-8?B?S3NHeGY4cnE1WjI0ZkxJTTd1OFFVSlZGTHF4bVk5UjFKK2R0Qm9ScU5qQVRh?=
 =?utf-8?B?S0NpaVJqSHVNUEdYQjhzMHhiRDN1L1N4eFV6aERrTlRzL2JNRWJoalJKcys2?=
 =?utf-8?B?ckk2bFp1bW5CdUhmN3ltNFNodXhWeWxpTy9oZlltUjd6S1hnL1ZDeDNGRUdU?=
 =?utf-8?B?ck55Zi9laDJCYVlKZmpCaVFVam9wdEp3aU5GM2JBUk9QanozMkpwWnZnbVRT?=
 =?utf-8?B?MmUwY1pDOW9Wa2JpbytEbTZYWDNGL3cwOWI2SmRSSHJMYUNxN2c3TFA0b3B6?=
 =?utf-8?B?SWVkVzJuVEpPQlduMUtwTjV0dGtvUnk5TkJ2eG1yTDlBVjVjazA0NWpHVzdX?=
 =?utf-8?B?bzV6WXdoTW5jc0RLN1lZRU5SYk9kQWRMZzRVVnA4c1pHY0F3aEZaQllNNVJu?=
 =?utf-8?B?WjhIZEZIUGJRZlM5bXRNQ240dTAxTWFad2dTWWkzUURzbmU0NTFNb2xtUWxq?=
 =?utf-8?B?VlZnbFQrY3BYZzBHNnVBQWo1UjhmSmtyWXVxZC9tSitqb2xTSmdyMngzeGU1?=
 =?utf-8?B?NWZkYnUvU3lSb2hOYTJQMHR1UDVjM3E4eFNCK0tkUTBONTRwdXJXWnVaaGJq?=
 =?utf-8?B?dWVpbmxSSzFxQTdCbk8zU2U5OWlqS0xZNEQzMlZmWmtueDlGUXJ2YUs3b3pK?=
 =?utf-8?B?cCt1dEs5MlFtTjBBc3FFRTMzb0QvOE1OZXpJamxEajIyQWcwZGpvYTJIcWNH?=
 =?utf-8?B?Nk44aEQ0UWNnb3N5NUUwVnZvWmc5TDhxUkFnVkFzTEdpVlFZeXJjbVNYUVlH?=
 =?utf-8?B?YlYrb2h0d0RUWlovZ2Q2OEk4QTJId0dRRzBsWUNsaUJkdHNoUUYvRU43R1RT?=
 =?utf-8?B?eFl1UzhFTzFsZVdJckYxbmV4V0puaGRWWUJPSVBBQnBpWjZjQ1lXc0x4cGlF?=
 =?utf-8?B?eTFsSlZMcGVrMXFaQTI1bXZSMS9nUGlnNWdSYi9PcEhOYzMxVjJMNWhlOW1y?=
 =?utf-8?B?SXJJOXRoZmhvNWtzQVdoMTVQcHk5QUdqek5WZVNuekNuaGxtcTFGQjNkWFMw?=
 =?utf-8?B?RlBlekNacXdtMnlUN1dCbzRTZmg5VGI1eGhYcDR5RjhDMWpyQ0xjOGVtSTRj?=
 =?utf-8?B?YjRJY2I4ZGFHWmZWdjRKdTZmZVJWd3JrZndtSm9Ba1hyMTJpc1U4QlgyQkJp?=
 =?utf-8?B?d05WNXBtK3lFV0NQLytpdW1zRTR3eFVqVmdNVnR0ejlhRG5GSS9XbkpnNXpT?=
 =?utf-8?B?M3BnOTBBTm16RWdWdm5ncCsvdXhRcHdkRHo2K3ErUjczaU1pU0svNGVGRWNn?=
 =?utf-8?B?SlRCUGtWZ0RXZUFjdFZ1Q2NuNUJrdURCQmNkZ1pSYzV4M0kxUlBwdlArWDBq?=
 =?utf-8?B?S1NQTldIT1RyazNrd20rNkRjNWVhUzNDTzlwalIxREM3NTFDVktnRXlBQlNp?=
 =?utf-8?B?Vy9LT3l3dDkyWXkvZjh1Y1l2dWZrME1ET0NZMnpOTzdSMk53TVN1d3FvOU1X?=
 =?utf-8?B?QXJFcSt3cmMwL0prUjd1eDgwL1p4c3F5TUIzeDlzRnlqMUtuZ3BvYTBGbTcr?=
 =?utf-8?B?UEh6Z2p1dEVJeFF0UlU1WmFHcWR1blNaK0trV3R0RTQ0T0NjWG54TVdYdEMx?=
 =?utf-8?B?cFB3ZjhocVZOYlY3YVhkYkw2UGcxUHR3MU96TmtGT2tIeTlKRkpjVER3ZTRO?=
 =?utf-8?B?a21SRWoxRmRhUGZoTE1MSlZjNU1YV2tWSm9ZcENtQ1d0Sjl3a0Y4bFh5TDBs?=
 =?utf-8?B?Y0xWQWkreHBEMURGZVhpaFN6bHJsYlVQa3g5ZSttcEtsL2tpL0MwOUNMMmM4?=
 =?utf-8?B?UlBhem1oN3JBZFgyZUZtVmNvRnBDcVl0MzZaZXJoTS9MUGdwVUg5WDAyUVlz?=
 =?utf-8?B?b01ST1Q2OHp6QjRzWUNtQVZoc1BNN2xEUk1TVG8rRjZzVEtGVFhEdDdyV0s2?=
 =?utf-8?B?d2hmZU1pZkw3T0Q4UldiS3NWNHR1TDZ3UTVxWEV3UWhadysvUklydGRvTHhE?=
 =?utf-8?B?VFN5VVplKzB3bmVhZ2hMTTVtQWIzazZhRHBKZG91S1N6QkR1T2EzTk16M1cz?=
 =?utf-8?Q?VaW5AjsFvB95SHQoFxKruP0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f23efa4-2fbb-4bbb-a867-08d9f5e752f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:40:12.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m++SaKh4IJ+KZxFDUx4C4PDydchh6Gsw2+kw6o8QsDIIgoymruRBXmo7ZE+xFFnegddx8b6HRKmXrTDPty4P+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5040
X-OriginatorOrg: citrix.com

On Wed, Jan 05, 2022 at 02:59:03PM +0100, Jan Beulich wrote:
> Only one of them can be in use at a time, so make the whole set union-
> like. While doing the rename in SVM code, combine the two perf_incra(),
> generalizing the range upwards of VMEXIT_NPF.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: New.
> 
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2644,7 +2644,10 @@ void svm_vmexit_handler(struct cpu_user_
>          goto out;
>      }
>  
> -    perfc_incra(svmexits, exit_reason);
> +    perfc_incra(vmexits,
> +                exit_reason < VMEXIT_NPF
> +                ? exit_reason
> +                : exit_reason - VMEXIT_NPF + VMEXIT_NPF_PERFC);

Should we assert that the index used here < SVM_PERF_EXIT_REASON_SIZE?

Just so that adding new exit reasons without increasing
SVM_PERF_EXIT_REASON_SIZE is not likely to go unnoticed?

Thanks, Roger.

