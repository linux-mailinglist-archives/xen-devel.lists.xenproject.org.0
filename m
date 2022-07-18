Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB6578492
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369808.601327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRFz-0002ZR-Jo; Mon, 18 Jul 2022 13:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369808.601327; Mon, 18 Jul 2022 13:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRFz-0002Wv-Gc; Mon, 18 Jul 2022 13:57:55 +0000
Received: by outflank-mailman (input) for mailman id 369808;
 Mon, 18 Jul 2022 13:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MkP=XX=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oDRFx-0002Wp-4V
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:57:53 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0124.outbound.protection.office365.us [23.103.209.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b037368-06a1-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 15:57:50 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1177.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:180::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 13:57:45 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%3]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 13:57:45 +0000
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
X-Inumbo-ID: 9b037368-06a1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=dX1TAUrdwhcFnIawCMBuGobnFaK5kv1SkMo++CmH92eIBRO0n9B/Jxk0UlcZ9yluPZgQQDA/Acr6JZmjusae+yjwAqwP8ZOR+jn76LzVoa+3ptSL5h7ZLZboUCofZWqWvfGcdCDkqitWlj27ThBdWdrIF5jJ77guIdUc/ZCdLMZezaRQNiSCFh/G/S0KvQz+8PrUhrNwsJlGNjizU36UXTOEo7MlpOhSHm3U1JfI8vRRTZQUZW6uL/Z92M+MnQzAs7C+g1IE83ru1eyImMxImFJ4PnPbYGyh9zr+O+2Cb3qgQACgmRTiD0q5fDT4vAgMF73dVcHkVje/C45RUcxpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24RKT9kuVnThl75H9PPs5Tyq4HZePs6w1m8QMRTUg2I=;
 b=PNir8tQFyOdYP3zxfIG087YaWzbekX5By9tYohcJpxVN1+Ie3kMBa3HeJYvbAfltCWeUdUASW0yV/kdzvUUM2aa77RXeqvnqXeg4OcOeBwL8MdOogEpQYzNpm6yMu0PotRCKpc3XGG14d4D8ER/KXyAo81SqpCzjM+nxNwJ0mpTcqvjFG2ybDeQTdykAZ9QG++EM+gMo3Nz09byLoO97GY2cxrZ5jPS17JgiFNQmj9F6ofUV1pr9OGu/rBGJ1I8dOYpdh0Jq7dJDimmCe5UHAvoHwX9ZA1Nm2351nhLNH9s1Y6qes4pEE6ppadDS6IJFuQJKVwVyljuG3pTvFDUA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24RKT9kuVnThl75H9PPs5Tyq4HZePs6w1m8QMRTUg2I=;
 b=Bl3Kfio4pkrE1Fbl8FSFE5utJHBd51AKSg9K8N94wOKaq9NwruMsnlz7hojPUFKX4CvboI8rmR7IOIWvKpgqwad9BboxcjR+cTZeXVcrNBYnI73YWp050CILbt50v79Rq7P86DcJEnf/shzotjn5QKs91Tj/iftE3naOobGWuTxyqOcNd2VvpKr55YO67FkAVS2nTKerUhCqCcDOBwvv/QsewMq6hWcMbxyhHUrBZQ19elShrMGaSNtmybi1/D8n/jxG044umYfihKD+jAMWh/asd2jPA/dRzSNya1LTNRpW12MAZC/OoMSDSN5t1cVpju1EEyTQKXKMuMXsJMrieA==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v1 07/18] docs: update hyperlaunch device tree
 documentation
Thread-Topic: [PATCH v1 07/18] docs: update hyperlaunch device tree
 documentation
Thread-Index: AQHDrne88XyYXkgxTAt6TFUls0rRYAGjSHJ6raDaj3A=
Date: Mon, 18 Jul 2022 13:57:45 +0000
Message-ID:
 <BN0P110MB16421791FEF39C8693134462CF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-8-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-8-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 800d8fba-865b-4992-00a6-08da68c57dba
