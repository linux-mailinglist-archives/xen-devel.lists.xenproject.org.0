Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98483B5ABE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 10:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147753.272662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxn18-0005Ra-Su; Mon, 28 Jun 2021 08:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147753.272662; Mon, 28 Jun 2021 08:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxn18-0005Pj-PS; Mon, 28 Jun 2021 08:53:22 +0000
Received: by outflank-mailman (input) for mailman id 147753;
 Mon, 28 Jun 2021 08:53:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxn17-0005Pd-Ew
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 08:53:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a1540eb-78f2-4f27-b949-331357f2e585;
 Mon, 28 Jun 2021 08:53:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-Be9qyy78OaOXhPNW2IabGg-2;
 Mon, 28 Jun 2021 10:53:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 08:53:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 08:53:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 08:53:14 +0000
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
X-Inumbo-ID: 2a1540eb-78f2-4f27-b949-331357f2e585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624870399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l21HFzxltDp6BhNjIaoFSlmyCCOOxxDHhIQ4T3l6tCU=;
	b=LL8TygXv1wsvEa7eUsxi0MfSrw2nRBuTsC1ZP2yKgGjcth4zs1g2K0x3f+vEBFJdNW89M3
	2VzefDqwDMurCPHpqZ60TwomhGUXefgyXKbw5VnO/vf0k5otl5+w4wC0SQ+85/2YOXIe6G
	juAJBYiQL2/00CkVa9Kkxy3ZUkTZYho=
X-MC-Unique: Be9qyy78OaOXhPNW2IabGg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceCx7tw2LEPU1/d5cIwEqTG906wg4Qhi7/OLU6dL6ypL+7lrGTaEO5qQGt+GOel7v0ZlQeg0NyBjePQQgDFWf+sD7wN3XMBFKk+T/uiTDvDiOr8EsrAvoZH4rDswqhQ+IX+aHQLc0EvpAb7rak04dJhehnoH1Ga6Uh09nZArEcp2agT/GxOZbzEIqLaC5ud0LK6OWVCcqe3jk68KtldPZdTTBrEWsFpwUnM1+1/gc1SGgbIpGtyHt+kv3GQiP7GjFoLEy6+HZ6L3Fou/pf0DzDJZCGyx7UZOp7VS4SYD25CP0XVUKHrZ+JDvgKsK4dai5xdiY/FuXq4GmylaSh/+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNfBoWLeAchrpJjQXWjjbGgAEVvQCWKuiBky322Y9og=;
 b=bKHD/xMmy90uOl99i0Iq0ainZnk/3uyCIC8p4XD9mjbo1hCn9ErWVr5drQwAPJdcPgqifnFNwmJwxAbcHW3jZkXr9kcQB/UyullaB4BiQF7Sx+IHl4JFp7eCVkasSaDDlQp0uzSIkeu4VqEfO5xZ45SIcVvm4lPd6iJi+7tJwFPJojk6cNYjK9evbmcXD4YrluEHfBYPlSBPYqcXs5O0S2x1/+NdtxlBZHHyPwVAmLzrs6AbgkzQX+MkexVTF4tg6UMRFNu06aoSQequ88OvWNKqA8VAGDg8/5afXzX08oSSq1ExMVhxSc1NMakOHXdpuZCual2BjJCnolxJGAgkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 05/12] libxenguest: complete loops in
 xc_map_domain_meminfo()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <0d824d4b-0696-baca-a3ef-95ee641e4d08@suse.com>
 <7cafca96-1d01-db96-8583-b8299aad41fe@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc9de126-d3e3-cc9c-a203-9c6e733a7d2b@suse.com>
