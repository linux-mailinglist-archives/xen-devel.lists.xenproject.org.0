Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989266528CE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 23:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467442.726518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7kvS-0001CP-T6; Tue, 20 Dec 2022 22:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467442.726518; Tue, 20 Dec 2022 22:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7kvS-0001A2-Q0; Tue, 20 Dec 2022 22:17:30 +0000
Received: by outflank-mailman (input) for mailman id 467442;
 Tue, 20 Dec 2022 22:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sht=4S=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p7kvR-00019u-4q
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 22:17:29 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0096.outbound.protection.office365.us [23.103.208.96])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1551b270-80b4-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 23:17:27 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1626.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 22:17:24 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7d1a:38ca:bcf2:5e90]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7d1a:38ca:bcf2:5e90%5]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 22:17:24 +0000
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
X-Inumbo-ID: 1551b270-80b4-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=uK7i8jwP05Jw3j0FEPspgI+S54/KM0puIG0uZtz8N/hbmtOnTw3vlLJ3FTTIzCK5iOI4Qz2ShRFit4vZAD/TQPQAhMgQWWXLI6r1222x5XW12bJ3j7EoTxOZnJTcEnjZQ8QOd9I8/Z4TkdLnDIweC6/FG9hZ/ahnSPHoNvKA0voZKTh81e1xIG+avCb4oN0HRY9UTrp5LcVwMfNEuyq0szp8UPzqbfaktaQcXgV0iNe1s5mOUK4xMCxPB9MQGTCgrG3/JYE9Z4VOlvsS2+5kIaPzBZDXJcVbspbOtszB4WZ5iixy2GvkLWzRmf6fm7emmcRKfBlcxPktFXmPh0D/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAHp56z8TD7h6ciKrrLAGlK/WSWsiBoUJ6MeMG0xCKs=;
 b=f3R1pDr+BvmYxfd9v1PkVSHWsgjOwfpGbaGMFEIlbVj4WrmiVT+Rfl1E4cQyiQk96jFLnRtTUQxFnATYd9tvP5+ShmnpLRUp56/6GOu0NvSvC6n/BJ4Lo4O9iVaCaiXriLkKtkA7+Oz3gTqn4AhdoUNBcXc4axcSBm+4LId4na5vBWlj4pWzQOkfkkkcZf8Qm44Emrg/c0LrPMlw+SwdQTnQezTb2VE6xqR8s45BEuvqD5RZI+DbIbQNSg/Ycsn62i2qD86j5+D9WdCaPdRWAOvkjWKyAQ0x73JkbtCJ6MPqnKGkWPdlpyQiGxeYtiJMbgtpMWvO5dNvvAyc9hTPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAHp56z8TD7h6ciKrrLAGlK/WSWsiBoUJ6MeMG0xCKs=;
 b=qlpumN7WRORgb5ZLrz3MaaElfNfsoLg0ORsrVCRSBC9l2DgRsUO4zWuA5D1VfzOEVf8bmvtk7TLJ3S/JV79WY5D3og3X21hyfDzQRL/pXGfduLCg3GPYtjC1wubFJSkyJ/7HlQoq9sHjQ4dhC3+vyKukF3wnEGS3hRPANwozePhZrO6sa4XFS11LvEREj2PWJBs4r5N2/KAXHbIiPdTp5Y0+OIva2sKUJTSWTypcX8p9c4oF9pmder0rULpvdk2FwFN0CUEp7Tl/bt38AO9eJK6H9P7rEl/m708U8NJKWgJsFNp7YwT3KqxexA8SaHR7yU+cNGlgW/LSiFZSYXe9lQ==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"demi@invisiblethingslab.com" <demi@invisiblethingslab.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: RE: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Thread-Topic: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Thread-Index:
 AQHZDyrHUdSstfue4UmxiTJ0hoNsoq5sTCAAgAEyh+CAAgQ1gIAAPyEAgABzUoCAAHc3IA==
Date: Tue, 20 Dec 2022 22:17:24 +0000
Message-ID:
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
In-Reply-To: <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1626:EE_
x-ms-office365-filtering-correlation-id: cb9b4b72-44f3-402e-b489-08dae2d7f895
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 58in0zdLMceOGeFyIjVWP5c5bqPwHI9qCkh4eBlwtdfXcRz5bJhOLORsyvdWUZAqH6qwQsZe4izCpvM1kRIW0THtV4fYelFQMX8VvHRgzJqGmhGQv2PkjkVjZhuMNoVjBLHtK8euBZXtLNowviUlg2uSTDMrMtqQEZIEEhMKM7YjYxTCSR9GiEE0MxtYy/LWKW7FdZxBM0hoqofygy57em3t1D5alLr+4j0jQmWDBwHmYKrLkEeQwsfId7X8tNbyE7hJH1CC2swT0PFMEtE6z4ixMt6ASZla+KCE32bnQOityalr7EIVn8XXUyLmsqgLwYdKe4Eh3jq8C8pnuj+p4a/HxNCHAH4VonK+t6awRbPOzuzzzuk/GukWi685l72EZNhRATh/pGpPNhASkIMxJ/c6UGWyfpBUxtgbnN9ILlMSkoJ8hAwsLri37f5Ua+p+j/Mk33YA6dOfspcnDUipfMfHpWrwspCmmcWoHA9Vezmup5Oo7Dayezs/KjGK37aNZLuh9taLPvD5KGaRYkr058SseMa0QXdhN1M8MxI81U0oH/ZBo1fW2Rpls6MGRW41HUt3g3eXdCLRUx1HXrEv2XUhWdmnSCwHYQxPk6wiXBoTbEidDsMYexBPbVkclHO1r1AcGNIpUd6JJ5eLH4pul8nt7TKI+AlAqJDdIYqA6gM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(39830400003)(366004)(396003)(451199015)(38100700002)(2906002)(122000001)(99936003)(41300700001)(55016003)(33656002)(41320700001)(82960400001)(26005)(186003)(38070700005)(9686003)(86362001)(83380400001)(52536014)(5660300002)(8936002)(508600001)(66946007)(76116006)(66446008)(66476007)(6506007)(8676002)(66556008)(7416002)(64756008)(4326008)(54906003)(110136005)(53546011)(7696005)(71200400001)(10944003)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 vrRndOLLx4ykSRepHzWSSbAH5pZzyyxMIdyZaN2+fC+4Z0gXc13i7s/hM4AyyHSJhPKh/g47AJvEBw/zDWpNT9iYU6t/fEzbzdsTnR4Yh3sgfXT9wu4vVHBn8yTJ0DaoNbVLUegrklXyKrreo1dg+OWwiNihe1JCaO3WAP4C3xeMrfKNBjOHUug9ZupyYNA8B1QFwIPdQcjDkMB2NxcBs3FkPcrihM5tme9z4OFPplMMaMTaQWi+m9Q5wAfIwoGbLM+hEcFOv53HRFZtlUFCRRxmv7XhhEWUAc5iR7F78uUdoodhT8VWOOLLzVeomE4NBDqTIJtYWSV3yGrnhCF/0/blt6ODfdRw1WP3gyYpOD6CKvFfVkeC3j+v0dFiQA0iEGY4jG1aUtlriYK7lL9GOqWGgNUeRm26SCYNrPYyJcs=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0129_01D91496.EC60FF50"
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9b4b72-44f3-402e-b489-08dae2d7f895
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 22:17:24.2284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1626

