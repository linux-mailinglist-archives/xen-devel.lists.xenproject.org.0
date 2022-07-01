Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7556370D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 17:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359100.588475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Ik8-0003ol-Jc; Fri, 01 Jul 2022 15:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359100.588475; Fri, 01 Jul 2022 15:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7Ik8-0003lt-F3; Fri, 01 Jul 2022 15:39:40 +0000
Received: by outflank-mailman (input) for mailman id 359100;
 Fri, 01 Jul 2022 15:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ipL=XG=citrix.com=prvs=17451e3f9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o7Ik6-0003ll-RV
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 15:39:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c9ca2e-f954-11ec-bf74-3be3494bec92;
 Fri, 01 Jul 2022 17:39:36 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2022 11:39:18 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL1PR03MB6166.namprd03.prod.outlook.com (2603:10b6:208:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 15:39:16 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 15:39:16 +0000
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
X-Inumbo-ID: 01c9ca2e-f954-11ec-bf74-3be3494bec92
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656689976;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LYanBdlKAw+vqB6zChSTOgMWRjYS3VF/IYRLV4L9NOk=;
  b=VqOtK8q+2CXV/6Ya6JNevriJq38rbHxpsB7rhHsbTj3egovzGQqXqnpd
   cr1ooL9DF3lvejhjPWssxJFtOwuqyS+estBH+pM1BSEfJres1rhm9eTWT
   G00MCADCAb05ivDtYfL9JXz/00SEUfFAXdST/dhG7SRgwOIXXVvfqs21S
   0=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 74733924
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8Kvk7q5EPyGodWrEbFe/pQxRtE/GchMFZxGqfqrLsTDasY5as4F+v
 mscCG+BPa2IZ2X8Ldt+Po6z/EhVuZ+Ay9Y1Gws9/CxmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YfhWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSzcit2H5SUvNgDCTd0VAZdH7JI/Lb+dC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YGjV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IE9wnO9PBri4TV5CdI8bTjCuX/QIzJGdhSn2HE4
 VCfpHusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/Y5lifD21dFDpZMoV45YkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSfDdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:gBihR684YR/ZLQ1omwduk+E9db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlGl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFfJccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiT7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri+knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYd099RrBmc8a+d
 RVfY/hDK48SyLaU5mZhBgl/DWUZAV+Iv/cKXJy+vB80FBt7QNEJgUjtY8id0w7hewAoql/lp
 v525tT5cBzp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.92,237,1650945600"; 
   d="scan'208";a="74733924"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NA+sqryvnzdNisLx1AOlCRqWe2hhceNuDHhqEbxOtNw2pOrDUvfq62KRPd20TNdmue1MahHjiF/j7MMMWS16exMLYrW98FN9QScaIaLEvtqNiIIq/Nt28nzgpfxvy4kCJBYS3VfkBuI6XWYywONrnao2OMtj9E/oYOl8NGoFYCM6gTJ7+WQIiUJHwiEcpPlH2hrZOTxYxAxAZ1poTJPeed0QATyL+X2gZZzSXwo6QStgZVFnNAIFKImAafEpL+UoeuGbeKwqSg6y8W4T5T9MHKXZQo3ypkyMRuwj/gWfHTnphkX1DlVIYyxcpsyLtOwuVMDD+dVLR6ykHSgDjZcY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC3wSuavPn/K9iai5dYfJ1QmehkvlhTiGC4MguvcBEw=;
 b=eJGpjxIvTEWhMfvyUlU7B7PejWr5AGAxvU0DRdGhI8lBhboY00zYEl3WeoqvgEiMk4gbcOTLebjZNBjzlVCwuV/yZu/ZrjpA+GGR+DVzK7JJ2MuXGx8E2DkD+jaS3IO0ezohLiFRx1vZGYyZcDeO49NEsYGnUBIUoTR22+7gmkDKE9jOgMrjOZBgjTofu8GCSMPfR0txW35dqWJQCLFF19T7WnQRhLmj4T/AOQCUkA94W6W5N12Eku0psur56/AubntnWZ2KsyDaBzUTRn7faWjT70gukhqPI+RAYcGOFQKsp+I4jaYwy80XNUFQPmwt7C7PWNqauN5J441gW2h2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UC3wSuavPn/K9iai5dYfJ1QmehkvlhTiGC4MguvcBEw=;
 b=eBBHRdnF1FPlhbfHTkd5qp2hRMkTS/8u3xO6H2gQQr6ZAkw7ukjtl2ETX1HmBafoxKoMtWKCpUsMQ1pVoWhEcYRzVbxwvbqrxC4KAJDpvdQBNzA/pfLf+g7NnbfZv9MQdIY9TMq2qm4+xqrJv4UsjmIzZk5cSfPTTOqbL5IlRK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 1 Jul 2022 17:39:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] x86/lbr: enable hypervisor LER with arch LBR
