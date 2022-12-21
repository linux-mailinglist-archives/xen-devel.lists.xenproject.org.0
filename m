Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1F6534E9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 18:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467998.727058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p82i7-0007K9-FK; Wed, 21 Dec 2022 17:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467998.727058; Wed, 21 Dec 2022 17:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p82i7-0007Hz-C6; Wed, 21 Dec 2022 17:16:55 +0000
Received: by outflank-mailman (input) for mailman id 467998;
 Wed, 21 Dec 2022 17:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p82i5-0007Ht-Sb
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 17:16:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 418823fc-8153-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 18:16:51 +0100 (CET)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 12:16:45 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5207.namprd03.prod.outlook.com (2603:10b6:610:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 17:16:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 17:16:40 +0000
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
X-Inumbo-ID: 418823fc-8153-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671643011;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=78hdFkhugtndbQfKW2oqZIBhlrh+qFFdBYZc/DoQjuw=;
  b=Gz+QN73YSA3oZ1IsdIVceMdXOpL/gpFxqO1nW/l+CbWTWjVLuDd4aWQR
   V77Z9Lw1nZAqsE5c2UQPWrA2v30/dK8Zt9+qVFDAVRSIOlv8iX0Wp8mLl
   p7g2v/qakyT5ehww0gli7W1dxNnzfy0ubemrA8fbFIVijUx9PBCeXbVrv
   I=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 91995855
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SGgV3K+oSI2WD6XmdTRxDrUDtn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WAZXD2EPv2DN2GnKN11O9m+900AuJSGndBlTgZt+Hs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6oS5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl08
 6BIKBAUTyuYqMGKwpOkb7Mzi/UKeZyD0IM34hmMzBn/JNN+HdXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTePilAuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqAdNDSe3lq5aGhnWV3EwsOkdJCGGpoOW9th+VZ+hYM
 RwLr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BXMDYAcUQA1D5MPsyLzflTrKR9dnVaSz3tv8HGmsx
 yjQ9HRhwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:AuQN+6DRLAL5Z+zlHemK55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9pYgBHpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qY/xTQXwH46+5Bxe
 NBXsFFeafN5VURt7ef3OG1eexQpeVu+sqT9IXjJ3gGd3AMV0i41XYBNu9MKDwPeDV7
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="91995855"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQa2v9LTLH7eor2FeCsx+XKa5EvYaCeX4TfkyIFc+6r1IvykZevbD5XS32+iZl8QNYR8JxfU3a3Pri0Ab0aimNF3y7XRD0QnMpnCehA8Q/4MmZpH9ppw6BkmS0Y8y1xkKL1pDcb4Py5oTrceHfIyrs3rVEf8Y/jcPIeKNjrL4YAHM+mA3BSbu3UMDtOHxvxEpt/fOo5pl1u+z5lAV1GLvaKUszyKSLEAhOIJs0ShfPE2J87u41rNjyNkOj4d9hjCXT7L8awHUxh9auw/kH2Cw+YH5km0m8UoSWAqeMtLPwuEl9Fxp5DgsF7Wwx1N2jJtNJcVwVu9lbRH5Qm69F//nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78hdFkhugtndbQfKW2oqZIBhlrh+qFFdBYZc/DoQjuw=;
 b=b9IkKW7AOFue8lFGTdHLshgNpEflGgE5NfTIWHWuPWc7P5mONAnyy5qOJTLeXoZ+rbysr419aPK6M31t3n0GZfxP1+uQTX/12P0LT5gK8S/WFGVesKrqnOmPEba2wAVIjzTZ5/PCphaqd2byhjgm5RIMYBWr8JxE+bAGfEX4GCI7ID85hlFgaTylw8CbhfSkRaTk2/mB/jSx5tTAUKbtfPIRd5d6x5LZ3VfRyXwW2lg6Nmz/ylYBRWiPRQK6A1aJLX0ErR3EOYj/uP0MrRLFR4eGZea8YAqGg48zWPzZsH6fQNFnAfumP6B6annHbuWs9a32IMEFo26J5UjB42ipjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78hdFkhugtndbQfKW2oqZIBhlrh+qFFdBYZc/DoQjuw=;
 b=Wj3PzJ1Pw5XTCS/cWl1Po7ibLrsjeumpbaQB0w2wJOhSyGQG9BUTO1wYqK0xfTeGpxQx4xYYHIMAR1I7WZa2Tara6UFIIyiYJBT1oytvKUuZroI/EV/jx5PcyzjgMr+V/PvMK65XEheCOScb1KLpwP40CmHryoeZnm6epZp3tUY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Thread-Topic: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Thread-Index: AQHZFT+yfO+11AII6U6krdJn3spgiq54lXqA
Date: Wed, 21 Dec 2022 17:16:39 +0000
Message-ID: <af33fef0-46f7-b206-53ed-33d66f0f008c@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <8d519e00-83c6-aee9-e7ba-523aa4265e1e@suse.com>
In-Reply-To: <8d519e00-83c6-aee9-e7ba-523aa4265e1e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5207:EE_
x-ms-office365-filtering-correlation-id: b6122077-68ca-40e4-380d-08dae3771fc0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 v1C0YI6+udqhiIJpbW2HDJUW0YUBvoobJYNOOw7iYyCR9fhvGC740CrGAvEWvXFcaETm1OqHLJlOjPe4wktusPOrwztMHIJlN/0aQhi1B5pNubGazuy7xQcPxnYmEpzHzWgcLzUlIAW1rU1y7Wv1a3xqXf7qeGwOGkfdesTH0Yhwfy5kfL1qP1xpw9mbjoOrOaO/mzhR6SzEdSak9L90BhLtATsMsYf0Kss9xUi8F80OqIsiHWNFEEQbAl3YoYUcOLMNW4qw0eJRESIbeVUzyQ6ns5syioMg+5zyDMuTG6oYJuauCtLfA0wLQ+rXQJ42Ej+oUvvWjsRa/IB7pX9zb3U0Zz5qVTzcRgdC6GMUL6OR6KSZZA+7lNneUzsR1DuyKrrbpXCnztzmjKiWmYckaEbUHSaPPx8d83istXd/HC6D2KJcICg4MVGkThuHcKcmMVdcjeERW/qsR0NBIXuCtNst9iEER2OUjeAx4/14H8zjFgMKIRyTd+rDED2kX8e5/VwW58UrK5xQtE5GwN2CnY/awjuFp8CQCoCr+B9GZ/6pYd4oLs9je3xFyN9fGJqJflBD31z65UmtUsA/a1alTTJ6RDDSm6DJPhIKBdYotXDVihx4ronRn9gGA14XtkB5J8wYpMuCjCjce0OWH8QICY2f9enu5pnyjiK9Iz9NP59Lrv5a8X4t2ygGVbm3QlqRH4U3eQkkisXW3D+A0G+GSiWsJlxDN4I09jjzD6k3E0IzI6DOggATCuNjqTlKtUF4NhbjdBLnLpsxyCTB8b2HyQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(66476007)(66556008)(31696002)(64756008)(91956017)(86362001)(66946007)(66446008)(76116006)(4326008)(8676002)(5660300002)(316002)(36756003)(8936002)(41300700001)(53546011)(186003)(6506007)(2616005)(6512007)(26005)(38070700005)(71200400001)(38100700002)(82960400001)(54906003)(6486002)(122000001)(478600001)(110136005)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkVRMVlGN0VwcFp6cDYvWUNLUTFwMk9uSXdjbTEyQVdwSnFjVk12VytzejdY?=
 =?utf-8?B?V3puaFBwRU1Mcm5OMGhkbVl6WXhXQXUyejU0ZVpHd0R3Um90OUdlZHd1TDd2?=
 =?utf-8?B?RkJlVlIzNmFySFQ2cFNWZUZKTFMzYllyRnZDWWFVZUFCMjFIZkkrekRDenlF?=
 =?utf-8?B?bUxSVjUvY0hGbDJvT1VWMTcrbmc3L1pWVGlTZU5tUm1aNmY1dmhjZm5RZk04?=
 =?utf-8?B?bm5pQzE0Z1VTdStFRUo2UWUzSmoxb2xnSm51cUR3UnFSc0JPRFRWck5NbGt5?=
 =?utf-8?B?WWtxRE53UC94VnBMTCtTNVVnUVY1MnU5bUtKd2FLNUZwQ01wUldHSmpoM3pE?=
 =?utf-8?B?QTFsVytCV1djYW9EcUZQSVJPTnoyNUdESUhuRlQvd0FKSjBINFgwZnJXcHVM?=
 =?utf-8?B?bHVveTV6d0g3QlFLS0lxZzlYWTBHOFV2aHZBd1hSdkkxcEZkRlQxN0ZNOTdt?=
 =?utf-8?B?ak04dFpCczBXV2FsMFowb2RLdUtMYWd6ZnYwdzVoaG9xVjNkT1RwRGdNbTJt?=
 =?utf-8?B?clQ0V0x4REk3UHV2dVRhR2IxUDU3ckV2SUhGdWpzanhwdzRjSmd6MXZ5UVBy?=
 =?utf-8?B?d0xsQnVRaVRDUnkwcU95SFcxSzZ5WHIvNkhtamRqVVkveGE1cWRYMFdvLzhq?=
 =?utf-8?B?QzFsZWluYnVzWnB1SmNrWU13M1lzaHkvWGQvdFZraVU5RHVqRFN3UmtJYmp0?=
 =?utf-8?B?U2g4L3RpOWd3Zm9DbXppY3FjNU1QRnIvUVlVSGFobnhYbi81TFU0M2hTZXJj?=
 =?utf-8?B?VGNONnQwbmZIclFjUzBWSTA4cWlDaStZQUMyckg2b28rTi8yUklzR2FGNXZW?=
 =?utf-8?B?SnlFOW5laWlTdmFZVUM2UUZ5aXlhZkFqT00zdTdESVdCL0RPZWxWZEZ0VVJV?=
 =?utf-8?B?S2xzZmN0L1pwVWgvSHZOWEl0MjZKQW5CbmNvYW5vODRRb1Q5cURRaFo5REcr?=
 =?utf-8?B?QTVSS3lzcEx1L2pEcHFVSWowL1ZlR0tuODNKdy9EbjE2emlxQkhJaHEwYnh4?=
 =?utf-8?B?MlBYd3IxSjBjY2xPQnlWTGtuYWk3am81K2JCYWpZeEYyRWZoL1hkY3NpVTZW?=
 =?utf-8?B?QUJFSExubDBnci9NekZVSUcvSm9LYmNqRE1sVUV2YzRkVmFoSE4xaGJrbXhr?=
 =?utf-8?B?YjhzY1ZXLzdOemZMV05LbUEvMUQyMURqRm5OZTgwelRuYlRtME9jU0thN1FY?=
 =?utf-8?B?azdoVkszMUg4NGl4bkRGM3ZEejJNVTVNR3hQQzlrekU3SUVXbUdnUVBOWHRl?=
 =?utf-8?B?TWZ1dUhEK3VKTlRRejlvTTUxVHNzZm0rZG9Ya2kzOTlwa0R0anVpQTdqd3RI?=
 =?utf-8?B?SnkrRDRTMENueDQ0Ujk0TnJkcUF3WVRtdWZydGtNQWQrYm15bzBNUkdoQTNQ?=
 =?utf-8?B?TGh0TDA2QkRGM3JSSkRJa21qUkFsZWNtdVZwQVIxS1p3T1pYbHEyalUzWkp6?=
 =?utf-8?B?c01pR0xGSUphRVBBT1M4RUdOd29JSmw0WDZhK3JPTVdEVU40bm1ZK293QVQz?=
 =?utf-8?B?MXB3bWxkNDRBYzNqWUVxVEJlQmVhWTI2MkJsV3plNklMOVA2M3pIUkZsZk4w?=
 =?utf-8?B?TERUcmM3NTMyUWJCODdQZ042bTdvMis2NVAwaFQyRW1IUWJMMjU4a2M2RklM?=
 =?utf-8?B?L2RLN1NIOVM3QlhJVHZEWk5qc1JjUWVrVFRJVTBUcmp1N0d1WGdSdzB2MDdB?=
 =?utf-8?B?NUNRVnhaZ0ZsOW1FRFQxNnpzZzlFclJoRHlLMTRnV2wvYzU0WnBIMm5sVHF5?=
 =?utf-8?B?aTUxQytmekhSTFAyUmZFNm52WnJmaXpwcUVBMEZXVEVjUTU2VEpDWnJDNS9J?=
 =?utf-8?B?VnFZZzRLUmM4aFhsOWJWZjN0cytOSHo3NTVjRTc3ejFmZmlZME1pZ2xMYk02?=
 =?utf-8?B?SU43cjdINlQ5WDVUcmNmMmhXSjFtSnFCcTVPNXhwM1ovWXZOMEVlMXdqR1BN?=
 =?utf-8?B?UDNEeGRycXoyTzFHWUFTdnNqMGlteW5mZ1ZjcnFJUUtPd0YvVy9Xa0ZLRENP?=
 =?utf-8?B?RGYxd0ZWczBMckU0ZzhuTDAvWlAzSGwvNE1oSjBPamdnQWdKVkk5azI1U3dG?=
 =?utf-8?B?QUR5bzhNSFdrbE1RcDlETTlwSDlrVlVma0k5OStRV0dkQVhjdzV2cnBsZ2Zv?=
 =?utf-8?Q?xeCk2Caz/SyqG3hs78tjXIwWQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88B5374A5E1E1A4DAA2A254815ECA1CB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6122077-68ca-40e4-380d-08dae3771fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 17:16:39.9494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Ricmy4jxjyaZZ+fDtfuDzBsXVQ6eGxbOZP9ewdUH6ACM/AMPHxzKpyJduu/pgRTfhB85wkIVfl5oPz7Xd+Gkb4vhenAC49Khcvyo1Kj+zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5207

T24gMjEvMTIvMjAyMiAxOjI1IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3BhZ2luZy5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYw0KPiBA
QCAtODQyLDEwICs4NDIsNDYgQEAgaW50IHBhZ2luZ190ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpk
KQ0KPiAgLyogQ2FsbCBvbmNlIGFsbCBvZiB0aGUgcmVmZXJlbmNlcyB0byB0aGUgZG9tYWluIGhh
dmUgZ29uZSBhd2F5ICovDQo+ICB2b2lkIHBhZ2luZ19maW5hbF90ZWFyZG93bihzdHJ1Y3QgZG9t
YWluICpkKQ0KPiAgew0KPiAtICAgIGlmICggaGFwX2VuYWJsZWQoZCkgKQ0KPiArICAgIGJvb2wg
aGFwID0gaGFwX2VuYWJsZWQoZCk7DQo+ICsNCj4gKyAgICBQQUdJTkdfUFJJTlRLKCIlcGQgZmlu
YWwgdGVhcmRvd24gc3RhcnRzLiAgUGFnZXMgdG90YWwgPSAldSwgZnJlZSA9ICV1LCBwMm0gPSAl
dVxuIiwNCg0KUEFHSU5HX1BSSU5USygpIGFscmVhZHkgaW5jbHVkZXMgX19mdW5jX18sIHNvIGp1
c3QgIiVwZCBzdGFydDogdG90YWwgJXUsDQpmcmVlICV1LCBwMm0gJXVcbiIgd2hpY2ggaXMgc2hv
cnRlci4NCg0KPiArICAgICAgICAgICAgICAgICAgZCwgZC0+YXJjaC5wYWdpbmcudG90YWxfcGFn
ZXMsDQo+ICsgICAgICAgICAgICAgICAgICBkLT5hcmNoLnBhZ2luZy5mcmVlX3BhZ2VzLCBkLT5h
cmNoLnBhZ2luZy5wMm1fcGFnZXMpOw0KPiArDQo+ICsgICAgaWYgKCBoYXAgKQ0KPiAgICAgICAg
ICBoYXBfZmluYWxfdGVhcmRvd24oZCk7DQo+ICsNCj4gKyAgICAvKg0KPiArICAgICAqIERvdWJs
ZS1jaGVjayB0aGF0IHRoZSBkb21haW4gZGlkbid0IGhhdmUgYW55IHBhZ2luZyBtZW1vcnkuDQo+
ICsgICAgICogSXQgaXMgcG9zc2libGUgZm9yIGEgZG9tYWluIHRoYXQgbmV2ZXIgZ290IGRvbWFp
bl9raWxsKCllZA0KPiArICAgICAqIHRvIGdldCBoZXJlIHdpdGggaXRzIHBhZ2luZyBhbGxvY2F0
aW9uIGludGFjdC4NCg0KSSBrbm93IHlvdSdyZSBtb3N0bHkganVzdCBtb3ZpbmcgdGhpcyBjb21t
ZW50LCBidXQgaXQncyBtaXNsZWFkaW5nLg0KDQpUaGlzIHBhdGggaXMgdXNlZCBmb3IgdGhlIGRv
bWFpbl9jcmVhdGUoKSBlcnJvciBwYXRoLCBhbmQgdGhlcmUgd2lsbCBiZQ0KYSBub256ZXJvIGFs
bG9jYXRpb24gZm9yIEhWTSBndWVzdHMuDQoNCkkgdGhpbmsgd2UgZG8gd2FudCB0byByZXdvcmsg
dGhpcyBldmVudHVhbGx5IC0gd2Ugd2lsbCBzaW1wbGlmeSB0aGluZ3MNCm1hc3NpdmVseSBieSBz
cGxpdHRpbmcgdGhlIHRoaW5ncyBjYW4gY2FuIG9ubHkgaGFwcGVuIGZvciBhIGRvbWFpbiB3aGlj
aA0KaGFzIHJ1biBpbnRvIHJlbGlucXVpc2hfcmVzb3VyY2VzLg0KDQpBdCBhIG1pbmltdW0sIEkn
ZCBzdWdnZXN0IGRyb3BwaW5nIHRoZSBmaXJzdCBzZW50ZW5jZS7CoCAiZG91YmxlIGNoZWNrIg0K
aW1wbGllcyBpdCdzIGFuIGV4dHJhb3JkaW5hcnkgY2FzZSwgd2hpY2ggaXNuJ3Qgd2FycmFudGVk
IGhlcmUgSU1PLg0KDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCBkLT5hcmNoLnBhZ2luZy50b3Rh
bF9wYWdlcyApDQo+ICsgICAgew0KPiArICAgICAgICBpZiAoIGhhcCApDQo+ICsgICAgICAgICAg
ICBoYXBfdGVhcmRvd24oZCwgTlVMTCk7DQo+ICsgICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAg
IHNoYWRvd190ZWFyZG93bihkLCBOVUxMKTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICAvKiBJdCBp
cyBub3cgc2FmZSB0byBwdWxsIGRvd24gdGhlIHAybSBtYXAuICovDQo+ICsgICAgcDJtX3RlYXJk
b3duKHAybV9nZXRfaG9zdHAybShkKSwgdHJ1ZSwgTlVMTCk7DQo+ICsNCj4gKyAgICAvKiBGcmVl
IGFueSBwYWdpbmcgbWVtb3J5IHRoYXQgdGhlIHAybSB0ZWFyZG93biByZWxlYXNlZC4gKi8NCg0K
SSBkb24ndCB0aGluayB0aGlzIGlzbid0IHRydWUgYW55IG1vcmUuwqAgNDEwIGFsc28gbWFkZSBI
QVAvc2hhZG93IGZyZWUNCnBhZ2VzIGZ1bGx5IGZvciBhIGR5aW5nIGRvbWFpbiwgc28gcDJtX3Rl
YXJkb3duKCkgYXQgdGhpcyBwb2ludCB3b24ndA0KYWRkIHRvIHRoZSBmcmVlIG1lbW9yeSBwb29s
Lg0KDQpJIHRoaW5rIHRoZSBzdWJzZXF1ZW50ICpfc2V0X2FsbG9jYXRpb24oKSBjYW4gYmUgZHJv
cHBlZCwgYW5kIHRoZQ0KYXNzZXJ0aW9ucyBsZWZ0Lg0KDQp+QW5kcmV3DQo=

