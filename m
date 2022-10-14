Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D225FEE3C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 14:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422859.669182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojKDy-0007RF-GL; Fri, 14 Oct 2022 12:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422859.669182; Fri, 14 Oct 2022 12:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojKDy-0007OP-Cz; Fri, 14 Oct 2022 12:55:38 +0000
Received: by outflank-mailman (input) for mailman id 422859;
 Fri, 14 Oct 2022 12:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fnPT=2P=citrix.com=prvs=279a3d32c=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1ojKDw-0007OE-HB
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 12:55:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c5d0d69-4bbf-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 14:55:33 +0200 (CEST)
Received: from mail-dm3nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 08:55:29 -0400
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BLAPR03MB5617.namprd03.prod.outlook.com (2603:10b6:208:292::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.26; Fri, 14 Oct 2022 12:55:27 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::fef5:dc53:67d3:3498]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::fef5:dc53:67d3:3498%6]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 12:55:26 +0000
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
X-Inumbo-ID: 7c5d0d69-4bbf-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665752133;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=mTBarqtrDCb/DvyjGWDhhj8F6tbPQuF8qTMC0BR50Jo=;
  b=QfN16EiHuZeAkcN37xxur7++QpokYkAAbIZn9JcvKSwkRCVCklvYXpXn
   633vw7PzfDW5JjVnp4SZfpXotAlNIkX+VUxjvzDV7BOlTIMx0iA2zSqWb
   hCeurXWR1VhCDkZRUZ1cxWNKk23lyPo0QqmEKz3OoBzun9JONBAPkcRnb
   4=;
X-IronPort-RemoteIP: 104.47.56.47
X-IronPort-MID: 83162753
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rG7SaKKaj4hEuAMsFE+RnpUlxSXFcZb7ZxGr2PjKsXjdYENS1DRVn
 2BODWGHMvffNDekL493a4zgoRxQuJ7XmtExSlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4W9A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYQx5cJMG2FRz
 McJcgkhUhvaxM2czovuH4GAhux7RCXqFKU2nyk6iB38VrMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QzT+fVfD2v7lWSd1JDmMMDUYcCLTMMTmkeeq
 mPJ12/4HgsbJJqUzj/tHneE1rSWw3mkBdl6+LuQ19FXiXyD/0MpGBAqbX6w5vWSoHy7YocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRjqKaQSG6d3r6MoCmuJDMOKmsfeS4DSxBD6N7myKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750eicMN3uOm81HCnymhuJHhSRQ87QHaGGmi62tRZoG/YJezwUPG9vsGJ4GcJnGeu
 FAUls7Y6/oBZbmPiSiMTeMlDLyvofGfP1X0nV9qN4ks8XKq4XHLVZpX+ztkI0BqNO4LfDboZ
 AnYvgY5zJNaInaCd6J8ZIO1TcMwwsDd+c/NU/nVap9CZ8N3fQrfpiV2PxbMgCbqjVQmlrw5N
 dGDa8GwAH0GCKNhij2rW+Ma1rxtzSc7rY/Oea3GI92c+eL2TBaopX0tajNisshRAHu4nTjo
