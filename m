Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F2597029
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 15:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388947.625731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJRb-00016k-66; Wed, 17 Aug 2022 13:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388947.625731; Wed, 17 Aug 2022 13:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOJRb-00014v-20; Wed, 17 Aug 2022 13:50:51 +0000
Received: by outflank-mailman (input) for mailman id 388947;
 Wed, 17 Aug 2022 13:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctqM=YV=citrix.com=prvs=221f02cfb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oOJRZ-0008A6-F6
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 13:50:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97bacb96-1e33-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 15:50:47 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2022 09:50:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Wed, 17 Aug
 2022 13:50:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 13:50:41 +0000
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
X-Inumbo-ID: 97bacb96-1e33-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660744247;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jTWIdfi6cz6Huq7A7IdamjtXWNLQ/xmuyRW7itJsDvo=;
  b=F0zGRy+tNvlY5qwTCpu/nqhOwy/KMjzpdb7vuLfNohxt4pLD31TAmjKP
   r2junP0aFlp5YmpsVf2dxp4hVSwmVOQpOujS35nCYIcKoY9Qra5Lz1GKn
   DV9ouJNVvatOC1uoLp+zLYSRNFHaFQv6YvJpTS3qt7gAF5w0KHY5+xrtt
   o=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 78734529
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ECdmqKKxaBrFyzKjFE+RLpQlxSXFcZb7ZxGr2PjKsXjdYENS0GEFn
 WQcXWyGa/qNZGejf9hwPNy1/E4PuJOEzoNlSlBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La90s21BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEmvw3E0EsZ6Ai4cl9HDpEp
 MY/EjERYUXW7w626OrTpuhEoO0GdZCuFqVP/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11j+mLW0wRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPPlmHZryj97gPJtQzxArpNHpnpz9VvnUKsxVZNBg03CGLu9JFVjWb7AbqzM
 Xc86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQC1
 EKNnt7vLSxitvuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bpg3LZsZuFuiylNKdMTv92
 SyQpS4ywbAal9cW1r6T9ErCxTmro/DhcAkx4QnGW3O/2SlwboWleo+A5EDS6LBLK4Pxc7Wal
 H0Nmszb5uZeC5iIzXWJWL9UQuHv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:/f6jlaycTIpORYRqglLcKrPxaegkLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBbpTnhAsO9qADnhONICOgqTP+ftWzd2VdAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOQ+EYb2IK9PoSiTPQe71MoKjlzEnrv5an854Hd3AtV0gU1XYfNu/tKDwTeOApP+tdKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H6VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5d+7Y23+4cowwfX+0eVjbdaKv2/VfcO0aKSAWMR4Z
 fxStEbToZOAj3qDySISFDWqnXdOX4VmgDfIBmj8DHeiP28fSk9DcVZg4Jfb1/212oM1esMlJ
 5j7iahrJxQAgrHnCPho/7ydz8vuHaVjBMZ4KkuZwU2a/pHVFc2xbZvpX+8Nv87bXjHAUQcYb
 JTJdCZ6/BMfVyAaXfF+mFp3dy3R3w2WgyLW04Yp6Wuok9rdV1Cvj4lLfYk7wM93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXeD3cZeg6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdsWIpYUrhBcCHwZUO+BHQR2e2Wyjr16hllu5Ek6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2I55SC++LFxqdJW+I5XyMZ3B/EwhubCROgKdEZ7unmLO6FrHX
