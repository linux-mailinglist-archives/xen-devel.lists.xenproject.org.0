Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FC50F99D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313644.531307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI4d-0001RT-JA; Tue, 26 Apr 2022 10:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313644.531307; Tue, 26 Apr 2022 10:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njI4d-0001No-F0; Tue, 26 Apr 2022 10:05:35 +0000
Received: by outflank-mailman (input) for mailman id 313644;
 Tue, 26 Apr 2022 10:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njI4b-0000NY-7R
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:05:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681e441b-c548-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:05:31 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-NP51lWqxPAmzj90HzgZXIQ-1; Tue, 26 Apr 2022 12:05:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:05:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:05:29 +0000
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
X-Inumbo-ID: 681e441b-c548-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650967532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8XyV84mse8tuFsetJlisN+guE7TcB4fbUoJF+UDFJg=;
	b=CAUNz5ZKUWLY3PgMhUchKbN8QW3Msn3Se2+L/KRj3vlUNDq17tuZgschKxDMHD6BScy2hM
	LjaB+S5YLGiFNEGkxHBPLg+tAtlZd7Cy79WW9Up0glNiYCaFS0ylJ4I9cHxWnBjmJ6UjJS
	zqJ33Km5GVXYYryhO+LFgKOn3aS+z+s=
X-MC-Unique: NP51lWqxPAmzj90HzgZXIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2n1mtdYf5goyiy6WnINRTy+oihxM/HzRoQx32gLrFLijXCf8OMfJ+rifivITAAtPUzcBg7KDkS/jNxUgGPB41Gguv7UuUN5C7Ell+JlDiBXRha0pau0ZgVBcWR32Ki9/kj6ET2GbjEw5UvpenfGMAnMoLx9yovRhL0CrvlVqSOxF+8nbILq6P1fis+XFL6UF8e6cfXju6EmHD/Fn9XuHfFeMh2swTyl8/lg9VZGyz2GL29q4Q0z48UoBfm6lNZH9ejb39TljPkWSRlZNjcp1R3FeNd+h7GDYHLLB7L2Lo0D2Se1R4BJhUiAi4QpEO/Q4FDVBI+qw0JYprhnHhlIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8XyV84mse8tuFsetJlisN+guE7TcB4fbUoJF+UDFJg=;
 b=V0GuZJiIA8qw9T4O8sf1sA+Xb/B+t8tLjCbXR+YXVwV0m7bClNVFMul5hrSnH3FhcgT8Lsa/5gihQfC0DI7HKnlH8cEW5fOUjTeDO7MUf77MrSNygGykHW1FMlbapRSP/taZynjtKWRT1jRwQAEznL/imvRHP4ttEUyrWmzhkFvYGL3jyK50d1PKMVPTLe2YTdiEPFgCH+Av585Ea66ivjdGzV17usqZ+w0yi7tLYvDi5AH2EzqC0EMHKzKkPQDmNQ00gqDXs8YaETjTCK5/FYGvtAu95zamcNQKFnAgRnJNsKdY7zi42wlwGS1tt8M5ZB8FlGpCkPw7rsxqfAUxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
