Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B99563439
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 15:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359010.588406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWi-0001cI-Hm; Fri, 01 Jul 2022 13:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359010.588406; Fri, 01 Jul 2022 13:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWi-0001ZV-Dh; Fri, 01 Jul 2022 13:17:40 +0000
Received: by outflank-mailman (input) for mailman id 359010;
 Fri, 01 Jul 2022 13:17:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ipL=XG=citrix.com=prvs=17451e3f9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o7GWg-0001Gx-VU
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 13:17:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c05b488-f940-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 15:17:37 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2022 09:17:25 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5693.namprd03.prod.outlook.com (2603:10b6:a03:2de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 13:17:23 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 13:17:23 +0000
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
X-Inumbo-ID: 2c05b488-f940-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656681457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1CEJiaivUyqrXZRdB2bbG35oJ0UdQJFYd4ZZZCv6hM8=;
  b=SYWE5niCsbsbC/rNvoa9FFkqIEGUHldoCva/S8SWC9UQCkos+XcLe6qN
   37PQAtocwhiujjQBXNO8meK+TI+pmrgkzqldNFt+dVfGC59sJ1K4hISGF
   dcZtKrvuNOCs8TY92jN6ab9sCjlqGzEMaSmVz+11gcWCm/bO+zxKW/rGt
   E=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 77459718
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:urJXZKgWLbLjr62xh01/iSjZX161ehEKZh0ujC45NGQN5FlHY01je
 htvW2rTOPiMMDOjeo1wPozgoEsF7cCDzocwGQNsqiszQ38b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXFvU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTo5FaLJxPhCaTwbKzlkHrFLx4bfcWfq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWlg7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w3J+Ptouji7IApZ7b3HHcTqeeyxZOJVnleXv
 13ioXblDURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BCL
 QoS8yknr6k3/WSqSMXwW1uzp3vslh0RRdtWVfE74Qely6zI7gLfDW8BJhZDYtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluP1TM9KGYDYWoOS1sD6ty6+oUr1EuRHpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:u8gZdqHxTnVcU9ZnpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+txKH
 LajfA31AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ni4kY1jiV2jPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.92,237,1650945600"; 
   d="scan'208";a="77459718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fo/QXDFi4GWnJVaRWfqdHPnXMUNAfG6RTdr0lSkV04bXHk+pGPPlO3d+/oObzOpukiUVlX093O+pitVgSNLvyinVilP5ci4GGiJxGREEcU5n5MHPbHhMAC3szbeS5tcxSahuKBaGple7krhSyCPjOuQg8Ft9LQLKTCRhTySVbLs+A2aB2jZR7jv3RdtzYiWExK/Y1KHgwFh6YfYuHlBM/HZPNiGDkCeWO63pwVLZrK65LekTUBG4G7YlKqEFg8lX9y4omcAlrykeTJIbfZSdXQ6LcCQbAnXp/rCiLbNPKAsI7SKy7MVsmdqTroFsaOzUgtsYN8gqdB4Cl9QmNsjj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uziEhWz0IVen09NpiCSfuedX9CMVUDdY/Qb7fXmqvOY=;
 b=Pu7/KF+n2UCjVXUMU18o47yctZhmUe00b1tbXT8FC5Q7wNfikCOuNBKxvwMTEfquEYWWt+Uygz4vVldrZ6DArr8lAaUWtbu5P2JUmhY9ppo1U6kvzlULJ1AuOQYTPYTv4jK7k+IoZ/MMGRQBRvFLHA6YjWOeMXqX5UXMskDagV95BEONakJjsDNUgWRKXMsiwRtSMQmzbmFkpMuR4TV+E3IfA+G5yf520Z2ICSA0nkZSLLpfMx5PNMaBK3aETjlBm3LoctGWFODHzly85H32CHOav8dvb+DtpG1FKSgnvCskLMtWlMw96gI6h+8Ufb2prDV3/Le3XKW3nH68MKLeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uziEhWz0IVen09NpiCSfuedX9CMVUDdY/Qb7fXmqvOY=;
 b=RKdJQmGPRzroloUkWG3M/YtCOCDMQRTmuIUBnTE47t+4nAzQgVcQVuwBG5lvx1k0o03iJvt7ylhP0U4ftBImoAPZ+z4i+3uJVdFtS5pjQ95GemlUxselTCPfLpwI+iY5GgUhif4BbxqwNieXxsNFnSmfVksQT/HkiTFk8AY4Xnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock detection
Date: Fri,  1 Jul 2022 15:16:46 +0200
Message-Id: <20220701131648.34292-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701131648.34292-1-roger.pau@citrix.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f6f9143-42c0-4d7f-9f94-08da5b6408ec
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZBVauaUFwthmuKZRyO2A5PgS0Nh11H27SMxYuehvLpcYJBCPELCPHFTU96rLOi7n5pWmL9YxjSCP1C4KbyL7UxYzIsk60fdgG728wPoNvzgZM2q82ShsW0DeQTuKKxAMRu6yN49p3hrPnCgt13hwBJcFztT1pn4ut+F0P5REuSMe15xPHs7YHMIYeN5Dolsa+Ym50qqiqNp3GfLKZ69vHgX2An6pL1OaMN69YLGu2ToVn6eEtPDa7Avbf6XzR5XOalNcCjtqB6fJfhQZYuwCsHKxWGcI0P6W0SaRBwvWxR7cth5WwQ4/vEYEixgsaz3GzJ0BejYxb20Z+NAoxOolcmA0DVzRAm/DdG35ieWDZZvaTGlvQ+IqrHacYONyxsp0C1v0y6gu9O62eCN+kHI5oclKCKlxl9UBMWIjgOYnnX5PwrvPPXVBaePH/POA2ANiNR7PYgOldD8V4zBvWduMXkg4prYjzl9zpTzTaEQXDULni0iMnmghYO6/Te/yoiVqVUDw0fvjX5Q0o8y5tmeqcM8D3UlfaU9acoxgfLbYWs2c+p8pb48js3ie+b8/T8j4lReEW1qykJYQcfUmgiqt12KIWyBOA0NRsNn0sFZgu4TygNA7W53+wy5d7hak9BAdAzamABTugebPfV39tRGW/xmi/HR5tOGgcNgdsHewUsABr1vAVFFSVb9xjwqGwnfgnYoaKuExGi6m5jsZj8co2MMSsrY6DJ5JPCy5mi43astZtBfFmdZ86Iip4cR1Xz3+9t/Z3n1tnVgEYGRsystzGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(38100700002)(66476007)(316002)(82960400001)(54906003)(6916009)(8676002)(66946007)(4326008)(66556008)(2906002)(478600001)(6512007)(186003)(41300700001)(6486002)(1076003)(6666004)(26005)(36756003)(86362001)(8936002)(83380400001)(2616005)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRvRHEwdkdtNEVRMGk0TktrU0ErV0p2S1RJTUg1d2lic0R5WDlsa3ZRYUQz?=
 =?utf-8?B?N0ZOVi90eWRkME1YZFdSWnNzSHlpa1BSdk03ZWxTR2p2UkY3MytQaStQb0dH?=
 =?utf-8?B?M3VlN2dMRFVrY2NZZ0lJeE0ybVc0MEIyRFQ1K1dZZUxST3hUWHFVRFF6dmt6?=
 =?utf-8?B?SnRacjltK3Q1elFlZDhSV2llV1BKUE1FTmFmbmMyV1IxT1RlU0hNcVNBU2Fn?=
 =?utf-8?B?cmZtTy80Y2QzQitRemZiMEdLM1RoQkJ6WEJLd1IvRXFwMU13VlExUGQya3ZP?=
 =?utf-8?B?aGxJWUMvdHZ4aXp5dEV6N29kQmVyLzhLTGdEM1B3elJidnZJUUtiS1drRW9V?=
 =?utf-8?B?UE5JRWMrNWg0cXl4cXNWbTRSZjZZN1Bvd1hDam05Ymg3bDBwdHFpSlROS2ZC?=
 =?utf-8?B?bzNkbHJha0RRWVExWTBudkpxb095K0gzOWI5Uk8vTEJIYzVJaWxNd0JKaFZv?=
 =?utf-8?B?eTdjZXpYVjE5T1NGQlBlTjZCZE81UDJtTmFhN1BkZFVMNmswdlp1N2g5aXBs?=
 =?utf-8?B?bmNudGhnaklyb212c0NNV0J2b0syTnNHdG1sK3dKd2x0WlR2eUw0WXVKMDNr?=
 =?utf-8?B?WmJXd0FoTTZEZVRHaWpBVlVDTjlMR2pYL1lET29nZkhwK29meFpEL2Y5OUE3?=
 =?utf-8?B?YzlFUjJzTW0vWE1admFoYUZJMDhOOFU3NHpKdzJqSWt1WU1VSk1xN1FLSHhE?=
 =?utf-8?B?RGpTZG92dk12YkVaZW43cnVQbXZ6WHAzRjA0Njk2cFpoUUU3WmpJS1doTTFE?=
 =?utf-8?B?SDE3ekVOd2dNK1I4aERpalY5bm84a1hSUDFkeVpzM2FBWXluUE15bkhLYkpU?=
 =?utf-8?B?RVQ3UFcrSHBZU3M4ZGFkS3BMRW1Dcjd1TGI4ZktIT0MxOGs3WG1nd21kdHU4?=
 =?utf-8?B?SUVreXMrQksrOG5DdFcxRllDbHVSRGNVTVBmSUw4QXErUllBejJ2ZEZ3c0x2?=
 =?utf-8?B?TVdLMHVCaktXRC9QUTlPTjFudlMySlRlWDdvM3l3TjYyK1BJaW15ZVZidHhM?=
 =?utf-8?B?NUk1WTMxU2VkRTVTYm12RUdZNDNzVW9TdGlqYk0zTUdiUlhGYzBuNVNMVnlB?=
 =?utf-8?B?b3lyaVRLY250czRja0ZxbjhHSlBSNGNJQS81WHllSXlmM0JFN0VLZDZwMDRq?=
 =?utf-8?B?eGg0ekxSN3g1VUNuZDhWRkJncVp3R28zNnZSQ2JiN2dhTU5JRGdoSjZuWXc0?=
 =?utf-8?B?WHpzcWtXb08xSHJnOWE5b2ZmRDJsejJCYktMZnVYS0ppQVBSazFmUUU3SjRh?=
 =?utf-8?B?ejhyOWRFbFY5bGUyR0hBSitob3lmMmxQTjVZeXFPRmtKUFU4Q0U1WnhOZG92?=
 =?utf-8?B?THlMQ2t5ZHZXMWsyVEt3eFFkbXgyWUNhZnVvVmNKQ0lEekE5dTUvb1laUVNw?=
 =?utf-8?B?NGI1amk1OHZZZU5NOW9UWFFPR2swdkpHVTNmcUl1dDdZOThlL1ZyMlU5blZC?=
 =?utf-8?B?eU9IeXQ5N2dXTzZHTWtVUGdNUC81UVdBREt1b2lKUVRMVHVKRGg5aWczVGtt?=
 =?utf-8?B?elYzU3JDTlE3WFdCOXBFRFROZGs1b0JYK3N3aml3TURRZzBUU25EQU1vWTJI?=
 =?utf-8?B?eGQvMnlGMklKb3FSc0dwQVhLendycDYzUW5JdjU4bGhzZm8xVVV1ZFhSNGVz?=
 =?utf-8?B?NksrWTFXNEpwU05FSlNGeGZEZzN0K3lTQ21jVU52Ym1pNnAxVFRjYnRndDA5?=
 =?utf-8?B?RHFVZStTa2xiY0J2eTE2eXkrbFl0a1JKOFMwdnF0cDVnTHNudVJ1RVNPKzdD?=
 =?utf-8?B?TkFqTnRWMzVNRS9oVW9IR0phb1hFRWJzL2pLQ2kwSCs5dkRULy9KSzk0Q0Uw?=
 =?utf-8?B?bDBpMGY1dFlCeWxxL1d3QVo2MXhtL2NCYjZrUjk1a1pIa1pINXVKdlkrLy9k?=
 =?utf-8?B?VmVXc240WVgvUnJ5UFlJaUpKaVhEMGNZNlM0YUwrL3JpZERWQXBnTUFRc3Bq?=
 =?utf-8?B?eklhaHAvYzBuL2R5MjU4V1dCVmpleDNVTWN4SlR5YXd3MCs0czRlMjBFK1Yz?=
 =?utf-8?B?RG82TmkrYWI1L0hWa1lLT1VaNzg2RTdpYXdaUld4cHBwOU05QlFVaGt5THIv?=
 =?utf-8?B?eDdnZ3hibmtEbDh0dWhvcUFBdzNTTW9zSDcvdlc1YUFBN2RWck5MVFZMSDFa?=
 =?utf-8?B?dDdsTWJtMXE0MGhvV1pVZU1zbnBVQjBLWlJnRmFiQUh5cDZPMzROQjVGaktS?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6f9143-42c0-4d7f-9f94-08da5b6408ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 13:17:23.2178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZZAUZth4xT0SnvsnTp5k3+H+xpBrCNIyFy76SpYozpiQOefHAg6OFRv/qy6ym6qBbNXM6W1OTbhw3nfp0RmAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693

Add support for enabling guest Bus Lock Detection on Intel systems.
Such detection works by triggering a vmexit, which ought to be enough
of a pause to prevent a guest from abusing of the Bus Lock.

Add an extra Xen perf counter to track the number of Bus Locks detected.
This is done because Bus Locks can also be reported by setting the bit
26 in the exit reason field, so also account for those.

Note EXIT_REASON_BUS_LOCK VMExits will always have bit 26 set in
exit_reason, and hence the performance counter doesn't need to be
increased for EXIT_REASON_BUS_LOCK handling.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v2:
 - Subject/commit log adjustments.
 - Simply logic given bit 26 will always be set.

Changes since v1:
 - Adjust commit message.
---
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/hvm/vmx/vmx.c              | 14 ++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h   |  4 +++-
 5 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 56fed2db03..d388e6729c 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -209,6 +209,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_virt_exceptions, "Virtualisation Exceptions");
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
+    P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
 #undef P
 
     if ( !printed )
