Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42D9080F8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740296.1147341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw2l-0001oH-30; Fri, 14 Jun 2024 01:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740296.1147341; Fri, 14 Jun 2024 01:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHw2k-0001mB-W2; Fri, 14 Jun 2024 01:47:54 +0000
Received: by outflank-mailman (input) for mailman id 740296;
 Fri, 14 Jun 2024 01:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHw2j-0001dt-Og
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:47:53 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b9aef7a-29f0-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 03:47:51 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fYUg003508;
 Fri, 14 Jun 2024 01:47:28 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhajat5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:47:28 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E0GIoR019902; Fri, 14 Jun 2024 01:47:27 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ync91ysmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:47:27 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:47:24 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:47:24 +0000
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
X-Inumbo-ID: 1b9aef7a-29f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=xz2nyBT+Qcfd5X
	dUAydJGxUHEjVbPYk5E5e0VlEOR/4=; b=SRJm5EcXZotiUmvO0lUgUjWERAomZi
	pHyN0P3DZpxyZmKFmP/uLq36q4BpszcTfMCzHmMDrMaEWJyZkjwqk6yR/imk6x1U
	AMJWqlIQ0ZcZ12mY19S6rvtkF6Q6UlmjtRZ4Gle7L3yGLhAscSccaniA63Qdtclk
	lAjMN3Cg/liQOQ9n5IHs6EHePzW/iCyUs5UKRzOka0+URfJnSdLLErnQ5BUue80n
	c3hKV10/y6oRc2YW9IYqcCNcY5MVqbz7atSNErHzcg0VJxHBpEHgLM5YqAyVaN9N
	Xwi+37XYhSj2Mxx6J8rrV5JfSlYsN6adZjCFVsXlupSXTX/T0tyyGo7A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDc3m0/C1IoXbj1xRlBWeffJyu0t9kjjuBUrLhLE5Tbh42G1Y14ttsOzmxHzQCzyOdH4ZXttXC0q/sjqelkkpJnWxQmsdvCjTicuh5iTQE8e52e1OCNyyCpwhwsTssq3bmG7iZekdVWUx7Axn5TCYdp3PkQM0IalOz7CfIVV1LYF2lKbmgxrV2xOkoAIDdjgQI8oMhYu7XyiHdAJFegZlfh9qJWkEceCyB6VFH3TMhp7bbiI/7q9APjqHv/TtRzrN+YAhMO8Dgi19Pe/yk7ZFy8uE2sQ7hsrUg9F7yLdAKK6fYuHT82eMKZkDc54XrGroprySsDjeR3Vw1Vo89SaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz2nyBT+Qcfd5XdUAydJGxUHEjVbPYk5E5e0VlEOR/4=;
 b=a0kJcFLuyr6Wi6k28KiRI5lPtAWtHRN4FyYsqmXdxAqqUpTObU4etiNrYdxaT00oKzusqUIiLOG1Mb8gNT4QK9BYWpSLcdIQn1hIs0wbxgBIrb05jZ1nSVcCV/lOPUl5Kb/0PzFuGuGLJDVmI7OcFdwd2rhWfGNDFzXaH1LTFP39JLaK32SXxlXWevTMfYE4g/eWrQEd6nzkzX3eUXClei2Gi7hY3ZZW3YiywKWDGUNOwQiZjqUoOpBMAKqna9ThfY+BikuN/p2/tTMl5FKl42jeFscuimU2HQV+IDTJzkZmKBBhkIJG3b39KkiX87wNDJe7YuPJ+f6wyHgFQUGPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xz2nyBT+Qcfd5XdUAydJGxUHEjVbPYk5E5e0VlEOR/4=;
 b=Tlq4beLQWCVSlGNuvrOMQgnSEXDDhzpBHhF02pQFq5po6OwFo/2oHlN1AzwisG6sXVqIktRhjNiMF7+vbkM7CgYt2H5bO17ihfjbWFFDYf8EdAIzLpTLmse2N+6/PJSGuZTVA6jie7FKPMcF/BixsjeMzF4E1sg+gkZ07L71NkQ=
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
        Damien Le
 Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 11/14] sd: convert to the atomic queue limits API
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-12-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:06 +0200")
Organization: Oracle Corporation
Message-ID: <yq1bk44s3bx.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-12-hch@lst.de>
Date: Thu, 13 Jun 2024 21:47:22 -0400
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecc8082-9642-4147-4e4a-08dc8c13f05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?umrq4BmdG1XBAd8+r3wgIyRSpgJIkPn/YbgeJW1wixy39VSs7DaiUwQLC+4I?=
 =?us-ascii?Q?an3whvu5RfjKYz7V08F7MiMeLL4+YvOi8M1+sVOE1sh5UGCOmtPXzrayGTvf?=
 =?us-ascii?Q?539Mt3UO3D9YHVJCkifGS9lzPzW24ZIq0+OVjezAm/amejYabOnJh6umyiGU?=
 =?us-ascii?Q?/rKciw0eba2dAP+i/Hr4AUWcKlCn4XozPOBfmKSMO3/ePmQFvsjelKCijfQP?=
 =?us-ascii?Q?wo2VOA/YALuKK0MJ8WB7xKIiQqyBPIUcckFGHGDSwGDDKbHyC9kTNUfJ72Zi?=
 =?us-ascii?Q?+bEDqe7c/ndZBQWIWnewoKNmEFVWMyeB1MPHmvm0OOBU+YSnQu/Mk6Msgh9a?=
 =?us-ascii?Q?YULGd6KOQdrXVbioqTGT5fxqm8E6/PsGOzBXL01JPfxN9otDgtjRAzHhLwMc?=
 =?us-ascii?Q?+eidnWANd7OrKv9P/LrxOd++6x36KKo56/lrQDzGeFbr/7aDomu4jmxurulB?=
 =?us-ascii?Q?zzl+7t9mMkbnhmVM/CD3Hz0x57xWXp1b0lZ9zCZ5rFI/azgYx90Tt7xboI7P?=
 =?us-ascii?Q?2CJJRybHbEu/zJwmVLwYKTGx2R1st++HOybf6ugH+K6is5uXzlnPQ9M/BzSK?=
 =?us-ascii?Q?t2wKFRRkUj3nURIe35BNAWVzZ2/b+YaJrjVKBFWfr3vtLAtou6bh1ICUjilX?=
 =?us-ascii?Q?jWdTMLFN7WD1+8FB1iS+FY5vCHHSAQA0nQxGA3rUYQSXHJNbELnepMjgXgy4?=
 =?us-ascii?Q?csWP/s1ZaesJraRuIgi120ZZk/ENOryd8KyHVrLcKU5pFBtiM3GMNGj7GsqB?=
 =?us-ascii?Q?tzJ5VVmznOFM+VB+abFlgf2hFXyqtQcZu0XrTpCS84PSkfcGRLTdavdJ+4xt?=
 =?us-ascii?Q?cMBh00jl2IIACX87jDF7jQhek8cGbxsLs1LvgUYZ1YXoFOxUsjAAqyRKRUEB?=
 =?us-ascii?Q?YQmLExY+sK5bLYuMGwrh1lJwadzovePyARFvmOYjfRoywfYeqx6gfTptwl5b?=
 =?us-ascii?Q?BIZGJE/UL7delxY7pXaZlrOpByeiZSpUGO+VFdB1IKLKqixdB8nv1Ep0CJW7?=
 =?us-ascii?Q?sG91aDre5dTr8AWfuAo22iv8DJ/N9tkl0PuQrdcAz7jtAiAKmw+fnGa3/tdx?=
 =?us-ascii?Q?R45JYFTokqJynDbJ/4iON7CsVp98wxOHfhdCDiC32xgurUB6rkrcy3f2WWnq?=
 =?us-ascii?Q?qrdkdwJ+aAYrLNI18NKn3TF7aFC/Yc39IWRnDrTsEw4/A4pHw2ZHXHjn9iQU?=
 =?us-ascii?Q?hZF2XAoVZzViHsQ08sLD2p+0zpRt6L2hsL6niuBL4a9c1SLa26vrd4DeMDZ/?=
 =?us-ascii?Q?Xt/EeKsDfv0blqYO2dUiVV9ErxpitGkCYBJtsT9jjPHKDmbGW09HtweI7Xbg?=
 =?us-ascii?Q?DCOj+OXdd0UvGiBAmYJPzv7o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rSYeoEduWLKFQa4apemX9gFGO/DS6/rHgOTGqUN63N3oe6hBk4sbW143vG4z?=
 =?us-ascii?Q?9oM5FFkhNu4yEBlC2+EnmibGMnCVJwPvmWQX5wSXXcF2wNS0HXoulYMMwnl7?=
 =?us-ascii?Q?Ppyhrq1PkNghLcxj1/8SkEJKrdY1T26ytP6xwYPeI+nS/QmGQGhDIbyAX8LT?=
 =?us-ascii?Q?cfv557zeLYWV4I1xlRpNd7R+F3msuIu2VjsebEnL+qhBEhh7NHCbkOJfdjHv?=
 =?us-ascii?Q?v8aaJgD4en6HFyUwTgRo/sVFA0d0yBI+CKLbcVicyeAwtZI1AZDFnHPGUtZ4?=
 =?us-ascii?Q?/2vDxlXIkjhmge/fhT8WDktFDeJd6PKyYNFjr1I0+KG/wsfBN48ULHvDYdE2?=
 =?us-ascii?Q?/nGrQABbbdSybXIgFbnqHDdWB9QNyBzXpV+B1QrZicTnDu0exBMbjTPoFU3Q?=
 =?us-ascii?Q?7PttDmjJXSsdHKb9JHrMwHL+DYg/kN+SoDRoQvP/EWDC5PHTmw/6wx9AeZ6b?=
 =?us-ascii?Q?JRrt3CrpsFI4V0NtZSt8rDyew0MNpv215fSCj7Yanag0kh6ZKZDC4/KxQ8hY?=
 =?us-ascii?Q?UVBC5Q2+Pv+rW7OcySnDkqrebsVyTicRSrTHS20tqCh3Y5pbU1Nz16siWHjG?=
 =?us-ascii?Q?Zo0bEzm65osKLjxbfh7i0h0J18QAKC0jGFR/7e94x8EzgREKYGlZsdA3+Xok?=
 =?us-ascii?Q?+B0CSVmdI3uAwLByaSmdQsnbdjAgmE4TS+ftXZ87tzbPdNe2EEPeE79N8f7f?=
 =?us-ascii?Q?SibETJqY69TB3DhIO3jLmxxQ8pXtbgW9SnCIhh/0DFq1Ckw3hbD2qII3Ksc8?=
 =?us-ascii?Q?c4z6ZyId3XlP+gjNqJBKPgez6a4xp/XWPXNZHuA33wYwa9+xX4lR7Ds7XegI?=
 =?us-ascii?Q?hKg1HtvG7Jn6ZLWRmlL87+fKLdERGNG+oZVPQVbGz3GpwDeSgp+VCZplnFn6?=
 =?us-ascii?Q?VHheR+ztugTxeAfEZFrhTXm61stYmyAeNw9ST2pLcbKUMxhLoXJi4eZfuigq?=
 =?us-ascii?Q?YEWX7Y8XVjowoW9LqsZDLJcszGlovvm0HmfAgNeU6C+IR4MClaKA7RW2ZSSb?=
 =?us-ascii?Q?91zGbFeGqPc9aWc6HEod1x8YBVmeEUCE5UnW+IJTysKVxHtfuK/GOs+Y7fey?=
 =?us-ascii?Q?8/BGuEEL6L5hTVClF1cPxtwpYwtZS72SvmdA1HZMvslBYwJZUs5xFUsUBTN+?=
 =?us-ascii?Q?+GK9MAOzh3dkL5rMiX9jtoy76+BozCCyxD5+coEkm7G/el+lkSmC7edgLoFa?=
 =?us-ascii?Q?MPCSmlMSTeNDha+8qmal4PIT9Y++Sy5SmAUUnbTPK4qTKviJR2aefiqV6HL0?=
 =?us-ascii?Q?3cJDxsUaACagoFOEMbIrgQGq+05RqRtQr7u9UAHQnVTkv9nAmkQu66U4jqfD?=
 =?us-ascii?Q?zQMuJYrs3NzMwr+OGXWQg6IeF5seFGemFpI7FvSoh7IyWaJrW/hHQMToteb6?=
 =?us-ascii?Q?mK8F8RZnCvghyVkaWXewtP3T/pOcC75TyfOSfNIxqh8HB4rlGl1/qhlt4Dpi?=
 =?us-ascii?Q?bh1Aii76mpnueKFpCVWxrWptx66NVmXZlwaX0T+OjIpsRtFTTSHwD+NL41MX?=
 =?us-ascii?Q?zSlUVTstx3cCa0Uy2ddto+rhG2lQBtbNEjNPmbHLMtDxA8RIcZ5lND5RqQuE?=
 =?us-ascii?Q?rtsxhJje5a8GrhrIZl++GS4zuPBs7A+wObzX944bQ0+0+tUlc5fHU/dRJm7t?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BgC351fjvi3odrnDvOPq3TN1GC/SHFFOsZh+fHBi18wH9YEpOdmO0Q4Ccxe2C3hWHIt0zrOz0BHQsvkNxPL53XevjUmRSfWgd/xVz9FYf/pV+WixGGYMCXXb+dS179CQQXPGBivajrtpZ8iLwWe8H0A9wHe1KSUSkhQdvYWKTzZhIJ/jFxHavoXQGAstQpMcmjhmTpZyrV4wBSeYbzEO7IfHaxWuWtfD5CIms7LQnJ67qqCASbECnPA4tLhOxtiXyqY52O4Jp4CASsdenMOqJiG3cIRyIVYqoanaOcCLaPwOKlGEdOGGQzvhvBI5JknSRDXvFqqYmw7N7owwskjglwxnEIZj0Olic1JgAgm5pIdpEJ+geJpff+FKn3owhjUo+/5hAa+Ag4yzNlSeP7FypmEA2+NxIzhOkuh/0xbqYXLghkZkiAcOsZjMYheeZ6vxfsh4jR6DXkF0JeWmK2a0l3n97nqgGStXcyNWvrtORiLZ2aH4S/ZcRxOrINpDGM61RM1nNeHLTSBzXvkUw6deN3E3ScvQU3FzhgcuZOLDHOWGcEmlsvultjOejl681xgxOrWKevlmJJCl42tQSgbTI+k3TdXctFzDgbJqRy6pb/U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecc8082-9642-4147-4e4a-08dc8c13f05c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:47:24.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JkFr+VqQUFhIflRA7BB03jIEC+3tCSsyt539dzSXThJFJ6QZ5hEbXCOFACo9q04z6U4EgjdA/e/t2L3sdMoZyjv+JF5YSMwx0HReclFCRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140008
X-Proofpoint-GUID: OQ-Im8B6BvVuOqT1_6GUFXVlargNJvNc
X-Proofpoint-ORIG-GUID: OQ-Im8B6BvVuOqT1_6GUFXVlargNJvNc


Christoph,

> Assign all queue limits through a local queue_limits variable and
> queue_limits_commit_update so that we can't race updating them from
> multiple places, and freeze the queue when updating them so that
> in-progress I/O submissions don't see half-updated limits.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

