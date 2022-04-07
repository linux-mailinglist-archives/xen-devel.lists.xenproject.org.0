Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037E94F84E7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 18:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300957.513528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUth-0004q2-M4; Thu, 07 Apr 2022 16:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300957.513528; Thu, 07 Apr 2022 16:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUth-0004ly-IJ; Thu, 07 Apr 2022 16:22:13 +0000
Received: by outflank-mailman (input) for mailman id 300957;
 Thu, 07 Apr 2022 16:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E9KF=UR=citrix.com=prvs=0897b442a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ncUtg-0004kX-M0
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 16:22:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df904ea5-b68e-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 18:22:10 +0200 (CEST)
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
X-Inumbo-ID: df904ea5-b68e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649348530;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZerbvmKhPN7WWYE0dvapRUXhan96DIMbmVpIjFPcEnE=;
  b=YGhZUfn4WNNhCRBESFDZpJH9n48vkKB1wLaLwAmhZ/T5bVL+0GvJSP/V
   frkM7MDXEh5vOnz41C51BvDNpF5hqV8Oyb4xAmYh4qQ+c+UF035JnVxoG
   H5eLO5zJBgkPsYO3lnzma/zridp6hbkChhgj2UXBmmUBSzpeqXj/6H11r
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67704095
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:stJc46z70cT5Yef9Wld6t+e+xirEfRIJ4+MujC+fZmUNrF6WrkUDx
 zMYD2+BOfiLZ2PzeYgibYS28h9UsMCGzodiHlRuryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npluqe9FwI3Hvb3w8NFaBVcCz5bYoxh0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQEoTdkxD7UF+kvRZTrSKTW/95Imjw3g6iiGN6AO
 JVBNWI+MXwsZTVDGUUsBpYYsty3j2vtTj1S9X/EnIAotj27IAtZj+G2bYu9lsaxbftSmkGUt
 2fX5VPTCxsRNMGc4Ted+3fqjejK9QvxVZgODrS++rhviUeK220IIBQMUB2wpvzRolG6c8JSL
 QoT4CVGhao4+VGvT9L9dwalu3PCtRkZM/JTFOsg4Q3L1avQ4C6eHGEPSjMHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv5hX5nie3Wjq/MKQCFdouEOHBQpJ8z+VeqaqXIH27Eb7ts0bC96iQl2Zo
 11buu+3ubVm4Y62qASBR+AEHbeM7vmDMSHBjVMHI6TN5whB6Fb4I9kOvWgWyFNBd59dJGS3O
 BO7VRZ5vsc7AZe8UUNgj2td4ewOxLOoK9nqX+u8gjFmMskoL1/vEM2DiCetM4HRfKoEzPlX1
 XSzK5/E4ZMm5UJPlmfeqwA1i+JD+8zG7TmPLa0XNjz+uVZkWFabSK0eLHyFZf0j4aWPrW39q
 ogDZpHalkgPD7KnO0E7FLL/y3hQcBDX4ris9aRqmhOreFI6SAnN9dePqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6xfaiMRhehEfUdc8n9xoTZHV0VX7xgiRLSdv/vc83KspsFZF6pbML8BKBZ
 6RcEyl2Kq8UEWqvFvV0RcSVkbGOgzz33VneYHf/OGFXklwJb1Whx+IItzDHrUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSJ1dD5aN6cQHuRuRQ==
