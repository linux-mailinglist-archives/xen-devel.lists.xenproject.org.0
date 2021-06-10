Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FA3A2AFA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 14:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139867.258538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJNz-0006IB-OW; Thu, 10 Jun 2021 12:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139867.258538; Thu, 10 Jun 2021 12:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJNz-0006FC-KQ; Thu, 10 Jun 2021 12:02:11 +0000
Received: by outflank-mailman (input) for mailman id 139867;
 Thu, 10 Jun 2021 12:02:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrJNy-0006F4-KO
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 12:02:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7f6f014-7577-4a11-aa19-9e4b2554b201;
 Thu, 10 Jun 2021 12:02:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-n8gypHHqMf2FRq2LMe-L3Q-1; Thu, 10 Jun 2021 14:02:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 12:02:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 12:02:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:205:1::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Thu, 10 Jun 2021 12:02:06 +0000
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
X-Inumbo-ID: f7f6f014-7577-4a11-aa19-9e4b2554b201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623326529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0HTaZgCRt0TkfzbiM60ImI+eb6R3SnEDiFO+kQHa+no=;
	b=VZsO0ZBocGaAE+pzQOVXbyDYs46cXpPfZKyTOCQEQeNCjNjMXd5Q9zihoVB03Lbi7E71ZW
	6TKBaOcmYSxMFr0NYhuMIVWejB/A2cyAgroe4FHx3M83X8gGD5OmWS5c0ZHPlkA+S8HruH
	E+TcHHuLXZ9r2LarcNxGNirAnZTqdhk=
X-MC-Unique: n8gypHHqMf2FRq2LMe-L3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxLDbCkXMrUPDISmgUdSPTN+CHnwN9gX9MC44oLwRNO0VO0fFywAOO23b5tBmvy3BDRSKhnLeUb9zuxmbwx8Jl8njiC+zrJJN5cJKaZ9t4ffkQrp4pAU0srTbSzmRot3fjLuMtsUL07xmyQ9nVbTM7Xdt8j13PHbBEsGDmdx+igxgYrLrKUk4+JG+DL28hppY7fyGPNS366ZAgLXywzt8G9qzg6cORR3mlt8c6adpTYvTXkxCOUH0OJJ9qzT6doXeT+xJd9doQZgfO3WKWXmqACh30p9RajUeg40MW6a+R8se5QO+Q8jc9sG9vINltznvHYRDrQbCtXPBipBefhHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrqhD6PTMrm4PTQJlWlqfUI4BRXNvGy/TXalfvjz0Ig=;
 b=DCNzE+zJb0lEOy47LkGLQB9zsLBGraRYPuzNwjQ7UIldVnTCrYyjmfGMzEyk8HJRjNDlUIMDW77ZcgbG5SDEtYN/uTSUtWjx4BpryEL4bchreVdl9asu3zbq4WbmTvT/UAmysMK8iav1gLhROvqfM/NN0gZFOvanGloHjSi+krRFEcT5AQej95+/23xJikbRuaqZdU/XZYqEhSblBCuShCYh1JuRou5H3kPs5NHOSKv6SovxWwIxrBF4mOSQMJB4JODD4Aqx4slhsEKrpG+tPwwueK8OXYeMd2SOs7rJcdXbzt7pvx+02A67Ep5gvwbWfaegr3PRC8AObbzKYUcb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
 <0aa4bf61-e08f-6da0-1cda-48e61bf876af@suse.com>
 <38cfe7b7-e5a3-2216-f52e-fdebfc7af517@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b6142fa-3dc7-cd54-a40c-d4b9ef47afad@suse.com>
