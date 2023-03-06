Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FBC6AB883
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 09:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506768.779918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6NT-00071c-C2; Mon, 06 Mar 2023 08:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506768.779918; Mon, 06 Mar 2023 08:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ6NT-0006zc-7f; Mon, 06 Mar 2023 08:39:27 +0000
Received: by outflank-mailman (input) for mailman id 506768;
 Mon, 06 Mar 2023 08:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xdHg=66=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pZ6NS-0006zW-8Q
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 08:39:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6561fc33-bbfa-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 09:39:24 +0100 (CET)
Received: from DM6PR06CA0024.namprd06.prod.outlook.com (2603:10b6:5:120::37)
 by CH2PR12MB4860.namprd12.prod.outlook.com (2603:10b6:610:6c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 08:39:21 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::cb) by DM6PR06CA0024.outlook.office365.com
 (2603:10b6:5:120::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 08:39:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 08:39:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 02:39:19 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 6 Mar 2023 02:39:18 -0600
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
X-Inumbo-ID: 6561fc33-bbfa-11ed-96b4-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfT4RFomdq79w+BAu/TGE8r3HnvhG6Duy9BcIqpYEr3AsNkXK8XDbXKHjWokhWKO6X0ZWtv7k40bpAzsuCGjNPbx2IrH6xDJDLVoZ+Zdpc6WkpbDPdxsRcxf9eQ3LUnsodtuI7l2VFYMy1lIBzUF+O+5CbrLMV6rPdN0TN8oxl3jTQBvf1gXYmM8/2UhkARjpnED+QvSMgT4wdmF6CPpoulx5A1Zz3Cu4dx8LzZuaYU89IXPPG0BvvKsSh6/yNWjujUTomnepFR+K+oI0KRs++rKG0UylkBIcZouuNAH5jjcWcL1dDN+u4asW4p2MLQLLiZASCH3rdkgZ5RLbc+YvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsQHG1nbJ+u+pOp0g3LeW7mMIkmRmXER6TX8lSb5M64=;
 b=fwmck9X2HQw48Ad3Na4ui1p7nmvaQwBBCyHmCMW4Oi89m0b8aQN8r6n+FupWQPfShbiUr8IkszzLJxC+nIWmPHlnmThaMruaaYc6F3yr7ExBq1RXwwbVl3QJ8+x/utf+v6LmglkY2XyvWrMmcfpUMb4ZIimSN6gdyYoFkQMpWzhVc04CZJhA9Yhq5Wi5qa2mxBOFf18mvnP4YniIVDiQYFRvGIYBgxhNUh+4XZRu6yxjyNo5ew2UYsW52mE2eQinBR0PIvES4g/jQRydcZSMfwGgx6RhVqX3PU7pB05hXLbi0EyawhO5CuJlgzVAgMpNOJghcJQujWEWJYXgbFLmfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsQHG1nbJ+u+pOp0g3LeW7mMIkmRmXER6TX8lSb5M64=;
 b=4juPT3oCMo7I7cTL44+lZfJlWN5Bg83GUaWHLv8nYxvJp98xw3TjeHNDgQxxCxLnUlRn7Bwk1EZj2UU079yy2DH1i48MQnQMTOLyIagP4KBmEN+a4oerh2I5EWtSqKSFfdvVJeF28eM7Y4mBmN6eZI2a0+3yl0P9Pszv6jFtQA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1e8ffb31-60a9-39fe-72cb-d31431f9e61f@amd.com>
Date: Mon, 6 Mar 2023 09:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] automation: add Ubuntu container for Xilinx
 hardware tests
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
 <20230303235719.1181690-1-sstabellini@kernel.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230303235719.1181690-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT033:EE_|CH2PR12MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 87089730-6f99-4048-d034-08db1e1e4816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o9dEp5kAyues/S2BPdYrer7neqqe5IMh4EAUpUxFqpkK3OtuzlYwB/KdN3pdIUbRbjYPTuf0o8iGmaJBaYtKgyomDorRgXfnPF5du2VuTY6LyTtiD6ewp2oil3t4bkzly2dZlo/glHRdVTsFrFKts6Po9DiUqmeqraCT1s57VITdVKKVnPlHOJQXwhRHdFGNt2Z9fXHhwR3kd1Hs5I1wj2ARESIgYRt5pAC9/qo0m0nsBIt7wpKvsibCdPj6JF9j0l78ALnI8kK0zuUk01GrSJdeQ9K8GOkDVIaTSmAp0LrUJanvXb8Say6MsZIwvD0rP/Qq7Ey+z6S1s2q579Ec8dnRKXTV6POgWKswWi7CJnhHdhsrWppzWdGr4kaMWLdNvLexw5vcVcssPIYPn8f3T15RYhdZRaR2obO3WsNtY6irjFcDbDf1/a161qU2oWxhZ+k92c50//2pKH5HdvQ5lePQdNt4SbZoQ4WPVgTRywU8Knz9ZBGH007mPGDhrmcaBiCK5PgZl9UAB6DfKsYilgBDKUOfQu9og9xoyxIEwm2CLGWpNfEAh1ZbOjvZaom1ilEPFAvV7mzZAeSCRgQNJQ2EHMMkh3E1Al6C/kX/RUHbhHCdmFRGgd1XRJ79uyaS+OPBzGlAfRGdlVgAYLW4QWP8osRJU1frCj0XHGIPZnT7VaGIo0ncrE+zoTMvQzrOAo6IypDGXVqilxKOGwq0awK3YYLcssMmr5nVpAVkc/ROK2rYkXq8cxB4PIfv8J9xUYTQYyxbe5uO3g4hJmjY8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(426003)(36860700001)(31686004)(47076005)(36756003)(40460700003)(82740400003)(8936002)(40480700001)(5660300002)(2906002)(478600001)(81166007)(86362001)(356005)(31696002)(82310400005)(2616005)(336012)(186003)(26005)(53546011)(70206006)(70586007)(8676002)(44832011)(16576012)(316002)(4326008)(54906003)(110136005)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 08:39:20.9582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87089730-6f99-4048-d034-08db1e1e4816
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4860

Hi Stefano,

On 04/03/2023 00:57, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This container is only run on the controller PC (x86) to trigger the
> test on a connected Xilinx ZCU102 physical board.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  .../build/ubuntu/xenial-xilinx.dockerfile     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 automation/build/ubuntu/xenial-xilinx.dockerfile
> 
> diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
> new file mode 100644
> index 0000000000..7e4f5d6605
> --- /dev/null
> +++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
> @@ -0,0 +1,25 @@
> +FROM ubuntu:16.04
> +LABEL maintainer.name="The Xen Project " \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
This comment is a bit misleading given the usage of this container.
Something like "board bringup depends" would be better and it would make clear
why we have this container.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

