Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880E35DC5C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 12:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109656.209347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWG8D-0000SW-7C; Tue, 13 Apr 2021 10:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109656.209347; Tue, 13 Apr 2021 10:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWG8D-0000S7-2M; Tue, 13 Apr 2021 10:18:53 +0000
Received: by outflank-mailman (input) for mailman id 109656;
 Tue, 13 Apr 2021 10:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWG8B-0000Rr-CJ
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 10:18:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de04f11a-d410-4289-81f4-d07d8fdd11cc;
 Tue, 13 Apr 2021 10:18:50 +0000 (UTC)
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
X-Inumbo-ID: de04f11a-d410-4289-81f4-d07d8fdd11cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618309130;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CLfKNd5HSc9D5hxHF/hBETDpGRKJlxNOvTASS164J2Y=;
  b=AVwbr867kKH1OaOICdK3ZRXcdLp+6eBFejvW+Ym+KQiUd1JbBmo4AOXz
   BRKGlid0aA+e8EkEN90pIMynFzyUgMiLngkOK3DgN4tp7mu78DDLOw9tY
   Eyt0ySmnFQGlThJ9JdBONmnUTefLNqNMvL+IK4NBqaKxeqB9lLdR0nP0m
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NW0nqppfGKRk4C2Lp0e2Wdpvc134YzMEO1oms0isUmUGIPIu39BDizW2Mm0e1irbe3LzV3tljF
 /fgTzwuDN4Axcwb57RWmwJdhdP3HjHmcrJ45xnDg8W3eMiK3hc1LrevvOxa8OY8XVOYG/rUYjK
 Th+CWbZzPZ1S8fA5zyKfIsWpLJdZMOJNvxWQEtgDOr7SP3Q4UriCZb962L7FitVxinF2eQUZtY
 fTTMv8U8FL2nsumLqZXxMXZcf6JiGYZocKPaugfhux0GGMwwy44HmI0NFToC2yT6L3DsJm9Dy5
 WQI=
X-SBRS: 5.2
X-MesageID: 41305187
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yBx7Cq5gqCzBZ64jzAPXwWyEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbTqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH76GL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnk4j41VTRTzbA+tV
 XUigCR3NTZj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+2SVTat7XbnqhkFRnMiO7xIQnM
 DIs1McOa1Img/sV0WUhTeo5AX6yjYp7BbZuC+lqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmKzoA3H69fFTB1snEavyEBS6dI7tHBDTZAYLIZYsI13xjIlLL47ACn45Io7ed
 Meav302fA+SyL/U1np+kNrwNCqQ00pGAaHTkUoqqWuokZrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO1ALdZEZObyM3fKSx7XKm6eSG6XYp0vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg17waVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZIbFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PxE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 9M2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQButy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9mO+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt98TF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh8rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N9gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRLEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH28PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhhF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTcS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qKqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XvKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNsr3JupRd9llDs3YC64GDUWWF+WDep/al+bH10KXiHjc
 PM7O6C8m/yiQI1gaX+KA==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41305187"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLzeQD1fYSYTv5AeNTowbKhactxReYLK59S+tL+SaHI3Xz4ASfyfo4fQscY3Co06CjUvCCQIqXDfAxk9Z5o65ml+lsGuTVu9Njxw2c6AYQzZHSZGdXCcKf24XeVFoILsNzfTkJ86zGfE/HWZtbwOnKbUtDjny2agg0RkJfJpf86caxSXgyzOI1w/XQmOMp31PO+E8rkbk+NUD0tohUG0nPJsxMeO/Y/vzWpkd0wwEaYUsrcklM8cr4p1Qd4QA9S8CrQW5XuoQpMU8U5j8MctqV+bq037RyRUGh6qcbqvv5SCiLtdIuqD4Cv9VWiWFEThC30s+KmrQ5F17rFKkCcBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjIqRuj6qL85WDmtAGe/nxNv4yRU1JrU/iuqUWrAU6I=;
 b=U1iswAEFslcOB2uplTzRuX4QA1nKl968jCV2hmaiK69A0lOjW/5PEnkDHcTQV1kCgXhFhSIt29L23O3MwSz1RF40TBTIbRjK6vu+fJ35xa67PfTJ6fQUJWYlz7V2c+j6dz/SF9YYaioCSMyao30AgrQ9PLSj7XPZZ33e7EpNDcu+i1X76JSCLu/9ve4sXvs6Yc8qUdEy2EYb7m1vuExLkCNmCuh03PjY2SMYyW4pSDzQihF6ScTZ+NABlmT2uooHOQwcMe0+bELYM85vTJF15HU26yt63q1IWZZhiu7CN3Enw+leI+X0D1hrRrIYqKS36c3sMCWz0BzCNvMbJgtiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjIqRuj6qL85WDmtAGe/nxNv4yRU1JrU/iuqUWrAU6I=;
 b=XFahCHGKnH327T/q9+2qXPqP2bzk58pnkvHXTpgMT421e6lBgG6mfZ/GnSn/yP0lgmyaJDF+flt+o7pa13ut0HbBMzvsmwfERhl1TLIXVZj4Bb7Qy96m+Wme+1r1jr22KHzxSYuGFfB5zX7A2uXma8oiCELXavgpqxC/hVrQHhM=