X-IronPort-AV: E=Sophos;i="5.93,243,1654574400"; 
   d="scan'208";a="78734529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glg+9f9PWoKBDrXBgdC9/zVmlONe8jW/iZ8286eQ1GmDvfe7tPSmalsdDlqEZjOipi92xtPrilQwTxWugOKdq6Idj1nLLLvbWwn32inn1t4LGYAAJe8/P5LqVfFYcNdZoSEtVELjsmSCFs7s5ujRPZq3IeUlQ/UTkpf+cnzcel2ksecCat9MsxI6q4kepg0HkMJ6sRyrJKpc6Oe6Xuz5FHVWKgd13xsjyeGYGgODHbFEA5dEAxoDRMYiqvSdNgB0wrVPF8wTm+CYLoYvW7CMSJaIxo3ra2D5l5PGR6dKPW4bPzm3bHFcmrqmNujhM4Hmw5Ct336W0dn/8RrWP1nMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTWIdfi6cz6Huq7A7IdamjtXWNLQ/xmuyRW7itJsDvo=;
 b=eB5sT1wDopMzIeMWtWh1He/cJZoJYtEHHWe7jgOuMH3Ouvlhe8jDpD6v/3lH0T2fqhkO4R6/RqHHMa0Zapjj9UUtVqHmZw84zipYw/nwz68oHx5OPfSIemRYCadhuSVTPgUymZaqdtkj1sl2JZgk0gB2CgEuAP/oN0VV4OLFqVUb7Yyzsu5WcpfGFP/sy0xSKCUEZQ1tZaZHzDcJqE+NAxxRK3JItsbwi9jLY5y0KI1i6vSGISqyj2jDuFLlkUDzRmsKDCYq60cz0l3r43vLHX5QYCSTRGki1s1x8FBPBeQd8wtV8JU8eb3GvoLre2JoXmF4USRMLL+5l/stICLwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTWIdfi6cz6Huq7A7IdamjtXWNLQ/xmuyRW7itJsDvo=;
 b=XOTqJv1QP3a2/MQOegni8vUYQuOxc4SsBxSXYwENEBGak4MLvKs4A6pg0E4qQg2STb2WmyqNVULY1LLE0plksfIwDt5FxAnheBKVsCjrj+Sodxx1rXZw1/9AIcc2vLvYu8L0xYSlYcYjBGrfVGgsMnKuwWvBy/0blZwvIcFKlC0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Thread-Topic: [XEN PATCH v2] build: Fix x86 out-of-tree build without EFI
Thread-Index: AQHYshn1FitJ6Hl8lUq9G/d15az/a62y7WeAgAAvEoA=
Date: Wed, 17 Aug 2022 13:50:41 +0000
Message-ID: <9cb0a2ea-b998-23fa-f338-94786cbcacf5@citrix.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <20220817091540.18949-1-anthony.perard@citrix.com>
 <7f7479d5-71e4-5005-d37b-8d702fd5d871@citrix.com>
