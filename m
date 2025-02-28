Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB54A49780
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 11:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898611.1307133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnxi5-0000e4-Vz; Fri, 28 Feb 2025 10:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898611.1307133; Fri, 28 Feb 2025 10:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnxi5-0000cF-St; Fri, 28 Feb 2025 10:35:13 +0000
Received: by outflank-mailman (input) for mailman id 898611;
 Fri, 28 Feb 2025 10:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3SU=VT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tnxi5-0000c8-1K
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 10:35:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2417::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc8c26e-f5bf-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 11:35:07 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 10:35:04 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 10:35:04 +0000
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
X-Inumbo-ID: adc8c26e-f5bf-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yo7jKfgwPyTWsZOIJd1n6j5CQ/iarBBdGePELg/JMwNzW31bu3Fp0G5GckXX8px8q8Hqqh0PbUVPXwv0nJvGgI7c2KNbax9vnEjzOuja3pprRV79ko2uRkukszH6iNL1Ot9wTyLP7hy7X2sYdBx1oQAB6xJXY3FUsrTuOoRFnuIVs1qaNG+PYSwoVi7pF5Rq+RG2Wqq0Yo9fhQ7nNcymn66JdVspJAwVXxHBPOqSRb5nWVbL2UkE9+s3JRq5hj9KY66wMXYrc1upar1DMI2yIBt6D2E1fKhULioz4qgv7OS378/Vo9zx3mDnhgOZeut48jkbc/lvyAI2JRbvBoMyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp6IvtxYgksaVG7DtzpCh7bs6UkTSS2wRXOCjWQ7jQg=;
 b=Bk2tM/ONCml7Hxf9cEJbDIDzROzf7c3XlUB9uc+kGlRoqYHBrgGe0rsYYM4C4iiEwsB7GQtL88kjl9wSCboXLUSye+8OPzeEwuMc9rWV3+waJEP54uPNMABvleD4fM5OQwN58SiE6xNzxEYPScH3ESV9WWPgA32hruKpuXTww/XJvHEmXp2HIRAIngv/A77m2FFIvpdZ7xqSorvSh4Pv9h1mnPbLAU6YEAfuwWRIeVS0Kt0knPTaiJo80VuBhnApsmqIHiDn+Bh1+H1SDv13I+69nyF/N+2rmShjEFzzr2MSk6Q0+PDwKoEcxNTPEjY/xbBlRYPbF+vc7GkTVdG1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp6IvtxYgksaVG7DtzpCh7bs6UkTSS2wRXOCjWQ7jQg=;
 b=aoqt8leA2P+Gc4a0F8v7+B9gV31ecP8en3snhcMfApP9g4C5j/RazUgteQKcydBUhIywMvx6SkWOX8uHeF6C+UNOX3yYPeNsmtKZfHbxY3sLCcDkx1PCFtIm+nDUbGuCsSpM5JHy3ylwiCt6QAJGbq3Wy3EfdRD7s39sdbpYsDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <956eb845-5848-4fbc-9596-e2f088192c43@amd.com>