Date: Tue, 26 Apr 2022 12:05:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
In-Reply-To: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0176.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97e59483-66da-4853-cc83-08da276c4b08
X-MS-TrafficTypeDiagnostic: VE1PR04MB7358:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7358621D07AAEA705F141C9DB3FB9@VE1PR04MB7358.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o3s7Ck4QIaIWdnIVdHjwsv2sz/S3hCPoEZ4NGPJvYY76QNtqU5AVHSt8OZyOVH+jeR093xhUXZr5myMVDd3XtqfxHRLZl1VZ36CKxw2Nkz+NYPQbSUgd+ineLZGe3jP/4H0GYSDu0PF5DBzJUazsLmVWSSRkVTAL1H6GWQdO8RqLQu91G7SgYSP7g3k+YT2hcttJ9pMcLKATYghBhWHwr5xUrjkdjJlprR8OUit27lzgYA+ydqcicdp6+3QdhBLF6H0kA8rZuRWs2sdWk73Tz88UO5NIckgV6ZZWSwsNCB1HWSAowSopeb7Av/XJpvIL+RWu2BeJ08VIgK3s18JQ7hBMPNa6lXS/sM4JQMz8iq1uN5RJOEbnjKEICDgYk9e9VaGimMM9sQKU5UKikBhHSAZz7lwkBtb3WntAutF57rwKNRoeFdUmSTPOiOvGvqpQLGjn5H+F2sCjooOtXDvYAjM2NOP/XcLgKuUZVqhSwld9X38g/k29fgkLq6meU3PHy9xjol6X6bJbDetPKIn5WnxjWtzgO+s3TVzXYmRk76Kx4CtE41V3MloGuBl4wDWIKpGpmMUM8MsXTu8yE6o79qI3qiPVl3uECVczCi4ch3XyxZqzErnljfCZfMdfIcx6KKet9L2kxKIg2DjqS8ALwIEpmUOyR57WCcPiu2WhwfSoDFA73KLWSyPYL8mYzdAeRdzLPYEoi72D3QCwdqygVr/ObqJyt907vw8hIdEwkfQx/XMRQV5WAHF3PT5unko3QqH8MNW09NAo+q5dfaVGujVPq/9PIFbuIaVf7RIrGp+ZS0+eSTCl6xoCA5R6+dl69VqcHUxZ9+GGmzlnBOf2cw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(8676002)(5660300002)(186003)(2906002)(31686004)(83380400001)(316002)(54906003)(6916009)(6506007)(66946007)(66556008)(66476007)(26005)(6512007)(8936002)(84970400001)(6486002)(31696002)(38100700002)(508600001)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anczRFlHTEdvT3pUb09xTVg2THVLUkJFQ2szQWY4YzBzenpWZmRoNVRkUGds?=
 =?utf-8?B?RGs4NUcySUVJaElWZGdsWDJFOXV5V0wyV2xKa2ljZzN3NmpjcXpjallsKzR4?=
 =?utf-8?B?d3JYSWZsUXdmaTBSdCtFYWFzRW8vczl0QXhsUUFkV0p2S1lLWmMrK0NnaTNB?=
 =?utf-8?B?My9BcTRIYUgwNytIVUY3dGIrOHY1QzNRN3JqdmtuSTc1cElVU1B3aEFobzFP?=
 =?utf-8?B?enE3ZDYzYm8vN2lTZitYb0hNL1BlS0xGSEdYZ0N5V0xJcFBiZFhrMEVqMjV5?=
 =?utf-8?B?MjIxOGdPeXQwdTZoaDUzS1ZVUzRJK3NjNytBaGpROUdxU1Bid2phSGEwU0d0?=
 =?utf-8?B?UnAwamZHVmkxNjR4TTVmanVsWjhsamhQNEZUbVdaQWFKcDExQlF4eWxWWWhB?=
 =?utf-8?B?S2dtN3hrYkRQQjVOa1AvdHhoalY2UFV0T0M0V3EvRmdjZ0czOURlajJKM1g5?=
 =?utf-8?B?MGxnV3VMTjZjRHQrOUtTQUlRRTIyNmozd2hzaDBYRytUQUlqeCtpeTZpMjlm?=
 =?utf-8?B?aGtUZnpVeWxsQUQvWnVrTW5rYVQrdThmWGh6YjZvVGkzc0VMMUVrcjRIYlNH?=
 =?utf-8?B?UHBDbGV4Ymc1cGRldTVoNU56UXhkUUVReWJFdFpRNVBqTjRZZUtERmZYSnhG?=
 =?utf-8?B?c1d2REJteXdzSXBXSERqR0VyN2VBM1BMWDVMV1E1NSt1QUdnQ251R0J4bnQ0?=
 =?utf-8?B?N3ExaXp6MkRSSHE0Yy9oT24xd3RPL09hTHQxTFJ3NTViVFIzRzd5QytleFdz?=
 =?utf-8?B?aEZnTXNENXJWSVp2YmhETFJaSW8vdi80WE42Nnh5ZDUrOUJYMXlFNG4vYkVw?=
 =?utf-8?B?R3lua2p0VGhsaWZSdmQrcnBWWDVYY1RDVCtCbDJ1aFRRQmc1N2xENEQ2S2py?=
 =?utf-8?B?ZXh5Z1hkU3hDUEw5OWN2cWJEeFA3ZUQvdkk2QWdxUFFSNlhBRHhzZUtIYVRQ?=
 =?utf-8?B?elVDUlN0Ujl6b3FtYUJDM2ZFby94OXJjR1c2bEcxaEdyZnAyUHJZVlFBMnc1?=
 =?utf-8?B?MmMzUVBsSUtObnpBTDI1bmpqblpTemFmL1puOWZpaFRLeGRoMkRwa0JtQWRF?=
 =?utf-8?B?bmVWWW1iOUt5cGtlYnFnTGF0dFB5SDdLQU80VG9ZNVQxVUI5NGM4Q2lYWm8w?=
 =?utf-8?B?eXVSOVA2dTlyTFkyZkQyVWkrUThEbHRIZEFpU3IrZkdrQWZ1LzhYZFVQakl6?=
 =?utf-8?B?Z2RDUndPSHNLa3lxYi9GUmkzNzdIYlp6ZkFhTFYvZFBET05GYkZxUkNuemRY?=
 =?utf-8?B?R2U4VmJVMnoxM00zQTExQ3dpVzZ1TTFxZnBRWk1mSVMxLzR1OVJpaUxtWUgw?=
 =?utf-8?B?ejlzVmdLb2tETC9Xc3NOc2kra0NBcEoxZzRWVGlsVDJCTjQ1bEYrSEVHelAx?=
 =?utf-8?B?b3dJaExEYVBaRWxBV2ZKZWpraUY5bDFzZjVPL0dBZXRSc0U5bnEvM2RqdDlm?=
 =?utf-8?B?OW1oekR0anMzRlh0ekRiMmVwVDJ3VStaUXVOekxVSG1qR000SEdUTFlkLzNp?=
 =?utf-8?B?emlnMEU4Tk9QLzBWVzcvK3R6Nks0dEF0d1JXQmVtK0R3bkVUYjV4cG96c0Rl?=
 =?utf-8?B?dnlDTjk3amR5RFNRem1lZGhhM1VIaVhCaU9FUWFOWE90NkJYVWxXajFGalA5?=
 =?utf-8?B?TEJaZXNPQ2xIclJPQWJYL3dMajVyT3Y2VW5WdktLYWlDWTU2QWltTnY0Q1dv?=
 =?utf-8?B?TjZCeElhWklCaUlUTklSQlluQjV2SlhvTVRaWU0rM0pSTXVlelo5MzB4K3pw?=
 =?utf-8?B?YnFRTGQ3dHhtWTdSNE4zbm53SVlWb1I5akNoazVBVjBDSXROOGZvVXBaY2I1?=
 =?utf-8?B?Zi9HU0NjOXJZMERkRktXeDErSWhLSTZmT2VCK3VYNzBRRnR5dEM5dmVwWFRB?=
 =?utf-8?B?SXJzSE5zU0NoVTAxeVduNk16RGdpV1lsUnArSTZvdVg5V3RrRUVvNGN4QU81?=
 =?utf-8?B?cVRJcnNHSnYwSzBuM3crSzlZaUNia3RBdnVsSkRIR0d3WVpyT1k0TGZacE9u?=
 =?utf-8?B?YVR5b1NmenJNUjRQcTBRT3pMa3VBdzV3UGdFY3NFdEcrS1dYbnpkN1RGWEUz?=
 =?utf-8?B?b2k4ajgrTEM4SE9VUVVpbm5hMnpBajJDUHVrOW56dkZjOHdCK2NOTTh5RWN4?=
 =?utf-8?B?QVdVMTR2eElPRlhReHdsamowTkVibXBYWFEvRFNHQ2tjZnFxT1o1UFhkS29o?=
 =?utf-8?B?YlVsemcrNC9qNHdWbGpUNkJkUS9PUUczOTJYRHFnbXM5YTBZbVc1VVVha2Rk?=
 =?utf-8?B?VXFEMS9ORTVwakhHOW16OHRQUDlueGxlSDdxQk1ycmtWWjF3RUNDYzQvZlF3?=
 =?utf-8?B?ait3aDd0RlljT3dEclFYTkRLcEZZZjl2ekJIQjNOZFVyaEo0QzFMUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e59483-66da-4853-cc83-08da276c4b08
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:05:29.6415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL2RYUiyXHdJUODnunlo5VMp5ZHrOsY0UoRLdwsW25thE3RDB/DI5LYB2XJ91PDUG+kriTalr6iRP/a+Ez6d1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7358

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
exclusive - only one of them can be enabled. By default, 'intel_idle' driver
enables C1 and disables C1E. However, some users prefer to use C1E instead of
C1, because it saves more energy.

