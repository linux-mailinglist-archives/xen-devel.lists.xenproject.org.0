Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2254E42B9E7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 10:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208061.364084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZIr-0006HJ-Ab; Wed, 13 Oct 2021 08:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208061.364084; Wed, 13 Oct 2021 08:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZIr-0006EV-7S; Wed, 13 Oct 2021 08:07:57 +0000
Received: by outflank-mailman (input) for mailman id 208061;
 Wed, 13 Oct 2021 08:07:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1maZIp-0006EP-Nu
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 08:07:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa0acec-2bfc-11ec-8160-12813bfff9fa;
 Wed, 13 Oct 2021 08:07:54 +0000 (UTC)
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
X-Inumbo-ID: aaa0acec-2bfc-11ec-8160-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634112473;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=g9tEQmdYHWvIlLrHwqoqUcTiY2wHmYOwzkXcxDWlnSg=;
  b=eGk5Mpp6Wqp5PRMDxQho+Xu+hZ1D1NMqwXU9yWUb8y0pcT0x3VLptLQa
   IMGaw2TRMNzbB+I1H052DW4764KGA5brqSF0jEGsI6vVu1FbQ5bWpW4bL
   V8gXw6tC2z6o802RJO9xz0c09X+d8pAOr9aXn7wUDrkTDwHQSbXl7wZWk
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4qXifavkVp1dH4KObSaelwTEHb06ZciJcdhrqTrV0PY5J96puziGmZmIx1Fa5hrD4FjWY/1+kz
 F5I0C5xUuuUDSMvYqVu7bPPEQH2ySW2WoYAmoMoaRqCbR5z6SRAhaVDaharLMndou2uJQpCJIM
 IyWE+3UKGrabhClBOG/hKujQeHH1hghNMxuyiFlAYKPJ6srOXaLciFJcmRK45JrrBy9W+1wAdt
 GulM2jRQ3zLI+mEf+aQ5jv1P7oaIGppxbz/wlW6g7dHBHmH8zfhRa7IdObdz2B0RZKEwNUOvhH
 bA7DAgnA/mVTzYjpnelrPsaO
X-SBRS: 5.1
X-MesageID: 56941569
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4j8pO66aP1/RmqNGedbUzgxRtDPBchMFZxGqfqrLsTDasY5as4F+v
 mYbXGqEPq6PMGvzc9p/PtiypE4Ou8Tcn4JkHVNr+CFjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh29Uw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 NdLh7ebUSoSJpKTw8scCxQDITpwBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWlh2pkTQ6e2i
 8wxTDF0KyaDUiFzIF4WJohiw8qX13D+WmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3ErtXGnT7/HrkTErK43vdwhRuYwWl7IDQQWUG258GjmF+hUshWA
 0UO/2wlqq1a3E6kVN7mRDWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xB3cGZi5MbsQ8s807TiBs0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQcuQBEZ+dDlrMcWhwjWU9d4OKevi5v+HjSY6
 xeOoSsljrMfl/ki0amh4EvHiDKhoJvOZgMt7wCRVWWghit7boO4Y42j6XDA8O1Nao2eSzG8U
 GMswpbEqrpUVNfUyXLLEL5l8KyVC+itaD/as3VEB7Qa7wvyoFGiJY0L0ipwHRI8WiobQgPBb
 EjWsAJXwZZcOnq2cKN6C76M59QWIbvITou9CKiFBjZaSt0oLlXfpXAxDaKF9zm1yBBErE0pB
 XuMnS9A514hAqN70CH+ee4Z1bI6rszV7TKOHc6lp/hLPLz3WZJ0dVvnGAfQBgzaxPndyOkwz
 zq5H5DVo/m4eLevChQ7CaZJcTg3wYIHLZ73sddLUeWIPxBrHmosY9eIn+h9I9I5xfwPyryUl
 p1YZqO+4AGg7ZEgAV/bAk2PlZu1BcovxZ7FFX1E0amUN4gLPt/0sfZ3m2ofdrg77u1zpcOYv
 NFeE/hs9s9nE2ydkxxENMGVhNU7KHyD2FLfVwL4MWNXV8MxGGT0FirMI1KH3DMQFRC+qcZWi
 +Tmjms3t7JYHF88ZCsXAdryp26MUY81wbooARSTeIUPIS0BMuFCckTMsxP+GOlVQT3rzTqGz
 QeGRxAeoOjGuYgu99fVw6uDqu+U/yFWRxMy87Dz4enkOC/E0HCkxIMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTftKxnIEjz6CJt0qCAVEFeY0uFhCBHdeMnO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDday2AQxy1xEbZjNMQPM4cmCO4dWL00nA
 j6In66e1b5S8VXPLigoHn/X0OsD2ZlX4EJWzEUPLkiik8begqNlxwVY9Dk6Q1gHzhhD1O4va
 GFnO1csePeL9jZswsNCQ3qtC0dKAxjAoh79zF4AlWv4SUi0VzOScD1haLjVpE1JoXhBejV7/
 a2DzDe3WDnnS8j9wy8uVBM3sPfkV9FwqlXPlc3P8x5pxHXmje4JWpOTWFc=
