Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0042C0DC
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208442.364566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madsA-0000V3-D0; Wed, 13 Oct 2021 13:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208442.364566; Wed, 13 Oct 2021 13:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madsA-0000Sj-9Z; Wed, 13 Oct 2021 13:00:42 +0000
Received: by outflank-mailman (input) for mailman id 208442;
 Wed, 13 Oct 2021 13:00:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mads9-0000Sb-5O
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:00:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfc8b3e0-f958-4c2f-b927-e5914da911e6;
 Wed, 13 Oct 2021 13:00:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-N1_L9VSXP3i7-xaJRHG7wg-1; Wed, 13 Oct 2021 15:00:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 13:00:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 13:00:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0020.eurprd05.prod.outlook.com (2603:10a6:203:91::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 13:00:33 +0000
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
X-Inumbo-ID: cfc8b3e0-f958-4c2f-b927-e5914da911e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634130038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VyVluTRqKT14ELS2y4ZMpGkwITEoVGr2e9Bb4p9iX8=;
	b=f0/YYjrwINCdx7NWuurRA0AtUA6hOGpcAFSCv8vPyXbgdJjHis1K0JMIGJxQytvyd77fcd
	bU3DzpCqH1g+OysCiJhoYNTCY8UCnQHMTkycgDqxS3ZeW1z8gESCgLf3gNi8o9VykORYyI
	s7WqIZV23bKmUl/dJORB1PTzIbXSRCo=
X-MC-Unique: N1_L9VSXP3i7-xaJRHG7wg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEYPlEgi/NSuOpQZmKTeCOkwt6oaeVobp+JO1RdvePbIQ0+CK8ddEEY+IaCPXiy38ocfbrXYrPJ5FXWqtfKvPwjhigjnbGsvWaGb6oLtB7n4NhWIeUiGkVseuKgTzBSzZjo4ha4F+knixltFs2B6tI/es9EgSRk4Ump8RHHM2KHzUq1hAOE4ar3z+gwNlzw1mIV9koFFBxO4D3/cq31+DtwxuGv9b7fCcPyInlFjxP7QvWJWMGCGh5en1RU9UNT+aldoAqYpuCmqb7pBqY9zj8WsJlFdO9mJR+1iNzmMG7fdnzTocCLLnWKvkCDyLIHocNKBGYfsk72onczYetMBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8EvZXJdYVCFlihcUAfhn7/osXbmXyMtmYK83JD1Gm4=;
 b=QhrmVhgWFl90ouN/Xc6bZH089zkilAU7C4KTMC6MCLfo7FNGgbJpW+ZXEryLsr0SOfH+nEgeBALaLa20o6302WGRtv+290OGmi1YdV+uGFTWilsAs2AK50EFwDEEkgeLaqMaz5DNPdYbvBKJsOfbxXmu1LjtSCJJKgyv9ZgYGHKJzXURcI3muRuyXxLm1qxJ6dCqlYPTPU557pQlfuZGodCXwHWsw2wYqr+DDB/6PqD9hugCuV8lHdPo96AilKxBlt1jgXj+Rw9ZDZq0l+Mxdl/1c6b67jVXMzcEFs77CuvhB7tBCg8mAD+rf9uegz27e86BBg/G0kAKAVv0U1tvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
CC: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
Date: Wed, 13 Oct 2021 15:00:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0502CA0020.eurprd05.prod.outlook.com
 (2603:10a6:203:91::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85de10c3-ea5e-4515-59d8-08d98e49718e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB28299DC54FDEB3EA99CE1C88B3B79@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NkU2xCyC56dTuqEoHKKw7AG9NSBBR4ewPpAmMy5AJo71aZvDViJzXNCTKMrAHr45ZpJwgPshWyWBYS9NaG1WVMf75GI8PjHymX2eMhn2jOAt7FaEi24WMcOi/oxti9EyNrPkMx0VEBb/a7za5dq1gZnd1nf3dvgJi3R5fcvEfctZKdRQ/pxHb8HuCU3cpEpQULkHTVTZN1txu6xfGajgDELnXEB0y2spQmI47i34E4cWJTslkHqqCtmc1SDjUUk/ypf/LVQ9raHVxpRqQJJRtrXt2rSy3bqbifHWyOS8f73iToBOoe+YFe6qiwEvI9x8RWrTm/3GJULbHISbkXzkpI2YMmUzqMQ+9HboqzVg4uDr+fQ0gIwm3Rz/YaMcmUxtiMSNtQ1ZTpqkCf5TD8clO9wD6m0DWB31x1nr9F+xK4PKp2j/l+bdrf4mLywxMMKcenHIT1dxYQNWplcx3YkTbS2ZWlnCTxDtfki3MEcLC4TKfrzEd0SVUYOsRNviVAdI5bhWnXW76K3OI7mNBXFToO2l3EN7ML8csoCNhKam5PqHl9zp78UQQ5PTfI5Itt2uaHOAImErAhopQju0ClkDyL2wdoKy3I/8/LHr/v+0eLFMcb6/G+8OJHqvhzHnDY3scy8WcXS9GYYU8nIdlbDP+fz/wRGENzvr3Gqj+aWocmfwkD2JLDtpmuaYHFRheUFhKzkQlnDYP84lLF+QwzOmA5krxdo+Xq5m/iZkHrgMgPVOBdFSrHXoJVCyWD1aGkEd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(110136005)(8676002)(16576012)(7416002)(4326008)(54906003)(66476007)(5660300002)(316002)(2616005)(31686004)(2906002)(6486002)(66556008)(66946007)(956004)(26005)(8936002)(508600001)(83380400001)(186003)(53546011)(31696002)(38100700002)(86362001)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOnSReIFiXGdQ8z22Pec6qAKbGCJER7Ca5gW74BG3Hj9/n5MHhexWxNOYmd5?=
 =?us-ascii?Q?XGl/zBFLSVDtxFZ+7X0zW/nOESCBZdsHgoKurFIuDeifl8rK9jIav5GDFCWY?=
 =?us-ascii?Q?2b97Hii497QPmpvLm/uPfw2DxNetn3MWu4QroxdySWjuVvVL5G9to533grSy?=
 =?us-ascii?Q?OkVLHd/yBjYk8pQ6N/jSD+AgNd5Cb8synO8Ud6OLzYrIXYHWqiDupQrn8Vl9?=
 =?us-ascii?Q?e7k47bQn5uiBWKlvCcCQidCqXDRXiJPYXLqRSN2ej0ubbgZs9bJHqkq/YbSY?=
 =?us-ascii?Q?U5vZApYtmCJlsmumNt2zZ3gvkBQrn6RXywYgMieFygZxNvOWzWuXkgq5K8Yz?=
 =?us-ascii?Q?obcBQFlmH/NF255jY0yHLk0yKPJm3+3UBFMWLG2my6FSPUHmVGhAK6Td4ob/?=
 =?us-ascii?Q?kcKaw089PzU95UiEPJjUG3nTonOdNLRyk3JVvL4nhwhBsfNT5yTsyFhADcYF?=
 =?us-ascii?Q?/uvSVQ+UDCPMnmGnzr6UFYWJKMQGQijvYIx+/RzeUTp3QdmozOLibhGhqNH8?=
 =?us-ascii?Q?VVjtTBIbTNzKFvh9BoR7pxujDANIwmrWVJJ2EEQgxSEEygccQAngbtYXU8Ta?=
 =?us-ascii?Q?1sSlwx0gSORq003K/emUDBICVjspN5NQ/7dcZ2JtGPtE1/qiJfopPVpTVOQA?=
 =?us-ascii?Q?qZ3EdEaH8+WU/8imHuciHQ9LsbfQtx5yDenm1Vd9At4wiuFxOcab5tOetVnA?=
 =?us-ascii?Q?YHlILg3BpOevKJfmFBZTXcohZRTNgLWk3d3s2mZ9vib6FIgyErjmHGa8a9gS?=
 =?us-ascii?Q?rsurQHHzap8uHJR04Yl0wAgQ8jGNb4mt5ZvISLvedM682BJmPkDZhlqfR9AQ?=
 =?us-ascii?Q?3V7Qp1jCL5O8X0kVuusA8e5stU2Hy/CqeAwtGLsqyHb4yhnjKav6VD/yOf4T?=
 =?us-ascii?Q?kx2Exe1ohJusP9A3zhfow8K/LiYt3UIJdaoesecFqzE/FTJIx7I8oXjt/x1s?=
 =?us-ascii?Q?H33Urnv7QDL1YM9WItYE9aLeuS2qKQ30/AJz3bV6NXR2ECg+OJFTsUQ8oJ2W?=
 =?us-ascii?Q?2RUXXxBBuv48lmT9W4eYnGP0I+2J0a5ZvKvZtzDBZah3gDYW4Fxuj4Utp22W?=
 =?us-ascii?Q?QGdiZGG/6M+pk67W5NbicO8aHmzffj4b7qYXs+iUHCex44LXgPQH/e8O/Ix7?=
 =?us-ascii?Q?DdALaQjHekJD+WpkjzQA/Y667QRuWn59iwHXUavJK1hWM8Emg4A4CDMoJvpr?=
 =?us-ascii?Q?O04Ahp3YzVz201UaVbR1HfeLwFoM3wAK7NUpDIQI9oMiBhPwgjZXxKBBJLHr?=
 =?us-ascii?Q?+OWukg9z5mvZ/rq+Keex9Xk4gtaKv6+dVsWtPH+kgB9Lq0+Vfj67MqwvIVGv?=
 =?us-ascii?Q?nqybS3TQxRMnhbUX2tXbku/L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85de10c3-ea5e-4515-59d8-08d98e49718e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 13:00:33.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCYH/NoONCCTGSst4eqkUBRBuHgAj0szLOTwTpIyNj51HmsKKaw4hl78jF+mUap+iEgWbkhAUe2F/50i9wgaeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 13.10.2021 10:45, Roger Pau Monn=C3=A9 wrote:
> On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
>> The existing VPCI support available for X86 is adapted for Arm.
>> When the device is added to XEN via the hyper call
>> =E2=80=9CPHYSDEVOP_pci_device_add=E2=80=9D, VPCI handler for the config =
space
>> access is added to the Xen to emulate the PCI devices config space.
>>
>> A MMIO trap handler for the PCI ECAM space is registered in XEN
>> so that when guest is trying to access the PCI config space,XEN
>> will trap the access and emulate read/write using the VPCI and
>> not the real PCI hardware.
>>
>> For Dom0less systems scan_pci_devices() would be used to discover the
>> PCI device in XEN and VPCI handler will be added during XEN boots.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> Change in v5:
>> - Add pci_cleanup_msi(pdev) in cleanup part.
>> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> Change in v4:
>> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
>> Change in v3:
>> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled v=
ariable
>> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
>> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
>> Change in v2:
>> - Add new XEN_DOMCTL_CDF_vpci flag
>> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
>> - enable vpci support when pci-passthough option is enabled.
>> ---
>> ---
>>  xen/arch/arm/Makefile         |   1 +
>>  xen/arch/arm/domain.c         |   4 ++
>>  xen/arch/arm/domain_build.c   |   3 +
>>  xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
>>  xen/arch/arm/vpci.h           |  36 ++++++++++++
>>  xen/drivers/passthrough/pci.c |  18 ++++++
>>  xen/include/asm-arm/domain.h  |   7 ++-
>>  xen/include/asm-x86/pci.h     |   2 -
>>  xen/include/public/arch-arm.h |   7 +++
>>  xen/include/xen/pci.h         |   2 +
>>  10 files changed, 179 insertions(+), 3 deletions(-)
>>  create mode 100644 xen/arch/arm/vpci.c
>>  create mode 100644 xen/arch/arm/vpci.h
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 44d7cc81fa..fb9c976ea2 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>>  obj-y +=3D platforms/
>>  endif
>>  obj-$(CONFIG_TEE) +=3D tee/
>> +obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
>> =20
>>  obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
>>  obj-y +=3D bootfdt.init.o
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 36138c1b2e..fbb52f78f1 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -39,6 +39,7 @@
>>  #include <asm/vgic.h>
>>  #include <asm/vtimer.h>
>> =20
>> +#include "vpci.h"
>>  #include "vuart.h"
>> =20
>>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
>>      if ( is_hardware_domain(d) && (rc =3D domain_vuart_init(d)) )
>>          goto fail;
>> =20
>> +    if ( (rc =3D domain_vpci_init(d)) !=3D 0 )
>> +        goto fail;
>> +
>>      return 0;
>> =20
>>  fail:
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index c5afbe2e05..f4c89bde8c 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3053,6 +3053,9 @@ void __init create_dom0(void)
>>      if ( iommu_enabled )
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> =20
>> +    if ( is_pci_passthrough_enabled() )
>> +        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_vpci;
>> +
>>      dom0 =3D domain_create(0, &dom0_cfg, true);
>>      if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>>          panic("Error creating domain 0\n");
>> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
>> new file mode 100644
>> index 0000000000..76c12b9281
>> --- /dev/null
>> +++ b/xen/arch/arm/vpci.c
>> @@ -0,0 +1,102 @@
>> +/*
>> + * xen/arch/arm/vpci.c
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#include <xen/sched.h>
>> +
>> +#include <asm/mmio.h>
>> +
>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>> +
>> +/* Do some sanity checks. */
>> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len=
)
>> +{
>> +    /* Check access size. */
>> +    if ( len > 8 )
>> +        return false;
>> +
>> +    /* Check that access is size aligned. */
>> +    if ( (reg & (len - 1)) )
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                          register_t *r, void *p)
>> +{
>> +    unsigned int reg;
>> +    pci_sbdf_t sbdf;
>> +    unsigned long data =3D ~0UL;
>> +    unsigned int size =3D 1U << info->dabt.size;
>> +
>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>> +    reg =3D REGISTER_OFFSET(info->gpa);
>> +
>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>> +        return 0;
>> +
>> +    data =3D vpci_read(sbdf, reg, min(4u, size));
>> +    if ( size =3D=3D 8 )
>> +        data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>> +
>> +    *r =3D data;
>> +
>> +    return 1;
>> +}
>> +
>> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>> +                           register_t r, void *p)
>> +{
>> +    unsigned int reg;
>> +    pci_sbdf_t sbdf;
>> +    unsigned long data =3D r;
>> +    unsigned int size =3D 1U << info->dabt.size;
>> +
>> +    sbdf.sbdf =3D MMCFG_BDF(info->gpa);
>> +    reg =3D REGISTER_OFFSET(info->gpa);
>> +
>> +    if ( !vpci_mmio_access_allowed(reg, size) )
>> +        return 0;
>> +
>> +    vpci_write(sbdf, reg, min(4u, size), data);
>> +    if ( size =3D=3D 8 )
>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>=20
> I think those two helpers (and vpci_mmio_access_allowed) are very
> similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up to
> the point where I would consider moving the shared code to vpci.c as
> vpci_ecam_{read,write} and call them from the arch specific trap
> handlers.

Except that please can we stick to mcfg or mmcfg instead of ecam
in names, as that's how the thing has been named in Xen from its
introduction? I've just grep-ed the code base (case insensitively)
and found no mention of ECAM. There are only a few "became".

Jan


