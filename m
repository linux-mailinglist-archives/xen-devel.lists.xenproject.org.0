Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D481A2242B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 19:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879280.1289499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdD5n-0007rk-0t; Wed, 29 Jan 2025 18:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879280.1289499; Wed, 29 Jan 2025 18:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdD5m-0007pH-Th; Wed, 29 Jan 2025 18:47:14 +0000
Received: by outflank-mailman (input) for mailman id 879280;
 Wed, 29 Jan 2025 18:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1tdD5k-0007oi-Pn
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 18:47:12 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7217e110-de71-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 19:47:10 +0100 (CET)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TIBnvs020264;
 Wed, 29 Jan 2025 18:47:06 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fsd50294-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 18:47:05 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50TIW8s5035807; Wed, 29 Jan 2025 18:47:05 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpdg62jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 18:47:05 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by CY8PR10MB6441.namprd10.prod.outlook.com (2603:10b6:930:63::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 18:47:03 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 18:47:03 +0000
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
X-Inumbo-ID: 7217e110-de71-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fXihcpqS+x95zAr1jBDbDMai1Oe69FEkg4pc+6YQS9k=; b=
	WcQ1osbDZmzV8M7xHnLirHxVdS741qNzT0CwH3wkiJlRaikKZuHbACvnKPW+7PbR
	kKgGkN2SVUnWX/cwQf21PUrurUPaLeKkjJaIZ02A6ReGGjRzt8tt1pm9oaSrUr2L
	gW+ODEcMYu65/MK3gANCrBF5/i9G9iq8FPucGGJ8nRC0yVV0o5VFj/W5+cy7y9VP
	HG/9T4ggnn0Iv0xIReV/LQtwMrTjCk22MJkDWIciG4zGp+ee2INGcXq4aodXFPkO
	1KnB4HG/DZunUZzO55bkObWfnfZUkAEubbnLq33DVC+FIhod9t5Y5TLfDC3u4V+O
	mIndhecrbG2E2XGmCVtjOQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/CfoE8zxXowtKYgUUVbn9dbtE6eqrbkHBvxmfU5VfDzVWiCbk/qis71MP1Npe8Nba56Wg55YUaLqV4GGSFa3RZLboCqRzi5FPYbuCCB3EH0wdxo6M4YZ634V+6xPTIw8D5f5dwm/btju1/g2PSMBBl94Bh/r4celdgF6DF/tmVcwbnQ+eGkR1NP0XkYUWlf+uxKohGrY2bd1aH+pmQt6RljnSlzft1zI/wS+m+Bg4iTL6FM8wzA2/7MoTlAOJ0ORdckTtBVz7m+B5UHpZtCcvLqZ8gHIINDlyxon8xrywn7htSFHVN9TVfHLZ2p8NT3fhq3zn6CZe/LhzgPlqwdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXihcpqS+x95zAr1jBDbDMai1Oe69FEkg4pc+6YQS9k=;
 b=v+rGPbsK1aZABIpGjbyIKDgKEoJsTe2o2STiF3/sByl1st2ee3qjGRqqibWWijA5fMOINFajpacLVjlm9fwbendno+NbsIZX2faar4DpZtbQATaz6L6h+h4xZyPL86sZv21hUY9Iqqo0eCZCUvKBMT6Fhhp3eNAhyrgZc5sAhoFSTcBI9HvGjiiyLSLVNEN8ghF0FfUXRdrRF6cX/5fZHSwqQ+1TqQi0jQafTLfJDfdGrjmkm9LLmCuQEEoEnzbE1j0wf2lQs4tfucoWLfWbjUMscER2UVzwR+GGWOb8QPybhtlyhyWcPE0367PAxG57QG2kehB/xXEOWwZ2/pA9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXihcpqS+x95zAr1jBDbDMai1Oe69FEkg4pc+6YQS9k=;
 b=OOBmonYVpUPCn6HEJfDe+hKK/YUglpXkga35h68fi/MQmhqmuXzKGNNdPSRn2pWmDxt/9w7sw3qBo4Mxps5f9awc1USPmUHza/WkSqikb+6+OtVefrTCY8Fseg8toSjGs6AX2Re2mLCeKirvPV+evkMwR3PKLjR2AFOUeed2/70=
Message-ID: <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
Date: Thu, 30 Jan 2025 00:16:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|CY8PR10MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c6b9c9-7ff1-4705-046c-08dd40955218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFFzRExrT1k1SlF0RGcvZDhKcnFZQTJDcU1DQnV4Wmp6R3M3M2NsMitBTTZG?=
 =?utf-8?B?SXVhVTRWdmtPWE92ajNwWDNRelRuTW5Oc21xOXk3YXhBREhyOURueHNHaHJs?=
 =?utf-8?B?THdSeE8xdUFwdjZuS2VBQ2dZVFVSalQvYUN4bG52QW9Sb3pwSmgvQkltMWdT?=
 =?utf-8?B?N0lvWnRMSnJnN0V1ZXdYM080RzBxZFppZjVMWU95V3VxYmppVlpSY0YrcTZD?=
 =?utf-8?B?dWVYbmI5ZmpHN1FEaWprcC9tZTVaWTNlQXhMVEFmekQ5b3JjWmJNZGtOZ2lp?=
 =?utf-8?B?SGVMTk53K1RWZm1YMUQ0U05NK3FNVm9KaG9GaE1aMFFybXNFNnVnK05RRVpj?=
 =?utf-8?B?MXFUbFcwdXFZK09SSWQyWUIvRnJ6eVdrYVUwRzJISkxQOXZFaVVRc0VVUk9j?=
 =?utf-8?B?ZGU3MHQrYUdWeG9DaGlRV3UzWTNTYTlvWDZLdVRpMkpvS0R1dlpJakFCVTZD?=
 =?utf-8?B?eHdXbXphZVlzVEd5M0ZteHJEbTRadnd6bXdFVllmYzRnSjV5bUdzY05qYVlu?=
 =?utf-8?B?SFNuRzJNenpZNXNxcHJkUURSeEt1bHR4Vld1LzlRSWRlNU1Vd1pUNm5LL0l3?=
 =?utf-8?B?NWlkdk10WkhvUjdpVmVwNFV1aUJ1VjFZZFFEcFZ1ajZsNkd1RHA3TFRCcGg1?=
 =?utf-8?B?cGp5bEM1VWVlYTlsWWwwUjUzYWp1RjcyNHlhNzRlQXNHVUc3eitlS2xFL3ZE?=
 =?utf-8?B?MDl0L1pZZGRxTWdRM09LL0FsY21OOVZiSk9rQTdpd2UrcDJmL3ZTUnd6Umcz?=
 =?utf-8?B?Z09XR2R6RFNZaVhZTFdlcGZzM2JRMzZ0TVJBdC91UmhBWmorbzhuaVRtemR0?=
 =?utf-8?B?Y3NjQTVrZVhKcmpUMzBnV0VwYTlnNWZnblMySWcrN2QrUHdEUW91ZnRHSXg3?=
 =?utf-8?B?Qm96RDhIUDFNMy9aNFFzSzBLdVZNTzhsOUVlQld2Qkg5Y3ZnN3Aya3kvcGVr?=
 =?utf-8?B?T0ZrWHYva0xPU0RKSEQ5azBwNVBhMytnekJhQUdYeHVqWTM3M01Ja0szVnk1?=
 =?utf-8?B?OG5waERDQlpQZDNsVEVVdUxVTVZKdUkxcmhPdDN4cG15TzZVRVhwQmQ5cEhT?=
 =?utf-8?B?aVd2NTFMMHBWUmJOVWpoVGJqbzB4R1NCQnlQd2sxNVlXc214N09NZWNRcGli?=
 =?utf-8?B?REh2UHJPQ3MxZWpDYzRIc0VjT2ZIUlRqa0VTM1NCbDBvMTVLK3ZGeVJocC83?=
 =?utf-8?B?YS92cFkzbjVtUmJwU2IxcnVncmtVZUc3V1B2b3p0WHJBdGlxTU1oVHUrcmJt?=
 =?utf-8?B?SEloQ0JjM0kxcHNkdzlUS2dWYnJYL0tqMXp1RER0Q0JQNFFZbDR5QVdGd2JL?=
 =?utf-8?B?L1Mzc1ZqMVc4LzBmQ2t6NWRZcmQ1cnIvM3lPZWV0b3Z6c1c4SDdNRzRmam5t?=
 =?utf-8?B?RHdFMGVidzEvaWhqbWl4M1YxbE1JbmZuOTNGNlI3S05qazFlNnRIOGNManZS?=
 =?utf-8?B?VzhOYWN2eWJmeU02WE5TcTV2UmY3cExJRmgvOUVSR0JJK05pT2tGcmlDejMy?=
 =?utf-8?B?b1hjaXFSSGRHSXMvQnpGSjdMeUpvenZHNzgxUVRrWjVCalpqMVR1STBTMVJ6?=
 =?utf-8?B?UlJHUmlOUUdCT1RtUlJLQ2s1cytNdSthRXFNTVNUNXg4Tk5WWXBROGFZbm1w?=
 =?utf-8?B?TFhxcm9CSUY1L0J4L0NxeTluY0I3Ym9HMGFRdzNLTnI3Q2VUU2RJQXIxSDZz?=
 =?utf-8?B?K2ZqUmhFaXJ1STVWd1I3R2tTUE5aOGpDb0hESDdlRWFKa21ISHJCWU51OXE0?=
 =?utf-8?B?YzFtd0ROeUtUOWZGNkFoMnlYdG92TkpxdUIxV1FkN3R6YlBvNTg1Mjg0TEU0?=
 =?utf-8?B?bkdHR1EwL3JNQmFyVFJidHFPaWtUSThPK0VMRmJLVEtlQmk4NldnbEJvNENa?=
 =?utf-8?Q?JJz1QohbKhRXm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXRrRkNQSGM5VVBmU0pXQzNqQlZsdXYyRVFwZU1ETHVRdU5iekV1Y3R6MHVF?=
 =?utf-8?B?VU5MbklCR1dGZDRka3RkWC9LNXpvRHV0TlVEN2NaODl3ampidVp5YU5hdmRo?=
 =?utf-8?B?eE9QeUIyZFlabjFMUnREeFFVcVZ6WXNTbDNQakxJZmtkNnNLa1J4OWQzb1h4?=
 =?utf-8?B?L2g3SklnVlV1dkloVVBtTDhKZHdmRTlmMk9VOHpsS21RYjgvdk03V3BJNTl2?=
 =?utf-8?B?cmxNZmpQQXg5UWZVOUhHcmZROGFJRnQ2aGdaU3pSdmlibm1rY1F6QlBMM25R?=
 =?utf-8?B?Y2pwRDh2OGhSRzg0dS9remp6Q2ZEM0pnTWJlb2Vub2NCUDJYRjJ2VjhmZlF2?=
 =?utf-8?B?ZHV2dUlyNmxwek8zVnJIcGMyL1loWmpvL1ZpYU1kZHNsekxLSWFUNC9WZDk0?=
 =?utf-8?B?bHBMK2oxdEZzb1dHWi9oVncvcngzSGlMbkJmTVErZzdEN0oyUVc4TElBcnBC?=
 =?utf-8?B?emJRTHM3WUJzajJqNGQ0OHJzbjhOK3Z6TnNvaVkrMUM1U093WXFLMXNvQUsx?=
 =?utf-8?B?MTl6YjBqT3dsNGQwWXZ0eTdqU3FoQjhRdllGMFBsd3RRYWo4cGtxeWlJNDRP?=
 =?utf-8?B?ZVI1cjRGeStaejhzRnE2ejJtcFJ0d202TTN0UkFSS3ZnWjY4OExQS2FoMGxV?=
 =?utf-8?B?TDJ5MGRlVlg2U0tDVzFlZFAwdnBTZm16RUpURDlQblZ0ZjFRUVhmZ2ppZWdC?=
 =?utf-8?B?MXJzQnBMQUlhUGtpUzFnSko1Vjk2R3piSmNVZXQzQUEwcHFtNkNFOVUycFFY?=
 =?utf-8?B?cTMzdHpUcFZPMTFvM1Q0SU42bE40blpiTDc1T043V3BIaThNSit4Q05jNDMy?=
 =?utf-8?B?YzBpdzNMZHlIZHYwMDkxVkVBZHVOc3RmaHJKUGE0QlppU0dvTWZiQ3ZsM25J?=
 =?utf-8?B?RWZLdUp1VCtQVUdXUGtkNldxT1hocDhWbGNIOXhwb0RMc1ZNMjd1cGsrY0dY?=
 =?utf-8?B?M2tjeGRLanRSODdJenlXODJzd1VtUGZRS2Vxci9LR2dETkd4L1RXTUQ2d3d1?=
 =?utf-8?B?bEFzVjRhQ210Q1diYmpReTJzb0dnSmJrcXc2RE5iKzVrZUlpdmhHdWJWajFZ?=
 =?utf-8?B?VWcxL1hUc2k5WEs4ZW9LSzBXMVFva1A0QjZwWFpOVlBPOXlrRWVuQ1AwdlRV?=
 =?utf-8?B?SEErN0VIbHZmT0QvUG9oYWNSWEQxWFh6a2hBeW1SSFYvZnFDLzlJVkprLzc1?=
 =?utf-8?B?Mkp6bFQydTR1N2xvVDFoYWJnV21WNnhaeWFkTkg0QU9PTGRTdC9SQzhwS0ZY?=
 =?utf-8?B?MXRUZ3Brdk5mVnN1cEJPd3RPMllzUi95UGZOWFBMWkdlb1F1M1c1UUNJWXVF?=
 =?utf-8?B?Y054QURtOXIrUDJIaDRTTjU3aEo1Q1U3dDNjcHhXcGw0TmF6bTdGaThlZ0tu?=
 =?utf-8?B?dGhhTWNIL1pYMFFZR21tSjlQNkhyNGY2UnoyV1lWV1ZvbmRLTFBKUVhkVmE0?=
 =?utf-8?B?S0xUYlY5bURNdzhGeEdUMHdoL1FkcW1Zb0I2bnJHeE5SZlFjM3BKR3BwQ3BB?=
 =?utf-8?B?RXRQTTZQV0k1TndYUTk4VEVJMWxZd2pKVWxqK0RPV09GeVp1WmZSNUorejZu?=
 =?utf-8?B?bU1TTDZTSmtOVGtGMWN1R2RtZnNnMXFFcThWaVliNzZ1SFBqd3F5dmlaSG8v?=
 =?utf-8?B?b3RuWW8rM2dtRzVmUDZZUFFaZWthbTN3L0x2d3lzSVNCdmJtSzVaOFZNMFdZ?=
 =?utf-8?B?U2d0SGdzTGhHV2p0UXZWRjV2dWRtN1FFb3NYb3Awci9aUVhyNHBwZlhieEZa?=
 =?utf-8?B?YkNsSk92RmJ1RHJ4T3RjTk5PSDZNVGtEdzlBakdGU1dHUWFPcWR5bm92Q2tx?=
 =?utf-8?B?dWZ5U3hYVFRobmtYUzdSNUhHeTVTNFZTVlE5QnpCRnV1NmlGanR5R1BEUWxs?=
 =?utf-8?B?WGduUm1jaUEzcTJ2eXRVWmNaWDlOZm9WNXRML2V2QkwxMjJCNktsMjVqZURi?=
 =?utf-8?B?SExJV0NRcnpoOWk5amRldEFLUzQ0UHlOK3pZellvQnFvL3hIWHN6VHo0NGl4?=
 =?utf-8?B?NHdBZk5hN0RYb2s0cUpsenNubm5tWSsrUUJhaCt1QnlFQm1SWE5zbVo5ZWJW?=
 =?utf-8?B?M1hEYjVLazgxaXNlcDVySUNWV2d1NG5mVEZSdWJ5T3JOVndXR1NvUkpCRjFY?=
 =?utf-8?B?L1FyaklFNWZpeDlMQjRSNlF0bjIxN25Db0loQzJnVE04eGpmbUVjZllTdlpn?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hmejXcWhuZO3KUlqgsvk5LlcR6Fco5U4uu1fw1qI1n702AcimWmhShaQXepCaOtg68H+Ah8D4lgqxXniWxU1L5kjO55tr0Ang28GeKRxYFeRn/PjYLfYbMo49e/MQpjx43PM3AKbQfs8sRK+5pRryT/Z/Q5NGqxRTsvUV4f2mkYRpPHNTkd4RhbCqyFFOAYeOxYFwKvO+kvFjroaSPKxlrSD9xg0opWggcK/s54VO+etUPI870WtvzaaVALiuVYugPebx1Ro8dFMd+nFw3ni6UtA5aMpZ7BFSnjDU/ss2UoQMlQuQDWD0TimIIhNERWXSQstS7XRucRY3pYWzJJn6RmH0Lclmu5rnhI6E/AybmwAEK1swKra/P+FjQJ6uJMUW0OMFSxmE6EBVmrj0/kC6viYZYh2c9MLXq7rLsezrPCQ6ZgnEmPHLdRGceG7E0DRl7w+i4yqAFbeebGngKnd2/5ubEDtvIV2v8HJ2QIHSZmYqj3U6BnzThLL8TcO3+VzaiGkygqFEtY1Vbp9MUH7sibsfdBtZxbuY4EXaFyGA9ulR117fPoAojXShoUHmVNuzH7YSsu1iFMxbjywMTpOXBrVTeedYGmGM1k/hDe0ZLw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c6b9c9-7ff1-4705-046c-08dd40955218
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:47:03.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEdWw/XFC1C6dInRQPBRdmM+g4w/lPj8FVj0iVoYExkQ6hp0yvCbFd+nH2AY4T3rXX3RxmimB/CwNNPjwn86yoZ28X/aSqrmjtSb5cPzVmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290146
X-Proofpoint-GUID: S9x-jyZuWRyTvBuzcp4L6aNDSp2xGnaa
X-Proofpoint-ORIG-GUID: S9x-jyZuWRyTvBuzcp4L6aNDSp2xGnaa


On 30/01/25 12:13 AM, Jürgen Groß wrote:
> On 29.01.25 19:35, Harshvardhan Jha wrote:
>>
>> On 29/01/25 4:52 PM, Juergen Gross wrote:
>>> On 29.01.25 10:15, Harshvardhan Jha wrote:
>>>>
>>>> On 29/01/25 2:34 PM, Greg KH wrote:
>>>>> On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
>>>>>> Hi Greg,
>>>>>>
>>>>>> On 29/01/25 2:18 PM, Greg KH wrote:
>>>>>>> On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
>>>>>>>> Hi there,
>>>>>>>>
>>>>>>>> On 29/01/25 2:05 PM, Greg KH wrote:
>>>>>>>>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
>>>>>>>>>> Hi All,
>>>>>>>>>>
>>>>>>>>>> +stable
>>>>>>>>>>
>>>>>>>>>> There seems to be some formatting issues in my log output. I
>>>>>>>>>> have
>>>>>>>>>> attached it as a file.
>>>>>>>>> Confused, what are you wanting us to do here in the stable tree?
>>>>>>>>>
>>>>>>>>> thanks,
>>>>>>>>>
>>>>>>>>> greg k-h
>>>>>>>> Since, this is reproducible on 5.4.y I have added stable. The
>>>>>>>> culprit
>>>>>>>> commit which upon getting reverted fixes this issue is also
>>>>>>>> present in
>>>>>>>> 5.4.y stable.
>>>>>>> What culprit commit?  I see no information here :(
>>>>>>>
>>>>>>> Remember, top-posting is evil...
>>>>>> My apologies,
>>>>>>
>>>>>> The stable tag v5.4.289 seems to fail to boot with the following
>>>>>> prompt in an infinite loop:
>>>>>> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion
>>>>>> 3273 sge_count (-12) is out of range. Range is:  0-256
>>>>>>
>>>>>> Reverting the following patch seems to fix the issue:
>>>>>>
>>>>>> stable-5.4      : v5.4.285             - 5df29a445f3a
>>>>>> xen/swiotlb: add
>>>>>> alignment check for dma buffers
>>>>>>
>>>>>> I tried changing swiotlb grub command line arguments but that didn't
>>>>>> seem to help much unfortunately and the error was seen again.
>>>>>>
>>>>> Ok, can you submit this revert with the information about why it
>>>>> should
>>>>> not be included in the 5.4.y tree and cc: everyone involved and
>>>>> then we
>>>>> will be glad to queue it up.
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>>
>>>> This might be reproducible on other stable trees and mainline as
>>>> well so
>>>> we will get it fixed there and I will submit the necessary fix to
>>>> stable
>>>> when everything is sorted out on mainline.
>>>
>>> Right. Just reverting my patch will trade one error with another one
>>> (the
>>> one which triggered me to write the patch).
>>>
>>> There are two possible ways to fix the issue:
>>>
>>> - allow larger DMA buffers in xen/swiotlb (today 2MB are the max.
>>> supported
>>>    size, the megaraid_sas driver seems to effectively request 4MB)
>>
>> This seems relatively simpler to implement but I'm not sure whether it's
>> the most optimal approach
>
> Just making the static array larger used to hold the frame numbers for
> the
> buffer seems to be a waste of memory for most configurations.
Yep definitely not required in most cases.
>
> I'm thinking of an allocated array using the max needed size (replace a
> former buffer with a larger one if needed).

This seems like the right way to go.

Harshvardhan

>
>
> Juergen
>
> Juergen

