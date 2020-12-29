Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39A2E702E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59862.104968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDYd-0005nC-88; Tue, 29 Dec 2020 11:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59862.104968; Tue, 29 Dec 2020 11:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDYd-0005mn-4L; Tue, 29 Dec 2020 11:52:55 +0000
Received: by outflank-mailman (input) for mailman id 59862;
 Tue, 29 Dec 2020 11:52:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuDYb-0005mh-Ao
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:52:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e378c5d6-1381-4acf-9556-9319c9dc62cc;
 Tue, 29 Dec 2020 11:52:52 +0000 (UTC)
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
X-Inumbo-ID: e378c5d6-1381-4acf-9556-9319c9dc62cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609242772;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ff6MNuGfvvGg+Zi0RA9AH6v8CtB3DMHchWF5cgvCwb0=;
  b=CEoPHzBa25ZMfuHRSgqcJacIPlMGjPxPp098dCIMvuRq2MB5L5i2pz/s
   oJhV6m1zmGFEemVc2MgTMqWYiVJXzJdJaladQnpGw/BB4yu2pW8iniLEp
   LKnyS9MaHmec3dsTxDrNn6RXQk3NBAzC+rXo3pXe8rrm9k6o4VewoGBdY
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: x4XN6Jd1ePoZpnXy0Aa7J28kPzIeULdzQEqrrwkpSmGuVZb4clME6ABAS/bInvhOh+l9LMCNb7
 2F1dGZvVXafScPTJReu0hzPdk1POtKOz53x6Gqq4TIvNKeMoDFS8Qn4BFqj0SrbY0UcaROmQgW
 hjC7Qxzukn0Cqtddz1XX7S6EV6QSK5yRGyiyRoEo8wRaJ7RsLCBhUtVBkWxFICJfD9Nh0/aov1
 oaNIzeJbTL5/vlBzsVREQ1oSbU96WKRJsALyljuw70FPwEEHoE0IeyWliDqbbOx2KQlPYsMEni
 /7k=
X-SBRS: 5.2
X-MesageID: 35337718
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="35337718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/8h129szrsmbb4CoSgjJ1EdQ77/SdeXPTWMWxNUneXDf0OGZHKde2mfZbv/vScp50pUr/NZmKp+XAqK03EM2cEf8dxCag1+Ip/aJy410ELwQEMmRkfp2SP1mu4nogesYKHOxezhQ8LlnQlbG/kNzUz7XlKUhjR4TjjLIwLGe38nAGRfoMd0TLyv2R3Fsi+ILkOhD0/Qx+Babfkvh3ViWgIC+WTUzjhjz5F9bQD3SD1dHrWEjPSJT6WvECzsy/6Wq88exFmuWFnlRVWMZVtjxfhfHaz7ZUxFmWR9zGE6PkqLALMCoYBSE72vbbAthaKAP2cUXi2Tnl8auQQjs2I1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMO+j9fnXhMTz0TphLYNM7Lq3Z2h/FnovwmDaT5f9T0=;
 b=BbzbMKdKBCSKkS4myCieCus/i9vnK8BN0nkztjaAV3d87lPGSLx5kt1IGDucTBG5M/cYTGKOIOUBB/03dwzSvJbFv/dHxujdiot+TuXH+Zk3z2PuYkNstRimnAFVValKhWWfi5KaX5wa3Uuqm+ypMaakrkJO+jW9lHDCppaooVW1P5cYz+l1IfDz9QUYk3pAcnCnXagHt1ioDrux1nP8721f8wviMOMEJpVqNt7sNxliRFYbNIh0wXxJGD5au3gwUUyi9j0TYNh+SAlT4J3XufP++xWBRxxcbZZZ0iQdr2V+ryZRhuTOzyTSJh1WCdwgGEwdkIsDw//rSvVCoTIZJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMO+j9fnXhMTz0TphLYNM7Lq3Z2h/FnovwmDaT5f9T0=;
 b=DfOtYjXTDAEmtVWQyDoqZINNuMTHBbVn6nzPIqeCrg8Fbgj0ebyNLPi+4jAsizU/iHdUlKMHTWlJVA9yOXmaBU5YPUB3StTeBX84645ICV+BVRdwh4T0+1mXa4lgqcFIsXIkvtwltAvNRQNhxqYUsSRhdz86I/9eyP/oFEq7Qfg=
