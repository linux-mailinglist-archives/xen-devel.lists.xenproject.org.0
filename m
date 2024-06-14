Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922B908103
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740309.1147361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw3v-0003MQ-O1; Fri, 14 Jun 2024 01:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740309.1147361; Fri, 14 Jun 2024 01:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw3v-0003Ji-KA; Fri, 14 Jun 2024 01:49:07 +0000
Received: by outflank-mailman (input) for mailman id 740309;
 Fri, 14 Jun 2024 01:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHw3u-00036U-Af
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:49:06 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 477caef7-29f0-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 03:49:05 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fV0a006363;
 Fri, 14 Jun 2024 01:48:47 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhf1js89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:48:46 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E03pnb020427; Fri, 14 Jun 2024 01:48:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncayatub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:48:45 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:48:43 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:48:43 +0000
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
X-Inumbo-ID: 477caef7-29f0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=fMAKYWmGAZ+qLI
	hrJJYLdlVPumk+F8f9TtYJ2iTb86o=; b=Snp3BwQmul4oKkLdC05ZpJx+dgUglV
	ICS8bt6Rx3AsIgfJuRiYDsdP/ty57jhLjvFKPb45aUd3Nx6HgMgJVaf1aEtXndJQ
	mJSMaflybskHnyljsgTOa5HI2aXBVGqgBpCZ5n+mEZC49xkVrRvVY8TQmDNIqn1J
	JZY3Ubcvz3PUJ9tK/9ELfxqu23OLjhKOBEGQxiKl8yiPiPvO8wF97G3UqB0dolko
	5IaV0KEx0xscZhr4e9lt/d8gvHLg2OBbC4meLyQuuKhcCEMz1L4Q7vcwDV2bjOm7
	rYgiqx5nPV8SJzCLGtPUo7gjfQimAjaAyuzcDXLq4pZtvSfGtbibne7A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQi+yUM3P4SqKUIYV9/yaa/9/+ZfaXBZRwj6tKqR8zHv7M0kduVLok87OB5hTAvToQiq4PMrJppxy/NBAUbt3RcJ09kAHHgBTwyUmsTYvap4iAa2K7Wg6L/EzbVFP0RmbLtCzjZGDXPIHI88zqv4O1+mztU0maJKOh0XJlOrMgDpQsUHOs8kjh1dwuk308rJ6dymWss1UxCN8a0thqGZr7IsH4lydrS/EAJ+1cfTZRNEacGGhShapTv60q5IJb9xQnAudY4+9dwUw1ZRLITuRi8Q6rmlSJRED5EWaw9TQH0Elj/rHbvufgwW6dEnOkx6VLnIK3wXxl4U/IlAEM5aTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMAKYWmGAZ+qLIhrJJYLdlVPumk+F8f9TtYJ2iTb86o=;
 b=KGR17uFIk7qNfPFijHKAahYHUBpRQeHw8I+tCuER8DJwRn4jC66ny5GqUZSADk9yLGHUiBEmWScmiBwVBAvwC1kI/+o+UqX5NeTFoXbke/FPA/qYbqvV4+9AR1W2tRZncjiX6+z0SxILVrNrusGI9gEqn4YawTckDmskoibuOCI9PceGW8D2MdH2ZaqhpkdghX8XM3bv1yCjL6P5kVd8VYBklUqX88XRg+AY3Vyx5gerJRQ+H3CgzIX056M+wYhJMoH4Sx7/oCE1IHCUlY9HMCFVArn/bgOhXNm2ETJRAfofX6cINIGE5FFpX6ooEB++i5o5aQc5ISICvHJcimIbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMAKYWmGAZ+qLIhrJJYLdlVPumk+F8f9TtYJ2iTb86o=;
 b=g1GRjIMQ+Ik8vyEPLcJ2Z4IINfo4DACfBP6jbFzmicnqw2jq4MlTjs62QmJhL5ELO+Ol1Y73vGJcsk43ym6P1IH2Q7jGYmJGQdUIm9k68LGg3Qw4Zx5I7pkJIi5XTWOQvGBL0ROIU8+VjWBcaUelJeBJwRSaMuA8eVKq8qEA+FU=
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
 Assche <bvanassche@acm.org>
