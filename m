Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547DE90810D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740313.1147370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw4x-0005BV-02; Fri, 14 Jun 2024 01:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740313.1147370; Fri, 14 Jun 2024 01:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw4w-00059c-Ta; Fri, 14 Jun 2024 01:50:10 +0000
Received: by outflank-mailman (input) for mailman id 740313;
 Fri, 14 Jun 2024 01:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHw4u-00057k-Oa
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:50:08 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf15127-29f0-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 03:50:06 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fQEI003152;
 Fri, 14 Jun 2024 01:49:46 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhajat7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:49:45 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E09lfY036560; Fri, 14 Jun 2024 01:49:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ynce139q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:49:44 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by MN2PR10MB4127.namprd10.prod.outlook.com (2603:10b6:208:1d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:49:42 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:49:42 +0000
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
X-Inumbo-ID: 6bf15127-29f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=7i0BWLigEmvelo
	6RcYuunWojtZaq12LF0xnWgDFBmLo=; b=VV4BITIaOdufl+RFTmJ711ibFCYN62
	XEa6en63RJIgpf2u/xDwHcYYZEYLBQz8QQ78jnQbeiLDhwxGUtnnJcijxMEOlkPK
	SynNEnRPK7Dw+EhzJnuQRp/E3t3tkXCiyk4v55UXzTbAmR6uy70HoLcELMXXMfWB
	w/Lw11/hjogfzalO9V+ktYQlIe9MeVEgv5fIJhBdNzBkTuddvSPTmt6UPz2JE5U6
	cE5E1AWpc96usbpWLD+C+zDc8bKFtSvAVupRZXYyuHsIv5c0iE368C01IT2CJgIH
	AtCxyQZ541+N19oZ/pgTv3SBXQ03kQMRGs+m5vfqjKJtpurI5hvlXx4A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJt4WZtND+QWB8fJmyHVT61nvZ1LxQB267G63DmNhrXPF87/F+/Dz+PFk1DMuAuUGydfWiOrwutkh+XYcOa0K9as5mWnyjShLCs0n+9xiwmOWKEc7Hwh0LRznM6U09EKbwWQtBhmj9IvveWnn8sSWcOkhpy/GABV9XnvZmDSOwP/vKinWgOTXxFM97ih2fjcZSIJLgZxgMG7MzE2zmDgGWtVqbS0NahTyCB5AcFJ4fxph16SkjW89+4Mib2vTKBcTK3jImm70QhOPhg7jAQPEyoHw7KxElUutnYfYvKgUI2J5yCM5FfsTtgrwRuYkbFaNUAkog0Q4CBvNHclbydDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7i0BWLigEmvelo6RcYuunWojtZaq12LF0xnWgDFBmLo=;
 b=BCd7NL2GP8tFUwW/BwmZ2u1Mv0b/B4nREMRrRQLLYcGKy0d1qyJQPh1ue5ECTbFJr1xOVTADhcaSK499hMZjyFas0c7qnLMI6CkOPoCflEIooibHxlR9IRv0WbkYmtbpjiz6z2BErDG64fqAqEOsFVfssvwLU4b5kx4elaPN3l62xWRrICa0usTDeq8gVcemQyY2SyQxdiqzZBAOzaIspiLfwK06naYyszZu9q2srqARkvt+C6YCsNWUVgbvi/1AoF/n1jQjUIXbTxRNI9BWO8/14aMhyM9ggRYEDM4ewzqNeL5Wo/8/RYqkUq7kDIk5+v6UOYv0BuGShHOCfDRxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i0BWLigEmvelo6RcYuunWojtZaq12LF0xnWgDFBmLo=;
 b=iZOjTw1Vd779mdrhk42hFSvPel+UkvR25ds4lyUhzTsYIsOWQT5+0vOCG4bHnSlIf/zGxWt1SndzQ9F69GrRBhvpNiM9MGQrPJYB0bdgIf/Eik0KRITSzga4xT3S09MqOv/71GHnWFy893ybb/2tVWGHSzl4fR8T5rdu4aoeqPE=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Bart Van
 Assche <bvanassche@acm.org>,
        Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 14/14] block: add special APIs for run-time disabling of
 discard and friends
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-15-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:09 +0200")
Organization: Oracle Corporation
Message-ID: <yq1tthwqonx.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-15-hch@lst.de>
Date: Thu, 13 Jun 2024 21:49:40 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|MN2PR10MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 519fd7ed-4fb4-4a53-bcb4-08dc8c144259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OKnD2sLHJTprwkcnzem4Bo3tqmk2vfMfcxmSFwmhGVhvc7cTLHCxeECLr2cD?=
 =?us-ascii?Q?TTQMhVLdZRfe3c48im67hKGsWZB1aIIwAjP0tQS0ElYHXw/+O6WaLqRJZddZ?=
 =?us-ascii?Q?hnrk1nlZTL/yW5zUte7L69LFRTrUjneUI0ZjFOIdOEPTncHx1fjMSUXGq+2s?=
 =?us-ascii?Q?9OchBSfaF/bK/heSJYrcr/XtOrAaCcXJKNWMzmCYvoBONMlNOuKQnCax65es?=
 =?us-ascii?Q?yiSxK2ivmOEq9j8eKurLoiqV59AqF2JALHdAmLSo5uEhBF/wah6XMxg4I/Tz?=
 =?us-ascii?Q?Wu7DRnHC0ut6/nC2mrE+JSr4I5jE5vf86NEreckU0+2Wb3vCHrhsU/C2J7eR?=
 =?us-ascii?Q?SRdFo1ESZe3mv0aTZIkjQoWOuuFVEgNFbo21l9hjDXh6jS72pDDaF6e/ZBqt?=
 =?us-ascii?Q?EMDmsQRlYaBJcJuygTmq8oxE8oB11u2w7GKgkXRaH1IHDYYsFO52e5ZGQn9d?=
 =?us-ascii?Q?OWHH3GcPSiBoFLiFQ+vuQs8ldgvogV4p+6PGEsYNGpI6U1EnP0aNsizYwqE7?=
 =?us-ascii?Q?+g5h4HENIc4AcB1/pU3AfYidDTEFBbTBum7Qd28GIbnNd8AS4C2wtih/L3zV?=
 =?us-ascii?Q?/RaRzCtpRpNY42QzsdsPp5O47/MLm3smwhz1oxjbUAfeAUQZEZqECoINaOEl?=
 =?us-ascii?Q?uNfkrmwD2rDAQLhRSvDIDnfKaZBdfZ8nnrtHu70lvwgBEQuvKPMuDgn9PIho?=
 =?us-ascii?Q?b0R/0LH5yd3s4k5Db/Xj1Raii+ERjRlVQaKCJFafaiFyjpYwHsMQP2AEuu95?=
 =?us-ascii?Q?Q6ToAIW1AJKfbjd6Z1KjKzsYrsqy9DuPLQmHKOKpOJ02SyNxP01XMCa38pdu?=
 =?us-ascii?Q?ORK9zudYhpzjXnkI36gTJdDRorRltAK3oKZKqDhiBLdXWbebP85tbkOwmD3q?=
 =?us-ascii?Q?J9qVNTE6gRPEoju/3lzA0N5b3pdsnpZu0ijgtF12LiIovLHk3en3L7AVQbjb?=
 =?us-ascii?Q?8krNq7KomkjedAjGV8SUfqCxFQzgrfJ8GqeoixOWOY2sbboUIB/kpwnKIeAF?=
 =?us-ascii?Q?XW/gdtdGiTcUWTtKO6X2PNnb9RcrmkhUnYWuvSH7yqhfpfcqsytIRPBw2Yhj?=
 =?us-ascii?Q?kK7l9sPPX6ji2J1sXHbF4Fr8tMZRLxXvQS/lwqP8m+ot5msPLwxrISewLVYA?=
 =?us-ascii?Q?Ozy00cuQbg/GnIw5Xql+xadsMSeKaAWrKWopyhak7Pd9n9G/JJ6qwo5EMfvk?=
 =?us-ascii?Q?DGyRXS9BM4SIYGuXovml3uP/9vLYmnIHVw+WM/011FlHBDx35lO0CAVLHy3r?=
 =?us-ascii?Q?wdS1wXPzWuBnQ+VClNKh13eug6G329wcNotzjqiJeejbyOv/d3eKoMsvdEWh?=
 =?us-ascii?Q?1FPNox7G2+kuioNco2dwM7mB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zg/CuGIymdJmPuD9qEghGVOLOcf/XyiuZ25VH1eCw2NGJt1d2/HYqABlT24h?=
 =?us-ascii?Q?E+/4/ufEA0zEe9I8Dlq5RMnGTfHKiUDxe3xNnW+HYb8pza+upbZ79SDky5Dt?=
 =?us-ascii?Q?+TK4EVV0QUa3wgM4i8ym6wlzmX/UABlO7I2V+HO5IJkVmR+SZu4SqblJTuO0?=
 =?us-ascii?Q?7k3AI2TRySgl9snTGWbmyMnQMvW7Nu++4Cihjm5bxgk/Vypkd2egtlvH3i1y?=
 =?us-ascii?Q?uErNLpWrEBhtAStNWAdWB4+0s9gnzC5JaaTls7QrK7RRClLPtur3VfHpPD4Q?=
 =?us-ascii?Q?k7WqGM10Jqolmd+BYD87g6iRQc6uZAthKt+6woNDFoq6YXz5twfB4iu7CVan?=
 =?us-ascii?Q?ugHI1aWd7rdOcXHlcMgj4ixRqz6XHI627Cb+fTg1mI7gePZ7ksMsiUtJBLv8?=
 =?us-ascii?Q?tsRplwH23IeYRx6XQTfc83dJvcJeHHwLLxATvfjaqZ9JBgaYYC38IyHyc/7Q?=
 =?us-ascii?Q?1Wpe+mXtoaASTSgArCE+vEDMg8FmLQ6zevwWqtkOD+Umnv1NMtSuPeZnRQP2?=
 =?us-ascii?Q?DsIJG+0Y1nLn1kmlRH/4oGlRU9a+cWQWSfsmjgRZDQ8jufBdS+o4HT5o7uDZ?=
 =?us-ascii?Q?sWiaMt9Aw4h0GsbKzLiLw+yPKReytFwAH5ccpYSXMvBRipJWiSeM9zsoWCri?=
 =?us-ascii?Q?N8j4LSllOry/K5570mMjAqZNNHuJ4nkAAiAWjzEr+j0R6gPz+IA+m1l87zJD?=
 =?us-ascii?Q?G5r2whu78cx26/026/H0wT/74kP+JOaoCrn9BHzj49uRetNfEJZayXUhmacU?=
 =?us-ascii?Q?CkwsyKsCb8ArOppjPE6AV6FRGMXA95w3njiSculC5GueHNtaBVLrgTV8xLD8?=
 =?us-ascii?Q?q64Lc1vVH5Bh6rud3f6eNMKAdQT7UaCrgJegq0uLfpXccDDjKeONp2cMbXry?=
 =?us-ascii?Q?sjYwhsCW+f9wOVwLCNg87CX+IXQSmfGVsqqRTUzx7c8RZjmwfvM9WfDKdrAl?=
 =?us-ascii?Q?onOUfPPh3epDcA2Fh/05SZYuRz9HooTbp9pdTaePeki/N4PlyHOCI56mLAhm?=
 =?us-ascii?Q?4mYQWt3uQ3BsA+66mI4nk5uEGFWDtqul1zTkSWbynO68oTVTBMY2U4foj2Sp?=
 =?us-ascii?Q?wF4JCqr2TpcmYZ/vBwiVnZOLjzyTMzIv91m3pmlhNfNo7n6sWNwMP38L0Qn0?=
 =?us-ascii?Q?SVGs1XyxOIfjT98wcPm5ablNAKkinY0DX25AFD0/iw8fftB89HA+E/tQSmdh?=
 =?us-ascii?Q?M7bVix13MGmDP6QRtcXbfrbTK3wQy+6EGMBWSsBVhGDjsWCywz6ZK5MYsQco?=
 =?us-ascii?Q?7QSIfngRtaWcw5/Qm45wbolvDlUR9JZiDEEiUWWWI9JZnPcgo89YaQod8gQ7?=
 =?us-ascii?Q?aP97U8/U1r9hAWkfW2Zk24QN5FHsb0Ac7mOyXtXGa/qgk5JE5c52MfcSm5Iy?=
 =?us-ascii?Q?iutjMVFi+Ll9F8Qh+wtLFU3P17fZe1XjFGckJDIWEa1CuNXeTK5Tc89z9AfU?=
 =?us-ascii?Q?EGYqlTXMe2BePcnPp5f33D/+M/d7a5Li0bxFIdtRlLArpF4AT2mfdV2OUcpY?=
 =?us-ascii?Q?SJAM2GcKiC90eArpSpZcfN91Rc8RQDzUho3m45XVpammOnimr0KM7kynCXuZ?=
 =?us-ascii?Q?IMU7R6jibA804ZJXZWq8BjK9aIdaQXIMF9gbxKh97jeQ9QaylcVb0OJ3ZbF2?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v2+cBe+h3qbNw1Kpa5edH3rlhPakpfD052bnTUlv/TBMN1naRTuk0tmneQNX2KdaB9XoSVLijL8PRz10NKTUpe9HTDLsbSeFwUrLpesBXXphGsKeAAbgJAlkjmeJ97kEmbzz4XdtVpb+QtsJbntC1fwoXwzmz840+a7uoCg3Lueo934bHfHLVDNqmo1/UcwR+kSCHevW3u2OGwh3inHVBVfxr3kAf+kjJTLgYqk5dFIbIavnJous0lYjz7Qeg/3mrNlhaIlr5k/bWkx7Ogq1SWxY7L5wrutzhc2CKUDN3tSHNXhPAq2kYM/FxJKpSEnlCqa7R/6I0FIx+L0bJFNzh3swubAE3dV5THpiFHS5ZiBaeZt5iIU+R/nkqPGAw+czopwHSjwddEPyE2VW1p7jBgvCDgUqD3KhHivuZU+YfAlX4yuO4sKVJWnQwASekWJkv1RU4RmB4Yi4KcCW/tnNpqMEjc80udSNF/WnurTQllpufi2zE98XNfuClp5SYzYveEJSKmXHXywCV5rL2cI3Bi89skISAAOUw3uR4j35QLO28Zwx5KAxT/MVTcDUD3ZTshSPxAB/85JusJYTx5BMq7vOBF0Wcdz4gaPSqnmeZiQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519fd7ed-4fb4-4a53-bcb4-08dc8c144259
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:49:42.1938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajE9wAEicao402gwx5PWNEpRKeQeG7mbf/HQo94ojaR6ee6DEG+736HJnY0TYrvK1/S63WsRd078JW9u0RqdmdkghR0ynrbTmETJtx+MToo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406140009
X-Proofpoint-GUID: ldAyEroBn7WPHPTa4EEnlL1HfKJO2sYs
X-Proofpoint-ORIG-GUID: ldAyEroBn7WPHPTa4EEnlL1HfKJO2sYs


Christoph,

> A few drivers optimistically try to support discard, write zeroes and
> secure erase and disable the features from the I/O completion handler
> if the hardware can't support them. This disable can't be done using
> the atomic queue limits API because the I/O completion handlers can't
> take sleeping locks or freeze the queue. Keep the existing clearing of
> the relevant field to zero, but replace the old blk_queue_max_* APIs
> with new disable APIs that force the value to 0.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

