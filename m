Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F0671DFC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480627.745121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8aC-0005HF-19; Wed, 18 Jan 2023 13:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480627.745121; Wed, 18 Jan 2023 13:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8aB-0005Et-UQ; Wed, 18 Jan 2023 13:34:27 +0000
Received: by outflank-mailman (input) for mailman id 480627;
 Wed, 18 Jan 2023 13:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKO3=5P=citrix.com=prvs=3750e6e72=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1pI8aA-0004x8-94
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:34:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0a2afba-9734-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:34:23 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 08:34:16 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 13:34:13 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 13:34:13 +0000
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
X-Inumbo-ID: d0a2afba-9734-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674048863;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=L467W6EjPQVyDaJWpTZVtP50nFnZYZtjQkvwQoUK8EM=;
  b=HpvPa5AnaOPCvTahaXIcDdP4HPtjyKuHhaA3g36GVoauVT62reg3xCHy
   lzWG0w0+lRndUfRWFrBw86cBxaoN1gfvshKipN2TBRyqAAT9GVbJOZnP2
   807RsqPEvaCzp6ffStT4pV0+Y+Dn6x7uDeAxi0RGqdzxrWw3WIqMU4uA6
   M=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 92622740
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0zObh64y6wi4olNAkLtRtAxRtAXGchMFZxGqfqrLsTDasY5as4F+v
 mROX22EM67cNGv9fotwO4W290xTscXSnYMwSwdlrHw3Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakS7AeC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 NgccT8AVw66jqHt6e6qUMJTmMJ7BZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+aF3Nn9I7RmQe1enlyZv
 X7H9mK/BhAcON2Q4TGE7mitlqnEmiaTtIc6RefmrKQ13AX7Kmo7OQAse1eeptCFq3W7Zcx+K
 A8L8Q8Wov1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSMu/
 k+EmZXuHzMHmL+aU3WG7Z+PsCi/fyMSKAcqaSYaQCMf7tLkoYV1iQjAJuuPC4awh9zxXDv2k
 zaDqXFkg61J1JFVkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:0QTvmKE/Xc4hdcQWpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="92622740"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdDfKstdfMfT5DynhipwxHoPB3kok9//FtgqIejnj9M8vJhDGvJqkW7uFmed0gqLZd71Y1wuNqyyetlbytTU2sd34r++E+p85Y2Rjeu4k9SMI6SK/xkeABH1GqgL8ual4cBBUyNkzILkoswk1wEuqIqmJd/guOV4+Q6eae/jdd5xsACkCBk6ggjYrGps65ElcaCdPj+rNr9jlI+pOfefXWLQ/wOy3gCuMF+uyHUOnumklFl2yZUn9Nc6ustbXqi3aJf19/RucIKsRrBeNS4+mdukuCaIyc5AmbOne8J0cLUVLDbap0d6ZMzVmN1H5BFKyY859S8xqlIN9bbb5gd2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm2TTARn/zWn9ycOQusMteLh4ZURZYmOTXljc+OKHuU=;
 b=VXeyYuzguuwocidpKJfFgYcq1sBsRJgfyv6wFAsWhCkV3LU1sSFwtnkswPr7S5xrQrwnvWTKBK/oZDccn7fBRO9u+1VNbzFN+YZijj+co5qlwdqVL4vmIDiMBt7zOA2lvCb9K5LQt3/xl52Td/dENiaw1nXPT5UxZUiHZnNsqAlGiIeoXl1WQ4gP5HfVT782t9aUBZF0bhO+3Ix6FJ2XBHdzeVElZf5T56IKXf0PWeqQUYqftyYHyrcn9h7S+KkwkkzB9LK7cPNsoNHTMpeOWrdBsgpF4oN+IutVL3T4eJ6tSIWb1XvLugQlXfumG4GfWJENCWm6oqjy65fUG3puxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm2TTARn/zWn9ycOQusMteLh4ZURZYmOTXljc+OKHuU=;
 b=g0WgWrVErm18Jh8YPnSAt1wMHkz9jp3t6r6SK31ARqbe6ZfyfV96iJ4cCfmrueXuSZ+LUJNDnGpu8QJxT4JEj6Q3sOg43+m7C2msV55NGBIiJNEC0nMYAqRM8XP1R5693QXPWaOSp0cFQ815leNi28yZWKGOWXGH9Vhta/EtmNM=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David
 Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 4/6] tools: Introduce a non-truncating
 xc_xenver_changeset()
Thread-Topic: [PATCH 4/6] tools: Introduce a non-truncating
 xc_xenver_changeset()
