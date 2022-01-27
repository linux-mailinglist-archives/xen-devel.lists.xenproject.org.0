Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32D49DE63
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261390.452534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD1NA-0002iM-4S; Thu, 27 Jan 2022 09:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261390.452534; Thu, 27 Jan 2022 09:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD1NA-0002gJ-1M; Thu, 27 Jan 2022 09:47:20 +0000
Received: by outflank-mailman (input) for mailman id 261390;
 Thu, 27 Jan 2022 09:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wmt=SL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nD1N7-0002gD-V1
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:47:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa05caa-7f56-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 10:47:15 +0100 (CET)
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
X-Inumbo-ID: 1aa05caa-7f56-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643276835;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FAN2fpEKWhngt7SG02/SMOibRgbqOkNj2LeZtzAzwKI=;
  b=SQHI+2+pcBI8ObV4ADScE4xd7xuWKmiBaVHx2Gx2JxSboWh07mNzcm94
   9FSCtMGWVVF8BqqnJDXWYze/bJ6W51LKQhf1JWk5cNN7OIDq5pk8uZi/r
   7xHJg2iHH+PaRJzGOx5/VQLyxfBF1z7JgOwRdbL5u8UzkzK8B/apAPS6w
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4C0kOs2NsJ4Yo/HUFJ9l4hBLys6n8SL7IRW1vRidVBi2q91GAw+Y2qOScr1tBJnKa5C38KoTO3
 HGUUVxpWCfYfqHlfRr3eKR2vbsxVtvXErmgzbAQ5B2cDXijBY2ZaZEcQwEKKAbHIOQfkzjg9fe
 I8v1GartSTFC/16qsNfs6ANVqXHI8H5CTnSWpgsBkZuJY2OT9orQT2GgDF7sqnr5d0Lw0TTPsP
 kwSnNfRyw8qWVOvgML0wEJWdj2amF8siY9B/boTFGytvgQSLJ8QsRq5OXMHorHfYCt6Eml4Nlv
 vx/xx9L0TRrv44pX9mpRsRTu
X-SBRS: 5.2
X-MesageID: 62344281
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:De4IFa+FyuCW6/Hi4HixDrUDyniTJUtcMsCJ2f8bNWPcYEJGY0x3x
 2FOW2GFPK6KYWXwKo9+Pt6woRlXvZSGzII3HVM6rig8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhjk
 PlUnqOyYj1qL7eVxv4ZUkNkOXlHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhmxs2poeRJ4yY
 eI6RWNFSjbwPycWBXcvFrE3zeKCt3nwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkyVv
 H7c9mL1RBQTLsWCyCGt+2ipwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QM8zcqhbg/8gqsVNaVdwajvHeOsxoYWtxRO+438geAzuzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/vXAjhovKyQWGiq3L6epjOvOgAYNWYHIyQDSGMt4cTnoYw1pgLCSJBkCqHdszHuMWium
 XbQ9nF43uhNy55Qv0mmwbzZqyD0ioHicQwe3EbGRDv79Ad4PrKPP7X9vDA38s18BIqeS1CAu
 l0NlM6f8P0CAPmxqcCdfAkeNOr3vqjYaVUwlXYqRsB8rGr1pxZPaKgNuGkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8AZmOyvpngGiausM4bFyhVEfUYXY
 s/zTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDJEu1eaADQM7hkvctoRTk5F
 f4FaaNmLD0ECIXDjtT/q9ZPfTjm01BlbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6xAf5X8CxqVQRxbQfA8yVyOu6HsfZAH6bbiJF6roSPO9YuE
 alcEyhBa9wSIgn6F8M1NMmk89c6JU313Gpj/UONOVACQnKpfCSQkvfMdQrz7igeSC2xsMo1u
 bq70Q3HB5EEQmxf4Az+MZpDFnu94ioQnvxcRUzNLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrsylfA+6tLjqqV01ANhGHmXPV2nBqk5eiuN3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOjKhGlCPT4PI5JFTByBV2pLfXA19POxSsiTBGKOcnOo0S3
 up86tUd7Bayi0R2P4/e3DxU7WmFMlcJT74j6sMBGIbuhwcmlgNCbJjbBnOk6Z2DcYwRYEwjI
 zvSj6venbVMgEHFdiNrR3TK2ONcg7UIuQxLkwBedwjYxIKdi69lxgBV/BQ2Uh9Rn0dO3O9EM
 2R2M1F4ePeV9DByickfB22hFmmt3vFCFpAdH7fRqFDkcg==
