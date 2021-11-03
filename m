Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BD4443C1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220931.382388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHRt-0005W3-BJ; Wed, 03 Nov 2021 14:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220931.382388; Wed, 03 Nov 2021 14:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHRt-0005TR-7Q; Wed, 03 Nov 2021 14:41:09 +0000
Received: by outflank-mailman (input) for mailman id 220931;
 Wed, 03 Nov 2021 14:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHRr-0005TL-EX
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:41:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10d44518-3cb4-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 15:41:03 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-4mdDKJD3NkKZuKy8ploR9Q-1; Wed, 03 Nov 2021 15:41:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 14:40:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:40:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0108.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 3 Nov 2021 14:40:57 +0000
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
X-Inumbo-ID: 10d44518-3cb4-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635950461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2g7NxanR3qs4lX5FJNF/0A0KESJLCj6zkSIIirdrJS0=;
	b=LU/e+tjvM/K8fDzFl41LaQRNIiyXZIFyLllHnhJFDxYp303qgCMYaSvBHq/l180Lkq7ckr
	u4THM+bnp5BIWEm0Tya8fAe9VQfexduleKR1hhAaJHDTgrP4BFIUEnP9ofObA/VgakzFAG
	eW6JqLhfFIMm9QwPWFqlLwiqW09t04s=
X-MC-Unique: 4mdDKJD3NkKZuKy8ploR9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp+dQndmuNxshdKMsRB0h1jJks3N8oJU6dDK5Y85EH/9gdcNxpZXLFanHUDRdalDYWG2emGyw6LB00iBj9zeQKI78/SW2iv89MGFP8Sh5AQGG5Krq/ci7izW+1fQyeoZcl1cWxVBOTyLJmV06p8Zz4NJbp0bb27WXz+2nuTFuVISkm7x2AnI2fRFCuOwmhP7BffHvVgqJORtpzBO0dfnWR0474nyzRf75KitRcY7iQyqLcWUGKqAMEOyyksmubSGVRKHuYZFdOr+wn+WN+tcj+OHtp2VQ3VRsDE9JO2WAd+SMRLz01xKuRKV7QMoIEG4Pg34JuuOUc0oXBn6wBvCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g7NxanR3qs4lX5FJNF/0A0KESJLCj6zkSIIirdrJS0=;
 b=K6GbMOH2KOawnWksnBw+skHux0itJVDKOI8Z1S9x2ch0Himmfr81BDx0Muyokeytmlw2dJyLKIkA643H3P9a/Bnege35UUqenA0PPB1cTsuPz14sGaIuUbZ7mw/aDQc9MTXlNO9FidDHiqgEW4mEecOG6WLn29S+e2C7qsqUK2rScOnUvcT+24fA2WX1LpIinjdnXs2m/+dY9IlC1IDMe6vzhYuSM3BUdAuMPsaSW8AH4rd/BvQl8AbQXi2NFYXjhkXUXE9OG5A7dGBJVxjFD67geo5HoKkUF+Tr6vfc7CbEPHB+1HU6JUQgemhk6efz1C1xjuELDy/Jj2N0H+7Qqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>
