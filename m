Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A0525FB2
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 12:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328385.551381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSe4-000297-J3; Fri, 13 May 2022 10:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328385.551381; Fri, 13 May 2022 10:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSe4-000264-F5; Fri, 13 May 2022 10:35:40 +0000
Received: by outflank-mailman (input) for mailman id 328385;
 Fri, 13 May 2022 10:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npSe3-00025y-38
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 10:35:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c425a6e-d2a8-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 12:35:37 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 06:35:34 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2819.namprd03.prod.outlook.com (2603:10b6:404:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 10:35:32 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 10:35:32 +0000
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
X-Inumbo-ID: 6c425a6e-d2a8-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652438137;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=kwxTFr5F6CSXIMRptM2BX/K/lUueF8Uj+EjtZEw9lYU=;
  b=VXpWvYNvLcK0ygZueI4RFMSEjEsshaWhWJBivsz0oSEQ7WujhREjj3vd
   P5x5EXhwZ0FWq0vHo0xCDPtXUNuhHNjte9GQETQhR7AZ0hX66vhXsXUx6
   zYWpKuVrHOId+A9aMFVO9mBIEsToeyax6e2LwUxsii8ulZoqLD2Z1QswG
   k=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 71235105
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Sd86ZKmry27nKbyg2BmOWtLo5gyGJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWTvVM6vZYzP8e4okPdyypE4HusSGytcwHAo++S49EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWljV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYYA4DZafpxuAhSEN9CjAlG5dP6qSXGC3q2SCT5xWun3rE5dxLVRtzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXtJkBg25YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8QjO+PNvvgA/yiRTj6bBAPaWQOCLbvsJhk2Im
 UOb4kPQV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWRNZ3O
 0ESvC00osAa9kOxScLmdwalu3PCtRkZM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcOscY3QXkm0
 wGPltawXzh36uTKEDSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa3871qbnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:CJQqDKhLHs5bqs0jEYU7OylHtnBQXzx13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMzVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xA+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXAnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxOIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8e1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh57D3xHklX6voIRiKprzOSI
 JVfYDhDbdtABinhknizyVSKIfGZAVyIv+EKnJyyfB9nQIm30yR9HFou/D3rk1wiK7VdKM0md
 gsSp4Y8o2mbvVmGJ6VV91xNfdeNAT2MGPxGVPXB2jbP4c6HF+Ig6LLwdwOlZGXkdozvdMPpK
 g=
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71235105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+sYFPn3o5VAt0W5dtUM1diPHcgKkep6sc5xrgrdyWBGfG7hs88XeY17hCXYJETwRnbJqlN0HZHAvM7lXNYSu7Ixiyf8CelN8QBNyuefkIYmDDWRQ8/NG9IarRXUS4DUYRSGmzpE/ThWvrB3T1nrjNqhbijwOLtnM4Dsu2dXOGZ94rOPVIIdPKWcrPr8vjdcrYIrlHdK2dKwGM9qgoSQpEjz2F8I9bVUpDQMR94vMMG/l6IvmW5y0DQAZ6SXvmRMNhVaKzcTnTwV2NLAoLj7cJKm3dxiLYKxzYI1c3ACqL26u3GqKNCP4h9aimoGv+aoWIz8Kl8YtgeSYwz2HrfwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJVuBkdSGC+1p8QkOTN2jFLWWi099Q4WwQFh47ImKJU=;
 b=OsgR5hst0aQ8rtugPju+GLbnpHu7YxhzTwFTAliao8OILoz+FA6GABezfPdtEepTWKgfDYVf1DJoYr8veaB3uV9baSmubPvgj+4vsxtXftS/mK+n7fV1Qjm7qwA8pEeAQ/lU9183Mr+/GuW5W5NJEnsV/BbFqAA+eTJUpjBXmn/ed4pPQTTrh7FforlIzicH8ElDGa8JYPx9GCHUDk7fiCVqzdaZTFoE8ehW9D9Kz2Yb9BZRUyqDIRESLMtM6fFcEmc6MuXglaYUY7gbZxgjGfrZb57RKPoDOtfK8L5RzKXGcPa5Nr+iGGn7Kzp21AN9QvaArs3bNCHAHwyVIlDvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJVuBkdSGC+1p8QkOTN2jFLWWi099Q4WwQFh47ImKJU=;
 b=Bhw3P5tjGWsgxZtkYZnc7TieINDrxKRB4txi638W1xKR4tHA+UypxRhcS2jb+oNSU6vRwiK7gbt+h2oFQ3TITaky9IdDg7KuKaPP/IkaJGxStl3nygDtXLnCmXpMw26qkHaFQ21KlDWzac8ZjOsFyWsT2eUQz4VrJZiZ9CXuISI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/cpuid: expose MCDT_NO
Date: Fri, 13 May 2022 12:34:58 +0200
Message-Id: <20220513103500.3671-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 193b8be2-7013-4177-db5b-08da34cc4e61
X-MS-TrafficTypeDiagnostic: BN6PR03MB2819:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB28193FFCC171EEF5272725CA8FCA9@BN6PR03MB2819.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gZgqJet1bugkEzCQp+pdLoJG9najLDxXrD+7PvGtrRtLq6nhOrndMIjkzMh4DJj3sfetN9UBXhKAQuKn7Jiotbaek93o8M8d2MS0RT+8rznzpf9/pmtZrtuGtmkqUKnSEEvs742e5Ezt7oxWdmQmIGjogJyqt0LElSF8SZTXliG7pBdxXlqFR+R04zilfGChAroD3xH7xnQcKIoYe1QlmXqNMDQVkm/clb1caEA/SizEYRvAtow42xNieBNFDmHU2q98cKSHyhF7GVt2UZgp2qjNc6X1eiefgoxJAejkLYsY97z5VSoLZIVg8GhD3LavqTRoHDj7WrCa9RoBuHFUgOkqF1Ek751zSJTN79QOhi/bB2sr/t8ySH86pWyS3QFAZRnKUuon4wRJxbn0G1KRBKtyMFz8I3f4O4m5GRugTD6vHuYXt/C7j0FLrBEnlCo3/ZtGOt2v99T4SOnpAGVqOvwB0gj7SbJj9Qn5e5LGf4/bt3pJVa5hWZNPOtk29UA2kDONYvyy5eRkR48oq3XWEOo8goJ95USb0toV0PAbEmc34zFNrQYgwSqks/o3jQgTQT9i/RfHfG2cfoSLUuQ2mi5h45JXs/SRiEL/dgycuxpJANptrFutTU3jkx4PQcS+f3wOJFT/8fLEzA/RO8P27Vsxmwi1xOyxasRoVUl/SY2gZ2Fl/VFDdpPMz33Ple/qiDxECMxJPh9ysZYT8na6iH4yr9JTpkYxDup4d0dA1l0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(5660300002)(1076003)(186003)(107886003)(316002)(6512007)(66476007)(54906003)(82960400001)(4744005)(2616005)(6506007)(38100700002)(86362001)(66946007)(66556008)(6486002)(4326008)(6666004)(966005)(8676002)(36756003)(8936002)(508600001)(2906002)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3NpbHd6V2pSWERvQStheGh3MXFSR1hmL0c4Nkl4a1kvMmpaL3pCZzJYQ0Zk?=
 =?utf-8?B?QXo4Z3FvSWNDS0IxcG8rQ0dlVWJPL3FFL1R0UFIrNWlNUEVqd2YreUlrSXRN?=
 =?utf-8?B?T3U0OEJBWitwZTRkblZFTjErQXNVVDUvWkNnUWs1TXJ5QURObGJIWUc1TEVm?=
 =?utf-8?B?OTRnaitQRFhsYzlnankwSDFPd2RxcHQ4QjlxWEE1WEJlSE9rR3JqRlFGWFdQ?=
 =?utf-8?B?ZlovL1gxVmpxMjZ2bjR3UmpGRTk3dXI0T3lWUEkxMkVTQjNDMi80WWs5b2Ez?=
 =?utf-8?B?SkNGMVBmZ0lxZmorN2I0Zkx0LzB5citPa2QxeU9mV1NoaXQ5VzgxZmZPSCsy?=
 =?utf-8?B?eUh5cm05eWs3SDJpVGFQV1RERlcrTmJQZm04dVQ5aVdwclBRN0VGZlBpMXg2?=
 =?utf-8?B?S1BvcWlSd2hBMEtuSFZQMTgrSVlwaVFHb0o2N3RkTTdRcnY5VEJSdjVhbTA0?=
 =?utf-8?B?NXVCVGh0YzVFWFkzUHRITHl1cmhGTlVaVVo0Y2ZtR2Q4VzlTUzZKVVJ2TWtt?=
 =?utf-8?B?L0dYSS94SDBLblBsUGZZTUR2aEd4QWIxMVUrcC9nZEhDRithMSt6L2JINzVC?=
 =?utf-8?B?V01YeUh4ajcrb2djeE96TEc5aFd2TVlvNWp1eXR3bkQ2VXlSUSsyWVdrUFN5?=
 =?utf-8?B?cFdYNU9WallSQTdmMFY5dDdZVXZVZDdsRnJHcWJNTEp3RWsxNkRzT0d2MFAz?=
 =?utf-8?B?eU42bUwwa080Y2NjYUZrcWRlR0NlSG44bUJIZFFrSTl2TjN3bVVCUngzME4r?=
 =?utf-8?B?ZHZwYVBoZjFiMEpGYjNnZzV2UVl3NkdiTHI5V1ljZHZ3YXFReGF5bmNCNHJI?=
 =?utf-8?B?VWFLUTBHNlI4bGNYQ25zQ3FHWU9Ea2VET0VSL1VIMUMyeS9aWjdGNlh4TmIy?=
 =?utf-8?B?Mlk3TkVEZW93OUFSZzZGaThtazhxUUNOK3NldGg0R2pXdUJPOGhyS2NRb3M5?=
 =?utf-8?B?anBuTnExQmRiWG0rRFFtRW5uRG5POWx5RU5nTWFxT2xkUS9QUEpVVWxZRHZT?=
 =?utf-8?B?UG1qNG94TmVyb0R3b1VTYVBmU2d1QlM5dXo4NEhIZkVCWjk0T1hmVkpIVS9S?=
 =?utf-8?B?NVVPMlFLSTlEZVVrMW9JZGJhemJodk9QSkFqRC9maHVTZ09CK3g1aGswTFpk?=
 =?utf-8?B?NkJFbUlIK2U4WWF0cWs5NDBRUGdXanhXTlZMUXczaTlzcFkyMFpCY2p2Zy9p?=
 =?utf-8?B?QjFoZ3oxTWxYVUZkOWRBVnNLREpSM2tURTlkVEZtZ1dhaTBaZzA1U3VzZ00x?=
 =?utf-8?B?SjNGOVJvZXRCT0VYdDl0SGlQV2RxVnpPTjhTUnBjakZYS2pMa2ZWMXBJLy9M?=
 =?utf-8?B?VFltSDdiSVhNeFRacjZzU2p1ZkxNUHZ3cmJKM29FTW1VcHNQV2Q0VUdGMFBa?=
 =?utf-8?B?VEo2OXdMMnpTZmJzKzBBVzVJbXgxYm1TV3JkbktDeUZDRktnVjVNVXpmMDZ5?=
 =?utf-8?B?aFk1akZ2QmkvamtDWjFrRlJQaU9pS3ZrMXNZRHVGRTNzVm80VktLWE90WHNV?=
 =?utf-8?B?YnRzaFhBSS82REU1N3hXTDlkUFYvR2RhNFRKNklvTVFTVjRFNGRsNSs2WXd1?=
 =?utf-8?B?OU52eFMrTW9rQmhuSk9UMm5HN0dhbEdBekZ5S0RydlRPY2hiNUFQYzVKTjd1?=
 =?utf-8?B?cVp1YTgzVjdFTHJUT3hRNVZTWjlVZXZFUi9PR2JTdFdhMzBtcUFBdlR4TGth?=
 =?utf-8?B?NmtGTFZKZVgrSytoSmRScFcvZnFYTURpQTYxUDNtVjY3K0hYRm53VzYzSmhr?=
 =?utf-8?B?ajEwQlVnR2RockxlRHlBbzdSS3hPSnRWMWkxVVpUa2trVEVwWTdGVU9Zbm13?=
 =?utf-8?B?R1lCWmMrNDhGYjBpS2ZYeitiaUdBOXZKZTdla09SUU1TcHBXOTBleXMrZ3Rp?=
 =?utf-8?B?UjFicForSXdVb3dIVE93R3FWSS9qVEJuVFFURDFBRTY0MGkvaVd4ZzZXampY?=
 =?utf-8?B?UHFHRC9GdVVvYzRUQ0RsL3o5Y2cvQStGVE1BZ3Q3THBaeS9iWDBLZmM5eWM1?=
 =?utf-8?B?M2tvVm1mQm1ONi92UlpxWjdzTXJ0RGpYMXFUWHErbDZFNlVsVDVYVWgyeWcv?=
 =?utf-8?B?MTJnTUkwYXYrWXk1SllJdjFZeXRnZ2VCODRHYSs4eHdOdWR3WnJQSlc2VzdI?=
 =?utf-8?B?Vm92R2s2QWFQSkNpc0NqeEpTTHY3dS9SbHB2VUVURmJXYkE1bFpSUGhNSHI0?=
 =?utf-8?B?a3ZwN0hpcVFhdXZaV3FFQytzU3NDNklCK2FaTWhjTkdMN3c2aHJLQTZsQTNt?=
 =?utf-8?B?Lzl0ZDJXNWU0elZCY0lPU0NVY2hqejlhRDVXcjkyM0VTb0c4VDJ2RmNDL2xn?=
 =?utf-8?B?TWlZSUI1V0E1L25uUmFLd1hkTGtqZG5FbXYxbmFOVS94R3g4TUlYQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193b8be2-7013-4177-db5b-08da34cc4e61
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 10:35:32.0136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAyssV9jbbiEJFcarWZypKSGeBlSnyQkZb07O5hLP4K44AnKI2dyAH//qsnLloRVTT3TZurLoIUvVp7D9R4Tog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2819

Hello,

First patch is about exposing MCDT_NO when announced by the hardware.
Second patch adds detection in Xen to expose the bit if the
family/model/stepping doesn't expose MCDT behavior.

Document about the feature can be found at:

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html

Thanks, Roger.

Roger Pau Monne (2):
  x86/cpuid: expose MCDT_NO to guests
  x86/cpuid: set MCDT_NO for non-affected models

 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu/intel.c                    | 70 +++++++++++++++++++++
 xen/arch/x86/cpuid.c                        | 10 +++
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 5 files changed, 83 insertions(+)

-- 
2.36.0