IronPort-HdrOrdr: A9a23:EvW2K66vPS6N13tlDQPXwWSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTPqftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkzNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9o1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUWpDKh8KoCOCW/sLlWFtzesHfsWG2nYczHgNkBmpDt1L/tqq
 iKn/5vBbU015qbRBDJnfKk4Xid7N9p0Q6s9bbQuwqcneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KJoM1T3am7a/n7/nDE3kbKvNRj+UC3a7FuIYN5vMga5gdYAZ0AFCX15MQuF/
 RvFtjV4LJTfUmBZ37Us2FzyJj0N05DVCuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPVFT9MQb6h6GOAdKPHHQVDlUFbJKiafMF7nHKYINzbErIP2+qw84KWwdJkB3PIJ6e
 P8uZNjxBoPkm7VeL6zNcdwg2HwqU2GLETQ49Ab4YRlsbvhQ7euOTGfSTkV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208,217";a="83162753"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw8aE+02MrZbvbBdqW/+soKQrUoIt3vD0xvaTTLQwvv10S9jDfhfD9LWaMiQAMd9tmXroS4Ds2D2bHdqaxikdYPxaELcG35FU+vGFwE8mEKC5M2/nm23VejhO6zf59lgphNjJf3t6vTRekkDz+3PVpQODNzZ6t4Sr04YZg/vZX4sf1T8Jf/SzOO3RK5CdNf7NS/nuFw2ndN0i9yIrEMQsPpWssB8+F/cLESP5DInIaREDz8NQAyfdNnNaTCs/kSKpkgr7hE1Qo4OJqUT7aFs/U+l8avjDueK2Mc2AlbVIessLIj/A9gADOCDMcMAgxFz7kcBjZI4izlFjEFl6suqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTBarqtrDCb/DvyjGWDhhj8F6tbPQuF8qTMC0BR50Jo=;
 b=NyJOTVkbS3TtrFFIG3MBeKUkG19Fjh5FvtkY+YWMRSZ7rQrdyN0tcRtrT6F0SKEhCQVAewdbnHA4Qr09v/X6xW/AzcdvHW+Sc4LWOcGZZKcRwhQ70gR2SyCvKluzBrXzAdYNmeeWQGpP3WNvw69gylda2Qzbahd39jyt3FwnpNUszP1mU/nqlEvGUysyiirtTRvi0FPegbP1+F0Si46t1SZj0RYkANN6m2XmWwuU5Kh4Arm8hv5RgLbeAjzZid+YHg10EDpl7wRlNAUndg63UsRuS6FbCKIrbCD9vqnFEK/KfSW6e9Mk5td9Sl7C7tiCtGi/CBDaheZdEmwbqaDnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTBarqtrDCb/DvyjGWDhhj8F6tbPQuF8qTMC0BR50Jo=;
 b=usNYRaBy4A+tRzTBAMho8CO6nKW1IVePd3iN/u5qwqPiInrH4u6s7vOktgoAJIn6JmEr5VAApOUQRMSejqX9XNsNIlzai4gntlrurPrU4nC/ZIKWdeOxSCO1tZdVQ0EzFXtUfetK1BYacouU7+K5xi1FoBwEgyu+eWw6/+dVYDA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Tim (Xen.org)"
	<tim@xen.org>, Nick Rosbrook <rosbrookn@gmail.com>, David Scott
	<dave@recoil.org>
Subject: Re: [XEN PATCH for-4.17 v5 00/17] Toolstack build system improvement,
 toward non-recursive makefiles
Thread-Topic: [XEN PATCH for-4.17 v5 00/17] Toolstack build system
 improvement, toward non-recursive makefiles
