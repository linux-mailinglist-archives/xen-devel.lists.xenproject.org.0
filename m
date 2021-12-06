Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDD46A11F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239348.414844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGhz-0003Jh-9O; Mon, 06 Dec 2021 16:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239348.414844; Mon, 06 Dec 2021 16:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGhz-0003HR-6R; Mon, 06 Dec 2021 16:19:19 +0000
Received: by outflank-mailman (input) for mailman id 239348;
 Mon, 06 Dec 2021 16:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muGhx-0003HL-FT
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:19:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4203186a-56b0-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 17:19:16 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-AT6H4VqwOvCTRjhUqZRMYA-2; Mon, 06 Dec 2021 17:19:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 16:19:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 16:19:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0047.eurprd06.prod.outlook.com (2603:10a6:203:68::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Mon, 6 Dec 2021 16:19:11 +0000
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
X-Inumbo-ID: 4203186a-56b0-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638807556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLLJfZsIamwKBgwTqCJ9ke0Jna0S849SFV2e/v26xhE=;
	b=LYt9spXy4HZ5hzSWOs95DeqciO/o+29EzpZ4vBUfyb+9bokgzP9QWa8al9i41dnipHkDEx
	MrfbfAiz97JQ6arYB911uxXTfMrv1FvpD+tuJZarfNrYlSoALKtwHaN6GJIsJGJVBxYSvl
	UUQltUB2ZEr+wOm01us5x2e+qMSrr3w=
X-MC-Unique: AT6H4VqwOvCTRjhUqZRMYA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMmwl44vNKgy2y6sztziO24YjioCgjhqBACziH0ltkUSkqJY5l91Cz3t1Ej9kbwj734v9P227ZjF/bugEJfyzYrcElFU2h7VC6t2vdzfqRBeRgXiQo6hU+6Ctsq6mXFvCrxOFTxQb/aSr1vffK1VLUwlplUxkkK/brZIZXmKcO3PIeNd2TKXUv0t+RozeWLMZon8GvcgGfpo+MRBmLWM9J65f9G3zsOqfl6IDF1n463bicE5kbGmKkQ+KU+nrFMzLc3kk9Auf5MXuIAuTCvzIwDktFK9iBa9NXi7fN0hvYu1ALzgND051aGgUCEP8qajuHjo+cBWgfv+C6suqJRi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwciUovSapFRG8mtklJgF5F53Fmgy9xFXrmDVrqqEtk=;
 b=CDWbIOFo53DoJwAoMhzZZm01qO30pso1oRIKyBwp+6RPUDDfjDEy1wbbRhVb8yNUs1yGgamsGJXcqqNm5TwNkSZu7GOb8Dc+2irAUo7rrqhIXIYiDaEIBxQ00ITnKf8w5bnknldcB11rt3JHeAvGLfToeeNflpE8Stc9r3lgrF2E0cG7dGGn85ZmoTnD1jCcAVfQ8IGFAwro8jagP5/TowHAQMsmB3V6qtXfEdu8YZo3EVc8BLKlbd+x8XesTCHeES/YG+Ia0WcyeWCg1wGHbKQmL4FdOiE0lqOKlekrldQSLItd7AlM/yaV+ABHAuC4CvAVUJZua+7q86NYlkQrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1893b85f-5fc0-1b63-2b6c-a26d4667786c@suse.com>
Date: Mon, 6 Dec 2021 17:19:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 09/12] libs/guest: apply a featureset into a cpu policy
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-10-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211129153355.60338-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0047.eurprd06.prod.outlook.com
 (2603:10a6:203:68::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 558a0d08-1af4-4d91-f430-08d9b8d423aa
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744C973D149AFA7E603E98BB36D9@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLyb0e6yNyMf6+ahogDSWeafG20Nub3MbHdkhHM2+9WQm4pX7a5QkIKUxz8mTzIxNtB2k0sxWpOjAWRIdvcXbFTIBpfq8il/6Q0DoZBspw+9MwrGBBTjBxxjtR3Uba9ohBTONcq2jTiIeMvARHOk5OrVqXcVzjZgikRFHjFZcFMemRgwYXa+6EHAyS73OgDYX5M1SBoqpIHZwkOgJKMwiJ6XqJL6geHw/+ToO5yi0tlSWtHQHrE1pwba1ZhD3Vkc/3bqZQ7Z1P/F5/ZHN6YwAXbA+0ZP2rMafko05PA6sP4k7gXijKlY/LuomAPTB7vWPRDgVU/1ozMUygG1YNnG+pBjeukb8ySiACeGfiVFncs1n8QvKe5ySSzPxu5EmZZErjTqHsP8nMYe/f4UJKA+TUKuRoz1SRfvajTMFntZYJ5Cv2LS3cz+jNF6RT7QHUamfhtzaqGtiLJxwGGisx+S6Tnded120MSePmX3Jj9OZpTbPSbbWPYby9PjTT2QzUig0VEnsNcjKDirUCwWzXlCCgoNVnhtv7gWumbTFGSWqIZnNvOYk5kATkmYj5rc6vmGauX8Ale33dpH95jo9qwj+kesZUyoXzKjOUBmu+KhSUKM9KYkSaHkZ++/3oPkL7K+GkGfW4mqZ6SdRkZYaAa8ndkUSKFMO9wczGdGUJlOKcPjpRdzaHqhYnrl9pVLwK/Qc0Es68y7Wb5Hj/4pqa0uCvwGBMGuZZm3BX4G2V8Ry5TkF7TMeZBe3Q2p2peJ7exK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(186003)(2616005)(4744005)(31686004)(2906002)(956004)(8936002)(8676002)(6916009)(508600001)(66556008)(66476007)(66946007)(53546011)(26005)(36756003)(316002)(16576012)(4326008)(54906003)(38100700002)(31696002)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4RvNJX0V9fh0Bmg+cfj82ip/OGcBxR9gD5nIItat4b6Wo4QLodiWk2JggdIq?=
 =?us-ascii?Q?vfuUV5bwyLvdNkv7D98dtAxSjGfZ4ub82/3GiA1PVIeiVd5M67v0MALyKilw?=
 =?us-ascii?Q?QGgSJob4iM8sB8QpddE7voVTAZ+m/TwSKE8vev78jBXqeGrpH2EKIYM+nDIe?=
 =?us-ascii?Q?yNLdOdjo9O3BScBDx9veEWLHxu2bsQ8Mb1+00woWDKEXvAt53IV4eyiImIcT?=
 =?us-ascii?Q?SYwcH8H+f4KZWkqlc3MUGZ0QwBVe8VEfMcBKYsFg9U3VlwpBG70Zq3PYE6Re?=
 =?us-ascii?Q?U1oiF93KPPuXiIAR8SsJTnSwRun/bS9sKRQQefntGZVa6py4DL1h8AGdKi0w?=
 =?us-ascii?Q?oOdn2nXz1hgVrQWolz+TNxeVCMIlfZLlWsZkbnL2yOOKnSxD6U6uXozUPSM5?=
 =?us-ascii?Q?riGSdf1xpo+N4AsHiwKh3rq38+TDNNtzA+nyPa79ukG3wrg7B0rdZbphFHio?=
 =?us-ascii?Q?bBQPYCteST1p0gSlo2ht4u3F7Opay2SMhzBKdgbB8xxBpwlp92t7wOXgZ8SE?=
 =?us-ascii?Q?m+clCtN4FBia6/PrC5aEnWk4TlhvtuAJJ+UQsiAb2k1LDv/ZchpX1o26uvC+?=
 =?us-ascii?Q?allSJd7OPqqxZAs5X+el9MEByRruc1pgD1rEK6+TdMJhaMLHFRESTFAcANt9?=
 =?us-ascii?Q?24mk1xNChwDMiZ4gf18Vpec9cHTNEKw4r3ssq+XtUI+4P72J3YhgJhXXTs0k?=
 =?us-ascii?Q?g0QBo30O7ECAFR45YJK/RoFtbb6eSNTYnXgvMd+N4IuDxyU9CF+BHTHhZ3PN?=
 =?us-ascii?Q?ornLfRwWknM7XfQycNY/Z4IokqPrtiWKHXLWDOdbTUNYBx2h8KpUTN+jZIPI?=
 =?us-ascii?Q?HsrJ6WHGa/1TzARFZQhd4Xd1UXQN7qDO5oC3ix68kpx7rXwpcprEc3JuL5U1?=
 =?us-ascii?Q?ypq14AilwjjHGLkJ9PDdJCQh36EiKo7tALf1uArCP6tIb8f3j1a+7N3l7r/b?=
 =?us-ascii?Q?8bEzIiDuEXHwrsXGD2rEsWAv/7OEuLFzG+mKFg31OeJu2v8tCd2PRrSKVYGF?=
 =?us-ascii?Q?U/azLvCWBZ93X3nSwWS/SAxQQuvBlpfoxxLOVcHYy2NuM2BZOTkNANIuqfMo?=
 =?us-ascii?Q?vhNuie/UFAimM/4QzmPkA6BFtOa664B/7kzlyi4tjF0FvwXnkTetOsYpacDf?=
 =?us-ascii?Q?TFWGptI1Th6k618zPMt4+y8LL1edFvZhauT7iKnlOFbbdFcCg2fCylc6sWOI?=
 =?us-ascii?Q?mT11YreF9+KXsrfUpgItHkR6QrT4oqN9nfJWrQuxw7UksGeYBqaXBE80qZc2?=
 =?us-ascii?Q?gsAf9xnAhaHY/0ZmeMZGTgJTi9dMjwKQyKkl8O5RgfuEofaE+agWbRvAuP9F?=
 =?us-ascii?Q?AHjT6HAD7SsdbDe2Lmgsgo/28+NA0URsatlxxWRmqhtxWBRvndBEQA3UtQZ4?=
 =?us-ascii?Q?lrmw4EXKfcd0cQZlR1EyPTx+P1fe5qoeKk7LBS/S9QkbMLIL5FR9YIWMKmHq?=
 =?us-ascii?Q?BhKQVPDsgC2BF6qbqEO6T30o83mLv1Mq70NL9NKKayeG6DW4z/HTUbxQRa7u?=
 =?us-ascii?Q?EC0bUGjmcuFNL3XlvzYm4nKkfGiH7DOZnWYAb8uiyX3tKeuiv8ikYMPS9mD4?=
 =?us-ascii?Q?0jpDhFE1amOtkzwOSC8fDY//hS7vWPtKmQUACbXOki6m4VX6KTKKvwG86mDr?=
 =?us-ascii?Q?GICYgQCDbTUpUkxoGSSjzy8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558a0d08-1af4-4d91-f430-08d9b8d423aa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:19:12.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cOibVV6dIa3sPfimr+jcBZyF9O2zca7/iKQSC689A6Q5viBA0Zral9LjG+ugtQxJq4mxAVXWKGgU8zrmin9jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 29.11.2021 16:33, Roger Pau Monne wrote:
> Pull out the code from xc_cpuid_apply_policy that applies a featureset
> to a cpu policy and place it on it's own standalone function that's
> part of the public interface.
>=20
> No functional change intended.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


