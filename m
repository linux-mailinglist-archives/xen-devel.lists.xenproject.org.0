Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3700BC38E4
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 09:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139342.1474740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6OWh-0005tf-BQ; Wed, 08 Oct 2025 07:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139342.1474740; Wed, 08 Oct 2025 07:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6OWh-0005rd-8C; Wed, 08 Oct 2025 07:23:55 +0000
Received: by outflank-mailman (input) for mailman id 1139342;
 Wed, 08 Oct 2025 07:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6OWf-0005rX-Kg
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 07:23:53 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdc84c06-a417-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 09:23:52 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 07:23:45 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 07:23:45 +0000
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
X-Inumbo-ID: bdc84c06-a417-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=On9N/Wf7YoU0gx/qyQmTd4H8aFyNsWTTreFWYaq5W7/gMg/Ab+HFLf1REuRA3LY2/HHGSri5CFGvCncro2Icl0E0XnEivskxCx3H7J2TaQagBB0yZ6RMzD83bD+ZYvtEGnj8V6d0miiLWvhiRByt6rIrOJFTiI7V0FY6z3CtodeDBy6aFxGiTc5djLAY5zNj03qoyRfifSKg78SDL9Mpw7QPoMNLGXWy+49BentyPiOBaDn3UMCD+Iw8jt/fXsLRq+oHWWm5pcYI7ZRl45D/7SldVzawCiH6uM4yI3uMnn/P8ycm7V26ka2eecwikkD1wmCp173AQjPlmI5jl+FhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bJ6VGME2X1pZ3YqeVy1cb2BxBzpYBMiv86AsJg8Qrw=;
 b=kB9TafZeb0fe5DHgIPrKsj/ZfowjbYm6BLzLduETFv3lwEWnp6pHu1kodDJiv1UoC4+6QPflt42/7G/Wuiw9hDIz4nQbxVRhHayvbijZU9x84mei06K7cN4EqbdV7sBjhV5xfpZBQosbJePeVSEUtsenWbXt3BdWIi5mHOXa5TWJ/MuYbuRYs5zFrf2alq4H1nGHeWXdawK3+7A1a4M9ZfpKuB0+xEzBxlWtVT6diGVpvahN8B++2qFICGJsBVdV5phhYGVXwpJ1LR7mPBWylgNjOdHVeyqBP0u0u5lWKcpHYVKPl0LC3WudnK7ei6lNT+SuE+st0TTiRjAdM+hBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bJ6VGME2X1pZ3YqeVy1cb2BxBzpYBMiv86AsJg8Qrw=;
 b=mD2b/iV9Ta7R0q0qYb1ZWPvyQhXuDN8KkA1BE2AVW2Gni+CRufac+iR/HzkPBf2SmT4Bre0wwkCtOZMZjPj7v2fkkQFFH4jX56znHdrxOFd9APdphrRUXHR5BExYpCPXDxMyjI03YB5j3/Rcpa6dsjSrQlEsflorR0sDL+dwPJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 09:23:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
Message-ID: <aOYRfMrUZdg2qECz@Mac.lan>
References: <20251002234311.10926-1-jason.andryuk@amd.com>
 <aN-EuzQ2AZ1oMN0K@Mac.lan>
 <aN-VdWG3VUoDhSF5@l14>
 <33fe8bf6-e0b6-4508-a7d5-3f7ac9135e33@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33fe8bf6-e0b6-4508-a7d5-3f7ac9135e33@amd.com>
