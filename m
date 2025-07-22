Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670F2B0D86E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052290.1420981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNf-0004yz-UH; Tue, 22 Jul 2025 11:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052290.1420981; Tue, 22 Jul 2025 11:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNf-0004u4-OF; Tue, 22 Jul 2025 11:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1052290;
 Tue, 22 Jul 2025 11:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNd-0004HB-IJ
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:57 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de7afc80-66f0-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 13:41:56 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:42 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:42 +0000
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
X-Inumbo-ID: de7afc80-66f0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMWP8LEWyWVAcFu3U8eRKgVZ3uR738NKMP/Tm7mbxjUAoLjov3brK/iog5aTC9pwZuLaQXgWMKxpjOaBCGHyTYG3ZSOwn0T5rVXC/7+tO7jtG6v7vVg607DxzTwDc52z4SwXel4fic1LU8SAfChfFcMibFZiyJxelJcmg6gzw8WVNvlO8yWvMiXATSzTEd/cy/1RbeVM4Bw9lmZD4ElcNyoNRUMIpQXHdrXJlPP+Az88Ya56jZ8TLkjWWPu6o3hMZXZ4nspDPQuQrIZa7jllGxSDOOm/upmNAea6kpHw//l2cx82S27MkKfnUtpyX18zif1H1es21ykiMso4/KPg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvdj4fhiG/MBLH8UUVQd9RqYFEdkKD52da5j0t2kGl0=;
 b=tm40m4sTFxVQAO1H+gMsCkQd28r9AmEmDjWT9ZkrgMYRwBZpEXHRlDAUxdwB35/skXb8/0aAB06AxWVg95by+KNxge3HiSRUN135Ij+UrA7t5QA0TAdFSRxriyA1osQIhR+s/tycREsuV99LFfw51uol0oGJ88DvimciYEUJVNcugmO9uF+gAfvMICxyR4d/LKD5r++kQS9dB9siB423UHmgL7qBM6kP70u/o8t1aPF8ghht19BgqKbFeIAREPVNY6M3SpLAfoqyaUV68NQGVZJhBwaV74+1+4MefN3VJrRQQ+heB55QTiSv0wtOrKfHpLCN7yVU5ac4UZ1cBfWT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bvdj4fhiG/MBLH8UUVQd9RqYFEdkKD52da5j0t2kGl0=;
 b=ViQljXJTpQI5MF34UeglxQmb1xICHQtYyBA5JkD1iQtRcEH38uuKWaqOraphgXJzamzTE8Lm5Uqzb8lFHsBXNf/T3bUKO+jzo9Cj/1JVvBPPBa84YAGDhbXXQhpIhnJle0e7tG2tLzpUA/xoYwZ7wur67zRJX/Vu98jcN8o5yqsMkVdlJSdiJO3arKKydlXV3j2iWDU1fZmQBABPEnsd0E7IXc7aDJ1kJJrWcfkqKAmU5KuEnTBPs/xXhS5fwh32lLrX82h7Kn0O76AXwOhMPyNJNGCS+Io7W7mGNxHSIeGsW+XH5ej/6rzVUD2Gfp8PD+pR88AZEaWLfpq8IYANQA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 06/10] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [RFC PATCH v5 06/10] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
