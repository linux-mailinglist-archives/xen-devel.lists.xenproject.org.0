Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648536674F9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476188.738236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyNS-0007q5-AY; Thu, 12 Jan 2023 14:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476188.738236; Thu, 12 Jan 2023 14:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyNS-0007nj-7e; Thu, 12 Jan 2023 14:16:22 +0000
Received: by outflank-mailman (input) for mailman id 476188;
 Thu, 12 Jan 2023 14:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFyNQ-0007nd-Rs
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:16:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adfb10cf-9283-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 15:16:19 +0100 (CET)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 09:16:16 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6460.namprd03.prod.outlook.com (2603:10b6:303:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 14:16:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 14:16:11 +0000
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
X-Inumbo-ID: adfb10cf-9283-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673532979;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=M4MLRHfiI+tlOzl0M5z8zfqWd7k4vE8XvdoGTLWQuxY=;
  b=cVdErYBqvZUkMNOOlHQ97ABmgLi+5ulgVnpqg2PLfLcUu7rG+DLnbli4
   /T8E/bCnv6bhSNE4ET2lBNRowcxdAMKwNqoElJmp9GWJVBx2uu2emON7e
   Ei+he8edGhfeyyNjk29TE3YMYB08xk6jS5b43xanUS6lhJ6uB1q425U7G
   0=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 92355094
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aA0EwaMaYTT0sazvrR2clsFynXyQoLVcMsEvi/4bfWQNrUp21GdVz
 DFNC2jUOPiJZjSjfd1xady2oxwD75LdmNMxTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rlQXmZop
 N0RETtXTyqvv/yn3Y6wEtA506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6Vxn6mANNOfFG+3tNQmwO/1DE6NDtIWRid8cCopHCeZvsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZj1Mdt0g8tM3TDoC1
 1mVktevDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwHC6qx
 TmP9XI6n+9L0ZVN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:e0/ES6Ffdxl9Ue9kpLqE2ceALOsnbusQ8zAXPhZKOHlom62j5r
 uTdZEgv3LJYVkqKRYdcLy7SdC9qBDnlKKdg7NhWYtKNTOO0ACVxedZnOjfKhLbak/DH4VmpM
 FdmsZFeaXN5JtB4voSIjPVLz/t+re6GWmT5dvj8w==
X-IronPort-AV: E=Sophos;i="5.97,211,1669093200"; 
   d="scan'208";a="92355094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkhyhHD8hMsvNpm4fqwp/gtEELQX0TyDa9GI4sGChI3BLfKuzj09EbHLXEuLvdpTp1mgXtccmewjvNzBNOsPvxFtzQcf4UMVu1fYy+BlDN4JGfn+ubhj5Ujcm37Cmv4iwEGVFsfP200EmRyy365ZBx3VN6BtUtt5oFqFCDZHKkVBANBDXXGtPt6zy4TvzKYuy+K9gxsoTa9QLGMpFWheYXkoz/sa+wlbsynpQci7vjWahYQaSMR4W/Ae9Zy1aJHUOCiHg8QFZdo26BI/wJpR3syZghmb9SlPjxBVIKDOCQAjXF7Z+Hn8FPj5LubRXSO+lYyl++Q3tyvB6ndlDZLddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4MLRHfiI+tlOzl0M5z8zfqWd7k4vE8XvdoGTLWQuxY=;
 b=R4fimVzK47dFPO66/AisLIyJ+o34J7/6RRVnfOZ8I1S349TM1/RXdRjwRI+uen6YH9CXCpe+UQCC0iUQnmGe5vpb33GgJWfgmLWkfFllJ2ZwO4P/oYKhGLR7cRqpMuHI0FE0Mq9mstZKUnf3LPJqFIIvvCa8jwtmvKfYFxN2ue7T9UWGZy3pDCuVdWZwUhr4yoqNTp3RgplMTMZdSzUBk9q+U+MxJ/I6s0ewH3zxPJtgRSySXAuPtS06hTXSBr2dDz9/tKixrpTL3liIkDRQ9xnfNNQ6MBmZIMbejyj5bZsYQKPlMthNJaZYGVqK2qSI12LNuLGZ+xRGrmZ6NSGQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4MLRHfiI+tlOzl0M5z8zfqWd7k4vE8XvdoGTLWQuxY=;
 b=Q1CshBj0F7v2MVXe/Ra3sY/Zl/54gItTGjMvd4fwtdegTGHyEek4rk+5OwVTn8PaYLnJL+vkbFiAcz2P9U4g3hPZapft6YPLNS5WVZZMUW0XHFdypNs6f3rRBc4PZTFqH0yV2ORcsE6rWWqS2y/2pTlkhTvR+/mwCZbqDYEq+wY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Thread-Topic: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Thread-Index: AQHZJReeV/6Z/BfYW0W8YgpP3+cAB66ayMYAgAAN4oA=
Date: Thu, 12 Jan 2023 14:16:11 +0000
Message-ID: <f1e2d71d-5fad-962d-a7a0-af1044f40de6@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-7-andrew.cooper3@citrix.com>
 <f64f0bbf-8f47-e897-eb7c-51f11c9ea4a8@suse.com>
In-Reply-To: <f64f0bbf-8f47-e897-eb7c-51f11c9ea4a8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6460:EE_
x-ms-office365-filtering-correlation-id: 10a3c5d1-979a-4679-b486-08daf4a78e9a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d/ltQULOJYSCIFxlzPN25XbqojMENpX2uON9xTaY1k/l7LXu7zOIBuJbXXQ6zopmu4LN3hDgPUlZE4DPqC9Vl9h3F+PLRLcAZMJOZQ/MHFYNNooo+zfmWgFovyMu4a4xYPoeo7u4mn8bdig3ElPBlGozpEvAQ650Ma48/8r5bK7Jny8q4ROFZNoWWtkCTDFRVnUcKRckbbCUBKXGAhf+Yu9YemqO90uTEVri+5VKC1Ud+XnxeSop6v3ngv0JuqMpVzNH8tJ1/UQAhyHr7gkNi1bTdoQl1H+smo+aW9eccoYRlntbBAOzy3dUJMuDY0bVm1muCz89moq5qO48Y8WCAH9VJ9bZBl7N7i14i6B3IWQxGtxVNcdMpY+oWu5rL6EPOT1veFNA55QFTjkoOUlgPVjKhbI34o5Y6jGikGV07HVmKaykdMLnxIoAtOX37OKSVdTiKE0nF5zfoJyoEn9SaCaHVyzbRw2dU8b6W/OSmEAR8OGT5LnRUbEc5NiipY+ow7U/fs21G83rq0zKwL38DVABsEzW6/ygsZ47I6MZOwdQ1BvdCVzoVCzeRKYp8GWsCd/4zUa635EmNRAhdWWkw/DGVbzH7pkXCSocz8hvXb782z8/yE6bY7UeBGGsf14xg2Wins7i19jLDrMyiW/ty0a4FVBFFOaJ3Pa7xBYk2vgDtwKARmYMsCdgNLzaH8meBDHVZc40+lWwjBoQ6vhvXDsG9TypOWUwTJq161NA8qz0rnlzlU9IZG5xaXV1XQ8HdEQqBfEz0TBRfDOTne90lw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(31686004)(53546011)(2906002)(71200400001)(6506007)(6512007)(26005)(478600001)(186003)(2616005)(36756003)(64756008)(66476007)(66556008)(76116006)(66446008)(41300700001)(6916009)(4326008)(316002)(8676002)(66946007)(5660300002)(82960400001)(54906003)(122000001)(8936002)(38100700002)(83380400001)(6486002)(91956017)(86362001)(38070700005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjRuYjlRSktqdVdwV1VjcmJpOGRxczdSMmkvc3ZHSlRaQ1Z2S0VZbWlTQnB4?=
 =?utf-8?B?ZmpYV2p0YTQ1dGVNN0JxQ0dGamNtK3ZjUVRKN25Ec284K2RDZjZ5N3NWNktk?=
 =?utf-8?B?YTNwUW00d0JjdUtMTFArWDlSWmJueDdPYTlJR01qdlBNRjdDeVZVc2xod1B0?=
 =?utf-8?B?TElLYU1wMmlOT0ppdXVZSlRkd0tnTEwwNmFQaG1IQlExNnRIWGlFb0hNSVBi?=
 =?utf-8?B?dXpacjUvTGFweERjZnFaSUZUS2RBb2lpM3llNzJWWXhBTCs1c0ladmVqT24x?=
 =?utf-8?B?V0dyQ0dReWxNQzRURHNDTjVCMUlOdzVFNTI2N21rd3pnTUtYWndSNVRsMVJy?=
 =?utf-8?B?aWUrU1dsTmhuajJoQlRtMzJCQitWZGhmdllYNFd5WUQ5Yld1V01yMDJReG1O?=
 =?utf-8?B?SFdwSnBmTW5ZZ0RGdzhOODhicnpjZlo0UUdvSW8yTldqb1JvRkxYNnp5M0x2?=
 =?utf-8?B?a215VUxRTHRDY1J0RjdicEcyN2FzSHNjOWRqQm93VnlrcTg5UHNWU05Fd3J0?=
 =?utf-8?B?R1FYMmFCUFhibCtleUhqU2RzYmQwaVNRbnZDOUE1b2pLS3lLTEtjQlZrUlV2?=
 =?utf-8?B?YzIrRVhOak1RYzdRbldZVXVUV2JOTmNJVkVEYlBsTVllb3Z6MklOVmlPMjRk?=
 =?utf-8?B?SlRGQzZZOGJIVzgySW5GdTlPUjRHU0Nnc0ZyMGluTVZwWXhIeEpOZGZ6YW5s?=
 =?utf-8?B?OHNWK2ZWWG4yT3lDdFBQKy9wdzcvQ3IrVWtKMGF3Zm5WVmF2VW5LSnp5WlRM?=
 =?utf-8?B?RzVIMzc1RlM4eDkwaW9ma0VNdUpQWmZBdlhoRVVtRUMxOFFzbnBlNHI5QjhS?=
 =?utf-8?B?RHM2a3h0NkJTSmlTYjlZNFNBVWNHOUNuSWhsQ1VrdE9hakRGYXdyZmhYNGp3?=
 =?utf-8?B?bmx2MGJReGlldFZRTWJZbXY1REo4Z2JEbi9NTzBYajEvamVKSFhVUEl0U2d5?=
 =?utf-8?B?d3VJSjQ3QlQycFdRTVQ0U2FHWE9GRzMzb0hacnEvN0ZUVWEvaDlkWXlPV2Jw?=
 =?utf-8?B?VC9FVjYrTTk2VVVxQk1tZmR5dkg0NEFKL2lTQUp4R0JZTnFBNjZaa1F0VG9E?=
 =?utf-8?B?U3hnd2FYNUc4Q3plemhSYTYrSTRibXBnYnZvOERobFo4cG8xUGQ5QWdtUTBP?=
 =?utf-8?B?YUpuYkg0cHh5UXExdFkwQTNEZmFwQ3BuOUc1OVoycnNGcTBkYVBQY2ZWSmVH?=
 =?utf-8?B?aVNGZTIyZGlpRWFDU09MMUVrbmtEeEdTNDMrM3U2cXpkSXFEZ2h3dHNNaFQv?=
 =?utf-8?B?SEQxekR4alBWNTJKMVJldlU2S3RCTWhNUU1kd1Uyc1VPMldka0hrQ0JORzY1?=
 =?utf-8?B?Z3hwNEJVQjR6KysxZmQzTVVoVTVKVlRrdXIrVi9PYm0wMENmS1dsalRNSzlv?=
 =?utf-8?B?SDZyWGVQSm9PMnB2cDhmM0tMVlVFMXdNeFA3ZndtTzRoMFpFMnJlOFlDd3NE?=
 =?utf-8?B?VFVncGRoVDcvYUxVak43RGZyNXdvcnpHRXRKNmJ1ODlXbzEwcXpqdUtTbXhy?=
 =?utf-8?B?L3dHVVhKZVVPaW10QlEzK2VHQWZ4aEk5dGJ1N3ZtME9ZVzh4VW0vT2Jad1ll?=
 =?utf-8?B?eWUvMDdJd28xb0oydzQ2NjZHUHFyOVhvaThycWNuNjJERnVkVmF3bm9qRkts?=
 =?utf-8?B?dUZBdUNaUi9YRUJ3WG5CVXh3L1lTVDM2SjZBcWtFSDlmVWJDSVFTaXBBWjdz?=
 =?utf-8?B?ZURJNlBCQUhWZlhjYnpYc00zVlBBUGltLzhRME56R3ExZ3F2ZlcrWVVzSHU1?=
 =?utf-8?B?Q1FzSXVVNE1Hb2RXT1QrUHpDeXJWOGlsS0R3Rms0cnZWRk9acTlWK1F4dm5K?=
 =?utf-8?B?SWxJRWxqL1B4K1drVDRLTGZWSkNabG5PN2YyMVRBZ3hteWtROENjeWFBT2xL?=
 =?utf-8?B?c0RzOHVvM0dwcHcwUG9PdEVlMG9VSkdwRldwNFJWY0FPYUNsazZOY0dkRTZI?=
 =?utf-8?B?ZXEvTUFMUGJtd2RoNW9SMnN1bkhoQ0pScm5wanR6MjhkQVlwdmxqTjhFU0hJ?=
 =?utf-8?B?S1ZlVkZxK0ZBcW1SN1RFVlJWNUE0YWIvS0FEMGVacTUzVW0wQU5aVUFFVmxu?=
 =?utf-8?B?bFNQWm01VVdHQllxT1dVM0F0RlJEU0tmYThESGlicDRNTTg2ZTRlci9oM25p?=
 =?utf-8?B?WFFUV2sxL0RHTUwxK2psQzBTdHdzZ29DMGEwSlZ6UDFGU0lVS0NzODVqVzhW?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D3B55E9AB659345A5920CAE2C5408F6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+xO04Fjmt0auY74A9ABbxrEEAxVW+0cuJyKn5caME9E2LQqnLwgv3+2/KRj/wPbtcsjbdeo1GMVsLVXGMnLOq3hneKwXpPYovFFzZ5Hkz+yeOk6iNIHJnHpscvgIg1ApXg6qKV/p0QhHvjbaYrTgicqquY+tos5/SlGIlHDyNIvDm2AQKRO7ozAq5dMHLaZXb/PoiDEXZ/VRjA/7KDJIKWFduRFh27a1ksM9dmm019c63n7P/cT0QMrtbobamdRr6TbsaThHwU6NySKbcci26OMbbl92CxeNoQhpcd20EQAR85gzheMfvGTKQ6ysOi4llt36cM/HEkqcqcsqjtOJV8ciguWbwoi9ZTCzMhHv6hWJLsa4y1hYoxtc676tBS0pbhChktn3C35yrtWmSPrGNPEGHXRZVP2wQwMv3TpZH6jdnoFgWO34jYXHjCNxzv5oXtQQ5MP6shepeU0CpSBmOYvXKHDHkorI1scCva/bOfH0Xh5Uj8eNA7QMSKcT5DxaygCIIVaXF6iCsG8yEw/zzINvHPte6BdckJN4OxXXiuYfqAqHEaOuLA6aezyUhZXCM4tI6gMhJQmPxX9PWcc5KuYe0ASQEqlU9DcGfk1/6VIcSvtaLTdBZTTEKxOWOCd4RgI4r3ny5SLXQrjDJgY7PLEJqMxRwjWQ7YCB2LZHNiExIeAmmTejA1QcXlduWn8qP2+WPscxhsw3Jao2KeBC046aEBexeh6Os5EQ48fyEk+UD+Q3HC+C+YyH/zukEOfSkCQlxyx2aMgNkqQIOkKWV5zK8qNtaeSm//wx8j1z+FOtzV1Qa33qpiAcm28/35C4WRLCDxG3X865FVeIoKEppbtVSBpvKPKJUMkztg/HJzk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a3c5d1-979a-4679-b486-08daf4a78e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 14:16:11.4940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJJKBldfN18K3jW9q44oCf9W7Nya5YvKdSHfa+mygMi02o3pRjrUWE0Hq7BWB8wpl8IqRq5/YkUcKSJclHR0wacT/eYOQV2Dn+dNNKzN+2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6460

T24gMTIvMDEvMjAyMyAxOjI2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTAuMDEuMjAy
MyAxODoxOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IEBAIC0yNDcxLDYgKzI0NzcsOSBAQCBz
dGF0aWMgdWludDY0X3QgY2ZfY2hlY2sgdm14X2dldF9yZWcoc3RydWN0IHZjcHUgKnYsIHVuc2ln
bmVkIGludCByZWcpDQo+PiAgICAgICAgICB9DQo+PiAgICAgICAgICByZXR1cm4gdmFsOw0KPj4g
IA0KPj4gKyAgICBjYXNlIE1TUl9QS1JTOg0KPj4gKyAgICAgICAgcmV0dXJuICh2ID09IGN1cnIp
ID8gcmRwa3JzKCkgOiBtc3JzLT5wa3JzOw0KPiBOb3RoaW5nIGhlcmUgb3IgLi4uDQo+DQo+PiBA
QCAtMjUxNCw2ICsyNTI1LDEyIEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIHZteF9zZXRfcmVnKHN0
cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcmVnLCB1aW50NjRfdCB2YWwpDQo+PiAgICAgICAg
ICAgICAgZG9tYWluX2NyYXNoKGQpOw0KPj4gICAgICAgICAgfQ0KPj4gICAgICAgICAgcmV0dXJu
Ow0KPj4gKw0KPj4gKyAgICBjYXNlIE1TUl9QS1JTOg0KPj4gKyAgICAgICAgbXNycy0+cGtycyA9
IHZhbDsNCj4+ICsgICAgICAgIGlmICggdiA9PSBjdXJyICkNCj4+ICsgICAgICAgICAgICB3cnBr
cnModmFsKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4gLi4uIGhlcmUgaXMgVk1YIG9yIChpZiB3
ZSB3ZXJlIHRvIHN1cHBvcnQgaXQsIGp1c3QgYXMgYSBhYnN0cmFjdA0KPiBjb25zaWRlcmF0aW9u
KSBIVk0gc3BlY2lmaWMuIFdoaWNoIG1ha2VzIG1lIHdvbmRlciB3aHkgdGhpcyBuZWVkcw0KPiBo
YW5kbGluZyBpbiBbZ3NdZXRfcmVnKCkgaW4gdGhlIGZpcnN0IHBsYWNlLiBJIGd1ZXNzIEknbSBz
dGlsbCBub3QNCj4gZnVsbHkgaW4gc3luYyB3aXRoIHlvdXIgbG9uZ2VyIHRlcm0gcGxhbnMgaGVy
ZSAuLi4NCg0KSWYgKHdoZW4pIEFNRCBpbXBsZW1lbnQgaXQsIHRoZSBBTUQgZm9ybSBuZWVkcyB3
aWxsIGJlIHZtY2ItPnBrcnMgYW5kDQpub3QgbXNycy0+cGtycywgYmVjYXVzZSBsaWtlIGFsbCBv
dGhlciBwYWdpbmcgY29udHJvbHMsIHRoZXknbGwgYmUNCnN3YXBwZWQgYXV0b21hdGljYWxseSBi
eSBWTVJVTi4NCg0KKEkgZG9uJ3Qga25vdyB0aGlzIGZvciBjZXJ0YWluLCBidXQgSSdtIGhhcHB5
IHRvIGJldCBvbiBpdCwgZ2l2ZW4gYQ0KZGVjYWRlIG9mIGNvbnNpc3RlbmN5IGluIHRoaXMgcmVn
YXJkLikNCg0KPiBUaGUgb3RoZXIgdGhpbmcgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCAoYW5kIGhh
dmluZyBhbiBhbnN3ZXIgdG8gdGhpcw0KPiB3b3VsZCBoYXZlIGJlZW4gYmV0dGVyIGJlZm9yZSBy
ZS1hcHBseWluZyBteSBSLWIgdG8gdGhpcyByZS1iYXNlZA0KPiBsb2dpYykgaXMgdG93YXJkcyB0
aGUgbGFjayBvZiBmZWF0dXJlIGNoZWNrcyBoZXJlLiBodm1fZ2V0X3JlZygpDQo+IGNhbiBiZSBj
YWxsZWQgZnJvbSBvdGhlciB0aGFuIGd1ZXN0X3JkbXNyKCksIGZvciBhbiBleGFtcGxlIHNlZQ0K
PiBhcmNoX2dldF9pbmZvX2d1ZXN0KCkuDQoNClRoZSBwb2ludCBpcyB0byBzZXBhcmF0ZSBhdWRp
dGluZyBsb2dpYyAod2FudHMgdG8gYmUgaW1wbGVtZW50ZWQgb25seQ0Kb25jZSkgZnJvbSBkYXRh
IHNodWZmbGluZyBsb2dpYyAoaXMgdGhlIHZhbHVlIGluIGEgcmVnaXN0ZXIsIG9yIHRoZSBNU1IN
Cmxpc3RzLCBvciBWTUNCL1ZNQ1Mgb3Igc3RydWN0IHZjcHUsIGV0YykuwqAgSXQgaXMgYWx3YXlz
IHRoZSBjYWxsZXIncw0KcmVzcG9uc2liaWxpdHkgdG8gY29uZmlybSB0aGF0IFJFRyBleGlzdHMs
IGFuZCB0aGF0IFZBTCBpcyBzdWl0YWJsZSBmb3IgUkVHLg0KDQphcmNoX2dldF9pbmZvX2d1ZXN0
KCkgcGFzc2VzIE1TUl9TSEFET1dfR1NfQkFTRSB3aGljaCBleGlzdHMNCnVuaWxhdGVyYWxseSAo
YmVjYXVzZSB3ZSBkb24ndCB0ZWNobmljYWxseSBkbyAhTE0gY29ycmVjdGx5LikNCg0KDQpCdXQg
dGhpcyBpcyBhbGwgZGlzY3Vzc2VkIGluIHRoZSBjb21tZW50IGJ5IHRoZSBmdW5jdGlvbiBwcm90
b3R5cGVzLsKgDQpJJ20gbm90IHN1cmUgaG93IHRvIG1ha2UgdGhhdCBhbnkgY2xlYXJlciB0aGFu
IGl0IGFscmVhZHkgaXMuDQoNCn5BbmRyZXcNCg==

