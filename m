Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333E4640302
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451631.709419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p127q-0006Gh-Ug; Fri, 02 Dec 2022 09:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451631.709419; Fri, 02 Dec 2022 09:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p127q-0006DY-RU; Fri, 02 Dec 2022 09:14:30 +0000
Received: by outflank-mailman (input) for mailman id 451631;
 Fri, 02 Dec 2022 09:14:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHVG=4A=citrix.com=prvs=328764c7b=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p127p-0006DH-5Q
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:14:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3cb5a8e-7221-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:14:21 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 04:14:25 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SA2PR03MB5931.namprd03.prod.outlook.com (2603:10b6:806:119::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10; Fri, 2 Dec 2022 09:14:23 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 09:14:22 +0000
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
X-Inumbo-ID: b3cb5a8e-7221-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669972467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mP9ji4nI7RMjNsk9his0Cg7RPLhuUMgGCCghio9OEBc=;
  b=NVrSanPnCW1ORPhZLoYCKO49MjYxdUmNJLlGinuOvReBxhQTcpyZYcJT
   17nUihMxDwd8dW7pbCIqgxOfhSMFf3z2jm7YvCD79jqSyIWBLbHMHFmYA
   zrAwyGYhkeEIDtWg3+DP0s90shCER2O9AMFkMWWHs4BC1NdEwbWSZq0zW
   Y=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 86234210
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tJSn7Kk8nXZaVdveSMGymDjo5gyfJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXGvQb//fZ2r0ctggPI7gpxlXu5CDnNExGlNupSExEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5AWGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fMCLmE1fA6Cvvi/wbSYFeBRm88pdta+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieezWDbWUoXiqcF9lUaCp
 3na/m3/RBUbMtCexhKO8262h/+JliT+MG4XPO3mrKU22gTLroAVIAc2fgu7/tmmtmiVYPMGL
 XQUxQMoirdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQm3
 0GEt8nkDjtutPuSU331y1uPhTa7OCxQIWpcYyYBFFIB+4O6/991iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:H/7+Bat2XYqqiBYevubo4vhj7skCpIMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhAo6HnBEDkex/hHPFOkO0s1NuZLWvbUQiTXeJfBOnZskTd8kTFn4Yzu8
 ddmsBFeaXN5DNB/KHHCWeDYrMdKe28gduVbKrlvgRQZDAvT5slwxZyCw6dHEEzbA5aBaAhHJ
 7ZwsZcvTKvdVkec8z+XxA+Lp3+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAuQ3k4aeIte2913bnph3uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkYLGGtCBdmpDQ1L5/+u
 Osnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoB8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KUuZkRkIMYjgYJq3MUiFQJuYeE99RvBmfca+T
 xVfYnhDPU/SyLkU5mWhBgi/DWWZAVOIv63eDl+hiWr6UktoJlY9Tpo+CVNpAZxyHt6cegx29
 j5
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="86234210"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRnyKbXd7Jb9J0D9VWk2ob1X++RQzEjezH+CMMUFFEdNyKp8mAd0uADBPCqdVLUEgTLPMXe2mKI0VlR9L1GqyzNpW3EANeJqzFqR289QxLJED/yCSc9dZPBzhkuiQke3Vn89hrawDi4wXVcALS26alr5+eYTeSOCihRuSnV7rjC+zZwnm4cV/Y4xRr3XWIdoAj12pCtQ4NBKkM/OtBbQkRXnJnVvogy6tyMVc2xeepl4QHVDH3KLhyu4gbA0bBcDndkwLmXchS+33WhF0qmpDyBv0uTM0I/dzdeg5ThWgxs9Q9MxpwQNdYgcultp0tKL8+9hs5dTgvyZTGB63Q+sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbvyAF1A4AWxEnk7jMvx//LRJm6IgEx0w3Poeek+NVw=;
 b=ekeZOCPz4Y0jmltPMES5Cx44wirzPFe82rTyAcNvV5VcodBmurBO96qrAZxwU1RqTeHkEU0xzHlKENiihyCrebDJv9JzOjuJNzKIVaHIAMth7ey3YP1zkgZSxxf9GFW9qt4MM0pQWdRIGo/N/2Pf1Yx9zC8IpKgFCwbEfOmHJ0wo9SBzXzMriIQIRlNz5D7JmO+FiwpKc+EqzNwZwT0VEyH06C7JOekA1VYh/Mogoh/G2rDtPxkxpKJIIyd7JKL9lJYaAzkUjVVWM1U9e6dEM0KkLQ7bqpewppcQmBRtwm2XHYg2yzsOwFvo3jA/XI00nu9WBlWexBOLfnkDD1gc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbvyAF1A4AWxEnk7jMvx//LRJm6IgEx0w3Poeek+NVw=;
 b=lfdZWdeWcotb1T9okkBL99us0hBziTKRm92esmkmJ8Z38l5VFCeF42SyuMYGwWRdbe4MlShcnErcaMXLQ6K8Q7mzHgS+Vp/+t6GE1F10ZuD1kqJDbLRJrUUoVXNztzG5rBJDPsRq6fDbTwuMdzoM36ogTUnpVU5LMBsi2LwlfE8=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/oxenstored: Render backtraces more nicely in Syslog
Thread-Topic: [PATCH] tools/oxenstored: Render backtraces more nicely in
 Syslog
Thread-Index: AQHZBcqVVYy6JUP3JkCD8gm8EMBh8K5aUVgA
Date: Fri, 2 Dec 2022 09:14:22 +0000
Message-ID: <646125C9-5AC5-4494-BC9E-B89E6B8440EC@citrix.com>
References: <20221201211906.5214-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221201211906.5214-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SA2PR03MB5931:EE_
x-ms-office365-filtering-correlation-id: 1bdfe794-d62d-41c4-33ce-08dad4459a09
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qSkU6hIS11RtQpQ9BcUCzgIxwhiLwsoEBkCKU+4m1LIbyw1DFKymgcyYpo9XNCmKhgilUnpltkRdq5XVHoO8jQC/nl65/NygwElBYRkU6gl1asIUcMGohGv+pSgI+Ikpgq3mbXI4HxB93dXTWexL+aPXvc/q4sxvbVBEessh6h+z7JRA0LhkZ6gQBZ6UoJ6e8s5Zy9fKEUkTnVr6sWxwEFvAI/aq6sGsCIogN2s9kTgO8LE9kTDv4b2973IIcGmeKAa50S7BcRCKjdUF+gdungpgEcvboNl+w3SSdCyNJ+p9tDHfM9MBTRV/2Lf9WC3VtPgRIxk10JQaBbfzMjwFxNOQ4wuYFLGF4dxIpzz11lZzrhow1kiNKF0LkqVWhwVXzh5aB9/XOUw0xtIUQ15PwG20RKRPAPSMmEGAnpXIWBonQZQsnJVpvLTDca70S+/knoqgoiMt8QZghGxbsjZQgl/DXHPQSu/Kh6UInrqMRVT/CFUKxKL7P4Z9LChv7/BTqR12btO24vEoHLl59bSBriI+vs5Jbscx4bJ11E9fyT4QligtkpFu4oldD8GgPUPtWoXAmB0uEN3V4w6TTwFmyNIXIR+VuAGIkD4cMglHiVoVVBKWRaAiD+XMYaaPURjeElIqfiqjuild/qLd7ujxX82ske1uA8Xo/yLpxaGBCzvKwh30py0YVd4dagIOBxr+y4NA+UHZ0O5NMKFDGIv4oksevN7aYJzXJ16Xetv/Eaw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(82960400001)(36756003)(38100700002)(122000001)(33656002)(38070700005)(86362001)(316002)(6512007)(6636002)(37006003)(54906003)(66946007)(66446008)(64756008)(8676002)(66476007)(66556008)(91956017)(6486002)(107886003)(478600001)(26005)(186003)(6506007)(71200400001)(53546011)(2906002)(83380400001)(76116006)(2616005)(41300700001)(4326008)(5660300002)(44832011)(8936002)(6862004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rRknwcuNbf5btZ2M/JfMR7FW3x1J3WtP/jdrYZT5dX1m3KhNB6oQc3DoQ3Ly?=
 =?us-ascii?Q?Ii4clDTKTn+0YJW2YPXxBtTSDPu93tTox9Fj34BBHKPdFfTii5ARtOyhEb5l?=
 =?us-ascii?Q?rLvaS5X5JBSwL9pO0CdTnDogq2pM+uFwBR2rh4JCaVCGMejxmb2u0sK1VoqE?=
 =?us-ascii?Q?bkgYe/7G0ljk6iaEpiezun8bk8CrK2U+soZrJ/1H6vX/zWEzzRGlRlxlTPLO?=
 =?us-ascii?Q?q1ib/6V1ZQ3B97wJBbk+foM4/JlPlt8Oix2yPxgH5hZD4tJuLy81O+NsQZ9S?=
 =?us-ascii?Q?nLSrBIidKjm8w6n7hz3eYdwkVxF0+TRrP+pn9XdZGCA9CL5X2Jm/Bj+giFOM?=
 =?us-ascii?Q?Ut1mR/gSPHtuR09QugbJXFyii3+yvtwFYjTesk8+cSC0CkelaMAyKDBdb7Oj?=
 =?us-ascii?Q?M0PVi6FF8m+6NNbAOdrj6hk67om9CcHdDaC9jOaNlaSrJ7xXos1LOdmeZfyD?=
 =?us-ascii?Q?U9vwqqMegsljN+pEgZ6PV2tZtxIEhyV4bFds3wjuD9FK+VdNTUCjU2epsbqI?=
 =?us-ascii?Q?57PBBjfex685bgEoZobzdCr2P26PeYVVZ1KY9I3ohSLJx3IUSW1ZgBl2eVBj?=
 =?us-ascii?Q?R3mtsIirtiGr7lOdW1GT1232pJSHZX6Udhl4sCfD4c+cNCKV+cT3PnwYHnIo?=
 =?us-ascii?Q?9iqNbtpMkxvnrD8Jt5T0a9TuUWSTSCwu9Z1wfnCewL/uu0oGUua6RQ3JUFTs?=
 =?us-ascii?Q?fKAFjEALTpBeFs9wQdWZueODgWN+0g1wcOzMqjf4s4QR9C0c89Zroorhgu5h?=
 =?us-ascii?Q?pagcy4Zd//wBri+vxxv5M4/89E3LRPN6pLeY2WckNYav8UikPmKLDi1vKgd/?=
 =?us-ascii?Q?ImMEpjOAdQVPsEgaWFIOy2N7W3+VRzmhyuy0CHXQmrj8Wy9xUh+K459seAgA?=
 =?us-ascii?Q?zlUwNqxW813YGc3LQ7tsbwWGM/EiuU/aDzkgtuPdUJkKRRQN8jd+T11RGGUO?=
 =?us-ascii?Q?0GPt+K9Ae5RSTmmatKXT3fEPmq890f3MqAuluvzlSRs/jVY6sRoufGW3NkM9?=
 =?us-ascii?Q?7ufGeGFB8wc900KjzF6UEcgGu4RDmcvejkfiGgcycPIM0zfzaxLtWS8r+q0+?=
 =?us-ascii?Q?Cu4fvNj1a3lnN1+IwnYDR3SCi9jgnz7jg+9JmlwkAXQ/3UTfQKSZok+3NzOy?=
 =?us-ascii?Q?nkZdQ3cTeknBLZAAr4XoUbaF6W1vZ+jwz7gn2Y6/101EUeD2qGLjfXplASU+?=
 =?us-ascii?Q?SKsBJCxI4AkPdjT1eTeVl69jXPF0vaanw/h2eXbt794ZqwmYuTqQ2bids5iW?=
 =?us-ascii?Q?TQssKxDvriSnYLUnmVL5PftQSluQlkQ088NRBHZMSuWmVAUw3NC9iKQcespC?=
 =?us-ascii?Q?+ZDx+zy9CWN1y9ejW6uzCU118SOWx7jyDuwlQg/hncC8Xt3iAav8Suu32ij1?=
 =?us-ascii?Q?TOQaCzL+lI847umQvxXa9lnbtm5wGQROfSQ9lUyQUSv+a3EFs7qERKYFs3oQ?=
 =?us-ascii?Q?LSv30Mmlolh/g5DPZzyfdgz8XHU8Gbasm3/dp/+DtwiHcTnJRYPR/p/v8IHR?=
 =?us-ascii?Q?zlqORyZT2klcxh1ejkvaXPoYvGbD4hnzg9We39JwICX6a4bbui2ZpUf/LCk+?=
 =?us-ascii?Q?67eKq7fco5FG8or413hnlV/HLaS8tnVVyZMFdw5wvRtY3l21z7/D+eLzyTAh?=
 =?us-ascii?Q?opsY8qKTbXJIEgnmwAPRcwA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <05D354603804B344A26E08B3DFEE1568@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H/s7fgKKMMM6OzgoQ58RuFZ1rr+XZSWBY95GVjr6jHrOdoTc5fQcmhJcLaYx7dCcPM/oUXF+XfxyJBtyypeqUsPqzmUnJbVaWB2oVvsk3UK3+ATp3kx51+764UhsRDBALR/bGBRYAgSQFny6+P1uDJKbXDZrxtUvVUu1pq1HL0W23lbMHi1ihPCp790fgY7hRO0oAop33eERfOIwv1yzzOVW3mVge5slBWWdZz2YcFXaXB6tD68K5KKLMYOF6iTieP1LBMPnclIFqLwz76s6f/34AkhnVZ4vqUnqvmD0BKc0IF3G10oJZ90nI8RQpf8lsPqW8kDbdz5IJyY3Ys6cjUuMIcv05+zQYuCczEJyaYw3XA/BFJbTrijL/BQHA69BO7vqmgOnHyin204pvp6u2+FxyPW7CSl4jEz3zP9OnZ2m+OLlS4iJFH9TMwKhth3/kc3Lvpu8bEEcl1FHIMGgv0v/WBwzfNn8f4bW3CYEiUcU2x4DGGiqfDYOLjDOMe95bKrRGh7fjwv2PPb8NSPaf2/pwucx0rHBHLpxeB4adutn3g8Oz52oZWkarfJSJNaAtBLOzhNZPWq121oilRElA8T7qLOvi0kK+LeDaa/dfUV8zP+KeM7FSlaWt9FfK07rv3XCAccFezr0PDQ1uKb/G+9LOQy2dW+E9i7EuBQjwhqguqKpzU5HayCkf6xkV64G22ZRuUwMBfVZ1cq+Mu0bUqc6GkCe2oayaHgIcJOMQ4f28rawYY0Qo91X7nvZkA2psTdUvJI58oGdfK9nfD4FTSBviNispZw+coIyJOHXw671XkvT9u73+Gx5NG4RcAqO
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdfe794-d62d-41c4-33ce-08dad4459a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:14:22.7847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rp/c+C4F8UNw6t48TgRAyiVW4h4Ne7pbeVMMThMRZYm8A2McANY3hsFl0dEuMfXWLhJA9uZn04CVyaihiYvOGtYc8eWE6/YnevG2m8Io0vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5931



> On 1 Dec 2022, at 21:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> fallback_exception_handler feeds a string with embedded newlines directly=
 into
> syslog().  While this is an improvement on getting nothing, syslogd escap=
es
> all control characters it gets, and emits one (long) line into the log.
>=20
> Fix the problem generally in the syslog stub.  As we already have a local=
 copy
> of the string, split it in place and emit one syslog() call per line.
>=20
> Also tweak Logging.msg_of to avoid putting an extra newline on a string w=
hich
> already ends with one.
>=20
> Fixes: ee7815f49faf ("tools/oxenstored: Set uncaught exception handler")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>

Acked-by: Christian Lindig <christian.lindig@citrix.com>

> ---
> tools/ocaml/xenstored/logging.ml     |  2 +-
> tools/ocaml/xenstored/syslog_stubs.c | 26 +++++++++++++++++++++++---
> 2 files changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/ocaml/xenstored/logging.ml b/tools/ocaml/xenstored/log=
ging.ml
> index 255051437d60..f233bc9a3956 100644
> --- a/tools/ocaml/xenstored/logging.ml
> +++ b/tools/ocaml/xenstored/logging.ml
> @@ -344,7 +344,7 @@ let watch_not_fired ~con perms path =3D
> 	access_logging ~tid:0 ~con ~data Watch_not_fired ~level:Info
>=20
> let msg_of exn bt =3D
> -	Printf.sprintf "Fatal exception: %s\n%s\n" (Printexc.to_string exn)
> +	Printf.sprintf "Fatal exception: %s\n%s" (Printexc.to_string exn)
> 		(Printexc.raw_backtrace_to_string bt)
>=20
> let fallback_exception_handler exn bt =3D
> diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored=
/syslog_stubs.c
> index e16c3a9491d0..760e78ff73dc 100644
> --- a/tools/ocaml/xenstored/syslog_stubs.c
> +++ b/tools/ocaml/xenstored/syslog_stubs.c
> @@ -37,14 +37,34 @@ value stub_syslog(value facility, value level, value =
msg)
> {
> 	CAMLparam3(facility, level, msg);
> 	char *c_msg =3D strdup(String_val(msg));

Is this working as expected? An OCaml string may contain embedded null byte=
s.

> +	char *s =3D c_msg, *ss;
> 	int c_facility =3D __syslog_facility_table[Int_val(facility)]
> 	               | __syslog_level_table[Int_val(level)];
>=20
> 	if ( !c_msg )
> 		caml_raise_out_of_memory();
> -	caml_enter_blocking_section();
> -	syslog(c_facility, "%s", c_msg);
> -	caml_leave_blocking_section();
> +
> +	/*
> +	 * syslog() doesn't like embedded newlines, and c_msg generally
> +	 * contains them.
> +	 *
> +	 * Split the message in place by converting \n to \0, and issue one
> +	 * syslog() call per line, skipping the final iteration if c_msg ends
> +	 * with a newline anyway.
> +	 */
> +	do {
> +		ss =3D strchr(s, '\n');
> +		if ( ss )
> +			*ss =3D '\0';
> +		else if ( *s =3D=3D '\0' )
> +			break;
> +
> +		caml_enter_blocking_section();
> +		syslog(c_facility, "%s", s);
> +		caml_leave_blocking_section();
> +
> +		s =3D ss + 1;
> +	} while ( ss );
>=20
> 	free(c_msg);
> 	CAMLreturn(Val_unit);
> --=20
> 2.11.0
>=20