IronPort-HdrOrdr: A9a23:uT+cdqODU+yAwsBcTv2jsMiBIKoaSvp037BN7TEUdfU1SL38qy
 nApoV56faZslcssRIb9+xoWpPwJk80nKQdieN9AV7LZniBhILCFvAB0WKN+V3d8gTFh5dgPf
 gKScND4afLYmSSJ/yKmDVQaOxN/OW6
X-IronPort-AV: E=Sophos;i="5.88,320,1635220800"; 
   d="scan'208";a="62344281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvS+eZF4XZU6euIVbVl66D27VHNIcx75VMmKl9H5LoOEt7VUydXQw4MQ++odNlxG4zw6XhgGwVVH7MGiYgzpLdjAjmjcyqSvE7jaClowN31eEM3RhpM/QAjGLK2vCRuu4VLXYucNNYwknrq8JteZczhEje0bvGaaJkdSa/93Rvzh2W/p9HaaATBLJ+41a7vHNASJJ6Bx8twutYNm1iVCPLKGWePreMkZ/o2XJzrC6U993CSPck3pEto4+9eoECDqehvM76C2bmj2s21dMm22+V6wp6tznbijLiFj5CTJqBAWxswNZuPxSuduRWwj0uDsYcsEAc/Larbtf6fx7N2RiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTIUS7Z/qeWhGpV1l/PKLzqKWGc3G8Ldfmgdp2vZopA=;
 b=Ykigqyyqjrc92UHu+8Jv8PnzUEdqonv+P5m6TtffMk6q4tuRFaY2ZewMlfy6Jb350V+fa9HO6RiLotD0n6okRFdExSKzoOnntgTbaP7RBzMiHYXi6zy91qgFmhfovVSPk+/lCh+lokfMKsPM/Bv3dsNgJ+vof0/JlvTvQb3YaS4lpB2XUBKjsd0saw666gAsI7emchyYli+4M0LpVnYlzvNig4tQsQtRr72ymyHx10hJ2MElhQdjw5f1wR8Re2ukytBtwMxN0oOamf4SIqgh/vSblopY/ncyBm5yIlj+ixkR5cqU8yumm6+Crvn3/g9chDKf+DOBzWOpzDXhYeqlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTIUS7Z/qeWhGpV1l/PKLzqKWGc3G8Ldfmgdp2vZopA=;
 b=KPXPyuffWrwBIqA79NqXbONa1xAxIyieFULg8ikjrm7/UpvE5linZntTcAJ5QQnuGYk6cNLhfmsiE2NmbhLIsNU8VwqPiu32xflqLDzLNAHqDUO2hbOkijFA1KfJswYwbEaeRQkOtObmFjkIfL4WxS9QWKJhUHeb5E4c9wQwINM=
Date: Thu, 27 Jan 2022 10:47:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen/pci: detect when BARs are not suitably positioned
Message-ID: <YfJqF8/IIz7k+8G3@Air-de-Roger>
References: <20220127082218.57902-1-roger.pau@citrix.com>
 <4a82bfdf-479d-3813-069a-84d30a6e29fd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a82bfdf-479d-3813-069a-84d30a6e29fd@suse.com>