@@ -318,7 +319,8 @@ static int vmx_init_vmcs_config(bool bsp)
                SECONDARY_EXEC_ENABLE_VM_FUNCTIONS |
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
-               SECONDARY_EXEC_TSC_SCALING);
+               SECONDARY_EXEC_TSC_SCALING |
+               SECONDARY_EXEC_BUS_LOCK_DETECTION);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f08a00dcbb..853f3a9111 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4065,6 +4065,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
         return vmx_failed_vmentry(exit_reason, regs);
+    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
+    {
+        perfc_incr(buslock);
+        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
+    }
 
     if ( v->arch.hvm.vmx.vmx_realmode )
     {
@@ -4561,6 +4566,15 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         vmx_handle_descriptor_access(exit_reason);
         break;
 
+    case EXIT_REASON_BUS_LOCK:
+        /*
+         * Nothing to do: just taking a vmexit should be enough of a pause to
+         * prevent a VM from crippling the host with bus locks.  Note
+         * EXIT_REASON_BUS_LOCK will always have bit 26 set in exit_reason, and
+         * hence the perf counter is already increased.
+         */
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 9119aa8536..5d3edc1642 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -266,6 +266,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS   0x00040000
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
+#define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -345,6 +346,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+#define cpu_has_vmx_bus_lock_detection \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155..03995701a1 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -159,6 +159,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Exit Reasons
  */
 #define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
+#define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
 
 #define EXIT_REASON_EXCEPTION_NMI       0
 #define EXIT_REASON_EXTERNAL_INTERRUPT  1
@@ -219,6 +220,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_PML_FULL            62
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
+#define EXIT_REASON_BUS_LOCK            74
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index b07063b7d8..d6eb661940 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 65
+#define VMX_PERF_EXIT_REASON_SIZE 75
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -125,4 +125,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
+PERFCOUNTER(buslock, "Bus Locks Detected")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.37.0