Date: Thu, 10 Jun 2021 14:02:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <38cfe7b7-e5a3-2216-f52e-fdebfc7af517@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR07CA0032.eurprd07.prod.outlook.com
 (2603:10a6:205:1::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80b7ebd6-3e91-454f-9ed6-08d92c07917f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61754D367116D5FE2C47A054B3359@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dFP0Wm6/pMbrFvsRA3w446jJk2CfvisohDFDZbWyQo2iZi5PXB07CDkYgvIsoITROuPgZ3WRHEorkOdK/GCSgj2BgtcwzwKrST6veW5UTMOWJmb2AK7DnKP1WAV07GTPXpY24LWuaLUET28e2TF5D6UdfntGa0DKq+IfMKfTg/QsLj0tu23SXJ9Eo/mZfYaeahN6h+Zb1ZXm/U6IJb9iMXrqMsz7iVEI9vczBjrl95uC+e6Acb+1U9p8UMgyGhKYg0piZra0gsVcLiFYQZELDxydSE2jwBW7kjP0Xf2m0p0AOoJFDJNB0sVr16cBKmDapkDYCNdP1KtIXvLJkS3s790iSkt2USiOKevLEAEcsSvGlVqClXUqoeSa/Gkztc921Baj3HWVIgRTHc9ab6d0PWiKeVFosF7QsqFPVveJEwQ2gLN+jVOnbfwmDsguL2tVOaLL2ZUeYMzpN4jbEF5F7OO2uranB+XwIT7WRwhN3xvoKIWL4FRPC6S8LtyLRjWUmX54Qf/MBxS4DeG6kb5luM5gfGeTqElImUTXDs5CmI6s3Jau2z6aRPL+HBcnZSQVCIRg97bco4cjmRVT2VMz1KM3e93oig8ytyvpQwy4c99p3Dc8mzHgPYED093DAt8S/WrJ0KA5o1LsATPPD6I2O85bxPoiQUMkLMZLMbTEChgEeKscxTdVNmeUg5pvT/sUtfJTZ0dd3ur/yB5ELddCDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(39860400002)(376002)(83380400001)(186003)(8936002)(16526019)(31686004)(86362001)(316002)(4326008)(36756003)(8676002)(16576012)(31696002)(53546011)(6486002)(66946007)(54906003)(66476007)(26005)(6916009)(66556008)(478600001)(2616005)(956004)(2906002)(38100700002)(5660300002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?/2TJvnJ9faWA/iGi76VnP45irqOez1ARaYk0cuFdptzvVKPO1+BaZzUuNxKY?=
 =?us-ascii?Q?7WTxyw0rWbG106i/C1B1KWBRKzJkSPkUD5Y82Szvy19XPERArAnc3ysSbg2S?=
 =?us-ascii?Q?HMN3idFxr9EoVkrozSsl9OF5xgKCZhVAK+iXudpiYMFQHmXbv/1qs+FGkz2N?=
 =?us-ascii?Q?PZaNSXSjJSUX+HaJMtQ5Y7YBBRGgARM/lzs0cY1OKPVDiURIoFww/J8PhP+W?=
 =?us-ascii?Q?bOl5uUXuP5tt8izTsdjHdYup3y+b7LAjX3ZgTnBKYHGFkr4xbz39K3dAtAIy?=
 =?us-ascii?Q?aBBISXjsgNkTaL5OiOMSPWpGyhtaZW6V9dW7q90QWwbiGfUxVebmO+FbuHw6?=
 =?us-ascii?Q?FbUSq0wT9qP454gkseI5JIPjeOKAvitSb9VMrw5POAKrZCwGdG6UwIdAPqTk?=
 =?us-ascii?Q?dOEmr0LzrYVwz5rwdcrbjJEc9qMErlnhPjkf1z4e6zAQJcwApL8/B3/NiCDo?=
 =?us-ascii?Q?M8PcGeyRAbumyaP+PttUYtbEQZI63AMTNjNxmpU2770IUXxm4jVEeWT2yWN/?=
 =?us-ascii?Q?bB87l6lrkkkWYGCAKfakZ1snUuTOTOnsehbUev1Iujs6dzS1m1KxCl3ovuCw?=
 =?us-ascii?Q?dTcNnuTL/P+w/MYZ5VqtLW4p9GmacX8GZVilOvdKYH4E3vUnWhkLpHAaDJN5?=
 =?us-ascii?Q?MVroDpcoyAgB0YYKMvVnHvAOYkeNGpFJcUx684sqQn5+4ryPMMTcHLfHazCj?=
 =?us-ascii?Q?EEQTEQ3M9SeYzD/T0BQonbex0oPU8VZB33m/ZMPZFkdT6wbETp6H534cJVfN?=
 =?us-ascii?Q?wRguOAj6wCcqYsGnJgsAR79wQOgGdzTWh+FPepNCUB5prYSuTNJIz9+e4QMY?=
 =?us-ascii?Q?mh9R+ysO2akombfEKwQKdmNw/+2Wa1+enDHilLeOgo+D+G9pZJYncmVuBMTc?=
 =?us-ascii?Q?vedDyg9RBanT5I0uI1gZt7ALMS+Dc5LJImy+XS6ztOjlYYco1iLg31NOMlRl?=
 =?us-ascii?Q?W1vYSGI0X0JKP9WI1QQKekQ/s/ufQ3c2v78titQlkq6Y40DlW6fB3H8aaGpj?=
 =?us-ascii?Q?uM/+za0VMND5VhMTbwxZ8vzGSLKKKoW/0n54bfdX5okgcZnRhGtgXXsN4ddu?=
 =?us-ascii?Q?hBgAHkCRnrYZ8UKycTFV2B97dgSR51ey6jVhSvFgu5j1RvwrlkNaEQnk5FRn?=
 =?us-ascii?Q?ZBzlAKp5oQ6UotFFDQQlcYPDzDNQuiN2HIF4mAiWmAiOSiJkXFKskE+RpFzk?=
 =?us-ascii?Q?i8uAz1IEvlC9FRxVUwiZOPqG0vED35Fnf66dB2TOeKvKt7l34IOFcHYG6afz?=
 =?us-ascii?Q?1eBxsXPVx2XSI5KrYq9MseqGkIo4NfHBkRgTN7LaTwROV7ErHhR4rrZvAfqG?=
 =?us-ascii?Q?QmMgwSvRbOnviDNM9CAyRlnu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b7ebd6-3e91-454f-9ed6-08d92c07917f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:02:06.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTo2xxdBtiEAJ/IJahV8/GDW8n7i/37+WULG4J+k9LnSDghK1iqRtjHbjMBw17fAyZrfrgIGPdQ8W84zlQyk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 10.06.2021 13:45, Oleksandr Andrushchenko wrote:
> Hi, Jan!
>=20
> On 10.06.21 13:48, Jan Beulich wrote:
>> On 10.06.2021 12:01, Oleksandr Andrushchenko wrote:
>>> On 10.06.21 10:54, Roger Pau Monn=C3=A9 wrote:
>>>> OTOH if we properly trap accesses to the SR-IOV capability (like it
>>>> was proposed in [1] from your references) we won't have to modify OSes
>>>> that want to run as hardware domains in order to handle SR-IOV devices=
.
>>> Out of curiosity, could you please name a few? I do understand that
>>>
>>> we do want to support unmodified OSes and this is indeed important.
>>>
>>> But, still what are the other OSes which do support Xen + PCI passthrou=
gh?
>> I think Roger saying "want" meant to cover ones which currently don't,
>> and which would have to undergo more extensive changes if they were to
>> be enabled.
>=20
> Fair enough. Do you think we would also need to re-work the existing code
>=20
> in Xen to support normal devices (not SR-IOV), e.g. we currently rely on
>=20
> PHYSDEVOP_XXX and other Linux specifics.

Yes, work in that area would also be needed. For example we'd need to
scan buses / segments as they become accessible. Right now we only scan
segment 0, and even that's only possible because on x86 mmconfig is not
the only way to access config space.

> And even if SR-IOV is implemented
>=20
> in Xen this won't allow those OSes to stay unmodified, including FreeBSD.

Of course, it's the nature of PVH (as opposed to HVM) that OSes need
modification. The question is the scope thereof.

Jan