X-ClientProxiedBy: BN9PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:408:f4::22) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM8PR03MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecfccc0-8902-4d87-10c9-08de063b9d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEowUFdxU1FhYVlTVTVyWW5oQjFJUHB1YlplUmloVldYQjFLaEpwMVBhdUhz?=
 =?utf-8?B?eURWTmVqYzczOVlWWUdVWDh6N3hJalpFSFdDWnMvbXpKODhCZjNGZmJFOUY4?=
 =?utf-8?B?MUxDS3hOZVRLdXY2blFVYnNHb2RnWnYyN2Z4UHZ2OFNCeU9pc0lvVjMxK1V0?=
 =?utf-8?B?aXN1NnkzeG9pZ1l5dzBBazdKdG01YlJxV1hiZGJwTDFWK3M1Z05xOXAzYzE3?=
 =?utf-8?B?L21VQ2lKV2x4T2EydWRlTDBGZk5nZ1BJYVJhTnE2VGFROGJWR0pHM05VOGxw?=
 =?utf-8?B?c3ZKeVcrNlFsZFJsSDlvUjN1ZW9BSmNZQjZkYy8vNzNvZkJCL3g2UTRCclpM?=
 =?utf-8?B?c0RKY3ZtV3J2SWRIS240bmtHRUI3dnQwblVsU2tlaFBxZUlzci90Zk9za3FR?=
 =?utf-8?B?V1hEZUxwZ01TTUc5UHgzdUU4NmNZdTQ2NWdCRWNhbHY0NEd0cnJSeTRaT2Uz?=
 =?utf-8?B?YVFzVDdLeE5PaTFueWVwN1hESkdxN0hneHpxMElRRytHVXEwNXRuTnlIUGd6?=
 =?utf-8?B?MXpDK3dCTWFmS2hUcStTbFEyWCtTSFo2ZXBMVDNoZm01M25Td21HaXJzY0dx?=
 =?utf-8?B?TzRKYkJ3OEFMU290NDJ0OER0NXFTOWg1VlgrcHJjMS9sNUNJUmFSeDFSV21V?=
 =?utf-8?B?aGs5TWFNeFVXS2pWTzhDSVVZTGpzL0dKZ3lHTEJ4eCt2Wmpzc3RtNytNbDZk?=
 =?utf-8?B?b2VLcFpRM1ZvTVVFWHZTeis1ektDSHlnR3RkcGo4QU1PaGdFV0E2S2ZuT1BP?=
 =?utf-8?B?dUR2RHcwYkRLb2FZWEJNK3NQdWRHVjVBNENsNlJ0SFh4MnUvZjYyWTgxeG01?=
 =?utf-8?B?NWE3YXJyU1JxU0Q2TWtXYWZhQkhJUEFnQXdkdWQ3Y2lwdmJjVHFCMUEvcEtl?=
 =?utf-8?B?a2NiM2pLcjljaW4yM1dJSHYyNmR4M20yRzJoOXhuMHY4SzlyaVhYRGljSFdS?=
 =?utf-8?B?UjFxSVE2ZUNVMkk0SHc2Ynl5K1FjRmp4SStTbEpTZ3QrK3ZZTWlxWjk2cDIx?=
 =?utf-8?B?L3J5Um5wWlVVdHVOZTROUU1PNlk4VEhFZHFScElrTDFWRWJVQ1BMcW1GZXBT?=
 =?utf-8?B?TnBxVTI0KzhWdzFVS3JJRFZMS0dzajZtVjNFZUF0ZGU2dE1TNlZMaml2REo3?=
 =?utf-8?B?NnRzbE5IMEhVbnY5UzJxNFVQZ0hUSlIxVHFiRHVQa29CM1Brb3RBTlM4cDV3?=
 =?utf-8?B?eVlNa2I5cmtKZHE1SkZBcWorcWcvcFB5c2p1K0ZZOU9EZVVaaTZoMHJhcWtD?=
 =?utf-8?B?dGxOWlQyUmd6OGorWlRXVkVrVDdRQktCZ1AyTFVjS09kUHVXeExib0thcGR4?=
 =?utf-8?B?bVU0NjJmQkxTQ3pVSGxBcGh1TGJ2R2ROOG1SMU1RWVhUOGxtQ3NoUmFneC9X?=
 =?utf-8?B?RzBMRTl1Y2VYWDBZSDEvYnpJK09Dcm9ZdWdFYXpJNzA5Z2RlbzJ3bGgzMVF2?=
 =?utf-8?B?WGpoVU5rc2J2RTQ2cDMrYzR2VEJpOHpvUW1SN2FHa0VSTFMxeG5PR2VrN0gw?=
 =?utf-8?B?dStPUmtvSll4d0VOdG9qVDFQc2pYODdFL05XWGd6TVFoOFNGa25QUUlKMDc2?=
 =?utf-8?B?aW9ZeUJsaStEZUNkdjRzaXAzSTZkV1RJdlp4YkQzenVDNnBMMG1NTXArL2Vq?=
 =?utf-8?B?N1JFbVVNUHVWNnBvYlFkSVlUelllQUxwek5WSkx3RmNzdzdGZjBkUExVTWx6?=
 =?utf-8?B?emtNYUxVVS9PR0xmK0ZJbDYwQ3I5S3Z4NWp2cEcwQnQ4VFI1U2NZYzJkczRa?=
 =?utf-8?B?bHBHU0V4UFdiTmZGaE1rNW1tc0dDZ29oWG5xZVh6TEkvS2w1ZHJFSUo0OWFH?=
 =?utf-8?B?Nnkzc0kweGorVnZuSGxiUjhKRnNvdFVrcUs0ZVRHcUdYaEJvdk10bTM0K09r?=
 =?utf-8?B?OWd6V2dpRUdQWnpaV2MvWFFOZ0Jaa0c5ek10eUNsMm85T2NsbVV6Y1hYUWtB?=
 =?utf-8?Q?3W6qddJsH+E8KUomtrgXQbkeHcOxnpej?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US9CVmV0SThmZTlPYVZQeUdDT3Z4Kzd0ZkM0TzZsL2ZBaXA2eWtWeHdsSmZ0?=
 =?utf-8?B?aXM3dS9GNmJLWDVXY3NaVkZGSWFZekQ2Q29Ea2VUUE13UDNKQ0xmVHVZTGVv?=
 =?utf-8?B?QnRidG5FUTZJQlBJYndrNG5oNldhL3lLUG03V0RCVkh3QlVVYTVQTVdyQkg0?=
 =?utf-8?B?VUkvdm9aUVJpU1VEa2N4cWdxblVHbUVaeVBUMW1lMWNrUXlHclR0aGw3alBl?=
 =?utf-8?B?cG1LYzNVTjJIejI2Z25oN0pFK1B5Z0c4YkJESlp6b1BrYTJpaDZXbFY3RTht?=
 =?utf-8?B?Vkhkc09vZWlTTnN6UTJnQVlWeVZ5bjVzd0kvZzdFbjFRZ3N1QlpJQnRLSlZn?=
 =?utf-8?B?RXJuSGRYREZBNmhBUUtjVFoxcDNTYnV5WHM4VnBjcDhyNThySnEyb09EMGxX?=
 =?utf-8?B?b2dKMk1STFVpUnlNSkh6cFBIc0FMcXVOR1gyMS90Y2hQT3NmSFVaRVFjTitw?=
 =?utf-8?B?NHBRazVybGRRSjdqNnU4MURlZHdmMmI0anMzYnJrd2xPaHd0bjhES1BZR0lX?=
 =?utf-8?B?N3Q5UVI5K0ZyOXhKaFdYbWdoTnRnNFgxZWVaQjcxeXVaaXBRMW50QmdwRlhR?=
 =?utf-8?B?Si9VVktPZkV2MXR5dit2Q0kxZW1TU2NJUGhrWU4wOCtnMFB4bkNBM01WZlJK?=
 =?utf-8?B?TWJpaVFaSEtrUnpYMVBZSlc0S2V3ZVNRM0x6KzV5NlZjM2YyNGp0TG10aVRx?=
 =?utf-8?B?bHJJMlpTYVVBRi95bU55OXZGQjRQRjE3cUpjWjdDNGd3aHdMYTZkZ0RtbEFx?=
 =?utf-8?B?YzdsWlZDMEdHVW53OWszUmJyQ3A1a0p4b2p3cloramMvdXF2dHdWSGd3YWcx?=
 =?utf-8?B?ZWYwcHkxK0Nnb044Z1Eva0JnWnBhVEg2WndLeU5HTFN3dlVtL2poRGFobXpz?=
 =?utf-8?B?cU0rajViV2crV3dlZDJHVDhyK3dQUHVoL1ZaRkJNZjJUaGJkZlB1aVk3ckNM?=
 =?utf-8?B?M0VPNEloMk9ZMEZGb1k1eHpCU1M0alBKbC91V2lSOUtxTkI4ZS9JKythNzBL?=
 =?utf-8?B?REY0ZEp5VFlZa2hqSkd4S0ZsNE5FaDFZMGJ0a251Z3pCanYrbi9Yb04yWGM2?=
 =?utf-8?B?dzA2SmtLYVRycUlYd1pYZDc3Q2thK1JaenZ4UkVZSTdIY3FmZ0N3elBsYlA2?=
 =?utf-8?B?cGpDck1aUW5JQmNGWExoRG5lcmhFMjJ3NysrdXMwRXd3WjRHL3R4eWpnaDBm?=
 =?utf-8?B?cmRSYVAvNy8xWHpxNVlKdzJVMXBraHJyQkl3VjAza0pWQjA3UGI2cGpkNjlU?=
 =?utf-8?B?OThVREdFQ21jY2NwNjl6UWhCVTZOR2NZaXhqMUl1aWhHd0MxMGxBQzlzU045?=
 =?utf-8?B?SG1NK2RRZERZLzhzaGxPazI5Y1RTdHBFbVBDVjlqdkpadFl5c1orT0ppUlZ1?=
 =?utf-8?B?bUlyS3lkSFZpTmJKd1BXS3J3TUJONlhkMlEzUHBXcE55eXBlZWN5ZzZJdVpt?=
 =?utf-8?B?bkx3NUIyR3gybjk0Q1QxRDlqbWdzRjNxMTFSY3RaZlZtTjNmMnV3cHpzT08v?=
 =?utf-8?B?MXltUzc5bmtwbHBPOXA0eElaRWY4ZVJURUtXZEZ1aTNlZTNaeDNYeUtOOUhs?=
 =?utf-8?B?THM2dU1tdDNWVWZ5UVUxMUJ0bG90VzFkS3hjbEdKT2FIdEU0Sit4YmsvMk1N?=
 =?utf-8?B?SDI1RFRFVlk0R2hlQnNIVW9EaUdGUjZETzErTHhoQ04vM1FCM2dhanh3T3Vz?=
 =?utf-8?B?MFlPYllOYTZrTDlwYm5UZlpCODIwdGFhMWVlTzB4aG1ESmQrbzVaaFBhRmda?=
 =?utf-8?B?R1pOeGtzeno3TUIrLy94OExHamlGd3dhbGpoL1NjRDZIeFBEYTJVclBFeVRS?=
 =?utf-8?B?eDdpb3ZEWi9kOGRxTXlEY1o2R2tJNURyci9hTG5rNmFXTWNNcnJnbWZEZy9Q?=
 =?utf-8?B?Y1JtNHNPRHd6THBleFd5Vyt0QWNNeGJEUzhuMUpjb0hnRjllcGg5Uy9uVVhO?=
 =?utf-8?B?RDhoU1pTVGR6ekU1ZVQ5RXErQlR6UmZhVS80T1B0eGtJNVJpcDg5M1FEbGww?=
 =?utf-8?B?Qis3djVyS3BLK3ZSa2JCUXkvL2lieGVySzhlenNkc3BVTE9NVzBUSzExL1hj?=
 =?utf-8?B?bWlqTnpUM3pjN3VoYUpXVVBzYUY1OHpVOXQ3dWM1L2dpS3BaaU1lMThvM01J?=
 =?utf-8?Q?kbPdeQWxMfG6MG70x6nBAcdXO?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecfccc0-8902-4d87-10c9-08de063b9d24
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 07:23:45.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnM6XiDp01+I2d9RRUcK8LEkvzqaiKz0TThaqZ7xkxYVyG8xEjuUaPr6e6STXIB+9Afo+icGMRJlEviT09o5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6230

