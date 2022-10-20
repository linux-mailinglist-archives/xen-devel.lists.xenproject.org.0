Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2276057CE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 09:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426227.674528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olPWf-00030j-7S; Thu, 20 Oct 2022 06:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426227.674528; Thu, 20 Oct 2022 06:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olPWf-0002yG-4h; Thu, 20 Oct 2022 06:59:33 +0000
Received: by outflank-mailman (input) for mailman id 426227;
 Thu, 20 Oct 2022 06:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2Es=2V=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olPWd-0002yA-Hd
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 06:59:31 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd793e1f-5044-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 08:59:29 +0200 (CEST)
Received: from MW4PR04CA0168.namprd04.prod.outlook.com (2603:10b6:303:85::23)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 06:59:26 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::85) by MW4PR04CA0168.outlook.office365.com
 (2603:10b6:303:85::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Thu, 20 Oct 2022 06:59:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 06:59:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 01:59:24 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 20 Oct 2022 01:59:23 -0500
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
X-Inumbo-ID: bd793e1f-5044-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCyRsxSJ3rCWiTCUw0OEPFsUv7crPY10JKAbveOxg8qMGR/OwdXM4qbplGguGI774CQxZTy9bXgE9OZzUUHr2Y64yP1pseTpRyNl2bC40JgpZaSmqUILdl7qXGAD2tCDvfYBBQIs5zUr6SttF8qHOJxNMKsI0oN0ciPfq8L3i78q/hOEEUN4NH7Ip3b8au1pc5VdR0KVaXJp45HUMAmsBIm+Tp4Qkmm5HsYNdQfUxpDtUi1uT+gDdfxtPYcvJ3Ou3xD35/IQrQdjsNfkFOn220IkJp7ERSoQkf4TVwQ5AnElT4FYZnl43VYUCQ2xv1MlIwek7mI3WVUL6+WBstsvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoO7VQb2AeH+OR2oYqPOm2g8zTDm2n0Sc40MAmzf2ug=;
 b=az+J0O3fwkXg3wzwtYCsn5G9h/f95+lBk9VJVDZRmVU3/UtTQABGcvOLhgZz1YnoVV2GMDUUtYDB4CuKNhLhfRmCi24fvsuJjVn3/L/3idS9hE08Eaj100nk8mFSBcM9FRw2Ee+TH8pCdRycS5ZsKMEfhwXnVwMA+K1RhqZR4toqZAay+TmpcrL/a6Ib6dBQUJRkeGh2kdESS1oEh0XsTF3EQfgYhICmgl9Kuch9jYA7sJtRGmJrN88FxxO3EeYWOd5MqhxaO5fVFIUvMXpkDwcyvHo3v/i2QACsjUOYIxprcw9Efb67zlAodIUNtmy+eqj2rFLSH0g6iz2yosRg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoO7VQb2AeH+OR2oYqPOm2g8zTDm2n0Sc40MAmzf2ug=;
 b=Gv7088x9FzbEDKboMgAo8VaBnIzg4gmB5tpL3aeR2ApNKrldo4WioT8vFcrk2UTV/ts5KasVegcuFXuStRp1TrNq58mrBe0Z2baMhiU/v43vRIqebTBwvbC8e4uOJtuBYN9cNngBVJ07x39SumcBc8i494G9lIhObjtiGeRNFS8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bc41f3a0-27ec-8bbe-a087-125acc20df2f@amd.com>
Date: Thu, 20 Oct 2022 08:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-6-michal.orzel@amd.com>
 <AS8PR08MB7696D8C9D2239CC9ED2FE08F922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7696D8C9D2239CC9ED2FE08F922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 791c16fe-498b-4dfb-1dc7-08dab268a00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0XiFAUHaKuwxo1EMdnDdtbEtfGXuLTTBZnNIDasNi17yc0FQwZwfAj7JXOJl8R94hsGEuNescRV3uVA005/eRfwNG4PezM5DJ2cvFqefaiv5Z2fBTeV7520YNIDNYl+dtMxKZKUzhCQ22Aq6ZQuWIy96br96rURdYTH1gmM51nf0fGcXA+qLj8r2vEq+SpYrIHYg/0ehFL6EHCW9rpI52nDguX63EPBjlQQBmAfkX3ypkNGc8VNzoL0dAvLPGJ5Ny0q6zVEBDGOCVuHeXj9uc2MlNGqd1xryXKek4ZA15H16312scVy8P6yCOtaOdMcFEMfrW42lNlzRN9qGvbyS7+M8l+9O9wbJycEy6sJ2CNvHdN/HsgphRIWWZZgvX4PZkt1mQUeZDP3xgrllkNlMWkAGhiIKMcuH3b4X+lc1LieJdR5ZP/JP4Sg4kqGEpHhu8U2MiQ4GNC89HoQZo5zFGA8OWVb4Vr4nOLP+bE8zfbjjIZEzciJPFVZQka8NsU6XNNqTLtJE7aN4KcRyUEJ/3mWF/1fcXQIgPkDK6LS83Gm+nthJA6pL79h8CnnLlSSKjCXzYexjJRVuQRG68piCCCUAKDyIjovP3aZja8TB6Iosek+vkzg5hJfGcW127cyfXm5REEujehr9luw/ak8yw7cqvdFaOBtHXqw4lv23dddZGbaLuEK8WpeGfaDh8PDwhjGMC8iZ2OmUvjElQsH454mI3qK1p/wZ/IpGeVhEixYthiZnmmCah7GOOnl1mg6pzSeXAdKHLJP/36cPs4u7ltkla6/T9S9S5PFjbZ+CnIekf5zwHvAqjoczVS1pte5C4CX1LsxdvkVeubuglXOK8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(356005)(478600001)(82740400003)(82310400005)(36860700001)(110136005)(186003)(2906002)(44832011)(36756003)(40460700003)(2616005)(41300700001)(47076005)(316002)(54906003)(16576012)(86362001)(70586007)(336012)(426003)(70206006)(8676002)(40480700001)(4326008)(81166007)(53546011)(5660300002)(26005)(31696002)(8936002)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 06:59:25.6315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c16fe-498b-4dfb-1dc7-08dab268a00f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109

Hi Jiamei,

On 20/10/2022 05:00, Jiamei Xie wrote:
> 
> 
> Hi Michal,
> 
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Michal Orzel
>> Sent: Tuesday, September 27, 2022 5:47 PM
>> To: xen-devel@lists.xenproject.org
>> Cc: Michal Orzel <michal.orzel@amd.com>; Doug Goldstein
>> <cardoe@cardoe.com>; Stefano Stabellini <sstabellini@kernel.org>
>> Subject: [PATCH v3 05/10] automation: Add Arm containers to containerize
>> script
>>
>> Script automation/scripts/containerize makes it easy to build Xen within
>> predefined containers from gitlab container registry. This script is
>> currently missing the helpers to select Arm containers, so populate the
>> necessary entries.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---

> 
> [Jiamei Xie]
> I wonder if an default container for arm can be added. For example,  if
>  "CONTAINER=arm64 automation/scripts/containerize bash",
>  set the default CONTAINER as "registry.gitlab.com/xen-project/xen/alpine:3.12-arm64v8"
> 

It can be added doing the following:

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 0f4645c4cccb..b395bd359ecf 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -25,7 +25,7 @@ die() {
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
-    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
+    _alpine-arm64v8|_arm64) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;

The question is whether it would be beneficial. After all you would still need to
type CONTAINER=arm64, whereas at the moment, you need to type CONTAINER=alpine-arm64v8.
TBH I'm not sure it is improving anything (?).

~Michal

