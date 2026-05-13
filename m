Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA1rORMbBGpxEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 08:32:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B4E52E1BA
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 08:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307607.1579209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN38g-0002bN-DO; Wed, 13 May 2026 06:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307607.1579209; Wed, 13 May 2026 06:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN38g-0002Zp-AZ; Wed, 13 May 2026 06:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1307607;
 Wed, 13 May 2026 06:32:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wN38f-0002Zj-0Q
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 06:32:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN38e-00C2pj-9j
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:32:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a041ae7-bab6-0a2a0a5309dd-0a2a4507b346-38
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:32:11 +0200
Received: from [52.101.53.49]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a041aea-229c-0a2a45070019-346535312ba7-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:32:11 +0200
Received: from BLAPR03CA0033.namprd03.prod.outlook.com (2603:10b6:208:32d::8)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 06:32:07 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::6e) by BLAPR03CA0033.outlook.office365.com
 (2603:10b6:208:32d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Wed,
 13 May 2026 06:32:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 06:32:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 01:32:04 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 01:32:03 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vT1+dYOuO4FtmIZ3bnoicz69/al2XIubd+Z20q5Omynl+xUTjaPbpROmQs20D/jHsRCzydRg9AX2rtuM2/IWEfYqSI9+iUnXj02kxwRf6QXQjqBz69snzDU/KZWqsPEnXe/tLYY5JLz+wVVZstXt1vcbYMVCTJVhpfWWUcpeLr1y82RbxEEH6cU+kgqmwel8PiBJNcc/yRJIxZ8ONhcfh6k/yAFnnecnzcE0Cups9CvGNw4Ho9A/Qm1+4j6kvPC5i/RL09NVehnwqlSPCAXTmZWOiNziWcqjstU5YZqntlOesHeQLX6r51er0sTeVg8Mqc60L3odD85LXKRCSSyBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nnedsHeDiEFp1HsXvQiXNMLNfyxh1rOKP1OQLerBsQ=;
 b=BrLH6toO2dCwl8wcMvarSKLHGzWzfpgwPnFy3MJWYZThKMiMkhPIG3uFprRxtsYirgU7hIoH8Q7A8bWGbaj3+tK4vjkTvq74E+V+uPkDp85UNriDx7E/iVkn0qBrh/cUSSMfz21pQQhGcJHu9USimSpnfmi0wNg0dzoJ1i2KQI12Oyd/aHMzADJEugwoKzcqnLO67iCzuy5wWoFZADQ0Xkxnn0v+Uyak9/aCM5/SM5uQzxvGF6POgCx+Wh6sVglD59QaCbAf1D3NDilL7DrqUbSCy0mmmsEaVojUsQxA7Rbior1qIHPqatzn4SHVIQ4iYakr75pnSG2OMNmYpLNrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nnedsHeDiEFp1HsXvQiXNMLNfyxh1rOKP1OQLerBsQ=;
 b=VqenwQ5/ijknhRrkA132fCrLsyUW8I3jMxoGZI0ecKH5YhqMhXqcUOrrUhTxk9CsVRv5nCYFLZkDX8Po4XKojajyUZeXA4DzumLuJtLHpWIXmO8vNfC06zfRk7MPeLufVUB+MeZeCHF+6/GX52Fz4XifmhOoMVgP9HexubA9ZC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <36527d70-da8c-454d-8de4-54c29c3bd565@amd.com>
Date: Wed, 13 May 2026 08:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] CI: Add a Debian 13 (Trixie) arm64 container
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-5-andrew.cooper3@citrix.com>
 <249ca124-b144-4c50-a0fb-3c0e6db5a1ca@amd.com>
 <d1037e15-cde7-40a1-9011-a02c23e870e8@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d1037e15-cde7-40a1-9011-a02c23e870e8@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: cebb09d0-6e21-46e2-f354-08deb0b95ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6UY5hknrLRijp+xBAGcuHv69gXo7Amtum2W1FuuMJtP6eZuLTEoUa5Zk96I7CIN5jCWTRS8mM2F1lKodXoo6ceF0x05T9qCM7+7pypX23m+sE5pTYHUzA8j6fpfKy5FyyOpRAwsXeh/00riPE4WlEfzyjLdRc6OQgYR4tjBUQLPSmKnqpL9MgTeddLWUsXvQteG2M06xR6RLzPu2zTHToATLZUlwq4Q/6HTTnBOciEy+P95Zbl/qnqxw5l76u2DN4XBmxkuDEb1H5Wecw9rXHUe8tXbQ6DkMo7VH91a4rZhqI7oGRW4cjE5BtA4e0C/zDgz3c1aawP7oJ6Ebih9uC0dj5QXHXAio4HReotP1F699F9WRdktO66zAKHuyMyBPXw5S2hBjeyM+T67oRH1MrlBtLG3rAibA/Y6j+hb3VJfalo8tzIOsdWmgSHSlwQy3IoiBJfCbUVCQpsvXRLFsvG0cP7a+gsX0OAuo2Uzf63am4jwFzNFjYGjqa7g5MGduXrvoNPE+4XIT0q53lQgsNqJVXkWQIdMlp51eequgxfQtkw3F6VkzMbO9PDRAkqsBv/yH6Fe7G148Y5VaBhrbx03hcM+UyeqR7EppDvIV9pBIKAJRAGeCRKm89vEsQ6H0Cuq3m61Dnmyy5mpNA3US77aFXidWak+BiGhxmWHXQ2lSr/4KOulzuExSBuwO7zHkgdLuY6ip8Jam4VskUorrU2BhfMO0pvASeiEO0zdKsAg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sGS48mLdiIbO2GCCBzp/YYm2b+t+g973Mt6TIG+Oz+ur5NqN6ONR56aWVy+p5Zr0qjslEXM37DVkNbLr4uX+AWClZ+jrZ9vKnPN7Qgys/4/YFp/s4tIvxzgwkNtcNdgpQxGkQiiIRWotV7LFkwb0I7Our+YRwIUvEQoSTEzf/RzMs0qEVkd7ubEvQ8kx+RZjFPYdQuqAoYaQmm7rS/2fp8FGgBpKCG3wnCvqXegUFh7jH/8ga7d2+s/htoMCumoqiylKbWVsKvdv1XQ8ONSHM4ASCfVQSdAg+uTfYu5tCbPIsznGQNyN2xJqogoHUxUx6q8AOLwfK/+Ej6oAeZvKs1DWmQQkbBJMf6zcRgj2UfxVypIcU7BIa4IZRVhD4i8Vubum9hVZOkQzpIau8J9XUMTY06eet1jTasqZUAt4E83cta82upBbWIDeL+cHTnrK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:32:07.1222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebb09d0-6e21-46e2-f354-08deb0b95ac6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
