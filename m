Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716C4A8605
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264855.458115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcxE-0003Kp-Hb; Thu, 03 Feb 2022 14:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264855.458115; Thu, 03 Feb 2022 14:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcxE-0003Hx-EK; Thu, 03 Feb 2022 14:19:20 +0000
Received: by outflank-mailman (input) for mailman id 264855;
 Thu, 03 Feb 2022 14:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFcxC-0003Hn-Ol
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:19:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45a3df94-84fc-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 15:19:17 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-v4R4LFkBNO6u362F4YioAg-1; Thu, 03 Feb 2022 15:19:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:19:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:19:15 +0000
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
X-Inumbo-ID: 45a3df94-84fc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643897957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poxCJPu+On0hgrw8M0GG0x0NcdxG3HQC068XgVI+pLg=;
	b=LeE/fnNohvs6VrTQ+mOk8SNRMvejg97zNDrVThAta1jqGMBsTHnFHuSFqtm7dkWMQnW43+
	KCKgx00JVd7SPYLtgq0xf9KIMWVXG8pycDvwk/FzmjiYa9YluptRpn9e0jdaniJ+PMFVsp
	6/yIFtUPvt7YOQ9IJnN9jd3wQ2dtl/4=
X-MC-Unique: v4R4LFkBNO6u362F4YioAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaSRqxtaAAvbs0U+oABso9pWHlSr8F4l/YLWefIHMDmQ1vOZUn/OGBSNAd4Hm7ptZFKZMpFRQ/juerGqysULLK5NM0crqKHwiqA3iKCuvaYFBh5zKdqObydrEh3TXY62W0liE6aX2JJsrRgEUGHAPHdwKlfa1Yy6lHpmH06Qiu/Q1oFS5UcQk8N1d3UM2KJ5cQQB11ZCGJ5fFHPuE6atCgRnL7SF9aoyF00vS1tMbgKXMykJyIJO4vD/aVF4Ihwr+PWrpwE+WvoG8xUChzPMn0wlHbuqjBOdDV88W9Omk5iylFrnPrPn0Peo0ZYXih/aa7G3vvjmO8BRBwlmMKB5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMImXoeAqgdJ264Zg4yEYdEmkeDqy4vj7E3LyN4DGd0=;
 b=dpQIZe6ERi3Qk1SRJt50mA2OzzjqG+6gFd2iRhue1FgKWppeWLP5dD0k3OXz+z3Jn39t13J23ZGNWzKgMTFqczb/lSLOomFQ5sut/3D6wlrdeQMWOTUcJyUOIt1ykVZz8cwpD4H9hek6NY5LGFnT+3Dw/p0J96U5G+L3mIWmb1iH0tdW1VpySryp+c6FQJXXbLLir9c/i8Vim+aFk9ErmOkNflrGQy0uuDf0jPNA6SbxOy9+6DsPtyU1KPfpyjyhRasK7641VdI/v+45Te/dYvdKu8hbYysf871yt+JhGed302fsCEZ53DqM0Vx6BMSaJedQMpN3RVlLQOvZrYgbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <348f062c-9aed-0275-f0ad-87a0eff8e986@suse.com>
