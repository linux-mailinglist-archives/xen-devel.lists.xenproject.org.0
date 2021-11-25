Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF6D45D672
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 09:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230722.398855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAPi-0002Ik-8H; Thu, 25 Nov 2021 08:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230722.398855; Thu, 25 Nov 2021 08:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAPi-0002Gj-4e; Thu, 25 Nov 2021 08:47:30 +0000
Received: by outflank-mailman (input) for mailman id 230722;
 Thu, 25 Nov 2021 08:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqAPf-0002Gd-Sg
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 08:47:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c73fb8-4dcc-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 09:47:26 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-2BKGcAxuPq2QqBBoKvJ_dw-1; Thu, 25 Nov 2021 09:47:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 08:47:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 08:47:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:20b:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 08:47:22 +0000
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
X-Inumbo-ID: 50c73fb8-4dcc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637830046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yieLgbpLcphkx9D7zzbkkXrvstemAwwTYyXwszM4ozk=;
	b=Lolx49DkMN2uyqogsuKedS31mYhZMB3dmSH4yoXfzYmRtTBPrOP5d0RBaCJZGW27gvRf4h
	dWs2SGFbDYR6yzVi1RPQ/kxCRxSJWnJswIl/R2EVEzzN5+Q8225g2FLXygzDcQpq2OXrh5
	sDv/ATlar2vnykhIjPHilzlzWXiS5L0=
X-MC-Unique: 2BKGcAxuPq2QqBBoKvJ_dw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN2QDgGEcfmxM9iLIvZptUMBbsQDEMnBmrGmZVdkkdYHuD0f1DTkeiU0JLkVGVlzfmflc3KLq9/Jfp3Q/dU7gs5YQFnO1mcMKvBUN57rFk2xCpH8tcEL92zh1ybSlWfO/Uv1CSXuCQR7Mn6UCT/NfRCZCnxf99/Jbay7FsvedFIBixNt6oJq4uWcxkcAT3NKEwBc3V65/J5id92Sb91JBeT53c3DKVyYcZKg29n883bcx1/omOoCvM1m/NaJs0YpDjcgCDXxvR9vVZW6r61NMJG5yUV129Ke6HQvskbU/dHnBwlqrm5j63rneWEP34xMGFSNkdg6snQgK0IZtUlKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yieLgbpLcphkx9D7zzbkkXrvstemAwwTYyXwszM4ozk=;
 b=kKZUalNFyUCgmXTFUwDLnLQA7yU7551lU7S3lnDmTUCW6wSr0TsYcXS8SRWXNiT/D4IGA6Y/qsU344i2iuS39yX4sSjWuCa0g12S5P8wOonVTsELwWbnUSNbCneuN+VrClmHOozeJrAfCve81Liy0RGD8ZX+14F4CzNfbcM/ZYIfQHisY4BfPCIaWEx3w4YFVyrmmlClAK32pi5bHaQPD5NOQaJgr/zSx+imEDMn4z7EDQeZj4+baXv65IByvMxbryq3dBECfaCcKJxAucuCuVXE5/xPDcYrNi8LdWOz3018XqyWdY6EC8PwP9N8Yf6Ylo7VkrEZ4ASXhId6hEirQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59f0788c-9085-97b1-8380-e6d1e2e090dc@suse.com>
