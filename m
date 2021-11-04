Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE42C445665
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221642.383454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miel4-0000e3-FU; Thu, 04 Nov 2021 15:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221642.383454; Thu, 04 Nov 2021 15:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miel4-0000aw-Bb; Thu, 04 Nov 2021 15:34:30 +0000
Received: by outflank-mailman (input) for mailman id 221642;
 Thu, 04 Nov 2021 15:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miel3-0000aq-2T
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:34:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1fb6473-3d84-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 16:34:27 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-f7tNf56YMyq1hLhobHP8AQ-1; Thu, 04 Nov 2021 16:34:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 15:34:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 15:34:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0072.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 15:34:24 +0000
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
X-Inumbo-ID: b1fb6473-3d84-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636040067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmu9kaCm9o+ZEbwJ6U7G597rnuvXZMSx8p6omsSrTHY=;
	b=KI0maFFzGZ9/Sy3lWwU7xiIC+gMbZ2sHVB9ya97Am5yLUCVGmCy9wtJ4hjMR0FKmxsm2Cy
	SwfCYcvR28NxEQJ1d8UmtY03X8DJd0XzlbXr5Q1Cr37DsmmKo3bSiHbVPucXRppOSiUYIP
	g7Jzv2Iy4jUhgl33DKsTrE56KUJnlWQ=
X-MC-Unique: f7tNf56YMyq1hLhobHP8AQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCT8slFRzH+xoXQ8nxGHglK4wfqAHu+yo8bQEUyrfy9PztjJ5ugiEfm0RoKJh7rAHeFyDj9g1FxLsb9eu1rq1q4G7wzArlGsyBN3gsA3gHQNxFMcubk4fVmyVdBE4RESAOVoCM53LP4PIdC50C8bV34sEnsohDspwV2XRdjFa8r9DJ+Ece6a1GUG0HydPBoUt9gVndbYElm3Mpn9kyLuSaOsaCsnabz+TNTHLTKNFm54MAZ4I9dOshshs69yU5YzjxZXOSNaFlCXswuHBi+hXChUJwsoY/+meJPyTRbJgC/A5z9fK/E99exPhZ/492NMz31WFJLfx6jGkmmFehXAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INVcWkniTwhLZ9RP2WZneuVnVIWET/vgVHQxaeEyGYQ=;
 b=MFGb4moi26WtOWOxDw1nypnhhyUV50ggvMr3OWnARVx2rgj/09QH/+0F0UWOKHxMn6EF9TAF+JWkMEVjvKCWwmzlC+m538hVn5ikAps7shdgu2TReU3LmUI+7Rnp2OiNI/EaV4DXUCkasDVx46XigY1ewiuvwK6oigPdylyx6PIX5uEX97jgvcnLIVBKSxOzG8OOW+4RR25HaUpgr4G2qYi8PbIq7w3AcooxlMWcn7J5Wc0V6ZPpDGUak8YicKvs7p+y0jDnM1OZhE1ZDzVulx7Je9mWdQNbaosyMVDVBtRDqFTP+MycEe7UvZlpYqGcbDuOYXTRYyaK8v0ZYPF2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cea6550-ce3e-5a1b-32b3-2a3d3d717711@suse.com>
