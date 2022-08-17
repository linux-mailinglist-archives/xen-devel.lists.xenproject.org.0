Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8BC5972E3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389063.625874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKwd-0000e2-FV; Wed, 17 Aug 2022 15:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389063.625874; Wed, 17 Aug 2022 15:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKwd-0000bD-By; Wed, 17 Aug 2022 15:26:59 +0000
Received: by outflank-mailman (input) for mailman id 389063;
 Wed, 17 Aug 2022 15:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctqM=YV=citrix.com=prvs=221f02cfb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oOKwb-0000b7-S7
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:26:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06712248-1e41-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 17:26:56 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2022 11:26:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5334.namprd03.prod.outlook.com (2603:10b6:610:92::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Wed, 17 Aug
 2022 15:26:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:26:51 +0000
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
X-Inumbo-ID: 06712248-1e41-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660750016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ENQoa+z9s6Pk0E90TGtnLLF1MfGKkWOEGZoQbSxQrXc=;
  b=RMU7tQBJtLRbDcDF1lULkkaUoODwB1nev0CmXNMym6r22gDw36VBvHgP
   3wQLFmSHvpm8JxzYm2gx1N44h5RmioMq2/Etax8qT3fc0lJTGVlTqewf2
   BbKNNj64JYUMo+VRCT0CziTQ0by65P5RHy92X7QY5FiFLaIaH38SMn/2N
   M=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 78744618
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G1CMuKABC37hThVW/+jiw5YqxClBgxIJ4kV8jS/XYbTApDMhhjJVn
 2VODWrTPfeOMzP9f4slbIrjpBhQ7cLcy4AwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsv3b8XuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW0L2k+hjMkxtAZIRxN5KOFNxx
 O1JFT9YO3hvh8ruqF66Ys9Fo517aezUZsYYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbru3yGvG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFZIPDlWTcohpAgMfzvSXkB6c4GoGT+69XmGeB1HxMVw8JAA7TTf6RzxTWt8hkA
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlyKDZ/gKYDWgsVSNaZZots8pebT430
 l6Emfv5CDopt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKksijrfQ9AlF7S65uAZAhn1y
 jGO6S0h3bMaiJdT073hpAiXxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:DT4ii6xjZLyZe0ImjW9HKrPxBOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MJ40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH5AJlO+1GkUKp
 goMCju3ocRTbpcVQGBgoBb+q3pYp30JGbffqFNgL3P79EcpgEF86JR/r1iop5HzuN8d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqYndydvaD6Dg9qFC7q
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXDoxttF75Z0t7XgTP6zWBfzA2wGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIkeu8o9WViJvsXXQ7ea/tDzYbLWPv7gADwkUmTwDj
 8KWyXyPtxJ6gSxVnrxkHHqKgfQk4zEjOdN+YThjpguIdI2R/xxWyAu+CeEz9DOLyFeuaore0
 Y7KK/7k8qA1BuLwVo=
X-IronPort-AV: E=Sophos;i="5.93,243,1654574400"; 
   d="scan'208";a="78744618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDjYQ4h0ThIu7KH7jzf1u4SIEprKQx6kQXtIPugQTiaS78sd5MNOkei8LIALtpaRqsL+IlLq4JvRuIBQACdo+px3yqeF9pvs/NFqZuZw/2zxWYnr6DoUDYzfPPmMQod/h6la/mGt1qLI2D2Mq3OvBhWoO6Ys3+kdDQpTefopcSKLO1EnAuRDHENN5SQcBOHJ8aPsfH2Ytg8XMNLbDbSkqDcV9E7RJAKRU/nBLLBHXMMmfRc5xPoRtefEw8hJ7Zq4Y3hA3960BXLBaX72PvXI+YcnIdHGSIAStXTM1hx7L8jCEbsRpbGs2U7xSeRO0jS9BlvmCkpHwYpwCUlBJbVVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENQoa+z9s6Pk0E90TGtnLLF1MfGKkWOEGZoQbSxQrXc=;
 b=d+WOCIXd2jGaWLX0Ys7v/TB/4QlCfEebIyEavDe8pQYqXlS2UucZ20y9K2E+rKpusdvACeQLY5ksFbsQHf01EWB/LRTmly6zmhZYvCwaDppkQ/ZdO4sNWwxvL9XZXW5VWzFv3vh2zRkkStWT4nMCpp7N/kRax8TyLsPV9rweuMptZP5l2itWVPybUdBdCwKZYr7Kz6dwI8tEWtt+zBaHzB4F418p7A6iO1UE8oUhYmiDQiCb0FeoYqJlG+7nAfey1etrdww3eVkuJ4AXd3VDLYnLZcyW4a89TfMpWVeTZb7Vl+5OOnWPk5fDwjpCxJv0f70R9y3F69BgLMfRdAhFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENQoa+z9s6Pk0E90TGtnLLF1MfGKkWOEGZoQbSxQrXc=;
 b=k+eyNKU9gSSTWCtYmvyV4WirL+R3JbLRS9P/JYGspzP6MrSA+bqC8zoAf2hlHwCYHZbnTzqUQRHtG3j61sY6uQab4Lg2MNzxsGeJmnNTQJZWCINFsBkoAcU2ZtdfcqsbudU40+kNEk7PUT7hDRMc3plL/AOcrx+WIggPT0fRWwA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] build: Fix missing MAKEFLAGS --no-print-directory
