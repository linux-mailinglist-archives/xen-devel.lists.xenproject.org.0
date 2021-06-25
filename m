Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA93B3CC2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 08:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147049.270779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfUj-0001aM-2l; Fri, 25 Jun 2021 06:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147049.270779; Fri, 25 Jun 2021 06:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfUi-0001YX-UV; Fri, 25 Jun 2021 06:39:16 +0000
Received: by outflank-mailman (input) for mailman id 147049;
 Fri, 25 Jun 2021 06:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwfUh-0001YR-6Y
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 06:39:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6d189c2-ca96-4d83-ba7b-295bdbe775ee;
 Fri, 25 Jun 2021 06:39:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-35ROH1ogOmec7bDTHYf1_Q-1; Fri, 25 Jun 2021 08:39:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 06:39:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 06:39:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0101CA0063.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 06:39:02 +0000
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
X-Inumbo-ID: e6d189c2-ca96-4d83-ba7b-295bdbe775ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624603152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C27HCT7qP3/9WkHoI0KFDxZj95G5b6p72VWx7cvBcfA=;
	b=T45p517+W7H6t7PyctctKBc7Nfcap0201jsicoKROnVfdkcmB+sQ2Dg6wIJ7Nno5u2kKSq
	Uzv1tWgkH/EGvZbWoorCs7+QSQYAdM7de3SawHbejBAkM7q+HlFYwPlUzKscQXCjvBsGQX
	Z5FvhTCIdoQpv9PaqjU3h1B9O5/+WX0=
X-MC-Unique: 35ROH1ogOmec7bDTHYf1_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZDxlYapZIuCWoM73HK/OAFo+y5oX+H61x50/twog2bM/2p0GqB8oSlEWeBu0WTDtgcy7TbsVCZAuzKXIek8APuiphQcORKhlSy+Y1iDdp1ffeA0edMWbJX6OVt9rxP47CZ+SnW0tKMhBVrSnt0gnZcJrbIQ8G0O0gN5mBvnQiOsb+gLsesXfuqGwUZEO6FssHCMWoS6H7Mqm2RfzHY/XglYmtwYfP3TkanwxIUgYJyXlzfD4GNCj2JV6qaduI44XPOgxT+wyJCa+hEOZrjZaLvyXNtDh6WiauTLOtByai14O/cXJfLimmSjOMUHTqNVgFYkbqoCSRJ7zb+Uq4oW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3NN8DJ1vbxsCEj/kT4Qz5nhn1HnG55SPfFdvSNWPGw=;
 b=W1ZZEN4KbqAgNLKgIcxO+y+vCTyNdfZmZL4HZNJd3wz9VeLKpbrkNNNCcznGsjVlS63CrkGMrLUb3eKgkyihgILBGlnN0QniCY3FJoaX7tjDECyxYQyaUiOPqiAo+70f9xL8xBAyPugpDrWVt7xPI4f2czGxVYZV4ulOoZo0oHH38bdyMxyFRe9w086q6D4Uel2Rug/nz1/yOccPJo8SaH5bwpqf61vjgJMn76XKORwWSS01hMhFx23epI3q2WuUj31FMD5G2yCg0TXSCP+on9E/I4BIOD5kC+WowUI/7o2RWZ93ZHyMglP/FOgNq97oC0osGdnJ9gqqZRFeeuSRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <a8d60866-b9d9-8a76-3acc-703799b204b6@citrix.com>
 <3df8648d-f706-9684-4e6d-9438dc9f0894@apertussolutions.com>
 <ca65acbc-c57c-6056-7abd-299ce5ccd643@suse.com>
 <9be51dc7-2534-64c9-30dd-06eddc5702ba@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <942cdfc9-9a6a-1ea6-330c-77fcb01cfab4@suse.com>
