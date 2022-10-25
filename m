Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2722260CFD9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 17:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429916.681265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLS2-0002Um-Ks; Tue, 25 Oct 2022 15:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429916.681265; Tue, 25 Oct 2022 15:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLS2-0002Sz-Hn; Tue, 25 Oct 2022 15:02:46 +0000
Received: by outflank-mailman (input) for mailman id 429916;
 Tue, 25 Oct 2022 15:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onLS0-0002Sr-G7
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 15:02:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13dfc05f-5476-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 17:02:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 15:02:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 15:02:42 +0000
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
X-Inumbo-ID: 13dfc05f-5476-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVStPIylbpR67cYUM9R8oGwycs9kqzDUr3CZSqk1VKkyUrQ7ZDPfljTFM2Zhc9KviMXWMKeKVcPI87h4izt17iuKPU/WwUo5NYQHtYjH6pkBBj8nciNXStAzLHKLSToHk8tKEqcmCDGHUEug0KYSelFp+n9GLws+qijCsqkK6wAcUf5q8HziCdLBOCD2c0BJE8SItWswevrX504lmz9lf/qUgmwUhu+2S2s5W13W2XH6YdJkvn6uIZ0aAlnw+TjMwJWpZHV2euAD7C5G47TdmwwN99RZw0zyLXXKFnAN4sLbPZmQqiiXAe+4ukQK0aAKY28NXHBavRIk6Nk30ARZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6pOxUAjFyK1FK5TvcDLcFUo9wRTgl/tT+vOBnYDtIU=;
 b=OVyC1NQQBbpiIEQIHQWuRbpFo44J9mm+WautaZRsPmu107hNYA901M38DzMyLLze8Mhv7VnAfQCTdwijIt0jrCAKS4pdHWOWI0utlM5TnUF/I2PvBb3D7Fy1tyCp0ssvFVB15TyjKVPsdpqSYhdaugNQja4l3qh6vjcq6mzEK4Z4B7LSupwcbOYueH4O2K8dOQ8ZDoflGBkQTC8BP/ceCjnonS6lw/S24peTP+j87MW/mHINqsUtrEWf6BsBMOtHOpyGY5uajWATsoNqv8WXq1pdjClKZv1yEfHocDl3K7t3qiDluTgySS7w9V+CT+PsuzBnPNc8eenBmuJCcY28/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6pOxUAjFyK1FK5TvcDLcFUo9wRTgl/tT+vOBnYDtIU=;
 b=gwdCZL/+x5OwgbRLr0a+K2CXnK7aMFt7RHv7JvD0VdoNzaTzffVama0ZB9+RhJTyw9xQHTXk5We0S3FMADl+jl5L7YAOXgwN+/V6hWd5NPQ28MIVIxcGwzyk8CptaAvs13YFjNl3MPHqcfaVgxCjOHlhXjY3NacTh9sEzJZ3omBLyBscHv+BPrSY797anegEugZJT7VC0Yi7Bz+ve4wQs87f1fqR2qM2fY8noMlVsP6KYE5fmOGliMCjqPL2Fyg6NAjp1bVHTRel+qFuf/2Ey0FRlTTfN90jnGCVfZaTK11qRop7wK2C/m3yJm6KqBltR+TWMUjdQP2YeQCZffwMUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a89c0fb-3d12-fcf9-7e53-d32f9904a3f6@suse.com>