On Tue, Oct 07, 2025 at 07:49:37PM -0400, Jason Andryuk wrote:
> On 2025-10-03 05:20, Anthony PERARD wrote:
> > On Fri, Oct 03, 2025 at 10:09:31AM +0200, Roger Pau Monné wrote:
> > > On Thu, Oct 02, 2025 at 07:42:38PM -0400, Jason Andryuk wrote:
> > > > @@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
> > > >   S:	Supported
> > > >   L:	xen-devel@lists.xenproject.org
> > > >   F:	xen/arch/x86/
> > > > -F:	xen/drivers/passthrough/amd/
> > > > +X:	xen/arch/x86/hvm/svm/
> > > > +X:	xen/arch/x86/cpu/vpmu_amd.c
> > > 
> > > Would it be possible to not exclude the SVM related code here, and
> > > avoid having to duplicate the x86 maintainers on the AMD entries?
> > > 
> > > Or the parsing of the file doesn't deal with multiple entries possibly
> > > covering the same files?
> > 
> > ./get_maintainer.pl can deal with a file been covered by multiple
> > entries, there's multiple example of that already, (e.g. many subsection
> > are also covered by TOOLSTACK).
> > 
> > The exclusion is likely unnecessary, and ./get_maintainer.pl will just
> > get the information (email, ...) from every sections that a file match.
> > But the duplication is necessary due to the "The meaning of nesting"
> > described in the MAINTAINERS file.
> 
> Roger, are you okay with this approach?
> 
> I considered adding myself to the top level X86 entry but it covers so much.
> I mainly care about one cpu vendor ;) and I'm not interested in PV or
> shadow.  So I went with adding myself to the specific subset.

Indeed.  Jan reported a sorting issue, you can add my:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

To the correctly sorted patch.

Thanks, Roger.