This patch adds a new module parameter ('preferred_cstates') for enabling C1E
and disabling C1. Here is the idea behind it.

1. This option has effect only for "mutually exclusive" C-states like C1 and
   C1E on SPR.
2. It does not have any effect on independent C-states, which do not require
   other C-states to be disabled (most states on most platforms as of today).
3. For mutually exclusive C-states, the 'intel_idle' driver always has a
   reasonable default, such as enabling C1 on SPR by default. On other
   platforms, the default may be different.
4. Users can override the default using the 'preferred_cstates' parameter.
5. The parameter accepts the preferred C-states bit-mask, similarly to the
   existing 'states_off' parameter.
6. This parameter is not limited to C1/C1E, and leaves room for supporting
   other mutually exclusive C-states, if they come in the future.

Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
to disable C1 and enable C1E, users should boot with the following kernel
argument: intel_idle.preferred_cstates=4

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6

Enable C1E (if requested) not only on the BSP's socket / package.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/docs/misc/xen-command-line.pandoc	2022-04-25 17:59:42.123387258 +0200
+++ unstable/docs/misc/xen-command-line.pandoc	2022-04-25 17:36:00.000000000 +0200
@@ -1884,6 +1884,12 @@ paging controls access to usermode addre
 ### ple_window (Intel)
 > `= <integer>`
 
