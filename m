Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A52FA885
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69962.125457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Z5P-0005x6-Rv; Mon, 18 Jan 2021 18:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69962.125457; Mon, 18 Jan 2021 18:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Z5P-0005wh-Ok; Mon, 18 Jan 2021 18:17:07 +0000
Received: by outflank-mailman (input) for mailman id 69962;
 Mon, 18 Jan 2021 18:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Z5O-0005wc-I3
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:17:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a2956a0-423d-4cc0-a8bb-22d25c00ffde;
 Mon, 18 Jan 2021 18:17:05 +0000 (UTC)
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
X-Inumbo-ID: 7a2956a0-423d-4cc0-a8bb-22d25c00ffde
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610993825;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uZG1+JvKwiKlup5iHIjIzbq2D/lMbU34h1Hun++juPw=;
  b=HoxBqG9JdzhEhHKcMj3GORdVhpDQkCypo3sZMo3wxUxo/vCnQcCcQ6i0
   jgmRvAT1+/VNfJlrQ0Io3cOGKCuPpwLSruXUlSbAhJ0O+j6eW8WshmMr2
   hDDrU2O6PUv4wlp+9Gh4qcWegtlQbgSsgKX8mAVBg5sRhCstUGdndF9Aj
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qauVHwANAjmSBNHYwsUm0pALiuAg4RHiOzuzsQXp+6CXl61u7AXPeAZRFKa3x7XMYdmab29oUF
 t6AmSbEKBj4emDYP5frrX5raJIh+/SmbZ2uNgi+qCLl4LBCpmLaRFzVI32PDOLpw1cX4S7p3sL
 JXeUaTLXSFa5NUhiHxzUXsDwfyy609Y5LwNuuKKzlwaBLPaVP6BwQrDHxmIF5je+/EBFVy3uC6
 enErWy6kEM/UX3YeBUuSHWOwMxVBcRClDKANfjE155BprxqqStpqL5x8WQKRCihFHofn+AQhYD
 PaE=
X-SBRS: 5.2
X-MesageID: 36614165
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="36614165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvpRkVDubSePJxzMlxpSt8XQqaoMm7hNXy6NPeXQCeiBtuYRTYmHGQfAoHkT9205SMwKFbgOzMsaL+dcp/hJg1iz962vINSAEetFyTZhClUPi/b0nPeo1fOxuegfxq3Kajh+wLKlylls/2Fq8lTB5Q9R8IGo1EANG4kU8beVJfYCq45y6B4OSFcynk9cjO0UeKgPQ1jhhmW3g94i5E6bfE1vqDUEZCY8URq+rNOIM/fz5XQAPDJERMW0QPiqtBrvf1a+N8PtbWokeTvuXx7ySbDaRIPSkuXvSKtw7EILilDhqJYgjD/NK/SBebtl0fuSpOVO0vmnQAMq68XB1bDWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwMKGUN8vhdHzuu9gr067va/Oa2z+zyBU/lAsHaCxv0=;
 b=fcQImsSmMLAWtBWzTEJFcsYDrHBtiKsjB9t6Om5FfvFHlgVDMARUB3yWndRkRkYAOkxI1DTJp4AmVFrkXKa2dyH6425+57nLRev6/vYeE9NCub/qsn1UrjAvmBgOnefBwKcypFN/cicvk5HSNQPC2B4wlEzoHcbcAcS4molbbFUsGhXy4b45FPaqnz0/QuXPPB3h0JURkcC7A0OpiV04sn9i9w0G9GgI2KZAr5J/eSqVzTs24rCV/kbifmqrXmKlwt1DIenZPZ9mY66pkOW3KaxcaAVOvCMAwnsv3NiVM9QDXLFU5+frDCjARFDro/1MAGr0nnu9YBLUZ/YiLrOf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwMKGUN8vhdHzuu9gr067va/Oa2z+zyBU/lAsHaCxv0=;
 b=ovQJPhXbhfC4WzfNgyGH0PAsqWmF+P4P5MNIkShYitMarUy6UMBNhdG/0pda2HJAImiCGctEdXvRNmXFTfFS1m3RYjePAarWcQAh1kj1Yr0dp+Sjo02ekf+PSOnWyAlzODk1DVAnO/3Nz0eb1ZApGe4oyA3AI5GpIwDRB5Zo6cs=
