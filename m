Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82C4D1D98
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287219.487106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcua-0004FW-2Q; Tue, 08 Mar 2022 16:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287219.487106; Tue, 08 Mar 2022 16:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcuZ-0004Cp-VE; Tue, 08 Mar 2022 16:42:11 +0000
Received: by outflank-mailman (input) for mailman id 287219;
 Tue, 08 Mar 2022 16:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcuY-0004Cj-73
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:42:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11fd474-9efe-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:42:08 +0100 (CET)
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
X-Inumbo-ID: b11fd474-9efe-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646757728;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gA3lg178OSC/RArSw+zUcNzQejhkRe275EnSUlVb1zw=;
  b=VPnO6bHkmmrBZhCZhPbMqiUW3/wADrzjNJcV8Sy/suKLpk5+7QyEXe0g
   3tkQehe/nJSwc7mRxaTcF/m4ixGG+jTcw1s+Tp7X6T2gcIeiR83oX5tdA
   yyw1fVQpLdLTUZPuqrw1Jn0+peLwxYQDTkeda1D58P9hvxVT27eUtjZMK
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65732036
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OECl6aiB5Gfm6q57Z6n6eQ8aX161lBAKZh0ujC45NGQN5FlHY01je
 htvXWCCM/mKNGTxeN4kYdu19x4AsZPTnIA1TAs+qihmFygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV4ZPIPBqfYgaDMbFCojIY1m5ubDIXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 JFDMWExBPjGSzAMJG9LLLRvp+fyhynta3pIo3HOgLVitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfxmif8VJMXBaeP3Pdgi12OxUQeEBQTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV//yL/37KsiCRnbKKSQVo+iX3QDuh7gwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxb4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+TBNCPOEOdYazNii9zVCove+205F
 P4Fa6O3J+h3CrWiMkE7D6ZJRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYoF
 6lVIZvRWK8TItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:5eu4Z6xhYPffGo4Bjj4NKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65732036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCvj+h00Np6vppn6MihZ4d+XagjxKonUze5xwd5z2iNtDdUD4Y112nnjy78VXfzT57CRDEuUfd7HktTlJrmmEJ52Wiqp1RchOAVMfebWPZ79QqPLn0fXC0lGk19bWrBl3jbGXF9vQ3Pnp0x5Hd4KdLICTv4JmXqo6M5+sqPlGVIdNVUzfwiK69im2mr7P5B9SnEs4LSVNk7WeeoptGeiEobhCjMzxZuxbODcyvxUDxqwhO+HfVWijDoTDpM0MJNPM+A8bZCibypRrSeUqZjDI/TbkfMSnxV2gXO5N+ipUpkgQvAC6FK774EugohCJ4CTh/6921jKeBMUn1p7d1IM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FpsNgGd4pW12nUfLqrWEI0Fl+hLrQ10LohQqvbxOoM=;
 b=N14wETthtrijQEYENdXdEHMKQKdjV8OfnLg8FpkkEvMK2slnd8KYQdQ6lRbEggvC+w6CH4xZwggKOoYOAbDR1HSKjGvrOHNU/7NLo5CgypxA2QocciV6J4YOXAeeBaFEFVvs1zmIDjf4POWWHkjgDf6imvWI4oGe7Iqz4cJdpOQ2Ysiz0NpEKd22gXW2heB/p3oswXAGQW2GTEQmqEtssVxWKBQ00aGbtcyQgs2nHnqUrRx0s1ve3jVIFqLx/5kjTbqLb0q50fEpqzOXRFdzKh4sr+OFTbb1PRTmpRAOtwXy6JnVieFwRkY7s1ygwbyLN02spANhiBHysQzlSjuxEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FpsNgGd4pW12nUfLqrWEI0Fl+hLrQ10LohQqvbxOoM=;
 b=pyoj4TKlukta5uSDCQ3GCEFUd5ilDW3lDyu/IDIvMD4mOtqduynkcaC5cg1a0gC3VEqqUvXqTIjG2mgRi9WhwAU+nXEC3xgdKLvO10kpQlJxSXDJ6QKHOJG36cEK6WHAkGG9U4aw2ZNfPoKdon/BxJ/S6UolluOXCdKSODw8P0A=
Date: Tue, 8 Mar 2022 17:41:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] livepatch: set -f{function,data}-sections
 compiler option
