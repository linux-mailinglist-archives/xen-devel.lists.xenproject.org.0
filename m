Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7BC727C1D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 12:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545236.851558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CSa-00088p-Fg; Thu, 08 Jun 2023 10:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545236.851558; Thu, 08 Jun 2023 10:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7CSa-00085g-Ax; Thu, 08 Jun 2023 10:01:40 +0000
Received: by outflank-mailman (input) for mailman id 545236;
 Thu, 08 Jun 2023 10:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydti=B4=citrix.com=prvs=5162bf623=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7CSY-00085a-CT
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 10:01:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73fa240f-05e3-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 12:01:37 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jun 2023 06:01:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5864.namprd03.prod.outlook.com (2603:10b6:510:38::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 10:01:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 10:01:25 +0000
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
X-Inumbo-ID: 73fa240f-05e3-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686218497;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nb5CaHjwk290S4szU/qdBjkdwOER9ldcL9C9acbk4L4=;
  b=K67MaPhgyveG409Y0OfODhsu5DgAQ3XSapVdrWx8f0dTMyOeSwcTiIwn
   ipCvs5o1QyN8CjeCAn6oBm83BCemoSM2vDhjxoVKGBZ37hhgMuSNEaPEv
   RfEV1NnyEyKwh8LC5LBzjJFxA9jpNqlk1w8kbrkxCH7cJIvay4K/2UGud
   A=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 110792559
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6gTjCqx3OCRZ9DP21dZ6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkVRx
 moYDWGGb/uNYTSgLthzbIXk/EgOscfSz9JmTwZkpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaAT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWETq
 d4aMhMsUjnZvduk2ZDlRstRnO12eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFAZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAN1DTuDlp5aGhnWI2VAvFgM2d2eAsOWH10qYWPYcK
 ksbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A5sa5pog210jLVow7TPLzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQKzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:d4Kk+aFFF+sewpwBpLqE7ceALOsnbusQ8zAXPiFKOHpom6mj/P
 xG885rsSMc5AxwZJhCo6HmBEDjex7hHPdOiOF6AV7FZniEhILCFvAG0WKN+UyDJ8TIzIJgPH
 ZbEpSXWbXLY2ST067BjzWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3ADUcr1Gn/S2bFPSSgxEm4M7wzFhLXOX2AkFXSOWy?=
 =?us-ascii?q?ZNU8zcoSHUH3O9IFZieM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AiHacHAxk41kLLm0j/BYRw0Vv0E+aqL+xNHwTj7U?=
 =?us-ascii?q?kh/KVKRItPxGeqHe2RYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,226,1681185600"; 
   d="scan'208";a="110792559"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyG0QCJdFsrtdcC2L5vPysfRBf/TwbLcj8FbZMzNlSYdAkIE1qVV7569OivRAn7kmXK1YIYZi0t/A4kctIklQWS2KAvVssuxm3lkppEcaoGq4yESEsG/xh9zTsZLu8YZlqilsZU6NIpuj1hnjiE4IMDoP4C32WF+/zYiby9Ja+GoZ85Q3aHb2d9aUw4SuPia5rMs4If2QvC99HzbOi+zeY9ypPmzxbhnhhSb7kpGAxdxZSRBb2MxG5Xz1Vg+IVi4Ra955Vb3fLmcK1yurjlwr5G39cmiJXzipP6QWfuMaYXGbX5uoMM52cGQ7t7HYk+A4Abh9yZU0oQEkqg2Xv+UVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nb5CaHjwk290S4szU/qdBjkdwOER9ldcL9C9acbk4L4=;
 b=VaS/j3QfNSVEg2MqAFNrWgh9pd7kK6y407kkbsFtb8bWZAjAy2T1I+XNuvpfQ6/QsRuNWrnyOLNrT03WenF57YfEHCyQLjSiMqmY+Qz2p7c6iaWiZoddzcMrxVDy9/V4vxKIOxkgJaJ9yhrd2g11G7ysIESe9iXBCMs55/HgHrXj/m5jbIhsx7BQLQfEyEtTCcjpxCtgBvWo3o4da2MKhM6AitpuW+zbtAn+l/9D5sEfDpo5u5YP7YDVE2Y/GXR7yEUeLSBSDrGSH2eVXBPmRIriuNt7R6HIKEw0tQES+7vG7PTP2YTVvLh3oK5nSzmRPiKNpyO1IzOTpY/DDyjj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nb5CaHjwk290S4szU/qdBjkdwOER9ldcL9C9acbk4L4=;
 b=TUOy5sDb1cfkx9hYxD0/dFjz0gcP6d/BhWj7TKi6urvnoSISMaH94ZhuC/LFZWL0vaUjqan7bR+tQmvo2zSWzQFXGcdgCb6uJQ1ITm7kgiyY2vRIZNAXoPlzwtwXuYD3bfVOobfxLL/rKozNk3ytUEPD01HaqQTpWB7xMaWVhik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a18056be-dfac-1221-31e1-a78e9cb7c9b9@citrix.com>
Date: Thu, 8 Jun 2023 11:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: print valid CR4 bits in case of error
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230608095939.67105-1-roger.pau@citrix.com>
In-Reply-To: <20230608095939.67105-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2ac6e7-d27c-4fc9-1fd2-08db680751cc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDJTPdONUKBKNdsV0IjKtWlPY+CQ/R3LE74sJ45UM63y6s8d0HnapjQRfH9yoJTPcyHymQvzozE+YDbC5GBSgEAqsJyl52CRtAzGcfO0EWJqzuJY8ovThBtrDno1R5xTqyq7isCIRscdTOPutPd2IcB7mV7gfAjjbNPblBUkhE5BnRZTMlgp/GyG+WO8+jN1HOFhBuzmccFVV503VpyGjPuPi0FcSRKG18zz2ogCpF36IrL/PlhNfR09o4CO5ZGDpCQRkT2jgTEUhW6GPj5dXnAfA2VmvLIX1Lz170rmN7P/FM5blEBq4ZrxrwSivDCp00lsmlGC3JT4/ajy+B/FbSpsKf3wJVTnmw765eT1xMeBJ2Xq4S/hRyEORH4Y08PM6+EL7mPrjARYH6jpfsSMRWK0lWUoCASYdoSPXgmF6Rb5Gwza400q5IC0fAN1u4Y2u52RxYj6Ob8JOo88oWv7OftjlgZmecENduv7NRtVy8SBemTWtDofGNIxbjqrw2CCBeinLMJN9FeocEOOcfI2EZmuyHPqfZKbRUaKEv6awmGtLOJhf0KcYpe5AT6b4jIuU//dXpLP6C+FtI2RZe3TAFTt7r6YK5QLodbGDvqYtgai9gpB/sLQxF1iHCfBPIhVS4BKbd8/5bUyte3K0CUXeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(36756003)(5660300002)(2906002)(4744005)(31696002)(86362001)(31686004)(6666004)(6486002)(83380400001)(53546011)(6512007)(26005)(6506007)(82960400001)(316002)(478600001)(54906003)(66946007)(38100700002)(4326008)(41300700001)(2616005)(186003)(66556008)(66476007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekdNcVc3UjBvMXZCUEc1TmE2Smx6NG9HanI0dVplSXpzSHdQRGJHWGVqeFRo?=
 =?utf-8?B?WkduRTRpMHhsNTFVekRkamRGWnFvU0lObTllUmgwSS80ZFlzcGJ5T2diTW1z?=
 =?utf-8?B?NWwvUjQwL2RjbHl0cGIzR1daYVNyZ0pzc0pSY3BLZk5ab0hDK1liVzFPbEJY?=
 =?utf-8?B?RnR1ZnR0aVNrV2ZHb0N5MVh5Szl6RDI1OWdIM2NyZXM5SXpNZEdwbjYzdkJ3?=
 =?utf-8?B?VldYc2pndXZZdFlPTEh5eDNDdVJTYlJWVU43bWtLMVFGVEM4WXZxRGNPVUMv?=
 =?utf-8?B?aWlhQzlPMCtRaGxmWjRqdDNUUFdxckU0YVpJVy9GSTNqelZBYStMZGJXSENj?=
 =?utf-8?B?OGVjQ2FuUGRhNHFyZGYwT0xyd1hVaEFwNittS1FEWDJqVzBVd1JuMkhxNHN0?=
 =?utf-8?B?a3M4UlZhakNmZ2tjM1ZZd04xVmJZRUFWT21qQmNENitUdFd4N0pUQWtLTjdJ?=
 =?utf-8?B?WFNFSkY4Y1pobm5yV1dlRndGcHk1ZlpJTFd1Ym5CTVhGK1E0R3g2U3cyOFlm?=
 =?utf-8?B?bVl5bEZZSXVidmYralRuN3pqMEU4dmNGaE1aNUl3UjR5RkpvWjJhckJyR2kw?=
 =?utf-8?B?WVBlR0lQckdhU2JxODlrNHc3QjZZbDNwSVV3SittaGNPSGQ2Uk1PdWZiaktZ?=
 =?utf-8?B?emlWVjkwUWRDVkJtYnVwd2xpTk9QZG8rUUI4UmI3bXBVUWM0emJMMXk1NlBn?=
 =?utf-8?B?SEJsZjNmOEkvVVdsQzRpU0k2TGZCeWZsemtYVnk2dG5XdW1NQ0MvdkZ5eE9V?=
 =?utf-8?B?dXNxSVNES09DRTRLa3VUV1g0bldFRnAzeEpiZXNybjE0NkkxT0JVaVV5dTFl?=
 =?utf-8?B?T2xGeHFvbSsrL3RDZXJvZERCeGhBMjZ1K2Q0K3YvK1RvWXJJanVYandzdGVC?=
 =?utf-8?B?UDZLNzlQSkZrRDZ1U1dYU0Y2elVlV0pWeWhWVWx1MHhMbE5YS3c2TXpYa3No?=
 =?utf-8?B?TVVyTVcyYzJFSzc3Mkp0M2VoMTZudm5sMmRINVlNQkVUTFVOR3JzNjZJWHdu?=
 =?utf-8?B?RnpqeHhRditwWStTNUxmRC9kVy9nTndmSHR4QXlZcy9Bc1AxTG1QZkk0ZzJB?=
 =?utf-8?B?bzA5VDMzaFRBbTNQRWdxQUkzZFlRUmVXM0JrR2tyVFdMekt1WDRDWSs3dE5v?=
 =?utf-8?B?N2JPdUJ1K2MvbzBuaFRTRDNscHNPYUxqYm9XUVRmckhaMnczV3JJdC8reWk1?=
 =?utf-8?B?UVJ2YWxIazZSYmozYUE2Vk9jR2EwSmgvWC80b1czRTBncjQ5dk5qc05WWlBM?=
 =?utf-8?B?OFcyTVlGaSsvaXZobmhmUmYwTWFMMC9EMmdjUXJ4UDZEakRlek9VU0RyZ3k4?=
 =?utf-8?B?bXdORCtjcGRVUFF1Z2I3T2U0U2UrWFVxVTNHRjBvWEJPcjVqU2ozVzAzSERn?=
 =?utf-8?B?RGlTNzJQMXdiSHo3U1U4VVFOZVo5ZjB4c3RJY2h6Y09kQmQxaXM0eS9jbUVq?=
 =?utf-8?B?dDlwUE9YaTdlMmRnRTJDM0U5d0xwSUo2NHNNbUxtYmx4Mmh6WDd2MzJJa1o4?=
 =?utf-8?B?ckpJRkRJWmdlK2NWa3NMcDVtaXlUWFp3SHZScytXNGtJWEJQWHNCUmR3YVhD?=
 =?utf-8?B?ZGgreVEwM3NsQU1XQUM4YVVQM09wNllZanFhOE9rdEN2T2VHY0kyNHpQUGlt?=
 =?utf-8?B?eWFHK2NtMzBScXlZMkJRMGVzQjUrcVEzUm16am91aFhsWVBwSmQxVVRoT0N4?=
 =?utf-8?B?Zm5mY3RGQ0hBaFo2MlJ3YnA3N0NqMHRaYjBWL2x6dUZQaDlSd2JtTUMwWEg3?=
 =?utf-8?B?WENKZVRpdWpEbkd4cWVMei9zQUhzeEN3OUZzQS9FRDAxVVByUUwrUDFDT1B1?=
 =?utf-8?B?NGIrZDI4WGREZXRFTUE1Q3BGdW04V3M5czJsZXhRVXpwL3hnOENoVE9YcXBw?=
 =?utf-8?B?dExKNWdlRUxHR2hSTXI4b2c0T0gwdmtXLy9UTW0rYnB2cG1jSHNSRmFJdktu?=
 =?utf-8?B?WEFhaW1XOUtzdVlrVzFmZUw3L0ZiYXc3dVMvY0U0aU9kZmtObFd4QXdqang2?=
 =?utf-8?B?cWhZNzhHaGZwalJZWktZZ2Q3NncyZllOYUdQQzZRSUJxVUFOc3hhNU5rTW1P?=
 =?utf-8?B?c0liaklOc0FoaWVWcFRveXpDQjVvUjFzOVJhSi80aEVNQS8rQzhWaEI0NFcv?=
 =?utf-8?B?T1JmbmZ6cElyRWRSUHBic2l5WjNIRm0vOU5HRFg4MmlEQmJsd1dMWU10NmND?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ccto610BfWOIW1PvvMBgIFULMp7bTaM8l+hwDUXnteCP66RYZM0kwe5vObz+7z3hAKDzFKaTqpqLsRwY5VKTextAii5rwXmngvdaXVTmTisERM7TrA5JmMnyQGID7/Bov2VpiYy8UbV9WAKonx1VhrI81nXW3LexGajlwZaeWt4M2I4t146mOjLDG3Az+u/MDl2XqI4r8tCsX47t7soVerT94ogSLOpB18A+S+qGOow0MfZd+mUQEaEqzeuOK1Y27S+JnS3N9+ts0JkXixr17v6yTbQVTQAGZFBCjcWTRzp7f24TpW2YKLbE0lCC4MFhmWnPeg8QMn/PjkiVpQufZeHzIbGEOyMyx8h/rQIOlEA2lcxZzrn+5S4vPOBnHOHXFu1fqp/7OYERZZxUQ3MYUE92oLvYCOwRJgA7lViY8IeEug8UZU69MGW0vS6+O6f5sYKoYVRmvFiQNOjBfsdfcew9n17PNVCwlSeMacW4FxGEriWVJ47g68LS001XzmDclz0GZq96iEdX30+LnWBcCcTo51wmGSfUrvAYbd5IuWskeJjZPJt9Sa00L4zFacKqS4r2i2amRPh2KT/Z+grNTNRD3lGThiBqNLLQLW7WARoFRsP8Z1/9CGxlOMtXrct3KFYuIjv0F85EJGE2xPRD6vq/eBKa65BJGMNeT7RPKrEntnV3cRsxKxdTc/TrbLzaTpcpdwFK1tDbgUxBWOzDmPy8ODBNMNq6J/ap17i78bCcnnCiQF6VQMCUhJ9jKBcLgLoawAg8URvMz1Igs58EWfYRkJdQbAvuVZItUOaAFdVrBQFDmWgbMX0aQRhkrt28
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ac6e7-d27c-4fc9-1fd2-08db680751cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 10:01:25.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2hqXuNKPfLP1OYJJwJNM9/lJ1G7n0KJu447o+kQdKQZGNqfBNt7hW7Z5EE7CE6uTpInv9ST+b6/MBtxRxGoaz5L8IhTKhOydDVAih31hSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5864

On 08/06/2023 10:59 am, Roger Pau Monne wrote:
> Some of the current users of hvm_cr4_guest_valid_bits() don't print
> the valid mask in case of error, and thus the resulting error messages
> are not as helpful as they could be.
>
> Amend callers to always print the value of hvm_cr4_guest_valid_bits()
> together with the rejected bits in the checked value. Also take the
> opportunity and adjust all the users to use the same print formatter.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

