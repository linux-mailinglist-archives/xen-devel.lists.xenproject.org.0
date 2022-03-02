Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2694CA812
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 15:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282277.480926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyM-0000Zy-An; Wed, 02 Mar 2022 14:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282277.480926; Wed, 02 Mar 2022 14:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPyM-0000Xs-6W; Wed, 02 Mar 2022 14:28:58 +0000
Received: by outflank-mailman (input) for mailman id 282277;
 Wed, 02 Mar 2022 14:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPPyK-0000Xg-MB
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 14:28:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15aed13b-9a35-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 15:28:54 +0100 (CET)
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
X-Inumbo-ID: 15aed13b-9a35-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646231334;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=oUjLpSae5zo/rJzrNaBLQzS2gfvNUYVpZIh8bPCADF8=;
  b=aPJ1IO9h3p7OmhT019148ss9hVRSjISYULYiFo1V9GPmMnZeYU0FTldL
   smMh70mB1Dq2r7DyrZcGVyn/ZGZi1JMXEXjD4EHtF5ZXsleAqqnKIiGnk
   lpO8/ZvP/aLL7gbja8daQSOKcmPb0R+Lrxm/DJ+sNLa/xiQLX1Q5xcIN6
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65714247
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uVv3Yq69RJWBwSQ/0wBzIwxRtBPHchMFZxGqfqrLsTDasY5as4F+v
 mdLW22AbPqMamOned8nOYu39khXvsTcydFnTQVq+38xHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPhWVvW0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTreAoLearOyNgnEAtRCyZQPo5ryp7+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQKmHO
 5BFNlKDajzuQUNGN3EvU6lunb2EmFrhdW0FgVaa8P9fD2/7k1UqjemF3MDuUtCNSM9Ymm6Ro
 2vU+GK/DhxyHN6CzTuI9Fq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80ikpq7I7+Aq0T93+dxqiqXWAs1gXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobWcb2
 33OmNG5OQYsorSNTlye1ZqmjArnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhrx/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXTlrAYlRujBCxO53Nv02wQH834JrWnFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztVZ10lfCxS420DJg4i+aihLArLmdrGwk0OCatM53FyhBwwcnTx
 7/BGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l6U66Bme56Itc990mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq671hEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:oBv5HanJBnuSB5yg3Po9j9roWNDpDfPEimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICO4qTMqftWjdyRGVxeRZjLcKrAeQYhEWmtQtsJ
 uIEJIOduEYb2IK9foSiTPQe71LrajlgcKVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEN86JX/r1cop46zuNMd3B13Z
 W0Dk1WrsA8ciZvV9MHOA4ge7rBNoWfe2O7DIqtSW6XZp3vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65714247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeUq6W7+m62zRoHKL5cEGLvOedvpfMYqZ4QfwfAW0moIjfJfKEIIL4kCIMypnSQiDmREi7K3EM/YXHjPvjaNMl/5UeVr5k9HkBQjRDX9Tb2EIbZNzw24qNxIlut+zcV2dCjkipCm7KiBl3zDqRj94o0mc+SrvtW7i9c/zGVP4KmtW74nP6OX0OIW/+K6XdzonK9GjfM7GLQlGXeWPpyjViaZR8bt7FrxaEjTcAjH0Y2B44ioVwlO5HQLmM9bMSFHt0+tRG5TaF+17r5JMjbPCJwNtMS3PXLsWBMdzrwHFAzf6XHneXHvtbhh4g4LY/eP8FpkrKuWilfE3BCmZLO16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzzMi113fMsllfdXNK2EhtX/Jo9shAWDFTXPcifYdio=;
 b=RFjIJ4MMj31R+G+H7UlQq1a4BVPwtIRud/yxRHFG3Bx7ww3A8+I495GwRxSe9xyFPv2UFve3sA8q5EYyFTXIXzMh5Bv9lhUqBa398QxcFniTRwLt+5I7+0AMgg5eszuWkmVAZ36kRghal6jiuDSifMWCubQtUz+eSUeM8vtI9AFGodKJlQrtTwJBxrFLCld3VzGJWr/0IU0bE2XDpl60E2m+NhBPCd2f3ONczHKxqETvq3XA/VRm3va9LBiTEt6N+L/MwHpGLZcL4mLcr2KIzPRQ/Jaf8jmnENcLszhnjGiSNR58nyVwm7Ku+fX0awL52TKpV/ZoYJ+ok1wuYsONhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzzMi113fMsllfdXNK2EhtX/Jo9shAWDFTXPcifYdio=;
 b=DVfzCUgo0+B+YKaAPPRH8RiqCaYKNHZ3SoZuASGp7G7d1l0TAuWvaW+B2WLn+/Jcjq8K0lu8hXRTQ7jZgxNX+QH52nxruKvTs2AVnyr594ChSp3bS//OYl48POAhD/ZrC0NUYzAV/JZtNpGO07+EmMZMCTOjsi+0b1nqWqfEkRk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <doebel@amazon.de>,
	<julien@xen.org>, <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 0/4] livepatch: fixes for patch generation
