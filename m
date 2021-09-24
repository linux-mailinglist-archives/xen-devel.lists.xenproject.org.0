Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0B416D3D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194998.347457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTg6S-0001LY-Uk; Fri, 24 Sep 2021 07:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194998.347457; Fri, 24 Sep 2021 07:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTg6S-0001Iy-R4; Fri, 24 Sep 2021 07:58:40 +0000
Received: by outflank-mailman (input) for mailman id 194998;
 Fri, 24 Sep 2021 07:58:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTg6R-0001IB-0M
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:58:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 103d2369-facb-4a15-a104-53ce3810adc6;
 Fri, 24 Sep 2021 07:58:38 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-6pRkRmivNsSowsppTC6T3Q-1;
 Fri, 24 Sep 2021 09:58:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 07:58:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:58:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Fri, 24 Sep 2021 07:58:32 +0000
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
X-Inumbo-ID: 103d2369-facb-4a15-a104-53ce3810adc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632470317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pK+Y+/VwjWDQFpf/t3v0s+e1dmBUQYS/g1XInHQtIWI=;
	b=KOoZY2z0EKgYzDEnjrOZW22dr6DbR8EbvmoVklXUMqpJv+E6Ur+7h1JmZjtX9w5ozfmEQQ
	UQedrVbWCqjWFSfh5iJglMg5GeJhyqBYfNzZE1xctQ4msMGSexVR70rIwEt6Xz+hcVEd3r
	l50EjRMy4jriEH1u0QMPe70mYizFjbo=
X-MC-Unique: 6pRkRmivNsSowsppTC6T3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtKmmCUOaFx60qajl4bcBdj9HK0zWATu/OGsTmF0kt0RVZxKCThCF8uSEwliTgyiTP+dbwxZIXdlDV8Y2za9oGZlLEpLPvciV2ajw9ACWkLoZkecaVrKGbQJ7PnoFoBWfDMQtnGypYi2kiJLNK2mR8PTsgLHTMcdUynPmuWhbTKx3ZjqEVTohcC4znVBeTb/Ns0vs+cwn6jX3kni8OD+7NE/FxNEH8sr0J1tQI54/Ue43uTc1ipj2u0vDXEyCYURd/fsFUroI5YWQcVHyGH934v1osLnjAJ8gtFoFik75VyCI1A4YcPKC3oA2jiuooqWI6dg3dyOSEJnq+8SoheZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ndh2/WkbZIVBkTWBYx/Nsdae6UJSf66kgIISO2ix5KQ=;
 b=H8Ez8OyoDl3NAleGMBeux8Nd8Yuc008erM5Yqu8ST9mru/6SbAGmPGjlFqI6S0kp4ZMPdUT3qaf2/KGcUYQxSYr/qFVedzsPv63kr8yEuY3grQTE45TcM054B9005RZ46IixfyO0Uloid7MdxQ/2bo37HPjbe3f9WLIobREGea4NYCbxVEVsUhYJkZIBEm7PfRrlJEO+s2M2kSD15wIRIctUzq5CEcvbnpNbXopoZQaUFtqYabgP1NgU1F6y4DLrTVlUfXTIE2tzcCC1doY8eZEc37MljoIUDdKzwTAp/EsjJPfH73A7m75cWVXxa2FtGkHKHIS1uq4Ef57qODSIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
