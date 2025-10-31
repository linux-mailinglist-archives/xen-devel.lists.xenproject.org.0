Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DBDC24A1F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 11:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154170.1484279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEmls-0008Po-AE; Fri, 31 Oct 2025 10:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154170.1484279; Fri, 31 Oct 2025 10:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEmls-0008Mh-6j; Fri, 31 Oct 2025 10:54:16 +0000
Received: by outflank-mailman (input) for mailman id 1154170;
 Fri, 31 Oct 2025 10:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vEmlq-0008Mb-NJ
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 10:54:14 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7a437a-b647-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 11:54:13 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BY5PR03MB5217.namprd03.prod.outlook.com (2603:10b6:a03:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 10:54:10 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 10:54:10 +0000
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
X-Inumbo-ID: ef7a437a-b647-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJJn89nyx7rFqs7v8izAAy/hj9cJ0l3ACnbY8MmBVYHVvP1R/0NiMNVTpDDMz9H9c/yxDpbMoJjP5LNPmD5yv1cnRnTH/VP2rr+tS00B9ROT7DTA6zdtb86txWV9nfFzEAOdL0OTqHLxJtGIqoTiOikFXlZ1tnANwIryNz5vJ4eK9UCkLG+HghqNb994YYPquvBu+iQ2RtM+f1g8iDOrtF+t05JA31EOTadXQjQpNUTA5PXxpJsqrDqwpvKXAGbDPDsSjO02yExn4EiQHvPzlb1Dh2Y6cCgPWQFNNQ3/n7MvririrX8VMZmoABPr4A+bTBMKdneeDi/w5JkXn7ygUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxEqSoxAfuqXaN12M/HaAOBAdOoe4YwaxJ3x1Z75AOQ=;
 b=ekuGim6L4gCke0Y6g5i1cdWyG86APjc+CjskJqo42t5Q46yaNDX9UkhmxkHo7nn2iwKj0HawPEzXL0R+sKS+KxwMQpxIlfL11SHpiz8syQn2l+hawgMQTFy95FPJui7N7MIF+01mj8b6icf71Fz++FWJFrYGCtCk/+fgPXJ+34Vr7z957Cmd2u4rPTUd8AtGCUEmE+ZVBMu5aCYrEkuOrgmUbsveRi7sqQqI+N3it0JUsMGb8QKFFzY+BcPA6umU7xIcOXIdoGDZXfJDFtL3n7SKs+HVxrNmZ4OSzZxHTqakbPsrsoelRyrH3aDkyxTr5OJl9cf6QwjWxncwBbMLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxEqSoxAfuqXaN12M/HaAOBAdOoe4YwaxJ3x1Z75AOQ=;
 b=ntq5NRYefNxjVOrOoeBoueOZ/EommCOFBQsU43Rmo/tdCqgsjxli2CMI2oASQK5A7mhKrgCSp0t8xmZoEQadMuaNKDj7zTUDzMwn574aq3PYXA2wXtgIr5/IIq7IDxrAXTahcQNjLpq3yk+6AgSsTiCP3Lo6MpGYhLkzwJd76UQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 31 Oct 2025 11:54:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
Message-ID: <aQSVTjh5xiib-u5D@Mac.lan>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan>
 <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
X-ClientProxiedBy: PR3P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::20) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BY5PR03MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 057753f3-d171-4600-9665-08de186bd20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L282cHRzZ2RjT2xBTXdUYkcrRmk4dmtDNHJPaHpsUFRJMldBK0F6aTd3WWl6?=
 =?utf-8?B?c3IvVnJzNm42dzFNS0VLaVRMcmw5YW9RMWk5dXZZSmNMbW1wWEJUbnl3TXl0?=
 =?utf-8?B?Sjl3Sm5yZEdPOXZkRjJQUlMwRU51UFkxc29heFc4VDFqTkp0ZDRRaVMzVlk3?=
 =?utf-8?B?MjR5YWZqUnJwYUN3UlQ1Y1NhRW1na1M4U1NmM0phOTQvR0Y1OUVKNEdhbjh6?=
 =?utf-8?B?K1dsU3pNSXdMRWQyQmRGRFV1UTc2YkorZmJFVVFRT1lOY0RTOXNESDFXcUtl?=
 =?utf-8?B?RXh6TEt1bFpnVnp1bWtJY01TbTAzOUJJeUw3YjZiNDRUWlRJMmtwYU1mbHVF?=
 =?utf-8?B?OVh4VUR2Y2xyWVVld3VOV1NJUEhjSDhHNVBURXBMV1V2eHhPZ1NaOTY4N1VN?=
 =?utf-8?B?NWR6T0dSM2tVU0czWnZ4ZUNBZ2k0RVFSZnkzSkJJRm90Z2dETVVsMU41R2M4?=
 =?utf-8?B?dEtodEU2SGx5YlNUWW9Ec3NlNmM0R2YxbW9YbEJvQlY1UGEzcGtVRks5cGVW?=
 =?utf-8?B?QWF1NWFFQ0tDc2F5R29PRnRkU2E2L1cvcUxLVVhIRWNYQmxMc2w5Q0p0aEps?=
 =?utf-8?B?VWNleURlWlFWUDFQWHdUVnFKT0xJNHd6eGZIdkRFaUtkSEgreUtDcE5LbGl4?=
 =?utf-8?B?N2F3SkZ0dkhSS1JibDBHZitDMUpUZFhvTjJPNUNIMnZNeDBOcWhBdTlHa1Zl?=
 =?utf-8?B?WGY1aHRBR3ZRbFhESXJhZnloOTZ3NWp1a2cvTkI1d2M5RlFwRlhWWEVtMXA5?=
 =?utf-8?B?R0d1c25aekpPd3FKMHRiemtJLzl0MGRFQmxUanhYRmdlaDIwZmRjZ3NEd1BY?=
 =?utf-8?B?dERHRjlZTzZFd0FxYjc0dnJLUlpWb2VTM2FKQWNWWUo2REs5R3QvQmpuN290?=
 =?utf-8?B?STcxSnRsKzNsQ21SYUkyb1JVVXptcXZlaGNDTnZJRXV0eTBPb0FzN0w5T3cv?=
 =?utf-8?B?SytCeVBLdXJDZmhnSFdqdFYwUEh0ZTA4VnVLRnlkc0FaLzRiYWN4NVZQZ01q?=
 =?utf-8?B?K0I3WGMwVUJCdnhLbmE2MjZNOFlpQXlKTDI0UHFmNmFLaEordE5pdkhYUmJC?=
 =?utf-8?B?aFJZU3QwSklMcWtVZ3ZLUFBhaEZCZi9qdDNMRTVBWE9NeXY2U0pmc2dpanJW?=
 =?utf-8?B?dzFvWE94MzlwN1Babk1WR2dFQlRjVS9UQTFSYlNxSE55a0pZSS9GSFk5aFpL?=
 =?utf-8?B?K2NEV0JValpwWWVrTE00VGQyN2lqdzZqaVkxRWJ2RU83TDVSQmFLbEhiYTRr?=
 =?utf-8?B?QlR3enZmMnVGNWZmQktPVDc4QTNPZ3BWc2ExVWRqS1JlVW9xK25xVDRMZUJI?=
 =?utf-8?B?WGMwQUFjaEU4dk0xUDNWQWFwemFQODZwVUVZSWpsS3BkMkNwVmhKb3hkblkw?=
 =?utf-8?B?amlVSG5CMUJKcldOOThDUjdVcmM3MTd4MHovVXZXUzVGYXl3NlNVTWZia0pW?=
 =?utf-8?B?RUNmTkJkNFpsdVRRVG9nVTBXbE9vbm5zcEJSQUgvb3J0M3hiYnd0SE0rV1F0?=
 =?utf-8?B?WE1lVzMyTWE0Z1JpK28yemJNeUhGaHY2YVN3cEJ5N3U4UWxJcDBadFBmTFIv?=
 =?utf-8?B?ZDUraWNxV21mSGZ5WDFaZ2ZIWEpyVk5kaVpzMlVocmQ3ZG0xMnJRTk1oTXFu?=
 =?utf-8?B?RXlsYi9HVEo3WE5kZXFGMzk4S1VySGc2UCs4WkVZMHh3L2Q5NjlCb2p3QXdT?=
 =?utf-8?B?cVd2djdPdWpJVHRmNnFGT0hVUHczZjVHSWR5R21nMjRRa1ZNdk05dWQxYXJE?=
 =?utf-8?B?WDhOOHRReENjenV4aWM2Zld4VjFiWjJhTlMrSnlJaDk5MzN0Zkw4N1lwTWVh?=
 =?utf-8?B?UXFUbGF6QjM3MlFNVUovd1A5WmZtMjdMdnhqYUZBNldPOTYwOWhXM3h4VjRi?=
 =?utf-8?B?eEZXN216eTQzekg5Y1pJajZSQmNIZ3RPZmI5N21QRERWZlU2Z3VueWhleVJz?=
 =?utf-8?Q?sSkJWASON+NVjtqYlC13j0AQUPigF+ii?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFzV2pQTnMvRGUrL00rQXJ5T0NHcnhXamZVZ1QxdERhTHJ0bGllcXlGckxY?=
 =?utf-8?B?eFR2YzFDTzRDVFdMR2RnRjV5VFdQQVRPM0tpOGlZUCs1dW5OQ1VrY29ROFV1?=
 =?utf-8?B?ODlhbFg2RE52MlJsVTJ0SjBsdFlFc1RyUWp0M1pLV0hwT3JoMUlsdlFGZ1RX?=
 =?utf-8?B?Z3VKOUlMTzdpY1pkSFhJZGhKQmRPNFlSanlIS2lwWVVSdmlNRUxhSDF1L0Jk?=
 =?utf-8?B?MUMyakFEYm9KYzBOOEg3UjJpOVVSR0JmcWhFTzREMS9BVXIxd3VFYnFtcXdy?=
 =?utf-8?B?NElCZ2ZwazRmRU9maEdaYXFjUVpaalBlVTcyUzEzZnNoZlJtZ01qa1ZMY1Nm?=
 =?utf-8?B?U1A3OU12M0tNN3YvamhsZDRSMWEyOVdBWmN6NGZCb056RmhuSlJGSTBrWnhr?=
 =?utf-8?B?ZW9abEd6cUYwTlRHKzcyY25RUUdIWkdtdml1Rm9IZExNbHk4UWZrRTQ4T3NS?=
 =?utf-8?B?UWkzeFdvQjZva0R6UTFSZUNMNkxIK0dzRU5seXFNd1Zkd1NzdTNZT3U2b2tB?=
 =?utf-8?B?VTdZZW9jT0paZW5lYlpVTFcvNUxBck9lSm43Vlc0dGZvTVl3bXlKQmEwdkZw?=
 =?utf-8?B?RUQyQUQ3ZU96dWxoUzhpUHJSNHpjWmQ3ejB2WXIxblRTUzNmZ0pyQnMzRHJo?=
 =?utf-8?B?U2FkN01qQVQ1SXhXMFFXY0pRdTZqYXloUTBoeXFzSDJ4bThwQ0Y5aTZmbStN?=
 =?utf-8?B?UFc5bmU4TXpXK0ppLzlRTGVUU3lUaURHMUh4RGlVUjFZcVVLeCszeGlDSGNh?=
 =?utf-8?B?b1lmbEx0SnBsdENqekNpWndaSlNnU2VHQThWTnJ4UGE2OW5NRXhBTkZ1ZnBL?=
 =?utf-8?B?cjU1ODkvS0ZaQythcW1COGtTNncyUzZueFYrQ0ZmVXNzZFltcUZPc054ZXJw?=
 =?utf-8?B?SW51SVM5ZTZjU0p2d3VQMHlScUVCeVBBSjVTTTJpdXlUNHl1b2kyR3N3eU1M?=
 =?utf-8?B?dW8yYXR0RXlWdWNvWittRnRzYkM0OXBTVjNNMzBYWkRiOU51dVFmRzFQbEwv?=
 =?utf-8?B?RGtMUE1WWmo3cGtXYno2V25tMnBiOTBsQ1RjVERVclhNRytxVDZ3bEszSlQ3?=
 =?utf-8?B?ZjJ3YW9tTmt2Z2hYU0lFUmNYWHhUNGdFT1hVdTU3YWdzOWFMb0xKdmp3V0Fz?=
 =?utf-8?B?SkRqWi9oUGRkKzNqeUNibTIyczVvUXpRaGpKTyttTnM4TGFqZ1o1dmsrNGcw?=
 =?utf-8?B?UTd4YVRXd1pNbktxdnlEREVZY1cyckFHZVN6dDlCazBnalpDZGxwdStBdDFE?=
 =?utf-8?B?QUZEZzh6UGo0dnoyZmxRenBSemRpMU5sT2h0N3ZVQU5kTTZXVUlnd0lFK3Ev?=
 =?utf-8?B?Z1RHMVE4Sk90cVV1SzQ2QzM1WCtQNVJHbjY0RWFESVI0OVFQcVlBYlNMYXgv?=
 =?utf-8?B?b20xQVY3OHl4a1JraGdYY0F5a1ZYdGM2djJiZUNHL2VzdncxaW5jamRzbFds?=
 =?utf-8?B?NXpEUXhzRUZOSmRQeHhDMnBLbXZaUXB0NFBPRS9sTSthNlRIeG8xUjVGN2pq?=
 =?utf-8?B?V2lCNFlDcmhHaWo5dzBUaCtneVBGWkZ0SS8vR2k4bU0rbCtqUG9sYmxtVEVk?=
 =?utf-8?B?RnFtOHhJb1FsU1FtS1ZyZmp3S3IrWUUxMkF5OE9BNW9aQzhMd3paU1c4Z0dY?=
 =?utf-8?B?cnBLRDdiZ2hnUkNtOVh0ckF3bnI4OEQ0MER4djdDOU9nTjFicW5rRjVOU0tK?=
 =?utf-8?B?VlFhQ2l3ZlVsUms0cnFVQklzV3JnYll2REpPQXVWZ21kd3RrdTBIekdpS3Rp?=
 =?utf-8?B?aEVSOThJd1lhVXc3WXdtVlJHVkZnNU9Cbkprdk0yVmlrUzY4V0c1S1ZNQjRm?=
 =?utf-8?B?Z0ZGbyttZW5kUmx4bnpTUUpoUk56c1RxbkExc0VzdTR0L3o1akcyVHIxU1B3?=
 =?utf-8?B?ZnFBQVJUTHFuUkZkNkpYaDdqbW1SSHQ4OGlIOEhsYVNCc2JWYUF3YmFINmtQ?=
 =?utf-8?B?Z3prVkxaZUVNUzZVL2xxUHVJNVlBME13QmVoc3dOUVFCMWVlQnpXb3NtY3dR?=
 =?utf-8?B?Tld1aENUSnNWbG91K1dtRmk2eEN2d3U3WW9KSFYyZS9HL054NS9rMTZlNnRL?=
 =?utf-8?B?NDZ4bDA4aGx5OGxGc1RjMmtEc2VFaXVBTDVlZEZNMmhYN3kwSlIrZXdzRHVS?=
 =?utf-8?Q?2bPmBZ11yvjPcrlbWv4AQqIv9?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057753f3-d171-4600-9665-08de186bd20a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:54:10.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJqoBDHFOhorvKBrSXhsFKM3q3cygnOdWp7YRxuy80VtwrKrqlPfUCy0Pe2buxB2TjCorwjmG8DfEPBSD6xAaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5217

On Fri, Oct 31, 2025 at 11:29:44AM +0100, Jan Beulich wrote:
> On 31.10.2025 11:22, Roger Pau Monné wrote:
> > On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
> >> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
> >> place.
> >>
> >> 1: disable RDSEED on Fam17 model 47 stepping 0
> >> 2: disable RDSEED on most of Zen5
> > 
> > For both patches: don't we need to set the feature in the max policy
> > to allow for incoming migrations of guests that have already seen the
> > feature?
> 
> No, such guests should not run on affected hosts (unless overrides are in place),
> or else they'd face sudden malfunction of RDSEED. If an override was in place on
> the source host, an override will also need to be put in place on the destination
> one.

But they may be malfunctioning before already, if started on a
vulnerable hosts without this fix and having seen RDSEED?

IMO after this fix is applied you should do pool leveling, at which
point RDSEED shouldn't be advertised anymore.  Having the feature in
the max policy allows to evacuate running guests while updating the
pool.  Otherwise those existing guests would be stuck to run on
non-updated hosts.

Thanks, Roger.