IronPort-HdrOrdr: A9a23:GqOklqo7o+tjkJRQeOwJRTQaV5vPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHK9JbjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="56941569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bW9AV5JSLuQmjfxPxB8myAfGHVpLWO5hfPQWP+OBCS/Iqf+hIdP0Q00x1ZVF34oh+8m/kbun0iIRN1ANowDIroLGCni80rXead3wIpq9uUNRgISt3Invz27wMq9wxXZ9RWyJ8lOOolTVGFRwGAFPZMk3N6EK6VUi3gZ++BEmLVHebToR/ZPdhA5t6rK3uwvYZzSzOrwhSRd5yU9ZZiLTaPURC7G3ZPX4SoEkRqfXzoTa50RwowZmRu+omLGdd3NfQZNleF05h/DsT69xxK4LrGMIQSvLhgL8hZrb/ZofksdVHl3drBm3kpTttFAkJCL4CPH2d6JxtRbvH9htLr4YgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v00iuWyE2PiiAhGRykBLcgUdGpqke5WEwAcX9kekWpI=;
 b=bG/4eZqf1+S5q3DsX3C8T54tHbjeoEPcEQqr0xAq7oEs26qrWQ070Fv9fGmqgZuN7qZN33GX5HsA96XMihW4KJwzanC89lQevy6cFkgpQ9L4XTPGZkt78lLwvHPs72VE3tI6ACO32speDykO1ytEk131K44J2xMsU4SdFQENosl91gNilDgZ7ZaRGmWbrrAqr3mJddgtjiTf34Eqtka7i9ZF7HCTSDMtWbKE+sq/L2oYNd2e62C4Yyk/pOk92zJ32beVqTu+Ay+WXJkxZifjUEKkPQxHoHUk3BWIEpzNLNP1KZB4PLOGeKdSOK0d+Y71yt3VBbQLfB5VYfyMQD8pBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v00iuWyE2PiiAhGRykBLcgUdGpqke5WEwAcX9kekWpI=;
 b=G8JwYdS7hhe54ZUVCNf7+gzX3BWGQwclCN3JVRPhfpD6wXUz/PfQKbGXZnSNAiOVK2po05A0QgTJSI7ezS46RlIbU8Psuyfb7ORWfq0jyvdbcRAm6zrfme7+NDQIIM7DhJu54gybZqRYaDiDAujOoZKMitDEhtQRCbZbd7iles4=
