Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E02B8DCC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 09:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30420.60428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kffZw-0004f2-JI; Thu, 19 Nov 2020 08:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30420.60428; Thu, 19 Nov 2020 08:46:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kffZw-0004e1-Bp; Thu, 19 Nov 2020 08:46:08 +0000
Received: by outflank-mailman (input) for mailman id 30420;
 Thu, 19 Nov 2020 08:38:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+6U=EZ=wdc.com=prvs=58568f3f1=johannes.thumshirn@srs-us1.protection.inumbo.net>)
 id 1kffS7-0003fl-9V
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:38:03 +0000
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9310444a-4e03-444c-8bcd-b9839b9c2a57;
 Thu, 19 Nov 2020 08:38:01 +0000 (UTC)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:46:07 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:37:58 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X+6U=EZ=wdc.com=prvs=58568f3f1=johannes.thumshirn@srs-us1.protection.inumbo.net>)
	id 1kffS7-0003fl-9V
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 08:38:03 +0000
X-Inumbo-ID: 9310444a-4e03-444c-8bcd-b9839b9c2a57
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9310444a-4e03-444c-8bcd-b9839b9c2a57;
	Thu, 19 Nov 2020 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605775570; x=1637311570;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
  b=IHlEp6/e6sY54AX71ncEuhkbxEg9TJAtQke0iCq0qn4zg2DC5Fc/ZEF8
   8lplbX+dZ63S4WbX5l/FaWAS5f0TkgA6gZRIr7R7SB7EjjK1pxnUzV4tj
   ax7CmzITNNaiCe4zc7ojWwccTNuFcMiAzF3GMJeytVSSAZjdEJdbTl7R9
   he/qj0Bj8VVt9BUCmdSHBEnbQ/ya1WUBMufw/uuLS+rd2IsBEqF17+Snw
   MWRyFwxK3cZNyVpscgMW7uGgAdR51XP1IPRkMui7MNT4AcizjIjiULYDn
   dS+VfFgB+/WFraCmgaF7V0opnnGjG/quLT5XPUnDzHFh/EPevcoEYiMkD
   A==;
IronPort-SDR: zh+Lhm4c30+A6tWFjBpJqqqvKXTtmLx/uJxb+Ey5pvk2XxNNdYhISVqynLPPLKekz+HqTu/i0N
 MBrZjlJKSXBsEm90b6+ege7WWcorjsTazp/tDTMlbHOdT3Afcd72/ADGryrhPx8Yp0Tez7QBvQ
 tJlpo5W/KpnUlQr/tfe9MPfmQS2uGznEdG99qLX9DT5RP27jMufJlsZu/CXVM9/7yupYnWPC0A
 /DtOKou0OTjtZ0+ljAW2xXukli+KF+T2Pu2eeDFE+tXFJyXimYQmCcv3VQimYs5bQMCHI7IegW
 dps=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; 
   d="scan'208";a="256563160"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
  by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:46:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWVKShOMXhOTzxLJhzsSrtgsRsiqZr/9dClb03QT4bKVIFFTWTM6V1+7e3PTRvf/C93mVN5NJm/qyEZUoTlaJRH3bM2MWAOixIFjp9BUCRgI+UsUWlWnZP65tOhcc8y4H8N8B3iIOkk7H+dcNZFSRkJ7zOH18mNv5H5JfC4gbt7hTTdZT8A4U8Ywwiz2Etnbh3PvoW+0OiNYpc9n/4NYIUBzvI8wqjY0KzIQwhK6uXQm6vgUA8T1kZBeyYkWPQsW1KurIwXhrnB9LHvDyYinKdXv2rl+TzUSe8hlME2Trs0G4XhxKI7FznJCuti5ED2y/846BG794X4h7VEyw7xOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=QKjiHISKqHrxtteinSEeFlD+3qKOop0HBg/DnDSrlE4aaVHpRHdpohfxEN8baBYkf4ZxwLk8NDwzUoQ531TtjKQfWN/LOkBZJurjkqw+wdVDwGkoPaFxfMxP5nmoCUr3LQE4sAxOR1qCCJYSXL/EqTtJw/hLFe5t6mA19colAFpg7oKiUI4R9wrI7Wo9KCsnupyRIwzBK4DSOiWMJTk/gvaN0Vy8yx5twbbHzcosjHDm1NfymaQIfLyWPFN4OHVzb7wCJpMXgH7FkH+ikL4N1aG7fLgp1SRMdR8B8eCRAiCOAJKucGDTh0eQPVJmRg1TcZwhjnqaCYkfaks8zDraFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=dHyQrs4qqJq3BNbbaAXd+LWAdp20FrQ7xiUO9rcIZVVEBzAoNqBzTASMQWR2XtUle6fCfqBcmbeCk+cCccmpm9Wyu3x20J3NbMQjIJC3GRCXkhtczlB34AWMhI7tCaukg8h0IXIrJYqr1DnGVGZZ/xwxcinamxLrNKvMPmge6Ys=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:37:58 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:37:58 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Coly Li <colyli@suse.de>, Mike
 Snitzer <snitzer@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 04/20] block: use disk_part_iter_exit in
 disk_part_iter_next
