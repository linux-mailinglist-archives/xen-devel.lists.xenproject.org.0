Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD649731BE1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549660.858311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oNU-0004uL-Hb; Thu, 15 Jun 2023 14:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549660.858311; Thu, 15 Jun 2023 14:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9oNU-0004sg-Dv; Thu, 15 Jun 2023 14:55:12 +0000
Received: by outflank-mailman (input) for mailman id 549660;
 Thu, 15 Jun 2023 14:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9oNT-0004sY-Df
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:55:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f4addf2-0b8c-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 16:55:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9259.eurprd04.prod.outlook.com (2603:10a6:10:371::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.28; Thu, 15 Jun
 2023 14:54:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 14:54:40 +0000
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
X-Inumbo-ID: 9f4addf2-0b8c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjSfcjrSpxHlX7SdcEKfSlAGLyXQC0f96ZiYqKVFDnFdit3UeM2hJyccjkCsDYlpdHkO9piG3WZS/fvHmq+T2Bm0EV4gPtZS0fL+u9SoSdmkiLt70m7Akw+19JPR/wPiNzcm5hCYfq1e2Lbut4K43XsrS5jaf9AJsK+Eu9AWxNFTJ1skKqX4TrOckzFYPqZNWu0qcrxnjPrFySxCFyJ8B8DTkRuD2mNfwGRJZCEhgTd+DpVxG8V8p0uo2sNthYkE/yaqcV341uo7UT3Jm2ISf9DX+uGVNmeGw8AQ/Fp9XlcnLFlu5Xmbq0aoIA0nJlFbUqCyUd1Cx4emEqH9ARtYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Csk19f7zKgjYkgkNipWNOArhMZJoVpmcCMF/R/YGjqw=;
 b=X3Ska4ax/zUVBYDpdaZccTagwkTgWx0JShwNS2Uoct395u0rT5EgieSf8ujHH97eB+j6xk3wE7aMXS2igMrIG9XCoXgfLPnaBSUjGw4pSozmOeQ0h6L2G5fIktKetOLuRFElMmLeuJn4e7CFiuXU4vrcP5URgZsYs0+yTReS6NxFwQA4p+M9ExY7E5SyDd2S1/Urn/tQhES8xceKn5D/JCitmjaRIjNqfmerWj0LrTqIFFQF7nyMTiHoOYkETjGUR8iQGdIH1p6YiLRZul/vC3DZYlOLOj0wtCtPMajSH4H/Zi/yXToj06DPJ0FHEkTQglIDB5ta20zQaGLZzXZFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Csk19f7zKgjYkgkNipWNOArhMZJoVpmcCMF/R/YGjqw=;
 b=bVxXS5H0I7EsRiVtf/EO366H7OOAG6neetinG5I5EAHknWrNx//NAcPnKruTz1blOzRPXZsxGJBVPnHCeiXhKylqFJ+HI8iQh/JA8dQdl6V4iSWCAPJh4UrdSAZ52b2HI6WEIzRNjyked9kKoIMiw3q5vkRfRu8BHiZ+Um+yhPwG9BF9nXtA8IAPNtPr02qHyMTRl3RKeaUZNBTgeCV8KFA9K+c25GfTqzK2Zn5WkYSZMiXVr7qIJeQleWmS0r8ZkRJqVUL/EKgvlN5ugeYUCe++aO68fY7+Fk7jfOSrQBQWIA5pyWhrHNSVOhd48O209JNMqZVXqerkiwEqUJ3uAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaac83a2-8254-76b4-9bab-411e1e323851@suse.com>
Date: Thu, 15 Jun 2023 16:54:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/vPIT: account for "counter stopped" time
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: a5698416-3403-4961-cb5b-08db6db07215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kQ8iBJi59uIMCvzVl2x4CLfCuhQFh3AqdNj/T9CYpDM80oAZs1Px9rWTbu99jsnfnD6tEpUyIrO1IWi6HuktTRtr6w2AoKp4zFcDIAM7KlLKNIAob6hojlQ29jQiEN9vTx9/7XW3RyiuKhinCaje4/HbSH+PS+k5jKA2DwFD6G2dm6Ywo7snvajjMyhCd7LR7lJvaCUFJDVL/IZKog7YApr1otaJdpXSM9CJmshi8Qs7kQbSZc0A+jyJ54J/tLDyf1gKe8DebvECoNB7hy6JyONOj1mqmXB9L8DCzJL90Czc0uS1Py41xmzkYKElRc2i5xvINqYGcRQS5l6YjNoo0H2uVZDrstziydTj0GA/GWh9vEK/MY4uDtXoXe8HugtTj8D6t890H48n0cLjImTrGTptZyS3dlpwP+f3J0evI5lXN2vaSi7KAOYNdO9JkX1ZyAAd7H/lsanykxRZS0fPd+tehvELwnJL3ZiD4NYJbp5xxEMZsQUQ+6ABGX8O1KcglApE7mi+tcHRzDv0MkEk1Jv/vyJotGYTh27gmBUX5zt0RkVMKLsQ8zl/ZuZrSVlWAAqEFinErqyktAxdVljbo2JxFuOX6uurQ3o5/2YwpJpW79elQzD4fKuawKTIP247lQ5PkiJ1Mxt4l4stL/0byw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36756003)(31696002)(86362001)(2616005)(558084003)(66946007)(66556008)(66476007)(478600001)(6916009)(4326008)(316002)(54906003)(5660300002)(15650500001)(8936002)(41300700001)(2906002)(38100700002)(8676002)(6486002)(6512007)(6506007)(186003)(26005)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTdaNG4rUVU3MlZDeVV6NThEZlA5Y1pBa0dEckVyUTBqVTJJZmljOWRrL0VP?=
 =?utf-8?B?VUdQcnRmYnFiV3RiOTdRdUFaNW15YkdhckYxY2dRL0lRenV6YXJzRkg1Snp6?=
 =?utf-8?B?Q2I3WFp2cFl6SDgvYnM3RU03d3E1VmMrTGx3a2J0S0MvZW4vUGl0Wk1sVTFp?=
 =?utf-8?B?cjZtemdtWDhvR0RFWGFRcWJpWktWaU5LKzRkNFNjKzZvODJNUDNjK1ZUQ3c1?=
 =?utf-8?B?WWJhS1NQUHNhVkt2N3I2SDQ0SzlwYlZ5ZXNLUjZuQjJ2QVlYSWk2RWlzRWZ5?=
 =?utf-8?B?ZTIwajNuallRSDNvQVpsWVNBSE16cFBzSmVWNVM2YWlpVEtNMktVMEo5aUhD?=
 =?utf-8?B?VUtkamFNUEdLdUNiVFNMMDVYSXdEd0d2Vzlma25PcGxCem5QdkJuTTV0Mk95?=
 =?utf-8?B?czlId1NFVTRvOHRoZngzYlFrd2hsVXYzT2NlZC9aSmpZendqTmppRXlTTWxn?=
 =?utf-8?B?NlB3SEpMa1BVK20vSVAxNlhXNkp1SGZmS3FGMFZFRzhGT05ISUZHTnE3Vjc0?=
 =?utf-8?B?aEcxT2gzNERrUXZJOEpCT0FOWFlBY3U2eTlXMmVJRXFHQmNORS9mK1RDZ3dP?=
 =?utf-8?B?S0lqaFBaZzdCL3JIcjdPaXBObUZ2TG94WWRJWVVoOWxpMytVM1VXalpGRUxn?=
 =?utf-8?B?cmxUY1plak1RTEJVY1k5YXBIUUh1NWQ0dW5MaUxlZmJOclo3ckxOL2NrMENa?=
 =?utf-8?B?ZThQTzlUYTBJQ1VBM281NUhldjdRQjNRRHh0QlNPenJpS0l6V1I3emNXcG9x?=
 =?utf-8?B?YzFVamM3TTljTW8raUp4RmdxOWN0a3M4d1Z1bHRseDVyMWJUVklwZm0ydXA4?=
 =?utf-8?B?Y2RyZjZhVWp5YVprd1Z3dGF2YkMzbXZWVEJYWC9kV2Rxc1RkNHVJZ3Q1T1cx?=
 =?utf-8?B?dE14VVJDdnJuMXVmUCsxZXRMN2JUM0lld245c0tsR2FiY1dVOU0zM2xTQkIy?=
 =?utf-8?B?MlVBMmtSSlZNRDBqUTIvVFZtVDk2Qyt2bkJPcGFuZUtQUnJ2S2NYQ2JIUEgz?=
 =?utf-8?B?M2NKdzFOL01ERndjR1gycVRkNDVncWhHa0tVYUpFcmtvMDNrckxJWUNJbnZl?=
 =?utf-8?B?bi90end2NlZuU3E2YUV1a0t2by9UT0xVMlV2cENkV1lKTHBXdy9sdCtNZEVw?=
 =?utf-8?B?QTNDVjVEdnVpOXEySGJBV2NMemM3ckc2VHNOMCtwK0VIZDhEQXVKd1czOTZ3?=
 =?utf-8?B?SG5nbHMxbVJjc2piV3RpaWJtcld2UGZocW9mZnJnY0xNbFFKWWh2R01hTWtr?=
 =?utf-8?B?dlNtZ2V1OW9rOHd2RHVYaFdTdHZIMU1zeU9yd2thcFV5UHlkNnZzeU01RXcz?=
 =?utf-8?B?eGZ2eC9QNXlZd0RNRDI4NzFHSlhoSC9WdVd3bHJNTFo0aGZvSWt6T0o3ZWo3?=
 =?utf-8?B?eTc3NS9DbGdOazR2aHFrRlVoTGZrQ01HRWJ5UWpaeWw5WUp2ZTJZemIrMTdT?=
 =?utf-8?B?TGl3WFdHa2Y1dEZqNUFmM0tPamFJb2JGWUd0V3Y4a2x3RGM4RnpCWTN0MjJ6?=
 =?utf-8?B?U25LdDdtMEtvU21xd3Jjb0hDVUxibXVCTXRFUjM2bFAzbHAxZlFxRkJ6Y0VO?=
 =?utf-8?B?OHVYeFR5ZVYyenA5K2taZ1p4NjN0cnBQdy95RWR3YytzVEE4ZFA4M21uRWs2?=
 =?utf-8?B?eDRSQUNqTmI5RThhOXk4clNkWEsxVFNJOGVWU0dSeTd1alhZOVlHSExmU1lw?=
 =?utf-8?B?Q0RWb0g3RzRSczdaREorM21vaTZoL1NwbDlXM0tUNFJ3elVDNUs1Z2tiSUJD?=
 =?utf-8?B?ejA5Vm5nMkY2ZHNiZGZDMkdLbjhGbmM1MlpWS2lBc0JWTmdtS3YwbmlpdUE4?=
 =?utf-8?B?SktyVG5CdkJSRWd4aG12Ui9iMllhSVJ6SDF4aDB4UlNzYzYzckJDa1FJRXRl?=
 =?utf-8?B?WVZiUlpjekMydmtZdFkveVBTdEZDUHJsdWlSakR3ZnNUZEVJb01KN3VtOGxY?=
 =?utf-8?B?enBsVHhlc0grQWU4cDdQQTh2VGZ3eHp0cmp2ZHZ3M0U0WkhGa2pUOGxUdmxI?=
 =?utf-8?B?NGR5LzRoK1hQR2w4aGQ2VUFPUisvTy9JTC8ycVZNcmREUHdQSWhMM0o0YmhS?=
 =?utf-8?B?akNONkhXT2RuQWNLd3h3cDlIVUxyYU56d2JrdWhGZkZWM2lwU3BrbEpWbUxm?=
 =?utf-8?Q?IVViV8Kw3gMTtHG9iJCFmAu6N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5698416-3403-4961-cb5b-08db6db07215
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:54:40.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XALku0NIV3NdAyC3wVPRDSo3hioqvDYJ8+xqacXw9/WrDuhmMh+evtkLgzizEAjdchHCvsgzVGEfjmndv0l6Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9259

This addresses an observation made while putting together "x86: detect
PIT aliasing on ports other than 0x4[0-3]".

1: re-order functions
2: account for "counter stopped" time

Jan

