Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBBC86333
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 18:25:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172158.1497253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwmT-0003Id-Gw; Tue, 25 Nov 2025 17:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172158.1497253; Tue, 25 Nov 2025 17:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwmT-0003H9-Cy; Tue, 25 Nov 2025 17:24:45 +0000
Received: by outflank-mailman (input) for mailman id 1172158;
 Tue, 25 Nov 2025 17:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48u=6B=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vNwmR-0003H3-CT
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 17:24:43 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f837e7c-ca23-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 18:24:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7794.namprd03.prod.outlook.com (2603:10b6:303:275::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 17:24:37 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 17:24:37 +0000
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
X-Inumbo-ID: 9f837e7c-ca23-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX+7WrSVIym49y8O5CetLQn/ps5M/TzmpoOCfFzeXxQOR4tTDJ1cVbqUA2qsfcIReS+m/SSCkbbif7PYueTawKAqJblQK1BqNscynLmFGQ6tQevm51OSDo+gkEVoSY8wXe7h5sfe8S0sDN/uUD6dYI7NxeptnmZkM3XhFyVFHXTGKhdPidI0H4AtJY166owXqZ8cNotg7+vvHaxLIGbtB3OuZlDbjZFZLK4pdb11ehPgNlWkdgQDNdqEpzR36AvtSXs7Qa+pT0pZd3Ga7oGoTCpJfDX6ClLppQ8siGUvk4dLOnWi06cEW2G1wRS3D+yIPyVRucD16W9epac1fhl32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82Nr1QtprmyVkq/uCWrAXpoJhBR38OblQagN9mP0CLE=;
 b=Z+N/v1vyD2UqtmOKPEulaRbIemedPWkuNoZoA06F4QkJgKyn6bouZ2HBamAtUJ/joICdTVX5ovL+vEMpZ5xYsB/jGCaWmdNIdyyRsgOZQn+K0CGMYWh+8p0y+otSsReRnzOEZDE4W/N+8PGnxgnykLTC2rpgThRNWtPRe7bIHumxB5D1VHNcXCzBYlCR/58wrkR4Qyv97E4dem4F6n7LF9aOSHVpUg/2sYD+FH1QB1TJEa0YEY9cOUSJnsqoyy79wEhOot/v0Dc/vpOVG8IbWTq27Th9svsanq1nRi07ss+014C7W28snbYQQy6/OLuWFgsA1FzTtg5cAxw7MoMsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82Nr1QtprmyVkq/uCWrAXpoJhBR38OblQagN9mP0CLE=;
 b=pIRVQWgMk1UVIQiSjtXuwBvXfYMR9ewxDCBixj/gxq64Zuo3sJd3DbuiLD7DwAVI3jPHDAiy1bQ0A0ZqU0/hLnSeWjAC01WikiGGTjEJ4PitFqmgEBUOoz4k4C/qHiq2Vrt9W24NqQgPO9Sw4gjnSK73Z8uNYrPXkCZ4JoUVXtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Nov 2025 18:24:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 1/2] symbols/x86: re-number intermediate files
Message-ID: <aSXmUQYAk-oeArIM@Mac.lan>
References: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
 <8d6642b9-18ec-4fb9-8e21-96d6efdbe6f4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d6642b9-18ec-4fb9-8e21-96d6efdbe6f4@suse.com>
