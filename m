Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7703A9546
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 10:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142788.263371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltRDp-0000Tc-38; Wed, 16 Jun 2021 08:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142788.263371; Wed, 16 Jun 2021 08:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltRDo-0000RX-Ur; Wed, 16 Jun 2021 08:48:28 +0000
Received: by outflank-mailman (input) for mailman id 142788;
 Wed, 16 Jun 2021 08:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltRDn-0000RR-Ay
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 08:48:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06ff9c3f-b992-412f-8cff-7411d05fa289;
 Wed, 16 Jun 2021 08:48:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-SFWEWEdiO5iJiGe-QcSyYA-1; Wed, 16 Jun 2021 10:48:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6669.eurprd04.prod.outlook.com (2603:10a6:803:125::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 08:48:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 08:48:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0101.eurprd06.prod.outlook.com (2603:10a6:208:fa::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 08:48:21 +0000
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
X-Inumbo-ID: 06ff9c3f-b992-412f-8cff-7411d05fa289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623833305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtDY/q4ql3JvXVo+L74NaHVybmOZeuTtX/csX77Q1hs=;
	b=QabxUPVGNPhkoXGjvyy92BTDYbU/DKi91Iz4/HKiK1EZPYLgB9papecnYIITWyDLziWBHm
	WDE36HnPG3xmcpqv83DUNENMLALuI0gcTqU6BR7/mv2/sV1BlO4sPt+p6YI/fX8oet/v9j
	6jEz38Xhk0+gPWA9RSj9tuj4G4Yi1sU=
X-MC-Unique: SFWEWEdiO5iJiGe-QcSyYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bsf2i7RQ3RWxu9A0y8h1JKZpdhXzl8ysEQONab9HI0EMGqD2aoPL5aXKiQu3Dm9Wu+PYhRDnSwHg5AsQUe1Nby1rsBNaY+2TEgYvCgD1SL40/ji9NaqRifqlx0qpquDIFkKhUQQyX7VGDhbWcCzY/4S4nkyhuLhDLTzuMJtmVbva3r7cvTOltXfqhBUi/xCVII7Cji06KE6I8RbeP6PVZN9vSk+xOCEt1ON2rsmVmLSvaq+htFIZk7xhOYWYSrsAy2/kEIxqb+7nrRSAK2WHvINlJdsbCWQmnpbKRElR726qv8vdZE9FC5FcWxrIBasYy70mD+pg3YJdbK/fCJfTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BU8vr41YN2FhhIRWUiayrW2+Qt66Ivh/tplXlnIw3I=;
 b=UrasMs+4ULhO6XxnImk88XAD7/SmTPknIbVpBgqs36qZYH+kX8NzpjcYW0P3Wagj+ykDMKxmoj9RnmpFRnbGfaSMLq/9dZwoTsdu25gkQeZzq9jz8wnqiIiAzwsW7M5d59iomcYnVbz0MuVLygQD4wdBxjYRFuxTjlPy+Xt5933Eel3ACdsib4nkrm5npQnAZa2I7hrrlRoEPhDN4VUUqiNxcwjlz7YbcErUyVHlyxb3/COImmo2ccWp9lsVf1hugpI5CAFSvhXaLZLF31DwpAsd4sQxySU6O7Ei4PQgxlgTVVpEo26tNgaZ8S1velsmz6YbauHzvePsotu2v96ZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
CC: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, "committers@xenproject.org"
 <committers@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com>
Date: Wed, 16 Jun 2021 10:48:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5042a44-dd51-46c7-4a83-08d930a37f24
X-MS-TrafficTypeDiagnostic: VE1PR04MB6669:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6669639C42233037024EC181B30F9@VE1PR04MB6669.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ByYUcZfkN/xbNeXIypST6Xkxo8+t9qMbJNM1JQKvu+MNmB2/bCTRDVemq1MJI4IsIcjEpswf8BU0IaZRoxYPDD/e1Wqgbat/eRZJWoZgl/gpCvfyr/L447HZ2yrwI6lyCfRZiWeszNK1g5e367hd5ZKJXjDYgzkrfjsounavXxv/mCTUdQPeVWhhlgSE0lX3J3U8SeZLo945sQJ3qp6WWtsINiW/M0qMmRofGx+/9Pps2VfuRC8ycUBlijnMlI5iPxrn3PiSAFAjyj1ShpxbIuzslPJ/Uc1HcVqqOdmUw2aTSVLP87o2irFUtXuwsCy5uY1uMMx3Al1so80D5jR0RWKAKVnbG1VAGUAmJ5/nyJqqNl7pmEYHV7+fypoUe4Kjo7BlWMGi2lAMusCGOja7vCeVoXpVy20ATN9wPD0A+hANqW7K6tS6rZasQE6eEV2pvsmUe6/r+w0XpEA/YfyZIVvOIIJHm9UUPq1SvTbuwY2VHBGmYYGMffHAYia7Y1u5078KbagZS4h2vPpjV19eBRAyuKHImTQtR6/AoRKLuME+jWX9A7cnineV5fyk39ZVlNvdOFF61hoS3dAxuu8phsRySFCrq3OfOsSnJKYXHSvwz+blVj1yoci2OMOTkfhrE/RDI38BhDVH9yQlSjszxqDcG2DW/9xexx8MxIKobZQcYgurJrlZByscYBBnmQfapSyD050oo8dzt1dFWJtCOCCs7x1VL/SIzse56SuEqoIHc3Lp1oUVlVPo//QjpD1VOBmt5iUWXrnbK3SXrH/SHa1mzZ0PfSvbNr3ZjsCYnc2Yo7CXDfiUXqTTC1zWTvjc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39830400003)(366004)(136003)(346002)(26005)(5660300002)(478600001)(31686004)(186003)(966005)(8676002)(6916009)(54906003)(53546011)(2906002)(8936002)(16526019)(66556008)(316002)(6486002)(2616005)(83380400001)(86362001)(16576012)(38100700002)(36756003)(66476007)(66946007)(4326008)(31696002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mmsk0HkCwV0eyDg8u9C36Xe2SX7Zm40FHSFhUqdY1KUAdJ5GEi0YurbJ3Ddp?=
 =?us-ascii?Q?rAx8wGuEWVwiVPpaATjz3z9tuAq7T2x5Hq+krzDk0aK+L0p4WBMLpUzneKOU?=
 =?us-ascii?Q?Tnh7hfAPNuRddpT9KgT+wCQDhEO/h+lE/mUewATrfypTmhyBulr7wMnn4llJ?=
 =?us-ascii?Q?/7oamoIfC1rXTH9vJul3iGrf4hufgq2MCJDEBoZFnexIxZlz8i8rHyERgRge?=
 =?us-ascii?Q?z4jkT8kmxAsprOam0QAMm1E0SHRZPdh3pRVy3zOJ3B5BgMvfJUKCf7EEwmli?=
 =?us-ascii?Q?4w3J34E1z6aRGgM0wpafX3Wvpp3UpxM+Vr4VPeIC2CJo7XW0NLeEchu6MN3q?=
 =?us-ascii?Q?xAokaNY5Lfm27hYRictWhK9F/ZLyhH2f4m5qjvpSpOj9IZqEqFM+y/zXErrh?=
 =?us-ascii?Q?YxulwTtS2Sf8o3v8hh6/MAGe3bTzigWJTaA4PibYGkXJILKBb3vhowugOPoF?=
 =?us-ascii?Q?EyETO90uTu1eRK1YpXqldNUfj9USfspIZdNGogl17XHWTEoWj3j1TZl9EyPA?=
 =?us-ascii?Q?2pq9oZWR/2LyA6FmO3GxNjMfQn60b8+wcn7DVqEzmC38KHb+7FWY4tO+8LEM?=
 =?us-ascii?Q?rTlJ4A/0ypg2TYD550hDyoh3Ys9aiL6R1xcAXcz7sy/fTjqD/RXBaoDRDyM/?=
 =?us-ascii?Q?GNQ9R4MOXOdC9tghTOqKjfsmbQHNgU+WB9p4QcPIer5N1VIJCP0r1fl29MvI?=
 =?us-ascii?Q?kSfrcqLzKN9N2vU/uWpyUWkOgcNJrytmgdvIW8EQ6bCEw5gxvdypETx5RxN8?=
 =?us-ascii?Q?4/NBgzA2jwjAucs0WJmtRTpQ3kLIYzAxTQY6DVfCihyjXJA/VYxP5bL+yha4?=
 =?us-ascii?Q?D5uMqDU+JwI/ARpjtRObRCpEliPJhq/1oXAEefr89ji8Fm0dBJurNGHxiBoO?=
 =?us-ascii?Q?Ojdfg62vAAfqHxMppMtIIJ0RS5stuL7fbCpUvFKHClmYVMjIDPXukinFpFWo?=
 =?us-ascii?Q?WNI9Xhr2srf5J8GTotGsJxmcf3V2xIaY/27QgY+6DRQIsl+CsGIVda9OkQ6c?=
 =?us-ascii?Q?iwpnUMRs1h+mS/pJ3dWehwzak8J1y/sOhl0r7ogzwcm53Zc1Q0Idl7kX25/9?=
 =?us-ascii?Q?fT3rs0LvbkoU3WwhIsL9vMLM9CdFnoI9vFgl57+1gjV4QD/w54HtHUGHCWiH?=
 =?us-ascii?Q?/TArvYM9s1YMPP5Y0vyE8C3CFPZx6ifJKxRh3vrb9qBzjT5uqDEnWVSt3gfI?=
 =?us-ascii?Q?kbUn+UqXoeGJY9srUGrJACTQiWiGzVBWvOv7BktTBzQZ4kzltIMsPp73fQIO?=
 =?us-ascii?Q?EzaiKDajDLXt34H2R1cY/XFzsHehhH61gXf5NLZC/tFXaOcLD4iHwybRwnWo?=
 =?us-ascii?Q?0I9Fvl0Yax3+ZTbgm6FXPpAX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5042a44-dd51-46c7-4a83-08d930a37f24
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 08:48:22.1412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBt12K8/5jr8E1PjyNbIJrNV7yC1LCWPFMqRTvrdEIC5hi3kvSYTE+Q7kSc0lZSDfP4UNtkM7mOSy35eKkcfSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669

On 13.05.2021 22:15, Andrew Cooper wrote:
> On 13/05/2021 04:56, osstest service owner wrote:
>> flight 161917 xen-unstable real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/161917/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs.=
 161898
>>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs.=
 161898
>>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs.=
 161898
>>  test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs.=
 161898
>>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs.=
 161898
>=20
> I reported these on IRC, and Julien/Stefano have already committed a fix.
>=20
>> Tests which are failing intermittently (not blocking):
>>  test-xtf-amd64-amd64-3 92 xtf/test-pv32pae-xsa-286 fail in 161909 pass =
in 161917
>=20
> While noticing the ARM issue above, I also spotted this one by chance.=C2=
=A0
> There are two issues.
>=20
> First, I have reverted bed7e6cad30 and edcfce55917.=C2=A0 The XTF test is
> correct, and they really do reintroduce XSA-286.=C2=A0 It is a miracle of
> timing that we don't need an XSA/CVE against Xen 4.15.

As expressed at the time already, I view this reverting you did, without
there being any emergency and without you having gathered any acks or
allowed for objections, as overstepping your competencies. I did post a
patch to the XTF test, which I believe is wrong, without having had any
feedback there either. Unless I hear back by the end of this week with
substantial arguments of why I am wrong (which would need to also cover
the fact that an issue was found with 32-bit PAE only, in turn supporting
my view on the overall state), I intend to revert your revert early next
week.

Jan


