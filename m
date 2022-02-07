Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626B4ABD4F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 12:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266777.460482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH2fD-0002UT-PD; Mon, 07 Feb 2022 11:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266777.460482; Mon, 07 Feb 2022 11:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH2fD-0002S9-La; Mon, 07 Feb 2022 11:58:35 +0000
Received: by outflank-mailman (input) for mailman id 266777;
 Mon, 07 Feb 2022 11:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYSm=SW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nH2fB-0002S3-VQ
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 11:58:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43da9580-880d-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 12:58:31 +0100 (CET)
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
X-Inumbo-ID: 43da9580-880d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644235111;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EjwaVC1lOWXbxNK4ho7Km/hkukehryEVbCaMpGrr2Gk=;
  b=HbG5e7r0aMIYtwMx557AjF9b8AxBXZEnNrY4P1FeDLldOxPUwxQ9V+HW
   +61RoRrPJ3Q9tiZu9RbRpd9YqcnQ407PQh+8e/mazdtOoi027tPw2u4F7
   x/VwHa0tBkfAA3xr5OKLPQdGVvQFk6si7+mbwoGh3J5IwPgULiuL2q94h
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jkFriPrE20WyII4DKXoa+b1H6ehKmfe5a7Oe9IkTuBQ++3GT5ONYUgKexR5Mtj8KZqYDXRixcy
 KpcMItXx6VLNTaOU0+Gdc9bpJjEJpvh0xP4IDR0fo7D7vnwPvMgSVEqIx5A8YSEj0TKI0hZ6kj
 WXXjUS2ECt+GymQ3EyBB4w6/Ln3ep4o8vRTtXBfrkPZzaUmchkCRn5w3GP4iET8mb3JBfy54TG
 C50BxczQu93ejH8R9S3cUhOvAdghIobKp57uxS3+LH5X86tGlTQ8bJpA64UEQYjA5QTmRzt0EI
 UldklG6ruKjxHvfU4kFc6Zpv
X-SBRS: 5.1
X-MesageID: 65845262
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IAe4w6pR/WOHqARp0gwEiQedUJdeBmJHYxIvgKrLsJaIsI4StFCzt
 garIBmCOfmJamb3fYslb9+/o0kD75Dcz9dnGwZu/iEwFCIUo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24DmW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbfoQwgSGoLipNYQS0ZBPDt3JYl/x7CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4TTaqDP
 ZRDAdZpRETvYx5lBw82NL87uvyruCD/dC9esE3A8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2AmlqSgevIkTL+SZglPrSy/f53g3We3mUWThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYDX/JAHut87xuCooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaOyIYMGsDbi8sVhYe7p/op4RbphDAVN9nFIa8i9TnHje2y
 DePxAAzh7gWzt4G0Y2+oEiBiDWpzqUlVSZsuF+RBDj8qFokOsj1PORE9GQ3895rdIyWdX2uk
 kQ2ltDB9c8UBImprROCFbBl8K6S296JNzjVgFhKFpYn9iiw93PLQb288A2SN28ybJ9aJGaBj
 Fv7/FoIucQNZCfCgbpfPtrpY/nG25QMAjgMuhr8StNVKqZ8ewaclM2FTR7Bhju9+KTAfExWB
 Ht6TSpOJStAYUiE5GDvLwv47VPM7npvrV4/vbihk3yaPUO2PRZ5s4stPlqUdfwe56iZugjT+
 Ns3H5LUl0kGAbSnPHiNqNV7wbU2wZ8TX8GeliCqXrTbfloO9J8JV5c9Po/Ni6Q6xv8Ix48kD
 1m2W1NCyUqXuJE0AV7iV5yXU5u2BcwXhStiZUQEZA/0s1B+MdfHxPpOLPMfIOh4nMQ9lqQcZ
 6deJK297gFnF22vF8I1NsKm8uSPtX2D2GqzAsZSSGJjJs47GV2VpYOMk8mG3HBmMxdbfPAW+
 tWI/gjaXYACV0JlCsPXY+io1FS/oT4Wn+caYqcCCoA7lJzE/Nc4JirvoOUwJs1QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGNgz5Cr5pLnSc89NIs6lBmu1QtQesA
 xrd8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8ePeA0tIPhSKhChMF5dPMdsok
 bU7pcobyw2jkR52YNyIuT9ZqjaXJXsaXqR56pxDWN33ihAmw01paIDHDnOk+4mGbthBPxV4I
 jKQg6ae1b1QylCbLig2HHnJm+FcmY4PqFZBy1pbfwaFnd/Mh/kW2hxN8GtoElQJn0sfi+8ja
 HJ2M0BVJLmV+2Y6jcdOaGmgBgVdCUDL4Uf20VYIyDXUQkTAurYh94Hh1TJhJHwkzl8=
