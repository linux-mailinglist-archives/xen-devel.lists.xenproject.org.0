Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9D421143
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201560.356140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOrq-0001qs-G3; Mon, 04 Oct 2021 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201560.356140; Mon, 04 Oct 2021 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOrq-0001oq-CJ; Mon, 04 Oct 2021 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 201560;
 Mon, 04 Oct 2021 14:22:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DuXV=OY=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1mXOro-0001ok-9p
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:22:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c97d8ea-251e-11ec-beaf-12813bfff9fa;
 Mon, 04 Oct 2021 14:22:54 +0000 (UTC)
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
X-Inumbo-ID: 8c97d8ea-251e-11ec-beaf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633357374;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=rZSHagQkHdaLmioOS0zrAPmUfj06qxIyOaQuIhkt7tE=;
  b=VGozFb/TSprIQ78kWIWZ2+9T718omcvILsuFedulJrHd8/eTRU304Bxf
   x5Icf0DhYZ/sjqBfiPD18JFyZxpxLRpmYwukSZVQcdpAA9m5idVAGf1vj
   8wyuPtQZi0rX1+zrCgziJFxzpGvDP11/QPRvnfvxN24NC1esEvla9gAAS
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +tZ9VkADjW3Wwb7919f+oyQ1Pa3KI6L0IgMNDdpH6WH73xdOGPHjV7fBiCRGHl5yEgyI0lrQAy
 Zrl77Apk4fIsDzgkRUdghRPtiCJxyaPc9U+icyQ7QerV6nbRvp5rLI7nPQ7KirHBASEvfM+xJb
 6UOWAp2EPpEwuZV7ZFC96NiQCXcY6jkZkvo89fgqxQK8/b38/Z5mAVJKfMrAbsCxcz3CbTuidk
 w4/tBRPrLg7kZbV23jK/yqtfAVEfjTEpmtdowfJEt7zKPATgWtxpbL4YitzN5ncFOZmsTpV3W/
 v3G1vJFDR2plBd6cM+GldbCJ
X-SBRS: 5.1
X-MesageID: 54276737
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HMc6HKw1qg3ex3nybzN6t+cmwCrEfRIJ4+MujC+fZmUNrF6WrkVRn
 WoaCjzSbv2IMzH8eI13YNm/8RsB6pDUz4dmSQFt/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7Zl2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/1ck
 flB7KSScgwoBbXrp80yWjVAPhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors8jNsjwIIIWvDdkzDfVDPkOSpHfWaTao9Rf2V/cg+gTQayBO
 ZVCNlKDajzlfxdzGkUVBqkvhbv2tmLnIidUhH+K8P9fD2/7k1UqjemF3MDuUt6ASNhRn02Yj
 nnb5Gm/CRYfXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7NhoSUleqpOijvWS3UdlfN
 k889zInqO4580nDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8yweGBEAUQzhZctskucQqAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H5qYEuilTUT9BsEIa8lNizEjb1q
 xiAoTIinbwVgYgO3r+i4FHcqzu2o97CSQtdzgneQG+N9A5yY4+hIYuy5jDzxPBMNovfdkOTr
 WcNgcG25foLS5qKkUSwrP4lRe/zoazfaXuF3AApT8JJGymRF2CLUK0JzD0nHGVSOcc/YRjWS
 WDalRt83coGVJe1VpNfb4W0AsUs6KHvE9X5S/zZBuZzjohNmByvpn83Oh/Jt4z5uA18yfhgZ
 cfzndOEVy5yNEhx8Nahqw7xO5cFwToijUfaWJz21Riu1bf2iJW9EuxeaArmggzU9sq5TOTpH
 zR3a5TiJ/Z3CrSWjszrHWg7dwpiwZ8TX8+eliCvXrTfSjeK4Ul4YxMr/ZsvepZ+g4NenfrS8
 3e2VydwkQSk3ieXd1nSMCA+OdsDuKqTS1phYETA2n7yixAejXuHtv9DJ/Pbg5F9nACc8RKEZ
 6ZcIJjRahi+Yj/G5y4cffHAQH9KL3yWafa1F3P9OlAXJsc4LySQo4OMVla/pUEmU3vs3eNj8
 uLI6+8uacdaL+iUJJ2NM6zHIpLYlSV1pd+eqGOSeYQMJBWwrtI6Q8Ez59duS/wxxdz47mLy/
 y6dAAsCpPmLpIkw8dLTgruDoZvvGOx7dne21UGAhVpvHSWFrGel36FaV+OEIWLUWG/uof3wb
 uRJ1fDsdvYAmQ8S4YZ7Fr9qy4M45sfu+OAGnlg1Qi2TYgT5EK5kL1mHwdJL6v9HyIhGtFbkQ
 UmI4NRbZ+mEYZu3DF4LKQM5Re2fzvVIyCLK5PE4LRyiti969baKS2tIOByIhHAPJbd5Ktp9k
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gdykwNMe53RDCPy8aqjUdQUPxl4O
 CKQiYrDm69YmhjIfU0sGCWfxuFan5kP5kxHlQdQO1STl9PZrfYrxxkNoy8vRwFYwxgbgeJ+P
 m9nax98KamUpmo6gcFCWyanGh1bBQ3f8Uv0kgNbmGrcRkiud2rMMGxiZrrdoBFHqzpRLmpB4
 bWV6Gf5SjK7Lsj+0xw7VVNht/G+H8d68RfPmZz/EsmId3XgjeEJXkN6ibI0liba
