Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A336F4C4788
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 15:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279161.476737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbdX-0001lI-Hl; Fri, 25 Feb 2022 14:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279161.476737; Fri, 25 Feb 2022 14:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNbdX-0001iu-Eg; Fri, 25 Feb 2022 14:31:59 +0000
Received: by outflank-mailman (input) for mailman id 279161;
 Fri, 25 Feb 2022 14:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=halk=TI=citrix.com=prvs=048fa7b34=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nNbdW-0001io-HR
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 14:31:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae2fa30d-9647-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 15:31:56 +0100 (CET)
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
X-Inumbo-ID: ae2fa30d-9647-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645799517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UhfEm22/Cv36tYP4Emir/j2Tu0W4Ek1hZclOq0pCCJU=;
  b=Tj2QiIcQ1xRJ/ibjFTZ9oCvt17auWCyILrwyJQY6HhEIF3uwiJOsiyQZ
   VCFq2/muDIVYNI1YZYmWslMVEDMZdktG9o6VaiFuEgvDrecPoObdhYUIT
   bYLXEm7mjuHnN5NR+063CUsbW1CoVCDV7YBbmUmAm9eUXKpA5YAD/A4Xx
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64994573
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kjYqEaNabRvb+QrvrR1el8FynXyQoLVcMsEvi/4bfWQNrUoq0DwCz
 DMdXziBa66LZmbyL4wkbN/j/B4CucLTn4NjQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 vZNnJeMSF4TGYLmlNkWeAR2Lx1aBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALDsDtMcU6s3VpyTjfAN4tQIzZQrWM7thdtNs1rp4STKeCO
 pVCAdZpRBWbWTBBAHRNNJAzk9ajnGCjWgxShHvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt8G+oh+LJtTP2XsQVDrLQ3sBthFqf12kCEio8XFGwoeS6okOmUtcZI
 EsRkgIipLY/3FamRd78W1u/unHslgEYc8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZQkK+d74u6kokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vmRGsj5P1T1cPwSr9Ul+uxR5XWLKBXtn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2Vd0IuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jPISM/CdlyfdpUmCgHJ8OUi3wSDAdollZ
 P+mnT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiLIFutcbAbWNrhhhE9hnOkz2
 4wOXydt408CONASnwGNqdJDRbz0BSJT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU57YU6QXF2+eoGx1gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/lqCKXbfb2yO1PrrVc8=
IronPort-HdrOrdr: A9a23:EpQ+N6zp6PwwoR+eoT60KrPxheskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBdpTiBUJPwJU81bfZOkMYs1MSZLXbbUQyTXc9fBOrZsnHd8kjFl9K1up
 0QC5SWZOeAb2SSyPyKnTVQcOxQgeVvkprY/ts2pk0FJWoBBsEQjDuRSDzraHGeLDM2XqbRf6
 Dsgfav0gDQAEj/Gf7LYEXtMdKzwuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX242oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF3nAjv0idprD
 D/mWZlAy1B0QKXQohzm2qq5+DU6kdq15Yl8y7AvZKsm72geNtwMbs+uWsQSGqp16NnhqAn7E
 sD5RPoi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4bkWUzxjIdLH47JlOz1GnnKp
 gbMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wixJw/r1Tol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdGiSPVPkHqcaPG+lke+83JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTdaD2ZVamyq9NllVnQ6dvf22y6IJyIEUHoCbQhFrYGpe5vednw==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64994573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ule0926Yh3PFsaCKjS2nIs1f2VMUNJheUTyIlP90Af/4I6flRoGbBI4On+bOh4HR97zMlkMqI7CuUwMRWNG4017iikccxbRL3uzi3PsrcEfdzgpnvnEZV+zRxDRg0/1R6Z1xqK93q5hfBrXeDCrcX3S+apG3YTtvgMDo2QiXZkoxE4Fo1cQmU+u6TkhHbrGdyoHqdfjoaB9sb0892K0T0LZp5jDmdVeYi94r2Fi1SiwH4RRY5dGXcKqF8syKv3iIQAnh2vFL/rWCYMYSrDGO7XBvS1bYEDJPcwwnaLqBGfUMABR9rcuaorbOp+AUN2Zb6HnrPbL4IUN4soWgQfwXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhfEm22/Cv36tYP4Emir/j2Tu0W4Ek1hZclOq0pCCJU=;
 b=RbZN0ewzzRhE6HDtfaFCm3+pw25EJX+xlJJXLLQgJ+LVDiVLD5yLhHz1TiCcKyJAvE1Ny3SOc01iADVKbgeBsFXfN0pqeJnaRlLBdoI3m2BQniX8HieCpErfI+9okf9eiXiYsqfXq15VN/ikCz7uGrJMCShZXqAsDhhBJyyn4SAtvDndCbW6herv2bddWjHewfDLmL9Q3VyDw/5WeZ7H0Ozqhk9xbGTpkDBV+eWbEF0le7MPlWmxLcsCaMAE7x+A0IVlgmgYHgSGl2eybJvfBD9xwvd+XwwCiO8+KvlFk7zlgDIjQLHWWlxNkLUgJ9aerfSJyWhDH5Cw4QWuxwB2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhfEm22/Cv36tYP4Emir/j2Tu0W4Ek1hZclOq0pCCJU=;
 b=S+DDJNn6O3zCwSInT2pMef9Vfg4v167fmk69DkQZic7ziU19tzrrI6hSr3VtG6Tkh5zUkgpGSczX3fPMmb0Up6ih7N48xPNDlFGgzZjFMJVNE/HnKCdhprW5O8pq9yUojb+iom/wNBDKgIbe+4uOdJOG7dXPB1cVtZay0kmYlP4=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Roger Pau
 Monne" <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYJO0/E2Q9kBLnmUergICAnT03vaykSTOAgAAVuwA=
