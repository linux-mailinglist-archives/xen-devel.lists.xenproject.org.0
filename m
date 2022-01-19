Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3245493A06
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 13:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258812.446156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA9gn-0000Wn-QE; Wed, 19 Jan 2022 12:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258812.446156; Wed, 19 Jan 2022 12:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA9gn-0000UV-M7; Wed, 19 Jan 2022 12:03:45 +0000
Received: by outflank-mailman (input) for mailman id 258812;
 Wed, 19 Jan 2022 12:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXRn=SD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nA9gl-0000UP-QF
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 12:03:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d63f5756-791f-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 13:03:40 +0100 (CET)
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
X-Inumbo-ID: d63f5756-791f-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642593820;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+hcRZpUw+8LijXGFDaP+uVYDP0lImUfOoE8UOQdWdRU=;
  b=eBCxwdhZxYCoojD8ULl8Nrc4N8OmXpzoic+Du+WxiEtmjtjpx3kgn6Wc
   WIQW23fmgAIU9haAbjrX1KJuOaoi9S4LStLgU0hQqweUzqH7N41wqgAgi
   FhkD6y9nFM2FmM5xkXQrjjT1JVloidubUIjUd0/tjWpDvGynzn4VJVxFL
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jvMCmv4cHK5Z4uALZ3Lq0A3C9oVmsCdRtKKlybDhQjFXM2/ICjLdHwIHrM3RwJ2y54oNU6bN7X
 DLeM+LP8Xj0d2aT6c6Tr/7CFbkk6g4hO+c4kZAe4ojtA86dFVM+yETp6FYqeeODBBpCa+Z/MTh
 bs8rGm85PrKBxva3/fFPcTwZvE+9UHSJyzaq/aFtCDfnzkncCMfQjX0aFaUGERCP2VpREDt5Ym
 z4AY/+1+QI/DBgEYsDRlEC6/jvQNVSMK5gsMBW6NEXd9P1AFoFszpLBmzJojWdw6mIFLlvPAWy
 Xv304our2pwglbyqxwXUQTTI
X-SBRS: 5.2
X-MesageID: 62708775
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BCdBYqNKUZvTSR/vrR1EkMFynXyQoLVcMsEvi/4bfWQNrUp3gzQHz
 mIZUWCOPPaOZGPxetwlYN7loBxUv8SHzdUyTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Esyw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyuuo/Qyx
 /xPjqCfDhkWAvPcmcobYiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uQuocIg2ht7ixINfbgY
 o0GYyUwUE3BRz8SMXQ8NYkTsvj90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVQTqEhD2LlxwnZ/UXDdIGthGM5Kzl2lPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNhr1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AjPNAuBRPtfNi2mUBb7zt6YowGGxFAjpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxoSP4JNwKv28kfS+F1/ronxezM
 Cc/XisLtfdu0IaCN/crM+pd9ex3pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pDjdcDm35vrUuOFcGT50n2itK2OS/KIYrpxXPTNIjVGove/lWMm
 zueXuPXoyhivBrWOXiIodVNfAFTfRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:Y2pRu6xvt0yg3Mhc/yhMKrPw871zdoMgy1knxilNoHtuA6ilfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0ADEQL2KhrGSoAEIdReeysdtkZ
 56da5wEdvxCkU/o/rbzWCDYrEd6ejCybuvg+jGyXdrUEVNUIFPqylEKivzKDwReOFhbaBJbK
 Z0IvA33gadRQ==
