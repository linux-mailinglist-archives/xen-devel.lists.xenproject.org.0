Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA895338A9
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337017.561486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmYd-0002wS-If; Wed, 25 May 2022 08:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337017.561486; Wed, 25 May 2022 08:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntmYd-0002tj-Eq; Wed, 25 May 2022 08:39:55 +0000
Received: by outflank-mailman (input) for mailman id 337017;
 Wed, 25 May 2022 08:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntmYc-0002tW-Ge
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:39:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f51b35a-dc06-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 10:39:53 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-xAFwCiZjNKSXJ43OqhbeHA-1; Wed, 25 May 2022 10:39:52 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4049.eurprd04.prod.outlook.com (2603:10a6:208:67::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 08:39:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 08:39:51 +0000
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
X-Inumbo-ID: 3f51b35a-dc06-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653467993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOJ8d7N/5mjhYGaP5sUR9KkiDPtelkSIVEfX/iOrLko=;
	b=kq3JqiwbFueNObY8IHugH/PxY6xz6Jikjgp3pYE1bmR8jqcX3OSvhCIYhwofRAyMwzgc23
	v1hsWYcGVPKN9cBBH84qZ+FCRrw5Zg2k2B/rP7yhwCKPpISkB8jl0195HSjF8OBDAEzp8Q
	RWvPTqEUX6oZCtGfO83YA504DhLcSg0=
X-MC-Unique: xAFwCiZjNKSXJ43OqhbeHA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g//74Lc/ypWlMpyz52uqo5P56tTulrckGHNqh5Jr0N4Odb7VMcz8JMJkqu0/NyDt+5BwYTRga1WV5IAsqJ3tHm26xbGjGzgQivlLOzDo6GObdyDqczaBHk3tAbqrOFVd9PBBnNoRyuuZY1s65EGtu5wNXQxZEnQEKhJWXXqduHnzRO10xaVgySBXvNF69Nb+YundhFmxDP0KxTVOOwC7JMTafv8Npvg7ZiZOnfckKP9nR3/qlwCByftG2JVnGd/HxxNdC5F6SAc+N1Swr5gBZir6WwgyrXRsG/nB2wO5GP+0JZBdwoUmloW7TCIPHpCCx9TFCy4Y4HDlSr/AL/sKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROppEHIVTwCrJkO18n0PDdJK3kF7A2IE6j+5PiHkcdQ=;
 b=ET1tc8iOeZBlv/5kYUbgzdziY1ACx0z4zYdfsMJ+eXGi3Aw5fE/FQhALED7cXiSwXDy4tDZ8ucxEluTIN6kGltJn4hjUh0t+LockIzj4ZbeNSYkTyQtia4iW9w4zUMPBGPpe/B8gssrsoBNXsaT6KQVdn7n+gf6n0fUv2AQQmMm3UxPSelw8pwmNSikVHnJb4K7i6mursY/yp6A+5tNbh6hPPopEh8ZALisnd/qegZyw9z7KX/WHXkymFiW5kUtXlMATRDr4GTbZx4GgiICdxWqYS/xVuo2eXfmla2P2+kK6s5Z7w0y84l0BY9HnCF7EtL+Ba0Ipw8sTunRe0DWslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f158346-07d5-89d3-f043-a7e5d71839c9@suse.com>
Date: Wed, 25 May 2022 10:39:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220525081311.13416-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9daf7a32-df60-43ca-0bcb-08da3e2a2215
X-MS-TrafficTypeDiagnostic: AM0PR04MB4049:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4049403A669BA3C87B7C570EB3D69@AM0PR04MB4049.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ya33Zv46ZwSEo0YuLa9LiF8Ryqh9hy8HVl6r//iFGFtk6wPEiM2wTvsMT0RuoUWIkRsjh9e//lWbe+JmmpTNUKVutEKSN0OgLc3JWHLq5wsQt7H2wdfkJI202n8ihgTDoiHmiuEI8CdQDd2FWCMx2cN9diPyNvDAAr9XbRipxrpCqdXTBuNElQM6i59mhpSvnrLhcbm33lQWNntaVaH1AgDIJPAiWZdAWhMKrc7w0gTFw4b7sJcZ6nu+IAxq/JOKCbUFt8Ra5LKohVXONEjdrWgD8Hsyx/AO/VL5hhywYiMqnUNi9gZnGaCAqsYXsYHFP2OTFwHL9mly9SNhxBrF74P3x1je/A5s3gxObBgOCRXFBXJRXNkrnv1J28oLTG/GrPkpSMVUk5dfIBA6njfLpB4Mu7rtP8V46b2/1qkCBor4bt03CtyQ9uo8KQSpSEcRa4zfNMRB5oA/AZZjOD6euXko76Ck4aaYo9WUrUqN8sVJWXfCBObEunkm0PMoUCamCLhHMm5d/zXO4aFJsXz8CCdd0JqKtDJGqRncrYjHGFtOungu8CaDb6zUBo7AVf+Tzi/OsLTeBpbycrzXY3iq0CBq8T/eeL0nmbbDcZX4CEv+ojvak/g99MveA4/noT+3rjHJkDKEFVGWiHEUiuVoA7XJvmqXGQ/w7UaAlszGgWcemxKvb/PBUOj1qdZz8MXUyT5OhJqZStMsQodTmlWfBSQBAYfvhH/wodU9pDGVxBbx6nRW1tg2YHjGqq53OJnv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(36756003)(53546011)(8936002)(5660300002)(54906003)(83380400001)(508600001)(6506007)(66946007)(4326008)(66556008)(66476007)(6512007)(26005)(31686004)(8676002)(4744005)(186003)(6916009)(31696002)(2616005)(2906002)(86362001)(6486002)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nyUZCO/udz4ep06jxLAklH49jFzv4mBHXw9f18IbGs6AwxttJmFT4IkIIVES?=
 =?us-ascii?Q?VwIYBsqJ50+L4HTD8wS86wnsI2/Bxp8N4IeES+ZwbcSZkJIhgl0JXHUX3TKj?=
 =?us-ascii?Q?oHW55i6GHsbCvxoI3Ja3isJP3Fh1o0izsLpK/e3Di74i3wpRFiYpVWJhk6R8?=
 =?us-ascii?Q?LLKWQpXlTyoOsrpbPGjQEpj/ZcbXFraSFsniSWIrlRJBnw7FuqcYFt+kGdk5?=
 =?us-ascii?Q?HIsuK8+th0eo78BTykzOoMT7MauUHo40FqLfmYqc7Y4V1XgaZnpaHaahV8kd?=
 =?us-ascii?Q?9UpeT2/oHA89axtUSbF+48D8XFMYUFDL0aiSkfbG8xwe/FbUO444NXIH5T9e?=
 =?us-ascii?Q?guqe9FbmN1D4RFfYmqhfz8FNC2cxf3/Fnxw48kJiOy+z5xK/GGJLsuQxXt3W?=
 =?us-ascii?Q?lDi1Ex/jpi/51i8coTbsyl5QoqPlFJwauedsIiSyziA9jc+26NqrHx2rnODj?=
 =?us-ascii?Q?g0z4m3bNZ8TcTw+CmX30fz//IULGkCLseQYlxpp3B85vv0cH9l9ZYFhb91MN?=
 =?us-ascii?Q?kubaOBbQ6pdaXRsOg/xGpr9355UpW8YMw9DRe6IaEUndAYk3zjFR0uGRmzLB?=
 =?us-ascii?Q?HHkrOQRHqHnjRsq+hSUWjjZDZUqcYLPVMYutGgC/CZQIT3m2LLEwo+ydVuwR?=
 =?us-ascii?Q?ogPwZ5VjFNCTprR8xHMjrEMu5HOf/A5mzuX5h5aUMi/OsHMmtg+pmbSSCdPX?=
 =?us-ascii?Q?AmFvK/fxEMOoZ5cbSC1gabrSyj/Q4iaxFNSt8E83APMyNJMOTSy+p74tyLsV?=
 =?us-ascii?Q?voeCnQEK5ScNU+tn5uqYZji5rXQ9J6hQidUMeauFtnp94BBJNcZyHdurxLwV?=
 =?us-ascii?Q?yE0FuCSSj0Wx1UBElQ2g7SCQiZpM+Wbs0nDaa+uPxyOfp9FimDVH0vYv/t6q?=
 =?us-ascii?Q?K1N3dOWgj5zmOZvqeqNdddBBdi5NZbU9LLaE3SeNTGdizw2X4mhRl6yA9HHe?=
 =?us-ascii?Q?tRR14lutclOWf31/ZA2IxxJ0xxwygrWe5ed2cVsOqQce7111TwBhAisxSys7?=
 =?us-ascii?Q?Z7w7nTl12fP3WAS5uzt+pYDDb4nPDUgmNrxPv3XamaM28CTTF6jQmLHsDJd+?=
 =?us-ascii?Q?bs8z6ABhlwbjKrC5KIC5WnsmRyuZ9nHk4UptGem61L1SWAgAo5aZS1MsUC3z?=
 =?us-ascii?Q?Bjt7N65Whgzt1yVUs/AAO7DbjphQt2gOuopxarGIzywM5VKQ4SaoZ+owQR2T?=
 =?us-ascii?Q?EJHaTYiFdXc5+Od4UKnMoU0soxjioxUV9ww0s957ymwULoqSAFZe/gs3EhFH?=
 =?us-ascii?Q?clm1EZLy3iMmlzJ/Olw/XoppTF3OtRZSrYdyS3a95Nfq/MP6dqPywOjIGseW?=
 =?us-ascii?Q?rimHX1/h6pUg7cglzKbN+IkxZ1XlR091+rM3vt1MnISggIyxquYXrC7VLiX3?=
 =?us-ascii?Q?W+tSFeS0am2CdR8aOyyDW+OerB8KCN7CIDMeIlbk5Cg/qU8SUuRyeMCsjl+a?=
 =?us-ascii?Q?6XAt8wvfgZwZklDqc+eiKb1PLZBAS0B897q7IjHNYrBWV3qwuGRDn6ETZOJC?=
 =?us-ascii?Q?ADiEHJZZJ+wAqc7605Bgd38ZwpY1VRfxNjz+pAqwkWLZJyanCbE343yVqR3B?=
 =?us-ascii?Q?Q9XgNkWVqh1DiQ4NyQVxd2m1A+GbgIgxElXy5FhYFvdwYK78mZhfz9/uEjcM?=
 =?us-ascii?Q?Fk3OtfpmuBRB42pd2DjB2LfU6AdrZfKHIDzxjjrE445p5mN6bkv1D6wBfIbH?=
 =?us-ascii?Q?90dr4gOIA0po69XSm4qW0rJShpArvLcePcSjKveojaPSq0sBdE+vzWRi7zHb?=
 =?us-ascii?Q?5QW/qrS6Fw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9daf7a32-df60-43ca-0bcb-08da3e2a2215
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:39:50.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tJpObdEDwmt5P8s5eed8Bpk2I1ew538Xh7Sxics3POzyr6d/X/4j8od4eW1CZwSp26YxVNGSMFjQVj/yS9L6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4049

On 25.05.2022 10:13, Roger Pau Monne wrote:
> Rename the flag to better note that it's not actually forcing any IPIs
> to be issued if none is required, but merely avoiding the usage of TLB
> flush assistance (which itself can avoid the sending of IPIs to remote
> processors).
>=20
> No functional change expected.
>=20
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


