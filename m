Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D602665BFB7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 13:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470597.730145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCgCu-0001xu-A6; Tue, 03 Jan 2023 12:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470597.730145; Tue, 03 Jan 2023 12:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCgCu-0001vx-76; Tue, 03 Jan 2023 12:15:52 +0000
Received: by outflank-mailman (input) for mailman id 470597;
 Tue, 03 Jan 2023 12:15:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMDV=5A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pCgCs-0001vr-Dq
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 12:15:50 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b3abe62-8b60-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 13:15:48 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4519.namprd12.prod.outlook.com (2603:10b6:208:262::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 12:15:45 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 12:15:45 +0000
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
X-Inumbo-ID: 5b3abe62-8b60-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzTWRdHDNEkRNFp21ZBe0/CrTV3OnUHeiUI9GI6/E5Va7bmb9i1wSXznr0Mt0+tL5CTANP0pLt10rzywCVdPXdA1pkb60DtCn4Ev0hOrJ5QDvzwekihtgP6I9v+1Tyrn/30ZdYzTvmY4y5kS8rEQ9tC+rgCJHJB78cVBGoAK39pMG4tjDnuMZ776k+litqQDsGLrg5rHvPdA1GgJGBV0zVI8FsrWRwJowfmFjiWXrUzOQtd8FNbOByXKTpLUDJ5G4F0cCAdpE0GyQXFyia8L7cR6x4x8gzbwN1xVsFMO7zzvuQdpDeiLKFgJfYern5wkiftGEDM8YchAJsSMYAqzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJNCStJYDmn1oZ0E2+wobE6P7eaHGzm9mLkM3k1B11Q=;
 b=ffEGqKXZf9/kZ1vYJCYBrVsDq1kiF7yH0ZfoDwOecgS++dBwylOc1rYr6gN3OJ1tjU6KUEN6rFYDHcNn4QkAGBnKsOT/dDvHyWY6piNSn/l5jy3Ss+8e+G9LG19/r6pu0MnPHqfO0gVtTi33Qze7OTIodrjIskA1N/qZLn22YnCOknHt4mtHcHeyAOMfzS+Sp6Wmb/hy4nR4vDapJH5HLUGZnkVR+hv0JQnkSVfPERbk9HNUKGVViCye4IFYfIMRZD8NnyKt12EDKqf31AFu1fKlCf/BL640FvuTTLlX7HBoYFGscGcCaaqeZ0OZ+2TGpNfWZvUfTDajSN5uwPHrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJNCStJYDmn1oZ0E2+wobE6P7eaHGzm9mLkM3k1B11Q=;
 b=gKMgUB1asm1I9Da+ilboCNfSXeX0fiVkxurP6WF8wUUG0432YLprly1GLnBnL/oObPkvrFVoqmRLwD3RzULy90AUBo2kumJK6GG4mzDzuE3Cik59mSD2uAOsSPxLyGjW7DRDvqlBKhDxP2tSPmOIr69e1zUTDvyOvtfWavmjw5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5dc9db0c-529a-3906-b866-2ec6e9efc27c@amd.com>
Date: Tue, 3 Jan 2023 12:15:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
To: xen-devel@lists.xenproject.org
References: <20230103102519.26224-1-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230103102519.26224-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0257.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::29) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: 37134b9a-1b2e-4418-fcab-08daed843da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2vGNH4WD9ABWvD1IGwYMBTEiS9dzNdYIYQswrBnNrkXzfAAoJWFjwPxfM6DR6Og46HHbjEyBFS5MNwYdV7SkwelizIwcSvmqWQwakiTymeEXhWhdSVkaw7iPM5LPYEK3yHP9ZyJZ7FpqAoQxJqDTasVvUjMehKhuI3Z4yq7dcnWEYyzto6n4LzsCaWi7o2p5UmKEaURbYM+x/mhsug0hOJ6JfoBTBHVVLl23yoCYMkNhdw566Kn6WcvWn59m0xYZsI+DM+z/Z/P8rzuQdmtugtGQ1WzX8+5pc8oKtGqcvr/iJ5xtkZA55Lziovrh/0rVqvzJv00P8pa7lU5IHTCvTs5sFV/cFNkyI1Mvh2WouiwzOD9KIjYnGgldrOwMyhYkXlGcEp9/8WU3GZR5+J8Jw6nLUHKTDZxjjCkFCOGut8RvPX9jnobsKRaPMC2MrlDZokaQk3ADVsO+zudljX3Y2+sDc0cKumARg71513wQDewO16RG1yo6JUIH488NOPfqzQZpngeUkFQ9mQ4ozkiY0KK+xgWozGzDsZYTvCcZrZJrXemJ1v0g7SxiHlxeAfMuR4Xs0Yy9Bi6mOp9XMZh0uflttrbNBAD4jiW0fW6Ot+nTw9hE1Ab3S1f09H2sLV1Wwb877AHgm5oHh7eGKZ6097czpCMDJy9tPtTXJZ0p96ruDPx/w4G0crUWKpVS+u7FNiXo/40hcOO16C8rnTuTtPVz7DOdDCiwufd3iF5cCazG1yhBfXJ71VbwU8XMTR2uI7MzuSNncywA0xLUvE/Niw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(38100700002)(6916009)(36756003)(316002)(31696002)(2616005)(31686004)(53546011)(6486002)(478600001)(6506007)(6666004)(26005)(186003)(6512007)(2906002)(5660300002)(66946007)(41300700001)(66556008)(66476007)(8676002)(8936002)(83380400001)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk1MSFlCK3dwajhWTFplNkZTbFc5cllBVlhwSWJBUDc4aVFUcnVmSUNxMnF1?=
 =?utf-8?B?NjdrQWxIM2ZVSnBGUU5YRjJ6MmxtSEJQbFRMNFRPY0FkSDFnR0xlc3Vpc2pY?=
 =?utf-8?B?ZjR6am5ZMXFncmFLRE9vZVNZZEhsYVFzNDFPUjMwZURlUXJIZmthZktYYWVM?=
 =?utf-8?B?UEpwRjNsUTRZUXZaR2pnMktWeHd2K0JwMFUzbWN6NnQvZUd3VnhiTXh1Q0VP?=
 =?utf-8?B?WVZqNHY3aks5eC8rNlpTdCtkazRTRnJxTUZlNVNNc3UyVFZJcFRTS0ZSNGNB?=
 =?utf-8?B?K3N0b1dYUDUvZjNxWHFteTJLZEFjWmxuMnZPdVpHU2dWYmhib1o3Tk51QXRF?=
 =?utf-8?B?dWtxK0ZkcmZMMldreUdwQVo2eEJ4Mm9KbkFoWC9hZHg2K2FtUnd5Sk1WQ3Zn?=
 =?utf-8?B?Ukw0a0J0cjUwTDJNdGtRZ1BidzgxTVdxZFprbVRpeTVWdzArOHRJMEJNWFlB?=
 =?utf-8?B?eHY5NHZDVEtocmNBaERHRTc0aTk5WnF1RjNTWVBvRTFQVkpla1hmbG02bUsr?=
 =?utf-8?B?VzhVSitZVDFtUlp3NkE1N1h4VEsrb1dCa0RoMTlqYzloVklRTmFjMTNKbzE5?=
 =?utf-8?B?WXpjazRNUk11REJHK0lkQzhDZUFjU3FxV2wweitnaFY1aGtXN1NZV243Mzln?=
 =?utf-8?B?K0oxSjgxQTl5R1BJUFlhcjNETWtwNVdONjhyNTFxcnhTcU12TkQzVCtiamsr?=
 =?utf-8?B?ODlXb3gvUEU3Z3k3QzdRTDJkbUd3MmVwc1ByS1FKc3h4eE9nNDZPWlNnNEsx?=
 =?utf-8?B?cThZSHd0VmlYT2Rsa25aTUdRMncrSzJIMVNsT3ZDMG1MNHIvSjUzSzJ3NUJq?=
 =?utf-8?B?Vmt0SFRVRkZSdHJpaWcweFg4NVl3MjhJdjNWUHJYSTF5UmQ0MVk5NVRyNkMz?=
 =?utf-8?B?a0ptc2dFTXNjRFpqSU04UlovWTlwTlJmUVRGNzlOTGMvVzlYUGd1OWl5Qm5n?=
 =?utf-8?B?Q2tMc2s4eXNKbStSY0NoQ0llZW9uS0pPWHhTNlJKdE9FZGlvemd2VFV0T2V5?=
 =?utf-8?B?Z09zTW9PTnN4RXc0RDVYdUZnZU40YjlkczIyaC9WNEZNNElUdG9WeDZWS0N5?=
 =?utf-8?B?TEhPNFAwdExQWHB4VGovdENPUzRRRkpDdWMwTmpqTUc3dDMxd2VPVW5UZXFk?=
 =?utf-8?B?U2JmWjVWWU9iMGpUSTgwemhSS1VhQlNObExYN2xWR2tHeHFPZVNrb0VGQ28r?=
 =?utf-8?B?QXN4N3I4TXFWTGMxbVY5WjBsN1JjZkVOa1VHeW1wSG5nd3MzcVZlTmxTSGNE?=
 =?utf-8?B?dnBxVFVqY0dTL3F0bWpBNHhZWlYxNC81bUI1Tlg5K29CdzZ2SGdOMG1KODVC?=
 =?utf-8?B?ZEJuZDJSSWRzNXdLWDZ4R09CZDFwZ0U2NGM1LzhzZEV1OTBuVUZ2RkZiWW1v?=
 =?utf-8?B?OUVGeHV1dXRHU05FalhhSTRpUXVTRVVtbVAyR205TlU1YkoxS21pbmlYTmVu?=
 =?utf-8?B?bkdHQTJvcGFWU21kTldqeisvLzJvSGM2WkpHUm4zWXZLNGdzWTMrUnBsdVFD?=
 =?utf-8?B?U1MrUThpdTZNK3A4VlJHbXRoZ2NOYlVDUSswT1lMcDlmaGExSzJUcnBOWFc3?=
 =?utf-8?B?eUFTNFl3VHBKeE9RaVJ4QU44VXJIWlhLZ3JDUzhMWmFpdmJINVNDdUVnWjRt?=
 =?utf-8?B?NFkrdjZCMjZGM1BFTEMvRXBlZEVJOEtGOVR5cVBDaE0rZjBBd284NzhUWk5T?=
 =?utf-8?B?S1J5dzlmVDVGYzYyUlliYm83U3BWOWlybFAxWEo2eU1rUEE3U2RlZXREM3VT?=
 =?utf-8?B?MFZhQ2duOEFXSWRUbWtmRjY5ZnZyWDU3NzVWUG5NZkpEU05OSHpsdGJ6WVJ2?=
 =?utf-8?B?WEVibkN4cVNWOHdPVHRyVEpLOVBTZGxiZjFRdkIrY08vTkJWektEQ2RUalph?=
 =?utf-8?B?ZEtMNlI4RWU1N1hMdndKQlU2Qzd0dTdRODhYVjlCNFFLZnZLZTJXeDcwRGJy?=
 =?utf-8?B?b3B1NXRXcUtlTlpoQkh0TTM3QkVOUG1sRDh5WHZBYm5Fb2FrekVCcGNEUFBo?=
 =?utf-8?B?TCtCZ3hhU3RxNkpNZ054akRCeVhEYWc1bC9jM2pDMEFYMy9kNjlTZnpWbnow?=
 =?utf-8?B?SnR6dkxVUHRxc0VOTzdDeEkxQ2o2VjFHeFMxTmx5RW9kZjBLTzc0c3VSeUxv?=
 =?utf-8?Q?g4YvRrw5k1X7Sv9FLG3ayn5LZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37134b9a-1b2e-4418-fcab-08daed843da3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 12:15:45.4000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOkDQNSfwcKmREPZ2IP8NnpBw9wjEMpKW9MFGNlNorMex1cD+PT5ni404qw40D9xUmUoUawBA8vcOh+U+2tARg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4519


On 03/01/2023 10:25, Michal Orzel wrote:
> Printing memory size in hex without 0x prefix can be misleading, so
> add it. Also, take the opportunity to adhere to 80 chars line length
> limit by moving the printk arguments to the next line.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes in v2:
>   - was: "Print memory size in decimal in construct_domU"
>   - stick to hex but add a 0x prefix
>   - adhere to 80 chars line length limit
> ---
>   xen/arch/arm/domain_build.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 829cea8de84f..f35f4d24569c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3774,7 +3774,8 @@ static int __init construct_domU(struct domain *d,
>       if ( rc != 0 )
>           return rc;
>   
> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
> +    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
> +           d->max_vcpus, mem);
>   
>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>   

