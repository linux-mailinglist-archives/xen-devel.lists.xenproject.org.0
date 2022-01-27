Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBB49E625
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261567.453019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6nx-0000Pe-2D; Thu, 27 Jan 2022 15:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261567.453019; Thu, 27 Jan 2022 15:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6nw-0000NQ-Ur; Thu, 27 Jan 2022 15:35:20 +0000
Received: by outflank-mailman (input) for mailman id 261567;
 Thu, 27 Jan 2022 15:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6nv-0000NK-Uf
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:35:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1b03ce-7f86-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:35:18 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-NuPJrPh0Nlmj-PGdE7Ua7A-1; Thu, 27 Jan 2022 16:35:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7703.eurprd04.prod.outlook.com (2603:10a6:20b:23c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 15:35:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:35:11 +0000
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
X-Inumbo-ID: bb1b03ce-7f86-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643297718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPujNYUxo+0Gasu8USXOZu8hbrzsyrESsyFPFo/qBsE=;
	b=FGcj/SDArLxmNnIbmhtOb0CjoY/gHdNDO1TC/qLO0CeTndlEB6KCs4VPVOHasTxhjoJYpT
	d/mHGxQjiSpCiW/zIxE7mj1BsxbGbsulJpaSY5ZxGlXb5+otNtiX4p9NwI5uuV2rR5MQGb
	xmRRJ6mDcsuT5tV6Tc3dFPl0qnHx3Ww=
X-MC-Unique: NuPJrPh0Nlmj-PGdE7Ua7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFWUXvH61WpszFfFWLfI5v8ukv2Kx3Vn/YFVB1Z8xz9P1Yu3SD0OxTaGI5kyjSrX1bupZqvMTJLy3Wxq/HGvGhl6gxU7AQgihAirKZrXtA07xEjsKjB8ev+iYI29oxac1mUO/CAFH7dvhR267v8Zc9jssaYp/vRDrX721GJS3TNPtjeF9l/suTioC1BNOWtAsGtf7xvWT5Lg4s28LE3pM0oUjRhtqPgFzSll6Xv/cAUQ7NFT9NF/dFBf9ovID6Af5WWBq5jo5M2/UOP/g9mbX0QVGlLIVuREL5yrQkfxS0Jmf7mV3GrHXCqW7ZqTgbDUlVgYU0sadnU3TNS91QEqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPujNYUxo+0Gasu8USXOZu8hbrzsyrESsyFPFo/qBsE=;
 b=FAKSBqEexS0QoG5toNZDnzbd2pp2TFq1cymL9unGQOG7M3mQxSSesu+HDgqzyASYNBDHee5drGz96e/3F0EW/U0D/pueBsqCzN4clIxee0Kp6TWLNUpASxeFRt4BGeXe4RvlFM+17t3kM04EPDbhKtJxzeTVFRBoi2uamTpP01hB6ZLBZ0w+C9WVqykkasRvilog9P8RA1wZedIL6niz5Q+cJkGZky3f0nh7cW7AL/PeB3I2o01fF2dO+/ND99RzMKTINTMwwXzgO2u9bBTe69NfRk54GO64SSc9m9vDHEWhOQqaq4Hm30duQLzkcjC5dZWWDo2j3y2FI1iJENNZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c0beb93-0d8c-ab47-cc33-3a8554f41a9c@suse.com>
Date: Thu, 27 Jan 2022 16:35:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 01/30] build: set XEN_BUILD_EFI earlier
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0158.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7038699-5e9e-4d1e-6e2d-08d9e1aa9b4f
X-MS-TrafficTypeDiagnostic: AS8PR04MB7703:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB770364D00A16605C74407A26B3219@AS8PR04MB7703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vjKyHkLnkJi5yCZgMmnzLjkBTqL4leI2+u04M4+5JnVOVze2QqOKWW4Vr5ly7sIGhacY+K1JaA/WKO+GQsIGctzu/HOX3wbY0f3ipn/rgfiWHxRXKm23plvwZYQ/TxJxwcO+rAh2ndnOUUiKV54B2P1V50z6s9mQLCgj3DDlI3gQtKfxSoLfpJsuLfVpeplv5yP7S/GVNl7hy6oSz9RTcKn2MUzFEKKNOuSvuBIw9ktgfGwWsYSGXT1Cbq9NAQ1NjHDjJOuUSkQOpGDBu2R5TRQbJ96MjY/bbWk6fEsK76v8amlO8GAJkr1ATSV1R6d0qLZnx5yuC5pIkeOTQ73lNVoTHL8V+DFrfFuupeXkpdDEPF4ouLvsSZsFqRu1quYHmpRhMHrCsh4GWrp3TJxrH6I4qGwzq0T3seNTE5g3PvdmTBAzbdOjHRUE25lCwzGQilKXz5kW+lQHWq4B7Czu7ZZgKZUfI48qvgBNJ5c7CTirIJQek5S/4AG+KWskyc8H30WDttSyE9QagllQQ40+czvd8a4oGBZ7xO2ipnCeJP8I03AHOFSqVONf+BaRHYMl505nx2aFTyhLm9BZHzZyPsaIo0NAyiiEmwzdWsoVVWQ6lk6XLAkAaI+rY5op5Qq+ivecZ04TMIvEZPl228nfe6n86SKairDQYfwjMVTD4ugvCLT0NC8iimpdGRy+5qVoOk5itUPrEEacoEjFyEEj8WXNrTUNnJuqi1mL/fMatsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(8676002)(53546011)(6506007)(6512007)(26005)(83380400001)(36756003)(4326008)(66476007)(8936002)(6486002)(508600001)(86362001)(5660300002)(31696002)(66946007)(31686004)(66556008)(38100700002)(2906002)(6916009)(316002)(54906003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEo1SmVsRkdrQ3dqcXhIRG1ZUzRFMWk0R0t2KzRFdk1Fdk5FTmV0Y2pNQlVu?=
 =?utf-8?B?ZUFYNE5tSHd6bkc3c3hDMmZFRlhYbG1YSUxJUWJIU25tWXhaNGVYRGlxaHJF?=
 =?utf-8?B?TTFZUDlmK0hzd2FVRmRVMmlkRUIxeHVTbGVkZVIzMEREc05aTHF1UFVFZncr?=
 =?utf-8?B?UTJPTWM4WnN0MlJNdFJVUDUzRmZ4bFlZaUxqc1hJMVl6ZDdKSmhEUlo5NDBF?=
 =?utf-8?B?cEhhT2RRblB3d2VjeDAvcy9DSHFmaDd0SzJVSGJqdW9HZXA4U3lTQWQ1eFY3?=
 =?utf-8?B?UHJlenhaa3ZRNSs5VGhISmh4M2pTSUhQRlhtZ3pYYzNGVzVrQmI3N2U0SXNn?=
 =?utf-8?B?NEhyb0ZiSWViWDRUa1ZQWm5LSjQxcGI0ZnJGUnVmQUo0SkZCRFhhRlU0QWJN?=
 =?utf-8?B?S1V3NGlPMmhDWE0vQS83RjlkVk1XdmpyanhvUEZHWVI4YVdXcjIvelpmaVdS?=
 =?utf-8?B?OXI3dDlmVzNSZ0NKNWNXenlTNzVCakRXOWV5SUVDM0hGRUdJVXdBbmtvZGxh?=
 =?utf-8?B?a3B6eWFCZHIrU08zM3lsYWdjb3V3NzdhUmdXT2R1SDQ5MzBhUjlubkJFUDZC?=
 =?utf-8?B?ZXVrMmhKWWhOSGEwMXc0MDJCdHpla0c3eG9KSUU0Ui9sK1ZwWmhoRFZVQ05E?=
 =?utf-8?B?ZVI3TFlYbm91SnE2UHU3TVZMclNXSU5DVjcvSUswR2RDcHlRQUVUdzQvT1Nl?=
 =?utf-8?B?eEZNR2pnRUtvNVpZM0FnKzdTY3lDTlUxU0FMdkp6N1lJUmFNMmNMZWNsVmRC?=
 =?utf-8?B?bS9oYWFpalkyYS9sYUZtMmgyK2pVbmRpNjNCK2sraUNkMVEwZVNqTkFEbDRn?=
 =?utf-8?B?bUJDMXdVaDVuajlkeUZ4anZqY2pYc1hnVXlzL0twQlBLQlJEQ3NhOXJvcTBl?=
 =?utf-8?B?MDMzYTJtNXl4bHMyYnZZRlJGRy9VL0NCVm5YM1hnTXJxWEZ1bjNtc0RsZXc3?=
 =?utf-8?B?ZUcvQ2pHbDQxL25QVkZjSE1jN3VKbXp4dlJVL0ZnbEorQlkzdktkNjNoeHp3?=
 =?utf-8?B?R0k1Z0VpazFjTWpGZnZETU9aQWdwbUl0VUQwdXkyNGFrc05CSVVzc242RkJD?=
 =?utf-8?B?L1VRb1RabXpxWW9hYUdpNlhyai8xMjFrcFRMN25XK3B4Nmtyb0JOb25qZDlB?=
 =?utf-8?B?dC9EOFkwK2ptZEIxV1drdjNpcXZmSmdORzRWNmdhZ3VpaFI4OGFGN0xaMFJT?=
 =?utf-8?B?UVduT1kyQjdsaVlnL1ZEMUsrUHZtQVphd1djaXhhbnU5bzQ2aTZPdjJ6bEZz?=
 =?utf-8?B?T1lFUnNjbHFtcGxNTHBtVGZLM1g2RkhGZ3pmR3hJbS9xNUpENk8wR1V0WG10?=
 =?utf-8?B?d3NWNURTeWh6cmFXRUpVdHRGdkorTVBEZ000WVB4UDd3YmY4TUpwMEdpcnRL?=
 =?utf-8?B?YjAzWjhSWTFURmwzM1J5QUl0b3laQ25oTS9Yd3JZdkZLRHVLU3BNTEpHUTU5?=
 =?utf-8?B?cXpHRWtESWQ0bHB5UnRaZXFXcGRiSVFLTHM0SUFCZitIdEJkcDdOOTVSLzho?=
 =?utf-8?B?YnFiUy9RQ0tuTWw4S05Iay8rNExOSVNQK1F4b05MWUNaTkFqa0RrVjZVbFgx?=
 =?utf-8?B?VmtnYW1ncWxHQTkycWorWG1XM0JwTGF3eG0vTXlQQWd4YW1INHkra1E0c1ZX?=
 =?utf-8?B?bzZUKzYwMHBHdTlKS08zTEFFOVVvbTBsSlFNUlZhRUYvbUNLbXJXZWlRK2dB?=
 =?utf-8?B?cHBVWTdNVHhoOU5JeWgyRmdiTkN1bFI4Y1VIOERId2hQbWV3MXoxTExheWpE?=
 =?utf-8?B?MTU5ZXJpV2RWNytFYWdDTUZuR1NrU2FDNXYrcnMrdWQrOFlIUFl0SGFncDRE?=
 =?utf-8?B?dzY3YWdsZVhJOGdFa0NvUzRSWHhpREF5V2FNek1VYjV2VlVjblZXRnhUdUxM?=
 =?utf-8?B?SXEwV3JCYk9xRlhxMGJFblI3Y0VlRmJDUjQ3Mk4vUEJWRVZhTTIvam5MQUhl?=
 =?utf-8?B?Q0FPOTNsSFN3V0htQ256eFU5dHkzMHhhczA3eEhVaUhraFBxMGhKUkJ3Q2gw?=
 =?utf-8?B?eXRWOHdFTmYwK3luMWhUWWVQWnc2czN0Zi82R1lLWWRzYW9LUWdtdXlvLzdx?=
 =?utf-8?B?ZEMwZTlyWVdDMUt3NWtlN0tQa0V6RVBkdlhuZDkrZUwzdUMrQ1BsbWtTcnRS?=
 =?utf-8?B?ODN3cENRYTFoREVuWktURVYwV05VdnlCYVJwSmxuSDYxNGxTbzdmM3JobHR3?=
 =?utf-8?Q?wbZZP3VHLeOeqBT9lOU2k8g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7038699-5e9e-4d1e-6e2d-08d9e1aa9b4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:35:11.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ0wsfp0IrSIUzqsNHOSRrFQkwOK8iQewgLCnnj5iy23iQjaKgdRDy7vuiLiAKc6uUlXO9neMDUG9v64Uchv5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7703

On 25.01.2022 12:00, Anthony PERARD wrote:
> We are going to need the variable XEN_BUILD_EFI earlier.
> 
> But a side effect of calculating the value of $(XEN_BUILD_EFI) is to
> also to generate "efi/check.o" which is used for further checks.
> Thus the whole chain that check for EFI support is moved to
> "arch.mk".
> 
> Some other changes are made to avoid too much duplication:
>     - $(efi-check): Used to avoid repeating "efi/check.*". We don't
>       set it to the path to the source as it would be wrong as soon
>       as we support out-of-tree build.
>     - $(LD_PE_check_cmd): As it is called twice, with an updated
>       $(EFI_LDFLAGS).
> 
> $(nr-fixups) is renamed to $(efi-nr-fixups) as the former might be
> a bit too generic.
> 
> In order to avoid exporting MKRELOC, the variable is added to $(MAKE)
> command line. The only modification needed is in target "build", the
> modification target "$(TARGET)" will be needed with a following patch
> "build: avoid re-executing the main Makefile by introducing build.mk".
> 
> We can now revert 24b0ce9a5da2, we don't need to override efi-y on
> recursion anymore.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


