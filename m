Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8064F3A91
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 17:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299200.509711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbkhM-0002Go-NQ; Tue, 05 Apr 2022 15:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299200.509711; Tue, 05 Apr 2022 15:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbkhM-0002DZ-JN; Tue, 05 Apr 2022 15:02:24 +0000
Received: by outflank-mailman (input) for mailman id 299200;
 Tue, 05 Apr 2022 15:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbkhL-0002DT-C1
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 15:02:23 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6429d03b-b4f1-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 17:02:21 +0200 (CEST)
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
X-Inumbo-ID: 6429d03b-b4f1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649170941;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Oyke/ISGAUnVCI3YpQEIb6qkaB8YyRN/rhpUROCP6sI=;
  b=ERwbt5t5mGjLKjJfcc4UNP15PJLdwZOspAUFQrtyYscKSs2lO7Ibjgnj
   gHa2qoGROF94ftTcO3cWzjYfnYCD/G0VtrqzgHb6FRHBwOPhcV5sp9TnB
   ms0IQX3bwg+XuvrnZjaD2U3p/0FopmYxMrb226lz2xWHF7xjN6mplOYpB
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68056717
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VGv/OK6C5x80v9bBqRQ7cQxRtOjHchMFZxGqfqrLsTDasY5as4F+v
 jQbCmjTP/6CYGbyKY1yOd+y/UpU6J7WyIBqTgdq/y49Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSxdD8VboTmsdg0Vjh0FxgvGaFp/rjudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQTa6DO
 ZVANlKDajzJWg8fI2kTFa5lgb26wXqnSmxpiQqs8P9fD2/7k1UqjemF3MDuUt6DQ8lPj1ubj
 m3D9mX9RBodMbS3xTWJ/322j8fTjCj7X8QUD7T++fl06HWIzWsPFFsaXEW6utGilkekX9tVb
 U0TkgIitbM39VCrZtDlUgekvWWfuRoBR9tXFfZ84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iIAOti6fZ/xKLIewr/HxIGDUz
 x+MqwFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5ZIlcFg
 2eJ4Gu9AaO/2lPwMMebhKrrVqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8vKKZz0UStGUvg7pNZTewv7+eV2rszZ7TmNLa0XMjz9iebODJJrYelt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGMmbP/2WsidCBhbbiv8pQ/XrfafmJORTFwY9eMkOhJU9E0wMxoehLgo
 yjVtrlwkwGk2xUq6GyiNxheVV8Ydc0m9yhmYnVwYw3ANrpKSd/H0ZrzvqAfJNEP3Odi0eR1X
 78CfcCBCe5IUTPJ53IWapyVkWCoXE327e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:dWfIV6yIeVZH2T/QLSeoKrPw9b1zdoMgy1knxilNoEpuA7elfq
 eV7ZAmPH7P+VMssBNJo7q90cy7LE80mqQY3WB8B9iftWrdyQmVxeNZjbcKmAeQYhEWn9Q1vc
 xdms5FZuEYZmIK7voSjjPYLz6OquP3ipxBKY3lvhBQpaABUdAH0y54Dh+cCVB/QwNLbKBJbK
 ah2g==
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68056717"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c49vcgNnfFzzQT8zeHOT0hGPrJ3GxNXRIgFGs5fBR8cLk6IdWzxPoJ8i1BXdMkDjPn1tRayycuRZt0ID8Pm/EYQtRcVCz0LwH4meztOtcwzkokOV0fOty4yAkx0KO3lhKfP7t3ty48CYcUEN90REZFQUMBU7LJ8rVPnGkVEHN33FqekEzjfygnSr1wbSIabQ4jAiTJbhbWsiPXu6EROWxDv0GCpwJgPTjuAqBhWzkFacdtiD4AfqdE20IKiLT9VH+IvWqWXvwgI2f9Iay12vZrRkKoYUfQyHuAyaH0nONhCPLo5T9hwA8dP2mKuWQcWvybqCiyyebfyjBkOing8Dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khxftXRJ5VV5NNPI913hPMepB9iJZcjrmSRTl13EHsU=;
 b=P/BR/IT2yWC+5ONnyCfdZ/dH4cV0cv1ROi/7jPF7ibgcAWug7RcCInYE+QLFODMalyXlC0U0UuawkUXI1IHgnmMhAhSTom8yh/lkd6XB/I3rTKiO18HPt13L0cisVgdXj2gd5xaImCxHA+Ru8Ti50eH2BFKLNzXgBKsge0aPRlh0SHbGXcqbCTGuxitAqcvP0FETMB/VWgruf6ahDL/Nc7yN/KpRPuHmDORDSU+6A6fvlkaExMYFaZTcodFdQJkc4fKV1kfJr2sgUjZz7e1GV+5auOIZVcx24WzkYsNUCMn3x1eTziWPANfZjUT1xLotQbL8qenHKpAkaUiDaJ8jJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khxftXRJ5VV5NNPI913hPMepB9iJZcjrmSRTl13EHsU=;
 b=D2YoYpervj+WX8jgaP4CgTu7/+6c0gP3rjWgV1LL8dp+LxJfnVrzPPpFoYOPzRpJX6cymjDkfS2Et6mh1uJ+Vo8pFwxbosTndjnn5NHpA80KxuLg63ZjATOKqAlfOI1vPJ/5mR2lJZmcoCcR4OiD0Xw+HrjlACGmj66bCSmKjEw=
