Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34D492800
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258532.445326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9p8B-0007Ng-EQ; Tue, 18 Jan 2022 14:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258532.445326; Tue, 18 Jan 2022 14:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9p8B-0007Kz-8w; Tue, 18 Jan 2022 14:06:39 +0000
Received: by outflank-mailman (input) for mailman id 258532;
 Tue, 18 Jan 2022 14:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9p89-0007Jz-7J
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:06:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d774b12b-7867-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:06:34 +0100 (CET)
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
X-Inumbo-ID: d774b12b-7867-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642514794;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xpZeB98MRvunGHTwdfN1FuWFQu5wd4CHj84sjZpyltI=;
  b=LdatlkXq8xuBe/eJAHvsfJS8asnf9S5ho+TePJCtgT3Sd6xdWClogbU5
   hVZykx+Sy4tpU59VTO6L9E9R/pCX7BRStNu72Bg28n+j6K2BkT1UvEyze
   mywrLnkDqYfPSIbMP24d+TP02RU8w7oKH50OkrZCzeVrdDP79sN9+yz7V
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: r7W+RfDM/OHrA9HBZf7sAf9xmqHNf+29umpYLYfyR5+BXuFk1M5lrvVRbV4Fniq2hsNeh/IuYz
 3r8mmEX2cDyN01ZMMXkJYcjtP1cS1zC57Ejrdo7izjp1l2fwq4+JMRYXI91flx/dp0PGfOUsgg
 VC8sZKhB1BvQ5pdISANowrxuuWGZ7YzbRZm6mYYiJlBAXqqN6WeJi8vj9gGQ8KHOEsieeW3kOT
 bM/OnEUTgjCcWCmjWckRum4GV3PLnts6gi45oMAo7Dp5EXLKlMvY/Tu6Kmfq1yfD7gBu/4Va49
 s9ynxMW5vBr1RVUBT5Hj/Jlv
X-SBRS: 5.2
X-MesageID: 62138822
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GEwWzqhBiYdAswVjfip+c9gkX161gRcKZh0ujC45NGQN5FlHY01je
 htvWT3TP/zfN2TxKNhzad/l9h5Xv8eGyoQxHVY5qHwxRS8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcx0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1g7KWLTgcIZpfWp/0RQxx5MiwvZqR/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3JkVTaaEP
 aL1bxJ1Zh+dXAJ/Z2sYJ85kns2YmWncbWFH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljNFYuFXE8xi0huy06bE5ie4CzlfRwcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPe1
 JTjs5LPhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGsieBs4bJpfI2KBj
 KrvVeV5vsA70JyCN/4fXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQtbcihgW8Gn8pw/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOmHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:VNwmZKkyrRpolSIhsE6PK/2INRHpDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62138822"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFcsE7tv7qygXGJvA00mjvqsASUiJecE52s229tlYLA6WTJLseH8fkb3Wla2gqcribMYagfbKGQcRxgJSyziWE49APXgZSy1Mu9WJGYtE6kzGPSMEqgxrIUev8glol3LRvBPpryJNSB329w+xgfl9PNJIs9MqbDJkQ+RrOMohZVbrGj/qgcfM0W9DulXnjZUVapCIdWXdpASkRy9Y3QQhm9mymzXp52UK5kX8mAb99i3TWxUd+azgPgMGq6CiF7MYjO8083PJL0+utb7zeSA2e8zE8tKHaXA/qlSoHnotu4cai1Ke8ug27qwY9MVKBN7omg7ZbjNhR1Cc3jJn4NaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M0vdyEYS3ZOxqgoOxTEqX6+LI9CLvjLbRdsOhObzdo=;
 b=icJbjLg7mBaNNizXvG//l5pzukB4hwxlQ95tqJaZS/cjn6cacz2fLvvp0JVW6vvdoX0p0F8nEdsb9JV9UT49EOM1JJ4kOtIZBKkXIwENqCwSAseVK6dcBbhpr2oUhUDZsQuLkU7WCY+HmmInnvOg8ZWkalFJ+2g5Vw2yL6PSTAacnsBezrqlsso6heJ0mqD0bm29i7oRHD/6W1W7TBSEvFhewAJdTO+29HhxwpiJzZFDGnbzq5rCeRAniBq/irZYoMJ2tCWZNkSC9w9wvtuPxlN4/p+AnVt2wIrnLSw06GbU6w1TTJ+DQd8W5y4XdKdfhuOJV79m9YUM0LdaOSbqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M0vdyEYS3ZOxqgoOxTEqX6+LI9CLvjLbRdsOhObzdo=;
 b=qLgAG1z8Jlxt4OwCyg6W1HShkGwrw2n5JX1RfPQfYqTwtPbP3ouyl6b6IoGy7VT9cfAjsERXfRjIXV99IJLwznmxZ+LkSSp90NNF/YNsGVNv/GxianbPJAzZ8JU8eoHKAa1fLohPMrEKJdSLGGKvWaInDDZyElQCQXrHdyJIc/8=
