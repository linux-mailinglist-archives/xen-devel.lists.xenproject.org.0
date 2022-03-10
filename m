Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27394D4CA6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288432.489094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKSM-0007cg-O1; Thu, 10 Mar 2022 15:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288432.489094; Thu, 10 Mar 2022 15:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKSM-0007ZG-JC; Thu, 10 Mar 2022 15:11:58 +0000
Received: by outflank-mailman (input) for mailman id 288432;
 Thu, 10 Mar 2022 15:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSKSK-0006dy-TK
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:11:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a80f69-a084-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 16:11:42 +0100 (CET)
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
X-Inumbo-ID: 63a80f69-a084-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646925115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=alFlq9d6yt3XmMr1Rs6ZKudBRBHktI4LBY4Xm8IKjok=;
  b=eNIFcHbjVcnqPkT599FbeY5MSTMnSeLLdhO6vwJB1yL/SbysTXxkVfSr
   WPqx89SNL9Uk9z2Zj8oxqg+PFG+RNw/pG0ZYPEf7ZDd6/SyQoVa2L+jWB
   sZ+g5Weq+VsjrW8WOWd/BuGYIXw4HJnBTcCa/gSWHmb2/atDpNjFnmAia
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65399632
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Uri086nokhfe4AlT8JDcv9vo5gyaJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWmqOM/eOYmT2f913Otm+8UgHvp7cx4JmGQQ9pHpgFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWlvV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYcgMUPK6UsvwmVjYBCDsjMqkBpaWePi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6uFN
 ptHMmAHgBLofU1ta3BUEcwHzeKP3WDyLRtFsAqYjP9ii4TU5FMoi+W8WDbPQfSGQshfk0Kwr
 2fP7WP/RB0XXPSczjyf+37qme7Lngv8QosZELD+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyz2dO2oHFhRZU9kJ7dQsGDMuk
 QKTxsy8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBj3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwHpU
 JsswZH2AAUy4XelznLlrAIlRu3B2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGP51MMvcQIZCX6M8ebhr5d7exwncAM8vy/CpjpgidmOMAtJGdrAgkyDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBgXMGo8ZMLLrDfSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74jxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:4W65WKEFqfi+D2szpLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKhyXcV2/htAV7GZmfbUQSTXedfBOfZsl/d8mjFh5VgPM
 RbAtlD4b/LfCFHZK/BiWHSebZQo+VvsprY/9s2p00dMz2CAJsQiDuRZDzrd3GfE2J9dOUE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOup5Dt
 T/Q9RVfY51P70rhNpGdZ88qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65399632"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBpo6PVB2jyLE6M4awiWDiI0uG8BFy3k03EyAhxlrBtLk4vx3Gtcq3sLcFGF85MtqWljZBRoDpJuukbK81nlzjfbsf3pUW67bNxyB4kDENvs/TJGxaXKLaAHdD2aFYGOItrN20uO/z21l4IqPzdnM2GFKPtDpz+Yc2UKuoxrU3416n8weFZxv6SFZaBfCileDchGHW7Luk7bxV1nBcHrpUiyoCXEsw3v3mahKHJ/N6433XNuOZzhQs6Nk/8YJTHsy2o2Gl7THGdDnEpR05oKqStvcB3M0AnZsLE2y1j2wHHG26Mb1N07dS7OvtG2F/B4EANHv0MoAUjlCx2gpK3Org==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqzJJP1ALgqRLG/SatpbTyBtpWv/Y8f9lPVlBNCrbsY=;
 b=Y/QGpdOP1CMwqBWicJbBqUpDLZlGsav5eyjICvUCBJuioxPUF9OO9W1gfXitP6BuhsFVq6yc2pGn59/DsEH/KXu0kDYpcuu1iDtf86L4zmNb4oFHlRfjf+Diks6pkjduIQD1b/X+KqHHvfS5EeYaaYcrHPVlDLhcOBoUMe8I4Y+Qrqad605U/zASzqet408d3ECq1WV0dRKuIl7VIRqthHnrdFFFH0cxTJSNl0i++VuX1PUUk0mPw9YqZrXuivG3R46ze7KH6YpUGwbW4LvvFlapSK5LQ1u9go439kF2SNwWczppUyV7Ts5eChkeZxQk6y0wy+GspGA4dBzSeJs38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqzJJP1ALgqRLG/SatpbTyBtpWv/Y8f9lPVlBNCrbsY=;
 b=QkfMCZp9HSQlu/gniAC1X1RRAM55WkUIylCRFwcg0hgQ6fq15o2iKLN5X9mxWvRppZAhgiBT6+6wTDhoMjsKF5exFJyRaKcWNgMEuO+9p2tq2qSCJK7JtlTi4KtpSafUeHmk5zY/axdTAZmcmB/5mzeDItmUsDqRv+t9TgRZNUk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <doebel@amazon.de>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 3/3] livepatch: correctly handle altinstruction sections
