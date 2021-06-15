Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E33A815C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142218.262491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9SM-0001Fc-6n; Tue, 15 Jun 2021 13:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142218.262491; Tue, 15 Jun 2021 13:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt9SM-0001DL-3U; Tue, 15 Jun 2021 13:50:18 +0000
Received: by outflank-mailman (input) for mailman id 142218;
 Tue, 15 Jun 2021 13:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gB8e=LJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lt9SL-0001DB-BR
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 13:50:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc9030fe-bfc1-4a70-ba33-c68a7cecc3a2;
 Tue, 15 Jun 2021 13:50:16 +0000 (UTC)
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
X-Inumbo-ID: fc9030fe-bfc1-4a70-ba33-c68a7cecc3a2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623765016;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=URIgTHhJpwzyh9L+sH0hxeIYib9J7dwAEmJz9FMtIx0=;
  b=d5Acr6QwF0VIEgGbyOycL8yX5y+7Ofl05MailEEL/tTYjCNcmgjUFQtp
   rme1uy54TrCcDhD5FO1HypA7kto2Bbx6Q6q5LBRrXx0TB1igAbFBxluMC
   kdm1AFj3zKgBq9Xl0hvtXgpy1lUCbHFXei67ymJ/Kz18QuKSV+UawdqfB
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vsqxLTZPmXluUffK1IiDGVP/48xF0QmS24uqOrIlZkSO6pj83jvHU4oQSBhW8KWO9GKLnfhDOQ
 cQ7tagr0snYZjOuYFABeg+KaybqnMabjwUNAPicnrx6WU2dRbH4C/gPo56Fgc7Dk+T2uWRxpIT
 mkS0Hh3Qgq2av2PSNxJpp+ea8olmJRwaOXmC2eA6CxoxVLomFIrFwrOipFXWtFRdPi3cpP889U
 6s7zHoZrDO4ZURr/76ujpHkOuC0prAWxofhHN7tpu1jAoq9CB/QMEHTN0uJtNFKckT5xHrkxVm
 F0U=
X-SBRS: 5.1
X-MesageID: 47740791
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:08ITlKCY1cabRfnlHejKsseALOsnbusQ8zAXPh9KJSC9I/b0qy
 nxpp4mPEfP+U0ssQIb6Kq90ci7MD7hHPtOjrX5Uo3SOzUO1FHJEGgm1/qb/9SCIVyzygc+79
 YHT0EWMrSZZjYasS+52njALz9K+qjkzEncv5a7854bd3AOV0gP1XYbNu/IKDwseOHmaKBJS6
 Z0s/A3/gaISDA9Qv6AQl8YQuPEu9rH0Kj+aRpDPBI/7hKS5AnYtYLSIlyy8i0lFxVS3Lwl7W
 /J1zbh7qHmifu80RO07R6I071m3PDM8OEGItCQgc4ILTipsB+hYMBaRrWeoCpdmpDy1L9/qq
 iVnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoR8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4K8uZj1kIMsjgY1q3M4iFXBuYdI99eXBmcQa+d
 xVfYLhDTBtABSnhj7izy9SKZeXLwkO91+9MzQ/U4quondrdTlCvjQl7d1akXEa+J0nTZ5Yo+
 zCL6RzjblLCtQbdKRnGY46MIKK40H2MGXx2VipUCLa/WA8SgDwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3f071E8WB0JBC7xiIGQyGLH/Q49Ab44I8tqz3RbLtPyHGQFcyk9G4q/FaBsHAQf
 68NJ9fHvemJ2rzHoRC2RH4RvBpWDEjuQ0uy6IGsne104j2w6HRx5zmmcfoVc/Q+GwfKxLC61
 M4LUvOzet7nz6WZkM=
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="47740791"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsjMqnBpE3VSt0i1CBcnJ5zAmGwcvJhauTibAfo+mxSzamlQZliOizjH8PjGE+QZh+CVx5GsYIygI8XbQZgrk3Onk9mPzroXzhbHs1v0pSNmsjWcO0m52biC3GLNEkN8328ZNGNAXHfHw+Zl09gdtq4ua0QD3yKbMxU60s++Kh5nuWiviGu0e3t+fW3/A5dCNxqXffoGPNmy4BhKLQsyKpON4vhgVEU9Tz0xznchhxwNmg+UbuN9Aoq4VkS1vPGUegJNw5ak9bgw7TBaEGEDAWiZms2SsVYIllnN1PizlzWxkIu9vNgkqPmqhlVtnfx4WfDThL/pAzYFxg0deE6H/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ry2vwoqwKaS725viSjbrqwk+RpNR3ZoO/f0y2jFHWLc=;
 b=CTn1R1WvJm0nVEdUPZnFmcFtuWrNgYURXGah6r1P0jV6UXEGIKJH0wCGs1mbJI64vSCEbaYWbNDiCLSDiXD+ilfz5xOkD6liKs6Qo33Jgwlymwy6n0U5OPjWiv0YuygXVkUqD5VLezwLFvd0GooH9uh6vhbDT/G9Ij442f3bB1Q0D+PFwd15JcKPxkGLTj3jL5Z6VCk+zFWc/SM42DVj9R1QHaf1Vzk417l8flgRA5U4Z1/il5a7k93jsH0XxahXPVikaNc4bMMVsmt4Fgj0GgQI2dA0XmidaRPH8YPS6lMI+AUGHONxPMpX3Bnd3lz8CnreGpMi4CIrvn7c6qvV2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ry2vwoqwKaS725viSjbrqwk+RpNR3ZoO/f0y2jFHWLc=;
 b=CI4HeRJUzbqZg4T9pDtO2coyaX+7z6LfCXwWuM63uhRSVmZ3MqqYV7DgQcc5itiQLzZLBV+uCPK7wtDdA+vmzLMp6d2Tcl38ui83Twr80kRQpPbaGYFjhjqDvc14RMS+N4D55+tKj3xPC518vlldnJsxkRAET8QRhhIin7oWeaU=