Date: Fri, 25 Feb 2022 14:31:39 +0000
Message-ID: <2badbdb6-838c-495f-4969-351ee7e73ef2@citrix.com>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <YhjWDZh3kUq1WSHd@perard.uk.xensource.com>
In-Reply-To: <YhjWDZh3kUq1WSHd@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a01e46-f9a5-4697-bb22-08d9f86b8904
x-ms-traffictypediagnostic: CH2PR03MB5207:EE_
x-microsoft-antispam-prvs: <CH2PR03MB5207110D96BF3B83F15FF432813E9@CH2PR03MB5207.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PJ+7NQ6D+6MYhOI1f6nk5WNQQAHlbiOhMgvGVVdXPDzeR0bpFjAKnjm+Rx30NjuRgLtW1/88Rc5b6XHFN1Vntp1A+/aaHry4knRkDmo1pKqAazPf+46og2Fxyk3TLjP1dzQ+8VVu47+VlG+cFzvoSV+HlnLIDTEJJ6zKclDnxXMnB31QUSp2rvGog9eUguBdE+ETzQrM523oGzvlJvsH7SssaShFoTOZGf7+VnGmPIOBCNGZU5H1uWY9eIPbd1mus/tNjLCpVLArGDx26b5CG8vdnQvMDikF6mS6gI2FKnALzd9BmWyY2Udsp1DosAgqklyQ6I0Uq/V+Gv26Nv0xY2gvoSIw0pe8mSG4mCZb+hbJK9EKyZ+Ybl6t3iBiu/MJxnrJY0rdJhnQRnOFOIOsvCq6CVIeH9WTPjQmfEhQGS/JCTN1khYmgRiLOypo/MJA8xctucIoowXkTid9akF0P7jkbijiax1krSXQ9AC05CwJSnu4CaoTqGoaxXeMmx320PWOQ5XQlIzEvF9cog2+Wgb4vEgggBAi1ER0rZO7hXUhXpLAMq4b7zv2l1Dw2dRCZynfPrm/UBeHV2Gq63bgMTJcHPGGPg8wb/KHTY82g83oYt3oXsZ7gTo7AKiTYhWWXJdnXZVQx8lkbMS+NkCBkqwTWQpwMFMGzy6TjwqiYEBGfhoPUB606t9XnHaz0GvYdQ5C9gf6HQAWL3EW6dljmLV9/ok302vDWpeHXlWxM5VvD+xMi/vx6XzD5UyrNl3d
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6636002)(38070700005)(316002)(6486002)(83380400001)(5660300002)(2906002)(31686004)(8936002)(6862004)(122000001)(107886003)(4326008)(8676002)(2616005)(66476007)(26005)(64756008)(71200400001)(186003)(54906003)(86362001)(53546011)(37006003)(508600001)(38100700002)(6512007)(6506007)(66946007)(76116006)(66556008)(91956017)(31696002)(82960400001)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b25JdDZzcXlCeXFtenRzSUVoc3N5cTNjNGI4N0RsNzViZlJ0dzZ3SUpmRkl0?=
 =?utf-8?B?aVBPV05aLzFmV284c2I1LytQL1p5RUc2NGs0cVN0TXp3ak1uNWhVTVM4cGQ3?=
 =?utf-8?B?VW51ZTl2UGc3TnlGVDVJSjlhN0N1Q3Y5TjArelpDM3cyazEvYXUvVXY2R0VK?=
 =?utf-8?B?emJEdjd4OG5TaGtIU0pocm5zTnYzWXIwVElDeUFxQmt6a1crSHFoR210aU1a?=
 =?utf-8?B?K1JHQ2xVRHNDM1NsSWxsWGU0NS9KMysycG5sTWZwQlo5UHQ3WU1tNGtVOUpu?=
 =?utf-8?B?Q1hQTE1lMk5SUDk3Vm9FdkMxbW9keTd6dVlid1JEMC8waldlNndIZlZOVGZP?=
 =?utf-8?B?TjJQdWZzVzhjdS85SVNLRnJRcytFeWJPQ1JPSE1qTXFPaGgwZFJIQm5wMVBl?=
 =?utf-8?B?ZzQ0VEljR0JOeklSSXZTang1NGV2OXhLQjdGNWNtZ0o4ZTJQODN1Z0FqeDRs?=
 =?utf-8?B?b3ovOFZxUkNPRm9lbVJaeWVtZ0M3dGFORi9tcnFLdGplQkkwQkYrSlFCTWtu?=
 =?utf-8?B?cDEyaktwY3RUakswT3l1cG1KSVBTQU9yU3BkdnJscXdoNjhpZGV5bVZuUFE3?=
 =?utf-8?B?U3BhUWx1b0RlVUx1THZnK1dkQjRra0lNOWo5QXltTTFWcW00SGkzcVE1Qklh?=
 =?utf-8?B?Qjd5VWtJQlBuamoxMUZ3Y09Oc0V0azZRSnV1VnRaYW04dWxpSnQ5aWd4R1F2?=
 =?utf-8?B?UkNjb3IveDB6c1pnb296cktOVUVPVitSVnVxOGhnVUNqSzZvR0JFcmRoUFBs?=
 =?utf-8?B?Mm1KUVVNbnZnZWl2Sytsc2NEa0s2ZnZ5YitaZGNpOHpFOTNha2sza0ZINjdG?=
 =?utf-8?B?SjhzNXJ6ZVNyWjhySkpramtGSHZRbXVldVVqYnJkVWVmTlpiMUtKenJZSU1N?=
 =?utf-8?B?eWxjMGducFBHZjl0NklLcWIxL0IrV205cTRCeDFOenFTUjVGVjN2SnJaRlIw?=
 =?utf-8?B?WWt3ZFZsQnpneUVuSUdIbEZ6dlByaFVWSWl1UEl0RWxncnVpTkJ1WVlhbmow?=
 =?utf-8?B?elFSTEJDc0RBeXNrL0NRdUIxemU0UkwzaDVITTlUSzVBaVppM2FoZERYd3Bm?=
 =?utf-8?B?ajlnZHl5OGZOdTBHOFA4YUhjWjF2blNqMVNxSVRaeHd2TUtzcUdHbWM2UXdq?=
 =?utf-8?B?R0JVb3JlV2E5aHRiSkY4NkMyQXF1VzgwL0hmZTBuS2xOSEJQQUdaM3dMMVJq?=
 =?utf-8?B?MDVIOTk1N3VFMEI1YUlld0VtSHJrMVRCdzd6bXo3ZDdVbVZWRysxZ0Z0YU01?=
 =?utf-8?B?eVVJUXNBMVVvK1lHdjBPVjdrMnZNL3BiWDBuTCsvd2hLMStUdGVXS1pkV1pk?=
 =?utf-8?B?YzZ1R3dlV1pvcFhiV0liZE51WXdNK2EyVURlQVFpekUyOEZndTVKclIrVUVX?=
 =?utf-8?B?bjRtaHV3TzUybzNMdit2MHQwTmRHSDRXYitxYzhMZEdBR0k5d3BDUnRUWHBN?=
 =?utf-8?B?Sy9Va1RKMUZUM2hHT0lGdEFLYnJudy9FZVZhYSt3bmtIeG1KMkxaV3VkL3cy?=
 =?utf-8?B?NWhmM1hrWWdOVjdrL1krY0ZONHdjMDBVaUsrRDRLR2x0N1FFSHdVcU5JWmRC?=
 =?utf-8?B?N0o4bkRMOGNxT2wvZmhpREtuQUtuK1lESUwxaFErOXNGYzUzTzVscWxrOWNz?=
 =?utf-8?B?T0R1NElsdFZXc2dReGVETjdMeFdHY0hUL1B2cWFvSzNyd09BVmt1U0ZHcUJ4?=
 =?utf-8?B?RUlkbWVzcDJjbDFSU0RqOTFnOXR5RU84VHpPcjg4dUdkNFg4d2pLYzRWczEv?=
 =?utf-8?B?Q0VyeWMzZTJCWitrdmdmRWRVVVdwM2g2dHFWb0E3KzhOcjZqdHQxWHA4amZI?=
 =?utf-8?B?MTZXNElWU2QyZm1JWnVhbGNiSlFkd25tN0tDcFBUQ1dwUzBlZ1lkUmlUUTFH?=
 =?utf-8?B?bkpYVXB6UkJGbjk5cHcwaFlWUWhFUzUyUFB1OVVXb01IREptamRBalF1T0pj?=
 =?utf-8?B?MjczV3ViWmpXMHF0NUtBOW5xdEdKVUR3bFIyZHdqUmJYWVlzcU1jYkR0Njg5?=
 =?utf-8?B?bm1MdkkvYWJGZTNKY2FPYklBRkNRWVFGa3ZUYjkvSXFMMkx0bFFzMEpYYklo?=
 =?utf-8?B?VnhsWXhNVElQYk8xa0s2cWk1dVorUjVLSy9wL2NqTDlQY1d3R3FlM3lEVW9K?=
 =?utf-8?B?aTFnQlQrS0pmUy9uMmxqamxxVVkveThkM1ZraThQYjRpRlQ1eUJxaGNnRU1x?=
 =?utf-8?B?ZnNhV2taaU02Q2M1SGJKVGowaWdYMlFNLytQYmFCWHJnWTNmd3I5YTc2aURX?=
 =?utf-8?Q?LYzWMLLQS6dmN0TUUIihEtkz6YQl1c1fQp7dWNUNGI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6277DCEFC48774D9E04BEEDB9C55917@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a01e46-f9a5-4697-bb22-08d9f86b8904
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 14:31:39.2832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6k9Skq4TcbY3A2mNKWHcOkhuuxZowQCOLLaYM8lf50BKWq8NyFnyDTs6YG0ohfqCYOdDpzV4CsxDuJBZlJjJ13dJ2OF5wb91Z+ETJaZlKpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5207
X-OriginatorOrg: citrix.com

