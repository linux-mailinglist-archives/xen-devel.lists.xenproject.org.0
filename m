Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F16609FB3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428880.679473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvFX-0000vC-Uy; Mon, 24 Oct 2022 11:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428880.679473; Mon, 24 Oct 2022 11:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvFX-0000rw-RW; Mon, 24 Oct 2022 11:04:07 +0000
Received: by outflank-mailman (input) for mailman id 428880;
 Mon, 24 Oct 2022 11:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omvFV-0000rm-Tr
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:04:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92949d59-538b-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:04:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 11:04:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 11:04:03 +0000
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
X-Inumbo-ID: 92949d59-538b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGAGS9RrHjh1k2jbUmduNOCltNFDPL979I3YmW0ZkHjxjjExgZvjKCV0YIv+Muq149Z0BD5at7zN7QPy0+mlBW6/v6GmRM9tWFIhHCeldbmWNMWwWZ69JF/y6xv8gw5bWLWmYQHc/g6pEp6UFglL8s+1CK40K9OVe77kbDizVClLCNzzyzuzCIZnyoDfJkIr5gdfMo2Ei8T3chjso3uH3md6ycAq2oQ2XX9tqbGdi9F65A1787TMVQ6+1FOkDPLE5r5l8BrnPEjhHf0dwHWU7YMcrZ6a981EzS0AcXoKTdIu+9/l1/bfWmDqVBACdVyOwlJRZOd4qJzYIX/9RO51HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeqPmMJZ+8CnIJjSeKkGG+vz8qOWn+PJ81D0LKkR3ew=;
 b=IdblzLHAYIpaVKY2rvPYFNEsr8oWszTaFow5dTYMbaki5flFneUkJEsUsDiDJqfwlPLoePFSxi2wFgAK6ZTwE14B5MZpo9r4Kn/pGXBMwcd2KYUe2u7CsYUxOxB9b76tpOflBOdVmNmXBHI2+EWx+UHcxmPBkT2y7UXxuH2ZtfatC7vHzB3xl5PSvZNOm6fnXHBBzEx838ocXshQfaPuJ4fpWF+ulunvp+oXElg1yzeRBs+r10LhSBxQ4+g03IwoYGyk0aenF076MU0u+NxWUY3RYhb0fwxOemHJM3MzGZKg12F8yLmcSZuKW+WNWXrsbbgtYQtTmc0yRq0dQw4BjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeqPmMJZ+8CnIJjSeKkGG+vz8qOWn+PJ81D0LKkR3ew=;
 b=aTrRi7MJ60oZKR6wmFCVLe8u8as9fRhYX8E2cXQEPYbKPqoHZ7I1TEF3SGEV7kTqJ62Y8dn3sP/RGDSw6mrUL5OO8nodDhJ3v8cdWyIHzpZLzomrd6h2MR4FT5nlkFwkyWv/2Vf8Z2ZVGVTaknv14zdz+1W6hXKMl6D1sKo8glPaMm+QLIKuQjfq5rXOSkQQOUFxaWj50NeUm70YK4pKontr3UhnWmg/2jAnx3xbjy23iVOtLUk6MKelRhn0RZxbUGIyOCwq27+zjT7YCYmf7ZQFSfHOPrcBDJ5tv/izf4Z4jth6KC7e4gUg+pVta0rAK/dgobbsCyNeUJdauLN4JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff8559d8-12b6-9218-94bb-8c9a731250a2@suse.com>
