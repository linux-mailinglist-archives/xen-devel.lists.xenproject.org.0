Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E6387C0D
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 17:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129325.242767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1Lj-0003At-2D; Tue, 18 May 2021 15:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129325.242767; Tue, 18 May 2021 15:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1Li-00038p-Tq; Tue, 18 May 2021 15:09:34 +0000
Received: by outflank-mailman (input) for mailman id 129325;
 Tue, 18 May 2021 15:09:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lj1Lh-00038f-KJ
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 15:09:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 205df946-5f22-4540-a464-fb6ddc60455b;
 Tue, 18 May 2021 15:09:32 +0000 (UTC)
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
X-Inumbo-ID: 205df946-5f22-4540-a464-fb6ddc60455b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621350572;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Rtdu5ZoquGyyJYxzdLOR3fsayeqZcUW6wAn6nNSKNCc=;
  b=UIEbOgvxdVWZPaNhbrAhk0VH8s91IFlvUTgVPZAwx4rfFFmMz3CEduVR
   xypczHdNpY5bzUPoVg5/cInExnGB4cddwdWAq5ADOCAzj/Kq3mIiR+3yd
   +e8/5Jk/+J8+fu+idGCybmYlBkZrq/PgbLuPeJOwGd19uDkYRsAkO/0nS
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: og+AtmDBftUKsvByv7n66oNp2nb/tbB4CPE6siEgaaz49SD9k40Nr5qieT7uCI31IOyPLhfEzO
 PCNtNSvMyCid8Q5gkURGriTzNwUG9A4h2cg7k0gP2Ioz9iPUIIn933rdiq7VP6N3WY0UUNyd6g
 klYLDscPAQc+juhJNP/n6njs4quRUaiQYvcpXKNEKWnvDmX/3bc/ajF+nDT2I6DHX8XEWLwrHY
 HgfLDKREBy70HGdEudJcAh9t/SeLYjWMlHZF8JqeZej6tT5vol45by+44cHRAG9QtHWHoj1LG8
 r5k=
X-SBRS: 5.1
X-MesageID: 44040568
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tedTRaCejdir/vrlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="44040568"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyMnlWtAsrJBzcIt2Rgm3gLEywE0JcdBy91wyZIImhMEJ700X9kjvJ1CEhQ+bk2zt6adNAazkhLAiDIds5oY8f5n/7Jh6o9cXuB9tsAP1l4z7BlIPpaEWiDd60BZaEJbd/yPD3HmgPua8hFDURRq76oy6B6N29NRMIPdaSbS8gJEt0xklTMxEDiPJ83e8ll0/WKVnqECCWQK9uaKXC1MY3RuSPj1qoMPFYWvk2ynZWOhqnpRY54cecqnopNtt+vFJYgAbBN77A54EbTuyCm1HaKFPvTge1wfNJu+lt2qdMqYA4QteheybVqHeU/peI0/NEgqXPSpSlEICxAoznnL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDZUmFxWengpWd/EA510qPChCg/XFq5fxaM7oEaAzFs=;
 b=eBiymLImk12kBsKQ0eFNS8YgDQkmmZknizfUX0cc3Aw8ejAQfcH/7Fntrt8AYWmv3U5VmTKt/Ugzh4DI0WmRqmAQkGfuFcyJ9WzRCrRn/k5i7Us2sfh647fNLmgGD+hnMAxPKRu9enh8PS+COxxOGRG7yCFi7PVtLi+2bK0xM/Cu+DPVjaGQutk4F/TkJaKddse29As90IyJ1OMBXNZ9Xd40Xfl1ATRRgfc/o8L5Yokocd4Y8N4iVjpxw53NtY2BCfxwMfpdILW20F3OvSmc3TH0J8oWCqAy2u5epW4AWHqBzs74khG4DN91mHWjSOyuP6/w5HQoWXYYJAj+biu2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDZUmFxWengpWd/EA510qPChCg/XFq5fxaM7oEaAzFs=;
 b=ZcaAQgEbAMugJP87Z9WLXEVLsh6rKRBT67XsZXM/rEfqIrPUpw+7zTc4ubAHqGOcBFjxc2N+KtQrFUQSnIsyAJEHg22VQpqK4AFhS/tLj5bvh0WA1AvWHTJj8iXYXiIbOdwdG1ZSHXfvHEdhmJ74OJ3ESbxGrxzt0EMJEJpYo8g=
