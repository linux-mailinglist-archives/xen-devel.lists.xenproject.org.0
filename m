Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA84C8DDC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281545.479924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3b0-00005k-VU; Tue, 01 Mar 2022 14:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281545.479924; Tue, 01 Mar 2022 14:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3b0-0008Tn-Qk; Tue, 01 Mar 2022 14:35:22 +0000
Received: by outflank-mailman (input) for mailman id 281545;
 Tue, 01 Mar 2022 14:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI9j=TM=citrix.com=prvs=0520bb690=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nP3az-0008Tg-Ep
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:35:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1066318-996c-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:35:20 +0100 (CET)
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
X-Inumbo-ID: d1066318-996c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646145319;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RIry1fOwgDOAhhdNZBm4dA+nFybFDJJ02i51Nkot6Mw=;
  b=SYSvDnzSAHisyHGZ9ap3QYX1jONDJBbN0U8QSBQH2WsEm1IlfG7xxafj
   Cm8TWIA/lXf9Hd/8dkiuRvmq6U49Mx0yGlMqxwCs0ozRCAvwBi48ENjCC
   Z0IqrLpfIuO+87Kve3bmvwdALtLsB7ANHliD19JHgqqm4MmW72QfStJ+M
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65122601
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6ZJvbaJxeUIXCfTXFE+RzJUlxSXFcZb7ZxGr2PjKsXjdYENS1DVTz
 GAeC2zTa/fYZ2ejct9/adnn/U4DsJWGz4cxSFBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dYx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Mlxj5iCexVyAvHFveIZehcGIWZxBbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6uHP
 ZBHMWMHgBLoOSUWKlhHN60Hl9yMnGOjQmcfpn/OnP9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcJ0WPK218LhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJML9c+2jOfkZaI6iOfAkEKEAwGZ+Q54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJc8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBkxbZ1aJWawO
 R67VeZtCHl7ZiDCgUhfOd/ZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXGGodZOdglRdRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvc21mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:lvUFNKwThFY8ND8YH9CJKrPxguskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQho+bo7bWvHAbocYa
 FT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsuYDcTYciFcryKJmYRrPvHm
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65122601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud0D7KWKwR5HreP7O4N3VXBGd/tNEok3yj2fthRAwtl67+Fh9YMFcmVa1HSgy2wp+wPXrSy2IL3tgfAf/aifUCyLjCRZt97ghZHRPECqmzJVqdpNrSEsAd/bzfLEsrbxnFuWzAXT5otdJDFwBUHM7uvZIyK8WQoVISExkzoV3S1CwdYp+SX1fp5GAJ8DjKA8Ylf8wvEMRpC1qw6HlzXxjaEHOxj+ZY/hvfjqXInhOMpkl21Ly3LlwAxYirhGIgKF28qK3gFroWKFE/D3jKHGDieHv7jZJDlNtBu0rHhyAK0pwlYPcdWkQvjQPS2TlT6761/iGENKojlJi5JDtxCLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIry1fOwgDOAhhdNZBm4dA+nFybFDJJ02i51Nkot6Mw=;
 b=inQN0SYw0XGZ/EJ+uJwgnROxfWQNx5khB3N0e/wt/ClR335+lxZ+DFGYctOi8yFd8TLmo+LupS9QE0brkFiJhIT+HeUwvZF21VStFE/oSIrlZPyFyoCs7lnVWj3J8w0BJdsXw2Lhk8KVbR5oWkM5CwFhqQmX5tf5rSQsfk5ptNU8KHbY51NBAZPUI3hNATgDr7XXqdXBfAS2MyEj6t+Nf94YTdNQiLcZq3aOeuIqKPtqqyn5BdJr5sfyF8LAW2nm8y7a/MTW4Cd/O4L+FLREtsbS8+e0ZOTcIJozHtvkVibbfYhbyo+WW1+fW+c74flJvHSTq8kHE6HDUwjPd8iT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIry1fOwgDOAhhdNZBm4dA+nFybFDJJ02i51Nkot6Mw=;
 b=tJKkDYODkdKA3OgIBmNn76aJY3Vija9AaAFaw0h8yInYWPKn62zGlORpu5JVEYI8z/7UhGw1L3ol49SK9iukFRKlTR6zJVtWOWWz6TY54Qgo3g8zHVeohHSwKxh2uCLXfVbLR5INQGsqh882Yy8HSezWm2GD3J+pKk3AxPMsK/I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/time: add CF-clobber annotations
