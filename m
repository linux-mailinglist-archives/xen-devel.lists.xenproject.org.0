Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD1C2AF400
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24953.52465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrMQ-0003gM-52; Wed, 11 Nov 2020 14:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24953.52465; Wed, 11 Nov 2020 14:44:34 +0000
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
	id 1kcrMQ-0003fz-1u; Wed, 11 Nov 2020 14:44:34 +0000
Received: by outflank-mailman (input) for mailman id 24953;
 Wed, 11 Nov 2020 14:44:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcrMO-0003fp-2u
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:44:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d9f2595-7548-459f-a994-9696dac03b6d;
 Wed, 11 Nov 2020 14:44:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcrMO-0003fp-2u
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:44:32 +0000
X-Inumbo-ID: 0d9f2595-7548-459f-a994-9696dac03b6d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0d9f2595-7548-459f-a994-9696dac03b6d;
	Wed, 11 Nov 2020 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605105871;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eFY5+F/7N20RmK3+pOEUrqAFyG5ehkW1hcSCG++Ekr4=;
  b=ei9a/jWevsbTwxDv9UrhGilm9X5gqVPUCSuBYr/EZbwj8dt9XsPEBXaZ
   axugeQpKGwKIG4gigSxlI1dCsOUseTs0CNxg1j8rXfPppoBuf44dnvsYB
   Z+2zXyNpkwRh9qHbeePU1y9VNN/veyF0g6nNnO3GrctSqf53dWhBu5k8j
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K2TBFFo/OQqKXBj4EfP4tiJj6nMW5SIEDA3FN5dAknz9A1T6kRvEL4qWlERx41C//F9cW/dKf/
 qmdv9amc0Zpo0w0EU0jJWRSs0onhjhlykjqNZ7PSrRF/NdtA15PEuQf4BJJ3tYe0lp+ifD8mMW
 9gqiD2/jxISxN7gvbLWnHJgT0Qi9dEjUmpO7A9iFIAJSeXbNuq3XWNDCky56Fo547z1TMOcVZo
 Fe+swKCXziPhR+6TYxqdbmDf92gzby+BlvP6boNfNrLWFdeE4yCFdsRlqoYL+UDoWjq/TUaIa2
 +zc=
X-SBRS: None
X-MesageID: 30925166
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30925166"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1CQoCWuba7yxKQFkxA0VnrPbGJ7DdDhvou47i1Brinml51I+zhb3kUTWXqZwP3yiY+z5xbWcCIA8HXOEOooMLjD0VhniSAtb9MTJ75gjGjvlAoW4ztF0+7LxOhePpAdUWq2b2x6pkN0hhF51WLaFprTVqySDadGOYYD/P/hohX41TULbUJC529l0rc40M7P5IOSQneXHcLMUacZNfrcQAIfijDIrFSfDzksBChMBEVYzXJa+Z0OoS0g5AZPa6TeYxb8TQSocpMes7/lpby+ZkPd+sixJz4G3Hl5SN5qzs0YCOQZ0owqS1onR6RWcKXEumdBVHwcpu1r1ddw+mtDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qre77Y/POXr/+bLKSBeDaxaJFslTGf37Y4ufQovFKxA=;
 b=HqTxC+rZkeXzD+amTZDTYxw9c8P6MMMaCqcTRE5TtBM0xCY2xpc+GUUnoWXTOLYvERozrRsPYNla2JQT1DX0xVCvPOCio0k9WJXobWO8hqpmhXp+qzkfk3dl5gTJ2+7kTGVZ1eZcN5aCh39hIwytGaXsLd22EB9iRQvxrRq3oMdFS49jV8DrsmgYQd1lW9AVqpP1ASV5bdSp5GF7K4CeOSg+TJmICWngl8eA1L+A3jvTcBpI/CI+VJ5CMOS5SqTC8Lsc5t9Sv5D+OWGQEurJfUdBLML9jPrCbQz684iYZhifxQvD3NBkVkQxnHN3MUR4rOVV8v/gqC4T05D1rAkmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qre77Y/POXr/+bLKSBeDaxaJFslTGf37Y4ufQovFKxA=;
 b=W27n8a++NeW4Ohug2ssmNtVvtv2nJiEwFk5aU8ir9tmdAKvS+3kTwKYNTcEIiIRhnlBcsEKBct00XDXmmqLvwYJHyImT3uDKETr6QINPbxkynIlxfVFIlnUxnCag0j61oOruDWtZNcY+xB+l5dy0DuEz6j3if0yhdysilMfWdJw=
Date: Wed, 11 Nov 2020 15:44:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 04/10] [WORKAROUND] xen/arm: Update hwdom's p2m to trap
 ECAM space