Date: Tue, 25 Oct 2022 17:02:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v2 0/5] (v)pci: fixes related to memory decoding
 handling
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221025144418.66800-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: dff08e00-483a-49eb-800c-08dab699f790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g9iXAhqokr7y1dWuTv0kK7U6L7Vv9j0MWHzc16R2BB1ChghXHomFGLKy8v+n9l6qQ8TaJhDnz1N2ahdRo52r80W3fISdKX0ZONYpkXOMKBxw0j3QZ6OZpb1xWJAhqd72lvEMHhl+Y0S6zELEbt+v3RuwGOOyJRnoEP7fRifuaKj6JCq3wkhzyZSun1WcQSafKTaMvyQqn9jW9xG7psrL7vTvw3fgzUJz6cph92TUvvnrD3tD8P1uVU1P5F02VHTi7J/20JoyCCzVtvFVw6feaeOUMtlTyZpPbZbC9VSKI5h/xRSZdXbN78eezaUQmtz8PKgDuvb1a5z05BYWvE3zSByR3DE/z3c9v2Jah4N4l9BolF71WzM1Ihc+m+uKhlMJbcW2sH5iEupY+KZYJHvo0C1INZqeYd002YStji647UipxcRSGmSqS3igRmsN/0LJnov7vFALTKOj1hjjSPWGNItv+/zCqmoyGNLmH0+Z1FPx1bbR3tSxjiTCWtLMCjoJHH2HFC1Ayf/zsqq29T02T2coxw+t1wl7bL3fh9rchMNLHa6AQ2AaXum7Yw5MxTh01shbldzO/5hFq8nMpiUFIi9W8XuwxhdhHmSOGD4bQT6Xykd95hs6Lr9HSoTTWVoz5/+OAvF3Me0gF/AAaLhNCAioANy2L7hlmhKR7mmIC5OxaLzh1G7i9d+ezIrAtrllo+6agFydvJ5n+KRMaoI4kwxXAh8TrCmZciwfS2k8SfMMNVgULj8kqYcpmPD7PSxSEmeu61tZ0m+ji17Sl2eYUAGsoQFoQqt4oWH25P9iWXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(478600001)(6486002)(41300700001)(8936002)(4326008)(5660300002)(6916009)(66556008)(316002)(8676002)(66946007)(36756003)(66476007)(83380400001)(38100700002)(86362001)(6506007)(53546011)(31696002)(26005)(2616005)(6512007)(186003)(4744005)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi96U2ZqdVdXb3pPUXJrUldWVDl1dnhGOEhsMlBMa2NKb0x3KzRIdTJSUlBx?=
 =?utf-8?B?SGM3WWI2dGt5RjRSalQwVmh2UmtqTG9JZGswUEh6dUhmRGw5ckJkMzVyWHND?=
 =?utf-8?B?T3k3Q0JBVWFaeE1IUGhIMnNXUFZCL2tydktKeGh5clJWcUlUZ25QaUtVU1hG?=
 =?utf-8?B?R0lDcFp3eTl5aFU2b3ZETWlsaDlWRnk2V3JlcndLdHlVMWxKRitsM2syb1RK?=
 =?utf-8?B?d2VFNFVRaFJCbWk0YWxtUlFPdklBTDkyaE4rMzBBQnUwUVJXcjZzK3FTZ1kv?=
 =?utf-8?B?bE85MFNuLzN5OHJSZ0tjbGpwOE9tZjA1UXM4YVNBRGt4Uzk2dW53NHJsNVJP?=
 =?utf-8?B?TjNuSC9sWld5Yy9RUnZmZExyOGdXWG1oM2puMWdIWjdSQjhCOWNweUo3cDhW?=
 =?utf-8?B?M0liT0lUakpNa3ZWZS8rZFhqcnBYbTBSTkpRbzU2ZEhWUHgzci9sRURQWGtk?=
 =?utf-8?B?Wkd2K3F6TUthVjNTMERwbTRHNjl1Sy9zcEdjNm12eUFuM3ZVZzQzYS8rcWxn?=
 =?utf-8?B?TGJBY3kreFcxUWozM1VVOHZUZU5QOC9qSnk0ZW5CRWRXNkRUTFhzbXRZZExv?=
 =?utf-8?B?K1lGZXlwTHdxeVRFemNBZzQ1SWphQ3N3UzFjZXNWZGxLUGdSSmY1cmJGNFln?=
 =?utf-8?B?aVRNUDU5VitwMUxOaXc1cFM0bFFWRHhjbWhFcVFMK0h5bk45Q0Z1bzJIQTF2?=
 =?utf-8?B?NlJTZ0J2TkVmckg5Nkp4K2ZlOU1zVTFvWlZQNklHOHVFTU03UVh5YUlVdjFn?=
 =?utf-8?B?SUhDeFJScmlMSnZ6a2FKVUNjRkQ3TFU2UGhnSjNpSEl6RXc5cXpJYm5JYVhl?=
 =?utf-8?B?c0RnTklqejFOdDNTNER4SktWV0xWR1RNdEI4c1FxR0hoSUN2R0tjOGN4b2Vi?=
 =?utf-8?B?cU45ZkRtS05nMnBrcm90QWpFYWlVdzN3Q1Y1dTlrcDA0YlZSMmtYQkhWZmZp?=
 =?utf-8?B?QVVzZS9iNDB5ZFhLR0E4NDJpRmtiSFNXWjNzcFFjaUJlK2w3aUVqRUEyRG9M?=
 =?utf-8?B?c2g2bFFGSTI0enp0ak8xQjZXN3B6a1lUK3NSV014MDhnd2RVR2FiUTBTYnMy?=
 =?utf-8?B?MEtEVEl3ZDBTczE3WFBnSS81cXoveklsRkVnQm9lS3lFb3FNdWtqR2FOQ3Uv?=
 =?utf-8?B?S0kvRXF2elc5NzlyM2Rxc1pTRmE1bXFVMzBOY3gyTXA5U3EwVy9MR1NHa00y?=
 =?utf-8?B?UXFiY3YwTXJjajAvVnJVSnVNNmJzZVVEc05sVFJiVDBDK2sxRHdoTk9JQWpR?=
 =?utf-8?B?cGVUclFQYWovcWU2cFVOT3lYM3hVVXNnUEpSdi8zUG5rb0VoMzNtYTFJUkFz?=
 =?utf-8?B?dzJnMS9YYURSZDkzWGZlZzl5ZUNSR1NSNzFST0IwY2NESTIrd0FUNXdueXhF?=
 =?utf-8?B?ZFFVVDI5NkVCSFhuMHcrTEx1ZWhaKzJCSkhGMlE4QXlnVmZnMTN3d1Azcy9k?=
 =?utf-8?B?Zmp6bGNUbWNsdWl3VjdpSEdKc05ENnZnOEJFRDczcjN2RTI2RWJyNnlVeUJD?=
 =?utf-8?B?Y3Y5N2Q5eXd6SVJjRDEvd0ZmUzRSR1VmMUh0YzhqbU1MN2YyeWxCcjIvL01W?=
 =?utf-8?B?M0M2K3pWZ3JydjZYZVplbGdzNWprQ2c3TUF4NExCbG5aNkROdTg3aHladUJa?=
 =?utf-8?B?S1hwSVRWb1NiWm4vNS8wQVVjSVhEZ3lFSEJKaXBmMG5YZ1JZc0x0QUFWbDhV?=
 =?utf-8?B?LytTVWxDendjQmZnQlM2L1JpL09rN3dMMXFiMmFNTi9hRjBSTElsUkxoZ0pX?=
 =?utf-8?B?Y1QvcXhIcHRoa0lKUVNnQ2dTeFEwbVEwYklPM054anVQRmc0aW5kbWkwTCsw?=
 =?utf-8?B?dDgrOHRWalVVNzlBVDVoZG0wLzZycjRmd0hLR01UZkN3MTJXTXBmWGl2ekJx?=
 =?utf-8?B?YWdmdTVhZW50ZjBPbnZxTGlsSXU4TDZsaWtxQjYvckt5aFAvRy84b2VETkxq?=
 =?utf-8?B?QmJMQkxkU3liYWxqR1p2OStTOGk2eEZzbE5oTFZkZ0pEa1Q4ZDRlK3ZLS25X?=
 =?utf-8?B?VzVNK2tTUFE4dEVRdTZDU1AvMzcrMWN6cXBaOXF2QkNNRVlpWjNrTFRRUXo5?=
 =?utf-8?B?WVAwK0xzVUdROFh4M3hRZWVrVi9zMTEraDRhRGR5dEJleU42dkdSdWgzd1lw?=
 =?utf-8?Q?xqwsHl4JTC4GBRvtW273yiyl7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff08e00-483a-49eb-800c-08dab699f790
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:02:42.7290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFIS/9AqQq6HNWLKcco0lsgXI0bDsfiO3RQMyDosho2zQefD1ji+Ov1tlILy8HwBwhu9+AVuCaEYVlp+xlW5Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

On 25.10.2022 16:44, Roger Pau Monne wrote:
> Hello,
> 
> This patch series attempts to fix the regressions caused by 75cc460a1b
> ('xen/pci: detect when BARs are not suitably positioned') and the last
> patch relaxes the check done when attempting to write to BARs with
> memory decoding enabled.
> 
> I consider all of them bug fixes, albeit the last patch is not fixing a
> regression (since vPCI code has always behaved this way).
> 
> Thanks, Roger.
> 
> Roger Pau Monne (5):
>   vpci: don't assume that vpci per-device data exists unconditionally
>   vpci/msix: remove from table list on detach
>   vpci: introduce a local vpci_bar variable to modify_decoding()
>   pci: do not disable memory decoding for devices
>   vpci: refuse BAR writes only if the BAR is mapped

Looks like you've lost Henry's release-ack that was given for all of v1
(i.e. only patch 2 isn't covered by it).

Jan