X-IronPort-AV: E=Sophos;i="5.88,299,1635220800"; 
   d="scan'208";a="62708775"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsHNGjmSgwc9jB50b6CugQ6v6hOedaQV1KGkCMi2jwNpKQw3wkG4RiPkhf1m5scIB2F7Tl1fK2E53hnTevGX/Gudo0Q8I4Npms/72FtTSbAvYuKQ6UvqhNFtIxjET8ZWn9nRH738pbm1/NVvLiMz6VU5j5Lu2my9jhlq5F4rdgchImot/RY6U8CJb/c7JCW326DhzUaxXTyPc7RcIt2ciT87UQABvUCJbb/iP3x86RlidMDhXCetBIZFWVTg9r4czXGn618UgwWr6YX9tpjzG33FUi93xYp40LzGS2o9rFPLFMOn7zyPRbNcXiE+p3L0FUGNNczwmNlr9WFY5Pw2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLDoJGqeyVOqoYGF1B9eA2OtkKsDK5I4ihKh3wUrkw4=;
 b=O14oxO59KqoApPo55h3nQRypJNdW/WXfpNEX5BkJprDIpS3SUK1AgNfwDQ+rRUNaLl9At4iU/LRHTrM4JHqaX0uEklUVgeTjQnyLUWW8ahdaLc38lrIFMHpNBlpHyv1S/STMvuCSFZ3uS+d2EdZgtSeCa+AcEkeS6jSTd9ICXHTvNZWHhglv/fjC9EDdvJcsUw3dI0V73YcvPdv+HI7NFlx+FquudtR1vngVsl5ys7WBXvRxA7KpLpjPA9ejl/s885UuwQLJ+DsLTpeW6+qYnGPO1yvWB1XboJCI312iocSyb8pr5k1flJBE2QoAVJYXlIKhh0kVQRW5pP0c2dC27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLDoJGqeyVOqoYGF1B9eA2OtkKsDK5I4ihKh3wUrkw4=;
 b=dikk668ULbYEOpsvscMeOkDG6Uan2u6do0j9fOUMiWE9DaJxmUorA9LAVgY/8DFtbXo6Ta4D0fMueXB8/J6BHcTaayykfwpePwt9wNYJ8mwiGdc0I9D0J9Gc1VTV/A0R2KqkhQ+Lz3uQGRnk/DExXMKRWLyzBjxH9OH7oWnycpM=
Date: Wed, 19 Jan 2022 13:03:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/5] x86/mwait-idle: add SnowRidge C-state table
Message-ID: <Yef+ClTpFgXSzfuL@Air-de-Roger>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <b21c106b-b852-b4f0-efa9-fb5c465bfdac@suse.com>
 <YeaTqyt3ZoFTx/Ee@Air-de-Roger>
 <3bdf57ab-d658-f26f-6ef3-23e08aaf5aa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bdf57ab-d658-f26f-6ef3-23e08aaf5aa4@suse.com>
