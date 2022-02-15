Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C84B697A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272983.468005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvDU-000193-8W; Tue, 15 Feb 2022 10:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272983.468005; Tue, 15 Feb 2022 10:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvDU-00016Z-4w; Tue, 15 Feb 2022 10:37:52 +0000
Received: by outflank-mailman (input) for mailman id 272983;
 Tue, 15 Feb 2022 10:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJvDT-00016T-Ci
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:37:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 526a7a2f-8e4b-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:37:50 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-JgBmfRZeM16V7e8PS496Lg-1; Tue, 15 Feb 2022 11:37:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7273.eurprd04.prod.outlook.com (2603:10a6:102:89::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 15 Feb
 2022 10:37:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 10:37:47 +0000
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
X-Inumbo-ID: 526a7a2f-8e4b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644921469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvPe/8TzSMezKQGJz7riI9NTcryy8w8WsG7xpVK4Q+A=;
	b=Z5dUxVsiyUtMalJziXNYyV76caoyGmx5Je8155kpzfFkB36RyyIDK8PB+6TM8kCa0PO8+2
	oLqUXeTov6X85PrNaMGNR5tk44OcHwQ+IVyTQq2lUZjravDKnOpIOi5pNt7nrEN1BLJsV6
	dJokT7lRVOWNcl5gPcPjxiHN3Mh+/IU=
X-MC-Unique: JgBmfRZeM16V7e8PS496Lg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTZAAIwX7fMi4n6jz5SUy31bQwawseazrN1nK6x+jE7c3+ExQe5+5In+NpEBClhgQQ66ZCDrRsptZHYrUnxRnXSue8GZlHeEMWZ0psz3HD6urwel6qVrZ6gXLiFS7pw8a1WGkg4TBa9zX6OL/lW/q4wLkFAXfVeqZtjWXIIH1m3CHNS4nCqxuA/XbfPw7Qja7K2LbJ2h2u/9OyTtqprPg6NpXak6hxoeHvGLT+agadfoEUG6lEv3WBgPdJ3eYm7Co5VM/5W3MzZVazW/NVXzNZKovugqbBgEPtBHT2LUsTZygTKrhNj7C2Bz/0AB+tNTSmArglbr9vPTNlJoaY6RDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWHDm4fAwdAOKXWCUFrNOk5+vDZiGDKTmavTJpL7dbM=;
 b=kTVvYq6F3HxhVzZ/yWGhRMdCt8y2fK1mES9vFtqLHJAe/3KLTTAtsb3tLNOwkT5++ti4RTzvWqmAvLYP9aa0AgV8Zc+F6rjICaIdXXyDciHhvrxCQGDsy4ujdX7iYkJPr5PhW1R0kuidyoYVysqvneM7GrEOdttIs3LdrxLd89xvLRqPKnWnWiVfS6qM+7buM0ikkf7DXK3xJQA/My1IKafgmu8FjLDX/Ad6thqeyQuReu8/LmLvnmHkzJctG0cqVtrUX/giFJmji70kOl2LQ8qLZYGAjm6MVr0YFo5muZqzNBIIgWBPTL9AqXBKr7/4T71i/cXt0GthqXDXW7BxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8106ab49-c1b2-a2d4-536b-cd0e17c05b3a@suse.com>
Date: Tue, 15 Feb 2022 11:37:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220215093951.97830-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220215093951.97830-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0079.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bc7acf8-a447-4293-b1c0-08d9f06f3506
X-MS-TrafficTypeDiagnostic: PR3PR04MB7273:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB72737FEBE9A5959AB54B0348B3349@PR3PR04MB7273.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TQmaHc6NUaZqjBXwSV+x7p1TYFj3k9ljEdQ2Rt2sX1oTvyp6zkTCWe0AEqlg3mnG1opv+CQEgQbYSU/vcHzUCQAG/wTYh4HZL5CVDUxXT8d0x46BkvxyCokEAYIuYg75MBnJ8y8eq/2wD6IfAmFOVILjrc7O1tZJ3qMBgY2W0Xj9lNSMF7HZrOxu0rcg2wido8GE2dVg53LRXQd2e1pVYoQNw7+hcJFZEwCum78UJu8xzXd0doqvcd7d3Ai6jV/WuMjY+8aeCLuboJH+mnbHHSDvVyU6QLBOYOdgsRh7Zq+mJKFgDiXQ8s92ek6Vrkojxtoja8ZAXV0ywyR+udaEmsIR9JTn/KKQ3KkAXS1MW+R7x8gbc4zlmD6xMi/n2vYbxVg4Rj0bsAcVMThKJVHvhZC54E7FLWGmn3yn9TGLib0LRgV1GZn6Rd7T4pE79VI/TeRG9CRBFfeVWwD/3Ec9tPFns3B5bHcAU2vJryjBYjZ9E7+rDirRATAkyHscRAMTxkV2YQS47m830IWCdfYwPkeSTuUPtv+gyjsfx4dL69Po4+Sd7sGPyL7FiKBRC/2oC6UgVcoBurmH3TBP3nFpkLPecNIfvAip1mFDmdkXghwfqkiuL8FC1Ai5HnMhxqnzwW8ar8tb4sQ0Zr0A/Twn59kpuXkOfcU9Y7rKGr0HgDX05l9V8uz+SacPdHjt7GMOObgCiCUDDhwz8wZE/tUy1Pq4hbyzo43nXYUbR+DDBgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(36756003)(8676002)(6506007)(4326008)(38100700002)(6512007)(26005)(8936002)(4744005)(83380400001)(5660300002)(53546011)(2616005)(54906003)(2906002)(66476007)(508600001)(316002)(66946007)(6486002)(6916009)(31696002)(31686004)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IGU49M+9C8/QdFHlNzdvPCnzibjPT4tkKd9917ANMa3ssjslJk+oNjCOAuzN?=
 =?us-ascii?Q?SrWSG1ZrHJUlJZUcdymlldZpRSc2rFnGrQnzkzWAIESETcC6Z1WLqLy9MbUx?=
 =?us-ascii?Q?Yejp/HX3gtePwdKn3Pur7edR0FStlgSzMsnfXmKf9X2k1Qk6oz998nqi6wnj?=
 =?us-ascii?Q?VKwIbt3J6QKN+POED1otzRqefGFo21osUXyV4MliSxmVp+OONlgSkgKeHc3l?=
 =?us-ascii?Q?ld7QrChDjxlmraSmF2IazFL95ubi+Cw3JI69JKtnFHP3zOeA41ahu/iJGbWd?=
 =?us-ascii?Q?CBh6t5CM2SebXu7uDkIAzQs8XfY+ttbP9KKLwRMrtmXj1vkFid3uPo4yZ0M5?=
 =?us-ascii?Q?ebUrPfaUeXe5lJqGa3cbnmidcTKVsGVy7ktN0B8kjMM7LXKU1DjRXNWQ3Lzz?=
 =?us-ascii?Q?rsFhAsPvHfEElz2RVCbIcnHWzOKY9DtlvznAb/KTdynsFLeh0zUz3HsuqUy5?=
 =?us-ascii?Q?zMgq38RH2X/Qt2FF6PTsGL3CfaBPvOrnN12LYLyIvOfN77ZrxbcMSHcsZwvj?=
 =?us-ascii?Q?OsqM47/IOMkGX/9p/FVEejxC/33woIiBSOrUWekZfy2Ba+cmXdK2UPwMLwBi?=
 =?us-ascii?Q?F1lpD9GbymORknTkRA9RzVQCS12R63P8caGitymWuNXR4mavD6IEAodty4Qy?=
 =?us-ascii?Q?LXYPds3F+fEU3ydpjAgB5NgCgWffTPnHHIufW5d0peby7J9w1m6MojXT2Xnc?=
 =?us-ascii?Q?A565MdOI/NWSZr06PF67ypShS3JHbjCMhUGya5UJsWfispzOUcbtIBncmfEf?=
 =?us-ascii?Q?CX10LDO13X5+ymIhrE4GFqdp7ZBHw2xZ1VxwwgLFxatZw1Jpu8tWngnZ6djs?=
 =?us-ascii?Q?fOqid2+VH08jhoM0UUkgABWtbRenzmO2PMQjdCwJsue3vKu9GtgfdHSssnEc?=
 =?us-ascii?Q?L4hgtwJbWBkZCSt9LDJPz0GhKAQsve0U6aspVNEwi1tYbweq5DFAjpGpPyMB?=
 =?us-ascii?Q?kw1xwtlOFR46cEqbpHDJ0XTnhFo3iAcD8vVokCRKjoiVQ42xftQ7ud3zUiT5?=
 =?us-ascii?Q?byqj7+vnX/YmnTsRXcZncJcK6QUNvsEz7vbA1V/5BHEwMfkRQOCFxUupBnrH?=
 =?us-ascii?Q?VLK8Zns9DC+WTOVFhfsyJaQA99lA03ybN5zSXmemD60+IDd3jNDSr3FkanLJ?=
 =?us-ascii?Q?CwUfgsjhT+7MkM+BTiNx80W/vOi9/MplnQf0xaICdS4e+xaI1P4yagDhhS2b?=
 =?us-ascii?Q?6Uij7W9EooLJonq+BHZzQpgVgmMtKDxLHNlZd1hbBUOz2T9cEdFGGJLW76JH?=
 =?us-ascii?Q?LMz9xsouxBl8A1Pm3mqnxenqQanFHOqbvV3yujIXN5tpY/Vx4c1eVz/BJbCE?=
 =?us-ascii?Q?Ly48brWzHAWygrQQKZ93HYP4roap8t3hsxnPVg+RL79MhN+nf1XadbSqvvW7?=
 =?us-ascii?Q?BWeowD1o0X6/eJ9xcpamyp0zQTbY89XrpYKMZFhW9ymYVga8vZfNIkrQ8hKc?=
 =?us-ascii?Q?8xhdPrHrxjko56ftwNokrjJ04NBBvb6ARKYyaCHWL64z9DclAmMAHRKhNgzF?=
 =?us-ascii?Q?yhPYpLm9t5pAcygG0zGjqOVGn/n3HvgNyrLiIlggohhIo9nd9qylSIKj4FAI?=
 =?us-ascii?Q?dJJHfPG/PpALugRozPI7TH8JljnoS4w/Heky1HAm54SRyr805LcgW7N42On6?=
 =?us-ascii?Q?VlmaEkbxekpTRL4e32KbXBk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc7acf8-a447-4293-b1c0-08d9f06f3506
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 10:37:47.2865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0WmDmxomx0FrdYfm36MWr4QTeup0yKj+O7y2HyYsvqzkXM5HCSvXncuDa95wsl2sonnno/PvAkzrIGNkvvHUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7273

On 15.02.2022 10:39, Roger Pau Monne wrote:
> There's no need to subtract _QR_BIAS from the lock value for storing
> in the local cnts variable in the read lock slow path: the users of
> the value in cnts only care about the writer-related bits and use a
> mask to get the value.
>=20
> Note that further setting of cnts in rspin_until_writer_unlock already
> do not subtract _QR_BIAS.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