Date: Thu, 3 Feb 2022 15:19:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
 <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0064.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4740c42-a538-49f2-9da3-08d9e7202850
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB44928583C038C90CB96AE627B3289@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TO/HBO9AeA74oOVdSHa8sDC+3dEgH774lKQOs6NgveBaUc69TWe7+TL7nc9idl5IG0hsmDqOQ2HFNxLRuGCS8sguPfxsV0Qq7agmO11f/glkUfFaXiCWojOnY7yd5WJH3n7b632jLDrImIA44wAOtM6seTCOEtSEO3J25fXyI3GUsjF4ZrvrlxCIYwV4amBhf6oNf4oEXpqB2fKONWJTA4l/m/7Iiv/EiZKhWccuARWHachw0HCqGYWib39k6VwNqtRDMMy8yn3CfVOFrAf3IKQbejhbClT3584y3RnjF6ZyKnXkX5+Oo+b2dq0bvfSqIJaAUjycqIBQaiGUresg8B3uA7QpMscsEBfIJp1cL9kFGQsEGFbJOzm2WQAWQu6Ak64P589uBQYsv5jfNjaPoU3m7nu/njvwi7Ol/vOQKpHO+mL0Wg1dfwPgEDfL009bfMTyW/IJcT5vSu1I8qKQXioJVDhwBnXoR96ZwNgLWXG7G0UWv8rWh12zWDjuByVocXgL4qmFvVrswFax/ZG20nDpml5gNR0pv2FZKQ7ntvKEpkPOGR7lALnfXjWo2h2hqG5/7X6CDtOZgcp7RAjDenVesVTsx081DKuCBBA3SoIMeooJYtFjwQSr1rRcYvfudZ1qbTpbU+0MueV66UeE5APTEGFkF1fL9VTH8c0mPWbze+WSCst+gOePmxfmxrjp2Eij6+2amjBJHJjo9jvH8G21+G306MwQrOUN6RNJkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(66476007)(110136005)(36756003)(6512007)(54906003)(2906002)(8936002)(8676002)(66946007)(86362001)(66556008)(38100700002)(4326008)(31696002)(508600001)(31686004)(186003)(5660300002)(316002)(26005)(6506007)(6486002)(53546011)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?um9bUGYvwwTTiXCdd13JxpvpCpNqRgQdp3pvBMJ1fmhccNfmh31w5o5ugpzf?=
 =?us-ascii?Q?uaFIxELZFKPJEXN0/IB2yPCAhIP18MI3KoQKmizoXfdlI6geszV3AcuW5zPZ?=
 =?us-ascii?Q?WSA7YQVWgOnv0b1tRKK7Hci+BwH/u/WCNvdZL+x7XsBS7xQrW4fUtH8IchLe?=
 =?us-ascii?Q?O1Yd/y6mD3SyRGtsXAwQy7aBnvFwclxkn6ds/trz3rtqTJv4WjEKnONreHBG?=
 =?us-ascii?Q?Y7SYIcHMlSRS5C4nqspYuFXZiByQ5RA1lQqN2FEI8G7KxRoE92gLPyv3agJD?=
 =?us-ascii?Q?cA4Mkp3sBFtQXSLoOKqgKs1fm5CF65pEvIl9YHYmava3PLIhsH7XgTMkXNVh?=
 =?us-ascii?Q?LmCQH+D8tDu4XHBXqfdlEXP99MUGmA+saN9UipRrgK0TNtU+A1Ax0awG9mKM?=
 =?us-ascii?Q?Gm2NXU6VPbCtpmLCskUuvkjxU0f3TcH3RHsjjhc/OnB7Ajb4ANYGpfiCHNLM?=
 =?us-ascii?Q?2UXzoo3XXBsxZ1s/BtPE2vtNz5zKfJfT6icDMkqOosgvJae7k7w4LJj7W8Nq?=
 =?us-ascii?Q?5/7xiys9zyWO9yUWp/6Hkww2r+CfMYwP40anA6SyTcQ7+XizCtJDfRIA0U8q?=
 =?us-ascii?Q?vOO4t4T+89vx41O1gRH6QBZPy3hTtcmVWL7rlYqgtxWu60Zs30oBEz/NZlO0?=
 =?us-ascii?Q?JIZhcTV9DtdJ2f3kom+aaTtCf0+fd9SvxobwW/94sBlHisw9e4veOG+DVJax?=
 =?us-ascii?Q?laFKs/MtwO9kMK43YfU19VPGJTewJNUb6EIDiYLQzM+VUeu/qXs74Wn+QRFp?=
 =?us-ascii?Q?y3IUTJ73aH0u7Of/IJC8TghyqdwT951oRqunMhBTneVZkj/OFCfZdZvz1Mz4?=
 =?us-ascii?Q?9XB5hOBzd4RUJmbxX0BJ+5TWSm5uoUftqLjEf5oauACZwmQ47evwX98/duW4?=
 =?us-ascii?Q?QWzhw0TTxplmknVdjq0nTx+RwW4Z+d6fbduC9JehgEW3aJSOJA+b9TTCWcWE?=
 =?us-ascii?Q?DU4+EF6kjCDJfMzwtOK8tsYp84OYM7PWmQJ5vPqTTcDoaZP3zosaTSY+MhsD?=
 =?us-ascii?Q?YZOkgFAPZe7P46weQXoVfxhKouJZyDdgptaelNsUt5UPL7fvwE4jeblX6sQE?=
 =?us-ascii?Q?eaYXyTBQuQ8L/cHkNDvXedHmt9LG0Wlb6vWCSyo70ZEuyWoeWp+4w4DCwtV0?=
 =?us-ascii?Q?085nK7VYo3Zwfr6F90fi3OMzA9CykcNOjUCwKUGjMZnZdo9MqNjDKabovCfW?=
 =?us-ascii?Q?Bm+5ncObaK4lKMFajN6k1OPCLdGZvJFVjKvU9UhrJ/J3WFzGIRtla4hdcBwp?=
 =?us-ascii?Q?Pin61TqVTRPGbUlik/gbk268Ezrek0BjDL0Ov/dLXIYpaXq91D5tv+tz29kU?=
 =?us-ascii?Q?wNKw9iIAuhrdR2OnTpcuNrIyJUOFmWKdOTE9PAqDKDxW2m822z57z0UGD0//?=
 =?us-ascii?Q?WvycAY76H074ubqvMfRE0qXRGXZZxezvJrFG2wyM+GMiHiAAG9Kc+0tce0Na?=
 =?us-ascii?Q?s8FqWbyMQrLruZBVRhZh5eOQDzwQjjurW4yyga3lUV8CHd7N0BDSABF3Pj8u?=
 =?us-ascii?Q?c8GV49VNRb8XrcipaT8ga57T0hYT2TgvAKxpRKU9KH7IsdBa61YWKUkTmvuF?=
 =?us-ascii?Q?4JGimhW9bOCPqY0dH+e55USr4h3NoqzT/10M5S2OFP055eN920XydfxO7nZK?=
 =?us-ascii?Q?f35sTtRYy/g/GnQZKJzrjz8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4740c42-a538-49f2-9da3-08d9e7202850
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:19:15.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4N4w9M3mUda3fRsGUZoAVxWjuCEArf62L07pSzsgm5SRSjjKTuTFHhvy3M4ifz5WDdGTxn72ZR5FCKROAom/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492