Thread-Topic: [PATCH 04/20] block: use disk_part_iter_exit in
 disk_part_iter_next
Thread-Index: AQHWvYfxuab2eSi9v0+4Jul0cvRVrw==
Date: Thu, 19 Nov 2020 08:37:58 +0000
Message-ID:
 <SN4PR0401MB3598E8CCC6C453F977898B9B9BE00@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:157d:bf01:851e:5636:4e29:3e2e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc2f26b1-8a58-4df2-8db1-08d88c666af0
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs:
 <SN6PR04MB48621A61F4471E2E89E82EF59BE00@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uM2A3PDmoKphIU4Fc16ogOp1M1rJ9+SLzvD0ZJkt68L/IbRqSIUJqleWl+jCNt8TGI7ZmCpjwSocgOZV5VkS2EMgz/nmv23hcIJhfdraCKUxH+nxb4ms0G8rm7HM+j3Vfro/l2b5oLe/IkFNCzBzjAMfxAUFmF82G7eV5I8T81ZfueCoS4SRCg/mHOZYIeqFhWdBjg7VaU05to+VFT5LaghV+Rjpy10mfkuvQk+lTiIXynjQ28WY52i0wiKk6EZz8L2MWpDs4bZYI+USuWxmYmjQLQgm8i0XSpl/k6axg7m8BdY+MPDgRmw+nBfqGZs/cInTtjx338CMyw1UEwzIwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3598.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(8936002)(71200400001)(19618925003)(4326008)(33656002)(7416002)(9686003)(55016002)(66946007)(76116006)(478600001)(66476007)(66446008)(64756008)(86362001)(54906003)(66556008)(91956017)(52536014)(558084003)(2906002)(186003)(8676002)(4270600006)(7696005)(316002)(6506007)(110136005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 IQWuh4ntmvjG/gqSF5MJQgN08Z6bkNozQweAEIGm/1mQo5R9TCC3cBtseCzb3QmJGQUiE1o54sobNLwSAWX/6oYmKaYDSH7cSH/q3MRUBXK1zMR9M6v1o9qf7W2zYWLcRaubUP88D5MNNVd33oqUf57ice3N/gDvDPltYue/PewJ5xrlecE7FjFNdOsTGym46YNDFl8vhZODWw1vcOKu/eyKQdw6/eCxq6Mapoj6V1w+fkEmMxFMwJA6vwbltHsKO3O6dQdrDEyC02kihOx77Q++4J58jatC3poVI/GqDeje3MjPGwoMGqAVxSVday3r2IpTUIBvunpWHM/D5tcZBtzLR/x6trX7T3UyDzXA7ZcY5PpI/x8Nr5PYK6rmiPggyNBZyPofbe/gLOus8r2qEu1wT8GtpjruCMicI72uiUhRwBIdMzCB23r/N1mHyPdjjTBJfnpXOgWBjhJkPK5aBWyE5cOalePDkgSLqUwDJEJhnEr3CAN+K4P2j1ENBGpdUk2SyQ1PpkgPMkauNbv5fW/IFg8f3HIi56U1o6lpIZTkaV4jXGwhQyLNuSstSjwwkkt5gRjilo+jOskqL45r0nYQy+rtt37OJLx1QNj2yYzp9Qp/uylqrH2drYzLR6OTofT98heAoAyjRO+VAVG5RN2/TFIwQOavTtr3udCtTYLoys/rz1plvkWksJHLNmTXMYVXlh8rU59KUiizMBADxQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2f26b1-8a58-4df2-8db1-08d88c666af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:37:58.0568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbgWyuKmpIgY3doUcSCJcrP096yLZcBzyRT5z9TiavwjsyTmsIh3cD8YMX5Ad0CTeluy+4pfJXdZTUvG83+xcAFmk9bYEROGcdWgsdhRth0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862

Looks good,=0A=
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>=0A=

