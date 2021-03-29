Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D834CBEA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 11:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102883.196409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQnmD-0001B8-15; Mon, 29 Mar 2021 09:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102883.196409; Mon, 29 Mar 2021 09:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQnmC-0001Aj-Tb; Mon, 29 Mar 2021 09:01:36 +0000
Received: by outflank-mailman (input) for mailman id 102883;
 Mon, 29 Mar 2021 09:01:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQnmA-0001Ad-Pc
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 09:01:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 084c7072-deb9-4095-9910-e0b8256b32a7;
 Mon, 29 Mar 2021 09:01:33 +0000 (UTC)
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
X-Inumbo-ID: 084c7072-deb9-4095-9910-e0b8256b32a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617008493;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wbzUBgXsEjFdjmWmTDeSZwTEg9clsyyaZNpIn7Qj4v0=;
  b=QDShcupNpN4AveeqSdEJXbdoYKHMiTtOUt+oUen0wCLChMFrXiRWpOxv
   TCPfJSJ6CwhLX2zBxu/uxVRzEea1h0XGj4nYq6cdMDzcBSKNZ+SUpb9oe
   Ryk5XmCxo/llxXc+DikBX6wQzM3LERQjTrNc31M9YzdMZCFdu7c4r5I2c
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ndjtH/ZWSSQO3NMQ4+FQ0lqbUI3dXcw5UicABgI44iX4y1ttZSPs3MX41ivBLI5u3+Mw0getOG
 CX5Uxy76PSrhcVBKe1D5rV01s2WCNkXeoVJ7+D7Lib09pIm5eRHqGtIjqLZhcZtlpgPTVYIxiM
 yBnaKGnFqeuT38b520bik8c9R2MS14EuiWcTklZr3BzBqfcB0i496l4oM0K8ukU5z+Qae5qyty
 KakhJFCfLlQBHmk5cjVtFV0lUwnJ/ChF+WExpgJyMkGdUs+PN1REkuL/Q1/C3FaxGFNKiipt8I
 ySw=
X-SBRS: 5.2
X-MesageID: 40204121
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:izayrqps0FX6uCZi3F+YmwgaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="40204121"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVhQmvV44D8YvG1B97sSUywpFUSTb+VPgJBmOdtrYi3BxeZvsCL+pq66tCEgEqHUdWanf01SDuuaJ3l7torZPyFVdPq5QaLRCxycMMG+/xdB5QZL4LvxrpFRqt1wRQUDNoim9AgO/cuAo5F8qiekwR+56LVrk4SIRLHRVI6WMM56WfOFUqQSNJhcuGu8RSG9VU3frxbGY4t8XA/0lgu28CtkLVhfqrJf6y29uweGgbaMoIeSeDDtOQjUEaeiIiOwhAbNrEut2WIaKHFI4NkKPn7QElLIh90EhhKq39ha0aSHS5sxn0Ojtd6Tde8D7P678qOFMVLpauSlvg02qLxIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LBs/fBUQ874++qGKqA4NMkmnhzGgxwPpt8ehgvSyBc=;
 b=NumwCI+5hoytvVsuWTgWmx5xLzb9yUm1Pluk141ufEfIH8lfRKU3BD8O8hsbzx7xEncf1vctqD05ircldUilVxSX1/OBixjd/sPkTxYPX2m53jKVUoQn9qL6YgbuezXD4mxJ5Qg8+JTN03+zyXwYfdeCrlO2BdjsipIKnH/KwZEHNHVIrc1OY1YltI26bAiZxYJsTh3YhzTlqHUgLQ/N83ZrCpAZ6oB+ecxscieHbcpwz25jZtFojYwtjxssZbtJQWJhCzCBpnqf/Un3LVK6UI6mdovjxfFeRRtuG80OcFenAdpVCfsdrL+OVD13KIWPLm/rHHUsBtCeXULM6sEh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LBs/fBUQ874++qGKqA4NMkmnhzGgxwPpt8ehgvSyBc=;
 b=We/+C9SUDYQbE8ju+60GYNCT7U0zkx/litkp6y+u7zUsPJPnRrP/xRnQNHufwzjSRuiCCb24dPN556b5P1nmUEYlxhN4+vhb7v3Fdtlt7QJmCPv/iZCwpVfD5WtUvVKqeE4aSzigsZM9PDNkG/Yu7/7U+Bu1QLwt7WtHaDX9XeA=