In-Reply-To: <7f7479d5-71e4-5005-d37b-8d702fd5d871@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f74b7836-2cc4-4b4e-7c58-08da8057797c
x-ms-traffictypediagnostic: CH2PR03MB5223:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qdtADPLqb+t0Lv8+SNBKVBcEZb2ISBo8UEdBL3Xx4buEEuewQwGcxbx/AtfYRQX2JmoWDg399U3B0j9J2oiIIHYBr9mCjRDH+NDCRl57KwyhgcLnXDGSgqXbfXaAKqUdOs0agd5/6s32T9zrDe4O+eqqxiUDUzzJT3TZHDVHIgYUydR0CdHCu/Ly1Qt0a/tG3ClgI4C1MYzJOYUgZlmGMGpDzNq6EqjMq46KzUbQ3oauMQestmmWBClzq/+u44Wm5OA/8XoKnQ+VwxujoCbzpUo6bBkB2gplfgO1UNDuthsvRO1nVTOnRqOCf6DkCiAR41tjpws6iwqwGM/j1PQPsCpnIj5giFscbZQs/vABJyhdHiXimLch/M9F5TauDETVRpPaW4PKsCd7p+dEUwIZIx00g/fwheLuRN+kLd0B6pTBEcfTtEbRRgnQEWlggibs/2usz2Ax06KCYfLDdH02+Cf0of3tWmZsoNWJGBovVenFNHX2PgcUPNjxD9JF/8nTy0AdPU6gZtAhdTV7h0VAMHNAkK3K6CqaLfq8t+2kSm/41WsbpWMFydERe0ja1g4pNtbyrcCvtTa6/DSjBgzgcZiwIGnlI7rioLg45LWR2s1D6pkBOr6ePqqvO+037vJxyUYbiOu5agkOe3iw5qW303yxWOaJD0ErsQmCy/zHgm4nSsmkC6jcs4xS290MudyMqSSFmiNaCPaYYSmZLgR82B7wCJ5VyLrhOi38Nb8xT+p6iO1dPA5gmbgYLwfVjicmmyUPGEJ29KT3kbJDXvgoRgRa/m3cvMIMBwyUiVYiv8ip8E+8ccenYgqkzaVIzjWauREPFSIijBkSbEeYgE+2D0bVM4Ti8qxp9Pkr5PYndzNBzN0s7BE+P9W14b2A977f
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(6512007)(26005)(38100700002)(107886003)(2906002)(53546011)(6506007)(186003)(83380400001)(122000001)(2616005)(82960400001)(4326008)(8676002)(64756008)(66446008)(66476007)(31686004)(66556008)(71200400001)(66946007)(76116006)(91956017)(478600001)(36756003)(6486002)(54906003)(110136005)(316002)(31696002)(5660300002)(38070700005)(86362001)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVFCM0VYYnRLZDM2YzVyNEtyeVpmbUJ5QVlaVHRpdEtUQzcyelI0TW8xS2Rk?=
 =?utf-8?B?M3FUR2VoVDB6UXU1ZC9adkFDcnZKSURrcVpqV0FEYWhuLzRVWm9GSk9NSG1I?=
 =?utf-8?B?RWd2WCtvbGpudks2YzhvU2V1L3JRbGF3NmRvU1NvZisxcmJ4Zks1TnI4d1Jl?=
 =?utf-8?B?b0xEdEtqYnMwRWdzUGE4Q2tXUEN1WXBreGg4anNoc2dBMTRPdUN3UDBaOFhL?=
 =?utf-8?B?VHVMQlFjaitNWWw0VVpWanMvVCtkaC8xN2lwWkpCVGxaa3lvU0pDRmpYOTRI?=
 =?utf-8?B?dGpwM1FjQ0lCbG42KzJnbE5ra3pWWU4wUHljSXl4Y2RZcy9VQ3hDUUlNUTBk?=
 =?utf-8?B?anVCb1pPTU10WE1RNFZEbFh5bDdJQlhuUUVuMklMYUFFb0hqY0JFV3pzdG5I?=
 =?utf-8?B?NWlFaDFzVjZ6K3NUNWZoSjlsZ1FQaEd5OE9GWGdGVTl1MFhYeGRtd2x3bFFh?=
 =?utf-8?B?bnNrN1RUMkcrVTJ0c3htNE9lZkdxTDR1UHhpVmFzbUREYmR6QUFsTEc4U0tp?=
 =?utf-8?B?QjZnVXVrOFFjcGVvdUdNeGJRZDA1bCttdGhUNWUzTCt5L2txSkxLYWdyUWlk?=
 =?utf-8?B?cDVIUG9PajdOV1dXU3A4Q3BGMHVQb1FEZkxhaEpuL1p3ZTRWbEN6cVFsemNr?=
 =?utf-8?B?MmxsbU94ZktvV0ljN3RDOWErb2lpL3VURXNLRDA5d3RYdGVGd1daSEVkWUhm?=
 =?utf-8?B?Uy91NFdnZFRvcWdRMFFjQkI2U3p2YXBpTmloUkRIZVFaeUh4K0RRaXQ5VXlB?=
 =?utf-8?B?Y3VORncvVklhTzBrb1JnNUI1aHFvWEtjQUR1MnRXYXl5bFpOc2d2a1NCRzFk?=
 =?utf-8?B?R2phelVMWkN2ZmV3T3A1K2p6a3JyK2EzYTVTZSt1L1RsZ296bVJjRUUyMndj?=
 =?utf-8?B?RlFtQnFpUFdHRnZjd0Q2d1ZXN3pGZFo1L09aYmtoeitFdnZIV2NOditZTWZH?=
 =?utf-8?B?SzRZa0QyY2hPbzhuS1AyYzhJbFIreFZlb01SKzA0YVQxeCtsVTBmamJFL3p1?=
 =?utf-8?B?emoyaHdnVVBONzVaK1o4bndxQWFRZU5pdEtnRjRGS3U5QUYzbDN3Q1R3MUpH?=
 =?utf-8?B?SkRKL3BLYldNdzFSdGtNNlFpOVduUkF3ejBJTTBOM2ljVkdQWWxDYi9jK3ph?=
 =?utf-8?B?MTdlT1pyVTRPRGdscUZHZUZieks1MzJLRFlWdU5LcitFUThGYVIzakYrT253?=
 =?utf-8?B?eHJGdHVMbndKMFRiT2hWZ0U1ZFdxN0crV21nRGNmcXVrRFFPdGdVbFR2K3gv?=
 =?utf-8?B?ZmNjSUhpOWJEK2M1WXdTT2U2OVdUZzhNNVFXS0xVQ1JtRzhyVUlDTldQS1FD?=
 =?utf-8?B?NDhucVIvODhMNTJnQzRkclM4NEtoSDhwbFZzS292MVppWlhMd0d6c0hxRm5S?=
 =?utf-8?B?TTdHcEl0TkM1MUtmOGUxTHR1VEMvVUJxdU9zN3NIdW1EQVlrTjM4MTlaNURT?=
 =?utf-8?B?TitRSzN3Vk9WMFpVUWR0UG91MmJ6SWtSSzJmaUNaaklrVFZEWndRaE43MDlq?=
 =?utf-8?B?MXRUMFdvNTFRT1RYN1Nwa0ZicjUyYWZ1dzVqRUZ2RHh4TWUxMEhhM3V0OURD?=
 =?utf-8?B?a0h2SjZZWG9HaGdBeWZUYU9TdEZ3dVowUnEreWVHemlJK2Z5OTMwVEpFUnN3?=
 =?utf-8?B?aTUrOU9TeFRqMUJWODJjUk9kYWdvb24zMFdIRkJPcTA5U1dQNUlMcUhIalEx?=
 =?utf-8?B?ekdjMzRWV2FRaUVaUVNHU3pzdExXcnBTRHdlS3o3M3hkNCtwUXljWVRrbjg1?=
 =?utf-8?B?WW5zOGNPb1UrbG9xTHRwVjFId3NDSmdaTUZKT1kvUXFPOW80bkVYci9vaklq?=
 =?utf-8?B?dGt1bklpUWhlRHVTOVI5c2NPSWZOTEcwbGpLN0lwd3NRM3ZSVThVdEJZQUhy?=
 =?utf-8?B?Q3djbUNWaVNscDkrRm9PdHgxVTRrc3NPSHpmaW5VSU5OWWgzcGQzaGU2cUhQ?=
 =?utf-8?B?ckpFeEJQM3R3T3ExNUN6L2p6VVBPN01zenhVUXloRWQvVTFaM1BXUlV3WlNV?=
 =?utf-8?B?L3JTZHpHUzd4c2xTcWNlM3RSTjF0TmlzU3N2TDZwUWlsSnVzZFVoN0h3VjBr?=
 =?utf-8?B?WlE5cS9LcXhZS1lLVkNlMEY0djVhbU50YVVHTGVEYldDbnZIdFRoaGRMRHZC?=
 =?utf-8?Q?jk9Cy+lPD5BrzgiLd5Eni6xMY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <748911BF67A21847ADB5A82086C19574@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Z2pvZmc5MW52OVhDbE11S2JaeU8vMndjQkdZS2xIZzlWVEdsaVB0QVd6K0Mr?=
 =?utf-8?B?SDhVRUxtd0JHbGZVYXFhS1V1bWhYNmVBWWNueDlvZFFwRmNvRXJlVi92bDA0?=
 =?utf-8?B?YUVrRVlZRldJdWNLRFQ4WU43aFZhNVdCMWpTYkZDM0MzSk1Jd1d0Nk1pY0E0?=
 =?utf-8?B?Q3FyNys3b1lxV3lRdEZzMmZuRjgrelowcHhCLzhhTEtxRnZ5MlBhZ0NtWTdJ?=
 =?utf-8?B?Z3Z0QXErTmNKdlJXWEhRL0U2VDBHWmtvcjIzai9pcERVbk8zVGw1OU8xbTE1?=
 =?utf-8?B?NG9OOFJRQWZHL1VDZG5PaU9EbStmMWlsOXUwZ3JkWEJVSnowc0ltY0w2OXJC?=
 =?utf-8?B?TFBBN3ozUTluTmxBRFFsY2loU1NOY0ord2FBVEdvek45dk5qTDRTT3NQY2xk?=
 =?utf-8?B?dXpIOU5kSXE2RmxTWVF4QzhLdDdBb3ZQekZaejBNczF4eDc3ODJwSTQyL3dP?=
 =?utf-8?B?d1ZQbW5hbFgzN2lSZENZZFM1dnlJQ3lDbzR1b3JGN2NDaEdvcXNhWjRVWGZN?=
 =?utf-8?B?ZmM1UjNtOTFxdDhGNkpuV2pVNldDUCt4MkVWaG9OZGVQVFJqMDkyb1ovMXdW?=
 =?utf-8?B?aVdabHFacGRzU1hSeDA3ZXB6SnRDMVlPaDdUVUd6TDJ6TDRTV3hNVHhkWHJQ?=
 =?utf-8?B?RXhsWTk2WDdSUStLOTA5bktvYkg0Y1NNTWQxdS8vRllIemhWYkJndDlwTGR1?=
 =?utf-8?B?SGhlajN5Ui9SWjRZU1d0QW0zSXJ4ek85Wi81QnZudnYySjBwTzh2T2ovYVc5?=
 =?utf-8?B?ekNiV0VjYko3MFhVUitXWXdGaWY2aSthVUd0T21ucG5CeTEyYnhJOGNRMTF2?=
 =?utf-8?B?U0RCOThiN25uNlQya2Nrbmluemx4Y0hJRHZFRnZqQU1ONm1rL1dYK1JrbzZQ?=
 =?utf-8?B?eWx3WWRWelk4RHJYRmZaRlM5OFFRVnRkeXlQZjVnZ0tSYWJSMS9aUmt4a1M0?=
 =?utf-8?B?TUVOT0dpWVR6NFBLaHNoOGRMTlBUVXY3akpLNEt2Vm8wdmU2dW92QWZBSkpq?=
 =?utf-8?B?QXJFTlZPQ0xaMVUrVHQ5TmE1U2Z6Yll2TG1OdGN6M3doQUFpbldBMGJTUW5k?=
 =?utf-8?B?T1dzelIvdENlQXNYeVdEWWRLdERMTFovSERlR1c3c1lLeTJaalNuY014NlJZ?=
 =?utf-8?B?dUFpVUlyckJaMmF3U2VsZW5NNlhvSXZLSnhOVmpJbHBoQmFYblIrUVdEMlVj?=
 =?utf-8?B?OWlLd2N3ZVB1ZHh4Rmo1VHhnUTIrbmV1eUFvU2xSeUM2RXRscmlINFVtNTQz?=
 =?utf-8?B?L1VBdW82TXZVVENvazFyNmRrNU5HcWNTaW5QMlByQmtmQTlWalhSYnU3ZEs0?=
 =?utf-8?B?QVhkU1IwbmhZVlVIaDE3ZGdzaU5NczVyWTU2L1hmUVkzdmNaeml5TWFrWDdW?=
 =?utf-8?Q?7dG6nhQ8SiiBxsPa/PWmgKr2s6XwpXJc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74b7836-2cc4-4b4e-7c58-08da8057797c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 13:50:41.4433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc2qkhzIi+hWuBpqE9pE8h3jwgC9iDOHX1Fg6kDMEDx7I2+GxmxS6Ha938HvCC6qCybwoqvqpLNOJSV28t8r4nkd0Dn1+N/cwFAxmXGk89c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5223