IronPort-HdrOrdr: A9a23:/d7PAa31b+IP9T1JTmKmQAqjBR9yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHO1OkPUs1NaZLUfbUQ6TQr2KgrGSugEIdxeOldK1kJ
 0QCZSWa+eATGSS7/yKmDVQeuxIqLLskcCVbKXlvgxQpGlRGvpdBmxCe2Km+zhNNW977O0CZf
 2hD6R81lidUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStmNwyUGT3/ARAghKUfapzLgpAifx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE7EbLAYYo/g1iuKYlGfRsRLYkjQlo+VY7bVXHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7T9E5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZe06EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7zH4HSKyGGFfIyZZ0WY9ihz3ekKhlTMfsucDcTYciFcryKJmYRrPvHm
X-IronPort-AV: E=Sophos;i="5.85,346,1624334400"; 
   d="scan'208,217";a="54276737"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lcfk0UOP+kqU5PwGC3R2zm4ItL/kVusW6AkCYv6FF0Of5gIyZ4n4BJGZ0rxraBSIIh4UVMiZZl1pR1tQt0DW79FGu8398X7DvM5S2NIRTRVS0nmP3MF7tUtaNvKs91JGzN/bTmd2e07imenZ/77mkdRHrhcIkKWJrYWjwkfr2Ag7hL5gXia9Xb6mPzwM17HHh7F9fBGdQFcYY7TvCU78A5CrNO9HrNUN/Mvzma4xo/ji06peZMrgN3/5gIspku+NH1QzxvTsTOSamXH/wzLwxlJVZVqpBZ7sS5btnJV8sLDpKlZMfKGWXlWabBU1ag92NwlR22veAYEjthL/Xg6bKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x29O2RVr+mDsxew5znG3uS3IAdHgrAzsGnuFb49Im38=;
 b=Pz+w6ASQh1Kd5xn6twpvzG4twTcvV76nSm9UOgxe/l97JDg4ATPhpsP2hSNjknmQuz6kezIa2bhdfrcXOZIitXX19IPCWYiDJvSvAR79HvFptfxN4PMfQbxoTwnR1Cd/Z+K5H6nKn1eHJBCq1NUojuURWhEi5HI/84xs8s1kChMN1ZHbAU4p5B7uaZAK9Cxg8baJ5Iq6qImo9mKOFPbIaIXs/dkABkB4+B2VJvJoLtpE8bykijtsSq8xmtGEjPxKmBxMrjBOKzPjC8wn//kYnQPfR26LWLUsmjtP04Dc6puhRHCtwODdQEa4AtYtZjZpRX0JvccUwUGmbPBavSrXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x29O2RVr+mDsxew5znG3uS3IAdHgrAzsGnuFb49Im38=;
 b=Cp5hyjAjesoa2roHgWe156G03QaxUwEoJb6lagxIxhdc5Qi5AtZqfcpvyXrlcYjncoS5AF6BRMf8FxfueJf0CD/JCMoWvfQspkh/nU43z1rnrp3KsjRC/cy32bpK/iZJzgsylizld20l/9v+0SrVU/4QKB/oaMuWBjR7SiIDgJs=
