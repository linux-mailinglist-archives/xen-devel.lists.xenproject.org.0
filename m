Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96227624B46
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 21:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442176.696228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otDtH-0007Gd-OB; Thu, 10 Nov 2022 20:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442176.696228; Thu, 10 Nov 2022 20:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otDtH-0007Da-LI; Thu, 10 Nov 2022 20:11:11 +0000
Received: by outflank-mailman (input) for mailman id 442176;
 Thu, 10 Nov 2022 20:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZeX=3K=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1otDtF-0007DS-Ky
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 20:11:09 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc02d07e-6133-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 21:11:02 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2AAK9uWO017710;
 Thu, 10 Nov 2022 20:10:49 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ks82q805p-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Nov 2022 20:10:48 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2AAJFSGF004161; Thu, 10 Nov 2022 19:30:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpctpvfex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Nov 2022 19:30:33 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 by CH0PR10MB4987.namprd10.prod.outlook.com (2603:10b6:610:c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 19:30:30 +0000
Received: from BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a]) by BY5PR10MB3793.namprd10.prod.outlook.com
 ([fe80::72b3:f74a:9e7c:680a%4]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 19:30:30 +0000
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
X-Inumbo-ID: cc02d07e-6133-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=O8ZQBeQ4uz997ZkYw7OOdLDUfFU9LYeBcDcBTLN/pnA=;
 b=y478Q4hXpnfPptRbnXLc9QKiqFboQcr18w2rloL5FCJAJVjkpB/mKM4ITyzAvo9Afhix
 NXrvZb7ug0wsxecGUxQL3O9iBo3ubJeIfrr1tEByfPbfCDM/qhF46u6UJPYmzsnEBG5d
 M9lhSFPIwS70hNBvHmQNdVUulfT4osa96E/oGbOSyHkWiZGWGCrqWTlIPULwGzv9wleZ
 yRZI4m5Jfix3LbCBcESyIVF7iDj9ofwBAcjTmTRahM+9b9cD/B4TyLHjP37DJeyfWj73
 KGgdQ0bZqK66NiMKQm7H4vuFX7uizmZmBauemkOMgO8H86vNpi5Qb42bb1DdemMISty5 TQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcX7SPicFWGGLjP8I8YWtsQzk2UmytGdrMlunr8n/hEPkRxARoOiNxWYvZN8aH4odJGouzoUra1tMEeYuhpzLI2mBeJPQxhMNhG6HnKs4a01M0XvLkn5mpCABuww3IigLBlTN2mOAvd499hjYoV8aqFnA8vK3Cw6KNRCRz1GWo4HcUNXQxBgDbZnuSJpg31YNSz8vKkGhrkXPciIyr/iuyLhI690Lxnj6R6/ABHEEy16I9OUqG9MA/FxfohHtVSd9D41Lbb+C3BzdCeRTBl9E2Ilm8USIcMnMalzvOs2QGWz4BGlzdFzCCW/UKlzEJ6MNV0iJbj6VjU32ewOP/GklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8ZQBeQ4uz997ZkYw7OOdLDUfFU9LYeBcDcBTLN/pnA=;
 b=JXCutMoB0lgZkhtMUUZxi0/oftunNQvs4kf4qhbZJvad840JWb342zq6c18COwiUdIpOUELhz0Imxy7/+ETBp9OO1MWpKAiRhV2wLnMKut7lHhLvGDrLcraROxXJYAWU21Za7EnoZJ/okLPg/rQgSlHymtwucJkG+Q8ga5JeWyUkYYkivo2waVRFs/L77tCzEOSXevOIdKf05XWg/BzF7tJZ1qkxkfL1ctfAX2qVOCYF9L7yWvYn2H/nCOEaG2XQeF4QlEQdkZE+Ub3/VAoO21CR8UZkDjxLSaeGy6hHeU0sAT0g+Hp2tsQt1CYH77LKR9O7FzXGbzwzn/+DKVyHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8ZQBeQ4uz997ZkYw7OOdLDUfFU9LYeBcDcBTLN/pnA=;
 b=AiqCmhQadovFKm3bZKyFwH8/e/Gq5wOzwf8MMdsaVntXB4xBxCrBJ6ZPFa09gnNPG7ggt/Z1mDmVVptJampQpkQrhLN8eEqWvD5wt8avOLWiNUrYKpN9boowsY89pcC7qr3Y+ewY0/aGERM1r1eid/3O2AmSH4rzi579CG3UMRo=
Message-ID: <267d84e3-3fbe-f010-113a-805763b7a325@oracle.com>
Date: Thu, 10 Nov 2022 14:30:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
        dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
        trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
        jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
        jgross@suse.com, boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
 <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
From: Ross Philipson <ross.philipson@oracle.com>
In-Reply-To: <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:408:fe::15) To BY5PR10MB3793.namprd10.prod.outlook.com
 (2603:10b6:a03:1f6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3793:EE_|CH0PR10MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: df339611-71bd-4c8a-c31c-08dac352074d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZTjfKNRR1crSA0GaNU/deML7H2fClMYqinvliL1cLcxSZe15XF8ZsJJKscbTK+gbi5k17d3VLqhWJHVHxm9JiZ2svOIWdXkaMRSdpmutBg/FsLCci4JeQe5HkuNTsgQf+FHf/h6SUaEIDMIs7vXiLqkXjcebj7/tXEnz1nOMB2241LgPXhEd9+xUjaniF41U3E1PCiyUcnpaXL9jfQuyHCpVxQFV+zcJyTgMnwZHXLtzILHZItp2jLEoCLW768zMGrklLCAD3HChLIWWPaUJ55LS1U1To0WJAnqKqEWJJ6WWJQpeKWUv6sWhyGb09z4bhqAz0I2m3/lJv8JxnlmDZZple+xkmOTf2y+VoF+5OsfPdz818HKyyjpNIX0QO8ogOTLnYcbb41pQ0MUbQEv0RWizANoGNKpc6HrQoao6GUwuZbHJby2sP/nA8wqak2UtihEY5G4AJ32F2mAw2Y62H8BBp9R705C3Mpxm5K3NEyNrkHxaaYnD6vaU3XDI9vFHCagdyD66qQQkkl6MCUzeZrHS8vhRtzKuXppyyko5YHb2DPnRygl6AlkwmqLE7YQVMDnXJISjrJVY4lin6FEZe7+SDVwOD4KS9opKbfsTCl5pMuLTucuDYgVxjuUFHu05pkGCnSFGMsr81nTKvUdGZ/bb5txFc02l5fvCBvdmIPq/CJybnE6p9+Q1T+ZOxWE/ZNmyRdKEtfHikKkE3ZCMuBHVw1nxsXmd4+yPrqKfaJ3J0B0d5jOUFn7R5wOFQBgy4p6l5jcaETgE3n5biRwrig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3793.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(44832011)(31696002)(2616005)(316002)(6486002)(66476007)(4744005)(66556008)(6512007)(66946007)(8676002)(4326008)(2906002)(6666004)(41300700001)(36756003)(8936002)(5660300002)(7416002)(53546011)(186003)(86362001)(6506007)(478600001)(31686004)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3pvZktoWFZiclkxTUgvaXd4NmhxRE1mTUlGODlCUzUydkM0VXNVbjVYT24v?=
 =?utf-8?B?dFZ4UTZMVUNSaU9TNUtPdE1abTAxWjRaVHlKNEpGaEpORVhoQk1EQmIwUXNV?=
 =?utf-8?B?UWpkTG0rbi9QcTJYUC8yZEpLcC8wWmJnT0VLZktobW1sVHU4WlhqMzZvRmJN?=
 =?utf-8?B?V25Ebnd4dFZhNjVueE1pYzRMbWlwK3lnQ3VhSzhUekh1UVpiVVl1R3BpWDVm?=
 =?utf-8?B?RVpHUVRGbmpzalkvYzhrN3JRRzlYVWRqQnluWnVQdTJsa0pYRDJ1aUVIOWFn?=
 =?utf-8?B?R1pHS1NUNmhyNzRlMEtoYjZuZUdjSmNrb0pWY29udjJmSklHaGRsMVIxTmpG?=
 =?utf-8?B?aFpmYlMwRDg3MnpNdWlXN3lKVlJrbkVxdURDVHZ1M0hKdHJxQ1lEaUd4NDRt?=
 =?utf-8?B?RkdYano3M2F3WjFVU3gvQzJnUHRDZ2hTeW44R3RQYlFZU1ZrYkU4UXBhd29Z?=
 =?utf-8?B?cFdQT0kwL1VKdlZSMzFWMDRzMXI2M25UcEtEZFNyUWF2dkE2YTNJZEJua2Z2?=
 =?utf-8?B?TWNSd3BxRFZhQVlvUjd5YlBabXIxZUZvYnBMeW9KN2RUelh5ZWxlQXRnbEhV?=
 =?utf-8?B?T204ZmtyQ2NscmQrTzgxSlMvME9YNmkwcjBiQmtONzJzRUdlYmtDYjdKNE1E?=
 =?utf-8?B?V0RuN2tWOTh1SnBVYWVrRUVZS1RDa0lRc0FkNmxMbGNwYmI4bXN1R0dVZWVn?=
 =?utf-8?B?N1Bod2dvaExqZlRaeHIxUFRPQUt0cFZsNm01YW5uQTRGbUdxaUR2MGJ1amli?=
 =?utf-8?B?NU9uYTJ4dTJBUlVvQm91UDdtUHJXMzVJV1dVZ3JUanB0bEVZQkhTN2dqNjJy?=
 =?utf-8?B?RGFvVHRZQlZMb3hPRHB3RythemNNeUFhNVczeFlSYWZVYStYS1RNNFhqa0dZ?=
 =?utf-8?B?SnR0QjJiVDNKdG44SFduaXFPVTVyYkxaakhWQjI4NGxvd3czcjMxL1E4blB1?=
 =?utf-8?B?R01rMWxZTHZ5bjVCaGVFbnhObzBUMWgwNVlOVERCRnNPK0F3cndEbjRPUXZY?=
 =?utf-8?B?K0JubC92Y3lkR3F5RG40Q0VTbmRld1BTWGl6NUJocHRQNGdnL2RTTkRpckto?=
 =?utf-8?B?bjVha3h1UDI2alRxeHJ6b1hmcEw2RzhKN3YxTndpWnpWeHBVZkMxcm5odEk4?=
 =?utf-8?B?NG42WGpOaW5NSFNpMGV5RXRISmEyR2lqRTNiMzZCNE9kSVFLaFZ6alVjUEU5?=
 =?utf-8?B?V2F3MEs3U29wck1tWVEzVmdHQ0ZML1J4dElTWnpzcm5PVE13Z1hBOXdROFNZ?=
 =?utf-8?B?bTRncDY2WC9ZSWZBMHYwWlRTTlhHYXFZQUxsVCtZNWlaY2ErWThtYlB1NW5U?=
 =?utf-8?B?QlJvS1VNU0NSb2hsQjVnTjhKODYrMG82dE9MZ1JneGR0QlBzOTUvOTV3SXRW?=
 =?utf-8?B?dTAyekZGSWJ5MDRDMUphRFpBZ3QvWE0zTVMwUE5OYmp6NHlsU2ZxOE5TL2l5?=
 =?utf-8?B?T0hnYTNrUnpSSDh0SmoyalJjendWU2RHcGd5WkdZWVFXdmljYTZmaE56RW1E?=
 =?utf-8?B?MmVJMUc3UGNQbWxZeU9lTXo1Zm9CTTR3cURlWmRlSmFqK1J4bE9Zc0NJdjV3?=
 =?utf-8?B?Rlk0OWp6dmpPZFFwRDdTYytQNmFrR3pvSHIvd3FReGxOUzFIMGtvSXBpbFFh?=
 =?utf-8?B?YmlkL2NaYlMzVExkQjdiYWw4NkdNTTZYTml0QVdwT1FXZTBsREVreTIveVZy?=
 =?utf-8?B?TU5YanpCNFc4WG0xTXRvTU1JUllxSTNlVjBIdzdaaERoM0tuWkFCTWpCeTBr?=
 =?utf-8?B?YnN2WGhzdGlKZlB3bUZTVnVWV29SVW42aHBJL21hUngyQThrVWhGcnhYb3Qz?=
 =?utf-8?B?amF6TGFPb3V0UmFTck9KRUpCVGx1NzVLdXgrSDIxSjVTcEI3OGttd3JsSVpB?=
 =?utf-8?B?VXlXdXlzYnpHazNCbUc3MXl5VXhob1d5ZHB1V3FmWWd5WlRoOEwwcTkrYTdC?=
 =?utf-8?B?QlFLalZOQkFjdEJ1cUJaTEdieFFJeWQ5NmxtUllDVTVSSnRvRVBCcEZ1Y0xT?=
 =?utf-8?B?MGhmMUkvbWRKa0g1NkVaRTBLVmE4SG5vaUFzMmcrL2R0eG1ialF4OXF3REMy?=
 =?utf-8?B?T0pXRXI2aWxIcUZJeXBMelIzdHR0cXVZVEVXV3llTXlCVVRBSEVlMUU5U3lB?=
 =?utf-8?B?MklBYlpyYTFjcVJoQTRPeEtXeDlySVdWblljN29uRWJUeTg3VzJwRjVBZFZm?=
 =?utf-8?Q?2drO1uwH/e9pdsSDxyRAXOI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df339611-71bd-4c8a-c31c-08dac352074d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3793.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 19:30:30.7055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8UjmBgIxTL5BS48FqDndM3TTnLk/2edmfQjIcGcANXp5ehiq9hBDuokEGxeVfoal2l/b5SZLENuGwe+1DT1MfYu76gNGBYwRCBTuHZIdiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4987
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211100136
X-Proofpoint-GUID: VjBUBuG55t1ISJRWg0gP5HrFJPs_aDr1
X-Proofpoint-ORIG-GUID: VjBUBuG55t1ISJRWg0gP5HrFJPs_aDr1

On 11/10/22 11:07, Dave Hansen wrote:
> On 11/10/22 07:45, Ross Philipson wrote:
>>   	dt = early_memremap(initial_dtb, map_len);
>> +	if (!dt) {
>> +		pr_warn("failed to memremap initial dtb\n");
>> +		return;
>> +	}
> 
> Are all of these new pr_warn/err()'s really adding much value?  They all
> look pretty generic.  It makes me wonder if we should just spit out a
> generic message in early_memremap() and save all the callers the trouble.

These changes were prompted by some comments on an earlier patch set I 
sent. It was requested that I fix the other missing checks for NULL 
returns from these functions but I thought that was out of scope for 
that patch set. So I agreed to submit this set and add the checks making 
things consistent.

> 
> Oh, and don't we try to refer to functions() with parenthesis?

Yes I can fix that.

Thanks
Ross

> 


