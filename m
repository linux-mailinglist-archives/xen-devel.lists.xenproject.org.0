Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0909080C2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740253.1147261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvsT-0004KK-EX; Fri, 14 Jun 2024 01:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740253.1147261; Fri, 14 Jun 2024 01:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvsT-0004HB-Be; Fri, 14 Jun 2024 01:37:17 +0000
Received: by outflank-mailman (input) for mailman id 740253;
 Fri, 14 Jun 2024 01:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvsS-0003fk-BC
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:37:16 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f5cd31a-29ee-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 03:37:14 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1OQCG000838;
 Fri, 14 Jun 2024 01:37:00 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhajasvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:37:00 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E1ShCH020103; Fri, 14 Jun 2024 01:36:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ync91yjxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:36:59 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 01:36:57 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:36:57 +0000
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
X-Inumbo-ID: 9f5cd31a-29ee-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=KtZawd8ipt/bHT
	0UO+nYK5l0nI6MDeL71Dfxb1yrrKk=; b=RCbSgTGTDb2WwZfeyzD7IgJycKPKwe
	YxDsPauTQMaK/2EW0X52vecNca3omO3gz9b/1UxajcCEIkmMgBmWwWRkuR2FpC+W
	hnxO9x04uxLM2WUddImHE+3H2J+psZGm3RseExkIXoFTJt9tCuxk8iKBj4yE+ovp
	d8656zjetqzeIhtsmD8Fkj1Rh5P4jDD1rzrWDL2NHCx4H7H/HM63z5era6JH1pDE
	qyHm+oJaaK3DDMsRBv9qTIiz9cT5sX/T8O3eX2F822zWYZiJ9jR0rJ5nx1CVpEbn
	BTyPuEF25dE3Xm1zRi6pflOum0oMpuQeiXoTLrBEKjsKOkP/LZ9X99dw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWJIWIJ0UzEvaLLst+ONo9xd6VG6X8XwQYvcnIASnv34Xw4NzJa4kwoxO388+WJBTPlXR9fsHoWAIVLW+6TyrGfZxpiqSvijQiYCG5hAEgtxEmC8Eq9f6aowhFyd6KMCmK3Lqbo0uNrm3vPZxvq1QVsPyJMZBQd7v8JQVsgDORj1iLWAwisw5UMDTjnLyksy1Is03zNomsGh1PaKclK4N5law5+o0Un/q9gSAIBb4+n9cw/sJb9pq0yHSBvm7tUrAeJgu70id/KRLGOAhaFXgzGs9P7KYVtjX3TTHPkqpNJoo5TFvlBrD1oefqFWOrApYx3PjQ8uT7QSlesWaqKv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtZawd8ipt/bHT0UO+nYK5l0nI6MDeL71Dfxb1yrrKk=;
 b=KR6REY5gWtfM1kCiO3HEclVQdZI2gjPsfzInhZbgOtf86E/VElSNQjj03gHuI6TngMuxFpWF9nImpfTkLMag8hFNh2K76vNtrAcLqYr5MLmd9rc6Y8nkpf5ukTuZlZSkrQWGoAatLybF422+R5p7I94oaSvzTo6QwIZuIF3wo8n6ykcXxsDY3zYP8tnWG7KQXQF3BlxtlV2dXyL4w8EoD3h9i7yNrdjB+BPLV35KRcCu26WEBMzftzRHEGjdhRG7iYcBmLPpyHkop7Pl8jF9biIBY2Lhclmr2e7d7T9yELzjrApwOF8mYpHBZzw/KjHvHFExsCT6EGlv/BCenQcNHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtZawd8ipt/bHT0UO+nYK5l0nI6MDeL71Dfxb1yrrKk=;
 b=W5HJ8eBJiipxSWlRSnNNKlC7I/Sd9ILYLRlgx8PMMZr6UhxrtPjCVPfPQ3tvE9G3OwkcufHqT/jiJtig7WApFE9NEhBtYUSdSDc2UnylM0WkB+duVCfelMODhqa18235wVSlM/5GacSag3XNRbH5Rpd4EbZEhRF3oWsmMcW458M=
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
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 03/14] rbd: increase io_opt again
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-4-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:47:58 +0200")
Organization: Oracle Corporation
Message-ID: <yq1le38tie4.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-4-hch@lst.de>
Date: Thu, 13 Jun 2024 21:36:52 -0400
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: ad25b10d-c159-4839-6203-08dc8c127a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CxikHuDB2sDfoq01/Bx5bpIr/1zgNtSwUCQoZOiTUZ6VIbGYs39VC2X5BD58?=
 =?us-ascii?Q?3i4TfSG0p0LKcxqNaKcWSfztZY3DyPOJbrR/oeaHJruapsUZBReH9VWkRl0C?=
 =?us-ascii?Q?oAbUyiTMpgswZkCZDsd1kTHTtxqzsMzVVbQ2KAcGaFxi35If4t7ti/2M7pZg?=
 =?us-ascii?Q?/uKJKnXTPWqKqArAumGz229/fkeVv6VIJDLzlUmrrtr0yY+IDAae3Cg6k4Y/?=
 =?us-ascii?Q?0LSDxPiDsyRNhD/PxPe/j4J/Htw+2jO29gODI0TIMEClR6M6O40ZGnJBgoX5?=
 =?us-ascii?Q?+eptUcCDYx3mRyLouRWYVxZs1rZCa3ZL8Qdfn+g1s0X0S3V1CTFEVhat7ahv?=
 =?us-ascii?Q?334LCuu3ernOFuzRTZLk86fG4ko1LikVA6AbiLIERo7ejjiJZ4BUlmoM4B1S?=
 =?us-ascii?Q?WPetPVqGdFqgCbL4WCcTSdmP12OhfkMa9tDsXx7TcxMfXDNdv/eaymxx+WXL?=
 =?us-ascii?Q?i/CXdupgsASNhw8jqphJRRTJOIy/wa/k2et7fJbQYJ5DDU/Ucwmoz+YCt1CY?=
 =?us-ascii?Q?0c84FED8AHybNEpOHsfFj5o3mIBtV3ij1+Sush0LjYqyp0+TVMEV6LdXGjGD?=
 =?us-ascii?Q?zmMx1vsnhW8da0N8NSgY27LxtqvXbWhScnfqWVqyKD1xr9JlzmOKwm/GF7VZ?=
 =?us-ascii?Q?2TMEth9bGmLW+++b3TEQ7wtoF0qsR612GbmBy0GmG1ryxc+WrKr70Lq8Mr0G?=
 =?us-ascii?Q?KCg3ryIFBVyEGKVdMRTFWDITmFpK5YMm8CTDvsgFzXLCbTMyu5RA5Fw+3qnP?=
 =?us-ascii?Q?SG7xHlCU+m9V8HAu25kE2zkrN2FZg2Pf7VgKt0hX32p5uZomhUzHiYv5iFdV?=
 =?us-ascii?Q?hiftZlqPG/CrilUvSH6jTA1G4VvBEK9wEOiTwq4VEhdhtHrYIEuPb63n4xyK?=
 =?us-ascii?Q?hkyjV/cqbc0P8nheYXJ/751kLUUdtdeYNdUhb+Fk7XyaCkE8js/qcnUQYdnd?=
 =?us-ascii?Q?UR9Jj6LiiU0stCnraWaz6SpB4aP1gWqD5QfCT6ZTkT0sltEQj2OVNej+ssSK?=
 =?us-ascii?Q?M+Vps0Dhb902QlifVovJ3EVJY81HT1kNT4Nv1/lzhxANUhxutgKXqmLBK2mE?=
 =?us-ascii?Q?81JHWwwGAZpzVkHv/mKLVOPbAMQpghBZNV3b0EYqtR4yrUsIEbMXZXXuY//m?=
 =?us-ascii?Q?kTrU4D5aLVY7J4vFIntBp4dviNlGRxjnY++/F8ke8Tc105FGJnK9cRQLVB9g?=
 =?us-ascii?Q?vu0a1EZSsVFUqiAary/lH820VrgOn/ahF1WsVg4cb3AEyLjfOvf4JT3S3MPc?=
 =?us-ascii?Q?qd2MUCreKoFBo0to+kRusJQ0Q/TbSu2pSoGBkmZ8SzsyvCQqyRYWhZnmxijH?=
 =?us-ascii?Q?mqavjQbQmWURYgeguesXMMPY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u5bfvi/xH+gURog2qNKgjxRvAnCMZJilnB1JEbGVmVSEnvjB9J7lagn7ztxQ?=
 =?us-ascii?Q?bDbSHBOTqoWUXLDVyvw5ijfFi0Dp5JgoPf7lBi7YW7Mb5gO8RaftE7413erx?=
 =?us-ascii?Q?dZtm0ayce8hSVdU1NEix4zU7EgZSkzwliEHsmGitBw4a2KzTzdqkHn1fdome?=
 =?us-ascii?Q?ww8xteaIY4QuuKXhhwNHYxgYCutt067+QPapfbaHiCWyCueyUK0WFE1aZtTp?=
 =?us-ascii?Q?vowcCJoizi7vIcva4z4gtNb6+5ui92LThkYJSz2sHrBayf/P8vtSSAWGGhkI?=
 =?us-ascii?Q?un754GIDgh+tQnsNkIUF25u8spLF5L/Drx1ZjRKOgQrxUGe0mYzEeMxszn+8?=
 =?us-ascii?Q?VI1u0bomibKC70h5AqGTtL2qfmOOWpokIy4s34QBlK8yNBu87uAOU/D4UkBr?=
 =?us-ascii?Q?WXSlsEwfWNYBAxVD3A48KhyeR2nL+qQlMcKKsbnkQomeu/QYAImz1PxajxA0?=
 =?us-ascii?Q?KNwQjt6tuGyKFId7BbXTX9V3JgEyociWSJ8IoalILU9oD2yKI/beA/zonOh+?=
 =?us-ascii?Q?mLXS71amaha6NY3VsFRRzaOS3fNmqfx11CU90VNMkWEY6SizkGh1R2Txbc90?=
 =?us-ascii?Q?n1q3ecJxHsMWwJjdlpeN51fzckbcnoW3zATng0JyNp+ADMTYi+KBik90b0Gg?=
 =?us-ascii?Q?b25b0xBUvBGVpSnNbDWi8HbOky5oXtzNvq4ynUKml+vVW6DE7NTs4SH6WmWs?=
 =?us-ascii?Q?jVFyN73TNDs8y9SpqKb8Gjxw0dEszBWaLRj26Zb4JjfEqZ888hQQnADNCw2/?=
 =?us-ascii?Q?KNyOlCx5YTSAYc4aoO280jyP0PTgiqdov0XiUr8kSHX3/cUbRLLJF/yTisU8?=
 =?us-ascii?Q?N3Y2F/iTBJMdHSTGVac3fV4jE1P7rgsdaRkslIuE8s3SGmqREdV9JwDCi1Mx?=
 =?us-ascii?Q?/pcLsI8AYTBNZRTWmNdeqK3FrjcaE+ptN1E0I7Yxko20hBmOIJEkrpWCsHqs?=
 =?us-ascii?Q?wQpiyqUredD1ZYpGQPmqNywemWdzhbDncHntqIZIGfqWf7Yo7ecpk0hspSRe?=
 =?us-ascii?Q?PzqOmrSedJi1SysW/BnTsO7UO8rufBkNS1QeBXfQIpwHg18KGz7+jQxle2cV?=
 =?us-ascii?Q?WSpSvIfi7JTbTb4tNqPHi5IELZAjg4GT59Bj4O0MORxz5znbi180w9SPyD9G?=
 =?us-ascii?Q?en8Q9qwJLbxlnMO3IDcTd+pqZg0i0Jj/KG9ibwSh/mrJ+NqY4Czh5hrM59Ld?=
 =?us-ascii?Q?xgIRIauhfZlsZLeMWdBXeij6QJBciVgvkPIo5j7hEPcQJNcqa2tX++Vp1um0?=
 =?us-ascii?Q?UZxpsFK8zY5lnHoJDxaPrfk3q7IwRDYAmeLS9gqtZZa/da10oTo1PZDrKaxo?=
 =?us-ascii?Q?AuGFL2cZOFYV1hkOseUmV9vDF29bHzCfg/V9Z9IyDvfLdDxnJcpVnjBaT+a7?=
 =?us-ascii?Q?hQsIldg2LdpMLEFo2boPNtX3sJDaXynuzN2tQn8jvdUqyY59cPkFWUifrW+R?=
 =?us-ascii?Q?WwqnvnPnIjk0iF/VInqTt91/JOt4HZ9gtgGEZZDAdJxAPOPB1/0pllafUtJU?=
 =?us-ascii?Q?WpL1qwhubFdw2qDdJ75jsvK3xwycO1CCEFS+HZOgn6XkmjipRiCoapjuZVUs?=
 =?us-ascii?Q?rS4RWyUAKTolJZbMdVMab5SS51TxpaKcek/eulmvdUhTGuZhMLCp/e2o0yxC?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RbFpIkPVR2k+z6tofyP8tOhnin8wIyOqiX2NYm0NAPTQAE4f39Haaqufj3LUAi15hx/ZOzIzMuLAmGknwGyBLJteeBXBLJfawwtADzRlyQRiNMMlIlduaG3doFZKBtsAfEISWBXNV5JPJHyFJqrK7bLqqbsMIKIlZQ3SiWWZfDMRrorePRnyH4VvpKPZyTzBMQ+cClzhsXZ2z3MpGlN36/7O/GqaJvBb8nZnjn2ooYngbebD19o7XXqtC4RY9rm5L2SuJFhmJkTGyCXW2esVRC5CuTKdNEjJd9s3bvTZK6Vkq9c+eci/IgbOLStU+HnLj7G9GceC8cdlnUm8CEMnzbnPZk0Ah925mmr2mSG/fJac0fSUQmlIDfszo1HJSQdoMv0DU7qyRsjV/4sMDNBGKcGHnbMQDk/Rz3gKnKWHMDeD9DNlH5Ud0q5Ovjn2MZM1IKiJRljAcW1Q5Zkjj/Z76JvQjCI5DPr8WrnGfcI6rZG4f44WIDpiUUfe20+sIW2wa8O8+i9HdfWN25JTvZv13JwbcO0DgxYZVQUIx/eDVjRXy1FG7qX986LgVmqDBtaSJ47JA2CTC3XHbknZstO2IlRmNYOE9FWR0AY64JACuDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad25b10d-c159-4839-6203-08dc8c127a74
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:36:57.3583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xha4n1e8R7krKXHmkcxITaDnJTeFoxOCXzkptQhrFtdMXipgFYcM7NzB3DgSgxT2tejpxGxTEK2fsngPU+pGrwZHpx9MG9/L6DdnvMl8Spo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140007
X-Proofpoint-GUID: ct4f6auKYw3A3Hs6XPBaIU7pOYWrvoM-
X-Proofpoint-ORIG-GUID: ct4f6auKYw3A3Hs6XPBaIU7pOYWrvoM-


Christoph,

> Commit 16d80c54ad42 ("rbd: set io_min, io_opt and discard_granularity
> to alloc_size") lowered the io_opt size for rbd from objset_bytes
> which is 4MB for typical setup to alloc_size which is typically 64KB.
>
> The commit mostly talks about discard behavior and does mention io_min
> in passing. Reducing io_opt means reducing the readahead size, which
> seems counter-intuitive given that rbd currently abuses the user
> max_sectors setting to actually increase the I/O size. Switch back to
> the old setting to allow larger reads (the readahead size despite it's
> name actually limits the size of any buffered read) and to prepare for
> using io_opt in the max_sectors calculation and getting drivers out of
> the business of overriding the max_user_sectors value.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

