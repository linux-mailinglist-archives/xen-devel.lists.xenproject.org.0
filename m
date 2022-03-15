Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50374D9718
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 10:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290683.493063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU36k-0000SM-A8; Tue, 15 Mar 2022 09:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290683.493063; Tue, 15 Mar 2022 09:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU36k-0000PP-6r; Tue, 15 Mar 2022 09:04:46 +0000
Received: by outflank-mailman (input) for mailman id 290683;
 Tue, 15 Mar 2022 09:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GQWC=T2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nU36i-0000PJ-NW
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 09:04:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2091cee-a43e-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 10:04:43 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-7_AUUunwOAKQF68zTnmx3g-1; Tue, 15 Mar 2022 10:04:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2233.eurprd04.prod.outlook.com (2603:10a6:3:1e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Tue, 15 Mar
 2022 09:04:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 09:04:36 +0000
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
X-Inumbo-ID: f2091cee-a43e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647335079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTbIv+AledwC3Bds8nLJu90vJtRVynY21RnFWjLEn1U=;
	b=Q3iZe/M5ie04H+Ucb3ynhx3HpFrEBn56ZFtFvWiXLOZRMJ9DmYLhsv9Ny31JejdFhnpE0g
	znClLQcvuU7HlN1cU6uH8NipOAXlNgz0UXteuhvbNV7FBI8HDGK4hasb+A2MK4iTVxbCIZ
	NkY6O4EypHSpZPfVFlburTXbmOtf8QU=
X-MC-Unique: 7_AUUunwOAKQF68zTnmx3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JT+Wgy59GakRrZ7sXgDZ7JPiggBQkVOXxhnTWlNL2R/vSeZtUIP7S4BVnxHMW+oVlXKwGiPghgphaqYTOPeV3HBRTyqc00s77hOcZ/q2ASahBKjqCgUKhKPxp8aqYTGf9OVTc+9TLbYYcqcTnfgWiJBsfovDX2YApScDARAj8Nc8fIaF0jEBI4Z9jGd6qTRNuqv26V5t7uccecSumXwsoSVIV4dcr9xiFa8P47rvZZJbrO3u5CR0ca5SaAwHXUZXGYh2ANvNMTR2geVLHpSRFCUTh6NsZiDhCGdLzmLHimv/xB0wnXNfACHXj10ydAkARn+VJtON00BIbZ8r4Bb5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr3wtAgn6fDHoSE6/i4LwSDxC4WhrsFiGbmPYwV+CiY=;
 b=Q6YrMOa95L/5dBkMXpyTwW6rrAUS+FNPreFHvpt8OO2+G4+h30kzvfyhyAmqjiXtKLcIVatId37Xq7qqClEm5LS0bIUcY6LRvrW2Vd+jhcQhQHf2+XOyeBElXU9GgmvrOa1pxmJoxAjyB4e5fHLEHkjrTQiaIzvXdgPrnjvVZxaheqOe+G1+PVP04Mv7cPnFsIGtXRa1USI7iKkEfY9AgXSSkexZRYRrf6g+J3Oo/e5ruzKWFR9I7kGfdDtep6XJ2wzgQrgZ3F06Rav3wR0GMVfy83CTjucgRpPVThxrqaBF+jgdLURHLou8x7pW7WQWKBdNjCEuh7nkzw3tRERj9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2587e3e4-14d6-6523-c844-384452659543@suse.com>
Date: Tue, 15 Mar 2022 10:04:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] ns16550: Add support for Intel LPSS UART
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <20220310143403.50944-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220310143403.50944-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0064.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b1ca67-7de0-4614-aeee-08da0662d431
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2233:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB2233BB1E5C1F4490050D4EA9B3109@HE1PR0401MB2233.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t9G1/vS/UwwtGqy+teqHq9jb17YNRA5g78zhHD+KlfvK838aa6fy4eRg8B5S2GdwzIW0mdZsopCkT9k6U0RiE7zDGpII3V0jCGTk2lwH1LIJBOtBM4t2p3ZabjIP8thf+IE1dcg7Gnf6g0Aa/JpNTa51jhGTWxDK6tdmJoGDcfMc3XjtH358oI8aFD1CFDNI39MRPVH4KlV2OklJLA/57FfQnEq+++6BSF0lNKKu0uD2J6Um5blf3+OSEYVisLQpMxx6tBdlV2YCMynuWA3HFjChTII+tEw0dculH/Fp8Ym/JPny9DGcaA5SiCH0HzkZG1tlr6nr3pjngYYP9wvpZvY9UMBbfan/BWL7SgX/mXCkM0CgPiU1rA+RRxHG7aLPaCRqNmdZL14n5chuSfix0v3ay4fiwx5OMZGfjIxn4VgE2HYcx0WYv+uWL/FmQzA3W3XR3oDFrYx1LQh1FSTx0Cdxe9lGy8aIxf9spN5sJ6KpWxrxoZxb4/efI5dzpyQDaXKEaKM+nB5oua84sAk6Uffaj2WzH6SAWYG+DUrCzafF8irVTBBSS3fydyR6i739NWco+h6pFJxxH+UDNdubg2/Kf0CS/qOU1L8A3aUXmnn5IuJP8v6c/tvXdO3kQUS2rES4dnSez5k7juEqTcZ/xGpGgGefKeNzhK5JVLot/u4aPQ5cNIA6XvvLdQU9/SUDUwlnZUB1ZQCgPInYfG1a9uPEZPpMLbauJRjpiRTQp+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(6506007)(36756003)(31686004)(26005)(186003)(53546011)(54906003)(5660300002)(86362001)(8936002)(6916009)(6512007)(2906002)(2616005)(316002)(38100700002)(6486002)(66946007)(508600001)(66556008)(66476007)(31696002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2k2om2McHrtg4/FY0pvdySc56TgbHwap1CnC49QKTlV/3w5meIxcDSMFiUly?=
 =?us-ascii?Q?MLSLsOJRkuIC8/iTC6Ldk3qlLFlT9CyQrrREjj7Q75jA/WF+NLqKbAblqtF1?=
 =?us-ascii?Q?mkdDURC5+DVYPpUpAV5Vnb43atiOIm4d8OQY1nij++tITFe1RF1SfPxHUnSt?=
 =?us-ascii?Q?KzSouXzT3kmAixoYwMlllmUuJxGco/aoOw85hrCvrGxcaCjQaxHBtufeywqZ?=
 =?us-ascii?Q?Rxgs+2lk9I4x46KTyn9TitgSghWh2u+Cn/XO6VmeYS1m5Ilgsma/8wbeWAHd?=
 =?us-ascii?Q?+00E5evxRT6Qm1TcNYnFSEjOjx9PfwuZJQe//+vCd0KmmXzVTDjDPbr/L7Qh?=
 =?us-ascii?Q?ixXLLhjhTTZFFTmiUEiuYl9Mz00/USqS8qQsd2rvrQrbByKF98rhSJTliGej?=
 =?us-ascii?Q?CPwMfEJPma1PZ+Zz9iKrvsB6rQvqNPdrlbNm+88SCAlnBEqRqlF2C5g5oK+Q?=
 =?us-ascii?Q?dI3U+Br2Ms1eif5idKX6c0A2ucgttjt2bo9kOxMVmDvc0zSnFRlUu1Sjer1a?=
 =?us-ascii?Q?XrXeejceVAGEjvcCB5kBtu3YDkNqiZNWljfpWX2Y62RVrGU17rUYN+IL8dQW?=
 =?us-ascii?Q?IvO//iy53mNemVuPuCeLtpL8g6gkHQAMMNVu2ovOGxdwdx6NtjgZgV+nTG9p?=
 =?us-ascii?Q?iq4aZZXmAxiF3Ty0OWgYXy9leaEh0/09Ln6bxP1NC9Klhw7ncAbus6PvfY6g?=
 =?us-ascii?Q?4s44bEPfEzW35zz9P5iaPQPfxNGEVl6qjytcj8N/DF8WY3qoCgoQinKtv9Zt?=
 =?us-ascii?Q?VJUvHUih0c7c6hZ4ac+RR9/uu1JFAhke5yJ+/S0byeVgF0XVmvvFA3MoeVxl?=
 =?us-ascii?Q?oKck6jScdu9+vINsZ8pmyb3qxj1XE6WwzPgYBr4ORlpe2I7GKFGNlhiAoCCT?=
 =?us-ascii?Q?PynWMXLhzWNw0TwbdPKinEHcojQki/E3uARGDvwau2u3nFczg9J77scQdjG9?=
 =?us-ascii?Q?6t6q8p1GqdK27rTp5nljNQ9Zem+3dJoSfW8bhVmjL7O7By8Hnnf8gHUKrZI4?=
 =?us-ascii?Q?2U0TBZe2CRHCIm0eyK+UaTGzubE3bx1c+XP5cc1dLV8QGBPiCWihRVAI9O2Q?=
 =?us-ascii?Q?BER5uph2GxneAltHaMLb2FhObKQIXtKS2zm8hQYWn0qbe1cK038Mgs5XJzRh?=
 =?us-ascii?Q?oh/C5JLiq1k8S7Ww3vqYY7zC+f7S38z5SUhWIVYaEKqZCK7dcFawQv6EGfUT?=
 =?us-ascii?Q?UyxjFn9V4EOi7d3ySJS/0aejEzQjozq+IZ6ID6ba3cYVxpVgBqr3R8Xl8PUO?=
 =?us-ascii?Q?w+VgqGVOcwDcSEhdoelc5TPL2Sr4uHNCujKIRsL56SO3/kGrqRC+xemlSl1D?=
 =?us-ascii?Q?wBVdMNTwAytvgLI4RcUWK2ZZYTp4D1HdDfkI83eH6AT+3x5kEXaKJQTl72WK?=
 =?us-ascii?Q?NbNV+xZJ/2jd7two/bNP6CWmSICVr/qiUE0U/AbeXvBv9C2zMtDZfpeCzQYQ?=
 =?us-ascii?Q?9Z5B/cEBpgOlHpbmGYRE3VoX1as3nxNk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b1ca67-7de0-4614-aeee-08da0662d431
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 09:04:36.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKP4C/ZxBTD/2ZRgfLaRyu0h3TB2hZ/pE342xzQSXVX+JqMqkArxC9Z/fnYA3FpPcmLfcpeTq2JtoCBzNdHNmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2233

On 10.03.2022 15:34, Marek Marczykowski-G=C3=B3recki wrote:
> This adds support for serial console as found in a laptop with TGL-LP
> (StarBook MkV). Since the device is on the bus 0, it needs to be enabled
> via "com1=3D...,amt", not just "...,pci".
>=20
> Device specification is in Intel docs 631119-007 and 631120-001.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> This adds only a single device (UART#2) to the table - the only one I
> have present, but the specification includes other device ids too. Should=
 I
> add them too? I don't have a way to test that, though.

Personally I would have added the other ones as well, likely even going
further and including those from the other 500 Series variant as well,
and maybe yet further including e.g. 600 Series IDs too. But if you
want to restrict this to what you can test, that's certainly fine.

Jan


