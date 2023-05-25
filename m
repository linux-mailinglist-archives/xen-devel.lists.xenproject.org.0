Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9DF71092D
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539491.840420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27bV-0000pV-VB; Thu, 25 May 2023 09:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539491.840420; Thu, 25 May 2023 09:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27bV-0000md-SH; Thu, 25 May 2023 09:49:53 +0000
Received: by outflank-mailman (input) for mailman id 539491;
 Thu, 25 May 2023 09:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q27bU-0000lE-9W
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:49:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d88ab8e-fae1-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:49:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8517.eurprd04.prod.outlook.com (2603:10a6:10:2d0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Thu, 25 May
 2023 09:49:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 09:49:47 +0000
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
X-Inumbo-ID: 7d88ab8e-fae1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfmUtkdKWRNO91GgO0I7Jj2yQkO/RPppIMV8JBsFSiMXg04JHu91t+yxP//mPqPcZ3YrtzRC452dgGM1XBU4CAHoYtWKbITJ6QAsMoofz+au+wa3TMo2crIO5bnkkZX9sFNe5Wc/EZ7DCGuFKXvBW8MmQPAYmProSJM05NJCW8lBt9QsnpseW0v/jAfI2Igf7rUuKZHoy/qpJVVIKQB30W0sT7z5wP6/BH2R9Vhz/gRFwx+jyqYLRV4nFbdBatI+um6YyFI6w8/AqM+OJ2qSPIY4weRnqCvqCLanvCGixJ8SOHjZuWH34xXNPlHdJCbHAbbtlpRTiMVhycRBhpZaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBfuJTSQwwVM98L/5wB8xg9qUWpgSvF1woP3lB96eB4=;
 b=WDCRkYuBFvfsGJD3uQsoBMeOD6aZxP9XnG+x/mAPLnNwAeooFsG9VZo/sixvkPhq07cazwrKVKGdXwL0BVl/PEPS6328h7rsncDQ7yVs6ovY8eyZFiX13zVR5k5AmpapMa/Q/2/yk8UfBs1cigzXZ9lP7IPxMjCJJEIdoYqWa59U3GgfGkCJQFLjRyWaBjVb0TOapCOxNh6w6UlnU6y9/QPI5/NYP+bw5N9eVeWCOqrHPtewPi4TlnDsfyVjk2ZKA/KMRO9AA9H7EbWOznAUtCZ3iiz59qNqyOnPqVH6UqcmwOD/sh5DWsn0N7p2n0NSW9A8NREuVnEJ5lMLw+m70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBfuJTSQwwVM98L/5wB8xg9qUWpgSvF1woP3lB96eB4=;
 b=gK5ugxFxjbS96SLN/dKjNlLYmTzbfzx9OADgTxPzSE+tduXKp1CeNTt2En6qO+VKl+UtwuZ1r6Kub0LMjkPaUn+6z6F+kXRpRYT99TieVmJoemN1bR5SKxkAsv0dsbQtGHlWNtnzJsCK83Nx9pk8v5hQUguBS8Dt3ykRP7vO1Ok4YoaHK1bVwvG+TZPWi3AFzZeuhSlj+o3nsT1BNrNphz1mcf++ajaxfloq5Meh5uKRqN8PX1sAokGdzPT7o9g0N4GSeBuJtZs1KGR3F/PfLpKHszC1q5UxC/51j0GecR9Fzr3Gm6utZPA1D7JB7i6vea7G38fGNgvqwsukZaZ68A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af7e2e9c-1065-da68-d9b4-fd116fe2e2b0@suse.com>
Date: Thu, 25 May 2023 11:49:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xen | Failed pipeline for staging | 511b9f28
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <646e6ac6d749a_281a7a5e8825bc@gitlab-sidekiq-catchall-v2-596d74f7d4-ntx7r.mail>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <646e6ac6d749a_281a7a5e8825bc@gitlab-sidekiq-catchall-v2-596d74f7d4-ntx7r.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c21034-a140-4bf9-b309-08db5d05600d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRvXFfYiYYS4MJHsjNHNvJY5HuaINxdTFseLySE7yQM2vWG5qm556LIQgjyDhVA1t3XnizW9LkCKpzCwjCFmBjYSIbm4+M2Tawi4Mm4VSnnmI+1PqNkwkXGuDfQ8pmmqVre8sS1DZDJuhBVa9nGuxCO/jc0zAczKqKF3kyr3pmMwoIB3dqW6K4ahsZKe6GIWzDnLaxcGTLz04Z36Z8HRObieet2WR43yzpmhO3gRl/Bb6j4UIH5hu8KhIuRcXNIr86cdumC48e8wlHi25/R4EsAL3pRQ3bu0wklJB+m1SNzLuL1eF9rasVgj8iQVD/3xQkhCXrQDy6lcWAGgzjeuNIwQPPfDwGaeGCfsv/cgUPVFsRErfvQTWwU5yoK4iGNhLQ1Tlfox/48gKQOD/JkQ2JLYZHyovY3Z/2IcEGVdLIZAa8joSCG/OKRY7a5wLXIzRtTt3W4PoZX20tJA2U2I2dWCoWNK6hAo73XvyB5jJxiON9lat9K5jAqzY4u+vAGsp2UgITlDBRQqBQM+rOh0PkvpjzICiEMbrwWJApaCPQseggD5in57Lr3juuiKMFWkJajDTFUAvCq/Dzk+H3bI0Y8v3BwLTe5GLG5kyLCHShfaN8wtSTmIkSs9S1DF3qW6RXHImucEfpM0gCpflD0W6e49UsFhH+E2DEn24wj7RwYZAGL4Y1ZCHzUScFj2aDpH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(316002)(478600001)(26005)(6506007)(6666004)(6512007)(53546011)(966005)(31686004)(41300700001)(66556008)(66946007)(6916009)(66476007)(6486002)(8676002)(8936002)(5660300002)(86362001)(31696002)(2906002)(83380400001)(38100700002)(36756003)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJYL3NhaWpRdFhReVhZeHRhMVRKKy9YeHloajZNTnpDbTZhL01NYXZnMTFs?=
 =?utf-8?B?WlkxbTRhd05oV2NlanpSemFvMVdtYlU1OFhKRUFvQWFDOU1Eb3E0TUhFdUM1?=
 =?utf-8?B?TitEaGczZjVLeXpZbzFQVU9JdUJZd2c5TUtnUHVBaHdpYlptS1FjQnJaVjAy?=
 =?utf-8?B?U2dGcWVEQ1lXMURienFqYUc0WUowL3dwRkZHcXo3SUhyVnhLL1hoQllKWktO?=
 =?utf-8?B?d0NCc25SNTJ5N3M1Sm9SbGZhcVp0alVVZ1kvY0F3R2JyaGtmMEszQm5vMWEw?=
 =?utf-8?B?MHhaV0xHS21Ud3k3Yms3N1hjMVIrOGJGMElESmNUSTNmWnRGNm5xRGhPVXkw?=
 =?utf-8?B?bzkzNXdCUnV6d3FrMXltbWU0cmtYTTZJZHVlN3BrMUZ3UDN2MSt0V3VBVVox?=
 =?utf-8?B?b2IwVnZwZDMrekNYNCsrN3JsV3VUYVExS0p3ZEtvSXNpSExPSlliZ3pFb3pV?=
 =?utf-8?B?ZStJWE85RCtVRjZFOXdGZHhHWU1Ea25IM1psZThWa28yTEJrNFRYM3pOV1Rs?=
 =?utf-8?B?dTJsYitkN0hETzArL1M3SDdnVjF6eFZPd0dkcmErbkZMSGNMV1VOUTJmQzJr?=
 =?utf-8?B?RmtXWngzS1pkZ1NDdlRFTzl4bG5BSjJuckNqZS8xVWgvdmRqcUpmTC9rMzNz?=
 =?utf-8?B?dG40NlBrMTkrRncrbnRlYmFNVStIMnN1dFRHNzcrZVBBN2ZJclRxUjlVNVB5?=
 =?utf-8?B?empLZkVzS2RMYVVabVZ0QnAwZ3hhOWdGQmtCTnJTaC9TeGVBSnhZbG0xZjVP?=
 =?utf-8?B?Ly9kS3RrVU1XTGZOTnVMaHB0dVJoWXRPWDJKMWxualltdGl1eFVlMEZLSkg4?=
 =?utf-8?B?emRCR3Vra3UraDVyVkF1YTduUXloYmFMQ3lZZjJ3dWhHc0tvSVRybVBGOWw2?=
 =?utf-8?B?SnAxbDVMS1pjaXk2dnZucDdvQTJrT0daR2lMdUliUFVxdnRYSzhHc3RnVWtF?=
 =?utf-8?B?YjRYZFF2STFMOTlRMjVJTVJmeDlOcldnbmNCOFNoL3pveTlNSGV1aitwVTZi?=
 =?utf-8?B?WjYrM3AwYUp3T3FEb1Baa3ZQS3EvbHViU1VPMHJqVE5jZWxvMGN2WUZGZmx6?=
 =?utf-8?B?Sys2R3NVR0ZyS0liTU9Vb0dmN1l5VVowMEw4WDJmcVZaUitmK0grWVh0S0pW?=
 =?utf-8?B?UUF3OGxkZVNvK2VNcW5pNk05WTN2Zy9xVHIyOUJOTDFnSTVESFVpVTViQTFn?=
 =?utf-8?B?V05Sb2hnOGRhSHVqaUg5aytpQ3VxaVIrWFNGY2VsbGl6N1phT3IxNGwwbHJH?=
 =?utf-8?B?NE8ySTJFa09Uc242K0k3UHZoTG9ydy84VTh6NDFPQ05pL1JaalNVRWV0dFNM?=
 =?utf-8?B?Snd5UGpldG5xcGE4YjN5RzRQdFBZb2NkazJLYVdqalNWbXY2c2IyK0kxQlBR?=
 =?utf-8?B?NjNnWkcvM2cwTDdtcjYxRmFHMDdtTEtIazNSd1RpVUVuVXRKeFBIWlUrcXhR?=
 =?utf-8?B?UmljeStwbVBKM3JzVThkdTM4aSt3dTBZZjQ4bE9VMTVGZ3BtLzRXMnJaamU4?=
 =?utf-8?B?Vm96cmhlOGtrOElpRFZmM3F1UFkxeU83Z0V0eXh5cFJ2TFlrWDNMK2ZBMHV3?=
 =?utf-8?B?dzNWWExNbFlLWER1Uko3bzNFQWVDUTBCNnFzUWxobDVMYktmWWJuTldvUVp0?=
 =?utf-8?B?SllKZThYa2lnTXBHWlM0K1VCR1NYNWlmUkZBTFErcXRBRDBvdjZRUTRZSC9U?=
 =?utf-8?B?RWJreEJobjFZLzJqWE92Q2tjTlJrNldXYjBYL2ZwNjBUa3ltUGJhbE9CKy9K?=
 =?utf-8?B?RDNabi9SbytUQVBoTU9ReU5PeDBWRmdUTnFPQ1p1dzFSWnY2Zzg2Q0ErczZZ?=
 =?utf-8?B?eFhoZ05oM29waHdtZ2tka3I5SzhxY3Y3aDk5Vm5TbWhrTGduZFRkbzJidGlY?=
 =?utf-8?B?bXdqdkpObDFIRGNvQnpFWi8xQndoR2hHQXBUOE5lWnQwNExiTDhVQkpJUE4x?=
 =?utf-8?B?a3JXdi85RWV0c00wdXlvSDhPd0hzdFAvT2duSUpKLzdiMkRiYlZPbWF6VkRv?=
 =?utf-8?B?QTFOZGxiY3phczhVTkhXRzhpaS90TWJyUzhwUGRJVThTSDBGaXVrNnBscUJ4?=
 =?utf-8?B?Wjc4ZEZtUkQ3VG5lUjUrdDhJRzQrVnVVOE4yODlIdUVGdlNqQ0lNUVQ5VnBE?=
 =?utf-8?Q?DxdVOKNlRC6VNMFGwTYJwmr0+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c21034-a140-4bf9-b309-08db5d05600d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:49:47.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jr6I9OHietLA/hXOPaTaHDSo0Rf+Lwfd/bNa/qhZ0rkQ/BsshGOmE+8FBZo/CSCUSWuf6muA6FBDBRxJaBebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8517

On 24.05.2023 21:51, GitLab wrote:
> 
> 
> Pipeline #878023438 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 511b9f28 ( https://gitlab.com/xen-project/xen/-/commit/511b9f286c3dadd041e0d90beeff7d47c9bf3b7a )
> Commit Message: x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS c...
> Commit Author: Andrew Cooper ( https://gitlab.com/andyhhp )
> 
> Pipeline #878023438 ( https://gitlab.com/xen-project/xen/-/pipelines/878023438 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 3 failed jobs.
> 
> Job #4345633611 ( https://gitlab.com/xen-project/xen/-/jobs/4345633611/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc
> Job #4345633612 ( https://gitlab.com/xen-project/xen/-/jobs/4345633612/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug

While I understand these continue to be ignored failures, I would have wanted
to look at ...

> Job #4345633615 ( https://gitlab.com/xen-project/xen/-/jobs/4345633615/raw )
> 
> Stage: test
> Name: build-each-commit-gcc

... the failure here. However, the log as shown ends at 4Mb as usual, yet not
as usual the job artifacts consist of only config.log. So it's not clear
whether anything relevant would want further looking into ...

Jan

