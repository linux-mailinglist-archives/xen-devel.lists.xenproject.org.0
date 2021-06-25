Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376D3B42C7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 13:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147133.270997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkU2-0003K2-PV; Fri, 25 Jun 2021 11:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147133.270997; Fri, 25 Jun 2021 11:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkU2-0003HD-M9; Fri, 25 Jun 2021 11:58:54 +0000
Received: by outflank-mailman (input) for mailman id 147133;
 Fri, 25 Jun 2021 11:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwkU1-0003H7-DF
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 11:58:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3bd1e75-bb1f-4de6-b853-b9311d3756f7;
 Fri, 25 Jun 2021 11:58:52 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-5FeypJuWNhSC3fltX7rT8g-2;
 Fri, 25 Jun 2021 13:58:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 11:58:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 11:58:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20 via Frontend Transport; Fri, 25 Jun 2021 11:58:46 +0000
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
X-Inumbo-ID: e3bd1e75-bb1f-4de6-b853-b9311d3756f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624622330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rpp0A42piln6pIqA059GlkY0GIWSQeuqIBQNgsGcR6c=;
	b=f3VXfJcBQWYF4hNpn+2ftnwqWo6KDloNzrQ3vJdhxY3kh1nhRBDIzhZq6frqsFO/qMp956
	lxquUi1QVOejs1p8bFzqGOg3eyN2LuGcEWExjUV6/AzdsaAtCQV2OVEEQUgooA4JaZYHdR
	5LS5yHeDxcDUk6uxOMfIPjVc/cdixeY=
X-MC-Unique: 5FeypJuWNhSC3fltX7rT8g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJrVRYpjNI3z8xG3XJFo2d6XOGRWZmmMJzl7t1q0R5mZzU19MLD7L5UA4xNYdID/PHGtbrBf89MEVzQuvduGQs24MkAaPLYL4VwIdOHLLw45iVsVSj6aDKhtax15of+196vUQYU1lH80bWng4JuC4yrPi89W/7Ov3mnUE0qv58rIcW9QjVB0ofLclxNst2VDKI9qZ35utpI/rVtXdYB2ocDywesKqLyq5iuVrFPBVtY1ZpBtgFqN2VtG3Lbj0ZH2Q6PJR9tNwaq1ac12KRwYDtkvS8CyTWfiWoxyy0iegPqDEsaRMg3LGyyoWU5Bbnu6SjzixajYSBvFhDFy8FN1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAhJUHImPIhAKi7vEFOmIRUhT5eo0pNQB+Ild4XOWD8=;
 b=UC+24ikWpMEkTjQDPlgX6o1UJuL8rjHFoio0N+MCbpOnWl95NJM0nb36DJs/6KWf6FWr3V3lZYSRxhRqKOtuUP/bd6olUEJ/+92Z8QtYBnb9BntLGr4tE+EGWhsWbPx2qz2oARKSkpvoQA7a3nb8id4JfSuZeerSaamjjp9WjSRHRQKP95OZcmppAMxjdErNO+N5Wlw/brmpkDvrWfjpzH1NbwXNHv1UsMdlo4g/X1yjTTOajdrBN+u2gXWqCk+l7qp85Sg2k9LKztqGWfR1X6xhKeE8jWrJM0gI/WcsIZQ0mVrRxYHkq8w444Rts78PpViWjpqfM0RqMy5LVPxbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
To: Ian Jackson <iwj@xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
 <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
 <9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
 <4b360f95-aec2-935b-ce95-73a01cae98be@suse.com>
 <24789.46868.943149.770825@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6439a3c-9920-c300-2a4e-2a5894e5ee53@suse.com>