Thread-Index: AQHY3wR29Q+LQ29BdEevnfwWhUHbC64N2muA
Date: Fri, 14 Oct 2022 12:55:26 +0000
Message-ID: <D34C95DD-C6D1-4DE5-A180-F35FC7BA9C72@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BLAPR03MB5617:EE_
x-ms-office365-filtering-correlation-id: d7414de8-8c5e-4b51-6612-08daade35db0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hC/Jys2bXVkSftsow5wczF2vxO0SBW9+pMkpFee9OBCGrxx93/qmKYvCYZ6uSiTmjFlT8+20Y7F0P8s5pfDztPoDqfcFr8kyv7tJy6Wze+C9qQiORFGx6ae+M1J3zD5S+aAWupgr0S+UNB7GA6wKQ3gDNdEBN68Bj7BJtIUqJnpPzWX6/ktTPXBIHtns5pW320lPoRd7PnETa4b+iK+HQjdiWYffqpQ2DlYAQ5gpPGhkC94P0H+qc2BhmvoqVrB1GWH6uom5i8gpUeuYb+mVR+mpTOhZa4tt9giv6IyFDCcEdq1URe6+pDQPvjHBTmRhn8x1Sov+bk9ZcLsHNJc/ZGpZcjHvvtfBqqdC8q9UNxwdpTzqg5bAa0RlC/5VOpISZb7r/Dg2JXdvTevn8qIiOLoGKB9LCJ2iXAohcumV6mKk9A/ZNMOCXiNsc4W4X07+Wa1FdwMtCM2kQVdByG1JP2Q31DY1yUN9lwSDnCXfQ7U7HVvifu5ShdWBabrzYbPUp5e9IDLIr+9mR9QVNJTQqzapfuUj5qHgXXNPeyPhx6JDkhrHkSzqNz0E5UGzKx/AtjNXXJgLd712K1yItnPLxcCFeRMksAWWVuBSzV2Fo6qMqGQS5iKG8VBpjCq5erzRYZ262T2SzA8DZcHdjpGkqzk6f5bVKDzJ+P2ranus6/7wPBZWh7GIvfQ90p4NEbjZhlG1DB0nV8F0CkX/PuHGioaqxHCeWbQFaUWVwGwTL/ULo55LA2J8P+YvyEMmspPZ+iSl99HEXhmBRtOYKtz3uR5w91FBfCPv5p6RAAhlQSdrSGXt78q5WV12UQfd9+kjzgdQUckegC7elwilm4jvYQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(66446008)(66899015)(6636002)(33656002)(316002)(66556008)(6862004)(8936002)(64756008)(8676002)(76116006)(4326008)(66476007)(41300700001)(54906003)(86362001)(122000001)(36756003)(2616005)(186003)(91956017)(66946007)(6512007)(26005)(53546011)(37006003)(44832011)(6486002)(4744005)(5660300002)(38100700002)(478600001)(6506007)(82960400001)(71200400001)(38070700005)(166002)(966005)(2906002)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nGEdcaxcgeG1+FdKnOaaJRsOxvXDe60tzS9Piz8CyLjZebKdQ6CtgGqMZvrU?=
 =?us-ascii?Q?e6eYI0UkamlmXNUqDVjVPLEmbEGFKMcllzwH5ZzRwGsnmv4YPiZC4yiS3Vpk?=
 =?us-ascii?Q?immEDCO7Y4+FYAGgqohyLVrkMweAo8H94Y3Z0HFPFXjlF4u67H223J8CJdfm?=
 =?us-ascii?Q?QQiT4GGduCZJB2J2L5rlRQZ3IjPrHIueA9zAwGjjwwUBefRskSit+fPl3bsH?=
 =?us-ascii?Q?X2qsD/VaywDsCCw4p5f4C9raopDWVySMWi3N794Vpwtv3Y+0z1EY0PpSgNhZ?=
 =?us-ascii?Q?Im9Ar2W4e3NcXZM6A36Eo83m2UoOi1t4jHDbvfkI4nx4QC2VjLog5+gb2bAI?=
 =?us-ascii?Q?xRlO6RsC5i6NvXmktPadeILjXoLzsVEcONfzS/kG/u/B3piBeqHtsRt4M1NE?=
 =?us-ascii?Q?07f4LrxGWGeKyi6alW7O+N1kxwAhtNaQ5t5IcbtQGuaEWgiKrgGv5gA32cYz?=
 =?us-ascii?Q?Na26rRSlnyaIDFzqAx76TN3Q+Y7TkCjSVv6YJPENqLhyYkSxIMjRUdCYvdiC?=
 =?us-ascii?Q?rgH5mXpvy9No5wu3PpZycoimRdKFSnq0/Um5VeEvYcXOggzK/O1muMF9+Gok?=
 =?us-ascii?Q?I2PR8x3PqNYtVNwxuv7Ph92UJP55qaeS/UlphkxpWYilNoHsBmJWxqPt+nXq?=
 =?us-ascii?Q?apSVdAhKFx9XpMtLmsVrnkhF9ah4BO62Vonhzbs9bWYgqGyM8HyLNNc+L6Tm?=
 =?us-ascii?Q?tzhNYO4AK3HbaBPQJ8fHpNg/XoF/n3vQrYrB7ZOglxm7QCsyHBpOzNfyKmlq?=
 =?us-ascii?Q?mwlYpDSuyBy9OBnci+h7yfl7Oj7ho+RxwBW7EsVofG9wONp0NC33rskyiJMJ?=
 =?us-ascii?Q?qV6UAStpxB3YvZ6WQJxh0YKgLVg7YmTrJBgk0VqIMFlkqn7qNCFbU9jVXco9?=
 =?us-ascii?Q?b7/k8JjXEeJf18EcrNM+A5l6UpMF4X/EOQN1UwuoaMd18kYjWS686eaSJGrH?=
 =?us-ascii?Q?8JRqaQ0KEHjuZM+ox8TXrjTEmow1dMZ61u0XYSwRmDh7wUsuFwgBW6QiIhSg?=
 =?us-ascii?Q?P+5+0zHuFiGm3BCU3cldBVGjdGvuI30NNqq3+E0qcbbi+W3AV6EmsOBH5Uo0?=
 =?us-ascii?Q?iq5gqCl+Iqk9LBX2hSlyFFfPNmIplc6i9De8yWWrLlMJ9LYg8OYt4zP/JdmR?=
 =?us-ascii?Q?L/2aayYlQdbJgCJIVccD+dMVLCIKVpH9es3RfATSIm6wnWi2NDpHsyM+P1YP?=
 =?us-ascii?Q?9A570AIwk+akvK8n0fLlMzmg4zb+oROJOOXGlVfTxZ96bY/etGdUM+caLIAr?=
 =?us-ascii?Q?E8bnzsINsYQ8jq2vn0uNdj7PxdooAcSyukRqPTlGaIJab6WHAx7cIl+der04?=
 =?us-ascii?Q?4AiWmDeWLT7+WuySYer9W5oXKVl1hz48fOwoHrQ8+7X0ZabiUQF+rdiiF2cO?=
 =?us-ascii?Q?g7mmCHB4CSzCh3spvJH50EhfK1yrRVg0WSnlWEIcOSiO8HybOTZkNVlgLxmx?=
 =?us-ascii?Q?XpKUSKU4hVcJdPqRQIiu+ENIkONQK0uMPhs+Gnn2wvzNNo59Qx/BWA8e/xER?=
 =?us-ascii?Q?/z8inQ4nSGskS/+ZCr2iv5cTIUa/YsSAGidW+dkAr8efBAv3Qhtngnl1RP+Q?=
 =?us-ascii?Q?x6Xrla9maWaeSj7uuH3ceVgXpAXtDhpU295wmoeRSg1t1y5XpLhiAUif/fP4?=
 =?us-ascii?Q?9LjU1MzdH26yYvzuRmjALlo=3D?=