Date: Tue, 18 Jan 2022 15:05:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
Message-ID: <YebJPd62a7rB+KTw@Air-de-Roger>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
 <Yea2XRrFn7qCIx/h@Air-de-Roger>
 <4bc4e379-fc9c-581a-3b03-9025e9fd92cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bc4e379-fc9c-581a-3b03-9025e9fd92cc@suse.com>
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681b7d6d-f293-4b3a-736e-08d9da8ba3f8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4105:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4105515D6152061AC68A3B4E8F589@DM6PR03MB4105.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X53f1a7rr6goRgf7BQ7TrZaMSQbkpAnYSVVtLT1ZdIM16M6MD9UnIbn3NclqOHzNVFvFj7yA1oO9/xjX8+t3UCia0fUbR3jKZXekX/6ML3W3/wEXAge3Gcp+TcvkAGn76uIBOvaJVCBGBylLUWvPNTnlTlIUJnx9RM0fCR9sZzy5hoUsUBysjugDLAQdx67AzvywN0Pk/slad6bRgyaA8M2EcLsqiAgZEY9gzYTE5QYo92GMVJvU8vLJyALGu8+kli2RkDZBrYq6vth4P6Oa/jTAmx6FNCJ9fmNPlV2prOX0N90ZlxEyKjJXNChARz0dpHI6szi0jro/tEOhbE1lKXBiFaEdfgFQVAeiaOHaML5KOG40qHAFGyv0IlQMXXdMoU7pRp8grKzdJJfuczwGQ33I/A1zuniy1Ua3p4HIZ9nIlZOlJKxpF8xirIeXK74wC/2AVmMKbVZjXO+qq+o7PaknbaSzpkq3BscIHtD+GnI86qcSl7/Vpnrt+ZflNhh0U1Zf+EFyrpm1hgyNtAXeR2INt/nexTa+S1aFIsdKnZYVfpyrsM30enM+v/XFHmj8E0ZKUpKUsV+sOpcJpp3H6jYOCx9usw+hxm8o14sfm9TqhvakIK6Re5B+TXvktn45RTCSJPguAVy8uu5ZuIKnJeuJQ1pjxrgG6jw0gQb0DzxYMiBmdLQgpoeg8Yd9JwSxevvCjv1jgYUGOg7i0gzEXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(186003)(33716001)(6486002)(66556008)(66476007)(86362001)(66946007)(5660300002)(85182001)(4326008)(82960400001)(6666004)(316002)(508600001)(9686003)(6512007)(54906003)(53546011)(6506007)(6916009)(2906002)(83380400001)(38100700002)(8936002)(26005)(8676002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXBUSFYyRSs5OFdwdk03Y1lpVHNEUlZYcmdaUERONWhWdkNiczZlOENITnF4?=
 =?utf-8?B?RWhSbkVacG4vbkNEcGFvSWJCNkVuUlg2MFFwanNYckNVdUpUcmZ1U25UcFhi?=
 =?utf-8?B?aFlKV2VybjluZXBwcmJYOFFrbnVScDI2Nk4vUzNoeHI2cHlOQWJMZDZ5Mk5r?=
 =?utf-8?B?TE8xQ0dFbytKdHFPaE16b0RxQ096dGZRUXFRNEVxUnVsQWgybHQ0b1dxazho?=
 =?utf-8?B?U0ZvYy8yOWRycExmSXJ2Wm1vOXhxWUk0cEtvaFZKZGZmWVVMYW1QWXlQcktL?=
 =?utf-8?B?SzA0NE0xQldsRE5SWWIwV1llTzBKNGNJMjNuMVAxMWJEcDk0OHRmbU9TVzl1?=
 =?utf-8?B?YWJ1djRCdGMxUDR5ckc3OGJBUFI3aFlnancvYkhldmk5N0pnOWVnNDZxam1T?=
 =?utf-8?B?b0NQRytUU1RWOUFLRnFDMGtSWlJKU29FU25lTko1SXhNT1NqTVhKS0VMcGpn?=
 =?utf-8?B?bnZ3L3JyVThzc1VJRlhqNFgvNDZMYmwyK295MWNVelFTaldNNnp2VjlNZWlr?=
 =?utf-8?B?cmRNUmUyK1lWRnJEYzZZbGJ3dU5CYWJUSTQ3akFLN2pDdVZRakltNC9uQlB3?=
 =?utf-8?B?TW9uS3M5OXd3T0I0YU5zUUVyM1RvaDhXdlNhSEpHRklRN0RHK0xTMkE2Z21y?=
 =?utf-8?B?THBkRHFUdk53QXM4a3hJUWJlSGhodnU1VnVlL25KT3VENng4R09TMXNLRUZR?=
 =?utf-8?B?TzRnYWZkdWx3LzlLN2FUU0t0akRVTENvVjVXV3ZIK3R0b2dsV24vK0RJTW5L?=
 =?utf-8?B?UEwxVndUS3dTemVtSC9Fbk42VzhiMkU5NnEyNmhPOVM4NXFpWkVidmFFTmdz?=
 =?utf-8?B?RVVoWTcycXB5Nkt6MDM5djNGOG5ZYi8zVThmQSt5dHRxaWs5SHp3SHIwem5t?=
 =?utf-8?B?ZFR1b0dNR3Y2cVVlY00wOXl4cFExSlExZ0JTMFd4UFZITTU5MGFFK2wzcnpK?=
 =?utf-8?B?cllRMk9NK244NE1iNFNOdDFsbitPMGNOUkVYZXVnWGRUR3BoMVZOQ3BDcC80?=
 =?utf-8?B?VEV6a0hBR3R2NUFiWDZsS1hCL1l3UDExaVIzeWt3c1BTVC9DK3Z3aWNTNjhK?=
 =?utf-8?B?ZXl3QTY2SHBmdWgwQ2RaNzdNWWJBa29OK3ltVjhLTEx5djc0VDd2VytwL25x?=
 =?utf-8?B?cG15ZEhtZGRKUnAwSk5zOEprd04vVk1KbTlCVElheVd0RkFoZHdaTHBER0ti?=
 =?utf-8?B?Slhvb1l2d1k4T0JyN0tCSkRQbFUzeXRqRnJ3OVBVREdOdXZCZ0VxRmlxQlNH?=
 =?utf-8?B?VERTbkpRVWtNZ3F6WjZMd3BEZnhVNHpOMnE3ZHRjemFRNlhiQUpld2FtMXBV?=
 =?utf-8?B?emhPd1hUbTE2Yy9KaVBuWTV4RU5nL3JTRE5hekphdHllVUgycXlLMjhMMUto?=
 =?utf-8?B?aXhINXdDL0h0NmhFbkZoVVY1SndnSm1qMStaNTlQUEtRa0ZpWDFWL09hU2tj?=
 =?utf-8?B?dFVLcXU4Znd0Zk9LRFBpYlJIRjhqTUEwZkMwaVMvUWJQSm50SFg3ZjN0dFlR?=
 =?utf-8?B?Qmo1TWh1dmRhYjFuTWtlZW5RbWNTYlh3dXZSbW9VWmZEeGFzOWRDZTVmQnFX?=
 =?utf-8?B?QnpBWi9TeThjbStidlFhcEpoOVdyQUorK29SbTl5blFnYTRsU3JuRmU5N2pE?=
 =?utf-8?B?MTdXZjYxUDBHRTY1bXRDd3FUNzR1ZUNabG1ZQXhScW9Pci82MDRwWGJVbENt?=
 =?utf-8?B?c3A3NmFaTkRJMVltUmxSekg1RkRZaFFqL1U1QklUTlJCcENLNkIvODNockto?=
 =?utf-8?B?OGE0dm8wSkdSdWM0TUlISDhKNUxndVloYnFPbXk0MlBRT1hBZDJ4TmhmeTNx?=
 =?utf-8?B?ZjVWQlZPL1FJVC81R01IM2ZUNjkvTUxNT3d2Q2ZVcHRtSGYvN0oxNERJVDB2?=
 =?utf-8?B?RFpkR2U2YnJYMnBZUzFWSzl2ZG9vNDZFL3NVMXF1b04vb3pQc0haRnUxK1FG?=
 =?utf-8?B?bW4xcmc4WjR4aTlqZWlULzlLZUkyQ3NzR2FoZG5lclhpZU5nd0V5UVJ3V0tw?=
 =?utf-8?B?dVhRcXBTVlJKZmR2ZVZxekhIbXR6Y0NZSklwbjdUbWtYVTEvN3ZxRXd6bENv?=
 =?utf-8?B?dVM1YXl4OWY2M24wMW5TQzhkN2JvWTR1Qnd2eXNFSElEUlBESjlzbGZ6Rkxu?=
 =?utf-8?B?L05ucnhibGtDSldwVDdOdmMybGVKb2dGek5IWXVXNFNIQzRNUU1FUjNQVGJR?=
 =?utf-8?Q?uiY/hZ5yj4BFAdXPkiF3FfI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 681b7d6d-f293-4b3a-736e-08d9da8ba3f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:05:53.8257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNyIBBX3KWn9OoTiLuOdZlQjiAZUxawUDK9HWtkSSNLPgwEFSfHpnO8amcbshrvj09RydJgWg0xJ935+AqxuzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4105
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 02:39:03PM +0100, Jan Beulich wrote:
> On 18.01.2022 13:45, Roger Pau Monné wrote:
> > On Thu, Jan 13, 2022 at 02:41:31PM +0100, Jan Beulich wrote:
> >> Calibration logic assumes that the platform timer (HPET or ACPI PM
> >> timer) and the TSC are read at about the same time. This assumption may
> >> not hold when a long latency event (e.g. SMI or NMI) occurs between the
> >> two reads. Reduce the risk of reading uncorrelated values by doing at
> >> least four pairs of reads, using the tuple where the delta between the
> >> enclosing TSC reads was smallest. From the fourth iteration onwards bail
> >> if the new TSC delta isn't better (smaller) than the best earlier one.
> > 
> > Do you have some measurements as to whether this makes the frequency
> > detection any more accurate?
> 
> In the normal case (no SMI or alike) I haven't observed any further
> improvement on top of the earlier patch.
> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc()
> >> the calibration logic could be folded between HPET and PMTMR, at the
> > 
> > As an intermediate solution you could have a read_counter_and_tsc I
> > would think?
> 
> Not sure in which way you view this as "intermediate".

As in not unifying both calibration logic into a single function, but
rather just use a generic function to read the counter and TSC.

With your original remark I assumed that you wanted to unify all the
calibration code in init_hpet and init_pmtimer into a generic
function, but maybe I've misunderstood.

> >> expense of a couple more indirect calls (which may not be that much of a
> >> problem as this is all boot-time only). Really such folding would have
> >> been possible already before, just that the amount of duplicate code
> >> hasn't been this large so far. IOW if so desired, then perhaps the
> >> folding should be a separate prereq patch.
> > 
> > You could even pass a platform_timesource as a parameter to that
> > generic read counter and TSC helper.
> 
> This was the plan, yes, in case I was asked to follow that route (or
> if I decided myself that I'd prefer that significantly over the
> redundancy).

I think having a generic read_counter_and_tsc would be better than
having read_{hpet,pmtmr}_and_tsc.

> 
> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
> >>      return hpet_read32(HPET_COUNTER);
> >>  }
> >>  
> >> +static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
> >> +{
> >> +    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
> >> +    uint32_t best = best;
> >> +    unsigned int i;
> >> +
> >> +    for ( i = 0; ; ++i )
> >> +    {
> >> +        uint32_t hpet = hpet_read32(HPET_COUNTER);
> >> +        uint64_t tsc_cur = rdtsc_ordered();
> >> +        uint64_t tsc_delta = tsc_cur - tsc_prev;
> >> +
> >> +        if ( tsc_delta < tsc_min )
> >> +        {
> >> +            tsc_min = tsc_delta;
> >> +            *tsc = tsc_cur;
> >> +            best = hpet;
> >> +        }
> >> +        else if ( i > 2 )
> >> +            break;
> >> +
> >> +        tsc_prev = tsc_cur;
> > 
> > Would it be better to set tsc_prev to the current TSC value here in
> > order to minimize the window you are measuring? Or else tsc_delta will
> > also account for the time in the loop code, and there's more
> > likeliness from being interrupted?
> 
> I did consider this (or some variant thereof), but did for the moment
> conclude that it wouldn't make enough of a difference. If you think
> it would be meaningfully better that way, I'll switch.
> 
> Both here and for the aspect above, please express you preference (i.e.
> not in the form of a question).

Let's leave it as-is (just one TSC read per loop iteration).

> > I guess being interrupted four times so that all loops are bad is very
> > unlikely.
> > 
> > Since this loop could in theory run multiple times, do we need to
> > check that the counter doesn't overflow? Or else the elapsed counter
> > value would be miscalculated.
> 
> I don't think I see any issue with overflow here. It's the callers
> who need to care about that. And I don't think this function will run
> for long enough such that a counter would not only wrap, but also
> reach its initial count again.

Right, I haven't expressed myself correctly. It's not overflowing the
issue, but rather wrapping to the start count value. Limiting the
iterations to some fixed value (10?) in order to remove that
possibility completely would be OK for me.

Thanks, Roger.