To: Wei Chen <Wei.Chen@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
Date: Fri, 24 Sep 2021 09:58:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511ea431-5174-4c62-1a5d-08d97f311aeb
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB32958D42449EF77F63FB25E7B3A49@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dFefmsN6ZyBRFFDXMjHjQ9ALnwmLLV0iOJZxqLUaQAAj+lBQaKFuPiXxMP+JN4GsDeVhn+eP4eJXiKge9Kty9aZN9JhlBZfjpkFv6jzQyjf9nnJPTYWXOrlWMNjkKI99Uypu1nUr2SDrm6mOGExmgCF0P653HqpHCxwOqtA+eEsOR6OiRRwtoxwbLHaGW/7Jq/4rtuJNO3KhGDn8jFeEleih3OVzdD07+thf575Oc2MDBZCjORAM9itZZyRsAHAOQ0joffpyp6867ZwIjPKGw5kA93sxSer2lUdRrrpoCu0ZD/k9bShV9Ao+QWoCYezGpeapcYEac96/wJRoMG6zAAaINrlyZYeecnibf1MbqElEvqUj80XHCehIY3h6qU4WpGamu88iyJkF+klXggT4XWUApLHi77DnvV3Vs2Q750yXJLYt4i0Xk7Qjppn7GzsN5HrOriZ4y0Q6uhyPKQTYh6Uu3oruYriVVgjKCDqqu3ywxlcTWnz13SbwbV2Kw2qiopsZRKr5rXKPa/yDbJ8fh5sHiVpSawN6bpHjanYU7WMjinIMSAmX3oO5c0AErGgn8XRFDsR5u4aJKFCUlfr5vukRSJ5BrVC0JfVnaNVNvUXhkqwh0Yom/7dNFhbdNc1K6Kc3xDHOLWqhQGiC3d09z48qRZbIEtruWyxxODJ/0QUsJT8kfVpjgyUAuaD/QideFFvlBIffLYcvmHmqFziADyaiFNhACAzVIrcH62h7/5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(16576012)(316002)(5660300002)(8936002)(66476007)(2906002)(83380400001)(4326008)(66946007)(86362001)(36756003)(6486002)(508600001)(31686004)(26005)(53546011)(956004)(2616005)(38100700002)(8676002)(31696002)(4744005)(54906003)(186003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jMfrNL2jckKkxJ6gasHEpSNIaK6h1A/ptgCKEyCu0rdtRqDSmEwsn130OaTo?=
 =?us-ascii?Q?V0p5kViNiJN3GbQ4yfIuT70rCnbF+kf+X75a4bQkDGdJCvTk+RaPAFkyNHEF?=
 =?us-ascii?Q?q3Mogx0V5BmBNPGJiygTlQhl/l+JKLrQyQK8ja4VDe9X5aKyjLaaWiJ1PgmW?=
 =?us-ascii?Q?MhOg2KI/cRr2S1V0wUbBfi5MfO09YIImBfrgDSQy9bE7WiZhWoZ14JwSpV4V?=
 =?us-ascii?Q?qQ0DMpGfcxPYwfjtZG8BCKpbGnFQDyyk4MK1Gsx1A3P8VJl4wix++x2F/wW0?=
 =?us-ascii?Q?0f8cdf54AyHqqhlbSHbxlhiVlOGlOgkp0aKF4DvfiSZ1qkz9WFpQSJgdH298?=
 =?us-ascii?Q?IR0pi/TZiROkdcKXyAWxwsKn3UkE0FG36jYs1n5SEd1Hk/HLG0spoXNvfvm0?=
 =?us-ascii?Q?MWWWUgxXeDrc1463OY4jF1WWqD0gQqguRKUzIlRLz8Ce6BaVTw0AtRkyQ4wb?=
 =?us-ascii?Q?2aAEfqd/voAEziY+oyKvUZjJ0r9qx+jP38q2T7EcgJqxiKAa4OzBwkp64ore?=
 =?us-ascii?Q?2y31ZbBxXQlelGNuzhzGwP4cFWhs3agM9FfOYdYlaN2Y+zIpu/qzFvex4jty?=
 =?us-ascii?Q?cQVABG5aBNY/a7bdef9bA6cijbT2aj4fbS2vaG6FHPBLqM4gCD/Wf8c1SUr2?=
 =?us-ascii?Q?y+rfmJZyX0Fz3IxwxI51KvfH9IfblrnQEI+1GDaUxsIdhCDUbYlUUKAeaqwt?=
 =?us-ascii?Q?pGF97DPdHELhwIiMhHwO7tc6rMCyOSXiYKlPlKBMQg+4zxrXtMOjtl/nL6wg?=
 =?us-ascii?Q?GGtKRxsOinTwHtlkiTEzMraFp2AnX7b7dj0SuGEaFczj6VATuCWM3rrLvn9Z?=
 =?us-ascii?Q?TljLylnsl2nUuYDJQsR3MPLXiMPwMALgIerlohzGGkIHd7d1ZuCBJANI9XTg?=
 =?us-ascii?Q?3hHFv4X9G2tbsDv03xcHoVUoq4loUBw9J3Zc2QBa0y16bM0nbxx/IfrPDyho?=
 =?us-ascii?Q?75vf2kXxPwQw0g3XN765SufTSPxnCrGxj5b6xrkFDSz/+1Utrz8EbC8p+D2c?=
 =?us-ascii?Q?PYZWfOBQH88ffNUIiItOxncg9gjNINhO3/QQdqyUyf8ig5v/nNRJ0PievGy1?=
 =?us-ascii?Q?VNarPuFPGnzwbZJphBlZU3sR4lsWkhW4xFvfTGX12i+ic5igYQg1JqV4LcyP?=
 =?us-ascii?Q?2gatgPPEpDEod80HdBNs1sMAHFJOJ5/nFH5As72HSJQAc3QxUnNUgeyb1Uxk?=
 =?us-ascii?Q?bQ0LTEBH1mPW/KhlBisQSLTtUObi6sIboA46wn6DpTbJO/aXjDGjprU+HxbY?=
 =?us-ascii?Q?kf450BypGOUS6j/NUUVKc3U/nRCRiZmMSoJZgrHUBkMVJmWTI7WDZ8PSjEzx?=
 =?us-ascii?Q?RR/Ijb1VV7qfGiz0Ct5hKJ+x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511ea431-5174-4c62-1a5d-08d97f311aeb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:58:33.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uzw6eMSV+IuxQX9TYEegC7fQoJM2QOL2Lf44cfAWA3mH9vW1rUkrzhHA3D+jfiiox2OJf+NBNI0Ycvg69P9pEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 24.09.2021 06:34, Wei Chen wrote:
>> From: Stefano Stabellini <sstabellini@kernel.org>
>> Sent: 2021=C4=EA9=D4=C224=C8=D5 9:15
>>
>> On Thu, 23 Sep 2021, Wei Chen wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -11,6 +11,16 @@ config COMPAT
>>>  config CORE_PARKING
>>>  	bool
>>>
>>> +config EFI
>>> +	bool
>>
>> Without the title the option is not user-selectable (or de-selectable).
>> So the help message below can never be seen.
>>
>> Either add a title, e.g.:
>>
>> bool "EFI support"
>>
>> Or fully make the option a silent option by removing the help text.
>=20
> OK, in current Xen code, EFI is unconditionally compiled. Before
> we change related code, I prefer to remove the help text.

But that's not true: At least on x86 EFI gets compiled depending on
tool chain capabilities. Ultimately we may indeed want a user
selectable option here, but until then I'm afraid having this option
at all may be misleading on x86.

Jan


