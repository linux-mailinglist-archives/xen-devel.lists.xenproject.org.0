Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFA49523F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 17:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259145.447091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAaBy-0000Ya-03; Thu, 20 Jan 2022 16:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259145.447091; Thu, 20 Jan 2022 16:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAaBx-0000WS-Sq; Thu, 20 Jan 2022 16:21:41 +0000
Received: by outflank-mailman (input) for mailman id 259145;
 Thu, 20 Jan 2022 16:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAaBw-0000WA-HR
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 16:21:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b3504ce-7a0d-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 17:21:38 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-IbywNPneOIORZLrBgl9YTg-1; Thu, 20 Jan 2022 17:21:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7622.eurprd04.prod.outlook.com (2603:10a6:20b:23f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 16:21:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 16:21:35 +0000
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
X-Inumbo-ID: 0b3504ce-7a0d-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642695698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1kyxbE3vt65j9dBLSAYRnPzipnvFNDL9oOytHGUiw4=;
	b=cbvM7vE7APeKftzyvezcavGGQbVMUx5g0vTKh2IbFpogHHdVk85JFcLG9SYEnY5KHI+TUQ
	IosgvgLgP+2cC/Q/3nEbdZVcm/iI5npYe46tr09gTCYa6XKwYKciiCrrCx+VghfkSNRPWv
	SeN1jWMshY64iiqNe6vv4m2JJ0Al7a0=
X-MC-Unique: IbywNPneOIORZLrBgl9YTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQBe7/EWCKtgBxpku9VNiHjmuy6VCGfZxxx+3nKS6PVwRegS5T9gk4eYyFW0OzdBfuHd4CwnZVMtXA5jJARmvIYuVZLsy6w3EX3cp0XlApIQhHiNj1HHoc8aMlcixOb1HzzIhFHyx2FVn7VIZ1RLzx/YqFyJkIsW8wqcyxuTHmhVhVl7AQDaiH02DU7zIpSIUVToWQzsATzAGhEp9Vq8RsovCONTtiWPQpLVAgAguYzEmkXc1OgPQIAJwfdF634o7xRKhNB03ixNjRxfhAJ3ESyITyZSa7UmlBrjDtDDnabOSA8uy4lxfWftnwDSV1sQ7v4IeLAj1fIF7p2iUGNLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrCBTeVRwjhh07tLu/3BOEPrlF7xXrcDvKfEZW8TW34=;
 b=KHCwOKqUlsunk9uPo2GoXjNR7fK+IkmehMGqxAxoHBRNgMKIj/j2/qafdwVoi5rx4oJCgbf07JndMJ41bCOcq1luf4+EwRYH3EVvJ0sGerOhDmvqiKm66FoSJhZcOdl0ZKIyaZrgWLElsVeKGTtqKioIKTVcR9MQBItJTG03AzuL9OCd2aBRp1wXHQ0UzkbJFiGzScejDG/eGNB2vczr1ueNr5iac2hoNa44n+zlZ5bEVKAdIoSe9+8n1gM/6nWQavTLYdlKHuL+BAgqV99WR4KQYlis+s6hxHq33hGNC/RMdOIeA+/pUgAZ3pc7ml+JAuXagvkJFanO5HWvWRX+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99f6520d-833b-bb90-5f72-f2a888379169@suse.com>
Date: Thu, 20 Jan 2022 17:21:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC v2 5/5] x86/mwait-idle: squash stats update when not
 actually entering C-state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
 <b9270896-efea-3e81-99fb-685fc5b708be@suse.com>
 <YemHNOVyqGwZ7/eC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YemHNOVyqGwZ7/eC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39172286-3c5a-444b-5ef1-08d9dc30ed9a