Date: Tue, 18 May 2021 17:09:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] automation: fix dependencies on openSUSE Tumbleweed
 containers
Message-ID: <YKPYoq2p6a0avevB@Air-de-Roger>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
 <162133945335.25010.4601866854997664898.stgit@Wayrath>
 <YKO/BcUAtjSgc2pV@Air-de-Roger>
 <9160502180e3c36a52cb841520615bc7fe91b42b.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9160502180e3c36a52cb841520615bc7fe91b42b.camel@suse.com>
X-ClientProxiedBy: MR2P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::11)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ade7aeb-fb14-45b5-9b56-08d91a0eee5a
X-MS-TrafficTypeDiagnostic: DM4PR03MB5999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59993A701E16B1286C878E298F2C9@DM4PR03MB5999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/PgoQrzME+bzcfyCTE4czqJOcRQ2bxItqBT2aJ52A+1YwzcKu4SStAfWU6XUxwqgJULjfkCVdhAaTiViFE7C1s1f9aPxneYst1Xo6vYtiy+fRE/V/cQRQ6/QVX8pbnjLaweDmjSaIZNcQrAsA8o5ShCFVkBEjInupEmvmZ3C+wPM41S0v3KbFJuX6xmR/1MtYcweZgB1ttjFusT1/CVEDbJ5g80vksp+MP38KtAlMMZc4EPmA7SXV2NXWgSf3CdCXQygibVymD4TwwmZsMx2Vf+8qm2S/nplBV+1DvMaNN2rXSkMPbkzqhNW1jnzj5IH+Toa0VCeL1JI0O2LyJ2bCRSlgjIGRCTrxbdyFyfgb9aakARQmy0i327kCI/AZ/Ku8klPmrE65gQlCOhxSDTXwjASx7PpmghxmIQczSwfjFQITQLxm6kMkUNEFsZAy2tEbF7/ynyuFdG9Ov5lADqRt230NbXO44kxGyb7i6D1T/0xGFK52RWd3V1l9Wk612Sc8f4mhwVMdXw9Brqwr0PdwIaiNnQ1jNvABhHVNDkfDxJ2vp2JSnh3JMkNGsnfMgEzErQ88we8Cvhnx6uBV3K7B+9cdN14P1ckOb4PROiLsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(136003)(396003)(366004)(376002)(8936002)(8676002)(66946007)(66476007)(66556008)(33716001)(956004)(6666004)(4326008)(85182001)(6496006)(6486002)(316002)(54906003)(186003)(478600001)(38100700002)(16526019)(6916009)(9686003)(107886003)(5660300002)(26005)(86362001)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dEwrZDJBNWhxNDBlR0kycVF6N284V2tvSy92YlQ4SzhhWExIUmsySWRoNk04?=
 =?utf-8?B?NXBZVTdVTXl3RmkyVXdGTDhWODRyU0hWTFhSc04xbnJORW51NG90SVVrUy9L?=
 =?utf-8?B?RGFoMmNUYzkyMmhJdWJCcVRmYjdWd2J3M2s2Q1lIeFpVdUpGckx6NjNWb05j?=
 =?utf-8?B?cE5qUUM3ODV6OUZvNUpDNEZZaHZBNjF1VUxCc29oTU9KWDZWU0YyY1Q1TWMr?=
 =?utf-8?B?SzZLWW9Va1BLc0RxMWpGR0tZZlFXdnVIVG9CYllmY1R3NmtCYW8yOGFOWk9p?=
 =?utf-8?B?Y2pubXU1d2ZzM0xVeUZCS256Zmx1RkcrUlhjaUVac2VLNUVTcGEvVmh1YjVG?=
 =?utf-8?B?a3U3MXlLUjNoc3Rlem1xaTBaRXdxWnczblN6alJKOW5CUURsbWhQZ2QvTjBQ?=
 =?utf-8?B?T01IaHFPWXltYklNbEd5NWsyTW0ycjdUMW5ya1hKSTFkN2N3K0phU050TURo?=
 =?utf-8?B?dHVrZEFiVit6d0hlbjF5SUVRVDhKNEdmQXkzejFhNkJuNEJ2RGllY3dRR01Y?=
 =?utf-8?B?T0toTzV4NzlOTS9vaDMyVVQ5KzVDOGRXOEJjc0VvRGVIdU04Zmd3d1lSOHBT?=
 =?utf-8?B?SnVxbVRScHVTSUV3WGRuU3N2MklzNVBGQ2Iyemw5NVJGVWNSMkhwb1YrTmN4?=
 =?utf-8?B?U0FnN0VvNkR2ZjFWMFJVQ2FaQlhjV3dLQUlDRERad0V1M1VIUnBwTXExRWhE?=
 =?utf-8?B?TzZXRWQvcXJKUEhZSTh4Q2Z6VWZmQWlkakwyQ3hPMXF3NllKb3lHcUYzb0kz?=
 =?utf-8?B?SWhkQXRBdG9BZmt1V2VUVysxZVRWNDZFakRlT1ZVb0xsd3pwOG8vOUtOQ21W?=
 =?utf-8?B?TmljQUg4Y2NGZ0dnbkpRR2p5MTdueEtmemZHdmFHR0VTUmgveEhLNEt3K29M?=
 =?utf-8?B?aERrSHI4TmxJTFhmeFRwQ0svcjRvQk1WbWdNVktMckxSTkJDQ0xNOTF6NC9W?=
 =?utf-8?B?TlZnTmlaNGtLWE13akZFdDgreGwvbGRkSHZEanNIVytRWk9iRFBFemF4UUpQ?=
 =?utf-8?B?czlvaFk4TDkwSUhobWsybFhWQVl1bVNHZTlmZDBLMGxPa0x2a21idEY4OGE5?=
 =?utf-8?B?b1NhdzM1TmVUYzNCSExaNlpyUEZpclp1ZmVHdmtJWGphUUVGd0x0bFcwRm8x?=
 =?utf-8?B?dkVvOW5zbTRhQU55dmRTK2Z1V05hS2g4SzUxSkVpSXpKUlZMOURWNlBZVi9B?=
 =?utf-8?B?dUpQbllNNE9kNVU3YjBBT0pNb1Y5cldXYXMwWXFwNklhdTl1TlJydUZmdjQ3?=
 =?utf-8?B?Q3U1N3BKazRZLzVUS1VsbWFtcFBrOHhFbm5UckRDV01WcWdpcjlmNnB4Z3Ix?=
 =?utf-8?B?c1YvbFMwK1YrTnZIMkU3bFdRQk83R3Jnbm8rU3RPc1NUZXpSRGp1ZTg3UFl5?=
 =?utf-8?B?SkZTUHFmZ01Ybm1ZSHRlTmxhOGFvOHpiSnBFQUVCRXB6ckRCNzNZZlhZS3h0?=
 =?utf-8?B?RVB2UGFNOEdvVGRSTDdGdDNrWFRiZmZnbFBrSVdBV1F5RExzNi84Y3JLZG1U?=
 =?utf-8?B?TFArckEwMEpBMzBNT3RTOU5HQ1liZXgzdDZyVkpNWnI5ajN2bTNGOTVjRk5s?=
 =?utf-8?B?OVRzTlNrOGZuVjNQeEZqa3Vib1lMekxsTWo0eVkzZ011ZkxxN1NheDYyZVVL?=
 =?utf-8?B?VEgxbFIySHBFTlVRUVY4SFVWRERCclRGd3AwSVhIQjN4S2ZpU1YwUTRtRGVN?=
 =?utf-8?B?bDBsU2NxMTJLeXRZeEoxeVZRNG4vSDk2eEhEOXlGZXFnWEpQRDhWL2gzU0dP?=
 =?utf-8?Q?Su3kN/LAXYr0FMUjGTsBtTp2OJCioKyujShe0Wi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ade7aeb-fb14-45b5-9b56-08d91a0eee5a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:09:28.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEylsGAWtMrE+ftpzuYbYGjicwa1DbKfw89WO5f8d7cgs2Ug520cxkjzwXvXp1UGHklY2JZM7v2SmDcu9+6rDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999
