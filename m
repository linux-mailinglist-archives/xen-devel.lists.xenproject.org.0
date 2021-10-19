Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BACE4336E0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213225.371388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcp2b-0000cY-44; Tue, 19 Oct 2021 13:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213225.371388; Tue, 19 Oct 2021 13:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcp2b-0000a3-0m; Tue, 19 Oct 2021 13:20:29 +0000
Received: by outflank-mailman (input) for mailman id 213225;
 Tue, 19 Oct 2021 13:20:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcp2Z-0000Zx-Fi
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:20:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 525b3830-30df-11ec-8313-12813bfff9fa;
 Tue, 19 Oct 2021 13:20:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-IYXunq93N2etaY-fAUdzRw-2; Tue, 19 Oct 2021 15:20:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 13:20:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 13:20:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0091.eurprd06.prod.outlook.com (2603:10a6:20b:465::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 13:20:22 +0000
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
X-Inumbo-ID: 525b3830-30df-11ec-8313-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634649625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1h4maGXK48vgXp4lYGtQey0mQW8k7m+IrOltVj37+W0=;
	b=a3zzZz1q+blw2NAC5SpbIqL2zfAU9vrDJOvrc6BmvcH/kcS4BrAVmp71jCmRizUh2RfOCA
	1MKaeZ+9tmwQOW12YgJsfC37MWjYEjumffLUwnx8bYf2MFzEZXPzCmm3YdcQgNz/SGFH13
	LORPEEw2/h8+Y0H00sI04vkFeccyBO4=
X-MC-Unique: IYXunq93N2etaY-fAUdzRw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAQ/NOvJq1CkUjEogxgRGiqWoIkgJjzEMC1PpuURZ7PQ+qV5R/f4ujtgzSzk2Xjvu4uB4JutCvHTWaSSHQ4X4lFpokgusCe1Ugbha1ihAGnGDaT9YFUJ14gSZ/vZpCVBkj9zXsvMfNb4OBrH3rUg/InfZb7wH8QpFV0xtFqbJWD9317c7N9VP+MHlSPWUDU0TGLj+JgZLDoREjt6ld6c8nrqQYi/Tv/nfljXD4XavByBqq17tmIzIpu0h+aEezdE9YnCzu/leJ/3GpIAmbRygmwfQH+Cjc3aw1eeb7ns2OHy8VVbCfpPihjwY/wKD9oxkQ7JI6NWGWyeWJRSus/qgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwTV0RjdCW/IzWacBhTscGwXs8PtG7Jla/xu8yPl6x4=;
 b=FrAVaVsQNMvqgdawFt1+IznEtzXvG/jhSymS7EU71kOGqwWJNWufMI/X7GfYhcriIuRkJ8CTRXEPDu3FQa4ODGeHxenDuQX7e0wGGekKXEyMktf4EZn2f5bgXtZ1F01U5h2mTkTsOodKRIs7NkpQFPcplSorIxGuuB8OQV4vf2fTDwbFTnyehQyNAyj5yQf4cRTl3uMr7UKaZf98dkxuwEtug31jcNg9oz9rdisfNuq33odysk1Fsn40NT5DZB7QhtglkLkvXphSnsCzNb6GkB7LphcywfBHXKDkGOA4wa9sg9kLch9KFS7NVemcbFt/F/hgn8lrU6MhpCBU62iw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/3] xen/vpci: Remove __hwdom_init for vpci_add_handlers
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, iwj@xenproject.org,
 sstabellini@kernel.org, Oleksandr_Andrushchenko@epam.com,
 xen-devel@lists.xenproject.org
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <33b03be7eeea521953790542eb31d5a1386d2b81.1634639117.git.bertrand.marquis@arm.com>
 <116f5313-f2a3-376b-a0a3-af0d14d82125@suse.com>
 <YW7FXibf4DRS2TPa@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <317a8a4b-379d-16f3-12e1-116a8a2448f5@suse.com>
