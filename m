Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2049E55C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261530.452931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6ID-0001CQ-9I; Thu, 27 Jan 2022 15:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261530.452931; Thu, 27 Jan 2022 15:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6ID-0001AY-4z; Thu, 27 Jan 2022 15:02:33 +0000
Received: by outflank-mailman (input) for mailman id 261530;
 Thu, 27 Jan 2022 15:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6IB-0001A9-Rr
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:02:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d03224-7f82-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 16:02:30 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-x3eci9lSOgWDPXUA0CGWVA-1; Thu, 27 Jan 2022 16:02:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:02:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:02:26 +0000
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
X-Inumbo-ID: 25d03224-7f82-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643295749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nccBUsu0YhLaHkZcQr3GSGEk+O0A/XeeBP7y9LD1V9w=;
	b=CLfJ7Cpz6G9AK+QnOJpTYGxVG8/VfsMSnBQYDhko29oyi0CTDHioWLfqU/9aOkdLaej6xR
	NWexbLYTkoK5+oSud1L94vDeu5K80EkQmBQwEAUIhb7Uk7+BdqCARlhxFvfWBZccUQ3LGx
	tQn/rPEtT0p4zCC1bEMhsByuz/9pPhI=
X-MC-Unique: x3eci9lSOgWDPXUA0CGWVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8DW8IvAVTcxC6wgfYn0R+mvUxxMeHGuwbOHeSwqVwBdFolpCQ0vy4GV6IC02WsOHLJ+eRX/OiQ/tA6I2kKaRpfwo6VVuJFk3HxcNWZ5/0l6qESFzPPiRrVVO6j1/JdFC2o8SRsV/oyI7erd/iRZh3wrkVte4AM/m1D6ACtp3uZDUhqp/uzzp51n+twoGBbu+8dCCenYtlQeopKw+D0JbryNaQk/kXTCsATj4RJEyPlz8SkUMKraUTfH2LHTcINCsTM3SowuYwcxkBuxvcwGEFJKzAL2JMGWiPZIlYTF8ise0ixodcL1v6wZXLTzCMwJyimzM+uv8rOdVDo2ubR6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nccBUsu0YhLaHkZcQr3GSGEk+O0A/XeeBP7y9LD1V9w=;
 b=DgaEzyIj9ETRTh0N3C6vK/fOI2ZEiTKZdIBBLtepjlyvvHM1Ad+s7/op1J5QVJFCJB8rrfb4Te6fxm/MpikMLRnGwGnqpvzsxeY01aOioMBzW/6/A1stmY3TVfaTncg1o5qNhlrFLBfaijrARI4gIzdT+buc05ZfFbblLsCab1nwSmaruF/qgk02OMaiPqrdGCWgkG9No4IKfIbulB2UBeATjMcN49P3CEbIgNFHk0E9DnFwjPrfrkkArasEsGXm2iEjJfv8G1AwpRceIBGbMnLpoxB/vLfCNB/vmQN6TWPiw1lg2+W6BXKcb3DATk6gtyTN0vk/hI+iASvvC7eAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93baa5ae-57ae-ec99-2568-3692abb5e62a@suse.com>