X-ClientProxiedBy: MR1P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e41e1770-fabe-457e-0e38-08d9db43b48a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB625663C61032B312E99A5EB08F599@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPtmG0cEGsf1mp8ZpE6qUHeSmEismumGyhjT3bSMiKkJ1UOyoWMTnEg93o0UW4mzfaGTIqO/FC/r/mfHbS+hrQbsl5UnoK9UNA5EUu3uqmhKxsXBjWb6WS7XipAHrwrpv8CyEFi76qVKD8nwADap9gGBKdPTwrAQHr1VGaEdD0pJR8RsF3JatFZk27CM9hgsKphWdvCz/LilK+cPbGVGRLZa9HD5GUfnaOxcY5SLHl1aNw60M1tiCqMxvzYupgipCwOsyrpCBMnQE58cLvdcnF/8DNYmFQRax/l5yzZTnqLccHbahCV1u5luB/GfW4VKrc75UkOo53uWEbQjZCRpgOA+mGbww2l5k7cBR81b9GOWwhaxj4kMx89EInv831itIdfPLINGb8AT8iwxprSRdaVfo7FQzXVTkotCmK1sHM+v8nm+IcRXj1l0MsHTQIu/BbR34UfZYnnBYiGxRdMrp2tA/jR/o9EmNQCfE6bhjJwI/twbYWoIs72hH5KsV/tJg1eG+Ns/JxqqjSGPD7w0AUdcws0s2qmFlEWMy0k2yQQye6YhCimKcZDNPoPXSpU+N2pYbc95mrx7HPU1vvt0iWCVlhQ98FLAClGr2WEsDajcwB0dVYGeVrYXro/26NY2GWnRZTZJQ8JVxI+o3jUeTuvHetDtBUF6G+hgLrgOL11sA8xbgY+L/kbh6fRoqXB5Guwe7d0Fem94CD6wtTBcRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(8936002)(6916009)(186003)(508600001)(6486002)(2906002)(38100700002)(82960400001)(26005)(4326008)(66476007)(85182001)(86362001)(6666004)(33716001)(66946007)(8676002)(5660300002)(66556008)(6512007)(9686003)(54906003)(53546011)(316002)(6506007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHY0N2dIbGlGTjVINkZIYzgrd2hwQjdkYm4wYTRMSXprMVVSYTBoT1l5bC8w?=
 =?utf-8?B?UzF2ODdkVDV0NCtqR09ZUUpUajQrSVZta0lKS3ZDUXM4dHJ4blFiVDlKRzND?=
 =?utf-8?B?TjlaK2hjcmEvcU13UnQzN2RiZnhwTkkwby9WbldIZDRkOG1hbTdycDZVbUpK?=
 =?utf-8?B?VmVWbFJOc3h1aHkwNDdKNmhrWldnMnV5OFB0Q3BlUTlnY2tTVkRlUTkzbEQ0?=
 =?utf-8?B?VVVHUHhLV0xiSEJRNkw0a0pIMnlzdGgza2s1ZHgzSHBZL1gwN1hXSlBoUVZ4?=
 =?utf-8?B?OEdkUnVweFVKQ0doTkljTldKbDVnOUdhNlhyNWpYa0tKbUUxb1NacC94Y1ln?=
 =?utf-8?B?K1hXVWpTcXlOMGZ0QkJyRlpuZTFSM1J1MzNvVEJickY4ZDNGa3djd3RZOHJj?=
 =?utf-8?B?Y0hqZ010VFJrSkludzA4MVlwRTJzdmt2eDFOZ1FNNFQzTk56My91Y0M5LzJE?=
 =?utf-8?B?Z205bU50M3hBYit4QTVza2VpaDZnSi91OThrdEVTc3NKYkluK1YyVE44K3Vs?=
 =?utf-8?B?dmp0RVFyUUdVRW9tTXpFcWd5Mml3cHNCWFlDZ2dDSCtPMmlEb3ZyYllkS0tT?=
 =?utf-8?B?ckFUNllKZ1RxV0J4ZTUyTGFNeFE0elFoVHVYRjk4NDBYMzYvZGVyVVhpWEMv?=
 =?utf-8?B?d1Q2VUc3TmRQRXhrQWlSdzJPdWgzV3F2QnI3eUk5bkNMRGZmdGhqWmlvYTlv?=
 =?utf-8?B?N3dpcDk0VVVNUVVrSlUyeUFZcHd5UG1jeVZ2NE9IUHp6eW55OCtHbVRzODJL?=
 =?utf-8?B?ZEliRS9HcWJPeUhyMDJ4WGNLeTA0SlE1N21NWDlzV1hQejhLbEd6M2VLaFVM?=
 =?utf-8?B?NlFVc0Z6Zkd6RGFJZGpGMytzNWJwOUpKN0o1anRzc2pTZWxaZzArRUx6Y3Js?=
 =?utf-8?B?TFlYbk8ycHJNZnNjTGZyVWtMTjN2L21mU1JLaTFLc1RvenV2M2p3dnhwK2s1?=
 =?utf-8?B?QU8rN0V6ckNEbVl4bHNORyt2OGdSQlJoSkk0OGlkdmErRVhrMEt6UTA0cHYv?=
 =?utf-8?B?ckIrU1ZBMlNyaGlEK25SbUFuY1MyZFBSejM0a0JuWktPV1VyVmprQUd5VkJT?=
 =?utf-8?B?bUlMallUTXNqNWFhb3NjcG5vOStZMFh5QUtaR0lRWlJDa2hPNys1T3RYS2Mv?=
 =?utf-8?B?bm1PRXRoTno0NUQyc1ZvMTN6KzNRSkpoZ1NCTjVFQWNFTW9FUUhaTVdVRDNq?=
 =?utf-8?B?WUY2RnVNU2tTNkMzNFdsWDFLRDYvakovRlFVY3BnZksxa1NhVkdVNDBFTGJY?=
 =?utf-8?B?N0hxd093R3drUG93VzE2MFQvRm9IMDJPNWlub1R3d2xhMnVpbVhnakk1bHNU?=
 =?utf-8?B?UWhtMS94cFJMdGdkNUVZVVZ4Sk5iUTZQU2JiSVNUa05uYkt1UC9lUW1Ecjlq?=
 =?utf-8?B?RHZEdkYyek5oTEFSaGVnYnI4cGl5VTRUU3c3SUQ1Zkh0b0JQZmFySEZTKzdy?=
 =?utf-8?B?MElmUHJIT0FIRW9ST0Zjc2plTyt0Z3dPUXVYclNDTWhvUzdSM2hDTTBGVXZk?=
 =?utf-8?B?Vk1rOWN4T3RUZlpwSS9wdjMzTHFkTEZGYUgvbm4zeGZoN2t6MjAzV3VLN0JD?=
 =?utf-8?B?UEFzb3JQUmQvY0daWnNZNk55ZmNyS0c4QlZ3bjJPeWxMSGV4MWxaUnNKcG5V?=
 =?utf-8?B?QytYcXRJQjdnYlRxR2hMYVNERDBuMERwc1pOdnZmN0xYcXhyMStMMVBselpS?=
 =?utf-8?B?cm5aZUdvNGJXcmdaZXRYK1BKOUtlUUZ3ZWZGNlZ4emVxOGFTeDQ5NFo0SHpD?=
 =?utf-8?B?dVZVWlM4SmQwdnloc1o2WGNNSGsrRVBRMEZ4WGJjZWlxaHYycFkyc2MyWTFB?=
 =?utf-8?B?SmU4T0luY1FqWTFUdmFmYlBveVZVYVdxTWRMTGs5L1dTZXQvSHZoOGcxNE5j?=
 =?utf-8?B?SVdNTEkxZW5GZUV3aHJ5aUx4dUx0NVk2eVBQTWZBT1VJd2ppdjRyREM2V1hN?=
 =?utf-8?B?bU9IN0ZKRHJtaHpSVU5aWCtsbHhYQlFnSmVDL0M0VjVYZDBRMTVXVFh5aktv?=
 =?utf-8?B?VjZ4Ym5JSWNLQndUZk4vM1BsdGt6SkxRa3RYTjdlQnZLbTcwZWI3VWR0aGxZ?=
 =?utf-8?B?MlI2UTR3d0FxL3RZUkJnRTFTeHBodTBpVUV0bUgzWEwvR09LdzR0eFJ2MWw2?=
 =?utf-8?B?clJqcTJYdmhWdGpISXlZSXBCeDU4dSt2d0N0bGYrRm13c3E4UWMxazdTM1k5?=
 =?utf-8?Q?A3e1l9c4X3sMWeNdal2Nwws=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e41e1770-fabe-457e-0e38-08d9db43b48a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 12:03:28.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lE5WAw0pEevvzXd5MBXe4h2NCITXqA9pptWi2kjTHkgZpjZx74mIoP6D3HvhE9Lk5d1loOZ7Tk82ub72DUU1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 03:05:54PM +0100, Jan Beulich wrote:
> On 18.01.2022 11:17, Roger Pau Monné wrote:
> > On Mon, Sep 06, 2021 at 03:00:46PM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/cpu/mwait-idle.c
> >> +++ b/xen/arch/x86/cpu/mwait-idle.c
> >> @@ -742,6 +742,32 @@ static const struct cpuidle_state dnv_cs
> >>  	{}
> >>  };
> >>  
> >> +/*
> >> + * Note, depending on HW and FW revision, SnowRidge SoC may or may not support
> >> + * C6, and this is indicated in the CPUID mwait leaf.
> >> + */
> >> +static const struct cpuidle_state snr_cstates[] = {
> >> +	{
> >> +		.name = "C1",
> > 
> > We usually use names like "C1-SNR" or similar in other cpuidle_state
> > structs. Is using plain "C1" intentional here?
> 
> I don't know. We're simply following the Linux side change. If we're
> unhappy with their naming (it indeed looks inconsistent), then we
> ought to make a separate patch on top (and maybe submit that also to
> Linux).

Looks like at some point Linux dropped the '-SNR' and similar suffixes
from the state names, so we should likely import that patch as a
pre-req for consistency? It's commit:

de09cdd09fa1 intel_idle: stop exposing platform acronyms in sysfs

> 
> >> @@ -954,6 +980,11 @@ static const struct idle_cpu idle_cpu_dn
> >>  	.disable_promotion_to_c1e = 1,
> >>  };
> >>  
> >> +static const struct idle_cpu idle_cpu_snr = {
> >> +	.state_table = snr_cstates,
> >> +	.disable_promotion_to_c1e = true,
> > 
> > This likely wants to be 1 because the type is bool_t.
> 
> bool_t is just an alias of bool, so "true" ought to be fine. We may
> want to follow Linux in switching to bool altogether - iirc we didn't
> have bool yet at the time the driver (or the first commit needing it)
> was ported. I guess I'll make a patch ...

OK, thanks!

I guess for the patch itself then:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Would be nice to get those things fixed for consistency.

Roger.

