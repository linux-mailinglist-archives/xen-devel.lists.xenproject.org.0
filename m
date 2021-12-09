Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B946E529
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 10:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242835.419956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFQK-0005So-NM; Thu, 09 Dec 2021 09:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242835.419956; Thu, 09 Dec 2021 09:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFQK-0005R0-JI; Thu, 09 Dec 2021 09:09:08 +0000
Received: by outflank-mailman (input) for mailman id 242835;
 Thu, 09 Dec 2021 09:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvl4=Q2=bitdefender.com=aisaila@srs-se1.protection.inumbo.net>)
 id 1mvFQJ-0005Qb-74
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 09:09:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0716.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::716])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a862dd46-58cf-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 10:09:05 +0100 (CET)
Received: from VI1PR02MB6126.eurprd02.prod.outlook.com (2603:10a6:800:182::24)
 by VI1PR02MB3215.eurprd02.prod.outlook.com (2603:10a6:802:23::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Thu, 9 Dec
 2021 09:09:02 +0000
Received: from VI1PR02MB6126.eurprd02.prod.outlook.com
 ([fe80::d1bb:db57:bdb8:7a47]) by VI1PR02MB6126.eurprd02.prod.outlook.com
 ([fe80::d1bb:db57:bdb8:7a47%3]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 09:09:02 +0000
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
X-Inumbo-ID: a862dd46-58cf-11ec-a831-37629979565c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zs1J+N7nSQXFh4vpuvFg8TrMYlPgLQtpFeNevHZAsvkUuOpYYdFq2zQrVIDZuGNFCPIOnpJOJIK0lBdMWk3B8lJrCNLL1WR7ZfSHMApKHmw7+rN77MWSGGtu77Y7m2WNKwbcR7HigKp40LlRh8D0rgnpjdRwfWQ3C/x4mB2aMeGrVWvuybwJQPIdV5uDLK7LPRaNei4WlMlLntDMD8msrSLsezpF1l4HbMARxjwjr4kymOvfuf2DjJQJdy1RPOV7NqYSLMdAhZeTnKpaVR9aC59V19GKtQj1s97ixLFNm3hRIQUmIx7MpuUfquiqsyCUQEMA5BcHEdZmkO36+Zfb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QGP/vuZvwRCxBsdJHflUdAsOsqAws43qUT0bTSD5E4=;
 b=TziW0paVBW+Pa0xW5v2PIDaSx7REYp/qaiktg3ynWM/8DwCvXnz4Q8R70jEp5GkYfISyDeQV6GGRNYWHdcglWTrl7x94nE4fYwDoIgyce+a/73N+DB7hz+KO+mRWQl7RZqkBRdGQxFAZzpeFa7AcraZ3BFr5HLc3l0poJCUY0SBMh1U6lYbBQhs0atHC2xTjBBeOzVNTSZigGDFKx4KJFZDBRJ5B/k2W5kq8pFgmrc91zJScC8TPWFjsPp4yIzbN6QdlKf8m0GsliuYO/FP/s5UbDjxX5+BjOK3+bq2u0642LpCCaPBTFE29BeKhERgYPv8IpV9aPfX/74z7dzW/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QGP/vuZvwRCxBsdJHflUdAsOsqAws43qUT0bTSD5E4=;
 b=w6TjNBw5kmEYKcFX6lyykl9o7w8zqN7KGX0pj00GT7JqMNR7u0bF6ohTHWbf20RE8muaF6+XiuZsXAOSAlqeNKfhD1PYilYwnv15vxKHlz7KZNo97ugABubYE7RWjYDl364Yk8cMn25SZodgXjP/+eJ+UDCHzecaB1l4Lt5KMYg=
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Tamas K
 Lengyel <tamas@tklengyel.com>, Petre Ovidiu PIRCALABU
	<ppircalabu@bitdefender.com>
Subject: Re: [PATCH] x86/monitor: don't open-code
 hvm_has_set_descriptor_access_exiting()
Thread-Topic: [PATCH] x86/monitor: don't open-code
 hvm_has_set_descriptor_access_exiting()
Thread-Index: AQHX5gUaclLxOWzfx0242LqfvNMvRKwp7MWA
Date: Thu, 9 Dec 2021 09:09:02 +0000
Message-ID: <43CAC5B0-4589-47BF-9F3A-5EF530C1B2BF@bitdefender.com>
References: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
In-Reply-To: <925bb889-8048-e275-12e7-a4f5d31fb76d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.20.0.1.32)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bitdefender.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23ceac6c-cc37-4061-85d7-08d9baf38b2b
x-ms-traffictypediagnostic: VI1PR02MB3215:EE_
x-microsoft-antispam-prvs:
 <VI1PR02MB3215B6B244A59C055E51AB60AB709@VI1PR02MB3215.eurprd02.prod.outlook.com>
x-is-junk-enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 W21GqOzGFR0Bu5I0eDsACCBcUAwuwxdSxM3GVtxX+slWAdGpWqjCGdTX1wAQKvPvNjSryqqHtiqa3PcQJmu4WIVpSlOfWzwuwVuopYgMPvyiEcoRcB8JHzMgTeV7bbqopHskW+7vUxIy0kKgQ7OIQcHnaJwWDL8ks4ZT0sFdVU5+dOqBJ3YZcz0VipxDpcqVLWQFi9WMC0u4/6zTRBBfzrp9MwHhkhlZJ4nK39Qjx5M3KttO/msoxZu03tx9rl66fOeD6yIoqbpUd44SLaMU+TOf7t4wV4Wziuuh/nSX9heYIfdVeJ9sHMa546rb3StFJoa+/DPOxoetkuFmESpM+qxGh5LKrgXxAMIHeO6nagX6maU0kln48zhP/cXAgYrLzbOkg+kJ1X+qKZdepfI09aHx+uNqb73bcREkbQX/s6DVUSKAXyLY64qRAFXl01nWzbxg7q58U3XFnEwUquEax9kIqczxpoXFlIY4/R8ofJuhH0tWmXUDt90qBWgGuYXrxNivSjmhxkps2WEAoXcfyKejD7nfN9IBDM1UuJ1xnTLQhzgp35hojOvV6W/2/aubGICQGl3cYlUJ1zxs1THdtoONQmlPaAnE/7eibxCqUwP9aAZRrdNC9SQOG6czldve0wMnR/eycqHGz3eaLXekZSTG4emfMIqv+YLvs9ydl/anBagRU9RO4QKxhBAXppJFTttVxnWP1Ws3wBv+zbIjalaU54SvsI/huBpm50jBcRA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR02MB6126.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(498600001)(6512007)(2616005)(26005)(66556008)(64756008)(91956017)(76116006)(66946007)(5660300002)(4326008)(38100700002)(33656002)(66446008)(122000001)(107886003)(36756003)(86362001)(38070700005)(6486002)(186003)(8936002)(6506007)(8676002)(4744005)(71200400001)(53546011)(54906003)(2906002)(83380400001)(6862004)(99936003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3wDYLKTKztod7rOUlxeosiafslgYUfZIFBnhdZ9R72vRQGz4PVizFfrjpOL4?=
 =?us-ascii?Q?8odyK2gHKaDc3vVqIMEjHA0EKpkWMf3dBNTCKZ9o5OrObPnMYUwR//MXlYtI?=
 =?us-ascii?Q?La7VGyuLTt5KkRC/ALW64KpQfLj5E3Z7o6YgB2U9+s059Us3DazlyVl3P5MO?=
 =?us-ascii?Q?E+dQqUFKPPB9wLHpBfLX/wvdFhSreIejEgJly1GJrNaGYS/SNtAxf4fpMf4d?=
 =?us-ascii?Q?lNk3meOZAN/SZVktwenVQyQBzdgZZkvaEj8GnUteiWt1WLDwy1qUnLL9nqab?=
 =?us-ascii?Q?K9F48pIgI/XVBwbcjCt+QU1rYXCjhdNOSxjiXAk/y0e2P8m86hhdzMuFBr/Z?=
 =?us-ascii?Q?9uO/s1nQOyPi2BFGVqENO7FpgwrizdOwidTe8BeouUMeF/4tGZnhI5qNsfgk?=
 =?us-ascii?Q?PVCgPkoCX0UsvLYAwpdvEYw6FG9zdTtBrYx5qnVG+qjJjksdI5hmmtFqR1ID?=
 =?us-ascii?Q?wOSkmjFDcyhiDgYR/MXHpaM2/RMV6MUbrZ94+6RPo558c1KXwcFTw/ASVK+1?=
 =?us-ascii?Q?h1AFPLutv/3XRbrZ9FwHOOXEC09qCtQThxlFLG1JvtFG3yhiE4VnRk+tKCwh?=
 =?us-ascii?Q?4Or1W3S6T/PjpM4siQdCldg3iLKJxJ/rewqGqPmZ6jtA0PpvHfh7izWv90B+?=
 =?us-ascii?Q?gouJW5G0N7k7Zaq3tN9H6UYAYcXuIk9wJTgfuhhillPeqi6GAiTbb+KD/GRD?=
 =?us-ascii?Q?0GZnVj/nbc3DmePK/m147PVisVRLdrCn8dHWSoBhM/0ijtJXBrPqu4xX8jrE?=
 =?us-ascii?Q?9XQoZdQj3pqtpzt9xU4ANB4VSw++lcnutHCJGTlyejalT9z8aBWD/GK2V4u5?=
 =?us-ascii?Q?OG8FgMqXU4ugn4Hv9i+lJqBeiMoGgF34vxsIKBeiegU7EOij15ozSDN5C9gy?=
 =?us-ascii?Q?nu/y9BcOtWqA6vKzBvTdXcNmS2XOxxFdHBFi5KA4rVuqO0rjkLky7acxNujx?=
 =?us-ascii?Q?eZZKop+IGOb5RP3AFreq6GTnBb1iJVxTa8n6DJCEIAR63E7U2KitzmTjJBzp?=
 =?us-ascii?Q?QOd6gjyxf9Ce2mfJPeiRplUqE/YVlYy1z5Nw+/dv21gQJGNDNtSF8Hr+bhP/?=
 =?us-ascii?Q?WC14z1zoWPtMv5MePBiZs5QT06hLPzmDx6e/Ew+UwLQL7XhzfUxC4KtvJGDt?=
 =?us-ascii?Q?dBrxQnRDJdgLa9lnzfJ7SuRXCjGP6CTyUSCZ/m/C4sau4jHdmeRT03BAaWRQ?=
 =?us-ascii?Q?6fEjj1oo4nKmobjW2u/8IVwfXkSB/zjgfE1K/qmAD2QFGNYgio7RM4bE6nUs?=
 =?us-ascii?Q?mFQFufV9H6LtCBoUmq51eVBvmkZMy6sg0gfB54cTr5XvxbytpDpCflfQx054?=
 =?us-ascii?Q?MgosuwFzY9QpkhQtp1sfsi80DetCLsIqR1lHr2rmKPFB1QsqgQxHH06HHKeh?=
 =?us-ascii?Q?bARGiFomRVUXZMUYGZflEGP6j4EcoM1h/q6P2kNxwrLsshlzuG28bR2Ellf9?=
 =?us-ascii?Q?9nu7TdYTGPFb3CjaI2d0JfNsUX/Kmaznd0iPYkxMW7SZf0c+6lwc5Ye7RqFZ?=
 =?us-ascii?Q?P0x9PRnHTIu6lsl3vYhma17xu+1+7k3oRuT4bhtYsqIVZ+UXXRt3PCSqF/7+?=
 =?us-ascii?Q?lxpntxt9bDh3lB31tuVb4z6pzuL9+xNkViunGELhC8hoqcbq9kehgH20NDin?=
 =?us-ascii?Q?LJAifQfmk2HouT+Z0f+dvf0=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E42F8668-614C-45FC-8606-0B8B73121BF0";
	protocol="application/pkcs7-signature";
	micalg=sha-256
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR02MB6126.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ceac6c-cc37-4061-85d7-08d9baf38b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 09:09:02.2637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: comM74L0t2yGDlYzn2VJK2P+KnFA2AgGMB9TQrzwGaRYYy/E5EeBQAFc6ROCeDozXvHtKlaw8lfxodZumxA5Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB3215

--Apple-Mail=_E42F8668-614C-45FC-8606-0B8B73121BF0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 30 Nov 2021, at 18:11, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> CAUTION: This email originated from outside of our organization. Do =
not click links or open attachments unless you recognize the sender and =
know the content is safe.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed by: Alexandru Isaila <aisaila@bitdefender.com>
>=20
> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -263,7 +263,7 @@ int arch_monitor_domctl_event(struct dom
>         if ( unlikely(old_status =3D=3D requested_status) )
>             return -EEXIST;
>=20
> -        if ( !hvm_funcs.set_descriptor_access_exiting )
> +        if ( !hvm_has_set_descriptor_access_exiting() )
>             return -EOPNOTSUPP;
>=20
>         domain_pause(d);
>=20


--Apple-Mail=_E42F8668-614C-45FC-8606-0B8B73121BF0
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCCCMw
gggfMIIGB6ADAgECAhNQAAJ5AUvsoOMrGKfuAAIAAnkBMA0GCSqGSIb3DQEBCwUAMEsxEzARBgoJ
kiaJk/IsZAEZFgNiaXoxGzAZBgoJkiaJk/IsZAEZFgtiaXRkZWZlbmRlcjEXMBUGA1UEAxMOYml0
ZGVmZW5kZXItQ0EwHhcNMjExMDI5MDg0MTU1WhcNMjIxMDI5MDg0MTU1WjCB4TETMBEGCgmSJomT
8ixkARkWA2JpejEbMBkGCgmSJomT8ixkARkWC2JpdGRlZmVuZGVyMRMwEQYDVQQLEwpCQlUgT2Zm
aWNlMQ4wDAYDVQQLEwVVc2VyczEdMBsGA1UECxMURU5URVJQUklTRSBTT0xVVElPTlMxJjAkBgNV
BAsTHVBST0RVQ1QgTUFOQUdFTUVOVCAtIEJVU0lORVNTMRkwFwYDVQQDExBBbGV4YW5kcnUgSVNB
SUxBMSYwJAYJKoZIhvcNAQkBFhdhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMmWwHRKu+U4o5VCEP3K38esc1zHbE+WI3gi8imNnJQcKPJDidU8
bHYNQnX6mFUMjAg0gaydLYbWKgZKYG9D53A9cPgAGDv+xdyD9Kjkscxome1qeywW6bqbPaA5+3PE
Iq7+c8CGEa6Gkw+6pJ5ushwQxsepfMNcB3N7zadcTinLlIoXx2WMCKi7XfqFZXpfrVU5ezDSJ/yx
dKzu7R96+H0uFdgZa6SjKZsJw1cogHw3ZMadxAlWvmYHt4ZvSGR94roAJobOwZCAmgK7GcqRVwpb
EmNWg1/h21o7BKN+Rz1wzBbLNWpe6Fvv0/O7sFAZAq5cnc4PL0zlIZaNqQ3x3LUCAwEAAaOCA2Mw
ggNfMB0GA1UdDgQWBBQi0bYdiCPFYr2gNqXUJA5slfiTFjAfBgNVHSMEGDAWgBSdi+LOCc7doI/g
6xap+dZqQPiyaTCCAREGA1UdHwSCAQgwggEEMIIBAKCB/aCB+oaBuWxkYXA6Ly8vQ049Yml0ZGVm
ZW5kZXItQ0EoMSksQ049ZGMwMSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049
U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1iaXRkZWZlbmRlcixEQz1iaXo/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hjxo
dHRwOi8vZGMwMS5iaXRkZWZlbmRlci5iaXovQ2VydEVucm9sbC9iaXRkZWZlbmRlci1DQSgxKS5j
cmwwgcQGCCsGAQUFBwEBBIG3MIG0MIGxBggrBgEFBQcwAoaBpGxkYXA6Ly8vQ049Yml0ZGVmZW5k
ZXItQ0EsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNv
bmZpZ3VyYXRpb24sREM9Yml0ZGVmZW5kZXIsREM9Yml6P2NBQ2VydGlmaWNhdGU/YmFzZT9vYmpl
Y3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MA4GA1UdDwEB/wQEAwIFoDA8BgkrBgEEAYI3
FQcELzAtBiUrBgEEAYI3FQiB4LcA2tZhgrGfM4am2G2Ds/tpVITGoRmH9eNMAgFmAgEbMCkGA1Ud
JQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNwoDBDA1BgkrBgEEAYI3FQoEKDAmMAoG
CCsGAQUFBwMCMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwQwSwYDVR0RBEQwQqAnBgorBgEEAYI3
FAIDoBkMF2Fpc2FpbGFAYml0ZGVmZW5kZXIuYml6gRdhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbTBE
BgkqhkiG9w0BCQ8ENzA1MA4GCCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAIAwBwYFKw4DAgcw
CgYIKoZIhvcNAwcwDQYJKoZIhvcNAQELBQADggIBAEEFQKaTzxua/hT1lzgInDU0MAhZT3pLc3Kq
FwzWIdpqFXlRLePzq/WrF/5fxp2rkOjJwQbVkx0W3Vb11AluFW9mZcN7qpnl5tT9BNTF9pJntgjW
4NOGrmJGGHVZSNQIs7ZgiAyDx7CvSaJBpiPjuCwzsvvueARswatw9GHVlXKAcYbInvkT81APtlwJ
Sj1y9GjyhlGw7tiGkDmqmmK9+CwsL9G5dwtFnVz+TAyRBSOZYus8ZNxBnn8Z7HAXufRQ/h4HRIEj
ucBqj3JIqpjgf+9vOHBDmmaen000RKS//cd7YyBzExPGVvoB0GBcDPUhfxOdmwhZoPlI61eHiI5O
V75lHI3MyWswMbvEi8Z4W6UdW7+m10QEO/aLrFd8dckGp+CYCjbuGglnQT2WaQl2zVkYBJLkqgDX
TojlgAoAMFgEwo8BocURIipgqprymkQ3iUtwnVdlUD1I6Sphkx2IXy9pLb+JQakAnmnWN4OA5QWO
0MbN59wZhu6eVVMUrnCX2KmrO5zf7AA8ioRRIU6AmUnp2J5ZXxVftdagsIiySX3RSO0/Og5uMYIC
DrYPz7UGfMjqqPViW98G0LlsIzNI6Prs6zSrwSbWHbjKC3quJMrQ/EPpTJNbKBwpkZh5fgjgW5w7
JqA0QaQt1gjG6aHtssi+CxMI4dbI8QEdSSnVDALhMYIC4jCCAt4CAQEwYjBLMRMwEQYKCZImiZPy
LGQBGRYDYml6MRswGQYKCZImiZPyLGQBGRYLYml0ZGVmZW5kZXIxFzAVBgNVBAMTDmJpdGRlZmVu
ZGVyLUNBAhNQAAJ5AUvsoOMrGKfuAAIAAnkBMA0GCWCGSAFlAwQCAQUAoIIBUTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTEyMDkwOTA5MDFaMC8GCSqGSIb3DQEJ
BDEiBCBrDyyRPHEbUIEys6bLhXoRIcNogjLt9cF54DyxKN8HyDBxBgkrBgEEAYI3EAQxZDBiMEsx
EzARBgoJkiaJk/IsZAEZFgNiaXoxGzAZBgoJkiaJk/IsZAEZFgtiaXRkZWZlbmRlcjEXMBUGA1UE
AxMOYml0ZGVmZW5kZXItQ0ECE1AAAnkBS+yg4ysYp+4AAgACeQEwcwYLKoZIhvcNAQkQAgsxZKBi
MEsxEzARBgoJkiaJk/IsZAEZFgNiaXoxGzAZBgoJkiaJk/IsZAEZFgtiaXRkZWZlbmRlcjEXMBUG
A1UEAxMOYml0ZGVmZW5kZXItQ0ECE1AAAnkBS+yg4ysYp+4AAgACeQEwDQYJKoZIhvcNAQELBQAE
ggEASj0ME/Z4najXWZnxLiGAn7jEMr6daSkWWA+hAcdcYzOpTtpwZqTvUNZ4BdzGYHRTck8yLMLo
M0gkyZsNWz4BRLpru6UvQediFpazJ5/vtjR6zTpv+ltvwxhVdL0jRZsfClA3YHWphKFHOLusllVP
3k+2D1nyhDbE5nQVDR7lt5rr55lM6/kZWoiMPb2MIHgR9DyxTlpFrKdPdCzDbLnJrqji5iJ//Txw
Q0AVpj5DJ1bo7cOpXZvGnF0wPV3nOMuEG8LcKlRfIhEEDuu7gk7UhFGDHWL+IC+nIsqIvTameKNt
QjCFx1BJ1ObQMteKgVLxuDkV8qZQ98CM4D1XaHG9VwAAAAAAAA==

--Apple-Mail=_E42F8668-614C-45FC-8606-0B8B73121BF0--

