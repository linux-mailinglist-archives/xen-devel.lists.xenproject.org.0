Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D52671DF5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480626.745111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8a5-00050E-ME; Wed, 18 Jan 2023 13:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480626.745111; Wed, 18 Jan 2023 13:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8a5-0004xI-Ic; Wed, 18 Jan 2023 13:34:21 +0000
Received: by outflank-mailman (input) for mailman id 480626;
 Wed, 18 Jan 2023 13:34:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKO3=5P=citrix.com=prvs=3750e6e72=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1pI8a4-0004x8-Np
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:34:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd3b0fa3-9734-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:34:17 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 08:34:14 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 13:34:12 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 13:34:12 +0000
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
X-Inumbo-ID: cd3b0fa3-9734-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674048857;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CiERtLZS+Mpj6YW3FKVMSWyZMMA/NCoDT5AlA1mswnE=;
  b=SOs/qnV5KDmBE9/eoSYHpglhYJfSoLYa/bm3HGfTRBGQw+6MgTQQI06E
   y0/TsE15+24J3kLtmYxcZcVQaaXO8spxLPhM2y/A6+mkl+g9j/Jf5CmVT
   W0Lntph8VkFP/p0+HpCZTQIYw1XRJiuXL+Pp+Xp0CUnfSEA+o2QmqvLxQ
   4=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 93144423
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ts3QdKzYxT9e+P48JIl6t+cKxyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 WZKC2uOaPnZYzeket90atm+9BwBsJPczdc2T1M5ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnPKAT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTl/9
 /MXB2tdVzvA3+um/rfkcOpdptt2eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMvuFTuGIO9ltiiTsVPn12Ep
 2vAuWD4BB0bO/SUyCaf82LqjejK9c/+cNNJTeHkqqQx6LGV7m8fCjEWamnqmP+w23XvUIlxd
 B1JwzV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRtv6eSUmm17aqPoHW5Pi19BWMLeyIsVwYO5Njn5oYpgXryos1LFae0ipj+Hmj2y
 jXT9Swm3exM04gMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2toji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:VEokgKuH90Unk+jqyzJtgNGd7skDTNV00zEX/kB9WHVpm5qj5q
 eTdZMgpHzJYVcqOE3I9urqBEDtexnhHP1OgLX5X43MYOC8ghrNEGgK1+KL/9SHIUDDH4Vmu5
 uIHZITNDVeZ2IK6/oTTGODYrQdKHjsytHMudvj
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="93144423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhFylaI8AejK5euE89GQyMAllujMB5wKVzYDgRBwSuvb3kD2uweJoIzNTf109Qc1xWpZR07oGJ5y4WDLwM14tSq948wqEaNhwpRyzL2NkMnqp1FN+J9oGxPybAzHzB9Vhj0KhMvYJy9sl/6FTTXIdRC4rR5iuDE45SkQHc4573TLc6a+ASRXeBiYhJXcXLLZlXPmCWHoAmLb0FWYj02YzQrrvI/YcYriq4nA36zoIAnk9i7m2gNqp0Zq2lpWQhrphcvP/5NRe6Zp+mRN1Q66m0v5eIdydiU8Rv3f6/bDm1A6LzlnHEfvSREbLlDohD+EPkee1DSuThYieUMcRyEIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u78+sxLMkpAYLGfNYnZANoSWvbKSvwtyDW/fdKPu58c=;
 b=SVztvCyCuroBQxJPv0bgci9bPEoEmMNWw0kQVN7zA6Qb0gKHPPcd/ygOniEgi+LkljkVXUXH1Lj6Noxox66f/7dr0Nlvy9s9LL5bafVfIumMKE5JkmkazSTtO9ZXiio2+V2rNv1Ww6mXfH+1uXqn61uLWnwl5PWvWRuYfrJdLpOeGuVL8QWl79rehyXW/aFRcHXvtyCr/z2Zxio9cEiMziTxEJEYsuDJfNHElZl287nueTpKEFqO8NAF5SMfBOPBNw1n/KH+iikyjuhMVIVuiI83QE4R80GZzU9iOsBH871QFcE0ywuCqzlw8uyWDLzj8g21yym/RCHQ3XOHOs4SwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u78+sxLMkpAYLGfNYnZANoSWvbKSvwtyDW/fdKPu58c=;
 b=gorWxZ0QjakTTihlFOfuVeyqmw3BJU1xgOaU3ni9U/ki5NVW2ZjUGeYNhi8UQCnJJ2ncnFAVNSMZnutBrH2WpXffzPlal+IFtjl8TI2CGJOLYigYoQZAsrPIFkdrJyIPNWRP1hdbLQM2STb/N5b+7dqbSRduBAqtUfwC9W8Qx0M=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David
 Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Thread-Topic: [PATCH 0/6] tools: Switch to non-truncating XENVER_* ops
