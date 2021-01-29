Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716E30899C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78196.142138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5V8N-0004ma-DC; Fri, 29 Jan 2021 14:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78196.142138; Fri, 29 Jan 2021 14:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5V8N-0004mB-9p; Fri, 29 Jan 2021 14:52:27 +0000
Received: by outflank-mailman (input) for mailman id 78196;
 Fri, 29 Jan 2021 14:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEfz=HA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l5V8M-0004m6-B8
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:52:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bedfafe7-ffb2-4849-a347-3e64c30fd9be;
 Fri, 29 Jan 2021 14:52:24 +0000 (UTC)
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
X-Inumbo-ID: bedfafe7-ffb2-4849-a347-3e64c30fd9be
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611931944;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NM8m3TWtXVAhgJpGeDZUo2FVJ2kU6WtqHXfADYUBXRo=;
  b=SJ4dZXtu2loLGh2ZMd/Sf7mk1lDkknIieb44M5GPh9mRhQdFdFHYfGR8
   5a5erWz86kfnqDbjQgIcDTITOzY0LFTa6Fw13dME6a+WSUsiLd3FTxyiR
   QzCjQthNiFZfJLJTzItD/IpnVugJ5cfV8tZwj+MCwbY06QleEQ4ZbdvQm
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W/qldZ0sGTDz+J1sUK63YWi/mst1qNTAfU4UpRT6Cga2Bb+DM/CAu6vvnPcx7eSAHHb3IgFz2R
 hpOReXs0o4+is8klvDyeflUk0O0yaCgAOK/9r7PEkGtAXcoU/JrpuMQnWFUXtn+1I+QMjF5eLT
 mSTXFBa+GvGrrzLdRbmV7zNFm9MAnoLwn7oH+iWYPNAtMDO9CuwONNw6AeiF5Zt32YeEiu4oSc
 ivLuEFALKmOUUbWlXjfQ7GygvtdHabPK8QxwXm33T8HP/OLaEq0LvJFzdQrzlK3V/8wWWtqvpo
 G8w=
X-SBRS: 5.2
X-MesageID: 36195871
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36195871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ5XfFrlTh5b6zMQ4RAHhpHcFgr5PRVOA3rIGKoGn9lVwcDEW8YYRFMvqUXZnEYBfIkEf2iJ2no8p2EokhIZ07FjBWTRXC8/CVHI1FUcIXCK+dBewaqtUxsxQkxwAOkYLDWkeCrmHxJd38gM+GugWlBvHXzgxG9bU9ZovV+YxOfX+wiCMAy/DJjN04SPV9Ucpvy1aRXQV+chIdPUkoctq7GpDQFL1Vsk5Uc3WR1v2TTKjYqaxJ+G+c9DGZGQLNznWrwFfrLJ9ZW/ZZUPaqKzDuFyeOXvTx8QBCtbnvR+m0DLhXp1Sm0OFolnw/zaVTP4yDCMpSh5nw7VU0VWxmUxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C83cUDM0fn9a/8w3uA7eVM/yslXWV+568oMTj00Qlxo=;
 b=DOiTNNot6e28GsnBKnlPaHT02oKQqjpD7TFgVEurVCe4W71jRxayzLKW9geqxlkmkTnYYJ1TIlflA79TP8519sErEIfz5Cl1L3K3KRDBoK1/BNl9S7C3qNvgS0qr0dTtqhwwfv5pTWbSazLfDvf69Wtzd+7d1UDUjg3H8R0+X+e/j2pOEtuTJcKY+YHnUA0HzK5HeYIxNpkE6ywHQkRC0eQrtRxAZwDj7Rr8ajNQ9qlQXBKFJB1w2Fn1oR9lF0xTpwgRb4qg6m0b5VYxTM7nPOa78mH4TqrXgQUkTNyXHNjCIopUJHZaE74eExjeAyxWK7afMTbgJlD7973qOvP0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C83cUDM0fn9a/8w3uA7eVM/yslXWV+568oMTj00Qlxo=;
 b=kj3aEGAvglewiI5xZAqUNob/21YY5crR1xpq0J769AvWSQMSJCy1NhL75ZDMN8QxbFvmvdWeRUt0BIDLpttkZWpI0R6Ibvf0xGILHqcsknhgYkGaQR3EttpHauCCD/l37bBjKQxKKptx74Ojw8lV+50CEfCcdTMYFePgMtlQJTc=
