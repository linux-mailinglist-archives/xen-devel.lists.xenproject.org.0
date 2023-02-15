Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0260E698433
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 20:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496218.766845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSNBC-0007GR-H2; Wed, 15 Feb 2023 19:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496218.766845; Wed, 15 Feb 2023 19:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSNBC-0007Dm-E2; Wed, 15 Feb 2023 19:10:58 +0000
Received: by outflank-mailman (input) for mailman id 496218;
 Wed, 15 Feb 2023 19:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSNBA-0007Dg-Uq
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 19:10:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78354da4-ad64-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 20:10:55 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 14:10:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6738.namprd03.prod.outlook.com (2603:10b6:510:115::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Wed, 15 Feb
 2023 19:10:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 19:10:46 +0000
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
X-Inumbo-ID: 78354da4-ad64-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676488255;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UVsfMk4SWV8HKTH4zxYbL27C1uUgbMhQkVtyZNQ9+Vc=;
  b=g6GYI/UCYEqTKhKS9Vg5Y9S4XZUszajEhwd1QEinyYJIQSv63Uq6b/s6
   7d5cXkHXWA7PDoxcqx2GzukzZfMRJAwwt2ZUiI4cbWtFqBxy98KZgxRBu
   QqHDlDO/6ZIC9CBqKgK3ZTljQ0dPmfHOeU0H0dZxYL5qBPigj4+MjXPLq
   I=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 96034143
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:goq+kKrHCOPkHA88ssns6Sp/UhNeBmLTZBIvgKrLsJaIsI4StFCzt
 garIBmAPPvbMGumc41yb4u2o04O6sKHnIdnSAE/qnw2HyIS85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADQTQS/Tl++q+YC6F7JPvMYuAPPIG6pK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzmrqU22QHIroAVIEQpX2OXp/WLtmudScpbc
 ms/pTEqgLdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDc6r6Uei4gMzarTwLzcqzelp5yMSxFv4AzSBzih9lkhON7jYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr327FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:nsxPj6O1QcBu2MBcT7T155DYdb4zR+YMi2TDGXoBMyC9Afbo7/
 xG+85rpCMc6QxhJk3I/OruBEDuewK5yXdK2/hRAV7PZnibhILsFvAc0WMNqweQVhEX2IZmpO
 hdmoJFeZbN5WETt7e33OFTe+xQjuVviZrYz9s2rE0dKj2CCZsQijuRUTzrWnGeLTMubfFSef
 bshParvwDQCUj/LP7Le0XtcNKz5+Ej/6iWGCLuaSRXkzVmwQnYjoIT0nCjr2EjuvB0oIvKM1
 Kqr+U03MWeW37S8G6U64Yb1eU0pPLRjuFbDMi7gsIJKjPq4zzYE7hJavm5pTgwluqm8z8R4a
 zxiiZlBd1670XLcniyugaF4XiV7B8er0X6wVuvm3HkusCRfkNJN+NxwbhBeh/u8UAnp91L0K
 VXtljpxKZqMQ==
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="96034143"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OausjVY+oeR4B77d1jgRs912itxmVXd6Ys5E4NY7MUsf2eZfoLQjOYfJkqD9CUrB6vhH4eqBRMIQbByVDDNOTUBUmurtsJ3Pc3OpnGu75roMZmw97j3xscbVmcfJqDm69vgOKVkTF1y6KqRE8nGUaPSUI4P8l99lg9P72rsQcgy+7vaEA3SVZBjwIUwZYWgjdmFfmU45bIeo/OhlSrki/63im2mHxZyM2w7aP781vX7vbBLbRO+IooBv4CGeJ3YSFgtNWyXZgiapEUp8JYXHcSBW2c/TfAaIyjETD+266qH3/ADTfZuGsOyH0XbjL621/cyyiWFW8+PVvlBftjLoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVsfMk4SWV8HKTH4zxYbL27C1uUgbMhQkVtyZNQ9+Vc=;
 b=PQokcQBe5Hnb+26KFyDoO4BPJKCPFVxw+qtOMiz6kP+iPceUJg55P5kbcYqNonAr7iYu2LkL2zKHKCVOBF/vKJQKVAnqxzCAHluWOkXZ1qAMxLUWYWyuM99rDW0lv4TmY+LMWIQw/yuoCJIULYXNvaIyK67SzWbTSjRacfmQVJZi0EuwAqT/YyLvlA7XAVXsfGvDLijiJaNDFoUEIZ3x7lUFmn29T/gQcSDIYHhzanMpPTjgI0Zf6PZStFxE9J455ZybNvIs22DkqfOHqS4tc6QUrULtTIXhploTm2IVoiGvmuI3mhTg5QvsfM1CguL6+3kPny7hoxXNLQi8BHWPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVsfMk4SWV8HKTH4zxYbL27C1uUgbMhQkVtyZNQ9+Vc=;
 b=pa5mpigwloPFTkJEvKLKtNejb26Me4wFl6G/lzFZiLc9ZNR7RO+utV7I/jLZnDpxLHbdap2eLKHdHtfUM+Z1XQH1RNIscHWfn+0wIUPtp1NHYdl430qnF0FqzJvh6LR8wE14L3zw+s64mxPqG1oDTmC4dClFYTPKwSaDvfrhtSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13c62c91-c512-7677-c536-9391206e3185@citrix.com>
Date: Wed, 15 Feb 2023 19:10:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/6] ACPI/CPER: use standard C types
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <68bb1c78-2b6c-4b8d-725d-f1d6a6c92dcb@suse.com>
In-Reply-To: <68bb1c78-2b6c-4b8d-725d-f1d6a6c92dcb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d562d1-8996-48ed-05ab-08db0f8857ab
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vq+cnWlXDcbGiMF3bwTDs9HCbA9rMD74UW3Y9e9RSVDoKACdr+KZabxyTGsc4pJFhXrHJc1ISLaAHp78lUfSSJDrwjUZpgEQK64SsIdbZMkkCAZEbQCtNr6L0aiyg7QyXmhvFuQzvNGK2Z6aSWlw09RPjvWmMa6hWWnMa7uCEWa8XqkxnD2v0Kpc9KtJhVDH3nWjJefq50S/rLkKQQai08IVWZhj9Rqv1y2g0gB/rCc+4b8vD5k/ZjVTb8ngSfM5wfzxpGwpnh3knoJy2XWAs6Z3r1Z5QZTilAbyi7JT0YxJFhYXFOug+n3Qie4kKbhyBNHe0V1149feIMVpQEaXkRXgHbL/e9gb57y8qTfGHIYTIrq4TEI7iJtushR2zK0uXh3aAWJpFO4RWmLd5nIhkEhIVv5cj+4RlYtL4XZm3grAbNSZcFfktwfSTUKjUdMjhIk3ruz7YPYuGfc7GYiu/CwIFgiMLFTvLEcfm0TUkPwD0YgvFa0z9BUTTX1SMeBeUOBZgvGAlypI6vqa2iBued4w94tbFydiLa9AqZwPlc5QAvzaxql0sWQYVzpi72Kmio3gzOcYqN/VktyrElLpSrVfzVrzmHgfimf6ENQP0I9zOMOAkLWe53Q7YZfdGJyIA1wP8XlyYqPeLgc98qe+V1JLA2wfbURjujzgAqsjIO1biiBHGU4BI83VnpXx7Qo+EP6MSBe+y4FHa0Ue791mObMr4vHosB/DkkLdMe+u+YE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199018)(86362001)(6506007)(2616005)(478600001)(53546011)(6666004)(6486002)(31686004)(36756003)(186003)(110136005)(41300700001)(26005)(4326008)(8936002)(558084003)(54906003)(316002)(66946007)(66556008)(66476007)(8676002)(5660300002)(31696002)(6512007)(2906002)(38100700002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHcyODZaS0xyRUFqeHIxTjk1T3FKR0hkdzlXbUR6d1NWU3czNHE0K292bnAz?=
 =?utf-8?B?cFV4bmxBQUJCdGZoS3M4ZnJLN0k3QXdGTWxoYUxGUnVCTkgrNlZwOWdMYkMy?=
 =?utf-8?B?d000aWZibVZib29sNXRVMFlmeVNJUnFyOGRFSUZxNGw0SE5jWVpWR2loME5q?=
 =?utf-8?B?cTUrR0pxKytTVHRKa0sxQXRzUE5XZUo2SEw5VVB1eVdVcGZrYWlFSFhkYkI2?=
 =?utf-8?B?K090bW9EVmJiL1ZYSnVDRHVUZFQ1TlpKcVY0WElSQm1oRE0zSm02T2RkczVa?=
 =?utf-8?B?WlgwTTlleCtQdkZiOXV4VWF4K3FPekhwUHdvamk4Q21WYS9UYkdQMjRQeFRo?=
 =?utf-8?B?VTY0b2pVKzlDNDY5L0xVaUlmU3o2K3FuaHVOa2x0ZnB1YjZtNG1Qa1lXdXdv?=
 =?utf-8?B?YUxHbjBEeHBOZjJldnpDTHhXVGUwWHQ3Z240VkFETmN2cVNHbGd3dTZiamFF?=
 =?utf-8?B?TEJkemRTUGgxVFdCdVJiMEpnb0U1OUNXdTBHZHVZZlE5dVRiNThDdi9aZ2hM?=
 =?utf-8?B?YVZPOU9MUThrNWsxVGRWOFJnQnVNaXQrWGpMdUFSRktlTkErMXcvOHY4eEFu?=
 =?utf-8?B?Ris5ak9LRTRsRmlTYTlyT2g1OENmcVBvYWpBMW5vRG52Q1QvV3FUenExVlZs?=
 =?utf-8?B?OHhWVnNGdlFNUTNOcHYySHRlQzBjZmFqcEFwcFZnVHRxYmxkM3lPb1pOUEJS?=
 =?utf-8?B?Mi9ZeDFmeUdjWjl2WDRXQk5ZRkRpa2xhdnFTeDZCRVBScFBldnFsTnJTNmtW?=
 =?utf-8?B?enJlS0RaKzQybEJwa0pIUHVFVTBxZXJIN0tjQVFOZFNERy9qcEtrNjVNTFI4?=
 =?utf-8?B?Qmp5K0ZFWDAyM1ZxMUJBTFM2V1N4QnNSK1dtRmh6WTNiVjE0Vk56dEdwaXd5?=
 =?utf-8?B?cDBRcjI4SWNSdzFhVlR2U0gyQU9BRmw2bVJmRmRKVkdHaTVhRGpWTitnYkgx?=
 =?utf-8?B?dmJyTzdHLzE2OTdMM1NYUFhNa29MYnFDSHpRMVpBT3Jma05wSXU0V2E0d0Qw?=
 =?utf-8?B?V014Z0Z1NXpKRis3QllYeDgrRGhYQldicDdTdS9XWlg5VFRXK2xpTWxmaE9B?=
 =?utf-8?B?ZkJIbGh2bHQzQVM5dkhsQ2ViUE83SktOT0EvRG8vczFSejlBSGR2cGdPeEhG?=
 =?utf-8?B?Wm02Z3dyR0N3TkxJVDI1TENPNU01d2NhYjBZWmQ0L2w3K1R0My93ZnpiRUQ2?=
 =?utf-8?B?WEtucUZrZGFmUUhDRVk3M2ZybS9PMWJ5QzNNSm1zWlRvVkZqd1dnVFdKbEI1?=
 =?utf-8?B?RG11U2RCN2psNUlsR1ZjT1RVK2NUcDJFZk9nbVFUU0lHM1VxZk5SWGlLV2Fv?=
 =?utf-8?B?K2RTZXNEa3JuU0QvWDdYMFU4THVFYVB1WUN4VTBTZksvdTNEWmVxZmdBQ3Ex?=
 =?utf-8?B?OUJsN1pHU1JDYUFNY240VVlzaFhvU2ZqNFhaK2VaR0pHaFdhUXVmQ04yUllp?=
 =?utf-8?B?N3JCTmVYRDNoRjZHSFRDZXg1S1N4OWR3c1dFQm1KMjVvdGlTT0tvTTJZMzVv?=
 =?utf-8?B?MHBRdnZIc29TZFh3enhkZ3M3aXhWdGMranZiM1cxMGJxbWJBUHRBdkxaU3RI?=
 =?utf-8?B?a01LVFg4YjIxRDA4RWpDWU8yT3NoaGtRQWVMWXFYM2dMN1lGZDQwMG8xdG00?=
 =?utf-8?B?QWpjb01PTXVsNEJtcHFNaEo2bzhLdkFQY2ZQSnVDdHVaMUdnbU1wblRZWlVo?=
 =?utf-8?B?aGpyRGw2Q2JQaU5TQ0U4VGtybXd1SnZQd3k2b2FWRXdSWk5pWVpoRnMyVlk0?=
 =?utf-8?B?SnpkSk15elYyUUhMdUZxc2QrYTk4MWhjOUY3NXJ6TlZZT0J5aDZUb09ZQkwz?=
 =?utf-8?B?OTVtVzRYWGJkRG4ra2tqUFdHYzFhNEM3RGNmWXZjMU9EeWRMb2lxNytOZ2NW?=
 =?utf-8?B?SHh6WjJnY2wvNzZqMndGNW95OFVOYW5rdTM4dWNSaTRpUXVJSm51d0YySEJ4?=
 =?utf-8?B?azNhVytmYTdZOTRRVjh4RGNTcS9XYi9SYk5OSlhkUEtncm9ZbGdEekt0Y2lH?=
 =?utf-8?B?eDdocmtRNXJqNExlMWsrdG4wVEdpbDkzVzMrREhoR21MUzIzdU5zdDlwMUow?=
 =?utf-8?B?Z3pxNTRyc3MvZnRHSGxZSmtuVm13eDY4TGZpYWdvTU9kbW1xMG10VmNQc2R3?=
 =?utf-8?B?MTUwMkVOTDQzSU1HRVUvQ2pVbnpmUlhiL3pUa3dNVWo3UEltWnhwT29oT3E2?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yIRYBZG7Cf4GJ1II8GLbImB77oKnU9vRi65htljqM5xqDGuq4DmpSXSwsgpseTDQzee5qiM/UX0tRAL+8YbRA8H6xG+jh9y6PkOl9FbkvZ2W9FneNf1W45piR+Rmav45EyHSu30lGtKH1VDucCTaJpvG37bv3g/CEN+qU7UZHxThZlV2dH5Vgj0mZ40hiDEie58ANy4HPsjscMHe6/I0fwtgeF+kmXzS+foAyqecyIYq9dywoo1Uf2J0hv1PNFdmG+Ef/znLTFOe1gg2ENZrbNOv6KNXdowP1WmLspwHRj7Oc6aRhmmgOJ3jIfcxUl6c/GrdJ/k0W9ETZMU9o768BUkqwrbXeCC1tI/pfWtLfIjoNubrX8Aii9uPwZ1A5Vz5U0I0Q9kVTo8zigYVyzwnRjXq8P8FRVbYs4Qq5naF3zA83ekuUf/UgLY+ed6JyG68TM2IMdSXieBhTBE3Bhs5j1aWarYnauMXhnEfGeBsuDNo6wUai4TNo9wIuQGW6/wrFm3NG+5JDC0fQQtHQQ89AgL+OIoQprpYh7P7kLUg/FkqvXx635IHINUC9T5VluwXB9YT0pzISL3sA3F5aKKhCHzrad08ZQ2kVWh0CBAajTWu1o1R+hiODfqHBOHjQkGigidKoP8SKpmR+LfcPWHFJOY6ZLsxYzDvL3C5HkhzITdlGh9suuOZOMBjya9XGFDecMUsyAl+ss1BIQZtkOy6NX9z2ccUEEV+g7H2V3DkGvV+cJOK20ky2hlVdMycEO6nZ2rJiC4thTqwIZublk7+G5oSBCB+q74mpWVzrwvHUDlte9OgLNI3OCpzy9HKQmjtvMUyodcfY2V55QL5d7ifq6oajuQ2fSxHkoVqJDbwM9M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d562d1-8996-48ed-05ab-08db0f8857ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 19:10:46.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTkcVFmum4HW1e5nmAe8infQoTnWTmhBOpIbwmyiqNz2ICDEnOXQmZP9wxXTX9ajwynWrFxA1falWG7idMSHkKNCinyH0hcmt4z9akgCJNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6738

On 09/02/2023 10:39 am, Jan Beulich wrote:
> Consolidate cper.h to use exclusively standard types.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

