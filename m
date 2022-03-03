Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE54CBAB2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 10:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282879.481710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPi5o-0006E3-Pw; Thu, 03 Mar 2022 09:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282879.481710; Thu, 03 Mar 2022 09:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPi5o-0006C3-Mh; Thu, 03 Mar 2022 09:49:52 +0000
Received: by outflank-mailman (input) for mailman id 282879;
 Thu, 03 Mar 2022 09:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPi5n-0006Bx-NA
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 09:49:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44be1e15-9ad7-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 10:49:50 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-dEzZTFGSMk6CXB0S8ssZhg-1; Thu, 03 Mar 2022 10:49:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2735.eurprd04.prod.outlook.com (2603:10a6:800:b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 09:49:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 09:49:47 +0000
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
X-Inumbo-ID: 44be1e15-9ad7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646300990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wxTlvrQrCrtfuzAef8q/M8aAHiBadKfLWySl/j0JE7c=;
	b=PtTywdLDu7G7ZJwzSj00A0mj6+NtdYeXpmmZS8Y1KoRjhkQNbacI0OOlKilyPYHGIi417C
	sbeXmQhu9CAUDLrVJ0YpaVoE3CybIO21/+vqiT99evT2D37cHqBEGMo/ULE9DVMTZQeQqG
	Zzu71bMGeylPxV1MijbRG2TZz3u1Wo8=
X-MC-Unique: dEzZTFGSMk6CXB0S8ssZhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYrGgKPI/fpkYm6TT4aeqb9QGWVk4/kN7ygU8nyYlO3ORP2SrOjG63hGuWF82CHoOSJpHTgqcfAh4+j59+jcIWo0JehsTm0Yg9iLk1NmxCA1GZpahZnlycmUYp28W3aUyQ12qeXyTpdK61W66yII0aJb7oD/dHEbkAb+E6UtPmE1Jeib87CjKIO/XS0ufSiiGiHD+9tFb3v8p8TlBs6sorNpnOZE8gXUXMtKguOSsxdMq7DP+1tKGOVsKImi6J2OgbP8JIBMLWte5vULOdAk0gEFw4MWYnRawGn8ufN319N4tJ4xtaCo3vbmw0iT/gqDD4U4kKPSmbhMVVcAHJfyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxTlvrQrCrtfuzAef8q/M8aAHiBadKfLWySl/j0JE7c=;
 b=kqVYZ/nwebh+jxxhhaA19Q2LJGt/guekUdQNQoLymAM+iWaW/QiuxunEu+PZ0Y9B5/25TBD+wsdEbYgKcKe9fzoa8rliCKIeyXu8qfmo0ifBhc6YbMBzomaPEHtDoDxTgOFQkH8t4xqAWe9YGlDxiVyYlsLV9aPLXE4TN0Cqo8+idnWB0x53Am5sJRDB2oZ/3DywBkw5A6+9vm8HQRY9Q8XnV8uA4Ba0Un+jSXw+rUGNHyALYawtK5g4yCtZnvquIFZHUQ7u2DG2EiKzhw5ZTAXE+XHiTz5F3Jr16Z7spywjluWQMRuDxMfoBjj/cgSPmhyXtDuFK9uy8CYVNTD0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
Date: Thu, 3 Mar 2022 10:49:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/tboot: adjust Kconfig default
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0060.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d19d83cc-57f6-4e52-3eb7-08d9fcfb2726
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2735:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2735234C7C20805C95099F7EB3049@VI1PR0402MB2735.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iVxTI8lmYMdKVOd8BzUCDo7szMAX/u9LC8x9LZEJ0Yh+PhgfnK2js+xioz6eWm7VBWZ0V6H/i83iYDQo/gthTVK+l+Gi+hZ9a3YYL/jlftEB9xx55gcLHVAOXLKjJFxA36DaE0p5S9k9SGK9oZCKv0Uazj9QZv4pM8K3jlnhlsWaPrrjUTSz8XrcymcvNMIxMlEKesMtCaM97kCR8r6XETNpKkgNY3bii2N4iyd1VNplxPvoHuoxcfWBhXTzgD7De8z/QXALb/dOLqO7df09QsXmIr/IokbbjVPh3WZsNU11II7LcTR3hmSptTcqg+uReieMuwsqcNmTHu92Q2aJJ8t4WpJ4COkB00P1GUehfco7EjjAqQlIMFeo24NrqrUh9o3n7gPJUnH2a/p84V/KCFPmal3y1jBlF7esyjODy1dI9N5dFQ+rRH1zaJkQQd7YTZACKf4WXf7fe6tOPSk2LVg+llNadiBV4453ZjERMo+wy9697aehWMi8zi3iTEPuPL5MWv1Hp0f8pLTmGijlBydapABTc6KLpfdY+1rLL8bIAyUbzVFsUNZXzYtq5PDvdVoPYJwfl0RV8IUEKqs/kR+R/BGuwOPkMBwo2ogq0zwiMiydby0eWeje1TMcrTTyrOuxkMiPyOkKSZKUCzA7La92NL39amZ/h96XOSn3+Ma5hrSZ9w6E9ZWhS3aMJrN2VmjxQ9ZqR09OPrvbbdWxSzGo+Mg5goIct18VekJKjPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8936002)(2616005)(4744005)(36756003)(5660300002)(6512007)(83380400001)(186003)(2906002)(6916009)(26005)(6486002)(508600001)(66556008)(66476007)(8676002)(4326008)(31686004)(31696002)(316002)(6506007)(54906003)(66946007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBXRVNzMUp4cDJnaEdRM3NsY2JBQVY4OEhORk1wcHEwK2hLdjlzNHdQTGZC?=
 =?utf-8?B?QWI3WDdRRDcvSXkybkFrbWdDTVRsdjY0SGkxWm5uTWxzeFU2U245UTJtMHNT?=
 =?utf-8?B?K3NhaG9ENmxuV2d6SDFRQXhjZG50MU1DRi9DZUozcDUyRjJoWXRjQUhDWnRl?=
 =?utf-8?B?cmVFSWkrbm42QlU2VHNkeW9PNUlSL1AvdHBMbzVQUFdDS0NLQTNlbURMUWw5?=
 =?utf-8?B?NDNGdW9NSjQvYWppR2hhQ21JU25pYkFRdm04V29id29vNlZJd1F1THhGTTFs?=
 =?utf-8?B?dVVKbWJYeFd3NjdjbVkwdE9ta1N5Sk96RmtuSUtHekFsb1A5YlNJeDNVcXNH?=
 =?utf-8?B?SnE2L0JrM2V3U01EWW9pWGhybWZhZlQ3MzR6OVdsbUlaUUtwc1lCY2s3V3Ns?=
 =?utf-8?B?Tk5MZUEycmpDZTYybG1RaUo4R0RkU1RyTVA4Ui9oMWpLbzFMekNReEtkVnp5?=
 =?utf-8?B?ckZSZUh1ekpJMElXRmlQWWhQYnU3VWJJblRSd01vT0doSm95a0NCVkF3VXNw?=
 =?utf-8?B?cWRPM0hyRkdqanRnZS9kQVV4ejg4TjNmRGVlSVJ6QXEwdW15NFNQZHJhakg3?=
 =?utf-8?B?QnlNODVRclFiUG5pNDEzbXgyclV2REVSaTFsbG8rUXB0V3BBcnhPSS9WUFRr?=
 =?utf-8?B?dGgxWFozMzBCcVExNG9UOEZCdlZkUmRxQ1ZQWjc4UjFiV2hMQm4vUlNxT2pp?=
 =?utf-8?B?ZlE2SVJHcWpncEYzNFZYRzFMdlVXYUVZMjE2RnpnTWF1ZjEwRTBvUHltMmVq?=
 =?utf-8?B?Y0haV1dtOXBhK2QyMTZONDJCRk5ZV3JXQlVIemhXcVdmV2FuNWdjN0xqcFd6?=
 =?utf-8?B?Q2xDOHUzbEc4YjlOaVR0SWdFMWF4ODQ3VHdoVUpKblFCQlNpRkkvNktoUDRl?=
 =?utf-8?B?bk8xSGxmUjdza0V5bkJmTWVTV0p2MWhKNU1UQm5qRGVmYWJLcGpmTEp2anNp?=
 =?utf-8?B?aGpjUGNQcW51T2E5ZFRjcHdKdXhsd1JzeHR5TUdPY3M5d3NTQVJjMVpQRjVk?=
 =?utf-8?B?ajNtZjIwMDZjKzZUVk5UVTl4QzhCVmQxckI1anVhRnBBUnFBaTBPWTZIZktI?=
 =?utf-8?B?NEpOSWVpMERPYTBodjhyV0N2aDJ1ZVJxTWRKaktKMzRGdzluR3BFRGlNRjFv?=
 =?utf-8?B?cjY0Z3ZJWC94Z1NaUFlKOS8zcm9MYUV2eTBlaE1qbkt2VUlQc1lJNlBrZnFl?=
 =?utf-8?B?WWlEcE0zZWFUcDVWNlJDa0p2Z1ZxUWhnNWJIVTZNUEtDMkdKT2VEakZzb2Ny?=
 =?utf-8?B?V1FzUmI1UWthRFpNODNTcStsa1pGdlg0NzJXNVFvZVErMWxCQVIyZmRSdXVa?=
 =?utf-8?B?NTdaTUppRngvbXZseFl1WjVPMkRTbkNuZW82YmJ0cks1SlFpVmFlUXExSlBm?=
 =?utf-8?B?L25zR2k2OFdvdVQza2NXMHhya2YxWWllbEhocU1uZjI5TExpbDBKOE1RQ0Rx?=
 =?utf-8?B?NG1oQnd2dmlTOEY3Vnc2dnEwR3RyNHZTeWdnL3JrRXlJUVJXZGFDV2xlZGkz?=
 =?utf-8?B?SEFqRlo4ZDljMWl3T0VvSkxsVlFkTGx1SzVUWU9SZXRTaTlrSlhjZzhhYUdp?=
 =?utf-8?B?OUZZeDhKcktLcFdTQ3lPU3NwTm41R2Y4WldhaXVtOVZUUEFTdGpzZkNaSk4r?=
 =?utf-8?B?WlFLTU1WVnBHMWxWZ1h1S3dDZm9kK015aGlELzNNYXU1ZkFtZ3NvRm5Ed0JN?=
 =?utf-8?B?eXZVTUFiOFRBbGZLMjZvWjgydXVNd2RUMTdzWEhnd1Z5bWF0dDdkMUlPeXlI?=
 =?utf-8?B?NExsZDB4djJ0c0Ywb0xqTDZkUzB3ZVF4Rm1JcEs0QmpFbXpyTXBObTRIU2gx?=
 =?utf-8?B?WFdKM0xXcEtKS281TFp3TWtFcEppNm90UWtUa1Z5ekpjczMzTW9zaGtkcEtG?=
 =?utf-8?B?VUEzTmt5bjR5Uy9YWkVhdHFLOWlReVZDd2RQR21SZ0N0Tjk2U0NXTll4OURZ?=
 =?utf-8?B?cUdkUkRtc0ROQ1FNQUdsZjBwK3dVQ3graHVBVEdTNDBYUFVTaTVRNUc5VFlt?=
 =?utf-8?B?akRxTW55MDFqVDJlM3BLTVV5LzQ3VU9FVjgwclA5cm1LNklxMXRWSGNsWXVY?=
 =?utf-8?B?YmJZUUJPeW1rSzBFbGVVUHJ0Rnc5Sk1vOGFQVlpQYUJqUmFWVnc4U3RTVWtC?=
 =?utf-8?B?T3J4VHUvQjcwa0JOUmZQWmRrT1NZLzJ5c0xpQTJpd1hmZnFwQXAxVU5OUHkr?=
 =?utf-8?Q?45TYQDzVy8RJBBcLtoGDhm0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19d83cc-57f6-4e52-3eb7-08d9fcfb2726
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 09:49:47.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzZSjaepR4fdZsbyXyt6+tPbUE/yTzktDKQmjYin1gNStcgUjsXNOqe/fgh+rwA2s0wVajyV/qt18PqjXCD1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2735

We shouldn't include unsupported code by default, with not even a means
for its building to be disabled. Convert the dependency from merely
affecting the prompt's visibility to a real one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We could of course go further and make the default also account for
DEBUG, as is done elsewhere.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -193,14 +193,15 @@ config HVM_FEP
 	  If unsure, say N.
 
 config TBOOT
-	bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
-	default y if !PV_SHIM_EXCLUSIVE
+	bool "Xen tboot support (UNSUPPORTED)"
+	depends on UNSUPPORTED
+	default !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	---help---
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
 	  Technology (TXT)
 
-	  If unsure, say Y.
+	  If unsure, stay with the default.
 
 choice
 	prompt "Alignment of Xen image"


