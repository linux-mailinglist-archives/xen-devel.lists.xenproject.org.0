Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01FB09945
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 03:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047748.1418114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uca4F-00087i-Eq; Fri, 18 Jul 2025 01:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047748.1418114; Fri, 18 Jul 2025 01:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uca4F-00085M-BQ; Fri, 18 Jul 2025 01:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1047748;
 Fri, 18 Jul 2025 01:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuZO=Z7=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1uca4E-00085G-4k
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 01:39:18 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 020fa1f1-6378-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 03:39:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56I1dA1S004431; Thu, 17 Jul 2025 21:39:11 -0400
Received: from XCH16-05-10.nos.boeing.com (xch16-05-10.nos.boeing.com
 [144.115.66.94])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56I1d7IC004402
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 17 Jul 2025 21:39:07 -0400
Received: from XCH16-09-08.nos.boeing.com (144.115.66.156) by
 XCH16-05-10.nos.boeing.com (144.115.66.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 17 Jul 2025 18:39:07 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-09-08.nos.boeing.com (144.115.66.156) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Thu, 17 Jul 2025 18:39:07 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 17 Jul
 2025 18:38:59 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by PH3P110MB1847.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 01:38:58 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 01:38:58 +0000
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
X-Inumbo-ID: 020fa1f1-6378-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752802751;
	bh=LzVPC0qwenVfhnKWiBJ8DO6rwXhZgBlch2qKiHwXgKw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Z0fokcP76ryRnGUlG1PPJ6DlisXkxt+WrtcHns7JRncyLP1myyPOtqNECIDoGKkVC
	 ATGVJPk6wmA9yBC25L/sobwhcfxu5acmJS3e1WtIlooeKbA5f3A7bJiO99uSIU/1f8
	 QRw22lhuztNFKrBH8MS/hnAMqT5CyeFpxo6FiDXSeFf+x4qoZC57Izf1J9sd6nN/Oz
	 Cq9LX+AbwrN9ctrot8zY+3ToJvOTYH2/MQolfpTsDiAoyiNe+5lUsTfQQd5N0FK22u
	 e2z2OGr19v9cgEOgJ2XOLFHZgVvjK6WcjzDnMYXatBi0UABZrTwiVJo7SDlZagDxUV
	 jIYlh7DYIG7Dg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=FtcEZyZf6jZzfrzhzS8+J9bZopJzvJesHSsnDL2SDXsvX3AIttvOrA4soU+lPYcii0FIfVbnoqikZD/Ee4nIQSCiAzmRGkqgEO/jrJ7BW0NthkrMcT3jO1QSmwhnAnXww7xq1Yw/vPPgI2DJ4xolF6eZWBuQkP5k8WMWH6pYaOYEteP9iyjyCRLxb3mU4Pv4++2Lh8kdjf6S0j3MKXaLP147mJvbanYoHGDqSkUvPGgbKCCZ5i5ry+Fov5q+8Cvcez9H2N1oOYJWtOmYYV367yGkKb2Uk+hHznSARVmkTNReVxFVrrxtoNknaJfdwwMeRt8F+3uX/bV0y20HOHkB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzVPC0qwenVfhnKWiBJ8DO6rwXhZgBlch2qKiHwXgKw=;
 b=d8GLeI5sD/y5+LsBmLUr7OSdS8ZZ2VZPsnUuWjvU52woX+SayDvxlGblE9e5qGjcVN4ZaDpq7jFCN1R9tew4QTO5AxWgAsKTpcxf2bP2DQJuXkSn01PvTIvYHw646V4a1Au8no65bs6tfdsbH+sPG5AcpUrVr99hxDr2xlR2q8wehYpI3Zu0AsWLjbBVPc7gzCvuyIjp+j00VP1C75WNpR6LhPo3WfuTeuroaWY4XJ8zKeB4gYhFB25V2dVW35w0ou1Li03vF92Q1A8M7RyZ/r7y2MqErSF5Bij4bKSbtwySM46yzhXZ6eCATtFR3dZn9eIsMcF36ZjZygyxBbw/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzVPC0qwenVfhnKWiBJ8DO6rwXhZgBlch2qKiHwXgKw=;
 b=EGFLI+WWnNmzysrXzShsLtL3TzUfDl+gRwcKiyRg1LL6l2kihZ3Ho2MSJM/vmCm82sGivnR9xkuJ1/2BUF2GFoeVgqOolFv4UmwcN20HIPr20R2HdSRPcNN9HtOpYqNqp/SoS22lnQdYbX96fHfxa4KbteFgGElmHxjVFet2Wto=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Nathan Studer <Nathan.Studer@dornerworks.com>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
        "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>,
        Stewart Hildebrand
	<stewart@stew.dk>,
        Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>,
        xen-devel
	<xen-devel@dornerworks.com>
Subject: RE: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Topic: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
Thread-Index: AQHb9z26goGsZ4LY30285h3BvJPydLQ3FIeg
Date: Fri, 18 Jul 2025 01:38:58 +0000
Message-ID: <BN0P110MB214810B8239A418B1AF540E49050A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
 <SA1P110MB1629479AEC6F1B8583D7725EF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB1629479AEC6F1B8583D7725EF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|PH3P110MB1847:EE_
x-ms-office365-filtering-correlation-id: b126632a-974c-4fb0-0186-08ddc59bdd94
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?y9wOyt0GosYBOAi275vsR72Pbl6MPnbSZxirwGjj6TpUN4hLGmLBIoLqSRFK?=
 =?us-ascii?Q?vFISsMUShx5DNS5aonO7wJ2eJAb9qb8QlSz+k4rpKfL0r2JuNKxfMXdfM6I5?=
 =?us-ascii?Q?+NY8e6v9KM+T4HuGyqY9hndqSOcHt08eyglvTMOxgHzJrlbZiSMchLtFOyEF?=
 =?us-ascii?Q?v3KQk/AaKGiv6eJo1GIXt/WrSbe6AFEl6pnmyOvtOF8u80OWbbohhq2jvnYc?=
 =?us-ascii?Q?UUXfeDy35qSTmZqShWlBTKCP/JhTtC33euXZl8g0w08WZwJp5LZrJ9d/oXZF?=
 =?us-ascii?Q?yR3fZUziifkAk+i/YXUU9beMuGRA66BUEl02JwOOe8+zQElPYjTe7xa3/SQW?=
 =?us-ascii?Q?VAey9gT11d3qwxslYEiIDmT4IYPqCQGP+OjT7mh8BrJAWi9xqheizh++VUaL?=
 =?us-ascii?Q?jF+aSnutonemvTNE/9jTzpd+1aEIX3FzUG4u2O1k0VnoscYB6GjxIU+y8faD?=
 =?us-ascii?Q?4hwvpgHW5u/4KfdueplMZQmVRlDehpahTgm2qNKRXgRAFP48ZCi6zmISeFFR?=
 =?us-ascii?Q?WetlTW1PioIhSFq0GBdmxQaamL7VsImozkRXmK8pR4cpL3LK6htANmZDmOSe?=
 =?us-ascii?Q?RpnvyBOwzcg5G2wgsm49O4YljyBg/Att127KfId+fX8uKwaoCN12YWsLeahl?=
 =?us-ascii?Q?6bOWnO6rhuwcN+uvbbLFFOr9K4/n+l+KqkYAh4BQxXU+EJgDcc7p2u+Wpb/q?=
 =?us-ascii?Q?bIA7R9qttKafiGRSTF9/JvtErVnb7r9GwHD52oB0GJsJ+6jIbL/GFGSHQd3t?=
 =?us-ascii?Q?Ky2ISTn6q7E4AnGGtgFheqRXYvcKUwC8mC8C9/TlkPtJWYjoJF1Wshbyk8aB?=
 =?us-ascii?Q?KpzG38fJ096uOGQHx1ViPw3r4iD2ZtE4JGEoEXFz3FuIFNFrAk5HRSm+YliS?=
 =?us-ascii?Q?PEJH0xzI5jZdGi3HvWGXHR7Fyay+mQJ62LdX3b0ZoFmPpDJCZVguHe/m904U?=
 =?us-ascii?Q?tSQDLeO7RChR43XOv7wlaaseC7EKQwryRznkkCnknghY8r8izuV9qaahtc0J?=
 =?us-ascii?Q?PWlMa7RO6AjRmusYOLtwjdQ35RQX+AItrykNQDcAYxKYur4G4CcQtgkjqw+S?=
 =?us-ascii?Q?pJtjbo/E6I6ipBHc/5m5bgtPbFUjmw6GjOg2C2pHQWGi7OUsjTdUmxmZ1NtV?=
 =?us-ascii?Q?Jc/pg1wyR/8e4vs4LxKqrkdy5UiuJml01zv/YNP6OXD1WuM5vfnhZOake5qi?=
 =?us-ascii?Q?5P9oRSdGbuDT4lVujEb4nwAnIenkyal4iG/GXBqQuvzMe+N+xnNltvRVo9CN?=
 =?us-ascii?Q?MG1Sf1bXm0bAXpt9DV2hRV/FFqvPjSa0GXxpLitF0DlTVvtud4TG4zOH+NC2?=
 =?us-ascii?Q?osec2XQ+hIB9S14ZOXu7j+vlATGEGCO1XJNwg+r88+adIQGjELr1eH4BgEX8?=
 =?us-ascii?Q?EXQhZzLSgt5P+L/iq0xqXSyEFN0oqdVJBhN7jDcBJ7wnhnqrlovg0pVX0UsH?=
 =?us-ascii?Q?lLxxKHvg3aDnGEPD4O/VN22Fo0LpxN85iWnusQZgjNV5hqDacfOF78kLFDBw?=
 =?us-ascii?Q?xU5+3leiT/CU+YA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yDsztaJzia+LeBR3pHDV6eS45/zdJ5SG6AVwk9eqexVKERVO6az0kAiVxSsK?=
 =?us-ascii?Q?ZBvn3REoytSPhx18yeaot5qxPMVnf+2QCLpDprgs1XgeI5ehNQbQdIZFNElU?=
 =?us-ascii?Q?tYq6HcCE9chNwykpT3TcAPXyERTVdEqI7k6QFLHO+91NKc/LYGkQHkCSUeax?=
 =?us-ascii?Q?fQ7PXPjrGl+SSPdEy1f22QdgaUkYQNqWrOPojwp+8/rPuP0S4/8jBaKmSD7v?=
 =?us-ascii?Q?Rp1LW4r3JNVHqy0va2elGGxtt2RvEPvGVxlSPhDpWrGjwTo64OjBAHRxfneP?=
 =?us-ascii?Q?4ap82x0plFZLW9KQRmK8VIQxaAtCO9MyTIA6G6kspqhKBdvHr/2NniQEXRrl?=
 =?us-ascii?Q?cPxyn1eZr1r7EaB0wnS9GJKCPYgzK7l5nZcVyrlcFYnbZH3tcp11cjXOgiLe?=
 =?us-ascii?Q?RBYEzxiG9paITGfzuDRNzXOQxn15xIxt0a4kB5zhO4Qq4/L7dmLJmCUXfjnQ?=
 =?us-ascii?Q?9IB54FN6I66l6sVeTCip6i/uNRfPtO8qzzE1nJPqEXGa8cTBNk6etTX+7+7V?=
 =?us-ascii?Q?axuqTkh3s39t5hamFBIwgqrkpIm+oStunaMUQzVHURPnswryMm97zPCEpLV7?=
 =?us-ascii?Q?v8Ehcqp5JtnjbWlaP4odmAEjlMfjv7q9bo8xrpbiYZgpSoFHqusneqUpNJzn?=
 =?us-ascii?Q?uQdgyYKGgrlFvVKodUVxEt886th4zudtdAbiouyeI30bfvsBXPdSatt38cyt?=
 =?us-ascii?Q?pCW7IZ5tgYA+0gJqrgZAmB+vmPv06SDn1PRODLbDrIr7YmLl8BEZ2550IdwR?=
 =?us-ascii?Q?qh22xqrJ5ePyU9ZZBFfkD2xZz7kCWdtaHDSF7Pxn/8HonrtOq8dKBre4LE3b?=
 =?us-ascii?Q?fj5JqXbNYDHyMAx02x1sy1cCv42ISryLBqaNVTSc3XT5dcTBO3TM86LfXmri?=
 =?us-ascii?Q?3CZKy2OHZyJddkSdqgkH0QY5zhaCf0cExkmndjwqKhC7iEoUp8DYATk5XEKF?=
 =?us-ascii?Q?Pgi/8QIuW6X1lVyyRvAvefcKxozNh4qv11s67Yeq/qRgJ9nV33GpRyMwafTF?=
 =?us-ascii?Q?yTIv8J9TaKV5ohoSqBlRLylZoQI4mL7F03nQSPxOKca717DHSdhqMw8qT2Xa?=
 =?us-ascii?Q?vdnR8yecNfew5oUJsGHY7Fxb25PfKpIhGFv2qGcwvAP8q6TjxpwxErRC/xJL?=
 =?us-ascii?Q?EImzZSA7l2O4qZ/4EyDvsbJJfcD8efjULGukXM+aEP+xH10P4ynwE63yY2mN?=
 =?us-ascii?Q?rz1BmhE0c7Nci7QbBC1z3xhETKjTdESWez6tWQ5ylmXEwSl3RKDA/GIocrxq?=
 =?us-ascii?Q?JAvJ3zX+oHoIr7dvDM3U/Z93aBcRUoDAQUJVfzDXs3OIRj7kmwWoa0kf5VL/?=
 =?us-ascii?Q?bs5ozSpCsa8j7oGa+SQKYYAbOS1PUR7k71wcur2P30wtVlxN8W5kMSReHDJA?=
 =?us-ascii?Q?Po7RXc80dd369TgbuKbpeQbbQ2BuiP3QxoMuu1VdxcggebYvD8XvGhHi28SW?=
 =?us-ascii?Q?9i1OVdmjMJNVuPmR07u+EY0s3JdhirTa8xnqi4Ay8pfD+m7jpmn0hq+18CNu?=
 =?us-ascii?Q?FD5YRe/wc2e+WCXg0jf3CqTKbw+2CR5kPS3J?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b126632a-974c-4fb0-0186-08ddc59bdd94
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 01:38:58.4502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB1847
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

> EXT email: be mindful of links/attachments.
>=20
> On 7/17/25 9:21, Hildebrand, Stewart wrote:
else +        { +            sched_priv->next_switch_time =3D
>>> sched_priv->next_major_frame + +              =20
>>> sched_priv->schedule[0].runtime; +          =20
>>> sched_priv->next_major_frame +=3D sched_priv->major_frame; +        } +=
=20
>>>   }
>>=20
>> There's no need for the above loop, this can be fixed by subtracting
>> the remainder (modulus major_frame). E.g.:
>>=20
>>     if ( now >=3D sched_priv->next_major_frame )
>>     {
>>         s_time_t major_frame =3D sched_priv->num_schedule_entries < 1
>>                                ? DEFAULT_TIMESLICE
>>                                : sched_priv->major_frame;
>>         s_time_t remainder =3D (now - sched_priv->next_major_frame) %
>> major_frame;
>>=20
>>         sched_priv->sched_index =3D 0;
>>         sched_priv->next_major_frame =3D now - remainder + major_frame;
>>         sched_priv->next_switch_time =3D now - remainder +
>>                                        (sched_priv->num_schedule_entries=
 < 1
>>                                         ? DEFAULT_TIMESLICE
>>                                         : sched_priv->schedule[0].runtim=
e);
>>     }
>=20