IronPort-HdrOrdr: A9a23:CwDYRajtqFwJ8vu+yxww7HfOMXBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,349,1635220800"; 
   d="scan'208";a="65845262"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F89Cevid0G0s+zXzmuUGe7LwDC/wc4TM/0a/IzWBS1LsmkazTBAlt0JzWN0d8bHUMLBMjWwqxuy0CV6gmjbB0TAfyTOo9DceodUCJZjVCtxhsTuSiKntRzKi9Ads+lGuLzkfO5nMI8vaWOFUuC/7pc5pwo4MjzqoD4JL8RpWDTqG9cZz4/Z+Ic7QZ+e2JAGFtoGO5FUqwK0AdwbZYWgXkwOQ2ugRG41QxsCX3dgbR3CExHoSS72bZxUVT+L2EMIKskLbYR1zf+7HH7VppqxYButKwk6fSTZskaKlzjQf1FSeI1okQJ6L0FVU94HyaD0djLN65YUVgr1i/3MZsL+yJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iq+8m9qsftcZOIGoD/LsdsZv4D2ECNj+IK28MoDaZ5w=;
 b=eCxEmBv/YoI/boJnF/ulAGQn2UfKO5A0od1DcZ/HbOYy1iIbYljtzxR8i/60ljwRZOr3D8Np8yFPfi7bpO2s6DttRO+jU/3jJTcBBsN9aSZaqqOhZ0wZP5vycjaD1MWCsWZA3osHPGpTV1PDpYJn/gE5T+pOymFjxkXqxCT7604g8w1bNAx5ndLzqaTW5MKh2jxdxSLkU+NS3rrddNydJPD3gJsJc8BrQYf2Q9P3t7G2Xi8yOkp2+Qq20OG+Pplzgp1KabIf3YbWDiABAQ4AkNjXVCRxLwp3fT5FiBsqetvSSmf2Qogizlip5CihGxB6u0sRtOC1cN+6tU0ANgG6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iq+8m9qsftcZOIGoD/LsdsZv4D2ECNj+IK28MoDaZ5w=;
 b=GD49VYEFNAxUlDMCVuHlDeyWRVyGsqSXpiXxXPHUX8kWw2FGa1HCopg6bgZijHBu2BLGy6N3OPBSyj1VmyLs+CpFj8MKd8Mzjy07RsfvCZ7sDEOuRI/n9MtLTa90ZsbTDlAapqsb80RBXQzmM7Uan8srX9I3EUX7N3o1c90TBi0=
Date: Mon, 7 Feb 2022 12:58:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, <ehem+xen@m5p.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC 3/3] xen: Introduce a platform sub-op to retrieve the
 VGA information
