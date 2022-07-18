Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB81578704
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 18:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369916.601529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTId-0000Gc-UB; Mon, 18 Jul 2022 16:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369916.601529; Mon, 18 Jul 2022 16:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTId-0000EO-QV; Mon, 18 Jul 2022 16:08:47 +0000
Received: by outflank-mailman (input) for mailman id 369916;
 Mon, 18 Jul 2022 16:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDTIc-0000EI-Ch
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 16:08:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4dcd6fa-06b3-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 18:08:44 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 12:08:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5803.namprd03.prod.outlook.com (2603:10b6:806:116::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 16:08:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:08:18 +0000
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
X-Inumbo-ID: e4dcd6fa-06b3-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658160524;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dks+5vapLIntahKliyHNh8FCP3DBhOVe02YFjtbFDYw=;
  b=TYr6TlzInmdgQdGXjfus6LhRRaXXadCIlbTw1A34VsntWHRzNpwkLc8A
   kFN+KnKTOUM2C0Y7kKD4oCMaqtNrwCJ0xkSYnmMfJCrVWvFPXISsMxeBg
   +X4Fdx01jDPrcLUqZiZvdi6/7tsLRtpqQvHGmXQll++dOGM964/KgJjnq
   E=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 75868735
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rtQJSK9XjnnzKTWFzM4UDrUDmX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2UbCj2COPfbZ2fwcoogYNy/oRkF6p/VytIwTgU6qC88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gVaYDkpOs/jZ8Ew27Kyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGV00kYpxEx6VMCkpO2
 +YBBABKUVeRvrfjqF67YrEEasULCuDOZdlakFcwiDbTALAhXIzJRLjM6ZlAxjAsi8tSHPHYI
 c0EdT5oaxeGaBpKUrsVIMtmwKH02T+iLnsB9wj9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WXYoiz82bSS9c/9cL4sNoW4699uvHO4zTchAh8EUFqD8dDs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehgNfBFTFp9rqPRhqgGqy8qDqzPW0fKz8EbCpdFw8duYC8+sc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNsWuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:uwt7Uqq/D3z7rhqU8VUkRPkaV5uIL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AbeSITCNU4H4ox69Mxkm1LimjQdVJsX6t
 M140uJ85VQFh/OhyL7+pzBUAxrjFO9pT44nfcUlGE3a/pWVFZ9l/1pwKpuKuZ3IAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkcoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWuKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEnieffFmHKc7hywlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDSq5rPw==
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="75868735"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4FhH+cWhO0+v59k/Qla1gHmbybzowQQ7f+WpjWskM5Jd7BoKIFj0dxoXirioUa3Ry2sN+oJhSHmiMXrxcZvv2PTt5PIbAhFXilGP1Uf4IGUgApTV0sHJEICHQKPbhaX0obMGtoIHAVkpZhGU8GZCZpn2FhyFMuPNSJBpl/GRNj01Vsv18XljNM+p2if1UnD0cgomKxZ5RgHYDycQxPB3eyAvalAlfy8WWnO6YnQxWnjJB5canOqb2Ctd5Kttm3G9+N6PbN7zbM9w2srCQERJWq6PpqCaMeH3jtraJ5j3KgMqUBDPZJwXoRVboRBeBgF9jsk200tkXmmsGxDeKTBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dks+5vapLIntahKliyHNh8FCP3DBhOVe02YFjtbFDYw=;
 b=N7S7nKdiDujRtvadHAFuTjGWbUe7YxHE4X6V3RHL7q6jCuFPJjYwsVfREVBHFqRgRoOByso3BOiT4fieHI85QnzUtNp+hhViFCYDDuNW7iSv4m/LsnsLyaXwG8pWfyrREUNXotMK8arVOGi2EqYr3EeHQHkLm+H+ka2JyP2LZnSxGN/6aI+Ffd5wGfGT8fOey6bTPlUFEJltFPZ+8P2J38tZz8chGsJp+w9A7kH4U201oePaXvsfp8NniZg3Az3+Yccjb56ZFer8l7DSJDj5faCze8/uN8ERbLdH8Rnt9sM3c5AuqCLz5KWl6FYgwSM2dmgsqtZ0vPZ02kZigLE7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dks+5vapLIntahKliyHNh8FCP3DBhOVe02YFjtbFDYw=;
 b=neNSa1a4GMNKZk/y8j6yeay/jpXruwoBxV3hs/KAaJZ8L9kQ/7Nh8jr7mgY0iOKnuEH2nHyRe5NdQWWdqjswzA7/71mXZkB9zMMwu48QbOKjj4ZotX80fGWpc5LDZHd86SMX/4WRxhGbmnwCCPuZYfKtXgE6e640NfuJuzTYdR0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/spec-ctrl: correct per-guest-type reporting of
 MD_CLEAR
Thread-Topic: [PATCH] x86/spec-ctrl: correct per-guest-type reporting of
 MD_CLEAR
Thread-Index: AQHYlo2NnhZbWocHg0SlwcRpU4+es62EVBOA
Date: Mon, 18 Jul 2022 16:08:18 +0000
Message-ID: <a6a2cfb7-fa57-28aa-4fcb-27c80cade4bb@citrix.com>
References: <e99cb53e-54da-55da-23a4-13e445f5b7d0@suse.com>
In-Reply-To: <e99cb53e-54da-55da-23a4-13e445f5b7d0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98031e47-2f70-40b3-7609-08da68d7ba93
x-ms-traffictypediagnostic: SA2PR03MB5803:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sCMlqmC02rnAHNnAzyLN7anB6yGu4n6xN+KW8/nbSXDZwCmrphhi3gBlxR0DKnOBvvK+VG8CoSeZUy+S+hg+vj4r7s+dU1C5qbrQ2WCpe6APpZG0Vbc9jmXR1zIO6UjSKUDReS17tHmMvVDDvClxY+wkBLiTcfA1MmRA9dvrON6bCIz0OKjvq5sssKXGcEYu8wc9yefAW302/n4H71CGAbSwMWlJ9tSr/ISq8F8u0VeSSdJ+YlpGs7QRdMsaSI/AyWh3YacBzD3vUpqyH2RFhohWPvAAX/DKhkNjFPFZs7qjMGrjcjLtMDkVc0IIbQq09P38pOTw7P8n4mmg/63y0N4+8TbirF1q4I8xrzESsVOwcQM0JCcm5f9of2rLcITacFcPvH1KoSESywBJYeVuVXV/zlfv9z+fDV7Gk2Gytmm4tB2J+XSwAo5Fx9pT/m4w8oc+OqcatlQIdI5Gi/uChP7vCd9zn8LyiAB1F4TeU+rXNvwWl8QMJKOk+1lKYxx022YaVltpd++jdWfpf3df0EG0/IXJt9urM5UJGBwyQbF95wIJSk6JUBO7ZyS5g7EAs+6rYIe6p0pfDgRQj3FYpVdzRjWk0r6saMr9bmQjR2iMvEFkrcbSp0qb2wCvAtAE/kf761SJQWvPVxjEgoxDOD3qFDTXQ6sWpb8FAv34y4gTq4p40SX61XzOmu06oWWiIVuMSW24sit1rnG1LO/XZk6ArOtKh3SgT7xAxF78WS+KVNUypV5uDqQEpA0dAYK0e5Wzy/GWmE+iGNans9mEVxsMCuCDCUfpHitTKduMtJD1kyC8/4Jl3jaiSsgE41jhISvkJzy/5BEfFgOyqhDcG7Gwvd843GlZnS6EfDJyaIgB4Hdoee21829/HPf173a2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(478600001)(6486002)(41300700001)(31696002)(6506007)(86362001)(38070700005)(54906003)(82960400001)(316002)(31686004)(558084003)(122000001)(186003)(83380400001)(107886003)(2616005)(26005)(6512007)(110136005)(53546011)(71200400001)(66446008)(4326008)(76116006)(38100700002)(64756008)(91956017)(66946007)(5660300002)(8936002)(8676002)(66476007)(66556008)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b201RENiL2NrbmEyZXB4dTIvaGR5eXI3RUErVkw3dndNUmI2TVAxc1E2by8v?=
 =?utf-8?B?ZkhRaFJGQWdETXpHd2tXUkNINmNJdHpPVnNQK1ArTU9NWDlYa2F5dUtzU2lq?=
 =?utf-8?B?NUtUSklndmhJSXpzTG1jeWFZaWJhbUFzQTl6aHhPT0hSS1R6bWZXZU5tZlFO?=
 =?utf-8?B?dnY0VVZxaTRlRVA0bUhoNE5xNThKd0pkVy9lR1FUSW5rdVo0bld2c1BMUjNJ?=
 =?utf-8?B?VkpTbjZyQmhucjhpMk4vUHZNREpBOVlMWFMwT3pGOGFKa2dueVJzR0UrKzl6?=
 =?utf-8?B?UkxRcXhrUHlZa3dkK3NlWk03ek96QStFc2NJNEdEeFNqRmFFeVp4NnE1ak9D?=
 =?utf-8?B?MDVtaStqVkRqeUR1MFJlam5UY05vaFpoa2hHQXR4Q3cvT2R2OG01VDFuVXhF?=
 =?utf-8?B?MmZMUXhjTXNheXBZUGhTQXdPclBEWm8zVjR2MVBNV04yMENCYUk2RGx5OHVp?=
 =?utf-8?B?V0JpSFkwcDhSVGNXc2NHeU5PeEVrYjdxU0dMUnVFbTAyZyt5M0JiUG5jUXRE?=
 =?utf-8?B?enlLOXB0Zkg3VEFPdk1xN3ZJWVJmdm13MHZkOXh2cVk4L3VjaUNRTmg2SFFH?=
 =?utf-8?B?dkkwcGtKajhvWXRaWWJWVytlN2UxVkViRXFMcStENmQ1UlVYdWM2Zzdqa2FK?=
 =?utf-8?B?cXR2akFxSnUwMTBOYzR6UTc1L2x1VDNPalA2VGo2bUhTcGJLeGNSQmpBTEtp?=
 =?utf-8?B?NEVkUnZyZWtrbVN2azVHbjFsNFVYU2Rmc09xUXlSTXpLT3VjbG9USjAwd1I0?=
 =?utf-8?B?SjJCL2x5RGhOUnlSSGlhNVg2U2FPQW15WktvdVl1TldKQzhSMFUvOHZHUXYz?=
 =?utf-8?B?Sk5zU1VKN2F3WE56ZUxJUldsbG5IcVBVQ01UeS9uSU1ZTTJkbUtGUlF2YXh4?=
 =?utf-8?B?UDhxVnVMeklBa0R3ekRIWEgrU3BNbWIvLyszQ1BtR0RBL2hwNEF1am9TM1k5?=
 =?utf-8?B?RitWcTJ1QldVZHlpcnFLY0lJWUV3eDdqL1E3YkhuWEdFRkZKUEVwRjkvVWcr?=
 =?utf-8?B?RkwyTFZYWjVkSFNQdkNwU3h5d0F3MG9Zc1dvQ3Y0TmhBYzZkWW9NTGZEU3Ja?=
 =?utf-8?B?aktzd1NES3FMZWxVcG5WZStybjVhcGVrN3NIbWRXT0lWVndYazBrQmtEMDJU?=
 =?utf-8?B?MUpwblZIYmJBOUorYS9FOE9IaWI3VDBEUnpJbzY2MW8yU251OVpwRmdiSy9H?=
 =?utf-8?B?L3RXSXRHMnhMWDl0cEh6RGN6enZNVW0ybEhtcllLR1hONW9FU2hySWl1OTRR?=
 =?utf-8?B?OGFNSFNvQUwvSTVQN0dsdUFUZzBrSldHRFBOUFNZR0U2VFRwUlE3MDRDc1hp?=
 =?utf-8?B?TWxWN2FSV3k5Ui9sZC9lVGJBeWVxRFA3dUpNVmN2a3hQOEV3K0xIbXZNNXNl?=
 =?utf-8?B?dE1JS01uV2RKeUs4RENMZUw3WUtvTE51UjZiTUs3TWQvNTFRWU0xQmVhRVdN?=
 =?utf-8?B?dW1iUGRGd2NLZnVUdVpjQ0p4cTY5Qnl4UU5Zc1hjZ0FXbkk5RTdBTU03MVhT?=
 =?utf-8?B?cUZJRXdnaUR2RHkybmNVODFIVW1nOGxmcHVCMjZaaXErdTlMUXpQVVhTV0tH?=
 =?utf-8?B?cmdkN1lmNnpySkh5anFBYjc4aVdYUGx2eEZsWHJiZHpqU3p3QzQyTTV6V2dm?=
 =?utf-8?B?SXNsNzVVZU84RGxqU2xTNlRXVkJvN1c2Y0p3VGZKZHVsQ1BrTVdHWkl6MWVR?=
 =?utf-8?B?Tks2K0R0RlNzRlBId0JMeEs2NEVUeDBoTGxCRkdzblZrQ0tRSGVuOU1wWk41?=
 =?utf-8?B?T05Nb0FhM2EvZ1BlcS9DYXNpVHVMdGFhdzNWKzgxMFJOSi9CVHc0c1ltNTdJ?=
 =?utf-8?B?UGQrMXpjZjFlTzJIZFI1K2JuNGxMYkdwaDU0RU56bG53bGRyV0kxU2lveEY3?=
 =?utf-8?B?WDJjR0VMQWpOaytSeC8vcW8xU3l6ZGRzNENhOTZrd0FxVWVzNVhlL0FVckMw?=
 =?utf-8?B?Nk5kTDg5VENRM0dDZGdzVUpFdm1lV01zQUErbVhhQjJkSVk4enM4Uk03ajN2?=
 =?utf-8?B?RUs3OEg5SGdPSm9wZDIwRTRUbG5sL05jdS82Tzd2YWRzcElIY2Z2OXJreTdy?=
 =?utf-8?B?YmdUM0o4dkdXZExXSDZkODQ0dXN3eHkvWWV2Umg3S003TVlLR2JyNjlFa3BP?=
 =?utf-8?B?a21HSUhiUGZ3aS9leXJLVFlORWk5MU1TYVFwR21nT1hueEcyT1BUT2IxdGdz?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA90075D660B6944AFB4CE08D23BB19C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98031e47-2f70-40b3-7609-08da68d7ba93
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 16:08:18.3517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2R4KLajD+naYecMh6SF1EMv5/w0YvjEAHszACUOg9ubtGZBMDvsOJC8E6AK658VzfWDwRlLf9w679geUM0srMsCyBA8gzaz6u++coqsZ4cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5803

T24gMTMvMDcvMjAyMiAwODo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZXJlIGFyZSBjb21t
YW5kIGxpbmUgY29udHJvbHMgZm9yIHRoaXMgYW5kIHRoZSBkZWZhdWx0IGFsc28gaXNuJ3QgImFs
d2F5cw0KPiBlbmFibGUgd2hlbiBoYXJkd2FyZSBzdXBwb3J0cyBpdCIsIHdoaWNoIGxvZ2dpbmcg
c2hvdWxkIHRha2UgaW50byBhY2NvdW50Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

