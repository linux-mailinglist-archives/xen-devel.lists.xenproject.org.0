Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED44D4CA5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 16:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288431.489082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKSI-0007IS-DC; Thu, 10 Mar 2022 15:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288431.489082; Thu, 10 Mar 2022 15:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSKSI-0007FQ-9a; Thu, 10 Mar 2022 15:11:54 +0000
Received: by outflank-mailman (input) for mailman id 288431;
 Thu, 10 Mar 2022 15:11:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYsB=TV=citrix.com=prvs=061b0cdbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSKSG-0007Da-HW
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 15:11:52 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67d1d6b9-a084-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 16:11:50 +0100 (CET)
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
X-Inumbo-ID: 67d1d6b9-a084-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646925111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6fHjKMi/wGx86a90+Z66LOZxDkm78bQiP95NEwXV0tk=;
  b=QhCEA8r9peMV5VGR/qSGEoG3zYd0OjrXZVkStZT1t3nxjCXdOPn0c86B
   RQMGKhw5R0KsgJrMHOQOKJciRYCuyvxg6jlw+zbBb6VtTBiMRnIY3qOi0
   8D+U2M0nbGyMqPK6Dr0IffOYYKgnNNpDhgBAlUvnjfzOXip693iBToVFR
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65853466
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tOdTeKMVql+qT17vrR2+l8FynXyQoLVcMsEvi/4bfWQNrUpxgmECn
 TBMC2qFO/qKZ2P0L40nb4WwoUME75fUxoBgTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29Yw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 99zmZvoeSISZIboo7wQCRIGPD9YBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmpg25sSQ6i2i
 8wxQzVAMCzqZDd0akY3OqtmjtqFmlTWWmgNwL6SjfVuuDWCpOBr65DhN9ffd9iiTMBcjEGe4
 G7Ll0z6BRcAPdDZ1juB8VqrnObEmS69U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwC6H9IbTuza8PTIvagUZZYYt6uAoYwV/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62tr5m4XalznDlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJ2+0O
 RSI4V0Buve/2UdGi4ctM+pd7OxwkcDd+SnNDKiIPrKinLAtHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdAFUdydnXc6qwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:sXECYKN/zj5He8BcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwPU80lKQFnLX5WI3NYOCIghrPEGgP1/qB/9SkIVyEygc/79
 YQT0EdMqyIMbESt6+Ti2PZYrUdKZu8gdqVbI/lvglQpGpRGsZdBmlCe2Om+hocfng4OXN1Lu
 vV2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnT4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUrZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpwoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPXi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZNIMvD0vFnLA
 BSNrCd2B4PGmnqLEwx/1MfjeBEZ05DUCtvGSM5y46oOzs/pgEM86JX/r1bop46zuNPd3B13Z
 W1Dk1WrsA9ciZvV9MEOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65853466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiCY7+ZNfBX3XA7yEo8TS561PhPBrdagu2OMJLD9/cZ+WkCdiu/xM9v5i6QzD5+Js9stqvuHUsn+Q+Lwy5ASPo6sKOfE4glpNs2AY4Co1tTil0Q3jweVvpmDqKxWHjCgSQ+c+qoXzVddJhXj0LjlRaS4GgtOHCcsslO/WvWOoNJC6oNY7nLAYBl7QOhfHM/94+ceXZ5JlYbIKoiBMttiGuSr8R5/AJ900JM2sIOcTBek3pQ3RczU/1ZydrR3UeV1rHRWlU1VTugX3sMRBsCMoc91MA7mhoQELFt/LC6mbx63rZ4knCljAxim2XoVZAnnGtQblr7hrtKVM1APnfzy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDDTVvU5pkOqH4mj8UISu1ZWsAuZpj7tZtO5zjXp1J4=;
 b=H8T69q4s0DbZExg8pjRCQ67+aZl/egfrn7FwBRwA+1VWYvdZrCwNwjapcPbp4OkomvrQZ/ZsyJCf+07bfaCYw1z7ctQ4nvhPIYNsn7EHCbNeczsipK9yOTQ2FB+EuZ1t8a/Axk3UHP5ASPwTqnY0/lnb/R7I1Bby2URRTqAest92STayvAHOXVccCvlmHi1ubMMXGa7GogZvjlMPz0h1ntyeU6aKoXjj1LKtqsVuUN0luSQv/gV4B/Me8j/ov4T0vTvrBfg3Ps9CrQi+wXyWTAdPSwK7V0adLqTRsv063zeyUoxFrgr8MjtN/A4kvxXCsnrvO0KNuqRpQcF/T2+g4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDDTVvU5pkOqH4mj8UISu1ZWsAuZpj7tZtO5zjXp1J4=;
 b=Qcmy2I4RIxec4Aj/vZI0DVdOHhsMwwOVFHylU7G0RcV2aeP11Zxoj5DkblUW7sYnaNOBukuUQRse44mwN9LpKsG+UQxVdMgMeH35dQ01AUiXLS6ES8XBfUBr86XwrBzhsmy7aiwiU+JqtbwmbXOPlWj3CB6I2cKpsB+9anyJSOs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <doebel@amazon.de>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 2/3] livepatch: add extra efi/ objects to be ignored
