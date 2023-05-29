Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FAA714620
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 10:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540564.842392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3XwA-0002p4-Js; Mon, 29 May 2023 08:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540564.842392; Mon, 29 May 2023 08:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3XwA-0002nP-Gi; Mon, 29 May 2023 08:09:06 +0000
Received: by outflank-mailman (input) for mailman id 540564;
 Mon, 29 May 2023 08:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxNl=BS=citrix.com=prvs=506ffa617=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q3Xw8-0002nJ-BK
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 08:09:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112ccb2a-fdf8-11ed-b231-6b7b168915f2;
 Mon, 29 May 2023 10:09:01 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2023 04:08:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH8PR03MB7270.namprd03.prod.outlook.com (2603:10b6:510:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 29 May
 2023 08:08:51 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 08:08:50 +0000
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
X-Inumbo-ID: 112ccb2a-fdf8-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685347741;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CKzLDcN+WtPmClbJg1qt2eeshoV1QlQ7LU0SVlbGlDU=;
  b=dosOffBU8RYgHYh/UYUXBJt68TVhxqqDlkCm5/WLQfQ0IxT352Xcr/um
   7UC+uPCyForeDWXP9JWQOzTswcjDfoDuqbDbvXFydUeoYSU9oL8b/1KFX
   wVbErx1OIoXDsVjFrXU0UlodWX/8svo1snWiqneQFvIdVtkA17Y2Z9mvw
   0=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 110102959
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yxp7bq6eX4Eix0nIOWCZwAxRtBLGchMFZxGqfqrLsTDasY5as4F+v
 mYfDWDXOfeCMDD9e9x+PI3jpkxTuZSAzNQxG1E5+CtmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5ms
 ttbFywJTTS/hP+myZf4FeVhq+ENFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOGF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHuiANhDSezQGvhC3wXL5nNJLyYtcmSxmL6D0kKwavtGJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi+QPu6k2hxPLC9xlT6i8i4StHSmqm
 mjT6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHY1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:h3bsZ6jdjfPtYzvSb4266ilVW3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-Talos-CUID: =?us-ascii?q?9a23=3A0SWQ0Ws1XvKKPmR0dA+Be3c96ItiVT7i0HPzB3O?=
 =?us-ascii?q?7FHZgbf7KRVK93Y1dxp8=3D?=
X-Talos-MUID: 9a23:oS72fwSseCAWsOuERXSz3GlCK51P2J+JN0o01q9et8e1HDV/bmI=
X-IronPort-AV: E=Sophos;i="6.00,200,1681185600"; 
   d="scan'208";a="110102959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8ygu6b+FnGIQ/UV/pqYQHVFrZWqaxHYKrCoal9oyVAYCEbZxLct65m6T8OAqk8fwZacuqKcMIOIAsGnKX06okJhQJnudCXtDjTvok+nyXpm0xfi2Ja2+v88JxrdlzrhnYmPkKuLhJxABUFRl9Sr85GA/mg9IRzCTqtKz/GJYn9wMFWFKeVxRfe7LrqpVepD2IPToo/Lcst7FD9sU615J86thtQw26rf1ZU2WuU3vr9hwp7VDvWPrEhca2lxZOaPNAYqzGh2gtYuSXDtLXOl//QDzUUkJKlS4jvDKO41TQpp9B7eZLiQZOiK+eNJ+lA05uzBHr3ERXQzLiVdnxGPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7khsImkjEpR3DrS4DQjOEyufxofrbpJZMWBFT4z4pc=;
 b=DwO4AZSHcjcOXshcyb2ASY71aEkA8uc17ekoLjJLvIkjMzX7NfVC/Oc2By9yoSy2tdj/rR5y4Ss5PyAhghx1i2ipyB2C3SnMYlCX4DxHO2OVag5hF2scwyRTcNbO8HL/zvMemu1TYS2JSrbhfK8W8cbLLQcLhVGm4BFpkuwlYG/OFaY5KXSmInxD3UMcPQRYWgzjVCuMa7NlKA0dDtecvl+NiSeJUW0eIFe6gxF2h4uVNi5Xksb4iaa3+t1bLG8aeROxPeArenJCcNTH9jY0j7eKA4jHgYNZVK4SWOSSHE1iBVDJZXopioBXjhoVWlRguOdSrxfv6z/Dgq9I5ggbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7khsImkjEpR3DrS4DQjOEyufxofrbpJZMWBFT4z4pc=;
 b=GZtRbgOPx7dtD/rMBUtCI1LhJblZIQnDbVfRFHMKfvDC5I5jetATp1o/ba9PxLriIj6gxkKKzmFxR8isABYvwVlZsb76IHJSFw8EaIlpZAcrRmyUhSOfcFDsth/d/pSorsUr9fu3jo3Qbz3PqVhrnOERniv4X/RvlKDzjkXn01w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 29 May 2023 10:08:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZHRdjCKSVtWVkX96@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4zx+TvUWTCEMh3@Air-de-Roger>
 <2b1b1744-2bc3-c7c0-a2d8-6aa6996d4af9@suse.com>
 <ZG94c9y4j4udFmsy@Air-de-Roger>
 <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cedbc257-9ad9-56f1-5060-eaf173d45760@suse.com>
X-ClientProxiedBy: LO4P123CA0599.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH8PR03MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 1059f7e0-4b20-4ad9-19a1-08db601befb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qw3HV2MGtYDaECO0gznXcx97U8R/j+VeokEp6zY1evnbZc8SoVfaHn2UusFIzt8TnnK0syWqL57jU02Pbwp1XSH+ugL/mTf4JQ0p10CQOsbqstpFntYcSC8hJNelTNXL21Su4JhKSlpg5jnNVOX1AV9cMr3Whms9WjExy5qdo/iD4KiopJnZlyhaX+O03kvVNtSsMaSRVBgAefGvIFWifeUKQSbl+l+08H7JYJ0/WNNsvY+nzmfYP/RBaMifuIQ/F8NEEG1vLC/1G+GT2J0OPIAamxhhP49rX0IrXe07njDg/ji2//sZc28NaoUnqdJGyQaVxO2HXLrRw0KLEJ9QFqYZI6eHSK77ZF9jRQwKZVC2tbkkI7xDYf+CblCZscS2ER3/gwfcjtVn0uxCaxUbXE8B9JE/AvONQt05FL+dfHsFF4NXjfHd4npwVSo6EjIhE5OB4IYchNHGUHAbznZJVYs6tll7k6dacDnq1JkNVdiAAKvWJ6ENNFnyuoMwUNgQyAyiwWvTViCemBFTpcbYGr1k7bB0pgfemQQXAy+/EXYw1OfyFxyWG5d6Hj/9qxKf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(41300700001)(316002)(26005)(6512007)(53546011)(6506007)(6486002)(82960400001)(6666004)(9686003)(8676002)(15650500001)(5660300002)(85182001)(8936002)(38100700002)(478600001)(33716001)(86362001)(83380400001)(54906003)(2906002)(6916009)(186003)(66946007)(4326008)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MExQdEQwR0RtY1lwYStXa0pRelNFY0xuNGt5eTVoQ2d5Ukkrb1ZsQWw4aFJK?=
 =?utf-8?B?bnl3dWluekJocXZidG9oZGgwMlRyZy9CbmpwNkZPUno4VSs4UUprQmdOSjlq?=
 =?utf-8?B?Vkc5RzVmZTBUWnhiMDJJZHMxQTlqMXRqSFB0M21YVGxPZ1ZHbFY0RWNSYjRX?=
 =?utf-8?B?dVhBYmdkeVBib0xwUUhWNkhsUy9OemtmTUtBTHpIYWNCQVRlNzhhSDRIckZM?=
 =?utf-8?B?NE9wZUJCcDY0QkNpMzllQTNKUlVERm51VzlOQU9MOHdrMWh6SHROUEwwWDRz?=
 =?utf-8?B?VWhuMFV3eUtnZ1lERkRhcmhsWmRMaEZBR2hENlpPM1pOSEhpL2Z6SURkaDBC?=
 =?utf-8?B?VnFyYXRBUWY2bFU2TkVPR2NRYVlScjgwSEF1eEVFLzg4bzVqdGtCSVdhcm1J?=
 =?utf-8?B?cUF4U2FraEw4ZHZ0UzZDUXVuODlqb3gwRERxQkUvSU02MjAxT0xobW9ndENv?=
 =?utf-8?B?aGd2b0RMejM4YU14TldWdi94RnE2OU5nQy9ZcTFaOXlnYlJyRE1YOHE1YXBM?=
 =?utf-8?B?d3lWd0FVUWhZVmNSTHpuR25qbnM3ak5NNUZpeXRteDE0RjdPOWxKSk5PRi9s?=
 =?utf-8?B?Y3RYYjY3SG5mQy9NWGhHcWZaQlZTdjBhR3RhbTFvSzFXNmo5L2ptL015VmNM?=
 =?utf-8?B?aTNRVHhSYmczVy85WGdseUFFREtSYnYzSWw1MCt6c3FBTTZncVl3bDkyY1BU?=
 =?utf-8?B?T21ZQVFlWTF3MldldGoyQ2RQNjRxY2lqTktZQmRBMlZGQXg2bUpyRm9TOGJq?=
 =?utf-8?B?QTdZTTRIMXY3QVNaZU40NGdqelV6bmVidm9TZ3Y1M0YvSW5WNHZKRmZPZ2h5?=
 =?utf-8?B?c3hxNnF1WnQveHJmVTB5YnB2Umh5bEpLTWJzVVJCUTB3TFJCWTAyYUhWZFd4?=
 =?utf-8?B?RGVzMzdIcU5UV09rbG1lVnJnK1JaYzB3MmNuMXVWd0pST0xOYk9rSTdRUEdL?=
 =?utf-8?B?NjUwQm1aTFZieTQyWnBZVmRoS3QycWg0VWVtcEdKZ0RaYVdFS0tjUFlJWU1u?=
 =?utf-8?B?RHhJakEwaVBKRHhKOGRrdFY4N1Jvb1NnQ1lkdWZqSWUrRUl2bXZGaVBhV3VL?=
 =?utf-8?B?bnZFZTRKRDZiZGdxYXViTkZ2WWtpZ1ZTSHM3SXBEZGhoVEJjeUQ1RlorUmFF?=
 =?utf-8?B?RGx6RFgvYTFYSEY3b2JzWjBZSE9KUDNCSFNSU2pGMjNIcy92c3h1RUErbVNy?=
 =?utf-8?B?Mmw3cmRudllMVnFKbDR2U2tvc21RNGRsZ2l1K3NtRTlEaUFqZkNnTzkvTjVo?=
 =?utf-8?B?LzN2cGphY0JhdXhOTWFZUUhZZFFuR3hZNDQrV2lIS2ZBMG5NTW04RUxnYVc2?=
 =?utf-8?B?cTc3aVd2ZjlZVG40U3FPWk5vV0hvclBEUThac0J6TWk5L3ZpbjdEUUthQjFi?=
 =?utf-8?B?YWczMHBlcmFtSk10YmxFRjcwNEt4cUNCOWkzSXRzY0UxODhiUmo0Sks4RWJS?=
 =?utf-8?B?b05ySGpvTklHNkUxSmROSUJVSnJRbWN1SFhpYjdCTm84YXlFU0xjYlFPTy9M?=
 =?utf-8?B?dTJwTTV5RDhETndzMmsyNWVibWkybERRMWc4ZVpMZHNtQk9DVGpTWENJaDdo?=
 =?utf-8?B?SS8zMENzM3J0R1kxT2Zyd05IM3YwZVpwV3RtanNQSjgrY3UyVkhBUXF5eGdh?=
 =?utf-8?B?MlJkN2lKN0NPRlh4TitaWWoxRTU5bWx6b3laLzYvT1I5dFA0bktxY0d1d09I?=
 =?utf-8?B?UkJSTFlCcnJEODNsVVBoMDVlQ05scjA1UnhPY1JDbVQ5Z1hXdTlROFhWUHpx?=
 =?utf-8?B?M2YxYzdsQk9DWFFqK3hUaDhFU1cvQlM1WnNFcVJzMDlQN00zWmJ3b0VHdlhz?=
 =?utf-8?B?VXZhNjFqMGNRcEhVbXR2aHZzYytxUG9pOFgrVDFFK1llUHlqN2FGSzI4L2ow?=
 =?utf-8?B?Wnhub1lFQnR0MTU2dFM5WmdiMHJoeXlrbTBQM1BRRjJzSVp2TmxKS25pYWo1?=
 =?utf-8?B?VmZiN2dpeGcrRTFyRFlxY2MyWmZGeis4Y1ZRRVFtenNLT1czVlBCZzU3c0FT?=
 =?utf-8?B?cldBY3paT3lDdUhwNVdkWVBGMEppbzBDQmV3VTRMaTI1ZUdEZGk4TVd6UWVF?=
 =?utf-8?B?MDh2NUhEY1dncTc2ZmpDVkg2WnFRZFFZN3dKalFJNlBGbzJoalgxOHZwaXVJ?=
 =?utf-8?Q?0kLXevTNxBklSeZH3k9T4YuxB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p6C9Y93FUaCLbBD1KRsNFsowEvfjWuR9MZnzGD4JaQWlcPV4SSBizchgBJ2BgdW3g4iwBT1sVVSnyJbPG6GdGUodgCA4wjqPCBt6M7DA0RO7H+Q7sP3ulu2x/EiP/AuoxhnEDYxFiMAATinsIhddjJtM/CBjjQi2NqDfJd8eygAHkK2jhq35sjqAnyzSjapG15gYtRN9YHgV14pwvg0NwDFx5Lkd1VlL6BxIxS/cyT4clk6+pMUf9+er1R7e/O5Thj57oK/hIhA1YnORmUakp4KgbeaMs5M5mMOUVYJ4Oxt1JNaCCionpHEjgKKPkry4xfsB1DMfNoRHykk0PowuvySBUYpWFho/QDYhI6HZUwOtUEbRV4CVfVGZuxSel+iNklGHSZqciHNtud1s9r39lxOxhJRH+ySYYWK2B+MhFjyD2+wWEkHs3L2vvSXc4ebyhd79DdVJCuxlfXEzXrwvZLfEMezmrIS96yH8UlusAJ7EC/eeqhBrzqPNqiBB+pZPZHKyowYQUOors55QWDFP6BPFCSS1SN1IZYyTUdx1C5jK3NBqZiVModXVf/f3j0Mt/ja62vF+gS9xgt8r1LgRuyGh9MVyd89nMbI81c2Nn7EIngMMPZHw+kbqXp4rPj00bm6TuzGOIUFNQJeF1ettsk5ZIJm9T+3N6rPzS6A90Vaq5ow7klop6Cnc3Aw4dGAEklL4DdzO+cJtoCU/JiXbnUlEYH3UiKP35y1VUd+AJ6oVMQkZGQYpuN9WfUkJjo3vXEEWRt21h0IRUoMPqpuOZg5NU5SSiA/UFMQ97A5bQn2/bodFtyTQVx4PsHVGqC8vEpaebp0N3JI1o5rVa+uhmg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1059f7e0-4b20-4ad9-19a1-08db601befb5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 08:08:50.8385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqMj9J8Jln0FMRYgzxDopY4vf2AszR+Gku1foGKNsZbhulj2Wcouvv13Htroq/2/B2fx6xD846HIGmBPIxe8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7270

On Thu, May 25, 2023 at 05:30:54PM +0200, Jan Beulich wrote:
> On 25.05.2023 17:02, Roger Pau Monné wrote:
> > On Thu, May 25, 2023 at 04:39:51PM +0200, Jan Beulich wrote:
> >> On 24.05.2023 17:56, Roger Pau Monné wrote:
> >>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> >>>> --- a/xen/drivers/vpci/header.c
> >>>> +++ b/xen/drivers/vpci/header.c
> >>>> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
> >>>>      struct vpci_header *header = &pdev->vpci->header;
> >>>>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> >>>>      struct pci_dev *tmp, *dev = NULL;
> >>>> +    const struct domain *d;
> >>>>      const struct vpci_msix *msix = pdev->vpci->msix;
> >>>>      unsigned int i;
> >>>>      int rc;
> >>>> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
> >>>>  
> >>>>      /*
> >>>>       * Check for overlaps with other BARs. Note that only BARs that are
> >>>> -     * currently mapped (enabled) are checked for overlaps.
> >>>> +     * currently mapped (enabled) are checked for overlaps. Note also that
> >>>> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
> >>>>       */
> >>>> -    for_each_pdev ( pdev->domain, tmp )
> >>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
> >>>
> >>> Looking at this again, I think this is slightly more complex, as during
> >>> runtime dom0 will get here with pdev->domain == hardware_domain OR
> >>> dom_xen, and hence you also need to account that devices that have
> >>> pdev->domain == dom_xen need to iterate over devices that belong to
> >>> the hardware_domain, ie:
> >>>
> >>> for ( d = pdev->domain; ;
> >>>       d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )
> >>
> >> Right, something along these lines. To keep loop continuation expression
> >> and exit condition simple, I'll probably prefer
> >>
> >> for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain;
> >>       ; d = dom_xen )
> > 
> > LGTM.  I would add parentheses around the pdev->domain != dom_xen
> > condition, but that's just my personal taste.
> > 
> > We might want to add an
> > 
> > ASSERT(pdev->domain == hardware_domain || pdev->domain == dom_xen);
> > 
> > here, just to remind that this chunk must be revisited when adding
> > domU support (but you can also argue we haven't done this elsewhere),
> > I just feel here it's not so obvious we don't want do to this for
> > domUs.
> 
> I could add such an assertion, if only ...
> 
> >>> And we likely want to limit this to devices that belong to the
> >>> hardware_domain or to dom_xen (in preparation for vPCI being used for
> >>> domUs).
> >>
> >> I'm afraid I don't understand this remark, though.
> > 
> > This was looking forward to domU support, so that you already cater
> > for pdev->domain not being hardware_domain or dom_xen, but we might
> > want to leave that for later, when domU support is actually
> > introduced.
> 
> ... I understood why this checking doesn't apply to DomU-s as well,
> in your opinion.

It's my understanding that domUs can never get hidden or read-only
devices assigned, and hence there no need to check for overlap with
devices assigned to dom_xen, as those cannot have any BARs mapped in
a domU physmap.

So for domUs the overlap check only needs to be performed against
devices assigned to pdev->domain.

Thanks, Roger.

