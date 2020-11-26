Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1B2C5715
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 15:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38578.71337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiIEU-0003kI-BI; Thu, 26 Nov 2020 14:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38578.71337; Thu, 26 Nov 2020 14:26:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiIEU-0003jt-86; Thu, 26 Nov 2020 14:26:50 +0000
Received: by outflank-mailman (input) for mailman id 38578;
 Thu, 26 Nov 2020 14:26:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQ9x=FA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kiIES-0003jo-Al
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 14:26:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faa86cfa-d83b-40ee-8247-5a320e167ee4;
 Thu, 26 Nov 2020 14:26:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TQ9x=FA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kiIES-0003jo-Al
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 14:26:48 +0000
X-Inumbo-ID: faa86cfa-d83b-40ee-8247-5a320e167ee4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id faa86cfa-d83b-40ee-8247-5a320e167ee4;
	Thu, 26 Nov 2020 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606400807;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rv6g410FGYHyb6P4r4g1APVzFc4V0hnLWjMl2Mbtbsc=;
  b=J9wOXoCTGFKh/r7TodcP5gL6WA5E9LINtdwTqFs4BI+sw4KV/HVLiymP
   lB5Spj9uBA0lhQL4MOV5wAESmFwsRFIZ42Udbdin5+mwwRLz4UpX40Xpp
   YEzoixzpauX2deY2lq93VekVToTY1wo+PNY5GKrZEoVr9BdYUu0emdf8T
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eNGlQ0tFch7UeHwQggCyekhQWHvxj3kBwDCbhi7WRV6ozNSPC+UZm/w+/+/9rdV2X9k21jIRMq
 ZZ/FumoQ2u5cpOwgBXEU54ZfLNUE4/S3hEp0uzG9CnsUCvtFZQnG0dB+CJC9s2feuOzdhh2oM4
 nbyZkVUD9fkwyZi089ztDQl0BYn4VGv6jGdwyYDPqWkaFjTA5/jwF1rRXSBWMjm7b4TWKtxGGy
 7OGHPo/97y69hFTWYxrdJTBzaAINRB4gHdSwMPcmhQd3+xcZ0dCqlrBKt/gw6q15G0TDfbFWvB
 +Ts=
X-SBRS: None
X-MesageID: 32224912
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,372,1599537600"; 
   d="scan'208";a="32224912"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBhKWPw6p+3v/BZ6aWkfzT9qdSEooF9785xgVIzGvQmZdTLGqfqfbU6mDEvIQDH48lygysiQMSByQCSZLfYIJu87oN6/4kQehWOi3sNf9c63ZgjUZEw0TAayy1KSbCZ7zEmokwSnZbHY8IBgKDHw1K2bdCWtqJpGJlJk5i1E0YZ9D+9SlcQ04WHpW6zo7+gl7b7+V8IK7EfRmE/7RDQ0BuRVbdqx8et8naHG0J1v+WJivYNo65CJI03Fc80+S3zqiQDAgFA3tKtRRZEgLL/N8e1V3U0nercTiRMP6INfs+pRirDK++EEIiihc6eg3ceQqmYZG514zZWx4MASMx8sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCpU2/zs8j2zYgYkGpaGpAoUqf4mUEXkuihQ+udr8X4=;
 b=HRJqkjrLdvfIRPNWNExvgvLTsfHjbqJxvM/HnrxEHvgnQ12r5ko6Pvagqueyf+rn95p9QwgqakCZH044NWePHWRQVcpmX3eMTCU6w40If3WxWQuet+B4O07Vyf3zqc4YUZAlQG4Cbo58eUl4BuR6NuX6GEi8GiTg4+U2eCk5NsY8TEVHwlpn8srp2tCeWo8HaNe9zX0sNWK19ifyRHMkfEdP4TB2XlyRAqQ4tFcQOOMKdRB4YZrj8hdKMsHJYo5GkxfxUkLfuiqmlqXQ4O8ZfPgKvemsKW1lJmLaE2UmAVFrDsvDbxeXOaOz09AEYaMR+UfX6Kat5vk8rk8bgLs3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCpU2/zs8j2zYgYkGpaGpAoUqf4mUEXkuihQ+udr8X4=;
 b=IjL0rpNY3wY/+CzDOuyDr2+Y+tTzqkj6d8xvL5+zn8XdeHfYL9IReza/Q0NHpn7nRKI7oo/xDYNtLRYb3xaPvNmHgarh53L0nJLzq3fyhBhv/1xHXOY/FZkBkVJVVDDsKlkkT+u7tIVKis+u0IIUViioEVUGbgjjDuO5SYXeJc8=
