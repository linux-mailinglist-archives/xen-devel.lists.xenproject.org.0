Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3028388E60
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 14:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130069.243865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLdG-0001py-PP; Wed, 19 May 2021 12:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130069.243865; Wed, 19 May 2021 12:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLdG-0001ng-Lo; Wed, 19 May 2021 12:49:02 +0000
Received: by outflank-mailman (input) for mailman id 130069;
 Wed, 19 May 2021 12:49:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xx4F=KO=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1ljLdF-0001na-38
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 12:49:01 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c154c066-27dd-4785-be6a-d7c02fba45e8;
 Wed, 19 May 2021 12:48:59 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JCkasF030803; Wed, 19 May 2021 12:48:57 GMT
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38m9bggkay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 12:48:57 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14JCl0GH181888;
 Wed, 19 May 2021 12:48:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by aserp3030.oracle.com with ESMTP id 38meeg3xfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 12:48:56 +0000
Received: from DM5PR1001MB2236.namprd10.prod.outlook.com (2603:10b6:4:35::18)
 by DM8PR10MB5495.namprd10.prod.outlook.com (2603:10b6:8:22::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 12:48:54 +0000
Received: from DM5PR1001MB2236.namprd10.prod.outlook.com
 ([fe80::c93a:7a62:bc1d:9a34]) by DM5PR1001MB2236.namprd10.prod.outlook.com
 ([fe80::c93a:7a62:bc1d:9a34%5]) with mapi id 15.20.4129.031; Wed, 19 May 2021
 12:48:54 +0000
Received: from tomti.i.net-space.pl (84.10.22.86) by
 AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 12:48:52 +0000
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
X-Inumbo-ID: c154c066-27dd-4785-be6a-d7c02fba45e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=v8Mv0YxUg0LT0nZYkE+Wu3XOZkdXRRDwH3J3yR4Cs5I=;
 b=e3PTLyDCt/S31hS/tS4sqElzrkxn1AeTChg+lHbRLcLVxA1lqihxgz5FUi45C4cUaxXx
 wkkf0D3Q3fr3agGZj2/8XgTxQJ5AuFz/Zjbr4860vM4lJwg9P3dr0H8nJgslvaRYd463
 Qv+rxp84VWr4iAlrKcOTpM7hwnl9/GaXr+mz4STpjxESgF12tU7P29VLNHL1zLDsLt2H
 3DltivIPRhg4yNHQtPLhJpizjwtwkZ/qSQ3Cr31cPWtlQJEJTvojn+Mhj2XRWoJByiiQ
 1HVE9SMU5AVVpoX0qmhbo7yb4r//Dp+8KaZEOyk3IisqsvMB0piwaC/MgAf4/PItQGI6 NA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSTTy3LCUnD4IgrQNGXY+VnNBXj+cc7qq1dTBJd14lHIa+tl6X6IntDbOxctkGRkxMUoG4q66d0TFmlnIUCFhgSmc75sRrim2AjWtCFF0hvCz8uVVUFD8ChRDjjDB8tBAQX9CuVLfIKuHKOmecaIBvlriAZQW50SZ4/9oJd354pjsPbYXyidNb5sRRAPXXfUjUlvdGYUVxyLZ1AsE5GBxAn+5swiGjoRCJwXwgr8mlgDQKzkfazyo9Z8B9JPDNDvpSvSZmdsYVJUvQ7udxskvAgsd4F5KS7dCRDmusw/vOV/75G5bYLPVJkHbDf8s/1C/1/8cyIkdKXIxE8REVDYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Mv0YxUg0LT0nZYkE+Wu3XOZkdXRRDwH3J3yR4Cs5I=;
 b=SfrfoAr8WfTqLfMsyCMdZdL8KH0alP2C/3C2zjZ6e0Yh2tCVyCxQ7y7wvgZAOupBeUxp8JLmNLRqOpz72VQkEiYAEn1P1IJ115D7+g3CwR4hX4IVqLZ5CT3xXJfDftBxlquaMY9Ex4SJdorQLBoJtQDGhJfOZf6HUorV0wvP1UHZhEhd5/1OHiVzVAkE/Lsj5Zda/TlYU1VV+prceLPH9F0Ch1gtutxrukILPuu1MZB+RXHpeFq5VJJvAFCjAjPezYToOlL422oCeOYJelftKxnXaQfQNKzDPYyPgD8b8AOCxqA74/N5oeRq+zY1FR+eEBuFNQEreBZedsfirgHhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Mv0YxUg0LT0nZYkE+Wu3XOZkdXRRDwH3J3yR4Cs5I=;
 b=zQ9WfJ7XTotVyicqpc1R5q4NTAsaO1H0QhaBXf165sJ0SKSTFGRIck+Klo7Kedu53wEqvXzsbKaXhr3x0hQYz07j9ArtIUMNT6iZLI7dgXs84vE6CQsUzFuYIkcVIeauZ2j3ZLOcL1IgpmgHlZP3GMqhf1MBlfZOySuY8LjYJQQ=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=oracle.com;
Date: Wed, 19 May 2021 14:48:46 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
Message-ID: <20210519124846.go3zyqzojsaj35in@tomti.i.net-space.pl>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
 <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
 <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
 <20210518174633.spo5kmgcbuo6dg5k@tomti.i.net-space.pl>
 <51333867-d693-38e2-bd1c-fce28241a604@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51333867-d693-38e2-bd1c-fce28241a604@suse.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Originating-IP: [84.10.22.86]
X-ClientProxiedBy: AS8PR04CA0034.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::9) To DM5PR1001MB2236.namprd10.prod.outlook.com
 (2603:10b6:4:35::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f86fca12-9d62-40c8-3fe2-08d91ac475c4
X-MS-TrafficTypeDiagnostic: DM8PR10MB5495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM8PR10MB54951089CE7138C3A720AB1EE32B9@DM8PR10MB5495.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UpIC3UNWeoNNiYW6hsfKAbVDcY6Sfcj1TsuCwCfP0Q1QSPH4qoGOqbVzpJ1T/eW3l/DlbNqg0TDaxnT1yovZhu5I8wP6zXt8ImqYGmxpivp3CxdIwIg5rH0L1voAWUaJnO6NQ/l//X1Ixf6VO1qUWa/YsJKR3S/Z7XDrT8r2P672zeyXBF3jmiBG4WwEnddGgn71fSgi42E3NxHTRaN3C2faUwJtiV04JsERel//xzcggSzGiN9HjTEq2uVtmmYFwVTyqJGd9en/CuJTxxZy9TcXwrBHYtAXuOafTJ33KJjiledr7iVRd4OQNtlQ9GgTSpryV7Bh5SYKw0YtzG+sJDog22Tv080zbMKGLegLWiq2b/NcySbHp/JKKD8yldAj2o4/OsArJ1vqAOJPBHWgXhNXeDnE91BOBF8mLQ2MnPP++/NcHWnEfD4zFIAM1KvS+C6HPbYwZOXC7DrQ+YUoXnG9Y4/cKuC4hIAwY6z6Y29aP0aSAsFnKiaNmd5moQzoWmDt2f59WyHfJSr4XdXFlyNkcMBSq2sfe1sMu/F527F43hDGz2Q3TTa8ZOcRBb16kWDCcTBCmKgwQg6hCYks4clxU6DbYxSPSKo63ynxOQVkAKftmIRcK0mvSizicsFVPUs9lWhHQRHTQEAEajwAYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1001MB2236.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(38100700002)(956004)(54906003)(316002)(9686003)(38350700002)(8676002)(6916009)(16526019)(186003)(55016002)(26005)(8936002)(53546011)(478600001)(6506007)(66556008)(86362001)(66476007)(5660300002)(2906002)(6666004)(66946007)(83380400001)(1076003)(52116002)(44832011)(4326008)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mHfj4BbSx8txw6WOU0i41KqyWD5bUmpys/457d84xPg6dVNTAGRochQM+Goq?=
 =?us-ascii?Q?LZU/r3U1hktgBb8riNvfcoA9AUUTTRO4wlBF4627d1jmSJmBxujBic2ubJlO?=
 =?us-ascii?Q?MYrD0XOxHoX2zx/NofGuXIlTWPiCUM5O/+5reOl0+M/SlJaN6p6hbDDMpnH5?=
 =?us-ascii?Q?zGdgRdxQfWsEyIhPsZH78uZg/2Hs1u/9is9nO/UImam9wKHdyMlnHR+1zB/m?=
 =?us-ascii?Q?t0BQ6noV8GKAKTmrablj+/KXN1OV8YzA4xcJ5Gg4QH0Cr6Kblbhkuxlz91bg?=
 =?us-ascii?Q?JVAKkNZ/SL93Omrvu4srCqJfIfGWq26h/4X6Ts0L0Q/fo6j2SW8zrhiWyXg6?=
 =?us-ascii?Q?WpoP6p+RU/H3cnmetkQKqhyBJFKXG9i/K7v41htF3rUeGyPKwatAKsGjXueP?=
 =?us-ascii?Q?0L+tVwX83Jy7qyK51qveh2mMuHCrcKaCdzFhNGi5lRk4WehzQyEXucYwG/of?=
 =?us-ascii?Q?KjsPSmVh8v3TOX8uL8K4g+MSPgEOq9Cno0MgagwXhrBrw8yerGcUTnCeNw4x?=
 =?us-ascii?Q?5X8CqRXEO4TMWDRvzy7aYCvfAMk9lpWAm+laVYI9bAQbldC/zgQ3G3GWUT5n?=
 =?us-ascii?Q?ctxTgpcQRVdH8sOaooLhKuGYvRYBjQjb+LJVqMyosRZhQzQRfgnZ7wo6gzIH?=
 =?us-ascii?Q?9xDVTP35uvpQWx+0NXmgTfHXMWF5qSwPZAcX0dgJfCs4vS0ZaguzqZln1NXz?=
 =?us-ascii?Q?gAcdlH4hArfK2MPlonPMa8sH+/3BECXh6fKKavxyq8+A2HKMcQ2nrypkbUbY?=
 =?us-ascii?Q?IaPoUtQybNEXdOrdmtBz/n+6R8dRzKRCa/FBKMim4WJQSTDUUikbMsWEA3Pc?=
 =?us-ascii?Q?ew+G+xHE/tZvc3IqrlhLSb9eMob979GB0J5i7rZ2cUe30lbwylHlv19I5hBJ?=
 =?us-ascii?Q?Zta8Khi7bXEX7uBzjf3UpftqXladySoLLfD9aRp5bpedp8bSfNLwHLiu4tQD?=
 =?us-ascii?Q?Jl7IqAX6jxyiBnLELGiLMBhKPkr3EG2apL5rHj9TwoxSkC0yky1lbalpwv15?=
 =?us-ascii?Q?+JTfoAjBbEckmjbMxFUdldwLr8vwY+RPxqwszWeixSrIcCAt3mlMXtC3Kfri?=
 =?us-ascii?Q?KH6ffjVNaVGAed87+Ko4IB/uDi2NnGqro7qgOjTTvrr6Jrd37KR+QIV/tlJm?=
 =?us-ascii?Q?iO/n7QLOwF+Q6jiuCiU6V0YfSJTkDgY8a0v3udwM22RuoHRDwd1dv31o1Wpq?=
 =?us-ascii?Q?b2W4Vyk3YI17FNkOKC+plVsMgtkjzdfLTaiZhrPBYABCsSm6Wr8KKxzhtz1G?=
 =?us-ascii?Q?TcEmNjQ74N1dPZhYXm3TyWGOAGIaKAplmsPHp5PAi0NC3EZnCPORtraOEC8K?=
 =?us-ascii?Q?FQ31ONHl2y1GXxGCbJPf1Pok?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86fca12-9d62-40c8-3fe2-08d91ac475c4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1001MB2236.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 12:48:54.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDnk3HvdasWlWdz5/8KhOudo1tu5dI5ktqersMn8ox5DZ7oNswlgx++q268BPoiEkK1dA/wj650lOWtQcHbtYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5495
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190080
X-Proofpoint-ORIG-GUID: VaEeggWTii_LXCOwQ2A7VWi6arVPOhQf
X-Proofpoint-GUID: VaEeggWTii_LXCOwQ2A7VWi6arVPOhQf

On Wed, May 19, 2021 at 11:29:43AM +0200, Jan Beulich wrote:
> On 18.05.2021 19:46, Daniel Kiper wrote:
> > On Mon, May 17, 2021 at 03:24:28PM +0200, Jan Beulich wrote:
> >> On 17.05.2021 15:20, Daniel Kiper wrote:
> >>> On Mon, May 17, 2021 at 08:48:32AM +0200, Jan Beulich wrote:
> >>>> On 07.05.2021 22:26, Bob Eshleman wrote:
> >>>>> What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
> >>>>> in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
> >>>>> entry points into xen.efi?
> >>>>
> >>>> At the first glance I think this is going to be less intrusive, and hence
> >>>> to be preferred. But of course I haven't experimented in any way ...
> >>>
> >>> When I worked on this a few years ago I tried that way. Sadly I failed
> >>> because I was not able to produce "linear" PE image using binutils
> >>> exiting that days.
> >>
> >> What is a "linear" PE image?
> >
> > The problem with Multiboot family protocols is that all code and data
> > sections have to be glued together in the image and as such loaded into
> > the memory (IIRC BSS is an exception but it has to live behind the
> > image). So, you cannot use PE image which has different representation
> > in file and memory. IIRC by default at least code and data sections in
> > xen.efi have different sizes in PE file and in memory. I tried to fix
> > that using linker script and objcopy but it did not work. Sadly I do
> > not remember the details but there is pretty good chance you can find
> > relevant emails in Xen-devel archive with me explaining what kind of
> > problems I met.
>
> Ah, this rings a bell. Even the .bss-is-last assumption doesn't hold,
> because .reloc (for us as well as in general) comes later, but needs
> loading (in the right place). Since even xen.gz isn't simply the

However, IIRC it is not used when Xen is loaded through Multiboot2
protocol. So, I think it may stay in the image as is and the Mutliboot2
header should not cover .reloc section.

By the way, why do we need .reloc section in the PE image? Is not %rip
relative addressing sufficient? IIRC the Linux kernel just contains
a stub .reloc section. Could not we do the same?

> compressed linker output, but a post-processed (by mkelf32) image,
> maybe what we need is a build tool doing similar post-processing on
> xen.efi? Otoh getting disk image and in-memory image aligned ought

Yep, this should work too.

> to be possible by setting --section-alignment= and --file-alignment=
> to the same value (resulting in a much larger file) - adjusting file

IIRC this did not work for some reason. Maybe it would be better to
enforce correct alignment and required padding using linker script.

> positions would effectively be what a post-processing tool would need
> to do (like with mkelf32 perhaps we could then at least save the
> first ~2Mb of space). Which would still leave .reloc to be dealt with
> - maybe we could place this after .init, but still ahead of
> __init_end (such that the memory would get freed late in the boot
> process). Not sure whether EFI loaders would "like" such an unusual
> placement.

Yeah, good question...

> Also not sure what to do with Dwarf debug info, which just recently
> we managed to avoid needing to strip unconditionally.

I think debug info may stay as is. Just Multiboot2 header should not
cover it if it is not needed.

> >>> Maybe
> >>> newer binutils are more flexible and will be able to produce a PE image
> >>> with properties required by Multiboot2 protocol.
> >>
> >> Isn't all you need the MB2 header within the first so many bytes of the
> >> (disk) image? Or was it the image as loaded into memory? Both should be
> >> possible to arrange for.
> >
> > IIRC Multiboot2 protocol requires the header in first 32 kiB of an image.
> > So, this is not a problem.
>
> I was about to ask "Disk image or in-memory image?" But this won't
> matter if the image as a whole got linearized, as long as the first
> section doesn't start to high up. I notice that xen-syms doesn't fit
> this requirement either, only the output of mkelf32 does. Which
> suggests that there may not be a way around a post-processing tool.

Could not we drop 2 MiB padding at the beginning of xen-syms by changing
some things in the linker script?

Daniel