Message-ID: <YgEJWLF/yp8YkU2M@Air-de-Roger>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-4-julien@xen.org>
 <4da70949-7d6c-65a4-662a-301bb7075bc0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4da70949-7d6c-65a4-662a-301bb7075bc0@suse.com>
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7da7129b-1ba8-491c-5387-08d9ea312260
X-MS-TrafficTypeDiagnostic: DM6PR03MB3785:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB378554082A610EAD76D5C8B18F2C9@DM6PR03MB3785.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnJAFqfypU4zMb7f785MR30VbQ+jwIRMjSEwyK1DaQqdqa0gOQG+w8Z8JC/TFqD2Istf+wP6HWUmFPEPhEyweNjj7l1ejoG8Eymhmbye5yrEJ0kC4HjUftkHfAFwEGed6H5E62Vf30XQh2Z3U/iL50a4GXOrVDtACoChlSmRJR+z2LITaiwwg0Fys1QgNkgxrrnwVDu5Rus+flVya1uSsexgMrT+ufmHy79HPr1gXZ2tSXHOVpQlFyyFUMPMzyjhtw5NJJfd9egp8Ft9AmoTIvC6Et2ayXqCOUXw1sVqbq/n5CIUI/F7O3p24kcFiEZTORyg41ebcU86vvr2wJJovWFmWz0aMV9Wp4DeUDlWMb0m/VcukPqTM1vmq0WzkZe2wov4qOe3H/x29kh2qaJcIuifrJdiFlyJdnLX/Ly9CoDYdo4zIWRLxKusJz166P5Xfa2uosYcQH1RqSo4OqLhzNkBULpD8ZCQWlNyhjLNQgEuIEiVT/Jg8BKpPadZRhjvszeWTovwtWzAEdq6H+v8LyI76Ob+5K0C8LRjW56wph7bYCkPdizZ8n6/t6LS06oukW1wxHJxeu+iSaYr8vWmgWMeFlSLmnYZ4hqd20kPw0au/Ue5f3eVGfBn4/7mqnJT1dFWdle5QZDjwz6ck92jVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6916009)(82960400001)(33716001)(6486002)(86362001)(54906003)(85182001)(316002)(38100700002)(8676002)(6666004)(4326008)(8936002)(66476007)(66946007)(6506007)(66556008)(53546011)(5660300002)(6512007)(2906002)(186003)(26005)(508600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NUZ2tCSEFFRFpMT1gvSENicjFZTUp4RjNxVVYzdnpDek94VkNCSWpVTkJx?=
 =?utf-8?B?bG1qb212dTg1UUxoKzk3Y1U3Wit3RG1MMllkRENIckdNN2E4a0t6aGJXZW5v?=
 =?utf-8?B?YWtUaVJHQkw4eUcrRURraE9ZaWYwdmJ6VERuMktoZ25laDFhUWxRNk1yZW10?=
 =?utf-8?B?TGFMWE1ubXZzaHlEQm8rSnJka1Axc29Kc29hK1RHWXJFaVdNb005Z2grVnp0?=
 =?utf-8?B?WWVMV1hVNVViWWZGb2JLM1J4U3ZFWElJa1ZzbGIyUzhScHdxZ1ZDQVhIOTAr?=
 =?utf-8?B?NU1aN3VpZDl4MURKSXM0Sngzd3pSY01BeHcxRWRrY0graThXVjluMWpMZFFm?=
 =?utf-8?B?MnN2K2pKeXhrZlJRdDdEUmdLdE1VME1PZGUxS2FOZE1lamR6bE9BYTZ4OFlh?=
 =?utf-8?B?dmNnSVBKY0hPY2lvUTRCY2UxVUNpSVAwdjkzUERWcW5BdXpsS0F2Ti9QVDFt?=
 =?utf-8?B?akltcTM1bU96VnFjK3JLWE8vQXFEVHJGS3V5ejZraTlaSldxVHRURjBNMzd3?=
 =?utf-8?B?NFFJYUJJdnFtVVRmOUNWbDhQZVUvczZJSklKMlZRblJUUHFVMEFvVVpzU04z?=
 =?utf-8?B?ZWoyZU1OelJuUm5DWm15THdXQ09YcFg5d1Z3a1ZYdEZlSTVpK0hCUEZ2VS92?=
 =?utf-8?B?bUc0MG5SVmg5SEFZTU5rcStXQzVkN0lkWTZrK293NWhsTGp5SjArSTlDNFNl?=
 =?utf-8?B?TEYrNzVsNWVHWXZ4OUtTSm1hZ0ZoOVdQRm95aE02cjVOUVU1MGNSUjVDb1VE?=
 =?utf-8?B?VUhyeTJuNHJVQlFwMkhtRWIreUptcCt0eWluWnlWb3dNRUtBdGllVWlpd3JC?=
 =?utf-8?B?QUlyRi9acTNoQWJTVUs5dEwwNFZmeDJXSitkczhzSFAxQWhrV0Z1M3RBdW9J?=
 =?utf-8?B?MTdBSEJsWmE2LzdHcGViZnliVWM0TFRtdHpEbUI3QWdHcUtDRk1oWnZXYUVF?=
 =?utf-8?B?ekY2ZGZtOTFQTDJSdWM3cGFwbWk3ODYvOC9WZkV0TU93UlpiSVJ3d3hOQUcv?=
 =?utf-8?B?RmR1WTFVazRUYnNqZ2UvMzY3UDd1cmtPL3cwa1BDcjBES0xkdG5rS3pBa0pH?=
 =?utf-8?B?SG9adlRKL0pqL0MxV0RheTRsK2JxajlXL2xwSitCWHFWWWhPSFA1KzNjeTRi?=
 =?utf-8?B?Z3drRkdPTVlDQisvUkFOUEM4NzhpQkt6VU1ia1JXUllsOWJobEc5TjRCZmRY?=
 =?utf-8?B?Ym9uV2FDQ0haWGluQ244ZEFoWjRBOUkxb1p0K3YwaEE1VnM4eExLQU5LUFZN?=
 =?utf-8?B?SzB3cG9mUk5uTG9WcmFjSmVjcUYyZnFZK3B6RmtoNUxoWDV4cFROYVkzWVk2?=
 =?utf-8?B?Q0lEL0p5bkNsMXpSbGNkMWpTTUdrQkNuZlRkSjQ4ZDJPRnhtQUpsK2RyazlY?=
 =?utf-8?B?S29KTUVjYkpETittek4wTGloTGhtQXRybGd6eFpDRTJiS055VlhacHovMGtZ?=
 =?utf-8?B?VktLcGE2SXk2aU1OTXNsMXZ2MFJuVExGS2h4R0ZmZ2l6ZXRwd2REcGlDMlZQ?=
 =?utf-8?B?SHNZOXZiZXVmekIrZGR0VGhpRlB2YWcyZFFtSVZqNHFrS1k3dStHaFdYRlZq?=
 =?utf-8?B?NTQwUUozbUdGKzFUMnNHdHMrZ1NKUS9zSEEvVDRMUGdiTWlDRE9ZZzRBTVZs?=
 =?utf-8?B?L2svNHVmbFBwdG1DSkJiclB4WXZ4QnRvbEZ5UjRwTzIyUlAwaU5ranF6Y21C?=
 =?utf-8?B?a3UrQ0NtRFRqNGJiTUtnQS9xK1IwQXFTR2M3bllWaXUrKzFXQ0tNdlJHaTYz?=
 =?utf-8?B?N2x1d1lROWVOWkllditZc051UGFLZm55SFpzYlZ1ZWJrcjBxbzdvZ0hianJ0?=
 =?utf-8?B?TkxWa1FSNHcyV2FSNE1oZnc1cjdyemdGcklNTmF4VHZJTTVFYzhFVGJFNkxl?=
 =?utf-8?B?elV3TWZBUno0OUFWVmZvZGRaZEU1WHh6YUVqeTU2VWFRUDZqaXJqZTc3ZTY3?=
 =?utf-8?B?b3I1M3dJK05MMHg0ZFFqVmZiNndNOXlTaEh0ckZmR21CbDNwOWNBdTJQWVhJ?=
 =?utf-8?B?T1hWTGRoUExMeTJqYUpPNVUzWlNadHl1OFgrOFhhSmFuTXQ4eWwyRW92cWpJ?=
 =?utf-8?B?TXBjMkJDR0VONlFSRWY0aCtmOXV2WUQvdGd3NzNCZFJvV0lHdG1ITUg5aE9j?=
 =?utf-8?B?WjIyT1p3UG9UZHdtdmhzSUh5WWtNVlZDN0JqUjVxcGtCQUJRNnVwY3NDV2xh?=
 =?utf-8?Q?TeTqGhqLomlWuec6T8wvZO4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da7129b-1ba8-491c-5387-08d9ea312260
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 11:58:20.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEdpUleytzunD6Okg6s5lz5sBFjE2EIrvvbdCJRfFPUqw1yqu7ldbUZZdUxz25NUzw2Nu2Kt9Eiu2aUHDxlgyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3785
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 09:57:55AM +0100, Jan Beulich wrote:
> On 06.02.2022 20:28, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > When using EFI, the VGA information is fetched using the EFI
> > boot services. However, Xen will have exited the boot services.
> > Therefore, we need to find a different way to pass the information
> > to dom0.
> > 
> > For PV dom0, they are part of the start_info. But this is not
> > something that exists on Arm. So the best way would to be to
> > use a hypercall.
> > 
> > For now the structure layout is based on dom0_vga_console_info
> > for convenience. I am open on another proposal.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Cc-ing Roger as this may want using for PVH Dom0 also on x86; my
> first attempt to propagate this information was rejected.

I think it's easier to use a Xen specific layout in XENPF, as that's
already a Xen specific interface.

I wonder however if passing the information here (instead of doing it
in the start info or equivalent) could cause a delay in the
initialization of the video console. I guess the same happens when
using the Xen consoles (either the hypercall one or the shared ring),
so it's fine.

> > --- a/xen/include/public/platform.h
> > +++ b/xen/include/public/platform.h
> > @@ -244,6 +244,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_efi_runtime_call_t);
> >  #define  XEN_FW_EFI_PCI_ROM        5
> >  #define  XEN_FW_EFI_APPLE_PROPERTIES 6
> >  #define XEN_FW_KBD_SHIFT_FLAGS    5
> > +#define XEN_FW_VGA_INFO           6
> 
> Perhaps s/VGA/VIDEO/, despite ...
> 
> >  struct xenpf_firmware_info {
> >      /* IN variables. */
> >      uint32_t type;
> > @@ -311,6 +312,7 @@ struct xenpf_firmware_info {
> >  
> >          /* Int16, Fn02: Get keyboard shift flags. */
> >          uint8_t kbd_shift_flags; /* XEN_FW_KBD_SHIFT_FLAGS */
> > +        struct dom0_vga_console_info vga;
> 
> ... the structure name including "vga" (but if the #define is adjusted,
> the field name would want to become "video" as well).

It's my understanding that this will forcefully be
XEN_VGATYPE_EFI_LFB, at which point we could consider giving a type
name to the vesa_lfb field of dom0_vga_console_info (video_lfb) and
use the same struct here?

There's no need to propagate XEN_VGATYPE_TEXT_MODE_3 into this
interface.

Thanks, Roger.