Date: Tue, 13 Apr 2021 12:18:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
Message-ID: <YHVv/wyD6BphWaU/@Air-de-Roger>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
 <YHRnvQvWJ7QsXVgX@Air-de-Roger>
 <c07396f2-b0c5-092b-4e3e-5f452c453e56@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c07396f2-b0c5-092b-4e3e-5f452c453e56@suse.com>
X-ClientProxiedBy: MR2P264CA0192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::31)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98196949-8a03-4eae-6d11-08d8fe65856c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2556:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2556387515DD914C4493140C8F4F9@DM5PR03MB2556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBY5DoFCnDrPqdOpiMP/38QuOEA4JYgk7CKMbNCen5nR3iH/ggOaqa041mEh+zi3j+z69ALivX2H5HixCEi5JQxGGZWLByw+Y+icrCNBGcQ6wo2JMWlC5e7wbdI2dUyv0erJrO55S4IFANpkX1JB810UKl9d9DpFDc0SCzoLvdnP/9P/Bf/ng0sLwKl/FW3CmXI9cjLtNjszWTHrXsEYwGQyM+XEfUATEr4hRxFDV+JPh/LZ/owInRvuea7My3vdH3NW8J0d3ifnWAYFGhkazxmF07xWzGp1MFKyKblhM5bTpCb7hCrTKVIliSmekl0xhjoVyj+zLorDBgy3s7E4s8DsCv8Y6RyiG9G3x6D5gbFe5Wu4F03KsZo86c9CNVKgOwxTm/V1QQPX93F8CN2X/WCXMmoRRzQFxff1RVXSAKgelE8bx60Z7nRtc21oq13OhgWXQ3APw7da6GbDRS2XH+mhXjt+h5gSJ5QmjZmOzB6gqhUu/6FNRNmNz02sJXCffEE9UxhkRghSqdTV77mCp6plvtR6v4Xyfa3J/78rizentTwFVyzg/IhGNwzzcnEOBK0uUlF7m8az2cSVPuLowHYRr9dTkW0GQqCIaAkN0qlEBQ9iNYQa3qTSZnag5L6grh38CLTaS0Amoa7xv7W3nfSUETjid1Bg14XiZ5nfhrTTdFKoBOOxc1D8GOXE/XKk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(39860400002)(376002)(136003)(346002)(66476007)(26005)(316002)(53546011)(8936002)(5660300002)(6486002)(66556008)(186003)(38100700002)(66946007)(966005)(33716001)(956004)(86362001)(9686003)(2906002)(478600001)(6666004)(54906003)(6916009)(6496006)(85182001)(8676002)(83380400001)(16526019)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlpvd3FaNHIxTHgyMVlqYTlEamc5OTZaWXNEL1IvenpLdjhzVEtIUldyZjVU?=
 =?utf-8?B?T2lRemF6UWx5cUtGclg1dlBSQWMxNUtENUZvcFBGNDM2ZGJmWnIrL3BuQmM2?=
 =?utf-8?B?UlVpV2s1VWpQV3NBc29Cc0VUWnZacTFUTDJnUktZWm52SlFKZjJ6d2dFbnhs?=
 =?utf-8?B?b2xiNVVtYUNpUm1GT1IwREFUMW9TWUFCczU2eHBDTW93ZW5laHgvM3N0RU1K?=
 =?utf-8?B?cmxZL09PZGladlJ1R1JBQUQ1MC9PcHlpcTBudlVZRHBLOTFzTDB4aWZkRmlB?=
 =?utf-8?B?K0pWOTFBc0t0TjFmOTg2cWxEcHV1Si8rT0NobWgwSlR5bTBCNkY4ak5SMmwr?=
 =?utf-8?B?OVpIRTFDRmh3NFVlRkVZUXBFbXp0VWJtMkNlZWxaUkZORDBMZzlwYVl6SVRL?=
 =?utf-8?B?QTV2WlJ6T2pXSEs5Q1NCZDArQzZLQ2JESzdUMmxkbGt3aGJyWk5MNW1zRkFS?=
 =?utf-8?B?YS91MnFXZnVoMTluL1h2MmgvR3YzRnQvS0RGWHh4ZTVUbHRMMzkyVDY2QzRp?=
 =?utf-8?B?RjRDeEJRejBVaEd0ak1tMkk1TFA3a0h0eEZuSHRlT2FkTlc4TnNod25oMmZN?=
 =?utf-8?B?YlVSZ3Y0QStYcnRueU5QbHBoYzFVSTlLakpBL2V6VUpXSm1UQTFQN0o1UDk2?=
 =?utf-8?B?VE5OUTdzekpYQ1M4Ym9XUE93UzJ3NEhBMTRVOHFRdFVwYlpFTm1HYlhGUzEy?=
 =?utf-8?B?QmppU0V6dTVPL1E4QTU3b0M0ZkdUQTl1RzZXRGtDWm9WSGtvZkdvWDNJNGVy?=
 =?utf-8?B?b1lyTnJUbVdrTzVDS0JudXBUNVl4TDcyY2xFK2tDK3ZDVVlKWlZ1UTEvWmZB?=
 =?utf-8?B?SzQ4a2IzQUwvWUZCV1Z1ZXJTNjFLaFhld0QrWkdSd3dlUXdTQ3JKYXV2Y2xO?=
 =?utf-8?B?Zk5xdTYrRUFCOWQ0U296OGRlK1ZoRGRteVJPNEpjZjNnK01IcmY1TVdlZkxm?=
 =?utf-8?B?Uy8zV0VScDRFcCsvcnhoR21rZnBKelFqT2hDYThMK3BVaDMzbUNNSVJDZXhV?=
 =?utf-8?B?OXAxODBFZG5NelRvOGlaUzZ6a1JnRklvUGJpZm52T2NZSThKaXFVMVZXQ0dM?=
 =?utf-8?B?bGlEdmdZa1JoMjU0WG8zd0FtanhBRWcwbUs1Q2xxNG16WE1ESlRQU3NYRENi?=
 =?utf-8?B?aUZzMnlWNkI5Q3pZNytlN3A3MnA3bTFvYW11cWk1K3NibHJXZFBHM3p5MVd5?=
 =?utf-8?B?UUlVd0tGbUd2TU4zNDN3R3hVc0I0YmUyd1RKNElQOU5tUlhwcW9TcE52bzB3?=
 =?utf-8?B?SkRjMm9KdmNkU0E1T1ZON0pKckVnSjRuREYyVXN3SHRVUUlpSlNJbmdtbnFj?=
 =?utf-8?B?WU84UVNsQXEvWVBtOGtvVkVFV0xXWTl6MVlzRHpnd2owSEVkajVMdW5SUWtr?=
 =?utf-8?B?NzNOeXFZdE82TGN3QUl2K0Ixa2pIQ1ArQzNhc1BCbCsxVlk5eDhWOVg4YlFO?=
 =?utf-8?B?UU1tWFhvZzlsWjRReGFKMmpsMlVNWDdWcEFFUjZMK2VtZDVXYmd4VC9hUlZC?=
 =?utf-8?B?S3hnNXJvMEZneVpTejBlcytTSysxUmFTL3E3Vm96UWZkbDZZTGdiNENZVHFy?=
 =?utf-8?B?NjFhT1FPMjIybmtoRFV1VjRMN01PVGFFNlNzdHlLWE9POXRlZWs4VE43Ny82?=
 =?utf-8?B?SmJEdEdWN00xYTZzbFlKbzRwdERkRmNTaE0zc3F1RHo3bGVNSklTOFVZeFBY?=
 =?utf-8?B?bVIrazYvQlhWZkFVNTRhb3JvSHdPUjNCeitETFNzeU9sbk96ZkF5SXBSNkow?=
 =?utf-8?Q?3B/nDFgJ6nPDp9guKR4vp/y8aW4PmbJHSms7uq6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98196949-8a03-4eae-6d11-08d8fe65856c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 10:18:45.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PGnbXq+yH5oTQgxpdncpXQMFT0MXVaUpYXtbGehmaCCgFeufGFDO2DM8srjyuXbb3VzikGEBeSa0+Fn8aCdew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2556
