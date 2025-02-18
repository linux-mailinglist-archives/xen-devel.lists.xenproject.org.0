Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D5A397BE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 10:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891219.1300290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKLa-0005FS-AO; Tue, 18 Feb 2025 09:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891219.1300290; Tue, 18 Feb 2025 09:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKLa-0005DN-7K; Tue, 18 Feb 2025 09:56:58 +0000
Received: by outflank-mailman (input) for mailman id 891219;
 Tue, 18 Feb 2025 09:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=90y7=VJ=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tkKLY-0005DH-AX
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 09:56:56 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae963077-edde-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 10:56:54 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7077.eurprd03.prod.outlook.com (2603:10a6:20b:294::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 09:56:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 09:56:51 +0000
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
X-Inumbo-ID: ae963077-edde-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExKBfVHFyAKNXaVCpqA9M63cVUOK96U5xUEOim76X1zkhV3m5Y0CXFQvbvTpA/UUdpy4xWlky1vGVjl+w4jxtYZUX0kRVoFJfQHhSLuL99qHVHlJD6dbuGiSmxeo4nebTjDGaBoBmY2XVWfZDUXUlKUSWOYl3bQV3Nh3XusK6NIREGYsxuHqKUVvCMYbh+mzJwiMWr+kxFzTysORvl7jpVCdl9pC1iN1GLk45sJO03FfrZWPsPuqgWxZF1LLl3EpwwRPIj6v7KZLSfhJIMULNq6ehfvd3gwMfi3/N+VONSxEHcwUBy16bj7P3ZS/ZjbaXABuOoCfHNFD7Wgtdr+Njw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGl0/G8/+JX2BeKYGS+AkICE1Sk02TVZJHXQ++DT0zc=;
 b=B7s2+mo9ritiRlllQN7IJTEp5/CRttVGMoP9sAAHWZ31RboX15ijUrr8vGmpiGUeSBVBtqfE+2nTEkIjtcFYizuZ/1+3HQxVvxbqZozCz7kWMYI737quMlGBvtA6U3mpkvBG4d+k0f/xCpA90gVnbn5/dB1f9USi4mKE0vj3gUI6UYvEeWkw9C2fMvyYCkK7UmQKvHEZgEfXOZ8ykfO13tDKlMJyO1RPP9inzSktjJBexMuOEfbNvittYyIZ2//grKHUC0Pxz+mwCFetSjQC6r+m+jOR4njHNqlarW/uCesSkKDssA9LHhvlWY1dMdVQldVu5qzULyLUbDC6xWRD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGl0/G8/+JX2BeKYGS+AkICE1Sk02TVZJHXQ++DT0zc=;
 b=WFFwcnTVO47FpXAAASAL/hQLN2ht0k5TfYpElje1dleZIOBhvFgusw9vs6ot6Dbo7ZBnnmPPAES2cz0nJSpPh+An1Qp0SEifVt4IF6+siOwZyflzvLunZknpTd8grUyP3fMHF4Zly/1iLe9+MkZ3GMIqWw/jumioDKHAapPa7cBu72e5CoP81Ea7rU5vAKPY144PbOCqoT7IouVlrRdTBOfoYdZA55yYXbxT+PmgYe1PsP3Suk6RrLcbfV7PzZFIbYDv2+0NFSuu1c5A4DSuZm3YougUlHfMdxOFpIx+OucmoYhtYHasT3c4XskOKjaUxd8Nlz4nNFSjxJo1rTFFWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6c25b6fb-989c-4788-9f3f-c2e309bec4ba@epam.com>
Date: Tue, 18 Feb 2025 11:56:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, jbeulich@suse.com,
 Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech
References: <20250216102108.2665222-1-andr2000@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250216102108.2665222-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9c9551-68a1-4ee6-b5a2-08dd500290fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFlpekJSYkxxNUEyQnRFRm4ydldkT21mbVZCRm9jcktxWU9aSnhQYWw1SVhs?=
 =?utf-8?B?QUxZRmk2aXo1amF4OWYxVEtZeE5ZSWNTaTZnT1JNYi9HcS9UbGFrSG4xM0pn?=
 =?utf-8?B?R1N0dkRxc1NXV21uUUZtMUl1ekhFQzVBTWx0VklTdG9mbUt6dmRETDFjS0xR?=
 =?utf-8?B?SHdzZkgvTWtKTDl1Yy9CV1BLYVR1R2QrNllVMHJnRUVoaC9FVlhxeWZqZjE5?=
 =?utf-8?B?N1Z1NGg2elZzVlVJRnM1Mkc3d3JWNGtueGVpa0Qrd0cyNXlaM1FpaTlOL2ta?=
 =?utf-8?B?WUx3WWZ1d1FwdjltRG9qaGN3OG9RVFhYaEttSXNGWUJ0RGlYV3ByNWpPS2lw?=
 =?utf-8?B?WnE0UExublFtd0F4NytKekJrMWlaOHNZdXJUeTkrTmJvTHZLTnVIU2V3ZTF5?=
 =?utf-8?B?dEU3OGttMG1ia25pTS91NERNYWdlcTNqSFFrSkp5Ti9xQVpwRS9qNkFIRkR6?=
 =?utf-8?B?VWZIc1R0bW9YWkF1bkp4S0V0VDJ0Q28wQUxibGpNRkozMHZLNkdNRVU0dWh1?=
 =?utf-8?B?Nk5GcFM3cnMxZjVCVmtlNmMrNnZNNVpPRGxVekRnNDI2elZubStWRllFR3Q0?=
 =?utf-8?B?aWhJWHFTMDlld3ZHU1hGRkxqcnhSTnpiUWI3UmRVUHhMbnhDR2RFYU1WV3F5?=
 =?utf-8?B?djYrcGtVQ3dWSGZEUktRdVVRMVZ3ZnQrTTI2QTdIVXpRd1lOcm40dHVvU2Vh?=
 =?utf-8?B?ZjNOY2w5WXA1c2xvUWJlRlYzZlNNSEZQTHNGQTZscUFoVGtZdDNLaUR0Ykxw?=
 =?utf-8?B?Wi9FSDNBZXRuWlNuMUZ6emtpTnZlT3c5eHljOTNTM1pTTDBoNmdSNWV4cWtj?=
 =?utf-8?B?UlYrVk41VVJHblUwOWNVeUNtYVNwNU4rSFZFUGoyRC85bldZU2NNdVo4eWxa?=
 =?utf-8?B?OHZJbTRkOXRSZnlhOVpHR29qUGpsTzVXa3NCUFpQam8vUEZXVWM1amR0eC83?=
 =?utf-8?B?Wm5mNGVxSTU4VDM3S3F0alhlcG5GNEpJeS9pMk5vcWNLZ2JheHRlVkRONDNu?=
 =?utf-8?B?Ulp3RnBzdmRoL1NlYm9jalZjS01LVnpRMjdQbmZGaXhSbFB5N3lPbHpkUUtk?=
 =?utf-8?B?LzFPbnoxdzNibmc1UkRSd0dFYWxEZ1Q5eXYyM0Z3YVJXdVVZaHo3TkR6TUFp?=
 =?utf-8?B?bUY1amFWZ2ltNENQL2VzOU5wZ0o2aFBpME1zTFdUdFYrZ3J1VDNLOG83d2hN?=
 =?utf-8?B?T0NiRlcza0ZadjV0UHZ5ZEo0TDVQN2dwc1hnZnZ6ZEV1MlM5UG1HUEdLOXlI?=
 =?utf-8?B?K0tTWEVaQWtlYzRYV1ZiL3NGa2xPcEtrczUyZEZCWkxIY0xuWHk3NVVNNnFV?=
 =?utf-8?B?djVNdzczYU9URUN5NnVROFR5VjZnN1l3d25zaUhPcDNuTzY4VUtFT3NXR01y?=
 =?utf-8?B?bXp1aWZhVEJNVms0dmF4eXM5ODNEdHdmY2dSckttQXNySmpnSzNPTmc4NXBs?=
 =?utf-8?B?ZzRrZ2QzeGtMLzgxTmtocS9lakhTY0ZHWjRCN1Qrc1JKYkliWUhMckJnWDBu?=
 =?utf-8?B?WUczam9QRGdzS1IxK3RmZGdoaGQ5WENCUmpkcmI2N3JnbUdVK0VtKzR6NVd3?=
 =?utf-8?B?RklkajU4NjdyZTBlbnpjRWV4Q3FFRGUrOGVpd3doMENuRjhpRTRCZXFESTda?=
 =?utf-8?B?ZXNHNGwrTVBXM25CdmxVSmtIdmN6UTNQYjJjL3kzbHRBT0NnZ2J3eEt0Szdt?=
 =?utf-8?B?UGtFaHdaaGJXcXArem9CR2U2d2ZrTXV6WXNzWCtzSTk5ck5EcHZTMXNwUE1k?=
 =?utf-8?B?TWFwWTY0RVhSTCtFM3FuK1g3Z3pHa2oraEd6b0w2ajgxdEE1TmMzS3NtQ0FG?=
 =?utf-8?B?Z0t0cVo0SXU5Z2JCcnZraGxFc2RLalpqdUg2TytHR2hjaHZoUVZaeHBMNnFt?=
 =?utf-8?Q?xSa8tJMZA9dPN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1mUUQ4OFRTVG52RERkMFVCNzc3ZlNwUTJPOC8zSXZJWTFDOGNubTVSOGRC?=
 =?utf-8?B?cUhaS0FLUUNTenhEVFhnOHdWU3R5WXVBTFJZZkdyb1NwUitPL3JVY2RsRUtk?=
 =?utf-8?B?ckY1V2xyUE9RSEoxTktRaWlRd0E2SlpHNnZPWDRlSU1lRTc0cFFlTEtGY0VY?=
 =?utf-8?B?Z3VXQUN1a0dPd3V6bE5GMGNrY042L2s3WU4wa3hBamh3YmtUZ252WFhaR2FY?=
 =?utf-8?B?a2l1L3habzhBRXRKQ2VzNGJoODNQVWNpaTFKRXJPaXRjQytORmNTN0tBbkps?=
 =?utf-8?B?aHBBdW5CUWtGTXRhLzJvTm9VMFdSVmZueExUWkpEZFAwZXZNdzRMb3lRQnp1?=
 =?utf-8?B?NWMzM1RIUEhjY2luSGhFa2QyTlVXSm1CRWoyNU4rRzZ1YWpqY1l2TjVJK0Q1?=
 =?utf-8?B?M0F4ZEY3d2FCVUV5NFdXTFdZWGhsRlN1RCtSQW5BbGs5Q0l1dkNwdVZxRlFj?=
 =?utf-8?B?K3pQZi9UczM1aENyQjBnWW9pV09veU16NXozQ0hvU3ZmVVIzb09CK3FLN1NM?=
 =?utf-8?B?cDJwSlkzSUNMaDJJTlM2YU9UaXRWQ0l0bndsaDBhQ0JFSW9XdGRVQUl1Q1Bo?=
 =?utf-8?B?SlJXMUh0SStOd3hsdFV4YW51aENyZjNuR0tyRkNUaUE2Tm1RTW1mVHlzdURq?=
 =?utf-8?B?VkJ2aHFwN2UwVjJObGFOMzJkZ1NKbEI3WkRCWG40LzVacks4SjE3S3hxTiti?=
 =?utf-8?B?eDdJL1A2V0o3V0RpcmZNUEd2eXR5WGRzK3BUR1BKQmFNVXU1Ri94QVk2ZDlI?=
 =?utf-8?B?OEN5bEJESjBzMTlia242WmRxS3NHMGF0TlJkR3FoN1JWQXdxLzRlZGVSLzI3?=
 =?utf-8?B?UkNmeUhYTlNTV0lJU2pNL1hGcGNDV29NYkprdGI5YXhBWTI0ZFZjd0Y1SmtB?=
 =?utf-8?B?YitaRVd0SkZSTmlOK0VIdmpJQ1gwUDVUWjZySENHRjNLNkJEZERVdUk2Qkl3?=
 =?utf-8?B?TVFvN0s4RVJqZG8rajhSbWdhNFhibUdDOFVCdHZtYU94SFg5RnJsYTYxbnFC?=
 =?utf-8?B?dVdHdmJvK25SNVlIcTc5cWF6anZDVitQclNoTFdsbkRMbWd2NG42WURvbW5o?=
 =?utf-8?B?UjJPS3IrejloR0Z5NkM1ZGlCSEk0OE5WT0liODYrWGtXRFZTZElMbXA4RWlp?=
 =?utf-8?B?NWlVR1VNMS9XZ0IzWEpJK0JFNXVvZE1ZZVozK1FySDZhbWhjSVRpWDJWRHhk?=
 =?utf-8?B?aVBnMXptNE1WWkZJUnpjL0dCYlgwczA3Vm9aOTRDdXByUlpPMHZESERlcGhp?=
 =?utf-8?B?Z29ObHZPTU1QY1pKMWRZWDdxNXY5MHNLcHRnS0NsaElFZWpUSXk1a0dMYmp0?=
 =?utf-8?B?YTBmQjRHbzU5QmdDNDFXeTNZM3d5VGlEOEE0dk5pT0dEY2k1RDBiQ3dEOW1D?=
 =?utf-8?B?YjVqcE5kUjk5QS81eUdhcCtjeXlzMTVEY2hNYVEzaEo0aUNZZUYyN2tkaXlU?=
 =?utf-8?B?UVRwVVFYY1lrUHVRQVRiR3R6NVNPSWl3dnE3SmVQMVZnM3ZWTVl3MGtGVXhM?=
 =?utf-8?B?U2w4M1pISlJJV2hnNUpncWxad0huNjlrWVBtY2lPNzJmUE5namViL0tSMUJY?=
 =?utf-8?B?Q2VDVUxrV09Xa2RyV2Y3dGpJc25jOS93Rm5oZE5WOE5ucDlhYTBub3VwRDg3?=
 =?utf-8?B?elJ4eEZMM0kxYTdrK3RTZGh0WWVZOXlRQkdjcVdZSmNqMm45NktYdkEzVjFD?=
 =?utf-8?B?UW5NaEJzYytybGdOK0lVa0s3UWVNR2JZWmZjQTExNW5GcGszRjl2Y0dyRm9T?=
 =?utf-8?B?VFJZVzR5bStXWE5HMjcvU01zRUZGczJUSTJ2ZDh5SERxdzdxTllwOW5TSzIz?=
 =?utf-8?B?ejQ1bWVQTUJmMEs4ZGdHMzhrd05oYkgyZEZCN0dNZ2UreGlETGJ2eEg4SXY0?=
 =?utf-8?B?OVdnSUdCa3pXZE1LVjdvcFEwZE1kWjF2WnU3a0JweGhYeU1nMlByb3hhMkdw?=
 =?utf-8?B?aTRHMEt4bnBEVDlOeFpjalkwVzBPV2N4cnVYNkpOb2ZRcW8wUXprdXczVXFV?=
 =?utf-8?B?UmJ3NU1NSUdnVFF1U1NnbHhGc2hvTVZ3ak05eUR6cGUxeWNPZlJ1RDk1b1VF?=
 =?utf-8?B?cFk0M2RwWWxodGpydjNpN3FoTmNEU2ZwQ3BpRVBhUHBLNU04WnR6anNkc1ZV?=
 =?utf-8?B?Yzl5UCswNGJzTDRLV3FyVzVVYWZZTmQvZjE2MWc3Rm1QM0w1cWE3c05EcWdI?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9c9551-68a1-4ee6-b5a2-08dd500290fc
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 09:56:51.0759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpI+kfXV4RHUUwxBAsBGUJWpLD83P046xthuClkJU5x37NKdH942L/3W/AhB8A+/87EgqxgyZFfjf6tKaiAzIgbPL1/nwoXvkfwBd4X1D18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7077



On 16.02.25 12:21, Oleksandr Andrushchenko wrote:
> Hello, everybody!
> 
> As agreed before [1] I am sending a series to show two samples of the
> formatting done with clang-format. The clang-format configuration can be
> found at [2]. It already has some notes on previous discussions when
> Luca presented his version of that configuration and which I used to
> start from.
> 
> There are two diff files which show what happens in case the same is
> applied to the whole xen/drivers directory:
> - first one is the result of the "git diff" command, 1.2M [3]
> - the second one is for "git diff --ignire-all-space", 600K [4]
> 
> This is not to limit the reviewers from seeing a bigger picture and not
> only the files in this series.
> N.B. xen/drivers uses tabs a lot, so this is no surprise the size
> difference is big enough: roughly space conversion is half of the changes.
> 
> While reviewing the changes I have collected some of the unexpected things
> done by clang-format and some interesting pieces. You can find those
> below. For some of those I have filed an issue on clang-format and hope the
> community will lead me in resolving those. Of course what I collected is
> not the complete list of such changes, so I hope we can discuss missed
> ones here.
> 
>  From this exercise I can definitely tell that clang-format does help a
> lot and has potential to be employed as a code formatting tool for Xen.
> Of course it cannot be used as is now and will require discussions on the
> Xen coding style and possibly submitting patches to clang-format to
> satisfy those which cannot be handled by the tool now.
> 
> Stay safe,
> Oleksandr Andrushchenko
> 
> 1. Const string arrays reformatting
> In case the length of items change we might need to introduce a bigger
> change wrt new formatting of unaffected lines
> ==============================================================================
> 
> --- a/xen/drivers/acpi/tables.c
> +++ b/xen/drivers/acpi/tables.c
> @@ -38,10 +38,10 @@
> -static const char *__initdata
> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
> -static const char *__initdata
> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
> +                                                            "res", "low" };
> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
> 
> --- a/xen/drivers/acpi/utilities/utglobal.c
> +++ b/xen/drivers/acpi/utilities/utglobal.c
>   static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
> -	"SystemMemory",
> -	"SystemIO",
> -	"PCI_Config",
> -	"EmbeddedControl",
> -	"SMBus",
> -	"CMOS",
> -	"PCIBARTarget",
> -	"DataTable"
> +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>   };
> 
> 2. Long strings in ptintk violations
> I filed an issue on printk format strings [5]
> ==============================================================================
> @@ -225,9 +231,9 @@ void __init acpi_table_print_madt_entry(struct acpi_subtable_header *header)
>           printk(KERN_DEBUG PREFIX
> -			       "GIC Distributor (gic_id[0x%04x] address[0x%"PRIx64"] gsi_base[%d])\n",
> -			       p->gic_id, p->base_address,
> -			       p->global_irq_base);
> +               "GIC Distributor (gic_id[0x%04x] address[0x%" PRIx64
> +               "] gsi_base[%d])\n",
> +               p->gic_id, p->base_address, p->global_irq_base);
> 
> @@ -629,12 +628,14 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
> -           printk(XENLOG_ERR VTDPREFIX
> -                  "Overlapping RMRRs [%"PRIx64",%"PRIx64"] and [%"PRIx64",%"PRIx64"]\n",
> -                  rmrru->base_address, rmrru->end_address,
> -                  base_addr, end_addr);
> +            printk(XENLOG_ERR VTDPREFIX "Overlapping RMRRs [%" PRIx64
> +                                        ",%" PRIx64 "] and [%" PRIx64
> +                                        ",%" PRIx64 "]\n",
> +                   rmrru->base_address, rmrru->end_address, base_addr,
> +                   end_addr);

It doesn't understand properly things like "PRIx64" :(

Most of other items, I've mentioned already,
> Unhappy: it's probably "known" things - identification of complex defines and
> static struct/arrays declarations. 

And for them, probably, no magic automation tools exist which will satisfy everybody as,
at least static definitions are usually formatted to achieve better readability
which is always subjective.

The tags /* clang-format off/clang-format on */ might be useful.

[..]

Honestly, It looks a bit strange that Xen community is considering batch automated code formatting,
For example Linux kernel cleanly rejected such approach.
Linux kernel docs "4.1.1. Coding style" section [1].

Another thing, checking the new code and accepting code style violations (if any) on per-patch basis.

[1] https://docs.kernel.org/process/4.Coding.html

BR,
-grygorii