Date: Fri, 25 Jun 2021 13:58:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <24789.46868.943149.770825@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64040073-94ce-46b1-f43b-08d937d09659
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039A8B1D0BEED7F0A831B9AB3069@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kRBWnmSuWYsPSFt2nKqZ1ILCAOua8uNKRndcdsJHcZYEPKtInwrZrRzczyv3U3PnF32X73ImFuxR34vj4C9qhuiVpSLAYAEljbxSTIcwn9osJ6Lpo/wCpBJebpx9PwgUPDbIMhxcLcEEH5cpKDwnVVPr0himLzeVtDHfy3ANEtBHKgxRogWxSy9/ZQSvgmyBLjpJeHQ2uyWwyhjDTjMnTYyYlaqFkkGKcoORe+WNoH61ELCPevW+lgRjD9TduklxuIBUdzztEuuaPkzvwFGxWUaXtr1oVxT4kdlRkfsabFDdPRy/JVd0ocqBQCyKm6wZXUfBklAcRs3ezE8zF4bxX0kTbFJ3GUUgoEwV4lu83NPfc9oNCX8BaX6Y8zOxvdui9X23JXvOD44c9bZ7W3AnCGteV4TBQq3bQf6l6pE+wirELKhOUsDNLUdw7lxKjpiosSgDt7FG+nBI5n5u4kA8HYIMImmY5Xg8SM9KZDWsPKFxLU8UM3n2tKIHPq3Wfw+4wcnp2ytCPvED2Fab+uS3PJEaEvo3+zlGfNJn+vWZpRzOnP6jxO7AZmKE4t/II6IVxttDcrFFPwjzHpL8Ai62iDnCV+i00yfikG4s8ghQ7Pr3G8ywtSwO7cDQ3FSAXowpwHkKZuOuZ2dnLKhs9zoW0H5T15TPx0rQXQs3RLxBC5JSzA1p/z5nWuQxUJcsuygJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(366004)(376002)(136003)(6486002)(31686004)(66556008)(38100700002)(2616005)(86362001)(8676002)(66476007)(31696002)(8936002)(2906002)(66946007)(16526019)(186003)(26005)(956004)(53546011)(4326008)(478600001)(54906003)(16576012)(5660300002)(316002)(6916009)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TTVVovmqQTYhnX1TtVVkIVioHbTssCcQmiLMe8jGH1en6o+9f69WyD/ouT3M?=
 =?us-ascii?Q?fz4sP+PqdJ19KatD8VfhqlKegDHDpYIM2q2G6Exwlb2UZ8rQ0cABkRlpfCNX?=
 =?us-ascii?Q?VPlPFFYxNrSOVqfJxNMm2dTgO/j2q2QtIFd0LbVsHRLZXpmu9TlxQPMYw2/S?=
 =?us-ascii?Q?Xkxka4ng2OL/Jc3qhzZV2JpRP9TJhyYDUtPLkTf6wDS+AeTsBANOjzNlq22g?=
 =?us-ascii?Q?vLaeKBOygBnWqDutsWjO30lZ+31QvlqwK0iHW+EwwLtwlIBFQHRCVXOqG9y+?=
 =?us-ascii?Q?YGFKuA9xPIsSIPHFEcL0HpzeV/8FNRXJEWyTIJPn/nex2v1sekzXFyJMEcUJ?=
 =?us-ascii?Q?sLvioU9Q7W8jBDPh/lLl/Md+eu8BQiXMgdyUxCN6Ujy3omdlBlk7yiE/4xVJ?=
 =?us-ascii?Q?FVkOLUFXpm43ETj2CgInuFq5PYZp5X+mCD7pL47eyiJ8bguUNAlK4YY+B0TR?=
 =?us-ascii?Q?0BbBV/rqm9xgQu8JZJ0amyvMdDRgbtiS4rctagMw3LT+VMepIV/yWagVzt1+?=
 =?us-ascii?Q?Zb3iEAsCw3/irnBxQuHZiKmSqfUtsES7P+1c3SrRaYtYYDA4wCQGVZHYU+hP?=
 =?us-ascii?Q?MUIMQVnVOy13O10SCIqgDhOnAflIbb2VidUdvBbzZAUBTH2ybrIbA93/TxR9?=
 =?us-ascii?Q?BLeh0zD15Pmzg/oDnbkulpu7EoqsNWX2DqibTCtadYtiSQVjf9DAM7B7FPhz?=
 =?us-ascii?Q?xfmMF/is2eMWoQSX1oEF3Kn2WDFy1loLCS4MhzRwete0MOcyCP4WVmDm2yp6?=
 =?us-ascii?Q?/1vPOJG7FRK0+bGvFm33WjNamy1zC79yATMq3tgCsnigFAHqMXQ1gXsAAMyP?=
 =?us-ascii?Q?qrCVgpjTka2ppXFbh9OROv3j2XqbYGRGcnLCZV0jzM+vfRjnXnucnDje27B6?=
 =?us-ascii?Q?mscPWdNgHFnLGcegI0xDmYJsrZJIEm5OiR/yyV/5DPm0nOjDitmKVAy2lo3v?=
 =?us-ascii?Q?0HFYi/XonmFflJJaE/WPi1yIdEnhKItcBElcdKU1e7d2pM1/+p+gDQ3f/xpM?=
 =?us-ascii?Q?FYpFCpAUWBD1E/eZfygrdSW3DG2CRJ50D2vFvIUvjTc2e168sZJ11sowj5Hj?=
 =?us-ascii?Q?CECIkzoJyNoTGDaDmylwlSjZ0Qp6kbzSMd+ZvLxP2vFeV2KK0aneqGXlKTEi?=
 =?us-ascii?Q?36SLrF6R95SX0Mtykv3ig1Jf5Cbr75g0N/NQNB64PU51LNz9rCfv9HQQYror?=
 =?us-ascii?Q?GF/36sCbPRWq5puhoOZfNgtkfUU4UEevB+iz9PMI5ckiC5SNVO2VVXQyaIyj?=
 =?us-ascii?Q?jwwXtAkdUM/h8OoUI1sOQlKFnfTb1+7HDusIQXyZrdbDMoeB7novdRnY6SsS?=
 =?us-ascii?Q?bZthalBKIVQU/RvfcxNtFvji?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64040073-94ce-46b1-f43b-08d937d09659
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 11:58:46.6477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIYfYql489uDehkVQjMcl+nBwkTaIXeEQ0GIpDfFGMb7roFrUDioeI3AzwRrXjnX17LhrpCB3pqOW+tqJlqyhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 25.06.2021 12:59, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] libxencall: Bump SONAME following new fu=
nctionality"):
>> On 25.06.2021 11:17, Andrew Cooper wrote:
>>> On 25/06/2021 07:31, Jan Beulich wrote:
>>>> On 24.06.2021 19:55, Andrew Cooper wrote:
>>>>> Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() retur=
ning long")
>>>> Is this strictly necessary, i.e. is a Fixes: tag here warranted?
>>>
>>> Yes - very much so.
>>>
>>> andrewcoop@andrewcoop:/local/xen.git/xen$ readelf -Wa
>>> ../tools/libs/call/libxencall.so.1.2 | grep 1\\.3
>>> =C2=A0=C2=A0=C2=A0 33: 0000000000001496=C2=A0=C2=A0=C2=A0 59 FUNC=C2=A0=
=C2=A0=C2=A0 GLOBAL DEFAULT=C2=A0=C2=A0 13
>>> xencall2L@@VERS_1.3
>>> =C2=A0=C2=A0=C2=A0 39: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJEC=
T=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
>>> =C2=A0=C2=A0=C2=A0 76: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJEC=
T=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
>>> =C2=A0 020:=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 (V=
ERS_1.3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (VERS_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3
>>> (VERS_1.1)=C2=A0=C2=A0
>>> =C2=A0 024:=C2=A0=C2=A0 3 (VERS_1.1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (V=
ERS_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5
>>> (VERS_1.3)=C2=A0=C2=A0
>>> =C2=A0 0x0080: Rev: 1=C2=A0 Flags: none=C2=A0 Index: 5=C2=A0 Cnt: 2=C2=
=A0 Name: VERS_1.3
>>>
>>> Without this, you create a library called .so.1.2 with 1.3's ABI in.
>>
>> I'm aware of the change to file contents as well as the disagreement
>> of file name / SONAME vs enumerated versions. So telling me this is
>> not really an answer to my question. It may be by convention that
>> the two should match up, but I don't see any functional issue (yet)
>> if they don't. Plus of course you leave open altogether the
>> backporting aspect of my question.
>=20
> The patch, including the Fixes tag,
>=20
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
>=20
> Changing minor version in the filename as well as the .so is not an
> impediment to backporting.  The actual soname remains the same so
> there is no compatibility problem and the change is still suitable for
> including in eg distro stsable releases.
>=20
> Not changing the filename is quite strange.  I havne't thought through
> all of the implications but I'm sure it will confuse people, and it
> seems like to confuse at least some computer programs that handle this
> kind of thing.

I guess I'm still having trouble seeing the actual issue from not
bumping the minor version of the library. This is still largely
connected to me not seeing how a clean backport here would look
like, in particular if we were to assume for a moment that the
oldest tree to backport to did not already be at version 1.2.

Jan


