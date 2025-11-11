Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1723C4E201
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 14:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159049.1487419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIoUU-0006V9-22; Tue, 11 Nov 2025 13:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159049.1487419; Tue, 11 Nov 2025 13:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIoUT-0006St-Ut; Tue, 11 Nov 2025 13:32:57 +0000
Received: by outflank-mailman (input) for mailman id 1159049;
 Tue, 11 Nov 2025 13:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIBT=5T=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vIoUS-0006Sn-0m
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 13:32:56 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec3e95c8-bf02-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 14:32:54 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DS0PR03MB7289.namprd03.prod.outlook.com (2603:10b6:8:120::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 13:32:49 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 13:32:49 +0000
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
X-Inumbo-ID: ec3e95c8-bf02-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5W2WG0AK0aeTVDE4KblhECzlS9pO4AZ+gAWvXlZjJVKRETk1aSlyTRxLnKBrJhqcpSn7LE5+kU7wCTMsurpO16cTpMhni8W4vZUWmBBlQFoylWIK5n9Jq8TUGiRuRS9Elxl95irChV4qdSQ0p45ldmH4EVaKJTqzzhC8lVSeNIG5AfaDGJzfMvUPUdVCxskEpGNy2XWTMWSc9+uLAyi35RgByo+OFM6FFr7DfmwsgDDlNwgsvyNuxcUv0y+YjMFytAKJv0aoVt2svr6atFNiKKipb1rss7GROe+cY7Hsq89h/BHJGhqIkcBvgBuA1focfPrGd1D+tXSwfTJs0mzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z39PZnE/UWKc4M/MPsBUoIxASly3Ow5JD9+rvf7AIdE=;
 b=rjvfZp6GMRvlUNlqPNNbidCIgf6RWZI1YZ12XOYR8sYY5DTrO3Ds5Dg3Db7Z3arS+ZLX1vLmBAxG8pr88RC87pc0a5Ru/d+ejXBScu/dLtJ6pgsRdxFAzv/9ymnE9qHAa1MhZpt856z/KbrW3kDIKjY7UHC9ctwGtQiNkfjFSmbINCMAPK351E4yaNfC9MF9vWfe4oCkT6ub4xwpMGQRqMLjIQsTGKhWO6r448MdljNrIcS4MmCzIJOiM1W3K0K0s9ZL+D4YWq/DG1tqSKB42YFBljyzMtnOl7SbYn2jD8arZnyWHESzpBcRrHB5W1rIvxgTSzKErlsPq1ocnNI5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z39PZnE/UWKc4M/MPsBUoIxASly3Ow5JD9+rvf7AIdE=;
 b=nm4Pw6HlB20AHPJRqVvB5g32nIpnrVzFj8x8dSN3MxzatI3P5ziC+3UJ60YMG6hwYwpNqn51LP5d1kNKjQ20FHln7r+++B3uLKQOM+1ovbgF5Nsfm5TxPT5TEUbGnJzyEt3Vi7zJP/wpjUcW6FoFutnSUO7pvokETCKp3VVVKyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c77ffda6-9472-4183-b765-74a029421c42@citrix.com>
Date: Tue, 11 Nov 2025 13:32:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22] x86/hvm: Introduce force_x2apic flag
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DS0PR03MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5a5ba6-4e71-4689-94f7-08de2126ce85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVg2RlNVdGVUODNOQ3NrbkRwUk9LSlpSMExVdERJL1pwMHd4cmZnc0RVa200?=
 =?utf-8?B?THQ4cjRXeHFRb1ZDWWpWeUc0cU95SkVNTS9sWjZYRkZyNkVRUkMraTdiT0Nr?=
 =?utf-8?B?ZU5HM3NhR0N4bVc4dDlsc0RSNXpEMXplTUJuZys2MjA4c2ZGZ0RxTWU2bTRQ?=
 =?utf-8?B?cnhQMFY4amVCNG4wN3RnNjNUWjN0RkJ1RU5Xb09wTjlFVVRRMWVTQlErL0JC?=
 =?utf-8?B?NEJENlYzSHVrbzF0TExIcGcvYlhwS3g2alR3WGNTZ005ZzJsYmlDQjZrVDBU?=
 =?utf-8?B?b2VYT0Q2SDl2cHdQT0hIeFhkcU5TUGJCUDAwbjZjM2pTQnZpZUtybnIxeHp6?=
 =?utf-8?B?a0RKekRLZHpidHgvZVhlNCtoZllWa04xak5aSGtaMTlmOFc0d25vODVKL05W?=
 =?utf-8?B?Q3d1OFg2b09SSGF1cVJ4cDVXZEZrZmJneFVvQmQrTUlQQ0U5Q2VIelc5MGgy?=
 =?utf-8?B?VFBIVXRZV0NOKzM3KzdFbWRuNnRQL1Z5Z2tGTjFsd2EwSU01QTVwRTZ3Q1Zl?=
 =?utf-8?B?TFZTYVRaTTRETDRrSXpnODA5WkV3dVg4ajNZSm5vd0RPS1FOZVRPN0ZqaWxq?=
 =?utf-8?B?MmZxc05kY0F6SHIrbW5CL3VIdVBOL1dTR1hqeUhxUUtka3hEZ2o4SzlramxG?=
 =?utf-8?B?ckZ1dUhEYXRjYUhCWElVUHJkNDErcU43YkRyanJNYWlsM1hFRVNUYXpGVm8x?=
 =?utf-8?B?bDl2ak01SkgwK3ZBU3lzY2ZCMkVtQjZCVm84WE9aS09ycFhiNmVLa2d3Wksr?=
 =?utf-8?B?eHZ2NnNhbFVSUktXcC9QRDVjZEhSZkdCc3pWSXh6UEExcDFoQ0tjUWxNcFdv?=
 =?utf-8?B?RFFXRTVnZWVKSXNZWjI1Q0JWTWh1UlovVER0N2lUdUttUS9DRG9tQmF1eksr?=
 =?utf-8?B?blJlcjRXMGlZM0lCNi9NVEttVjZTT3dvci9ubHgrSExXcXdsRnVLcURuNlZ5?=
 =?utf-8?B?RGZGY2NSa3BuTkg2eGhLbEg1cHJBeDluaWptY1FWUHp3VlJjK2U5ZDk2dkpz?=
 =?utf-8?B?Y2pnM2s1ZmNGT0ZwTFdWd2RxVVQ1a3p4OFFEUUJqQTZWREJZMC80WS9BRW9Z?=
 =?utf-8?B?Unc5eWRCVHV1am1uTjc1MGI1bnhvTjN1aXJRUHd5UllITmVJekd2Y0xLZWE3?=
 =?utf-8?B?NVY5ZksyQzdNQlQvOWNmUjY2R3FGb0hZT0RSd0tMQWsxb3NTTmJPb2ZBUUM5?=
 =?utf-8?B?d0I2cTArcmozS1hZMzA3UENKZ2RIczhBb2h4MU54MDM2aUU0M2t4SkxvUi9V?=
 =?utf-8?B?UW83eWZkcGd6V0lPUzl6ckxtbTRYa1A1OGI5a0FscVpDVHBIVTlUMzNxOWZj?=
 =?utf-8?B?S1hBMjFaYWY1a24wdEZMRkhQeWhvcUYvNmpmNmYyQkpuelR5WkdyKzErVEZz?=
 =?utf-8?B?WWNHeFB3Y3Q5Y2hQR055a1QxUlR1SW95TWVyenlwY2JqZGpYcGxzd2tOUXdz?=
 =?utf-8?B?TDREWTQ0Q2NZMjVMMXdwbG83R3lrY2FSMFVYc0VWOUVpQTdNMDBLYlgwVk1Z?=
 =?utf-8?B?N2YwYmdGWnVnaHBpd3RING9CM3lNRXE1K2FKd3ZFUjh6TkdMbm16RHU0eEFB?=
 =?utf-8?B?bTY1TjdLcHdpc3lRd1hxUW1ySU92QXloRWNnTTJWQTRETFh0NE40TG53T2g0?=
 =?utf-8?B?MXVPOVdDSFJvbzVETnNVVGtYMVAzeWVTdWhFNWZlN1M2NUxsTktjblFkWStD?=
 =?utf-8?B?VEdjMEZxK0R2RWc2c0JMQUp4Zjk3TE8rdDh2N1NhaCtvUmh5a25PL0tLREhT?=
 =?utf-8?B?UkZQbk1hRFM1MEw1ZTFaNXlFU0RxcTAyZ1c5QldVYWZRbXdFNGMwMzRZcmdB?=
 =?utf-8?B?c1ZGVmR1ak5YLzRoeWo1a1c1R1N3cHZFNWxNeDZKNFNiZVQya2FKam9sZ1BG?=
 =?utf-8?B?RWtuS05HNGI3QzhCazB4NG1ZY1BHZEZ0aiswemROUFBMSm1FbkFxYTcxUEE1?=
 =?utf-8?Q?fwax3rNc6mOB2zRQ2lBeSrTUgDAt+c5g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2w5cVhzc3lyZmplczVIN25RRU9aZ01Gd3hKbnVGTzVsZ0dFbkM0ZTd0OU4y?=
 =?utf-8?B?b01kbXlCcFlzNHFpbFBQQjJFRURaVFFoVkhUM0ZqME9wbGlZRklPeHp4KytP?=
 =?utf-8?B?MitmSkEvWmR0VDJzM0dmM2JESnhZdmNobmNBUHcxdVlRVzkrOFdYeXB1dTZl?=
 =?utf-8?B?MnhxZ3NsTXY1RW5ud2ZWcnRwdk8xUjY4YzRnK29Ib2VvSGZBQVhXZmVKWEJM?=
 =?utf-8?B?V1JVT0p0eUpWam56VTQ0TXdiNUhFOXlweGJJbVB2VUtJQ0NHaUlMek9wVzNo?=
 =?utf-8?B?RlBBU0RRbndWR0tjQ0JscFZhQlBZOVlKUzdKb0VRTE9PSnFKeWpKUy9WOHpu?=
 =?utf-8?B?cS9RVWF4TmU3R2VNVVVubkpDMkhOOTVSQjdJOWxGVW9aOUZVU2VzSUd5dVNv?=
 =?utf-8?B?bmRYdnhpcGtJOGtYeVZDZUZ3aEV0UjNjbTRoQlcxZmRJWVdFQk5pcTF4V3ov?=
 =?utf-8?B?bWNuSHBZRmpncUc0c2NPQ0FTTHRFQ1FVSlJaWWFaQW1BcndTQTU4VnFwK2RT?=
 =?utf-8?B?eDBISkNKd1dKSTVUZkxPQzlKTjJyK3NRN1RieThkSElQZ1hRY3gvSURlc0s4?=
 =?utf-8?B?cWh1QUcrS0c4QkdENkhDNUJ3amJZUk1jOGEzaEQ5TXQxcDhzOEdIQVR3TEU0?=
 =?utf-8?B?WnB0UTFKSWhOdEQ0OHVkR2gvZ29YUXFZbGRXbnVpMEY5c0lYbk5LV3c0aXdi?=
 =?utf-8?B?cHFTNVQrTnRDL1lnQ1MzTUw1ZGNzeFBvSVo4elJmbmpuTjdjR2NoZ3B6N2Rv?=
 =?utf-8?B?eXlUL3pRSXphSzh1OFd3Q3lraUdETjh2Smp4NUNjTUpwUUVPUlRuamRYNHFa?=
 =?utf-8?B?NmVaNXIyNkxoY09pc2tJZ3k1RTN6RTFJQzZ5K21xK1lSUXBVWVZ1VzVZbWlB?=
 =?utf-8?B?V2ZoWklEa3Y1NU1jNWp1R2tFL2Y5andOQnFiaDNnRlJyNkV3V1h0eXpNSUtt?=
 =?utf-8?B?SkFiZFp5UGMxK3hJWUxWSzFjUXVZU3VxR3FtMmVHNU1iVzZRTE1oVkY5dHUv?=
 =?utf-8?B?MkhHcklGQjdsU2lRZ21LV2RPa2crQzJsbG5BTlk4bjNqRHBiSElBQnNpOEpv?=
 =?utf-8?B?TnJnS0dlbTcyR29YSlVySFJNbmhGR2ZiTk9VS1VXbFc0bEgxaDRWVVNkb21a?=
 =?utf-8?B?UTZ0cklvczlSQUhRcTgvbmF1TFFnNTBCNVEvL0FhOWpJUVdja1R2eTFEeFpz?=
 =?utf-8?B?eExGbkhaMk1UU1JsSU5XSW5MNmNNQzJicG5xWVZIRlV1M0ZJWVZ0UTgzcUhk?=
 =?utf-8?B?UW5qdGczZitoeHpkOWtZcGd2YjJldjQ3cE96TmRJQU85ekgzTmNmbFZUMFlo?=
 =?utf-8?B?Q2pnU3BmcXhMUFRJK2E1RS9jM1U5UW9CT2MwRVpIT1g4RzUzYVM5VmJOZDRj?=
 =?utf-8?B?OUwySTZ2c2kyVGQrL29LRGpRMzJGRDlKUVFPeG1BY3pqcnU3MEdBaVZiaE1D?=
 =?utf-8?B?eTNqVElONm9JcGJlR2lkNG9GNUo2RDJyMmZ0VVRYNmVocUt5L21WZnM0RHhX?=
 =?utf-8?B?ZCtVQTczNmdmWm9HSWc0aERLejZUZnN4YnlSMU5tQkFlYS9tU2JPWEhMOStO?=
 =?utf-8?B?cXNtK21nczgrVDZHYkhqVFFtQlc2WWxwbjBMTFg4c0gveDNPeU9KRkZBaHZz?=
 =?utf-8?B?U05RM3R4cWJmWVNXVHUzMnRJZVZxSytGZ1RZTnFjSlBQV0JvdGRjWjZSR25P?=
 =?utf-8?B?bTJHVnlveHcxMndtTFdKcWRQcTI3Z3RENi95ZnNXaTBKY3d0UUdmc0JrR1Mz?=
 =?utf-8?B?WnIzY04yR3RoZm5FLzJVSkljRlVtMHN4OWpHNUp3RzU2Slc3VThrK2pFNkNK?=
 =?utf-8?B?cHdoSkZTQmpmNkFvVm8vS1Q5ZmNKZTB4cVd0NU5tNiswa2YvWXVLQ0xBWEV6?=
 =?utf-8?B?NHJZb1lnN2Nvb1phZ0lZS1NHRWVyWnFuNU5PT202NkxhVUFRM3lybW9zS3l1?=
 =?utf-8?B?WllRVkJINEw5dEM4TmRWUmFrempVRm1sM2NMQmUyWCtXa3d3QUtiblRyVHR1?=
 =?utf-8?B?d1NrT1BHRWN3azJ2M0szTEx2TFVicERndmNsd01nSDlDaldKQWxRODJBTUho?=
 =?utf-8?B?YmQ1UWlLQVU2Z2Z1d2U3WllhdVk5OUsvYXBUYWt6QUZ1aS9jekZ1M0ozN045?=
 =?utf-8?B?dTI3Wmw0Rk5uWHRCaTE2OE5xRzUyc1EvS3BWRDJPV1dKU29oLzJXN1UvMFp0?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5a5ba6-4e71-4689-94f7-08de2126ce85
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 13:32:49.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INlpwP/CUIi8vq2GaFanIOXa0vk7evUv6KZW4m50EfV4htOlfQQq2AB7bchyYQSKpaW9utRnJ+Lr5SBkg72WMReWVc33sPIpdNdymTt+IeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7289

On 29/10/2025 6:26 pm, Teddy Astie wrote:
> Introduce a new flag to force the x2APIC enabled and preventing a
> guest from switching back LAPIC to xAPIC mode.
>
> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
> architectural MSR of Intel specification.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

You can do what you want by simply starting the VM in x2APIC mode.

OSes don't tend to switch out of x2APIC mode, especially if it was set
by firmware.

IA32_XAPIC_DISABLE_STATUS is garbage.  It was an emergency "fix" the
fact that the entire L2 cache datastream was architecturally visible in
the xAPIC MMIO window, included decrypted SGX contents.  Furthermore,
upon this being discussed, and it being pointed out that the proper
place to put the lock bit would be in MSR_APIC_BASE itself, Intel
declined citing "too much effort to qualify".  So we're left with this
instead.

We do virtualise one Intel control on AMD for the benefit of L1, but AMD
have finally grown CPUID Faulting into an architectural feature so we
can see about retiring the old bodge.

But, the Local APIC is far more complicated, and which mode you want
depends more on which hardware acceleration is available to you, and
there's a huge amount of work needing to do to get our x2APIC support
into better shape.

Either way, start simple by starting the guest in x2APIC mode.  It will
probably be sufficient for your needs.

~Andrew

