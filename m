Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75071FD92
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543022.847575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50yk-00040r-1N; Fri, 02 Jun 2023 09:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543022.847575; Fri, 02 Jun 2023 09:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50yj-0003xC-UP; Fri, 02 Jun 2023 09:21:49 +0000
Received: by outflank-mailman (input) for mailman id 543022;
 Fri, 02 Jun 2023 09:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50yi-0003x6-MX
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:21:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e563841e-0126-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:21:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 09:21:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 09:21:45 +0000
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
X-Inumbo-ID: e563841e-0126-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5S+k0fcrC6oXWvUI1TlFMgGkb/yl4MAEjrwgp5CKLo2N7VIELx9ySFC6J2g3qwXLPCAn2FkUv4xcQ0E5YNt2/rnJhFXcCNw/HXy+zLQRPhEvN0mlkBkDc8BFh370fIdwiDWkDjajI4YQ+kxzH95OtAN4bDIPVNVJbSez3pFphv9bAksQjLIKcSFfU7z7mN0/B7b4Af/iNxOksL9Kkx7PXfuV/1arYrdErq8+0ITADAA65HX+mZNcBuqdsjQiVc3dfxTiWhLwE/uNriJyjTVALris5BWVsdXDRlWl69VsxYdH1KQsPklVjFDzJOQ2zGmMS+rsjbl/RlHhP1zagXRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbZC6dZY6YdExwDtXlp0yV00U593axmZjMsekG7IToU=;
 b=IWuWfutYMx5ejSvsgMZOT0DmQYw2yHJwJRWvXizSk/nRYXeHt/Tmdn8pEprFsqONOzJe0uIGZygGaouHO7+4xuTCyDpfnKa+ad/YDHtZsXmYWujF2sO5LGosaQhi4mi8cCIypEkNB2ELuyga+f9GxNyKhnbL7CWsFq9NcPshMk6IHEC/G8Ypbf793tQ+XX5LneGwh4FyYN7N+HJ3owLH0f6QNADEdXcXpDG56cn15HSuub72gECMJ7lXxSrCcMjBbOMLeBlwSfgOlToiPy6T1QtPjseI3OYMu2PlNOpuEgX/faH/uTLO21w8rvQLW8YK326zyg/fHOfUEcmOYNOp6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbZC6dZY6YdExwDtXlp0yV00U593axmZjMsekG7IToU=;
 b=ZvIJUnIs+o7UqbdwdR0Ku/mzuq5t1dQrshALc3uxf/HSUn2JCb2juauLUPSdmq++8xnV6uHtNR9KXBFBgmkrajG1NlSDu5y5BqWGf0d1cPofddlEpVGmbyKJ0vp4G5q8qsluUuKYHXVVKr6Xv/RID7U8xrCxKKXRPo6nQgiRmarXK/wTQbjgG+O49wdix4Gnl1DUOV/Uko+WAUtJFrppue6WFOjJOhZe6exKE8WGHXHIqf3bssutY0rySRLrDXwwJ6v4VNCMZUU0FjtC027iLpNhsZ6s82eYXDXWlBPmkHyR5QvKcZV+er7I0EWAgjm/QrJXukp6h4ki+Bwdqx48lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb641973-1f5e-4ef7-9540-6ab948745f46@suse.com>
