Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B9A7D9D7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939548.1339600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iwN-00053C-Rf; Mon, 07 Apr 2025 09:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939548.1339600; Mon, 07 Apr 2025 09:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iwN-00051G-OX; Mon, 07 Apr 2025 09:38:51 +0000
Received: by outflank-mailman (input) for mailman id 939548;
 Mon, 07 Apr 2025 09:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qNmM=WZ=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1u1iwL-000519-Rx
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:38:50 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19e55185-1394-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 11:38:47 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376Y3rD016179;
 Mon, 7 Apr 2025 09:38:38 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvd9t4be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Apr 2025 09:38:37 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5377gdsv023922; Mon, 7 Apr 2025 09:38:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 45ttydsqkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Apr 2025 09:38:36 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by MN0PR10MB5936.namprd10.prod.outlook.com (2603:10b6:208:3cc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 09:38:17 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%3]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 09:38:17 +0000
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
X-Inumbo-ID: 19e55185-1394-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ROqJt25uy7G7u2NwS3K5Tkw7vBPeoAYcu0N3IcZpfGA=; b=
	BRtU8MvDOmx1MHYDD0I45dJZ+AMmng0cKZrfo++sz+6gGVgV8HoVUTkee/iBf1Mk
	zwzAyXXtOKPuIhpgPyKw705T5SA9HuUeYmWUCJePxBWJD1++mSyH8CY3sUZPN1Ao
	HvPG2emPCcKkQnoA99B5lQC/7e57dJTZs7w2oojREIijNwq+zKMioX2Ng2qS16VZ
	SM09bP3n3Dj70VWbysyRURgjVVCE66ktCQlnpIEQrPdbR8jfpG8lHvXF6+w2Vowh
	rmpvGX08d/1kZRovKcONR2Fi6l1TdmDkBUgwT3vnKKIN3hK/q+mxie+nKhPhxr2l
	1Qu9ez+J/bWeYDHXGW3iog==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBqlEWKAzuQtIGOjgslwv/U4dQmuOSlL2+eiN9XuHrw3XCKBJpkHZAdVcr5xwqyFWeCSp9daiumrnWgiu7L58bavGp8soN5OuB7QxnjtGI7fxOyHV+vsluEJz9Nrjwy4+RwPcN/O/my7Igo3qhF946J19HltxwYl6ohEa67GzXdxBNaNWOmVHBwT7s8VCoe1e60RCKHinmtnrcnGJ0Xk+Vj9B/D06U2WE8mHZtjH7+8ZphtkzgK+MRWW4FAoBDOPpGUARF4heCCjr+xCjNpe6pgvioGO2RCYx8eGQ0vAQHap6KPJx1vfTxtcDSlMQOBYQXo5J/eDv9Gv/mwXTZLBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROqJt25uy7G7u2NwS3K5Tkw7vBPeoAYcu0N3IcZpfGA=;
 b=hrQlfn2Q8HU1uLmJseUM2yygtagUsPQfCzHBCzMsUq+E7IEnpyJ3TWAfyqFYVQQ+gJMiylYcosUgJ/txj8PxmjI3M9H97sMpsrraB7S5A/xosDr9VUn1CVkEoMSWny9BKEUxtdgYIL+/5ahwWVXfh8yJEDDjSAP+uuiXAVO8m0WLV+J2qE21y6Q1ZAbAguV3J0Zw8TE8+5kOUSuebxUsHt9Nw2Hf6B84baVPS7MkPUs6yf9Y6OnrlUnlFdkggxkCBkGPUGYYrPBgRpNxozzDcb1G14rI3zVb32QhCzlpVwWhHvrZIC6zOUuY6FopR8wfspLpxzwlkGg+S6uyt1S90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROqJt25uy7G7u2NwS3K5Tkw7vBPeoAYcu0N3IcZpfGA=;
 b=LvRd3hyHjWXjSsXZ4EG2cvdbhJL3HfYhSSgIBRoOAva6bn4tSBo1ldIJAGJRcwj2wJv0jrbyEpO8h+ImIbYUPSdwuEWFfSv+s0UfhMLD6jQvPhh4+zJg1MrmSAJlb/dhX+vtRv0Cgmfbw555bkUph1wjYk/8gdOliTKNHcoI11w=