Date: Wed, 13 Oct 2021 10:07:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Ian Jackson <iwj@xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Message-ID: <YWaTztHHHeghjxDR@MacBook-Air-de-Roger.local>
References: <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
 <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
 <09656882-b297-7144-c291-1ee997edb119@suse.com>
 <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
 <24933.41349.893363.203683@mariner.uk.xensource.com>
 <AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
 <24933.47094.43672.782143@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2110121319150.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110121319150.9408@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceec560f-5423-4b26-6c07-08d98e208b0c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-Microsoft-Antispam-PRVS: <DM6PR03MB42982956B331D5F8568A837E8FB79@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0PmwcqtJpFI5vviAUAWMyR6aYeBlvSLhi1hAhRo5eTgzkO1Lj3ouonbdygXcSk1udakeG5m703d8KEbsEv/xvVq3Mu0ouO0tdn5s24zPqdaB0zhIljfsR1Y7Do3TwiPalvaAWuKGrxABBT077r2d5nLigmoFgMoL57qF2CNj8rWXCCGrmI6257fPC7umc14DCeAZ9DNQsPBIDZuQRxC0+UHVP2tgTe8q1u9pqFStuxs8sC68bWO7ioj9LjDMuFq97c5qpDesBn9PSR5LI4l27kaYvvaDeAXtiE4KXxV+fzfk57j6Gqp4yeXJfRSV0H1Cr1e7b2kb81LvkX+jjmSSESBaBCA6xCgR3L1ZhB+okmioUL5zA0M+ETyrBFFTamsS8evOdHWUtnl/bXYkzkQasebqtdT8gfXSvR1Q1NReImm/T4YAyIXC190bVsU4PQnXAKRqSXIOFKA0vJ9ULfnf/iyc5sv+iL31XfnWgmRkq/CnpFsdj+62ibZMQ2AvFmwNEUOaVKbpVD0TgOVJkbcKYXAFnZ3FnHFEjsi76r9OMgSvjJ6Rz2cwVIuxV2//emqn5crx6Uf7YsZjtC6K8vjgloguv1nlhz9+xr/xRe8w8eDuFTaBQ9Yc/7wAZKMP557ri7vP0Da8fDTSC/jALQZKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(26005)(54906003)(6496006)(186003)(8676002)(66556008)(316002)(85182001)(83380400001)(508600001)(8936002)(82960400001)(4326008)(86362001)(6666004)(5660300002)(956004)(7416002)(66946007)(6916009)(6486002)(66476007)(9686003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzFGVkNZNXRYMWlNM0M1OUVCNkVrZjVHa1NVYWhjaU9hcE5CaWhpNWJ5Nkpi?=
 =?utf-8?B?cXVuNEtObERCb0E1dlNmTUxhbmVWZktpcStUUWdpV0IveGVGcW44M3RjaU1x?=
 =?utf-8?B?Yk10c1U1TjBpdXRJUnFZd2taYnZJL0IxZDYwY0RrTS8xRXVYc1ZlaHdiVmh6?=
 =?utf-8?B?bDN3QzFOTERXdGlYS0NYSXRYK2JaOVVFTUhLZ0R2TE9xUWM0cDRmazdhbUVF?=
 =?utf-8?B?MHhhb25MSlpFKzIzRTBvK1cwbUdzb2JvYnFRTU8rR2FrV1l2Y0NHaWpBdTVE?=
 =?utf-8?B?N2NxK05Bcm81QnRaSVA1VmpVMDhVS1BoWWVMS1dwM2VSQW5BLzk5VlBxdGxq?=
 =?utf-8?B?VTBFV3VQL3JtQWhncTJpUnRVZW9uK2RFNWdwclBNcFpaMmxaWit3a1hHZHJS?=
 =?utf-8?B?NXFGU0ltN3h0NVUrRUtQazEyL0grV21rRVFyajlJRmd4K3JaRi9ac1haK0Rt?=
 =?utf-8?B?VUh3Wm93U3IyQ0RmMlpDY2RlUFhXSmdjN3p5cjZIN04rcU5XOHdSc2Z2UkFh?=
 =?utf-8?B?c1ZRQVlXYXpSTWkzaXRzeWM0QVRjU3BlNU5aTDBMU1VwOUphUFNybWtYcHg0?=
 =?utf-8?B?VEh5WjlmOEE3SEJ1U3Rvc1ZzWHhxNnFaY3V6R3B3SDdmbkFiaE1vU1l6Yjlv?=
 =?utf-8?B?c0pKemZiTFZ0dEo3dys2UTJQdUdIS2xoVUVhLzZzVE14WUl4MlduZGhBM2lt?=
 =?utf-8?B?MzNxNUx0T0NCSjJ4WldEUExHK0hPQldkUFRURU9uQjBIckpzckZ5MmhSMk1u?=
 =?utf-8?B?Z2JURkd3Z1piUE1DWGp3OHNvWFVNb2xPUDhvS29KQ2d2V3FGSTVyUnRYaEZj?=
 =?utf-8?B?Yys2UHNvcnJsTmZaL1A1MmkxNDlGOHJIdUVRODBWOEdjUEtKektjdEFiQjJO?=
 =?utf-8?B?Qm92SXV2U3E5NHZ5RDJ0WW9QdDh6ZDZkQlNTN2gxcWFoWi9BV3dsSlVNTXdm?=
 =?utf-8?B?NWt5TTZuekl5bG5nWk5VWjAvTlFjK3RhaHJkZ3pZb01sRTB6bCt3U2crMjFX?=
 =?utf-8?B?VWRTeS9xbzFKZFNHOWVJc05qNTNYQVk3RDRTQXdtK0psSFB1NG1DUjJjb2NQ?=
 =?utf-8?B?UGc2cXpvdXJmamVpN2lGbkRpMHY1NEtydjlZM3NiNGZjeDdjWHFydXF3Sllj?=
 =?utf-8?B?MXBRV1oxVVZZeXBkRW1BbnpSMXpmUzJGOENUUEdMTmJBSVNiWER2WFNZRVli?=
 =?utf-8?B?cHRmRGZUSTJLRDJZSGtVUHJQOVNjbjdkWFZWN04rNVUvbUpob3V6M1RHeWFv?=
 =?utf-8?B?WWtRVkFwZWJlVy9jSEhTNDA4dFBlUDZURUlIWW44TTlZcCs0TUtQd1NXK0w1?=
 =?utf-8?B?SnVMMkFxc1NRdmloRmw0ZldKY3dTL2tubzdJMU9kVUtGd1NvQTFXSTl3Yldn?=
 =?utf-8?B?WERUSDZqSWlCSnVmSWNYM0daN1VYN3BIUkFvcUg4VHIxeGlyVkJRZzhmQjgx?=
 =?utf-8?B?RFVQSUNEQ0RGSjBXUzdyTFpTUjQyYTBBbVUrUUVub3Y2elN0K3NtdmpmbHJZ?=
 =?utf-8?B?TG92MnV4SFRScGdMcVlJY2pzTnR0SVVFMlhvdzJKTHc0cjA3ZXUrdjY1NXNk?=
 =?utf-8?B?VnlsL3pQTUM0YlZyam1oU1hpdVllS3g2V3Z4d3V6YjRQN1ExS3E1QURsZGFS?=
 =?utf-8?B?ZzJsNE4zaG5vY1BSVXBRc1RTSm5pcXA3RDhORnZud2psTkxLQU02M3VPZ2hk?=
 =?utf-8?B?UG93TE5YTWk1dG5CRjR1ckxNOUlmMkJwanl1MDEwWDY0dFM3ajZGTm5WZFRO?=
 =?utf-8?Q?iyCsyE/POlJ08EXbA5vucgwMraHpWFeJoSfd8YE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceec560f-5423-4b26-6c07-08d98e208b0c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:07:47.3665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkL0Qub6qNQ+EXSJW0gFK0ZWsQjllCnAdjaR5uejRU+HIK79jo8IusU06z9PXVslZlOWRQjswQJ4WhQYO7r8ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Tue, Oct 12, 2021 at 01:42:22PM -0700, Stefano Stabellini wrote:
