Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37391AD6DF9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012792.1391296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfJl-00022s-Ln; Thu, 12 Jun 2025 10:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012792.1391296; Thu, 12 Jun 2025 10:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfJl-00020a-IW; Thu, 12 Jun 2025 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1012792;
 Thu, 12 Jun 2025 10:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eaA8=Y3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPfJk-00020U-PW
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:37:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bab28b9-4779-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 12:37:54 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 10:37:50 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 10:37:50 +0000
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
X-Inumbo-ID: 4bab28b9-4779-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xk9qSUh9utTIlMZ4a0NE95gf4ma2eZkfuyVzWSKhfQ1zPCzN/fGO3Cheg9IVA01XDDl0OrUxp+JBOYXjAn4Tlv4EDmY2oiOjhP6KkV8pEc3S9szDwuUdBE4fiJ/qi8oHVDlGg02itedZYSJwY0K9H3ee57IL+xFkKEDY0QKhxAZWzD4gbmdXOEn4ag3PwQL5EUevF4wvHOtz9ZIPPkpAZNtPsPO0p1JSRTQxXp17CHwzyfkqmdXf5Y5LBa2ijE/oQ05zEBpxq5iMe8XPmT+ISGMGm4VAaL2aoS49pmyVbH1lSOBzFfbwXmy++olKEPJ4I50GmxoAUimSFEmn4mimew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfgt0faCwlqfNukCYZw3rOVHqafZfoASff2CONnzUiw=;
 b=viziyE1cea1yiKdsUB821jaNK8wJMtGMjfj/xM3B29WLEgnidA31daNjkpuHlzxIc2MuaKvQL7mehhiKKWDTzMo+hzFIXeRIDFo9JGlb66MUBc0FJomOHKMZ0tRmrqLJGJq2TKYQa+hOsYtLh9H6Z5wiYpqmJINOymqfywlxH0eDxsZkIToS+n1NSmxUzpS3awWZnsS1wRLOc65iZqt2rKcPdyr3Ok7EHYnbTnGbqhoDCBXSx8cFe5vJht8GdKRLQExKEarOF9HZ0CucOhRlWDKszjW7i3+ujos7YdPl03rFk8BDAZLTMvAgYO10xPxqhIG5BD6+ma3e1pmTgdwpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfgt0faCwlqfNukCYZw3rOVHqafZfoASff2CONnzUiw=;
 b=nQiqHiAhIriUDItk2eHuI3LK2y2yJ2M6Gwsz0ECqGvFvgQjIiVztzre/fMsSqfEOzO3kgobYVpJHa229/yc8Ozu8N3IzFAUDkVsQC9tZ6lnyLDcGWpx3SMp8PXypBbVpEsk9taznMiSM/tIsFjTnO/U7jtFbou4OIA5HIncNNtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9105e7c1-da96-4bf9-9de8-d397712b68f2@amd.com>
