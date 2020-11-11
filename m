Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22482AF007
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24673.52034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcofE-0000rX-UW; Wed, 11 Nov 2020 11:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24673.52034; Wed, 11 Nov 2020 11:51:48 +0000
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
	id 1kcofE-0000r8-RK; Wed, 11 Nov 2020 11:51:48 +0000
Received: by outflank-mailman (input) for mailman id 24673;
 Wed, 11 Nov 2020 11:51:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcofC-0000r3-Io
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:51:46 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fcff635-fff1-4ba3-8ef0-ad401212c46b;
 Wed, 11 Nov 2020 11:51:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcofC-0000r3-Io
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:51:46 +0000
X-Inumbo-ID: 3fcff635-fff1-4ba3-8ef0-ad401212c46b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3fcff635-fff1-4ba3-8ef0-ad401212c46b;
	Wed, 11 Nov 2020 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605095505;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6a+ryRQx52NXhthr7G6dA/SjXzSMTcht3I+EUDtCUjA=;
  b=K4VFZAUEKsXiU1DY+H5nUqLVhPtv2UpQhufBV45Fzs4kKUUjOweL9CDh
   qlK/DaD5mYq4X9+yRmm9VzE2nG/ZwHRKZalFX0qwPP8K24vu4UTqnfIMT
   0lXRKoafxZtEzGTnEG0R2OmxkkMRrEgq8l6UuSScfTaUWqmA1Ptj+roYS
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Zv2hMvC0pxucPVXuv42m5YYsJvDxU+ajSHtGFw788G19WKf1OVoILWUXgD/yhETYkLoPFk/T46
 DR7ftaucMHfTMxabEEqzzMSaPmEXJPSRgkQHVyUK7IHmciP6LuPsC1/qRnAViDInuGZ5RF6Zzx
 zBwFli+KtCEl0oTF+GC8ylckptZ6ypY+kZUyPIXwiOV4MZbX/vnR7k6YzLRcanJJSDrHv8lsJg
 bD+n6+GavcxPxSS61hxrwnNhucLWS4KQPJK/8t0UnLSAgofvb1tUPeKPMFGhAS2zJn2hOaIads
 wfA=
X-SBRS: None
X-MesageID: 31279159
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="31279159"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru6jQkQFQoedfeQVxxij9pJYOym5bDy/X8ubiBiOgjkFTXwLICjTODtH9CUvsMkYKQwjqMqO+eHJQYvA0JfIspLGLe+QH9Ysf/W9l2nI9WLjItMusgBSzC55pJE1aRr0Q9byGkHXKLfcPxbnctsB+EUayp6boP/g4dWCX5B0SHbQUOTzV7RnLSPc6VpaKyDbxDNQBEIowHnKImB9BLUGSrTcZhxslNwT1OUeKHUXbCMQlDlZQDCLgHUMFQ1Pv/HDGkHtzaKBubmnpkO3aEXJbq9IqrRnWoX03u+vF9+30UuFliMdKXuzxCX3X3ViDu2FHYSEUkcrysSu0acP8T1jIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFxMpIp5YG4oK4PaPjZIjXLyU/zXgZkFczggbSmDzl8=;
 b=YgcpfBWo5SAdyIW+rHJ3h89TyHuC17nxyy5NMrYUQrBQ+JE6LL/TvKzBbVIuKo768j9+66Nw/VNfE2FFLjRm31CddTcm+VT484K1xQ4Vc10tTgEEeoL/7EklVdnXA1tDPiyLovK7hf6ZDCvwJBnaaXemHOR06qUtMQse5N5RgYMZ3Qwc1Fwc4B6SuiQhu1D4s4/dcxjOyxAo87cPMkgpDttyafxTKl9QbC7f51GEbqRSDY9Brng4CYCkiMRgxsAEqTxvKMFA8cs3vxuUH8aizW2JVssIg2Kqf9NVpgb/RDjs870vn7gUOfYWbIbl7C3HWR+mOdRJn6/z0qahvmPnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFxMpIp5YG4oK4PaPjZIjXLyU/zXgZkFczggbSmDzl8=;
 b=EB60PY+btwHLB4b8rxXUWTgoYoi9liNzENyJA4NPRASHnGks1tk4LORnl6gE3UAPWYPnw3z4XwuisU6IHXHC08EdfkFbCuWAeAnmCAV9mB66MF2kiZFnRsvgU1l+UH7JLw9jzMtv6ENG5lE4Krlue4PiuEZnU2y5pfxvz0SWlSk=