Date: Mon, 28 Jun 2021 10:53:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7cafca96-1d01-db96-8583-b8299aad41fe@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b94d8614-5c97-4ede-08ac-08d93a122a54
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301433DA9C0E4B398E2380DB3039@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4BOgry0nbbxTtmPKJ3L0IHxsTzdGumU/QDRDnfaiA8srUF6zTO8Qh363QBjEbEER39hXs0tWYiO7RSUR/MaeIDdW6Or8EIVw7bYzaaLxoHm8c0InHB9a2+TX+4ubhk8SL5LTCsCI6d2YL3RFpMLvEopVbSIM38aPlslXjQqTvXVHqfQpccnzvzS/OQLiJiGtInTtGR0sD673h6htoUMLFvOqOsnyq1+mpPfp87kwkDkOC6E6KNuzXZOMOrRlJdGXyP2IALS+hBbLaHt697TJQSfft76t4MJKXvdPe8TUGM9FfYFbdCCcXQo9GjbeBIF3Ts2ZY3hDDTr6rL7OMHNtq+DoGKjdb9vPU1Y3kSiSP83iZ1cfEc8lmiKROom67nv6W8AWkNnr62hFuq7NzMYwEhn3JRglydSg32+UP+QrkTCQ+8a02/kDIBftOZ89F3DsmHvpWkOFlFnHxt6tb9sIAZUiiVdydppQOZN4lAgWNjr0V/xGGbDKp0eTiEwKV8eYEeQ8Quj34SRDRXKbatfv+2fMFjCdM1MlEuwkQh3xsfYV87mXOabvwGhvy1XXDvqkgRaUY2hNL/3C58g9JANQSjkBBJVfKqjfRQuzBRaZMecIf4uw22jUwg2lrE3FQVm4/WQrtayYQaTxIWi61xxGlIvWAZznd89Ci758t7nyQBuQQMvw85qyr8TQUQtI+HhcvSeZrTWi4LjuK7X5tPOk3V2w06vVFuVs8+PjC5wf4bI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(39850400004)(376002)(366004)(6916009)(956004)(53546011)(5660300002)(2906002)(66946007)(66476007)(316002)(66556008)(38100700002)(54906003)(478600001)(16576012)(186003)(16526019)(4326008)(83380400001)(8936002)(6486002)(31686004)(86362001)(8676002)(26005)(2616005)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?43TS+fm92Uydir5+QYCOFuyoQC8447b35Q2qJ66heQ2VHfsLhJBIiurl+0Me?=
 =?us-ascii?Q?725Gmbkr0QUTbzb7Vk+fGoTzl+99RgLTakfrCANFhM2ozcI7wMjw3kB2PhU5?=
 =?us-ascii?Q?y+nGq8Pg/zwgH4oT4HXJfQrsFyz0qzbliQZe/v0tvxrq7ISxS1tfrxIwuZH7?=
 =?us-ascii?Q?RegjDdAQ6e4srXTQfOvUAjYtFiEY1jSTL+8YBNy7lhDJ5aw9os3ql7Y4l5Bf?=
 =?us-ascii?Q?gAxNfoorFOSyLtFN/W21zAdRsgErRHHA0BH6YdmvK7r9Hurm5AemrbtH+dPX?=
 =?us-ascii?Q?j0wjJPKGFaQb+ulAGZcRt3Benk+OO/ll7819FToitpFpGBYGKFXq7Ym2BUr4?=
 =?us-ascii?Q?X2C5QhJcz9r1UVppMtMKg/QtcEml2JGk1odxk0XNd3daqK6kglprK+SOmwev?=
 =?us-ascii?Q?lgb44Mm4L7P6qJd+aUnfQA72tagt2Jhrpv6GymVclF/5rQvoeJsbwT2RVs5r?=
 =?us-ascii?Q?Beiw9Wgy4HZL3VdlFaclM1AGmpNnGPA6dK719kT/3BMl5imxoMus0p+7Lydx?=
 =?us-ascii?Q?L591JfUyaZHyiotyBu+wTwhiUARPjOSZI2oJjKcxxR2t4bWbQisZ5bDW28hm?=
 =?us-ascii?Q?haZvPIclXzHZZ4PRa9HHQF+h6eWiD98LLO/vRgOTObhfjWilyX/5LqCXcgA3?=
 =?us-ascii?Q?hGbM2W+CwLHvDj3IFCQPQl3yLYbeMRf254I7VeSMF76LJRHL+9wdBhfZ94+q?=
 =?us-ascii?Q?Xi08rDQkgI5tjIcbdshHZqBc9BrnPz9A5HSPkKRf85N5tRa8BkM8TuuGdWfL?=
 =?us-ascii?Q?z3tdHfvfFw3dICcMrqKXk0VPozyGgg//dgdx76LC+Ghkaafthd3TptPw9ILW?=
 =?us-ascii?Q?obFpFaHx6E1wOX0xYF3YxfP/Fjm+GWj6iyfy7ZUKh2dsVwy3VZ1VejSJSPac?=
 =?us-ascii?Q?C4BmPMAnn+Gp8Ajf30W4Ui6f0GlWJQsAW8mK0fRZQddlon9EB1n6XhJ4d+lU?=
 =?us-ascii?Q?nX+n9Od6eguKzBDBKIY5mvCEtfi76CRb9lYRgI+ObWlB3cJLcxBQhoRMhbrZ?=
 =?us-ascii?Q?GUL2obTJm2M+YxFY5SYLKpNY5jJPRaks4ejDqLKB8LMzerFNbqGKCmGiA+DX?=
 =?us-ascii?Q?xf9xa0zY5eSC3KwMk4Hu1J2rIi5zCU7JdBdYoDG0DDzr0FCNjPIQtCg2pdAq?=
 =?us-ascii?Q?64j+pQ5lzk7gNjswMFxeNyy6CheAA1VAbpcINMiqIkhcA1gDJZrehk8DRPA0?=
 =?us-ascii?Q?9ccGsyIazDC+rNC3ZHozELkj93gFMhd4KTZtAOSK4IINS8ziLF4IxXKvN+mX?=
 =?us-ascii?Q?Sh/E1hR3aBhwxt7dr34Ysybmhg62LwB4+fLlsG8cVUkC9lncQpLEM67FUM3w?=
 =?us-ascii?Q?AAqvnNw/4nYFHgD3F3r575yT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94d8614-5c97-4ede-08ac-08d93a122a54
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 08:53:14.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPzS1IbT5COpI3HavtD8bwqcK4iMK5FzjvBXMANs0m51ysx7FvCIVojqVj2dE7SW4uz2A7enc43JYKZLx3+neA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 25.06.2021 20:30, Andrew Cooper wrote:
> On 25/06/2021 14:19, Jan Beulich wrote:
>> minfo->p2m_size may have more than 31 significant bits. Change the
>> induction variable to unsigned long, and (largely for signed-ness
>> consistency) a helper variable to unsigned int.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/libs/guest/xg_domain.c
>> +++ b/tools/libs/guest/xg_domain.c
>> @@ -40,7 +40,7 @@ int xc_map_domain_meminfo(xc_interface *
>>      xc_dominfo_t info;
>>      shared_info_any_t *live_shinfo;
>>      xen_capabilities_info_t xen_caps =3D "";
>> -    int i;
>> +    unsigned long i;
>> =20
>>      /* Only be initialized once */
>>      if ( minfo->pfn_type || minfo->p2m_table )
>> @@ -116,12 +116,12 @@ int xc_map_domain_meminfo(xc_interface *
>>      /* Retrieve PFN types in batches */
>>      for ( i =3D 0; i < minfo->p2m_size ; i+=3D1024 )
>>      {
>> -        int count =3D ((minfo->p2m_size - i ) > 1024 ) ?
>> -                        1024: (minfo->p2m_size - i);
>> +        unsigned int count =3D ((minfo->p2m_size - i) > 1024) ?
>> +                             1024 : (minfo->p2m_size - i);
>=20
> min().

min() using 1024UL or MIN()? (I'll use the former unless you tell
me otherwise.)

> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> This whole infrastructure is almost abandoned, and broken.=C2=A0 Its used=
 by
> xen-mfndump (debugging only) and xen-hptool mem-offline.
>=20
> The mem-offline functionally cannot possibly work usefully.=C2=A0 It is P=
V
> only, despite not having an HVM check, and in particular reads the dead
> page in an attempt to restore the contents elsewhere.=C2=A0 There is also=
 no
> thought given to writes from outside sources, such as DMA from
> passthrough or a different dom0 foreign mapping.
>=20
> This is perhaps ok as an academic demonstration of "can I shuffle memory
> behind an alive VM in ideal circumstances", but will be killed by the
> dom0 kernel if you ever try running it to resolve a real memory error on
> a VM, because there is no possibility of recovering the data.
>=20
> The mem-offline functionality needs deleting.=C2=A0 It isn't production
> ready, and can't credibly be made so.

I definitely agree; I'm merely trying to address an anomaly found
while auditing the code for certain properties, without any claim
that afterwards any of this would really work.

Jan