Date: Mon, 18 Jan 2021 19:16:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>, Manuel Bouyer
	<bouyer@antioche.eu.org>, Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: make it build without setresuid()
Message-ID: <20210118181656.2abblbjg2jvhlad7@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-16-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112181242.1570-16-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f919f9ad-28a2-43d4-7cba-08d8bbdd40ea
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB534070671051121FCD5BB06B8FA40@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctlI0Cpg9f3yhYL1iCwNLRhz23BYILElk2nnculkzYf6XiRoJp90rUoERPX412pVdVTQ2dzslfrUi87/GUqzET08fX6zk+qoWKoL+yY6u7ZaZZQk6jF3ZCV144hhrmIK1hNO6Z9SqjT5qkaAPFnO28ZvHODf4Ssjkv2DQcl3Zormiwuwl+IeqmxZeME+CrWK6YnByZp4K27MTdp/JwwDcpy7Ocz3mEV3lFPp1rpOF2j+FveWllVlzQfVV1x4bLoWyJpWVzimUfZ9K/pg2nKUVlnbJaYUF9wY7C8NRc0JkY2cmXWj0q48+eWNHMehIHKC5RzzkvQq7rZVjiJxiv+aLsZiKVx4Y5DqSV0A9ugFF2SuUS/DA7U0b6WqtDu4KKALVLtyq01RkzSmyLiEXMLHbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(478600001)(54906003)(86362001)(1076003)(66946007)(66556008)(6496006)(83380400001)(4326008)(66476007)(6666004)(956004)(8676002)(186003)(33716001)(26005)(110136005)(85182001)(107886003)(6486002)(8936002)(9686003)(2906002)(5660300002)(16526019)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RERYSTBNUnpMWE9abkx1cHFtaUZWSnd3Q3BubnlYQXJKRi9hZUd0SGN2c1Vs?=
 =?utf-8?B?aXFIOE1GTVNZeVRTS0NIbmk0UGxaVzZMR2FoSFVZQk9UZS9zSmIyUUQyVUlu?=
 =?utf-8?B?WE5nOS8remxJMEpRVGYrWGV3QUNQZC9xRXBFYS9tSmtHbEdtSTc3SlVnQzlZ?=
 =?utf-8?B?Nm9PL0kyK2l6TXF6Q2FOZVcyTzQ2dm5YdzF5djkrNklHTEJhNDhqa090TGF4?=
 =?utf-8?B?MTRxb1ZKZDlETlZqbklmN1VTZG5XQmMxU3NtRmpPbUNPZ1prdjA3QmJDQ2k4?=
 =?utf-8?B?Sk9NUGdkYXlpUjRKZUU0bE0zU0NhNDVRdlFyUEJsVzl1SFIxenYvZXQ1anlL?=
 =?utf-8?B?L0wrOEpUTTNiVTM4NkFZRjdld2ZPK3hRczdrcEpQUUYxQ3ZmR3dMemh3bHA1?=
 =?utf-8?B?ZjNMSjFVZVd5bDFEWXRXb2lYWU9McDlwaE83UFViNFgvckFidVBqTVdibGM5?=
 =?utf-8?B?bmJaOWx1QUxzL2htUmdxa28wVE9aM3JCcllnQTJKWHZ0emdVSDRpeWVlTEtm?=
 =?utf-8?B?L25lTEJCOGIrL2lHRVVIdEtUeTk2NGhxaXVxUTBac3Naalk4TUliZSttS1Ax?=
 =?utf-8?B?MXpWNkxoYU8vMHRIUWYrUnJzWDlMTUVjMmZVeit6K0tsLzBvaHhpQnpnRTRw?=
 =?utf-8?B?L3NTQmRUNzVDY2lCNWsrV3pYWWVMRWxta1lEaHFaZTNYM0t2anhRd1VBOHBB?=
 =?utf-8?B?bXZaeG43QVFKNTRlWkRoZnhDelJacVpXL3B2bmlqWHBWdmtyK2lPZ3BuUWlj?=
 =?utf-8?B?SEFsM2t4SDA1ZEFvb3U3ZWZ2bUNpcU1HaFpCaUVrWHRXTGViZTJhR0FTSkRV?=
 =?utf-8?B?MHZPVzV2aVRQM1Uvb1Z0eDQyaHAzSHlwRDhNUHRSS1kwY1dZMXlkVVhCL2NN?=
 =?utf-8?B?MitsZUp6ZHVVRHFSN1d1Uzh3Y3h4eVgzNWliaXh2THJRdHZONnZSMzIwaWMr?=
 =?utf-8?B?aTZ6eFdPYzZ3dFFkRnBhTWtaWitOYkFIeUlTMXlPTnUvQVpCQWhYOVQ4VEJU?=
 =?utf-8?B?TGhvUzhSM1cvZWxoRitqbW50ZzY2UVFmZ1lOeGNGR1ZHSk5nVDhkM3ZxeTM3?=
 =?utf-8?B?Mi8yYUM1MTZpbHVxREF1eWJjN0xKWE9ML2NmQlFHRklTREVuMlk3azcrcVgz?=
 =?utf-8?B?eG5LQnRlaTFwc3I1Mm0rSVlEbCs0RUlLNnFpdmRNdzdOdlVaaVppRDR3TVJB?=
 =?utf-8?B?bStUcWZyd1lwSlYzM09VSFpiUkdhMjNZalpHZlEvSmc3SnRJWnJHVkg3L2FJ?=
 =?utf-8?B?UjJiSnlLTjVobzJxSGVkclQ2QTdUcFRnTk5GcGRZaHRvclFGTkE0MU9YUytM?=
 =?utf-8?Q?IhOR3OeG0nUBeXgffuLoqHs0QVjRmwaSfc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f919f9ad-28a2-43d4-7cba-08d8bbdd40ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:17:02.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx68Roiuev+zkdk0yMynqp0O5x67c5HWUdvS9W4zSlaq2OxJs95WDGUDzf5aIZ/MV6BnOqCjy384pdOP1OF9+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:36PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> NetBSD doesn't have setresuid(). Add a configure check for it,