Message-ID: <20201111144422.z2hi3ineg6qwbxi4@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-5-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-5-andr2000@gmail.com>
X-ClientProxiedBy: LO2P265CA0465.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f78b034-64e9-4a16-125a-08d886504a49
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-Microsoft-Antispam-PRVS: <DS7PR03MB55422D3BFE209EFEC63F93108FE80@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECBFxeuuP4qBcDV7UQOtDAEeth3GLxxh8fZfK5U1fe9/Z6g86ljXHO558vxhQ6l09VSkobo3/Dhf5Xa965OuYF4bGeHvf5az2m7OD8w0r7sScp9u9Ce2qOnd649ywfEiKmOJJ/kEXIIiEiG/IrZXN3mTqEw/ve6hKSrntiJyV0fYkhr+bR5+I0c9MbfoMVnNTL+P18ONuAyOlRftUH3U2gB1hyZoEw06NSB4kiNN4rIbbwr5Xumzvp2DLzzMxT+OdKbj3N9tRP9jJoKd3T3W3I9vEhA7HM2y56yPOf8uAVd2ENpiMBpDDdizTh4Q0WRz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(33716001)(26005)(9686003)(186003)(66946007)(66476007)(956004)(8676002)(316002)(16526019)(6916009)(8936002)(4326008)(2906002)(86362001)(7416002)(66556008)(6496006)(6486002)(6666004)(4744005)(478600001)(85182001)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: swmHlA/vMTIFLz4qJq+nJ+VxyptKmT7bxYV4UR+f41U5/UrHmROOH7oQn2twFIADTLeka98Y5BSGInBubf5pSiobg97zG8HHid92kph+ROSDO6B3tpW7Ap80V1ASCOVbQ0/RAFuhmBCfuDmUQ2L/VOYenBuNwFAEaboApTw4MnhBSgIorh6QlU7ReAwJHCaub0KRS8os/rlptuox/KyEWqTmu7ygq/ms1bOuUKQ2LPn25n9VuQWeXskismN+fs+emWbeZVZR4SGhLX8jqhOI9oPxAa73tmrDZslsKdpLDPAhndjEHMRO71ts3z7PBdbe7UDx+qqTrBwx59Q9imFLCAIPuUuRMK2cr9HTZDgtXqWGZCRfTtG/RVe3SEu/vAePUEfuKy0Qv8JBn32RBaScaxZ2jly56ZShQzaDhUF4MkHPBRNTIcxo0dz0ArlLKPf8GIQuDtEcjqZlznn8KjurDwxi42lIBshG8eITREnL1itL3n5Tm1mzV6NM0QLv7HOVuKLc+E2FHc1rXnGL0jV97TzSRLYt+faI4SMdPeYhxqHlw5aNcGlwPWFJrcy273EegtrMMp4RJV/aGOb/SgafssyIV8IBO6HIgOYKLg5Z0JC3SfxPtUZS8hQKK6IXDY6ENYNkvHIJ0DxHx5RV0hylFKICMnQmJy+hNBAhPBV6KH2opfN0di8yxoe4Kfw3P13bRa0JsxDmGbbAL/vDfltYRcYZ+VH60/YUth4XiNKA8bcX/TeN5sDiFA6F/o5pcidXyvmH9Pogg2WWb1oLibxyC4E/NEoI35jwL/j2o6FzNcIHN2PsylFE3L/DLDEbN7c0IHvxjrneStvqs+ZiW/4XIhjK6/JEoXlX8R84WFl8d8nA/hRWwMIawCOk2Pry0PVGDc2Q+GwlMqufvQabf6yThA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f78b034-64e9-4a16-125a-08d886504a49
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 14:44:27.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDZUiaL/s/leiSApQTQGiwQBXegh5yq9smIN9yIrOgD+ST4PkO/OKU6F5qXnupQ5YTEdbfxcDyJnB6mBL5080Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:25PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Host bridge controller's ECAM space is mapped into Domain-0's p2m,
> thus it is not possible to trap the same for vPCI via MMIO handlers.
> For this to work we need to unmap those mappings in p2m.
> 
> TODO (Julien): It would be best if we avoid the map/unmap operation.
> So, maybe we want to introduce another way to avoid the mapping.
> Maybe by changing the type of the controller to "PCI_HOSTCONTROLLER"
> and checking if this is a PCI hostcontroller avoid the mapping.

I know very little about Arm to be able to provide meaningful comments
here. I agree that creating the maps just to remove them afterwards is
not the right approach, we should instead avoid those mappings from
being created in the first place.

Roger.

