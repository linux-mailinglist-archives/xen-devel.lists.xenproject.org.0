Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983C55309D8
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 09:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335497.559672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt2DC-0004ek-R6; Mon, 23 May 2022 07:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335497.559672; Mon, 23 May 2022 07:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt2DC-0004cF-OG; Mon, 23 May 2022 07:10:42 +0000
Received: by outflank-mailman (input) for mailman id 335497;
 Mon, 23 May 2022 07:10:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt2DB-0004c9-Ct
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 07:10:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734f350f-da67-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 09:10:39 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-WfdEKInJP0iq865JtY8jdA-2; Mon, 23 May 2022 09:10:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7718.eurprd04.prod.outlook.com (2603:10a6:20b:29b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 07:10:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 07:10:37 +0000
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
X-Inumbo-ID: 734f350f-da67-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653289840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaxAR7rp3D5IiDtV0NxL4k3Xi5SJG6mTeMnH9eEUfD0=;
	b=S/zVvOWVKxCh7vQa2TVvz2jG2b9lYRmsohV4gdL2LFy/N6WRpuRda/i0GAyP5+UZzh0Yq4
	SLGR03xH9elLtlHtcNL7Gewnj6vwOxwdlgVka3ufbmcnvn+i7kd5G+HCpSh97T9wkEtMTu
	3p1QM7A1llALE2lm5EOZT1sRP9yk0f8=
X-MC-Unique: WfdEKInJP0iq865JtY8jdA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5I0ERoU6oVsWAS4Mvk4oGSUwFNcQgMjfi32inZKOTijyLTpgOQEtWTr3Nw0Pd+HZPilojbKudvq+V4xoYLzMF+YHHRlNiAW3Mr2sIRnMyFweTdyuwnv7YhhYwwXarklEqrIJ8gtqI2N7InJK6fzsJkDUOjAMek2jegHAPUYtzK6kJp00p5F9uvKBY3wOCjoQ+zbeYBbPmec1Lwcrz6cIOcYCq4fzksZHkCxO5z6PT62ebOO6GkXfb7l5lyDs18igXD1mp3DdOLs2J2j+UBZ4Zp4k7zR8YOb1J7JC3hGc60ZgXrq8afoohBocnXl9VW5+4RODGn2Oi4mNBeNU/KMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaxAR7rp3D5IiDtV0NxL4k3Xi5SJG6mTeMnH9eEUfD0=;
 b=fmPR3waYxv30pnSdBBecJCl/Slsww5XIl26mk7TYbwfX7DCqNCTg+S1aE6Jl2+Co1dQb44UCCJlK7OUOea88X/m40t57jaYGHbW8UfjUVMa5SNXfawsLG1rcd3kSzL+feSSS0RUEkA6A3YmyocLd9EyN5sCm1MMUCNA45vC+HyIBD6W/lK8Jb8TBDPlu1rJGhs6SowEsqB++HrN53tvmBsQMaHvIfkYnzMBic6tdEBDB3DKdqRUsjbHjpUjFb9zpPHUwQ0L92NO05rHF2eTdJDrC7JOqME8mt0ijuf5wwbgBtNg9MN1nDbKfxhBM1yv3TmO1Gzv6ltO2y84K/AMtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4254847c-3364-d0c3-5e32-66a12a200ed2@suse.com>
Date: Mon, 23 May 2022 09:10:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220523062525.2504290-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0318.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1071e5ae-6e8c-4588-6a84-08da3c8b563b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7718:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB771858916A9C0F9935428691B3D49@AS8PR04MB7718.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DEgM43E5nKurgA3y2yE2T2WYoQDDsA6UDSsrbdoOaJ1CsySXi5YkgET4dGKZ9nCHm02EnRj0jKSb6PTsNp+H6oAsOCKn2P6ghfhpBHJxTrNEUZWvCH7M0OajaOyH4keu7LIXFARDb8RF+9GobHVNBwVITSbJ6KlJPZvrQ3Pst5iddAaKsSgSj2QQmw3q+F/oxd3MpB8zUjazK7Ek/g/cj0K1vR83VZnL65rCa+quThckRw8KJEedL79TNtO9fPjq/AgKL7m+o8dh4KvlSBXsEvDz3pgqRq3pt0uQLqS4pmXPjkJa/jZRLAouwaIZz2QlOeSMGmKgFjA4/s8qkJybDVzEHnVNoQ7I71GaTBDvV3zJ6iX54u3sRgoK04pzoy58aA3Xb7pEV7hELTRLz8XPkPEDwyD/BMxWlkKis4DDVRqQmhsfTFt5DubOmkDG94dFhkpkbAOQiYTvEpB1Jpz5bQcq8PqGIzpyC/HbrDoa4RLset+eQZ15HMDmfLNNuhOAtLD9TDD49YkHKKLnCWPV/H2qIU8Hb0MkMersoHwKjFPvPjZR+CE/VVde0L+U4zSeIAiHKya5vDcrj/VOiz0eICtOXq+idCwdKTfMbKVibjBVVdQ0a/Ik5V2aSQPJDaX6Fe8t7FcFMUe8Q3lF9pX24tLeOCZiFSCaGOuH3HfnzeMtrsBl2RoXb14Pc6c1tP9FnueTn1ragDSBKqyeB4/QugZTAHnKG4tL5Wb/VXVZ5TQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(2906002)(54906003)(4326008)(66946007)(66556008)(66476007)(6916009)(8676002)(316002)(86362001)(31696002)(6486002)(2616005)(83380400001)(186003)(36756003)(26005)(5660300002)(6512007)(6506007)(53546011)(38100700002)(8936002)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXZyeXA0VXNGV1RITXg2WUlHcXZ4bUFpcW1UUjVUZlJQK3M4ZFhwSGdnNGxh?=
 =?utf-8?B?TlNYc0oxNjd6QzYzQW9LVCtqdkVqNTBnUkMrVlN1eFloMjUxWnB1ZDBZK1pB?=
 =?utf-8?B?UFh6eWZFQ0VwRnpOb1dSVXRhU1BRSi9oRndmUjYrZG91VXo5Qm1BVzJCVS9s?=
 =?utf-8?B?ZVFBUit6Ny8rQ3Eyckpvbmp5emZSYzhyNkc5azlvMExpbEFyTzAzTk5WUzR5?=
 =?utf-8?B?cWdETVY5NXo1NHR5eEpCbUpyL2VoNlloS1haaDBrQy9wdXBjL1Ara2xka0Y5?=
 =?utf-8?B?eXFYUmtmYy9FZC9lYlR3Z05LOG5RdHV3dDRiMkhqdG5ZMDNKM3F1d0xpTVlE?=
 =?utf-8?B?VlErV3BCVjV2VnVQaExsV1YwOEdIQXlQYXFRRWdLTlpSTjlNdEh6TmxDOThI?=
 =?utf-8?B?Y3NuK1JKME11Tm9PR21kNVBnN25pcXBVYXJjd3Nld1hqWjBvNG1GdEplalZv?=
 =?utf-8?B?OHBQdEttVnlSZFpsR1JEbFNkdFVFUnlwN3pJR3FiNSt1NnNTSG5lRGI4L2dQ?=
 =?utf-8?B?cDJyR3ZRc3M1MjBLUm1ja0JKYm1BSXFZQThkMm45QmVsanFhL3hvOVBkOFdD?=
 =?utf-8?B?NG5aUm0yNDlJY0pYNWN6Q0pia3JVMm1zWitOQVNuejFHYy9RY1loSnNNSVhU?=
 =?utf-8?B?QnBoQ3ZYTXl3Q2g4bjBLZW9rbVNTNDJKWTVpdkZNS2NFYUhDM2c1RUF0QVRD?=
 =?utf-8?B?YlA2eGt0UlVzWWpXMUhkckZ3MjduUmxlbnVuWWh5bnJ0T3IwRkNnTVNKb0hT?=
 =?utf-8?B?UkZCeEJFSEFBNXIraUFEdys2U0llSXFHSTRWcTdPWnp0NmRKV0VFZ0V6b1Bn?=
 =?utf-8?B?Q1ZQSDRpb1FJczVNNHQxSHVrRnorSXhldjJyQVdPWkt6SFlYcFlTTHYwcy80?=
 =?utf-8?B?YzJ3K01ZUWhHM0tzMlVIMHBDdHVtc29wSis4VDJjVnNDY0dYYUVYeHBLNDRD?=
 =?utf-8?B?V2hvbkVuQU9PbC80WFBqV1FsQUoraFBmakhHOXY2dXkwbEFxUWpLRHVTaTNQ?=
 =?utf-8?B?WXNaL09OQ0NGTUJhN2J3MnZILzFwWHpSRFVtZHlPVGhQRC9lWFgyRklKTjNh?=
 =?utf-8?B?Z1FvR1BYVWVoR1FXRFpMQm5NUEdQMnVuN2Fka0JCN2M1VHJCVVdZcENoUUd4?=
 =?utf-8?B?aTFHYUM3SzhWY2g2ak9kUFJhb0RzTDJ4a0NmU2dVdjZKNGR5NjA3dVlRZGtK?=
 =?utf-8?B?SURYSFRCZVZPL3o2azYyclRjeXQ4WjNCZmJpYUNqVmhDaUJJR3lHTU5RWUFr?=
 =?utf-8?B?M2V6Ry9aU0lsakk3V09FNWJUajNTbnBxc0U3VmZUU05rc2FWOU80Nm9sa05w?=
 =?utf-8?B?ZVZ4SGU5blZpVGxYcDFxWEsyYjVyTVI3SVlSakRCSmFFUXhEWWFxeWhwQnRj?=
 =?utf-8?B?SE5mRFB0UUhyUTNWWlFMV1E2dkhzUkU5YXpKUVpNdlZIeVlNalQ0bE5RZUFj?=
 =?utf-8?B?UU1ZSVJWaG1QblRlYzNQb2J3ckx5TnYyYUIzd2dWbGhmQmUzb2k2L1owd1JW?=
 =?utf-8?B?Sk9lRXkwbjRjdnBZeFJIendZNGxRYmgrUGNDbGpOMEdzTUI3SHExOGVPalEr?=
 =?utf-8?B?SnZrN0pFYit0Mk1lcStWMnoxRU1kNUdFQVBoRnI0ZjkrRGgxTldVc3FDWjJi?=
 =?utf-8?B?Z0dYMDNzNVh0Q3JzS2N3SDdBZUx2RFRsRGd1RHEycXdscXh6M3A2K0drZ1VI?=
 =?utf-8?B?WFNleFZHdmtEUXpDdHFGQWg3blYzT1I2UlFyTnNkZFgzWERiT2dtZmVvVWpG?=
 =?utf-8?B?ckwzcWJvS0hQSFBsOWpKc2xrQ0tKK0M1Qm1YZmV1cW5BQWNENmZyY2M4TFFI?=
 =?utf-8?B?US9wQXFiUGhwYnQ2dnFsdmk1TjFWaTRTRzY4TGIrOWp2bDhGSzQrMng5M051?=
 =?utf-8?B?NVNPc0FyNWZQQjN1enNRaUhVSXI5NWNTQlplVjNJSGNWSHJZL1FzdWR6Smxh?=
 =?utf-8?B?TXJleGQvbE41dFpXNENrTnZ4eWsvVVpkQVNxakkwWkpjNkIrbGZKSVdHVGZS?=
 =?utf-8?B?MzhRSEcyWC9JVytnNG12WWFrSUVLeGYzMk5oQlNjcy9rbGdzUi96MmtDOCtU?=
 =?utf-8?B?WEx4WWM2dGhSWmxwcU5SSU9WZUFHQkFJbUtsdnRxTFlGalAxM0MybFJuaURQ?=
 =?utf-8?B?bEo4VFVaMzUyM0JPZ043RGJNbVVGR1czMFFMbkk4Y3I3MlhFS2NDUU4yVnVJ?=
 =?utf-8?B?Qkh1RWtQMm9PbW1tYURCNGRrWE1VdlpNVmtleFFvaFZFaWU0ZUZPWWJmVUtE?=
 =?utf-8?B?Q09zcHV6ek1KMUw5b3VTT1BMMHF6NHRacTh6bzdqdCtPNDlmWFNVKzhBTExs?=
 =?utf-8?B?ektpRnJoWnRWdks3eUp4amZFT0ZnRlJ2anl1MGFMZFppaUZydE5YZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1071e5ae-6e8c-4588-6a84-08da3c8b563b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 07:10:37.2920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD8wuZY27bdtzSZENpDtQf6Fo78nCJZAQuF0u0Rj20k040g8OWWVb9skX4L5GbcmDeE2WwOBUtXcVDJtbhXm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7718

On 23.05.2022 08:25, Wei Chen wrote:
> x86 is using compiler feature testing to decide EFI build
> enable or not. When EFI build is disabled, x86 will use an
> efi/stub.c file to replace efi/runtime.c for build objects.
> Following this idea, we introduce a stub file for Arm, but
> use CONFIG_ARM_EFI to decide EFI build enable or not.
> 
> And the most functions in x86 EFI stub.c can be reused for
> other architectures, like Arm. So we move them to common
> and keep the x86 specific function in x86/efi/stub.c.
> 
> To avoid the symbol link conflict error when linking common
> stub files to x86/efi. We add a regular file check in efi
> stub files' link script. Depends on this check we can bypass
> the link behaviors for existed stub files in x86/efi.
> 
> As there is no Arm specific EFI stub function for Arm in
> current stage, Arm still can use the existed symbol link
> method for EFI stub files.
> 
> Change-Id: Idf19db1ada609d05fc0c0c3b0e1e8687c9d6ac71
> Issue-Id: SCM-2240

I don't think these two lines belong in an upstream submission (I
checked patch 2 and at least there they are two similar lines).

> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>

While I'm not really happy with the Arm side, it's only the other
parts which this is applicable to anyway (with the stray tags
dropped):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


