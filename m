Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AB5B03B4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401457.643315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtvb-000125-CX; Wed, 07 Sep 2022 12:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401457.643315; Wed, 07 Sep 2022 12:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtvb-0000zd-8U; Wed, 07 Sep 2022 12:13:11 +0000
Received: by outflank-mailman (input) for mailman id 401457;
 Wed, 07 Sep 2022 12:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVtvY-0000sR-T9
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:13:09 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e07aaa8-2ea6-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 14:13:08 +0200 (CEST)
Received: from MW4PR03CA0031.namprd03.prod.outlook.com (2603:10b6:303:8e::6)
 by CH0PR12MB5153.namprd12.prod.outlook.com (2603:10b6:610:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 12:12:58 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::d2) by MW4PR03CA0031.outlook.office365.com
 (2603:10b6:303:8e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 7 Sep 2022 12:12:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 12:12:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 07:12:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 07:12:56 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 07:12:54 -0500
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
X-Inumbo-ID: 6e07aaa8-2ea6-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuDbQg7WVZPBMMSincH31M1bzLYxQBlEnFPh6fhXigJaOOMsuQW+ZU4HCGSqnZ42yh4fjdnVUADpA2rlkgnGnMtmOYPWcz3XBa/3lhyizmauEA1ptkiPVwg/eHel4rfe1yjm2JgSSYP1zsWdLm0WUv7C8Xl6wzvzg7gvYOKk/EsZJ5fGJUZhOyHJf2G9DQ5EnO2BWfZe14oLGjq6jNKlrVEiIYJDE+pgpEljAHqj+o0zZfyti5SpQc7KEjL8/oWGJ1byAxbzHWA4dTqetTiWX2JrTyZu72Yk1GSIHtsjLQRCBg80CNwh+bNW4V8MOSBHVgidha+HSkMTHQbXPQ0hQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12+37N4Z3aYYq6cSIeYWSWpqZjUlnG2PQcA/ZS9uVWc=;
 b=Nr48S+hIkhW2TwFgtpm+FxJ2oRJF40dz0Vq/kLi6bA3gZaw1nhcC5Rkn/alRYWEnJaMXPdV9SM0f5cQv5mky06chvO6qOxVLbAdfoBur0bXLYwjHASHxA7CQI+90Nsp0eH2x8OfAlJCWyF19suZwnBzJmWly6mkC7bf4gd+WvupxcIGS4ze9p1iD8aqJFnX3BQKHx1BRTx82BAH+7rs1Tg5G77KIFwIaddBrurEH++QpsRlH/VQVUHYB/+tP7SlLeuXIKExYSJzCa099Mam7TxETl0QDYSTRgG38hKzTTPephxszspQqY66kw6oj25isTNhYjCSmnAQ9r7BUYEoqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12+37N4Z3aYYq6cSIeYWSWpqZjUlnG2PQcA/ZS9uVWc=;
 b=reYPuSTUGbun6TrUP+/z3aTITryuDLlKRiBPW5qY0lOsy25Lu3fFzttmi9VzQIdkFWUIIAOrQUuNUB0MB4luIzpilzmFAJ/OzIj7VhWgqr1EbVbuLEjpCKhc4Q6W/eqrFnfZvZ/G0tV4jdu1wFbN3mwr1TqZ4wQNeNhnUQ1Z3ZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
Date: Wed, 7 Sep 2022 14:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <penny.zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT050:EE_|CH0PR12MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ff5849-6eaf-4d40-7676-08da90ca4d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a40rJSzJymNiW+YF9mC/Ed/ztXsEaMbLGb9qAvj/oyXhB+HZUSyEpawYlAn+VSPKw7TWHMNudZntW0xh4esuKCFbNHTuxm2Hk2vM589wvTQkLh9xJh6IuIvjOtNdBtVBQcVtHyKlLfAGJfj0h6ZM1TG9xAYB5HiT0Sq+cLgBf6mAzsrZc/I0swrAQr/Nan6iQpzXaCA8Oy9AOXVaYgGaT9hrpDRTLcw4F1CGc/l5kK8W/qJIyr8Hh4BwPhBSKw+7t3X6UE2iSVHlX98Bi/E0vNvfUbeO7fl+0VUyUJIIEDGc/eDGTnLZMKImxglW/NHF397bc6+Y+cDs/7H2SHycC8UC1lAw/MqncG35sh6Y9HaQc/PwTdHLJXGdJsjHg7M943H0w4D51OfQD4RGHZXbMEYlCWseCwGw4In4uNN84DgFmYCXYBDBKKMmmuS5CwRaoO/Au8cH+bg2IcEZoMr00Gbk12/z4ImeRkrahS5xD2aDtVTAkO6fY0naZAJgSqrXrFnsP+aDXHiZMZsi4Sn3oetD6Z2OMTlL+8kjr6UVuVuN1IMfyCJCv9FyJ9ntjyMOr0j+w7VWkZ+iG8WaoPUz3pEElehKEWI5X1CcpxmxjAf+cdQaA6IEscCM/bTpE69BLO1nwfWhNvOqautrJQhbWWdE18EdS2b1lB41S126OhbcFJzOvaRgCitUKA0ZJ/og2Rh6y4LPxnNOKLJDYbqv2UT6pR4x0PqpsRegheHTxeE3F2SOOsvCw61LnLhhOjYc0OeQjts1+UpQUKCFWXBgEiFzMIFMAGmwIP8QkegbHoVEDtbuiSYd4abGp7sQFxfv3+XNsnRjkOrRqJn9PlgNDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(40470700004)(36840700001)(46966006)(426003)(53546011)(70206006)(31696002)(47076005)(86362001)(40460700003)(478600001)(8936002)(8676002)(4326008)(70586007)(336012)(26005)(186003)(40480700001)(2906002)(2616005)(82740400003)(16576012)(31686004)(41300700001)(36860700001)(5660300002)(82310400005)(81166007)(54906003)(110136005)(36756003)(316002)(83380400001)(356005)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:12:58.0130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ff5849-6eaf-4d40-7676-08da90ca4d59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5153

Hi Julien,

On 07/09/2022 13:36, Julien Grall wrote:
> 
> Hi Henry,
> 
> While reviewing the binding sent by Penny I noticed some inconsistency
> with the one you introduced. See below.
> 
> On 07/09/2022 09:36, Henry Wang wrote:
>> +- xen,static-heap
>> +
>> +    Property under the top-level "chosen" node. It specifies the address
>> +    and size of Xen static heap memory. Note that at least a 64KB
>> +    alignment is required.
>> +
>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>> +
>> +    Specify the number of cells used for the address and size of the
>> +    "xen,static-heap" property under "chosen".
>> +
>> +Below is an example on how to specify the static heap in device tree:
>> +
>> +    / {
>> +        chosen {
>> +            #xen,static-heap-address-cells = <0x2>;
>> +            #xen,static-heap-size-cells = <0x2>;
> 
> Your binding, is introduce #xen,static-heap-{address, size}-cells
> whereas Penny's one is using #{address, size}-cells even if the property
> is not "reg".
> 
> I would like some consistency in the way we define bindings. Looking at
> the tree, we already seem to have introduced
> #xen-static-mem-address-cells. So maybe we should follow your approach?
> 
> That said, I am wondering whether we should just use one set of property
> name.
> 
> I am open to suggestion here. My only request is we are consistent (i.e.
> this doesn't depend on who wrote the bindings).
> 
In my opinion we should follow the device tree specification which states
that the #address-cells and #size-cells correspond to the reg property.
This would mean that for all the custom properties we introduce we need
custom address and size properties (just like for static-mem/static-heap).

~Michal