Message-ID: <8b5686d3-cba2-4f2b-897f-daa0ec68b69d@oracle.com>
Date: Mon, 7 Apr 2025 15:08:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15.y 1/1] xen/swiotlb: relax alignment requirements
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com,
        xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
References: <20250407070235.121187-1-harshvardhan.j.jha@oracle.com>
 <20250407070235.121187-2-harshvardhan.j.jha@oracle.com>
 <2025040751-oversleep-sevenfold-b429@gregkh>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <2025040751-oversleep-sevenfold-b429@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|MN0PR10MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: a80a4b30-31da-45f5-9156-08dd75b7ecc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clVMNzBCUzV6TWJwOFdwYS9tb2VVTWplV3FvTnZ0dzhzcy84MmR3SnpaWFVo?=
 =?utf-8?B?MEMxNnJKT2JVN214ZUw1U1pwVmFXeXc1c2YweEJGVWg3bkt0MC9NMkZtZUJr?=
 =?utf-8?B?cHBTRStZYUtSRWVISG5ZR2dNNnF2UUswMGQ2eEVJdDdqZHdSeFVGRnVkSHhn?=
 =?utf-8?B?UXhTbGRLRzFPSWJOcDhHeGZjcHdKN203MFBqbUVva2h5ZVA0TFJiKy9FNkZC?=
 =?utf-8?B?N2xGbGlGT1dWM2pRdTlkbDgwSDdJYlNWcUU3NFRqTkxIbnhvWE45QUNDUjhn?=
 =?utf-8?B?ZW5ET2pEWElOSmsxTXh5WkxNSmlhTXE4bVVoOWlTb0JZdCtaTTNvcHBjTkp0?=
 =?utf-8?B?SUsvNmpvaTZYczM3bklqSC9BR3YyT1BhOGJXeW0xM3ZLTDk3M1FJSldkSUtq?=
 =?utf-8?B?ZXpBd3FTdmhub0dobGhzSW9IT3VVd3FVZjhtbE90WEVJQnlYV1RHbTdlTDNH?=
 =?utf-8?B?cFkyNkk0M2IzbjdlMUlvTTQxb3hTeG53MXQxbTVEU2lYZTdqVytWZUJhN084?=
 =?utf-8?B?TkVOSW5yTW1LRC8xMmhlUU9PbXo2Q0FhRXhMejl6cEQxWURLMGJDTm5mbTVF?=
 =?utf-8?B?dVFHMDNuVHQ1aEgyemhaOUx5L1M0VkR5YjJyV3RvNXoyamNBVDVDREhWa2Nq?=
 =?utf-8?B?S2s0QlVZSFd6cHVaeDl4WjhTN3gzVmJsWEg0SzBmamMwRHV3bE8zQzFaUDcx?=
 =?utf-8?B?WktDNDk0eE14amJIS284ZS9MM1pQMUppMkV4VEpVSW84L3VKL1VkT2luTko1?=
 =?utf-8?B?N084alpCdm1abWRKemc2T0VFbk9ocEhSS1JDSFBBUnZiamk2eEczVEx3RkRn?=
 =?utf-8?B?TDJ5eDFlL0xDNWwrbzhMaXRjQmVmRHVuaENIMW9TVjBaRjhWLzZrcFlxcW4w?=
 =?utf-8?B?ekVwUDR6b0RtT1poaURqcHh6UFc1THl5Rjdmb0haR3B1cDAxd2dHeWsra0U5?=
 =?utf-8?B?T2NWUFMrQ0FtakFnL2V4YkxVVjBEU1ZidzlWOG04NG5CblV2UzdlUEV6MkVZ?=
 =?utf-8?B?RFhCQWxUVlh4OWhBVEVtQlpSL1ViUHk1TWh6a0J5QjV0TVlBRG43ei9lVit0?=
 =?utf-8?B?Mmt3bDc4MGxCR0k5SDJuaFd3a2JjOTE4WU9aUkdRUkltWXZxT2VBTXdJU1FC?=
 =?utf-8?B?N3p3bzV3L3dBUFVhNUsvQU1PUXRVa1VPSTZ0VnNKQlNTY2o5SVM5MmZNVVZt?=
 =?utf-8?B?eFVDQWdidFJWUlRuTkV1b3REMGdLYUlTQnNRV21uRWVONWY0dE1sUmtVVjB1?=
 =?utf-8?B?dlZJUUY4bTZmWk1DWEN6NWxaSTBwU2FDZGJtUDV4N0g3ZGh0aVBKbkJBT3NS?=
 =?utf-8?B?cmZtSkhhWU5ra2YzVE9kRmFRUHZQd2hnNkYwVVdLTXBKMmMrM3NmeXdGRzFK?=
 =?utf-8?B?bnZ6S3ZXemkxdk85em5wZFZILzcyVUhBUE4vekFBTjUyOTR5eTM5Y3RlRldj?=
 =?utf-8?B?ZXNMZTlsR0s2RUtiMU5vKzdWL1MxMXZKM1YzTlJmOUtIb3pPSHhHL25vUTg4?=
 =?utf-8?B?TEhDSFVSR2VJb014eUZGZW5FK1RNRHY0dDdBTVA2Znk4SytjT01rUlVMbVc0?=
 =?utf-8?B?amZ1U1hiUElyVkcwaDF0MEhvWVBUbzF3eTZzNVZYZDBDQitoWWxqMXR5SlBD?=
 =?utf-8?B?TUNqUGl5Y2VGV0UwdVRPUkRWaEFZTGo2bklXVzUrODFrZk10SkxucURmRG52?=
 =?utf-8?B?b3lQcFRaS3N6NWluMnlhcGdKZkcxeFArRTMyeHBUYVVxbWdNWnkrVGtUY1Rp?=
 =?utf-8?B?cXNUZkdJcXpvd081SEYrellmeXJDRHkvTnk0azl3QmxHd0M4RWxhcGxuYXo2?=
 =?utf-8?B?RzRrOVl6Vmx4VGNyMVVaNjVWZFlldlllejVPcjMwNVVzeGJPNS9NZjlzWlFX?=
 =?utf-8?B?ZDZyMTk2Y0ZiL1JWNDBkOWRoMWZLQXF6dWt0ZkNWQ0JraXJhRENMVkVDdVZP?=
 =?utf-8?Q?WU2sc2TPapI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWVDeFg0YlFPN2NQRVNZcVRoblhtTlhDTTdzZ0dMTEp6M1ROckxiZGhta21H?=
 =?utf-8?B?blBrT2c5REdxU015SUhaWUsyaXFYbnRrb3RDVHJzN0hMU3NxcjZVN3Eya0Er?=
 =?utf-8?B?S25YUVNSTDdPdk9Oc0VIMzFBVytPSWpGMHNVc1VZUmNUSXJKc1hZOG9zRTY3?=
 =?utf-8?B?OS9rVzNPQ2ErWGJvWmE3RmlIcVN3NzNvemVkVjdXNGZEOG5ON1JZaHhBc3Vi?=
 =?utf-8?B?NVlObUpvNUtOZWdOUnp2d2JrRTVvUkkxM3JiR3BvcnhaNzdnZWoxMVFJSUI2?=
 =?utf-8?B?cWdPRWlBbWJjK2RGTzczMlBGQ0ZCZWUzN2ZVajZxdzlsajI2RW9lUEZNL2ox?=
 =?utf-8?B?UC9pbnlXSmdjRGYvRzFuTWh4Mk50K1ByY1JvbGIyWWUzZ1lwVDBhYXE4T3dn?=
 =?utf-8?B?R2g4WTNuVGVVMGhvYmY1alowWWs3VnNtWWtVY1o2c1RTOVNZeEY3U0FLM0Qr?=
 =?utf-8?B?S2xyVEdjc1VISjVFbEovcTZFZ25XWkxjYStZZ2h0TmdTemIwZkJOUzYwenhP?=
 =?utf-8?B?OVQxeHRQaWIzRW0vM2cwS3FEQXJ2ZStLV21LSjFTVHI5aGJ4cGFYT1Q3YTBR?=
 =?utf-8?B?bWsvVnlhMlNWTzZPMFdGRWJHWXNtK3dNS3hOamhqb2F5WkFSMmhpNlFPVXRF?=
 =?utf-8?B?cXJRZFAvdHV1dTZYZzBxcnNZNjkzYTgrRFRHTW53WUNveHArRUtvQ3BoNFdm?=
 =?utf-8?B?Y2hGcE5jTXpocXE0UGl4d1NueXJZSkF3UGM3MWVVdHRHYUVVaHRGRGNoUjM4?=
 =?utf-8?B?LzJvK0NrZVFZYkpnczRJVTFIQmRZVlFWRDBrZ1EvM3pudVRkYzIxQVRrdDhj?=
 =?utf-8?B?bDMzUjdTcXZ2RWhZRWlBcDhTK2dmNjZOQ2RacTl6TXBUK0tNQ2lLUlFvWTRm?=
 =?utf-8?B?REhFeFo4REdLSHFUUmVadk5CelpnckY0eU5wWUVBMnJWOEFQS3hjYWZ3MDI3?=
 =?utf-8?B?L2VUWWpqTHVxMnpnY1hRbDR5bUhvRlZGTzdHdm5FODhEbHJvTkVPMUhLYlJ5?=
 =?utf-8?B?cURralJZZ1pSNFQvVmlpbzlsUWlweXgyWXEvYkl2MmpLVjJ5YnhsUGVTWTZY?=
 =?utf-8?B?b1FybVkvdDdJVmdMQ2t1bS9na0RMbURvL21paUZzQ1ZCdVdoL2tjYmJFVGVy?=
 =?utf-8?B?NFBJQ0ZjOERvLzZ4S25vZGM1a3VkN2JoMTFRODlGZTZ1ZkJCSUFQbE52K2U4?=
 =?utf-8?B?T1Z4YnQ2azFjWEY4Y3MwcmpPbnkvR1laK1MyVEkwUUdsQnd5NnJBd0lCejRM?=
 =?utf-8?B?enBhTkNseXI5MnFHOXhMMTZqdU1DdUR6MzNoL0JaZzY3Y0tJdWtpYVRjZ2JV?=
 =?utf-8?B?NGJ6bzhndWdwaGQ5NzZWV3IxWnZoV3R3TFFuTWlsQ0pkVFprWGl5UUpidm5J?=
 =?utf-8?B?QU9sdmRFckdkaUZoUmdPVlkveUVra0RRYk10bHZtNmw2K2hoaEdlVEppWi9G?=
 =?utf-8?B?dUdKcGl0NEFyK3Jxc0hUNEJldU1zaWJOZjl5TWxGOS9OQlZjdTAxZkZiYlR1?=
 =?utf-8?B?QUxrRGV3MldXcDIxV1M0WElEN0ZDT3VuQUc2M3hwcmd1ck5CSVk3SHZyZ3BV?=
 =?utf-8?B?cTRZSVh5NG9BM3p4M2drM1I0MlZoV0lvdW9aTTlRVXpUajdtU3VCSTFsMUg0?=
 =?utf-8?B?QVZ0WUQ2TE9Yb002QmxwVExnNWdLdEZKSnhoRngyTVlkSjJCdm1wNDlnTXd6?=
 =?utf-8?B?emo0bmk3Ri83T2o2dS9XQTZhSkVoc3IyZ0FSWUtPM2ZvYkFMQ284U1ZZRmkr?=
 =?utf-8?B?VHVIUUxlSDh1czZocXVIVnJLQ3piTEhSQWFUM2EwaHpsZnl2TVVFN2NIYldC?=
 =?utf-8?B?RkRCRjZsb0tQaVphUmN1eGc5c2EyaVlVY0Z2ejY4Z1VBRS9iZXF4Y0NRUkdq?=
 =?utf-8?B?ZnJWeXB3MVdTU3JsYlV0d1hRSi93aUNPVlptMnhkTDJnNzJ4YWlSdGM3Y1Ru?=
 =?utf-8?B?dFdkZHJ3Q0w2cE1zRmsxcnZzS2ttb0hUcGpjT2ZpNVlvODlpVEl3ZU1SRmly?=
 =?utf-8?B?UGhrUG1IOUprKzFFMTdkSWdyeTlzMlN3amFCWkUzTWFkbDJJbGJyT2xlYnli?=
 =?utf-8?B?dFlWUGFXOVpkTlV5QWlCaTZsYzRZOWNCMmxvM1c4UG9EZ0d1azY2VGtPL0hv?=
 =?utf-8?B?bnRZc2N1MEtTdEg2QndMbmkzRHdHR2phdnR2NlIrOGlYelRtcTBFdXVZU0tv?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uBRZpnfzBbiwGhcaCG8gYt3n1SkmEmjsfvWUD2bjrUplideW33KuIOOyPzz2ki0x+5i71HMCDpkwh5im1gJDpoAr7Nt8sXR+81l+lwSgxew6qZWqK8FPJzCtWl7quxfDzZQ+jVOEUxKyY/jNsfuXa0sXm3qqXAPMb/Dz/OcmFlxgMMMWkNjuZVBLu3zY+x4o0n451rzRw5DTVfGTd1ttnK0b8na7V+PnO25FOgH5pfHuBxQmNp93G+c9EMWM16/sKvhpQeOmIRLERvsflXMB32GpiUCnA7SJ7QFCBrD/X1nf4e5O0ZDtrWQ6gNTX7GOGPcKS8l2zDslhBMJzF6n+CvY1kdfgYoTqfnrqBxsFsLgPb8uJohAgmWU7yr2BZ6k61Tvwp8x5FHoMwdY7pzT/eZyIwSZyqakBJbv/Ixg/uPOaOc8pCczqBVqTIXsw+oDn6txueplt03A9aP4OcmWznBJezXfv35ZXvoTf2DVDetbt2MJnM4mz/W/4XYJnazeHLIf2693SKaZShfTYyNryQD1uUnOLc1XGvMIdOyGeTLZ044E66rswVAfk66x+N4xKjPP2pCytVlzwX4VbX84sDhBivk22AfQwQVeGERNtfyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80a4b30-31da-45f5-9156-08dd75b7ecc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 09:38:17.2703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stJV6/9n/mPw2VRgw6Cus5SBCl6DSNZBZJyhoG3Ankf5tWOudtx3XQyrHRL8X5tAK9Y0sGZLX6l1KtZGw+AEL/qoMZ5JxAGWsc7ZV5maMTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5936
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070069
X-Proofpoint-ORIG-GUID: wMZemOE0Xy-BTeesgZ5fSknVNFxDov9b
X-Proofpoint-GUID: wMZemOE0Xy-BTeesgZ5fSknVNFxDov9b


On 07/04/25 12:44 PM, Greg KH wrote:
> On Mon, Apr 07, 2025 at 12:02:35AM -0700, Harshvardhan Jha wrote:
>> [ Upstream commit 099606a7b2d53e99ce31af42894c1fc9d77c6db9]
> Wrong git id :(

Ah my bad is it 85fcb57c983f423180ba6ec5d0034242da05cc54 instead?

Harshvardhan


