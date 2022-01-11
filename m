Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390B48ACDF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255701.438231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FZS-0003BM-T2; Tue, 11 Jan 2022 11:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255701.438231; Tue, 11 Jan 2022 11:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FZS-00038d-Pq; Tue, 11 Jan 2022 11:44:10 +0000
Received: by outflank-mailman (input) for mailman id 255701;
 Tue, 11 Jan 2022 11:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7FZS-00038H-0L
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:44:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c83903a6-72d3-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 12:44:07 +0100 (CET)
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
X-Inumbo-ID: c83903a6-72d3-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641901448;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=swTiBcew5f1ZQCIe2OMHSkt97flWlMQ40y4znYp0LCo=;
  b=BTnngSTk1lxNC8OCT3pbZC0R5r0rGxSRigaaX3vZBbfjls0C/Lo9a9YI
   z+FAoIDPSg2lnI3fgbcc0LHQLwVAXH2jRbXe3MeQK5VPL2Lh/Roz4bYY4
   27dofnyIdDSjHrdEB5AuG/S79Nz75Ij2R9o1fIXD/adhirjNHPNFs/BGc
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: X45VAQLh80GIkcZqHvJEx6ALdKDu2Uh1jg1S+ek1tY/XtXvabXUN7hG6hntAScw7fQokfUypKO
 xzQMwpcXoOsbm4Aqr+wZfj/GNv5JFkm3iI7vWjtzdp+J1DkygktX+jE6d7e4q28XqM0BXnimJD
 gFQecBnUZ9WGm7B4bq+HnWIeV4yhMvXQ8Tp5zt9QnWtMXZYA3mZVUsYwojCR0UQMMkKI4CQk9J
 i3dTIwY+b0ey+6Boj5T1kuQ0GdIsVnmhc9PhNuBDG+btDQcBVZQ/faI7BjbBJrNRgRbH+roZ1s
 4R2t8ehgorErR0pxBESTTwJy
X-SBRS: 5.2
X-MesageID: 63848711
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:820zeau8jLumMRGizQWGzFb5HefnVNtZMUV32f8akzHdYApBsoF/q
 tZmKTrXOK7YajShedAnPYq+9hhQuJSGzII1QAJk+yo8EH4X+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx2IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliJWMVh8AZff3t/UMTRVoC3whN41bweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JseQaaBP
 pNxhTxHaj+fcj4MMG8sB8w6s8aRmGmjQyADtwfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7Fxk+RVa95/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdxynolaUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BODVTr6W8Eiim2aaFsz+CIXVKJ08fXHpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3oBZPmqgKsVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i8BqyMN4sWOcUpHONiwM2ITRTLt4wKuBJ9+ZzTx
 L/BKZr8ZZrkIfkPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilksDOMWjPHi/2dNDfDgicClgbbir+pM/SwJ2Clc8cI3XI6WPkepJlk0Mt/k9q9okC
 VnmCxAIkwSu1CSXQehIA1g6AI7SsV9EhStTFQQnPEqy2mhlZoCq7awFcIAwc6Vh/+tmpcOYh
 dFfEylZKvgQGDnB5RoHapzx8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMpRXRlmAebXdOmrkwG7s08Clb8gREDPONRSJhnhqdA4Nyzrg/YrCMgQMhGflCCC3
 gObDE5A9+nAqoM46vfTgqWAo9v7GudyBBMCTWLa8ay3JW/R+W/6md1MV+OBfDb8UmLo+fr9O
 bUJnq+kaPBexQREqYtxFbpv3JkS3dq3qu8I1BlgEVXKc0+vVuFqLE6Z0JQdraZK3LJY51e7A
 xrd5tlANLyVE8r5C1pNdhE9Z+GO2PxIyDnf6fM5fBfz6CNtpefVVExTO1+HiTBHLaszO4Qgm
 L9ztMkT4g25qxwrLtfZ0XwEqzXSdiQNA/c9q5UXII73kQ56mFhNbKvVBjLy/JzSOc5HNVMnI
 2PMiafP71iGKpEur5bn+aDx4Ndg