> On Tue, 12 Oct 2021, Ian Jackson wrote:
> > Bertrand Marquis writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> > > I can add something in the commit message about the fact that we improve
> > > performance and prevent to do a call that is and will not be supported in Xen.
> > 
> > Thanks but I'm afraid I don't think that is a correct summary of the
> > thread.  Nor would it be an adequate justification for the change.  At
> > least, not unless you plan to write something considerably longer (and
> > more precise).
> > 
> > Firstly, I'm not convinced this change would be justified by the
> > performance impact.  This is a small number of hypercalls during
> > domain startup.  Usually none, I think ?  If someone wants to optimise
> > domain startup speed then I am very open to that but I think this
> > change will make negligible change in practice.  Unless someone wants
> > to tell me I'm wrong about that ?  And if I am wrong about that then
> > an explanation of why my suppositions are wrong ought to go in the
> > commit message.
> > 
> > Secondly, there is no justification there for the change in error
> > status.
> > 
> > Why is this change needed ?  (What goes wrong if it is omitted ?)
> > That is what the commit message ought to answer.
> > 
> > Plus, given that it stubs out a function to make it into a no-op, that
> > itself requires an explanation.  Why is it OK for this function which
> > is supposed to do a thing, to in fact not do anything at all and
> > return successfully saying "yes I did that" ?
> > 
> > I think (having read the thread) that I know the answers to these
> > questions but it needs to be clearly and explicitly written down.
> > 
> > > I saw your change in CODING_STYLE and I understand the request.
> > > I will try to see if we can handle this change before the feature freeze.
> > 
> > Thanks.  I doubt that this will be hard.  I am more worried about the
> > commit message.
> > 
> > Indeed, since we haven't had the rationale for this change explicitly
> > written down, there is a risk that when we do so, we will discover
> > some problem with the approach that we had previously overlooked.
> > 
> > Discovering that kind of thing is one reason to explicitly write down
> > why we are doing what we are doing, but this situation does mean we
> > shouldn't feel we've yet achieved confidence that this patch is right.
> 
> 
> I don't think it is about performance. From a performance point of view,
> we could make as many (unneeded) hypercalls as required. It is mostly
> about minimizing unwanted changes to common libxl code. Let me explain.
> 
> 
> IO ports on ARM don't exist so all IO ports related hypercalls are going
> to fail. This is expected. Today, a failure of
> xc_domain_ioport_permission would turn into a critical failure at domain
> creation. We need to avoid this outcome; instead we want to continue
> with domain creation as normal even if xc_domain_ioport_permission
> fails. (FYI the underlying hypercall XEN_DOMCTL_ioport_permission is not
> implemented on ARM so it would return -ENOSYS.)
> 
> 
> We have a few options to achieve this goal:
> 
> 
> 1) No xc_domain_ioport_permission calls on ARM
> 
>    Use #ifdefs or similar checks in libxl_pci.c to avoid calling
>    xc_domain_ioport_permission on ARM. This could be best but it would
>    cause some churn in arch-neutral libxl code.
> 
> 
> 2) Handle xc_domain_ioport_permission errors in libxl
> 
>    Introduce checks on the return value of xc_domain_ioport_permission
>    and ignore specific errors on ARM in libxl_pci.c.
>    For instance: if (ARM && rc == -ENOSYS) continue.
> 
>    This might cause less churn than 1) but still requires a few changes
>    in arch-neutral libxl code.
> 
> 
> 3) Force XEN_DOMCTL_ioport_permission to return zero on ARM
> 
>    Force the hypercall to return success even if it did nothing.
>    Currently it returns -ENOSYS.
> 
>    This is possible but it wasn't chosen for the implementation as we
>    felt that the hypercall should reflect what was actually done
>    (nothing) and it should be userspace to handle the error. I guess
>    this could be argued either way.
> 
> 
> 4) Force xc_domain_ioport_permission to return zero on ARM
> 
>    Force xc_domain_ioport_permission to return success even if the
>    hypercall would return -ENOSYS. This way there are no changes to
>    libxl.
>    
>    This is what the patch currently implements by using  #ifdef in
>    xc_domain_ioport_permission. It could also have achieved the same
>    goal by making the implementation of xc_domain_ioport_permission
>    arch-specific, and in the ARM implementation returning 0.
> 
> 
> All options above achieve the goal of a successful domain creation with
> PCI device assigned on ARM. You might be able to think of other options
> as well. I think noone here is really set on using one option over the
> other -- as long as xc_domain_ioport_permission failures don't turn into
> domain creation failures on ARM we are good.
> 

I think having a libxl_arch_io_ports_supported helper could be the
cleaner way to do this. For x86 it will unconditionally return true,
while for Arm you could consider poking at
XEN_DOMCTL_ioport_permission and see if it returns ENOSYS or
otherwise.

I guess it's possible that in the future we allow IO ports access on
Arm guests using some kind of emulated mechanism if the need arises,
at which point the hypercall will be implemented.

Thanks, Roger.