X-OriginatorOrg: citrix.com

On Tue, May 18, 2021 at 04:33:43PM +0200, Dario Faggioli wrote:
> On Tue, 2021-05-18 at 15:20 +0200, Roger Pau Monn=C3=A9 wrote:
> > On Tue, May 18, 2021 at 02:04:13PM +0200, Dario Faggioli wrote:
> > > From: Dario Faggioli <dario@Solace.fritz.box>
> > >=20
> Mmm... this email address does not really exist, and it's a mistake
> that it ended up here. :-/
>=20
> > > Fix the build inside our openSUSE Tumbleweed container by using
> > > the proper python development packages (and adding zstd headers).
> > >=20
> > > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > > ---
> > > Cc: Doug Goldstein <cardoe@cardoe.com>
> > > Cc: Roger Pau Monne <roger.pau@citrix.com>
> > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > ---
> > > =C2=A0.../build/suse/opensuse-tumbleweed.dockerfile=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 ++---
> > > =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > > b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > > index 8ff7b9b5ce..5b99cb8a53 100644
> > > --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > > +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > >=20
> > > @@ -56,10 +57,8 @@ RUN zypper install -y --no-recommends \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pandoc \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg-config \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python-devel \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3 \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-devel \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python38-devel \
> >=20
> > When I tested python3-devel was translated into python38-devel,=C2=A0
> >
> Oh, really? And when was it that you tested it, if I can ask?

