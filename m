Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097556989CC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 02:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496314.766999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSSvm-0000Bq-Qo; Thu, 16 Feb 2023 01:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496314.766999; Thu, 16 Feb 2023 01:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSSvm-000091-Nv; Thu, 16 Feb 2023 01:19:26 +0000
Received: by outflank-mailman (input) for mailman id 496314;
 Thu, 16 Feb 2023 01:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSSvl-00008v-1j
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 01:19:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0482365-ad97-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 02:19:22 +0100 (CET)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 20:19:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH8PR03MB7174.namprd03.prod.outlook.com (2603:10b6:510:259::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 01:19:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 01:19:15 +0000
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
X-Inumbo-ID: f0482365-ad97-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676510362;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JCuDo7Jh//tAOXQ9beUGsKZVsGpjRnl9red+BJrkUyc=;
  b=EfNdXpg1oPSrbwcDldTg5Lf6bDHMq5b2rZpZNJqeIFByzChTrCMKFlXG
   8qrrXTl0xynF413G2B/yIlWwCpp95mf7zPd8UmD7+jD5xMcmxmmuIMtPo
   u3oB7WHRX88+sLJQj9xmfVBx7Y6G17MklTpol15Pf4kh+vq6vI/ld3SZj
   4=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 97148516
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:S6I6UKrj1QQMncTasoqrQjTMC2NeBmLUZBIvgKrLsJaIsI4StFCzt
 garIBmPPq3Ya2L8Ldx/aIrk901U7MPdx4U2GQM6pXswFykbpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEziRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG40ahCDvsS5/L7lYbU0qtY6IorSYrpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWOEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpqac20ADKmAT/DjUyDHm3jKm9yXe4Ad1iD
 0so9hYOhKoboRnDot7VGkfQTGS/lhsdUNpZF6s98hOAzoLd5grfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESMcN2MFaAcPRBEJ5NSlq4Y25jrUVcpqGqOxitzzGBnzz
 iqMoSx4gK8c5fPnzI2+9FHDxj6p+J7AS1dv4h2NBz3+qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y2d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:hngX2q+aUd+br/Tz4z5uk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.97,301,1669093200"; 
   d="scan'208";a="97148516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/8zBYgf20zx7wK2ZYfeJ8agf8Ce0hV9oEpbg0/XrevFTW1TW2UfKhpcvbIHeRxTW46GMwN7x9uWg0Intn6ZVljvN2fHt1tYrSpNSE+Mi4Ihfe1gt4Us3SMq82obLvfuTFfUYy9CGfqsM54E5JRDlCjmfK81B5IdCM2QhfBsOBnjs1zisUv5Sjq1eJ4COxoYYzEmu8942QjQm2gsHABr+kTs8nUrU2wOFKmZ5vUnjf5WHkAyeH8DEMfctMqAGBfKAzOASXTr0hgWRgcB4Ewk/NM99IDAdmPLbJKnvIledOpm5NcE1LOWEbE0Geg5QdEZ6J+oLj0ShZYeGL2OPye6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js1GesCnGjYso5HBqdg8LKv+7LiWNm3CiZn2vEHvEVc=;
 b=mbNG26RF024hgPhdmsEh7y5FH/SapXOpTUoh8bcsA097WBiJjTtfoTFW150D39cbmtWUgRA8fpMkKq9Ukq0w9bmjJov7gs8itY7yYnnJdBucJOTs+A9swZk0k9GhsF0kv3R5f1XDjvFhyKhaeBGbDDF0JtVdUYBNGQlrSHYjT0xSsfyfg8uexeSvaOF+hupRA/mjt8ZB+oUTtJsHtu04QeY8kFsk4+lq+CXS9OK2eSwVpT3TcTCD+bjNng8kC54R7uC0aDwNzzm/WFI+nI/hQQA6mimBjqtjoDQloFCdDja0vruNndAWxp8OD3S6zQWkeM2kLLoRQ2swW08EiwSx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js1GesCnGjYso5HBqdg8LKv+7LiWNm3CiZn2vEHvEVc=;
 b=GE05aEU/KQz20BWmlzZ3dK3h+817FL5KoVEPOj9hKszbdYmNBY/QSlpPFJkkjNKYkBFy0a8TfgeO3jQGiMQaF7ewYyQPNKWm1vDD79q6W9atygnECih32BzTd/BCdCaVMdU1tEJuoIFH+kwqACtNos3VAeSPybAMuHfTl8AXaas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <88342cde-16ec-5451-cd4e-e6669927af0a@citrix.com>
Date: Thu, 16 Feb 2023 01:19:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/5] automation: Add a static memory allocation test on
 arm32
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230214153842.15637-1-michal.orzel@amd.com>
 <20230214153842.15637-4-michal.orzel@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230214153842.15637-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH8PR03MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 52472e18-9eb0-4377-1b02-08db0fbbd12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SPp/GTAtJu4fy0dvlLgQq21bZOBB07wCEel+zZBfLSH/einb8jR2/bxc4hL9W5m5KgE2C+9jDJjKKC9+aoDdAYSH8xnw8zMQmafsE2zyuj8ux8hV9O2R1iPMIKaCRQzRH7KfjTS3YeKywz3iRUvJZizNHRCYQ5yl+l159AQ5S5gKmJkB83wm+BzXK+zMUL6o9QDF43Vr+xbeikw4Z5lW3eS1tAJF4VDQPY/e4vWfB03/zKe9aqhhbo1+reZz8W6m6uO0Kyh5UyacqOryOCILAFmSvYw6h+iiH1cFt+Nymgct56Tp7shqc5ST9Yo/2/pUP9lDno8a6hb+WDmZWmwfWASKC/POlS8WtpN/p+bGHEUhYZo1p+KiGIgv6USEr5r3ntHIAmZ7UBXW0L/bGCjzG49AIpvXzDJAyvLm3U9sFr9k+bqQ3rmjddgRyDPOzy2sLAzLS6MKC7C+SpVW/Sehi8PF3wFDOru4OxTVXstBYmYxSGFmbdXl90zEFc8sC68s4RN73Qepx8Plb4ElEW4lCWCsPbszo3zMy+2nRYK1VoOyEO/PygfgCAl9/BkSjAaZg7kSYYXmKDv2VlMKBmkX6miPC5HZAXXBUDlFRZW8vadC+Ctq7snqEdORRhc842aaNLMcQ5dNfVBun54Z5AzKCixKKcy6yOfKJIddmIDywrpkNuHPVJERUFJ8lJZuzOerYb8TpLuzFJxl6UlCZSbh05YEvfzoE9CkmOn3kG8XQ/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199018)(86362001)(31696002)(54906003)(38100700002)(83380400001)(66476007)(4326008)(82960400001)(478600001)(31686004)(2616005)(6512007)(26005)(53546011)(6666004)(6506007)(6486002)(66946007)(8676002)(41300700001)(5660300002)(8936002)(316002)(186003)(36756003)(2906002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlgwRVZWdWE3MkVWeVlTYzY3TDJkWEVEUlVHOFFXTFVDY0R2Rk1tbWkxTGxn?=
 =?utf-8?B?UVpMMUpOVk5INVp6c21rdGhkNmE1NU5TUkw4cGpZVlVkRVpVbWpvWjFsN2Fr?=
 =?utf-8?B?bURGNkxVUG5NdkNaZG9DRFhIZGx5ckZIQkVLNUgva2UwTEsxSlFmTUkyQ2tC?=
 =?utf-8?B?SzdzWXBFNUFHSENPaUVERzJVZmhLOWhSZ2JRMDM5MjFKZ0paYXppeXJLVm0v?=
 =?utf-8?B?QzRPS0JuUzNLUDdnMkNaaUZaZlVYSnJuL1pCOEpJZU9pUzVmZUM5UGZBRWZn?=
 =?utf-8?B?NkpqM2lmdjA3RjRZRktVSGZtS0g0ZVplVlZ0UTh3eE0vaks2NUhkOFNzdVFm?=
 =?utf-8?B?SWJWZDUwV0I3c0RlNmhhUXVhVUMwbHpnRllCeWRaOHRTbWZpdDFSY0dTR0c4?=
 =?utf-8?B?ZEdhZ3ZhUXVnSGs2Z1FWSytnV1ZnRXkwUC9nT1B4bDk3dFcyNllXS1ArRW1n?=
 =?utf-8?B?Lzl3dlNYZEZvNVF5NVM5dis5K1c1UDUrRHBHM1ZyWVVaazlFVlNhdWdaVGtz?=
 =?utf-8?B?VjBhMEVDZzdJWnZwaC8yUTB6dytuKzZxOHR5a0cvUmNYNnpuRnV0RU5nODV2?=
 =?utf-8?B?citGQyt6UnFvVkhCcnhaTHVZc25yaVhXYmpGWU5CZlRLWHMvanEyQm5takg1?=
 =?utf-8?B?OFJTSStCZmxpVERDNlpnS0ZEU05aZExQRDJXa0JOcytlM0xPRitic0ZXRDlZ?=
 =?utf-8?B?VExSeTRnS0hLNFZTeDZjMUlCeUhpWVl1Zy9mUVFJNm12RnMySm5tMk5yYkls?=
 =?utf-8?B?cDVZRmNSZXRYcjBoWlMxVUpjSDJPRGovRXZDMFNZNHVqT2x6K3F5d3VrYnVv?=
 =?utf-8?B?NUJJUkVvSStWRVR4dGY1Q2RRM1g3ZWlGcms2TDNKbzFSeHBRVzIzdHNxbWk4?=
 =?utf-8?B?VlZBeEFPSTJGUDBFN3JtTmFuZXdIR3Jvd3dQc2d5ejdsY0hvTTY5cERPUlE0?=
 =?utf-8?B?b1o2MFVQZ1ZtR0VpVzZDNHVvRHE3enhHcW9OVXdGS01NNENmVCtNdHF4aUJt?=
 =?utf-8?B?amkzVG1FYmJkNnpJQTc0d2FGdVp2N2tvb3p5OGJJbDVjaGp1dHNmdEIwSEl3?=
 =?utf-8?B?ZnBJRDdpN0pTSlpsYUdIQ1NOdmVUNm55NU8zc3V2M24yUzFMY0xVUUhiNlRQ?=
 =?utf-8?B?bC9IK3hlcURWNGprWHRPdUhDSlNoVWJtWTR4VFd6WUJNWEZqeXVYSklLdzY3?=
 =?utf-8?B?cGtzM2U0NHNKNXhkbmcvUDlKay9MMHdGUTZvRnpscUpIdGZvTVRvSGJ3cjcx?=
 =?utf-8?B?Q015KzNTMVNOa3hpRWVqWENvemV5bXM0ME1lWlczNFhtUkp3dEg3bkdhUjFT?=
 =?utf-8?B?Q0hjN2VualRFdlc3RTVJSUJQR0hDUExJUW1ncGZ1N2xhYkY5b28wUVg0UlV0?=
 =?utf-8?B?dTBrYXRKZWhwNVpNd3Z1eFRxakpUczVXUnZsU3pTK0F1bmthckx0cXpVNCtK?=
 =?utf-8?B?ajRKZEFLVk8zbFRYemRNU1NzZ1NRdm5mdFNGVmVXVjJJcmRMeDN4bTNwc2dP?=
 =?utf-8?B?UVlDUkRMa3RycTZhYTNOZWFtckRCRUYwZ3NKZEdwT2FKQW1Qc1ZPOFRlSDN2?=
 =?utf-8?B?d2drMTNxZ2lUaDlNT2IyL1RZRXd4Mzd6c3FmVzJpaFk0SHlhSEExb0t5STBX?=
 =?utf-8?B?eWhDc0dhZ2N5SWpGUUlpTGhoSVdkVmFFZ3F4U1djcmFFVCtpbjhVd1AvOWhB?=
 =?utf-8?B?YTI0cDNQT0FXQ1NiKzNSOTA4eEdRRFhwTmFSZTZTbnBkMEozOGttT24wcVZh?=
 =?utf-8?B?TE45L2wvTTkraHl1blRrdGdVaWcwaWlQQkF0MnRvdWk5V0VIMVA2V1U1Nitm?=
 =?utf-8?B?NVB3LzJBTSt0Zjk0UHBNMThnSXFSRUd1ZDNtYWFNekxrR0g1Wms2OUdKYWVk?=
 =?utf-8?B?MS9xSTFpcWh0T05SbkNlbHNqZHZyWGFjbWtjaFlvSzZvbTJVUXl6TWZrRHJT?=
 =?utf-8?B?UTF0MG9ocitDSXpWOUxaWUd6cFQyNnNpS3h3SnZxNlNUYlB0eTNpOU9zeFlw?=
 =?utf-8?B?aXZRN1UyM1dueVZzcEd4UUM5OTBDVkp1WnNPU3JwQnE5Q0dha3kvWFh1Y3gr?=
 =?utf-8?B?OTBvcXltcjNycHRFOThLNHo1dkdYd1Z2WlNvVFI5cmFrdUh3ZWhZUTN0Slkz?=
 =?utf-8?B?bW45N1JKK3FZRCtYK1NWa1AzekhMVU9DRDVzWXlBVVpTZjhtaGpwa1BaeFRE?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pOAOaR6KuVt9GDRre74NxYka3lbzzaktrNsYfUF8tATjXZaxKN++KsBDSZijBE+7luVkbP1OEHCPvA1DT5KffvB+xP28jCC/wgOLzB/vmsgb+kguit9NnvoFaYy1P1trezpN4khr5QPW8oNVK88s43ggddm0rJCpNe6JkrEkMct48Z5o1AZXAozMd0OrfZoAKTMMAqCdUq4XekBWv9FJznmbIY4Q8n9wGDuWoxXWg/nLIU6Qui+pnta4OcE2B6Y7PyWLfuxbTsHEW30YigcsfQrFmi8fcNn+OifUkgJJY7/qhdM5aa3VUgc+KBXFdhU5afKsUbm5wmKfb7CPd7lunv/J51u6xz7dL0zYkOwX8VNsgkvxa7Qy1b8of2nyTmmi58vWdRnA03VWlPmW4pMq+HM5+JoxDt/hNXEOohucYzQJPrLYoElAp1o923GRdrVZGyNXNhZZWxbIhO22Oh0Ezw6Jx10Hlz4uoBUvIIrmDJ9cd2AsjI9BuAsBGf1VNcm5A3MpfJpJxqoJNa2/1pXuI4joGaZlMFROSY77lVfydP6DaL73nVjKGGjqDbCu0TYo7aqnCw5wQOydzfuv/SGaNx3YtE0xOjj4I8iidJhoyKY8hWsLQkyE2S/Tj/xA3w6xrtg+AiMPR8hMGPyfxPO2rll8swr7qNhsWEI/4xkjFOwkGZvQS64MtPECTvr0O/dWYpJtEMAuWw/IdkJptUhpdQsLk27jkOZeYHkeCjHdlQX9gdGpF4FqiE18qnXVx6vctwztt8tc7IYaCge9k+DXftYJwKs47q0PexchIC9asarNPLvWwlkcX/XqbbpdVh6Xxa7ym1RQp2bSfdqreGJPmj34TQL1jG5QH/FBC5qWQg8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52472e18-9eb0-4377-1b02-08db0fbbd12a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 01:19:14.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tZwjEZxsNA8l5SM3ZNBu8scU0xufyqwI6bNG+xFJ0ZwqpY834N/aDB9NXXWgqhy4/UMt84JKG8sO/IkZv7EwK+ftSb4CC0QA04W10cMEDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7174

On 14/02/2023 3:38 pm, Michal Orzel wrote:
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index f8e156e0a994..079e9b73f659 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -565,6 +565,26 @@ debian-unstable-gcc-arm32-debug-randconfig:
>      HYPERVISOR_ONLY: y
>      RANDCONFIG: y
>  
> +debian-unstable-gcc-arm32-staticmem:
> +  extends: .gcc-arm32-cross-build
> +  variables:
> +    CONTAINER: debian:unstable-arm64v8-arm32-gcc
> +    HYPERVISOR_ONLY: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_STATIC_MEMORY=y

This is absurd.  Either

1) static mem is important enough to warrant testing.  By adding it to
CI, you have caused the maintainers to accept the responsibility of
fixing bugs found in it, making it by definition supported, or

2) it is not important enough to warrant testing, at which point it's
not ok to be using XenProject's limited testing resource like this, and
it's not ok to be a blocking test.

There is no such thing as an unsupported feature running in CI.  It is a
complete contradiction in terms.

~Andrew

