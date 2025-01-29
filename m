Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA8A21AD7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878989.1289254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57l-0005JK-Hj; Wed, 29 Jan 2025 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878989.1289254; Wed, 29 Jan 2025 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57l-0005EV-9K; Wed, 29 Jan 2025 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 878989;
 Wed, 29 Jan 2025 09:00:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1td3va-0000fa-4s
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 09:00:06 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cf90dc2-de1f-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 10:00:03 +0100 (CET)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8uddw030249;
 Wed, 29 Jan 2025 08:59:59 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fh6m80gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:59:58 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50T8r43D034283; Wed, 29 Jan 2025 08:59:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpd9e2fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 08:59:57 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by CH0PR10MB7498.namprd10.prod.outlook.com (2603:10b6:610:18e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 08:59:55 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 08:59:55 +0000
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
X-Inumbo-ID: 6cf90dc2-de1f-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jnRnB4R71o9W8TbpaaT5QduCVy1nvEhpgN2aAj3f2ts=; b=
	hRP0TywA1RzQtk3yjfvD1Ir2kJEWsnnxYaaszWNMdTNe8EUVJ9/gsgjh+dINqgZm
	089lTwHdw58cZLf3NUqfhrnKKVmIh0PA71S40HOxbotDIdPXW/mcP4EavuNJhL6q
	XRtefDg/MlJH/iSjEfEObzk9YyymCg0C/HFfK1XCD2znkbCShSfmedAKeJARUcnh
	YbxAoroNiM85AFxo6TWcsy9tlDVvdkdf02KmQDblIAB1RI6WNfW3xWAQg9nF7Oy7
	cBhHWdDgw583eqyqeCrn8JF/YcB0J3rVlUPeGGr1knecufkU4NGSY/B+dV9eR0oO
	ZGdeo+ya5VgLOZG8hSSUtQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEYHeACutJEoHFfaJuW7PCVRNHhTmQEnt4AdIPnct+7SaspK1AkG54j7EinWn4ONlFSzkv6KATz2Schdj3/TySpMysEY9FVrQ7t9SWTopMfm45grf9FEJophzz9v84tP0brxM5CNrbW33PHHQ5PCaOQ7f5KNJnn3rj2ayKOkosBpa89rPfUtwQoB8BIPDphOd+M4WN3Th6Qx5e6CBhIdMck/LjWf/VNa/f/KDz6BJbe3uuOcljwsOpe5bEaorYOKHMnWVhJYSoDkfY+wWJuiKa2r/KHVHgvlKniHgNMTRey7dp0mVSS4/hOY1vz17XPCUWkZ43konwJk7ISU+3KdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnRnB4R71o9W8TbpaaT5QduCVy1nvEhpgN2aAj3f2ts=;
 b=Kkz0KQmvcdkU6cO7kRC6h4f5O1fXlNPC9d1/J2X/TKXXcB5EZ/OzLA6oFs6b2gCqvBfrabtw8FqZ/jc8aH7AKq5cISIiN2FrcZQcCyx8+aEHTH4MjPvUJPavPTIcmm5WyVfyOmW4YEYGEO0dGfGsGqETatccFQHHaHVyBPMYT9W3FGeOvYiGCDJ52kL1jhLPtY0nU1w7nMe/YUVXw9N1Fr+5iDIcbt6al6HWYqn5Ks8iQy0VldctR5XgtpJTb+/xkqjdIC4UPNKgjDi3Td2SepzTkIuyZNgHAPJNsusxUvyoL6F+P4fAgZRvcjKqj418Cu6XtbNwuZn+yStVFH8SBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnRnB4R71o9W8TbpaaT5QduCVy1nvEhpgN2aAj3f2ts=;
 b=K+h45fRXW2/u6lnaUIuiiOGTMQ00HA2sa6mnJoByq6sSfh2JPA5OsBj9XmmrDxyH8oOrwHM1HsXfNwr5TM2buBi02mJUKLcmAh2JkOYWOqhtuv7BtHZhcwN4DCiWMI3El7edZn0jbF6cMoSBREKS90x5x3ZElBMnQqzRlIhm2TE=
Message-ID: <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
Date: Wed, 29 Jan 2025 14:29:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "jgross@suse.com" <jgross@suse.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <2025012936-finalize-ducktail-c524@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|CH0PR10MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 817da161-9503-4313-975b-08dd40434ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QllEQkhLWDFod3pjaXhSNjFlQkErQXA2dDdVdGNSamlpK0hsa0xRUTBUNC9F?=
 =?utf-8?B?aEllUDB5YkxzQ0lMd1hGdUtKUU1DcmExU09qVGlXSHFpRlRhWmhwQW1Bano0?=
 =?utf-8?B?OWhNSWhEaHZ2ZjlKT29iQ016VmFOTE5rK1VGN2QvTy9IKzZlQ3FmNVo4Q2NH?=
 =?utf-8?B?YUd3aHRpSmEvQndOVmpSbkdDN2pTd0dIT1RlZTFMbEVrOWFMS1pIR3poZktX?=
 =?utf-8?B?c2lZRWxTUnRCQ1FNZDAvSlhrYUNqUlgrMFFEN1RrU1J3WUEwNnNrMURCMW96?=
 =?utf-8?B?LytqZG9RaVJpM29zajVHTUNDQ3U5MGtnOGtvS25weFF5dUJKcVAzK2RnMGxG?=
 =?utf-8?B?U1kwdGJDd1BiRHljQmdPSTIxZURVTkpKRDFHSlRvcmRMcW9OMUREZ2IyRy9m?=
 =?utf-8?B?THg3RU9kKzZmL29iZVdzQW1jUEhYYjArSThFc0hUcW1WOTMvdTU0eHNrRi9Y?=
 =?utf-8?B?TXNnQ0hDcitpK3NqMVFPdzYzWks0S3ZtZlU3YldYZTd4UWJYUVBiWWU5Ukhk?=
 =?utf-8?B?K1JObGkrbUVKaFB5bk5ZVUFoT2pPQXI5OXlMVWZXN3NWMlRZS3FPQ2UrbHA1?=
 =?utf-8?B?VkZhdnM2bi8yeUdqUHIzZUluZ2tqVVk0cHNUemMyTGxUQVlNbG13UmE3emxi?=
 =?utf-8?B?bTQxemUzZ29rK1JpaUgwbnlXZ3NCcllNamthWHVueS9uYTRyZEdYZXhqNmVt?=
 =?utf-8?B?cWFDd1pmS2l1T3pYYW1yMmFFOWgzeTRPTU13OVNHZ1pVUFZoT1ZWemcxclM1?=
 =?utf-8?B?VE5kREQyOFpZMFBwS2xwQm9NYi9LUUJmcktPK1M5UzJWZGlEZ0FvcTM5NjJs?=
 =?utf-8?B?clMrbm5xWXhwNmdlQVZhakVtRksvUlI5VE1BUzVDdzBwRWhWc3VYZFE1cG9P?=
 =?utf-8?B?aktnUSs5V0orbThyZHl4YXNUd0ZxVk5xcFdQVlJtR21USnp0VkVsblh6MjJn?=
 =?utf-8?B?OXpnZThBcDgwZkhMUVg0ZFl0ZFNaNnNPb216NFQrYUxkNTgraTFianRtcjBK?=
 =?utf-8?B?SWp0QmRieXZTcVN4RXRlSlU4aVdsMHpYVHZ2a1loZmtuaWtXTnFXYkpGTkMv?=
 =?utf-8?B?VDJLSjl4S2p1S05IbFZWL0M1NHJTRFA0OVB5L2ZXbG5ITjJIMUpEMGs3VDZG?=
 =?utf-8?B?RW9HL21Bc1FaNVlXcHZxd2hQMlVQSXcybnVNanU1NVlnaHVIcnZqcjdvSWdY?=
 =?utf-8?B?bmRKQlIwR0lFZUlweGJNcTNEVldoVWZxWUFGVFZ3UjcramViK2NzQ1B6M0Ey?=
 =?utf-8?B?Uk95NzFsR2trWS91VmdOakFKN3pwL3NKc0Z4bXR2WlljcW4zZEJsczR0ZHBh?=
 =?utf-8?B?OE9Gc3pSbE85cXowUDNWSUxwRXBheFpsNyt6bXNVaDA1Z1lFcVh5ZkZra3cw?=
 =?utf-8?B?UjVTK2UvOE41U3pqNk9HV2VFNGpMb0c2RzZHM3RGQzE4L0FIQmVpNUExSjU3?=
 =?utf-8?B?dVlWVmpPSmltRUFod3hQcTZCNWxYcWp6U0RQR3hmYWZyU0hnaHUzSkdmVEVZ?=
 =?utf-8?B?aWg2S0JVTWFTeTkzVG5IMUNuYkd2Z3ZuZDJQYzBCS0Ewa3pFalJOSlBTNWNY?=
 =?utf-8?B?L2tBYmY0OHp0UWlvdzF1NmVTNmlLNWpwOWlhbFg3VHRiUU0vbms3a3UzdU5v?=
 =?utf-8?B?TU4zM0tuV1IyajRBZ3NxekRGTElUZHFjS2FvQkpCNDRPZmFxeGk4R0VjVmx1?=
 =?utf-8?B?c0xCQUF6aDFGdW40ZTV6UHdLdTVoWCtiMnNoQytzSEIwYTEvS2FvWWVFaTBS?=
 =?utf-8?B?TTBHVnR2VnRZWjJ6NU9saFF2K0JoVzVpeHV6UWpoaDZVdE5tUHZOMDErcGc0?=
 =?utf-8?B?QXhKRjVqdUVOaFA5dkl4MWR4cHlSUGRCaGN1bVBhcWcwblBmUjRmWU5FSEU5?=
 =?utf-8?Q?bDBKnb6+sNdCy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZCt3ejRPRkpYc2h2TFd3enNLMkx6T1VGSzhqdndEalVUN1NQZWFRTGVVQXdM?=
 =?utf-8?B?b0Y0YjFzUXVMT3owL3BGZit2SDVYZmRNbmIxeHAvUFU5N05PMGtGMVVIRy9r?=
 =?utf-8?B?KzF5Uk13MWpsZWp3czJtZFdWZTlHbENKVEtrRW1KSWw5MUZrQmVYZ0xZSlRx?=
 =?utf-8?B?RHV3aXlSOGMzY0JzV3hXZVBCTzd5K2h1dmsvZkN6VjhkVnFJZ0M3cExla0Nu?=
 =?utf-8?B?S2JXRmFIaGh4S2pBQ0VRWXc5MUxQRmZpMjRUaFMwbXM0S2JscDlvei8rS1Mx?=
 =?utf-8?B?QkcyQ1BzVlZmczIyQVVFS3NNakdVZWtIQy92Q2dRNko1TDJRa25LTFZuSWw2?=
 =?utf-8?B?R3ltb0lLR2ZlcFhiQlh6dUo4ME1kZHBNSXFyVGtqNytaNXNILzQ4cnhJZE1L?=
 =?utf-8?B?NzRmempnUThtVGhyVzYvdmZnVmFQYk1CUFNqa21RTWJkd1lJTng5SXhVbjdC?=
 =?utf-8?B?WnNYRFVJcllPUzRSVlVxRXNTbUZQaU1YZ2Rmdkl6b0VraTJVM3RIamFtOXlX?=
 =?utf-8?B?WEZNbWxnWGpnQkRwVHpsa1dMKy9ZSGhucHdOTDFrYlVDMnN2MkZzSWtQd0hT?=
 =?utf-8?B?Sk1yU1BjUmpYVlZJaGhLaWZqdWI1ZEdPdkl0YlFSclZBM08yUEh1VThvUlI0?=
 =?utf-8?B?RldUTEgvNTJRNXRPQTk3L3BhUEpJSnZ4VzgxdCtkaWNiVzlTdnNCUEhLU0I5?=
 =?utf-8?B?VjgzYmlZVjRTQ2dzakRSUnlYbXRpMEdhT1dwM3N6WTdheVRCVVg4cUZjZFJx?=
 =?utf-8?B?NlNCSXJUcm5KK2RoYXArMzRhRHI4eXcyeVRYa0FIL05lSzlFV0VtRmlXMjV5?=
 =?utf-8?B?UlJTTVJwMGtwOUR1cFdYMDRoUTZQejlZVldSMUIrendxUzMyRDBZR3laUVRM?=
 =?utf-8?B?Vy9QV3VkZjZlUmNJOGtsdHoreWlpTHpsNEQ2QXRHSnZsR1NLTndvMUw3NGht?=
 =?utf-8?B?bHhKYUhycW12SW11TVJNVjN1aEhyek5hTlFiVC9sb0pUVUZnVlZoRFd3K012?=
 =?utf-8?B?aHdDWHYrek1kcDVtWjk4Qjd2cnVsVmFwTGpnK2VmZ1doSDJPRTM2TnFvNHdu?=
 =?utf-8?B?eStZQVNFVTlHWU1oSGJaZEJyNWhaMDUrcjBsb0dEWDUrdGo0Z3QvbzZyMWZQ?=
 =?utf-8?B?dm9NbW94emlCeE9TR1drY2RMZDUxcUVvNXFNUmU3NTN5L0x3N2cwNmtudU05?=
 =?utf-8?B?R2Q3YiszWlo5SzNaSkpwOXpNRGQ0bXJuZm1BbVdQNXFmSDBOaWtGbEJPSTFU?=
 =?utf-8?B?enNLc3I0Z3JKaGZxdExuM3diOG1waVdpeXc3elNmQ2I2Nnl4bFN1S3FkMFhk?=
 =?utf-8?B?QWp3OW1EMWlVUFQ1TFE0bkY2TCtDK2ZhSlRtbitIWkVCT2xUUUs3TG9uNTkv?=
 =?utf-8?B?eUpHeG01ekp4WFY1bHkrT2duVnlpMmNicTlVTkNZUU44TkoxVGtaVCtUWjJ4?=
 =?utf-8?B?anhwTDNzUlA2ZHhYMUR6SXNUSTErdHNtcnpEUlZFbndQN3pxU2ZDL2NBL2Zx?=
 =?utf-8?B?cXliK3hlK1Y2Ymo5S0tqTkl6L2FzeFlJOW01V2hjdEVUK1VRdHRVdFVsUHha?=
 =?utf-8?B?amlqay9MWVc2VDZUa3lzT3cvV3IwQmphR1hKell3UTIxUERsS3hybDJtVHAw?=
 =?utf-8?B?TUFFMXdBbjBXQWo5VXVVbmE3VW1YZUFJTFprdGhHeXdoUjdNVE9MNExBUm1L?=
 =?utf-8?B?ZFp0Tk9hb0lWeEFPK0YvVW84UzN2YlVMOWlkQ1dQNnQrRHpqOVZEeHhWMzA2?=
 =?utf-8?B?YkNETXVJbC8rRk1CTVRaV1grR2pZOUQzaTdQYzhnaEhKa21Ienh6T08vTW1n?=
 =?utf-8?B?ZW13clpKeFdjcE5rZTB0UXdCUGgzZjV6bm5mOHRXeHQxQ2JLaWtUQkMyL2h0?=
 =?utf-8?B?VmlpckNkK0VtcG9MUjczOHl6WjNweFdxeStmVUxkMmx2UmJuaHd5R3hkd0tP?=
 =?utf-8?B?NytvcnFkd3UwcStleXNySmc2LzhHckVtbWFmRFQ3aEQydU51a1lLWVk1bzJm?=
 =?utf-8?B?Z2hvN0FqcEQ3Sk1WSW1jU3REUXFDcmhQQUMyLyt6UUNWNkdqOUk5UG5OZ0lT?=
 =?utf-8?B?bkNtVzFqbXF5NE5VZ3hzSFB6UUZYSWJiekVuMzIrM2xMeWs2dE52N3hXVlNF?=
 =?utf-8?B?RlhLRG82NmMvVURQRlJvTklJL2Z2bUo2bkp3STJOV3dMZFlZczc4ckpaUkNK?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KA+dSQXAQyxYyoDoBNNxGpkCrDuBnJZIX6pI9pU3m2auX9mW+09YRllnGWY2Ow8Fw76koPz9/sMjWzfOhXLk5ObDiVK4nHwxfks11/NQst+/rBnyCinEvab/9T1Ox4vzE/2vcQONFQh+GMda+Z9qSz44GP6LCAQt8nKop0gPo5WUlRlZzIa72cXBpww+yJouIAY1O8M+PsIGX3Yx8M76Nbh3GOVIlP6ORXfdyHwJ8n0Kqk3e3mClhUo/emHL5Mtxuk45wYtAQ0Ozdsx7aZ2CEFEGR5rkE5z8U7oWq2d2R1zbzRCUmKb5VApWWF2YJySWsPjz2KmaiQXItrDvgkzbjJtls+KOAcazfqqz62S4/+9P/Uup0FNk8tCd0Nb6l/Vhj6AIXZpb26OXtroThAio8DYRhBgQsmsUAe1F6dJOUlzmx924uJ5v65SVUgBcZehfUgyXF44l+nM6P0RC4Gl/oVWZnY1y9mn9wyckyi02ycSKD2IWNIIkIi8/IyYvU7qAeQEOB0v4mqLNj6H78+x7BpkyOoitaBmgSm73PMbC24dDbJQDOwaLDOlIWEelN9AzoQgz18wPTNJnA1OgU2p4Qq9j/TIs24A9+5L1Lbdga3k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 817da161-9503-4313-975b-08dd40434ce2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 08:59:55.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmIFBnpbShBjVR0qknsiF0v7MqaeQ1XrC5omCr9eggKYr8VmsHgcMDFYfQLssYKEO/ryCrfYrWVexOwXeVIu+LwtGlkuA15nc2rBkR16ePQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290072
X-Proofpoint-ORIG-GUID: CIwwMTlWXn8W7HnFMh8B7XgaIad0a2G-
X-Proofpoint-GUID: CIwwMTlWXn8W7HnFMh8B7XgaIad0a2G-

Hi Greg,

On 29/01/25 2:18 PM, Greg KH wrote:
> On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
>> Hi there,
>>
>> On 29/01/25 2:05 PM, Greg KH wrote:
>>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
>>>> Hi All,
>>>>
>>>> +stable
>>>>
>>>> There seems to be some formatting issues in my log output. I have
>>>> attached it as a file.
>>> Confused, what are you wanting us to do here in the stable tree?
>>>
>>> thanks,
>>>
>>> greg k-h
>> Since, this is reproducible on 5.4.y I have added stable. The culprit
>> commit which upon getting reverted fixes this issue is also present in
>> 5.4.y stable.
> What culprit commit?  I see no information here :(
>
> Remember, top-posting is evil...

My apologies,

The stable tag v5.4.289 seems to fail to boot with the following prompt in an infinite loop:
[   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion 3273 sge_count (-12) is out of range. Range is:  0-256

Reverting the following patch seems to fix the issue:

stable-5.4      : v5.4.285             - 5df29a445f3a xen/swiotlb: add
alignment check for dma buffers

I tried changing swiotlb grub command line arguments but that didn't
seem to help much unfortunately and the error was seen again.

Thanks & Regards,
Harshvardhan


