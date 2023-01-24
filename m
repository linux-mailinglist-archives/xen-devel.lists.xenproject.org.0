Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16898679E37
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483612.749868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLqJ-0000vh-Nq; Tue, 24 Jan 2023 16:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483612.749868; Tue, 24 Jan 2023 16:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKLqJ-0000sq-Kk; Tue, 24 Jan 2023 16:08:15 +0000
Received: by outflank-mailman (input) for mailman id 483612;
 Tue, 24 Jan 2023 16:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKLqI-0000sk-Kk
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:08:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2079.outbound.protection.outlook.com [40.107.6.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4caae6ac-9c01-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 17:08:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8089.eurprd04.prod.outlook.com (2603:10a6:10:247::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 16:08:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:08:09 +0000
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
X-Inumbo-ID: 4caae6ac-9c01-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWks2c5qtXQ74PBPZkVspG150flSTyUbK45duJIq2Un9fSDkVsoYRjrNHjT3oz/kqHaMvLusJMHbWoSQ/N+L/nMQ/GSw2MdvIK60D0TMWwMPYNyVMfGCSFmArSYOnr+d/ro8ciufVblBAzsjRrTX2GS1f6PDyV19ZbQ/n6uZGOD0Yxubn2vkd7MwVkUE0B5dWzHZDKIyZehw7nLNe58h8lEdR1g1W8nTe3GtSUScRaxyzuZ0DaSGE5OqEtZsL5Mqbr8nRLGcQPmr5sezp6yS4MDvvv+7wf/A23Gu7v4FGpazkv9DD99gwgP1XcfJxPMH9n+yOXm9w8V3w8NgRPHj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNwknKSSwotwLR5xCl2QxXrTihZFnHtv9H4h8RfW9b0=;
 b=FPMoTMcoBSYWBztYlIjOXcN7mJHEHVIf98Kq2xfQWZcKyxsnU1df/zwAQJAjFA3/wVzdaeTlEwpRL7pTjQvAKELwrW0afOC5onq/mpvk1jSo8uUrrFV64AUeSFtiAqAHaI7TdVjQoFHceehqmYm8qXp7XKNNzoUKdBhI8I8aAXKeeV92Vrt9p/KwKO75gurubz/OgP9M7pQjX02asJb7w+uthoKLzUDNnA43F3TMdoHbzBzkm2VsdNgnVxqFxgXQgSCUA97ZvCCAlUOrwFY8lowHJx6LIKFrDuoSTy2lRODHSNQI4eEkMgN5y2iLfcYkM4T2tpraoZsUcXQWipa0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNwknKSSwotwLR5xCl2QxXrTihZFnHtv9H4h8RfW9b0=;
 b=ohABGAnaH38prMYykWQ7i3+GOu7ZSG9pwisgeVCqf1PbgGI6RiRFc3TU0qof2PyPgznYEUT70zSi2JNGsUPfxmSOFHbW2EirQrMZbtrWJKJyvv4ejzFZz5ZiZYrBHCddsrypAKhiyC9aHO95mboa2a5UWce02KlocM1HmUwn6V9HxBVllicdl0J5oWEx0UtlbfKjoJ7vQvnMbxSthTzZitLdrUrMTQ5oo1SYrxzUq0lhOkRsElXBDqui40zIGFNypJG0Fkkoms2HAFL6xm7AyUQlRLHRmFQgelNSZkUybpHWGc3hGOqevaYJs88mDZE6sXAIWD42NML5fJ0vvdupaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <023806c5-66f6-aeb2-d53d-7242f5dd7b1d@suse.com>
Date: Tue, 24 Jan 2023 17:08:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/5] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230124124142.38500-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 2977d795-e96a-4d21-6d89-08dafe252f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E6LZ2jlEgugkbm0ZmyRbizEIju2+DjzwbVke5TH2B/bJltGNzXOCIJ9y1Aj7oj8x89Dgk4jT80wDinYxmFFTRNlv1awPXhtSAUfd9548fNpccGC6YGLKkUp/ID5Rhy94Lc8eCCdLkvPlvLpIQIbkJ8Qs1a9V7mIUTfOflZAMZNtW9xxbPeaHG5j9GJp6BpY0wfQkXli03R/OxpCEnavzfrPMzWntXzAzVqA6U6yonTVR6lU6TvBExdtQQ9AkNxGNZzktxBr/d4+4pGF5LQU1fRrxbcjqGeijiX42x0irZ9i5ao/yJCDF5JY5e2jcfCFSXkyTH1SLhSz8zyfpZefPEabFhHS/4433m8HoWruy6le+hsyhoS1zV/jpZX3J4tceQRCsXCjs4dvNvdexj7uWXofNB4FVMlE3RoWpGkwYhSNmWCvK5BpvABi+9G7IBI2nqWR4vTVdQAGlb7Rn/ekOe1c88g23Ov24eUsdkG9WIuIv0Cy3/9bBTie0W8bW3HT2fLLQVtWixzzgWznlgdN29vzDjQUvOZE3NcnFZHkaTsEb7g+gPwo54W2bkww7JVT3HbJhK7TehVjaaWpZhcJzsXNT6NTllVVInOhXyDtkwyX2ifDxzPQS8j+O1c/uRrBG/c7hA/e7lQLtV1c8aEC9bvG4GMnGzRtItUpG3NOw9MZ+6NghZpfrwoSTmQWw+fSMxEO26Mro2Adb99me309xq5K8ivRQEUtqQzLwI6vYOdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(54906003)(31686004)(2906002)(6916009)(66476007)(6486002)(4326008)(66556008)(8676002)(2616005)(5660300002)(6512007)(8936002)(26005)(41300700001)(186003)(6506007)(66946007)(83380400001)(53546011)(38100700002)(31696002)(316002)(478600001)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUV6Vk1laFEwRXRnMWJUc3RzbWNWSHRSYTVydU1MRmt0emlwbmN2VDFoUzBY?=
 =?utf-8?B?NzQ2WW5Jc28ydG9GZjhKUHVYOEJES2UzcXhlQjVibmhJbTZmemFIZUx6VU9J?=
 =?utf-8?B?U3loeW92ZEZjcDJqbjhuTmhUL21QZDRxWlRZS01USzhhNDN3cnJheE1oTmti?=
 =?utf-8?B?Z1pXS1JvaGJvQVhxdXpuWXlQTEQwTkVGMDBzS25YOXllMFpxWlBGQU82Uzgv?=
 =?utf-8?B?QmNVajgxay9IYTk3R2FuZ29lRU9NbWxDdVJhZHpNaVBzYUJ5Z0RHTnJUbTFC?=
 =?utf-8?B?c1ZqTE1nS2xFSU5nTjVEdlJQcDA2OUdva1RXRG9XemF2YlYxbnptcjFnNGpE?=
 =?utf-8?B?c3hvemMzVUQwNmhUUFBVVklWZ0loZCswYmYvakVkeXpIZjVjekdROThNR3Vy?=
 =?utf-8?B?QVo5dG45TzdheEowaGpudEVkckF0TEluRDgrRlZqK0RqUElKdW9jZmlhTHNo?=
 =?utf-8?B?bnJxUnd2OXI5ajFGdjdVSDEwRCtMeGJCL2NnNWQzQW1uZHZaTC9Ha2tIQ1Bk?=
 =?utf-8?B?cGJUaXVTZkZ1aU5xcnpyZ1lHVjN5ZU0rZzZSTTQzMGNQZ3VVUHI0dC9WVXBw?=
 =?utf-8?B?VnQvN2oxZzE3QmlMemlpNTluQXVGaUNkTW9YTURLeHRtVUZGOU5wUUFOVXdQ?=
 =?utf-8?B?ZjMvYnJEZ0YvT3NDcVRoU2FHWllxSlpNYkVWWkViZWo0NWlFS3BrZVlwTUlE?=
 =?utf-8?B?WDlmS0JwOWx0ZXJyQjZXRU1rMHMrZ2RvZEt1ZHlhK2MrOUV3c2NkcTZiOXBa?=
 =?utf-8?B?ZW96eVRwNlhWV25zSzlNbWpOWW93R3grM2MyZnFYZ2RGa25ueldRaWlPZ1Vp?=
 =?utf-8?B?Qm42T1A0THExU0k3OFl3a0tTVDhFUEZMYkYzNVg0c0JUOG5pd2QwN2g2N1Vm?=
 =?utf-8?B?bWRSVi9FTkc2SlNocUlDclZFZ2JTcmtCTHM4NVlkblV5Uk91Q1dIS1JRY3JC?=
 =?utf-8?B?Y3ZKMFJnZ1hRcVBmZ0MyNVJDcWJFUyt2K05ham53aisyQnZ0QnV6OVNUeGFT?=
 =?utf-8?B?Ni9sMmNxNGNwd0NnMTNRcFU4cXd4Wkcxa05FWVJsbU4zQVJuN1lkNG5mYmtq?=
 =?utf-8?B?c1J0N1FzQmhiUndiRnhVTEJnR3IzcXJIWjYzQjlxMWN0MExHaXJuQlhaZng3?=
 =?utf-8?B?WXIwU0tCZS8yaXVwbDVlL0N4MC9TT0NhenhZc1haWHJyTnRQeC8wRk1qSlM2?=
 =?utf-8?B?VDNqQnZvSlZjTkJuY1ZNeEVpUTdpUklIL1NJTFlDZkF6d2xWSGsrVGhXTFhl?=
 =?utf-8?B?SDhjR1ZEcmtyS1d2ZkdOMjBVNFh6bm1NVmJxWHNsZXhGVDRUaCtZN1VpME5u?=
 =?utf-8?B?bjcrT2oydHROa2daaGNRdFh6S2NXRmN0cGx0QjVDSmtRNnI3SjhIRm14WXZ0?=
 =?utf-8?B?eGdNMXJoMFNla1l2WG9IUk5uSGZsNzRMbGVJQStMRllVbTVaQlZNa3dXZExz?=
 =?utf-8?B?b3Q4NllKZGlxMjNWQk1hM09OSzRGUFVJM1dITENyOEJZRGZiVnBjV3M0Q0ZZ?=
 =?utf-8?B?d3lBYWtxeURXTk9tV1huMkxMcFRLckdXQVNaUkdjZjhUa3BqbVlYZFhJSkFy?=
 =?utf-8?B?K1ErUVQwNGVSUHl4clFjeEd4emgzSlY2L09FOGFYbFNxZHArcnc3TWVUNFFL?=
 =?utf-8?B?UEkwOEx6dm9MekdxYmtubDBYdlAvM0l1U0ZvME9XSUJBWFZlKy9DVlRkSmRL?=
 =?utf-8?B?TWQraXozeWtIRGxXcXVTMHpkTEoyWXRyU1lsamxvMU5Ia1VaVUJOeU5MTzU5?=
 =?utf-8?B?bXpSRGhlejU4QXJhUmxIMXJHNnRpcVJRT1ZkRE5PdXhsTVRoejdIaE55enN4?=
 =?utf-8?B?UVRLazUzMVcvbXdhZ3NzVzJ6a2UrWjk3QjdRTEVBZmM5Tm5OZXoyVkVwOTVD?=
 =?utf-8?B?ZGV5OUxqaTNpVmk4aHlMa0YzRk9JWEZ1YWNRTkc4R3prT0NwVVFhOWZjaitS?=
 =?utf-8?B?L2RObm5Vai9HMW5uWXRFYkh1LzBrQTVTbG4rczd1bHpVd2diUitDWWhrWVhC?=
 =?utf-8?B?TWZON09hZTJiTmlQc1N5ejdtbHRoMWRGNmZBbk5tRlJOR1JRYnZJbFlHOWd4?=
 =?utf-8?B?YXkvd3Y5dzR5RkFEY1V0eVZrZUxqT3FKSlo2TWFZL0JjOU9NdTNVVVhrZXFq?=
 =?utf-8?Q?SMfBviNJzQ+jSY/8aoE5o+ieX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2977d795-e96a-4d21-6d89-08dafe252f95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:08:09.3788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l435T9KB7Fghhi2PunJZOvLtFGjFnUnTmvavLqy+WGTq4w+zzjpHW7Xfgu1WvcEywIXPGVME8UcTYMaewztZCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8089

On 24.01.2023 13:41, Xenia Ragiadakou wrote:
> Posted interrupt support in Xen is currently implemented only for the
> Intel platforms. Instead of calling directly pi_update_irte() from the
> common hvm code, add a pi_update_irte callback to the hvm_function_table.
> Then, create a wrapper function hvm_pi_update_irte() to be used by the
> common hvm code.
> 
> In the pi_update_irte callback prototype, pass the vcpu as first parameter
> instead of the posted-interrupt descriptor that is platform specific, and
> remove the const qualifier from the parameter gvec since it is not needed
> and because it does not compile with the alternative code patching in use.
> 
> Since the posted interrupt descriptor is Intel VT-x specific while
> msi_msg_write_remap_rte is iommu specific, open code pi_update_irte() inside
> vmx_pi_update_irte() but replace msi_msg_write_remap_rte() with generic
> iommu_update_ire_from_msi(). That way vmx_pi_update_irte() is not bound to
> Intel VT-d anymore.
> 
> Remove the now unused pi_update_irte() implementation.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