Message-ID: <Yr8VH8EUahBV0p7B@MacBook-Air-de-Roger.local>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-3-roger.pau@citrix.com>
 <4a193fd4-deb3-12c3-2faf-eed33e7b52af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a193fd4-deb3-12c3-2faf-eed33e7b52af@suse.com>
X-ClientProxiedBy: LO4P123CA0623.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2496bf6a-4bd2-4904-9230-08da5b77db10
X-MS-TrafficTypeDiagnostic: BL1PR03MB6166:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3mdvlhyKObGiFZkWlSTd8HLxbD3CxgPBkEY+1ci1IVNwMZCSzwlbQjqxson0p9hmk+nvClEedixtOVzsdthUyPHyzrdKOo+3LRr4vAMDA+Nfue7wrb6cMvkpblvu7vmyoeZTVShkjUuGeXdr9t6sMGHt1a2HJIe4W1But8YfNqyDMOFR0yhsCBeoayKmc/5yUyW/8ucnYV9KquFDGmuxpQkcY8+avTDKXUPtTkfY5v4E4NyzdyK3yii1g3WvX/h9wvHhg/gCIZ2wrw6mezFVB+evW2B345hbJ7MQKXXkFXexbEIVDrhfjcu8IqheIyjYkN56W0vf0/ym96EhGsDBwRuXT6CQrqdgItNhl6B8dkpCBd9Vz1t1vHcAyoolIgSU361Ry37fQ6DGarwiqHgSuiYZ1L0bMZHqsEx8bbIv2S/u5E1+D3MmMJNiF+3IJX+KFDz46lzqjDau8Jviszz6YUB8KBns5tqX9oB/gNWA1bL9Je6BVgrNJbst7IMEVNwkkqZEDictSSU7aTGH9t+4C9rxkQucBbt9xTq3gz6a93FAHu3aCClsDEjYcidbEy7igGpigOF7cIiKNr8xOm+VBZL83vVy0bEJaWQZRD5rwdYoOhzq8KzyKb+tENx2lSuXH0RiE3EvMztoyF+fnk6K6HwKoO9dIJ8qi8xOS0UXvB3t9/YbLa61WdXdDZwe9kSHP8O6frNAyNInfQtu4qlQemE0D3M9NwOFkbnp7brqMMHA8xhIka9ZnIdgpvpNmpKx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(66556008)(5660300002)(6512007)(66476007)(6506007)(66946007)(316002)(4326008)(6916009)(41300700001)(86362001)(6666004)(8676002)(54906003)(2906002)(85182001)(8936002)(26005)(9686003)(53546011)(478600001)(38100700002)(82960400001)(186003)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXhoQThvMzM2K3BMZGp6MFRwQWNHUjhVd3hzSDRVaDFMcTJSNHc1d01JeWdq?=
 =?utf-8?B?VFZIeEVic0k1UE94bE1LQlJRVmZ1WlJCc2RxWm9JVFZMaHE3MWp3V3E3Y1VY?=
 =?utf-8?B?MnQyZXhSMHR0dGhuc0dVQjdWN3RBTjhJV2xNSFhmVXFNM1U2Q21nVlF5U0dq?=
 =?utf-8?B?TlFiaTZzbkhIUFNrdnJ1YjQyMHp5bWZ2WXJ2R0FrdDNROVFLbTQ5cFB0OXdM?=
 =?utf-8?B?U1dNVFBQTHphL2hKUE5XaHlZLzZhOU5wK3FsK0o3cjkzM1hSdEYyeFNaZW5w?=
 =?utf-8?B?clJmNTNVeENXcDZla08xQk5XNVFjNmgxVjFzQllFOUZ0MzNTSENCamJ0WURs?=
 =?utf-8?B?VkVRUmFwWG5ZYVFxSVNhWUZiTU1CTDg2Q1V1WUUzZ3htNUJHRDdvSjQwM0li?=
 =?utf-8?B?UTBLblZ5cHVrN0FmNG9Lc1l2Qm1HK2pueXZvWGpUZHF6RnVmT2ZuOUl5emZ2?=
 =?utf-8?B?UThIZHZ3YUlGUXRWNStuNGU0WlpNa0YrbXA5WDRGUzZBZ0ZUdHNxVVhSNFlj?=
 =?utf-8?B?UjBxd1F3VktLUlViYm1HYjRkbVV5cnVMa1NnY0tmYlNHWTREc3QrakZTY2tX?=
 =?utf-8?B?YzRNNnlQRkFFK2NOSUFKcjVqT01jNEdZdlFDM2NLYzBtNGNNbTdDeXBiNEFK?=
 =?utf-8?B?ckhkWHlSem54dERrUlBkemljemVGYjNjL2c3eEF3Z3hrUTdrWU9GRWpXbTIv?=
 =?utf-8?B?Zk9PL3BacjVUZGZCZTRydnZFUkJ2bStJSXdDaGZvcjVWTGVkMmY0amZuZTdN?=
 =?utf-8?B?dFo3UUpseHkvK3RSbXlhTk8xM2pSVmJMdTFPeTdyaVpwWGJCdnZlRGdaSlVN?=
 =?utf-8?B?MjlOaE9NSm02S0JaOUNuM3JVSGxsejZ0RnppSWZmNHBLWUJZS2QyNGxrYThH?=
 =?utf-8?B?S3ZGWXR5YnNLT0NGK0FlN0grMWNaRlc4cmU4eXVOTXpOZk83L0d2WFM2ZkxV?=
 =?utf-8?B?NGFhNGFhMHpBNCt0R3Z4WFh3TjZyamhMQTgwQ3pPN2VMYkRBWkExQVZ2OG01?=
 =?utf-8?B?b284NzFhbXcwVWRVMEUyYm5EUHliQ2VoTWFGbDJVNTltSUdNTVgyZXNlN0pT?=
 =?utf-8?B?UmcvQ3JZUGc4aTBpL2I4M2NEZ0ZjY0I3VXN3M2pWV21mT2wzNjUyQVlsV3dM?=
 =?utf-8?B?SnhIdFd0aG9WQnJNY1pDVFl0UjFYUjhjNzA2eWtzWXhHVkJ5RHBTYU9FOVBM?=
 =?utf-8?B?WEJmNDQ5Z0paNldUcFdtZ29sd01GUFdidTV3V2VUVVkrMGRUVG9jemx4UHp2?=
 =?utf-8?B?OEZONU53RzQzZjloK2hpdmVCTE1kOEZRalgyUytoZkd1Vlp2SGtBSGhUWnYw?=
 =?utf-8?B?L3FNU3ZTTXdJUXVETHlpMmZPbTZ5dlE4d3BPYm5XTHN3L2dYYmFYMHRwNDl5?=
 =?utf-8?B?alVVbjhWeS9odWVaSGpTcXdZc2pBajFJNFJIeWppTnAwK2gxY3RzSDVudWJz?=
 =?utf-8?B?a3Nremx0ZnZFQUZReXVuMXk5S1QzNVN6VnhtdURJdktsL2xZUU9iYkNpOXBR?=
 =?utf-8?B?TEd0dzZLOEVwQzdNcnQyRm83K3l4bzMyNVlqMXkxeGJaWFpLcEkxK1NOQ1dJ?=
 =?utf-8?B?ZU1nUTZsUkZWMHMxSUV6T29IY1dDUTQrdEtmRElnaFpxVmMrMzVKeXZZMVNL?=
 =?utf-8?B?VEkwUUdzeTNnamNRQmg0ek80QlBhNjdoa2FDT2N6NkNVdDdPTUhTUGh3Y3R5?=
 =?utf-8?B?d1JDWStYclhnTEtMVVI2NVd4WmpGamd1V0JGd0tBcFd5UDlRWkI5TGJ3aStw?=
 =?utf-8?B?am8xcjFvNEsvWE5CaGdhT1hWMWtSbysrWUwydWNzVkdVMnVXVlFNUXBRUk5G?=
 =?utf-8?B?TnBZd3JoKzM3VnRsbCtMeEIzZ0lBOEpaQVA1WlZKZlpnNFMzRzA1ejBSazdp?=
 =?utf-8?B?UTRMMmw1MjYwdGFVajZwd2g3S3BvTnpjbTBHQkNYM2dZUldyUHhMei9Wb2tH?=
 =?utf-8?B?cCsvZHJUSVZwZ05ZdzB3NkNXWDRVMi9iUTByRUVUYWptTFV1WW10cCtUcFBp?=
 =?utf-8?B?QWVtRmdoZ3U0WHVxVmZVR3Y2WXM3eWluWXIvZEQrcVJ4cnZyRHNtZGwyeFNK?=
 =?utf-8?B?bU5rcmpxYWo1OEEySldGVlpQQlhKOFNHd1VtaEZRM3h5Y241amRBdU9JU0R4?=
 =?utf-8?Q?JAkqvZQuhBOFtMeJ8mOXz56PL?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2496bf6a-4bd2-4904-9230-08da5b77db10
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 15:39:16.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mV2UZ3dsNdL9GcmiyzNc+pQ0vD7F07QxBSefcMrqa2QMcXkHNE06EkQHjRZj7k4jfsWl6tCzM++qyyQwetlMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6166