Date: Thu, 10 Mar 2022 16:08:34 +0100
Message-ID: <20220310150834.98815-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310150834.98815-1-roger.pau@citrix.com>
References: <20220310150834.98815-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0169b3e-fee1-4a7c-2e38-08da02a84d24
X-MS-TrafficTypeDiagnostic: BYAPR03MB3624:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB362437291F752C114D83928E8F0B9@BYAPR03MB3624.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KJaLJVMzwuXfGE88nAOKfiT4MDoQSgekbPo1YX3nyw81iGmcCAlnN1SJe89ZCraElji/Bnw3DHU8T0mnkO1zKzW2Sjos8MpcIymkR8npvDybwNGE61CsGA8knUNA9GK3TZXfP+rSPGTTFE6rRr5Ii7I+Ww689pY1JP0vXx53qszzJat6oxMssfSmCh4PfbAMDzrP0X7NkdlLszYcEdM4/Dvmrs4MppNGEwEHzprerTGKS9q8vWg04vilkFuQFRvSl3NXYfe8jCzdJ/z8vMl0oY5CNSgad4CEnPsmH5vLSn+Ut8AFLDSJuhe40VN0CNdUlOSnT1hbmnP9HpXNiv4Ilu9C0ZM6zVkzel44GXQ6MsXzDQqpk2OeCnP5tUW8GGGCM3H+JXAQTvSR2tw74B6nv3afdeXrssrSYDQAX5e8k8i3MmK/PfFe+qVNbdhHcHf6lo1i3Lst4NNfoTQu2UWHmnUZVcCGL/gMJTtlEtAvRdwdjkn3Y5H4uYp1OzNZKs+v2D+Ev5x5Z7OmLGZ1zK5ZIYl9cX2qAlYlUxpgmKSj7T9y6oTDytRegAi56ey72pm8MVulfRAgODvBTQGB7bsoiWHl+umDIhhm2FP8FBUg2RP3i0vxOWq0t6s4FFDDd5UbM36Z9C86L1ufCKDgUZ68Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(186003)(2616005)(26005)(1076003)(86362001)(38100700002)(107886003)(5660300002)(6506007)(2906002)(6666004)(66556008)(8676002)(4326008)(66946007)(66476007)(6486002)(36756003)(316002)(54906003)(6916009)(82960400001)(8936002)(508600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0xrbzhwQ0YxTnVZcG9aM2RnTXVrWVNqYzZpRzJwQjV6MXFBMkZDT0Z0ZlIx?=
 =?utf-8?B?MXh6VHhKd0tyYWRpR3l1Y1JQU1FuYzZKNW15NzM1Yi83MlBiMXhzUzV6bVdJ?=
 =?utf-8?B?d1JsSFBBOTUzWFh0cEVxSElCVVZDYWxaWTR1ZU1GclNNRUJmZ3ZDanBxT3V1?=
 =?utf-8?B?M2xXRnRJT1d3OURtcnBXdWhFdVplNmtMeVBjWGZia0ltTU9Say9jM1hrQ0FD?=
 =?utf-8?B?VDFVVUh5T05RRGlHS0MvZ2V1TUVLdE01Q0toNnozNVN0QnFDS1ZuM3dzaEhL?=
 =?utf-8?B?dnpETFAyaThjaWxqWEZXanJpZjNWLzFMelRYNXcyUHFUek9pM2JQK01zODRP?=
 =?utf-8?B?L0FHMmZyR3JQTU1BNURkWERuRDUwVllHSjNXYzBHTkRhRnlrTnZZcjFYeXA5?=
 =?utf-8?B?Y0lIZitxUjNISFhPZk9sS2RhemxhR0VWVTdZemRQVXp4MVc5WUEyNGlOL2tr?=
 =?utf-8?B?THZKbWZOei9zVzlkcVVXM09FbXZkV0NhMThSYy9Pc3JhbjZJcGN0WjZ3Z1My?=
 =?utf-8?B?ejVFZjNKcVVkbTZGRUl4dG9EVDJ3VHptTUg2dTBNYTN5WXEzcEplK2IxK2lI?=
 =?utf-8?B?dVBYOWR0enpGSzU0VzBLdFhGcUxjYnlRNktQcHpHaVVqOW1sL2I3dGM4QmRD?=
 =?utf-8?B?Q212Wk9FaDRWQXhxS241VGRodnllc3MzL0UyS25mNksyOWk1WGVHSHlReHRh?=
 =?utf-8?B?WXE0Z3d2bEtXYTBnUGRxNEhWMjljMHlYTUdmL1lQVmNtbGpRWXY4T2g0Wklm?=
 =?utf-8?B?M0Ryak1HMFNzMnVpRW9qa1MzZmVtaEpxQkJ5Sm8rRzIrSVFmczFSWHNRR2w5?=
 =?utf-8?B?YUk0WmJqbHNQakFhVGdTaU5EbkxxL0Yrd2NuQnV2QjRiK3h2bUxmWmZtUGZM?=
 =?utf-8?B?OG9hb1RNaTdneWt2QzhRQk9nMmI1M0hubGhuSmJVY3F3L25BaGxvdWR4LzJy?=
 =?utf-8?B?emZVRHVYSCs1cFNpVnZFODlyZ01vYmtRRmRPdGRPRFZiZW9Mcmlqand0UmJt?=
 =?utf-8?B?ZnBQdXNpQW9HOUhZeUVvVVVWbzBCeUQzNUs4Mkk3TFN0ZFhiQnFJNG5ab3hw?=
 =?utf-8?B?cjFiWkR5anBKaTQ3c0pxSjQxRWRmVUNsV3hxUlBkRmovMmxqVHJhTk42N3da?=
 =?utf-8?B?WlNQY0hNKzBlbkpraWJNUkJIc2EzTkZVaElQZERES0hWWEdXaHZsV3B6SFdl?=
 =?utf-8?B?M2FaNHNFYmVmMUVVcVp0c05tOHhLaWo3RjJNV1Y4ODJ2aUxMV2Y2VW9IMDBB?=
 =?utf-8?B?YWRXMGQvTERYSjdubm5ORWc1bzFTclBzYXZLUjFQNnVhRENTd2pKVGR5S2ZW?=
 =?utf-8?B?TDNkbS9HRHp0VzNPWjh2cnVHWVZ3QU12aC9CYUQxbXgwNHB6TDF1VXdpQzdw?=
 =?utf-8?B?VFRyRTN5cTc2N2Z1Rk8zbmtielhGV3RYaFpsY0xjQjNhVlU0dldyUGJ5YWpx?=
 =?utf-8?B?K3J6c2tkTi8zd2VpSXd3NzlkcGc0ZnFuQXEyaWU2S2I0Wm5ZTHJzbEUvYVBL?=
 =?utf-8?B?Zk1wc1ZLQ0c2T3B4UVloRWNueUJQdDRRV1VoVm56SVRsckZXUUNuLzcxTUd4?=
 =?utf-8?B?d1JWK3RtMnZlUjRGcTQvSkVEcE82SXNpNkg0U1NOR0FjS21xT2piUXF4bFAz?=
 =?utf-8?B?Q1hvR0JVMGFJaGpOZTRtdnBVYmRrOE9pbGgyZklCeHFubWgrNXRzK2JpRmxk?=
 =?utf-8?B?dmFQV3oyMHlUNkdHYVI0aS9XT0JuczVtUTc3d0VEbHNhNnZiNmFoTUtSRkRv?=
 =?utf-8?B?V1cxVlhtQnF2ZjRiN2xLVERIbFVjdUJMeDZsQ1BtUk5idEVodXVpZlNoTUR0?=
 =?utf-8?B?eERaRk5HalZ2ZUUvUTBKV00xS3BqTXFNbm9QZWtYWFR4WFErUm4vWXQrTzQw?=
 =?utf-8?B?L2tydTkyTE5GWGpaNkRra3VEdWRFNUFNcmhaZ1RScjBGS2ZjZnBYWUI2M0Fh?=
 =?utf-8?B?OElPY253RzEwRGIrbHFHVEZSSjNhbXpsWDFxazZLYnh5SHpUWnNhcWZrR05Y?=
 =?utf-8?B?N1ozV2swQ3FYM1VJTU5waGF5b29TT0I5OEdpMGJodDZDTXBYNXFuZUNQM1lO?=
 =?utf-8?B?SWxBbXV1WURUOXJUWnk0OXh2YlREMzhzTE1IbmpTTjM5TFJ6dUU1M2pSUFAw?=
 =?utf-8?B?TDVUbHJHZWhvalpNd1FXK0I0Q0dEeGpuRzNKcXlZZVJjcFk5b2dHZ3krZUw0?=
 =?utf-8?Q?OyNw05Ay3QmrVobzs9FXaeE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0169b3e-fee1-4a7c-2e38-08da02a84d24
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:11:49.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O76STjJ8DfXnHmg74+Avx+p+F2St8wL00HIhwQMAKfgdEpYSkouVvH950t/h8hBigwenl7FO6U7s2Gp8CnM2iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3624
X-OriginatorOrg: citrix.com

The current handling of altinstructions sections by the livepatch
tools is incorrect, as on Xen those sections are part of .init and
thus discarded after load. Correctly handle them by just ignoring, as
it's done with other .init related sections.

While there also add .data.ro_after_init section as a read-only
section and introduce some syntactic sugar for comparing section
names.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I assume this handling of .altinstr* sections was inherited from Linux
where the sections are not discarded after load in order to apply
alternative patching to the loaded modules after boot.
---
 common.c             |  7 +++++--
 create-diff-object.c | 26 --------------------------
 2 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/common.c b/common.c
index 68a71f7..a148d8a 100644
--- a/common.c
+++ b/common.c
@@ -249,19 +249,22 @@ int is_text_section(struct section *sec)
 		(sec->sh.sh_flags & SHF_EXECINSTR));
 }
 
