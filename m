Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C86F3A102B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 12:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139181.257435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvZo-0005rF-DY; Wed, 09 Jun 2021 10:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139181.257435; Wed, 09 Jun 2021 10:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqvZo-0005ny-AP; Wed, 09 Jun 2021 10:36:48 +0000
Received: by outflank-mailman (input) for mailman id 139181;
 Wed, 09 Jun 2021 10:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqvZm-0005ns-Pa
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 10:36:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b800456-4bf6-457c-af08-5ffd037f8023;
 Wed, 09 Jun 2021 10:36:45 +0000 (UTC)
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
X-Inumbo-ID: 4b800456-4bf6-457c-af08-5ffd037f8023
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623235005;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UVGTGEoVd/pxTWlHFP0Rx8muoqsikf6KwEk5ZWvV6uw=;
  b=coy4mgFbhFJgdEHsAqOT08zJG1KcdxSOySAeIJihkehmC9lhDSlw1gkg
   Iqu9qnbtJl0kv6GLhyC9yKxEbfqNTf+NU0CEyesFs5eKQ2GWKJYEWBZ7E
   7VigHGfIfMzn4ebQF4Am94nuMQlDLA2avehGKNH+L3Qbtj3B+3CPyhb20
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SCiWo8t/ytyRlV1dW+4fmP8RumclkLCOZZ1g09tLbYuan3SHv0DkZGhXJTQJHTN1LGsjzvliNb
 HU9dChkh00egfuyMf8gRSyuBvJ+Gi2TmSg+PgkP0i0Ynb85IG2X6LerrvgCppur19bP7ZHm8pY
 n7u8EP6evkDc+PO+8CyMMDXlc9uia8VUPdOAPZD7iodvptPP7nJ87HDsuvEmReYDnxrcGh2752
 HLwZXtRfNnQnHgv38ghYqlVdF66NZeoyvRa9QEXEU45v+qI6ESOUoyPtDRI9nz1OVxTHsHH6Gn
 /QM=
X-SBRS: 5.1
X-MesageID: 45461785
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0Eh5JK8nnMrq/bjv7eBuk+E1db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc29qADnhOBICO4qTMiftWjdyReVxeRZjLcKrAeQYBEWmtQts5
 uINpIOdeEYbmIK//oSgjPIa+rIqePvmMvD6Ja8vhUdOT2CKZsQiDuRYjzrYXGeLzM2fKbReq
 Dsg/av6wDQA0j+Oa+Adwk4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DaytvQSA5y4aoOnZt7ShEJnAjtboid0E7hdkAoql/lp
 P525tT5fhzp+8tHO9A7bQ6MIeK4lKke2OFDIvEGyWXKEhAAQOXl6LK
X-IronPort-AV: E=Sophos;i="5.83,260,1616472000"; 
   d="scan'208";a="45461785"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3pm6iPt89FWVqiFWDqIrbJx9ge3AtMUAuiVPjSzyE1DoBLMx8lVAerzQ682UiIcCye/Nu+MeI3DvmgshhFLMGf14fs/zStXEZun1gJ8ShQOrIV/tCPBYxlagYYDIgzWPkfy8CydnPbRD09TIYWq7FMi8ko72aJ8oUmnDpsMEp+r39tzJk05NEY4n9H5PiYHiZtY0muoXlMWimZMX5h4YrDzoCk+Ydubn1MYBzchmGMEnx5KjMeO+A4yzQ3k46qVH6t8PcMqE1AUKZ0EZw/JsIq7Ao5XUW2V4FcwXEN7dTUbsIAlqRgzsby8xzrDl1RLzyYOa1QDImTralEFnP9mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BihrOTn/kOw2O9WjKKPzFDYRCQIKsFGXWwK8nP4X7w=;
 b=QUXnQQOaQBgtq1wn3x+sAJzZC+FcM98nKJoEWKMa2Ai3wAy0pLk6n//VIMhy6D94Fvq/ndrAAGO7IqBY+T1bejEJrVSQ2viD+xmQBm1VpsX6BBnkDewF29MK7tEBMJtG4LKVRjnPsgWmoPtHDM8AJKNPq+rG9gKp/oCZENTjoasSclvHKSrXEBa4S5V9Pfm5IJmKPnMdQz4PvjDNwxRkDwWWCtGen5W/6F8H1iNz/k//4/5tzH2DPp8enb4GOEMSi74oECjwJKwPiRINRlf68yma185i5Phlkin+RacjUqQmuk245wiwd8P4dtOSrFpyHPNoLiGBh3pcyYLa00IZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BihrOTn/kOw2O9WjKKPzFDYRCQIKsFGXWwK8nP4X7w=;
 b=QZQftUO7EgYMkS0z9pUAOxHUKQtKHNi8cOb2a9joMpwd8n/nZPOxMYQmsnajI1M57PWbZBpur7OCp/o7BY6q5pbg69F0bGm7zvvi1/U0kySi0EX0FjOfD8QSRop5LheXxd3up1dpwdPVkUgGO2kSkSY3LZu/K2BmbFtg71AZVxc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <1bb49cce-537e-9fba-80bb-82bf502728d0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/9] AMD/IOMMU: redo awaiting of command completion