Date: Fri, 25 Jun 2021 08:39:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9be51dc7-2534-64c9-30dd-06eddc5702ba@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0101CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cd77e8f-e77a-4885-12ad-08d937a3ec7e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173789E7D0A8B921BD51B30B3069@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wqKH8CEv2VUpLf6cqhf2kpm4UuMNTUut0ZLnafFlczPQLpaJVz/pe+xbIXZL1FeaOJaVs2QKVxVkL86jF/E+VU9ksVbwLkYUUCcFy+HOzQWnjZk8nPW/4QAEOVoaczbW4x4AVLtLP/VJhOguO8iwJh16RRCPScMVZfXUzjxVQ2/iIOB8hYpptwIG7mYVfDsjVWVxBG29nCNfH05WaKqxXmZYnDBJrivZ7aJsUhf8989/3vSWf7hZS6ZGCVH8SFZpC2JX0wsxCXWWuY7Qfaw/t6NuIXlUYCOXClFOSUV1bnKhLfHMX4q9fcE/nzMU3Z+vXYzxvMQVRw0tQY0AmdE2maTsQWMGXIOVmuWD2eqFbowoth0qS3oiUCGmWOXTU7duvFTgM33Xk93wRaQdFENRzxjfoudcLA0qVSNy1wknZGUGrDnxaRL8PukaBj48x8AaR81wvgJrutyZquOpIJscewvN20vXSwhNCZwsmLSJToEdclER/HJqHh1HVib1+yuyOdxmKDGyOnElthksG8/7HvLhGWe3av1xe02HcqBlZpBemG8ie8TW8TjQmoWPGERfZVh3BuLPPLefl6VbwGpVsOipCN1vEHcpD8gAMWVz+ngCVKCZVS/iyL0hDPnCH2m88T02xdnhzbn4gS0JiPkT3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(376002)(136003)(39860400002)(2906002)(478600001)(66946007)(5660300002)(7416002)(6916009)(2616005)(956004)(8936002)(8676002)(83380400001)(36756003)(31696002)(86362001)(54906003)(16526019)(26005)(186003)(38100700002)(16576012)(316002)(6486002)(66556008)(66476007)(4326008)(53546011)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?89a1Gz86fCyfkjeeirC/CTWLXrPf5KKpwnn/Ep5aARZuK6vLfr83aFsWeFzP?=
 =?us-ascii?Q?+QHDZqe+H/j13ePBEDusU+TbICuMIFMMpo8yd0KTPtY/Fy/NRNxoNciuZ4IG?=
 =?us-ascii?Q?kbYG+GsP2mHU6EUzrOcAbvcAeQe9S0MhtaG9m/pxCDgvFPEncMjEwE362Z9f?=
 =?us-ascii?Q?MMoouqLZWo66e2LkZ7Oc6RCFpzk7qhQ5JpTEvY2i+6G0jZvFthdHKzW1ze4H?=
 =?us-ascii?Q?aI62eF5GAVH5KbHnv0ZtB8gaIQxICZfxeQyq6cePxKSqdK2emn/QSXZV47zE?=
 =?us-ascii?Q?jyrNr7N7OGbYlpnruIPS5KEjupENRbUDFMEya5EdqJSmOd8ToF2MRDrhGoDa?=
 =?us-ascii?Q?SVQ9WE7vk2d4IiV2UdzfTou4PaWr44MzorkgS3nStLY7F1upHwimA00jY7Oa?=
 =?us-ascii?Q?aia+rjrzswCZxo04aARiriIXnMsVr21HfdeTmTKM5HijjytKlQZFcUzhsMPU?=
 =?us-ascii?Q?bidFwLCyntXGWWGZgy3VC1i3n2xYIu9ZAsRou4mGUDg+la43EEenhvn+q5C/?=
 =?us-ascii?Q?qATZ204NIKyPdVvyFT2rMg68mXDneTX4lmdK2E02ivzGiB58NaxrJEGlbACl?=
 =?us-ascii?Q?jTL8arMucEisgn8CqOgf3u20rulER0Dk6ABRkXcmrbBmNbGaGtSIkUduBK1V?=
 =?us-ascii?Q?yikwwA77zSFBxguYk/T2hkVycn19oF2ciuANpikLv1N/iNNaEGUvoUAcW8bC?=
 =?us-ascii?Q?ASBo0quIuaFb/jQjrDQiDx/2zEHGeCH0Usrbl41s0T2H7cIh41YtMNO4NG+i?=
 =?us-ascii?Q?kfWNbn7SnOLVPSvH5EPddutdzcPxruU1g5y8gQPdENWyVsGZR8nCsCDkKGhc?=
 =?us-ascii?Q?EI/vjwQydrFJ1Trbrg40Tmsr4pF4s357DQw0ipMs5lDbuBR3nAHikxLZngAd?=
 =?us-ascii?Q?iRAraNKMM4lgQnBD4mw2uOkv4JftDkqbKqFrCYRhPl2HbR+ydPFGNHE0VZtx?=
 =?us-ascii?Q?OQEFIQY/dWnAmYtZcA4TwFz52hT1L03ljo4XMgnTYJ9P+juwvVwZ+HaSE6if?=
 =?us-ascii?Q?DHTbBIqDQCCeeKIUrIKNimF0DUeMV/vEdiQuQ1lj1TKxncDG49ro8EgwP6Hp?=
 =?us-ascii?Q?TslaZtB8m0qQGHBP0wunS+t+LUgECg9LxdBwNHOnACLS46ETEjvQpUtNEr+W?=
 =?us-ascii?Q?PqCIYZTspyfTM4IMeWsVAZydDJ0xxblfPBxrJgH4SgTD243n0DVLIoiU4HIz?=
 =?us-ascii?Q?Rx2SA/rcFcKvkYYA3DyK1kBoX1Kad0gnIr23xkS9CCnxlQt47gtAvv1GRcLc?=
 =?us-ascii?Q?YhznmCPh9X2xzmEUn6fjew2SuWReOs1KlGEaQ0wRbjlh7roEnvIzwz6mrXKp?=
 =?us-ascii?Q?+WkVEblfekBTt43VzCZ0BBqz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd77e8f-e77a-4885-12ad-08d937a3ec7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 06:39:03.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/dj1uRiXPlR440lBb5pLd9Gy0jPwx1cO/TrFUpI7gEXV/vuqFsm0+7saSBEpyWeiu4jsKFrVtt4N7lQGybV1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 24.06.2021 19:18, Daniel P. Smith wrote:
