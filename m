Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89C77BD1F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 17:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583717.914007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVZao-0001pW-Q5; Mon, 14 Aug 2023 15:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583717.914007; Mon, 14 Aug 2023 15:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVZao-0001nV-NO; Mon, 14 Aug 2023 15:34:54 +0000
Received: by outflank-mailman (input) for mailman id 583717;
 Mon, 14 Aug 2023 15:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tgG=D7=citrix.com=prvs=583eff3b4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qVZan-0001nP-LU
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 15:34:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1abfd44f-3ab8-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 17:34:51 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2023 11:34:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6697.namprd03.prod.outlook.com (2603:10b6:a03:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:34:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:34:43 +0000
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
X-Inumbo-ID: 1abfd44f-3ab8-11ee-b289-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692027291;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sTHPQv2CsGuGXE2CEzb8nMBug0A8CGzXYyLjD63Ozhg=;
  b=bR+yPHEQXBvqoBbSXRMAn05MJ4Z9gqLanZ5JTQG6Uu8rKNQLIsmoS0h4
   +Q+SRWKwnWg40JXc1ytd5FqN6hOzLYxiggmoDcqHEXnkWSvOCzBIp7yu6
   dQHNL/rNH+ncXNRaFh9SPRKPj4uBddjz6QD7a/o/UUsc10rX42A92+TTD
   A=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 118722708
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kkjU364bwpwQomQjf/7aegxRtCHGchMFZxGqfqrLsTDasY5as4F+v
 mEfXm2Aaf2LNDemedAlao2z80xTupaDydVgS1M5qiwzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAS4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 +VbLRsGdhK4ns3n/I+EQclXg+QoM5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+SF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLROLirKEy0DV/wEQpCQJJVgCCj8DppXalX/YcB
 0Yloigx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQIWpcYyYBFFEB+4O6/911iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlkRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:+B3PqqqSLA9HcT4ZMCy7YYwaV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-Talos-CUID: =?us-ascii?q?9a23=3AMyFrOGmkvTbTsTGKZt+85kBjX0HXOUPEj3L7KFe?=
 =?us-ascii?q?6Mn9GGYGodlSww6ZEmNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUXvF/w4ssGsWynkcGhfwKsDuxoxS4rvxCxs0v6x?=
 =?us-ascii?q?WlPGfMQgzFz2s1DaoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,173,1684814400"; 
   d="scan'208";a="118722708"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkWioMcZ6HQ8q3gbkm4hOQQm3wu3sdu6AZKT2JKM64uASP7isf4+/WZmAf9+vhJf94uX/ORtrhRtXPAMEZuIrlITZ3ZH81csE91StIwXo7NjG/GPlWVj1Lc+Iy0o8qkplmhu3RJsyTFF6SqV8babZN/WbLB1LAVvSsffocXcaE3GNmXwPzvSpa1f1oaMuRBUwZ/0CGcs6xFMFgSWC2j8ersyL3Av3hjLbDWlhqMLAERa5vHY2ERDsqkoGRBVz84goRwu7zvfNfuv1g6glbT/r4hHn5tZj/AZR3EFPmjvQ0ndDN0+XPm6X8oo4p+KsK6LW8qpmEVcYSkAoHi/wiufnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTHPQv2CsGuGXE2CEzb8nMBug0A8CGzXYyLjD63Ozhg=;
 b=h5V/ihsblTGU4ZmD0BmkjuKfoQcKyPmCTMLJXu4ZN+0fr+beb4sYYwHk6HO8Bkvt6mjJ582IUyDNyeMGOBdusIvq2mtgloOS/Ij3XcJeSd3EJr6lr3drwthgOzXJh92vTv07wPD0a6EzHMScgV/Frw7LMC6wO5mT3sWoD1RYL9lVBanOzhzSvsPdswlbzJOEUJ7acuVh1ooFU8VUILWN3AoX2uViU1p6dd1rDfaDzKfcaWs9EMKFCxWgVrCzYErNPjwKEMl3QlVvOe7/OZMV5v+4e7y/YE46PPUx8rpiKkCPFHQLTl9ckz3gXcYi+vVAG6ch6xBI9Zoa4L9g1oO2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTHPQv2CsGuGXE2CEzb8nMBug0A8CGzXYyLjD63Ozhg=;
 b=VF1d7+Ls5hruv/6b1MybaKmP45/LYsOxXE6jvGdK/KozZZ/MygFN8GYC74tXAodhRToGvzS1pjGjATnWDNVo47pS+FpoAPNOOPW1d2xdYmaOHixWNRn+R8uAaIXGUOrtUndpYMyENrGyyoS/ukucvc9nUxdYc6cCD+KD5mNIlCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13be7a9c-0619-b691-a364-b5aa7a110fb0@citrix.com>
Date: Mon, 14 Aug 2023 16:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Build errors with fuzz/x86_instruction_emulator harness
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <d4826ecd-fabc-03e9-2ec3-788877a560b1@citrix.com>
 <7c99ef09-cde3-e35c-f9f0-00c06b754786@suse.com>
In-Reply-To: <7c99ef09-cde3-e35c-f9f0-00c06b754786@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 30503978-4b12-4ba8-dd9d-08db9cdbfb82
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e6Z9cjkUdaexjaTOIE0t2Lrfd0xWTToMDpl60Om4tEOF21CcdTMIvVtI4Qf1aACYFhM6Gx5+Kmwm+rkH83Xp0Yfj2+80Vzs2N4Y/lawakzobp/REm5IbeUAdCcpBKEDru7DOCSBKra4JOE3GgaIbgdvxyCSAjZEpJ2hIyAHcSF5bYZsG2QyPnFSnb4AjnE/E5PmRZIrBGdUEC7tZWiRujQk5Sg6c0iIhVqyAmUw9GinygqXypKSeG40SnmuFOyn8Tg7C15ZcA8PoQZqM/buCgt4FVWSrTiIA2KRxMdccexoeAYxnWTeiwGptGR1bUJTyd76hdOcS8v6VmWHuboRy06ajbN7WI8qG3hYW9Y+s08xH3QMNR/sj9McOaM37sWQ+KFSQ5M6iqATCOrRhq0LW2lIy695j+/GxaHq77s7Rqgh/4XwXE1IiFQtexPJYvPs3AmIMtUtoz1UqTFxXlyARWGg4/z8TUlEMIsq4vQXAswPRHbVt7AEDR/x4G7Hk8w+xEOBZ53faT/8GtKwDhoH0Rnwostm4DHckyIDP/b6CJZSsi/+Lu0WBUF0/n4skFOfZD/Muu4Wfai5zKNxoJ32Q4px3AbuXzjGbIVT7zz8Oi3LX5RnfU6hoHFQBwe/phdqI9siFw9N+xvA2Kx04pNgxBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799006)(186006)(451199021)(82960400001)(478600001)(6486002)(6666004)(6506007)(107886003)(26005)(6512007)(53546011)(2616005)(66946007)(6916009)(66556008)(54906003)(66476007)(8676002)(316002)(4326008)(8936002)(41300700001)(5660300002)(38100700002)(36756003)(86362001)(31696002)(83380400001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHFBazViMzB0QUkvR2JuMElpN1o5ekZEUXp6dTAyRnZ2UDRMamNjaWY5Q2tT?=
 =?utf-8?B?TGova2FQU0JNbC9ZMGJzS2RZOE1UMnJndzhBREp0aWlsL0lZSkRSbEFMMmtk?=
 =?utf-8?B?R29iN04xVlZ5eWxTRXR1L040dkxpUDJiV1RGeVBUR29vYks5eXpmWko2U2kv?=
 =?utf-8?B?bnhpaXZ5a3FHaFpobXozbUlmVHE2aTJsYitrVmwrV2RjaFV0YkZsSU4wdHZx?=
 =?utf-8?B?UzkwZ3l2aFptS1RmWkJaN1JudThkZGxwK0xDVTNMZHM1Z2NZQ3N6M3U5NkZ1?=
 =?utf-8?B?clJES00xOHVaK3JPcWJHM3JFeitPZE9zRFdJVXdaUkpwMXpLSE1HVUQxdXZ3?=
 =?utf-8?B?WlBCeEZmcDFLWU9sZGR6N2dLRVNjVUt3ZjI4bnE1MDFxQ2hLS2paUDhDWElC?=
 =?utf-8?B?cjRoeEl5enorc2RndHh0SkxWUjQxZDh5a0NGR1F3c1FXRTVlZFB0SFRsT1lU?=
 =?utf-8?B?ZXFXS2d1L0RjTldrTG1TVXFaNjlMRVI3SDBLRG1BRkd2RURIa1pvYXdiRHBx?=
 =?utf-8?B?cFhmNEFPSCt0eENMSThrS1FWZWdQYVh6RXNUeGM0RTlFaWM2VXNJZFpaVjlH?=
 =?utf-8?B?b2l1cXdmMUFXa2JnelZCaG1hOXFWOXloR0QzK0twRXNLK2R2c2hES0V2UnVa?=
 =?utf-8?B?c1FEdTlnZStXc0J3ZHMzb1pBcHVsaDhqN3djR1RnbkQ2WTF6eGIwbHBINHFF?=
 =?utf-8?B?VS9RZ2Z4eGxTVkVBSjNaWWlmVnBMOTVLWWlqREF1bFBnZFdkODZpeEh3V0ZY?=
 =?utf-8?B?bDcwWWFQSWhBREFRZnFvUVYraTJ2OS9VQ0l5UytRUnpkQjF3S1RESEluL2hw?=
 =?utf-8?B?c21TVDhjTEpjUXE3V1VpRG43NG9JMDVXczBaemZUR3ZwbFVJeHJWcEc5cEdX?=
 =?utf-8?B?NXVwbW9jVGR2N2VKYTJwQ09sdmxKWnhWaE00cks4WEZXdkx2bFZIQVVQZjI4?=
 =?utf-8?B?NEhyRm1pWVQrYTRCOGpwMHBSQ29SUERQYUMwVHN1RlpwS3dZb25TTStTSklm?=
 =?utf-8?B?bXRQR0grQ2N4T2hJWGxoUTFlQzhTaXkzZFNOdENGUUJ0cVhyakJWSko5OHRw?=
 =?utf-8?B?cU80RGd5NjlmWDc5d1FEMkNFN1pPdlVXWkhqTGdDQTZpeXljNEpVRHNkcDBm?=
 =?utf-8?B?bHdJd0NKZGhaMGdyVjJVdm9GS21qMjMrODQ3S1RyNHFuQ3FSREFqdkI3RGZr?=
 =?utf-8?B?Nnpld3oyTFlQUVFGMXEzZjFTTDBDSVhtMHdHaGEvYjA3a0ZvTlJ2d2RRODBq?=
 =?utf-8?B?UVhGWWJUWEpsQk5tSFpRS1NVLytyL2xkRGtUeEtZa3FkM1JRbUJaK1dRLzFU?=
 =?utf-8?B?blM4ZEpRRFh2REVBdjJkSVVOZExUSTZXQ01nT012eDZzeWplblVKRkNtMkgr?=
 =?utf-8?B?c3JFY0ZrRFVWS0ZiNnJLRGRZNjY1ejRXZGVyU1pKdjgyd25sWXFhRmFHS1Q2?=
 =?utf-8?B?eVNMYmMxNmRiVXVpWkYzeDB0TzJSSTB3eTZsY1M2elhoY1MzZ3dicUJ3R2Uv?=
 =?utf-8?B?bk9FbVVHRm9EdjM5Y2dSeXFHbWVqbTN2dk9NNGZxSVZSbXBKcUw4aXQyTzQ2?=
 =?utf-8?B?cEFqRUl1UFBsOWtFVmVtUHdJbUtQR1RSTmlXYnU2cENydll4QjdaWVRDZEZn?=
 =?utf-8?B?TnJLeFFXaCttV1BubTlFR0tZTGttOFJUM3hTRU0zL2V3TDRZTVVNTVVGMm5Y?=
 =?utf-8?B?SXN6YlpJaXZFSXlqTUVVbkJacHc3ODF1ZDNRbS9uTGI1aVJaSXJqVDhKK3Zr?=
 =?utf-8?B?dWlrQ3poU3Z0SlBkelZvZWh0c1hOdHJiVGJQZGNhdXdoTGpycklWNUhtUENN?=
 =?utf-8?B?Rzg3RGtBNk1KeUFpdGZUYkNMWlRKQ3pHeG41V0FqVWNNT1UyYkxRd3AzRFQv?=
 =?utf-8?B?YndrSlZWOEhUUUVkcldLNEYrT0ZVTEwxY3V6UURUSDBDb0I4ZHFWaVkxR2dN?=
 =?utf-8?B?M1VLWFZ0akJWZk0xNHUxMURVNVJjK3BjNWJxMmxacmc5cStyY3lqYmFoSTlp?=
 =?utf-8?B?dkZqVFdJci9KWEk5b3JGM3dzVTlTM2RhZnBkZ0p5UVpTNjV1dmhUcnA0aWlq?=
 =?utf-8?B?WGMweTlyZ0d5SHE0RVAzKzVXWFpXMGQ1Y3lBcEd3ZjZnZHN6TWtXQ20yTFls?=
 =?utf-8?B?NVhrQ2FpOWpMQ0tGdFloRnZsU1IxTU9ERmlNWHVWeGlqL2NZekJyZW5sZTU3?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vYm/CefnFOsDA3h6Yw4swN9MAoHOckqy2ixnYm4Xhp7/4JDTK0bhcEhz2oHF573ob4pMkRjYqBCTSLJWf/X2DsUShCCeTiyHkZLzwwqvkXlexUwEI+sdUHjhrA3YrJerbL0agX+kGkK/AffC+fdniwWVHwmf76fgzrsPkLUq32V0CQph+F7w7nrxe9t6YYdeD08f5co7axMwXPeFeAb1oBWG5U21IHqdtdPoLGGonhB4XaBEUUqqOlcbzw70HjYsHU0EcZB4UFkMX5XkM3xb4Hq+QyTTydtqsXlyYwtHvT1p0ZtHIqS9qGsFf/B2IwSvvvhhNrH249JopN2XasCrZGjvCr5cc+J7GAmeEnFg6oaXVgLOiZuN38VOcY4g18x7YCwX6ZKENODc0PBjk5OWXMw9utSlLhyo2DvUA0p5S51Dqgl1hoBNAEN/xRKDvT1XwH8XZJ2dYSAS8xgFYiB+020CYI7YAf46p+7raUMq3icjPLnGXzh+TrSvi1N5bvBL8bB0wRaIY8+EEbF0+CaXEX4Zef2M9C/EZAY4RJJgtvGeXURomWuZJsq7wtX+t/73cqF0N9cV9WY8fzxhgeXHymKJGJDS9ER4beOIsh+mQr7ma/u8WdtHygzajd7/xSBICZRpUHIYLgRV0WADFMmOvw4YyOrrcwMcMZlFUATQiq+Ce35lQK86242/YepqokxA9jiuR9TWnE9EI5xWhsAsKAFqXunIe8OpPTognu87UByWkaj23/AR/ISTLuvMfSdGhJSZWnERJe5R/gMR9ZITxIl/QE+1IQMq7s2CTZEl9Ok=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30503978-4b12-4ba8-dd9d-08db9cdbfb82
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:34:43.7820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avQpi8ZJbW3va4vIu2QwbdazfCOEeAwijbMfOQNHqjtFxawaxrLPqhaFqeoSN6NPXB5ifmP5wxjgqk7Mtz3dq8QUdtPLkB1VIbIpPUmax1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6697

On 14/08/2023 4:21 pm, Jan Beulich wrote:
> On 14.08.2023 16:52, Andrew Cooper wrote:
>> See the attached log snippet.  This is current staging, with a GCC 13
>> toolchain.
>>
>> First of all, a minor issue.  Counting the number of
>> `-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__`'s, we
>> have included CFLAGS on the CC line 4 times.  This is something that
>> appears to be in common with all of tools/ and is probably the primary
>> contributor to exceeding the Gitlab CI 4M log limit...
>>
>> Next the error.  This doesn't build when CFLAGS coming in from the
>> packaging environment include `-flto=auto`.
>>
>> Clearly our wrapping trick doesn't work with LTO, but it's not obvious why.
>>
>> readelf -Wa tools/fuzz/x86_instruction_emulator/wrappers.o | grep emul_
>>   [223] .gnu.lto_emul_fwrite.38.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01c2ec 000194 00   E  0   0  1
>>   [224] .gnu.lto_emul_memcmp.39.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01c480 0001a7 00   E  0   0  1
>>   [225] .gnu.lto_emul_memcpy.40.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01c627 000175 00   E  0   0  1
>>   [226] .gnu.lto_emul_memset.41.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01c79c 000186 00   E  0   0  1
>>   [227] .gnu.lto_emul_printf.42.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01c922 0002cd 00   E  0   0  1
>>   [228] .gnu.lto_emul_putchar.43.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01cbef 000216 00   E  0   0  1
>>   [229] .gnu.lto_emul_puts.44.43da3a7fd30cc0a1 PROGBITS       
>> 0000000000000000 01ce05 000180 00   E  0   0  1
>>
>> shows that there's something relevant in the object file.
> But only sections, no symbols. Doing a simple test with a trivial source
> file, I observe that no actual code is emitted at all, and hence also no
> symbols. Which means our trick - working entirely behind the back of the
> compiler by inserting .equ in the assembly output - takes no effect on
> our own sources. And really the errors in the log fragment you provided
> all point back to standard library headers, where (just a guess)
> something may be done that cause _some_ code to be emitted, for which
> our overrides then take effect.

It turns out it was GCC 12 not GCC 13.  Things build cleanly with no LTO.

>> Manual poking about in the build environment indicates that
>> tools/tests/x86_instruction_emulator is similarly impacted.
>>
>> Any ideas?
>>
>> Obviously we can inhibit LTO for the x86_emul userspace, but that ought
>> to be a last resort.
> To get the build issue addressed, merely suppressing LTO for wrappers.o
> may suffice (provided such mixing is permitted in the first place).
> However, due to our overrides not taking effect (as per above) I can't
> see how the resulting binaries then would work correctly.

Indeed.  While I don't particularly care for the fuzzing harness (It's a
little dubious that it builds by default but doesn't install anything),
the main emulator harness does need to function properly.  That gets
widespred use in testing.

> Question therefore is whether we can find a way of effecting the needed
> overrides (including for compiler generated calls) without resorting to
> emitting .equ (or alike), and hence without doing it fully behind the
> compiler's back.

--wrap= each symbol, except when compiling wrappers.c ?

This seems to be the normal way to mock out functions including malloc()
and friends.

~Andrew