Date: Thu, 26 Nov 2020 15:26:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
References: <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126141608.GA4123@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 673c298e-a933-4a0f-050b-08d892174a7b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4971:
X-Microsoft-Antispam-PRVS: <DM6PR03MB49716ED7B0F2FE873147128C8FF90@DM6PR03MB4971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jBIg8U45gQzA1xmvEOhf3k0omvo8ebrnbmERTQz+zypQHH1X4pN1Xuen9krpCsCfy6n1ifX+usO30wM7q/AiTYTX0MB7pk73B3Z/PjQyK9tjx+gUlYVjdSMDvJfLSt1FFLzor/J6J0BDF/aGXrZen5BFrWRa56a+6G24wdU+51MgACIJjKjc/+7R3eYT9PLNV2/7sqzrp+NpQxEek1bLWkbFYFzzHSrZBS9iPcG40jRn9jmoUCWHs8BuEZ4nNPxdq36ukwd82JnWxoCVcfzAxgVqbYWHH7Uw06mf8Gfl4l0iQm1lYZWoYrN+dRQYDxmbJXuCQ0bVWUzmMGKjX6a4us/l2WSMhbm8B/D+760levJtePT0hc+n2Ouj9GCdgRAX2suo7D1ZBK+PQ2aX/tfLoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(956004)(83380400001)(2906002)(66556008)(33716001)(66946007)(316002)(6666004)(66476007)(8676002)(4326008)(478600001)(86362001)(5660300002)(186003)(16526019)(26005)(966005)(6486002)(8936002)(6496006)(85182001)(1076003)(6916009)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzRPRkdhOWJpeDZKN2RWYkVRN0gyL1B5R2V3UkV0ZlJXeU9BN3YzQTJpL1Fu?=
 =?utf-8?B?enk0SGFnbi9ZSGVYK1haU1gvaGJQQ2FVcittZnljSXJJLzVSYmd6MzlBNkQ3?=
 =?utf-8?B?ckdvZWRTMXFzTlVuMm5UU1FLcE9mRzJFSGdXaVg1a0R0NDl4STgwWFdKRnR6?=
 =?utf-8?B?N0RFQ084bDJ6K3BGWXJ3ZXFpLzVzdk1ybkJlZG95MzFZTXhEbkorSTRaalo4?=
 =?utf-8?B?dEU0TTdpR21FV1ZsUnBZbWRldVc1SVQzTmM3My9XMjNGVVB5aGZFSllEcm5R?=
 =?utf-8?B?NC9wREhYcktRVDZlWUs1MEs5T25mWDNsTzRVczF5OHQ5YlJNN1UrdWN1SFhi?=
 =?utf-8?B?MGNtT25va1NOYVpTeG5xUFM5WGZsbUdyUXREN0xxZUliWXZGUUpyWUs1UGZq?=
 =?utf-8?B?ZWlDRktlUmpBRG1qMytGaGZPODF3U2piZkhTVUZwMCtkYXNISFRmK0E5S3M1?=
 =?utf-8?B?ZXV1WmxPdmorK0xTTTBSdTFJMnpWZldkQkl6RzRkZnB0OW85UE9iY3BoUjRU?=
 =?utf-8?B?MWVSTk53anUvSko4cGg5K3NQaHZOa0tqcCtRV3VGSTNWVStxOTJ3OTdXanBF?=
 =?utf-8?B?U254eVRBVmJrS3FUR1VaR3ZqK09Na1llNG1IRDUyTkhwTjM3SCtydFBjdFpC?=
 =?utf-8?B?MG5kcXFUZUU0Y1h0S1VwVFVtSlNxWTJaNmJERVorR2NYZmJvQU9VcXhwbGgv?=
 =?utf-8?B?MjArUm9NbDRFdGtOWkpuQUl4cEUzd1E5eEhtWUJwM0RHUXFOWUczc0x0QW5N?=
 =?utf-8?B?RFcwSzA4NnAxbDR5czNLb3VrUDExR0dqaEozT3NyQ21EbEhsMW1HSXc3d0dr?=
 =?utf-8?B?SUNHS2lmRE0vbWRzTFJOTy9yclFLa2RBSlBYMWwzVkRXc0pUYnN3WGoxZWwy?=
 =?utf-8?B?ZFhSTm5paG1qenFPR0szeCtacit0ZmFlS0tpcFltOFphU0hyVlVqaFYwUHZt?=
 =?utf-8?B?TnJsRkpERVY5VEZYcEVQeDdaQ1RiUC9PMUdPczJVeFdUQStNa1hwMS9CSmNz?=
 =?utf-8?B?UnRqR1BlQ3g3OGpEendTcUdlRUNJZmRNRHUyQnlSdDRBRjFOclFTek9kR2xR?=
 =?utf-8?B?R1dtNUJteWo2UE9kWk15bmc4bkNOYXpRUW1CakloaHRVYjkzcWo2bWJ2ZElh?=
 =?utf-8?B?WGJQaExHV1FUSDVXelZEZ3pyQk5nNzJ0S3dLYjVJZXYybk9uSEJEbG5vcTNJ?=
 =?utf-8?B?Q1FFaDVIWXE0bnc5RHlVQWozd214eG1POUtEbmZUVXpGN0lXNjRBckkwRnV3?=
 =?utf-8?B?MEdHTjY4c20vbDNPSnBZRE5EK1FMYVBFUDZMaEwwSkJqcHd0YXVMdDJsaCs3?=
 =?utf-8?Q?OSLxhEUVkyNuNK4I61M/04Dbh5bGY1jLbj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 673c298e-a933-4a0f-050b-08d892174a7b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 14:26:40.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d74EU53SSv0p18tAZ6vaj8gVSYOdJfHV5mh/AdoCgNgmRlzD3dOxOOb0BpSaDL+2JENw8EMaDjQp8SRYQ3uu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4971