IronPort-HdrOrdr: A9a23:Wqmcoar7+zmFsNCYkvIXR1EaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QpiAoos+O/P+XZgNddvpfvHHeVAlYSi8Rl56cm6XXZ3uBRr22uzKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="63848711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+V1C1QNOruarva65dsAMe7cSGwzO/XG5CaXNIyZMrrdHH0tIXAA+MUM9T5bwzmKv/9tbbeYIaEmQu/MpTwdi7hTValQbUi8C1tNjJJD9fKMZ+U7gAYTWUFLqJCpcWgG+4CaWFRm/KeGoZQJd0FLd27ZwoJR+EBY3/I57N8TnOFyc698l4zBDBY28P8lgADA5jtxby8STC8BMO1OvPHgATQPfdf8UiklSROTDxmacWxifHyRjjVXlUji5KIqVNhjhfg0T3o4x6hxGfHwnj0Xbi5QXU7lksA+IP2xdkUJHcK+2yhhtNwsjXEFDlTAkpvoK9q7dpnUgaxn9sVJLEQ0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp4jrTsCCvkgGLA8Y52FbPggkwNCfXkkJ/HXFoFzxSs=;
 b=lVx441YJWi2Pvr7abeeTXKF8MdCp5vjsbosWRIgb5IPHcEcY5uKj3JN1YWek6s9s96fCwBoN98Eweik8NbFObCKtI1hwt+fdkWUFqrfM3hcYkpL0J5eSEUae/8IlRrbCD6n2FeuBpm/zBxxFdl3lh+yocO7l314qTVsgpQGfgUZo/y24Vgsu9cP27jNnd/4Clu+p4UzxV32ec0tCsCFavzfBmlNyOOL3kbgG53eftavykuVGANvpV/LKoqpsDzWXCyjPbMt0WQ+bvcgkChPJtP9MImjPZmC3jPI/AlZHv14yYLARLhEdse8Z/ozODnD6mxIaETO6Kt4dPOUq/r00Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp4jrTsCCvkgGLA8Y52FbPggkwNCfXkkJ/HXFoFzxSs=;
 b=XCfU+799PlzPUJM269ktrlHf9C0ljZoGXXnvPYcXGX8YlCYAPYMTtDg6bsYoYs/Yv4TuiUXXaGDOd92P0+/pisKdVHas2VveiOSmugtDmS86OeKrlkVoNlvYz+YvdQmg1SmzCP96vCTy8L49NwUGqtxgwgTYooUOPSnaUMGI830=
Date: Tue, 11 Jan 2022 12:43:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 03/12] libs/guest: allow fetching a specific CPUID
 leaf from a cpu policy