Date: Fri, 28 Feb 2025 10:34:59 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
 <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
 <a593bbed-24de-464e-9fea-db988cc61f7b@xen.org>
 <CFF70353-90F6-4ED4-AEE7-155C4480AF98@arm.com>
 <9f5f044f-447e-41f8-b981-3aa2a848d458@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9f5f044f-447e-41f8-b981-3aa2a848d458@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:8::14)
 To PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: e2431bb6-b192-4217-a125-08dd57e38fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ellvZmdXMUNSVTZ2WVFQVUtVTUFuRm1OZ3J5T0EyZlhqZW5jS0RNUmJ5Y0pI?=
 =?utf-8?B?TjYxVFNPendsVS8vZzBZbk81Y2o0SDZFaEFUbndTekc4eWMxQUJJTWFxVE50?=
 =?utf-8?B?aTNFTVFuN2VYclhvNTc2YjJKK0FiQVN1eUR0eFowMmJ6WGlFTCtJS0txNEtn?=
 =?utf-8?B?ZHJXTSs3MWhrVFFKWGdmZXY1bTEyN0tNOVRPMVdqcWlLWndrVmVCUmdxMm81?=
 =?utf-8?B?RnJMdGJMa29WYmJlL0F1d1V4WmF5M2tJazJla0tjMmM4akVVVkp3NHhxeWpE?=
 =?utf-8?B?QStBREFwS29oNnd1bTI5UjNKeUtKNUxxWmVYQ3BjRDcvajdVYlBlYjJyK2tp?=
 =?utf-8?B?QUkvN2p2ZHdKWU52Z2JSN1RTaDczVlp0cjRmV1BOTGtMYkhKdG1PaEZYeHN4?=
 =?utf-8?B?SVE1TGZVUHV4akhrWk9xT2p6aS9FT2dkcEJmZ1laOEtMT3dNWXBGOEZlanB3?=
 =?utf-8?B?Q3JzNDJYRWFubm1ZckYrQTMvdjZodDZkejlqL0UwNGM0ZkJDa0c4WnJ6Qnla?=
 =?utf-8?B?d3ZEOElRQWJ5RzB3Tm9uK3J0d2dud2pOOGE1Q3VHazZBc2xnb0QxVzNJT2d5?=
 =?utf-8?B?MmNxMU1peGhJTEplRVIxdDJZK1ZHeEE1ekE1RngzT3QzbDltQmV2T1ZoZXIv?=
 =?utf-8?B?THhZZm5BRitvK29oZk1MQ1B3RlZRZEtlOHovVHhhVit2ZzBPenN5WlBGYSta?=
 =?utf-8?B?d0RnajVTL1FpQTNuZldPdEZPVVBNS2liN1BPcFc2TGRQbDY2RkZLbndVSTNn?=
 =?utf-8?B?T05WN0hBYVNmbDBzaEgyK01FYVBBMDM3K0txd3ZsQ0l0Rm9Fa1Z5MVRhcmJy?=
 =?utf-8?B?TGpuVG1wcldmSjQ4aVA0ejRJTWxCMWg5WUZJWEVMMnQ0cVVjaGRrUnc5cmN5?=
 =?utf-8?B?RFRhRW5TcjNaQWszdXpNbkpJdm9aWmp3cG1kb2lOZ3huemRnK1lZazRubFYx?=
 =?utf-8?B?cndPNytHY1lURFI0Q3FZQVZrcFJiWnBPcWd4cWJkOG5MbWJDMTZFbHdqcEJk?=
 =?utf-8?B?WTBRbWtxWldPTWl5dGJZTDNUMGRWTXZBTVN5NFI4Q1NCSnVBOHF0NXM5N2R4?=
 =?utf-8?B?c1ZWVnlsL1pFNkpVa0lpMnVCczRHai84cE96S0Y3QVNLU3VQa0RjUE8vSjRs?=
 =?utf-8?B?YVlwM2FuT0lwL2FCc0hJWDNsQXlCRGNKUEJvNnlmbUtTQ2VORWFoRHE1QVdL?=
 =?utf-8?B?MmVRK1lOc3BnNEs0V01kUG1qbWFzemViSHN3Y1IyZ24rV0drem85cjlhVlJX?=
 =?utf-8?B?ZjNzSUlkZ0IrS1lUZXRCVUxRUXhGMmN3WUxmYmZ1aHdqNUdBbHdNdFVmQklR?=
 =?utf-8?B?WjE5WTkxQm5GT3VqQitFVmhZU3FSK1VUdWdEZjhyTW80eXR5UDlab2lPdjUv?=
 =?utf-8?B?VG0vMGZERGhoMlZyVUFpQlJTY2NrQ3I4aGxOMzQxTVRDd0dZLzI0OCtrazd5?=
 =?utf-8?B?ZVVnQ0JxU0NZZmpMRWlHYzMvUTlQWVdvUm5nV1BQc0FlcUhsUFhoUzJEZUFH?=
 =?utf-8?B?a29nSHpldDdNSGZWdlhKSE5IcXpSelVHNFN6QzlXQlNIZG0yaEJleER5UG1C?=
 =?utf-8?B?NzA2ajZYTU96SCtqQXdIZ2dpWFR2eEE2QUxOVi9xTlUzQVZQSStDVVIxNXBK?=
 =?utf-8?B?SndSaitUMUg2dXRsd2NxRFNPZUd0SHJLaGFuVFoyOGZGUElnVmFkY3MyZisx?=
 =?utf-8?B?RG0yNDhMV0o0c1ZzTk1FQkJNY2c1R1YvWm1uVEZPY2VhOUZRajE1WXlYRE5Y?=
 =?utf-8?B?eWhPV2xaVWtzekFEaTJQWWhXOVR3cXFsdmo2OUszQm9VbFhMT3RibFBhOFdj?=
 =?utf-8?B?OFZMeklSeGpyd2NIcFhkUENtSTZsK0o5U0xjMnpPT0QyQWl2QTI4dFVZQUFp?=
 =?utf-8?Q?GVr7MCshzJlwd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWV3d1FqK3RPbFRSTDBISDk1bTFxRXM1VjNYWW5rak9UQ3UzazdxUGcrVjQy?=
 =?utf-8?B?TzB5YnQ1bXNWdWVXbVNlV05ka0pZdkJzUitiRk4wMEZoOW9yN1VLeEcyd2Zt?=
 =?utf-8?B?em1oaWRKaTJ2U1pPVlJ1MXNieSttUGZpa3l1MG5MZ09Kc3BzTkhieU5WZGtq?=
 =?utf-8?B?NzJmSEM1Y2NKdlF2SklZOVkzZktqbEdjdGpIUHhJRUIrU3crZ0VBQWRUL3h5?=
 =?utf-8?B?bDg1bkVxcTRzOGV3Q0tDdGhhWjNGRGMySmZaRDF4ZmpNSkVMcFR1b2JQU1Jx?=
 =?utf-8?B?Um1ickR2bkxZZnd4N3lrV05ENHRGbWNrZGZzRCtScHlPdGxyMWhldUI3NHMx?=
 =?utf-8?B?UXZQeGhrdXlybUd0RU5OdXc1djBZbVB5RERwbXhRZUxleEhnRjNkR0p2S3JZ?=
 =?utf-8?B?NEhzcEhidzNjZUtRYU5zZ1BydHBWREltT3djS2ZCVWcrdWZxZjAyejY1dk1D?=
 =?utf-8?B?UnFzdHB1QlFUOExxS1pHMEVWYkw4L0hqV0dBVW5KbE5SbVNGT1FMOEUxRWlO?=
 =?utf-8?B?SzNJdHlnSFovR3Y2ckY4dU0wVzBpL1RLRXB4SklQWjhiV3BhL2JJSlIvaEFl?=
 =?utf-8?B?cU1CTG15ZmxyNU9WTTFkK3BxdjlHbkhMWTVUdjBoaVFRWFFQUHFJY3NFQTNi?=
 =?utf-8?B?SFp3dEsxQWdZTUVacDdkU3lvbWNod2FZL1NzOWZ4Nys3SS8wV1lwYnBEU0xr?=
 =?utf-8?B?QytYRkdnVzhCT0ZsVGk4T3JDWDRuU1N6QzdlcWpUT2c2SHp4bFRwbjFiWTMx?=
 =?utf-8?B?Uk1UUVA2a0Z2ajdlTkdhenZSS2owQi9zclMyTVFacStiWjQvZWNCUzFSL1ZW?=
 =?utf-8?B?dFUvMldGcE1acklocUNEVVh5ZUIwQ0I1MTlkaGp1Tnh3RzQveHlBSW9MeVpw?=
 =?utf-8?B?YjdoaDdiblNMdllmNytCcEk3ZmlCcC9ydWhPMVV1L2ZxK3phdlhVVU5EbkpE?=
 =?utf-8?B?L2o5Zm0zYWovU0lsTTgvUUczZkhQdU02RmdSOC9POTJWYzBkTTBzemNVUm53?=
 =?utf-8?B?R3czT0w0YkVHUk1zK2daSkJOYkhOS3J2a0RnandjWmZTRDdrUmJEaVRvMHVo?=
 =?utf-8?B?V0dTRnliS1RvQnA4TGd4ZXJJcHRLMTFSL0ZyNlhJUFA5T2dMREV5WElYdXZ5?=
 =?utf-8?B?OW9aVDZieVZJb1ErQnA3aUZEdmo2Vzc5WHVOMzJOSm1tQUx4UWk2S3orY2hK?=
 =?utf-8?B?aDVYaytNMHRqMFB1N05MQkM4dUErWTUvTmdCTW5CY0VGN3JvZ00yUm1kRms0?=
 =?utf-8?B?SFN6RWRNbyt0RFZPUVRjY2w2Vm5zcGh6K29EN3plWW5oRDhEeEtMc2tHcURB?=
 =?utf-8?B?ekRaQ0F5cHZlK1ppaHlxczBDWXRWVXErTkZKeGJZVW1vclRiSmlYNzAzY0Yw?=
 =?utf-8?B?dHh3YTVMdzMrYS8yRFd5Zy8xQkxvblFlVHdkSHYzOW43cTNtN2IzZlltb0lD?=
 =?utf-8?B?OGhGRC93aXdDZlllN1l4UFhIZ0xYV2ZCTFlibUEwQUNJOERBcmZUT0hxSnVw?=
 =?utf-8?B?RVk4cjRMWkFGQjArbHJpVWhHYkV4TjN3VCtxTVNMN29VZXhIWFoxSFNBNVNU?=
 =?utf-8?B?bjg1VUtBV0hkdkN3YTlZVmwyR0drQUF2UnlKbW1UcFUwNzllU1hBamV1Z0pI?=
 =?utf-8?B?TU9QK3J4T1gvV1ZaMUtEK0hFNFhLTENPdG1iTTEwKzROUmxoeFRhMHhDZ0Jz?=
 =?utf-8?B?RmRkbjhiSXpSY3FDMUp4UWFhUjVPSEl5ZXVxYmNrWVJYZVE3N2F1bmtZcW53?=
 =?utf-8?B?Z1BYRmx0MDIwUkp1TWM2SXVZWlZTQVpldjJLbDZJNUxiaGdlRERxYlZpUVEw?=
 =?utf-8?B?QWRaSHJucVB4TjFZczByajlVWHNWUWpuSjlUaEdMZHlGNWNRZEcwcmdYSkw0?=
 =?utf-8?B?ZlRBbXViemEwaTZic0ZBaXV3b1Q5cHloNVlZc2xGaTlpWS9XQjNlNE5rWVht?=
 =?utf-8?B?ZmlOMmdUbzZpVFFZMVVsVmZ5a2hCMVdueUM0VUlXdTBqejl0NE5nWHdod2xZ?=
 =?utf-8?B?TXdTVzVXUEtSYjFBcTJGbWFsRGk0L2VBRjE0a0pqeE1IV1dnTzN3UDZEY1Y4?=
 =?utf-8?B?b3gvUXJrVWRFdER4eW90ZmlTc2JkNytOSzNtejliV1JZZk1ObWt2NDlsS3pI?=
 =?utf-8?Q?XuVUbtPw5OgzvV421IKmd6DWY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2431bb6-b192-4217-a125-08dd57e38fca
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 10:35:04.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEPoHwezoHyFuj9bQxJQgUoMWGBFby77q3W7vO/tZQYIXgHVQ2Ue/+t1S0Ek8Djml+v2HAByJvJJ5PGpEs/tww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461

Hi Julien/Luca,

On 28/02/2025 09:22, Julien Grall wrote:
>
>
> On 26/02/2025 08:28, Luca Fancellu wrote:
>> Hi Julien,
>
> Hi Luca,
>
>>
>>>>>
>>>>> #ifdef CONFIG_EARLY_PRINTK
>>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>>>> b/xen/arch/arm/include/asm/mpu.h
>>>> Why not in include/mpu/ ?
>>>
>>> Do you mean include/asm/mpu? or something different?
>>
>> Yes, sorry typo, I mean include/asm/mpu/mpu.h
>
> Thanks for the clarification. I don't have a strong opinion either 
> way. I will let Ayan decide.
Can I leave as it is for the time being ?

I mean I will create "xen/arch/arm/include/asm/mpu/" directory when I 
know there will be more files.

Let me know what you suggest.

- Ayan

>
> Cheers,
>