Date: Mon, 29 Mar 2021 11:01:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: Re: [PATCH 1/2] tools: Drop gettext as a build dependency
Message-ID: <YGGXY6VmkK1q4x4I@Air-de-Roger>
References: <20210326134558.7751-1-andrew.cooper3@citrix.com>
 <20210326134558.7751-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210326134558.7751-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1156b57-19f1-4117-1074-08d8f2913db4
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5968EFCAFB1CB325BB5EA2058F7E9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwlNn/+z/xz9OBul71ourmuf8MqQuO1gedCPZUPRm5hX2qrCPS2rV1u+OuZt8ohd5UvaMfmk3uIn47wn5GaA99m0+6HzNxN9B+Tud4s36hwGPxF+BteRInwQbvTnWuvlRxkCJDoAe2qAD64Wuvk0G/LSZ2tPyf7epLFipUb5f/3cCw9hjQcU+ENT7pNEn6hAm8GRN2NNtnWHW0Hr2lisb395Fsi2pGsuDX1+0uo0vGxf/fe7cGNyJIqV7gqmiH3bBvNeAllCUIolCmwI1xqBv4qhiNQ2qNJv8GZFcZJ5IiRYAGn3e1/9HAC99VaRc+BO81LGd8r5/E5ajD2eeNSb5m2Nh0vICz6mA/QTR2To1Rl6arqpm/H97WnJ2RRf7mnjUDbKa1KB4C2/dzLbQL0AoLGFvg6AXXwipeChd0dbnkcF4YqXC58G0QKiPeTKdEn8rxCmceHsJAjdSdDY+qDEgUbLVeHKNIvmy7kB8cZ35eyH4UPP+7fnzt6Yu9upZy7ckSgFDV+fZRTYih5n4YyLh2NezqHtd3JPVaUkIeB+oQLjsnb/kEEFvKFFGL6qyqOBhqjhMlMj5vf19qy378tM10sjuqjnGJY6a2HZ+iWsGJp07Bb5lnRAgN6qR51zE5Lfi7o5iLLIHTxOZyWNaCnHb1vJ0ycrooD3vZDymfpywA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(366004)(346002)(39860400002)(396003)(136003)(956004)(33716001)(9686003)(26005)(6496006)(5660300002)(16526019)(316002)(8936002)(6862004)(186003)(66476007)(86362001)(8676002)(4744005)(6666004)(85182001)(54906003)(6636002)(478600001)(2906002)(66556008)(66946007)(6486002)(4326008)(83380400001)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1dqVEdjc2U2R2xCc3hZSE1nSUgzVGZYUVYrQ0ROU2Z5ZXF0UmVhYWJSVUxi?=
 =?utf-8?B?SndISW0wRFRHQTFBY1dzMVArTFRFRHE0YXUxdzA0YldPTHhuWXZOMExwSHJB?=
 =?utf-8?B?OUJjdW1OUVdSUDVUZUdlY3U2Q3d4V3NKemZuTExUcWNoa05qWEZVeTBoQU9W?=
 =?utf-8?B?SENLV0VjRnBHakN6TDVxVjVRY0ZpM3FFTEdmdk9wL293TzgwZ2psbVJYUTlT?=
 =?utf-8?B?RjFjYU5kazVpZTl0blcxVXM5VUhaREo0Vzlnc2pxZVpJSWRCZkl4c1hhVW9F?=
 =?utf-8?B?VHlTaHhCSEcyMkxVSGhzYytZdEJFR3pCVkovSERkS1Azd01BN1NlQzJ2UGNK?=
 =?utf-8?B?V213UG1yUFA3akpuakNPdTlyS3dLZVFrMnk1NE9DSThDVU5HaENyU0pGaDB4?=
 =?utf-8?B?RlFSUStEQWxHUGJGOWFZK29ON3hmbkh3RkwzQ3IvazliWG83Ti9kMGtwRkZE?=
 =?utf-8?B?NlhkWlZMNytIekUwV0dFSk9rSVUyUldmdktmMkJwVXRUVWk0T2Y4enVyVjZH?=
 =?utf-8?B?OFA0UzR5SG8zdGFCVXNHSmswQnM1dTNnWEN1ZEZKWk5oc3hGNitBZnNJQTdn?=
 =?utf-8?B?cW1JOEdOanJQUHhmR24wYW54bGszT3l3TkVlYTQ3U0ptRjA0WEFlVi9Pd1g0?=
 =?utf-8?B?cWo5dytCcjBVWkdPbUQ5Q2cwTXdmVTVZczU1ck9MWG9xYzdEMm53cnk2Q2NI?=
 =?utf-8?B?TXYwaWFNSkF3NitUdk9MWE5sbG9nMENTbTR5aFBKR1Z1Vk9sY0gyQmxldFV1?=
 =?utf-8?B?MXJBUi8xN0FUS2NTVHhVc3Nhc3pHUDRGVHpKTnY3SDlxQ2pzSk5UYkV3UU4x?=
 =?utf-8?B?MVZpTXhaYmZsNkIrNDZDK3R1RHVnTHhLZUkxL2tmOVpXbE4vUFVPcVVPR3Jx?=
 =?utf-8?B?MjRMaDQzU1JJcUZUU0VIeWw0NGtFVm1SMG5Rblg2OE1QZFJ5UFZjQ0RJb240?=
 =?utf-8?B?SlVzU3ZubkVwRlRxaG95TXg0VW5FSjRrbCtjL3NPcXowZ1ZCWXhZSlR2YVJp?=
 =?utf-8?B?WmhyWEcycEJnZkViMFRQWEJFdk1RclZOMnduTnh3Y3hNemJ1WTNGdVJDMXM0?=
 =?utf-8?B?ZXlhanpaWmJPaEdTWU11MElReHFqdGdydndzalMzVGo1anhicEdQSmdXWWM3?=
 =?utf-8?B?QVR0ZWU0NkhMWWZJSm5iYXFzZlRHVXdtZ3dTQjl4VlBIQjlqc3dDR3Zvd05O?=
 =?utf-8?B?cEZOci9tZXY0cEd0V0tHOFNiSkZGc2daUy9zN3N4K0NsNlRnNEFBQldiQTBS?=
 =?utf-8?B?VUdpRFY0b1M1RmMwYm8xUXZGTWlnSWx3RGZaQjhscjFXenA5NXVIZW9leVlG?=
 =?utf-8?B?aVBBT0g1bmJYa2xlRmp2VnFNUEhkek5oNG9paFVmQ0xqcldnaTV3VFJNNy84?=
 =?utf-8?B?N1AxOEFCQktoOHJGRmQyQzJWODVFN1lUVE8vb1RnWFJyTzREQXRzbjJuKzdj?=
 =?utf-8?B?S1ArMzVGSG1UOTA2K0hTNWw3TXdIRmtud1cvMVhZL3Jhd2RhQ0o5bWNKVER5?=
 =?utf-8?B?WldXeE04ejZYa29hL2lkN21OZFBXSVhQem1YZFo1Q1krSFdxTWFCbE03VWZt?=
 =?utf-8?B?azNIZ3RpZXdPNkc4Q05BaTBxQ3Q1UHpxVFVqVHc5c2s2OVMrZGZ5ZVQ4ZTIr?=
 =?utf-8?B?cFFWY0g2U3JkcmVzSW15bjFFTzJ4RXh3TVBXeTZpcGplTTBvbXBFanpBaFk5?=
 =?utf-8?B?eDJmdXl5cWdWZnYvZjJyL3FqNkk5bkJ1STZpbUxRM1hWOGJGWHdTQzdVbnRS?=
 =?utf-8?Q?ZLbYQ/qMFQp8rOI/+JeSTh0Veq2l8kU35k9yxMf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1156b57-19f1-4117-1074-08d8f2913db4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 09:01:29.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sEbBlEWxJXA6MhIYnMv7X6+Dg/b9huQ7fy91j0qQoPfcPU4IZkd4aux+qfKwN7wYuFjdJarBwOYcHbQKr5l3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

On Fri, Mar 26, 2021 at 01:45:57PM +0000, Andrew Cooper wrote:
> It has not been a dependency since at least 4.13.  Remove its mandatory check
> from ./configure.
> 
> Annotate the dependency in the CI dockerfiles which are used for 4.14 or
> older.  Drop the dependency from Alpine and Ubuntu Focal which are new
> containers in 4.15, as well as dropping from CirrusCI and TravisCI.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think it's worth mentioning in the commit message the component that
required xgettext in the past.

Thanks, Roger.

