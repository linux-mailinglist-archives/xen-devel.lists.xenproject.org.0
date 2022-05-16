Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E565952871F
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 16:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329915.553203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbmt-00067z-52; Mon, 16 May 2022 14:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329915.553203; Mon, 16 May 2022 14:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqbmt-00065e-1n; Mon, 16 May 2022 14:33:31 +0000
Received: by outflank-mailman (input) for mailman id 329915;
 Mon, 16 May 2022 14:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1taX=VY=citrix.com=prvs=128915162=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqbmq-00065Y-JH
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 14:33:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20a7bb78-d525-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 16:33:24 +0200 (CEST)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 10:31:32 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB3868.namprd03.prod.outlook.com (2603:10b6:5:4f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 14:31:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 14:31:25 +0000
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
X-Inumbo-ID: 20a7bb78-d525-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652711606;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=91Wmal1CB8VlFN59BIsW0tjoIPUoHQ43Tm7bH/2l90Q=;
  b=ONFj/fby7RSCqeBhnctomREXZzxtEyOSmuFUh3VGi42LOdruiVGnl4VY
   pYQtl1Uoxf2Be96gSwooEXIbTmBFsAS9mzSTAWjXD05v6YF+M2PZFv1Zz
   fhSXGsBqeDd3Jp2M1mSEdh4BY78SZesjcNGdx6oaVtVVGYZV4y+0Kk42O
   4=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 70785565
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ON5eO67x15flxBiQOBUC4QxRtE7GchMFZxGqfqrLsTDasY5as4F+v
 mROD2GPPveJa2DyeNxzb9/i/EsHvMXWxoRqGVFkrH8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgXVvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS7TxskMvfyk9hCUhtAOn9PZbxXxq/+dC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAgF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA9wLI+PRqi4TV5E9owr7jL4PzQ5+1e9wPlBy6v
 Vv4znusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/R/FyfD21dFjpZMoV+6IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSfLs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:GIW2G66T+KC4Ym9F6APXwAzXdLJyesId70hD6qm+c3Nom7+j5q
 eTdZUgpH3JYVMqM03I9urgBEDtex7hHP1OkOos1NWZPDUO0VHAROtfBODZrQEIbheOktK1u5
 0NT0BaYOeAdCkD/L2KmnjELz4CqOP3j5xBvo/lvgtQpHlRGsRdBzUQMHfkLqVBLDM2dKbQI/
 Knl7p6jivlcm8QasSmAj0ARebCqrTw5fTbXSI=
X-IronPort-AV: E=Sophos;i="5.91,230,1647316800"; 
   d="scan'208";a="70785565"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5R/AhEzvjGD/pTTvXqv1fufEiOpUxny6N1jPjbbdec1fTWeaFNwN//ePBIaGU8pnwWqkzNGC9yjK20iVzqawsfULJ642JEHf/0boxNa4boVTZiXbnzd2kN8gUnjkOvsW8sfEAjH5b/mjnuA1QqutMw8B3QTl2cu4IIjGudP3zxXoJh4ly3x3WYSmfMuszau0bUJ3N9zivJ3470U+81fCTWpb0MdRfaRcWuCOknZPs0w0P+pL8x3MgIzir9q7KiYE+6gZLM+VThvVB3QIKIdi1dn5LkVvkPhJsQDQBHLmj+N2/ypzpkuexf0y1SLfBEvO0ly8GbZEOz8By4WRnrkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z7cp0g1R/YVtPHI0JJ7+lHogu2k/5+yi01WV1RPyZY=;
 b=FuneRbeUOnSlYZWxS5wl4JzPTLRuB8OclW03jS+OqDQv3qRSOC1aMk7k80QduKv6zpdFwRgOEeD7iweUigfHPcYEK2PjfvZvDaTUNBIge1hPdCbn60mE81JgICZ83FUOQx6xIMQuoGcSZg7pG3WF/G3TySoB4tsm0WTxW0pTgEPFNtShvuMm5G9x5VtuLWyevXeBTgWwC0JfMdBPA6CECWhnUwZw0oAMex27hYhYKIohPUZopw/PafNTZx2vQEsSzHEhh9d9eywHJKj7mMtj1I1yHp9Rb3zc0M70r6NHWfTFY/1U6Kn5LP06D6nLVz+L2taDUtqmVbDltIFsiW5Pgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z7cp0g1R/YVtPHI0JJ7+lHogu2k/5+yi01WV1RPyZY=;
 b=ux4x925LjiR/Gu8EnXMw6IANXcfmxCrTdVOpwjv9FcxQbSx/KZJfY7CgXaFijWjUyeMPxuKswPnp6RbJoKnBqRVe/CAcMrQ/Q59BzRRfGscWaNIDqJ0vx6QJAlOGUhKjwGRydCZMDIfMZg2iyyOIu2xsZM9r3mVAy7d1gvk7q4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/flushtlb: remove flush_area check on system state
Date: Mon, 16 May 2022 16:31:16 +0200
Message-Id: <20220516143116.28602-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4f3ca8f-63ed-4120-9538-08da3748c1b9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3868:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB38682696E204D73F68ADC6188FCF9@DM6PR03MB3868.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qGvMby7Bo8/lZApCzXmqY1xse4TDCumV7lwWZyE3KFqhTqE3f+/HKjEQbEi+5RXezKa4vK86/lhH39MLBPF9CnbK5rvEvRzAIE3NKq19/ibgxTXwZ0Fn4zy+MTT0zedQYtBzafYqvU30y1DY0o7ImSL1N5PGhR42kw6opfw9cRGp6D7DT2qIX/ntG84Fc2XFnLx4mh1+0MX+eaOVZkoSrCOvg8x5/YvVGUZoU5jxzR8HXw7WzhhlQl45LIEC7BeNdpx+2PV2A7wzcOs6qdy6qcHBixqyeqUqRxqGeaQGvrnrNLHMk4JJuqWbq2b4p/qeYyXEmvGxXwhhfMiv9QdIyr2V1J61iFl0+CAJ1w5/2BfolB9xybxPkmhgG4nw80QuecZpLnoz9+GFuIfly5hSMyshsDsYrwnKmqAqT/e8oO+ZYnN7doijhC+tdv++DdagOG0LjJrlA8FwT5b0oxZmi1L1V4W2GcnJ+7YogRmCENGkvgQGUkUYJ5y3mVv0tEYR1YgJuWcnxPavqdXc1mpAijQplIW565a8ZztYYvFqGTpHsZ086g846DmpFNSFsRqXy+uFyYY/8O/mWDGTHsmS0fRRTqFlTuegfLE4VRt4L7ESdP/abTbQVMYj/jpxIhPp0fxdl3owwTSggPYeGGJjTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(6512007)(26005)(6506007)(1076003)(186003)(2616005)(82960400001)(508600001)(6486002)(86362001)(83380400001)(2906002)(66556008)(54906003)(66476007)(316002)(66946007)(6666004)(6916009)(4326008)(5660300002)(8676002)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RTQmJWSG5EOFpZUjErM1Ivek4za1pBTDIxUEQrQU9PRmFiR04yQ2JEenRK?=
 =?utf-8?B?SUhxUk5aWW9wVmdVbmlGdGpoWFQzdjIyZnAvbjBGSjlkdzJvRHUwQjlBZndy?=
 =?utf-8?B?dnlzWlViRUtGS0VTZzFvbDBSTS8wVExEVDdCbWlPcmtibS9Na2Nud0ZEQUdn?=
 =?utf-8?B?V3dkWlU0RDMyaHExVGpHbHpvS0lhTGRuTjBRL1B0UisxTk5hWUlHM1hqS1F6?=
 =?utf-8?B?eEIyQWhOWUU0Sld2UlFTaUdGZUt6Y3dGUlMvRXBUbkErS1I0UUtmYlZ5TVN0?=
 =?utf-8?B?L0pRQ2JpOXNjbW1HcVl3ek9rcGZ6d3FMUXYxbWZwMkpuUll3WWFydFdlSWxl?=
 =?utf-8?B?WGJOakVWenpheTBJamdLOE5uOTdqWEhVNFVyWFp5U1ZCSXZVRjRRTm1QZ2xs?=
 =?utf-8?B?YlVESEsrL21wSmtMajZuS0tIeWExajlSSVVEd3dFRDVpRnh2SWpNUFVUT0Nq?=
 =?utf-8?B?aTRoU0F3WlBFcm80UmhEcHcvZVpybWFJOEp5UFVnMXN1OXUwSTVvcGlCT3Bl?=
 =?utf-8?B?WmNMQTM2czNCQ0lEWVZiWlNqY1Qrb1R1WHFucExSOE1OUjJzcVE4aUxodGFI?=
 =?utf-8?B?aklRNzJ4elhtNStVMnMwanNyRlROdnljUWRCZHNCa0FZYTYvWHVudmxxazJu?=
 =?utf-8?B?eXZ0b2JxelRIbU52cDM1M21WWEM2cCsveVdIY1dYRjFIYUFiRFFQbW9qTXUz?=
 =?utf-8?B?Z083NWg1ZWVWYzJ2ZTRLOFkrRWFxZWtQMHVXYm9NbzJ5OFRVTmlHVnRYU2d0?=
 =?utf-8?B?L3FtK0pnOUc0Q3lzZWtwUEI4bWJqOC9pTGJsMElRbDJ6Wmt6OUwyRVpYbTdy?=
 =?utf-8?B?bW9LdkZKWXltZmYwV0VmWGZReUVOblU2cVM5cHlNODVkQmxCdWlVQk15dUVE?=
 =?utf-8?B?Wk9HTG5uZDFveTdlLytOZlk0SXZvdzVKWTZYZFErdDBRMW9tUytoTGNOUVBt?=
 =?utf-8?B?cGpTZDJWSlN1dzIvSDNpTkxMMGhDVmhYMDJBRnRnZnE5M0lZaG5mNHlobEth?=
 =?utf-8?B?ZXFmZnByM3lDeDB2aUFxZzBJUjh6YWRFNVhaSVBMVGJYeEg1cG5jZG1sNHVt?=
 =?utf-8?B?TldwQXlDWWRzcTZIWHJreWhYNXhiK3VId29HQ3YzOUFIWXgrT3RBSU40YW5H?=
 =?utf-8?B?dEFoem1FWFBRbnh3YTQ3NGx2eHB5WkVCNHFaUHRDVlJQQy9ORCtjNGZaaEFm?=
 =?utf-8?B?dU0yRjYxUkVtTC81bHpNTVRVVElUWWxzVkJTZXdIbndIS0hmYUhJN3FCOENi?=
 =?utf-8?B?V0hWazdpZjFpdVEvbDJSR1E5bG9pM0N5c0crVlVIcnlheDFoSXRZNzhTdmNU?=
 =?utf-8?B?RWtGOWFtYmd4b0RXclhnV2pldElQV2U0Mnh5N09KZktiUHdFaUdycDJGeDZn?=
 =?utf-8?B?MzY1Y1JoMnpwRnM4cGVvQVVFVFFqY2ZucXhTZ0x4Q3orT2tnT2h5VG12NGtM?=
 =?utf-8?B?cHo4d3FIUWU1NkQ4eThqQmRpYk44b2Z6MlJVQlExMjlwWjFVTTVFSU80UHBv?=
 =?utf-8?B?MUJMa1ZkWEEvdWoyVVc4OWVSSzA5RnNacGh2OHV5MmtpM003SEJ4dzhsSklK?=
 =?utf-8?B?aWgrL25wc05kWFdMN2g3dFpmQnZDc3QrTXdyMTFETE1EdmJjZTFSRW9TUzJJ?=
 =?utf-8?B?ZEg2VUFQMXRVc0JPN29HZ1MvNk0rZ1VyaXVGTDVrSnhvMFZySUdaS0JQZ3pi?=
 =?utf-8?B?dGt1VmhXeGEreEsxR0xUVWNCZDdZb2dHY3FhdlhxS2JHMXMrcmZwOVBFVjY3?=
 =?utf-8?B?b3A1WlpqMkVNYmY0TnFaVTJEM2FzOGNFTVcydS9PUzA4YnRqUEoxbEpoazN5?=
 =?utf-8?B?Q2E0SFVpR0hFeUJNUWN1bmphWENOejA5dHgxQ01XZEtoNXVsWXladjlISGdJ?=
 =?utf-8?B?cUVRV01ISDhaUENzcXdNUjBmQ012VWRDNTR4aGV6dCt0ZHdrOTdsOUVoeFcv?=
 =?utf-8?B?L3luVUcrTnZuQXQ0Ri94aCsyRW5DUUpSWkNyVG5pVU93MmR3NCtTVy9NUU1C?=
 =?utf-8?B?dDNDa0dtZGpuT0dFaE1QQmFBOTBUMmhTK1dmbHZvRmVEOVZZTnppR2I3VGlk?=
 =?utf-8?B?aSsyakhWbEZBamcrVWZBSllOblN1ZWJicStDbnJCUW9hb2JvYndwYUxVbkU1?=
 =?utf-8?B?YTVncjF6ZG1tcWRSaWFHMmNNcXNxYzRBbk1yZXVpMTRLbEFtd25YMXd5UHVh?=
 =?utf-8?B?Z25tM0NUUnFqQldYd2ZJcUFuRlU4UHp1QXpHT1d4SXczMkxkNGlITnN4VnFM?=
 =?utf-8?B?bGQ0bUJjdmlUWm5EVzB1TGxseE12cXgwcVZhUlhKSm5RcU84MloydGlERFhM?=
 =?utf-8?B?Q0ZzcEd3NmpKaHRXbThsL0MrSTBjdXg3ODdZWWRwMlN0SURxdnRVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f3ca8f-63ed-4120-9538-08da3748c1b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 14:31:25.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzQjbX8J6/IRuKYu5YGDZ2rdf1mdEQu6e+JtUYGqf7VfuuCqQT59Z8ccF2/uwb7iWIzr1fO5dQekSrdmpaPa+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3868

Booting with Shadow Stacks leads to the following assert on a debug
hypervisor:

(XEN) [   11.625166] Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
(XEN) [   11.629410] ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
(XEN) [   11.633679] CPU:    0
(XEN) [   11.637834] RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
[...]
(XEN) [   11.806158] Xen call trace:
(XEN) [   11.811255]    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
(XEN) [   11.816459]    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
(XEN) [   11.821689]    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
(XEN) [   11.827053]    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
(XEN) [   11.832416]    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
(XEN) [   11.837809]    [<ffff82d040203344>] F __high_start+0x94/0xa0


This is due to SYS_STATE_smp_boot being set before calling
alternative_branches(), and the flush in modify_xen_mappings() then
using flush_area_all() with interrupts disabled.  Note that
alternative_branches() is called before APs are started, so the flush
must be a local one (and indeed the cpumask passed to
flush_area_mask() just contains one CPU).

Take the opportunity to simplify a bit the logic and make flush_area()
an alias for flush_area_mask(&cpu_online_map...), taking into account
that cpu_online_map just contains the BSP before APs are started.
This requires widening the assert in flush_area_mask() to allow
being called with interrupts disabled as long as it's strictly a local
only flush.

The overall result is that a conditional can be removed from
flush_area().

Fixes: (78e072bc37 'x86/mm: avoid inadvertently degrading a TLB flush to local only')
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/flushtlb.h | 3 ++-
 xen/arch/x86/mm.c                   | 8 --------
 xen/arch/x86/smp.c                  | 3 ++-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 18777f1d4c..a97b3a2327 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
 #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
 
 /* Flush all CPUs' TLBs/caches */
-#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
+#define flush_area(va, flags) \
+    flush_area_mask(&cpu_online_map, (const void *)(va), flags)
 #define flush_all(flags) flush_mask(&cpu_online_map, flags)
 
 /* Flush local TLBs */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 67c0427963..45235c5aa6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5066,14 +5066,6 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 #define l1f_to_lNf(f) (((f) & _PAGE_PRESENT) ? ((f) |  _PAGE_PSE) : (f))
 #define lNf_to_l1f(f) (((f) & _PAGE_PRESENT) ? ((f) & ~_PAGE_PSE) : (f))
 
-/*
- * map_pages_to_xen() can be called early in boot before any other
- * CPUs are online. Use flush_area_local() in this case.
- */
-#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
-                         flush_area_local((const void *)v, f) : \
-                         flush_area_all((const void *)v, f))
-
 #define L3T_INIT(page) (page) = ZERO_BLOCK_PTR
 
 #define L3T_LOCK(page)        \
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 0a02086966..2f4e98cec9 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
 {
     unsigned int cpu = smp_processor_id();
 
-    ASSERT(local_irq_is_enabled());
+    /* Local flushes can be performed with interrupts disabled. */
+    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cpu)));
 
     if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
          cpumask_test_cpu(cpu, mask) )
-- 
2.36.0


