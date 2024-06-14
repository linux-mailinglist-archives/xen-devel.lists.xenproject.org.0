Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F179080D4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740268.1147290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvxP-0007EC-HY; Fri, 14 Jun 2024 01:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740268.1147290; Fri, 14 Jun 2024 01:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvxP-0007BR-Ef; Fri, 14 Jun 2024 01:42:23 +0000
Received: by outflank-mailman (input) for mailman id 740268;
 Fri, 14 Jun 2024 01:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvxN-0006gG-TW
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:42:21 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56cedef1-29ef-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 03:42:21 +0200 (CEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fR2E022834;
 Fri, 14 Jun 2024 01:42:05 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh1mjs24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:42:04 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45DNgrW3012608; Fri, 14 Jun 2024 01:42:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ynca1uquf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:42:03 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:42:00 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:42:00 +0000
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
X-Inumbo-ID: 56cedef1-29ef-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=7pXJbR58xIZBK1
	VUuESN0sDYFJkgoy9TJWPs3H49R9g=; b=jkk1q+/8rw8wA5JZv/CaEWE3gjse+t
	bKph+RMEo50gB4j3suypwsxOddo+mN3kgAg8N17qzGjACyZZvcOPFXK1oDFHKb1A
	GTlSQ87Ilu5UrKG3L/CBRLHdQty1MUk9m79qWvyd+X4Whvmq2QtyvPfH2HsaLike
	+b8nvpL0GVLVBENqRdXkBjw6DBiI5wXq7Gs0UyZZLz2XwIGZJpLMFkI5coZAoLtT
	QAjqoQgEPz8zDOC314B2+dxOHt9y6UOfZRiCgulv3An87MMBBDusiSG4UODbCYRN
	+Ug2ZIYiGcdbEmzJ5ZQlMDlZQvIa8pP3I/5jVYw1j4UNzsQBXxcqXaxw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9j5WF2WHZufuGu5Iq46y/3d4OhxO9t/yDBQarbgqdXpbMP1nuZ9wn8nYIqGsE7mkiCc0t/wEFUupR4WSWXDs6WSaqqnHy4h1Zn667yduxBnkor2oSD3w64lXsM6i3MWNDF5ek7YKQZD3zEbHwDHyN18novHGHI4LOAVPysC3f2BfwadCYBI8H7TxS9fCEXpzGIdQ2Ahjriosao080bpuKWhekrz3pjaUCAW+ZJa4wXlt/adDIblezUvu+ui9of1acomQ4vVH39RyifNJbz4jArF6je+GMf3nFOT22Br2g2dmfTXsoXFfuznqzZHFqpMpchh4vdhyiN5JsXCD7xQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pXJbR58xIZBK1VUuESN0sDYFJkgoy9TJWPs3H49R9g=;
 b=F/1nIkTvYO2MSvEZm9MaQ/ovvK88MVlaUkhXyT0O7N/b1+5VvcKsSw2TO2vnVmZYJIyvs8asFo4p1WdL8AHa4WqMSZIazCmoQRqIxe5w2xrqeKz6iP7Wvt+yQaojOZpD3RLoqzvHFj33J98SGwvMdjGxiWbGHf7wHzSoYzIJJxcz13FsYK06GOnAyT/zXgxPaBRFZXXbvzM05WBB3cw2SMrF3KRbamLGloR8/8WiymvrwN6GEMGuBQIfXoMH3BOcFJ9OW0JZjGhUUC9stsMsAj43wIfNsb/qxG42pgFpqVxW8nHFZq7U33aOA+c6QUOUVgHf0jvi+jhRHUi7iICCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pXJbR58xIZBK1VUuESN0sDYFJkgoy9TJWPs3H49R9g=;
 b=zoOJLf/sMM/dqqIu9EQv3jyaEvUfl9C3fuiwXLzDGQL6JH6HybuiYZWNAooRFNExVumCuD6A7CO/QMIo0FplK2hA/hCnSbR3JEObg3YTQY2anCFkLtvtX5X2aHAAopmZOWEJyQHinwcOKdhkuOHrVDPXURnqtqIY9ctVf+FidaQ=
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
Subject: Re: [PATCH 06/14] sd: add a sd_disable_discard helper
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-7-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:01 +0200")
Organization: Oracle Corporation
Message-ID: <yq14j9wti5b.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-7-hch@lst.de>
Date: Thu, 13 Jun 2024 21:41:58 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 961fc729-eb1b-4ff8-af5d-08dc8c132f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O92IoR/416z8UPjY5DiHIY8gMClVBoVJjf31xBqAAAkizBNHMVjyBWBdHJiF?=
 =?us-ascii?Q?xcymBH7rMUkMfC0x7CMdpMSEj/SyQR+f3ZUgJrz/PKpkMEDk7LFrr++eWfn6?=
 =?us-ascii?Q?mG7WJTMWiJoWIWEclvddGnjNxzXZps0/9P+i7+BY0GHcpNgWqQTg+hhXd2nP?=
 =?us-ascii?Q?H00DMqN1g6+rLviYwjONuSDGyjPYFduvzBPRWN6f5l+/4p4liq/y+Bordvn4?=
 =?us-ascii?Q?CRPBfnizXqsrcOfNESIZm8+wxFmFWoM3EiAqbB8u3GzwaCR3lK/p+ieCbvbT?=
 =?us-ascii?Q?ZywfZjGaHVSI/CBaIz1yNEcPovH/LmbfxIGpnKs3Trg7vYFUmJw3+ts/pGn0?=
 =?us-ascii?Q?jxCoESlnu5TAAYMRN2P8uCcryWHh1bHBUh2u/Ks/GNAOItxBROIVQlPmmoZR?=
 =?us-ascii?Q?8L5PV+TW9e7nRu0tekpog0DLIgdqG5jL1xKQCiIJN+XNnsMYB5adSQM2l9hd?=
 =?us-ascii?Q?o+1Ys0o3ylrJpxiRy+pK43T2c8TVF+9nnundtPGMA+Vs6kVEWiqJBDyMHwhy?=
 =?us-ascii?Q?UNDnytcOCB/m8pAu8FHKvM2EPj3PpeMd6QkB3jG2xKxQsZZgXPqVaxpa1qBt?=
 =?us-ascii?Q?BPtMQqqoQaj0/z0FAYK1FLVL4MkAj0pCtuwWW/xl58MJP1ILWFdvnMmzynoE?=
 =?us-ascii?Q?g/YzfdE+hVhnMsMaRMj9D7jIpVf7HTzLPdhAxvwrPLG6o6baNBoBMJRL6g/E?=
 =?us-ascii?Q?2DhjYWQ2zSsjzEZaO+v64gjfHOOoGBQjSqKpiEieLKTomDybM11gniWZiVP/?=
 =?us-ascii?Q?LTOC2zHz9JtwIXA6m2SomMALBi80TLlkUUYhYB//VEvmdY8dBXO4Klp1dqIu?=
 =?us-ascii?Q?92O0Qv4zIhtSRoLysitVCK6whs0lrTbi0AgRuGQro5awjAj6pD7kxY518H9/?=
 =?us-ascii?Q?q4mp0lz6pryy4ywBt45Exrbv1Xqmb0A4oifo4fwdnQhA/MvCAIcMG6Ae5QA4?=
 =?us-ascii?Q?/7kqkLS+HlucCAZJA/z5s/GB5JI4hnG6UtX+hHqg5z1sB3OHUmPDseky2XuJ?=
 =?us-ascii?Q?ZZ20+xhnROoS6Diw3KgEnAXr1pE7effEZr/HBYX9v+OwLLrwwmdgw+sVKFOd?=
 =?us-ascii?Q?jtVO+R572JGmJT6dFjl84jadAuWPHDRmuTNtVpo+Ga6cWu/NxFLVJEZzqEdx?=
 =?us-ascii?Q?XWa7IHapLWGJ9yel9IlJkRNjlpOC2dbqA+UM4ByMjszJ2kJz7XOvT6naRwYo?=
 =?us-ascii?Q?SRJPXVlesOi6W2AsOF4E3gfoGNR9WtNlpKEI7FpgQ1Aob4zwfQVXdAehpi91?=
 =?us-ascii?Q?MM94Bm+VF6FCLSURmpEBim4kzTDvAwa22oAo2NjkqdXAdzEQoPIP4+R8P946?=
 =?us-ascii?Q?hEOIReys4L0YhhCFkUH1bEZV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/Zr3EAI6LdEis00JxXkTMDlCPmgQCGhfmOU16YDQ2ATIX+69Lv8bkMntOa42?=
 =?us-ascii?Q?pMeWjXtEXCB/H0a9i6sfiPavm5TIR2VQOik7m22Le5ruNg04Rl/94/JIXb13?=
 =?us-ascii?Q?f9sDH3Eghd/G3PVKpztLd5wBZZQ5ppDzR4A2UFszxKb3vit1JF676KPUOZjm?=
 =?us-ascii?Q?+w22K3xX+/wF9HGl4Ajab+/k/MJYdlzSuK8KDBiBOnlfa7z8AHdPxh4FF9cp?=
 =?us-ascii?Q?gsD+sdRG/qU2KqJAlg5X/GBP4PlWNmcyYUoX65FrYLV89ucbEcz+lE/vXpjq?=
 =?us-ascii?Q?yfW2hHtKo+1n9wWQdYcZ1UjIUSv838yAY+/21ow0AWDKFuA5cWHdoG3+9yCJ?=
 =?us-ascii?Q?mgcsUTwaej0cJifofMS5sgJ3YtSUhsIkWJGwN/VDLg8xsk4U7fEBRsLzerZg?=
 =?us-ascii?Q?P5Dg8LrQCw4G4EQ3zyeXWxiqvJIvE/fWOBm/CdVW0pwqx7BEYBkKfQvj3NLe?=
 =?us-ascii?Q?SIC6JzEIjnikG11EarCchw2QzEYQBONxfN7eAbVMa7xGqyzLAVZWZJ1eLuEJ?=
 =?us-ascii?Q?QajjYjquDFzDLufm9TSb7GNio4KY1lyjnpSCRsXc25kcVABA78Nouxb1CwGF?=
 =?us-ascii?Q?IX21nLjucWkLIC7Ni5WKTE9hbd6vrFv6n33faUPZrzPCRXxm5suYGUWAjGzW?=
 =?us-ascii?Q?BMDecNY4IUo1kRh4Pz0DP5P8tI7TFVGwrZ84SfcVzckP4XosSDr7UFLS+V1x?=
 =?us-ascii?Q?RkqC6BHWiROGW1zosWKyeAgI0uMN+9is5ME1l6Qg48Z95FE5fPLjW2bfMUkh?=
 =?us-ascii?Q?U57oqQTm1EdRdB5jupx4MPZn6gQ93/HDn3cCa54ebb3P3ctLfLzOpWModyS/?=
 =?us-ascii?Q?awyH/ASsxO2QA0Kbgsbi2SjY08DUGk0A8fnwno46PBBHAkdFzDPFMBiDCpxP?=
 =?us-ascii?Q?DdnuJVUt5iPInjb2jHBZ1YYAT6jhVwkgN6ZQCXPyRmSQorbYiy6Z9e5JhOEi?=
 =?us-ascii?Q?vm7umIAEZmDSjTK3nDviwUnQR0+jFr6B3hZOuzgx3CFeSjdaoqdss4MBuFgp?=
 =?us-ascii?Q?/xsGdNUDH+/SsHJWLsdncfxyQFlSrWHVEW4CMkP792n0TVt1tMzSLVtNGQlf?=
 =?us-ascii?Q?oTW8qqyHsW3TT/R5+dSGXecoQd1V6G8pTvlhygDLWqGvA0SRnCM1VA7uxKuS?=
 =?us-ascii?Q?fsZWuf53UTXX68CIlCQN89QXQl+Tg3L+NO2Qj0MY9CPRoDCMltQtN/Ew1RBz?=
 =?us-ascii?Q?P5srdfkbTOIy3kBX+JOrUql6YRBAgIMMbZZoMxkwBH/XMfm1OIEvvMiuRXeO?=
 =?us-ascii?Q?AxfmYieuY50ooAhUONMl1U3rK+zhmzsItFxvFwnnHD/t/fjSm2M7mZQZJ23L?=
 =?us-ascii?Q?QBdO478p6oO5GeYlUH5R1bniNwW1ho5+tLPbQ+dovp3pI6kVnGQwOxQJbYMB?=
 =?us-ascii?Q?ShuWywk9080jfFYlQKpXPQOLbyKtJRuHMRLgz06M4eSK+gF9st3NaNsBRAvp?=
 =?us-ascii?Q?TCZzgNJDlzCuCwwEPFi0PFKGuY5bq4FH+l2vPUc7UlKgVo5kguLpNGgC4Q4e?=
 =?us-ascii?Q?nYQZf636pPRTmItzVxNyf62A8dMaEneR6LcwJkf4RG2PTm+1eRhflSM+zWOC?=
 =?us-ascii?Q?/CIOA8ToqXcqKs5xJY8D3A+iBXYLUhEda0P89CXGSf3b+ndJxEBHCmIHZ2SL?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SlDGcVIB3otWlzFiwR0v61/9shJlS9MXF3H+ftiI7pIV9Gv2D84qDjexcJBC4J0Xi2dTJLZ4LpovK83AnzGFtxcq6Y5NijAaqer8my/+3VyIocJiKThq5xx/eqvVJBoMwdBlWmIp3YTF/JyRzvWlvJnHCM80GHZboj3C/j9ZD/TAdwPUe4tFSWS/rYhD9di82KZGDOqzFt38zAD8oXfk/xtGqHH4XMeI8rIG8Hlk5zHFtN58ek6tRjk/hsCpaezAXhXOS6uKJ3WObIXEhRqo9Q294VHS+oYM9iAyMoYG5gjrshXH18lefpTIZi3t4Qd1zrm2Z1q7aJav97gBA2GQKlGOmhHMZ5xEFWkfy81spdYtDOARt4xU/w2PuxJ+Xa8Tp4TN+zWggDNFT/DSOxwYpsx/lae1R84Vr9XQTJ1VVtLM6xHGh0ccXd4JF07dc+l4hQHNgpUe6U1X0euZvOnBW2N9i8AX6qs4rwod89KtviAWYrHVmEzZilC3oJnaFC7eeDNzNgllW1UPQ/4P7yp3Uagy0UQsLLsX99Tprtyfe9nIzN2gCGCKS8xPBsQ0pXaG5BjzLxyAZejHA/PNgMsNykStUcUcHldHN3ZeG5mUwQU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961fc729-eb1b-4ff8-af5d-08dc8c132f52
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:42:00.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rNopkpxz7QToDWdFC/ZGUt711dBDEP/symVIIeQGiymyoM8WoeDIz1phYJUA1t1tbabn4niXE0bi7nHLafd2U0Cjrnm8ucbIGcOb+CVSxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=849 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140008
X-Proofpoint-ORIG-GUID: WAWye8Yc-hdUJhQ3XlTggxtv4C0OHCNK
X-Proofpoint-GUID: WAWye8Yc-hdUJhQ3XlTggxtv4C0OHCNK


Christoph,

> Add helper to disable discard when it is not supported and use it
> instead of sd_config_discard in the I/O completion handler.  This avoids
> touching more fields than required in the I/O completion handler and
> prepares for converting sd to use the atomic queue limits API.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