Date: Tue, 15 Jun 2021 15:37:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 0/3] x86/ept: force WB to foreign and grant mappings
Message-ID: <YMitM0QaLTf4d2fF@Air-de-Roger>
References: <20210528173935.29919-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210528173935.29919-1-roger.pau@citrix.com>
X-ClientProxiedBy: MR1P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad347fd7-7152-44fb-8d2e-08d93002cadc
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5968E91BE7C388FAEABE188D8F309@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWkvAl0a4Uj4fgw78a9Kx5Em/wMJEUHoPVmGpIGW12SlJTGgyEdUB+luAHp1JwSmd7hqrvLr6O/bEo56dnXM9gmkggCWGzluffnG7gDqXRsCo6cq+X0AuEvqge4o5L1bUoEFmCjqIrPWMvtnxa+muco53wMX/jhVIpUR2MqunztoMp9f0jlIoMD0vywx//vaPUuBuOwxce4IVcIRrMEy+hE4R5Ccbg2Rj5W5QKs+yNw+hYzvoz2W6WURVc4U+A9kL8ubvYUCJF/wwhzuHf4212wdyfD7tMw7LBbX6nARn0j884fM6Nk9xmKBSC43O9psxFvnsRgPhqzQK5YeYLhscfX7ArZzUnCf6aitsznyUKGpxg+qoe/Xno5NbBq6dkbyhgwJ+FEtdWFX/zerpWmt/mJr0ZM3E5i+vnNRENYjUA5dUW5/ofOlw9QFwuSUyHrIP22JWw4hDAD5MzDsZD2Js1nKwggE7nKMRmUkEXtX+x3VQ7gjvo6XDmsoStTgAe0FRUlNf0313oq8uaXocc/HcAWHIKXa45p4w+ChLEc9nGJ5hvqmzgKkooeN281WneSN9/pmMZI0QN/UpserfhOEHGtSQt/bbGV3W0Stw/5Pa1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(376002)(39860400002)(396003)(346002)(316002)(85182001)(54906003)(33716001)(66476007)(66556008)(38100700002)(66946007)(9686003)(110136005)(6486002)(6496006)(8676002)(478600001)(956004)(83380400001)(8936002)(4326008)(86362001)(16526019)(2906002)(26005)(186003)(6666004)(5660300002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3dQdVlEWS9WeFB5RFQvdE5CRGFDdFhvZjVBQ0pFY1phZXEreWRLKzhNMFpO?=
 =?utf-8?B?SVN5U1NSdEpLYi9oUndmQldLc1B0YXFIZVg4dEpIbXlobWtyS0dENjlOeVpL?=
 =?utf-8?B?d2dpMFhEaklGUGNRMXVBdktmVTVQY2hRVG5WNjNRakU4Rk5sNUI3Zkw0eGtv?=
 =?utf-8?B?TXV5RnBYZE4wVmFVR2I3K1BqUERNOFNoanNSMkUyV1VCWUNESDQ2dXpaNi9q?=
 =?utf-8?B?Z3hvVGZ0SkZnOE05Z0l2SklXWmJMODZtUjl0YXd1QjBVV0lnbEh4cDk4c2F5?=
 =?utf-8?B?dzMyTklDcU5zaGxuL2hDWUpiSHk1QUxzT3FGUUVJQ0R2VTF2SGo2Sk9BTVRL?=
 =?utf-8?B?VWpFV2NUWUhTSGZsRno5RTd5NEpUcHFmdnBlVjNGZHIxZ3B1bW5qOTNtejdL?=
 =?utf-8?B?TG1BQ2JXUk9NUzE1TEtQL1lDckZxbWRHc295UGZpQnFWQXU4VDBPTFVrcWll?=
 =?utf-8?B?dGJrSk5Xbkp6d3J3RDBhZ2gxTjFCU1NiMjFUNkRVWFNHWVFic2FTalcrUXFu?=
 =?utf-8?B?ZlN3YjB1dDE2VnI3cVhCN2ZHam5TQisyYy9JUTJ3SHJCZHBvMUF6OHBYeVpL?=
 =?utf-8?B?MzZNZmdqbDBuOEFCMWg4NkJyQllGNVIvYkFlVldocHJ1d0FUQm56Mlo0SUhU?=
 =?utf-8?B?b2QwVGtWVWNLTW5vUXVyOENDODFYT0J3OFlNQjI0L3c3RHBRcmVmN0xRaTBE?=
 =?utf-8?B?Mk51dkUrRXJmWVUrSHk2dW5BNE1yOHV0Z01GZ2FnWFFUZENzR085T1Z5aWhR?=
 =?utf-8?B?aDN3MFdKMEV6S0VGU1hPdUNwbzZEbXhGZXVIRkcrOVpiTDFmSGdVNnJPa0lU?=
 =?utf-8?B?bS9VbFJpMFJZL2xTVTZxK3F5V2VrcVRLbnU1VEUzLzlvczdndjRTb3habk04?=
 =?utf-8?B?ekhyTW5oWTRFL1JJSmptb3BwbHlISVN3NmJrVlJYYTF3VkdmSTJnNzJjSjB1?=
 =?utf-8?B?ZUJjcW1KNGpNVmU3c0JlQ3orS0pxanlPYUQ1bjBUTjF1M3BQTkJiamNPRVBu?=
 =?utf-8?B?S2tucU0xNFNQOUJWYXRRWjk0eVBqdDZIRzVQVnpLSG5MQmVnM21tTmNDNUdj?=
 =?utf-8?B?S0FLSEswZkJYaVBFRTVRdHVkWnN1RkFjd2E1MTdkcCszNkhoY1BXbktCbFBN?=
 =?utf-8?B?MVJ0d0Q4aWNRYzJqWElkbFJILzE5Q0Z2Vm1jK3dlSVRwdVpPM1FYR0JlbjBY?=
 =?utf-8?B?K0N2ZlRmcjBFeVVFZk1EKzN6dnNlVW9YZjRxZlIvV0d0Rm9ERGFvMDFwVEUx?=
 =?utf-8?B?Q3E0YzdmUHBlQXhjNlJPQ25YMnh3bDhRald6MjRUcUwxSTVad05OcUNJekxC?=
 =?utf-8?B?NnB0ZFNGalo3UHhScTNhTzZyNmlPcmF4YnBuSXZTZkloYWxwWmhzNWV1VWMr?=
 =?utf-8?B?Vk5NZ2VDRXBaR3pWa2U2RnJTME9UMVd4RlVqVzlUWmw1VGowbS9ZZ1RoZ2N2?=
 =?utf-8?B?RlhpRDF3bEY0amp4aC9Ea0oxRU1ObHpNWXA3dmJ2OFIvSC9hYlBhZ2JEa3FX?=
 =?utf-8?B?cWdHWFlYSnZJRUFjdE1pN2QvVnl4TVdST0owRTFsR255UERVS3k4NTIyUlc4?=
 =?utf-8?B?amE0Y0s3TnFpOGNiQzVZS3lWT1dlb3k0OURReTdsUU95VktoMVFSWEVtSFNm?=
 =?utf-8?B?NFlGVmJnSElibGkwd09LY0JSaE1JYlkzeENpbm4waDFoWTBWOFFmZnk2M3Z4?=
 =?utf-8?B?Z3NrQkEwOWhWcjhwclZad2xReTNXRXlvV00yWGNZMksrdFdiYXBIb2VDcnhR?=
 =?utf-8?Q?39ujkfgpIRKZJVATI2pWk3MenGb46382GVFnXjw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad347fd7-7152-44fb-8d2e-08d93002cadc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 13:38:00.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mLiLHWqcVE/DzTEy22zQNKnuzA0r49z/NCEHzJ6qIpTYq15Mgy/F755bfTDvdgEzCqJfoRTCdNln4m8oOnMBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Ping?