> and use plain setuid() if !HAVE_SETRESUID
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

LGTM from a code PoV, but I think George/Ian should take a look, since
they know exactly what this is supposed to do, and I would bet there
are some reasons why setresuid is used instead of setuid, which should
likely be taken into account in the commit message to justify why
using setuid in it's place it's fine.

> ---
>  tools/configure             | 13 +++++++++++++
>  tools/configure.ac          |  3 +++
>  tools/libs/light/libxl_dm.c | 10 ++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/tools/configure b/tools/configure
> index 131112c41e..5e3793709e 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -9299,6 +9299,19 @@ _ACEOF
>  
>  esac
>  
> +# NetBSD doesnt have setresuid (yet)
> +for ac_func in setresuid
> +do :
> +  ac_fn_c_check_func "$LINENO" "setresuid" "ac_cv_func_setresuid"
> +if test "x$ac_cv_func_setresuid" = xyes; then :
> +  cat >>confdefs.h <<_ACEOF
> +#define HAVE_SETRESUID 1
> +_ACEOF
> +
> +fi
> +done
> +

We usually leave the changes to the generated configure script out of
the patch since it's usually a PITA to run the same autoconf version
in order to not generate tons of unrelated changes. You have managed
to run the same version, so I guess it's fine.

Just so that you know that you can ask commtters to re-run autoconf for
you by adding a note to the commit message to that effect.

Thanks, Roger.