Date: Tue, 29 Dec 2020 12:52:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 10/24] Make libs/evtchn build on NetBSD
Message-ID: <20201229115243.itpzsuriclqiljs7@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-11-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-11-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::27) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ff57643-8720-4e5f-daf8-08d8abf043b8
X-MS-TrafficTypeDiagnostic: SN6PR03MB4590:
X-Microsoft-Antispam-PRVS: <SN6PR03MB4590ABCCD5D60E35FE547E518FD80@SN6PR03MB4590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e8mSRC+oU2wOZj2FdNiYLd2613AVyToDeR9y85sf3m98nZDQkd5WVHG2amn1czNOHvp3JF+CS14GY6+0Md6w9zpI/o/Aj0CLL6rpQ0zK9vSeNAXULpHeX8UNDtTRQ0qFGq1WLMHhX9prrkYCbKOWikdwN6lAJCMvq8x9b4k1AWXaXLjH1OXnmkSBJyn4ptP/dEtXwgWyV+sYJHUw/YoaemrRBCmfRnaSycsrmFqrBk3ZqQR8sp5imSfxBtRdQlXEsBV7fgRQFL9PXXvTChyfDbqjzSoQ2JMW+IueFlNgWAKbOkmJnMs1dtimnLHRIGSAS3LVKHgz2y3Tdho9QC+W5hQ3JD5T24p5HFNhv4BRi1m7VxudXbC7YqS1ED8sdRoy/sAE3R+vP65CqYWNEvy1Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(316002)(83380400001)(8676002)(86362001)(2906002)(186003)(66556008)(1076003)(6496006)(9686003)(4326008)(5660300002)(16526019)(6666004)(66946007)(33716001)(66476007)(6916009)(26005)(478600001)(956004)(85182001)(8936002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z09MRTlOTW8rbngwRTliSTBnM2Y5R3UxOHZlQlVQWFpzM0Z4dS84WVlSTERu?=
 =?utf-8?B?eXBLV3EvcWVUMlhIWWovL2hsMmdRV3VLejB1bTBNRENzcjhWekpvWklWT1E2?=
 =?utf-8?B?ZmVmc3RSZ1Y2TVdPVnBFaVBFRTB5RmVhVStmTGs5Qjh2UStUZ2xHT2tDSGky?=
 =?utf-8?B?SE5Fa0NqZ3c1OE5sc1VVdGxERU45ellzZnFMakNVSmlFT04rdlhKcEpEMjJV?=
 =?utf-8?B?dkRUbEk0anp1VVRxM0tiSTVkaitsdWY1WUw3QVJqKzVMWlQyYmtQcDdIRit3?=
 =?utf-8?B?K1lYZk9QVndZQ0ZtL1JndXlrR1NQUnd1MFk0SXFwdjNEc2NVd1BrZFppNENR?=
 =?utf-8?B?S1FpSDdiNDhuSndJTUI4WTd0cHlJSlQ0Nlh1SEprSUdyREVGTkdqUE8weXUz?=
 =?utf-8?B?MEVlSXBoRkIwTEpLWDdDMnpKSlo5SWdFYjdXR0JqVlZCTHFva0o2aXhJWjB6?=
 =?utf-8?B?b1ZNY0d1ZzFUVVcvZi9aZUdNeUk5bm5aSlN4UGFlSjRId2d2V3ZkV3l1M0xs?=
 =?utf-8?B?MWdSbml4em1UMDZycHVaWEJuUUQyZmNXWHp1Q3BlUlc1UU45SEZJeFpUaS83?=
 =?utf-8?B?Zi9iTzN3R1BTZWNHS2sxTlRlcm1qTzB5clEwNkRHZy9lWDY3RU1NNjNyY2tT?=
 =?utf-8?B?ZVpVMy9ERGVsVGlGQnRuZmZzRnR3UG5WRG13aWpjZ3FwZzYrbm1WcjdKenow?=
 =?utf-8?B?cStNbUVacmRlV2tNK0QrSGVnUzRtQlFSUEhBZjdSdFBTS3Eya1pxSTNLemNU?=
 =?utf-8?B?WDVqSkd3QXhUSVZFMFBvUFh5ZlpyQSs1bXdzMi81QjB6MWVYUVJVV05wVmNP?=
 =?utf-8?B?RzlhdlV5WUYzNC9MVFpYNjdrYkNQZHdpdzRUUkJEUGxLTVRBT3Nzc054ekxO?=
 =?utf-8?B?Wk11emM0bEtCd295OFVNN2xWVHpKNnhENnA5eTlkR1M5MHk5RUliSWt5QXVW?=
 =?utf-8?B?SUpVSFRVRitjM0N0Z2xSVitVUXZwb3pVRHovODlCNkg2MEQ0akZXUVJDRFlU?=
 =?utf-8?B?M0JUeXJNV21tNzVjdFVkT1JwNDJ5YThoQVozbVcycTlmMHBKSWdoTVBMb2ly?=
 =?utf-8?B?OHdTWE9lb2w1K2pUcXNWOHRmNllHQVo2b3FyTkJPRmNFc2lHOURYNkhpMWM0?=
 =?utf-8?B?VVcvTEZ1WnBRZCtnanFrNnhpNmFlMEJOM3hSaE9RVWZsVGZUOTF5azIrKy9J?=
 =?utf-8?B?c2wzUkRwRW5aeUp2VmR6SGEvTHkrWmN3RFMyeFdUM0JQelJ6SUN3MXZncmQ5?=
 =?utf-8?B?ZVNGN1hKWlQzbFN5TzZDdHNNVnFoUzZUU1VtVHVoUUdaL3k1T0FPa0l4TVpo?=
 =?utf-8?Q?MnDRnkd6Co2it3XHI10cCVtxDR88pJTIyu?=
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:52:48.9156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff57643-8720-4e5f-daf8-08d8abf043b8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZAaMybeY6GRXktXs/6VG4Ufs7TEiNy6F5P3eMW7B7UtHWQB3TKf1atTOMQWiYFPUw6nP7X/3G8zd5J/u9oANA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4590
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:09PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/evtchn/netbsd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
> index 8b8545d2f9..6d4ce28011 100644
> --- a/tools/libs/evtchn/netbsd.c
> +++ b/tools/libs/evtchn/netbsd.c
> @@ -25,10 +25,10 @@
>  
>  #include <sys/ioctl.h>
>  
> -#include <xen/sys/evtchn.h>
> -
>  #include "private.h"
>  
> +#include <xen/xenio3.h>
> +
>  #define EVTCHN_DEV_NAME  "/dev/xenevt"
>  
>  int osdep_evtchn_open(xenevtchn_handle *xce)
> @@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
>      int fd = xce->fd;
>      evtchn_port_t port;
>  
> -    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
> +    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
>          return -1;
>  
>      return port;
> @@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
>  int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
>  {
>      int fd = xce->fd;
> -    return write_exact(fd, (char *)&port, sizeof(port));
> +    return write(fd, (char *)&port, sizeof(port));

I'm afraid we will need some context as to why {read/write}_exact
doesn't work here.

Thanks, Roger.