Message-ID: <Yd1tfEpCAzeNAF5Q@Air-de-Roger>
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-4-roger.pau@citrix.com>
 <3a7c19ab-5454-fa04-f167-f94d56398b14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a7c19ab-5454-fa04-f167-f94d56398b14@suse.com>
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 702d47b1-451d-4574-0c90-08d9d4f7a9ba
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476961FAA8EACEF3D53A5748F519@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGffHINqMAGyQiaZeJhC3VgR7VNHcnMx2iCmvjaYGLCin+oefTX59g6+Dnqzqk6vYeH+BJp4V3aJXIw9sDWZGg+PN5m+vnqz8GJYJc3ISaorE/PuN35eppJJt90NHu+aYrxUgBxHpZrfDEmOOVHJXH2QXP0oFJfIK0PfOyMMZoP5a3wXl+ex46gR4+PUHYFTV7IuDC9l4QzB/SXLOZxn/U9pvrCQkGz1oR9a/3i743BTU+dRupGW7TJ1KCcmP6BgX676gOadEr0b99OC7ZFC+gQ96a0L32a9FzD0ml7DmkDtK0yyFZszNN3G8xrMCuqm7LXlSWTVVcBjnRDmsudHa2CPfj2cVN2ShFonMLBEfa1WmJ81EEjgFxqzGE+RTNNlyCeh/LtA+IOBQrda5jFlYB7WWjIltWmDjntTZaSZbbvvgWnbisCOFZoiiPNAvHbsjtGlemOaasDBty5aUOBTY+sZGqjCNnAphiejiXgDpoF9irfLqabusNc5CR3fx1PqTXaud5cBT7VO9N/pZ3b9lYxw/wWoDdY9xeKl0Orfg18dCEgC9UHHaNZKBuY3iCrDNxQ68WRlseTTIGHnSO7KxY2G6G6pzyLj0+rlnOzAUJmMh4MdVYq7632XicbPKIuuqpXBc0uBXSFSSPJm+QXV7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(85182001)(83380400001)(38100700002)(82960400001)(86362001)(33716001)(508600001)(66946007)(6506007)(54906003)(8676002)(5660300002)(53546011)(66556008)(66476007)(26005)(316002)(6512007)(4326008)(9686003)(186003)(6666004)(6486002)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJnaXJ3eGhuelRvZCtuN2JBUm4vc0Z0VXN4NVU4OUxMbzhHU1dRcFJEVm00?=
 =?utf-8?B?eExrRnBxdE1hUVJ2aERpVGpIek5ZMEJGeStySmUrMDZuSlF2TFloa0lzWVV6?=
 =?utf-8?B?RXdJVHpGY0p3VTVEYkdSRnVlc3JFT0FpSUppUDFMSy9sREQwTHZxKzN2emg3?=
 =?utf-8?B?WUhzaVcxMC9GMHlpLy9DZ0JHK3RTanFVbU91T3g1V2gvVmJrcFRhVGVPNlBm?=
 =?utf-8?B?dHZZdEFNZEViQWxxUjZoWjBVQnMvWUpsZHFGUmVJWkVYbXJCbHRCWlhHYnBL?=
 =?utf-8?B?SVlnYlhtQ3d1MHplWnlPaXJZWHJVNkJWQ3RCQmRzTnc2SXZqNm9wdGlqc1dB?=
 =?utf-8?B?MlJaTGcrVTB6OS9xU1h0bUNWTGFEdzJBQlhwZnJyT0xUdDhremVJY0cvUTRp?=
 =?utf-8?B?Qm1LYzNOWlRZZy81Sjg2OEdXOVhpNlVudTNkQWMwMCtNVmQwalJSNEFYVUpE?=
 =?utf-8?B?TDNUTWxvS1lXSkU5ZU5zR2llMFVXVWFVN0FaZHRHOTNid0NULzRaR2FTTjZs?=
 =?utf-8?B?Wmx4ak9FZ3F4RmloQU5KSFFDbHhUTGFsU2ZXNGF5TTl4am9BRXNLbmd6ZndU?=
 =?utf-8?B?TzFBSVg0MElOOEtRLzgrZXczd2JKeUI3dDY5SVJlOU8yNTdVb0dnUG5pTGVU?=
 =?utf-8?B?NjVTMDVwc1JFZnVUSG5CVTlwNFh1VHBZSTBWZTNYZmZtOW9VdmVkRExHRHdw?=
 =?utf-8?B?UktEVUhGNnl5UVpYMHlMaXh6OUI5RmVMbjNiZWZyWXdNeno3czJDRFBoc3FF?=
 =?utf-8?B?eHpwUDN4QXora0xVS0FHRTN4ZS9zdTJZdnNmYWhaRDI5NENsRklraFFCdE8z?=
 =?utf-8?B?cUJUNmxFblUxYU9Lb0NUSjlTVGNuOHFMa1ZxZUZqVDNmei9aakxOaFNudE94?=
 =?utf-8?B?UlN1c0t2clQxZUluTHlZMGkzQlh2ZU41Qm5wYVNWTGc4NzBlYkF4cjNYOU5Y?=
 =?utf-8?B?MWZzZWdjc2pUaDRRNnNnSHJ6M3gyRVlZSDNKUFNUVVFNdUtBVTlNYllrSGVO?=
 =?utf-8?B?MWVycHJOa01Bc1M1QkFUd3RrNHRKYWJhTmRNUk02RUdFbDNGUENPaDJCUndU?=
 =?utf-8?B?b2NwMDFYVGhBbG5NaVR3anYvR0J6YXgwZ0ZUaVpTdGhNRDN1alp4cjZtYW4x?=
 =?utf-8?B?WEEyK0R1T0pYWFFCT3M1bEVEbUN4WWVlUTFNeXV1SGlFWVlUS3lzRS85ajJV?=
 =?utf-8?B?UVJjb1BJOVJmYWc2amFsZFhPZzF1QmMvQU9aRmlQMVBzSVJTUEVrQldLditB?=
 =?utf-8?B?Ri9vbDZWOGRTcWNwcVBHcGFpMER6Z3hIVmZVUGZoRE96TlE5N2JYaFd3ZWgr?=
 =?utf-8?B?K294b2Vud3VSa0NnQzB1dkFBQTJEakxXNnJnNEw3a0MwckhWdzJtcHVJSmRT?=
 =?utf-8?B?SHlKdEZzY01SV2hCL3MwSzRVTDlZTnVWaW16OVZPbEtPV3pVRkgzbDRNaXM5?=
 =?utf-8?B?MEQyZWxrcDdDMXlBODYxc2pDeVR1cHgxYzV6RXRDbVZtVVFGcUJRU3pHbDdW?=
 =?utf-8?B?cjQ0T0tROGtWOC9YLzhxN24ybTVYWloxL25EWVdwWFF6N3Fpd202d29jZmVt?=
 =?utf-8?B?THF6bGl6Mm1OZlRFYXhML04xVUVMR1Qya1Bxa3lVQXQ4RVlqRE05M0pWTEZG?=
 =?utf-8?B?eERWMWdQVnZxaXg2TW11ZmZneHY2K3Z2d0RxY205d3d1d2pXV2VsSDZvYjN6?=
 =?utf-8?B?TFJtUjNYaHRVdmE0SlZjSjk2YnJVck4wakVPcTZ2V3RPaHJ3NFdJdlFoRk1S?=
 =?utf-8?B?UUZuWmtrUjBYVE8rTkp0cUkzZXFkQjhwdksyRFRFUzM1VURCQjlRblNkUmFB?=
 =?utf-8?B?OWQ3NEkvMENSaVpmODRYRTQ2VDJGOFRRZ0hUWEVNbDZyMVpnU2VEMGY3ZFBw?=
 =?utf-8?B?azhiUVNzcUFaRWFtS0xxUmNVdDNhSG4ydnlhVG5LM2NtYldQMkFnVHVLb2ZT?=
 =?utf-8?B?aGNLRUVpeHUydmtmMTZ6VmtCVXJabzlLNldVWG04UnJxeEUwUWZKM0Q2Wmha?=
 =?utf-8?B?Tkt6YVJiVlhGaUx0TE1Wb0JRdytyOFo4M1M4cW5PK2ZTUlB3NllFUzcyU2Jo?=
 =?utf-8?B?NlJ2dEJ6Zmk2OVpVUUJKbzRtV0F1OVBBMlVmSVRlL3lSRVVQRGFrRkJnaHhW?=
 =?utf-8?B?dXF6TjFVWEhGajBqcVlyYThub3lkSUhCVVlreXIvNkwzMDRuWXAwVTFaU05H?=
 =?utf-8?Q?DKxdJ8iEZnTFQ1mLAZwHW2w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 702d47b1-451d-4574-0c90-08d9d4f7a9ba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:44:02.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn6fFc0atpV7ebNlpN8FOu1dO1L9sxz0OUVQTh1IQlocj6u9Z2R0Lew0dz8EXEZnvk3Z5MzoYilxZ+IOaPGmBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Mon, Dec 06, 2021 at 04:25:36PM +0100, Jan Beulich wrote:
> On 29.11.2021 16:33, Roger Pau Monne wrote:
> > Introduce an interface that returns a specific leaf/subleaf from a cpu
> > policy in xen_cpuid_leaf_t format.
> > 
> > This is useful to callers can peek data from the opaque
> > xc_cpu_policy_t type.
> > 
> > No caller of the interface introduced on this patch.
> > 
> > Note that callers of find_leaf need to be slightly adjusted to use the
> > new helper parameters.
> 
> Is this sentence a leftover from an earlier version? I can't associate
> it with anything.

Yes, looks like. Will remove it.

> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -855,6 +855,29 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
> >      return rc;
> >  }
> >  
> > +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
> > +                            uint32_t leaf, uint32_t subleaf,
> > +                            xen_cpuid_leaf_t *out)
> 
> Is it common practice in libxc / libxg to have xch parameters even if
> they're unused?

I think it's good practice, as if we ever need to add to use ERROR or
similar from those functions we would require xch, and it's better to
avoid having to change the interface later.

Thanks, Roger.