Date: Wed,  2 Mar 2022 15:27:07 +0100
Message-ID: <20220302142711.38953-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1af40ed-e038-41cb-0959-08d9fc58f4f6
X-MS-TrafficTypeDiagnostic: MWHPR03MB3279:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB3279D323136693B3F53A7B818F039@MWHPR03MB3279.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqYc/PDLexr1HW+zroTxdG60tBaSK1tRaY5EzKKoLc3ruP/Dpf8OOZVz1vyikL6pliwvqumTI9a+2v1WDf3LTXjQpxklae3NWdyPTqfKIb0llreEmBbdahyykiNRJiHrelAJIUrZnBT/ZNTAhcuwvxCkxAmPC4h5myQk9MUQc4f4xISBtf23k2OCUeCuHSf1+zU2GWS9SJPJ8GYZYWr0sOand9mM5S91sh95M1kWecPZtGzvcZ9OmVVfDXjIEj9Czqq49jFXeL87i6gHRnoMzp/6+e6p+zYIAOy+RNEs5q4fwy9i03yd5/2/akWEcCtZW+3c8f9lRUTM57rZuBUbE0dBLpHFuHm991NE/C3+AX9duuMEyVRIvS9XsMT4vQv9jwcMOzvr+YYJsEsPcODSzT+J8ORDgYOuVC/vdLu37hiUaeLCuvjkvPjsa6B8SDjszr3CHVf31NQvEynf+H9Gp7k2nxks2foWvs8RAVYF/lHAuXiNmyYgWiOoRKhf/sJQM/0yk10xiZfyUOc5Z0uR6X5yJhB/D1K+XF1alhxZf080Tx3XtEu+FUvJoWSnBpMu7QBuH/2qv1+BeHKQOFLtIgrrPDG2eFx2CvtXO2GDty8p5tfJPZRqFZLY6c5bvSMb8RpXlny/wl0qt32yBZ3wKFtj9k7qW/iwELPOXrzAVXtxPNJkZjoDo9pY0u/UaUYC05Zh2B0PwheedeSGn49Ou4D3tTR9fTLU98Re9Ry8EoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(86362001)(66556008)(66946007)(8936002)(8676002)(66476007)(1076003)(107886003)(4744005)(83380400001)(5660300002)(186003)(26005)(38100700002)(82960400001)(6486002)(966005)(2906002)(2616005)(6512007)(6666004)(6506007)(6916009)(36756003)(508600001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFZNV0tnYzVYNkpmdE9sRU1ZTmVaYjdsM2pGOEpibWsySnlFSXovT0d1Ynh0?=
 =?utf-8?B?eVlvRDBzelZnS2lmczAwNUJBdVYrVXlMNlRlM1BjbFZYdytzcE5KOE9aR0R4?=
 =?utf-8?B?NVNwYkVmWnlNQUo5QllMVWtidy9pTEo0K09nUFBadzZTd3BJcWo3MXBadUla?=
 =?utf-8?B?UlhMb1Z6emlGczV2VUhudy9FcUpWb2hxbkdoNTc4azZBYWtaWGVrV3YrUUll?=
 =?utf-8?B?YVB3WkpHa0RsdnpQRE1iNFNXeDlVZTJ2dFlqenhoOEhrMEQ1OXB6V2syVFlv?=
 =?utf-8?B?SXhsQTFybyt6dXNSdW04WVBoS2xRSDJqK240UkU4NUEvY2RtdWFvL1R4VFNk?=
 =?utf-8?B?ZGFISkd1MVJMdWF3OU5oczRtSjdjRGVzbnNWYXk2d0hFYlU2cUQ5TmIrdThi?=
 =?utf-8?B?ZVg2TFNUWGlNTGZpOElFN0RiV3RCYlZGTHZ1Tk13Q0ExK1cwa1dadC8zcGJW?=
 =?utf-8?B?SCt6WnpIQkxibWhmeE1ORUpycmFFWFplQm1Hd1MzL0JLazV6MHA1enM0NUo3?=
 =?utf-8?B?cDZtRHZZOGtjajVDRHVxay9DejlsR2tTRUx1SWR5ZlJFQzVQK0l2OThzQ1dB?=
 =?utf-8?B?N29GcW1tWFZqVTFhYkZreWg1SllMY2hpUVRFclFCQkk3ZnpKOHZZWGVnV0J4?=
 =?utf-8?B?UEU4TWJGN2hCU0FlRytRT3VoK2YyVE5oazltbkVWbytWMXoyeC9ZaDFMSkFn?=
 =?utf-8?B?ZEJaQ3J3d2x2SWRoQzVzb2R0YXZEbHFDeXNrdlZta3p3RE5UbS9FeGpzZXFt?=
 =?utf-8?B?OVBmMmd4WUIyR0loalh1V25VbmR2OVlNWGd6VEJGUDVzUUl2ZEUvWWZOWGZr?=
 =?utf-8?B?SXFlVnBia3ViQmJESHBTMnFqMUE2aUZZQkl4dnptRjd1SEdPWmpEeUtycG9w?=
 =?utf-8?B?TTh1cjh6WjhnM0JrNXpteGIzN013bWpOVUovTzVhWWx1RFZQNENRdEZLY0h3?=
 =?utf-8?B?S3JPdHh5UFViMGpQZWtkakZGQU84L2h3QmlPRVBUVUpxUXQ5R3hMTUtWajBE?=
 =?utf-8?B?YUhNdWl3Y3VWR1FQUTNnamxpUG5wZ2JIcW9KZ05pbCtHSkc2a2h2T25nTnc1?=
 =?utf-8?B?T1VUSTRrN2FlTkxpL005UW1nM1NUanhMWlNrcnhyL3AyZngrSTNwOGhVN1R6?=
 =?utf-8?B?MkJCM2NaSFVEQjZlUTJkZ2pkU2lEODMrU0piNzBlSHZ4V1ZUQXpWaDE5N21L?=
 =?utf-8?B?cjFHd0ZUMXQyaXFmbmFKWUtjM0JRNkJWUnM0NXNEaUl1TVQ4VEdzSDB0S0Nt?=
 =?utf-8?B?N1NaV3Qwb014S2RtZnNFL0N1dHNEcko2WGliQkkvOUhvV2FuNzMvbE1raXdl?=
 =?utf-8?B?Y1psaktpbDJ4MCsvVzVISFFKK21WWHBjOVU1TUFpN1p4UTN0aXY2RktEUnEx?=
 =?utf-8?B?Yi9UaUtndW8vK3hneXNBV0FNd1FudVhkem5QUU5MRmJ4S0xlR0dZcUpyVGJy?=
 =?utf-8?B?WU1ZQk81Ky9wUSt0MjBqck1xRktCTTFMNS96Um5jOHR5QUdyTU0zTVFvbzhG?=
 =?utf-8?B?R0gxWFhad0QxWmNzRHRVSWVMT04vWjRIU3hmTHFwRWg5YW1VVDJEenZvdkND?=
 =?utf-8?B?NVZTL1hxcGV2MHB2Nk1nTFNNNHV5TWlWeTlQOG5hRFN6R0M4VURhbk5MWE9M?=
 =?utf-8?B?b0Jwc0RlVTdhTVdTWnlXVDlQa2Q3aDhrbjJLRVA0eEkxdGNEaTg3OE9WSXFm?=
 =?utf-8?B?T3IzREVxR3Bvc3dodHowdnBTTnIvS2dBbE5RTjc5dnI3ZnlmcEFCUzNFdzU5?=
 =?utf-8?B?cHJ4S0FCcGhWclB5OXM5OXpFbnhpaHBxenQ0MHFIS3BIZkRrT0tOMkFzTWFS?=
 =?utf-8?B?a0t3UUdSdWJiNERhazE5ZWFCRkgyMmFnL0lxRC9IK0R0SWs4Z3BacTRIcGVj?=
 =?utf-8?B?ZklUZlA1cTZvS1JmZVh3S3F6R2lyQlFLcjdpUFZMTUR4ZVZJdmNyaitNd3Rn?=
 =?utf-8?B?YlFBYzlWTWdObk50T05ZNEwzQXVpTlp5RWFUVW41VFgySTU5UlRWUzUxUlh2?=
 =?utf-8?B?VlFhNElwM1VKOHdmRUlTUUg0S3JVNFB1SUQ2cjBDOWp0cGJjTlFpODY0d3pU?=
 =?utf-8?B?QVYxbVZtU3B4cFk2WlpYYnQyWVBjSnJRUEtvTmdMR215VEFHUVhyem1QeTZB?=
 =?utf-8?B?clNRQVRlNFVZNVZyU2EvbFdhZklreEZTdFYxZ3FHZkNjbE9Gc0h3cGxZbVdq?=
 =?utf-8?Q?S1Ml1suK+gVqVtXEX6vyKh4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1af40ed-e038-41cb-0959-08d9fc58f4f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 14:28:44.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQqJGtJwAlNtOcZGPE/EDsycRwDllzU5qET8ProphhYM+9QE79dTNhUoRCdFiEffTA9/eH99YbiXJSjSB7NVSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3279
X-OriginatorOrg: citrix.com

Hello,

THe following series contains the minimum set of fixes require to get
the livepatch tools to work again with current Xen version.

Note the last patch depends on:

https://lore.kernel.org/xen-devel/20220302134425.38465-1-roger.pau@citrix.com/T/#u

If that's not considered acceptable a different way to add
-f{function,data}-sections will need to be discussed.

Thanks, Roger.

Roger Pau Monne (4):
  livepatch: update readme to mention --xen-depends
  livepatch: improve rune for fetching of Build ID
  livepatch: do the initial build using CROSS_COMPILE
  livepatch: differentiate between old and new build systems

 README.md       |  4 ++--
 livepatch-build | 25 ++++++++++++++++---------
 2 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.34.1


