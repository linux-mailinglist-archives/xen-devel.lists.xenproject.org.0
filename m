Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9567D6B3D3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 12:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508471.783146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paaa4-0002C0-S1; Fri, 10 Mar 2023 11:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508471.783146; Fri, 10 Mar 2023 11:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paaa4-00028o-OR; Fri, 10 Mar 2023 11:06:36 +0000
Received: by outflank-mailman (input) for mailman id 508471;
 Fri, 10 Mar 2023 11:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paaa3-00028i-QN
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 11:06:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e7c09c8-bf33-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 12:06:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9221.eurprd04.prod.outlook.com (2603:10a6:102:2a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 11:06:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 11:06:31 +0000
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
X-Inumbo-ID: 9e7c09c8-bf33-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmtxPkEegL8Lk+WHxVnbAOmLJK46xuP4I/crLTb0p89aXeacIf8Eb2jYCy5Bu61IvScNs0rBkk9YvJo6p88TFmqmXL5tLsNSLPY7+gW/szQ5KY1aAkYw6BC1uEAMY5+ErcvrjKc5iLMWDoVwBFTybkwc1CENwZmlgninmKMPfZx97uz5mCXJ2Jl91HECad32EIFUxkd8iQgNlU9SUn1CwyqmuyQlu9d/kblCI+GKi+mnfMxGGf2iX6QT/djnlUblUhyyFkVlnRByH5A8FHTMQCSSiOrC1qe49m+ZEpP0cz0rlKNIOCvtq2ox1qfpok9G6mjrc6+ycXl34e3RkGKpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnQ6wnNKTC5NlFeCX1Lrcuqeu1MVLdf72NoJSaFGOl0=;
 b=DJkq7CoqWJZUNw3hQGtHvHA1w666fk4TwORfPC5GNA5BJmtg6W/eMRBCWxyBPp2BlD+LU1DheBqa+7ngFhneA0HwazplidF1jHg/b4Fc0D+8WKDlg10hLUGanB/srE1N/jU3EL8ri49qh5z5BEehaXUw2DCAWcdb4M7B56ngilw9dmSDoh8tEh+oKHV1ZqjpyiKeBVVvQC5LaA5/qCuVW0zPE/ZMQvKAsfrKXoRHj7W9NlZa2Td6si2ttLp6jju0XGhKTN+NVHJts7Qgi+KKQCZqH28lJknUTDjvGx694+uUg/Yz+tl7NFmb1Tmuux042eHuPPIl/lwefLtVVc7Ptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnQ6wnNKTC5NlFeCX1Lrcuqeu1MVLdf72NoJSaFGOl0=;
 b=HQCWx3Qf//Lpaacrtv8YdCAyLIFuvFg/u3+DGlU+FkasRoFrX5pe441AuLydB3n8BARqdvYJSzxUB1MfTrceEtJm6wsuHSB/LxQ8ZHUu3O8qz/SlL+Y/pD7RrCxFe5SrHzgj5WjGrNNS2mv/4oUG/5QJJ02lvhR96WcLbjtOywc5kiax7Abi6Z2GyXXR3l+tMq2StTyvhHWk4cA6Qxaf2mab8xSnksQqS6u93wBFMl2axjUCar5ivSzpcNqDkPdzmC1rpOLrT01iPGU1gYLJ1Kn4w0ihQDl3S4T4BmUxnIYBvzA7zbNhPe9FmCJ49m6bBByr54pzAl5TP+FxlWeLgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
Date: Fri, 10 Mar 2023 12:06:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/vpci: install test
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230309165812.33918-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230309165812.33918-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de68db4-fec6-4d6a-df35-08db2157813c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lb7nz7H3SqEiaQUd+b1GpfR8+pX0a4mnpVXea7WpzsDKHyCIpT2Urr4aQPO8w8im8dxZDKXGys1SsHVz8eFqSZXxpsXiZne4Kn84DsBQDNzpf2dYVjdt22cjG4xmN89wv12V4VwXkVrGY/HHfrjVHb+aKvwfGAOnMfTj7S5I6Gang35Q8bT46h8RDrzW3pujoWuALIbBPtHdU3CA5le+QPDGNRCeMbfENyUedQ5ssMvvnATPPckIylXqGBPTF8+y4uAwFoj84uXntqGEgs/rUCsCV0U8zfJvH9qvUOYjzXaykUwGoCryosjWLMTMF71/yFhPwUIpY5Xde1Pjv47VmVIqVA5CTn/EKPGWBfNi3C+B6uhCoaTLQq/cjKSVCgLEGQocC0inKExhCxH3aDzssU3Oknf4TqZ4dv2YQK6+s/q4ACAr8sw1t84bj3YYW8EqFwnFQlBpKyJjVTNgLRumWwRYmOlh9USH0ObbVHF7FovC2Ud+yNlBnlTvVRUzv0mX0e4bMZjKsGo6EUjTdiwfP/GvBZLxunQCGmTaj+iUsn633dy1MA6KiZoJANamWO6rZnBT3mDL+pcSdzBSRI3J839+3NYOcIFIuMoxI3ImyXjyUfz/++LiVzKg+PAqsVj17o0mIULunFueTcnjPpSAqa/Cdv+szmpmBP0QhdmARZwwBHFPSrYOdl5UNJ57L11EsG/IMu++Z7HXrY1pWid+9H9O6dmf5CASRiuaJxNJ1Rs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199018)(66899018)(31686004)(31696002)(36756003)(54906003)(38100700002)(86362001)(6512007)(6506007)(53546011)(186003)(2616005)(26005)(5660300002)(316002)(478600001)(6486002)(4326008)(6916009)(41300700001)(66946007)(8936002)(66476007)(8676002)(2906002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGthamtvLzJpQTh2eUo0WGpiRVJqWXlEelNsa05WRTV2NEF2bUd0V2Q4U04x?=
 =?utf-8?B?S2lyOVZSVFpxb0pvKy9IaW9jWDdMQVd1RGJibHJZakwrSDNFUWJyMDZVU0V0?=
 =?utf-8?B?dzJLMUw3YyswbXN2U3dta3U2VWpSSjgyM1B5NHZML3R3L0hPaFFtOXRtZXdq?=
 =?utf-8?B?YkxiNTQzRlBHOVErc2ZNbnR4TUVRSkUxczBVeGpMM25QaWRVeG5mMjNwNlh2?=
 =?utf-8?B?VTRYSlo5ZXErbTZYNTZHWjFFdE5DMmFGWi9wOUFyYWU2eE1BampnLytBL21E?=
 =?utf-8?B?bWJMeEZGenp5WkNuWkxMdXdLRDlrNVJCMWZiL0tyYVB4Smp1YXNCeHljUmo2?=
 =?utf-8?B?QWNHOE5zRWhBcHMvYzZwUGg2K1dZcTdpNUF2RzN2bnovODVua2ErV24xckdx?=
 =?utf-8?B?d1NXV2tpT0JLek5JakFaVndGaFZpUWNRTVRzZGNZYUR1TUwrRHcvd2paUHZE?=
 =?utf-8?B?SDhiV1hUdDJKNEgyOU9xdGtuOEgzWk91Rmpud0g4WUROWGtCRUxXNWVuNnF0?=
 =?utf-8?B?aUxmbmc3RmhJRVlFeXRLRVVEcnVmWVFrbHhKS2NGeGs4V3JKUFJJMEhWRW4z?=
 =?utf-8?B?bE95N2pMb01mejZ2RUxsUnZISm5lZWdqYnIwUHhoWXJ1Mi9jVnNwbGh4THl1?=
 =?utf-8?B?Vy96SzFsclZiUWxtT0VZdnVhYVB3cS9GeTFIbEdsYXpSc1MzMGNFaDhxZzZj?=
 =?utf-8?B?eVZPdTNEc044b3NZN1NYK3FWRFlpbGpIMmlqajZRVEk5cFQyZU04WlZic3JF?=
 =?utf-8?B?dSs3dmxRMlhmck1oOUVtS2pEeVgvYnlMdGMyT29rNjlyNS84djJSZkVsL1RY?=
 =?utf-8?B?akRzVExNc2ZvdXhQV0ZHT3dsOHgxSkhkcWJHVXZrNERsa1I3WTkvSjNFRUVL?=
 =?utf-8?B?UXBONjJ5MCtsWEswbDJKSE1ObkwyRnpkM2prYmZZcWpDZ2hQR2ZuT1FlZFB1?=
 =?utf-8?B?SmdzNDFDU2p1UjhvMG4vREs3RFM3R0JVR3VjQ0ZSeDRzRFJaenhMVk5oYXVR?=
 =?utf-8?B?TXk0dXNZazR6a0tEdURBdDdvSzQ0REVuRC9qYjBVYVdsSkJhdDJBS2daeHEy?=
 =?utf-8?B?Z0ZiSFd1WFE4TkNQcVVQQm4vaEFIY2ZHWGZzQnB6aU5mVkZSU3QyTk5PWW40?=
 =?utf-8?B?RytRdXVhMEtackpMUzdaWkM0UGxZWC9jZ1BBc0ovTVpxSHRWTTdUV0FXNlVo?=
 =?utf-8?B?Sm9teG1yd1VrUCs2dDBuUTQ1RzdEc2xQY285TEpjMk1qSnorYm44U1RoQzlo?=
 =?utf-8?B?ZGlzdWF1MFNHd0I4ZjJnY3N4dkFKVFdobjNKS0pWdnkxOGZIOWpwQnErRXU1?=
 =?utf-8?B?MDVESVJoUU1oTjN1cGNVb05EcUFLRkcwZlU2ZElxSXV3R0JndlgzYlJLTnVT?=
 =?utf-8?B?U3M1QmVWendDR1I3VjE1TkRtbG5qUEEvOXVHMi9jKzhvUzVxUUhzem5UcytH?=
 =?utf-8?B?ZElWZW9TKzZPRUFrR1RwYUkrcmMzc3ZXcW1pVUlOdEV3Vjg4L1pDQUpKZ2RT?=
 =?utf-8?B?Z1JCalRocXRYWGd3WnNjb1hlbklPRGppQU5zUmdKUThTY0JPTjF1b0V6ZVpY?=
 =?utf-8?B?QkNBV09jOVN5Vm5VL0hmaHVFRm5PNEkxeUlKVW55aUJGQjExMG9mWlBHYVFt?=
 =?utf-8?B?QncwczlyekZzRXo3Y2N2SmZEM3VtU3VNeTkyWVN2UTdpZ0pINXRJa3hlbGFS?=
 =?utf-8?B?M2dodHpIKzdkZE9abVNPSWl1bFhid1ZqbEY1aDJMSG4zY3pJZUVtaEpkM21r?=
 =?utf-8?B?NS9YYkgxaEFaK2FRM1NUd0ZrV00rRWkvWk1CMU56UmlmUDhHRDZMMUgzelpk?=
 =?utf-8?B?MDlCOS9tK3UwYkpOM0gvYmZXRzNCc1pXN0I4N3lzVmFTOHNNS0Vmc0dLUEpz?=
 =?utf-8?B?cjJEYndSWkRVR3h2Qk9XMlhtbTcyUlBPQ09kUDdIZ3RZbjhCeVhDU1FFdW1x?=
 =?utf-8?B?Z3dIME5PSFM5U1Y4OGN4QUtoekVaZ3IvWW11SWwvU0cxcnZYSGxlbmlVSnRO?=
 =?utf-8?B?SzNSWVBtdDBMYlF0VWhFSWV6UStreUdiMXhjQitLMk8vQjJ4eXJNNnJtNmtV?=
 =?utf-8?B?TEdvazR2YzRqL3NodlNmNm4zNTdieW1WWVdtK3UxTG5JL244MVVKd04wWklt?=
 =?utf-8?Q?6oOsgsTmS1qzuU20pxfEOds77?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de68db4-fec6-4d6a-df35-08db2157813c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 11:06:31.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymwlTFPI5WNIObUgXpNgxRqmkmJvYgYHP7wa3PVs44LteyIeu/Qf0YPMHLJJ0iUdtYNCgV5gcdlW2TQv8FUdFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9221

On 09.03.2023 17:58, Roger Pau Monne wrote:
> Introduce an install target, like it's used by other tests.  This
> allows running the test on the installed systems, which is easier than
> running it during the build phase when dealing with automated testing.
> Strictly speaking the vpci test doesn't require to be run on a Xen
> host currently, but that allows easier integration with logic that
> runs the rest of the tests.

I accept that as a possible way of looking at things, but personally I
remain unconvinced of this model. To me what is installed should be of
value to users. If there was a properly separated directory where all
(and only) tests were put, I might agree with installing. (Nevertheless
this isn't an objection, merely a remark.)

> While there also adjust the makefile to use $(RM), and rename the
> resulting binary to use a dash instead of an underscore (again to
> match the rest of the tests).
> 
> Since the resulting test binary is now part of the distribution CC
> must be used instead of HOSTCC.

This breaks the run: goal, doesn't it? If the new mode is wanted, I
think the two kinds of binaries (and rules) need separating (maybe a
way can be found to avoid duplicating the rules, which would seem
desirable).

> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -1,7 +1,7 @@
>  XEN_ROOT=$(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -TARGET := test_vpci
> +TARGET := test-vpci
>  
>  .PHONY: all
>  all: $(TARGET)
> @@ -11,17 +11,23 @@ run: $(TARGET)
>  	./$(TARGET)
>  
>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(HOSTCC) -g -o $@ vpci.c main.c
> +	$(CC) -o $@ vpci.c main.c

You're losing -g and you're also not covering for it by adding $(CFLAGS)
(there should have been use of $(HOSTCFLAGS) already before, I suppose).

Jan