Date: Thu, 25 Nov 2021 09:47:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max
 policies
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20211124161649.83189-1-roger.pau@citrix.com>
 <24990.26451.287618.213116@mariner.uk.xensource.com>
 <9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
 <24990.32581.766301.992950@mariner.uk.xensource.com>
 <471892da-6e64-2faa-3198-3859531c4d11@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <471892da-6e64-2faa-3198-3859531c4d11@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0027.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b433aa11-d269-43f4-57da-08d9aff03318
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438214C83C9240F13AF91510B3629@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LdMYaPjG/Tzqkh2pEgpVxLE5Ec/Vy3YgVjHg8hYuhUNJW1CZmxSKdjA0JnH4GQDLLXZYjWlhIuvHmSCur6f/QwMkDeKPAwfXM7iwIevrT3J3+RNqE7oU+k7IN9pHz7o9vVYSY3l4XrTlxKjJdLcu/Kx+YRBzY232SHhHEPDHgnYOAVn/2pKiaB/7aDviTgJ/og0Oiro3oS/Mfef9XHkOjmQOWuCaef9G5+ILFXbv8uZJA6Uv0HVn6VTrdRUj9JQZHR8EtLfLm3akc5Qe6nPvHBvkB5Zh+znixayGJdV7jeg8/ehe8AMWZEntftRme923F4AdDityUsbK7OdUmNdUzVMbJ7cRkSLc2pd+X9nhqduwSReKwI9GPQKusbys0RUi7z3tRh2PhdPsj3ExAFms+FVRvkehQXwGEr9O9r7mTz7G8ycJO+KOf1fF2QQIBM7yfRNcB2URujVHmhC6wLggSnbijzaGZQv+X9UsV6KNrA3pXy8NoR77fw2ES/bmzLsaVdz8YxIsp+vhljROJeusMPwQI7iqlZA2TP3OWmwwE599qaJVTsoUkhP+nNP87qeOXzBiM1CDMuOz06vJTHRuNdCVoumij+sFfJNGqYkSTSlRFPYPLoMN4qpnAUi9FSkkWXQc2dT8+WjOKnusIGg9yq2Rod0D/CsFMB7DIuLFbuGhj0lB+MfnQZt3HVmDZlIkyacucqMfDbZe9X6/sVtleTNANTCyRCAiisgCYcnAUGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(8936002)(83380400001)(2906002)(16576012)(316002)(86362001)(110136005)(26005)(36756003)(53546011)(54906003)(4326008)(38100700002)(66476007)(956004)(6486002)(508600001)(5660300002)(31696002)(66556008)(66946007)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZoQlFxWS9WN1YyUXFybFVFMW93YXM3c1dMQS9VNjdzMnBtVnZ1T3BZRlNR?=
 =?utf-8?B?LzdFYklpV3FndG80aFp1R1R6c3lCVHpwSHlGM2hBSTVPeWxTZVZZZ01GNm9S?=
 =?utf-8?B?L21PT3ZXWUN4YkVKcUtManplNmtRZm1LNGJCQ3NTVUloc2E4eXYzWUV1RnEy?=
 =?utf-8?B?dEo0cXdHaC9kTlBpTEVPVXNiMzB3MDRIWUk0cEd2aTl3a0ZnYnRPbE93dmtu?=
 =?utf-8?B?TmdiaEJQSXJ6UDdLWkdCV1lFZGlpSzZlWm9neTZ0WUNvcTFMSzJuUThmODhm?=
 =?utf-8?B?aXdzN0Z6cHpMb2o3aEFWbUJodlhYK29VbUUyRmJpYnNuRlZRd0oxaVhZTFkw?=
 =?utf-8?B?NnltRjYwR0l0RFFoVHFqNmtYclZScnFra1o4aElJZkRXTkNJRTltNW8zZVNH?=
 =?utf-8?B?cVlUK2E0cFFLeWN4S0NpU3JkVHpyUndGbE9FcHhwRVBCUnJhZ1pIeW1iMUlp?=
 =?utf-8?B?b0tNREJZZ0lhb3pSK25HOEg4UHZubjZzT3dSY0o4Qit6cktES2lGRjJjNXN1?=
 =?utf-8?B?eXU2cjZGUUVWR3ZtZkNnSmkvMnZlUndFYU5zTzhpZk9lbXpSbFlsd2VtM2ly?=
 =?utf-8?B?WDFVUWVmNmVwd2lFbXcwa0dLL3RENmJtOWo3cnRqUVYvWUp4VHd0eU5NMjNz?=
 =?utf-8?B?dnM1K0ZkWUNrSFJlMmpSdWd6V0M3bHc0NnVsekZoOG9ObmVLTTgyblZObmVi?=
 =?utf-8?B?c3lmNisyTHM0Q2pXcnZuejN2RDg4VUc1NG44LzZ5K0hzUStUL0pndEx0VDFE?=
 =?utf-8?B?cW1MUndrWDJSc1pvU25QWVF4RVNQaFBxZU15SnlyWjJabkh5cmdOOUpYOFJv?=
 =?utf-8?B?WmJYRkdqRDFTZ3dzK0NManF2QVpUb0p4ZWxocFB0NjVBaUJEQ2dRM3UxM3VK?=
 =?utf-8?B?aUEzSWhIVERXeFViMzR1UnlwNU5IV29waVIrVFdrVHo0MTdEM1VtOG91eisr?=
 =?utf-8?B?bkN4cjhMZW1CRmttVXJIekdpNmlUeDJLYThUUDc2VS9mTGNzcnJuY2ZZT0JQ?=
 =?utf-8?B?UGROL0NTMzZyc2dkR21adHJJWlhSc3V5L1VSdlNBem14OUk0UGVuSUJlQUFZ?=
 =?utf-8?B?TEFNRnEwa0tRbll5V2Z2WlZVRWhLanBYbXBVRmZJYk03dzkxU1cwTW1xVC9D?=
 =?utf-8?B?WHkyYUQzZDNpSjMvTEdHSGVudE9qRDA3NmpXTHhZNmVTYU1raldSMUJOY3R6?=
 =?utf-8?B?cXgxV2VLeGJsNXRUU0FMa2V4NzNSL1BCYzJWY1E1ZWp4QXlqSUhOTzF6MnEr?=
 =?utf-8?B?OG04NjhDMXhBY2NmdjlKQjY4dllGODBlQktYZmUyUmlqVTV0NCthak1rTjQy?=
 =?utf-8?B?V1RpamU3bEZGeDY0R0ZDSndTV3k0MTRNVlJyUzg5cjgxYk93Sm9ZUC8zMjFF?=
 =?utf-8?B?UDVmK3pUUGVmbXBEVnZjRGVUZXBSU2VOQjVSQjJHcSs1WUQwanNMS24rL2hm?=
 =?utf-8?B?bk95L3c5WjdPSmRmT2UvN0tCbDdKNXQ4YXBMRTh0M25ZWFd4cTQ0TERsZlhY?=
 =?utf-8?B?Y0NjdWRMMEtYTWtpaEJnVGFtZ2o1REI5S2VhZzhDSjVYRElQVCtCL3dyZzJq?=
 =?utf-8?B?Y1gxaG9iZDBxOUhvWVhlMDhocythMG1zYnY0bDFCUjZwdFJ0dDAzbXRnY3BR?=
 =?utf-8?B?QnB6RjFUMm1SSmFNam5neEdMbXkzcFhVaERuSFZMWkpUamllWFVmODM0RWNL?=
 =?utf-8?B?WFdydkxUckFsZk5icUpsckpKWEF5cG9jbHZHQVUyakx0VnNLUXRnV0lvekow?=
 =?utf-8?B?T0VsRzh3d0VOVEt0V3FCNkR0SkNXU3pmcEdzclJub0lCTVNmaDZMTmNRK3Z2?=
 =?utf-8?B?K0FhYXVyb04rbmM5Mm9QZGI4ZjVDUTViVFpLMlR6K0dNdnVxV2xHajJ3QXFZ?=
 =?utf-8?B?SXRrZkZZc3hwZkNVRFVQVWZCSnVwUzdpU0ZjdndWdHpvWldaWm9WWVNvaUJm?=
 =?utf-8?B?OEUzS20va092NnZTaUZZSFl3aHVKbHhHWkF1eFcyVWZHNlUvOGtoeDVSU2Y4?=
 =?utf-8?B?RExyMTFvUWxvcmpqZXBOcG9pd0RzNjBOaTI5aFUzazAxNjZyUldaK3UrSy9x?=
 =?utf-8?B?U0lKUWJKTkRnaW9WY0NvWkhISXFuZlVBYW41NmpxUVNpMEJYNThhK3FqU0Yz?=
 =?utf-8?B?YTNqcGx3OFMxWWdMcERrNzcxdG55MHlIWU5XTkRLRFR0YTdlalhvaHhGZW5I?=
 =?utf-8?Q?5934zRah+l6OCztJ4NKKUJ8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b433aa11-d269-43f4-57da-08d9aff03318
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 08:47:23.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BWuRlk4EYbDgW/NcSa7ZeophqFVvwyEBBWsdao0RIEVV+ASS7dp3ZBXClCMCUq+OFfPu1qoeBOy+2PxKK32wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 24.11.2021 19:47, Andrew Cooper wrote:
> Real hardware behaviour does not trim max leaf when certain features are
> turned off, and will report blocks of trailing zeros.

I question that, but I'm also unaware of a specific case where feature
disabling (presumably in the BIOS) would lead to a trailing unpopulated
leaf.

> None of the software manuals permit any inference based on max leaf,
> which is why the 4.15 behaviour has been fine for the lifetime of Xen so
> far.

Yet the behavior with AMX (or KeyLocker) becomes quite odd: VMs would
see lots of trailing empty leaves by default on hardware supporting
these, as soon as we have (opt-in) support for them. That's because of
the large gap of leaves we're not making use of just yet.

The manual not permitting inference doesn't mean people can't infer
things. Whether they can do any bad from this (most likely just to
themselves) is unclear in the general case.

To be clear - this isn't an objection to the proposed revert. But the
aspect wants addressing imo, and not only in many years time, nor by
simply continuing to ignore the AMX work which I did submit over half
a year ago. (I didn't even dare to submit the partial KeyLocker work
I've done, both for this reason and for it being just partial work.)

Jan


