Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C5A63F26
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 06:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916158.1321301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu2ho-0001ds-JU; Mon, 17 Mar 2025 05:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916158.1321301; Mon, 17 Mar 2025 05:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu2ho-0001cM-D6; Mon, 17 Mar 2025 05:08:04 +0000
Received: by outflank-mailman (input) for mailman id 916158;
 Mon, 17 Mar 2025 05:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Z1w=WE=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1tu2hm-0001c8-V3
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 05:08:03 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca16a7d0-02ed-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 06:07:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52H57tlj016652; Sun, 16 Mar 2025 22:07:55 -0700
Received: from XCH16-04-04.nos.boeing.com (xch16-04-04.nos.boeing.com
 [137.137.111.19])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52H57iJD016553
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 16 Mar 2025 22:07:44 -0700
Received: from XCH16-06-01.nos.boeing.com (137.137.111.28) by
 XCH16-04-04.nos.boeing.com (137.137.111.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Mar 2025 22:07:43 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-06-01.nos.boeing.com (137.137.111.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Sun, 16 Mar 2025 22:07:43 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.181)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 16 Mar
 2025 22:07:40 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by PH1P110MB1396.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Mon, 17 Mar
 2025 05:07:38 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%6]) with mapi id 15.20.8511.031; Mon, 17 Mar 2025
 05:07:38 +0000
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
X-Inumbo-ID: ca16a7d0-02ed-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1742188075;
	bh=Z7IUTuOwfQpuS/VQLgUi8jPOyLtavJ0bguvSIR4AbeE=;
	h=From:To:CC:Subject:Date:From;
	b=PIfcSvnMeybjZ47UcpypMGnU18ov/av8qHfcX4bklN5D7YmDbPB4Z/HcMk/pV95Y/
	 hcYlSibIY4nCnnrzrV44y+MmQoHOqx3ChjM9wvmBlHfcz+6spwnV87dKWvEM2UJ4+W
	 kTTeUkbqt++nfmOJtB9seCL0lAOw/xl0aZE+uy1iIckv+lvngHuSfo8+5ku0Kt4dDp
	 GNDS1qX1+EE6dEHmrdvF5rFchC/mQ9lxAFRaEoOReweRkjh6WVed0F9sARXYz1rLgf
	 YE1g+/KLZGFqAsNNgI1xTCYgJMw2AEsaD34g5uxOrQ1SMSLbGN3T4bT6wV1xRLS4li
	 oBL7sg0E+tWYg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ZmwUxdG7NvKkID1MTHcM+0GsB1VS5fzAnsW2J92A35PTzb6mdPb30VgIGuIs896FT2knOhA8tN1eZmR2F6hbXS2zwf5IIa/05JoJlRCoRi4jdHPe9TrzVQwtBsmWSkFCsBvMc1P+j+6UDdcyUT4DbxlCH+bQrd5hyQykqNQDs5pE8CNs4v2lvJnIp1rfYbJJ82MQ2oWKU+SL5XeUfbLFmYyi5uXvKnCCAM8f8Zqzhz4py/AVod/iiw43E2Yk95tHF7zIh3QgDs0WJuWjH+79sfrNtbWfw5wcogQ9+T7oN0n2bpyZkJsPIqmj9Tplyb8IL5NVE5Cm5VBaRwNR8CVE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7IUTuOwfQpuS/VQLgUi8jPOyLtavJ0bguvSIR4AbeE=;
 b=wmfgRiUsqeUy6WOJJA/Sw2fWC4RPvit8iuOr55chMv+mHzPJG8gqRoAR+CBNawaOmu7Xojzwka7paPd5RXa4LDHhLqEbQj2yruQwbhQxf7EAFej6VtNVqf9IeNYK2U0cWNwDfHpGE24y7WeoHn+s2esPlRxEWIebEZFgsymntM669CkwbhFA5Bk3YtcOtKJJBggKsnetX06L90nnTeJCYXR2xTyiMtKj2W0ULzqjWK0zL+W5zpAMuCcIIyK7qVxiWtD1JqsRefgWYzGc6Tg6ML7VgqbAujIX94ClqaA7VC1/KdcW2GGKQ4FuWeCnH6D4ZhxXAd7DV5FS5X5T+J6V/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7IUTuOwfQpuS/VQLgUi8jPOyLtavJ0bguvSIR4AbeE=;
 b=BbRJ+47xslnPE9WRB6zH51rh6PnWOXT46Vly5EZ4ZLyxYZ9dz+6tA/D9+r93JcPt0CPY9nLzGP0RRJhazhEAyjj3NllJTF4Df7CAaWklA5z8zzi5DGbPq4UMLKyAfd+i1lCNcMJhm2gc+ISXLSuQkwX25njC+Kx6avD5xmadkIs=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>
