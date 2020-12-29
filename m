Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5512E7150
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59928.105073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFqO-0002Op-Gs; Tue, 29 Dec 2020 14:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59928.105073; Tue, 29 Dec 2020 14:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFqO-0002OQ-DU; Tue, 29 Dec 2020 14:19:24 +0000
Received: by outflank-mailman (input) for mailman id 59928;
 Tue, 29 Dec 2020 14:19:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuFqN-0002OL-Dz
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:19:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01550ac2-3a6d-4bcd-a2f0-20164a1945cd;
 Tue, 29 Dec 2020 14:19:22 +0000 (UTC)
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
X-Inumbo-ID: 01550ac2-3a6d-4bcd-a2f0-20164a1945cd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609251561;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9GmDXzxTMaQDgaKSESowhzGNxp/qoNa7SSE40WiIgog=;
  b=hS4JYZeICFwQB48jRSwph+hhDzDLGeiVXavGUu+ASatgGeibfIrGpIam
   yO/Zh5LTUM4GPhe0IEWD8vBgvv3haT/qyEoiTjKp1HaxRoN3ID9Thtg36
   5cap39KyFsrh4NU7KqUSxt77LMDeBzDVd4r+J8PBBFvxxnXU+8g1nZs92
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qHo/wSHxkp+snB0br2SfS1sZtRYyLqXclfhmr190QfqQagsthQlz6vNB6uNHpF7pdykPR8DqTi
 D0DjNwJcvHS2JWxjehCPio04Ibo9fEU+99uNbb/nFe6O4TwFdD+HBmFl5vfBEF8F4za0YZYJCy
 A1WFqtQkCpoiNDtgKw/y1I214A10GxYZTWWOHdKT1D6kaFrnncm84wtsSHDdqXq5biKeCpSySJ
 O0WWsTwCNdRlKOl0/iPQU4srrKYbKJYEzO1MC1xSswNr/jRjExMyZ8YGH9M26XIdfMUi2OFiH8
 6kw=
X-SBRS: 5.2
X-MesageID: 35345244
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="35345244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyq9K4YB4kI6BpTP9M0e+ky9JdVotSURhTe5odYGRJKWES5oNPAhBjntEEKarGHvM83fu3hUgbGtffXqFTDmPKUsDQOGwjAAKU/p4Z9u9wMt1P7fm4B+Aj/jKeL8FRci6Pap9M506H/351gTEwPq5FwkoMCM4fwYayE9qz4lve8bm0Ent9AQ373cwNoZnR61jwHQtxCW0aTKetCcyWkK74bEpENF4FTInixMLploNX6wPlyvVehRg+KFpwOcDMf60ImEwKbBXytrwk+pxdyIHrRC3lHD9Wv+YwhwL9l5eCpmTpGek2sSCkOA6uaEytXWxWnzrqZe/l9Iza/DXxaeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2fJ9GEnvgjexRq4pdQGzJZWM2L5rT/JTe6viCoNqSs=;
 b=BnpOk4X77pD6QKDflqoJt7u3ZOZ6+cRF6FGvBDu2dftYJdEn7rObnytkZWvOwHQPE4e/RY+S78osH+yjYlLyQAzfF6XWy+2anVrYcPQcFW81yGdskYyd8K9Ix7gvz1EvQySBXp6AU1DiAU8wG7DxB9qYFi3Arl/g2vpzrl97zkkUEJXSQK6miT1hWl+OJHO39M4H6FXf/OnhMLWVFNNwV9ow95UdEPWJIEvUAUlXtbYZbUQF8y2caN6GOOugidlruMLUFkkXEMn7XPKNjBHJ+eB/ndC4sfl6Sgb3EQ1TbxD9VLHzASPri4rZHLBqNWxmmhvaZ+79hY4TxaVsM5Shew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2fJ9GEnvgjexRq4pdQGzJZWM2L5rT/JTe6viCoNqSs=;
 b=d+Mqp9WEBZcRcJZCBt0XlTzPm1tTq1ywyfpBP/G8+6LQ5rVPcHqPNPBaFn8alO+ZlVf3+SN35uM5hGIus9Zlyim75fsQyJH7Vms2C3nDyHcJduqqsErWn3zK2WEqnuDzEscuHUeYEhz7+2/0mXeOl27jbusiBV7atXuN2y+gNZQ=
