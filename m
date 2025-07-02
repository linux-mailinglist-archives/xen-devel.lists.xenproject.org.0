Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C984AF161D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031088.1404801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwwj-0004MO-DA; Wed, 02 Jul 2025 12:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031088.1404801; Wed, 02 Jul 2025 12:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwwj-0004Jy-8z; Wed, 02 Jul 2025 12:52:17 +0000
Received: by outflank-mailman (input) for mailman id 1031088;
 Wed, 02 Jul 2025 12:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uWwwh-0004Js-AU
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:52:15 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2407::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f914c37-5743-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:52:13 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB8788.namprd12.prod.outlook.com (2603:10b6:8:14f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 12:52:07 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 12:52:06 +0000
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
X-Inumbo-ID: 5f914c37-5743-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rve2zjJ5bqpfQdfiBSwH1hD9DW3pwbs0n0+SW6iXfS+mWY/TueiBWQbbSBrvV0N5dfXERiFHNN4pBA8zA4iqOd/Rz+cz/LUxWWM2rdwDDpuD/WKI/pAi7jeW6UH+T6cVIFxOSCvZFD2pVn7Yw+QVp6ZDknxfrx8+AFWrU4K5/Oyi7m19PSs+g8W4WGzUFEE34dYwk+9Iz3JjbKsII0Vj6OYB13RQyGCAD5S9amEUaaaazfHzInJaRGgfO4ddOfhVF9Z038dIz33wbiE9YMo74ClghMWkjrHxwUPwtkQ37PfIuV5sNqCI/hMi00vRKLDOPFpdCsqDwtmlxTKDUQj6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA/i8tZOwQ9eA6TGGGAXzv4kJz13XpnrJPjzPASQdQw=;
 b=xTINGz692TJusNRlPEBz77t1S6gIT2xqewMw08sIyF75DhlQVvRtvNd8uJGxbsSeZwqe8aaNEf6zXv4YWwok4Tpms9YDenEq+PdIRHfIkaoyRGkJpNElaooEKw/oP94dFh9FokslCNCwhcRm5YhmJyNlz6YTG4QzwhWqrXEEfcjOTL4fFyq55R9mMkPLLqQRsRqX3yS1FaH9iP9MwTtUbqs/ackak4TWZXsFhEQJsnvFMVcnqDMpqQNvWqG4VVnJV/3YgX3x50uu/3MgLRpbb6YMSmJ7NpFfr7OMcYyfndqrG1mBOrk8Gsu9f+d1lttnecwpXxL0ezNGPkdfxkring==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA/i8tZOwQ9eA6TGGGAXzv4kJz13XpnrJPjzPASQdQw=;
 b=MtYRWTisGFLpBQkbpYtNPfYL4uhFmjrzyBswu3kotspNTLPECtE/Hhc43qlZH8+SGLdajeDOGlwg7e6Du53DlClntwEyGRrHXOGwufSV5BPTatFEC5fqMVFoIkE/4Xm3KPdbitcpwBvDl63+jjm1Mpmh2I63ZeNwx4TN8FJrpSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fce437b6-b3df-4e11-a59f-01690ff660b4@amd.com>
Date: Wed, 2 Jul 2025 14:52:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
 <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: c07d78f1-a783-4b68-fb28-08ddb9673fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akJTaGZXQVJuNjJ3SmQrSUxXcFNIbVVFM2x5eDVtMndnNVJzUmxiWG1zL1F0?=
 =?utf-8?B?SWtwczZwQXdNOHFHZ1VQZUNIbHpxdUx0bmJMc2E5U29TQ2hYVkJJdWFQS3JZ?=
 =?utf-8?B?SEUrS25TMDRzNEtMK1huWHhkQUlmdi9KaVl0c3JIZzlPbzRERmdpb3pTZ2RE?=
 =?utf-8?B?S2RKRzAyOWp2L2JaYU53aFNIUE8wajJVY1Q4N2dsNTkxUVk1UmRVRnpsVWNl?=
 =?utf-8?B?b016MWFTNk91YmdFdXliOTdhTVJnM21HQzc5d3BsTnRHRVFsRGo3NTBzZzN6?=
 =?utf-8?B?dmJORzg3WDhCQUdYQU4vL2RFQTlINzJzZHNWaW0zN3BBR2paTXQ2OWphTzR5?=
 =?utf-8?B?RDEzYkZsdXlLMmJFTXZtOHp5RG9EMHVVY09ZdnFMd0o2QVlrdU1meFg0WlpM?=
 =?utf-8?B?aDBIdDhiSEhNU1IwcmRyd25yQWVpTGEyTlhIa3B1dFJ5NXlpT3ZzbURrLzZD?=
 =?utf-8?B?WnFkSGxlNTdleDBKa2FpWGwwVjNjYld2MG9ibEtBd3NvL3pOOEdMb1B2Lzl4?=
 =?utf-8?B?Q0xOUERIV25NN29kMEw1Y0Jacm8ybnFaVFVhTUxxT00vVVN2ZDBpb0crdmlU?=
 =?utf-8?B?TVgxWWxNeDVmeWVSeFVBQ2FQUk1EQ3k1c2pVWWVXUEVqanVMTGQ5VWJkZzls?=
 =?utf-8?B?RGx3QXdWUWpMNmFTRDhDemh1dXlqWGRGeHQ0eVUwSkR0a2djWjNjQmkvbVlB?=
 =?utf-8?B?WlA5UnNjdjNIMzM0MlF4ejRKc3NaaUZDUzA0UDZyQVNsa1QxWFp6QWhmNzRu?=
 =?utf-8?B?ZUxBRThqTDdSaGpaR2JIZC83L1JaejYzZ0RnWE1Pam53dllTLytEYjJhT2dn?=
 =?utf-8?B?QjRoNlJlUWNtQUJqaTJuL2NzZ0ZTL05Ba3pscDUvaGFnVDJHRnNpcmJFZktD?=
 =?utf-8?B?Q2trN2xNbU13dVZTOHA2WWhua3VwdVpUZUZ4dzFxM1dwbldnc3lDcS9TUU5L?=
 =?utf-8?B?SFVTUXdOV2U2SEZFNXE4WXp1dmg5bTZBOHhZV3phYzIwQ3EzRjNyeGhFRnNK?=
 =?utf-8?B?OXVnWU9jRlAxdVR4Q2w4bW9BdWRJRGZ2Z2phUUpBVWdHQ3JZZFYyWnZ6OGdC?=
 =?utf-8?B?L0pJZGRpQ2N0cHduUzBPZUM5dU5FL3JnbjlJcFNyc1FrWEhxdC84bHU0M2xq?=
 =?utf-8?B?ekxhNC9ZN3YxSzdoRE5sNWhVVURUbmErS3FnelRDcjZaai9XU1RDK2hCMTJV?=
 =?utf-8?B?OSsrWDFnM2M3by9jMG9sNjZkaFJEMmlaZUFKY0JMekpxS3ZpajdYOFQxeHpX?=
 =?utf-8?B?UGMrcWVwMkxVeUdGU0JQbVpjSGh5dFhmdHhxODRlWU9FVG52YlRhaVNBS3JK?=
 =?utf-8?B?eU5aeUdKeFZlVjRnNG1lbmNGT3lwbjk2Q3pwTjYzSFVoTk12d1Y5MlNEaytk?=
 =?utf-8?B?UGJzK25VdGRycmFQZ0xlYVdxVEpiT3BkQkxUSjBWS3RhTm5udlpWRjdSWlFM?=
 =?utf-8?B?VS9iYXdmM3N6ZlhtUUxpUUQ5N3hNc3NadmxDSWh3dnBVeEV0SXpPbUVMaS9I?=
 =?utf-8?B?VWFLZFJ4UmppQkVhMlBsVzVjTFRDYnhjYzBwZUY2ZHBJM1VVdFM5UzlOUVA4?=
 =?utf-8?B?WkdOcldZRFh5N0J3dXRKSmlCOWozN0x5NHNLS1RvYUQrTkh5K1R1RGJKMVJW?=
 =?utf-8?B?OTltZ2JhUkpFRzJ6VlJwd2hXMGI5eDhMM2E5S1N4VVpyZlcvcFlrOHJYcFFX?=
 =?utf-8?B?L2V3WjlrY1Y2U0tWNmx2Z0RrclVsV3lubzN5RDNsZFJXV2xUdXFJNGt3anEw?=
 =?utf-8?B?MHpPcWlGVFJOaFFMeVZoQTBpb0tkVWtEMGt6c2VlZE1rMmE5YjlFMXVmOC8y?=
 =?utf-8?B?cGtmVUNmUDk2K3RGSzFvdVBSL2JNaHRmanRMV3FYN2owRW1RRzVhNW5BRWVm?=
 =?utf-8?B?dTNFd0NOZWtxL0hpUGlFSWFGYVlJR09VWkZqVFdDdmhkaUU5aXFLTUhGL25l?=
 =?utf-8?Q?qjq6wpBGKE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmdjTSs2RUtsWmNET1RnbDNRWVlIMVVPOS9QSkVrZXVpR292cU9nUzJ6UE1Z?=
 =?utf-8?B?bFFFeHpaQzltQzFRS1VlK3dxcDVqOWRRMncyNy9OR0NVckZ3QzBicFlraUI3?=
 =?utf-8?B?K1JFYkw4bXA1V0xHd2xpa1dPVmt2MjMreFl1YzRnVUJrL0FWYVBRNDNKYmR4?=
 =?utf-8?B?NUR0THhWWGxNYmxEVlV1UytHSy9wazJVb1lPZlpDVXd1dVZZeDMwNzlESHFn?=
 =?utf-8?B?QU1lWC9CVjcwTkFSV0pKajlOWHpnU0FrSFNIUEt4WlpTTGVFMFROV2RmVVU5?=
 =?utf-8?B?VWVDN1pxd3RkNFdhVk1KT0ZHNzNPcDBoWWc0eWF0SUx3ZDE5WmNsMlo5NUpG?=
 =?utf-8?B?Y2I2OHl6YnJnYU1YcC9FK3NUNEZWQlNXMC9sdkhTb2lZZHFjeU9FYThzeUpq?=
 =?utf-8?B?NmR4WVQrT3VpN1N0Z0ljRXJGaDc3NFFJYlJUejh0OWNFZmhKU1JVdWQ2bDMw?=
 =?utf-8?B?bERpT0czWFJ0ZXFrbE05ekI4Q1pneFlzeVZ2ZTlPQ2UyYmtIYVQzMkVsU3h5?=
 =?utf-8?B?L3BtRXk4RUE1VmxGenFwVkdHcC9iRm4zblFKcVlORVdpZEw0Z24rVDBzRzRv?=
 =?utf-8?B?NWRIWU14cUF3VkRBckJMdnBKcDdIWmlzTzhkVTA1Qno3ZWxQOFQxZ2tURkdq?=
 =?utf-8?B?ZGNmKzdPODdFaDJkOE12VjFGOVd4a253N2VpQ1FJSXJQVlFTNzdsSlByVmdB?=
 =?utf-8?B?bWJyTzBhdWUvRHRDZEpnV1N4U2dwQ3RNT3VXVUw2c3dZSlFLeDdtVUxxeDV3?=
 =?utf-8?B?NFdLZnBiZUJ6QUhKR0IvSFNEWDFSWlpDZW9UZTZXTHVQSnJlbGZEbDFsTnRw?=
 =?utf-8?B?RDJ1NjFQNkw5TlZuOHloN1JZK1hCTXl1ZWNoeHFvcDdYNm1remd6MGlEdDFX?=
 =?utf-8?B?TG4rTkRaa2hWaEVDejRUdW0xMThUc2FJU1Rqc09QSWFRYlpSbUJXdHJhVzJr?=
 =?utf-8?B?NHR2NmNaOThRQXA1VTlvUWZsSXFnMEtOaElkYVkrdWY3RFE4Z0Q3RGlXZFho?=
 =?utf-8?B?L3N6d2pDUlR2d01sTUg3aGJCYnRpQXB3cDIvaW9JOFlaVVpHN04zZUhyb3o4?=
 =?utf-8?B?Ung0YTJTT3crQzIrbXRZbVcycVg0SGVXSnhad1Y1QldmcGdEMGMzVzlpRjZZ?=
 =?utf-8?B?WjE4SzgwNlVWTTlqZCtiaTNDL3p0T2VnUUpqTVNwMVk4bk4zSXFHSHhVaHRs?=
 =?utf-8?B?TFprRFRMYWVXV2l0eGkyMWFMcit4MTRDaS9TZmRXVmRyYW9OSjhKZllNVDN3?=
 =?utf-8?B?aDJkR1puZDJyZzJPeWR1Z0grTmU5TkZJVFdzWWl0L3BpWlFMcDErb3Mrd0lM?=
 =?utf-8?B?eWVuc2cyNlIzQ2d2eG5YMkltM29MNnphSm4vbHFFb2NEZmtRbTFaQXMrS0dI?=
 =?utf-8?B?UlRqbHVZZmtYQWZNZHFETzlCNS9OcnlOYThIZDkzZ0xCdWx6QlJ3VmwxcEhR?=
 =?utf-8?B?K0lFUlhWMkVHWEFWY2hwQ1A2bFVJY3lXdG5SRXJTZ3NwUURGR0ZjaG5tMmxO?=
 =?utf-8?B?aGJNMVBpUUo2U3ZkTXpPaFZFbUNoeGF3eFdDVkNOVThOWDA0MXR5YjRTbHdV?=
 =?utf-8?B?UDhPNXlJelRLYUtYSzdjN1A1OHAxbitWNytlYWtuRXM0OGdQcENOOVFRblll?=
 =?utf-8?B?QWZaK3ZPL0E4aUk4bGp3L1lEQTNDNGJZbzdxUjljWnRhWTJhaW5tVWZZWHJN?=
 =?utf-8?B?ZzJ1QmxZZm8yV3M2NG1lZzJXVm5nK1lpeEdiN2RFZ2ZCY04zN2daeVhKeUVw?=
 =?utf-8?B?eldDLzNhNWpMT2tnMkZkWkdtWWFIMWdDMFNJbzBXNkJtdmJPeHlYQ1FiYkRx?=
 =?utf-8?B?OFJBWkZ6d1lqZEhXZ2VQUnFEdFVNM3V2UWJEaVpiY0xhamV1Uk1McW1FZmVI?=
 =?utf-8?B?OGFRRndBZ1FmbGhuU2pOd294dVFLdEhubVUxVzNmS1NLMm1nVlpCSXRIV3dm?=
 =?utf-8?B?bFRhUkh0TkNnb0VmV0lnZElveUl2WTFxL0hPWGRoUVpzT1hmWklPVDA0UDg1?=
 =?utf-8?B?ckpld3FrV25UNzFiMWxqYXJoYmwzekRJem0zZGwyUi9iUFRXdGQ0RHBqRzlp?=
 =?utf-8?B?ZXYrV3l5QUYzdkk5OE1PR0xxcTZpN1ArQjRXYlJoenVHaWlXMGNERUVLR2Y1?=
 =?utf-8?Q?oMSnDC9sdv2pXCE/MHg1+217j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07d78f1-a783-4b68-fb28-08ddb9673fb6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 12:52:06.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT/rcnPboSb42Mf8H/Eo0uOIsC8mo4AggrJxKVBR+Bc3fQjhCb+ZMHi0wlNOB18R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8788



On 02/07/2025 12:09, Jan Beulich wrote:
> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>> Implement the mfn_valid() macro to verify whether a given MFN is valid by
>> checking that it falls within the range [start_page, max_page).
>> These bounds are initialized based on the start and end addresses of RAM.
>>
>> As part of this patch, start_page is introduced and initialized with the
>> PFN of the first RAM page.
>>
>> Also, after providing a non-stub implementation of the mfn_valid() macro,
>> the following compilation errors started to occur:
>>   riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>>   /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>>   riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>>   /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>>   riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>>   /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>>   riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>>   riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>>   /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>>   riscv64-linux-gnu-ld: final link failed: bad value
>>   make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
>> To resolve these errors, the following functions have also been introduced,
>> based on their Arm counterparts:
>> - page_get_owner_and_reference() and its variant to safely acquire a
>>   reference to a page and retrieve its owner.
>> - put_page() and put_page_nr() to release page references and free the page
>>   when the count drops to zero.
>>   For put_page_nr(), code related to static memory configuration is wrapped
>>   with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
>>   common code. Therefore, PGC_static and free_domstatic_page() are not
>>   introduced for RISC-V. However, since this configuration could be useful
>>   in the future, the relevant code is retained and conditionally compiled.
>> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>>   unreachable, as RAM type checking is not yet implemented.
> 
> How does this end up working when common code references the function?
> 
>> @@ -288,8 +289,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>  #define page_get_owner(p)    (p)->v.inuse.domain
>>  #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
>>  
>> -/* TODO: implement */
>> -#define mfn_valid(mfn) ({ (void)(mfn); 0; })
>> +extern unsigned long start_page;
>> +
>> +#define mfn_valid(mfn) ({                                   \
>> +    unsigned long mfn__ = mfn_x(mfn);                       \
>> +    likely((mfn__ >= start_page) && (mfn__ < max_page));    \
>> +})
> 
> I don't think you should try to be clever and avoid using __mfn_valid() here,
> at least not without an easily identifiable TODO. Surely you've seen that both
> Arm and x86 use it.
> 
> Also, according to all I know, likely() doesn't work very well when used like
> this, except for architectures supporting conditionally executed insns (like
> Arm32 or IA-64, i.e. beyond conditional branches). I.e. if you want to use
> likely() here, I think you need two of them.
> 
>> @@ -525,6 +520,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
>>  #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
>>  #endif
>>  
>> +unsigned long __read_mostly start_page;
> 
> Memory hotplug question again: __read_mostly or __ro_after_init?
> 
>> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>>  {
>>      return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>>  }
>> +
>> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +
>> +    return 0;
>> +}
>> +
>> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
>> +                                                      unsigned long nr)
>> +{
>> +    unsigned long x, y = page->count_info;
>> +    struct domain *owner;
>> +
>> +    /* Restrict nr to avoid "double" overflow */
>> +    if ( nr >= PGC_count_mask )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        return NULL;
>> +    }
> 
> I question the validity of this, already in the Arm original: I can't spot
> how the caller guarantees to stay below that limit. Without such an
> (attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
> is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
> any limit check.
Honestly I don't know why this assert was placed here. I checked the code and we
don't limit nr_shm_borrowers in any place, so in theory it's possible to end up
here.

~Michal

> 
>> +    do {
>> +        x = y;
>> +        /*
>> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
>> +         * Count == -1: Reference count would wrap, which is invalid.
>> +         */
> 
> May I once again ask that you look carefully at comments (as much as at code)
> you copy. Clearly this comment wasn't properly updated when the bumping by 1
> was changed to bumping by nr.
> 
>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
>> +            return NULL;
>> +    }
>> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
>> +
>> +    owner = page_get_owner(page);
>> +    ASSERT(owner);
>> +
>> +    return owner;
>> +}
>> +
>> +struct domain *page_get_owner_and_reference(struct page_info *page)
>> +{
>> +    return page_get_owner_and_nr_reference(page, 1);
>> +}
>> +
>> +void put_page_nr(struct page_info *page, unsigned long nr)
>> +{
>> +    unsigned long nx, x, y = page->count_info;
>> +
>> +    do {
>> +        ASSERT((y & PGC_count_mask) >= nr);
>> +        x  = y;
>> +        nx = x - nr;
>> +    }
>> +    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
>> +
>> +    if ( unlikely((nx & PGC_count_mask) == 0) )
>> +    {
>> +#ifdef CONFIG_STATIC_MEMORY
>> +        if ( unlikely(nx & PGC_static) )
>> +            free_domstatic_page(page);
>> +        else
>> +#endif
> 
> Such #ifdef-ed-out code is liable to go stale. Minimally use IS_ENABLED().
> Even better would imo be if you introduced a "stub" PGC_static, resolving
> to 0 (i.e. for now unconditionally).
> 
> Jan


