Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09830571F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75876.136767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hK2-00077M-C0; Wed, 27 Jan 2021 09:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75876.136767; Wed, 27 Jan 2021 09:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hK2-000770-8x; Wed, 27 Jan 2021 09:41:10 +0000
Received: by outflank-mailman (input) for mailman id 75876;
 Wed, 27 Jan 2021 09:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xld=G6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4hK0-00076v-IV
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:41:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6beba1bb-03c8-41c1-ba84-23e65e9e9fa0;
 Wed, 27 Jan 2021 09:41:07 +0000 (UTC)
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
X-Inumbo-ID: 6beba1bb-03c8-41c1-ba84-23e65e9e9fa0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611740467;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=V9hwVcAuKIlY1drz2Z5yDhWQ476Ck4UJDCseqaO6rHc=;
  b=HVYAQsj3LePmwaPzxKZDtDcAXRhu9HozgPnNWJsNpQ3RYqg4NfQ9cBi6
   U1WZqXQkBrUuhKIRTHVy6B8u/2iYl8Vk2U57kaFzmvtXd2OOnEDUvFXST
   8D3j8MAWJcsGFEAnLurNtpYT1WaCzqBX61YNiTkDd0f2hANGQvEfg6QIQ
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VdIqnJZpSmfSfX0u5bJKJ3soAzeqdLRNkZvK35qIfT287Zp+aBOamJfJ5wclsTvYJFJczxKnlW
 BtEbcMqNIcl/pQ//T1ThWwTpP/9AtnA+NYuspT7DQHR+J72x6+c7OkxkNVdg8BcL0AwRE1dHKl
 6JfLQCzNKW5Wjnm2l0Mphdys4+HVwe4UN/htc2CTDSRfdr4eNu99OFspbz1CsfpYGSMLAHMjxC
 3asUdiQEAqEP98KKuoy8yK+HFmBauISaMYhIoWxmxKgUeFtXO1SUDPREOZHHkDFjQx93PucPHL
 ORc=
X-SBRS: 5.2
X-MesageID: 36148806
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="36148806"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf/WLNRz+BRYH1IXf/8QVu5K217eO4A+O2vJRMgXXBW36TkOzPsXe1mkBZ7CxSQtBpaiB87D75Obi6iKOeQXMKqN5uZIr+i0OeFFitRzJwTKINznmTf1FFgbVzKBlDUHDjOSZkmNZe0Cc9dKm48kdPiExfixEa8tPH/t9BM02pNRvdGVYO5cR8Uwrg1BRntOLNIqt7dRz33oshCeO9f1kWxb57A3w8ZUs+rqxOEtZAIUG5JuPTzM5xkTsYsWJQel4VuIozh7fCXPlGfMN1YuUgex3W55fd5R7wMR7iBzuk+7Rjd9TZ5ODX/eUzdaHAemnnHfZHYGMC43PiBKHvNzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqbFHMqdSeAud9UE3X6HcdVeifsYJofWryRws/2/CXo=;
 b=SB9Y/BDVt3b937C1PHszyMGvBLeIiH0q5hDWqnMg/X6cQZErLLizKVOUGqZVTUDhVYe6aBaf9OJzc7n3tLjJevOioJZGGP/FyuIOGIZnGkUqPn5gDpx6MBNdLXfX6kE0nObKftWNpBpKSptfJu19Ig1cmna3JPFp34fJ+0YmaknSbbBPPtSE1Y0Ghf3e1xd1m2QHO1nM1+j1qWdhqOxXTo6/pFZyV7/+C+FJzoqzotzSsFf4G5wNhHZ27cz1YR7b9tRO4RVl/EyIURjzfG7fAxvYijHTFODo9D2oGvXv0c2g2pWqhe99bHVMt1zwllvrffunyO6axvlHv5z9lGq2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqbFHMqdSeAud9UE3X6HcdVeifsYJofWryRws/2/CXo=;
 b=NgBgEVMOykvVJTX9OYZcfY81IvSEY5EkOkgJkGqhWkDVtx0KQ7jqtl/HRDoLepiBkCfXLS9mSbQmXTj4nUgkeQ/OiUWh9jyrJdg98ueU7Rs/yvsCGGENtlHrMHQKSrjDcf8Zbbid8XOKh7q4iDb9g9U2gVaoCxXKJXqTm7qaJ2U=
