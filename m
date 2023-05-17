Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801E706B57
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535937.834002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIIM-0007tD-VS; Wed, 17 May 2023 14:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535937.834002; Wed, 17 May 2023 14:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIIM-0007qd-Sa; Wed, 17 May 2023 14:38:26 +0000
Received: by outflank-mailman (input) for mailman id 535937;
 Wed, 17 May 2023 14:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIIL-0007mi-DL
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:38:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a620896-f4c0-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 16:38:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8556.eurprd04.prod.outlook.com (2603:10a6:20b:437::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 14:38:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:38:21 +0000
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
X-Inumbo-ID: 7a620896-f4c0-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP1uAWhzOnAwZ6/2RlTT41OIJgBtjejzt049ljIbTR7Ish/o+80KfMblza3Hd+4L0G4IlYP7DrnpXzXJrI523ehx5ARI9F7X1y3k1bJxL2xD4PSzU7vhQYILKqEhztqZWoqLl/zKiocTBGVST8Q+x99w7lUVSf0gwlA7phio2kIV+JO2NoHYVi1UhjaApx1dDT9Gxe6YCIPGuzou43/JU1LFejrGeEh2tvoZSMIgxNXAmXIJOuWLjxSfYTAkZZaf/RnqHG7Oo7/ACvhlq5XEIlZSjIHMYSxr8N3VgZT7oiLlUFhGNjYbpIz61vdZJuUKQcnHMImYW02q9biPn0EXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUay6O560edvbo46b5zeVc1Tw09tWHBMgxpuGuUvLrY=;
 b=hCqDK9l5Dl5pw3QLkgve932EeTylzZnrtwYIRFtwLAXXO13uWKxc14IR6ZwrQ+GpgxLWx7PYrmwia4gfSsreCEmdp7SG8pwR7/6P7Wzk0DbQjq0XAumJbqsY4EzZltrx6CmYS90Dux+bfHf5iGrDyvdyVwWqPzigb8rmJ6C3pKOmEC0rR+JpG0uvBaOjz6JyP2f1R1cHBtyz7a/PTdE5j9VlttEc4m+rs5jyPQBmWLaQ8scSWJUhs0XUDoUeJYIiXdFebh+nK8yXNoxHVEkMLGCJcI0ttqQwCeZfMmgrWqayp9na+0jMBOZBm2JKmvcA3viIhEiK4D3nuAylKtHEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUay6O560edvbo46b5zeVc1Tw09tWHBMgxpuGuUvLrY=;
 b=EoMy5mxK+ANxKKHjzBnfWxHbJgzMXOueMgaOWxlqhVISJ2dphkefwqYJC0o16c3TOxX66phX4bwgKVWlGI/AvJbdHfBMzyDXN/+ERnCAvxDqy1w3GYvgF7v0ZZ2k0pIC0zRln4B597rT+eWr7ghnpWv4w9P2GXY95DJYkxz1H5kcatZDW4Il0q6vU4uMR/M/6augc/DJfDxflBBewRU+nuxtMFmGTmmnlZ3MvfS9SDSTVhro1qifTbmApHiMOPadZuscmP4dLuh6Ag9GGCfekL0qI+cY9LsTcWWhSSHZINHj7mgs4GQwd/2nml8H+BiBfcsl2Z4GhAiWh4YtO9V8mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4e44806-098b-13f6-7ccd-0119a8a2d06e@suse.com>
Date: Wed, 17 May 2023 16:38:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/4] x86/tsx: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230516145334.1271347-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: e3613d76-304c-4b11-5962-08db56e45d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	apE+t/MsIOq00iFIxOdHg60koDbZADyDKgkygxfR4mRXltt+52uvsnnEhLAa/SU548bT81+6V9i4f1BpORpt/2YvbwnTUhsyQdIOJgSjkaiIy3YEtbFzj+1qDekMic0N5cd5GmZVrgKsiUggjK4jJZCiQJ6Y05eKUzYgG8BSFUZ+qkFPmogvzwf2USSR1ltErV7rR+niHk2hBUK80z81pJxH5O3XiAOaeS1ljKp7Ik3fL+Fjh97CsE5mamS+QhSyARcQ3p4hasbMSgI+zt4wxIIaAhsmhH3LPtRWI/Rhn6dyvRAEBFXWb9ybz5TmSff0+4T6F69D9YMuIzXNkbgBojXKdQaAFXiUiuaafHp35B56O23ZPYYRJMem4PFZRKsgeVaOz7pa3OX5r1jyDOS4sEgHDwLLPYHZh54mrbqawlV3YAsogaK+wck1Uljg3uo7PScxrfpNOOO3OwqKYH1THRLM5MNifknJPm8TEkxkH3i2RsRA0QvDC7CBCcpKRfWj3mHD/j95g9FMb/bOZzYhrapaFLWLS0HjvcAe8YMyAcPIEHxMbAIOLvVL0Uc4q/W3zgh79J+e0NV3kLPIjlBz26+0RircBqlEGLwGPAyhMh3Kb30zAERXiVvsT09i6mMwwY0vf1tIHYMtpGpD7jqz/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(31686004)(31696002)(8676002)(8936002)(41300700001)(5660300002)(86362001)(66946007)(66476007)(66556008)(2906002)(4744005)(38100700002)(478600001)(54906003)(6916009)(6486002)(4326008)(316002)(2616005)(26005)(186003)(36756003)(6506007)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTE3eFdZSmV2cURhR0N6Qnd6R1k1aFk4MWZCcnVFUFlWSGtRR2hSNVVlWGNW?=
 =?utf-8?B?Q0NyR2hVTGZUb3BoSU1rRVJnNTllblptcitncVBMU2hZQnFKQ0l4bDhJVXBR?=
 =?utf-8?B?KzBuR1gxSGVubXh3RWMxTGU5Q0tKOUlORjdtbCtwZXdUNmd3VldnRDExRmhN?=
 =?utf-8?B?Q3ByL3p6OGNkWnhnNlN5ZGxRejZwamxtMmNYOUUwTlJCcExRd0QyWU9nVzdJ?=
 =?utf-8?B?MnhMTlhDY0dkNEdVQXNWNFBtQzlWM0RJNjZtaytDTHJyNmtkQjNlK3VRVGlm?=
 =?utf-8?B?ckk1Mk52ZDBQU011Y0I2bS9aSDJyc0gwditHTk9lL05QSkM0LzNhK29LcGtP?=
 =?utf-8?B?cmE5dlRFMlYwOEM2MVkzRlJpczNwTWQzQUFmZGxjMkwvV3ZtRzNocGxUV1hO?=
 =?utf-8?B?NkxObGhRSjd2dW9HekJnYi9seUdDVjVLU3NwYjFmVmVod0R6dmRraDNVeWhX?=
 =?utf-8?B?TTVxamVIbXlyK2lXc1dQQ3orakVqWlNyRFkweGlWQTZ5T3NLamFqVnVoVUdN?=
 =?utf-8?B?dUZPWDdaTjU1RTliQzl0elZZWlNnYWdVTTZWZXZGRzl2UWY3blhKT2gvUFp5?=
 =?utf-8?B?L05INFM0Z25oUitnUkxDcFExNmU5ZjA3eExpbk9rSjBQSDZiYnZubjkvaFNS?=
 =?utf-8?B?emgwSzhPc0d1eFl1ODZKczIveGxQdEtUR2g0R21wUklzMTJYeDhJRzh5WXBO?=
 =?utf-8?B?SXhPVDBEQ1VSY1M4ZVNnVGl3bHRrSjNvV3hCM3M1MWFXQWV5dWt6VHNBbDNW?=
 =?utf-8?B?cnlzYTM0REMra1d6M28yQVBFKy9LbUZTVXZ5cFRUbDgzcHpGMzNIWUVHZU5E?=
 =?utf-8?B?bTJaQTdZU0hsWmYwSWUzc0pkS2VJQXJadGFLS3ZPeWtmWmJ3eWxpSzZLOTZD?=
 =?utf-8?B?LzBFdmcrb2dxSFllQ1lCK056MWtRSzdRbVZ3S1k1bngrd1AzQ3E5VVA2aEpw?=
 =?utf-8?B?c0tEdFhiVDcyMllOV1doQVdjZHdoQUdXbG12RkR6eVZHRDF0TDdnR0NNVG1P?=
 =?utf-8?B?Z3NZUDhSWjkxWDFWNXFrRnZIWkpsaE9VelBDd1RaTkRqRm9xOWxFVG5lN1I4?=
 =?utf-8?B?d0IxUlNjSWlXbmY4bTE3YmYwODVobnUvZDlFTVB4QTJ4S3Q0U2NXaTNOTXJW?=
 =?utf-8?B?NHFEM0ZGMnhMZXNKRjRLMzR1TWtGSkFJYThBUE5KcC9HL3RXVnJ5Y0h2YXpM?=
 =?utf-8?B?UEI3czlLZE91N3lvTUYyRGZOUGFDTWNpNlgzNnh1WitVVE9ieEE3VUlkUVVl?=
 =?utf-8?B?R3d5UEtHUmhyd0trZklMQklrWHZNT2V0THZESEJxeEI5OFVneEQ4THlvTFc1?=
 =?utf-8?B?YWJ4K3JYWFNjYTM3cDVrSW5id3k2czZUMGtsbnFHcFprNzJQRUhBNEkzaDg3?=
 =?utf-8?B?dkM2eFV4WFhFdmd3WGhiRGgwNENCbHFMYzZwZ0RoNXRYQlFHMmVhOWZ5ZCtT?=
 =?utf-8?B?YjFJeUdhMkZNd3k1d3lzSkpDbVZGUFZkZ0xRQTZuT0pwVmVuWXl3REk2QjRR?=
 =?utf-8?B?MEt5bUsyWnF0UDlWWC9uTEc0Zk91bFphSTF6Skg1M3VNY2R5czBKVFVFWEhQ?=
 =?utf-8?B?em9IYUlqSE85b1JTdVhkQmxFeC9YeXAyMUNxaDdybWJVeVdJTk1FTU9Ka1ky?=
 =?utf-8?B?QVhLalZ2ZnYwVHpKY2tEeTJid1ZTdzNlTHpCRFdzRUsrL0ROanJvNG54Wloy?=
 =?utf-8?B?WlYyZlV5aHFveFNsNUM3bHJHbXpSakdONGhrckJra2Q4MndiYjd1dWJjNWxS?=
 =?utf-8?B?SnM0STFtdHY3cVNRT0ROZzJTd2syMjZTWUtUOXFBWkJ0aVhycUw3dkROMHd5?=
 =?utf-8?B?RVJkRGxJSlF3NFVqUXZMUWVVNGFZZVBZaDFJYjg0ZlZWNkhyY3hLUWdHTGs5?=
 =?utf-8?B?cmtHdkFQeit3emE5Rlh6L1l1UnQva1ZKZlZBdzkyayt2d1g0S1h5RzIvS3h3?=
 =?utf-8?B?eXVhM0s3TDEzN0tkQnN0UkQxRi83UGlNdHIvdnMzV05ZQ3hGTnNScDZoa3VS?=
 =?utf-8?B?SldHZk5MMHNPZ1lDVkJxM09xMG5ZdkF1RFYwTzZtc1lSaTlDbWFseHRBZzNr?=
 =?utf-8?B?Q1RkRkZOWnVOaW5raFZTTHloeU1yanJyVjZRUk40RlVIQVhoN09RbVNhdjFI?=
 =?utf-8?Q?/F2+6FeJOcN05BpP6IFvdRm4R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3613d76-304c-4b11-5962-08db56e45d02
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:38:21.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQzbJdZhy8MrOCe6JELEzO9WjT3OSYU67qLIiQlHdIxSM8mhz8QPbwbSkT6gXIYjE1nYOM4aaHCl4upj8Rp6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8556

On 16.05.2023 16:53, Andrew Cooper wrote:
> The current cpu_has_tsx_ctrl tristate is serving double pupose; to signal the
> first pass through tsx_init(), and the availability of MSR_TSX_CTRL.
> 
> Drop the variable, replacing it with a once boolean, and altering
> cpu_has_tsx_ctrl to come out of the feature information.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


