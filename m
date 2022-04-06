Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9802D4F581F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299739.510877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1S4-0001K9-Ds; Wed, 06 Apr 2022 08:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299739.510877; Wed, 06 Apr 2022 08:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1S4-0001H6-AH; Wed, 06 Apr 2022 08:55:44 +0000
Received: by outflank-mailman (input) for mailman id 299739;
 Wed, 06 Apr 2022 08:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc1S3-0001H0-6R
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:55:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5498995f-b587-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 10:55:40 +0200 (CEST)
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
X-Inumbo-ID: 5498995f-b587-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649235341;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gcZAu2rAypNKzN8D6xyqucJoqCvgO9wQZQKjYQBqA9g=;
  b=Dhjqh+rVfMP1V9Z7o27cZQWxxxnKOn12a9NPUD8/V5Ki9AsGsUuQ3SxO
   34XReBIn0uXylBp4ZK8Ay1nCRT9sBYcQiZgBYa0EytH112EUkL4GTFdwt
   nJ1/YFyPFP7k+maNsV4mml0pD4vSN/uRxdmsCnr+zx1WY6Q1Hc/1nDRcn
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68032473
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EBmAA6hf8dwxIK3wXuz3A401X161QRAKZh0ujC45NGQN5FlHY01je
 htvDGHUMv+CZWGhedAlbIqz8RtU6MSEyNJhSAs/riBjF3wb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vT4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQ0lH/T1yPpBaAIGQjB9P/NDp/ycOWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiOP
 5FDNWU0BPjGSzdhJ1lHJ9Fup+OXr3/VLA1z8liuibVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoVD6ak++V2xVSfw20VIA0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpYtAH7fZmW2ARz
 QHYjtDrWzkw8+aNVifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5XGhAztJcvU/MBofAnrNOv3jxpiGGeB6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYCrzPfMnM9LhVJ9CIU3c+TLNDK68gj1mOMYZSeN61Hs2OR74M57FziDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/LbfZeFc5QT1/UJc8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEZj5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:c9sGp6Bus8yLUB7lHehIsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUbqFh/dL5kUUtDPpZ1fSKWMB2FffueChPbHbzYfJt3T04l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68032473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3HmbBaIMiLQN1DhDuGxdDH2Fa2dbVx0seG+nNeoYA6/ZE5af3qguAXKBfWHM9H8RqP4eFaxpWRHFtFLd+UzQfSHA/G5IZaJVanbIFsCfqm+CHBd3m3Q7ZPrcWeaqSXXKJXqQg1mOGT/RYVm+wACAZAXPlTI7cCeJbrV3dWFnkpzzU/WbLW1CgmvpRk3w9YOafiyPK998Ge2OAKccrbmhsytT88PaNVW9Dj/bUByxVHCel7SrIl/S3z0wpEIOd8NYKfYtlUtE+oFn2/bYVLdkVlAqBo/OwwR4xTh/hlSUx0d5mgzAcGXCkGd4MIL35o/uJ1DX0zj2zj8t9w50b7wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2+pUYa1hWd7qpDkOptdaNRGqT+vbJP5b2ZfZTlomuA=;
 b=MV90zGmQBNoYIox6a0rsryof1RXf7kiE4IqkNzit6auePzxcfyWY2UXli6BXL5fwHPnNV+EDgs0CSHbeK9dMKBeQ76KNInQXimxPHSnX20UmOBMIuqXTne5nlTWTom1XU/rAhzu8vdh/hGZAj1gBSnyXwPjs0KlXAIuuisSdEzK1g7RG3Bac+2d7aY1MV4ZXi9nLSrtD+wDIG2o0/unbfx7cKnynd/Xhdo09EG8gn49naiTr9PJN5kx8qthH+nfxVM4UoV/KSgJXCD03v555Oq3S8aKb5JKo+av7hOTBg/V/Lz/v2bTVhY5qrMnaRWD7c9lNIsHoH/RFBhDVY5ExJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2+pUYa1hWd7qpDkOptdaNRGqT+vbJP5b2ZfZTlomuA=;
 b=kapDe1K85H/dbv46h/tWNm+vzma1jwU2p33uh3LHDx2de39sIXwB3tvJXCjZBNjRZkP5+jjvzQFKZIu3W334S3Q/vlZj7RmYjfWKXNerUruIKmTuKCuQThamGCT357QWaOF0qK/gKVEkvDsvTDl3Hn3qj3PsZiLw06ykRPVJ560=
