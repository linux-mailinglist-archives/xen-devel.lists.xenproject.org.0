Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC84D4E40
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 17:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288476.489161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLPU-0001F7-Sj; Thu, 10 Mar 2022 16:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288476.489161; Thu, 10 Mar 2022 16:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLPU-0001Bu-OO; Thu, 10 Mar 2022 16:13:04 +0000
Received: by outflank-mailman (input) for mailman id 288476;
 Thu, 10 Mar 2022 16:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSLPT-0001Bo-5m
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 16:13:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd8c87b-a08c-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 17:12:48 +0100 (CET)
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
X-Inumbo-ID: ecd8c87b-a08c-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646928781;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UF2mG6fP4M+bVNhG6XTeSIsciHp0NzyisAMoElppjYU=;
  b=H3SrYfd0RjCy+XfDsdBZt7IKZPhbYWAifUJq2Vywk2XC7iafY72ai9Y2
   YwkEMqJu0+G3Uutwt9fuG0YpnFzHuXw1OB+ib873UsnzVPkO9L32G9gC+
   nBByvF+Dp5w1mWjWl6mLewz1hZE6NgqFBbKD4i+IpK7O3K17idgv4rgcz
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68288830
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZdkzGq4OLBqG4nh8UDy08QxRtOHHchMFZxGqfqrLsTDasY5as4F+v
 mEZDG/QOvbbMTPyet13aIuy9UgPuMXTz4NgSgY+/ngyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPgW1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurToR113IoDwnd8NVgRfECZ6F65Bw6T+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQTayON
 5pCMVKDajyRYQxvCmwQJqkhkf+QmnnnWQdqmH+s8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c99ZCegz8gyO4qvS/QeCB2IAQyJBadopr8s/T3oh0
 Vrht9H0AT1itpWFRHTb8a2bxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP47HvTrkvDJHArgx
 i2Nry86rbYUttUygvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlyXTVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkV4JjHOwFCHzBUOSX25XI550pUQHPY65Ps04lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EVfo3kWPtHL9DgeFDKsUCKYX7H8CTI/OPi+b2WZJoYe1dbAvmgh4RsMtoXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSNTOHwCkOQOLrTrClM/QAkJUqaNqZt8K90Nt/kEzY/go
 yDiMnK0PXKi3BUr3y3RMSs9AF4uNL4ixU8G0dsEZg/5hSJ8Pd7xsM/ytfIfJNEayQCq9tYtJ
 9EtcMScGPVfDDPB/jUWd57mq4J+Mh+sgGqz0+CNOlDTo7YIq9T1x+LZ
IronPort-HdrOrdr: A9a23:PJ92JaNhCNHgDsBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="68288830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoD/6ngbl98lgbyYtsqhNyQBXs81y0OZL2Y/pySM3LXfsp4oc0wblt2RrQpXeIld8T8N8vKdtIyfWq0qP3hknxuOBcIh2oW6VTKio9d/ccq6OIWP1Siiek3uKC1FYJex0PbHVe3fvkUuUGV9WHrigUlitGwwmundPAaHmRrGKIZtILg4ZcbFf7BJkFvAqLnmO2bw1d4L5QhKpm0QfdUdXqQ3wpN4vOa+gSLPwRzXbydxyVGILdzMCZBt/w6fJVJAwt9BnEhlXSWFvIiuWeE3VYEQLXmx9ZaJrTbvAl2gPByVrT49Oyge6lV2+oGAsnTNomgJO4pt6sovjA6NbhKRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubPUDdE1tqwSZQ4RBqrQwbEHk0YQGJqF57J4SOVISPc=;
 b=fjPxginXncGUhRGe45CwNi800mlOmmZbLJtk7pV8LRhxp0VGE/QPMLqKVcTCgXxNfZeZY3oEuBkzYBPCzjwCmyiuw6dUT1mESzf4HIJ6ObkqIA8lZExFrFSU8jtVIaGuUeYV9xt63zyiljDUzw1/lZcNh5WiP0v/Aqkdbfwv5EmkkzqGQIh2oTXZ3YbLRAY6UT8UwuH8cFFVwEobhryzk6dXq8ay2VVOzjsrBTaaVOH+tCgzcRm5jToJhirOpjywf7RCSOEPOtMtDseir1209Q7PWZPR672RwqjoUdu5uawdh++4Ub6PMJVtiDn/LH7KkqW75VHOhQaUGK83/mOt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubPUDdE1tqwSZQ4RBqrQwbEHk0YQGJqF57J4SOVISPc=;
 b=Fkq+AbWUCrrTn05Ytdo2hscYbB901ptKoGMhITHBX9e1B0y1RdUtfsD4/s2BF42+oaksCvFczpvfOO3Und6D2oxwRNgg348vailWt0nngPqNlnd0Ui11QriH4pKoij8pkBXmFR9ZIssazZGCNKeuWwTHm5FqgpuRR9zrYH+aEXo=