IronPort-HdrOrdr: A9a23:oshxratEP2yh6abpR0KsVCdq7skCwYMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKdkrNhQYtKOzOW91dATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj3Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSnGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZizU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUgZ1TChkF3nAic0idurD
 D+mWZlAy210QKXQoiBm2qu5+An6kdp15at8y7AvZKpm72HeNtzMbs+uWseSGqD16NohqAN7E
 pGsljpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD30XklWavoJhiKoLzP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8/BreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="67704095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk2AhIxnGzLfmP/oMk+MHUXBI1oX9L7rgTrEkMzwDCZsCTjrndtKIZffqYgLEG12HhliPaJpxrPwSGX6udZeS7beKI2kfT6DzCTOAE7Q42ikks/99c8EmdAily4VIqkGF2edP8QrRDvPVpkh+NWhoyGqD1L5K3o3qFMH27uSqjx/+sIGsO5M+tWcy2uJWMpSwpB9eHhpXtso024uMqavPABzeeMiEL6yQvouHDAMTh8d2CFa9K/XpZyMa+HwMUsDypdc6HxhInEC/OdTyFYjdW9gAAlHzPmKjWLcDFRg0vvmQkKbYiKblaoaaC+r5WItUXSPTWuppaagGsjXE53yuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyXqMY64O1Uug5/+9YckpenDTGpRE0ZidxQ9DU+y+d4=;
 b=hum6crxDi7ftw4e9ieavNtwSRsgYsg1O75eJP4RzhBuKqoV8UOVzu3j5jB6780bCG74EXbV+dCrVKbqhwn1m2jRGN3EmiPLA9W/x1qQwTMkwoFNYxbMp91vEzd7RgowvCDqwYCFq+GIMC3kgzopKQBUTVajMW3I9tOvwyZ68PIx6R6T99KOykk2SPHd62FEOP/PNTVvgy7N0qcZIpk0AOw/qKUyjHwhm1XgsVfHo+sucCNGglsRCU/PMTmt98FcXnfK8RiqizLiyWSvW4krMEZ72UJASBE5cnvIbXlkXALOiWFE2Nl/VELZBsjx4SfJRyLLH0tPkgaqucsBAb25WIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyXqMY64O1Uug5/+9YckpenDTGpRE0ZidxQ9DU+y+d4=;
 b=P9kyWL9DFlEJadB1cVr3DiMzMsPxjARiDUpGoerpS0xMHLSIKoURTQvGQoM3Mq46UnOi8pm99wQvvXe7RZ15nucGXUHsDPAKkJOXoJ+o1qPbE4zojxqUCApcSiWsr+2L8nGeAps07ufi6Db4NCQfugmb7E199h4DjvyPZ72cfVA=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] livepatch: avoid relocations referencing ignored
 section symbols
Thread-Topic: [PATCH 2/2] livepatch: avoid relocations referencing ignored
 section symbols
