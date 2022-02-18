Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24374BB8C9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275310.471123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL1wY-0005lb-QO; Fri, 18 Feb 2022 12:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275310.471123; Fri, 18 Feb 2022 12:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL1wY-0005jY-NH; Fri, 18 Feb 2022 12:00:58 +0000
Received: by outflank-mailman (input) for mailman id 275310;
 Fri, 18 Feb 2022 12:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL1wW-0005gu-RZ
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:00:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be54d83-90b2-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 13:00:55 +0100 (CET)
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
X-Inumbo-ID: 6be54d83-90b2-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645185655;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6M4waMGtjuKlBRZrPZQ40AQuX96BQYMLRzM3lGNwL4k=;
  b=FBrpn4rQ6FEUhCzAcezT2a0iTbySgBkVh8esL5nS3Yb6OUvA11LqlXZd
   SjQyz8MsRfyK7lABZDwYkwh5b6tfVP3yfb3qT6g+bIeTD5O95vjMJyU+I
   JSO7muASaYaSqO+yE0ykrImzuhDaaVQcIlXnEFFPCUR0kDVWKIMG7nuEp
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64407646
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:w9//FqjRNCwzLZ2a726QuMOPX161XxAKZh0ujC45NGQN5FlHY01je
 htvD22EafjZZzCgLtgnPtyy8BsGscTWy4dmHApqqHhnQiMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0Iz8wIFqtQw24LhWVrd4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVp4L6zJwNgtbzNjSw9UP4tKw63MOlHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiCO
 5JGN2YxBPjGSwRwYXVJOI4+p+zr1mDiKzlHj0m1oYNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ9ONugVCV7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYS/M57aR9Q+CBQIudUEoZwkIdhkO+PC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03Q8H83oJrW3FF5ufkWZ4uWAWyKBBaJtsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSP8ErKFfWoH83PyZ8OlwBdmB1wMnT3
 r/BLK6R4YsyU/w7nFJauc9GuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSHoOY7cAFRRVBmVM+eliCiXrPaSuaQMDp6UKG5LHJIU9ENopm5Yc+So
 CnmAxcAkACXaL+uAVziV02PoYjHBP5XhXk6ITYtLRCv3X0iapyo96ARa908erxPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:2jqeO6CN0DKSDUzlHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MAnhHP9OkPIs1NKZMjUO11HYSr2KgbGSoQEIeBeOidK1t5
 0QCpSWYeeYZTMR7beY3ODRKadd/DDtytHOuQ6x9QYJcek8AJsQkjuRRzzrW3FedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0gU/LYr9PGuZr6aVpebiRXozWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yv47ohQmvHm1txfbfb8wvQ9G3HJsEKFdY5hU7qNsHQcp/yu0k8jlJ
 32rxIpL61ImgfsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpp3YIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuJYO5lbZvsn+9La1wXR4TsOscYa
 lT5YDnlbxrmGqhHj/kVjIF+q3uYpwxdi32N3Tq9PblkQS+p0oJvnfw8vZv7EvoxKhNNaWs2N
 60QpiA7Is+NvP+TZgNc9vpEvHHfFAkf3r3QRGvyBLcZeQ6B04=
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64407646"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/tSImZlsSiKcWBbtgUpqyiGUqb60IYZCOkjqUH/VBYzQ4OdqFkkwCZVLB0LJ+e8inrMmF1usLgieZ53crKk4pb1yvuxo6Hmfg7mcNZLGhoShH5yKd3LhcbPV9H8bjjIQFLDopY96JZqZpbQBIt56FV6JT2wyY3JqwxPT+9tROhSsRgTyJhJjdLF8rztvgsxDK4Z9QN3Ndert3KaUW5ZtCt4/eS2ukMNyAoUyhoD805W98pxYKlWqufcbHH+Ppqethg0scOmkFcpx0HSagcsFvOJ0BCXILFpkpACJfK9TnS1H2JG5n3lWQ3Wnlz8owwWGkhwkUVfd/w/hgyEW9lARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ9YZ1PV+13OCnW+hEH8zun3CBe3IS2HDQy5Vg/LRec=;
 b=GXkZ0k7wo9K9t6H61kjgqxVklovCkz/FprPcfdqO9S5+wy8/asWrKO61cHr+rw8GJSCPHKbj3bsyaJClme+j1rBB7v1YJ+ULw/L1B0Sz3ddS/Oinv/dz0UlhHsZgQLFW9GVOZ6ozfT79kuyrKzW7woZs+hIP6nppMwXedsSQHIWwvpFQdLb4HO0HKcDkp2Qb4yOrKpbePAnEvIxtSYiD8fUEnsTg4loqz+G7Ch5mULnv1fu9b5YkvnEURk1/dWP20eHKmWGMEalkzUkj4OLK5kMjD1iIR2tUyyU9eWRH98oZQJRrdS5yqsepWzxMnRGIjpEj7Iq0kO2eNPMgI4xDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ9YZ1PV+13OCnW+hEH8zun3CBe3IS2HDQy5Vg/LRec=;
 b=YISgw0IPDrIe0YQEKriBNnejrvmjhuZNt/QRqDkDJJ21W/N6NTRZfrgJDBlvKEjKw3Jio9IoKhd3qA3bfDwtEko1NAoCGESiVFg8FF4Wdox4n97utAWAG18Shs1oQufTsi47kTQkvLtbhCgOQj1hnj1dvZKYfCVrTKF/I5atzKg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] coverity: trigger scan as a github action