Date: Thu, 12 Jun 2025 11:37:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
 <43768317-3409-46EA-B545-C78937EF42DC@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <43768317-3409-46EA-B545-C78937EF42DC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 9484b461-9ad7-4315-cef8-08dda99d2dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0JpcjhPVlZmQk93dkNBbE9DdlhkY0NBV2lCNVBHK2kzaVdIRzlrV1RaVkl0?=
 =?utf-8?B?MTgva1JDQ0NFcUptQU83TjJOd3dCS1krVDQ2bGlTWjVLN2d2ZUgrUk9DcXhn?=
 =?utf-8?B?Zm55TXpOa1dvVStlR01oeHBoYTBPNjFkRXp5TURsTnptQU1ONzJPalYyOGUw?=
 =?utf-8?B?Q2t2RWN4bm1jb21raGhNL3FJYmxLSUZTZFp3WVZSRWFNSHBxVTN4L1lBSEl1?=
 =?utf-8?B?b09DbUdQSmNLRTlOcXJSVjZlTXZtYW4vVEVPY2o5RkJmTnRCN2ZuVVUrRVlN?=
 =?utf-8?B?dFg0QkxERHdzTjdMZXkycEZwOFZRZTJ0aTRLVXFwYlpxR0kxSVZJZlJucTlB?=
 =?utf-8?B?WnNFYkZodDV3cHZjNEdpZUkvcTVPc1plbFBtVzNWek4xMDV3ZDV4d1NERm52?=
 =?utf-8?B?bE1yTHRSSXRRSzE0czkwNGZWa0tvWlBsVDI3cVBaUEtmN0g1VFFGdTN1YU1B?=
 =?utf-8?B?VFNuTy81aVJnUWllcUw0QmErTUxlelFneC8xUS91UEFvcG5IVU1KeGN3V0lQ?=
 =?utf-8?B?cXFkUGxNbWpGeHVKSXhNaXRxUm11Rm9wN0V3SmFucHpXWEpwcUVNZFQ4ZXVs?=
 =?utf-8?B?NGlUSlFxRXUwV2Q3RjVJcHFLeFFBZnJpemErS0IrTDZ2QlM3SWVvWk5FcElB?=
 =?utf-8?B?elVLbTFTV0pmT1JVQ3BtOE96cmxSMlJuTFV5eVdGQzNUcDlpb1ByUkdGbE1M?=
 =?utf-8?B?ZHo1dmNpb0dLRFhzc251L21EaTd6bU9GdVdVVDFMVWFkNWJmNFIwM0Q3N1Nv?=
 =?utf-8?B?aVQ2b2Z1RW9PUklqS3ZjSlUrZVc4MVBNSjlvR05FUnMxQ09DcVhsTGFKbzBX?=
 =?utf-8?B?b0pZREs0SHE3ajNncW5WYzVFN2s5K2NkRnllZ1ZiUXhNMUdJV0xDY2xqcnBM?=
 =?utf-8?B?cHNYWUlsMW5LS2RYTHBjRnNtYjZiM3RRWG9KNXpjbklXT1dyTGQ4RUVENTdE?=
 =?utf-8?B?aFBFYVg0M1N4QWRqOWNweG1jei8ycTN0MXhsc2txU09FRXF1d2kzNGVVWEty?=
 =?utf-8?B?SVRiVjgyeE1CZWNkeTVCeThXaG4xMFQxYmdaNThqWmFYMFRvelRUSm1DNWE0?=
 =?utf-8?B?L2RWZDRuOTRqUkczU3FSL21DZmhUUm00QUNtTEpTanY2RWNURnd0TS8zajdB?=
 =?utf-8?B?em0zd1QrTExQcUl3ZlBLZjhJUElGVnpvTG5yR2U0VzVucUFXQUtMcFNHMGM4?=
 =?utf-8?B?anlyTmo4L2FKdVJWeVZHWVZveDVVUDUyZFhUWDgzdC9UZXJGRk9Cdjk2TUo2?=
 =?utf-8?B?bzBwazcrRFNvQWV0VXNlWk40ck1ZTVlpeWkxcVkxeURzRkpmTU01VHQrK1NQ?=
 =?utf-8?B?ZiswYmVuK3NWQmdIRlcraHR1NEMyOEo3bGo0a0x6bGdEZ0p3TVp3NVdyTzc1?=
 =?utf-8?B?ayt4ODF6UEdtRVBEQ3NhbStkVFVXTTh5dFlFaEhLa21yanBNMlJYRTFXbWY0?=
 =?utf-8?B?TGZEZndtVG9oaXk0OUlKOUp2czFUa1ZQQ1RrTE1seWY3L0IrVmVRc3hLMkNC?=
 =?utf-8?B?eHFVSCs3ZkdKTXZvVnZiYlFGL2Q2OTZTcW53Z3QxNStsbjFtam5rQVZKSEVx?=
 =?utf-8?B?ZCtCbGtEOHgzcVl1MU1JalBkc2FUVG9NbGsyaXM5Z3FSbmhoNjJvRXIzYS8y?=
 =?utf-8?B?YjlhalVTWS9qSVZFUHBiajhvdXArUTA3STZtMEU4dHk0Z2k2T2x2QWp3Q1JC?=
 =?utf-8?B?QUVUOHNHdExxendsUGY5YUJ5YlFzaFhEK20ySWY3dEZQRVo4YkNNSE04eFo0?=
 =?utf-8?B?NW4vajJtTzBmbkFFVDVRS0ZWYitFYnlJb1J4ejlJR1VRUnhMdFQ0c2xGUU56?=
 =?utf-8?B?dlgwUFZGR21FbGxxcFRobVpabnZkSkZVSEFkdmNiMFd0Y29HTVQ4WG9CRkRj?=
 =?utf-8?B?aUR2ZFM0aCs0YitSTHM2SlhtRFZkd3pPendIMVB4Z0tuSUowaVgwRW9HeWRL?=
 =?utf-8?Q?j8Pv5xh4OfU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YURRem1TQ3gyWkdtRFN1QStWK2NOeUhZV3dKT3ZQU3NZYnh3SGI1N1dPdzMx?=
 =?utf-8?B?eGlrSDhBYlZhc3g0OVVISFl1cUVYTFFvVVE1b0ZDRUlVSHh0QURSbkpkb2dw?=
 =?utf-8?B?TG1VR2FKazJxalExd25SbUg0OU1tOElBNEpiMTVFYmdjZEd4dk00VzBBS1BG?=
 =?utf-8?B?M0l1Y0k0VElaSnRrRHRuYXVVSW8wUm9SOE1LMjBuWXFzanRTY1JKM2ZlQ2FL?=
 =?utf-8?B?VnhxS29LQUZFbmRiOFBjT3J4Ty9ISCtnV2lBL2ZjTVg2OEVkemI1RDRzVWxX?=
 =?utf-8?B?ZEtBYk9JdW9UYlJPOTRrdHpoOFg1OStNVjJKVG91VjYwbTJlR0hyVmtmY1dJ?=
 =?utf-8?B?aFFFWkhwOWZ3QUIrR2VUMW1aSjBmUUxyaXV4dlJQNWpZOGd0dmZydTZncnV6?=
 =?utf-8?B?R0xyK2kwR3JLRFVsc0lDbnI4YVh1MURwNU9xTUJSSGJocHIwdGo4K2dmaEs3?=
 =?utf-8?B?ZFJJa0xPckNrdDhvWThGTitZMnZ3emdST1RqZUhNa2loV0ZlZUdsRWNwVnlk?=
 =?utf-8?B?bEtnTXdlT042aUd6aWp1Y2lXQ3pPR0pMQlVnS3UvVElSbGdoUGwzSlZYTktx?=
 =?utf-8?B?YjRJczlpdEYxVVkxTk5FcnAwWE13Q3hLVEhUbWtNMjh2MURCL2JrSjJaVTFX?=
 =?utf-8?B?NWRybnVudDY0bzlxeTQwekxyYVY0WitBcUNBcWhJaG9iV08vdFZDWEp4RDNV?=
 =?utf-8?B?TXlMMDdwdWhraFFSZ3VqRVduM003VEpkd1hleldUUnlTdXkyb3phVkJvWGNI?=
 =?utf-8?B?MUNVZjk0STdMSlZLWG8zNWk3YjVIaE5hb0FHdkVSV1hNRmtLYlcycXJ1Z3dk?=
 =?utf-8?B?a2RueXc4RWZzbHhNcklTVGZsbXhYSFlTZHhMdWlXRjY2WVUxUHFCV3YyLzI5?=
 =?utf-8?B?NmIvQ2RROVBUcVM2K2N1NEdwMTdGcW9uMEdxcllwaTBZcElYbXhBcmJLYWtT?=
 =?utf-8?B?VkRZb3VQOXJ1ZUVsclg1UWcrUkplMmJpUWFSSWdBTFhnOXBSd3oxcnR6Z0VH?=
 =?utf-8?B?RU90MTRDelpOY0laSnhvNkRMVkhCQzlHcmYwYmRrcVQ3QTc1L2k1ejJxclVo?=
 =?utf-8?B?VUNxYlFMYkN0ekFWNU5tNk9SZE1tS29JYVpLRFV5VGtQSmVMNys3ODQ0MklZ?=
 =?utf-8?B?cjFzL1llYU5RMDc0czdudEVQQSsvUytTd0dBL1JPcFdEbmxzR0lJc2dwZEhU?=
 =?utf-8?B?MFBzWU11TkUzOXRvZzRiNnNhaDcrbnhxSkFINVRqeE5LQUo2WE8yM3creVhR?=
 =?utf-8?B?U0R3RUJSZlJyOEh6K0V0Y0gyRmovOTl4TGREYkZEc1VRS0dyc2RjWVdRSzRY?=
 =?utf-8?B?SnhSelVFQWhpVlBjYlJFd0VOYUxGc3VXeGxUZy95ODBKN1ptRFk3U08rS2Fs?=
 =?utf-8?B?SG55dFNQdEYrR1BUQU1Oc0hBQkZHTW8wbmhIeDZOZDNRczhSNS8ySFBRMnYv?=
 =?utf-8?B?alhzMm50NmZVejF4aG9UOVR3SUlNR3M2UllqU1NKcjNEcS9aMWhCK1FmL0Jw?=
 =?utf-8?B?OFdkVFN6YkNDOStTZjRrL2J2eGx0dkZURHNlVHFUVzVVY1BPemVUV3c2eG12?=
 =?utf-8?B?Z3pJVExRNkx2c1M2TmhieHd6ekdQWXJ0VDB0NHN2Mkx2U3dKajNWeTlmaGFs?=
 =?utf-8?B?VWxOMkN5b1c4T2ZCamlJbWxpREswTTAydStMYUdXVXkxTElQV280K25wM3Zs?=
 =?utf-8?B?MHM3ODl2WUFtL2FzVGdzNDJWa05YVUdXTVJUOWtTZVlHMlRYY05VNXNSRThE?=
 =?utf-8?B?Uy9QUk1MMVBhWnlUeDArbGhwUm1jU0dDUUtHUFMzOExIeitQUWFNaW00V3kx?=
 =?utf-8?B?TDFrc1BMY1ZKbmtpY3pDOEU4Rkh1NlJpY2J0ajY0RlhudnJPbmF0TE0yVURq?=
 =?utf-8?B?Z2xmUXRxTVVwT091bUozd24yZ2VZRnpDazdmeC9peGlreHk1aWFndW9rZmd0?=
 =?utf-8?B?M1FqOHF5MmMyWlREdFZnak0rck1vc2VBLzY5TW14SFZYeCtqajFnb1hxeU54?=
 =?utf-8?B?a3lTNXRWa0tLYk5hNjUxLys4cGoraGtscnlFdXBUa3E2NHFjS1NZV1NNcmlP?=
 =?utf-8?B?UnJlZEtaaGhYendvOXZOa2dLeVdGWlRHR1BFcEZWMFhaZUJhTWhMbDc2VE9N?=
 =?utf-8?Q?4Dl6wDb08fvy7tyBP1u2v0lvT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9484b461-9ad7-4315-cef8-08dda99d2dac
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:37:50.0958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NCFxF13U18j/2uTtEFdWdf5Q0fMTRH+FSxqhlKXKL0ZJ+hspDXRyJj+1O8qH7N0PMRmfx+XvH0CUY8gvpxmFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306