Subject: Xen panic when shutting down ARINC653 cpupool
Thread-Topic: Xen panic when shutting down ARINC653 cpupool
Thread-Index: AduW+TkPYPhh1TXsRdStDrK0/zWwnA==
Date: Mon, 17 Mar 2025 05:07:38 +0000
Message-ID: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|PH1P110MB1396:EE_
x-ms-office365-filtering-correlation-id: 8418bc6e-272e-442d-5a7a-08dd6511a370
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?P5LYiOBT1eZ6ubIVbIKTmoaZFMRasOfikcKZfFtkH1leLb+FGzwQ/ewb7W4p?=
 =?us-ascii?Q?r1+AvOrwM6/wqjnhH2yOrWvYHQCTM2mpK9vZ7tvyouEKozhZzySJ54Eec4zL?=
 =?us-ascii?Q?IXHTRE6Jj1elsrZ1aVXbES5hQQkWCcxBt3HWtnJwZ5VJnNkWQzRSOlo8wBsC?=
 =?us-ascii?Q?Pc7h2aN8WD2oZFpPG/F9439tWc0Wme2c9Y9arO87mrIuXRvKGHGQ84ddKPS2?=
 =?us-ascii?Q?vWBV3rDRdh9Hg4JGFzJh6qQOeOIyxOrEi+liU0g9jd/g3PJ/8hXBwjm1dVsQ?=
 =?us-ascii?Q?as4/HkofCPC6h3WcL/jhO81erJOGd8vvRM+rVAqGsaXYTb4sCZJU/4Wq4vvT?=
 =?us-ascii?Q?q+P8WYQzyzI+BLGTP+fViTxgzCLaYDZZRX3onTp7yke4XDTxdgcCbnGKRPyb?=
 =?us-ascii?Q?QRcetn6jtM2zztNgHGSoOBjDmVoQeHbUzkUtE3r8i/PdB/O7TVSd30s2lNmD?=
 =?us-ascii?Q?dTCivevbm/7lgdWkXBIV6eu6BEWG5C/JDz6m6sAj3AjHcN1eyQJGNw8ox8Nm?=
 =?us-ascii?Q?ahURf6bpLcJeVciP0dqsSpBh5101kIejbpF1e/A5v+lUtm8p0TPSuUHvzBYE?=
 =?us-ascii?Q?/HAv0IaP4bnMtK6wGFKR9TCYKKOAwNXLdCCaOMzQZ68n14VCmNot49k/UsV1?=
 =?us-ascii?Q?Y1mrHr5LePHLNjn5+LrZ5mU1w8uhItia8KY3K/Zb8gXc00IfeoFcONQC37wa?=
 =?us-ascii?Q?bysRGsxmEaonY8jbpAtjzhBQoIDvlxaLOqzdPjJx379H5rdG7ntUPZVpTzLm?=
 =?us-ascii?Q?KuVMsS7Z4HEjoO2uuRAwPLNvWBLncgo1eJBifn+F9OdBFEkvNPWQ8/lqpP/N?=
 =?us-ascii?Q?eOrR6Twft5tIYP4i/dowEUX/WsWPnR7swDN3BKJ4ez8pSVr4kcSElDwzJP6E?=
 =?us-ascii?Q?nM2BnA7V5z89Ys0TF7dna09s+5/ErCOLRMAu/Q5o8OazUTpzYnNtiTk0S4tA?=
 =?us-ascii?Q?j9t8j8DRceNOCK0FjQTYSZEVeK4enJmhCbmIpUlLpo65gF6p8JNCHOI//l/5?=
 =?us-ascii?Q?oBZo3853MZvOUsMYctnImD3E3iaAMBI4tAPJAFPUi7g6ZGC8uZ4LlwCMLtnq?=
 =?us-ascii?Q?fioP2KU2qLalz9AWXkk4xcJOo9WJvMCRcLSZ6O2Fb3CE+xJDPaxJTaoWc2IJ?=
 =?us-ascii?Q?vKzyH/aofs2b/B5UfK0jR1mEis2khrjGjhu1/Gbc/j+fnoFrTZ6YkHJPFQFZ?=
 =?us-ascii?Q?IL6Fmzh988l5ziWksyKMkyy2CcpjYskdzgHPpLuXwBJzjFiQsEBkN9saix4z?=
 =?us-ascii?Q?3bv45actUJmhLvwZFmql0bKnVDTVFTN+vYR9i18rVgRQhxEq1J8WY7E8O28M?=
 =?us-ascii?Q?VG3n/6hTP47upLPqLQeJXd/oMySHeqMQnXCE4vOn4NYemp8RZT0H4VrAZmrH?=
 =?us-ascii?Q?Cd9EHpb7ph5oyIzUxLuFX1nRQdEIs5TCZg4rAD37vR/Bv1M5qyXIhevCcowZ?=
 =?us-ascii?Q?Gh2Gv77rtyrExD5hGsoNOp7NxMAw59Bc?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7uy84ms81+vB2CgE3NJ0xj6iTy0OSY0xVRB66shfADt6SPC7mO3WasUwojQ3?=
 =?us-ascii?Q?jqOe1L9mO69KReh3kH8j6Kl19YfjtJ5AtZxeEE/vxke/QecjglnzuCTUATtN?=
 =?us-ascii?Q?n6k824IrlXy7qlpoGmievQ99f0ig5rYozOpBJDzCcW6kSoC0OIIeqrTntUbC?=
 =?us-ascii?Q?ejQQD7UUk/Zkgm4VVvlrA30qzT337El0CiaShgZil2jkCVKvvMkFfFrr4us3?=
 =?us-ascii?Q?+lfUq5R4CVvn83lGW6FDaJI036Aby6vMWiw6JiBCrz7fbCLBFzvwIdMcX8Ff?=
 =?us-ascii?Q?WN7s2TeBPUQdrXme7FOGuk2nl7PH9k3HI3c8KF4A++giNkvtAreR8TAcUwkX?=
 =?us-ascii?Q?kAKoK5RupW+uper/VmxJ8fEDsuJx2qjB10tl19ZuEBvh2HeCya6QHhII1sx3?=
 =?us-ascii?Q?cguj3AgQJ5Bn4y3zRyyfY/CEBxoO2TxrPsd/6zvTqZLYz9lylI442Y6uFOFQ?=
 =?us-ascii?Q?UanLyZqZ8j25y+gyX3ntaMLtd2Pxl4Xqfdq4HMuVpKEkyumbTVpD1IsOlxH9?=
 =?us-ascii?Q?4aA+1tZnIwHh0F1D6//eNA4axW7I+l3zugdJYXlQ5B8HefSE7otYsvxihIfs?=
 =?us-ascii?Q?Azsd0pTR8VOL/XHyeS9+1xBPAE176f0gHLTnUIVgy/ID9lcObWoIHcTROfJ7?=
 =?us-ascii?Q?4/U5d1mb33PxByltpQgJCecx/KHGupGwS0+HluFUWF83oywjLcWLx4yvOx20?=
 =?us-ascii?Q?hc6f0iOr2nUHapI+x8+ee9TdQsvhZ9H7veGnGDzYIJHf1TFhVx772O++lbEV?=
 =?us-ascii?Q?NU2NN+u8FT3J0QeZBvu99/NvGFPVSczHEW5y6ADPmLVQQBN+HBviLiqQOzbn?=
 =?us-ascii?Q?/7IU+db64ZUEuZX+SYckexS+Dc21FMPHW0V3XsIaOFx1CTVF0q5jNu6WO5qX?=
 =?us-ascii?Q?u3Ee0BljNlECgboLQDbeplcXud1lBJOiODSfHCfcmEqIvtBWqrVCqvt+fGmQ?=
 =?us-ascii?Q?sMxGPohpeIE09QXanr/wZEsKAxWejxKUdBusBrSXzR3rzKDVzXuQsT/VhsYv?=
 =?us-ascii?Q?KZ+nGTkCyoM0ns8W7DQ9UsUFMbdy1GdupTHZnub+xJC84yjeNuEwxXQkMVNg?=
 =?us-ascii?Q?C8dB/CQeaXu4aLnemg3Vpuj8J04MxI3R1B2zKivgLC6ssHVY49ko6bZBnYdN?=
 =?us-ascii?Q?WIbRG7qjMWuYZXHZqvXmwMcAPCSFD7Yz8eQGPVYQq3i1KMVauooTuKGdloyK?=
 =?us-ascii?Q?39c011TEDe9uZwbDYBnYghbp9Rt4rzD4UqFyUft9nFs0MIXp2SUgSx/NVi/V?=
 =?us-ascii?Q?c2dO9LqCLh9UGceWRZVzKbEPakXAwu8pe0/hDeE3ZAsXC/kHC54QKdf7xR/2?=
 =?us-ascii?Q?WtvLYPJwVoUvaIU1LfAJPq+q5Rr1GZ6Jlh1Hpywu2A47MGGguo4pPv+C0uYQ?=
 =?us-ascii?Q?at4AFSxpjIdgoRcVkxH74GCRpDFjDHpH+pUDBCj2Z7LVQnilG5vQdY90ohiT?=
 =?us-ascii?Q?Ir2anw/iYqR0MkmnaQOzEvozFtjx0hXri7OHHiVMf0Zq9ORYsaW2/b08rvov?=
 =?us-ascii?Q?FRyxZ2cwEDLLWomWt2sIQl5Tb23qGcP57ENR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8418bc6e-272e-442d-5a7a-08dd6511a370
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 05:07:38.7282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1396
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

