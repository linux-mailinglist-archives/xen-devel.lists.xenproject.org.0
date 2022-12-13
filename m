Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646864B0C9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 09:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460265.718148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p50KK-0004tm-D4; Tue, 13 Dec 2022 08:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460265.718148; Tue, 13 Dec 2022 08:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p50KK-0004ql-AB; Tue, 13 Dec 2022 08:07:48 +0000
Received: by outflank-mailman (input) for mailman id 460265;
 Tue, 13 Dec 2022 08:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p50KI-0004qd-Dz
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 08:07:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 393bc1d5-7abd-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 09:07:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 13 Dec
 2022 08:07:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 08:07:40 +0000
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
X-Inumbo-ID: 393bc1d5-7abd-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7W1VnZXjVU1AN9Lht9pO982QE1c3cBi4IjBw0an5L3iStLEcSFi64Dwwy/6OcZG/sYH7eL7gpAdVOlwLQsw02CtbwbTcl1+FoF/fXDzjvKeAy5qpuxIvqC2LFdeC7G99/79+/BW/oGrtt+61my9iZ1B2O2JH7fpRtv8qrPIJCaATB0rA5xvrkmEX6h1EHF9A+Fv+YCY9bGo0m0FMv8AqyIP4Obpd0syiQLGlOnqh+QzwdGpN7V77hW3eUF4fcWVNadmnji5Yrj7ujDZtq725MWaLNWEl4IpxkOveab9H84oeHtFWrpE1YyOJ1h03Wh0pi2+NR2Zv7qxENVg7vl6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LmO4llM2TAx3cUmlwvYPFi4Vz76nFvmBmxk5BMFWRE=;
 b=TIEQpjZiZdr90II3k7iTYxrAP1/H3MpA0ZPviwRSCodAohvxMAJ85pjW2/RxFZE2HZIeI1+KLPES0FNhvAWgHGZ3taqcsHr5UNQh3m0qDgwgMnSx6qLTaRVn4wnFdMsOdR4YjJnK7vjSLaEfH5G/GLD+tKEWrO/HELUR5zZy26wCX1798ijUoEPNgIN2ch+59aVEgMgfWAlmNSDqR5EX6xQF9iGPPXgmPuAAMNrY/Hg7a3Kp1/gRhD/+928D5lEMYFbBtQGjmtPA09fKmXWH0poDcMNkrGzxy5P1q6e2m5keplTjxiyPuJ8aOx1QMEd3OAMg3MyOXh0pd3+G02t6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LmO4llM2TAx3cUmlwvYPFi4Vz76nFvmBmxk5BMFWRE=;
 b=kXRfcYoPyfMmhgSEYuC1DD5YWZfU0HCKc4UXPahVVtYsYltPqjdVS0ODd7B39yX6uv9/ovUnMmOFGkdoKiPyoBtJV2zAOto3aN2u5/cU3umBKjhYTYNB+27gz/ntlNM46jZfDNYcchB0CDUVOXzJvnMUtNe4AxaC3+Qsqo0N0N8nkymvcoN6X5Fd7QF/eRZ+gJ9HjZJc1bSCref3xdIVPXdRUWKIeDfP4kJxP8kurVoGWnXeIw/juKCdvx3CXEcLSviu/mWb8uUUqhvil16lcA/6xElHmW6s9qRJIxuPjGcYiB9MtSq2PmZh856dDyTZ3aEIFTSoP1BOgNZplixCuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c791770a-bc53-c5b7-5d98-92655e957f63@suse.com>
