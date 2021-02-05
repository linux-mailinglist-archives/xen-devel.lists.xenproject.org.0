Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C3E310BF9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81721.151102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81LE-0003rB-DQ; Fri, 05 Feb 2021 13:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81721.151102; Fri, 05 Feb 2021 13:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l81LE-0003qm-AM; Fri, 05 Feb 2021 13:40:08 +0000
Received: by outflank-mailman (input) for mailman id 81721;
 Fri, 05 Feb 2021 13:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l81LD-0003qh-9Y
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:40:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 917b7da3-a5e7-40c4-86c7-5816c380d6db;
 Fri, 05 Feb 2021 13:40:05 +0000 (UTC)
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
X-Inumbo-ID: 917b7da3-a5e7-40c4-86c7-5816c380d6db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612532405;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jxu+07f2P/7cTk04wemVh59C5QwUkAlLUWRRXhvqLfQ=;
  b=AK2b1XlUjV9IxBr7Pb3Wsvjv7808hG/g/fNKW/JOFmh+hrPVGwIsZgEU
   V/soZlS1EpPJAkMUDSIfalhE0UjNcMM/PV7Ot+YEETYt7NLFq9jiu8ecW
   4GEN+Jx8VxxQTrFrzCO5L7KNbH02LGhUbhWcunOZeNDmrQkFEzSfIGLlo
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JQ2iRsWx8wYIFxQ80QNV60Q4gqQqHauZMiKbPDK2dDBG/Elw2e4itTYla0hn4ZY6PNG9YtZsup
 JWntFGQ0mO+a8lk+8VlqlLJa4bxzuPRp+rSOe6uc670beTkOobFv7Xw8wbp/2WmVU/p3RunVEC
 7cmqXLToV3LWuTMZ7LIlGNPyNkDWrTuRtCGs20Vmee+o/3WqPZktH7ERMujJvUqFl1n+pENGtv
 A/a5ocySi9J7xePqrERf5uo8i1nla2ASzMW5bg1gAaZOpDVJEGKnzeQCxsQItqkwQrIFXPOjzB
 R6o=
X-SBRS: 5.2
X-MesageID: 37017221
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="37017221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISHRWwMcsuCRnf3iJoSFWe/i5U6WYqKA1rZze0CwQ49DErGxUcPoVvgDKUb8LpTtu44GC+MG4mdCSKbwi7iHFBkuy3gY2uNABq5FkV8VYHpOs70oZLlCLMxxB3Lhgp7jJRYT2HBy+PlCOp18TjfCl0qoP0l1NOHRoPGLs65ACD5zVgLZFeyyEX2SGHNL7lzjdy9R2yQgduVhjuGmQ5Grkm2IxDEQ2IW3xzELaGvz4skWGegG4bE2jvc4zd5JTC+/eaabzfJG1yJoU31UfcESyI/CfKzmk2yPnOmqjiHCdStEgciNHRDoinkyB5cAJSJ/5/NwXzo8C1QzNn+f7fvCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lyc7unYAD9k032jv108wYTg80RlGWh+6uMqt7vWKe9s=;
 b=Ghjhv8HfE8uEbuzqAo84sqCeFkBgJ2pvYS5TtRHbXjppx5G/fQz64lCFQ9aPSGP9OxfWx3vuLjQbQB5ejeM57Tvjx4mdXZaCMEq7pJSUKNgDQXbhFZqtgXfAT1kj0Dqc/UGeYINAhFOlhCBQwe9cRaquYhRiKWm0KLvKRbrsv5HsfccDyquMPWwyrRC850kRmS5Vi3rB3Jn1obkyoZzA+dV9Ik2+DpjFLQx0MsHeVVKyBU8bo1jZe6ijxcVp/vuNEkrRkX1+RS4oYx9B6iIqQCLS8sE3Gak/SCa49GaV7SBoxu1302621+evFdO76u/vW0WRC5gx5f4HJPvFNq2l8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lyc7unYAD9k032jv108wYTg80RlGWh+6uMqt7vWKe9s=;
 b=iWIBZbreo/r90IqhblDh2fp44ksUqhaNP40SQU8+twNkbGCCstmQE30bhA2NVWtdcaYWCw15nksd2gpquof9st6zQEbB1gxs6oNCip3xnwVX0BYEtRDemoi7rhluE7O9Xu97OphotGwKNbRlEx6hapcT2LLuWVrrtxW6BQDzhC4=