+### preferred-cstates (x86)
+> `= <integer>`
+
+This is a mask of C-states which are to be use preferably.  This option is
+applicable only oh hardware were certain C-states are exlusive of one another.
+
 ### psr (Intel)
 > `= List of ( cmt:<boolean> | rmid_max:<integer> | cat:<boolean> | cos_max:<integer> | cdp:<boolean> )`
 
--- unstable.orig/xen/arch/x86/cpu/mwait-idle.c	2022-04-25 17:17:05.000000000 +0200
+++ unstable/xen/arch/x86/cpu/mwait-idle.c	2022-04-25 17:33:47.000000000 +0200
@@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
 
 static unsigned int mwait_substates;
 
+/*
+ * Some platforms come with mutually exclusive C-states, so that if one is
+ * enabled, the other C-states must not be used. Example: C1 and C1E on
+ * Sapphire Rapids platform. This parameter allows for selecting the
+ * preferred C-states among the groups of mutually exclusive C-states - the
+ * selected C-states will be registered, the other C-states from the mutually
+ * exclusive group won't be registered. If the platform has no mutually
+ * exclusive C-states, this parameter has no effect.
+ */
+static unsigned int __ro_after_init preferred_states_mask;
+integer_param("preferred-cstates", preferred_states_mask);
+
 #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
 /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
 static unsigned int lapic_timer_reliable_states = (1 << 1);
@@ -96,6 +108,7 @@ struct idle_cpu {
 	unsigned long auto_demotion_disable_flags;
 	bool byt_auto_demotion_disable_flag;
 	bool disable_promotion_to_c1e;
+	bool enable_promotion_to_c1e;
 };
 
 static const struct idle_cpu *icpu;
@@ -924,6 +937,15 @@ static void cf_check byt_auto_demotion_d
 	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
 }
 
+static void cf_check c1e_promotion_enable(void *dummy)
+{
+	uint64_t msr_bits;
+
+	rdmsrl(MSR_IA32_POWER_CTL, msr_bits);
+	msr_bits |= 0x2;
+	wrmsrl(MSR_IA32_POWER_CTL, msr_bits);
+}
+
 static void cf_check c1e_promotion_disable(void *dummy)
 {
 	u64 msr_bits;
@@ -1241,6 +1263,26 @@ static void __init skx_idle_state_table_
 }
 
 /*
+ * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
+ */
+static void __init spr_idle_state_table_update(void)
+{
+	/* Check if user prefers C1E over C1. */
+	if (preferred_states_mask & BIT(2, U)) {
+		if (preferred_states_mask & BIT(1, U))
+			/* Both can't be enabled, stick to the defaults. */
+			return;
+
+		spr_cstates[0].flags |= CPUIDLE_FLAG_DISABLED;
+		spr_cstates[1].flags &= ~CPUIDLE_FLAG_DISABLED;
+
+		/* Request enabling C1E using the "C1E promotion" bit. */
+		idle_cpu_spr.disable_promotion_to_c1e = false;
+		idle_cpu_spr.enable_promotion_to_c1e = true;
+	}
+}
+
+/*
  * mwait_idle_state_table_update()
  *
  * Update the default state_table for this CPU-id
@@ -1261,6 +1303,9 @@ static void __init mwait_idle_state_tabl
 	case INTEL_FAM6_SKYLAKE_X:
 		skx_idle_state_table_update();
 		break;
+	case INTEL_FAM6_SAPPHIRERAPIDS_X:
+		spr_idle_state_table_update();
+		break;
 	}
 }
 
@@ -1402,6 +1447,8 @@ static int cf_check mwait_idle_cpu_init(
 
 	if (icpu->disable_promotion_to_c1e)
 		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
+	else if (icpu->enable_promotion_to_c1e)
+		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
 
 	return NOTIFY_DONE;
 }


