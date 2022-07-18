Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC2578498
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369819.601349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRHM-0003kv-A6; Mon, 18 Jul 2022 13:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369819.601349; Mon, 18 Jul 2022 13:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRHM-0003hr-6O; Mon, 18 Jul 2022 13:59:20 +0000
Received: by outflank-mailman (input) for mailman id 369819;
 Mon, 18 Jul 2022 13:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MkP=XX=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oDRHL-0002Wp-A3
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:59:19 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0139.outbound.protection.office365.us [23.103.209.139])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe1721b-06a1-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 15:59:18 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB0967.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 18 Jul
 2022 13:59:15 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%3]) with mapi id 15.20.5438.022; Mon, 18 Jul 2022
 13:59:15 +0000
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
X-Inumbo-ID: cfe1721b-06a1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=tdL0rh5ApMDvZixSsTQgHXR5tF2QUyydeHVEg8OdIcv4/6XYr3trSn4c+GssqmLyvnMzK/VtPI1iVan80O9yeNZCeDpVg+T496Sr/4j6jtpXObgm98Klvue1Vd+tJabbrLmHeO777tV8AaFuc5HHaE4iVdHb02qJIAZlvOx4RZWubGNqTHq+VL56Hak0KIDVqFrPcIYBxD6IairIgN+/z91Ra38Ae3069NIBzmv3G0uZgtos7HwALp/ObFlCaIeasIheA/MfeDi9AtvWuYkK06T2XeSY/tFuRazBvrVHEwOfRKMcIwDl3DgGKHjaBx9VklWcLxxN1DfZuXTbMhroFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BymDOuYM+p3UPAbdT0Q6XQxs2t3u1E5D+WGrIRpGL2g=;
 b=BYi5WCaC8Cc07mooKU2BjUpK8sMjeZeYwV5RA6QEnpd8JQEoCLg5pNd3i7RJBAKHusRCdgJBZWUxnoDt7UOBnUXnfHLAAIUt9tTygy4SFGQzS7Yxzj1t5+VsGK1UqvxDW78t6mTsDlnTv9j86BB2ArUhtArBLMXytKXvYBhGR0FYkV4/24Et3WFKN1vBaNNhtPJuZWGkus8y7dMl3vNZA1gwFcDZTnbds2m/f1DsM3zzGje0nq77Pf7M9D8bPDPxsut6T0Bw/PIM/RmvVtXwe/TsvMPB8yvJkTYzOzoN0Drohg1DrUtbCEv15LARe0gCEaCQs1UYhmoMTPZHdTOE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BymDOuYM+p3UPAbdT0Q6XQxs2t3u1E5D+WGrIRpGL2g=;
 b=bH3XkhiwYdoy+lHsDRqGnG9hr7wPsLBNVl9X+uu5vqWMqvNGWs4h36HYb/hWU3wNkGlghJYMHpwRs5AlziFhKKKiS/jArnzVZiBFf1NZ+iBK07e6Cp8QdJUCBrG71x9Q6nRWI8YPEYCvwlqoPfwYxBl8UQFKi8PAcHkMA2euAzgx/fjLGVH6Yny6YlnX4U2cZCWnRLhvM7vi15mCDi6karsnBq5iV/AhHZhTQdJLEdyA90cNA5646z05fL7guGAkugrb5iJh9BZ+UcV/yB5R0YObRidJzZq6dOKp0YihawfqNrGxCK0FmISGB/g9tibI0vNwJ6tQKYicoCEVorEktQ==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v1 10/18] x86: introduce the domain builder
Thread-Topic: [PATCH v1 10/18] x86: introduce the domain builder
Thread-Index: AQHDrne88XyYXkgxTAt6TFUls0rRYAIuncUgrZgzpLA=
Date: Mon, 18 Jul 2022 13:59:15 +0000
Message-ID:
 <BN0P110MB16425760D6D6991942DEE6DCCF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-11-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-11-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a786c582-69d6-4267-db28-08da68c5b352
x-ms-traffictypediagnostic: BN0P110MB0967:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 r7auTB2zwTsP5poCHc+8uiuA/CA2wV0Y2gYaD/jAq7470RqFJUt10mQGurQ9PdaH84cMkIRoARveC6HtsVveay8rSS5WzvrPQRerddM7XAe1eTIUqd35r32pgPFS0bu2awMpibodWK789IwmNqa56t05FCz7R0afDnW/GcowJoAkMO39g3SC79aDax++s0Xt9E4wjrjCTN1sJEijpHrCuocef7UHX61yI60OHH15u6YVyvGj/Wnf2L/hHrEYsjZTDj4K9rKSdNIxwReLY6KziLdSQNxeZ5dDL+9kRMB/oWevuVjEUuj+kzBpJVwT6dj3WroLquulsDFkJT/lwoPTnoyXMT0RWU0oQ/pxvLU2ZW31bhDyqkGKb+ehuMfYlqkyIy8yk/xLt+Hcm5ov0dda5vtFqW/fz7Su5dI6edV80NdiHBQHFax+sRKO+QhXuOZ6JI4z+8N1SOlpvubC0O80A8lifdf4B995obRGHTj7ddoCxgZLQG4kiHTxy+TdCiUEqFNZ2JWrA97fESZKzVqyq4jbfS89R2SEPJGyvqc3Ty4OuHKB8BAG1VIIF5OcUsQZDnHIMICb2v7g7G0/z8SuuQ4LDTM+6NRWwmkdpBd+LrrPmVkFZ5sIke3LmlTJvrsqqDOmHdPa70f8G4gefR0IQTrXwZC0D0RbAeU4UHVBT/unJZjMD0+Eix1DkMM4EfNPmoEl7DTjOCLH3AGl9HiQPG4dXQ3nrhXFTS+rUiSnJ/Vhx6mlIctmaEYa/E7iN4lr
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(38100700002)(76116006)(8676002)(4326008)(33656002)(71200400001)(99936003)(54906003)(186003)(8936002)(110136005)(66476007)(66946007)(66446008)(64756008)(66556008)(7416002)(5660300002)(82960400001)(2906002)(86362001)(6506007)(52536014)(7696005)(83380400001)(498600001)(9686003)(122000001)(38070700005)(55016003)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 zo+JyV8SMrxTiT4/3ENCeuGC1sKz+a8CHuUXH1joZpnDFcG4tV8qw1g9w/4bKL6aYVH3Ex2wz9xM40eBtS5UgRKk2qxwr+gdKzjuVMbbWYMwC8LpUQs1BbBkADVQ6jL6V65ZKus8H3tAfs+tc1y7zZIf+fiv5z7vexmcnlcoQZz8IQFfR4SNxBM5fER0UNwfOf3dF9cqjptiu/xpRTvph+NsuLNwV8y4M2xkGP7ngoHPw34SiWXB4mAbE5+SafaepZQywmVSI2/v6tFHoypl6tXxj6zUkN9lUFrtVntz5ei9nj7T7ylDJnbUkY4vdnVZGUpBEw6NFyPubAepMNnUtKiIc67UHZrPM92QYys1txj1aRQN50hiyh8dptjVFuFwkWxSAhLwSspf2JKL1N9SypzilBs0YuyHrtw9biBSjxN36gSZG+LBYUL1thhEm+GvVT6A13N+ZzNSBwPtopA3vlgTvT0/IIsSVEAYwlaFxR8=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_008B_01D89A8D.08C84B00"
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a786c582-69d6-4267-db28-08da68c5b352
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 13:59:15.2431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB0967

