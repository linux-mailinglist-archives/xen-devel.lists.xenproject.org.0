Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A382B0256
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 10:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25617.53496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9LB-0000EH-Ag; Thu, 12 Nov 2020 09:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25617.53496; Thu, 12 Nov 2020 09:56:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9LB-0000Ds-6x; Thu, 12 Nov 2020 09:56:29 +0000
Received: by outflank-mailman (input) for mailman id 25617;
 Thu, 12 Nov 2020 09:56:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kd9LA-0000Dn-4y
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:56:28 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b47c2fe-168e-4704-9c96-58e229fd36c7;
 Thu, 12 Nov 2020 09:56:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kd9LA-0000Dn-4y
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 09:56:28 +0000
X-Inumbo-ID: 4b47c2fe-168e-4704-9c96-58e229fd36c7
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4b47c2fe-168e-4704-9c96-58e229fd36c7;
	Thu, 12 Nov 2020 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605174987;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9h1Cl1cVXoMc2ld3LHKNySduraBdzytvkyQuaHVcXF8=;
  b=WfYbAIOa85NUVwYtuelcq+MbuA3sAWMONDgt238dIBcY9jD1f4hqpUKM
   bBtlJwqb0npR/Oe+DACsunKRnk9kLScQaDRzhOI94bQ/mcR+3gz7vBelc
   YtQQe3PHwE0mhGsQlW5/U2Y6GF6UahruyLQ81PUVZZegsTJCz+epRvrv4
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RaPtOVwkKeyTYa5wr5J25htGMhHo/Idt8wlXI+p4QaXQU6GBA3ntfPBbREZXJtBrmaVBZBRcom
 S3v2ub2EePrpno9om4XimarJdb3Ugs8N/3kZ9ELXzFDqmK87ZLuRx3dOSyCQfm0DU8MzcMkbH5
 /yTzV1OsCedPa/cx5tHfp0anqo+zQH7l8oEvZjzPWPa+Yhfw+neMzXQWNs4/9okwzHOQtib11H
 nh/WJocchfESxTjgRlC61idKsTBxZUsqpjIxXKo9n0Z5r49lOTgnVw278xRNy+Z1LtAULZrVal
 A3w=
X-SBRS: None
X-MesageID: 31038479
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,471,1596513600"; 
   d="scan'208";a="31038479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB5RKNQ0enOqdePru07YwSDloss/CHjrWA6segsKgz+r1+vX6lxb4VzzRSwUHAj6gbSpi61ggHn44S57lcbCfbw2vaXmjfmlrDsFs8sRQK2ncExMY1jLmJfVbKtEGf8tDr1RZH0yq8ekFYEk/wjGp4bPdN0RRA/Gt5H/XgsZP3jhv15PlEbzMnGu0Ab8EZD7s40MRhrLIjqsiHYtryvv6YWNIANmFx08FTiCU3M5ufZcydVglUikLaCn1UO5fR3kcnN2CNWJYNXt3OaemQovx2YoAsUWb7W6RBMg1gj0U7Xu4LeMaPTiks2ZyMiNlO3i3Eh4LOKYRdpRlzV26m8FJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKk539bWPITG+QjnyyYY6yUeYdGM4oYsr+WRRW2inFQ=;
 b=D68kNhnfGGrkgFR8znDRuHKJAy0ioIB2jh2NEjcWHnrdh3tQQ67RJT8kPGouEF22WbFEifZyDY1GnD4HS45GUmM53umv6oO9OJAAb9ljSgoeZ2oyzLrzySD6g00/jMz2cK9vUrlVmss6/jbisPbBVJl2R+LYvlD3XIQVJNOg5gYFNuXmiqDw5NQsVr1/L0c3TPdV3mc9F1XSrsAwW2gOmmog7f0LbUSkX9HztIXVy+ZKPMDHvi8T/Xwgl3xromQkAGLjeRJTRBXq0jo5KFfmrnqnX1pGQc9BY/KRQ4Bvz492hjTe6CMjokzel78n1xOqP8ohFHND/woxs/u+iTBnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKk539bWPITG+QjnyyYY6yUeYdGM4oYsr+WRRW2inFQ=;
 b=AIwKG41+RojMgh/nPYCXv4dZ4dDsuJHM7MAzvRulc78lZaju2QFPKtOr6JsizpOKtzLBUlfMeVrHosRDHZdrBVYoObmDAIATBS2NkxWEDCvlSDDoVEUBtH8WoNmwpCfa8Xo4/p7nW1GMuw/8SSbE+Gu8uQfPA1D/icorPJhY1WA=