+#define SEC_MATCH(n) !strncmp(sec->name, n, strlen(n) - 1)
 int is_rodata_section(struct section *sec)
 {
 	return sec->sh.sh_type == SHT_PROGBITS &&
 	       !(sec->sh.sh_flags & (SHF_EXECINSTR | SHF_WRITE)) &&
-	       !strncmp(sec->name, ".rodata", 7);
+	       (SEC_MATCH(".rodata") || SEC_MATCH(".data.ro_after_init"));
 }
 
 int is_init_section(struct section *sec)
 {
 	return sec->sh.sh_type == SHT_PROGBITS &&
 	       (sec->sh.sh_flags & SHF_ALLOC) &&
-	       !strncmp(sec->name, ".init", 5);
+	       (SEC_MATCH(".init") || SEC_MATCH(".text.startup") ||
+	        SEC_MATCH(".altinstr") || SEC_MATCH(".ctors"));
 }
+#undef SEC_MATCH
 
 int is_debug_section(struct section *sec)
 {
diff --git a/create-diff-object.c b/create-diff-object.c
index a516670..ec2afb4 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -995,19 +995,6 @@ static int ex_table_group_size(struct kpatch_elf *kelf, int offset)
 	return size;
 }
 
-static int altinstructions_group_size(struct kpatch_elf *kelf, int offset)
-{
-	static int size = 0;
-	char *str;
-	if (!size) {
-		str = getenv("ALT_STRUCT_SIZE");
-		size = str ? atoi(str) : 12;
-	}
-
-	log_debug("altinstr_size=%d\n", size);
-	return size;
-}
-
 static int livepatch_hooks_group_size(struct kpatch_elf *kelf, int offset)
 {
 	static int size = 0;
@@ -1021,11 +1008,6 @@ static int livepatch_hooks_group_size(struct kpatch_elf *kelf, int offset)
 	return size;
 }
 
-static int undefined_group_size(struct kpatch_elf *kelf, int offset)
-{
-	return 0;
-}
-
 /*
  * The rela groups in the .fixup section vary in size.  The beginning of each
  * .fixup rela group is referenced by the .ex_table section. To find the size
@@ -1099,14 +1081,6 @@ static struct special_section special_sections[] = {
 		.name		= ".ex_table",
 		.group_size	= ex_table_group_size,
 	},
-	{
-		.name		= ".altinstructions",
-		.group_size	= altinstructions_group_size,
-	},
-	{
-		.name		= ".altinstr_replacement",
-		.group_size	= undefined_group_size,
-	},
 	{
 		.name		= ".livepatch.hooks.load",
 		.group_size	= livepatch_hooks_group_size,
-- 
2.34.1