x-ms-traffictypediagnostic: BN0P110MB1177:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N1yXm0xkk571HpGCFQH9vAVTCvIwCbpkP55ua9kBy+Ut04Dt++7JEXmqzoogE0eyJNC2thyKhpnKO8NsJqWieq63nTE/4ogQl5YDY5PCbzRcCOrO+05/Wx0hrjfrjhh1BRHZLud6+JSkUF+kHay+H+WZC7ry4d9Y3a6tFW3ChO5vUarE0HqxMSsT2arRReYzXIsrzSrP8EdBFHgOD5VsrBp3nuS/d40UhP75P/5G2Xsxq5VlYTUWQhj0YryUKD7W+eSa/5DHmxTTF//W0ep2lDl+8ZHs3ULFpH5IGGbvf+6bnubRCPC/aJ6bTi5N0XCJ680ZuzEpqXbAt3gt0kclfvuc0396P0pj62fM1Eo9GQNr0yod4Kv5t+hmbRZSZ29AlFtTZqKDqzxb+6aGzCddwgBjshe7d/HfCjNIG7QASd5hjSSSd9VWG2sHN8oZw2tu5KuoZm6OR4U5KO4EX6BdnkTk+UIK0OfXRpUVqSmMOVEkX5fkNqRf66uskaT2J3/MjvDt/wR/YsO1n0deJ9Qw1mYavhcj9yY9Cfn8/daMs5Mlf9IL1PCa+kyIFuXIJXnv5FfMo9KeAob+/LEgfnMJQsWrhwQbo4B84CfpLQAKbvo70mRKjne/zqAUqsf8YCBKoyydApNJwSw2R17Tt/XgW4ytMlA+r/qbRj+h0psDRQ6bep1e2TiFAEGNpO0kPr8kF7WrjpifoCSbTk23uvj4g1VInruYc7pbLRYpgGmomngeXt0TMB5ckHOIHArSOAzWqJNnLyMKMvTSaYqHWRg3GA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(2906002)(71200400001)(55016003)(8936002)(33656002)(76116006)(66946007)(110136005)(99936003)(66556008)(4326008)(54906003)(86362001)(66476007)(64756008)(66446008)(8676002)(498600001)(6506007)(38070700005)(83380400001)(9686003)(7696005)(5660300002)(15650500001)(186003)(52536014)(38100700002)(7416002)(82960400001)(122000001)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 seev6VssYFq+lAoYg59YZCPDCLDRJkylQ8j16VbXS6WNE5/5I2mv1ReYi1OTioJNqa5aylxWkt4VyaLJdawC3Bw8dD3x5MtObxB7hasFrO8Le5Nr2d6PZOb0b4/5zsUuCHHLkWYC5JeBkAdZ7obeqRZvcdXRdMTKg9Px+N5KWNqrPHnTqidg/1CER4377FNbKwWcIdR81AkVIbEdXNh6KLfjv18qcnn0J/nq/DxolKsl34UP4iPQZyo684Nk6PBEsT+39OIMdgKrIm2eQvD7EjQS7MXi5JYt7BNh2qxG84fdB+voSKdTkTRIOdV8dhhzcvSGCgKth/m2HM3otxPHzixhSrRVCSX8Whm8cO1/CDJgARia5UGkxtxP5JrsXH1cwELkET+tBomjq9asDB7XmRNfdkWscLiaEw6dPVuQjKupnaSnsMGI8uUKKtfZ4daYEoZy/c/QyE024pZ/IiRpiXwtaRO9wDjb3sVkUuSZPoQ=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_005F_01D89A8C.D32C1490"
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 800d8fba-865b-4992-00a6-08da68c57dba
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 13:57:45.3065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1177

------=_NextPart_000_005F_01D89A8C.D32C1490
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v1 07/18] docs: update hyperlaunch device tree
> documentation


> diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst
> b/docs/designs/launch/hyperlaunch-devicetree.rst
> index b49c98cfbd..ae1a786d0b 100644
> --- a/docs/designs/launch/hyperlaunch-devicetree.rst
> +++ b/docs/designs/launch/hyperlaunch-devicetree.rst
> @@ -13,12 +13,268 @@ difference is the introduction of the ``hypervisor``

> +
> +The Hypervisor node
> +-------------------
> +
> +The ``hypervisor`` node is a top level container for the domains that
> +will be
> built
> +by hypervisor on start up. The node will be named ``hypervisor``  with
> +a
> ``compatible``
> +property to identify which hypervisors the configuration is intended.
^^^ Should there be a note here that hypervisor node also needs a compatible 
"xen,<arch>"?