Stewart,

I appreciate your suggestion to eliminate the while loop.
What about initializing major_frame and schedule[0].runtime to DEFAULT_TIME=
SLICE at a653sched_init() and use them until the real parameters are set as=
 below to eliminate the if branch?

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 930361fa5c..73ce5cdfaf 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -361,6 +361,8 @@ a653sched_init(struct scheduler *ops)
     ops->sched_data =3D prv;

     prv->next_major_frame =3D 0;
+    prv->major_frame =3D DEFAULT_TIMESLICE;
+    prv->schedule[0].runtime =3D DEFAULT_TIMESLICE;
     spin_lock_init(&prv->lock);
     INIT_LIST_HEAD(&prv->unit_list);

static void cf_check
a653sched_do_schedule(
<snip>
    /* Switch to next major frame directly eliminating the use of loop */
    if ( now >=3D sched_priv->next_major_frame )
    {
        s_time_t major_frame =3D sched_priv->major_frame;
        s_time_t remainder =3D (now - sched_priv->next_major_frame) % major=
_frame;

        sched_priv->sched_index =3D 0;
        sched_priv->next_major_frame =3D now - remainder + major_frame;
        sched_priv->next_switch_time =3D now - remainder + sched_priv->sche=
dule[0].runtime;
    }

> The direct method suggested by Stew is preferable in the unusual case whe=
re
> many major frames are missed.  (We have only seen that happen when using
> a debugger.)
>=20
> To help uncover any issues like the one this patch addresses in the futur=
e we
> may also want to follow up this commit with a change to make scheduler
> misses more obvious.  Something like the following:
>=20
> commit e95cbc9078127c412bd1605d93cb97837751b5b4 (HEAD -> master)
> Author: Nathan Studer <nathan.studer@dornerworks.com>
> Date:   Thu Jul 17 12:43:39 2025 -0400
>=20
>     Do not silently skip frame overruns
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 2d0d3bcbb3..a2c1c66c27 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -523,9 +523,17 @@ a653sched_do_schedule(
>      a653sched_priv_t *sched_priv =3D SCHED_PRIV(ops);
>      const unsigned int cpu =3D sched_get_resource_cpu(smp_processor_id()=
);
>      unsigned long flags;
> +    unsigned int oindex;
> +    unsigned int missed;
>=20
>      spin_lock_irqsave(&sched_priv->lock, flags);
> +    if ( now > (sched_priv->next_major_frame +  sched_priv->major_frame)=
)
> +    {
> +        missed =3D (now - sched_priv->next_major_frame) / sched_priv-
>> major_frame;
> +        printk(XENLOG_ERR, "Missed %d major frame(s)!\n", missed);
> +    }
> +
>      /* Switch to next major frame while handling potentially missed fram=
es */
> @@ -544,6 +552,7 @@ a653sched_do_schedule(
>          }
>      }
> +    oindex =3D sched_priv->sched_index;
>      /* Switch minor frame or find correct minor frame after a miss */
>      while ( (now >=3D sched_priv->next_switch_time) &&
>              (sched_priv->sched_index <
>              sched_priv->num_schedule_entries) ) @@ -553,6 +562,12 @@
>              a653sched_do_schedule(
>              sched_priv->schedule[sched_priv->sched_index].runtime;
>      }
> +    if ( (oindex - sched_priv->sched_index) > 1)
> +    {
> +        missed =3D (oindex - sched_priv->sched_index - 1);
> +        printk(XENLOG_WARNING, "Missed %d minor frame(s)!\n", missed);
> +    }
> +
>      /*

Nathan,

Do we need a comma (,) between XENLOG_WARNING and the quoted string when ca=
lling printk()?
And wouldn't the log be printed every time a new minor frame starts, for ex=
ample oindex =3D 0 and sched_priv->sched_index =3D 1?
I think you meant to use the condition "if (sched_priv->sched_index - oinde=
x) > 1" to check minor frame misses?

Thanks,
Anderson



