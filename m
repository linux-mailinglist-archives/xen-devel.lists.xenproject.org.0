Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F829F5C1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14653.36226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYE81-0005Zy-5W; Thu, 29 Oct 2020 20:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14653.36226; Thu, 29 Oct 2020 20:02:33 +0000
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
	id 1kYE81-0005ZZ-2D; Thu, 29 Oct 2020 20:02:33 +0000
Received: by outflank-mailman (input) for mailman id 14653;
 Thu, 29 Oct 2020 20:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFDJ=EE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kYE7z-0005ZS-Id
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:02:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3806ff7d-0309-4d56-a9b8-91c987145fa9;
 Thu, 29 Oct 2020 20:02:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uFDJ=EE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kYE7z-0005ZS-Id
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:02:31 +0000
X-Inumbo-ID: 3806ff7d-0309-4d56-a9b8-91c987145fa9
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3806ff7d-0309-4d56-a9b8-91c987145fa9;
	Thu, 29 Oct 2020 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604001749;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=L1WRBMcR3/QEoUlSDas3ah65/j+icWZ9WixAhllcT58=;
  b=fY2NtHTl1Yaex5E9kQ9CsV0hhwVwDCd0frL3c6DLYPNaU8UD0wIzd0pY
   tXTipgTWRuUBDfknL0DxurMk5k77JVl4ByBWspcPXAOkn87mEvyhFscmV
   Zg1Hc9z1Ti2pNQJZEn7t/xR/e0iqAvVGZOgPLqasusikCnWy4EpFyeW+g
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I+jgjfee8tjzNJPnwba4aSwNDI2MElLbKfjT9LafAkd7i/c84W/jacY7J0fZyPUIFaJH0rrPEO
 UqNxxS/3ncTSWfL03eA4z5pLf75jAnUpqAWPsE/8LTdbihMwv2eLgylv2ATCNUzqPxtmoqjTFx
 Ea6bc53sOzVT/fK74wvEGQxqyCyLKY8DnquOYr5M0dQS17iMjPLkPLkEP0zZ08R8isHVq2tCrl
 FO+rYsiocMLZyfGyzuEWqjz0gYKxdgOVM4rbWSyCHrFBqmF0pOA0J8Ppw1YO/Xn10d2kGoWx+m
 XdE=
X-SBRS: None
X-MesageID: 30437793
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="30437793"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCnirZTtGBt0LpIk2IxWFqyH1F/GbBUxH7TepdHxYm42pemvoXA9vtOTLRYdbt93X3aO0gqzSaOmVo3S1A34U4A3VawcMYNBOQ1qcE+fgMjKDil7PZskjuJi/kXI0zQj5R02dXxcclzaiIugfTgo785AvwOX/M3eOKVDWxdePnC3dyV04GRknIQbA1IuxkCpw7SBsznUqGr/u9+/uaWBRt94AR1ulI7JVUCMKFQJt8LieTAHd7TVzDjufNW6ptOWW/7CoryZhlwDu52sYDcc8shwdpBvwr9h3IeWYUgN1Mtxkcpf9i/DUT929Q8ufkGuaALvG4rMU6+G/vAjIrIv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VbRTD7h4MR94e3q3oI/2ulPLfER4fAOHAUSJ+KE9+0=;
 b=FGuc5gBajUZyGyC/YpoSd/BQtHstNF9FoN1GPpdRb1S9mZEb9odSeEkt805xtPXk55JsjT/tj5g4X4mICrZyEYsnqigv3Ech2chAox7Rk5vLyMfNKeubuj80pu7x/fdLCayQN2cAQWeV8abeK2Tu+CD51h3N4HU/y/eBI+F0HOYbgpWDoKlJAp7J9S8gLQJUEHKh/4prPztH7volT6lwksMVqUb1NLjutxod4UGWlaHS7hUUQHhCE7FvhLaqrPiG0yDNewYy7hkaUy+vWe08PXvNNtXTj+MFAN+06mvB2lKbPeQZFT2IOxlPTxQIB8eyd4SN17x8wtDWM2IUPkat5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VbRTD7h4MR94e3q3oI/2ulPLfER4fAOHAUSJ+KE9+0=;
 b=D0ImmfFgcmuB8/ZP66w/jndcw+0+YdQzU0eSzFgLQjdE7DNnWKwyixV7u3PeEivKHQI+k1l/1YJMWP1KIGzqSOSBeLVc3hSuDY2XAX/ro0pu4GKK/AxFHisvbag30Bb1PQvvK82fUc3APrUcXcJbZryBqE5N7RNgXB4zB5rD2pQ=
