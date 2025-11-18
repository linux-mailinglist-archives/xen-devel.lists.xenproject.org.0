Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D69C6A5C8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165104.1491927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNpQ-0008CS-Qz; Tue, 18 Nov 2025 15:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165104.1491927; Tue, 18 Nov 2025 15:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNpQ-0008A1-OI; Tue, 18 Nov 2025 15:41:12 +0000
Received: by outflank-mailman (input) for mailman id 1165104;
 Tue, 18 Nov 2025 15:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLNpP-00089j-GZ
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:41:11 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00e0ae0f-c495-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 16:41:10 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB6972.namprd03.prod.outlook.com (2603:10b6:510:12f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 15:41:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 15:41:06 +0000
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
X-Inumbo-ID: 00e0ae0f-c495-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO8BVulEo0tCYSOFSLmAwNG4nE7OmT57aozorF1iuFGv+K3L8wdhFMisNtA5PdhYurcXOtu2VPtOgyrqeWHMOmn3qtxBMt8IOGAM86vP7xPHxPoI82VamJGWzYUWeFvpYMEtI7tmsYadcDQgXVSzklUcm61gDWURAJwcbBn2ynYE3isS0uXl3a1KNIq/YcGBnE8xXsE6iG/8yZQ08/c/rLzw50x2LGSBLwvWKA5QDDgjk2oo9xKPklkYCm9t0eW4h/q9OC97VCXAPKSh8ItpwFoZy6NksCQDAgZMrZkpVqlWDELQf9Gc55bvQ7LJUTPYfuM29xWHNbVpYG1KCSPS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6o8tfdzHVkljlOcBbHO9NiT0V8NpQDoJXBAnUHjZec=;
 b=oHHed99ancESIT8DVO9ELSZM6e6Y4r3anU4rE2B32cCU5XLNG2idcVB2TCoBoS/7MGnfOoi6sKK0il6PXIOzwVaq2ITB1oNtoM5sWZDPuE2v6h04Lcx/fUBfCVhN5Q5YESfISCjhiFuBLsmWFlGEsoQ/GrfOJNt4GcNVxBrb0TIAAec+F1M+/CUXL+s9gL0SM9ZL6fi+5iTEQxN/Wjy+50ZfJof9BWN0vKvdNAuLTrE9GcAQAlRWtgTfwEkQWTjsv95nEwqdI+O0I4QtrdOQ2bYVhtY/OcX/35jZr+X4N/xTNlubCwafUHcA6SiVzF7+O+1HzvyKh3M2D0Ik/aOTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6o8tfdzHVkljlOcBbHO9NiT0V8NpQDoJXBAnUHjZec=;
 b=Y2YK/RXIw4++Bwj+UXxelfcACWdULgbVvk8VAF28c5so8MZ019eGfKfXwpil+FdFPtPcaaoRCy9cBqpVE2wLvu4Ov8S2P3evCJSXH1OiFyr7KTkVJSkyuXcUEHc3+5wiUot/WTtIZ6F6DEhjhUvVISZ6G7lnkFp1PgY5Q0kBFcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8c704f68-591c-4605-a649-86ca0ada411f@citrix.com>
Date: Tue, 18 Nov 2025 15:41:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86: replace APERFMPERF synthetic feature bit
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
 <505029ff-cb2e-425c-bf5c-3ac364f32140@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <505029ff-cb2e-425c-bf5c-3ac364f32140@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0305.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5ddf2e-9e6e-46a5-b077-08de26b8e34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU41bS92R24xOXJpbm5UZ2s3Z0VsNk9lbm5Ybmt3RmhuZTR5VFkxUXVSaVpQ?=
 =?utf-8?B?VzcxMzJ6NXZraG5hb1lHV2pYSk5MU2V6blA3Um9rU2U0KzVTRlRHdnlVeGxJ?=
 =?utf-8?B?bys3MTB1MkE3cS82ZkUzR0pVMFBtVytTQnZHU25heHZaQ2hMaUxaRWtlZjNI?=
 =?utf-8?B?VGZwTVJ4bEJNUzNkcWtnZGRaN1NMRkd5YTNLTGRXNEJid2lRM2w2cWlhMDRh?=
 =?utf-8?B?S1lIelNacFRCWGJ0RDRwdTE1RUt2dzlockpKOStjN2VEbGI1RDM3VlUrWHVF?=
 =?utf-8?B?OG5zRElRZVZjU0FMTTNBbWJDSGt1NWR0ckhnN1VLQzI5dkVPTldqVGd4TmJ1?=
 =?utf-8?B?cnd2NkFLeGtzME8wMkVZWUFUZEVRU1lWQ3JMOTZ1dW5jTEc2UjlML01MWDNt?=
 =?utf-8?B?T1JiT0gvdHJLQ1VwYXhoaWxWZHZZb1hWRVJOYWJmdWtsSjQ3TXlMTU94bllL?=
 =?utf-8?B?cHpHTWwyNjdXd2lOMEZzSnpMeTZUbXJYcVlhWG1PSEhHS3hLb243R3hXVU0r?=
 =?utf-8?B?amJQYkVvYzhTN1FyNEY5QkdVQUsxQVZkaWtMZExnZExpeVF4M09NUWpaVzFv?=
 =?utf-8?B?OHpxKzR2WHhTTEtSdE1VOHRlckVrWUcyRWJLZEtvSTRrcEE4NDRwc05JMHQ2?=
 =?utf-8?B?MXdoTEVnYjlFRDZvOHZwMkhRdHBWc3VnenJBSitFaEJzRERLWnNtYVBXVHpr?=
 =?utf-8?B?TUpRaW9FUS9Qd2ZKbVJ3ajFrUFl2aU1vK295RDNpRWQ1UllYa2k5YVBwWU9x?=
 =?utf-8?B?S1U5RGNmZmtnRkJ3dkVpcm5Vcy9oeTJtMVkvLzNJaFVWSzhPWkNXbnpEUU11?=
 =?utf-8?B?OXJ6V2pjZWVPNDhLT2VUM0ptcm5IN1psTk1haFB0WGVLbDcyZ3NZOFNxblRV?=
 =?utf-8?B?Wlp3WEF2M0ZyRmRDMGR2YzdkVWJzcDZHUkExVW9GYzU4cGprVmNwQTRuWDRC?=
 =?utf-8?B?bWlMU0ExUDVPeHFBUG1MZ24zTzgzcDhkYmlmWmQ3WTZVTDI5TGsvbzYxWCsv?=
 =?utf-8?B?MDBZQ1kwalk4UUFtR1J2cVJGZ0VuTTY1SDNzaWJ0dzJGbTE3WFYzZlA0VjRw?=
 =?utf-8?B?Z0h1WmJZSFRXSndSekxqKy9ENVlGRFRhYmFPUnhBV0gwby9nY3pkZEc2ZVY2?=
 =?utf-8?B?ckszdXNhVnVTZmJXQmlsRWc3UTd5ZUtBaUxscnRLaEo3OVFpQXowRkxaeEI3?=
 =?utf-8?B?ZmFmcFBiZExrdGU5Zk0zeUF5RGZmbGN1QVMrWXk1VWhRTkl1cUtVNS95ZkJ6?=
 =?utf-8?B?dVJWVm5obkhSUmlEL08zZ3RURlh6eEFxL2xaTU9hQ09QOXhQOWx5TkdSekFa?=
 =?utf-8?B?VFJiV05LN0VwYTlRTmkvdmtvaHowMEcxVUFPbmx3UzdGdTIzUlJubUtnYUtC?=
 =?utf-8?B?eGg2QlpYMGFoQUFqeS84eU5uMEh2Q3ExOEF0cklpeVdXZVRRalVBdXhoa2xX?=
 =?utf-8?B?cHpiTnhBUEZJODJzMTZMQkJFNU85VDFvOGMvOGk4NjVMMFFuSE5mUlQ2Rk9F?=
 =?utf-8?B?WStVQkdYL09XbEtSVURJVjJaVkdKYW5ieWdQaExUaGkyZEgyb0tJMlJBc1Z0?=
 =?utf-8?B?UktLTmh3aE1RcU5WcWxRQjdDN0U1WTFpNnpld3V2a0FYOHhkY3NuZkh5N3c4?=
 =?utf-8?B?QTVhcFhWK0hRMDF0Y2tndGRhazJ6a01EY1VKVzJsVUNWZFJBZ3JFdFAvTkJX?=
 =?utf-8?B?Sm1GSXAyTFArakg3NUtnSEl6YVZhK3pBQXkydFJhRUZWZ3MxUkg0S0Q4SStW?=
 =?utf-8?B?SWFhQ0cyNXRZcFN2aGhFTVdGcU53eS9QZVFlQWw0MTBQa3J0QTRMS0NmY1A2?=
 =?utf-8?B?bXhZSDFoTi85TmNJdENGdzQ4QTQzdzRZWE4rQUl5c0Z6OVQ1MGVlU2tzTkd3?=
 =?utf-8?B?WjBvQ1pEMHZKdnNIS0p5d0xUNXAvYm8vM0p0MnZGaG10dlBtd2taenVDUlVD?=
 =?utf-8?Q?sVEP05+M9+q1ztYkOcF2v5hvX01gTRcH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU9KL282SkRmQzAyTGRvTWpxV01pNU9paUo0YStyWHYzSTU4dVpmTWZNSWNG?=
 =?utf-8?B?ZHZ0TE5yYm1USnlXUmxlb3RzL2UxWU56Smp4VDVTdlJPUURPOEI1YmpZVkVB?=
 =?utf-8?B?YVFjRFVtaEQ5dG1IY0dqRWJGOTFnTWx1VTdTRGM1TE53VW1HOE5OOHk4cjZV?=
 =?utf-8?B?ZElxdHJGck16cjhmdG5keUtxcHZDZk5adjIwdDgrSFoyZGNmQjZwYkMyQUhU?=
 =?utf-8?B?cnoxTW92S3BMcDFOR1p1eklPWDZ0NjhOKzRsdXJTWTNGa3BiRmx5eVBCUVI3?=
 =?utf-8?B?S3VuVHU3TFpoRGFnN09sdWdzZWxmUWxuYTVLSUQvWEpQRW92SzJia3JHeXdm?=
 =?utf-8?B?dUZzdDgwTUVWd0hLRGFadTI1TnpTT0VJV2xVeDNObHBtdTcrU3N4T0dXUWhV?=
 =?utf-8?B?K09JOTN5K2VGNXZXV2tmZVM1WmtFWE53Y0NueUxrdVRFTno4enlnOFAwbEN1?=
 =?utf-8?B?dnMzTHpGODdSR2lTNlZuK3NmWTdLbVZ6NTVFNzFOWlNzTDVNS2gyS1c5d1dl?=
 =?utf-8?B?YUxOZFR0MSsyWkY5TnJ1S0VaRU1sVi85Z1pMc3QrU0NWeGxKQzY3cXkrcXdw?=
 =?utf-8?B?bmIrMWowVEcxK0YwTDVOaEV4TUJJcFJLV1BzcEp6MkcxTThUdTdRQ1hvVVRD?=
 =?utf-8?B?aCt0WWhSVUFiMlhjN0k4dzdIRUxhYnlibEJyMVgvZWRmN3lsbm5udnFuWTdK?=
 =?utf-8?B?N0szLy9oNXZxczF3cFgxeW51NEYxMCtvSFpBQWhWWWRUczM4SUpIMjZaeVZE?=
 =?utf-8?B?ZCtuUXFyQ1YweWtwdUliaXVheWRvUm9UU2FERXdsMFFYWjl3QndHSkRFS3VY?=
 =?utf-8?B?RWxWbjJ2MDlhb005bUl2UlhDdTdORFlLelBtTkE2TzZMMUFPYXZ5UkdXRWg0?=
 =?utf-8?B?VlJUWGtIa2NTWnVFT2ZsUzNzSXg0aHhmZDZEZjFZQnBhZzBPZHZDcG1MSFlG?=
 =?utf-8?B?dlZwTGxGWFlsS1ZWMWNDeld3VGYrOHJrZXREWGdhb0E0WERLc05YSGJoUFZw?=
 =?utf-8?B?UEdRN0NGaWw5a29pa3F1dHV3WFZ4WmZYc0doc3NIL0VtRCtzZE1vWjRWeGY0?=
 =?utf-8?B?WGNlbzVxWGl6N1ZLeHF0UkJLcjZvTnAwOXVVNThLM0hmNWpaMFFSVG9WTUVm?=
 =?utf-8?B?RnNFaFQwMThMbGdxR0JJOGZ0VmFWNG1FVEtHaHZUWEZkdDk3VWdUVHQxU0hi?=
 =?utf-8?B?b2tDWHRmY2hXU0J5alZnMlNwOCtna0k5a0liYmZSS1JKQzV6TmFIN2x4NFI4?=
 =?utf-8?B?ellaYnVNKzdRWlZYRTVXL0dzWGR4NXN4M2N6TkVHMUxOOFJrMVZzUjNNdGFB?=
 =?utf-8?B?WkNWUS83QWd0QnhRWWRaOUt6NVFqQ00zRGZnMlFqYmlaUWJSZzdKNzQwd0RL?=
 =?utf-8?B?Y0p3Mm0xd0t6c3E4bzFyTnlEQ3VuYy9mMHRUendwZzkxNHFmREU0cXBMNEtu?=
 =?utf-8?B?U0lKYTdvZ2FTVXFkZzdBckp2T1BROTlaeDZTcENxUkpEenRxMWdRZDFZaHBq?=
 =?utf-8?B?NFdoclJwaU15NkE1ZWVrYUI3dzBGc1VFTUtDdDRiTGdIY0NJZmNSWFRRTkVk?=
 =?utf-8?B?TTJpcWlyNW1TalNRaVpzMlQ3K1RWRFdYSzZHMDlJcVJDSWp0Y0hEZkF1WmFC?=
 =?utf-8?B?MWRuTHQ3dXI0L0M4czlXU2xnbGNHZ1FtcmNjeTBON2RoNThKNjA4anNvbHMr?=
 =?utf-8?B?WDNEbW0xcDRhTHNYcnNOQVA1Z1pyK1ZtaVQra3E2OVlHOXZZdTZOdWExRmU5?=
 =?utf-8?B?czA2dW5xL1hqdVNDeDc2TW1RaTZNbjZqN2w0Y3RoVko0K2RMUzhvTDNOdjRR?=
 =?utf-8?B?em1ITHh4TFVoZXY5dEFNU285QUNReUF6KzRzc3VSdWJBSEV1cTkrS3ptdHU1?=
 =?utf-8?B?ZzhVN3NSR0gwS2s3eU5LNCtuV0t2LzZSQi9tMmZ3Q1ZBNDJyUXZpcXVDZmQ5?=
 =?utf-8?B?YVpZdDZBVGxZK29Ha1BjS1RxcHdsL2ovbHlwUU50ckdFS29KTVZqN1h6QzRy?=
 =?utf-8?B?djlkWmJxSnBleFliT3dwWlJWRllTRlpMeWhQRUdnVmJZWCtwR0ZGUmdKczMx?=
 =?utf-8?B?UVI5Qmx1T21QM29mV2Nvcmp6UjdzMDlzVlVWZ05oQ2hoYkVyYk1wc0l2U2dr?=
 =?utf-8?B?YjBkZ2dJSDJFc1VGOTFvQVlXR1ltakN0K24xMkxOMDJNa21mVmVlcHRZTWFl?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5ddf2e-9e6e-46a5-b077-08de26b8e34b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:41:06.4165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPBxmlF7gi5yTFWSSuMAfudvvyISx8AdGlVDIODELl21JqVI8v/U9zGkPyqs1M0s31EflV8Z+7g04W7XL3Fws/AFVy8cZGGLatLO4+yIM38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6972

On 18/11/2025 3:07 pm, Jan Beulich wrote:
> Use the respective host CPU policy bit instead.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Right now, the synthetic features get levelled across the system.  Now,
we take the BSP's copy.

This change is broadly fine, but it does need mentioning in the commit
message.

One thing we may want to do is take greater care to get the
masking/levelling MSRs properly level.  Right now, if they're asymmetric
for any reason, we would previously end up using the common subset.

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -523,10 +523,6 @@ static void generic_identify(struct cpui
>  	if ( cpu_has(c, X86_FEATURE_CLFLUSH) )
>  		c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
>  
> -	if ( (c->cpuid_level >= CPUID_PM_LEAF) &&
> -	     (cpuid_ecx(CPUID_PM_LEAF) & CPUID6_ECX_APERFMPERF_CAPABILITY) )
> -		__set_bit(X86_FEATURE_APERFMPERF, c->x86_capability);
> -
>  	/* AMD-defined flags: level 0x80000001 */
>  	if (c->extended_cpuid_level >= 0x80000001)
>  		cpuid(0x80000001, &tmp, &tmp,
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -11,7 +11,9 @@
>  #include <xen/macros.h>
>  
>  #ifndef __ASSEMBLY__
> +#include <asm/cpu-policy.h>
>  #include <asm/cpuid.h>
> +#include <xen/lib/x86/cpu-policy.h>

Why both?

~Andrew