On 03.02.2022 15:11, Andrew Cooper wrote:
> On 03/02/2022 13:48, Julien Grall wrote:
>> On 03/02/2022 13:38, Andrew Cooper wrote:
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index 37f78cc4c4c9..38b390d20371 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *v);
>>> =C2=A0=C2=A0 * from any processor.
>>> =C2=A0=C2=A0 */
>>> =C2=A0 void __domain_crash(struct domain *d);
>>> -#define domain_crash(d) do
>>> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> -=C2=A0=C2=A0=C2=A0 printk("domain_crash called from %s:%d\n", __FILE__=
,
>>> __LINE__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> -=C2=A0=C2=A0=C2=A0
>>> __domain_crash(d);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> -} while (0)
>>> +#define domain_crash(d, ...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0 do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( count_args(__VA_ARGS__=
) =3D=3D 0 )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("domain_crash called from %s:%d\n",=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FILE__, __LINE__);=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>
>> I find a bit odd that here you are using a normal printk
>=20
> That's unmodified from before.=C2=A0 Only reformatted.
>=20
>> but...
>>
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk(XENLOG_G_ERR __VA_ARGS__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>>
>> here it is XENLOG_G_ERR. In fact, isn't it ratelimited? If so,
>> wouldn't it be better to only use XENLOG_ERR so they can always be
>> seen? (A domain shouldn't be able to abuse it).
>=20
> Perhaps.=C2=A0 I suppose it is more important information than pretty muc=
h
> anything else about the guest.

Indeed, but then - is this really an error in all cases? The prior
printk() simply ended up defaulting to a warning, and I would think
that's what the new one should be doing too. Or even leave the
setting of the log level to the invocation sites of the macro.

Jan