On 12/06/2025 10:35, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Define prepare_selector(), read_protection_region() and
>> write_protection_region() for arm32. Also, define
>> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 255.
>>
>> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
>> Enable pr_of_addr() for arm32.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
> Based on your v2 (https://patchwork.kernel.org/project/xen-devel/patch/20250606164854.1551148-4-ayan.kumar.halder@amd.com/) I was imaging something like this:
>
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 74e96ca57137..5d324b2d4ca5 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -87,20 +87,28 @@ static void __init __maybe_unused build_assertions(void)
>    */
>   static void prepare_selector(uint8_t *sel)
>   {
> -#ifdef CONFIG_ARM_64
>       uint8_t cur_sel = *sel;
>   
> +#ifdef CONFIG_ARM_64
>       /*
> -     * {read,write}_protection_region works using the direct access to the 0..15
> -     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
> -     * only when needed, so when the upper 4 bits of the selector will change.
> +     * {read,write}_protection_region works using the Arm64 direct access to the
> +     * 0..15 regions, so in order to save the isb() overhead, change the
> +     * PRSELR_EL2 only when needed, so when the upper 4 bits of the selector
> +     * will change.
>        */
>       cur_sel &= 0xF0U;
> +#else
> +    /* Arm32 MPU can use direct access for 0-31 */
> +    if ( cur_sel > 31 )
> +        cur_sel = 0;
> +#endif
>       if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>       {
>           WRITE_SYSREG(cur_sel, PRSELR_EL2);
>           isb();
>       }
> +
> +#ifdef CONFIG_ARM_64
>       *sel = *sel & 0xFU;
>   #endif
>   }
> @@ -144,6 +152,12 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
>           GENERATE_READ_PR_REG_CASE(29, pr_read);
>           GENERATE_READ_PR_REG_CASE(30, pr_read);
>           GENERATE_READ_PR_REG_CASE(31, pr_read);
> +        case 32 ... 255:
> +        {
> +            pr->prbar.bits = READ_SYSREG(PRBAR_EL2);
> +            pr->prlar.bits = READ_SYSREG(PRLAR_EL2);
> +            break;
> +        }
>   #endif
>       default:
>           BUG(); /* Can't happen */
> @@ -190,6 +204,12 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>           GENERATE_WRITE_PR_REG_CASE(29, pr_write);
>           GENERATE_WRITE_PR_REG_CASE(30, pr_write);
>           GENERATE_WRITE_PR_REG_CASE(31, pr_write);
> +        case 32 ... 255:
> +        {
> +            WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2);
> +            WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2);
> +            break;
> +        }
>   #endif
>       default:
>           BUG(); /* Can't happen */
>
>
> Is it using too ifdefs in your opinion that would benefit the split you do in v3?

Yes. However, I understand that this is subjective. I need your and 
Michal/Julien to have an opinion here whether to go with the split 
(which means some amount of code duplication) or introduce if-defs. I 
will be happy to proceed as per your opinions.

- Ayan

>
>