Date: Fri, 29 Jan 2021 15:52:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <YBQhHuEF4U9wHHry@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org> <YBKbEhavZlpD75fU@Air-de-Roger>
 <20210129104653.GG2015@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210129104653.GG2015@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d50ea68-af00-4f76-d8a8-08d8c4657afb
X-MS-TrafficTypeDiagnostic: DM6PR03MB3739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37396B8DD81E633836DF4FDB8FB99@DM6PR03MB3739.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nu3+/1Qb+IxFOvKHpG08eDJGp1iUI8yypg0VV4a6Rcx8hGIHxHYQlceSiABCW0tv8YKljrVZ/oaAgJ2hVlB6uu8VdqV7lMGUx8tmRVk4ZpfbetaINv3g53VwMjY7uOrvQ/zSavADZn5HCuB+vqXKIrl10pCJqExBjD+dDm+aWQeJ33fE9VBjrSTGRSEFD0YTa1ghpoUl+8JbE30/5fqeDivZ6qApIGBROfagxvfoEZsnDxiR1lwDu1VMMHmqldLbjTZ8+e7BByT85lb51urn+UQcYTBMfQLRL9hutgQnI3HyAihaRDocZgV+5+x22pMBU8e1dTRdS5uIz44Z7gems6lxwWz3tQ9wJGDPI2PNMgAV2T704BjkHP964Xy6+l11BH6T1ELtpGOYO/gPnK3f2TXTvIdJeK088wUFdqzlugOCf1Vi3klxzODr02xxXfGOXhXvWfAwclxKldNQmnV36gz7jnJBzZpaB7HVwFbUXtxOy0n5bbndBEX/aRfBVmQqX6h31LEnWXhx8adYCK9SQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(136003)(376002)(396003)(346002)(8936002)(6916009)(83380400001)(107886003)(6666004)(26005)(6486002)(16526019)(6496006)(186003)(5660300002)(85182001)(4326008)(8676002)(956004)(9686003)(66556008)(66476007)(66946007)(33716001)(316002)(478600001)(86362001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WitFcS9pSVZsNmhMV3JRNDZKeDAxM1QvNzhFRUMrMjFERXpXaVFQTVhIYUNL?=
 =?utf-8?B?QTF0NUdYb2VLbkRTaUxaVVNEZ01TTkpFS25FUjM3ZFZvSDdENTdMak9lczVB?=
 =?utf-8?B?aEwrWkh4dGFUcStsNkIxdERCbFVMMGFoWlpsSlY5cFdEQ012Ky81YW9XZm95?=
 =?utf-8?B?Y09nTmdKcnppQzNPV1lXdGdkMjBzNG5CQ1IvK3lyM1lBaUZtT2NzdnNIbDNE?=
 =?utf-8?B?ZUdXUTFHUS9FUC9Fc3ZvSEhrV2JKUVFLaGRRNkFocnlzdXpjT082b3FaNWdZ?=
 =?utf-8?B?RVAramt6L0d0WmYyclhZRkdUdDQvQnFyeHF2UDNRdi85eUVwUmw5bEJiOHdH?=
 =?utf-8?B?dFdScEdtamo3RTVORE9oZlBTNnFMT0hhbWdRUEVqaUJOSk8wK243NFQxMStJ?=
 =?utf-8?B?cEZXTTIxTWlQWklORSt6elJhZkdicXk4ZS9kRVJSSC9HeGFVQ1JPMFRJOGU2?=
 =?utf-8?B?RzNNSzNqUWtvSW9IWUF6SEd2bW5aWG03ZjdjWEo0TmlhRlJRV2RuVUpXeU5G?=
 =?utf-8?B?YWpvNEpCZThxMDhwWS9ucjJia3A5S21kVitXY0tPa2UybTVkUFp5TmF1L1Vv?=
 =?utf-8?B?TUNSdzhvcld3eUZzRUxXMzY1a3g2dHpGOFVIVzJDYytwQ3l0OXVVbVFFSjlw?=
 =?utf-8?B?V1VEK25yL1FlRkZ2aWJGQUtWeTJScmlMQ1p1MWY3OVNiOGk2Qmh6RW5lMnlC?=
 =?utf-8?B?Q1FuMEhObW5tWk0yR1V1ajZOYVRoOVl1cE5TajZySC9NeHpaMUgrN2hSTkN1?=
 =?utf-8?B?ZWFvWUY0TXpmOGdXL3NhTFh2ZmpaTk12TVAwVXY5bXpLZjFoSGgxNG94azBj?=
 =?utf-8?B?QVhBdUpDcS9FRGNrbVIvY0FXeUFWRVNvamk1blkwUTJUQm1IR0xDSVB6V0U0?=
 =?utf-8?B?NThUUW5ZSTN5TUR2dC9JNzBKYWw2SnZwQ2I0Z002NklNWUtMWERROGREd0NM?=
 =?utf-8?B?bG91UlRHa3FiV0J5S3hzVnF5eXFIUW44R1NZK2kydUZFRnFrc1k3SGJXMllC?=
 =?utf-8?B?QnM5Y0xyK0ZJSHd0M3FFRUt4eTVvWmNmR2EydWZUOEt1MDdELzFPLzBSd2dI?=
 =?utf-8?B?WWxJM1ZMd0YrWE9IaGdzeFNFRENla0taZGhnM21lYVhrQkt5SU5Rc1h4dDBT?=
 =?utf-8?B?RUVmWG1zTG11TXdXaXozcFFCcU8wbnM0Ym1nTVdDYkN4Qnh1RThZcnZwaUtP?=
 =?utf-8?B?UnEvY3k4MGd0aVBXUWljRE5LSHBQQTZwWEZBQ3FMM2hhUEZySXJuN1ZUL3pD?=
 =?utf-8?B?OUpPaFlVSW1BM1lkbjIrbHo1RTNNWUJCLzFGWUNPOEVmZ2JQcVR2Z09rN1NQ?=
 =?utf-8?B?clBxWkdsNDBodHpHTStCM0RNMFpLb1NLR0lkNFNISjRHS2l5cjNpSWNHRmpN?=
 =?utf-8?B?Q3dnQmRpMWozR3hWLzlTWjRoSEc4Nlo1TkQ4TFNiQUludnppOUVmR3d2d3pP?=
 =?utf-8?B?aHQxRUc4czFsVkpHc3plZU12WGs5Uy9oTkh4UHVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d50ea68-af00-4f76-d8a8-08d8c4657afb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 14:52:20.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZZNUudznrcThABQQaOsLZk5d6Fch51Q8kOn+TE/fg9XKIWnNyKEh4GS9gaBGjEzgc3g8ZSpfMxgyAXrg3vd9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3739
X-OriginatorOrg: citrix.com

On Fri, Jan 29, 2021 at 11:46:53AM +0100, Manuel Bouyer wrote:
> On Thu, Jan 28, 2021 at 12:08:02PM +0100, Roger Pau Monné wrote:
> > On Tue, Jan 26, 2021 at 11:47:58PM +0100, Manuel Bouyer wrote:
> > > Pass bridge name to qemu as command line option
> > > When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> > > to be used by qemu helper scripts
> > > The only functional difference of using the br parameter is that the
> > > bridge name gets passed to the QEMU script.
> > > NetBSD doesn't have the ioctl to rename network interfaces implemented, and
> > > thus cannot rename the interface from tapX to vifX.Y-emu. Only qemu knowns
> > > the tap interface name, so we need to use the qemu script from qemu itself.
> > > 
> > > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > If you have a moment might be worth adding a note in
> > xl-network-configuration.5.pod that NetBSD in HVM mode requires
> > bridged networking I think?
> 
> With the default qemu-ifup script only. As you can do whatever you want
> in the script, you can support whatever network configuration you want.
> It's quite easy to do IP routing for example.

Right, but the default script provided will do bridging mode only, and
even if you add 'script=vif-ip' to the network configuration line it
won't do what you expect. Instead it will try to add the tap network
interface to the default xenbr0 bridge.

I'm not opposed to having it this way right now, as it's better to
have this than no support at all, but we should have the shortcoming
documented somewhere. Can be done as a separate patch.

> > 
> > Also, the qemu-ifup script doesn't seem to be part of the NetBSD
> > scripts that are upstream, is this something carried by the NetBSD
> > package?
> 
> Ha maybe I overlooked this. I'll add it, but maybe it can be submitted in
> a separate patch ?

Yes, that's fine, can be added as a separate patch.

Thanks, Roger.

