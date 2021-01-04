Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0A2E9CE2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 19:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61475.108233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwUQj-0008Aa-OV; Mon, 04 Jan 2021 18:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61475.108233; Mon, 04 Jan 2021 18:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwUQj-0008AA-Kf; Mon, 04 Jan 2021 18:18:09 +0000
Received: by outflank-mailman (input) for mailman id 61475;
 Mon, 04 Jan 2021 18:18:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwUQh-0008A5-Vm
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 18:18:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 846843c4-dfb2-40d9-891b-9f950d7b32b4;
 Mon, 04 Jan 2021 18:18:07 +0000 (UTC)
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
X-Inumbo-ID: 846843c4-dfb2-40d9-891b-9f950d7b32b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609784286;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=q7vEuop+s860EICCdrkyfCdTTtxdA3C7h/lifDbwYh0=;
  b=TYm9GHUX8JFv51weQOZMBqayYdEZu6Gv/Vww0y+orBAaSbfHpaImwhvT
   REkltTrOY4lJCdbAP4Qn5TMabfvetvQ06qaBZ9nsi51uajqL1bC+mHcpL
   QDrU6yUjL3kjeTu4xq7x0Idge8tjGWhGMJjCRlTotrOWp/dzKWHBFHHcA
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bRVqbmlbnSdIzgmalHp3jFGUrknJzkZUrHVTDuFpVr40ZJOSgPedI5DC4Nn2cjClqiOMCGcj57
 RrND9vxWhUnqEUk4j18oOXi8uzdq3TBmWAlqy0ZxPPP6Edi6TH13eME/e3d3mAhGTsKRvo9eG6
 loYkHsj0CsJQscjym7LWs20fJufFs/GQ/bI2SISSi9Qwz9erRMHt7NlASaXKRFi/NiQaWxTyRV
 EV/s18e8A+cR3qjPD1YLVu5snnH3d8zU0CgMTPVazj/v42NaQdxoJzuIIY5z8zrdqBvbbVZ+Bc
 G08=
X-SBRS: 5.2
X-MesageID: 34360502
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34360502"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brmKsxtp5mjXtJOz94z1gSxggodii1AWdagBXfS6AoOQpSeBcPVyy12UPfEzUeFoU41bV34P84HtMtTL8SfGUBTGbU11wx+7w19kepbXWmSJY9p/qxjLbogF+QwMgzOkWy+n2xt4aWCBo6BIUvv+DEbbroOr4EQamMp8go+ufld16wdK43WPPdCL9HTEKZFH7CntxhM6/17TZvyauAn2IB39fd8xOdlthQd+wa5GHuxq139UcdfrueR/L/u99CMXozNtj4GuQvb3C5d8icBtLX+H3BJVKiXckxOXi3sXwEu+99kx2uGUtup5o0d1wCzU2iybdcNokEN2cvCh2MkIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZNrPok5twsAO+jiM4imfFKBZ9lG1a68We/xSKvAp1A=;
 b=KO3XRWQj1VVknr+ASg3QfxQHiRICAwTGkhS2DhVKi2p9j1/3pcnyB//h31NEjSGvFIGwetCDtTuKJMoQU1fZp+EmPgNP8Ra1/+iVRDy2XUdFgl0aueRHhP58fhFbLe1b9vi+F5wiTRAYt51w6TBtJiTROraJnecELixhYkyuE+YVq8G6+BzO8BDYJxZr+dClZpoXM0hFmVrKLYk5UZawdmjkGvw8miMvtfx2NkIyw4RnCbgeRv76trjvU/7OwB3NBi54S6BkA09XQFsrgXXzFLOl3L9vkod280Ok45BghaJ2VZhA3ZvaTrtT23WF3RRF7xF3rqAuHY1a15EUtooXNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZNrPok5twsAO+jiM4imfFKBZ9lG1a68We/xSKvAp1A=;
 b=MgK5u+pPpB7dxf/PYDlvNhc87JUH7e8oSDNil6Mk1QaM6rzvBSaBFZRm83hdtaVICDsWH5YFoiElDKOud7MTSZ4QBEygfnl+Ex4Es4KeagOtrpc0Vow72wm96H6/3JTlJRBEPwxgDeZ7DVhFNsdbPsbnrVFG717bnRVa9EjDwVo=