Date: Fri, 5 Feb 2021 14:39:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/configure: add bison as mandatory
Message-ID: <YB1Kqez4mjzog2YM@Air-de-Roger>
References: <20210205115327.4086-1-roger.pau@citrix.com>
 <bd9d86ef-485d-fc93-f402-0a97acd9d2dd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd9d86ef-485d-fc93-f402-0a97acd9d2dd@citrix.com>
X-ClientProxiedBy: MR2P264CA0133.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a55dfe9e-01f6-4269-c96c-08d8c9db88b1
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB36731F6B183E020FE9BACC9D8FB29@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lM7x/YeKp7dvIRRBqxte/FnsPp0Q5VQ4NFCrCSwucvSThNkKnb9MtobVH/vSL880fTarWRi36QjzkBatjSZnr9JDDu5N68m1vJE2wGgEY2foK0AOrYUIyyZ0pqrPk6b+RG5o5wNUWt27IxEcxr5hyLxTOTi50Nx3d9yutEn1w1fQPvRJIFPuB+1cq5n5wTGcbcc5012Q9BgegJnILLB6aHOyelvQaEOLH2oZ9RgWpNYYFFqcmNTublp9Eg0f8WnTN+ab8gG59Jyix44OHE+jpToGSziiD6ZR0F/mIS3dxZQW8FyrnUSr05aHm20odEDUfpb9scJSY+ZfLKimTvJ5BR1pawJ862GIH8KSI/w+UF/kDOzC48y1wD4OXSWE5uml4/7ALfKCu+nwnO970MsMw6UfU/1XE48gOKm7dZIe9wU3y2NI3yp08VIWJ0rWt4HDqQQ/Bdyx0JE+FAmks2Twr+xn3Ldo97uqUvbKPI0QNvYpRGx7GkcYIoVFxHu9ywO/1r4MiW17IY+fNyvOsUudXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(66476007)(85182001)(6666004)(54906003)(33716001)(6862004)(478600001)(9686003)(66556008)(2906002)(8936002)(8676002)(6496006)(4744005)(186003)(86362001)(16526019)(53546011)(4326008)(956004)(26005)(6636002)(316002)(6486002)(83380400001)(66946007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1A5U2R2WWhkZnBTOFZSbG1sWHB6eEFjNXNqNnZsaFlLbnFQZU5ucTY2alB4?=
 =?utf-8?B?MVZDYTdmaGhFSlIxTlBoT1dzZWRUOFQ5b3RMUEJ6bUhBWWdpaTltYVFTSFc1?=
 =?utf-8?B?QTJUeEF4NG1DTC8rd3RYRGZnZDcvSFBPT0U4bTV4eCtRcXdiVldpcWViZ2or?=
 =?utf-8?B?UXlLNm4vWkI2NXRpZlRHVEdFYTUyMGZhUnRzUVowVVFnS2lFSnFEd0JZNVRF?=
 =?utf-8?B?S0dobFFPdFJUU3F4ck1hMGV5RmhRQlRxZmJxLzZYc3BFb0xoaURrRUd1elk3?=
 =?utf-8?B?dGEwTVQ0ZnFydEl1bmtSTElLQnM4VUkxMisvcmMxc3BiUHEwTm1taGZKY2lO?=
 =?utf-8?B?aktzcjZrL2syUlpVSTNUYXYxMFpBenkvcEJEcUVBMmhVZm54VGNON080djRK?=
 =?utf-8?B?bkFzU1R6ZGw1YzVWTGY1NktnZXJJQlVYdWVoQW9YK254TkxBODZXamdFd2hF?=
 =?utf-8?B?eFZFVm9WdzMvSlh0SVMvMDlQdjFhay8xd2REeTBBZzNNTGpSdU5PU3VabDN0?=
 =?utf-8?B?eUJ1N3UvbHYycDJHR1JaeU5VQVhMdFZCN3IzZEduVnZmLzk1SFdvTHJSUkp4?=
 =?utf-8?B?VjBONHNtbmh0VkY1Y2hQT1I4Uy9SeEo4UGVVeDMzdU00aEYzQjVXU0hxU0Fz?=
 =?utf-8?B?dk5qWU1pVTk0TExWaDJTZ1RqWGl4M2o4SUk4OExYdTRza0Y5bnpaODZnckNJ?=
 =?utf-8?B?UExxRHhpSHlaU0NJRkI0eTRROUhLODJXSkpXWUxPYjhROTlWN1pOamh0NHFV?=
 =?utf-8?B?bmFvVzJyTzNac1JVM1FNTStMT2hBNHBXeE1qc1BXdTNjc0FsMFhMQjR6YTFU?=
 =?utf-8?B?emR5T3FpMC8rSG5QclpXUnRWbWRZcFB3TjBCaU4yRDVmc21kSWZOWHBrWmxa?=
 =?utf-8?B?MkN3V0NkenNvS0tock9WUDE0T0JwekZuRWNNcWhubDY5SDVVUldsR3krQWVN?=
 =?utf-8?B?UVRISG1TTnpSbVpuYkVBYlNwUlYxdkdSSTRpUnFwdnM3UE4vQmlhOWpJZHY2?=
 =?utf-8?B?MFVtTjNldE5Xby9PTGxiTkcrdUJIM1hGdSttK2xubzYwa1VIOThxdEpndnNV?=
 =?utf-8?B?Nkl0WE8rK21kV0VmQ0lpM0dTWjZ6ZDFhL3ZlSXhkTlRBUEw4R3d1QkVnTC8x?=
 =?utf-8?B?b1BlSjRtNGY2eGVOVlgvdTdzUFlzK3BTYThhNWlOeThlc1FFUEJKVVlaa3dU?=
 =?utf-8?B?M0RVSEVSeG1hMVByYkIzZ3pocEJ5cmRNZXBwTlhWSFFBTUY2Z1QzaXpPRlFS?=
 =?utf-8?B?Wm11Mlg2R0UxTGFiSUk4NDM4S3hmbmFES1ZmVG92VEExMFozcXo1d2VCRlA1?=
 =?utf-8?B?S1FUOUgrblZtVDFyM2dJSnRDTWVQUGhmbmkxc2JNemZDOEppdzNEUGdPZ0U3?=
 =?utf-8?B?TGJoK2k4U0F5eklrWit1ek5mSk9rbzRpYVhBZXkwTjJ3NlhqTmZHN2RybU1s?=
 =?utf-8?B?RkxpczZiS3ZWZFVZN2E2QVl1U2E2Umo5UUpuNmVlVjlFZ2Vhak5mNE1Hdkk2?=
 =?utf-8?B?UTgrM3JEaWl2UGJxUmFYdlVNbk1XWlpvcEVpTFp3MXF6TC8zcVVxTUFQNHhE?=
 =?utf-8?B?Z3Y2aWVMeGd6WVJ5aFo5L2srdUJMOThCY0ozWlExdjFTTFV3ZWNPd3FWajV0?=
 =?utf-8?B?Vzk1ejVhWE9CR3k0QVZZK1VacnJUVFNVbEFRakpmaGtQdDdvUnkrTG9NY2FB?=
 =?utf-8?B?dVMzZXowd0NaZ1RPU29FZnFYaUQ1QWJVRGZGOTRmUk9RaWoxdlNOUGdFL3lW?=
 =?utf-8?Q?f0cKP7NDfnXWHynH4Bix3d0FrwPppeRCfczcPE/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a55dfe9e-01f6-4269-c96c-08d8c9db88b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 13:40:00.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aztv9aoPh+bafK/QrWNSoWlrg7E0rf064VIbf2gsVYpneaopejLDxGjm79iN8caJ8hYiNxnyOmBKdMlnnEdiuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Fri, Feb 05, 2021 at 01:34:20PM +0000, Andrew Cooper wrote:
> On 05/02/2021 11:53, Roger Pau Monne wrote:
> > Bison is now mandatory when the pvshim build is enabled in order to
> > generate the Kconfig.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Please re-run autogen.sh after applying.
> >
> > Fallout from this patch can lead to broken configure script being
> > generated or bison not detected correctly, but those will be cached
> > quite quickly by the automated testing.
> 
> I think this can be simpler.  Both flex and bison are mandatory libxlutil.

No, we ship the output .c and .h files so that the user only needs to
have bison/flex if it wants to modify the .l or .y files AFAICT?

Thanks, Roger.