> +The
> hypervisor
> +node will consist of one or more config nodes and one or more domain
> nodes.
> +
> +Properties
> +""""""""""
> +
> +compatible
> +  Identifies which hypervisors the configuration is compatible. Required.
> +
> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
^^^ Same here: compatible "<hypervisor name>,<arch>"?

>  Example Configuration
>  ---------------------
> +
> +Multiboot x86 Configuration Dom0-only:
> +""""""""""""""""""""""""""""""""""""""
> +The following dts file can be provided to the Device Tree compiler,
> +``dtc``,
> to
> +produce a dtb file.
> +::
> +
> +  /dts-v1/;
> +
> +  / {
> +      chosen {
> +          hypervisor {
> +              compatible = "hypervisor,xen";
^^^^^^^^  compatible = "hypervisor,xen", "xen,x86";

> +
> +              dom0 {
> +                  compatible = "xen,domain";
> +
> +                  domid = <0>;
> +
> +                  permissions = <3>;
> +                  functions = <0xC000000F>;
> +                  mode = <5>;
> +
> +                  domain-uuid = [B3 FB 98 FB 8F 9F 67 A3 8A 6E 62 5A 09
> + 13 F0
> 8C];
> +
> +                  cpus = <1>;
> +                  memory = <0x0 0x20000000>;
^^^^^^^^^^ memory = "2048M";
Needs to be updated to new format for mem.

> +
> +                  kernel {
> +                      compatible = "module,kernel", "module,index";
> +                      module-index = <1>;
> +                  };
> +              };
> +
> +          };
> +      };
> +  };
> +

Similar adjustments are needed for the rest of the examples I believe.

Also, two typos:
Line 287 is missing a line ending semi-colon.
Line 82 has a double space between 'node' and 'may'.

Best,
Jackson

------=_NextPart_000_005F_01D89A8C.D32C1490
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
PUJSTy1EUzAyKDcpLENOPUJSTy1DQTAxLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNl
cyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXJyaS11c2EsREM9b3JnP2NlcnRpZmlj
YXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludIY0
aHR0cDovL2NybC5yaXZlcnNpZGVyZXNlYXJjaC5vcmcvY3JsL0JSTy1EUzAyKDcpLmNybDCCARMG
CCsGAQUFBwEBBIIBBTCCAQEwgacGCCsGAQUFBzAChoGabGRhcDovLy9DTj1CUk8tRFMwMixDTj1B
SUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlv
bixEQz1ycmktdXNhLERDPW9yZz9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlm
aWNhdGlvbkF1dGhvcml0eTBVBggrBgEFBQcwAoZJaHR0cDovL2NybC5yaXZlcnNpZGVyZXNlYXJj
aC5vcmcvY3JsL0JSTy1DQTAxLnJyaS11c2Eub3JnX0JSTy1EUzAyKDcpLmNydDBVBgNVHREETjBM
oCwGCisGAQQBgjcUAgOgHgwccnNtaXRoQHJpdmVyc2lkZXJlc2VhcmNoLm9yZ4EccnNtaXRoQFJp
dmVyc2lkZVJlc2VhcmNoLm9yZzBPBgkrBgEEAYI3GQIEQjBAoD4GCisGAQQBgjcZAgGgMAQuUy0x
LTUtMjEtMzE1MzczODEzMi0zNDMzOTAxMTAzLTQxMTc4ODYyMi00MDQ1NTANBgkqhkiG9w0BAQsF
AAOCAQEAYaBBvBGuhKlhJ2O6JBtcYRW7CYREO4+CAep40ordLIS0gvnKuE7A3a+4YzJpqKvfSbQd
+dQzeaZNz3kTpwJlZh5fJb/Bo7zQWlvDU1p/rr7a2tAnWNqSVlgQrvAk35TLqlGAmwo8tgQ1jxc/
JAkWg5Pqks6IKyO8CwKuIEOqL7vxN/THcEvpJvLnhRxm/ARosCDW1x0XTwivA8tS1AVvxxcpQAXS
uo/q3WNG/XDC8oO6oJLZfnpl9LiDBrsHEzDaR3Ct3XCR6rJ4ezjwFjH4SEOWCWeWsLhk+uoOgAx5
4cKlGpprXf5oje+0nSz1bAw5kaGD8k83rXL75YVcIuRTlDGCAskwggLFAgEBMFgwQTETMBEGCgmS
JomT8ixkARkWA29yZzEXMBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAy
AhMsAARwT/LbBVtfmneXAAcABHBPMAkGBSsOAwIaBQCgggHHMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDcxODEzNTc0M1owIwYJKoZIhvcNAQkEMRYEFBtyuJiM
jSrJRyZpJvMbdpeRia7iMGcGCSsGAQQBgjcQBDFaMFgwQTETMBEGCgmSJomT8ixkARkWA29yZzEX
MBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAyAhMsAARwT/LbBVtfmneX
AAcABHBPMGkGCyqGSIb3DQEJEAILMVqgWDBBMRMwEQYKCZImiZPyLGQBGRYDb3JnMRcwFQYKCZIm
iZPyLGQBGRYHcnJpLXVzYTERMA8GA1UEAxMIQlJPLURTMDICEywABHBP8tsFW1+ad5cABwAEcE8w
gZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMH
MAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJ
YIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEgYB+T05y
l8Q3LlYZQbFPLI9mFbfGBCdc88WEaA0/sPl9D//3fsmSPFY5vPU8BG3zZmb6nsG8MG+JS6j4EusO
I0h9iKTWiyq1ruWOLBpBPN7SiqafwYOoK7PpY6NbxT0cUgf/1R3hY3m/gPlNFWuGsusWwhUL4UXn
eBo+0VF3H9egtwAAAAAAAA==

------=_NextPart_000_005F_01D89A8C.D32C1490--