Thread-Index: AQHYOe9wc0rCrpONwkq7moDToUASPKzkweYm
Date: Thu, 7 Apr 2022 16:22:06 +0000
Message-ID: <PH0PR03MB63826C1CEDC5C336B4DA501CF0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-3-roger.pau@citrix.com>
In-Reply-To: <20220317110854.39050-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48509fc6-e05b-4d66-9c80-08da18b2c1ec
x-ms-traffictypediagnostic: BL0PR03MB4291:EE_
x-microsoft-antispam-prvs: <BL0PR03MB429117ACC91696693D181BC0F0E69@BL0PR03MB4291.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mF8LH03LI3kzDzbGZ9dKQ7+BxH7SOuchFzWHHIGrmTWkfekwzu4memiAFN7kstK5RDvYtTbmp6r5ijGkXELjv5oSyOH6EPHtQgGieBRd9QwX/gncqJcsvJtVRYiyEMj7K5rAQfZBAbjTaqhvlFqCveFGmDpZPCGjnzd6F37TwLKNMRLrM0mns35/7I1paSxv7uEuqaOTFS+RTefdGnJzof6sFI11btoOzO5XbM+3lHDQMTOFrETQzlNpIVsbJJ3Lmupeixhag30ygtW5/DQhif3os9PX8952aKW9J+Tu0hDtThb/pBqbAWSKfxrZlc+inellZc+c1hdrFEAWLVifO9hp/OzQXEJGgaixGvvxXW4e3jPXhYAUl6mZoael8ms3/DiZrlw458A0n/couQLTnl0xr/adrbPpV+a8Ew4XdAc2SGHWcGNcM6gLa0Xl/wzfdOfoPLkJkSXFVNqa5rUy4sfiXI1A8JvMNJ6OyOJNJpwjY7vU60n8NHajy8UphwM8fDAcEUCs0oQIuoP3HNJ3ox4YrK3c34WMcQctK4yopC0jPJELGb6tp9w4lfkH5KJmrOw7xU/X0HtkmMH/hUaJBjUvL9le9baIiowOj3H3YmexqZ9PQ+B9+q/SxxYv//JIuIQpiHhziq2NRX28PpiGLwdRTqeRVw6kMxuSbSbeA7PKYVv5qob30b4gAm9+ZzJ7yxA0Cexeu8NweYuK7of0gA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(6506007)(4744005)(316002)(53546011)(2906002)(110136005)(55016003)(8936002)(52536014)(54906003)(5660300002)(44832011)(9686003)(38070700005)(66476007)(38100700002)(66556008)(26005)(86362001)(4326008)(64756008)(66446008)(82960400001)(76116006)(33656002)(66946007)(508600001)(91956017)(122000001)(8676002)(83380400001)(186003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZC1hdFb0LvZyNivbeZXq8lctQruNRCB4jnSUGYbZL2vVsP+M3489fpnqhs?=
 =?iso-8859-1?Q?8iYq7wRtFyB4ucVzTJQVxCJ2KkGxJ0fBOD3wzs1zDDYIdFSkFSj3nB4lfT?=
 =?iso-8859-1?Q?eafFcwmxWKk1Tv46Hns3Wf/ktStbxdh7D1Yv3BkS/QIOiWTp/d0bUpgQw8?=
 =?iso-8859-1?Q?Nhc1pbokQDitEis28FHY6rl8buElsegwS88p6zXUXIqrF7RLE89Nbptl6Q?=
 =?iso-8859-1?Q?z5UvItRP1m4kCgyQxlUkIuGAB82mcIStVh+dSmi3OMgMPpw1sE75ZHIpYy?=
 =?iso-8859-1?Q?mTOES5Q8y1N9OEwS4sgjI3HfWc8CK3T3dVDgPlr1EbJ2c8+rW6jqvVWSrq?=
 =?iso-8859-1?Q?P7mXBmyUgL80q6YHCEbI/dxB0G/Fv72fkfAPG+zowEQ5koqr9XFS8WTXpp?=
 =?iso-8859-1?Q?hyH4tJ8PvmPvALPVr2BbOYRB4U8jcWnyCdjIQbcolxEsW5qy8Fq1/ukkxa?=
 =?iso-8859-1?Q?PFKVch4Z7Hr7js2v+ajlGzmZ0NCu0lKwiqDd9oOewENHcSHSHbS0hXB9Vl?=
 =?iso-8859-1?Q?D28VBDxlMeEzKjHfB1TmGb19xXst71uc6IZHgRpr/au51XEqC9MIyWEHf3?=
 =?iso-8859-1?Q?v/9G+ZQWcFC9SixDlcIgGi/ZvQVx2KCPi0hq9IUUESthIfaMnnFxRP38QQ?=
 =?iso-8859-1?Q?JdfqUXQcGxNm46OV3Ik52Gp4ueieXaGGS2b8QTZFvbCAGv6f+W9aMZUXj6?=
 =?iso-8859-1?Q?W3F1MPRcO+aHTXfjEzspxb5htNrNmI62GLHe3PeDSePhs4QXX7coDTpkTH?=
 =?iso-8859-1?Q?WuOHsS5kknLBVUTfiKUTFT0OiLFv0TmzgnWGm8UNCd8d2yzU82jfEWEdwD?=
 =?iso-8859-1?Q?ppdK+QG5DciMrU53jMO4RrmN1HZ0+yl7LNIPWSbMqx5YQNSSEaBGzmp5+Y?=
 =?iso-8859-1?Q?14JZkERLWsMKXdLKfyeIEIKlOpTj/nivpfO7MLTB87/fdaPZHw387IyBqs?=
 =?iso-8859-1?Q?bqAXdwBFT07S50rDIGTll/bhHO4N5ujqzBWYxtkp7QQ+oFBCPS9AE723Cg?=
 =?iso-8859-1?Q?Fph8uvjEdLKltypktZXibFAmqu2s/84tfTCtnF0ZfoqsTeuPc56p3wB2ad?=
 =?iso-8859-1?Q?3FU3qfy5bFx5Hs3Nrwb2I3Z+dDcunmfKjiIqP7T4P8digeq8XS8zKgtWik?=
 =?iso-8859-1?Q?lU8UiwP7Q66+dXoV1xKeYIE25lHRDdDWKRkk5h3lWyMEicZY/MWjyfRHvU?=
 =?iso-8859-1?Q?BPvxUhJXkOU+18yJo/1Aay/Uu1gJtAxUC9Ehb2hx5tIW4xygg8pIZrULr6?=
 =?iso-8859-1?Q?vuyoxL0Pa1qNSX693n7Xt4ehRkpo0lu3V4tz4Gf0vDdtrR6W38OQYTMrri?=
 =?iso-8859-1?Q?z3HQCkPhQGhtg+DjuXQ66mjbB43oR/19FTDylmpd0/VJzspjdNr0QbExIV?=
 =?iso-8859-1?Q?wOZm2A5HnrrJ0iJqy8yjVClXJhNH5krFqnvp/O/kh+ybkA3OsSbvP42ZTT?=
 =?iso-8859-1?Q?SgFsS+yUTmSh2TMzPfWyE0BWvvVFt5i5d/ir2ZsAorssAN/6/dNPCvgiK8?=
 =?iso-8859-1?Q?zNCD5J4ZXc/x33LIyhPjmXnIgzqNoPI4BPB0w2SHciv5lzvXii9IrLdRmG?=
 =?iso-8859-1?Q?xMoyDTfMsUaHi3MDgWkOPD6Jrm75hRTKOkWGx+rPL7EOXI4cd4B6YcKQPd?=
 =?iso-8859-1?Q?Do7LBjh0w/uGZyo7764VPEgJYZa48MM/Ua+oix5WDrX1fY9aZeb05jtcNs?=
 =?iso-8859-1?Q?MeLKzpFdKV/+11RDdCBXkgj0H9gF1BbAuSwI27V+kowjC5tb+WnUNBLIrq?=
 =?iso-8859-1?Q?cukuRjZHX/YPFXopvNHP6LD6uMCUY1ZiN0PvmLpFQf7Ykh9zZmHKxB2ODb?=
 =?iso-8859-1?Q?nCDZpMA7hQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48509fc6-e05b-4d66-9c80-08da18b2c1ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 16:22:06.2007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /SbhMXstGYn2IgHHokUzFaY1DSzowgzE1fb4TAIxVphgU5tUZUPsADkuDPpJoRZaxzQHcPOyHvg7VLAU5Dh0uUap7rvjwmEjuOMY5XjCzd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4291
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Thursday, March 17, 2022 11:08 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Konrad Rzeszutek Wilk <konrad=
.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>; Stefano Stab=
ellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Ma=
rquis <bertrand.marquis@arm.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam=
.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper <Andrew.Cooper3@citri=
x.com>; Wei Liu <wl@xen.org>=0A=
> Subject: [PATCH 2/2] livepatch: avoid relocations referencing ignored sec=
tion symbols =0A=
>  =0A=
> Track whether symbols belong to ignored sections in order to avoid=0A=
> applying relocations referencing those symbols. The address of such=0A=
> symbols won't be resolved and thus the relocation will likely fail or=0A=
> write garbage to the destination.=0A=
> =0A=
> Return an error in that case, as leaving unresolved relocations would=0A=
> lead to malfunctioning payload code.=0A=
> =0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

