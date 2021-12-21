Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E947C111
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 14:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250439.431353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfcM-0008Eb-7S; Tue, 21 Dec 2021 13:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250439.431353; Tue, 21 Dec 2021 13:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfcM-0008Ch-3f; Tue, 21 Dec 2021 13:55:50 +0000
Received: by outflank-mailman (input) for mailman id 250439;
 Tue, 21 Dec 2021 13:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfcL-0008CZ-6h
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 13:55:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b32f743f-6265-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 14:55:48 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-ZWpJHu5pNVaskHTUbwitXg-1; Tue, 21 Dec 2021 14:55:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 13:55:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 13:55:44 +0000
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
X-Inumbo-ID: b32f743f-6265-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640094947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1RWhUs2+DHPluwwz1yl1iTiqXUhji8RpvoJAWT0rVw=;
	b=T2+h39WyEp9Lhw8mkbk3Yv6lumGaHUx8vr12ULFZckHGKFp7MumZZu+VzktLPyPViUhWUF
	hpXVElQ/yPyiNPV0GLm/F9+fy24PNACFFTnzQvh2qMNIYwOMgQxk0l/lJaiA7/uNKs9wN8
	4JJtLj8Ty83k4pBuqQnCPusl0U7LMaE=
X-MC-Unique: ZWpJHu5pNVaskHTUbwitXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq9OPfWKMAwua33tYtuEOZJ2e0ndZQ6PdiG44xElvqBLcKhQIrI/DTK5xIjrD1RTJBu1BkgGMr3jeT6V4BDs93RoY9BLIaOxScL5s7ffxIIyJeTDGMQa3KwGTYVS5nfMAY84eiik4IcFXvnP8+mNScriHcop7q0hjhWpu318rMotfWmU8wVh61ic/StoZdlSnZ28o1PcNKDTxa2LyglW77kFm88XA1t3VGD3rjnzd+5b9NfGjxeqxYXLPcIMcr/Lbb27sT1ypbZyfPSpbLhTHhNMfmx2ROacHrKFL/tlejJeFp8TReQDEJvsInZ6OF4NoIE3ZOFquP9th5SbUbjVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1RWhUs2+DHPluwwz1yl1iTiqXUhji8RpvoJAWT0rVw=;
 b=gp8xXcF+U+gb3R15U3py6aI+Kww1Pt8LFRm34nEv7Mu2Z47jlahQnENFFxnbSypefDpTuFgpaOmZz7NqjLCVjcipYNlYlXVXChLFYGqDfIUlX4OowZlcKJg34aXmvE1n1WgD5R5aObV4B7NRN9/I2573Crt48BfYA+xg5PWivp8NHmLRbn0h6DEYNDuZS+sdileagRniZtHFhd5DM6PZUl2dxZR5dfJyycno2Y86Djs4odMPEdBO4dWxXehHhCt6tlEVMmGNIgo8f2bMl+9njqqWBNFdeO6bbgNkePgcI5rYKB2rk5UIq7TvUadrkJSUGp+JDBRi/ZAmoM/Lh35G2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9147d893-2335-a8b6-af65-6a169849e20a@suse.com>