Subject: Re: [PATCH 13/14] block: remove unused queue limits API
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-14-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:08 +0200")
Organization: Oracle Corporation
Message-ID: <yq1zfroqopc.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-14-hch@lst.de>
Date: Thu, 13 Jun 2024 21:48:41 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 47790e30-7971-41e0-ee08-08dc8c141f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UPcHvOW8u5EsHjSoXQH+27BQFD16qdu+oze9Pu51XAfqnb0RQK/YJaOKyQVB?=
 =?us-ascii?Q?evdwCYKVO2v7fcbLDjS9YOFwjzVE/FiwlywN4EPekh3t/XXj9NUAcJN5AXAZ?=
 =?us-ascii?Q?XzxQfmJ/3z4n7WWvYKD9APTgOSjmO4Y8YiLHzavTesR9iNpZmfxKLd5ye/rQ?=
 =?us-ascii?Q?Qo3gmWYXCqjHGAS2Q8oX8ufWencZJbzM/t4VBKUOroRw0+dR/i00+3Ew6x1Z?=
 =?us-ascii?Q?5rWhrEdOZm+YeIxRTFuY1pMFNFU05GMFHoacaFaeAhkpudn9UdQcZ2LNlUm7?=
 =?us-ascii?Q?s77cx06EE+mkl8Cn+2lVrI+leQiTSxj8ohm6h87/+bwfE39MOOOHsKSxkaHz?=
 =?us-ascii?Q?wol/xF2MqWBMDVme6H1cyb1AcfDQjlr7GGeUSjCfSWYvAoBoterEzaAfgZB7?=
 =?us-ascii?Q?ObwMrWiBGS3yEZMwE8PjekPAjOUUrt36PDmG1T04mr65wHTDYSmpVNP/Bh4x?=
 =?us-ascii?Q?3ajepieQM7ZZjVqhQYAWZ4KzYOLS+ci6uzRohhNW9kc7v5j/IyU4NJSc1Dsw?=
 =?us-ascii?Q?27WjP+xfA9xK+WUuEDIuNT+DGpRL87ThsEgmk9vaB2dKU8zD4bPmStxiV2+n?=
 =?us-ascii?Q?vAhC4mrjjBVsIvlIU6od61cRpHvTjlMID0q2XGbnBHgPtTOp7tTU98wUqYLm?=
 =?us-ascii?Q?5SA0eXTo6h0v/+OJcM3lmz3iaena6tMBQCTmbSGca9DP8OrdV/wgtl9uMOtP?=
 =?us-ascii?Q?3GuVNRLY9Lfuv+8mHEG0IhXW5NcL4iZyBZr4Vi5Dz//G06yvtvY/H1uIz03H?=
 =?us-ascii?Q?e3KtlvXvEo0URB52Oieyoq0yhDEX9ZTa7KRmhfTUxMN3hQSXoW7RtQFonkMU?=
 =?us-ascii?Q?mGgunLGOe/HavdEynbHyx4d0patxu/Zb5dMuvcFJKWTL06ALFciGGN5kkHYo?=
 =?us-ascii?Q?ZW7OlBrA+sLEACZhlhysPw+oDG62GPixkpgNZWMdA0CrpJZFRXeHH3MMmjhz?=
 =?us-ascii?Q?JdVga5jGOycV7KMQYGSp4GoieOnU07VFSKa5cksDEViwQCMqXQed9jY8YisS?=
 =?us-ascii?Q?+AFhSubPvhKhyt9WcK7vT3Z18/fgwV5yyPtizOguuNiz7IPnssPp9er+Rd5z?=
 =?us-ascii?Q?FV+zBMar0DHwBtEqxCF/fyaWzwmzTM3Hlez6oxwHZZYfZ1Fo3jQj7oj9Qm0W?=
 =?us-ascii?Q?Q2gV6iXdaCUXYPW+/0PoGwCc9IaCWn1XvGYypyuBVKe3D76Lp/OpsGLXeyPA?=
 =?us-ascii?Q?y1NoWAuN1GZxQQpdkAaPiDNhcjjCsjHG1dW35e1vIKJkhmeSmdGBgbeBkbYM?=
 =?us-ascii?Q?Ye1Sph/mVbI9I+Ax17kDAWWK7Z1RVQD472SB6cn+Z95CozDSZYki8Fv4bqr2?=
 =?us-ascii?Q?Xz0iGMmAMyEwj64mHwkG8KdD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6our2LDB0ZxZfDg5ZnURebslzGcDZX1yVsXEStC9WPd28STp1Kr+OFbyducJ?=
 =?us-ascii?Q?sRY7ui08N1cqKaDH5K6JIsTOfDULJZpl2Mr1tdYvL8Esaeyb1QfqbL9N2klX?=
 =?us-ascii?Q?n0F+TOOUBe418qtbzw4kr2I2MTaFaJFDQ4HHX2ZmgbXZ1eLhyh/IlI6atQMz?=
 =?us-ascii?Q?xo1ChTXxGZGjcxzeiZjSgV89FsMd5NDDC3Z530UFba+ncLY/nIGOHEE7dAC/?=
 =?us-ascii?Q?B6mn39qLbLAvB305zx/4JsvmOO/zRqT75f6OZ+9WO9s3RSOws+rNACQuX1cn?=
 =?us-ascii?Q?mbNr0dyjekuJ5sVYfDSnIaS2HvvLD8EYHY4hlRolzt/cZe/0WlUYY7mjkolS?=
 =?us-ascii?Q?/smLIvY/ddiR0KsghMlJuZ6ImFBuRPiYPnXY2W0j4tc0mFr3XAPbsxOrWYAe?=
 =?us-ascii?Q?P4LBzJPLx0HAoeJYCD/Z/QZkFgMcBTPyVAqPFhtvjFZGQdqiBAPKt0klv/km?=
 =?us-ascii?Q?6Nl8QQOGIq2k/FW/0C3KvFbWxvw+5L1s65Z1er2YbmvUuVisDqTLDYWZidfo?=
 =?us-ascii?Q?LJBNDkB3Z0DJeQ7QyaC41/AZkf2u+XRv2Gj6J/9KxCpoSOiQmoqSwZmV5pGT?=
 =?us-ascii?Q?DLfycPYLcgWf0wtuZcMcXhYIb9JA2CvEhNKQ4h/g4/EDc/ks7rdIJwodfhCh?=
 =?us-ascii?Q?BUD3IzJIGR5Lvs2OmrTQ8sn8Lbw3MyBtkSBU/51dpBPIavVI2o+WLJEx+OP7?=
 =?us-ascii?Q?xaRhGIytiLKoyKyWtUgslYOUExNcJjB5eEEobRv5DeOjlZ4HewsCbB6nrrjQ?=
 =?us-ascii?Q?T9cdaY8ZyMJ4Yms6KMW81aJx+AdNswgD7XtrWzQxEdfTSlgv0LAnIl7wPsTv?=
 =?us-ascii?Q?mVvIagLsg+rbNQpxfmaImN34ppTIYMktxfOyaZtc7gxSfzpy4yuiBHWaV098?=
 =?us-ascii?Q?a4PoJ7oaEuCb44GzdAEtQvriKfZVKRBl0Z7YEjEZPAIkoAymWD07nk+kAf6h?=
 =?us-ascii?Q?v/kZ7ZLlsNasX/Fb9kxmNWeg6KuIt9vRtUnyF/CFO2crxbNk5G6raParV1IX?=
 =?us-ascii?Q?loCX8YiEZfdFf/WyDhRYX6kHitv8T5tcVbpFZL4CdM6AirerPFh9a3D6+eUO?=
 =?us-ascii?Q?j/gBUwKYoS++IdbAlZIz8KeIDR3Mq8SNnIfLnKoowJXZzmckpVbkDc+4x/Jz?=
 =?us-ascii?Q?GBBS+JvHTo/pvAfeDS+IYAUnENTeHCFrEpWKUce/DMTrtLMoWIy4pgeHKVkr?=
 =?us-ascii?Q?JAWdow8j/AYvzDfXSD0XmoxDwklyG6cp/Gd9FBNZueB/kJQQlN9nG95j0H8e?=
 =?us-ascii?Q?wd4d7whPgqml148usIdcq6jQQTcKuYmWRcyfME+9Dc3mws2tLww/gcYsHFwG?=
 =?us-ascii?Q?ugbTFiXckqX4F4pfe8Vuezr2jxuijQv3YNnqfx47t6GP5YDxaGVgehxoTET6?=
 =?us-ascii?Q?rg0gq//qVZUe5YEWEqmqlz45PaD04AEqMgDke2V5IRqN9nTjWZStOvoIak+v?=
 =?us-ascii?Q?TfuJS/hJ/01mOj6ur/UlnfQf7OaLf+117ldMIsEGlFo/Xj2+N5krMPW67twR?=
 =?us-ascii?Q?dvyBh/RQKLrZ8PDl8eXU62B6oVJ5L/ivA1KJ13sM8nIGYKiL82Bp9yHuxPK0?=
 =?us-ascii?Q?Hnj8bhI7WxSA8Ce5p9sFCq6uyUDAKfZxDXexQHNY6Pg33nt+aoWTk79DLngZ?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Wrabk7OQdjUuHg4Sb3dkhxhkURu++SqTIJkhPIiJO/+UMx2JEnXqdgqHxwLCA0Y/bI9SOg4kGvZGyb9IwyK3CE/TbZYnSEe7PHQ4upRpAn/Fn1w5ZHXtRc+xI07Ug1Q6rsS3dEvlC47VtzPHaxEAOQZzXZKdE4alzfOhIs2y8URgP1jSf9st5VIqlIe0OketvmHpAbUTDkF74E8TFd+0fiXFFUtbNItPP9FD/Vbr5DpbPiEme+9SPIrmoMq9VAijrAIZ3R0BSgqIfTqmwT9Q7Mc+Rlqi2ljCsSZzOkcdOPB0ODex1m16pnz08pZ5o+Yruw7Nu6PIl/pVPcKEj0m4QqguhTFUz+4Cnc6nnca7mPvx7/pBJaL7NALcA+V3q670eT7kNugLxs9ZF9ncgWW59SLEBFZuc3c0/OxKcNuOV+KmHzHmQ9POfp1+7GCUMDDKrpXyGaYVh9PgJfMCxG7ZLOChOe0ptqAHr6p3F/tPc+YR/sDjEIBLcV9f+biN0eNqnsHNL17PwAVcvC9GQLRPeCxlq4CPNo/XDogMNqmtHT1ouDg3Rg1F0F0fkCKwjluNte7kCO3siOlHoIa1YAGZ7Nyan4PBLXNEzZuEGhbweeM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47790e30-7971-41e0-ee08-08dc8c141f65
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:48:43.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZigB/Kfj4C7T3nO4z+73KeJmxIOb6IV0I/84566gQA/1ZPEMzbw6QiY6bLVTciGMP5VwXxGbgKPpIxDgwbvVrFx1KaeQ5iWxIDd4NzX0k48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140009
X-Proofpoint-ORIG-GUID: JImaFDinQMRorhjRTuci7drsfCpRHjig
X-Proofpoint-GUID: JImaFDinQMRorhjRTuci7drsfCpRHjig


Christoph,

> Remove all APIs that are unused now that sd and sr have been converted
> to the atomic queue limits API.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