Thread-Index: AQHb+v2XIf5rVjN6B0ydmKskjXCNlg==
Date: Tue, 22 Jul 2025 11:41:40 +0000
Message-ID:
 <aa4bf9a069721ace3b9da7409923455eed2f6896.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: 9888cc14-6d04-4c64-f208-08ddc914ba97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?c4ssJyYITA047w43TnpcmKL31I84CTdtQyFVt0GJx7BltMu2gBxSAwZfje?=
 =?iso-8859-1?Q?V2vEv9q3JUqWtxcY2YmW1XIkx138tWyR37KuzcxrV1GQ2kfySke5LlgyEK?=
 =?iso-8859-1?Q?wOuMAHZuB2z6CQJjdvdmeqTFsqmKjT5jwTjGjEaDVHXWTxsrLDAcEihLMk?=
 =?iso-8859-1?Q?UsWLS0dEfMKAvljXQ8nP6bXgi44UPndzsGgRiuzDi+rMiprpXhXdC/I8Cb?=
 =?iso-8859-1?Q?PE3a0c25JMstyk3jhf+M2gz6OHhDaynj7u7P6rQM7xu2uzG0q548A/9oon?=
 =?iso-8859-1?Q?fvAPA6IFM1I71UJKgSOdYvAkJeor96C2Wn1OBP/Aikx20mR+iFXZhWQhC6?=
 =?iso-8859-1?Q?J7KrlBX4z0RDpdcT0HOjwqFAcCspac0VyNoarKi5S9R0UwA23ljWp4Qg7e?=
 =?iso-8859-1?Q?rNMIwmPQFtqOhEbHQmD54ZcHvQPB3np5n3sVIoi83sOaGfFy15hvVLjaiE?=
 =?iso-8859-1?Q?+iv1EEzX8YFA5R/bpy0l/jpIVpYcqnDPaj4iX0KBAsBEs7UrM8+klDCQwJ?=
 =?iso-8859-1?Q?4s88POjxBCygnWjYIk9maJ0/JiR68CCeQnpI0J6CEYQqHOlsO7jMzfCHBv?=
 =?iso-8859-1?Q?Yrwhs5c3oVXGmjWYGBtkEB9s8G6X4TYnWEPb/fMNCcDkf5hIzBELRt7z1r?=
 =?iso-8859-1?Q?05cn5qU/h3gQJIj6y8Fim90xmgiUID+aMkF6yH2i480D35pqIeJP11K/3R?=
 =?iso-8859-1?Q?uanUbp+PcGekh2SAeE+I41LztEkThSsVDZ6q5koT9ICkFRiRsCQX+hX9Yh?=
 =?iso-8859-1?Q?qicS+ptkqNnIxbg+HVjllb7yUoXWsHEPcp22+vT87NOkAge/X44kD0VC8r?=
 =?iso-8859-1?Q?eLBrjBbK0c25uQ0jecFnVNHKJqMeJhcttmn9T7D+P/3RN+7o81N/644nKx?=
 =?iso-8859-1?Q?zZCBK01HnQWxcMzV/vdBrzlJXiKHXuQR97GmRmvnc/m9bz8cuhabb7cQvy?=
 =?iso-8859-1?Q?KfHl7IZc0edVOyebIbQYkSQhU/NXFDYfd94HmRg5DQBGF8TMwxvcvSIAhy?=
 =?iso-8859-1?Q?2rDs8vQAUg3hqS2gnYi7wBZ0v7YXaqn1gKnyCzbTBkBUnCbeTwJo0h5qBK?=
 =?iso-8859-1?Q?nkzFgyAGGk8uIKHePrP4P9IcHQfZl4lfZEQHO8F1vgD3NbBJBnMw4JedFy?=
 =?iso-8859-1?Q?REeTO0/25fMi5KGrWxH1fyb2YcZ8iNbh7kCFOSH8IAQ6csjfGjsZr23fW9?=
 =?iso-8859-1?Q?4S38SArItUWQStVOLUHiW9IsMAv3MEbdqoqbAjcwyM6O5S7l1bPwK5/+SU?=
 =?iso-8859-1?Q?YFVGhThwwASs8yA5Y0EWHDesDc8TJdREDne+Kbnm/Ef4xju0up94WjL5D1?=
 =?iso-8859-1?Q?bdpLCV0dGACpZ6XveruRjrzddBkGWQfP3uyi8dFeJ+/8D2rUrnXWxtwMUu?=
 =?iso-8859-1?Q?2dCnRE2/idICvVKqk501VTcCmWfGw4+uwPjKO7a/sqiF38gIImVm9LiTer?=
 =?iso-8859-1?Q?gw2WKeumQ0dAQtrgOqO6jFdukJwTMM13heUwYGByFx29a79Q2h6vuzXtGt?=
 =?iso-8859-1?Q?HuqCxzMwokAP3GTQhfuKkjEk16b7Ik0NGoek69d/pAgA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VesnFOiWYV19DGmNf98mWm/tOjOenhjLH0ZJ5u+yJWfUTJ3VjuRNLAjw40?=
 =?iso-8859-1?Q?cL4uN50CALBEf9GK67Yo11zC5sIska+dv6lb32pmm+VLifhSFBaoVdWWlr?=
 =?iso-8859-1?Q?Ah3Q/2wlJrs33JiX3LeJwkJp6SIfYEXM1IAwa9dqDBPMhKTypukRFVsJLR?=
 =?iso-8859-1?Q?yjyQmBwphPgnLMKYx+luVgdXbdM5maphOis9GjlUe3erBlObJtmpiKleFz?=
 =?iso-8859-1?Q?funIFnBbARifYIJsOQ6nB5kxkEr21Jkme0MYX7A5f8E155aZ2d6uRcpVn1?=
 =?iso-8859-1?Q?Wq4vtJezdH86xWIubpTQJW3maLscNomiVH6PUr5ee+kStxQRkvhbPGIcsa?=
 =?iso-8859-1?Q?eyEZ1zMhY6j90NriGSfFkMeT3Pj4dX3wU4chepMjSBmKyuX/Oh9FBzcPd5?=
 =?iso-8859-1?Q?92j8f+s5gRxyM8A1P22R8EULfYKe9Wy3291WEFeWr7/Aa6DXCQNmJE4J/q?=
 =?iso-8859-1?Q?ZfqnkUGEtFh4B5xG8KAMerndTrdkJ/MhVqYdG2Ez24dzffIe465zp2PGg4?=
 =?iso-8859-1?Q?pwY8TCslF+dYtrdldvwihIkKRjrz+STSWDKkpCHruE+X/wbx4xZBEjsMgK?=
 =?iso-8859-1?Q?X7dcAsURYQTcmskYXMgVplurJXAFNzaw2h5+WmAzsN8ecaVGnh3SoGtTyU?=
 =?iso-8859-1?Q?njyml/3+VyeyryW/elbAs06752eAzg5gOk62ZK8Ld+wnCRvjfTYmYEwr3o?=
 =?iso-8859-1?Q?Y+7LJ8ikkkkMBvYlnPCPtoD/04xT31+W+oJrbsLq3D1ifzdBwbHtEn14ka?=
 =?iso-8859-1?Q?y8hU/kfrgiWFYUcVIyo06Mu6vipAxJEpS2JuwQeZG1dzUnwqf3gFcIaLKq?=
 =?iso-8859-1?Q?mOx5IR8qj/lTh9yQ4Gvzd3jPRl8NM0JihR1KHH9OzhWxH9O66oDnLgtoP9?=
 =?iso-8859-1?Q?PbIJNI3Rfz9Rvxl1i+aEE0vNCzYBoly8DethJ5odW4Xs+/5Pz8zgaCg+N7?=
 =?iso-8859-1?Q?r2+bLDKThZbDUcNmv+VxpLQUyOuEwyhxGUJxiTZYyzI9Cio8Ys8EL5QO6N?=
 =?iso-8859-1?Q?SHP+t2P1PNmk0C4xHF/MCsQvQMGY0MTP7DEHN3VmBRAwMKT4PelOAp77Gu?=
 =?iso-8859-1?Q?D16ezzdoKmL2uQy2ie+QthW58wBx6+5BpFOI3yOsn1Z+L36MoPJ3Fk6OZS?=
 =?iso-8859-1?Q?bkKhybqnOuq2me/AnYTBgOkk/LM2pWg3HoFcbsehQaWi4E6vSAID0IQTAW?=
 =?iso-8859-1?Q?rEf6oUFx5p1cHPNM0BbHIyAB+2ByDtCkFLzIN6Ay+DVpOY7FW61flUo0r6?=
 =?iso-8859-1?Q?sVT7rPxEALUpX9PitSw0bBREGJZcTudbUXmZC9Dpnb7eFTPErolJUl3yf0?=
 =?iso-8859-1?Q?h50C14nSmLKi+Sgu+os7aHqOtgFnvnsaTtXEKIPTmW3K5I9Z9k6SZTnm2o?=
 =?iso-8859-1?Q?yb635EUIiZBTfLbJsvp1Y3Q0Ca5GGnAZpH4R7eoRTr6kIc8KNIiHVcfu6J?=
 =?iso-8859-1?Q?lBMA7O9NvlLBiewzoP3+YWlhOiVcqcfdH/CQ7DKN94KYbzFiry0x6eRAiI?=
 =?iso-8859-1?Q?inskGiRkxkn+XaSDAVJuKHBA6rRzuvACuQp1vveGYvtZ3VZ/oLUVSEdKxc?=
 =?iso-8859-1?Q?7bqhsb2u7ZsDNJYdHl9pGBEMOXOpAL50TYII1fN/TvxSMk6Vj/26iixjjG?=
 =?iso-8859-1?Q?mVI3CXyPiTCdMrIlSuZ+HSjlUaXEx9cZah8/kiIie5pHmy468P0FuXTg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9888cc14-6d04-4c64-f208-08ddc914ba97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:40.4991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4XMRUFq2LMRJbthExtovWQocm7BUmvzV4jbaScZaC5U2vIOkJDXdAMTgBSCxwmrOswpEsmyQSW5esIO4o23lC5NIHzlcz1LnYn6PPJ25WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