I've tried just now with the current docker file, and this is the
(trimmed) output:

Step 7/7 : RUN zypper install -y --no-recommends         acpica         bc =
        bin86         bison         bzip2         checkpolicy         clang=
         cmake         dev86         discount         flex         gcc     =
    gcc-c++         gettext-tools         git         glib2-devel         g=
libc-devel         glibc-devel-32bit         gzip         hostname         =
libSDL2-devel         libaio-devel         libbz2-devel         libext2fs-d=
evel         libgnutls-devel         libjpeg62-devel         libnl3-devel  =
       libnuma-devel         libpixman-1-0-devel         libpng16-devel    =
     libssh2-devel         libtasn1-devel         libuuid-devel         lib=
yajl-devel         lzo-devel         make         nasm         ncurses-deve=
l         ocaml         ocaml-findlib-devel         ocaml-ocamlbuild       =
  ocaml-ocamldoc         pandoc         patch         pkg-config         py=
thon         python-devel         python3         python3-devel         sys=
temd-devel         tar         transfig         valgrind-devel         wget=
         which         xz-devel         zlib-devel         &&         zyppe=
r clean -a
 ---> Running in af6a184e482b
Retrieving repository 'openSUSE-Tumbleweed-Non-Oss' metadata [..done]
Building repository 'openSUSE-Tumbleweed-Non-Oss' cache [....done]
Retrieving repository 'openSUSE-Tumbleweed-Oss' metadata [.......done]
Building repository 'openSUSE-Tumbleweed-Oss' cache [....done]
Retrieving repository 'openSUSE-Tumbleweed-Update' metadata [.done]
Building repository 'openSUSE-Tumbleweed-Update' cache [....done]
Loading repository data...
Reading installed packages...
'python3' not found in package names. Trying capabilities.
'python3-devel' not found in package names. Trying capabilities.

There's this message here ...

'pkg-config' not found in package names. Trying capabilities.
Resolving package dependencies...

The following 509 NEW packages are going to be installed:
[...] python38 python38-base python38-devel [...]

... but it seems python3-devel gets translated into python38-devel, or
maybe something else selects python38-devel?

Not familiar with the system, so maybe it's indeed a dependency of
some other package.

> > which
> > I think is better as we don't need to modify the docker file for
> > every
> > new Python version?
> >=20
> That would definitely be better. Right now, I don't see any
> python3-devel package. If python3-devel can still be used (and it
> somehow translates to the proper -devel package), then sure we should
> use it. I'm not sure how that would happen, but maybe it's just me
> being unaware of some packaging magic.
>=20
> Let me put "python3-devel" there and test locally again, so we know if
> it actually works.

It does seem to be picked up, whether that's because python3-devel
gets translated into python38-devel, or something else pulls it in
I don't certainly know.

Thanks, Roger.

