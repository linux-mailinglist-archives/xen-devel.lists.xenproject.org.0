Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5A4622D0B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 15:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441012.695251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslc9-0002Gs-3E; Wed, 09 Nov 2022 13:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441012.695251; Wed, 09 Nov 2022 13:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslc9-0002Eh-02; Wed, 09 Nov 2022 13:59:37 +0000
Received: by outflank-mailman (input) for mailman id 441012;
 Wed, 09 Nov 2022 13:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40hA=3J=citrix.com=prvs=30514606d=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oslc7-0002Eb-K2
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 13:59:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1b78e0-6036-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 14:59:33 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 08:59:30 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DM6PR03MB5020.namprd03.prod.outlook.com (2603:10b6:5:1e8::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.25; Wed, 9 Nov 2022 13:59:28 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 13:59:28 +0000
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
X-Inumbo-ID: bc1b78e0-6036-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668002373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=53lqmJ+nw6CoBPDdxqm7IMGChyE06LlyF8vVrF6SPLA=;
  b=E3B6EHi1miWNfP6pomhBO40hPYrHRY5Wu015L74t3/aewqVhdLVFRhIf
   Onf3+rAAhDi2BUquU5uYb0dF6CSkv28UY/94C14oCod82lb0HSy3u9gA+
   djb6r20zkITg9ArVIoZ0gUpHpNAByqj7W+lNicqI1a0jz82d9rSbAnmFe
   U=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 84473854
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EjqnjK5JiUV4NKHT+yXUkwxRtAbGchMFZxGqfqrLsTDasY5as4F+v
 jQdUWnVafrcZWSgf9ElPtyx8kgEvJbcxoBiGgE9/n9mHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkT7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 O00MykDRRm/q+/v8pipZep8lN0PBZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+SF3Nn9I7RmQe1enlyZv
 X7H9mK/BhAcON2Q4TGE7mitlqnEmiaTtIc6ROHkqaU63QH7Kmo7Nl4kSHSRvPCCpw2vdI5YE
 2cY3Hcjov1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebRwn0
 EWY2ezgAzNHuaeQD3ma89+8oTqsNAAPIGQFZCtCShEKi/H8pKkjgxSJScxseJNZlfXwEDD0h
 jqM/C43guxJidZRjvrnu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:sqW4G6yq5KTjtBUHij3tKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtqrQaC50YvLrf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84473854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoBDlx6F1D17chfBxBCH27sWDYiLmJ9HGROl0q5wGHbw7qOhqwkvIAXvOTpNYEjiV+3eOIIF7zJMQa5Feu4aSEvHMKU8Q+e9Ceu7E1PB8FDL8kDmQw+UlI+p3Xu6n5LPaO+6SBDhqQ9tO81L+RklF2hDX9FNwfYTCd0K25Kl9GKxxz2YDnttdk3iFmnYc3plA+mEqxM8iMBIhL7jO5YhxpdQxzgMvh3gUn82oWxQ6Ad3ivHZuoNtShRGO7qYEJi/YklDsI2XaX9rlbTZ4TDfYAk83lSf6c8uaGmLmP26blgOfQnZdhR8k5/ymOmxyHg3oVd/qoHfm+HIWe9zYdmiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53lqmJ+nw6CoBPDdxqm7IMGChyE06LlyF8vVrF6SPLA=;
 b=bVvfgrh1jenrJj2NVog3vEH5RbZweDA5RKTEruZiXEFoxQMCFLx+eToiHGqgYfpFSHvvgkQ1nVdQYH84bTrqtdQJruHz8qmSOf1jPVA0dGkSmYm+AIERJIgR7m971cj7QPYjRlB4esvsdyg+ZWhbBj9lk4Ik2Jm6VF7YjutUwyBWkS6zdYWDj3AVfL5Iatl3+EKBXWCcbU8pp+X6Jy0Z8m3725oVr+8kY8eK/kWVhJJ1rIHwMH47i7eBtyDN6HSnsbV+10n5+VDl9QBnvBPUVyP+sgC5zZm9rUOnzAabQnJXd1J2pxFNxpcgwZ/ald1+d0P7hG1ZckrLygDm2u0BGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53lqmJ+nw6CoBPDdxqm7IMGChyE06LlyF8vVrF6SPLA=;
 b=Q2fQ7BAtt1UsQIwvoWf54Q6NQhiEqmnp2EaIp4ywaFOEfYG07Y/n7jrKinZPgjnLdU9WB1ptCYwraJ3qf8952KLZWIfZlMv7CMFsmlffu4B24AO3lnuyI7JXhkp69ypsB6h6LTw7nn2+fF7Rdp4e1XInGSMG9lm9+00GvQJPkiY=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 10/15] tools/ocaml/xenstored: keep eventchn FD
 open across live update