------=_NextPart_000_008B_01D89A8D.08C84B00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v1 10/18] x86: introduce the domain builder
> 
> This commit introduces the domain builder configuration FDT parser along
> with the domain builder core for domain creation. To enable domain builder
> to be a cross architecture internal API, a new arch domain creation call
is
> introduced for use by the domain builder.

> diff --git a/xen/common/domain-builder/core.c

> +void __init builder_init(struct boot_info *info) {
> +    struct boot_domain *d = NULL;
> +
> +    info->builder = &builder;
> +
> +    if ( IS_ENABLED(CONFIG_BUILDER_FDT) )
> +    {

> +    }
> +
> +    /*
> +     * No FDT config support or an FDT wasn't present, do an initial
> +     * domain construction
> +     */
> +    printk("Domain Builder: falling back to initial domain build\n");
> +    info->builder->nr_doms = 1;
> +    d = &info->builder->domains[0];
> +
> +    d->mode = opt_dom0_pvh ? 0 : BUILD_MODE_PARAVIRTUALIZED;
> +
> +    d->kernel = &info->mods[0];
> +    d->kernel->kind = BOOTMOD_KERNEL;
> +
> +    d->permissions = BUILD_PERMISSION_CONTROL |
> BUILD_PERMISSION_HARDWARE;
> +    d->functions = BUILD_FUNCTION_CONSOLE |
> BUILD_FUNCTION_XENSTORE |
> +                     BUILD_FUNCTION_INITIAL_DOM;
> +
> +    d->kernel->arch->headroom = bzimage_headroom(bootstrap_map(d-
> >kernel),
> +                                                   d->kernel->size);
> +    bootstrap_map(NULL);
> +
> +    if ( d->kernel->string.len )
> +        d->kernel->string.kind = BOOTSTR_CMDLINE; }

Forgive me if I'm incorrect, but I believe there is an issue with this
fallback logic for the case where no FDT was provided.

If dom0_mem is not supplied to the xen cmd line, then d->meminfo is never
initialized. (See dom0_compute_nr_pages/dom0_build.c:335)
This was giving me trouble because bd->meminfo.mem_max.nr_pages was left at
0, effectivity clamping dom0 to 0 pages of ram.

I'm not sure what the best solution is but one (easy) possibility is just
initializing meminfo to the dom0 defaults near the end of this function:
        d->meminfo.mem_size = dom0_size;
        d->meminfo.mem_min = dom0_min_size;
        d->meminfo.mem_max = dom0_max_size;

Thanks,
Jackson

------=_NextPart_000_008B_01D89A8D.08C84B00
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
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDcxODEzNTkxM1owIwYJKoZIhvcNAQkEMRYEFLWsnCm3
EbADPL53CMXmWqn4IxdoMGcGCSsGAQQBgjcQBDFaMFgwQTETMBEGCgmSJomT8ixkARkWA29yZzEX
MBUGCgmSJomT8ixkARkWB3JyaS11c2ExETAPBgNVBAMTCEJSTy1EUzAyAhMsAARwT/LbBVtfmneX
AAcABHBPMGkGCyqGSIb3DQEJEAILMVqgWDBBMRMwEQYKCZImiZPyLGQBGRYDb3JnMRcwFQYKCZIm
iZPyLGQBGRYHcnJpLXVzYTERMA8GA1UEAxMIQlJPLURTMDICEywABHBP8tsFW1+ad5cABwAEcE8w
gZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMH
MAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJ
YIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEgYBhPc1M
K95w1rwxwNgXs+3NGLIr5y/sEFqisqxkicSUSJd51uNPt0qlwDq69seIBjLhZAmoTXZLeam0V81Y
b+LCh6PHOQzE8MH+wcPLSCb3TLP7kyX51EbIWZ7kjmGe9i7aRGHvmCg6CJLKr5p03lXXiufp14iP
ywhn3TSYZPbkxwAAAAAAAA==

------=_NextPart_000_008B_01D89A8D.08C84B00--