Date: Tue, 13 Dec 2022 09:07:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [xen-unstable test] 175154: regressions - FAIL
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
References: <osstest-175154-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-175154-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: c7165ba2-16e6-4da6-122b-08dadce11a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5RaCs8/MthMJIz8cNLdb/c6hkjcOkV6rHQVeH20hQayxAkutEE81MMvD4/Q+0k3UpMWcgObKvJiWqOy57rO/FtqeoW9hWBJhh8z49PSkR0oJKo/NzWBVEqFQGQXlXGnZiYxcLiC7zYtCoD5rpORKun3yF/mj1/DQ2eGOvY2Pj2ffbF/v5FNYz8kll6A//5Dw+DvojP13kUkEKZ5ZuqjkEbbEF9XkIc10q5BR2E1KT9AilLv4dgqS2Suc4ODlfeGYhUZF6Dfj2AfgKNaEicR2cB2MkbyzgLDn1FC0EXJO4qHSOp7ZHIeDfdaB5HOv6WEZQ4h9VK8hg+9uizaJr00E/LCOo8bjtuGcBl7JqATEZVdjDSraSfeIAuBvRhOZn3bHoVMxJfyfjKciWqx4Qw+37YF+lT5MHyU1sNkYW22gQVOtALR8CZ6NxI2irGcDdJxbwDu6zMk9ds71OiPjvG4OBS1XKR8XaFOc5sBXzgiI6Kk0kIpk4u+fspuzmsYZZFIDEdoWJXbwUZmcPUANDuocOwGb5Mua3NY1zT/GgHkSb+nvSyOcNg3xNAcG7jYgAUS/I4CeAwv4IYKrQHvKh9QmPT7jOVTEpncw5xetGUnsJFN/fGB/a6C+GaOUZaP5L8ZwyoRLN+FzyRt+9DGiBksqf+olx/0uYyH0u800PJM/zRK4D6VAygrrXvFxOLkJnq0oW1mMu3fh4zyJ9rCcUqqh9Lypy3qraxMAWakjXD8fEWyIouIysDyJf2Gk3quqTW8HvcA7HqSzkJUCQ/6/3DjxWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(6512007)(86362001)(31696002)(36756003)(38100700002)(26005)(186003)(6916009)(31686004)(316002)(6486002)(478600001)(966005)(6666004)(6506007)(53546011)(5660300002)(83380400001)(8936002)(2906002)(4326008)(66946007)(66556008)(66476007)(2616005)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3ZiMytnRjhiWStSRnlMRGMva3dIOFZpd3QyZzlNQ1plclNyOTNWWVdiakpm?=
 =?utf-8?B?cVpnZXBoMjlXUkFFZ2Z3SXJUMFI0dG5oc0g1T1FtVkN2ODFQaGpJeWQ5T2NC?=
 =?utf-8?B?M3NXdnU2MGcvNnpMZjdWU3BHaSs5UTZ2TG5rY0pOajZUZGxjMVlkU1E1ZWlT?=
 =?utf-8?B?TzY4K1FaOEhJZUpvRWRFeE1FbGZQdjVRVnZ4YlB3TzZmaUp1UisvdlUzMjE4?=
 =?utf-8?B?ZG5wbElHZHAxSzduOTVkTUVSclllMVU2RXZTazhISnhhNjNFYXlWRlduME40?=
 =?utf-8?B?bktNTWRiUVlKcDdHazFOa2NZaXVXZU9WbG8wTlJRRUhhVjh5NFVqNUkwL2JN?=
 =?utf-8?B?ZSswV2phbWp5bkxBTmhwNHJxd3N5QkgveFlwY2dSK1FrNXE5Z2hKZkw2M2VL?=
 =?utf-8?B?QWtML01hUnVNeXQwNTlRWCtZUFVVVFNucGNjdW8zeDJPVnRzWnlITU5aSTdV?=
 =?utf-8?B?K3hxVXRqTkxMelJmUnA5SzRhM1lWem5zUWhhQUluNTNvUUpxaFU5WWY4c2t5?=
 =?utf-8?B?bXJPYW54SE8wN3lhbWxRTkhTdnlhWVBmUktjVFI3MTlaQy9KbFBIZDB0dHhJ?=
 =?utf-8?B?a241aUQ0SGFoT0VTQWlyM3dQem82c0dLUUdPRFlieXBzMFh5LzdWUnRkb25v?=
 =?utf-8?B?dnZLeE5ZWGUvNlRTMFpkVDNMcGErdEZGSzc5dXkwc04wakh1eUJXMWZrbjc5?=
 =?utf-8?B?dHlCajdERnY5N3ZjT2R5L05TQ21xQUVlcEtrc1lkSmV2eVNYZEFVaWw1SExw?=
 =?utf-8?B?b21Fb0FScDBZSk1MYmVxeDhvV1BWcmxhWDRqbE90MXdlbDUwbnBUdk42c2dR?=
 =?utf-8?B?RVppZGZKU0hRbWdnY0ZuWlRxVzlvVEthRittUmxvdVViTDRuaXZqN3VoTjF6?=
 =?utf-8?B?M0kzTm5WcjZ2ZlhmbnpzVWQwUEVNZklRc2RBVEVid0VpTS8xRFY4RjRiOS9l?=
 =?utf-8?B?Sk5KZUltcWdiamZZRlEwSGx6WXNnMEZFTzkzZm1DQk9TS3BSbGtkV3Z3UzMw?=
 =?utf-8?B?U1ZSMnN0T0RuRFR2Vm1PMFJvT2xkbndDYjFpQUFuYjZveTM2aUN2bjM3Vysw?=
 =?utf-8?B?azRYQkt1NUgrQVJ6emtBdmkwdm8wOUwrNHg5dDI4aHpGWlIxdHdsVkRtWC9E?=
 =?utf-8?B?V3RzK0Y3V1FUSmhlRTNVQ3Q3azUyazlnTEVnQ2JyZVVrQXNyNjRoWHZFNmRP?=
 =?utf-8?B?aFhHek1DSnZZR3ZzL1JEMFp6a0ExMHJoeDVzL0dTekcxZXYwamF3NTBOdzNt?=
 =?utf-8?B?M3dzbHlSWnZ0L29UWmpIR0liTnpoN3JKeU5EUFlXOWE5VlZobzh0U2JnZjJC?=
 =?utf-8?B?MzR1TFVpTUFjMHYvMzRGY3hIT0IvZFNXNDlHKzQ2N2xRMFNWSUFKUi9vemRs?=
 =?utf-8?B?NHN1OG1PVlZaU2h2M1FoeDVCcVZVMEpYTmw3ZzZhWW5BejJCU0xsNWRyUFJl?=
 =?utf-8?B?NzB5b0xJaUxtNHZPVXhLOFgwREYvSFkzVFZIblFBQ0R6cEYwSmprQnE4ejIw?=
 =?utf-8?B?Q2FMc2h4Z0UvVGJHTEhYUEJsaHlpNWVrUU5kdnJtM0tmRitPYlNmcHV4SHZm?=
 =?utf-8?B?WHZlbjZWQkxiWXpUS2ZnRFJHbmZPQ1VrQmtER2x4ZVFMa1hxUS9Ybjh2Q1Uz?=
 =?utf-8?B?RlBuQ3YyeXpOaSt4S1NPdmZQYXlaclNnbWZ2Rkk2K1lOREIvcmp3US84b01T?=
 =?utf-8?B?bHdQQTdqNjdnTnFOaWRaRDRsME1mdzFodmZpQldrOWd2TEZJT201WXkyQnRR?=
 =?utf-8?B?blNTM1VESWNlaDlFUTBJZkFrL0JuQTViZkdSTm9FT09DQlg1Z25YZzcvQ1BL?=
 =?utf-8?B?WEdoRzZQU2xVYkRaUzNscldMYTZCRGh2TGdIbm9rR3VoZWZPYWorRVVabE9K?=
 =?utf-8?B?Q1dnYXVMalZyeEZtdEl0Tnd1ZEdWQ0FTZWsxZVBncS8rek01cTJRN3JpdWJ0?=
 =?utf-8?B?cndVa095bkM0bGxqK0lRRnRIUVlNZGdpVTB2bGlhUHcvMWNrbXg2MGFsWDl4?=
 =?utf-8?B?Q242czlncWhRamtTekg2b2w0ZDErL1pqMXBMY2VJcm1HaE9XeEwrdDY4UTlT?=
 =?utf-8?B?R0lCd0h6ZU9SVTNmTXNYYVdSWmhWME1FSWNZMkFkUkdZOVpoVzJFNHQxbitL?=
 =?utf-8?Q?WkZ0naXIRIMZQ5ZvsrQwCgkVd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7165ba2-16e6-4da6-122b-08dadce11a95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 08:07:39.9638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wnMAA3p6D/X7n8yK7U9vgm7iWQT+e4ReN9OjIuU12rp9u4mF+IjYNVf5u43si5kv+CDUJvYbF4Cv1F+WWoUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8951