This is missing an Ack or otherwise from the Intel maintainers.

Thanks, Roger.

On Fri, May 28, 2021 at 07:39:32PM +0200, Roger Pau Monne wrote:
> 
> Hello,
> 
> The aim of this series is to force the cache attribute of foreign and
> grant mappings to WB for HVM/PVH guests. This is required because those
> mappings will be likely be using unpopulated memory ranges in the p2m,
> and those are usually UC in the MTRR state.
> 
> Having the guest set the correct MTRR attributes is also unlikely,
> because the number of MTRR ranges is finite.
> 
> Roger Pau Monne (3):
>   x86/mtrr: remove stale function prototype
>   x86/mtrr: move epte_get_entry_emt to p2m-ept.c
>   x86/ept: force WB cache attributes for grant and foreign maps
> 
>  xen/arch/x86/hvm/mtrr.c           | 107 +---------------------
>  xen/arch/x86/hvm/vmx/vmx.c        |   6 +-
>  xen/arch/x86/mm/p2m-ept.c         | 145 ++++++++++++++++++++++++++++--
>  xen/include/asm-x86/hvm/vmx/vmx.h |   2 +
>  xen/include/asm-x86/mtrr.h        |   7 +-
>  5 files changed, 147 insertions(+), 120 deletions(-)
> 
> -- 
> 2.31.1
> 