Date: Tue, 19 Oct 2021 15:20:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW7FXibf4DRS2TPa@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0091.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d594bceb-e939-4bc2-ac2e-08d9930334dd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB56000A1664ECA54377342F25B3BD9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mZ50PwMv4KcuMWxcfL+HYWH4katfSHVL06VKjMlOt/08V18fQQYPemQg+sr+31vx2nrlFByKrngiXjOT5ktxny7p+iC1fNYsG2iOAhjnra/k8dLum/0NJTTtjHYlMl8CYY0iLcR2uJVwgVQdVa0XUxS/auv4Xyl9EsDnifa+D/LWP+Uw+0tUkRSIrZFE2zWLOpIvj7f6ZSVMFQuM/WjDp8BfhuPjsVYhQYwem4PEc+qlWHT9Ec1W+NZkdXy/CTH/L9cGVA7ulNO07aqj7eNUQHLokY7y4hGIv0CnHpY/qrc4Tp8qRYcAjqDR8ZCDA/LluuJnu3KrIybt58VUjl6SHxb6IGcQPgrB/z5qIO6XTsPehGUqZ1apefxy7u+lvAmBqJNkBMCUVQQQ8QLzb14Qs33mV4k+g7LvUtolId4uDSLH9hCAxflEF0JuskUVVUHKsTf8oVvQIP8M/+QwvfD/arwHFteNAnVDK9aDDCo257rD7x/AUQXqmWXSGmPuIc7jcljl2SuC5wV2EEEMOenk90/dN5B4JHUkz7xCBqimTIfyd7l8oiXKbJshCaJkrdlGG2muomUcK/OKvHZ3TfUs6jQtJqh3kLdMuxhfbsWRGAY6UTfSFEzNE0ATCtaBWvffMfqHyh4JGdLpnxxKLJABG/H2FlreSVo/6Of8Pw0UexBXo2Q/3lUoUcWt5rmwdBKE5HRA4BmH4ZrJSYc3WdmgdiS52/il1r+oOksmwGavbXXGnXDlUfbe+zkA3YBetsY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(508600001)(6486002)(53546011)(4326008)(38100700002)(36756003)(6916009)(31686004)(66556008)(66946007)(8676002)(5660300002)(26005)(316002)(2906002)(2616005)(66476007)(186003)(956004)(86362001)(31696002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S0h21sR5kQpdmBQQ/cIsrnDBuNQAJS2AKBuWtovQ451Yjl/JC8NlOmRtbB/f?=
 =?us-ascii?Q?eWj+KsRjHUKCDxoWrk1v9xLzY1iCOveMO8Z3qHAy+OvDOIvUW8cGjgRQlA6Y?=
 =?us-ascii?Q?7m0q3YvoPXd/cgsbs34HHWQmduNqYdThr7IXuLfEEowuKUM1hI2l91RDy87H?=
 =?us-ascii?Q?7pUGoPsXgxIb5SRa79I3mOPfSodlVG6wG+V8YZFQZActubEdq8/ae47gxjDQ?=
 =?us-ascii?Q?2SmsV8qtvuFSmBZUuAvvsIS4TLuw62U2IfTW8J9ads3YhrqGy62hsYq1jPGn?=
 =?us-ascii?Q?d4bjX0t8ghuXX6NeJKPwl6t4EUsSg9MwJeDWHGPLGO0bSyw/IILR6L+WG8SC?=
 =?us-ascii?Q?/NYXUA834/B5Kh8aHlh/XsJ6RRAMxySEq+ZKXZUaRXtaIGsACDWZOw7lHhjO?=
 =?us-ascii?Q?q+cBP9ev5X1SdAEvzF8/t/NmIu3xF74wrxOeEOxJ7Qf0AfiC+u81BESWbl0S?=
 =?us-ascii?Q?+RSQ8BkL6ogLnEIkdtGVLpUJsCi6EanD98WgzlEV/IBIaQxO3qLOKxoQ7hrh?=
 =?us-ascii?Q?6nJ9c1buiKcR5bZnVamEmL5ZBfwMFNuXsoFT3N681AWkXoNDybqLOBLMEPJb?=
 =?us-ascii?Q?sWUfChUa0wG6Vf6G7cUCLOVHJJgV3/CLTxpXgkZH3EOk+xo6MSVeCuEefoly?=
 =?us-ascii?Q?nI5yMUr2kmUOa8YUmye0/T92LwB6cnH/U2r8EWQFYcci9Om6nXA9hF4uwX0d?=
 =?us-ascii?Q?cpGsMFUXRwfeenzb+3zq792cXSHMOYwjsINPQq/+MGTMLD53QNGAU4j4W7T1?=
 =?us-ascii?Q?an6cT9EYQLou5gHEpluz3m/gameJfjlANTd0gps5zF+F/UTe58MtWn6bPwof?=
 =?us-ascii?Q?GmOa7QAHOgit7U5XIUxk13Hy2QxYMnxb506SJlJXmhxXhSzS3e+y6xi2LLOq?=
 =?us-ascii?Q?1o6kHxtlDV5YdsOFIusc6wVNR45dJGNwmcJuHKz18vybezoHeGU3XruwSmMH?=
 =?us-ascii?Q?X2vccii2Sg77q4zXVE5hIiioR3tHQgZf3F1s79A6PHi0pQIjCsOABSIC6Xmk?=
 =?us-ascii?Q?nxbdU8XuwMW6Ti2ULCRbotyw/mTaDUy6QAPSZmndfqQUSeonFzevLkLy2Ecx?=
 =?us-ascii?Q?7VxXlZQaciHj+md6xQCH2fWg41bMHbE57LJFxz0YpFbw9Ys6hkrrsKtuYoG6?=
 =?us-ascii?Q?vdi/SwHq5o2PwdFtGMZ3wBIG57wm5pm2ZuwvUKvI5xvnYaa0kjL6JykU/MNT?=
 =?us-ascii?Q?GNETqjm2KGhev53i6XXtBMlDH9ePgLkBiqio/M07VZsR9HxbyR+gTqE50Tjr?=
 =?us-ascii?Q?ch0bg7OIVXxpHok3Yq6l6JnYQadYjKZjknDDfA7sn+B1gr3wibaHD52cH+vy?=
 =?us-ascii?Q?fgUbxwhS6hzvIEFS1GcUYs0N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d594bceb-e939-4bc2-ac2e-08d9930334dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:20:23.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6+rn6mP/APttmrJGCs2cYbwzqDKkfYyC+PtuhotFLcifFKDdxGIko8BrLNQf5fHXKqf+UbfBNG9pabEQ0NO1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 19.10.2021 15:17, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 19, 2021 at 02:39:17PM +0200, Jan Beulich wrote:
>> On 19.10.2021 12:40, Bertrand Marquis wrote:
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -54,7 +54,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>>>      pdev->vpci =3D NULL;
>>>  }
>>> =20
>>> -int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>>> +int vpci_add_handlers(struct pci_dev *pdev)
>>
>> A fundamental requirement when altering section attributes is to
>> also check that all referenced entities are appropriately placed.
>> Afaict this is not the case for __start_vpci_array[], and you'll
>> need to also adjust linker scripts to deal with that.
>=20
> Indeed, we need to just keep the CONFIG_LATE_HWDOM placement in
> .rodata.
>=20
>> Further
>> you'd have to check that all functions referenced by that array
>> aren't __hwdom_init. In taking an example (init_msi()) I'm
>> actually surprised to find it's not marked __hwdom_init. So
>> maybe all is fine as far as these are concerned.
>=20
> My bad, I've forgot to mark the initializers used by
> REGISTER_VPCI_INIT as __hwdom_init. I think there's no need for a
> change there.

Not anymore, indeed. And less code churn now as a result.

Jan