From: Christian Lindig <christian.lindig@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"Andre.Przywara@arm.com" <Andre.Przywara@arm.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v4 10/14] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Thread-Topic: [PATCH v4 10/14] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Thread-Index: AQHXuRb8re94wMW7AE6VMwXrx9xiTKvC5EKA
Date: Mon, 4 Oct 2021 14:22:11 +0000
Message-ID: <33A48340-2DA2-434D-A6BC-97E48C7FB236@citrix.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <f22c06abf5faa0a2f9c044f5b4009a99d7942215.1633340795.git.rahul.singh@arm.com>
In-Reply-To: <f22c06abf5faa0a2f9c044f5b4009a99d7942215.1633340795.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36b0f5a5-c01e-4887-f7e9-08d987425b2d
x-ms-traffictypediagnostic: CO6PR03MB6211:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR03MB6211F64C057DB4CAC730F053F6AE9@CO6PR03MB6211.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+mWRlv1wXXwVdU2/IjRxQGWfoveM27IhQOavBReUwLKZjjHFm8UEPYDuBT0FAPBeUKvGmSaFJyt+98ph1clHwSnhMGssoKznGJvcS5Gks0CNsF3d6cVne/tAtaLaCzJK08a/cb7V+LnIRFiWZ0gOMiS0O6/WeGX7d6wTSe8mF9d597ofewE5+chrKD3ZWgvJHa0HhOiCWR6KZ38EfNj5eZCCXoSG3OpvsGHLl0ahCP+qgIXXnqjJsAjifh9I0RjbcE5QeiGb7F3KdpggxgMEKLDkpiCJcF7h2Xo8p7LRrgWM22lqPHhFjApxJwNdCwzI3bO8BwpAk8M0uw6+TeC11wDoiRzu6Hz0soKDWycuABb79cOpLoQ8xrHebS+nuhdoUnyo6jAG9heYvuIT74NOEjNrMPbCHDePHpbM9C49otePDSc8OwSQRdtMPhHXOmwImmXDs2o6gdFqywcHHuWIgt5u5cJ2i17pp1xuwLhznpMJCMxbiT1NcTLjazrlxFFxvAMvs7AnRLYVhdXdbeeD3J/eCP2AfI/5zh1wG49r0i4GZte8jNXgc9QoPyZeQembYKcxoHML8Xcsob284VSUeLRhovaiSX1gSTgHGkx8I6rgnMdm9N4vspbph+NyfLmoGfMyEk/MuYviQDIKrSxp8nqj3dn/RGjXr8trVGHt6FVuIzt16l+HVPJBOVBDPuThOfo3uvaHdCdKY82hoFIV4pS13xFjYDBfoujtvFGYkQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(122000001)(2616005)(6506007)(54906003)(53546011)(33656002)(8936002)(26005)(5660300002)(55236004)(66446008)(64756008)(76116006)(66556008)(91956017)(66946007)(508600001)(4326008)(6512007)(186003)(66476007)(316002)(8676002)(4744005)(107886003)(86362001)(44832011)(36756003)(2906002)(6916009)(6486002)(71200400001)(7416002)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WXZlazKO43xxC8NpczL99QGFUXYG2DLglApTHvS/ceDiY58U5F+dsSeaULUG?=
 =?us-ascii?Q?Yl7S0d7D7TNO2K9TgVbP7DeIeexmTTQ2HY6QM2N9FzQMdjFiOf9Ww+8imy/c?=
 =?us-ascii?Q?Sg+tCPxAYpqEy82SAa73A3gA6PHOs7Pk0yMyESFJT44EK4v3odihh/d+q/uB?=
 =?us-ascii?Q?+mhl1C4tqbrFlaAP7KG3MtfE/7xzvesisD/0LNQ3AECN79mQUQqC9leQifGp?=
 =?us-ascii?Q?qWkLspKTUYTKmnYk7uNjEoD38/AddA2YNm0kAwWSbu22UC7Zh8gfndPtCMTp?=
 =?us-ascii?Q?kwcxfrUe9xJyl0IAy/wiIxE3QwiWaw1fWHWCws9fFPG3v6O0P6qGfVIimsRk?=
 =?us-ascii?Q?hvJCLZx7Q/5OEtPlozWkEeR1omlMpoLviMDkyLx6EUvRWYausLBAObVpNIEn?=
 =?us-ascii?Q?BWh8bJ+bZH6NX6DaoG9CPjpdlpzmUPyTT9P7LYbd8wBn2929PyM6HqsHUkzc?=
 =?us-ascii?Q?wuU7tCL07K0E9g1h22bdwrQcte/WTDKo7y/N24OpTPzIUwTtCVRPbDl7OrvM?=
 =?us-ascii?Q?J/KiebeQJXSYIERhSDtFRgG8DYGjRNzm2XV/WNKqZvhY/lpVnOnJ3ShFidtU?=
 =?us-ascii?Q?BCVj6/eXCTjfmtkodp6GyqJp46QoXo6RfAz2B19fe3jwQ/EdXAsFwGh1gm3f?=
 =?us-ascii?Q?eJInozSZfrP5O8B2GGZO7D8/PY0pyOJ/F36IQwZGoBXlasuk9/NBV/CeW+Zj?=
 =?us-ascii?Q?ob8LkTrVtoXjEQ4yK4eBNA0HY/JVPouelqFCQmxH+rsm1JrVt0lYELrEPbow?=
 =?us-ascii?Q?DG8FgRu8agA5l/PC1sGYQyYrcPDndNHUGwfngr1b5i1pz4ISUh5lhE4dp77Y?=
 =?us-ascii?Q?2yCrYnySmsUuCJJ02OVUkWgmtTg0bd9JZ23bwWHD6Uzw41g3RPALWrE6ghR3?=
 =?us-ascii?Q?f9FD7a2mEmvsPK2v4XEFcbiMJWNSkLphzWog70g0ni7gZn4Q13z7N5AHyGBB?=
 =?us-ascii?Q?0n3ZbQv9n8fNz2bnf9gcAgpWAqUcV97qXKwYqLSvheNnRbrqvokzcUCXsL6D?=
 =?us-ascii?Q?P1wC1JGxdHZp6KvwugB4ZdApbelll3GUVnel2qFHdxelrdMh+pgM3uljacW6?=
 =?us-ascii?Q?uXd3+AQ8D8BuQxnDtdz3xVkRISPVxQpkNZ91BDn/mnO/EhlR5fgZRgao05CY?=
 =?us-ascii?Q?lSAAPJ8TvxoBfwTjFUnO2nmugU9KXiXGhwigdv56y/eBEiDLUEa5ojgs+b8h?=
 =?us-ascii?Q?2EeS0MSJz0ZyJDGySU+v/M+6Wjzh508TQKy+vRyIMeU0uy+YPqa6xpVovUmS?=
 =?us-ascii?Q?pBseCCMo5BbJVz8AVcmxzVg3jkLfzEVpxBxS87FSJl6Pyzmh097uv10Wvzq5?=
 =?us-ascii?Q?zYsueEhw7pT3OKlxyruWAMRL?=
