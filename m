Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0966BB251
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 13:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510040.786989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcQLV-0002aV-Ar; Wed, 15 Mar 2023 12:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510040.786989; Wed, 15 Mar 2023 12:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcQLV-0002Xv-7w; Wed, 15 Mar 2023 12:35:09 +0000
Received: by outflank-mailman (input) for mailman id 510040;
 Wed, 15 Mar 2023 12:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dk5j=7H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pcQLT-0002Xl-7A
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 12:35:07 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccc99421-c32d-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 13:35:00 +0100 (CET)
Received: from BN9PR03CA0205.namprd03.prod.outlook.com (2603:10b6:408:f9::30)
 by PH7PR12MB6906.namprd12.prod.outlook.com (2603:10b6:510:1b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 12:34:55 +0000
Received: from BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::a2) by BN9PR03CA0205.outlook.office365.com
 (2603:10b6:408:f9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 12:34:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT112.mail.protection.outlook.com (10.13.176.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.16 via Frontend Transport; Wed, 15 Mar 2023 12:34:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 15 Mar
 2023 07:34:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 15 Mar
 2023 05:34:54 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 15 Mar 2023 07:34:53 -0500
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
X-Inumbo-ID: ccc99421-c32d-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emFssFQvSvobouRDCvmxqVSJvgtRPGtfZ5nANS4UjycoJ54+nKoqqhsIcbNMNRyMccFXCqOSL+0xFFB/cUCI3ne6kjPeeLaFcEv1bOboKipH3p0Mvql+JU71DmP7yIlpmGz6QxFPPTJZTFRdcYzroaAAOrXR8sd4JJeqvijcZaLjRLWyV1r4sK9IrR3JKnLzEdPxcRy3BVdVlGujwGl/FEaZg2kl4PQ56S8J/OLFDyTRymdANg0V4kx0/RL2kSZPXFhwvA2FjobS3eFzOu6zWNr2dYkUDAvHYr2gluVA5TEzgP3Oz5jpl2edglcNQ5c4XBtBycIbRkFwQI8Iq+eyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWyDf3XeV5M8MZyXqhVkQ2IQnVNiQblIkSMTMr/YS2o=;
 b=S9Zg54sM6dw7ZqHFyWQQPzlUPYmPNcbCs/Eld0NM5DTnvdIBItKykBgV8Q0GBMA5A9ErU2XZt5sP1z1pLMp+WNezT4ZTh1Yqynu6LrlHlN4CwSk+j+2tOWuev7ssEdJ/AZ8gGytjRs3Ksw9LLgyR+JqoiPdlzFCGQVoZ1WT5qcJGPZt2ySbKZ+XHDArv1364x3U/SOGAQp5oByhQBuqeORWe+PP1MtiYGZ00xZepaVEO5Tw8K00BPkUWbqjK6vRy3JKBl1V2zEmLw84gLI+64LFe+kK9T7k+bw5nZ8Q/65f/fqhyy0N3qALG3JFd4tOUd9u0vW36bMkiSw7zjClyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWyDf3XeV5M8MZyXqhVkQ2IQnVNiQblIkSMTMr/YS2o=;
 b=qv4IFNV9d4ch9ZjoEYg3kRtmV5o3Z2oC1JFLywGEE/jsOhgX+e9zyoRi1saNvf65kBF7Zq5ZTGV/FlZvCL3wXGdLuwqYCdcQEuwfhCEq9YDXNJX2yYz1lZMuKpiLUcwBHVGIxzWd0Wo1WG54VPt8akH4iBR+Y/d0LZqucntLlXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
Date: Wed, 15 Mar 2023 13:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20230314142749.8845-1-michal.orzel@amd.com>
 <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT112:EE_|PH7PR12MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4951030f-6810-4e78-b516-08db2551aea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cHBYXAtq7Qs8hotpZ7px9OhLkRbBPh8nNtm4DsIVKBH6Y33XYHzKhxUsGAOndfBfeEiju05JBB386LOCtXNzFqyvM1/ZuvWzXS8BZyvU3yznG5nle8PaLaMlGvJ7AdFGQWkPOGrygDXB2TjaZidx6L60IGwbK3cwWMqJNm2XI575pktLs+E6BLWKyF/9S301+Jmw7eWf+GU1Jud72x9t8a0A39ptDS2rQQRSnoW6badl4+RbZT8XmducRyJJgnpgWKapuapqJV5KJb1X48c5urqzmk5rVcezhCG9XDV/IbEZazMYmILVixK14Tqc4WjRUaarmPwL8y+v8sIlNLmQOMiZg4HGhQ507OZZeGokLoRDl9SX2VH6pzp2GWEWCrlsp//mkTLuy9Ln/Oy9tcTh10heWE6ZvAvOrrAgfBSTifkajK6t5kzgWC55ZNB1AGf8KxYX+Wsv74hD/7h3VlgzLPr4rLuYgLJSq+g4XcyMUbjVsDaep1iq2Ldv8O3fJJURSbqCTkDgVh/9Kxag0cKmrjnqkE0fwQNoghFzCmUIncBEmV7GoWn7ESbgWsSFAjeHVa46debB6GLooq5xQemQ0sF41Apw9+V8RcLjGtZNwMnA3AkCAN4Sq3s6bU5qjWVCevLG59tS3T2E6QSoaxi72ZDX6erL9DhVfmYUYf1ZWonnb9IfefOfEwz+GRTDYv7UJfqF4X/MnZpeVfBK49C7yCqzqY63+mshxx1MQaTv92gWrtg1f6PHN3aksrISyxBMNQ+Cxbilo+7rgn7rvK5rzItNPKLawiZHANlh7DYVUdw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(31686004)(41300700001)(2906002)(8936002)(44832011)(6916009)(70586007)(5660300002)(4326008)(8676002)(70206006)(36756003)(316002)(83380400001)(478600001)(16576012)(54906003)(53546011)(26005)(40460700003)(6666004)(186003)(86362001)(47076005)(336012)(426003)(2616005)(82310400005)(36860700001)(82740400003)(81166007)(31696002)(40480700001)(356005)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 12:34:55.5393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4951030f-6810-4e78-b516-08db2551aea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6906


On 14/03/2023 16:17, Jan Beulich wrote:
> 
> 
> On 14.03.2023 15:27, Michal Orzel wrote:
>> At the moment, we direct serial input to hardware domain by default.
>> This does not make any sense when running in true dom0less mode, since
>> such domain does not exist. As a result, users wishing to write to
>> an emulated UART of a domU are always forced to execute CTRL-AAA first.
>> The same issue is when rotating among serial inputs, where we always
>> have to go through hardware domain case.
>>
>> Modify switch_serial_input() so that, if there is no hardware domain
>> (i.e. true dom0less case) and console_rx is 1 (i.e. input to hwdom),
>> we skip it and move to the next serial input.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Makes sense, but I think there are more things to consider.
> 
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>>      else
>>      {
>>          console_rx++;
>> +
>> +        /*
>> +         * Skip switching serial input to hardware domain if it does not exist
>> +         * (i.e. true dom0less mode).
>> +         */
>> +        if ( !hardware_domain && (console_rx == 1) )
>> +            console_rx++;
> 
> The consumers of this variable aren't really serialized with this
> updating. That's probably okay-ish prior to your change, but now
> there can be two updates in rapid succession. I think it would be
> better if the variable was written only once here.
ok, makes sense.

> 
>>          printk("*** Serial input to DOM%d", console_rx - 1);
> 
> When invoked from console_endboot() this will now switch to Dom1,
> i.e. that domain becomes kind of "preferred", which I think is
> wrong. Instead I think in such a case we should direct input to
> Xen by default.
Switching serial input to the first usable domain is the major motivation behind this patch.
The number of times I got pinged by users with *apparent* Xen issue on true dom0less
just because input was directed to dom0 which was not there (not everyone seems to read the
boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
to default serial input to Xen.
So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).

> 
> And then I have a question about Dom<N> lifetime in dom0less: Can
> such domains be short-lived? If yes, what you do here for Dom0
> would likely want generalizing, to skip any domain that doesn't
> exist (anymore).
I think there is nothing preventing such domains not to be short-lived and checking
for existence is a good idea. So all in all I would do the following modifications:

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e8468c121ad0..d843b8baf162 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -490,7 +490,24 @@ static void switch_serial_input(void)
     }
     else
     {
-        console_rx++;
+        unsigned int next_rx = console_rx + 1;
+
+        /* Skip switching serial input to non existing domains */
+        while ( next_rx < max_init_domid + 1 )
+        {
+            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
+
+            if ( d )
+            {
+                rcu_unlock_domain(d);
+                break;
+            }
+
+            next_rx++;
+        }
+
+        console_rx = next_rx;
+
         printk("*** Serial input to DOM%d", console_rx - 1);
     }


~Michal