Date: Tue, 29 Dec 2020 15:19:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 16/24] Switch NetBSD to QEMU_XEN (!traditional)
Message-ID: <20201229141914.wqj2h5ber7vgdxbk@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-17-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-17-bouyer@netbsd.org>
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e17277-cf7f-4e13-0e5c-08d8ac04bb16
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR03MB255498841468FB7581729DD18FD80@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PNK9wlKcva8EOxT6WoXLuOJuD5beMxtxheQhddh0pvEdE5zJCO49jWKAWqK6UPS+D0r/PImW20aavWkFMZ9lfWjJwcNZjZKDl6oHZvL43Ytn4OnDZuME3wPQGqGLsLSsYnm1IcsW72JOhhk2hd2YKgoOu7L+n1BsSJuv/+55bdevywdKGQNzOJ5NPG/tMb5D65e9EsSUcbD7g50cTLxqhDbDrq/lx9oKsr1PgsC7FU6/bDOHSMmXotfusYKPNR4jACJhnIKxK3AKW+smiEsuo1g6gW+nRfLxWEW2mZksA55jsr4L87IDsmQLyOQqgTRwt07yhHCbr1k+vo/ReNzl+ph1A5Qr0BE5cnwE37uS6NjRq6YQXVGlZ7gIhbPQ18s3eJlpLSUs0nEFnH047/PRAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(26005)(6486002)(1076003)(4744005)(6916009)(66476007)(6496006)(8936002)(5660300002)(83380400001)(9686003)(956004)(66946007)(6666004)(186003)(316002)(33716001)(4326008)(8676002)(66556008)(16526019)(86362001)(85182001)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Unp0VzV1dDhNUW1vRVB2SlI1djFwRXE0elErdm1TU1M2WG9vYXNDNStWS2RL?=
 =?utf-8?B?MG55S2M4SUZNbmZlUlJ2N0dPZ29iV1dHZlpGa1hISHZ4WmNTcXN0Z2ZWaFh2?=
 =?utf-8?B?VmZ3Y1VheHVkczRkY0NIeEJSZjBpU0FhK3FHdUJ2eitKRXhiVHlDZEZpYmdU?=
 =?utf-8?B?dnRGeldBempObFF0VTlIOGVFMkNheW1PUHR2TXpTNERaNko2RzdxZ0JTUGJX?=
 =?utf-8?B?dllvVUxYWkkxVk4xWEIwOTFuV0Rna2tScHlJNk8rUVNlVHdLTndkV3MxS2pt?=
 =?utf-8?B?aHY3THQwZ3E2MnE2clducEJaNVI1R1NKOE9oYUhpTVNhMnNEaVBodUprcm5Z?=
 =?utf-8?B?YnVUMTRtQ3g0M1NHaTFHbEd5RG4vRE9STUFkMlNtWm8wcWM3Tm8rd0FqQ2c4?=
 =?utf-8?B?MEQzN001cXpOeGExY3cyQW90Nit1ckNDWnpWV3lPQWlZLzRpalFSeTB6SzMz?=
 =?utf-8?B?b2thUlFwVFRibnc1QXNhQklqL1g1N0x6QlB4R0RkaThDaFdaL0ZIbXVXdDln?=
 =?utf-8?B?L2dQd3l5Ly9tK3MzeWQ1NzExekFPTTd3M1lOUFc2L2lSeTlUL1E3dGJPRW1O?=
 =?utf-8?B?VVFqdzFISmFVQjg4eUFadE5wY3JVcUttQjZOUkdqY3c3ZGdMbUFDelhqNjBS?=
 =?utf-8?B?RHA4ZWdDRzBOWkdoSDMvdTNKU2Jld3pTUU4rZlkrN29TWlZYTFVkRmdTY3RL?=
 =?utf-8?B?aEZnbTVTYnAvT0ZQZ0VINHQvaVhMRXJmWHdyK21VVFRPTzdneThGVDg5bFNS?=
 =?utf-8?B?ME1ha0x1bGpka2F4dXlQMTBuNVJlT3JYSk54YnZHQ3Y1aGhXZm8ySEVCUUlY?=
 =?utf-8?B?bUQ1ZzYvenRaN3RweUNsZmFzUUZTd2hpWnZTUDBiUVNHVzhSd0tLWVhrK1Iz?=
 =?utf-8?B?WkFDNXdQQmNZbGJUa1NwS2xGTlBvc3FPQUtRZGI3YVg5TjVxWGFFQUpHeWha?=
 =?utf-8?B?S2ZsUzNsQ3NJSXM2c0w2a1JiQmhoaytzOElZR3JvTzR5cG8xRnpTSkZpMXlX?=
 =?utf-8?B?dmdUalRLblRYOThIY1RoaEo5WGU1b1NwdXpQT3ZPZTdBdzVjS1VxSVB1SExr?=
 =?utf-8?B?NVBRVTVYSndzRFZSTHJOOWlhYkF0K256NTF3TnYxZFY0UmZqbDRoM0Vtb2F4?=
 =?utf-8?B?MVZNSHZMSnpTT1RRQ2w3YjhXNW1EbEVPMTdvWGdYdnZqQ1UxVitJVVY0T3do?=
 =?utf-8?B?Z3R4bnNUNTl5czd0RXRWaTljWDhVdEtkSFVMVjhWVmNOdzhjZlY4SE9VTkxR?=
 =?utf-8?B?NkU5SWRmSi9lcG1VMlZ5OTJpcm5nMXJ6Rm02RENWSDRuMElldzRSRUU0dzJk?=
 =?utf-8?Q?Br15e5y+TvDc/JSn/YcAC5nVp0k2o3AD+R?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:19:19.0431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e17277-cf7f-4e13-0e5c-08d8ac04bb16
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/J9GjwGi66bnFi7MUNziuS5aVcJ/jHbYaus3WmwYmPnidM9LjB3XXV4nnKLTYDRkio5z5zoVRXnhhesbU8A3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:15PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/light/libxl_netbsd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libs/light/libxl_netbsd.c b/tools/libs/light/libxl_netbsd.c
> index e66a393d7f..31334f932c 100644
> --- a/tools/libs/light/libxl_netbsd.c
> +++ b/tools/libs/light/libxl_netbsd.c
> @@ -110,7 +110,7 @@ out:
>  
>  libxl_device_model_version libxl__default_device_model(libxl__gc *gc)
>  {
> -    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
> +    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
>  }

All libxl supported OSes will now be using upstream QEMU as default,
maybe it's best to just move libxl__default_device_model into
libxl_dm.c instead of having 3 equal copies in OS specific files.

Thanks, Roger.

