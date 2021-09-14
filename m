Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C740AF00
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186627.335356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8a8-0000aJ-V7; Tue, 14 Sep 2021 13:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186627.335356; Tue, 14 Sep 2021 13:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8a8-0000XM-Rv; Tue, 14 Sep 2021 13:34:40 +0000
Received: by outflank-mailman (input) for mailman id 186627;
 Tue, 14 Sep 2021 13:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ8a8-0000XG-AX
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:34:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81f80df7-1560-11ec-b430-12813bfff9fa;
 Tue, 14 Sep 2021 13:34:39 +0000 (UTC)
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
X-Inumbo-ID: 81f80df7-1560-11ec-b430-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631626478;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=i4EvmQcjVvidWdZBfCt/WMR/N1cBEj5zAawqggHS+J0=;
  b=Jhb6jAJ5J0lxRyed8BK77EOvn/iF+/i0QqOa0P1DpVz6VAlBy9yMcB8k
   yzaM+S0butvA/enom7G/2sUxicvNjKw3KIW0hnR0eBPuDJhZyiVvA/LJh
   5KkYvOz3lnyPs2OIZ+YhWeS/j6yanM8tB71fp4TarLdHsoE6NfwO+aTHD
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1OfiyB8GONqkJmMwpEGY+dk+vgcH+h4eAV0YqFH4dqJLFwFmQCP6DZ1veTQ0b63r1uHR4K8IbM
 gEE9saq58E3IMhheYd/SND9NKoZxoLDh9/JMTOxbTC/O+Zj3lVDE18xgrVAjLAyYhY+bXMCX+l
 dFreqe/E5GXc1OU/Of+eJCokVGrheh/1uyrywE7qlJvttdC7gvYKZ/IiJo/OtkenI9fYog1eNi
 UM45HDSMS2gU6Tae1fzjvt9VGMUXoKS3z2GL/p+oIcqrzHhwZz0iwFA9oOFISwPrYoVY/QzOnJ
 W1Gpy4EVZq9CboJgBK4wS7j6
