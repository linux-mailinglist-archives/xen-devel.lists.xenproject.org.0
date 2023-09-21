Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE47A944F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606411.944306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIxx-0001W8-FJ; Thu, 21 Sep 2023 12:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606411.944306; Thu, 21 Sep 2023 12:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIxx-0001Sj-CE; Thu, 21 Sep 2023 12:39:33 +0000
Received: by outflank-mailman (input) for mailman id 606411;
 Thu, 21 Sep 2023 12:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjIxw-0001Sb-A8
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:39:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e864badd-587b-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 14:39:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7276.eurprd04.prod.outlook.com (2603:10a6:102:8c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 12:39:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 12:39:00 +0000
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
X-Inumbo-ID: e864badd-587b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsG/LkzaiCDn1pWzVBdTN05CPi90BYhAXFjLdQ+lpMEcfIxp1IjHzJ+BJ8gxKwlY3edSpitvlRnN7pyYyjoh6AaDESVFdKDqOJ7LyycTvhSDpy08AiaJa6biBRXzJdCoezS51QY2N8QYpk+xlNcjmmAhhn/XL7Rprj4z9kZkgGcGdig6gt03xCnf7YEV/dcyLKRxXl6IYG/tkafMiRmnuqeY6wfDTK9nHr3MzVcMIGYKgw6mk1WY/+9rkNcjH6Z0cgze8naxCFhk9NsPF4XG6on+vaije4akQhpXi1toE//jcEZ32cIcBFkgiPNeLYe/JJ71ierUgEgydbykN6cUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re3sTetQCopVB3sggpRZXgo3/Dc/Naj2hY1hygO3it4=;
 b=doLJnrljyVjhRHM2miOAiEEqIeLgwAhNB23Be3dbgzuMr6T0CQJ1QHswCdZ5p4kSAc89uoEegWBC9PXCLqVP8iGvq5z9ZyxwEdIWzIEV59igu+MAlxAAp00nZI4n0EvzpsR0G+/X7vxDmMkzdHpNFpLw4OPqokVoqEsW4/xAVHs2urzoxdOJtwKCDswyiyt2lL226YnGGZ9Sy0u5+BygbOjgHwYgUaSgXFPuGKLTLJscSnCYaZrRDdx8kZHSsshZWfwM90xs/rbS4W1Syn+f7sGrPzslxztUtC4xUtP9sSro2lXSi4pyDWHHPAS6969INpMpC72nNHA9aBJ5DEgxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=re3sTetQCopVB3sggpRZXgo3/Dc/Naj2hY1hygO3it4=;
 b=IpI8rZL5faxOxiar7uHAEmBF+rw8v8199EqInyVXejVGz8Tzfzg8hgfK3lIMuJv1BZ+rL3wYO7Fo+kVh1IuySMXZAVUJb0kYzbYKnc3bBZS27+j7nBMJ8h6AHWIe4MYEdDDjIRteS0/q9utk3aCTRSR23+pfhMHJh/wzFUd+rJ659AFYNDgOHxju7axcL2hMxpvCaeNnyJTFjzf1oV2XIYqy5UwLGKu4JDGDFn76F+EV8/K3Egh/5wB0r1xQUG1TwaucRmChVR5+q7RraUslLTh/73pol5xnzjZoFgpN9wH5gDImPaIDdsT2R8AO4en5k0ifIMDGwy8FPgzpXmX66A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ba4e387-5f58-6828-9168-cab0ae3b3698@suse.com>
Date: Thu, 21 Sep 2023 14:38:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/paging: Delete update_cr3()'s do_locking parameter
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230920192153.1967618-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230920192153.1967618-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 58489dd3-27eb-4418-c9cb-08dbba9fbb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6eGC5YPCSvumLn4kRYeZvcj3LP4fb75Qe+3RCT8vEu8zFZzHgI2g/9vKmuGComc659ooyihLwB0ljvFrQgQ7dXkAOZY2Jq4GoZW6m6/RcLkK6yJbNXaxwp2VMZlm6gM2w+gYtaz0k4ajtm7Td/H/8jjsMMrNkDxGoUDTdwV5Fr1VRDAvqNsZaXDvqlrmPETwbiADTifz3ofFaxASoE+PH5gBcEYOFaXYI059I087ymIv1UoZEp+KBGO0WgZ/ADZP0K2pX7vzUAML8azMGCQb2QYRoMk1BY5CfkgrvlXrb5UG2l4iCx5xax2cs7GatSK9D7hiaZJT5RskvTG14j5UXzBFTV3mdTmh3cVG7ahK3mFf5hY8h9qujJ1YkT6B9SN344Pdv1UrlCOLK99VQElU97c3YX+9saLy1GtIvMPm9OIZI/zg2HAZzSCPIpJG+NRTF44HqzN7ZptDI4cvbbL4Oa9clb4OsRiIoot0x3IM04wkA+zei7HGPocx4K5q3YaGLwu3JWG6DkUcul/ga92hvRJQ8EdxDSMj7GOzfjkDXL/e7GQ52AncRPq5/xhqdnLK569DV9azuceIBz77sb9g9/iFfJLup51WU5UIrylCApGTPPRoRAKuILwO++FwIak8/efu4OOBoAQU/r3qV5qTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199024)(186009)(1800799009)(6666004)(6512007)(53546011)(6506007)(83380400001)(26005)(478600001)(2616005)(2906002)(8676002)(4326008)(66476007)(8936002)(66556008)(66946007)(54906003)(5660300002)(6916009)(41300700001)(316002)(6486002)(86362001)(38100700002)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdlS2I5elB4RWRhbmVjZnF4RFFmcjVnU2Y5Uk9rTzNoWER1V0lZYU9pNVJY?=
 =?utf-8?B?YWtiVEpRMU9aUmE5Wnk0RTRxMnZCMGE2Y3JjU0FscWxqRWpGT1pzMllJV2tX?=
 =?utf-8?B?akx4YkJnQktsaG5QWVZkZU4yUExNTlFqNnVQOVgzbnUyaEdXb2ozTHRyd1JY?=
 =?utf-8?B?bjl0UTlyWGgrc2xoQzlPbVlNT2E2bklYL3UzSFVNZWhDc1h2YkswNDFHOS9N?=
 =?utf-8?B?UlE1L2J5alNYTWlRZjJ3Wnd5ZW9aN085NDlPZThjdWRoRkNHT3p1TmlwQzRq?=
 =?utf-8?B?Szlwd3pMYkFtY05nODdpN0lBWitIcnlEUmVKYTRvcFNhc1hQOHJ6NHRXVzlJ?=
 =?utf-8?B?Y29DQ2JWMTdFTkNMa3VTRDcwN0F2UHlMRkZ2WWZRTHBEVDFqL1k1NEduVDFO?=
 =?utf-8?B?WlVlTWdSd0FucVdFUGhiMGdobGE2V3BiTVplZmpwdzVTOFB0OWo3S0pXRm85?=
 =?utf-8?B?VWdUblp2MXFhODhJTjVmT2lKYjdLdHRWS1BjOGRua2RoVlhPN05GeTNOTW1G?=
 =?utf-8?B?OWxKK1BkYzJWcFc5UjdBekZXck5nTDNhTVd3eTlsL3NaMmlaMnZHcm9QdG1n?=
 =?utf-8?B?TXB3anhRVDNWR1p0ZW9uZDlEdm93RnNtNy9DS2xVQUxFOFEwVGVVTW9QV0dE?=
 =?utf-8?B?elV3QlJRK3hMK2FCdWt2MzRjemVoeHBMTUhIcFJtWlc4U2RQWTNqTFo2bXRv?=
 =?utf-8?B?ekR4OTRzaHExOE9vMkFYcTlEQTY0MHN0ZnVRQ2NoeVAraFFtYi9HNkxGc2xy?=
 =?utf-8?B?U09LbWVpRUNibkYvM1A1U2xPVlN2NEhYb3gzU0JBUVBUelJLSFFvbUcxRHIz?=
 =?utf-8?B?YkZMUGZaT2JxWmlZaTI2THphWldLdFdxN3YxeFZRZzZSSVEyc0RUZm5BNE9x?=
 =?utf-8?B?M01yRjhTZlUrbU9YcVVaNDR1NzRmektwRytOS2k3dUt2UTV3SXVacHU3bDEr?=
 =?utf-8?B?bUhhdThCQmlaRFVDaDNjdnFLblZPZ1hUNTF1VlhZWDF6WFB4REpaTGgxN2lv?=
 =?utf-8?B?ZVRsdS90NDRvcUxSdlk5STdqWHU0aHVYWE1XeEtpUUxxYVRnUkEvUzZtMHZs?=
 =?utf-8?B?UHRqVEd3bEF6WVlWVElqYXZlRFYrWVY0UG9aRTlPYytmUjgyQTdwdFlWSmZk?=
 =?utf-8?B?UGVoSUFzdWVRSHYzTzVOeEpEZ0Jkd0tMM0djSWF4eFRZUFdwMmVZb280dG5j?=
 =?utf-8?B?RTBtU1RCS0d1cHZua2pqRXV3dTVUUTdweVpKNm9nQ1VXL1h1QUVPWmpnUXFr?=
 =?utf-8?B?cERDRFd5bzk0SWs5T1c5aHpETTNyelI1RTJsU21id0pUdFBiSUxobmgrRXVi?=
 =?utf-8?B?SmRZUzZvTDNWSHJRSmhnTkF5SGVxWHIwYVRSWWQ0N2QwVVo0SVlHcmNzUzNW?=
 =?utf-8?B?M3BzbFZIeUdTWDRVeFdUZTU0eStRNE9GZmFsSVNMdHM2Ui91OGtMNFl6WGhJ?=
 =?utf-8?B?Qi9kTnNGK3d6QTU4OTFxb2NCK29QMWZ6Z1NkQ2dpdEM1SjF2cmlyemRhZmZ6?=
 =?utf-8?B?QzBtaGprNFZJN0wyeGlNQTBpaHFNeWR3NFNpS2d3d01XbHFNZnBHSnh1c2la?=
 =?utf-8?B?OERPak91RDNJU2tpM1FrY2pSd2E0VkVUdVh6NVk2VFNBQ1JPbnllZFNkUWhw?=
 =?utf-8?B?Vkl2ZFlLVnlvTjBzS2tLK1hQZFFsem5wZHQ2YWdlSHg1ZDA5dnNpelNRNm9N?=
 =?utf-8?B?cDFCM2ViYXA5eC8wdno4SzE0Z0lyT0FMMjJWQzNmaVQ5RzZ2RXg3amtGcjNL?=
 =?utf-8?B?Q285YWJYNzB3c1NXelNSWUozRVJELzNCU1dKZ2c0NzJhWk5DdVFpaDMrU2NH?=
 =?utf-8?B?UFQ0SjJabXpJM3VTckhKKzkxMlhwdXZIajVmOUpjUzVJelBYRnhhZ2hSUWdQ?=
 =?utf-8?B?MEwwbk1na3pNTngyK0JDejI5YmVtbHZiNW1ySk01SXprTTBQSlBSek1nRlNu?=
 =?utf-8?B?MGVOTEcrZ0hnWHVYOGpRM3RwL2R5Y09ISnNFekt6WEJoT0MrVytFc1BZdkwv?=
 =?utf-8?B?d0V0bDZVZ09CcEE0d0NGbkRRZEUxbU1yN0lJVW5zcDVnOUdQaG1RZjhNWWoy?=
 =?utf-8?B?S01HOWF2WjgrdmdEeVBLSWR0Vlk5MlgvVjBjWWV6Vll3b0h4ZmIzbmhMalRS?=
 =?utf-8?Q?fhWOeD2AX6f1Jpdxdc8OU8soZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58489dd3-27eb-4418-c9cb-08dbba9fbb03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 12:39:00.5816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQguunx8FTGaBczvC9UZs8k+wnK16ypoIM+3PG8EudJtjfTjmLPhtWariB3fK7BO1f8J3NycUZf0hv92Me4iBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7276

On 20.09.2023 21:21, Andrew Cooper wrote:
> Nicola reports that the XSA-438 fix introduced new MISRA violations because of
> some incidental tidying it tried to do.  The parameter is useless, so resolve
> the MISRA regression by removing it.
> 
> hap_update_cr3() discards the parameter entirely, while sh_update_cr3() uses
> it to distinguish internal and external callers and therefore whether the
> paging lock should be taken.
> 
> However, we have paging_lock_recursive() for this purpose, which also avoids
> the ability for the shadow internal callers to accidentally not hold the lock.
> 
> Fixes: fb0ff49fe9f7 ("x86/shadow: defer releasing of PV's top-level shadow reference")
> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: George Dunlap <george.dunlap@eu.citrix.com>
> CC: Tim Deegan <tim@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Slightly RFC.  Only compile tested so far.

With shadow/none.c also suitably edited
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm a little surprised you introduce new uses of the (kind of odd) recursive lock,
when previously you voiced your dislike for our use of such. ("Kind of odd" because
unlike spin_lock_recursive(), only the potentially inner caller needs to use the
recursive form of the acquire.)

Jan