I'd like to report xen panic when shutting down an ARINC653 domain with the=
 following setup.
Note that this is only observed when CONFIG_DEBUG is enabled.

[Test environment]
Yocto release : 5.05
Xen release : 4.19 (hash =3D 026c9fa29716b0ff0f8b7c687908e71ba29cf239)
Target machine : QEMU ARM64
Number of physical CPUs : 4

[Xen config]
CONFIG_DEBUG =3D y

[CPU pool configuration files]
cpupool_arinc0.cfg
- name=3D "Pool-arinc0"
- sched=3D"arinc653"
- cpus=3D["2"]

[Domain configuration file]
dom1.cfg
- vcpus =3D 1
- pool =3D "Pool-arinc0"

$ xl cpupool-cpu-remove Pool-0 2
$ xl cpupool-create -f cpupool_arinc0.cfg
$ xl create dom1.cfg
$ a653_sched -P Pool-arinc0 dom1:100

** Wait for DOM1 to complete boot.**

$ xl shutdown dom1

[xen log]
root@boeing-linux-ref:~# xl shutdown dom1
Shutting down domain 1
root@boeing-linux-ref:~# (XEN) Assertion '!in_irq() && (local_irq_is_enable=
d() || num_online_cpus() <=3D 1)' failed at common/xmalloc_tlsf.c:714
(XEN) ----[ Xen-4.19.1-pre  arm64  debug=3Dy  Tainted: I      ]----
(XEN) CPU:    2
(XEN) PC:     00000a000022d2b0 xfree+0x130/0x1a4
(XEN) LR:     00000a000022d2a4
(XEN) SP:     00008000fff77b50
(XEN) CPSR:   00000000200002c9 MODE:64-bit EL2h (Hypervisor, handler)
...
(XEN) Xen call trace:
(XEN)    [<00000a000022d2b0>] xfree+0x130/0x1a4 (PC)
(XEN)    [<00000a000022d2a4>] xfree+0x124/0x1a4 (LR)
(XEN)    [<00000a00002321f0>] arinc653.c#a653sched_free_udata+0x50/0xc4
(XEN)    [<00000a0000241bc0>] core.c#sched_move_domain_cleanup+0x5c/0x80
(XEN)    [<00000a0000245328>] sched_move_domain+0x69c/0x70c
(XEN)    [<00000a000022f840>] cpupool.c#cpupool_move_domain_locked+0x38/0x7=
0
(XEN)    [<00000a0000230f20>] cpupool_move_domain+0x34/0x54
(XEN)    [<00000a0000206c40>] domain_kill+0xc0/0x15c
(XEN)    [<00000a000022e0d4>] do_domctl+0x904/0x12ec
(XEN)    [<00000a0000277a1c>] traps.c#do_trap_hypercall+0x1f4/0x288
(XEN)    [<00000a0000279018>] do_trap_guest_sync+0x448/0x63c
(XEN)    [<00000a0000262c80>] entry.o#guest_sync_slowpath+0xa8/0xd8
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 2:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() =
<=3D 1)' failed at common/xmalloc_tlsf.c:714
(XEN) ****************************************

In commit 19049f8d (sched: fix locking in a653sched_free_vdata()), locking =
was introduced to prevent a race against the list manipulation but leads to=
 assertion failure when the ARINC 653 domain is shutdown.

I think this can be fixed by calling xfree() after spin_unlock_irqrestore()=
 as shown below.

xen/common/sched/arinc653.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 7bf288264c..1615f1bc46 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -463,10 +463,11 @@ a653sched_free_udata(const struct scheduler *ops, voi=
d *priv)
     if ( !is_idle_unit(av->unit) )
         list_del(&av->list);

-    xfree(av);
     update_schedule_units(ops);

     spin_unlock_irqrestore(&sched_priv->lock, flags);
+
+    xfree(av);
 }

Can I hear your opinion on this?

Regards,
Anderson