Thread-Topic: [PATCH for-4.17 v3 10/15] tools/ocaml/xenstored: keep eventchn
 FD open across live update
Thread-Index: AQHY84hU2UIFubhrZESPqs29nIiL/a42n+KA
Date: Wed, 9 Nov 2022 13:59:28 +0000
Message-ID: <83FE853D-4BB1-437F-AF66-D342F41023B1@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <17575704fceda409bd5bb0056a94664ddc3ac2e1.1667920496.git.edvin.torok@citrix.com>
In-Reply-To:
 <17575704fceda409bd5bb0056a94664ddc3ac2e1.1667920496.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DM6PR03MB5020:EE_
x-ms-office365-filtering-correlation-id: 7c0a728e-59b4-4849-74ad-08dac25a9e10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 57B9BNWk+Q2QELongMfPWsgJh6jYuMSUY96tGOBU0R+FmhjsrMV10RAS1+83/7S2JoxoIVUtev444ZxcjWQP0bTBWrt6Bb3U0v6uJszZY3le++5yW4ZrC/Sva+B+jqCFOumRtskVU/lh+0GM8N+mLT0DRwnWaTAA0pLrnvdncz1x71Pn00tMNbzVMum9uccolmEBC2xx+EPCqKNMOtp9TmInp3BM7tg5f0HWRrMvlCos1kCT+lZRWxEJX+VWWu3PLmBncgMeZRKp8Ylx4FGUZ9aCj/nD2w5YCuF23e7l+p3u5dZpqHFs3zZNQFocbC3jOVal4aR3xRsHE7HH7DArK96ALMv9pmYxk6oedjWq08mgBBYy57oDhaZb92a8U8QGR5XyiLpXIbPSaSn4OZ5/U/iN5hk6mbfn+FXmkNvb755V2WH8733OeajAxMeG4ByTk/mt2qtAxqkEnkr4Rgly3SYHePmT3AFUDZvmYUcaeBw2NQQfli3qYrcXH10dM5BU/TZpf7YGaI4oQLSQEv3gheTdEgijXVItGKjjpXKe20HoCnt++mcmxYrDqWZ+u8isoD5uQcAojtudr+E2XENlkSya10jj0LeB+DaStY9Ws5JEoMk5F+R4ah4j0f0cwuamMs7lf7ldEdszOCwg1HwGmOlVCOoYyZiwZ7iWLWuByB4oExvNn6xmLKvDIxxR5eFVnkU/A7P7uCCct9mV7+22+1OAUUglpKjb5V7u6OmN05FYDsK7PUhvfMeTcZrie/MBKUXl8oAm2P6RqiWmrKcrONng2TEbDdxtP7QqvS4O7qw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199015)(8676002)(76116006)(91956017)(66446008)(64756008)(33656002)(4326008)(122000001)(66946007)(316002)(44832011)(66574015)(66476007)(6636002)(54906003)(15650500001)(38070700005)(5660300002)(37006003)(6486002)(82960400001)(66556008)(6862004)(8936002)(107886003)(38100700002)(2906002)(6506007)(83380400001)(53546011)(86362001)(6512007)(26005)(478600001)(71200400001)(2616005)(186003)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWtaOVBRMlhBcmxzRklYUlBGVW9pZkxwaWNrM1RBa2lDc1c4ME1pekNRNktM?=
 =?utf-8?B?blRnc1dCK1RBWjhSSjdnNkh5cTI4RWh1dkwvcTJIbzNWd1JXM1hYZkZIR2ZN?=
 =?utf-8?B?dUFEWVVNa3U0OUdWUkluejNoOFIwd1JPcWd3N0E3N1R5STZIdFNHYkVIcU9x?=
 =?utf-8?B?Slpjano2ZERVQUFla1ozQWpBVnR3VElyRHJ6SVJoRHJOUG0yb241RlNvZDFt?=
 =?utf-8?B?SVg0VUJqUWVnTlE2WnI2OTVORGVkL1RnSGdEMm1vUC8wZldvWko0TjNhMkRp?=
 =?utf-8?B?ZUdzVldxbENUNVZjenI3TFJFQ0d1TjFkdFNYNXpPWklTZ0NtSWMxM2gyRUh1?=
 =?utf-8?B?SmZRUk1BRUMxTGt2Mis0Uk1yYk9LMStISzJ6VjYra2Zwbis2SGl0ZGFaZmlu?=
 =?utf-8?B?bnF6czZJQ1BabmR1V2xYU0JvMFJUUHNOU2FVQzZFWlNvekxOeStLM20xemtQ?=
 =?utf-8?B?bEJEWXdwVmhtcGlsNHlqbjNpVjQwN3RQVXBFZ0pZMlcrYU5KT3pnblpqQUk0?=
 =?utf-8?B?akxoVjJyaHFBTUROdVl1WjArb1pVU3k3WkdjV1RMSnoySEF1UUxpS0t6RGRX?=
 =?utf-8?B?d0ZtYzRKSkN3NklWM0tsRFYyRzFBVGlQRmpjcW5nNFhpZnF5OEhKM3MwbmhQ?=
 =?utf-8?B?RERFVE9GZEJKVE5DTGJ2Z1Z6bVRmWTNtVVloNGQrMWk5WG1OMnUyeWFKeTJZ?=
 =?utf-8?B?RVlydmNoRDBNNlpHcW9hWjBnUnRkdk03NlY1dE5oZ3hDM21qS1dTZ21LY0sz?=
 =?utf-8?B?YVFXeUkyS3I3K3NyMkd5Wk9RWWZmbDR0Z01JYVpJY2tOSVNkK3BwSENhcm5G?=
 =?utf-8?B?NTVTVFREVGF1L2NiOUNZei9zRFpGR0RmOVBRZ01jakxuN0JpZWtCS1QrZ2sy?=
 =?utf-8?B?Y0RDaXU3c0JmUjY1VDBnd0RoNjJ1R3pwMy9mZnZ2R3hmamloYTNFQ000S2ty?=
 =?utf-8?B?SG9DSVpKT3l2TmNNSzcxVW1WcTBreklTVmF1eUY5VERXMWhhMTVLeTlZWXhI?=
 =?utf-8?B?MktsSTZaS1BRMlFFQWZBQ1hOblhDY0FXTm9wOEVYSmtIY1ZEY2pBRFFDU3Fz?=
 =?utf-8?B?N2RqSVB2SmdUYzdtazNtNFJVRnh1MTlRak9vRDl0bFBNQUtMYU0vdk5BcWdJ?=
 =?utf-8?B?OG4zejdWM3c5MlNPeWtKbm9YZE43S3RBRkdielBlL05pN2VWNHcyY1ZLdjdr?=
 =?utf-8?B?ODVHcmFld2l4SDdZL040TWRCU0JsaXZnR25ZWUExOWZsYk40cG8xRUsvcHlj?=
 =?utf-8?B?WFhpYVFtYjdlY1dqTng3TlIxK2dpdVk4bHRScVNabFZYaTRvOHAvSDFHWk1x?=
 =?utf-8?B?V0drRDBUVGVabW8vL0l5cXV2ZFhIaEhOUFI5VzMyNHVpdGpLYzRjVmd2anQv?=
 =?utf-8?B?WWM3TGlJNVBJL294QjRGeVE5NS93MDYwVW1EejhxTEVVRThZZEwyYkFQZ3Bt?=
 =?utf-8?B?UU9nKy9YZHpvM0ZYNWc0c1RLY1g2TUZCOXYybkZqTHY5WEYrMkNXYm9FS3dy?=
 =?utf-8?B?ckZrTWljd0wrQldKMUtISmJDejVDVENZZGduViszUkpmMFlSQnRYWjN4U21B?=
 =?utf-8?B?eWgzN2xkdFgycmJidDVQUlFVT2NXYmMwZXp4MUZxQXJOQ1Rack9UUnNQM1Jz?=
 =?utf-8?B?Tlo0L2JBeGNqSjNtaWNwZW8zY2wzWk5VYksrMS9nRkJvdmdPNm9yeXU4VFFx?=
 =?utf-8?B?c0FLcEVYZTNSdEV5cmlkTGNqKzZjK2s4dlZ5a0xJVEtkS2NtN3ppMHgzc1lE?=
 =?utf-8?B?YTVDZG9qV2c4NkVKMThPVG9lQWw5WXBtM2hlZ2dRR2plaTkxMUJVRzQzZXRR?=
 =?utf-8?B?eE1GSkplcmQ5UmRCKzI3RUdUMllLdnBpTUx5OGtMNFNpbGJ3a3o1MnBFL3My?=
 =?utf-8?B?U1I5RHhkRktvUHV6TU9oSTkycWRRbXNsSWdnek5JeFNZU2Fzcmk0eTE5MDhC?=
 =?utf-8?B?d1FBRkZsK0hmVTExTzlkcGpWRGtoOVhnMTdpMXY0dDlpcDdhOXd0Nlg2Wmsy?=
 =?utf-8?B?d1NPQ0trdDdybUU0RzcvQkNSZjRHUUlGSG96QlAxT0svY2d3SS84S20vMDdw?=
 =?utf-8?B?NmFoTlRLSndpa21XWVFrZmZ0eW9ieXArSXJoYnYvZ0pwVUdWeVNQWjBUVC9U?=
 =?utf-8?B?Y1ErcHZwS2JRVTBYR0ZEQ0ttaVI2Ni92dnJydENGQ0lFNlk5VWRxMHZKaU0w?=
 =?utf-8?Q?qnBbATFkZ/hZuma7vv5+qCA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10373BB03753144BA9040EFC11F79EFC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0a728e-59b4-4849-74ad-08dac25a9e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 13:59:28.0757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNvqSq+jGUlVpXWSOa/kwZD+BA7ejGYFTKY+4A0iiovgNCyvqmww0b7IUTaEcoWsB7eZDvXMdKhAgVwONAGrDgw2yH8NSucsHlc0ot0LvyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5020