X-purgate-ID: tlsNG-ef75cf/1778653931-23374C48-5C54813F/10/63158204843
X-purgate-type: spam
X-purgate-size: 4599
X-Rspamd-Queue-Id: 49B4E52E1BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,xenproject.org:email]
X-Rspamd-Action: no action



On 11-May-26 11:21, Andrew Cooper wrote:
> On 11/05/2026 7:29 am, Orzel, Michal wrote:
>>
>> On 08-May-26 23:29, Andrew Cooper wrote:
>>> Exactly as per the Bookworm container, but additionally with the ipxe-qemu and
>>> qemu-system-aarch64 packages.  These will be used to remove the export jobs.
>>>
>>> Switch qemu-arm{32,64} jobs to use this container.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Doug Goldstein <cardoe@cardoe.com>
>>>
>>> We should probably wire up some build tests too, but it's too late on a Friday
>>> for me to be thinking about that for this posting.
>>> ---
>>>  automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++++
>>>  automation/gitlab-ci/test.yaml                |  4 +-
>>>  automation/scripts/containerize               |  1 +
>>>  3 files changed, 74 insertions(+), 2 deletions(-)
>>>  create mode 100644 automation/build/debian/13-arm64v8.dockerfile
>>>
>>> diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
>>> new file mode 100644
>>> index 000000000000..b9062ee8b443
>>> --- /dev/null
>>> +++ b/automation/build/debian/13-arm64v8.dockerfile
>>> @@ -0,0 +1,71 @@
>>> +# syntax=docker/dockerfile:1
>>> +FROM --platform=linux/arm64/v8 debian:trixie-slim
>>> +LABEL maintainer.name="The Xen Project"
>>> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
>>> +
>>> +ENV DEBIAN_FRONTEND=noninteractive
>>> +
>>> +RUN <<EOF
>>> +#!/bin/bash
>>> +    set -eu
>>> +
>>> +    useradd --create-home user
>>> +
>>> +    apt-get update
>>> +
>>> +    DEPS=(
>>> +        # Xen
>>> +        bison
>>> +        build-essential
>>> +        checkpolicy
>>> +        flex
>>> +
>>> +        # Tools (general)
>>> +        ca-certificates
>>> +        cpio
>>> +        git-core
>>> +        pkg-config
>>> +        wget
>>> +        # libxenguest dombuilder
>>> +        libbz2-dev
>>> +        liblzma-dev
>>> +        liblzo2-dev
>>> +        libzstd-dev
>>> +        zlib1g-dev
>>> +        # libacpi
>>> +        acpica-tools
>>> +        # libxl
>>> +        libfdt-dev
>>> +        libjson-c-dev
>>> +        uuid-dev
>>> +        # xentop
>>> +        libncurses5-dev
>>> +        # Python bindings
>>> +        python3-dev
>>> +        python3-setuptools
>>> +        # Golang bindings
>>> +        golang-go
>>> +        # Ocaml bindings/oxenstored
>>> +        ocaml-nox
>>> +        ocaml-findlib
>> Since this is a container used only for tests, why listing packages required for
>> Xen and tools build?
> 
> I did leave a note about that.
> 
>>
>>> +
>>> +        # for test phase, qemu-* jobs
>>> +        busybox-static
>>> +        curl
>>> +        device-tree-compiler
>>> +        expect
>>> +        file
>>> +        ipxe-qemu
>>> +        ovmf
>>> +        qemu-system-aarch64
>>> +        u-boot-qemu
>>> +        u-boot-tools
>> So after this change, even though you replace debian-12 with debian-13 for all
>> the tests, the debian-12 still contains the unneeded packages (i.e. for a test
>> phase that it no longer runs).
> 
> Yes.  I can't do this series bisectably without it.  Also, in the past
Ok, I understand the bisectibility problem.
> people have explicitly requested to be able to run the qemu smoke
> testing from the build container, which is why it's like this and not split.
Unless it's a rule that every container follows and is documented somewhere I
don't like this argument. My plan then is to do the clean up of Arm containers
in the future to remove packages not used. It creates more confusion for people
willing to create their own dockerfiles for testing (or just to see what it
takes to build e.g. Xen on Arm) than it gives benefits.
> 
> Honestly, I was hoping to leave the Trixie update to the ARM
> maintainers, but despite the Bookworm QEMU (7.2) being newer than the
> 6.0 in the export jobs, it contains the SYSREG interception bugs which
> prevents hiding ThumbEE from guests, and breaks all the arm32 testing
> with a Linux dom0.
Does it make sense to have both Debian 12 and Debian 13 build/test? Can't we
have just the latest one?

All of the remarks above are not something that should prevent this patch from
going in, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



