Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC99363C325
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449443.706183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01wJ-00089Z-Ul; Tue, 29 Nov 2022 14:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449443.706183; Tue, 29 Nov 2022 14:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01wJ-00087b-S0; Tue, 29 Nov 2022 14:50:27 +0000
Received: by outflank-mailman (input) for mailman id 449443;
 Tue, 29 Nov 2022 14:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01wI-00087U-Cl
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:50:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2856b883-6ff5-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 15:50:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8423.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Tue, 29 Nov
 2022 14:49:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:49:57 +0000
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
X-Inumbo-ID: 2856b883-6ff5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSARZHG+SOWHxHpTrrlTvU1UhF1JvRmVverI4jC6cBlHwqspL7Vz+Nt2aORhE/vL7Sm9/M/hQTIGx17ZzARLmBX8ifA5Yx0qpjjlbFjOksq7DyxDn94iBiUryjTQb3iQJyv8U9KU0UlKTOrbSamrwmalI0/zmKPOTfVANPWnCOKSbpOlekl2STTbBhvR37AOcMFQKeHZr8zvveEkDvp0rSmP5G8Elju4AJeYb+JQLFUN2RLkCAWVdkrf4Koy74mP7gPVR9u17qLK/WLInouGzKMy83X1TOy/8+TgklMhuVj5OKMHzkVythtIPgLB31cGcnSK8Fc9oqwUrCKNNIjlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/yZJ1LIts7VqeitQmCNVAh1vz5oW18vSF5fdrcLYBc=;
 b=Mxjw3oAYLp1dQFzQ9iRyqx9SMI9+QkSO3mFGNg6//pEjS186EjrHKmToor6gdS/fU65NoVz0h3PgJOaE1XzKs0+zigbwTZeL0ZCiVMuNtYsauo1fYRLYz7COvGcYuq4hHpZRofaOllQMAjSKmrhgHeZrqwv6+2nqA48qi/NSYXIdJhOoA5Rhd8fbeQSv6d4XdTkQITlCLl2Q90XcHcBbhZKp1XcyNkCQ3SGEAD1nnXzYLKhat+HKO3F+OtXFbaU/mDlBCatiwPNahYEq+Jl8Ste4laAFS+yZsvHnrQquh2mWHIN74pc4f06BRzG35ZrZZDEGsSScp3krH2jAlgNF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/yZJ1LIts7VqeitQmCNVAh1vz5oW18vSF5fdrcLYBc=;
 b=Two+XRkKcy28cwdOF4gXwpZqusTQnNs/rtpN26P5kLTG7++bRhXvipdsyQ8DgLIflytq1MA11zo7Q57iwztC44xvcrEI7Izt2oPs3toQK7rqeORG4YnmAt6Ss9zAmoLYTaAfLDGfwg6Ald4NAA7eSGAvtAd/El2qOXxO7mlu5MnfIc8PmHpirN1hspRVlhONaeNXPVdirAzxOM4ryFBkxUlA/pJiqYTyGwGfMc9DVxyhBcgAor5QPY12oPksAliB15q9wr4UVgMvBrEOjEf+mipVp3rS+hPVmd2D8eso/k006vGYsNmxUsUf0JMpu+RrlW8qDfgyD4sWvGQ+johGYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d26b6ce0-3abb-2dac-282f-4ea5ed089950@suse.com>