Date: Wed, 11 Nov 2020 12:51:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: fix documentation about default scheduler
Message-ID: <20201111115137.ojf7e5j2iq6zcfxe@Air-de-Roger>
References: <20201110185129.5951-1-roger.pau@citrix.com>
 <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
 <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
 <19A67843-4667-46EB-8F11-109D8989BB71@citrix.com>
 <20201111113726.iqpzf64sgxpnl3gc@Air-de-Roger>
 <d13b3920-1301-c345-ac6c-6f6ad7af9b8d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d13b3920-1301-c345-ac6c-6f6ad7af9b8d@suse.com>
X-ClientProxiedBy: LO2P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f2d4445-ab60-41a8-b578-08d88638277b
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371D08787EA1441E75BB09C8FE80@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIjhVkeqd/UuAux+wtN3W46JtBwnKUzlHNKGyKg8ullC+WmaZer9NyMoxJgBiPSfml86qF1ZCYuz2kVRnIJ0C4JlHcapPd72VPD+pjI65kT6EkeIFArqYrWLoKeCW9fTNR8SR9a8gHTswUYPG126wKyFzNrta+yfR02ro0j4+gb18pIIeJenNKTafdIgWjJTNmQk9dIQpEU+9IxkoZrNt6SzUP0zfMjfBQfsci9Pu138sGbwld/QwPvq678jj3Ye5IenEW5D7Lx53qzNtxFXlV94tiC+5kp7CTYtfug2hSeAlCfjntsho9gHlrlKLTE0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(346002)(136003)(376002)(366004)(66574015)(4326008)(6916009)(26005)(6486002)(53546011)(9686003)(5660300002)(83380400001)(16526019)(1076003)(186003)(956004)(85182001)(66476007)(8936002)(86362001)(33716001)(66556008)(54906003)(316002)(2906002)(478600001)(8676002)(66946007)(6666004)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: H2/9pMNSmDsIr8ivbJKXF6CHPdwd6mqjbL+l6/z3XdlRnsNxHtEvBRpKL6F0ylr8t498pQ9UWq9+Aqr+iEj9cKFPojZ1+pG4yMexizKvGGDoZVRsospWnp5JOq4bOihg06cl9i9Wy1sr1h9M+23tfdShO5BLl1HEm8Z5CdeooImigGM1o57GiFJK5hFrPwB/1gaM6TxcrOmWj3CVcDMTt8rqvOKdhzCe7kBpTY1OJdEpSQl3Ip5De2LqQ/p6yvooTOoA6J7ef6V8pz1dRIL/rWd5pSWJyj38B5y3xFPdPSvsDZW2kY8qT1fRmTdiJ6+o9mDI/DtgWQaTUYzhUHHpb0h5+HPotkYjoBYt3DsF3SQ1s+ODUU2i9FN0nAVV3RFkwmLoqnN9wORjpTwkYPN5xnaCK9V+TMFnW5royMUrJP6Sk8hJR6hcVe6gsYHCAPlSQlgqaDTexFqQEZIpoxCD0A46dCwNY+5feJQPRvphX1EZ1kdUKpo5okuxnt9EklCSoPVNG9hfrBcnTKXCCYMhjt/Bce496fac9f3nDGLqckrenHREk5Q4qJDyJfB+J3I+0L9JP3VFCSw9hRG6WX1U78Nv8pTEAgEKVNsgyp1DgfKTdOXHmFxe4OKNks2CTmXvvd6/LuVzB+JmYwiXUIh0VE0sBzioSqRaSGnWCDSQ1glw66STOzf4ID2sIqU2QHcRrxplV8DujJ8KKW6ZBF26YCMiA5ilJE1E0i04430uNkyhY2TyIiC6nEBXlnp3dbBupqMeF1PnT8v9pT7446zt7TEPianm9axw1sUZJygtrwmCUsMje/RSkbcL4GDP4W8q9+I3QjxvfOzFD9zJJnk9E1jq7HsrU1an8/BH5NyWn+uvoGOmGhT2We9XPrjVS4WdQtcisviC2z0dvoV8cKj8Yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2d4445-ab60-41a8-b578-08d88638277b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 11:51:41.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+390UHWhSVMzOG5LZ+FPdBRT+u4TOdBnfmKjGW7v843Lec/0f8EWLxvnEnLadTbApSJrqKy37U+vXzdMSbgPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Wed, Nov 11, 2020 at 12:45:38PM +0100, Jürgen Groß wrote:
> On 11.11.20 12:37, Roger Pau Monné wrote:
> > On Wed, Nov 11, 2020 at 12:24:50PM +0100, George Dunlap wrote:
> > > 
> > > 
> > > > On Nov 11, 2020, at 11:10 AM, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
> > > > 
> > > > On 11/11/2020 10:12, George Dunlap wrote:
> > > > > 
> > > > > > On Nov 10, 2020, at 6:51 PM, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > > > > > 
> > > > > > Fix the command line document to account for the default scheduler not
> > > > > > being credit anymore likely, and the fact that it's selectable from
> > > > > > Kconfig and thus different builds could end up with different default
> > > > > > schedulers.
> > > > > > 
> > > > > > Fixes: dafd936dddbd ('Make credit2 the default scheduler')
> > > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > > > ---
> > > > > > Changes since v1:
> > > > > > - Point that the default scheduler is being selected by Kconfig,
> > > > > >   don't mention the default Kconfig selection.
> > > > > > ---
> > > > > > docs/misc/xen-command-line.pandoc | 2 +-
> > > > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> > > > > > index 4ae9391fcd..eb1db25f92 100644
> > > > > > --- a/docs/misc/xen-command-line.pandoc
> > > > > > +++ b/docs/misc/xen-command-line.pandoc
> > > > > > @@ -1876,7 +1876,7 @@ with read and write permissions.
> > > > > > ### sched
> > > > > > > `= credit | credit2 | arinc653 | rtds | null`
> > > > > > -> Default: `sched=credit`
> > > > > > +> Default: selectable via Kconfig.  Depends on enabled schedulers.
> > > > > Sorry for not weighing in earlier; but this basically makes this documentation useless.
> > > > 
> > > > No.  It is the only half useable version, by being the only version
> > > > which isn't misleading.
> > > 
> > > The version in this patch essentially says “This has some options, it also has a default, but we’re not going to tell you any of them, nor what your default most likely is.  Go read KConfig to find out.”  This is is completely useless to the person trying to figure out what the default is and what potential alternate values they can put here.
> > > 
> > > The vast majority of people who search for this on the internet will have that list of options, and have credit2=default.  As long as we tell them that a local configuration can override the available options and the default, people are smart enough to figure out what their system is doing.
> > > 
> > > > It would however be far better to name the CONFIG_ variable (we do
> > > > elsewhere in this doc) in question so people can actually figure out
> > > > what they've got in front of them.
> > > 
> > > Something like that would be even better, if Roger (or someone) wants to write it up.
> > 
> > I'm happy to send an updated version, but would like to have some
> > agreement before doing so. Is the text below acceptable to everyone?
> > 
> > ### sched
> > > `= credit | credit2 | arinc653 | rtds | null`
> > 
> > > Default: `sched=credit2`
> > 
> > Choose the default scheduler. Note the default scheduler is selectable via
> > Kconfig and depends on enabled schedulers. Check
> 
> ... CONFIG_SCHED_DEFAULT to see which scheduler is the default.
> 
> CONFIG_SCHED_{scheduler_name} specify which schedulers are available.

Hm, that's weird. When I hit help in menuconfig for the default
scheduler selection it reports the option is named
SCHED_{name}_DEFAULT. Will change it.

Roger.