------=_NextPart_000_0129_01D91496.EC60FF50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

-----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: Friday, December 16, 2022 3:39 AM
>
> Hi Stefano,
>
> On 16/12/2022 01:46, Stefano Stabellini wrote:
> > On Thu, 15 Dec 2022, Julien Grall wrote:
> >>>> On 13/12/2022 19:48, Smith, Jackson wrote:
> >>> Yes, we are familiar with the "secret-free hypervisor" work. As
you
> >>> point out, both our work and the secret-free hypervisor remove the
> >>> directmap region to mitigate the risk of leaking sensitive guest
> >>> secrets. However, our work is slightly different because it
> >>> additionally prevents attackers from tricking Xen into remapping a
> guest.
> >>
> >> I understand your goal, but I don't think this is achieved (see
> >> above). You would need an entity to prevent write to TTBR0_EL2 in
> >> order to fully protect it.
> >
> > Without a way to stop Xen from reading/writing TTBR0_EL2, we
> cannot
> > claim that the guest's secrets are 100% safe.
> >
> > But the attacker would have to follow the sequence you outlines
> above
> > to change Xen's pagetables and remap guest memory before
> accessing it.
> > It is an additional obstacle for attackers that want to steal other
> guests'
> > secrets. The size of the code that the attacker would need to inject
> > in Xen would need to be bigger and more complex.
>
> Right, that's why I wrote with a bit more work. However, the nuance
> you mention doesn't seem to be present in the cover letter:
>
> "This creates what we call "Software Enclaves", ensuring that an
> adversary with arbitrary code execution in the hypervisor STILL cannot
> read/write guest memory."
>
> So if the end goal if really to protect against *all* sort of
arbitrary 
> code,
> then I think we should have a rough idea how this will look like in
Xen.
>
>  From a brief look, it doesn't look like it would be possible to
prevent
> modification to TTBR0_EL2 (even from EL3). We would need to
> investigate if there are other bits in the architecture to help us.
>
> >
> > Every little helps :-)
>
> I can see how making the life of the attacker more difficult is 
> appealing.
> Yet, the goal needs to be clarified and the risk with the approach
> acknowledged (see above).
>

You're right, we should have mentioned this weakness in our first email.
Sorry about the oversight! This is definitely still a limitation that we
have not yet overcome. However, we do think that the increase in
attacker workload that you and Stefano are discussing could still be
valuable to security conscious Xen users.

It would nice to find additional architecture features that we can use
to close this hole on arm, but there aren't any that stand out to me
either.

With this limitation in mind, what are the next steps we should take to
support this feature for the xen community? Is this increase in attacker
workload meaningful enough to justify the inclusion of VMF in Xen?

Thanks,
Jackson


------=_NextPart_000_0129_01D91496.EC60FF50
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
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMTIyMDIyMTcyMlowIwYJKoZIhvcNAQkEMRYEFBhhBryy
n/ipn/G6SnA9zTK8pccKMGcGCSsGAQQBgjcQBDFaMFgwQTETMBEGCgmSJomT8ixkARkWA29yZzEX
MBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAyAhMsAARwT/LbBVtfmneX
AAcABHBPMGkGCyqGSIb3DQEJEAILMVqgWDBBMRMwEQYKCZImiZPyLGQBGRYDb3JnMRcwFQYKCZIm
iZPyLGQBGRYHcnJpLXVzYTERMA8GA1UEAxMIQlJPLURTMDICEywABHBP8tsFW1+ad5cABwAEcE8w
gZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMH
MAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJ
YIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEgYCjXjvD
nOgiWSmi+uSamFii7Yt3JMg8qNLaDusZLIbdc9XsImew/qpm+JIICpMtfyrphwNWYZ7FhApqHCp4
r2Lb2d9TE4uW83TPblmb8n6adFbL60odbt+VuhGmst97D00FAgC0TD4Kb3OXrsWuRNYQ0rIVlluX
ezaE4QFKBocH4wAAAAAAAA==

------=_NextPart_000_0129_01D91496.EC60FF50--