Message-ID: <YieHVbKjtXY8vpOn@Air-de-Roger>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-3-roger.pau@citrix.com>
 <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
 <YidsSmPV1Pqulp+h@Air-de-Roger>
 <9cce44ca-3e31-bc13-3c56-2811efc36d5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cce44ca-3e31-bc13-3c56-2811efc36d5b@suse.com>
X-ClientProxiedBy: LO2P265CA0113.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebf2c977-3868-4f4a-ba65-08da01229277
X-MS-TrafficTypeDiagnostic: SN6PR03MB4592:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4592EE9212348FEEA41F31098F099@SN6PR03MB4592.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hav+9DhcAYneOpSvXdqrNwNMAERIbrvcA+mJLUxtABYRq2FsQR/E08f23iTHmu0n8qANRXUOJjCn8twZHmsnLioRqkO3aT4ATJNmGV+yw/42Ox7A5rDqSfgsALZTisE6ADmFvmeE8uacRspUOb0Z9MDqGCDz+zfuJZB0LxOElWSG1LB7XxT9adGJbnp0xJyRIesYvaWT74tutDgGIbe5b/bBeNYGFJrJRdNA47ugvSMPjAdJlgELYhFyuNpek1Dv+IzUMrHW+/WqlZ/f+/3RDIHoCaE3RMqe+hZt6n7YFY5TL3RgDl1ngdCpg+tPBaZqIizENLiquMEFHk4vFiLcYGEg/HUR8uX4neH9Y+RqV1uJfGfCgpyIlYjjD/iltwZtm4eU2uuhh9JLy5PesXsw40CIqOkxC4SDyXyeTl3iZYD6dS2pL0hO+jDUMNIOICWE3qPWGLiV+6mFGluSvGUL+XK7VB6cznWscsTQDmX+eYXNwo+RIcW0V298LI0DzRQSAuLDJD6SW7Pwb9b2gPDyDCuyB2tW/zMKs7chcTa0cdUfUEIK2BJ0lmDDJ5qeYSrL/5s4KmfU9fwG/D+C+UKEef054SXtCNfYevhVYZVgCeHAjDojV/pw3oQgBCWNDZDMoP4biIKZN/P4Sl9aOA7OwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(6486002)(508600001)(33716001)(186003)(26005)(83380400001)(6506007)(53546011)(82960400001)(9686003)(6512007)(6666004)(2906002)(5660300002)(4326008)(8676002)(66476007)(66556008)(66946007)(38100700002)(54906003)(316002)(6916009)(8936002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG9aZlZNeHNwWWh3UkJwMGZBRDlKalF2UkhLT2F1dVQ0Z2ZSVWtRdkJGL1ln?=
 =?utf-8?B?K3pqb1hyd2lETncwaFpZSUZIZkdiMnRBS3BHdG1YUFNZNnRvb2h5cW9iWjUr?=
 =?utf-8?B?MnY5WEdMVmhUOTE5emlVS0VBaEl3aEpSYWltcms2Y1UrcGc5T0RpMGRnT1lH?=
 =?utf-8?B?M3g0YTdVQ3RRY0dNYnhoUkMrY2Z2d3dFSVZNQUZZM1MxQmlaeVhzMnhURDY3?=
 =?utf-8?B?ZSt4cWcrWnJyZ2pjYjhLaDZHeDhacTNVV01wMmFodmFWUlprcElsZ21SdUsr?=
 =?utf-8?B?VDY1bEwxelM0UGd6bGd4dTNscEJVZkgwc2hTcUk0TGpUMW9tWlRDQjRNM2o1?=
 =?utf-8?B?VFRIellSaTVrQVIxL0JzN21ydDBlaUFhQ1dnMUZDUVZ3bzJDRmFmWFVpUFhy?=
 =?utf-8?B?TEdWdEhkT09MWEVWQTBSTnlKekhaQkF2dkl4TnYvUjBoVzVEQzFGeWdnY3NH?=
 =?utf-8?B?Y1dvQ1BLM0crb1hjRnJVVUZ4OGN6RFBMbTRrakc4WHFiektBSWthckpWY05Q?=
 =?utf-8?B?dENJaHgrRU5KWFl4S0ZURjAxdEd6ZmJHM2s1dTVwVGlBaDI1dGp5cDJKcExo?=
 =?utf-8?B?dmdTOWFhRFVtaE9Sa1pKZGVmYy8zNWVIWW00ZTFXWXNzVGQ0eTBqSEVRTUJ5?=
 =?utf-8?B?a1pGWkhYS1lMWVg1ankrYTJkOC83N0RPQmRRdXFacG5FZEF4ZWNQajJTVGZR?=
 =?utf-8?B?UXdFNkk0WHdLRTh3TmV6MjRCM2crOXIva2lMcGxtR2luVE1LenY0NnFySGpO?=
 =?utf-8?B?YWJzYUxZSFR1b1dDRG9ndUwySjlQek83N0c0TGlkTWg0aHpCbHV0RVRsNy9i?=
 =?utf-8?B?S05jcTd0S0RjUkVMWVFOMkRMclN4Ym5URTNrTytrQUIxQXAzQ3JIK3N2cmdk?=
 =?utf-8?B?blJjdmtkVEt2MGs4aklockdKTjNUaDRHVk5oTjlmWWdRbEtaTXY3VklDajU4?=
 =?utf-8?B?bWlpbStKbzBLdXVPa0k0R3paVFVSWjMvc2xnL0tRNkJ1cUpDNnhRaUttWlBE?=
 =?utf-8?B?cmRiSm5Ra0E1aU55dGtZTFhmMTFMT0xzY2FnUElUOFR5U1dhOGI5d0tEZnFE?=
 =?utf-8?B?Nlp0K1kwTHZGNWt4RU9iV2J2czJiVStMaE52Wk9qWDJVT3FhYVMyTFd0ZEUz?=
 =?utf-8?B?TEovS3dLcmFrUGppQWY1bkdSK2FJRStFSVhSWEsvOFUxb2NyY056ZmFHRGts?=
 =?utf-8?B?NDN2S3Ryb0ZLTEZxajdMOXhOc0hyR2pQZDY3SzFnSTV0VTBNOVVtcE5WQjE1?=
 =?utf-8?B?Rjk5RWc4UmYwanNTQU1TSTlDWTdJZUZhQnh3dzBYWTg5djdMZWRBdms3Vmcr?=
 =?utf-8?B?aXdhMWNYT3o4ckt3WUhKQXlUcE8zNXRySEdaZ3hBM2J5RFJqZlVxSm9oUC9C?=
 =?utf-8?B?ajJFbGkzaHJGS0R2clBUa2gwTnNERXprQ2o4ZkJJS1pYL2VpVFZlaXQyOUdO?=
 =?utf-8?B?akNXeUNSaUJkVTA5aUxJTGk2dk1mWnpHU3hzTVNkdGdWNy9wTkVFS1NYU0Na?=
 =?utf-8?B?TGJ3NXZGVGlUT0piVGRTaXpxeHl4c3RoQ2hKTEg5WVBpZWgzSjNLRC9DWXJE?=
 =?utf-8?B?TnAySlhScmxlRWVUUzlxcmE1cjg2YXRXMXF0eXlxbm5idEJEcE56VUdENW1w?=
 =?utf-8?B?M1kzYlN5NURsVDhmdTdEUzNXc3BDcVlOOFVBUU1sa1ZrbFdRMkM2QXpBR3Y5?=
 =?utf-8?B?RXBqdWcrbXVwSUw5NHh2Ykh4b3U3RUZJSEY1YmFwcUI4QlZPeU5YQjJMU2lz?=
 =?utf-8?B?Z3ZPZVRtcjY1VW1xSWYzTDVCV2QvUzJNMEFZUC9zU201c1Jubi9sbDV3VGg0?=
 =?utf-8?B?NXcrTjAwaEJwdGJKMEJaaFBobndpLzFpZnFuOGpBOWdoZTlYS0hiYWs1d3NG?=
 =?utf-8?B?bkthNWFjTGNGTXlwUUphZXA4Z2pheXhtSTU4RnZrTnExWDFMV2JBVWljM0Nw?=
 =?utf-8?B?NU5UNnd3dlQ5MGp0ZGR1bmtuQTFtK3VHK0gzVXUydVJCZjJWSnkraHo1T2Vq?=
 =?utf-8?B?SkhjVit1RGNUb3gzL0E2VkJIRDkrdkwrM05CS2M5TVlzVjZDYzh4SzdOTmU1?=
 =?utf-8?B?cFdNNjRhcEtycTV4WE92MndsZ1pYSUdJSkJrZ1JPeU5MK01pb0tPYll3K3dy?=
 =?utf-8?B?Wi9DNEtPSGZtbGZBSStzRUpHa0Y5djM4bVB0MWFvVVgyMnFwUE5Cb2JwS3RZ?=
 =?utf-8?Q?STKuaUz7YN43D94Vd/HItgM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf2c977-3868-4f4a-ba65-08da01229277
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:42:02.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yb5xglcUW2cKCAVCKzZIucwdSTRTLFtqJ0TVkzZM+mfPVWR//79WHx5fta2h8teB3M/MQgmHuDFiRoTbERx6kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4592
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 04:13:55PM +0100, Jan Beulich wrote:
> On 08.03.2022 15:46, Roger Pau Monné wrote:
> > On Tue, Mar 08, 2022 at 03:09:17PM +0100, Jan Beulich wrote:
> >> On 08.03.2022 14:49, Roger Pau Monne wrote:
> >>> If livepatching support is enabled build the hypervisor with
> >>> -f{function,data}-sections compiler options, which is required by the
> >>> livepatching tools to detect changes and create livepatches.
> >>>
> >>> This shouldn't result in any functional change on the hypervisor
> >>> binary image, but does however require some changes in the linker
> >>> script in order to handle that each function and data item will now be
> >>> placed into its own section in object files. As a result add catch-all
> >>> for .text, .data and .bss in order to merge each individual item
> >>> section into the final image.
> >>>
> >>> The main difference will be that .text.startup will end up being part
> >>> of .text rather than .init, and thus won't be freed. .text.exit will
> >>> also be part of .text rather than dropped. Overall this could make the
> >>> image bigger, and package some .text code in a sub-optimal way.
> >>>
> >>> On Arm the .data.read_mostly needs to be moved ahead of the .data
> >>> section like it's already done on x86, so the .data.* catch-all
> >>> doesn't also include .data.read_mostly. The alignment of
> >>> .data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
> >>> up being placed at the tail of a read-only page from the previous
> >>> section. While there move the alignment of the .data section ahead of
> >>> the section declaration, like it's done for other sections.
> >>>
> >>> The benefit of having CONFIG_LIVEPATCH enable those compiler option
> >>> is that the livepatch build tools no longer need to fiddle with the
> >>> build system in order to enable them. Note the current livepatch tools
> >>> are broken after the recent build changes due to the way they
> >>> attempt to set  -f{function,data}-sections.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >>> --- a/xen/arch/x86/xen.lds.S
> >>> +++ b/xen/arch/x86/xen.lds.S
> >>> @@ -88,6 +88,9 @@ SECTIONS
> >>>         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> >>>  
> >>>         *(.text)
> >>> +#ifdef CONFIG_CC_SPLIT_SECTIONS
> >>> +       *(.text.*)
> >>> +#endif
> >>>         *(.text.__x86_indirect_thunk_*)
> >>>         *(.text.page_aligned)
> >>
> >> These last two now will not have any effect anymore when
> >> CC_SPLIT_SECTIONS=y. This may have undesirable effects on the
> >> overall size when there is more than one object with a
> >> .text.page_aligned contribution. In .data ...
> > 
> > Agreed. I wondered whether to move those ahead of the main text
> > section, so likely:
> > 
> >        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
> > 
> >        *(.text.page_aligned)
> >        *(.text.__x86_indirect_thunk_*)
> >        *(.text)
> > #ifdef CONFIG_CC_SPLIT_SECTIONS
> >        *(.text.*)
> > #endif
> 
> Perhaps; I'm not really worried of .text.__x86_indirect_thunk_*,
> though. When adding .text.* that one can likely go away.
> 
> > FWIW, Linux seems fine to package .text.page_aligned together with the
> > rest of .text using the .text.[0-9a-zA-Z_]* catch-all.
> 
> There's no question this is functionally fine. The question is how
> many extra padding areas are inserted because of this.
> 
> >>> @@ -292,9 +295,7 @@ SECTIONS
> >>>  
> >>>    DECL_SECTION(.data) {
> >>>         *(.data.page_aligned)
> >>> -       *(.data)
> >>> -       *(.data.rel)
> >>> -       *(.data.rel.*)
> >>> +       *(.data .data.*)
> >>>    } PHDR(text)
> >>
> >> ... this continues to be named first. I wonder whether we wouldn't
> >> want to use SORT_BY_ALIGNMENT (if available) instead in both places.
> > 
> > We could use the command line option if available
> > (--sort-section=alignment) to sort all wildcard sections?
> 
> Depends on the scope of the sorting that would result when enabled
> globally like this.

I'm not sure I'm following. Don't we generally want to sort by
alignment in order to avoid adding unnecessary padding as much as
possible?

For any wildcard sections we really don't care anymore how they are
sorted?

Thanks, Roger.