T24gMjUvMDIvMjAyMiAxMzoxMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIEZyaSwgRmVi
IDE4LCAyMDIyIGF0IDA1OjI5OjQzUE0gKzAwMDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9saWJ4bC5oIGIvdG9vbHMvaW5jbHVkZS9saWJ4bC5o
DQo+PiBpbmRleCAzMzNmZmFkMzhkLi4xYzgzY2FlNzExIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMv
aW5jbHVkZS9saWJ4bC5oDQo+PiArKysgYi90b29scy9pbmNsdWRlL2xpYnhsLmgNCj4+IEBAIC01
MzUsNiArNTM1LDEzIEBADQo+PiAgICNkZWZpbmUgTElCWExfSEFWRV9QSFlTSU5GT19BU1NJU1RF
RF9BUElDIDENCj4+ICAgDQo+PiAgIC8qDQo+PiArICogTElCWExfSEFWRV9BU1NJU1RFRF9BUElD
IGluZGljYXRlcyB0aGF0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIGhhcw0KPj4gKyAqIGFzc2lz
dGVkX3h7Mn1hcGljIGZpZWxkcywgZm9yIGVuYWJsaW5nIGhhcmR3YXJlIGFzc2lzdGVkIHZpcnR1
YWxpemF0aW9uIGZvcg0KPiANCj4gQ291bGQgeW91IHNwZWxsIG91dCBib3RoICJhc3Npc3RlZF94
YXBpYyBhbmQgYXNzaXN0ZWRfeDJhcGljIiBhcyB0aGF0DQo+IHdvdWxkIGFsbG93IGZvciBncmVw
IHRvIGZpbmQgYm90aCBzdHJpbmcuDQpXaWxsIGRvIChmb3IgYm90aCBjYXNlcykuDQo+IA0KPj4g
KyAqIHh7Mn1hcGljIHBlciBkb21haW4uDQo+PiArICovDQo+PiArI2RlZmluZSBMSUJYTF9IQVZF
X0FTU0lTVEVEX0FQSUMgMQ0KPj4gKw0KPj4gKy8qDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9hcm0uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4+IGlu
ZGV4IDM5ZmRjYTFiNDkuLmJhNWI4ZjQzM2YgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xp
Z2h0L2xpYnhsX2FybS5jDQo+PiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+
PiBAQCAtMTM4NCw4ICsxMzg0LDkgQEAgdm9pZCBsaWJ4bF9fYXJjaF9kb21haW5fY3JlYXRlX2lu
Zm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLA0KPj4gICAgICAgfQ0KPj4gICB9DQo+PiAgIA0K
Pj4gLXZvaWQgbGlieGxfX2FyY2hfZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9f
Z2MgKmdjLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqYl9pbmZvKQ0KPj4gK2ludCBsaWJ4bF9fYXJjaF9k
b21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2J1aWxkX2lu
Zm8gKmJfaW5mbywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBsaWJ4bF9waHlzaW5mbyAqcGh5c2luZm8pDQo+PiAgIHsNCj4+ICAgICAgIC8q
IEFDUEkgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCAqLw0KPj4gICAgICAgbGlieGxfZGVmYm9vbF9z
ZXRkZWZhdWx0KCZiX2luZm8tPmFjcGksIGZhbHNlKTsNCj4+IEBAIC0xMzk5LDYgKzE0MDAsOCBA
QCB2b2lkIGxpYnhsX19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2dj
ICpnYywNCj4gDQo+IFRoZXJlIGlzIGFub3RoZXIgcmV0dXJuIGluIHRoaXMgZnVuY3Rpb24sIHdo
aWNoIHdhbnQgdG8gcmV0dXJuIDAgcmF0aGVyDQo+IHRoYW4gdm9pZC4NCj4gDQo+PiAgICAgICBt
ZW1zZXQoJmJfaW5mby0+dSwgJ1wwJywgc2l6ZW9mKGJfaW5mby0+dSkpOw0KPj4gICAgICAgYl9p
bmZvLT50eXBlID0gTElCWExfRE9NQUlOX1RZUEVfSU5WQUxJRDsNCj4+ICAgICAgIGxpYnhsX2Rv
bWFpbl9idWlsZF9pbmZvX2luaXRfdHlwZShiX2luZm8sIExJQlhMX0RPTUFJTl9UWVBFX1BWSCk7
DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gICBpbnQgbGlieGxf
X2FyY2hfcGFzc3Rocm91Z2hfbW9kZV9zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsDQo+PiBkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF94ODYuYyBiL3Rvb2xzL2xpYnMvbGlnaHQv
bGlieGxfeDg2LmMNCj4+IGluZGV4IGUwYTA2ZWNmZTMuLmMzNzdkMTNiMTkgMTAwNjQ0DQo+PiAt
LS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3g4Ni5jDQo+PiArKysgYi90b29scy9saWJzL2xp
Z2h0L2xpYnhsX3g4Ni5jDQo+PiBAQCAtODE5LDExICs4MjcsMjcgQEAgdm9pZCBsaWJ4bF9fYXJj
aF9kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLA0KPj4gICB7DQo+
PiAgIH0NCj4+ICAgDQo+PiAtdm9pZCBsaWJ4bF9fYXJjaF9kb21haW5fYnVpbGRfaW5mb19zZXRk
ZWZhdWx0KGxpYnhsX19nYyAqZ2MsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICpiX2luZm8pDQo+PiAraW50
IGxpYnhsX19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9k
b21haW5fYnVpbGRfaW5mbyAqYl9pbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX3BoeXNpbmZvICpwaHlzaW5mbykNCj4+ICAg
ew0KPj4gICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPmFjcGksIHRydWUp
Ow0KPj4gICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPmFyY2hfeDg2Lm1z
cl9yZWxheGVkLCBmYWxzZSk7DQo+PiArDQo+PiArICAgIGlmIChiX2luZm8tPnR5cGUgIT0gTElC
WExfRE9NQUlOX1RZUEVfUFYpIHsNCj4+ICsgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVs
dCgmYl9pbmZvLT5hcmNoX3g4Ni5hc3Npc3RlZF94YXBpYywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBoeXNpbmZvLT5jYXBfYXNzaXN0ZWRfeGFwaWMpOw0KPj4gKyAgICAgICAg
bGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPmFyY2hfeDg2LmFzc2lzdGVkX3gyYXBp
YywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNpbmZvLT5jYXBfYXNzaXN0
ZWRfeDJhcGljKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBlbHNlIGlmICghbGlieGxfZGVm
Ym9vbF9pc19kZWZhdWx0KGJfaW5mby0+YXJjaF94ODYuYXNzaXN0ZWRfeGFwaWMpIHx8DQo+IA0K
PiBUaGlzICJlbHNlIiBuZWVkcyB0byBiZSBvbiB0aGUgc2FtZSBsaW5lIGFzIHRoZSAifSIgMiBs
aW5lcyBhYm92ZS4NCk9rYXkuDQoNClRoYW5rIHlvdSwNCg0KSmFuZS4=

