Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB7558043A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 20:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374758.606932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG3E9-00037N-Gd; Mon, 25 Jul 2022 18:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374758.606932; Mon, 25 Jul 2022 18:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG3E9-00034B-Du; Mon, 25 Jul 2022 18:54:49 +0000
Received: by outflank-mailman (input) for mailman id 374758;
 Mon, 25 Jul 2022 18:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htba=X6=citrix.com=prvs=198305c53=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oG3E6-00033z-Nz
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 18:54:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dfbb307-0c4b-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 20:54:44 +0200 (CEST)
Received: from mail-sn1anam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2022 14:54:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5764.namprd03.prod.outlook.com (2603:10b6:303:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 18:54:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 18:54:38 +0000
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
X-Inumbo-ID: 3dfbb307-0c4b-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658775284;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KT3b4QFAbJb7FmbVNKQ73N98HuLURsXs+2Cu0eGeDJQ=;
  b=ChkT2YzFsh2/wwCpIvO53iXpJ/S8hFnHmeTPYc0/Ek8jgkzEq/+fYxGZ
   CSr0GPCHyh8RMYbJWiOPHFITckh0ypaDw3rFgX1d/qLsTBNM6nfL3F8t0
   TllINUVcXOJU6iXMppaLZivoYWqJvWebH5AMa9czXzNBp6CsXT14hgbUl
   s=;
X-IronPort-RemoteIP: 104.47.57.42
X-IronPort-MID: 77019704
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UhCDeKJLwCxiQ+NyFE+RDZQlxSXFcZb7ZxGr2PjKsXjdYENS1mAFz
 mtMC2nVP/2Majf3KYtzbN+/8hkPsMTQm4RmGlZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/3Z9Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE+tg1F1EIYrEiyP9aXj8U7
 uZHGBlVcUXW7w626OrTpuhEoO0GdJOuB6VG/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H12T+jKVW0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4PHkGvaqi7EaunnpTreQKAYN5yCrL1pnVDO5mA3GQ9GfA7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQoy
 1uIktXBFTFp9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbkRbnXttlVqmvgbXdGTb2z
 CGarSEWjrAan8kNka68+Dj6bymEo5HISksu4FzeWGugtll9fNT9O9bu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yXLkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:2rev/65J4NJAf+19sAPXwUKBI+orL9Y04lQ7vn2ZFiY5A6qlfp
 GV9oV96farsl1hPE3IwerwTZVohEmsvKKc4eEqTMqftXrdyR+VxeBZnOnfKljbdxEWmdQtpJ
 uIH5IOc+EYSGIK//oSgzPIUurIouP3gJxA7N22pxgCPGIaDtAYnn9E5x6gcnGeBjM2dqbRfK
 Dso/avzADQBUj/G/7LeEXtKNKz2OEj+qiWGyIuNloM7gSDsC2vrJr3CQKR0Bs/flp0sPQf2F
 mAuQr16pi8tcihzBXRzXXe4v1t6ZncI+94dYixY4UuW2/RYsnBXvUuZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQnQrHvxXZqGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KSoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vF2LA
 BXNrCP2B9qSyLFU5mZhBgx/DWUZAVuIv5SeDlShiSXuwIm1kyRgXFohL1Lop/HnKhNDKWsrN
 60RZiAr4s+BvP/t8pGdb48qPuMeyrwqFr3QRSvyHTcZfk60iH22sXKCENc3pDkRHT+pKFC1K
 gpFmko6FLaU3ieQvGz4A==
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="77019704"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvSNpDXjK2iSH8bc/y4LHiHMzu5/XIYpU2UMpgGrt0hP1RJt3jp/E3QuHhN988jGCWyjiDrkboyv4YcxB9K1dRp4CHwjRp6qT9vfMqL/LirmJMDoTy3aiF7p6vst//zkjxWiwYvYATmN4bxmIqkNKxXAsXqpUzzQ+syR8uXdTvmhFN8kG+skQoBkpfIIKzGNGJgViR9tkJ1lQiXYOZoU3nAdjPC0/Ty+nIA7AsOqFv1tzxmBeD3tKGc/uDLE6V3566uSWRMpHbtDdOmrTQ4cfQyDGHDRDwe27fATZE+sMLyXxcCnTA1hauvsgub6QVCQBCwIvqQY7gzkeLYjgIYayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT3b4QFAbJb7FmbVNKQ73N98HuLURsXs+2Cu0eGeDJQ=;
 b=mp8dscp/VkO6LM2Qpei9WM1cbUK3Ftqxf3bL9jgt0+K9Xd50UIZULzdcCYfgjd7lOgBrHayF8NGu48Vljae2T9PpQ/a0xz26M5YD+hxFfL8xRIvzEAQlvO6ANlskILOTNmnBule51Y5teybqNZTvbRB2ILkafGFE4yxDPqDFVEY1CZG019Y65FmGDfizfuiPNHpuBdqDqW67m5oIyAn5yf23m4vcRZEqbp/yP+q72VUZ9aVjYZlObyOntjvCuFQSKgdmQQOcPW0/vqgRKVakH0fO/EBJdQ/FqiinSDKa6tFbW/DOI48M7n7FRI2fVVKfiF9IiyEf7EhZrBDjedCsqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT3b4QFAbJb7FmbVNKQ73N98HuLURsXs+2Cu0eGeDJQ=;
 b=c2AX+Q36xL11W7/zQLY9qr6pYU94e97sYOg5FnIcjF5n6hcs39iSKQH+7IFtXmSKCnC/un+WoR613Q+TZrCKRjqN4gPyvT1tsrjmS2vv7qJ4dS7PqzLBR0ILxBc04CyxvNHMgyFPRalwXupIfJsADQDpp7efAsbIN1vesqhzK0o=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Xia,
 Hongyan" <hongyxia@amazon.com>
Subject: Re: [PATCH] page-alloc: fix initialization of cross-node regions
Thread-Topic: [PATCH] page-alloc: fix initialization of cross-node regions
Thread-Index: AQHYoCf56rW3CCsK5U6FSVvXkA9srq2Pb6mA
Date: Mon, 25 Jul 2022 18:54:37 +0000
Message-ID: <1f43b3a1-a580-d1a7-c52e-06ba591ae3a0@citrix.com>
References: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
In-Reply-To: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bc9ab57-ff0d-41d1-2e4d-08da6e6f1fc5
x-ms-traffictypediagnostic: CO1PR03MB5764:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SANUet+oLoixi7OUKjwVKAoH0cIEW+PA/dCsKGeBJF1kUP5DOlFqF+WQ6hqVFgHZxMeoYYCgaYA+6og927Szvg1E8MvHdWG1Ffucl8UGCGNwOarEwVK9uUm/lNwFjBAkBvXbEgVSvqNpEPXdH4xQ/zj0rnYZh/Nzfrs28oygt5of3dtcrRnazOhZ4gAV4tf0emR8Y1gaoSCq9oY2Mosc4t2Gghu8jdI6J+V/nplxJ5+7dcR7BF5MOBBsOI0QBdZAyFhpJN7/SWBmXOBSStECzCBmWNA3YK9N/Br9wjOEsDe6b3n9qilXMvl5HiVft6ahxFFm6gLcSdCDO+ZQ+4tLBdLwWre8NMeA/Tyow3ZRVnAdCRIUc8XKtlrzTGXDxMRu7kh8KWuOhaJfjNn511eqBHtsvEuyNEldWfkreawZ/Gfgb5SvI1CcKDlcQS2X4bcIRFedQpLuyqNj04ZpjP4Y2/bH036e52zUfRG9ilqRwHbuJozkzdSQFW34IHOmpP1pwzng4+AH24W9p79CcVM4hX2us86X11xQ0bmiaTIJHbykmEv9tDsuPEvTRTSLx7uYriORSdHNbZwt6mPRYAPE/CwTSUHtytv0GzgWG/isMHjFBA7DqfK4DLAy8h2mvJHrqlA3zzRISjSm9NfUgydIYvtpMauavOd9tE6SX9wTTcwpWb429dkHcLmNCTCgZTa7ScURH7Q8rzdmeIvBTJHUCYMjMy4VzQ7WiP5V3hVylpR7WlM5RTqM9etkHgBamCZpNpxAfuoKCmqFrB6SOeCtpamY5O2/D8gtqQ9/Hk7kFd+ISTDUXy5n3tx+weDH9i3u4S9fumc7zI19H1T3c70s9/Uf4L+hkGCSinuOVz874z7CV6hiVY74imeL7z8iDXRA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(110136005)(54906003)(316002)(71200400001)(478600001)(6486002)(41300700001)(2906002)(53546011)(76116006)(91956017)(4326008)(66556008)(64756008)(66446008)(66476007)(66946007)(8676002)(5660300002)(82960400001)(31696002)(86362001)(8936002)(31686004)(186003)(38100700002)(2616005)(38070700005)(26005)(36756003)(6506007)(83380400001)(6512007)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RldkQVNzYTRaRTRORHZuMHFBYkt6cEZNR3FoU3NZeVJnbzJJTEVGMTdzWEc3?=
 =?utf-8?B?TjVZR2QwRmJBS2xWVUQ5MWZOSXQwazQ0aTVCSDVSYkFKWnFoMzFkUWsyWnJE?=
 =?utf-8?B?SmE5TSttcUhXNjJCZC9PUVFJNndveHhMemtpRVdaaDZ3cmhRc1k2MVZER3oz?=
 =?utf-8?B?QmtLRy9rbHJwV2pLSFlaSzhZYUpsQ2JlSzZQTC9TR1ROZnQvRkdVMXNqK3VX?=
 =?utf-8?B?cWxjMSt1NDdBMmZuVFJaMUsxNU9HRERiUWxVSTQxTmJ1cUhTSmE3cmxWMVNl?=
 =?utf-8?B?TkE2eElQbGZoVXpHTlZnK0pwT1dtTGkrOThjNTVTOXMzTWxWR2RaSUtraEJM?=
 =?utf-8?B?bHkyZGVkWkFNQnhQQ05ZU25XeCsyblk4YmxyR1RuU2d5U0xScWRkU1o4WVJy?=
 =?utf-8?B?NjVaSDlSQ2R4QmdvaDE0Y2xNb3NPSG1QdjAvQ3UzT2QyVUN6L1hCaElCNUZZ?=
 =?utf-8?B?YWM2R2hkN1lkOWttSThtb3NEc21yL25KcU03V3Y3S2VuUzBGVkpRSFJnUzkx?=
 =?utf-8?B?b1k4dnBpSGtmZzlUMEdaODBpajBiTUJsMEF1cWlvajRpNzJjZlBFcEQ3UHg0?=
 =?utf-8?B?cnlsL0JnRUsvUGxvdEJwdnZlWWpRU0dORlRkZk1OWmZ0VGp3YUFCcnc3RVBU?=
 =?utf-8?B?WTFycjZlemN0aU9hdzFsTUtHN2NTRWU0TjFHMExXTjh0L3puSnBZWnJuNDFu?=
 =?utf-8?B?WHdrYjU3YkpsL3E3TGY5K2pqYlhnQWxSd3FwNzdDNHFyd08yb2M5VTlkRkEx?=
 =?utf-8?B?dy9WQ1Y1MGZBa0dZaWRIL0tZZndaUGljR2gxYjU1NTY3SzMyb2NVYVpiQmdq?=
 =?utf-8?B?RWpQR1I3RDlNdjZrTlJaR1FMZUdyL25jVGc2NjFIL2RNMnh3MUpiQlNIVmZB?=
 =?utf-8?B?czZkR2UvMkZTTTdvdmZTSGpRSU5QNzRJODJQMElmRURGOFllaVU0cmtYV3JT?=
 =?utf-8?B?UTNhaFBnUURJRUZGeDU2eVhuUWxuNlg2dE5tc2tPK09oVE55ZnlzNnQvQ1BU?=
 =?utf-8?B?eE04OGVya1VNMHh5UTBHWGdxQlZDYmttK21TRkszenQzTXZlVXlMSWgzTDdX?=
 =?utf-8?B?L1BESmlrNHhlRGtNaXAxUWNndEVQWkxnbEE5ZmdsaDBKSHdNYXloWDg5TERP?=
 =?utf-8?B?NWhGMjRIb2d5WXlDUk9obVFiM01ac003VU5CYlNTeGxTVkNUcVcyVHdETC9m?=
 =?utf-8?B?aG5aSnoway8vQU9KMVRrZ0tHWmZMMy8zTkZNTFhwNnByRjExajZ0Z09neW50?=
 =?utf-8?B?aVVOVHlvTDhiWUY3M2JhOVNic2YvdkJ5ejgzaHI4MGtVeEtDSjVSQjVSU0or?=
 =?utf-8?B?Zk5yVlk2Y2ZlME5FNGg2bWpzZTJOcVVFSE5LL2pCK2xRNWgxeE9Nd0hKM3BP?=
 =?utf-8?B?bXE1UXdCb0VIMDF0UGRiODBTOUNqMkVWdEhQaGkrRUhya2hWRGNNZUFFUHFu?=
 =?utf-8?B?RWpWWDVQYmFqUlNHQlNtbEpPWDgvZkcrbHEwUVp4VXlhRHpERVZiQkdCdlM2?=
 =?utf-8?B?Y2cxSk1Ua0YvVWdVbVN0YkV0eFhlSGNhc0NnS2IxRTVrZkpNaWxseG9Ka0Rv?=
 =?utf-8?B?K1Bob2tYaWkvSUJPNGNWKzBGdmw3M0x4d1VoL1R4UU9nTnlYSStLK25CSG9r?=
 =?utf-8?B?TGx3Z3ROejk1SjNOeEdkZHB5S2lCV3E1bWVnSXo4YnFtekpoRklZUlY0K3Ny?=
 =?utf-8?B?b2tqRmRyaTYvd1EvUndTaFFFQzBJNm5aQXVta0hSdkFyYWN2TzhIcEhZWCtq?=
 =?utf-8?B?R3gydjhRWG5uL1hqaHFPekVmOXVrU2c3UThDdDIzZjNvVFNzMUwwYkFRdThh?=
 =?utf-8?B?QnlaSjlDV0gwMHVvdi9oTE5iWkZmWWJlQ3JoTGxOL1FDbzlGWEMxL3BxY0F2?=
 =?utf-8?B?YUZmeWNTV1pUZWo1NjU2akIvWjVlNFBjQ09lOW9hY05PQWpQZFVnMjNFczFE?=
 =?utf-8?B?RXRvblMxeUJyQnlnMHQwenJHekhMMCt1aXprMFRmUm9ZaFhKNnY3bTZxUzhl?=
 =?utf-8?B?bTZ3K2d0UEZkT2lpUzJ1Sk5tVXh4Qy9CbGRNdUtxdXp2cVZhWkx2MDdockxq?=
 =?utf-8?B?ZnBvbUJ6NlBJZzRKKzBLZVJ5SzRoVXlOaHZQUVloN2s5Y2w1UzAxV2tPMkpT?=
 =?utf-8?Q?3uSkATCtZn7abNLtWp9Fos41k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BBFC74553B0E548AA5810253414F394@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc9ab57-ff0d-41d1-2e4d-08da6e6f1fc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 18:54:37.9319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQLsWQgExOnQFf3yf9hFG0qwNLBLPKYk81PCH+XN0jnRIu28oIO6QTZvjyDt8tdBjz5HPX8m6XCbx1YyAhGjlDFLy5VxObNlZFRjwGK/OYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5764

T24gMjUvMDcvMjAyMiAxNDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFF1aXRlIG9idmlvdXNs
eSB0byBkZXRlcm1pbmUgdGhlIHNwbGl0IGNvbmRpdGlvbiBzdWNjZXNzaXZlIHBhZ2VzJw0KPiBh
dHRyaWJ1dGVzIG5lZWQgdG8gYmUgZXZhbHVhdGVkLCBub3QgYWx3YXlzIHRob3NlIG9mIHRoZSBp
bml0aWFsIHBhZ2UuDQo+DQo+IEZpeGVzOiA3MmIwMmJjNzViNDcgKCJ4ZW4vaGVhcDogcGFzcyBv
cmRlciB0byBmcmVlX2hlYXBfcGFnZXMoKSBpbiBoZWFwIGluaXQiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBQYXJ0IG9mIHRoZSBw
cm9ibGVtIHdhcyBhbHJlYWR5IGludHJvZHVjZWQgaW4gMjRhNTMwNjBiZDM3ICgieGVuL2hlYXA6
DQo+IFNwbGl0IGluaXRfaGVhcF9wYWdlcygpIGluIHR3byIpLCBidXQgdGhlcmUgaXQgd2FzIHN0
aWxsIGJlbmlnbi4NCg0KVGhpcyBhbHNvIGZpeGVzIHRoZSBjcmFzaCB0aGF0IFhlblJUIGZvdW5k
IG9uIGxvYWRzIG9mIGhhcmR3YXJlLCB3aGljaA0KbG9va3Mgc29tZXRoaW5nIGxpa2U6DQoNCihY
RU4pIE5VTUE6IEFsbG9jYXRlZCBtZW1ub2RlbWFwIGZyb20gMTA1YmM4MTAwMCAtIDEwNWJjOTIw
MDANCihYRU4pIE5VTUE6IFVzaW5nIDggZm9yIHRoZSBoYXNoIHNoaWZ0Lg0KKFhFTikgRWFybHkg
ZmF0YWwgcGFnZSBmYXVsdCBhdCBlMDA4OmZmZmY4MmQwNDAyMmFlMWUNCihjcjI9MDAwMDAwMDAw
MDAwMDBiOCwgZWM9MDAwMikNCihYRU4pIC0tLS1bIFhlbi00LjE3LjDCoCB4ODZfNjTCoCBkZWJ1
Zz15wqAgTm90IHRhaW50ZWQgXS0tLS0NCihYRU4pIENQVTrCoMKgwqAgMA0KKFhFTikgUklQOsKg
wqDCoCBlMDA4Ols8ZmZmZjgyZDA0MDIyYWUxZT5dDQpjb21tb24vcGFnZV9hbGxvYy5jI2ZyZWVf
aGVhcF9wYWdlcysweDJkZC8weDg1MA0KLi4uDQooWEVOKSBYZW4gY2FsbCB0cmFjZToNCihYRU4p
wqDCoMKgIFs8ZmZmZjgyZDA0MDIyYWUxZT5dIFINCmNvbW1vbi9wYWdlX2FsbG9jLmMjZnJlZV9o
ZWFwX3BhZ2VzKzB4MmRkLzB4ODUwDQooWEVOKcKgwqDCoCBbPGZmZmY4MmQwNDAyMmRkNjQ+XSBG
DQpjb21tb24vcGFnZV9hbGxvYy5jI2luaXRfaGVhcF9wYWdlcysweDU1Zi8weDcyMA0KKFhFTinC
oMKgwqAgWzxmZmZmODJkMDQwNDE1MjM0Pl0gRiBlbmRfYm9vdF9hbGxvY2F0b3IrMHgxODcvMHgx
ZTcNCihYRU4pwqDCoMKgIFs8ZmZmZjgyZDA0MDQ1MjMzNz5dIEYgX19zdGFydF94ZW4rMHgxYTA2
LzB4Mjc3OQ0KKFhFTinCoMKgwqAgWzxmZmZmODJkMDQwMjA0MzQ0Pl0gRiBfX2hpZ2hfc3RhcnQr
MHg5NC8weGEwDQoNCkRlYnVnZ2luZyBzaG93cyB0aGF0IGl0J3MgYWx3YXlzIGEgYmxvY2sgd2hp
Y2ggY3Jvc3NlcyBub2RlIDAgYW5kIDEsDQp3aGVyZSBhdmFpbFsxXSBoYXMgeWV0IHRvIGJlIGlu
aXRpYWxpc2VkLg0KDQpXaGF0IEknbSBjb25mdXNlZCBieSBpcyBob3cgdGhpcyBtYW5hZ2VzIHRv
IG1hbmlmZXN0IGJyb2tlbiBzd2lvdGxiDQppc3N1ZXMgd2l0aG91dCBYZW4gY3Jhc2hpbmcuDQoN
Cn5BbmRyZXcNCg==

