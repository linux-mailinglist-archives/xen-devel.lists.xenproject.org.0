Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850CA8B25A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:38:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955164.1348981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xLK-0004FW-M2; Wed, 16 Apr 2025 07:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955164.1348981; Wed, 16 Apr 2025 07:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xLK-0004E1-JC; Wed, 16 Apr 2025 07:37:58 +0000
Received: by outflank-mailman (input) for mailman id 955164;
 Wed, 16 Apr 2025 07:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIlj=XC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4xLJ-0004D8-A2
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:37:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2416::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4902a18-1a95-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 09:37:54 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH8PR12MB7182.namprd12.prod.outlook.com (2603:10b6:510:229::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 07:37:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 07:37:50 +0000
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
X-Inumbo-ID: b4902a18-1a95-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zd1Sd7ePLeXZkkoZ5zNXfSHltGVAs2PrxtnD33SSx8aet6KJLaV/cEG54HmBFq6agyIqk37YjmjvdWNgmc5Kg6RsR+1MTEEM7+VIGy/MiB+z1xdaGX4QGktSMw4v3hO0l2ELElIZfiszsRNUPID53W5T1LOO3Di93e80YQfFemCL83ANgOoSL2XS8CnXhX2y8S2FvQI2dSJiJQm/SvQtrtT1GkxZn+4FxzAgYjsK0vT3ms2IpeXN8685zjjAE/QmJPeSnjGdGIHeoUBlk5aF6fU0nstlHObiU3qFdtNgr61DXpYCJFUvWlzXAvv1XZyQvitvmWEP60UlfqOY2Nb0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRqnsiI7Ax9Xitc27mTVgaQup68dEPs+VJccXLrwzRY=;
 b=eBeiYKi6wtNP2Ars7lPtFFRq5/pPbqcMB89Pk2WQZAIQM8RkuWUX2K+oapPzY9EKLgKOA2wncsBhWttPpLduzz3qahlvVDd33AVOAbS5bfqoOXsw6wafzCl6Dlg3N8Ha7qtympTZmkAbpikdfG9ircwUB0UhiMNEBsYCFJQOxTpPlMq8jZEz6gQwbvk0B0gqWBq2fVyApNcj9Vw2iQTK+24uGGpZCTU+iRytlTc1gyGWMRzg/kDdh8RXYNDX7oz/6Z+jzWsjshNwKfmghnnpgrRjgfaxdXPwLhZa/birrcW+vuM8gY4HIH9Ji1q4FbbplWBeg83JE6ngDcfIlB3ALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRqnsiI7Ax9Xitc27mTVgaQup68dEPs+VJccXLrwzRY=;
 b=I52ECfl3dRbJR7F6omglzxqwHStZJoVI+d48dcWroaHuJgOVmQyNQrOgvsUPqJsMx7bRMpeMO3vstDODk8VpDP+w3I2bNM7PdiHLPZUORy6uuOlmciOsnL7d4SrZ1XFj+zFjE0kkPZAnvUv1y2rOy4p5PSY4zAHlw3JL/5QFiZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c953da5b-2edd-4c93-9bdb-67577edfb23e@amd.com>
Date: Wed, 16 Apr 2025 09:37:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Enable early bootup of Armv8-R AArch32 systems
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
 <47fc3dad-3f7b-4a9b-89c1-99e79a048ad9@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <47fc3dad-3f7b-4a9b-89c1-99e79a048ad9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH8PR12MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e7954f-138e-48ff-f2ef-08dd7cb996f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2xIM0JoMEgrUlE5YjhnQmJZaU15WnA1bTdydzBaUStMeW9pT1VMdWlTYVFC?=
 =?utf-8?B?WUJocGJieXBmUzNveDgvUk1iVEQweWVKQ2tvWHBKcERUSjZDZW12b05QUW51?=
 =?utf-8?B?eGYyc1BzTVRaZ1U0NjY5ZlVoZFhoNTVVY04yR2FxZExYYWd1R1o4MHNxdGJh?=
 =?utf-8?B?YWlVU0VTZ2pkREI2eTV0ejh4Zjhxb0FNWFdoNXBaZnVwS3luSEc1dUw0cEM2?=
 =?utf-8?B?dTByWHY3Wm54THdXaUdTd2lhd25LalRSMlJiQ0dxdk5ib3ZVVjV1dHJ1cWN5?=
 =?utf-8?B?bGN0b003SVZ1QzRnNHRVaDB5YXJhakxJNDZ2cmZHSVc5R2FKSEFWaHhBV0lX?=
 =?utf-8?B?bENHbmNkNmlqYW1RY3lHS2NvR29EeWpTTXA4QVlBdmtIZ1lkQmd0Yk5rYVVw?=
 =?utf-8?B?VUVieXEvUmVmc2Z5YjExRUJPaEN5TEFjbEN3ZUJXWklXbnQ3ZStub29qaWJv?=
 =?utf-8?B?SGpHeVgzdzdRU0N0UFFYYy9lTktsM3RKSXFOcmxwM1RKNHBzN0Y1VmtXZlVM?=
 =?utf-8?B?eS80VTZWMWNtSW8rUEYwYUZpck5yeXpFRTVvVUdaTFQ2OVM1c25mRHlZRzJj?=
 =?utf-8?B?Y0N5d3grZUFsWTRDSTRCUWhKWTdZUXY1K3lZd2N0djBkWTJyeTV0Z2pjakRs?=
 =?utf-8?B?RjlzeWZjc09vNGUvQTNkclJLWVJJdzZuWE5JUlYzMTk2WjR3NDJZcjhhM0Zy?=
 =?utf-8?B?NkJDMW4vQkdRMlVRMGoxeVFFRDZBT05yVERkRS83Nk0zanRJb0lueG9RdTRZ?=
 =?utf-8?B?QzBGd3Y3OUo0WHlmM3Y1WDAvcWkvSENjcjRud3lQVytJOHVaSDNaZUdsZlEv?=
 =?utf-8?B?NXpMRWdJdHRJcEx3MVBOcFloaGxxWndyNitFWkJjY2lFb1JoR2J1UDh3UVEz?=
 =?utf-8?B?K3lvcW1qMzNxaFdGMXowZ3hNd0IwcXplNDdjZko4Vkk4MFU5b21WdWs1bkxO?=
 =?utf-8?B?NGRjS3Nweng4bFVEQUNaUEd2ZXF2bEM1TFUwRlJxWGkxSFZXWndSSkJERkIy?=
 =?utf-8?B?dHQ1UGFjNEtYLytHTzNiTCtMZ01wZEEwb3JEenpXd1J5UVlUTHVBM0w0L2JN?=
 =?utf-8?B?TEF3T1dSeWI3K0FTZUc1WW91OHBVdUpQeThXcUFlZnBkK3NpZVlaLzMyUHlC?=
 =?utf-8?B?cXdTc1dJSnBTaVdZY2xobEhvdW44MVBGaHFmejl2YkRjQ0NRSGpGeDhvMktY?=
 =?utf-8?B?Y3hTcUs2VWdWNktTWE5ROVZxQkhKNU53dWVZSnlJMmZaNldtMS9WeXlrSXRk?=
 =?utf-8?B?SEtrYnJXbFp2cnQ5T1FwL3FOb2FIRlhxRGI2QnRaMmN2RlZjc2tFcWtBRHBz?=
 =?utf-8?B?TUEvMFdxTURWUTVHNFcrWVRGbWs2a1M4RnVFKzhqZnRXOEZlWUZwc2N2TWVq?=
 =?utf-8?B?TjVEKzVzb0tSQ0VpcnU5RWg5MUtSMlg3Ly9VRWJMeTI3dTRnQWJXbTJoeG9E?=
 =?utf-8?B?SERyR2FNNHhPdnNGR1huaHRaelEzN0gzb1BYMmtiYVlHM1lObFN4TUYrZDY0?=
 =?utf-8?B?aEpyY0NySUtTeWNOSHVEWkVMSHFBeEN3NjhjZTF3ekJWSEYvSG53Nm1mdzIx?=
 =?utf-8?B?c1BrbXkvOW1IS09UeXdEcFl4WjB0L2FpRUNaa2w4by9wNEhOVjVLS3VGUlBq?=
 =?utf-8?B?RCtTSDhNN1JvWWRiOUs4K2d6bVE3bTFCbzFXMExseVpQd0RLNEJjTVFyS0F6?=
 =?utf-8?B?Nm5wWmMweGVMa3JKMjZoQVhPL1BHTFpaR3MvSlozNHlnL25BQlAwcUpFNHMw?=
 =?utf-8?B?cHY1QWlWM1JldS9DTUx3VlNvWk1nL282cHoxa08rUFpVUU1NVVRpSU9rUEIw?=
 =?utf-8?B?MTJhd0NsWlgvT3lDQ0JyZFlVMWs5U1J4SE5sNHk5czV4amlsd0tYYTBKc1BX?=
 =?utf-8?B?ZW5hUWp0UWdib2E1VnZzT3FUOUtDbkFmNDFaRkVGSXpHekh4ZmFEbDFxaWZN?=
 =?utf-8?Q?zxe3C7ifRa8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0pIZjB2NE1wTCt5QlhhdituODBjbFVpbW1UYnBxRTBDWHVDUXVnMjJWSUhC?=
 =?utf-8?B?dGl3NWQ1dFg5TEd6Y3JuOUEvc2Uyc2E4SzUyMnZOK1haSXp3QkZEbFZqT3Qy?=
 =?utf-8?B?YzgwT3lveVlIbU5jN3MreGxURC9sMFRFbDQyS0ljMENqaWp0TU43cEsyL2Zi?=
 =?utf-8?B?eGNBZlIraTc4UFRWelBqSVh4R0wyZmNJcVh6R0VNSnRFSWJleFFkZ3J2SDJW?=
 =?utf-8?B?a2FSNmZsd0xYN09sZE9ybkRZeVc5YkoyancwSHVqSXpycGEwZjltb3JMZm9P?=
 =?utf-8?B?Uy9hTnZqOHQ0dGFaUE1FeG5zVGo4ZWgrL2FIdDZBalE2N1BiSDFhSVE4MEJp?=
 =?utf-8?B?QWx5RGRuQXhyTGo5enoxK0ZYdnhKczJJRmJNUGV6QjBiWnVFLzFvMWNIQjZ4?=
 =?utf-8?B?ckYzd0l1dG5tUmhScm81NGs4djZuZHR0NVluRTd3QXlESC9jcStVWnRLcStm?=
 =?utf-8?B?MWdpWjRDTXpyWk5KRGtIRHVOY1hPS3hYeHdrWFdOUzZCWHB5NHRXUkdLY3Jw?=
 =?utf-8?B?QjVQNlhxQzFFK0swS2hSMmR3UFJoa2FuMXBIZGRESWFnbnM0Tkh1aWJrUGNC?=
 =?utf-8?B?anZtWjVRQVNucDFDVVVvV1dINlNjYlpjcG9ZK2pTY1JXOE0zRk5PQjYxaHZS?=
 =?utf-8?B?NFAvU0tLN1BoMEpOSVNDY3NhVUp3TmI1Z2l5NFU1NDBQUnR3bk1KbzlKbUpG?=
 =?utf-8?B?a3BabnFVNm1aN3IvWVJFVmNveUUwVmZYalZlTGFNODVPeVVtZUdoaFlXUktj?=
 =?utf-8?B?SnROWFB5ejRzTTBrbkZiSW5nekdJZzJ2VGFiNnZ5cmppYnRPZGcvY1hTUVA0?=
 =?utf-8?B?N0JIcnprL20vNTZXVHlzbTBBUEU5WWR6YkROazcvQUU4V2Q0U0NCdDRQVEcx?=
 =?utf-8?B?K0kveElYYWs4aHdSY1FVQldNejV2MENhS2I5UFpGbVpoRnF2ZjJLZTdpZm1C?=
 =?utf-8?B?b012RTdwRXNkKzRmRkVxS3FTRUV4Y0UrU2dVWmlzWnEzTXRLeXIzQTYvL003?=
 =?utf-8?B?QmJmc2d1WG02MlR0ODRUNEl1SCtxOGJONWhlSkpwek82Z0RaREdrVDRTajkw?=
 =?utf-8?B?QlYveGg0SlRiUW5uUjdkcDJwQUdUZXpybkVIa2V2T0FMUE5WaW1yeXhzWTh0?=
 =?utf-8?B?Wlp4bVpKS3pQQkRSWE5FQWRTclp3NjFwbXJQZWs1eitmTi92OStaandaOVk4?=
 =?utf-8?B?WEQ0d2xKYTBhNk9EbnRKOWpXWjg1WFBYc2p5RjRpOTFxcG9oZ25FeWtUUk9j?=
 =?utf-8?B?RHkxMWYzRXkyVzFwajV3eGM5dUFKbGtBSnJ1d0xwZ1NMbVo5K0VacCthM3E2?=
 =?utf-8?B?cFkzbGxrdjBQSm4xaFRNTnBDcDFmYW1nK1FvNDBZT3ZQRXU0THRWanQ4RGpj?=
 =?utf-8?B?SUxPNHh1WUpmVTlUUys2eUNRWlR6ejdPd21FZ1RlWGtCSDdOWmN1M3dYbklH?=
 =?utf-8?B?RUd2UDJJeGcrWXlDVllNYkM1cks5dHpuVkxkUGtRcTJaOGhVWklFeVd1Zk5E?=
 =?utf-8?B?SkEyRkFwNjdiTi9GQ3JBZVR6Tjc1TG5HMlhjOUlERlZkZkxzaVVVR3BOZVBW?=
 =?utf-8?B?NW1EYWx5YXRoa0RKVEV6WmpReHI5Zm8rd25iRnYvRTdjaUhjZFVTSUVVODl1?=
 =?utf-8?B?NU0xNUZFcEFaRjJlZlltWGlZUmdtaUZyRHdsVVQzRGhDR0xuS2wwY25FMnpa?=
 =?utf-8?B?WVM2aDhvU2YzNWlnRWhqaC9vb2d1SnJCVktCNTgrc2sxR3VRcitHVEYybXBm?=
 =?utf-8?B?Znh1SlJCT2x3TmxvYVJKTDFoNktodFhFbEg0UnA0MEQ0WjhWVnp6VS9uMk92?=
 =?utf-8?B?cHdTMjdFNThOZUY4SFpyVWtwQXYvU2VONnpzMjBGb05Ddk1tM1RkWnlqWm8r?=
 =?utf-8?B?TFZJcmdxZkp4ZUNWSXp3cXZ0Y2tQKytlSUkrclNqWnFFS1FremVzRFJsQTFI?=
 =?utf-8?B?YmhlYmVRTTRrNGVoaG51d1lqTWVGOEd0VGRIZGhQZUx4a2plOFp3ZFlGY0Jw?=
 =?utf-8?B?ZENJTlBhdFIxNHJRRHRNazZQNHpXWVk2OVowQUZMaytFMVZTalVHQ0NCOTBs?=
 =?utf-8?B?MlYvSE10MXdsRUJHd3lNckdlWWluVEZGZUJ4Wk5saitIN0JxVldocGpaV3B1?=
 =?utf-8?Q?I8NA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e7954f-138e-48ff-f2ef-08dd7cb996f6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:37:50.2416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJbcIfEXlJC6aEzfT1v100LsbbWzsu1QHgK3zt4zA8AWTzBvE7N3rCoGYtveeReJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7182



On 15/04/2025 08:55, Jan Beulich wrote:
> On 14.04.2025 18:45, Ayan Kumar Halder wrote:
>> Enable early booting of Armv8-R AArch32 based systems.
>>
>> Added Luca's R-b in all the patches.
>> Added Michal's R-b in patch 1 and 3.
>>
>> Ayan Kumar Halder (3):
>>   xen/arm: Move some of the functions to common file
>>   xen/arm32: Create the same boot-time MPU regions as arm64
>>   xen/arm32: mpu: Stubs to build MPU for arm32
>>
>>  xen/arch/arm/arm32/Makefile              |   1 +
>>  xen/arch/arm/arm32/mpu/Makefile          |   3 +
>>  xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
>>  xen/arch/arm/arm32/mpu/p2m.c             |  19 +++++
>>  xen/arch/arm/arm32/mpu/smpboot.c         |  26 ++++++
>>  xen/arch/arm/arm64/mpu/head.S            |  78 +----------------
>>  xen/arch/arm/include/asm/arm32/sysregs.h |  13 ++-
>>  xen/arch/arm/include/asm/arm64/sysregs.h |  13 +++
>>  xen/arch/arm/include/asm/cpregs.h        |   2 +
>>  xen/arch/arm/include/asm/mm.h            |   9 +-
>>  xen/arch/arm/include/asm/mmu/mm.h        |   7 ++
>>  xen/arch/arm/include/asm/mpu/cpregs.h    |  32 +++++++
>>  xen/arch/arm/include/asm/mpu/mm.h        |   5 ++
>>  xen/arch/arm/include/asm/mpu/regions.inc |  79 +++++++++++++++++
>>  xen/arch/arm/mpu/Makefile                |   1 +
>>  xen/arch/arm/mpu/domain_page.c           |  45 ++++++++++
>>  16 files changed, 350 insertions(+), 87 deletions(-)
>>  create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>>  create mode 100644 xen/arch/arm/arm32/mpu/head.S
>>  create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>>  create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
>>  create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
>>  create mode 100644 xen/arch/arm/include/asm/mpu/regions.inc
>>  create mode 100644 xen/arch/arm/mpu/domain_page.c
> 
> Even if we have files of this name elsewhere, it would imo be nice if new ones
> still used dash(es) instead of underscore(s) in their names.
I took care of this while committing.

~Michal


