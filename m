Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7CB4741AB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 12:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246622.425320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6BT-0008AM-PI; Tue, 14 Dec 2021 11:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246622.425320; Tue, 14 Dec 2021 11:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6BT-000881-L1; Tue, 14 Dec 2021 11:41:27 +0000
Received: by outflank-mailman (input) for mailman id 246622;
 Tue, 14 Dec 2021 11:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx6BS-00087u-9s
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 11:41:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3033453-5cd2-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 12:41:24 +0100 (CET)
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
X-Inumbo-ID: c3033453-5cd2-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639482084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=RohtPB1UjVwnzrfRWCirW2a3bXeTQxQ879ydkM3kt7c=;
  b=EiVQrVrNQPdGzfN8PJSJxGESLXO+tBe1x/1ogpJgb9SOPPLK+3pWRGqT
   +p6nBojiJnlN+N8gCm1vP4+xsUNC0qMZEtA4m53Xs6aY4llbIcNaFojdx
   Or/BINdpBUNAqs7J5Hj/u7f53LWg+e5XmlE0U+3BQ5LSXL4I5Lu9l+6Qv
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bNrJJbYwc6rf+JWM64rwKXsAcMWUa+0sEIrPGYEn7VUhqptoOK1oe+Xsmwd1IJx5gx0m0zR5rB
 hbBWea6jEG/VHKV8rwyKQceGfzdZvYzm5gC5H6CvcZYMuiEj/PJsQ/d2lVzKbg+v2eW0IIWzh8
 GYAGIaHW9tkfq5SzEeiqXL/NxSDdp5V1+PurIpCX4L3BRZDBIPgSdaGzOjbPJh+JTfNp7Rkwo5
 xG0GQJZYfMY+mTfbW5E6RVRi7DLijvi4TJ1S0Dr0qQUgJuZbWMEJDK6o3gDAQtrELRg4Kiy7u8
 JkiTdIFSaZugZsC40KOFOuQN
X-SBRS: 5.1
X-MesageID: 59475194
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CBGquatlAEPoyr7m7tnxnTaGsufnVKFZMUV32f8akzHdYApBsoF/q
 tZmKWDUPPaPYTSheNAiYNnjo0wHvZHXnYI3QAU9/3sxEiND+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy2IThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplvp+IZjsSI7D2sulaVURHHiR6Ao8f0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25ESQquHN
 pZxhTxHSwvyTTdwIgsrNrEXurexqCDDbWZUkQfAzUYwyzeKl1EguFT3C/LNc8GObdVYmACfv
 G2u12f0HBAccsCewDyt83Swi+uJliT+MKoQHrCl8v9hgHWI23ceThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvQtt/cZeQc3y
 2WjkpTvWCNitbmqayu0o+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpAif21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshSXflhdwTXGY3h+Y1FAd7fb1UwZnY1QPEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/QmP9joU5l0kvmwfTgAahwyRoARCnSWXFXYlByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfLcyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClY8RTx6VaaOmehJlk4Mt/09q9okN
 0qVAydw4FH+mWfGOUONbHViY6noRpFxsTQwOilEALpi8yFLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:ATWZqa+0Y5RkBRK5zoluk+FHdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPhSQRI+Lp3+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+memsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lodFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNyN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wuJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB2nhkjizypSKeGXLzYO9k/seDlGhiXV6UkYoJlB9TpZ+CRF9U1wsK7USPF/lp
 L52+pT5fZzp/QtHNFA7dE6MLyK41z2MGLx2V2pUCba/YE8SjrwQs3Mkf4IDN/DQu198HJ1ou
 WGbG9l
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59475194"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa3lw7IwPQK1w5gU7ki9fPsgoGzSGTinEVznEY7fqQwaVnN19RY1LIBP9TDuJdGp2ApAfNcDDMGJZYGpAFfx3d3cSuUPaaFlfEAZtJWl+acj1RmsNIV7DHhNFmbtZda6R4e+2Zd9oEAJ4EOzAKkgidGMDY85AxNhklaq1QOgDDjHRr1RUgf80JdtcNPdr4B+6OwS6Wmnn8jKmVE6g35Ym5tmWPI5aJRORGEzkR0/9bwhh5qpy8iX1tlP/yXPQAigja8zDrVlFIXGZBFS4sSasBoPYO/buBwu9gL3+h4KrFINWudCSpiYe+9jvbGrua6is+/crMHZVYBUZh9FMG7xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+8BpJzw0eKICSZuO/VYrw03LPgsY0enNxrFAfUBmiY=;
 b=gDRSBFkD1u4u6LvkG/KC2wyD95EqyE355CHPp6xiDqpX8a9TT2nXbYocZKiufzJXuNhKpne9vGXuUyFEUr2coYgkPuJpe6q/uiN+liB6p+IucGHHamlo8KCmNH30HZ7C0/0nuGUlaZyWRjZSHEBZGnOJKSUY60l8aV5wKpCPHlZaKo9xD7rmYndwo4b7qiyiUJbGCZ1ONxrD0KyfSQE/EedDkhbLzPXfe3MaD4fFU3NaFq56ucvmym+1FNG38XqX5afIioi35NNOzFm1jdQEovQS+B/hvsLoaWzt1GLerrCOqTbsxQ86bCRC0ixNipYmsKtIGVZ4Gt2ywMwmxJlhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+8BpJzw0eKICSZuO/VYrw03LPgsY0enNxrFAfUBmiY=;
 b=YC3nxMZ/E4gnXyN+1dJ/h1lyuNWZFXt8/mX+bLgfz2QjvaQCPPOnBCrEh2U42f5JVz+cZkTD1p/n7Yt6oeNfdNl4G+eTVBHKDG7uWjf05U2tLgqpdEhPiJ2ZlXhcRk+Tj45cpxGalSliyHEenIUca1BSd4z7G05GmWXzooOafVQ=