X-ClientProxiedBy: PAYP264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: c77d5a65-3913-41db-9542-08de2c47823f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1lZbm5wK3F6OHhtZTVnbnhTOG91YnRHd053S0FrQTNZK05Mb2R0ZzBrdU9H?=
 =?utf-8?B?YVNRWFc0SVlDRUJXbnNBcWhjd1Q0dVNmNTIwODdxK1JOQWxoRllBUlBCMkNL?=
 =?utf-8?B?VTY3ZWFNSXlGYU1ZcG9wQ1pWTjVDVG1IK2tTUjZNZ3MvaXlwTDdRTWVvZkYz?=
 =?utf-8?B?WHQ0RW03cUlPYmdUVkkzTWtQRXdlcklKOWVPVFN3Z3pXanN1K1pyRjFZS2Ni?=
 =?utf-8?B?OXlxNFBlb1p0amNLRzZNVUlpMlplS0dqNEg2T0ZIY3JjdjlXN3daWndLMnlE?=
 =?utf-8?B?b0E4bmRKZmZHQXlqSGNqWkhJc2Y4YjdEcmFhU0l4eUt0Vkpma1FZcjErZE8x?=
 =?utf-8?B?dFVOQXNLVnVXNGdLQ1pyR2hpQXFDU2Fyb0plOWNyN1NTYndYUXV1bG9wY3Fy?=
 =?utf-8?B?cVI4SVVPc09JWHFrVXovdzJYSlN4NCtVNFhJcVEyc0ZCT2Y3SVhwMnZwMm9D?=
 =?utf-8?B?K0h4amJrOTVUMHJ3ZkNqMTF6eGxWaVp6VVdOMzJRTU1jdFdIT1JCYWlXUWZI?=
 =?utf-8?B?bENaREJiRlJmSjRta2YrM3pZZHkwbSs0cEpWM1dFQlBQbmZ1VWNCRlU3Sjdx?=
 =?utf-8?B?UFp4ZjczZmFSbERBSExnSG5HR2JFZ2p0d2NvWG1rMk10d0QyZWhtRVRRMkJu?=
 =?utf-8?B?WEdlU21wMVQyMFVrSWNzUzB6K3lieHNuVzRzRWowSzBOTkRkQkNmNngxYldV?=
 =?utf-8?B?T2MyaDhZSXVCazVET0huaWJzcXl1VXhjdGNFaEk1VW9MKzdmN3RjYm9VaW9F?=
 =?utf-8?B?OFhwYldqMHFPLzkxOWpYbHFyT1dZdXJOOUZacTd1elVtZjhZcFU5NzlSSU5Y?=
 =?utf-8?B?cjFKK012OHE1N2Z6R0hzNHV2NGp1RG1xMEROcmlzTlgvUVV4SFJyZlNTMExw?=
 =?utf-8?B?dm9NVnlWcHRwelNVek9JQ3BRV09Sd0d0WEFDRzk0cEpqRmYveDNxRFlLT0Iv?=
 =?utf-8?B?aHUrSlM4SWxJUmtTWXFJa3BsZVVBQjVqRlpSZ1NkL3JGaXhlRFVmVFNZZGc4?=
 =?utf-8?B?MThObS9OS1RJdGtPTG9COVpxVUpBamgyY3cyVUVpWG5mRmdmbTNhWHJZNDdF?=
 =?utf-8?B?cjBMSTNRVzA3cFBTclltWStTS3NFN0EwSWNSZ2ZTT0ZUYllkVENrc0lEc0dV?=
 =?utf-8?B?aTRTMlVUVGc3bTNMVGNMaGsrb3VrbnQyZEtQM2prWElxNTlnbVZkNVFsOXR5?=
 =?utf-8?B?MmE5V3pwWkI0Z1BMcGd2cEl6c2tRWmxEUTNETHhtSGZ5enVsMnlEeXI2bEcv?=
 =?utf-8?B?QjNKUENQbkFJWVNSaHlRV28zaHg4NDFvT29FWGZJVGVnSzdqVjhua1J6SGpm?=
 =?utf-8?B?SDFiSFhqVXZSU2EwTi8xa3VJckFSTVlkWE1SWkg5T2VFZk04elQzRVR3K0pv?=
 =?utf-8?B?bndwZVJlYjVGY1BRdXRtcEZOekhrUGk3dXJwMGdlMGRpa29NOHhZMjVsd0U0?=
 =?utf-8?B?WTM0b0NXQkE5cnM5Y01XeUtOcnVFcEJDemIxb3NHR2hsK0Q2cnlKT3FEL1pv?=
 =?utf-8?B?UmkzVTVvNWpzSVJaSmxOVFpIbkhXVGJkcnBNYzNoWVh1cDFVYTF1eVZPWEhl?=
 =?utf-8?B?TnBSdGl1K1pUclU1VlEvV2QrMlhEak1jVUJZRGxmODhFTzkrc3poeVRWNVZa?=
 =?utf-8?B?b1hrOTMrREd3ZjVTbWpIU2tWYXZqZDNFeEN1cEFzYVZ5di82SDVxNEVaZ0tE?=
 =?utf-8?B?TlVBd2F0YUgvMHdwVEQyaHdNZVBFRDBvR2xZVzF0YzlrYzJwQnJGWnZFaGF1?=
 =?utf-8?B?eTlSWUZBcjZiV2VLWVBpT2NEMzVLWDZRcUdsTU1yY2pIL3RWd2dSUkI2K2Ny?=
 =?utf-8?B?M0V6b09PR0FIZVpUV2RlWjErY3dWSXNnLzErNWhpMkZFK2hXMkJlMkpmZ3g5?=
 =?utf-8?B?K243UU5QRFo1SHpHalhLTHZwSUY5M0g0bTZMS1ZoMVJMeTZWaWVvVEtKR1hD?=
 =?utf-8?Q?2w97Ufpx0aX26XOAVN1QYGqeX8IEViuq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjBncEJodlluSGl3YklXZDdTN2svaDBvdWVGbEdhNjJML1ZSYndEZXBuSERZ?=
 =?utf-8?B?UkVyZVh0VjFXeGNKenBhZ3p6b2JaY0pyVjhPenhiVXd2ZndRL3hOUkhZcWRj?=
 =?utf-8?B?SVgxQnlDM2VIazgwdHdoTTRHZkJycXpVN21nQ1QwT0x0TEpoNm1QZUNrUnZN?=
 =?utf-8?B?U05PT29OM3Bwa1Y4VytSc2Z1T1ZGaEVPL01mWUIwREo1Tzl6STc5RjBPZklW?=
 =?utf-8?B?ZlFpemlMOWlCUjI0TENhSFAzWElxMmlkcjlFUTB1b25FQUtCZ1RCTkZlWm5x?=
 =?utf-8?B?R2x5bFZtWDJXWERiMFArN3duVWNpdE5ESkVJMjVBY0JiKyt0UDdXM244eTd0?=
 =?utf-8?B?ZzMzWUR0YVFTUWw1SnBXTEp3OGRoa3BiODNMWjloaVV2MExCSFpkQStoWUJy?=
 =?utf-8?B?b2dPMlNVSFZ1eXlGa29ZclhTU0NnVU1DM0VzY2x5WFJqTmJUYlUvZG54V2U4?=
 =?utf-8?B?dE9uaEJzNDJGTzl4eVUrcEZYbTNTR3lWK0tLQ3JjRU54TGVRYkxxYTVkYzhm?=
 =?utf-8?B?V3BEYml5Q2tqait5d2RvbWdEVnhQaVdSa1hqcXhJZHBhTFhRckh5S2Q3bkRk?=
 =?utf-8?B?OHpTUWtCNHc3TzFocTNWcFBRRWI0R2ZUUUdmb2dEbjNGck1xRVRicVROeG40?=
 =?utf-8?B?WUdXSTUvejhMenlONjQzL21CdnJTTHI4QVl3WDRhejNxTzZ2VThPcnB3T2xN?=
 =?utf-8?B?ZTNJZWlPK1NkVUd3aXM4OEczLzhkb1R2bm5teGxIM0ovcGNLOTVMRU81V0xn?=
 =?utf-8?B?bndxeVhjQXZBanVLQ0UzVHdCb1JMKzV0VThmL0Y3VUcxQkVZYXdwSCtOSklo?=
 =?utf-8?B?SDBERWF2UG1FdkFZWkwybi9QYk9yRW1Sd0ZkOE1pMDdoQXFGQTZ4SnJuRlU3?=
 =?utf-8?B?akR0ZUZ5RjlBaHJlRnA1d3FFUmVLc0hieWYrMlFoM0JScVF3Z1hORmZMbWhF?=
 =?utf-8?B?YTdoT0JBSWw2a05tQjRqKzh0NmtMaFk5NWtIeGpaVHdRQmpZaHlHYmVwYldw?=
 =?utf-8?B?amZndk1PS1diajdzYk1NbTI5aGpZZ1U2R0ZIQk1QbDhjcHF1QWdBemRWWEtE?=
 =?utf-8?B?OUdCNlREMnByZnNxS20yRVZTdXYvQXFueEliMzNzK1VQS3FhbXBrejlDMDRt?=
 =?utf-8?B?bjhtNTAwMFNQL2hjWk5pcGJrbDg5YVFCZWNrb3pCVXZGWGhIa2JneVZpQXB2?=
 =?utf-8?B?OVNmN3ZHRFVZZmtZRE9LeFN5N0UwV2Rtb0lNWDJnSlU2aGVhZTBEM1hpWGU4?=
 =?utf-8?B?eks1NFBQaVh2WS94S0ZlNStuYUpYTUVYZjc0S3Y5MVM4OU5FbFIrMHAzbGZU?=
 =?utf-8?B?VlhjNEI4K3QzUnE4MHJrb1JlOEwzWW4yMkx2TmRJLy9yTE9kR2hadUNkQUNL?=
 =?utf-8?B?OFlnQ2NDbzFGaHlMN3BMLzJ4Y2dJdmtiSEkrMUg5ZDN1UU1odFlXV0NrbGFp?=
 =?utf-8?B?QkkyNkxjM2FxMkkxQjZoZW1HY3JOWFpab3BLSmJCbXBzOVdYM0pPMUxoV1N4?=
 =?utf-8?B?bjAwYXZQWXF3VnA5NTlaTGQ0TWpscllrdzhJQU1aSkMvRWFPalNiNWNDTDU4?=
 =?utf-8?B?RDE0ejZHUmVnVEV1V0x4bkhCc2l6RmlScXpEeHpGMHBzRjdJaGdPdmlLYlFH?=
 =?utf-8?B?U1JVcXcvMGlIK1NCaGMyVC9JUFgyTytrSnRoemxLN3A3Q1RoNkRuS2ZmWDcz?=
 =?utf-8?B?SWd4OGgvd0ZtVWpja2w5Z2FucTlBNzhMOFlYQnB2b2h4T0lUc29DM0xkQUg2?=
 =?utf-8?B?TXFCSElhQmZ2SjRWVWRGVHF0UG53eWxRZWxpUWxpNEQ1NkIxZWtYbEU3SHFB?=
 =?utf-8?B?VDRhWTZmTk5BVjNWcUNJYlh6UnMwTTBSaWt3MktldGJmMlRTV3dkZGFuRVF2?=
 =?utf-8?B?S0syRGhmbno2SHR4Z2dRMmc3QXNPZ0RmeU5SaThzT0VidTdWYXk0eFVTaGlu?=
 =?utf-8?B?RXliTDBiTXlZR1ZBYjk2M0lWUmc3RDdxNlRRQTdUM0hVT2JSTHlpNXRPaW5t?=
 =?utf-8?B?M292bVphMFVwYWZNbmN0ckZXcFh5R2pNcDljbGZmQUJ3ZjlWMlpvZ0ZWTXRS?=
 =?utf-8?B?ZE8vVnBqUW41TC8xQnFIMGx5dkEvbmIxZDFRdmY1N0kraXh3VW9DMDI0ZEhn?=
 =?utf-8?Q?yxXS3f0O/tHGiRHmhLMQ8s/Ep?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77d5a65-3913-41db-9542-08de2c47823f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:24:37.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLBE2A/q4giJVtDM6MXRF3G7Ijs+PqfaWyest1sp2dd/MFsX5dLfxz2mDme8E6NbTjCnzfurk9qlcOObczRU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7794

On Tue, Nov 25, 2025 at 03:13:28PM +0100, Jan Beulich wrote:
> In preparation to do away with symbols-dummy, re-number the file assembly
> and object files used, for the numbers to match the next passes real
> output. This is to make 0 available to use for what now is handled by
> symbols-dummy. (Mirror the numbering to the intermediate reloc files for
> xen.efi, just to avoid confusion.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