Date: Wed, 3 Nov 2021 15:40:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI table
 parsing
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0108.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40891819-e5de-46dd-9e87-08d99ed7f2e3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2334FDA72DD6438783C1D272B38C9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ABGLjLr/uX09eF774TJCWwOn0HMSFIfZGa4QIzZedJJeZiiYDUDaIm0DUlGlmINO4M8nPVzljHxYnpUTWUvYMfECWBgimVCbpBxtyd2A6+lGU0PBUoZ4OjagGMbFPiB4RsvhDp5S30KXttvTW6AkUTqTNaaoiJC+BRA5pNEg3sqFHP5/DyVIyPR/SgQTUMx0VeUuTt2NfgTLLCuitbS0056BRLdGLMu50m1MdMqF97ggbpQ7os3+NYs0AD4lg66IT7Dtwp68McBqpUkRuq7wujvQcvPJa9Iv0QQYqtk5MHu/oIj93xYDQbbKAPHu1AVO25oAflJbhpdy7zS4xhmbcKju7K6n+N/xBvudVgYWQp2gy73ZNT68yRca6NbIajeUemE8MmN/UtefXkvCXZWWWI11WAHQ1gt1X3mYOtdKsEoIcBkjV4ry9VHQcmQw1AvejPBePCX2kC/jVZX1bX50QLoucMC5SencFIW4Et7/psev+2tdhmiC0yMsyQz8QxoA+0/uF+GgQ1LwEoThJt8Ob6a1g6ckYF7nTI+vmOE45QGtNORC1aQnmvb4F1bdMtJ03dX6oCFP2SB4teu2NKj+liSsKIPFqwlHxZv+5X6iUjn+YRkMY9gwBQgHfwygoe36U4xl/2uMGbGPBKxC0trB2pIoq7bFVZ6rJHftAd8aY560bd6BUf/EtYlD3z+wb7qd/IwOVTdgaAxXp0g7xe5O4hT4A/K3KjJ1cFDidlFUw7A+9YmEdeEqCik+fPLK+iGL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(316002)(66556008)(31686004)(36756003)(6486002)(26005)(2616005)(956004)(38100700002)(5660300002)(8936002)(16576012)(8676002)(186003)(4326008)(508600001)(66476007)(6916009)(86362001)(2906002)(66946007)(31696002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bENJZWIycFQ5Tld0K3RMV016czZRaDZraHI4SGVQc2JrOGFFNjFlVnUxN0Ra?=
 =?utf-8?B?dVN5YTJGc1JyellNTHladUswTXE4ZXk0aWxyN1RZZ1dBNFhRcHJmdVRqMG94?=
 =?utf-8?B?SldYdHprZURRVVJPallNakRCOEhVaFVLSkRXUlV3K0plWmhDOHEyaVNNRS83?=
 =?utf-8?B?QXl5dE15ZVRYaTBUdlZnQVk0Z3dZb3ovRzQ3ZjFWdGlCcGhZU3V6aDNOSFFV?=
 =?utf-8?B?STBIUnFTVHl6eG5oSG5iTjY3cDVzNVZSQzVqc2EvWGk4ZHUweFFzWlNPYnRK?=
 =?utf-8?B?T1RWWVZYWHJ4MFcwTkRsa041a1lMRE1qQzV4a3RxQS96TDROaUpXODlnSkhL?=
 =?utf-8?B?MUw1TWVVNDJUcnpPdmVPL3hsczVjMGZVUFREOHRQemlheTNqOWlJQkE1MXZG?=
 =?utf-8?B?VEZ4dWVueGE1OW9BUHE4dnIyUEU4OHp5U3J0TUJxZ3dMREZyb1JmNS9YYnor?=
 =?utf-8?B?ZFFIb3IvMXlDOS9CaXJqS3hZa0RvUG9tcCtURERkSHhTWjN3ZFRRTVJRMTUw?=
 =?utf-8?B?czUrQVA1STF3bDFaeGxBYm0vUUdoWkhheUVieVpISTdKb0RmbjNoWmhIY0Nm?=
 =?utf-8?B?YkdaV1RTb0pndzZXeEVIek9uY3FwNWl1K0h5OXZzYmJzUHJnTkhjRUdIdkY1?=
 =?utf-8?B?cWNFTlBlaE1DdHRHMkZGekh0eGgzS1BjK25ySkpLM2ZUb2lBcGF4V1I0MGZl?=
 =?utf-8?B?T2dZdFJXdzBCWnZ2dlIwU2hKNFZrWmNPUlh2S20vbllHT0p4TE8vY2NUWkRs?=
 =?utf-8?B?bGZiaWJvSURkS1UxeTJDVDRJaUNVVHhWK2FwYmhQVmlxcmlRMTJ2WGxneFY1?=
 =?utf-8?B?aklWQW5acllaTEdpcXU3KzRaZEhIN0dsbWJGa3ZFd1J5ejlvSVJoQ3Vkd2ow?=
 =?utf-8?B?OWFZTE1taGRTakRtREdDbUd2NEpBVVNQTnVkY0Fmb0ZzNTloZVBTYy9jZlJy?=
 =?utf-8?B?RHFlS1RNNERNdmRyWU5reXpZa2UzZW4zNzZnS3c5dTZxSU9TQkdIMDhkUVQw?=
 =?utf-8?B?S1hYYmlyTHkxeXU0WklmbGFzTE9mRUVxU0kvVUIrMFU0OFRPSEoyUk9xRDkz?=
 =?utf-8?B?U1dXWGpOOFc1MGFFNzdqOXplaFo4L21aN1BQVjZoK0paaTRVQTVYQjRvd0xa?=
 =?utf-8?B?Y0FuMTlwa1hnWDNDd0RZTEVkMCtuT2NVdmlQaGduT2tJaWtkZUN2T1h6Rnps?=
 =?utf-8?B?ZUhWMXcvdi9DSzRlUXh1VWtmZHVwU1lDbnhkcGZpTlQwV1lQRjR0UmtHdlNW?=
 =?utf-8?B?NXd2dG1lZjFJdnk3KzNKUmpRZ2Zlem54ZnE3alZqcmF1Tjk3UGxGdXFtNVI4?=
 =?utf-8?B?cFk2dFd5cFphY3ovMTN6MDV4L3hYZUlZTjZjMzVGb3hlRHR0MnpkRnpkQkRF?=
 =?utf-8?B?ZkU3Q3FRbGcwb0lMQjg2bXpRTjQzTFBWcUNwMkxmcmNTT0tzRzhVeWdacU9p?=
 =?utf-8?B?TDBVZW9nTXA5Nlkyb2k0WUFndnlsbGJsM3NiZjk3UHRDbGhidUFwSmVtbWoy?=
 =?utf-8?B?Y3YybmdTeUl2VVBhcHNsSElVaXpQQnVQeXd3WHprbDRxRmlYa1VZTXNiNTYz?=
 =?utf-8?B?VFlVYU5UWWZuYUF1aXFDSjVNK3Z3dDA4M0wybVBodDl3cHdnTG5ZRjNGbkZI?=
 =?utf-8?B?UnlTSjdRUnUzWFJlQkRFVXVhN2llcGRYcERBSXJMVVJTbXJkVnMrV29ZdEl3?=
 =?utf-8?B?R0k0NFhuaDNpVEM1ejhaOWxPNVlwMjZLa3BkcnhtOExSaVdjQU9VNWFZcjR6?=
 =?utf-8?B?WlB0cmJtamxHZEFEb2o2VUNmcGJTL2l1QWFGQlZ6S1ZEQUJqN0RXaWNhdjFK?=
 =?utf-8?B?TDlrU3EvdUE0TEN3NDRXQ0hXaXAzVFhMUkRGbk9kT1lUTFczQ1QyL3BLTWRW?=
 =?utf-8?B?cS9meHU2RWh2RkdjSTRmOFRXSGsycjNYcHlkVEtxbk5WT1BseW5hSFFkTG1Q?=
 =?utf-8?B?ZWxRRE01QjN4T1B0VGNIdWpjQ1pwRG4vM2xodGUvRlhLTTQ1cnVEUnF2T1hN?=
 =?utf-8?B?cnlsL2RMQks3dDNMMjIrWWs3UGcrcUxmaXp3ei9IWVZvcUEvLyswdGRaMGNw?=
 =?utf-8?B?UXphbVZlZWQya2xqSU5jS2xER2JOaGx2YkFreDJUWW8wM3RWK0NPYm9XQXNn?=
 =?utf-8?B?QzVOM2xXLzlRZVJtcTJKdW5Xakx4L3VEQUgwZngyVHdCZmVDaGNzcWpYVmJM?=
 =?utf-8?Q?ykvuQOA45zgw7nHmpYKGYOs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40891819-e5de-46dd-9e87-08d99ed7f2e3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:40:58.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrCRDSITnpiS2EG19+4GJMPWG3M8Ye+8uQ4bFRsth25ojgM87wn7ZxJ4/9m/kCpPqwiWDMfiQVZm1PLfLRY9oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

While commit XXXXXXXXXXXX ("x86/IOMMU: mark IOMMU / intremap not in use
when ACPI tables are missing") deals with apic_x2apic_probe() as called
from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
affected: The call needs to occur after acpi_boot_init() (which is what
calls acpi_iommu_init()), such that iommu_intremap getting disabled
there can be properly taken into account by apic_x2apic_probe().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Based on code inspection only - I have no affected system and hence no
way to actually test the case.

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1694,8 +1694,6 @@ void __init noreturn __start_xen(unsigne
 
     dmi_scan_machine();
 
-    generic_apic_probe();
-
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
@@ -1705,6 +1703,13 @@ void __init noreturn __start_xen(unsigne
 
     acpi_boot_init();
 
+    /*
+     * Requires initial ACPI table parsing to have happened, such that
+     * check_x2apic_preenabled() would be able to observe acpi_iommu_init()'s
+     * findings, in particular it turning off iommu_intremap.
+     */
+    generic_apic_probe();
+
     if ( smp_found_config )
         get_smp_config();
 


