Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CF5359F60
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 14:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107821.206086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUqeV-0001Z9-QU; Fri, 09 Apr 2021 12:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107821.206086; Fri, 09 Apr 2021 12:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUqeV-0001Yk-NJ; Fri, 09 Apr 2021 12:54:23 +0000
Received: by outflank-mailman (input) for mailman id 107821;
 Fri, 09 Apr 2021 12:54:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2EHW=JG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lUqeT-0001Yf-W8
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 12:54:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c295892-2e23-45e7-a03e-0647c6bc5e62;
 Fri, 09 Apr 2021 12:54:20 +0000 (UTC)
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
X-Inumbo-ID: 0c295892-2e23-45e7-a03e-0647c6bc5e62
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617972860;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pM9SaWu+Ukt5IFMm+SIfosVx3UNFpmNzW09B/C+OKGY=;
  b=Fr3TJaT3eUTN+GfslCW+6QqpPnxJPAarH9L7bifowY0VlfdCeDeet5K1
   yhMhndAnH0Qje6awO75/RSNdVTChHjQmt8pTPOnOM7Pafq8919hwDbmmY
   iz4HMq5HkUXttrcF7bO/auUd2RfQcWroyyez7spy3jPjVVoVDpkuLHeow
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mE1CCGo6sn09WCtbBvysd4h3Pi80r3DPSTPOfcssNWwWa7JMwjmsy+mG69X+Td5GTDA4Tkhfr6
 pcSthcWM1wpqbyfIXsaT7263H5WPB6rf5I9HCWK2x96rxFL5Cw63sUjMnDlQ0Jp44SJLIrv39t
 u8hHoDePodAML4gS7wo7jT5LJOW9yoss6R7Ns0edY+pvb9fCTvBi23EF8Xg0jGRaSmL9pq9B7C
 95EOpvrmtIS02EFnqb9WMPbBBH/NXfib8ifcnaNiZfMk4sn3j6rntGzUqQVpQnl8JRCB5UJaag
 u0E=
X-SBRS: 5.2
X-MesageID: 41104157
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+4wJeah/GyCflTNnZDjnrBRGP3BQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.82,209,1613451600"; 
   d="scan'208";a="41104157"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp09cWfE9vyVub2GxMD3CfasQxxGLN1VQ5nvLooq82eYnoGckUngKA+C3goXNRMAG+Ax9/jQaZOY+hvOxSqBlXgwVRhXpxm5Q+kBW7yfVjXQcZ41y0dhOJpMKXPNt3vOonEoys4NGHe8vxa09/3V8FDUOq1bWgqlQ6wHfBDv84Xv9BSLXqYxi+8OUb97O4HiiWg2upF1f9CKEj/fc1v/IQVahsIAiZTGwpxoGRjSVmcQEHIFU3G5XpIhC+7XLNa1hJ6Ixuyv5shYTbVMPnYQcqkr0SLBaVV00V+mEJ5QeyG87Ava3P43vw8iV1/VQkgqaAAluy2xyFQGXc+nHYd9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3sz/kHKcQ/kphMk5MS83SWxQhL4qGgP93o8Mpqi5As=;
 b=Ur/KyXj5jtr1O6P3gXTmGb7OMHPu4uLQ7wCwyux9W0asYlmndbx3T2lMa3M+VnZGIRi16YDLWv1jpUQF8vYfVkQar8lCUfOjF+BXIau0Tk36zCKBD/gydEh3L/Tqy99PW6erSC90bJNG8F058D1C/ycc88nYA2ZAXiE1BZtWWsaZxdZ/aw1CPooz4qFGLBOADirzr9Do3BgzyNom15kxYQDUe/BPQxkZHfg2nj+3VqTxgxkiF/Ue7gjRhfS6Q3Bua9+yeT2r6nhyx95LS5i1xLm6MMAnq+jigGspZjmGsWMMWRklQl+iUkGq1hCydFcuc50CzzczpyQSDA1Ev4+sAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3sz/kHKcQ/kphMk5MS83SWxQhL4qGgP93o8Mpqi5As=;
 b=ly+cO3vYAd7m2WEDkGbeg3EbfCoky17rQvmWVk9pc2lwCfiSizRpaZBrTPYiNviuUVKr5uDpBleSPsJzIzrc96ing2rXzHQq6sNgucCPaBR9G5KXbhMeCGtrN7g71mmVxeliqHSD5pb/5ChmKlt+CWZNppiastNrBIh3O353wy8=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <4ea9c4a3-74c0-1722-fa5d-3930be99ef4a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 09/11] kexec: avoid effectively open-coding
 xzalloc_flex_struct()