Date: Thu, 10 Mar 2022 16:08:33 +0100
Message-ID: <20220310150834.98815-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310150834.98815-1-roger.pau@citrix.com>
References: <20220310150834.98815-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3da9832-fd74-4d24-553d-08da02a84a32
X-MS-TrafficTypeDiagnostic: BYAPR03MB3624:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB362480D091A187EE1EE697258F0B9@BYAPR03MB3624.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjv9jfppUF+E5oBGZgRCm6YZrr2Lt1s/3lHFYrAOwXySg0k6ue5xKiTUlJVpe8f9l1I39DYuRAC9y9QTlfuvW1x4YHxuH+xbBOC641QwVwMvfitisvH05umjIE/RP7o6C+fYINm2MZ5koBrm3aElJATqwaLddiCm0ySFGrEwArrLSXwHrqpb+QOK7XKbHmTkFEa6Ask/OjpkZTU9LJHrl66sOD0D6XAOpr5syKzn2ZCG0QgtDC+158OTJ+qnxuCHC4cGkJglo10N3XP0h83pj1vi9PzZJBGxJm9dtzIK2EJxS8fz4tY1j3oaTxNNdv2jujt8vslZhh2rdKmDGWKGzmAkOK7y7exUsDUzeDopZWSVAWhu0WJ7cjuopj+auHTFqQFnHxFra5gZCMpFmpAEklJHJVoK1xIvA4AWa5YKZKHUY7LjTTdZKqxlYL/QG9UQxAxXkSI0Ig6FQsKE6H+fIvNpro7cWX74s1+UQT3j6EjyPp4tquEkXEYgs7gM+Sb2kCjxLqG0gWFcwHb7n4Pv+vmMVD8pBD8gS371YeJoEBZEQKBYDcUnS0EkDjk63FbG+8fUytzSAbU8Z7noLa3mp30zA/2z9N67EsWiFszJltoRY62KznrG2CasB7pnycj3raScvplPvTLofRsQ6f0Swg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(186003)(2616005)(26005)(1076003)(86362001)(38100700002)(107886003)(5660300002)(6506007)(2906002)(6666004)(66556008)(8676002)(4326008)(66946007)(66476007)(6486002)(36756003)(316002)(54906003)(4744005)(6916009)(82960400001)(8936002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlNeVJMRW1xd0oreitjWStOeFRNWkZNcXZvWnRqR2VkY3BJTUJuVGUvWEtF?=
 =?utf-8?B?ektwQks2TjZNUXl4WXhwaGs3ZXhiY2NVb3dGcVhsS0ZjYTBnaHdFemlVbngr?=
 =?utf-8?B?N3UxY081TURjemVQNkNObG5yYlZkL2w2Mk9ZNjRkVVBqbXAzVmozTm1SQXpx?=
 =?utf-8?B?Mnl1U2tBVkhsdDVSaXM2MkR5VEJRZFVBV3UxNmZGbUxmUm5HUFBVcmFobzM0?=
 =?utf-8?B?NXVlOVo3SFlyZ3loK29JQUNoZkh1RGZwcnBhNnYxT0E3Y2lJVjZEVlBPbXhC?=
 =?utf-8?B?TjhIL0drL2tqdTFzMGhmZWdxOEk2Z0lVTzdVcE5ucVRBaEVZZ0VQaXNGaEJV?=
 =?utf-8?B?Mk9qQXRIbDc1cHRsallGWG0reEdpUWxMTGdJeFBXZThUUVV0K0ozZVpkNmRk?=
 =?utf-8?B?Sk9reEthUmpDMng2Tnp4b3ZjaUhocVIxa2pPSTB0M1hTOXkwLzk1WHJxZitx?=
 =?utf-8?B?a0gxZlVZSDZ5RFNacXV0b0VPMWhOdG5CWE1FcXJ0SnFwVHJTSkxieEI1TlJG?=
 =?utf-8?B?WHZvWVNkS3ZyWXVhMXJES3pvMWR2ekdpMDAwV0kxUnVGcFZqUGhhNFprdlg2?=
 =?utf-8?B?SHN3YU5wYlVHelhXQzJsenlKMnc2QlUrRENpN0tzL3ZSU1ZmMVo3OVZvOERi?=
 =?utf-8?B?S0JoQmVBY3lyWllEdm9lMnlveTZxR3FOdjdiSUZYakRhSGhGVWUvRUxUVUdx?=
 =?utf-8?B?REcxVWpCaGZxN3dzanhTbUptQ2tFMURkdG5ucU84czBZdHJLRHZrWHNDR1ZN?=
 =?utf-8?B?NURNKzhKNmFiNjdQU0VlQTRmblBJaG5zS3dwRlFEMlpjdUtTRWpFc2lkQmZt?=
 =?utf-8?B?LzkzKzZLdi9DQ3ZGTmFDOTl3RnBRRDYzOXBrZlo1RElpd0VJZ1dQN3NFY242?=
 =?utf-8?B?N2VQMDUxUGVEckFmcWVYQ0wxSkdNZWtMbTAxTDdOT3o0OHlqRUFEbll4aEpG?=
 =?utf-8?B?YjhBUUY3aDgxN0RBVHJHQlExSkNlajRJZEFzNlJOYlVFZm5TaWVEdUZMWTc2?=
 =?utf-8?B?emdsREZiUWk1aFhUL2V5RHNWajk5V0ZZVm1FSzlKaGpaRUpUeXBzUGFPcjVB?=
 =?utf-8?B?YksveHgyUkY1QkQ1alVTN0ZDSjhKV3pUNEp5UW00d0loZ2tSbGlWcjU2SDFJ?=
 =?utf-8?B?VEN3UkVQb1dzUVZnSjkzZWZpZnRxMi82L0E5QTRqVmZBUE5wVlpFODNCVnRl?=
 =?utf-8?B?eE1FZzUvbTZ3QWZ0T09vVGt1a2xqZG9TM0QvWERPUEUzS1YxR1N1dzVVcFc5?=
 =?utf-8?B?TWF6SmpQM3RYOE00VG54aWFTT3V0SVA2ZWtORk9FOXFWV0lZMkdiaE1TNXZI?=
 =?utf-8?B?d2FIbndLKy93cEtkRENGNFd4NzJMa09qTkllVHJnYThqWWVDK2pHWTdhTEw3?=
 =?utf-8?B?UmJIVVVDNjFOeGtvTVR3aHNYenVKbnVvbEtUQU5pZUVYdVFINEdEdXQvdlli?=
 =?utf-8?B?aXJIYzFIb2xSOGV2NWlSdEpjenJQUGk4ejhOcXd0VVFFQmNPSkg1UlkyeTBU?=
 =?utf-8?B?QWRvSUZHNDQrWjRFMGM0SENmNmZweXNNUDM3eFFiNkpuWUJKVk1nZml0SXB2?=
 =?utf-8?B?N0l0czRlYmx1TkROQWp1K0c5aWtrcTFnQmRZeENOKzlLVlBFcmtSc01QSTNk?=
 =?utf-8?B?VlVoRFoydU9DWDM1Q0dPUVVUTmtWNk1zc1VzU2kyWjNzaXdmU3ozelZFVnps?=
 =?utf-8?B?R3VySVU3M2RWRlBwUTJaSUJEdy81cXlkc2w5TlU3UElTdnd3Y0hQTkRpUitF?=
 =?utf-8?B?dGNvVGtLbXAwL3BOVEJ3a1hIbnhURWp4R2o2OW9NTVBMeWVKR3V1ampsaDRM?=
 =?utf-8?B?TERHSTd6b2FyRE9pQ2VrNHNSTFNic0tGanc5VUJvOWI5VUVMaDlTa3hrakcv?=
 =?utf-8?B?L1VrY3JHWTkwbklqbW4yS2ZJQWhJRkRLY2hVQmtSSkJYTEg1eUtXWG15enVP?=
 =?utf-8?B?UFNOdExQM3RJaHlxbk0xSVZOOGJOWDVHVDZBRC9WK2Yvem5Tam1ya1NXNURH?=
 =?utf-8?B?NXhYMjc3VkJQbnBpenUvemxJdVA2QXAzMkRIejVuYkwvRlhSVmRsdWRDbWIx?=
 =?utf-8?B?N3pTcUd0elBxT3JFazdtYkQyeHovQ3ZPUG91dUs1N3h2LzhKNGF6bU40WkhN?=
 =?utf-8?B?VkRYdUtQclNtZ3pnbDZ5dEtJcEJkOWxnK25obTh6dE8rNHI0VFNIKzE3NmpE?=
 =?utf-8?Q?YbUAGZt4bdvvvYvi57IXazY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3da9832-fd74-4d24-553d-08da02a84a32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:11:44.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrJYn6pT9r5h0Kz/gM7MB+lfniXYnU5pmGHI126A5ZkW2hiwmwIOpwm8QXtO2VVolvgcKD6GWjDCnQ6Mm5DU+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3624
X-OriginatorOrg: citrix.com

The contents of this objects is init only, and cannot be patched.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 livepatch-gcc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/livepatch-gcc b/livepatch-gcc
index fe782e0..b0b9ce4 100755
--- a/livepatch-gcc
+++ b/livepatch-gcc
@@ -66,6 +66,8 @@ elif [[ "$TOOLCHAINCMD" =~ $OBJCOPY_RE ]] ; then
         version.o|\
         debug.o|\
         check.o|\
+        boot.o|\
+        *.init.o|\
         .*.o)
             ;;
         *.o)
-- 
2.34.1