Thread-Topic: [PATCH 2/2] x86/time: add CF-clobber annotations
Thread-Index: AQHYLVxwam4XOlcoM0qksn/nZK0dPqyqgvIAgAAQwwCAAAGngIAAAwqA
Date: Tue, 1 Mar 2022 14:35:14 +0000
Message-ID: <bbc32813-74a2-f5c3-d616-e5fcdeffcd10@citrix.com>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <61bbf544-74ac-b698-425a-d1db80acab43@suse.com>
 <20185a89-0a2b-6bbd-5484-31b6582ed200@citrix.com>
 <40ce913e-4388-2d2f-45e3-e725a927da92@suse.com>
 <ae77b805-b513-7aa7-ece0-c3c7dbf662c1@citrix.com>
In-Reply-To: <ae77b805-b513-7aa7-ece0-c3c7dbf662c1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: caf351aa-73e9-4045-22af-08d9fb90b2d8
x-ms-traffictypediagnostic: MW4PR03MB6458:EE_
x-microsoft-antispam-prvs: <MW4PR03MB64589CD27BAC44B6BB8EEB4FBA029@MW4PR03MB6458.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IZ8lP/gkC+nzp44go3t55jDzTK1nt0qUd8e4l+SsApbmEqn6bLdCqg3pXqG/hMMXeTN4SIPaZHiHrrRn8bowdxbWslljP8JjKsxXxURMm10jpluVEbLuIuogyVwXlSkMEVWMcmw06tMLMj3CFCx8LB7vTOb/xchQ8QzcebQY3IGz1/9CWH+mfbyrH8MmQJXpC5XU4HcAs4ex/192F0P0RsYMtZTfB/dv438nnAY1c+OMH3MQRUM81Y8X7cAlwFpvQGR9JPpuh6onGDq3/H/pSYZI0fE8M2XvflwnkqSCliGwBr2v+bZKsq6xUga50JaEOjpo++XqYJRwEgT0CLr+csifUKuoCi9pNRfNk+2YOnIFBZC6mimXyVW7+T88CHld7pRp0ILCeQKdr3CETP3DWSjjq6IMJcFvzZD6zuqWfCUEdX/73TGXlbgco+Pgy6dfNqHzjWlD31aAn90KVj1Vox7q/JDS/h6LMlTWKIgcSiLkmNyQLb7TAEvdmxY8DNBFbeGby1wu/9yTeXYNexM9RajW2pRCEkg2/Q+jg/NaaABm5R/sd9Vg30PmNbF7N/StCBjefF+5E38Ku2cywEhWe6ask5FrQNBhM/G6vLe173wbPjI/eCS3VlmSa5mlB16QmzuU6Pfo7Wu7er8bux3pOzD38mFvugYzQZBkmOxxIbnm+VVMycuvymBTbnDm0tBWvKqVjFzFzE9bA/alrSMwhOUeEPs2NYy0f/O/hYfkHs6x0RPTI9CiPxv+vHh1oLPSPbtoexzBUSD72tuuPZ5xkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38100700002)(2906002)(76116006)(71200400001)(26005)(5660300002)(8936002)(83380400001)(31686004)(186003)(6512007)(36756003)(2616005)(6506007)(53546011)(6916009)(54906003)(4326008)(8676002)(66556008)(66946007)(91956017)(66476007)(66446008)(64756008)(122000001)(38070700005)(86362001)(31696002)(6486002)(316002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3hBODZrSGdKYTFGZkZxaGE2M2c4eDZ4Rjl3S2hyd1NEbHZOdStXbDBBSEJV?=
 =?utf-8?B?UzQzSEJnOXhRZURUMVBjRTh6cXc1Zk1leER6dHY5cG9TMmJLZWNjalBDb01T?=
 =?utf-8?B?MkYyeVRCckFYT1IvTEVtWnA5M0w2anlYc2lQY3RwUG4zdFJkTFhVQlVjUkxX?=
 =?utf-8?B?SnU5dWFvdlhmWFV4SEhYOVA2cEpyajJQSmVUTUNVTHpUeWhlTTM1bVRmaWFq?=
 =?utf-8?B?ZllOUFNyQ3o2c3RGUStJWjZiU2lUT2N2WGVVZFVLUlNzdEM4L3pBcFF5UXha?=
 =?utf-8?B?eGw4OEcvTGdkVUVpaW4rNlpWTjdKZUgxcEM5MkNYL2pTUTVQc1VHeFJNemNF?=
 =?utf-8?B?ODVEUGd0TkRzMldXa0FXOVZTaWhEd1JoUlhiYkRzOW5FVzc2VmRkSXV6K2pU?=
 =?utf-8?B?OXlPUmx5eWVHbXlpVEcxcktnZGh4S0g3Q0MvcWtIYVV5dmF3SGcxY1lwS1E1?=
 =?utf-8?B?TWhpMVpueHp0bTg5ZVpNcnhmOE0wYmRGcFJ4NXVkZlh6Uk80eFpIakxGVGlo?=
 =?utf-8?B?eTVoa1BWOUI5VXcwYTQrc2N4ZEh6MkpuNVZDbnNkazNhaThTdm9IWUdoRkhx?=
 =?utf-8?B?OVZmSUkvWlkycjZ0ZW5WSzJ5THR0cHdiV2gwK1o2a3praXFRV2NIa2VYeXox?=
 =?utf-8?B?YWcyajl0aG0zREFqVkk2WXR0bFZCQ1V2KzRBcWtmR0Z0ajM2SDdFNTZJWmZl?=
 =?utf-8?B?Ris2R1kyYW1udnRseTR4UXZYN1VTT2txZzBNSVBIa0Fia1RhZEF2REVjb3Bo?=
 =?utf-8?B?TnNvUW45N2xaRzJpaHhkbmJiSEcrTCtIMzBlcXFSS3gySEtJMjBnTVVtRmFN?=
 =?utf-8?B?SnpDWCtlRmJ0UVRhSWtrMGdvRG5YWi9nRTByVkNvMldqWExmaE1KQzhIL2dH?=
 =?utf-8?B?TGNBQmF1OHI4V1VPQWRnNkQ0YlhFalI1MzVlY3ZWeWhYdVA0b09YdE5Ddnlv?=
 =?utf-8?B?UkNKSGMvZkFlenJKV2JMVHdkT0luRmd6TTFYVWNCLzZrVTFaMkZsS3F3VzNE?=
 =?utf-8?B?UUg1Sm43ZVRWSVVtdmt5ZmJQYTViZG5rb2sxQW9RYzlkTHFKYytveTdBWE96?=
 =?utf-8?B?Sy9PN3hGUUR1WTErOHNMdnFQTGZycWlGNllrTjhmSisza3pzNUR3MTJYQTBQ?=
 =?utf-8?B?dmhUeDUweDYzSVJjcWgrbFc1bUZhZkZ3Q3lETnZVYm1FZU1lZHYxMUM4ZGN6?=
 =?utf-8?B?WnJwaGRMdis5Y0VQZXAyaFdJQTJhT3k0RTlzVUVtTkMyQi9rWjNteFRUR3VE?=
 =?utf-8?B?U0xZZmxGWmlBVVNPL0o1ZGFPZXhOYVFvN0xRUlNLbVJobHc1MTVWcWtoL29K?=
 =?utf-8?B?RWNLbStwcElQUk9rN3g5MkE3Y0dkcFdCUHBZVW56MDFuNVA5eUNHd3NSVUEv?=
 =?utf-8?B?cnVxQkdrOVFKOHVUVElvSWFUWlF3QllDRlBuWk9DWGt5VGllK2czbVFsYm03?=
 =?utf-8?B?NkY1L2lKb0lzY0J3WEVTNTdub0RxN3VDUkU5aHVBZThRV2hsK1ZxTHo1dzl5?=
 =?utf-8?B?d0Z5b0hlV1ZYL21kNWpxYVlCMStSd3pyRU1NYVhhVjYwL3lSMktmUXFBTTJj?=
 =?utf-8?B?aHNJZ0VaOThtYzUzYk9oeGNhL0U3RUx1ZUdjNlFTRjhNYXB6V2R0bXBRWVNE?=
 =?utf-8?B?U2JsTisvNnplQnlOdUZxRjB4c3o2S0g0RTdFTEh2T09rVUdUamFsU0FuZDNK?=
 =?utf-8?B?Uk5hWU4vN09CaW9JS28vYi9wMGZVWDFmcmR6V0FsODZTb3luV2dPWnJocFFi?=
 =?utf-8?B?ZXpWWklVNk1DMkFyd0lzSDlxUTJsbDJFUGN0SGJQcVNtakR0TldGREZ0V2dk?=
 =?utf-8?B?NnRIaENydWUvbjMyNFFYL3ZUcnpOS2dLQ3FmelhMR1hNR1h2VlZ5elRVbVRa?=
 =?utf-8?B?WXVaS2hwWjBPS0tsbUdhTlFJQXMwaXZzTUVsbUpRcStHWGhZRGFWdG1ETUpq?=
 =?utf-8?B?MGNsV1dqTGU4M0RMTktXNXNpTGhLT25EdTNYMGY1TXVEVmk2VTVpWjBwc3I3?=
 =?utf-8?B?SytHS0RFbm9VUEZNYVdiSGxLRFNya3ZuaVp0RkZJT1RHbkF0dWlCb2s5MUVm?=
 =?utf-8?B?UkFLd1RHbVlqUnpaOHBUc29yNTV5RmJsWmlXVWIvY2p0ck1VanJWa3dGYlNI?=
 =?utf-8?B?OXR0MkJUVDcybjR0S04vVmM5UFlKeW91elBwT2d0RlBuamhDZ3I0Y1BscTlB?=
 =?utf-8?B?UFlMeTF0aEJFZDQrc3RNcldTbU05ektuL2xMS2UyYytpdGptUWZCd2Q3SXZj?=
 =?utf-8?B?a2JNNHl4QVRaeVNldkJ0M2VjaTJnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E824280FC02FB4F842E6FA8106318B5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf351aa-73e9-4045-22af-08d9fb90b2d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 14:35:14.2913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OcudNISJxXkB7A2HyM0KSabOTgLqaZ96zfIN4X9RCyef7juu9jkwnR8X/Jmm9y2Z3MxTK2OVyWDhXcDGusl4Lj0+YEYCsBJTHWd5hC54TBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6458
X-OriginatorOrg: citrix.com

T24gMDEvMDMvMjAyMiAxNDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDMvMjAy
MiAxNDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMS4wMy4yMDIyIDE0OjE4LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDAxLzAzLzIwMjIgMTE6MDYsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBXaXRoIGJlZDlhZTU0ZGY0NCAoIng4Ni90aW1lOiBzd2l0Y2ggcGxhdGZvcm0g
dGltZXIgaG9va3MgdG8gYWx0Y2FsbCIpDQo+Pj4+IGluIHBsYWNlIHdlIGNhbiBmdXJ0aGVyIGFy
cmFuZ2UgZm9yIEVOREJSIHJlbW92YWwgZnJvbSB0aGUgZnVuY3Rpb25zIG5vDQo+Pj4+IGxvbmdl
ciBzdWJqZWN0IHRvIGluZGlyZWN0IGNhbGxzLiBOb3RlIHRoYXQgcGx0X3RzYyBpcyBsZWZ0IHVu
dG91Y2hlZCwNCj4+Pj4gZm9yIG5vdCBob2xkaW5nIGFueSBwb2ludGVyIGVsaWdpYmxlIGZvciBF
TkRCUiByZW1vdmFsLg0KPj4+IEknZCBiZSB0ZW1wdGVkIHRvIGluY2x1ZGUgaXQsIGZvciBjb25z
aXN0ZW5jeSBzYWtlIGFsb25lLg0KPj4+DQo+Pj4gSXQgaXMgbGVzcyBsaWtlbHkgdG8gZ28gd3Jv
bmcgaW4gdGhlIGZ1dHVyZSBpZiBhbm90aGVyIGhvb2sgaXMgaW50cm9kdWNlZC4NCj4+IENhbiBk
bywgc3VyZS4NCj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4+PiBXaXRoIHRoZSBjb21taXQgbWVzc2FnZSwgSSdtIG5vdCBub3QgY2VydGFp
biBpZiB0aGlzIGlzIGxpbmtlZCB0byB0aGUNCj4+PiBwcmV2aW91cyBwYXRjaC4NCj4+Pg0KPj4+
IE92ZXJhbGwgaXQgbG9va3MgZmluZSwgYnV0IEknZCBsaWtlIHRvIGdldCBjbGFyaXR5IG9uIHRo
aXMgcG9pbnQuDQo+PiBDb252ZXJ0aW5nIHJlYWRfdHNjKCkgd2FzIGRpc2N1c3NlZCAod2l0aCBS
b2dlcikgZWFybGllciBvbiwgc28gSSdkDQo+PiB2aWV3IHRoaXMgYXMgYSBzZXBhcmF0ZSBjaGFu
Z2UuIEFzIHNhaWQgaW4gcmVwbHkgdG8geW91ciBjb21tZW50cyBvbg0KPj4gdGhlIDFzdCBwYXRj
aCwgaG93IGV4YWN0bHkgcmVhZF90c2MoKSBsb29rcyBsaWtlIGlzIG9ydGhvZ29uYWwgdG8NCj4+
IHRoZSBjaGFuZ2VzIGhlcmUgYXQgbGVhc3QgYXMgbG9uZyBhcyBpdCBkb2Vzbid0IGxpdmUgaW4g
LnRleHQuDQo+IE9rLsKgIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KDQpBY3R1YWxseSwgeW91IHByb2JhYmx5IHdhbnQgdG8gbW92ZSBwbHRf
c3JjIGludG8gX19yb19hZnRlcl9pbml0IGFsb25nDQp3aXRoIHRoaXMgY2hhbmdlLg0KDQp+QW5k
cmV3DQo=