X-SBRS: 5.1
X-MesageID: 52668333
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mUsWoa0T+6k6RZTvJfbD5e12kn2cJEfYwER7XKvMYLTBsI5bp2ZWn
 GdNDGyGPayDZDCneYgkbY2xoRsEv8WByt4wSAI5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhhtlBx
 vVU6qaJTyQ3HaHOmugHaiZ5OnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIUGgmdr3Zsm8fD2R
 vFIVyFMfgz8bz5ePxQWKK8lk8z4ryyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1XlEuFo
 mPN/0ziHwoXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWhqU6KngdDYeNWMPMZ5AOPxrDt3CewUz1soiF6VDA2iCMnbWV0j
 QbUzoy2W2UHXK69Ei3Gp+zNxd+mEW1MdzZTO3VcJecQy4S7+OkOYgTzosGP+UJfpub8Hy35i
 xuOpTI371n4pZ9Wj/jnlbwrbjTFm3QocuLXzl6MNo5GxlkgDGJAW2BOwQKFhRqnBNzFJmRtR
 FBex6CjABkmVPlhbhBhpdnh+pnztp5p1xWH2jZS82QJrWzxqxZPg6gJuGwWyLhV3jYsJmayP
 R67VfJ5z55PJnq6BZKbkKroUJ9C8EQULvy8Dqq8RoMXOvBZLVbblAkzNR/49z28yyAEzPBgU
 ap3hO7xVB72/4w8l2HoLwrcuJd2rh0DKZT7HsyilEX7juPFPRZ4i94taTOzUwzw14vdyC39+
 NdDLcqajRJZVez1eC7M9oAPa1sNKBAG6Vre9aS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:lWtUdaw9XVadDQp8yAwdKrPxyeskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZq6z+8O3WBxB8bYYOCCggWVxe5ZnO3fKlHbak/DH41mpN
 hdmspFeaTN5DFB5K6QimnIcKdf/DDuytHVuQ609QYLcegFUdAE0+8vYTzrb3GeCTM2TqYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYpYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwDqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G3Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnp
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvs3+9KK1wXB4S1bpXU9
 WHVKrnlbRrmBKhHjzkV1BUsZ2Rti9ZJGbCfqAA0vblpAS+0koJi3fxaaQk7wU9HakGOul5Dt
 L/Q9BVfYF1P74rhJ1GdZQ8qLOMexTwqDL3QSuvyAfcZek600ykke+D3Fxy3pDsRKA1
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52668333"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFMCRB1kOh7dLOBtL31Nh+L8vojJ/48uwhdSfjfCaCyyu8pQWVE++L/4GC8ojEoNLrAq1I76djgKfFjAGHHOGj8GVS5NXpRKFogif1gZcKjghRoHSa0Jhze+lc9TZm+Qh1fZay9sC02PM59g66sAPJLi/tMleLsMEX8eAfPB9VvMhoBqBLWnbmb/cTe60QbYKdpo6zqf36bFbe/PR7zEpMbO9bxx99y1z3mv4IDe2JFs84hOeIJP/M7vh0rPDNQnu92iRFBc7vDRkMc5yDpeSjRkr6gGBK6pYzNdSAC871bzZE2kMj0h44/fHrQE92sEV1jdzSOETRbZN3cNP407mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EgUxGtlAMtrN3bVygrNwcyHj5WdASjCPNTGzebnP1Rs=;
 b=daDBGq2XJrnx2dkFXFamnQJjPFbH5Tu7X0vN7+Sk2xqUcSqqSdPNClKK+xMDFxh0XywyjtipvND6qPdHsybeQn4xi0HnFrZL1fkmFYE84v5hc3+5NuYVZRmcwRsJx5ZXhJqPZMaE3aa0ahjjor0Qh14rv2kavIkghM8JR2ZmE6RfSZHtmG75EUKMKfjGzjmZfTlkVx+ov84dJPpR9nxVKxAhvr49giDF4S5vXmovIQB/lOhZPF3R21HiH2bosYR1+3V2hLemTwfdLLbnhwiWcOFFvPGyBWAqbGEDqPTpScZx7DXgPPKLlxGtuxp982Smq85d3vGBbnQLO1oCk4K/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgUxGtlAMtrN3bVygrNwcyHj5WdASjCPNTGzebnP1Rs=;
 b=QOvkMEUicwiq1R7kq3i0ilVOws+NuTc2EOpJcYXtDyOxAFsU6EDDK1f89xu2qXfzPp9Rk82q0zrwUUTcUipBtX2iHZlLzJb/49Mi2a+H9cICsGtxCgybjqJKw0FC57mzrg3mR7RuBF3gdPMxOHGY9qgut6ngvm80OUAgBkf2j/E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/p2m: fix xenmem_add_to_physmap_one double page removal