Date: Tue, 21 Dec 2021 14:55:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 28/47] build: replace $(BASEDIR) by $(objtree)
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-29-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-29-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0092.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e818e64f-dc7b-49d4-0dfa-08d9c489951d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165A83519361C7F86B8718AB37C9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIZhZOt64ncbhWiXa/0FCF8RzW6flrX3uU786XmNzrCel3l0RxHwp2s0W44SFbMzKYqeaCE2WieW4qshPP8nGKZJmUcVRnVAClZka4oPdcuJgZw1xrAEPXYLujLN+8unXoXmlasvH38N5wOK0I7xFy0jkpbJS4Mvf13UQEd/c4vEA9H3F68f8VW5zi/eX+CeGBFCW6uw641/WxEKCBuf9bopoL+a1r1ok83oudILEKqzex+HoVMfl63Q3wYDj9MzmiLzkyFhELbsJCwuZMZZH/+LB2zs1ZOsPdJ8K3W/WZB6X92kCfe2GYDM1VZw6Omkorwm0dtmgmnF/4UwxepZ5k9S9g2Cb/xMhiaeXN7LTADez2lRfWSPrx7fpMqVbvVQOA5rDp8+WD3M4TQmipwx3+a7xn12i682nZmegVC1YQqJ6iKXhUP4xdqvYusWeJeUS+Pq+7B59386jxcqg3fsZYpyTK478/unLGbVjSCOqYM7XETXvs0vH+B2EzaQahtWhtzifhuvqSJHxGbZ3oHgEmCpBC97+VrwImtD+8eyf/uGy6IlPv554WPGtTNA0mFIE7kGW5xQIww3H/kfU7PfWsmVig/OJvrZ45HdU3tY9ZzIW1vMhB8HUHUJav7IU2Fd8UynL9Bi32YDJ8vplXoBClJ9nmiiwXXUuR//ZQA0wjHMcyFzsLaGAxwZlEBxdF8cGcLbNsoTYNG5dpwZuO3Z/SFsn19bg0CjumZr/Ym5RPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(558084003)(186003)(31686004)(6486002)(8676002)(31696002)(54906003)(4326008)(2616005)(8936002)(2906002)(7416002)(86362001)(26005)(6506007)(38100700002)(53546011)(66556008)(5660300002)(6916009)(316002)(66476007)(508600001)(6512007)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHhmbE80V3lzS0lwZ2toYXJtbUMzeTYzMnpGQUF2bFRFUC9rcC9jekZRYzN5?=
 =?utf-8?B?b054S0xlUnVrbHREYklmVkxaRlhlVUxKYytkNW05bitWSlRUNCsvS3NuVTVz?=
 =?utf-8?B?c1dRT2l0bm5GNUlyYkRaYkRrcExSUUZBWGFiVUE3V1A1ejA1elN0cnIrRlFV?=
 =?utf-8?B?R2FwcnV0KzIwQlB1cEN1U01RSXJaYWplbUZ5ZmZwYk9BNzNIZi9vSjRUZ281?=
 =?utf-8?B?ZCtLNEdja3VXdER6Tnl4Rk1PS0VWbjYzcVE3aGV0bzFoVGQwSkM2SjBxcHdq?=
 =?utf-8?B?c01GLyt0dzBoVkFzUDhOd2ZqWGNDNjZVbFFOeFRHRWwwUlVnZmd4bXRxeFBy?=
 =?utf-8?B?SXpTVXROSkI1d1ZhZFVRZTA1V25aWlF0WitFMmhTS0drbVN5Q3dHSGN6elF0?=
 =?utf-8?B?WGtlWXYwMU9VTkxrSHA4S3ZiVUtoUnYyUlk0RWNMWDI5WG5WemRWbVhYWURw?=
 =?utf-8?B?bDBhd2JNUDhTZzB2Z3NSTGgxQ3dNM2w5djkvUktuNWNNUE5NNlpIR3VieGM1?=
 =?utf-8?B?a2tDSFBpdU9lS1k3VmJCZmRVakxtVmZFbldCR0o1RVdsNDYxSWJLOUgrV243?=
 =?utf-8?B?OEd0NENLR09WdXI4UXlTbm90L2NnRGZ4c0FVV3lJSytaKzl5V1dNQjIwL21N?=
 =?utf-8?B?MWh3Yy81Y1N1cGdGQzZzcVNubmwrcEZoQmN5OGUvZ2kwaWJqdnE0a1B4RXlW?=
 =?utf-8?B?WUNMaGFiMDFEeURsOVVPRU5hVUJvamdFWnprM05sbUxmVmN2OFk5Y1BWYkxQ?=
 =?utf-8?B?cGtVWUVzSTV4WDA4Sy9hS0pqY0RHam5ocXBmMFlCVk9wYWEwUHFLekFFTU9w?=
 =?utf-8?B?MTFlMDVqN1JpTVhHZTN5b0ZsSGxYUmZyV0VkL2dOdFdzK2Z5SzNPLzhzcW82?=
 =?utf-8?B?TGJ0bEkvaDI0MFhEOTc3K1pQbUs0UkdZWkJpT1p5NWJvaUFWdFN5YWNxRjdL?=
 =?utf-8?B?bkt5MEVlQ05NeFZDc0F5U2t2aGV1WnFoaTBtWHlwdk9oQVdQd1ozcHE4NldS?=
 =?utf-8?B?RFByY3ZORDJDTnJxVEVrSlVRaE83OTA1NzV1NWNxVWpCUFM0M0NhNVpsYkxy?=
 =?utf-8?B?U3VlSWUvQnNTdHREeXRpcnR0a1loMDhoMXFLTGRDQ3oxRjlUMVBBa3kxY3Rk?=
 =?utf-8?B?OWdpb1ZzNk90NzBWdlljamh3WTcxQklCT1pZT2RxdGwrTDRqNld5Y29tWVBi?=
 =?utf-8?B?QllCV0tYNzFFbE1VSWQ2cHp1YzBQQ0s2dWMwbUFubXpjeDVIUEEzQzFUQit5?=
 =?utf-8?B?RnlJV1VGNDRvenlwS2pESTNGVWxUZ0NtZXlSVmtVSVpnNG9GN2FYS3U0VXU3?=
 =?utf-8?B?MmpScVZFaktkRmlXcDZEYXVDdGxZbys2YmFFTExlMXBJaWRsQWdJakxVUXhL?=
 =?utf-8?B?b3kycCtVTjRGc0RycTBvaGtnSWRBaVdrYW52aFY0aGVPMi9NZElWTnBIMWV6?=
 =?utf-8?B?UEJVb21ZUUs1eWtnOGtHb21oOURodFkzZHQzY0FJSHdNZ1Z3eDFtcUlwcG0r?=
 =?utf-8?B?N2d6Kzk3czNNQ3AraHRZSnRDNndVaDdrWGVlRitSdDJ3ZVM1TG1wQklKUTEy?=
 =?utf-8?B?RW1BWWxBSjhKQUxBZU1kbDNSMTNzaFM0Umh2MVgzU3BlVkdUTUFRUldsZ0cv?=
 =?utf-8?B?dmJmNzhmVHg2cXNKSHNQRGxrZDNNZUUwN241YkhrbEh0djlRbHdIdW50SDgv?=
 =?utf-8?B?aUF6Q3grTndoWnh1b1ZiSUNMVUhVMDRFMVNWOWRucTc0bWtSalVjRnRjY1kw?=
 =?utf-8?B?akZaZWp4Y2RJZUJ3NjZ3dUpveXlENEsxVEh6Qnl1VzB5cm9JR2xLL3Y0RVhl?=
 =?utf-8?B?enpsOWxPeTVidkx6bnpiL0FOblFSQUVJRTEvTXY0cnphbmEvMUl3WVZaYWtp?=
 =?utf-8?B?NUhJZGcrZFoxKzdFQkZSanV3K2JTa1UweDhYMC9QR0RJcnREdzJmQ0lpQU12?=
 =?utf-8?B?OWdIUUtsNktUNzFyR1hqZEhhQlo2QXNNMllsbjlISlQ4UENSdHVtR1ZORlEz?=
 =?utf-8?B?THJEcGgvaXI3eXlYSXQ0Nml6SklLMDhsdDNma2VPYTl6Zm0xTlpGMVFOeGhI?=
 =?utf-8?B?WTVSa20yeXE2WVkrNXBCNUdtaE9FN0lCZlZWL3FkVm5OQlFpZ08xcElRQ0Y3?=
 =?utf-8?B?RzdhUC9xVU5WWWE0aHgzK0poQWIxSnFmbmZ4OHZPYW9vaTFWWFAvZzRmYzhU?=
 =?utf-8?Q?JAwUR4NYTgiwZEa2rt8atWA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e818e64f-dc7b-49d4-0dfa-08d9c489951d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 13:55:44.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8MmX2sqwDPPB682sbXafrc2qxUWs78NADnZ4jTDEvbQfZ82NqWS40hJfVIuWK/wif1BRiArsKyU/c84GKSrOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 25.11.2021 14:39, Anthony PERARD wrote:
> We need to differentiate between source files and generated/built
> files. We will be replacing $(BASEDIR) by $(objtree) for files that
> are generated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