Date: Thu, 27 Jan 2022 16:02:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Ping: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Paul Durrant <paul@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
In-Reply-To: <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba16fbbd-41c7-41c6-847a-08d9e1a607a8
X-MS-TrafficTypeDiagnostic: PR3PR04MB7227:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB722786ABE4F6D56A2B1D9341B3219@PR3PR04MB7227.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sq1jX0+Mw68Xn2k3VV6i7+PoqCA+dTsxntTeH/aXnsPj/hBP2YUi7dms/BckfmxVo7Pfd6ztpI1ImlRfNBIVVQbE91rtBZX1F7aJOWCiR4Fx9E+jFuPfWYfuvpxh2L1sPWlAqEwgPlw46fO2vYjilr5IP9dGCEmGxTh50RrAsMfw/ny2oY1M2votPguc/6rPetmiH+X6K9BgDlzIXkTdpV6JnCLfBZD8y5yIBx4fnWhYnwi2LiG5DhNngq0UlGgG7QcmezN8oc0br05q7uQiATgMQrLRwLgKMVJcGLTVodxPXHh73a/sQV1FwuNs1UPJ5BMvI7CE8XputKghM3wb2G7iSpp9I+FtCZM0yb+VZl8por6KJ+DMw8jvB/4ViZB95E3rssFfdwRPD5XOl1tMNc0x95CI3RKqgu0ehU9dZM2cq9TXHLXHqTE4dduIVqXH97i9vYtKXkFRx7u6rBc9imbKiQbaw0T9CSxp7+aiGJJ6SgIABce9FrEZXPx/ex4jfEhoS129/nvM/c3ptiN6dDQIMPXiH4//5hEfwFo1xDOlYV8EPuBwABnWsU/CC8LJiX4Hu4Q2Mkikn0aZX0TLvCEmUHvlbSYhY9LoVtPHIJlLLE87GuR98p8TAM6f7dTl8yo4/gxeWzouAaREvA7EMbB/qqtmdFx9SMKVRqSYDD6hkUMg8JsReb9Mg8wdEmj7jf9HCv536xY1CNHoO77+z0DgqzfWHwl83pTu549rZQcvF/9ZAeUH3YgdpOS6qJ45
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(54906003)(6512007)(316002)(7416002)(66946007)(38100700002)(5660300002)(2616005)(66476007)(31686004)(6506007)(53546011)(2906002)(186003)(6486002)(508600001)(26005)(66556008)(8936002)(8676002)(4326008)(31696002)(36756003)(86362001)(83380400001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVhBWk4veDRoWUF4RnRvbXlReWNRMkxUNGdkaHZzbWZ3c0lZZDZjMThFMHNr?=
 =?utf-8?B?akt5TTk2THFuUEk1eTg5ZkptUXVpNE81Ukl0bCtVaUFqcEVESHFmck9ob1Yx?=
 =?utf-8?B?TlA5YjRlSDg1SW9GMHJ6U0dzWHY3bitwOWVseVZFczRYRmt4RDN3aEh4N1NZ?=
 =?utf-8?B?K1hvNUhKTjUxSU0vb3hpOUxJaHQrZi80OG0yWDBkZFFUMG1kVS9ab05hMHpU?=
 =?utf-8?B?VHFuU1E5cmRxQVRNY09JVEg5RVlid3RpV0crTUNMa1JnbDZMSGpUSGxtQmx1?=
 =?utf-8?B?QXNzcGxrZzNtaXlwRk0wZWFmN3NMQWdXZnF2dVU2WUV3RjZuZG5Wd3JkaERt?=
 =?utf-8?B?YkFMaU0yZGFlaGRQVTVZaXdZWitqK3ZETFR3bHdaLzBuZHdkQVFCV3lQQlBD?=
 =?utf-8?B?dGJTVEJuU01zZzN0NnZzOExwRGxmTDh2SnYyZ29GMTJFMXM4Y1hMdGp4YUZ5?=
 =?utf-8?B?QkRkekRwcW9lM2l2bllFd1FtYisxVFloVmZNZXU3Y1hKNkF2QzI2K3F3UGpU?=
 =?utf-8?B?ZGI4YWpsTDVlYXV3K3BNamd0eUhtUjZGbGFpTldhR3RleEV1M29iRlZEMjRa?=
 =?utf-8?B?VFpaV01WSVE0Z2RuS1JhOEJGR3diekRNUjF5emV2bVBNZ3hrZ2ZLcjhvNmNx?=
 =?utf-8?B?d1JBVFdRWXE2Z3RWTzJpbUQveVBac1BXZmU0aDFnczFNenB2WWMrWXlWVVpG?=
 =?utf-8?B?bHg3TiszWlBVMGNpa09HMTJRWkVFZVl2N2QrRXVVLzkrTVZSd2p2aEhvN0dx?=
 =?utf-8?B?b0dqSjFFOXZJYmUrUURvRjRYVU1vTWRnSkN6SkppSXd2NXB2TXVoQ1JFU1lD?=
 =?utf-8?B?VDdKaUp4My93dnBYVlBUdTV3MVBIbmxZc3pieHBzYmZmMzk4YkhOcmoxWW04?=
 =?utf-8?B?aUdBOVlrc2hjdU9WWXRaV2hkUEdCYVlRd3ZNN25CeXFaTnd1SExIUzZ6ZmVF?=
 =?utf-8?B?bk5mWlBwRk9vLzdXcmMrU01xYzBQSU53THRIQ3ZGZS9uUWkwTmcwNVhEbmY5?=
 =?utf-8?B?b3l3S1g5ZHF2QzdTczE2NXM5VTZSdE1VVWVNNk9oMC9nK2xESTNLUThvaWM3?=
 =?utf-8?B?N0NxMTlDWnZDVGJSWkZCQ3NWcjZYYVpxbXNQdVYvSE9DUVBRaWJiQVJZMHN4?=
 =?utf-8?B?T3F1V0ZFU1pWVHk4UFVSNDJKTVhLUC80RzZPY1dsT3lkQWdpVk9KR2RKdzFo?=
 =?utf-8?B?VlE5NGlqTHV2OG53d2pNeURuYS9lUmpRNW9DZVFqRzNJbGFpb1AvQ1VRNHE4?=
 =?utf-8?B?ckYraXlJazRNREJHcGtZTmw0Q3VocGxYczlPU09XSERVaGFPVjRwS1IvOU1u?=
 =?utf-8?B?ckFIMiszT3RUaWtzTXpVSnpERTNVdjA5cnR2cysrWmtGOWJMZk1WN2lwbVFE?=
 =?utf-8?B?UnA3MEtSRCt4WnVxa3ZCdVpQZzBXQ092K2FtLy9WbmZLVHpjQitJQmlhK2tK?=
 =?utf-8?B?YUZZb29pQW5sU2wxcGh1R01sK0g3dVQ2TWtuWXFvYU1DZ1lpRzB4b2Uyanpn?=
 =?utf-8?B?VTVzZXVXeUY2bk82QnlUQUREN0hBMDg5aEhaYitESGVwTEdOcWtBbVl4R1Vj?=
 =?utf-8?B?N2dnV05NR1BNS1h2MWI1dkJJc3NCd1hReWJvaldsSThKKzQ4Vmt3VFg4aGdQ?=
 =?utf-8?B?QmRSWXluYWN2alEvTW9KR3gySGxtWjExVGV6anBOYlZxUTR6Y1E5Rzd0UUpz?=
 =?utf-8?B?UTNwVjBoSmZOZW5RWnNpazN0Y2FOcjUrMXRRZisrcHRWeVFGUnE1MjhnZC9p?=
 =?utf-8?B?cW1lRHZUd01RdUUyOUJ4NDFTN3dVOTU3bXBWVGRnVEUwMGlSUDFPZGVMNC9q?=
 =?utf-8?B?elhtVDNvcEtlZ3JSTkwreE1FSElGZDU5clg0NnZWOGJEUmNZU093K29nZ1dG?=
 =?utf-8?B?cTJvZEJqOVBBRjVrczNTSDg1ZWNPazhWak9jQ0piTUZOQUxOOGxvZjJxb0Vw?=
 =?utf-8?B?dVZJVnMzb1F4d0FxQTBib3k3RTZtdjdYd09mV0lXYWRCQ0I2U25PbXBZSTBk?=
 =?utf-8?B?SkN6MWRzQlRxYllsR0FSS3pLc3A2OGlGSGxMdlJFcW4yVmpVL2h4RGZZM1FZ?=
 =?utf-8?B?andHancvdy9YK010T1h4L2M0cmE5NkN2NElFamhLemZ3ZjVSOFNRZXpVYmZ3?=
 =?utf-8?B?K1l1TW1DSkZraXZEZkl2Y3NjNVIzbkFIWFV1bERvOThXbGlyYTRNM1NTNS9C?=
 =?utf-8?Q?2QQOUmpXX4B2/9GpSZgTdok=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba16fbbd-41c7-41c6-847a-08d9e1a607a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:02:26.2065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pFmDKq7xG0wECZCKdLH+l4heoFDNP3l/Lr/EtLFPv2BJ/cCO2QeFKfCskYen9JNpsttyXCRJp7gnR3soiNyrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

On 04.01.2022 10:41, Jan Beulich wrote:
> While it is okay for IOMMU page tables to get set up for guests starting
> in PoD mode, actual device assignment may only occur once all PoD
> entries have been removed from the P2M. So far this was enforced only
> for boot-time assignment, and only in the tool stack.
> 
> Also use the new function to replace p2m_pod_entry_count(): Its unlocked
> access to p2m->pod.entry_count wasn't really okay (irrespective of the
> result being stale by the time the caller gets to see it).
> 
> To allow the tool stack to see a consistent snapshot of PoD state, move
> the tail of XENMEM_{get,set}_pod_target handling into a function, adding
> proper locking there.
> 
> In libxl take the liberty to use the new local variable r also for a
> pre-existing call into libxc.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ping? (Anthony, I realize you weren't Cc-ed on the original submission.)

Jan

> ---
> If p2m->pod.entry_count == p2m->pod.count it is in principle possible to
> permit device assignment by actively resolving all remaining PoD entries.
> 
> Initially I thought this was introduced by f89f555827a6 ("remove late
> (on-demand) construction of IOMMU page tables"), but without
> arch_iommu_use_permitted() checking for PoD I think the issue has been
> there before that.
> ---
> v3: In p2m_pod_set_mem_target() move check down.
> v2: New.
> 
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1619,8 +1619,13 @@ void libxl__device_pci_add(libxl__egc *e
>      pas->callback = device_pci_add_stubdom_done;
>  
>      if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
> -        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
> -        if (rc) {
> +        int r;
> +        uint64_t cache, ents;
> +
> +        rc = ERROR_FAIL;
> +
> +        r = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
> +        if (r) {
>              LOGD(ERROR, domid,
>                   "PCI device %04x:%02x:%02x.%u %s?",
>                   pci->domain, pci->bus, pci->dev, pci->func,
> @@ -1628,6 +1633,22 @@ void libxl__device_pci_add(libxl__egc *e
>                   : "already assigned to a different guest");
>              goto out;
>          }
> +
> +        r = xc_domain_get_pod_target(ctx->xch, domid, NULL, &cache, &ents);
> +        if (r) {
> +            LOGED(ERROR, domid, "Cannot determine PoD status");
> +            goto out;
> +        }
> +        /*
> +         * In principle it is sufficient for the domain to have ballooned down
> +         * enough such that ents <= cache.  But any remaining entries would
> +         * need resolving first.  Until such time when this gets effected,
> +         * refuse assignment as long as any entries are left.
> +         */
> +        if (ents /* > cache */) {
> +            LOGD(ERROR, domid, "Cannot assign device with PoD still active");
> +            goto out;
> +        }
>      }
>  
>      rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -20,6 +20,7 @@
>   */
>  
>  #include <xen/event.h>
> +#include <xen/iocap.h>
>  #include <xen/ioreq.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
>  
>      ASSERT( pod_target >= p2m->pod.count );
>  
> -    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> +        ret = -ENOTEMPTY;
> +    else
> +        ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
>  
>  out:
>      pod_unlock(p2m);
> @@ -367,6 +371,23 @@ out:
>      return ret;
>  }
>  
> +void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    ASSERT(is_hvm_domain(d));
> +
> +    pod_lock(p2m);
> +    lock_page_alloc(p2m);
> +
> +    target->tot_pages       = domain_tot_pages(d);
> +    target->pod_cache_pages = p2m->pod.count;
> +    target->pod_entries     = p2m->pod.entry_count;
> +
> +    unlock_page_alloc(p2m);
> +    pod_unlock(p2m);
> +}
> +
>  int p2m_pod_empty_cache(struct domain *d)
>  {
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
> @@ -1384,6 +1405,9 @@ guest_physmap_mark_populate_on_demand(st
>      if ( !paging_mode_translate(d) )
>          return -EINVAL;
>  
> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> +        return -ENOTEMPTY;
> +
>      do {
>          rc = mark_populate_on_demand(d, gfn, chunk_order);
>  
> @@ -1405,3 +1429,20 @@ void p2m_pod_init(struct p2m_domain *p2m
>      for ( i = 0; i < ARRAY_SIZE(p2m->pod.mrp.list); ++i )
>          p2m->pod.mrp.list[i] = gfn_x(INVALID_GFN);
>  }
> +
> +bool p2m_pod_active(const struct domain *d)
> +{
> +    struct p2m_domain *p2m;
> +    bool res;
> +
> +    if ( !is_hvm_domain(d) )
> +        return false;
> +
> +    p2m = p2m_get_hostp2m(d);
> +
> +    pod_lock(p2m);
> +    res = p2m->pod.entry_count | p2m->pod.count;
> +    pod_unlock(p2m);
> +
> +    return res;
> +}
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4778,7 +4778,6 @@ long arch_memory_op(unsigned long cmd, X
>      {
>          xen_pod_target_t target;
>          struct domain *d;
> -        struct p2m_domain *p2m;
>  
>          if ( copy_from_guest(&target, arg, 1) )
>              return -EFAULT;
> @@ -4787,7 +4786,9 @@ long arch_memory_op(unsigned long cmd, X
>          if ( d == NULL )
>              return -ESRCH;
>  
> -        if ( cmd == XENMEM_set_pod_target )
> +        if ( !is_hvm_domain(d) )
> +            rc = -EINVAL;
> +        else if ( cmd == XENMEM_set_pod_target )
>              rc = xsm_set_pod_target(XSM_PRIV, d);
>          else
>              rc = xsm_get_pod_target(XSM_PRIV, d);
> @@ -4813,10 +4814,7 @@ long arch_memory_op(unsigned long cmd, X
>          }
>          else if ( rc >= 0 )
>          {
> -            p2m = p2m_get_hostp2m(d);
> -            target.tot_pages       = domain_tot_pages(d);
> -            target.pod_cache_pages = p2m->pod.count;
> -            target.pod_entries     = p2m->pod.entry_count;
> +            p2m_pod_get_mem_target(d, &target);
>  
>              if ( __copy_to_guest(arg, &target, 1) )
>              {
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
>  
>              rc = -EXDEV;
>              /* Disallow paging in a PoD guest */
> -            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
> +            if ( p2m_pod_active(d) )
>                  break;
>  
>              /* domain_pause() not required here, see XSA-99 */
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -454,11 +454,12 @@ bool arch_iommu_use_permitted(const stru
>  {
>      /*
>       * Prevent device assign if mem paging, mem sharing or log-dirty
> -     * have been enabled for this domain.
> +     * have been enabled for this domain, or if PoD is still in active use.
>       */
>      return d == dom_io ||
>             (likely(!mem_sharing_enabled(d)) &&
>              likely(!mem_paging_enabled(d)) &&
> +            likely(!p2m_pod_active(d)) &&
>              likely(!p2m_get_hostp2m(d)->global_logdirty));
>  }
>  
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -661,6 +661,12 @@ int p2m_pod_empty_cache(struct domain *d
>   * domain matches target */
>  int p2m_pod_set_mem_target(struct domain *d, unsigned long target);
>  
> +/* Obtain a consistent snapshot of PoD related domain state. */
> +void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target);
> +
> +/* Check whether PoD is (still) active in a domain. */
> +bool p2m_pod_active(const struct domain *d);
> +
>  /* Scan pod cache when offline/broken page triggered */
>  int
>  p2m_pod_offline_or_broken_hit(struct page_info *p);
> @@ -669,11 +675,6 @@ p2m_pod_offline_or_broken_hit(struct pag
>  void
>  p2m_pod_offline_or_broken_replace(struct page_info *p);
>  
> -static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
> -{
> -    return p2m->pod.entry_count;
> -}
> -
>  void p2m_pod_init(struct p2m_domain *p2m);
>  
>  #else
> @@ -689,6 +690,11 @@ static inline int p2m_pod_empty_cache(st
>      return 0;
>  }
>  
> +static inline bool p2m_pod_active(const struct domain *d)
> +{
> +    return false;
> +}
> +
>  static inline int p2m_pod_offline_or_broken_hit(struct page_info *p)
>  {
>      return 0;
> @@ -699,11 +705,6 @@ static inline void p2m_pod_offline_or_br
>      ASSERT_UNREACHABLE();
>  }
>  
> -static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
> -{
> -    return 0;
> -}
> -
>  static inline void p2m_pod_init(struct p2m_domain *p2m) {}
>  
>  #endif
> 
> 