From: Grygorii Strashko <grygorii_strashko@epam.com>

Add chained handling of assigned DT devices to support access-controller
functionality through SCI framework, so DT device assign request can be
passed to FW for processing and enabling VM access to requested device
(for example, device power management through FW interface like SCMI).

The SCI access-controller DT device processing is chained after IOMMU
processing and expected to be executed for any DT device regardless of its
protection by IOMMU (or if IOMMU is disabled).

This allows to pass not only IOMMU protected DT device through
xl.cfg:"dtdev" property for processing:

dtdev =3D [
    "/soc/video@e6ef0000", <- IOMMU protected device
    "/soc/i2c@e6508000", <- not IOMMU protected device
]

The change is done in two parts:
1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
not fail if DT device is not protected by IOMMU
2) add chained call to sci_do_domctl() in do_domctl()

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v5:
- return -EINVAL if mediator without assign_dt_device was provided
- invert return code check for iommu_do_domctl in
XEN_DOMCTL_assign_device domctl processing to make cleaner code
- change -ENOTSUPP error code to -ENXIO in sci_do_domctl
- handle -ENXIO return comde of iommu_do_domctl
- leave !dt_device_is_protected check in iommu_do_dt_domctl to make
code work the same way it's done in "handle_device" call while
creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
creation
- drop return check from sci_assign_dt_device call as not needed
- do not return EINVAL when addign_dt_device is not set. That is
because this callback is optional and not implemented in single-agent drive=
r

 xen/arch/arm/firmware/sci.c             | 35 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
 xen/common/domctl.c                     | 19 ++++++++++++++
 xen/drivers/passthrough/device_tree.c   |  6 +++++
 4 files changed, 74 insertions(+)

diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
index e1522e10e2..db75fc5cb3 100644
--- a/xen/arch/arm/firmware/sci.c
+++ b/xen/arch/arm/firmware/sci.c
@@ -126,6 +126,41 @@ int sci_assign_dt_device(struct domain *d, struct dt_d=
evice_node *dev)
     return 0;
 }
=20
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    struct dt_device_node *dev;
+    int ret =3D 0;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_assign_device:
+        ret =3D -ENXIO;
+        if ( domctl->u.assign_device.dev !=3D XEN_DOMCTL_DEV_DT )
+            break;
+
+        if ( !cur_mediator )
+            break;
+
+        if ( !cur_mediator->assign_dt_device )
+            break;
+
+        ret =3D dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
+                                    domctl->u.assign_device.u.dt.size, &de=
v);
+        if ( ret )
+            return ret;
+
+        ret =3D sci_assign_dt_device(d, dev);
+
+        break;
+    default:
+        /* do not fail here as call is chained with iommu handling */
+        break;
+    }
+
+    return ret;
+}
+
 static int __init sci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
index 71fb54852e..b8d1bc8a62 100644
--- a/xen/arch/arm/include/asm/firmware/sci.h
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
  * control" functionality.
  */
 int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+
+/*
+ * SCI domctl handler
+ *
+ * Only XEN_DOMCTL_assign_device is handled for now.
+ */
+int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 #else
=20
 static inline bool sci_domain_is_enabled(struct domain *d)
@@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *=
d,
     return 0;
 }
=20
+static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *=
d,
+                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_dom=
ctl)
+{
+    return 0;
+}
+
 #endif /* CONFIG_ARM_SCI */
=20
 #endif /* __ASM_ARM_SCI_H */
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2a7caaf85..35398a0c42 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -29,6 +29,7 @@
 #include <xen/xvmalloc.h>
=20
 #include <asm/current.h>
+#include <asm/firmware/sci.h>
 #include <asm/irq.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
@@ -859,7 +860,25 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_=
domctl)
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_deassign_device:
     case XEN_DOMCTL_get_device_group:
+        int ret1;
+       =20
         ret =3D iommu_do_domctl(op, d, u_domctl);
+        if ( ret < 0 && ret !=3D -ENXIO )
+            return ret;
+
+        /*
+         * Add chained handling of assigned DT devices to support
+         * access-controller functionality through SCI framework, so
+         * DT device assign request can be passed to FW for processing and
+         * enabling VM access to requested device.
+         * The access-controller DT device processing is chained after IOM=
MU
+         * processing and expected to be executed for any DT device
+         * regardless if DT device is protected by IOMMU or not (or IOMMU
+         * is disabled).
+         */
+        ret1 =3D sci_do_domctl(op, d, u_domctl);
+        if ( ret1 !=3D -ENXIO )
+            ret =3D ret1;
         break;
=20
     case XEN_DOMCTL_get_paging_mempool_size:
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index f5850a2607..29a44dc773 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, stru=
ct domain *d,
             break;
         }
=20
+        if ( !dt_device_is_protected(dev) )
+        {
+            ret =3D 0;
+            break;
+        }
+
         ret =3D iommu_assign_dt_device(d, dev);
=20
         if ( ret )
--=20
2.34.1