>=20
>=20
> On 6/21/21 2:53 AM, Jan Beulich wrote:
>> On 18.06.2021 18:35, Daniel P. Smith wrote:
>>> On 6/18/21 7:53 AM, Andrew Cooper wrote:
>>>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>>>> @@ -250,9 +261,8 @@ config XSM_FLASK_POLICY
>>>>>   	  If unsure, say Y.
>>>>>  =20
>>>>>   config XSM_SILO
>>>>> -	def_bool y
>>>>> +	def_bool n
>>>>
>>>> I'm not sure we want to alter the FLASK/SILO defaults.=C2=A0 SILO in
>>>> particular is mandatory on ARM, and without it, you're in a security
>>>> unsupported configuration.
>>> The intent here is the default is the classic dom0 configuration. What
>>> if I did,
>>>
>>> def bool n
>>> def bool y if ARM
>>
>> Besides it needing to be with the order of the two lines flipped, if
>> Arm requires XSM_SILO, then I think it would better "select" it.
>=20
>=20
> Ack, I realized that as I fixed it for the upcoming v2.
>=20
> Correct me if I am wrong but if you do a "select" that means you are=20
> forcing the user to always have SILO built in, i.e. that makes it so the=
=20
> option cannot be disabled. There may be users who would prefer to only=20
> have Flask enabled on ARM and those users would not be able to turn SILO=
=20
> off.

Yes, you're right. Problem is the (imo) malformed entry, which makes
it that I couldn't see the presence of a prompt anymore in the context
above. Well-formed (imo; I might also say "consistently formatted")
entries with a prompt ought to look like (taking your change into
account already, leaving aside whether that's really what we want)

config XSM_SILO
	bool "SILO support"
	default y if ARM
	default n

Whether "depends" precedes or follows "default" is a less clear cut.

def_bool imo would better be used only for prompt-less entries.

Jan