Date: Mon, 24 Oct 2022 13:04:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 3/6] vpci: don't assume that vpci per-device data
 exists unconditionally
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <20221020094649.28667-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 13418313-cbef-4906-f442-08dab5af75e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vvi3WnABBc4eqDEwgzO+zTQbSS4YzFtYUVNykBc8apoS3yhky+00HOL95D/uGLfxYGCItN/eP0iTBDgbhh/TyptOvV7ygDZsczkMcxhSzPSWVvE+BhV5WMgiO6N6iq1Kke+Q6/Euee4O8RneWw18Dhm+3r4YbmwmHBA3W8vmAdi2IFbRkgV5M01/+c6uHrHeWChZngfV4AdaCJtb2DDZlabHoxaSj0eUWx6JnqfHZHjyaD2u39MVkmQjjZYF7+9Q8/E9cIgKR3kPkiORP2mvesrTQJ4DpX1359MnzNa9wyhLhUazAeQvHK8hWvpGJNswEZtJtgMxJQRsw/7p6ZAKSFd2hwGfaTWCGvYZ8fMUSoHFZvYG1snUTEDqdM4ZKQ4X1yToepuV8sOojTKdshKAkAvtP1OGb3UJEL0KtkZ2IU0vhFxvAM6OGy5SaebNx6TzuSbseh70szcaywwYdNHMxCxQjBKJNh0Fcwl23jaYlLd/9MfEwZPEALVjOuELk4yPk20Wb71oovTAFlQysvHc/XvLYIp3SXt+scPF3oOHopKkBag2eArSe84vw/Kh9lTalmW3QgCDeYxeoQhaSJdiVJgy4B0CQ3F8KjV9/ckIJEQp889pV2yCh+uJnK/1V5BMy4NGHHj17dFupSHdqZH7RE2mvrxxj9DEK+2RoGrLtaX/Skewfvj50SdAZybYH8ulbGbD9bov2bTCpnp55N/cBSo1fFw1vxCN15Ga+mOV2So0jeMEh4n+MusDxcU5EVIvrM9bBncbp2jEvSKoNY+nX43wjWAFjw2UAmgdGHPzOTk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(186003)(26005)(83380400001)(6506007)(6512007)(53546011)(316002)(31696002)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(478600001)(8936002)(2906002)(2616005)(31686004)(86362001)(4326008)(36756003)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWI0d0RmRE5NVXBUREtCRTBTd0VibGxleUdPRUNucXp4Yk1tMmdMb3ltSTZi?=
 =?utf-8?B?RUJHelFmM3RRRDVMamlnMU5vb3hIL09QNndzcFpGbEJnMitXZy92SjVNdzla?=
 =?utf-8?B?TUxqSXFTc1JlSjVTclhaOG1haDVOR1haR0FGTWFIZkF5eHFIN2N3c1NPTDZG?=
 =?utf-8?B?L21UM0VwYlIzWWdDbnZUbUpRbmFzNU92Z21ML0ZpZE1HdkZNSXRpOTY1SnU2?=
 =?utf-8?B?T2s2a25OVFVyU3UrRFVIcUlQYi8zeklCb1hzWC9Za3liRmhxSXoyK2h2cnVL?=
 =?utf-8?B?aXlGcTlzbk1DWE5uK2s1UDJaQkNibmhHVFhrT3l4N3ZFUWZrZCtrbll4cFBm?=
 =?utf-8?B?TlJKRmhVZXpQSFJxMnlnNlNjM0FBMXQ3dk40MjA0aGdWQlE0cWtUUHM4aEJG?=
 =?utf-8?B?c3RWYm1tdThVbHpsUm1pdUVDRXNjSmNRM3FOZmpJOHdhNHpSV0VoZEpuNmpN?=
 =?utf-8?B?cnU3cUZ0Y3hsME9DWTMzV0d4TVVhNEhhOHdXNjZzbFJSbEVJN1EzQTN0bzgy?=
 =?utf-8?B?SEd4cDN5RDl0SlAzOEN0S1FDTFdmdkFHdlQ2Ym1SL0dmODR3UjJoNVYyakZW?=
 =?utf-8?B?TEVRQ2tBa0dGRjJESy90SkVyVE5RUkQ2a3BETUVmY1R6N0JaOUZxV1FuSVZs?=
 =?utf-8?B?ZjRvZFZDdDVucGtBWnp2SktxWVQ2b01iWUlaUHZQa0tld2RYL0s3TC85MnNW?=
 =?utf-8?B?MmxpYmRUR2VBOUM1QzVMVGxMS1FPZ1dZb1hTQlZEcjFhWWM0WStmaktwYTBL?=
 =?utf-8?B?cnNxVWh2YmR0bjFNZHhkdVdPWm53azhNOWNoNGRWc25lL1FnR05iOXdaM3Fr?=
 =?utf-8?B?dW5IK011NHNXREpiQ3NMUDNmVmxPYjBzNG1lS091SGltUGd2Z3VCL3J5V1Ns?=
 =?utf-8?B?Q3ZWandaM0pzbWpvS2dUQkc5M2tybUNtaDJWRG1hNFQ0MjNqNzBxeWQzV3JI?=
 =?utf-8?B?djlTamJLeGtPSVlSV3JNcnhzM2FkVU9JblNuU0Z2YUtORm8wVTZHZWc3MlQ3?=
 =?utf-8?B?TEZGR2FjYlhNdk9uUm1MZWc1YUZ6UDR3aG1kRkZKbzkyTFVZa01vL05WNWFs?=
 =?utf-8?B?NWVzMlVLY3QrNDc4emxUZHRlUG9HWHhHNWkwenNUemFqRXNuUlM2ekVGVzh4?=
 =?utf-8?B?V1lGRysrekJQbGJtdjVpcWpNRjRvcE5BMWtmMSt2MENEb0NiR2djeFNKajFN?=
 =?utf-8?B?Z1VuczZ6L01Wb05DNXRtbks1Rks1STU3MDEzMk1udVozYnJMc0F0RVNqREdR?=
 =?utf-8?B?a2VpQzdYU3pXdEs1VTFoQ0w5RHhxU2RpbW5xRHVCeGRqcUVYTVE5a3YrNERh?=
 =?utf-8?B?OXVKc202eFpsa01FWC92WEZrY3hxdTdZQWkveGRZdW9ZKzEzcWFhTTh0T3dJ?=
 =?utf-8?B?ZWk3VmVFVXZkTTJPc2RYUjBCM1RlaWI2MER2MkhiZjl3VG95NHlhdDlGOHVI?=
 =?utf-8?B?UTlBTkRMc056VFhXN0lmQ3Nic2oyT2t5dXZVUkFyd2FEWlRxSlZtYjBFRGtl?=
 =?utf-8?B?UzlOMldsVjN1bE1iRmR4SHIzZ1VTSXpvRS95YTFWWDlLeUtQQnBDa0ZTV2Rt?=
 =?utf-8?B?OTJWWlR6a1FZd3J4UkVZcXNOYUZIaVBPS2FqYmhicnBPYy9jcmVBVjV4YmFL?=
 =?utf-8?B?NzdSM3I4Ly84eVZvOGorVXN6Vkl4VzUvRVpBekZNQlNVenE2TXFUVmNzQ1oy?=
 =?utf-8?B?TzZzL3QxaTVtZzdCelR3RHBLeXlQSWR6UEhhQTE2Uk95SlBoc3NmdmZZMWtY?=
 =?utf-8?B?aEI2bU9NQ2IyZ1BHK0VSckNEWkJLQ3RyNkplSjhJbU9jQzRSb1NqaEdwemdr?=
 =?utf-8?B?WWVHY09UZDlleVUyL3lzZDFxNDRkTTJYOVpDcmM2RHhiVDBnWmxPTnYzczBQ?=
 =?utf-8?B?aHFtb0E4MmtRQkhqZURPa3RDNGUrOUxSNWJKM3l6S21BbFVlVG5HZHZnR0VO?=
 =?utf-8?B?aXFWZHBMQU5ZWDBlRytDcXl3LzRLeEl3YmlnWlhKR3ZNeXdmZ2Izd2pPQmpz?=
 =?utf-8?B?cnBkb1k3emhKTm4zblkyN3QvS3hOS0thNEhrdGJsZWtLcEgxdmErS0lpaFhz?=
 =?utf-8?B?Q09EZEhDSzBRNkM5UzBCQndLZHp6M1FLVGJVU1lRSXlQMmtCcE15QzMyLzIy?=
 =?utf-8?Q?VMBWCkDHiXd++uOgPdsML5p96?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13418313-cbef-4906-f442-08dab5af75e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:04:03.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zS9CsJZb48CYHc0TyW8PVnXkJfWThQv1s43g1PlxZa26aY8aSplN1d9GGnYaG7XKUxXu8UGHte7CVhtFil3gAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744

On 20.10.2022 11:46, Roger Pau Monne wrote:
> It's possible for a device to be assigned to a domain but have no
> vpci structure if vpci_process_pending() failed and called
> vpci_remove_device() as a result.  The unconditional accesses done by
> vpci_{read,write}() and vpci_remove_device() to pdev->vpci would
> then trigger a NULL pointer dereference.
> 
> Add checks for pdev->vpci presence in the affected functions.
> 
> Fixes: 9c244fdef7 ('vpci: add header handlers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though whether these changes are enough. Is
vpci_process_pending() immune to a pdev losing its ->vpci?

Furthermore msix_find() iterates over d->arch.hvm.msix_tables, which
looks to only ever be added to. Doesn't this list need pruning by
vpci_remove_device()? I've noticed this only because of looking at
derefs of ->vpci in msix.c - I don't think I can easily see that all
of those derefs are once again immune to a pdev losing its ->vpci.

Jan