Message-ID: <1fcb1140-b9b4-5c0b-de6c-e14d33937318@citrix.com>
Date: Wed, 9 Jun 2021 11:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1bb49cce-537e-9fba-80bb-82bf502728d0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0155.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0b745c5-fe1c-4e47-dfc4-08d92b32713f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4871:
X-Microsoft-Antispam-PRVS: <BYAPR03MB487166F426E76DE378DEDCBEBA369@BYAPR03MB4871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Os2JYM4A0/SoQh9dJ/XeptQBYwRbuw47Mhq3vOGZoCasOcywyQtFCZYBPq39Aj18JHrLopv2Lh/pqKiDGN+byiXeGjReXDTNyoN5FZkIYkzhmEh6oSp8Nnd/rRc0y8iRHwcpLxSSYNbeVi/iayDd5IWHo4rezvsS5wuZxF3oB6m/BKu9BGtapTBUnn/tSXN+IJJxbJKAIlGMHC3TM7dOGunkpigbGEzdmqyGVB//8EjDTKskvoXq/bbcaEb7tDhEjBOTjzmjPPtQCuLt122xa1t8DPOghzsSxB9XrBA3fCK4KcGApWrpkDbJfNr0Y4s3G4Tfn9D0Tu1+1v0x59Fl//+u09fbTmDm9unLzwsOYkzMETl0yI2K9NdFvxReQmRSRnuB7yIXxGg4qomUsq+Ppml5lOheicH+2LWSkJQCTMe5RCpSImen441zd1n6zUTCq2hLaP4N4Vw0RyoYM3qx95lndaZw1Ake1nJJtn2kPefLie7iWgPPIVe9h7tFsrJwfD8s6/4GRTvlHkgjdQuUxqHRXc8tQagUnr5NCUi31posdO3bcTVEHmyVYfBBcr2tybVPSAhOWe3RVT0xnb5DSDqD/t5Dyzjq6Iz6Xzmsr0iMv7cWrhXQos0KfPX4+3QCQK4+zWtMU9KLarIHQQdcrmhDjbBgHg+c4dGG/QqQiPhvcuI7pzqban9Nej+GmFNC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(38100700002)(8936002)(8676002)(2906002)(66556008)(66946007)(66476007)(6486002)(16526019)(186003)(31696002)(26005)(956004)(4326008)(2616005)(86362001)(53546011)(16576012)(316002)(110136005)(31686004)(36756003)(5660300002)(6666004)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djMwTE5YQ2pKdVp3UVB0Y0ZldzRGd2RjMk52Y1R2cXpDZGsvcXE4SHVaUVZL?=
 =?utf-8?B?QVlURlJ4VEtacmVsRFNSTGF1ZElsd24xQnNrbm1tN2NXaTdidUdEczRKanBR?=
 =?utf-8?B?SjU5dkJlNlpoYkljVWRWQ1JqbzNaYnU0d3hDYStJQmVxdS8yV0dGOWR4YkRw?=
 =?utf-8?B?bERIUmNSRUJTVHpnNnVIRHd5UExJYmV5U1dZbkJRUEJKaDU4anUyN2M3aXlH?=
 =?utf-8?B?NSt5VkxJL2o4NDQrbkZrY1o1TEFHaHhqUnBDalNSRHRWZU1qSzVpRmdmemtk?=
 =?utf-8?B?NkxCMkFKVkZUbmlwb0hZd0hwMXc1d21CYkk1K1V2ZGJwZmxrY0J4MVNjdGVV?=
 =?utf-8?B?cEhySjVWWWFWbC8xdlRnSzhtTyt5SzRDc05mMENDNFIrdWVnTkNaOTcxelBj?=
 =?utf-8?B?MTRsL0QvOVBNVEMwd3Y0VS9xa2sxNnA1Q3NwYitlcUVPQlMwUkRJT1FUVEJL?=
 =?utf-8?B?RjdLSUFGdktVcEZ4K0p5SVc0Q2tQTlFSRXI2SEpORUduTVBpU3lDTEVUUXpK?=
 =?utf-8?B?SHIxT25ZcndwL1NrT0JSMlp0VjE0ayt0OCtiakJRbVdNZlpsNEJWUUxOc2dz?=
 =?utf-8?B?UEVjdTZ0KzNpVkZzQmM1YjhlNXhwRWNXYlczOVRVemN1YjZzZDVpdUdEWWRJ?=
 =?utf-8?B?OHN1Qm5nLy9TcTVHVXBua0QrNDlMN21uTWtwcXdEZmx3RVZwUXVpbzFyRkx2?=
 =?utf-8?B?QXU5V3JaUkpZZUpMTlVFU2JYRHlnUEZadFlreDgxT2R2d3p6TFFPaEY3em45?=
 =?utf-8?B?eWZGSktWbzRmNnp2bHFEVHhveUNFRmZGLzBHT0xZOVlRVy9PbjZKZHdMcXhl?=
 =?utf-8?B?MzkwVTRkRmlHVWEzT1hlTkxXL1RJbExwZmdJK0dSYktXNG5iS2c2NmpRMmpu?=
 =?utf-8?B?VWUxZVdsRGhaNm45WTlTNE9FZWc0aGNUNDJvMWJyOFc4dWthWWhDUkNLTlBt?=
 =?utf-8?B?bWdBZFFPR24rM3l3WSt2TXlJVVdoV3grUTRjeHdFUjFTVTVmVmZ4bTdVV0Y2?=
 =?utf-8?B?b3lkNVJ2TU15YVpWQ0lmSXVadmF5dGJKR0VnYStlUWpGL2VXcExmUDdkVU9k?=
 =?utf-8?B?aEVITml5RUpoV1pTWUxBek9kTFhkUkFIUXpZeGk5T0J0aWxaenQ0OW1rZC95?=
 =?utf-8?B?VlBob3Yxb1dkcXV6NHR3RjlWOWxjMDlia3krN2dNcUdyWGY2cVZsWk1SQS9p?=
 =?utf-8?B?VUVDQ1NNL2tRaGdlNytNTFBmNTRPRjJaRE44U1EvN1Zpa2tiYmFlL1V6cHNz?=
 =?utf-8?B?b2V1ZkxYa0Z2Tm5UT0w4RjM5SGZ4bEE1TEJLNE1LdWZ1eGhDWSsrcDlzNk1Y?=
 =?utf-8?B?NHRRcUNoUTl2S290Z0tXeDhSclEvb2VwbGtzYU5FYlpMNVFiVmxXR2pZZEY5?=
 =?utf-8?B?VU5TZVpBd0gzN1EvTVdCenZHdW5Camx4RkpRU1YyOVp4TlRQSS9YWW5Td0hs?=
 =?utf-8?B?WVRTQVNhQkxBL2F3TlIrMXpmWmw2MmNWNFZTeW5OcnRpOEhWalJPdHlTN25U?=
 =?utf-8?B?TEZ5QW5oVzdlWGZEUG5QZ2x6OW9mRmdrRVZhckZVTDg4VjNUbzZmL0xnZUhn?=
 =?utf-8?B?dEZKVXZxbU1ub1lxY1lvOStWZWttSzViOVNITXdha29hUEE5cVVCaFY5MTFD?=
 =?utf-8?B?UnJ6UlhiT0Ezekk0blNLWmVBaWtiWnFnY1VqbkVoN3hISEg4YWFwZld4MWhH?=
 =?utf-8?B?U1QrZ1Z1WU5ibkpnb3d0SXJyMkdYdXhxWnZ0WktQbGxRVStaUGMvN3BrQjJh?=
 =?utf-8?Q?LDPRaXpr7RPbgofW5pod7z5i4ueLDXc7B6atJzd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b745c5-fe1c-4e47-dfc4-08d92b32713f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 10:36:30.1314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+UWWrlZs3d6d6kONc7FaWLihFL4QB2a4Pyj4HwTC1FBT5DxrB9TQI5ws9CU6pwJTBhblvEJh+B+Uc+utd/CsE0xb2vr+xDQGJky36ZQ/rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