Thread-Index: AQHZKnskQpdn03JGTUK9g3aWThI8PK6kKyKA
Date: Wed, 18 Jan 2023 13:34:13 +0000
Message-ID: <6ECF792E-962B-43C8-A2AE-E62D3F4EE801@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-5-andrew.cooper3@citrix.com>
In-Reply-To: <20230117135336.11662-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BN8PR03MB5090:EE_
x-ms-office365-filtering-correlation-id: b3f3a0cc-f1d0-4736-ee14-08daf958b007
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d2KVAtWn19K9f3rd5Jq0IATzVPvFidInhcsBK1HYrV4RGLdeZ3sn/MK8PJTl1NRcC07p/pPz3CdguJgosK+2eFJqFdMYEtUokxTrrOCbFXe3W5DS3jO3dxv6nrwGJ0qgjm7m8HLUYuxSAMeRChLymzxD+PDMbiIred2FgvngCt+zScr6/g80O6k7JTrWViGQHLOJ7qakoyY8x6goKCZ2+F1+Z0OcAWVhzTKmJYVTrnJuR1eJA35rsnQijs+M42so2dla74zRS2Csz5R+OUYd8KsShJ5WHeXJWBST4qkHeK0QDnaAHNhWRhYj/EVRYIGRO0JHOATIhFYCSJqO2CZmrAtLKPAe87V7vErsWH8JqJObTAvLwj0e9GbNnQXdud72yKd+wDv6aPprQYcPS6erFglYAXStKIWA9oiwFGq6pA+Zw0S+ZTIiy6BNL7arvq0E89ShjflevIgyY8IsuY1f7AzSJ6qmFw4Yf4AepURBYNQHMruZ5gavt/+elcfFzz8PpMUThPFu1gMz0R4zsuAay0QazxnWKYCod0/tZHj/ymCSCsVm+LAvj36UtAygDJ9YFBeHQgC/pDf/7MylIaJPuHlIJLaYjKB9SQhj00cSe07JLXO3SwQG3Sj/5gnhy1RQwjVC5RbmO0yOpf66quoZnjVgd4qNAfnnk3EGIB6myysECbO9At9YLm3dfKQbvy+P65aTUbps4hnRN8X9ezS/qJymNUXjq9Nw3UHfwotwxpE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(54906003)(6636002)(82960400001)(316002)(37006003)(36756003)(122000001)(5660300002)(8936002)(6862004)(86362001)(44832011)(8676002)(4326008)(2906002)(38100700002)(64756008)(66476007)(66946007)(66556008)(66446008)(91956017)(76116006)(41300700001)(38070700005)(107886003)(6506007)(2616005)(53546011)(6512007)(186003)(26005)(83380400001)(6486002)(478600001)(33656002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?znvDkHGwTVufBIXUKjP2JF8k5MLjApDIfLRMY3G6B53O5opTEw4/ZVn61fYP?=
 =?us-ascii?Q?yY/IDGrT4AgB80AAXX/7NhcvnfmCf2cwLHUmLXOEzqEuiRqaAS3rKtOqIew5?=
 =?us-ascii?Q?eRWwIGzg4zZRYgtSXsRQCozG1vV1MX6njDwBAcqFlyRzNS/hHKuSFdm1vU9Y?=
 =?us-ascii?Q?SGVbJqStqTaScSzMRzf88QwnLou+wEBxgIXSYfLonBMh7lYpV+9mL0ZGtCdq?=
 =?us-ascii?Q?vU0m3o/pQjI1rcJnas50QJ+BWYxjFFeUy8O4q3WLLgHwR8NqANb9FS8/bJuG?=
 =?us-ascii?Q?4ldt1TjVBCBxA6UPktIHBUVeSAvXhzv5tV5HzMID0bBh1hmUc4v3C4lWBqgB?=
 =?us-ascii?Q?5bRBXzGvuX0paBZH18UpcaplhheTTSYqSROVGnrHaVHQrydtNoUxW/39SucL?=
 =?us-ascii?Q?O8IxSM1zJ0mpWhXbK/90D9dnfzy3rcOR7Vlm13IylVdecOZiLx7ZmOP5SJ3s?=
 =?us-ascii?Q?3NTSPHhR/Y3VoQSu2WWqaTnt/IXaK7haoE8dDLR17SWIgPOKJvCytLTMFN/9?=
 =?us-ascii?Q?KGRlC9nmgQLwsrJxN2NRxVdoAsprMrMLGAD/4X7SPFJtzRjy//KM5JlTh2uZ?=
 =?us-ascii?Q?q28mjGuDh4b3wqZuqgAjK1mf3bkXhoW5IpB+gGP0RAG2eM0rCD19dzUt/pZ7?=
 =?us-ascii?Q?VEN+dMZZAu42DBIvxDE9YTnHmEmfymgZYfj86/M9nKF4H5WjvyY/ht9v3TKM?=
 =?us-ascii?Q?0FguyV6Z8V0VZexWEAa0xsfKDwVsu7NlYIFv6pDxCIH38DZr7kpEugmrE3Yt?=
 =?us-ascii?Q?A5089S4JAnDGclXI8mP3H6iTIw/RgxUmDJUDth8bop7HKHMTA0GE5HNbIyyd?=
 =?us-ascii?Q?5vebc2k3T6dpC87iRzFQc9JlgIyQ6Cn15qaNJj+NcqEX1BL6KeNsL45Gzp14?=
 =?us-ascii?Q?X0bCG+vNGxsPUzfiouVTE6GJxOh2pkHZEEWEdw6KUBmgERDmaIo4xb7vkSn+?=
 =?us-ascii?Q?ZRiuR5ip50N+05q7rIwmrokKHG/u9jW7QH6BvOp0PcSal+l2t8BDWYh0c4vf?=
 =?us-ascii?Q?TYd50oerLuoox4GFJGA78CwmgpcHFJKxR9r2/O9MALDURlj/s/0LWmY6wvWi?=
 =?us-ascii?Q?7yyXXqzal/FNVZz5WDIHETJR6dDxKAP5Ko4f8PFS97K1rcAop5Qjy1BShGqU?=
 =?us-ascii?Q?1lFDgN3UwGOYf9BTg57K8GcsEXxYdpx4eAUHG76nDu8Lu7ECHH5VRXkBsm+q?=
 =?us-ascii?Q?5VQ0i6bqdIIVrgjCZ6eHZgJ4/VGwYoSQI6C1B9LlCxVoaXDz+xavKzB6qV/d?=
 =?us-ascii?Q?aph2oPxedvZtr4kdginrU+TO1D5QXuPNYl2qMHbC5oSG4YHH3y9e+W6p7csi?=
 =?us-ascii?Q?I9gnDU0p1JK7oe2AcEvRhXpE/NncfNmbN0BXwEFuI0eecGL7I638LPS+eiEN?=
 =?us-ascii?Q?E/QmE8B1OBwU7dh1xpsrsW7l/WVpRmFTk1YClyrWNLBaJLROpmxW8Ot7GrW3?=
 =?us-ascii?Q?Z6Z055y0wp1LHVbogA6czLJFR1EH9WSBjSEP/cuhpnznRzwK5lgahJ5btr6k?=
 =?us-ascii?Q?Q2D1SAqWYVoXthqTvytlc8foksPtOP4uafBIBlMFd16ZeMmjblC+P7gCQV39?=
 =?us-ascii?Q?rWW7KcEzSAkzEWMuO4uMdNA+aC/e3Q130Ol0XRnLxunwSOl1cRkByrLATPDC?=
 =?us-ascii?Q?8mnvfwAGO+let0hPKbriPd0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63A079A4084BED428D5BCB9F356D4589@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HhUZ1nxxdgoOr7I1uO+IbGgUH/ZdFJwBL9F/YJ2E0akKXPE5OVjc6GihM286QLrEMfwEZO9t0NiotNOdFrClHYH1IuADnuj2P06Adc4h8xMwX2lBbMgPXVnMBDH6XZG4Z6v7r+7o7dG+bufH1DiGk/JmHa+FpC6RG8p4vsjPBcI0asVH2XecRC3xUeGSd+Xcica1NEaw6b9m2oYwmfOP3KvresFqEaDkg1pkFKdBQrZP/ypTfWhXwm2FwhAIawhp2uH2OrxXq/3HXuGGmmQyGBrcaHFD7Hs528AXwi/0PswGKttfc8q96cFyTlS0Km+iTkGgKRHt5RdNY10iYw9UOQg/M+O0KFEIboyn/2eKygZ2N4T/N/OA0f5Ugfjr6FdQwl6Y6vhexO4mcU9xpItJe23PJDzKpf7hLlSVg7AR75qj+amiDy0TqS4bFU2j5K3eI8hZD6av3HwT7KrcG5nB9Qi77DSC440FUv+PEToTZQKeRvJ06xBxEzlrwrvYBHVd2HYcEpwSm4Z1RHzGa7P7BtvoKlnpPEl/HiWUXSftR1hDac2eSmE8kW6NZki6A7Y2IWGvh0JizkQ8S28a7DUPjGzEcVTfqvYY1Xymfn6aRDQbZ8/0HmMhkh3uBOT8Q0j4ooeDCH8tHr3yxws9ewZfJ3q+GvAjkLyjXdArG0YA1ccGvNwkI3NfzklHRIV6BW0GCI422vOEImVq5HTljXb7uVNiUo4aQMVuHRP9jhK5PR6qrHMKN/ptiJuee24wEB2u0D+cs3mhw7c7e2GP5BCtHF3+xHBFZJbTxqjR1dzA3mtFTAGrQIbwEnfYjq99NxAnQEBO5N+dh0AN4Ke0EpMp+fUdpWZOaQr6uZGtsiHR4Dw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f3a0cc-f1d0-4736-ee14-08daf958b007
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 13:34:13.1000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilh0sYox2lyENVasF/FURCTa4dD3JK8JIKK1IMDEkOkvCkUJgKwSD8n4AijG53XB0iktQ4kWfygXfTKlYAnmm916SwzdksXFepl7eN2hqF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090



> On 17 Jan 2023, at 13:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Update libxl and the ocaml stubs to match.  No API/ABI change in either.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Christian Lindig <christian.lindig@citrix.com>


> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> ---
> tools/include/xenctrl.h             |  1 +
> tools/libs/ctrl/xc_version.c        |  5 +++++
> tools/libs/light/libxl.c            |  5 +----
> tools/ocaml/libs/xc/xenctrl_stubs.c | 19 ++++++++-----------
> 4 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 279dc17d67d4..48dbf3eab75f 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1610,6 +1610,7 @@ int xc_version(xc_interface *xch, int cmd, void *ar=
g);
>  */
> char *xc_xenver_extraversion(xc_interface *xch);
> char *xc_xenver_capabilities(xc_interface *xch);
> +char *xc_xenver_changeset(xc_interface *xch);
>=20
> int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
>=20
> diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
> index 512302a393ea..9f2cae03dba8 100644
> --- a/tools/libs/ctrl/xc_version.c
> +++ b/tools/libs/ctrl/xc_version.c
> @@ -161,3 +161,8 @@ char *xc_xenver_capabilities(xc_interface *xch)
> {
>     return varbuf_simple_string(xch, XENVER_capabilities2);
> }
> +
> +char *xc_xenver_changeset(xc_interface *xch)
> +{
> +    return varbuf_simple_string(xch, XENVER_changeset2);
> +}
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 139e838d1407..80e763aba944 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -582,7 +582,6 @@ const libxl_version_info* libxl_get_version_info(libx=
l_ctx *ctx)
>     GC_INIT(ctx);
>     union {
>         xen_compile_info_t xen_cc;
> -        xen_changeset_info_t xen_chgset;
>         xen_platform_parameters_t p_parms;
>         xen_commandline_t xen_commandline;
>         xen_build_id_t build_id;
> @@ -607,9 +606,7 @@ const libxl_version_info* libxl_get_version_info(libx=
l_ctx *ctx)
>     info->compile_date =3D libxl__strdup(NOGC, u.xen_cc.compile_date);
>=20
>     info->capabilities =3D xc_xenver_capabilities(ctx->xch);
> -
> -    xc_version(ctx->xch, XENVER_changeset, &u.xen_chgset);
> -    info->changeset =3D libxl__strdup(NOGC, u.xen_chgset);
> +    info->changeset =3D xc_xenver_changeset(ctx->xch);
>=20
>     xc_version(ctx->xch, XENVER_platform_parameters, &u.p_parms);
>     info->virt_start =3D u.p_parms.virt_start;
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
> index 368f4727f0a0..291e92db7300 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -983,27 +983,24 @@ CAMLprim value stub_xc_version_compile_info(value x=
ch)
> }
>=20
>=20
> -static value xc_version_single_string(value xch, int code, void *info)
> +CAMLprim value stub_xc_version_changeset(value xch)
> {
> 	CAMLparam1(xch);
> -	int retval;
> +	CAMLlocal1(result);
> +	char *changeset;
>=20
> 	caml_enter_blocking_section();
> -	retval =3D xc_version(_H(xch), code, info);
> +	retval =3D xc_xenver_changeset(_H(xch));
> 	caml_leave_blocking_section();
>=20
> -	if (retval)
> +	if (!changeset)
> 		failwith_xc(_H(xch));
>=20
> -	CAMLreturn(caml_copy_string((char *)info));
> -}
> +	result =3D caml_copy_string(changeset);
>=20
> +	free(changeset);
>=20
> -CAMLprim value stub_xc_version_changeset(value xch)
> -{
> -	xen_changeset_info_t ci;
> -
> -	return xc_version_single_string(xch, XENVER_changeset, &ci);
> +	CAMLreturn(result);
> }
>=20
>=20
> --=20
> 2.11.0
>=20


