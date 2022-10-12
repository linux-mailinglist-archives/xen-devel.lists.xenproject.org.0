Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B985FC08A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420722.665692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiV5l-0000oX-NQ; Wed, 12 Oct 2022 06:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420722.665692; Wed, 12 Oct 2022 06:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiV5l-0000mB-Kj; Wed, 12 Oct 2022 06:19:45 +0000
Received: by outflank-mailman (input) for mailman id 420722;
 Wed, 12 Oct 2022 06:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiV5k-0000m5-Gb
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:19:44 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00048.outbound.protection.outlook.com [40.107.0.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0688b6-49f5-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 08:19:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7289.eurprd04.prod.outlook.com (2603:10a6:102:8a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 06:19:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:19:40 +0000
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
X-Inumbo-ID: dc0688b6-49f5-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWNHtTTpJW4wlIRFKPIqCv+4M6vRkMelQCewCg8cwmJfbLh5GoUNmn38SLGHwOngg4diHxQcm7C8GE1roRPr5n/lZImJtEK4KLs2LN7WGmvYwtn55HvOnxyh0AaJ2Lsq8dGwgHrjbZ29XB0HPytLKHmIFDJ7wH68nI4LkPocYqQv9FzYXQ7nK3jwCwWzb/wzcko5ys00GBk8i5JafRUf8k9YapdpDUKtJAD0vOY22Baz6ZohSiK++xp6Ho8zEKwwh+jFeW/yIYn5WPP3tuef04GL2adrbXrgneaqazbklKM+33yqwp3Qz7sFFx5uwa5n5HThEtmZ1rlOVwFE8s7Vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoYfSbVMVBfFTdAfTBzG6lRq8XVvK8vP78Mm2MvdZ2w=;
 b=QfixR0YjQt75TdshC5hx/80tiMoOrmUlA+rytShNsxYCMJ5GKmxtOTQUwcxL8foCTXOlI56gD4usY2XSOrM+W19PEukGvoJxFB3c5smB5nGhPeUANQ3A16flX3/MUfsPPoK8B0vMeABO7H389elRn6gC/Cr47MlAFJkmokFxtrmm5IRqtphglK5tCRnmvX+NLm6IUwV5BzIzFsK/DYQklM6rvkw7ZWisG3x5WTkgb52fVRIR64VYeeJGJZEtMS7Qy5eWqroGlTyxt+6+pk3ltM7B+qd6FufH7lRDVZOCMMqUfB9DTY6AZrmCGirTzp5e45urHK2lTBYFIAKmg8vYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoYfSbVMVBfFTdAfTBzG6lRq8XVvK8vP78Mm2MvdZ2w=;
 b=4x/CCBtDVCNu0BNv8DTL6tPcZBR+ZCUoYA+uWhdg7IxT3a+IHrH83+DuBfKodt9LIe+AD48UvO9ybH1Sr9e+H/fJA5HFxgrmVwZXCh0nDNLZsayMAmrN/n3PN2pxOwnvjGPD7T8/qhc1C/+mqyk+W4Ln4QxmOlnOWJjxEwSTfeouV4pWIk+ShU+f/lk/E/M7KKL0O1T4etagdUuqRBEu2MZudN5TYwybG9b6h54WTLn2ybc2k/jO0Li5xJiPIZGxSu13+gaPNznm8CgAlBgH+V09qPKVG5R62loTXhxgyL1MQv3QlbvVtbvfB3csi/WG8W/BOwQJLjrrdwczv7JYKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5c8f764-6f2f-3848-6866-1a24db043964@suse.com>
Date: Wed, 12 Oct 2022 08:19:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1731eb-44f6-41c6-cb4e-51abf0c50052@suse.com> <Y0WfXttQHfFle2R7@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0WfXttQHfFle2R7@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0003.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d01091-6a05-4e8c-9de9-08daac19bf19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+NZiq99vpLZjmlc4am3SltaRUj/1Qm56dIWxNlyRUnnqgf+PVMc9wWlFVxjPmDx/9vw3RTUAuNuuB3nGD3tAXQhjW1afUjrd+Gcf2N+t1l8njnzhU41cAeRD26WF5hfnFvEslFt1c4HHHoN8gpq9fRBR9exRTeixWHFnhVypQ7B7NSkK58Z9nr5PX39MDPQ8av1VUMV39Ypgp0kEMo7p/9zixFRmVx8z0MAHOYm/XpbNnpX6MUGXyeEJIpV/ZZ5/FdDLzECyfuTrC2FZq+WBH2n6h67x76Q5nsKsH46LuEuU4o4rytPrdFcHNB07U/46AHTKcPCzi0OhFM8apCgFuHoZOMyYKwmU582cLzFgBwrM0LFJox6GwAVy5Qqv4UAb/bd8O7pJ6b6tX5eLVQxEd1fW+JTpSVUhQ+GfIaLxKVX8lVwAFhotM5Z5J9NqKZ/Lnp/EPrP4fLnO1TuqW2002cdXsis6kEnOccZ5sDYc8soI4gWEgYC6q1q6418yS+wnlkaZNcaAWFSOsH02Oj1lcauViksTRZfqMaqWtOXo1U5QKfVaRMRLJxOdfkgqleLlvLJ5ZdUOpQ5HyHNxugGrhYEZ/f2rJDLL1vgSNFXrWgZao4zWRx5D4HWboK0950nvsm4BQw5sKF8A3BeFm8sXq1vuGv3akdWULRvyhy+YbnXh8symKjzFDzMvLuBhO8PmmFGs9Shl/Rw3cGGhyaZMHsKwhpxcL1W98P0gZPibGl3PsCqDxGYbARiwhK0C1x4EGTTLvXaazMKF9wO7PxYkhJ54V0vqkxaEluGs0jHkqk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199015)(2616005)(31686004)(6666004)(6512007)(6506007)(31696002)(186003)(53546011)(36756003)(86362001)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(478600001)(6486002)(5660300002)(6916009)(54906003)(316002)(8936002)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNNVWhSaTBWVlZVUi9YWDRvNVBKdE9KZVo4aTNSWEI2TlZlSkZkYnpiYkR6?=
 =?utf-8?B?TEtaS1FrQm9TenRpZXBLV24wbUU3akIyUU9ybGd4TU5GVERyS2c2U3FhQTVw?=
 =?utf-8?B?emV6U1hjc3pnT1lwSk9WeUVRc2Q5M0tSanh4SERBeTJETE9PU0I2a2w1cTJk?=
 =?utf-8?B?Z3RzM1JpMjBwbWRRdWFUcStMUGtyclgrdXFEdGlSV2tOSWxVVmM0Qytjc3Q3?=
 =?utf-8?B?RCtPOS9XMXBWcnNqMCtzSUN0MW5TSVEvbzl0N0Q2eDY5aXdrSThIOG9uL2FW?=
 =?utf-8?B?c1JlSDdiNHppZ1VTK1cwT3JwMTAzNGZVMCtZQTgwdXR0dlI0SzQrMTlrQVlE?=
 =?utf-8?B?ZlpnVzVJbzB2cHJGSTN0UTdSb3RnT1Q5T1p4YWFkbEdMQjNDWWdSRFFld1l1?=
 =?utf-8?B?ODFPLzhVVndGNkl3Q1J5bWlyY0p6NVRxV25lWUFjTFphYU8wVjJ4Z0RrZkRq?=
 =?utf-8?B?di8za3VlZS9ub1MyQ2ZHTUYzdDhHM0pld3A4Q1UxVXVkcTgyc3BvTTJNYVUw?=
 =?utf-8?B?VkZZaEZTZDJ3bERidm5nZG1HWk1LUmwwQUxPQ3NKSDlpU3k5Q1Fhd2pJV1pK?=
 =?utf-8?B?K3pSeFpnN0laTXU1TmFoOU0yVW40T2F1VVZZSjJEUnRXN21La1N6ZkYyemFp?=
 =?utf-8?B?T1NTWlF5S3NlZ1JSQjQvV25JZUprQzZEdklHT01FMzJNRVVYcWFHMVNYbGpK?=
 =?utf-8?B?U3VBTG56SExaandlWllBeU5vZFZzei9rRFZ4QkR6WGhZRTVVVHlxRVRLdjBs?=
 =?utf-8?B?bE83MWMremUrS3ZrOUE3aTVQcWdUNGxBVHRSZy9yMEJVS1ZVaWVvK1A1L09G?=
 =?utf-8?B?b2k4aUVxbklCN25SUzIvOUgzeWJnZHRqQVpKUC94bWloMFVpZS9ka1hDWTlq?=
 =?utf-8?B?cG1lc1FyQ3hYNFJxUW9nNTd6d0owa015TGRaREM3bFJONVdDUzhzM0IvOVhq?=
 =?utf-8?B?U04vOEF5S3FyOUV3N1p3VnhSZU1DZzhFYTIxOEFndFpJNXgwSk5lT3dpLzVo?=
 =?utf-8?B?bCs5ZHNiWDd1cEViZVlUSzZUaUMraUhrQ0VaakZHdDdSNiswSm01TWw4amRk?=
 =?utf-8?B?OXZORjhQL3JlYmpXVDBaaGxtNGZPSFR2YnE1QWlXKzB2b0lINHNVYU5vblFD?=
 =?utf-8?B?azNyd1NNWSsvaDdoMkxOSnZBekhQWCtZL2RaQUwxTWErbFhWajFOSk9RSWxL?=
 =?utf-8?B?QWJ0MUpLRFl0OFAvK1M2ZmlpRFcrM200bW5KY2VQVHdONlVWZXY3M1hqMEZY?=
 =?utf-8?B?YTZCVXpPVkc2TFgvTGl5R1JsZ0RoeDBacVBZS0tUMmJmVU5id05XdTR3QXZq?=
 =?utf-8?B?dW5nQ3RVell5QlJjM1J2aGk3RzVEZHltVzdOK2FWOGJqVzFnQ0RoMWZSbDNB?=
 =?utf-8?B?b0Z3L1pVNFNuWjMxY3Y1amJ4VDhKWllCZFBIREZKb1VFREt0UmRXY0JKOUpy?=
 =?utf-8?B?VDltYm9tSm1uRmhneEE3RkJRY1dOQmRWSDJqclRLU3c0RDZxWUZnNURUNVRs?=
 =?utf-8?B?QjhXU2lDL0VnMkxjRklFNlFvallXb1F2NGNWTmJ1ZXdYWnVPd01nWmo1NFM1?=
 =?utf-8?B?YlY1TGwvN20vZE1MZU93U0RZQVhNU2htOU43dmZHSVBlT3pxa3JsWlN5Y0d5?=
 =?utf-8?B?K2EvaWhNMHBibkJYMGE5bGJ2SGkxZGxCN2YyNzRPSjh6cFNDS2NKdkFiL3V6?=
 =?utf-8?B?UnRBMzlPVWRMY1lqOXhOajFMMjFjaElxMG5pc21ZUWxpZDc2SzBDWXlPckhv?=
 =?utf-8?B?TDBDTFR6cVJsK28ya2NDZjY5a2ViU2grZExXaFpnVHVwdHhkVk9DSERuTU5K?=
 =?utf-8?B?SlluSU1WV0dWQ1Y1ekl0aW1kWXlVc3o5dHI1UDlQdndyQlhlaWZHQW1YbjVH?=
 =?utf-8?B?SmJ1WmVrUDZrVEZvM1dFQnJsYkJSRGlWd2VReTZrK2tUV1d3VVc4WER1dWdw?=
 =?utf-8?B?WjlGN01kS0hpcFJiUWtidmtNYy9ZejJ4U01MZExMWmdLYjlzamx6WTl3OXdP?=
 =?utf-8?B?RnRRQ2w2ZXphNFZRSkZvY0VhOVFMME1pWlVXYldFNythcEE5RmZnbzlEZStJ?=
 =?utf-8?B?VGZ1YXg0S1lhd3F0TTdqN1BLWWpqSk5IazcxUXhQV0p5SmZOQis3dHRaNDkx?=
 =?utf-8?B?U2ZodHFIWk56eFR1ZDJMVDJKWFVObzdLZm5Ob3NDa3VvaFV1b3g5VkMzZ2FO?=
 =?utf-8?Q?Y0TYkZlC5/P2lRyItwFY09+b2n3P1YiEvylKBeB+8AAv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d01091-6a05-4e8c-9de9-08daac19bf19
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:19:40.8352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVsVJiz3Q8wI+7P1VV0eknAn+5XFQx4ytrliNhnj3GnIJnSMgHXUqtgYUZbYSEmRyeA5BTUSIl3bHs6PNyZ5dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7289

On 11.10.2022 18:52, Demi Marie Obenour wrote:
> On Tue, Oct 11, 2022 at 11:59:01AM +0200, Jan Beulich wrote:
>> On 11.10.2022 05:42, Demi Marie Obenour wrote:
>>> A previous patch tried to get Linux to use the ESRT under Xen if it is
>>> in memory of type EfiRuntimeServicesData.  However, this turns out to be
>>> a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
>>> winds up fragmenting both the EFI page tables and the direct map,
>>
>> Can this statement please be made describe Xen, not Linux? Aiui at least
>> the directmap aspect doesn't apply to Xen.
> 
> Should it apply to Xen?  My understanding is that Ard’s statements
> regarding mismatched attributes refer to any kernel, not just Linux.
> You would be in a better position to judge that, though.

We run EFI runtime services functions on their own page tables (with
certain areas copied from the directmap). With EfiACPIReclaimMemory
converted to E820_ACPI we do not insert those ranges into the directmap
(i.e. no difference to EfiRuntimeServices*). At least this latter fact
means fragmentation effects - if they exist - are the same for both
types.

>>> and
>>> that EfiACPIReclaimMemory is a much better choice for this purpose.
>>
>> I think the "better" wants explaining here, without requiring people to
>> follow ...
> 
> Something like, “EfiACPIReclaimMemory is the correct type for
> configuration tables that are only used by the OS.”?

Preferably with "supposedly" inserted, unless you (or Ard) can point
out a place in the spec where this is actually written down.

Jan

