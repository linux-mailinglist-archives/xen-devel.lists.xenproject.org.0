Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97340B07A99
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045441.1415565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4cU-0003HZ-He; Wed, 16 Jul 2025 16:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045441.1415565; Wed, 16 Jul 2025 16:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4cU-0003Fg-El; Wed, 16 Jul 2025 16:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1045441;
 Wed, 16 Jul 2025 16:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLWN=Z5=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uc4cS-0003Fa-Qw
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:04:32 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8992e3f7-625e-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:04:22 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV1PR03MB10256.eurprd03.prod.outlook.com (2603:10a6:150:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 16:04:18 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 16:04:18 +0000
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
X-Inumbo-ID: 8992e3f7-625e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDXwxkuJir4SQ7WP+fJ2x1LdmWlcYGjJa1QGMzcYQufihMPsWDVYDbch2fl6+IvUsNgm4Of0m3NEtL4hpEjhsCkZB4fCvxKbRRkBgB2MohOUi1KOEJ1s9N8VO+mSKSkXQVeUSGAjGLV7uLdNkN5q9EYLdikGkTe5QToKlcFzCtXSsmkZ538rEnJkwWssb3T2Nn7HY4PNpOJvy08SU3FGTFPYssNkzWAb4YPnhGgm23sHAk1K5J+mcWQmX3d7jh2I156spWcASb9ftLcsWdNu3dz0ygLwVa6+wnNxrorWlKGYpv83S5aUxRtDSuXaAReFX8BrEuXZHPMsJFFTJQzv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq4KbR9GdbgLH+eXbqeJoRm380fhEdRIH2mLfKvyUPg=;
 b=qd2Z6TKrmd5KotunDNECazQQJ6kok4iT4BtkM1eKk0ec3V+cHvZu1hAH93cfTh8KQ4FPvSwi5/gCYvM/+AyZXxJiZtZ7oEQ8F02YhNcOKpEyFXbMSK2Sih5dUn/cYTs5gQx+45STvlY7gPHNCD1qU+YCx7eLQZjNdOvRMcSKfM+uBbNBbbp0yQqqe2Fv0KyvKFjFgJ9BZtUaSx5vRa+Y59AxRezre2VuCFbwYHmMnX7CuP/Y7kIEIV4Waf0PrAm8odNwnq6Zuz0Qhb5tBA5naPZ1ARu3+KFNhepyxZJQWxoF89SvU2tShg9RRsGco/xMKdLP/IicPWRjxG3gZ/JGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq4KbR9GdbgLH+eXbqeJoRm380fhEdRIH2mLfKvyUPg=;
 b=kF7rcyAW2Wnmbmbzuz5F/Wjk8mIYRSDN0ZRr+yT868aEcWFtCcFXIxraTsBB92TaYzrvKZjlsgisBTdxM1ECznXV0mFDp0rFKJ45wx0WQ9jOxeMIMGoSC39sv6iY513Y/rUl9duAfIj+Dyc1ZvA2VxiGwxWCS7estO8mo9ib46igTXdv47Phdsq0/x1o9pBmaIpUANI9SJzk5vrHcX74ucwnPicxNEY3jot81UMJU8PkZqmJB91VvAsZnXTIy4r7E7KSPy9JMKJrL14nGA8NImWKYwnyQvT9OL5wYzIwI8/96pyu1w4JB3rmVW5TsTur1qLfdAohR7rI9aQxdUeqFA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Index:
 AQHb8RnNNQ6jd6+ExkWCWY/+NTwtQ7QsmXCAgAEYpgCAA5T3AIABsXIAgAAERYCAAAGLAIAADAoAgAHqAYA=
Date: Wed, 16 Jul 2025 16:04:18 +0000
Message-ID: <312509c2-fb06-4fef-b632-c4719264efb8@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
 <e47fafa1-e02c-432b-84bc-44c48af66859@suse.com>
In-Reply-To: <e47fafa1-e02c-432b-84bc-44c48af66859@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV1PR03MB10256:EE_
x-ms-office365-filtering-correlation-id: 733fb914-6cbb-4797-557b-08ddc4826b77
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1h5SVFzUTZuUzUrWW5xam1LT21oN2dJQmd5Sk9LVUxhWW1oeWhpb3NGY3pO?=
 =?utf-8?B?Tyt6Tndwek91ZCt5V0FwK0RVRkpzODFDSU1ZSFhYM2UrVldNMEx5MHp4c2g0?=
 =?utf-8?B?U1FjVU1iTmRHUVpzdVRqSllqeUlOdmJLTmVvQWc4Z2JYMVFFbFlXeVVWWlVY?=
 =?utf-8?B?N2lSWjdsQW9MZFMxT0s3eVJvaVVVR3NTUUw2Z0ZZQi8ramF6RHU1S0hsMjZ0?=
 =?utf-8?B?QzQraVpaTnN0czdQcHdMd3g4TFk4YkdkR25DRnlNdm96N2s3NTIwTTVEazdQ?=
 =?utf-8?B?Mjd4SGZydVJ1a0xBM3lTTFY4c1J6cEJ3bnB4TWVyeGpCa3lMYzY4aTZiVDlL?=
 =?utf-8?B?emhmVGc0ZUZCblMzVkVzUHJpSFlYYjBHeXlLZUxOTzdFVXJ3aTE3WmFOenph?=
 =?utf-8?B?SmZ1cWlaMlZPS29RWHNydU8yaFlJNEhDK3dmYWx5L0l1ZUpaTWxOdDN4V0VJ?=
 =?utf-8?B?V2l1VDJsTmQ3UEtjUDJiSnVBRmgrUVdCVXdya1pxZ2NQRkQxTGdkL0JneExE?=
 =?utf-8?B?ODhvZnV3WFM1YUMzbURxeDQyNm9MRzJiZjFKYURRcUFYUlVaWEJnckpaRXN4?=
 =?utf-8?B?d21HdXJ5dmtWMEk0cS9nQmNvM3BMQjNzdE0xbzlrdEtZOXk0R3pmcFBpU3FI?=
 =?utf-8?B?R3FZdEViNEhPQzRicFdIVHAwN20zazEvZGt2MFdYRW94dkNkWGVCYlhMTlFy?=
 =?utf-8?B?Q050TmRPYjJlL3lKMmoxNHZybmlEa0NBVEJLM3FVK294UmN1aEVYZUJ1MlIv?=
 =?utf-8?B?d0pnT3FHTUhGZHAxRVdLS09BTFd2eWhZdTNKRDVxYmkxZEJpNFNWbDdJSXg3?=
 =?utf-8?B?ZDlsSFIzRmluWm4rTmM5eGdEUS9HOVRON1puNXVwUTFhZnhhR3lvcGhSVWJ4?=
 =?utf-8?B?Z0ZjcStZU2pjVkhpVTFjVjExN0dPVG9MV2orZzFmM0ppaXhQZXk4MWFEbDJy?=
 =?utf-8?B?OWRmY0JQcHE5T0NUZTVGa05sdU4xd0ZGVUJEMjhRU0xLZ2xLRGF1a2pXd01o?=
 =?utf-8?B?eFVnVXV3Y1JpekJEdzdLTmxTejdLSzNjOWlqd2R0d1JEOERvYzU3UUFQOXJG?=
 =?utf-8?B?OTRpcDRxWmhxQjU5dUx3MWkzdlh6UzBNbzNJenZ3eDZSMnIxZWZtSERtUXM3?=
 =?utf-8?B?NGxiRjRDa0d3L2NNeDJmTHZNMjF0RU9PeHhrcEhmQUpJQXdVd3hheFRmQXpX?=
 =?utf-8?B?VjR4LzY5Y0w5TTQ0VzJFTVlWc2lKblppT2FxU3p2cEovU0dFSE5XRDR1WTdZ?=
 =?utf-8?B?QUl0SUdMeUFJVm9Pelp3MERYMFRXQ2wzZXJVUUFSMkZhOGlDb25GdVIrTVBV?=
 =?utf-8?B?d0JQa1lGKzZvTkFPaklBTDRxdk9KMTlOVFU3OGpLV0YwYWZTeUJ1S3Zibmw0?=
 =?utf-8?B?Rk1GSFdaZjZmeVJVdUg5OHg3THA5WStzNG01bDRkZmJPWW5XVStvd2VPclVN?=
 =?utf-8?B?bDkyRjVmcklSd0FqMkhLbFMrUmFJdXBpck51M0RwT0RSM0pJUVpEaXNVMWpj?=
 =?utf-8?B?cjBHRmJDUGh3YXlaSVBGRzEvakdJSjNHU3FiUjBHSlpSUlBEVTl5by83NVAr?=
 =?utf-8?B?djF6UnpVd05EQ2NPblY5V09YeTkwYm9VbURpRFFueCtQTFZsVk9DeUFKVHp4?=
 =?utf-8?B?bm1iV083YjA2Vkc5U2w4NGFQMkZoeG03dC9kZkZTM2lSaWhCK0RaM09FQ2R4?=
 =?utf-8?B?bTlLTnoxamF0RGxOSE1Eb3dYaCtzN0I2TDJPckk0TVVNME5VbzZUWDUzcUFF?=
 =?utf-8?B?YWFsNUxBR3FjUGpFUUphRXVPZG5WTGEwSU5iSC9xMHhuRUppRFBSQktFNi9y?=
 =?utf-8?B?SnljenR6V1BWa3E3Y1Vnak8yQW1kR08yOWJYZTNyZEg2QkJzeUpZWnRMUDlw?=
 =?utf-8?B?L05LaHo4anVLY0ZTYlZPNGRYWHlKMml1OHIxK0l0SUVseS9DYWtYbFpZUmNQ?=
 =?utf-8?B?U3Y2ZE9nK2t1NE9pdnBsYWdwL1lPYktzZXc0U1JtcUduNnhEUHpVSWJkakpY?=
 =?utf-8?B?bkpiUlMyYjNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmNsTDhJcVFyelJSQ1JQTCs0d2VlNkRiN1hhcDJZclZyRnVLRTlzU1F6L0hQ?=
 =?utf-8?B?dDExcFlvMnFsaUxrVGE4KzNGZGtveTlSclM0bjBRVFVkdU5tam8xbmJEdE44?=
 =?utf-8?B?Wk9YbExJcUlHSFlKRC9sVXY0VDUrM2RISktlaVE4Q3NKN2Q2TWQ0SjFBVFUz?=
 =?utf-8?B?NjdIMU0wUTBxQk4wSlQwRFpvcVVGL1Y1ek82Zzh2TUhTMTVvS0pocTNHY09R?=
 =?utf-8?B?bHZVQVY0bm5oTXZ0T2lJT1lGN041NkNyVmp1am1RYlhIOGM2VG8rNkppcW5E?=
 =?utf-8?B?blBTSHowRWdlN2tLb0J4NHdmUkpkWkpjUUQvZ0F1L1MwTkYxcytzdG9WeDdt?=
 =?utf-8?B?c1RaR25id0d0U0dMMlpwQ1VSNW93V3QvQjJsWDJSR2QxNHdMZVhLcDhrTkU0?=
 =?utf-8?B?WmVYV0s2Wk56TjZhdW8vaExXRXI0ZU9NWTJZeXhQNEUxalV2dlVGUnQ5b2VK?=
 =?utf-8?B?azRWTWc4Y1ZjcDR6cHhGZHlHWEZpaEtBVjZTbWFZVTc2NG82L0Z3K1N5YjI5?=
 =?utf-8?B?Q1RETnBFa0kvN3hOZFpud1RGS3Y4OFl1MG5QN2RwYVVJNzFPOGMxVFNrZXpH?=
 =?utf-8?B?NlNUUFlRa3NRa3FpTGZPam1vb1lLOG5jWlpYYjNqQmx0NndaKyt4S0N5RWNM?=
 =?utf-8?B?eS9URjg1bjgrTHBPWXR0QittcWd3RlpVZmREVDlzendWL1FpWHJxSk5oTncy?=
 =?utf-8?B?SDU1MWh0SDI1enhRSzBUamdJNExZVmJCdFlubkI1UmRFaHFCNC9ZL1JvTGNF?=
 =?utf-8?B?R0pZM3c1QUF3cGU4ZVdzV1BiR0dEazkydGdJWkdZMHhpd1k5K3Z1Mk9IdDV0?=
 =?utf-8?B?UVU2bW44RWZlbUk5QzhlaTdmeFlYUEkzc1MvNFZnVS9Xc0xXWVZNS3B4TXgv?=
 =?utf-8?B?Zm96bXNZMURESnJXWUY0S1c5bGg1RnlLMTlUZW1DN1BqL3FubHhobFNBNjh6?=
 =?utf-8?B?V1h5djF0ZlZzcUR1SVFUdlU2VnFwMjN3Y2FrTEk1VVNEc0N1RSs3MTY5SDhx?=
 =?utf-8?B?U3NvWVpPdFRJRnhOU3RpdGpNT3YySEp2WWpjc3NHVlFzL1B5Q3BacHgzTGdL?=
 =?utf-8?B?by9HTk5paUJ5dXQ1SjJYZGc0RmphYUUxdU1KbEszS3FPZEYrcmNJUzl6VlBk?=
 =?utf-8?B?dC91NytNNnVwS1N3NEd6RUg4SnBMSXhWQ2tQOGlFTTdDVGNXeGZRY2ZrQ2E2?=
 =?utf-8?B?QkRjNUE3elhUWFM1MEkxMFBtK292WlNPWnBOdWhTME4zT3VPaTFpMDRnbHNC?=
 =?utf-8?B?UnVrSFJjVmo2ejNGdXdHUkpiRWp2SUkrNVlGQmFSTmlMUjRLS2oya0Q4R29W?=
 =?utf-8?B?alVGdVFqVks1cVZJMy9JeGkvSSt6ZEJOeGpCdkFXb1EwUnZNTVdPMFNSYzFu?=
 =?utf-8?B?Yzc2bllNZnhIbnpxVXExYzl6TzQ4eUVhVXdvcWtRdzJzUzlpMzRUZ1NsNFhG?=
 =?utf-8?B?S2NyUjZVSWlFQzNxU012Z0ZFUS9hMGFrV0hzbW5wbllTL05WVjh5Q0wrZkdz?=
 =?utf-8?B?b2VCdEtLWHJlaHRaUURsY1BNcWtZcTF1dmVxZndjV0VJR21rZEl1RG5rZlhj?=
 =?utf-8?B?bmZwSmVGUXhSZit3bnptUUlSVmJ1bHltTjM1UXE5OW9XanF1YU9UbzEvVEV4?=
 =?utf-8?B?dDhzeXIrVUdHa2U1dE85YURQblVIMzhndTh5ZW1yUGdXbTUrM0pMRlY5WEFl?=
 =?utf-8?B?Zk5EMG9WOERLbk91VnUzN0NYcGg1ODdyQXRzdEtpd0tISFJsNlVUVDN4ZU44?=
 =?utf-8?B?cU1RcU1BVTV2cXY0NVIwaEhPeERycXM0Ri9lRWJXVGdWMDcveXBpWFVGWU1p?=
 =?utf-8?B?V2RJalR2RHZuZHVlVnNGWVdqdkFwMWN2SzNON1h4ZG5WUUZnQlNMVEl0Q0Vt?=
 =?utf-8?B?NGhYTDFjdE1aSFhYMGh3dlBrMUZhL0hyd2tKSllrNEtzVlF0MDRmWTh6ekpi?=
 =?utf-8?B?ZGtNSmIvUWxnMyswdUxxL3dnZkRPelBJQjAxZVZJZ0p4T1pBVmJVbm5jaWQy?=
 =?utf-8?B?SThSSTczUTJPWWEwejVBN2pOVko1K2Q5bk5oTDRaVjlUNm1YUStuT0dWUXB1?=
 =?utf-8?B?ZDkvbEVtQ2VITENaQll3TE5IQmxLSVZqczBySEZDNEN1cnk1STd3elFlYms1?=
 =?utf-8?B?MW51KzlZby9rdUNiWjF4elhQQm44czdsK216R1RacnpSOGF0Z0E0S0ptdlRj?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AFAA2FA448D2948B7B85987CA9B04CA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733fb914-6cbb-4797-557b-08ddc4826b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 16:04:18.4082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVdBJ/d2ghGeVM3t90iUhKUhbkpiPUG8dNUH9NwyMdnus+mlADnbwR/b9mABPaWbL4JwiBnCOc8x7gha80fBj72GjCd+ShcgMpey0D5KntA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10256

DQoNCk9uIDcvMTUvMjUgMTM6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wNy4yMDI1
IDEyOjA3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBBUk0gb25seSBhcmU6DQo+PiAt
Y29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsDQo+PiAiYW55X2FyZWEoYWxs
X2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vYml0b3BzXFwuaCQpKSkifQ0KPiANCj4gVGhpcyBv
bmUncyBwcm9iYWJseSBmaW5lLg0KPiANCj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17
ZGVsaWJlcmF0ZSwNCj4+ICJhbGxfYXJlYShkZWNsKG5hbWUocGFyc2VfZ250dGFiX2xpbWl0KSl8
fG1hY3JvKG5hbWUocGFyc2VfZ250dGFiX2xpbWl0KSkpIn0NCj4+IC1jb25maWc9TUMzQTIuUjUu
NSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+ICJhbGxfYXJlYShkZWNsKG5hbWUodXBkYXRlX2du
dHRhYl9wYXIpKXx8bWFjcm8obmFtZSh1cGRhdGVfZ250dGFiX3BhcikpKSJ9DQo+IA0KPiBUaGVz
ZSB0d28gbG9vayB0b28gYnJvYWQ6IFRoZXkncmUgYWZmZWN0aW5nIGNvbW1vbi9ncmFudF90YWJs
ZS5jIG9ubHksIGFyZW4ndA0KPiB0aGV5Pw0KPiANCj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBv
cnRzKz17ZGVsaWJlcmF0ZSwNCj4+ICJhbGxfYXJlYShkZWNsKG5hbWUocGlycV9jbGVhbnVwX2No
ZWNrKSl8fG1hY3JvKG5hbWUocGlycV9jbGVhbnVwX2NoZWNrKSkpIn0NCj4gDQo+IFRoaXMgb25l
IGFsc28gbG9va3Mgb3Zlcmx5IGJyb2FkLCBidXQgaXQncyBwZXJoYXBzIHVuYXZvaWRhYmxlIHRv
IGJlIHRoYXQgd2F5Lg0KPiANCj4gSmFuDQoNCkhpIEphbi4NCg0KVGhvc2UgZGV2aWF0aW9ucyBj
YW4gYmUgbmFycm93ZWQgKHNwZWNpZnlpbmcgZmlsZSBuYW1lKToNCg0KLWNvbmZpZz1NQzNBMi5S
NS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCANCiJhbnlfYXJlYShhbnlfbG9jKGZpbGUoXnhlbi9p
bmNsdWRlL3hlbi9iaXRvcHNcXC5oJCkpICYmIA0KbWFjcm8obmFtZShfX3Rlc3RfYW5kX3NldF9i
aXR8fF9fdGVzdF9hbmRfY2xlYXJfYml0fHxfX3Rlc3RfYW5kX2NoYW5nZV9iaXR8fHRlc3RfYml0
KSkpIn0NCi1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgDQoiYW55X2Fy
ZWEoYW55X2xvYyhmaWxlKF54ZW4vY29tbW9uL2dyYW50X3RhYmxlXFwuYyQpKSYmbWFjcm8obmFt
ZSh1cGRhdGVfZ250dGFiX3Bhcnx8cGFyc2VfZ250dGFiX2xpbWl0KSkpIn0NCi1jb25maWc9TUMz
QTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgDQoiYW55X2FyZWEoYW55X2xvYyhmaWxlKF54
ZW4vaW5jbHVkZS94ZW4vaXJxXFwuaCQpKSYmbWFjcm8obmFtZShwaXJxX2NsZWFudXBfY2hlY2sp
KSkifQ0KDQpBcmUgeW91IE9LIHdpdGggaXQ/DQoNCkRteXRyby4=