Date: Wed, 27 Jan 2021 10:40:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: fix block unconfigure on destroy
Message-ID: <20210127094043.lkccsom63xswygio@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-4-bouyer@antioche.eu.org>
 <20210115152712.njzgo2zqpiwyhmds@Air-de-Roger>
 <20210126164749.GA8309@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126164749.GA8309@antioche.eu.org>
X-ClientProxiedBy: PR3P189CA0065.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1dc2483-5507-4818-bf34-08d8c2a7a087
X-MS-TrafficTypeDiagnostic: DM6PR03MB4060:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4060F91039ADFCAEA631E4AE8FBB0@DM6PR03MB4060.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKhjSKuf9V7+43mgWzSesqG8ltLfbMBWqkGwGyaH69YIXZTjsMJtv94zqCGrliw5hUOsa7MIXst0NQnHR+kCsqqoUfo/FrrkAoNtTzaNtlTk5SUU0o2U3/jH5onEutSU6qcoVojGYmdFbr9qiM+QwEhvxmvILnIT1b1oelY1UOmR6nDHhh07voQKGkWGrD1n3sSHHdlqMGJ6pD7o9Kca2nP1uqvEzKMa/hfeaKq/eDN2raWwOUxxDiTWOncPW7v8h2hKaeFYTamE4Wle+KyPHsn6fABw2moqrid07ueI1lDXqDN4pUKKCZnM/hHB0ll610229Xuc/xPhgbxgT9qXXY7Ld5Du6IMg5/SWUfai/RXtsRQzNhoU1Vg8BU1gGsMVQAVZl+5L/GpNP2lhL94UgVmRBc9oyQenMvT0SCPJ7GfA7FUDQcEPtYKcQj2Cm5+sNgKk59IvtONtVUxcOXyEJH+1+9jBoy71Qts+ppSQem+6mgQ3zZrTPBcNOs4UzvOkgTqxQ/64CC0OXIMGzBVrkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(6666004)(6916009)(66556008)(6496006)(54906003)(26005)(86362001)(85182001)(8936002)(66946007)(16526019)(9686003)(316002)(956004)(8676002)(33716001)(83380400001)(2906002)(5660300002)(478600001)(186003)(4326008)(6486002)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDlFSmJUUFRkS2xIdVhJTHlUQ2IzRUh6SlkrVEpjNE1aOEp4czdqeE5RaEpu?=
 =?utf-8?B?Vm9hNXRQbG52QTVBeTJBTCtqbUx5QVZUTGFLR2dFOHdRTmRvZjV6Q0Z0YWti?=
 =?utf-8?B?MWtKZjlJSnZEbEsyci9zT21ha21WeFByb3Z5NzlSTkRZWVVDUHZSZTlMWXlx?=
 =?utf-8?B?U3JZemw5WnNzdm5nNm9TVzhmaHo3Wjc4STc2TFl2bnp5ekkvcm9mN25JMTdY?=
 =?utf-8?B?blkyczBkUnI4UG84VVJyWEhoY29RK1hLVnQrL3drUnlxZmpTa0ZQR3ZCZ0h3?=
 =?utf-8?B?Tzc5N0RQMzl5Sm5zcW1QNktOMGtLQnNGY2VZU2tjc1Qybmh2U2lUZE5RSC92?=
 =?utf-8?B?WUpBTVpjTTJtakQ5T1VQcjA0NVJzYXBOQy9jL290RVNiTk5va09SYy8vSS9q?=
 =?utf-8?B?MnFoNndNb1pwRGVXMS9ZSGR3UWxVaXQ2eFBoWGZ5YjV4bHcxZTJkRmlWbVBj?=
 =?utf-8?B?d3FwSVIvNGNPWGhwS2FjbTZoY3liaHd3TndzelZtRTk1NDkxV2lNRmFnZ1Rw?=
 =?utf-8?B?UHBaNi81Y0FUY2xKbzVvekpWdnB6RzBhQk9ORFZBN3R2a3JBcTk4VnhEUmlp?=
 =?utf-8?B?RHIrMXQ4R0dyQVZLTHZ6VGlydXo0R1ZkdmNOeHphcmM1UW13ckxkbko5TVBR?=
 =?utf-8?B?c1BVRzZTRFJNTklVeU9kaXlyNXhuaXZVUVh1eWpMajkwd1VuSmxzeUZ2Vlo3?=
 =?utf-8?B?aGFOWE1GZ2pFL250ZTl2ekRJdkNrbmxxTjVibTJHekVnZG02eUlyVzVYNkhQ?=
 =?utf-8?B?MEtYQ0hFUWdmbytjVnBIc1BKTHJXYnhsZ0k1S1BHUEdnVGZIekhQVnJOMEJV?=
 =?utf-8?B?cVpnQjdSNmJrcU1rOEFielJjYXVhQTFva2JIMkd1b3hCOUlJSm5CVWMyamx6?=
 =?utf-8?B?Q0w3M1M4RThmaFpZb1MvWlBjd1BwTGl6eWxDNm4zL202M1dKcmozSXlRQzlT?=
 =?utf-8?B?ZkFTSk0zMHN5cXVqaTQ5Q1d0TmJOdi9hN0FBU3RlZ2lzVlJncHFTMHpMNVl3?=
 =?utf-8?B?TXlpa255S1p0TDBtbE51eXlyWnBON3ZSSTljNjlkZjVxalZOT3NOSWZHUEpH?=
 =?utf-8?B?VHVLWEVSSmR1TFZqQzFrT0lvNXpxZXVTZEw0TjU1dlE5OWFERU9MbjVtRHJQ?=
 =?utf-8?B?MCtnNG1LbW9uRHpra1dyMkhrT3hDWXl0WnNpbTBPSUtFZmEwQ2FJMzUzd3Iz?=
 =?utf-8?B?SWJ1ZUQ4SnI3bGlqZWFudUZlbWFPSzdRVkxmMmFnWGk4RFp1cWQ0aGpWcGxy?=
 =?utf-8?B?RnpWaHhjR0U3UmVRc0ZVckUrUmhKYnhkZUFCaFdWbEFKT2Y4cWtMaUxoeTFl?=
 =?utf-8?B?Q2dIWnhrSVNHbk5JQUdkdnBQYTE4eUJ2VjdGZzJTVU1lcHVEa0VLM2xhSTUr?=
 =?utf-8?B?Tm5BOXdaM2JWVzZGS28zcVpSVzl4NGsrbmlxS0t3bE4wTVY1eU1MLzNyNVd3?=
 =?utf-8?B?aTl5MUZkNC9LalphbkxSaTYyUlhiWFIrSm9oZEZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dc2483-5507-4818-bf34-08d8c2a7a087
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:40:48.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhi7dugXPICwskWmAZi/gfqkxbDa0JkFMMfFY6shxRDj5gTg1C5hMt6dXMQRzRlMxUK+1VsKjQEyVlMDosKzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4060
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 05:47:49PM +0100, Manuel Bouyer wrote:
> On Fri, Jan 15, 2021 at 04:27:12PM +0100, Roger Pau Monné wrote:
> > On Tue, Jan 12, 2021 at 07:12:24PM +0100, Manuel Bouyer wrote:
> > > From: Manuel Bouyer <bouyer@netbsd.org>
> > > 
> > > When a domain is destroyed, xparams may not be available any more when
> > > the block script is called to unconfigure the vnd.
> > > Check xparam only at configure time, and just unconfigure any vnd present
> > > in the xenstore.
> > 
> > The patch itself seems fine to me, there's no need to fetch params
> > for unplug, you can just reply on the vnd node.
> > 
> > I'm however not sure why params would be deleted from xenstore but not
> > vnd, do you know why?
> 
> I'm not sure, it happens on xl destroy, when the kernel in the
> domU is stuck (so it won't shutdown properly).

That's weird. Linux hotplug script will unconditionally read the
params node and we had no complaints there. Can you assert this still
happens with the latest version of Xen?

As said I think fetching vnd on detach is fine because there's no need
to fetch the other nodes, but this seems to be masking some kind of
error elsewhere.

Thanks, Roger.