Thread-Topic: [XEN PATCH] build: Fix missing MAKEFLAGS --no-print-directory
Thread-Index: AQHYsk0DvrenaFtsHkyhk5kQsY6xbq2zNvGA
Date: Wed, 17 Aug 2022 15:26:51 +0000
Message-ID: <84e0f00b-0655-e6a4-ee3a-bdf5114b39a4@citrix.com>
References: <20220817152106.56601-1-anthony.perard@citrix.com>
In-Reply-To: <20220817152106.56601-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3396b671-bd0c-499b-81e3-08da8064e8bb
x-ms-traffictypediagnostic: CH2PR03MB5334:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Wc6u10g2MPPtD89iJsp+2rvN48Wmf3ttifUL53p6LadG2sd8POh97FoeKEfOUfTTNxSeaswPrNKRgCu7hTc3U/MnsSBQXNidDTBkr6Ueg/IRxCFg3OMWZgbpQwCHDUeO262Gz04G85EPpSq3JTFuV7y6pKRfU7hqagmkF7P5a/fVVzYlQfi5qqINr7f7OWiUf6D3fz64JRihjZgfP70O2OMhIzxSyavoUiQX+PpuxxRpqqrsqulDneo0rEMoj67icvr23onp4SxV4aqm7FMUjb323jU5wv/8S4RoFLrV7WxSKMToqCBIbWlzIo9E3PC+t0RjD+4NDtaNLMLxu/nvtCOZ5u1A/tTGIDEFUIapOKy88iVSEFkaIWpeguMkMN6/Ei+ktGBagEq2EKbSJvFX9N3/gd4yyiwfCPhUi5cnkjWrP3FMh7rH3SrXOHW8ZiO0HG5ZewjnRAHXD0IorGuxpSzhdB1dSOyG8AMTRt8SWwFY1vSrHcVtitzGM/jwWFM7bKgI0YBY6emXjnNjGqcWtJFzsOWVxgaB25DiK3/IXUiRGKbdpUKIc9kDjpNzujvDbfgdw3fGCDnOdzluHBEyzLYU+p+kh2DMz683NG7wFixi/Z7X7/13glLNb4Azk5Nb2CE8iXGmD7ZTigyVgqWI95sdwJBgEAciHSE1XDY3w01BR0G6dLeYN7iEhRCmxk1EdoNennXA40oRGEtgufhItcdJZZVFWPUGofG2MipnyClTg4AzzqteQhaXPrGJzv+xmxf2Ao6vZU8Au4DIYbjhxIvIA5eibmsK3JUkTQ0VP9pKbIr+/Sg6pDig+8PBHKWoRkgTbyTGKO5Pc91x0+uUnE1IF9MNjg/2b1gc2viwSPqcPC4bS9C7O9OQV9QrgqhbKcGLQ+d6QRFaycx0Hp+jogrpuQNot9UFf1GOi4ZikT0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(4744005)(2906002)(478600001)(41300700001)(66446008)(91956017)(66556008)(76116006)(66476007)(66946007)(4326008)(8676002)(64756008)(6486002)(316002)(71200400001)(86362001)(36756003)(31686004)(31696002)(26005)(6506007)(6512007)(110136005)(53546011)(54906003)(82960400001)(38070700005)(38100700002)(2616005)(5660300002)(8936002)(122000001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3ViSTdrUjdsV01iaUlHUFdxZ3ZQbUg3eVUwNEpZbjFWeVhiL0VuQ1ZCb2JY?=
 =?utf-8?B?bmY4RmJTMXJ3ZzhoV2tCVkw4UUtLMllmOXdaVmlkNnVMWkZ4VkN0d05FYTE5?=
 =?utf-8?B?ZGlERDlraWhmbDZvTFFRWU9Na1lnc2QwRFFWemlMckE0Z1V0bEo3TXFwendn?=
 =?utf-8?B?V1JFY1BqclFSbFFoNmhjNmszQ3AvQ085cU9aZjMvOUNEbHNLdk1nZXVWZEF3?=
 =?utf-8?B?bFJUeVBPQTQ3Q3hkRTdPc1J5Z2ZMWUhDeEJxR0o0WDdiR2h0b0s3QlQ3WUwy?=
 =?utf-8?B?ZFV5cUUrUmFPbjk4MEQvRWt6OVEzZGJ5RXhhWmdxRTNVcy9Zc243UWdtOWNw?=
 =?utf-8?B?aDBuQVhPSzBzM2tBb0wvWkdLVTlvOFNZQ0pDUktJeUY3d3NqSjlUcVVXU1JR?=
 =?utf-8?B?VE0zblpGV2dqaVdIdWVGTVdnY3FteHl6SUVjRXFBZ3NzZkdid2dJK2Q2R28z?=
 =?utf-8?B?eUFFeVRmdWZsVXBxNHNYWjcrQ2pROGJMcG1aTi83VnQ3OU5YMmZoREc0MkRL?=
 =?utf-8?B?M1g3YWwyYTZaY3hzKy8wRktjZ0M0RWVtelM5dVJqQkNwMVZOWndIN1U3UzVs?=
 =?utf-8?B?bW11anRrYnpIZVVHNjdVMW9jeitWdVlydW14azNPYkYvSkFiWVV1aVhoL0hM?=
 =?utf-8?B?cldFNHJKdTNSUEVMZGMzTW9zYmVpaGE3Nk5RUFlKak5ETlR2K2wveVFNZlZn?=
 =?utf-8?B?ZVRZS1N0aVVveHM1NUdIVHFNVDF5RFhRSFFSdUxGcXRCNnRBcUlOQjZlSVdT?=
 =?utf-8?B?elpNUXZLRGtEZTJqS2NqYXRFL29tNUhtK3dwdmQ5YkpDVVV0ZDQzRHhTZ0JN?=
 =?utf-8?B?dTBQMVZENFVpR0VoWHFZd09KUDczTDBBWVdXQ3dMQjk1SkxPTC9EaG40UEFZ?=
 =?utf-8?B?RHJTT1lJS05OYmJZMjhrcFZTOVdXSU1nTE1GdGpJTXlPbnZhK2lBNUI2N25t?=
 =?utf-8?B?UkNlNVZMUFAwZTg4Y2VoM0JtdG1IckxlWFFsSExPODRyOEZiRkhsQk9KdnFD?=
 =?utf-8?B?THBVVG54YkdINlY1aG0zcHlOQUhSNXN3R0FuekVBbkczMVNrclRzQ1ozOUc2?=
 =?utf-8?B?S1lDTzhQTjFGc3JDWERFS1BBTk9KSGxWNzE3RndmeHM3M3FPSDBnRkwzUnJo?=
 =?utf-8?B?UkVabFlLZDIzajMvL1djYzFyd0RiczN4cTlVWE53ajM4Ynh1a2oyZlYzT2lB?=
 =?utf-8?B?MzZTbk5CV3pDWWRZV0pNV2hJSjZWZ2xEd29iQi9Ka0JhWmdKcmE5WFlIajY2?=
 =?utf-8?B?WXpkNWExaHMxNmU2YTlvN0srNU5XN0MxSjQ2L29SVlZWVWpHY0xlY2Q0UmR2?=
 =?utf-8?B?a3hZdHBFVmNsM1dSdEJuM21ObXNiVkt1a0ZsdUhEa1lCM01HS05xNWhZMFI0?=
 =?utf-8?B?aC96ek1PeUdJeHNLRjZwTUtqZU9tT3Yrek9xSGRCS20vT3gwTmh0bjVITDRp?=
 =?utf-8?B?NWdZaVd1UjdPVHEyeUM4R3FXWFlsUUtkUGlkRGx3c0xMclB5K3pRN1J1N29W?=
 =?utf-8?B?c1VibWQySHN1VFRSS1pnTnRaRUZzRnRhUG0vd3FZektCRTkrRXFuS0NxMVV1?=
 =?utf-8?B?NkhuQjdyc3J5R21qcWRuRlRKWHUwQ0tiNFJ3WFpkSFBodlNMcFFITDYzc0pQ?=
 =?utf-8?B?UkdVUzdYT0hCSFhLa2J2VzFkVlR5bldNK2lnTUhDU3A4WnlOMXhZV0pNQXdv?=
 =?utf-8?B?U3BYMGpLZXR0RFlPR1NHRnZ3Z1NZNzdVVytxejEwOGFjVkZ5SU5mL2JkYjJp?=
 =?utf-8?B?a1AvN1A0d0lPV2FNdkJLSzFLcjNsckw3bE1CQ1dVRlpSS3Q2MUt4Uy83cEpr?=
 =?utf-8?B?R1VWR2JDU3p3NEUxcjhRZGs3ZW1JQlkzNk5pcFFxbjBVZnpkM2JqS09CYlo0?=
 =?utf-8?B?RkFCOHI0eVZndmRHdWZJK1ZzQWFxZko3SE9Odyt0T3VYRGIrdXFsUW9iUnFi?=
 =?utf-8?B?T3VBWmdqSUpPaFBJcGJyU0VvdHFYZWZ5RW9PSTBKWlEyY1pLWk4weElIZUtG?=
 =?utf-8?B?ak5PUkpRSlRDQzZ0SUFVazlxWVN3bnBTUXBKY1d0UTlCMitSU2grbnBjQTd4?=
 =?utf-8?B?K2FTUjdiZFFRNmxTOWlrM0FsVzlpZzlUSzJKdWJlc1FSeHJDM3lKdi91T0JD?=
 =?utf-8?Q?+MziDpaXKmvYB5b/la9pVRk0f?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C09B7328CBECA44ADA98B92769CBD49@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UiuRzSg2wTWfUBorBp1bFDpxA4a9vkB9bSEWwcBDR03f31iNDBX/gK7vWYtnLGBb7aGsSEqtI+8amKlSKsMcHmf+7tWHo6Fo4+ND4udSnGkTP4CIWvmKKkNBppCqxaU1SHY+EwUOmLBoNnO1EWRGCiu4kahllGJz+hoGAR+VQDp2V8xUosP87oRjRtARAz07MoqfO9x45mRsbLRwKwsW4bFTh3aIQCijO6hXgFsfA8g/YN3bbJ2EDDxRaT6J1lO76vO7hMWf7DkqoX0vopB4yh/voXZiYQLoBS7A0/W2MYpKnpNpI5P/KZb97nKmxgyRJS7q4A9VqustRVfKAjMWGTMEvJre1Dy6agyWTenphz9H0fUjNr/98igPJVyVjvwMN+EdhQjdmrwcpEUNnF7DDlFAP+eATOzzkww0GmKYiVXTucCxmJ7PvUANqOy+V4H652wG0bKi87jRt3x+9Q3y6lBS/7vUCATMDtpCdHjOgQ8Cnr8dYgneIs1X61/goHBTTGvSclsawCHlvkI5OmxWTSN+7l+8ZBIeF5b5YjYei2K2xwJNbuPXbuY/sDwfoynadYQaq4Y0zrZtDfjS/NdNjdpMldcoM64/usmnaNCN18Aq1ZmiQDwKc7/XkNpG1KRJ+5MZGqVTKJAvLAPcOuhWUqx4FzRkpfB3rnoX52yCS1otDy2gfHt1quPd7xv9VUXiPjjSIS+mK2ogsJvDCFh0at0M0rVpDQhf1lf7dKSKSySEDq0TQhWxboYVmqSyGbwrz9w4yyAI/79A2Auue899bEeUDwi9ObxJlAaIPM4r0RROlGcJsxc0NvTqrh1ta0jyo1AoXWg2IVFw+LdR2fNVdgqood8yuGb0VAzYV4liqMxDmud6N21KxoiHmYZ14d22znZ2HXe1arYkFzk6lqe0Y7SoCHpjLtRkhW/gBQzK7vc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3396b671-bd0c-499b-81e3-08da8064e8bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 15:26:51.5721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9yqTHPXGJtWEBOn04rIPEzsZdIgFYfrxJPvYx85esu2Xhg+PsACpVEliIeu+lNWULXJD66LKNSIz79mSvSqipB1mVr8XWrama4MuDy2Jtpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5334

T24gMTcvMDgvMjAyMiAxNjoyMSwgQW50aG9ueSBQZXJhcmQgd3JvdGU6DQo+IFdoaWxlIHdlIGFs
cmVhZHkgaGF2ZSAiLS1uby1wcmludC1kaXJlY3RvcnkiIGFkZGVkIHRvIHRoZSBtYWtlIGZsYWdz
DQo+IGluIHNvbWUgY2FzZXMsIHRoZXJlJ3Mgb25lIGNhc2Ugd2hlcmUgdGhlIGZsYWdzIGlzIG1p
c3NpbmcsIHdoZW4gZG9pbmcNCj4gYW4gb3V0LW9mLXRyZWUgYnVpbGQgd2l0aCBPPSwgZS5nLg0K
PiAgICAgY2QgeGVuOyBtYWtlIE89YnVpbGQNCj4NCj4gV2l0aG91dCBpdCwgd2UganVzdCBoYXZl
IGxvYWRzIG9mICJFbnRlcmluZyBkaXJlY3RvcnkiIGFuZCAiTGVhdmluZw0KPiBkaXJlY3Rvcnki
IHdpdGggdGhlIHNhbWUgZGlyZWN0b3J5Lg0KPg0KPiBUaGUgY29tbWVudCBhbmQgbG9jYXRpb24g
aW4gdGhlIE1ha2VmaWxlIGFyZSBjb3BpZWQgZnJvbSBMaW51eC4NCj4NCj4gUmVwb3J0ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