Date: Tue, 29 Nov 2022 15:49:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MSR: use latched "current"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 495fdccc-60c1-418b-085b-08dad218fb9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mplTZQeW99QtqKWxwuBhYdMtenD1DlFuJHo8PPCPqYiuOBqxT1p4xIqNSLOAonBU7tmLxE43FKkWglKQjsaOMff4VQjpNE2SO03zH6XP4iewrqBo692DW/IffeNw2mW6DZoHiiyQvH9WFaEl1cHzn1/oK4CLrf7IPYDWh97pZJz9eJC4OvBe18c26JYQOaeQ/F+/b2Hkt42JANDHUuA9BDyUGI4jTB2zGkorjST6VXSx2ra2tn8J84nny4zUTh0N6PrspLhVsy+30lFF6sw3akveV5LjcScXIQlU5PbodMDSQ6xBl7S6s7adpEpX5VPQ6dXn3n2wvoZFV2BqJe9aYHuh2AjnoJaU+JU7Ai4AwCOw8kxZm8GaYO0XXWgkQTHUP5V/6Y3BPupEjHjOyL+BSoSSQEc7mUbI+5vnR+hOr6qN1sth745KSpZoXfnGWKBddAz3vKEHCtp4cqDb2ksT0Acg3mbEK0Cf2BPfQtwgZkMtulaEu5GHC0dTWRhIzMxHvs5sC7OhFULoFK8hbA6gdyX8wQohS1da1oO96uy8Yis817Ny21qYyXSyxMpSe+dIj0kJQtA2AJi7bTHSGQxyG8NyAfaQJkR0Ktb5rRQqMDXuB7VxhI3I3K5uRUQEIbiPS0aAWoYIt0mJ4U+neYmsRJUR2bJosmQUtezl0KQ6aUWOrNn6QCcv8OhYmHp9PuKjqKckNkI0eSi3A6ELl13JFS3+jbMRinRJzlnuConKeQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(2906002)(8936002)(4744005)(31686004)(316002)(41300700001)(54906003)(6916009)(478600001)(6486002)(5660300002)(4326008)(66556008)(36756003)(8676002)(66476007)(66946007)(2616005)(6506007)(26005)(6512007)(31696002)(86362001)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFd6MWx4K2E4dy9JWVpRWHJRSU10a05oNHdlU2ZyMFY4eTZzeitrcjU4elV2?=
 =?utf-8?B?YW55dGFEeG8rUEh3QWUrVFN6dXdxZWxWYmR5UTFXcUMwVTU0ZnJXN05JenNh?=
 =?utf-8?B?d2ZxMUoyNXBVYnNscGs3d2tEUWNOcWIzRXBVU29mUkY2SEMyMTVydC9xalV6?=
 =?utf-8?B?TG0xRVJUaEp5bWN4RW0xODdLcE1sNGUyaUxaSWxMN3FOVHlPSm1ieFJPTDhs?=
 =?utf-8?B?KzdaV0w2MVZzaHkwSkNzbEt0YUFpV0x1YVQrOURUd2RRcVdVTXVtdnFsTXcy?=
 =?utf-8?B?RmNjTkcwSW8xOEFxNmkxUC9xM3E4UWN1OWJ0Q2U0ODdpUzdta2ljYjBkQy8v?=
 =?utf-8?B?OTBGQllNY0lDSTJBTjdpSC9IK0NZbWk5T1hGMmxWMFRVa2tXWUdoeDZRWVJG?=
 =?utf-8?B?bjUramxxdTdxWkhPNkYzSlg1cTViSkxZQ291alA1QTZKWWR4S1BkNWx5aHU0?=
 =?utf-8?B?Yk1zc0VST0JBK1VzdXFzQUxLVDJRMTZQc0NadkFEWlhoZ2xQQWV1MmRpVk5p?=
 =?utf-8?B?QkExak5YZk9kOFpVcnd4VGpEa21DNkY4YS9QVWxHbk01SzRDSEUwdHkvcGVi?=
 =?utf-8?B?bXI3Ri80UVRYMUllVGIzcjgva2FNS1E1bUJHejVDTURoakczM0EwQXYvV1JZ?=
 =?utf-8?B?amdhWW5SVmM0NE95bHhUVXk1SlpOdW9yNEFiZUU3dGlQcW8vdFJyZ09kWjdE?=
 =?utf-8?B?VXJ4WS9iaXJGRFVxd2hXS3VyY2pHRWN0Mmw3bVRxSU94K3JtRVpxZzlUY2tD?=
 =?utf-8?B?Y0Jkelh1REpqY2xTM3ZSYWloU2F5UU1ORlNLQkhJaUZBL0J4SGRmbXBwU0Fs?=
 =?utf-8?B?UU1XM05NTkhaUkhzRkN5bGRRRVJEa20wdWsxb2lRREVxaTQ1Z2hqVk0vWHpU?=
 =?utf-8?B?RFFUMGtxcEtzTUtod20zZzdqYUZMOTVONHlrNWpGNW1QUU5ZNDkwUERjM25M?=
 =?utf-8?B?dHcvVlFRK3czcnJjb280RTZwRnpZVlZJenJuTTArd3k2N2RvenowblNJUEZ4?=
 =?utf-8?B?MmZnZEVZRFMwanBYSVZ2RXpZTStpaGQyR29uN0d2blpEb2tuR1BvdGt0aW56?=
 =?utf-8?B?SkJiQlF5aUdXLzVyTjJwRDFmV2psTFZQL21BandBM0I2US9zd2xTZXk3OU1W?=
 =?utf-8?B?ZENRajRHQ3ZqSDNQYzZkZE5xOFZobE5sVWxYTFlRdCtpU1JvdnRKQVp2K3Fh?=
 =?utf-8?B?OE9uQ2xORS9ZKy9ndFVxbXJqa2s2cTRNMDZOb3Z6czlkeTBMbjhQVys2ZTZO?=
 =?utf-8?B?aFdwNnhWb3R0T3p2azZJaldPaHQxSlFwRGdPRUJqczRSSUorcGxYdVR6aVpU?=
 =?utf-8?B?YnZvNzFXZUNUNnlNcnhwaFdrSEhyWGlmZDVuY2t3VWxuckI0M2lTRkpxSTdh?=
 =?utf-8?B?eFN3WXNMYTRjRUFpYlI1TVQvQ0NFaDZ1alhGbmRYM3lCSmRmRVVWVzh6d2pk?=
 =?utf-8?B?eDV4eXhXaEdjZzZiS3RDUm83YkdkM3VWS2M4UnpySGdIRTlQYTk0cWVCaEgz?=
 =?utf-8?B?U29XVVRiSXp3OHlFSDA3Unk5V1IxK2FudFdZNkIxSmxSNjVFbjBkK3NKV2Vx?=
 =?utf-8?B?cWt5Njk2OGhUaTVaZnkybXJ4MWhwVmZKUHRGWnJtYWh1REdsM3NGRnkvYnVj?=
 =?utf-8?B?THRHaEpjKzNlRUNPZjhNY0g4RG5LV2JSL3FGNWxTRDNnbjYvQjlYMVVabDhO?=
 =?utf-8?B?TG02bGlrdXlVZHhnaGQ4aVBNZDBZRkZ0UzFPdC9tNkhjTzk2RkZCYkpkckpM?=
 =?utf-8?B?czRwN3p1dWR6b2w1bXpCaWFhd1VOZ0VqSWlOeDdEdnFicmFQTXpnSXVQeWpm?=
 =?utf-8?B?ODR0dkwwWEgycVFoNEFHeld1eDkxMERScDZ3d3lmSjZEcFRydC90SnZtUGdw?=
 =?utf-8?B?YjJVb2JhYmQ0bEFINlhNUGhIMjFYc2ZFZEdNS0JzeThKTkNFZ01HZFp5UWNJ?=
 =?utf-8?B?YUc1ZUIxM2NkQm1IUmFvL2ZLRFhlQTZnM3ZxLzJYWGdKSGxVc25JTFVOaEMw?=
 =?utf-8?B?dXZDZy9TbVN2NEQyaEw1dS9RQ29EZEpOZ1BUTWc1bEFTTHBOOWFNTmRyNXlG?=
 =?utf-8?B?YjgwUHA2Y2tVcE55RFlQZk9uZk9uL3dnQ3FtaEl6RS9tQW5PS0FWaE94Y1Fv?=
 =?utf-8?Q?sBOZltMnktRVLiGifCid+qNmU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495fdccc-60c1-418b-085b-08dad218fb9b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:49:57.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf4ihBx8A0Hr3ZULAJqugf4115OOW4LO+lU+ZpVaW3M/mhVc2K0NS73OtqVQvyYNnt6jWgBxf0hqPId1H/ZE0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8423

There's no need to recalculate / refetch the value from the stack
(pointer).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -417,7 +417,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t
          * out of hardware.
          */
 #ifdef CONFIG_HVM
-        if ( v == current && is_hvm_domain(d) && v->arch.hvm.flag_dr_dirty )
+        if ( v == curr && is_hvm_domain(d) && v->arch.hvm.flag_dr_dirty )
             rdmsrl(msr, *val);
         else
 #endif
@@ -639,7 +639,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         {
             uint64_t xcr0 = get_xcr0();
 
-            if ( v != current ||
+            if ( v != curr ||
                  handle_xsetbv(XCR_XFEATURE_ENABLED_MASK,
                                xcr0 | X86_XCR0_BNDREGS | X86_XCR0_BNDCSR) )
                 goto gp_fault;