On 13.12.2022 02:11, osstest service owner wrote:
> flight 175154 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/175154/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-i386-livepatch     8 xen-boot                 fail REGR. vs. 175144
>  test-xtf-amd64-amd64-4        8 xen-boot                 fail REGR. vs. 175148
>  test-xtf-amd64-amd64-2        8 xen-boot                 fail REGR. vs. 175148
>  test-amd64-amd64-xl-pvhv2-amd  8 xen-boot                fail REGR. vs. 175148
>  test-amd64-i386-qemuu-rhel6hvm-amd  8 xen-boot           fail REGR. vs. 175148
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm  8 xen-boot  fail REGR. vs. 175148
>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 175148
>  test-amd64-i386-pair         12 xen-boot/src_host        fail REGR. vs. 175148
>  test-amd64-i386-pair         13 xen-boot/dst_host        fail REGR. vs. 175148
>  test-amd64-amd64-xl-pvshim    8 xen-boot                 fail REGR. vs. 175148
>  test-xtf-amd64-amd64-5        8 xen-boot                 fail REGR. vs. 175148
>  test-amd64-coresched-amd64-xl  8 xen-boot                fail REGR. vs. 175148
>  test-amd64-amd64-examine-uefi  8 reboot                  fail REGR. vs. 175148
>  test-amd64-amd64-examine      8 reboot                   fail REGR. vs. 175148
>  test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 175148

Looking at a random one of these failures I find

(XEN) Assertion 'nid < MAX_NUMNODES && node_data[nid].node_spanned_pages' failed at ./include/xen/numa.h:76

which makes me wonder whether the NUMA generalization work was actually
tested on a variety of x86 hardware. If a swift fix won't turn up,
we'll need to figure out how much of your series needs reverting.

Jan

