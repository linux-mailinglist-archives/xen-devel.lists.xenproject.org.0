Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89183609E14
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 11:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428784.679280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtpW-00085G-MS; Mon, 24 Oct 2022 09:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428784.679280; Mon, 24 Oct 2022 09:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtpW-00082X-JH; Mon, 24 Oct 2022 09:33:10 +0000
Received: by outflank-mailman (input) for mailman id 428784;
 Mon, 24 Oct 2022 09:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1omtpV-00081x-3Z
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 09:33:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcfb55fa-537e-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 11:33:07 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 05:33:04 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6171.namprd03.prod.outlook.com (2603:10b6:408:100::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 09:33:02 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.027; Mon, 24 Oct 2022
 09:33:02 +0000
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
X-Inumbo-ID: dcfb55fa-537e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666603987;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o3PxMiKk8fGLdyp/6PCXW4K8zFXNKLvzCqDIn116cpU=;
  b=GLUONP40E/qZvDxpC6g4ed+9k2WzShzAWkUTvY+o+xNiEC+Cq50ctl4o
   tt/bdSk1V7BiPPMkvj7/1N91jETKWEWDAuf2r5l9wqe6LAd0k6G0h2dwg
   3khygy5kCMzg0I8oVi3Z+sCgEBjR+vhpbLIjxZ6qMk/1xw2rzYZ0LB6V0
   o=;
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 82460870
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:U9lT2a8AOl1ib/JdsSvIDrUDl3+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GNNWj+HPKreY2WkedskPo/gpkJQvZGBy9QwGVc4+S08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sJ6JWpBr
 M4BFG0EYC+tpuOZ5baGWtA506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toijw2LefwnuTtIQ6OLi++99n3Xiv/E8+MQAUcnGnmammlRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhRqubyRDHeCrLGdqGvuPTBPdDFSIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:uiEoBaoJkTmQgKZueQ6Vh8kaV5uwL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCAIqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP8f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aiSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7svVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wU9HdwGOtt5Dt
 //Q9RVfYF1P7ErhJ1GdZY8qOuMexjwqEH3QRWvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.95,207,1661832000"; 
   d="scan'208";a="82460870"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac72fGv6sjVJdLMe31238WmUa/2TRmRJp8jhFqNMoPaS9fKiu/ooCKxvguPDZANX/9OTn8oRrDq74GqGBVlPGnE/Z1h14sFV0VEZhyY8PoB24Ai0HpSR0jdlqNGfF9f4DH3F9LHYqEVQlwZkm5a3dqVV9VETIjETkNBBaksKNKAxd5dGFVleWWt9K00XX8XAp60jnPKY/ecVYce/SohwHMu9VShQQFOcDce+JkJ/ZuYT4adlIJgrfsBCITsADNeIGpvcAhVV17Vy4COOfAKzzw2a3PvgDgm9aB2TlSrpDJqJSRfZ+IZzqfkt8DW7nemWkhzZf7WoIBkSVfG8tO/3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=num82eOTp+aDlWsSmX4EjOt+inGJTQzuvs3yD3MMkec=;
 b=SFIKTEC8j5oaCFKlITjXR4r6p2ZmaCwctuxtC0qIGPOetf+AQExyrzCW9Sc86TBJ7JFP9ujtABkpG3ur6yVFNJ0na3BQe1Z2aUlKyeHl9keRwQ5dMPDZYDL/7eiBuq4uyM6qsj0anX4aj3m8wS3vtC7vVXIW2GZP5WWDAwhjZ2Dv07hEzB/kHA+wsWv82nqazhyQvrx8mOgzH03uTT06/AVDuqlXrxA+BQAclrTMWkDMP127uZLrHxgwznDP0CeYuR/1ratzbbnuh6xtDvqFQ1i49LL8V7eqrMXaIp69EUQcK6lf0CIdGOQV+LjoFcccI5XX3bTi+q7KTuqK1fl+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=num82eOTp+aDlWsSmX4EjOt+inGJTQzuvs3yD3MMkec=;
 b=qtBnhoKJjOB1vRKkFw7tpuS66jJVZYcN7jFc3DVoIFitO77UX95mIzy4gJV4JaJHyqPoxfBjbtx+JiRUnB4tEN5+YkHeobpI5imPj9Ljcf60WfjPBsXPr4qfB0jF7i6OUMMU6BG5Y5SmgzhQG3vnn5yT9YXdID4Dr/4l/OPslbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 11:32:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Intended behavior/usage of SSBD setting
Message-ID: <Y1ZbyK3ynB0WYS3s@Air-de-Roger>
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
 <8c7de7ed-6242-f444-55fc-9eb16084b7bf@citrix.com>
 <435610e2-4fc4-6a9c-3fcc-c6d6ab42cdc1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <435610e2-4fc4-6a9c-3fcc-c6d6ab42cdc1@suse.com>
X-ClientProxiedBy: LO4P123CA0520.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: db771a87-f826-430c-6023-08dab5a2bed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UDmn17LVCzY0Oa+bf7s3F2rIS9laNb1C2eiOXNTJ3IRipmKKnRPL7VE54t6MJO9PPYYhTmQPknTZO9F1DelSbOoB/dfI1mJKMT0ukkq++4zMur+/wZjmqPKmHUvhCup62ZUCGmd84lfS+0YhSQIgZ99TQYjUsNRneKGC+NHs0crpLjeO9c41uAJq1hQxJQV4rRQYQgGXdLqIB0WqVOVnFaRAtYr8oAccHAfCKCwy+VYIUqn96Hq8vyXKrCNZ0vfVEoBnmrUXpuW3zLHs9m7t0E6JMgpTk+G33w8nKFzzrMlB3bfeQR09bxd8xEQ5l5WxukWxGosn1mrpZaekFRDmqyNb2DVsRbwW/7iwb/Fw1EYK/yvq2ngtla8L1L/XKS6VSJmVFmjRxskwNbo/oyII3R501UN9RpZlq/ZFz4mf3tPSGPyT6RWmR+JCP3hTzSsNv4iJNiyqFCkzVgHDT9NiBHKGvCNgQhuzbDARDXB6tgXtr8dn6P0Ja+3Nr5GXMR/xaG7CnT88IQwwpWxWW1aVeYD/dmAFjunUwcaa2SPUYiAOLePrmx+KVzSlR6Ql6sXhFeB15WpJnteuUfmIDK1YHbXNO6g3PbKHkQiauRj2GTLw1WpyVCgJOzrMH4vMfxNrGJ2QE4LDZPoEyOnYueBvkv/oVP9r3tmhvFXqxKJ4Sr9DmwtZuiGgZs2V+egEIJB7ile9aN4wnR1qJ55cgivIVRLSE1Dj/jAQZ0hMcpgDySse6cGOk7dVO1Ofh1YhcnY6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(33716001)(2906002)(85182001)(66899015)(66946007)(66556008)(66476007)(5660300002)(966005)(6666004)(82960400001)(316002)(38100700002)(8676002)(8936002)(41300700001)(4326008)(110136005)(6636002)(86362001)(6486002)(6512007)(26005)(9686003)(186003)(478600001)(83380400001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDViSDN0bThMNW5mQWlReHpOOWlRTUUzVDBZNVo1ZDdQUG4vUUhoU24rM0o4?=
 =?utf-8?B?ZHJYVDVpZGo5aWpzM01JNFdRQ1JHc25JSWpnRkMyMkRSdWhucVQ5MjA3c0RJ?=
 =?utf-8?B?enBJRFpiaWN4V200eWU2S0JlYitGUE9mSU9tcEZpNFIvclI4ejhIRXZzWDIv?=
 =?utf-8?B?bmdXR0p2a2JtQ01NUXFmUnhUaUwvSGdQMklJTEkzQlVuZmtGWExXRHBiUURQ?=
 =?utf-8?B?RFp0MTZ6NlhaZS9JMi9vVVp3a2RQdkViM1hkWm5iMTNyTHFwbnl3N2hyTHd3?=
 =?utf-8?B?NXNLMlZHVEdnd2dwZm9SNG5JeSsrNXlxY0RTZjA0dHJRYkwra1JzN3ZJY3Zo?=
 =?utf-8?B?dnAzZi9ZNHNCNmxPMzg3Z0NGYjJOZ0dGU09vcTRQbzIyUVFWVS83RUNYL293?=
 =?utf-8?B?YWNXZEo3dFRtZGNVMzBBYkx1NHlFRXozUTFQb0RUMEMvc3lxeEtqeTVySk1L?=
 =?utf-8?B?emdDRU51N1NZTERPbThCZmx6M3dENzRQdWIvdU0zeTNSWlIzb2NrZU1TcUl6?=
 =?utf-8?B?b1BoakJpZzlaNDFtY1J0QnIrZGRwaWJ2UVRCQlljWnF0dUtYbGRmeVVjQ0RH?=
 =?utf-8?B?RmhJdTIvMk1xbXlCLzN4L1hDaUhrNkc3V2xPYnhRNmN0ZSsydElKLzhzbUlw?=
 =?utf-8?B?MTQ2aVhlcm1WcFp6NmJTa1UyUVFRV2kzdHd5WDdiUDY5VmFWTTZPYzBzdU5a?=
 =?utf-8?B?SHdtTThNbGdlWXBMdStGZGNnWXhhRTUwZzYySnJxdFp4eVpiR2V2eHRDclZX?=
 =?utf-8?B?SmdaV0NTbEo3bzFLNVA5QnlJQ3FIZXR0REVuRUlBWUwwTnE5VjkzYUJ4dUJT?=
 =?utf-8?B?NUpRL2VTZ215THNvNHlnNVMxeFN3anptUjVxaVZSQ1Y2eDRyVDIxZWxrRlYw?=
 =?utf-8?B?YitkSFY3RkozZVRDRlpSUlBjaHMvRU9ydW5YbmtlUnhXV0xzZmNDSklDRkFu?=
 =?utf-8?B?YWN4OTAva28zbEZ0VzhzTnNhOUVOZDVCcUtQZnBKQm1lZS9JdW5TR2lDYys4?=
 =?utf-8?B?UzFKOU1oK1hsL0dGK21nZGwrZW5KUHhNL09tT2I5NkZNYjZnNEVpcWJHeUti?=
 =?utf-8?B?TThnYU8velJaeXpMQ2p5Mm54WmtwbDhBVU9Nc25uTFNxTVdXV0FkZ2pYdy9y?=
 =?utf-8?B?Y0Q5L1lYNDVLdGRhaHdCbjJzK2NFS09rRzIzQW5rKzNYWXRReFo5ZnV4U0dp?=
 =?utf-8?B?Zm82ZSszeW9tb2xUV1hyYmJUVHBYNkFaVmZ3VE9Ka2o0TDdPOUdNNTd6dS9k?=
 =?utf-8?B?Y2J0QWxTVC96Y0NkNmxveFMweU82UDVHTC9SUmhxTm5VaDVsQXBadDlZcFp2?=
 =?utf-8?B?TmxzanBQaUtkcmFQTjZCdHdhMjFVbXZpaGVzZ2ZSOVByVFF6QmNabUM5Zlcx?=
 =?utf-8?B?cGhxcWhXTXhnYk5CaFpCUGhHNVFlM1QwNDViS2htNGlvUmJiNEFmbzZHL0Rq?=
 =?utf-8?B?MEY3bFVGVENRQ2dUYVNCMEk5TGhtOTdDeXJSUVZDdzRtdllQdjAzZ1lJS3l6?=
 =?utf-8?B?TVl4bGdsL3dsMEJpMXRKOThJV0F2cC9EYXZIamNzODU0c0pHT25qdkkvdlhJ?=
 =?utf-8?B?WEN6T1pWMDF3NjdlMzhjOTFMbFd3dGdEeUk4Q1V3NkFHa0psdFpheDJzVjBK?=
 =?utf-8?B?dVlaQnZSNGloZzVVTGJZY3FYYWVPUXR3aEx1MTBjVjJXTmdFWUZmcGlqMXF0?=
 =?utf-8?B?R0RVaHlZZ3RKZnVCYTVXU3FaREpyRnZQOVRRRmdRaXpuQzBpOWw4YnovZUMv?=
 =?utf-8?B?WThjU0llZTc3cEVuT3V3bGNEUEMwQ0pydzh1OTZ5MFNYdTU5cFY3S1Bobkdr?=
 =?utf-8?B?c0p1YU9WU3RkM25zQUowU2tKTkNTeGYrdm53MDVsc3Z5THNmTXU4L080SWVn?=
 =?utf-8?B?ZGNCbVdMU2xJeWVwMVlmdURLUGVMaE4yR0Z6Skl2MmZRaTF3ZXV6NlpZRVJ1?=
 =?utf-8?B?RmJDb0VoWlZTRzllelhZTVAzc09PRldqUXZ1ZmpuWmNYS01DVE8rNWRwR3B6?=
 =?utf-8?B?L1EzcTRab1VIUnp2c2VGSGEybWsycmxtK2lKTkU3alRoQkM4ZmlyNm1reThr?=
 =?utf-8?B?cVVCTnVlS2NpTVBUUTkrd1hRM0thelhYd3Vod2xMRENLNGlZMG0yTmtzOW9a?=
 =?utf-8?Q?xmuI5yCLx4XTpVctcOBan7sYX?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db771a87-f826-430c-6023-08dab5a2bed9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 09:33:02.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFJQWM0kMpDY7JxSjMZKW0ufcE+FMIyvC6DDnvMgtuKtB2+9/64E32jzx+xSYySt8DC+7/aIKcyWg3y/RIX95w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6171

On Mon, Oct 24, 2022 at 08:45:07AM +0200, Jan Beulich wrote:
> On 21.10.2022 23:54, Andrew Cooper wrote:
> > On 20/10/2022 12:01, Roger Pau Monné wrote:
> >> Hello,
> >>
> >> As part of some follow up improvements to my VIRT_SPEC_CTRL series we
> >> have been discussing what the usage of SSBD should be for the
> >> hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
> >> that has an out of date description, as now SSBD is always offered to
> >> guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
> >>
> >> It has been pointed out by Andrew that toggling SSBD on AMD using
> >> VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
> >> have a high impact on performance, and hence switching it on every
> >> guest <-> hypervisor context switch is likely a very high
> >> performance penalty.
> >>
> >> It's been suggested that it could be more appropriate to run Xen with
> >> the guest SSBD selection on those systems, however that clashes with
> >> the current intent of the `spec-ctrl=ssbd` option.
> >>
> >> I hope I have captured the expressed opinions correctly in the text
> >> above.
> >>
> >> I see two ways to solve this:
> >>
> >>  * Keep the current logic for switching SSBD on guest <-> hypervisor
> >>    context switch, but only use it if `spec-ctrl=ssbd` is set on the
> >>    command line.
> >>
> >>  * Remove the logic for switching SSBD on guest <-> hypervisor context
> >>    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
> >>    hypervisor code with the guest selection of SSBD.
> >>
> >> Which has raised me the question of whether there's an use case
> >> for always running hypervisor code with SSBD enabled, or that's no
> >> longer relevant if we always offer guests a way for them to toggle the
> >> setting when required.
> >>
> >> I would like to settle on a way forward, so we can get this fixed
> >> before 4.17.
> >>
> >> Thanks, Roger.
> >>
> >> [0] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#spec-ctrl-x86
> > 
> > There are many issues at play here.  Not least that virt spec ctrl is
> > technically a leftover task that ought to force a re-issue of XSA-263.
> > 
> > Accessing MSRs (even reading) is very expensive, typically >1k cycles. 
> > The core CFG registers are more expensive than most, because they're
> > intended to be configured once after reset and then left alone.
> > 
> > Throughout the speculation work, we've seen crippling performance hits
> > from accessing MSRs in fastpaths.  The fact we're forced to use MSRs in
> > fastpaths even on new CPUs with built in (rather than retrofitted)
> > speculation support is is an area of concern still being worked on with
> > the CPU vendors.
> > 
> > Case in point.  We found for XSA-398 that toggling AMD's
> > MSR_SPEC_CTRL.IBRS on the PV entrypath was so bad that setting it
> > unilaterally behind the back of PV guests was the faster option. 
> > (Another todo is to stop doing this on Intel eIBRS systems, and this
> > will recover us a decent chunk of performance.)
> > 
> > 
> > SSBD mitigations are (rightly or wrongly) off by default for performance
> > reasons.  AMD are less affected than Intel, for microarchitectural
> > reasons which are discussed in relevant whitepapers, and which are
> > expected to remain true for future CPUs.
> > 
> > When Xen doesn't care about the protecting itself against SSBD by
> > default, I guarantee you that it will be faster to omit the MSR accesses
> > and run in the guest kernel's choice, than to clear the SSBD
> > protection.  We simply don't spend long enough in the hypervisor for the
> > hit against memory accesses to dwarf the hit for MSR accesses taken on
> > entry/exit.
> > 
> > The reason we put in spec-ctrl=ssbd was as a stopgap, because at the
> > time we didn't know how bad SSB really was, and it was decided that the
> > admin should have a big hammer to use if they really needed.
> > 
> > When Xen does care about protecting itself, the above reasoning bites
> > back hard.  Because we spend (or should be spending!) >99% of time in
> > the guest, the hit to memory accesses is far more likely to be able
> > dwarf the hit from the MSR accesses, but now, the dominating factor for
> > performance is the vmexit rate.
> > 
> > The problem is that if you've got a completely compute bound workload,
> > there are very few exits, while if you've got an IO bound workload,
> > there are plenty of exits.  I honestly don't know if it will be more
> > efficient to leave SSBD active unilaterally (whether or not we hide
> > this, e.g. synthesizing SSB_NO), or to let the guest run with it kernels
> > choice.  I suspect the answer is different with different workloads.
> > 
> > 
> > But, one other factor helps us.  Given that the default is fast (rather
> > than secure), anyone opting in to spec-ctrl=ssbd is saying "I care more
> > about security than performance", at which point we can simplify what we
> > do because we don't need to cater to everyone.
> > 
> > 
> > As a slight tangent, there is a cost to having too many options, which
> > must not be ignored.  Xen's speculation safety is far too complicated
> > already and needs to get more simple; this has a material impact on how
> > easy it is to follow, and how easy it to make changes.
> > 
> > It is the way it is because we've had 6 years of drip feeding one
> > problem after another, and haven't had the time to take a step and
> > design something more sensible from having 6 years of
> > knowledge/learnings as a basis.  There are definitely things which I
> > would have done differently, if 6 years ago, I'd known what I know now,
> > and part of the reason why the recent speculation security work has
> > taken so much effort is because it has involved reworking the effort
> > which came before, to a deadline which never has enough time to plan
> > properly within.
> > 
> > 
> > So, first question, do we care about having an "SSBD active while in
> > Xen" mode?
> > 
> > Probably yes, because we a) still don't have a working solution for PV
> > guests on AMD and b) who knows if there's something far worse lurking in
> > the future.  Sods law says that if we decide no here, it will be
> > critical for some future issue.
> > 
> > But as it's off by default and noone's made has made any noise about
> > having it on, we ought to prioritise simplicity.
> > 
> > Given that off is the default, but we know that kernels do offer it to
> > userspace, and it does get used by certain processes, we need to
> > prioritise performance.  And here, this is net system performance, not
> > "ensure it's off whenever it can be".  Having Xen run in the guest
> > kernel's choice of value will result in much better overall performance,
> > than trying to modify the setting in the VMentry/exit path.
> 
> My takeaway from this reply of yours is: By default run with the guest's
> choice, while (I'm less certain here) you're undecided about the behavior
> with "spec-ctrl=ssbd". Please could you make explicit whether this is a
> correct understanding of mine?

 * spec-ctrl=ssbd -> SSBD always on, expose VIRT_SSBD
   (VIRT_SPEC_CTRL.SSBD) but guest setting won't be propagated to
   platform.  As a future improvement also expose SSB_NO in that
   case.

 * spec-ctrl=no-ssbd -> Run hypervisor code with guest SSBD selection
   depending on hardware support.

Default to `spec-ctrl=no-ssbd`.

Would that be an accurate?

Thanks, Roger.

