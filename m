Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB56602FC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472760.733114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoV3-0006Vb-8Y; Fri, 06 Jan 2023 15:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472760.733114; Fri, 06 Jan 2023 15:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoV3-0006Sj-4n; Fri, 06 Jan 2023 15:19:17 +0000
Received: by outflank-mailman (input) for mailman id 472760;
 Fri, 06 Jan 2023 15:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDoV1-0006Sd-Nd
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 15:19:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790f2b12-8dd5-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 16:19:13 +0100 (CET)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 10:19:10 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5553.namprd03.prod.outlook.com (2603:10b6:208:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:19:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 15:19:08 +0000
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
X-Inumbo-ID: 790f2b12-8dd5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673018353;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9CdlP3hOQO0KgwM+w6gCU4wWB2bLJCigK1wKvCRZYcI=;
  b=cci7ysnuDjLvwZgUHLlEaNVK9ChHIXDjQcINM8dya28MrAjmk5xSPFwE
   QDi8r5MtCIYYsNUcoIg4n1/6fUYOBtmj22+bzaJL4xZYy/g33qWnyURbM
   EkCjRhkGsv/g6U1oapXI6+1HofJmh/YBXbgUKYfAw1BlSkxqamr6U454R
   4=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 90436429
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1JDpgqy2sFJpBAmL+PB6t+efxyrEfRIJ4+MujC+fZmUNrF6WrkVUy
 WBKUD+AP/uIMzaje9xzYY7goE0EvceEztZiSVBrriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPa4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWF15
 9gyNzUcUhGgnOmX++u7RPdlgv12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVIhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqAN5JSuHip5aGhnXI7VMUKRMJUmHnhtuDjki/C/9yd
 mMLr39GQa8asRbDosPGdx+lpH+JuDYMVtwWFPc1gCmKzqfX+AeYQGsZVDlKaN8hnMAzTD0uk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750cjMcN07iw9HjdgiyrvZnPRUg+4QC/dmii5AloaZWlY4Gt4F7z4vNJLYLfRV6E1
 FANn8mF8OkPF9eDjiWLS+QWNK6l7LCONzi0qVVoGZ8m9Tik5X+4VY9V6TB6YkxuN645lSTBZ
 UbSvUZa48ZVNX7zNKtvOdvvW4It0LTqEsnjWrbMdN1Sb5NtdQiBuiZzeUqX2GOrm08p+U0iB
 aqmnQ+XJS5yIcxaIPCeHY/xDZdDKvgC+F7u
IronPort-HdrOrdr: A9a23:b8K5na7+HwlcPJ/HqgPXwMvXdLJyesId70hD6qkRc203TiX8ra
 uTdZsgvyMc9wxhP03I9ertBED4ewK5yXcX2+ks1NWZMTUO0VHARL2Lh+DZsljd8kvFmdK1vp
 0AT0ERMrPN5TUQt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="90436429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BL4fr2ItjcJz2gpyhd2NLktdrbNWJA6gxnzwGh5g1JdUp7nKcgViEGSKI5Rj5hG6xpiVPNqvbdEVBUoVgO+q5j/M3FGpnWV1nsCIKBO3XOsZ6UbALWQ/TA4B5X3tOI2+dzcm3Ysg2lZB0NDgSSwqSjTNNcUtasSb9C/GZLqYP6HHBEgRUUGDEHfifFiqbT9VgtO3rWBPiMxkeyQRkE5A3+NDrOc6/nwAQ5FeyBcMQBbhxjvd0vBD3RC/8eLkL4jADWbRC4h/hiK6PXszZtLpFlzbT1Iw4VJvHhK5ylQ+jhEHQL1sBr2Qr66hdzUsC4YBONvp+1TEAuYOD9F60+wcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CdlP3hOQO0KgwM+w6gCU4wWB2bLJCigK1wKvCRZYcI=;
 b=n6uSIBEBAfbx8lNqmi+bRTuY8D5jTHX/1sWcIGB+YkD1bJYbrQCefIXMOjay/fsAtb1Dz+9rwcLwL6rkUv2ZShnozBQ4VK9w6BtbGbuWDg6KODmC0YiHtVWcrN0hDfMN0YRuTibBpouLJ71kKF8VZ1aSVatP+iohQvw9Zd4AOptjUPDs1ZPLWYME+Bf5HP2QCIeZL6I9O4zzBRIy1cxkPnirtJI8GP4FLEznHcOkkK4O2zYayxw/LFjVoc4+m0u4F8Hux/XQSqdjN7lkYyIiCdeb2nvEC3N7wOUk9d1czQeKwyji6xCOvvnFR00zYa8RjyUbAMfhRuYMptruRXHB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CdlP3hOQO0KgwM+w6gCU4wWB2bLJCigK1wKvCRZYcI=;
 b=S1g2CAi9PN3T2/23Rjrg/eoylXaEoAuGIs6vM21xQIQ7/Hv2RSDGJ9qX6GFzFI0z0zo9bPwCH35EVaAqlfko8m833lf40gsteDK8OzNTiYx9NzuPu5DMKJZC8qFpGGOYJGLHG8TRAt9i43Z++6ol/LHTzxGTE4mfTU5gHg8BTzs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Thread-Topic: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Thread-Index: AQHZIdDaR/Z8ZObOWUu8wVolwH1ydK6RZVeAgAAbd4A=
Date: Fri, 6 Jan 2023 15:19:07 +0000
Message-ID: <8b6a9927-8a56-6fab-6658-deb4083d2c45@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
 <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
In-Reply-To: <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5553:EE_
x-ms-office365-filtering-correlation-id: 10292a8f-3a22-477e-f977-08daeff95b0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 L1Hk74rfAPmZ18+2oz1DZ5nGC9TRx3hjxYVdqZC4j9X/OvrXEHDBWoN4lhefVtvMn+YtzC1olyi9EbIrtkF84Xg2oplR2RnLv6Th8gzb4T3KmD/AoQ5Jv6dGfiEveQAKtMyt9OMYAL5WrxCYHnFaQ0emqn1EZeOTuFMZtCKvIPxDiczfz230Ak9/t66F3ZXQ/WsIqgLlHIqFa6wBpS2dSpW9/U7DjQW4IucrhgwH5HXlJTJrIYw8mCkNFWqXHXCIgOBGcNGXs6mk+JKf9/KAlk+QzmEdsZRnRHXUnMvGBLJNM4C3LLgifepauOQ5LiYZ0jyXSRNkzduKT0pxnSM9oevyDk4/Vi83nIVkibaG1GewkcVhYlk0bnseuLFcFIlJ67XmyeNA3OvP5IFTD/rWBbbNZsZrg+5sINTaCLN7bXTyd8v6xlvE+OsP7zwLkI2GJOddZDkIPSKyP9inP0o6o56YpvaRHSwcDaKV7+P/7rJKgAr8dpmK6+hLsaFfktX85I6GmFwFNgkSoHysh3OyGIk8GR3iCTigLjyMY0W1ZtZfQbHpeccucaa2J6epa6RS0VFL7KJsp4nrX/C4YoFdPvCWhAeP5f+e7iRR72UMxRy1cNIhR/A+RmJYWW5oE3xb3AEpVJEaBzBtUvlE6zGA48ZTcbdh2+0dMPbMbh93wT0vjZIWphDoT3oD8owLrnx0bj2kdVFlIuS4gnhAdupQCc5ixYBIYariG2cYtiLqli/9HZegc/zYYf/b9Ta64/GFzRYk87c4usm+4ztYb3ac1g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(2616005)(26005)(6512007)(186003)(83380400001)(6506007)(38070700005)(86362001)(31696002)(36756003)(82960400001)(122000001)(53546011)(38100700002)(4326008)(41300700001)(8676002)(8936002)(2906002)(5660300002)(4744005)(31686004)(71200400001)(316002)(66556008)(110136005)(76116006)(6486002)(478600001)(66946007)(64756008)(66476007)(54906003)(91956017)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnU5OWRsajJ5OGtQZ3BxQUV2b0hnYkl2OTRzTDZXb3kwSnRUSVNCWUFIeHdP?=
 =?utf-8?B?UXhtaTBwSFhCdE5jcU51UGJ0VDh5QXpZc2c4TlhlUVhlOTJWMXdEVTFSUGZX?=
 =?utf-8?B?aURycmE4NFlJWHRkRmIvcVdRaFFhdlJTTk8rQ1h1dWozVWRudUdLdDF5d2pk?=
 =?utf-8?B?TjhzZGxIQ1M5T3lZVEFSUGdlRDNKN0VtZk96MFNHbmpvelE2ZXVka1RLWEFM?=
 =?utf-8?B?eCtxdUVOdkowa2QvbG9OeDIvem1Nc0tKczg0bVpVY1dnZVZUUVgydWswK0Vs?=
 =?utf-8?B?NGprOVN6eDVLeUNBVk9BMkhYWFVHdHRCZnFXNzdINndVOEFKcDBUUnBHZnAr?=
 =?utf-8?B?SXJ0NzAvdlFDY3pWMUVTZFhQWEc4SytRaE5hL1VhSG83TzdhWVNOVkI3Y3Zi?=
 =?utf-8?B?NDZFMndKcHdxeEFOR29hWmZqazhXL0lZZWFJb2tGWWFDc0NtVXNVQTJUY1l1?=
 =?utf-8?B?M0ZBVHRoUnlRSTZRMDMrREJveDVTaG8rUko4VUxybUN0Z2hMZVVzQkIvN3hv?=
 =?utf-8?B?UEQ4alVLdnZ5Z3ZEbTRjYnFuZHZKNE4zN0VDVWhKc2JJTmtrSHBYcGcvcks5?=
 =?utf-8?B?TnJ5RGZEVE1sdTJHTG1wc05vbUUxTFR0U0xYZ1R2U1k2c0NCdmk3dHhzbXV0?=
 =?utf-8?B?dGlOSVltaGRxa1ZVbzlFL1NlSXdWcWlnWXphNGtKVjRTRFl1Tk1lYXZDTUc5?=
 =?utf-8?B?ZGJVcUwzeXJKYU1LTFZxZ0p3Mjdhb0VRWStyZ2E0SGNyVWJad1pkajErOUxH?=
 =?utf-8?B?bDZva0thbEM4RjBEMEkyaVlCY2VzSVZHL1pGa3Q0NVZRcHZhMzYzeUtGREcz?=
 =?utf-8?B?TmI1NU9PSURzOVRNVHY1QXRDcTBYTFZKOEp1T0w2bk5KL3NXN0ZobWVlRjkz?=
 =?utf-8?B?eFoxR2ZQY1Jkcm5YU1BPQXFKeE1DMnRDUjNaZW1YRTVKSldwOG1hOWVDbVFC?=
 =?utf-8?B?aGpKUjBFa05kejJmQXUxcHRjVjd5bElLdGRXdDBPUjg2OU5RU2kvbTVsd01K?=
 =?utf-8?B?S3BieEZBaWZObDFjKzZsOTc3bndUZjNtbVh2UTgyMFJHNzJaMkpDZDFrK0dK?=
 =?utf-8?B?UzJSelB5ZXd2dHNpQlpJM25OM3VYeWpoYWR3YzRWR2s2YTlTa1ZIQ0V4NFJS?=
 =?utf-8?B?cWN6bU12d1Z6U2V5QXZJRXJhT2kvUk5DazlGOURRTktVdTU1NXlBZzJkSmhj?=
 =?utf-8?B?dmIxc2o3RW0vUXM1aUx5Zk1hbGZLbUs1OXcwbGUrVTltOUVjWENnamRWL3k1?=
 =?utf-8?B?S2lSZXViQkxEL0tnWUNzYURWMHRXS1FYejU0MTVrUFk1d0FMTWRjL1VHNS9W?=
 =?utf-8?B?SlVNalViSjZYNHovc1k0ZW5uc1lIaEFWalI0TjZLcWJVRUlzWTlVR284dk10?=
 =?utf-8?B?cUlxNHVrbkhPVkFnNnNpcEMxWDR6SE1VTTZaTUM2K1FIbXRuRmxDK2ZrTXBR?=
 =?utf-8?B?bHhzWmE5WllqekdGZk1ZWFBXTHM0T3NKQXFZY24vdTlQTDRSZ0xmM3R3VVd2?=
 =?utf-8?B?UkpBejBDRWFCc2ZYb1FVSzlINWMwbjlMUlVIVTRCUTRVcHk0T2wzQzFybzBy?=
 =?utf-8?B?OCtWRzJ0MERyZ21vTEtQMy9uSTJBbWltMWRPRTU3SUxMS3l6TmhoMEhITG1G?=
 =?utf-8?B?bVkwS0F0c04xOFltMEpRWFZibk9KNEZab1JDY2tXNEpTL2Q3TVRxMkljWkVr?=
 =?utf-8?B?NG45MExPNmIrbVRnb2dKaGJvemQzYTdmdFltQXk3d1dOQnVKU1AzZEtMMUJt?=
 =?utf-8?B?ZWNVQzY1dDk3cHVsZVlCejVaSHNRU2hjeWZFK0ltNE1SSDZpbStZZ3gvWk1w?=
 =?utf-8?B?WlF1a2I0SVJCRThISjdBSktwWUZzZmlCNEcra1hETGJBZUdlc3BnV09DK294?=
 =?utf-8?B?UDR6NitiQnhndVlYQk81S0ZFMndqL3E1R3pHMytzL2QwOGlPTFgrVGhsZ2Fo?=
 =?utf-8?B?MnljL2VBNzd6aDdBSWZFWlhDVXJMK3l0YnNEMkFzY25rWHBFc3pPZmU4ZkdR?=
 =?utf-8?B?R2ZBSTloTGVyRDBRamo4WUF0aGJ3Y0k5MHpnVnllOUY5RHNDN3gwblBwVyti?=
 =?utf-8?B?MDZOczNWcWVsVVBKMys1anZIWmttUzJScW1kU3NoNXVybHljNkl4VEc2STFB?=
 =?utf-8?B?NHNORnZzQnJsd2pJLzNKSGNCY0J0am8zTHliVTRzd0ZuQStsTzBUeTYyNGpV?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34D1B9580B0B1440BF0B3D484ACFC147@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?VWdsZmFOTkYyelNxTnZmUm1oT1lOa0VSTEs5NmV2MVJYVzlaMzN2bmwrRW5Q?=
 =?utf-8?B?ZXRQeGRlM3NoSncxbkVUa0hMZHY1Vi8rdDA5a0JCQ05jS0lxeUh6Ulplbkwv?=
 =?utf-8?B?Nlc2eldMTTV6bHhsd2MyYmdubEs2eHVGczIvb0RCUVllcExlTk1CWitXWTkv?=
 =?utf-8?B?Z0wrTTd3b00rS29JYnE1eXVSZWkzREFHZVRLNmJCcjdUKzFKUUJnbUZsZGtp?=
 =?utf-8?B?clFXdDEvZDlHU0dLV1pjdm9RK05LeFZvc1kyT2dRR0d1V1Z5VnNLbTlkZ01a?=
 =?utf-8?B?OWZCcG04VytWTEI1ZmhDR1VmbmNJTHFqNmttc1FOMzMrSmEyR2g0MUV2QXFC?=
 =?utf-8?B?MytHL3NqQ0ZSMXpyOTRyLzNNT21wZ0VycEgvK1V5ZUZOSUJ1ZHBURmNrc3da?=
 =?utf-8?B?bGxlTENLbTRIS1VSZVc3cUxaZnNnZmlRYURpcktBbGltSkdPb1hHbnZpY2Np?=
 =?utf-8?B?b2tINDhSeW1Dbkp2Y1hNSkFPZ0txV1R4bElOdEtZbXYxNCtVRkFXc29pNEVr?=
 =?utf-8?B?aWRRM1pHVTRrdVFYVzZvSWVLb21kWmNFMmRYZS9xZ1V2ZnM2ZGwzUmxEN2Fh?=
 =?utf-8?B?N0VNWUp6VFA5REovYW9MYkNnOFNKR0JBZWo4T3R0Y3Jxc1ljL2I5LzhxUG1Y?=
 =?utf-8?B?WnU5ZVpyaFhwWnFHY0cxcmV3SS9sQTc5RkJzQU5ScVVVdFZaN1IrTy9VQ1c5?=
 =?utf-8?B?M0pqb1pSY09lOWJOWnpNcmJGeVo1OW95MUdNZW1ObWJUd1JGV2ZreW9uc21E?=
 =?utf-8?B?TG1ob3JjN3VSQVdkcGc2QWhvV0RkR2s3cVBTTzJRZVNsanJZN09PMHhMYU1B?=
 =?utf-8?B?bkdIOVhQNGdxNDhFT3JRT0VFWjZCdmxRYzNjSVZ3N2NNdmxiMHc3MGFTWmhF?=
 =?utf-8?B?ZVUxTmUzOFdMQ1BxMHdKN2hmbndLbzd6N3ZlSmpYWkhYOG1ERzBYWExSSWN0?=
 =?utf-8?B?ZThSM0tKbEJoSFRkQVZMcUhWanlrQmNqeERSNzhneDllTk8xcit4ZjdWVUZz?=
 =?utf-8?B?Tmg0ZmVTVklOL0ZwZC9BWlFva0Z0UkFTMmdzVTdvNlBXUitrMEhGbk05Vjdp?=
 =?utf-8?B?Qk5LTnN1UjFtYTMwU3FiVUZWWlgzTXlIRkR4N0lId1Zwd0F0Z2dtY29wMTZ0?=
 =?utf-8?B?bENJd0JCdi9DbVlHQzJ6N1hvVGpCTnM5dVc2UU5JUEl6Mk9uMERSRTFtR0FS?=
 =?utf-8?B?VkE5MDFjRzJjWVZlcTM0cWZXR04vRXVDUzQwaklRVFdBU0grdHJRVjMrYlJV?=
 =?utf-8?B?L3BoM0lncGl2NU1ObXluTjlLcytOUWg0YzFpRnNtbjkxVXQydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10292a8f-3a22-477e-f977-08daeff95b0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 15:19:07.9596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6gdBzdIEH0yRdm/TUOnloKmUObTk6CHn4I/YyHa1aTw5flo2yqvDlQNBEgjCltcyREY/JIdytn2eyHQz9ule78UAYDt7RPbpMDPhDXS7zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5553

T24gMDYvMDEvMjAyMyAxOjQwIHBtLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpLA0KPg0KPiBP
biAwNi8wMS8yMDIzIDEzOjE0LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPj4gVGhlIHBhdGNo
IGludHJvZHVjZSBzYmlfcHV0Y2hhcigpIFNCSSBjYWxsIHdoaWNoIGlzIG5lY2Vzc2FyeQ0KPj4g
dG8gaW1wbGVtZW50IGluaXRpYWwgZWFybHlfcHJpbnRrDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
T2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+DQo+PiAtLS0NCj4+
IMKgIHhlbi9hcmNoL3Jpc2N2L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4+
IMKgIHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzQgKysrKysrKysrKysrKysr
KysrKysrKysrDQo+PiDCoCB4ZW4vYXJjaC9yaXNjdi9zYmkuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+DQo+IElNSE8sIGl0
IHdvdWxkIGJlIGJldHRlciB0byBpbXBsZW1lbnQgc2JpLmMgaW4gYXNzZW1ibHkgc28geW91IGNh
biB1c2UNCj4gcHJpbnQgaW4gdGhlIGNvbnNvbGUgYmVmb3JlIHlvdSBqdW1wIHRvIEMgd29ybGQu
DQoNClRoYXQgd2FzIGFscmVhZHkgcmVxdWVzdGVkIG5vdCB0byBoYXBwZW4uwqAgRnJhbmtseSwg
aWYgSSB3YXMgYW4gYXJtDQptYWludGFpbmVyIEknZCBvYmplY3QgdG8gdGhlIGhvdyBpdCdzIHVz
ZWQgdGhlcmUgdG9vLCBidXQgUklTQ1YgaXMNCm1hc3NpdmVseSBtb3JlIHNpbXBsZSBzdGlsbC4N
Cg0KTm90IGV2ZW4gdGhlIHBhZ2V0YWJsZSBzZXR1cCwgb3IgdGhlIHBoeXNpY2FsIHJlbG9jYXRp
b24gKGlmIGV2ZW4NCm5lY2Vzc2FyeSkgbmVlZHMgZG9pbmcgaW4gQVNNLg0KDQpJJ20gbm90IGNv
bXBsZXRlbHkgcnVsaW5nIGl0IG91dCBpbiB0aGUgZnV0dXJlLCBidXQgc29tZW9uZSBpcyBnb2lu
ZyB0bw0KaGF2ZSB0byBjb21lIHVwIHdpdGggYSB2ZXJ5IGNvbnZpbmNpbmcgYXJndW1lbnQgZm9y
IHdoeSB0aGV5IGNhbid0IGRvDQp0aGlzIHBpZWNlIG9mIGNyaXRpY2FsIHNldHVwIGluIEMuDQoN
Cn5BbmRyZXcNCg==

