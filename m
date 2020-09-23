Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E144427592D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 15:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5Cy-0003MW-5K; Wed, 23 Sep 2020 13:53:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6iF=DA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kL5Cw-0003MN-Rf
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 13:53:18 +0000
X-Inumbo-ID: 55a08d42-0903-4c98-9e08-57f2eaa2ae7b
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55a08d42-0903-4c98-9e08-57f2eaa2ae7b;
 Wed, 23 Sep 2020 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//vJF8G1yOodS8pPdwUnTlQxO9P8XGazngby0jS6XsE=;
 b=1yhyuLFuaT3yBy6o/Sw04KxpcCzgNyku3T+rNFhu72ApuaHI3gd52JcgqHJgBQrvv8Ib7Z72J/8GJ7AlUJnkzGkxk+Cebp7tv0lpy8S+lzJI1GNE43+mwtq9jvNMtv7OSuEig9OyqqJBP5XP+KNjURCllfSwnTlBfQWJj1vhFmU=
Received: from DBBPR09CA0034.eurprd09.prod.outlook.com (2603:10a6:10:d4::22)
 by HE1PR0801MB1883.eurprd08.prod.outlook.com (2603:10a6:3:4f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 13:53:14 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::ca) by DBBPR09CA0034.outlook.office365.com
 (2603:10a6:10:d4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 13:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 13:53:14 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Wed, 23 Sep 2020 13:53:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e6135058691dc04
X-CR-MTA-TID: 64aa7808
Received: from d10ba485aac0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 20CC6A6C-3177-4E55-9548-9C5D0B9227A4.1; 
 Wed, 23 Sep 2020 13:53:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d10ba485aac0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Sep 2020 13:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOJdK6tEj1CYZ35OI1qBoT+cvg1C9AvhLrRcL0OSu0kAXoJJZE93dyXYXVp5epLde96gnGElUS9kvn5djdXk0gmaiUXTHI8U8G4tNhDplZl8HxdaWwy8QlLjth/nz6N4D3bC/ngodXLTF/LiDPhfR8pJBmovqIU4ROBk6nwC/kwDdWdm9L4glumnqUJZSV+2KNnyKldiRtNAB2Gmgu1appoIFn6lFoJlQC6h9hFwaQtaZ4uQ5NVuBf2YC88it9F3H2s1Xz6ZeG6SGSADA6kwR4pNsPOTdX4OFv+PDwGpAd0ZmxER58QoYKPXaOnHr1m8vTWQ8bAL4Z5B8NhC/d3z3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//vJF8G1yOodS8pPdwUnTlQxO9P8XGazngby0jS6XsE=;
 b=JBSEmEgWAascfMzN/En9E6HGoewxZ+AlQ5gTzw+9KxIlDnoSeEX7bpzVdtMCiwwH/3vKZE75t0YObUuLPisiLeWAfBmM2whcAhmLRzeSb5R/9JKN6QmM7ercTLowx244oWC5/KZVngYMT3lUr9fg9q+xyB3oTRm/MANzD4QkuTdutPbkVGy2PFzBWbgE4oSS50Gcm1EVJk8j8LPxH80E1+XPe03D6nn33welAxk8dwD9HTV/6Qge8FkszYwwi9Nd6VnVzpeg8e55F4CCiZrj5VWGZVt+/q25qCwzItk8WK09EUwqbAj08s7HJHZ42loXPPz2o27HC5hIJwoJ0zD6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//vJF8G1yOodS8pPdwUnTlQxO9P8XGazngby0jS6XsE=;
 b=1yhyuLFuaT3yBy6o/Sw04KxpcCzgNyku3T+rNFhu72ApuaHI3gd52JcgqHJgBQrvv8Ib7Z72J/8GJ7AlUJnkzGkxk+Cebp7tv0lpy8S+lzJI1GNE43+mwtq9jvNMtv7OSuEig9OyqqJBP5XP+KNjURCllfSwnTlBfQWJj1vhFmU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3162.eurprd08.prod.outlook.com (2603:10a6:5:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 13:53:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 13:53:07 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
Thread-Topic: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
Thread-Index: AQHWkRb3YbUANCat5069iZiL+rQxOal2P42A
Date: Wed, 23 Sep 2020 13:53:07 +0000
Message-ID: <95B9E367-E5DA-4F65-9760-6A2D21E3FB27@arm.com>
References: <20200922193104.20604-1-julien@xen.org>
In-Reply-To: <20200922193104.20604-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e78e1c6-a0f5-4274-e1ba-08d85fc80486
x-ms-traffictypediagnostic: DB7PR08MB3162:|HE1PR0801MB1883:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB188363C79FBDC3D6EFFCA68A9D380@HE1PR0801MB1883.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nY0wNlf8gJAO4MXhSGV7m4EyfFMVyxXJJ59iyd08D0xLqE+FVZCwZ4YgTSbHtJ82LnrnaAdw1cTH6LMfzKo+riwu11OXIvDmMydFE3+ybBtPTU/7DS30en34cda8DXaZq9O6ZAasY3mZ88l4LQ/2E3/msFayaLLT5Z4iW64MLvDvpL6PyDvwVvH1svdeBNkVxBUVEW3SmAib2ICFOKSNy/5XNAVwm4aTBodO8z8Ao3J4P55kFclCdLLrluCnWyVnP6IU1YRQI2LX3ifLOZm5oWZAKMuM3O+H9x7hKTB6JbtKcYTj+l0l24ie4Xl26uOJn0E/w8oxlzJvZp+3mP4VIaAuwoTSKe3zTzL8Ii7I0dmzKn1bqphRqpjSvsxHhz8n
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(6486002)(8936002)(91956017)(186003)(4326008)(53546011)(26005)(6506007)(54906003)(36756003)(2616005)(66946007)(66476007)(6512007)(66556008)(64756008)(316002)(5660300002)(6916009)(8676002)(2906002)(86362001)(66446008)(478600001)(76116006)(33656002)(71200400001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cUqmk3rO01+50kutFY7SF/VqxhA9kp4dWUF+2IOqHci1aMi4C5AT3h3ZDU2MvJnZQwTIblGMdUJ3HVonS4UDGwsmZMUx1YtmPUinjqi1+J2YLP0/Hk1E/UnlgoNj43Flwgf96poFmU3p2inN5YuBiHTCeDBMiH0Kd6znpfz/0/Pjf7bC8Ik9vvjeSpohB7PIdzjY1G2FQV8eD6exPhNXbktw0hkM0hqNHKMV92yDuUlbrBIrKeFFOXR95uq3ScPFiwerM1G8aem6AOXvgxrPtoQphEujwxMy0ev0djO+60a9C9LUnruoW9Qq05Z8+wa2emXQrZ+7nBKtaOrx5esLBIEjxhOWp/KN4TABJwbVyMeU90Pty4BDNeSRLF41oALL7kuL0ZnUEQNrnVYeZeUZplvQ3YJGQju6o76uZtRf4bbJdalHA1g/twCbyBTx9KJAXOcneorRKk8vCFKmL8ZG2um91HiLqJJDpblN7grmGIdtqq2vUzJ9u8+nNlmqwWOG/QinbgKTTk+y/eGbnQjT6PpCkakgcRB8n/lTGWYfOrWUnxvKXrwT/bwXMNpa8F3pbro2pK9vFiENIyridEsquR3KJxpxtiBHUx9xwLNymB+eVRZDHUe2WYp3rcqD/cBHxzfXHcq6qZE8F+ZcNV4Cbg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <76C6F83439116645B065F01257304885@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3162
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: df314bc4-54a1-4412-c318-08d85fc80086
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFPvygJ4gpx1O4BqQei1aMxwhFmvFRo2tYc4euTxzU/W9QIFFNHKaPzJugumbnexlh+s+KoZPJ0Ka4o0/8ekSb3CKs01sZOyHA7mAhdm61rk8f0Tf7EBsed0TNl9EMHEO8IScKoRdo5DHvfb4bIhFxjroyOJnI3UywSMM4wTuqfWbAvsG21D+pgTPm6S/v1kPD0AZDNgjZPO7my4ijmXIwWnEAlDquuIBHOrwRAi3Klq0WOZrW7IrlunlT2EgqJCY8m+KHX6DbvU40It0tMT9QTIfj4psQut9lqfiV2zMdpj0t5ky+jq42uqWy9+liZOWVOuAufL603o2fuZ/MVtRTqwrvy1cKRLAJhGTU3+zuqjChVTGy5S1o0D7WQFS8zMZYkFj5hahldiAKuIj20dRg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(336012)(70206006)(6506007)(478600001)(53546011)(6512007)(8936002)(70586007)(186003)(6862004)(2616005)(316002)(82740400003)(47076004)(86362001)(33656002)(81166007)(6486002)(107886003)(4326008)(8676002)(2906002)(83380400001)(54906003)(26005)(82310400003)(356005)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:53:14.6911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e78e1c6-a0f5-4274-e1ba-08d85fc80486
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1883
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 22 Sep 2020, at 20:31, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Some callers of vcpu_pause() will expect to access the latest vcpu
> context when the function returns (see XENDOMCTL_{set,get}vcpucontext}.
>=20
> However, the latest vCPU context can only be observed after
> v->is_running has been observed to be false.
>=20
> As there is no memory barrier instruction generated, a processor could
> try to speculatively access the vCPU context before it was observed.
>=20
> To prevent the corruption of the vCPU context, we need to insert a
> memory barrier instruction after v->is_running is observed and before
> the context is accessed. This barrier is added in sync_vcpu_execstate()
> as it seems to be the place where we expect the synchronization to
> happen.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Dario Faggioli <dfaggioli@suse.com>
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>=20
> I am also adding the x86 and scheduler maintainers because I am not sure
> whether this barrier should be part of the common code instead.
> ---
> xen/arch/arm/domain.c | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 9258f6d3faa2..3b37f899b9da 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -371,7 +371,20 @@ void sync_local_execstate(void)
>=20
> void sync_vcpu_execstate(struct vcpu *v)
> {
> -    /* Nothing to do -- no lazy switching */
> +    /*
> +     * We don't support lazy switching.
> +     *
> +     * However the context may have been saved from a remote pCPU so we
> +     * need a barrier to ensure it is observed before continuing.
> +     *
> +     * Per vcpu_context_saved(), the context can be observed when
> +     * v->is_running is false (the caller should check it before calling
> +     * this function).
> +     *
> +     * Note this is a full barrier to also prevent update of the context
> +     * to happen before it was observed.
> +     */
> +    smp_mb();
> }
>=20
> #define NEXT_ARG(fmt, args)                                              =
   \
> --=20
> 2.17.1
>=20