Date: Thu, 10 Mar 2022 17:12:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <Yiojgxgd4amSjHog@Air-de-Roger>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
X-ClientProxiedBy: LO2P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e402bf28-9917-42b1-5a90-08da02b0d69a
X-MS-TrafficTypeDiagnostic: CO6PR03MB6243:EE_
X-Microsoft-Antispam-PRVS: <CO6PR03MB6243CD4AD7D6E54A5A1F8AE78F0B9@CO6PR03MB6243.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/L9lUmGAvradMq4zoKCR2qmnObmsp3h5hn8S5fTo2/WHQyXJJckJe3UdevhU4pEcB58teJtaXaFOhwR8TOhDk05YNZp7lylQDNurOdrUjMfERcDbJicEoqOFTvSvMBIk2YvevACx9pr+FA2E51/a6CsGeW3jGOzNWGUp1y+Dze02g8zWTKjIvucHj06iPfzyjOLuFFz0mabwo3HR8v1b0N7wybyTBUieY9BoW2xN7kBiUwpXaX6G/KpSZDQNofusdZea7UdGCRVuHdtw8XCKMvFzbpUyI0tr9XLZ/4Zs/BnJWtjMl60y562UOnSJDj0UHeohM9Z7nqyebDwyUhT/KralYp6FBDjaTtBQTAbjj30J0wZLewOLxTGkZ3E/3qNYWqRVDMp09yXrxG5QMt7gYRM9TY0gpbk0HAnOsH3z6DT9YStZ0nmcV0IYwCFbhIvDENzqxcSg2cmKJOT1XndpyLX79OpiCcBKGuD8Gjtk3yHJ5BSJcFBMD8r4Pg49qHURY+8Yy76kM4I6n8iJT3tXI/z2BE86N1XMTIznC1LqGmghtjq7TdUbwp93D30X3sGIWanNSKIJvurDlsbFMcuV3X1eQ47XxPBhWvsGQySqFW0AoN7fD/NAKnP1HwQsfq99L+dx1uA4kJgF6AdWm7XlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(8936002)(33716001)(508600001)(82960400001)(2906002)(85182001)(86362001)(316002)(6916009)(66946007)(38100700002)(54906003)(6666004)(53546011)(6506007)(9686003)(6512007)(186003)(5660300002)(26005)(4326008)(66556008)(66476007)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1BJMU10d1M0UVR0d3FNY3R4amhPTFpvL3VDb0JhaFc4WGVNOURDazNjNjBC?=
 =?utf-8?B?a3M0cEVpdmJJcVVZU2NIV1poNlJBTU5SSTVjVmRtdUk0dXZvemEwaW5FNTRx?=
 =?utf-8?B?WGhkQ2NPU1pUQ2hkaVFjbXdIMVJOUjh5dVRYV0lSZk45WDNVbmNiUUxBTFNJ?=
 =?utf-8?B?dnVENU1pemVjN2Vad1F1dVJQajJmMTlvbVJuVkIzQ3NuME1ZQzNMRlduaUV1?=
 =?utf-8?B?T3IrR1lRQ3JERDlrbG9tZUU2RklBeklWNlVWUGRYMEFuM3ZtNHF1LzhmWXI2?=
 =?utf-8?B?VmkvdnpUejRzbWNzR0NiRHpBTVdzc3FOVXJFa2RBc1BxTDVrU29OZ3ZxUHBi?=
 =?utf-8?B?dFo0Z0toSVZIRFBHcThxam4raUlQSDBocEZNZzY5SUZBQTdRaE5KV1JrMkVp?=
 =?utf-8?B?bGMxN1g3Rm1oYnZwdzV0WFpzZS94aWxEdkFGNERUdnJUTVhCQlExUmRFY1Rz?=
 =?utf-8?B?SEk2Y2xZOVVLckxrUGZiV2tPOUx4Zkt1S3JuaktKNUVTZXNVT3gwWTYrU25v?=
 =?utf-8?B?c0N2cExGRzd5czVId2tOQjhxQlFtR2k3UndJZVhaUks1NFZSZnk5ODRyR1U2?=
 =?utf-8?B?dlRSbytpa3pnOGU1UDhoL1dkbUpUcUFMc2czZ3RtNUIvSS81cC9OZFlDZ1kx?=
 =?utf-8?B?dGE2YUNHYXA4UjZwYXVOMVdsb2N4bHNtY1A1ZEpuTEIxQlRRbmtyT2pONnlX?=
 =?utf-8?B?NE1XNWIwYmVCZGxHVE9SQ1hlbWIxTS9xOEJzcjg4cERnNDdud1BHVEphS0I1?=
 =?utf-8?B?Rll5MEdmWTExVzZwZjZiWk5NbW5mbXFIRThyNUdaNXUvNDNuQVVLWUtjNHA1?=
 =?utf-8?B?RzlIdnU3aGpEek1TeE01YUp1UmhXY2pBSDU2dGRCbHJFdW5FbWkrZ0l0RUpH?=
 =?utf-8?B?ay9UOFZTSktmNVBtemRETWJCVU5GMlZJbzNYcG1Xc2pyNW5SNnVVVVBKbmxh?=
 =?utf-8?B?UFJ1VE50L3ZBMXlKeVhyZjc0eldWZ1FSdGJFeWYvQ0pkNFdSR1MydmUxdlpt?=
 =?utf-8?B?c0cxZHJJWGtjRldDN21neklsN05DQVlJUVNuNXBHdUlJQnEwUFhPN2EvVE1R?=
 =?utf-8?B?aU5tMGFyZlBjN0QrZitTVXdHRTROWHpYczlVazdxN2JHenVIeUovNUVEaEZT?=
 =?utf-8?B?YkNoSERIUFdNQzRBSnF2THc3S3F0c1RoVzRNblRzTlBXUUtpb2Vaa3UzKzdi?=
 =?utf-8?B?RVdiUmhFY2djUmtYcldzbGd4K3BTeUVlTEZ2cnlPS1pycXZLZkhVeGNWV2c0?=
 =?utf-8?B?TUhmdVpnM3I3amVVeStQYkdOUXZlb0pwaXJhVFlhYXdRd2JLRERjdU4zRjFi?=
 =?utf-8?B?RExWMmFSMFJTTVFQRm9BSHRTOWZRYVVkZnpHYUVPL0ZqeHlCZjlJQ0src0cv?=
 =?utf-8?B?cjBBTEljWkxBbzBOblVKeVFNQldDOEx5MTU1ZEhlMUI5WSt4L3RObXRmN094?=
 =?utf-8?B?QWpmTmNSVCt5ZDh1bzJyYjZtaTROTG9mcE9JcG94eEVsaGFTRXEzTWpsRkFj?=
 =?utf-8?B?Q3YwdkR1SHl6K1pMa3RRako3Y25ncTJVWUZVTFRKQlY2M0dObHEyb21IRDZv?=
 =?utf-8?B?M2ZocHdQUWdPaWlUTmhsOFFTVGwxMVVPWjNLK3EyVG8yZ1F6ZUpmSzZKaVVO?=
 =?utf-8?B?WHNFY2NOTC9qUTVoMG42dXFJQnA1Wjk1MzJTZ1hIWnZUb1djbm0rOXo3UFVJ?=
 =?utf-8?B?UEFpYjlBY2FwdmZLcE45UitVVkJvU3FxeUk5N0ZJK3NZM0RvNVh0VjdDaUpG?=
 =?utf-8?B?ZEtoNnA5N0JQWXIwWHdpcWsvSGwvZFhnZmkwOVA1NnQ1OFlGcFVHRFIzMVVR?=
 =?utf-8?B?RTByRndVcjFEMjlwVTI2Qnd6Vk9aMzJxbyt2dll3c2I5N3c4N1dIdW56d1pM?=
 =?utf-8?B?REwwQlR0OUxGT0ZrR1lLaHlRb0lxUFk1eXNoS25GVXd6ZTVPRnJ3TTFNQ2Qy?=
 =?utf-8?B?Z3NPRGZJZVppd25LK3ZOc2hUMXRYNXJrRkVqNCsvRVN2QURDQ0ZDWW43UzFh?=
 =?utf-8?B?ZkE1dDBZV3ZBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e402bf28-9917-42b1-5a90-08da02b0d69a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:12:56.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shA/0JCN3ZG5zmAotBIWlQ6JEYRlQpwCe2OAeveXjS0K20fm37rGitJTcBJ1hehuk2A0W6XqMLI3qJ2LWZT5aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6243
X-OriginatorOrg: citrix.com

On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
> On 10.03.2022 16:47, Roger Pau Monné wrote:
> > On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
> >> On 10.03.2022 15:34, Marek Marczykowski-Górecki wrote:
> >>> --- a/xen/drivers/char/ns16550.c
> >>> +++ b/xen/drivers/char/ns16550.c
> >>> @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> >>>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >>>                                             PCI_INTERRUPT_LINE) : 0;
> >>>  
> >>> +                if (uart->irq >= nr_irqs)
> >>> +                    uart->irq = 0;
> >>
> >> Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blanks
> >> immediately inside the parentheses.
> > 
> > If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.
> 
> Down the road (when Arm wants to select HAS_PCI) - yes. Not necessarily
> right away. After all Arm wants to have an equivalent check here then,
> not merely checking against nr_irqs instead. So putting a conditional
> here right away would hide the need for putting in place an Arm-specific
> alternative.

Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just yet.

Roger.

