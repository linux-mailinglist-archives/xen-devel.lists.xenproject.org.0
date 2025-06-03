Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630BACC53E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 13:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004254.1383930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPji-0003RX-US; Tue, 03 Jun 2025 11:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004254.1383930; Tue, 03 Jun 2025 11:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPji-0003Ot-QR; Tue, 03 Jun 2025 11:23:18 +0000
Received: by outflank-mailman (input) for mailman id 1004254;
 Tue, 03 Jun 2025 11:23:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMPjh-0003Ok-O9
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 11:23:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:200a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2403c435-406d-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 13:23:15 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH0PR12MB8461.namprd12.prod.outlook.com (2603:10b6:610:183::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 11:23:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 11:23:10 +0000
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
X-Inumbo-ID: 2403c435-406d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o84j+i3pKNPmrfXT+YALSaqDIWtWCMj6RrQXwuObUBp6+XVbEV2cWeMCsmEcefZFJZvbCQkUr5oECtGh4BuAwB+KSqoT12DC6Rz72p1pi33eajZZ6HBHsCCYGVzLqYiowRJeDb1vIt0JBoeeEVsEm1uRj2CCAHPe6gJPphTI0qzgOFRPXrOkZ5H/4FJdZSDWG0YwKTKbZsdNjQ1TU7TECDSStghzEcSX6dcsOhV3DXGaVsfbD2PhCrZ0MsQknIjXh6OTNC51euim1y6/QP5FKnI3q+T9sTlm5BNVgeWwaqccvmWcOaS0FDh4ZvDQzAtaUKVT5rfSbjbJ/wHSiXo8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FG+Z8Mhu8hlN7FD6BVQCjltYY7rSLo65HFJ9aJ8JZec=;
 b=EHA4mwWf0V4Rg+vrAljR/3aP6NcVXVCoH8wo1A3zW5TDEhauQilZNaOVF6uVxpvi1FjshQX9blDFosuZNdzZeipEpyaRtjcXZJCeZG8hZKrFOcoMdnm7sTBlJKB61Q0PeGYtX/APzDFl67jXb0Agvv8Cu12eAiQ40ko4BPzyYkTTjgZiEqWX6GWptrJx8LCEwoI1TT6LpyNUdRBIXj7NXAxvLoMcXHVlH57j51gOSeHVtcbe1/xm4DnwOTKJz9fShah0sLz5KVcuxcB+JTi5XtdBLg2Ek89fPug4h9ZRPVedrrWtJvpnfU9D2xhz4x1M0pQMPzatPuuknT2bN6I5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG+Z8Mhu8hlN7FD6BVQCjltYY7rSLo65HFJ9aJ8JZec=;
 b=Wgw58oFkIt7djzsJTb8EZgSM6wBEWRBJfeJyG+G/1Y8VGK8ZEgflGHrZeybYTxFk6VpwC0s1qk0BYmWzYzIU+GUcqbIhS7JWpDuNnrChZLyVLiSDc69Awo0UBqCqNR16Q76gNE/CrwySal9d8+SSsxroiEtX3N5ozQhmb+ywi3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5448a0af-0bff-4bfc-ba76-34beb5546dc7@amd.com>
Date: Tue, 3 Jun 2025 13:23:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <aD6aVzDZ4zDyEBHV@macbook.local>
 <6438a00b-a0fe-419d-b57e-5e1af48d43ce@amd.com>
 <aD7O0nsfuKbKwlnD@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aD7O0nsfuKbKwlnD@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH0PR12MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 36dda7f8-0df5-41c3-a487-08dda29105ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTVPQytWYyt0aXI5SE5mM1NycE9TcGhkeDJrYUkyUFZXQkI2d1MzWkZMYkEx?=
 =?utf-8?B?Y2tDc1F6QWs5R0FRZmtjYmduOFpMa2g1NzREODY3ay9WMko0RWZET3NLczZw?=
 =?utf-8?B?T05zNFViNGJqUWR1VVkveXd6elBCeVlLZFc2VGR1cE9WK3F0MFBTUVRLN1Ev?=
 =?utf-8?B?L2NnbWFkYkRvblpGc3lvUFAxZGVyRlpPVjdvbEd3bmxuZ000VzJlelFHSXNX?=
 =?utf-8?B?aFVNVkMwanZOVkMzNVRvSXlKNzFMNjQwQTJudW5YOWRscURkZjR5djdVTGFr?=
 =?utf-8?B?WjFnbmR1Q1FwNGI2Sm9udktkdm5GT2cyNXNsTnZqRzVJRFZZTHZ2dnZSbTFJ?=
 =?utf-8?B?QlZFb0hZN3NsTVplZ1owRjJYckFzRmdNcWp3MHBEU0IveXJJcXBMU1ZObkhP?=
 =?utf-8?B?RVIwNTBpU2U0eWFDME1HV0wxczYrRmF3TkNCYVhLdlZOTzJRcng5dU85U09K?=
 =?utf-8?B?VnBkNnFlQXUrQ2Fua3lSTGtBUjB2YjNVZGJaWnhnbWtZcTRiWXo2eHg0ZjBU?=
 =?utf-8?B?dDQ5bEZFZkZTTGZlWStocmxYdzRLb0dWdHRpUjVZTkRkWXVsN2lPWmdoVjZo?=
 =?utf-8?B?SXhHVnZMYkJGbFFmOTN1cU1pOW1pQk94OWcvOHVtNmhtTlhaclE5ZGhOWmlU?=
 =?utf-8?B?WXZkTTZPTFNPSW16T3NEOEt4OFRPMWJrSkZTWFBMV3I0RUpteGVzSk9uWm5t?=
 =?utf-8?B?WnY5REJPUVJiZWE1V0psYVB0R1JUb215ZXlrdFVmRFJjR0ZUbkFGeXFsWVA2?=
 =?utf-8?B?R3ZuQXpwRnlIbmhjT0dtbmdtZStNYW5nVkVEY3kvcVN1STVkWXZ6VTdwN3Rv?=
 =?utf-8?B?dHV0ZzV2UHhHbklBS1VGNVFaM1lsaUpQa0FJbS9XTERIemg1dVF1MjBjMmk0?=
 =?utf-8?B?eEpZMTNmNExEYnA0dFNZODhrRTlwZlFST0FOZFMzSW9jODlSclZnbWxGOUVz?=
 =?utf-8?B?M2VyTVQyMUh4cUVtSWJmTCtXcG9rMVB4akZTSE0rN1lvZldESXh5djVjSURk?=
 =?utf-8?B?TFdhdHdiWlprQ3dzU1F3bGxXLzdWTXM2SVFadkJVK1pEekVZeUlnaFZkcnpD?=
 =?utf-8?B?bzVLVmNReHcvb01NL2JRVVFTYzVFcnExM0lGVU8rV1FGMXlidlRzRnZUeVNt?=
 =?utf-8?B?MGVxZkFQWWZ5d3RBcmhxbzJGMU0rNnZwZ1RFejVadGdGU0FNMG5vcForTWFS?=
 =?utf-8?B?Z0dOdFF1R09QU2UxK2NNdGhNc1IrS2RYVWFMeUpoQmRSN1lKdVY5QlMzVFhw?=
 =?utf-8?B?SzZNSTR4SXNyajJsM1NJMDNXdVRJTmlFVEVOV3N4bElMdnUwcGIzTmJ3N3hI?=
 =?utf-8?B?YjNna0ZSVmNrMmtSendRMWxxMWF3U0dPVHltTG5nSjVUeXRYMDRlUEtXWVRu?=
 =?utf-8?B?NG41TGtlakwrdjBzcjY3OFhoZTJ6OXpTSGlYdE9CcFJENXkrK25UcitNNDFy?=
 =?utf-8?B?Wjc3YlI1TmhneDBhSUMyU01KNndoUDE0UklsaDZ6WUV5RkkydTdXYkdYMVV1?=
 =?utf-8?B?anFRUi8wamtCeEFITkRuYzR5WVNURUxaZzR6cEZjMjN1TDRUMFdjTEQydWhI?=
 =?utf-8?B?R1hYUzczUnlocXVQTmtQYTRSc0dJdkErUUtSdjNnUGV6TnpsM3dlTVMwWUdI?=
 =?utf-8?B?U0RWaVJUbk82aVgyM1lUaHJwL0RYZzN6bkZEUW4wSmFVSVVXR1JYZnRHRDQx?=
 =?utf-8?B?S3BuWTZQRkQxelhteGtPSjBoa082aFRsd2lmTVh2bXBoeDU5b1FtbjRuWDJy?=
 =?utf-8?B?MjdDbGIzNlhHcFJqYk1rMXNQTGdFWlBnbU1ZcmZqcklCZ3JCc05TTGNEdURK?=
 =?utf-8?B?Y2V1RGd2a3djQVZkQzd3THJNY3k0RmpPbUdRcnFBOStZRkJiL3ZFclJocDVs?=
 =?utf-8?B?ZEJCRnRFeWhFekVHbFdPL29sQ2hzdm0vTkxsK1hEZkdBQUxpYUJ3dFMralNS?=
 =?utf-8?Q?Ho7ri5fevI8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M09rRFF6SHplSzJ4UEF1dFFHL205SjMzOWtCTVRST0cvc2FuSlpxbjRtSDVy?=
 =?utf-8?B?bCtDNlJOT0VFZ3VLL3d0bDN6UE10MjBIWmE1MURZSTNtcXdhK3pIbE15L1k5?=
 =?utf-8?B?SmVQMzFqUWkxNjZ3Q0N0bkp1L1hTb1pvWkxhSXRQNEZuTnNwVUQwMnNZY2V3?=
 =?utf-8?B?Sjlhdng0VjFPWUdPdTZLcTliejExTWhZdGxKQnNqWmFpSmhVRHZ6Y1dCMnkx?=
 =?utf-8?B?Ym93M2tEYWFVSVdVK0V6YXJLdmxUcXRrczVRTnJ5WS9OQnZxK0duVGRGUFM5?=
 =?utf-8?B?dmtOMys1QzNTTzFrcXJhaHNEKzFlNXM0bHh4cnJGVDZKVGMvVUFVL0tPTUFW?=
 =?utf-8?B?SitUQnhLWkgwNFhUNitGZUovRmpMQmZlQmlFVzd0a3cvWWRvbWowTEFyaDZS?=
 =?utf-8?B?TC9sL1dobVRuRkR5OG16MGR3MERndEVPbFp6QkVSb3BMREVzaWJodVFQYzh0?=
 =?utf-8?B?ZDk4SVJFd2V6aDNQSkdCbWV3T2hCdzRYRnpncTBFTmFMVms0b09RTmlhWmZi?=
 =?utf-8?B?VjNveEhUbUo2eFpTSDUySVBFK1dmOG9PdCs2Q1RLV0NQeGdmeHFNUnBmemxi?=
 =?utf-8?B?dzVkbXMwUXpwcWlpWG1Nd2M5bmFrd3JQZytJUGZndzlPaENDRUJjcHhGb20y?=
 =?utf-8?B?M0tld0xjTWNyM1V6S1h6Wm5Kc2RoSEMzQnhzcUN5dHUvMmloaXpqS3NkVVdX?=
 =?utf-8?B?aFh3WE1aRGVPSFNWZ290OWszUzVRckt5ZUxiMC84a2dLd0NrZjk3NHB5YWRR?=
 =?utf-8?B?aFRhNlFYSkRuQVdJR1Z4T2cvM3REUGd2N3lxL3RYd1pzdnhmRE1YaTZ2bHBW?=
 =?utf-8?B?M2tNS3IwbE95STM4VlhwSDFpOG53aUtkdFoxbUV6UXNoSEVNbDl3dzBYc2xk?=
 =?utf-8?B?M2VBSFkrTU9sTXppOE1mbDJKOW10OVVjTDY5Q1cwU0ozcUlFM3ZDUG9vMDdt?=
 =?utf-8?B?VG1lRmhFMEN2WC9VZ3V6aHgyNlhNaW52UWR3eXBGaEFiVjdlYXJPdklLOXFn?=
 =?utf-8?B?U1RwSjFNNTU4QXpmTnpzNUQ2ODhYRWYrSC9RZ3BYUTE3N2tCTE1GVTRTbU0y?=
 =?utf-8?B?cnFKbXlpekRJajZhYmJvc3g3YjZ3aG5WZmlTYTJaN0k2aTViZGg1cVRScXE3?=
 =?utf-8?B?QllaV3lDL05ySEs3cVowWXdMWmhIMnFWejNjM3RIVm9XWWRpNkxFa05oRnlZ?=
 =?utf-8?B?ajFDZGRqVnZOTkE4QUw3Tjlya2xmYkkrVkRZYVRWbUw3bk1ONVNWWTVjNVBr?=
 =?utf-8?B?eXFubjdXU3A3dllKT2ZEUW5TN2tnWHlSSFVvY3h2c3hWYmdURHV2aVRDVTVq?=
 =?utf-8?B?T2Z4U2M0d1JWOVViVGFqbGNua2lVUXZleFBZY3NtajFqaVFNV2pwcmg2Sldo?=
 =?utf-8?B?eXFYTjltc0dweVM0djMvWXJvQmh3Zmwzc0U1ZUJYa1hXdXphQkdLOTVPQ2hn?=
 =?utf-8?B?dUtMVVpzbEdzeExJSFcvWE5hb3lKSG1wMi9XYm16aU94NGwxdkZrRkxMODAw?=
 =?utf-8?B?amx0eUt3c005N052SEcvZUl0WWh3UzRsWEtLZC96cjgzYnZlaUFyRVlZZzlH?=
 =?utf-8?B?WmFZYXRYOVJiRFFINThGRzlONnJFZDF1aUt1d1c2cXpzNTdPMlhtRWZGODFV?=
 =?utf-8?B?MzQ4SzJSZkNYNjBzVENHVGNtck9iTTM3c0xjdXV6QVN3bGM5VDQ5ZVhBSTZa?=
 =?utf-8?B?SVYxNzMzWVUyVEgzN0UyQmNmMFRndDFpemw3MVRHMHUrQ0RjVFpXK3NSczRW?=
 =?utf-8?B?Y2NRUk4xdzBqMG93a0tGb2hjamNVRWJNVUhpaVhFck9HQ0ZoRXhQVXpkK2Jz?=
 =?utf-8?B?K3oxeEVHNWIxZDVieFQxQ2NFdzZRSWFFOU96M3JoOTc1ZVhBZ2pnMCsrbHFl?=
 =?utf-8?B?RkdIcHBIMHU0U1lwc04xSloxaWQ4SzRnYW44b0Q3dWc5UWtyU1lnUEtIU3pX?=
 =?utf-8?B?WGE0MC80dVNOR3lrM2hPdHIvVGtyV0N2NDFpRWxIdFBiU0lLUUs3MlpUOWh1?=
 =?utf-8?B?eDRmZVkyZ1NlcnI4MHd2Y0dHRjRYQWpzNjVDd29PYjZ1MXRpZWV0cFdrVGVx?=
 =?utf-8?B?WHdnckhSN1paNUsyVXFIa2FsYXpDbExkQThpMnFlYW1xY3dPMUpnS0ZYa2Rl?=
 =?utf-8?Q?GLx/Uezk2pJohXOQgUS9jCuJJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dda7f8-0df5-41c3-a487-08dda29105ae
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 11:23:10.7702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udq491cXDLpJ9pivEuKyLlUpQthVMLoq+2kPV76qB1BVHJbLi8tdy1bLXmzxluxQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8461



On 03/06/2025 12:30, Roger Pau Monné wrote:
> On Tue, Jun 03, 2025 at 08:52:38AM +0200, Orzel, Michal wrote:
>>
>>
>> On 03/06/2025 08:46, Roger Pau Monné wrote:
>>> On Mon, Jun 02, 2025 at 05:09:29PM +0200, Michal Orzel wrote:
>>>> These tests are supposed to run on target. HOSTCC can be different than
>>>> CC (when cross-compiling). At the moment, tests installation would put
>>>> a binary of a wrong format in the destdir.
>>>>
>>>> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
> 
> Hm, it's unclear to me whether this is the correct fixes tag.
> Previous to:
> 
> 96a587a05736 tools/tests: Add install target for vPCI
> 
> The test was not installed on the host, and hence didn't need to use
> CC instead of HOSTCC (or at least that's my understating).
You're right. Without install target, HOSTCC could make sense there.
I'll change the Fixes commit.

> 
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>  tools/tests/vpci/Makefile | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
>>>> index 9450f7593a41..1101a669e118 100644
>>>> --- a/tools/tests/vpci/Makefile
>>>> +++ b/tools/tests/vpci/Makefile
>>>> @@ -11,7 +11,7 @@ run: $(TARGET)
>>>>  	./$(TARGET)
>>>>  
>>>>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
>>>> -	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>>>> +	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>>>
>>> This was already posted in:
>>>
>>> https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/
>>>
>>> And got no feedback.
>>>
>>> I'm happy for your change to go in, but you might also consider
>>> picking up the run target adjustment part of that previous patch.
>> You're the maintainer of this file. You should tell me what I need to do
>> unless you want to wait for Anthony feedback.
> 
> I would also add the chunk to adjust the run target if you use CC
> instead of HOSTCC.
Ok, will do.

~Michal