Message-ID: <8131c6f5-ed8c-98ae-376a-fe8f7b63a790@citrix.com>
Date: Fri, 9 Apr 2021 13:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4ea9c4a3-74c0-1722-fa5d-3930be99ef4a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0343.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe4f34da-d758-4e8f-9fe1-08d8fb56941f
X-MS-TrafficTypeDiagnostic: BN8PR03MB4946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB4946276D70CC1F70B5D6FD7FBA739@BN8PR03MB4946.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEJKHCPJ0hi5tFG6rNx8a+fpzh/zAHlN5A/3QMJrGV48QErsW5jT/2WTf8J6FwtM+TDebCLEPqQok4pCIuc4nacUGsnuus0NmzNLbp0irx1rpPMfsdZ8kPt6q9+YdByKKkSkgUwBcUelYIaQCp9Jc3BC/iIi6qPFjohmi/80Fu/tVxjCeJb2AKKpW42hc/CCLDyBbeKBfq7v9RE4TZLvH62c5NTfBwUyo5EIPLRxhaNaeiEcWfDcIlTOW2OUQte+N+OXmZ8alxPNfl1oBJbX9wdHY7uh7hGdzx1lJO3Hxb8p5bglGCyen/miKmt4pQ89ngx9+NSr4UzFxSJ/iSPVihN7yOg2JDwxyMn7hN/SO9oklRJA+tVNWE4UnANcj+3dHgiRp1NMmFUYg/aOpf+7uaWei4as+ZWsfcqrTrk9eaYl0y9VZG3PhTv8IPiyWZOkyPEU7BshIOeuAHEOXyVm9ODCHI8HjvtZc7fA6X/GV0SSDmpbNP8dS5sNriuAWtZw+PkyDX0ZCZ8DihRS9f+Y3OA5JQurmE3aSaprhCL88kVaen8L0y3hQkxyBXvzW6xwlZJ1Nuz6rX1JItj7u5DXqVTikYAnTHeArKu7PgjG74nNSjQAj91ilcMEQTsOJ0lO2vCAjJ/HPCzS8tq095XnKjajakhFWWEo0q+1c97sGevNjurqOjCqrjFoMZUXfV/z9Ib0MocCmJwTTvAa5tLDHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(66476007)(66946007)(107886003)(66556008)(4326008)(86362001)(36756003)(478600001)(31686004)(31696002)(83380400001)(16576012)(110136005)(2616005)(956004)(53546011)(2906002)(5660300002)(8676002)(6666004)(8936002)(38100700001)(6486002)(16526019)(186003)(26005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFdQcXlkd2dIbllzNllGM2FHWnV4cVpUUDdmQlI5ZUJ0b1prSGhGdEN2enlG?=
 =?utf-8?B?bWZyaUc4ejVHTnFTL0ZiU1p4NFk3Qm42b1BVdTVyenN1MFVtYXN4cjBNbWhs?=
 =?utf-8?B?K2ZsUnBsVHk3NCttNUM5dzljMGkrTGJyODJTbzcxUTlxWURqaXNKUkUrQWEv?=
 =?utf-8?B?b3RkanAzS3dWM0NhSzdzbUdHQmZkdG1FT3cwRVZ5MHdib2lFRUtFelNjRUFo?=
 =?utf-8?B?VkhaeUZsUzFhRU03WFdzUnpLb2Y5Mk5oWXpnd3djY3ZSSlZqUmFlNCtIdDhI?=
 =?utf-8?B?WGlWZ2c3L0FDMU9RRVF5WFdiQ3M2dm1BSXhiNjQ5cWRadjMyOFV3YUx6UUd4?=
 =?utf-8?B?SThxTGdQS2VtRzZWeFNtQm5jRmRUd2pUNkxVYy9CcHUvczRhSTF5MnBUSENP?=
 =?utf-8?B?RXpZd3Y3MnpuemE1UGNQWE9ZVllyS1c3MGpaK1prYjZiVU1OWlRzUk5zY3ps?=
 =?utf-8?B?ZHhIQ2lUUFgyYlhNRW5pSTlZNHBJakExVDA5eFNOYms1R0pVY3BLVVFDMDhx?=
 =?utf-8?B?SStMWHpzNkc3V1U2bHpLZmp0WUhyK0dzNXJta05aM0FLUTJlbDJQWlpvdFdJ?=
 =?utf-8?B?dWR2VitUbG1iNGJPTUZ1Rmo4RDlXZDRjTlE3UnUySlAwR3U2RVBKV1JidElB?=
 =?utf-8?B?cG91YStmM3lEb0tSS0NiMVZQMG1IUXEzWTJLdkxndW45S0ZZb2wzL0NaeEVL?=
 =?utf-8?B?QUZhM0hUM1d6UzVYdFpaSFJlcnl0M3JiMlVwb1lWYVJlWnlPaEF2a0o4UVFO?=
 =?utf-8?B?YVNlOVFvSGhkV244Vy9WMDU2UzhCZGt0eHhCcEpuZHVGYVBQMW9SYnZlSmRN?=
 =?utf-8?B?cWdwUGphU3R3cnJPTklUc1N5SkpDUE95eUdzQXlkcEgrdGY4WC9Ud1lUUlhu?=
 =?utf-8?B?d2JHUlFnVytkSVVRcVYzeWQvVThDL0J2SmhCRDZ2bHhIaHpleDRoQS9TT29E?=
 =?utf-8?B?aXFVQnp4bUZxUmd2bmZ0U1hUbzJzYXBTNWkxRDA0SHhtNUF3Qm5LTHI3UFl3?=
 =?utf-8?B?cCsyK0NlYTdNTk1ESktFMnVQMXl1ckM3VytjVXVSR1NuaWtQZzhRNU0vek9l?=
 =?utf-8?B?R3poVTFqMkNpZjAvbnFydW53a3BYYjN4U0lrRXNXWjMzdjB2NWdCdjYzUXJu?=
 =?utf-8?B?YXdqbmhOMUl3VDRGN2hFbnZya2pDWjhEd1I0YmYyV1IyUXN4emJUMVdLMVFV?=
 =?utf-8?B?Y0pmc0g5SzFyQ1JmangrbFVrUDIxRDZRRnpLd0MrejJLakVrejFJNFRpZzJx?=
 =?utf-8?B?eXAwN0RzYkVuTXh1bGViZ21wN0c4Mm43YmprOUgrZnR6TW1Kci9Sd1h0NTFj?=
 =?utf-8?B?M3MvZFVFVHgwazREdHR5eWRoRWI4ZXhjZzNEc2p6UnhQUnZPU1FlNEM4US9P?=
 =?utf-8?B?Q2dzS1RWQWVUTDgrbXBZakwyZk1XNWJYUEJQaHpvbEJ5RmlmQjliV2N0eFhk?=
 =?utf-8?B?WjV3ai9WS3BUbnJPRVJuNitSYnhKdGJWWWs4aitWYVNPdzVMTjVCVUJxRDl6?=
 =?utf-8?B?NzNmU3FEakNJRjY1VkEyRW9DZkYwWjN2a3VISmpMeFc0andORFpnVnVFdEY4?=
 =?utf-8?B?NU02WGlPM1QzSXVzcUk1VkxFOEQ3RTAvMFlNZnY3Z1c5aXVFOUxleWp0b09v?=
 =?utf-8?B?YjRYVDZvSUZKVlBCM2JJeEQ2UDI0Y3JtNEpNM0duR1BqOGFlTmJQQjJud2Y3?=
 =?utf-8?B?NkZhUTVPTzNvUG5sZkVYd0x6YVloNUgvaEpENDJMNXYyeTZZeWgwTm1McDl2?=
 =?utf-8?Q?aSVStxudhnr874GLXAvGK3gJePR7z8/G1XQqnop?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4f34da-d758-4e8f-9fe1-08d8fb56941f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 12:54:14.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCMbGnSUUbm2WUvUF9NtAEQdBdKRyB67Pe6ud7nYuefwNRoQ4Fy0xcM8xC0dpYl6Jkx9dpzeGsqQTPbqR5YG4UTTHI9v0rNmSdWvHxF/+uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4946
X-OriginatorOrg: citrix.com

On 08/04/2021 13:21, Jan Beulich wrote:
> There is a difference in generated code: xzalloc_bytes() forces
> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
> actually don't want it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This honestly looks like a backwards step.=C2=A0 In particular, ...

>
> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -463,7 +463,10 @@ static void * alloc_from_crash_heap(cons
>  /* Allocate a crash note buffer for a newly onlined cpu. */
>  static int kexec_init_cpu_notes(const unsigned long cpu)
>  {
> -    Elf_Note * note =3D NULL;
> +    struct elf_notes {
> +        Elf_Note first;
> +        unsigned char more[];
> +    } *notes =3D NULL;
>      int ret =3D 0;
>      int nr_bytes =3D 0;
> =20
> @@ -477,7 +480,8 @@ static int kexec_init_cpu_notes(const un
> =20
>      /* If we dont care about the position of allocation, malloc. */
>      if ( low_crashinfo_mode =3D=3D LOW_CRASHINFO_NONE )
> -        note =3D xzalloc_bytes(nr_bytes);
> +        notes =3D xzalloc_flex_struct(struct elf_notes, more,
> +                                    nr_bytes - sizeof(notes->first));

... this is far more error prone than the code you replaced, seeing as
there is now a chance that it can underflow.

~Andrew