X-OriginatorOrg: citrix.com

On Thu, Nov 26, 2020 at 03:16:08PM +0100, Manuel Bouyer wrote:
> On Thu, Nov 26, 2020 at 02:34:44PM +0100, Roger Pau Monné wrote:
> > On Tue, Nov 24, 2020 at 05:09:14PM +0100, Manuel Bouyer wrote:
> > > On Tue, Nov 24, 2020 at 04:49:17PM +0100, Roger Pau Monné wrote:
> > > > Could you also give a try with ioapic_ack=new on the Xen command line?
> > > 
> > > With this I still have the interrupt issue, but Xen doesn't panic on 'i'.
> > > http://www-soc.lip6.fr/~bouyer/xen-log8.txt
> > 
> > Sorry for the delay, I have yet another debug patch for you to try.
> > Can you remove the ioapic_ack=new from the command line and rebuild
> > the hypervisor with the provided patch applied and debug trace
> > enabled? (`gmake -C xen menuconfig` and go into Debugging Options to
> > find it).
> 
> menuconfig doens't build on NetBSD, I set CONFIG_DEBUG_TRACE=y in
> .config. I guess it is enough ?
> 
> For the record, my boot commad line is now
> menu=Boot Xen PVH:load /test console=com0 root=dk0 -vx; multiboot /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1,,0 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug dom0_vcpus_pin sync_console dom0_max_vcpus=1 watchdog=force iommu=no-intremap
> 
> 
> > 
> > Then once the system stalls use the 'T' debug key to dump the buffer.
> 
> Here it is. It seems to be stuck in an infinite loop, I hit the 'R' key
> after several minutes
> http://www-soc.lip6.fr/~bouyer/xen-log9.txt

Oh, that's actually very useful. The interrupt is being constantly
injected from the hardware and received by Xen, it's just not then
injected into dom0 - that's the bit we are missing. Let me look into
adding some more debug to that path, hopefully it will tell us where
things are getting blocked.

Roger.