Date: Fri, 2 Jun 2023 11:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 10/19] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-11-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230602004824.20731-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: feb404b2-19cd-4965-5852-08db634ac8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YnyT0EIPsAju2kLhWoNWbnhkryQrj58AYTHPbZDV5UrUd0k6Tx24nxpMGG622Jfr0e+09yYzAaU+2vBJCfg5+qrFumsHluJX3bwQqrhnxqK8RFuGb5b4eqRE5vfO2Q0+HNaSMrhSNTgNIUXF/xlA6Ml/zkhxwzcCUZETxnnGzia5A5PYx3X/8TbJrkXfmqUiytUJcEpeyrKtcsftehaz/hDr55epy1YbFC5Q1VvI8uLiPh63DXWb/3U3ijJYVyJE3NDGy+l95LpXy6TJO6y2hbbwkAC4FOw3WFA+9wS+50+gdKVyind/OXWNDnW6n9AwFifU7FIosVBcBAbo74BEfUMVivBLRg0tlWrD/DF4lRlL9QUBdf012xRimOdl2QhbJlTbGDOrVrkdmF0IpNGH9c6g1CCo4VGU/JtT6J+GnWH1j+JHHBNjrBB8V21TBcHQxESiPCe6VaTBaCTIBuGCShlY084SCg7jzG+kOL4J8s/yIpOE30mKwgQ64lOYcNgmaycot5VGAA2BpgVn7tpJE2zzYMAdagWxtme4jyQibH5rp0Kt3qvfsnNI8/6fWVXw1LDiud1AcH3ThQa2U1dD4M5hCJ173pXR3b7YmUp73Xe1y4pSbzcQvbTLY2Iu5L88LbLhoQNVFxk+pRh+ZS8MfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(38100700002)(86362001)(558084003)(31696002)(6486002)(36756003)(2616005)(26005)(6506007)(186003)(53546011)(8676002)(41300700001)(2906002)(5660300002)(8936002)(6512007)(66946007)(6916009)(4326008)(31686004)(66476007)(66556008)(316002)(83380400001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEpGOE9JZG5LQjg0WFlVaUd4OThMZ05icjk1ZnpHajdhdi9XOGZJbXVZSDRG?=
 =?utf-8?B?VHg0SVBDNXNkcWdTZm1zTjY1dnFuc04rcWN0VUN2cm4xdXh0OW05VS9McUg1?=
 =?utf-8?B?TmZGaWxYOHFWeTR6S3FKTWI2NHZaYys3ZWRRNEhwcEU0K1Q1QjU3WmZINFI2?=
 =?utf-8?B?UWxrWmtucjNKTDVTa1VXZHdKSkliYWh5U2hkRWVUU29XT1J2dVpjMmRHWHFW?=
 =?utf-8?B?Tm9OY21uek1DRWFlaWdoL3hkN1hPVDg0cnJEcG85bXhsYjdzNU5FNU9IemtE?=
 =?utf-8?B?cjJHRm1CTHdQNVVVTEt0cy9MSmlFbWoxZnVoTW9DREt5ZTNKUkY4UHZWVnhL?=
 =?utf-8?B?NlBaUUN3SEdOdEVtMnNyQ1VEc3RlNDl3a1hlcHR5TmgzNW5nTXVURDlmZ1VK?=
 =?utf-8?B?YWx6Nmx2dGRkZDgvV1hqUmdCSDd6TUVVTzdWa3M3ejFxWnJzMWc2UGErN0lX?=
 =?utf-8?B?Q3JjNmF0eEtDOVhTanl1a0hVRlEwZElqRStFSHRGSDJPOWRjQmVGQ3pBSUZE?=
 =?utf-8?B?K3JRQ1EvR0VpeUVHM3VucTYyZTNCSTVmTmxSR3k5c1V6aXhIRURtRVFzb1dp?=
 =?utf-8?B?NlJCZW9OVG9PcGdnQVo2RWtyV1hWYTR3QThJUXZKR3ZuYnd2b0NoN1FtTkFz?=
 =?utf-8?B?L050SzAwcVhKK0VJK0RKUWFaY2FNZnJ3NW1idk11ajZqenhEeWNmeEVubEY3?=
 =?utf-8?B?Um44Ync5bkZzbk5UTHY5QXd5b01zNTQyUVA3bWY5enpRd0toVFdoalRJc29h?=
 =?utf-8?B?NHErbjhvS2NNWHdNalB5RW0vR2NTem5RUnYwbnpOeHFLd0xmclRlVUM0K3ZK?=
 =?utf-8?B?REZ2V3BuT0RIc0UxRTRsRWYvRStJZytYUFI1Zm5ScDVSa2tTempmRUVaYWJ6?=
 =?utf-8?B?OHIvaG1sZDB1RURiK3h1NzdiaGVUWFRwOHJUOXZ1d2VjQkZWdzRLYVFlSkxZ?=
 =?utf-8?B?a1dpeERFUEZVNDg0azJRU0U3dnJsTmdWOFlVUFpDNCtJQXRoTlZyZ0NhQmkx?=
 =?utf-8?B?b29UTDk0VUhMbWNlL2loRUJKck5hVk9aNVJDZHR1VmZEb3VBb2x0UHhQdzFM?=
 =?utf-8?B?QXN3UGNsb2VUa0VpRE5JandtSlFaV3ErVHFHSkJkbnFCMmlodXBIRnFjdDAx?=
 =?utf-8?B?czV1Nlh2TUlnOTdTYkc5azNIODUxeWpxMWhVMEFERnR2UUdOUTBZQW9nRHRG?=
 =?utf-8?B?L1BVbHZ5NkdWb0RXUy9uSmxCUU9UeGU5ZlZGTDV2cC9MWXlIUFl4K3lOYlo2?=
 =?utf-8?B?TXVNT1grRVlHNVgrOXM3bExQNWMzNEVTRGdSZjhHWmhCTGt5REJLOVBZSDl0?=
 =?utf-8?B?RlVFdmJuc2ZPNnhQQ25zNkhKZ2gxM05LZjRjdGRhRldzUjlkN3VMRkVQdjdT?=
 =?utf-8?B?K1VQL0lJN3lnd0RMR1hXODlxWHA4U1JRalFnMGdFT3pvN2xPaUNsYUNSWnZx?=
 =?utf-8?B?MW8zekczazRINzZJWDNJYmp4RnE3MUV4Z0l4VUZCRS9DU2JTRVUyTXRoZVZE?=
 =?utf-8?B?Y3pQdHp2V3VhamtaQzFWc2w4VENEUkVTdjdhZjAvUkN2S1R5UFRSc3VnVUVm?=
 =?utf-8?B?M3l3VGxDVU1QMGZ0c29udDUwWS9kWUhkc0ZYUmxCTFVlMWI5VDYyZkhIZTBQ?=
 =?utf-8?B?MjdSQlY1RmRwVTdlZW5ZdVQrSisvblZXejlJKzg1MzhBVXQxbVNmdWltcTBN?=
 =?utf-8?B?WFlDV2dCY2hheUUrQXkrT1Q4eUNPQzJEbXlvQ2t3Vkpuc2dGMk1WTSs4WW4w?=
 =?utf-8?B?R2kxNFN2TEh5cjNrUEQxazYvZlRzeUJ2REVhZmtpSVdnYlduTCswRndncElY?=
 =?utf-8?B?UWg0eW1YTW9UMEZtQTNLNzBsbE5XQWt4c0xia1BXeFNpRjZTM3JZM3YxeE5O?=
 =?utf-8?B?NmtCa3ZKOE41aGQ3b3RhT1Qxa2JBbkRDTEhoT0ZIOTZYQ1AxbDhqUEVYbktY?=
 =?utf-8?B?VVErS1grK3lnSEJsWnNvbko0V3VsRThNdjZuVmpGUDk5NjRSdU81VEdEZ2Z2?=
 =?utf-8?B?UXJudWtMclF6ZkRqVTdBY2pSNFBMNC9kZ2FvSUorKzRxRS9hYXpZUGVLMU9w?=
 =?utf-8?B?eHlOODdVOXhJY0Y0VURZTCtyd2VwMU8vd1haK1IvLzF3cVNhS2swR2Q3a0cv?=
 =?utf-8?Q?2V3zPsckSGRa8ZvrCNLd1/ART?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb404b2-19cd-4965-5852-08db634ac8dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:21:45.3972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92su0e0GrhJVgbwNCagvlnzeO4TmFwFmMNG7WWgmN5nNr2WaMf0nu6ldeCepHY+SvwzjS5hFFMvEmvK41ZQ44Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

On 02.06.2023 02:48, Vikram Garhwal wrote:
> @@ -189,6 +194,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      if ( rc < 0 )
>          iommu_fwspec_free(dev);
>  
> +fail:
> +    spin_unlock(&dtdevs_lock);

Nit: Labels indented by at least on blank please (see ./CODING_STYLE).

Jan