X-OriginatorOrg: citrix.com

On Tue, Apr 13, 2021 at 11:24:09AM +0200, Jan Beulich wrote:
> On 12.04.2021 17:31, Roger Pau Monné wrote:
> > On Mon, Apr 12, 2021 at 12:40:48PM +0200, Jan Beulich wrote:
> >> The address of this page is used by the CPU only to recognize when to
> >> access the virtual APIC page instead. No accesses would ever go to this
> >> page. It only needs to be present in the (CPU) page tables so that
> >> address translation will produce its address as result for respective
> >> accesses.
> >>
> >> By making this page global, we also eliminate the need to refcount it,
> >> or to assign it to any domain in the first place.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> >> ---
> >> v4: Set PGC_extra on the page. Make shadow mode work.
> >> v3: Split p2m insertion change to a separate patch.
> >> v2: Avoid insertion when !has_vlapic(). Split off change to
> >>     p2m_get_iommu_flags().
> >> ---
> >> I did further consider not allocating any real page at all, but just
> >> using the address of some unpopulated space (which would require
> >> announcing this page as reserved to Dom0, so it wouldn't put any PCI
> >> MMIO BARs there). But I thought this would be too controversial, because
> >> of the possible risks associated with this.
> > 
> > Really seems more trouble than reward. Also there are systems with
> > MMIO regions in holes on the memory map, like the issue I had with the
> > Intel pinctrl stuff that had an MMIO region in a hole on the memory
> > map [0], so I'm not sure Xen would be in a position to select a
> > suitable unpopulated page anyway.
> > 
> > [0] https://lore.kernel.org/xen-devel/YFx80wYt%2FKcHanC7@smile.fi.intel.com/
> 
> Yeah, I had seen that. What I'm having trouble to understand is how the
> OS will know to avoid that range for e.g. placing BARs.

No idea really, I assume they expect that you parse all possible ACPI
devices from the dynamic tables before deciding on any BAR placements?

I still consider a bug that the pinctrl MMIO region is not marked as
reserved in the memory map.

> >> +    {
> >> +        const struct page_info *pg = mfn_to_page(mfn);
> >> +
> >> +        if ( !page_get_owner(pg) && (pg->count_info & PGC_extra) )
> >> +        {
> >> +            ASSERT(type == p2m_mmio_direct);
> >> +            return 0;
> > 
> > Are there any other pages that could pass this check? I don't think
> > so, but wanted to assert.
> 
> "Normal" extra pages have an owner, so no, there aren't any others.
> If and when any appear, this may need further customizing, albeit
> generally I'd hope further pages matching this pattern would also
> want similar treatment.

I wonder whether we want to add an assert here to make sure only the
APIC access page receives this special handling by the shadow code,
but maybe that's a bit too much?

Thanks, Roger.

