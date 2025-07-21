Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C760B0C077
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051294.1419614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udn25-0007oz-DD; Mon, 21 Jul 2025 09:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051294.1419614; Mon, 21 Jul 2025 09:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udn25-0007nY-9x; Mon, 21 Jul 2025 09:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1051294;
 Mon, 21 Jul 2025 09:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udn23-0007nS-Uk
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:42:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f438e7f9-6616-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:42:02 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB6810.namprd12.prod.outlook.com (2603:10b6:510:1b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.40; Mon, 21 Jul
 2025 09:41:58 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 09:41:58 +0000
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
X-Inumbo-ID: f438e7f9-6616-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDJCDm0HdGdF//zdWd+HJmv0oPAQdUy/0BSXXWtSKittWSkO8Ac48UK4LPPh4iJ1bPXBLRn2bKldvlZRX9piNg2p5buqKhRlGkU5SsoBf6PjzXyzTTTKeKID8H7ZP9Ni0iARv8QM+l6aX08kSs7EbE3tQ/lhu49LqLZovx2dhjV3OGakuV+Jb/SZnnDupay0EDKy22KS7gsrnK0td2jNbcGSGyPLEL5qHIbFqJzK5y+jRbuNPuKuEVsWFkBh3lzyy/0d0mgqK+g7R2972RsTwK1/INpq99uvxA8qlWVergfRYTWZkJJnj1nq+obcNT4FKYo4fcOlW5+V19OSAY7S4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqOudW/Oz5nC17PLu/La2h4y/wxAkrKabIZR3rt9jj8=;
 b=Vo9t+hhPltjpNVAyzhzns4dX6hJWtHrfrxqBPVohHDRO0DL3aKg87hMdfe6M0A9ordWhiM8CphosCHYUf1veRFC7RXE3aZ2FVWeIOpd/dv1lGjlOc7jghih1zvE6l5Wg5fT+hGDuBgt1P87YojXi5oRLFmsXf+wLY6twff9Wt25RjsNfQaO8SqsvKOnSE/2AjWY214vX1PEWq6jb+4kHsCQT48jLHiEEyrN38Ikl4ONnb9KUTi+yYbUOHm0mM4aGhW0FEJtjF4/aIoU0aYrVpz1JO+Y67FMBtw8hP/083fADMmqGkY41BL+v/XtZPzWy+vKROny1CJvxPTwjgg17rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqOudW/Oz5nC17PLu/La2h4y/wxAkrKabIZR3rt9jj8=;
 b=dMJv/2Ffrbpk+yumgwD5JC8KTh4HFl10MmcB5LJCgSG2nRNPPcbfmYJwjqwkFt1YF3EM/5ZLC07NpjW68ZzpRvg9diu7Hu3N2XsCLk9Ck1YAkuQUqUrReRcJzCkC+pYIlP3TEwB5LIMffM6VhxcF6OPWTULMhE2dtlV0jAwl2g8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7fa2a8e4-3a37-493f-9a76-f1cb527cda89@amd.com>
Date: Mon, 21 Jul 2025 11:41:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
To: Hari Limaye <Hari.Limaye@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <cover.1753084737.git.hari.limaye@arm.com>
 <7050dc0abf9efb69958a8b4fcc1c325d2e937fea.1753084737.git.hari.limaye@arm.com>
 <704db270-650a-497c-b536-2951b35a8102@amd.com>
 <D73A9539-145A-45DE-8316-40B950144DDB@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <D73A9539-145A-45DE-8316-40B950144DDB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdfbf39-403d-4346-f6c3-08ddc83ad5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzRUYWVXbjkwcVEzTVhwajU3RzAvTWlHREx3MzdHZmRPYWZYcGdRQjQrTEdD?=
 =?utf-8?B?YUdxdERkUzRVbUhyWVhkN3lja1JmRDhab1dJcTZHZDhKOE56RTI3THN3TTl4?=
 =?utf-8?B?UjVWRGtxaGhxL1dOV3FheS9vdS9mbjhQSGU2aHMyWW0zTHVZeG5NSndZcHZY?=
 =?utf-8?B?dkloZVpvRDIyZkVwdWMza3RPYVNtRFd4NlpEWXhCQll1ZkxaTHNPb28yRU9Y?=
 =?utf-8?B?ZG5INVFxbHRiaFVTWldrTisvdUJyd29Ib3Q3ZEVXTGtNS2hmWFo4bUpsZVR1?=
 =?utf-8?B?dTlDWnVxV1padVY3UjNGdU1jclhPdUNuZ0RZbjJJaUV0VGo4cFdDWXVaM29Y?=
 =?utf-8?B?ek1HbXgrcHo4N2xBS3g5dGVSWUwrYU1RQ3dLVmVDUDJkeURvSFMySDFZS2tU?=
 =?utf-8?B?SnY5RE56WkpnTE5pWUI4NTlzekxiRTJPVWM5Q29SRWxaSDlqcHpPcjFhMlJl?=
 =?utf-8?B?ckg3Y3NTZVNkOVJvZlU4cjAvWVdzSVRDMG11NE5qL0hhUzdqaE1WKzc5YmtR?=
 =?utf-8?B?dkxzN2EwMVFVUENMd2ErbSt2d3VVNW9aS3BYK3gzTUE2U3ViNEpIUnpJb1RN?=
 =?utf-8?B?KzhZL3Q0Q2txeGRVN1hLbVRYVHk1by8rMm03d2JYUWNMQ3R0ckRnUlE0dkta?=
 =?utf-8?B?ZnY4bVBRdGcyQWh3eGVDOXRCYkpsdnJtV2drdENXWGdtbTZMRnd1VG12Mkcv?=
 =?utf-8?B?SGorVWdER1BGSis1b1pqVXBmQm9CcGFSZXBhWFV0K2t5VjRxeWQ1SVEyZjBB?=
 =?utf-8?B?Z0hEVUxZaHJ2RVJaV3FXelRBR21KdHlmYkRWNlFJTmhsYzlvWWhLWnhTVldJ?=
 =?utf-8?B?RTdhMytub09sL2pLZTNFeFM1SWsxeWg5bTlrWVZNTCtybzlMTXFsZmhFQnhG?=
 =?utf-8?B?RUFNNGVHZXNhN0dUVkJJZG05YjB3cXVYSDVLcTJNY0ZRNUFyajlDTHJjbHFW?=
 =?utf-8?B?bXJFVkdIeWFEQzJVWW9SNmEwc3VMUncyeFVqUnc5RTJNWGhXaDhERjdnanZ6?=
 =?utf-8?B?TGZDdGhpaG9OQUVvNm9aSWVVMlBpcXAwaFlWY011aCtnRHErK3IwK3FXcDR2?=
 =?utf-8?B?RXRDWUk1NW5NT01RM3dibWQyNE9DWjIreFpBMEk0ck91Q3UwN0xaYkZSVlNM?=
 =?utf-8?B?RUZ1Q3B2eHJJR3h5eVh1U1JPanJGL1VoU0Z0aVJwVFg1MWdhQXVrZ3BUeE5B?=
 =?utf-8?B?REhKNFdKSVgrRVJvV3dRckhodmVtODEvTmhIUXczSUhMajJKTkpHU0E3c3lm?=
 =?utf-8?B?a3lLUUx3alJxRFp2RlNjWmFHdVF6em16RHpGUW1jODllbEUwQzNTeS9sdll4?=
 =?utf-8?B?ZjN2emcvRFVGdGZiNWNJZk96VUU4ZGhIbmJRQ1ArK2t4OXdUN200QTNhTmVx?=
 =?utf-8?B?Z0lvQjdubUVWbFQ1RVNTK0lrQWpYS2xBdHVPM2dpeHQ1Q0k3RjhQQ3d2T1Jw?=
 =?utf-8?B?V0NROHZKVWQ4cVJnaVQ5MHc0REdTb0xacmJoRkJXU0dFM2F2RktVMUxka1gr?=
 =?utf-8?B?NlFWNmRiYWF0VDVmQ1U0aER1Vy9LK0tKdndxODNHSzZ2VDRkK1VwU1JsU01z?=
 =?utf-8?B?Wm9jQVcrN3BKNFR0MGoxQS9tZ2JoZU1oZWVkcUNBVGxHME9ERVJUd28vV1o5?=
 =?utf-8?B?TlFpeVRDcjR6ZThqWVppSmtaQUdFd1dKejNqeE1JeWxkeERBVEREUll4Z1A1?=
 =?utf-8?B?bFlVVC9Cc3l3djF1T0pyV0JBZStUekdJaHhSckorZG5BSEJuUGRqRS9KRSsr?=
 =?utf-8?B?aER4cmVHMkFRSVRZcThGSnkybHE1cWJJL0lJTzNRSXdTVFNtRDU2M0VXVkc4?=
 =?utf-8?B?R0h6SFVSYXMrbzdYMXdkbDZ3Z2lncEZWblBMU2RqaEM3U0pLSVQ2c2EwNDJM?=
 =?utf-8?B?UjdXVzE5UTBndXRaaTd4TG5uVC9MNW9tK3kwY0RsYzVDb1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlN2QmxCeUFOUWhMSDFxTG5CZEI2elhjd3NIM1M5djd6WVp4UkdzbklXUUd1?=
 =?utf-8?B?WWhsbW42L01VSVF4RzZTRzdGdzM3SHYzZTBvdCt6MWx5YjJzZjJYbmI3TER5?=
 =?utf-8?B?S1hjLy8yQVBYTjVuZm0xMzczRHAyYm1JUFlPc0RnLzBFTFlJMXBEcUlMQjlv?=
 =?utf-8?B?VzhiRDdKMmg2ZVRYUzBxTXZvaTlBTnFnQmlKb2RZOUFtNWZqWTBiNXAvNnBL?=
 =?utf-8?B?aHF4TXFXaGx3MjJad3JUU0RKSVVaVG5GTkZtcllLdUhLZ2REdjIrTWxWVXlE?=
 =?utf-8?B?NDJ4N3UreXF0WkUxZVJSOHgvK3BvT016aHhUbHZMRUtIbjltYnUwQ3ZWTllW?=
 =?utf-8?B?MVZNOVR4TlNpV1NEMzNVREVqMGhzb2tsWmFWV0htWDIwdWRLT0Q0T3JkRnZN?=
 =?utf-8?B?ZG5QVE05OTZOei9ndllRWC9WZS9nV2VQQzcvbWM1TmE2WS9jV0hIMnFJSEd3?=
 =?utf-8?B?QnJESnNqVDg3amRmZ1g0L01iZkRPcTM1bExGSndTeXFjdWNjQnVIaWFPdjMw?=
 =?utf-8?B?b0J5TjRtem5DUHh1TzVER2ordVREaE8zY01OWUpWZDFhU1YwVy9pUGxPa1I5?=
 =?utf-8?B?aDBZd3lRSTZjSmplRDJvMU42cUJJZm44UmpQZ3NDbWpweUpaT0xFUmpqaHc2?=
 =?utf-8?B?TWdUZW54TzJ5elRGYUx5TjI0VVVMcDhVeDFYNjl1Mml2cFg0bFl1S3c0OTlM?=
 =?utf-8?B?K3B5RFVoNGlOaDgxUVQxeDdZT2FwUlY1QjlVMHloZkdid0tSdTZLVWQ3Q0ZM?=
 =?utf-8?B?a3BYMTZOWmFnUFFMN1ZTcWRPYmVtN2VLVTBnamNOeVdVaHZkUVA4YjJaMHVh?=
 =?utf-8?B?dkFwcGhNUVpsVjVHY0VkbTRHSU82dkk1VytzWHd2dEV5R0JMZWNQb3BQM05Y?=
 =?utf-8?B?SXczaHE4NDl2TE9EaTRTVDF5dkVkWmNuM0lPMG0rUUl3a1pHWXNVVGtGbS90?=
 =?utf-8?B?TWdaTmFiN2prVFd4QWdVLzVHbmxhcHVLeU9QaWlacDkwUVBncG5uVXRaakli?=
 =?utf-8?B?b0oySWN5NFQrTnROU1lFa0RiUm1WeE4zZFFHQUJGNU5yVkprQkp4LzErRUs4?=
 =?utf-8?B?YTZtQWp1NVloeE9WNWUxUHVuamJ1MStjbWlLY0tpRGREcHQyeUI5NzJxR2NX?=
 =?utf-8?B?Y1hRRmd1dDN6UURhMG1hNU5SWGNuY3lyYnNkNkhRU0l5eWptcmRWNzkxcXEv?=
 =?utf-8?B?TnpkeEJXd0lwRjZWTUJHcjUrMGFiUFpVTU9sOGpEZ2dsR1hPYnNUaTl6ejJ4?=
 =?utf-8?B?dHVVcmg4YVU0VFI1VlU4dDdKMEp6WVcwQjVCZDRSejVMRE85N3VJVkxsUkZq?=
 =?utf-8?B?K25QWmxjOUoyVFdWWGZOcHF1KzZYdUFnUzZuQy9UQUppbzBINEtkbWcrZ2lG?=
 =?utf-8?B?bnlpa0N4L2k1OWVFT0tJeUUrMFRKYytrUVV3OWRJaUROTDBuY1U5OFZJdWFR?=
 =?utf-8?B?NXRPR2VuMlU2a29jQkdMM2k2aXpqTllZSGtURlp4RC96RUdIdzArUnBNalVK?=
 =?utf-8?B?MmpKMzViVWR5ZUJ4R1lveVNlQzk4NUtDZ1VnbXBqVDNRV213RCtxMk5POVFv?=
 =?utf-8?B?YllxL2VVeTNwZWw5SkJQN0JldFlJSGYwNncvQ2ZZempubHlsR01zbWRGOXYx?=
 =?utf-8?B?aVFRTlA3eVVOUUt2UHQ1VGJ5NzI0cXdDL2ozSkc4Z0oxUFZxa1Btc2tpaGlI?=
 =?utf-8?B?T2ZCTS82UmhReEF1cjhTcE41R3dRUzZhaXB2WkFLRmVIbTJ1M0NPSGd5WkYv?=
 =?utf-8?B?cnA3QTlmUktjcTBxdDcva0F6TllZRlVZemlPV3ZYcWRJLzhkY20wN1NMREV3?=
 =?utf-8?B?NWhVRXBPS1dWdWNqR2RUMUFBazNFRWZ3SXBNVmRRRUh3M0R4elpBNnBUQStU?=
 =?utf-8?B?VFE2Um90czBOTjRBaUU4TysxcnJhRXhPeDZMZytoUDUwV0hMOFNGTVJ0anlz?=
 =?utf-8?B?RUFLNjQ4RDVrRjhvcGNRQkNLdU1BT09ISmptWC92UklWTmdBc3hDaFVXM1Zm?=
 =?utf-8?B?V2NqZFBFSWVBU3JNY2lRUzVUSysxQ29pWnluZDBMaFZLWmM5Q3VRTTY3NEVn?=
 =?utf-8?B?VmRxZWR3bWVBSytXQjFEeDJ1cnh3VjNCRkZydVplQ2lwU2NLcGpaK3k2TmFU?=
 =?utf-8?Q?JJZX3Em2vEaXdPDG4yibvM6jr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdfbf39-403d-4346-f6c3-08ddc83ad5de
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:41:58.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMc4lCTvKTwmH95v5MAcPeTO/dR96JeNrDr4O73vacZ+4/EJUrbbEt+O8/PMLXjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6810



On 21/07/2025 11:31, Hari Limaye wrote:
> Hi Michal,
> 
>> NIT: In this patch you start adding mpu: prefix, even though other messages do
>> not have it. I don't think it's needed.
>>
>> Otherwise:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> ~Michal
>>
> 
> Would you like me to respin for this change, or can it be addressed on commit?
Provided no remarks from others in a few days, I can address it on commit.

~Michal