Date: Thu, 29 Oct 2020 21:02:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: process softirq while saving/loading entries
Message-ID: <20201029200220.aad6yk6x4xet63jh@Air-de-Roger>
References: <20201029152054.28635-1-roger.pau@citrix.com>
 <ab7f64a2-2ea8-0445-7266-c60e58a49a85@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab7f64a2-2ea8-0445-7266-c60e58a49a85@suse.com>
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2386b9a7-8292-4439-d41a-08d87c458e34
X-MS-TrafficTypeDiagnostic: SA0PR03MB5660:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB56606A88181E9AB2604A808E8F140@SA0PR03MB5660.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l57zALguzYLLwu+XFdGdUvwry8THVleyrEZ3bY8IC4W8KcGuiV5g9YQfsaFmnTKFkdwOph3SG3I5bcrqxuzwPLmGHZry4WysvZk31YseoNOTGte9EKvS+Q82L3qkjlChOtIHswLxCdvaj+gAjYoK1ONfTyrWYclsfVJOQo6T9w/Oifex5QM+uRroxJ6ecq9Ut0B+/fGF4z49PLJCI9dwD17pOMUvQ5/uMVsGOxD8yHNLfWis9Y7bB6SULyA0ilisur5bD0s5aOpZX39ycOPd2TaYFRI0Z3Y0ppqQf7xwd9M57Z+69xoD9pIBnjRHgA5a+hxEmgb7Diitmw4Kk5jThA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(396003)(376002)(366004)(39860400002)(4326008)(316002)(6496006)(6486002)(8936002)(478600001)(2906002)(54906003)(5660300002)(9686003)(26005)(33716001)(86362001)(4744005)(6916009)(956004)(53546011)(16526019)(186003)(66946007)(6666004)(8676002)(66476007)(1076003)(66556008)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KCGesIU4jrHqxG7dMvYmwYIE3/yVReapqnnX1kSFSy4qLrPqQDBh95rNPo0qZQIkgyROFVOI3aYQsFHnxmbtnc2wWBhwS+Qh9kyhWrdVlG48uJtqF8eYeuS5xrk6mFsJjf7X7QxqJBNjtb3OIaiOYCjExLjP/DZUIwG6y9rLG6L9V6EC36dFaKy8TqjY+0k8o//7mIhZeDw0ZtacmMgZGk/PLN1LRb6myUklUDBkBacX5ph1MvWSUcYDsX0H/vION4FX3h9Rk8zDgEPAdxzmpBUt/I29cSHUkq/qXEIDcRqBGVPcGkeT9AqJ0J1L9gKf0lnltvBK3IAm2askh47TOkiZ++5ATW0K6KlV8lygk+RvUKzpcQxl6QrUFSdCkYu/qsWG/+g/ohrVwYFgZH6md2pOHJHtcFeoebayugD9dXLJXy86npp9Adnirfg8OUBVuF2NP4DBSfXtOsqGquC2m8rnxyFl4BzAdx0EsyWD3VeG2sgJu74ItKiDWefXhzUqdY7fdtXNWWn4TFFRzPFoVoePcN+5qyoJF8/59m4OF0K/O6rqCh6+OLzm2Re9TyqvGghqfujCJMaL0MyeFWy1UPZhaJm0mq2LbbrHKtLTq6E3wgXohfyi3qTWve6EJBRb37X9CExZmxHRRv3ey+DgXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2386b9a7-8292-4439-d41a-08d87c458e34
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 20:02:25.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxmnpeSXkNNeFL+5Rbzz5HSPdRnQ/efsk7YXfDtM5hLEYD4V1YRu0HNubMdmWzT2FMowKIDT75XeVe4idnZ4jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5660
X-OriginatorOrg: citrix.com

On Thu, Oct 29, 2020 at 05:38:17PM +0100, Jan Beulich wrote:
> On 29.10.2020 16:20, Roger Pau Monne wrote:
> > On slow systems with sync_console saving or loading the context of big
> > guests can cause the watchdog to trigger. Fix this by adding a couple
> > of process_pending_softirqs.
> 
> Which raises the question in how far this is then also a problem
> for the caller of the underlying hypercall. IOW I wonder whether
> instead we need to make use of continuations here. Nevertheless

FWIW, I've only hit this with debug builds on boxes that have slow
serial with sync_console enabled, due to the verbose printks.

> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