Content-Type: multipart/alternative;
	boundary="_000_D34C95DDC6D14DE5A180F35FC7BA9C72citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7414de8-8c5e-4b51-6612-08daade35db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 12:55:26.7213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X92WTIgjURKrNuEMQg+mktDAW/bndjsR/cGpyZyXNghDVXNZBPTP285NBSvRcDsdlEkWZ0R8bl9dlZzvbHwZerq8r+qDchO3rvO881wcjpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5617

--_000_D34C95DDC6D14DE5A180F35FC7BA9C72citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 13 Oct 2022, at 14:04, Anthony PERARD <anthony.perard@citrix.com<mailto:=
anthony.perard@citrix.com>> wrote:

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolsta=
ck-build-system-v5

Changes in v5:
- rebased on staging
- added "tools: Rework linking options for ocaml binding libraries"

Changes in v4:
- several new patches
- some changes to other patches listed in their changelogs

Changes in v3:
- rebased
- several new patches, starting with 13/25 "tools/libs/util: cleanup Makefi=
le"
- introducing macros to deal with linking with in-tree xen libraries
- Add -Werror to CFLAGS for all builds in tools/

Changes in v2:
- one new patch
- other changes described in patch notes

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>


--_000_D34C95DDC6D14DE5A180F35FC7BA9C72citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <EA6D8D5900A7A043808EF3154E573380@namprd03.prod.outlook.com>
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
<div class=3D"">On 13 Oct 2022, at 14:04, Anthony PERARD &lt;<a href=3D"mai=
lto:anthony.perard@citrix.com" class=3D"">anthony.perard@citrix.com</a>&gt;=
 wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Menl=
o-Regular; font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">Patch
 series available in this git branch:</span><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D"">
<a href=3D"https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git=
" style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: auto; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: a=
uto; -webkit-text-stroke-width: 0px;" class=3D"">https://xenbits.xen.org/gi=
t-http/people/aperard/xen-unstable.git</a><span style=3D"caret-color: rgb(0=
, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; flo=
at: none; display: inline !important;" class=3D""><span class=3D"Apple-conv=
erted-space">&nbsp;</span>br.toolstack-build-system-v5</span><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font=
-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Changes
 in v5:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Re=
gular; font-size: 11px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 rebased on staging</span><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 added &quot;tools: Rework linking options for ocaml binding libraries&quot=
;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular;=
 font-size: 11px; font-style: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Changes
 in v4:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Re=
gular; font-size: 11px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 several new patches</span><br style=3D"caret-color: rgb(0, 0, 0); font-fam=
ily: Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps:=
 normal; font-weight: 400; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 some changes to other patches listed in their changelogs</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Changes
 in v3:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Re=
gular; font-size: 11px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 rebased</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-R=
egular; font-size: 11px; font-style: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 several new patches, starting with 13/25 &quot;tools/libs/util: cleanup Ma=
kefile&quot;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Men=
lo-Regular; font-size: 11px; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 introducing macros to deal with linking with in-tree xen libraries</span><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-siz=
e: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 Add -Werror to CFLAGS for all builds in tools/</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration:=
 none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-si=
ze: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">Changes
 in v2:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Re=
gular; font-size: 11px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 one new patch</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: M=
enlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-=
size: 11px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">-
 other changes described in patch notes</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
</div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</body>
</html>

--_000_D34C95DDC6D14DE5A180F35FC7BA9C72citrixcom_--