Date: Tue, 14 Dec 2021 12:41:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YbiC2m4d+2OvK57J@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbdsAy0huMXBjJe/@Air-de-Roger>
 <265f07b5-03e0-a8a1-a665-1fe35436f7a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <265f07b5-03e0-a8a1-a665-1fe35436f7a1@suse.com>
X-ClientProxiedBy: MR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::23)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7ae954-7493-46a8-c739-08d9bef6a578
X-MS-TrafficTypeDiagnostic: DM6PR03MB5083:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB5083BE878F6D51327A9CAC738F759@DM6PR03MB5083.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XxeE0aWowLnoiKobffuNf/wZ5Sx0Nlxv+bcXP8pnHCLBnIi5A99XH0Ekq4Ex9guGRk/Dci+X6wGCPg2T9v+op5z8e/iE6+zEpN2vaQASxD83QESgc7pC85aounTIAzCk2LxsGhTN89tHrmSiWu83LeJtMHmb7uE2jG0QM17z/+tsGcSEQWtzn+tkrBsHCh/Hxqd9Dz0sv3GvEEsMdpeKaPApL6JGutfeWrUPbNQL6AfttnstAA717GC3y0Hg8DcB0m+QqXqnRx2F6tfppuxMCkwgCV6Z4Xw8nd2r+zxk3Y0NCcUl23XgCRRgUL9J3OaCZrNEXAOuMaIwkCu6PjcBwmumywWbf/bH1DRe67JiLeD6aGAv9l71qwQo0pcgnVLXu9E7mF1AUteOYVG02R9cQRZcR7yUmdPGYX9QlIT4gsySw7EudJWj6ST7P/r4aVQr4Fzrocx8Nhp1/83nejvZlHgmgaFM23eQ0ZqyXLV9v2L7QrTqU3D9dFYmYyV4PvNohTZ0r75Ki8kGWzyfDnVJHN4gHKE0OEfC5AJ59NJylr7k49Hv6rZ/ZQY87vmJ8BCf9md5eqM9V66WMerhcNHL0WBniLhYTlvJFLvrCahQmk3frxOVfM1wzk47pf5ETvTO2I3o+m9dSbZLUwTXrH7W34ySiaB4YvoqhtYNIYjD3GsM19FlEogN/hALwlvE9qD3+VXDDUwrzB7vnEdM1rju4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(53546011)(6506007)(6512007)(8676002)(86362001)(6916009)(82960400001)(9686003)(85182001)(54906003)(66556008)(6486002)(316002)(33716001)(26005)(83380400001)(508600001)(2906002)(66946007)(186003)(6666004)(4326008)(5660300002)(8936002)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhqTkNYWSt6UG5SejRaUDVNeWR4a04rZW5ZWHU4MFY0aVJXMWNqU2poajRs?=
 =?utf-8?B?enRCT1B6SHdBM3VaQ054bkZMRTcvNGlsWldOczFRQVVtQ2ErcGQyRU1UTGFQ?=
 =?utf-8?B?c0JOR0trUjNRV2JPSUVoUEVTazNrYkNsdVpMV0hNc0oxTzJ0cjJ5MERqUUlY?=
 =?utf-8?B?ekMzMk53aStIS1NibHdTRHRPSUN6cGJyWWkycytqVFR1UzNZSHJVdmpISlBo?=
 =?utf-8?B?REZ0M05pdTNFR25XMU5wRExFOEgvUGZyTFlmam1XRENlOVE4L1NuNUVrdzlo?=
 =?utf-8?B?RHNLaTBPUVVCUGV6SkM1WmY2YktHYzhJRTR6Mm1vQndOT3IrV0FGZGxtYy9G?=
 =?utf-8?B?UFozMlY4bUZyWDlzMUJKSGpYVUNQRjlQeFlzeW5qSXhaOVdHWVd5RTBVYk42?=
 =?utf-8?B?RFUwQ0NEclB4TU55enExWDN0Vjk0MTd6T0FTUkxwNjdqSGc2SmpBQVovdkpw?=
 =?utf-8?B?RjlYWGdCMVczYUN2R0hyM3VhcHVoWk5pZGpQa2Q5MU1heHRDdHdEN2xQZi95?=
 =?utf-8?B?U0daK0VQVVNXMHExRHJUVXUwbHEvQTBIYU9MaUhuN3lqZmZ2cityd2FkVXBM?=
 =?utf-8?B?eDVwbHhqSDFjTC9jaFVULzUxalg0NXhLUXZPS1VpT2sxTEZLU3R2RHhSRjdk?=
 =?utf-8?B?RzI3dWhnOUJnQWcvbFl4dVpjRjBGVUp0MUwreFNZM1JPTitVbk9pSlNQbmY4?=
 =?utf-8?B?eTUveHoxc0pwd0JQaVRVeksyeDZDUVpQU1NTYUNXUTJ4YU9LQ3l0Mk1IVFFX?=
 =?utf-8?B?VFVOTFlTemVKc0MyNDVTeTRENjYzRk1TUEpaNlVrWW1nWFpKNkxqUGVwZXpi?=
 =?utf-8?B?ZDQySlptcE82T2hoSmEzNjlVN1Y0TXdFcTZkL3RRZFhTSHpaRXFuRm1nZWs0?=
 =?utf-8?B?Y2s1V0FDZEpkbkNmRDFucWRwUnhZRG9GcVVvazZBTkNNNS96QWxEckllZ3Ri?=
 =?utf-8?B?eUtUUlBmUndhbkZ5YkhvSXFNYk1NcEtUQzFoczFzUU9kcTMvZnFTbTBYVXY0?=
 =?utf-8?B?NU1Da0N6RnduaElxbVIyU1ppamFmdHB4dS81M0pPUEdOODk4Y3FveHFzdXMx?=
 =?utf-8?B?TU9qVjBUc09FamxqK3pyRmYrN25WUnl0Sk1GNktBTDBFQUFWcWlOVUpUTDJT?=
 =?utf-8?B?bXpRMk83QWltTGlKZGpMN2pvNVoxWHJJUXRZQzhUblVSdWFCUFBsWm9ib3lE?=
 =?utf-8?B?YzYxWVpZN1lqTlhPNXZybzVLVkh0MzM4S1NBeDJxU0FSRkpzUXFmcHFON0Zv?=
 =?utf-8?B?dEpET3Jrdk5pWnBMcnJhYldKNTIyakNCdHNPOGxURnZ6N092bktEc2h2TzZN?=
 =?utf-8?B?MTdjTnJESU1XUkhlWXloS1JLWjl6U3Rpc1RqVkVGM1lBdEVJdDNmTHNqdldx?=
 =?utf-8?B?MitIMHNhRkl6VW4zWDRGRlFJMnh0SlEvQ3ZudWVVQnZjOVVndEpqOVNSM0dF?=
 =?utf-8?B?aWdvREtZRmdQQzJzWlpmRzUzQ3dYOFgxcjd1VzZFM3RxeWpBWHJHK2lMb3c0?=
 =?utf-8?B?VDVwdW1nTUpLWHJQS0dCS0VtYVNGWjljS29KMDdlekw1K2Y2RW02Zk5qZ0pn?=
 =?utf-8?B?TnR5NTZiSm4xZXZFUG02N1F0OFBGdEtINzFHLzAyZUFoeWp3c0RjVnlkaTFN?=
 =?utf-8?B?STBJbkNUbE5ETFZvc0FncGI5NGk5enJBNGFwOXJYSEh6WGsvK040NVoyV0pv?=
 =?utf-8?B?cTljLy9JY01PT3JXRUN2c2paMGlPdStRdG9OaWxJeFFJT0RLV3Y3ZU0vTkdu?=
 =?utf-8?B?MldkT0RhdXhoQzlkQms0clluSTMvRDR2WkRUbmd4MkhYU3l4QTlWVWJndExU?=
 =?utf-8?B?V25mODdib0NmZ3pNeXBOV2JOZzJhMDhrSzc5QzlyemoycEZoV21WTCtVUEdZ?=
 =?utf-8?B?dWNSdFBiL3R0dUVLOVVkRTM1NEw5cE5MdjhCZGIxeHRoMmNmSHlSTDlRSFl4?=
 =?utf-8?B?cWZFWndTVmN1MGNkK0c1K3JYVWtHb3AxKzZmOVorUWNsb0VuSk0ycGFhc2dk?=
 =?utf-8?B?UzZHSThWRkFYQWJ2T3N3Rm9JV1JkelVwVU8vVUFJbC9lUC9vNms4TkJNNEs0?=
 =?utf-8?B?c3dBbUk5OTJ2cEJ4ZzEycEt5VTUrdm5rc1MyeFZNZ2trc25oZUxJVnIweDF6?=
 =?utf-8?B?UFBPMTZiVkpKK3ZhK2hYOG1hZm9jMUxTcnhodDdhcmNQYkhlRXMvcjM3WUF4?=
 =?utf-8?Q?hg7TiU+/vjCXPiMfTaSbV7k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7ae954-7493-46a8-c739-08d9bef6a578
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:41:19.9274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foxtRQdvv4cDmkI+zPXP2SZt04MeMYPmPpqP/6YUAIwMCmkaZHRgARf2X7i85HBYZEWlJQAgDEgp/DYy8F7qiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5083
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 10:15:37AM +0100, Jan Beulich wrote:
> On 13.12.2021 16:51, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
> >> Page table are used for two purposes after allocation: They either start
> >> out all empty, or they get filled to replace a superpage. Subsequently,
> >> to replace all empty or fully contiguous page tables, contiguous sub-
> >> regions will be recorded within individual page tables. Install the
> >> initial set of markers immediately after allocation. Make sure to retain
> >> these markers when further populating a page table in preparation for it
> >> to replace a superpage.
> >>
> >> The markers are simply 4-bit fields holding the order value of
> >> contiguous entries. To demonstrate this, if a page table had just 16
> >> entries, this would be the initial (fully contiguous) set of markers:
> >>
> >> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> >> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0

Could you expand bit more on this explanation?

I don't get how such markers are used, or how they relate to the page
table entries. I guess the point is to note whether entries are
populated, and whether such populated entries are contiguous?

Could you provide a more visual example maybe, about what would go
into each relevant page table entry, including the marker
information?

I would like to understand this instead of trying to figure out from
the code (as then I could be making wrong assumptions).

> >>
> >> "Contiguous" here means not only present entries with successively
> >> increasing MFNs, each one suitably aligned for its slot, but also a
> >> respective number of all non-present entries.
> > 
> > I'm afraid I'm slightly lost with all this, please bear with me. Is
> > this just a performance improvement when doing super-page
> > replacements, or there's more to it?
> 
> What I wanted to strictly avoid is to have to scan entire pages for
> contiguity (i.e. on average touching half a page), like e.g.
> map_pages_to_xen() and modify_xen_mappings() do. Hence I tried to
> find a scheme where for any individual update only a predictably
> very limited number of entries need inspecting (some of these then
> of course also need updating).

Thanks. So there's some extra cost here of having to update those
markers when a page table entry is modified.

Roger.