Thread-Index: AQHZKnsh9kQgU3QTvku0GVlWBss2ha6kKlQA
Date: Wed, 18 Jan 2023 13:34:12 +0000
Message-ID: <F0BD0226-6C75-4D78-B099-17DB31C3B4F8@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230117135336.11662-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BN8PR03MB5090:EE_
x-ms-office365-filtering-correlation-id: 5273e8a8-f29c-4e6f-cd04-08daf958afa3
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 T8Xl6oT3OzHyNoeyxdV8wyxEx6htJpH/lBC1SBLm/t+jybL2NYOY0zmoi5kUO8YogCme7Qj5rbAff0OwKk0bf6YdMD/JHtR6NOVZoVAlujkgs++MDKhOipZcphHor/c+7Q4SEoYQ32VP+xFglRBgzc33b1Aq0qF44t8sD78PM2Wxs/1qlqkNv/KmAvJUjval7EbdXgWDrVIBrwserzZeF8S7DSVFjsuB/qVXj7l9O4cCzEM9CBRQWUFTD/NVhmRmSYFuPL0QdgwNHHwTZEsjDglHobep7OxHLsWBJ3HCyxQppSSHx6bvTSNIQ5EhW1yn4LEy5fITYvzkSjCktSN1XZYBoAjFgoVNf9UgHEhsLbFHNuZaYU3PGIZ7JikzUEc3y1NueXi90pACKc6qz/cf79+W+ftKS1ZXKMW48aLOW/04RUFmJajmdtOMCJxUpuIourxKEqXV4s2RjcujnojT7iATH4kFnXf8FqLHV/bNl/NabzWECP0AqaytsAgBwOdD3hzNIzmbaHtvlEQCAFZwqpWCzF9gPLrBGicw//DS2KcoJK17KUge7XGJNs6AZqhRrB4ryc9jBnIDuj+PqLeWpF5FhlhDvJx0G/HgOvftFAV0xqhdj5alDJttARRundi1NEQeSbWPZfQ62EvGM0YClIV/Au2T6ctvCNzyXnsW4EevAE3WAPGg6bazNqK7VMbJIMTHZHrxEQ3edBiZOnmcYZKpMK/B8MXPrum6hjSSRmQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(54906003)(6636002)(82960400001)(316002)(37006003)(36756003)(122000001)(5660300002)(8936002)(6862004)(86362001)(44832011)(8676002)(4326008)(2906002)(38100700002)(64756008)(66476007)(66946007)(66556008)(66446008)(91956017)(76116006)(41300700001)(38070700005)(107886003)(6506007)(2616005)(53546011)(6512007)(186003)(26005)(83380400001)(6486002)(478600001)(33656002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?riJey0L+/LIDEtQXSDtXXbdpH17N1wvqL8bvL7MD7MFng3LkBNTJ5aYm+1m8?=
 =?us-ascii?Q?KlywIvjeDlNwicEm/6g59AiFdo2dbKXtevukjorWfYC0p+tWFoMCda5Xm91k?=
 =?us-ascii?Q?8FN5eK5LQsSx9/7EHfyoKKqeyAq1j8d/XIvoA/4ZkEwXOwnuJghNgC9l8vvv?=
 =?us-ascii?Q?N2zGdN6PAPun5kkhmQKq/wjg09QQVVtncx33UY8FMWXj4rUMu7biIE/vAlEB?=
 =?us-ascii?Q?vE+qQjd8ll96WPDc8Zaa4kOqVuEAcIfeqAy7uLVxIXCmveAeH/2wJe2C1k5n?=
 =?us-ascii?Q?zGjyic7QYYEbN1M9RCZS2GwDxlLXWEqBt+Je52ZpbgkHmIV5091NcpIdoR00?=
 =?us-ascii?Q?6INYnS7OOmaFAPgCAitHjR+wPM3/nucabOninjWs94irq13AJGuEriK31NRQ?=
 =?us-ascii?Q?eQYgA7WoqMEF3a2JAC13xoQebaDNCN/iUiIS9uCr1vgSlbmkSrNe+6IXLF+u?=
 =?us-ascii?Q?PTKt7jIS8dKsWXpS1o/31vLVSjXW1fW+8im0vzUznnb94ev3lX5aGmskZXOd?=
 =?us-ascii?Q?YvRdkc2JL+6VfHXUB3PnBVj9uQSFoQfwhV6Sya8/3Y1g1JEMDzBdVuJ0Dono?=
 =?us-ascii?Q?MQkrTcaWT6PqYkb9/up1nkQLTNkutgzxuoYaaAquX62WBVxUCH1nAYeBSiZL?=
 =?us-ascii?Q?Px6qlg7Lx77x4BI3neL7qwy91MfIq4Uxw/prozP1E7klTG+iNXz4N4xASAGY?=
 =?us-ascii?Q?YMt3eNtxmfIpuhhrN0fVgeLkyoFjRcvHq5DOoCMwbMBix8CcokP/qa5OQ7e8?=
 =?us-ascii?Q?SspMf8yhZQVxU8k5qccHrGMtI60jJA8nnwqs9mYkqGo4Buk/NFimbYwvvDj8?=
 =?us-ascii?Q?vmlGwxD1Ll4sG6n96iwFf4qKpbZxSwn+badgXxRtfsl27MJDoL6aPPjMagsG?=
 =?us-ascii?Q?TMMpIrKhVxXCAZdKfFWSunvY4SN8XkhaZG3FDuSMX7G96FqaOM5BL7VLpKKD?=
 =?us-ascii?Q?HyR5IsBr/FBLllD0P5F9GmMBSBciSgGEj/fwjNhM3kIqztpb6EklcUKzRqGS?=
 =?us-ascii?Q?FWmlPaEYYrPjWmWkIgapvbd7bk9XzpbIYYBCWgD4zhMZlpvcpWYl7lgpVHmb?=
 =?us-ascii?Q?gT/iq19MppF493z3XWZ5n8sYweYCAIf55NPaRqoQIVPP3hQD5lSpKv7UO2OI?=
 =?us-ascii?Q?kIpxUuaVWBXdnigp8JL5u19oZwIgWFAWXzOuiYAwEi9/fxUx8vgg9+AK/7Wb?=
 =?us-ascii?Q?QRBDRgvRQmNvdZncNF3nXp/AbessgbU17fxlW/fcy+rhWmwp2vmkAS6Hpu4D?=
 =?us-ascii?Q?uPFL43tJILzmC6X3bF0+Ija5sijToScWjQ/ViAjEqGoVhrpcP82AHcRxb9uz?=
 =?us-ascii?Q?Gu/Kii7Dwqjaqnk8wRroKJf3w5Q04r2XcU/bwKgSnobySdKK3q06gWeczyLd?=
 =?us-ascii?Q?w5CQ+j5nnwKi34UkL/Km4jshf0hJW0YQc/pR8nV33tT+fYubl0G9ULsdzWjk?=
 =?us-ascii?Q?ulMJiF/PjqSqtLO9VQVDs17RMtLzCm+3LYChcba2x8MLWaC2aPXXiMOG9gOs?=
 =?us-ascii?Q?8kUOzMXjinmwsNLc/M+6viO4mzaCQAGSS1sYPd193pqej0hepwJPtZrnz018?=
 =?us-ascii?Q?TFqqoKQ6EuRobMNr+Oe4lRR3fVS6sbo9E+Z3ID4lHr2uC116Pd8pEK4G1TX1?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5BEDE9BF7956F642918848538264ACEB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N7gnedaP90dps3O7uxDu+ZEWdQXkA/LsspLNYOrprfNdjEfDc3hZeDMR+/jIZH6zDSbIXMiB2k2enzyEnWgavJwKSoJfhhmv41vPS9vCBij0At3i2oKtEElahmriDyLgVH/teHc5AKHO5mkjiVTfEyjOlmFHsP8pEWLS1W/FnqP0p2FBgizj7WeV2wIrqJjbaZa5M09jxDA/5s9JkYjLOSM9wrcf2hdHZemjHvqRJi92D/kZy7XRba6+n8pX1DN4Ks3Sq79Mi3gT0a/TctWHDbsElhY41V9MFdHCHbK9S3zbekmc3AAJmCAKv/D4JBqt896Looo9vQ7OPffCfXAHNXFuEAAUoPMSKkx8W980efiOvPJHaBbB7FWKihRdsgHlCaPtsMYhb5iyUiAH4pe1sIXC9GaOMm+zFcWlBXM0lJOLiNl6Ah3BJD7gW0TAAN/HbqPtOWlgIIxJAWyM7lXltkHLSVtGgywH0cKBKm88KPNKT/IPO8c7+tSaXaD2x130ZtmRwjuTnXAVUbwXQBBQB3oJUE6lnd2KoVVnvnSnFjxk0Eu1C8lJQmoOeuM2BmEYonJ97sCibhCV1TGomdYY1XB5WB5TuV5i1KXS40+EVlMhvAStsjS77SXtq5Y7DGgXwJVl8IbhemhEB2eh6o+JXEP7b2OMb3Cs/3u9urpWJLANpMTZ1OGeT0eO8rjbGK7DcD2zmm63pnNtMrvieOuWSe4X1jzqqmK1YTlVo8J5ywp8m5/4AQQN1+wTzbwaPHSR1xqc6s4QV90Q7tdqBkJQ9VH5NqhGMDBrVkJY7wUpQ2wuCTffvu6v8KW0dkIMbNjr2JGOOr07Xj3QyDGHDgVl0z3vJMhdwRGqA7KqVOFVQMQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5273e8a8-f29c-4e6f-cd04-08daf958afa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 13:34:12.5376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: be5Qkw7OsT4NZE6/GlKHU7EZTS9IbiqjT78vzmmN+YPTowJWzYeQoouE+am4RziXEpOK2qjGw/RQYnZA0SI4GYDQyiHZXxnLsU3XXm/CUG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090