Date: Tue, 14 Sep 2021 15:34:19 +0200
Message-ID: <20210914133419.8407-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da482aef-e323-41a1-7ed5-08d9778460ce
X-MS-TrafficTypeDiagnostic: DM5PR03MB3212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3212F3A985DF13E3B4D9CEC48FDA9@DM5PR03MB3212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04QVqnRBpZAoqMcFMeEnhCgw/jrnJErbISECN3iYJWQEUPKpWgdJQKMce8SV95ibYoptCNJMlg1cdBWPaL/cyrtRzBm7zgk7rxSlVGr7wLdzpoFSh1eWdCfNMOmAOLW5KLFqQr8zuWFfE2/5a0VA90WJfK1qDyrwRC9Vfb9j/n5HgN7oOjGq8YQ9CcBPB+cbqH8R/MYMDURvaxOHVEOlUI61BWF7slaYoFtwUi2T7BWsvSI8rLRrCQb7OmcB2avu02q15fSuSZ8BLJLUCQ5FQd5IPZY/I8ygTd9wibHc2wKpup+nOtMY5+eyttCZIM12fCtEFkdEkve0LpUlHIdkn9Eq+lm4Ft1WYkuYZ63mxjE5tSYvcbjHm74H8Y+cy/hA9zH+7YuGk7w8ckevoN0tOczFUeIjn1CKm2OzX2o6PUN0cC3+TIIsm22o2eB1sQigfhV3pQQNEks09dPWojg/vfeVyfkijZVToXUcQfVac8WDGufsgOvfJIlD5DrZ9NpiMDumr4pWMFYPkGpdKSxjnBNYB+clQ44wIV4KXcWKiwcuM6lLmj8Ar/h0rgZA/vHHOdkvK8bZhVp19nUxjj0r2wrU7ARp3sUM8v+MrOAcg9a/vxWNZssh0NCY3NZFRPONcy8280z+ouC356zr3Gmd+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(26005)(54906003)(5660300002)(86362001)(83380400001)(6486002)(186003)(316002)(6916009)(6666004)(1076003)(38100700002)(66476007)(6496006)(8936002)(2906002)(8676002)(478600001)(4326008)(66946007)(2616005)(956004)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU51a2dZWWhFek00VVhCdmVQTjFyMS8vQThUa1RibEkrTUxTUkI1STNPS1Nj?=
 =?utf-8?B?SGVIWXQvbllVYjdvTGh6dVpIRlF6dlVyNk1JdTVNSlFROGJTNjFtc2hWQ0Rs?=
 =?utf-8?B?RVkxSm01dGw1ZGhVZS8vRlA5OFF3MUlwc2VaWWttTXgvM2o4dzQ3eGNVU1Fp?=
 =?utf-8?B?dXpJZXo2N2hCc25Bdld4eEJDUTdJSmxUOTU5U01oQ1pBWERQelZIZk51ZGNF?=
 =?utf-8?B?UGY4ZXdrS1VnTmVZQkVjR01VcW90WHNSOEZBQy92UmVVSFpmYlF1RWZxc3A0?=
 =?utf-8?B?eUlrZ3N4cWdUY2RmdmFhOThjYndYTmJ4UDdueXdaTDJRVHhZK1kyNTREdkRZ?=
 =?utf-8?B?SXFpbzE2clRsSGl1cHJMMGNMMCtLMmRTWEE1VFkwdXk4dXNnL2dlVjcrS1dS?=
 =?utf-8?B?OVNvczFlWXZKZjgrR2taWkxUWnJRdGsxa3lROXlMdk9TSEQwbUtDRGhBYnFD?=
 =?utf-8?B?a1I0Ym10bk02MDBhYmZob1J2ME5ONCs3WTBLZXBMZjdySXBhS0YwWHJjT253?=
 =?utf-8?B?SGZiSm8vWEs2aDJEbzVXK0o4Rm5TejdseGxTblpYcnRaMWJiM0NQVXowQlIx?=
 =?utf-8?B?K1c0UnhETlh3T1lmOFVSNHBpdERpZnU0WlZYRUdia1lHR3hTUm1qdWRaR3NW?=
 =?utf-8?B?Tm1sdVJ1cTVINHhuS2w0MU02a1l6cXpUZThSNzFJZzVQOHp1dCtLM2FXTnpw?=
 =?utf-8?B?aXZ3alhmdzRqK3ZucVQ2YmZnSE4zcUZrV20ycGRqeXg2eE9DV3V1UEh4TDlx?=
 =?utf-8?B?TTBQaXYxSEVVYkdrTlVvYlp6eHVvbGxFMTU3Wm9ZeUJLaENBSCs3YmplNDRs?=
 =?utf-8?B?MEswS0VmbXIvRm8yS01IUU1jVC9DRFpGVjNTMEtPSFpwWVBheWM3a0ljYmdh?=
 =?utf-8?B?Nm1FQitFR2VBZEMxQkk2cUZHRyt2Y0lKbzJNWFVTRmd2bGJhbFM3dFRNZVhv?=
 =?utf-8?B?c1FMTG1lNUFxcy9lbDBXTXUvajM2S0Y2dnZEK01kdHo4K3gvV2oxK25jZmgr?=
 =?utf-8?B?UW9GWTFpbXBlYTFKTlU3K0IyL1lXUjFmcXo0YjFPWDl5QUJHRWt6UkpuQlFu?=
 =?utf-8?B?U21HNWFnNE1kNUwyQnBOMUxoK2VuQVZzVlRPVkFBTnVRc0tqa0QvM3Nvem1w?=
 =?utf-8?B?Tkl5RDFIR21ZVC84TVNJR2hMRS9LMFFiaVJzWm9Pd2xnaGk3NVBYMUZuM0J5?=
 =?utf-8?B?RkVlSWJRTGp4aWdpcXF0bmcwVDVNV3FLVG9YUmtiVWM2K2Z3RkE3SkdMdHp5?=
 =?utf-8?B?ZG10dm83SEVuSklvVVhtUkdXcWRjeDJjd2xueGZDUll2S0kyMUVxVHpqWk1B?=
 =?utf-8?B?bGtFRUZyQU5oSmF2MDJOUEMwdUh3U2EyZ0J0YVgvbER2V29tTERQMTZNUmdT?=
 =?utf-8?B?SjFVOHNzZ043YnJRdkhDV3Z6NUNSc3k0cU9ONCtjcHcrNjVreTE5TGtaa0VV?=
 =?utf-8?B?UnoxYUxkOFphTGRaV2Y1Nyttbk9SSG5FLzVJZCtQaXcxckZHaWdwbzhPZ3dN?=
 =?utf-8?B?ZFRqUHJwQndnNFN1VWF2SzhsVGh6aDhTZFZUcEtTMGJ0Vm5MYURQb0VvazlI?=
 =?utf-8?B?aHVNanZmcmJBY0Nld2c4MWRCMlFrc29rWEhpd1BETzFUTkFFeXlzUjlsVVph?=
 =?utf-8?B?ekdhb3JjVE1QOVRJNERqbXFtR2VjUjNyQUNFQ3JFWEFYWXZYaDN3TndLMXJx?=
 =?utf-8?B?YWZ1TWxlS2RsaXNhSEJmSCtTL3oxQnNzOVJ4RldYK0Y3L09qbndlN0VpdDI5?=
 =?utf-8?Q?nsPLT/cafVuBjtkC0zqFh3DsO4ffuRjWMTpZIV0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da482aef-e323-41a1-7ed5-08d9778460ce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 13:34:29.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ulpw85xBQ1+04plxbYgb75y/6751vwH5XpYiDyPf8OHesSwkUR/RjW7XVE5Dn8MV/ztiAOz5JuWnOBCN4sVqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3212
X-OriginatorOrg: citrix.com

If the new gfn matches the previous one (ie: gfn == old_gpfn)
xenmem_add_to_physmap_one will issue a duplicated call to
guest_physmap_remove_page with the same gfn, because the
get_gpfn_from_mfn call has been moved by commit f8582da041 to be
performed before the original page is removed. This leads to the
second guest_physmap_remove_page failing, which was not the case
before commit f8582da041.

Fix this by adding a check that prevents a second call to
guest_physmap_remove_page if the previous one has already removed the
backing page from that gfn.

Fixes: f8582da041 ('x86/mm: pull a sanity check earlier in xenmem_add_to_physmap_one()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 674a6f4fe9..2bd4d37286 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2813,7 +2813,7 @@ int xenmem_add_to_physmap_one(
     }
 
     /* Unmap from old location, if any. */
-    if ( !rc && old_gpfn != INVALID_M2P_ENTRY )
+    if ( !rc && old_gpfn != INVALID_M2P_ENTRY && !gfn_eq(_gfn(old_gpfn), gpfn) )
         rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
 
     /* Map at new location. */
-- 
2.33.0