Date: Thu, 12 Nov 2020 10:56:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
Message-ID: <20201112095616.5ps37pm6p52zsa33@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-9-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-9-andr2000@gmail.com>
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32ee8e36-f035-4920-6c6f-08d886f1353c
X-MS-TrafficTypeDiagnostic: SN6PR03MB4495:
X-Microsoft-Antispam-PRVS: <SN6PR03MB4495F948B7E3E9B56B62CEF08FE70@SN6PR03MB4495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCTEoPbnGjJcJSwPKUgRtDPlADRBnxctAZky6set5bN0e/4FUxTrk3ksfxUirGCRND3sZXU7HgafL6SNDk4zxzzf2Y5ajdwyUafGH2wPqD+uiL1hewJcqJ1WxiPlm1RagTFu5IyZClOmXvc9aalqDAO6WXfyy39K7v+ucmV3aHXbDom3Zir2CDXjZodHveyMrPVljCYc7Ajvf2UbST5MqdpyG6BP91niy3Hr+6kPICOY+4xKegmyq5Q3CRC8N5YA42BNFwHXJzwipERrroUvgdXfUFWSdY1rBQKiMyxSiKM5YTeYGZo8vGN1tXFak6Fv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(66476007)(6916009)(85182001)(9686003)(8676002)(186003)(86362001)(16526019)(478600001)(33716001)(26005)(83380400001)(2906002)(8936002)(7416002)(66556008)(4744005)(5660300002)(66946007)(4326008)(316002)(6666004)(1076003)(6486002)(956004)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: EbhF+lF7D1DgpJ+4O83UM1lf2KeD5W8gcHkv6Qms4zo9FQWVQcqZXQZF76IskMHluya0n72B6Ovrn5t6vos36iqiXHD6THEoEWFiJKsypSs/pedcu5bIzcIcwtdZnvkJd2Foql+EL5CnkMLTxu2TwXVNOYN3GkZo0ja5ZXjCKfP7dlizFTSsDudNx7vkK1ZU+Y+tsJEmVw4F3siQOz/F8VxTebbFKdZiDP339Ilm0VfrWh38SYMmrP1zfoM9QdipAGbzduGuJfVWcdPruYcdJ/c2MsdmV0iOA2PSHm1elpY++PO5I/2XXgvpIWwEO7qL7nEk7sKJ9XN9yb7wy/zJx8+cY01HQ7ACdzGaePSeulwCBGJeu3BOMjpxeoq4omHSoCfqsGq8/aBaSZqlqd8gRvracATuLYJfd/QwXDh1CkteqNhbMFbftTJQZQHcHekvl93KizYS3iub+oxJUMzs01k2rbGFziqu71YEtj92uZmB6bKbJUd+mz4fkFWB8fwNVVnf7hUv3pmksz1Q1gSuZwFtIeJcPRYxTsx2ejwX7V/jVpxUv2h82iL/i4zy6o8GhIDRiGxueq90lT4+9zb2gRCeZImbY1vDAY+ORHhJ415x8DJjjDpIuqEWQPbDwXpc9cqev7+zG+sqlU2zzRKi6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ee8e36-f035-4920-6c6f-08d886f1353c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 09:56:21.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvQ2Q+Y9RuHJQiiYWFQ3BhdrbPkE/e51L5l3x4p2zhaPaLBYTHfG4m2+8zW43JrN32MAe8f6dgJWKrzRQy7NMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4495
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:29PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Non-ECAM host bridges in hwdom go directly to PCI config space,
> not through vpci (they use their specific method for accessing PCI
> configuration, e.g. dedicated registers etc.). Thus hwdom's vpci BARs are
> never updated via vPCI MMIO handlers, so implement a dedicated method
> for a PCI host bridge, so it has a chance to update the initial state of
> the device BARs.
> 
> Note, we rely on the fact that control/hardware domain will not update
> physical BAR locations for the given devices.

This is quite ugly.

I'm looking at the commit that implements the hook for R-Car and I'm
having trouble seeing how that's different from the way we would
normally read the BAR addresses.

I think this should likely be paired with the actual implementation of
a hook, or else it's hard to tell whether it really needed or not.

Thanks, Roger.