DQoNCj4gT24gOCBOb3YgMjAyMiwgYXQgMTU6MzQsIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gQXZvaWQgdGhpcyBieSB0cnlpbmcgdG8ga2VlcCB0
aGUgZXZlbnRjaG4gZmlsZSBkZXNjcmlwdG9yIG9wZW4gYWNyb3NzDQo+IGxpdmUgdXBkYXRlcywg
dXNpbmcgdGhlIG5ldyB4ZW5ldnRjaG5fZmRvcGVuIEFQSSwgc2ltaWxhciB0byBob3cgQw0KPiB4
ZW5zdG9yZWQgd29ya3MuDQo+IA0KPiBIb3dldmVyIGFuIG9sZCBlbm91Z2ggb3hlbnN0b3JlZCB3
b24ndCBoYXZlIGtlcHQgdGhlIGV2dGNobiBmZCBvcGVuIGFuZA0KPiB3b24ndCBoYXZlIHNhdmVk
IGl0IGluIHRoZSB1cGRhdGUgc3RyZWFtLCBzbyBoYW5kbGUgdGhhdCBjYXNlIGJ5DQo+IHJlb3Bl
bmluZyB0aGUgZXZ0Y2huIGFzIGEgZmFsbGJhY2suDQo+IA0KPiBBIGZvbGxvd3VwIGNvbW1pdCB3
aWxsIGF2b2lkIHJlYmluZCB0aGUgZ3Vlc3QgcmVtb3RlIHBvcnQgKHdlIGNhbm5vdA0KPiByZWx5
IG9uIHRoZSByZW1vdGUgcG9ydCBzdGF5aW5nIHRoZSBzYW1lLCBlLmcuIHRoZSB3aW5kb3dzIFBW
IGRyaXZlcnMNCj4gY2hhbmdlIGl0KQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2
ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4gLS0tDQo+IFJlYXNvbiBmb3IgaW5jbHVzaW9u
IGluIDQuMTc6DQo+IC0gZml4ZXMgbGl2ZSB1cGRhdGUgaW4gb3hlbnN0b3JlZCwgbWFraW5nIGZ1
dHVyZSBzZWN1cml0eSB1cGRhdGVzIGVhc2llcg0KPiAgaWYgdGhlIGJhc2UgY29kZSBhbHJlYWR5
IGhhcyB0aGlzIHBhdGNoDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAtIG5ldyBpbiB2Mw0K
PiAtLS0NCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbnMubWwgICB8ICAxICsNCj4gdG9v
bHMvb2NhbWwveGVuc3RvcmVkL2V2ZW50Lm1sICAgICB8ICA3ICsrLQ0KPiB0b29scy9vY2FtbC94
ZW5zdG9yZWQveGVuc3RvcmVkLm1sIHwgNzEgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
DQo+IDMgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pDQoN
CkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+
DQoNCg0KPiArICAgIGxldCByZXF1aXJlX2RvbXMgKCkgPQ0KPiArICAgICAgbWF0Y2ggIWRvbXMg
d2l0aA0KPiArICAgICAgfCBOb25lIC0+DQo+ICsgICAgICAgIGxldCBtaXNzaW5nX2V2ZW50Y2hu
ZmQgPSAhZXZlbnRjaG5mZCA9IE5vbmUgaW4NCj4gKyAgICAgICAgaWYgbWlzc2luZ19ldmVudGNo
bmZkIHRoZW4NCj4gKyAgICAgICAgICB3YXJuICJObyBldmVudCBjaGFubmVsIGZpbGUgZGVzY3Jp
cHRvciBhdmFpbGFibGUgaW4gZHVtcCEiOw0KPiArICAgICAgICBsZXQgZXZlbnRjaG4gPSBFdmVu
dC5pbml0ID9mZDohZXZlbnRjaG5mZCAoKSBpbg0KPiArICAgICAgICBsZXQgZG9tYWlucyA9IGNy
ZWF0ZWRvbXMgZXZlbnRjaG4gaW4NCj4gKyAgICAgICAgaWYgbWlzc2luZ19ldmVudGNobmZkIHRo
ZW4NCj4gKyAgICAgICAgICBFdmVudC5iaW5kX2RvbV9leGNfdmlycSBldmVudGNobjsNCj4gKyAg
ICAgICAgZG9tcyA6PSBTb21lIGRvbWFpbnM7DQo+ICsgICAgICAgIGRvbWFpbnMNCj4gKyAgICAg
IHwgU29tZSBkIC0+IGQNCg0KSSBsaWtlIHRvIHVzZSB0aGUg4oCcd2hlbuKAnSBjbGF1c2UgaW4g
dGhlc2Ugc2l0dWF0aW9ucyBpbiBvcmRlciB0byBrZWVwIHRoZSBtYXRjaCBjYXNlcyBmbGF0IGV2
ZW4gYXQgdGhlIGNvc3Qgb2YgYSBzbGlnaHQgY29kZSBkdXBsaWNhdGlvbi4gQnV0IGl04oCZcyBh
IG1hdHRlciBvZiB0YXN0ZS4NCg0KfCBOb25lIHdoZW4gIWV2ZW50Y2huZmQgPSBOb25lIC0+DQoN
Ck9yIA0KDQptYXRjaCAhZG9tcywgIWV2ZW50Y2huZmQgd2l0aCANCnwgTm9uZSwgTm9uZSAtPg0K
fCA=