X-OriginatorOrg: citrix.com

On 09/06/2021 10:26, Jan Beulich wrote:
> The present abuse of the completion interrupt does not only stand in the
> way of, down the road, using it for its actual purpose, but also
> requires holding the IOMMU lock while waiting for command completion,
> limiting parallelism and keeping interrupts off for non-negligible
> periods of time. Have the IOMMU do an ordinary memory write instead of
> signaling an otherwise disabled interrupt (by just updating a status
> register bit).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

While I agree with the direction of the patch, some of the details could
do with improvement.

>
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -20,6 +20,9 @@
>  #include "iommu.h"
>  #include "../ats.h"
> =20
> +#define CMD_COMPLETION_INIT 0
> +#define CMD_COMPLETION_DONE 1
> +
>  static void send_iommu_command(struct amd_iommu *iommu,
>                                 const uint32_t cmd[4])
>  {
> @@ -49,28 +52,31 @@ static void send_iommu_command(struct am
>  static void flush_command_buffer(struct amd_iommu *iommu,
>                                   unsigned int timeout_base)
>  {
> +    static DEFINE_PER_CPU(uint64_t, poll_slot);
> +    uint64_t *this_poll_slot =3D &this_cpu(poll_slot);
> +    paddr_t addr =3D virt_to_maddr(this_poll_slot);
>      uint32_t cmd[4];
>      s_time_t start, timeout;
>      static unsigned int __read_mostly threshold =3D 1;
> =20
> -    /* RW1C 'ComWaitInt' in status register */
> -    writel(IOMMU_STATUS_COMP_WAIT_INT,
> -           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
> -
> -    /* send an empty COMPLETION_WAIT command to flush command buffer */
> -    cmd[3] =3D cmd[2] =3D 0;
> -    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
> +    ACCESS_ONCE(*this_poll_slot) =3D CMD_COMPLETION_INIT;
> +
> +    /* send a COMPLETION_WAIT command to flush command buffer */
> +    cmd[0] =3D addr;
> +    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, cmd[0],
> +                         IOMMU_COMP_WAIT_S_FLAG_MASK,
> +                         IOMMU_COMP_WAIT_S_FLAG_SHIFT, &cmd[0]);

set_field_in_reg_u32() is a disaster of a function - both in terms of
semantics, and code gen - and needs to be purged from the code.

It is a shame we don't have a real struct for objects in the command
buffer, but in lieu of that, this is just

=C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;

which is the direction that previous cleanup has gone.

There are no current users of IOMMU_COMP_WAIT_S_FLAG_SHIFT, and ...

> +    cmd[1] =3D addr >> 32;
> +    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, cmd[1],
>                           IOMMU_CMD_OPCODE_MASK,
>                           IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
> -    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
> -                         IOMMU_COMP_WAIT_I_FLAG_MASK,
> -                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);

... this drops the final use of IOMMU_COMP_WAIT_I_FLAG_SHIFT, so both
should be dropped.

As for IOMMU_CMD_OPCODE_SHIFT, that can't be dropped yet, but it would
still be better to use

=C2=A0=C2=A0=C2=A0 cmd[1] =3D (addr >> 32) | MASK_INSR(IOMMU_CMD_COMPLETION=
_WAIT,
IOMMU_CMD_COMPLETION_WAIT);

in the short term.

~Andrew

P.S. an observation of cmd[1] means that AMD IOMMUs don't actually work
for a physaddr width of >52, despite some support along these lines
elsewhere in the spec.