Date: Fri, 18 Feb 2022 13:00:40 +0100
Message-ID: <20220218120042.32102-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0186.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::25)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd66d0b5-eefa-4fcf-a0f7-08d9f2d64e15
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5406:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB540654E16C7B483BB76DC6288F379@SJ0PR03MB5406.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10YQad4fCpoQu13bZqF5EFA8XxKBtORFTdRdbyBS32sLkZL1FiTR56o4lojjhHEtI1rxedxhMW4KHuuKKwv4UcnWBGtI4b2NTzi1pQSXqN78k6iQq1TsHyYXwHQ21pjrMG5RMmAvgVYCb2USRNlomhUF3M9IKkTWYYx4LUOhoZsotHbutcIm5KGRUnl25d5FPLEJ6P5hAeEmYbll9F5H9un5PiSOkd8ZkD8Xskr9fR8aVmADu77chJtr/oo2NgpW5AUziShi4eeoE8bAoW2Zqwew2/xiCC7IkXj2lmA16q84tEa49OgRIga7B48PiP1eT5fc/RBzHL6dPUTtH65uUCZUeGdgzrStOKgpvf+igexksgc6Q3LVdYs4EcRbpKpW6jNFeOdu8Flzys3Wfmi2s9NW+BmVoMI4Nossj3BqbBiWc+ivCWDio6DLxrEan0wKfwRRrleURmFMClGj/acEMz3/I66vDDslC+GMrPjsbIaMF/XNs9zbvyRnhwC/OyVunmgyh5ucB8DvrUECHTkw1upLU7ufVI0G6q1Uouhbw0GlCcbYzFN21Zs+Ud3dsbv5MIJqKJ9UMPdbIIwhq3pIfgSxvTnkdKQ4DcQr0q420Rk/sjiIj47Jmiz2BMWNYGunWvRsweAUUrMF6rUoDb0VPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(1076003)(2616005)(38100700002)(8936002)(66946007)(4326008)(8676002)(2906002)(66556008)(26005)(186003)(82960400001)(6666004)(86362001)(66476007)(6506007)(316002)(508600001)(6916009)(36756003)(54906003)(6486002)(4744005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtQTk5NQnZkUldhOFQxb1lFRjB6OW5YTFd6U2dId3VpUkNCbEtMZ083Q2dF?=
 =?utf-8?B?anJEVzNEYlFTY1NKTFg1NC9FZ3BUVnVlZEwyY3JhYmtmbm1xTnQxTDU5bXhP?=
 =?utf-8?B?THQ2MEtLNnN6WVZRKzl6NmJCTC95RmVJQm9HMFJ2VUVIRXA1VC94eU9CRkJ1?=
 =?utf-8?B?a0FlbVNwcVpSSnZ3c3QzemwyS0dBUVRKRE9JdEtvWmY3MzZFU3ExcmhHWWVv?=
 =?utf-8?B?NGQySVRUQllBd1VBWXZkTE9rNDhQS2M0VW5lek5mdVpibGNUM0ZKQXM3NnVW?=
 =?utf-8?B?K0p2Um5FV1lFMk1zZkRrdmxJQnhmc3h5YXlVUUxldm14QVpRRnRURUl4N1cx?=
 =?utf-8?B?alVpN0hjQXFrSU9RNThvdkU5ZDBwem9uS3EvNEUyWVRpRTNSNlBEVGJieTZo?=
 =?utf-8?B?RXhEREM1cm44aWpNU2NLRm5POXNJakErQmhvQ3dueWtsYzBiU1V0aXl3djlV?=
 =?utf-8?B?ZTFqZ1U0bGVJaTU2WmovUURnUnp0TFNlKzNCcEZhZHcvaGhvYmhOZ2JUNE9R?=
 =?utf-8?B?Mkt6VHVhY0Y5L3ozMlFlWnI4K3Z0VklYSGJqMW5PK0o4VWVxRjN1UUFBajVD?=
 =?utf-8?B?aWtQUzV1MEtJQ3ZzeElRV014ZXBTVFBHaEpKRlhoak1NeHdTYXhKSlp1N1lM?=
 =?utf-8?B?Wm43RHNRNENkU3lqU0NBUVE4TW1URDN6VnBjclFHenVDWVgxQmZxdWhKMkVk?=
 =?utf-8?B?cXArSldxNElnM0JQTmpwak44dlVLbGRiOGVQTnptdXhkeVcwVE1lNDdGYzJp?=
 =?utf-8?B?Y0Jrb2dhQ1lmMGJSU2ZmK3E4SGNZcG5KdjJMSkZUNlRzWmFuTkVqQzdnbW5B?=
 =?utf-8?B?UE1wME11KzhnK3RBZXJORGNNa3J2dVMxdGZQbXNPYkVqOWFJblNyWW1JcW5P?=
 =?utf-8?B?Y1UxdFR2QncvYVdrOE9CaXdUNEYxNDhNQ0VNSkZNOUszcHA0S2Q3L2VjbUJL?=
 =?utf-8?B?Q0ljbHFRYW4wamhmUVduYitTL2hTRnlpWno3RUJNOWFBWHIxLzJXWU1BNEdq?=
 =?utf-8?B?cERidDhHNFNBUWpMWk4vZ1pkWEx4QklaUkRnN3NFRG1tTFJhczRmMkU2NWlO?=
 =?utf-8?B?NlNnWktrWTdqMnpPbzcySzZLaFZ3d3QzeXV5ekdKQlAxaDVxZDZPMmdKVFFp?=
 =?utf-8?B?OGRkNHRrazcvbTRNM29VYzFudlgvUUxEd01Qd2E2NmlxWXE1V0liTThUem82?=
 =?utf-8?B?SlFGdWkwclZpT1hnRER2R2RMMWE4WTZmaU5aUW1yL292TW5FdnoxMzdGM0ly?=
 =?utf-8?B?OWoxV21ITjJreVdOZjNLM0w3dzlRQmNFME01K3hranVLSHJvRkdMbEdOeVhj?=
 =?utf-8?B?WUJxK1B4VU5RZk1wTjhKMmVQUUlzcThlNzh0dHZNV09CV3dHL1Y4d2V5SUh2?=
 =?utf-8?B?OU53eFNQbnliOEhpTUtTdjRibmdtNDBCZEI5OUJXbzY0d0ZjM1JHeTNNSFJu?=
 =?utf-8?B?bDhFTzRROEI4ejlOeEtZbHp0bWJOMzVidmg3WFVaYzdNOHRpWC9KekhoUUhQ?=
 =?utf-8?B?emY5RTZwZVVkREQxYm8xTngyMTMraUFQZ09WN1ZUSW1oUHJFUGU1WjlQOWN0?=
 =?utf-8?B?UUh5NXNValVOb0dzeFlVVC9GK1UxSGs4SFF6VHhoQ3JiZzdYM1poamhpSm9P?=
 =?utf-8?B?NjQ2ckplZzArVSt2NnBXeDdmRHcwL05CN3V2RnllOVluN2F6SjQxSVpnWHEx?=
 =?utf-8?B?ZDdoTG93OGpEcUNGWVpESU41UlFYVzRuTUxxUlRGVVNmd2JuT01LNWFvMXRP?=
 =?utf-8?B?YU9iN3RnbGFia3J0aUF1WXA3TC9nK25Sek5LbVVuQW9XZzNVdGZYQ1EvTHJU?=
 =?utf-8?B?TVU0NzBBaVVZUmdmMDZrRWNWQWo1aXpaMm1qbGZFdUcrZTZQcGFnSUJ0Wm5w?=
 =?utf-8?B?M3lyeUhDRDVEVTA5ZWhJbFROcDJIQVR0d0NDSWg1dHlkN3RrbHJQa0FmUjVY?=
 =?utf-8?B?Wk45MStxb2xYRmx2RTRYZWliaEhrcVhsb21LWVBleEVsQkxvaXpJWGJTY3BF?=
 =?utf-8?B?NldTZlpqSm55NWZOejZrckRhcUtobnFIeWhCWmp1MGVIZTdEc2hOMTR5dEpC?=
 =?utf-8?B?K0VleFExejhDY1RybkJhb1hsZDh4T28yVUFwNGN6ckRseTNLZDlZZlF6UFZX?=
 =?utf-8?B?U2wrRjFzRXo3andLaFRzNzN4U2VKVnNiUVJlS3lUcjBFRS9GWmN6RUkwLzNF?=
 =?utf-8?Q?6pVLtQ1bHP/EpxIcJUM3Oro=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd66d0b5-eefa-4fcf-a0f7-08d9f2d64e15
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 12:00:49.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTm9H0L0MzRxViRvMS5lIbK+TV8McIY36/P+GQAXyC3LMWQhaCdQEgkJAzoGl8ihsZyt+OKFA1sRLc11tkf6ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5406
X-OriginatorOrg: citrix.com

Hello,

Following series introduces a github workflow to trigger a Coverity
Scan. First patch attempts to move the logic currently in osstest into a
github action mostly as-is (same build targets).

Second patch removes the build of QEMU, SeaBIOS and OVMF from the
Coverity Scan.

Thanks, Roger.

Roger Pau Monne (2):
  github: add workflow to run Coverity scans
  coverity: do not build QEMU, SeaBIOS or OVMF

 .github/workflows/coverity.yml | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 .github/workflows/coverity.yml

-- 
2.34.1