I will look at individual patches, too.

> On 17 Jan 2023, at 13:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> This is the tools side of the Xen series posted previously.
>=20
> With this, a Xen built with long strings can be retrieved:
>=20
>  # xl info
>  ...
>  xen_version            : 4.18-unstable+REALLY LONG EXTRAVERSION
>  xen_changeset          : Tue Jan 3 19:27:17 2023 git:52d2da6c0544+REALLY=
 SUPER DUPER EXTRA MEGA LONG CHANGESET
>  ...
>=20
>=20
> Andrew Cooper (6):
>  tools/libxc: Move xc_version() out of xc_private.c into its own file
>  tools: Introduce a non-truncating xc_xenver_extraversion()
>  tools: Introduce a non-truncating xc_xenver_capabilities()
>  tools: Introduce a non-truncating xc_xenver_changeset()
>  tools: Introduce a non-truncating xc_xenver_cmdline()
>  tools: Introduce a xc_xenver_buildid() wrapper
>=20
> tools/include/xenctrl.h             |  10 ++
> tools/libs/ctrl/Makefile.common     |   1 +
> tools/libs/ctrl/xc_private.c        |  66 ------------
> tools/libs/ctrl/xc_private.h        |   7 --
> tools/libs/ctrl/xc_version.c        | 206 +++++++++++++++++++++++++++++++=
+++++
> tools/libs/light/libxl.c            |  61 +----------
> tools/ocaml/libs/xc/xenctrl_stubs.c |  45 +++++---
> 7 files changed, 250 insertions(+), 146 deletions(-)
> create mode 100644 tools/libs/ctrl/xc_version.c
>=20
> --=20
> 2.11.0
>=20

Acked-by: Christian Lindig <christian.lindig@citrix.com>


