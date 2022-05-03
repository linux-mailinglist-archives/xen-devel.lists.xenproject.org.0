Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2E517FB1
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319241.539400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlnqH-00077i-Q6; Tue, 03 May 2022 08:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319241.539400; Tue, 03 May 2022 08:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlnqH-00075H-MQ; Tue, 03 May 2022 08:25:09 +0000
Received: by outflank-mailman (input) for mailman id 319241;
 Tue, 03 May 2022 08:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlnqG-00075B-NY
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:25:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a10eef6-caba-11ec-a406-831a346695d4;
 Tue, 03 May 2022 10:25:07 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2173.outbound.protection.outlook.com [104.47.51.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-YC1kl2LcNU2UKVBh7-PWNQ-1; Tue, 03 May 2022 10:25:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6320.eurprd04.prod.outlook.com (2603:10a6:803:f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 08:25:03 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 08:25:03 +0000
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
X-Inumbo-ID: 8a10eef6-caba-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651566307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AjNpvNYw/0LWrtpQsxe9sWUFg/ze8L34PZyWO6x/dLc=;
	b=IbQd2bmGMOv3hHjSJCuzD+9YLq931gSqOEaWGy++/Y2r3G60mQeYT4eLdREPjQ6Ukx6cpB
	nq2ey9VvhbkyRYAr2yV4/cusVUFL1JWt+Jxij687/XVBqmwBpEz4EF3LoljYSKfC6Uv0kE
	1h5XStKScITAyrXCHJbLctkJ8EzXgHQ=
X-MC-Unique: YC1kl2LcNU2UKVBh7-PWNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+eHwDKPCabDp0Z9kO5FCT8bRrT4Ms2r9AAJ8j0LEy09TX6VbybWX5LnI1DvgFomwq5/jgwxCuoRM/M9nNxXDM/foWCq6IsOg64klTN0jA0G4nU6RsHmqW3h53Fr0xuNHeNDBMXrPW0+yFk2UVSbTU5IeeusY8qeuqXBRDmC/9fKZiKrPRd25MH7E4jMS3wGOzUYFVnPOk4juARecieIl52Bt9Rctg4nmy424a88ACKi8yg9aM8xuJG2llcW6avWuH//e/65XrYtarZhjQdPvCJkylLxQPhl86NVGnFX+it/1ep1GgvCUSz7gEW66kkiyr4z/sfZ9DaNRD9rvaZPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIMh3gqjmylWwbM8PoDU2t+DLqFtULUANv6ziZTaJH0=;
 b=Vnx8vV2oSTfg8fj02cOd1xs6LmPX+6QuM7VTY07ird5BZAPKq7CNuGsAfVGN1E8/v9h87AFBGLHMOzSo1S9ZGTGnUNm1aqdHjkWIaxsb58DtkkAEpl4XywfLAL4FPQfnrkrOse7/lrol5F0fiAVtTw3UYKkV9aTLggHVR7gNOxwakZZN6QxjwIA8y4s7DAn4k72EcK/Dwmi16Enclc0caaTxwfvivb4BDw934xIkR1D23MetZ/HXwqsToTVcOIPlymYrqT4eEIRXoLLUJ5mOkXZUoxrdie9IEK+sWA5wkZtgQsl8eSfZtgFtPPtTMRXCs3phaI5UsYY+6obHC2I8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <faa805c1-e050-6f02-a7d9-bee7940753b9@suse.com>
Date: Tue, 3 May 2022 10:25:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: osstest: blessed sabro boxes
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <YnDe1BXLVsrkaKLG@Air-de-Roger>
CC: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnDe1BXLVsrkaKLG@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e2becf8-4cc2-48c1-8ebb-08da2cde6c2a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6320:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63202855F95B13336E60E234B3C09@VI1PR04MB6320.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7zKeZIB5ySkWAqCITx7LLm/TECHxcWi+PEOqn9D8VTITRE755ZFt5/XMUmYJYCStNhXYo/3Cbiuk6e+xY8/WKJ/f4q5nLhCsYyR2mKg8ETQDDD6nwjtlV4sPwhNbbXlavki4w93t/LK2PRj+GnTbCFkMC2slOXdIbYt5ykS0y1Ug8ubQJ+tATUUQukLV068jeF2Ob+U2Y89XI4fSEZsZFbiu67jmjCPdQm1DwOxxImJCPxWtGv0feRUe/onYMxy1T0jMDBER3CtS0I2ReH+VVqqDhZk5n/CRe9zyBgCWsweGPRureHJc0LWFtqC1VY6qvYaHcqfbRDdSuuYiePMF/3Q1mllVU+cUZQJRYjV4PmhfR9HN4EJQfUJk8qblNRpzBpeY/GO6TuJM6OBb9hx1W1MplG1wreSUzNWdXDhzPej5GHO2UXzGlYEgaEa88NpEzCCkTNAbrPjLJR49zZnV5lC37drXk40qFXy4dZP0KXk5oz50/fAhtrRTBO2UFq3saZ3+gkJZruQcchH3Gr3pWYG1jjFnDt3fZs/2z8UFWk/It6gunmGqM+whw1y/b2th/p3EhtGTcsu2DVx1IeL10Q4BIWbQ9keDz4gNAhZ4UT5CLEkVetZMbN0l+FTKXqL6WQhoz6AVshxwh5NNSpMgKiYQgszW58QM6XUMFnj1HtNkd6aOMhUREsJRlf2wrfjgchAAoOH0h90pIG8gWCvgZATcWVRCoEszTWfVLLAdfpNAnmnsh/escqFyRzvb/RGT/AJReSGnbPA/c8YDtYNunoZz0bELHcBAXe5lo41xrgEYWQq/+K+2zkA0VDy6fiaDysgho1Uwewz+h5heHX7rpOJVl3fdyvVS0GF4Yp9heBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66946007)(8936002)(66476007)(8676002)(4326008)(4744005)(508600001)(966005)(6486002)(36756003)(5660300002)(83380400001)(31686004)(31696002)(2906002)(316002)(86362001)(6916009)(186003)(6512007)(53546011)(26005)(38100700002)(2616005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fP8myDYosnzf8O3Z0y/rlCUh+yVXn7EPrtAg55vfdoz1Oiu91HlI9X/FAs14?=
 =?us-ascii?Q?4aGrlGz2wx2LuI1NeUZYFrU1ObYTIMA/8RP0CBOR9HGY3Qg8GAJ1de1f8F4L?=
 =?us-ascii?Q?2LwueyoZCty2Za24HxOR5tNd6iJ6lq3kGxLxGUxepnO6LYjKN+7c856Ox4SW?=
 =?us-ascii?Q?MqiLEI2ZEoR/1zfGckZiV2Xgwfm55tYHphDyi1/nB3k8pwXd8orLivlrNGJH?=
 =?us-ascii?Q?X+4xfvCtdEppkOXq5EYeGofbJ9LV0qx06rzUHOjV2grNmUFBzpI9bz6EDCVo?=
 =?us-ascii?Q?NIIUwZJkdt4Ei8Hv36ztVL6O3n4QxZ9VJ1IlFs9/IzbCN4xXtZlHRV7u/Vdi?=
 =?us-ascii?Q?smXYih7Y6/sedAZ2DIUpEqgEfUWa+d1h4u08ITOFq1HOSy8tjthy7dJwyLyP?=
 =?us-ascii?Q?bFplHhVs1SlfHoms+dnBJXu2fhPpzKhqPhkmICJtkrvAkVaBsHVxglZHqyPD?=
 =?us-ascii?Q?nNzWboj/pmEJt85Fy8J3iOP8AbToqgZXfl0QV48owDekFzAgvUfRzAgI+Uh6?=
 =?us-ascii?Q?5ov44wTR6Jigs/7ozQpekgIiIlWtDhq59xbCtkhWnyzcG2eI69TPgwq7G4GM?=
 =?us-ascii?Q?7gxsW70elrSByoDhv9slzKvJlIhy4X7BnuqsY/7JO5wbqlmFEzxyZcFnOLF/?=
 =?us-ascii?Q?6YKDhIOzoEkPJG5Vo5JVzj2gzPF5tkBMFM3dDmbcD+RnCAUGxA51I+XiIY4C?=
 =?us-ascii?Q?olUNQazQbLyNdLK5ScaZQ+GAHe/M9E5eNHEhPAWiMwjaR38yWw1It6XaZdfp?=
 =?us-ascii?Q?ova4mTwEI06Z4YBP4gC9tr138n+cm0mOkNM6OovUYXqKO0yTl0lRaLTN5NFP?=
 =?us-ascii?Q?gCc0f16oN4yR9WA/s2icfF0C5C4hPH3f8Xr0NeWgmBANrc/IuVIz8lOtgWz+?=
 =?us-ascii?Q?RGxcvspMUd7yBTdUJw+zdoWmbPr9d1M8B5Z5t773BG1540vpivxrQ/gUw835?=
 =?us-ascii?Q?7TaMDLnZqc+yY1oaIybPTzaOX4KwoJxa48BUlpn1dlisr4mgl7trqbLdt7n7?=
 =?us-ascii?Q?bcduiv9X1nw9x/XXoklF7o0Tx6sthTX/55lIDj7TLf153X3jS10ud7Mo4cn/?=
 =?us-ascii?Q?W5Is1G3mlUXosD5S0zUndd03kzOx07A9yphor+jRJE7mVuvC1liuTqffoRRO?=
 =?us-ascii?Q?GSgI9je1BLRLmTirtz8+Cg02M+6gDDXxp+HwB/oxHndWzNBreZKTIc/m9u4b?=
 =?us-ascii?Q?p+NJcng6B00OtpUkzZqvTlsbC0Z+/0s4GuwcTEwPheZOuFUtNP3ig0iVRoFX?=
 =?us-ascii?Q?DZv6cVGoET5fZxy/3LQ2TSae5GPf/qhTeKy+V0bknK/6tQvWC7GOt2IBtvEJ?=
 =?us-ascii?Q?0h/wV0y288g9bra7WyX1mmWAMKuiEI/c74NLM4aL4vXOg1AXw9UaDrDnCPFW?=
 =?us-ascii?Q?cFlaw/2SAoFGiVuFY1l6/750g+Q7sImoy2Xmuyt6+6SzqPCrSVnM8gou3hUM?=
 =?us-ascii?Q?ki543AcjeYXDphKPnpmane9ew2MY82gWGwwgqW2w47G9Y/+/mZNkFDQIvk3y?=
 =?us-ascii?Q?vRpiVdO6E/1oox6NKLDr7Ieaoh6Z/L6ffffkoKb/wknMwWHKPX5yMdj+f33h?=
 =?us-ascii?Q?czFTlyz1ciCHi55KjKtxCW40xUyLWCwpe7ALuk9t8QfFjn1uQ+owA0m464x3?=
 =?us-ascii?Q?MB3isxLNTU/Fm9bB5cdYuyeyye3u+TAJd/B7NoZa1MpoY1tqHRUW5GjHzk1K?=
 =?us-ascii?Q?XT4v5YPmdYiWr88ShubNwn86nRDm/JRwxe9u78/Hi9elxB3TTu+15RRbyxIW?=
 =?us-ascii?Q?Fb0W6bybKg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2becf8-4cc2-48c1-8ebb-08da2cde6c2a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:25:03.7311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYpWvwyp28wApdWYbDaZHwtxhrRfH86Pb7sG6BzGRZzGIFRhYPitTQ3i/EkeeFaI3qNP52pcJ0NA43kZh+RWag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6320

On 03.05.2022 09:50, Roger Pau Monn=C3=A9 wrote:
> Hello,
>=20
> I've blessed the pair of sabro boxes for production after a successful
> commission flight:
>=20
> http://logs.test-lab.xenproject.org/osstest/logs/169857/
>=20
> Note that the boxes don't seem to be able to boot in 32bit mode, see
> the following flight where all 32bit jobs failed to install the host:
>=20
> http://logs.test-lab.xenproject.org/osstest/logs/169986/
>=20
> I have no idea what's causing this, and hence sabros will only be used
> in 64bit mode.

You may have better luck with a PAE kernel (which would then also be
able to use all of the memory rather than just about 1.7 Gb):

Notice: NX (Execute Disable) protection cannot be enabled: non-PAE kernel!

Jan


