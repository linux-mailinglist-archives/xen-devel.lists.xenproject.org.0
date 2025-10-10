Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FDBCD98E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 16:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141242.1475788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7EMf-0005xM-RT; Fri, 10 Oct 2025 14:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141242.1475788; Fri, 10 Oct 2025 14:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v7EMf-0005vw-Oc; Fri, 10 Oct 2025 14:45:01 +0000
Received: by outflank-mailman (input) for mailman id 1141242;
 Fri, 10 Oct 2025 14:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vPy=4T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v7EMe-0005vq-Tz
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 14:45:01 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b19ba632-a5e7-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 16:44:59 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BY5PR03MB5188.namprd03.prod.outlook.com (2603:10b6:a03:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:44:56 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 14:44:56 +0000
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
X-Inumbo-ID: b19ba632-a5e7-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh1Uevurx/DfOvB1CRrMnWCsDDYwHqydO9sf+qB9m/NSUs6g8OzjYmwsDPOerbG9k52m0gy6hFGIDdznif69IygKFrKjn5um7aj/HpgOXSiami66bfh1Xxbzoqxq7vglBy4PmNVAMR0Y6XnxSnqWlKhD+pzpcI85o6AjfkAgXhOO8FLIHkvYedyAjv5OpPYkoGcUTD3FUZwuU8Xeqg/MExwUWG7kKsulFwYXp4n9YnWNe5EoRpjnzGQayKXRMO7Uc8jOh3neRPOOqD1sUC4RPUKRzaQREUwq3AF9oPcBEWLwsnNh4DY1LRMLfSOZuGp2WBvLDTl6PhInbb7YNvVY5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlsNofparXiPno3/HbsDsuEBgESytF5QsdPCEUANqfk=;
 b=UtEgpVdwd4HKBOORyGJ/Arm45ua/eQE8W21TCjrFMDWPq+3INQb67PiPN/9fWeR9iI5TsDWBgADGPjIBsLagdqVglaMdRwRvuMS0aoRW3cCdfCF7xYmmozPYiEwQvWIvK25zPRAPZ88VHRWWP1Uz8Eu69la+XlxdC67Tr/bUmNfj/+PE1lghFIogiWOTJVCcYcjIMi5ChwWYLQjyR49VKVlp6z31O+ufGsji3GmouWjuX39qdRK1dFROp0Cjn/XXPEEg4wBKtVyNKY1s1Cz1AIxnl7+OWRUWe3zkTfaXKCDVFEYHqIJnCSUcA5LnfX3Gykx5X84XQxmSzJxeDfjsCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlsNofparXiPno3/HbsDsuEBgESytF5QsdPCEUANqfk=;
 b=YbiUF8VtGKM0nkMyWcx5M3FfP7YOOucXBJKLPk3vjPH8LGtwp831LcdxnpZbJNFEkC9a9UHA5xFxMDw7OEYMf2myDlEMXwQH2yPyRhMlKOAua21Yqa51boSRISWamUCACpx8rc/8ruUFIIUvOmcPwJ1s9mOcu/+DfXayQwR/8Cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Oct 2025 16:44:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrew Cooper <amc96@srcf.net>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
Message-ID: <aOkb5HKVejs6QO5Z@Mac.lan>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
X-ClientProxiedBy: MA2P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BY5PR03MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf5645d-a8fd-4d56-dbe2-08de080b941e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnAyS1d6NXBNOWtZR0tKTWxFSEJyeVowTnpEMUN0bEpZTmM4dGladjgyZS9a?=
 =?utf-8?B?bVozTW9SL2RMV1IzZE1wR3lCRHhNS2VhZy9qV1JZRjFLT2NSMlV5R2ZtYjdH?=
 =?utf-8?B?QmtWUUcxaVIyaG0wZWx0MjRKTFFBNUw4UFhsNTkzWUpmM2lFbWUvSGpEckxo?=
 =?utf-8?B?ZktLV1I3M0Fxd0tJSDArNER2cHRYRE5PVmhkVWE3amF6ei9lNGs5OTRWN3Z2?=
 =?utf-8?B?TmFLdFBGZ3plYUZEVEFxRktXdFVOdUVycS82ODY3MCtFTzJsV3FUQmVva2hr?=
 =?utf-8?B?SmlPM3ZyN2dGcjk2Ym8xUnlheHd5MjVEeGVxZ2Q0Y0FqajhOU2VYZkZXV2xt?=
 =?utf-8?B?SWlwMDFINnZoNlNJbjZIbmFVNXBpOXNmWmNmMklHcUJERGlVd0k2dnNJc0ow?=
 =?utf-8?B?bXltdDc3dnhTOVZFVFpHamNjTCtObGZvS1pFcm5mTDlBUlR4NWQrblZzRmtV?=
 =?utf-8?B?T1R3YlByam5RMG9Od3FSUUw1Zyt1bVQwQW5iZzhOeWhIR2FsSkZNSEFubXZK?=
 =?utf-8?B?T3FoWndjQXRNRVUxQXI4eG9Qa3E1Mm9RZWtFaHorYllMNGtSWVhnS0w2a280?=
 =?utf-8?B?NmI1d1ZKL0lCeVp2NWJCcEZJZDEvV3Z0Z09rOWthR08zVnd4Vk9YZ2RGaWxs?=
 =?utf-8?B?RFBXQUxmSFpmTE1BcTZQUGwxamxWdktNcjFCQjBDejlKZUlCL0YwczhkQTZ0?=
 =?utf-8?B?MExERUMwNTlUMWxsZlRSYWxnRkU2Zlc4YStIN09lRGx0UlFYUWJNTnlMcUpF?=
 =?utf-8?B?ZDNjQU1sWU1GZ3RxK2g5MU1xTFV1ekdXclRWWU9jNWNxaXlQMEs0NkFXa3hy?=
 =?utf-8?B?MGx1R2tBRkNyRW9RSHZvQS9kZUdnVTJmRk9LQkJnZEhiUzhYMXozOXpVWmdz?=
 =?utf-8?B?bUVtajk2VTBDVStvN1g3RTNXSXIvMmVvc05TMFBRb3lBMEVmRHFaVTR6K3ZR?=
 =?utf-8?B?TWlGRlUzaHVCV291QzZGM3JrbjZVOStNR29Pa1gzcGxDaUpjY05TYXJKTEZt?=
 =?utf-8?B?V2x4Y0drRW5tZzdvMTcvb3ovdlJnVnpyUlFoUGV6QWlrT2dxWldpSmFZSnlp?=
 =?utf-8?B?bWM4ZW5nQzZsR0pSVytDMGhGengxd0RaREtCQUx3UjVhL2xOZGI3dlZkanc0?=
 =?utf-8?B?VHJOUDFldlVMZnBsQmtzN1BOTkQrT2NRSm5jaVhzVWxlRW5nYlN3dDNuWjds?=
 =?utf-8?B?MnpGcWJQQTVKMUdieS9mMVhDRUdiTHBUQnJhU1dhRXE4L3ZVNDZldTgwdTZm?=
 =?utf-8?B?WDlkUzFuS1QwYk1Bc2NxMDBacmRFL25OQkYwRnVxdm05SzZFVW12NVltYW1J?=
 =?utf-8?B?UFN6MXRPc3V6eHJidVJtdG9wd0cxaFVVTU42dmdzclpiVXJPNnRMelZiL1B5?=
 =?utf-8?B?VjFmOFZ0aWtKT2hCZnFmeU13ODVUVG1UU003SUpXdVZMTmZURlFpNkVTTCs4?=
 =?utf-8?B?MkVZdWQ3VzF1Wi80Z0FJSlZMeWlWNFhiTmludHFwWEtTNHZXTU52eG1oZ0JP?=
 =?utf-8?B?aHJ4bWlkS3FseTBQa1VpQnVLNUp4eEVPUkNGQnJUbnhRZStQSG9qTWo3b005?=
 =?utf-8?B?TDlXZmtqWmpWdG4zVW80NUpzbzZNbFJpVGVacS9zN1JlMUlKUjdzc250bFk5?=
 =?utf-8?B?T09VQ01mUTFMUDZGYXFiM1R3Q25iMEFzTGFCZlBpRkVGd0p3V21va283ZjNQ?=
 =?utf-8?B?UzBPUEtzaUUxMDQ2YWwvT3NxQzdDcHJ1MktzbkpnTVJSclZFbE5kdFJTODFw?=
 =?utf-8?B?RWJNQmJyNHo5cmNEbEsvL2FOcVEwQlBpWW1JL3k4WU9XVlFzbHpacXh1OGNR?=
 =?utf-8?B?anZVVDBLbWFjdmNUemtKNURzNHBaVk1lcTdjMDZucm9yc1BCRklVcURmb1A4?=
 =?utf-8?B?OXEwcVRxSXl5L2U0b3EvaDZmaW1PdE0xbUdkbXpvMDJtOE1kVWYzOGk0aUFk?=
 =?utf-8?Q?JCJPAron1a19NKQpCDR971xDxQIjK7LP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWdpVUdtWXJNZlNkWmE4TlVwVU5CMENzbCtZNEgvNjAyN0MrZTE2TmIxTnBF?=
 =?utf-8?B?QnRITU5sZXhBT2NHdXFIT3hsenFjcUwvbjVadWR1akxOMXdYd0xBaFBvOWpx?=
 =?utf-8?B?elVaSDVnMzJDcHFZMlc2N1VwWllSalU1aHZWQ1Z1RW5WVE1WRGZCRXl0d1Rj?=
 =?utf-8?B?RnBUQWwwU1pqdlo3MGxOVk13Ri9Mb21jR1RiY1dmZ1p5SkZWYUhrZWVjVXJi?=
 =?utf-8?B?UldBN3o2UG1TNXE0SHQ1L2tOTXRHdjlZWVh5djl2WWtqVmF6NjNXZTE0YWsx?=
 =?utf-8?B?WWlBaFFGWFRZRnZmTElTUDVGZnJpRFBEVHA0QXc4VDJlbzd6bEo0dE9MSmww?=
 =?utf-8?B?S3U1ZG5EYjNDMC96MGtVNm5LQmliRmwrSVIzL0EvZDNJd2ZoQ1NPY3JkYjdH?=
 =?utf-8?B?bDBSSWc5aFcyZWxsUVdyN3JsbEVIeEMwLzc5U2h6MHZLVWozS3UyNDJPMVdO?=
 =?utf-8?B?S0ZwcTZrbGEyNGZ0L3lyRTNuQjUxOWlxajJROS9OdkFLdHFxYVBId3FIRnlr?=
 =?utf-8?B?cWNYMzFqajVQcTM2M01FazA1OG04dnozNWk5cXkyM2ZmYjIzeVBkMDI2TUly?=
 =?utf-8?B?bGVRbUlWMGx4ZGM4WVU0c1hkTzVHNEdRZnBuUXNUVU5YTVhwMk1KWktuZzJq?=
 =?utf-8?B?aFBCRmFnNDBVZzR3WWhHMGZXVTFGVFdlaTJpdlN1bmZsT0xXQUl0OVZOSDAv?=
 =?utf-8?B?OG1KZTRKeE91bDFrc2JTNkJZVHdzL1BDcmtGQ2JzSUJBUkpyUjlmOVYxaWta?=
 =?utf-8?B?bDk1bnl0blZ3bHJTL0pCVzlnb29ZMkxqQlZneXowZUVkNDNGR2dBcmczTzdK?=
 =?utf-8?B?NVBVWVZCenRGdHhwOHZyWDMwbUhJYldXZCttYUdkSTJPbWN6NzlDaWNLeW5B?=
 =?utf-8?B?R1Y4QndEbVdmRy94akEwUng0enlISGVKZDhYdldxbVJ4R25MaVhqdGVmUWky?=
 =?utf-8?B?cGxCLzJLcmhrTWEwT0UweDUxeUsxTkIwdlpFMnNkK2dvUjBkQmwwTzBvQ1Rl?=
 =?utf-8?B?OXc2Um1iQUliTjlIRDhDMFpJOUI4czUzaWZ5OWNLTFpEbDhLdGxlMVUrUnl5?=
 =?utf-8?B?akdzaXlDOFViQ0EwaGx4RklUdExFb2VWVktUUEc5a1Y1M1dPbU5ETEZjako3?=
 =?utf-8?B?ZlJkemxkVC92U2tkcjFybkFmWEJ0ZjNMRDlXQ0YrMGdkQjZOeU9yM24vb04z?=
 =?utf-8?B?U0ZWQzJqc0NNZ0NYQmNIcEljeEhKYUJuRmgwZWJyWDFmbWJ6cjF5OElyUC9B?=
 =?utf-8?B?ZGxVeW56Qk1PV3BRWCs3Ukx6V1ZObWtBVTFCckk5eStqSi9rLzI5bnRpWWZr?=
 =?utf-8?B?cjJBcEs5emJDd1pkSEo5WmZxZERsR1BLVHVYSXNuRG4wNzIzeXI5VTVjUER3?=
 =?utf-8?B?dXV0Y1RONUVFNmh3L3NLNHFXOHkzTUd6KzAzQ3dsZmlwWTVRRmZpVVA2V2tC?=
 =?utf-8?B?VGhVNC9vYVhWSjFoY3l1ciszYWhPZ2JxSDRBZ24va05MSEdDblgwQ2F6UzZl?=
 =?utf-8?B?TytpNHUrcHJlV2Z1YkFubG12dmE3QjNKZmQyR1Z4ZnZJRi9nYmhFMUpUZjhY?=
 =?utf-8?B?cjlrU2x6NXRMQTZUNWxGQ0ZuYlkvYm5ta1AyQ3ljMFZCY1ZiS09qejdHMkJz?=
 =?utf-8?B?NWl3dmdKZ0x3Q0lZOU5pcFdqMVh0YmlRNytNRVE3azhiR1gvY2gvdHJNVkpa?=
 =?utf-8?B?M1I2Z2JsdUUyUW5LY21uVm12b1lmcStndkc3L1RhMUJ4ZlMxMU96UGh4TXV0?=
 =?utf-8?B?WUt6Skp2TGtFWFIraDZFelNGVFdvbE83YS9HdXlkWVROcEo5VFRVL25OWmp4?=
 =?utf-8?B?N1pmTzFRdzd6aE5PN2o3ZzZNMDhtWXllT2MyYStnZStjckg4dnZLS0Q1eTdM?=
 =?utf-8?B?N2NKNVc1ZTI1UGIwTVkyUXFLWlpnTHYxME4rY1E4clZ5TUpydldBa2N6c1lF?=
 =?utf-8?B?c3hrNTlvVHowQ1JXNUJoYXhZVHpMN1ZOdXFjUzlpQkpRaExKZnZaWFNoYXJ1?=
 =?utf-8?B?Z1ZuY3dpcURtM1RjM1ZYTEh3aWhSVHc3QjAxMU1wb0VCK1dNYkovYWlUcnBM?=
 =?utf-8?B?UWZiMmZDS3NEZ0U4NlJlMDRyWXJ2WnhQZHRDUEp2MHlOb0R4NzhFVVJKYy9P?=
 =?utf-8?Q?pB0ezdupJldVgACvwtPiFORlk?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf5645d-a8fd-4d56-dbe2-08de080b941e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:44:55.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyWKbQacJilm7UsDjeIFsD2LG7OPtfR7DHROS0GoGyaKXTM9XvMHhyPFqUhS0tu5yMJDvnMBzeEGGTLwhABUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5188

On Wed, Oct 08, 2025 at 02:08:26PM +0200, Jan Beulich wrote:
> In preparation to add support for the CMCI LVT, which is discontiguous to
> the other LVTs, add a level of indirection. Rename the prior
> vlapic_lvt_mask[] while doing so (as subsequently a 2nd array will want
> adding, for use by guest_wrmsr_x2apic()).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The new name (lvt_valid[]) reflects its present contents. When re-based on
> top of "x86/hvm: vlapic: fix RO bits emulation in LVTx regs", the name
> wants to change to lvt_writable[] (or the 2nd array be added right away,
> with lvt_valid[] then used by guest_wrmsr_x2apic()). Alternatively the
> order of patches may want changing.
> 
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -32,7 +32,16 @@
>  #include <public/hvm/params.h>
>  
>  #define VLAPIC_VERSION                  0x00050014
> -#define VLAPIC_LVT_NUM                  6
> +#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
> +
> +#define LVTS \
> +    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
> +
> +static const unsigned int lvt_reg[] = {
> +#define LVT(which) APIC_ ## which
> +    LVTS
> +#undef LVT
> +};
>  
>  #define LVT_MASK \
>      (APIC_LVT_MASKED | APIC_SEND_PENDING | APIC_VECTOR_MASK)
> @@ -41,20 +50,21 @@
>      (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
>      APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
>  
> -static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
> +static const unsigned int lvt_valid[] =
>  {
> -     /* LVTT */
> -     LVT_MASK | APIC_TIMER_MODE_MASK,
> -     /* LVTTHMR */
> -     LVT_MASK | APIC_DM_MASK,
> -     /* LVTPC */
> -     LVT_MASK | APIC_DM_MASK,
> -     /* LVT0-1 */
> -     LINT_MASK, LINT_MASK,
> -     /* LVTERR */
> -     LVT_MASK
> +#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
> +#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
> +#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
> +#define LVT0_VALID    LINT_MASK
> +#define LVT1_VALID    LINT_MASK
> +#define LVTERR_VALID  LVT_MASK
> +#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
> +    LVTS
> +#undef LVT
>  };
>  
> +#undef LVTS

I've been thinking about this, as I agree with Grygorii here that the
construct seems to complex.  What about using something like:

static const unsigned int lvt_regs[] = {
    APIC_LVTT, APIC_LVTTHMR, APIC_LVTPC, APIC_LVT0, APIC_LVT1, APIC_LVTERR,
};

static unsigned int lvt_valid(unsigned int reg)
{
    switch ( reg )
    {
    case APIC_LVTT:
        return LVT_MASK | APIC_TIMER_MODE_MASK;

    case APIC_LVTTHMR:
    case APIC_LVTPC:
        return LVT_MASK | APIC_DM_MASK;

    case APIC_LVT0:
    case APIC_LVT1:
        return LINT_MASK;

    case APIC_LVTERR:
        return LVT_MASK;
    }

    ASSERT_UNREACHABLE();
    return 0;
}

That uses a function instead of a directly indexed array, so it's
going to be slower.  I think the compiler will possibly inline it,
plus the clarity is worth the cost.

Thanks, Roger.