Date: Wed, 6 Apr 2022 10:55:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, osstest service owner
	<osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [xen-4.14-testing test] 169170: regressions - FAIL
Message-ID: <Yk1Vg4ckxKzJbXwL@Air-de-Roger>
References: <osstest-169170-mainreport@xen.org>
 <d0e84ac8-308e-1784-982e-271705c13b7d@suse.com>
 <afaaf270-27d4-39af-8125-6d622801073d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afaaf270-27d4-39af-8125-6d622801073d@citrix.com>
X-ClientProxiedBy: LO2P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 493db85f-9e0f-426c-58c2-08da17ab3701
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6779:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6779766B37B01217477CB0C38FE79@SJ0PR03MB6779.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fcwT20phIL2EQr26CWsDdmZsIxl++39GcVUroe73rXG4V+ojbQDkDaod+NNLnLPzb+Td8JiUoepCaBBr7dxFMf2XJ2qxHjoLnFYFN/nepQLhn97nuNrEPHXayiholTtJ5UuVhEFkc/iaP3YkXKRYcB2PshnkW6L16HSUnjG9lHbD49uGJifiYb0kUWrFwiotwV8sY1iLG5eOlpGdY9iC5gxgQJgI+qDpedeM9MYbQ0TimTQaujbenl8zOF6YZRt2Tvp3s25H4z+Fhyl2keXZHd+IXqEHEIPyObIQNTiNTPXVm8Jq9Mr9xm0BV/OyVIXgDUO3sPuR6UYMUcK8eXn4MlZDQVpnQX+eHsJWin8KOC6exmVb2dXuTcQfyxAO+sgLMAjpoUfk7Gq2JkIG78RYA4Bpm146+ZW9oqc3MhS3j886S/Cv6q4q6+PY1B1/DGAUdEoS4iGbdMQnbLQ02xGyT5h9jgvTfltlOXah0+on5SX+Akmio9Cs9BlvC4g708PXkDbLwMuCTsqraMJ2ZUmQtys/pOH0HLMiUr4ag5JJ8GRvmu4swQ0rnlfJ2pz1XwJc1SpmxlyHqTpbeZnCTmLEOy0vFs+nFbW7KadTnCMyyp6+RibjLHkiLQHyH0R+PNJulGYHm0yjH/quB+4gzOOBwanz+pfJgd4TnGm+FlaEqzhA46Fkq68u4AKgfpyZnXdQH26BINlbuQybC84arLUScwe+w4CuwAh46H/dtXCwsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(107886003)(966005)(33716001)(316002)(66476007)(66556008)(66946007)(26005)(85182001)(186003)(6636002)(83380400001)(4326008)(6862004)(6486002)(82960400001)(8936002)(6506007)(5660300002)(508600001)(6666004)(54906003)(2906002)(9686003)(86362001)(6512007)(53546011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkNtZWZGSCsxL3pZeWdyTGxyekVEeHNhZUVzMzM1a2VodlpxL09CeUc4OTBw?=
 =?utf-8?B?a1ZaeVg3ZEsyWGkrVEZydW1FQWZidzN2L3ZjWXNJUTZnSzRpVGxVTHVqMlVw?=
 =?utf-8?B?YnZhdTN2TWtKM3VMWGUzMW5KK2FWY2EwOHkweXgwYzlTN282TEdHSzkzNWtB?=
 =?utf-8?B?dFFGdmFHdmwwbjhJeGJvMjZKMlJXTm5XdlFXemoyUnpWOWhaSzU0d0VUU2ty?=
 =?utf-8?B?U0NDNzVBYkdTbTZWM2Z3bTU1cXloUzFqSG9LRVF5VU15cC9raVlCMm15bjI4?=
 =?utf-8?B?VllBdHNtZWF5RzdtWGlYOGt6bWZvWnphRHpveVdJTE41Y2xXWnVhMmJyY29Z?=
 =?utf-8?B?TkxQNks3cGx2R29RMkI4dncrTk5xVEJibHV0MTA1QzdxWmdDeTBsYll3VGlB?=
 =?utf-8?B?cWpQNzF2NVNIaXdSUGRvelVaRGovMjFPMG9SSjEwaDJFQk5ybHJoQWZEVWpQ?=
 =?utf-8?B?aGNqazQ3VkVyVUZGNUswSDI3SllIOEhkaUZtUVRpRXIyWm9qY094RlZGNXNv?=
 =?utf-8?B?NDRJMHZBbm92TU1nQkNHL0MralNHeUpPVGJoQm45d2dTbHBTTnU0OVp0Tklu?=
 =?utf-8?B?RkdZTGpYZkFCc0EvUFBJY3Q5KzA1Z3hnMm5GOEVDUm5wWnRyMjY1Z2QwRGc1?=
 =?utf-8?B?VmNEclVZVDZkU3Z0RWRhUCtvYjU0Qkc4VitINmRRbjFSZHE0ZUdqRnNLNE9J?=
 =?utf-8?B?UjAzZDBBNHp1YmFYQ01uL21RNzJGTnhkcVFzTTZsSU5NM2h6MlZZZmFkOWRq?=
 =?utf-8?B?WGJSVyt4bGxUazBicElVQ2Z5aGhFdEd5OTZ4VzFML0lEcmM0d0RtV21nRUNp?=
 =?utf-8?B?WWtCZWJ6bHc3dVVGZFZMU2s4WkZSYkJCakRPem9TTHhZTkpKTFhIOHh4SVA2?=
 =?utf-8?B?NHVoSGczVm9iUVJUbU1HTTNjVTJWVkZ6M3dVU2xKZkt3V0k3Z2twOGdFZDJX?=
 =?utf-8?B?eitLVDdvUWg4VTZwcWhpN0tpZE82ZXduK0hYMVNJL1ZLSWJpbEcxN0dqeUhF?=
 =?utf-8?B?WlQ4cC9pdjQrREFFanZYalRNSlNRUlFOaHdPQ200dnpxUlUrUGo3cmpTVmxQ?=
 =?utf-8?B?ZnRYbzNGbS95cmJtQ1VDSEVSbHNLSUloU2NMd01UL0NoZUJSYW1INmpOUXY4?=
 =?utf-8?B?SjVUOThsWGQ4N25sUFVnMTBGL2ZIb1VuSjRibjJKVENaajhlaUhSRGVvNkw4?=
 =?utf-8?B?WkdPZmdXek9zS0ZtVjJnVm9LeW1PR2NWS1psRDkyYmgvbDMveUNzOHF3U0ZK?=
 =?utf-8?B?REhLaXVydWtKNndnbUErbXp2N1IzY0R6aFhxdnRBR1VKaUowbGhpbWFaMHQx?=
 =?utf-8?B?OTRnNGRsS2xTZE5vWVJTNWNFME16cXZFOS82TWhCVzBodkk4VTFYNDVmaTVn?=
 =?utf-8?B?MUt5cnF1ZThVbGgyYTBqQ2FFMVhHKzV1TmVTZm1CWVpOWlJoZnM0elJpcldq?=
 =?utf-8?B?UXlXdHpqNENRNnZiR2hvamE5elcvQnpUU0JVM0lUMERNTmpSM1Q4WnpheDNU?=
 =?utf-8?B?cTcrYjZVc25Pam8zd2hSait1bzFKOHBtcHVNUkRzYVgwdzVtZXlOMzRSRVhr?=
 =?utf-8?B?MGhURXJSbXVmY2tZVzYreTVEc0FuQUprNkhYUkpXWmpBZTQ4ZUNQNG0yakhW?=
 =?utf-8?B?TW1FY2RqdnJPNlo0MmJvbFFUQ2tBVUJFbXhXb3MvbXB6bVNKMy9XOWV4c3RX?=
 =?utf-8?B?ak1IZ0pIdFl5dnVVNlhOMnRKNHJ4UVFQOFVqM2p6QmNvK2psaWl4SXM5SzlY?=
 =?utf-8?B?cnhlVWpHUmtQMHpxVUI5c1ZJZFUrMDJJeWdZRkZubHdEVzdFREtiK1E3Nnln?=
 =?utf-8?B?NmJ5U2JHVTVMN05JcTN1bTJ0bStIN2JLZGxkVHE0VXNPRXpxTSsxMG1IRmdL?=
 =?utf-8?B?SDlxN0h0Y1JHYWtHTm54SlZTcU9tcmZCeUZSenUzY1lmWlFnK0MvcVVKZHND?=
 =?utf-8?B?cUI0SUhUZUo4M0l0Nk9OVGZaWVhSSHUyVEcvSWgvL1lCbzNCRktHQnVxKzMy?=
 =?utf-8?B?OU9hc0xINEpyUEkvTWNkMmVndjh2U3RFT29WYi92R2hkbDBiVTFpN0NPNDVx?=
 =?utf-8?B?S1dNSVoyTndRbVkveVV2cHMzL2JFT1ZpRDI1SDhrTlJ0bVdudXBZL3ZKc2U3?=
 =?utf-8?B?OUVTNjc1QU80aERKNGZFMUl4a1JvK0ZTNXZ5cUowaENFQ3loRlhrelQ2dm9q?=
 =?utf-8?B?SDQrem5wa1QyZkd1aUMvYjZXSDdVL3ArSnRtcTQvYnVZVW4ya3dPVXFaM3cx?=
 =?utf-8?B?UDdtNE1pdWd1R0FVTHB5c0llK203RTc5bGQ1QnVJZnBDenJzYVMzaHlrTThq?=
 =?utf-8?B?OFk5MTkwWDdZTk1naTdpOXA3S3hIRVNVTzBPSytLYlBaSkVFOTRQMWZJNzJi?=
 =?utf-8?Q?/zDPMD81+Yrm+1ac=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 493db85f-9e0f-426c-58c2-08da17ab3701
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:55:35.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjhL785+WwOr5oBDrhsfT0TFS4XY8HmTFwAiz/i8jfnapg4fxfDGMrKe/OaxjVTWlIpjP3onIexPrYa2tnHcYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6779
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 08:45:04AM +0000, Andrew Cooper wrote:
> On 06/04/2022 08:22, Jan Beulich wrote:
> > On 05.04.2022 16:53, osstest service owner wrote:
> >> flight 169170 xen-4.14-testing real [real]
> >> http://logs.test-lab.xenproject.org/osstest/logs/169170/
> >>
> >> Regressions :-(
> >>
> >> Tests which did not succeed and are blocking,
> >> including tests which could not be run:
> >>  test-amd64-amd64-xl          18 guest-localmigrate       fail REGR. vs. 168506
> >>  build-arm64-xsm               6 xen-build                fail REGR. vs. 168506
> > Urgh:
> >
> >   CC      hw/virtio/virtio-bus.o
> >   CC      hw/virtio/virtio-rng.o
> >   CC      hw/virtio/virtio-pci.o
> >   CC      hw/virtio/virtio-mmio.o
> >   CC      hw/virtio/virtio-pmem-pci.o
> >   CC      hw/virtio/vhost-stub.o
> > cc: internal compiler error: Segmentation fault signal terminated program cc1
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <file:///usr/share/doc/gcc-8/README.Bugs> for instructions.
> > make: *** [/home/osstest/build.169170.build-arm64-xsm/xen/tools/qemu-xen-dir/rules.mak:69: hw/virtio/vhost-stub.o] Error 4
> >
> > If this is going to recur, I don't see what we ought to do about this.
> > This doesn't look to have any relation to the recently added two
> > commits on the respective qemu stable tree.
> >
> > However, if this wouldn't recur it would be similarly alarming: That
> > would suggest the build environment to not be stable.
> >
> > Thoughts anyone?
> 
> The version of debian was recently bumped to work around the usual
> OSSTest issues when it gets too out of date.  Guess we picked up a new,
> broken, compiler.

I think the compiler is not tied to the update.  The update I did last
week just rebuilds the network install media to use a new kernel,
because our installer kernel got out of date with the modules on the
Debian repos, and thus loading those would fail.

However the install media doesn't contain any build tools, so we just
pick those directly from the Debian repo (using a cache, but that's
not tracking a fixed version of the package repository).

I guess we will need to see how recurring this is, and whether we
should take action.

Thanks, Roger.