Date: Thu, 4 Nov 2021 16:34:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
 <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
 <YYP7EkWGdvlDzZE8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYP7EkWGdvlDzZE8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0072.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2683df8a-aad7-42fd-f38b-08d99fa894a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863943A6E3EF4B589929691B38D9@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fatDvMSmCqIaXia6ZdQzdq81GLF6P/Vk/9feb6AmBYpUmJUkcjXQxvmszMHI2W+r8XOzFL1qjBzzrsxvfpux7WR6luvkILbv6Y53BDBP8hb3C62pULQXKRt4SxmFlZSF0wEzN3YdIhrbwFFunP7q5/iFLVcEDdrgds4KIkZrbD8+myuNEfjUmINoXMJVdoo4AM4WfXC0NDdWcX1Z+yAWleViSatnM8QVEjFOoNFzEVzRKPtyIvcQMfBJkHqeEkl1kQHpigHr6kurkedDzBe1aRZgfta1Rpq1GmqEUnl1RVDoJqg9wTvLlXMxDdOZHycgrlmL+PWw/vQZmmqJ9Wykz2yf7VNlyH8vfUIJ6ppnWd4kola80+FBZjedXprXSIPexf45FBGCTHSQ9y9W++C6j20xLsbiXolVLrUqHRufsvxlYTF0hSip87v1l/skf26VqQg70epXFBEgyPK9tOEeK6Nd/QHaZtBUC3g9D686UJT4ncfqDhAjPUbTzjlI8k4Z3jE/Wv6/ZU7voqhYQCSRu0cQHgP7VkhV0s1BA7PmjrkuOvtSYH3HqaRm8648Wr6XBdH6LMVSlg/pA453/K2R73X+ZvOn3VKJV0PRxN5mDU7c/sctNxPP2NZjLJt3NmKDCzb51+9ZN15Rh9TRJ3P+8+huQZTuGgUBMxJn+jnmORvlKTIcj2uc8vBvsO9OUiWLLM0wj6mtVj5h31o7/eXYtr9eOGRMiLKczRXjoIbqSnfzXSCaz9I2hB4EQThXo8OX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(4326008)(5660300002)(508600001)(4744005)(66946007)(31696002)(16576012)(53546011)(186003)(2906002)(86362001)(6916009)(38100700002)(2616005)(956004)(8936002)(8676002)(31686004)(6486002)(26005)(83380400001)(54906003)(36756003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FgA5wpjnkS4z6ZpSQVdGdxjyh96/7JhtvKNMvThkYKDXvPbD8Vjh2MFeICko?=
 =?us-ascii?Q?3LcVW+QLSb9w+npo34z+qw7GbGHVWsQq4Qw1ZnDzcmco5VqZaEhAsHETtf1j?=
 =?us-ascii?Q?FjTGCokCh6YhVyz8kyvB5QPGQfBYEPLUfXgwhiQfu9PqwLLE6nQOI63t/KSH?=
 =?us-ascii?Q?omuuivEDFRAh8qE+HtOcShEy6KMKWfrEoUQQ17PkZLUQRfAiURQORsZu9ZI9?=
 =?us-ascii?Q?+T7ajlXIudJuHq/bv+NyoCwrV8UVToV4WrgPhmn27Qhfs6Al7kctJbXnlRqv?=
 =?us-ascii?Q?ZmkhXgQtUb+q4byVAuIDkniWh28grVNSxbDEaMBHAk6SO6oqMdgjcI7AyTDK?=
 =?us-ascii?Q?YwKU4ItPvdnW9lbqwvRAQRPojh/wHbAwmGvB2l3/VUYky08KwnqlTm3yXHHN?=
 =?us-ascii?Q?coFiQhjnXEoQN3AJTNb3hK/eMrQL+HDNG55g8ynDmSJgxda9xVyCIIGh5Lto?=
 =?us-ascii?Q?JMLirRy6DJMdM5HN498hamPNplVlRCokSzwnMEdhlNUcqa5UGY269j30j/E6?=
 =?us-ascii?Q?ac0KUojG5X9kHHfNw62VVkHCskWw8SR1LjMemPc3jcqsfqjbN+RvdsYS1w32?=
 =?us-ascii?Q?dHOjMrp6RwK7wmwGw9+bLDz4Qn9pMI8KgYLAzLxqqNMXqkKfUhqjIbckEefy?=
 =?us-ascii?Q?eEUCpdH2XGasZMKmrAOVZXr4/6XJdp9TyiQCr/jEsa/QQBvcXFc61i/Madg+?=
 =?us-ascii?Q?bbz3M98/pzV8cO2jDocRHUFcrUO48vb9pEnI23CW7YHk1kv3ydPqpcjBkjJF?=
 =?us-ascii?Q?5EZtjM9yX0IybyvfT5i2u9U5RIE0O9xLmw2HN2Z0Lw18/CnSjQJoAuZ0UQ5H?=
 =?us-ascii?Q?Oea4Ln0FkgyqbwUPKQPSDCEaxJLZR8VDnoc2P9iViEPDQxE2gQ9g1RukrHfP?=
 =?us-ascii?Q?kiRw/WVOpR8x2ssQunTe1NOfLcrBNgFe/ZqKsEdMvqW4kPnXBDxMTDX5ZL2P?=
 =?us-ascii?Q?Q5vXsjd50dsECg30jd4Yuc/mBbErKxydfouc9S16fwvXnHpe7hQwPzhKbPIV?=
 =?us-ascii?Q?mT6MBRMLycDqkemV/YPPIwBO9gE7aHedrL3i4WN+GxzEvNs81sgjNOnWSQ4V?=
 =?us-ascii?Q?FScm5fbmwqozNExPAsx7VpGcRkpfTfvZBqKjOb0PHc+7y0ChJl7pg0+RJHZh?=
 =?us-ascii?Q?lrscl8bf3otyp7t4vrXuVv2FcMN4BmrafNmn6WbyPwHLSOFkGia+k9uM4388?=
 =?us-ascii?Q?TRLUzwot/4pSMsU1BrfXDvTpvt6kMGCunNSLyAiohJQ+JYLdKqVHXKmZ60lZ?=
 =?us-ascii?Q?nYL2DdA82nSMjP91biP0lsljPIjXViS2KwhyGNMUCGvdnbHtFkD3qsqsOQbo?=
 =?us-ascii?Q?2N7o6oBmK6ktyzAIywJxpiG5h3XjNd4cmy9+xo9TcqRLwdcLFr312Ax1zq2H?=
 =?us-ascii?Q?jVx0zbWv6zRJtoaHJO/ckuJvTXoHOKaaaNMr6W1N+w0X9u/JbiMfOzrOg2Li?=
 =?us-ascii?Q?7sUI/QrqP7Gm++UxBtS20QUYSj6kxCH13eVlFb1QokMnRI8g2bTcuMLwRcer?=
 =?us-ascii?Q?/mpQvpf/fJ2deupctRRgxDHSXlG3umUHaIO5fDo4b/JnydkgudDkWAYx6idE?=
 =?us-ascii?Q?v21gRY4We1SuGlBMCLF02ZK0GZ549aa7fyKfPVc16IiCOnYZtG+97M2pG7Pq?=
 =?us-ascii?Q?6OBL4BPGS6/Gb34xx48HC+0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2683df8a-aad7-42fd-f38b-08d99fa894a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 15:34:24.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMiN/baGH9ShS0IZKSoNooA10LqSb67DwGMAJo8FQPdHgXgrH3xSq88EDtn86WC1rduVaTNiUO4pIRBF6tHGwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 04.11.2021 16:24, Roger Pau Monn=C3=A9 wrote:
> It might be appropriate to switch pirq_dpci to:
>=20
> #define pirq_dpci(d, pirq) \
>     ((is_hvm_domain(d) && (pirq)) ? &(pirq)->arch.hvm.dpci : NULL)

I don't see how this would help suppress the warning.

> Or to an inline helper.

I expect it's a macro because an inline function would cause header
dependency issues. Plus both that or any other attempt to leverage
some means to circumvent gcc recognizing the pattern is only going
to help until they further enhance their recognition.

Jan