T24gMTcvMDgvMjAyMiAxMjowMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDgvMjAy
MiAxMDoxNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+PiBXZSBjYW4ndCBoYXZlIGEgc291cmNl
IGZpbGUgd2l0aCB0aGUgc2FtZSBuYW1lIHRoYXQgZXhpc3QgaW4gYm90aCB0aGUNCj4+IGNvbW1v
biBjb2RlIGFuZCBpbiB0aGUgYXJjaCBzcGVjaWZpYyBjb2RlIGZvciBlZmkvLiBUaGlzIGNhbiBs
ZWFkIHRvDQo+PiBjb21mdXNpb24gaW4gbWFrZSBhbmQgaXQgY2FuIHBpY2sgdXAgdGhlIHdyb25n
IHNvdXJjZSBmaWxlLiBUaGlzIGlzc3VlDQo+PiBsZWFkIHRvIGEgZmFpbHVyZSB0byBidWlsZCBh
IHB2LXNoaW0gZm9yIHg4NiBvdXQtb2YtdHJlZSwgYXMgdGhpcyBpcw0KPj4gb25lIGV4YW1wbGUg
b2YgYW4geDg2IGJ1aWxkIHVzaW5nIHRoZSBlZmkvc3R1Yi5jLg0KPj4NCj4+IFRoZSBpc3N1ZSBp
cyB0aGF0IGluIG91dC1vZi10cmVlLCBtYWtlIG1pZ2h0IGZpbmQgeDg2L2VmaS9zdHViLmMgdmlh
DQo+PiBWUEFUSCwgYnV0IGFzIHRoZSB0YXJnZXQgbmVlZHMgdG8gYmUgcmVidWlsdCBkdWUgdG8g
Rk9SQ0UsIG1ha2UNCj4+IGFjdHVhbGx5IGF2b2lkIGNoYW5naW5nIHRoZSBzb3VyY2UgdHJlZSBh
bmQgcmVidWlsdCB0aGUgdGFyZ2V0IHdpdGgNCj4+IFZQQVRIIGlnbm9yZWQsIHNvICRAIGxlYWQg
dG8gdGhlIGJ1aWxkIHRyZWUgd2hlcmUgInN0dWIuYyIgZG9zZW4ndA0KPj4gZXhpc3QgeWV0IHNv
IGEgbGluayBpcyBtYWRlIHRvICJjb21tb24vc3R1Yi5jIi4NCj4+DQo+PiBSZXdvcmsgdGhlIG5l
dyBjb21tb24vc3R1Yi5jIGZpbGUgdG8gaGF2ZSBhIGRpZmZlcmVudCBuYW1lIHRoYW4gdGhlDQo+
PiBhbHJlYWR5IGV4aXN0aW5nIG9uZSwgYnkgcmVuYW1pbmcgdGhlIGV4aXN0aW5nIG9uZS4gV2Ug
d2lsbCB0YWtlDQo+PiBleGFtcGxlIG9mIGVmaS9ib290LmMgYW5kIGhhdmUgdGhlIGNvbW1vbiBz
dHViLmMgaW5jbHVkZSBhIHBlci1hcmNoDQo+PiBzdHViLmguIFRoaXMgYXQgbGVhc3QgYXZvaWQg
dGhlIG5lZWQgdG8gZXhwb3NlIHRvIEFybSBib3RoIGFsaWFzDQo+PiBlZmlfY29tcGF0X2dldF9p
bmZvIGFuZCBlZmlfY29tcGF0X3J1bnRpbWVfY2FsbC4NCj4+DQo+PiBBdm9pZCB1c2luZyAkKEVG
SU9CSi15KSBhcyBhbiBhbGlhcyBmb3IgJChjbGVhbi1maWxlcyksIGFkZA0KPj4gInN0dWIuYyIg
ZGlyZWN0bHkgdG8gJChjbGVhbi1maWxlcykuDQo+Pg0KPj4gQWxzbyB1cGRhdGUgLmdpdGlnbm9y
ZSBhcyB0aGlzIHdhcyBhbHNvIG1pc3NpbmcgZnJvbSB0aGUgb3JpZ2luYWwNCj4+IHBhdGNoLg0K
Pj4NCj4+IEZpeGVzOiA3Zjk2ODU5YjBkMDAgKCJ4ZW46IHJldXNlIHg4NiBFRkkgc3R1YiBmdW5j
dGlvbnMgZm9yIEFybSIpDQo+PiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPg0KPiBUaGlzIHZlcnNpb24gaXMgYnJva2VuIEknbSBhZnJh
aWQuDQoNCk5vIGl0J3Mgbm90LsKgIFVzZXIgZXJyb3Igb24gbXkgYmVoYWxmLsKgIFNvcnJ5Lg0K
DQpUZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