Date: Mon, 4 Jan 2021 19:17:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 13/24] Don't assume tv_sec is a unsigned long (for NetBSD)
Message-ID: <20210104181758.7wosj7q4dz6slwdh@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-14-bouyer@netbsd.org>
 <20201229140215.zl5yju6hm7wcacht@Air-de-Roger>
 <20210104103156.GF2005@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104103156.GF2005@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c1dd7c1-38d0-418d-1c0f-08d8b0dd13f2
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065F753B800D2B2AAB376B38FD20@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHMppdRhmkYcwMALzqCad3IQzvrECu0XIKxpD5me/Ksrdk6Utf0Qthb/CKKTqT2x8Bv6bSdpVNopozWRHh4oUiFZdGXuporc0UiOh40H9ymC6ygwviR2G+cFMwz6XyQyG+vh8YMD3PvXjgR641ilWR57FMcfoBRBzmj2iTf5Brj9JHuXpiGUXSHXSRn3qWIriaTsdEMckmnoONo3IRS0hOk9G/OerTF1hXuwdZzJmBKdXvypnlX2Cd/rvX1mwYJ835kXqVtqEv6oM2KaGHOWQ0hLgFnQoIZbixR5xwUNQNqy8Nl+GijhDz2M+GwtTrMMkFOiNjBJrAVAlENFo+s629HyCEEHezj9+LgajHe57CNwEgzIenWM/8xiY5N+5q3ZJ0dNSxCX1PBhdqYux9RfeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(6496006)(85182001)(66476007)(478600001)(6916009)(66556008)(9686003)(5660300002)(6666004)(66946007)(316002)(86362001)(2906002)(4326008)(956004)(26005)(8936002)(186003)(16526019)(8676002)(83380400001)(1076003)(6486002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFJVMFdMUVlMVzQrQVlJQjNQMlVISlM1UDFqMGI4TkJ5N0E2K1psdmVqSTlz?=
 =?utf-8?B?NC9US0QzUkU2VW9pUVVuTVRBZW1RZEI5MElyUE83eFZxcjJVSklCZ0hBaTdn?=
 =?utf-8?B?YzRvbk5uUWFxakZnTW1WekZWeURZb0V1RGYzcGdWbFZ2blFlQTB0UmtZSWdh?=
 =?utf-8?B?d3R5RFlrd005b29HYmVmYVVqNHk3ODZmR0hrWGlWOHk1YWMrT2tTc0FQY3p0?=
 =?utf-8?B?WUllR1d4WEVtN2RMZldSQnN3bUFOeGJVKzJCR1ZWR1EyN1ZKZGlPc3RmRzl3?=
 =?utf-8?B?c0Jtc1JleUx6MnRoRkpGcFJYMFRjZ09mUjNuUW1Eb3k4Um9WOFltYTVXOWFj?=
 =?utf-8?B?OFlrWERMNmdMWWVzMUlzOXJwMzZkNGI2aHplN1NGTVluQ2RBUVlYQU56a1lC?=
 =?utf-8?B?aWFhNGgxcmFtTy9QNjgwNFN3L045Uk50VVFJTDVnVWJ6QmhzS2c5SUJqMEtj?=
 =?utf-8?B?NzIxSkZ1bWtveFVTZ1JLNW5MSk96RXBhMUhRSlRYbnVRcWZQOUVZWlRpRkxI?=
 =?utf-8?B?aTNZVUFWMFhpZyt0UXdNWHI1bm1vemVlbnZYV3JwbHZLcHQrWW5RSVZreWdK?=
 =?utf-8?B?SzR0dnVlblZic1pLZThJTWlMWmxmdkl0V2xWcEt2UXZkTWMrV2p4NkFaNWkz?=
 =?utf-8?B?RVF1RmQzYkNwVVdtYUdKTWN5SW81L3MzdkMzZWxpNDc5c1gySzdiczV4TW5W?=
 =?utf-8?B?RVpxd2tENVNKRUxZYk5BMjlRbEZOeDNpRDBqSVhCdVJBZ1ZRRjJXaVJtUnhh?=
 =?utf-8?B?YmptWGQvaFJVUDB2ZDVHZTlURVE5U2w3dCt6ai9pZFkzcDNGUmljNU56Uzlk?=
 =?utf-8?B?bm1UMWRUQlIrM0xpODNqYzBKcm16bnZ2MlNFUiswZ3Y1S1NEcnpoOE5DRk93?=
 =?utf-8?B?aGZaby9qeUxpRXUyS3VHaFlNSFZWQlRpR0dBdVFEMmw4Nk1lVFNWSGJuMjZn?=
 =?utf-8?B?dlBVVjlZeFJqZTZBZjJEUGNPd2hqazdLdFBSYnNQTG05U21hbTVJN05odlVW?=
 =?utf-8?B?VENBZHdRRnpINXpheVZiYUltYkd1Qk91U2F2SCtUS0s2ZjE1bmw5TFFvZFV5?=
 =?utf-8?B?NldHaGh6bVJpa284UndEek9wcG9TdzBuYm5zTnVBTURNNGZybGhQNkZxN0FY?=
 =?utf-8?B?dldVdHp3dkUzb1dqWGd3VS96WXR4SnBuNUQ3N3RPL2UvcmRRNWZ0d0pBNzNk?=
 =?utf-8?B?aW55b1pYSExEamQwaysvTUkzWTBUajdqWHRIaktYWUVQRWJtc1VMeU55VjRF?=
 =?utf-8?B?a01rSGVUQmh3cERReVF1ajluLzQ0TzN0TUJjeTJNRW0xeXBIaEhab1crajQ4?=
 =?utf-8?Q?7eKk80A2z/AtRRuLta0bpgpdCVMkyc8wdu?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 18:18:04.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1dd7c1-38d0-418d-1c0f-08d8b0dd13f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vl8kzBrQiKn9leO1hQxNeXyRiKK7SpEofQC8Bur2H28d9DSvLnKo6z4/DuCwdf0xssp/BcjKRO3oRQlC8QVVnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 11:31:56AM +0100, Manuel Bouyer wrote:
> On Tue, Dec 29, 2020 at 03:02:15PM +0100, Roger Pau Monné wrote:
> > On Mon, Dec 14, 2020 at 05:36:12PM +0100, Manuel Bouyer wrote:
> > > ---
> > >  tools/libs/light/libxl_create.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > > index 321a13e519..44691010bc 100644
> > > --- a/tools/libs/light/libxl_create.c
> > > +++ b/tools/libs/light/libxl_create.c
> > > @@ -496,7 +496,7 @@ int libxl__domain_build(libxl__gc *gc,
> > >          vments[2] = "image/ostype";
> > >          vments[3] = "hvm";
> > >          vments[4] = "start_time";
> > > -        vments[5] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> > > +        vments[5] = GCSPRINTF("%jd.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> > 
> > You don't cast tv_sec to intmax_t here...
> > 
> > >  
> > >          localents = libxl__calloc(gc, 13, sizeof(char *));
> > >          i = 0;
> > > @@ -535,7 +535,7 @@ int libxl__domain_build(libxl__gc *gc,
> > >          vments[i++] = "image/kernel";
> > >          vments[i++] = (char *) state->pv_kernel.path;
> > >          vments[i++] = "start_time";
> > > -        vments[i++] = GCSPRINTF("%lu.%02d", start_time.tv_sec,(int)start_time.tv_usec/10000);
> > > +        vments[i++] = GCSPRINTF("%jd.%02d", (intmax_t)start_time.tv_sec,(int)start_time.tv_usec/10000);
> > 
> > ... yet you do it here. I think the first occurrence is missing the
> > cast?
> 
> thanks, fixed.

Add my:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Then.

Thanks, Roger.