X-ClientProxiedBy: MR2P264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65f5cc5f-33a1-40a8-fbfe-08d9e179fc24
X-MS-TrafficTypeDiagnostic: CH0PR03MB6003:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6003DED261B04B6D52EAE9C28F219@CH0PR03MB6003.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yFT5q3Q/7G4XKEWhowWvGWTgUmvFOglB5aICDikKqM/EniwRFtjIuHBr/nYgHBEyVW5RoPxRIdnct0TmM8cDWBIGj/aX2/0fgDMyDjrR4Jk8c/sTO0V0o53wPNNKY3gEJuFo2oBsaGL6mpfSOQYZjpTudnzqS9pdSsiuZqC6FmmcY/ZQIUiqZYOCG20kvSlOaxySo2ZxnFo0lJZsYYEutFnMLIGDemW+FdOTURJ8M2vmrVUAbRjvas9elpPwld3EgfnB+VDp7FLl2FetX0MQHmzvXUzy5VR/RegsZGDCjb8tCY6SY2r2JyoC+FepF2CrMpNC+BXPIadaWNA4tm6pk2wqStBaHQbkxYhv+lTDR27OBLZTn6ezSpjNexw4/WsVH8GIo8alnpPHVNLBh4tyU4qKyQiDz/4MS0Dn/CTiVLX4ZnA6ba/9XTg+9hXxaI8DApQ3waHGPKZhLcSMJIaEXBmUxRZi0l+QPnotNXotgQ6IULuFmjb2SbbOFMJoe8CJZkYBZZVviFRlgJqXcB5ASD7qQTL+YHgLHJ6JQ9za+m6V6sodLQCm8ORygjEEi0JgGnElF5APn8HoNNsUAN4iV3tqQJ3b5znVh/lDle/r2Xx4Se4Qe8RtGKqC1gILH48p1YYNh6KRLD6Hcfy1v1zbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(316002)(508600001)(6916009)(54906003)(26005)(85182001)(6486002)(186003)(5660300002)(8936002)(66556008)(66476007)(66946007)(8676002)(53546011)(4326008)(6512007)(6506007)(6666004)(9686003)(38100700002)(33716001)(82960400001)(2906002)(86362001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWVTSEhDdmhMMEp1NVZxcW1vUTFZb2NOdWhoSWZpa1Znd2k2WVl6VWFjeU83?=
 =?utf-8?B?SlNaY05EOUpDaUM3TWt2ZmFSQUhQdjdSQjkvcjhCOFV0SzBnV3htZHpXUjBP?=
 =?utf-8?B?UlExUXNOLzhxSDVQOGQ4Ry9RUFRpZ05ORHZTRlBCMER3U2J5bWZqd1l2bG1U?=
 =?utf-8?B?c251YVUvSU05aGZpVkU5aCtvSGVUd0U2ejBUZlVKU3hzd1NncXIvamo5cjFu?=
 =?utf-8?B?blp2anRwaTBTalVsY1cvVHRoVFNUbzVCa01ja1UxaUM5d2tJUXFabFZlZ25k?=
 =?utf-8?B?TldLaFhlTWRJTkpNa3pCWDRGNndWM1NGRGtYNWludmhPem9NMm5yQy9MM2hG?=
 =?utf-8?B?RVN5ME1uL3JNNFNDbmJOUlVkZ3hwSG5TTFJqaENDeDZMZ2RKcVNDdXQ3RXVU?=
 =?utf-8?B?QTRyQkNQZndUVktFWVZaQjRHWE1WMGNKK0dtR2ROcHVseDNxa0xaVGF6c05W?=
 =?utf-8?B?b2hIeEVJUExYVndxc012M2Zsb2o1OWpWRjB0R1FEbUFldTNnZjRPbkNIRTd3?=
 =?utf-8?B?Ni9oZEJUd3MvUGo2QUo1SlFQNmlKdEFWTjZ3cUEyOHQzeDc3L1RnMlUvYUMz?=
 =?utf-8?B?dyt6MzZHRXdTS0M1bk5DMW51RDBnSnlCK2FUbVRFQWtTcUVtNzZITnQ5WEtJ?=
 =?utf-8?B?a0k5NFJ0VHVVaHdmcUxBalhWWFAxVkFHaGVLemwyYVdJamxtUmdGWVA2SWhL?=
 =?utf-8?B?ZnM5U21MKzRRblM5d1dXeFlndkgwaG1LMDZHeUZPekp3VWNlVlZRbG1jZGJO?=
 =?utf-8?B?SUpSdHI4Um9ZenY1TlZ5dGw5SnB1QWtvUS9uT3hRWTM5SWoyaXFWbmszdHkr?=
 =?utf-8?B?Q25nNUdRN3R6YlhXSWRUU0haS1plM1BFNjdmOThrT05ZcnZ2SERBdXd3dW1y?=
 =?utf-8?B?UGdvem9qZEVVbUVMUHBHNlgyRlA0Z2wzVzJuUTU4ODB6UjZ6QlRmK28wd3lX?=
 =?utf-8?B?RW9rV1lTMm5iYUU5T2dCN1ZkdHlQdDIrTFpjdmdFNGRzOUYrbWlmUzJGTWZl?=
 =?utf-8?B?Q2RMdk45ejV5ZnVRZGloTWM1RzdwVklCbmhlZmFEYjZodzZPOXZqRm9XSGdm?=
 =?utf-8?B?S0t6akp2ZGFhb2MvaHhINCsvcngvVlJITHc5QVlWWGgyek13M1ZnaHdQcnNM?=
 =?utf-8?B?NlhBck1jRTZMUnRORGRiK2FobmxvN09PK2RWdlJlTkxtT2VQMlk3ZkFxTkZ3?=
 =?utf-8?B?bFlnYlBxb3Rrb1RwZHRkZ1Y2eEJ4Ulo4ZzJEMDRYdjBGK0hhL2N0UE5Bc2d2?=
 =?utf-8?B?VVVrU3M1bXdNZGNtdWJEOXRXeFJUblcwNkpwL1pSSE1uVDdWSlU3TEIxeW1I?=
 =?utf-8?B?ZVlSL0MveG8yeVR0NkJQWnVFS1pBZmlrRTZlM2djK2RJblMrSFV4TkZBUFpX?=
 =?utf-8?B?Qzk4UmNpcEM5a2JzR29hVWsvclluQ1ZnSkVrNGpJMG9kUEZxN1Y4Nmo5L3lX?=
 =?utf-8?B?OHk4cVNJVDhrSGovSzdpdHBrS0hSZXBFdzFhb0xJMysyL0dxTTBtREV0MjNv?=
 =?utf-8?B?QWZGakRTVWU3MUhXRXArVDVMM1NCYlFiKzh0NDJobEF5eDVkLzNqY0U4UnAx?=
 =?utf-8?B?Vmw5SUZ6OStXcWx4ejhTMEZzcGE3cXFwUlo5TzgwMTUxUndFR1VwWHFLZlFr?=
 =?utf-8?B?VUNoWXhUNXdPNWJhcTJUM1kxT3dRY1hzRnZsWDRyU0ZZSTdPd0VTKzgrS1Yr?=
 =?utf-8?B?N2pqcG11VVE2bFI3L3FFU0NNbitrRmdVaTVnUWh0OEJySXdGcTIwNSs1MGdY?=
 =?utf-8?B?elJ2VnlVR3FEQXIyWm5OUVVwanVMMjNsTEtieWRoQkFJY0pjK1dlNlVjakN0?=
 =?utf-8?B?TTdEYVpiSjNmZ1ZpWXNRYmpKK0F4SFBuOE1BSjFSK0VWRlJLVTJhaDNLWnRk?=
 =?utf-8?B?K2p6RW4wSmIweVlvNnM4UXhQSStTQ1lGQlRuTGp1Qnkza243dEs1cVVoOGRi?=
 =?utf-8?B?YnpkZDZRQW1oUllDVjNmYUNRMkk0WklmU055cklQdHlIdnZrSUFucExnaUdz?=
 =?utf-8?B?Wk1ZZnNrUm5VUWFtTVMxWks4YXVpakY2VVNlR2xrZEExMlczSnA0Q0RKYkQ2?=
 =?utf-8?B?Wkw2aGJxOTZhTkRVQnlJUkF4WDAreURkY3dwR2t5YWhIZDQ0dGZCcDhma2tS?=
 =?utf-8?B?cVU4bmxQeWNyYW1iUVJYQVVOWUt5a29LdTdCTEFHZ1h2UCtLR2NRYk4rNW5U?=
 =?utf-8?Q?QoUcGuKlAiu0Rs97WHIs2cY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f5cc5f-33a1-40a8-fbfe-08d9e179fc24
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:47:08.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wz3Ob6QDhDdw2CnuOHw1WF++mc4YLNQoCLnfrt+JDZxMfHD0eFDngk6vCPSvoROoJyOqu3+rGj0vv9+RP6SoaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6003
X-OriginatorOrg: citrix.com

On Thu, Jan 27, 2022 at 09:48:16AM +0100, Jan Beulich wrote:
> On 27.01.2022 09:22, Roger Pau Monne wrote:
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -1625,6 +1625,17 @@ bool is_iomem_page(mfn_t mfn)
> >      return !mfn_valid(mfn);
> >  }
> >  
> > +bool is_iomem_range(paddr_t start, uint64_t size)
> > +{
> > +    unsigned int i;
> > +
> > +    for ( i = 0; i < PFN_UP(size); i++ )
> > +        if ( !is_iomem_page(_mfn(PFN_DOWN(start) + i)) )
> > +            return false;
> > +
> > +    return true;
> > +}
> 
> I'm afraid you can't very well call this non-RFC as long as this doesn't
> scale. Or if you're building on this still being dead code on Arm, then
> some kind of "fixme" annotation would be needed here (or the function be
> omitted altogether, for Arm folks to sort out before they actually start
> selecting the HAS_PCI Kconfig setting).