Date: Tue, 5 Apr 2022 17:01:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>,
	<jandryuk@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <YkxZ4RWAEKRSdUWL@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
 <YksK9hIbJbOXkIYd@Air-de-Roger>
 <cd178295-4c8b-6710-3050-011fcee378b1@apertussolutions.com>
 <Ykvy4lWiwASHGXcF@Air-de-Roger>
 <959fce1f-31c4-3de8-c3f2-45c307502473@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <959fce1f-31c4-3de8-c3f2-45c307502473@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f430cee-7c00-469b-f30a-08da17153b6b
X-MS-TrafficTypeDiagnostic: PH0PR03MB6384:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB63844F24AAFF4C7A441B177A8FE49@PH0PR03MB6384.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ai3whgIoTTmN0G4EqekGy7QEwP5btYIIsNrN3Kj2hdQqwFZaHmht9geO0RsRErP/SisuPBwyOHI6aHwRUQzvVel1QJYBOmtWuBHnmjwTOWISWfbct/8IZJPpUhcIWzk9aak2XCCRNEhbO5QfDOZiougqHZnII+T50Xj2yftnAhNTEes+qRF4j4lhUFxjtLELtiFM2aKKiyo2yUzlQdQxzddLV2flasPtpEctjhf0x8+9hlI4DST4Fq0ynSLZIkcW2XmxGIKjQYYLYmNJ8KjKm0JcZNR5L/S9mhIoLZW1TSfki0pNOF2YOeSVSnN38otI6x0IR+KGEYcJ1sqpWZ4cpDP5ix/R7is6N7ItckA9fDtI54c0RqpWCykDH3SBqtTGjFabt7hX+0JAMESKuiV2nWh6fA9yPbUBkAiTt5TUy8qMLcBb3ChslNEcjh73s0Q/Mo/CLUSe0vmbHbXRCIsbnzaS+MOI5XIOnOnWDPK8DgPqRnxKY9mHC0zKfc2pL4Hl+PQmNAXI7GTzUEJFf/8hS8uP1Atx4niW7jrMzhKr+u2KWuZpyL0Mrb9asNtyUkBToTPiBQh223EkvPr0a6FlPQkKhGvpWVlg6xSfTvb7viE/jK86hqx3rF5UeWS71lZMH4kmWZH132cTZrAWUnudffVG/fiwMFVUwaQAobN/fUFPEhwHZ5mai+ODtM+zFkXT3+X+vi2dcTYRH7swn2PryiMTuY5QiVC/PwOhXL1ICR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(6916009)(38100700002)(2906002)(26005)(186003)(54906003)(86362001)(107886003)(316002)(8676002)(8936002)(9686003)(66556008)(66946007)(82960400001)(4326008)(85182001)(33716001)(966005)(5660300002)(6486002)(66476007)(6512007)(508600001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkVZWld4MGZCZEh3WXhBM0hSOCtncit6MnUwU0dGNjNwQ2pOcjB2MldPSkxQ?=
 =?utf-8?B?UGVEWS9kUXBaWC9odythSnRHL0tsVDBCQlBoOVJjUUwzV0hyNExYNXk5ZGpU?=
 =?utf-8?B?RWxaUDgvTmN2NmN2OEw0L0ZEY3pHVnN4Zm9rdkxlVDZWL2pMWjFmblJMSnc4?=
 =?utf-8?B?eVBWanN6dGl4R3pwSXFMblNDYjZuUnpNaGlvVzNoV1RoVmZOMzlJNUE0N0Ja?=
 =?utf-8?B?Nm1saStVZ00xcFpiMXFJQlVoK3VaUlp0Y0k0ZDUxSnZLODdIREIrNTZnQ3Vs?=
 =?utf-8?B?c0hMZkR5TGhiWmFMOWdJOVE2RDhSL1BIVGVmOEJvbmhRcnBha2szYWwyOC9w?=
 =?utf-8?B?K2NaakZkdjZGR05GRERhRHJsRTA4amFiVmdNWWZoZldsckExUVFaZ3hwNTVC?=
 =?utf-8?B?SUQ3WnVIQVdzTXMzWFZwUDEzTURncWE0MzMxUFY0Z0cyWnJXTHl1ODJ3NlNq?=
 =?utf-8?B?VDBjYURwYnNaaHcvenZaNnBkNVl6Y2FWVFJnbTM1azVmSHRlWk1MMHdKSHk5?=
 =?utf-8?B?aHEvbGJKd0lHS0FaWHNXbU9UWFcvU0pYd2MrQksrTnc5WnhVMGlTbE05a1Nq?=
 =?utf-8?B?dXRydlNrTVN2bGVlT1VCbU5oQmptYkpDQVY2WWprTDFVN0QwcGNxdm15Sndk?=
 =?utf-8?B?RzNaWllBQk9MTUxRdlg1WWd5Y2ZmUUVrZXZTRnR3TnFqNWtQUnYrMTdnVnZl?=
 =?utf-8?B?MktYdGN1R21GTGdZQUhoZVFUd3RiWmM2YXFZQzRWTnpCTEFsekp5NFg5VHZN?=
 =?utf-8?B?alI5aE85YWlvQzJTRVlVR2FVYmZzdWVOTWxpLzVOTVVabzZNY2N0ZkFRbGcr?=
 =?utf-8?B?TFpxY0V3ZnZ4aEhMYzhQd3Y3d055akJaTVBKK1ppQWJ1dk9nTHFtakVlUWtR?=
 =?utf-8?B?cldxRzhWWGt0QXVHRng2a2RrWndXcVpRK3FGYk1qTks2K3h6aWlRUDJqVWRG?=
 =?utf-8?B?ejlXVG4xcHlKOE9QQnptNnNpeU1wd0JTV1UwWTZKM0M5Y2p2RzlBb0JvUEVn?=
 =?utf-8?B?Wm44OUIva3g5UEN0WDRVYXhMejEwdDBqTTAxK05UNmlnd1lnWlJRMVBSUjFY?=
 =?utf-8?B?dFpVOG45NXgweUUwVVoyajdhSU9Ca3pINFZBcGNid2ViYkpRekdJUGRhQzh5?=
 =?utf-8?B?RStxWjNEUmdZQWZDRy9hWFJ3MVUxT01qUGEzQ3Z0TlJJSXBrdkkvZzlpdGxR?=
 =?utf-8?B?TjVWQVJHaWFLWUdBOTVGdENEWFZrYXNQb1ZxMG94M0dDRmFKcWtTUnVlNnUr?=
 =?utf-8?B?T2V4djQ1R2dONnlsRWdoYXY5c1d2NVMzUGlRNm9OOVJBYUZLN0JWUmFwdk1L?=
 =?utf-8?B?V21aeTU4TVNQRmIzTEVrTG96L2RKb0wzbnJPSzRkZVJTNnR5cStKSHBHTGdJ?=
 =?utf-8?B?bWN5UWpHN3ZBTjIxd3ZjcXZRNE9COFpLY1JLMWZRa3pnU0JPU2RISG5SeWl3?=
 =?utf-8?B?TnJkUTdPaFRKN1pwS1ExQU1ackdvY0ZVSStSaHdGZll4YW93UW5vaXpJenRa?=
 =?utf-8?B?Ynl0Qzg4ekJPYi9Ca3dOdC9pUjMxYWJ2b3dBdnpSMXdWNm1PR2V2cUZ0dXgw?=
 =?utf-8?B?YkNlMDhvT2RpbHZFZDM4WGczNzRTVTZOdjdwYVV2SnBOU1krS0hSL0grWWxO?=
 =?utf-8?B?MGYrR2FpY3VkS1poR2FSc1ZGQXp2MnVEWE5SQ2xNWE1KZ2V4ODFJU1hjV3Vz?=
 =?utf-8?B?YW9DYnlCMmdpWk9RZ2VvcXROdzhQZjI0T2VqWXpMbzdKT2Q0RXc5cWtwRWdV?=
 =?utf-8?B?V0hSWDBMalpia3hvSGhkb2l1cGFuMVl3Z0ZrbUdhNFZVWmQxSGF3QTVudmUv?=
 =?utf-8?B?RDNJV1pjMGx1allqeXUyRzkveXZocTQyWStwWUkzKy9BVXFCUkJ1bEVkWGhv?=
 =?utf-8?B?VThaSTdObUc1RENuVHcwbEFEOTJuTTZuUlBwWUpRdk9jQmxjNm1pZ3NEQ3ZC?=
 =?utf-8?B?cFg3OGdsRnRldU01Wk1aS0s2OGtBdmN5OXJTQW43bVp6alJHMWtwVFd5L2Ex?=
 =?utf-8?B?R2lOR0NYNDFRSm9EdHhpMHVOQWtWaUlHZCtlTkVkd2M0N2FGc2xKZjRJSEJ3?=
 =?utf-8?B?Vnk1U05SeDkvbTNjS2ZrZ0RRQWR2N3BMTGpvWFUwVm8wMGREVzRHUmp6eGV6?=
 =?utf-8?B?OXNLcGVTZ1RGS1ptY2dmSW13Y3Bwekp3bUZ1V0lzL2dpRURRNm8vYWlod202?=
 =?utf-8?B?R2hRVWp3NWlRL1dPTGFYekNaTWk3RGhWSVJmUUpLdllmKzRwdzBUcjk3SDRX?=
 =?utf-8?B?R1FNekpNeW1HSHdFL014L2YydUUzbVFQN1VlZDk0R0x6T0tkT1Nxc3VzNmxK?=
 =?utf-8?B?TWo5UVRYSG9DY3JORlp2dk80dTh4Y3duNUJqdEhuSUZ4TTdUNmFvVmlpc1Zi?=
 =?utf-8?Q?zsHX0M0ewtPj4foQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f430cee-7c00-469b-f30a-08da17153b6b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 15:01:58.9871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miOkKJKSZ+SXhpZVZOp5kdhg9JGhR7OzMmOGboDM4KDgZSXkxA6/IL58m6AkorxRcWjGm3cdP27JqiyptDv4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6384
X-OriginatorOrg: citrix.com

On Tue, Apr 05, 2022 at 08:06:31AM -0400, Daniel P. Smith wrote:
> On 4/5/22 03:42, Roger Pau Monné wrote:
> > On Mon, Apr 04, 2022 at 12:08:25PM -0400, Daniel P. Smith wrote:
> >> On 4/4/22 11:12, Roger Pau Monné wrote:
> >>> On Mon, Apr 04, 2022 at 10:21:18AM -0400, Daniel P. Smith wrote:
> >>>> On 3/31/22 08:36, Roger Pau Monné wrote:
> >>>>> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
> >>>>>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> >>>>>> index e22d6160b5..157e57151e 100644
> >>>>>> --- a/xen/include/xsm/xsm.h
> >>>>>> +++ b/xen/include/xsm/xsm.h
> >>>>>> @@ -189,6 +189,28 @@ struct xsm_operations {
> >>>>>>  #endif
> >>>>>>  };
> >>>>>>  
> >>>>>> +static always_inline int xsm_elevate_priv(struct domain *d)
> >>>>>
> >>>>> I don't think it needs to be always_inline, using just inline would be
> >>>>> fine IMO.
> >>>>>
> >>>>> Also this needs to be __init.
> >>>>
> >>>> AIUI always_inline is likely the best way to preserve the speculation
> >>>> safety brought in by the call to is_system_domain().
> >>>
> >>> There's nothing related to speculation safety in is_system_domain()
> >>> AFAICT. It's just a plain check against d->domain_id. It's my
> >>> understanding there's no need for any speculation barrier there
> >>> because d->domain_id is not an external input.
> >>
> >> Hmmm, this actually raises a good question. Why is is_control_domain(),
> >> is_hardware_domain, and others all have evaluate_nospec() wrapping the
> >> check of a struct domain element while is_system_domain() does not?
> > 
> > Jan replied to this regard, see:
> > 
> > https://lore.kernel.org/xen-devel/54272d08-7ce1-b162-c8e9-1955b780ca11@suse.com/
> 
> Jan can correct me if I misunderstood, but his point is with respect to
> where the inline function will be expanded into and I would think you
> would want to ensure that if anyone were to use is_system_domain(), then
> the inline expansion of this new location could create a potential
> speculation-able branch. Basically my concern is not putting the guards
> in place today just because there is not currently any location where
> is_system_domain() is expanded to create a speculation opportunity does
> not mean there is not an opening for the opportunity down the road for a
> future unprotected use.
> 
> >>> In any case this function should be __init only, at which point there
> >>> are no untrusted inputs to Xen.
> >>
> >> I thought it was agreed that __init on inline functions in headers had
> >> no meaning?
> > 
> > In a different reply I already noted my preference would be for the
> > function to not reside in a header and not be inline, simply because
> > it would be gone after initialization and we won't have to worry about
> > any stray calls when the system is active.
> 
> If an inline function is only used by __init code, how would be
> available for stray calls when the system is active? I would concede
> that it is possible for someone to explicitly use in not __init code but
> I would like to believe any usage in a submitted code change would be
> questioned by the reviewers.

Right, it's IMO easier when things just explode when not used
correctly, hence my suggestion to make it __init.

> With that said, if we consider Jason's suggestion would this remove your
> concern since that would only introduce a de-privilege function and
> there would be no piv escalation that could be erroneously called at
> anytime?

Indeed.  IMO everything that happens before the system switches to the
active state should be considered to be running in a privileged
context anyway.  Maybe others have different opinions.  Or maybe there
are use-cases I'm not aware of where this is not true.

Thanks, Roger.

