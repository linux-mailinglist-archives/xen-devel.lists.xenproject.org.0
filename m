Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DEA21AD9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:16:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879001.1289260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57l-0005Qa-TM; Wed, 29 Jan 2025 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879001.1289260; Wed, 29 Jan 2025 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td57l-0005Iu-Iw; Wed, 29 Jan 2025 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 879001;
 Wed, 29 Jan 2025 09:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMr0=UV=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1td4Af-0003fq-RA
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 09:15:41 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9afad465-de21-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 10:15:40 +0100 (CET)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8tk1h001773;
 Wed, 29 Jan 2025 09:15:35 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fgfg05px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 09:15:34 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50T95mCK005511; Wed, 29 Jan 2025 09:15:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpd9jbcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2025 09:15:33 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by SJ2PR10MB7038.namprd10.prod.outlook.com (2603:10b6:a03:4c5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Wed, 29 Jan
 2025 09:15:30 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 09:15:30 +0000
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
X-Inumbo-ID: 9afad465-de21-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=CKLGZdSLz6tuXwUQv0VUqJTcBmS6840dX+A4C6UHwME=; b=
	dTfH+GMyms4lVZCuPpHzenZN4OpJ6iL7J7hIxJPCtniAmtyydq9TuduL+xj8KIrY
	/9qglvit+psmNc0QaVfq3hc8PAdrOZAzJA7Vf4LpeaEZT+8qWF7zhfb3V6Pb6es0
	tpSOSf+cZiKtyGfhzm+TgAt/EV9ZcI725E1YucZo6Eg9kdVPamoxtkQ7EW7o5njw
	3blNthMy4t+a/F/ECjd3uHIOlsjEe7Ra+ETH5OSWmgIH1Z5PHdPgTL9QIWIv/duD
	6kFkkCrbVKwXtC7mRmmdfRsEeyXF3o8gLzU1HvSxtdXFHM3dRFkfK7nEjgSQRcLZ
	Rpwa6YlUzTjPVgz80uyKdw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjVS0SJS6z+st4MQD8X2ovzUuDY93SC/RTanen6b9kKb+KTMtMXCdEf08eAMHiHV9ERhbIUvPUhiz7pjIoyfHwQJM4wH0lO8LziE+0gAQsvvyqaBXNkTFUk33fsfe8r/7pdlGObnTDmPhOv8rOIh79zQt7P9T+HLTqp5g+/uPx/MdJGrAPSTKJyZHqWXg2v3K/RnBEEsH0lAZ3QCYyjaQ/vLNl7wHD1J+2la9Opof8/hGmUzJBykQrAB2Ry/wUh8shA13GM+J3u4Sivrgwbyxx8BdEtegO+ZwLZNLEibtbm3ZEtB20oaYpLafGLKjtVDZDBRFPxe9Y9G+/UsGsBXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKLGZdSLz6tuXwUQv0VUqJTcBmS6840dX+A4C6UHwME=;
 b=KXv/5YV7U3rKH9a4VYKJfawaZc2DF9uoGTycwwJTnMtebxe3dCn+ayDZTY8OKXWqLkaoBdnAMDX9zuA0KF7baOzqHLxeP2okR4lNFjm3/L6/oZ7tgpH57/VWWP8mHLOe2hRStGkvojhItqKeD0Dbdd2ayDzYyp5GPT27YuvC3RTVLc+s1pFQLmkux078ZxV4ioLJ6am4XZ9XTwKykcfN40mXmx9IiuSDtPOfjL+N/YXlJ+OLn8xgehJZ1ZZ3xpWsmYrOf0t+IMHVaPHBnBkIMizlX3rwpLnYmnXBNFhjdnvLDLPxpYSN0p6E8aBreGOhtQwb0dbkdtrHrpTaXKh23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKLGZdSLz6tuXwUQv0VUqJTcBmS6840dX+A4C6UHwME=;
 b=iBDsTzSWLjZPTIiCm0R6qCXH89maM60nPNyN/XjpVCxb5AzDPVgXXl9q0sSiPOqxe78qqiPfncG+dIYQOAiCaNfwMrSj8NrJlPID2VeiXRaxXmqd8/al9KUpF9OYQ2QDVevuePy07iNp1299d++7biNs9SOLS9M3o8u334CF3Lw=
Message-ID: <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
Date: Wed, 29 Jan 2025 14:45:22 +0530
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
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <2025012956-jiffy-condone-3137@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:820:d::12) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|SJ2PR10MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 19094e95-81d2-41d0-8b51-08dd40457a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHdrdGYyaERhUHExUitvZkV5S0xTWU5TZUY4ZWtYa0VnUTI0aWt6VFRtMS9p?=
 =?utf-8?B?bkF2NTRBbHlkbEFYMGh2SDdvamVzSExoNVRDQkNEdnpBbi9UeTkrcTgxbWMw?=
 =?utf-8?B?aGFFaFo1WjNQTk44Z1kxTnJZclM3V3pTVHJzSGJDRnZ1OVBRQkhHeDVyakNj?=
 =?utf-8?B?RlJPL20vSWxEWSs1S2dzRzFBUzBJTm0wTy9ncWNKL2VKRGRpVEM1QmMzYWta?=
 =?utf-8?B?NkpTakZ6OEcvUkprRDVrRzNpRytBWlVFOUhBZEYwZTlvcmQySUE4a0ZUVjB0?=
 =?utf-8?B?UWRaeFJtb0pPSHVaM0NPbzd5N1JrUjNJWnNMM1EvMmhFMFlZNFZNcmRLR2VK?=
 =?utf-8?B?S0V5ZlBKQXBqZXBESE1LT01XQThRMVovZXdkUUZaWUtCdDk4L3Q2cVlTRVVE?=
 =?utf-8?B?aWlJcjhwZHpXMXpUWjFkU2tsU0IyVEpHWk55dGk2RkVUSFdVMFM2cjZTcDJo?=
 =?utf-8?B?SXJMQjdXRFRlT1I1S0tsTXpWU09TTkRxUk5ORkI1MVBjUlQreTZEZkZ0cDFJ?=
 =?utf-8?B?MFFNR3VHTUFCZzRNWGgvcXdtZ1QxK0dpMktmRDBEOG1panlvUlhCZkpRZzlZ?=
 =?utf-8?B?bnMwVUVKY1lITDFpSFpDeC95TG8vMFVzNzdlVURhTXdPdDFkTmpkN3pYbFJ0?=
 =?utf-8?B?N09ZL0J6YW1LRHpGUFFKNkN5STJDeG01YW1XSDFiOGxxOW45ZzVwMUN2NDNz?=
 =?utf-8?B?aGVVWEhtdEdHSjQzcTZ2ZmRqK2FOK01xWVozalg0VGxZZkNHV1IzWituY2s0?=
 =?utf-8?B?empoYmszNzBpbGR2eXdqV2d0ekZuaGZGZVo4SSt6cEsyOW1qZlhCZWUxNnI5?=
 =?utf-8?B?Z0FxS2hoZjJScGUvQkxRYzFydjV2enBZSjNrMnFSRHFRZnNFQ2VMQnY1NGpr?=
 =?utf-8?B?a3dRVEpEU0lteHVZaXRyRXVHVE04WjYxYTk4VHlyQnF2aElwZ2NORTN5aytY?=
 =?utf-8?B?Z1B6SVg4S3NFeFVzZGt0c0h3YmhiNFdhSzhIeXdoWWxOQThOUEp2eGZzSm96?=
 =?utf-8?B?bzAwdzJVLzI4NEdQOEdrWkxjRVZSQ3hhL29iWWVHUW5XaHJxQ21qK0d3d2tv?=
 =?utf-8?B?YkFGWHFJRG5xeUU1M0o2WW13NjBxS21raGd3R20rU3VmdElrbGcyS2UwV09U?=
 =?utf-8?B?dG1tVmNNM0tUb2hFS09JdzJOZ2t6NkJFcklWUWg1KzdFRHNjZVU1SlBlbXhn?=
 =?utf-8?B?N1dTNEhodHFwUHFzaVhOTkNMQ211TklZUUFjdHlmeWxZUEdnZTNlYk1TS2Ja?=
 =?utf-8?B?NmpreFJ5TXBLaWE1eHExMk83UVlFZlVuY0tkRGJ5aDRTR2RlYmVPUFlsUml4?=
 =?utf-8?B?eldFc0VGRnpYZzNqY3hpMW9RckFpUVZVSGNFVHZwbmNiWGhpOFZVUEpGb1cz?=
 =?utf-8?B?SUY5d3hPK01yRmhVRThnVDRERDBTYTh4MHd3aFpsN3lZRlRkNGNPaGY1U0Iw?=
 =?utf-8?B?T2dlSlQyTXJjN3k4c3ZDOGRDRlNtOUMxVjNQRzNvWisrVzQ2amIxYW1UNHZv?=
 =?utf-8?B?SFM5MStrdWE0WjRMdXBNN1RvUm0wTzhiUzJ5Z3RjTkVjYmRTZ1N1ZWd5TnJu?=
 =?utf-8?B?endPQ242NDJ1bXhzUTE5eGpvODNCWGlSd1NxdzM5WEtvaDUrb0dmOGJGNGxw?=
 =?utf-8?B?OWNqN3ZIWWgrTmgvZnBaa3JCYW12TFV0NjMzcW9IKzhpNW1XaDBwd0hTQmc5?=
 =?utf-8?B?YlBUWWFlUDBOMTlhUzNibUxta1RvdTdYaEpVWEJPU0UyQUNXZmVkYlYzeXAw?=
 =?utf-8?B?bHRicWlFQ3dSdXpkZVNGMWxUMzlsLzFzdzN2K055ZmF1QnJNTEpIYjl3WldD?=
 =?utf-8?B?ZkE0VVJzNytuRSs2c2pKR3l2Q1RtMzdsTyt5UEovMjZQWGxONk45OHBrYTY1?=
 =?utf-8?Q?2t6kox9ZMnunh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1BMelFSMElvQnlENlJaV1h4RlBxbUxWOEsvT2k0c01yWGZDQkxJYWNhVnJ2?=
 =?utf-8?B?QVdqRWY2d1U3ZTlvVTF3ZmhSZnBlSE91Vm53SXVTSE56MjZnY1ZRQmY0c3dy?=
 =?utf-8?B?dVI3ME5NRjN3d0kycU91cWREYVNsNldjYzV2ajVUc2VFNHpNRnorT054TE5L?=
 =?utf-8?B?QW5kcDkwa2xvMUk0NzRReXdpS25RaEFqZVFHZjUwYWNUNUpGdm43ZjIyWnFS?=
 =?utf-8?B?U1d4SUdLNVdxNGxxUzhMcVVwRzZxNlNBVnRVSEI5ZFFMQkZFaGRjbVkyc2xq?=
 =?utf-8?B?L3lJQ0NHQXp3RWFuL2Y4cVoxQVpmb2praTZjeFY4NGdueS9sQ28xVlZWSHF3?=
 =?utf-8?B?THh0eDlNL0FwV1Q1a3U3TjVHRm9tV1BDdVA5bXBCd3hwd2tWaklJUlBiVUph?=
 =?utf-8?B?dDdjaUlKRUU4c3duVjUwYkczeUxxczVmV2NyNlZnZzJFMUE5VnBUR0o5QzBL?=
 =?utf-8?B?K2czTmVzcEMrNTRLT2haNy8rSmdkODJVdmF4MHQxVmp5NkNJUTY1R2MyUzda?=
 =?utf-8?B?NFR4eUx3ZGNGNFpLV2V0a3IwZzdlbGFLWkl0bHh4elpIK1FmZklyTSswRk5w?=
 =?utf-8?B?aC9vbmRNR292azYwQ3hWVGRNMElJeVRuZG9hTVc5U29XSE1WVHBpdFVqMmxy?=
 =?utf-8?B?Z0d3ZDZiRnpiZnlUakdmWVFBWmNXNXMzTVZBdEdFOExiVUpMVDNPM2UwMEFV?=
 =?utf-8?B?bkxBNkhjcVk2dSs0TmJueFVyOVBMajYxdkxJR0oyRWJHVmFKbVNOMnRIdkIx?=
 =?utf-8?B?bjRLcmxiSFIvejgwMTVUdStXYlBrU0tuMEw4MG43YlZtUnJQQmtQM0gzeWdW?=
 =?utf-8?B?RmlzQk9PYzUzd2ZlQ2JFZlVDVEtDN0FSVTlWY0U2a1dPK2RGZkZXcjJpU3hT?=
 =?utf-8?B?cGQvYm1KVklibGJXK3RVcitNeXJtd2ZNT2RIelRZMXJQYjRnZ0pYZHhSUXRH?=
 =?utf-8?B?anpSY3RZZWlMajJ4SjRVcm10OW12cnpuaTRVZnZPNGVxMkdBTFFDanFwQWdt?=
 =?utf-8?B?dHJRVnYxUFVnblVMcjd3NlpmczFhVVVSVzVZYXUzdDV1L0RUaWt6VFdFZDB1?=
 =?utf-8?B?MWtJK1gvT0NQN1MxY0NtbE15Q3ZXU1FBanpEZmtXeS8ya1prdHdCYURhd3c0?=
 =?utf-8?B?Z0syZVpEUlNkSkczMk1DV1hOUThVbnk3enJjYjRNY2toWS9ycnFvc0xQU1E1?=
 =?utf-8?B?dWh4NWNMeEJzT0lFak53VjV1UWh6ZzNaMHNVVFVxQzJCRzM0blNiNnNJYXpW?=
 =?utf-8?B?dnZPRkhMR09ZYktUTmRxU0RBOFROVkNYTmtqZHlLMkJTWUZuajdPM05UOWlY?=
 =?utf-8?B?Qk5xL2tOZjQvbHJjMkFObUN6c3FZMlJhM2tBT2w2NjZtSVBaOW9oajRKY1I0?=
 =?utf-8?B?UnRQMHhnQ1oxVEdSLzdSMWNkTUtQVi93QnN2dXJFMDJTY2lwRGoyZDhNSm5T?=
 =?utf-8?B?Y2ZQRHZ4R1ltQzh3RjdzWE5YYXZiRWZ5QzcwOG9UMnptTHV1aXJIVlA0QjJx?=
 =?utf-8?B?Njc4ZTdlb3FKM2Nnc1A5Rzl6UWdDSmtoc3hmaGNpUDU3WWhmK2x5cTZYU1U4?=
 =?utf-8?B?ZWRqOHBWUWNxQ2NsZzBFUEluY29oY21EUWxzY251ZGI4d2NNb2ZJOW5pNnha?=
 =?utf-8?B?VGhQZkVodnZtZExmTEpqM0dPY1hOTDROM2oyRUl4TTBhSjQxdklNVTczc3d1?=
 =?utf-8?B?eHlTdlBzMkhmandrdkNOVlM5dHpzUVBjQkljNVBoYUJhU2poVVVGMUwwWTd5?=
 =?utf-8?B?R1JPNnRWb2hidGlvYUR5Z3pDc0krTGtJR29hNm5jRllaOU4rY1VJWDRWaXNM?=
 =?utf-8?B?LzhkbVhyY3lUY2dVSjFKNThzeStZQmFDd216Q0tyRWNISm5lU0dJWVdST1Jm?=
 =?utf-8?B?b1UwaDl3cFAwMDJybEVTMnF6dTU4MHlRNURNY0JQRDBxbEFxUG5QQUw1b3gz?=
 =?utf-8?B?eE5JMFdlWng0TzN5eVN6U2lVNis4ZkRWNitQcFFMT0NtbVlnVnA5eEZHbm1l?=
 =?utf-8?B?bFMxeU1DelA2UEx2NHdWMVNPMlQ3Y1Q4c1BCZWVPQUo5c1BoWWI5WGMxbUpD?=
 =?utf-8?B?UWhoTGQvVWZHa1lPTys3OVM3U2xCaVU4Nm5vYjRmcXhHT1VGK2FFczN1V1NM?=
 =?utf-8?B?Y05oUlpXOW1KOHZlN0lsZEdPSldhTXRncDhrMm1mQURZOVJua0sxR2g1bDFj?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NKcfm4dO2OKTw7urKvlU+abja3kQ288sePWdz1VUw2cM+itbRG/mjLrlAQmhYEaw6aFW/Yzz64EOo0yNMEarKrmGau4GdXXbt+YccLdNZFDtrvWq8Z2Id2JCTpPA73qZNuFZ/VJp+o4yVweKxdZ603yMTo9YRqkyhHrZW1zWPYB5gAGqh6AC/f3EG78cNvevNMsmy/+Ia5AZzcHWYGojOpZtvqLrH55adNM4XQC0cpMHJpXcVl/M3zovIs2xw1MSAbfMjqJ2BVbieCNuD9s/8meSInNcSjcun3MLic22bh1SFZ7QYQGln5vmtZfqYgdH3QI7148OWZaFf+dgr6zGcAT49yYYu2DAXLegrNEkcIONcRmPfUjF73bY9MI0hGwMXB5PTngR+PZxJEfQ43JmGC6wuE9Ac2spiKicOqUlhtg4M4zmqnIcYVxxUuMIcPh2pHf5mpsXBlLjqN7+O5CTmT2SO33u3mdKo/FyFcuYsrUbX4fFoe2YKSKnzPtltZMtPPqq8MOdpNVezx1PxCRy5X3QkT8qnYOg3FMjxkq0W7SWDmHB/So1ZBRWPmyjXBVH/QmyG4Iw6bbJVOjgE6XLj0EJ2a8UFQljhAhuaflxaM8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19094e95-81d2-41d0-8b51-08dd40457a34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 09:15:30.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcXRUJK/n+L3DTUNTlU+Pu5u8XDnyo1kP0u2H4XJWg41WiDktOBXtHmC6ngiVoTgySDT/bi7CIE3CPSechGRfzkUQhfk3gKNvJu6J/GXUQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290074