Content-Type: multipart/alternative;
	boundary="_000_33A483402DA2434DA6BC97E48C7FB236citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b0f5a5-c01e-4887-f7e9-08d987425b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 14:22:11.5552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jzv0Kp7reTs/5GnIKzfmu8Mrqiqa70sdW5u3b4lW98LH3RlnwIFIOv4WZAm3R99INOeRGbh2KkFPwZFNjV4kLu11q+KCigJ3S2X9y85hffk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6211
X-OriginatorOrg: citrix.com

--_000_33A483402DA2434DA6BC97E48C7FB236citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 4 Oct 2021, at 12:52, Rahul Singh <rahul.singh@arm.com<mailto:rahul.sing=
h@arm.com>> wrote:

ntroduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
Reject the use of this new flag for x86 as VPCI is not supported for
DOMU guests for x86.

Signed-off-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>=
>
---
Change in v4: Added in this version
---
---
tools/ocaml/libs/xc/xenctrl.ml  | 1 +
tools/ocaml/libs/xc/xenctrl.mli | 1 +
xen/arch/arm/domain.c           | 4 ++--
xen/arch/x86/domain.c           | 6 ++++++
xen/common/domain.c             | 2 +-
xen/include/public/domctl.h     | 4 +++-
6 files changed, 14 insertions(+), 4 deletions(-)

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>

--_000_33A483402DA2434DA6BC97E48C7FB236citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <D7E7FE3D4E6B2D41B8EDE97BD1674EEE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 4 Oct 2021, at 12:52, Rahul Singh &lt;<a href=3D"mailto:=
rahul.singh@arm.com" class=3D"">rahul.singh@arm.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">ntroduce
 XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.</span><br style=3D=
"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-s=
tyle: normal; font-variant-caps: normal; font-weight: normal; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Reject
 the use of this new flag for x86 as VPCI is not supported for</span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">DOMU
 guests for x86.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Signed-off-by:
 Rahul Singh &lt;</span><a href=3D"mailto:rahul.singh@arm.com" style=3D"fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-te=
xt-stroke-width: 0px;" class=3D"">rahul.singh@arm.com</a><span style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none; float: none; display: inline !important;" class=3D"">&gt;</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">---</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Change
 in v4: Added in this version</span><br style=3D"caret-color: rgb(0, 0, 0);=
 font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-=
caps: normal; font-weight: normal; letter-spacing: normal; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">---</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">---</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/ocaml/libs/xc/xenctrl.ml
 &nbsp;| 1 +</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">tools/ocaml/libs/xc/xenctrl.mli
 | 1 +</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/arch/arm/domain.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 4 ++--</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/arch/x86/domain.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 6 ++++++</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/common/domain.c
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
2 +-</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight=
: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xen/include/public/domctl.h
 &nbsp;&nbsp;&nbsp;&nbsp;| 4 +++-</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">6
 files changed, 14 insertions(+), 4 deletions(-)</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D""><span style=3D"font-family: Menlo; font-size: 14px;" class=
=3D"">Acked-by: Christian Lindig &lt;</span><a href=3D"mailto:christian.lin=
dig@citrix.com" class=3D"" style=3D"font-family: Menlo; font-size: 14px;">c=
hristian.lindig@citrix.com</a><span style=3D"font-family: Menlo; font-size:=
 14px;" class=3D"">&gt;</span></div>
</body>
</html>

--_000_33A483402DA2434DA6BC97E48C7FB236citrixcom_--

