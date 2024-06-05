Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD1D8FC53A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 09:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735580.1141698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sElUw-0001LA-9u; Wed, 05 Jun 2024 07:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735580.1141698; Wed, 05 Jun 2024 07:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sElUw-0001Ik-5P; Wed, 05 Jun 2024 07:55:54 +0000
Received: by outflank-mailman (input) for mailman id 735580;
 Wed, 05 Jun 2024 07:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TbIy=NH=epam.com=prvs=28861ff5d1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sElUu-0001Ie-JS
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 07:55:52 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04d0861a-2311-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 09:55:48 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4557rMdQ005517;
 Wed, 5 Jun 2024 07:55:34 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3yjm1b009x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 07:55:34 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GVXPR03MB10577.eurprd03.prod.outlook.com (2603:10a6:150:14d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16; Wed, 5 Jun
 2024 07:55:30 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Wed, 5 Jun 2024
 07:55:29 +0000
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
X-Inumbo-ID: 04d0861a-2311-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N130QbYABJePCtyJtX0p8Z9GVMN8j5/cyYS7L3iDL+9FnEbnGYzvgj/EID9SST5Dai3KQMyA9Gbmi8PFAI0QDLM1u8+3Etfuqr5wf/JVvqfbQoVo2QDn2tmWuvPXz5FaytwSllKee9DyP4oBBPOGMjMcVO7Nuevv6vPwm0tm99wnKC3fDfl/RKtFouuE4+AWyQFjYqqiXWCKJRqf1bCXyjWloWITie64oLZ1q69feVScvQvg8bGbosdN/WawSKgE7gsY95Ewd6Waed95jxZhDdMQ0dFjwjrClLTHLsIwwoGG1PdIrK17AmkCCn0I/UVV2ddRWtya044jf9Gok3xPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs645B1pau1J19eF6GkovdydEBouVGJHTXTuW79/Qj4=;
 b=JUO0qudGSKtVuAKCbFzyx5i+PkAJtL5UAgKmzgJ+aCZ7YqIt3EgWcO7SI504sWpupvuCql/QRQ3F0t03+KFKy/Elz8FPt5dPM9I1hA9TDM/h7UVFLnRy4cpYgfG+dFZo5bpZCd+2+6hF1X5GyrUTy2/LpbTR+6owKZKjHh3R0QpPhBnnNNKtiqfWieOEHphvRWhHB1yF9B2+v/Dj+aENOM84DZlwIz6Ej6eJtYXggv3oRIWtysVgtbWHY+MYW+QH+hYtXRfxd2krZ5x+RLuDmTdXcqXUoIVK/+SJOeViDoeailD9/Sy78a00BTgvUko3M71MyZbS8jKWTiGvJoJS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs645B1pau1J19eF6GkovdydEBouVGJHTXTuW79/Qj4=;
 b=OmVAneRhXuKfNGdM/7dShR6FQUoGf7X6laPDcaVNY9RkPIFImsDtmJsdhuethQrNX3hz6L/TTnV3kH+TZPnYlALle6uNJ+xjALheHIT/mn7GnPMfADjZ6mvqMEn3pwfcpP1OcIZxEcqhK7ASKBZGkG4i08bthwPN0Zpap1A1eXGepAv2cUUM1Qfpvimqq9u+g7orwP8e37+SexlTLXuz/G4N9Yt21tF9zvRaFcppJZg96rXxak2N7SJ/WXnNv5xJLU6COpBPr2Exw5JHrneqHgmpJ25kyx+VfD836wb/WWyfV7b2oaIKWdoZVYMMixukjDeJiS8YAs9hJrm2Cgqz/g==
Message-ID: <055cf2c9-dd70-4eb4-9d84-270cf30e385a@epam.com>
Date: Wed, 5 Jun 2024 10:55:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 14/16] ioreq: make arch_vcpu_ioreq_completion() an
 optional callback
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <a0f9c5ef8554d63e149afd0a413a27385c889faa.1717410850.git.Sergiy_Kibrik@epam.com>
 <cc51da4b-d024-4923-95a4-18e11b150f90@xen.org>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <cc51da4b-d024-4923-95a4-18e11b150f90@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GVXPR03MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: 7632df28-9e1c-4d78-7c97-08dc8534de74
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGwxMVNoRmlEM2RQem04ZzRISUNmbGhESHdSVm1MQjFDT0w3TXVscU42UjYz?=
 =?utf-8?B?cStleGhPUUtBWFNzbjN4YWxENzBNTDJMUm9ZWDVFc2JVYlJUb3UwVEJIQTRi?=
 =?utf-8?B?WjdVdFpFbGNiTHBwRTRmSlRBRWk5bEdGWnlwVThZM2tZQ0ZQOGV5UUVqcTZ4?=
 =?utf-8?B?bHJWdlBhTm9aRlZiVTRtcUEvSTdNQlpVSzhSdnFtSWoycE9vai9MNXlLUEd5?=
 =?utf-8?B?U2hlZTBWU2lyU1dHKzhUSFZVaGc4LzFRcm96aEh4R2JxUWJBNk5TK3hveVo0?=
 =?utf-8?B?YnBqU3JtYWlYcHZDQmJ2RkduQ3ZkOEdtR0pSaVRTZkRFbkFCUGp1RDUzWTIw?=
 =?utf-8?B?K3hlUDVYcjZ0MUsyRzZXU0dQNGt3eG1iOW96QnlOcWIrdERVb2pCeklEQlJw?=
 =?utf-8?B?UXRqalBSbXBaUjdob3kvYWx5eURDRndpQkkveG9HSS9VM1I5SXlQMUk2azBU?=
 =?utf-8?B?VU1aRW1xYzcxc2REa0lUb0RtcFR6blZEUDk4VllvWWJJamgzOTAwcHBiYXhw?=
 =?utf-8?B?dWtEUjBQdTZRM1l0dUUxQUtoeEM3UzVvQjMyOVdiNy9UUHpUdStoTGtRaWQ1?=
 =?utf-8?B?WmNNZDdEQzJYVlJqTXhIMkg3Q2NmYitaSG9yQVhSdjQwK1M3SGNWWmVDczg2?=
 =?utf-8?B?eWIvRmR5NEJVUFNNRG56bVhjb2dxOWpKQW1HZVFnUGxJT0NiR2d0QmM4cUdC?=
 =?utf-8?B?ZjZ0OUhONm5LU2swbGFqdElFMVlpRUVIdVBmeExYMWhrQmRNVlpKYnlLWDU2?=
 =?utf-8?B?dlR4UGRzRnh6a2FvWHVyYlFvME5Dek9LWHdtcldYeFZ0Y05BdHZ3amNScXJu?=
 =?utf-8?B?TGtQa1lsQlk3WEwveTQxQ2hXNGIzbzJvUnpHVXpWRTcveFV6WFFENTdyaXVz?=
 =?utf-8?B?ZnhteFh3YmRKZzk2QS9Xb0FKeGNNR3p0SHhITENYYytOKzByVEF5ckh2dnBN?=
 =?utf-8?B?QThwVWthSGcrbzI1UjJDVDZXZ25yckpSdGNjcjR5dUJEcXRPTzVXLytRQXhK?=
 =?utf-8?B?RmdFWFVyck1lY1VXeUcrTjhPdWtDeDZBcVFOc1QxS09lL1NZN0pHTk15K2RO?=
 =?utf-8?B?REpHRWJNbldzcENoeUxicmtnVXBWQ1oyb0hsaHU2MFJtcWMwZWQxU016Znhm?=
 =?utf-8?B?ZEt2WVJHeFBJT0pyVUdzWE51Y2VVU2RJbGU2TjIySXFUYWZpbUd0TXQ1cUcz?=
 =?utf-8?B?blZCTnpENnk2ZkpkcjJMTGg1NzJXdmg4YWZ0ZmNRQmpYcU44ZklnNG1icGtD?=
 =?utf-8?B?NldiWDRGdElhWjA1dVhiaDFGMmo5UVplVmkwS2FpaGUxTFJMTkZxbWx3OTd2?=
 =?utf-8?B?TFFoN2JIUlR2dHNoUVhEbXlsQmtuSklvRkQ5VFR4VGNNUm1hQlkxdXJuWkcw?=
 =?utf-8?B?U25UcVhkTThZaThUaElWb0ZrVmU3ci9oM0VZYXIxd0RTb2FsQWlZQmF0TUFI?=
 =?utf-8?B?MlZqSTBlVk1xRjREQ0F1bndlNENDNXJBejl3RlV3cEQyb0VHZTlYUW9XKzRs?=
 =?utf-8?B?d1Q5S2dpNkl1a1hDR0xCNk5XQTlFYS9kcElzWHR0WWhuY2RBd2dHMGgwTTdT?=
 =?utf-8?B?Mm1sQTZhbytkbjR4ODEyVlhaY0VockdOUy9WSXBhbFcyVDM2eDRCdFVLdFRU?=
 =?utf-8?B?ZjJWV1ZaM0tKT2JQaVBQVVZIS0FJZEt2NUMzcTJ1eURCb2lFb29MUC9URFRV?=
 =?utf-8?B?dGFsa0QrZEVXNEtUaEZGRElXR2dranNtcC9teWt0VDh1ZDM5ZTAwVDlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTVUaVJVQUtnUmU0MnZSSWkzc3lJTHhCNjhJTS9NeGQ5V3o3VFNFY3VzN3o2?=
 =?utf-8?B?My9wZW9ZK2FNVkFKWmc5dUZvb0NxamE3cmFOZmxxdEVlVlQ1YTBiekVXVkpy?=
 =?utf-8?B?ZEtiK1dKc01kSGxId0pTbmo0Y1ZDQlJvdW14MkFpVEc0Z0UwZStwQ1VZUlFL?=
 =?utf-8?B?dzVBTWUzM3RGcEFLOFNSQkxVYkR1R2YyWlZjOEpIS1lRSnZQbng1aVJCMmRk?=
 =?utf-8?B?eW5IMC9wVmNQb0ZRL01haUFDSks5dXF1K0t5cVRUOCs3M01sS3VlQmRsUUJX?=
 =?utf-8?B?RmFlVUVvRzdMTjVZTzM4QXB2cnZUaUFPVUVqSDBCenNvRUkwS2lIL0xDU2pj?=
 =?utf-8?B?YW1oVjVYbXZvOTlhZkxFYWE1NVVKdEZ4UnQzTzN5eVdwNzFVcmU4TlBBeHEx?=
 =?utf-8?B?Y3RSazdXb2o4YmRqaFBRZlh4dEFCVmg4aHI4L21mMGxCb3V4TkYzcUI0U1pQ?=
 =?utf-8?B?c0NYRHN0UjFUb0Q5bHowOWNyMWRuS1NRM1E5SHp3b0NrSWdsdVowTGFLR2pa?=
 =?utf-8?B?eno1NG1FREIyOU1TdXlLSXlyTWdqWW42SDBYQVpTZnJQaWk0ZUNJNGFzNVpi?=
 =?utf-8?B?aGxCTnhLd0JPeVR5TmpJSlR5K0RoSGxsdFNadUE0dmVsdnNJanJSTW9rWjlX?=
 =?utf-8?B?QVpZenBPNTVHQmdKdjYyUUpwV01oU0VkVlhPZXk1Z2wzQTM3RlhwWU5NYmlC?=
 =?utf-8?B?VE5pcjk4aU03VnAwRWpPR0s3blV4Z29TR3hiMERmRGVTMnlieDlkREhZMkZ4?=
 =?utf-8?B?clJIV0c2NXBMMjZiUzdZMkNhQzhOb0psOXZxQ1BoejA2bmhJRGZDRzJLcjV0?=
 =?utf-8?B?MlVPSnpEVEpISU45U3RIWWpvNHRJMEtkbjZyYkQzbnMza2FtVnB5VDlpZ092?=
 =?utf-8?B?NTZlSXZHQytjR1dpNmNVV2JhemEwS3NXVGlBVEM3VnRLeUdTM1NOVkdhalZn?=
 =?utf-8?B?VEFMR2FLYzUyU1N1cXpJVWZibU96TGpzelZ5c3p1b3VUME8wR3lVUkJ3cTFp?=
 =?utf-8?B?VVF5b21yQ0VDUVA2WDV5MlFhdCtkQzJ5WVJLUHYrZHl6dDhCaEVzT2Nuek0r?=
 =?utf-8?B?THJMYTdyT2lZZkRuNWNmZW00N0puL040R3B0Nk43Yis2aUJMUFZhWFliMXNS?=
 =?utf-8?B?MmxqNGJjRi9hNUpMQkJsM0gwSGFwZEZWOWhHeDN3RldTMThLN0xURVlRcXFr?=
 =?utf-8?B?ZzNBd3JaZkpXM1lQaDIzazFBOXd4K0doSWlBUXl3N1lxQ1l0aC96dml1aGJL?=
 =?utf-8?B?V2tBZXplRGJhOWt0UFNlVEVkNTVkQ2NRNnZZeGZqQkRudFd4cjNzamhqQTVN?=
 =?utf-8?B?ZDVWNlpidjI1by84Y0NoZmpiZzhWSmVXZXo4djBacXB0V0NLSGV0S3lua204?=
 =?utf-8?B?SzRhNkN5RXlpYnMrc2RWZVlCQlhXaXZIVlk0b0hUdnpaNUxUS3daWnRiK0lv?=
 =?utf-8?B?ZUdteTZoR0tQZHA1VlRXL0FTYWkyQlhMMEpVd0xCMDJSTi93alBlQW5zWGQx?=
 =?utf-8?B?b2hrSEgyejFGNzNjdUtndEhZSzBTTXdSdFd1UkNoWldrMnFJUHlRMDU5c2hO?=
 =?utf-8?B?b09LczkxRmVSbWx0UkkvNk9VNGJ6Q1ZZQWNDZVZDeVRuVWtQYkN2U0dsMjJr?=
 =?utf-8?B?dTRHTW93Ykp5UTJhMExIMFV4MTVyTnI1ZzFEYlJDd0pUc3ZDRU11NkdWZm5i?=
 =?utf-8?B?cFRyVzdXV0dVKysrZ1YrcEFpWE5BZ04xU1hoTEhpZzI0eTRjQ0lScUdZYzZB?=
 =?utf-8?B?MWI1MlhJaVNRTWE0MmVLQ0R3aDlCUk1DSFZRMjNxYjZTSFl0bmdCZ24vdjlx?=
 =?utf-8?B?MkxHemlWbHo2SlFMWjVGVE5CNHNlMEVuOWZobnhXeWtnNU9kWUdDd214UHh1?=
 =?utf-8?B?YjZuN3kvY1Nid3hnNkJ3V1gyRlBjbDBSK2tqaW1sQzhzbDJyYzgrMDloOEcy?=
 =?utf-8?B?cmt5VjBOUkR0Q3VKd2w1R3dvNEwvY2NzcFFBVW9hM0EzZ3lybk8zRDFvaE13?=
 =?utf-8?B?U003L1l4WkpKTFZWZjJncWZMa1pCSlFZdDVGRTM0L2Y1RzJKWnR6Mm9IRG5q?=
 =?utf-8?B?RDB0VEtXL1ZJTXV4M0VPRERteTBoaVZ3LzJhRENmb2pPZGs5T1BXZkdaTmkv?=
 =?utf-8?Q?MGCs7GUsegUAmUPO8Xi23HTRK?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7632df28-9e1c-4d78-7c97-08dc8534de74
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 07:55:29.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 023q8uG8fM8tMDuJnOQ5p5KhbsLr50sqPmq0JLOEILD7KOjMgUY9fr/r1Wiia0z/57jMmK7r5F2ofTpoYdQV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10577
X-Proofpoint-ORIG-GUID: dEKU8e4LmIBdikq6im8M274oOytt-8P2
X-Proofpoint-GUID: dEKU8e4LmIBdikq6im8M274oOytt-8P2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050057

hi Julien,

04.06.24 14:07, Julien Grall:
> So this match the existing code. But I am not fully convinced that this 
> is the right approach. Arch_vcpu_ioreq_completion is not meant to change 
> across boot (or even at compile time for Arm).
> 
> Reading the previous thread, I think something like below would work:
> 
> static arch_vcpu_ioreq_completion(...)
> {
> #ifdef CONFIG_VMX
> /* Existing code */
> #else
> ASSERT_UNREACHABLE();
> return true;
> #endif
> }
> 
> If we want to avoid stub, then I think it would be better to use
> 
> #ifdef CONFIG_VMX
> static  arch_vcpu_ioreq...
> {
> }
> #endif CONFIG_VMX
> 
> Then in the x86 header.
> 
> #ifdef CONFIG_VMX
> static arch_vcpu_ioreq..();
> #define arch_vcpu_ioreq...
> #endif
> 
> And then in common/ioreq.c
> 
> #ifdef arch_vcpu_ioreq
> res = arch_vcpu_ioreq(...)
> #else
> ASSERT_UNREACHABLE();
> #endif

Thank you for taking a look and a suggestion. I agree that it's all 
related to compile time configuration and not a runtime.

I'll rewrite the patch and let's see how it looks like.

   -Sergiy