X-MS-TrafficTypeDiagnostic: AS8PR04MB7622:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7622F718EEA70AAE25832FFEB35A9@AS8PR04MB7622.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	icfi6syGDTZkqAJAeLUpKm+Eq/dFGXslveOOQ6/DePysc2hpC5dP10svpwpRGOGj1BbF38ELlCSUirEJML1qzN8SV4gY3CxxBmdETaFvettDQ20A80Q8hCwA6YbWlOsTOCwx5yNUayRet71QZOj41FGG1jXuMsEjv+FVMKYgkZ0uylg5vg/TsZHQ7DuLn25CJx0/7Upy/2990KF93nDlfbEyZhTQi1W5rVYIw0TYd1u12jtga3BsDhwT0RjpyZAY2+6RDV3lqQbotaX6ZJd5Hr+V6Aj60PVmVvnbtfsLA/UNZO5EGb4iMIU4RmEuZ6eCYiDYFM06qOtjGpc2raEcL7uc53cNjtyWL+gSR/FjBhxuIXXvUS/SqFPGumsYvkatoFI4X0FctQpZi+KNFZ/WR/FVf9sS/kERo/UKm/FAvv6Q60gSyr+v2nMghdVp1GYTrSz3oikZioXgckwjW5J3Wk7P+fRCYEeYOxMN/OXcTf/3t4LQjHcAeckxDJ7DdRwaP1cfltztKJLLCYV359Z0isZNPtloCFHFz0I9PqBda46ZxDKL6ZGxphxTwWK10sFuFX9PumwAT+Le1et8WtBM6EjTPQaNXb/UF+PfAMf69h/Ejmwr7bA+Mller31q89m2AkNClLbKwUmrwbkMrYhF1/PQuAspWijxqAkNL+9O70/ccGeCAkkLt/x4SvKwt73i7rc/dXbq37VkOFW8WKO891DnXOVe8XlBSC5+BqpEZuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(66476007)(31696002)(66946007)(66556008)(6512007)(4744005)(86362001)(26005)(2906002)(38100700002)(31686004)(5660300002)(2616005)(508600001)(53546011)(6506007)(83380400001)(4326008)(8936002)(15650500001)(54906003)(36756003)(6486002)(6916009)(6666004)(8676002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/3cS/QkMMabB8DALUX5HbmXh5rdWmmZYvdmjX9Dz0xg9Ymakqb61CSOPRx6U?=
 =?us-ascii?Q?+jxAhLRcdcgmiTjUtWCDu199gPAiksokMUWO6ZJJu59JTWdMCoFM9SD9UVc0?=
 =?us-ascii?Q?orp9ocm6S9JvH4bt2X6b9G9cE3WUT8dRYpsIHuSGXstbboPRhTNQm/Oc2FoQ?=
 =?us-ascii?Q?3Ws6RSES4hXrei4L5MUwvSa+bNdKCfkRz7GiZvJxyWwHuoJDI/wz8fBDGW4S?=
 =?us-ascii?Q?HFMDzX1Ac7K4OGZUMIf3qqTWwSIOSYdNr2/4N2vxxAqU76DcMfqK9/tK3fYj?=
 =?us-ascii?Q?RJYOjYKvOw7K+Ghl57Z3hFng+QKb4dfc6/WJegOJRJAF2NaJSpZUX2ATYP+a?=
 =?us-ascii?Q?W4cI4U5CCaVr4VgP8hosXY6NuXvZ03wgtcuC247BitqKrSnAq2WOxJvwANto?=
 =?us-ascii?Q?WJ9UbE7Lnj+aTYX1O/ts1wOfF2pjyX1nDjt3f+XFJAK9xUmJzy/DGNhQpe3F?=
 =?us-ascii?Q?oM6Qn6/tf3nRVKN3OEmq4amZnWTQZ3Xl9sIUV2Qpy6JGReuV1RWKkUTZk1xI?=
 =?us-ascii?Q?QYkbZMPuBajhqVFs+aW0EZjlj1cXBOj/AVDiDLoeiqf1ZpFAEHNH2VfutfRf?=
 =?us-ascii?Q?7GLApFl6hUdGIkFkIiUzPFJyNN1CNETNw/ubuY0QH9tVqJBWbjysUmx6A9XS?=
 =?us-ascii?Q?SxDhDzqKtvi/uemLMkQPZNRoZBroDjj16UZPuwMK5DVcYMpbWdYNV983WeP4?=
 =?us-ascii?Q?38/2wiUdQKmbgAXCC99Tyz3AEAb9pXGkkMyNMgQCfKRpEEkBb3fWDUyfCDVv?=
 =?us-ascii?Q?OldU2WJ8H/41XRyL1ANTWQKGATYJtYBIFmWi+C9LcyY7efPlXGCMZFCnNDhA?=
 =?us-ascii?Q?l/TEL+PL6+difLm3I0r+d/vSkJ6KMSQDrECzcUCbGHE7f8ahdvVBkx/xEphA?=
 =?us-ascii?Q?4MTcTKC5gMrORWU3gOhMS2knGLSq4FhRjydIGWBsPI5UVh8d2XGBWoF0LRza?=
 =?us-ascii?Q?0ZGPIoaWUoIuRfPbl6S815ndrQA/7MM2Y4dQlU5I66+G9vlI5GClq8Yna25O?=
 =?us-ascii?Q?pC+LZr4M3L2yFcURO8yEPNUp1eWLm0GIdNaBoEEdF7PoAqVPH5IJUu4U/VXZ?=
 =?us-ascii?Q?FHHsckBxJPRkph/DX6WCDXoVzKt7Vz+cbxFjLrK83AstJfJnuGP9i5WuoX/0?=
 =?us-ascii?Q?kEH5XKNAfvUIwZYtugPyj2JZ58iWvPozfYafu0ZwNl7G7Mc5jA3lj7UXGbYG?=
 =?us-ascii?Q?ApxDOZM70mLHYf3462QVZRGRCOUqZtacVZtdrIRpAWtNJMcxhU3BQ+x6r3wO?=
 =?us-ascii?Q?kH/5swCGS1PxDgwTPzt4Cl7VZjwf0X6ztZWeKKbF+q9C9UeIdm73kGT8MB9O?=
 =?us-ascii?Q?BCQp8c1Df5Xu26+SejQvVyt2jXkM+jbQDZvqEcgrFOEHup8U20CtAT4V9RhB?=
 =?us-ascii?Q?SJ7l8PX/BSQII7WSTgJreTUhzdHOAZzraV6BzOa1XJspDZIBY1jZvk++7FLg?=
 =?us-ascii?Q?MQqMFXUN0hYv0iffugUganDARHMUjmTarEE+iieqVv+SY8mSgnKGxXP2M3LD?=
 =?us-ascii?Q?4R/JhZ6GgeWinLuLt3ZgO1J6RwGpXOTtb8BzsUs7fPHAFLNNdiNUQky+s6BS?=
 =?us-ascii?Q?qoDvYjf2XuNdCroRuMKiRwgAJHT/PuZl1QeIJr6HuCkAZMfxP71L6lrevzd+?=
 =?us-ascii?Q?Jo1Zn4hrmRgvlQuyXGt/Dxk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39172286-3c5a-444b-5ef1-08d9dc30ed9a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 16:21:35.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbwmRAesPXNYKKoqbd9Z/WsTNayvoGiGkMZfTYw8ftINm3vuYP4SieoNIWoS0w8JkAnW27CbNAyxgeBQJSmQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7622

On 20.01.2022 17:00, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 20, 2022 at 03:05:12PM +0100, Jan Beulich wrote:
>> While we don't want to skip calling update_idle_stats(), arrange for it
>> to not increment the overall time spent in the state we didn't really
>> enter.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: Arguably more of what follows could be moved into the if() -
>>      thoughts?
>=20
> I would move at least the restoring of the TSC, but I would be fine
> with moving everything up to local_irq_enable unless I'm missing
> something.

Yes, that's what I was considering.

> I think you could likely also avoid the call to update_idle_stats so
> there's no need to fetch the new tick count.

No, this call cannot be bypassed. At least not without further
rearrangements elsewhere.

Jan