I was expecting the lack of 'RFC' tag to attract the attention of the
maintainers for feedback. If not I'm happy to add a FIXME here or just
drop the chunk.

> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
> >      return (page_get_owner(page) == dom_io);
> >  }
> >  
> > +bool is_iomem_range(paddr_t start, uint64_t size)
> > +{
> > +    unsigned int i;
> > +
> > +    for ( i = 0; i < e820.nr_map; i++ )
> > +    {
> > +        const struct e820entry *entry = &e820.map[i];
> > +
> > +        /* Do not allow overlaps with any memory range. */
> > +        if ( start < entry->addr + entry->size &&
> > +             entry->addr < start + size )
> > +            return false;
> > +    }
> > +
> > +    return true;
> > +}
> 
> I should have realized (and pointed out) earlier that with the type
> check dropped the function name no longer represents what the
> function does. It now really is unsuitable for about anything other
> that the checking of BARs.

is_devmem_range would be more suitable?

I will wrap this in an #ifdef HAS_PCI section now.

> > @@ -267,11 +270,75 @@ static void check_pdev(const struct pci_dev *pdev)
> >          }
> >          break;
> >  
> > +    case PCI_HEADER_TYPE_NORMAL:
> > +        nbars = PCI_HEADER_NORMAL_NR_BARS;
> > +        rom_pos = PCI_ROM_ADDRESS;
> > +        break;
> > +
> >      case PCI_HEADER_TYPE_CARDBUS:
> >          /* TODO */
> >          break;
> >      }
> >  #undef PCI_STATUS_CHECK
> > +
> > +    /* Check if BARs overlap with other memory regions. */
> > +    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> > +    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
> > +        return;
> > +
> > +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
> > +    for ( i = 0; i < nbars; )
> > +    {
> > +        uint64_t addr, size;
> > +        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
> > +        int rc = 1;
> > +
> > +        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
> > +             PCI_BASE_ADDRESS_SPACE_MEMORY )
> > +            goto next;
> > +
> > +        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> > +                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
> > +        if ( rc < 0 )
> > +            /* Unable to size, better leave memory decoding disabled. */
> > +            return;
> > +        if ( size && !is_iomem_range(addr, size) )
> > +        {
> > +            /*
> > +             * Return without enabling memory decoding if BAR position is not
> > +             * in IO suitable memory. Let the hardware domain re-position the
> > +             * BAR.
> > +             */
> > +            printk(XENLOG_WARNING
> > +"%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n",
> 
> I guess despite its length this still wants indenting properly. Maybe
> you could fold this and ...
> 
> > +                   &pdev->sbdf, i, addr, addr + size);
> > +            return;
> > +        }
> > +
> > + next:
> > +        ASSERT(rc > 0);
> > +        i += rc;
> > +    }
> > +
> > +    if ( rom_pos &&
> > +         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
> > +    {
> > +        uint64_t addr, size;
> > +        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
> > +                                  PCI_BAR_ROM);
> > +
> > +        if ( rc < 0 )
> > +            return;
> > +        if ( size && !is_iomem_range(addr, size) )
> > +        {
> > +            printk(XENLOG_WARNING
> > +"%pp disabled: ROM BAR [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n",
> 
> .. this into
> 
>     static const char warn[] =
>         "%pp disabled: %sBAR [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n";
> 
> to limit indentation and redundancy at the same time? Could then also
> be re-used later for the SR-IOV BAR check.

Sure.

Thanks, Roger.