On Mon, May 30, 2022 at 05:31:18PM +0200, Jan Beulich wrote:
> On 20.05.2022 15:37, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/msr-index.h
> > +++ b/xen/arch/x86/include/asm/msr-index.h
> > @@ -139,6 +139,24 @@
> >  #define  PASID_PASID_MASK                   0x000fffff
> >  #define  PASID_VALID                        (_AC(1, ULL) << 31)
> >  
> > +#define MSR_ARCH_LBR_CTL                    0x000014ce
> > +#define  ARCH_LBR_CTL_LBREN                 (_AC(1, ULL) <<  0)
> > +#define  ARCH_LBR_CTL_OS                    (_AC(1, ULL) <<  1)
> 
> Bits 2 and 3 also have meaning (USR and CALL_STACK) according to
> ISE version 44. If it was intentional that you omitted those
> (perhaps you intended to add only the bits you actually use right
> away), it would have been nice if you said so in the description.

Yes, I've only added the bits used.  I could add all if that's better.

> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -1963,6 +1963,29 @@ void do_device_not_available(struct cpu_user_regs *regs)
> >  #endif
> >  }
> >  
> > +static bool enable_lbr(void)
> > +{
> > +    uint64_t debugctl;
> > +
> > +    wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> > +    rdmsrl(MSR_IA32_DEBUGCTLMSR, debugctl);
> > +    if ( !(debugctl & IA32_DEBUGCTLMSR_LBR) )
> > +    {
> > +        /*
> > +         * CPUs with no model-specific LBRs always return DEBUGCTLMSR.LBR
> > +         * == 0, attempt to set arch LBR if available.
> > +         */
> > +        if ( !boot_cpu_has(X86_FEATURE_ARCH_LBR) )
> > +            return false;
> > +
> > +        /* Note that LASTINT{FROMIP,TOIP} matches LER_{FROM_IP,TO_IP} */
> > +        wrmsrl(MSR_ARCH_LBR_CTL, ARCH_LBR_CTL_LBREN | ARCH_LBR_CTL_OS |
> > +                                 ARCH_LBR_CTL_RECORD_ALL);
> > +    }
> > +
> > +    return true;
> > +}
> 
> Would it make sense to try architectural LBRs first?