X-Proofpoint-ORIG-GUID: pkcXCaaMgwHFS6DieylSjzAUWhL-HUfR
X-Proofpoint-GUID: pkcXCaaMgwHFS6DieylSjzAUWhL-HUfR


On 29/01/25 2:34 PM, Greg KH wrote:
> On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
>> Hi Greg,
>>
>> On 29/01/25 2:18 PM, Greg KH wrote:
>>> On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
>>>> Hi there,
>>>>
>>>> On 29/01/25 2:05 PM, Greg KH wrote:
>>>>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> +stable
>>>>>>
>>>>>> There seems to be some formatting issues in my log output. I have
>>>>>> attached it as a file.
>>>>> Confused, what are you wanting us to do here in the stable tree?
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>> Since, this is reproducible on 5.4.y I have added stable. The culprit
>>>> commit which upon getting reverted fixes this issue is also present in
>>>> 5.4.y stable.
>>> What culprit commit?  I see no information here :(
>>>
>>> Remember, top-posting is evil...
>> My apologies,
>>
>> The stable tag v5.4.289 seems to fail to boot with the following prompt in an infinite loop:
>> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion 3273 sge_count (-12) is out of range. Range is:  0-256
>>
>> Reverting the following patch seems to fix the issue:
>>
>> stable-5.4      : v5.4.285             - 5df29a445f3a xen/swiotlb: add
>> alignment check for dma buffers
>>
>> I tried changing swiotlb grub command line arguments but that didn't
>> seem to help much unfortunately and the error was seen again.
>>
> Ok, can you submit this revert with the information about why it should
> not be included in the 5.4.y tree and cc: everyone involved and then we
> will be glad to queue it up.
>
> thanks,
>
> greg k-h

This might be reproducible on other stable trees and mainline as well so
we will get it fixed there and I will submit the necessary fix to stable
when everything is sorted out on mainline.

Thanks & Regards,
Harshvardhan


