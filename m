Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735842689B0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHmCW-0000ZI-VO; Mon, 14 Sep 2020 10:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cLSs=CX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kHmCU-0000ZD-S5
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:59:11 +0000
X-Inumbo-ID: 55623009-f58f-4bdd-b45d-51b87d23b60d
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.60]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55623009-f58f-4bdd-b45d-51b87d23b60d;
 Mon, 14 Sep 2020 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTv+gDqkRQwbE7GJtikvKFA9KDrc8nFmQqGexc6OOWE=;
 b=VEZWWBzxBTVfMQSONBBBD6oHgpged5/qnOWFLWV7ATMJtz4cGwiRyPkkvgtdPOeiM9xMDk7woCxg9EAynhsYKLJBflUdOKSi7HJ7IZYV1asMH70SfRtUaWUpB3RmWRXvJRnhOc4qPLn+yR6mxszjSPyTPkqDByK50BQBT5gINo4=
Received: from AM5PR0601CA0058.eurprd06.prod.outlook.com (2603:10a6:206::23)
 by VI1PR08MB4286.eurprd08.prod.outlook.com (2603:10a6:803:f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 10:58:57 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::cd) by AM5PR0601CA0058.outlook.office365.com
 (2603:10a6:206::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 10:58:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 10:58:56 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64");
 Mon, 14 Sep 2020 10:58:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a042f1e60c61fe9
X-CR-MTA-TID: 64aa7808
Received: from efc9e411b310.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 714CA97A-DB5E-41BA-8627-431F9690076A.1; 
 Mon, 14 Sep 2020 10:58:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efc9e411b310.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Sep 2020 10:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae3N+FCx5FQeBxp3KUfRNta1MB1B/nVNmEpKDjBtZxhjrjk5joBeHyC5VhJWYYaRXYOnFxW9roTam30x0TRXVBUH2JxXCwmKsm5l/bzNwGokQqeNsyTOZepxGBe02qApYxxNDNHBed4VvqlTD3NAOzHairvdMR0o3pQ1BMDZ0hnVgzV+PKcLCWJiX03RSLXcFaUA4CWhJXnm8ONvx0e/6l7dFjCBqfUXH87juWdtqlB2SHXsLejYlw3A8HsnM1zf+zR7NsgWoX2HgOYo7bJdBlfKSpUH6yiREq4sAqVPZe/BFj7Yj8s5M5gGsMafZo4j1f9CmNxY54iX5BVjiGvhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTv+gDqkRQwbE7GJtikvKFA9KDrc8nFmQqGexc6OOWE=;
 b=bGV7p1TvMtTNDH/8NnZ5W8wM33+bHVcz0gq2uEB02tLm2uY0mafEBrZ4wBV6tVvvzf74xiDmAETgSt2Rr1uf++AMleQkrDxGOwf2eUOJTWOLVNj4rHT6Bj8uxjkFLnbyVR+3B2B/29bcGyqr3LNql4CkY43YVQXQIgsshSTFfmydHUBW+KK0waBXjyw3xa+I6PdKrfu7A7FC0PWOeF/LXgmD/ryQoDp+bUhU7nu12tGJA+jy4BwX93SWn7KauNXLDOn0QcyTpWEFa0XyUAfufoheIn5xVcHUhz9sklzsInrFZqG7T8Y+DFG/M2P0GG0Tu8eNpvBJzyAPX+w6rvwxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTv+gDqkRQwbE7GJtikvKFA9KDrc8nFmQqGexc6OOWE=;
 b=VEZWWBzxBTVfMQSONBBBD6oHgpged5/qnOWFLWV7ATMJtz4cGwiRyPkkvgtdPOeiM9xMDk7woCxg9EAynhsYKLJBflUdOKSi7HJ7IZYV1asMH70SfRtUaWUpB3RmWRXvJRnhOc4qPLn+yR6mxszjSPyTPkqDByK50BQBT5gINo4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3259.eurprd08.prod.outlook.com (2603:10a6:5:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 10:58:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 10:58:45 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
Thread-Topic: [PATCH v3] tools/libs/stat: fix broken build
Thread-Index: AQHWiQYtlvZlYAgRJ0WaZGJ4HThwo6ln+foA
Date: Mon, 14 Sep 2020 10:58:45 +0000
Message-ID: <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
References: <20200912130836.11024-1-jgross@suse.com>
In-Reply-To: <20200912130836.11024-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7965dfac-8817-4e58-90c9-08d8589d2d91
x-ms-traffictypediagnostic: DB7PR08MB3259:|VI1PR08MB4286:
X-Microsoft-Antispam-PRVS: <VI1PR08MB42867ED9AEA2A055242D450B9D230@VI1PR08MB4286.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JjhH2UmcN6rhCvjwODinxzMKDDc3MWjCOoQZ6wT89jqmyCk6m7U6DNzgemY4f+BLHbIx3u0nYuoTce6T3NnBbj+4aZTVpDIQLaJ3Rm5Y7Ww2MqA8PGX5t7KwFBr+sfHsvSuYGAucEsXjZBhNRpfgGKF0Ngovxv6ojMGx4HeAIkRbYJWb6FYTZLuK/bWBQv0UXkeVUXPbuvsuxn0qG8h40cRGT/h9cLzo238zkIZXF9F70hsh6UT9d0dqRtj/2XFnvp8+nSvuIO82GSM517t5qVpBobt8G3+c7NNe9HY8Rmv3Cc08qvimAemileRXrGSlYUaWQ7ICMNYpYqF+JCMcuA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(6506007)(478600001)(53546011)(36756003)(26005)(6486002)(186003)(2616005)(2906002)(6512007)(6916009)(71200400001)(83380400001)(91956017)(5660300002)(76116006)(4326008)(66476007)(64756008)(66556008)(66946007)(316002)(66446008)(8936002)(54906003)(86362001)(8676002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KLrLyTC02wygv2Jbsvtw7mgsvkpygxCvaLg4SC8qKeSssLUMGg6z/aTR2Jxfi0Q1IAdcR1X4yVhHzSpUseCOR+9wBibGzGKwiEWbsZ/r3rPE6MXe+I3LDAhNgFm3lpvfScIRgfc2FGIVss9PGLTJ+gRx5GRDuvEwmr8JAVS28UEMnOHC2pR0nyoicRns01v8Pwd7ojN/RZ3CXzZkaWGalrgJ4UEW/wmszTAvykmWFaiWuFmtQt/RbOeJK4AhSt8XkFrxnmtsVwf0VAbXivU3/VG02AFMwsJTLqHYtr5+M4K6HmidqluNH5PDaIV/BXRKLruJOKVySlKcAqzqMgvIyGzUzM2g9KY2JyMPQ6xb5QwfGLKQucX18nJ1lEiK3Vfq3+Kek8K2l0PsI7Izix4fJxQ9NIwAQKxkNHaZtwoHO8fJNYYNG+ELC1acv3W8ZH/rCgPTzK0FQqkbvz9MQcp2Ruqo9Rgj15sGxEnLF8IFr61adukigIaFunbp7hTcHluhEMBDr/JaQ30npe717wQVxv6IAWxFIH98SNHjcWDQwHHAEp0Xfp3eyC1UqE4QfVF+fNBdFVY0D5uMQ0Ak2OgRXZfYGumYMbfFm7+bA+e26UqEcTe2nzOgb29gWA/XKKGkaapq8WFlq1EPW3sh1c3Q6A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C8ACAAD578B9B40A00F8105A3A939FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3259
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ec5e0b3-eb65-4bcc-874e-08d8589d267f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5iINlk7eSemupxhcfRHCJYLWsuI5apDuwG83ZBg8Kt+zpxFKm3PLR7Y+B6dFu5PcVAnb1cl7umqw/dAPj5FMDrI56khX/Gim4K8Zz0UUxrcYq+LuTqhFGO2/vNtLQF0EkqWQC6RGO8jCHanpsjv+CnizBd30bTU54hx25BjpEjH+vDGXgLzBbmq/O9aEYxrIlts9qGF7qnuUg1jnbNn+5qGpJggy4dre4rSeRkOzOzo0Iawvl8TKtNwEoSbUn6qCkRs6Hp81Rajb6LGA+aM+ic0pCJGXnyrReYekvRuPjB60Pyn/R3g+as7RTPOzHheMTBjxI2Tb13r2FwDg2btyhky2CgaDAIaVF4KU3QvqJFXi360OqxUw3HLfh2+p+LdTRYJF3nY206C1hbviVb3ybg==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(26005)(70206006)(336012)(6506007)(186003)(2616005)(82740400003)(53546011)(70586007)(36756003)(356005)(81166007)(36906005)(478600001)(54906003)(83380400001)(316002)(5660300002)(2906002)(82310400003)(8936002)(6862004)(4326008)(33656002)(8676002)(6512007)(6486002)(47076004)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 10:58:56.9979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7965dfac-8817-4e58-90c9-08d8589d2d91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4286
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



> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>=20
> Making getBridge() static triggered a build error with some gcc versions:
>=20
> error: 'strncpy' output may be truncated copying 15 bytes from a string o=
f
> length 255 [-Werror=3Dstringop-truncation]
>=20
> Fix that by using a buffer with 256 bytes instead.
>=20
> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat =
directory")
> Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> tools/libs/stat/xenstat_linux.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_li=
nux.c
> index 793263f2b6..d2ee6fda64 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -78,7 +78,7 @@ static void getBridge(char *excludeName, char *result, =
size_t resultLen)
> 				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>=20
> 				if (access(tmp, F_OK) =3D=3D 0) {
> -					strncpy(result, de->d_name, resultLen - 1);
> +					strncpy(result, de->d_name, resultLen);
> 					result[resultLen - 1] =3D 0;
> 				}
> 		}
> @@ -264,7 +264,7 @@ int xenstat_collect_networks(xenstat_node * node)
> {
> 	/* Helper variables for parseNetDevLine() function defined above */
> 	int i;
> -	char line[512] =3D { 0 }, iface[16] =3D { 0 }, devBridge[16] =3D { 0 },=
 devNoBridge[17] =3D { 0 };
> +	char line[512] =3D { 0 }, iface[16] =3D { 0 }, devBridge[256] =3D { 0 }=
, devNoBridge[257] =3D { 0 };
> 	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPacke=
ts, txErrs, txDrops;
>=20
> 	struct priv_data *priv =3D get_priv_data(node->handle);
> --=20
> 2.26.2
>=20
>=20