I didn't want to change behavior for existing platforms that have
both architectural and model specific LBRs.

> > @@ -1997,7 +2020,7 @@ void do_debug(struct cpu_user_regs *regs)
> >  
> >      /* #DB automatically disabled LBR.  Reinstate it if debugging Xen. */
> >      if ( cpu_has_xen_lbr )
> > -        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> > +        enable_lbr();
> >  
> >      if ( !guest_mode(regs) )
> >      {
> > @@ -2179,8 +2202,8 @@ void percpu_traps_init(void)
> >      if ( !ler_msr && (ler_msr = calc_ler_msr()) )
> >          setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
> >  
> > -    if ( cpu_has_xen_lbr )
> > -        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
> > +    if ( cpu_has_xen_lbr && !enable_lbr() )
> > +        printk(XENLOG_ERR "CPU#%u: failed to enable LBR\n", smp_processor_id());
> >  }
> 
> Isn't enable_lbr() failing a strong indication that we shouldn't have
> set XEN_LBR just before this?

So I've now added extra checks in calc_ler_msr() so that it only
returns != 0 when there's LBR support (either model specific or
architectural).

> IOW doesn't this want re-arranging such
> that the feature bit and maybe also ler_msr (albeit some care would
> be required there; in fact I think this is broken for the case of
> running on non-{Intel,AMD,Hygon} CPUs [or unrecognized models] but
> opt_ler being true) remain unset in that case?

opt_ler will be set to false if calc_ler_msr() return 0, which is the
case for non-{Intel,AMD,Hygon} or unrecognized models.

> As there's no good place to ask the VMX-related question, it needs to
> go here: Aiui with this patch in place VMX guests will be run with
> Xen's choice of LBR_CTL. That's different from DebugCtl, which - being
> part of the VMCS - would be loaded by the CPU. Such a difference, if
> intended, would imo again want pointing out in the description.

LBR_CTL will only be set by Xen when the CPU only supports
architectural LBRs (no model specific LBR support at all), and in that
case LBR support won't be exposed to guests, as the ARCH_LBR CPUID is
not exposed, neither are guests allowed access to ARCH_LBR_CTL.

Note that in such scenario also setting DebugCtl.LBR has not effect, as
there's no model specific LBR support, and the hardware will just
ignore the bit.  Also none of the LBR MSRs are exposed to guests
either.

I can try to clarify all the above in the commit message.

Thanks, Roger.

